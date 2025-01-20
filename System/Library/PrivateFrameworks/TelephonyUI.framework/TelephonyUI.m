void sub_1C2F26FDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
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

__CFString *_TPInComingCallUISnapshotOverlayAttachmentIdentifierStringForStyle(uint64_t a1)
{
  v1 = @"TPUI_MobileLabel";
  if (a1 != 2) {
    v1 = 0;
  }
  if (a1 == 3) {
    return @"TPUI_MobileLabelAndBottomBarAndInfoLabel";
  }
  else {
    return v1;
  }
}

void sub_1C2F29A8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C2F29E48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C2F2AEC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getPRUISIncomingCallPosterAttachmentTypeIdentifierNameLabel()
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2020000000;
  v0 = (void **)getPRUISIncomingCallPosterAttachmentTypeIdentifierNameLabelSymbolLoc_ptr;
  uint64_t v7 = getPRUISIncomingCallPosterAttachmentTypeIdentifierNameLabelSymbolLoc_ptr;
  if (!getPRUISIncomingCallPosterAttachmentTypeIdentifierNameLabelSymbolLoc_ptr)
  {
    v1 = (void *)PosterBoardUIServicesLibrary();
    v5[3] = (uint64_t)dlsym(v1, "PRUISIncomingCallPosterAttachmentTypeIdentifierNameLabel");
    getPRUISIncomingCallPosterAttachmentTypeIdentifierNameLabelSymbolLoc_ptr = v5[3];
    v0 = (void **)v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0) {
    getPRUISIncomingCallPosterAttachmentTypeIdentifierNameLabel_cold_1();
  }
  v2 = *v0;
  return v2;
}

void sub_1C2F2B0E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C2F2B6F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C2F2C1E4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 184), 8);
  _Unwind_Resume(a1);
}

Class __getPRPosterLabelClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!PosterKitLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __PosterKitLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_1E647C030;
    uint64_t v5 = 0;
    PosterKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!PosterKitLibraryCore_frameworkLibrary) {
    __getPRPosterLabelClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("PRPosterLabel");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getPRPosterLabelClass_block_invoke_cold_2();
  }
  getPRPosterLabelClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __PosterKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  PosterKitLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getCNImageDerivedColorGeneratorClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!ContactsUILibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __ContactsUILibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_1E647C068;
    uint64_t v5 = 0;
    ContactsUILibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!ContactsUILibraryCore_frameworkLibrary) {
    __getCNImageDerivedColorGeneratorClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("CNImageDerivedColorGenerator");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCNImageDerivedColorGeneratorClass_block_invoke_cold_2();
  }
  getCNImageDerivedColorGeneratorClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __ContactsUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  ContactsUILibraryCore_frameworkLibrary = result;
  return result;
}

void *__getPRPosterSnapshotDefinitionIdentifierIncomingCallPosterContentsOnlySymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)PosterBoardUIServicesLibrary();
  uint64_t result = dlsym(v2, "PRPosterSnapshotDefinitionIdentifierIncomingCallPosterContentsOnly");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getPRPosterSnapshotDefinitionIdentifierIncomingCallPosterContentsOnlySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                                                 + 24);
  return result;
}

uint64_t PosterBoardUIServicesLibrary()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2[0] = 0;
  if (!PosterBoardUIServicesLibraryCore_frameworkLibrary)
  {
    v2[1] = (void *)MEMORY[0x1E4F143A8];
    v2[2] = (void *)3221225472;
    v2[3] = __PosterBoardUIServicesLibraryCore_block_invoke;
    v2[4] = &__block_descriptor_40_e5_v8__0l;
    v2[5] = v2;
    long long v3 = xmmword_1E647C080;
    uint64_t v4 = 0;
    PosterBoardUIServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = PosterBoardUIServicesLibraryCore_frameworkLibrary;
  if (!PosterBoardUIServicesLibraryCore_frameworkLibrary) {
    PosterBoardUIServicesLibrary_cold_1(v2);
  }
  if (v2[0]) {
    free(v2[0]);
  }
  return v0;
}

uint64_t __PosterBoardUIServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  PosterBoardUIServicesLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getPRPosterSnapshotDefinitionIdentifierIncomingCallPosterContentsWithObscurableContentViewSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)PosterBoardUIServicesLibrary();
  uint64_t result = dlsym(v2, "PRPosterSnapshotDefinitionIdentifierIncomingCallPosterContentsWithObscurableContentView");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getPRPosterSnapshotDefinitionIdentifierIncomingCallPosterContentsWithObscurableContentViewSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getPRPosterSnapshotDefinitionIdentifierIncomingCallCompositeSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)PosterBoardUIServicesLibrary();
  uint64_t result = dlsym(v2, "PRPosterSnapshotDefinitionIdentifierIncomingCallComposite");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getPRPosterSnapshotDefinitionIdentifierIncomingCallCompositeSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                                        + 24);
  return result;
}

void *__getPRUISIncomingCallPosterAttachmentTypeIdentifierNameLabelSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)PosterBoardUIServicesLibrary();
  uint64_t result = dlsym(v2, "PRUISIncomingCallPosterAttachmentTypeIdentifierNameLabel");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getPRUISIncomingCallPosterAttachmentTypeIdentifierNameLabelSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                                       + 24);
  return result;
}

Class __getPRUISPosterAppearanceObservingAttachmentProviderClass_block_invoke(uint64_t a1)
{
  PosterBoardUIServicesLibrary();
  Class result = objc_getClass("PRUISPosterAppearanceObservingAttachmentProvider");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getPRUISPosterAppearanceObservingAttachmentProviderClass_block_invoke_cold_1();
  }
  getPRUISPosterAppearanceObservingAttachmentProviderClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                                 + 24);
  return result;
}

Class __getPRUISIncomingCallPosterContextClass_block_invoke(uint64_t a1)
{
  PosterBoardUIServicesLibrary();
  Class result = objc_getClass("PRUISIncomingCallPosterContext");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getPRUISIncomingCallPosterContextClass_block_invoke_cold_1();
  }
  getPRUISIncomingCallPosterContextClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getPRUISIncomingCallSnapshotDefinitionClass_block_invoke(uint64_t a1)
{
  PosterBoardUIServicesLibrary();
  Class result = objc_getClass("PRUISIncomingCallSnapshotDefinition");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getPRUISIncomingCallSnapshotDefinitionClass_block_invoke_cold_1();
  }
  getPRUISIncomingCallSnapshotDefinitionClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getPRUISMutablePosterSnapshotRequestClass_block_invoke(uint64_t a1)
{
  PosterBoardUIServicesLibrary();
  Class result = objc_getClass("PRUISMutablePosterSnapshotRequest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getPRUISMutablePosterSnapshotRequestClass_block_invoke_cold_1();
  }
  getPRUISMutablePosterSnapshotRequestClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getPRUISPosterAttachmentConfigurationClass_block_invoke(uint64_t a1)
{
  PosterBoardUIServicesLibrary();
  Class result = objc_getClass("PRUISPosterAttachmentConfiguration");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getPRUISPosterAttachmentConfigurationClass_block_invoke_cold_1();
  }
  getPRUISPosterAttachmentConfigurationClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getPRUISPosterSnapshotControllerClass_block_invoke(uint64_t a1)
{
  PosterBoardUIServicesLibrary();
  Class result = objc_getClass("PRUISPosterSnapshotController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getPRUISPosterSnapshotControllerClass_block_invoke_cold_1();
  }
  getPRUISPosterSnapshotControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id TPCreateImageWithDrawing(void *a1, double a2, double a3, double a4)
{
  uint64_t v7 = a1;
  if (fabs(a4) < 2.22044605e-16)
  {
    v8 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v8 scale];
    a4 = v9;
  }
  CGContext = TPImageDrawingCreateCGContext(a2, a3, a4);
  size_t Width = CGBitmapContextGetWidth(CGContext);
  size_t Height = CGBitmapContextGetHeight(CGContext);
  if (v7) {
    v7[2](v7, CGContext, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), (double)Width, (double)Height);
  }
  Image = CGBitmapContextCreateImage(CGContext);
  v14 = [MEMORY[0x1E4FB1818] imageWithCGImage:Image scale:0 orientation:a4];
  CGImageRelease(Image);
  CGContextRelease(CGContext);

  return v14;
}

CGContext *TPImageDrawingCreateCGContext(double a1, double a2, double a3)
{
  double v3 = a3;
  if (fabs(a3) < 2.22044605e-16)
  {
    uint64_t v6 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v6 scale];
    double v3 = v7;
  }
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  double v9 = CGBitmapContextCreate(0, vcvtpd_u64_f64(a1 * v3), vcvtpd_u64_f64(a2 * v3), 8uLL, 0, DeviceRGB, 0x2002u);
  CGContextSetInterpolationQuality(v9, kCGInterpolationHigh);
  CGContextSetFillColorSpace(v9, DeviceRGB);
  CGColorSpaceRelease(DeviceRGB);
  return v9;
}

uint64_t _MKBGetDeviceLockState()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = (uint64_t (*)(void))getMKBGetDeviceLockStateSymbolLoc_ptr;
  uint64_t v6 = getMKBGetDeviceLockStateSymbolLoc_ptr;
  if (!getMKBGetDeviceLockStateSymbolLoc_ptr)
  {
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __getMKBGetDeviceLockStateSymbolLoc_block_invoke;
    v2[3] = &unk_1E647C010;
    v2[4] = &v3;
    __getMKBGetDeviceLockStateSymbolLoc_block_invoke((uint64_t)v2);
    uint64_t v0 = (uint64_t (*)(void))v4[3];
  }
  _Block_object_dispose(&v3, 8);
  if (!v0) {
    _MKBGetDeviceLockState_cold_1();
  }
  return v0(0);
}

void sub_1C2F37D40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getMKBGetDeviceLockStateSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!MobileKeyBagLibraryCore_frameworkLibrary)
  {
    v4[1] = (void *)MEMORY[0x1E4F143A8];
    v4[2] = (void *)3221225472;
    v4[3] = __MobileKeyBagLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E647C1F0;
    uint64_t v6 = 0;
    MobileKeyBagLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  v2 = (void *)MobileKeyBagLibraryCore_frameworkLibrary;
  if (!MobileKeyBagLibraryCore_frameworkLibrary) {
    __getMKBGetDeviceLockStateSymbolLoc_block_invoke_cold_1(v4);
  }
  if (v4[0]) {
    free(v4[0]);
  }
  Class result = dlsym(v2, "MKBGetDeviceLockState");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMKBGetDeviceLockStateSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __MobileKeyBagLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  MobileKeyBagLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1C2F39AF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_1C2F39C3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C2F39F08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C2F3A3F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C2F3A63C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C2F3A7D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id TelephonyUIBundle()
{
  uint64_t v0 = (void *)__TelephonyUIBundle;
  if (!__TelephonyUIBundle)
  {
    uint64_t v1 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v2 = (void *)__TelephonyUIBundle;
    __TelephonyUIBundle = v1;

    uint64_t v0 = (void *)__TelephonyUIBundle;
  }
  return v0;
}

uint64_t TPIsUnknown()
{
  if (TPIsUnknown_onceToken != -1) {
    dispatch_once(&TPIsUnknown_onceToken, &__block_literal_global_2);
  }
  return TPIsUnknown_isUnknown;
}

void __TPIsUnknown_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4FB1BA8] mainScreen];
  uint64_t v1 = [v0 currentMode];
  [v1 size];
  int v3 = (int)v2;

  BOOL v6 = 0;
  if (v3 >= 2208)
  {
    uint64_t v4 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v5 = [v4 userInterfaceIdiom];

    if ((v5 & 0xFFFFFFFFFFFFFFFBLL) != 1) {
      BOOL v6 = 1;
    }
  }
  TPIsUnknown_isUnknown = v6;
}

double TPMainScreenScale()
{
  if (TPMainScreenScale_once != -1) {
    dispatch_once(&TPMainScreenScale_once, &__block_literal_global_17);
  }
  return *(double *)&TPMainScreenScale_sMainScreenScale;
}

void __TPMainScreenScale_block_invoke()
{
  id v1 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v1 scale];
  TPMainScreenScale_sMainScreenScale = v0;
}

double TPPixelCGCeiling(double a1)
{
  if (TPMainScreenScale_once != -1) {
    dispatch_once(&TPMainScreenScale_once, &__block_literal_global_17);
  }
  return ceil(*(double *)&TPMainScreenScale_sMainScreenScale * a1) / *(double *)&TPMainScreenScale_sMainScreenScale;
}

double TPPixelCGFloor(double a1)
{
  if (TPMainScreenScale_once != -1) {
    dispatch_once(&TPMainScreenScale_once, &__block_literal_global_17);
  }
  return floor(*(double *)&TPMainScreenScale_sMainScreenScale * a1) / *(double *)&TPMainScreenScale_sMainScreenScale;
}

CGFloat TPRectIntegral(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  v8 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v8 scale];
  if (v9 == 1.0)
  {
    v11.origin.x = a1;
    v11.origin.y = a2;
    v11.size.width = a3;
    v11.size.height = a4;
    *(void *)&a1 = (unint64_t)CGRectIntegral(v11);
  }

  return a1;
}

uint64_t _SoundCompletedPlaying(uint64_t a1, void *a2)
{
  return [a2 _notifySoundCompletionIfNecessary:a1];
}

uint64_t __TPStopSoundForKeyCallback(int a1, void *a2)
{
  return [a2 _stopSoundForKey:a1];
}

void sub_1C2F3F410(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

BOOL TPNumberPadKeyResetLocale()
{
  uint64_t v0 = (void *)MEMORY[0x1E4F70FE8];
  id v1 = [MEMORY[0x1E4F1CA20] currentLocale];
  double v2 = [v1 localeIdentifier];
  int v3 = [v0 numberingSystemForLocaleID:v2];
  useIndicDigits = [v3 isEqualToString:@"latn"] ^ 1;

  return TPNumberPadKeyInitializeMetrics();
}

BOOL TPNumberPadKeyInitializeMetrics()
{
  if (thinFont) {
    CFRelease((CFTypeRef)thinFont);
  }
  if (lightFont) {
    CFRelease((CFTypeRef)lightFont);
  }
  if (regularFont) {
    CFRelease((CFTypeRef)regularFont);
  }
  if (semiBoldFont) {
    CFRelease((CFTypeRef)semiBoldFont);
  }
  if (boldFont) {
    CFRelease((CFTypeRef)boldFont);
  }
  thinFont = CTFontDescriptorCreateWithTextStyle();
  lightFont = CTFontDescriptorCreateWithTextStyle();
  regularFont = CTFontDescriptorCreateWithTextStyle();
  semiBoldFont = CTFontDescriptorCreateWithTextStyle();
  boldFont = CTFontDescriptorCreateWithTextStyle();
  uint64_t v0 = [MEMORY[0x1E4FB1618] whiteColor];
  id v1 = (void *)whiteColor;
  whiteColor = v0;

  uint64_t v2 = [MEMORY[0x1E4FB1618] blackColor];
  int v3 = (void *)blackColor;
  blackColor = v2;

  BOOL result = UIAccessibilityIsBoldTextEnabled();
  isBold = result;
  return result;
}

id TPDefaultLog()
{
  if (TPDefaultLog_onceToken != -1) {
    dispatch_once(&TPDefaultLog_onceToken, &__block_literal_global_5);
  }
  uint64_t v0 = (void *)TPDefaultLog_TPDefaultLog;
  return v0;
}

uint64_t __TPDefaultLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.calls.telephonyui", "Default");
  uint64_t v1 = TPDefaultLog_TPDefaultLog;
  TPDefaultLog_TPDefaultLog = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

void sub_1C2F46B8C(_Unwind_Exception *a1)
{
}

id __imageForRoundedRectProperties(uint64_t a1)
{
  if (!a1)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    v18 = [NSString stringWithUTF8String:"UIImage *__imageForRoundedRectProperties(_TPRoundedRectImageProperties *)"];
    [v17 handleFailureInFunction:v18 file:@"TPRevealingRingView.m" lineNumber:78 description:@"Properties cannot be nil"];
  }
  BOOL v2 = *MEMORY[0x1E4F1DB30] == *(double *)a1 && *(double *)(MEMORY[0x1E4F1DB30] + 8) == *(double *)(a1 + 8);
  if (v2 || !__TPRoundedRectPathIsValid((CGRect *)(a1 + 16)))
  {
    v15 = 0;
  }
  else
  {
    if (__imageForRoundedRectProperties___once != -1) {
      dispatch_once(&__imageForRoundedRectProperties___once, &__block_literal_global_10);
    }
    int v3 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v3 scale];
    BSSizeCeilForScale();
    uint64_t v5 = v4;
    uint64_t v7 = v6;

    v8 = (void *)__imageForRoundedRectProperties___imageCache;
    uint64_t v9 = NSString;
    double v10 = *(double *)a1;
    uint64_t v11 = *(void *)(a1 + 8);
    v12 = [NSString stringWithFormat:@"__path{rect=[{%.2f,%.2f}{%.2f,%.2f}],radius:%.2f}", *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48)];
    v13 = [NSString stringWithFormat:@"__path{rect=[{%.2f,%.2f}{%.2f,%.2f}],radius:%.2f}", *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88)];
    v14 = [v9 stringWithFormat:@"__key{size={%.2f,%.2f},op=%@,ip=%@,circle:%d,drawsOutside:%d}", *(void *)&v10, v11, v12, v13, *(unsigned __int8 *)(a1 + 96), *(unsigned __int8 *)(a1 + 97)];

    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = ____imageForRoundedRectProperties_block_invoke_2;
    v19[3] = &__block_descriptor_56_e18___UIImage_16__0_Q8l;
    v19[4] = v5;
    v19[5] = v7;
    v19[6] = a1;
    v15 = [v8 imageForKey:v14 generatingIfNecessaryWithBlock:v19];
  }
  return v15;
}

void ____imageForRoundedRectProperties_block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F4F8C0]);
  id v3 = +[TPRevealingRingView classIdentifier];
  uint64_t v1 = [v0 initWithUniqueIdentifier:v3];
  BOOL v2 = (void *)__imageForRoundedRectProperties___imageCache;
  __imageForRoundedRectProperties___imageCache = v1;
}

id ____imageForRoundedRectProperties_block_invoke_2(uint64_t a1)
{
  BOOL v2 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v2 scale];
  UIGraphicsBeginImageContextWithOptions(*(CGSize *)(a1 + 32), 0, v3);

  uint64_t v4 = [MEMORY[0x1E4FB1618] whiteColor];
  [v4 setFill];

  uint64_t v5 = *(void *)(a1 + 48);
  if (*(unsigned char *)(v5 + 97))
  {
    v11.origin.x = *(CGFloat *)MEMORY[0x1E4F1DAD8];
    v11.origin.y = *(CGFloat *)(MEMORY[0x1E4F1DAD8] + 8);
    v11.size.width = *(CGFloat *)(a1 + 32);
    v11.size.height = *(CGFloat *)(a1 + 40);
    UIRectFill(v11);
    uint64_t v6 = __bezierPathFromInfo(*(unsigned __int8 *)(*(void *)(a1 + 48) + 96), (double *)(*(void *)(a1 + 48) + 16));
    [v6 fillWithBlendMode:16 alpha:1.0];
  }
  else
  {
    uint64_t v6 = __bezierPathFromInfo(*(unsigned __int8 *)(v5 + 96), (double *)(v5 + 16));
    if (__TPRoundedRectPathIsValid((CGRect *)(*(void *)(a1 + 48) + 56)))
    {
      uint64_t v7 = __bezierPathFromInfo(*(unsigned __int8 *)(*(void *)(a1 + 48) + 96), (double *)(*(void *)(a1 + 48) + 56));
      [v6 appendPath:v7];

      [v6 setUsesEvenOddFillRule:1];
    }
    [v6 fill];
  }

  v8 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return v8;
}

id __bezierPathFromInfo(int a1, double *a2)
{
  if (a1) {
    objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithOvalInRect:", *a2, a2[1], a2[2], a2[3]);
  }
  else {
  BOOL v2 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRoundedRect:cornerRadius:", *a2, a2[1], a2[2], a2[3], a2[4]);
  }
  return v2;
}

BOOL __TPRoundedRectPathIsValid(CGRect *a1)
{
  if (CGRectEqualToRect(*a1, *MEMORY[0x1E4F1DB20])) {
    return 0;
  }
  if (a1->size.height == *(double *)(MEMORY[0x1E4F1DB30] + 8)) {
    return a1->size.width != *MEMORY[0x1E4F1DB30];
  }
  return 1;
}

id getPRIncomingCallTextViewAdapterWrapperClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  id v0 = (void *)getPRIncomingCallTextViewAdapterWrapperClass_softClass;
  uint64_t v7 = getPRIncomingCallTextViewAdapterWrapperClass_softClass;
  if (!getPRIncomingCallTextViewAdapterWrapperClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getPRIncomingCallTextViewAdapterWrapperClass_block_invoke;
    v3[3] = &unk_1E647C010;
    v3[4] = &v4;
    __getPRIncomingCallTextViewAdapterWrapperClass_block_invoke((uint64_t)v3);
    id v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1C2F4A55C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getPRIncomingCallMetricsProviderClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  id v0 = (void *)getPRIncomingCallMetricsProviderClass_softClass;
  uint64_t v7 = getPRIncomingCallMetricsProviderClass_softClass;
  if (!getPRIncomingCallMetricsProviderClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getPRIncomingCallMetricsProviderClass_block_invoke;
    v3[3] = &unk_1E647C010;
    v3[4] = &v4;
    __getPRIncomingCallMetricsProviderClass_block_invoke((uint64_t)v3);
    id v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1C2F4A870(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPRIncomingCallTextViewAdapterWrapperClass_block_invoke(uint64_t a1)
{
  PosterKitLibrary();
  Class result = objc_getClass("PRIncomingCallTextViewAdapterWrapper");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getPRIncomingCallTextViewAdapterWrapperClass_block_invoke_cold_1();
  }
  getPRIncomingCallTextViewAdapterWrapperClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void PosterKitLibrary()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0[0] = 0;
  if (!PosterKitLibraryCore_frameworkLibrary_0)
  {
    v0[1] = (void *)MEMORY[0x1E4F143A8];
    v0[2] = (void *)3221225472;
    v0[3] = __PosterKitLibraryCore_block_invoke_0;
    v0[4] = &__block_descriptor_40_e5_v8__0l;
    v0[5] = v0;
    long long v1 = xmmword_1E647C508;
    uint64_t v2 = 0;
    PosterKitLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (!PosterKitLibraryCore_frameworkLibrary_0) {
    PosterKitLibrary_cold_1(v0);
  }
  if (v0[0]) {
    free(v0[0]);
  }
}

uint64_t __PosterKitLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  PosterKitLibraryCore_frameworkLibrary_0 = result;
  return result;
}

Class __getPRIncomingCallMetricsProviderClass_block_invoke(uint64_t a1)
{
  PosterKitLibrary();
  Class result = objc_getClass("PRIncomingCallMetricsProvider");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getPRIncomingCallMetricsProviderClass_block_invoke_cold_1();
  }
  getPRIncomingCallMetricsProviderClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void _userNotificationHandler(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = objc_msgSend((id)pendingAlerts, "copy", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v9 userNotification] == a1)
        {
          switch(a2)
          {
            case 0:
              [v9 defaultResponse];
              uint64_t v10 = 1;
              break;
            case 1:
              [v9 alternateResponse];
              uint64_t v10 = 2;
              break;
            case 2:
              [v9 otherResponse];
              uint64_t v10 = 3;
              break;
            case 3:
              uint64_t v10 = 4;
              break;
            default:
              uint64_t v10 = 0;
              break;
          }
          [(id)pendingAlerts removeObject:v9];
          CGRect v11 = [v9 completion];

          if (v11)
          {
            v12 = [v9 completion];
            v12[2](v12, v10);
          }
          goto LABEL_18;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_18:
}

uint64_t _SoundCompletedPlaying_0(uint64_t a1, void *a2)
{
  return [a2 soundCompletedPlaying:a1];
}

uint64_t __TPStopSoundForKeyCallback_0(int a1, void *a2)
{
  return [a2 stopSoundForDialerCharacter:a1];
}

id TPStringForNumberPadCharacter(int a1)
{
  if (TPStringForNumberPadCharacter_onceToken[0] != -1) {
    dispatch_once(TPStringForNumberPadCharacter_onceToken, &__block_literal_global_13);
  }
  if (a1 >= (unint64_t)[(id)TPStringForNumberPadCharacter_numberPadStrings count])
  {
    uint64_t v2 = 0;
  }
  else
  {
    uint64_t v2 = [(id)TPStringForNumberPadCharacter_numberPadStrings objectAtIndexedSubscript:a1];
  }
  return v2;
}

void __TPStringForNumberPadCharacter_block_invoke()
{
  id v0 = (void *)TPStringForNumberPadCharacter_numberPadStrings;
  TPStringForNumberPadCharacter_numberPadStrings = (uint64_t)&unk_1F1E899B8;
}

BOOL static RecentsCallItemStyle.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t RecentsCallItemStyle.hash(into:)()
{
  return sub_1C2F6E678();
}

uint64_t RecentsCallItemStyle.hashValue.getter()
{
  return sub_1C2F6E688();
}

BOOL sub_1C2F5086C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_1C2F50880()
{
  return sub_1C2F6E688();
}

uint64_t sub_1C2F508C8()
{
  return sub_1C2F6E678();
}

uint64_t sub_1C2F508F4()
{
  return sub_1C2F6E688();
}

unint64_t sub_1C2F5093C()
{
  unint64_t result = qword_1EA343118;
  if (!qword_1EA343118)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA343118);
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for RecentsCallItemStyle(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
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
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for RecentsCallItemStyle(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *unint64_t result = a2 + 2;
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
        JUMPOUT(0x1C2F50AFCLL);
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
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

uint64_t sub_1C2F50B24(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_1C2F50B30(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for RecentsCallItemStyle()
{
  return &type metadata for RecentsCallItemStyle;
}

uint64_t dispatch thunk of RecentsCallItemProviding.applicationIcon.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of RecentsCallItemProviding.itemStyle.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of RecentsCallItemProviding.title.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of RecentsCallItemProviding.subtitle.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of RecentsCallItemProviding.senderIdentity.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of RecentsCallItemProviding.occurrenceCount.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of RecentsCallItemProviding.titleColor.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of RecentsCallItemProviding.callStatus.getter(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = (*(uint64_t (**)(void))(a2 + 64))();
  return v2 | ((HIDWORD(v2) & 1) << 32);
}

uint64_t dispatch thunk of RecentsCallItemProviding.mediaType.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

uint64_t dispatch thunk of RecentsCallItemProviding.ttyType.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 80))();
}

uint64_t dispatch thunk of RecentsCallItemProviding.verificationStatus.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 88))();
}

uint64_t dispatch thunk of RecentsCallItemProviding.shouldShowDate.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 96))();
}

uint64_t dispatch thunk of RecentsCallItemProviding.date.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 104))();
}

uint64_t dispatch thunk of RecentsCallItemProviding.extraSubtitle.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 112))();
}

uint64_t dispatch thunk of RecentsCallItemProviding.extraSubtitleWithDate.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 120))();
}

uint64_t dispatch thunk of RecentsCallItemProviding.messageIndicatorViewModel.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 128))();
}

uint64_t sub_1C2F50D10()
{
  sub_1C2F50DA4();
  id v0 = sub_1C2F67180();
  uint64_t v1 = sub_1C2F6DF78();

  return v1;
}

unint64_t sub_1C2F50DA4()
{
  unint64_t result = qword_1EA3434F8;
  if (!qword_1EA3434F8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EA3434F8);
  }
  return result;
}

uint64_t dispatch thunk of AvatarViewController.contacts.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_1C2F50DF8()
{
  uint64_t v0 = sub_1C2F6E078();
  __swift_allocate_value_buffer(v0, qword_1EA344228);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EA344228);
  return sub_1C2F6E068();
}

BOOL static TPTipsHelper.Entry.Kind.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t TPTipsHelper.Entry.Kind.hash(into:)()
{
  return sub_1C2F6E678();
}

uint64_t TPTipsHelper.Entry.Kind.hashValue.getter()
{
  return sub_1C2F6E688();
}

void TPTipsHelper.Entry.kind.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t TPTipsHelper.Entry.tip.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1C2F50F14(v1 + 8, a1);
}

uint64_t sub_1C2F50F14(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t TPTipsHelper.Entry.observationTask.getter()
{
  return swift_retain();
}

uint64_t TPTipsHelper.Entry.init(_:tip:observationTask:)@<X0>(unsigned char *a1@<X0>, long long *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  *(unsigned char *)a4 = *a1;
  uint64_t result = sub_1C2F50FC0(a2, a4 + 8);
  *(void *)(a4 + 48) = a3;
  return result;
}

uint64_t sub_1C2F50FC0(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t static TPTipsHelper.shared.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA343150);
  v0[2] = swift_task_alloc();
  uint64_t v1 = sub_1C2F6E578();
  v0[3] = v1;
  v0[4] = *(void *)(v1 - 8);
  v0[5] = swift_task_alloc();
  v0[6] = sub_1C2F6E468();
  v0[7] = sub_1C2F6E458();
  uint64_t v3 = sub_1C2F6E418();
  v0[8] = v3;
  v0[9] = v2;
  return MEMORY[0x1F4188298](sub_1C2F510FC, v3, v2);
}

uint64_t sub_1C2F510FC()
{
  if (qword_1EA3442E0)
  {
    id v1 = (id)qword_1EA3442E0;
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v2 = *(uint64_t (**)(id))(v0 + 8);
    return v2(v1);
  }
  else
  {
    if (qword_1EA344240 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_1C2F6E078();
    __swift_project_value_buffer(v4, (uint64_t)qword_1EA344228);
    uint64_t v5 = sub_1C2F6E058();
    os_log_type_t v6 = sub_1C2F6E518();
    if (os_log_type_enabled(v5, v6))
    {
      BOOL v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)BOOL v7 = 0;
      _os_log_impl(&dword_1C2F24000, v5, v6, "TipKit is initializing", v7, 2u);
      MEMORY[0x1C876E640](v7, -1, -1);
    }

    sub_1C2F6E568();
    uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, char))((char *)&dword_1EA343508 + dword_1EA343508);
    int v8 = (void *)swift_task_alloc();
    *(void *)(v0 + 80) = v8;
    void *v8 = v0;
    v8[1] = sub_1C2F512F0;
    return v9(1000000000000000000, 0, 0, 0, 1);
  }
}

uint64_t sub_1C2F512F0()
{
  uint64_t v3 = (void *)*v1;
  uint64_t v2 = (void *)*v1;
  swift_task_dealloc();
  uint64_t v4 = v2[5];
  uint64_t v5 = v2[4];
  uint64_t v6 = v2[3];
  if (v0)
  {

    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
    uint64_t v7 = v3[8];
    uint64_t v8 = v3[9];
    uint64_t v9 = sub_1C2F58B9C;
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
    uint64_t v7 = v3[8];
    uint64_t v8 = v3[9];
    uint64_t v9 = sub_1C2F51484;
  }
  return MEMORY[0x1F4188298](v9, v7, v8);
}

uint64_t sub_1C2F51484()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_release();
  sub_1C2F6E478();
  uint64_t v2 = sub_1C2F6E4A8();
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(v1, 0, 1, v2);
  uint64_t v3 = sub_1C2F6E458();
  uint64_t v4 = swift_allocObject();
  uint64_t v5 = MEMORY[0x1E4FBCFD8];
  *(void *)(v4 + 16) = v3;
  *(void *)(v4 + 24) = v5;
  sub_1C2F51FE4(v1, (uint64_t)&unk_1EA343518, v4);
  swift_release();
  id v6 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for TPTipsHelper()), sel_init);
  uint64_t v7 = (void *)qword_1EA3442E0;
  qword_1EA3442E0 = (uint64_t)v6;
  id v8 = v6;

  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v9 = *(uint64_t (**)(id))(v0 + 8);
  return v9(v8);
}

uint64_t sub_1C2F515C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  *(void *)(v6 + 56) = v5;
  uint64_t v12 = sub_1C2F6E558();
  *(void *)(v6 + 64) = v12;
  *(void *)(v6 + 72) = *(void *)(v12 - 8);
  *(void *)(v6 + 80) = swift_task_alloc();
  *(void *)(v6 + 88) = swift_task_alloc();
  *(void *)(v6 + 40) = a1;
  *(void *)(v6 + 48) = a2;
  *(void *)(v6 + 16) = a3;
  *(void *)(v6 + 24) = a4;
  *(unsigned char *)(v6 + 32) = a5 & 1;
  return MEMORY[0x1F4188298](sub_1C2F516C4, 0, 0);
}

uint64_t sub_1C2F516C4()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = v0[8];
  uint64_t v3 = v0[9];
  uint64_t v4 = sub_1C2F6E578();
  uint64_t v5 = sub_1C2F58B28(&qword_1EA3430C8, MEMORY[0x1E4FBD1A8]);
  sub_1C2F6E638();
  sub_1C2F58B28(&qword_1EA3430C0, MEMORY[0x1E4FBD178]);
  sub_1C2F6E588();
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v0[12] = v6;
  v0[13] = (v3 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v6(v1, v2);
  uint64_t v7 = (void *)swift_task_alloc();
  v0[14] = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_1C2F51864;
  uint64_t v8 = v0[11];
  return MEMORY[0x1F4188178](v8, v0 + 2, v4, v5);
}

uint64_t sub_1C2F51864()
{
  uint64_t v2 = *(void (**)(uint64_t, uint64_t))(*v1 + 96);
  uint64_t v3 = *(void *)(*v1 + 88);
  uint64_t v4 = *(void *)(*v1 + 64);
  uint64_t v5 = *v1;
  *(void *)(v5 + 120) = v0;
  swift_task_dealloc();
  v2(v3, v4);
  if (v0)
  {
    return MEMORY[0x1F4188298](sub_1C2F51A20, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6();
  }
}

uint64_t sub_1C2F51A20()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1C2F51A8C()
{
  sub_1C2F6E468();
  *(void *)(v0 + 16) = sub_1C2F6E458();
  uint64_t v2 = sub_1C2F6E418();
  return MEMORY[0x1F4188298](sub_1C2F51B20, v2, v1);
}

uint64_t sub_1C2F51B20()
{
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3430F0);
  sub_1C2F6E268();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1C2F73310;
  uint64_t v0 = sub_1C2F6E1E8();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = swift_task_alloc();
  sub_1C2F6E1D8();
  sub_1C2F6E1F8();
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v2, v0);
  swift_task_dealloc();
  uint64_t v3 = sub_1C2F6E218();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = swift_task_alloc();
  sub_1C2F6E208();
  sub_1C2F6E228();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v5, v3);
  swift_task_dealloc();
  uint64_t v6 = sub_1C2F6E248();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = swift_task_alloc();
  sub_1C2F6E238();
  sub_1C2F6E258();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v8, v6);
  swift_task_dealloc();
  sub_1C2F6E358();
  swift_bridgeObjectRelease();
  if (qword_1EA344240 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_1C2F6E078();
  __swift_project_value_buffer(v9, (uint64_t)qword_1EA344228);
  uint64_t v10 = sub_1C2F6E058();
  os_log_type_t v11 = sub_1C2F6E518();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl(&dword_1C2F24000, v10, v11, "TipKit has been initialized", v12, 2u);
    MEMORY[0x1C876E640](v12, -1, -1);
  }

  long long v13 = *(uint64_t (**)(void))(v15 + 8);
  return v13();
}

uint64_t sub_1C2F51F20()
{
  swift_unknownObjectRelease();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1C2F51F58()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_1C2F58B84;
  return sub_1C2F51A8C();
}

uint64_t sub_1C2F51FE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1C2F6E4A8();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_1C2F6E498();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_1C2F589A8(a1, &qword_1EA343150);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1C2F6E418();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_1C2F52190(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1C2F6E4A8();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_1C2F6E498();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_1C2F589A8(a1, &qword_1EA343150);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1C2F6E418();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3435B0);
  return swift_task_create();
}

id TPTipsHelper.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

uint64_t type metadata accessor for TPTipsHelper()
{
  return self;
}

uint64_t sub_1C2F5239C()
{
  uint64_t result = sub_1C2F523BC();
  qword_1EA343880 = result;
  return result;
}

uint64_t sub_1C2F523BC()
{
  uint64_t v0 = sub_1C2F6E4A8();
  MEMORY[0x1F4188790](v0 - 8);
  uint64_t v2 = (char *)&v9 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for TaskQueue();
  sub_1C2F6E488();
  uint64_t v3 = TaskQueue.__allocating_init(priority:)((uint64_t)v2);
  if (qword_1EA344240 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_1C2F6E078();
  __swift_project_value_buffer(v4, (uint64_t)qword_1EA344228);
  uint64_t v5 = sub_1C2F6E058();
  os_log_type_t v6 = sub_1C2F6E518();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_1C2F24000, v5, v6, "Starting TipKitHelper taskQueue with delayed start.", v7, 2u);
    MEMORY[0x1C876E640](v7, -1, -1);
  }

  (*(void (**)(void *, void))(*(void *)v3 + 128))(&unk_1EA3435D0, 0);
  swift_release();
  return v3;
}

uint64_t sub_1C2F52544()
{
  uint64_t v1 = sub_1C2F6E578();
  v0[2] = v1;
  v0[3] = *(void *)(v1 - 8);
  v0[4] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1C2F52600, 0, 0);
}

uint64_t sub_1C2F52600()
{
  sub_1C2F6E568();
  uint64_t v3 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, char))((char *)&dword_1EA343508 + dword_1EA343508);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 40) = v1;
  void *v1 = v0;
  v1[1] = sub_1C2F526C8;
  return v3(1000000000000000000, 0, 0, 0, 1);
}

uint64_t sub_1C2F526C8()
{
  uint64_t v2 = (void *)*v1;
  uint64_t v3 = (void *)*v1;
  swift_task_dealloc();
  uint64_t v4 = v2[4];
  uint64_t v5 = v2[3];
  uint64_t v6 = v2[2];
  if (v0)
  {

    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
    return MEMORY[0x1F4188298](sub_1C2F52890, 0, 0);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
    swift_task_dealloc();
    uint64_t v7 = (uint64_t (*)(void))v3[1];
    return v7();
  }
}

uint64_t sub_1C2F52890()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t *sub_1C2F528F0()
{
  if (qword_1EA343888 != -1) {
    swift_once();
  }
  return &qword_1EA343880;
}

uint64_t static TPTipsHelper.taskQueue.getter()
{
  if (qword_1EA343888 != -1) {
    swift_once();
  }
  return swift_retain();
}

uint64_t sub_1C2F52998()
{
  return 0;
}

void *sub_1C2F529EC()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR___TPTipsHelper_Swift_popoverController);
  swift_beginAccess();
  uint64_t v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_1C2F52A9C(void *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR___TPTipsHelper_Swift_popoverController);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *id v3 = a1;
}

uint64_t sub_1C2F52AF0@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0x68))();
  *a2 = result;
  return result;
}

uint64_t sub_1C2F52B4C(id *a1, void **a2)
{
  id v2 = *a1;
  id v3 = *(uint64_t (**)(id))((*MEMORY[0x1E4FBC8C8] & **a2) + 0x70);
  id v4 = *a1;
  return v3(v2);
}

uint64_t (*sub_1C2F52BB4())()
{
  return j_j__swift_endAccess;
}

unint64_t sub_1C2F52C10()
{
  return sub_1C2F57360(MEMORY[0x1E4FBC860]);
}

uint64_t sub_1C2F52C1C@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0x80))();
  *a2 = result;
  return result;
}

uint64_t sub_1C2F52C78(uint64_t a1, void **a2)
{
  id v2 = *(uint64_t (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & **a2) + 0x88);
  uint64_t v3 = sub_1C2F6E0F8();
  return v2(v3);
}

uint64_t sub_1C2F52CDC()
{
  return sub_1C2F52E28();
}

uint64_t sub_1C2F52CE8(uint64_t a1)
{
  return sub_1C2F52E7C(a1, &OBJC_IVAR___TPTipsHelper_Swift_entries);
}

uint64_t (*sub_1C2F52CF4())()
{
  return j_j__swift_endAccess;
}

unint64_t sub_1C2F52D50()
{
  return sub_1C2F57464(MEMORY[0x1E4FBC860]);
}

uint64_t sub_1C2F52D5C@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0x98))();
  *a2 = result;
  return result;
}

uint64_t sub_1C2F52DB8(uint64_t a1, void **a2)
{
  id v2 = *(uint64_t (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & **a2) + 0xA0);
  uint64_t v3 = sub_1C2F6E0F8();
  return v2(v3);
}

uint64_t sub_1C2F52E1C()
{
  return sub_1C2F52E28();
}

uint64_t sub_1C2F52E28()
{
  return sub_1C2F6E0F8();
}

uint64_t sub_1C2F52E70(uint64_t a1)
{
  return sub_1C2F52E7C(a1, &OBJC_IVAR___TPTipsHelper_Swift_currentTip);
}

uint64_t sub_1C2F52E7C(uint64_t a1, void *a2)
{
  id v4 = (void *)(v2 + *a2);
  swift_beginAccess();
  *id v4 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1C2F52ECC())()
{
  return j__swift_endAccess;
}

uint64_t sub_1C2F52F30(unsigned __int8 *a1)
{
  uint64_t v2 = v1;
  unsigned __int8 v4 = *a1;
  uint64_t v5 = (void *)MEMORY[0x1E4FBC8C8];
  uint64_t v6 = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v1) + 0x80))();
  if (*(void *)(v6 + 16) && (unint64_t v7 = sub_1C2F560D4(v4), (v8 & 1) != 0))
  {
    uint64_t v9 = *(void **)(*(void *)(v6 + 56) + 8 * v7);
    sub_1C2F6E0F8();
    swift_bridgeObjectRelease();
    if (!v9) {
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v10 = (void (*)(_OWORD *, void))(*(uint64_t (**)(_OWORD *))((*v5 & *v2) + 0x90))(v21);
    uint64_t v12 = v11;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v23 = *v12;
    uint64_t *v12 = 0x8000000000000000;
    uint64_t v9 = (void *)MEMORY[0x1E4FBC860];
    sub_1C2F56B20(MEMORY[0x1E4FBC860], v4, isUniquelyReferenced_nonNull_native);
    uint64_t *v12 = v23;
    swift_bridgeObjectRelease();
    v10(v21, 0);
  }
  sub_1C2F57560((uint64_t)a1, (uint64_t)v21);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v9 = sub_1C2F55FA8(0, v9[2] + 1, 1, v9);
  }
  unint64_t v15 = v9[2];
  unint64_t v14 = v9[3];
  if (v15 >= v14 >> 1) {
    uint64_t v9 = sub_1C2F55FA8((void *)(v14 > 1), v15 + 1, 1, v9);
  }
  v9[2] = v15 + 1;
  uint64_t v16 = &v9[7 * v15];
  long long v17 = v21[0];
  long long v18 = v21[1];
  long long v19 = v21[2];
  v16[10] = v22;
  *((_OWORD *)v16 + 3) = v18;
  *((_OWORD *)v16 + 4) = v19;
  *((_OWORD *)v16 + 2) = v17;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C2F53118(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  if (*(void *)(a1 + 24))
  {
    sub_1C2F50FC0((long long *)a1, (uint64_t)v14);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v12 = *v2;
    uint64_t *v2 = 0x8000000000000000;
    sub_1C2F56C58(v14, a2, isUniquelyReferenced_nonNull_native);
    uint64_t *v2 = v12;
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_1C2F589A8(a1, &qword_1EA343078);
    unint64_t v7 = sub_1C2F560D4(a2);
    if (v8)
    {
      unint64_t v9 = v7;
      char v10 = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v11 = *v2;
      uint64_t v13 = *v3;
      *uint64_t v3 = 0x8000000000000000;
      if ((v10 & 1) == 0)
      {
        sub_1C2F56FA8();
        uint64_t v11 = v13;
      }
      sub_1C2F50FC0((long long *)(*(void *)(v11 + 56) + 40 * v9), (uint64_t)v14);
      sub_1C2F56950(v9, v11);
      *uint64_t v3 = v11;
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v15 = 0;
      memset(v14, 0, sizeof(v14));
    }
    return sub_1C2F589A8((uint64_t)v14, &qword_1EA343078);
  }
}

uint64_t sub_1C2F53234(char *a1)
{
  uint64_t v2 = v1;
  char v3 = *a1;
  unsigned __int8 v4 = (void *)MEMORY[0x1E4FBC8C8];
  uint64_t v5 = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v1) + 0x80))();
  if (*(void *)(v5 + 16) && (unint64_t v6 = sub_1C2F560D4(v3), (v7 & 1) != 0))
  {
    uint64_t v8 = *(void *)(*(void *)(v5 + 56) + 8 * v6);
    sub_1C2F6E0F8();
    swift_bridgeObjectRelease();
    uint64_t v9 = *(void *)(v8 + 16);
    if (v9)
    {
      uint64_t v10 = v8 + 32;
      do
      {
        sub_1C2F57560(v10, (uint64_t)v21);
        swift_retain();
        sub_1C2F57570((uint64_t)v21);
        sub_1C2F6E508();
        swift_release();
        v10 += 56;
        --v9;
      }
      while (v9);
    }
    swift_bridgeObjectRelease();
    uint64_t v11 = (void (*)(_OWORD *, void))(*(uint64_t (**)(_OWORD *))((*v4 & *v2) + 0x90))(v21);
    uint64_t v13 = v12;
    unint64_t v14 = sub_1C2F560D4(v3);
    if (v15)
    {
      unint64_t v16 = v14;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v20[0] = *v13;
      uint64_t *v13 = 0x8000000000000000;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
        sub_1C2F56E04();
      }
      sub_1C2F56794(v16, v20[0]);
      uint64_t *v13 = v20[0];
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    v11(v21, 0);
    uint64_t v22 = 0;
    memset(v21, 0, sizeof(v21));
    long long v18 = (uint64_t (*)(uint64_t *, void))(*(uint64_t (**)(uint64_t *))((*v4 & *v2) + 0xA8))(v20);
    sub_1C2F53118((uint64_t)v21, v3);
    return v18(v20, 0);
  }
  else
  {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_1C2F534C4()
{
  return sub_1C2F538F4(sub_1C2F5B114);
}

uint64_t sub_1C2F534F4()
{
  return sub_1C2F538F4(sub_1C2F5B178);
}

uint64_t sub_1C2F53524()
{
  RecentsSaveAsContactTip.init()();
  uint64_t v0 = sub_1C2F6E1C8();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  char v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E4F42298], v0);
  sub_1C2F578A4();
  sub_1C2F6E088();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  uint64_t v4 = sub_1C2F5A2F8();
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3430B0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v4, v5);
  sub_1C2F6E2C8();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_1C2F538AC()
{
  return sub_1C2F538F4(sub_1C2F5A994);
}

uint64_t sub_1C2F538DC()
{
  return sub_1C2F538F4(sub_1C2F5A294);
}

uint64_t sub_1C2F538F4(uint64_t (*a1)(void))
{
  uint64_t v1 = a1();
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3430B0);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v1, v2);
  sub_1C2F6E2C8();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_1C2F53A00(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v3 = a3();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3430B0);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v3, v4);
  sub_1C2F6E2C8();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_1C2F53AF4()
{
  return sub_1C2F53EF8((uint64_t)&unk_1F1E80400, (uint64_t)&unk_1EA343548, (void (*)(char *, uint64_t, uint64_t))sub_1C2F52190);
}

uint64_t sub_1C2F53B28(uint64_t a1)
{
  v1[2] = a1;
  sub_1C2F6E468();
  v1[3] = sub_1C2F6E458();
  uint64_t v3 = sub_1C2F6E418();
  v1[4] = v3;
  v1[5] = v2;
  return MEMORY[0x1F4188298](sub_1C2F53BC0, v3, v2);
}

uint64_t sub_1C2F53BC0()
{
  sub_1C2F6E048();
  uint64_t v1 = sub_1C2F6E3D8();
  uint64_t v3 = v2;
  v0[6] = v2;
  uint64_t v4 = sub_1C2F6E3D8();
  uint64_t v6 = v5;
  v0[7] = v5;
  uint64_t v7 = (void *)swift_task_alloc();
  v0[8] = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_1C2F53CB8;
  return MEMORY[0x1F4164140](v1, v3, v4, v6, 0);
}

uint64_t sub_1C2F53CB8()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 72) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v0)
  {

    uint64_t v3 = *(void *)(v2 + 32);
    uint64_t v4 = *(void *)(v2 + 40);
    uint64_t v5 = sub_1C2F58BA4;
  }
  else
  {
    uint64_t v3 = *(void *)(v2 + 32);
    uint64_t v4 = *(void *)(v2 + 40);
    uint64_t v5 = sub_1C2F53E20;
  }
  return MEMORY[0x1F4188298](v5, v3, v4);
}

uint64_t sub_1C2F53E20()
{
  uint64_t v1 = v0[9];
  uint64_t v2 = (BOOL *)v0[2];
  swift_release();
  BOOL *v2 = v1 != 0;
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_1C2F53EC4()
{
  return sub_1C2F53EF8((uint64_t)&unk_1F1E80428, (uint64_t)&unk_1EA343558, (void (*)(char *, uint64_t, uint64_t))sub_1C2F51FE4);
}

uint64_t sub_1C2F53EF8(uint64_t a1, uint64_t a2, void (*a3)(char *, uint64_t, uint64_t))
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA343150);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1C2F6E4A8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  sub_1C2F6E468();
  uint64_t v9 = sub_1C2F6E458();
  uint64_t v10 = swift_allocObject();
  uint64_t v11 = MEMORY[0x1E4FBCFD8];
  *(void *)(v10 + 16) = v9;
  *(void *)(v10 + 24) = v11;
  a3(v7, a2, v10);
  return swift_release();
}

uint64_t sub_1C2F54004()
{
  sub_1C2F6E468();
  v0[2] = sub_1C2F6E458();
  uint64_t v2 = sub_1C2F6E418();
  v0[3] = v2;
  v0[4] = v1;
  return MEMORY[0x1F4188298](sub_1C2F54098, v2, v1);
}

uint64_t sub_1C2F54098()
{
  id v1 = objc_msgSend(self, sel_mainBundle);
  id v2 = objc_msgSend(v1, sel_bundleIdentifier);

  uint64_t v3 = sub_1C2F6E3D8();
  uint64_t v5 = v4;
  if (v2) {

  }
  v0[5] = v5;
  sub_1C2F6E048();
  uint64_t v6 = sub_1C2F6E3D8();
  uint64_t v8 = v7;
  v0[6] = v7;
  uint64_t v9 = (void *)swift_task_alloc();
  v0[7] = v9;
  *uint64_t v9 = v0;
  v9[1] = sub_1C2F541F0;
  return MEMORY[0x1F4164140](v6, v8, v3, v5, 0);
}

uint64_t sub_1C2F541F0()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v3 = *(void *)(v2 + 24);
    uint64_t v4 = *(void *)(v2 + 32);
    uint64_t v5 = sub_1C2F58BA8;
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v3 = *(void *)(v2 + 24);
    uint64_t v4 = *(void *)(v2 + 32);
    uint64_t v5 = sub_1C2F54360;
  }
  return MEMORY[0x1F4188298](v5, v3, v4);
}

uint64_t sub_1C2F54360()
{
  swift_release();
  id v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1C2F543F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(char *, uint64_t, uint64_t))
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA343150);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1C2F6E4A8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);
  sub_1C2F6E468();
  uint64_t v11 = sub_1C2F6E458();
  uint64_t v12 = swift_allocObject();
  uint64_t v13 = MEMORY[0x1E4FBCFD8];
  *(void *)(v12 + 16) = v11;
  *(void *)(v12 + 24) = v13;
  a5(v9, a4, v12);
  return swift_release();
}

uint64_t sub_1C2F54500()
{
  sub_1C2F5EA60(0);
  uint64_t v0 = sub_1C2F5E1DC();
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3430B0);
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x1F4188790](v1);
  uint64_t v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v0, v1);
  sub_1C2F6E2C8();
  return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
}

uint64_t sub_1C2F546FC()
{
  return sub_1C2F5E548(1);
}

id TPTipsHelper.init()()
{
  *(void *)&v0[OBJC_IVAR___TPTipsHelper_Swift_popoverController] = 0;
  uint64_t v1 = OBJC_IVAR___TPTipsHelper_Swift_entries;
  uint64_t v2 = MEMORY[0x1E4FBC860];
  *(void *)&v0[v1] = sub_1C2F57360(MEMORY[0x1E4FBC860]);
  uint64_t v3 = OBJC_IVAR___TPTipsHelper_Swift_currentTip;
  *(void *)&v0[v3] = sub_1C2F57464(v2);
  v5.receiver = v0;
  v5.super_class = (Class)type metadata accessor for TPTipsHelper();
  return objc_msgSendSuper2(&v5, sel_init);
}

id TPTipsHelper.__deallocating_deinit()
{
  return sub_1C2F55D50(type metadata accessor for TPTipsHelper);
}

double sub_1C2F54884()
{
  return 16.0;
}

double sub_1C2F54898()
{
  return *MEMORY[0x1E4FB2848];
}

double sub_1C2F548AC()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC11TelephonyUI15TPTipHeaderView_separatorEdgeInset;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t sub_1C2F548F8(double a1, double a2, double a3, double a4)
{
  uint64_t v9 = (double *)((char *)v4 + OBJC_IVAR____TtC11TelephonyUI15TPTipHeaderView_separatorEdgeInset);
  uint64_t v10 = swift_beginAccess();
  *uint64_t v9 = a1;
  v9[1] = a2;
  v9[2] = a3;
  v9[3] = a4;
  return (*(uint64_t (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & *v4) + 0xC0))(v10);
}

uint64_t (*sub_1C2F54998(uint64_t a1))()
{
  *(void *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_1C2F549F8;
}

uint64_t sub_1C2F549FC()
{
  return 0;
}

uint64_t TPTipHeaderView.displaysBottomSeparator.getter()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC11TelephonyUI15TPTipHeaderView_displaysBottomSeparator);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_1C2F54A4C@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = (unsigned char *)(*a1 + OBJC_IVAR____TtC11TelephonyUI15TPTipHeaderView_displaysBottomSeparator);
  uint64_t result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_1C2F54AA0(char *a1, void **a2)
{
  char v2 = *a1;
  uint64_t v3 = *a2;
  uint64_t v4 = (char *)*a2 + OBJC_IVAR____TtC11TelephonyUI15TPTipHeaderView_displaysBottomSeparator;
  uint64_t v5 = swift_beginAccess();
  *uint64_t v4 = v2;
  return (*(uint64_t (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & *v3) + 0xC0))(v5);
}

uint64_t TPTipHeaderView.displaysBottomSeparator.setter(char a1)
{
  uint64_t v3 = (char *)v1 + OBJC_IVAR____TtC11TelephonyUI15TPTipHeaderView_displaysBottomSeparator;
  uint64_t v4 = swift_beginAccess();
  *uint64_t v3 = a1;
  return (*(uint64_t (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & *v1) + 0xC0))(v4);
}

uint64_t (*TPTipHeaderView.displaysBottomSeparator.modify(uint64_t a1))()
{
  *(void *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_1C2F549F8;
}

uint64_t sub_1C2F54C14(uint64_t a1, char a2)
{
  uint64_t result = swift_endAccess();
  if ((a2 & 1) == 0) {
    return (*(uint64_t (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & **(void **)(a1 + 24)) + 0xC0))(result);
  }
  return result;
}

uint64_t sub_1C2F54C78@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0xA0))();
  *a2 = result;
  return result;
}

uint64_t sub_1C2F54CD4(id *a1, void **a2)
{
  id v2 = *a1;
  uint64_t v3 = *(uint64_t (**)(id))((*MEMORY[0x1E4FBC8C8] & **a2) + 0xA8);
  id v4 = *a1;
  return v3(v2);
}

void *sub_1C2F54D3C()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC11TelephonyUI15TPTipHeaderView_hostingView);
  swift_beginAccess();
  id v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_1C2F54D8C(void *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR____TtC11TelephonyUI15TPTipHeaderView_hostingView);
  swift_beginAccess();
  id v4 = *v3;
  *id v3 = a1;
  id v5 = a1;

  sub_1C2F55948();
}

void *(*sub_1C2F54DF8(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_1C2F54E58;
}

void *sub_1C2F54E58(uint64_t a1, char a2)
{
  uint64_t result = (void *)swift_endAccess();
  if ((a2 & 1) == 0) {
    return sub_1C2F55948();
  }
  return result;
}

double static TPTipHeaderView.verticalInsetTotal.getter()
{
  return 32.0;
}

void *TPTipHeaderView.__allocating_init(frame:separatorInset:)(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  id v17 = objc_allocWithZone(v8);
  return TPTipHeaderView.init(frame:separatorInset:)(a1, a2, a3, a4, a5, a6, a7, a8);
}

void *TPTipHeaderView.init(frame:separatorInset:)(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  id v17 = &v8[OBJC_IVAR____TtC11TelephonyUI15TPTipHeaderView_separatorEdgeInset];
  uint64_t v18 = MEMORY[0x1E4FB2848];
  _OWORD *v17 = *MEMORY[0x1E4FB2848];
  v17[1] = *(_OWORD *)(v18 + 16);
  *(void *)&v8[OBJC_IVAR____TtC11TelephonyUI15TPTipHeaderView_bottomSeparatorView] = 0;
  v8[OBJC_IVAR____TtC11TelephonyUI15TPTipHeaderView_displaysBottomSeparator] = 0;
  *(void *)&v8[OBJC_IVAR____TtC11TelephonyUI15TPTipHeaderView_hostingView] = 0;
  v28.receiver = v8;
  v28.super_class = (Class)type metadata accessor for TPTipHeaderView();
  long long v19 = objc_msgSendSuper2(&v28, sel_initWithFrame_, a1, a2, a3, a4);
  objc_msgSend(v19, sel_setLayoutMargins_, 16.0, 16.0, 16.0, 16.0);
  v20 = (double *)((char *)v19 + OBJC_IVAR____TtC11TelephonyUI15TPTipHeaderView_separatorEdgeInset);
  swift_beginAccess();
  double *v20 = a5;
  v20[1] = a6;
  v20[2] = a7;
  v20[3] = a8;
  v21 = (void **)((char *)v19 + OBJC_IVAR____TtC11TelephonyUI15TPTipHeaderView_hostingView);
  swift_beginAccess();
  uint64_t v22 = *v21;
  if (*v21)
  {
    uint64_t v23 = self;
    id v24 = v22;
    id v25 = objc_msgSend(v23, sel_tertiarySystemFillColor);
    objc_msgSend(v24, sel_setBackgroundColor_, v25);
  }
  v26 = sub_1C2F55948();
  (*(void (**)(void *))((*MEMORY[0x1E4FBC8C8] & *v19) + 0xC8))(v26);

  return v19;
}

id sub_1C2F550FC(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

void sub_1C2F55140()
{
  uint64_t v1 = &v0[OBJC_IVAR____TtC11TelephonyUI15TPTipHeaderView_separatorEdgeInset];
  uint64_t v2 = MEMORY[0x1E4FB2848];
  _OWORD *v1 = *MEMORY[0x1E4FB2848];
  v1[1] = *(_OWORD *)(v2 + 16);
  *(void *)&v0[OBJC_IVAR____TtC11TelephonyUI15TPTipHeaderView_bottomSeparatorView] = 0;
  v0[OBJC_IVAR____TtC11TelephonyUI15TPTipHeaderView_displaysBottomSeparator] = 0;
  *(void *)&v0[OBJC_IVAR____TtC11TelephonyUI15TPTipHeaderView_hostingView] = 0;

  sub_1C2F6E598();
  __break(1u);
}

void sub_1C2F5529C()
{
  uint64_t v1 = v0;
  uint64_t v2 = OBJC_IVAR____TtC11TelephonyUI15TPTipHeaderView_bottomSeparatorView;
  id v3 = *(void **)((char *)v0 + OBJC_IVAR____TtC11TelephonyUI15TPTipHeaderView_bottomSeparatorView);
  if (v3)
  {
    objc_msgSend(v3, sel_removeFromSuperview);
    id v4 = *(void **)((char *)v0 + v2);
    *(void *)((char *)v0 + v2) = 0;

    id v5 = *(void **)((char *)v0 + v2);
    if (v5)
    {
LABEL_8:
      id v14 = v5;
      objc_msgSend(v1, sel_addSubview_, v14);
      id v15 = objc_msgSend(self, sel_mainScreen);
      objc_msgSend(v15, sel_scale);
      double v17 = v16;

      __swift_instantiateConcreteTypeFromMangledName(&qword_1EA343140);
      uint64_t v18 = swift_allocObject();
      *(_OWORD *)(v18 + 16) = xmmword_1C2F73320;
      id v19 = objc_msgSend(v14, sel_leadingAnchor);
      id v20 = objc_msgSend(v1, sel_leadingAnchor);
      (*(void (**)(void))((*MEMORY[0x1E4FBC8C8] & *v1) + 0x70))();
      id v22 = objc_msgSend(v19, sel_constraintEqualToAnchor_constant_, v20, v21);

      *(void *)(v18 + 32) = v22;
      id v23 = objc_msgSend(v14, sel_heightAnchor);
      id v24 = objc_msgSend(v23, sel_constraintEqualToConstant_, 1.0 / v17);

      *(void *)(v18 + 40) = v24;
      id v25 = objc_msgSend(v14, sel_widthAnchor);
      id v26 = objc_msgSend(v1, sel_widthAnchor);
      id v27 = objc_msgSend(v25, sel_constraintEqualToAnchor_, v26);

      *(void *)(v18 + 48) = v27;
      id v28 = objc_msgSend(v1, sel_bottomAnchor);
      id v29 = objc_msgSend(v14, sel_bottomAnchor);
      id v30 = objc_msgSend(v28, sel_constraintEqualToAnchor_, v29);

      *(void *)(v18 + 56) = v30;
      sub_1C2F6E408();
      sub_1C2F57A40();
      v31 = (void *)sub_1C2F6E3E8();
      swift_bridgeObjectRelease();
      objc_msgSend(v1, sel_addConstraints_, v31);

      return;
    }
  }
  uint64_t v6 = (char *)v0 + OBJC_IVAR____TtC11TelephonyUI15TPTipHeaderView_displaysBottomSeparator;
  swift_beginAccess();
  if (*v6 != 1)
  {
LABEL_7:
    id v5 = *(void **)((char *)v1 + v2);
    if (!v5) {
      return;
    }
    goto LABEL_8;
  }
  id v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1EB0]), sel_init);
  uint64_t v8 = *(void **)((char *)v1 + v2);
  *(void *)((char *)v1 + v2) = v7;

  uint64_t v9 = *(void **)((char *)v1 + v2);
  if (v9)
  {
    objc_msgSend(v9, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    uint64_t v10 = *(void **)((char *)v1 + v2);
    if (v10)
    {
      uint64_t v11 = self;
      id v12 = v10;
      id v13 = objc_msgSend(v11, sel_separatorColor);
      objc_msgSend(v12, sel_setBackgroundColor_, v13);

      goto LABEL_7;
    }
  }
}

void sub_1C2F55640()
{
  id v0 = objc_msgSend(self, sel_defaultCenter);
  uint64_t v1 = *MEMORY[0x1E4FB27A0];
  uint64_t v2 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v5[4] = sub_1C2F57AB8;
  v5[5] = v2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 1107296256;
  v5[2] = sub_1C2F5576C;
  v5[3] = &block_descriptor;
  id v3 = _Block_copy(v5);
  swift_release();
  id v4 = objc_msgSend(v0, sel_addObserverForName_object_queue_usingBlock_, v1, 0, 0, v3);
  _Block_release(v3);
  swift_unknownObjectRelease();
}

uint64_t sub_1C2F5576C(uint64_t a1)
{
  uint64_t v1 = *(void (**)(char *))(a1 + 32);
  uint64_t v2 = sub_1C2F6DF68();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  id v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C2F6DF58();
  swift_retain();
  v1(v5);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_1C2F5585C()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xD8))();
}

void *sub_1C2F55890()
{
  uint64_t v1 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xA0);
  uint64_t v2 = (void *)v1();
  id v3 = objc_msgSend(v2, sel_superview);

  if (v3)
  {
    uint64_t v4 = (void *)v1();
    objc_msgSend(v4, sel_removeFromSuperview);
  }
  return sub_1C2F55948();
}

void *sub_1C2F55948()
{
  uint64_t v1 = v0;
  uint64_t result = (void *)(*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xA0))();
  if (result)
  {
    id v22 = result;
    id v3 = objc_msgSend(result, sel_superview);

    if (!v3)
    {
      objc_msgSend(v1, sel_addSubview_, v22);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EA343140);
      uint64_t v4 = swift_allocObject();
      *(_OWORD *)(v4 + 16) = xmmword_1C2F73320;
      id v5 = objc_msgSend(v22, sel_leadingAnchor);
      id v6 = objc_msgSend(v1, sel_layoutMarginsGuide);
      id v7 = objc_msgSend(v6, sel_leadingAnchor);

      id v8 = objc_msgSend(v5, sel_constraintEqualToAnchor_, v7);
      *(void *)(v4 + 32) = v8;
      id v9 = objc_msgSend(v22, sel_topAnchor);
      id v10 = objc_msgSend(v1, sel_layoutMarginsGuide);
      id v11 = objc_msgSend(v10, sel_topAnchor);

      id v12 = objc_msgSend(v9, sel_constraintEqualToAnchor_, v11);
      *(void *)(v4 + 40) = v12;
      id v13 = objc_msgSend(v22, sel_trailingAnchor);
      id v14 = objc_msgSend(v1, sel_layoutMarginsGuide);
      id v15 = objc_msgSend(v14, sel_trailingAnchor);

      id v16 = objc_msgSend(v13, sel_constraintEqualToAnchor_, v15);
      *(void *)(v4 + 48) = v16;
      id v17 = objc_msgSend(v1, sel_layoutMarginsGuide);
      id v18 = objc_msgSend(v17, sel_bottomAnchor);

      id v19 = objc_msgSend(v22, sel_bottomAnchor);
      id v20 = objc_msgSend(v18, sel_constraintEqualToAnchor_, v19);

      *(void *)(v4 + 56) = v20;
      sub_1C2F6E408();
      sub_1C2F57A40();
      uint64_t v21 = sub_1C2F6E3E8();
      swift_bridgeObjectRelease();
      objc_msgSend(v1, sel_addConstraints_, v21);
    }
    return (void *)MEMORY[0x1F4181820]();
  }
  return result;
}

id TPTipHeaderView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  id v9 = objc_allocWithZone(v4);
  return objc_msgSend(v9, sel_initWithFrame_, a1, a2, a3, a4);
}

void TPTipHeaderView.init(frame:)()
{
}

id TPTipHeaderView.__deallocating_deinit()
{
  return sub_1C2F55D50(type metadata accessor for TPTipHeaderView);
}

id sub_1C2F55D50(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t sub_1C2F55DD4(uint64_t a1, int *a2)
{
  id v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_1C2F55EB0;
  return v6(a1);
}

uint64_t sub_1C2F55EB0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

void *sub_1C2F55FA8(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3430D8);
      id v10 = (void *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 56);
      id v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[7 * v8 + 4]) {
          memmove(v12, a4 + 4, 56 * v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      id v10 = (void *)MEMORY[0x1E4FBC860];
      id v12 = (void *)(MEMORY[0x1E4FBC860] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_1C2F575A4(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

unint64_t sub_1C2F560D4(unsigned __int8 a1)
{
  sub_1C2F6E668();
  sub_1C2F6E678();
  uint64_t v2 = sub_1C2F6E688();
  return sub_1C2F56140(a1, v2);
}

unint64_t sub_1C2F56140(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(unsigned __int8 *)(v7 + result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(unsigned __int8 *)(v7 + result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

uint64_t sub_1C2F561E0(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3430D0);
  uint64_t result = sub_1C2F6E5C8();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v8 = 0;
    id v30 = (void *)(v5 + 64);
    uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v29 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v12 = result + 64;
    while (1)
    {
      if (v11)
      {
        unint64_t v17 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v18 = v17 | (v8 << 6);
      }
      else
      {
        int64_t v19 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        uint64_t result = v5 + 64;
        if (v19 >= v29) {
          goto LABEL_33;
        }
        unint64_t v20 = v30[v19];
        ++v8;
        if (!v20)
        {
          int64_t v8 = v19 + 1;
          if (v19 + 1 >= v29) {
            goto LABEL_33;
          }
          unint64_t v20 = v30[v8];
          if (!v20)
          {
            int64_t v21 = v19 + 2;
            if (v21 >= v29)
            {
LABEL_33:
              if ((a2 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v2;
                goto LABEL_40;
              }
              uint64_t v28 = 1 << *(unsigned char *)(v5 + 32);
              if (v28 >= 64) {
                bzero(v30, ((unint64_t)(v28 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                *id v30 = -1 << v28;
              }
              uint64_t v3 = v2;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v20 = v30[v21];
            if (!v20)
            {
              while (1)
              {
                int64_t v8 = v21 + 1;
                if (__OFADD__(v21, 1)) {
                  goto LABEL_42;
                }
                if (v8 >= v29) {
                  goto LABEL_33;
                }
                unint64_t v20 = v30[v8];
                ++v21;
                if (v20) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v8 = v21;
          }
        }
LABEL_30:
        unint64_t v11 = (v20 - 1) & v20;
        unint64_t v18 = __clz(__rbit64(v20)) + (v8 << 6);
      }
      char v26 = *(unsigned char *)(*(void *)(v5 + 48) + v18);
      uint64_t v27 = *(void *)(*(void *)(v5 + 56) + 8 * v18);
      if ((a2 & 1) == 0) {
        sub_1C2F6E0F8();
      }
      sub_1C2F6E668();
      sub_1C2F6E678();
      uint64_t result = sub_1C2F6E688();
      uint64_t v13 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v14 = result & ~v13;
      unint64_t v15 = v14 >> 6;
      if (((-1 << v14) & ~*(void *)(v12 + 8 * (v14 >> 6))) != 0)
      {
        unint64_t v16 = __clz(__rbit64((-1 << v14) & ~*(void *)(v12 + 8 * (v14 >> 6)))) | v14 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v22 = 0;
        unint64_t v23 = (unint64_t)(63 - v13) >> 6;
        do
        {
          if (++v15 == v23 && (v22 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          BOOL v24 = v15 == v23;
          if (v15 == v23) {
            unint64_t v15 = 0;
          }
          v22 |= v24;
          uint64_t v25 = *(void *)(v12 + 8 * v15);
        }
        while (v25 == -1);
        unint64_t v16 = __clz(__rbit64(~v25)) + (v15 << 6);
      }
      *(void *)(v12 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      *(unsigned char *)(*(void *)(v7 + 48) + v16) = v26;
      *(void *)(*(void *)(v7 + 56) + 8 * v16) = v27;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_40:
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_1C2F564B4(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3435C0);
  uint64_t result = sub_1C2F6E5C8();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v8 = 0;
    id v30 = (void *)(v5 + 64);
    uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v29 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v12 = result + 64;
    while (1)
    {
      if (v11)
      {
        unint64_t v14 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v15 = v14 | (v8 << 6);
      }
      else
      {
        int64_t v16 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_42:
          __break(1u);
LABEL_43:
          __break(1u);
          return result;
        }
        uint64_t result = v5 + 64;
        if (v16 >= v29) {
          goto LABEL_34;
        }
        unint64_t v17 = v30[v16];
        ++v8;
        if (!v17)
        {
          int64_t v8 = v16 + 1;
          if (v16 + 1 >= v29) {
            goto LABEL_34;
          }
          unint64_t v17 = v30[v8];
          if (!v17)
          {
            int64_t v18 = v16 + 2;
            if (v18 >= v29)
            {
LABEL_34:
              if ((a2 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v2;
                goto LABEL_41;
              }
              uint64_t v28 = 1 << *(unsigned char *)(v5 + 32);
              if (v28 >= 64) {
                bzero(v30, ((unint64_t)(v28 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                *id v30 = -1 << v28;
              }
              uint64_t v3 = v2;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v17 = v30[v18];
            if (!v17)
            {
              while (1)
              {
                int64_t v8 = v18 + 1;
                if (__OFADD__(v18, 1)) {
                  goto LABEL_43;
                }
                if (v8 >= v29) {
                  goto LABEL_34;
                }
                unint64_t v17 = v30[v8];
                ++v18;
                if (v17) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v8 = v18;
          }
        }
LABEL_21:
        unint64_t v11 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v8 << 6);
      }
      char v19 = *(unsigned char *)(*(void *)(v5 + 48) + v15);
      unint64_t v20 = (long long *)(*(void *)(v5 + 56) + 40 * v15);
      if (a2) {
        sub_1C2F50FC0(v20, (uint64_t)v31);
      }
      else {
        sub_1C2F50F14((uint64_t)v20, (uint64_t)v31);
      }
      sub_1C2F6E668();
      sub_1C2F6E678();
      uint64_t result = sub_1C2F6E688();
      uint64_t v21 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v22 = result & ~v21;
      unint64_t v23 = v22 >> 6;
      if (((-1 << v22) & ~*(void *)(v12 + 8 * (v22 >> 6))) != 0)
      {
        unint64_t v13 = __clz(__rbit64((-1 << v22) & ~*(void *)(v12 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v24 = 0;
        unint64_t v25 = (unint64_t)(63 - v21) >> 6;
        do
        {
          if (++v23 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_42;
          }
          BOOL v26 = v23 == v25;
          if (v23 == v25) {
            unint64_t v23 = 0;
          }
          v24 |= v26;
          uint64_t v27 = *(void *)(v12 + 8 * v23);
        }
        while (v27 == -1);
        unint64_t v13 = __clz(__rbit64(~v27)) + (v23 << 6);
      }
      *(void *)(v12 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      *(unsigned char *)(*(void *)(v7 + 48) + v13) = v19;
      uint64_t result = sub_1C2F50FC0(v31, *(void *)(v7 + 56) + 40 * v13);
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_41:
  *uint64_t v3 = v7;
  return result;
}

unint64_t sub_1C2F56794(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_1C2F6E538();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_1C2F6E668();
        sub_1C2F6E678();
        uint64_t result = sub_1C2F6E688();
        unint64_t v9 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v9 < v8) {
            goto LABEL_5;
          }
        }
        else if (v9 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v9)
        {
LABEL_11:
          uint64_t v10 = *(void *)(a2 + 48);
          unint64_t v11 = (unsigned char *)(v10 + v3);
          uint64_t v12 = (unsigned char *)(v10 + v6);
          if (v3 != v6 || v11 >= v12 + 1) {
            *unint64_t v11 = *v12;
          }
          uint64_t v13 = *(void *)(a2 + 56);
          unint64_t v14 = (void *)(v13 + 8 * v3);
          unint64_t v15 = (void *)(v13 + 8 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v14 >= v15 + 1))
          {
            void *v14 = *v15;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    int64_t v16 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v17 = *v16;
    uint64_t v18 = (-1 << v3) - 1;
  }
  else
  {
    int64_t v16 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v18 = *v16;
    uint64_t v17 = (-1 << result) - 1;
  }
  *int64_t v16 = v18 & v17;
  uint64_t v19 = *(void *)(a2 + 16);
  BOOL v20 = __OFSUB__(v19, 1);
  uint64_t v21 = v19 - 1;
  if (v20)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v21;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_1C2F56950(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_1C2F6E538();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_1C2F6E668();
        sub_1C2F6E678();
        uint64_t result = sub_1C2F6E688();
        unint64_t v11 = result & v7;
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
          uint64_t v13 = (unsigned char *)(v12 + v3);
          unint64_t v14 = (unsigned char *)(v12 + v6);
          if (v3 != v6 || v13 >= v14 + 1) {
            unsigned char *v13 = *v14;
          }
          uint64_t v15 = *(void *)(a2 + 56);
          unint64_t v16 = v15 + 40 * v3;
          uint64_t v17 = (long long *)(v15 + 40 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v16 >= (unint64_t)v17 + 40))
          {
            long long v9 = *v17;
            long long v10 = v17[1];
            *(void *)(v16 + 32) = *((void *)v17 + 4);
            *(_OWORD *)unint64_t v16 = v9;
            *(_OWORD *)(v16 + 16) = v10;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    uint64_t v18 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v19 = *v18;
    uint64_t v20 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v18 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v20 = *v18;
    uint64_t v19 = (-1 << result) - 1;
  }
  uint64_t *v18 = v20 & v19;
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

uint64_t sub_1C2F56B20(uint64_t a1, unsigned __int8 a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = *v3;
  unint64_t v10 = sub_1C2F560D4(a2);
  uint64_t v11 = *(void *)(v8 + 16);
  BOOL v12 = (v9 & 1) == 0;
  uint64_t result = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  char v14 = v9;
  uint64_t v15 = *(void *)(v8 + 24);
  if (v15 >= result && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v15 >= result && (a3 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_1C2F56E04();
LABEL_7:
    unint64_t v16 = (void *)*v4;
    if (v14)
    {
LABEL_8:
      uint64_t v17 = v16[7];
      uint64_t result = swift_bridgeObjectRelease();
      *(void *)(v17 + 8 * v10) = a1;
      return result;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    *(unsigned char *)(v16[6] + v10) = a2;
    *(void *)(v16[7] + 8 * v10) = a1;
    uint64_t v19 = v16[2];
    BOOL v20 = __OFADD__(v19, 1);
    uint64_t v21 = v19 + 1;
    if (!v20)
    {
      v16[2] = v21;
      return result;
    }
    goto LABEL_14;
  }
  sub_1C2F561E0(result, a3 & 1);
  uint64_t result = sub_1C2F560D4(a2);
  if ((v14 & 1) == (v18 & 1))
  {
    unint64_t v10 = result;
    unint64_t v16 = (void *)*v4;
    if (v14) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
LABEL_15:
  uint64_t result = sub_1C2F6E628();
  __break(1u);
  return result;
}

uint64_t sub_1C2F56C58(long long *a1, char a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = (void *)*v3;
  unint64_t v10 = sub_1C2F560D4(a2);
  uint64_t v11 = v8[2];
  BOOL v12 = (v9 & 1) == 0;
  uint64_t v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v14 = v9;
  uint64_t v15 = v8[3];
  if (v15 < v13 || (a3 & 1) == 0)
  {
    if (v15 >= v13 && (a3 & 1) == 0)
    {
      sub_1C2F56FA8();
      goto LABEL_7;
    }
    sub_1C2F564B4(v13, a3 & 1);
    unint64_t v19 = sub_1C2F560D4(a2);
    if ((v14 & 1) == (v20 & 1))
    {
      unint64_t v10 = v19;
      unint64_t v16 = *v4;
      if (v14) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = sub_1C2F6E628();
    __break(1u);
    return result;
  }
LABEL_7:
  unint64_t v16 = *v4;
  if (v14)
  {
LABEL_8:
    uint64_t v17 = v16[7] + 40 * v10;
    __swift_destroy_boxed_opaque_existential_1(v17);
    return sub_1C2F50FC0(a1, v17);
  }
LABEL_13:
  return sub_1C2F56D98(v10, a2, a1, v16);
}

uint64_t sub_1C2F56D98(unint64_t a1, char a2, long long *a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(unsigned char *)(a4[6] + a1) = a2;
  uint64_t result = sub_1C2F50FC0(a3, a4[7] + 40 * a1);
  uint64_t v6 = a4[2];
  BOOL v7 = __OFADD__(v6, 1);
  uint64_t v8 = v6 + 1;
  if (v7) {
    __break(1u);
  }
  else {
    a4[2] = v8;
  }
  return result;
}

void *sub_1C2F56E04()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3430D0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1C2F6E5B8();
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)(v2 + 16);
  if (!v5)
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v7 = v2 + 64;
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v8)
  {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v8);
    uint64_t v5 = *(void *)(v2 + 16);
  }
  int64_t v10 = 0;
  *(void *)(v4 + 16) = v5;
  uint64_t v11 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v2 + 64);
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    int64_t v18 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v14) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v7 + 8 * v18);
    ++v10;
    if (!v19)
    {
      int64_t v10 = v18 + 1;
      if (v18 + 1 >= v14) {
        goto LABEL_26;
      }
      unint64_t v19 = *(void *)(v7 + 8 * v10);
      if (!v19) {
        break;
      }
    }
LABEL_25:
    unint64_t v13 = (v19 - 1) & v19;
    unint64_t v16 = __clz(__rbit64(v19)) + (v10 << 6);
LABEL_12:
    uint64_t v17 = *(void *)(*(void *)(v2 + 56) + 8 * v16);
    *(unsigned char *)(*(void *)(v4 + 48) + v16) = *(unsigned char *)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 56) + 8 * v16) = v17;
    uint64_t result = (void *)sub_1C2F6E0F8();
  }
  int64_t v20 = v18 + 2;
  if (v20 >= v14) {
    goto LABEL_26;
  }
  unint64_t v19 = *(void *)(v7 + 8 * v20);
  if (v19)
  {
    int64_t v10 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v10 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v7 + 8 * v10);
    ++v20;
    if (v19) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1C2F56FA8()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3435C0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1C2F6E5B8();
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)(v2 + 16);
  if (!v5)
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v7 = v2 + 64;
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v8)
  {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v8);
    uint64_t v5 = *(void *)(v2 + 16);
  }
  int64_t v10 = 0;
  *(void *)(v4 + 16) = v5;
  uint64_t v11 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v2 + 64);
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    int64_t v18 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v14) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v7 + 8 * v18);
    ++v10;
    if (!v19)
    {
      int64_t v10 = v18 + 1;
      if (v18 + 1 >= v14) {
        goto LABEL_26;
      }
      unint64_t v19 = *(void *)(v7 + 8 * v10);
      if (!v19) {
        break;
      }
    }
LABEL_25:
    unint64_t v13 = (v19 - 1) & v19;
    unint64_t v16 = __clz(__rbit64(v19)) + (v10 << 6);
LABEL_12:
    char v17 = *(unsigned char *)(*(void *)(v2 + 48) + v16);
    sub_1C2F50F14(*(void *)(v2 + 56) + 40 * v16, (uint64_t)v21);
    *(unsigned char *)(*(void *)(v4 + 48) + v16) = v17;
    uint64_t result = (void *)sub_1C2F50FC0(v21, *(void *)(v4 + 56) + 40 * v16);
  }
  int64_t v20 = v18 + 2;
  if (v20 >= v14) {
    goto LABEL_26;
  }
  unint64_t v19 = *(void *)(v7 + 8 * v20);
  if (v19)
  {
    int64_t v10 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v10 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v7 + 8 * v10);
    ++v20;
    if (v19) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_1C2F5716C(uint64_t a1, int *a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v3;
  *uint64_t v3 = v2;
  v3[1] = sub_1C2F5724C;
  return v5(v2 + 32);
}

uint64_t sub_1C2F5724C()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(unsigned char **)(*v0 + 16);
  uint64_t v5 = *v0;
  swift_task_dealloc();
  unsigned char *v2 = *(unsigned char *)(v1 + 32);
  uint64_t v3 = *(uint64_t (**)(void))(v5 + 8);
  return v3();
}

unint64_t sub_1C2F57360(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return MEMORY[0x1E4FBC868];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3430D0);
  uint64_t v3 = (void *)sub_1C2F6E5D8();
  unsigned __int8 v4 = *(unsigned char *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  unint64_t result = sub_1C2F560D4(v4);
  if (v7)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    sub_1C2F6E0F8();
    return (unint64_t)v3;
  }
  unint64_t v8 = (void *)(a1 + 56);
  while (1)
  {
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(unsigned char *)(v3[6] + result) = v4;
    *(void *)(v3[7] + 8 * result) = v5;
    uint64_t v9 = v3[2];
    BOOL v10 = __OFADD__(v9, 1);
    uint64_t v11 = v9 + 1;
    if (v10) {
      break;
    }
    v3[2] = v11;
    if (!--v1) {
      goto LABEL_8;
    }
    uint64_t v12 = v8 + 2;
    unsigned __int8 v4 = *((unsigned char *)v8 - 8);
    uint64_t v13 = *v8;
    sub_1C2F6E0F8();
    unint64_t result = sub_1C2F560D4(v4);
    unint64_t v8 = v12;
    uint64_t v5 = v13;
    if (v14) {
      goto LABEL_7;
    }
  }
  __break(1u);
  return result;
}

unint64_t sub_1C2F57464(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3435C0);
    uint64_t v3 = (void *)sub_1C2F6E5D8();
    for (uint64_t i = a1 + 32; ; i += 48)
    {
      sub_1C2F58A08(i, (uint64_t)v11);
      unsigned __int8 v5 = v11[0];
      unint64_t result = sub_1C2F560D4(v11[0]);
      if (v7) {
        break;
      }
      *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      *(unsigned char *)(v3[6] + result) = v5;
      unint64_t result = sub_1C2F50FC0(&v12, v3[7] + 40 * result);
      uint64_t v8 = v3[2];
      BOOL v9 = __OFADD__(v8, 1);
      uint64_t v10 = v8 + 1;
      if (v9) {
        goto LABEL_10;
      }
      v3[2] = v10;
      if (!--v1) {
        return (unint64_t)v3;
      }
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E4FBC868];
  }
  return result;
}

uint64_t sub_1C2F57560(uint64_t a1, uint64_t a2)
{
  return initializeWithCopy for TPTipsHelper.Entry(a2, a1);
}

uint64_t sub_1C2F57570(uint64_t a1)
{
  return a1;
}

uint64_t sub_1C2F575A4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 56 * a1 + 32;
    unint64_t v6 = a3 + 56 * v4;
    if (v5 >= v6 || v5 + 56 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_1C2F6E5E8();
  __break(1u);
  return result;
}

unint64_t sub_1C2F578A4()
{
  unint64_t result = qword_1EA343538;
  if (!qword_1EA343538)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_1EA343538);
  }
  return result;
}

uint64_t sub_1C2F578F8(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_1C2F58B84;
  return sub_1C2F53B28(a1);
}

uint64_t sub_1C2F57990()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_1C2F58B84;
  return sub_1C2F54004();
}

uint64_t type metadata accessor for TPTipHeaderView()
{
  return self;
}

unint64_t sub_1C2F57A40()
{
  unint64_t result = qword_1EA343580;
  if (!qword_1EA343580)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EA343580);
  }
  return result;
}

uint64_t sub_1C2F57A80()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_1C2F57AB8(uint64_t a1)
{
  swift_beginAccess();
  uint64_t v3 = (void *)MEMORY[0x1C876E6D0](v1 + 16);
  if (v3)
  {
    uint64_t v4 = v3;
    (*(void (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & *v3) + 0xD0))(a1);
  }
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

unint64_t sub_1C2F57B60()
{
  unint64_t result = qword_1EA343048;
  if (!qword_1EA343048)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA343048);
  }
  return result;
}

uint64_t method lookup function for TPTipsHelper(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for TPTipsHelper);
}

uint64_t dispatch thunk of TPTipsHelper.popoverController.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x68))();
}

uint64_t dispatch thunk of TPTipsHelper.popoverController.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x70))();
}

uint64_t dispatch thunk of TPTipsHelper.popoverController.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of TPTipsHelper.entries.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x80))();
}

uint64_t dispatch thunk of TPTipsHelper.entries.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x88))();
}

uint64_t dispatch thunk of TPTipsHelper.entries.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x90))();
}

uint64_t dispatch thunk of TPTipsHelper.currentTip.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x98))();
}

uint64_t dispatch thunk of TPTipsHelper.currentTip.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of TPTipsHelper.currentTip.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of TPTipsHelper.setup()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of TPTipsHelper.addEntry(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of TPTipsHelper.removeEntries(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of static TPTipsHelper.donateEventSpeakerUsed()()
{
  return (*(uint64_t (**)(void))(v0 + 200))();
}

uint64_t dispatch thunk of static TPTipsHelper.donateEventKnownStoryLaunched()()
{
  return (*(uint64_t (**)(void))(v0 + 208))();
}

uint64_t dispatch thunk of static TPTipsHelper.donateEventKnownCallersDone()()
{
  return (*(uint64_t (**)(void))(v0 + 216))();
}

uint64_t dispatch thunk of static TPTipsHelper.donateEventSavedNumber()()
{
  return (*(uint64_t (**)(void))(v0 + 224))();
}

uint64_t dispatch thunk of static TPTipsHelper.donateEventCalledNonFavContact()()
{
  return (*(uint64_t (**)(void))(v0 + 232))();
}

uint64_t dispatch thunk of static TPTipsHelper.donateEventCalledNonContact()()
{
  return (*(uint64_t (**)(void))(v0 + 240))();
}

uint64_t dispatch thunk of static TPTipsHelper.donateEventOriginatedCallWithSiri()()
{
  return (*(uint64_t (**)(void))(v0 + 248))();
}

uint64_t dispatch thunk of static TPTipsHelper.donateEventCreatedFacetimeLink()()
{
  return (*(uint64_t (**)(void))(v0 + 256))();
}

uint64_t dispatch thunk of static TPTipsHelper.donateEventSearchedCallHistory()()
{
  return (*(uint64_t (**)(void))(v0 + 264))();
}

uint64_t dispatch thunk of static TPTipsHelper.updateCanDisplayCallHistorySearchTip(_:)()
{
  return (*(uint64_t (**)(void))(v0 + 272))();
}

uint64_t dispatch thunk of static TPTipsHelper.didDisplayCallHistorySearchTip()()
{
  return (*(uint64_t (**)(void))(v0 + 280))();
}

uint64_t initializeBufferWithCopyOfBuffer for TPTipsHelper.Entry(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for TPTipsHelper.Entry(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1 + 8);
  return swift_release();
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t initializeWithCopy for TPTipsHelper.Entry(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 32) = v4;
  (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a1 + 8, a2 + 8);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for TPTipsHelper.Entry(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 8), (uint64_t *)(a2 + 8));
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    uint64_t v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v10 = *(void *)(v4 - 8);
      if ((*(unsigned char *)(v10 + 82) & 2) != 0)
      {
        uint64_t v12 = *a2;
        swift_retain();
        unint64_t result = (uint64_t *)swift_release();
        *uint64_t v3 = v12;
      }
      else
      {
        uint64_t v11 = *(uint64_t (**)(void))(v10 + 24);
        return (uint64_t *)v11();
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      uint64_t v6 = *(void *)(v4 - 8);
      uint64_t v7 = *(void *)(v5 - 8);
      uint64_t v8 = v7;
      int v9 = *(_DWORD *)(v7 + 80);
      if ((*(unsigned char *)(v6 + 82) & 2) != 0)
      {
        if ((v9 & 0x20000) != 0)
        {
          *unint64_t result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(unsigned char *, uint64_t *, uint64_t))(v6 + 32))(v13, result, v4);
        if ((v9 & 0x20000) != 0)
        {
          *uint64_t v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v13, v4);
      }
    }
  }
  return result;
}

__n128 __swift_memcpy56_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for TPTipsHelper.Entry(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  __swift_destroy_boxed_opaque_existential_1(a1 + 8);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  uint64_t v4 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v4;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for TPTipsHelper.Entry(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 56)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 32);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TPTipsHelper.Entry(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 56) = 1;
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
      *(void *)(result + 32) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TPTipsHelper.Entry()
{
  return &type metadata for TPTipsHelper.Entry;
}

uint64_t getEnumTagSinglePayload for TPTipsHelper.Entry.Kind(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF8) {
    goto LABEL_17;
  }
  if (a2 + 8 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 8) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 8;
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
      return (*a1 | (v4 << 8)) - 8;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 8;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 9;
  int v8 = v6 - 9;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for TPTipsHelper.Entry.Kind(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 8 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 8) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF8) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF7)
  {
    unsigned int v6 = ((a2 - 248) >> 8) + 1;
    *__n128 result = a2 + 8;
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
        JUMPOUT(0x1C2F58534);
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
          *__n128 result = a2 + 8;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TPTipsHelper.Entry.Kind()
{
  return &type metadata for TPTipsHelper.Entry.Kind;
}

uint64_t method lookup function for TPTipHeaderView(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for TPTipHeaderView);
}

uint64_t dispatch thunk of TPTipHeaderView.hostingView.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of TPTipHeaderView.hostingView.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of TPTipHeaderView.hostingView.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of TPTipHeaderView.__allocating_init(frame:separatorInset:)()
{
  return (*(uint64_t (**)(void))(v0 + 184))();
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_1C2F58640(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_1C2F58660(uint64_t result, int a2, int a3)
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

void type metadata accessor for UIEdgeInsets()
{
  if (!qword_1EA343588)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1EA343588);
    }
  }
}

uint64_t sub_1C2F586E4()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_1C2F58770;
  return sub_1C2F54004();
}

uint64_t sub_1C2F58770()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1C2F58864()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1C2F5889C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_1C2F58770;
  unsigned int v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1EA3435A0 + dword_1EA3435A0);
  return v6(a1, v4);
}

unint64_t sub_1C2F58954()
{
  unint64_t result = qword_1EA3435B8;
  if (!qword_1EA3435B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3435B8);
  }
  return result;
}

uint64_t sub_1C2F589A8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1C2F58A08(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3435C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C2F58A70(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_1C2F58B84;
  unsigned int v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1EA3435D8 + dword_1EA3435D8);
  return v6(a1, v4);
}

uint64_t sub_1C2F58B28(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_1C2F58B70()
{
}

uint64_t sub_1C2F58BAC(uint64_t a1)
{
  return sub_1C2F5B8EC(a1, qword_1EA343A48);
}

uint64_t sub_1C2F58BC0()
{
  return sub_1C2F5E760(qword_1EA343A60, &qword_1EA3430B0, (uint64_t)qword_1EA343A48);
}

uint64_t static FavoritesTip.favoriteAddedEvent.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1C2F5E22C(qword_1EA343A60, (uint64_t)qword_1EA343A48, a1);
}

uint64_t sub_1C2F58C10()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3430B8);
  __swift_allocate_value_buffer(v0, qword_1EA344F80);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EA344F80);
  return sub_1C2F6E348();
}

uint64_t sub_1C2F58CB8()
{
  return sub_1C2F5E760(&qword_1EA343A40, &qword_1EA3430B8, (uint64_t)qword_1EA344F80);
}

uint64_t sub_1C2F58CE4@<X0>(uint64_t a1@<X8>)
{
  return sub_1C2F5E7E4(&qword_1EA343A40, &qword_1EA3430B8, (uint64_t)qword_1EA344F80, a1);
}

uint64_t sub_1C2F58D10(uint64_t a1)
{
  return sub_1C2F5E8BC(a1, &qword_1EA343A40, &qword_1EA3430B8, (uint64_t)qword_1EA344F80);
}

uint64_t (*sub_1C2F58D3C())()
{
  if (qword_1EA343A40 != -1) {
    swift_once();
  }
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3430B8);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EA344F80);
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_1C2F58DD4()
{
  if (qword_1EA343A40 != -1) {
    swift_once();
  }
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3430B8);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EA344F80);
  swift_beginAccess();
  sub_1C2F6E328();
  swift_endAccess();
  return v2;
}

uint64_t sub_1C2F58E74()
{
  if (qword_1EA343A40 != -1) {
    swift_once();
  }
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3430B8);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EA344F80);
  swift_beginAccess();
  sub_1C2F6E338();
  return swift_endAccess();
}

void (*sub_1C2F58F20(void *a1))(uint64_t a1)
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  if (qword_1EA343A40 != -1) {
    swift_once();
  }
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3430B8);
  void v2[5] = v3;
  v2[6] = __swift_project_value_buffer(v3, (uint64_t)qword_1EA344F80);
  swift_beginAccess();
  sub_1C2F6E328();
  uint64_t v4 = v2[4];
  swift_endAccess();
  v2[3] = v4;
  return sub_1C2F5900C;
}

void sub_1C2F5900C(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  *(void *)(*(void *)a1 + 32) = *(void *)(*(void *)a1 + 24);
  swift_beginAccess();
  sub_1C2F6E338();
  swift_endAccess();
  free(v1);
}

unint64_t FavoritesTip.id.getter()
{
  return 0xD00000000000001BLL;
}

uint64_t FavoritesTip.asset.getter()
{
  return sub_1C2F6E3A8();
}

uint64_t FavoritesTip.rules.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3430F8);
  sub_1C2F6E298();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1C2F73450;
  if (qword_1EA343A60[0] != -1) {
    swift_once();
  }
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3430B0);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EA343A48);
  MEMORY[0x1F4188790](v1);
  (*(void (**)(char *))(v3 + 16))((char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1C2F6E118();
  sub_1C2F59448(&qword_1EA343088);
  sub_1C2F59448(&qword_1EA343080);
  sub_1C2F6E2A8();
  if (qword_1EA343A40 != -1) {
    swift_once();
  }
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3430B8);
  uint64_t v5 = __swift_project_value_buffer(v4, (uint64_t)qword_1EA344F80);
  uint64_t v6 = swift_beginAccess();
  MEMORY[0x1F4188790](v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v5, v4);
  sub_1C2F6E2B8();
  sub_1C2F6E0F8();
  swift_bridgeObjectRelease();
  uint64_t v9 = sub_1C2F6E0F8();
  swift_bridgeObjectRelease();
  return v9;
}

uint64_t sub_1C2F59438@<X0>(uint64_t *a1@<X8>)
{
  return sub_1C2F5C830(1, MEMORY[0x1E4F27558], a1);
}

uint64_t sub_1C2F59448(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1C2F6E118();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1C2F5948C@<X0>(uint64_t *a1@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3430B0);
  uint64_t result = sub_1C2F6E2E8();
  *a1 = result;
  return result;
}

uint64_t sub_1C2F594C4@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = *(void *)(*(void *)result + 16);
  return result;
}

uint64_t sub_1C2F594D4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA343038);
  v14[0] = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v4 = (char *)v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C2F6053C(&qword_1EA343030, &qword_1EA343038);
  sub_1C2F6DFD8();
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA342FC0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14[1] = 1;
  sub_1C2F6DFC8();
  uint64_t v9 = sub_1C2F6DFB8();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v12 = (char *)v14 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v10 + 104))(v12, *MEMORY[0x1E4F27558], v9);
  a1[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA342F68);
  a1[4] = sub_1C2F60494();
  __swift_allocate_boxed_opaque_existential_1(a1);
  sub_1C2F6053C(&qword_1EA342FB8, &qword_1EA342FC0);
  sub_1C2F6DFA8();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return (*(uint64_t (**)(char *, uint64_t))(v14[0] + 8))(v4, v2);
}

uint64_t static FavoritesTip.favoritesCount.getter()
{
  if (qword_1EA343A40 != -1) {
    swift_once();
  }
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3430B8);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EA344F80);
  swift_beginAccess();
  sub_1C2F6E328();
  swift_endAccess();
  return v2;
}

uint64_t static FavoritesTip.favoritesCount.setter()
{
  if (qword_1EA343A40 != -1) {
    swift_once();
  }
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3430B8);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EA344F80);
  swift_beginAccess();
  sub_1C2F6E338();
  return swift_endAccess();
}

void (*static FavoritesTip.favoritesCount.modify(void *a1))(uint64_t a1)
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  if (qword_1EA343A40 != -1) {
    swift_once();
  }
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3430B8);
  void v2[5] = v3;
  v2[6] = __swift_project_value_buffer(v3, (uint64_t)qword_1EA344F80);
  swift_beginAccess();
  sub_1C2F6E328();
  uint64_t v4 = v2[4];
  swift_endAccess();
  v2[3] = v4;
  return sub_1C2F5900C;
}

unint64_t sub_1C2F599F8()
{
  return 0xD00000000000001BLL;
}

uint64_t sub_1C2F59A18()
{
  return sub_1C2F6E098();
}

uint64_t sub_1C2F59A30()
{
  return sub_1C2F6E0A8();
}

uint64_t sub_1C2F59A48()
{
  return FavoritesTip.rules.getter();
}

void sub_1C2F59A64(void *a1@<X8>)
{
  *a1 = 0xD00000000000001BLL;
  a1[1] = 0x80000001C2F76180;
}

uint64_t sub_1C2F59A84(uint64_t a1)
{
  return sub_1C2F5B8EC(a1, qword_1EA344900);
}

uint64_t sub_1C2F59A98()
{
  return sub_1C2F5E760(&qword_1EA3448F8, &qword_1EA3430B0, (uint64_t)qword_1EA344900);
}

uint64_t static SpeakerphoneTip.speakerUsedEvent.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1C2F5E22C(&qword_1EA3448F8, (uint64_t)qword_1EA344900, a1);
}

uint64_t sub_1C2F59AE8(uint64_t a1)
{
  return sub_1C2F5E688(a1, qword_1EA344FE0);
}

uint64_t sub_1C2F59B14()
{
  return sub_1C2F5E760(&qword_1EA344918, &qword_1EA342F38, (uint64_t)qword_1EA344FE0);
}

uint64_t sub_1C2F59B40@<X0>(uint64_t a1@<X8>)
{
  return sub_1C2F5E7E4(&qword_1EA344918, &qword_1EA342F38, (uint64_t)qword_1EA344FE0, a1);
}

uint64_t sub_1C2F59B6C(uint64_t a1)
{
  return sub_1C2F5E8BC(a1, &qword_1EA344918, &qword_1EA342F38, (uint64_t)qword_1EA344FE0);
}

uint64_t (*sub_1C2F59B98())()
{
  if (qword_1EA344918 != -1) {
    swift_once();
  }
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA342F38);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EA344FE0);
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1C2F59C30()
{
  return sub_1C2F5D6AC(&qword_1EA344918, (uint64_t)qword_1EA344FE0);
}

uint64_t sub_1C2F59C54(uint64_t a1)
{
  return sub_1C2F5D75C(a1, &qword_1EA344918, (uint64_t)qword_1EA344FE0);
}

uint64_t (*sub_1C2F59C78(void *a1))()
{
  uint64_t v2 = malloc(0x30uLL);
  *a1 = v2;
  if (qword_1EA344918 != -1) {
    swift_once();
  }
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA342F38);
  v2[3] = v3;
  v2[4] = __swift_project_value_buffer(v3, (uint64_t)qword_1EA344FE0);
  swift_beginAccess();
  sub_1C2F6E328();
  char v4 = *((unsigned char *)v2 + 41);
  swift_endAccess();
  *((unsigned char *)v2 + 40) = v4;
  return sub_1C2F59D64;
}

unint64_t SpeakerphoneTip.id.getter()
{
  return 0xD000000000000019;
}

uint64_t SpeakerphoneTip.rules.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3430F8);
  sub_1C2F6E298();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1C2F73450;
  if (qword_1EA3448F8 != -1) {
    swift_once();
  }
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3430B0);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EA344900);
  MEMORY[0x1F4188790](v1);
  (*(void (**)(char *))(v3 + 16))((char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1C2F6E118();
  sub_1C2F59448(&qword_1EA343088);
  sub_1C2F59448(&qword_1EA343080);
  sub_1C2F6E2A8();
  if (qword_1EA344918 != -1) {
    swift_once();
  }
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA342F38);
  uint64_t v5 = __swift_project_value_buffer(v4, (uint64_t)qword_1EA344FE0);
  uint64_t v6 = swift_beginAccess();
  MEMORY[0x1F4188790](v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v5, v4);
  sub_1C2F6E2B8();
  sub_1C2F6E0F8();
  swift_bridgeObjectRelease();
  uint64_t v9 = sub_1C2F6E0F8();
  swift_bridgeObjectRelease();
  return v9;
}

uint64_t sub_1C2F5A0F0@<X0>(uint64_t *a1@<X8>)
{
  return sub_1C2F5C604(1, a1);
}

uint64_t static SpeakerphoneTip.isAwayFromFace.getter()
{
  return sub_1C2F5D6AC(&qword_1EA344918, (uint64_t)qword_1EA344FE0);
}

uint64_t static SpeakerphoneTip.isAwayFromFace.setter(uint64_t a1)
{
  return sub_1C2F5D75C(a1, &qword_1EA344918, (uint64_t)qword_1EA344FE0);
}

uint64_t (*static SpeakerphoneTip.isAwayFromFace.modify(void *a1))()
{
  uint64_t v2 = malloc(0x30uLL);
  *a1 = v2;
  if (qword_1EA344918 != -1) {
    swift_once();
  }
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA342F38);
  v2[3] = v3;
  v2[4] = __swift_project_value_buffer(v3, (uint64_t)qword_1EA344FE0);
  swift_beginAccess();
  sub_1C2F6E328();
  char v4 = *((unsigned char *)v2 + 41);
  swift_endAccess();
  *((unsigned char *)v2 + 40) = v4;
  return sub_1C2F59D64;
}

unint64_t sub_1C2F5A22C()
{
  return 0xD000000000000019;
}

uint64_t sub_1C2F5A248()
{
  return SpeakerphoneTip.rules.getter();
}

void sub_1C2F5A260(void *a1@<X8>)
{
  *a1 = 0xD000000000000019;
  a1[1] = 0x80000001C2F761A0;
}

uint64_t sub_1C2F5A280(uint64_t a1)
{
  return sub_1C2F5B8EC(a1, qword_1EA344928);
}

uint64_t sub_1C2F5A294()
{
  return sub_1C2F5E760(qword_1EA344250, &qword_1EA3430B0, (uint64_t)qword_1EA344928);
}

uint64_t static RecentsSaveAsContactTip.calledNonContactEvent.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1C2F5E22C(qword_1EA344250, (uint64_t)qword_1EA344928, a1);
}

uint64_t sub_1C2F5A2E4(uint64_t a1)
{
  return sub_1C2F5B8EC(a1, qword_1EA343DE8);
}

uint64_t sub_1C2F5A2F8()
{
  return sub_1C2F5E760(qword_1EA343E00, &qword_1EA3430B0, (uint64_t)qword_1EA343DE8);
}

uint64_t static RecentsSaveAsContactTip.savedNumberEvent.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1C2F5E22C(qword_1EA343E00, (uint64_t)qword_1EA343DE8, a1);
}

unint64_t RecentsSaveAsContactTip.id.getter()
{
  return 0xD000000000000019;
}

uint64_t RecentsSaveAsContactTip.asset.getter()
{
  return sub_1C2F6E3A8();
}

uint64_t RecentsSaveAsContactTip.rules.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3430F8);
  v9[3] = *(void *)(*(void *)(sub_1C2F6E298() - 8) + 72);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_1C2F73450;
  if (qword_1EA343E00[0] != -1) {
    swift_once();
  }
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3430B0);
  v9[0] = __swift_project_value_buffer(v1, (uint64_t)qword_1EA343DE8);
  v9[1] = v9;
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(void *)(v2 + 64);
  MEMORY[0x1F4188790](v9[0]);
  v9[2] = v0;
  unint64_t v4 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v5 = *(void (**)(char *))(v2 + 16);
  v5((char *)v9 - v4);
  sub_1C2F6E118();
  sub_1C2F59448(&qword_1EA343088);
  sub_1C2F59448(&qword_1EA343080);
  uint64_t v6 = sub_1C2F6E2A8();
  MEMORY[0x1F4188790](v6);
  ((void (*)(char *, void, uint64_t))v5)((char *)v9 - v4, v9[0], v1);
  sub_1C2F6E2A8();
  sub_1C2F6E0F8();
  swift_bridgeObjectRelease();
  uint64_t v7 = sub_1C2F6E0F8();
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t sub_1C2F5A668@<X0>(uint64_t *a1@<X8>)
{
  return sub_1C2F5C830(3, MEMORY[0x1E4F27550], a1);
}

unint64_t sub_1C2F5A678()
{
  return 0xD000000000000019;
}

uint64_t sub_1C2F5A694()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3430F8);
  v9[3] = *(void *)(*(void *)(sub_1C2F6E298() - 8) + 72);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_1C2F73450;
  if (qword_1EA343E00[0] != -1) {
    swift_once();
  }
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3430B0);
  v9[0] = __swift_project_value_buffer(v1, (uint64_t)qword_1EA343DE8);
  v9[1] = v9;
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(void *)(v2 + 64);
  MEMORY[0x1F4188790](v9[0]);
  v9[2] = v0;
  unint64_t v4 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v5 = *(void (**)(char *))(v2 + 16);
  v5((char *)v9 - v4);
  sub_1C2F6E118();
  sub_1C2F59448(&qword_1EA343088);
  sub_1C2F59448(&qword_1EA343080);
  uint64_t v6 = sub_1C2F6E2A8();
  MEMORY[0x1F4188790](v6);
  ((void (*)(char *, void, uint64_t))v5)((char *)v9 - v4, v9[0], v1);
  sub_1C2F6E2A8();
  sub_1C2F6E0F8();
  swift_bridgeObjectRelease();
  uint64_t v7 = sub_1C2F6E0F8();
  swift_bridgeObjectRelease();
  return v7;
}

void sub_1C2F5A960(void *a1@<X8>)
{
  *a1 = 0xD000000000000019;
  a1[1] = 0x80000001C2F761C0;
}

uint64_t sub_1C2F5A980(uint64_t a1)
{
  return sub_1C2F5B8EC(a1, qword_1EA344178);
}

uint64_t sub_1C2F5A994()
{
  return sub_1C2F5E760(qword_1EA344190, &qword_1EA3430B0, (uint64_t)qword_1EA344178);
}

uint64_t static RecentsSaveAsFavoritesTip.calledNonFavContactEvent.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1C2F5E22C(qword_1EA344190, (uint64_t)qword_1EA344178, a1);
}

unint64_t RecentsSaveAsFavoritesTip.id.getter()
{
  return 0xD00000000000001FLL;
}

uint64_t RecentsSaveAsFavoritesTip.asset.getter()
{
  return sub_1C2F6E3A8();
}

uint64_t RecentsSaveAsFavoritesTip.rules.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3430F8);
  uint64_t v0 = *(void *)(sub_1C2F6E298() - 8);
  unint64_t v1 = (*(unsigned __int8 *)(v0 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 80);
  v12[1] = *(void *)(v0 + 72);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_1C2F73450;
  v12[2] = v2;
  v12[3] = v2 + v1;
  if (qword_1EA343A60[0] != -1) {
    swift_once();
  }
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3430B0);
  uint64_t v4 = __swift_project_value_buffer(v3, (uint64_t)qword_1EA343A48);
  uint64_t v5 = *(void *)(v3 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x1F4188790](v4);
  unint64_t v7 = (v6 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v8 = *(void (**)(char *))(v5 + 16);
  v8((char *)v12 - v7);
  sub_1C2F6E118();
  sub_1C2F59448(&qword_1EA343088);
  sub_1C2F59448(&qword_1EA343080);
  sub_1C2F6E2A8();
  if (qword_1EA344190[0] != -1) {
    swift_once();
  }
  uint64_t v9 = __swift_project_value_buffer(v3, (uint64_t)qword_1EA344178);
  MEMORY[0x1F4188790](v9);
  v8((char *)v12 - v7);
  sub_1C2F6E2A8();
  sub_1C2F6E0F8();
  swift_bridgeObjectRelease();
  uint64_t v10 = sub_1C2F6E0F8();
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_1C2F5AD3C@<X0>(uint64_t *a1@<X8>)
{
  return sub_1C2F5C830(5, MEMORY[0x1E4F27538], a1);
}

unint64_t sub_1C2F5AD4C()
{
  return 0xD00000000000001FLL;
}

uint64_t sub_1C2F5AD68()
{
  return RecentsSaveAsFavoritesTip.rules.getter();
}

void sub_1C2F5AD80(void *a1@<X8>)
{
  *a1 = 0xD00000000000001FLL;
  a1[1] = 0x80000001C2F76210;
}

uint64_t sub_1C2F5ADA0(uint64_t a1)
{
  return sub_1C2F5B8EC(a1, qword_1EA343F18);
}

uint64_t sub_1C2F5ADB4()
{
  return sub_1C2F5E760(qword_1EA343F30, &qword_1EA3430B0, (uint64_t)qword_1EA343F18);
}

uint64_t static RecentsBrandedCallingTip.brandedCallReceivedEvent.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1C2F5E22C(qword_1EA343F30, (uint64_t)qword_1EA343F18, a1);
}

void *sub_1C2F5AE04()
{
  return &unk_1C2F73480;
}

uint64_t static RecentsBrandedCallingTip.ContentPersonalizationTypeCarrierStrings.getter()
{
  return 1;
}

unint64_t RecentsBrandedCallingTip.id.getter()
{
  return 0xD00000000000001BLL;
}

uint64_t RecentsBrandedCallingTip.asset.getter()
{
  return sub_1C2F6E3A8();
}

uint64_t sub_1C2F5AE70()
{
  return sub_1C2F6E0F8();
}

uint64_t sub_1C2F5AE78(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  void *v1 = a1;
  return result;
}

uint64_t (*sub_1C2F5AEA4())()
{
  return nullsub_1;
}

TelephonyUI::RecentsBrandedCallingTip __swiftcall RecentsBrandedCallingTip.init(_:)(TelephonyUI::RecentsBrandedCallingTip result)
{
  v1->personalizationInfo._rawValue = result.personalizationInfo._rawValue;
  return result;
}

uint64_t RecentsBrandedCallingTip.personalizedText(for:)(uint64_t a1)
{
  if (*(void *)(*(void *)v1 + 16) && (sub_1C2F5F50C(a1), (v2 & 1) != 0))
  {
    sub_1C2F5F550();
    sub_1C2F6E0F8();
    return sub_1C2F6E388();
  }
  else
  {
    sub_1C2F6E368();
    return sub_1C2F6E378();
  }
}

uint64_t RecentsBrandedCallingTip.rules.getter()
{
  return sub_1C2F5B318(qword_1EA343F30, (uint64_t)qword_1EA343F18);
}

uint64_t sub_1C2F5AFA8@<X0>(uint64_t *a1@<X8>)
{
  return sub_1C2F5EFC0(1, a1);
}

unint64_t sub_1C2F5AFB0()
{
  return 0xD00000000000001BLL;
}

uint64_t sub_1C2F5AFCC()
{
  return sub_1C2F6E0B8();
}

uint64_t sub_1C2F5AFF0()
{
  return sub_1C2F6E0D8();
}

uint64_t sub_1C2F5B008(uint64_t a1, uint64_t a2)
{
  return sub_1C2F5B5A4(a1, a2, qword_1EA343F30, (uint64_t)qword_1EA343F18);
}

uint64_t sub_1C2F5B040()
{
  return sub_1C2F6E0E8();
}

uint64_t sub_1C2F5B058(uint64_t a1)
{
  return RecentsBrandedCallingTip.personalizedText(for:)(a1);
}

void sub_1C2F5B07C(void *a1@<X8>)
{
  *a1 = 0xD00000000000001BLL;
  a1[1] = 0x80000001C2F76230;
}

uint64_t sub_1C2F5B09C(uint64_t a1)
{
  return sub_1C2F5B8EC(a1, qword_1EA344048);
}

uint64_t sub_1C2F5B0B0()
{
  return sub_1C2F5E760(qword_1EA344060, &qword_1EA3430B0, (uint64_t)qword_1EA344048);
}

uint64_t static RecentsUnknownCallersTip.unknownShortCallEvent.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1C2F5E22C(qword_1EA344060, (uint64_t)qword_1EA344048, a1);
}

uint64_t sub_1C2F5B100(uint64_t a1)
{
  return sub_1C2F5B8EC(a1, qword_1EA344948);
}

uint64_t sub_1C2F5B114()
{
  return sub_1C2F5E760(&qword_1EA344940, &qword_1EA3430B0, (uint64_t)qword_1EA344948);
}

uint64_t static RecentsUnknownCallersTip.knownStoryLaunchedEvent.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1C2F5E22C(&qword_1EA344940, (uint64_t)qword_1EA344948, a1);
}

uint64_t sub_1C2F5B164(uint64_t a1)
{
  return sub_1C2F5B8EC(a1, qword_1EA344968);
}

uint64_t sub_1C2F5B178()
{
  return sub_1C2F5E760(&qword_1EA344960, &qword_1EA3430B0, (uint64_t)qword_1EA344968);
}

uint64_t static RecentsUnknownCallersTip.knownCallersDoneEvent.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1C2F5E22C(&qword_1EA344960, (uint64_t)qword_1EA344968, a1);
}

unint64_t RecentsUnknownCallersTip.id.getter()
{
  return 0xD000000000000029;
}

uint64_t RecentsUnknownCallersTip.asset.getter()
{
  uint64_t v0 = (void *)sub_1C2F6E3C8();
  id v1 = objc_msgSend(self, sel_imageNamed_, v0);

  if (v1) {
    return sub_1C2F6E398();
  }
  else {
    return sub_1C2F6E3A8();
  }
}

void *sub_1C2F5B28C()
{
  return &unk_1E647C710;
}

unint64_t static RecentsUnknownCallersTip.spamBlockingAppsEditorialURLString.getter()
{
  return 0xD000000000000022;
}

uint64_t RecentsUnknownCallersTip.actions.getter()
{
  return sub_1C2F5DC70();
}

uint64_t RecentsUnknownCallersTip.rules.getter()
{
  return sub_1C2F5B318(qword_1EA344060, (uint64_t)qword_1EA344048);
}

uint64_t sub_1C2F5B318(void *a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3430F8);
  sub_1C2F6E298();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1C2F73460;
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3430B0);
  uint64_t v5 = __swift_project_value_buffer(v4, a2);
  MEMORY[0x1F4188790](v5);
  (*(void (**)(char *))(v7 + 16))((char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1C2F6E118();
  sub_1C2F59448(&qword_1EA343088);
  sub_1C2F59448(&qword_1EA343080);
  sub_1C2F6E2A8();
  sub_1C2F6E0F8();
  swift_bridgeObjectRelease();
  uint64_t v8 = sub_1C2F6E0F8();
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_1C2F5B530@<X0>(uint64_t *a1@<X8>)
{
  return sub_1C2F5EFC0(10, a1);
}

unint64_t sub_1C2F5B538()
{
  return 0xD000000000000029;
}

uint64_t sub_1C2F5B554()
{
  return RecentsUnknownCallersTip.actions.getter();
}

uint64_t sub_1C2F5B56C(uint64_t a1, uint64_t a2)
{
  return sub_1C2F5B5A4(a1, a2, qword_1EA344060, (uint64_t)qword_1EA344048);
}

uint64_t sub_1C2F5B5A4(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3430F8);
  sub_1C2F6E298();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1C2F73460;
  if (*a3 != -1) {
    swift_once();
  }
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3430B0);
  uint64_t v7 = __swift_project_value_buffer(v6, a4);
  MEMORY[0x1F4188790](v7);
  (*(void (**)(char *))(v9 + 16))((char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1C2F6E118();
  sub_1C2F59448(&qword_1EA343088);
  sub_1C2F59448(&qword_1EA343080);
  sub_1C2F6E2A8();
  sub_1C2F6E0F8();
  swift_bridgeObjectRelease();
  uint64_t v10 = sub_1C2F6E0F8();
  swift_bridgeObjectRelease();
  return v10;
}

void sub_1C2F5B7BC(void *a1@<X8>)
{
  *a1 = 0xD000000000000029;
  a1[1] = 0x80000001C2F76250;
}

uint64_t sub_1C2F5B7DC(uint64_t a1)
{
  return sub_1C2F5B8EC(a1, qword_1EA343CA8);
}

uint64_t sub_1C2F5B7F0()
{
  return sub_1C2F5E760(&qword_1EA343CC0, &qword_1EA3430B0, (uint64_t)qword_1EA343CA8);
}

uint64_t static LiveVoicemailTip.callScreenedEvent.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1C2F5E22C(&qword_1EA343CC0, (uint64_t)qword_1EA343CA8, a1);
}

uint64_t sub_1C2F5B840(uint64_t a1)
{
  return sub_1C2F5E178(a1, qword_1EA343BF8);
}

uint64_t sub_1C2F5B864()
{
  return sub_1C2F5E760(qword_1EA343C10, &qword_1EA3430B0, (uint64_t)qword_1EA343BF8);
}

uint64_t static LiveVoicemailTip.hasOpenedTip.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1C2F5E22C(qword_1EA343C10, (uint64_t)qword_1EA343BF8, a1);
}

uint64_t sub_1C2F5B8B4(uint64_t a1)
{
  return sub_1C2F5E178(a1, qword_1EA3442E8);
}

uint64_t sub_1C2F5B8D8(uint64_t a1)
{
  return sub_1C2F5B8EC(a1, qword_1EA344308);
}

uint64_t sub_1C2F5B8EC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3430B0);
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  sub_1C2F6E3D8();
  return sub_1C2F6E2D8();
}

uint64_t sub_1C2F5B950()
{
  return sub_1C2F5E760(&qword_1EA344320, &qword_1EA3430B0, (uint64_t)qword_1EA344308);
}

uint64_t static LiveVoicemailTip.onboardingViewedEvent.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1C2F5E22C(&qword_1EA344320, (uint64_t)qword_1EA344308, a1);
}

unint64_t LiveVoicemailTip.id.getter()
{
  return 0xD000000000000025;
}

uint64_t LiveVoicemailTip.options.getter()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3430A0);
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA343090);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3430E0);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_1C2F73450;
  uint64_t v9 = sub_1C2F6E278();
  uint64_t v10 = MEMORY[0x1E4F422C8];
  *(void *)(v8 + 56) = v9;
  *(void *)(v8 + 64) = v10;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v8 + 32));
  sub_1C2F6E1B8();
  uint64_t v11 = sub_1C2F6E168();
  uint64_t v12 = MEMORY[0x1E4F42248];
  *(void *)(v8 + 96) = v11;
  *(void *)(v8 + 104) = v12;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v8 + 72));
  sub_1C2F6E178();
  sub_1C2F6E128();
  swift_bridgeObjectRelease();
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  MEMORY[0x1C876D290](v7, v4, OpaqueTypeConformance2);
  v16[0] = v4;
  v16[1] = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  uint64_t v14 = sub_1C2F6E148();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v14;
}

uint64_t LiveVoicemailTip.title.getter()
{
  return sub_1C2F5DE68();
}

uint64_t LiveVoicemailTip.message.getter()
{
  return sub_1C2F5DEC4();
}

uint64_t sub_1C2F5BC44()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA342F38);
  __swift_allocate_value_buffer(v0, qword_1EA344F98);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EA344F98);
  TUCallScreeningDisabledUserDefault();
  return sub_1C2F6E348();
}

uint64_t sub_1C2F5BCF8()
{
  return sub_1C2F5E760(qword_1EA343CD0, &qword_1EA342F38, (uint64_t)qword_1EA344F98);
}

uint64_t sub_1C2F5BD24@<X0>(uint64_t a1@<X8>)
{
  return sub_1C2F5E7E4(qword_1EA343CD0, &qword_1EA342F38, (uint64_t)qword_1EA344F98, a1);
}

uint64_t sub_1C2F5BD50(uint64_t a1)
{
  return sub_1C2F5E8BC(a1, qword_1EA343CD0, &qword_1EA342F38, (uint64_t)qword_1EA344F98);
}

uint64_t (*sub_1C2F5BD7C())()
{
  if (qword_1EA343CD0[0] != -1) {
    swift_once();
  }
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA342F38);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EA344F98);
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1C2F5BE14()
{
  return sub_1C2F5D6AC(qword_1EA343CD0, (uint64_t)qword_1EA344F98);
}

uint64_t sub_1C2F5BE38(uint64_t a1)
{
  return sub_1C2F5D75C(a1, qword_1EA343CD0, (uint64_t)qword_1EA344F98);
}

uint64_t (*sub_1C2F5BE5C(void *a1))()
{
  uint64_t v2 = malloc(0x30uLL);
  *a1 = v2;
  if (qword_1EA343CD0[0] != -1) {
    swift_once();
  }
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA342F38);
  v2[3] = v3;
  v2[4] = __swift_project_value_buffer(v3, (uint64_t)qword_1EA344F98);
  swift_beginAccess();
  sub_1C2F6E328();
  char v4 = *((unsigned char *)v2 + 41);
  swift_endAccess();
  *((unsigned char *)v2 + 40) = v4;
  return sub_1C2F59D64;
}

void __swiftcall LiveVoicemailTip.init()()
{
  TUCallScreeningDisabledUserDefault();
  if (qword_1EA343CD0[0] != -1) {
    swift_once();
  }
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA342F38);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EA344F98);
  swift_beginAccess();
  sub_1C2F6E338();
  swift_endAccess();
}

uint64_t LiveVoicemailTip.rules.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3430F8);
  uint64_t v24 = *(void *)(*(void *)(sub_1C2F6E298() - 8) + 72);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_1C2F73470;
  uint64_t v22 = v0;
  if (qword_1EA343CC0 != -1) {
    swift_once();
  }
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3430B0);
  uint64_t v2 = __swift_project_value_buffer(v1, (uint64_t)qword_1EA343CA8);
  uint64_t v21 = (void (*)(char *))v20;
  uint64_t v3 = *(void *)(v1 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x1F4188790](v2);
  unint64_t v5 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v6 = *(void (**)(char *))(v3 + 16);
  v6((char *)v20 - v5);
  uint64_t v7 = sub_1C2F6E118();
  uint64_t v8 = sub_1C2F59448(&qword_1EA343088);
  sub_1C2F59448(&qword_1EA343080);
  uint64_t v23 = v7;
  sub_1C2F6E2A8();
  if (qword_1EA344300 != -1) {
    swift_once();
  }
  uint64_t v9 = __swift_project_value_buffer(v1, (uint64_t)qword_1EA3442E8);
  MEMORY[0x1F4188790](v9);
  v6((char *)v20 - v5);
  sub_1C2F6E2A8();
  if (qword_1EA343C10[0] != -1) {
    swift_once();
  }
  uint64_t v10 = __swift_project_value_buffer(v1, (uint64_t)qword_1EA343BF8);
  MEMORY[0x1F4188790](v10);
  v20[1] = v4;
  uint64_t v21 = v6;
  v6((char *)v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v20[2] = v8;
  sub_1C2F6E2A8();
  if (qword_1EA343CD0[0] != -1) {
    swift_once();
  }
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA342F38);
  uint64_t v12 = __swift_project_value_buffer(v11, (uint64_t)qword_1EA344F98);
  uint64_t v13 = swift_beginAccess();
  MEMORY[0x1F4188790](v13);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))((char *)v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), v12, v11);
  sub_1C2F6E2B8();
  if (qword_1EA344320 != -1) {
    swift_once();
  }
  uint64_t v16 = __swift_project_value_buffer(v1, (uint64_t)qword_1EA344308);
  MEMORY[0x1F4188790](v16);
  v21((char *)v20 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1C2F6E2A8();
  sub_1C2F6E0F8();
  swift_bridgeObjectRelease();
  uint64_t v18 = sub_1C2F6E0F8();
  swift_bridgeObjectRelease();
  return v18;
}

uint64_t sub_1C2F5C5E4@<X0>(uint64_t *a1@<X8>)
{
  return sub_1C2F5C830(0, MEMORY[0x1E4F27538], a1);
}

uint64_t sub_1C2F5C5F4@<X0>(uint64_t *a1@<X8>)
{
  return sub_1C2F5C830(3, MEMORY[0x1E4F27558], a1);
}

uint64_t sub_1C2F5C604@<X0>(char a1@<W1>, uint64_t *a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA343020);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = &v13[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1C2F6053C(&qword_1EA343018, &qword_1EA343020);
  sub_1C2F6DFD8();
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA342FA0);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = &v13[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v13[15] = a1;
  sub_1C2F6DFC8();
  a2[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA342F88);
  a2[4] = sub_1C2F5FF74();
  __swift_allocate_boxed_opaque_existential_1(a2);
  sub_1C2F6053C(&qword_1EA342F98, &qword_1EA342FA0);
  sub_1C2F6DF88();
  (*(void (**)(unsigned char *, uint64_t))(v9 + 8))(v11, v8);
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_1C2F5C830@<X0>(uint64_t a1@<X1>, unsigned int *a2@<X2>, uint64_t *a3@<X8>)
{
  uint64_t v27 = a1;
  uint64_t v28 = a2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA342FF0);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v29 = v4;
  uint64_t v30 = v5;
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA342FD8);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA343008);
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x1F4188790](v12);
  uint64_t v15 = (char *)&v26 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C2F6053C(&qword_1EA342FF8, &qword_1EA343008);
  sub_1C2F6DFD8();
  swift_getKeyPath();
  sub_1C2F6DF98();
  swift_release();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  swift_getKeyPath();
  sub_1C2F6053C(&qword_1EA342FC8, &qword_1EA342FD8);
  sub_1C2F6DF98();
  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA342FC0);
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x1F4188790](v16);
  unint64_t v19 = (char *)&v26 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = v27;
  sub_1C2F6DFC8();
  uint64_t v20 = sub_1C2F6DFB8();
  uint64_t v21 = *(void *)(v20 - 8);
  MEMORY[0x1F4188790](v20);
  uint64_t v23 = (char *)&v26 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v21 + 104))(v23, *v28, v20);
  a3[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA342F58);
  a3[4] = sub_1C2F6006C(&qword_1EA342F50, &qword_1EA342F58);
  __swift_allocate_boxed_opaque_existential_1(a3);
  sub_1C2F6053C(&qword_1EA342FE0, &qword_1EA342FF0);
  sub_1C2F6053C(&qword_1EA342FB8, &qword_1EA342FC0);
  uint64_t v24 = v29;
  sub_1C2F6DFA8();
  (*(void (**)(char *, uint64_t))(v21 + 8))(v23, v20);
  (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
  return (*(uint64_t (**)(char *, uint64_t))(v30 + 8))(v7, v24);
}

uint64_t LiveVoicemailTip.actions.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3435F0);
  sub_1C2F6E318();
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_1C2F73460;
  sub_1C2F6E3D8();
  sub_1C2F50D10();
  sub_1C2F5F550();
  sub_1C2F6E2F8();
  uint64_t v1 = sub_1C2F5F640(v0);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  return v1;
}

unint64_t sub_1C2F5CE70()
{
  return 0xD000000000000025;
}

uint64_t sub_1C2F5CE8C()
{
  return sub_1C2F5F410();
}

uint64_t sub_1C2F5CEA8()
{
  return sub_1C2F5F474();
}

uint64_t sub_1C2F5CEC4()
{
  return LiveVoicemailTip.actions.getter();
}

uint64_t sub_1C2F5CEDC()
{
  return LiveVoicemailTip.rules.getter();
}

uint64_t sub_1C2F5CEF4()
{
  return LiveVoicemailTip.options.getter();
}

void sub_1C2F5CF0C(void *a1@<X8>)
{
  *a1 = 0xD000000000000025;
  a1[1] = 0x80000001C2F762C0;
}

unint64_t FaceTimeLinkTip.id.getter()
{
  return 0xD000000000000019;
}

unint64_t sub_1C2F5CF50()
{
  return 0xD000000000000019;
}

uint64_t sub_1C2F5CF6C()
{
  return sub_1C2F6E0A8();
}

void sub_1C2F5CF84(void *a1@<X8>)
{
  *a1 = 0xD000000000000019;
  a1[1] = 0x80000001C2F76350;
}

unint64_t FaceInFrameTip.id.getter()
{
  return 0xD000000000000025;
}

unint64_t sub_1C2F5CFC8()
{
  return 0xD000000000000025;
}

void sub_1C2F5CFE4(void *a1@<X8>)
{
  *a1 = 0xD000000000000025;
  a1[1] = 0x80000001C2F76370;
}

uint64_t sub_1C2F5D004(uint64_t a1)
{
  return sub_1C2F5E178(a1, qword_1EA344990);
}

uint64_t sub_1C2F5D028()
{
  return sub_1C2F5E760(&qword_1EA344988, &qword_1EA3430B0, (uint64_t)qword_1EA344990);
}

uint64_t static VideoReactionPickerTip.hasOpenedReactionPicker.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1C2F5E22C(&qword_1EA344988, (uint64_t)qword_1EA344990, a1);
}

unint64_t VideoReactionPickerTip.id.getter()
{
  return 0xD00000000000001FLL;
}

uint64_t sub_1C2F5D098(uint64_t a1)
{
  return sub_1C2F5E688(a1, qword_1EA344FF8);
}

uint64_t sub_1C2F5D0C8()
{
  return sub_1C2F5E760(qword_1EA3449A8, &qword_1EA342F38, (uint64_t)qword_1EA344FF8);
}

uint64_t sub_1C2F5D0F4@<X0>(uint64_t a1@<X8>)
{
  return sub_1C2F5E7E4(qword_1EA3449A8, &qword_1EA342F38, (uint64_t)qword_1EA344FF8, a1);
}

uint64_t sub_1C2F5D120(uint64_t a1)
{
  return sub_1C2F5E8BC(a1, qword_1EA3449A8, &qword_1EA342F38, (uint64_t)qword_1EA344FF8);
}

uint64_t (*sub_1C2F5D14C())()
{
  if (qword_1EA3449A8[0] != -1) {
    swift_once();
  }
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA342F38);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EA344FF8);
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1C2F5D1E4()
{
  return sub_1C2F5D6AC(qword_1EA3449A8, (uint64_t)qword_1EA344FF8);
}

uint64_t sub_1C2F5D208(uint64_t a1)
{
  return sub_1C2F5D75C(a1, qword_1EA3449A8, (uint64_t)qword_1EA344FF8);
}

uint64_t (*sub_1C2F5D22C(void *a1))()
{
  uint64_t v2 = malloc(0x30uLL);
  *a1 = v2;
  if (qword_1EA3449A8[0] != -1) {
    swift_once();
  }
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA342F38);
  v2[3] = v3;
  v2[4] = __swift_project_value_buffer(v3, (uint64_t)qword_1EA344FF8);
  swift_beginAccess();
  sub_1C2F6E328();
  char v4 = *((unsigned char *)v2 + 41);
  swift_endAccess();
  *((unsigned char *)v2 + 40) = v4;
  return sub_1C2F59D64;
}

uint64_t VideoReactionPickerTip.rules.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3430F8);
  sub_1C2F6E298();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1C2F73450;
  if (qword_1EA344988 != -1) {
    swift_once();
  }
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3430B0);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EA344990);
  MEMORY[0x1F4188790](v1);
  (*(void (**)(char *))(v3 + 16))((char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1C2F6E118();
  sub_1C2F59448(&qword_1EA343088);
  sub_1C2F59448(&qword_1EA343080);
  sub_1C2F6E2A8();
  if (qword_1EA3449A8[0] != -1) {
    swift_once();
  }
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA342F38);
  uint64_t v5 = __swift_project_value_buffer(v4, (uint64_t)qword_1EA344FF8);
  uint64_t v6 = swift_beginAccess();
  MEMORY[0x1F4188790](v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v5, v4);
  sub_1C2F6E2B8();
  sub_1C2F6E0F8();
  swift_bridgeObjectRelease();
  uint64_t v9 = sub_1C2F6E0F8();
  swift_bridgeObjectRelease();
  return v9;
}

uint64_t sub_1C2F5D67C@<X0>(uint64_t *a1@<X8>)
{
  return sub_1C2F5EFC0(0, a1);
}

uint64_t static VideoReactionPickerTip.shouldShow.getter()
{
  return sub_1C2F5D6AC(qword_1EA3449A8, (uint64_t)qword_1EA344FF8);
}

uint64_t sub_1C2F5D6AC(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA342F38);
  __swift_project_value_buffer(v3, a2);
  swift_beginAccess();
  sub_1C2F6E328();
  swift_endAccess();
  return v5;
}

uint64_t static VideoReactionPickerTip.shouldShow.setter(uint64_t a1)
{
  return sub_1C2F5D75C(a1, qword_1EA3449A8, (uint64_t)qword_1EA344FF8);
}

uint64_t sub_1C2F5D75C(uint64_t a1, void *a2, uint64_t a3)
{
  if (*a2 != -1) {
    swift_once();
  }
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA342F38);
  __swift_project_value_buffer(v4, a3);
  swift_beginAccess();
  sub_1C2F6E338();
  return swift_endAccess();
}

uint64_t (*static VideoReactionPickerTip.shouldShow.modify(void *a1))()
{
  uint64_t v2 = malloc(0x30uLL);
  *a1 = v2;
  if (qword_1EA3449A8[0] != -1) {
    swift_once();
  }
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA342F38);
  v2[3] = v3;
  v2[4] = __swift_project_value_buffer(v3, (uint64_t)qword_1EA344FF8);
  swift_beginAccess();
  sub_1C2F6E328();
  char v4 = *((unsigned char *)v2 + 41);
  swift_endAccess();
  *((unsigned char *)v2 + 40) = v4;
  return sub_1C2F59D64;
}

void sub_1C2F5D8E0(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  *(unsigned char *)(*(void *)a1 + 41) = *(unsigned char *)(*(void *)a1 + 40);
  swift_beginAccess();
  sub_1C2F6E338();
  swift_endAccess();
  free(v1);
}

unint64_t sub_1C2F5D954()
{
  return 0xD00000000000001FLL;
}

uint64_t sub_1C2F5D970()
{
  return VideoReactionPickerTip.rules.getter();
}

void sub_1C2F5D988(void *a1@<X8>)
{
  *a1 = 0xD00000000000001FLL;
  a1[1] = 0x80000001C2F763A0;
}

unint64_t SOSMiniTip.id.getter()
{
  return 0xD000000000000019;
}

uint64_t _s11TelephonyUI12FavoritesTipV7optionsSay0D3Kit0D6Option_pGvg_0()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA343098);
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)&v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3430E8);
  uint64_t v4 = sub_1C2F6E1A8();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1C2F73460;
  sub_1C2F6E1B8();
  uint64_t v5 = MEMORY[0x1E4F42270];
  sub_1C2F6E138();
  swift_bridgeObjectRelease();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3430A8);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = v4;
  uint64_t v14 = v5;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  MEMORY[0x1C876D290](v3, v0, OpaqueTypeConformance2);
  uint64_t v13 = v0;
  uint64_t v14 = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  uint64_t v11 = sub_1C2F6E148();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v11;
}

uint64_t SOSMiniTip.actions.getter()
{
  return sub_1C2F5DC70();
}

uint64_t sub_1C2F5DC70()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3435F0);
  sub_1C2F6E318();
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_1C2F73460;
  sub_1C2F6E3D8();
  sub_1C2F5F550();
  sub_1C2F6E2F8();
  uint64_t v1 = sub_1C2F5F640(v0);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  return v1;
}

unint64_t sub_1C2F5DDD8()
{
  return 0xD000000000000019;
}

uint64_t sub_1C2F5DDF4()
{
  return SOSMiniTip.actions.getter();
}

void sub_1C2F5DE0C(void *a1@<X8>)
{
  *a1 = 0xD000000000000019;
  a1[1] = 0x80000001C2F763C0;
}

unint64_t CallHistorySearchTip.id.getter()
{
  return 0xD00000000000001ALL;
}

uint64_t CallHistorySearchTip.title.getter()
{
  return sub_1C2F5DE68();
}

uint64_t sub_1C2F5DE68()
{
  return sub_1C2F6E388();
}

uint64_t CallHistorySearchTip.message.getter()
{
  return sub_1C2F5DEC4();
}

uint64_t sub_1C2F5DEC4()
{
  return sub_1C2F6E388();
}

uint64_t CallHistorySearchTip.options.getter()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3430A0);
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA343090);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3430E0);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_1C2F73450;
  uint64_t v9 = sub_1C2F6E168();
  uint64_t v10 = MEMORY[0x1E4F42248];
  *(void *)(v8 + 56) = v9;
  *(void *)(v8 + 64) = v10;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v8 + 32));
  sub_1C2F6E178();
  uint64_t v11 = sub_1C2F6E1A8();
  uint64_t v12 = MEMORY[0x1E4F42270];
  *(void *)(v8 + 96) = v11;
  *(void *)(v8 + 104) = v12;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v8 + 72));
  sub_1C2F6E1B8();
  sub_1C2F6E128();
  swift_bridgeObjectRelease();
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  MEMORY[0x1C876D290](v7, v4, OpaqueTypeConformance2);
  v16[0] = v4;
  v16[1] = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  uint64_t v14 = sub_1C2F6E148();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v14;
}

uint64_t sub_1C2F5E154(uint64_t a1)
{
  return sub_1C2F5E178(a1, qword_1EA344328);
}

uint64_t sub_1C2F5E178(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3430B0);
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_1C2F6E2D8();
}

uint64_t sub_1C2F5E1DC()
{
  return sub_1C2F5E760(qword_1EA344340, &qword_1EA3430B0, (uint64_t)qword_1EA344328);
}

uint64_t static CallHistorySearchTip.hasSearchedCallHistory.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1C2F5E22C(qword_1EA344340, (uint64_t)qword_1EA344328, a1);
}

uint64_t sub_1C2F5E22C@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3430B0);
  uint64_t v6 = __swift_project_value_buffer(v5, a2);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v7(a3, v6, v5);
}

uint64_t sub_1C2F5E2C8()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA342F38);
  __swift_allocate_value_buffer(v0, qword_1EA344FC8);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EA344FC8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA343108);
  sub_1C2F6E198();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1C2F73460;
  sub_1C2F6E188();
  return sub_1C2F6E348();
}

uint64_t sub_1C2F5E408()
{
  return sub_1C2F5E760(qword_1EA3443E0, &qword_1EA342F38, (uint64_t)qword_1EA344FC8);
}

uint64_t sub_1C2F5E434@<X0>(uint64_t a1@<X8>)
{
  return sub_1C2F5E7E4(qword_1EA3443E0, &qword_1EA342F38, (uint64_t)qword_1EA344FC8, a1);
}

uint64_t sub_1C2F5E460(uint64_t a1)
{
  return sub_1C2F5E8BC(a1, qword_1EA3443E0, &qword_1EA342F38, (uint64_t)qword_1EA344FC8);
}

uint64_t (*sub_1C2F5E48C())()
{
  if (qword_1EA3443E0[0] != -1) {
    swift_once();
  }
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA342F38);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EA344FC8);
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1C2F5E524()
{
  return sub_1C2F5D6AC(qword_1EA3443E0, (uint64_t)qword_1EA344FC8);
}

uint64_t sub_1C2F5E548(uint64_t a1)
{
  return sub_1C2F5D75C(a1, qword_1EA3443E0, (uint64_t)qword_1EA344FC8);
}

uint64_t (*sub_1C2F5E56C(void *a1))()
{
  uint64_t v2 = malloc(0x30uLL);
  *a1 = v2;
  if (qword_1EA3443E0[0] != -1) {
    swift_once();
  }
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA342F38);
  v2[3] = v3;
  v2[4] = __swift_project_value_buffer(v3, (uint64_t)qword_1EA344FC8);
  swift_beginAccess();
  sub_1C2F6E328();
  char v4 = *((unsigned char *)v2 + 41);
  swift_endAccess();
  *((unsigned char *)v2 + 40) = v4;
  return sub_1C2F59D64;
}

uint64_t sub_1C2F5E658(uint64_t a1)
{
  return sub_1C2F5E688(a1, qword_1EA344FB0);
}

uint64_t sub_1C2F5E688(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA342F38);
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_1C2F6E348();
}

uint64_t sub_1C2F5E734()
{
  return sub_1C2F5E760(&qword_1EA3443D8, &qword_1EA342F38, (uint64_t)qword_1EA344FB0);
}

uint64_t sub_1C2F5E760(void *a1, uint64_t *a2, uint64_t a3)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a2);
  return __swift_project_value_buffer(v5, a3);
}

uint64_t sub_1C2F5E7B8@<X0>(uint64_t a1@<X8>)
{
  return sub_1C2F5E7E4(&qword_1EA3443D8, &qword_1EA342F38, (uint64_t)qword_1EA344FB0, a1);
}

uint64_t sub_1C2F5E7E4@<X0>(void *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v8 = __swift_project_value_buffer(v7, a3);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16))(a4, v8, v7);
}

uint64_t sub_1C2F5E890(uint64_t a1)
{
  return sub_1C2F5E8BC(a1, &qword_1EA3443D8, &qword_1EA342F38, (uint64_t)qword_1EA344FB0);
}

uint64_t sub_1C2F5E8BC(uint64_t a1, void *a2, uint64_t *a3, uint64_t a4)
{
  if (*a2 != -1) {
    swift_once();
  }
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(a3);
  uint64_t v8 = __swift_project_value_buffer(v7, a4);
  swift_beginAccess();
  uint64_t v9 = *(void *)(v7 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 24))(v8, a1, v7);
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(a1, v7);
}

uint64_t (*sub_1C2F5E9A4())()
{
  if (qword_1EA3443D8 != -1) {
    swift_once();
  }
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA342F38);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EA344FB0);
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1C2F5EA3C()
{
  return sub_1C2F5D6AC(&qword_1EA3443D8, (uint64_t)qword_1EA344FB0);
}

uint64_t sub_1C2F5EA60(uint64_t a1)
{
  return sub_1C2F5D75C(a1, &qword_1EA3443D8, (uint64_t)qword_1EA344FB0);
}

uint64_t (*sub_1C2F5EA84(void *a1))()
{
  uint64_t v2 = malloc(0x30uLL);
  *a1 = v2;
  if (qword_1EA3443D8 != -1) {
    swift_once();
  }
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA342F38);
  v2[3] = v3;
  v2[4] = __swift_project_value_buffer(v3, (uint64_t)qword_1EA344FB0);
  swift_beginAccess();
  sub_1C2F6E328();
  char v4 = *((unsigned char *)v2 + 41);
  swift_endAccess();
  *((unsigned char *)v2 + 40) = v4;
  return sub_1C2F59D64;
}

uint64_t CallHistorySearchTip.rules.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3430F8);
  uint64_t v0 = *(void *)(*(void *)(sub_1C2F6E298() - 8) + 72);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_1C2F73310;
  v17[1] = v1;
  if (qword_1EA344340[0] != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3430B0);
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1EA344328);
  MEMORY[0x1F4188790](v3);
  (*(void (**)(char *))(v5 + 16))((char *)v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1C2F6E118();
  sub_1C2F59448(&qword_1EA343088);
  sub_1C2F59448(&qword_1EA343080);
  sub_1C2F6E2A8();
  v17[0] = v0;
  if (qword_1EA3443E0[0] != -1) {
    swift_once();
  }
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA342F38);
  uint64_t v7 = __swift_project_value_buffer(v6, (uint64_t)qword_1EA344FC8);
  uint64_t v8 = swift_beginAccess();
  uint64_t v9 = *(void *)(v6 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  MEMORY[0x1F4188790](v8);
  unint64_t v11 = (v10 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  v12((char *)v17 - v11, v7, v6);
  sub_1C2F6E2B8();
  if (qword_1EA3443D8 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v6, (uint64_t)qword_1EA344FB0);
  uint64_t v14 = swift_beginAccess();
  MEMORY[0x1F4188790](v14);
  v12((char *)v17 - v11, v13, v6);
  sub_1C2F6E2B8();
  sub_1C2F6E0F8();
  swift_bridgeObjectRelease();
  uint64_t v15 = sub_1C2F6E0F8();
  swift_bridgeObjectRelease();
  return v15;
}

uint64_t sub_1C2F5EFC0@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v21 = a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA342FF0);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v22 = v3;
  uint64_t v23 = v4;
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA342FD8);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA343008);
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  uint64_t v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C2F6053C(&qword_1EA342FF8, &qword_1EA343008);
  sub_1C2F6DFD8();
  swift_getKeyPath();
  sub_1C2F6DF98();
  swift_release();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  swift_getKeyPath();
  sub_1C2F6053C(&qword_1EA342FC8, &qword_1EA342FD8);
  sub_1C2F6DF98();
  swift_release();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA342FC0);
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x1F4188790](v15);
  uint64_t v18 = (char *)&v21 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = v21;
  sub_1C2F6DFC8();
  a2[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA342F78);
  a2[4] = sub_1C2F6006C(&qword_1EA342F70, &qword_1EA342F78);
  __swift_allocate_boxed_opaque_existential_1(a2);
  sub_1C2F6053C(&qword_1EA342FE0, &qword_1EA342FF0);
  sub_1C2F6053C(&qword_1EA342FB8, &qword_1EA342FC0);
  uint64_t v19 = v22;
  sub_1C2F6DF88();
  (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
  return (*(uint64_t (**)(char *, uint64_t))(v23 + 8))(v6, v19);
}

uint64_t sub_1C2F5F3D0@<X0>(uint64_t *a1@<X8>)
{
  return sub_1C2F5C604(0, a1);
}

unint64_t sub_1C2F5F3D8()
{
  return 0xD00000000000001ALL;
}

uint64_t sub_1C2F5F3F4()
{
  return sub_1C2F5F410();
}

uint64_t sub_1C2F5F410()
{
  return sub_1C2F6E388();
}

uint64_t sub_1C2F5F458()
{
  return sub_1C2F5F474();
}

uint64_t sub_1C2F5F474()
{
  return sub_1C2F6E388();
}

uint64_t sub_1C2F5F4BC()
{
  return CallHistorySearchTip.rules.getter();
}

uint64_t sub_1C2F5F4D4()
{
  return CallHistorySearchTip.options.getter();
}

void sub_1C2F5F4EC(void *a1@<X8>)
{
  *a1 = 0xD00000000000001ALL;
  a1[1] = 0x80000001C2F763E0;
}

unint64_t sub_1C2F5F50C(uint64_t a1)
{
  uint64_t v2 = sub_1C2F6E658();
  return sub_1C2F5F5A4(a1, v2);
}

unint64_t sub_1C2F5F550()
{
  unint64_t result = qword_1EA3435E8;
  if (!qword_1EA3435E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3435E8);
  }
  return result;
}

unint64_t sub_1C2F5F5A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(void *)(v7 + 8 * result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(void *)(v7 + 8 * result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

uint64_t sub_1C2F5F640(uint64_t a1)
{
  uint64_t v45 = MEMORY[0x1E4FBC860];
  sub_1C2F601D8(0, 0, 0);
  uint64_t v2 = v45;
  uint64_t v3 = *(void *)(a1 + 16);
  sub_1C2F6E0F8();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA343620);
  uint64_t v5 = *(void *)(*(void *)(v4 - 8) + 64);
  uint64_t v6 = MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v6);
  uint64_t v10 = (char *)v34 - v9;
  uint64_t v40 = v3;
  v34[1] = a1;
  if (v3)
  {
    uint64_t v11 = v8;
    uint64_t v12 = sub_1C2F6E318();
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)(v12 - 8);
    uint64_t v15 = v14;
    unint64_t v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
    uint64_t v36 = *(void *)(v14 + 72);
    unint64_t v37 = v16;
    uint64_t v18 = v14 + 16;
    uint64_t v17 = *(void (**)(char *))(v14 + 16);
    v34[3] = v18;
    v35 = v17;
    uint64_t v38 = v15;
    uint64_t v39 = v12;
    uint64_t v19 = 0;
    uint64_t v20 = v11;
    do
    {
      uint64_t v43 = v20;
      MEMORY[0x1F4188790](v12);
      uint64_t v21 = (char *)v34 + *(int *)(v4 + 48) - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v42 = v22;
      v35(v21);
      uint64_t v23 = &v10[*(int *)(v4 + 48)];
      uint64_t v44 = v19;
      *(void *)uint64_t v10 = v19;
      v41 = *(void (**)(char *, char *, uint64_t))(v38 + 32);
      v41(v23, v21, v13);
      uint64_t v24 = sub_1C2F601F8((uint64_t)v10, (uint64_t)v7);
      MEMORY[0x1F4188790](v24);
      uint64_t v26 = (char *)v34 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
      sub_1C2F6E308();
      sub_1C2F60260((uint64_t)v7);
      uint64_t v2 = v45;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1C2F601D8(0, *(void *)(v2 + 16) + 1, 1);
        uint64_t v2 = v45;
      }
      unint64_t v28 = *(void *)(v2 + 16);
      unint64_t v27 = *(void *)(v2 + 24);
      uint64_t v29 = v39;
      uint64_t v30 = v44;
      if (v28 >= v27 >> 1)
      {
        sub_1C2F601D8(v27 > 1, v28 + 1, 1);
        uint64_t v29 = v39;
        uint64_t v2 = v45;
      }
      uint64_t v44 = v30 + 1;
      *(void *)(v2 + 16) = v28 + 1;
      uint64_t v13 = v29;
      ((void (*)(unint64_t, char *))v41)(v2 + v37 + v28 * v36, v26);
      uint64_t v45 = v2;
      uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA343620);
      uint64_t v5 = *(void *)(*(void *)(v4 - 8) + 64);
      uint64_t v31 = MEMORY[0x1F4188790](v4);
      uint64_t v7 = (char *)v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v12 = MEMORY[0x1F4188790](v31);
      uint64_t v10 = (char *)v34 - v32;
      uint64_t v19 = v44;
    }
    while (v40 != v44);
  }
  swift_bridgeObjectRelease();
  return v2;
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

unint64_t sub_1C2F5FA80()
{
  unint64_t result = qword_1EA343040;
  if (!qword_1EA343040)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA343040);
  }
  return result;
}

uint64_t sub_1C2F5FAD4()
{
  return MEMORY[0x1E4FBB1B0];
}

unint64_t sub_1C2F5FAE4()
{
  unint64_t result = qword_1EA3435F8;
  if (!qword_1EA3435F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3435F8);
  }
  return result;
}

unint64_t sub_1C2F5FB3C()
{
  unint64_t result = qword_1EA343058;
  if (!qword_1EA343058)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA343058);
  }
  return result;
}

unint64_t sub_1C2F5FB94()
{
  unint64_t result = qword_1EA343070;
  if (!qword_1EA343070)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA343070);
  }
  return result;
}

unint64_t sub_1C2F5FBEC()
{
  unint64_t result = qword_1EA343060;
  if (!qword_1EA343060)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA343060);
  }
  return result;
}

uint64_t sub_1C2F5FC40()
{
  return MEMORY[0x1E4F3F048];
}

unint64_t sub_1C2F5FC50()
{
  unint64_t result = qword_1EA343068;
  if (!qword_1EA343068)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA343068);
  }
  return result;
}

unint64_t sub_1C2F5FCA8()
{
  unint64_t result = qword_1EA343050;
  if (!qword_1EA343050)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA343050);
  }
  return result;
}

unint64_t sub_1C2F5FD00()
{
  unint64_t result = qword_1EA343600;
  if (!qword_1EA343600)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA343600);
  }
  return result;
}

unint64_t sub_1C2F5FD58()
{
  unint64_t result = qword_1EA343608;
  if (!qword_1EA343608)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA343608);
  }
  return result;
}

unint64_t sub_1C2F5FDB0()
{
  unint64_t result = qword_1EA343610;
  if (!qword_1EA343610)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA343610);
  }
  return result;
}

unint64_t sub_1C2F5FE08()
{
  unint64_t result = qword_1EA343618;
  if (!qword_1EA343618)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA343618);
  }
  return result;
}

unint64_t sub_1C2F5FE60()
{
  unint64_t result = qword_1EA343100;
  if (!qword_1EA343100)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA343100);
  }
  return result;
}

ValueMetadata *type metadata accessor for FavoritesTip()
{
  return &type metadata for FavoritesTip;
}

ValueMetadata *type metadata accessor for SpeakerphoneTip()
{
  return &type metadata for SpeakerphoneTip;
}

ValueMetadata *type metadata accessor for RecentsSaveAsContactTip()
{
  return &type metadata for RecentsSaveAsContactTip;
}

ValueMetadata *type metadata accessor for RecentsSaveAsFavoritesTip()
{
  return &type metadata for RecentsSaveAsFavoritesTip;
}

ValueMetadata *type metadata accessor for RecentsBrandedCallingTip()
{
  return &type metadata for RecentsBrandedCallingTip;
}

ValueMetadata *type metadata accessor for RecentsUnknownCallersTip()
{
  return &type metadata for RecentsUnknownCallersTip;
}

ValueMetadata *type metadata accessor for LiveVoicemailTip()
{
  return &type metadata for LiveVoicemailTip;
}

ValueMetadata *type metadata accessor for FaceTimeLinkTip()
{
  return &type metadata for FaceTimeLinkTip;
}

ValueMetadata *type metadata accessor for FaceInFrameTip()
{
  return &type metadata for FaceInFrameTip;
}

ValueMetadata *type metadata accessor for VideoReactionPickerTip()
{
  return &type metadata for VideoReactionPickerTip;
}

ValueMetadata *type metadata accessor for SOSMiniTip()
{
  return &type metadata for SOSMiniTip;
}

ValueMetadata *type metadata accessor for CallHistorySearchTip()
{
  return &type metadata for CallHistorySearchTip;
}

unint64_t sub_1C2F5FF74()
{
  unint64_t result = qword_1EA342F80;
  if (!qword_1EA342F80)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA342F88);
    sub_1C2F6053C(&qword_1EA343010, &qword_1EA343020);
    sub_1C2F60580(&qword_1EA342F90, &qword_1EA342FA0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA342F80);
  }
  return result;
}

uint64_t sub_1C2F6001C()
{
  return sub_1C2F59448(&qword_1EA343088);
}

uint64_t sub_1C2F60044()
{
  return sub_1C2F59448(&qword_1EA343080);
}

uint64_t sub_1C2F6006C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    sub_1C2F600F0();
    sub_1C2F6053C(&qword_1EA342FA8, &qword_1EA342FC0);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1C2F600F0()
{
  unint64_t result = qword_1EA342FE8;
  if (!qword_1EA342FE8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA342FF0);
    sub_1C2F60158();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA342FE8);
  }
  return result;
}

unint64_t sub_1C2F60158()
{
  unint64_t result = qword_1EA342FD0;
  if (!qword_1EA342FD0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA342FD8);
    sub_1C2F6053C(&qword_1EA343000, &qword_1EA343008);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA342FD0);
  }
  return result;
}

size_t sub_1C2F601D8(size_t a1, int64_t a2, char a3)
{
  size_t result = sub_1C2F602C0(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_1C2F601F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA343620);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C2F60260(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA343620);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

size_t sub_1C2F602C0(size_t result, int64_t a2, char a3, void *a4)
{
  char v5 = result;
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_30:
        __break(1u);
        return result;
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    uint64_t v13 = (void *)MEMORY[0x1E4FBC860];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3435F0);
  uint64_t v10 = *(void *)(sub_1C2F6E318() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t result = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_29;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  uint64_t v15 = *(void *)(sub_1C2F6E318() - 8);
  if (v5)
  {
    if (v13 < a4
      || (unint64_t v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80),
          (char *)v13 + v16 >= (char *)a4 + v16 + *(void *)(v15 + 72) * v8))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return (size_t)v13;
}

unint64_t sub_1C2F60494()
{
  unint64_t result = qword_1EA342F60;
  if (!qword_1EA342F60)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA342F68);
    sub_1C2F6053C(&qword_1EA343028, &qword_1EA343038);
    sub_1C2F60580(&qword_1EA342FB0, &qword_1EA342FC0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA342F60);
  }
  return result;
}

uint64_t sub_1C2F6053C(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_1C2F60580(unint64_t *a1, uint64_t *a2)
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

uint64_t TaskQueue.__allocating_init(priority:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  TaskQueue.init(priority:)(a1);
  return v2;
}

uint64_t TaskQueue.init(priority:)(uint64_t a1)
{
  uint64_t v38 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA343150);
  ((void (*)(void))MEMORY[0x1F4188790])();
  unint64_t v37 = (char *)&v32 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA343160);
  uint64_t v4 = *(void *)(v3 - 8);
  ((void (*)(void))MEMORY[0x1F4188790])();
  unint64_t v6 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA343188);
  uint64_t v7 = *(void *)(v36 - 8);
  uint64_t v8 = ((uint64_t (*)(void))MEMORY[0x1F4188790])();
  v35 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = v9;
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)&v32 - v10;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA343178);
  uint64_t v13 = MEMORY[0x1F4188790](v12 - 8);
  uint64_t v15 = (char *)&v32 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v13);
  uint64_t v17 = (char *)&v32 - v16;
  uint64_t v39 = v1;
  swift_defaultActor_initialize();
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA343168);
  uint64_t v19 = *(void *)(v18 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v19 + 56))(v17, 1, 1, v18);
  uint64_t v40 = v17;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA343148);
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, *MEMORY[0x1E4FBD028], v3);
  v33 = v11;
  sub_1C2F6E4F8();
  v34 = v17;
  sub_1C2F60BB8((uint64_t)v17, (uint64_t)v15);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v19 + 48))(v15, 1, v18);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v19 + 32))(v39 + OBJC_IVAR____TtC11TelephonyUI9TaskQueue_continuation, v15, v18);
    uint64_t v21 = sub_1C2F6E4A8();
    uint64_t v22 = *(void *)(v21 - 8);
    uint64_t v24 = (uint64_t)v37;
    uint64_t v23 = v38;
    (*(void (**)(char *, uint64_t, uint64_t))(v22 + 16))(v37, v38, v21);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v22 + 56))(v24, 0, 1, v21);
    uint64_t v25 = v35;
    uint64_t v26 = v36;
    unint64_t v27 = v33;
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v35, v33, v36);
    unint64_t v28 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
    uint64_t v29 = swift_allocObject();
    *(void *)(v29 + 16) = 0;
    *(void *)(v29 + 24) = 0;
    (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v29 + v28, v25, v26);
    uint64_t v30 = sub_1C2F51FE4(v24, (uint64_t)&unk_1EA343630, v29);
    (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v23, v21);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v27, v26);
    uint64_t v31 = v39;
    *(void *)(v39 + OBJC_IVAR____TtC11TelephonyUI9TaskQueue_taskHandle) = v30;
    sub_1C2F589A8((uint64_t)v34, &qword_1EA343178);
    return v31;
  }
  return result;
}

uint64_t sub_1C2F60AE8(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 16);
  sub_1C2F589A8(v3, &qword_1EA343178);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA343168);
  uint64_t v7 = *(void *)(v4 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v3, a1, v4);
  uint64_t v5 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v7 + 56);
  return v5(v3, 0, 1, v4);
}

uint64_t sub_1C2F60BB8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA343178);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C2F60C20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[4] = a4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA343180);
  v4[5] = v5;
  v4[6] = *(void *)(v5 - 8);
  v4[7] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1C2F60CE4, 0, 0);
}

uint64_t sub_1C2F60CE4()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA343188);
  sub_1C2F6E4D8();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v1;
  void *v1 = v0;
  v1[1] = sub_1C2F60DB4;
  uint64_t v2 = *(void *)(v0 + 40);
  return MEMORY[0x1F4187D58](v0 + 16, 0, 0, v2);
}

uint64_t sub_1C2F60DB4()
{
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_1C2F60EB0, 0, 0);
}

uint64_t sub_1C2F60EB0()
{
  uint64_t v1 = (int *)v0[2];
  v0[9] = v1;
  if (v1)
  {
    v0[10] = v0[3];
    uint64_t v5 = (uint64_t (*)(void))((char *)v1 + *v1);
    uint64_t v2 = (void *)swift_task_alloc();
    v0[11] = v2;
    void *v2 = v0;
    v2[1] = sub_1C2F60FE0;
    return v5();
  }
  else
  {
    (*(void (**)(void, void))(v0[6] + 8))(v0[7], v0[5]);
    swift_task_dealloc();
    uint64_t v4 = (uint64_t (*)(void))v0[1];
    return v4();
  }
}

uint64_t sub_1C2F60FE0()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 72);
  uint64_t v3 = *v0;
  swift_task_dealloc();
  sub_1C2F645AC(v2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 64) = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_1C2F60DB4;
  uint64_t v5 = *(void *)(v1 + 40);
  return MEMORY[0x1F4187D58](v1 + 16, 0, 0, v5);
}

uint64_t sub_1C2F61190()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA343188);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x1F4186498](v0, v5, v6);
}

uint64_t sub_1C2F61260()
{
  uint64_t v2 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EA343188) - 8);
  uint64_t v3 = v0 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_1C2F58B84;
  return sub_1C2F60C20((uint64_t)v4, v5, v6, v3);
}

uint64_t sub_1C2F61330(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_1C2F6E4A8();
  uint64_t v9 = *(void *)(v8 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(a1, 1, v8) != 1)
  {
    sub_1C2F6E498();
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(a1, v8);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_1C2F589A8(a1, &qword_1EA343150);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1C2F6E418();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v10 = (void *)swift_allocObject();
  v10[2] = a4;
  v10[3] = a2;
  v10[4] = a3;
  return swift_task_create();
}

uint64_t sub_1C2F614DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[5] = a4;
  void v5[6] = v4;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  return MEMORY[0x1F4188298](sub_1C2F61504, 0, 0);
}

uint64_t sub_1C2F61504()
{
  uint64_t v1 = swift_task_alloc();
  *(void *)(v0 + 56) = v1;
  long long v2 = *(_OWORD *)(v0 + 24);
  *(_OWORD *)(v1 + 16) = *(_OWORD *)(v0 + 40);
  *(_OWORD *)(v1 + 32) = v2;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_1C2F615F0;
  uint64_t v4 = *(void *)(v0 + 40);
  uint64_t v5 = *(void *)(v0 + 16);
  return MEMORY[0x1F41880D8](v5, 0, 0, 0x293A5F28636E7973, 0xE800000000000000, sub_1C2F61938, v1, v4);
}

uint64_t sub_1C2F615F0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1C2F61700(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v23 = a3;
  uint64_t v24 = a4;
  uint64_t v8 = sub_1C2F6E448();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  MEMORY[0x1F4188790](v8);
  uint64_t v12 = (char *)v22 - v11;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA343158);
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x1F4188790](v13);
  uint64_t v16 = (char *)v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22[1] = a2 + OBJC_IVAR____TtC11TelephonyUI9TaskQueue_continuation;
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v12, a1, v8);
  unint64_t v17 = (*(unsigned __int8 *)(v9 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = a5;
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v18 + v17, v12, v8);
  uint64_t v19 = (void *)(v18 + ((v10 + v17 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v20 = v24;
  *uint64_t v19 = v23;
  v19[1] = v20;
  uint64_t v25 = &unk_1EA3436D0;
  uint64_t v26 = v18;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA343168);
  sub_1C2F6E4B8();
  return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v16, v13);
}

uint64_t sub_1C2F61938(uint64_t a1)
{
  return sub_1C2F61700(a1, v1[3], v1[4], v1[5], v1[2]);
}

uint64_t sub_1C2F61944(uint64_t a1, uint64_t a2, int *a3, uint64_t a4, uint64_t a5)
{
  v5[2] = a2;
  v5[3] = a5;
  uint64_t v7 = swift_task_alloc();
  v5[4] = v7;
  uint64_t v10 = (uint64_t (*)(uint64_t))((char *)a3 + *a3);
  uint64_t v8 = (void *)swift_task_alloc();
  v5[5] = v8;
  void *v8 = v5;
  v8[1] = sub_1C2F61A50;
  return v10(v7);
}

uint64_t sub_1C2F61A50()
{
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_1C2F61B4C, 0, 0);
}

uint64_t sub_1C2F61B4C()
{
  sub_1C2F6E448();
  sub_1C2F6E438();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1C2F61BD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[5] = a4;
  void v5[6] = v4;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  return MEMORY[0x1F4188298](sub_1C2F61C00, 0, 0);
}

uint64_t sub_1C2F61C00()
{
  uint64_t v1 = swift_task_alloc();
  *(void *)(v0 + 56) = v1;
  long long v2 = *(_OWORD *)(v0 + 24);
  *(_OWORD *)(v1 + 16) = *(_OWORD *)(v0 + 40);
  *(_OWORD *)(v1 + 32) = v2;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_1C2F61CF0;
  uint64_t v4 = *(void *)(v0 + 40);
  uint64_t v5 = *(void *)(v0 + 16);
  return MEMORY[0x1F4188160](v5, 0, 0, 0xD000000000000010, 0x80000001C2F76570, sub_1C2F620D0, v1, v4);
}

uint64_t sub_1C2F61CF0()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 72) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x1F4188298](sub_1C2F61E2C, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_1C2F61E2C()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1C2F61E90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v23 = a3;
  uint64_t v24 = a4;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA342F48);
  uint64_t v8 = sub_1C2F6E448();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  MEMORY[0x1F4188790](v8);
  uint64_t v12 = (char *)v22 - v11;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA343158);
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x1F4188790](v13);
  uint64_t v16 = (char *)v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22[1] = a2 + OBJC_IVAR____TtC11TelephonyUI9TaskQueue_continuation;
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v12, a1, v8);
  unint64_t v17 = (*(unsigned __int8 *)(v9 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = a5;
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v18 + v17, v12, v8);
  uint64_t v19 = (void *)(v18 + ((v10 + v17 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v20 = v24;
  *uint64_t v19 = v23;
  v19[1] = v20;
  uint64_t v25 = &unk_1EA3436C0;
  uint64_t v26 = v18;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA343168);
  sub_1C2F6E4B8();
  return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v16, v13);
}

uint64_t sub_1C2F620D0(uint64_t a1)
{
  return sub_1C2F61E90(a1, v1[3], v1[4], v1[5], v1[2]);
}

uint64_t sub_1C2F620DC(uint64_t a1, uint64_t a2, int *a3, uint64_t a4, uint64_t a5)
{
  v5[3] = a2;
  v5[4] = a5;
  uint64_t v7 = swift_task_alloc();
  v5[5] = v7;
  uint64_t v10 = (uint64_t (*)(uint64_t))((char *)a3 + *a3);
  uint64_t v8 = (void *)swift_task_alloc();
  void v5[6] = v8;
  void *v8 = v5;
  v8[1] = sub_1C2F621E8;
  return v10(v7);
}

uint64_t sub_1C2F621E8()
{
  *(void *)(*(void *)v1 + 56) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_1C2F6239C;
  }
  else {
    uint64_t v2 = sub_1C2F622FC;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1C2F622FC()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA342F48);
  sub_1C2F6E448();
  sub_1C2F6E438();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1C2F6239C()
{
  v0[2] = v0[7];
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA342F48);
  sub_1C2F6E448();
  sub_1C2F6E428();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_1C2F62444(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA343150);
  MEMORY[0x1F4188790](v6 - 8);
  uint64_t v8 = (char *)v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1C2F6E4A8();
  uint64_t v10 = *(void *)(v9 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, 1, 1, v9);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = v3;
  v11[5] = a1;
  v11[6] = a2;
  LODWORD(a1) = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9);
  swift_retain();
  swift_retain();
  if (a1 == 1)
  {
    sub_1C2F589A8((uint64_t)v8, &qword_1EA343150);
    uint64_t v12 = 0;
    uint64_t v13 = 0;
  }
  else
  {
    sub_1C2F6E498();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v8, v9);
    if (v11[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v12 = sub_1C2F6E418();
      uint64_t v13 = v14;
      swift_unknownObjectRelease();
    }
    else
    {
      uint64_t v12 = 0;
      uint64_t v13 = 0;
    }
  }
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = &unk_1EA343650;
  *(void *)(v15 + 24) = v11;
  if (v13 | v12)
  {
    v17[0] = 0;
    v17[1] = 0;
    void v17[2] = v12;
    v17[3] = v13;
  }
  return swift_task_create();
}

uint64_t sub_1C2F62698(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[4] = a5;
  v6[5] = a6;
  v6[2] = a1;
  v6[3] = a4;
  return MEMORY[0x1F4188298](sub_1C2F626BC, 0, 0);
}

uint64_t sub_1C2F626BC()
{
  uint64_t v1 = *(void *)(v0 + 40);
  uint64_t v2 = swift_task_alloc();
  *(void *)(v0 + 48) = v2;
  *(_OWORD *)(v2 + 16) = *(_OWORD *)(v0 + 24);
  *(void *)(v2 + 32) = v1;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_1C2F627B8;
  uint64_t v4 = *(void *)(v0 + 16);
  uint64_t v5 = MEMORY[0x1E4FBC848] + 8;
  return MEMORY[0x1F41880D8](v4, 0, 0, 0x3A5F28636E797361, 0xE900000000000029, sub_1C2F63F94, v2, v5);
}

uint64_t sub_1C2F627B8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1C2F628C8()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return MEMORY[0x1F4186498](v0, 56, 7);
}

uint64_t sub_1C2F62910(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 48);
  uint64_t v5 = swift_task_alloc();
  long long v6 = *(_OWORD *)(v1 + 32);
  *(void *)(v2 + 16) = v5;
  *(void *)uint64_t v5 = v2;
  *(void *)(v5 + 8) = sub_1C2F58B84;
  *(void *)(v5 + 40) = v4;
  *(_OWORD *)(v5 + 24) = v6;
  *(void *)(v5 + 16) = a1;
  return MEMORY[0x1F4188298](sub_1C2F626BC, 0, 0);
}

uint64_t sub_1C2F629D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v18 = a3;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3436A0);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA343158);
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  uint64_t v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = a2 + OBJC_IVAR____TtC11TelephonyUI9TaskQueue_continuation;
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v7);
  unint64_t v14 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v18;
  *(void *)(v15 + 24) = a4;
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v15 + v14, (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
  uint64_t v19 = &unk_1EA3436B0;
  uint64_t v20 = v15;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA343168);
  sub_1C2F6E4B8();
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

uint64_t sub_1C2F62BEC(uint64_t a1, int *a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  uint64_t v7 = (uint64_t (*)(void))((char *)a2 + *a2);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 24) = v5;
  void *v5 = v4;
  v5[1] = sub_1C2F62CBC;
  return v7();
}

uint64_t sub_1C2F62CBC()
{
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_1C2F62DB8, 0, 0);
}

uint64_t sub_1C2F62DB8()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3436A0);
  sub_1C2F6E438();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1C2F62E28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA343150);
  MEMORY[0x1F4188790](v8 - 8);
  uint64_t v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1C2F6E4A8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 1, 1, v11);
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  void v12[4] = a3;
  v12[5] = v4;
  v12[6] = a1;
  v12[7] = a2;
  swift_retain();
  swift_retain();
  return sub_1C2F61330((uint64_t)v10, (uint64_t)&unk_1EA343668, (uint64_t)v12, a3);
}

uint64_t sub_1C2F62F48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[5] = a6;
  v7[6] = a7;
  v7[3] = a4;
  v7[4] = a5;
  v7[2] = a1;
  return MEMORY[0x1F4188298](sub_1C2F62F70, 0, 0);
}

uint64_t sub_1C2F62F70()
{
  uint64_t v2 = *(void *)(v0 + 40);
  uint64_t v1 = *(void *)(v0 + 48);
  uint64_t v3 = swift_task_alloc();
  *(void *)(v0 + 56) = v3;
  long long v4 = *(_OWORD *)(v0 + 24);
  *(void *)(v3 + 16) = v1;
  *(_OWORD *)(v3 + 24) = v4;
  *(void *)(v3 + 40) = v2;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v5;
  void *v5 = v0;
  v5[1] = sub_1C2F645C4;
  uint64_t v6 = *(void *)(v0 + 48);
  uint64_t v7 = *(void *)(v0 + 16);
  return MEMORY[0x1F41880D8](v7, 0, 0, 0x3A5F28636E797361, 0xE900000000000029, sub_1C2F63DAC, v3, v6);
}

uint64_t sub_1C2F63070(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v21 = a4;
  uint64_t v19 = a3;
  uint64_t v7 = sub_1C2F6E448();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)&v18 - v9;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA343158);
  uint64_t v11 = *(void *)(v20 - 8);
  MEMORY[0x1F4188790](v20);
  uint64_t v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a1, v7);
  unint64_t v14 = (*(unsigned __int8 *)(v8 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v15 = (char *)swift_allocObject();
  uint64_t v16 = v19;
  *((void *)v15 + 2) = a5;
  *((void *)v15 + 3) = v16;
  *((void *)v15 + 4) = v21;
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(&v15[v14], v10, v7);
  uint64_t v22 = &unk_1EA343698;
  uint64_t v23 = v15;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA343168);
  sub_1C2F6E4B8();
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v20);
}

uint64_t sub_1C2F6329C(uint64_t a1, int *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[2] = a4;
  v5[3] = a5;
  v5[4] = *(void *)(a5 - 8);
  v5[5] = swift_task_alloc();
  uint64_t v7 = swift_task_alloc();
  void v5[6] = v7;
  uint64_t v10 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v8 = (void *)swift_task_alloc();
  v5[7] = v8;
  void *v8 = v5;
  v8[1] = sub_1C2F633E4;
  return v10(v7);
}

uint64_t sub_1C2F633E4()
{
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_1C2F634E0, 0, 0);
}

uint64_t sub_1C2F634E0()
{
  uint64_t v1 = v0[6];
  uint64_t v2 = v0[3];
  uint64_t v3 = v0[4];
  (*(void (**)(void, uint64_t, uint64_t))(v3 + 16))(v0[5], v1, v2);
  sub_1C2F6E448();
  sub_1C2F6E438();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  long long v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t TaskQueue.deinit()
{
  if (*(void *)(v0 + OBJC_IVAR____TtC11TelephonyUI9TaskQueue_taskHandle)) {
    sub_1C2F6E508();
  }
  uint64_t v1 = v0 + OBJC_IVAR____TtC11TelephonyUI9TaskQueue_continuation;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA343168);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t TaskQueue.__deallocating_deinit()
{
  if (*(void *)(v0 + OBJC_IVAR____TtC11TelephonyUI9TaskQueue_taskHandle)) {
    sub_1C2F6E508();
  }
  uint64_t v1 = v0 + OBJC_IVAR____TtC11TelephonyUI9TaskQueue_continuation;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA343168);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  swift_defaultActor_destroy();
  return MEMORY[0x1F4188210](v0);
}

uint64_t TaskQueue.unownedExecutor.getter()
{
  return v0;
}

uint64_t sub_1C2F63740()
{
  return v0;
}

uint64_t sub_1C2F6374C()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1C2F63784()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return MEMORY[0x1F4186498](v0, 64, 7);
}

uint64_t sub_1C2F637CC(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 32);
  uint64_t v5 = *(void *)(v1 + 56);
  uint64_t v6 = swift_task_alloc();
  long long v7 = *(_OWORD *)(v1 + 40);
  *(void *)(v2 + 16) = v6;
  *(void *)uint64_t v6 = v2;
  *(void *)(v6 + 8) = sub_1C2F58B84;
  *(void *)(v6 + 40) = v5;
  *(void *)(v6 + 48) = v4;
  *(_OWORD *)(v6 + 24) = v7;
  *(void *)(v6 + 16) = a1;
  return MEMORY[0x1F4188298](sub_1C2F62F70, 0, 0);
}

uint64_t sub_1C2F63894()
{
  return type metadata accessor for TaskQueue();
}

uint64_t type metadata accessor for TaskQueue()
{
  uint64_t result = qword_1EA3445D0;
  if (!qword_1EA3445D0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1C2F638E8()
{
  sub_1C2F63C50();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for TaskQueue(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for TaskQueue);
}

uint64_t dispatch thunk of TaskQueue.__allocating_init(priority:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of TaskQueue.sync<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)v4 + 112)
                                                                   + **(int **)(*(void *)v4 + 112));
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v10;
  *uint64_t v10 = v5;
  v10[1] = sub_1C2F58B84;
  return v12(a1, a2, a3, a4);
}

uint64_t dispatch thunk of TaskQueue.throwingSync<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)v4 + 120)
                                                                   + **(int **)(*(void *)v4 + 120));
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v10;
  *uint64_t v10 = v5;
  v10[1] = sub_1C2F58770;
  return v12(a1, a2, a3, a4);
}

uint64_t dispatch thunk of TaskQueue.async(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of TaskQueue.async<A>(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

void sub_1C2F63C50()
{
  if (!qword_1EA343170)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA343148);
    unint64_t v0 = sub_1C2F6E4C8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EA343170);
    }
  }
}

uint64_t sub_1C2F63CAC()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1C2F63CE4(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 24);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_1C2F58B84;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1EA343680 + dword_1EA343680);
  return v6(a1, v4);
}

uint64_t sub_1C2F63DAC(uint64_t a1)
{
  return sub_1C2F63070(a1, v1[3], v1[4], v1[5], v1[2]);
}

uint64_t sub_1C2F63DB8()
{
  uint64_t v1 = sub_1C2F6E448();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x1F4186498](v0, v5, v6);
}

uint64_t sub_1C2F63E98()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = *(void *)(sub_1C2F6E448() - 8);
  uint64_t v4 = (int *)v0[3];
  uint64_t v5 = v0[4];
  uint64_t v6 = (uint64_t)v0 + ((*(unsigned __int8 *)(v3 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  long long v7 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v7;
  *long long v7 = v1;
  v7[1] = sub_1C2F58B84;
  return sub_1C2F6329C((uint64_t)v7, v4, v5, v6, v2);
}

uint64_t sub_1C2F63F94(uint64_t a1)
{
  return sub_1C2F629D4(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_1C2F63FA0()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3436A0);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x1F4186498](v0, v5, v6);
}

uint64_t sub_1C2F64070()
{
  uint64_t v2 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EA3436A0) - 8);
  uint64_t v3 = *(int **)(v0 + 16);
  uint64_t v4 = v0 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_1C2F58B84;
  v5[2] = v4;
  uint64_t v8 = (uint64_t (*)(void))((char *)v3 + *v3);
  uint64_t v6 = (void *)swift_task_alloc();
  v5[3] = v6;
  *uint64_t v6 = v5;
  v6[1] = sub_1C2F62CBC;
  return v8();
}

uint64_t sub_1C2F641D0()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA342F48);
  uint64_t v1 = sub_1C2F6E448();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();
  return MEMORY[0x1F4186498](v0, v6, v5);
}

uint64_t sub_1C2F64298()
{
  uint64_t v2 = *(void *)(v0 + 16);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA342F48);
  uint64_t v3 = *(void *)(sub_1C2F6E448() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = v0 + v4;
  uint64_t v6 = v0 + ((*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8);
  long long v7 = *(int **)v6;
  uint64_t v8 = *(void *)(v6 + 8);
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v9;
  *uint64_t v9 = v1;
  v9[1] = sub_1C2F58770;
  return sub_1C2F620DC((uint64_t)v9, v5, v7, v8, v2);
}

uint64_t sub_1C2F643C8()
{
  uint64_t v1 = sub_1C2F6E448();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();
  return MEMORY[0x1F4186498](v0, v6, v5);
}

uint64_t sub_1C2F64484()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(sub_1C2F6E448() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = v0 + v4;
  uint64_t v6 = v0 + ((*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8);
  long long v7 = *(int **)v6;
  uint64_t v8 = *(void *)(v6 + 8);
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v9;
  *uint64_t v9 = v1;
  v9[1] = sub_1C2F58B84;
  return sub_1C2F61944((uint64_t)v9, v5, v7, v8, v2);
}

uint64_t sub_1C2F645AC(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

double sub_1C2F645C8()
{
  return 13.0;
}

id sub_1C2F645D0()
{
  id result = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FADBD0]), sel_init);
  qword_1EA344E48 = (uint64_t)result;
  return result;
}

id sub_1C2F64604()
{
  id v0 = objc_allocWithZone(MEMORY[0x1E4FB1930]);
  return objc_msgSend(v0, sel_init);
}

id sub_1C2F6463C()
{
  id v0 = objc_msgSend(self, sel_videoMessageRecordGlyphImage);
  id v1 = objc_msgSend(self, sel_secondaryLabelColor);
  id v2 = objc_msgSend(v0, sel_imageWithTintColor_, v1);

  id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1838]), sel_initWithImage_, v2);
  objc_msgSend(v3, sel_setContentMode_, 1);
  return v3;
}

id sub_1C2F6470C()
{
  uint64_t v1 = OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView____lazy_storage___backgroundView;
  id v2 = *(void **)(v0 + OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView____lazy_storage___backgroundView);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView____lazy_storage___backgroundView);
  }
  else
  {
    if (*(unsigned char *)(v0 + OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_location))
    {
      id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1EB0]), sel_init);
      id v5 = objc_msgSend(self, sel_secondarySystemBackgroundColor);
      objc_msgSend(v4, sel_setBackgroundColor_, v5);
    }
    else
    {
      id v6 = objc_msgSend(self, sel_effectWithStyle_, 18);
      id v7 = objc_msgSend(self, sel_effectForBlurEffect_style_, v6, 5);

      id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1F00]), sel_initWithEffect_, v7);
      id v8 = objc_msgSend(v4, sel_contentView);
      id v5 = objc_msgSend(self, sel_whiteColor);
      objc_msgSend(v8, sel_setBackgroundColor_, v5);
    }
    uint64_t v9 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    id v2 = 0;
  }
  id v10 = v2;
  return v3;
}

id sub_1C2F648B0()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F28BF8]), sel_init);
  objc_msgSend(v0, sel_setZeroFormattingBehavior_, 0x10000);
  objc_msgSend(v0, sel_setAllowedUnits_, 192);
  id result = objc_msgSend(v0, sel_setUnitsStyle_, 0);
  qword_1EA344E58 = (uint64_t)v0;
  return result;
}

id sub_1C2F64928()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_viewModel);
  swift_beginAccess();
  id v2 = *v1;
  return v2;
}

void sub_1C2F64980(void *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_viewModel);
  swift_beginAccess();
  id v4 = *v3;
  *id v3 = a1;
}

uint64_t (*sub_1C2F649D4())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1C2F64A30()
{
  return 0;
}

uint64_t sub_1C2F64A3C@<X0>(void **a1@<X0>, uint64_t (**a2)()@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0xD0))();
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = v4;
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = v5;
    *(void *)(result + 24) = v6;
    id v7 = sub_1C2F67124;
  }
  else
  {
    id v7 = 0;
  }
  *a2 = v7;
  a2[1] = (uint64_t (*)())result;
  return result;
}

uint64_t sub_1C2F64ADC(uint64_t *a1, void **a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  if (*a1)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v3;
    *(void *)(v5 + 24) = v4;
    uint64_t v6 = sub_1C2F670FC;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v5 = 0;
  }
  id v7 = *(uint64_t (**)(uint64_t (*)(), uint64_t))((*MEMORY[0x1E4FBC8C8] & **a2) + 0xD8);
  sub_1C2F64C00(v3);
  return v7(v6, v5);
}

uint64_t sub_1C2F64BA4()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_tapHandler);
  swift_beginAccess();
  uint64_t v2 = *v1;
  sub_1C2F64C00(*v1);
  return v2;
}

uint64_t sub_1C2F64C00(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_1C2F64C10(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (uint64_t *)(v2 + OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_tapHandler);
  swift_beginAccess();
  uint64_t v6 = *v5;
  uint64_t *v5 = a1;
  v5[1] = a2;
  return sub_1C2F645AC(v6);
}

uint64_t (*sub_1C2F64C70())()
{
  return j__swift_endAccess;
}

void *sub_1C2F64CCC(char *a1, void *a2)
{
  id v5 = objc_allocWithZone(v2);
  return sub_1C2F64D10(a1, a2);
}

void *sub_1C2F64D10(char *a1, void *a2)
{
  char v4 = *a1;
  *(void *)&v2[OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_textPadding] = 0x402A000000000000;
  uint64_t v5 = OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_titleLabel;
  id v6 = objc_allocWithZone(MEMORY[0x1E4FB1930]);
  id v7 = v2;
  *(void *)&v2[v5] = objc_msgSend(v6, sel_init);
  uint64_t v8 = OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_durationLabel;
  *(void *)&v7[v8] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1930]), sel_init);
  uint64_t v9 = OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_recordImageView;
  id v10 = objc_msgSend(self, sel_videoMessageRecordGlyphImage);
  id v11 = objc_msgSend(self, sel_secondaryLabelColor);
  id v12 = objc_msgSend(v10, sel_imageWithTintColor_, v11);

  id v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1838]), sel_initWithImage_, v12);
  objc_msgSend(v13, sel_setContentMode_, 1);
  *(void *)&v7[v9] = v13;
  *(void *)&v7[OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView____lazy_storage___backgroundView] = 0;
  unint64_t v14 = &v7[OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_tapHandler];
  *(void *)unint64_t v14 = 0;
  *((void *)v14 + 1) = 0;
  v7[OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_location] = v4;
  *(void *)&v7[OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_viewModel] = a2;
  uint64_t v15 = qword_1EA344E40;
  id v16 = a2;
  if (v15 != -1) {
    swift_once();
  }
  uint64_t v17 = (void *)qword_1EA344E48;
  unsigned int v18 = objc_msgSend((id)qword_1EA344E48, sel_videoMessagingEnabledM3);
  double v19 = 20.0;
  if (v18) {
    double v19 = 15.0;
  }
  *(double *)&v7[OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_padding] = v19;
  unsigned int v20 = objc_msgSend(v17, sel_videoMessagingEnabledM3);
  double v21 = 10.0;
  if (!v20) {
    double v21 = 15.0;
  }
  *(double *)&v7[OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_cornerRadius] = v21;

  v31.receiver = v7;
  v31.super_class = (Class)type metadata accessor for MessageIndicatorView();
  uint64_t v22 = objc_msgSendSuper2(&v31, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  uint64_t v23 = (void *)MEMORY[0x1E4FBC8C8];
  uint64_t v24 = *(uint64_t (**)(id))((*MEMORY[0x1E4FBC8C8] & *v22) + 0xF0);
  uint64_t v25 = v22;
  uint64_t v26 = v24(v16);
  (*(void (**)(uint64_t))((*v23 & *v25) + 0xF8))(v26);
  sub_1C2F65AE8();
  (*(void (**)(void))((*v23 & *v25) + 0x108))();
  id v27 = objc_allocWithZone(MEMORY[0x1E4FB1D38]);
  unint64_t v28 = v25;
  id v29 = objc_msgSend(v27, sel_initWithTarget_action_, v28, sel_handleTapGesture);
  objc_msgSend(v28, sel_addGestureRecognizer_, v29);

  return v28;
}

uint64_t type metadata accessor for MessageIndicatorView()
{
  return self;
}

void sub_1C2F650C8()
{
  v55.receiver = v0;
  v55.super_class = (Class)type metadata accessor for MessageIndicatorView();
  objc_msgSendSuper2(&v55, sel_layoutSubviews);
  id v1 = sub_1C2F6470C();
  objc_msgSend(v1, sel_setAutoresizingMask_, 18);

  id v2 = sub_1C2F6470C();
  objc_msgSend(v0, sel_bounds);
  objc_msgSend(v2, sel_setFrame_);

  uint64_t v3 = *(void **)((char *)v0 + OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_titleLabel);
  objc_msgSend(v3, sel_sizeToFit);
  char v4 = *(void **)((char *)v0 + OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_durationLabel);
  objc_msgSend(v4, sel_sizeToFit);
  uint64_t v5 = *(void **)((char *)v0 + OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_recordImageView);
  id v6 = objc_msgSend(v5, sel_sizeToFit);
  id v7 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xB8);
  uint64_t v8 = (void *)((uint64_t (*)(id))v7)(v6);
  objc_msgSend(v8, sel_indicatorImageSize);
  double v10 = v9;
  double v12 = v11;

  if (v10 != 0.0 || v12 != 0.0)
  {
    id v13 = (void *)v7();
    objc_msgSend(v13, sel_indicatorImageSize);

    objc_msgSend(v5, sel_frame);
    objc_msgSend(v5, sel_setFrame_);
  }
  id v14 = sub_1C2F6470C();
  objc_msgSend(v3, sel_frame);
  objc_msgSend(v14, sel_frame);
  objc_msgSend(v14, sel_setFrame_);

  id v15 = sub_1C2F6470C();
  objc_msgSend(v15, sel_frame);
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;

  v56.origin.x = v17;
  v56.origin.y = v19;
  v56.size.width = v21;
  v56.size.height = v23;
  CGRectGetMidY(v56);
  objc_msgSend(v5, sel_center);
  objc_msgSend(v5, sel_setCenter_);
  id v24 = sub_1C2F6470C();
  objc_msgSend(v24, sel_frame);
  CGFloat v26 = v25;
  CGFloat v28 = v27;
  CGFloat v30 = v29;
  CGFloat v32 = v31;

  v57.origin.x = v26;
  v57.origin.y = v28;
  v57.size.width = v30;
  v57.size.height = v32;
  CGRectGetMidY(v57);
  objc_msgSend(v3, sel_center);
  objc_msgSend(v3, sel_setCenter_);
  id v33 = sub_1C2F6470C();
  objc_msgSend(v33, sel_frame);
  CGFloat v35 = v34;
  CGFloat v37 = v36;
  CGFloat v39 = v38;
  CGFloat v41 = v40;

  v58.origin.x = v35;
  v58.origin.y = v37;
  v58.size.width = v39;
  v58.size.height = v41;
  CGRectGetMidY(v58);
  objc_msgSend(v4, sel_center);
  objc_msgSend(v4, sel_setCenter_);
  double v42 = *(double *)((char *)v0 + OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_padding);
  objc_msgSend(v5, sel_frame);
  objc_msgSend(v5, sel_setFrame_, v42);
  objc_msgSend(v5, sel_frame);
  CGFloat v43 = CGRectGetMaxX(v59) + 10.0;
  objc_msgSend(v3, sel_frame);
  objc_msgSend(v3, sel_setFrame_, v43);
  id v44 = sub_1C2F6470C();
  objc_msgSend(v44, sel_frame);
  CGFloat v46 = v45;
  CGFloat v48 = v47;
  CGFloat v50 = v49;
  CGFloat v52 = v51;

  v60.origin.x = v46;
  v60.origin.y = v48;
  v60.size.width = v50;
  v60.size.height = v52;
  double MaxX = CGRectGetMaxX(v60);
  objc_msgSend(v4, sel_frame);
  double v54 = MaxX - CGRectGetWidth(v61) - v42;
  objc_msgSend(v4, sel_frame);
  objc_msgSend(v4, sel_setFrame_, v54);
  sub_1C2F65D50();
}

double sub_1C2F654E8(double a1)
{
  objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_titleLabel), sel_sizeThatFits_);
  return a1;
}

uint64_t sub_1C2F655B8(id a1)
{
  v12.receiver = v1;
  v12.super_class = (Class)type metadata accessor for MessageIndicatorView();
  objc_msgSendSuper2(&v12, sel_traitCollectionDidChange_, a1);
  if (a1) {
    a1 = objc_msgSend(a1, sel_preferredContentSizeCategory);
  }
  id v3 = objc_msgSend(v1, sel_traitCollection);
  id v4 = objc_msgSend(v3, sel_preferredContentSizeCategory);

  if (!a1)
  {

    return (*(uint64_t (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & *v1) + 0x108))(result);
  }
  uint64_t v5 = sub_1C2F6E3D8();
  uint64_t v7 = v6;
  if (v5 == sub_1C2F6E3D8() && v7 == v8)
  {

    return swift_bridgeObjectRelease_n();
  }
  char v10 = sub_1C2F6E608();

  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  if ((v10 & 1) == 0) {
    return (*(uint64_t (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & *v1) + 0x108))(result);
  }
  return result;
}

void sub_1C2F6578C(void *a1)
{
  id v2 = *(void (**)(void))((*MEMORY[0x1E4FBC8C8] & *v1) + 0xC0);
  id v3 = a1;
  v2();
  unsigned __int8 v19 = *((unsigned char *)v1 + OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_location);
  unsigned __int8 v18 = 0;
  LOBYTE(v2) = static RecentsListItemLocation.== infix(_:_:)(&v19, &v18);
  id v4 = self;
  uint64_t v5 = &selRef_systemGreenColor;
  if ((v2 & 1) == 0) {
    uint64_t v5 = &selRef_systemBlueColor;
  }
  id v6 = [v4 *v5];
  uint64_t v7 = *(void **)((char *)v1 + OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_recordImageView);
  id v17 = v6;
  id v8 = objc_msgSend(v3, sel_indicatorImageWithDefaultTintColor_);
  objc_msgSend(v7, sel_setImage_, v8);

  if (objc_msgSend(v3, sel_isRead)) {
    id v9 = objc_msgSend(self, sel_labelColor);
  }
  else {
    id v9 = v17;
  }
  char v10 = v9;
  objc_msgSend(v7, sel_setTintColor_, v9);

  double v11 = *(void **)((char *)v1 + OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_titleLabel);
  objc_msgSend(v3, sel_isVideo);
  sub_1C2F50D10();
  swift_bridgeObjectRelease();
  objc_super v12 = (void *)sub_1C2F6E3C8();
  swift_bridgeObjectRelease();
  objc_msgSend(v11, sel_setText_, v12);

  objc_msgSend(v3, sel_duration);
  id v13 = *(void **)((char *)v1 + OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_durationLabel);
  if (v14 <= 0.0)
  {
    objc_msgSend(*(id *)((char *)v1 + OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_durationLabel), sel_setText_, 0);
  }
  else
  {
    if (qword_1EA344E50 != -1) {
      swift_once();
    }
    id v15 = (void *)qword_1EA344E58;
    objc_msgSend(v3, sel_duration);
    id v16 = objc_msgSend(v15, sel_stringFromTimeInterval_);
    objc_msgSend(v13, sel_setText_, v16);
  }
  objc_msgSend(v1, sel_setNeedsLayout);
}

id sub_1C2F65A50()
{
  id v1 = sub_1C2F6470C();
  objc_msgSend(v0, sel_addSubview_, v1);

  objc_msgSend(v0, sel_addSubview_, *(void *)&v0[OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_recordImageView]);
  objc_msgSend(v0, sel_addSubview_, *(void *)&v0[OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_titleLabel]);
  uint64_t v2 = *(void *)&v0[OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_durationLabel];
  return objc_msgSend(v0, sel_addSubview_, v2);
}

void sub_1C2F65AE8()
{
  id v1 = sub_1C2F6470C();
  id v2 = objc_msgSend(v1, sel_layer);

  objc_msgSend(v2, sel_setCornerCurve_, *MEMORY[0x1E4F39EB0]);
  id v3 = sub_1C2F6470C();
  id v4 = objc_msgSend(v3, sel_layer);

  objc_msgSend(v4, sel_setCornerRadius_, *(double *)(v0 + OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_cornerRadius));
  id v5 = sub_1C2F6470C();
  id v6 = objc_msgSend(v5, sel_layer);

  objc_msgSend(v6, sel_setMasksToBounds_, 1);
}

void sub_1C2F65BE0()
{
  id v1 = self;
  sub_1C2F6E3D8();
  id v2 = (void *)sub_1C2F6E3C8();
  swift_bridgeObjectRelease();
  id v3 = objc_msgSend(v1, sel_preferredFontDescriptorWithTextStyle_addingSymbolicTraits_options_, v2, 0x8000, 1);

  if (!v3) {
    id v3 = objc_msgSend(v1, sel_preferredFontDescriptorWithTextStyle_, *MEMORY[0x1E4FB28C8]);
  }
  id v4 = *(void **)(v0 + OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_titleLabel);
  id v5 = self;
  id v6 = objc_msgSend(v5, sel_fontWithDescriptor_size_, v3, 0.0);
  objc_msgSend(v4, sel_setFont_, v6);

  uint64_t v7 = *(void **)(v0 + OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_durationLabel);
  id v8 = objc_msgSend(v5, sel_fontWithDescriptor_size_, v3, 0.0);
  objc_msgSend(v7, sel_setFont_, v8);
}

void sub_1C2F65D50()
{
  if (objc_msgSend(v0, sel_effectiveUserInterfaceLayoutDirection) == (id)1)
  {
    id v1 = *(void **)&v0[OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_titleLabel];
    id v2 = *(void **)&v0[OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_durationLabel];
    id v3 = *(id *)&v0[OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_recordImageView];
    id v4 = v1;
    id v5 = v2;
    objc_msgSend(v0, sel_bounds);
    double Width = CGRectGetWidth(v21);
    objc_msgSend(v3, sel_frame);
    double v8 = Width - v7;
    objc_msgSend(v3, sel_frame);
    double v9 = v8 - CGRectGetMinX(v22);
    objc_msgSend(v3, sel_frame);
    objc_msgSend(v3, sel_setFrame_, v9);

    id v10 = v4;
    objc_msgSend(v0, sel_bounds);
    double v11 = CGRectGetWidth(v23);
    objc_msgSend(v10, sel_frame);
    double v13 = v11 - v12;
    objc_msgSend(v10, sel_frame);
    double v14 = v13 - CGRectGetMinX(v24);
    objc_msgSend(v10, sel_frame);
    objc_msgSend(v10, sel_setFrame_, v14);

    id v19 = v5;
    objc_msgSend(v0, sel_bounds);
    double v15 = CGRectGetWidth(v25);
    objc_msgSend(v19, sel_frame);
    double v17 = v15 - v16;
    objc_msgSend(v19, sel_frame);
    double v18 = v17 - CGRectGetMinX(v26);
    objc_msgSend(v19, sel_frame);
    objc_msgSend(v19, sel_setFrame_, v18);
  }
}

uint64_t sub_1C2F65F50()
{
  id v1 = (void *)MEMORY[0x1E4FBC8C8];
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xD0))();
  if (result)
  {
    id v3 = (void (*)(uint64_t))result;
    uint64_t v4 = sub_1C2F6DFF8();
    uint64_t v5 = *(void *)(v4 - 8);
    uint64_t v6 = *(void *)(v5 + 64);
    uint64_t v7 = MEMORY[0x1F4188790](v4);
    unint64_t v8 = (v6 + 15) & 0xFFFFFFFFFFFFFFF0;
    double v9 = (void *)(*(uint64_t (**)(uint64_t))((*v1 & *v0) + 0xB8))(v7);
    id v10 = objc_msgSend(v9, sel_mediaURL);

    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA343738);
    v18[1] = v18;
    uint64_t v12 = MEMORY[0x1F4188790](v11 - 8);
    double v14 = (char *)v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (v10)
    {
      v18[0] = (char *)v18 - v8;
      MEMORY[0x1F4188790](v12);
      double v15 = (char *)v18 - v8;
      sub_1C2F6DFE8();

      double v16 = *(void (**)(char *, char *, uint64_t))(v5 + 32);
      v16(v14, v15, v4);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v5 + 56))(v14, 0, 1, v4);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v14, 1, v4) != 1)
      {
        uint64_t v17 = v18[0];
        v16((char *)v18[0], v14, v4);
        v3(v17);
        sub_1C2F645AC((uint64_t)v3);
        return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v17, v4);
      }
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v14, 1, 1, v4);
    }
    sub_1C2F645AC((uint64_t)v3);
    return sub_1C2F67064((uint64_t)v14);
  }
  return result;
}

id MessageIndicatorView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  id v9 = objc_allocWithZone(v4);
  return objc_msgSend(v9, sel_initWithFrame_, a1, a2, a3, a4);
}

void MessageIndicatorView.init(frame:)()
{
}

id MessageIndicatorView.__deallocating_deinit()
{
  return sub_1C2F66CF4(type metadata accessor for MessageIndicatorView);
}

void sub_1C2F663F8(void *a1)
{
  sub_1C2F6578C(a1);
  id v2 = *(id *)(v1 + OBJC_IVAR____TtC11TelephonyUI29SensitiveMessageIndicatorView_sensitivityLabel);
  sub_1C2F50D10();
  id v3 = (id)sub_1C2F6E3C8();
  swift_bridgeObjectRelease();
  objc_msgSend(v2, sel_setText_, v3);
}

id sub_1C2F66490()
{
  id v1 = sub_1C2F6470C();
  objc_msgSend(v0, sel_addSubview_, v1);

  objc_msgSend(v0, sel_addSubview_, *(void *)&v0[OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_recordImageView]);
  objc_msgSend(v0, sel_addSubview_, *(void *)&v0[OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_titleLabel]);
  objc_msgSend(v0, sel_addSubview_, *(void *)&v0[OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_durationLabel]);
  uint64_t v2 = *(void *)&v0[OBJC_IVAR____TtC11TelephonyUI29SensitiveMessageIndicatorView_sensitivityLabel];
  return objc_msgSend(v0, sel_addSubview_, v2);
}

void sub_1C2F66540()
{
  id v1 = self;
  sub_1C2F6E3D8();
  uint64_t v2 = (void *)sub_1C2F6E3C8();
  swift_bridgeObjectRelease();
  id v3 = objc_msgSend(v1, sel_preferredFontDescriptorWithTextStyle_addingSymbolicTraits_options_, v2, 0x8000, 1);

  uint64_t v4 = (uint64_t *)MEMORY[0x1E4FB28C8];
  if (!v3) {
    id v3 = objc_msgSend(v1, sel_preferredFontDescriptorWithTextStyle_, *MEMORY[0x1E4FB28C8]);
  }
  uint64_t v5 = *(void **)(v0 + OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_titleLabel);
  uint64_t v6 = self;
  id v7 = objc_msgSend(v6, sel_fontWithDescriptor_size_, v3, 0.0);
  objc_msgSend(v5, sel_setFont_, v7);

  unint64_t v8 = *(void **)(v0 + OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_durationLabel);
  id v9 = objc_msgSend(v6, sel_fontWithDescriptor_size_, v3, 0.0);
  objc_msgSend(v8, sel_setFont_, v9);

  uint64_t v10 = *v4;
  sub_1C2F6E3D8();
  uint64_t v11 = (void *)sub_1C2F6E3C8();
  swift_bridgeObjectRelease();
  id v12 = objc_msgSend(v1, sel_preferredFontDescriptorWithTextStyle_addingSymbolicTraits_options_, v11, 0, 1);

  if (!v12) {
    id v12 = objc_msgSend(v1, sel_preferredFontDescriptorWithTextStyle_, v10);
  }
  uint64_t v13 = OBJC_IVAR____TtC11TelephonyUI29SensitiveMessageIndicatorView_sensitivityLabel;
  id v14 = *(id *)(v0 + OBJC_IVAR____TtC11TelephonyUI29SensitiveMessageIndicatorView_sensitivityLabel);
  id v15 = objc_msgSend(v6, sel_fontWithDescriptor_size_, v12, 0.0);
  objc_msgSend(v14, sel_setFont_, v15);

  double v16 = *(void **)(v0 + v13);
  uint64_t v17 = self;
  id v18 = v16;
  id v19 = objc_msgSend(v17, sel_secondaryLabelColor);
  objc_msgSend(v18, sel_setTextColor_, v19);
}

void sub_1C2F667C8()
{
  v7.receiver = v0;
  v7.super_class = (Class)type metadata accessor for SensitiveMessageIndicatorView();
  objc_msgSendSuper2(&v7, sel_layoutSubviews);
  uint64_t v1 = OBJC_IVAR____TtC11TelephonyUI29SensitiveMessageIndicatorView_sensitivityLabel;
  objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC11TelephonyUI29SensitiveMessageIndicatorView_sensitivityLabel], sel_sizeToFit);
  double v2 = *(double *)&v0[OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_padding];
  id v3 = *(id *)&v0[v1];
  objc_msgSend(v3, sel_frame);
  objc_msgSend(v3, sel_setFrame_, v2);

  id v4 = *(id *)&v0[v1];
  objc_msgSend(v0, sel_frame);
  objc_msgSend(*(id *)&v0[v1], sel_frame);
  id v5 = objc_msgSend(*(id *)&v0[v1], sel_font);
  if (v5)
  {
    uint64_t v6 = v5;
    objc_msgSend(v5, sel_descender);

    objc_msgSend(v4, sel_frame);
    objc_msgSend(v4, sel_setFrame_);
  }
  else
  {
    __break(1u);
  }
}

void sub_1C2F66944(double a1, double a2)
{
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for SensitiveMessageIndicatorView();
  objc_msgSendSuper2(&v8, sel_sizeThatFits_, a1, a2);
  uint64_t v5 = OBJC_IVAR____TtC11TelephonyUI29SensitiveMessageIndicatorView_sensitivityLabel;
  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC11TelephonyUI29SensitiveMessageIndicatorView_sensitivityLabel], sel_sizeThatFits_, a1, a2);
  id v6 = objc_msgSend(*(id *)&v2[v5], sel_font);
  if (v6)
  {
    objc_super v7 = v6;
    objc_msgSend(v6, sel_descender);
  }
  else
  {
    __break(1u);
  }
}

void *sub_1C2F66A70(char *a1, void *a2)
{
  uint64_t v5 = (char *)objc_allocWithZone(v2);
  char v6 = *a1;
  uint64_t v7 = OBJC_IVAR____TtC11TelephonyUI29SensitiveMessageIndicatorView_sensitivityLabel;
  id v8 = objc_allocWithZone(MEMORY[0x1E4FB1930]);
  id v9 = v5;
  *(void *)&v5[v7] = objc_msgSend(v8, sel_init);

  char v11 = v6;
  return sub_1C2F64D10(&v11, a2);
}

void *sub_1C2F66B08(char *a1, void *a2)
{
  char v4 = *a1;
  uint64_t v5 = OBJC_IVAR____TtC11TelephonyUI29SensitiveMessageIndicatorView_sensitivityLabel;
  id v6 = objc_allocWithZone(MEMORY[0x1E4FB1930]);
  uint64_t v7 = v2;
  *(void *)&v2[v5] = objc_msgSend(v6, sel_init);

  char v9 = v4;
  return sub_1C2F64D10(&v9, a2);
}

id sub_1C2F66B90(void *a1)
{
  uint64_t v3 = OBJC_IVAR____TtC11TelephonyUI29SensitiveMessageIndicatorView_sensitivityLabel;
  id v4 = objc_allocWithZone(MEMORY[0x1E4FB1930]);
  uint64_t v5 = v1;
  *(void *)&v1[v3] = objc_msgSend(v4, sel_init);

  v8.receiver = v5;
  v8.super_class = (Class)type metadata accessor for SensitiveMessageIndicatorView();
  id v6 = objc_msgSendSuper2(&v8, sel_initWithCoder_, a1);

  return v6;
}

void sub_1C2F66CCC()
{
}

id SensitiveMessageIndicatorView.__deallocating_deinit()
{
  return sub_1C2F66CF4(type metadata accessor for SensitiveMessageIndicatorView);
}

id sub_1C2F66CF4(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t sub_1C2F66D3C()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x140))();
}

uint64_t sub_1C2F66D78()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x148))();
}

void sub_1C2F66DB4()
{
  *(void *)&v0[OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_textPadding] = 0x402A000000000000;
  uint64_t v1 = OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_titleLabel;
  *(void *)&v0[v1] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1930]), sel_init);
  uint64_t v2 = OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_durationLabel;
  *(void *)&v0[v2] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1930]), sel_init);
  uint64_t v3 = OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_recordImageView;
  id v4 = objc_msgSend(self, sel_videoMessageRecordGlyphImage);
  id v5 = objc_msgSend(self, sel_secondaryLabelColor);
  id v6 = objc_msgSend(v4, sel_imageWithTintColor_, v5);

  id v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1838]), sel_initWithImage_, v6);
  objc_msgSend(v7, sel_setContentMode_, 1);
  *(void *)&v0[v3] = v7;
  *(void *)&v0[OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView____lazy_storage___backgroundView] = 0;
  objc_super v8 = &v0[OBJC_IVAR____TtC11TelephonyUI20MessageIndicatorView_tapHandler];
  *(void *)objc_super v8 = 0;
  *((void *)v8 + 1) = 0;

  sub_1C2F6E598();
  __break(1u);
}

uint64_t type metadata accessor for SensitiveMessageIndicatorView()
{
  return self;
}

uint64_t method lookup function for MessageIndicatorView(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for MessageIndicatorView);
}

uint64_t dispatch thunk of MessageIndicatorView.tapHandler.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of MessageIndicatorView.tapHandler.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of MessageIndicatorView.tapHandler.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of MessageIndicatorView.update(with:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xF0))();
}

uint64_t method lookup function for SensitiveMessageIndicatorView(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for SensitiveMessageIndicatorView);
}

uint64_t sub_1C2F67064(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA343738);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1C2F670C4()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1C2F670FC()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1C2F67124()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1C2F67158()
{
  return v0;
}

uint64_t sub_1C2F67160()
{
  return swift_deallocClassInstance();
}

uint64_t sub_1C2F67170()
{
  return swift_allocObject();
}

id sub_1C2F67180()
{
  type metadata accessor for BundleFinder();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_bundleForClass_, ObjCClassFromMetadata);
  return v1;
}

uint64_t type metadata accessor for BundleFinder()
{
  return self;
}

BOOL static RecentsListItemLocation.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t RecentsListItemLocation.hash(into:)()
{
  return sub_1C2F6E678();
}

uint64_t RecentsListItemLocation.hashValue.getter()
{
  return sub_1C2F6E688();
}

BOOL sub_1C2F67284(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

void sub_1C2F6729C()
{
  qword_1EA344E68 = 0x4030000000000000;
}

id sub_1C2F672B4()
{
  return *(id *)(v0 + 16);
}

id sub_1C2F672C4()
{
  return *(id *)(v0 + 24);
}

id sub_1C2F672D4()
{
  return *(id *)(v0 + 32);
}

id sub_1C2F672DC()
{
  id v0 = objc_allocWithZone(MEMORY[0x1E4FB16A8]);
  return objc_msgSend(v0, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
}

id sub_1C2F6732C()
{
  return *(id *)(v0 + 40);
}

id sub_1C2F6733C()
{
  return *(id *)(v0 + 48);
}

id sub_1C2F67344()
{
  return *(id *)(v0 + 56);
}

id sub_1C2F6734C()
{
  id v0 = objc_allocWithZone(MEMORY[0x1E4FB1838]);
  return objc_msgSend(v0, sel_init);
}

id sub_1C2F67384()
{
  swift_beginAccess();
  id v1 = *(void **)(v0 + 64);
  return v1;
}

void sub_1C2F673C8(uint64_t a1)
{
  swift_beginAccess();
  uint64_t v3 = *(void **)(v1 + 64);
  *(void *)(v1 + 64) = a1;
}

uint64_t (*sub_1C2F67410())()
{
  return j__swift_endAccess;
}

void *sub_1C2F67464()
{
  swift_beginAccess();
  uint64_t v1 = *(void **)(v0 + 72);
  id v2 = v1;
  return v1;
}

void sub_1C2F674A8(uint64_t a1)
{
  swift_beginAccess();
  uint64_t v3 = *(void **)(v1 + 72);
  *(void *)(v1 + 72) = a1;
}

uint64_t (*sub_1C2F674F0())()
{
  return j_j__swift_endAccess;
}

void *sub_1C2F67544()
{
  swift_beginAccess();
  uint64_t v1 = *(void **)(v0 + 80);
  id v2 = v1;
  return v1;
}

void sub_1C2F67588(uint64_t a1)
{
  swift_beginAccess();
  uint64_t v3 = *(void **)(v1 + 80);
  *(void *)(v1 + 80) = a1;
}

uint64_t (*sub_1C2F675D0())()
{
  return j_j__swift_endAccess;
}

void *sub_1C2F67624()
{
  swift_beginAccess();
  uint64_t v1 = *(void **)(v0 + 88);
  id v2 = v1;
  return v1;
}

void sub_1C2F67668(uint64_t a1)
{
  swift_beginAccess();
  uint64_t v3 = *(void **)(v1 + 88);
  *(void *)(v1 + 88) = a1;
}

uint64_t (*sub_1C2F676B0())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1C2F67704@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 376))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_1C2F67758(uint64_t a1, uint64_t a2)
{
  id v2 = *(id *)a1;
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v4 = *(uint64_t (**)(id, uint64_t))(**(void **)a2 + 384);
  id v5 = *(id *)a1;
  return v4(v2, v3);
}

void *sub_1C2F677C4()
{
  swift_beginAccess();
  uint64_t v1 = *(void **)(v0 + 96);
  id v2 = v1;
  return v1;
}

void sub_1C2F6780C(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  id v5 = *(void **)(v2 + 96);
  *(void *)(v2 + 96) = a1;
  *(void *)(v2 + 104) = a2;
}

uint64_t (*sub_1C2F67860())()
{
  return j_j__swift_endAccess;
}

double sub_1C2F678B4()
{
  return 45.0;
}

uint64_t sub_1C2F678C8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 424))();
  *a2 = result;
  return result;
}

uint64_t sub_1C2F6791C(id *a1, uint64_t a2)
{
  return (*(uint64_t (**)(id))(**(void **)a2 + 432))(*a1);
}

id sub_1C2F67978()
{
  uint64_t v1 = *(void **)(v0 + 136);
  if (v1)
  {
    id v2 = *(id *)(v0 + 136);
  }
  else
  {
    if (qword_1EA344598 != -1) {
      swift_once();
    }
    if (objc_msgSend((id)qword_1EA344580, sel_recentsCallTapTargetsEnabled))
    {
      id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB14D0]), sel_init);
      LODWORD(v4) = 1148846080;
      objc_msgSend(v3, sel_tp_setCHCRPriority_, v4);
    }
    else
    {
      id v3 = objc_msgSend(self, sel_buttonWithType_, 4);
      objc_msgSend(v3, sel_bounds);
      double Height = CGRectGetHeight(v11);
      objc_msgSend(v3, sel_bounds);
      double Width = CGRectGetWidth(v12);
      if (Height <= Width) {
        double Height = Width;
      }
      id v7 = objc_msgSend(v3, sel_layer);

      objc_msgSend(v7, sel_setCornerRadius_, Height);
    }
    objc_super v8 = *(void **)(v0 + 136);
    *(void *)(v0 + 136) = v3;
    id v2 = v3;

    uint64_t v1 = 0;
  }
  id v9 = v1;
  return v2;
}

uint64_t sub_1C2F67ADC(uint64_t a1)
{
  *(void *)(v1 + 136) = a1;
  return MEMORY[0x1F41817F8]();
}

void (*sub_1C2F67AE8(id *a1))(uint64_t *a1)
{
  a1[1] = v1;
  *a1 = sub_1C2F67978();
  return sub_1C2F67B30;
}

void sub_1C2F67B30(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v1 = a1[1];
  id v3 = *(void **)(v1 + 136);
  *(void *)(v1 + 136) = v2;
}

uint64_t sub_1C2F67B40@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 448))();
  *a2 = result;
  return result;
}

uint64_t sub_1C2F67B94(id *a1, uint64_t a2)
{
  return (*(uint64_t (**)(id))(**(void **)a2 + 456))(*a1);
}

id sub_1C2F67BF0()
{
  uint64_t v1 = *(void **)(v0 + 144);
  if (v1)
  {
    id v2 = *(id *)(v0 + 144);
  }
  else
  {
    id v3 = objc_msgSend(self, sel_buttonWithType_, 1);
    id v4 = objc_msgSend(self, sel_secondaryLabelColor);
    objc_msgSend(v3, sel_setTintColor_, v4);

    objc_msgSend(v3, sel_bounds);
    double Height = CGRectGetHeight(v11);
    objc_msgSend(v3, sel_bounds);
    double Width = CGRectGetWidth(v12);
    if (Height <= Width) {
      double Height = Width;
    }
    id v7 = objc_msgSend(v3, sel_layer);
    objc_msgSend(v7, sel_setCornerRadius_, Height);

    objc_super v8 = *(void **)(v0 + 144);
    *(void *)(v0 + 144) = v3;
    id v2 = v3;

    uint64_t v1 = 0;
  }
  id v9 = v1;
  return v2;
}

uint64_t sub_1C2F67D10(uint64_t a1)
{
  *(void *)(v1 + 144) = a1;
  return MEMORY[0x1F41817F8]();
}

void (*sub_1C2F67D1C(id *a1))(uint64_t *a1)
{
  a1[1] = v1;
  *a1 = sub_1C2F67BF0();
  return sub_1C2F67D64;
}

void sub_1C2F67D64(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v1 = a1[1];
  id v3 = *(void **)(v1 + 144);
  *(void *)(v1 + 144) = v2;
}

id sub_1C2F67D74()
{
  return *(id *)(v0 + 152);
}

id sub_1C2F67D7C()
{
  return *(id *)(v0 + 160);
}

id sub_1C2F67D84()
{
  return *(id *)(v0 + 168);
}

id RecentsListItemViewHelper.rootStackView.getter()
{
  return *(id *)(v0 + 176);
}

uint64_t sub_1C2F67D94@<X0>(uint64_t a1@<X0>, uint64_t (**a2)()@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 480))();
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = v4;
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = v5;
    *(void *)(result + 24) = v6;
    id v7 = sub_1C2F6CE20;
  }
  else
  {
    id v7 = 0;
  }
  *a2 = v7;
  a2[1] = (uint64_t (*)())result;
  return result;
}

uint64_t sub_1C2F67E2C(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  if (*a1)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v3;
    *(void *)(v5 + 24) = v4;
    uint64_t v6 = sub_1C2F6CE0C;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v5 = 0;
  }
  id v7 = *(uint64_t (**)(uint64_t (*)(), uint64_t))(**(void **)a2 + 488);
  sub_1C2F64C00(v3);
  return v7(v6, v5);
}

uint64_t sub_1C2F67EEC()
{
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 184);
  sub_1C2F64C00(v1);
  return v1;
}

uint64_t sub_1C2F67F3C(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  uint64_t v5 = *(void *)(v2 + 184);
  *(void *)(v2 + 184) = a1;
  *(void *)(v2 + 192) = a2;
  return sub_1C2F645AC(v5);
}

uint64_t (*sub_1C2F67F90())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1C2F67FE4@<X0>(uint64_t a1@<X0>, uint64_t (**a2)()@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 504))();
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = v4;
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = v5;
    *(void *)(result + 24) = v6;
    id v7 = sub_1C2F6CDA8;
  }
  else
  {
    id v7 = 0;
  }
  *a2 = v7;
  a2[1] = (uint64_t (*)())result;
  return result;
}

uint64_t sub_1C2F6807C(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  if (*a1)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v3;
    *(void *)(v5 + 24) = v4;
    uint64_t v6 = sub_1C2F6CD80;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v5 = 0;
  }
  id v7 = *(uint64_t (**)(uint64_t (*)(), uint64_t))(**(void **)a2 + 512);
  sub_1C2F64C00(v3);
  return v7(v6, v5);
}

uint64_t sub_1C2F6813C()
{
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 200);
  sub_1C2F64C00(v1);
  return v1;
}

uint64_t sub_1C2F6818C(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  uint64_t v5 = *(void *)(v2 + 200);
  *(void *)(v2 + 200) = a1;
  *(void *)(v2 + 208) = a2;
  return sub_1C2F645AC(v5);
}

uint64_t (*sub_1C2F681E0())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1C2F68234@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 528))();
  *a2 = result;
  return result;
}

uint64_t sub_1C2F68288(id *a1, uint64_t a2)
{
  id v2 = *a1;
  uint64_t v3 = *(uint64_t (**)(id))(**(void **)a2 + 536);
  id v4 = *a1;
  return v3(v2);
}

void *sub_1C2F682E8()
{
  swift_beginAccess();
  uint64_t v1 = *(void **)(v0 + 216);
  id v2 = v1;
  return v1;
}

void sub_1C2F6832C(uint64_t a1)
{
  swift_beginAccess();
  uint64_t v3 = *(void **)(v1 + 216);
  *(void *)(v1 + 216) = a1;
}

uint64_t (*sub_1C2F68374())()
{
  return j_j__swift_endAccess;
}

void sub_1C2F683C8(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

void sub_1C2F683D4()
{
  uint64_t v1 = v0;
  uint64_t v2 = swift_beginAccess();
  switch(v0[224])
  {
    case 1:
      uint64_t v6 = (uint64_t (**)(uint64_t))(*(void *)v0 + 376);
      id v7 = *v6;
      uint64_t v8 = (*v6)(v2);
      if (v8)
      {
        uint64_t v10 = (void *)v8;
        uint64_t v11 = v9;
        uint64_t ObjectType = swift_getObjectType();
        unint64_t v13 = (*(uint64_t (**)(uint64_t, uint64_t))(v11 + 8))(ObjectType, v11);
        if (v13 >> 62) {
          uint64_t v14 = sub_1C2F6E5A8();
        }
        else {
          uint64_t v14 = *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10);
        }
        uint64_t v15 = swift_bridgeObjectRelease();
        if (v14)
        {
          double v16 = (void *)v7(v15);
          if (v16)
          {
            uint64_t v17 = v16;
            id v18 = objc_msgSend(v16, sel_view);

            if (v18)
            {
              id v19 = objc_msgSend(v18, sel_superview);

              if (!v19) {
                sub_1C2F6B0BC(v18);
              }
            }
          }
          id v20 = objc_msgSend(v10, sel_view);
          if (!v20)
          {
            __break(1u);
            JUMPOUT(0x1C2F68740);
          }
          CGRect v21 = v20;
          id v5 = (id)(*(uint64_t (**)(void))(*(void *)v1 + 352))();
          sub_1C2F68750(v21, v5);
        }
        else
        {
          id v25 = sub_1C2F6B27C();
          id v26 = objc_msgSend(v25, sel_superview);

          if (!v26) {
            sub_1C2F6B0BC(v25);
          }
          id v5 = (id)(*(uint64_t (**)(void))(*(void *)v1 + 352))();
          sub_1C2F68750(v25, v5);
        }
        goto LABEL_23;
      }
      break;
    case 2:
      CGRect v22 = (void *)(*(uint64_t (**)(uint64_t))(*(void *)v0 + 376))(v2);
      if (v22)
      {
        CGRect v23 = v22;
        id v5 = objc_msgSend(v22, sel_view);

        if (v5)
        {
          id v24 = objc_msgSend(v5, sel_superview);

          if (!v24) {
            sub_1C2F6B0BC(v5);
          }
          goto LABEL_23;
        }
      }
      break;
    case 3:
      return;
    default:
      id v3 = sub_1C2F6B27C();
      id v4 = objc_msgSend(v3, sel_superview);

      if (!v4) {
        sub_1C2F6B0BC(v3);
      }
      id v5 = (id)(*(uint64_t (**)(void))(*(void *)v1 + 352))();
      sub_1C2F68750(v3, v5);

LABEL_23:
      break;
  }
}

void sub_1C2F68750(void *a1, void *a2)
{
  uint64_t v3 = v2;
  id v4 = *(uint64_t (**)(void))(*(void *)v2 + 280);
  if (a2)
  {
    id v21 = a2;
    uint64_t v6 = (void *)v4();
    objc_msgSend(v6, sel_setImage_, v21);

    id v7 = (void *)v4();
    id v8 = objc_msgSend(v7, sel_superview);

    if (!v8
      || (sub_1C2F6CDD0(0, &qword_1EA343130),
          id v9 = a1,
          id v10 = v8,
          char v11 = sub_1C2F6E528(),
          v10,
          v10,
          v9,
          (v11 & 1) == 0))
    {
      CGRect v12 = (void *)v4();
      objc_msgSend(v12, sel_removeFromSuperview);
    }
    unint64_t v13 = (void *)v4();
    id v14 = objc_msgSend(v13, sel_superview);

    if (!v14)
    {
      uint64_t v15 = (void *)v4();
      objc_msgSend(a1, sel_addSubview_, v15);

      double v16 = *(double *)(v3 + 112);
      double v17 = v16 * 0.4;
      double v18 = v16 - v16 * 0.4;
      id v19 = (void *)v4();
      objc_msgSend(v19, sel_setFrame_, v18, v18, v17, v17);

      id v20 = v19;
      goto LABEL_9;
    }
  }
  else
  {
    id v21 = (id)v4();
    objc_msgSend(v21, sel_removeFromSuperview);
  }
  id v20 = v21;
LABEL_9:
}

uint64_t sub_1C2F68984@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_beginAccess();
  *a1 = *(unsigned char *)(v1 + 224);
  return result;
}

void sub_1C2F689C8(char *a1)
{
  char v2 = *a1;
  swift_beginAccess();
  *(unsigned char *)(v1 + 224) = v2;
  sub_1C2F683D4();
}

char *sub_1C2F68A0C()
{
  return &byte_1EA344E70;
}

uint64_t static RecentsListItemViewHelper.shouldUseCompactHorizontalLayout.getter()
{
  return byte_1EA344E70;
}

uint64_t static RecentsListItemViewHelper.shouldUseCompactHorizontalLayout.setter(char a1)
{
  uint64_t result = swift_beginAccess();
  byte_1EA344E70 = a1;
  return result;
}

uint64_t (*static RecentsListItemViewHelper.shouldUseCompactHorizontalLayout.modify())()
{
  return j_j__swift_endAccess;
}

id sub_1C2F68AFC()
{
  id result = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FADBD0]), sel_init);
  qword_1EA344580 = (uint64_t)result;
  return result;
}

char *RecentsListItemViewHelper.__allocating_init(parentView:location:)(void *a1, char *a2)
{
  swift_allocObject();
  id v4 = sub_1C2F6B7BC(a1, a2);

  return v4;
}

char *RecentsListItemViewHelper.init(parentView:location:)(void *a1, char *a2)
{
  uint64_t v3 = sub_1C2F6B7BC(a1, a2);

  return v3;
}

void sub_1C2F68BBC()
{
  uint64_t v1 = self;
  id v2 = objc_msgSend(v1, sel_telephonyUIBodyShortEmphasizedFont);
  id v3 = objc_msgSend(v2, sel__fontAdjustedForCurrentContentSizeCategory);

  id v4 = objc_msgSend(v1, sel_telephonyUISubheadlineShortFont);
  id v5 = objc_msgSend(v4, sel__fontAdjustedForCurrentContentSizeCategory);

  objc_msgSend(*(id *)(v0 + 16), sel_setFont_, v3);
  objc_msgSend(*(id *)(v0 + 48), sel_setFont_, v3);
  objc_msgSend(*(id *)(v0 + 24), sel_setFont_, v5);
  objc_msgSend(*(id *)(v0 + 32), sel_setFont_, v5);
  objc_msgSend(*(id *)(v0 + 40), sel_setFont_, v5);

  objc_msgSend(*(id *)(v0 + 152), sel_setSpacing_, 4.0);
  uint64_t v6 = *(void **)(v0 + 160);
  id v7 = *(void **)(v0 + 24);
  objc_msgSend(v7, sel_effectiveFirstBaselineOffsetFromTop);
  objc_msgSend(v6, sel_setCustomFirstBaselineOffsetFromTop_);
  id v8 = *(void **)(v0 + 168);
  id v9 = objc_msgSend(v7, sel_font);
  if (v9)
  {
    id v10 = v9;
    objc_msgSend(v9, sel__scaledValueForValue_useLanguageAwareScaling_, 1, 19.0);
    double v12 = v11;
  }
  else
  {
    double v12 = 19.0;
  }
  objc_msgSend(v8, sel_setRowSpacing_, v12);
  unint64_t v13 = *(void **)(v0 + 232);
  id v14 = objc_msgSend(v13, sel_traitCollection);
  unsigned int v15 = objc_msgSend(v14, sel_isPreferredContentSizeCategoryAccessible);

  double v16 = 10.0;
  double v17 = 0.0;
  if (v15) {
    double v16 = 0.0;
  }
  (*(void (**)(uint64_t *__return_ptr, id))(*(void *)v0 + 552))(&v45, objc_msgSend(v8, sel_setColumnSpacing_, v16));
  unsigned int v18 = v45;
  if (v45 == 3)
  {
    id v19 = objc_msgSend(*(id *)(v0 + 24), sel_font);
    if (!v19) {
      goto LABEL_15;
    }
    id v20 = v19;
LABEL_13:
    objc_msgSend(v20, sel__scaledValueForValue_useLanguageAwareScaling_, 1, 0.0);
    goto LABEL_14;
  }
  id v21 = objc_msgSend(*(id *)(v0 + 24), sel_font);
  id v20 = v21;
  if (v18 > 1)
  {
    if (!v21) {
      goto LABEL_15;
    }
    goto LABEL_13;
  }
  if (v21)
  {
    objc_msgSend(v21, sel__scaledValueForValue_useLanguageAwareScaling_, 1, 4.0);
LABEL_14:
    double v17 = v22;

    goto LABEL_15;
  }
  double v17 = 4.0;
LABEL_15:
  objc_msgSend(v6, sel_setSpacing_, v17);
  sub_1C2F6B480();
  CGRect v23 = *(void **)(v0 + 176);
  id v24 = objc_msgSend(v23, sel_arrangedSubviews);
  if (!v24) {
    goto LABEL_25;
  }
  id v25 = v24;
  sub_1C2F6CDD0(0, &qword_1EA343130);
  unint64_t v26 = sub_1C2F6E3F8();

  if (v26 >> 62)
  {
    sub_1C2F6E0F8();
    uint64_t v29 = sub_1C2F6E5A8();
    swift_bridgeObjectRelease();
    if (v29) {
      goto LABEL_18;
    }
LABEL_24:
    swift_bridgeObjectRelease();
    goto LABEL_25;
  }
  if (!*(void *)((v26 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_24;
  }
LABEL_18:
  if ((v26 & 0xC000000000000001) != 0)
  {
    id v27 = (id)MEMORY[0x1C876D680](0, v26);
  }
  else
  {
    if (!*(void *)((v26 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return;
    }
    id v27 = *(id *)(v26 + 32);
  }
  CGFloat v28 = v27;
  swift_bridgeObjectRelease();
  objc_msgSend(v28, sel_setLayoutMargins_, *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));

LABEL_25:
  id v30 = objc_msgSend(v13, sel_traitCollection);
  unsigned int v31 = objc_msgSend(v30, sel_isPreferredContentSizeCategoryAccessible);

  if (v31) {
    double v32 = 0.0;
  }
  else {
    double v32 = 16.0;
  }
  objc_msgSend(v23, sel_setDirectionalLayoutMargins_, 12.0, 16.0, 12.0, v32);
  id v33 = objc_msgSend(v13, sel_traitCollection);
  unsigned int v34 = objc_msgSend(v33, sel_isPreferredContentSizeCategoryAccessible);

  CGFloat v35 = *(void **)(v0 + 40);
  if (v34)
  {
    objc_msgSend(*(id *)(v0 + 40), sel_setTextAlignment_, 4);
    objc_msgSend(v23, sel_setAxis_, 1);
    id v36 = objc_msgSend(v35, sel_font);
    if (v36)
    {
      CGFloat v37 = v36;
      objc_msgSend(v36, sel__scaledValueForValue_useLanguageAwareScaling_, 1, 20.0);
      double v39 = v38;
    }
    else
    {
      double v39 = 20.0;
    }
    objc_msgSend(v7, sel_effectiveBaselineOffsetFromContentBottom);
    double v42 = v39 - v43;
  }
  else
  {
    objc_msgSend(*(id *)(v0 + 40), sel_setTextAlignment_, 2);
    objc_msgSend(v23, sel_setAxis_, 0);
    id v40 = objc_msgSend(v13, sel_traitCollection);
    unsigned int v41 = objc_msgSend(v40, sel_isPreferredContentSizeCategoryAccessible);

    double v42 = 6.0;
    if (v41) {
      double v42 = 0.0;
    }
  }
  id v44 = (id)(*(uint64_t (**)(id))(*(void *)v0 + 448))(objc_msgSend(v23, sel_setSpacing_, v42));
  objc_msgSend(v44, sel_setNeedsUpdateConfiguration);
}

uint64_t sub_1C2F6916C(void *a1)
{
  id v2 = v1;
  uint64_t v4 = a1[3];
  uint64_t v5 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v4);
  uint64_t v6 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v4, v5);
  (*(void (**)(uint64_t))(*v1 + 360))(v6);
  id v7 = (void *)v1[2];
  uint64_t v8 = a1[3];
  uint64_t v9 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v8);
  (*(void (**)(uint64_t, uint64_t))(v9 + 24))(v8, v9);
  if (v10)
  {
    double v11 = (void *)sub_1C2F6E3C8();
    swift_bridgeObjectRelease();
  }
  else
  {
    double v11 = 0;
  }
  objc_msgSend(v7, sel_setText_, v11);

  uint64_t v12 = a1[3];
  uint64_t v13 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v12);
  id v14 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v13 + 56))(v12, v13);
  objc_msgSend(v7, sel_setTextColor_, v14);

  unsigned int v15 = (void *)v2[6];
  uint64_t v16 = a1[3];
  uint64_t v17 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v16);
  (*(void (**)(uint64_t, uint64_t))(v17 + 48))(v16, v17);
  if (v18)
  {
    id v19 = (void *)sub_1C2F6E3C8();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v19 = 0;
  }
  objc_msgSend(v15, sel_setText_, v19);

  id v20 = objc_msgSend(v7, sel_textColor);
  objc_msgSend(v15, sel_setTextColor_, v20);

  id v21 = (void *)v2[3];
  uint64_t v22 = a1[3];
  uint64_t v23 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v22);
  (*(void (**)(uint64_t, uint64_t))(v23 + 32))(v22, v23);
  if (v24)
  {
    id v25 = (void *)sub_1C2F6E3C8();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v25 = 0;
  }
  objc_msgSend(v21, sel_setText_, v25);

  unint64_t v26 = (void *)v2[7];
  sub_1C2F6C0D0(a1);
  CGFloat v28 = v27;
  objc_msgSend(v26, sel_setImage_, v27);

  id v29 = objc_msgSend(v26, sel_image);
  id v30 = v29;
  if (v29) {

  }
  v161 = v21;
  objc_msgSend(v26, sel_setHidden_, v30 == 0);
  uint64_t v31 = a1[3];
  uint64_t v32 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v31);
  (*(void (**)(unsigned __int8 *__return_ptr, uint64_t, uint64_t))(v32 + 16))(v165, v31, v32);
  unsigned __int8 v33 = v165[0];
  swift_beginAccess();
  *((unsigned char *)v2 + 224) = v33;
  sub_1C2F683D4();
  int v160 = *((unsigned __int8 *)v2 + 240);
  objc_msgSend(v15, sel_setHidden_, v160 ^ 1u);
  if (qword_1EA344598 != -1) {
    swift_once();
  }
  if (objc_msgSend((id)qword_1EA344580, sel_recentsCallTapTargetsEnabled))
  {
    unsigned int v34 = self;
    id v35 = objc_msgSend(v34, sel_configurationWithPointSize_weight_, 9, 33.0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA343140);
    uint64_t v36 = swift_allocObject();
    *(_OWORD *)(v36 + 16) = xmmword_1C2F73EB0;
    CGFloat v37 = self;
    *(void *)(v36 + 32) = objc_msgSend(v37, sel_systemGreenColor);
    *(void *)(v36 + 40) = objc_msgSend(v37, sel_quaternarySystemFillColor);
    *(void *)v165 = v36;
    sub_1C2F6E408();
    sub_1C2F6CDD0(0, &qword_1EA343740);
    double v38 = (void *)sub_1C2F6E3E8();
    swift_bridgeObjectRelease();
    id v39 = objc_msgSend(v34, sel_configurationWithPaletteColors_, v38);

    id v40 = objc_msgSend(v35, sel_configurationByApplyingConfiguration_, v39);
    uint64_t v41 = a1[3];
    uint64_t v42 = a1[4];
    __swift_project_boxed_opaque_existential_1(a1, v41);
    uint64_t v43 = (*(uint64_t (**)(uint64_t, uint64_t))(v42 + 72))(v41, v42);
    if ((v44 & 1) != 0 || v43 != 2)
    {
      (*(void (**)(unsigned __int8 *__return_ptr, uint64_t))(*v2 + 552))(v165, v43);
      if (v165[0] != 3)
      {
        unsigned __int8 v164 = v165[0];
        char v163 = 0;
        sub_1C2F5093C();
        sub_1C2F6E3B8();
      }
    }
    uint64_t v45 = (uint64_t (**)(void))(*v2 + 424);
    CGFloat v46 = *v45;
    double v47 = (void *)(*v45)();
    id v48 = v40;
    double v49 = (void *)sub_1C2F6E3C8();
    swift_bridgeObjectRelease();
    id v50 = objc_msgSend(self, sel_systemImageNamed_withConfiguration_, v49, v48);

    objc_msgSend(v47, sel_setImage_forState_, v50, 0);
    double v51 = (void *)v46();
    objc_msgSend(v51, sel_sizeToFit);
  }
  uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA343110);
  uint64_t v53 = *(void *)(*(void *)(v52 - 8) + 64);
  MEMORY[0x1F4188790](v52 - 8);
  uint64_t v54 = a1[3];
  uint64_t v55 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v54);
  if ((*(uint64_t (**)(uint64_t, uint64_t))(v55 + 96))(v54, v55))
  {
    uint64_t v56 = a1[3];
    uint64_t v57 = a1[4];
    __swift_project_boxed_opaque_existential_1(a1, v56);
    (*(void (**)(uint64_t, uint64_t))(v57 + 104))(v56, v57);
  }
  else
  {
    uint64_t v58 = sub_1C2F6E028();
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v58 - 8) + 56))(&v159[-((v53 + 15) & 0xFFFFFFFFFFFFFFF0)], 1, 1, v58);
  }
  swift_beginAccess();
  int v59 = byte_1EA344E70;
  CGRect v60 = (void *)v2[4];
  uint64_t v61 = a1[3];
  uint64_t v62 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v61);
  v162 = &v159[-((v53 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (v59 == 1)
  {
    (*(void (**)(uint64_t, uint64_t))(v62 + 112))(v61, v62);
    if (v63)
    {
      v64 = (void *)sub_1C2F6E3C8();
      swift_bridgeObjectRelease();
    }
    else
    {
      v64 = 0;
    }
    objc_msgSend(v60, sel_setText_, v64);

    v67 = (void *)v2[5];
    MEMORY[0x1F4188790](v68);
    v69 = &v159[-((v53 + 15) & 0xFFFFFFFFFFFFFFF0)];
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(v62 + 120))(v61, v62);
    if (v65)
    {
      v66 = (void *)sub_1C2F6E3C8();
      swift_bridgeObjectRelease();
    }
    else
    {
      v66 = 0;
    }
    objc_msgSend(v60, sel_setText_, v66);

    v67 = (void *)v2[5];
    MEMORY[0x1F4188790](v70);
    v69 = &v159[-((v53 + 15) & 0xFFFFFFFFFFFFFFF0)];
    id v71 = objc_msgSend(v60, sel_text);
    if (v71)
    {

      uint64_t v72 = sub_1C2F6E028();
      (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v72 - 8) + 56))(&v159[-((v53 + 15) & 0xFFFFFFFFFFFFFFF0)], 1, 1, v72);
      v73 = 0;
      goto LABEL_35;
    }
  }
  sub_1C2F6C5C4((uint64_t)&v159[-((v53 + 15) & 0xFFFFFFFFFFFFFFF0)], (uint64_t)v69);
  uint64_t v74 = sub_1C2F6E028();
  uint64_t v75 = *(void *)(v74 - 8);
  v73 = 0;
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v75 + 48))(v69, 1, v74) != 1)
  {
    v73 = (void *)sub_1C2F6E008();
    (*(void (**)(unsigned char *, uint64_t))(v75 + 8))(v69, v74);
  }
LABEL_35:
  objc_msgSend(v67, sel_setDate_, v73);

  uint64_t v76 = (uint64_t)v162;
  if (byte_1EA344E70 == 1)
  {
    id v77 = objc_msgSend(v67, sel_date);
    v78 = &v159[-((v53 + 15) & 0xFFFFFFFFFFFFFFF0)];
    if (MEMORY[0x1F4188790](v77))
    {
      uint64_t v79 = sub_1C2F6E028();
      uint64_t v80 = *(void *)(v79 - 8);
      MEMORY[0x1F4188790](v79);
      v82 = &v159[-((v81 + 15) & 0xFFFFFFFFFFFFFFF0)];
      sub_1C2F6E018();

      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v80 + 32))(v78, v82, v79);
      (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v80 + 56))(v78, 0, 1, v79);
      uint64_t v76 = (uint64_t)v162;
      if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v80 + 48))(v78, 1, v79) != 1)
      {
        sub_1C2F6C62C((uint64_t)v78);
        uint64_t v83 = 0;
        uint64_t v84 = 1;
LABEL_42:
        v85 = v161;
        v86 = &selRef_setAcceptButton_;
        goto LABEL_43;
      }
    }
    else
    {
      uint64_t v87 = sub_1C2F6E028();
      (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v87 - 8) + 56))(&v159[-((v53 + 15) & 0xFFFFFFFFFFFFFFF0)], 1, 1, v87);
    }
    sub_1C2F6C62C((uint64_t)v78);
    uint64_t v84 = 0;
    uint64_t v83 = 1;
    goto LABEL_42;
  }
  uint64_t v83 = 0;
  uint64_t v84 = 0;
  v85 = v161;
  v86 = &selRef_setAcceptButton_;
LABEL_43:
  objc_msgSend(v67, v86[96], v83);
  objc_msgSend(v85, v86[96], v84);
  uint64_t v88 = a1[3];
  uint64_t v89 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v88);
  uint64_t v90 = (*(uint64_t (**)(uint64_t, uint64_t))(v89 + 88))(v88, v89);
  char v92 = v91;
  uint64_t v93 = (*(uint64_t (**)(void))(*v2 + 304))();
  id v94 = (id)v93;
  if ((v92 & 1) != 0 || v90 != 1)
  {
    if (!v93) {
      goto LABEL_56;
    }
    v108 = (void *)v2[20];
    id v109 = objc_msgSend(v108, sel_arrangedSubviews);
    if (v109)
    {
      v110 = v109;
      sub_1C2F6CDD0(0, &qword_1EA343130);
      unint64_t v111 = sub_1C2F6E3F8();

      LOBYTE(v110) = sub_1C2F6AF34((uint64_t)v94, v111);
      swift_bridgeObjectRelease();
      if (v110) {
        objc_msgSend(v108, sel_removeArrangedSubview_, v94);
      }
    }
    objc_msgSend(v94, sel_removeFromSuperview);
    (*(void (**)(void))(*v2 + 312))(0);
  }
  else
  {
    if (!v93)
    {
      id v95 = objc_msgSend(self, sel_recentsVerifiedCheckmarkImage);
      id v96 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1838]), sel_initWithImage_, v95);

      v97 = self;
      id v94 = v96;
      id v98 = objc_msgSend(v97, sel_dynamicTertiaryLabelColor);
      objc_msgSend(v94, sel_setTintColor_, v98);

      (*(void (**)(id))(*v2 + 312))(v94);
    }
    v99 = (void *)v2[20];
    id v100 = objc_msgSend(v99, sel_arrangedSubviews);
    if (v100)
    {
      v101 = v100;
      sub_1C2F6CDD0(0, &qword_1EA343130);
      unint64_t v102 = sub_1C2F6E3F8();

      id v103 = v94;
      char v104 = sub_1C2F6AF34((uint64_t)v103, v102);

      swift_bridgeObjectRelease();
      if ((v104 & 1) == 0)
      {
        uint64_t v105 = v2[3];
        id v106 = v103;
        objc_msgSend(v99, sel_insertArrangedSubview_atIndex_, v106, objc_msgSend(v99, sel_indexOfArrangedSubview_, v105));

        LODWORD(v107) = 1148846080;
        objc_msgSend(v106, sel_tp_setCHCRPriority_, v107);
      }
    }
  }

LABEL_56:
  uint64_t v112 = a1[3];
  uint64_t v113 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v112);
  uint64_t v114 = (*(uint64_t (**)(uint64_t, uint64_t))(v113 + 40))(v112, v113);
  if (v115)
  {
    uint64_t v116 = HIBYTE(v115) & 0xF;
    if ((v115 & 0x2000000000000000) == 0) {
      uint64_t v116 = v114 & 0xFFFFFFFFFFFFLL;
    }
    if (v116)
    {
      v117 = (void *)(*(uint64_t (**)(void))(*v2 + 328))();
      if (v117)
      {
        id v118 = v117;
        v119 = (void *)sub_1C2F6E3C8();
        objc_msgSend(v118, sel_setTitle_, v119);
      }
      else
      {
        id v125 = objc_allocWithZone((Class)TPBadgeView);
        sub_1C2F6E0F8();
        v126 = (void *)sub_1C2F6E3C8();
        swift_bridgeObjectRelease();
        id v127 = objc_msgSend(v125, sel_initWithTitle_, v126);

        v128 = self;
        id v118 = v127;
        id v129 = objc_msgSend(v128, sel_dynamicTertiaryLabelColor);
        objc_msgSend(v118, sel_setTintColor_, v129);

        (*(void (**)(id))(*v2 + 336))(v118);
      }
      v130 = (void *)v2[20];
      id v131 = objc_msgSend(v130, sel_arrangedSubviews);
      if (v131)
      {
        v132 = v131;
        sub_1C2F6CDD0(0, &qword_1EA343130);
        unint64_t v133 = sub_1C2F6E3F8();

        id v134 = v118;
        char v135 = sub_1C2F6AF34((uint64_t)v134, v133);

        swift_bridgeObjectRelease();
        if ((v135 & 1) == 0)
        {
          objc_msgSend(v130, sel_insertArrangedSubview_atIndex_, v134, 1);
          objc_msgSend(v130, sel_setAlignment_forView_inAxis_, 3, v134, 0);
          LODWORD(v136) = 1148846080;
          objc_msgSend(v134, sel_tp_setCHCRPriority_, v136);
        }
      }
      swift_bridgeObjectRelease();
      goto LABEL_73;
    }
    uint64_t v114 = swift_bridgeObjectRelease();
  }
  uint64_t v120 = (*(uint64_t (**)(uint64_t))(*v2 + 328))(v114);
  if (!v120) {
    goto LABEL_74;
  }
  id v118 = (id)v120;
  v121 = (void *)v2[20];
  id v122 = objc_msgSend(v121, sel_arrangedSubviews);
  if (v122)
  {
    v123 = v122;
    sub_1C2F6CDD0(0, &qword_1EA343130);
    unint64_t v124 = sub_1C2F6E3F8();

    LOBYTE(v123) = sub_1C2F6AF34((uint64_t)v118, v124);
    swift_bridgeObjectRelease();
    if (v123) {
      objc_msgSend(v121, sel_removeArrangedSubview_, v118);
    }
  }
  objc_msgSend(v118, sel_removeFromSuperview);
  (*(void (**)(void))(*v2 + 336))(0);
LABEL_73:

LABEL_74:
  if (objc_msgSend((id)qword_1EA344580, sel_videoMessagingEnabled))
  {
    uint64_t v137 = a1[3];
    uint64_t v138 = a1[4];
    __swift_project_boxed_opaque_existential_1(a1, v137);
    uint64_t v139 = (*(uint64_t (**)(uint64_t, uint64_t))(v138 + 128))(v137, v138);
    if (v139)
    {
      v140 = (void *)v139;
      v141 = (void *)(*(uint64_t (**)(void))(*v2 + 528))();
      if (v141)
      {
        v142 = v141;
        id v143 = objc_msgSend(v141, sel_superview);

        if (v143)
        {
          (*(void (**)(void *))((*MEMORY[0x1E4FBC8C8] & *v142) + 0xF0))(v140);

LABEL_87:
          goto LABEL_88;
        }

        v140 = v142;
      }
    }
    uint64_t v144 = a1[3];
    uint64_t v145 = a1[4];
    __swift_project_boxed_opaque_existential_1(a1, v144);
    uint64_t v146 = (*(uint64_t (**)(uint64_t, uint64_t))(v145 + 128))(v144, v145);
    if (v146)
    {
      v147 = (void *)v146;
      uint64_t v148 = a1[3];
      uint64_t v149 = a1[4];
      __swift_project_boxed_opaque_existential_1(a1, v148);
      v150 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v149 + 128))(v148, v149);
      if (v150 && (v151 = v150, unsigned int v152 = objc_msgSend(v150, sel_isSensitive), v151, v152))
      {
        type metadata accessor for SensitiveMessageIndicatorView();
        unsigned __int8 v164 = v160;
        v153 = sub_1C2F66A70((char *)&v164, v147);
      }
      else
      {
        type metadata accessor for MessageIndicatorView();
        unsigned __int8 v164 = v160;
        v153 = sub_1C2F64CCC((char *)&v164, v147);
      }
      v154 = v153;
      objc_msgSend((id)v2[29], sel_addSubview_, v153);
      v155 = *(void (**)(void *))(*v2 + 536);
      v142 = v154;
      v155(v154);

      uint64_t v76 = (uint64_t)v162;
    }
    else
    {
      v157 = (void *)(*(uint64_t (**)(void))(*v2 + 528))();
      if (!v157) {
        goto LABEL_88;
      }
      v142 = v157;
      id v158 = objc_msgSend(v157, sel_superview);

      if (v158)
      {
        objc_msgSend(v142, sel_removeFromSuperview);
        (*(void (**)(void))(*v2 + 536))(0);
      }
    }
    goto LABEL_87;
  }
LABEL_88:
  sub_1C2F68BBC();
  return sub_1C2F6C62C(v76);
}

void sub_1C2F6A660(char a1, void *a2)
{
  uint64_t v5 = (void *)v2[29];
  objc_msgSend(v5, sel_bounds);
  double v7 = v6;
  objc_msgSend(v5, sel_bounds);
  double Width = CGRectGetWidth(v39);
  if ((a1 & 1) == 0)
  {
    objc_msgSend(v5, sel_directionalLayoutMargins);
    double v10 = Width - v9;
    objc_msgSend(a2, sel_bounds);
    double Width = v10 - CGRectGetWidth(v40);
  }
  double v11 = (void *)v2[22];
  objc_msgSend(v11, sel_sizeThatFits_, Width, v7);
  double v13 = v12;
  if (qword_1EA344598 != -1) {
    swift_once();
  }
  id v14 = (void *)qword_1EA344580;
  objc_msgSend((id)qword_1EA344580, sel_videoMessagingEnabledM3);
  objc_msgSend(v11, sel_setFrame_, 0.0, 0.0, Width, v13);
  objc_msgSend(v11, sel_center);
  objc_msgSend(a2, sel_center);
  objc_msgSend(a2, sel_setCenter_);
  if (objc_msgSend(v14, sel_recentsCallTapTargetsEnabled))
  {
    objc_msgSend(a2, sel_center);
    objc_msgSend(a2, sel_setCenter_);
  }
  objc_msgSend(a2, sel_frame);
  objc_msgSend(a2, (SEL)&selRef_setNameLabel_, Width);
  double v15 = 1.0;
  if (a1) {
    double v15 = 0.0;
  }
  uint64_t v16 = (*(uint64_t (**)(id))(*v2 + 528))(objc_msgSend(a2, sel_setAlpha_, v15));
  if (v16)
  {
    uint64_t v17 = (void *)v16;
    objc_msgSend(v5, sel_bounds);
    objc_msgSend(v17, sel_sizeThatFits_, v18, v19);
    double v21 = v20;
    uint64_t v22 = qword_1EA344E60;
    id v23 = v17;
    if (v22 != -1) {
      swift_once();
    }
    double v24 = *(double *)&qword_1EA344E68;
    objc_msgSend(v11, sel_frame);
    CGFloat v25 = CGRectGetMaxY(v41) + -2.0;
    objc_msgSend(v5, sel_bounds);
    objc_msgSend(v23, (SEL)&selRef_setNameLabel_, v24, v25, CGRectGetWidth(v42) - (*(double *)&qword_1EA344E68 + *(double *)&qword_1EA344E68), v21);
  }
  if (objc_msgSend(v5, sel_effectiveUserInterfaceLayoutDirection) == (id)1)
  {
    id v26 = a2;
    id v27 = v11;
    objc_msgSend(v5, sel_bounds);
    double v28 = CGRectGetWidth(v43);
    objc_msgSend(v26, sel_frame);
    double v30 = v28 - v29;
    objc_msgSend(v26, sel_frame);
    double v31 = v30 - CGRectGetMinX(v44);
    objc_msgSend(v26, sel_frame);
    objc_msgSend(v26, (SEL)&selRef_setNameLabel_, v31);
    id v32 = v27;
    objc_msgSend(v5, sel_bounds);
    double v33 = CGRectGetWidth(v45);
    objc_msgSend(v32, sel_frame);
    double v35 = v33 - v34;
    objc_msgSend(v32, sel_frame);
    double v36 = v35 - CGRectGetMinX(v46);
    objc_msgSend(v32, sel_frame);
    objc_msgSend(v32, (SEL)&selRef_setNameLabel_, v36);

    id v37 = (id)(*(uint64_t (**)(void))(*v2 + 448))();
    objc_msgSend(v37, sel_setNeedsUpdateConfiguration);
  }
}

double sub_1C2F6AAB0(char a1, void *a2, double a3, double a4)
{
  uint64_t v8 = *(void **)(v4 + 232);
  objc_msgSend(v8, sel_bounds);
  double Width = CGRectGetWidth(v20);
  if ((a1 & 1) == 0)
  {
    objc_msgSend(v8, sel_directionalLayoutMargins);
    double v11 = Width - v10;
    objc_msgSend(a2, sel_bounds);
    double Width = v11 - CGRectGetWidth(v21);
  }
  objc_msgSend(v8, sel_bounds);
  if (v12 >= Width) {
    double v13 = Width;
  }
  else {
    double v13 = v12;
  }
  id v14 = objc_msgSend(*(id *)(v4 + 176), sel_sizeThatFits_, v13, 0.0);
  double v16 = v15;
  uint64_t v17 = (void *)(*(uint64_t (**)(id))(*(void *)v4 + 528))(v14);
  if (v17)
  {
    double v18 = v17;
    objc_msgSend(v17, sel_sizeThatFits_, Width, a4);
  }
  return v16;
}

uint64_t RecentsListItemViewHelper.deinit()
{
  sub_1C2F645AC(*(void *)(v0 + 184));
  sub_1C2F645AC(*(void *)(v0 + 200));

  return v0;
}

uint64_t RecentsListItemViewHelper.__deallocating_deinit()
{
  RecentsListItemViewHelper.deinit();
  return swift_deallocClassInstance();
}

id sub_1C2F6ACD8(void *a1, double a2)
{
  LODWORD(a2) = 1148846080;
  objc_msgSend(a1, sel_setContentCompressionResistancePriority_forAxis_, 1, a2);
  LODWORD(v3) = 1148846080;
  objc_msgSend(a1, sel_setContentHuggingPriority_forAxis_, 1, v3);
  objc_msgSend(a1, sel_setNumberOfLines_, 1);
  return objc_msgSend(a1, sel_setLineBreakMode_, 4);
}

void sub_1C2F6AD68(void *a1, double a2)
{
  LODWORD(a2) = 1148846080;
  objc_msgSend(a1, sel_setContentCompressionResistancePriority_forAxis_, 1, a2);
  LODWORD(v3) = 1148846080;
  objc_msgSend(a1, sel_setContentHuggingPriority_forAxis_, 1, v3);
  objc_msgSend(a1, sel_setNumberOfLines_, 2);
  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1618]), sel_initWithWhite_alpha_, 0.6, 1.0);
  objc_msgSend(a1, sel_setTextColor_, v4);
}

id sub_1C2F6AE34()
{
  uint64_t v1 = *(void **)(v0 + 40);
  if (*(unsigned char *)(v0 + 240) == 1)
  {
    objc_msgSend(*(id *)(v0 + 40), sel__setDrawsAsBackdropOverlayWithBlendMode_, 0);
    objc_msgSend(*(id *)(v0 + 24), sel__setDrawsAsBackdropOverlayWithBlendMode_, 0);
    id v2 = *(void **)(v0 + 32);
  }
  else
  {
    uint64_t v3 = 3;
    if (UIAccessibilityIsReduceTransparencyEnabled()) {
      uint64_t v4 = 0;
    }
    else {
      uint64_t v4 = 3;
    }
    objc_msgSend(v1, sel__setDrawsAsBackdropOverlayWithBlendMode_, v4);
    uint64_t v5 = *(void **)(v0 + 24);
    if (UIAccessibilityIsReduceTransparencyEnabled()) {
      uint64_t v6 = 0;
    }
    else {
      uint64_t v6 = 3;
    }
    objc_msgSend(v5, sel__setDrawsAsBackdropOverlayWithBlendMode_, v6);
    id v2 = *(void **)(v0 + 32);
    if (!UIAccessibilityIsReduceTransparencyEnabled()) {
      goto LABEL_11;
    }
  }
  uint64_t v3 = 0;
LABEL_11:
  return objc_msgSend(v2, sel__setDrawsAsBackdropOverlayWithBlendMode_, v3);
}

uint64_t sub_1C2F6AF34(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    goto LABEL_20;
  }
  uint64_t v3 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  sub_1C2F6E0F8();
  for (; v3; uint64_t v3 = sub_1C2F6E5A8())
  {
    unint64_t v4 = a2 & 0xC000000000000001;
    if ((a2 & 0xC000000000000001) == 0)
    {
      id v5 = *(id *)(a2 + 32);
      goto LABEL_5;
    }
    while (1)
    {
      id v5 = (id)MEMORY[0x1C876D680](0, a2);
LABEL_5:
      uint64_t v6 = v5;
      sub_1C2F6CDD0(0, &qword_1EA343130);
      char v7 = sub_1C2F6E528();

      if (v7)
      {
LABEL_6:
        swift_bridgeObjectRelease();
        return 1;
      }
      if (v3 == 1) {
        goto LABEL_18;
      }
      if (v4) {
        break;
      }
      unint64_t v4 = 5;
      while (1)
      {
        unint64_t v12 = v4 - 3;
        if (__OFADD__(v4 - 4, 1)) {
          break;
        }
        id v13 = *(id *)(a2 + 8 * v4);
        char v14 = sub_1C2F6E528();

        if (v14) {
          goto LABEL_6;
        }
        ++v4;
        if (v12 == v3) {
          goto LABEL_18;
        }
      }
      __break(1u);
    }
    uint64_t v9 = 1;
    while (1)
    {
      MEMORY[0x1C876D680](v9, a2);
      uint64_t v10 = v9 + 1;
      if (__OFADD__(v9, 1)) {
        break;
      }
      char v11 = sub_1C2F6E528();
      swift_unknownObjectRelease();
      if (v11) {
        goto LABEL_6;
      }
      ++v9;
      if (v10 == v3) {
        goto LABEL_18;
      }
    }
    __break(1u);
LABEL_20:
    sub_1C2F6E0F8();
  }
LABEL_18:
  swift_bridgeObjectRelease();
  return 0;
}

void sub_1C2F6B0BC(void *a1)
{
  uint64_t v2 = v1;
  id v4 = objc_msgSend(a1, sel_superview);

  if (!v4)
  {
    id v5 = *(void **)(v2 + 168);
    if (objc_msgSend(v5, sel_numberOfColumns) == (id)2)
    {
      id v6 = objc_msgSend(v5, sel_arrangedSubviewInColumnAtIndex_rowAtIndex_, 0, 0);
      objc_msgSend(v5, sel_replaceArrangedSubview_inColumnAtIndex_rowAtIndex_, a1, 0, 0);
      objc_msgSend(v6, sel_removeFromSuperview);
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EA343140);
      uint64_t v7 = swift_allocObject();
      *(_OWORD *)(v7 + 16) = xmmword_1C2F73EC0;
      *(void *)(v7 + 32) = a1;
      sub_1C2F6E408();
      sub_1C2F6CDD0(0, &qword_1EA343130);
      id v8 = a1;
      id v6 = (id)sub_1C2F6E3E8();
      swift_bridgeObjectRelease();
      id v9 = objc_msgSend(v5, sel_insertColumnAtIndex_withArrangedSubviews_, 0, v6);
      swift_unknownObjectRelease();
    }

    LODWORD(v10) = 1148846080;
    objc_msgSend(a1, sel_tp_setCHCRPriority_, v10);
    objc_msgSend(v5, sel_setAlignment_forView_inAxis_, 3, a1, 1);
    sub_1C2F6B480();
  }
}

id sub_1C2F6B27C()
{
  uint64_t v1 = *(void **)(v0 + 128);
  if (v1)
  {
    id v2 = *(id *)(v0 + 128);
  }
  else
  {
    double v3 = *(double *)(v0 + 120);
    id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1EB0]), sel_initWithFrame_, 0.0, 0.0, *(double *)(v0 + 112), v3);
    id v5 = objc_msgSend(v4, sel_layer);
    objc_msgSend(v5, sel_setCornerRadius_, v3 * 0.5);

    id v6 = self;
    id v7 = objc_msgSend(v6, sel_lightGrayColor);
    id v8 = objc_msgSend(v7, sel_colorWithAlphaComponent_, 0.4);

    objc_msgSend(v4, sel_setBackgroundColor_, v8);
    id v9 = (void *)sub_1C2F6E3C8();
    id v10 = objc_msgSend(self, sel_systemImageNamed_, v9);

    id v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1838]), sel_initWithImage_, v10);
    id v12 = v11;
    objc_msgSend(v4, sel_center);
    objc_msgSend(v12, sel_setCenter_);

    id v13 = objc_msgSend(v6, sel_whiteColor);
    objc_msgSend(v12, sel_setTintColor_, v13);

    objc_msgSend(v4, sel_addSubview_, v12);
    char v14 = *(void **)(v0 + 128);
    *(void *)(v0 + 128) = v4;
    id v2 = v4;

    uint64_t v1 = 0;
  }
  id v15 = v1;
  return v2;
}

void sub_1C2F6B480()
{
  uint64_t v1 = *(void **)(v0 + 168);
  if ((uint64_t)objc_msgSend(v1, sel_numberOfColumns) < 2) {
    return;
  }
  id v2 = (uint64_t (**)(void))(*(void *)v0 + 376);
  double v3 = *v2;
  id v4 = (void *)(*v2)();
  if (v4)
  {
    id v5 = v4;
    id v6 = objc_msgSend(v4, sel_view);

    if (!v6)
    {
      __break(1u);
      goto LABEL_16;
    }
    objc_msgSend(v6, sel_setMinimumLayoutSize_, *(double *)(v0 + 112), *(double *)(v0 + 120));
  }
  id v7 = (void *)v3();
  if (!v7) {
    goto LABEL_8;
  }
  id v8 = v7;
  id v9 = objc_msgSend(v7, sel_view);

  if (!v9)
  {
LABEL_16:
    __break(1u);
    return;
  }
  objc_msgSend(v9, sel_setMaximumLayoutSize_, *(double *)(v0 + 112), *(double *)(v0 + 120));

LABEL_8:
  id v10 = *(void **)(v0 + 128);
  if (v10)
  {
    objc_msgSend(v10, sel_setMinimumLayoutSize_, *(double *)(v0 + 112), *(double *)(v0 + 120));
    id v11 = *(void **)(v0 + 128);
    if (v11) {
      objc_msgSend(v11, sel_setMaximumLayoutSize_, *(double *)(v0 + 112), *(double *)(v0 + 120));
    }
  }
  id v12 = objc_msgSend(v1, sel_columnAtIndex_, 0);
  id v13 = objc_msgSend(*(id *)(v0 + 232), sel_traitCollection);
  id v14 = objc_msgSend(v13, sel_isPreferredContentSizeCategoryAccessible);

  objc_msgSend(v12, sel_setHidden_, v14);
  swift_unknownObjectRelease();
}

BOOL sub_1C2F6B794(int a1)
{
  return *MEMORY[0x1E4F57CA8] == a1 || *MEMORY[0x1E4F57C98] == a1;
}

char *sub_1C2F6B7BC(void *a1, char *a2)
{
  double v3 = v2;
  char v5 = *a2;
  id v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1930]), sel_init);
  *((void *)v3 + 2) = v6;
  *((void *)v3 + 3) = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1930]), sel_init);
  *((void *)v3 + 4) = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1930]), sel_init);
  *((void *)v3 + 5) = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB16A8]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  id v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1930]), sel_init);
  *((void *)v3 + 6) = v7;
  *((void *)v3 + 7) = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1838]), sel_init);
  *((void *)v3 + 8) = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1838]), sel_init);
  *(_OWORD *)(v3 + 72) = 0u;
  *(_OWORD *)(v3 + 88) = 0u;
  *((void *)v3 + 13) = 0;
  *((int64x2_t *)v3 + 7) = vdupq_n_s64(0x4046800000000000uLL);
  *((void *)v3 + 17) = 0;
  *((void *)v3 + 18) = 0;
  *((void *)v3 + 16) = 0;
  *(_OWORD *)(v3 + 184) = 0u;
  *(_OWORD *)(v3 + 200) = 0u;
  *((void *)v3 + 27) = 0;
  v3[224] = 3;
  *((void *)v3 + 29) = a1;
  v3[240] = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA343140);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_1C2F73EB0;
  *(void *)(v8 + 32) = v6;
  *(void *)(v8 + 40) = v7;
  sub_1C2F6E408();
  id v9 = objc_allocWithZone(MEMORY[0x1E4F4BF00]);
  sub_1C2F6CDD0(0, &qword_1EA343130);
  id v10 = a1;
  id v11 = v6;
  id v12 = v7;
  id v13 = (void *)sub_1C2F6E3E8();
  swift_bridgeObjectRelease();
  id v14 = &selRef_character;
  id v15 = objc_msgSend(v9, sel_initWithArrangedSubviews_, v13);

  *((void *)v3 + 19) = v15;
  swift_beginAccess();
  if (byte_1EA344E70 == 1)
  {
    uint64_t v16 = swift_allocObject();
    *(_OWORD *)(v16 + 16) = xmmword_1C2F73ED0;
    uint64_t v17 = (void *)*((void *)v3 + 7);
    double v18 = (void *)*((void *)v3 + 3);
    *(void *)(v16 + 32) = v17;
    *(void *)(v16 + 40) = v18;
    double v19 = (void *)*((void *)v3 + 5);
    *(void *)(v16 + 48) = v19;
    sub_1C2F6E408();
    id v20 = objc_allocWithZone(MEMORY[0x1E4F4BF00]);
    id v21 = v17;
    id v22 = v18;
    id v23 = v19;
    id v14 = &selRef_character;
  }
  else
  {
    uint64_t v24 = swift_allocObject();
    *(_OWORD *)(v24 + 16) = xmmword_1C2F73EB0;
    CGFloat v25 = (void *)*((void *)v3 + 7);
    id v26 = (void *)*((void *)v3 + 3);
    *(void *)(v24 + 32) = v25;
    *(void *)(v24 + 40) = v26;
    sub_1C2F6E408();
    id v20 = objc_allocWithZone(MEMORY[0x1E4F4BF00]);
    id v27 = v25;
    id v28 = v26;
  }
  double v29 = (void *)sub_1C2F6E3E8();
  swift_bridgeObjectRelease();
  id v30 = objc_msgSend(v20, v14[234], v29);

  *((void *)v3 + 20) = v30;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA343138);
  uint64_t v31 = swift_allocObject();
  *(_OWORD *)(v31 + 16) = xmmword_1C2F73310;
  uint64_t v32 = swift_allocObject();
  *(_OWORD *)(v32 + 16) = xmmword_1C2F73EC0;
  double v33 = (void *)*((void *)v3 + 19);
  *(void *)(v32 + 32) = v33;
  uint64_t v80 = v32;
  sub_1C2F6E408();
  *(void *)(v31 + 32) = v80;
  uint64_t v34 = swift_allocObject();
  *(_OWORD *)(v34 + 16) = xmmword_1C2F73EC0;
  double v35 = (void *)*((void *)v3 + 4);
  *(void *)(v34 + 32) = v35;
  uint64_t v81 = v34;
  sub_1C2F6E408();
  *(void *)(v31 + 40) = v81;
  uint64_t v36 = swift_allocObject();
  *(_OWORD *)(v36 + 16) = xmmword_1C2F73EC0;
  *(void *)(v36 + 32) = v30;
  uint64_t v82 = v36;
  sub_1C2F6E408();
  *(void *)(v31 + 48) = v82;
  id v37 = objc_allocWithZone(MEMORY[0x1E4F4BEF8]);
  id v38 = v33;
  id v39 = v35;
  id v40 = v30;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA343120);
  CGRect v41 = (void *)sub_1C2F6E3E8();
  swift_bridgeObjectRelease();
  id v42 = objc_msgSend(v37, sel_initWithArrangedSubviewRows_, v41);

  *((void *)v3 + 21) = v42;
  if (byte_1EA344E70 == 1)
  {
    uint64_t v43 = swift_allocObject();
    *(_OWORD *)(v43 + 16) = xmmword_1C2F73EC0;
    *(void *)(v43 + 32) = v42;
    sub_1C2F6E408();
    id v44 = objc_allocWithZone(MEMORY[0x1E4F4BF00]);
    id v45 = v42;
  }
  else
  {
    uint64_t v46 = swift_allocObject();
    *(_OWORD *)(v46 + 16) = xmmword_1C2F73EB0;
    double v47 = (void *)*((void *)v3 + 5);
    *(void *)(v46 + 32) = v42;
    *(void *)(v46 + 40) = v47;
    sub_1C2F6E408();
    id v44 = objc_allocWithZone(MEMORY[0x1E4F4BF00]);
    id v48 = v42;
    id v49 = v47;
  }
  id v50 = (void *)sub_1C2F6E3E8();
  swift_bridgeObjectRelease();
  id v51 = objc_msgSend(v44, v14[234], v50);

  *((void *)v3 + 22) = v51;
  id v52 = objc_msgSend(self, sel_defaultCenter);
  objc_msgSend(v52, sel_addObserver_selector_name_object_, v3, sel_updateForReducedTransparancy, *MEMORY[0x1E4FB24A0], 0);

  uint64_t v53 = (void *)*((void *)v3 + 22);
  objc_msgSend(v53, sel_setAutoresizingMask_, 18);
  objc_msgSend(*((id *)v3 + 29), sel_addSubview_, v53);
  uint64_t v54 = (void *)*((void *)v3 + 2);
  LODWORD(v55) = 1148846080;
  objc_msgSend(v54, sel_setContentCompressionResistancePriority_forAxis_, 1, v55);
  LODWORD(v56) = 1148846080;
  objc_msgSend(v54, sel_setContentHuggingPriority_forAxis_, 1, v56);
  objc_msgSend(v54, sel_setNumberOfLines_, 1);
  objc_msgSend(v54, sel_setLineBreakMode_, 4);
  uint64_t v57 = (void *)*((void *)v3 + 6);
  LODWORD(v58) = 1148846080;
  objc_msgSend(v57, sel_setContentCompressionResistancePriority_forAxis_, 1, v58);
  LODWORD(v59) = 1148846080;
  objc_msgSend(v57, sel_setContentHuggingPriority_forAxis_, 1, v59);
  objc_msgSend(v57, sel_setNumberOfLines_, 1);
  objc_msgSend(v57, sel_setLineBreakMode_, 4);
  LODWORD(v60) = 1148846080;
  objc_msgSend(v57, sel_setContentCompressionResistancePriority_forAxis_, 0, v60);
  LODWORD(v61) = 1148846080;
  objc_msgSend(v57, sel_setContentHuggingPriority_forAxis_, 0, v61);
  uint64_t v62 = (void *)*((void *)v3 + 19);
  objc_msgSend(v62, sel_setAlignment_, 1);
  objc_msgSend(v62, sel_setAlignment_forView_inAxis_, 4, v57, 0);
  uint64_t v63 = (void *)*((void *)v3 + 3);
  LODWORD(v64) = 1148846080;
  objc_msgSend(v63, sel_setContentCompressionResistancePriority_forAxis_, 1, v64);
  LODWORD(v65) = 1148846080;
  objc_msgSend(v63, sel_setContentHuggingPriority_forAxis_, 1, v65);
  objc_msgSend(v63, sel_setNumberOfLines_, 2);
  id v66 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1618]), sel_initWithWhite_alpha_, 0.6, 1.0);
  objc_msgSend(v63, sel_setTextColor_, v66);

  v67 = (void *)*((void *)v3 + 4);
  LODWORD(v68) = 1148846080;
  objc_msgSend(v67, sel_setContentCompressionResistancePriority_forAxis_, 1, v68);
  LODWORD(v69) = 1148846080;
  objc_msgSend(v67, sel_setContentHuggingPriority_forAxis_, 1, v69);
  objc_msgSend(v67, sel_setNumberOfLines_, 2);
  id v70 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1618]), sel_initWithWhite_alpha_, 0.6, 1.0);
  objc_msgSend(v67, sel_setTextColor_, v70);

  id v71 = (void *)*((void *)v3 + 7);
  id v72 = objc_msgSend(self, sel_dynamicTertiaryLabelColor);
  objc_msgSend(v71, sel_setTintColor_, v72);

  objc_msgSend(v71, sel_setUserInteractionEnabled_, 0);
  LODWORD(v73) = 1148846080;
  objc_msgSend(v71, sel_tp_setCHCRPriority_, v73);
  objc_msgSend(v71, sel_setAdjustsImageSizeForAccessibilityContentSizeCategory_, 1);
  objc_msgSend(*((id *)v3 + 20), sel_setAlignment_, 3);
  uint64_t v74 = (void *)*((void *)v3 + 21);
  objc_msgSend(v74, sel_setLayoutMarginsRelativeArrangement_, 1);
  objc_msgSend(v74, sel_setBaselineRelativeArrangement_, 1);
  uint64_t v75 = (void *)*((void *)v3 + 5);
  id v76 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1618]), sel_initWithWhite_alpha_, 0.6, 1.0);
  objc_msgSend(v75, sel_setTextColor_, v76);

  LODWORD(v77) = 1148846080;
  v78 = (void *)(*(uint64_t (**)(id))(*(void *)v3 + 424))(objc_msgSend(v75, sel_tp_setCHCRPriority_, v77));
  objc_msgSend(v78, sel_addTarget_action_forControlEvents_, v3, sel_didTapDetailAccessoryButtonWithSender_, 64);

  objc_msgSend(v53, sel_setLayoutMarginsRelativeArrangement_, 1);
  objc_msgSend(v53, sel_setBaselineRelativeArrangement_, 1);
  objc_msgSend(v53, sel_setInvalidatingIntrinsicContentSizeAlsoInvalidatesSuperview_, 1);
  sub_1C2F68BBC();
  objc_msgSend(v3, sel_updateForReducedTransparancy);
  return v3;
}

void sub_1C2F6C0D0(void *a1)
{
  uint64_t v2 = a1[3];
  uint64_t v3 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v2);
  uint64_t v4 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 80))(v2, v3);
  if ((v5 & 1) == 0)
  {
    if (v4 == 2)
    {
      id v6 = objc_msgSend(self, sel_recentsTTYRelayGlyphImage);
      goto LABEL_36;
    }
    if (v4 == 1)
    {
      id v6 = objc_msgSend(self, sel_recentsTTYDirectGlyphImage);
LABEL_36:
      v6;
      return;
    }
  }
  if (qword_1EA344598 != -1) {
    swift_once();
  }
  id v7 = (void *)qword_1EA344580;
  unsigned int v8 = objc_msgSend((id)qword_1EA344580, sel_recentsCallTapTargetsEnabled);
  uint64_t v9 = a1[3];
  uint64_t v10 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v9);
  if (v8)
  {
    if (((*(uint64_t (**)(uint64_t, uint64_t))(v10 + 64))(v9, v10) & 0x100000000) == 0)
    {
      id v11 = objc_msgSend(self, sel_telephonyUISubheadlineShortFont);
      id v12 = objc_msgSend(v11, sel__fontAdjustedForCurrentContentSizeCategory);

      if (v12)
      {
        id v13 = objc_msgSend(self, sel_configurationWithFont_scale_, v12, 1);
        uint64_t v24 = (void *)sub_1C2F6E3C8();
        objc_msgSend(self, sel_systemImageNamed_withConfiguration_, v24, v13);
      }
      else
      {
        __break(1u);
      }
    }
    return;
  }
  uint64_t v14 = (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 72))(v9, v10);
  if ((v15 & 1) == 0)
  {
    uint64_t v16 = v14;
    if (objc_msgSend(v7, sel_videoMessagingEnabledM3))
    {
      uint64_t v17 = a1[3];
      uint64_t v18 = a1[4];
      __swift_project_boxed_opaque_existential_1(a1, v17);
      double v19 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v18 + 128))(v17, v18);
      if (v19)
      {

        id v20 = self;
        if (v16 == 2)
        {
LABEL_15:
          id v6 = objc_msgSend(v20, sel_recentsIncomingVideoCallGlyphImage);
          goto LABEL_36;
        }
LABEL_35:
        id v6 = objc_msgSend(v20, sel_recentsIncomingAudioCallGlyphImage);
        goto LABEL_36;
      }
      uint64_t v25 = a1[3];
      uint64_t v26 = a1[4];
      __swift_project_boxed_opaque_existential_1(a1, v25);
      uint64_t v27 = (*(uint64_t (**)(uint64_t, uint64_t))(v26 + 64))(v25, v26);
      if ((v27 & 0x100000000) == 0)
      {
        int v28 = v27;
        int v29 = *MEMORY[0x1E4F57CA8];
        id v20 = self;
        if (v29 == v28 || *MEMORY[0x1E4F57C98] == v28)
        {
          if (v16 == 2) {
            id v6 = objc_msgSend(v20, sel_recentsOutgoingVideoCallGlyphImage);
          }
          else {
            id v6 = objc_msgSend(v20, sel_recentsOutgoingAudioCallGlyphImage);
          }
          goto LABEL_36;
        }
        if (v16 == 2) {
          goto LABEL_15;
        }
        goto LABEL_35;
      }
      id v23 = self;
      if (v16 == 2)
      {
LABEL_21:
        id v6 = objc_msgSend(v23, sel_favoritesVideoGlyphImage);
        goto LABEL_36;
      }
    }
    else
    {
      id v23 = self;
      if (v16 == 2) {
        goto LABEL_21;
      }
    }
    id v6 = objc_msgSend(v23, sel_favoritesAudioGlyphImage);
    goto LABEL_36;
  }
  uint64_t v21 = a1[3];
  uint64_t v22 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v21);
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v22 + 16))(&v31, v21, v22);
  unsigned __int8 v30 = 0;
  if (static RecentsCallItemStyle.== infix(_:_:)((unsigned __int8 *)&v31, &v30))
  {
    id v6 = objc_msgSend(self, sel_favoritesVideoGlyphImage);
    goto LABEL_36;
  }
}

uint64_t sub_1C2F6C5C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA343110);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C2F6C62C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA343110);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1C2F6C690()
{
  unint64_t result = qword_1EA343748;
  if (!qword_1EA343748)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA343748);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for RecentsListItemLocation(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for RecentsListItemLocation(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 1;
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
        JUMPOUT(0x1C2F6C840);
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
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

unsigned char *sub_1C2F6C868(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for RecentsListItemLocation()
{
  return &type metadata for RecentsListItemLocation;
}

uint64_t type metadata accessor for RecentsListItemViewHelper()
{
  return self;
}

uint64_t method lookup function for RecentsListItemViewHelper(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for RecentsListItemViewHelper);
}

uint64_t dispatch thunk of RecentsListItemViewHelper.avatarViewController.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 376))();
}

uint64_t dispatch thunk of RecentsListItemViewHelper.avatarViewController.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 384))();
}

uint64_t dispatch thunk of RecentsListItemViewHelper.avatarViewController.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 392))();
}

uint64_t dispatch thunk of RecentsListItemViewHelper.detailAccessoryButton.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 424))();
}

uint64_t dispatch thunk of RecentsListItemViewHelper.detailAccessoryButton.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 432))();
}

uint64_t dispatch thunk of RecentsListItemViewHelper.detailAccessoryButton.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 440))();
}

uint64_t dispatch thunk of RecentsListItemViewHelper.callButton.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 448))();
}

uint64_t dispatch thunk of RecentsListItemViewHelper.callButton.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 456))();
}

uint64_t dispatch thunk of RecentsListItemViewHelper.callButton.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 464))();
}

uint64_t dispatch thunk of RecentsListItemViewHelper.detailAccessoryTapHandler.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 480))();
}

uint64_t dispatch thunk of RecentsListItemViewHelper.detailAccessoryTapHandler.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 488))();
}

uint64_t dispatch thunk of RecentsListItemViewHelper.detailAccessoryTapHandler.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 496))();
}

uint64_t dispatch thunk of RecentsListItemViewHelper.callButtonTapHandler.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 504))();
}

uint64_t dispatch thunk of RecentsListItemViewHelper.callButtonTapHandler.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 512))();
}

uint64_t dispatch thunk of RecentsListItemViewHelper.callButtonTapHandler.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 520))();
}

uint64_t dispatch thunk of RecentsListItemViewHelper.messageIndicatorView.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 528))();
}

uint64_t dispatch thunk of RecentsListItemViewHelper.messageIndicatorView.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 536))();
}

uint64_t dispatch thunk of RecentsListItemViewHelper.messageIndicatorView.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 544))();
}

uint64_t dispatch thunk of RecentsListItemViewHelper.__allocating_init(parentView:location:)()
{
  return (*(uint64_t (**)(void))(v0 + 584))();
}

uint64_t dispatch thunk of RecentsListItemViewHelper.updateForParentTraitCollectionDidChange()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 592))();
}

uint64_t dispatch thunk of RecentsListItemViewHelper.configure(with:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 600))();
}

uint64_t dispatch thunk of RecentsListItemViewHelper.layout(shouldHideTrailingAccessoryView:trailingAccessoryView:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 608))();
}

uint64_t dispatch thunk of RecentsListItemViewHelper.sizeThatFits(_:shouldHideTrailingAccessoryView:trailingAccessoryView:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 616))();
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_1C2F6CCA8(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_1C2F6CCC8(uint64_t result, int a2, int a3)
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

void type metadata accessor for CGSize()
{
  if (!qword_1EA343128)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1EA343128);
    }
  }
}

uint64_t sub_1C2F6CD48()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1C2F6CD80()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1C2F6CDA8()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1C2F6CDD0(uint64_t a1, unint64_t *a2)
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

void getPRUISIncomingCallPosterAttachmentTypeIdentifierNameLabel_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"PRUISIncomingCallPosterAttachmentTypeIdentifier getPRUISIncomingCallPosterAttachmentTypeIdentifierNameLabel(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"TPInComingCallUISnapshotViewController.m", 69, @"%s", dlerror());

  __break(1u);
}

void __getPRPosterLabelClass_block_invoke_cold_1(void *a1)
{
  int v2 = [MEMORY[0x1E4F28B00] currentHandler];
  char v3 = [NSString stringWithUTF8String:"void *PosterKitLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"TPInComingCallUISnapshotViewController.m", 45, @"%s", *a1);

  __break(1u);
}

void __getPRPosterLabelClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getPRPosterLabelClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"TPInComingCallUISnapshotViewController.m", 48, @"Unable to find class %s", "PRPosterLabel");

  __break(1u);
}

void __getCNImageDerivedColorGeneratorClass_block_invoke_cold_1(void *a1)
{
  int v2 = [MEMORY[0x1E4F28B00] currentHandler];
  char v3 = [NSString stringWithUTF8String:"void *ContactsUILibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"TPInComingCallUISnapshotViewController.m", 31, @"%s", *a1);

  __break(1u);
}

void __getCNImageDerivedColorGeneratorClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getCNImageDerivedColorGeneratorClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"TPInComingCallUISnapshotViewController.m", 32, @"Unable to find class %s", "CNImageDerivedColorGenerator");

  __break(1u);
}

void PosterBoardUIServicesLibrary_cold_1(void *a1)
{
  int v2 = [MEMORY[0x1E4F28B00] currentHandler];
  char v3 = [NSString stringWithUTF8String:"void *PosterBoardUIServicesLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"TPInComingCallUISnapshotViewController.m", 57, @"%s", *a1);

  __break(1u);
}

void __getPRUISPosterAppearanceObservingAttachmentProviderClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getPRUISPosterAppearanceObservingAttachmentProviderClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"TPInComingCallUISnapshotViewController.m", 65, @"Unable to find class %s", "PRUISPosterAppearanceObservingAttachmentProvider");

  __break(1u);
}

void __getPRUISIncomingCallPosterContextClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getPRUISIncomingCallPosterContextClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"TPInComingCallUISnapshotViewController.m", 58, @"Unable to find class %s", "PRUISIncomingCallPosterContext");

  __break(1u);
}

void __getPRUISIncomingCallSnapshotDefinitionClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getPRUISIncomingCallSnapshotDefinitionClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"TPInComingCallUISnapshotViewController.m", 59, @"Unable to find class %s", "PRUISIncomingCallSnapshotDefinition");

  __break(1u);
}

void __getPRUISMutablePosterSnapshotRequestClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getPRUISMutablePosterSnapshotRequestClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"TPInComingCallUISnapshotViewController.m", 61, @"Unable to find class %s", "PRUISMutablePosterSnapshotRequest");

  __break(1u);
}

void __getPRUISPosterAttachmentConfigurationClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getPRUISPosterAttachmentConfigurationClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"TPInComingCallUISnapshotViewController.m", 64, @"Unable to find class %s", "PRUISPosterAttachmentConfiguration");

  __break(1u);
}

void __getPRUISPosterSnapshotControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getPRUISPosterSnapshotControllerClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"TPInComingCallUISnapshotViewController.m", 63, @"Unable to find class %s", "PRUISPosterSnapshotController");

  __break(1u);
}

void _MKBGetDeviceLockState_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"int _MKBGetDeviceLockState(CFDictionaryRef)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"TPDialPromptAlert.m", 26, @"%s", dlerror());

  __break(1u);
}

void __getMKBGetDeviceLockStateSymbolLoc_block_invoke_cold_1(void *a1)
{
  int v2 = [MEMORY[0x1E4F28B00] currentHandler];
  char v3 = [NSString stringWithUTF8String:"void *MobileKeyBagLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"TPDialPromptAlert.m", 25, @"%s", *a1);

  __break(1u);
}

void __getPRIncomingCallTextViewAdapterWrapperClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getPRIncomingCallTextViewAdapterWrapperClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"TPIncomingCallMetricsProvider.m", 39, @"Unable to find class %s", "PRIncomingCallTextViewAdapterWrapper");

  __break(1u);
}

void PosterKitLibrary_cold_1(void *a1)
{
  int v2 = [MEMORY[0x1E4F28B00] currentHandler];
  char v3 = [NSString stringWithUTF8String:"void *PosterKitLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"TPIncomingCallMetricsProvider.m", 38, @"%s", *a1);

  __break(1u);
}

void __getPRIncomingCallMetricsProviderClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getPRIncomingCallMetricsProviderClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"TPIncomingCallMetricsProvider.m", 41, @"Unable to find class %s", "PRIncomingCallMetricsProvider");

  __break(1u);
}

uint64_t sub_1C2F6DF58()
{
  return MEMORY[0x1F40E3548]();
}

uint64_t sub_1C2F6DF68()
{
  return MEMORY[0x1F40E35A0]();
}

uint64_t sub_1C2F6DF78()
{
  return MEMORY[0x1F40E3F50]();
}

uint64_t sub_1C2F6DF88()
{
  return MEMORY[0x1F40E43F0]();
}

uint64_t sub_1C2F6DF98()
{
  return MEMORY[0x1F40E43F8]();
}

uint64_t sub_1C2F6DFA8()
{
  return MEMORY[0x1F40E4410]();
}

uint64_t sub_1C2F6DFB8()
{
  return MEMORY[0x1F40E4420]();
}

uint64_t sub_1C2F6DFC8()
{
  return MEMORY[0x1F40E4448]();
}

uint64_t sub_1C2F6DFD8()
{
  return MEMORY[0x1F40E4458]();
}

uint64_t sub_1C2F6DFE8()
{
  return MEMORY[0x1F40E4A78]();
}

uint64_t sub_1C2F6DFF8()
{
  return MEMORY[0x1F40E4B88]();
}

uint64_t sub_1C2F6E008()
{
  return MEMORY[0x1F40E5190]();
}

uint64_t sub_1C2F6E018()
{
  return MEMORY[0x1F40E52E8]();
}

uint64_t sub_1C2F6E028()
{
  return MEMORY[0x1F40E5380]();
}

uint64_t sub_1C2F6E048()
{
  return MEMORY[0x1F4164150]();
}

uint64_t sub_1C2F6E058()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1C2F6E068()
{
  return MEMORY[0x1F4188680]();
}

uint64_t sub_1C2F6E078()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1C2F6E088()
{
  return MEMORY[0x1F4102150]();
}

uint64_t sub_1C2F6E098()
{
  return MEMORY[0x1F4102198]();
}

uint64_t sub_1C2F6E0A8()
{
  return MEMORY[0x1F41021B0]();
}

uint64_t sub_1C2F6E0B8()
{
  return MEMORY[0x1F41021B8]();
}

uint64_t sub_1C2F6E0C8()
{
  return MEMORY[0x1F41021D8]();
}

uint64_t sub_1C2F6E0D8()
{
  return MEMORY[0x1F41021E0]();
}

uint64_t sub_1C2F6E0E8()
{
  return MEMORY[0x1F4102270]();
}

uint64_t sub_1C2F6E0F8()
{
  return MEMORY[0x1F4102298]();
}

uint64_t sub_1C2F6E108()
{
  return MEMORY[0x1F41022B8]();
}

uint64_t sub_1C2F6E118()
{
  return MEMORY[0x1F41022C8]();
}

uint64_t sub_1C2F6E128()
{
  return MEMORY[0x1F41022D8]();
}

uint64_t sub_1C2F6E138()
{
  return MEMORY[0x1F41022F0]();
}

uint64_t sub_1C2F6E148()
{
  return MEMORY[0x1F4102310]();
}

uint64_t sub_1C2F6E158()
{
  return MEMORY[0x1F4102328]();
}

uint64_t sub_1C2F6E168()
{
  return MEMORY[0x1F4102330]();
}

uint64_t sub_1C2F6E178()
{
  return MEMORY[0x1F4102340]();
}

uint64_t sub_1C2F6E188()
{
  return MEMORY[0x1F4102358]();
}

uint64_t sub_1C2F6E198()
{
  return MEMORY[0x1F4102368]();
}

uint64_t sub_1C2F6E1A8()
{
  return MEMORY[0x1F4102388]();
}

uint64_t sub_1C2F6E1B8()
{
  return MEMORY[0x1F4102390]();
}

uint64_t sub_1C2F6E1C8()
{
  return MEMORY[0x1F41023C0]();
}

uint64_t sub_1C2F6E1D8()
{
  return MEMORY[0x1F41023C8]();
}

uint64_t sub_1C2F6E1E8()
{
  return MEMORY[0x1F41023E0]();
}

uint64_t sub_1C2F6E1F8()
{
  return MEMORY[0x1F41023E8]();
}

uint64_t sub_1C2F6E208()
{
  return MEMORY[0x1F41023F8]();
}

uint64_t sub_1C2F6E218()
{
  return MEMORY[0x1F4102410]();
}

uint64_t sub_1C2F6E228()
{
  return MEMORY[0x1F4102418]();
}

uint64_t sub_1C2F6E238()
{
  return MEMORY[0x1F4102428]();
}

uint64_t sub_1C2F6E248()
{
  return MEMORY[0x1F4102440]();
}

uint64_t sub_1C2F6E258()
{
  return MEMORY[0x1F4102450]();
}

uint64_t sub_1C2F6E268()
{
  return MEMORY[0x1F4102458]();
}

uint64_t sub_1C2F6E278()
{
  return MEMORY[0x1F4102470]();
}

uint64_t sub_1C2F6E288()
{
  return MEMORY[0x1F4102478]();
}

uint64_t sub_1C2F6E298()
{
  return MEMORY[0x1F4102488]();
}

uint64_t sub_1C2F6E2A8()
{
  return MEMORY[0x1F4102498]();
}

uint64_t sub_1C2F6E2B8()
{
  return MEMORY[0x1F41024A8]();
}

uint64_t sub_1C2F6E2C8()
{
  return MEMORY[0x1F41024C0]();
}

uint64_t sub_1C2F6E2D8()
{
  return MEMORY[0x1F41024C8]();
}

uint64_t sub_1C2F6E2E8()
{
  return MEMORY[0x1F41024E0]();
}

uint64_t sub_1C2F6E2F8()
{
  return MEMORY[0x1F41024F8]();
}

uint64_t sub_1C2F6E308()
{
  return MEMORY[0x1F4102510]();
}

uint64_t sub_1C2F6E318()
{
  return MEMORY[0x1F4102520]();
}

uint64_t sub_1C2F6E328()
{
  return MEMORY[0x1F4102558]();
}

uint64_t sub_1C2F6E338()
{
  return MEMORY[0x1F4102570]();
}

uint64_t sub_1C2F6E348()
{
  return MEMORY[0x1F4102588]();
}

uint64_t sub_1C2F6E358()
{
  return MEMORY[0x1F4102590]();
}

uint64_t sub_1C2F6E368()
{
  return MEMORY[0x1F40F9AC8]();
}

uint64_t sub_1C2F6E378()
{
  return MEMORY[0x1F40FB550]();
}

uint64_t sub_1C2F6E388()
{
  return MEMORY[0x1F40FB588]();
}

uint64_t sub_1C2F6E398()
{
  return MEMORY[0x1F40FC528]();
}

uint64_t sub_1C2F6E3A8()
{
  return MEMORY[0x1F40FC558]();
}

uint64_t sub_1C2F6E3B8()
{
  return MEMORY[0x1F4183838]();
}

uint64_t sub_1C2F6E3C8()
{
  return MEMORY[0x1F40E6198]();
}

uint64_t sub_1C2F6E3D8()
{
  return MEMORY[0x1F40E61D0]();
}

uint64_t sub_1C2F6E3E8()
{
  return MEMORY[0x1F40E6340]();
}

uint64_t sub_1C2F6E3F8()
{
  return MEMORY[0x1F40E6368]();
}

uint64_t sub_1C2F6E408()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t sub_1C2F6E418()
{
  return MEMORY[0x1F4187BF0]();
}

uint64_t sub_1C2F6E428()
{
  return MEMORY[0x1F4187C00]();
}

uint64_t sub_1C2F6E438()
{
  return MEMORY[0x1F4187C08]();
}

uint64_t sub_1C2F6E448()
{
  return MEMORY[0x1F4187C10]();
}

uint64_t sub_1C2F6E458()
{
  return MEMORY[0x1F4187C98]();
}

uint64_t sub_1C2F6E468()
{
  return MEMORY[0x1F4187CA0]();
}

uint64_t sub_1C2F6E478()
{
  return MEMORY[0x1F4187CA8]();
}

uint64_t sub_1C2F6E488()
{
  return MEMORY[0x1F4187CE8]();
}

uint64_t sub_1C2F6E498()
{
  return MEMORY[0x1F4187CF8]();
}

uint64_t sub_1C2F6E4A8()
{
  return MEMORY[0x1F4187D00]();
}

uint64_t sub_1C2F6E4B8()
{
  return MEMORY[0x1F4187D38]();
}

uint64_t sub_1C2F6E4C8()
{
  return MEMORY[0x1F4187D48]();
}

uint64_t sub_1C2F6E4D8()
{
  return MEMORY[0x1F4187D50]();
}

uint64_t sub_1C2F6E4F8()
{
  return MEMORY[0x1F4187D78]();
}

uint64_t sub_1C2F6E508()
{
  return MEMORY[0x1F4187D98]();
}

uint64_t sub_1C2F6E518()
{
  return MEMORY[0x1F4188700]();
}

uint64_t sub_1C2F6E528()
{
  return MEMORY[0x1F41874B8]();
}

uint64_t sub_1C2F6E538()
{
  return MEMORY[0x1F4184B20]();
}

uint64_t sub_1C2F6E548()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1C2F6E558()
{
  return MEMORY[0x1F4187F70]();
}

uint64_t sub_1C2F6E568()
{
  return MEMORY[0x1F4187F78]();
}

uint64_t sub_1C2F6E578()
{
  return MEMORY[0x1F4187F80]();
}

uint64_t sub_1C2F6E588()
{
  return MEMORY[0x1F4184F98]();
}

uint64_t sub_1C2F6E598()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t sub_1C2F6E5A8()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_1C2F6E5B8()
{
  return MEMORY[0x1F4185368]();
}

uint64_t sub_1C2F6E5C8()
{
  return MEMORY[0x1F4185370]();
}

uint64_t sub_1C2F6E5D8()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_1C2F6E5E8()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1C2F6E608()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1C2F6E628()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_1C2F6E638()
{
  return MEMORY[0x1F4188170]();
}

uint64_t sub_1C2F6E658()
{
  return MEMORY[0x1F4185EA8]();
}

uint64_t sub_1C2F6E668()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1C2F6E678()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1C2F6E688()
{
  return MEMORY[0x1F4185EF8]();
}

OSStatus AudioServicesAddSystemSoundCompletion(SystemSoundID inSystemSoundID, CFRunLoopRef inRunLoop, CFStringRef inRunLoopMode, AudioServicesSystemSoundCompletionProc inCompletionRoutine, void *inClientData)
{
  return MEMORY[0x1F40D4E08](*(void *)&inSystemSoundID, inRunLoop, inRunLoopMode, inCompletionRoutine, inClientData);
}

void AudioServicesRemoveSystemSoundCompletion(SystemSoundID inSystemSoundID)
{
}

OSStatus AudioServicesSetProperty(AudioServicesPropertyID inPropertyID, UInt32 inSpecifierSize, const void *inSpecifier, UInt32 inPropertyDataSize, const void *inPropertyData)
{
  return MEMORY[0x1F40D4E60](*(void *)&inPropertyID, *(void *)&inSpecifierSize, inSpecifier, *(void *)&inPropertyDataSize, inPropertyData);
}

uint64_t AudioServicesStartSystemSound()
{
  return MEMORY[0x1F40D4E68]();
}

uint64_t AudioServicesStopSystemSound()
{
  return MEMORY[0x1F40D4E70]();
}

uint64_t BSSizeCeilForScale()
{
  return MEMORY[0x1F410C608]();
}

CFAllocatorRef CFAllocatorCreate(CFAllocatorRef allocator, CFAllocatorContext *context)
{
  return (CFAllocatorRef)MEMORY[0x1F40D70F8](allocator, context);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1F40D77E8](allocator, bytes, length);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x1F40D7818](allocator, bytes, length, bytesDeallocator);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFRelease(CFTypeRef cf)
{
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x1F40D80B0]();
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x1F40D80B8]();
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
}

void CFSetApplyFunction(CFSetRef theSet, CFSetApplierFunction applier, void *context)
{
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x1F40D8210](allocator, capacity, callBacks);
}

void CFSetRemoveAllValues(CFMutableSetRef theSet)
{
}

void CFSetRemoveValue(CFMutableSetRef theSet, const void *value)
{
}

SInt32 CFUserNotificationCancel(CFUserNotificationRef userNotification)
{
  return MEMORY[0x1F40D8A20](userNotification);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x1F40D8A28](allocator, flags, error, dictionary, timeout);
}

CFRunLoopSourceRef CFUserNotificationCreateRunLoopSource(CFAllocatorRef allocator, CFUserNotificationRef userNotification, CFUserNotificationCallBack callout, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x1F40D8A40](allocator, userNotification, callout, order);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D0](retstr, sx, sy);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1F40D9808](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x1F40D9818](context);
}

size_t CGBitmapContextGetHeight(CGContextRef context)
{
  return MEMORY[0x1F40D9870](context);
}

size_t CGBitmapContextGetWidth(CGContextRef context)
{
  return MEMORY[0x1F40D9878](context);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9AF8]();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

void CGContextClearRect(CGContextRef c, CGRect rect)
{
}

void CGContextClipToMask(CGContextRef c, CGRect rect, CGImageRef mask)
{
}

void CGContextClipToRect(CGContextRef c, CGRect rect)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGContextRelease(CGContextRef c)
{
}

void CGContextRestoreGState(CGContextRef c)
{
}

void CGContextSaveGState(CGContextRef c)
{
}

void CGContextSetFillColorSpace(CGContextRef c, CGColorSpaceRef space)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
}

void CGContextSetShadowWithColor(CGContextRef c, CGSize offset, CGFloat blur, CGColorRef color)
{
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x1F40DA890](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1F40DA948](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1F40DA9B8](image);
}

void CGImageRelease(CGImageRef image)
{
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1F40DB228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB248]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x1F40DB258]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x1F40DB260]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x1F40DB278]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x1F40DB288]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x1F40DB290]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x1F40DB2B0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

CGRect CGRectIntegral(CGRect rect)
{
  MEMORY[0x1F40DB2C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1F40DB2D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t CTFontDescriptorCreateWithTextStyle()
{
  return MEMORY[0x1F40DF420]();
}

unsigned int CTFontGetUnitsPerEm(CTFontRef font)
{
  return MEMORY[0x1F40DF5B0](font);
}

uint64_t CUTWeakLinkClass()
{
  return MEMORY[0x1F4112A70]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

uint64_t MGGetProductType()
{
  return MEMORY[0x1F417CE18]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1F417CE28]();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x1F4166AA8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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
  return (NSString *)MEMORY[0x1F4166AC0](*(__n128 *)&insets.top, *(__n128 *)&insets.left, *(__n128 *)&insets.bottom, *(__n128 *)&insets.right);
}

uint64_t PNCreateFormattedStringWithCountry()
{
  return MEMORY[0x1F4114250]();
}

uint64_t TUCallScreeningDisabledUserDefault()
{
  return MEMORY[0x1F41639C8]();
}

uint64_t TUCurrentProcessHasEntitlement()
{
  return MEMORY[0x1F4163A00]();
}

uint64_t TUDialAssistedDialRequest()
{
  return MEMORY[0x1F4163A20]();
}

uint64_t TUHomeCountryCode()
{
  return MEMORY[0x1F4163A48]();
}

uint64_t TUNetworkCountryCode()
{
  return MEMORY[0x1F4163A88]();
}

uint64_t TUPreferredFaceTimeBundleIdentifier()
{
  return MEMORY[0x1F4163AB8]();
}

uint64_t TUStringKeyForNetwork()
{
  return MEMORY[0x1F4163AD0]();
}

uint64_t TUStringsAreEqualOrNil()
{
  return MEMORY[0x1F4163AE0]();
}

BOOL UIAccessibilityDarkerSystemColorsEnabled(void)
{
  return MEMORY[0x1F4166AF0]();
}

BOOL UIAccessibilityIsBoldTextEnabled(void)
{
  return MEMORY[0x1F4166B00]();
}

BOOL UIAccessibilityIsReduceTransparencyEnabled(void)
{
  return MEMORY[0x1F4166B20]();
}

void UIGraphicsBeginImageContext(CGSize size)
{
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

uint64_t UIImageGetUnreadIndicator()
{
  return MEMORY[0x1F4166CA8]();
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x1F4166CC0](image);
}

UIImageSymbolWeight UIImageSymbolWeightForFontWeight(UIFontWeight fontWeight)
{
  return MEMORY[0x1F4166CC8](fontWeight);
}

uint64_t UIRectCenteredIntegralRect()
{
  return MEMORY[0x1F4166E18]();
}

void UIRectFill(CGRect rect)
{
}

uint64_t _AXSPrefersHorizontalTextLayout()
{
  return MEMORY[0x1F4178E10]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _TUAssertShouldCrashApplication()
{
  return MEMORY[0x1F4163AF8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
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

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_block_cancel(dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CB9C0](flags, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
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

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1F40CC2B8](*(void *)&a1, a2);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1F40CCB10](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1F40CCE40](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1F40CCE88](a1, a2);
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

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40CD0E0](a1, *(void *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1F41863D0]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1F4186410]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1F4186418]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1F4186420]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1F4186428]();
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1F4186488]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x1F4188218]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x1F4188220]();
}

uint64_t swift_deletedMethodError()
{
  return MEMORY[0x1F41864B0]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1F4186518]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1F41865E8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1F41865F8]();
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

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
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

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1F4186790]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1F4188250]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1F4188258]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1F4188260]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
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