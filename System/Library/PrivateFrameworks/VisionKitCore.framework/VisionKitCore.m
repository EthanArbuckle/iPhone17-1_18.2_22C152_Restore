void __vk_deviceSupportsImageAnalysis_block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  if (internal_vk_deviceSupportsImageAnalysis_onceToken != -1) {
    dispatch_once(&internal_vk_deviceSupportsImageAnalysis_onceToken, &__block_literal_global_10);
  }
  vk_deviceSupportsImageAnalysis__supportsWithOverride = internal_vk_deviceSupportsImageAnalysis__supports;
  if (!internal_vk_deviceSupportsImageAnalysis__supports
    && +[VKCInternalSettings overrideDeviceAvailability]&& IsAppleInternalBuild())
  {
    vk_deviceSupportsImageAnalysis__supportsWithOverride = 1;
    v0 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v1 = 0;
      _os_log_impl(&dword_1DB266000, v0, OS_LOG_TYPE_DEFAULT, "Device does not natively support analysis, but override is enabled", v1, 2u);
    }
  }
}

uint64_t vk_imageAnalysisSupportedAndSettingsSwitchEnabled()
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if (vk_deviceSupportsImageAnalysis_onceToken != -1) {
    dispatch_once(&vk_deviceSupportsImageAnalysis_onceToken, &__block_literal_global_19);
  }
  if (!vk_deviceSupportsImageAnalysis__supportsWithOverride) {
    return 0;
  }
  v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v1 = [v0 objectForKey:@"AppleLiveTextEnabled" inDomain:*MEMORY[0x1E4F283E0]];

  if (v1)
  {
    uint64_t v2 = [v1 BOOLValue];
  }
  else
  {
    if (_os_feature_enabled_impl())
    {
      v3 = [&unk_1F357DE98 arrayByAddingObjectsFromArray:&unk_1F357DEB0];
    }
    else
    {
      v3 = &unk_1F357DE98;
    }
    v4 = (void *)MEMORY[0x1E4F1CA20];
    v5 = [MEMORY[0x1E4F1CA20] _deviceLanguage];
    v9[0] = v5;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    v7 = [v4 matchedLanguagesFromAvailableLanguages:v3 forPreferredLanguages:v6];

    uint64_t v2 = [v7 count] != 0;
  }

  return v2;
}

void sub_1DB269308(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

uint64_t vk_isSeedBuild()
{
  return 0;
}

void __internal_vk_deviceSupportsImageAnalysis_block_invoke()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  internal_vk_deviceSupportsImageAnalysis__supports = deviceHasAppleNeuralEngine();
  v0 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    int v3 = 67109120;
    LODWORD(v4) = internal_vk_deviceSupportsImageAnalysis__supports;
    _os_log_impl(&dword_1DB266000, v0, OS_LOG_TYPE_INFO, "Device has Neural Engine: %d", (uint8_t *)&v3, 8u);
  }

  v1 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    if (internal_vk_deviceSupportsImageAnalysis__supports) {
      uint64_t v2 = @"YES";
    }
    else {
      uint64_t v2 = @"NO";
    }
    int v3 = 138412290;
    v4 = v2;
    _os_log_impl(&dword_1DB266000, v1, OS_LOG_TYPE_DEFAULT, "Device Supports Analysis: %@", (uint8_t *)&v3, 0xCu);
  }
}

id getkDDRVInteractionDidFinishNotification()
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  v0 = (void **)getkDDRVInteractionDidFinishNotificationSymbolLoc_ptr;
  uint64_t v8 = getkDDRVInteractionDidFinishNotificationSymbolLoc_ptr;
  if (!getkDDRVInteractionDidFinishNotificationSymbolLoc_ptr)
  {
    v1 = (void *)DataDetectorsUILibrary();
    v6[3] = (uint64_t)dlsym(v1, "kDDRVInteractionDidFinishNotification");
    getkDDRVInteractionDidFinishNotificationSymbolLoc_ptr = v6[3];
    v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    v4 = (_Unwind_Exception *)getkDDRVInteractionDidFinishNotification_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  uint64_t v2 = *v0;
  return v2;
}

void sub_1DB26A4E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB26ACFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getkDDRVInteractionDidFinishNotificationSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)DataDetectorsUILibrary();
  result = dlsym(v2, "kDDRVInteractionDidFinishNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkDDRVInteractionDidFinishNotificationSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t DataDetectorsUILibrary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!DataDetectorsUILibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __DataDetectorsUILibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_1E6BF0AB0;
    uint64_t v5 = 0;
    DataDetectorsUILibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = DataDetectorsUILibraryCore_frameworkLibrary;
  v1 = (void *)v3[0];
  if (!DataDetectorsUILibraryCore_frameworkLibrary)
  {
    v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __DataDetectorsUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  DataDetectorsUILibraryCore_frameworkLibrary = result;
  return result;
}

void __getDDRevealBridgeClass_block_invoke(uint64_t a1)
{
  DataDetectorsUILibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("DDRevealBridge");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getDDRevealBridgeClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v2 = (VKCRemoveBackgroundResult *)__getDDRevealBridgeClass_block_invoke_cold_1();
    [(VKCRemoveBackgroundResult *)v2 dealloc];
  }
}

void sub_1DB26E568(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location,id a26)
{
  objc_destroyWeak(v29);
  objc_destroyWeak(v28);
  objc_destroyWeak(v27);
  objc_destroyWeak(v26);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a26);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_1DB26F4DC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 104));
  _Unwind_Resume(a1);
}

void sub_1DB26FBB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB271188(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1DB271534(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1DB2743FC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 168), 8);
  _Block_object_dispose((const void *)(v1 - 128), 8);
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

void sub_1DB2747E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB274D58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1DB275828(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,void *a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,void *a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,const void *a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  CF<__CFData const*>::~CF(&a60);
  CF<__CFDictionary const*>::~CF(&a70);

  CF<CMPhotoCompressionSession *>::~CF((const void **)&STACK[0x200]);
  CF<CMPhotoDecompressionContainer *>::~CF((const void **)&STACK[0x208]);
  CF<CMPhotoDecompressionContainer *>::~CF((const void **)&STACK[0x210]);
  CF<CMPhotoDecompressionSession *>::~CF((const void **)&STACK[0x218]);

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

const void **CF<CMPhotoDecompressionSession *>::~CF(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void __clang_call_terminate(void *a1)
{
}

const void **CF<CMPhotoDecompressionContainer *>::~CF(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

const void **CF<CMPhotoCompressionSession *>::~CF(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

const void **CF<__CFDictionary const*>::~CF(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

const void **CF<__CVBuffer *>::~CF(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

const void **CF<__CFData const*>::~CF(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

VKQuad *VKImageSpaceQuadFromObservation(void *a1, double a2, double a3, double a4)
{
  id v6 = a1;
  [v6 bottomLeft];
  VKMFlipPoint();
  double v34 = v8;
  double v36 = v7;
  [v6 bottomRight];
  VKMFlipPoint();
  double v30 = v10;
  double v32 = v9;
  [v6 topLeft];
  VKMFlipPoint();
  double v28 = v12;
  double v29 = v11;
  [v6 topRight];

  VKMFlipPoint();
  double v14 = v13;
  double v16 = v15;
  double v17 = VKMPointFromNormalizedRect(v36, v34, a2, a3, a4);
  double v35 = v18;
  double v37 = v17;
  double v19 = VKMPointFromNormalizedRect(v32, v30, a2, a3, a4);
  double v31 = v20;
  double v33 = v19;
  double v21 = VKMPointFromNormalizedRect(v29, v28, a2, a3, a4);
  double v23 = v22;
  double v24 = VKMPointFromNormalizedRect(v14, v16, a2, a3, a4);
  v26 = -[VKQuad initWithBottomLeft:bottomRight:topLeft:topRight:]([VKQuad alloc], "initWithBottomLeft:bottomRight:topLeft:topRight:", v37, v35, v33, v31, v21, v23, v24, v25);
  return v26;
}

void sub_1DB27A2E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
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

void ClipperLib::PolyTree::Clear(ClipperLib::PolyTree *this)
{
  uint64_t v2 = *((void *)this + 10);
  uint64_t v3 = *((void *)this + 11);
  long long v4 = (char *)this + 80;
  if (v3 != v2)
  {
    unint64_t v5 = 0;
    do
    {
      uint64_t v6 = *(void *)(v2 + 8 * v5);
      if (v6)
      {
        (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
        uint64_t v2 = *((void *)this + 10);
        uint64_t v3 = *((void *)this + 11);
      }
      ++v5;
    }
    while (v5 < (v3 - v2) >> 3);
  }
  std::vector<ClipperLib::PolyNode *>::resize((uint64_t)v4, 0);
  std::vector<ClipperLib::PolyNode *>::resize((uint64_t)this + 32, 0);
}

void std::vector<ClipperLib::PolyNode *>::resize(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 3;
  if (a2 <= v2)
  {
    if (a2 < v2) {
      *(void *)(a1 + 8) = *(void *)a1 + 8 * a2;
    }
  }
  else
  {
    std::vector<ClipperLib::PolyNode *>::__append((void **)a1, a2 - v2);
  }
}

uint64_t ClipperLib::PolyTree::GetFirst(ClipperLib::PolyTree *this)
{
  uint64_t v1 = *((void *)this + 4);
  if (v1 == *((void *)this + 5)) {
    return 0;
  }
  else {
    return *(void *)v1;
  }
}

uint64_t ClipperLib::PolyTree::Total(ClipperLib::PolyTree *this)
{
  unint64_t v2 = (void *)*((void *)this + 10);
  uint64_t result = (*((void *)this + 11) - (void)v2) >> 3;
  if ((int)result >= 1) {
    return result - (**((void **)this + 4) != *v2);
  }
  return result;
}

double ClipperLib::PolyNode::PolyNode(ClipperLib::PolyNode *this)
{
  *(void *)this = &unk_1F3555D88;
  double result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 53) = 0u;
  return result;
}

uint64_t ClipperLib::PolyNode::ChildCount(ClipperLib::PolyNode *this)
{
  return (*((void *)this + 5) - *((void *)this + 4)) >> 3;
}

void ClipperLib::PolyNode::AddChild(ClipperLib::PolyNode *this, ClipperLib::PolyNode *a2)
{
  uint64_t v4 = *((void *)this + 4);
  uint64_t v6 = (void *)*((void *)this + 5);
  unint64_t v5 = (void **)((char *)this + 32);
  uint64_t v7 = (uint64_t)v6 - v4;
  double v8 = (char *)this + 32;
  unint64_t v11 = *((void *)v8 + 2);
  uint64_t v9 = (uint64_t)(v8 + 16);
  unint64_t v10 = v11;
  if ((unint64_t)v6 >= v11)
  {
    unint64_t v13 = (v7 >> 3) + 1;
    if (v13 >> 61) {
      std::vector<ClipperLib::IntPoint>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v14 = v10 - v4;
    uint64_t v15 = v14 >> 2;
    if (v14 >> 2 <= v13) {
      uint64_t v15 = (v7 >> 3) + 1;
    }
    if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v16 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v16 = v15;
    }
    if (v16) {
      double v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::PolyNode *>>(v9, v16);
    }
    else {
      double v17 = 0;
    }
    double v18 = &v17[8 * (v7 >> 3)];
    double v19 = &v17[8 * v16];
    *(void *)double v18 = a2;
    double v12 = v18 + 8;
    double v21 = (char *)*((void *)this + 4);
    double v20 = (char *)*((void *)this + 5);
    if (v20 != v21)
    {
      do
      {
        uint64_t v22 = *((void *)v20 - 1);
        v20 -= 8;
        *((void *)v18 - 1) = v22;
        v18 -= 8;
      }
      while (v20 != v21);
      double v20 = (char *)*v5;
    }
    *((void *)this + 4) = v18;
    *((void *)this + 5) = v12;
    *((void *)this + 6) = v19;
    if (v20) {
      operator delete(v20);
    }
  }
  else
  {
    void *v6 = a2;
    double v12 = v6 + 1;
  }
  *((void *)this + 5) = v12;
  *((void *)a2 + 7) = this;
  *((_DWORD *)a2 + 16) = (unint64_t)v7 >> 3;
}

uint64_t ClipperLib::PolyNode::GetNext(ClipperLib::PolyNode *this)
{
  uint64_t v1 = *((void *)this + 4);
  if (v1 == *((void *)this + 5))
  {
    do
    {
      uint64_t v4 = *((void *)this + 7);
      if (!v4) {
        return 0;
      }
      uint64_t v2 = *((unsigned int *)this + 16);
      uint64_t v3 = *(void *)(v4 + 32);
      this = (ClipperLib::PolyNode *)*((void *)this + 7);
    }
    while (((*(void *)(v4 + 40) - v3) >> 3) - 1 == v2);
    uint64_t v1 = v3 + 8 * (v2 + 1);
  }
  return *(void *)v1;
}

uint64_t ClipperLib::PolyNode::GetNextSiblingUp(ClipperLib::PolyNode *this)
{
  while (1)
  {
    uint64_t v1 = *((void *)this + 7);
    if (!v1) {
      break;
    }
    uint64_t v2 = *((unsigned int *)this + 16);
    uint64_t v3 = *(void *)(v1 + 32);
    this = (ClipperLib::PolyNode *)*((void *)this + 7);
    if (((*(void *)(v1 + 40) - v3) >> 3) - 1 != v2) {
      return *(void *)(v3 + 8 * (v2 + 1));
    }
  }
  return 0;
}

uint64_t ClipperLib::PolyNode::IsHole(ClipperLib::PolyNode *this)
{
  int v1 = 1;
  do
  {
    char v2 = v1;
    this = (ClipperLib::PolyNode *)*((void *)this + 7);
    v1 ^= 1u;
  }
  while (this);
  return v2 & 1;
}

uint64_t ClipperLib::PolyNode::IsOpen(ClipperLib::PolyNode *this)
{
  return *((unsigned __int8 *)this + 68);
}

unint64_t ClipperLib::Int128Mul@<X0>(unint64_t this@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X8>)
{
  if ((this & 0x8000000000000000) == 0) {
    uint64_t v3 = this;
  }
  else {
    uint64_t v3 = -(uint64_t)this;
  }
  if (a2 >= 0) {
    uint64_t v4 = a2;
  }
  else {
    uint64_t v4 = -a2;
  }
  unint64_t v5 = v4 * (unint64_t)v3;
  unint64_t v6 = ((HIDWORD(v4) * (unint64_t)v3 + v4 * (unint64_t)HIDWORD(v3)) >> 32)
     + HIDWORD(v4) * (unint64_t)HIDWORD(v3);
  unint64_t v7 = v4 * v3;
  *a3 = v7;
  a3[1] = v6;
  if (v7 < v5) {
    a3[1] = ++v6;
  }
  if (this >> 63 != (unint64_t)a2 >> 63)
  {
    unint64_t v8 = -(uint64_t)v6;
    if (v7) {
      unint64_t v8 = ~v6;
    }
    *a3 = -(uint64_t)v7;
    a3[1] = v8;
  }
  return this;
}

BOOL ClipperLib::Orientation(uint64_t *a1)
{
  return ClipperLib::Area(a1) >= 0.0;
}

double ClipperLib::Area(uint64_t *a1)
{
  uint64_t v1 = *a1;
  unint64_t v2 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  double result = 0.0;
  if ((int)v2 >= 3)
  {
    uint64_t v4 = 0;
    int v5 = v2 - 1;
    unint64_t v6 = (uint64_t *)(v1 + 8);
    do
    {
      unint64_t v7 = (uint64_t *)(v1 + 24 * v5);
      double v8 = (double)*v7 + (double)*(v6 - 1);
      uint64_t v9 = *v6;
      v6 += 3;
      double result = result + v8 * ((double)v7[1] - (double)v9);
      int v5 = v4++;
    }
    while (-1431655765 * ((a1[1] - *a1) >> 3) != v4);
    return result * -0.5;
  }
  return result;
}

double ClipperLib::Area(void *a1)
{
  double result = 0.0;
  if (a1)
  {
    unint64_t v2 = a1;
    do
    {
      double result = result
             + (double)(uint64_t)(v2[1] + *(void *)(v2[5] + 8))
             * (double)(uint64_t)(*(void *)(v2[5] + 16) - v2[2]);
      unint64_t v2 = (void *)v2[4];
    }
    while (v2 != a1);
    return result * 0.5;
  }
  return result;
}

double ClipperLib::Area(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 24);
  if (!v1) {
    return 0.0;
  }
  double v2 = 0.0;
  uint64_t v3 = *(void **)(a1 + 24);
  do
  {
    double v2 = v2 + (double)(uint64_t)(v3[1] + *(void *)(v3[5] + 8)) * (double)(uint64_t)(*(void *)(v3[5] + 16) - v3[2]);
    uint64_t v3 = (void *)v3[4];
  }
  while (v3 != v1);
  return v2 * 0.5;
}

uint64_t ClipperLib::PointIsVertex(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = a2;
  do
  {
    BOOL v5 = v4[1] == v2 && v4[2] == v3;
    uint64_t result = v5;
    if (v5) {
      break;
    }
    uint64_t v4 = (void *)v4[4];
  }
  while (v4 != a2);
  return result;
}

uint64_t ClipperLib::PointInPolygon(void *a1, uint64_t a2)
{
  uint64_t v2 = *(uint64_t **)a2;
  unint64_t v3 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a2 + 8) - *(void *)a2) >> 3);
  if (v3 < 3) {
    return 0;
  }
  uint64_t result = 0;
  uint64_t v6 = *v2;
  uint64_t v7 = v2[1];
  unint64_t v8 = 1;
  unint64_t v11 = a1;
  uint64_t v9 = *a1;
  uint64_t v10 = v11[1];
  while (1)
  {
    unint64_t v12 = v3 == v8 ? 0 : v8;
    unint64_t v13 = &v2[3 * v12];
    uint64_t v14 = *v13;
    uint64_t v15 = v13[1];
    if (v15 == v10 && (v14 == v9 || v7 == v10 && v14 <= v9 != v6 < v9)) {
      return 0xFFFFFFFFLL;
    }
    if (v7 >= v10 == v15 < v10)
    {
      BOOL v17 = __OFSUB__(v6, v9);
      BOOL v16 = v6 - v9 < 0;
      uint64_t v18 = v6 - v9;
      if (v16 != v17)
      {
        uint64_t v19 = v14 - v9;
        if (v14 <= v9) {
          goto LABEL_22;
        }
      }
      else
      {
        uint64_t v19 = v14 - v9;
        if (v14 > v9)
        {
          uint64_t result = (1 - result);
          goto LABEL_22;
        }
      }
      double v20 = (double)v18 * (double)(v15 - v10) - (double)v19 * (double)(v7 - v10);
      if (v20 == 0.0) {
        return 0xFFFFFFFFLL;
      }
      if (v15 > v7 != v20 <= 0.0) {
        uint64_t result = (1 - result);
      }
      else {
        uint64_t result = result;
      }
    }
LABEL_22:
    ++v8;
    uint64_t v6 = v14;
    uint64_t v7 = v15;
    if (v8 > v3) {
      return result;
    }
  }
}

uint64_t ClipperLib::PointInPolygon(void *a1, void *a2)
{
  uint64_t result = 0;
  uint64_t v6 = a1;
  uint64_t v4 = *a1;
  uint64_t v5 = v6[1];
  uint64_t v7 = a2;
  while (1)
  {
    unint64_t v8 = v7;
    uint64_t v7 = (void *)v7[4];
    uint64_t v9 = v7[2];
    if (v9 != v5)
    {
      uint64_t v11 = v8[2];
LABEL_9:
      if (v9 < v5 != v11 >= v5) {
        goto LABEL_21;
      }
      goto LABEL_10;
    }
    uint64_t v10 = v7[1];
    if (v10 == v4) {
      return 0xFFFFFFFFLL;
    }
    uint64_t v11 = v8[2];
    if (v11 != v5) {
      goto LABEL_9;
    }
    if (v10 <= v4 != v8[1] < v4) {
      return 0xFFFFFFFFLL;
    }
    uint64_t v11 = v5;
    if (v9 >= v5) {
      goto LABEL_21;
    }
LABEL_10:
    uint64_t v12 = v8[1];
    uint64_t v13 = v7[1];
    BOOL v15 = __OFSUB__(v12, v4);
    BOOL v14 = v12 - v4 < 0;
    uint64_t v16 = v12 - v4;
    if (v14 == v15) {
      break;
    }
    BOOL v15 = __OFSUB__(v13, v4);
    BOOL v17 = v13 == v4;
    BOOL v14 = v13 - v4 < 0;
    uint64_t v18 = v13 - v4;
    if (!(v14 ^ v15 | v17)) {
      goto LABEL_17;
    }
LABEL_21:
    if (v7 == a2) {
      return result;
    }
  }
  BOOL v15 = __OFSUB__(v13, v4);
  BOOL v17 = v13 == v4;
  BOOL v14 = v13 - v4 < 0;
  uint64_t v18 = v13 - v4;
  if (!(v14 ^ v15 | v17))
  {
    uint64_t result = (1 - result);
    goto LABEL_21;
  }
LABEL_17:
  double v19 = (double)v16 * (double)(v9 - v5) - (double)v18 * (double)(v11 - v5);
  if (v19 != 0.0)
  {
    if (v9 > v11 != v19 <= 0.0) {
      uint64_t result = (1 - result);
    }
    else {
      uint64_t result = result;
    }
    goto LABEL_21;
  }
  return 0xFFFFFFFFLL;
}

BOOL ClipperLib::Poly2ContainsPoly1(uint64_t a1, void *a2)
{
  uint64_t v4 = a1;
  while (1)
  {
    int v5 = ClipperLib::PointInPolygon((void *)(v4 + 8), a2);
    if ((v5 & 0x80000000) == 0) {
      break;
    }
    uint64_t v4 = *(void *)(v4 + 32);
    if (v4 == a1) {
      return 1;
    }
  }
  return v5 != 0;
}

BOOL ClipperLib::SlopesEqual(void *a1, void *a2, int a3)
{
  if (a3)
  {
    ClipperLib::Int128Mul(a1[7] - a1[1], a2[6] - *a2, v8);
    ClipperLib::Int128Mul(a1[6] - *a1, a2[7] - a2[1], v7);
    return v8[1] == v7[1] && v8[0] == v7[0];
  }
  else
  {
    return (a2[6] - *a2) * (a1[7] - a1[1]) == (a2[7] - a2[1]) * (a1[6] - *a1);
  }
}

BOOL ClipperLib::SlopesEqual(void *a1, uint64_t *a2, void *a3, int a4)
{
  if (a4)
  {
    uint64_t v7 = *a2;
    uint64_t v6 = a2[1];
    ClipperLib::Int128Mul(a1[1] - v6, *a2 - *a3, v11);
    ClipperLib::Int128Mul(*a1 - v7, v6 - a3[1], v10);
    return v11[1] == v10[1] && v11[0] == v10[0];
  }
  else
  {
    return (*a2 - *a3) * (a1[1] - a2[1]) == (a2[1] - a3[1]) * (*a1 - *a2);
  }
}

BOOL ClipperLib::SlopesEqual(void *a1, void *a2, void *a3, void *a4, int a5)
{
  if (a5)
  {
    ClipperLib::Int128Mul(a1[1] - a2[1], *a3 - *a4, v12);
    ClipperLib::Int128Mul(*a1 - *a2, a3[1] - a4[1], v11);
    return v12[1] == v11[1] && v12[0] == v11[0];
  }
  else
  {
    return (*a3 - *a4) * (a1[1] - a2[1]) == (a3[1] - a4[1]) * (*a1 - *a2);
  }
}

uint64_t ClipperLib::IntersectPoint(uint64_t result, uint64_t a2, uint64_t *a3)
{
  a3[2] = 0xBF800000BF800000;
  double v3 = *(double *)(result + 72);
  double v4 = *(double *)(a2 + 72);
  if (v3 == v4)
  {
    uint64_t v5 = *(void *)(result + 32);
    a3[1] = v5;
    if (*(void *)(result + 56) != v5)
    {
      double v11 = v3 * (double)(v5 - *(void *)(result + 8));
      double v12 = 0.5;
      if (v11 < 0.0) {
        double v12 = -0.5;
      }
      uint64_t v6 = *(void *)result + (uint64_t)(v11 + v12);
      goto LABEL_55;
    }
    goto LABEL_3;
  }
  if (v3 == 0.0)
  {
    uint64_t v7 = *(void *)result;
    *a3 = *(void *)result;
    uint64_t v8 = *(void *)(a2 + 8);
    if (v4 != -1.0e40)
    {
      double v9 = (double)v8 - (double)*(uint64_t *)a2 / v4;
      double v10 = (double)v7 / v4;
LABEL_13:
      double v14 = v10 + v9;
      double v15 = 0.5;
      if (v14 < 0.0) {
        double v15 = -0.5;
      }
      uint64_t v8 = (uint64_t)(v14 + v15);
      goto LABEL_16;
    }
    goto LABEL_16;
  }
  if (v4 == 0.0)
  {
    uint64_t v13 = *(void *)a2;
    *a3 = *(void *)a2;
    uint64_t v8 = *(void *)(result + 8);
    if (v3 != -1.0e40)
    {
      double v9 = (double)v8 - (double)*(uint64_t *)result / v3;
      double v10 = (double)v13 / v3;
      goto LABEL_13;
    }
LABEL_16:
    a3[1] = v8;
    goto LABEL_17;
  }
  double v20 = (double)*(uint64_t *)result - (double)*(uint64_t *)(result + 8) * v3;
  double v21 = (double)*(uint64_t *)a2 - (double)*(uint64_t *)(a2 + 8) * v4;
  double v22 = (v21 - v20) / (v3 - v4);
  if (v22 >= 0.0) {
    double v23 = 0.5;
  }
  else {
    double v23 = -0.5;
  }
  uint64_t v8 = (uint64_t)(v22 + v23);
  double v24 = v21 + v4 * v22;
  double v25 = v20 + v3 * v22;
  if (fabs(v3) >= fabs(v4)) {
    double v25 = v24;
  }
  if (v25 >= 0.0) {
    double v26 = 0.5;
  }
  else {
    double v26 = -0.5;
  }
  *a3 = (uint64_t)(v25 + v26);
  a3[1] = v8;
LABEL_17:
  uint64_t v16 = *(void *)(result + 56);
  uint64_t v17 = *(void *)(a2 + 56);
  if (v8 < v16 || v8 < v17)
  {
    if (v16 <= v17) {
      uint64_t v8 = *(void *)(a2 + 56);
    }
    else {
      uint64_t v8 = *(void *)(result + 56);
    }
    a3[1] = v8;
    if (fabs(v3) >= fabs(v4))
    {
      if (*(void *)(a2 + 56) == v8)
      {
        uint64_t v19 = *(void *)(a2 + 48);
        goto LABEL_44;
      }
      uint64_t v27 = *(void *)a2;
      double v28 = v4 * (double)(v8 - *(void *)(a2 + 8));
    }
    else
    {
      if (*(void *)(result + 56) == v8)
      {
        uint64_t v19 = *(void *)(result + 48);
LABEL_44:
        *a3 = v19;
        goto LABEL_45;
      }
      uint64_t v27 = *(void *)result;
      double v28 = v3 * (double)(v8 - *(void *)(result + 8));
    }
    double v29 = 0.5;
    if (v28 < 0.0) {
      double v29 = -0.5;
    }
    uint64_t v19 = v27 + (uint64_t)(v28 + v29);
    goto LABEL_44;
  }
LABEL_45:
  uint64_t v30 = *(void *)(result + 32);
  if (v8 <= v30) {
    return result;
  }
  a3[1] = v30;
  if (fabs(v3) > fabs(v4))
  {
    if (*(void *)(a2 + 56) == v30)
    {
      uint64_t v6 = *(void *)(a2 + 48);
      goto LABEL_55;
    }
    uint64_t v31 = *(void *)a2;
    double v32 = v4 * (double)(v30 - *(void *)(a2 + 8));
LABEL_52:
    double v33 = 0.5;
    if (v32 < 0.0) {
      double v33 = -0.5;
    }
    uint64_t v6 = v31 + (uint64_t)(v32 + v33);
    goto LABEL_55;
  }
  if (*(void *)(result + 56) != v30)
  {
    uint64_t v31 = *(void *)result;
    double v32 = v3 * (double)(v30 - *(void *)(result + 8));
    goto LABEL_52;
  }
LABEL_3:
  uint64_t v6 = *(void *)(result + 48);
LABEL_55:
  *a3 = v6;
  return result;
}

int8x16_t ClipperLib::ReversePolyPtLinks(__n128 *a1)
{
  if (a1)
  {
    uint64_t v1 = a1;
    do
    {
      int8x16_t result = (int8x16_t)v1[2];
      v1[2] = (__n128)vextq_s8(result, result, 8uLL);
      uint64_t v1 = (__n128 *)result.i64[0];
    }
    while ((__n128 *)result.i64[0] != a1);
  }
  return result;
}

void *ClipperLib::DisposeOutPts(void *result)
{
  if (*result)
  {
    uint64_t v1 = (void **)result;
    *(void *)(*(void *)(*result + 40) + 32) = 0;
    while (1)
    {
      int8x16_t result = *v1;
      if (!*v1) {
        break;
      }
      __n128 *v1 = (void *)result[4];
      MEMORY[0x1E018DFE0]();
    }
  }
  return result;
}

uint64_t ClipperLib::InitEdge2(uint64_t result, int a2)
{
  uint64_t v2 = (_OWORD *)(result + 24);
  uint64_t v3 = *(void *)(result + 104);
  if (*(void *)(result + 32) >= *(void *)(v3 + 32))
  {
    *(_OWORD *)int8x16_t result = *v2;
    *(void *)(result + 16) = *(void *)(result + 40);
    uint64_t v5 = *(void *)(v3 + 40);
    *(_OWORD *)(result + 48) = *(_OWORD *)(v3 + 24);
    *(void *)(result + 64) = v5;
  }
  else
  {
    *(_OWORD *)(result + 48) = *v2;
    *(void *)(result + 64) = *(void *)(result + 40);
    uint64_t v4 = *(void *)(v3 + 40);
    *(_OWORD *)int8x16_t result = *(_OWORD *)(v3 + 24);
    *(void *)(result + 16) = v4;
  }
  uint64_t v6 = *(void *)(result + 56) - *(void *)(result + 8);
  if (v6) {
    double v7 = (double)(uint64_t)(*(void *)(result + 48) - *(void *)result) / (double)v6;
  }
  else {
    double v7 = -1.0e40;
  }
  *(double *)(result + 72) = v7;
  *(_DWORD *)(result + 80) = a2;
  return result;
}

uint64_t ClipperLib::RemoveEdge(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 112);
  *(void *)(v1 + 104) = *(void *)(a1 + 104);
  uint64_t v2 = *(void *)(a1 + 104);
  *(void *)(v2 + 112) = v1;
  *(void *)(a1 + 112) = 0;
  return v2;
}

__n128 ClipperLib::SwapPoints(__n128 *a1, __n128 *a2)
{
  unint64_t v2 = a1[1].n128_u64[0];
  __n128 result = *a1;
  unint64_t v4 = a2[1].n128_u64[0];
  *a1 = *a2;
  a1[1].n128_u64[0] = v4;
  *a2 = result;
  a2[1].n128_u64[0] = v2;
  return result;
}

BOOL ClipperLib::GetOverlapSegment(void *a1, void *a2, void *a3, void *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6 = a1[1];
  uint64_t v7 = a2[1];
  uint64_t v8 = *a1 - *a2;
  if (v8 < 0) {
    uint64_t v8 = *a2 - *a1;
  }
  unint64_t v9 = v6 - v7;
  if (v6 - v7 < 0) {
    unint64_t v9 = v7 - v6;
  }
  if (v8 <= v9)
  {
    if (v6 < v7)
    {
      uint64_t v22 = a1[2];
      long long v23 = *(_OWORD *)a1;
      uint64_t v24 = a2[2];
      *(_OWORD *)a1 = *(_OWORD *)a2;
      a1[2] = v24;
      *(_OWORD *)a2 = v23;
      a2[2] = v22;
    }
    uint64_t v25 = a3[1];
    if (v25 < a4[1])
    {
      uint64_t v26 = a3[2];
      long long v27 = *(_OWORD *)a3;
      uint64_t v28 = a4[2];
      *(_OWORD *)a3 = *(_OWORD *)a4;
      a3[2] = v28;
      *(_OWORD *)a4 = v27;
      a4[2] = v26;
      uint64_t v25 = a3[1];
    }
    if (a1[1] >= v25) {
      double v29 = a3;
    }
    else {
      double v29 = a1;
    }
    long long v30 = *(_OWORD *)v29;
    *(void *)(a5 + 16) = v29[2];
    *(_OWORD *)a5 = v30;
    if (a2[1] <= a4[1]) {
      uint64_t v31 = a4;
    }
    else {
      uint64_t v31 = a2;
    }
    long long v32 = *(_OWORD *)v31;
    *(void *)(a6 + 16) = v31[2];
    *(_OWORD *)a6 = v32;
    return *(void *)(a5 + 8) > *(void *)(a6 + 8);
  }
  else
  {
    if (*a1 > *a2)
    {
      uint64_t v10 = a1[2];
      long long v11 = *(_OWORD *)a1;
      uint64_t v12 = a2[2];
      *(_OWORD *)a1 = *(_OWORD *)a2;
      a1[2] = v12;
      *(_OWORD *)a2 = v11;
      a2[2] = v10;
    }
    uint64_t v13 = *a3;
    if (*a3 > *a4)
    {
      uint64_t v14 = a3[2];
      long long v15 = *(_OWORD *)a3;
      uint64_t v16 = a4[2];
      *(_OWORD *)a3 = *(_OWORD *)a4;
      a3[2] = v16;
      *(_OWORD *)a4 = v15;
      a4[2] = v14;
      uint64_t v13 = *a3;
    }
    if (*a1 <= v13) {
      uint64_t v17 = a3;
    }
    else {
      uint64_t v17 = a1;
    }
    long long v18 = *(_OWORD *)v17;
    *(void *)(a5 + 16) = v17[2];
    *(_OWORD *)a5 = v18;
    if (*a2 >= *a4) {
      uint64_t v19 = a4;
    }
    else {
      uint64_t v19 = a2;
    }
    long long v20 = *(_OWORD *)v19;
    *(void *)(a6 + 16) = v19[2];
    *(_OWORD *)a6 = v20;
    return *(void *)a5 < *(void *)a6;
  }
}

uint64_t ClipperLib::FirstIsBottomPt(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  uint64_t v3 = *(void *)(result + 16);
  unint64_t v4 = (void *)result;
  do
  {
    unint64_t v4 = (void *)v4[5];
    uint64_t v5 = v4[1];
    uint64_t v6 = v4[2];
  }
  while (v4 != (void *)result && v5 == v2 && v6 == v3);
  uint64_t v9 = v6 - v3;
  if (v9) {
    double v10 = (double)(v5 - v2) / (double)v9;
  }
  else {
    double v10 = -1.0e40;
  }
  long long v11 = (void *)result;
  do
  {
    long long v11 = (void *)v11[4];
    uint64_t v12 = v11[1];
    uint64_t v13 = v11[2];
  }
  while (v11 != (void *)result && v12 == v2 && v13 == v3);
  uint64_t v16 = v13 - v3;
  if (v16) {
    double v17 = (double)(v12 - v2) / (double)v16;
  }
  else {
    double v17 = -1.0e40;
  }
  double v18 = fabs(v10);
  uint64_t v19 = a2[1];
  uint64_t v20 = a2[2];
  double v21 = a2;
  do
  {
    double v21 = (void *)v21[5];
    uint64_t v22 = v21[1];
    uint64_t v23 = v21[2];
  }
  while (v21 != a2 && v22 == v19 && v23 == v20);
  if (v23 == v20) {
    double v26 = -1.0e40;
  }
  else {
    double v26 = (double)(v22 - v19) / (double)(v23 - v20);
  }
  double v27 = fabs(v17);
  uint64_t v28 = a2;
  do
  {
    uint64_t v28 = (void *)v28[4];
    uint64_t v29 = v28[1];
    uint64_t v30 = v28[2];
  }
  while (v28 != a2 && v29 == v19 && v30 == v20);
  double v33 = fabs(v26);
  uint64_t v34 = v30 - v20;
  if (v34) {
    double v35 = (double)(v29 - v19) / (double)v34;
  }
  else {
    double v35 = -1.0e40;
  }
  double v36 = fabs(v35);
  if (v18 >= v27) {
    double v37 = v18;
  }
  else {
    double v37 = v27;
  }
  if (v33 >= v36) {
    double v38 = v33;
  }
  else {
    double v38 = v36;
  }
  if (v37 == v38 && (v27 >= v18 ? (double v39 = v18) : (double v39 = v27), v36 >= v33 ? (v40 = v33) : (v40 = v36), v39 == v40))
  {
    if (result)
    {
      double v41 = 0.0;
      v42 = (void *)result;
      do
      {
        double v41 = v41
            + (double)(uint64_t)(v42[1] + *(void *)(v42[5] + 8))
            * (double)(uint64_t)(*(void *)(v42[5] + 16) - v42[2]);
        v42 = (void *)v42[4];
      }
      while (v42 != (void *)result);
      return v41 * 0.5 > 0.0;
    }
  }
  else
  {
    BOOL v43 = v27 >= v33;
    if (v27 < v36) {
      BOOL v43 = 0;
    }
    return v18 >= v33 && v18 >= v36 || v43;
  }
  return result;
}

uint64_t ClipperLib::GetBottomPt(void *a1)
{
  uint64_t v1 = (uint64_t)a1;
  uint64_t v2 = (void *)a1[4];
  if (v2 == a1) {
    return v1;
  }
  uint64_t v3 = 0;
  do
  {
    uint64_t v4 = v2[2];
    uint64_t v5 = *(void *)(v1 + 16);
    if (v4 > v5)
    {
LABEL_4:
      uint64_t v3 = 0;
      uint64_t v1 = (uint64_t)v2;
      goto LABEL_11;
    }
    if (v4 == v5)
    {
      uint64_t v6 = v2[1];
      uint64_t v7 = *(void *)(v1 + 8);
      if (v6 <= v7)
      {
        if (v6 < v7) {
          goto LABEL_4;
        }
        if (v2[4] != v1 && v2[5] != v1) {
          uint64_t v3 = v2;
        }
      }
    }
LABEL_11:
    uint64_t v2 = (void *)v2[4];
  }
  while (v2 != (void *)v1);
  if (!v3 || v3 == (void *)v1) {
    return v1;
  }
  uint64_t v8 = (void *)v1;
  do
  {
    if (!ClipperLib::FirstIsBottomPt(v1, v3)) {
      uint64_t v8 = v3;
    }
    do
      uint64_t v3 = (void *)v3[4];
    while (v3[1] != v8[1] || v3[2] != v8[2]);
  }
  while (v3 != (void *)v1);
  return (uint64_t)v8;
}

uint64_t ClipperLib::Pt2IsBetweenPt1AndPt3(uint64_t *a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  uint64_t v5 = *a3;
  uint64_t v6 = a3[1];
  if (*a1 == *a3 && v4 == v6) {
    return 0;
  }
  uint64_t v8 = *a2;
  uint64_t v9 = a2[1];
  if (v3 == *a2 && v4 == v9) {
    return 0;
  }
  if (v5 == v8 && v6 == v9) {
    return 0;
  }
  unsigned int v12 = (v9 <= v4) ^ (v9 < v6);
  unsigned int v13 = (v8 <= v3) ^ (v8 < v5);
  if (v3 == v5) {
    return v12;
  }
  else {
    return v13;
  }
}

BOOL ClipperLib::HorzSegmentsOverlap(ClipperLib *this, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if ((uint64_t)this >= a2) {
    uint64_t v4 = (ClipperLib *)a2;
  }
  else {
    uint64_t v4 = this;
  }
  if ((uint64_t)this <= a2) {
    uint64_t v5 = (ClipperLib *)a2;
  }
  else {
    uint64_t v5 = this;
  }
  if (a3 >= a4) {
    uint64_t v6 = a4;
  }
  else {
    uint64_t v6 = a3;
  }
  if (a3 <= a4) {
    uint64_t v7 = a4;
  }
  else {
    uint64_t v7 = a3;
  }
  return (uint64_t)v4 < v7 && v6 < (uint64_t)v5;
}

double ClipperLib::ClipperBase::ClipperBase(ClipperLib::ClipperBase *this)
{
  *(void *)this = &unk_1F3555CA0;
  *((void *)this + 7) = 0;
  *((void *)this + 8) = 0;
  *((void *)this + 6) = 0;
  *((void *)this + 11) = 0;
  *((void *)this + 12) = 0;
  *((void *)this + 10) = 0;
  *((void *)this + 15) = 0;
  *((void *)this + 16) = 0;
  *((void *)this + 14) = 0;
  double result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *((unsigned char *)this + 40) = 0;
  return result;
}

void ClipperLib::ClipperBase::~ClipperBase(ClipperLib::ClipperBase *this)
{
  *(void *)this = &unk_1F3555CA0;
  ClipperLib::ClipperBase::Clear(this);
  uint64_t v2 = (void *)*((void *)this + 14);
  if (v2)
  {
    *((void *)this + 15) = v2;
    operator delete(v2);
  }
  uint64_t v3 = (void *)*((void *)this + 10);
  if (v3)
  {
    *((void *)this + 11) = v3;
    operator delete(v3);
  }
  uint64_t v4 = (void *)*((void *)this + 6);
  if (v4)
  {
    *((void *)this + 7) = v4;
    operator delete(v4);
  }
  uint64_t v5 = (void *)*((void *)this + 2);
  if (v5)
  {
    *((void *)this + 3) = v5;
    operator delete(v5);
  }
}

{
  uint64_t vars8;

  ClipperLib::ClipperBase::~ClipperBase(this);
  JUMPOUT(0x1E018DFE0);
}

uint64_t *ClipperLib::RangeTest(uint64_t *result, unsigned char *a2)
{
  uint64_t v2 = *result;
  if (!*a2)
  {
    if (v2 <= 0x3FFFFFFF && v2 >= -1073741823 && (unint64_t)(result[1] - 0x40000000) >= 0xFFFFFFFF80000001) {
      return result;
    }
    *a2 = 1;
  }
  if (v2 > 0x3FFFFFFFFFFFFFFFLL
    || (v2 >= (uint64_t)0xC000000000000001
      ? (BOOL v5 = (unint64_t)(result[1] - 0x4000000000000000) > 0x8000000000000000)
      : (BOOL v5 = 0),
        !v5))
  {
    exception = (ClipperLib::clipperException *)__cxa_allocate_exception(0x20uLL);
    ClipperLib::clipperException::clipperException(exception, "Coordinate outside allowed range");
  }
  return result;
}

void sub_1DB27CDB8(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t ClipperLib::FindNextLocMin(uint64_t result)
{
  while (1)
  {
    while (1)
    {
      uint64_t v1 = *(void *)(result + 112);
      if (*(void *)result == *(void *)v1
        && *(void *)(result + 8) == *(void *)(v1 + 8)
        && (*(void *)(result + 24) != *(void *)(result + 48) || *(void *)(result + 32) != *(void *)(result + 56)))
      {
        break;
      }
      double result = *(void *)(result + 104);
    }
    if (*(double *)(result + 72) != -1.0e40 && *(double *)(v1 + 72) != -1.0e40) {
      break;
    }
    uint64_t v4 = result;
    do
    {
      uint64_t v5 = v4;
      uint64_t v4 = *(void *)(v4 + 112);
    }
    while (*(double *)(v4 + 72) == -1.0e40);
    uint64_t v6 = v4;
    double result = v5;
    if (*(double *)(v5 + 72) == -1.0e40)
    {
      double result = v5;
      do
        double result = *(void *)(result + 104);
      while (*(double *)(result + 72) == -1.0e40);
      uint64_t v6 = *(void *)(result + 112);
    }
    if (*(void *)(result + 56) != *(void *)(v6 + 8))
    {
      if (*(void *)v4 < *(void *)result) {
        return v5;
      }
      return result;
    }
  }
  return result;
}

uint64_t ClipperLib::ClipperBase::ProcessBound(void *a1, uint64_t *a2, int a3, __n128 a4)
{
  if (*((_DWORD *)a2 + 25) == -2)
  {
    uint64_t v5 = (double *)a2;
    if (a3)
    {
      do
      {
        uint64_t v6 = v5;
        uint64_t v7 = *((void *)v5 + 7);
        uint64_t v5 = (double *)*((void *)v5 + 13);
      }
      while (v7 == *((void *)v5 + 1));
      if (v6 == (double *)a2) {
        goto LABEL_27;
      }
      a4.n128_u64[0] = 0xC83D6329F1C35CA5;
      while (v6[9] == -1.0e40)
      {
        uint64_t v6 = (double *)*((void *)v6 + 14);
        if (v6 == (double *)a2) {
          goto LABEL_27;
        }
      }
    }
    else
    {
      do
      {
        uint64_t v6 = v5;
        uint64_t v8 = *((void *)v5 + 7);
        uint64_t v5 = (double *)*((void *)v5 + 14);
      }
      while (v8 == *((void *)v5 + 1));
      if (v6 == (double *)a2) {
        goto LABEL_27;
      }
      a4.n128_u64[0] = 0xC83D6329F1C35CA5;
      while (v6[9] == -1.0e40)
      {
        uint64_t v6 = (double *)*((void *)v6 + 13);
        if (v6 == (double *)a2) {
          goto LABEL_27;
        }
      }
    }
    if (v6 != (double *)a2)
    {
      uint64_t v13 = 14;
      if (a3) {
        uint64_t v13 = 13;
      }
      uint64_t v14 = a2[v13];
      uint64_t v15 = *(void *)(v14 + 8);
      *(_DWORD *)(v14 + 88) = 0;
      uint64_t v16 = ClipperLib::ClipperBase::ProcessBound(a1, v14, a4);
      unint64_t v17 = a1[4];
      double v18 = (void *)a1[3];
      if ((unint64_t)v18 >= v17)
      {
        uint64_t v43 = a1[2];
        unint64_t v44 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v18 - v43) >> 3);
        unint64_t v45 = v44 + 1;
        if (v44 + 1 > 0xAAAAAAAAAAAAAAALL) {
          std::vector<ClipperLib::IntPoint>::__throw_length_error[abi:ne180100]();
        }
        unint64_t v46 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v17 - v43) >> 3);
        if (2 * v46 > v45) {
          unint64_t v45 = 2 * v46;
        }
        if (v46 >= 0x555555555555555) {
          unint64_t v47 = 0xAAAAAAAAAAAAAAALL;
        }
        else {
          unint64_t v47 = v45;
        }
        if (v47) {
          v48 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::IntPoint>>((uint64_t)(a1 + 4), v47);
        }
        else {
          v48 = 0;
        }
        v49 = &v48[24 * v44];
        v50 = &v48[24 * v47];
        *(void *)v49 = v15;
        *((void *)v49 + 1) = 0;
        *((void *)v49 + 2) = v14;
        uint64_t v19 = v49 + 24;
        v52 = (char *)a1[2];
        v51 = (char *)a1[3];
        if (v51 != v52)
        {
          do
          {
            long long v53 = *(_OWORD *)(v51 - 24);
            *((void *)v49 - 1) = *((void *)v51 - 1);
            *(_OWORD *)(v49 - 24) = v53;
            v49 -= 24;
            v51 -= 24;
          }
          while (v51 != v52);
          v51 = (char *)a1[2];
        }
        a1[2] = v49;
        a1[3] = v19;
        a1[4] = v50;
        if (v51) {
          operator delete(v51);
        }
      }
      else
      {
        *double v18 = v15;
        v18[1] = 0;
        uint64_t v19 = v18 + 3;
        v18[2] = v14;
      }
      a1[3] = v19;
      return v16;
    }
LABEL_27:
    if (a3) {
      return a2[13];
    }
    else {
      return a2[14];
    }
  }
  if (*((double *)a2 + 9) == -1.0e40)
  {
    uint64_t v9 = 13;
    if (a3) {
      uint64_t v9 = 14;
    }
    double v10 = (double *)a2[v9];
    double v11 = *v10;
    double v12 = *(double *)a2;
    if (v10[9] == -1.0e40)
    {
      if (*(void *)&v11 == *(void *)&v12 || *((void *)v10 + 6) == *(void *)&v12) {
        goto LABEL_32;
      }
      goto LABEL_31;
    }
    if (*(void *)&v11 != *(void *)&v12)
    {
LABEL_31:
      uint64_t v20 = a2[6];
      *((double *)a2 + 6) = v12;
      *a2 = v20;
      uint64_t v21 = a2[8];
      a2[8] = a2[2];
      a2[2] = v21;
    }
  }
LABEL_32:
  uint64_t v22 = a2;
  if (a3)
  {
    do
    {
      uint64_t v23 = v22;
      uint64_t v24 = v22[7];
      uint64_t v22 = (uint64_t *)v22[13];
    }
    while (v24 == v22[1] && *((_DWORD *)v22 + 25) != -2);
    if (*((double *)v23 + 9) == -1.0e40 && *((_DWORD *)v22 + 25) != -2)
    {
      uint64_t v25 = (double *)v23;
      do
        uint64_t v25 = (double *)*((void *)v25 + 14);
      while (v25[9] == -1.0e40);
      if (*((void *)v25 + 6) > v22[6]) {
        uint64_t v23 = (uint64_t *)v25;
      }
    }
    if (v23 != a2)
    {
      double v26 = (double *)a2;
      do
      {
        double v27 = (uint64_t *)*((void *)v26 + 13);
        *((void *)v26 + 15) = v27;
        if (v26 != (double *)a2 && v26[9] == -1.0e40 && *(void *)v26 != *(void *)(*((void *)v26 + 14) + 48))
        {
          uint64_t v28 = *((void *)v26 + 6);
          v26[6] = *v26;
          *(void *)double v26 = v28;
          uint64_t v29 = *((void *)v26 + 8);
          v26[8] = v26[2];
          *((void *)v26 + 2) = v29;
        }
        double v26 = (double *)v27;
      }
      while (v27 != v23);
      if (v23 != a2 && *((double *)v23 + 9) == -1.0e40 && *v23 != *(void *)(v23[14] + 48))
      {
        uint64_t v30 = v23[6];
        v23[6] = *v23;
        *uint64_t v23 = v30;
        uint64_t v31 = v23[8];
        v23[8] = v23[2];
        v23[2] = v31;
      }
    }
    long long v32 = v23 + 13;
  }
  else
  {
    do
    {
      double v33 = v22;
      uint64_t v34 = v22[7];
      uint64_t v22 = (uint64_t *)v22[14];
    }
    while (v34 == v22[1] && *((_DWORD *)v22 + 25) != -2);
    if (*((double *)v33 + 9) == -1.0e40 && *((_DWORD *)v22 + 25) != -2)
    {
      double v35 = (double *)v33;
      do
        double v35 = (double *)*((void *)v35 + 13);
      while (v35[9] == -1.0e40);
      if (*((void *)v35 + 6) >= v22[6]) {
        double v33 = (uint64_t *)v35;
      }
    }
    if (v33 != a2)
    {
      double v36 = (double *)a2;
      do
      {
        double v37 = (uint64_t *)*((void *)v36 + 14);
        *((void *)v36 + 15) = v37;
        if (v36 != (double *)a2 && v36[9] == -1.0e40 && *(void *)v36 != *(void *)(*((void *)v36 + 13) + 48))
        {
          uint64_t v38 = *((void *)v36 + 6);
          v36[6] = *v36;
          *(void *)double v36 = v38;
          uint64_t v39 = *((void *)v36 + 8);
          v36[8] = v36[2];
          *((void *)v36 + 2) = v39;
        }
        double v36 = (double *)v37;
      }
      while (v37 != v33);
      if (v33 != a2 && *((double *)v33 + 9) == -1.0e40 && *v33 != *(void *)(v33[13] + 48))
      {
        uint64_t v40 = v33[6];
        v33[6] = *v33;
        *double v33 = v40;
        uint64_t v41 = v33[8];
        v33[8] = v33[2];
        v33[2] = v41;
      }
    }
    long long v32 = v33 + 14;
  }
  return *v32;
}

uint64_t ClipperLib::ClipperBase::AddPath(uint64_t a1, uint64_t a2, int a3, int a4)
{
  if (a3 == 1 && (a4 & 1) == 0)
  {
    exception = (ClipperLib::clipperException *)__cxa_allocate_exception(0x20uLL);
    ClipperLib::clipperException::clipperException(exception, "AddPath: Open paths must be subject.");
  }
  uint64_t v4 = *(void **)a2;
  int v5 = -1431655765 * ((*(void *)(a2 + 8) - *(void *)a2) >> 3);
  int v6 = v5 - 1;
  if (a4 && v5 >= 2)
  {
    do
    {
      uint64_t v7 = &v4[3 * --v5];
      uint64_t v9 = *v7;
      uint64_t v8 = v7[1];
      if (v9 != *v4 || v8 != v4[1])
      {
        int v6 = v5;
        goto LABEL_12;
      }
    }
    while (v5 > 1);
    int v6 = 0;
  }
LABEL_12:
  int v11 = v6 & (v6 >> 31);
  double v12 = (int64x2_t *)&v4[3 * v6];
  while (1)
  {
    BOOL v13 = __OFSUB__(v6--, 1);
    if (v6 < 0 != v13) {
      break;
    }
    int64x2_t v14 = *v12;
    double v12 = (int64x2_t *)((char *)v12 - 24);
    int32x2_t v15 = vmovn_s64(vceqq_s64(v14, *(int64x2_t *)&v4[3 * v6]));
    if ((v15.i32[0] & v15.i32[1] & 1) == 0)
    {
      int v11 = v6 + 1;
      break;
    }
  }
  if (v11 > a4)
  {
    is_mul_ok(v11 + 1, 0xA0uLL);
    operator new[]();
  }
  return 0;
}

void sub_1DB27DDB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  __cxa_free_exception(v10);
  _Unwind_Resume(a1);
}

uint64_t ClipperLib::ClipperBase::AddPaths(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = *a2;
  if (a2[1] == *a2)
  {
    LOBYTE(v11) = 0;
  }
  else
  {
    uint64_t v9 = 0;
    unint64_t v10 = 0;
    int v11 = 0;
    do
    {
      v11 |= (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)a1 + 16))(a1, v4 + v9, a3, a4);
      ++v10;
      uint64_t v4 = *a2;
      v9 += 24;
    }
    while (v10 < 0xAAAAAAAAAAAAAAABLL * ((a2[1] - *a2) >> 3));
  }
  return v11 & 1;
}

void *ClipperLib::ClipperBase::Clear(void *this)
{
  uint64_t v1 = this;
  uint64_t v2 = this[2];
  this[3] = v2;
  this[1] = v2;
  uint64_t v4 = this[6];
  uint64_t v3 = this[7];
  if (v3 == v4)
  {
    uint64_t v4 = this[7];
  }
  else
  {
    unint64_t v5 = 0;
    do
    {
      this = *(void **)(v4 + 8 * v5);
      if (this)
      {
        this = (void *)MEMORY[0x1E018DFC0](this, 0x1020C80A8A5F671);
        uint64_t v4 = v1[6];
        uint64_t v3 = v1[7];
      }
      ++v5;
    }
    while (v5 < (v3 - v4) >> 3);
  }
  v1[7] = v4;
  *((unsigned char *)v1 + 40) = 0;
  *((unsigned char *)v1 + 73) = 0;
  return this;
}

void *ClipperLib::ClipperBase::DisposeLocalMinimaList(void *this)
{
  uint64_t v1 = this[2];
  this[3] = v1;
  this[1] = v1;
  return this;
}

void ClipperLib::ClipperBase::Reset(ClipperLib::ClipperBase *this)
{
  uint64_t v2 = *((void *)this + 2);
  uint64_t v3 = (char *)*((void *)this + 3);
  *((void *)this + 1) = v2;
  if ((char *)v2 != v3)
  {
    std::__introsort<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *,false>(v2, v3, (uint64_t)&v8, 126 - 2 * __clz(0xAAAAAAAAAAAAAAABLL * ((uint64_t)&v3[-v2] >> 3)), 1);
    uint64_t v4 = (void *)*((void *)this + 14);
    if (v4)
    {
      *((void *)this + 15) = v4;
      operator delete(v4);
    }
    *((void *)this + 14) = 0;
    *((void *)this + 15) = 0;
    *((void *)this + 16) = 0;
    unint64_t v5 = (uint64_t *)*((void *)this + 2);
    if (v5 != *((uint64_t **)this + 3))
    {
      do
      {
        uint64_t v9 = *v5;
        std::priority_queue<long long>::push((uint64_t)this + 112, &v9);
        uint64_t v6 = v5[1];
        if (v6)
        {
          *(_OWORD *)(v6 + 24) = *(_OWORD *)v6;
          *(void *)(v6 + 40) = *(void *)(v6 + 16);
          *(_DWORD *)(v6 + 84) = 1;
          *(_DWORD *)(v6 + 100) = -1;
        }
        uint64_t v7 = v5[2];
        if (v7)
        {
          *(_OWORD *)(v7 + 24) = *(_OWORD *)v7;
          *(void *)(v7 + 40) = *(void *)(v7 + 16);
          *(_DWORD *)(v7 + 84) = 2;
          *(_DWORD *)(v7 + 100) = -1;
        }
        v5 += 3;
      }
      while (v5 != *((uint64_t **)this + 3));
      unint64_t v5 = (uint64_t *)*((void *)this + 2);
    }
    *((void *)this + 13) = 0;
    *((void *)this + 1) = v5;
  }
}

void ClipperLib::ClipperBase::InsertScanbeam(ClipperLib::ClipperBase *this, uint64_t a2)
{
  uint64_t v2 = a2;
  std::priority_queue<long long>::push((uint64_t)this + 112, &v2);
}

uint64_t ClipperLib::ClipperBase::PopLocalMinima(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void **)(a1 + 8);
  if (v3 == *(void **)(a1 + 24) || *v3 != a2) {
    return 0;
  }
  *a3 = v3;
  *(void *)(a1 + 8) += 24;
  return 1;
}

double ClipperLib::ClipperBase::GetBounds@<D0>(ClipperLib::ClipperBase *this@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *((void *)this + 2);
  uint64_t v3 = *((void *)this + 3);
  if (v2 == v3)
  {
    double result = 0.0;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
  }
  else
  {
    uint64_t v4 = *(uint64_t **)(v2 + 8);
    uint64_t v6 = *v4;
    uint64_t v5 = v4[1];
    *(void *)a2 = v6;
    *(void *)(a2 + 8) = v5;
    *(void *)(a2 + 16) = v6;
    uint64_t v7 = v6;
    uint64_t v8 = v5;
    do
    {
      uint64_t v9 = *(uint64_t **)(v2 + 8);
      unint64_t v10 = *(uint64_t **)(v2 + 16);
      if (v5 <= v9[1]) {
        uint64_t v5 = v9[1];
      }
      *(void *)(a2 + 24) = v5;
      int v11 = v9;
      do
      {
        double v12 = (uint64_t *)v11[15];
        if (v12)
        {
          BOOL v13 = v11;
          do
          {
            uint64_t v14 = *v13;
            BOOL v13 = v12;
            if (v14 < v6)
            {
              *(void *)a2 = v14;
              uint64_t v6 = v14;
            }
            if (v14 > v7)
            {
              *(void *)(a2 + 16) = v14;
              uint64_t v7 = v14;
            }
            double v12 = (uint64_t *)v12[15];
          }
          while (v12);
        }
        else
        {
          BOOL v13 = v11;
        }
        if (*v13 < v6) {
          uint64_t v6 = *v13;
        }
        *(void *)a2 = v6;
        if (v7 <= *v13) {
          uint64_t v7 = *v13;
        }
        *(void *)(a2 + 16) = v7;
        if (v13[6] < v6) {
          uint64_t v6 = v13[6];
        }
        *(void *)a2 = v6;
        if (v7 <= v13[6]) {
          uint64_t v7 = v13[6];
        }
        *(void *)(a2 + 16) = v7;
        uint64_t v15 = v13[7];
        if (v15 < v8) {
          uint64_t v8 = v15;
        }
        *(void *)(a2 + 8) = v8;
        BOOL v16 = v11 == v9;
        int v11 = v10;
      }
      while (v16);
      v2 += 24;
    }
    while (v2 != v3);
  }
  return result;
}

void std::priority_queue<long long>::push(uint64_t a1, void *a2)
{
  uint64_t v4 = a1 + 16;
  unint64_t v5 = *(void *)(a1 + 16);
  uint64_t v6 = *(void **)(a1 + 8);
  if ((unint64_t)v6 >= v5)
  {
    uint64_t v8 = *(void **)a1;
    uint64_t v9 = ((uint64_t)v6 - *(void *)a1) >> 3;
    unint64_t v10 = v9 + 1;
    if ((unint64_t)(v9 + 1) >> 61) {
      std::vector<ClipperLib::IntPoint>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v11 = v5 - (void)v8;
    if (v11 >> 2 > v10) {
      unint64_t v10 = v11 >> 2;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v12 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v10;
    }
    if (v12)
    {
      BOOL v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::PolyNode *>>(v4, v12);
      uint64_t v8 = *(void **)a1;
      uint64_t v6 = *(void **)(a1 + 8);
    }
    else
    {
      BOOL v13 = 0;
    }
    uint64_t v14 = &v13[8 * v9];
    uint64_t v15 = &v13[8 * v12];
    *(void *)uint64_t v14 = *a2;
    uint64_t v7 = v14 + 8;
    while (v6 != v8)
    {
      uint64_t v16 = *--v6;
      *((void *)v14 - 1) = v16;
      v14 -= 8;
    }
    *(void *)a1 = v14;
    *(void *)(a1 + 8) = v7;
    *(void *)(a1 + 16) = v15;
    if (v8) {
      operator delete(v8);
    }
  }
  else
  {
    void *v6 = *a2;
    uint64_t v7 = v6 + 1;
  }
  *(void *)(a1 + 8) = v7;
  unint64_t v17 = *(void **)a1;
  uint64_t v18 = (uint64_t)v7 - *(void *)a1;
  if (v18 >= 9)
  {
    unint64_t v19 = (((unint64_t)v18 >> 3) - 2) >> 1;
    uint64_t v20 = &v17[v19];
    uint64_t v23 = *(v7 - 1);
    uint64_t v22 = v7 - 1;
    uint64_t v21 = v23;
    uint64_t v24 = *v20;
    if (*v20 < v23)
    {
      do
      {
        *uint64_t v22 = v24;
        uint64_t v22 = v20;
        if (!v19) {
          break;
        }
        unint64_t v19 = (v19 - 1) >> 1;
        uint64_t v20 = &v17[v19];
        uint64_t v24 = *v20;
      }
      while (*v20 < v21);
      *uint64_t v22 = v21;
    }
  }
}

BOOL ClipperLib::ClipperBase::PopScanbeam(ClipperLib::ClipperBase *this, uint64_t *a2)
{
  uint64_t v2 = (uint64_t *)*((void *)this + 14);
  uint64_t v3 = (uint64_t *)*((void *)this + 15);
  if (v2 != v3)
  {
    *a2 = *v2;
    uint64_t v4 = (char *)v3 - (char *)v2;
    if ((char *)v3 - (char *)v2 >= 9)
    {
      uint64_t v5 = 0;
      uint64_t v6 = v4 >> 3;
      uint64_t v7 = *v2;
      int64_t v8 = (unint64_t)((v4 >> 3) - 2) >> 1;
      uint64_t v9 = v2;
      do
      {
        unint64_t v10 = &v9[v5 + 1];
        uint64_t v11 = (2 * v5) | 1;
        uint64_t v5 = 2 * v5 + 2;
        if (v5 >= v6)
        {
          uint64_t v12 = *v10;
          uint64_t v5 = v11;
        }
        else
        {
          uint64_t v12 = *v10;
          uint64_t v13 = v10[1];
          if (*v10 <= v13) {
            uint64_t v12 = v10[1];
          }
          if (*v10 >= v13) {
            uint64_t v5 = v11;
          }
          else {
            ++v10;
          }
        }
        *uint64_t v9 = v12;
        uint64_t v9 = v10;
      }
      while (v5 <= v8);
      uint64_t v14 = v3 - 1;
      if (v10 == v3 - 1)
      {
        uint64_t *v10 = v7;
      }
      else
      {
        uint64_t *v10 = *v14;
        uint64_t *v14 = v7;
        uint64_t v15 = (char *)v10 - (char *)v2 + 8;
        if (v15 >= 9)
        {
          unint64_t v16 = (((unint64_t)v15 >> 3) - 2) >> 1;
          unint64_t v17 = &v2[v16];
          uint64_t v18 = *v17;
          uint64_t v19 = *v10;
          if (*v17 < *v10)
          {
            do
            {
              uint64_t *v10 = v18;
              unint64_t v10 = v17;
              if (!v16) {
                break;
              }
              unint64_t v16 = (v16 - 1) >> 1;
              unint64_t v17 = &v2[v16];
              uint64_t v18 = *v17;
            }
            while (*v17 < v19);
            uint64_t *v10 = v19;
          }
        }
      }
    }
    uint64_t v20 = v3 - 1;
    if (v2 == v3 - 1)
    {
LABEL_40:
      uint64_t v21 = v2;
    }
    else
    {
      uint64_t v21 = v3;
      while (1)
      {
        uint64_t v22 = v21;
        uint64_t v21 = v20;
        uint64_t v23 = *a2;
        if (*a2 != *v2) {
          break;
        }
        uint64_t v24 = (char *)v20 - (char *)v2;
        if ((char *)v21 - (char *)v2 >= 9)
        {
          uint64_t v25 = 0;
          uint64_t v26 = v24 >> 3;
          int64_t v27 = (unint64_t)((v24 >> 3) - 2) >> 1;
          uint64_t v28 = v2;
          do
          {
            uint64_t v29 = &v28[v25 + 1];
            uint64_t v30 = (2 * v25) | 1;
            uint64_t v25 = 2 * v25 + 2;
            if (v25 >= v26)
            {
              uint64_t v31 = *v29;
              uint64_t v25 = v30;
            }
            else
            {
              uint64_t v31 = *v29;
              uint64_t v32 = v29[1];
              if (*v29 <= v32) {
                uint64_t v31 = v29[1];
              }
              if (*v29 >= v32) {
                uint64_t v25 = v30;
              }
              else {
                ++v29;
              }
            }
            uint64_t *v28 = v31;
            uint64_t v28 = v29;
          }
          while (v25 <= v27);
          double v33 = v22 - 2;
          if (v29 == v33)
          {
            uint64_t *v29 = v23;
          }
          else
          {
            uint64_t *v29 = *v33;
            *double v33 = v23;
            uint64_t v34 = (char *)v29 - (char *)v2 + 8;
            if (v34 >= 9)
            {
              unint64_t v35 = (((unint64_t)v34 >> 3) - 2) >> 1;
              double v36 = &v2[v35];
              uint64_t v37 = *v36;
              uint64_t v38 = *v29;
              if (*v36 < *v29)
              {
                do
                {
                  uint64_t *v29 = v37;
                  uint64_t v29 = v36;
                  if (!v35) {
                    break;
                  }
                  unint64_t v35 = (v35 - 1) >> 1;
                  double v36 = &v2[v35];
                  uint64_t v37 = *v36;
                }
                while (*v36 < v38);
                uint64_t *v29 = v38;
              }
            }
          }
        }
        uint64_t v20 = v21 - 1;
        if (v2 == v21 - 1) {
          goto LABEL_40;
        }
      }
    }
    *((void *)this + 15) = v21;
  }
  return v2 != v3;
}

ClipperLib::ClipperBase *ClipperLib::ClipperBase::DisposeAllOutRecs(ClipperLib::ClipperBase *this)
{
  uint64_t v1 = this;
  uint64_t v2 = *((void *)this + 11);
  if (v2 != *((void *)this + 10))
  {
    unint64_t v3 = 0;
    do
    {
      this = (ClipperLib::ClipperBase *)ClipperLib::ClipperBase::DisposeOutRec(v1, v3++);
      uint64_t v2 = *((void *)v1 + 10);
    }
    while (v3 < (*((void *)v1 + 11) - v2) >> 3);
  }
  *((void *)v1 + 11) = v2;
  return this;
}

uint64_t ClipperLib::ClipperBase::DisposeOutRec(ClipperLib::ClipperBase *this, uint64_t a2)
{
  uint64_t v4 = *(void *)(*((void *)this + 10) + 8 * a2);
  if (*(void *)(v4 + 24)) {
    ClipperLib::DisposeOutPts((void *)(v4 + 24));
  }
  uint64_t result = MEMORY[0x1E018DFE0](v4, 0x1020C401FC46325);
  *(void *)(*((void *)this + 10) + 8 * a2) = 0;
  return result;
}

uint64_t ClipperLib::ClipperBase::DeleteFromAEL(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 128);
  uint64_t v3 = *(void *)(a2 + 136);
  if (*(_OWORD *)(a2 + 128) == 0)
  {
    if (*(void *)(result + 104) != a2) {
      return result;
    }
    goto LABEL_5;
  }
  if (!v3)
  {
LABEL_5:
    uint64_t v4 = (void *)(result + 104);
    goto LABEL_6;
  }
  uint64_t v4 = (void *)(v3 + 128);
LABEL_6:
  void *v4 = v2;
  if (v2) {
    *(void *)(v2 + 136) = v3;
  }
  *(void *)(a2 + 128) = 0;
  *(void *)(a2 + 136) = 0;
  return result;
}

void ClipperLib::ClipperBase::CreateOutRec(ClipperLib::ClipperBase *this)
{
}

uint64_t ClipperLib::ClipperBase::SwapPositionsInAEL(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a2 + 128);
  uint64_t v3 = *(void *)(a2 + 136);
  if (v4 != v3)
  {
    uint64_t v6 = *(void *)(a3 + 128);
    uint64_t v5 = *(void *)(a3 + 136);
    if (v6 != v5)
    {
      if (v4 == a3)
      {
        if (v6)
        {
          *(void *)(v6 + 136) = a2;
          uint64_t v3 = *(void *)(a2 + 136);
        }
        if (v3) {
          *(void *)(v3 + 128) = a3;
        }
        *(void *)(a3 + 128) = a2;
        *(void *)(a3 + 136) = v3;
        *(void *)(a2 + 128) = v6;
        *(void *)(a2 + 136) = a3;
        uint64_t v3 = *(void *)(a3 + 136);
      }
      else
      {
        if (v6 == a2)
        {
          if (v4)
          {
            *(void *)(v4 + 136) = a3;
            uint64_t v5 = *(void *)(a3 + 136);
          }
          if (v5) {
            *(void *)(v5 + 128) = a2;
          }
          *(void *)(a2 + 128) = a3;
          *(void *)(a2 + 136) = v5;
          uint64_t v3 = a2;
          *(void *)(a3 + 128) = v4;
          *(void *)(a3 + 136) = a2;
        }
        else
        {
          *(void *)(a2 + 128) = v6;
          if (v6)
          {
            *(void *)(v6 + 136) = a2;
            uint64_t v5 = *(void *)(a3 + 136);
          }
          *(void *)(a2 + 136) = v5;
          if (v5) {
            *(void *)(v5 + 128) = a2;
          }
          *(void *)(a3 + 128) = v4;
          if (v4) {
            *(void *)(v4 + 136) = a3;
          }
          *(void *)(a3 + 136) = v3;
          if (v3) {
            *(void *)(v3 + 128) = a3;
          }
        }
        if (!*(void *)(a2 + 136)) {
          goto LABEL_26;
        }
      }
      a2 = a3;
      if (v3) {
        return result;
      }
LABEL_26:
      *(void *)(result + 104) = a2;
    }
  }
  return result;
}

void ClipperLib::ClipperBase::UpdateEdgeIntoAEL(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  uint64_t v3 = *(void *)(*a2 + 120);
  if (!v3)
  {
    exception = (ClipperLib::clipperException *)__cxa_allocate_exception(0x20uLL);
    ClipperLib::clipperException::clipperException(exception, "UpdateEdgeIntoAEL: invalid call");
  }
  *(_DWORD *)(v3 + 100) = *(_DWORD *)(v2 + 100);
  uint64_t v6 = v2 + 128;
  uint64_t v5 = *(void *)(v2 + 128);
  uint64_t v4 = *(void *)(v6 + 8);
  uint64_t v7 = (void *)(a1 + 104);
  if (v4) {
    uint64_t v7 = (void *)(v4 + 128);
  }
  void *v7 = v3;
  if (v5) {
    *(void *)(v5 + 136) = *(void *)(*a2 + 120);
  }
  uint64_t v8 = *(void *)(*a2 + 120);
  *(_OWORD *)(v8 + 84) = *(_OWORD *)(*a2 + 84);
  *a2 = v8;
  *(_OWORD *)(v8 + 24) = *(_OWORD *)v8;
  *(void *)(v8 + 40) = *(void *)(v8 + 16);
  *(void *)(*a2 + 136) = v4;
  *(void *)(*a2 + 128) = v5;
  if (*(double *)(*a2 + 72) != -1.0e40)
  {
    uint64_t v10 = *(void *)(*a2 + 56);
    std::priority_queue<long long>::push(a1 + 112, &v10);
  }
}

void sub_1DB27E924(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

BOOL ClipperLib::ClipperBase::LocalMinimaPending(ClipperLib::ClipperBase *this)
{
  return *((void *)this + 1) != *((void *)this + 3);
}

ClipperLib *ClipperLib::Clipper::Clipper(ClipperLib *this, uint64_t *a2, char a3)
{
  uint64_t v3 = *a2;
  *(void *)this = *a2;
  *(void *)((char *)this + *(void *)(v3 - 24)) = a2[1];
  *((void *)this + 9) = 0;
  *(_OWORD *)((char *)this + 56) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 8) = 0u;
  *((void *)this + 11) = (char *)this + 88;
  *((void *)this + 12) = (char *)this + 88;
  *((void *)this + 13) = 0;
  *((unsigned char *)this + 120) = 0;
  uint64_t v4 = *(void *)this;
  *((unsigned char *)this + *(void *)(*(void *)this - 24) + 40) = 0;
  *((unsigned char *)this + 132) = a3 & 1;
  *((unsigned char *)this + 134) = (a3 & 2) != 0;
  *((unsigned char *)this + *(void *)(v4 - 24) + 72) = (a3 & 4) != 0;
  *((unsigned char *)this + *(void *)(v4 - 24) + 73) = 0;
  *((void *)this + 17) = 0;
  return this;
}

double ClipperLib::Clipper::Clipper(ClipperLib::Clipper *this, char a2)
{
  *((void *)this + 24) = 0;
  *((void *)this + 25) = 0;
  *((void *)this + 26) = 0;
  *((void *)this + 29) = 0;
  *((void *)this + 30) = 0;
  *((void *)this + 28) = 0;
  *((void *)this + 33) = 0;
  *((void *)this + 34) = 0;
  *((void *)this + 32) = 0;
  double result = 0.0;
  *(_OWORD *)((char *)this + 152) = 0u;
  *(_OWORD *)((char *)this + 168) = 0u;
  *(void *)this = &unk_1F3555D08;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  *((void *)this + 9) = 0;
  *((void *)this + 11) = (char *)this + 88;
  *((void *)this + 12) = (char *)this + 88;
  *((void *)this + 13) = 0;
  *((unsigned char *)this + 120) = 0;
  *((unsigned char *)this + 184) = 0;
  *((unsigned char *)this + 132) = a2 & 1;
  *((unsigned char *)this + 134) = (a2 & 2) != 0;
  *((unsigned char *)this + 216) = (a2 & 4) != 0;
  *((unsigned char *)this + 217) = 0;
  *((void *)this + 17) = 0;
  *((void *)this + 18) = off_1F3555D50;
  return result;
}

uint64_t ClipperLib::Clipper::ZFillFunction(uint64_t result, uint64_t a2)
{
  *(void *)(result + 136) = a2;
  return result;
}

uint64_t ClipperLib::Clipper::Execute(uint64_t a1, int a2, uint64_t *a3, int a4)
{
  return ClipperLib::Clipper::Execute(a1, a2, a3, a4, a4);
}

uint64_t ClipperLib::Clipper::Execute(uint64_t a1, int a2, uint64_t *a3, int a4, int a5)
{
  if (*(unsigned char *)(a1 + 120)) {
    return 0;
  }
  if (*(unsigned char *)(a1 + *(void *)(*(void *)a1 - 24) + 73))
  {
    exception = (ClipperLib::clipperException *)__cxa_allocate_exception(0x20uLL);
    ClipperLib::clipperException::clipperException(exception, "Error: PolyTree struct is needed for open path clipping.");
  }
  *(unsigned char *)(a1 + 120) = 1;
  std::vector<std::vector<ClipperLib::IntPoint>>::resize(a3, 0);
  *(_DWORD *)(a1 + 124) = a5;
  *(_DWORD *)(a1 + 128) = a4;
  *(_DWORD *)(a1 + 80) = a2;
  *(unsigned char *)(a1 + 133) = 0;
  uint64_t v5 = (**(uint64_t (***)(uint64_t))a1)(a1);
  if (v5) {
    ClipperLib::Clipper::BuildResult((uint64_t *)a1, a3);
  }
  ClipperLib::ClipperBase::DisposeAllOutRecs((ClipperLib::ClipperBase *)(a1 + *(void *)(*(void *)a1 - 24)));
  *(unsigned char *)(a1 + 120) = 0;
  return v5;
}

void sub_1DB27EC68(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t ClipperLib::Clipper::Execute(uint64_t a1, int a2, void **a3, int a4)
{
  return ClipperLib::Clipper::Execute(a1, a2, a3, a4, a4);
}

uint64_t ClipperLib::Clipper::Execute(uint64_t a1, int a2, void **a3, int a4, int a5)
{
  if (*(unsigned char *)(a1 + 120)) {
    return 0;
  }
  *(unsigned char *)(a1 + 120) = 1;
  *(_DWORD *)(a1 + 124) = a5;
  *(_DWORD *)(a1 + 128) = a4;
  *(_DWORD *)(a1 + 80) = a2;
  *(unsigned char *)(a1 + 133) = 1;
  uint64_t v5 = (**(uint64_t (***)(void))a1)();
  if (v5) {
    ClipperLib::Clipper::BuildResult2((ClipperLib::Clipper *)a1, a3);
  }
  ClipperLib::ClipperBase::DisposeAllOutRecs((ClipperLib::ClipperBase *)(a1 + *(void *)(*(void *)a1 - 24)));
  *(unsigned char *)(a1 + 120) = 0;
  return v5;
}

void std::vector<std::vector<ClipperLib::IntPoint>>::resize(uint64_t *a1, unint64_t a2)
{
  uint64_t v3 = a1[1];
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((v3 - *a1) >> 3);
  BOOL v5 = a2 >= v4;
  unint64_t v6 = a2 - v4;
  if (v6 != 0 && v5)
  {
    std::vector<std::vector<ClipperLib::IntPoint>>::__append(a1, v6);
  }
  else if (!v5)
  {
    uint64_t v7 = *a1 + 24 * a2;
    if (v3 != v7)
    {
      uint64_t v8 = a1[1];
      do
      {
        uint64_t v10 = *(void **)(v8 - 24);
        v8 -= 24;
        uint64_t v9 = v10;
        if (v10)
        {
          *(void *)(v3 - 16) = v9;
          operator delete(v9);
        }
        uint64_t v3 = v8;
      }
      while (v8 != v7);
    }
    a1[1] = v7;
  }
}

void ClipperLib::Clipper::BuildResult(uint64_t *a1, uint64_t *a2)
{
  std::vector<std::vector<ClipperLib::IntPoint>>::reserve(a2, (*(uint64_t *)((char *)a1 + *(void *)(*a1 - 24) + 88) - *(uint64_t *)((char *)a1 + *(void *)(*a1 - 24) + 80)) >> 3);
  uint64_t v4 = *a1;
  BOOL v5 = (void *)(*a1 - 24);
  uint64_t v6 = *(uint64_t *)((char *)a1 + *v5 + 80);
  if (*(uint64_t *)((char *)a1 + *v5 + 88) != v6)
  {
    unint64_t v7 = 0;
    uint64_t v28 = a2;
    do
    {
      if (*(void *)(*(void *)(v6 + 8 * v7) + 24))
      {
        __p = 0;
        uint64_t v30 = 0;
        uint64_t v31 = 0;
        uint64_t v8 = *(void *)(*(void *)(*(uint64_t *)((char *)a1 + *v5 + 80) + 8 * v7) + 24);
        uint64_t v9 = *(void *)(v8 + 40);
        if (v9)
        {
          unint64_t v10 = 0;
          uint64_t v11 = *(void *)(v8 + 40);
          do
          {
            uint64_t v11 = *(void *)(v11 + 32);
            ++v10;
          }
          while (v11 != v9);
          if (v10 != 1)
          {
            std::vector<ClipperLib::IntPoint>::reserve(&__p, v10);
            int v12 = 0;
            uint64_t v13 = v30;
            do
            {
              uint64_t v14 = (long long *)(v9 + 8);
              if (v13 >= v31)
              {
                unint64_t v16 = 0xAAAAAAAAAAAAAAABLL * ((v13 - (unsigned char *)__p) >> 3);
                unint64_t v17 = v16 + 1;
                if (v16 + 1 > 0xAAAAAAAAAAAAAAALL) {
                  std::vector<ClipperLib::IntPoint>::__throw_length_error[abi:ne180100]();
                }
                if (0x5555555555555556 * ((v31 - (unsigned char *)__p) >> 3) > v17) {
                  unint64_t v17 = 0x5555555555555556 * ((v31 - (unsigned char *)__p) >> 3);
                }
                if (0xAAAAAAAAAAAAAAABLL * ((v31 - (unsigned char *)__p) >> 3) >= 0x555555555555555) {
                  unint64_t v18 = 0xAAAAAAAAAAAAAAALL;
                }
                else {
                  unint64_t v18 = v17;
                }
                if (v18) {
                  uint64_t v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::IntPoint>>((uint64_t)&v31, v18);
                }
                else {
                  uint64_t v19 = 0;
                }
                uint64_t v20 = &v19[24 * v16];
                long long v21 = *v14;
                *((void *)v20 + 2) = *(void *)(v9 + 24);
                *(_OWORD *)uint64_t v20 = v21;
                uint64_t v23 = (char *)__p;
                uint64_t v22 = v30;
                uint64_t v24 = v20;
                if (v30 != __p)
                {
                  do
                  {
                    long long v25 = *(_OWORD *)(v22 - 24);
                    *((void *)v24 - 1) = *((void *)v22 - 1);
                    *(_OWORD *)(v24 - 24) = v25;
                    v24 -= 24;
                    v22 -= 24;
                  }
                  while (v22 != v23);
                  uint64_t v22 = (char *)__p;
                }
                uint64_t v13 = v20 + 24;
                __p = v24;
                uint64_t v30 = v20 + 24;
                uint64_t v31 = &v19[24 * v18];
                if (v22) {
                  operator delete(v22);
                }
              }
              else
              {
                long long v15 = *v14;
                *((void *)v13 + 2) = *(void *)(v9 + 24);
                *(_OWORD *)uint64_t v13 = v15;
                v13 += 24;
              }
              uint64_t v30 = v13;
              uint64_t v9 = *(void *)(v9 + 40);
              ++v12;
            }
            while (v10 != v12);
            unint64_t v26 = v28[1];
            if (v26 >= v28[2])
            {
              uint64_t v27 = std::vector<std::vector<ClipperLib::IntPoint>>::__push_back_slow_path<std::vector<ClipperLib::IntPoint> const&>(v28, (uint64_t)&__p);
            }
            else
            {
              std::vector<std::vector<ClipperLib::IntPoint>>::__construct_one_at_end[abi:ne180100]<std::vector<ClipperLib::IntPoint> const&>((uint64_t)v28, (uint64_t)&__p);
              uint64_t v27 = v26 + 24;
            }
            v28[1] = v27;
            if (__p)
            {
              uint64_t v30 = (char *)__p;
              operator delete(__p);
            }
          }
        }
        uint64_t v4 = *a1;
      }
      ++v7;
      BOOL v5 = (void *)(v4 - 24);
      uint64_t v6 = *(uint64_t *)((char *)a1 + *(void *)(v4 - 24) + 80);
    }
    while (v7 < (*(uint64_t *)((char *)a1 + *(void *)(v4 - 24) + 88) - v6) >> 3);
  }
}

void sub_1DB27F098(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void ClipperLib::Clipper::BuildResult2(ClipperLib::Clipper *this, void **a2)
{
  ClipperLib::PolyTree::Clear((ClipperLib::PolyTree *)a2);
  std::vector<ClipperLib::PolyNode *>::reserve(a2 + 10, (uint64_t)(*(void *)((char *)this + *(void *)(*(void *)this - 24) + 88)- *(void *)((char *)this + *(void *)(*(void *)this - 24) + 80)) >> 3);
  uint64_t v5 = *(void *)((char *)this + *(void *)(*(void *)this - 24) + 80);
  if (*(void *)((char *)this + *(void *)(*(void *)this - 24) + 88) == v5)
  {
    unint64_t v13 = 0;
  }
  else
  {
    unint64_t v6 = 0;
    uint64_t v20 = this;
    do
    {
      uint64_t v7 = *(void *)(v5 + 8 * v6);
      uint64_t v8 = *(void *)(v7 + 24);
      if (v8)
      {
        int v9 = 0;
        uint64_t v10 = *(void *)(v7 + 24);
        do
        {
          uint64_t v10 = *(void *)(v10 + 32);
          --v9;
        }
        while (v10 != v8);
        unsigned int v11 = *(unsigned char *)(v7 + 5) ? 1 : 2;
        if (~v9 >= v11)
        {
          ClipperLib::Clipper::FixHoleLinkage(v4, v7);
          operator new();
        }
      }
      ++v6;
      this = v20;
      uint64_t v5 = *(void *)((char *)v20 + *(void *)(*(void *)v20 - 24) + 80);
      uint64_t v12 = *(void *)((char *)v20 + *(void *)(*(void *)v20 - 24) + 88) - v5;
    }
    while (v6 < v12 >> 3);
    unint64_t v13 = v12 >> 3;
  }
  std::vector<ClipperLib::PolyNode *>::reserve(a2 + 4, v13);
  uint64_t v14 = *(void *)((char *)this + *(void *)(*(void *)this - 24) + 80);
  if (*(void *)((char *)this + *(void *)(*(void *)this - 24) + 88) != v14)
  {
    unint64_t v15 = 0;
    while (1)
    {
      uint64_t v16 = *(void *)(v14 + 8 * v15);
      unint64_t v17 = *(ClipperLib::PolyNode **)(v16 + 16);
      if (v17) {
        break;
      }
LABEL_21:
      ++v15;
      uint64_t v14 = *(void *)((char *)this + *(void *)(*(void *)this - 24) + 80);
      if (v15 >= (*(void *)((char *)this + *(void *)(*(void *)this - 24) + 88) - v14) >> 3) {
        return;
      }
    }
    if (*(unsigned char *)(v16 + 5))
    {
      *((unsigned char *)v17 + 68) = 1;
    }
    else
    {
      uint64_t v19 = *(void *)(v16 + 8);
      if (v19)
      {
        unint64_t v18 = *(ClipperLib::PolyNode **)(v19 + 16);
        if (v18) {
          goto LABEL_20;
        }
      }
    }
    unint64_t v18 = (ClipperLib::PolyNode *)a2;
LABEL_20:
    ClipperLib::PolyNode::AddChild(v18, v17);
    goto LABEL_21;
  }
}

void ClipperLib::Clipper::FixHoleLinkage(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 8);
  if (v2)
  {
    int v3 = *(unsigned __int8 *)(a2 + 4);
    if (v3 == *(unsigned __int8 *)(v2 + 4) || !*(void *)(v2 + 24))
    {
      do
      {
        if (*(unsigned __int8 *)(v2 + 4) != v3 && *(void *)(v2 + 24)) {
          break;
        }
        uint64_t v2 = *(void *)(v2 + 8);
      }
      while (v2);
      *(void *)(a2 + 8) = v2;
    }
  }
}

uint64_t ClipperLib::Clipper::ExecuteInternal(ClipperLib::Clipper *this)
{
  (*(void (**)(char *))(*(void *)((char *)this + *(void *)(*(void *)this - 24)) + 32))((char *)this + *(void *)(*(void *)this - 24));
  v19[0] = (uint64_t)v19;
  v19[1] = (uint64_t)v19;
  v19[2] = 0;
  std::list<long long>::__move_assign((uint64_t *)this + 11, v19);
  std::__list_imp<long long>::clear(v19);
  *((void *)this + 14) = 0;
  uint64_t v18 = 0;
  v19[0] = 0;
  if (!ClipperLib::ClipperBase::PopScanbeam((ClipperLib::Clipper *)((char *)this + *(void *)(*(void *)this - 24)), v19))return 0; {
  ClipperLib::Clipper::InsertLocalMinimaIntoAEL(this, v19[0]);
  }
  while (1)
  {
    uint64_t v2 = ClipperLib::ClipperBase::PopScanbeam((ClipperLib::Clipper *)((char *)this + *(void *)(*(void *)this - 24)), &v18);
    if ((v2 & 1) == 0
      && *(void *)((char *)this + *(void *)(*(void *)this - 24) + 8) == *(void *)((char *)this
                                                                                          + *(void *)(*(void *)this - 24)
                                                                                          + 24))
    {
      break;
    }
    ClipperLib::Clipper::ProcessHorizontals(this);
    ClipperLib::Clipper::ClearGhostJoins(this);
    uint64_t v3 = v18;
    if (!ClipperLib::Clipper::ProcessIntersections(this, v18))
    {
      uint64_t v4 = 0;
      goto LABEL_30;
    }
    ClipperLib::Clipper::ProcessEdgesAtTopOfScanbeam(this, v3);
    ClipperLib::Clipper::InsertLocalMinimaIntoAEL(this, v3);
  }
  uint64_t v5 = *(void *)this;
  uint64_t v6 = *(void *)this;
  uint64_t v7 = *(void *)(*(void *)this - 24);
  uint64_t v8 = *(void *)((char *)this + v7 + 80);
  if (*(void *)((char *)this + v7 + 88) != v8)
  {
    unint64_t v9 = 0;
    do
    {
      uint64_t v2 = *(void *)(v8 + 8 * v9);
      uint64_t v10 = *(int8x16_t **)(v2 + 24);
      if (v10)
      {
        if (!*(unsigned char *)(v2 + 5))
        {
          int v11 = *((unsigned __int8 *)this + 132) ^ *(unsigned __int8 *)(v2 + 4);
          if (v11 == ClipperLib::Area(v2) > 0.0)
          {
            uint64_t v12 = v10;
            do
            {
              int8x16_t v13 = v12[2];
              unint64_t v12[2] = vextq_s8(v13, v13, 8uLL);
              uint64_t v12 = (int8x16_t *)v13.i64[0];
            }
            while ((int8x16_t *)v13.i64[0] != v10);
            uint64_t v7 = *(void *)(v6 - 24);
          }
        }
      }
      ++v9;
      uint64_t v8 = *(void *)((char *)this + v7 + 80);
    }
    while (v9 < (*(void *)((char *)this + v7 + 88) - v8) >> 3);
  }
  if (*((void *)this + 1) != *((void *)this + 2))
  {
    uint64_t v2 = ClipperLib::Clipper::JoinCommonEdges((uint64_t)this);
    uint64_t v5 = *(void *)this;
  }
  uint64_t v14 = *(void *)((char *)this + *(void *)(v5 - 24) + 80);
  if (*(void *)((char *)this + *(void *)(v5 - 24) + 88) != v14)
  {
    unint64_t v15 = 0;
    do
    {
      uint64_t v16 = *(void *)(v14 + 8 * v15);
      if (*(void *)(v16 + 24))
      {
        if (*(unsigned char *)(v16 + 5)) {
          uint64_t v2 = (uint64_t)ClipperLib::Clipper::FixupOutPolyline(v2, v16);
        }
        else {
          uint64_t v2 = ClipperLib::Clipper::FixupOutPolygon((uint64_t)this, v16);
        }
      }
      ++v15;
      uint64_t v14 = *(void *)((char *)this + *(void *)(*(void *)this - 24) + 80);
    }
    while (v15 < (*(void *)((char *)this + *(void *)(*(void *)this - 24) + 88) - v14) >> 3);
  }
  if (*((unsigned char *)this + 134)) {
    ClipperLib::Clipper::DoSimplePolygons((uint64_t *)this);
  }
  uint64_t v4 = 1;
LABEL_30:
  ClipperLib::Clipper::ClearJoins(this);
  ClipperLib::Clipper::ClearGhostJoins(this);
  return v4;
}

void ClipperLib::Clipper::InsertLocalMinimaIntoAEL(ClipperLib::Clipper *this, uint64_t a2)
{
  uint64_t v2 = (char *)this + 40;
  uint64_t v3 = (char *)this + *(void *)(*(void *)this - 24);
  uint64_t v6 = (void *)*((void *)v3 + 1);
  uint64_t v4 = v3 + 8;
  uint64_t v5 = v6;
  if (v6 != (void *)v4[2])
  {
    unint64_t v9 = (uint64_t *)((char *)this + 112);
    do
    {
      if (*v5 != a2) {
        return;
      }
      void *v4 = v5 + 3;
      uint64_t v10 = v5[1];
      uint64_t v11 = v5[2];
      if (v10)
      {
        ClipperLib::Clipper::InsertEdgeIntoAEL((uint64_t *)this, v5[1], 0);
        if (!v11)
        {
          ClipperLib::Clipper::SetWindingCount((uint64_t)this, v10);
          if (ClipperLib::Clipper::IsContributing((uint64_t)this, (_DWORD *)v10)) {
            ClipperLib::Clipper::AddOutPt(this, v10, (void *)v10);
          }
          uint64_t v13 = *(void *)(*(void *)this - 24);
          uint64_t v60 = *(void *)(v10 + 56);
          std::priority_queue<long long>::push((uint64_t)v9 + v13, &v60);
          goto LABEL_67;
        }
        ClipperLib::Clipper::InsertEdgeIntoAEL((uint64_t *)this, v11, v10);
        ClipperLib::Clipper::SetWindingCount((uint64_t)this, v10);
        *(void *)(v11 + 92) = *(void *)(v10 + 92);
        if (ClipperLib::Clipper::IsContributing((uint64_t)this, (_DWORD *)v10)) {
          uint64_t v12 = ClipperLib::Clipper::AddLocalMinPoly(this, v10, v11, (void *)v10);
        }
        else {
          uint64_t v12 = 0;
        }
        uint64_t v14 = *(void *)(*(void *)this - 24);
        uint64_t v60 = *(void *)(v10 + 56);
        std::priority_queue<long long>::push((uint64_t)v9 + v14, &v60);
      }
      else
      {
        ClipperLib::Clipper::InsertEdgeIntoAEL((uint64_t *)this, v5[2], 0);
        ClipperLib::Clipper::SetWindingCount((uint64_t)this, v11);
        uint64_t v12 = 0;
        if (ClipperLib::Clipper::IsContributing((uint64_t)this, (_DWORD *)v11)) {
          uint64_t v12 = ClipperLib::Clipper::AddOutPt(this, v11, (void *)v11);
        }
        if (!v11) {
          goto LABEL_67;
        }
      }
      if (*(double *)(v11 + 72) == -1.0e40)
      {
        uint64_t v15 = *v9;
        *(void *)(v11 + 152) = 0;
        if (v15) {
          *(void *)(v15 + 152) = v11;
        }
        *unint64_t v9 = v11;
        *(void *)(v11 + 144) = v15;
        uint64_t v16 = *(void *)(v11 + 120);
        if (!v16) {
          goto LABEL_24;
        }
        uint64_t v17 = *(void *)(*(void *)this - 24);
        uint64_t v60 = *(void *)(v16 + 56);
        uint64_t v18 = (uint64_t)v9 + v17;
      }
      else
      {
        uint64_t v19 = *(void *)(*(void *)this - 24);
        uint64_t v60 = *(void *)(v11 + 56);
        uint64_t v18 = (uint64_t)v9 + v19;
      }
      std::priority_queue<long long>::push(v18, &v60);
LABEL_24:
      if (v10)
      {
        if (v12)
        {
          if (*(double *)(v11 + 72) == -1.0e40)
          {
            uint64_t v21 = *((void *)this + 4);
            uint64_t v20 = *((void *)this + 5);
            if (v20 != v21)
            {
              if (*(_DWORD *)(v11 + 88))
              {
                unint64_t v22 = 0;
                do
                {
                  uint64_t v23 = *(void **)(v21 + 8 * v22);
                  uint64_t v24 = *(void *)(*v23 + 8);
                  uint64_t v27 = v23[2];
                  long long v25 = v23 + 2;
                  uint64_t v26 = v27;
                  uint64_t v28 = *(void *)v11;
                  uint64_t v29 = *(void *)(v11 + 48);
                  BOOL v30 = v24 <= v27;
                  if (v24 >= v27) {
                    uint64_t v31 = v26;
                  }
                  else {
                    uint64_t v31 = v24;
                  }
                  if (v30) {
                    uint64_t v24 = v26;
                  }
                  if (v28 >= v29) {
                    uint64_t v32 = *(void *)(v11 + 48);
                  }
                  else {
                    uint64_t v32 = *(void *)v11;
                  }
                  if (v28 <= v29) {
                    uint64_t v28 = *(void *)(v11 + 48);
                  }
                  if (v31 < v28 && v32 < v24)
                  {
                    long long v58 = *(_OWORD *)v25;
                    uint64_t v59 = v25[2];
                    ClipperLib::Clipper::AddJoin();
                  }
                  ++v22;
                }
                while (v22 < (v20 - v21) >> 3);
              }
            }
          }
        }
        if ((*(_DWORD *)(v10 + 100) & 0x80000000) == 0)
        {
          uint64_t v34 = *(void *)(v10 + 136);
          if (v34)
          {
            if (*(void *)(v34 + 24) == *(void *)v10 && (*(_DWORD *)(v34 + 100) & 0x80000000) == 0)
            {
              long long v56 = *(_OWORD *)v34;
              uint64_t v57 = *(void *)(v34 + 16);
              long long v54 = *(_OWORD *)(v34 + 48);
              uint64_t v55 = *(void *)(v34 + 64);
              long long v52 = *(_OWORD *)(v10 + 24);
              uint64_t v53 = *(void *)(v10 + 40);
              uint64_t v51 = *(void *)(v10 + 64);
              long long v50 = *(_OWORD *)(v10 + 48);
              if (ClipperLib::SlopesEqual(&v56, &v54, &v52, &v50, v2[*(void *)(*(void *)this - 24)])&& *(_DWORD *)(v10 + 88)&& *(_DWORD *)(v34 + 88))
              {
                ClipperLib::Clipper::AddOutPt(this, v34, (void *)v10);
                long long v48 = *(_OWORD *)(v10 + 48);
                uint64_t v49 = *(void *)(v10 + 64);
                ClipperLib::Clipper::AddJoin();
              }
            }
          }
        }
        uint64_t v35 = *(void *)(v10 + 128);
        if (v35 != v11)
        {
          if ((*(_DWORD *)(v11 + 100) & 0x80000000) == 0)
          {
            uint64_t v36 = *(void *)(v11 + 136);
            if ((*(_DWORD *)(v36 + 100) & 0x80000000) == 0)
            {
              long long v46 = *(_OWORD *)(v36 + 24);
              uint64_t v47 = *(void *)(v36 + 40);
              long long v44 = *(_OWORD *)(v36 + 48);
              uint64_t v45 = *(void *)(v36 + 64);
              long long v42 = *(_OWORD *)(v11 + 24);
              uint64_t v43 = *(void *)(v11 + 40);
              uint64_t v41 = *(void *)(v11 + 64);
              long long v40 = *(_OWORD *)(v11 + 48);
              if (ClipperLib::SlopesEqual(&v46, &v44, &v42, &v40, v2[*(void *)(*(void *)this - 24)])&& *(_DWORD *)(v11 + 88)&& *(_DWORD *)(v36 + 88))
              {
                ClipperLib::Clipper::AddOutPt(this, v36, (void *)v11);
                ClipperLib::Clipper::AddJoin();
              }
            }
          }
          if (v35 && v35 != v11)
          {
            uint64_t v37 = (void *)(v10 + 24);
            do
            {
              ClipperLib::Clipper::IntersectEdges((uint64_t)this, (_DWORD *)v11, (_DWORD *)v35, v37);
              uint64_t v35 = *(void *)(v35 + 128);
            }
            while (v35 != v11);
          }
        }
      }
LABEL_67:
      uint64_t v38 = (char *)this + *(void *)(*(void *)this - 24);
      uint64_t v39 = (void *)*((void *)v38 + 1);
      uint64_t v4 = v38 + 8;
      uint64_t v5 = v39;
    }
    while (v39 != (void *)v4[2]);
  }
}

void ClipperLib::Clipper::ProcessHorizontals(ClipperLib::Clipper *this)
{
  uint64_t v2 = (uint64_t *)((char *)this + 112);
  for (i = (uint64_t *)*((void *)this + 14); i; i = (uint64_t *)*((void *)this + 14))
  {
    uint64_t v4 = i[18];
    uint64_t v5 = i[19];
    if (*((_OWORD *)i + 9) == 0)
    {
      *uint64_t v2 = 0;
    }
    else
    {
      uint64_t v6 = (uint64_t *)(v5 + 144);
      if (!v5) {
        uint64_t v6 = v2;
      }
      uint64_t *v6 = v4;
      if (v4) {
        *(void *)(v4 + 152) = v5;
      }
    }
    i[18] = 0;
    i[19] = 0;
    ClipperLib::Clipper::ProcessHorizontal((uint64_t *)this, i);
  }
}

void ClipperLib::Clipper::ClearGhostJoins(ClipperLib::Clipper *this)
{
  uint64_t v1 = *((void *)this + 4);
  uint64_t v2 = *((void *)this + 5);
  uint64_t v3 = (char *)this + 32;
  if (v2 != v1)
  {
    unint64_t v5 = 0;
    do
    {
      uint64_t v6 = *(void *)(v1 + 8 * v5);
      if (v6)
      {
        MEMORY[0x1E018DFE0](v6, 0x1020C40E349F4B1);
        uint64_t v1 = *((void *)this + 4);
        uint64_t v2 = *((void *)this + 5);
      }
      ++v5;
    }
    while (v5 < (v2 - v1) >> 3);
  }
  std::vector<ClipperLib::PolyNode *>::resize((uint64_t)v3, 0);
}

BOOL ClipperLib::Clipper::ProcessIntersections(ClipperLib::Clipper *this, uint64_t a2)
{
  if (!*(void *)((char *)this + *(void *)(*(void *)this - 24) + 104)) {
    return 1;
  }
  ClipperLib::Clipper::BuildIntersectList(this, a2);
  uint64_t v3 = (uint64_t)(*((void *)this + 8) - *((void *)this + 7)) >> 3;
  if (!v3) {
    return 1;
  }
  if (v3 == 1 || (BOOL result = ClipperLib::Clipper::FixupIntersectionOrder(this)))
  {
    ClipperLib::Clipper::ProcessIntersectList(this);
    *((void *)this + 14) = 0;
    return 1;
  }
  return result;
}

void sub_1DB27FE98(void *a1)
{
  __cxa_begin_catch(a1);
  *(void *)(v1 + 112) = 0;
  ClipperLib::Clipper::DisposeIntersectNodes(v1);
  exception = (ClipperLib::clipperException *)__cxa_allocate_exception(0x20uLL);
  ClipperLib::clipperException::clipperException(exception, "ProcessIntersections error");
}

void sub_1DB27FEE8(_Unwind_Exception *a1)
{
}

void ClipperLib::Clipper::ProcessEdgesAtTopOfScanbeam(ClipperLib::Clipper *this, uint64_t a2)
{
  uint64_t v4 = (void *)((char *)this + 104);
  unint64_t v5 = *(void **)((char *)this + *(void *)(*(void *)this - 24) + 104);
  uint64_t v51 = v5;
  if (v5)
  {
    uint64_t v6 = (uint64_t *)((char *)this + 88);
    while (v5[7] == a2)
    {
      if (v5[15] || (ClipperLib::GetMaximaPairEx(v5), v15) && *(double *)(v15 + 72) == -1.0e40)
      {
        uint64_t v7 = v5[15];
        if (v7 && *(double *)(v7 + 72) == -1.0e40)
        {
          ClipperLib::ClipperBase::UpdateEdgeIntoAEL((uint64_t)this + *(void *)(*(void *)this - 24), (uint64_t *)&v51);
          unint64_t v5 = v51;
          if ((*((_DWORD *)v51 + 25) & 0x80000000) == 0) {
            ClipperLib::Clipper::AddOutPt(this, (uint64_t)v51, v51);
          }
          uint64_t v8 = *((void *)this + 14);
          v5[19] = 0;
          if (v8) {
            *(void *)(v8 + 152) = v5;
          }
          *((void *)this + 14) = v5;
          v5[18] = v8;
          goto LABEL_18;
        }
        uint64_t v11 = v5[6];
LABEL_17:
        v5[3] = v11;
        v5[4] = a2;
LABEL_18:
        if (*((unsigned char *)this + 134))
        {
          if ((*((_DWORD *)v5 + 25) & 0x80000000) == 0)
          {
            if (*((_DWORD *)v5 + 22))
            {
              uint64_t v12 = v5[17];
              if (v12)
              {
                if ((*(_DWORD *)(v12 + 100) & 0x80000000) == 0
                  && *(void *)(v12 + 24) == v5[3]
                  && *(_DWORD *)(v12 + 88))
                {
                  long long v49 = *(_OWORD *)(v5 + 3);
                  uint64_t v50 = v5[5];
                  uint64_t v13 = (void (*)(uint64_t, uint64_t, void *, void *, long long *))*((void *)this + 17);
                  if (v13) {
                    v13(v12, v12 + 48, v5, v5 + 6, &v49);
                  }
                  ClipperLib::Clipper::AddOutPt(this, v12, &v49);
                  ClipperLib::Clipper::AddOutPt(this, (uint64_t)v5, &v49);
                  long long v47 = v49;
                  uint64_t v48 = v50;
                  ClipperLib::Clipper::AddJoin();
                }
              }
            }
          }
        }
        uint64_t v14 = (void **)(v5 + 16);
        goto LABEL_29;
      }
      if (*((unsigned char *)this + 134))
      {
        uint64_t v16 = operator new(0x18uLL);
        uint64_t v17 = v5[6];
        v16[1] = v6;
        v16[2] = v17;
        uint64_t v18 = *v6;
        void *v16 = *v6;
        *(void *)(v18 + 8) = v16;
        uint64_t *v6 = (uint64_t)v16;
        ++*v4;
      }
      uint64_t v19 = v5[17];
      ClipperLib::Clipper::DoMaxima((uint64_t *)this, (uint64_t)v5);
      if (v19) {
        uint64_t v14 = (void **)(v19 + 128);
      }
      else {
        uint64_t v14 = (void **)((char *)v4 + *(void *)(*(void *)this - 24));
      }
LABEL_29:
      uint64_t v51 = *v14;
      unint64_t v5 = v51;
      if (!v51) {
        goto LABEL_38;
      }
    }
    double v9 = *((double *)v5 + 9) * (double)(a2 - v5[1]);
    if (v9 >= 0.0) {
      double v10 = 0.5;
    }
    else {
      double v10 = -0.5;
    }
    uint64_t v11 = *v5 + (uint64_t)(v9 + v10);
    goto LABEL_17;
  }
LABEL_38:
  std::list<long long>::__sort<std::__less<void,void>>(*((uint64_t **)this + 12), (uint64_t *)this + 11, *((void *)this + 13), (uint64_t)&v49);
  ClipperLib::Clipper::ProcessHorizontals(this);
  std::__list_imp<long long>::clear((void *)this + 11);
  uint64_t v20 = *(void **)((char *)this + *(void *)(*(void *)this - 24) + 104);
  uint64_t v51 = v20;
  if (v20)
  {
    uint64_t v21 = (char *)this + 40;
    do
    {
      if (v20[7] == a2 && v20[15])
      {
        if ((*((_DWORD *)v20 + 25) & 0x80000000) != 0) {
          uint64_t v22 = 0;
        }
        else {
          uint64_t v22 = ClipperLib::Clipper::AddOutPt(this, (uint64_t)v20, v20 + 6);
        }
        ClipperLib::ClipperBase::UpdateEdgeIntoAEL((uint64_t)this + *(void *)(*(void *)this - 24), (uint64_t *)&v51);
        uint64_t v20 = v51;
        uint64_t v23 = v51[16];
        uint64_t v24 = v51[17];
        if (v24 && *(void *)(v24 + 24) == *v51)
        {
          uint64_t v25 = *(void *)(v24 + 32);
          if (v25 == v51[1] && v22 != 0 && (*(_DWORD *)(v24 + 100) & 0x80000000) == 0 && v25 > *(void *)(v24 + 56))
          {
            long long v45 = *(_OWORD *)(v51 + 3);
            uint64_t v46 = v51[5];
            long long v43 = *((_OWORD *)v51 + 3);
            uint64_t v44 = v51[8];
            long long v41 = *(_OWORD *)(v24 + 24);
            uint64_t v42 = *(void *)(v24 + 40);
            uint64_t v40 = *(void *)(v24 + 64);
            long long v39 = *(_OWORD *)(v24 + 48);
            if (ClipperLib::SlopesEqual(&v45, &v43, &v41, &v39, v21[*(void *)(*(void *)this - 24)])&& *((_DWORD *)v20 + 22)&& *(_DWORD *)(v24 + 88))
            {
              ClipperLib::Clipper::AddOutPt(this, v24, v20);
              long long v37 = *((_OWORD *)v20 + 3);
              uint64_t v38 = v20[8];
              goto LABEL_69;
            }
          }
        }
        if (v23 && *(void *)(v23 + 24) == *v20)
        {
          uint64_t v27 = *(void *)(v23 + 32);
          if (v27 == v20[1] && v22 != 0 && (*(_DWORD *)(v23 + 100) & 0x80000000) == 0 && v27 > *(void *)(v23 + 56))
          {
            long long v35 = *(_OWORD *)(v20 + 3);
            uint64_t v36 = v20[5];
            long long v33 = *((_OWORD *)v20 + 3);
            uint64_t v34 = v20[8];
            long long v31 = *(_OWORD *)(v23 + 24);
            uint64_t v32 = *(void *)(v23 + 40);
            uint64_t v30 = *(void *)(v23 + 64);
            long long v29 = *(_OWORD *)(v23 + 48);
            if (ClipperLib::SlopesEqual(&v35, &v33, &v31, &v29, v21[*(void *)(*(void *)this - 24)])&& *((_DWORD *)v20 + 22)&& *(_DWORD *)(v23 + 88))
            {
              ClipperLib::Clipper::AddOutPt(this, v23, v20);
LABEL_69:
              ClipperLib::Clipper::AddJoin();
            }
          }
        }
      }
      uint64_t v20 = (void *)v20[16];
      uint64_t v51 = v20;
    }
    while (v20);
  }
}

uint64_t ClipperLib::Clipper::JoinCommonEdges(uint64_t this)
{
  uint64_t v1 = *(void *)(this + 8);
  if (*(void *)(this + 16) != v1)
  {
    uint64_t v2 = this;
    unint64_t v3 = 0;
    uint64_t v4 = this + 80;
    do
    {
      unint64_t v5 = *(int ***)(v1 + 8 * v3);
      uint64_t v6 = *(void *)(v4 + *(void *)(*(void *)v2 - 24));
      uint64_t v7 = *(int **)(v6 + 8 * **v5);
      do
      {
        uint64_t v8 = (uint64_t)v7;
        uint64_t v7 = *(int **)(v6 + 8 * *v7);
      }
      while ((int *)v8 != v7);
      double v9 = *(int **)(v6 + 8 * *v5[1]);
      do
      {
        uint64_t v10 = (uint64_t)v9;
        double v9 = *(int **)(v6 + 8 * *v9);
      }
      while ((int *)v10 != v9);
      if (*(void *)(v8 + 24) && *(void *)(v10 + 24) && !*(unsigned char *)(v8 + 5) && !*(unsigned char *)(v10 + 5))
      {
        if (v8 == v10)
        {
          this = ClipperLib::Clipper::JoinPoints((uint64_t *)v2, v5, v8, v8);
          if (this)
          {
            *(void *)(v8 + 24) = *v5;
            *(void *)(v8 + 32) = 0;
            ClipperLib::ClipperBase::CreateOutRec((ClipperLib::ClipperBase *)(v2 + *(void *)(*(void *)v2 - 24)));
          }
        }
        else
        {
          uint64_t v11 = v8;
          do
            uint64_t v11 = *(void *)(v11 + 8);
          while (v11 != v10 && v11 != 0);
          uint64_t LowermostRec = v10;
          if (v11 != v10)
          {
            uint64_t v14 = v10;
            do
              uint64_t v14 = *(void *)(v14 + 8);
            while (v14 != v8 && v14 != 0);
            uint64_t LowermostRec = v8;
            if (v14 != v8) {
              uint64_t LowermostRec = ClipperLib::GetLowermostRec(v8, v10);
            }
          }
          this = ClipperLib::Clipper::JoinPoints((uint64_t *)v2, v5, v8, v10);
          if (this)
          {
            *(void *)(v10 + 24) = 0;
            *(void *)(v10 + 32) = 0;
            *(_DWORD *)uint64_t v10 = *(_DWORD *)v8;
            *(unsigned char *)(v8 + 4) = *(unsigned char *)(LowermostRec + 4);
            if (LowermostRec == v10) {
              *(void *)(v8 + 8) = *(void *)(v10 + 8);
            }
            *(void *)(v10 + 8) = v8;
            if (*(unsigned char *)(v2 + 133)) {
              this = (uint64_t)ClipperLib::Clipper::FixupFirstLefts3((uint64_t *)v2, v10, v8);
            }
          }
        }
      }
      ++v3;
      uint64_t v1 = *(void *)(v2 + 8);
    }
    while (v3 < (*(void *)(v2 + 16) - v1) >> 3);
  }
  return this;
}

void *ClipperLib::Clipper::FixupOutPolyline(uint64_t a1, uint64_t a2)
{
  BOOL result = *(void **)(a2 + 24);
  uint64_t v4 = (void *)result[5];
  if (result == v4)
  {
    uint64_t v8 = *(void **)(a2 + 24);
LABEL_14:
    BOOL result = ClipperLib::DisposeOutPts(&v8);
    *(void *)(a2 + 24) = 0;
    return result;
  }
  do
  {
    BOOL result = (void *)result[4];
    unint64_t v5 = (void *)result[5];
    if (result[1] == v5[1] && result[2] == v5[2])
    {
      if (result == v4) {
        uint64_t v4 = (void *)result[5];
      }
      v5[4] = result[4];
      *(void *)(result[4] + 40) = v5;
      MEMORY[0x1E018DFE0]();
      BOOL result = v5;
    }
  }
  while (result != v4);
  uint64_t v7 = (void *)result[5];
  uint64_t v8 = result;
  if (result == v7) {
    goto LABEL_14;
  }
  return result;
}

uint64_t ClipperLib::Clipper::FixupOutPolygon(uint64_t a1, uint64_t a2)
{
  *(void *)(a2 + 32) = 0;
  uint64_t v4 = *(void **)(a2 + 24);
  if (*(unsigned char *)(a1 + *(void *)(*(void *)a1 - 24) + 72)) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = *(unsigned char *)(a1 + 134) != 0;
  }
  BOOL v20 = v5;
  uint64_t v6 = v4 + 5;
  uint64_t v7 = (void *)v4[5];
  if (v7 != v4)
  {
    uint64_t v8 = 0;
    uint64_t v21 = a1 + 40;
    while (1)
    {
      double v9 = (void *)v4[4];
      if (v7 == v9) {
        break;
      }
      uint64_t v10 = v4[1];
      uint64_t v11 = v4[2];
      uint64_t v12 = (long long *)(v4 + 1);
      uint64_t v13 = (long long *)(v9 + 1);
      if (v10 == v9[1] && v11 == v9[2]) {
        goto LABEL_22;
      }
      uint64_t v15 = (long long *)(v7 + 1);
      if (v10 == v7[1] && v11 == v7[2]) {
        goto LABEL_22;
      }
      uint64_t v33 = v7[3];
      long long v32 = *v15;
      long long v17 = *v12;
      uint64_t v31 = v4[3];
      long long v30 = v17;
      long long v28 = *v13;
      uint64_t v29 = v9[3];
      uint64_t result = ClipperLib::SlopesEqual(&v32, (uint64_t *)&v30, &v28, *(unsigned __int8 *)(v21 + *(void *)(*(void *)a1 - 24)));
      if (!result) {
        goto LABEL_18;
      }
      if (!v20) {
        goto LABEL_22;
      }
      uint64_t v27 = v7[3];
      long long v26 = *v15;
      long long v19 = *v12;
      uint64_t v25 = v4[3];
      long long v24 = v19;
      long long v22 = *v13;
      uint64_t v23 = v9[3];
      uint64_t result = ClipperLib::Pt2IsBetweenPt1AndPt3((uint64_t *)&v26, (uint64_t *)&v24, (uint64_t *)&v22);
      if ((result & 1) == 0)
      {
LABEL_22:
        v7[4] = v9;
        *(void *)(v4[4] + 40) = v7;
        double v9 = (void *)*v6;
        MEMORY[0x1E018DFE0](v4, 0x1020C404ACFEA97);
        uint64_t v8 = 0;
      }
      else
      {
LABEL_18:
        if (v4 == v8) {
          goto LABEL_27;
        }
        if (!v8) {
          uint64_t v8 = v4;
        }
      }
      uint64_t v6 = v9 + 5;
      uint64_t v7 = (void *)v9[5];
      uint64_t v4 = v9;
      if (v7 == v9) {
        goto LABEL_26;
      }
    }
  }
  double v9 = v4;
LABEL_26:
  uint64_t v34 = v9;
  uint64_t result = (uint64_t)ClipperLib::DisposeOutPts(&v34);
  uint64_t v8 = 0;
LABEL_27:
  *(void *)(a2 + 24) = v8;
  return result;
}

uint64_t *ClipperLib::Clipper::DoSimplePolygons(uint64_t *this)
{
  uint64_t v1 = *this;
  uint64_t v2 = *(uint64_t *)((char *)this + *(void *)(*this - 24) + 80);
  if (*(uint64_t *)((char *)this + *(void *)(*this - 24) + 88) != v2)
  {
    unint64_t v3 = 0;
    do
    {
      uint64_t v4 = *(void *)(v2 + 8 * v3);
      BOOL v5 = *(void **)(v4 + 24);
      if (v5 && !*(unsigned char *)(v4 + 5))
      {
        uint64_t v6 = *(void **)(v4 + 24);
        do
        {
          if ((void *)v6[4] == v5) {
            break;
          }
          BOOL v5 = (void *)v6[4];
          do
          {
            BOOL v7 = v6[1] == v5[1] && v6[2] == v5[2];
            if (v7 && (void *)v5[4] != v6)
            {
              uint64_t v8 = (void *)v5[5];
              if (v8 != v6)
              {
                uint64_t v9 = v6[5];
                v6[5] = v8;
                v8[4] = v6;
                v5[5] = v9;
                *(void *)(v9 + 32) = v5;
                *(void *)(v4 + 24) = v6;
                ClipperLib::ClipperBase::CreateOutRec((ClipperLib::ClipperBase *)((char *)this + *(void *)(*this - 24)));
              }
            }
            BOOL v5 = (void *)v5[4];
          }
          while (v5 != *(void **)(v4 + 24));
          uint64_t v6 = (void *)v6[4];
        }
        while (v6 != v5);
        uint64_t v1 = *this;
      }
      ++v3;
      uint64_t v2 = *(uint64_t *)((char *)this + *(void *)(v1 - 24) + 80);
    }
    while (v3 < (*(uint64_t *)((char *)this + *(void *)(v1 - 24) + 88) - v2) >> 3);
  }
  return this;
}

void ClipperLib::Clipper::ClearJoins(ClipperLib::Clipper *this)
{
  uint64_t v1 = *((void *)this + 1);
  uint64_t v2 = *((void *)this + 2);
  unint64_t v3 = (char *)this + 8;
  if (v2 != v1)
  {
    unint64_t v5 = 0;
    do
    {
      uint64_t v6 = *(void *)(v1 + 8 * v5);
      if (v6)
      {
        MEMORY[0x1E018DFE0](v6, 0x1020C40E349F4B1);
        uint64_t v1 = *((void *)this + 1);
        uint64_t v2 = *((void *)this + 2);
      }
      ++v5;
    }
    while (v5 < (v2 - v1) >> 3);
  }
  std::vector<ClipperLib::PolyNode *>::resize((uint64_t)v3, 0);
}

uint64_t ClipperLib::Clipper::SetWindingCount(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 136);
  if (v2)
  {
    int v3 = *(_DWORD *)(a2 + 80);
    while (1)
    {
      if (*(_DWORD *)(v2 + 80) == v3)
      {
        int v4 = *(_DWORD *)(v2 + 88);
        if (v4) {
          break;
        }
      }
      uint64_t v2 = *(void *)(v2 + 136);
      if (!v2) {
        goto LABEL_6;
      }
    }
    unsigned int v9 = *(_DWORD *)(a2 + 88);
    if (v9)
    {
      uint64_t v10 = 124;
      if (!v3) {
        uint64_t v10 = 128;
      }
      if (!*(_DWORD *)(result + v10)) {
        goto LABEL_46;
      }
      int v11 = *(_DWORD *)(v2 + 92);
      if (((v11 * v4) & 0x80000000) == 0)
      {
        if (((v9 * v4) & 0x80000000) == 0) {
          int v12 = *(_DWORD *)(a2 + 88);
        }
        else {
          int v12 = 0;
        }
        unsigned int v9 = v11 + v12;
        goto LABEL_46;
      }
LABEL_29:
      if (v11 >= 0) {
        unsigned int v14 = v11;
      }
      else {
        unsigned int v14 = -v11;
      }
      if (v9 <= 1) {
        int v15 = 1;
      }
      else {
        int v15 = *(_DWORD *)(a2 + 88);
      }
      if (((v9 * v4) & 0x80000000) == 0) {
        int v16 = *(_DWORD *)(a2 + 88);
      }
      else {
        int v16 = 0;
      }
      unsigned int v17 = v11 + v16;
      if (v14 >= 2) {
        unsigned int v9 = v17;
      }
      else {
        unsigned int v9 = v15;
      }
      goto LABEL_46;
    }
    if (*(_DWORD *)(result + 80) == 1)
    {
      uint64_t v13 = 124;
      if (!v3) {
        uint64_t v13 = 128;
      }
      if (!*(_DWORD *)(result + v13))
      {
        uint64_t v18 = *(void *)(v2 + 136);
        for (i = 1; v18; uint64_t v18 = *(void *)(v18 + 136))
        {
          if (*(_DWORD *)(v18 + 80) == v3) {
            i ^= *(_DWORD *)(v18 + 88) != 0;
          }
        }
        unsigned int v9 = (i & 1) == 0;
        goto LABEL_46;
      }
      int v11 = *(_DWORD *)(v2 + 92);
      if (v11 * v4 < 0) {
        goto LABEL_29;
      }
      unsigned int v9 = ((v11 >> 31) | 1) + v11;
    }
    else
    {
      unsigned int v9 = 1;
    }
LABEL_46:
    int v7 = *(_DWORD *)(v2 + 96);
    *(_DWORD *)(a2 + 92) = v9;
    *(_DWORD *)(a2 + 96) = v7;
    uint64_t v8 = (uint64_t *)(v2 + 128);
    goto LABEL_47;
  }
LABEL_6:
  int v5 = *(_DWORD *)(a2 + 88);
  int v3 = *(_DWORD *)(a2 + 80);
  if (!v5)
  {
    uint64_t v6 = 124;
    if (!v3) {
      uint64_t v6 = 128;
    }
    if (*(_DWORD *)(result + v6) == 3) {
      int v5 = -1;
    }
    else {
      int v5 = 1;
    }
  }
  int v7 = 0;
  *(_DWORD *)(a2 + 92) = v5;
  *(_DWORD *)(a2 + 96) = 0;
  uint64_t v8 = (uint64_t *)(result + *(void *)(*(void *)result - 24) + 104);
LABEL_47:
  uint64_t v20 = *v8;
  BOOL v21 = v3 == 0;
  uint64_t v22 = 128;
  if (v21) {
    uint64_t v22 = 124;
  }
  if (*(_DWORD *)(result + v22))
  {
    if (v20 != a2)
    {
      do
      {
        v7 += *(_DWORD *)(v20 + 88);
        uint64_t v20 = *(void *)(v20 + 128);
      }
      while (v20 != a2);
      *(_DWORD *)(a2 + 96) = v7;
    }
  }
  else
  {
    while (v20 != a2)
    {
      if (*(_DWORD *)(v20 + 88))
      {
        int v7 = v7 == 0;
        *(_DWORD *)(a2 + 96) = v7;
      }
      uint64_t v20 = *(void *)(v20 + 128);
    }
  }
  return result;
}

BOOL ClipperLib::Clipper::IsEvenOddFillType(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = 124;
  if (!*(_DWORD *)(a2 + 80)) {
    uint64_t v2 = 128;
  }
  return *(_DWORD *)(a1 + v2) == 0;
}

BOOL ClipperLib::Clipper::IsEvenOddAltFillType(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = 128;
  if (!*(_DWORD *)(a2 + 80)) {
    uint64_t v2 = 124;
  }
  return *(_DWORD *)(a1 + v2) == 0;
}

uint64_t ClipperLib::Clipper::IsContributing(uint64_t a1, _DWORD *a2)
{
  int v2 = a2[20];
  uint64_t v3 = 124;
  if (v2) {
    uint64_t v4 = 124;
  }
  else {
    uint64_t v4 = 128;
  }
  if (v2) {
    uint64_t v3 = 128;
  }
  unsigned int v5 = *(_DWORD *)(a1 + v3);
  int v6 = *(_DWORD *)(a1 + v4);
  switch(v6)
  {
    case 2:
LABEL_10:
      int v7 = a2[23];
      goto LABEL_13;
    case 1:
      int v7 = a2[23];
      if (v7 < 0) {
        int v7 = -v7;
      }
LABEL_13:
      if (v7 == 1) {
        goto LABEL_14;
      }
      return 0;
    case 0:
      if (a2[22]) {
        goto LABEL_14;
      }
      goto LABEL_10;
  }
  if (a2[23] != -1) {
    return 0;
  }
LABEL_14:
  switch(*(_DWORD *)(a1 + 80))
  {
    case 0:
      BOOL v8 = v5 == 2;
      if (v5 >= 2) {
        goto LABEL_21;
      }
      return a2[24] != 0;
    case 1:
      goto LABEL_26;
    case 2:
      BOOL v8 = v5 == 2;
      if (v2)
      {
        if (v5 < 2) {
          return a2[24] != 0;
        }
LABEL_21:
        if (v8) {
          return a2[24] > 0;
        }
        unsigned int v10 = a2[24];
      }
      else
      {
        if (v5 < 2) {
          return a2[24] == 0;
        }
LABEL_29:
        if (v8) {
          return a2[24] < 1;
        }
        unsigned int v10 = ~a2[24];
      }
      uint64_t result = v10 >> 31;
      break;
    case 3:
      if (a2[22]) {
        return 1;
      }
LABEL_26:
      BOOL v8 = v5 == 2;
      if (v5 < 2) {
        return a2[24] == 0;
      }
      goto LABEL_29;
    default:
      return 1;
  }
  return result;
}

uint64_t ClipperLib::Clipper::AddLocalMinPoly(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v6 = a2;
  double v8 = *(double *)(a3 + 72);
  if (v8 != -1.0e40 && *(double *)(a2 + 72) <= v8)
  {
    uint64_t v9 = ClipperLib::Clipper::AddOutPt(a1, a3, a4);
    *(_DWORD *)(v6 + 100) = *(_DWORD *)(a3 + 100);
    *(_DWORD *)(v6 + 84) = 2;
    *(_DWORD *)(a3 + 84) = 1;
    uint64_t v10 = *(void *)(a3 + 136);
    uint64_t v11 = v6;
    _ZF = v10 == v6;
    uint64_t v6 = a3;
    if (!_ZF) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  uint64_t v9 = ClipperLib::Clipper::AddOutPt(a1, a2, a4);
  *(_DWORD *)(a3 + 100) = *(_DWORD *)(v6 + 100);
  *(_DWORD *)(v6 + 84) = 1;
  *(_DWORD *)(a3 + 84) = 2;
  uint64_t v10 = *(void *)(v6 + 136);
  uint64_t v11 = a3;
  if (v10 == a3) {
LABEL_4:
  }
    uint64_t v10 = *(void *)(v11 + 136);
LABEL_5:
  if (v10 && (*(_DWORD *)(v10 + 100) & 0x80000000) == 0)
  {
    uint64_t v12 = a4[1];
    if (*(void *)(v10 + 56) == v12)
    {
      uint64_t v13 = *(void *)(v10 + 48);
    }
    else
    {
      double v14 = *(double *)(v10 + 72) * (double)(v12 - *(void *)(v10 + 8));
      double v15 = 0.5;
      if (v14 < 0.0) {
        double v15 = -0.5;
      }
      uint64_t v13 = *(void *)v10 + (uint64_t)(v14 + v15);
    }
    if (*(void *)(v6 + 56) == v12)
    {
      uint64_t v16 = *(void *)(v6 + 48);
    }
    else
    {
      double v17 = *(double *)(v6 + 72) * (double)(v12 - *(void *)(v6 + 8));
      double v18 = 0.5;
      if (v17 < 0.0) {
        double v18 = -0.5;
      }
      uint64_t v16 = *(void *)v6 + (uint64_t)(v17 + v18);
    }
    if (v13 == v16)
    {
      if (*(_DWORD *)(v6 + 88))
      {
        if (*(_DWORD *)(v10 + 88))
        {
          v30[0] = v13;
          v30[1] = v12;
          __asm { FMOV            V0.2S, #-1.0 }
          v30[2] = _D0;
          long long v28 = *(_OWORD *)(v10 + 48);
          uint64_t v29 = *(void *)(v10 + 64);
          v27[0] = v13;
          v27[1] = v12;
          v27[2] = _D0;
          long long v25 = *(_OWORD *)(v6 + 48);
          uint64_t v26 = *(void *)(v6 + 64);
          if (ClipperLib::SlopesEqual(v30, &v28, v27, &v25, *((unsigned __int8 *)a1 + *(void *)(*a1 - 24) + 40)))
          {
            ClipperLib::Clipper::AddOutPt(a1, v10, a4);
            ClipperLib::Clipper::AddJoin();
          }
        }
      }
    }
  }
  return v9;
}

uint64_t ClipperLib::Clipper::AddOutPt(void *a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(unsigned int *)(a2 + 100);
  uint64_t v4 = (ClipperLib::ClipperBase *)((char *)a1 + *(void *)(*a1 - 24));
  if ((v3 & 0x80000000) != 0) {
    ClipperLib::ClipperBase::CreateOutRec(v4);
  }
  uint64_t v5 = *(void *)(*((void *)v4 + 10) + 8 * v3);
  uint64_t v6 = *(void **)(v5 + 24);
  if (*(_DWORD *)(a2 + 84) == 1)
  {
    if (*a3 != v6[1] || a3[1] != v6[2]) {
      goto LABEL_14;
    }
    return *(void *)(v5 + 24);
  }
  else
  {
    uint64_t v8 = v6[5];
    if (*a3 != *(void *)(v8 + 8) || a3[1] != *(void *)(v8 + 16)) {
LABEL_14:
    }
      operator new();
  }
  return v8;
}

void ClipperLib::Clipper::AddJoin()
{
}

uint64_t ClipperLib::Clipper::AddLocalMaxPoly(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t result = ClipperLib::Clipper::AddOutPt(a1, a2, a4);
  if (!*(_DWORD *)(a3 + 88)) {
    uint64_t result = ClipperLib::Clipper::AddOutPt(a1, a3, a4);
  }
  int v9 = *(_DWORD *)(a2 + 100);
  int v10 = *(_DWORD *)(a3 + 100);
  if (v9 == v10)
  {
    *(_DWORD *)(a2 + 100) = -1;
    *(_DWORD *)(a3 + 100) = -1;
  }
  else
  {
    if (v9 < v10)
    {
      uint64_t v11 = a2;
      uint64_t v12 = a3;
    }
    else
    {
      uint64_t v11 = a3;
      uint64_t v12 = a2;
    }
    return ClipperLib::Clipper::AppendPolygon(a1, v11, v12);
  }
  return result;
}

uint64_t ClipperLib::Clipper::AppendPolygon(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)((char *)a1 + *(void *)(*a1 - 24) + 80);
  uint64_t v7 = *(void *)(v6 + 8 * *(int *)(a2 + 100));
  uint64_t v8 = *(void *)(v6 + 8 * *(int *)(a3 + 100));
  uint64_t v9 = v7;
  do
    uint64_t v9 = *(void *)(v9 + 8);
  while (v9 != v8 && v9 != 0);
  uint64_t result = v8;
  if (v9 != v8)
  {
    uint64_t v12 = v8;
    do
      uint64_t v12 = *(void *)(v12 + 8);
    while (v12 != v7 && v12 != 0);
    uint64_t result = v7;
    if (v12 != v7) {
      uint64_t result = ClipperLib::GetLowermostRec(v7, v8);
    }
  }
  uint64_t v14 = *(void *)(v7 + 24);
  uint64_t v15 = *(void *)(v14 + 40);
  uint64_t v16 = *(void *)(v8 + 24);
  uint64_t v17 = *(void *)(v16 + 40);
  int v18 = *(_DWORD *)(a2 + 84);
  int v19 = *(_DWORD *)(a3 + 84);
  if (v18 == 1)
  {
    if (v19 == 1)
    {
      uint64_t v20 = *(int8x16_t **)(v8 + 24);
      do
      {
        int8x16_t v21 = v20[2];
        v20[2] = vextq_s8(v21, v21, 8uLL);
        uint64_t v20 = (int8x16_t *)v21.i64[0];
      }
      while (v21.i64[0] != v16);
      *(void *)(v16 + 32) = v14;
      *(void *)(v14 + 40) = v16;
      *(void *)(v15 + 32) = v17;
      *(void *)(v17 + 40) = v15;
      *(void *)(v7 + 24) = v17;
    }
    else
    {
      *(void *)(v17 + 32) = v14;
      *(void *)(v14 + 40) = v17;
      *(void *)(v16 + 40) = v15;
      *(void *)(v15 + 32) = v16;
      *(void *)(v7 + 24) = v16;
    }
  }
  else if (v19 == 2)
  {
    uint64_t v22 = *(int8x16_t **)(v8 + 24);
    do
    {
      int8x16_t v23 = v22[2];
      v22[2] = vextq_s8(v23, v23, 8uLL);
      uint64_t v22 = (int8x16_t *)v23.i64[0];
    }
    while (v23.i64[0] != v16);
    *(void *)(v15 + 32) = v17;
    *(void *)(v17 + 40) = v15;
    *(void *)(v16 + 32) = v14;
    *(void *)(v14 + 40) = v16;
  }
  else
  {
    *(void *)(v15 + 32) = v16;
    *(void *)(v16 + 40) = v15;
    *(void *)(v14 + 40) = v17;
    *(void *)(v17 + 32) = v14;
  }
  *(void *)(v7 + 32) = 0;
  if (result == v8)
  {
    uint64_t v24 = *(void *)(v8 + 8);
    if (v24 != v7) {
      *(void *)(v7 + 8) = v24;
    }
    *(unsigned char *)(v7 + 4) = *(unsigned char *)(v8 + 4);
  }
  *(void *)(v8 + 24) = 0;
  *(void *)(v8 + 32) = 0;
  *(void *)(v8 + 8) = v7;
  int v25 = *(_DWORD *)(a2 + 100);
  int v26 = *(_DWORD *)(a3 + 100);
  *(_DWORD *)(a2 + 100) = -1;
  *(_DWORD *)(a3 + 100) = -1;
  uint64_t v27 = *(void *)((char *)a1 + *(void *)(*a1 - 24) + 104);
  if (v27)
  {
    while (*(_DWORD *)(v27 + 100) != v26)
    {
      uint64_t v27 = *(void *)(v27 + 128);
      if (!v27) {
        goto LABEL_36;
      }
    }
    *(_DWORD *)(v27 + 100) = v25;
    *(_DWORD *)(v27 + 84) = v18;
  }
LABEL_36:
  *(_DWORD *)uint64_t v8 = *(_DWORD *)v7;
  return result;
}

uint64_t ClipperLib::Clipper::AddEdgeToSEL(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 112);
  *(void *)(a2 + 152) = 0;
  if (v2) {
    *(void *)(v2 + 152) = a2;
  }
  *(void *)(result + 112) = a2;
  *(void *)(a2 + 144) = v2;
  return result;
}

BOOL ClipperLib::Clipper::PopEdgeFromSEL(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)(a1 + 112);
  uint64_t v2 = (void *)(a1 + 112);
  uint64_t v3 = v4;
  if (v4)
  {
    *a2 = v3;
    uint64_t v6 = *(void *)(*v2 + 144);
    uint64_t v7 = *(void *)(*v2 + 152);
    uint64_t v5 = *v2 + 144;
    if (*(_OWORD *)v5 == 0)
    {
      *uint64_t v2 = 0;
    }
    else
    {
      uint64_t v8 = (void *)(v7 + 144);
      if (!v7) {
        uint64_t v8 = v2;
      }
      *uint64_t v8 = v6;
      if (v6) {
        *(void *)(v6 + 152) = v7;
      }
    }
    *(void *)uint64_t v5 = 0;
    *(void *)(v5 + 8) = 0;
  }
  return v3 != 0;
}

uint64_t ClipperLib::Clipper::DeleteFromSEL(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 144);
  uint64_t v3 = *(void *)(a2 + 152);
  if (*(_OWORD *)(a2 + 144) == 0)
  {
    if (*(void *)(result + 112) != a2) {
      return result;
    }
    goto LABEL_5;
  }
  if (!v3)
  {
LABEL_5:
    uint64_t v4 = (void *)(result + 112);
    goto LABEL_6;
  }
  uint64_t v4 = (void *)(v3 + 144);
LABEL_6:
  void *v4 = v2;
  if (v2) {
    *(void *)(v2 + 152) = v3;
  }
  *(void *)(a2 + 144) = 0;
  *(void *)(a2 + 152) = 0;
  return result;
}

__n128 ClipperLib::Clipper::CopyAELToSEL(ClipperLib::Clipper *this)
{
  uint64_t v1 = *(__n128 **)((char *)this + *(void *)(*(void *)this - 24) + 104);
  *((void *)this + 14) = v1;
  if (v1)
  {
    do
    {
      __n128 result = v1[8];
      v1[9] = result;
      uint64_t v1 = (__n128 *)result.n128_u64[0];
    }
    while (result.n128_u64[0]);
  }
  return result;
}

void ClipperLib::Clipper::AddGhostJoin()
{
}

uint64_t *ClipperLib::Clipper::InsertEdgeIntoAEL(uint64_t *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *result;
  if (!*(uint64_t *)((char *)result + *(void *)(*result - 24) + 104))
  {
    *(void *)(a2 + 128) = 0;
    *(void *)(a2 + 136) = 0;
LABEL_43:
    uint64_t v16 = (uint64_t *)((char *)result + *(void *)(v3 - 24) + 104);
    goto LABEL_44;
  }
  if (!a3)
  {
    a3 = *(uint64_t *)((char *)result + *(void *)(*result - 24) + 104);
    uint64_t v18 = *(void *)(a2 + 24);
    uint64_t v19 = *(void *)(a3 + 24);
    BOOL v20 = v18 < v19;
    if (v18 == v19)
    {
      uint64_t v21 = *(void *)(a2 + 56);
      uint64_t v22 = *(void *)(a3 + 56);
      if (v21 <= v22)
      {
        if (v21 == v22)
        {
          uint64_t v25 = *(void *)(a2 + 48);
        }
        else
        {
          double v26 = *(double *)(a2 + 72) * (double)(v22 - *(void *)(a2 + 8));
          double v27 = 0.5;
          if (v26 < 0.0) {
            double v27 = -0.5;
          }
          uint64_t v25 = *(void *)a2 + (uint64_t)(v26 + v27);
        }
        if (*(void *)(a3 + 48) <= v25) {
          goto LABEL_3;
        }
LABEL_42:
        *(void *)(a2 + 136) = 0;
        *(void *)(a2 + 128) = *(uint64_t *)((char *)result + *(void *)(v3 - 24) + 104);
        *(void *)(*(uint64_t *)((char *)result + *(void *)(v3 - 24) + 104) + 136) = a2;
        goto LABEL_43;
      }
      double v23 = *(double *)(a3 + 72) * (double)(v21 - *(void *)(a3 + 8));
      double v24 = 0.5;
      if (v23 < 0.0) {
        double v24 = -0.5;
      }
      BOOL v20 = *(void *)(a2 + 48) < *(void *)a3 + (uint64_t)(v23 + v24);
    }
    if (!v20) {
      goto LABEL_3;
    }
    goto LABEL_42;
  }
LABEL_3:
  uint64_t v4 = *(void *)(a3 + 128);
  if (v4)
  {
    uint64_t v5 = *(void *)(a2 + 24);
    uint64_t v6 = a3;
    while (1)
    {
      a3 = v6;
      uint64_t v6 = v4;
      uint64_t v7 = *(void *)(v4 + 24);
      BOOL v8 = v5 < v7;
      if (v5 == v7)
      {
        uint64_t v9 = *(void *)(a2 + 56);
        uint64_t v10 = *(void *)(v6 + 56);
        if (v9 <= v10)
        {
          if (v9 == v10)
          {
            uint64_t v13 = *(void *)(a2 + 48);
          }
          else
          {
            double v14 = *(double *)(a2 + 72) * (double)(v10 - *(void *)(a2 + 8));
            if (v14 >= 0.0) {
              double v15 = 0.5;
            }
            else {
              double v15 = -0.5;
            }
            uint64_t v13 = *(void *)a2 + (uint64_t)(v14 + v15);
          }
          if (*(void *)(v6 + 48) > v13) {
            goto LABEL_24;
          }
          goto LABEL_21;
        }
        double v11 = *(double *)(v6 + 72) * (double)(v9 - *(void *)(v6 + 8));
        if (v11 >= 0.0) {
          double v12 = 0.5;
        }
        else {
          double v12 = -0.5;
        }
        BOOL v8 = *(void *)(a2 + 48) < *(void *)v6 + (uint64_t)(v11 + v12);
      }
      if (v8) {
        goto LABEL_24;
      }
LABEL_21:
      uint64_t v4 = *(void *)(v6 + 128);
      if (!v4)
      {
        a3 = v6;
        break;
      }
    }
  }
  uint64_t v6 = 0;
LABEL_24:
  *(void *)(a2 + 128) = v6;
  uint64_t v16 = (void *)(a3 + 128);
  uint64_t v17 = *(void *)(a3 + 128);
  if (v17) {
    *(void *)(v17 + 136) = a2;
  }
  *(void *)(a2 + 136) = a3;
LABEL_44:
  void *v16 = a2;
  return result;
}

uint64_t ClipperLib::Clipper::IntersectEdges(uint64_t result, _DWORD *a2, _DWORD *a3, void *a4)
{
  uint64_t v7 = result;
  int v8 = a2[25];
  int v9 = a3[25];
  uint64_t v10 = *(uint64_t (**)(_DWORD *, _DWORD *, _DWORD *, _DWORD *, void *))(result + 136);
  if (v10) {
    __n128 result = v10(a2, a2 + 12, a3, a3 + 12, a4);
  }
  int v11 = a2[22];
  int v12 = a3[22];
  if (!v11)
  {
    if (!v12) {
      return result;
    }
    if (a2[20] == a3[20])
    {
      if (*(_DWORD *)(v7 + 80) != 1 || v9 < 0) {
        return result;
      }
    }
    else
    {
      int v25 = a3[23];
      if (v25 < 0) {
        int v25 = -v25;
      }
      if (v25 != 1 || *(_DWORD *)(v7 + 80) == 1 && a3[24]) {
        return result;
      }
    }
    __n128 result = ClipperLib::Clipper::AddOutPt((void *)v7, (uint64_t)a2, a4);
    if ((v8 & 0x80000000) == 0) {
      a2[25] = -1;
    }
    return result;
  }
  int v13 = a2[20];
  int v14 = a3[20];
  if (!v12)
  {
    if (v13 == v14)
    {
      if (*(_DWORD *)(v7 + 80) != 1 || v8 < 0) {
        return result;
      }
    }
    else
    {
      int v26 = a2[23];
      if (v26 < 0) {
        int v26 = -v26;
      }
      if (v26 != 1 || *(_DWORD *)(v7 + 80) == 1 && a2[24]) {
        return result;
      }
    }
    __n128 result = ClipperLib::Clipper::AddOutPt((void *)v7, (uint64_t)a3, a4);
    if (v9 < 0) {
      return result;
    }
    int v27 = -1;
    goto LABEL_92;
  }
  if (v13 == v14)
  {
    if (v13) {
      double v15 = (int *)(v7 + 124);
    }
    else {
      double v15 = (int *)(v7 + 128);
    }
    int v16 = a2[23];
    if (*v15)
    {
      int v17 = v16 + v12;
      if (!v17) {
        int v17 = -v16;
      }
      a2[23] = v17;
      int v18 = a3[23] - v11;
      if (v18) {
        a3[23] = v18;
      }
      else {
        a3[23] = -v11;
      }
    }
    else
    {
      a2[23] = a3[23];
      a3[23] = v16;
    }
  }
  else
  {
    if (v14) {
      uint64_t v19 = (_DWORD *)(v7 + 124);
    }
    else {
      uint64_t v19 = (_DWORD *)(v7 + 128);
    }
    int v20 = a2[24];
    int v21 = v20 + v12;
    if (*v19) {
      BOOL v22 = v21;
    }
    else {
      BOOL v22 = v20 == 0;
    }
    a2[24] = v22;
    if (v13) {
      double v15 = (int *)(v7 + 124);
    }
    else {
      double v15 = (int *)(v7 + 128);
    }
    int v23 = a3[24];
    if (*v15) {
      int v24 = v23 - v11;
    }
    else {
      int v24 = v23 == 0;
    }
    a3[24] = v24;
  }
  if (v13) {
    long long v28 = (int *)(v7 + 128);
  }
  else {
    long long v28 = (int *)(v7 + 124);
  }
  int v29 = *v15;
  if (v14) {
    long long v30 = (int *)(v7 + 124);
  }
  else {
    long long v30 = (int *)(v7 + 128);
  }
  if (v14) {
    uint64_t v31 = (int *)(v7 + 128);
  }
  else {
    uint64_t v31 = (int *)(v7 + 124);
  }
  int v32 = *v30;
  if (v29 == 3)
  {
    unint64_t v33 = -(uint64_t)(int)a2[23];
  }
  else if (v29 == 2)
  {
    unint64_t v33 = (int)a2[23];
  }
  else
  {
    LODWORD(v33) = a2[23];
    if ((v33 & 0x80000000) == 0) {
      unint64_t v33 = v33;
    }
    else {
      unint64_t v33 = -(int)v33;
    }
  }
  if (v32 == 3)
  {
    unint64_t v34 = -(uint64_t)(int)a3[23];
  }
  else if (v32 == 2)
  {
    unint64_t v34 = (int)a3[23];
  }
  else
  {
    LODWORD(v34) = a3[23];
    if ((v34 & 0x80000000) == 0) {
      unint64_t v34 = v34;
    }
    else {
      unint64_t v34 = -(int)v34;
    }
  }
  int v35 = *v28;
  int v36 = *v31;
  if (v8 < 0 || v9 < 0)
  {
    if ((v8 & 0x80000000) == 0)
    {
      if (v34 > 1) {
        return result;
      }
      long long v37 = (void *)v7;
      uint64_t v38 = (uint64_t)a2;
      goto LABEL_91;
    }
    if ((v9 & 0x80000000) == 0)
    {
      if (v33 > 1) {
        return result;
      }
      goto LABEL_90;
    }
    if (v33 <= 1 && v34 <= 1)
    {
      if (v35 == 3)
      {
        uint64_t v40 = -(uint64_t)(int)a2[24];
      }
      else if (v35 == 2)
      {
        uint64_t v40 = (int)a2[24];
      }
      else
      {
        LODWORD(v40) = a2[24];
        if ((int)v40 >= 0) {
          uint64_t v40 = v40;
        }
        else {
          uint64_t v40 = -(int)v40;
        }
      }
      if (v36 == 3)
      {
        uint64_t v41 = -(uint64_t)(int)a3[24];
      }
      else if (v36 == 2)
      {
        uint64_t v41 = (int)a3[24];
      }
      else
      {
        LODWORD(v41) = a3[24];
        if ((int)v41 >= 0) {
          uint64_t v41 = v41;
        }
        else {
          uint64_t v41 = -(int)v41;
        }
      }
      if (v13 == v14)
      {
        if (v33 == 1 && v34 == 1)
        {
          switch(*(_DWORD *)(v7 + 80))
          {
            case 0:
              if (v40 >= 1 && v41 >= 1) {
                goto LABEL_124;
              }
              return result;
            case 1:
              goto LABEL_122;
            case 2:
              if (v13 == 1 && v40 >= 1 && v41 > 0) {
                goto LABEL_124;
              }
              if (v13) {
                return result;
              }
LABEL_122:
              if (v40 <= 0 && v41 <= 0) {
                goto LABEL_124;
              }
              return result;
            case 3:
              goto LABEL_124;
            default:
              return result;
          }
        }
        int v42 = a2[21];
        a2[21] = a3[21];
        a3[21] = v42;
      }
      else
      {
LABEL_124:
        return ClipperLib::Clipper::AddLocalMinPoly((void *)v7, (uint64_t)a2, (uint64_t)a3, a4);
      }
    }
  }
  else
  {
    if (v33 <= 1 && v34 <= 1 && (v13 == v14 || *(_DWORD *)(v7 + 80) == 3))
    {
      ClipperLib::Clipper::AddOutPt((void *)v7, (uint64_t)a2, a4);
LABEL_90:
      long long v37 = (void *)v7;
      uint64_t v38 = (uint64_t)a3;
LABEL_91:
      __n128 result = ClipperLib::Clipper::AddOutPt(v37, v38, a4);
      int v39 = a2[21];
      a2[21] = a3[21];
      a3[21] = v39;
      int v27 = a2[25];
      a2[25] = a3[25];
LABEL_92:
      a3[25] = v27;
      return result;
    }
    return ClipperLib::Clipper::AddLocalMaxPoly((void *)v7, (uint64_t)a2, (uint64_t)a3, a4);
  }
  return result;
}

uint64_t ClipperLib::Clipper::SetZ(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(result + 136);
  if (v4) {
    return v4(a3, a3 + 48, a4, a4 + 48, a2);
  }
  return result;
}

void *ClipperLib::Clipper::SetHoleState(void *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a2 + 136);
  if (v3)
  {
    uint64_t v4 = 0;
    do
    {
      uint64_t v5 = v4;
      int v6 = *(_DWORD *)(v3 + 100);
      if ((v6 & 0x80000000) == 0)
      {
        if (*(_DWORD *)(v3 + 88))
        {
          uint64_t v4 = v3;
          if (v5)
          {
            if (*(_DWORD *)(v5 + 100) == v6) {
              uint64_t v4 = 0;
            }
            else {
              uint64_t v4 = v5;
            }
          }
        }
      }
      uint64_t v3 = *(void *)(v3 + 136);
    }
    while (v3);
    if (v4)
    {
      uint64_t v3 = *(void *)(*(void *)((char *)result + *(void *)(*result - 24) + 80) + 8 * *(int *)(v4 + 100));
      LOBYTE(v4) = *(unsigned char *)(v3 + 4) ^ 1;
    }
    else
    {
      uint64_t v3 = 0;
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  *(void *)(a3 + 8) = v3;
  *(unsigned char *)(a3 + 4) = v4;
  return result;
}

uint64_t ClipperLib::GetLowermostRec(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a1;
  BottomPt = *(void **)(a1 + 32);
  if (!BottomPt)
  {
    BottomPt = (void *)ClipperLib::GetBottomPt(*(void **)(v3 + 24));
    *(void *)(v3 + 32) = BottomPt;
  }
  uint64_t v5 = *(void **)(a2 + 32);
  if (!v5)
  {
    uint64_t v5 = (void *)ClipperLib::GetBottomPt(*(void **)(a2 + 24));
    *(void *)(a2 + 32) = v5;
    BottomPt = *(void **)(v3 + 32);
  }
  uint64_t v6 = BottomPt[2];
  uint64_t v7 = v5[2];
  if (v6 <= v7)
  {
    if (v6 < v7) {
      return a2;
    }
    uint64_t v8 = BottomPt[1];
    uint64_t v9 = v5[1];
    if (v8 < v9) {
      return v3;
    }
    if (v8 > v9 || (void *)BottomPt[4] == BottomPt)
    {
      return a2;
    }
    else if ((void *)v5[4] != v5 && !ClipperLib::FirstIsBottomPt((uint64_t)BottomPt, v5))
    {
      return a2;
    }
  }
  return v3;
}

BOOL ClipperLib::OutRec1RightOfOutRec2(uint64_t a1, uint64_t a2)
{
  do
    a1 = *(void *)(a1 + 8);
  while (a1 != a2 && a1 != 0);
  return a1 == a2;
}

int *ClipperLib::Clipper::GetOutRec(ClipperLib::Clipper *this, int a2)
{
  uint64_t v2 = *(void *)((char *)this + *(void *)(*(void *)this - 24) + 80);
  uint64_t v3 = *(int **)(v2 + 8 * a2);
  do
  {
    __n128 result = v3;
    uint64_t v3 = *(int **)(v2 + 8 * *v3);
  }
  while (result != v3);
  return result;
}

uint64_t ClipperLib::Clipper::GetLastOutPt(void *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(*(void *)((char *)a1 + *(void *)(*a1 - 24) + 80) + 8 * *(int *)(a2 + 100)) + 24;
  if (*(_DWORD *)(a2 + 84) != 1) {
    uint64_t v2 = *(void *)v2 + 40;
  }
  return *(void *)v2;
}

void ClipperLib::Clipper::ProcessHorizontal(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = a2;
  v86[0] = a2;
  int v4 = *((_DWORD *)a2 + 22);
  uint64_t v5 = *a2;
  uint64_t v6 = a2[6];
  BOOL v7 = *a2 < v6;
  if (*a2 >= v6) {
    uint64_t v8 = a2[6];
  }
  else {
    uint64_t v8 = *a2;
  }
  if (*a2 < v6) {
    uint64_t v9 = a2[6];
  }
  else {
    uint64_t v9 = *a2;
  }
  uint64_t v79 = v9;
  uint64_t v80 = v8;
  uint64_t v10 = a2;
  while (1)
  {
    int v11 = v10;
    uint64_t v10 = (uint64_t *)v10[15];
    if (!v10) {
      break;
    }
    if (*((double *)v10 + 9) != -1.0e40)
    {
      MaximaPair = 0;
      goto LABEL_12;
    }
  }
  MaximaPair = ClipperLib::GetMaximaPair(v11);
LABEL_12:
  int v13 = a1 + 11;
  uint64_t v78 = (uint64_t)MaximaPair;
  if (a1[13])
  {
    int v14 = (void *)a1[12];
    if (v5 < v6)
    {
      while (1)
      {
        if (v14 == v13)
        {
          int v14 = 0;
          int v16 = a1 + 11;
          goto LABEL_30;
        }
        uint64_t v15 = v14[2];
        if (v15 > v5) {
          break;
        }
        int v14 = (void *)v14[1];
      }
      if (v15 >= v11[6]) {
        int v16 = a1 + 11;
      }
      else {
        int v16 = v14;
      }
      int v14 = 0;
      goto LABEL_30;
    }
    int v17 = a1 + 11;
    while (v17 != v14)
    {
      int v18 = v17;
      int v17 = (void *)*v17;
      uint64_t v19 = v17[2];
      if (v19 <= v5)
      {
        int v16 = 0;
        if (v19 > v11[6]) {
          int v14 = v18;
        }
        goto LABEL_30;
      }
    }
  }
  else
  {
    int v14 = 0;
  }
  int v16 = 0;
LABEL_30:
  uint64_t v81 = (uint64_t)v11;
  __asm { FMOV            V9.2S, #-1.0 }
  while (1)
  {
    v77 = v2 + 16;
    uint64_t v25 = 17;
    if (v7) {
      uint64_t v25 = 16;
    }
    uint64_t v26 = v2[v25];
    if (v26)
    {
      v82 = v2 + 6;
      do
      {
        if (a1[13])
        {
          if (v7)
          {
            if (v16 == v13)
            {
              int v16 = a1 + 11;
              goto LABEL_55;
            }
            while (v16[2] < *(void *)(v26 + 24))
            {
              if ((*((_DWORD *)v2 + 25) & 0x80000000) == 0 && v4)
              {
                uint64_t v27 = v2[1];
                uint64_t v83 = v16[2];
                uint64_t v84 = v27;
                uint64_t v85 = _D9;
                ClipperLib::Clipper::AddOutPt(a1, (uint64_t)v2, &v83);
              }
              int v16 = (void *)v16[1];
              if (v16 == v13)
              {
                int v16 = a1 + 11;
                break;
              }
            }
          }
          else
          {
            long long v28 = (void *)a1[12];
            if (v14 == v28) {
              goto LABEL_52;
            }
            while (1)
            {
              int v29 = (void *)*v14;
              if (*(void *)(*v14 + 16) <= *(void *)(v26 + 24)) {
                break;
              }
              if ((*((_DWORD *)v2 + 25) & 0x80000000) == 0 && v4)
              {
                uint64_t v30 = v2[1];
                uint64_t v83 = *(void *)(*v14 + 16);
                uint64_t v84 = v30;
                uint64_t v85 = _D9;
                ClipperLib::Clipper::AddOutPt(a1, (uint64_t)v2, &v83);
                int v29 = (void *)*v14;
                long long v28 = (void *)a1[12];
              }
              int v14 = v29;
              if (v29 == v28)
              {
                int v14 = v28;
                break;
              }
            }
          }
        }
        if (!v7)
        {
LABEL_52:
          uint64_t v31 = *(void *)(v26 + 24);
          if (v31 < v80) {
            break;
          }
          goto LABEL_56;
        }
LABEL_55:
        uint64_t v31 = *(void *)(v26 + 24);
        if (v31 > v79) {
          break;
        }
LABEL_56:
        if (v31 == *v82)
        {
          uint64_t v32 = v2[15];
          if (v32)
          {
            if (*(double *)(v26 + 72) < *(double *)(v32 + 72)) {
              break;
            }
          }
        }
        if ((*((_DWORD *)v2 + 25) & 0x80000000) == 0 && v4)
        {
          ClipperLib::Clipper::AddOutPt(a1, (uint64_t)v2, (void *)(v26 + 24));
          for (char i = (uint64_t *)a1[14]; i; char i = (uint64_t *)i[18])
          {
            if ((*((_DWORD *)i + 25) & 0x80000000) == 0)
            {
              uint64_t v34 = *v2;
              uint64_t v35 = v2[6];
              uint64_t v36 = *i;
              uint64_t v37 = i[6];
              if (*v2 >= v35) {
                uint64_t v38 = v2[6];
              }
              else {
                uint64_t v38 = *v2;
              }
              if (*v2 <= v35) {
                uint64_t v34 = v2[6];
              }
              if (v36 >= v37) {
                uint64_t v39 = i[6];
              }
              else {
                uint64_t v39 = *i;
              }
              if (v36 <= v37) {
                uint64_t v36 = i[6];
              }
              if (v38 < v36 && v39 < v34) {
                ClipperLib::Clipper::AddJoin();
              }
            }
          }
          ClipperLib::Clipper::AddGhostJoin();
        }
        if (v2 == (void *)v81 && v26 == v78)
        {
          if ((*(_DWORD *)(v81 + 100) & 0x80000000) == 0) {
            ClipperLib::Clipper::AddLocalMaxPoly(a1, v81, v78, v82);
          }
          uint64_t v50 = *a1;
          uint64_t v51 = (char *)a1 + *(void *)(*a1 - 24);
          uint64_t v53 = v2[16];
          uint64_t v52 = v2[17];
          if (*((_OWORD *)v2 + 8) == 0)
          {
            if (*((void *)v51 + 13) == v81) {
              goto LABEL_105;
            }
          }
          else
          {
            if (v52)
            {
              long long v54 = (void *)(v52 + 128);
              goto LABEL_106;
            }
LABEL_105:
            long long v54 = v51 + 104;
LABEL_106:
            *long long v54 = v53;
            if (v53) {
              *(void *)(v53 + 136) = v52;
            }
            void *v77 = 0;
            v2[17] = 0;
            uint64_t v50 = *a1;
          }
          uint64_t v55 = (char *)a1 + *(void *)(v50 - 24);
          uint64_t v56 = *(void *)(v78 + 128);
          uint64_t v57 = *(void *)(v78 + 136);
          if (*(_OWORD *)(v78 + 128) == 0)
          {
            if (*((void *)v55 + 13) == v78) {
              goto LABEL_113;
            }
          }
          else
          {
            if (v57)
            {
              long long v58 = (void *)(v57 + 128);
              goto LABEL_114;
            }
LABEL_113:
            long long v58 = v55 + 104;
LABEL_114:
            *long long v58 = v56;
            if (v56) {
              *(void *)(v56 + 136) = v57;
            }
            *(void *)(v78 + 128) = 0;
            *(void *)(v78 + 136) = 0;
          }
          return;
        }
        uint64_t v41 = v2[4];
        uint64_t v83 = *(void *)(v26 + 24);
        uint64_t v84 = v41;
        uint64_t v85 = _D9;
        if (v7)
        {
          int v42 = v2;
          long long v43 = (_DWORD *)v26;
        }
        else
        {
          int v42 = (_DWORD *)v26;
          long long v43 = v2;
        }
        ClipperLib::Clipper::IntersectEdges((uint64_t)a1, v42, v43, &v83);
        uint64_t v44 = 136;
        if (v7) {
          uint64_t v44 = 128;
        }
        uint64_t v45 = *(void *)(v26 + v44);
        ClipperLib::ClipperBase::SwapPositionsInAEL((uint64_t)a1 + *(void *)(*a1 - 24), (uint64_t)v2, v26);
        uint64_t v26 = v45;
      }
      while (v45);
    }
    uint64_t v46 = v2[15];
    if (!v46 || *(double *)(v46 + 72) != -1.0e40) {
      break;
    }
    ClipperLib::ClipperBase::UpdateEdgeIntoAEL((uint64_t)a1 + *(void *)(*a1 - 24), (uint64_t *)v86);
    uint64_t v2 = v86[0];
    if ((*((_DWORD *)v86[0] + 25) & 0x80000000) == 0) {
      ClipperLib::Clipper::AddOutPt(a1, (uint64_t)v86[0], v86[0]);
    }
    uint64_t v47 = *v2;
    uint64_t v48 = v2[6];
    BOOL v7 = *v2 < v48;
    if (*v2 >= v48) {
      uint64_t v49 = v2[6];
    }
    else {
      uint64_t v49 = *v2;
    }
    if (*v2 < v48) {
      uint64_t v47 = v2[6];
    }
    uint64_t v79 = v47;
    uint64_t v80 = v49;
  }
  if ((*((_DWORD *)v2 + 25) & 0x80000000) == 0)
  {
    for (j = (uint64_t *)a1[14]; j; j = (uint64_t *)j[18])
    {
      if ((*((_DWORD *)j + 25) & 0x80000000) == 0)
      {
        uint64_t v60 = *v2;
        uint64_t v61 = v2[6];
        uint64_t v62 = *j;
        uint64_t v63 = j[6];
        if (*v2 >= v61) {
          uint64_t v64 = v2[6];
        }
        else {
          uint64_t v64 = *v2;
        }
        if (*v2 <= v61) {
          uint64_t v60 = v2[6];
        }
        if (v62 >= v63) {
          uint64_t v65 = j[6];
        }
        else {
          uint64_t v65 = *j;
        }
        if (v62 <= v63) {
          uint64_t v62 = j[6];
        }
        if (v64 < v62 && v65 < v60) {
          ClipperLib::Clipper::AddJoin();
        }
      }
    }
    ClipperLib::Clipper::AddGhostJoin();
  }
  int v67 = *((_DWORD *)v2 + 25);
  if (!v46)
  {
    if ((v67 & 0x80000000) == 0) {
      ClipperLib::Clipper::AddOutPt(a1, (uint64_t)v2, v2 + 6);
    }
    v72 = (char *)a1 + *(void *)(*a1 - 24);
    uint64_t v74 = v2[16];
    uint64_t v73 = v2[17];
    if (*((_OWORD *)v2 + 8) == 0)
    {
      if (*((void **)v72 + 13) != v2) {
        return;
      }
    }
    else if (v73)
    {
      v75 = (void *)(v73 + 128);
LABEL_167:
      void *v75 = v74;
      if (v74) {
        *(void *)(v74 + 136) = v73;
      }
      void *v77 = 0;
      v2[17] = 0;
      return;
    }
    v75 = v72 + 104;
    goto LABEL_167;
  }
  if (v67 < 0)
  {
    ClipperLib::ClipperBase::UpdateEdgeIntoAEL((uint64_t)a1 + *(void *)(*a1 - 24), (uint64_t *)v86);
    return;
  }
  ClipperLib::Clipper::AddOutPt(a1, (uint64_t)v2, v2 + 6);
  ClipperLib::ClipperBase::UpdateEdgeIntoAEL((uint64_t)a1 + *(void *)(*a1 - 24), (uint64_t *)v86);
  v68 = v86[0];
  if (*((_DWORD *)v86[0] + 22))
  {
    uint64_t v69 = v86[0][16];
    uint64_t v70 = v86[0][17];
    if (v70
      && *(void *)(v70 + 24) == *v86[0]
      && (uint64_t v71 = *(void *)(v70 + 32), v71 == v86[0][1])
      && *(_DWORD *)(v70 + 88)
      && (*(_DWORD *)(v70 + 100) & 0x80000000) == 0
      && v71 > *(void *)(v70 + 56)
      && ClipperLib::SlopesEqual(v86[0], *((void **)v86[0] + 17), *((unsigned __int8 *)a1 + *(void *)(*a1 - 24) + 40)))
    {
      ClipperLib::Clipper::AddOutPt(a1, v70, v68);
    }
    else
    {
      if (!v69) {
        return;
      }
      if (*(void *)(v69 + 24) != *v68) {
        return;
      }
      uint64_t v76 = *(void *)(v69 + 32);
      if (v76 != v68[1]
        || !*(_DWORD *)(v69 + 88)
        || (*(_DWORD *)(v69 + 100) & 0x80000000) != 0
        || v76 <= *(void *)(v69 + 56)
        || !ClipperLib::SlopesEqual(v68, (void *)v69, *((unsigned __int8 *)a1 + *(void *)(*a1 - 24) + 40)))
      {
        return;
      }
      ClipperLib::Clipper::AddOutPt(a1, v69, v68);
    }
    ClipperLib::Clipper::AddJoin();
  }
}

void *ClipperLib::GetMaximaPair(void *a1)
{
  __n128 result = (void *)a1[13];
  uint64_t v4 = a1[6];
  uint64_t v3 = a1[7];
  BOOL v5 = result[6] == v4 && result[7] == v3;
  if (!v5 || result[15])
  {
    __n128 result = (void *)a1[14];
    BOOL v6 = result[6] == v4 && result[7] == v3;
    if (!v6 || result[15]) {
      return 0;
    }
  }
  return result;
}

double ClipperLib::GetMaximaPairEx(void *a1)
{
  MaximaPair = (double *)ClipperLib::GetMaximaPair(a1);
  if (MaximaPair && *((_DWORD *)MaximaPair + 25) != -2 && *((void *)MaximaPair + 16) == *((void *)MaximaPair + 17)) {
    return MaximaPair[9];
  }
  return result;
}

uint64_t ClipperLib::Clipper::SwapPositionsInSEL(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a2 + 144);
  if (!v3 && !*(void *)(a2 + 152)) {
    return result;
  }
  uint64_t v4 = *(void *)(a3 + 144);
  if (!v4)
  {
    BOOL v6 = (void *)(a3 + 152);
    uint64_t v7 = *(void *)(a3 + 152);
    if (!v7) {
      return result;
    }
    if (v3 != a3)
    {
      uint64_t v5 = *(void *)(a2 + 152);
      *(void *)(a2 + 144) = 0;
      *(void *)(a2 + 152) = v7;
LABEL_11:
      *(void *)(v7 + 144) = a2;
      goto LABEL_12;
    }
LABEL_17:
    uint64_t v8 = *(void *)(a2 + 152);
    if (v8) {
      *(void *)(v8 + 144) = a3;
    }
    *(void *)(a3 + 144) = a2;
    *(void *)(a3 + 152) = v8;
    *(void *)(a2 + 144) = v4;
    *(void *)(a2 + 152) = a3;
    goto LABEL_25;
  }
  if (v3 == a3)
  {
    *(void *)(v4 + 152) = a2;
    goto LABEL_17;
  }
  if (v4 == a2)
  {
    if (v3) {
      *(void *)(v3 + 152) = a3;
    }
    uint64_t v9 = *(void *)(a3 + 152);
    if (v9) {
      *(void *)(v9 + 144) = a2;
    }
    *(void *)(a2 + 144) = a3;
    *(void *)(a2 + 152) = v9;
    *(void *)(a3 + 144) = v3;
    *(void *)(a3 + 152) = a2;
    goto LABEL_25;
  }
  uint64_t v5 = *(void *)(a2 + 152);
  *(void *)(v4 + 152) = a2;
  BOOL v6 = (void *)(a3 + 152);
  uint64_t v7 = *(void *)(a3 + 152);
  *(void *)(a2 + 144) = v4;
  *(void *)(a2 + 152) = v7;
  if (v7) {
    goto LABEL_11;
  }
LABEL_12:
  *(void *)(a3 + 144) = v3;
  if (v3) {
    *(void *)(v3 + 152) = a3;
  }
  void *v6 = v5;
  if (v5) {
    *(void *)(v5 + 144) = a3;
  }
LABEL_25:
  if (!*(void *)(a2 + 152) || (a2 = a3, !*(void *)(a3 + 152))) {
    *(void *)(result + 112) = a2;
  }
  return result;
}

uint64_t ClipperLib::GetNextInAEL(uint64_t a1, int a2)
{
  uint64_t v2 = 136;
  if (a2 == 1) {
    uint64_t v2 = 128;
  }
  return *(void *)(a1 + v2);
}

uint64_t *ClipperLib::GetHorzDirection(uint64_t *result, int *a2, void *a3, void *a4)
{
  uint64_t v4 = *result;
  uint64_t v5 = result[6];
  BOOL v6 = *result < v5;
  if (*result >= v5) {
    uint64_t v4 = result[6];
  }
  *a3 = v4;
  if (v6) {
    uint64_t v7 = result + 6;
  }
  else {
    uint64_t v7 = result;
  }
  uint64_t v8 = *v7;
  int v9 = v6;
  *a4 = v8;
  *a2 = v9;
  return result;
}

void *ClipperLib::Clipper::BuildIntersectList(void *this, uint64_t a2)
{
  uint64_t v2 = *(void *)((char *)this + *(void *)(*this - 24) + 104);
  if (v2)
  {
    this[14] = v2;
    do
    {
      long long v4 = *(_OWORD *)(v2 + 128);
      *(_OWORD *)(v2 + 144) = v4;
      if (*(void *)(v2 + 56) == a2)
      {
        uint64_t v5 = *(void *)(v2 + 48);
      }
      else
      {
        double v6 = *(double *)(v2 + 72) * (double)(a2 - *(void *)(v2 + 8));
        if (v6 >= 0.0) {
          double v7 = 0.5;
        }
        else {
          double v7 = -0.5;
        }
        uint64_t v5 = *(void *)v2 + (uint64_t)(v6 + v7);
      }
      *(void *)(v2 + 24) = v5;
      uint64_t v2 = v4;
    }
    while ((void)v4);
    __asm { FMOV            V8.2S, #-1.0 }
    uint64_t v13 = this[14];
    uint64_t v14 = *(void *)(v13 + 144);
    if (v14)
    {
      do
      {
        long long v20 = 0uLL;
        uint64_t v21 = _D8;
        if (*(void *)(v13 + 24) > *(void *)(v14 + 24))
        {
          ClipperLib::IntersectPoint(v13, v14, (uint64_t *)&v20);
          if (*((uint64_t *)&v20 + 1) < a2)
          {
            if (*(void *)(v13 + 56) == a2)
            {
              uint64_t v15 = *(void *)(v13 + 48);
            }
            else
            {
              double v16 = *(double *)(v13 + 72) * (double)(a2 - *(void *)(v13 + 8));
              if (v16 >= 0.0) {
                double v17 = 0.5;
              }
              else {
                double v17 = -0.5;
              }
              uint64_t v15 = *(void *)v13 + (uint64_t)(v16 + v17);
            }
            *(void *)&long long v20 = v15;
            *((void *)&v20 + 1) = a2;
            uint64_t v21 = _D8;
          }
          operator new();
        }
        uint64_t v13 = v14;
        uint64_t v14 = *(void *)(v14 + 144);
      }
      while (v14);
      uint64_t v18 = *(void *)(v13 + 152);
      if (v18) {
        *(void *)(v18 + 144) = 0;
      }
    }
    else
    {
      uint64_t v19 = *(void *)(v13 + 152);
      if (v19) {
        *(void *)(v19 + 144) = 0;
      }
    }
    this[14] = 0;
  }
  return this;
}

BOOL ClipperLib::Clipper::FixupIntersectionOrder(ClipperLib::Clipper *this)
{
  uint64_t v2 = *(void *)((char *)this + *(void *)(*(void *)this - 24) + 104);
  *((void *)this + 14) = v2;
  if (v2)
  {
    do
    {
      long long v3 = *(_OWORD *)(v2 + 128);
      *(_OWORD *)(v2 + 144) = v3;
      uint64_t v2 = v3;
    }
    while ((void)v3);
  }
  uint64_t v4 = *((void *)this + 7);
  uint64_t v5 = (char *)*((void *)this + 8);
  unint64_t v6 = 126 - 2 * __clz((uint64_t)&v5[-v4] >> 3);
  uint64_t v27 = ClipperLib::IntersectListSort;
  if (v5 == (char *)v4) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = v6;
  }
  BOOL v8 = 1;
  std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **,false>(v4, v5, (uint64_t (**)(uint64_t, uint64_t))&v27, v7, 1);
  uint64_t v9 = *((void *)this + 8) - *((void *)this + 7);
  if (v9)
  {
    BOOL v8 = 0;
    unint64_t v10 = 0;
    unint64_t v11 = v9 >> 3;
    if ((unint64_t)(v9 >> 3) <= 1) {
      uint64_t v12 = 1;
    }
    else {
      uint64_t v12 = v9 >> 3;
    }
    unint64_t v13 = 1;
    do
    {
      if (v11 <= v13) {
        unint64_t v14 = v13;
      }
      else {
        unint64_t v14 = v11;
      }
      uint64_t v15 = *((void *)this + 7);
      double v16 = *(uint64_t **)(v15 + 8 * v10);
      uint64_t v17 = *v16;
      uint64_t v18 = v16[1];
      uint64_t v19 = *(void *)(*v16 + 144);
      if (v19 != v18)
      {
        if (*(void *)(v17 + 152) == v18)
        {
          uint64_t v19 = v16[1];
        }
        else
        {
          unint64_t v20 = v13;
          unint64_t v21 = v10;
          while (1)
          {
            if (v20 >= v11)
            {
              unint64_t v21 = v14;
              goto LABEL_24;
            }
            BOOL v22 = *(uint64_t **)(v15 + 8 * v20);
            uint64_t v24 = *v22;
            uint64_t v23 = v22[1];
            if (*(void *)(v24 + 144) == v23) {
              break;
            }
            ++v20;
            ++v21;
            if (*(void *)(v24 + 152) == v23) {
              goto LABEL_24;
            }
          }
          unint64_t v21 = v20;
LABEL_24:
          if (v21 == v11) {
            return v8;
          }
          *(void *)(v15 + 8 * v10) = *(void *)(v15 + 8 * v21);
          *(void *)(v15 + 8 * v21) = v16;
          uint64_t v25 = *(uint64_t **)(*((void *)this + 7) + 8 * v10);
          uint64_t v17 = *v25;
          uint64_t v19 = v25[1];
        }
      }
      ClipperLib::Clipper::SwapPositionsInSEL((uint64_t)this, v17, v19);
      BOOL v8 = ++v10 >= v11;
      ++v13;
    }
    while (v10 != v12);
  }
  return v8;
}

void *ClipperLib::Clipper::ProcessIntersectList(void *this)
{
  uint64_t v1 = this;
  uint64_t v2 = this[8];
  if (v2 != this[7])
  {
    unint64_t v3 = 0;
    uint64_t v2 = this[7];
    do
    {
      uint64_t v4 = *(uint64_t **)(v2 + 8 * v3);
      ClipperLib::Clipper::IntersectEdges((uint64_t)v1, (_DWORD *)*v4, (_DWORD *)v4[1], v4 + 2);
      ClipperLib::ClipperBase::SwapPositionsInAEL((uint64_t)v1 + *(void *)(*v1 - 24), *v4, v4[1]);
      this = (void *)MEMORY[0x1E018DFE0](v4, 0x1020C40E349F4B1);
      ++v3;
      uint64_t v2 = v1[7];
    }
    while (v3 < (v1[8] - v2) >> 3);
  }
  v1[8] = v2;
  return this;
}

uint64_t ClipperLib::Clipper::DisposeIntersectNodes(uint64_t this)
{
  uint64_t v1 = this;
  uint64_t v3 = *(void *)(this + 56);
  uint64_t v2 = *(void *)(this + 64);
  if (v2 == v3)
  {
    uint64_t v3 = *(void *)(this + 64);
  }
  else
  {
    unint64_t v4 = 0;
    do
    {
      this = *(void *)(v3 + 8 * v4);
      if (this)
      {
        this = MEMORY[0x1E018DFE0](this, 0x1020C40E349F4B1);
        uint64_t v3 = *(void *)(v1 + 56);
        uint64_t v2 = *(void *)(v1 + 64);
      }
      ++v4;
    }
    while (v4 < (v2 - v3) >> 3);
  }
  *(void *)(v1 + 64) = v3;
  return this;
}

BOOL ClipperLib::IntersectListSort(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 24) < *(void *)(a1 + 24);
}

void ClipperLib::Clipper::DoMaxima(uint64_t *a1, uint64_t a2)
{
  ClipperLib::GetMaximaPairEx((void *)a2);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v7 = (void *)(a2 + 128);
    uint64_t v6 = *(void *)(a2 + 128);
    BOOL v8 = v6 != 0;
    if (v6) {
      BOOL v9 = v6 == v4;
    }
    else {
      BOOL v9 = 1;
    }
    if (!v9)
    {
      do
      {
        ClipperLib::Clipper::IntersectEdges((uint64_t)a1, (_DWORD *)a2, (_DWORD *)v6, (void *)(a2 + 48));
        ClipperLib::ClipperBase::SwapPositionsInAEL((uint64_t)a1 + *(void *)(*a1 - 24), a2, v6);
        uint64_t v6 = *(void *)(a2 + 128);
        BOOL v8 = v6 != 0;
        if (v6) {
          BOOL v10 = v6 == v5;
        }
        else {
          BOOL v10 = 1;
        }
      }
      while (!v10);
    }
    int v11 = *(_DWORD *)(a2 + 100);
    if (v11 != -1)
    {
      if ((v11 & 0x80000000) == 0)
      {
        if ((*(_DWORD *)(v5 + 100) & 0x80000000) == 0)
        {
          ClipperLib::Clipper::AddLocalMaxPoly(a1, a2, v5, (void *)(a2 + 48));
          uint64_t v12 = *a1;
          unint64_t v13 = (char *)a1 + *(void *)(*a1 - 24);
          uint64_t v15 = *(void *)(a2 + 128);
          uint64_t v14 = *(void *)(a2 + 136);
          if (*(_OWORD *)(a2 + 128) != 0)
          {
            if (v14)
            {
              double v16 = (void *)(v14 + 128);
              goto LABEL_46;
            }
LABEL_45:
            double v16 = v13 + 104;
LABEL_46:
            void *v16 = v15;
            if (v15) {
              *(void *)(v15 + 136) = v14;
            }
LABEL_52:
            void *v7 = 0;
            *(void *)(a2 + 136) = 0;
            uint64_t v12 = *a1;
            goto LABEL_53;
          }
          if (*((void *)v13 + 13) == a2) {
            goto LABEL_45;
          }
LABEL_53:
          uint64_t v25 = v12;
          goto LABEL_54;
        }
        if (!*(_DWORD *)(a2 + 88))
        {
          ClipperLib::Clipper::AddOutPt(a1, a2, (void *)(a2 + 48));
          *(_DWORD *)(a2 + 100) = -1;
LABEL_27:
          unint64_t v21 = (char *)a1 + *(void *)(*a1 - 24);
          uint64_t v23 = *(void *)(a2 + 128);
          uint64_t v22 = *(void *)(a2 + 136);
          if (*(_OWORD *)(a2 + 128) == 0)
          {
            if (*((void *)v21 + 13) != a2)
            {
LABEL_35:
              if ((*(_DWORD *)(v5 + 100) & 0x80000000) == 0)
              {
                ClipperLib::Clipper::AddOutPt(a1, v5, (void *)(a2 + 48));
                *(_DWORD *)(v5 + 100) = -1;
              }
              uint64_t v25 = *a1;
LABEL_54:
              uint64_t v17 = (char *)a1 + *(void *)(v25 - 24);
              uint64_t v19 = *(void *)(v5 + 128);
              uint64_t v20 = *(void *)(v5 + 136);
              uint64_t v18 = (void *)(v5 + 128);
              if (*(_OWORD *)(v5 + 128) == 0)
              {
                if (*((void *)v17 + 13) != v5) {
                  return;
                }
                goto LABEL_58;
              }
              goto LABEL_55;
            }
          }
          else if (v22)
          {
            uint64_t v24 = (void *)(v22 + 128);
LABEL_32:
            *uint64_t v24 = v23;
            if (v23) {
              *(void *)(v23 + 136) = v22;
            }
            void *v7 = 0;
            *(void *)(a2 + 136) = 0;
            goto LABEL_35;
          }
          uint64_t v24 = v21 + 104;
          goto LABEL_32;
        }
LABEL_63:
        exception = (ClipperLib::clipperException *)__cxa_allocate_exception(0x20uLL);
        ClipperLib::clipperException::clipperException(exception, "DoMaxima error");
      }
LABEL_23:
      if (!*(_DWORD *)(a2 + 88)) {
        goto LABEL_27;
      }
      goto LABEL_63;
    }
    if (*(_DWORD *)(v5 + 100) != -1) {
      goto LABEL_23;
    }
    uint64_t v12 = *a1;
    uint64_t v26 = (char *)a1 + *(void *)(*a1 - 24);
    uint64_t v27 = *(void *)(a2 + 136);
    if (v27) {
      char v28 = 1;
    }
    else {
      char v28 = v8;
    }
    if (v28)
    {
      if (v27)
      {
        int v29 = (uint64_t *)(v27 + 128);
        goto LABEL_50;
      }
    }
    else if (*((void *)v26 + 13) != a2)
    {
      goto LABEL_53;
    }
    int v29 = (uint64_t *)(v26 + 104);
LABEL_50:
    uint64_t *v29 = v6;
    if (v8) {
      *(void *)(v6 + 136) = v27;
    }
    goto LABEL_52;
  }
  if ((*(_DWORD *)(a2 + 100) & 0x80000000) == 0) {
    ClipperLib::Clipper::AddOutPt(a1, a2, (void *)(a2 + 48));
  }
  uint64_t v17 = (char *)a1 + *(void *)(*a1 - 24);
  uint64_t v19 = *(void *)(a2 + 128);
  uint64_t v20 = *(void *)(a2 + 136);
  uint64_t v18 = (void *)(a2 + 128);
  if (*(_OWORD *)(a2 + 128) == 0)
  {
    if (*((void *)v17 + 13) != a2) {
      return;
    }
    goto LABEL_58;
  }
LABEL_55:
  if (!v20)
  {
LABEL_58:
    uint64_t v30 = v17 + 104;
    goto LABEL_59;
  }
  uint64_t v30 = (void *)(v20 + 128);
LABEL_59:
  *uint64_t v30 = v19;
  if (v19) {
    *(void *)(v19 + 136) = v20;
  }
  *uint64_t v18 = 0;
  v18[1] = 0;
}

void sub_1DB28356C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t ClipperLib::PointCount(uint64_t a1)
{
  uint64_t v1 = 0;
  if (a1)
  {
    uint64_t v2 = a1;
    do
    {
      uint64_t v1 = (v1 + 1);
      uint64_t v2 = *(void *)(v2 + 32);
    }
    while (v2 != a1);
  }
  return v1;
}

uint64_t std::vector<std::vector<ClipperLib::IntPoint>>::reserve(uint64_t *a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t result = (uint64_t)(a1 + 2);
  if (0xAAAAAAAAAAAAAAABLL * ((v4 - *a1) >> 3) < a2)
  {
    if (a2 >= 0xAAAAAAAAAAAAAABLL) {
      std::vector<ClipperLib::IntPoint>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v5 = a1[1] - *a1;
    v7[4] = result;
    v7[0] = std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::IntPoint>>(result, a2);
    v7[1] = v7[0] + v5;
    unint64_t v7[2] = v7[0] + v5;
    v7[3] = v7[0] + 24 * v6;
    std::vector<std::vector<ClipperLib::IntPoint>>::__swap_out_circular_buffer(a1, v7);
    return std::__split_buffer<std::vector<ClipperLib::IntPoint>>::~__split_buffer((uint64_t)v7);
  }
  return result;
}

void sub_1DB283644(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<std::vector<ClipperLib::IntPoint>>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

void std::vector<ClipperLib::IntPoint>::reserve(void **a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (0xAAAAAAAAAAAAAAABLL * ((v4 - (unsigned char *)*a1) >> 3) < a2)
  {
    if (a2 >= 0xAAAAAAAAAAAAAABLL) {
      std::vector<ClipperLib::IntPoint>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v5 = ((unsigned char *)a1[1] - (unsigned char *)*a1) / 24;
    uint64_t v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::IntPoint>>(v3, a2);
    uint64_t v7 = &v6[24 * v5];
    BOOL v9 = &v6[24 * v8];
    int v11 = (char *)*a1;
    BOOL v10 = (char *)a1[1];
    uint64_t v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        long long v13 = *(_OWORD *)(v10 - 24);
        *((void *)v12 - 1) = *((void *)v10 - 1);
        *(_OWORD *)(v12 - 24) = v13;
        v12 -= 24;
        v10 -= 24;
      }
      while (v10 != v11);
      BOOL v10 = (char *)*a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
    {
      operator delete(v10);
    }
  }
}

void std::vector<ClipperLib::PolyNode *>::reserve(void **a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (unsigned char *)*a1) >> 3)
  {
    if (a2 >> 61) {
      std::vector<ClipperLib::IntPoint>::__throw_length_error[abi:ne180100]();
    }
    int64_t v5 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    uint64_t v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::PolyNode *>>(v3, a2);
    uint64_t v7 = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
    BOOL v9 = &v6[8 * v8];
    int v11 = (char *)*a1;
    BOOL v10 = (char *)a1[1];
    uint64_t v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        uint64_t v13 = *((void *)v10 - 1);
        v10 -= 8;
        *((void *)v12 - 1) = v13;
        v12 -= 8;
      }
      while (v10 != v11);
      BOOL v10 = (char *)*a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
    {
      operator delete(v10);
    }
  }
}

__n128 ClipperLib::SwapIntersectNodes(long long *a1, long long *a2)
{
  uint64_t v2 = *((void *)a1 + 4);
  long long v4 = *a1;
  long long v3 = a1[1];
  *a1 = *a2;
  __n128 result = (__n128)a2[1];
  *((void *)a1 + 4) = *((void *)a2 + 4);
  a1[1] = (__int128)result;
  *a2 = v4;
  a2[1] = v3;
  *((void *)a2 + 4) = v2;
  return result;
}

BOOL ClipperLib::GetOverlap(ClipperLib *this, uint64_t a2, uint64_t a3, uint64_t a4, ClipperLib **a5, ClipperLib **a6, uint64_t *a7)
{
  if ((uint64_t)this >= a2)
  {
    if (a3 >= a4)
    {
      if (a2 <= a4) {
        uint64_t v11 = a4;
      }
      else {
        uint64_t v11 = a2;
      }
      *a5 = (ClipperLib *)v11;
      if (a3 >= (uint64_t)this) {
        uint64_t v8 = this;
      }
      else {
        uint64_t v8 = (ClipperLib *)a3;
      }
    }
    else
    {
      if (a2 <= a3) {
        uint64_t v9 = a3;
      }
      else {
        uint64_t v9 = a2;
      }
      *a5 = (ClipperLib *)v9;
      if (a4 >= (uint64_t)this) {
        uint64_t v8 = this;
      }
      else {
        uint64_t v8 = (ClipperLib *)a4;
      }
    }
  }
  else if (a3 >= a4)
  {
    if ((uint64_t)this <= a4) {
      BOOL v10 = (ClipperLib *)a4;
    }
    else {
      BOOL v10 = this;
    }
    *a5 = v10;
    if (a3 >= a2) {
      uint64_t v8 = (ClipperLib *)a2;
    }
    else {
      uint64_t v8 = (ClipperLib *)a3;
    }
  }
  else
  {
    if ((uint64_t)this <= a3) {
      uint64_t v7 = (ClipperLib *)a3;
    }
    else {
      uint64_t v7 = this;
    }
    *a5 = v7;
    if (a4 >= a2) {
      uint64_t v8 = (ClipperLib *)a2;
    }
    else {
      uint64_t v8 = (ClipperLib *)a4;
    }
  }
  *a6 = v8;
  return (uint64_t)*a5 < (uint64_t)v8;
}

void ClipperLib::DupOutPt()
{
}

uint64_t ClipperLib::JoinHorz(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v5 = a1[1];
  uint64_t v6 = *(void *)(a2 + 8);
  int v7 = v5 <= v6;
  unsigned int v8 = *(void *)(a3 + 8) <= *(void *)(a4 + 8);
  if (v7 != v8)
  {
    uint64_t v9 = *a5;
    if (v5 <= v6)
    {
      do
      {
        BOOL v10 = a1;
        a1 = (void *)a1[4];
        uint64_t v11 = a1[1];
      }
      while (v11 <= v9 && v11 >= v10[1] && a1[2] == a5[1]);
      ClipperLib::DupOutPt();
    }
    do
    {
      uint64_t v12 = a1;
      a1 = (void *)a1[4];
      uint64_t v13 = a1[1];
    }
    while (v13 >= v9 && v13 <= v12[1] && a1[2] == a5[1]);
    ClipperLib::DupOutPt();
  }
  return v7 ^ v8;
}

uint64_t ClipperLib::Clipper::JoinPoints(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = (void *)*a2;
  uint64_t v5 = (void *)a2[1];
  unsigned int v8 = (uint64_t *)(*a2 + 8);
  uint64_t v7 = *v8;
  uint64_t v9 = *(void *)(*a2 + 16);
  BOOL v10 = a2 + 2;
  if (v9 != a2[3])
  {
    uint64_t v48 = (uint64_t)(v6 + 4);
    do
    {
      uint64_t v49 = *(void **)v48;
      uint64_t v51 = *(void *)(*(void *)v48 + 8);
      uint64_t v50 = *(void *)(*(void *)v48 + 16);
      uint64_t v48 = *(void *)v48 + 32;
    }
    while (v49 != v6 && v51 == v7 && v50 == v9);
    if (v50 <= v9
      && (long long v109 = *(_OWORD *)v8,
          uint64_t v110 = v8[2],
          long long v107 = *(_OWORD *)(v49 + 1),
          uint64_t v108 = v49[3],
          long long v105 = *(_OWORD *)v10,
          uint64_t v106 = a2[4],
          uint64_t v54 = *a1,
          ClipperLib::SlopesEqual(&v109, (uint64_t *)&v107, &v105, *((unsigned __int8 *)a1 + *(void *)(*a1 - 24) + 40))))
    {
      uint64_t v84 = v54;
      int v83 = 0;
    }
    else
    {
      uint64_t v49 = v6;
      do
      {
        uint64_t v49 = (void *)v49[5];
        uint64_t v55 = v49[2];
      }
      while (v49 != v6 && v49[1] == v7 && v55 == v9);
      if (v55 > v9) {
        return 0;
      }
      long long v103 = *(_OWORD *)v8;
      uint64_t v104 = v8[2];
      long long v101 = *(_OWORD *)(v49 + 1);
      uint64_t v102 = v49[3];
      long long v99 = *(_OWORD *)v10;
      uint64_t v100 = v10[2];
      uint64_t v58 = *a1;
      uint64_t result = ClipperLib::SlopesEqual(&v103, (uint64_t *)&v101, &v99, *((unsigned __int8 *)a1 + *(void *)(*a1 - 24) + 40));
      if (!result) {
        return result;
      }
      uint64_t v84 = v58;
      int v83 = 1;
    }
    uint64_t v60 = v5 + 1;
    uint64_t v61 = v5[1];
    uint64_t v62 = (uint64_t)(v5 + 4);
    uint64_t v63 = v5[2];
    do
    {
      uint64_t v64 = *(void **)v62;
      uint64_t v66 = *(void *)(*(void *)v62 + 8);
      uint64_t v65 = *(void *)(*(void *)v62 + 16);
      uint64_t v62 = *(void *)v62 + 32;
    }
    while (v66 == v61 && v65 == v63 && v64 != v5);
    if (v65 > v63) {
      goto LABEL_119;
    }
    long long v97 = *(_OWORD *)v60;
    uint64_t v98 = v5[3];
    long long v95 = *(_OWORD *)(v64 + 1);
    uint64_t v96 = v64[3];
    long long v93 = *(_OWORD *)v10;
    uint64_t v94 = v10[2];
    BOOL v69 = ClipperLib::SlopesEqual(&v97, (uint64_t *)&v95, &v93, *((unsigned __int8 *)a1 + *(void *)(v84 - 24) + 40));
    uint64_t v60 = v5 + 1;
    if (v69)
    {
      int v70 = 0;
    }
    else
    {
LABEL_119:
      uint64_t v64 = v5;
      do
      {
        uint64_t v64 = (void *)v64[5];
        uint64_t v71 = v64[2];
      }
      while (v64[1] == v61 && v71 == v63 && v64 != v5);
      if (v71 > v63) {
        return 0;
      }
      long long v91 = *(_OWORD *)v60;
      uint64_t v92 = v60[2];
      long long v89 = *(_OWORD *)(v64 + 1);
      uint64_t v90 = v64[3];
      long long v87 = *(_OWORD *)v10;
      uint64_t v88 = v10[2];
      uint64_t result = ClipperLib::SlopesEqual(&v91, (uint64_t *)&v89, &v87, *((unsigned __int8 *)a1 + *(void *)(v84 - 24) + 40));
      if (!result) {
        return result;
      }
      int v70 = 1;
    }
    uint64_t result = 0;
    if (v49 == v64 || v49 == v6 || v64 == v5) {
      return result;
    }
    if (a3 != a4 || v83 != v70) {
      operator new();
    }
    return 0;
  }
  uint64_t v11 = *v10;
  uint64_t v12 = (void *)*a2;
  if (*v10 == v7)
  {
    BOOL v13 = v11 == v5[1] && v9 == v5[2];
    uint64_t v12 = (void *)*a2;
    if (v13)
    {
      if (a3 == a4)
      {
        uint64_t v74 = (void *)*a2;
        while (1)
        {
          uint64_t v74 = (void *)v74[4];
          if (v74 == v6) {
            break;
          }
          uint64_t v75 = v74[2];
          if (v74[1] != v11 || v75 != v9) {
            goto LABEL_151;
          }
        }
        uint64_t v75 = *(void *)(*a2 + 16);
LABEL_151:
        v77 = (void *)a2[1];
        do
        {
          v77 = (void *)v77[4];
          if (v77 == v5)
          {
            if (v75 > v9) {
              goto LABEL_160;
            }
            return 0;
          }
          uint64_t v78 = v77[2];
        }
        while (v77[1] == v11 && v78 == v9);
        if (v75 > v9 == v78 <= v9) {
LABEL_160:
        }
          operator new();
      }
      return 0;
    }
  }
  do
  {
    uint64_t v14 = v12;
    uint64_t v12 = (void *)v12[5];
  }
  while (v12 != v6 && v12[2] == v9 && v12 != v5);
  uint64_t v17 = v14 + 2;
  do
  {
    uint64_t v18 = (uint64_t)v6;
    uint64_t v6 = (void *)v6[4];
  }
  while (v6 != v14 && v6[2] == v9 && v6 != v5);
  if (v6 == v14 || v6 == v5) {
    return 0;
  }
  uint64_t v22 = v5[2];
  uint64_t v23 = v5;
  do
  {
    uint64_t v24 = (uint64_t)v23;
    uint64_t v23 = (void *)v23[5];
  }
  while (v23 != (void *)v18 && v23[2] == v22 && v23 != v5);
  do
  {
    uint64_t v27 = (uint64_t)v5;
    uint64_t v5 = (void *)v5[4];
  }
  while (v5 != v14 && v5 != (void *)v24 && v5[2] == v22);
  if (v5 == (void *)v24 || v5 == v14) {
    return 0;
  }
  uint64_t v31 = v14[1];
  uint64_t v32 = *(void *)(v18 + 8);
  uint64_t v33 = *(void *)(v24 + 8);
  uint64_t v34 = *(void *)(v27 + 8);
  uint64_t v35 = v32 <= v34 ? *(void *)(v27 + 8) : *(void *)(v18 + 8);
  uint64_t v36 = v33 >= v31 ? v14[1] : *(void *)(v24 + 8);
  uint64_t v37 = v32 <= v33 ? *(void *)(v24 + 8) : *(void *)(v18 + 8);
  uint64_t v38 = v34 >= v31 ? v14[1] : *(void *)(v27 + 8);
  if (v33 >= v34) {
    uint64_t v38 = v36;
  }
  else {
    uint64_t v35 = v37;
  }
  uint64_t v39 = v31 <= v34 ? *(void *)(v27 + 8) : v14[1];
  uint64_t v40 = v33 >= v32 ? *(void *)(v18 + 8) : *(void *)(v24 + 8);
  uint64_t v41 = v31 <= v33 ? *(void *)(v24 + 8) : v14[1];
  uint64_t v42 = v34 >= v32 ? *(void *)(v18 + 8) : *(void *)(v27 + 8);
  if (v33 >= v34)
  {
    uint64_t v43 = v40;
  }
  else
  {
    uint64_t v39 = v41;
    uint64_t v43 = v42;
  }
  if (v31 < v32)
  {
    uint64_t v44 = v43;
  }
  else
  {
    uint64_t v39 = v35;
    uint64_t v44 = v38;
  }
  if (v39 >= v44) {
    return 0;
  }
  if (v31 < v39 || v31 > v44)
  {
    if (v33 < v39 || v33 > v44)
    {
      if (v32 < v39 || v32 > v44)
      {
        uint64_t v17 = (uint64_t *)(v27 + 16);
        uint64_t v45 = (int *)(v27 + 24);
        uint64_t v46 = (int *)(v27 + 28);
      }
      else
      {
        uint64_t v45 = (int *)(v18 + 24);
        uint64_t v46 = (int *)(v18 + 28);
        uint64_t v17 = (uint64_t *)(v18 + 16);
        uint64_t v34 = *(void *)(v18 + 8);
      }
    }
    else
    {
      uint64_t v45 = (int *)(v24 + 24);
      uint64_t v46 = (int *)(v24 + 28);
      uint64_t v17 = (uint64_t *)(v24 + 16);
      uint64_t v34 = *(void *)(v24 + 8);
    }
  }
  else
  {
    uint64_t v45 = (int *)(v14 + 3);
    uint64_t v46 = (int *)v14 + 7;
    uint64_t v34 = v14[1];
  }
  uint64_t v80 = *v17;
  int v81 = *v45;
  int v82 = *v46;
  *a2 = v14;
  a2[1] = v24;
  v111[0] = v34;
  v111[1] = v80;
  int v112 = v81;
  int v113 = v82;
  return ClipperLib::JoinHorz(v14, v18, v24, v27, v111);
}

uint64_t ClipperLib::Clipper::FixupFirstLefts1(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)result;
  uint64_t v4 = *(void *)(*(void *)result - 24);
  uint64_t v5 = *(void *)(result + v4 + 80);
  if (*(void *)(result + v4 + 88) != v5)
  {
    uint64_t v8 = result;
    unint64_t v9 = 0;
    do
    {
      uint64_t v10 = *(void *)(v5 + 8 * v9);
      for (uint64_t i = *(void *)(v10 + 8); i; uint64_t i = *(void *)(i + 8))
      {
        if (*(void *)(i + 24)) {
          break;
        }
      }
      if (i == a2)
      {
        uint64_t v12 = *(void *)(v10 + 24);
        if (v12)
        {
          BOOL v13 = *(void **)(a3 + 24);
          uint64_t v14 = *(void *)(v10 + 24);
          while (1)
          {
            uint64_t result = ClipperLib::PointInPolygon((void *)(v14 + 8), v13);
            if ((result & 0x80000000) == 0) {
              break;
            }
            uint64_t v14 = *(void *)(v14 + 32);
            if (v14 == v12) {
              goto LABEL_13;
            }
          }
          if (!result) {
            goto LABEL_14;
          }
LABEL_13:
          *(void *)(v10 + 8) = a3;
          uint64_t v4 = *(void *)(v3 - 24);
        }
      }
LABEL_14:
      ++v9;
      uint64_t v5 = *(void *)(v8 + v4 + 80);
    }
    while (v9 < (*(void *)(v8 + v4 + 88) - v5) >> 3);
  }
  return result;
}

uint64_t ClipperLib::Clipper::FixupFirstLefts2(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *(void *)(a3 + 8);
  uint64_t v3 = *(void *)result;
  uint64_t v4 = *(void *)(result + *(void *)(*(void *)result - 24) + 80);
  if (*(void *)(result + *(void *)(*(void *)result - 24) + 88) != v4)
  {
    uint64_t v7 = result;
    unint64_t v8 = 0;
    do
    {
      uint64_t v9 = *(void *)(v4 + 8 * v8);
      uint64_t v10 = *(void *)(v9 + 24);
      if (v9 != a2 && v9 != a3 && v10 != 0)
      {
        uint64_t v13 = *(void *)(v9 + 8);
        if (v13)
        {
          uint64_t v14 = *(void *)(v9 + 8);
          do
          {
            if (*(void *)(v14 + 24)) {
              break;
            }
            uint64_t v14 = *(void *)(v14 + 8);
          }
          while (v14);
        }
        else
        {
          uint64_t v14 = 0;
        }
        if (v14 == a3 || v14 == v20 || v14 == a2)
        {
          uint64_t v15 = *(void **)(a2 + 24);
          uint64_t v16 = *(void *)(v9 + 24);
          while (1)
          {
            uint64_t result = ClipperLib::PointInPolygon((void *)(v16 + 8), v15);
            if ((result & 0x80000000) == 0) {
              break;
            }
            uint64_t v16 = *(void *)(v16 + 32);
            if (v16 == v10)
            {
              uint64_t v17 = a2;
LABEL_29:
              *(void *)(v9 + 8) = v17;
              goto LABEL_30;
            }
          }
          uint64_t v17 = a2;
          if (result) {
            goto LABEL_29;
          }
          uint64_t v18 = *(void **)(a3 + 24);
          uint64_t v19 = v10;
          while (1)
          {
            uint64_t result = ClipperLib::PointInPolygon((void *)(v19 + 8), v18);
            if ((result & 0x80000000) == 0) {
              break;
            }
            uint64_t v19 = *(void *)(v19 + 32);
            if (v19 == v10)
            {
              uint64_t v17 = a3;
              goto LABEL_29;
            }
          }
          uint64_t v17 = a3;
          if (result) {
            goto LABEL_29;
          }
          uint64_t v17 = v20;
          if (v13 == a2) {
            goto LABEL_29;
          }
          uint64_t v17 = v20;
          if (v13 == a3) {
            goto LABEL_29;
          }
        }
      }
LABEL_30:
      ++v8;
      uint64_t v4 = *(void *)(v7 + *(void *)(v3 - 24) + 80);
    }
    while (v8 < (*(void *)(v7 + *(void *)(v3 - 24) + 88) - v4) >> 3);
  }
  return result;
}

uint64_t *ClipperLib::Clipper::FixupFirstLefts3(uint64_t *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *result;
  uint64_t v4 = *(void *)(*result - 24);
  uint64_t v5 = *(uint64_t *)((char *)result + v4 + 80);
  if (*(uint64_t *)((char *)result + v4 + 88) != v5)
  {
    unint64_t v6 = 0;
    do
    {
      uint64_t v7 = *(void *)(v5 + 8 * v6);
      if (*(void *)(v7 + 8) == a2 && *(void *)(v7 + 24) != 0)
      {
        *(void *)(v7 + 8) = a3;
        uint64_t v4 = *(void *)(v3 - 24);
      }
      ++v6;
      uint64_t v5 = *(uint64_t *)((char *)result + v4 + 80);
    }
    while (v6 < (*(uint64_t *)((char *)result + v4 + 88) - v5) >> 3);
  }
  return result;
}

double ClipperLib::GetUnitNormal(void *a1, void *a2)
{
  uint64_t v2 = a2[1];
  uint64_t v3 = a1[1];
  BOOL v4 = *a2 == *a1 && v2 == v3;
  double result = 0.0;
  if (!v4) {
    return 1.0
  }
         / sqrt((double)(v2 - v3) * (double)(v2 - v3) + (double)(uint64_t)(*a2 - *a1) * (double)(uint64_t)(*a2 - *a1))
         * (double)(v2 - v3);
  return result;
}

double ClipperLib::ClipperOffset::ClipperOffset(ClipperLib::ClipperOffset *this, double a2, double a3)
{
  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 6) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  __asm { FMOV            V3.2S, #-1.0 }
  *((void *)this + 22) = _D3;
  *((void *)this + 23) = &unk_1F3555D88;
  *((_OWORD *)this + 12) = 0u;
  *((_OWORD *)this + 13) = 0u;
  *((_OWORD *)this + 14) = 0u;
  *(_OWORD *)((char *)this + 237) = 0u;
  *(double *)this = a2;
  *((double *)this + 1) = a3;
  double result = NAN;
  *((_OWORD *)this + 10) = xmmword_1DB33E650;
  return result;
}

void ClipperLib::ClipperOffset::~ClipperOffset(ClipperLib::ClipperOffset *this)
{
  ClipperLib::ClipperOffset::Clear(this);
  ClipperLib::PolyNode::~PolyNode((ClipperLib::ClipperOffset *)((char *)this + 184));
  uint64_t v2 = (void *)*((void *)this + 11);
  if (v2)
  {
    *((void *)this + 12) = v2;
    operator delete(v2);
  }
  uint64_t v3 = (void *)*((void *)this + 8);
  if (v3)
  {
    *((void *)this + 9) = v3;
    operator delete(v3);
  }
  BOOL v4 = (void *)*((void *)this + 5);
  if (v4)
  {
    *((void *)this + 6) = v4;
    operator delete(v4);
  }
  uint64_t v5 = (void **)((char *)this + 16);
  std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100](&v5);
}

void *ClipperLib::ClipperOffset::Clear(void *this)
{
  uint64_t v1 = this;
  uint64_t v2 = this[27];
  uint64_t v3 = this[28];
  if ((int)((unint64_t)(v3 - v2) >> 3) >= 1)
  {
    uint64_t v4 = 0;
    do
    {
      this = *(void **)(v2 + 8 * v4);
      if (this)
      {
        this = (void *)(*(uint64_t (**)(void *))(*this + 8))(this);
        uint64_t v2 = v1[27];
        uint64_t v3 = v1[28];
      }
      ++v4;
    }
    while (v4 < (int)((unint64_t)(v3 - v2) >> 3));
  }
  v1[28] = v2;
  v1[20] = -1;
  return this;
}

void ClipperLib::ClipperOffset::AddPath(uint64_t a1, void *a2)
{
  if ((int)(-1431655765 * ((a2[1] - *a2) >> 3)) >= 1) {
    operator new();
  }
}

void ClipperLib::ClipperOffset::AddPaths(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  if (a2[1] != *a2)
  {
    uint64_t v5 = 0;
    unint64_t v6 = 0;
    do
    {
      ClipperLib::ClipperOffset::AddPath(a1, (void *)(v2 + v5));
      ++v6;
      uint64_t v2 = *a2;
      v5 += 24;
    }
    while (v6 < 0xAAAAAAAAAAAAAAABLL * ((a2[1] - *a2) >> 3));
  }
}

void ClipperLib::ClipperOffset::FixOrientations(ClipperLib::ClipperOffset *this)
{
  uint64_t v2 = *((void *)this + 20);
  if (v2 < 0)
  {
    uint64_t v3 = *((void *)this + 27);
  }
  else
  {
    uint64_t v3 = *((void *)this + 27);
    if (ClipperLib::Area((uint64_t *)(*(void *)(v3 + 8 * (int)v2) + 8)) < 0.0)
    {
      uint64_t v4 = *((void *)this + 28);
      if ((int)((unint64_t)(v4 - v3) >> 3) >= 1)
      {
        uint64_t v5 = 0;
        do
        {
          uint64_t v6 = *(void *)(v3 + 8 * v5);
          int v7 = *(_DWORD *)(v6 + 76);
          if (!v7 || v7 == 1 && ClipperLib::Area((uint64_t *)(v6 + 8)) >= 0.0)
          {
            unint64_t v8 = *(void *)(v6 + 8);
            uint64_t v9 = *(void *)(v6 + 16);
            unint64_t v10 = v9 - 24;
            if (v8 != v9 && v10 > v8)
            {
              unint64_t v12 = v8 + 24;
              do
              {
                uint64_t v13 = *(void *)(v12 - 8);
                long long v14 = *(_OWORD *)(v12 - 24);
                uint64_t v15 = *(void *)(v10 + 16);
                *(_OWORD *)(v12 - 24) = *(_OWORD *)v10;
                *(void *)(v12 - 8) = v15;
                *(_OWORD *)unint64_t v10 = v14;
                *(void *)(v10 + 16) = v13;
                v10 -= 24;
                BOOL v16 = v12 >= v10;
                v12 += 24;
              }
              while (!v16);
              uint64_t v3 = *((void *)this + 27);
              uint64_t v4 = *((void *)this + 28);
            }
          }
          ++v5;
        }
        while (v5 < (int)((unint64_t)(v4 - v3) >> 3));
      }
      return;
    }
  }
  uint64_t v17 = *((void *)this + 28);
  if ((int)((unint64_t)(v17 - v3) >> 3) >= 1)
  {
    uint64_t v18 = 0;
    do
    {
      uint64_t v19 = *(void *)(v3 + 8 * v18);
      if (*(_DWORD *)(v19 + 76) == 1 && ClipperLib::Area((uint64_t *)(v19 + 8)) < 0.0)
      {
        unint64_t v20 = *(void *)(v19 + 8);
        uint64_t v21 = *(void *)(v19 + 16);
        unint64_t v22 = v21 - 24;
        if (v20 != v21 && v22 > v20)
        {
          unint64_t v24 = v20 + 24;
          do
          {
            uint64_t v25 = *(void *)(v24 - 8);
            long long v26 = *(_OWORD *)(v24 - 24);
            uint64_t v27 = *(void *)(v22 + 16);
            *(_OWORD *)(v24 - 24) = *(_OWORD *)v22;
            *(void *)(v24 - 8) = v27;
            *(_OWORD *)unint64_t v22 = v26;
            *(void *)(v22 + 16) = v25;
            v22 -= 24;
            BOOL v16 = v24 >= v22;
            v24 += 24;
          }
          while (!v16);
          uint64_t v3 = *((void *)this + 27);
          uint64_t v17 = *((void *)this + 28);
        }
      }
      ++v18;
    }
    while (v18 < (int)((unint64_t)(v17 - v3) >> 3));
  }
}

__n128 ClipperLib::ReversePath(unint64_t *a1)
{
  unint64_t v1 = *a1;
  unint64_t v2 = a1[1];
  unint64_t v3 = v2 - 24;
  if (*a1 != v2 && v3 > v1)
  {
    unint64_t v5 = v1 + 24;
    do
    {
      uint64_t v6 = *(void *)(v5 - 8);
      __n128 result = *(__n128 *)(v5 - 24);
      uint64_t v8 = *(void *)(v3 + 16);
      *(_OWORD *)(v5 - 24) = *(_OWORD *)v3;
      *(void *)(v5 - 8) = v8;
      *(__n128 *)unint64_t v3 = result;
      *(void *)(v3 + 16) = v6;
      v3 -= 24;
      BOOL v9 = v5 >= v3;
      v5 += 24;
    }
    while (!v9);
  }
  return result;
}

void ClipperLib::ClipperOffset::Execute(uint64_t *a1, uint64_t *a2, double a3)
{
  std::vector<std::vector<ClipperLib::IntPoint>>::__clear[abi:ne180100](a2);
  ClipperLib::ClipperOffset::FixOrientations((ClipperLib::ClipperOffset *)a1);
  ClipperLib::ClipperOffset::DoOffset((ClipperLib::ClipperOffset *)a1, a3);
  uint64_t v41 = 0;
  uint64_t v42 = 0;
  uint64_t v43 = 0;
  uint64_t v45 = 0;
  uint64_t v46 = 0;
  uint64_t v47 = 0;
  uint64_t v49 = 0;
  uint64_t v50 = 0;
  uint64_t v48 = 0;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v26 = &unk_1F3555D08;
  *(_OWORD *)uint64_t v27 = 0u;
  *(_OWORD *)char v28 = 0u;
  long long v29 = 0u;
  *(_OWORD *)uint64_t v30 = 0u;
  uint64_t v31 = 0;
  v32[0] = v32;
  v32[1] = v32;
  v32[2] = 0;
  char v33 = 0;
  char v40 = 0;
  char v34 = 0;
  char v35 = 0;
  __int16 v44 = 0;
  uint64_t v36 = 0;
  uint64_t v37 = off_1F3555D50;
  ClipperLib::ClipperBase::AddPaths((uint64_t)&v37, a1 + 2, 0, 1);
  if (a3 <= 0.0)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    ClipperLib::ClipperBase::GetBounds((ClipperLib::ClipperBase *)((char *)&v27[-1] + *(v26 - 3)), (uint64_t)&v24);
    std::vector<ClipperLib::IntPoint>::vector(__p, 4uLL);
    uint64_t v6 = *((void *)&v24 + 1);
    uint64_t v7 = v24 - 10;
    uint64_t v8 = v25;
    uint64_t v9 = *((void *)&v25 + 1) + 10;
    unint64_t v10 = __p[0];
    *(void *)__p[0] = v24 - 10;
    v10[1] = v9;
    v8 += 10;
    v10[3] = v8;
    v10[4] = v9;
    __asm { FMOV            V0.2S, #-1.0 }
    unint64_t v10[2] = _D0;
    v10[5] = _D0;
    v6 -= 10;
    v10[6] = v8;
    v10[7] = v6;
    v10[8] = _D0;
    v10[9] = v7;
    v10[10] = v6;
    v10[11] = _D0;
    ClipperLib::ClipperBase::AddPath((uint64_t)&v27[-1] + *(v26 - 3), (uint64_t)__p, 0, 1);
    char v34 = 1;
    ClipperLib::Clipper::Execute((uint64_t)&v26, 1, a2, 3, 3);
    BOOL v16 = (__n128 *)a2[1];
    if (v16 != (__n128 *)*a2)
    {
      std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__move_loop<std::_ClassicAlgPolicy>,std::__move_trivial>,std::vector<ClipperLib::IntPoint> *,std::vector<ClipperLib::IntPoint> *,std::vector<ClipperLib::IntPoint> *,0>((__n128 *)(*a2 + 24), v16, *a2);
      uint64_t v18 = v17;
      uint64_t v19 = a2[1];
      if (v19 != v17)
      {
        uint64_t v20 = a2[1];
        do
        {
          unint64_t v22 = *(void **)(v20 - 24);
          v20 -= 24;
          uint64_t v21 = v22;
          if (v22)
          {
            *(void *)(v19 - 16) = v21;
            operator delete(v21);
          }
          uint64_t v19 = v20;
        }
        while (v20 != v18);
      }
      a2[1] = v18;
    }
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
  }
  else
  {
    ClipperLib::Clipper::Execute((uint64_t)&v26, 1, a2, 2, 2);
  }
  long long v26 = &unk_1F3555D08;
  uint64_t v37 = off_1F3555D50;
  std::__list_imp<long long>::clear(v32);
  if (v30[0])
  {
    v30[1] = v30[0];
    operator delete(v30[0]);
  }
  if (v28[1])
  {
    *(void **)&long long v29 = v28[1];
    operator delete(v28[1]);
  }
  if (v27[0])
  {
    v27[1] = v27[0];
    operator delete(v27[0]);
  }
  ClipperLib::ClipperBase::~ClipperBase((ClipperLib::ClipperBase *)&v37);
}

void sub_1DB2852F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
  if (__p) {
    operator delete(__p);
  }
  ClipperLib::Clipper::~Clipper((ClipperLib::Clipper *)&a17);
  _Unwind_Resume(a1);
}

unint64_t ClipperLib::ClipperOffset::DoOffset(ClipperLib::ClipperOffset *this, double a2)
{
  unint64_t v3 = (uint64_t *)((char *)this + 16);
  std::vector<std::vector<ClipperLib::IntPoint>>::__clear[abi:ne180100]((uint64_t *)this + 2);
  *((double *)this + 14) = a2;
  if (a2 > -1.0e-20 && a2 < 1.0e-20)
  {
    unint64_t result = std::vector<std::vector<ClipperLib::IntPoint>>::reserve(v3, (int)((uint64_t)(*((void *)this + 28) - *((void *)this + 27)) >> 3));
    uint64_t v6 = *((void *)this + 27);
    uint64_t v5 = *((void *)this + 28);
    if ((int)((unint64_t)(v5 - v6) >> 3) >= 1)
    {
      uint64_t v7 = 0;
      do
      {
        uint64_t v8 = *(void *)(v6 + 8 * v7);
        if (!*(_DWORD *)(v8 + 76))
        {
          uint64_t v9 = v8 + 8;
          unint64_t v10 = *((void *)this + 3);
          if (v10 >= *((void *)this + 4))
          {
            unint64_t result = std::vector<std::vector<ClipperLib::IntPoint>>::__push_back_slow_path<std::vector<ClipperLib::IntPoint> const&>(v3, v9);
          }
          else
          {
            std::vector<std::vector<ClipperLib::IntPoint>>::__construct_one_at_end[abi:ne180100]<std::vector<ClipperLib::IntPoint> const&>((uint64_t)v3, v9);
            unint64_t result = v10 + 24;
          }
          *((void *)this + 3) = result;
          uint64_t v6 = *((void *)this + 27);
          uint64_t v5 = *((void *)this + 28);
        }
        ++v7;
      }
      while (v7 < (int)((unint64_t)(v5 - v6) >> 3));
    }
    return result;
  }
  double v11 = 0.5;
  if (*(double *)this > 2.0) {
    double v11 = 2.0 / (*(double *)this * *(double *)this);
  }
  *((double *)this + 18) = v11;
  double v12 = *((double *)this + 1);
  double v13 = fabs(a2);
  double v14 = v13 * 0.25;
  if (v12 <= v13 * 0.25) {
    double v14 = *((double *)this + 1);
  }
  if (v12 <= 0.0) {
    double v15 = 0.25;
  }
  else {
    double v15 = v14;
  }
  double v16 = 3.14159265 / acos(1.0 - v15 / v13);
  if (v16 <= v13 * 3.14159265) {
    double v17 = v16;
  }
  else {
    double v17 = v13 * 3.14159265;
  }
  __double2 v18 = __sincos_stret(6.28318531 / v17);
  *((__double2 *)this + 8) = v18;
  *((double *)this + 19) = v17 / 6.28318531;
  if (a2 < 0.0) {
    *((double *)this + 16) = -v18.__sinval;
  }
  unint64_t result = std::vector<std::vector<ClipperLib::IntPoint>>::reserve(v3, (int)((uint64_t)(*((void *)this + 28) - *((void *)this + 27)) >> 2) & 0xFFFFFFFFFFFFFFFELL);
  uint64_t v19 = *((void *)this + 27);
  double v20 = a2;
  if ((int)((unint64_t)(*((void *)this + 28) - v19) >> 3) >= 1)
  {
    uint64_t v21 = 0;
    unint64_t v22 = (int64x2_t **)((char *)this + 40);
    uint64_t v23 = (void **)((char *)this + 64);
    v199 = (float64x2_t **)((char *)this + 88);
    v200 = (void *)((char *)this + 104);
    float64x2_t v196 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&a2, 0);
    long long v24 = (int64x2_t **)((char *)this + 80);
    __asm
    {
      FMOV            V1.2D, #0.5
      FMOV            V0.2D, #-0.5
    }
    int8x16_t v194 = _Q0;
    int8x16_t v195 = _Q1;
    __asm { FMOV            V12.2S, #-1.0 }
    v186 = v3;
    v197 = (void **)((char *)this + 64);
    do
    {
      uint64_t v32 = *(void *)(v19 + 8 * v21);
      if (v22 != (int64x2_t **)(v32 + 8))
      {
        unint64_t result = (unint64_t)std::vector<ClipperLib::IntPoint>::__assign_with_size[abi:ne180100]<ClipperLib::IntPoint*,ClipperLib::IntPoint*>((char *)this + 40, *(char **)(v32 + 8), *(void *)(v32 + 16), 0xAAAAAAAAAAAAAAABLL* ((uint64_t)(*(void *)(v32 + 16) - *(void *)(v32 + 8)) >> 3));
        double v20 = a2;
      }
      uint64_t v33 = (uint64_t)(*((void *)this + 6) - *((void *)this + 5)) >> 3;
      unint64_t v34 = 0xAAAAAAAAAAAAAAABLL * v33;
      if (!(-1431655765 * v33)) {
        goto LABEL_259;
      }
      if (v20 <= 0.0)
      {
        if ((int)v34 < 3 || *(_DWORD *)(v32 + 76)) {
          goto LABEL_259;
        }
        *((void *)this + 9) = *((void *)this + 8);
      }
      else
      {
        char v35 = (int64x2_t *)*((void *)this + 8);
        *((void *)this + 9) = v35;
        if (v34 == 1)
        {
          if (*(_DWORD *)(v32 + 72) == 1)
          {
            if (v17 >= 1.0)
            {
              uint64_t v36 = 1;
              float64x2_t v37 = (float64x2_t)xmmword_1DB33E660;
              do
              {
                float64x2_t v38 = vmlaq_f64(vcvtq_f64_s64(**v22), v196, v37);
                int64x2_t v39 = vcvtq_s64_f64(vaddq_f64(v38, (float64x2_t)vbslq_s8((int8x16_t)vcltzq_f64(v38), v194, v195)));
                if (v35 >= *v24)
                {
                  char v40 = (int64x2_t *)*v23;
                  unint64_t v41 = 0xAAAAAAAAAAAAAAABLL * (((char *)v35 - (unsigned char *)*v23) >> 3);
                  unint64_t v42 = v41 + 1;
                  if (v41 + 1 > 0xAAAAAAAAAAAAAAALL) {
                    goto LABEL_263;
                  }
                  *(float64x2_t *)v188 = v37;
                  if (0x5555555555555556 * (((char *)*v24 - (char *)v40) >> 3) > v42) {
                    unint64_t v42 = 0x5555555555555556 * (((char *)*v24 - (char *)v40) >> 3);
                  }
                  if (0xAAAAAAAAAAAAAAABLL * (((char *)*v24 - (char *)v40) >> 3) >= 0x555555555555555) {
                    unint64_t v43 = 0xAAAAAAAAAAAAAAALL;
                  }
                  else {
                    unint64_t v43 = v42;
                  }
                  if (v43)
                  {
                    int64x2_t v187 = v39;
                    __int16 v44 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::IntPoint>>((uint64_t)this + 80, v43);
                    int64x2_t v39 = v187;
                    uint64_t v45 = v44;
                    char v40 = (int64x2_t *)*((void *)this + 8);
                    char v35 = (int64x2_t *)*((void *)this + 9);
                  }
                  else
                  {
                    uint64_t v45 = 0;
                  }
                  uint64_t v46 = (int64x2_t *)&v45[24 * v41];
                  *uint64_t v46 = v39;
                  v46[1].i64[0] = _D12;
                  uint64_t v47 = v46;
                  if (v35 != v40)
                  {
                    do
                    {
                      int64x2_t v48 = *(int64x2_t *)((char *)v35 - 24);
                      v47[-1].i64[1] = v35[-1].i64[1];
                      *(int64x2_t *)((char *)v47 - 24) = v48;
                      uint64_t v47 = (int64x2_t *)((char *)v47 - 24);
                      char v35 = (int64x2_t *)((char *)v35 - 24);
                    }
                    while (v35 != v40);
                    char v40 = (int64x2_t *)*v23;
                  }
                  char v35 = (int64x2_t *)((char *)v46 + 24);
                  *((void *)this + 8) = v47;
                  *((void *)this + 9) = (char *)v46 + 24;
                  *((void *)this + 10) = &v45[24 * v43];
                  if (v40) {
                    operator delete(v40);
                  }
                  float64x2_t v37 = *(float64x2_t *)v188;
                }
                else
                {
                  *char v35 = v39;
                  v35[1].i64[0] = _D12;
                  char v35 = (int64x2_t *)((char *)v35 + 24);
                }
                *((void *)this + 9) = v35;
                float64x2_t v49 = *((float64x2_t *)this + 8);
                float64x2_t v50 = (float64x2_t)vextq_s8((int8x16_t)v49, (int8x16_t)v49, 8uLL);
                v49.f64[0] = -v49.f64[0];
                ++v36;
                float64x2_t v37 = vmlaq_n_f64(vmulq_laneq_f64(v49, v37, 1), v50, v37.f64[0]);
              }
              while (v17 >= (double)v36);
            }
          }
          else
          {
            int v76 = 0;
            double v77 = -1.0;
            double v78 = -1.0;
            do
            {
              double v79 = (double)(*v22)->i64[0] + v77 * v20;
              if (v79 >= 0.0) {
                double v80 = 0.5;
              }
              else {
                double v80 = -0.5;
              }
              uint64_t v81 = (uint64_t)(v79 + v80);
              double v82 = (double)(*v22)->i64[1] + v78 * v20;
              if (v82 >= 0.0) {
                double v83 = 0.5;
              }
              else {
                double v83 = -0.5;
              }
              uint64_t v84 = (uint64_t)(v82 + v83);
              if (v35 >= *v24)
              {
                uint64_t v85 = (int64x2_t *)*v23;
                unint64_t v86 = 0xAAAAAAAAAAAAAAABLL * (((char *)v35 - (unsigned char *)*v23) >> 3);
                unint64_t v87 = v86 + 1;
                if (v86 + 1 > 0xAAAAAAAAAAAAAAALL) {
                  goto LABEL_262;
                }
                if (0x5555555555555556 * (((char *)*v24 - (char *)v85) >> 3) > v87) {
                  unint64_t v87 = 0x5555555555555556 * (((char *)*v24 - (char *)v85) >> 3);
                }
                if (0xAAAAAAAAAAAAAAABLL * (((char *)*v24 - (char *)v85) >> 3) >= 0x555555555555555) {
                  unint64_t v88 = 0xAAAAAAAAAAAAAAALL;
                }
                else {
                  unint64_t v88 = v87;
                }
                if (v88)
                {
                  long long v89 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::IntPoint>>((uint64_t)this + 80, v88);
                  uint64_t v85 = (int64x2_t *)*((void *)this + 8);
                  char v35 = (int64x2_t *)*((void *)this + 9);
                }
                else
                {
                  long long v89 = 0;
                }
                uint64_t v90 = (uint64_t *)&v89[24 * v86];
                *uint64_t v90 = v81;
                v90[1] = v84;
                v90[2] = _D12;
                long long v91 = v90;
                if (v35 == v85)
                {
                  uint64_t v23 = (void **)((char *)this + 64);
                }
                else
                {
                  uint64_t v23 = (void **)((char *)this + 64);
                  do
                  {
                    long long v92 = *(long long *)((char *)&v35[-2] + 8);
                    *(v91 - 1) = v35[-1].i64[1];
                    *(_OWORD *)(v91 - 3) = v92;
                    v91 -= 3;
                    char v35 = (int64x2_t *)((char *)v35 - 24);
                  }
                  while (v35 != v85);
                  uint64_t v85 = (int64x2_t *)*v197;
                }
                char v35 = (int64x2_t *)(v90 + 3);
                *((void *)this + 8) = v91;
                *((void *)this + 9) = v90 + 3;
                *((void *)this + 10) = &v89[24 * v88];
                if (v85) {
                  operator delete(v85);
                }
                double v20 = a2;
              }
              else
              {
                v35->i64[0] = v81;
                v35->i64[1] = v84;
                v35[1].i64[0] = _D12;
                char v35 = (int64x2_t *)((char *)v35 + 24);
              }
              *((void *)this + 9) = v35;
              if (v78 >= 0.0) {
                double v93 = v78;
              }
              else {
                double v93 = 1.0;
              }
              if (v78 >= 0.0) {
                double v94 = -1.0;
              }
              else {
                double v94 = v77;
              }
              if (v77 < 0.0)
              {
                double v77 = 1.0;
              }
              else
              {
                double v78 = v93;
                double v77 = v94;
              }
              ++v76;
            }
            while (v76 != 4);
          }
          goto LABEL_152;
        }
      }
      *((void *)this + 12) = *((void *)this + 11);
      std::vector<ClipperLib::DoublePoint>::reserve((void **)v199, (int)v34);
      uint64_t v51 = (v34 - 1);
      int v189 = v34 - 2;
      if ((int)v34 >= 2)
      {
        uint64_t v52 = 0;
        uint64_t v53 = (double *)*((void *)this + 12);
        do
        {
          double UnitNormal = ClipperLib::GetUnitNormal(&(*v22)->i64[3 * v52], &(*v22)[1].i64[3 * v52 + 1]);
          double v56 = UnitNormal;
          uint64_t v57 = v55;
          if ((unint64_t)v53 >= *v200)
          {
            uint64_t v58 = *v199;
            uint64_t v59 = ((char *)v53 - (char *)*v199) >> 4;
            unint64_t v60 = v59 + 1;
            if ((unint64_t)(v59 + 1) >> 60) {
              goto LABEL_261;
            }
            uint64_t v61 = *v200 - (void)v58;
            if (v61 >> 3 > v60) {
              unint64_t v60 = v61 >> 3;
            }
            if ((unint64_t)v61 >= 0x7FFFFFFFFFFFFFF0) {
              unint64_t v62 = 0xFFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v62 = v60;
            }
            if (v62)
            {
              uint64_t v63 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::DoublePoint>>((uint64_t)v200, v62);
              uint64_t v58 = (float64x2_t *)*((void *)this + 11);
              uint64_t v53 = (double *)*((void *)this + 12);
            }
            else
            {
              uint64_t v63 = 0;
            }
            uint64_t v64 = &v63[16 * v59];
            *(double *)uint64_t v64 = v56;
            *((void *)v64 + 1) = v57;
            uint64_t v65 = v64;
            if (v53 != (double *)v58)
            {
              do
              {
                *((_OWORD *)v65 - 1) = *((_OWORD *)v53 - 1);
                v65 -= 16;
                v53 -= 2;
              }
              while (v53 != (double *)v58);
              uint64_t v58 = *v199;
            }
            uint64_t v53 = (double *)(v64 + 16);
            *((void *)this + 11) = v65;
            *((void *)this + 12) = v64 + 16;
            *((void *)this + 13) = &v63[16 * v62];
            if (v58) {
              operator delete(v58);
            }
          }
          else
          {
            *uint64_t v53 = UnitNormal;
            *((void *)v53 + 1) = v55;
            v53 += 2;
          }
          ++v52;
          *((void *)this + 12) = v53;
        }
        while (v52 != v51);
      }
      if (*(_DWORD *)(v32 + 76) >= 2u)
      {
        uint64_t v72 = *((void *)this + 11);
        uint64_t v71 = (float64x2_t *)*((void *)this + 12);
        uint64_t v73 = (float64x2_t *)(v72 + ((uint64_t)((v34 << 32) - 0x200000000) >> 28));
        v201[0] = *v73;
        unint64_t v74 = *((void *)this + 13);
        if ((unint64_t)v71 >= v74)
        {
          uint64_t v101 = ((uint64_t)v71 - v72) >> 4;
          unint64_t v102 = v101 + 1;
          if ((unint64_t)(v101 + 1) >> 60) {
LABEL_261:
          }
            std::vector<ClipperLib::IntPoint>::__throw_length_error[abi:ne180100]();
          uint64_t v103 = v74 - v72;
          if (v103 >> 3 > v102) {
            unint64_t v102 = v103 >> 3;
          }
          if ((unint64_t)v103 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v104 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v104 = v102;
          }
          if (v104) {
            long long v105 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::DoublePoint>>((uint64_t)v200, v104);
          }
          else {
            long long v105 = 0;
          }
          uint64_t v108 = &v105[16 * v101];
          *(_OWORD *)uint64_t v108 = v201[0];
          uint64_t v110 = (float64x2_t *)*((void *)this + 11);
          long long v109 = (float64x2_t *)*((void *)this + 12);
          v111 = v108;
          if (v109 != v110)
          {
            do
            {
              *((float64x2_t *)v111 - 1) = v109[-1];
              v111 -= 16;
              --v109;
            }
            while (v109 != v110);
            long long v109 = *v199;
          }
          f64 = v108 + 16;
          *((void *)this + 11) = v111;
          *((void *)this + 12) = v108 + 16;
          *((void *)this + 13) = &v105[16 * v104];
          if (!v109) {
            goto LABEL_147;
          }
          long long v95 = v109;
LABEL_146:
          operator delete(v95);
          goto LABEL_147;
        }
        float64x2_t *v71 = *v73;
      }
      else
      {
        double v66 = ClipperLib::GetUnitNormal((void *)(*((void *)this + 5) + 24 * (int)v51), *((void **)this + 5));
        double v68 = v66;
        float64_t v69 = v67;
        uint64_t v71 = (float64x2_t *)*((void *)this + 12);
        unint64_t v70 = *((void *)this + 13);
        if ((unint64_t)v71 >= v70)
        {
          long long v95 = *v199;
          uint64_t v96 = v71 - *v199;
          unint64_t v97 = v96 + 1;
          if ((unint64_t)(v96 + 1) >> 60) {
            goto LABEL_261;
          }
          uint64_t v98 = v70 - (void)v95;
          if (v98 >> 3 > v97) {
            unint64_t v97 = v98 >> 3;
          }
          if ((unint64_t)v98 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v99 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v99 = v97;
          }
          if (v99)
          {
            uint64_t v100 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::DoublePoint>>((uint64_t)v200, v99);
            long long v95 = (float64x2_t *)*((void *)this + 11);
            uint64_t v71 = (float64x2_t *)*((void *)this + 12);
          }
          else
          {
            uint64_t v100 = 0;
          }
          uint64_t v106 = &v100[16 * v96];
          *(double *)uint64_t v106 = v68;
          *((float64_t *)v106 + 1) = v69;
          long long v107 = v106;
          if (v71 != v95)
          {
            do
            {
              *((float64x2_t *)v107 - 1) = v71[-1];
              v107 -= 16;
              --v71;
            }
            while (v71 != v95);
            long long v95 = *v199;
          }
          f64 = v106 + 16;
          *((void *)this + 11) = v107;
          *((void *)this + 12) = v106 + 16;
          *((void *)this + 13) = &v100[16 * v99];
          if (!v95) {
            goto LABEL_147;
          }
          goto LABEL_146;
        }
        v71->f64[0] = v66;
        v71->f64[1] = v67;
      }
      f64 = (void *)v71[1].f64;
LABEL_147:
      *((void *)this + 12) = f64;
      int v112 = *(_DWORD *)(v32 + 76);
      if (v112 == 1)
      {
        LODWORD(v201[0]) = v34 - 1;
        if ((int)v34 >= 1)
        {
          int v117 = 0;
          do
            ClipperLib::ClipperOffset::OffsetPoint(this, v117++, (int *)v201, *(_DWORD *)(v32 + 72));
          while (v34 != v117);
        }
        unint64_t v118 = *((void *)this + 3);
        if (v118 >= *((void *)this + 4))
        {
          unint64_t v119 = std::vector<std::vector<ClipperLib::IntPoint>>::__push_back_slow_path<std::vector<ClipperLib::IntPoint> const&>(v186, (uint64_t)v197);
        }
        else
        {
          std::vector<std::vector<ClipperLib::IntPoint>>::__construct_one_at_end[abi:ne180100]<std::vector<ClipperLib::IntPoint> const&>((uint64_t)v186, (uint64_t)v197);
          unint64_t v119 = v118 + 24;
        }
        *((void *)this + 3) = v119;
        *((void *)this + 9) = *((void *)this + 8);
        v126 = (float64x2_t *)*((void *)this + 11);
        float64x2_t v127 = v126[(int)v51];
        if ((int)v34 > 1)
        {
          unint64_t v128 = (v34 - 1);
          do
          {
            BOOL v129 = v128 > 1;
            v126[v128] = vnegq_f64(v126[(v128 - 1)]);
            --v128;
          }
          while (v129);
        }
        float64x2_t *v126 = vnegq_f64(v127);
        LODWORD(v201[0]) = 0;
        if ((int)v34 >= 1)
        {
          do
          {
            ClipperLib::ClipperOffset::OffsetPoint(this, v51, (int *)v201, *(_DWORD *)(v32 + 72));
            LODWORD(v51) = v51 - 1;
          }
          while (v51 != -1);
          unint64_t v119 = *((void *)this + 3);
        }
        uint64_t v23 = (void **)((char *)this + 64);
        if (v119 >= *((void *)this + 4))
        {
          unint64_t result = std::vector<std::vector<ClipperLib::IntPoint>>::__push_back_slow_path<std::vector<ClipperLib::IntPoint> const&>(v186, (uint64_t)v197);
        }
        else
        {
          std::vector<std::vector<ClipperLib::IntPoint>>::__construct_one_at_end[abi:ne180100]<std::vector<ClipperLib::IntPoint> const&>((uint64_t)v186, (uint64_t)v197);
          unint64_t result = v119 + 24;
        }
        goto LABEL_258;
      }
      if (v112)
      {
        LODWORD(v201[0]) = 0;
        uint64_t v23 = (void **)((char *)this + 64);
        if ((int)v34 >= 3)
        {
          int v120 = 2;
          do
            ClipperLib::ClipperOffset::OffsetPoint(this, v120++ - 1, (int *)v201, *(_DWORD *)(v32 + 72));
          while (v34 != v120);
          int v112 = *(_DWORD *)(v32 + 76);
        }
        if (v112 == 2)
        {
          float64x2_t v121 = vmlaq_f64(vcvtq_f64_s64(*(int64x2_t *)(*((void *)this + 5) + 24 * (int)v51)), v196, *(float64x2_t *)(*((void *)this + 11) + 16 * (int)v51));
          int64x2_t v122 = vcvtq_s64_f64(vaddq_f64(v121, (float64x2_t)vbslq_s8((int8x16_t)vcltzq_f64(v121), v194, v195)));
          v124 = (int64x2_t *)*((void *)this + 9);
          v123 = (int64x2_t *)*((void *)this + 10);
          if (v124 >= v123)
          {
            v131 = (int64x2_t *)*v197;
            unint64_t v132 = 0xAAAAAAAAAAAAAAABLL * (((char *)v124 - (unsigned char *)*v197) >> 3);
            unint64_t v133 = v132 + 1;
            if (v132 + 1 > 0xAAAAAAAAAAAAAAALL) {
              goto LABEL_263;
            }
            unint64_t v134 = 0xAAAAAAAAAAAAAAABLL * (((char *)v123 - (char *)v131) >> 3);
            if (2 * v134 > v133) {
              unint64_t v133 = 2 * v134;
            }
            if (v134 >= 0x555555555555555) {
              unint64_t v135 = 0xAAAAAAAAAAAAAAALL;
            }
            else {
              unint64_t v135 = v133;
            }
            if (v135)
            {
              *(int64x2_t *)v190 = v122;
              v136 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::IntPoint>>((uint64_t)this + 80, v135);
              int64x2_t v122 = *(int64x2_t *)v190;
              v137 = v136;
              v131 = (int64x2_t *)*((void *)this + 8);
              v124 = (int64x2_t *)*((void *)this + 9);
            }
            else
            {
              v137 = 0;
            }
            v138 = (int64x2_t *)&v137[24 * v132];
            int64x2_t *v138 = v122;
            v138[1].i64[0] = _D12;
            v139 = v138;
            if (v124 != v131)
            {
              do
              {
                int64x2_t v140 = *(int64x2_t *)((char *)v124 - 24);
                v139[-1].i64[1] = v124[-1].i64[1];
                *(int64x2_t *)((char *)v139 - 24) = v140;
                v139 = (int64x2_t *)((char *)v139 - 24);
                v124 = (int64x2_t *)((char *)v124 - 24);
              }
              while (v124 != v131);
              v131 = (int64x2_t *)*v197;
            }
            v123 = (int64x2_t *)&v137[24 * v135];
            v125 = (int64x2_t *)((char *)v138 + 24);
            *((void *)this + 8) = v139;
            *((void *)this + 9) = (char *)v138 + 24;
            *((void *)this + 10) = v123;
            if (v131)
            {
              operator delete(v131);
              v123 = *v24;
            }
          }
          else
          {
            int64x2_t *v124 = v122;
            v124[1].i64[0] = _D12;
            v125 = (int64x2_t *)((char *)v124 + 24);
          }
          *((void *)this + 9) = v125;
          float64x2_t v141 = vmlsq_f64(vcvtq_f64_s64(*(int64x2_t *)(*((void *)this + 5) + 24 * (int)v51)), v196, *(float64x2_t *)(*((void *)this + 11) + 16 * (int)v51));
          int64x2_t v142 = vcvtq_s64_f64(vaddq_f64(v141, (float64x2_t)vbslq_s8((int8x16_t)vcltzq_f64(v141), v194, v195)));
          if (v125 >= v123)
          {
            v144 = (int64x2_t *)*v197;
            unint64_t v145 = 0xAAAAAAAAAAAAAAABLL * (((char *)v125 - (unsigned char *)*v197) >> 3);
            unint64_t v146 = v145 + 1;
            if (v145 + 1 > 0xAAAAAAAAAAAAAAALL) {
LABEL_262:
            }
              std::vector<ClipperLib::IntPoint>::__throw_length_error[abi:ne180100]();
            unint64_t v147 = 0xAAAAAAAAAAAAAAABLL * (((char *)v123 - (char *)v144) >> 3);
            if (2 * v147 > v146) {
              unint64_t v146 = 2 * v147;
            }
            if (v147 >= 0x555555555555555) {
              unint64_t v148 = 0xAAAAAAAAAAAAAAALL;
            }
            else {
              unint64_t v148 = v146;
            }
            if (v148)
            {
              *(int64x2_t *)v191 = v142;
              v149 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::IntPoint>>((uint64_t)this + 80, v148);
              int64x2_t v142 = *(int64x2_t *)v191;
              v150 = v149;
              v144 = (int64x2_t *)*((void *)this + 8);
              v125 = (int64x2_t *)*((void *)this + 9);
            }
            else
            {
              v150 = 0;
            }
            v151 = (int64x2_t *)&v150[24 * v145];
            int64x2_t *v151 = v142;
            v151[1].i64[0] = _D12;
            v152 = v151;
            if (v125 == v144)
            {
              uint64_t v23 = (void **)((char *)this + 64);
            }
            else
            {
              uint64_t v23 = (void **)((char *)this + 64);
              do
              {
                int64x2_t v153 = *(int64x2_t *)((char *)v125 - 24);
                v152[-1].i64[1] = v125[-1].i64[1];
                *(int64x2_t *)((char *)v152 - 24) = v153;
                v152 = (int64x2_t *)((char *)v152 - 24);
                v125 = (int64x2_t *)((char *)v125 - 24);
              }
              while (v125 != v144);
              v144 = (int64x2_t *)*v197;
            }
            v143 = &v151[1].i8[8];
            *((void *)this + 8) = v152;
            *((void *)this + 9) = (char *)v151 + 24;
            *((void *)this + 10) = &v150[24 * v148];
            if (v144) {
              operator delete(v144);
            }
          }
          else
          {
            int64x2_t *v125 = v142;
            v125[1].i64[0] = _D12;
            v143 = &v125[1].i8[8];
          }
          *((void *)this + 9) = v143;
        }
        else
        {
          *((void *)this + 15) = 0;
          *(float64x2_t *)(*((void *)this + 11) + 16 * (int)v51) = vnegq_f64(*(float64x2_t *)(*((void *)this + 11)
                                                                                                + 16 * (int)v51));
          int v130 = v34 - 1;
          if (v112 == 3) {
            ClipperLib::ClipperOffset::DoSquare(this, v130, v189);
          }
          else {
            ClipperLib::ClipperOffset::DoRound(this, v130, v189);
          }
        }
        if ((int)v34 >= 2)
        {
          v154 = *v199;
          unint64_t v155 = (v34 - 1);
          do
          {
            BOOL v129 = v155 > 1;
            v154[v155] = vnegq_f64(v154[(v155 - 1)]);
            --v155;
          }
          while (v129);
        }
        float64x2_t **v199 = vnegq_f64((*v199)[1]);
        LODWORD(v201[0]) = v34 - 1;
        if ((int)v34 > 2)
        {
          do
          {
            LODWORD(v51) = v51 - 1;
            ClipperLib::ClipperOffset::OffsetPoint(this, v51, (int *)v201, *(_DWORD *)(v32 + 72));
          }
          while (v51 > 1);
        }
        int v156 = *(_DWORD *)(v32 + 76);
        if (v156 == 2)
        {
          float64x2_t v157 = vmlsq_f64(vcvtq_f64_s64(*(int64x2_t *)*((void *)this + 5)), v196, *(float64x2_t *)*((void *)this + 11));
          int64x2_t v158 = vcvtq_s64_f64(vaddq_f64(v157, (float64x2_t)vbslq_s8((int8x16_t)vcltzq_f64(v157), v194, v195)));
          v160 = (int64x2_t *)*((void *)this + 9);
          v159 = (int64x2_t *)*((void *)this + 10);
          v161 = v186;
          if (v160 >= v159)
          {
            v163 = (int64x2_t *)*v23;
            unint64_t v164 = 0xAAAAAAAAAAAAAAABLL * (((char *)v160 - (unsigned char *)*v23) >> 3);
            unint64_t v165 = v164 + 1;
            if (v164 + 1 > 0xAAAAAAAAAAAAAAALL) {
              goto LABEL_263;
            }
            unint64_t v166 = 0xAAAAAAAAAAAAAAABLL * (((char *)v159 - (char *)v163) >> 3);
            if (2 * v166 > v165) {
              unint64_t v165 = 2 * v166;
            }
            if (v166 >= 0x555555555555555) {
              unint64_t v167 = 0xAAAAAAAAAAAAAAALL;
            }
            else {
              unint64_t v167 = v165;
            }
            if (v167)
            {
              *(int64x2_t *)v192 = v158;
              v168 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::IntPoint>>((uint64_t)this + 80, v167);
              int64x2_t v158 = *(int64x2_t *)v192;
              v169 = v168;
              v163 = (int64x2_t *)*((void *)this + 8);
              v160 = (int64x2_t *)*((void *)this + 9);
            }
            else
            {
              v169 = 0;
            }
            v170 = (int64x2_t *)&v169[24 * v164];
            int64x2_t *v170 = v158;
            v170[1].i64[0] = _D12;
            v171 = v170;
            if (v160 != v163)
            {
              do
              {
                int64x2_t v172 = *(int64x2_t *)((char *)v160 - 24);
                v171[-1].i64[1] = v160[-1].i64[1];
                *(int64x2_t *)((char *)v171 - 24) = v172;
                v171 = (int64x2_t *)((char *)v171 - 24);
                v160 = (int64x2_t *)((char *)v160 - 24);
              }
              while (v160 != v163);
              v163 = (int64x2_t *)*v23;
            }
            v159 = (int64x2_t *)&v169[24 * v167];
            v162 = (int64x2_t *)((char *)v170 + 24);
            *((void *)this + 8) = v171;
            *((void *)this + 9) = (char *)v170 + 24;
            *((void *)this + 10) = v159;
            if (v163)
            {
              operator delete(v163);
              v159 = *v24;
            }
          }
          else
          {
            int64x2_t *v160 = v158;
            v160[1].i64[0] = _D12;
            v162 = (int64x2_t *)((char *)v160 + 24);
          }
          *((void *)this + 9) = v162;
          float64x2_t v173 = vmlaq_f64(vcvtq_f64_s64(*(int64x2_t *)*((void *)this + 5)), v196, *(float64x2_t *)*((void *)this + 11));
          int64x2_t v174 = vcvtq_s64_f64(vaddq_f64(v173, (float64x2_t)vbslq_s8((int8x16_t)vcltzq_f64(v173), v194, v195)));
          if (v162 >= v159)
          {
            v176 = (int64x2_t *)*v23;
            unint64_t v177 = 0xAAAAAAAAAAAAAAABLL * (((char *)v162 - (unsigned char *)*v23) >> 3);
            unint64_t v178 = v177 + 1;
            if (v177 + 1 > 0xAAAAAAAAAAAAAAALL) {
LABEL_263:
            }
              std::vector<ClipperLib::IntPoint>::__throw_length_error[abi:ne180100]();
            unint64_t v179 = 0xAAAAAAAAAAAAAAABLL * (((char *)v159 - (char *)v176) >> 3);
            if (2 * v179 > v178) {
              unint64_t v178 = 2 * v179;
            }
            if (v179 >= 0x555555555555555) {
              unint64_t v180 = 0xAAAAAAAAAAAAAAALL;
            }
            else {
              unint64_t v180 = v178;
            }
            if (v180)
            {
              *(int64x2_t *)v193 = v174;
              v181 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::IntPoint>>((uint64_t)this + 80, v180);
              int64x2_t v174 = *(int64x2_t *)v193;
              v182 = v181;
              v176 = (int64x2_t *)*((void *)this + 8);
              v162 = (int64x2_t *)*((void *)this + 9);
            }
            else
            {
              v182 = 0;
            }
            v183 = (int64x2_t *)&v182[24 * v177];
            int64x2_t *v183 = v174;
            v183[1].i64[0] = _D12;
            v184 = v183;
            if (v162 != v176)
            {
              do
              {
                int64x2_t v185 = *(int64x2_t *)((char *)v162 - 24);
                v184[-1].i64[1] = v162[-1].i64[1];
                *(int64x2_t *)((char *)v184 - 24) = v185;
                v184 = (int64x2_t *)((char *)v184 - 24);
                v162 = (int64x2_t *)((char *)v162 - 24);
              }
              while (v162 != v176);
              v176 = (int64x2_t *)*v23;
            }
            v175 = &v183[1].i8[8];
            *((void *)this + 8) = v184;
            *((void *)this + 9) = (char *)v183 + 24;
            *((void *)this + 10) = &v182[24 * v180];
            if (v176) {
              operator delete(v176);
            }
          }
          else
          {
            int64x2_t *v162 = v174;
            v162[1].i64[0] = _D12;
            v175 = &v162[1].i8[8];
          }
          *((void *)this + 9) = v175;
        }
        else
        {
          *((void *)this + 15) = 0;
          v161 = v186;
          if (v156 == 3) {
            ClipperLib::ClipperOffset::DoSquare(this, 0, 1);
          }
          else {
            ClipperLib::ClipperOffset::DoRound(this, 0, 1);
          }
        }
        unint64_t v114 = *((void *)this + 3);
        v115 = v161;
        uint64_t v116 = (uint64_t)v23;
        if (v114 >= *((void *)this + 4)) {
          goto LABEL_257;
        }
        goto LABEL_256;
      }
      LODWORD(v201[0]) = v34 - 1;
      uint64_t v23 = (void **)((char *)this + 64);
      if ((int)v34 >= 1)
      {
        int v113 = 0;
        do
          ClipperLib::ClipperOffset::OffsetPoint(this, v113++, (int *)v201, *(_DWORD *)(v32 + 72));
        while (v34 != v113);
      }
LABEL_152:
      unint64_t v114 = *((void *)this + 3);
      if (v114 >= *((void *)this + 4))
      {
        v115 = v186;
        uint64_t v116 = (uint64_t)v23;
LABEL_257:
        unint64_t result = std::vector<std::vector<ClipperLib::IntPoint>>::__push_back_slow_path<std::vector<ClipperLib::IntPoint> const&>(v115, v116);
        goto LABEL_258;
      }
      v115 = v186;
      uint64_t v116 = (uint64_t)v23;
LABEL_256:
      std::vector<std::vector<ClipperLib::IntPoint>>::__construct_one_at_end[abi:ne180100]<std::vector<ClipperLib::IntPoint> const&>((uint64_t)v115, v116);
      unint64_t result = v114 + 24;
LABEL_258:
      *((void *)this + 3) = result;
      double v20 = a2;
LABEL_259:
      ++v21;
      uint64_t v19 = *((void *)this + 27);
    }
    while (v21 < (int)((unint64_t)(*((void *)this + 28) - v19) >> 3));
  }
  return result;
}

void ClipperLib::Clipper::~Clipper(ClipperLib::Clipper *this)
{
  *(void *)this = &unk_1F3555D08;
  unint64_t v2 = (ClipperLib::Clipper *)((char *)this + 144);
  *((void *)this + 18) = off_1F3555D50;
  std::__list_imp<long long>::clear((void *)this + 11);
  unint64_t v3 = (void *)*((void *)this + 7);
  if (v3)
  {
    *((void *)this + 8) = v3;
    operator delete(v3);
  }
  uint64_t v4 = (void *)*((void *)this + 4);
  if (v4)
  {
    *((void *)this + 5) = v4;
    operator delete(v4);
  }
  uint64_t v5 = (void *)*((void *)this + 1);
  if (v5)
  {
    *((void *)this + 2) = v5;
    operator delete(v5);
  }
  ClipperLib::ClipperBase::~ClipperBase(v2);
}

{
  ClipperLib::ClipperBase *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t vars8;

  *(void *)this = &unk_1F3555D08;
  unint64_t v2 = (ClipperLib::Clipper *)((char *)this + 144);
  *((void *)this + 18) = off_1F3555D50;
  std::__list_imp<long long>::clear((void *)this + 11);
  unint64_t v3 = (void *)*((void *)this + 7);
  if (v3)
  {
    *((void *)this + 8) = v3;
    operator delete(v3);
  }
  uint64_t v4 = (void *)*((void *)this + 4);
  if (v4)
  {
    *((void *)this + 5) = v4;
    operator delete(v4);
  }
  uint64_t v5 = (void *)*((void *)this + 1);
  if (v5)
  {
    *((void *)this + 2) = v5;
    operator delete(v5);
  }
  ClipperLib::ClipperBase::~ClipperBase(v2);
  JUMPOUT(0x1E018DFE0);
}

void ClipperLib::ClipperOffset::Execute(ClipperLib::ClipperOffset *this, void **a2, double a3)
{
  ClipperLib::PolyTree::Clear((ClipperLib::PolyTree *)a2);
  ClipperLib::ClipperOffset::FixOrientations(this);
  ClipperLib::ClipperOffset::DoOffset(this, a3);
  uint64_t v40 = 0;
  uint64_t v41 = 0;
  uint64_t v42 = 0;
  uint64_t v44 = 0;
  uint64_t v45 = 0;
  uint64_t v46 = 0;
  uint64_t v48 = 0;
  uint64_t v49 = 0;
  uint64_t v47 = 0;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v25 = &unk_1F3555D08;
  *(_OWORD *)long long v26 = 0u;
  *(_OWORD *)uint64_t v27 = 0u;
  long long v28 = 0u;
  *(_OWORD *)long long v29 = 0u;
  uint64_t v30 = 0;
  v31[0] = v31;
  v31[1] = v31;
  v31[2] = 0;
  char v32 = 0;
  char v39 = 0;
  char v33 = 0;
  char v34 = 0;
  __int16 v43 = 0;
  uint64_t v35 = 0;
  uint64_t v36 = off_1F3555D50;
  ClipperLib::ClipperBase::AddPaths((uint64_t)&v36, (uint64_t *)this + 2, 0, 1);
  if (a3 <= 0.0)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    ClipperLib::ClipperBase::GetBounds((ClipperLib::ClipperBase *)((char *)&v26[-1] + *(v25 - 3)), (uint64_t)&v23);
    std::vector<ClipperLib::IntPoint>::vector(__p, 4uLL);
    uint64_t v6 = *((void *)&v23 + 1);
    uint64_t v7 = v23 - 10;
    uint64_t v8 = v24;
    uint64_t v9 = *((void *)&v24 + 1) + 10;
    unint64_t v10 = __p[0];
    *(void *)__p[0] = v23 - 10;
    v10[1] = v9;
    v8 += 10;
    v10[3] = v8;
    v10[4] = v9;
    __asm { FMOV            V0.2S, #-1.0 }
    unint64_t v10[2] = _D0;
    v10[5] = _D0;
    v6 -= 10;
    v10[6] = v8;
    v10[7] = v6;
    v10[8] = _D0;
    v10[9] = v7;
    v10[10] = v6;
    v10[11] = _D0;
    ClipperLib::ClipperBase::AddPath((uint64_t)&v26[-1] + *(v25 - 3), (uint64_t)__p, 0, 1);
    char v33 = 1;
    ClipperLib::Clipper::Execute((uint64_t)&v25, 1, a2, 3, 3);
    double v16 = a2[4];
    double v17 = (char *)(a2 + 4);
    if ((((unsigned char *)a2[5] - v16) & 0x7FFFFFFF8) == 8
      && (uint64_t v18 = *(void *)v16,
          unint64_t v19 = *(void *)(*(void *)v16 + 40) - *(void *)(*(void *)v16 + 32),
          (int)(v19 >> 3) >= 1))
    {
      std::vector<ClipperLib::PolyNode *>::reserve(a2 + 4, (v19 >> 3));
      **(void **)double v17 = **(void **)(v18 + 32);
      *(void *)(**(void **)v17 + 56) = *(void *)(v18 + 56);
      uint64_t v20 = *(void *)(v18 + 32);
      if ((int)((unint64_t)(*(void *)(v18 + 40) - v20) >> 3) >= 2)
      {
        uint64_t v21 = 1;
        do
        {
          ClipperLib::PolyNode::AddChild((ClipperLib::PolyNode *)a2, *(ClipperLib::PolyNode **)(v20 + 8 * v21++));
          uint64_t v20 = *(void *)(v18 + 32);
        }
        while (v21 < (int)((unint64_t)(*(void *)(v18 + 40) - v20) >> 3));
      }
    }
    else
    {
      ClipperLib::PolyTree::Clear((ClipperLib::PolyTree *)a2);
    }
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
  }
  else
  {
    ClipperLib::Clipper::Execute((uint64_t)&v25, 1, a2, 2, 2);
  }
  long long v25 = &unk_1F3555D08;
  uint64_t v36 = off_1F3555D50;
  std::__list_imp<long long>::clear(v31);
  if (v29[0])
  {
    v29[1] = v29[0];
    operator delete(v29[0]);
  }
  if (v27[1])
  {
    *(void **)&long long v28 = v27[1];
    operator delete(v27[1]);
  }
  if (v26[0])
  {
    v26[1] = v26[0];
    operator delete(v26[0]);
  }
  ClipperLib::ClipperBase::~ClipperBase((ClipperLib::ClipperBase *)&v36);
}

void sub_1DB286708(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
  if (__p) {
    operator delete(__p);
  }
  ClipperLib::Clipper::~Clipper((ClipperLib::Clipper *)&a17);
  _Unwind_Resume(a1);
}

void std::vector<ClipperLib::DoublePoint>::reserve(void **a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (unsigned char *)*a1) >> 4)
  {
    if (a2 >> 60) {
      std::vector<ClipperLib::IntPoint>::__throw_length_error[abi:ne180100]();
    }
    int64_t v5 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    uint64_t v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::DoublePoint>>(v3, a2);
    uint64_t v7 = &v6[v5 & 0xFFFFFFFFFFFFFFF0];
    uint64_t v9 = &v6[16 * v8];
    double v11 = (char *)*a1;
    unint64_t v10 = (char *)a1[1];
    double v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        *((_OWORD *)v12 - 1) = *((_OWORD *)v10 - 1);
        v12 -= 16;
        v10 -= 16;
      }
      while (v10 != v11);
      unint64_t v10 = (char *)*a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
    {
      operator delete(v10);
    }
  }
}

void ClipperLib::ClipperOffset::OffsetPoint(ClipperLib::ClipperOffset *this, int a2, int *a3, int a4)
{
  uint64_t v4 = a3;
  uint64_t v7 = *((void *)this + 11);
  uint64_t v8 = a2;
  uint64_t v9 = (double *)(v7 + 16 * a2);
  double v11 = *v9;
  double v10 = v9[1];
  float64x2_t v12 = *(float64x2_t *)(v7 + 16 * *a3);
  double v13 = vmlad_n_f64(vmuld_lane_f64(-*v9, v12, 1), v10, v12.f64[0]);
  *((double *)this + 15) = v13;
  double v14 = *((double *)this + 14);
  double v15 = 1.0;
  if (fabs(v13 * v14) >= 1.0)
  {
    if (v13 > 1.0 || (double v15 = -1.0, v13 < -1.0))
    {
      *((double *)this + 15) = v15;
      double v13 = v15;
    }
LABEL_8:
    if (v13 * v14 < 0.0)
    {
      uint64_t v27 = (int64x2_t *)*((void *)this + 10);
      long long v28 = (void **)((char *)this + 64);
      float64x2_t v29 = vmlaq_n_f64(vcvtq_f64_s64(*(int64x2_t *)(*((void *)this + 5) + 24 * a2)), *(float64x2_t *)(*((void *)this + 11) + 16 * *a3), v14);
      __asm
      {
        FMOV            V3.2D, #0.5
        FMOV            V4.2D, #-0.5
      }
      int64x2_t v32 = vcvtq_s64_f64(vaddq_f64(v29, (float64x2_t)vbslq_s8((int8x16_t)vcltzq_f64(v29), _Q4, _Q3)));
      char v33 = (int64x2_t *)*((void *)this + 9);
      int8x16_t v90 = _Q4;
      int8x16_t v91 = _Q3;
      if (v33 >= v27)
      {
        long long v37 = (int64x2_t *)*v28;
        unint64_t v38 = 0xAAAAAAAAAAAAAAABLL * (((char *)v33 - (unsigned char *)*v28) >> 3);
        unint64_t v39 = v38 + 1;
        if (v38 + 1 > 0xAAAAAAAAAAAAAAALL) {
          goto LABEL_84;
        }
        unint64_t v40 = 0xAAAAAAAAAAAAAAABLL * (((char *)v27 - (char *)v37) >> 3);
        if (2 * v40 > v39) {
          unint64_t v39 = 2 * v40;
        }
        if (v40 >= 0x555555555555555) {
          unint64_t v41 = 0xAAAAAAAAAAAAAAALL;
        }
        else {
          unint64_t v41 = v39;
        }
        if (v41)
        {
          int64x2_t v89 = v32;
          uint64_t v42 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::IntPoint>>((uint64_t)this + 80, v41);
          int64x2_t v32 = v89;
          __int16 v43 = v42;
          long long v37 = (int64x2_t *)*((void *)this + 8);
          char v33 = (int64x2_t *)*((void *)this + 9);
        }
        else
        {
          __int16 v43 = 0;
        }
        uint64_t v51 = (int64x2_t *)&v43[24 * v38];
        uint64_t v27 = (int64x2_t *)&v43[24 * v41];
        int64x2_t *v51 = v32;
        __asm { FMOV            V0.2S, #-1.0 }
        v51[1].i64[0] = _D0;
        uint64_t v35 = &v51[1].i8[8];
        if (v33 != v37)
        {
          do
          {
            int64x2_t v53 = *(int64x2_t *)((char *)v33 - 24);
            v51[-1].i64[1] = v33[-1].i64[1];
            *(int64x2_t *)((char *)v51 - 24) = v53;
            uint64_t v51 = (int64x2_t *)((char *)v51 - 24);
            char v33 = (int64x2_t *)((char *)v33 - 24);
          }
          while (v33 != v37);
          long long v37 = (int64x2_t *)*v28;
        }
        *((void *)this + 8) = v51;
        *((void *)this + 9) = v35;
        *((void *)this + 10) = v27;
        if (v37)
        {
          operator delete(v37);
          uint64_t v27 = (int64x2_t *)*((void *)this + 10);
        }
        _Q4 = v90;
        _Q3 = v91;
      }
      else
      {
        *char v33 = v32;
        __asm { FMOV            V0.2S, #-1.0 }
        v33[1].i64[0] = _D0;
        uint64_t v35 = &v33[1].i8[8];
      }
      *((void *)this + 9) = v35;
      uint64_t v54 = *((void *)this + 5) + 24 * (int)v8;
      if (v35 >= (__int8 *)v27)
      {
        unint64_t v57 = 0xAAAAAAAAAAAAAAABLL * ((v35 - (unsigned char *)*v28) >> 3);
        if (v57 + 1 > 0xAAAAAAAAAAAAAAALL) {
          goto LABEL_84;
        }
        unint64_t v58 = 0xAAAAAAAAAAAAAAABLL * (((char *)v27 - (unsigned char *)*v28) >> 3);
        uint64_t v59 = 2 * v58;
        if (2 * v58 <= v57 + 1) {
          uint64_t v59 = v57 + 1;
        }
        if (v58 >= 0x555555555555555) {
          unint64_t v60 = 0xAAAAAAAAAAAAAAALL;
        }
        else {
          unint64_t v60 = v59;
        }
        if (v60) {
          uint64_t v61 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::IntPoint>>((uint64_t)this + 80, v60);
        }
        else {
          uint64_t v61 = 0;
        }
        unint64_t v62 = &v61[24 * v57];
        uint64_t v63 = &v61[24 * v60];
        long long v64 = *(_OWORD *)v54;
        *((void *)v62 + 2) = *(void *)(v54 + 16);
        *(_OWORD *)unint64_t v62 = v64;
        double v56 = (int64x2_t *)(v62 + 24);
        double v66 = (char *)*((void *)this + 8);
        uint64_t v65 = (char *)*((void *)this + 9);
        if (v65 != v66)
        {
          do
          {
            long long v67 = *(_OWORD *)(v65 - 24);
            *((void *)v62 - 1) = *((void *)v65 - 1);
            *(_OWORD *)(v62 - 24) = v67;
            v62 -= 24;
            v65 -= 24;
          }
          while (v65 != v66);
          uint64_t v65 = (char *)*v28;
        }
        *((void *)this + 8) = v62;
        *((void *)this + 9) = v56;
        *((void *)this + 10) = v63;
        if (v65) {
          operator delete(v65);
        }
        _Q4 = v90;
        _Q3 = v91;
      }
      else
      {
        long long v55 = *(_OWORD *)v54;
        *((void *)v35 + 2) = *(void *)(v54 + 16);
        *(_OWORD *)uint64_t v35 = v55;
        double v56 = (int64x2_t *)(v35 + 24);
      }
      *((void *)this + 9) = v56;
      unint64_t v68 = *((void *)this + 10);
      float64x2_t v69 = vmlaq_n_f64(vcvtq_f64_s64(*(int64x2_t *)(*((void *)this + 5) + 24 * (int)v8)), *(float64x2_t *)(*((void *)this + 11) + 16 * v8), *((double *)this + 14));
      int64x2_t v70 = vcvtq_s64_f64(vaddq_f64(v69, (float64x2_t)vbslq_s8((int8x16_t)vcltzq_f64(v69), _Q4, _Q3)));
      if ((unint64_t)v56 < v68)
      {
        *double v56 = v70;
        __asm { FMOV            V0.2S, #-1.0 }
        v56[1].i64[0] = _D0;
        uint64_t v72 = &v56[1].i8[8];
LABEL_75:
        *((void *)this + 9) = v72;
        goto LABEL_76;
      }
      uint64_t v73 = (int64x2_t *)*v28;
      unint64_t v74 = 0xAAAAAAAAAAAAAAABLL * (((char *)v56 - (unsigned char *)*v28) >> 3);
      unint64_t v75 = v74 + 1;
      if (v74 + 1 <= 0xAAAAAAAAAAAAAAALL)
      {
        unint64_t v76 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v68 - (void)v73) >> 3);
        if (2 * v76 > v75) {
          unint64_t v75 = 2 * v76;
        }
        if (v76 >= 0x555555555555555) {
          unint64_t v77 = 0xAAAAAAAAAAAAAAALL;
        }
        else {
          unint64_t v77 = v75;
        }
        if (v77)
        {
          int64x2_t v93 = v70;
          double v78 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::IntPoint>>((uint64_t)this + 80, v77);
          int64x2_t v70 = v93;
          double v79 = v78;
          uint64_t v73 = (int64x2_t *)*((void *)this + 8);
          double v56 = (int64x2_t *)*((void *)this + 9);
        }
        else
        {
          double v79 = 0;
        }
        double v80 = (int64x2_t *)&v79[24 * v74];
        uint64_t v81 = &v79[24 * v77];
        *double v80 = v70;
        __asm { FMOV            V0.2S, #-1.0 }
        v80[1].i64[0] = _D0;
        uint64_t v72 = &v80[1].i8[8];
        if (v56 != v73)
        {
          do
          {
            int64x2_t v83 = *(int64x2_t *)((char *)v56 - 24);
            v80[-1].i64[1] = v56[-1].i64[1];
            *(int64x2_t *)((char *)v80 - 24) = v83;
            double v80 = (int64x2_t *)((char *)v80 - 24);
            double v56 = (int64x2_t *)((char *)v56 - 24);
          }
          while (v56 != v73);
          uint64_t v73 = (int64x2_t *)*v28;
        }
        *((void *)this + 8) = v80;
        *((void *)this + 9) = v72;
        *((void *)this + 10) = v81;
        if (v73) {
          operator delete(v73);
        }
        goto LABEL_75;
      }
LABEL_84:
      std::vector<ClipperLib::IntPoint>::__throw_length_error[abi:ne180100]();
    }
    if (a4)
    {
      if (a4 == 1)
      {
        ClipperLib::ClipperOffset::DoRound(this, a2, *a3);
        goto LABEL_76;
      }
      if (a4 != 2)
      {
LABEL_76:
        int *v4 = a2;
        return;
      }
      a3 = (int *)*a3;
      double v36 = *(double *)(*((void *)this + 11) + 16 * a2 + 8)
          * *(double *)(*((void *)this + 11) + 16 * (void)a3 + 8)
          + *(double *)(*((void *)this + 11) + 16 * a2) * *(double *)(*((void *)this + 11) + 16 * (void)a3)
          + 1.0;
      if (v36 >= *((double *)this + 18))
      {
        ClipperLib::ClipperOffset::DoMiter(this, a2, (int)a3, v36);
        goto LABEL_76;
      }
    }
    else
    {
      LODWORD(a3) = *a3;
    }
    ClipperLib::ClipperOffset::DoSquare(this, a2, (int)a3);
    goto LABEL_76;
  }
  if (v10 * v12.f64[1] + v12.f64[0] * v11 <= 0.0) {
    goto LABEL_8;
  }
  unint64_t v16 = *((void *)this + 10);
  float64x2_t v17 = vmlaq_n_f64(vcvtq_f64_s64(*(int64x2_t *)(*((void *)this + 5) + 24 * a2)), v12, v14);
  __asm
  {
    FMOV            V1.2D, #0.5
    FMOV            V3.2D, #-0.5
  }
  int64x2_t v24 = vcvtq_s64_f64(vaddq_f64(v17, (float64x2_t)vbslq_s8((int8x16_t)vcltzq_f64(v17), _Q3, _Q1)));
  long long v25 = (int64x2_t *)*((void *)this + 9);
  if ((unint64_t)v25 >= v16)
  {
    uint64_t v44 = (int64x2_t *)*((void *)this + 8);
    unint64_t v45 = 0xAAAAAAAAAAAAAAABLL * (((char *)v25 - (char *)v44) >> 3);
    unint64_t v46 = v45 + 1;
    if (v45 + 1 > 0xAAAAAAAAAAAAAAALL) {
      std::vector<ClipperLib::IntPoint>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v47 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v16 - (void)v44) >> 3);
    if (2 * v47 > v46) {
      unint64_t v46 = 2 * v47;
    }
    if (v47 >= 0x555555555555555) {
      unint64_t v48 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v48 = v46;
    }
    if (v48)
    {
      int64x2_t v92 = v24;
      uint64_t v49 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::IntPoint>>((uint64_t)this + 80, v48);
      int64x2_t v24 = v92;
      float64x2_t v50 = v49;
      uint64_t v44 = (int64x2_t *)*((void *)this + 8);
      long long v25 = (int64x2_t *)*((void *)this + 9);
    }
    else
    {
      float64x2_t v50 = 0;
    }
    uint64_t v84 = (int64x2_t *)&v50[24 * v45];
    uint64_t v85 = &v50[24 * v48];
    *uint64_t v84 = v24;
    __asm { FMOV            V0.2S, #-1.0 }
    v84[1].i64[0] = _D0;
    unint64_t v87 = &v84[1].i8[8];
    if (v25 != v44)
    {
      do
      {
        int64x2_t v88 = *(int64x2_t *)((char *)v25 - 24);
        v84[-1].i64[1] = v25[-1].i64[1];
        *(int64x2_t *)((char *)v84 - 24) = v88;
        uint64_t v84 = (int64x2_t *)((char *)v84 - 24);
        long long v25 = (int64x2_t *)((char *)v25 - 24);
      }
      while (v25 != v44);
      uint64_t v44 = (int64x2_t *)*((void *)this + 8);
    }
    *((void *)this + 8) = v84;
    *((void *)this + 9) = v87;
    *((void *)this + 10) = v85;
    if (v44) {
      operator delete(v44);
    }
    *((void *)this + 9) = v87;
  }
  else
  {
    *long long v25 = v24;
    __asm { FMOV            V0.2S, #-1.0 }
    v25[1].i64[0] = _D0;
    *((void *)this + 9) = (char *)v25 + 24;
  }
}

void ClipperLib::ClipperOffset::DoSquare(ClipperLib::ClipperOffset *this, int a2, int a3)
{
  uint64_t v5 = *((void *)this + 11);
  uint64_t v6 = (double *)(v5 + 16 * a3);
  double v7 = *v6;
  double v8 = v6[1];
  long double v9 = atan2(*((long double *)this + 15), v8 * *(double *)(v5 + 16 * a2 + 8) + *v6 * *(double *)(v5 + 16 * a2));
  double v10 = tan(v9 * 0.25);
  double v11 = (int64x2_t *)*((void *)this + 10);
  float64x2_t v12 = (uint64_t *)(*((void *)this + 5) + 24 * a2);
  double v13 = *((double *)this + 14);
  double v14 = (double)*v12 + v13 * (v7 - v8 * v10);
  if (v14 >= 0.0) {
    double v15 = 0.5;
  }
  else {
    double v15 = -0.5;
  }
  unint64_t v16 = (void **)((char *)this + 64);
  uint64_t v17 = (uint64_t)(v14 + v15);
  double v18 = (double)v12[1] + v13 * (v8 + v7 * v10);
  if (v18 >= 0.0) {
    double v19 = 0.5;
  }
  else {
    double v19 = -0.5;
  }
  uint64_t v20 = (uint64_t)(v18 + v19);
  uint64_t v21 = (uint64_t *)*((void *)this + 9);
  if (v21 >= (uint64_t *)v11)
  {
    long long v28 = (uint64_t *)*v16;
    unint64_t v29 = 0xAAAAAAAAAAAAAAABLL * (((char *)v21 - (unsigned char *)*v16) >> 3);
    unint64_t v30 = v29 + 1;
    if (v29 + 1 > 0xAAAAAAAAAAAAAAALL) {
      goto LABEL_41;
    }
    double v56 = v10;
    unint64_t v31 = 0xAAAAAAAAAAAAAAABLL * (((char *)v11 - (char *)v28) >> 3);
    if (2 * v31 > v30) {
      unint64_t v30 = 2 * v31;
    }
    if (v31 >= 0x555555555555555) {
      unint64_t v32 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v32 = v30;
    }
    if (v32)
    {
      char v33 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::IntPoint>>((uint64_t)this + 80, v32);
      long long v28 = (uint64_t *)*((void *)this + 8);
      uint64_t v21 = (uint64_t *)*((void *)this + 9);
    }
    else
    {
      char v33 = 0;
    }
    char v34 = (uint64_t *)&v33[24 * v29];
    double v11 = (int64x2_t *)&v33[24 * v32];
    *char v34 = v17;
    v34[1] = v20;
    __asm { FMOV            V0.2S, #-1.0 }
    v34[2] = _D0;
    uint64_t v27 = (int64x2_t *)(v34 + 3);
    if (v21 != v28)
    {
      do
      {
        long long v36 = *(_OWORD *)(v21 - 3);
        *(v34 - 1) = *(v21 - 1);
        *(_OWORD *)(v34 - 3) = v36;
        v34 -= 3;
        v21 -= 3;
      }
      while (v21 != v28);
      long long v28 = (uint64_t *)*v16;
    }
    *((void *)this + 8) = v34;
    *((void *)this + 9) = v27;
    *((void *)this + 10) = v11;
    if (v28)
    {
      operator delete(v28);
      double v11 = (int64x2_t *)*((void *)this + 10);
    }
    double v10 = v56;
  }
  else
  {
    *uint64_t v21 = v17;
    v21[1] = v20;
    __asm { FMOV            V1.2S, #-1.0 }
    v21[2] = _D1;
    uint64_t v27 = (int64x2_t *)(v21 + 3);
  }
  *((void *)this + 9) = v27;
  float64x2_t v37 = *(float64x2_t *)(*((void *)this + 11) + 16 * a2);
  *(void *)&v38.f64[0] = vdupq_laneq_s64((int64x2_t)v37, 1).u64[0];
  v38.f64[1] = -v37.f64[0];
  float64x2_t v39 = vmlaq_n_f64(vcvtq_f64_s64(*(int64x2_t *)(*((void *)this + 5) + 24 * a2)), vmlaq_n_f64(v37, v38, v10), *((double *)this + 14));
  __asm
  {
    FMOV            V1.2D, #0.5
    FMOV            V3.2D, #-0.5
  }
  int64x2_t v42 = vcvtq_s64_f64(vaddq_f64(v39, (float64x2_t)vbslq_s8((int8x16_t)vcltzq_f64(v39), _Q3, _Q1)));
  if (v27 < v11)
  {
    int64x2_t *v27 = v42;
    __asm { FMOV            V0.2S, #-1.0 }
    v27[1].i64[0] = _D0;
    uint64_t v44 = &v27[1].i8[8];
    goto LABEL_40;
  }
  unint64_t v45 = (int64x2_t *)*v16;
  unint64_t v46 = 0xAAAAAAAAAAAAAAABLL * (((char *)v27 - (unsigned char *)*v16) >> 3);
  unint64_t v47 = v46 + 1;
  if (v46 + 1 > 0xAAAAAAAAAAAAAAALL) {
LABEL_41:
  }
    std::vector<ClipperLib::IntPoint>::__throw_length_error[abi:ne180100]();
  unint64_t v48 = 0xAAAAAAAAAAAAAAABLL * (((char *)v11 - (char *)v45) >> 3);
  if (2 * v48 > v47) {
    unint64_t v47 = 2 * v48;
  }
  if (v48 >= 0x555555555555555) {
    unint64_t v49 = 0xAAAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v49 = v47;
  }
  if (v49)
  {
    int64x2_t v57 = v42;
    float64x2_t v50 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::IntPoint>>((uint64_t)this + 80, v49);
    int64x2_t v42 = v57;
    uint64_t v51 = v50;
    unint64_t v45 = (int64x2_t *)*((void *)this + 8);
    uint64_t v27 = (int64x2_t *)*((void *)this + 9);
  }
  else
  {
    uint64_t v51 = 0;
  }
  uint64_t v52 = (int64x2_t *)&v51[24 * v46];
  int64x2_t v53 = &v51[24 * v49];
  int64x2_t *v52 = v42;
  __asm { FMOV            V0.2S, #-1.0 }
  v52[1].i64[0] = _D0;
  uint64_t v44 = &v52[1].i8[8];
  if (v27 != v45)
  {
    do
    {
      int64x2_t v55 = *(int64x2_t *)((char *)v27 - 24);
      v52[-1].i64[1] = v27[-1].i64[1];
      *(int64x2_t *)((char *)v52 - 24) = v55;
      uint64_t v52 = (int64x2_t *)((char *)v52 - 24);
      uint64_t v27 = (int64x2_t *)((char *)v27 - 24);
    }
    while (v27 != v45);
    unint64_t v45 = (int64x2_t *)*v16;
  }
  *((void *)this + 8) = v52;
  *((void *)this + 9) = v44;
  *((void *)this + 10) = v53;
  if (v45) {
    operator delete(v45);
  }
LABEL_40:
  *((void *)this + 9) = v44;
}

void ClipperLib::ClipperOffset::DoRound(ClipperLib::ClipperOffset *this, int a2, int a3)
{
  uint64_t v4 = *((void *)this + 11);
  uint64_t v5 = (double *)(v4 + 16 * a3);
  uint64_t v6 = a2;
  double v8 = *v5;
  double v7 = v5[1];
  int v9 = 0;
  double v10 = *((double *)this + 19)
      * fabs(atan2(*((long double *)this + 15), v7 * *(double *)(v4 + 16 * a2 + 8) + *v5 * *(double *)(v4 + 16 * a2)));
  if (v10 >= 0.0) {
    double v11 = 0.5;
  }
  else {
    double v11 = -0.5;
  }
  if ((int)(uint64_t)(v10 + v11) <= 1) {
    int v12 = 1;
  }
  else {
    int v12 = (uint64_t)(v10 + v11);
  }
  double v13 = (void **)((char *)this + 64);
  double v14 = (uint64_t *)*((void *)this + 9);
  __asm { FMOV            V8.2S, #-1.0 }
  do
  {
    uint64_t v20 = (uint64_t *)(*((void *)this + 5) + 24 * (int)v6);
    double v21 = *((double *)this + 14);
    double v22 = (double)*v20 + v8 * v21;
    if (v22 >= 0.0) {
      double v23 = 0.5;
    }
    else {
      double v23 = -0.5;
    }
    uint64_t v24 = (uint64_t)(v22 + v23);
    double v25 = (double)v20[1] + v7 * v21;
    if (v25 >= 0.0) {
      double v26 = 0.5;
    }
    else {
      double v26 = -0.5;
    }
    uint64_t v27 = (uint64_t)(v25 + v26);
    unint64_t v28 = *((void *)this + 10);
    if ((unint64_t)v14 >= v28)
    {
      unint64_t v29 = (uint64_t *)*v13;
      unint64_t v30 = 0xAAAAAAAAAAAAAAABLL * (((char *)v14 - (unsigned char *)*v13) >> 3);
      unint64_t v31 = v30 + 1;
      if (v30 + 1 > 0xAAAAAAAAAAAAAAALL) {
        goto LABEL_48;
      }
      unint64_t v32 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v28 - (void)v29) >> 3);
      if (2 * v32 > v31) {
        unint64_t v31 = 2 * v32;
      }
      if (v32 >= 0x555555555555555) {
        unint64_t v33 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v33 = v31;
      }
      if (v33)
      {
        char v34 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::IntPoint>>((uint64_t)this + 80, v33);
        unint64_t v29 = (uint64_t *)*((void *)this + 8);
        double v14 = (uint64_t *)*((void *)this + 9);
      }
      else
      {
        char v34 = 0;
      }
      uint64_t v35 = (uint64_t *)&v34[24 * v30];
      *uint64_t v35 = v24;
      v35[1] = v27;
      v35[2] = _D8;
      long long v36 = v35;
      if (v14 != v29)
      {
        do
        {
          long long v37 = *(_OWORD *)(v14 - 3);
          *(v36 - 1) = *(v14 - 1);
          *(_OWORD *)(v36 - 3) = v37;
          v36 -= 3;
          v14 -= 3;
        }
        while (v14 != v29);
        unint64_t v29 = (uint64_t *)*v13;
      }
      double v14 = v35 + 3;
      *((void *)this + 8) = v36;
      *((void *)this + 9) = v35 + 3;
      *((void *)this + 10) = &v34[24 * v33];
      if (v29) {
        operator delete(v29);
      }
    }
    else
    {
      uint64_t *v14 = v24;
      v14[1] = v27;
      v14[2] = _D8;
      v14 += 3;
    }
    *((void *)this + 9) = v14;
    double v39 = *((double *)this + 16);
    double v38 = *((double *)this + 17);
    double v40 = -(v39 * v7);
    double v7 = v7 * v38 + v8 * v39;
    double v8 = v40 + v8 * v38;
    ++v9;
  }
  while (v9 != v12);
  unint64_t v41 = *((void *)this + 10);
  float64x2_t v42 = vmlaq_n_f64(vcvtq_f64_s64(*(int64x2_t *)(*((void *)this + 5) + 24 * (int)v6)), *(float64x2_t *)(*((void *)this + 11) + 16 * v6), *((double *)this + 14));
  __asm
  {
    FMOV            V2.2D, #0.5
    FMOV            V3.2D, #-0.5
  }
  int64x2_t v45 = vcvtq_s64_f64(vaddq_f64(v42, (float64x2_t)vbslq_s8((int8x16_t)vcltzq_f64(v42), _Q3, _Q2)));
  if ((unint64_t)v14 >= v41)
  {
    unint64_t v47 = (uint64_t *)*v13;
    unint64_t v48 = 0xAAAAAAAAAAAAAAABLL * (((char *)v14 - (unsigned char *)*v13) >> 3);
    unint64_t v49 = v48 + 1;
    if (v48 + 1 > 0xAAAAAAAAAAAAAAALL) {
LABEL_48:
    }
      std::vector<ClipperLib::IntPoint>::__throw_length_error[abi:ne180100]();
    unint64_t v50 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v41 - (void)v47) >> 3);
    if (2 * v50 > v49) {
      unint64_t v49 = 2 * v50;
    }
    if (v50 >= 0x555555555555555) {
      unint64_t v51 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v51 = v49;
    }
    if (v51)
    {
      int64x2_t v57 = v45;
      uint64_t v52 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::IntPoint>>((uint64_t)this + 80, v51);
      int64x2_t v45 = v57;
      int64x2_t v53 = v52;
      unint64_t v47 = (uint64_t *)*((void *)this + 8);
      double v14 = (uint64_t *)*((void *)this + 9);
    }
    else
    {
      int64x2_t v53 = 0;
    }
    uint64_t v54 = (int64x2_t *)&v53[24 * v48];
    int64x2_t v55 = &v53[24 * v51];
    *uint64_t v54 = v45;
    v54[1].i64[0] = _D8;
    unint64_t v46 = &v54[1].i64[1];
    if (v14 != v47)
    {
      do
      {
        int64x2_t v56 = *(int64x2_t *)(v14 - 3);
        v54[-1].i64[1] = *(v14 - 1);
        *(int64x2_t *)((char *)v54 - 24) = v56;
        uint64_t v54 = (int64x2_t *)((char *)v54 - 24);
        v14 -= 3;
      }
      while (v14 != v47);
      unint64_t v47 = (uint64_t *)*v13;
    }
    *((void *)this + 8) = v54;
    *((void *)this + 9) = v46;
    *((void *)this + 10) = v55;
    if (v47) {
      operator delete(v47);
    }
  }
  else
  {
    *(int64x2_t *)double v14 = v45;
    v14[2] = _D8;
    unint64_t v46 = v14 + 3;
  }
  *((void *)this + 9) = v46;
}

void ClipperLib::ClipperOffset::DoMiter(ClipperLib::ClipperOffset *this, int a2, int a3, double a4)
{
  uint64_t v5 = (char *)this + 80;
  unint64_t v6 = *((void *)this + 10);
  float64x2_t v7 = vmlaq_n_f64(vcvtq_f64_s64(*(int64x2_t *)(*((void *)this + 5) + 24 * a2)), vaddq_f64(*(float64x2_t *)(*((void *)this + 11) + 16 * a3), *(float64x2_t *)(*((void *)this + 11) + 16 * a2)), *((double *)this + 14) / a4);
  __asm
  {
    FMOV            V2.2D, #0.5
    FMOV            V3.2D, #-0.5
  }
  int64x2_t v14 = vcvtq_s64_f64(vaddq_f64(v7, (float64x2_t)vbslq_s8((int8x16_t)vcltzq_f64(v7), _Q3, _Q2)));
  double v15 = (int64x2_t *)*((void *)this + 9);
  if ((unint64_t)v15 >= v6)
  {
    double v18 = (void **)((char *)this + 64);
    double v19 = (int64x2_t *)*((void *)this + 8);
    unint64_t v20 = 0xAAAAAAAAAAAAAAABLL * (((char *)v15 - (char *)v19) >> 3);
    unint64_t v21 = v20 + 1;
    if (v20 + 1 > 0xAAAAAAAAAAAAAAALL) {
      std::vector<ClipperLib::IntPoint>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v22 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v6 - (void)v19) >> 3);
    if (2 * v22 > v21) {
      unint64_t v21 = 2 * v22;
    }
    if (v22 >= 0x555555555555555) {
      unint64_t v23 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v23 = v21;
    }
    if (v23)
    {
      int64x2_t v30 = v14;
      uint64_t v24 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::IntPoint>>((uint64_t)v5, v23);
      int64x2_t v14 = v30;
      double v25 = v24;
      double v19 = (int64x2_t *)*((void *)this + 8);
      double v15 = (int64x2_t *)*((void *)this + 9);
    }
    else
    {
      double v25 = 0;
    }
    double v26 = (int64x2_t *)&v25[24 * v20];
    uint64_t v27 = &v25[24 * v23];
    int64x2_t *v26 = v14;
    __asm { FMOV            V0.2S, #-1.0 }
    v26[1].i64[0] = _D0;
    uint64_t v17 = &v26[1].i8[8];
    if (v15 != v19)
    {
      do
      {
        int64x2_t v29 = *(int64x2_t *)((char *)v15 - 24);
        v26[-1].i64[1] = v15[-1].i64[1];
        *(int64x2_t *)((char *)v26 - 24) = v29;
        double v26 = (int64x2_t *)((char *)v26 - 24);
        double v15 = (int64x2_t *)((char *)v15 - 24);
      }
      while (v15 != v19);
      double v19 = (int64x2_t *)*v18;
    }
    *((void *)this + 8) = v26;
    *((void *)this + 9) = v17;
    *((void *)this + 10) = v27;
    if (v19) {
      operator delete(v19);
    }
  }
  else
  {
    int64x2_t *v15 = v14;
    __asm { FMOV            V0.2S, #-1.0 }
    v15[1].i64[0] = _D0;
    uint64_t v17 = &v15[1].i8[8];
  }
  *((void *)this + 9) = v17;
}

uint64_t *ClipperLib::ReversePaths(uint64_t *result)
{
  uint64_t v2 = *result;
  uint64_t v1 = result[1];
  if (v1 != *result)
  {
    unint64_t v3 = 0;
    do
    {
      uint64_t v4 = (unint64_t *)(v2 + 24 * v3);
      unint64_t v5 = *v4;
      unint64_t v6 = v4[1];
      unint64_t v7 = v6 - 24;
      if (v5 != v6 && v7 > v5)
      {
        unint64_t v9 = v5 + 24;
        do
        {
          uint64_t v10 = *(void *)(v9 - 8);
          long long v11 = *(_OWORD *)(v9 - 24);
          uint64_t v12 = *(void *)(v7 + 16);
          *(_OWORD *)(v9 - 24) = *(_OWORD *)v7;
          *(void *)(v9 - 8) = v12;
          *(_OWORD *)unint64_t v7 = v11;
          *(void *)(v7 + 16) = v10;
          v7 -= 24;
          BOOL v13 = v9 >= v7;
          v9 += 24;
        }
        while (!v13);
        uint64_t v2 = *result;
        uint64_t v1 = result[1];
      }
      ++v3;
    }
    while (v3 < 0xAAAAAAAAAAAAAAABLL * ((v1 - v2) >> 3));
  }
  return result;
}

void ClipperLib::SimplifyPolygon(uint64_t a1, uint64_t *a2, int a3)
{
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  uint64_t v26 = 0;
  uint64_t v28 = 0;
  uint64_t v29 = 0;
  uint64_t v27 = 0;
  long long v17 = 0u;
  long long v18 = 0u;
  unint64_t v5 = &unk_1F3555D08;
  *(_OWORD *)unint64_t v6 = 0u;
  *(_OWORD *)unint64_t v7 = 0u;
  long long v8 = 0u;
  *(_OWORD *)__p = 0u;
  uint64_t v10 = 0;
  v11[0] = v11;
  v11[1] = v11;
  unint64_t v11[2] = 0;
  char v12 = 0;
  char v19 = 0;
  char v13 = 0;
  __int16 v23 = 0;
  uint64_t v15 = 0;
  unint64_t v16 = off_1F3555D50;
  char v14 = 1;
  ClipperLib::ClipperBase::AddPath((uint64_t)&v16, a1, 0, 1);
  ClipperLib::Clipper::Execute((uint64_t)&v5, 1, a2, a3, a3);
  unint64_t v5 = &unk_1F3555D08;
  unint64_t v16 = off_1F3555D50;
  std::__list_imp<long long>::clear(v11);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if (v7[1])
  {
    *(void **)&long long v8 = v7[1];
    operator delete(v7[1]);
  }
  if (v6[0])
  {
    v6[1] = v6[0];
    operator delete(v6[0]);
  }
  ClipperLib::ClipperBase::~ClipperBase((ClipperLib::ClipperBase *)&v16);
}

void sub_1DB2877C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void ClipperLib::SimplifyPolygons(uint64_t *a1, uint64_t *a2, int a3)
{
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  uint64_t v26 = 0;
  uint64_t v28 = 0;
  uint64_t v29 = 0;
  uint64_t v27 = 0;
  long long v17 = 0u;
  long long v18 = 0u;
  unint64_t v5 = &unk_1F3555D08;
  *(_OWORD *)unint64_t v6 = 0u;
  *(_OWORD *)unint64_t v7 = 0u;
  long long v8 = 0u;
  *(_OWORD *)__p = 0u;
  uint64_t v10 = 0;
  v11[0] = v11;
  v11[1] = v11;
  unint64_t v11[2] = 0;
  char v12 = 0;
  char v19 = 0;
  char v13 = 0;
  __int16 v23 = 0;
  uint64_t v15 = 0;
  unint64_t v16 = off_1F3555D50;
  char v14 = 1;
  ClipperLib::ClipperBase::AddPaths((uint64_t)&v16, a1, 0, 1);
  ClipperLib::Clipper::Execute((uint64_t)&v5, 1, a2, a3, a3);
  unint64_t v5 = &unk_1F3555D08;
  unint64_t v16 = off_1F3555D50;
  std::__list_imp<long long>::clear(v11);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if (v7[1])
  {
    *(void **)&long long v8 = v7[1];
    operator delete(v7[1]);
  }
  if (v6[0])
  {
    v6[1] = v6[0];
    operator delete(v6[0]);
  }
  ClipperLib::ClipperBase::~ClipperBase((ClipperLib::ClipperBase *)&v16);
}

void sub_1DB287938(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void ClipperLib::SimplifyPolygons(uint64_t *a1, int a2)
{
}

double ClipperLib::DistanceFromLineSqrd(uint64_t *a1, uint64_t *a2, void *a3)
{
  uint64_t v3 = a2[1];
  double v4 = (double)(v3 - a3[1]);
  uint64_t v5 = *a3 - *a2;
  double v6 = (double)v5 * (double)a1[1] + v4 * (double)*a1 - ((double)v3 * (double)v5 + v4 * (double)*a2);
  return v6 * v6 / ((double)v5 * (double)v5 + v4 * v4);
}

BOOL ClipperLib::SlopesNearCollinear(uint64_t *a1, uint64_t *a2, uint64_t *a3, double a4)
{
  uint64_t v5 = *a1;
  uint64_t v4 = a1[1];
  uint64_t v7 = *a2;
  uint64_t v6 = a2[1];
  if (*a1 - *a2 >= 0) {
    unint64_t v8 = *a1 - *a2;
  }
  else {
    unint64_t v8 = *a2 - *a1;
  }
  uint64_t v9 = v4 - v6;
  if (v4 - v6 >= 0) {
    unint64_t v10 = v4 - v6;
  }
  else {
    unint64_t v10 = v6 - v4;
  }
  if (v8 <= v10)
  {
    uint64_t v14 = a3[1];
    if (v4 <= v6 != v4 < v14)
    {
      double v12 = (double)(v6 - v14);
      uint64_t v13 = *a3 - v7;
      goto LABEL_12;
    }
    if (v4 >= v6 != v6 < v14)
    {
      double v12 = (double)(v4 - v14);
      double v15 = (double)(*a3 - v5);
      goto LABEL_17;
    }
    double v12 = (double)v9;
    double v15 = (double)(v7 - v5);
    double v16 = (double)v4 * v15 + (double)v9 * (double)v5;
    double v17 = (double)*a3;
    double v21 = (double)v14;
LABEL_21:
    double v20 = v15 * v21;
    return (v20 + v12 * v17 - v16) * (v20 + v12 * v17 - v16) / (v15 * v15 + v12 * v12) < a4;
  }
  uint64_t v11 = *a3;
  if (v7 >= v5 == *a3 > v5)
  {
    uint64_t v19 = v7 - v5;
    if (v7 <= v5 != v11 > v7)
    {
      double v12 = (double)(v4 - a3[1]);
      double v15 = (double)(*a3 - v5);
LABEL_17:
      double v16 = (double)v4 * v15 + v12 * (double)v5;
      double v17 = (double)v7;
      double v18 = (double)v6;
      goto LABEL_18;
    }
    double v12 = (double)v9;
    double v15 = (double)v19;
    double v16 = (double)v4 * (double)v19 + (double)v9 * (double)v5;
    double v17 = (double)v11;
    double v21 = (double)a3[1];
    goto LABEL_21;
  }
  double v12 = (double)(v6 - a3[1]);
  uint64_t v13 = v11 - v7;
LABEL_12:
  double v15 = (double)v13;
  double v16 = (double)v6 * (double)v13 + v12 * (double)v7;
  double v17 = (double)v5;
  double v18 = (double)v4;
LABEL_18:
  double v20 = v18 * v15;
  return (v20 + v12 * v17 - v16) * (v20 + v12 * v17 - v16) / (v15 * v15 + v12 * v12) < a4;
}

BOOL ClipperLib::PointsAreClose(uint64_t *a1, uint64_t *a2, double a3)
{
  double v3 = (double)*a1 - (double)*a2;
  double v4 = (double)a1[1] - (double)a2[1];
  return v4 * v4 + v3 * v3 <= a3;
}

uint64_t ClipperLib::ExcludeOp(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  *(void *)(v1 + 32) = *(void *)(a1 + 32);
  *(void *)(*(void *)(a1 + 32) + 40) = v1;
  *(_DWORD *)uint64_t v1 = 0;
  return v1;
}

void *ClipperLib::CleanPolygon(void *result, void *a2)
{
  uint64_t v2 = result[1] - *result;
  if (v2)
  {
    is_mul_ok(v2 / 24, 0x30uLL);
    operator new[]();
  }
  a2[1] = *a2;
  return result;
}

void std::vector<ClipperLib::IntPoint>::resize(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 3);
  BOOL v3 = a2 >= v2;
  unint64_t v4 = a2 - v2;
  if (v4 != 0 && v3)
  {
    std::vector<ClipperLib::IntPoint>::__append((void **)a1, v4);
  }
  else if (!v3)
  {
    *(void *)(a1 + 8) = *(void *)a1 + 24 * a2;
  }
}

void *ClipperLib::CleanPolygon(void *a1)
{
  return ClipperLib::CleanPolygon(a1, a1);
}

void ClipperLib::CleanPolygons(uint64_t *a1, uint64_t *a2)
{
  std::vector<std::vector<ClipperLib::IntPoint>>::resize(a2, 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3));
  uint64_t v4 = *a1;
  if (a1[1] != *a1)
  {
    uint64_t v5 = 0;
    unint64_t v6 = 0;
    do
    {
      ClipperLib::CleanPolygon((void *)(v4 + v5), (void *)(*a2 + v5));
      ++v6;
      uint64_t v4 = *a1;
      v5 += 24;
    }
    while (v6 < 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3));
  }
}

void ClipperLib::CleanPolygons(uint64_t *a1)
{
}

void ClipperLib::Minkowski(uint64_t *a1, void *a2, uint64_t *a3, char a4, unsigned int a5)
{
  uint64_t v7 = *a1;
  uint64_t v6 = a1[1];
  uint64_t v8 = a2[1] - *a2;
  if (v8) {
    _ZF = v6 == v7;
  }
  else {
    _ZF = 1;
  }
  if (_ZF)
  {
    std::vector<std::vector<ClipperLib::IntPoint>>::__clear[abi:ne180100](a3);
  }
  else
  {
    unint64_t v13 = v8 / 24;
    uint64_t v127 = 0;
    unint64_t v128 = 0;
    unint64_t v129 = 0;
    std::vector<std::vector<ClipperLib::IntPoint>>::reserve(&v127, v8 / 24);
    unsigned int v116 = a5;
    unint64_t v14 = (v6 - v7) / 24;
    if (v13 <= 1) {
      uint64_t v15 = 1;
    }
    else {
      uint64_t v15 = v13;
    }
    uint64_t v117 = v15;
    __asm { FMOV            V8.2S, #-1.0 }
    uint64_t v20 = 0;
    if (a4)
    {
      double v21 = a2;
      do
      {
        __p[0] = 0;
        __p[1] = 0;
        v131[0] = 0;
        std::vector<ClipperLib::IntPoint>::reserve(__p, v14);
        uint64_t v22 = *a1;
        if (a1[1] != *a1)
        {
          unint64_t v23 = 0;
          uint64_t v24 = (char *)__p[1];
          do
          {
            int64x2_t v25 = vaddq_s64(*(int64x2_t *)(v22 + 24 * v23), *(int64x2_t *)(*v21 + 24 * v20));
            if ((unint64_t)v24 >= v131[0])
            {
              int64x2_t v120 = v25;
              uint64_t v26 = (char *)__p[0];
              unint64_t v27 = 0xAAAAAAAAAAAAAAABLL * ((v24 - (char *)__p[0]) >> 3);
              unint64_t v28 = v27 + 1;
              if (v27 + 1 > 0xAAAAAAAAAAAAAAALL) {
                std::vector<ClipperLib::IntPoint>::__throw_length_error[abi:ne180100]();
              }
              if (0x5555555555555556 * ((uint64_t)(v131[0] - (unint64_t)__p[0]) >> 3) > v28) {
                unint64_t v28 = 0x5555555555555556 * ((uint64_t)(v131[0] - (unint64_t)__p[0]) >> 3);
              }
              if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v131[0] - (unint64_t)__p[0]) >> 3) >= 0x555555555555555) {
                unint64_t v29 = 0xAAAAAAAAAAAAAAALL;
              }
              else {
                unint64_t v29 = v28;
              }
              if (v29)
              {
                int64x2_t v30 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::IntPoint>>((uint64_t)v131, v29);
                uint64_t v26 = (char *)__p[0];
                uint64_t v24 = (char *)__p[1];
              }
              else
              {
                int64x2_t v30 = 0;
              }
              unint64_t v31 = &v30[24 * v27];
              *(int64x2_t *)unint64_t v31 = v120;
              *((void *)v31 + 2) = _D8;
              unint64_t v32 = v31;
              if (v24 == v26)
              {
                double v21 = a2;
              }
              else
              {
                double v21 = a2;
                do
                {
                  long long v33 = *(_OWORD *)(v24 - 24);
                  *((void *)v32 - 1) = *((void *)v24 - 1);
                  *(_OWORD *)(v32 - 24) = v33;
                  v32 -= 24;
                  v24 -= 24;
                }
                while (v24 != v26);
                uint64_t v26 = (char *)__p[0];
              }
              uint64_t v24 = v31 + 24;
              __p[0] = v32;
              __p[1] = v31 + 24;
              v131[0] = &v30[24 * v29];
              if (v26) {
                operator delete(v26);
              }
            }
            else
            {
              *(int64x2_t *)uint64_t v24 = v25;
              *((void *)v24 + 2) = _D8;
              v24 += 24;
            }
            __p[1] = v24;
            ++v23;
            uint64_t v22 = *a1;
          }
          while (v23 < 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3));
        }
        char v34 = v128;
        if ((unint64_t)v128 >= v129)
        {
          uint64_t v35 = std::vector<std::vector<ClipperLib::IntPoint>>::__push_back_slow_path<std::vector<ClipperLib::IntPoint> const&>(&v127, (uint64_t)__p);
        }
        else
        {
          *unint64_t v128 = 0;
          v34[1] = 0;
          v34[2] = 0;
          std::vector<ClipperLib::IntPoint>::__init_with_size[abi:ne180100]<ClipperLib::IntPoint*,ClipperLib::IntPoint*>(v34, __p[0], (uint64_t)__p[1], 0xAAAAAAAAAAAAAAABLL * (((char *)__p[1] - (char *)__p[0]) >> 3));
          uint64_t v35 = (uint64_t)(v34 + 3);
        }
        unint64_t v128 = (void *)v35;
        if (__p[0])
        {
          __p[1] = __p[0];
          operator delete(__p[0]);
        }
        ++v20;
      }
      while (v20 != v117);
    }
    else
    {
      long long v36 = a2;
      do
      {
        __p[0] = 0;
        __p[1] = 0;
        v131[0] = 0;
        std::vector<ClipperLib::IntPoint>::reserve(__p, v14);
        uint64_t v37 = *a1;
        if (a1[1] != *a1)
        {
          unint64_t v38 = 0;
          double v39 = (char *)__p[1];
          do
          {
            int64x2_t v40 = vsubq_s64(*(int64x2_t *)(*v36 + 24 * v20), *(int64x2_t *)(v37 + 24 * v38));
            if ((unint64_t)v39 >= v131[0])
            {
              int64x2_t v121 = v40;
              unint64_t v41 = (char *)__p[0];
              unint64_t v42 = 0xAAAAAAAAAAAAAAABLL * ((v39 - (char *)__p[0]) >> 3);
              unint64_t v43 = v42 + 1;
              if (v42 + 1 > 0xAAAAAAAAAAAAAAALL) {
                std::vector<ClipperLib::IntPoint>::__throw_length_error[abi:ne180100]();
              }
              if (0x5555555555555556 * ((uint64_t)(v131[0] - (unint64_t)__p[0]) >> 3) > v43) {
                unint64_t v43 = 0x5555555555555556 * ((uint64_t)(v131[0] - (unint64_t)__p[0]) >> 3);
              }
              if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v131[0] - (unint64_t)__p[0]) >> 3) >= 0x555555555555555) {
                unint64_t v44 = 0xAAAAAAAAAAAAAAALL;
              }
              else {
                unint64_t v44 = v43;
              }
              if (v44)
              {
                int64x2_t v45 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::IntPoint>>((uint64_t)v131, v44);
                unint64_t v41 = (char *)__p[0];
                double v39 = (char *)__p[1];
              }
              else
              {
                int64x2_t v45 = 0;
              }
              unint64_t v46 = &v45[24 * v42];
              *(int64x2_t *)unint64_t v46 = v121;
              *((void *)v46 + 2) = _D8;
              unint64_t v47 = v46;
              if (v39 == v41)
              {
                long long v36 = a2;
              }
              else
              {
                long long v36 = a2;
                do
                {
                  long long v48 = *(_OWORD *)(v39 - 24);
                  *((void *)v47 - 1) = *((void *)v39 - 1);
                  *(_OWORD *)(v47 - 24) = v48;
                  v47 -= 24;
                  v39 -= 24;
                }
                while (v39 != v41);
                unint64_t v41 = (char *)__p[0];
              }
              double v39 = v46 + 24;
              __p[0] = v47;
              __p[1] = v46 + 24;
              v131[0] = &v45[24 * v44];
              if (v41) {
                operator delete(v41);
              }
            }
            else
            {
              *(int64x2_t *)double v39 = v40;
              *((void *)v39 + 2) = _D8;
              v39 += 24;
            }
            __p[1] = v39;
            ++v38;
            uint64_t v37 = *a1;
          }
          while (v38 < 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3));
        }
        unint64_t v49 = v128;
        if ((unint64_t)v128 >= v129)
        {
          uint64_t v50 = std::vector<std::vector<ClipperLib::IntPoint>>::__push_back_slow_path<std::vector<ClipperLib::IntPoint> const&>(&v127, (uint64_t)__p);
        }
        else
        {
          *unint64_t v128 = 0;
          v49[1] = 0;
          v49[2] = 0;
          std::vector<ClipperLib::IntPoint>::__init_with_size[abi:ne180100]<ClipperLib::IntPoint*,ClipperLib::IntPoint*>(v49, __p[0], (uint64_t)__p[1], 0xAAAAAAAAAAAAAAABLL * (((char *)__p[1] - (char *)__p[0]) >> 3));
          uint64_t v50 = (uint64_t)(v49 + 3);
        }
        unint64_t v128 = (void *)v50;
        if (__p[0])
        {
          __p[1] = __p[0];
          operator delete(__p[0]);
        }
        ++v20;
      }
      while (v20 != v117);
    }
    std::vector<std::vector<ClipperLib::IntPoint>>::__clear[abi:ne180100](a3);
    unint64_t v51 = v13 + v116;
    std::vector<std::vector<ClipperLib::IntPoint>>::reserve(a3, v51 + v51 * v14);
    unint64_t v118 = v51 - 1;
    if (v51 != 1)
    {
      unint64_t v52 = 0;
      if (v14 <= 1) {
        uint64_t v53 = 1;
      }
      else {
        uint64_t v53 = v14;
      }
      uint64_t v119 = v53;
      do
      {
        unint64_t v54 = 0;
        unint64_t v122 = v52;
        unint64_t v55 = v52 + 1;
        do
        {
          v124 = 0;
          v125 = 0;
          v126 = 0;
          std::vector<ClipperLib::IntPoint>::reserve(&v124, 4uLL);
          uint64_t v56 = *(void *)(v127 + 24 * (v122 % v13)) + 24 * (v54 % v14);
          int64x2_t v57 = v125;
          if (v125 >= v126)
          {
            unint64_t v60 = 0xAAAAAAAAAAAAAAABLL * ((v125 - (unsigned char *)v124) >> 3);
            unint64_t v61 = v60 + 1;
            if (v60 + 1 > 0xAAAAAAAAAAAAAAALL) {
              goto LABEL_154;
            }
            if (0x5555555555555556 * ((v126 - (unsigned char *)v124) >> 3) > v61) {
              unint64_t v61 = 0x5555555555555556 * ((v126 - (unsigned char *)v124) >> 3);
            }
            if (0xAAAAAAAAAAAAAAABLL * ((v126 - (unsigned char *)v124) >> 3) >= 0x555555555555555) {
              unint64_t v62 = 0xAAAAAAAAAAAAAAALL;
            }
            else {
              unint64_t v62 = v61;
            }
            if (v62) {
              uint64_t v63 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::IntPoint>>((uint64_t)&v126, v62);
            }
            else {
              uint64_t v63 = 0;
            }
            long long v64 = &v63[24 * v60];
            long long v65 = *(_OWORD *)v56;
            *((void *)v64 + 2) = *(void *)(v56 + 16);
            *(_OWORD *)long long v64 = v65;
            long long v67 = (char *)v124;
            double v66 = v125;
            unint64_t v68 = v64;
            if (v125 != v124)
            {
              do
              {
                long long v69 = *(_OWORD *)(v66 - 24);
                *((void *)v68 - 1) = *((void *)v66 - 1);
                *(_OWORD *)(v68 - 24) = v69;
                v68 -= 24;
                v66 -= 24;
              }
              while (v66 != v67);
              double v66 = (char *)v124;
            }
            uint64_t v59 = v64 + 24;
            v124 = v68;
            v125 = v64 + 24;
            v126 = &v63[24 * v62];
            if (v66) {
              operator delete(v66);
            }
          }
          else
          {
            long long v58 = *(_OWORD *)v56;
            *((void *)v125 + 2) = *(void *)(v56 + 16);
            *int64x2_t v57 = v58;
            uint64_t v59 = (char *)v57 + 24;
          }
          v125 = v59;
          uint64_t v70 = *(void *)(v127 + 24 * (v55 % v13)) + 24 * (v54 % v14);
          if (v59 >= v126)
          {
            unint64_t v73 = 0xAAAAAAAAAAAAAAABLL * ((v59 - (unsigned char *)v124) >> 3);
            unint64_t v74 = v73 + 1;
            if (v73 + 1 > 0xAAAAAAAAAAAAAAALL) {
              goto LABEL_154;
            }
            if (0x5555555555555556 * ((v126 - (unsigned char *)v124) >> 3) > v74) {
              unint64_t v74 = 0x5555555555555556 * ((v126 - (unsigned char *)v124) >> 3);
            }
            if (0xAAAAAAAAAAAAAAABLL * ((v126 - (unsigned char *)v124) >> 3) >= 0x555555555555555) {
              unint64_t v75 = 0xAAAAAAAAAAAAAAALL;
            }
            else {
              unint64_t v75 = v74;
            }
            if (v75) {
              unint64_t v76 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::IntPoint>>((uint64_t)&v126, v75);
            }
            else {
              unint64_t v76 = 0;
            }
            unint64_t v77 = &v76[24 * v73];
            long long v78 = *(_OWORD *)v70;
            *((void *)v77 + 2) = *(void *)(v70 + 16);
            *(_OWORD *)unint64_t v77 = v78;
            double v80 = (char *)v124;
            double v79 = v125;
            uint64_t v81 = v77;
            if (v125 != v124)
            {
              do
              {
                long long v82 = *(_OWORD *)(v79 - 24);
                *((void *)v81 - 1) = *((void *)v79 - 1);
                *(_OWORD *)(v81 - 24) = v82;
                v81 -= 24;
                v79 -= 24;
              }
              while (v79 != v80);
              double v79 = (char *)v124;
            }
            uint64_t v72 = v77 + 24;
            v124 = v81;
            v125 = v77 + 24;
            v126 = &v76[24 * v75];
            if (v79) {
              operator delete(v79);
            }
          }
          else
          {
            long long v71 = *(_OWORD *)v70;
            *((void *)v59 + 2) = *(void *)(v70 + 16);
            *(_OWORD *)uint64_t v59 = v71;
            uint64_t v72 = v59 + 24;
          }
          v125 = v72;
          uint64_t v83 = *(void *)(v127 + 24 * (v55 % v13)) + 24 * (++v54 % v14);
          if (v72 >= v126)
          {
            unint64_t v86 = 0xAAAAAAAAAAAAAAABLL * ((v72 - (unsigned char *)v124) >> 3);
            unint64_t v87 = v86 + 1;
            if (v86 + 1 > 0xAAAAAAAAAAAAAAALL) {
              goto LABEL_154;
            }
            if (0x5555555555555556 * ((v126 - (unsigned char *)v124) >> 3) > v87) {
              unint64_t v87 = 0x5555555555555556 * ((v126 - (unsigned char *)v124) >> 3);
            }
            if (0xAAAAAAAAAAAAAAABLL * ((v126 - (unsigned char *)v124) >> 3) >= 0x555555555555555) {
              unint64_t v88 = 0xAAAAAAAAAAAAAAALL;
            }
            else {
              unint64_t v88 = v87;
            }
            if (v88) {
              int64x2_t v89 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::IntPoint>>((uint64_t)&v126, v88);
            }
            else {
              int64x2_t v89 = 0;
            }
            int8x16_t v90 = &v89[24 * v86];
            long long v91 = *(_OWORD *)v83;
            *((void *)v90 + 2) = *(void *)(v83 + 16);
            *(_OWORD *)int8x16_t v90 = v91;
            int64x2_t v93 = (char *)v124;
            int64x2_t v92 = v125;
            double v94 = v90;
            if (v125 != v124)
            {
              do
              {
                long long v95 = *(_OWORD *)(v92 - 24);
                *((void *)v94 - 1) = *((void *)v92 - 1);
                *(_OWORD *)(v94 - 24) = v95;
                v94 -= 24;
                v92 -= 24;
              }
              while (v92 != v93);
              int64x2_t v92 = (char *)v124;
            }
            uint64_t v85 = v90 + 24;
            v124 = v94;
            v125 = v90 + 24;
            v126 = &v89[24 * v88];
            if (v92) {
              operator delete(v92);
            }
          }
          else
          {
            long long v84 = *(_OWORD *)v83;
            *((void *)v72 + 2) = *(void *)(v83 + 16);
            *(_OWORD *)uint64_t v72 = v84;
            uint64_t v85 = v72 + 24;
          }
          v125 = v85;
          uint64_t v96 = *(void *)(v127 + 24 * (v122 % v13)) + 24 * (v54 % v14);
          if (v85 >= v126)
          {
            unint64_t v99 = 0xAAAAAAAAAAAAAAABLL * ((v85 - (unsigned char *)v124) >> 3);
            unint64_t v100 = v99 + 1;
            if (v99 + 1 > 0xAAAAAAAAAAAAAAALL) {
LABEL_154:
            }
              std::vector<ClipperLib::IntPoint>::__throw_length_error[abi:ne180100]();
            if (0x5555555555555556 * ((v126 - (unsigned char *)v124) >> 3) > v100) {
              unint64_t v100 = 0x5555555555555556 * ((v126 - (unsigned char *)v124) >> 3);
            }
            if (0xAAAAAAAAAAAAAAABLL * ((v126 - (unsigned char *)v124) >> 3) >= 0x555555555555555) {
              unint64_t v101 = 0xAAAAAAAAAAAAAAALL;
            }
            else {
              unint64_t v101 = v100;
            }
            if (v101) {
              unint64_t v102 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::IntPoint>>((uint64_t)&v126, v101);
            }
            else {
              unint64_t v102 = 0;
            }
            uint64_t v103 = &v102[24 * v99];
            long long v104 = *(_OWORD *)v96;
            *((void *)v103 + 2) = *(void *)(v96 + 16);
            *(_OWORD *)uint64_t v103 = v104;
            uint64_t v106 = (char *)v124;
            long long v105 = v125;
            long long v107 = v103;
            if (v125 != v124)
            {
              do
              {
                long long v108 = *(_OWORD *)(v105 - 24);
                *((void *)v107 - 1) = *((void *)v105 - 1);
                *(_OWORD *)(v107 - 24) = v108;
                v107 -= 24;
                v105 -= 24;
              }
              while (v105 != v106);
              long long v105 = (char *)v124;
            }
            uint64_t v98 = v103 + 24;
            v124 = v107;
            v125 = v103 + 24;
            v126 = &v102[24 * v101];
            if (v105) {
              operator delete(v105);
            }
          }
          else
          {
            long long v97 = *(_OWORD *)v96;
            *((void *)v85 + 2) = *(void *)(v96 + 16);
            *(_OWORD *)uint64_t v85 = v97;
            uint64_t v98 = v85 + 24;
          }
          v125 = v98;
          if (ClipperLib::Area((uint64_t *)&v124) < 0.0 && v124 != v98)
          {
            long long v109 = v98 - 24;
            if (v98 - 24 > v124)
            {
              uint64_t v110 = (char *)v124 + 24;
              do
              {
                *(_OWORD *)__p = *(_OWORD *)(v110 - 24);
                long long v111 = *(_OWORD *)__p;
                v131[0] = *((void *)v110 - 1);
                uint64_t v112 = v131[0];
                uint64_t v113 = *((void *)v109 + 2);
                *(_OWORD *)(v110 - 24) = *(_OWORD *)v109;
                *((void *)v110 - 1) = v113;
                *((void *)v109 + 2) = v112;
                *(_OWORD *)long long v109 = v111;
                v109 -= 24;
                _CF = v110 >= v109;
                v110 += 24;
              }
              while (!_CF);
            }
          }
          unint64_t v114 = a3[1];
          if (v114 >= a3[2])
          {
            uint64_t v115 = std::vector<std::vector<ClipperLib::IntPoint>>::__push_back_slow_path<std::vector<ClipperLib::IntPoint> const&>(a3, (uint64_t)&v124);
          }
          else
          {
            std::vector<std::vector<ClipperLib::IntPoint>>::__construct_one_at_end[abi:ne180100]<std::vector<ClipperLib::IntPoint> const&>((uint64_t)a3, (uint64_t)&v124);
            uint64_t v115 = v114 + 24;
          }
          a3[1] = v115;
          if (v124)
          {
            v125 = (char *)v124;
            operator delete(v124);
          }
        }
        while (v54 != v119);
        unint64_t v52 = v55;
      }
      while (v55 != v118);
    }
    __p[0] = &v127;
    std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
  }
}

void sub_1DB288960(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,char *__p,uint64_t a24)
{
  __p = &a20;
  std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  _Unwind_Resume(a1);
}

void ClipperLib::MinkowskiSum(uint64_t *a1, void *a2, uint64_t *a3, unsigned int a4)
{
  ClipperLib::Minkowski(a1, a2, a3, 1, a4);
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  uint64_t v26 = 0;
  uint64_t v28 = 0;
  uint64_t v29 = 0;
  uint64_t v27 = 0;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = &unk_1F3555D08;
  *(_OWORD *)uint64_t v6 = 0u;
  *(_OWORD *)uint64_t v7 = 0u;
  long long v8 = 0u;
  *(_OWORD *)__p = 0u;
  uint64_t v10 = 0;
  v11[0] = v11;
  v11[1] = v11;
  unint64_t v11[2] = 0;
  char v12 = 0;
  char v19 = 0;
  char v13 = 0;
  char v14 = 0;
  __int16 v23 = 0;
  uint64_t v15 = 0;
  double v16 = off_1F3555D50;
  ClipperLib::ClipperBase::AddPaths((uint64_t)&v16, a3, 0, 1);
  ClipperLib::Clipper::Execute((uint64_t)&v5, 1, a3, 1, 1);
  uint64_t v5 = &unk_1F3555D08;
  double v16 = off_1F3555D50;
  std::__list_imp<long long>::clear(v11);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if (v7[1])
  {
    *(void **)&long long v8 = v7[1];
    operator delete(v7[1]);
  }
  if (v6[0])
  {
    v6[1] = v6[0];
    operator delete(v6[0]);
  }
  ClipperLib::ClipperBase::~ClipperBase((ClipperLib::ClipperBase *)&v16);
}

void sub_1DB288B28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void ClipperLib::TranslatePath(void *a1, int64x2_t **a2, int64x2_t *a3)
{
  std::vector<ClipperLib::IntPoint>::resize((uint64_t)a2, 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(a1[1] - *a1) >> 3));
  uint64_t v6 = (_OWORD *)*a1;
  uint64_t v7 = a1[1] - *a1;
  if (v7)
  {
    unint64_t v8 = v7 / 24;
    if (v8 <= 1) {
      unint64_t v8 = 1;
    }
    uint64_t v9 = *a2 + 1;
    __asm { FMOV            V0.2S, #-1.0 }
    do
    {
      int64x2_t v15 = *(int64x2_t *)v6;
      uint64_t v6 = (_OWORD *)((char *)v6 + 24);
      v9[-1] = vaddq_s64(*a3, v15);
      v9->i64[0] = _D0;
      uint64_t v9 = (int64x2_t *)((char *)v9 + 24);
      --v8;
    }
    while (v8);
  }
}

void ClipperLib::MinkowskiSum(uint64_t *a1, uint64_t *a2, uint64_t *a3, unsigned int a4)
{
  uint64_t v39 = 0;
  uint64_t v40 = 0;
  uint64_t v41 = 0;
  uint64_t v43 = 0;
  uint64_t v44 = 0;
  uint64_t v45 = 0;
  uint64_t v47 = 0;
  uint64_t v48 = 0;
  uint64_t v46 = 0;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v24 = &unk_1F3555D08;
  *(_OWORD *)uint64_t v25 = 0u;
  *(_OWORD *)uint64_t v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v29 = 0;
  v30[0] = v30;
  v30[1] = v30;
  v30[2] = 0;
  char v31 = 0;
  char v38 = 0;
  char v32 = 0;
  char v33 = 0;
  __int16 v42 = 0;
  uint64_t v34 = 0;
  uint64_t v35 = off_1F3555D50;
  uint64_t v4 = *a2;
  if (a2[1] != *a2)
  {
    unint64_t v8 = 0;
    do
    {
      uint64_t v21 = 0;
      uint64_t v22 = 0;
      uint64_t v23 = 0;
      ClipperLib::Minkowski(a1, (void *)(v4 + 24 * v8), &v21, 1, a4);
      uint64_t v9 = v21;
      if (v22 != v21)
      {
        uint64_t v10 = 0;
        unint64_t v11 = 0;
        char v12 = (char *)&v25[-1] + *(v24 - 3);
        do
        {
          (*(void (**)(char *, uint64_t, void, uint64_t))(*(void *)v12 + 16))(v12, v9 + v10, 0, 1);
          ++v11;
          uint64_t v9 = v21;
          v10 += 24;
        }
        while (v11 < 0xAAAAAAAAAAAAAAABLL * ((v22 - v21) >> 3));
      }
      if (a4)
      {
        __p = 0;
        char v19 = 0;
        uint64_t v20 = 0;
        char v13 = (void *)(*a2 + 24 * v8);
        uint64_t v14 = *a1;
        int64x2_t v16 = *(int64x2_t *)*a1;
        uint64_t v17 = *(void *)(v14 + 16);
        ClipperLib::TranslatePath(v13, (int64x2_t **)&__p, &v16);
        ClipperLib::ClipperBase::AddPath((uint64_t)&v25[-1] + *(v24 - 3), (uint64_t)&__p, 1, 1);
        if (__p)
        {
          char v19 = __p;
          operator delete(__p);
        }
      }
      __p = &v21;
      std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
      ++v8;
      uint64_t v4 = *a2;
    }
    while (v8 < 0xAAAAAAAAAAAAAAABLL * ((a2[1] - *a2) >> 3));
  }
  ClipperLib::Clipper::Execute((uint64_t)&v24, 1, a3, 1, 1);
  uint64_t v24 = &unk_1F3555D08;
  uint64_t v35 = off_1F3555D50;
  std::__list_imp<long long>::clear(v30);
  if ((void)v28)
  {
    *((void *)&v28 + 1) = v28;
    operator delete((void *)v28);
  }
  if (v26[1])
  {
    *(void **)&long long v27 = v26[1];
    operator delete(v26[1]);
  }
  if (v25[0])
  {
    v25[1] = v25[0];
    operator delete(v25[0]);
  }
  ClipperLib::ClipperBase::~ClipperBase((ClipperLib::ClipperBase *)&v35);
}

void sub_1DB288E8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,char a25)
{
}

void ClipperLib::MinkowskiDiff(uint64_t *a1, void *a2, uint64_t *a3)
{
  ClipperLib::Minkowski(a1, a2, a3, 0, 1u);
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  uint64_t v27 = 0;
  uint64_t v28 = 0;
  uint64_t v26 = 0;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v4 = &unk_1F3555D08;
  *(_OWORD *)uint64_t v5 = 0u;
  *(_OWORD *)uint64_t v6 = 0u;
  long long v7 = 0u;
  *(_OWORD *)__p = 0u;
  uint64_t v9 = 0;
  v10[0] = v10;
  v10[1] = v10;
  unint64_t v10[2] = 0;
  char v11 = 0;
  char v18 = 0;
  char v12 = 0;
  char v13 = 0;
  __int16 v22 = 0;
  uint64_t v14 = 0;
  int64x2_t v15 = off_1F3555D50;
  ClipperLib::ClipperBase::AddPaths((uint64_t)&v15, a3, 0, 1);
  ClipperLib::Clipper::Execute((uint64_t)&v4, 1, a3, 1, 1);
  uint64_t v4 = &unk_1F3555D08;
  int64x2_t v15 = off_1F3555D50;
  std::__list_imp<long long>::clear(v10);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if (v6[1])
  {
    *(void **)&long long v7 = v6[1];
    operator delete(v6[1]);
  }
  if (v5[0])
  {
    v5[1] = v5[0];
    operator delete(v5[0]);
  }
  ClipperLib::ClipperBase::~ClipperBase((ClipperLib::ClipperBase *)&v15);
}

void sub_1DB28902C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t ClipperLib::AddPolyNodeToPaths(uint64_t result, uint64_t a2, uint64_t *a3)
{
  if (a2 != 1)
  {
    uint64_t v5 = result;
    if (a2 != 2 || !*(unsigned char *)(result + 68))
    {
      uint64_t v6 = result + 8;
      if (*(void *)(result + 8) != *(void *)(result + 16))
      {
        unint64_t v7 = a3[1];
        if (v7 >= a3[2])
        {
          unint64_t result = std::vector<std::vector<ClipperLib::IntPoint>>::__push_back_slow_path<std::vector<ClipperLib::IntPoint> const&>(a3, v6);
        }
        else
        {
          std::vector<std::vector<ClipperLib::IntPoint>>::__construct_one_at_end[abi:ne180100]<std::vector<ClipperLib::IntPoint> const&>((uint64_t)a3, v6);
          unint64_t result = v7 + 24;
        }
        a3[1] = result;
      }
    }
    uint64_t v8 = *(void *)(v5 + 32);
    if ((int)((unint64_t)(*(void *)(v5 + 40) - v8) >> 3) >= 1)
    {
      uint64_t v9 = 0;
      do
      {
        unint64_t result = ClipperLib::AddPolyNodeToPaths(*(void *)(v8 + 8 * v9++), a2, a3);
        uint64_t v8 = *(void *)(v5 + 32);
      }
      while (v9 < (int)((unint64_t)(*(void *)(v5 + 40) - v8) >> 3));
    }
  }
  return result;
}

uint64_t ClipperLib::PolyTreeToPaths(uint64_t a1, uint64_t *a2)
{
  std::vector<std::vector<ClipperLib::IntPoint>>::resize(a2, 0);
  uint64_t v4 = *(void **)(a1 + 80);
  uint64_t v5 = (*(void *)(a1 + 88) - (void)v4) >> 3;
  if ((int)v5 >= 1) {
    LODWORD(v5) = v5 - (**(void **)(a1 + 32) != *v4);
  }
  std::vector<std::vector<ClipperLib::IntPoint>>::reserve(a2, (int)v5);
  return ClipperLib::AddPolyNodeToPaths(a1, 0, a2);
}

uint64_t ClipperLib::ClosedPathsFromPolyTree(uint64_t a1, uint64_t *a2)
{
  std::vector<std::vector<ClipperLib::IntPoint>>::resize(a2, 0);
  uint64_t v4 = *(void **)(a1 + 80);
  uint64_t v5 = (*(void *)(a1 + 88) - (void)v4) >> 3;
  if ((int)v5 >= 1) {
    LODWORD(v5) = v5 - (**(void **)(a1 + 32) != *v4);
  }
  std::vector<std::vector<ClipperLib::IntPoint>>::reserve(a2, (int)v5);
  return ClipperLib::AddPolyNodeToPaths(a1, 2, a2);
}

uint64_t ClipperLib::OpenPathsFromPolyTree(uint64_t a1, uint64_t *a2)
{
  std::vector<std::vector<ClipperLib::IntPoint>>::resize(a2, 0);
  uint64_t v4 = *(void **)(a1 + 80);
  uint64_t v5 = (*(void *)(a1 + 88) - (void)v4) >> 3;
  if ((int)v5 >= 1) {
    LODWORD(v5) = v5 - (**(void **)(a1 + 32) != *v4);
  }
  uint64_t result = std::vector<std::vector<ClipperLib::IntPoint>>::reserve(a2, (int)v5);
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  if ((int)((unint64_t)(v7 - v8) >> 3) >= 1)
  {
    uint64_t v9 = 0;
    do
    {
      uint64_t v10 = *(void *)(v8 + 8 * v9);
      if (*(unsigned char *)(v10 + 68))
      {
        uint64_t v11 = v10 + 8;
        unint64_t v12 = a2[1];
        if (v12 >= a2[2])
        {
          uint64_t result = std::vector<std::vector<ClipperLib::IntPoint>>::__push_back_slow_path<std::vector<ClipperLib::IntPoint> const&>(a2, v11);
        }
        else
        {
          std::vector<std::vector<ClipperLib::IntPoint>>::__construct_one_at_end[abi:ne180100]<std::vector<ClipperLib::IntPoint> const&>((uint64_t)a2, v11);
          uint64_t result = v12 + 24;
        }
        a2[1] = result;
        uint64_t v8 = *(void *)(a1 + 32);
        uint64_t v7 = *(void *)(a1 + 40);
      }
      ++v9;
    }
    while (v9 < (int)((unint64_t)(v7 - v8) >> 3));
  }
  return result;
}

void *ClipperLib::operator<<(void *a1)
{
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a1, (uint64_t)"(", 1);
  unint64_t v2 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v2, (uint64_t)",", 1);
  BOOL v3 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v3, (uint64_t)")", 1);
  return a1;
}

void *ClipperLib::operator<<(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  if (*a2 != v3)
  {
    uint64_t v4 = (v3 - *a2) >> 3;
    if (0xAAAAAAAAAAAAAAABLL * v4 != 1)
    {
      uint64_t v5 = 0;
      unint64_t v6 = 0xAAAAAAAAAAAAAAABLL * v4 - 1;
      do
      {
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a1, (uint64_t)"(", 1);
        uint64_t v7 = (void *)std::ostream::operator<<();
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v7, (uint64_t)",", 1);
        uint64_t v8 = (void *)std::ostream::operator<<();
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v8, (uint64_t)"), ", 3);
        v5 += 24;
        --v6;
      }
      while (v6);
    }
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a1, (uint64_t)"(", 1);
    uint64_t v9 = (void *)std::ostream::operator<<();
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, (uint64_t)",", 1);
    uint64_t v10 = (void *)std::ostream::operator<<();
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v10, (uint64_t)")\n", 2);
  }
  return a1;
}

void *ClipperLib::operator<<(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  if (a2[1] != *a2)
  {
    uint64_t v5 = 0;
    unint64_t v6 = 0;
    do
    {
      ClipperLib::operator<<(a1, (void *)(v3 + v5));
      ++v6;
      uint64_t v3 = *a2;
      v5 += 24;
    }
    while (v6 < 0xAAAAAAAAAAAAAAABLL * ((a2[1] - *a2) >> 3));
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a1, (uint64_t)"\n", 1);
  return a1;
}

void virtual thunk to'ClipperLib::Clipper::~Clipper(ClipperLib::Clipper *this)
{
  uint64_t v1 = (void *)((char *)this + *(void *)(*(void *)this - 24));
  void *v1 = &unk_1F3555D08;
  v1[18] = off_1F3555D50;
  std::__list_imp<long long>::clear(v1 + 11);
  unint64_t v2 = (void *)v1[7];
  if (v2)
  {
    v1[8] = v2;
    operator delete(v2);
  }
  uint64_t v3 = (void *)v1[4];
  if (v3)
  {
    v1[5] = v3;
    operator delete(v3);
  }
  uint64_t v4 = (void *)v1[1];
  if (v4)
  {
    v1[2] = v4;
    operator delete(v4);
  }
  ClipperLib::ClipperBase::~ClipperBase((ClipperLib::ClipperBase *)(v1 + 18));
}

{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t vars8;

  uint64_t v1 = (void *)((char *)this + *(void *)(*(void *)this - 24));
  void *v1 = &unk_1F3555D08;
  v1[18] = off_1F3555D50;
  std::__list_imp<long long>::clear(v1 + 11);
  unint64_t v2 = (void *)v1[7];
  if (v2)
  {
    v1[8] = v2;
    operator delete(v2);
  }
  uint64_t v3 = (void *)v1[4];
  if (v3)
  {
    v1[5] = v3;
    operator delete(v3);
  }
  uint64_t v4 = (void *)v1[1];
  if (v4)
  {
    v1[2] = v4;
    operator delete(v4);
  }
  ClipperLib::ClipperBase::~ClipperBase((ClipperLib::ClipperBase *)(v1 + 18));
  JUMPOUT(0x1E018DFE0);
}

void ClipperLib::PolyNode::~PolyNode(ClipperLib::PolyNode *this)
{
  ClipperLib::PolyNode::~PolyNode(this);
  JUMPOUT(0x1E018DFE0);
}

{
  void *v2;
  void *v3;

  *(void *)this = &unk_1F3555D88;
  unint64_t v2 = (void *)*((void *)this + 4);
  if (v2)
  {
    *((void *)this + 5) = v2;
    operator delete(v2);
  }
  uint64_t v3 = (void *)*((void *)this + 1);
  if (v3)
  {
    *((void *)this + 2) = v3;
    operator delete(v3);
  }
}

ClipperLib::clipperException *ClipperLib::clipperException::clipperException(ClipperLib::clipperException *this, char *a2)
{
  *(void *)this = &unk_1F3555CD8;
  std::string::basic_string[abi:ne180100]<0>((void *)this + 1, a2);
  return this;
}

void sub_1DB2897E4(_Unwind_Exception *a1)
{
  std::exception::~exception(v1);
  _Unwind_Resume(a1);
}

void ClipperLib::clipperException::~clipperException(std::exception *this)
{
  ClipperLib::clipperException::~clipperException(this);
  JUMPOUT(0x1E018DFE0);
}

{
  uint64_t vars8;

  this->__vftable = (std::exception_vtbl *)&unk_1F3555CD8;
  if (SHIBYTE(this[3].__vftable) < 0) {
    operator delete(this[1].__vftable);
  }
  std::exception::~exception(this);
}

uint64_t ClipperLib::clipperException::what(ClipperLib::clipperException *this)
{
  uint64_t result = (uint64_t)this + 8;
  if (*((char *)this + 31) < 0) {
    return *(void *)result;
  }
  return result;
}

void *std::string::basic_string[abi:ne180100]<0>(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    unint64_t v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    unint64_t v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1E6BF07A0, MEMORY[0x1E4FBA1C8]);
}

void sub_1DB289960(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E4FBA4D0] + 16);
  return result;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x1E4FBA350], MEMORY[0x1E4FBA1F8]);
}

void *std::__list_imp<long long>::clear(void *result)
{
  if (result[2])
  {
    uint64_t v1 = result;
    uint64_t result = (void *)result[1];
    uint64_t v2 = *v1;
    uint64_t v3 = *result;
    *(void *)(v3 + 8) = *(void *)(*v1 + 8);
    **(void **)(v2 + 8) = v3;
    v1[2] = 0;
    if (result != v1)
    {
      do
      {
        size_t v4 = (void *)result[1];
        operator delete(result);
        uint64_t result = v4;
      }
      while (v4 != v1);
    }
  }
  return result;
}

void std::vector<ClipperLib::IntPoint>::__throw_length_error[abi:ne180100]()
{
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::IntPoint>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(24 * a2);
}

void *std::vector<std::vector<ClipperLib::IntPoint>>::__construct_one_at_end[abi:ne180100]<std::vector<ClipperLib::IntPoint> const&>(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a1 + 8);
  void *v3 = 0;
  v3[1] = 0;
  v3[2] = 0;
  uint64_t result = std::vector<ClipperLib::IntPoint>::__init_with_size[abi:ne180100]<ClipperLib::IntPoint*,ClipperLib::IntPoint*>(v3, *(const void **)a2, *(void *)(a2 + 8), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a2 + 8) - *(void *)a2) >> 3));
  *(void *)(a1 + 8) = v3 + 3;
  return result;
}

void sub_1DB289BB8(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t std::vector<std::vector<ClipperLib::IntPoint>>::__push_back_slow_path<std::vector<ClipperLib::IntPoint> const&>(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0xAAAAAAAAAAAAAAALL) {
    std::vector<ClipperLib::IntPoint>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5) {
    unint64_t v5 = 2 * v8;
  }
  if (v8 >= 0x555555555555555) {
    unint64_t v9 = 0xAAAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v9 = v5;
  }
  long long v17 = a1 + 2;
  if (v9) {
    uint64_t v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::IntPoint>>(v7, v9);
  }
  else {
    uint64_t v10 = 0;
  }
  uint64_t v11 = &v10[24 * v4];
  v14[0] = v10;
  v14[1] = v11;
  int64x2_t v15 = v11;
  long long v16 = &v10[24 * v9];
  *(void *)uint64_t v11 = 0;
  *((void *)v11 + 1) = 0;
  *((void *)v11 + 2) = 0;
  std::vector<ClipperLib::IntPoint>::__init_with_size[abi:ne180100]<ClipperLib::IntPoint*,ClipperLib::IntPoint*>(v11, *(const void **)a2, *(void *)(a2 + 8), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a2 + 8) - *(void *)a2) >> 3));
  v15 += 24;
  std::vector<std::vector<ClipperLib::IntPoint>>::__swap_out_circular_buffer(a1, v14);
  uint64_t v12 = a1[1];
  std::__split_buffer<std::vector<ClipperLib::IntPoint>>::~__split_buffer((uint64_t)v14);
  return v12;
}

void sub_1DB289CD0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<std::vector<ClipperLib::IntPoint>>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

void *std::vector<ClipperLib::IntPoint>::__init_with_size[abi:ne180100]<ClipperLib::IntPoint*,ClipperLib::IntPoint*>(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    unint64_t v6 = result;
    uint64_t result = std::vector<ClipperLib::IntPoint>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      uint64_t result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_1DB289D44(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<ClipperLib::IntPoint>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    std::vector<ClipperLib::IntPoint>::__throw_length_error[abi:ne180100]();
  }
  uint64_t result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::IntPoint>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[24 * v4];
  return result;
}

uint64_t std::vector<std::vector<ClipperLib::IntPoint>>::__swap_out_circular_buffer(uint64_t *a1, void *a2)
{
  uint64_t result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::vector<ClipperLib::IntPoint>>,std::reverse_iterator<std::vector<ClipperLib::IntPoint>*>,std::reverse_iterator<std::vector<ClipperLib::IntPoint>*>,std::reverse_iterator<std::vector<ClipperLib::IntPoint>*>>((uint64_t)(a1 + 2), a1[1], (void *)a1[1], *a1, (void *)*a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::vector<ClipperLib::IntPoint>>,std::reverse_iterator<std::vector<ClipperLib::IntPoint>*>,std::reverse_iterator<std::vector<ClipperLib::IntPoint>*>,std::reverse_iterator<std::vector<ClipperLib::IntPoint>*>>(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v14 = a6;
  *((void *)&v14 + 1) = a7;
  long long v13 = v14;
  v11[0] = a1;
  v11[1] = &v13;
  unint64_t v11[2] = &v14;
  if (a3 == a5)
  {
    uint64_t v9 = a6;
  }
  else
  {
    do
    {
      *(void *)(v7 - 24) = 0;
      *(void *)(v7 - 16) = 0;
      *(void *)(v7 - 8) = 0;
      long long v8 = *(_OWORD *)(a3 - 3);
      a3 -= 3;
      *(_OWORD *)(v7 - 24) = v8;
      *(void *)(v7 - 8) = a3[2];
      *a3 = 0;
      a3[1] = 0;
      a3[2] = 0;
      uint64_t v7 = *((void *)&v14 + 1) - 24;
      *((void *)&v14 + 1) -= 24;
    }
    while (a3 != a5);
    uint64_t v9 = v14;
  }
  char v12 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<ClipperLib::IntPoint>>,std::reverse_iterator<std::vector<ClipperLib::IntPoint>*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v11);
  return v9;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<ClipperLib::IntPoint>>,std::reverse_iterator<std::vector<ClipperLib::IntPoint>*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<ClipperLib::IntPoint>>,std::reverse_iterator<std::vector<ClipperLib::IntPoint>*>>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<ClipperLib::IntPoint>>,std::reverse_iterator<std::vector<ClipperLib::IntPoint>*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 16) + 8);
  uint64_t v2 = *(void *)(*(void *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    uint64_t v3 = *(void **)v1;
    if (*(void *)v1)
    {
      *(void *)(v1 + 8) = v3;
      operator delete(v3);
    }
    v1 += 24;
  }
}

uint64_t std::__split_buffer<std::vector<ClipperLib::IntPoint>>::~__split_buffer(uint64_t a1)
{
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void std::__split_buffer<std::vector<ClipperLib::IntPoint>>::__destruct_at_end[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  while (v2 != a2)
  {
    uint64_t v5 = *(void **)(v2 - 24);
    *(void *)(a1 + 16) = v2 - 24;
    if (v5)
    {
      *(void *)(v2 - 16) = v5;
      operator delete(v5);
      uint64_t v2 = *(void *)(a1 + 16);
    }
    else
    {
      v2 -= 24;
    }
  }
}

void std::vector<ClipperLib::PolyNode *>::__append(void **a1, unint64_t a2)
{
  uint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  uint64_t v5 = v6;
  uint64_t v7 = *(char **)(v4 - 8);
  if (a2 <= (v6 - v7) >> 3)
  {
    if (a2)
    {
      bzero(*(void **)(v4 - 8), 8 * a2);
      v7 += 8 * a2;
    }
    a1[1] = v7;
  }
  else
  {
    uint64_t v8 = v7 - (unsigned char *)*a1;
    unint64_t v9 = a2 + (v8 >> 3);
    if (v9 >> 61) {
      std::vector<ClipperLib::IntPoint>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v10 = v8 >> 3;
    uint64_t v11 = v5 - (unsigned char *)*a1;
    if (v11 >> 2 > v9) {
      unint64_t v9 = v11 >> 2;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v12 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v9;
    }
    if (v12) {
      long long v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::PolyNode *>>(v4, v12);
    }
    else {
      long long v13 = 0;
    }
    long long v14 = &v13[8 * v10];
    int64x2_t v15 = &v13[8 * v12];
    bzero(v14, 8 * a2);
    long long v16 = &v14[8 * a2];
    char v18 = (char *)*a1;
    long long v17 = (char *)a1[1];
    if (v17 != *a1)
    {
      do
      {
        uint64_t v19 = *((void *)v17 - 1);
        v17 -= 8;
        *((void *)v14 - 1) = v19;
        v14 -= 8;
      }
      while (v17 != v18);
      long long v17 = (char *)*a1;
    }
    *a1 = v14;
    a1[1] = v16;
    a1[2] = v15;
    if (v17)
    {
      operator delete(v17);
    }
  }
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::PolyNode *>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(8 * a2);
}

void std::__introsort<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *,false>(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, char a5)
{
LABEL_1:
  uint64_t v11 = (char *)a1;
LABEL_2:
  uint64_t v12 = 1 - a4;
  while (1)
  {
    a1 = (uint64_t)v11;
    uint64_t v13 = v12;
    uint64_t v14 = a2 - v11;
    unint64_t v15 = 0xAAAAAAAAAAAAAAABLL * ((a2 - v11) >> 3);
    if (!(!v6 & v5))
    {
      switch(v15)
      {
        case 0uLL:
        case 1uLL:
          return;
        case 2uLL:
          uint64_t v27 = *((void *)a2 - 3);
          uint64_t v26 = a2 - 24;
          if (*(void *)v11 < v27)
          {
            uint64_t v38 = *((void *)v11 + 2);
            long long v35 = *(_OWORD *)v11;
            long long v28 = *(_OWORD *)v26;
            *((void *)v11 + 2) = *((void *)v26 + 2);
            *(_OWORD *)uint64_t v11 = v28;
            *(_OWORD *)uint64_t v26 = v35;
            *((void *)v26 + 2) = v38;
          }
          break;
        case 3uLL:
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *>((long long *)v11, (uint64_t *)v11 + 3, (uint64_t *)a2 - 3);
          break;
        case 4uLL:
          std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *>((uint64_t)v11, (uint64_t *)v11 + 3, (uint64_t *)v11 + 6, (uint64_t)(a2 - 24));
          break;
        case 5uLL:
          std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *>((__n128 *)v11, (uint64_t *)v11 + 3, (uint64_t *)v11 + 6, (__n128 *)(v11 + 72), (__n128 *)(a2 - 24));
          break;
        default:
          JUMPOUT(0);
      }
      return;
    }
    if (v14 <= 575) {
      break;
    }
    if (v13 == 1)
    {
      if (v11 != a2)
      {
        std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *,ClipperLib::LocalMinimum *>(v11, a2, a2, a3);
      }
      return;
    }
    unint64_t v16 = v15 >> 1;
    long long v17 = (uint64_t *)&v11[24 * (v15 >> 1)];
    if ((unint64_t)v14 >= 0xC01)
    {
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *>((long long *)v11, (uint64_t *)&v11[24 * (v15 >> 1)], (uint64_t *)a2 - 3);
      uint64_t v18 = 3 * v16;
      uint64_t v19 = (uint64_t *)&v11[24 * v16 - 24];
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *>((long long *)(v11 + 24), v19, (uint64_t *)a2 - 6);
      uint64_t v20 = (long long *)(v11 + 48);
      uint64_t v21 = (uint64_t *)&v11[8 * v18 + 24];
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *>(v20, v21, (uint64_t *)a2 - 9);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *>((long long *)v19, v17, v21);
      uint64_t v37 = *(void *)(a1 + 16);
      long long v34 = *(_OWORD *)a1;
      long long v22 = *(_OWORD *)v17;
      *(void *)(a1 + 16) = v17[2];
      *(_OWORD *)a1 = v22;
      v17[2] = v37;
      *(_OWORD *)long long v17 = v34;
      if (a5) {
        goto LABEL_13;
      }
    }
    else
    {
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *>((long long *)&v11[24 * (v15 >> 1)], (uint64_t *)v11, (uint64_t *)a2 - 3);
      if (a5) {
        goto LABEL_13;
      }
    }
    if (*(void *)a1 >= *(void *)(a1 - 24))
    {
      uint64_t v11 = (char *)std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocalMinimum *,ClipperLib::LocMinSorter &>((void *)a1, (unint64_t)a2);
      goto LABEL_18;
    }
LABEL_13:
    uint64_t v23 = std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocalMinimum *,ClipperLib::LocMinSorter &>((uint64_t *)a1, (unint64_t)a2);
    if ((v24 & 1) == 0) {
      goto LABEL_16;
    }
    BOOL v25 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *>(a1, (uint64_t)v23);
    uint64_t v11 = (char *)(v23 + 3);
    if (std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *>((uint64_t)(v23 + 3), (uint64_t)a2))
    {
      a4 = -v13;
      a2 = (char *)v23;
      if (v25) {
        return;
      }
      goto LABEL_1;
    }
    uint64_t v12 = v13 + 1;
    if (!v25)
    {
LABEL_16:
      std::__introsort<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *,false>(a1, v23, a3, -v13, a5 & 1);
      uint64_t v11 = (char *)(v23 + 3);
LABEL_18:
      a5 = 0;
      a4 = -v13;
      goto LABEL_2;
    }
  }
  if (a5)
  {
    std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *>((uint64_t)v11, (uint64_t)a2);
  }
  else if (v11 != a2)
  {
    uint64_t v29 = v11 + 24;
    while (v29 != a2)
    {
      uint64_t v30 = (uint64_t)v29;
      uint64_t v31 = *(void *)(a1 + 24);
      if (*(void *)a1 < v31)
      {
        long long v36 = *(_OWORD *)(a1 + 32);
        uint64_t v32 = v30;
        do
        {
          *(_OWORD *)uint64_t v32 = *(_OWORD *)(v32 - 24);
          *(void *)(v32 + 16) = *(void *)(v32 - 8);
          uint64_t v33 = *(void *)(v32 - 48);
          v32 -= 24;
        }
        while (v33 < v31);
        *(void *)uint64_t v32 = v31;
        *(_OWORD *)(v32 + 8) = v36;
      }
      uint64_t v29 = (char *)(v30 + 24);
      a1 = v30;
    }
  }
}

uint64_t std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *>(uint64_t result, uint64_t a2)
{
  if (result != a2)
  {
    uint64_t v2 = result + 24;
    if (result + 24 != a2)
    {
      uint64_t v3 = 0;
      uint64_t v4 = result;
      do
      {
        uint64_t v5 = v2;
        uint64_t v6 = *(void *)(v4 + 24);
        if (*(void *)v4 < v6)
        {
          long long v10 = *(_OWORD *)(v4 + 32);
          uint64_t v7 = v3;
          while (1)
          {
            uint64_t v8 = result + v7;
            *(_OWORD *)(v8 + 24) = *(_OWORD *)(result + v7);
            *(void *)(v8 + 40) = *(void *)(result + v7 + 16);
            if (!v7) {
              break;
            }
            v7 -= 24;
            if (*(void *)(v8 - 24) >= v6)
            {
              uint64_t v9 = result + v7 + 24;
              goto LABEL_10;
            }
          }
          uint64_t v9 = result;
LABEL_10:
          *(void *)uint64_t v9 = v6;
          *(_OWORD *)(v9 + 8) = v10;
        }
        uint64_t v2 = v5 + 24;
        v3 += 24;
        uint64_t v4 = v5;
      }
      while (v5 + 24 != a2);
    }
  }
  return result;
}

uint64_t std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *>(long long *a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *a3;
  if (*(void *)a1 < *a2)
  {
    if (v3 < v4)
    {
      uint64_t v5 = *((void *)a1 + 2);
      long long v6 = *a1;
      uint64_t v7 = a3[2];
      *a1 = *(_OWORD *)a3;
      *((void *)a1 + 2) = v7;
      *(_OWORD *)a3 = v6;
      a3[2] = v5;
      return 1;
    }
    uint64_t v14 = *((void *)a1 + 2);
    long long v15 = *a1;
    uint64_t v16 = a2[2];
    *a1 = *(_OWORD *)a2;
    *((void *)a1 + 2) = v16;
    *(_OWORD *)a2 = v15;
    a2[2] = v14;
    if (*a2 >= *a3) {
      return 1;
    }
    uint64_t v17 = a2[2];
    long long v18 = *(_OWORD *)a2;
    uint64_t v19 = a3[2];
    *(_OWORD *)a2 = *(_OWORD *)a3;
    a2[2] = v19;
    *(_OWORD *)a3 = v18;
    a3[2] = v17;
    return 2;
  }
  if (v3 < v4)
  {
    uint64_t v8 = a2[2];
    long long v9 = *(_OWORD *)a2;
    uint64_t v10 = a3[2];
    *(_OWORD *)a2 = *(_OWORD *)a3;
    a2[2] = v10;
    *(_OWORD *)a3 = v9;
    a3[2] = v8;
    if (*(void *)a1 >= *a2) {
      return 1;
    }
    uint64_t v11 = *((void *)a1 + 2);
    long long v12 = *a1;
    uint64_t v13 = a2[2];
    *a1 = *(_OWORD *)a2;
    *((void *)a1 + 2) = v13;
    *(_OWORD *)a2 = v12;
    a2[2] = v11;
    return 2;
  }
  return 0;
}

void *std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocalMinimum *,ClipperLib::LocMinSorter &>(void *a1, unint64_t a2)
{
  uint64_t v2 = *a1;
  if (*(void *)(a2 - 24) >= *a1)
  {
    uint64_t v5 = a1 + 3;
    do
    {
      uint64_t v3 = v5;
      if ((unint64_t)v5 >= a2) {
        break;
      }
      v5 += 3;
    }
    while (*v3 >= v2);
  }
  else
  {
    uint64_t v3 = a1;
    do
    {
      uint64_t v4 = v3[3];
      v3 += 3;
    }
    while (v4 >= v2);
  }
  if ((unint64_t)v3 < a2)
  {
    do
    {
      uint64_t v6 = *(void *)(a2 - 24);
      a2 -= 24;
    }
    while (v6 < v2);
  }
  while ((unint64_t)v3 < a2)
  {
    uint64_t v14 = v3[2];
    long long v13 = *(_OWORD *)v3;
    long long v7 = *(_OWORD *)a2;
    v3[2] = *(void *)(a2 + 16);
    *(_OWORD *)uint64_t v3 = v7;
    *(void *)(a2 + 16) = v14;
    *(_OWORD *)a2 = v13;
    do
    {
      uint64_t v8 = v3[3];
      v3 += 3;
    }
    while (v8 >= v2);
    do
    {
      uint64_t v9 = *(void *)(a2 - 24);
      a2 -= 24;
    }
    while (v9 < v2);
  }
  if (v3 - 3 != a1)
  {
    long long v10 = *(_OWORD *)(v3 - 3);
    a1[2] = *(v3 - 1);
    *(_OWORD *)a1 = v10;
  }
  *(v3 - 3) = v2;
  *((_OWORD *)v3 - 1) = v12;
  return v3;
}

uint64_t *std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocalMinimum *,ClipperLib::LocMinSorter &>(uint64_t *a1, unint64_t a2)
{
  uint64_t v2 = 0;
  uint64_t v3 = *a1;
  do
  {
    uint64_t v4 = a1[v2 + 3];
    v2 += 3;
  }
  while (v3 < v4);
  uint64_t v5 = &a1[v2];
  if (v2 == 3)
  {
    do
    {
      if ((unint64_t)v5 >= a2) {
        break;
      }
      uint64_t v7 = *(void *)(a2 - 24);
      a2 -= 24;
    }
    while (v3 >= v7);
  }
  else
  {
    do
    {
      uint64_t v6 = *(void *)(a2 - 24);
      a2 -= 24;
    }
    while (v3 >= v6);
  }
  uint64_t v8 = &a1[v2];
  if ((unint64_t)v5 < a2)
  {
    unint64_t v9 = a2;
    do
    {
      long long v10 = *(_OWORD *)v8;
      uint64_t v11 = v8[2];
      uint64_t v12 = *(void *)(v9 + 16);
      *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
      unint64_t v8[2] = v12;
      *(void *)(v9 + 16) = v11;
      *(_OWORD *)unint64_t v9 = v10;
      do
      {
        uint64_t v13 = v8[3];
        v8 += 3;
      }
      while (v3 < v13);
      do
      {
        uint64_t v14 = *(void *)(v9 - 24);
        v9 -= 24;
      }
      while (v3 >= v14);
    }
    while ((unint64_t)v8 < v9);
  }
  if (v8 - 3 != a1)
  {
    long long v15 = *(_OWORD *)(v8 - 3);
    a1[2] = *(v8 - 1);
    *(_OWORD *)a1 = v15;
  }
  *(v8 - 3) = v3;
  *((_OWORD *)v8 - 1) = v17;
  return v8 - 3;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *>(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (a2 - a1) >> 3;
  BOOL result = 1;
  switch(0xAAAAAAAAAAAAAAABLL * v4)
  {
    case 0uLL:
    case 1uLL:
      return result;
    case 2uLL:
      uint64_t v6 = (long long *)(a2 - 24);
      if (*(void *)a1 < *(void *)(a2 - 24))
      {
        uint64_t v7 = *(void *)(a1 + 16);
        long long v8 = *(_OWORD *)a1;
        uint64_t v9 = *(void *)(a2 - 8);
        *(_OWORD *)a1 = *v6;
        *(void *)(a1 + 16) = v9;
        long long *v6 = v8;
        *(void *)(a2 - 8) = v7;
      }
      return result;
    case 3uLL:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *>((long long *)a1, (uint64_t *)(a1 + 24), (uint64_t *)(a2 - 24));
      return 1;
    case 4uLL:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *>(a1, (uint64_t *)(a1 + 24), (uint64_t *)(a1 + 48), a2 - 24);
      return 1;
    case 5uLL:
      std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *>((__n128 *)a1, (uint64_t *)(a1 + 24), (uint64_t *)(a1 + 48), (__n128 *)(a1 + 72), (__n128 *)(a2 - 24));
      return 1;
    default:
      long long v10 = (void *)(a1 + 48);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *>((long long *)a1, (uint64_t *)(a1 + 24), (uint64_t *)(a1 + 48));
      uint64_t v11 = a1 + 72;
      if (a1 + 72 == a2) {
        return 1;
      }
      uint64_t v12 = 0;
      int v13 = 0;
      break;
  }
  while (1)
  {
    uint64_t v14 = *(void *)v11;
    if (*v10 < *(void *)v11)
    {
      long long v18 = *(_OWORD *)(v11 + 8);
      uint64_t v15 = v12;
      while (1)
      {
        uint64_t v16 = a1 + v15;
        *(_OWORD *)(v16 + 72) = *(_OWORD *)(a1 + v15 + 48);
        *(void *)(v16 + 88) = *(void *)(a1 + v15 + 64);
        if (v15 == -48) {
          break;
        }
        v15 -= 24;
        if (*(void *)(v16 + 24) >= v14)
        {
          uint64_t v17 = a1 + v15 + 72;
          goto LABEL_12;
        }
      }
      uint64_t v17 = a1;
LABEL_12:
      *(void *)uint64_t v17 = v14;
      *(_OWORD *)(v17 + 8) = v18;
      if (++v13 == 8) {
        return v11 + 24 == a2;
      }
    }
    long long v10 = (void *)v11;
    v12 += 24;
    v11 += 24;
    if (v11 == a2) {
      return 1;
    }
  }
}

__n128 std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *>(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t a4)
{
  std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *>((long long *)a1, a2, a3);
  if (*a3 < *(void *)a4)
  {
    uint64_t v9 = a3[2];
    __n128 result = *(__n128 *)a3;
    uint64_t v10 = *(void *)(a4 + 16);
    *(_OWORD *)a3 = *(_OWORD *)a4;
    a3[2] = v10;
    *(__n128 *)a4 = result;
    *(void *)(a4 + 16) = v9;
    if (*a2 < *a3)
    {
      uint64_t v11 = a2[2];
      __n128 result = *(__n128 *)a2;
      uint64_t v12 = a3[2];
      *(_OWORD *)a2 = *(_OWORD *)a3;
      a2[2] = v12;
      *(__n128 *)a3 = result;
      a3[2] = v11;
      if (*(void *)a1 < *a2)
      {
        uint64_t v13 = *(void *)(a1 + 16);
        __n128 result = *(__n128 *)a1;
        uint64_t v14 = a2[2];
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(void *)(a1 + 16) = v14;
        *(__n128 *)a2 = result;
        a2[2] = v13;
      }
    }
  }
  return result;
}

__n128 std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *>(__n128 *a1, uint64_t *a2, uint64_t *a3, __n128 *a4, __n128 *a5)
{
  result.n128_u64[0] = std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *>((uint64_t)a1, a2, a3, (uint64_t)a4).n128_u64[0];
  if ((int64_t)a4->n128_u64[0] < (int64_t)a5->n128_u64[0])
  {
    unint64_t v11 = a4[1].n128_u64[0];
    __n128 result = *a4;
    unint64_t v12 = a5[1].n128_u64[0];
    *a4 = *a5;
    a4[1].n128_u64[0] = v12;
    *a5 = result;
    a5[1].n128_u64[0] = v11;
    if (*a3 < (int64_t)a4->n128_u64[0])
    {
      uint64_t v13 = a3[2];
      __n128 result = *(__n128 *)a3;
      uint64_t v14 = a4[1].n128_i64[0];
      *(__n128 *)a3 = *a4;
      a3[2] = v14;
      *a4 = result;
      a4[1].n128_u64[0] = v13;
      if (*a2 < *a3)
      {
        uint64_t v15 = a2[2];
        __n128 result = *(__n128 *)a2;
        uint64_t v16 = a3[2];
        *(_OWORD *)a2 = *(_OWORD *)a3;
        a2[2] = v16;
        *(__n128 *)a3 = result;
        a3[2] = v15;
        if ((int64_t)a1->n128_u64[0] < *a2)
        {
          uint64_t v17 = a1[1].n128_i64[0];
          __n128 result = *a1;
          uint64_t v18 = a2[2];
          *a1 = *(__n128 *)a2;
          a1[1].n128_u64[0] = v18;
          *(__n128 *)a2 = result;
          a2[2] = v17;
        }
      }
    }
  }
  return result;
}

char *std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *,ClipperLib::LocalMinimum *>(char *a1, char *a2, char *a3, uint64_t a4)
{
  if (a1 != a2)
  {
    uint64_t v6 = a2;
    uint64_t v8 = a2 - a1;
    uint64_t v9 = (a2 - a1) / 24;
    if (a2 - a1 >= 25)
    {
      unint64_t v10 = (unint64_t)(v9 - 2) >> 1;
      unint64_t v11 = v10 + 1;
      unint64_t v12 = &a1[24 * v10];
      do
      {
        std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *>((uint64_t)a1, a4, v9, v12);
        v12 -= 24;
        --v11;
      }
      while (v11);
    }
    uint64_t v13 = v6;
    if (v6 != a3)
    {
      uint64_t v14 = v6;
      do
      {
        if (*(void *)a1 < *(void *)v14)
        {
          uint64_t v15 = *((void *)v14 + 2);
          long long v16 = *(_OWORD *)v14;
          uint64_t v17 = *((void *)a1 + 2);
          *(_OWORD *)uint64_t v14 = *(_OWORD *)a1;
          *((void *)v14 + 2) = v17;
          *(_OWORD *)a1 = v16;
          *((void *)a1 + 2) = v15;
          std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *>((uint64_t)a1, a4, v9, a1);
        }
        v14 += 24;
      }
      while (v14 != a3);
      uint64_t v13 = a3;
    }
    if (v8 >= 25)
    {
      int64_t v18 = v8 / 0x18uLL;
      do
      {
        uint64_t v19 = 0;
        long long v28 = *(_OWORD *)a1;
        uint64_t v29 = *((void *)a1 + 2);
        uint64_t v20 = a1;
        do
        {
          uint64_t v21 = &v20[24 * v19 + 24];
          uint64_t v22 = (2 * v19) | 1;
          uint64_t v23 = 2 * v19 + 2;
          if (v23 < v18 && *((void *)v21 + 3) < *(void *)v21)
          {
            v21 += 24;
            uint64_t v22 = v23;
          }
          long long v24 = *(_OWORD *)v21;
          *((void *)v20 + 2) = *((void *)v21 + 2);
          *(_OWORD *)uint64_t v20 = v24;
          uint64_t v20 = v21;
          uint64_t v19 = v22;
        }
        while (v22 <= (uint64_t)((unint64_t)(v18 - 2) >> 1));
        v6 -= 24;
        if (v21 == v6)
        {
          *((void *)v21 + 2) = v29;
          *(_OWORD *)uint64_t v21 = v28;
        }
        else
        {
          long long v25 = *(_OWORD *)v6;
          *((void *)v21 + 2) = *((void *)v6 + 2);
          *(_OWORD *)uint64_t v21 = v25;
          *(_OWORD *)uint64_t v6 = v28;
          *((void *)v6 + 2) = v29;
          std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *>((uint64_t)a1, (uint64_t)(v21 + 24), a4, 0xAAAAAAAAAAAAAAABLL * ((v21 + 24 - a1) >> 3));
        }
      }
      while (v18-- > 2);
    }
    return v13;
  }
  return a3;
}

__n128 std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *>(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a3 >= 2)
  {
    int64_t v4 = (unint64_t)(a3 - 2) >> 1;
    if (v4 >= (uint64_t)(0xAAAAAAAAAAAAAAABLL * (((uint64_t)a4 - a1) >> 3)))
    {
      uint64_t v5 = (0x5555555555555556 * (((uint64_t)a4 - a1) >> 3)) | 1;
      uint64_t v6 = (void *)(a1 + 24 * v5);
      if (0x5555555555555556 * (((uint64_t)a4 - a1) >> 3) + 2 >= a3)
      {
        uint64_t v7 = *v6;
      }
      else
      {
        uint64_t v7 = v6[3];
        BOOL v9 = __OFSUB__(v7, *v6);
        BOOL v8 = v7 - *v6 < 0;
        if (v7 >= *v6) {
          uint64_t v7 = *v6;
        }
        if (v8 != v9)
        {
          v6 += 3;
          uint64_t v5 = 0x5555555555555556 * (((uint64_t)a4 - a1) >> 3) + 2;
        }
      }
      uint64_t v10 = *a4;
      if (*a4 >= v7)
      {
        __n128 v18 = *(__n128 *)(a4 + 1);
        do
        {
          unint64_t v11 = a4;
          a4 = v6;
          long long v12 = *(_OWORD *)v6;
          unint64_t v11[2] = v6[2];
          *(_OWORD *)unint64_t v11 = v12;
          if (v4 < v5) {
            break;
          }
          uint64_t v13 = (2 * v5) | 1;
          uint64_t v6 = (void *)(a1 + 24 * v13);
          uint64_t v5 = 2 * v5 + 2;
          if (v5 >= a3)
          {
            uint64_t v14 = *v6;
            uint64_t v5 = v13;
          }
          else
          {
            uint64_t v14 = v6[3];
            BOOL v16 = __OFSUB__(v14, *v6);
            BOOL v15 = v14 - *v6 < 0;
            if (v14 >= *v6) {
              uint64_t v14 = *v6;
            }
            if (v15 != v16) {
              v6 += 3;
            }
            else {
              uint64_t v5 = v13;
            }
          }
        }
        while (v10 >= v14);
        *a4 = v10;
        __n128 result = v18;
        *(__n128 *)(a4 + 1) = v18;
      }
    }
  }
  return result;
}

__n128 std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4 >= 2)
  {
    unint64_t v4 = (unint64_t)(a4 - 2) >> 1;
    uint64_t v5 = (long long *)(a1 + 24 * v4);
    uint64_t v6 = (long long *)(a2 - 24);
    uint64_t v7 = *(void *)(a2 - 24);
    if (v7 < *(void *)v5)
    {
      __n128 v11 = *(__n128 *)(a2 - 16);
      do
      {
        BOOL v8 = v6;
        uint64_t v6 = v5;
        long long v9 = *v5;
        *((void *)v8 + 2) = *((void *)v5 + 2);
        *BOOL v8 = v9;
        if (!v4) {
          break;
        }
        unint64_t v4 = (v4 - 1) >> 1;
        uint64_t v5 = (long long *)(a1 + 24 * v4);
      }
      while (v7 < *(void *)v5);
      *(void *)uint64_t v6 = v7;
      __n128 result = v11;
      *(long long *)((char *)v6 + 8) = (__int128)v11;
    }
  }
  return result;
}

void std::vector<std::vector<ClipperLib::IntPoint>>::__append(uint64_t *a1, unint64_t a2)
{
  uint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  uint64_t v5 = v6;
  uint64_t v7 = *(void *)(v4 - 8);
  if (0xAAAAAAAAAAAAAAABLL * ((v6 - v7) >> 3) >= a2)
  {
    if (a2)
    {
      size_t v13 = 24 * ((24 * a2 - 24) / 0x18) + 24;
      bzero(*(void **)(v4 - 8), v13);
      v7 += v13;
    }
    a1[1] = v7;
  }
  else
  {
    unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((v7 - *a1) >> 3);
    unint64_t v9 = v8 + a2;
    if (v8 + a2 > 0xAAAAAAAAAAAAAAALL) {
      std::vector<ClipperLib::IntPoint>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * ((v5 - *a1) >> 3);
    if (2 * v10 > v9) {
      unint64_t v9 = 2 * v10;
    }
    if (v10 >= 0x555555555555555) {
      unint64_t v11 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v11 = v9;
    }
    uint64_t v19 = v4;
    if (v11) {
      long long v12 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::IntPoint>>(v4, v11);
    }
    else {
      long long v12 = 0;
    }
    BOOL v15 = v12;
    BOOL v16 = &v12[24 * v8];
    __n128 v18 = &v12[24 * v11];
    size_t v14 = 24 * ((24 * a2 - 24) / 0x18) + 24;
    bzero(v16, v14);
    uint64_t v17 = &v16[v14];
    std::vector<std::vector<ClipperLib::IntPoint>>::__swap_out_circular_buffer(a1, &v15);
    std::__split_buffer<std::vector<ClipperLib::IntPoint>>::~__split_buffer((uint64_t)&v15);
  }
}

void sub_1DB28B1BC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<std::vector<ClipperLib::IntPoint>>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::list<long long>::__move_assign(uint64_t *a1, void *a2)
{
  return std::list<long long>::splice((uint64_t)a1, a1, a2);
}

uint64_t std::list<long long>::splice(uint64_t result, uint64_t *a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (v3)
  {
    uint64_t v5 = *a3;
    uint64_t v4 = (uint64_t *)a3[1];
    uint64_t v6 = *v4;
    *(void *)(v6 + 8) = *(void *)(*a3 + 8);
    **(void **)(v5 + 8) = v6;
    uint64_t v7 = *a2;
    *(void *)(v7 + 8) = v4;
    uint64_t *v4 = v7;
    *a2 = v5;
    *(void *)(v5 + 8) = a2;
    *(void *)(result + 16) += v3;
    a3[2] = 0;
  }
  return result;
}

uint64_t std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **,false>(uint64_t result, char *a2, uint64_t (**a3)(uint64_t, uint64_t), uint64_t a4, char a5)
{
  unint64_t v10 = (char *)result;
LABEL_2:
  unint64_t v11 = v10;
LABEL_3:
  uint64_t v12 = 1 - a4;
  while (1)
  {
    unint64_t v10 = v11;
    uint64_t v13 = v12;
    uint64_t v14 = a2 - v11;
    unint64_t v15 = (a2 - v11) >> 3;
    if (!(!v6 & v5))
    {
      switch(v15)
      {
        case 0uLL:
        case 1uLL:
          return result;
        case 2uLL:
          __n128 result = (*a3)(*((void *)a2 - 1), *(void *)v11);
          if (result)
          {
            uint64_t v22 = *(void *)v11;
            *(void *)unint64_t v11 = *((void *)a2 - 1);
            *((void *)a2 - 1) = v22;
          }
          break;
        case 3uLL:
          __n128 result = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>(v11, (void *)v11 + 1, (void *)a2 - 1, (unsigned int (**)(void))a3);
          break;
        case 4uLL:
          __n128 result = std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>(v11, (void *)v11 + 1, (void *)v11 + 2, (void *)a2 - 1, (unsigned int (**)(void))a3);
          break;
        case 5uLL:
          __n128 result = std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>(v11, (void *)v11 + 1, (void *)v11 + 2, (void *)v11 + 3, (void *)a2 - 1, (unsigned int (**)(void))a3);
          break;
        default:
          JUMPOUT(0);
      }
      return result;
    }
    if (v14 <= 191) {
      break;
    }
    if (v13 == 1)
    {
      if (v11 != a2)
      {
        return (uint64_t)std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **,ClipperLib::IntersectNode **>(v11, a2, (uint64_t *)a2, a3);
      }
      return result;
    }
    unint64_t v16 = v15 >> 1;
    uint64_t v17 = &v11[8 * (v15 >> 1)];
    if ((unint64_t)v14 >= 0x401)
    {
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>(v11, &v11[8 * (v15 >> 1)], (void *)a2 - 1, (unsigned int (**)(void))a3);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>((void *)v11 + 1, (void *)v17 - 1, (void *)a2 - 2, (unsigned int (**)(void))a3);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>((void *)v11 + 2, &v11[8 * v16 + 8], (void *)a2 - 3, (unsigned int (**)(void))a3);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>((void *)v17 - 1, v17, &v11[8 * v16 + 8], (unsigned int (**)(void))a3);
      uint64_t v18 = *(void *)v11;
      *(void *)unint64_t v11 = *(void *)v17;
      *(void *)uint64_t v17 = v18;
      if (a5) {
        goto LABEL_14;
      }
    }
    else
    {
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>(&v11[8 * (v15 >> 1)], v11, (void *)a2 - 1, (unsigned int (**)(void))a3);
      if (a5) {
        goto LABEL_14;
      }
    }
    if (((*a3)(*((void *)v11 - 1), *(void *)v11) & 1) == 0)
    {
      __n128 result = (uint64_t)std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::IntersectNode **,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *)>((uint64_t *)v11, (uint64_t *)a2, a3);
      unint64_t v11 = (char *)result;
      goto LABEL_19;
    }
LABEL_14:
    uint64_t v19 = std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::IntersectNode **,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *)>((uint64_t *)v11, (uint64_t *)a2, a3);
    if ((v20 & 1) == 0) {
      goto LABEL_17;
    }
    BOOL v21 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>(v11, v19, (unsigned int (**)(void))a3);
    unint64_t v11 = (char *)(v19 + 1);
    __n128 result = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>(v19 + 1, a2, (unsigned int (**)(void))a3);
    if (result)
    {
      a4 = -v13;
      a2 = (char *)v19;
      if (v21) {
        return result;
      }
      goto LABEL_2;
    }
    uint64_t v12 = v13 + 1;
    if (!v21)
    {
LABEL_17:
      __n128 result = std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **,false>(v10, v19, a3, -v13, a5 & 1);
      unint64_t v11 = (char *)(v19 + 1);
LABEL_19:
      a5 = 0;
      a4 = -v13;
      goto LABEL_3;
    }
  }
  if (a5)
  {
    return std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>((uint64_t)v11, (uint64_t *)a2, a3);
  }
  else
  {
    return std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>((uint64_t)v11, a2, a3);
  }
}

uint64_t std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>(uint64_t result, uint64_t *a2, uint64_t (**a3)(uint64_t, uint64_t))
{
  if ((uint64_t *)result != a2)
  {
    uint64_t v4 = (void *)result;
    char v5 = (uint64_t *)(result + 8);
    if ((uint64_t *)(result + 8) != a2)
    {
      uint64_t v7 = 0;
      unint64_t v8 = (uint64_t *)result;
      do
      {
        uint64_t v10 = *v8;
        uint64_t v9 = v8[1];
        unint64_t v8 = v5;
        __n128 result = (*a3)(v9, v10);
        if (result)
        {
          uint64_t v11 = *v8;
          uint64_t v12 = v7;
          while (1)
          {
            *(void *)((char *)v4 + v12 + 8) = *(void *)((char *)v4 + v12);
            if (!v12) {
              break;
            }
            __n128 result = (*a3)(v11, *(void *)((char *)v4 + v12 - 8));
            v12 -= 8;
            if ((result & 1) == 0)
            {
              uint64_t v13 = (void *)((char *)v4 + v12 + 8);
              goto LABEL_10;
            }
          }
          uint64_t v13 = v4;
LABEL_10:
          void *v13 = v11;
        }
        char v5 = v8 + 1;
        v7 += 8;
      }
      while (v8 + 1 != a2);
    }
  }
  return result;
}

uint64_t std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>(uint64_t result, void *a2, uint64_t (**a3)(uint64_t, uint64_t))
{
  if ((void *)result != a2)
  {
    uint64_t v4 = (void *)result;
    for (uint64_t i = (void *)(result + 8); v4 + 1 != a2; uint64_t i = v4 + 1)
    {
      uint64_t v8 = *v4;
      uint64_t v7 = v4[1];
      uint64_t v4 = i;
      __n128 result = (*a3)(v7, v8);
      if (result)
      {
        uint64_t v9 = *v4;
        uint64_t v10 = v4;
        do
        {
          uint64_t v11 = v10;
          uint64_t v12 = *--v10;
          void *v11 = v12;
          __n128 result = (*a3)(v9, *(v11 - 2));
        }
        while ((result & 1) != 0);
        void *v10 = v9;
      }
    }
  }
  return result;
}

uint64_t std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>(void *a1, void *a2, void *a3, unsigned int (**a4)(void))
{
  char v8 = ((uint64_t (*)(void, void))*a4)(*a2, *a1);
  uint64_t result = ((uint64_t (*)(void, void))*a4)(*a3, *a2);
  if ((v8 & 1) == 0)
  {
    if (!result) {
      return result;
    }
    uint64_t v11 = *a2;
    *a2 = *a3;
    *a3 = v11;
    if (!((unsigned int (*)(void, void))*a4)(*a2, *a1)) {
      return 1;
    }
    uint64_t v12 = *a1;
    *a1 = *a2;
    *a2 = v12;
    return 2;
  }
  uint64_t v10 = *a1;
  if (!result)
  {
    *a1 = *a2;
    *a2 = v10;
    if (!(*a4)(*a3)) {
      return 1;
    }
    uint64_t v13 = *a2;
    *a2 = *a3;
    *a3 = v13;
    return 2;
  }
  *a1 = *a3;
  *a3 = v10;
  return 1;
}

uint64_t *std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::IntersectNode **,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *)>(uint64_t *a1, uint64_t *a2, uint64_t (**a3)(uint64_t, uint64_t))
{
  uint64_t v4 = a2;
  uint64_t v6 = *a1;
  if ((*a3)(*a1, *(a2 - 1)))
  {
    uint64_t v7 = a1;
    do
    {
      uint64_t v8 = v7[1];
      ++v7;
    }
    while (((*a3)(v6, v8) & 1) == 0);
  }
  else
  {
    uint64_t v9 = a1 + 1;
    do
    {
      uint64_t v7 = v9;
      if (v9 >= v4) {
        break;
      }
      ++v9;
    }
    while (!(*a3)(v6, *v7));
  }
  if (v7 < v4)
  {
    do
      uint64_t v10 = *--v4;
    while (((*a3)(v6, v10) & 1) != 0);
  }
  while (v7 < v4)
  {
    uint64_t v11 = *v7;
    uint64_t *v7 = *v4;
    uint64_t *v4 = v11;
    do
    {
      uint64_t v12 = v7[1];
      ++v7;
    }
    while (!(*a3)(v6, v12));
    do
      uint64_t v13 = *--v4;
    while (((*a3)(v6, v13) & 1) != 0);
  }
  if (v7 - 1 != a1) {
    *a1 = *(v7 - 1);
  }
  *(v7 - 1) = v6;
  return v7;
}

uint64_t *std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::IntersectNode **,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *)>(uint64_t *a1, uint64_t *a2, uint64_t (**a3)(uint64_t, uint64_t))
{
  uint64_t v6 = 0;
  uint64_t v7 = *a1;
  do
    char v8 = (*a3)(a1[++v6], v7);
  while ((v8 & 1) != 0);
  uint64_t v9 = &a1[v6];
  uint64_t v10 = &a1[v6 - 1];
  if (v6 == 1)
  {
    do
    {
      if (v9 >= a2) {
        break;
      }
      uint64_t v12 = *--a2;
    }
    while (((*a3)(v12, v7) & 1) == 0);
  }
  else
  {
    do
      uint64_t v11 = *--a2;
    while (!(*a3)(v11, v7));
  }
  if (v9 < a2)
  {
    uint64_t v13 = &a1[v6];
    uint64_t v14 = a2;
    do
    {
      uint64_t v15 = *v13;
      uint64_t *v13 = *v14;
      uint64_t *v14 = v15;
      do
      {
        uint64_t v16 = v13[1];
        ++v13;
      }
      while (((*a3)(v16, v7) & 1) != 0);
      do
        uint64_t v17 = *--v14;
      while (!(*a3)(v17, v7));
    }
    while (v13 < v14);
    uint64_t v10 = v13 - 1;
  }
  if (v10 != a1) {
    *a1 = *v10;
  }
  uint64_t *v10 = v7;
  return v10;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>(void *a1, void *a2, unsigned int (**a3)(void))
{
  uint64_t v6 = a2 - a1;
  BOOL result = 1;
  switch(v6)
  {
    case 0:
    case 1:
      return result;
    case 2:
      if (((unsigned int (*)(void, void))*a3)(*(a2 - 1), *a1))
      {
        uint64_t v8 = *a1;
        *a1 = *(a2 - 1);
        *(a2 - 1) = v8;
      }
      return 1;
    case 3:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>(a1, a1 + 1, a2 - 1, a3);
      return 1;
    case 4:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>(a1, a1 + 1, a1 + 2, a2 - 1, a3);
      return 1;
    case 5:
      std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>(a1, a1 + 1, a1 + 2, a1 + 3, a2 - 1, a3);
      return 1;
    default:
      uint64_t v9 = a1 + 2;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>(a1, a1 + 1, a1 + 2, a3);
      uint64_t v10 = a1 + 3;
      if (a1 + 3 == a2) {
        return 1;
      }
      uint64_t v11 = 0;
      int v12 = 0;
      break;
  }
  while (1)
  {
    if (((unsigned int (*)(void, void))*a3)(*v10, *v9))
    {
      uint64_t v13 = *v10;
      uint64_t v14 = v11;
      while (1)
      {
        uint64_t v15 = (char *)a1 + v14;
        *(void *)((char *)a1 + v14 + 24) = *(void *)((char *)a1 + v14 + 16);
        if (v14 == -16) {
          break;
        }
        v14 -= 8;
        if ((((uint64_t (*)(uint64_t, void))*a3)(v13, *((void *)v15 + 1)) & 1) == 0)
        {
          uint64_t v16 = (void *)((char *)a1 + v14 + 24);
          goto LABEL_12;
        }
      }
      uint64_t v16 = a1;
LABEL_12:
      void *v16 = v13;
      if (++v12 == 8) {
        return v10 + 1 == a2;
      }
    }
    uint64_t v9 = v10;
    v11 += 8;
    if (++v10 == a2) {
      return 1;
    }
  }
}

uint64_t std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>(void *a1, void *a2, void *a3, void *a4, unsigned int (**a5)(void))
{
  std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>(a1, a2, a3, a5);
  uint64_t result = ((uint64_t (*)(void, void))*a5)(*a4, *a3);
  if (result)
  {
    uint64_t v11 = *a3;
    *a3 = *a4;
    *a4 = v11;
    uint64_t result = ((uint64_t (*)(void, void))*a5)(*a3, *a2);
    if (result)
    {
      uint64_t v12 = *a2;
      *a2 = *a3;
      *a3 = v12;
      uint64_t result = ((uint64_t (*)(void, void))*a5)(*a2, *a1);
      if (result)
      {
        uint64_t v13 = *a1;
        *a1 = *a2;
        *a2 = v13;
      }
    }
  }
  return result;
}

uint64_t std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>(void *a1, void *a2, void *a3, void *a4, void *a5, unsigned int (**a6)(void))
{
  std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>(a1, a2, a3, a4, a6);
  uint64_t result = ((uint64_t (*)(void, void))*a6)(*a5, *a4);
  if (result)
  {
    uint64_t v13 = *a4;
    *a4 = *a5;
    *a5 = v13;
    uint64_t result = ((uint64_t (*)(void, void))*a6)(*a4, *a3);
    if (result)
    {
      uint64_t v14 = *a3;
      *a3 = *a4;
      *a4 = v14;
      uint64_t result = ((uint64_t (*)(void, void))*a6)(*a3, *a2);
      if (result)
      {
        uint64_t v15 = *a2;
        *a2 = *a3;
        *a3 = v15;
        uint64_t result = ((uint64_t (*)(void, void))*a6)(*a2, *a1);
        if (result)
        {
          uint64_t v16 = *a1;
          *a1 = *a2;
          *a2 = v16;
        }
      }
    }
  }
  return result;
}

uint64_t *std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **,ClipperLib::IntersectNode **>(char *a1, char *a2, uint64_t *a3, uint64_t (**a4)(uint64_t, uint64_t))
{
  if (a1 != a2)
  {
    uint64_t v8 = a2 - a1;
    uint64_t v9 = (a2 - a1) >> 3;
    if (a2 - a1 >= 9)
    {
      unint64_t v10 = (unint64_t)(v9 - 2) >> 1;
      unint64_t v11 = v10 + 1;
      uint64_t v12 = &a1[8 * v10];
      do
      {
        std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>((uint64_t)a1, (unsigned int (**)(void, void))a4, v9, v12);
        v12 -= 8;
        --v11;
      }
      while (v11);
    }
    uint64_t v13 = a2;
    if (a2 != (char *)a3)
    {
      uint64_t v14 = (uint64_t *)a2;
      do
      {
        if ((*a4)(*v14, *(void *)a1))
        {
          uint64_t v15 = *v14;
          uint64_t *v14 = *(void *)a1;
          *(void *)a1 = v15;
          std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>((uint64_t)a1, (unsigned int (**)(void, void))a4, v9, a1);
        }
        ++v14;
      }
      while (v14 != a3);
      uint64_t v13 = (char *)a3;
    }
    if (v8 >= 9)
    {
      uint64_t v16 = (unint64_t)v8 >> 3;
      uint64_t v17 = a2 - 8;
      do
      {
        uint64_t v18 = *(void *)a1;
        uint64_t v19 = (char *)std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>(a1, (unsigned int (**)(void, void))a4, v16);
        if (v17 == v19)
        {
          *(void *)uint64_t v19 = v18;
        }
        else
        {
          *(void *)uint64_t v19 = *(void *)v17;
          *(void *)uint64_t v17 = v18;
          std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>((uint64_t)a1, (uint64_t)(v19 + 8), a4, (v19 + 8 - a1) >> 3);
        }
        v17 -= 8;
      }
      while (v16-- > 2);
    }
    return (uint64_t *)v13;
  }
  return a3;
}

uint64_t std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>(uint64_t result, unsigned int (**a2)(void, void), uint64_t a3, void *a4)
{
  unint64_t v4 = a3 - 2;
  if (a3 >= 2)
  {
    char v5 = a4;
    uint64_t v6 = result;
    int64_t v7 = v4 >> 1;
    if ((uint64_t)(v4 >> 1) >= ((uint64_t)a4 - result) >> 3)
    {
      uint64_t v10 = ((uint64_t)a4 - result) >> 2;
      uint64_t v11 = v10 + 1;
      uint64_t v12 = (void *)(result + 8 * (v10 + 1));
      uint64_t v13 = v10 + 2;
      if (v10 + 2 < a3 && (*a2)(*v12, v12[1]))
      {
        ++v12;
        uint64_t v11 = v13;
      }
      uint64_t result = ((uint64_t (*)(void, void))*a2)(*v12, *v5);
      if ((result & 1) == 0)
      {
        uint64_t v14 = *v5;
        do
        {
          uint64_t v15 = v12;
          void *v5 = *v12;
          if (v7 < v11) {
            break;
          }
          uint64_t v16 = (2 * v11) | 1;
          uint64_t v12 = (void *)(v6 + 8 * v16);
          if (2 * v11 + 2 < a3)
          {
            if ((*a2)(*v12, v12[1]))
            {
              ++v12;
              uint64_t v16 = 2 * v11 + 2;
            }
          }
          uint64_t result = ((uint64_t (*)(void, uint64_t))*a2)(*v12, v14);
          char v5 = v15;
          uint64_t v11 = v16;
        }
        while (!result);
        void *v15 = v14;
      }
    }
  }
  return result;
}

void *std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>(void *a1, unsigned int (**a2)(void, void), uint64_t a3)
{
  uint64_t v6 = 0;
  uint64_t v7 = a3 - 2;
  if (a3 < 2) {
    uint64_t v7 = a3 - 1;
  }
  uint64_t v8 = v7 >> 1;
  do
  {
    uint64_t v9 = &a1[v6 + 1];
    uint64_t v10 = (2 * v6) | 1;
    uint64_t v11 = 2 * v6 + 2;
    if (v11 < a3 && (*a2)(a1[v6 + 1], a1[v6 + 2]))
    {
      ++v9;
      uint64_t v10 = v11;
    }
    *a1 = *v9;
    a1 = v9;
    uint64_t v6 = v10;
  }
  while (v10 <= v8);
  return v9;
}

uint64_t std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>(uint64_t result, uint64_t a2, uint64_t (**a3)(uint64_t, uint64_t), uint64_t a4)
{
  unint64_t v4 = a4 - 2;
  if (a4 >= 2)
  {
    uint64_t v6 = result;
    unint64_t v7 = v4 >> 1;
    uint64_t v8 = (uint64_t *)(result + 8 * (v4 >> 1));
    uint64_t v9 = (uint64_t *)(a2 - 8);
    uint64_t result = (*a3)(*v8, *(void *)(a2 - 8));
    if (result)
    {
      uint64_t v10 = *v9;
      do
      {
        uint64_t v11 = v8;
        *uint64_t v9 = *v8;
        if (!v7) {
          break;
        }
        unint64_t v7 = (v7 - 1) >> 1;
        uint64_t v8 = (uint64_t *)(v6 + 8 * v7);
        uint64_t result = (*a3)(*v8, v10);
        uint64_t v9 = v11;
      }
      while ((result & 1) != 0);
      uint64_t *v11 = v10;
    }
  }
  return result;
}

uint64_t *std::list<long long>::__sort<std::__less<void,void>>(uint64_t *result, uint64_t *a2, unint64_t a3, uint64_t a4)
{
  if (a3 >= 2)
  {
    if (a3 == 2)
    {
      char v5 = (uint64_t *)*a2;
      if (*(void *)(*a2 + 16) < result[2])
      {
        uint64_t v6 = *v5;
        *(void *)(v6 + 8) = v5[1];
        *(void *)v5[1] = v6;
        uint64_t v7 = *result;
        *(void *)(v7 + 8) = v5;
        uint64_t *v5 = v7;
        char *result = (uint64_t)v5;
        v5[1] = (uint64_t)result;
        return v5;
      }
    }
    else
    {
      unint64_t v10 = a3 >> 1;
      unint64_t v11 = (a3 >> 1) + 1;
      uint64_t v12 = result;
      do
      {
        uint64_t v12 = (uint64_t *)v12[1];
        --v11;
      }
      while (v11 > 1);
      uint64_t v13 = (uint64_t *)std::list<long long>::__sort<std::__less<void,void>>(result, v12, a3 >> 1, a4);
      uint64_t result = (uint64_t *)std::list<long long>::__sort<std::__less<void,void>>(v12, a2, a3 - v10, a4);
      uint64_t v14 = v13[2];
      if (result[2] >= v14)
      {
        uint64_t v16 = (uint64_t *)v13[1];
        uint64_t i = result;
        uint64_t result = v13;
      }
      else
      {
        for (uint64_t i = (uint64_t *)result[1]; i != a2; uint64_t i = (uint64_t *)i[1])
        {
          if (i[2] >= v14) {
            goto LABEL_14;
          }
        }
        uint64_t i = a2;
LABEL_14:
        uint64_t v17 = *i;
        uint64_t v18 = *result;
        *(void *)(v18 + 8) = *(void *)(*i + 8);
        **(void **)(v17 + 8) = v18;
        uint64_t v19 = *v13;
        uint64_t v16 = (uint64_t *)v13[1];
        *(void *)(v19 + 8) = result;
        char *result = v19;
        uint64_t *v13 = v17;
        *(void *)(v17 + 8) = v13;
      }
      if (v16 != i && i != a2)
      {
        char v20 = i;
        do
        {
          uint64_t v21 = v16[2];
          if (i[2] >= v21)
          {
            uint64_t v16 = (uint64_t *)v16[1];
          }
          else
          {
            for (j = (uint64_t *)i[1]; j != a2; j = (uint64_t *)j[1])
            {
              if (j[2] >= v21) {
                goto LABEL_25;
              }
            }
            j = a2;
LABEL_25:
            uint64_t v23 = *j;
            uint64_t v24 = *i;
            *(void *)(v24 + 8) = *(void *)(*j + 8);
            **(void **)(v23 + 8) = v24;
            if (v20 == i) {
              char v20 = j;
            }
            uint64_t v26 = *v16;
            long long v25 = (uint64_t *)v16[1];
            *(void *)(v26 + 8) = i;
            uint64_t *i = v26;
            uint64_t *v16 = v23;
            *(void *)(v23 + 8) = v16;
            uint64_t v16 = v25;
            uint64_t i = j;
          }
        }
        while (v16 != v20 && i != a2);
      }
    }
  }
  return result;
}

void std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    std::vector<std::vector<ClipperLib::IntPoint>>::__clear[abi:ne180100]((uint64_t *)v2);
    uint64_t v3 = **a1;
    operator delete(v3);
  }
}

void std::vector<std::vector<ClipperLib::IntPoint>>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  if (v2 != *a1)
  {
    uint64_t v4 = a1[1];
    do
    {
      uint64_t v6 = *(void **)(v4 - 24);
      v4 -= 24;
      char v5 = v6;
      if (v6)
      {
        *(void *)(v2 - 16) = v5;
        operator delete(v5);
      }
      uint64_t v2 = v4;
    }
    while (v4 != v3);
  }
  a1[1] = v3;
}

void *std::vector<ClipperLib::IntPoint>::vector(void *a1, unint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<ClipperLib::IntPoint>::__vallocate[abi:ne180100](a1, a2);
    uint64_t v4 = (void *)a1[1];
    char v5 = &v4[3 * a2];
    __asm { FMOV            V0.2S, #-1.0 }
    do
    {
      void *v4 = 0;
      v4[1] = 0;
      v4[2] = _D0;
      v4 += 3;
    }
    while (v4 != v5);
    a1[1] = v5;
  }
  return a1;
}

void sub_1DB28C4AC(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

__n128 *std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__move_loop<std::_ClassicAlgPolicy>,std::__move_trivial>,std::vector<ClipperLib::IntPoint> *,std::vector<ClipperLib::IntPoint> *,std::vector<ClipperLib::IntPoint> *,0>(__n128 *a1, __n128 *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  if (a1 != a2)
  {
    do
    {
      std::vector<ClipperLib::IntPoint>::__move_assign(a3, v4);
      uint64_t v4 = (__n128 *)((char *)v4 + 24);
      a3 += 24;
    }
    while (v4 != a2);
    return a2;
  }
  return v4;
}

__n128 std::vector<ClipperLib::IntPoint>::__move_assign(uint64_t a1, __n128 *a2)
{
  uint64_t v4 = *(void **)a1;
  if (v4)
  {
    *(void *)(a1 + 8) = v4;
    operator delete(v4);
    *(void *)a1 = 0;
    *(void *)(a1 + 8) = 0;
    *(void *)(a1 + 16) = 0;
  }
  __n128 result = *a2;
  *(__n128 *)a1 = *a2;
  *(void *)(a1 + 16) = a2[1].n128_u64[0];
  a2->n128_u64[0] = 0;
  a2->n128_u64[1] = 0;
  a2[1].n128_u64[0] = 0;
  return result;
}

char *std::vector<ClipperLib::IntPoint>::__assign_with_size[abi:ne180100]<ClipperLib::IntPoint*,ClipperLib::IntPoint*>(char *result, char *__src, uint64_t a3, unint64_t a4)
{
  uint64_t v7 = result;
  uint64_t v8 = *((void *)result + 2);
  uint64_t v9 = *(char **)result;
  if (0xAAAAAAAAAAAAAAABLL * ((v8 - *(void *)result) >> 3) < a4)
  {
    if (v9)
    {
      *((void *)result + 1) = v9;
      operator delete(v9);
      uint64_t v8 = 0;
      void *v7 = 0;
      v7[1] = 0;
      unint64_t v7[2] = 0;
    }
    if (a4 > 0xAAAAAAAAAAAAAAALL) {
      std::vector<ClipperLib::IntPoint>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * (v8 >> 3);
    uint64_t v11 = 2 * v10;
    if (2 * v10 <= a4) {
      uint64_t v11 = a4;
    }
    if (v10 >= 0x555555555555555) {
      unint64_t v12 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v12 = v11;
    }
    __n128 result = std::vector<ClipperLib::IntPoint>::__vallocate[abi:ne180100](v7, v12);
    uint64_t v14 = (char *)v7[1];
    uint64_t v13 = (void **)(v7 + 1);
    uint64_t v9 = v14;
LABEL_16:
    size_t v17 = a3 - (void)__src;
    if (v17)
    {
      uint64_t v18 = v9;
      uint64_t v19 = __src;
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  uint64_t v13 = (void **)(result + 8);
  uint64_t v15 = (unsigned char *)*((void *)result + 1);
  if (0xAAAAAAAAAAAAAAABLL * ((v15 - v9) >> 3) >= a4) {
    goto LABEL_16;
  }
  uint64_t v16 = &__src[8 * ((v15 - v9) >> 3)];
  if (v15 != v9)
  {
    __n128 result = (char *)memmove(*(void **)result, __src, v15 - v9);
    uint64_t v9 = (char *)*v13;
  }
  size_t v17 = a3 - (void)v16;
  if (v17)
  {
    uint64_t v18 = v9;
    uint64_t v19 = v16;
LABEL_18:
    __n128 result = (char *)memmove(v18, v19, v17);
  }
LABEL_19:
  uint64_t *v13 = &v9[v17];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::DoublePoint>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(16 * a2);
}

void std::vector<ClipperLib::IntPoint>::__append(void **a1, unint64_t a2)
{
  uint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  char v5 = v6;
  uint64_t v7 = *(void **)(v4 - 8);
  if (0xAAAAAAAAAAAAAAABLL * ((v6 - (unsigned char *)v7) >> 3) >= a2)
  {
    if (a2)
    {
      uint64_t v13 = &v7[3 * a2];
      __asm { FMOV            V0.2S, #-1.0 }
      do
      {
        void *v7 = 0;
        v7[1] = 0;
        unint64_t v7[2] = _D0;
        v7 += 3;
      }
      while (v7 != v13);
      uint64_t v7 = v13;
    }
    a1[1] = v7;
  }
  else
  {
    unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * (((char *)v7 - (unsigned char *)*a1) >> 3);
    unint64_t v9 = v8 + a2;
    if (v8 + a2 > 0xAAAAAAAAAAAAAAALL) {
      std::vector<ClipperLib::IntPoint>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * ((v5 - (unsigned char *)*a1) >> 3);
    if (2 * v10 > v9) {
      unint64_t v9 = 2 * v10;
    }
    if (v10 >= 0x555555555555555) {
      unint64_t v11 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v11 = v9;
    }
    if (v11) {
      unint64_t v12 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::IntPoint>>(v4, v11);
    }
    else {
      unint64_t v12 = 0;
    }
    uint64_t v19 = &v12[24 * v8];
    char v20 = &v19[24 * a2];
    __asm { FMOV            V0.2S, #-1.0 }
    uint64_t v22 = v19;
    do
    {
      *(void *)uint64_t v22 = 0;
      *((void *)v22 + 1) = 0;
      *((void *)v22 + 2) = _D0;
      v22 += 24;
    }
    while (v22 != v20);
    uint64_t v23 = &v12[24 * v11];
    long long v25 = (char *)*a1;
    uint64_t v24 = (char *)a1[1];
    if (v24 != *a1)
    {
      do
      {
        long long v26 = *(_OWORD *)(v24 - 24);
        *((void *)v19 - 1) = *((void *)v24 - 1);
        *(_OWORD *)(v19 - 24) = v26;
        v19 -= 24;
        v24 -= 24;
      }
      while (v24 != v25);
      uint64_t v24 = (char *)*a1;
    }
    *a1 = v19;
    a1[1] = v20;
    a1[2] = v23;
    if (v24)
    {
      operator delete(v24);
    }
  }
}

void *std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(void *a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x1E018DF40](v13, a1);
  if (v13[0])
  {
    uint64_t v6 = (uint64_t)a1 + *(void *)(*a1 - 24);
    uint64_t v7 = *(void *)(v6 + 40);
    int v8 = *(_DWORD *)(v6 + 8);
    int v9 = *(_DWORD *)(v6 + 144);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
      unint64_t v10 = std::locale::use_facet(&v14, MEMORY[0x1E4FBA258]);
      int v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
      std::locale::~locale(&v14);
      *(_DWORD *)(v6 + 144) = v9;
    }
    if ((v8 & 0xB0) == 0x20) {
      uint64_t v11 = a2 + a3;
    }
    else {
      uint64_t v11 = a2;
    }
    if (!std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(v7, a2, v11, a2 + a3, v6, (char)v9)) {
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | 5);
    }
  }
  MEMORY[0x1E018DF50](v13);
  return a1;
}

void sub_1DB28C9A0(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  MEMORY[0x1E018DF50](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(void *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x1DB28C980);
}

void sub_1DB28C9F4(_Unwind_Exception *a1)
{
}

uint64_t std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
{
  uint64_t v6 = a1;
  if (a1)
  {
    uint64_t v11 = *(void *)(a5 + 24);
    if (v11 <= a4 - a2) {
      int64_t v12 = 0;
    }
    else {
      int64_t v12 = v11 - (a4 - a2);
    }
    if (a3 - a2 >= 1 && (*(uint64_t (**)(uint64_t))(*(void *)a1 + 96))(a1) != a3 - a2) {
      return 0;
    }
    if (v12 >= 1)
    {
      std::string::basic_string[abi:ne180100](__p, v12, __c);
      uint64_t v13 = v18 >= 0 ? __p : (void **)__p[0];
      uint64_t v14 = (*(uint64_t (**)(uint64_t, void **, int64_t))(*(void *)v6 + 96))(v6, v13, v12);
      if (v18 < 0) {
        operator delete(__p[0]);
      }
      if (v14 != v12) {
        return 0;
      }
    }
    uint64_t v15 = a4 - a3;
    if (v15 < 1 || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v6 + 96))(v6, a3, v15) == v15) {
      *(void *)(a5 + 24) = 0;
    }
    else {
      return 0;
    }
  }
  return v6;
}

void sub_1DB28CB74(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *std::string::basic_string[abi:ne180100](void *__b, size_t __len, int __c)
{
  if (__len >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (__len >= 0x17)
  {
    size_t v7 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17) {
      size_t v7 = __len | 7;
    }
    size_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    __b[1] = __len;
    __b[2] = v8 | 0x8000000000000000;
    *__b = v6;
  }
  else
  {
    *((unsigned char *)__b + 23) = __len;
    uint64_t v6 = __b;
    if (!__len) {
      goto LABEL_9;
    }
  }
  memset(v6, __c, __len);
LABEL_9:
  *((unsigned char *)v6 + __len) = 0;
  return __b;
}

void sub_1DB28DC54(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 248), 8);
  _Unwind_Resume(a1);
}

id -[VKCaptureTextAnalyzer _blocksIntersectingQuad:inDocument:](VKCaptureTextAnalyzer *self, SEL a2, id a3, id a4)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  size_t v7 = [MEMORY[0x1E4F1CA48] array];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v32 = v6;
  size_t v8 = objc_msgSend(v6, "blocksWithTypes:inRegion:", 2, 0.0, 0.0, 1.0, 1.0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v34 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v14 = v13;
          uint64_t v15 = [VKQuad alloc];
          [v14 topLeft];
          double v17 = v16;
          double v19 = v18;
          [v14 topRight];
          double v21 = v20;
          double v23 = v22;
          [v14 bottomLeft];
          double v25 = v24;
          double v27 = v26;
          [v14 bottomRight];
          uint64_t v30 = -[VKQuad initWithTopLeft:topRight:bottomLeft:bottomRight:](v15, "initWithTopLeft:topRight:bottomLeft:bottomRight:", v17, v19, v21, v23, v25, v27, v28, v29);
          if ([(VKQuad *)v30 intersectsQuad:v5]) {
            [v7 addObject:v14];
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v10);
  }

  return v7;
}

uint64_t vk_orientationByRotatingLeft(unint64_t a1)
{
  if (a1 > 7) {
    return 0;
  }
  else {
    return qword_1DB33E768[a1];
  }
}

uint64_t vk_orientationByRotatingRight(unint64_t a1)
{
  if (a1 > 7) {
    return 0;
  }
  else {
    return qword_1DB33E7A8[a1];
  }
}

void vk_orientationApplyToRectAtPoint(CGAffineTransform *a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  memset(&v18, 0, sizeof(v18));
  CGAffineTransformMakeTranslation(&v18, -a6, -a7);
  _transformFromImageOrientation(a1, 0, (uint64_t)&t2);
  CGAffineTransform t1 = v18;
  CGAffineTransformConcat(&v17, &t1, &t2);
  CGAffineTransform v18 = v17;
  CGAffineTransformMakeTranslation(&v14, a6, a7);
  CGAffineTransform t1 = v18;
  CGAffineTransformConcat(&v17, &t1, &v14);
  CGAffineTransform v18 = v17;
  v19.origin.x = a2;
  v19.origin.y = a3;
  v19.size.width = a4;
  v19.size.height = a5;
  CGRectApplyAffineTransform(v19, &v17);
}

CGAffineTransform *vk_transformToImageOrientation@<X0>(CGAffineTransform *a1@<X0>, uint64_t a2@<X8>)
{
  return _transformFromImageOrientation(a1, 0, a2);
}

uint64_t vk_clockwiseRotationsFromUpToMatchOrientation(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 6) {
    return 0;
  }
  else {
    return qword_1DB33E7E8[a1 - 1];
  }
}

uint64_t vk_counterClockwiseRotationsFromUpToMatchOrientation(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 6) {
    return 0;
  }
  else {
    return qword_1DB33E820[a1 - 1];
  }
}

CGAffineTransform *_transformFromImageOrientation@<X0>(CGAffineTransform *result@<X0>, int a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v4 = MEMORY[0x1E4F1DAB8];
  long long v5 = *MEMORY[0x1E4F1DAB8];
  long long v6 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)a3 = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)(a3 + 16) = v6;
  long long v7 = *(_OWORD *)(v4 + 32);
  *(_OWORD *)(a3 + 32) = v7;
  double v9 = 0.0;
  double v10 = 3.14159265;
  switch((unint64_t)result)
  {
    case 1uLL:
      goto LABEL_8;
    case 2uLL:
      double v10 = -1.57079633;
      goto LABEL_8;
    case 3uLL:
      double v10 = 1.57079633;
      goto LABEL_8;
    case 4uLL:
      goto LABEL_7;
    case 5uLL:
      double v9 = 3.14159265;
      goto LABEL_7;
    case 6uLL:
      double v9 = -1.57079633;
      goto LABEL_7;
    case 7uLL:
      double v9 = 1.57079633;
LABEL_7:
      *(_OWORD *)&v16.a = v5;
      *(_OWORD *)&v16.c = v6;
      *(_OWORD *)&v16.tx = v7;
      __n128 result = CGAffineTransformScale((CGAffineTransform *)a3, &v16, -1.0, 1.0);
      double v10 = v9;
      if (v9 != 0.0)
      {
LABEL_8:
        double v11 = -v10;
        if (!a2) {
          double v11 = v10;
        }
        CGAffineTransformMakeRotation(&t2, v11);
        long long v12 = *(_OWORD *)(a3 + 16);
        *(_OWORD *)&v14.a = *(_OWORD *)a3;
        *(_OWORD *)&v14.c = v12;
        *(_OWORD *)&v14.tx = *(_OWORD *)(a3 + 32);
        __n128 result = CGAffineTransformConcat(&v16, &v14, &t2);
        long long v13 = *(_OWORD *)&v16.c;
        *(_OWORD *)a3 = *(_OWORD *)&v16.a;
        *(_OWORD *)(a3 + 16) = v13;
        *(_OWORD *)(a3 + 32) = *(_OWORD *)&v16.tx;
      }
      break;
    default:
      return result;
  }
  return result;
}

CGAffineTransform *vk_transformFromImageOrientation@<X0>(CGAffineTransform *a1@<X0>, uint64_t a2@<X8>)
{
  return _transformFromImageOrientation(a1, 1, a2);
}

uint64_t vk_cgImagePropertyOrientationFromVKOrientation(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 6) {
    return 1;
  }
  else {
    return dword_1DB33E858[a1 - 1];
  }
}

uint64_t vk_imageOrientationFromTransform(long long *a1)
{
  uint64_t v8 = 0;
  double v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  long long v1 = a1[1];
  long long v5 = *a1;
  long long v6 = v1;
  v4[2] = __vk_imageOrientationFromTransform_block_invoke;
  v4[3] = &unk_1E6BF12E0;
  long long v7 = a1[2];
  v4[4] = &v8;
  [&unk_1F357DE80 enumerateObjectsUsingBlock:v4];
  uint64_t v2 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v2;
}

void sub_1DB28E82C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

CGAffineTransform *__vk_imageOrientationFromTransform_block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  long long v6 = (CGAffineTransform *)[a2 integerValue];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v8 = 0u;
  __n128 result = _transformFromImageOrientation(v6, 0, (uint64_t)&v8);
  if (vabdd_f64(*(double *)(a1 + 40), *(double *)&v8) < 0.00999999978
    && vabdd_f64(*(double *)(a1 + 48), *((double *)&v8 + 1)) < 0.00999999978
    && vabdd_f64(*(double *)(a1 + 56), *(double *)&v9) < 0.00999999978
    && vabdd_f64(*(double *)(a1 + 64), *((double *)&v9 + 1)) < 0.00999999978)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v6;
    *a4 = 1;
  }
  return result;
}

unint64_t vk_swapLeftAndRightImageOrientation(unint64_t result)
{
  if (result <= 7) {
    return qword_1DB33E878[result];
  }
  return result;
}

uint64_t vk_orientationFromCGImagePropertyOrientation(int a1)
{
  if ((a1 - 2) > 6) {
    return 0;
  }
  else {
    return qword_1DB33E8B8[a1 - 2];
  }
}

void sub_1DB28EFAC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
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

id _FilterByBlockType(void *a1, uint64_t a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "blocksWithTypes:inRegion:", a2, 0.0, 0.0, 1.0, 1.0, (void)v12);
        [v4 addObjectsFromArray:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

id _FilterByDataType(void *a1, uint64_t a2)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v2 = a1;
  id v3 = [MEMORY[0x1E4F1CA48] array];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  obuint64_t j = v2;
  uint64_t v23 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v23)
  {
    uint64_t v21 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v30 != v21) {
          objc_enumerationMutation(obj);
        }
        id v5 = [*(id *)(*((void *)&v29 + 1) + 8 * i) getDataDetectorResults:0];
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = ___FilterByDataType_block_invoke;
        v28[3] = &__block_descriptor_40_e37_B32__0__VNDataDetectorResult_8Q16_B24l;
        v28[4] = a2;
        uint64_t v6 = objc_msgSend(v5, "vk_objectsPassingTest:", v28);

        long long v26 = 0u;
        long long v27 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v7 = v6;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v33 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v25;
          do
          {
            for (uint64_t j = 0; j != v9; ++j)
            {
              if (*(void *)v25 != v10) {
                objc_enumerationMutation(v7);
              }
              long long v12 = *(void **)(*((void *)&v24 + 1) + 8 * j);
              long long v13 = [v12 scannerResult];
              uint64_t v14 = [v13 urlificationRange];
              uint64_t v16 = v15;

              uint64_t v17 = [v12 originalObservation];
              CGAffineTransform v18 = objc_msgSend(v17, "textBlockWithCharacterRange:", v14, v16);
              [v3 addObject:v18];
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v24 objects:v33 count:16];
          }
          while (v9);
        }
      }
      uint64_t v23 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v23);
  }

  return v3;
}

void sub_1DB290654(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  uint64_t v19 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 160), 8);
  _Block_object_dispose((const void *)(v11 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1DB2919F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void vk_performBlockOnMainThread(void *a1)
{
  uint64_t v1 = (void *)MEMORY[0x1E4F29060];
  block = a1;
  if ([v1 isMainThread]) {
    block[2]();
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void vk_performBlockOnMainThreadAndWait(void *a1)
{
  uint64_t v1 = (void *)MEMORY[0x1E4F29060];
  block = a1;
  if ([v1 isMainThread]) {
    block[2]();
  }
  else {
    dispatch_sync(MEMORY[0x1E4F14428], block);
  }
}

void vk_dispatchMainAfterDelay(void *a1, double a2)
{
  if (a2 == 0.0)
  {
    id v2 = a1;
    dispatch_async(MEMORY[0x1E4F14428], v2);
  }
  else
  {
    int64_t v3 = (uint64_t)(a2 * 1000000000.0);
    id v4 = a1;
    dispatch_time_t v5 = dispatch_time(0, v3);
    dispatch_after(v5, MEMORY[0x1E4F14428], v4);
  }
}

void vk_performBlockOnMainThreadWithStrongSelf(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  objc_initWeak(&location, v3);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __vk_performBlockOnMainThreadWithStrongSelf_block_invoke;
  v6[3] = &unk_1E6BF1468;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  vk_performBlockOnMainThread(v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void sub_1DB29375C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void __vk_performBlockOnMainThreadWithStrongSelf_block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id WeakRetained = v3;
  }
}

void vk_performBlockOnQueueWithStrongSelf(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = a1;
  objc_initWeak(&location, a2);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __vk_performBlockOnQueueWithStrongSelf_block_invoke;
  block[3] = &unk_1E6BF1468;
  objc_copyWeak(&v10, &location);
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, block);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __vk_performBlockOnQueueWithStrongSelf_block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id WeakRetained = v3;
  }
}

void vk_performWhileLocked(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  [v4 lock];
  v3[2](v3);

  [v4 unlock];
}

void vk_requestDeviceUnlockIfNecessaryWithCompletion(void *a1)
{
  uint64_t v1 = a1;
  if (MKBGetDeviceLockState() - 1 > 1)
  {
    if (v1) {
      v1[2](v1, 1);
    }
  }
  else
  {
    if (vk_processHasUnlockEntitlement_onceToken != -1) {
      dispatch_once(&vk_processHasUnlockEntitlement_onceToken, &__block_literal_global_3);
    }
    if (vk_processHasUnlockEntitlement_sHasEntitlement)
    {
      id v2 = objc_alloc_init(MEMORY[0x1E4FA6B38]);
      v4[0] = MEMORY[0x1E4F143A8];
      v4[1] = 3221225472;
      v4[2] = __vk_requestDeviceUnlockIfNecessaryWithCompletion_block_invoke;
      v4[3] = &unk_1E6BF1490;
      id v5 = v2;
      uint64_t v6 = v1;
      id v3 = v2;
      [v3 requestPasscodeUnlockUIWithOptions:0 withCompletion:v4];
    }
    else if (v1)
    {
      v1[2](v1, 0);
    }
  }
}

BOOL vk_isDeviceLocked()
{
  return MKBGetDeviceLockState() - 1 < 2;
}

uint64_t vk_processHasUnlockEntitlement()
{
  if (vk_processHasUnlockEntitlement_onceToken != -1) {
    dispatch_once(&vk_processHasUnlockEntitlement_onceToken, &__block_literal_global_3);
  }
  return vk_processHasUnlockEntitlement_sHasEntitlement;
}

uint64_t __vk_requestDeviceUnlockIfNecessaryWithCompletion_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id v3 = *(void **)(a1 + 32);
  return [v3 invalidate];
}

void __vk_processHasUnlockEntitlement_block_invoke()
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = SecTaskCreateFromSelf(0);
  if (v0)
  {
    uint64_t v1 = v0;
    *(void *)cf = 0;
    CFTypeRef v2 = SecTaskCopyValueForEntitlement(v0, @"com.apple.springboard.requestDeviceUnlock", (CFErrorRef *)cf);
    if (v2)
    {
      id v3 = (void *)v2;
      CFTypeID v4 = CFGetTypeID(v2);
      if (v4 == CFBooleanGetTypeID()) {
        char v5 = [v3 BOOLValue];
      }
      else {
        char v5 = 0;
      }
      vk_processHasUnlockEntitlement_sHasEntitlement = v5;
      CFRelease(v3);
    }
    CFRelease(v1);
    if (*(void *)cf)
    {
      uint64_t v6 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.interaction");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __vk_processHasUnlockEntitlement_block_invoke_cold_1((uint64_t *)cf, v6);
      }

      CFRelease(*(CFTypeRef *)cf);
    }
  }
  id v7 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.interaction");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = VKMUIStringForBool(vk_processHasUnlockEntitlement_sHasEntitlement);
    *(_DWORD *)cf = 138412290;
    *(void *)&cf[4] = v8;
    _os_log_impl(&dword_1DB266000, v7, OS_LOG_TYPE_DEFAULT, "Process has device unlock entitlement: %@", cf, 0xCu);
  }
}

BOOL vk_isInternalBuild()
{
  return IsAppleInternalBuild() != 0;
}

uint64_t vk_isiOS()
{
  return 1;
}

uint64_t internal_vk_deviceSupportsImageAnalysis()
{
  if (internal_vk_deviceSupportsImageAnalysis_onceToken != -1) {
    dispatch_once(&internal_vk_deviceSupportsImageAnalysis_onceToken, &__block_literal_global_10);
  }
  return internal_vk_deviceSupportsImageAnalysis__supports;
}

uint64_t vk_deviceSupportsImageAnalysis()
{
  if (vk_deviceSupportsImageAnalysis_onceToken != -1) {
    dispatch_once(&vk_deviceSupportsImageAnalysis_onceToken, &__block_literal_global_19);
  }
  return vk_deviceSupportsImageAnalysis__supportsWithOverride;
}

uint64_t vk_deviceSupportsVisualSearch()
{
  if (vk_deviceSupportsVisualSearch_onceToken != -1) {
    dispatch_once(&vk_deviceSupportsVisualSearch_onceToken, &__block_literal_global_22);
  }
  return vk_deviceSupportsVisualSearch_sIsSupported;
}

uint64_t __vk_deviceSupportsVisualSearch_block_invoke()
{
  uint64_t result = deviceHasAppleNeuralEngine();
  vk_deviceSupportsVisualSearch_sIsSupported = result;
  return result;
}

uint64_t vk_deviceSupportsDataScanning()
{
  if (vk_deviceSupportsDataScanning_onceToken != -1) {
    dispatch_once(&vk_deviceSupportsDataScanning_onceToken, &__block_literal_global_24);
  }
  return vk_deviceSupportsDataScanning_isSupported;
}

uint64_t __vk_deviceSupportsDataScanning_block_invoke()
{
  uint64_t result = deviceHasAppleNeuralEngine();
  if (result) {
    uint64_t result = MGGetBoolAnswer();
  }
  vk_deviceSupportsDataScanning_isSupported = result;
  return result;
}

uint64_t vk_deviceSupportsRemoveBackground()
{
  if (vk_deviceSupportsRemoveBackground_onceToken != -1) {
    dispatch_once(&vk_deviceSupportsRemoveBackground_onceToken, &__block_literal_global_29);
  }
  return vk_deviceSupportsRemoveBackground_isSupported;
}

uint64_t __vk_deviceSupportsRemoveBackground_block_invoke()
{
  uint64_t result = deviceHasAppleNeuralEngine();
  vk_deviceSupportsRemoveBackground_isSupported = result;
  return result;
}

uint64_t vk_deviceSupportsAddingSystemStickers()
{
  if (vk_deviceSupportsAddingSystemStickers_onceToken != -1) {
    dispatch_once(&vk_deviceSupportsAddingSystemStickers_onceToken, &__block_literal_global_31);
  }
  return vk_deviceSupportsAddingSystemStickers_isSupported;
}

uint64_t __vk_deviceSupportsAddingSystemStickers_block_invoke()
{
  uint64_t result = deviceHasAppleNeuralEngine();
  if (result) {
    uint64_t result = _os_feature_enabled_impl();
  }
  vk_deviceSupportsAddingSystemStickers_isSupported = result;
  return result;
}

uint64_t vk_supportsOpticalFlowTracking()
{
  if (vk_supportsOpticalFlowTracking_onceToken != -1) {
    dispatch_once(&vk_supportsOpticalFlowTracking_onceToken, &__block_literal_global_35);
  }
  return vk_supportsOpticalFlowTracking_isSupported;
}

uint64_t __vk_supportsOpticalFlowTracking_block_invoke()
{
  uint64_t result = deviceHasAppleNeuralEngine();
  if (result) {
    uint64_t result = _os_feature_enabled_impl();
  }
  vk_supportsOpticalFlowTracking_isSupported = result;
  return result;
}

uint64_t vk_supportsContextAwareDataDetectors()
{
  if (vk_supportsContextAwareDataDetectors_onceToken != -1) {
    dispatch_once(&vk_supportsContextAwareDataDetectors_onceToken, &__block_literal_global_38);
  }
  return vk_supportsContextAwareDataDetectors_isSupported;
}

uint64_t __vk_supportsContextAwareDataDetectors_block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  vk_supportsContextAwareDataDetectors_isSupported = result;
  return result;
}

id getLTUIVisualTranslationViewClass()
{
  uint64_t v4 = 0;
  char v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getLTUIVisualTranslationViewClass_softClass;
  uint64_t v7 = getLTUIVisualTranslationViewClass_softClass;
  if (!getLTUIVisualTranslationViewClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getLTUIVisualTranslationViewClass_block_invoke;
    v3[3] = &unk_1E6BF0A90;
    v3[4] = &v4;
    __getLTUIVisualTranslationViewClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1DB294E60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB295154(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

Class __getLTUIVisualTranslationViewClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!TranslationUILibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __TranslationUILibraryCore_block_invoke;
    void v4[4] = &__block_descriptor_40_e5_v8__0l;
    void v4[5] = v4;
    long long v5 = xmmword_1E6BF1520;
    uint64_t v6 = 0;
    TranslationUILibraryCore_frameworkLibrary = _sl_dlopen();
    CFTypeRef v2 = (void *)v4[0];
    if (!TranslationUILibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("LTUIVisualTranslationView");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    CFTypeRef v2 = (void *)__getLTUIVisualTranslationViewClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getLTUIVisualTranslationViewClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __TranslationUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  TranslationUILibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1DB2975CC(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 72));
  _Unwind_Resume(a1);
}

void sub_1DB297710(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DB2978B8(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1DB2980F0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1DB298DB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va1, a8);
  va_start(va, a8);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
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

Class __getDDDetectionControllerClass_block_invoke(uint64_t a1)
{
  DataDetectorsUILibrary_0();
  Class result = objc_getClass("DDDetectionController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getDDDetectionControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getDDDetectionControllerClass_block_invoke_cold_1();
    return (Class)DataDetectorsUILibrary_0();
  }
  return result;
}

uint64_t DataDetectorsUILibrary_0()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!DataDetectorsUILibraryCore_frameworkLibrary_0)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __DataDetectorsUILibraryCore_block_invoke_0;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E6BF1738;
    uint64_t v5 = 0;
    DataDetectorsUILibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  uint64_t v0 = DataDetectorsUILibraryCore_frameworkLibrary_0;
  uint64_t v1 = (void *)v3[0];
  if (!DataDetectorsUILibraryCore_frameworkLibrary_0)
  {
    uint64_t v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __DataDetectorsUILibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  DataDetectorsUILibraryCore_frameworkLibrary_0 = result;
  return result;
}

void *__getkDataDetectorsGroupAllResultsKeySymbolLoc_block_invoke(uint64_t a1)
{
  CFTypeRef v2 = (void *)DataDetectorsUILibrary_0();
  uint64_t result = dlsym(v2, "kDataDetectorsGroupAllResultsKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkDataDetectorsGroupAllResultsKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkDataDetectorsGroupTranscriptKeySymbolLoc_block_invoke(uint64_t a1)
{
  CFTypeRef v2 = (void *)DataDetectorsUILibrary_0();
  uint64_t result = dlsym(v2, "kDataDetectorsGroupTranscriptKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkDataDetectorsGroupTranscriptKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkDataDetectorsGroupCategoryKeySymbolLoc_block_invoke(uint64_t a1)
{
  CFTypeRef v2 = (void *)DataDetectorsUILibrary_0();
  uint64_t result = dlsym(v2, "kDataDetectorsGroupCategoryKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkDataDetectorsGroupCategoryKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkDataDetectorsDocumentLanguageKeySymbolLoc_block_invoke(uint64_t a1)
{
  CFTypeRef v2 = (void *)DataDetectorsUILibrary_0();
  uint64_t result = dlsym(v2, "kDataDetectorsDocumentLanguageKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkDataDetectorsDocumentLanguageKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1DB29A3CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB29CAA8(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_1DB29CF3C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DB29DD30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location,char a27)
{
  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
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

void sub_1DB29DFA8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

double computeCornerMatrix@<D0>(double *a1@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>, double a5@<D2>, double a6@<D3>)
{
  double v6 = a1[2];
  double v7 = a1[3];
  double v9 = a1[4];
  double v8 = a1[5];
  double v10 = a1[6];
  double v11 = a1[7];
  double v12 = *a1;
  double v13 = a1[1];
  double v14 = v9 + *a1 - v6 - v10;
  double v15 = v8 + v13 - v7 - v11;
  if (v14 == 0.0 && v15 == 0.0)
  {
    double v16 = v6 - v12;
    double v17 = v9 - v6;
    double v18 = v7 - v13;
    double v19 = v8 - v7;
    double v20 = 0.0;
    double v21 = 0.0;
  }
  else
  {
    double v22 = v10 - v9;
    double v23 = v7 - v8;
    double v24 = v6 - v9;
    double v25 = v24 * (v11 - v8) - (v7 - v8) * v22;
    double v20 = (v14 * (v11 - v8) - v15 * v22) / v25;
    double v21 = (v24 * v15 - v23 * v14) / v25;
    double v16 = v6 - v12 + v20 * v6;
    double v18 = v7 - v13 + v20 * v7;
    double v17 = v10 - v12 + v21 * v10;
    double v19 = v11 - v13 + v21 * v11;
  }
  double v26 = 1.0 / a3;
  double v27 = 1.0 / a4;
  *(double *)a2 = v26 * v16;
  *(double *)(a2 + 8) = v26 * v18;
  *(void *)(a2 + 16) = 0;
  *(double *)(a2 + 24) = v26 * v20;
  *(double *)(a2 + 32) = v27 * v17;
  *(double *)(a2 + 40) = v27 * v19;
  *(void *)(a2 + 48) = 0;
  *(double *)(a2 + 56) = v27 * v21;
  *(void *)(a2 + 64) = 0;
  *(void *)(a2 + 72) = 0;
  *(_OWORD *)(a2 + 80) = xmmword_1DB33E660;
  *(void *)(a2 + 112) = 0;
  *(double *)(a2 + 96) = v12 + a6 * v17 + a5 * v16;
  *(double *)(a2 + 104) = v13 + a6 * v19 + a5 * v18;
  double result = a6 * v21 + a5 * v20 + 1.0;
  *(double *)(a2 + 120) = result;
  return result;
}

void sub_1DB2A08A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t VKDynamicCast(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    return 0;
  }
  if (objc_opt_isKindOfClass()) {
    return a2;
  }
  return 0;
}

void *VKSpecificCast(uint64_t a1, void *a2)
{
  if (!a2) {
    return 0;
  }
  if ([a2 isMemberOfClass:a1]) {
    return a2;
  }
  return 0;
}

void *VKProtocolCast(uint64_t a1, void *a2)
{
  if (!a2) {
    return 0;
  }
  if ([a2 conformsToProtocol:a1]) {
    return a2;
  }
  return 0;
}

void *VKClassAndProtocolCast(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  double v9 = a1;
  if (a1)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      return 0;
    }
    double v13 = &a9;
    if (a3)
    {
      while (1)
      {
        double v11 = v13++;
        if (([v9 conformsToProtocol:*v11] & 1) == 0) {
          break;
        }
        if (!--a3) {
          return v9;
        }
      }
      return 0;
    }
  }
  return v9;
}

CFTypeRef VKCFTypeCast(uint64_t a1, CFTypeRef cf)
{
  if (!cf) {
    return 0;
  }
  if (CFGetTypeID(cf) == a1) {
    return cf;
  }
  return 0;
}

uint64_t VKCheckedDynamicCast(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  if (a2 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    +[VKAssert handleFailedAssertWithCondition:"src == ((void *)0) || result != ((void *)0)", "id VKCheckedDynamicCast(Class, id<NSObject>)", 0, 0, @"Unexpected object type in checked dynamic cast %@ expects %@", objc_opt_class(), a1 functionName simulateCrash showAlert format];
    return 0;
  }
  return v2;
}

void *VKCheckedProtocolCast(Protocol *a1, void *a2)
{
  if (!a1) {
    +[VKAssert handleFailedAssertWithCondition:"protocol" functionName:"id VKCheckedProtocolCast(Protocol *, id<NSObject>)" simulateCrash:0 showAlert:0 format:@"Protocol is nil"];
  }
  if (a2 && ([a2 conformsToProtocol:a1] & 1) == 0)
  {
    uint64_t v4 = objc_opt_class();
    if (a1) {
      Name = protocol_getName(a1);
    }
    else {
      Name = "<No protocol supplied>";
    }
    +[VKAssert handleFailedAssertWithCondition:"src == ((void *)0) || result != ((void *)0)", "id VKCheckedProtocolCast(Protocol *, id<NSObject>)", 0, 0, @"Unexpected object type in checked protocol cast %@ expects %s", v4, Name functionName simulateCrash showAlert format];
    return 0;
  }
  return a2;
}

void sub_1DB2A52F8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1DB2A6790(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB2A7038(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB2A7384(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
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

void sub_1DB2A7EAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_1DB2A9C4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB2AC748(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB2AC854(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1DB2AC900(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DB2AC9EC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DB2ACAE4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1DB2ACBA4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DB2ACD04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB2AD5FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB2AD6F8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DB2ADAD0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_1DB2ADE14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB2ADF3C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DB2AE250(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1DB2AE2FC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DB2AE3E8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DB2AE7A8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 120));
  _Unwind_Resume(a1);
}

void sub_1DB2AF42C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Block_object_dispose((const void *)(v1 - 248), 8);
  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Unwind_Resume(a1);
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

void sub_1DB2AFCA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB2AFE84(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DB2B010C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak(v2);
  _Unwind_Resume(a1);
}

void sub_1DB2B4400(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB2B6800(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1DB2B6A74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB2B8094(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1DB2B8B30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB2B9EC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v19 - 56));
  _Unwind_Resume(a1);
}

void sub_1DB2BA224(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DB2BA504(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB2BD5C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1DB2BFD64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB2C0E08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1DB2C3020(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB2C3364(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

{
  *(void *)(result + 48) = *(void *)(a2 + 48);
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
}

Class __getBCSActionClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!BarcodeSupportLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __BarcodeSupportLibraryCore_block_invoke;
    void v4[4] = &__block_descriptor_40_e5_v8__0l;
    void v4[5] = v4;
    long long v5 = xmmword_1E6BF2700;
    uint64_t v6 = 0;
    BarcodeSupportLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!BarcodeSupportLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("BCSAction");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getBCSActionClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getBCSActionClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __BarcodeSupportLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  BarcodeSupportLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1DB2C44DC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DB2C4578(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DB2C4BB8(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1DB2C4CAC(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

uint64_t VKVNBaselineAngles(void *a1, const char *a2)
{
  return objc_msgSend(a1, "vk_map:", &__block_literal_global_16);
}

id __VKVNBaselineAngles_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 getCROutputRegion];
  [v2 visualTextAngle];
  uint64_t v4 = [NSNumber numberWithDouble:(float)-v3];

  return v4;
}

double VKVNGlobalBaselineAngleFromAngles(void *a1)
{
  id v1 = a1;
  if ([v1 count])
  {
    uint64_t v2 = [v1 sortedArrayUsingSelector:sel_compare_];
    float v3 = objc_msgSend(v2, "objectAtIndexedSubscript:", (unint64_t)objc_msgSend(v2, "count") >> 1);
    [v3 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

id VKVNRectClosestToPoint(void *a1, double a2, double a3)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __VKVNRectClosestToPoint_block_invoke;
  v6[3] = &__block_descriptor_48_e59_q24__0__VNRectangleObservation_8__VNRectangleObservation_16l;
  *(double *)&void v6[4] = a2;
  *(double *)&v6[5] = a3;
  float v3 = [a1 sortedArrayUsingComparator:v6];
  if ([v3 count])
  {
    double v4 = [v3 firstObject];
  }
  else
  {
    double v4 = 0;
  }

  return v4;
}

uint64_t __VKVNRectClosestToPoint_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  [a2 boundingBox];
  double v10 = VKMCenterOfRect(v6, v7, v8, v9);
  double v12 = v11;
  [v5 boundingBox];
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;

  double v21 = VKMCenterOfRect(v14, v16, v18, v20);
  double v23 = v22;
  double v24 = *(double *)(a1 + 32);
  double v25 = *(double *)(a1 + 40);
  double v26 = VKMDistanceSquared(v10, v12, v24, v25);
  double v27 = VKMDistanceSquared(v21, v23, v24, v25);
  if (v26 >= v27) {
    return v27 < v26;
  }
  else {
    return -1;
  }
}

double VKMOffsetForEdgeOfFrame(int a1, double a2, double a3, double a4, double a5)
{
  switch(a1)
  {
    case 0:
      double result = CGRectGetMinX(*(CGRect *)&a2);
      break;
    case 1:
      double result = CGRectGetMidX(*(CGRect *)&a2);
      break;
    case 2:
      double result = CGRectGetMaxX(*(CGRect *)&a2);
      break;
    case 3:
      double result = CGRectGetMinY(*(CGRect *)&a2);
      break;
    case 4:
      double result = CGRectGetMidY(*(CGRect *)&a2);
      break;
    case 5:
      double result = CGRectGetMaxY(*(CGRect *)&a2);
      break;
    default:
      double result = 0.0;
      break;
  }
  return result;
}

double VKMRectWithCenterAndSize(double a1, double a2, double a3)
{
  return a1 - a3 * 0.5;
}

double VKMRectWithPoints(double a1, double a2, double a3)
{
  if (a1 >= a3) {
    return a3;
  }
  else {
    return a1;
  }
}

double VKMRectWithSize()
{
  return 0.0;
}

double VKMRectWithSizeAlignedToRect(int a1, int a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  v17.size.height = a4;
  v17.size.double width = a3;
  v17.origin.double x = 0.0;
  v17.origin.y = 0.0;
  CGRect v18 = CGRectStandardize(v17);
  double x = v18.origin.x;
  double width = v18.size.width;
  v18.origin.double x = a5;
  v18.origin.y = a6;
  v18.size.double width = a7;
  v18.size.height = a8;
  if (!CGRectIsNull(v18))
  {
    switch(a1)
    {
      case 3:
        v20.origin.double x = a5;
        v20.origin.y = a6;
        v20.size.double width = a7;
        v20.size.height = a8;
        double x = CGRectGetMaxX(v20) - width;
        break;
      case 2:
        v21.origin.double x = a5;
        v21.origin.y = a6;
        v21.size.double width = a7;
        v21.size.height = a8;
        double x = CGRectGetMidX(v21) + width * -0.5;
        break;
      case 1:
        v19.origin.double x = a5;
        v19.origin.y = a6;
        v19.size.double width = a7;
        v19.size.height = a8;
        double x = CGRectGetMinX(v19);
        break;
    }
    switch(a2)
    {
      case 3:
        v23.origin.double x = a5;
        v23.origin.y = a6;
        v23.size.double width = a7;
        v23.size.height = a8;
        CGRectGetMaxY(v23);
        break;
      case 2:
        v24.origin.double x = a5;
        v24.origin.y = a6;
        v24.size.double width = a7;
        v24.size.height = a8;
        CGRectGetMidY(v24);
        break;
      case 1:
        v22.origin.double x = a5;
        v22.origin.y = a6;
        v22.size.double width = a7;
        v22.size.height = a8;
        CGRectGetMinY(v22);
        break;
    }
  }
  return x;
}

BOOL VKMNearlyEqualPoints(double a1, double a2, double a3, double a4)
{
  BOOL v4 = vabdd_f64(a1, a3) < 0.01;
  return vabdd_f64(a2, a4) < 0.01 && v4;
}

BOOL VKMNearlyEqualPointsWithThreshold(double a1, double a2, double a3, double a4, double a5)
{
  BOOL v5 = vabdd_f64(a1, a3) < a5;
  return vabdd_f64(a2, a4) < a5 && v5;
}

BOOL VKMNearlyEqualTransforms(double *a1, double *a2)
{
  return vabdd_f64(*a1, *a2) < 0.000000001
      && vabdd_f64(a1[1], a2[1]) < 0.000000001
      && vabdd_f64(a1[2], a2[2]) < 0.000000001
      && vabdd_f64(a1[3], a2[3]) < 0.000000001
      && vabdd_f64(a1[4], a2[4]) < 0.000000001
      && vabdd_f64(a1[5], a2[5]) < 0.000000001;
}

BOOL VKMNearlyEqualRects(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  BOOL result = 0;
  if (vabdd_f64(a1, a5) < 0.01 && vabdd_f64(a2, a6) < 0.01)
  {
    BOOL v9 = vabdd_f64(a3, a7) < 0.01;
    return vabdd_f64(a4, a8) < 0.01 && v9;
  }
  return result;
}

BOOL VKMNearlyEqualRectsWithThreshold(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  double v17 = vabdd_f64(a2, a6);
  if (vabdd_f64(a1, a5) >= a9 || v17 >= a9) {
    return 0;
  }
  BOOL v20 = vabdd_f64(a3, a7) < a9;
  return vabdd_f64(a4, a8) < a9 && v20;
}

BOOL VKMNearlyContainsRect(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  CGRect v18 = CGRectInset(*(CGRect *)&a1, -0.01, -0.01);
  double v12 = a5;
  double v13 = a6;
  double v14 = a7;
  double v15 = a8;
  return CGRectContainsRect(v18, *(CGRect *)&v12);
}

BOOL VKMCollinearPoints(double a1, double a2, double a3, double a4, double a5, double a6)
{
  return fabs((a3 - a1) * (a6 - a2) - (a4 - a2) * (a5 - a1)) < 8.90029543e-308;
}

BOOL VKMNearlyCollinearPoints(double a1, double a2, double a3, double a4, double a5, double a6)
{
  double v6 = a3 - a1;
  return (v6 * (a6 - a2) - (a4 - a2) * (a5 - a1)) * (v6 * (a6 - a2) - (a4 - a2) * (a5 - a1)) < ((a4 - a2) * (a4 - a2)
                                                                                              + v6 * v6)
                                                                                             * 0.0001
                                                                                             * ((a6 - a2) * (a6 - a2)
                                                                                              + (a5 - a1) * (a5 - a1));
}

double VKMDistanceSquared(double a1, double a2, double a3, double a4)
{
  return (a2 - a4) * (a2 - a4) + (a1 - a3) * (a1 - a3);
}

BOOL VKMRectsOverlapVertically(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  double MinX = CGRectGetMinX(*(CGRect *)&a1);
  v22.origin.double x = a5;
  v22.origin.y = a6;
  v22.size.double width = a7;
  v22.size.height = a8;
  double v16 = CGRectGetMinX(v22);
  v23.origin.double x = a1;
  v23.origin.y = a2;
  v23.size.double width = a3;
  v23.size.height = a4;
  double MaxX = CGRectGetMaxX(v23);
  v24.origin.double x = a5;
  v24.origin.y = a6;
  v24.size.double width = a7;
  v24.size.height = a8;
  double v18 = CGRectGetMaxX(v24);
  if (MinX <= v16) {
    return MaxX >= v16;
  }
  else {
    return v18 >= MinX;
  }
}

BOOL VKMRectsOverlapHorizontally(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  double MinY = CGRectGetMinY(*(CGRect *)&a1);
  v22.origin.double x = a5;
  v22.origin.y = a6;
  v22.size.double width = a7;
  v22.size.height = a8;
  double v16 = CGRectGetMinY(v22);
  v23.origin.double x = a1;
  v23.origin.y = a2;
  v23.size.double width = a3;
  v23.size.height = a4;
  double MaxY = CGRectGetMaxY(v23);
  v24.origin.double x = a5;
  v24.origin.y = a6;
  v24.size.double width = a7;
  v24.size.height = a8;
  double v18 = CGRectGetMaxY(v24);
  if (MinY <= v16) {
    return MaxY >= v16;
  }
  else {
    return v18 >= MinY;
  }
}

uint64_t VKMLineIntersectsRect(CGFloat a1, CGFloat a2, double a3, double a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  double v12 = a4;
  double v13 = a3;
  while (1)
  {
    uint64_t v16 = p_ComputeOutcode(a1, a2, a5, a6, a7, a8);
    uint64_t v17 = p_ComputeOutcode(v13, v12, a5, a6, a7, a8);
    uint64_t result = 1;
    if (!v16 || !v17) {
      break;
    }
    if ((v17 & v16) != 0) {
      return 0;
    }
    double v19 = (v13 + a1) * 0.5;
    double v20 = (v12 + a2) * 0.5;
    int v21 = VKMLineIntersectsRect(1, a1, a2, v19, v20, a5, a6, a7, a8);
    a1 = v19;
    a2 = v20;
    double v13 = a3;
    double v12 = a4;
    if (v21) {
      return 1;
    }
  }
  return result;
}

uint64_t p_ComputeOutcode(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  v14.origin.double x = a3;
  v14.origin.y = a4;
  v14.size.double width = a5;
  v14.size.height = a6;
  if (a2 <= CGRectGetMaxY(v14))
  {
    v15.origin.double x = a3;
    v15.origin.y = a4;
    v15.size.double width = a5;
    v15.size.height = a6;
    if (a2 < CGRectGetMinY(v15)) {
      uint64_t v12 = 2;
    }
    else {
      uint64_t v12 = 0;
    }
  }
  else
  {
    uint64_t v12 = 1;
  }
  v16.origin.double x = a3;
  v16.origin.y = a4;
  v16.size.double width = a5;
  v16.size.height = a6;
  if (a1 > CGRectGetMaxX(v16)) {
    return v12 | 4;
  }
  v17.origin.double x = a3;
  v17.origin.y = a4;
  v17.size.double width = a5;
  v17.size.height = a6;
  if (a1 < CGRectGetMinX(v17)) {
    return v12 | 8;
  }
  else {
    return v12;
  }
}

double VKMAveragePoints(double a1, double a2, double a3)
{
  return (a1 + a3) * 0.5;
}

double VKMNearestPointOnInfiniteLineToPoint(double *a1, double a2, double a3)
{
  double v3 = a1[1];
  double v4 = a1[2] - *a1;
  double v5 = a1[3] - v3;
  double v6 = 1.0 / sqrt(v5 * v5 + v4 * v4);
  return *a1 + v4 * v6 * ((a3 - v3) * (v5 * v6) + (a2 - *a1) * (v4 * v6));
}

double VKMNormalizePoint(double a1, double a2)
{
  return a1 * (1.0 / sqrt(a2 * a2 + a1 * a1));
}

double VKMSubtractPoints(double a1, double a2, double a3)
{
  return a1 - a3;
}

double VKMDotPoints(double a1, double a2, double a3, double a4)
{
  return a2 * a4 + a1 * a3;
}

double VKMAddPoints(double a1, double a2, double a3)
{
  return a1 + a3;
}

double VKMMultiplyPointScalar(double a1, double a2, double a3)
{
  return a1 * a3;
}

double VKMNearestPointOnLineSegmentToPoint(double *a1, double a2, double a3)
{
  double v4 = *a1;
  double v5 = a1[1];
  double result = a1[2];
  double v7 = result - *a1;
  double v8 = a1[3] - v5;
  double v9 = sqrt(v8 * v8 + v7 * v7);
  if (v9 <= 0.0) {
    return *a1;
  }
  double v10 = v7 * (1.0 / v9);
  double v11 = (a3 - v5) * (v8 * (1.0 / v9)) + (a2 - v4) * v10;
  if (v11 <= 0.0) {
    return *a1;
  }
  if (v11 < v9) {
    return v4 + v10 * v11;
  }
  return result;
}

double VKMPointLength(double a1, double a2)
{
  return sqrt(a2 * a2 + a1 * a1);
}

uint64_t VKMDistanceFromLineToLineAtPoint(double *a1, double *a2)
{
  uint64_t v5 = 0;
  v3[0] = 0.0;
  v3[1] = 0.0;
  return VKMIntersectionOfLines(a1, a2, (double *)&v5, &v4, v3, 1, 1);
}

uint64_t VKMIntersectionOfLines(double *a1, double *a2, double *a3, double *a4, double *a5, char a6, char a7)
{
  double v7 = a1[1];
  double v8 = a1[2] - *a1;
  double v9 = a1[3] - v7;
  double v10 = a2[1];
  double v11 = a2[2] - *a2;
  double v12 = a2[3] - v10;
  double v13 = (v9 * (*a2 - *a1) + (v7 - v10) * v8) / (v12 * v8 - v11 * v9);
  *a4 = v13;
  if ((a6 & 1) == 0 && (v13 < 0.0 || v13 > 1.0)) {
    return 0;
  }
  double v15 = (v12 * (*a1 - *a2) + (a2[1] - a1[1]) * v11) / (v9 * v11 - v8 * v12);
  *a3 = v15;
  if ((a7 & 1) == 0 && (v15 < 0.0 || v15 > 1.0)) {
    return 0;
  }
  double v18 = a1[1];
  *a5 = *a1 + v15 * v8;
  a5[1] = v18 + *a3 * v9;
  return 1;
}

double VKMDistance(double a1, double a2, double a3, double a4)
{
  return sqrt((a2 - a4) * (a2 - a4) + (a1 - a3) * (a1 - a3));
}

double VKMMidpointOnLineSegment(double a1, double a2, double a3)
{
  return (a1 + a3) * 0.5;
}

BOOL VKMSizeIsEmpty(double a1, double a2)
{
  return a2 == 0.0 || a1 == 0.0;
}

uint64_t VKMSizeIsEmptyOrHasNanOrInf(double a1, double a2)
{
  uint64_t result = 1;
  if (a1 != 0.0)
  {
    BOOL v3 = fabs(a2) == INFINITY;
    if (fabs(a1) == INFINITY) {
      BOOL v3 = 1;
    }
    return a2 == 0.0 || v3;
  }
  return result;
}

uint64_t VKMSizeHasNaNComponents()
{
  return 0;
}

uint64_t VKMSizeHasInfComponents(double a1, double a2)
{
  BOOL v2 = fabs(a2) == INFINITY;
  return fabs(a1) == INFINITY || v2;
}

double VKMSizeWithMaxArea(double result, double a2, double a3, double a4)
{
  if (result * a2 <= a3 * a4) {
    return a3;
  }
  return result;
}

double VKMSizeRatioFromSizes(double a1, double a2, double a3)
{
  return a1 / a3;
}

double VKMUnionRect(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  BOOL v8 = a7 <= 0.0;
  if (a8 > 0.0) {
    BOOL v8 = 0;
  }
  if (a3 > 0.0 || a4 > 0.0)
  {
    if (v8)
    {
      return a1;
    }
    else if (a1 < a5)
    {
      return a1;
    }
  }
  else if (v8)
  {
    return *MEMORY[0x1E4F1DB28];
  }
  return a5;
}

double VKMHorizontalSpacingRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  double MinX = CGRectGetMinX(*(CGRect *)&a1);
  v31.origin.double x = a5;
  v31.origin.y = a6;
  v31.size.double width = a7;
  CGFloat v24 = a7;
  v31.size.height = a8;
  double v29 = fmax(MinX, CGRectGetMinX(v31));
  v32.origin.double x = a1;
  v32.origin.y = a2;
  v32.size.double width = a3;
  v32.size.height = a4;
  double MaxX = CGRectGetMaxX(v32);
  v33.origin.double x = a5;
  v33.origin.y = a6;
  v33.size.double width = a7;
  v33.size.height = a8;
  double v27 = fmin(MaxX, CGRectGetMaxX(v33));
  v34.origin.double x = a1;
  v34.origin.y = a2;
  v34.size.double width = a3;
  v34.size.height = a4;
  double MaxY = CGRectGetMaxY(v34);
  v35.origin.double x = a5;
  v35.origin.y = a6;
  v35.size.double width = v24;
  v35.size.height = a8;
  double v16 = fmin(MaxY, CGRectGetMaxY(v35));
  v36.origin.double x = a1;
  v36.origin.y = a2;
  v36.size.double width = a3;
  v36.size.height = a4;
  double MinY = CGRectGetMinY(v36);
  v37.origin.double x = a5;
  v37.origin.y = a6;
  v37.size.double width = v24;
  v37.size.height = a8;
  double v18 = fmax(MinY, CGRectGetMinY(v37));
  double v19 = v29;
  double v21 = v18 - v16;
  double v22 = v16;
  double v20 = v27 - v29;
  *(void *)&double result = (unint64_t)CGRectStandardize(*(CGRect *)&v19);
  return result;
}

double VKMVerticalSpacingRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  double MaxX = CGRectGetMaxX(*(CGRect *)&a1);
  v31.origin.double x = a5;
  v31.origin.y = a6;
  v31.size.double width = a7;
  CGFloat v24 = a7;
  v31.size.height = a8;
  double v29 = fmin(MaxX, CGRectGetMaxX(v31));
  v32.origin.double x = a1;
  v32.origin.y = a2;
  v32.size.double width = a3;
  v32.size.height = a4;
  double MinX = CGRectGetMinX(v32);
  v33.origin.double x = a5;
  v33.origin.y = a6;
  v33.size.double width = a7;
  v33.size.height = a8;
  double v27 = fmax(MinX, CGRectGetMinX(v33));
  v34.origin.double x = a1;
  v34.origin.y = a2;
  v34.size.double width = a3;
  v34.size.height = a4;
  double MinY = CGRectGetMinY(v34);
  v35.origin.double x = a5;
  v35.origin.y = a6;
  v35.size.double width = v24;
  v35.size.height = a8;
  double v16 = fmax(MinY, CGRectGetMinY(v35));
  v36.origin.double x = a1;
  v36.origin.y = a2;
  v36.size.double width = a3;
  v36.size.height = a4;
  double MaxY = CGRectGetMaxY(v36);
  v37.origin.double x = a5;
  v37.origin.y = a6;
  v37.size.double width = v24;
  v37.size.height = a8;
  double v18 = fmin(MaxY, CGRectGetMaxY(v37));
  double v19 = v29;
  double v21 = v18 - v16;
  double v22 = v16;
  double v20 = v27 - v29;
  *(void *)&double result = (unint64_t)CGRectStandardize(*(CGRect *)&v19);
  return result;
}

BOOL VKMIntersectsRect(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  if (a1 < a5) {
    BOOL result = a1 + a3 > a5;
  }
  else {
    BOOL result = a5 + a7 > a1;
  }
  if (a2 >= a6)
  {
    if (a6 + a8 > a2) {
      return result;
    }
    return 0;
  }
  if (a2 + a4 <= a6) {
    return 0;
  }
  return result;
}

BOOL VKMPointInRectInclusive(double a1, double a2, double a3, double a4, double a5, double a6)
{
  double v6 = a3 + a5;
  return a1 >= a3 && a1 <= v6 && a2 >= a4 && a2 <= a4 + a6;
}

double VKMMultiplyPointBySize(double a1, double a2, double a3)
{
  return a1 * a3;
}

double VKMMultiplyRectScalar(double a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5)
{
  double v9 = a1;
  if (!CGRectIsInfinite(*(CGRect *)&a1))
  {
    v11.origin.double x = v9;
    v11.origin.y = a2;
    v11.size.double width = a3;
    v11.size.height = a4;
    if (!CGRectIsNull(v11)) {
      return v9 * a5;
    }
  }
  return v9;
}

double VKMFlooredPoint(double a1)
{
  return floor(a1);
}

double VKMPointMin(double result, double a2, double a3)
{
  if (result >= a3) {
    return a3;
  }
  return result;
}

double VKMPointMax(double result, double a2, double a3)
{
  if (result < a3) {
    return a3;
  }
  return result;
}

double VKMSizeGetArea(double a1, double a2)
{
  return a1 * a2;
}

double VKMPointSquaredLength(double a1, double a2)
{
  return a2 * a2 + a1 * a1;
}

double VKMOrthogonalDistance(double a1, double a2, double a3, double a4)
{
  double v4 = a1 - a3;
  if (v4 < 0.0) {
    double v4 = -v4;
  }
  double v5 = a2 - a4;
  if (v5 < 0.0) {
    double v5 = -v5;
  }
  return v4 + v5;
}

void VKMDistanceToRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  v16.origin.double x = a3;
  v16.origin.y = a4;
  v16.size.double width = a5;
  v16.size.height = a6;
  if (a1 < CGRectGetMinX(v16))
  {
    v17.origin.double x = a3;
    v17.origin.y = a4;
    v17.size.double width = a5;
    v17.size.height = a6;
    if (a2 < CGRectGetMinY(v17))
    {
      v18.origin.double x = a3;
      v18.origin.y = a4;
      v18.size.double width = a5;
      v18.size.height = a6;
      CGRectGetMinX(v18);
LABEL_7:
      v22.origin.double x = a3;
      v22.origin.y = a4;
      v22.size.double width = a5;
      v22.size.height = a6;
      CGRectGetMinY(v22);
      return;
    }
    v23.origin.double x = a3;
    v23.origin.y = a4;
    v23.size.double width = a5;
    v23.size.height = a6;
    double MaxY = CGRectGetMaxY(v23);
    v24.origin.double x = a3;
    v24.origin.y = a4;
    v24.size.double width = a5;
    v24.size.height = a6;
    CGRectGetMinX(v24);
    if (a2 <= MaxY) {
      return;
    }
LABEL_13:
    v28.origin.double x = a3;
    v28.origin.y = a4;
    v28.size.double width = a5;
    v28.size.height = a6;
    CGRectGetMaxY(v28);
    return;
  }
  v19.origin.double x = a3;
  v19.origin.y = a4;
  v19.size.double width = a5;
  v19.size.height = a6;
  double MaxX = CGRectGetMaxX(v19);
  v20.origin.double x = a3;
  v20.origin.y = a4;
  v20.size.double width = a5;
  v20.size.height = a6;
  double MinY = CGRectGetMinY(v20);
  if (a1 <= MaxX)
  {
    if (a2 >= MinY)
    {
      v29.origin.double x = a3;
      v29.origin.y = a4;
      v29.size.double width = a5;
      v29.size.height = a6;
      if (a2 > CGRectGetMaxY(v29))
      {
        v30.origin.double x = a3;
        v30.origin.y = a4;
        v30.size.double width = a5;
        v30.size.height = a6;
        CGRectGetMaxY(v30);
      }
    }
    else
    {
      v25.origin.double x = a3;
      v25.origin.y = a4;
      v25.size.double width = a5;
      v25.size.height = a6;
      CGRectGetMinY(v25);
    }
    return;
  }
  if (a2 < MinY)
  {
    v21.origin.double x = a3;
    v21.origin.y = a4;
    v21.size.double width = a5;
    v21.size.height = a6;
    CGRectGetMaxX(v21);
    goto LABEL_7;
  }
  v26.origin.double x = a3;
  v26.origin.y = a4;
  v26.size.double width = a5;
  v26.size.height = a6;
  double v15 = CGRectGetMaxY(v26);
  v27.origin.double x = a3;
  v27.origin.y = a4;
  v27.size.double width = a5;
  v27.size.height = a6;
  CGRectGetMaxX(v27);
  if (a2 > v15) {
    goto LABEL_13;
  }
}

double VKMDistanceToRectFromRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5, double a6, double a7, double a8)
{
  double MidX = CGRectGetMidX(*(CGRect *)&a1);
  v23.origin.double x = a1;
  v23.origin.y = a2;
  v23.size.double width = a3;
  v23.size.height = a4;
  double MidY = CGRectGetMidY(v23);
  double v16 = VKMClamp(MidX, a5, a5 + a7);
  double v17 = VKMClamp(MidY, a6, a6 + a8);
  double v18 = VKMClamp(v16, a1, a1 + a3);
  double v19 = VKMClamp(v17, a2, a2 + a4);
  return sqrt((v17 - v19) * (v17 - v19) + (v16 - v18) * (v16 - v18));
}

double VKMClampPointInRect(double a1, double a2, double a3, double a4, double a5, double a6)
{
  double v9 = VKMClamp(a1, a3, a3 + a5);
  VKMClamp(a2, a4, a4 + a6);
  return v9;
}

double VKMCenterOfRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  double MidX = CGRectGetMidX(*(CGRect *)&a1);
  v10.origin.double x = a1;
  v10.origin.y = a2;
  v10.size.double width = a3;
  v10.size.height = a4;
  CGRectGetMidY(v10);
  return MidX;
}

BOOL VKMPercentRectInsideRect(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  CGRect v9 = CGRectIntersection(*(CGRect *)&a1, *(CGRect *)&a5);
  return CGRectEqualToRect(v9, *MEMORY[0x1E4F1DB20]);
}

double VKMRectGetMaxPoint(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  double MaxX = CGRectGetMaxX(*(CGRect *)&a1);
  v10.origin.double x = a1;
  v10.origin.y = a2;
  v10.size.double width = a3;
  v10.size.height = a4;
  CGRectGetMaxY(v10);
  return MaxX;
}

double VKMComplexMultiplyPoint(double a1, double a2, double a3, double a4)
{
  return a1 * a3 - a2 * a4;
}

double VKMCrossPoints(double a1, double a2, double a3, double a4)
{
  return a2 * a3 - a1 * a4;
}

double VKMGrowRectToPoint(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5)
{
  if (!CGRectIsNull(*(CGRect *)&a1))
  {
    v13.origin.double x = a1;
    v13.origin.y = a2;
    v13.size.double width = a3;
    v13.size.height = a4;
    double MinX = CGRectGetMinX(v13);
    if (MinX >= a5) {
      double v11 = a5;
    }
    else {
      double v11 = MinX;
    }
    v14.origin.double x = a1;
    v14.origin.y = a2;
    v14.size.double width = a3;
    v14.size.height = a4;
    CGRectGetMaxX(v14);
    v15.origin.double x = a1;
    v15.origin.y = a2;
    v15.size.double width = a3;
    v15.size.height = a4;
    CGRectGetMinY(v15);
    v16.origin.double x = a1;
    v16.origin.y = a2;
    v16.size.double width = a3;
    v16.size.height = a4;
    CGRectGetMaxY(v16);
    return v11;
  }
  return a5;
}

double VKMFlipRect(double a1, double a2, double a3, double a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  CGRectGetMidY(*(CGRect *)&a1);
  v14.origin.double x = a5;
  v14.origin.y = a6;
  v14.size.double width = a7;
  v14.size.height = a8;
  CGRectGetMidY(v14);
  return a1;
}

double VKMCenterRectOverRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  v26.origin.double x = a5;
  v26.origin.y = a6;
  v26.size.double width = a7;
  v26.size.height = a8;
  double MidX = CGRectGetMidX(v26);
  v27.origin.double x = a5;
  v27.origin.y = a6;
  v27.size.double width = a7;
  v27.size.height = a8;
  double MidY = CGRectGetMidY(v27);
  v28.origin.double x = a1;
  v28.origin.y = a2;
  v28.size.double width = a3;
  v28.size.height = a4;
  double v17 = CGRectGetMidX(v28);
  v29.origin.double x = a1;
  v29.origin.y = a2;
  v29.size.double width = a3;
  v29.size.height = a4;
  double v18 = MidY - CGRectGetMidY(v29);
  CGFloat v19 = a1;
  CGFloat v20 = a2;
  CGFloat v21 = a3;
  CGFloat v22 = a4;
  *(void *)&double result = (unint64_t)CGRectOffset(*(CGRect *)&v19, MidX - v17, v18);
  return result;
}

BOOL VKMRectIsFinite(double a1, double a2, double a3, double a4)
{
  BOOL result = 0;
  if (fabs(a1) != INFINITY && fabs(a2) != INFINITY && fabs(a3) != INFINITY)
  {
    double v5 = fabs(a4);
    return v5 > INFINITY || v5 < INFINITY;
  }
  return result;
}

BOOL VKMRectHasArea(double a1, double a2, double a3, double a4)
{
  BOOL result = 0;
  if (fabs(a1) != INFINITY && fabs(a2) != INFINITY && fabs(a3) != INFINITY && fabs(a4) != INFINITY) {
    return a4 != 0.0 && a3 != 0.0;
  }
  return result;
}

void VKMRectDivide(CGRect *a1, CGRect *a2, CGRectEdge a3, double a4, double a5, double a6, double a7, CGFloat a8)
{
  memset(v8, 0, sizeof(v8));
  if (!a1) {
    a1 = (CGRect *)v8;
  }
  if (!a2) {
    a2 = (CGRect *)v8;
  }
  CGRectDivide(*(CGRect *)&a4, a1, a2, a8, a3);
}

uint64_t VKMGetCanvasSpaceCorners(uint64_t a1, _OWORD *a2, _OWORD *a3, _OWORD *a4, _OWORD *a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9)
{
  v53[2] = *(double *)MEMORY[0x1E4F143B8];
  long long v18 = *(_OWORD *)(a1 + 16);
  float64x2_t v46 = *(float64x2_t *)a1;
  long long v47 = v18;
  long long v48 = *(_OWORD *)(a1 + 32);
  VKMTransformedCornersOfRect(&v46, &v49, &v51, &v52, v53, a6, a7, a8, a9);
  v54.origin.double x = a6;
  v54.origin.y = a7;
  v54.size.double width = a8;
  v54.size.height = a9;
  double MidX = CGRectGetMidX(v54);
  v55.origin.double x = a6;
  v55.origin.y = a7;
  v55.size.double width = a8;
  v55.size.height = a9;
  CGFloat MidY = CGRectGetMidY(v55);
  uint64_t v21 = 0;
  uint64_t v22 = 0;
  double v23 = *(double *)(a1 + 32) + MidY * *(double *)(a1 + 16) + *(double *)a1 * MidX;
  double v24 = 1000000.0;
  double v25 = *(double *)(a1 + 40) + MidY * *(double *)(a1 + 24) + *(double *)(a1 + 8) * MidX;
  CGRect v26 = (double *)&v50;
  do
  {
    long double v27 = atan2(*v26 - v25, *(v26 - 1) - v23);
    double v28 = fmod(v27 * 57.2957795, 360.0);
    if (v28 < 0.0) {
      double v28 = v28 + 360.0;
    }
    if (v28 == 0.0) {
      double v29 = 225.0;
    }
    else {
      double v29 = 360.0 - v28 + -135.0;
    }
    double v30 = fabs(v29);
    if (v30 < v24)
    {
      uint64_t v21 = v22;
      double v24 = v30;
    }
    ++v22;
    v26 += 2;
  }
  while (v22 != 4);
  *a2 = *((_OWORD *)&v49 + v21);
  uint64_t v31 = (v21 + 2) & 3;
  if (v21 + 2 <= 0) {
    uint64_t v31 = -(-(v21 + 2) & 3);
  }
  *a4 = *((_OWORD *)&v49 + v31);
  long long v32 = *(_OWORD *)(a1 + 16);
  float64x2_t v46 = *(float64x2_t *)a1;
  long long v47 = v32;
  long long v48 = *(_OWORD *)(a1 + 32);
  BOOL v33 = VKMIsTransformFlipped(v46.f64);
  uint64_t v34 = v21 + 3;
  if (v33) {
    uint64_t v35 = v21 + 1;
  }
  else {
    uint64_t v35 = v21 + 3;
  }
  uint64_t v36 = v35 & 3;
  if (!v33) {
    uint64_t v34 = v21 + 1;
  }
  uint64_t v38 = -v35;
  BOOL v37 = v38 < 0;
  uint64_t v39 = v38 & 3;
  if (v37) {
    uint64_t v40 = v36;
  }
  else {
    uint64_t v40 = -v39;
  }
  *a5 = *((_OWORD *)&v49 + v40);
  uint64_t v41 = v34 & 3;
  uint64_t v42 = -v34;
  BOOL v37 = v42 < 0;
  uint64_t v43 = v42 & 3;
  if (v37) {
    uint64_t v44 = v41;
  }
  else {
    uint64_t v44 = -v43;
  }
  *a3 = *((_OWORD *)&v49 + v44);
  return v21;
}

double VKMAngleFromDelta(long double a1, long double a2)
{
  return atan2(a2, a1);
}

void VKMNormalizeAngleInDegrees(long double a1)
{
}

double VKMInterpolatePoints(double a1, double a2, double a3, double a4, double a5)
{
  return a3 * a5 + a1 * (1.0 - a5);
}

uint64_t VKMMixBOOLs(uint64_t result, unsigned int a2, double a3)
{
  if (a3 > 0.5) {
    return a2;
  }
  else {
    return result;
  }
}

double VKMMixFloats(double a1, double a2, double a3)
{
  return a2 * a3 + a1 * (1.0 - a3);
}

void VKMMixAnglesInDegrees(long double a1, long double a2, double a3)
{
  double v5 = fmod(a1, 360.0);
  if (v5 < 0.0) {
    double v5 = v5 + 360.0;
  }
  if (v5 == 0.0) {
    double v6 = 0.0;
  }
  else {
    double v6 = v5;
  }
  double v7 = fmod(a2, 360.0);
  if (v7 < 0.0) {
    double v7 = v7 + 360.0;
  }
  if (v7 == 0.0) {
    double v7 = 0.0;
  }
  if (vabdd_f64(v7, v6) > 180.0)
  {
    if (v6 <= v7) {
      double v7 = v7 + -360.0;
    }
    else {
      double v7 = v7 + 360.0;
    }
  }
  fmod(v7 * a3 + v6 * (1.0 - a3), 360.0);
}

double VKMMixAnglesInRadians(double a1, double a2, double a3)
{
  VKMMixAnglesInDegrees(a1 * 57.2957795, a2 * 57.2957795, a3);
  return v3 * 0.0174532925;
}

double VKMMixRects(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  return a5 * a9 + a1 * (1.0 - a9);
}

double VKMClipRectToMaxY(double a1, double a2, double a3, double a4)
{
  return a1;
}

double VKMClipRectToMinY(double a1, double a2, double a3, double a4)
{
  return a1;
}

double VKMTranslatedRectMaximizingOverlapWithRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  v36.origin.double x = a5;
  v36.origin.y = a6;
  v36.size.double width = a7;
  v36.size.height = a8;
  double MaxX = CGRectGetMaxX(v36);
  double v34 = a1;
  v37.origin.double x = a1;
  v37.origin.y = a2;
  v37.size.double width = a3;
  v37.size.height = a4;
  if (MaxX > CGRectGetMaxX(v37))
  {
    v38.origin.double x = a5;
    v38.origin.y = a6;
    v38.size.double width = a7;
    v38.size.height = a8;
    double MinX = CGRectGetMinX(v38);
    v39.origin.double x = a1;
    v39.origin.y = a2;
    v39.size.double width = a3;
    v39.size.height = a4;
    if (MinX > CGRectGetMinX(v39))
    {
      v40.origin.double x = a5;
      v40.origin.y = a6;
      v40.size.double width = a7;
      v40.size.height = a8;
      double v29 = CGRectGetMaxX(v40);
      v41.origin.double x = a1;
      v41.origin.y = a2;
      v41.size.double width = a3;
      v41.size.height = a4;
      double v30 = v29 - CGRectGetMaxX(v41);
      v42.origin.double x = a5;
      v42.origin.y = a6;
      v42.size.double width = a7;
      v42.size.height = a8;
      double v28 = CGRectGetMinX(v42);
      v43.origin.double x = a1;
      v43.origin.y = a2;
      v43.size.double width = a3;
      v43.size.height = a4;
      double v17 = v28 - CGRectGetMinX(v43);
      if (v30 < v17) {
        double v17 = v30;
      }
      double v18 = a1 + v17;
LABEL_11:
      double v34 = v18;
      goto LABEL_12;
    }
  }
  v44.origin.double x = a5;
  v44.origin.y = a6;
  v44.size.double width = a7;
  v44.size.height = a8;
  double v19 = CGRectGetMinX(v44);
  v45.origin.double x = a1;
  v45.origin.y = a2;
  v45.size.double width = a3;
  v45.size.height = a4;
  if (v19 < CGRectGetMinX(v45))
  {
    v46.origin.double x = a5;
    v46.origin.y = a6;
    v46.size.double width = a7;
    v46.size.height = a8;
    double v20 = CGRectGetMaxX(v46);
    v47.origin.double x = a1;
    v47.origin.y = a2;
    v47.size.double width = a3;
    v47.size.height = a4;
    if (v20 < CGRectGetMaxX(v47))
    {
      v48.origin.double x = a1;
      v48.origin.y = a2;
      v48.size.double width = a3;
      v48.size.height = a4;
      double v31 = CGRectGetMinX(v48);
      v49.origin.double x = a5;
      v49.origin.y = a6;
      v49.size.double width = a7;
      v49.size.height = a8;
      double v32 = v31 - CGRectGetMinX(v49);
      v50.origin.double x = a1;
      v50.origin.y = a2;
      v50.size.double width = a3;
      v50.size.height = a4;
      double v21 = CGRectGetMaxX(v50);
      v51.origin.double x = a5;
      v51.origin.y = a6;
      v51.size.double width = a7;
      v51.size.height = a8;
      double v22 = v21 - CGRectGetMaxX(v51);
      if (v32 < v22) {
        double v22 = v32;
      }
      double v18 = a1 - v22;
      goto LABEL_11;
    }
  }
LABEL_12:
  v52.origin.double x = a5;
  v52.origin.y = a6;
  v52.size.double width = a7;
  v52.size.height = a8;
  double MaxY = CGRectGetMaxY(v52);
  v53.origin.double x = a1;
  v53.origin.y = a2;
  v53.size.double width = a3;
  v53.size.height = a4;
  if (MaxY <= CGRectGetMaxY(v53)) {
    goto LABEL_15;
  }
  v54.origin.double x = a5;
  v54.origin.y = a6;
  v54.size.double width = a7;
  v54.size.height = a8;
  double MinY = CGRectGetMinY(v54);
  v55.origin.double x = a1;
  v55.origin.y = a2;
  v55.size.double width = a3;
  v55.size.height = a4;
  if (MinY <= CGRectGetMinY(v55))
  {
LABEL_15:
    v60.origin.double x = a5;
    v60.origin.y = a6;
    v60.size.double width = a7;
    v60.size.height = a8;
    double v25 = CGRectGetMinY(v60);
    v61.origin.double x = a1;
    v61.origin.y = a2;
    v61.size.double width = a3;
    v61.size.height = a4;
    if (v25 < CGRectGetMinY(v61))
    {
      v62.origin.double x = a5;
      v62.origin.y = a6;
      v62.size.double width = a7;
      v62.size.height = a8;
      double v26 = CGRectGetMaxY(v62);
      v63.origin.double x = a1;
      v63.origin.y = a2;
      v63.size.double width = a3;
      v63.size.height = a4;
      if (v26 < CGRectGetMaxY(v63))
      {
        v64.origin.double x = a1;
        v64.origin.y = a2;
        v64.size.double width = a3;
        v64.size.height = a4;
        CGRectGetMinY(v64);
        v65.origin.double x = a5;
        v65.origin.y = a6;
        v65.size.double width = a7;
        v65.size.height = a8;
        CGRectGetMinY(v65);
        v66.origin.double x = a1;
        v66.origin.y = a2;
        v66.size.double width = a3;
        v66.size.height = a4;
        CGRectGetMaxY(v66);
        v67.origin.double x = a5;
        v67.origin.y = a6;
        v67.size.double width = a7;
        v67.size.height = a8;
        CGRectGetMaxY(v67);
      }
    }
  }
  else
  {
    v56.origin.double x = a5;
    v56.origin.y = a6;
    v56.size.double width = a7;
    v56.size.height = a8;
    CGRectGetMaxY(v56);
    v57.origin.double x = a1;
    v57.origin.y = a2;
    v57.size.double width = a3;
    v57.size.height = a4;
    CGRectGetMaxY(v57);
    v58.origin.double x = a5;
    v58.origin.y = a6;
    v58.size.double width = a7;
    v58.size.height = a8;
    CGRectGetMinY(v58);
    v59.origin.double x = a1;
    v59.origin.y = a2;
    v59.size.double width = a3;
    v59.size.height = a4;
    CGRectGetMinY(v59);
  }
  return v34;
}

double VKMOriginRotate(double *a1, double a2, double a3)
{
  __double2 v5 = __sincos_stret(a3);
  double result = v5.__sinval * a2;
  *a1 = v5.__cosval * a2;
  a1[1] = v5.__sinval * a2;
  return result;
}

double VKMNiceAngleFromDelta(long double a1, long double a2)
{
  if (a2 != 0.0) {
    return atan2(a2, a1);
  }
  double result = 3.14159265;
  if (a1 >= 0.0) {
    return 0.0;
  }
  return result;
}

double VKMDeltaFromAngle(double a1)
{
  if (a1 == 0.0) {
    return 1.0;
  }
  return __sincos_stret(a1).__cosval;
}

double VKMShiftConstrainDelta(long double a1, long double a2)
{
  long double v4 = atan2(a2, a1);
  return sqrt(a2 * a2 + a1 * a1)
       * __sincos_stret((double)(int)((v4 + 6.28318531) / 0.785398163 + 0.5) * 0.785398163).__cosval;
}

double VKMShiftConstrainDeltaToAngle(double a1, double a2, double a3)
{
  return __sincos_stret(a3).__cosval * sqrt(a2 * a2 + a1 * a1);
}

double VKMRotatePoint90Degrees(int a1, double a2, double a3)
{
  if (a1) {
    return -a3;
  }
  else {
    return a3;
  }
}

void VKMNormalizeSignedDifferenceAngleInDegrees(double a1, double a2)
{
}

double VKMNormalizeDifferenceAngleInDegrees(double a1, double a2)
{
  double v2 = fmod(a1 - a2, 360.0);
  if (v2 > 180.0) {
    double v2 = v2 + -360.0;
  }
  if (v2 < -180.0) {
    double v2 = v2 + 360.0;
  }
  return fabs(v2);
}

void VKMNormalizeAngleInRadians(long double a1)
{
}

void VKMNormalizeAngleAboutZeroInRadians(double a1)
{
}

double VKMDeltaApplyAffineTransform(float64x2_t *a1, double a2, double a3)
{
  *(void *)&double result = *(_OWORD *)&vsubq_f64(vaddq_f64(a1[2], vmlaq_n_f64(vmulq_n_f64(a1[1], a3), *a1, a2)), vaddq_f64(a1[2], vmlaq_n_f64(vmulq_n_f64(a1[1], *(double *)(MEMORY[0x1E4F1DAD8] + 8)), *a1, *MEMORY[0x1E4F1DAD8])));
  return result;
}

void VKMDistanceBetweenAnglesInRadians(long double a1, long double a2)
{
}

double VKMNormalizedAngleBetweenPoints(double a1, double a2, double a3, double a4, double a5, double a6)
{
  double v6 = a3 - a1;
  double v7 = a4 - a2;
  double v8 = 1.0 / sqrt(v7 * v7 + v6 * v6);
  double v9 = a5 - a1;
  double v10 = a6 - a2;
  double v11 = 1.0 / sqrt(v10 * v10 + v9 * v9);
  return acos(v7 * v8 * (v10 * v11) + v6 * v8 * (v9 * v11));
}

long double VKMAngleBetweenPoints(double a1, double a2, double a3, double a4, double a5, double a6)
{
  double v10 = atan2(a6 - a4, a5 - a3);
  return v10 - atan2(a2 - a4, a1 - a3);
}

double VKMRotationFromTransform(uint64_t a1)
{
  return atan2(*(long double *)(a1 + 8), *(long double *)(a1 + 24));
}

double VKMNormalizedPointInRect(double a1, double a2, double a3, double a4, double a5)
{
  return (a1 - a3) / a5;
}

double VKMPointFromNormalizedRect(double a1, double a2, double a3, double a4, double a5)
{
  return a3 + a1 * a5;
}

double VKMPointByExtendingLineFromPoints(double a1, double a2, double a3, double a4, double a5)
{
  return a1
       + (sqrt((a2 - a4) * (a2 - a4) + (a1 - a3) * (a1 - a3)) + a5)
       * ((a3 - a1)
        * (1.0
         / sqrt((a4 - a2) * (a4 - a2) + (a3 - a1) * (a3 - a1))));
}

double VKMSlopeOfLine(double a1, double a2, double a3, double a4)
{
  return (a4 - a2) / (a3 - a1);
}

double VKMAngleOfLine(double a1, double a2, double a3, double a4)
{
  return atan((a4 - a2) / (a3 - a1));
}

void VKMRectFromNormalizedSubrect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  v16.origin.double x = a5;
  v16.origin.y = a6;
  v16.size.double width = a7;
  v16.size.height = a8;
  if (!CGRectIsInfinite(v16))
  {
    v17.origin.double x = a1;
    v17.origin.y = a2;
    v17.size.double width = a3;
    v17.size.height = a4;
    if (!CGRectIsInfinite(v17))
    {
      v18.origin.double x = a5;
      v18.origin.y = a6;
      v18.size.double width = a7;
      v18.size.height = a8;
      if (!CGRectIsNull(v18))
      {
        v19.origin.double x = a1;
        v19.origin.y = a2;
        v19.size.double width = a3;
        v19.size.height = a4;
        if (!CGRectIsNull(v19))
        {
          v20.origin.double x = a5;
          v20.origin.y = a6;
          v20.size.double width = a7;
          v20.size.height = a8;
          CGRectGetMaxX(v20);
          v21.origin.double x = a5;
          v21.origin.y = a6;
          v21.size.double width = a7;
          v21.size.height = a8;
          CGRectGetMaxY(v21);
        }
      }
    }
  }
}

void VKMNormalizedSubrectInRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  if (!CGRectIsInfinite(*(CGRect *)&a1))
  {
    v16.origin.double x = a5;
    v16.origin.y = a6;
    v16.size.double width = a7;
    v16.size.height = a8;
    if (!CGRectIsInfinite(v16))
    {
      v17.origin.double x = a1;
      v17.origin.y = a2;
      v17.size.double width = a3;
      v17.size.height = a4;
      if (!CGRectIsNull(v17))
      {
        v18.origin.double x = a5;
        v18.origin.y = a6;
        v18.size.double width = a7;
        v18.size.height = a8;
        if (!CGRectIsNull(v18))
        {
          v19.origin.double x = a1;
          v19.origin.y = a2;
          v19.size.double width = a3;
          v19.size.height = a4;
          CGRectGetMaxX(v19);
          v20.origin.double x = a1;
          v20.origin.y = a2;
          v20.size.double width = a3;
          v20.size.height = a4;
          CGRectGetMaxY(v20);
        }
      }
    }
  }
}

double VKMRectSubtractingRect(double a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5, double a6, double a7, double a8)
{
  double v11 = a1;
  CGRect v42 = CGRectIntersection(*(CGRect *)&a1, *(CGRect *)&a5);
  CGFloat x = v42.origin.x;
  CGFloat y = v42.origin.y;
  CGFloat width = v42.size.width;
  CGFloat height = v42.size.height;
  if (!CGRectIsNull(v42))
  {
    v43.origin.CGFloat x = x;
    v43.origin.CGFloat y = y;
    v43.size.CGFloat width = width;
    v43.size.CGFloat height = height;
    double MaxY = CGRectGetMaxY(v43);
    v44.origin.CGFloat x = v11;
    v44.origin.CGFloat y = a2;
    v44.size.CGFloat width = a3;
    v44.size.CGFloat height = a4;
    double MinY = CGRectGetMinY(v44);
    v45.origin.CGFloat x = v11;
    v45.origin.CGFloat y = a2;
    v45.size.CGFloat width = a3;
    v45.size.CGFloat height = a4;
    double v37 = CGRectGetMaxY(v45);
    v46.origin.CGFloat x = x;
    v46.origin.CGFloat y = y;
    v46.size.CGFloat width = width;
    v46.size.CGFloat height = height;
    double v38 = v37 - CGRectGetMaxY(v46);
    v47.origin.CGFloat x = v11;
    v47.origin.CGFloat y = a2;
    v47.size.CGFloat width = a3;
    v47.size.CGFloat height = a4;
    double v33 = v38 * CGRectGetWidth(v47);
    CGFloat v36 = height;
    CGFloat v39 = x;
    v48.origin.CGFloat x = x;
    v48.origin.CGFloat y = y;
    v48.size.CGFloat width = width;
    v48.size.CGFloat height = height;
    double v16 = CGRectGetMinY(v48);
    v49.origin.CGFloat x = v11;
    v49.origin.CGFloat y = a2;
    v49.size.CGFloat width = a3;
    v49.size.CGFloat height = a4;
    double v17 = v16 - CGRectGetMinY(v49);
    v50.origin.CGFloat x = v11;
    v50.origin.CGFloat y = a2;
    v50.size.CGFloat width = a3;
    v50.size.CGFloat height = a4;
    double v18 = v17 * CGRectGetWidth(v50);
    double v19 = v33;
    if (v18 <= v33)
    {
      double v35 = MaxY - MinY;
      CGRectEdge v21 = CGRectMinYEdge;
    }
    else
    {
      v51.origin.CGFloat x = v11;
      v51.origin.CGFloat y = a2;
      v51.size.CGFloat width = a3;
      v51.size.CGFloat height = a4;
      double v20 = CGRectGetMaxY(v51);
      v52.size.CGFloat height = v36;
      v52.origin.CGFloat x = v39;
      v52.origin.CGFloat y = y;
      v52.size.CGFloat width = width;
      double v35 = v20 - CGRectGetMinY(v52);
      CGRectEdge v21 = CGRectMaxYEdge;
      double v19 = v18;
    }
    v53.origin.CGFloat x = v11;
    v53.origin.CGFloat y = a2;
    v53.size.CGFloat width = a3;
    v53.size.CGFloat height = a4;
    double MaxX = CGRectGetMaxX(v53);
    v54.size.CGFloat height = v36;
    v54.origin.CGFloat x = v39;
    v54.origin.CGFloat y = y;
    v54.size.CGFloat width = width;
    double v23 = MaxX - CGRectGetMaxX(v54);
    v55.origin.CGFloat x = v11;
    v55.origin.CGFloat y = a2;
    v55.size.CGFloat width = a3;
    v55.size.CGFloat height = a4;
    double v24 = v23 * CGRectGetHeight(v55);
    if (v24 > v19)
    {
      v56.size.CGFloat height = v36;
      v56.origin.CGFloat x = v39;
      v56.origin.CGFloat y = y;
      v56.size.CGFloat width = width;
      double v25 = CGRectGetMaxX(v56);
      v57.origin.CGFloat x = v11;
      v57.origin.CGFloat y = a2;
      v57.size.CGFloat width = a3;
      v57.size.CGFloat height = a4;
      CGRectEdge v21 = CGRectMinXEdge;
      double v35 = v25 - CGRectGetMinX(v57);
      double v19 = v24;
    }
    v58.size.CGFloat height = v36;
    v58.origin.CGFloat x = v39;
    v58.origin.CGFloat y = y;
    v58.size.CGFloat width = width;
    double MinX = CGRectGetMinX(v58);
    v59.origin.CGFloat x = v11;
    v59.origin.CGFloat y = a2;
    v59.size.CGFloat width = a3;
    v59.size.CGFloat height = a4;
    double v27 = MinX - CGRectGetMinX(v59);
    v60.origin.CGFloat x = v11;
    v60.origin.CGFloat y = a2;
    v60.size.CGFloat width = a3;
    v60.size.CGFloat height = a4;
    CGFloat v28 = CGRectGetHeight(v60);
    double v29 = v35;
    if (v27 * v28 > v19)
    {
      v61.origin.CGFloat x = v11;
      v61.origin.CGFloat y = a2;
      v61.size.CGFloat width = a3;
      v61.size.CGFloat height = a4;
      double v30 = CGRectGetMaxX(v61);
      v62.size.CGFloat height = v36;
      v62.origin.CGFloat x = v39;
      v62.origin.CGFloat y = y;
      v62.size.CGFloat width = width;
      double v29 = v30 - CGRectGetMinX(v62);
      CGRectEdge v21 = CGRectMaxXEdge;
    }
    memset(&remainder, 0, sizeof(remainder));
    memset(&slice, 0, sizeof(slice));
    v63.origin.CGFloat x = v11;
    v63.origin.CGFloat y = a2;
    v63.size.CGFloat width = a3;
    v63.size.CGFloat height = a4;
    CGRectDivide(v63, &slice, &remainder, v29, v21);
    return remainder.origin.x;
  }
  return v11;
}

double VKMRectFromAddingSize(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5)
{
  double MidX = CGRectGetMidX(*(CGRect *)&a1);
  v12.origin.CGFloat x = a1;
  v12.origin.CGFloat y = a2;
  v12.size.CGFloat width = a3;
  v12.size.CGFloat height = a4;
  CGRectGetMidY(v12);
  return MidX - (a3 + a5 + a5) * 0.5;
}

double VKMRectWithTopRightPoint(double a1, double a2, double a3)
{
  return a3 - a1;
}

double VKMRectWithBottomRightPoint(double a1, double a2, double a3)
{
  return a3 - a1;
}

double VKMRectWithTopLeftPoint(double a1, double a2, double a3)
{
  return a3;
}

double VKMRectWithBottomLeftPoint(double a1, double a2, double a3)
{
  return a3;
}

double VKMAspectRatio(double a1, double a2)
{
  double result = a1 / a2;
  if (a2 == 0.0) {
    return 0.0;
  }
  return result;
}

double VKMSizeWithAspectRatio(int a1, double result, double a3, double a4, double a5)
{
  BOOL v5 = result == a4 && a3 == a5;
  if (!v5 && a4 != 0.0 && a5 != 0.0 && a4 != 3.40282347e38 && a5 != 3.40282347e38)
  {
    if (a1)
    {
      double v6 = sqrt(a5 * a5 + a4 * a4);
      return a4 / v6 * (a3 * (a5 / v6) + result * (a4 / v6));
    }
    else if (vabdd_f64(result, a4) < 0.01)
    {
      return a3 * a4 / a5;
    }
  }
  return result;
}

double VKMSizeExpandedToMatchAspectRatio(double a1, double a2, double a3, double a4)
{
  BOOL v4 = a1 != a3;
  if (a2 != a4) {
    BOOL v4 = 1;
  }
  BOOL v5 = a3 <= 0.0 || !v4;
  if (v5 || a4 <= 0.0) {
    goto LABEL_12;
  }
  double v6 = a3 / a4;
  if (v6 <= a1 / a2)
  {
    if (v6 < a1 / a2)
    {
      double v7 = a1;
      double v8 = a1 / v6;
      goto LABEL_13;
    }
LABEL_12:
    double v8 = a2;
    double v7 = a1;
    goto LABEL_13;
  }
  double v7 = a2 * v6;
  double v8 = a2;
LABEL_13:
  if (v7 < a1 || v8 < a2) {
    +[VKAssert handleFailedAssertWithCondition:"result.width >= size.width && result.height >= size.height" functionName:"CGSize VKMSizeExpandedToMatchAspectRatio(CGSize, CGSize)" simulateCrash:0 showAlert:0 format:@"VKMSizeExpandedToMatchAspectRatio() actually shrank the size"];
  }
  return v7;
}

double VKMScaleSizeWithinSize(double a1, double a2, double a3, double a4)
{
  if (a1 / a2 < a3 / a4) {
    return a1 * (a4 / a2);
  }
  return a3;
}

double VKMShrinkSizeToFitInSize(double result, double a2, double a3, double a4)
{
  if (result <= a3)
  {
    BOOL v4 = a2 == a4;
    BOOL v5 = a2 < a4;
  }
  else
  {
    BOOL v4 = 0;
    BOOL v5 = 0;
  }
  if (!v5 && !v4)
  {
    if (result / a2 <= a3 / a4)
    {
      if (result / a2 < a3 / a4) {
        return result * (a4 / a2);
      }
      else {
        return a3;
      }
    }
    else
    {
      return a3;
    }
  }
  return result;
}

double VKMFitOrFillSizeInSize(int a1, double a2, double a3, double a4, double a5)
{
  double v5 = a4 / a2;
  double v6 = a5 / a3;
  if (v5 >= v6) {
    double v7 = v5;
  }
  else {
    double v7 = v6;
  }
  if (v5 >= v6) {
    double v5 = v6;
  }
  if (a1) {
    double v5 = v7;
  }
  return a2 * v5;
}

double VKMFitOrFillSizeInRect(int a1, double a2, double a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  double v11 = a6 / a2;
  if (a6 / a2 >= a7 / a3) {
    double v12 = a6 / a2;
  }
  else {
    double v12 = a7 / a3;
  }
  if (a6 / a2 >= a7 / a3) {
    double v11 = a7 / a3;
  }
  if (a1) {
    double v13 = v12;
  }
  else {
    double v13 = v11;
  }
  return VKMCenterRectOverRect(0.0, 0.0, a2 * v13, a3 * v13, a4, a5, a6, a7);
}

void VKMScaleRectAroundPoint(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5, double a6, CGFloat a7)
{
  memset(&v18, 0, sizeof(v18));
  CGAffineTransformMakeTranslation(&v18, -a5, -a6);
  memset(&v17, 0, sizeof(v17));
  CGAffineTransformMakeScale(&v17, a7, a7);
  memset(&v16, 0, sizeof(v16));
  CGAffineTransform t1 = v18;
  CGAffineTransform t2 = v17;
  CGAffineTransformConcat(&v15, &t1, &t2);
  CGAffineTransform t1 = v18;
  CGAffineTransformInvert(&v12, &t1);
  CGAffineTransformConcat(&v16, &v15, &v12);
  CGAffineTransform t1 = v16;
  v19.origin.CGFloat x = a1;
  v19.origin.CGFloat y = a2;
  v19.size.CGFloat width = a3;
  v19.size.CGFloat height = a4;
  CGRectApplyAffineTransform(v19, &t1);
}

void VKMScaledRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  double MidX = CGRectGetMidX(*(CGRect *)&a1);
  v13.origin.CGFloat x = a1;
  v13.origin.CGFloat y = a2;
  v13.size.CGFloat width = a3;
  v13.size.CGFloat height = a4;
  double MidY = CGRectGetMidY(v13);
  VKMScaleRectAroundPoint(a1, a2, a3, a4, MidX, MidY, a5);
}

void VKMVisibleUnscaledRectForNewScale(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5, double a6, CGFloat a7, double a8)
{
  memset(&v19, 0, sizeof(v19));
  CGAffineTransformMakeScale(&v19, a7, a7);
  memset(&v18, 0, sizeof(v18));
  CGAffineTransform v17 = v19;
  CGAffineTransformInvert(&v18, &v17);
  CGAffineTransform v17 = v18;
  v20.origin.CGFloat x = a1;
  v20.origin.CGFloat y = a2;
  v20.size.CGFloat width = a3;
  v20.size.CGFloat height = a4;
  CGRect v21 = CGRectApplyAffineTransform(v20, &v17);
  float64x2_t v14 = vaddq_f64(*(float64x2_t *)&v18.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v18.c, a6), *(float64x2_t *)&v18.a, a5));
  VKMScaleRectAroundPoint(v21.origin.x, v21.origin.y, v21.size.width, v21.size.height, v14.f64[0], v14.f64[1], a7 / a8);
}

double VKMRectWithInverseNormalizedRect(double a1, double a2, double a3)
{
  return -a1 / a3;
}

double VKMRectByExpandingBoundingRectToContentRect(double a1, double a2, double a3, double a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8, double a9, double a10, double a11, double a12)
{
  double v25 = a1 + a5 * a3;
  v36.origin.CGFloat x = a5;
  v36.origin.CGFloat y = a6;
  v36.size.CGFloat width = a7;
  v36.size.CGFloat height = a8;
  double MaxX = CGRectGetMaxX(v36);
  v37.origin.CGFloat x = a5;
  v37.origin.CGFloat y = a6;
  v37.size.CGFloat width = a7;
  v37.size.CGFloat height = a8;
  CGRectGetMaxY(v37);
  double v26 = a1 + MaxX * a3;
  if (v25 >= v26) {
    double v27 = a1 + MaxX * a3;
  }
  else {
    double v27 = v25;
  }
  if (v25 >= v26) {
    double v26 = v25;
  }
  double v35 = v27;
  double v28 = v26 - v27;
  double v29 = -a9 / a11 * (v26 - v27);
  v38.origin.CGFloat x = -a9 / a11;
  v38.origin.CGFloat y = -a10 / a12;
  v38.size.CGFloat width = 1.0 / a11;
  v38.size.CGFloat height = 1.0 / a12;
  double v30 = CGRectGetMaxX(v38);
  v39.origin.CGFloat x = -a9 / a11;
  v39.origin.CGFloat y = -a10 / a12;
  v39.size.CGFloat width = 1.0 / a11;
  v39.size.CGFloat height = 1.0 / a12;
  CGRectGetMaxY(v39);
  if (v29 >= v30 * v28) {
    double v31 = v30 * v28;
  }
  else {
    double v31 = v29;
  }
  return v35 + v31;
}

double VKMClampRectToRect(double a1, double a2, CGFloat a3, CGFloat a4, double a5, double a6, double a7, double a8)
{
  double v23 = a5 + a7;
  double v15 = VKMClamp(a1, a5, a5 + a7);
  double v21 = a6;
  double v22 = a6 + a8;
  VKMClamp(a2, a6, a6 + a8);
  v24.origin.CGFloat x = a1;
  v24.origin.CGFloat y = a2;
  v24.size.CGFloat width = a3;
  v24.size.CGFloat height = a4;
  double MaxX = CGRectGetMaxX(v24);
  v25.origin.CGFloat x = a1;
  v25.origin.CGFloat y = a2;
  v25.size.CGFloat width = a3;
  v25.size.CGFloat height = a4;
  double MaxY = CGRectGetMaxY(v25);
  double v18 = VKMClamp(MaxX, a5, v23);
  VKMClamp(MaxY, v21, v22);
  if (v15 >= v18) {
    return v18;
  }
  else {
    return v15;
  }
}

double VKMAliasRound(double a1)
{
  double v1 = floor(a1);
  double v2 = a1 - v1;
  double result = ceil(a1);
  if (v2 < 0.49) {
    return v1;
  }
  return result;
}

double VKMAliasRoundedPoint(double a1)
{
  double v1 = floor(a1);
  double v2 = a1 - v1;
  double result = ceil(a1);
  if (v2 < 0.49) {
    return v1;
  }
  return result;
}

double VKMRoundForScale(double a1, double a2)
{
  return VKMRound(a1 * a2) / a2;
}

double VKMRoundedPoint(double a1, double a2)
{
  double v3 = VKMRound(a1);
  VKMRound(a2);
  return v3;
}

double VKMRoundedPointForScale(double a1, double a2, double a3)
{
  double v4 = a2 * a3;
  double v5 = VKMRound(a1 * a3);
  VKMRound(v4);
  return 1.0 / a3 * v5;
}

double VKMCeilSize(double a1)
{
  return ceil(a1);
}

double VKMRoundedRect(double a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  return VKMRectForScale(1, a1, a2, a3, a4, 1.0);
}

double VKMRectForScale(int a1, double a2, CGFloat a3, CGFloat a4, CGFloat a5, double a6)
{
  double v9 = a2;
  if (a6 == 0.0)
  {
    +[VKAssert handleFailedAssertWithCondition:"__objc_no" functionName:"CGRect VKMRectForScale(CGRect, CGFloat, BOOL)" simulateCrash:0 showAlert:0 format:@"cannot give scale = 0 for VKMRoundedRectForScale!"];
  }
  else if (!CGRectIsNull(*(CGRect *)&a2))
  {
    v25.origin.CGFloat x = VKMMultiplyRectScalar(v9, a3, a4, a5, a6);
    CGFloat x = v25.origin.x;
    CGFloat y = v25.origin.y;
    CGFloat width = v25.size.width;
    CGFloat height = v25.size.height;
    double MinX = CGRectGetMinX(v25);
    double v17 = MinX;
    if (a1)
    {
      double v17 = VKMRound(MinX);
      v26.origin.CGFloat x = x;
      v26.origin.CGFloat y = y;
      v26.size.CGFloat width = width;
      v26.size.CGFloat height = height;
      double MinY = CGRectGetMinY(v26);
      double v19 = VKMRound(MinY);
      v27.origin.CGFloat x = x;
      v27.origin.CGFloat y = y;
      v27.size.CGFloat width = width;
      v27.size.CGFloat height = height;
      double MaxX = CGRectGetMaxX(v27);
      double v21 = VKMRound(MaxX) - v17;
      v28.origin.CGFloat x = x;
      v28.origin.CGFloat y = y;
      v28.size.CGFloat width = width;
      v28.size.CGFloat height = height;
      double MaxY = CGRectGetMaxY(v28);
      double v23 = VKMRound(MaxY);
    }
    else
    {
      v29.origin.CGFloat x = x;
      v29.origin.CGFloat y = y;
      v29.size.CGFloat width = width;
      v29.size.CGFloat height = height;
      double v19 = CGRectGetMinY(v29);
      v30.origin.CGFloat x = x;
      v30.origin.CGFloat y = y;
      v30.size.CGFloat width = width;
      v30.size.CGFloat height = height;
      double v21 = CGRectGetMaxX(v30) - v17;
      v31.origin.CGFloat x = x;
      v31.origin.CGFloat y = y;
      v31.size.CGFloat width = width;
      v31.size.CGFloat height = height;
      double v23 = CGRectGetMaxY(v31);
    }
    return VKMMultiplyRectScalar(v17, v19, v21, v23 - v19, 1.0 / a6);
  }
  return v9;
}

double VKMAliasRoundedRectForScale(double a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5)
{
  double v8 = a1;
  if (a5 == 0.0)
  {
    +[VKAssert handleFailedAssertWithCondition:"__objc_no" functionName:"CGRect VKMAliasRoundedRectForScale(CGRect, CGFloat)" simulateCrash:0 showAlert:0 format:@"cannot give scale = 0 for VKMRoundedRectForScale!"];
  }
  else if (!CGRectIsNull(*(CGRect *)&a1))
  {
    v34.origin.CGFloat x = VKMMultiplyRectScalar(v8, a2, a3, a4, a5);
    CGFloat x = v34.origin.x;
    CGFloat y = v34.origin.y;
    CGFloat width = v34.size.width;
    CGFloat height = v34.size.height;
    double MinX = CGRectGetMinX(v34);
    double v15 = floor(MinX);
    double v16 = MinX - v15;
    double v17 = ceil(MinX);
    if (v16 >= 0.49) {
      double v18 = v17;
    }
    else {
      double v18 = v15;
    }
    v35.origin.CGFloat x = x;
    v35.origin.CGFloat y = y;
    v35.size.CGFloat width = width;
    v35.size.CGFloat height = height;
    double MinY = CGRectGetMinY(v35);
    double v20 = floor(MinY);
    double v21 = MinY - v20;
    double v22 = ceil(MinY);
    if (v21 >= 0.49) {
      CGFloat v23 = v22;
    }
    else {
      CGFloat v23 = v20;
    }
    v36.origin.CGFloat x = x;
    v36.origin.CGFloat y = y;
    v36.size.CGFloat width = width;
    v36.size.CGFloat height = height;
    double MaxX = CGRectGetMaxX(v36);
    double v25 = floor(MaxX);
    double v26 = MaxX - v25;
    double v27 = ceil(MaxX);
    if (v26 < 0.49) {
      double v27 = v25;
    }
    double v33 = v27 - v18;
    v37.origin.CGFloat x = x;
    v37.origin.CGFloat y = y;
    v37.size.CGFloat width = width;
    v37.size.CGFloat height = height;
    double MaxY = CGRectGetMaxY(v37);
    double v29 = floor(MaxY);
    double v30 = MaxY - v29;
    double v31 = ceil(MaxY);
    if (v30 < 0.49) {
      double v31 = v29;
    }
    return VKMMultiplyRectScalar(v18, v23, v33, v31 - v23, 1.0 / a5);
  }
  return v8;
}

double VKMRoundedMinX(double a1, double a2, double a3, double a4)
{
  double MinX = CGRectGetMinX(*(CGRect *)&a1);
  return VKMRound(MinX);
}

double VKMRoundedMidX(double a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  double v8 = VKMRound(a1);
  v13.origin.CGFloat x = a1;
  v13.origin.CGFloat y = a2;
  v13.size.CGFloat width = a3;
  v13.size.CGFloat height = a4;
  double MaxX = CGRectGetMaxX(v13);
  double v10 = (v8 + VKMRound(MaxX)) * 0.5;
  return VKMRound(v10);
}

double VKMRoundedMaxX(double a1, double a2, double a3, double a4)
{
  double MaxX = CGRectGetMaxX(*(CGRect *)&a1);
  return VKMRound(MaxX);
}

double VKMRoundedMinY(double a1, double a2, double a3, double a4)
{
  double MinY = CGRectGetMinY(*(CGRect *)&a1);
  return VKMRound(MinY);
}

double VKMRoundedMidY(CGFloat a1, double a2, CGFloat a3, CGFloat a4)
{
  double v8 = VKMRound(a2);
  v13.origin.CGFloat x = a1;
  v13.origin.CGFloat y = a2;
  v13.size.CGFloat width = a3;
  v13.size.CGFloat height = a4;
  double MaxY = CGRectGetMaxY(v13);
  double v10 = (v8 + VKMRound(MaxY)) * 0.5;
  return VKMRound(v10);
}

double VKMRoundedMaxY(double a1, double a2, double a3, double a4)
{
  double MaxY = CGRectGetMaxY(*(CGRect *)&a1);
  return VKMRound(MaxY);
}

BOOL VKMPointIsFinite(double a1, double a2)
{
  BOOL v2 = fabs(a1) != INFINITY;
  return fabs(a2) != INFINITY && v2;
}

uint64_t VKMPointHasNaNComponents()
{
  return 0;
}

uint64_t VKMPointHasInfComponents(double a1, double a2)
{
  BOOL v2 = fabs(a1) == INFINITY;
  return fabs(a2) == INFINITY || v2;
}

BOOL VKMSizeIsFinite(double a1, double a2)
{
  BOOL v2 = fabs(a2) != INFINITY;
  return fabs(a1) != INFINITY && v2;
}

uint64_t VKMRectHasNaNComponents()
{
  return 0;
}

uint64_t VKMTransformHasNaNComponents()
{
  return 0;
}

double VKMSizeGetMaxDimension(double result, double a2)
{
  if (result < a2) {
    return a2;
  }
  return result;
}

double VKMClampSizeToMaxLength(double result, double a2, double a3)
{
  if (result >= a2) {
    double v3 = result;
  }
  else {
    double v3 = a2;
  }
  if (v3 > 0.0 && v3 > a3) {
    return result * (a3 / v3);
  }
  return result;
}

uint64_t VKMRectHasInfComponents(double a1, double a2, double a3, double a4)
{
  double v4 = fabs(a3);
  if (fabs(a4) == INFINITY || v4 == INFINITY) {
    return 1;
  }
  BOOL v7 = fabs(a1) == INFINITY;
  return fabs(a2) == INFINITY || v7;
}

double VKMSanitizeRect(double result)
{
  double v1 = fabs(result);
  if (v1 >= INFINITY) {
    double v2 = 0.0;
  }
  else {
    double v2 = result;
  }
  if (v1 <= INFINITY) {
    return v2;
  }
  return result;
}

double VKMSanitizePoint(double result)
{
  double v1 = fabs(result);
  if (v1 >= INFINITY) {
    double v2 = 0.0;
  }
  else {
    double v2 = result;
  }
  if (v1 <= INFINITY) {
    return v2;
  }
  return result;
}

double VKMVertexCentroidOfQuad(double a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  return (a1 + a3 + a5 + a7) * 0.25;
}

BOOL VKMIntersectsLine(void *a1, void *a2, uint64_t a3)
{
  id v5 = a1;
  id v6 = a2;
  [v5 a];
  double v8 = v7;
  [v6 a];
  double v10 = v8 - v9;
  if (v8 - v9 == 0.0)
  {
    *(_OWORD *)a3 = *MEMORY[0x1E4F1DAD8];
  }
  else
  {
    [v6 b];
    double v12 = v11;
    [v5 b];
    double v14 = (v12 - v13) / v10;
    [v5 a];
    double v16 = v15;
    [v5 b];
    *(double *)a3 = v14;
    *(double *)(a3 + 8) = v17 + v16 * v14;
  }

  return v10 != 0.0;
}

void sub_1DB2CC540(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8(uint64_t a1)
{
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1DB2CEEB0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9(uint64_t a1)
{
}

{
}

void sub_1DB2CFCA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getDDUIActionClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("DDUIAction");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getDDUIActionClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getDDUIActionClass_block_invoke_cold_1();
    DataDetectorsUILibrary_1();
  }
}

void DataDetectorsUILibrary_1()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!DataDetectorsUILibraryCore_frameworkLibrary_1)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __DataDetectorsUILibraryCore_block_invoke_1;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E6BF2A78;
    uint64_t v3 = 0;
    DataDetectorsUILibraryCore_frameworkLibrary_1 = _sl_dlopen();
  }
  uint64_t v0 = (void *)v1[0];
  if (!DataDetectorsUILibraryCore_frameworkLibrary_1)
  {
    uint64_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __DataDetectorsUILibraryCore_block_invoke_1()
{
  uint64_t result = _sl_dlopen();
  DataDetectorsUILibraryCore_frameworkLibrary_1 = result;
  return result;
}

Class __getDDContextMenuActionClass_block_invoke(uint64_t a1)
{
  DataDetectorsUILibrary_1();
  Class result = objc_getClass("DDContextMenuAction");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getDDContextMenuActionClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getDDContextMenuActionClass_block_invoke_cold_1();
    return (Class)-[UIViewController(Utilities) vk_viewIfLoaded](v3);
  }
  return result;
}

void sub_1DB2D33B8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

id getDDContextMenuActionClass()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getDDContextMenuActionClass_softClass_0;
  uint64_t v7 = getDDContextMenuActionClass_softClass_0;
  if (!getDDContextMenuActionClass_softClass_0)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    double v3[2] = __getDDContextMenuActionClass_block_invoke_0;
    v3[3] = &unk_1E6BF0A90;
    v3[4] = &v4;
    __getDDContextMenuActionClass_block_invoke_0((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1DB2D3528(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB2D424C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getDDContextMenuActionClass_block_invoke_0(uint64_t a1)
{
  DataDetectorsUILibrary_2();
  Class result = objc_getClass("DDContextMenuAction");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getDDContextMenuActionClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getDDContextMenuActionClass_block_invoke_cold_1();
    return (Class)DataDetectorsUILibrary_2();
  }
  return result;
}

uint64_t DataDetectorsUILibrary_2()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!DataDetectorsUILibraryCore_frameworkLibrary_2)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    double v3[2] = 3221225472;
    v3[3] = __DataDetectorsUILibraryCore_block_invoke_2;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E6BF2CC0;
    uint64_t v5 = 0;
    DataDetectorsUILibraryCore_frameworkLibrary_2 = _sl_dlopen();
  }
  uint64_t v0 = DataDetectorsUILibraryCore_frameworkLibrary_2;
  id v1 = (void *)v3[0];
  if (!DataDetectorsUILibraryCore_frameworkLibrary_2)
  {
    id v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __DataDetectorsUILibraryCore_block_invoke_2()
{
  uint64_t result = _sl_dlopen();
  DataDetectorsUILibraryCore_frameworkLibrary_2 = result;
  return result;
}

void *__getkDataDetectorsAllResultsKeySymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)DataDetectorsUILibrary_2();
  uint64_t result = dlsym(v2, "kDataDetectorsAllResultsKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkDataDetectorsAllResultsKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkDDHighlighterKeySymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)DataDetectorsUILibrary_2();
  uint64_t result = dlsym(v2, "kDDHighlighterKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkDDHighlighterKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getDDUIActionClass_block_invoke_0(uint64_t a1)
{
  DataDetectorsUILibrary_2();
  Class result = objc_getClass("DDUIAction");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getDDUIActionClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getDDUIActionClass_block_invoke_cold_1();
    return (Class)VKCRectFromNormalizedSubrect(v3);
  }
  return result;
}

void sub_1DB2D4844(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DB2D4980(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB2D4B84(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1DB2D4FC0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DB2D507C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DB2D5F38(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 128));
  _Unwind_Resume(a1);
}

void sub_1DB2D6834(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

void sub_1DB2D6AE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
}

void sub_1DB2D7250(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_1DB2D8398(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB2D85A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10(uint64_t a1)
{
}

void sub_1DB2D9DB0(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

double VKMRound(double a1)
{
  return round(a1);
}

double VKMFractionalPart(double a1)
{
  BOOL v1 = a1 <= 0.0;
  double v2 = -(-a1 - floor(-a1));
  double result = a1 - floor(a1);
  if (v1) {
    return v2;
  }
  return result;
}

double VKMClamp(double a1, double a2, double a3)
{
  if (a1 >= a2)
  {
    a2 = a1;
    if (a1 > a3) {
      return a3;
    }
  }
  return a2;
}

uint64_t VKMClampInt(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 >= a3) {
    uint64_t v3 = a3;
  }
  else {
    uint64_t v3 = a1;
  }
  if (a1 >= a2) {
    return v3;
  }
  else {
    return a2;
  }
}

uint64_t VKMClampRange(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a1 + a2;
  if (a1 >= a3 + a4) {
    unint64_t v5 = a3 + a4;
  }
  else {
    unint64_t v5 = a1;
  }
  if (a1 < a3) {
    unint64_t v5 = a3;
  }
  if (v4 >= a3 + a4) {
    unint64_t v6 = a3 + a4;
  }
  else {
    unint64_t v6 = a1 + a2;
  }
  if (v4 >= a3) {
    unint64_t v7 = v6;
  }
  else {
    unint64_t v7 = a3;
  }
  if (v5 >= v7) {
    unint64_t v8 = v7;
  }
  else {
    unint64_t v8 = v5;
  }
  if (a1 == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v8 = a3 + a4;
  }
  if (a3 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    return v8;
  }
}

BOOL VKMRangeContainsIndex(unint64_t a1, uint64_t a2, unint64_t a3)
{
  BOOL v3 = a1 + a2 >= a3;
  if (!a2) {
    BOOL v3 = 0;
  }
  BOOL v4 = a1 != 0x7FFFFFFFFFFFFFFFLL && v3;
  return a1 <= a3 && v4;
}

BOOL VKMRangeEnclosesRange(NSRange range2, NSRange range1)
{
  if (range2.location == 0x7FFFFFFFFFFFFFFFLL || range1.location == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  NSUInteger length = range1.length;
  range1.NSUInteger length = range2.length;
  NSUInteger location = range2.location;
  if (length)
  {
    v7.NSUInteger location = range1.location;
    v7.NSUInteger length = length;
    range1.NSUInteger location = location;
    return NSIntersectionRange(v7, range1).length == length;
  }
  else
  {
    BOOL v6 = range1.location <= range2.location + range2.length;
    if (range1.location < range2.location) {
      BOOL v6 = 0;
    }
    if (range2.length) {
      return v6;
    }
    else {
      return range2.location == range1.location;
    }
  }
}

double VKMMix(double a1, double a2, double a3)
{
  return a1 + (a2 - a1) * a3;
}

double VKMRandom()
{
  return (double)random() / 2147483650.0;
}

double VKMRandomBetween(double a1, double a2)
{
  return a1 + (a2 - a1) * ((double)random() / 2147483650.0);
}

double VKMReverseSquare(double a1)
{
  return 1.0 - (1.0 - a1) * (1.0 - a1);
}

long double VKMSineMap(double a1)
{
  return (sin(a1 * 3.14159265 + -1.57079633) + 1.0) * 0.5;
}

id getDDContextMenuActionClass_0()
{
  uint64_t v4 = 0;
  unint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getDDContextMenuActionClass_softClass_1;
  uint64_t v7 = getDDContextMenuActionClass_softClass_1;
  if (!getDDContextMenuActionClass_softClass_1)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    double v3[2] = __getDDContextMenuActionClass_block_invoke_1;
    v3[3] = &unk_1E6BF0A90;
    v3[4] = &v4;
    __getDDContextMenuActionClass_block_invoke_1((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1DB2DBFFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB2DCE8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getkDataDetectorsAllResultsKeySymbolLoc_block_invoke_0(uint64_t a1)
{
  double v2 = (void *)DataDetectorsUILibrary_3();
  double result = dlsym(v2, "kDataDetectorsAllResultsKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkDataDetectorsAllResultsKeySymbolLoc_ptr_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t DataDetectorsUILibrary_3()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!DataDetectorsUILibraryCore_frameworkLibrary_3)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    double v3[2] = 3221225472;
    v3[3] = __DataDetectorsUILibraryCore_block_invoke_3;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E6BF3038;
    uint64_t v5 = 0;
    DataDetectorsUILibraryCore_frameworkLibrary_3 = _sl_dlopen();
  }
  uint64_t v0 = DataDetectorsUILibraryCore_frameworkLibrary_3;
  id v1 = (void *)v3[0];
  if (!DataDetectorsUILibraryCore_frameworkLibrary_3)
  {
    id v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __DataDetectorsUILibraryCore_block_invoke_3()
{
  uint64_t result = _sl_dlopen();
  DataDetectorsUILibraryCore_frameworkLibrary_3 = result;
  return result;
}

void *__getkDDHighlighterKeySymbolLoc_block_invoke_0(uint64_t a1)
{
  double v2 = (void *)DataDetectorsUILibrary_3();
  uint64_t result = dlsym(v2, "kDDHighlighterKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkDDHighlighterKeySymbolLoc_ptr_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkDataDetectorsMiddleTextSymbolLoc_block_invoke(uint64_t a1)
{
  double v2 = (void *)DataDetectorsUILibrary_3();
  uint64_t result = dlsym(v2, "kDataDetectorsMiddleText");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkDataDetectorsMiddleTextSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getDDContextMenuActionClass_block_invoke_1(uint64_t a1)
{
  DataDetectorsUILibrary_3();
  Class result = objc_getClass("DDContextMenuAction");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getDDContextMenuActionClass_softClass_1 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getDDContextMenuActionClass_block_invoke_cold_1();
    return (Class)__getDDContextMenuConfigurationClass_block_invoke(v3);
  }
  return result;
}

VKKeyboardCameraInsertButton *__getDDContextMenuConfigurationClass_block_invoke(uint64_t a1)
{
  DataDetectorsUILibrary_3();
  Class result = (VKKeyboardCameraInsertButton *)objc_getClass("DDContextMenuConfiguration");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getDDContextMenuConfigurationClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getDDContextMenuConfigurationClass_block_invoke_cold_1();
    return [(VKKeyboardCameraInsertButton *)v3 initWithPrimaryAction:v5];
  }
  return result;
}

void sub_1DB2DE484(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

double _SizeFromVKResolutionPreset(uint64_t a1)
{
  double v1 = 640.0;
  switch(a1)
  {
    case 2:
      return v1;
    case 3:
      *(double *)&uint64_t v2 = 960.0;
      goto LABEL_7;
    case 4:
      *(double *)&uint64_t v2 = 1280.0;
      goto LABEL_7;
    case 5:
      *(double *)&uint64_t v2 = 1920.0;
      goto LABEL_7;
    case 6:
      *(double *)&uint64_t v2 = 3840.0;
LABEL_7:
      double v1 = *(double *)&v2;
      break;
    default:
      uint64_t v3 = [MEMORY[0x1E4F42D90] mainScreen];
      [v3 bounds];
      double v1 = v4;

      break;
  }
  return v1;
}

void sub_1DB2DF068(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
}

void sub_1DB2DF2FC(void *a1)
{
}

void sub_1DB2DF7A0(void *a1)
{
}

void _MinFrameDurationFromVKFrameRatePreset(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  id v5 = _SlowestMaxFrameRateRange(a2);
  uint64_t v6 = v5;
  *(void *)(a3 + 8) = 0;
  *(void *)(a3 + 16) = 0;
  *(void *)a3 = 0;
  if (v5) {
    [v5 minFrameDuration];
  }
  if (a1 == 1)
  {
    CMTimeMake(&v8, 1, 30);
    CMTime time1 = *(CMTime *)a3;
    if (CMTimeCompare(&time1, &v8) <= 0)
    {
      int32_t v7 = 30;
      goto LABEL_9;
    }
  }
  else if (a1 == 2)
  {
    CMTimeMake(&time2, 1, 60);
    CMTime time1 = *(CMTime *)a3;
    if (CMTimeCompare(&time1, &time2) <= 0)
    {
      int32_t v7 = 60;
LABEL_9:
      CMTimeMake(&time1, 1, v7);
      *(CMTime *)a3 = time1;
    }
  }
}

id _SlowestMaxFrameRateRange(void *a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v2 = objc_msgSend(v1, "videoSupportedFrameRateRanges", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = 0;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v2);
        }
        CMTime v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (v5)
        {
          [*(id *)(*((void *)&v14 + 1) + 8 * i) maxFrameRate];
          double v10 = v9;
          [v5 maxFrameRate];
          if (v10 >= v11) {
            continue;
          }
        }
        id v12 = v8;

        id v5 = v12;
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v4);
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

void _MaxFrameDurationFromVKFrameRatePreset(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  id v5 = _SlowestMaxFrameRateRange(a2);
  uint64_t v6 = v5;
  *(void *)(a3 + 8) = 0;
  *(void *)(a3 + 16) = 0;
  *(void *)a3 = 0;
  if (v5) {
    [v5 maxFrameDuration];
  }
  if (a1 == 1)
  {
    CMTimeMake(&time2, 1, 1);
    CMTime time1 = *(CMTime *)a3;
    p_CMTime time2 = &time2;
  }
  else
  {
    if (a1 != 2) {
      goto LABEL_9;
    }
    CMTimeMake(&v10, 1, 1);
    CMTime time1 = *(CMTime *)a3;
    p_CMTime time2 = &v10;
  }
  if ((CMTimeCompare(&time1, p_time2) & 0x80000000) == 0)
  {
    CMTimeMake(&time1, 1, 1);
    *(CMTime *)a3 = time1;
  }
LABEL_9:
}

uint64_t __Block_byref_object_copy__11(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__11(uint64_t a1)
{
}

void OUTLINED_FUNCTION_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id _VKSignpostLog()
{
  if (_VKSignpostLog_onceToken != -1) {
    dispatch_once(&_VKSignpostLog_onceToken, &__block_literal_global_27);
  }
  uint64_t v0 = (void *)_VKSignpostLog____VKSignpostLog;
  return v0;
}

uint64_t OUTLINED_FUNCTION_1_3(uint64_t a1, uint64_t a2)
{
  return a2;
}

void OUTLINED_FUNCTION_2(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_error_impl(a1, v4, OS_LOG_TYPE_ERROR, a4, v5, 0xCu);
}

void OUTLINED_FUNCTION_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1DB2E4210(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1DB2E4590(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DB2E48B8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1DB2E5AF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 160), 8);
  _Block_object_dispose((const void *)(v31 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1DB2EAF5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__12(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__12(uint64_t a1)
{
}

void sub_1DB2EC4AC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1DB2EF5C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

uint64_t __Block_byref_object_copy__13(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__13(uint64_t a1)
{
}

Class __getPHPhotoLibraryClass_block_invoke(uint64_t a1)
{
  PhotosLibrary();
  Class result = objc_getClass("PHPhotoLibrary");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getPHPhotoLibraryClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getPHPhotoLibraryClass_block_invoke_cold_1();
    return (Class)PhotosLibrary();
  }
  return result;
}

uint64_t PhotosLibrary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!PhotosLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    double v3[2] = 3221225472;
    v3[3] = __PhotosLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E6BF3498;
    uint64_t v5 = 0;
    PhotosLibraryCore_frameworkLibrarCGFloat y = _sl_dlopen();
  }
  uint64_t v0 = PhotosLibraryCore_frameworkLibrary;
  uint64_t v1 = (void *)v3[0];
  if (!PhotosLibraryCore_frameworkLibrary)
  {
    uint64_t v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __PhotosLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  PhotosLibraryCore_frameworkLibrarCGFloat y = result;
  return result;
}

Class __getPHFetchOptionsClass_block_invoke(uint64_t a1)
{
  PhotosLibrary();
  Class result = objc_getClass("PHFetchOptions");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getPHFetchOptionsClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getPHFetchOptionsClass_block_invoke_cold_1();
    return (Class)__getPHAssetClass_block_invoke(v3);
  }
  return result;
}

Class __getPHAssetClass_block_invoke(uint64_t a1)
{
  PhotosLibrary();
  Class result = objc_getClass("PHAsset");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getPHAssetClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getPHAssetClass_block_invoke_cold_1();
    return (Class)__getPHImageRequestOptionsClass_block_invoke(v3);
  }
  return result;
}

Class __getPHImageRequestOptionsClass_block_invoke(uint64_t a1)
{
  PhotosLibrary();
  Class result = objc_getClass("PHImageRequestOptions");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getPHImageRequestOptionsClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getPHImageRequestOptionsClass_block_invoke_cold_1();
    return (Class)__getPHImageManagerClass_block_invoke(v3);
  }
  return result;
}

Class __getPHImageManagerClass_block_invoke(uint64_t a1)
{
  PhotosLibrary();
  Class result = objc_getClass("PHImageManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getPHImageManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getPHImageManagerClass_block_invoke_cold_1();
    return (Class)__getPHImageErrorKeySymbolLoc_block_invoke(v3);
  }
  return result;
}

void *__getPHImageErrorKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)PhotosLibrary();
  Class result = dlsym(v2, "PHImageErrorKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getPHImageErrorKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1DB2F093C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB2F0BAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__14(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__14(uint64_t a1)
{
}

void sub_1DB2F1918(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_1DB2F1B0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB2F4788(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1DB2F480C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1DB2F4968(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DB2F4AFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  uint64_t v19 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__15(__n128 *a1, __n128 *a2)
{
  __n128 result = a2[3];
  a1[3] = result;
  return result;
}

void sub_1DB2F4D38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1DB2F4E80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1DB2F4FD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1DB2F5280(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DB2F5408(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_1DB2F57AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DB2F582C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DB2F58AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DB2F5BD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,void **a28)
{
  ClipperLib::Clipper::~Clipper((ClipperLib::Clipper *)&a28);
  a28 = (void **)(v30 - 72);
  std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100](&a28);

  _Unwind_Resume(a1);
}

void sub_1DB2F5DA0(_Unwind_Exception *exception_object)
{
}

void sub_1DB2F6188(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,void **a54)
{
  ClipperLib::ClipperOffset::~ClipperOffset((ClipperLib::ClipperOffset *)&a16);
  _Block_object_dispose(&a54, 8);
  ClipperLib::Clipper::~Clipper(v55);
  a54 = (void **)(v58 - 152);
  std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100](&a54);

  _Unwind_Resume(a1);
}

void sub_1DB2F6224()
{
}

void sub_1DB2F6274(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__16(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a2 + 48;
  ClipperLib::ClipperBase::ClipperBase((ClipperLib::ClipperBase *)(a1 + 192), (const ClipperLib::ClipperBase *)(a2 + 48 + *(void *)(*(void *)(a2 + 48) - 24)));
  *(void *)(a1 + 48) = &unk_1F3555D08;
  *(void *)(a1 + 56) = 0;
  *(void *)(a1 + 192) = off_1F3555D50;
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = 0;
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(v4 + 8);
  *(void *)(a1 + 72) = *(void *)(v4 + 24);
  *(void *)(v4 + 8) = 0;
  *(void *)(v4 + 16) = 0;
  *(void *)(v4 + 24) = 0;
  *(void *)(a1 + 80) = 0;
  *(void *)(a1 + 88) = 0;
  *(void *)(a1 + 96) = 0;
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(v4 + 32);
  *(void *)(a1 + 96) = *(void *)(v4 + 48);
  *(void *)(v4 + 32) = 0;
  *(void *)(v4 + 40) = 0;
  *(void *)(v4 + 48) = 0;
  *(void *)(a1 + 104) = 0;
  *(void *)(a1 + 112) = 0;
  *(void *)(a1 + 120) = 0;
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(v4 + 56);
  *(void *)(a1 + 120) = *(void *)(v4 + 72);
  *(void *)(v4 + 64) = 0;
  *(void *)(v4 + 72) = 0;
  *(void *)(v4 + 56) = 0;
  *(_DWORD *)(a1 + 128) = *(_DWORD *)(v4 + 80);
  *(void *)(a1 + 136) = a1 + 136;
  *(void *)(a1 + 144) = a1 + 136;
  *(void *)(a1 + 152) = 0;
  std::list<long long>::splice(a1 + 136, (uint64_t *)(a1 + 136), (void *)(v4 + 88));
  __n128 result = *(__n128 *)(a2 + 160);
  long long v6 = *(_OWORD *)(a2 + 176);
  *(__n128 *)(a1 + 160) = result;
  *(_OWORD *)(a1 + 176) = v6;
  return result;
}

void __Block_byref_object_dispose__17(void *a1)
{
  uint64_t v2 = off_1F3555C88;
  *(void *)((char *)a1 + *(v3 - 3) + 48) = v2;
  std::__list_imp<long long>::clear(a1 + 17);
  uint64_t v4 = (void *)a1[13];
  if (v4)
  {
    a1[14] = v4;
    operator delete(v4);
  }
  uint64_t v5 = (void *)a1[10];
  if (v5)
  {
    a1[11] = v5;
    operator delete(v5);
  }
  long long v6 = (void *)a1[7];
  if (v6)
  {
    a1[8] = v6;
    operator delete(v6);
  }
  ClipperLib::ClipperBase::~ClipperBase((ClipperLib::ClipperBase *)(a1 + 24));
}

void sub_1DB2F653C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DB2F6648(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1DB2F6738(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB2F6B7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL VKArcIsClockwiseForAngles(double a1, double a2)
{
  VKMNormalizeAngleInRadians(a2 - a1);
  double v5 = v4;
  VKMNormalizeAngleInRadians(a1 - a2);
  return v5 >= v6;
}

void sub_1DB2F6DEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1DB2F6FF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id a28)
{
  uint64_t v31 = v30;

  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a23, 8);

  _Unwind_Resume(a1);
}

void sub_1DB2F7150(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1DB2F725C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DB2F748C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DB2F75C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DB2F7BBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, void *a20,uint64_t a21,uint64_t a22,void **a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59)
{
  CGRect v67 = v64;

  ClipperLib::Clipper::~Clipper((ClipperLib::Clipper *)&a23);
  a23 = (void **)&a59;
  std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100](&a23);

  a23 = (void **)&STACK[0x220];
  std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100](&a23);
  _Block_object_dispose(&STACK[0x238], 8);
  ClipperLib::ClipperOffset::~ClipperOffset(v62);
  _Block_object_dispose(&STACK[0x370], 8);
  _Block_object_dispose(&STACK[0x390], 8);
  ClipperLib::ClipperOffset::~ClipperOffset(v60);

  _Unwind_Resume(a1);
}

ClipperLib::ClipperOffset *__Block_byref_object_copy__25(uint64_t a1, uint64_t a2)
{
  return ClipperLib::ClipperOffset::ClipperOffset((ClipperLib::ClipperOffset *)(a1 + 48), (const ClipperLib::ClipperOffset *)(a2 + 48));
}

void __Block_byref_object_dispose__26(uint64_t a1)
{
}

void sub_1DB2F7D50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1DB2F7E68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DB2F7FA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v13 = v11;

  _Unwind_Resume(a1);
}

void sub_1DB2F8128(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DB2F8264(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1DB2F8410(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

ClipperLib::ClipperBase *ClipperLib::ClipperBase::ClipperBase(ClipperLib::ClipperBase *this, const ClipperLib::ClipperBase *a2)
{
  uint64_t v4 = *((void *)a2 + 1);
  *(void *)this = &unk_1F3555CA0;
  *((void *)this + 1) = v4;
  *((void *)this + 2) = 0;
  *((void *)this + 3) = 0;
  *((void *)this + 4) = 0;
  std::vector<ClipperLib::LocalMinimum>::__init_with_size[abi:ne180100]<ClipperLib::LocalMinimum*,ClipperLib::LocalMinimum*>((void *)this + 2, *((const void **)a2 + 2), *((void *)a2 + 3), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a2 + 3) - *((void *)a2 + 2)) >> 3));
  char v5 = *((unsigned char *)a2 + 40);
  *((void *)this + 6) = 0;
  *((unsigned char *)this + 40) = v5;
  *((void *)this + 7) = 0;
  *((void *)this + 8) = 0;
  std::vector<ClipperLib::TEdge *>::__init_with_size[abi:ne180100]<ClipperLib::TEdge **,ClipperLib::TEdge **>((void *)this + 6, *((const void **)a2 + 6), *((void *)a2 + 7), (uint64_t)(*((void *)a2 + 7) - *((void *)a2 + 6)) >> 3);
  __int16 v6 = *((_WORD *)a2 + 36);
  *((void *)this + 10) = 0;
  *((_WORD *)this + 36) = v6;
  *((void *)this + 11) = 0;
  *((void *)this + 12) = 0;
  std::vector<ClipperLib::OutRec *>::__init_with_size[abi:ne180100]<ClipperLib::OutRec **,ClipperLib::OutRec **>((void *)this + 10, *((const void **)a2 + 10), *((void *)a2 + 11), (uint64_t)(*((void *)a2 + 11) - *((void *)a2 + 10)) >> 3);
  uint64_t v7 = *((void *)a2 + 13);
  *((void *)this + 14) = 0;
  *((void *)this + 13) = v7;
  *((void *)this + 15) = 0;
  *((void *)this + 16) = 0;
  std::vector<long long>::__init_with_size[abi:ne180100]<long long *,long long *>((void *)this + 14, *((const void **)a2 + 14), *((void *)a2 + 15), (uint64_t)(*((void *)a2 + 15) - *((void *)a2 + 14)) >> 3);
  return this;
}

void sub_1DB2F8548(_Unwind_Exception *exception_object)
{
  __int16 v6 = *v4;
  if (*v4)
  {
    v1[11] = v6;
    operator delete(v6);
  }
  uint64_t v7 = *v3;
  if (*v3)
  {
    v1[7] = v7;
    operator delete(v7);
  }
  CMTime v8 = *v2;
  if (*v2)
  {
    v1[3] = v8;
    operator delete(v8);
  }
  _Unwind_Resume(exception_object);
}

void *std::vector<ClipperLib::LocalMinimum>::__init_with_size[abi:ne180100]<ClipperLib::LocalMinimum*,ClipperLib::LocalMinimum*>(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    __int16 v6 = result;
    __n128 result = std::vector<ClipperLib::IntPoint>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      __n128 result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_1DB2F85F4(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void *std::vector<ClipperLib::TEdge *>::__init_with_size[abi:ne180100]<ClipperLib::TEdge **,ClipperLib::TEdge **>(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    __int16 v6 = result;
    __n128 result = std::vector<ClipperLib::TEdge *>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      __n128 result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_1DB2F8670(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<ClipperLib::TEdge *>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::vector<ClipperLib::IntPoint>::__throw_length_error[abi:ne180100]();
  }
  __n128 result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::PolyNode *>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

void *std::vector<ClipperLib::OutRec *>::__init_with_size[abi:ne180100]<ClipperLib::OutRec **,ClipperLib::OutRec **>(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    __int16 v6 = result;
    __n128 result = std::vector<ClipperLib::TEdge *>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      __n128 result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_1DB2F8730(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void *std::vector<long long>::__init_with_size[abi:ne180100]<long long *,long long *>(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    __int16 v6 = result;
    __n128 result = std::vector<ClipperLib::TEdge *>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      __n128 result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_1DB2F87AC(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

ClipperLib::ClipperOffset *ClipperLib::ClipperOffset::ClipperOffset(ClipperLib::ClipperOffset *this, const ClipperLib::ClipperOffset *a2)
{
  *(_OWORD *)this = *(_OWORD *)a2;
  *((void *)this + 2) = 0;
  *((void *)this + 3) = 0;
  *((void *)this + 4) = 0;
  std::vector<std::vector<ClipperLib::IntPoint>>::__init_with_size[abi:ne180100]<std::vector<ClipperLib::IntPoint>*,std::vector<ClipperLib::IntPoint>*>((void *)this + 2, *((void *)a2 + 2), *((void *)a2 + 3), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a2 + 3) - *((void *)a2 + 2)) >> 3));
  *((void *)this + 5) = 0;
  *((void *)this + 6) = 0;
  *((void *)this + 7) = 0;
  std::vector<ClipperLib::IntPoint>::__init_with_size[abi:ne180100]<ClipperLib::IntPoint*,ClipperLib::IntPoint*>((void *)this + 5, *((const void **)a2 + 5), *((void *)a2 + 6), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a2 + 6) - *((void *)a2 + 5)) >> 3));
  *((void *)this + 8) = 0;
  *((void *)this + 9) = 0;
  *((void *)this + 10) = 0;
  std::vector<ClipperLib::IntPoint>::__init_with_size[abi:ne180100]<ClipperLib::IntPoint*,ClipperLib::IntPoint*>((void *)this + 8, *((const void **)a2 + 8), *((void *)a2 + 9), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a2 + 9) - *((void *)a2 + 8)) >> 3));
  *((void *)this + 11) = 0;
  *((void *)this + 12) = 0;
  *((void *)this + 13) = 0;
  std::vector<ClipperLib::DoublePoint>::__init_with_size[abi:ne180100]<ClipperLib::DoublePoint*,ClipperLib::DoublePoint*>((void *)this + 11, *((const void **)a2 + 11), *((void *)a2 + 12), (uint64_t)(*((void *)a2 + 12) - *((void *)a2 + 11)) >> 4);
  long long v4 = *((_OWORD *)a2 + 9);
  long long v5 = *((_OWORD *)a2 + 10);
  uint64_t v6 = *((void *)a2 + 22);
  long long v8 = *((_OWORD *)a2 + 7);
  long long v7 = *((_OWORD *)a2 + 8);
  *((void *)this + 24) = 0;
  *((_OWORD *)this + 9) = v4;
  *((_OWORD *)this + 10) = v5;
  *((_OWORD *)this + 7) = v8;
  *((_OWORD *)this + 8) = v7;
  *((void *)this + 22) = v6;
  *((void *)this + 23) = &unk_1F3555D88;
  *((void *)this + 25) = 0;
  *((void *)this + 26) = 0;
  std::vector<ClipperLib::IntPoint>::__init_with_size[abi:ne180100]<ClipperLib::IntPoint*,ClipperLib::IntPoint*>((void *)this + 24, *((const void **)a2 + 24), *((void *)a2 + 25), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a2 + 25) - *((void *)a2 + 24)) >> 3));
  *((void *)this + 27) = 0;
  *((void *)this + 28) = 0;
  *((void *)this + 29) = 0;
  std::vector<ClipperLib::PolyNode *>::__init_with_size[abi:ne180100]<ClipperLib::PolyNode **,ClipperLib::PolyNode **>((void *)this + 27, *((const void **)a2 + 27), *((void *)a2 + 28), (uint64_t)(*((void *)a2 + 28) - *((void *)a2 + 27)) >> 3);
  long long v9 = *((_OWORD *)a2 + 15);
  *((void *)this + 32) = *((void *)a2 + 32);
  *((_OWORD *)this + 15) = v9;
  return this;
}

void sub_1DB2F893C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  long long v8 = *v6;
  if (*v6)
  {
    v2[25] = v8;
    operator delete(v8);
  }
  long long v9 = *v5;
  if (*v5)
  {
    v2[12] = v9;
    operator delete(v9);
  }
  uint64_t v10 = *v4;
  if (*v4)
  {
    v2[9] = v10;
    operator delete(v10);
  }
  uint64_t v11 = *v3;
  if (*v3)
  {
    v2[6] = v11;
    operator delete(v11);
  }
  std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  _Unwind_Resume(a1);
}

void *std::vector<std::vector<ClipperLib::IntPoint>>::__init_with_size[abi:ne180100]<std::vector<ClipperLib::IntPoint>*,std::vector<ClipperLib::IntPoint>*>(void *result, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    std::vector<ClipperLib::IntPoint>::__vallocate[abi:ne180100](result, a4);
    __n128 result = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::vector<ClipperLib::IntPoint>>,std::vector<ClipperLib::IntPoint>*,std::vector<ClipperLib::IntPoint>*,std::vector<ClipperLib::IntPoint>*>((uint64_t)(v6 + 2), a2, a3, (void *)v6[1]);
    v6[1] = result;
  }
  return result;
}

void sub_1DB2F8A1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  *(void *)(v9 + 8) = v10;
  std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

void *std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::vector<ClipperLib::IntPoint>>,std::vector<ClipperLib::IntPoint>*,std::vector<ClipperLib::IntPoint>*,std::vector<ClipperLib::IntPoint>*>(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  long long v4 = a4;
  uint64_t v10 = a4;
  uint64_t v11 = a4;
  v8[0] = a1;
  v8[1] = &v10;
  _OWORD v8[2] = &v11;
  char v9 = 0;
  if (a2 != a3)
  {
    uint64_t v6 = a2;
    do
    {
      void *v4 = 0;
      v4[1] = 0;
      v4[2] = 0;
      std::vector<ClipperLib::IntPoint>::__init_with_size[abi:ne180100]<ClipperLib::IntPoint*,ClipperLib::IntPoint*>(v4, *(const void **)v6, *(void *)(v6 + 8), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(v6 + 8) - *(void *)v6) >> 3));
      long long v4 = v11 + 3;
      v11 += 3;
      v6 += 24;
    }
    while (v6 != a3);
  }
  char v9 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<ClipperLib::IntPoint>>,std::vector<ClipperLib::IntPoint>*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v8);
  return v4;
}

void sub_1DB2F8AE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<ClipperLib::IntPoint>>,std::vector<ClipperLib::IntPoint>*>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<ClipperLib::IntPoint>>,std::vector<ClipperLib::IntPoint>*>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<ClipperLib::IntPoint>>,std::vector<ClipperLib::IntPoint>*>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = **(void **)(a1 + 16);
  uint64_t v2 = **(void **)(a1 + 8);
  if (v1 != v2)
  {
    uint64_t v3 = **(void **)(a1 + 16);
    do
    {
      long long v5 = *(void **)(v3 - 24);
      v3 -= 24;
      long long v4 = v5;
      if (v5)
      {
        *(void *)(v1 - 16) = v4;
        operator delete(v4);
      }
      uint64_t v1 = v3;
    }
    while (v3 != v2);
  }
}

void *std::vector<ClipperLib::DoublePoint>::__init_with_size[abi:ne180100]<ClipperLib::DoublePoint*,ClipperLib::DoublePoint*>(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    __n128 result = std::vector<ClipperLib::DoublePoint>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      __n128 result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_1DB2F8BE4(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<ClipperLib::DoublePoint>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 60) {
    std::vector<ClipperLib::IntPoint>::__throw_length_error[abi:ne180100]();
  }
  __n128 result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::DoublePoint>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[16 * v4];
  return result;
}

void *std::vector<ClipperLib::PolyNode *>::__init_with_size[abi:ne180100]<ClipperLib::PolyNode **,ClipperLib::PolyNode **>(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    __n128 result = std::vector<ClipperLib::TEdge *>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      __n128 result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_1DB2F8CA4(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void *std::vector<std::vector<ClipperLib::IntPoint>>::vector(void *a1, unint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<ClipperLib::IntPoint>::__vallocate[abi:ne180100](a1, a2);
    uint64_t v4 = (char *)a1[1];
    size_t v5 = 24 * ((24 * a2 - 24) / 0x18) + 24;
    bzero(v4, v5);
    a1[1] = &v4[v5];
  }
  return a1;
}

void sub_1DB2F8D50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
}

id VKStringFromCGColor(CGColor *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1CA48] array];
  ColorSpace = CGColorGetColorSpace(a1);
  uint64_t v4 = (__CFString *)CGColorSpaceCopyName(ColorSpace);
  if (v4)
  {
    [v2 addObject:v4];
    size_t NumberOfComponents = CGColorGetNumberOfComponents(a1);
    Components = CGColorGetComponents(a1);
    if (NumberOfComponents)
    {
      uint64_t v7 = Components;
      do
      {
        uint64_t v8 = *(void *)v7++;
        char v9 = objc_msgSend(NSString, "stringWithFormat:", @"%.10f", v8);
        [v2 addObject:v9];

        --NumberOfComponents;
      }
      while (NumberOfComponents);
    }
  }
  else
  {
    uint64_t v10 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      VKStringFromCGColor_cold_1();
    }
  }
  if ([v2 count])
  {
    uint64_t v11 = [v2 componentsJoinedByString:@";"];
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

CGColorRef VKCGColorCreateWithString(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 componentsSeparatedByString:@";"];
  uint64_t v3 = (void *)[v2 mutableCopy];

  if ([v3 count])
  {
    uint64_t v4 = [v3 firstObject];
    [v3 removeObjectAtIndex:0];
    CGColorSpaceRef v5 = CGColorSpaceCreateWithName(v4);
    if (v5)
    {
      uint64_t v6 = v5;
      if ([v3 count])
      {
        uint64_t v7 = CGColorSpaceGetNumberOfComponents(v6) + 1;
        if ([v3 count] == v7)
        {
          uint64_t v8 = (CGFloat *)malloc_type_malloc(8 * v7, 0x100004000313F17uLL);
          if (v7)
          {
            for (uint64_t i = 0; i != v7; ++i)
            {
              uint64_t v10 = [v3 objectAtIndexedSubscript:i];
              [v10 doubleValue];
              v8[i] = v11;
            }
          }
          CGColorRef v12 = CGColorCreate(v6, v8);
          free(v8);
          goto LABEL_22;
        }
        uint64_t v15 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          VKCGColorCreateWithString_cold_4(v3, v7, v15);
        }
      }
      else
      {
        uint64_t v14 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          VKCGColorCreateWithString_cold_3();
        }
      }
      CGColorRef v12 = 0;
LABEL_22:
      CGColorSpaceRelease(v6);
      goto LABEL_23;
    }
    uint64_t v13 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      VKCGColorCreateWithString_cold_2();
    }
  }
  else
  {
    uint64_t v4 = (__CFString *)os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
    if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR)) {
      VKCGColorCreateWithString_cold_1();
    }
  }
  CGColorRef v12 = 0;
LABEL_23:

  return v12;
}

CGColorRef VKCGColorCopyInverse(CGColor *a1)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  Components = CGColorGetComponents(a1);
  CGColorGetNumberOfComponents(a1);
  MEMORY[0x1F4188790]();
  CGColorSpaceRef v5 = (const CGFloat *)((char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (v3)
  {
    uint64_t v6 = v3;
    uint64_t v7 = (double *)Components;
    uint64_t v8 = (double *)v5;
    do
    {
      double v9 = *v7++;
      *v8++ = 1.0 - v9;
      --v6;
    }
    while (v6);
  }
  v5[v3] = Components[v3];
  ColorSpace = CGColorGetColorSpace(a1);
  return CGColorCreate(ColorSpace, v5);
}

void sub_1DB2F9D5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__16(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__16(uint64_t a1)
{
}

void sub_1DB2FB6B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

uint64_t __Block_byref_object_copy__17(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__17(uint64_t a1)
{
}

uint64_t vk_isCameraApp()
{
  uint64_t v0 = [MEMORY[0x1E4F28B50] mainBundle];
  id v1 = [v0 bundleIdentifier];
  uint64_t v2 = [v1 isEqualToString:@"com.apple.camera"];

  return v2;
}

uint64_t vk_isPhotosApp()
{
  uint64_t v0 = [MEMORY[0x1E4F28B50] mainBundle];
  id v1 = [v0 bundleIdentifier];
  uint64_t v2 = [v1 isEqualToString:@"com.apple.mobileslideshow"];

  return v2;
}

BOOL VKMNearlyEqualVKQuads(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  [v3 topLeft];
  double v6 = v5;
  double v8 = v7;
  [v4 topLeft];
  if (!VKMNearlyEqualPoints(v6, v8, v9, v10)) {
    goto LABEL_5;
  }
  [v3 topRight];
  double v12 = v11;
  double v14 = v13;
  [v4 topRight];
  if (!VKMNearlyEqualPoints(v12, v14, v15, v16)) {
    goto LABEL_5;
  }
  [v3 bottomRight];
  double v18 = v17;
  double v20 = v19;
  [v4 bottomRight];
  if (VKMNearlyEqualPoints(v18, v20, v21, v22))
  {
    [v3 bottomLeft];
    double v24 = v23;
    double v26 = v25;
    [v4 bottomLeft];
    BOOL v29 = VKMNearlyEqualPoints(v24, v26, v27, v28);
  }
  else
  {
LABEL_5:
    BOOL v29 = 0;
  }

  return v29;
}

double VKMMultiplyQuadSideLengthScaler(double a1, double a2, double a3, double a4, double a5)
{
  return a1 * a5;
}

double VKMMininumQuadSideLength(double result, double a2, double a3, double a4)
{
  if (a3 >= a4) {
    a3 = a4;
  }
  if (a3 < result) {
    __n128 result = a3;
  }
  if (result >= a2) {
    return a2;
  }
  return result;
}

BOOL VKMTransformsDifferOnlyByTranslation(double *a1, double *a2)
{
  return *a1 == *a2 && a1[1] == a2[1] && a1[2] == a2[2] && a1[3] == a2[3];
}

CGPath *VKMCreatePathFromTransformedRect(const CGAffineTransform *a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  Mutable = CGPathCreateMutable();
  v12.origin.CGFloat x = a2;
  v12.origin.CGFloat y = a3;
  v12.size.CGFloat width = a4;
  v12.size.CGFloat height = a5;
  CGPathAddRect(Mutable, a1, v12);
  return Mutable;
}

float64x2_t VKMTransformedCornersOfRect(float64x2_t *a1, double *a2, double *a3, double *a4, double *a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9)
{
  CGFloat MinX = CGRectGetMinX(*(CGRect *)&a6);
  v23.origin.CGFloat x = a6;
  v23.origin.CGFloat y = a7;
  v23.size.CGFloat width = a8;
  v23.size.CGFloat height = a9;
  CGFloat MinY = CGRectGetMinY(v23);
  v24.origin.CGFloat x = a6;
  v24.origin.CGFloat y = a7;
  v24.size.CGFloat width = a8;
  v24.size.CGFloat height = a9;
  CGFloat MaxX = CGRectGetMaxX(v24);
  v25.origin.CGFloat x = a6;
  v25.origin.CGFloat y = a7;
  v25.size.CGFloat width = a8;
  v25.size.CGFloat height = a9;
  CGFloat MaxY = CGRectGetMaxY(v25);
  *a2 = MinX;
  a2[1] = MinY;
  *a3 = MinX;
  a3[1] = MaxY;
  *a4 = MaxX;
  a4[1] = MaxY;
  *a5 = MaxX;
  a5[1] = MinY;
  *(float64x2_t *)a2 = vaddq_f64(a1[2], vmlaq_n_f64(vmulq_n_f64(a1[1], a2[1]), *a1, *a2));
  *(float64x2_t *)a3 = vaddq_f64(a1[2], vmlaq_n_f64(vmulq_n_f64(a1[1], a3[1]), *a1, *a3));
  *(float64x2_t *)a4 = vaddq_f64(a1[2], vmlaq_n_f64(vmulq_n_f64(a1[1], a4[1]), *a1, *a4));
  float64x2_t result = vaddq_f64(a1[2], vmlaq_n_f64(vmulq_n_f64(a1[1], a5[1]), *a1, *a5));
  *(float64x2_t *)a5 = result;
  return result;
}

CGAffineTransform *VKMAffineTransformShear@<X0>(_OWORD *a1@<X0>, CGAffineTransform *a2@<X8>, CGFloat a3@<D0>, CGFloat a4@<D1>)
{
  t1.a = 1.0;
  t1.b = a3;
  t1.c = a4;
  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)&t1.d = _Q0;
  t1.tCGFloat y = 1.0;
  long long v9 = a1[1];
  *(_OWORD *)&v11.a = *a1;
  *(_OWORD *)&v11.c = v9;
  *(_OWORD *)&v11.tCGFloat x = a1[2];
  return CGAffineTransformConcat(a2, &t1, &v11);
}

long double VKMTransformAngle(double *a1)
{
  double v2 = *a1;
  double v1 = a1[1];
  if (v1 * a1[2] - *a1 * a1[3] > 0.0)
  {
    double v2 = -v2;
    double v1 = -v1;
  }
  return atan2(v1, v2) * 57.2957795;
}

BOOL VKMIsTransformFlipped(double *a1)
{
  return a1[2] * a1[1] - *a1 * a1[3] > 0.0;
}

double VKMTransformScale(double *a1)
{
  return sqrt(a1[1] * a1[1] + *a1 * *a1);
}

double VKMTransformIsValid(double *a1)
{
  double v1 = fabs(*a1 * a1[3] - a1[1] * a1[2]);
  double result = 0.0;
  if (v1 >= 0.001 && v1 != INFINITY && fabs(a1[4]) != INFINITY)
  {
    double v3 = fabs(a1[5]);
    BOOL v4 = v3 < INFINITY;
    BOOL v5 = v3 <= INFINITY;
    double result = 0.0;
    if (v4) {
      double result = 1.0;
    }
    if (!v5) {
      return 1.0;
    }
  }
  return result;
}

double VKMTransformXYScale(double *a1)
{
  return sqrt(a1[1] * a1[1] + *a1 * *a1);
}

CGAffineTransform *VKMTransformNormalizeScale@<X0>(uint64_t a1@<X0>, CGAffineTransform *a2@<X8>)
{
  CGFloat v2 = 1.0 / sqrt(*(double *)(a1 + 8) * *(double *)(a1 + 8) + *(double *)a1 * *(double *)a1);
  CGFloat v3 = 1.0 / sqrt(*(double *)(a1 + 24) * *(double *)(a1 + 24) + *(double *)(a1 + 16) * *(double *)(a1 + 16));
  long long v4 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&v6.a = *(_OWORD *)a1;
  *(_OWORD *)&v6.c = v4;
  *(_OWORD *)&v6.tCGFloat x = *(_OWORD *)(a1 + 32);
  return CGAffineTransformScale(a2, &v6, v2, v3);
}

BOOL VKMIsTransformAxisAlignedWithObjectSize(double *a1, double a2, double a3)
{
  double v3 = 1.0 / (a2 * 0.5);
  double v4 = 1.0 / (a3 * 0.5);
  if (v3 >= v4) {
    double v3 = v4;
  }
  double v5 = fabs(a1[3]);
  if (fabs(*a1) < v3 && v5 < v3) {
    return 1;
  }
  if (fabs(a1[1]) >= v3) {
    return 0;
  }
  return fabs(a1[2]) < v3;
}

BOOL VKMIsTransformAxisAlignedWithThreshold(double *a1, double a2)
{
  if (fabs(*a1) < a2 && fabs(a1[3]) < a2) {
    return 1;
  }
  if (fabs(a1[1]) >= a2) {
    return 0;
  }
  return fabs(a1[2]) < a2;
}

double VKMPointFromApplyingTransformToPointInRect(_OWORD *a1, double a2, double a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  double v8 = VKMCenterOfRect(a4, a5, a6, a7);
  CGFloat v10 = v9;
  memset(&v19, 0, sizeof(v19));
  CGAffineTransformMakeTranslation(&v19, -v8, -v9);
  CGAffineTransform t1 = v19;
  long long v11 = a1[1];
  *(_OWORD *)&t2.a = *a1;
  *(_OWORD *)&t2.c = v11;
  *(_OWORD *)&t2.tCGFloat x = a1[2];
  CGAffineTransformConcat(&v18, &t1, &t2);
  CGAffineTransform v19 = v18;
  CGAffineTransformMakeTranslation(&v15, v8, v10);
  CGAffineTransform t1 = v19;
  CGAffineTransformConcat(&v18, &t1, &v15);
  *(void *)&double result = *(_OWORD *)&vaddq_f64(*(float64x2_t *)&v18.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v18.c, a3), *(float64x2_t *)&v18.a, a2));
  return result;
}

BOOL VKMIsTransformAxisAligned(double *a1)
{
  if (fabs(*a1) < 1.0e-12 && fabs(a1[3]) < 1.0e-12) {
    return 1;
  }
  if (fabs(a1[1]) >= 1.0e-12) {
    return 0;
  }
  return fabs(a1[2]) < 1.0e-12;
}

BOOL VKMIsTransformAxisAlignedUnflipped(double *a1)
{
  return fabs(a1[1]) < 1.0e-12 && fabs(a1[2]) < 1.0e-12 && *a1 >= 0.0 && a1[3] >= 0.0;
}

CGAffineTransform *VKMAffineTransformForFlips@<X0>(CGAffineTransform *result@<X0>, int a2@<W1>, uint64_t a3@<X8>, CGFloat a4@<D0>, CGFloat a5@<D1>, CGFloat a6@<D2>, CGFloat a7@<D3>)
{
  uint64_t v13 = MEMORY[0x1E4F1DAB8];
  long long v14 = *MEMORY[0x1E4F1DAB8];
  long long v15 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)a3 = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)(a3 + 16) = v15;
  long long v16 = *(_OWORD *)(v13 + 32);
  *(_OWORD *)(a3 + 32) = v16;
  if (result)
  {
    long long v31 = v15;
    long long v32 = v14;
    CGFloat v17 = a4;
    CGFloat v18 = a5;
    long long v30 = v16;
    CGFloat v19 = a6;
    double MinX = CGRectGetMinX(*(CGRect *)(&a7 - 3));
    v35.origin.CGFloat x = a4;
    v35.origin.CGFloat y = a5;
    v35.size.CGFloat width = a6;
    v35.size.CGFloat height = a7;
    CGFloat MaxX = CGRectGetMaxX(v35);
    *(_OWORD *)&v34.a = v32;
    *(_OWORD *)&v34.c = v31;
    *(_OWORD *)&v34.tCGFloat x = v30;
    CGAffineTransformTranslate((CGAffineTransform *)a3, &v34, MinX + MaxX, 0.0);
    long long v22 = *(_OWORD *)(a3 + 16);
    *(_OWORD *)&v33.a = *(_OWORD *)a3;
    *(_OWORD *)&v33.c = v22;
    *(_OWORD *)&v33.tCGFloat x = *(_OWORD *)(a3 + 32);
    double result = CGAffineTransformScale(&v34, &v33, -1.0, 1.0);
    long long v23 = *(_OWORD *)&v34.c;
    *(_OWORD *)a3 = *(_OWORD *)&v34.a;
    *(_OWORD *)(a3 + 16) = v23;
    *(_OWORD *)(a3 + 32) = *(_OWORD *)&v34.tx;
  }
  if (a2)
  {
    v36.origin.CGFloat x = a4;
    v36.origin.CGFloat y = a5;
    v36.size.CGFloat width = a6;
    v36.size.CGFloat height = a7;
    double MinY = CGRectGetMinY(v36);
    v37.origin.CGFloat x = a4;
    v37.origin.CGFloat y = a5;
    v37.size.CGFloat width = a6;
    v37.size.CGFloat height = a7;
    CGFloat MaxY = CGRectGetMaxY(v37);
    long long v26 = *(_OWORD *)(a3 + 16);
    *(_OWORD *)&v33.a = *(_OWORD *)a3;
    *(_OWORD *)&v33.c = v26;
    *(_OWORD *)&v33.tCGFloat x = *(_OWORD *)(a3 + 32);
    CGAffineTransformTranslate(&v34, &v33, 0.0, MinY + MaxY);
    long long v27 = *(_OWORD *)&v34.c;
    *(_OWORD *)a3 = *(_OWORD *)&v34.a;
    *(_OWORD *)(a3 + 16) = v27;
    *(_OWORD *)(a3 + 32) = *(_OWORD *)&v34.tx;
    long long v28 = *(_OWORD *)(a3 + 16);
    *(_OWORD *)&v33.a = *(_OWORD *)a3;
    *(_OWORD *)&v33.c = v28;
    *(_OWORD *)&v33.tCGFloat x = *(_OWORD *)(a3 + 32);
    double result = CGAffineTransformScale(&v34, &v33, 1.0, -1.0);
    long long v29 = *(_OWORD *)&v34.c;
    *(_OWORD *)a3 = *(_OWORD *)&v34.a;
    *(_OWORD *)(a3 + 16) = v29;
    *(_OWORD *)(a3 + 32) = *(_OWORD *)&v34.tx;
  }
  return result;
}

CGAffineTransform *VKMAffineTransformVerticalFlip@<X0>(uint64_t a1@<X8>, CGFloat a2@<D0>, CGFloat a3@<D1>, CGFloat a4@<D2>, CGFloat a5@<D3>)
{
  return VKMAffineTransformForFlips(0, 1, a1, a2, a3, a4, a5);
}

CGAffineTransform *VKMAffineTransformScaleByConstant@<X0>(CGAffineTransform *a1@<X8>, CGFloat a2@<D0>)
{
  return CGAffineTransformMakeScale(a1, a2, a2);
}

CGAffineTransform *VKMAffineTransformNormalize@<X0>(CGAffineTransform *a1@<X8>, double a2@<D0>, double a3@<D1>)
{
  return CGAffineTransformMakeScale(a1, 1.0 / a2, 1.0 / a3);
}

CGAffineTransform *VKMAffineTransformAspectFill@<X0>(CGAffineTransform *a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D2>, double a5@<D3>)
{
  if (a2 == 0.0 || a3 == 0.0) {
    +[VKAssert handleFailedAssertWithCondition:"imageSize.width != 0 && imageSize.height != 0" functionName:"CGAffineTransform VKMAffineTransformAspectFill(CGSize, CGSize)" simulateCrash:0 showAlert:0 format:@"division by zero"];
  }
  CGFloat v10 = fmax(a4 / a2, a5 / a3);
  CGFloat v11 = (a4 - a2 * v10) * 0.5;
  CGFloat v12 = (a5 - a3 * v10) * 0.5;
  CGAffineTransformMakeScale(&t1, v10, v10);
  CGAffineTransformMakeTranslation(&v14, v11, v12);
  return CGAffineTransformConcat(a1, &t1, &v14);
}

CGAffineTransform *VKMTransformFromTransformSpace@<X0>(_OWORD *a1@<X0>, _OWORD *a2@<X1>, CGAffineTransform *a3@<X8>)
{
  long long v6 = a2[1];
  *(_OWORD *)&v10.a = *a2;
  *(_OWORD *)&v10.c = v6;
  *(_OWORD *)&v10.tCGFloat x = a2[2];
  CGAffineTransformInvert(&t1, &v10);
  long long v7 = a1[1];
  *(_OWORD *)&v10.a = *a1;
  *(_OWORD *)&v10.c = v7;
  *(_OWORD *)&v10.tCGFloat x = a1[2];
  CGAffineTransformConcat(&v12, &t1, &v10);
  long long v8 = a2[1];
  *(_OWORD *)&v10.a = *a2;
  *(_OWORD *)&v10.c = v8;
  *(_OWORD *)&v10.tCGFloat x = a2[2];
  return CGAffineTransformConcat(a3, &v12, &v10);
}

CGAffineTransform *VKMTransformInTransformSpace@<X0>(_OWORD *a1@<X0>, _OWORD *a2@<X1>, CGAffineTransform *a3@<X8>)
{
  long long v5 = a2[1];
  *(_OWORD *)&t1.a = *a2;
  *(_OWORD *)&t1.c = v5;
  *(_OWORD *)&t1.tCGFloat x = a2[2];
  long long v6 = a1[1];
  *(_OWORD *)&t2.a = *a1;
  *(_OWORD *)&t2.c = v6;
  *(_OWORD *)&t2.tCGFloat x = a1[2];
  CGAffineTransformConcat(&v12, &t1, &t2);
  long long v7 = a2[1];
  *(_OWORD *)&t1.a = *a2;
  *(_OWORD *)&t1.c = v7;
  *(_OWORD *)&t1.tCGFloat x = a2[2];
  CGAffineTransformInvert(&v9, &t1);
  return CGAffineTransformConcat(a3, &v12, &v9);
}

CGAffineTransform *VKMTransformConvertForNewOrigin@<X0>(_OWORD *a1@<X0>, CGAffineTransform *a2@<X8>, CGFloat a3@<D0>, CGFloat a4@<D1>)
{
  memset(&v14, 0, sizeof(v14));
  CGAffineTransformMakeTranslation(&v14, -a3, -a4);
  memset(&v13, 0, sizeof(v13));
  CGAffineTransformMakeTranslation(&v13, a3, a4);
  CGAffineTransform t1 = v13;
  long long v8 = a1[1];
  *(_OWORD *)&v10.a = *a1;
  *(_OWORD *)&v10.c = v8;
  *(_OWORD *)&v10.tCGFloat x = a1[2];
  CGAffineTransformConcat(&v12, &t1, &v10);
  CGAffineTransform t1 = v14;
  return CGAffineTransformConcat(a2, &v12, &t1);
}

CGAffineTransform *VKMTransformMakeFree@<X0>(int a1@<W0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>, double a5@<D2>, double a6@<D3>, CGFloat a7@<D4>, double a8@<D5>, double a9@<D6>, double a10@<D7>)
{
  double v18 = VKMDistance(a3, a4, a5, a6);
  CGFloat v38 = a7;
  double v19 = VKMDistance(a7, a8, a9, a10);
  if (v18 < 0.0001 || v19 < 0.0001)
  {
    return CGAffineTransformMakeTranslation((CGAffineTransform *)a2, a7 - a3, a8 - a4);
  }
  else
  {
    sCGFloat x = v19 / v18;
    double v20 = VKMSubtractPoints(a3, a4, a5);
    double v22 = VKMAngleFromDelta(v20, v21);
    double v23 = VKMSubtractPoints(a7, a8, a9);
    double v25 = VKMAngleFromDelta(v23, v24);
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
    *(_OWORD *)(a2 + 32) = 0u;
    CGAffineTransformMakeTranslation((CGAffineTransform *)a2, -a3, -a4);
    CGAffineTransformMakeRotation(&t2, -v22);
    long long v26 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)&t1.a = *(_OWORD *)a2;
    *(_OWORD *)&t1.c = v26;
    *(_OWORD *)&t1.tCGFloat x = *(_OWORD *)(a2 + 32);
    CGAffineTransformConcat(&v44, &t1, &t2);
    long long v27 = *(_OWORD *)&v44.c;
    *(_OWORD *)a2 = *(_OWORD *)&v44.a;
    *(_OWORD *)(a2 + 16) = v27;
    *(_OWORD *)(a2 + 32) = *(_OWORD *)&v44.tx;
    double v28 = 1.0;
    if (!a1) {
      double v28 = sx;
    }
    CGAffineTransformMakeScale(&v41, sx, v28);
    long long v29 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)&t1.a = *(_OWORD *)a2;
    *(_OWORD *)&t1.c = v29;
    *(_OWORD *)&t1.tCGFloat x = *(_OWORD *)(a2 + 32);
    CGAffineTransformConcat(&v44, &t1, &v41);
    long long v30 = *(_OWORD *)&v44.c;
    *(_OWORD *)a2 = *(_OWORD *)&v44.a;
    *(_OWORD *)(a2 + 16) = v30;
    *(_OWORD *)(a2 + 32) = *(_OWORD *)&v44.tx;
    CGAffineTransformMakeRotation(&v40, v25);
    long long v31 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)&t1.a = *(_OWORD *)a2;
    *(_OWORD *)&t1.c = v31;
    *(_OWORD *)&t1.tCGFloat x = *(_OWORD *)(a2 + 32);
    CGAffineTransformConcat(&v44, &t1, &v40);
    long long v32 = *(_OWORD *)&v44.c;
    *(_OWORD *)a2 = *(_OWORD *)&v44.a;
    *(_OWORD *)(a2 + 16) = v32;
    *(_OWORD *)(a2 + 32) = *(_OWORD *)&v44.tx;
    CGAffineTransformMakeTranslation(&v39, v38, a8);
    long long v33 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)&t1.a = *(_OWORD *)a2;
    *(_OWORD *)&t1.c = v33;
    *(_OWORD *)&t1.tCGFloat x = *(_OWORD *)(a2 + 32);
    double result = CGAffineTransformConcat(&v44, &t1, &v39);
    long long v35 = *(_OWORD *)&v44.c;
    *(_OWORD *)a2 = *(_OWORD *)&v44.a;
    *(_OWORD *)(a2 + 16) = v35;
    *(_OWORD *)(a2 + 32) = *(_OWORD *)&v44.tx;
  }
  return result;
}

CGFloat VKMTransformMakeAxisAligned@<D0>(uint64_t a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D2>, double a5@<D3>, double a6@<D4>, double a7@<D5>, double a8@<D6>, double a9@<D7>, double a10, double a11, double a12)
{
  double v19 = VKMDistance(a2, a3, a4, a5);
  double v20 = VKMDistance(a6, a7, a8, a9);
  if (v19 < 0.0001 || v20 < 0.0001)
  {
    CGAffineTransformMakeTranslation((CGAffineTransform *)a1, a6 - a2, a7 - a3);
  }
  else
  {
    double v21 = v20 / v19;
    if (v21 >= a10)
    {
      if (v21 > a11) {
        double v21 = a11 + (v21 - a11) * a12;
      }
    }
    else
    {
      double v21 = (v21 - a10) * a12 * 0.5 + a10;
    }
    *(_OWORD *)(a1 + 16) = 0u;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)a1 = 0u;
    CGAffineTransformMakeTranslation((CGAffineTransform *)a1, (a2 + a4) * -0.5, (a3 + a5) * -0.5);
    CGAffineTransformMakeScale(&t2, v21, v21);
    long long v23 = *(_OWORD *)(a1 + 16);
    *(_OWORD *)&t1.a = *(_OWORD *)a1;
    *(_OWORD *)&t1.c = v23;
    *(_OWORD *)&t1.tCGFloat x = *(_OWORD *)(a1 + 32);
    CGAffineTransformConcat(&v32, &t1, &t2);
    long long v24 = *(_OWORD *)&v32.c;
    *(_OWORD *)a1 = *(_OWORD *)&v32.a;
    *(_OWORD *)(a1 + 16) = v24;
    *(_OWORD *)(a1 + 32) = *(_OWORD *)&v32.tx;
    CGAffineTransformMakeTranslation(&v29, (a6 + a8) * 0.5, (a7 + a9) * 0.5);
    long long v25 = *(_OWORD *)(a1 + 16);
    *(_OWORD *)&t1.a = *(_OWORD *)a1;
    *(_OWORD *)&t1.c = v25;
    *(_OWORD *)&t1.tCGFloat x = *(_OWORD *)(a1 + 32);
    CGAffineTransformConcat(&v32, &t1, &v29);
    long long v26 = *(_OWORD *)&v32.c;
    *(_OWORD *)a1 = *(_OWORD *)&v32.a;
    *(_OWORD *)(a1 + 16) = v26;
    CGFloat result = v32.tx;
    *(_OWORD *)(a1 + 32) = *(_OWORD *)&v32.tx;
  }
  return result;
}

CGFloat VKMTransformConvertingRectToRect@<D0>(uint64_t a1@<X8>, double a2@<D0>, double a3@<D2>, double a4@<D3>, double a5@<D4>, double a6@<D5>, double a7@<D6>, double a8@<D7>)
{
  return VKMTransformConvertingRectToRectAtPercent(a1, a2, a3, a4, a5, a6, a7, a8, 1.0);
}

CGFloat VKMTransformConvertingRectToRectAtPercent@<D0>(uint64_t a1@<X8>, double a2@<D0>, double a3@<D2>, double a4@<D3>, double a5@<D4>, double a6@<D5>, double a7@<D6>, double a8@<D7>, double a9)
{
  double v14 = VKMSubtractPoints(a5, a6, a2);
  double v15 = a7 / a3;
  double v16 = a8 / a4;
  double v18 = VKMMultiplyPointScalar(v14, v17, a9);
  CGFloat v20 = v19;
  double v21 = VKMInterpolatePoints(1.0, 1.0, v15, v16, a9);
  CGFloat v23 = v22;
  uint64_t v24 = MEMORY[0x1E4F1DAB8];
  long long v25 = *MEMORY[0x1E4F1DAB8];
  long long v26 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)a1 = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)(a1 + 16) = v26;
  long long v27 = *(_OWORD *)(v24 + 32);
  *(_OWORD *)(a1 + 32) = v27;
  *(_OWORD *)&v32.a = v25;
  *(_OWORD *)&v32.c = v26;
  *(_OWORD *)&v32.tCGFloat x = v27;
  CGAffineTransformTranslate((CGAffineTransform *)a1, &v32, v18, v20);
  long long v28 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&v31.a = *(_OWORD *)a1;
  *(_OWORD *)&v31.c = v28;
  *(_OWORD *)&v31.tCGFloat x = *(_OWORD *)(a1 + 32);
  CGAffineTransformScale(&v32, &v31, v21, v23);
  long long v29 = *(_OWORD *)&v32.c;
  *(_OWORD *)a1 = *(_OWORD *)&v32.a;
  *(_OWORD *)(a1 + 16) = v29;
  CGFloat result = v32.tx;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)&v32.tx;
  return result;
}

double VKM_CGAffineTransformDecompose(uint64_t a1, uint64_t a2)
{
  double v4 = *(double *)(a1 + 8);
  double v5 = *(double *)(a1 + 16);
  double v6 = *(double *)(a1 + 24);
  double v7 = sqrt(v4 * v4 + *(double *)a1 * *(double *)a1);
  double v8 = sqrt(v6 * v6 + v5 * v5);
  double v9 = *(double *)a1 * v6 - v5 * v4;
  double v10 = -v8;
  double v11 = -v7;
  if (*(double *)a1 < v6) {
    double v10 = v8;
  }
  else {
    double v11 = v7;
  }
  if (v9 < 0.0) {
    double v12 = v11;
  }
  else {
    double v12 = v7;
  }
  if (v9 < 0.0) {
    double v13 = v10;
  }
  else {
    double v13 = v8;
  }
  long long v14 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&v20.a = *(_OWORD *)a1;
  *(_OWORD *)&v20.c = v14;
  *(_OWORD *)&v20.tCGFloat x = *(_OWORD *)(a1 + 32);
  CGAffineTransformScale(&v21, &v20, 1.0 / v12, 1.0 / v13);
  long long v15 = *(_OWORD *)&v21.c;
  *(_OWORD *)a1 = *(_OWORD *)&v21.a;
  *(_OWORD *)(a1 + 16) = v15;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)&v21.tx;
  double v16 = atan2(*(long double *)(a1 + 8), *(long double *)a1);
  long long v17 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&v20.a = *(_OWORD *)a1;
  *(_OWORD *)&v20.c = v17;
  *(_OWORD *)&v20.tCGFloat x = *(_OWORD *)(a1 + 32);
  CGAffineTransformRotate(&v21, &v20, -v16);
  long long v18 = *(_OWORD *)&v21.c;
  *(_OWORD *)a1 = *(_OWORD *)&v21.a;
  *(_OWORD *)(a1 + 16) = v18;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)&v21.tx;
  *(double *)a2 = v12;
  *(double *)(a2 + 8) = v13;
  *(double *)(a2 + 16) = v16;
  *(void *)(a2 + 24) = *(void *)a1;
  *(void *)(a2 + 32) = *(void *)(a1 + 8);
  *(void *)(a2 + 40) = *(void *)(a1 + 16);
  *(void *)(a2 + 48) = *(void *)(a1 + 24);
  *(void *)(a2 + 56) = *(void *)(a1 + 32);
  double result = *(double *)(a1 + 40);
  *(double *)(a2 + 64) = result;
  return result;
}

CGFloat VKM_CGAffineTransformCompose@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  long long v4 = *(_OWORD *)(a1 + 40);
  *(_OWORD *)a2 = *(_OWORD *)(a1 + 24);
  *(_OWORD *)(a2 + 16) = v4;
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 56);
  CGFloat v5 = *(double *)(a1 + 16);
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)&v13.a = *(_OWORD *)a2;
  *(_OWORD *)&v13.c = v6;
  *(_OWORD *)&v13.tCGFloat x = *(_OWORD *)(a2 + 32);
  CGAffineTransformRotate((CGAffineTransform *)a2, &v13, v5);
  CGFloat v7 = *(double *)a1;
  CGFloat v8 = *(double *)(a1 + 8);
  long long v9 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)&v12.a = *(_OWORD *)a2;
  *(_OWORD *)&v12.c = v9;
  *(_OWORD *)&v12.tCGFloat x = *(_OWORD *)(a2 + 32);
  CGAffineTransformScale(&v13, &v12, v7, v8);
  long long v10 = *(_OWORD *)&v13.c;
  *(_OWORD *)a2 = *(_OWORD *)&v13.a;
  *(_OWORD *)(a2 + 16) = v10;
  CGFloat result = v13.tx;
  *(_OWORD *)(a2 + 32) = *(_OWORD *)&v13.tx;
  return result;
}

double VKMTransformDecompose(_OWORD *a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  v16[9] = *MEMORY[0x1E4F143B8];
  long long v11 = a1[1];
  v15[0] = *a1;
  v15[1] = v11;
  v15[2] = a1[2];
  VKM_CGAffineTransformDecompose((uint64_t)v15, (uint64_t)v16);
  uint64_t v12 = v16[2];
  *a2 = v16[7];
  *a3 = v16[8];
  *a4 = v12;
  double result = *(double *)v16;
  uint64_t v14 = v16[1];
  *a5 = v16[0];
  *a6 = v14;
  return result;
}

uint64_t VKMTransform3DDecompose(_OWORD *a1, CGFloat *a2, CGFloat *a3, CGFloat *a4, CGFloat *a5, CGFloat *a6)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v12 = a1[5];
  *(_OWORD *)&v26.m31 = a1[4];
  *(_OWORD *)&v26.m33 = v12;
  long long v13 = a1[7];
  *(_OWORD *)&v26.m41 = a1[6];
  *(_OWORD *)&v26.m43 = v13;
  long long v14 = a1[1];
  *(_OWORD *)&v26.m11 = *a1;
  *(_OWORD *)&v26.CGFloat m13 = v14;
  long long v15 = a1[3];
  *(_OWORD *)&v26.m21 = a1[2];
  *(_OWORD *)&v26.m23 = v15;
  uint64_t v16 = MEMORY[0x1E018D3F0](&v26);
  if (v16)
  {
    memset(&v24, 0, sizeof(v24));
    long long v17 = a1[5];
    *(_OWORD *)&v26.m31 = a1[4];
    *(_OWORD *)&v26.m33 = v17;
    long long v18 = a1[7];
    *(_OWORD *)&v26.m41 = a1[6];
    *(_OWORD *)&v26.m43 = v18;
    long long v19 = a1[1];
    *(_OWORD *)&v26.m11 = *a1;
    *(_OWORD *)&v26.CGFloat m13 = v19;
    long long v20 = a1[3];
    *(_OWORD *)&v26.m21 = a1[2];
    *(_OWORD *)&v26.m23 = v20;
    CATransform3DGetAffineTransform(&v24, &v26);
    CGAffineTransform v25 = v24;
    VKM_CGAffineTransformDecompose((uint64_t)&v25, (uint64_t)&v26);
    CGFloat m13 = v26.m13;
    *a2 = v26.m24;
    *a3 = v26.m31;
    *a4 = m13;
    CGFloat m12 = v26.m12;
    *a5 = v26.m11;
    *a6 = m12;
  }
  return v16;
}

void VKMTransformMixAffineTransforms(long long *a1@<X0>, _OWORD *a2@<X1>, uint64_t a3@<X8>, double a4@<D0>)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v7 = a1[1];
  long long v16 = *a1;
  v17[0] = v7;
  v17[1] = a1[2];
  VKM_CGAffineTransformDecompose((uint64_t)&v16, (uint64_t)&v18);
  long long v8 = a2[1];
  v15[0] = *a2;
  v15[1] = v8;
  v15[2] = a2[2];
  VKM_CGAffineTransformDecompose((uint64_t)v15, (uint64_t)&v16);
  if ((v18 >= 0.0 || *((double *)&v16 + 1) >= 0.0) && (v19 >= 0.0 || *(double *)&v16 >= 0.0))
  {
    double v9 = __x;
  }
  else
  {
    double v18 = -v18;
    double v19 = -v19;
    double v9 = __x + dbl_1DB33ECB0[__x < 0.0];
  }
  double v10 = fmod(v9, 6.28318531);
  __CGFloat x = v10;
  double v11 = fmod(*(long double *)v17, 6.28318531);
  *(double *)long long v17 = v11;
  if (vabdd_f64(v10, v11) > 3.14159265)
  {
    BOOL v12 = v10 <= v11;
    if (v10 > v11) {
      double v11 = v10;
    }
    long long v13 = (double *)&v16;
    if (!v12) {
      long long v13 = &v18;
    }
    v13[2] = v11 + -6.28318531;
  }
  for (uint64_t i = 0; i != 72; i += 8)
    *(double *)((char *)&v18 + i) = *(double *)((char *)&v18 + i)
                                  + (*(double *)((char *)&v17[-1] + i) - *(double *)((char *)&v18 + i)) * a4;
  VKM_CGAffineTransformCompose((uint64_t)&v18, a3);
}

BOOL VKMTransform3DNearlyEqualToTransform(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[5];
  v12[4] = a1[4];
  v12[5] = v2;
  long long v3 = a1[7];
  v12[6] = a1[6];
  v12[7] = v3;
  long long v4 = a1[1];
  v12[0] = *a1;
  v12[1] = v4;
  long long v5 = a1[3];
  void v12[2] = a1[2];
  v12[3] = v5;
  long long v6 = a2[5];
  void v11[4] = a2[4];
  v11[5] = v6;
  long long v7 = a2[7];
  v11[6] = a2[6];
  v11[7] = v7;
  long long v8 = a2[1];
  v11[0] = *a2;
  v11[1] = v8;
  long long v9 = a2[3];
  unint64_t v11[2] = a2[2];
  void v11[3] = v9;
  return VKMTransform3DNearlyEqualToTransformWithTolerance((double *)v12, (double *)v11, 0.01);
}

BOOL VKMTransform3DNearlyEqualToTransformWithTolerance(double *a1, double *a2, double a3)
{
  return vabdd_f64(*a1, *a2) < a3
      && vabdd_f64(a1[1], a2[1]) < a3
      && vabdd_f64(a1[2], a2[2]) < a3
      && vabdd_f64(a1[3], a2[3]) < a3
      && vabdd_f64(a1[4], a2[4]) < a3
      && vabdd_f64(a1[5], a2[5]) < a3
      && vabdd_f64(a1[6], a2[6]) < a3
      && vabdd_f64(a1[7], a2[7]) < a3
      && vabdd_f64(a1[8], a2[8]) < a3
      && vabdd_f64(a1[9], a2[9]) < a3
      && vabdd_f64(a1[10], a2[10]) < a3
      && vabdd_f64(a1[11], a2[11]) < a3
      && vabdd_f64(a1[12], a2[12]) < a3
      && vabdd_f64(a1[13], a2[13]) < a3
      && vabdd_f64(a1[14], a2[14]) < a3
      && vabdd_f64(a1[15], a2[15]) < a3;
}

void sub_1DB305614(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__18(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__18(uint64_t a1)
{
}

void sub_1DB3061A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  uint64_t v19 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 160), 8);
  _Block_object_dispose((const void *)(v11 - 112), 8);
  _Unwind_Resume(a1);
}

__CFString *VKMUIStringForBool(int a1)
{
  uint64_t v1 = @"NO";
  if (a1) {
    uint64_t v1 = @"YES";
  }
  long long v2 = v1;
  return v2;
}

uint64_t VKMUIStringForPoint(double a1, double a2)
{
  return objc_msgSend(NSString, "stringWithFormat:", @"X: %0.2f Y: %0.2f", *(void *)&a1, *(void *)&a2);
}

uint64_t VKMUIStringForSize(double a1, double a2)
{
  return objc_msgSend(NSString, "stringWithFormat:", @"W: %0.2f H: %0.2f", *(void *)&a1, *(void *)&a2);
}

uint64_t VKMUIStringForRect(double a1, double a2, double a3, double a4)
{
  return [NSString stringWithFormat:@"X: %0.2f Y: %0.2f, W: %0.2f H: %0.2f", *(void *)&a1, *(void *)&a2, *(void *)&a3, *(void *)&a4];
}

uint64_t VKMUIStringForIntegralRect(double a1, double a2, double a3, double a4)
{
  return [NSString stringWithFormat:@"X: %d Y: %d, W: %d H: %d", (int)a1, (int)a2, (int)a3, (int)a4];
}

uint64_t VKMUIStringForRectXYSpan(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  long long v8 = NSString;
  uint64_t MinX = (int)CGRectGetMinX(*(CGRect *)&a1);
  v13.origin.CGFloat x = a1;
  v13.origin.CGFloat y = a2;
  v13.size.CGFloat width = a3;
  v13.size.CGFloat height = a4;
  uint64_t MaxX = (int)CGRectGetMaxX(v13);
  v14.origin.CGFloat x = a1;
  v14.origin.CGFloat y = a2;
  v14.size.CGFloat width = a3;
  v14.size.CGFloat height = a4;
  uint64_t MinY = (int)CGRectGetMinY(v14);
  v15.origin.CGFloat x = a1;
  v15.origin.CGFloat y = a2;
  v15.size.CGFloat width = a3;
  v15.size.CGFloat height = a4;
  return objc_msgSend(v8, "stringWithFormat:", @"X: [%d - %d] Y: [%d - %d]", MinX, MaxX, MinY, (int)CGRectGetMaxY(v15));
}

__CFString *VKMUIStringForRange(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x7FFFFFFFFFFFFFFFLL)
  {
    long long v4 = @"NSNotFound";
  }
  else
  {
    long long v4 = [NSString stringWithFormat:@"{%d, %d}, [%d - %d]", a1, a2, a1, a1 + a2, v2];
  }
  return v4;
}

__CFString *VKMUIStringForVKRange(void *a1)
{
  id v1 = a1;
  if ([v1 rangeCount])
  {
    if ([v1 rangeCount] == 1)
    {
      uint64_t v2 = [v1 nsRange];
      VKMUIStringForRange(v2, v3);
      long long v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F28E78]);
      long long v6 = [v1 nsRangeArray];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      void v9[2] = __VKMUIStringForVKRange_block_invoke;
      v9[3] = &unk_1E6BF1998;
      id v10 = v5;
      id v7 = v5;
      [v6 enumerateObjectsUsingBlock:v9];

      long long v4 = (__CFString *)[v7 copy];
    }
  }
  else
  {
    long long v4 = &stru_1F35566F8;
  }

  return v4;
}

void __VKMUIStringForVKRange_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 rangeValue];
  VKMUIStringForRange(v3, v4);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v2 appendString:v5];
}

uint64_t VKMUIStringForEdgeInsets(double a1, double a2, double a3, double a4)
{
  return objc_msgSend(NSString, "stringWithFormat:", @"T: %.02f L: %.02f B: %.02f R: %.02f", *(void *)&a1, *(void *)&a2, *(void *)&a3, *(void *)&a4);
}

__CFString *VKMUIStringForRectEdge(uint64_t a1)
{
  if (!a1)
  {
    uint64_t v2 = @"None";
    goto LABEL_14;
  }
  char v1 = a1;
  if (a1 == 15)
  {
    uint64_t v2 = @"All";
    goto LABEL_14;
  }
  if (a1)
  {
    uint64_t v3 = [&stru_1F35566F8 stringByAppendingString:@"Top,"];
    if ((v1 & 2) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  uint64_t v3 = &stru_1F35566F8;
  if ((a1 & 2) != 0)
  {
LABEL_9:
    uint64_t v4 = [(__CFString *)v3 stringByAppendingString:@"Leading,"];

    uint64_t v3 = (__CFString *)v4;
  }
LABEL_10:
  if ((v1 & 8) != 0)
  {
    uint64_t v8 = [(__CFString *)v3 stringByAppendingString:@"Trailing,"];

    uint64_t v3 = (__CFString *)v8;
    if ((v1 & 4) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if ((v1 & 4) != 0)
  {
LABEL_12:
    uint64_t v5 = [(__CFString *)v3 stringByAppendingString:@"Bottom,"];

    uint64_t v3 = (__CFString *)v5;
  }
LABEL_13:
  long long v6 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@","];
  uint64_t v2 = [(__CFString *)v3 stringByTrimmingCharactersInSet:v6];

LABEL_14:
  return v2;
}

__CFString *VKMUIStringForImageOrientation(unint64_t a1)
{
  if (a1 > 7) {
    return &stru_1F35566F8;
  }
  else {
    return off_1E6BF3A10[a1];
  }
}

id VKMUIStringForCVPixelBufferType(uint64_t a1)
{
  v5[0] = BYTE3(a1);
  v5[1] = BYTE2(a1);
  v5[2] = BYTE1(a1);
  v5[3] = a1;
  v5[4] = 0;
  uint64_t v2 = (void *)[[NSString alloc] initWithUTF8String:v5];
  uint64_t v3 = objc_msgSend(v2, "stringByAppendingFormat:", @" (%d)", a1);

  return v3;
}

__CFString *VKMUIStringForDDTypes(uint64_t a1)
{
  if (!a1)
  {
    uint64_t v2 = @"None";
    goto LABEL_21;
  }
  int v1 = a1;
  if (a1 == -1)
  {
    uint64_t v2 = @"All";
    goto LABEL_21;
  }
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  uint64_t v4 = v3;
  if (v1)
  {
    [v3 appendString:@"PhoneNumber,"];
    if ((v1 & 2) == 0)
    {
LABEL_7:
      if ((v1 & 4) == 0) {
        goto LABEL_8;
      }
      goto LABEL_26;
    }
  }
  else if ((v1 & 2) == 0)
  {
    goto LABEL_7;
  }
  [v4 appendString:@"Address,"];
  if ((v1 & 4) == 0)
  {
LABEL_8:
    if ((v1 & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_27;
  }
LABEL_26:
  [v4 appendString:@"CalendarEvent,"];
  if ((v1 & 8) == 0)
  {
LABEL_9:
    if ((v1 & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_28;
  }
LABEL_27:
  [v4 appendString:@"ShipmentTrackingNumber,"];
  if ((v1 & 0x10) == 0)
  {
LABEL_10:
    if ((v1 & 0x20) == 0) {
      goto LABEL_11;
    }
    goto LABEL_29;
  }
LABEL_28:
  [v4 appendString:@"FlightNumber,"];
  if ((v1 & 0x20) == 0)
  {
LABEL_11:
    if ((v1 & 0x40) == 0) {
      goto LABEL_12;
    }
    goto LABEL_30;
  }
LABEL_29:
  [v4 appendString:@"LookupSuggestion,"];
  if ((v1 & 0x40) == 0)
  {
LABEL_12:
    if ((v1 & 0x80) == 0) {
      goto LABEL_13;
    }
    goto LABEL_31;
  }
LABEL_30:
  [v4 appendString:@"WebURL,"];
  if ((v1 & 0x80) == 0)
  {
LABEL_13:
    if ((v1 & 0x100) == 0) {
      goto LABEL_14;
    }
    goto LABEL_32;
  }
LABEL_31:
  [v4 appendString:@"MailURL,"];
  if ((v1 & 0x100) == 0)
  {
LABEL_14:
    if ((v1 & 0x200) == 0) {
      goto LABEL_15;
    }
    goto LABEL_33;
  }
LABEL_32:
  [v4 appendString:@"GenericURL,"];
  if ((v1 & 0x200) == 0)
  {
LABEL_15:
    if ((v1 & 0x200000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_34;
  }
LABEL_33:
  [v4 appendString:@"Email,"];
  if ((v1 & 0x200000) == 0)
  {
LABEL_16:
    if ((v1 & 0x400000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_35;
  }
LABEL_34:
  [v4 appendString:@"MRC,"];
  if ((v1 & 0x400000) == 0)
  {
LABEL_17:
    if ((v1 & 0x400) == 0) {
      goto LABEL_18;
    }
LABEL_36:
    [v4 appendString:@"PhysicalValue,"];
    if ((v1 & 0x800) == 0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
LABEL_35:
  [v4 appendString:@"AppCode,"];
  if ((v1 & 0x400) != 0) {
    goto LABEL_36;
  }
LABEL_18:
  if ((v1 & 0x800) != 0) {
LABEL_19:
  }
    [v4 appendString:@"Money,"];
LABEL_20:
  uint64_t v5 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@","];
  uint64_t v2 = [v4 stringByTrimmingCharactersInSet:v5];

LABEL_21:
  return v2;
}

__CFString *VKMUIStringForAnalysisTypes(uint64_t a1)
{
  if (!a1)
  {
    uint64_t v2 = @"None";
    goto LABEL_13;
  }
  char v1 = a1;
  if (a1 == -1)
  {
    uint64_t v2 = @"All";
    goto LABEL_13;
  }
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  uint64_t v4 = v3;
  if (v1)
  {
    [v3 appendString:@"Text,"];
    if ((v1 & 2) == 0)
    {
LABEL_7:
      if ((v1 & 4) == 0) {
        goto LABEL_8;
      }
      goto LABEL_18;
    }
  }
  else if ((v1 & 2) == 0)
  {
    goto LABEL_7;
  }
  [v4 appendString:@"TextDD,"];
  if ((v1 & 4) == 0)
  {
LABEL_8:
    if ((v1 & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  [v4 appendString:@"MRC,"];
  if ((v1 & 8) == 0)
  {
LABEL_9:
    if ((v1 & 0x10) == 0) {
      goto LABEL_10;
    }
LABEL_20:
    [v4 appendString:@"VisualSearch,"];
    if ((v1 & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_19:
  [v4 appendString:@"AppClip,"];
  if ((v1 & 0x10) != 0) {
    goto LABEL_20;
  }
LABEL_10:
  if ((v1 & 0x20) != 0) {
LABEL_11:
  }
    [v4 appendString:@"ImageSegmentation,"];
LABEL_12:
  uint64_t v5 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@","];
  uint64_t v2 = [v4 stringByTrimmingCharactersInSet:v5];

LABEL_13:
  return v2;
}

__CFString *VKMUIStringForAnalysisInteractionTypes(uint64_t a1)
{
  if (!a1)
  {
    uint64_t v2 = @"None";
    goto LABEL_11;
  }
  char v1 = a1;
  if (a1 == -1)
  {
    uint64_t v2 = @"All";
    goto LABEL_11;
  }
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  uint64_t v4 = v3;
  if (v1)
  {
    [v3 appendString:@"Text,"];
    if ((v1 & 2) == 0)
    {
LABEL_7:
      if ((v1 & 4) == 0) {
        goto LABEL_8;
      }
LABEL_16:
      [v4 appendString:@"VS,"];
      if ((v1 & 8) == 0) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
  }
  else if ((v1 & 2) == 0)
  {
    goto LABEL_7;
  }
  [v4 appendString:@"DD,"];
  if ((v1 & 4) != 0) {
    goto LABEL_16;
  }
LABEL_8:
  if ((v1 & 8) != 0) {
LABEL_9:
  }
    [v4 appendString:@"Subject,"];
LABEL_10:
  uint64_t v5 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@","];
  uint64_t v2 = [v4 stringByTrimmingCharactersInSet:v5];

LABEL_11:
  return v2;
}

id VKMUIStringForStickerRepresentationType(char a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  id v3 = v2;
  if (a1)
  {
    [v2 appendString:@"Still,"];
    if ((a1 & 2) == 0)
    {
LABEL_3:
      if ((a1 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((a1 & 2) == 0)
  {
    goto LABEL_3;
  }
  [v3 appendString:@"Animated,"];
  if ((a1 & 4) != 0) {
LABEL_4:
  }
    [v3 appendString:@"Keyboard,"];
LABEL_5:
  uint64_t v4 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@","];
  uint64_t v5 = [v3 stringByTrimmingCharactersInSet:v4];

  return v5;
}

__CFString *VKMUIStringForAnalyzerRequestSource(unint64_t a1)
{
  if (a1 > 2) {
    return &stru_1F35566F8;
  }
  else {
    return off_1E6BF3A50[a1];
  }
}

__CFString *VKMUIStringForAnalyzerRequestType(unint64_t a1)
{
  if (a1 > 7) {
    return &stru_1F35566F8;
  }
  else {
    return off_1E6BF3A68[a1];
  }
}

__CFString *VKMUIStringForVKAnalyticsEventType(unint64_t a1)
{
  if (a1 > 9) {
    return &stru_1F35566F8;
  }
  else {
    return off_1E6BF3AA8[a1];
  }
}

__CFString *VKMUIStringForVKAnalyticsDDEventType(unint64_t a1)
{
  if (a1 > 4) {
    return &stru_1F35566F8;
  }
  else {
    return off_1E6BF3AF8[a1];
  }
}

__CFString *VKMUIStringForVKAnalyticsSubjectEventType(unint64_t a1)
{
  if (a1 > 2) {
    return &stru_1F35566F8;
  }
  else {
    return off_1E6BF3B20[a1];
  }
}

__CFString *VKMUIStringForVKAnalyticsSubjectInteractionType(unint64_t a1)
{
  if (a1 > 4) {
    return &stru_1F35566F8;
  }
  else {
    return off_1E6BF3B38[a1];
  }
}

__CFString *VKMUIStringForVKAnalyticsQAEventType(unint64_t a1)
{
  if (a1 > 2) {
    return &stru_1F35566F8;
  }
  else {
    return off_1E6BF3B60[a1];
  }
}

__CFString *VKMUIStringForVKAnalyticsTextEventType(unint64_t a1)
{
  if (a1 > 3) {
    return &stru_1F35566F8;
  }
  else {
    return off_1E6BF3B78[a1];
  }
}

__CFString *VKMUIStringForVKAnalyticsEventSource(unint64_t a1)
{
  if (a1 > 5) {
    return &stru_1F35566F8;
  }
  else {
    return off_1E6BF3B98[a1];
  }
}

__CFString *VKMUIStringForVKAnalyticsInteractionEventType(unint64_t a1)
{
  if (a1 > 3) {
    return &stru_1F35566F8;
  }
  else {
    return off_1E6BF3BC8[a1];
  }
}

__CFString *VKMUIStringForVKAnalyticsVisualSearchEventType(unint64_t a1)
{
  if (a1 > 3) {
    return &stru_1F35566F8;
  }
  else {
    return off_1E6BF3BE8[a1];
  }
}

__CFString *VKMUIStringForSubjectRequestStatus(unint64_t a1)
{
  if (a1 > 2) {
    return &stru_1F35566F8;
  }
  else {
    return off_1E6BF3C08[a1];
  }
}

__CFString *VKMUIStringForVKCVSInvocationType(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 4) {
    return @"Unknown";
  }
  else {
    return off_1E6BF3C20[a1 - 1];
  }
}

__CFString *VKMUIStringForBCSParsedDataType(unint64_t a1)
{
  if (a1 > 0xE) {
    return &stru_1F35566F8;
  }
  else {
    return off_1E6BF3C48[a1];
  }
}

void sub_1DB30A588(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB30AB00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB30EB78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB30EDC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB30FF0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__19(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__19(uint64_t a1)
{
}

uint64_t __Block_byref_object_copy__20(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__20(uint64_t a1)
{
}

uint64_t VKMDeviceRGBColorSpace()
{
  if (VKMDeviceRGBColorSpace_sDeviceRGBDispatchOnce != -1) {
    dispatch_once(&VKMDeviceRGBColorSpace_sDeviceRGBDispatchOnce, &__block_literal_global_37);
  }
  return VKMDeviceRGBColorSpace_sDeviceRGBColorSpace;
}

CGColorSpaceRef __VKMDeviceRGBColorSpace_block_invoke()
{
  CGColorSpaceRef result = CGColorSpaceCreateDeviceRGB();
  VKMDeviceRGBColorSpace_sDeviceRGBColorSpace = (uint64_t)result;
  return result;
}

uint64_t VKMDeviceCMYKColorSpace()
{
  if (VKMDeviceCMYKColorSpace_sDeviceCMYKDispatchOnce != -1) {
    dispatch_once(&VKMDeviceCMYKColorSpace_sDeviceCMYKDispatchOnce, &__block_literal_global_2);
  }
  return VKMDeviceCMYKColorSpace_sDeviceCMYKColorSpace;
}

CGColorSpaceRef __VKMDeviceCMYKColorSpace_block_invoke()
{
  CGColorSpaceRef result = CGColorSpaceCreateDeviceCMYK();
  VKMDeviceCMYKColorSpace_sDeviceCMYKColorSpace = (uint64_t)result;
  return result;
}

uint64_t VKMDeviceGrayColorSpace()
{
  if (VKMDeviceGrayColorSpace_sDeviceGrayDispatchOnce != -1) {
    dispatch_once(&VKMDeviceGrayColorSpace_sDeviceGrayDispatchOnce, &__block_literal_global_4);
  }
  return VKMDeviceGrayColorSpace_sDeviceGrayColorSpace;
}

CGColorSpaceRef __VKMDeviceGrayColorSpace_block_invoke()
{
  CGColorSpaceRef result = CGColorSpaceCreateDeviceGray();
  VKMDeviceGrayColorSpace_sDeviceGrayColorSpace = (uint64_t)result;
  return result;
}

CGColorRef VKMCGColorCreateDeviceRGB(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  components[4] = *(CGFloat *)MEMORY[0x1E4F143B8];
  components[0] = a1;
  components[1] = a2;
  components[2] = a3;
  components[3] = a4;
  if (VKMDeviceRGBColorSpace_sDeviceRGBDispatchOnce != -1) {
    dispatch_once(&VKMDeviceRGBColorSpace_sDeviceRGBDispatchOnce, &__block_literal_global_37);
  }
  return CGColorCreate((CGColorSpaceRef)VKMDeviceRGBColorSpace_sDeviceRGBColorSpace, components);
}

CGColorRef VKMCGColorCreateDeviceGray(CGFloat a1, CGFloat a2)
{
  components[2] = *(CGFloat *)MEMORY[0x1E4F143B8];
  components[0] = a1;
  components[1] = a2;
  if (VKMDeviceGrayColorSpace_sDeviceGrayDispatchOnce != -1) {
    dispatch_once(&VKMDeviceGrayColorSpace_sDeviceGrayDispatchOnce, &__block_literal_global_4);
  }
  return CGColorCreate((CGColorSpaceRef)VKMDeviceGrayColorSpace_sDeviceGrayColorSpace, components);
}

CGPatternRef VKMCGPatternCreateWithImageAndTransform(CGImageRef image, long long *a2)
{
  if (!image) {
    +[VKAssert handleFailedAssertWithCondition:"image != ((void *)0)" functionName:"CGPatternRef VKMCGPatternCreateWithImageAndTransform(CGImageRef, const CGAffineTransform *)" simulateCrash:0 showAlert:0 format:@"can't create an image pattern without an image"];
  }
  CGImageRetain(image);
  CGFloat v4 = *MEMORY[0x1E4F1DAD8];
  CGFloat v5 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  size_t Width = CGImageGetWidth(image);
  size_t Height = CGImageGetHeight(image);
  if (a2)
  {
    long long v8 = a2[1];
    long long v13 = *a2;
    long long v14 = v8;
    long long v9 = a2[2];
  }
  else
  {
    long long v10 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    long long v13 = *MEMORY[0x1E4F1DAB8];
    long long v14 = v10;
    long long v9 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  }
  long long v15 = v9;
  v16.size.CGFloat height = (double)Height;
  v16.size.CGFloat width = (double)Width;
  *(_OWORD *)&v12.a = v13;
  *(_OWORD *)&v12.c = v14;
  *(_OWORD *)&v12.tCGFloat x = v9;
  v16.origin.CGFloat x = v4;
  v16.origin.CGFloat y = v5;
  return CGPatternCreate(image, v16, &v12, (double)Width, v16.size.height, kCGPatternTilingConstantSpacing, 1, &VKMCGPatternCreateWithImageAndTransform_sCallbacks);
}

void VKMDrawImageAtOriginInContext(CGImage *a1, CGContext *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F1DAD8];
  uint64_t v5 = *(void *)(MEMORY[0x1E4F1DAD8] + 8);
  double Width = (double)CGImageGetWidth(a1);
  double Height = (double)CGImageGetHeight(a1);
  uint64_t v8 = v4;
  uint64_t v9 = v5;
  double v10 = Width;
  CGContextDrawImage(a2, *(CGRect *)&v8, a1);
}

CGPatternRef VKMCGPatternCreateWithImage(CGImage *a1)
{
  return VKMCGPatternCreateWithImageAndTransform(a1, 0);
}

CGColorRef VKMCGColorCreatePatternWithImageAndTransform(CGImage *a1, long long *a2)
{
  v6[1] = *(CGFloat *)MEMORY[0x1E4F143B8];
  id v2 = VKMCGPatternCreateWithImageAndTransform(a1, a2);
  Pattern = CGColorSpaceCreatePattern(0);
  v6[0] = 1.0;
  CGColorRef v4 = CGColorCreateWithPattern(Pattern, v2, v6);
  CGColorSpaceRelease(Pattern);
  CGPatternRelease(v2);
  return v4;
}

CGColorRef VKMCGColorCreatePatternWithImage(CGImage *a1)
{
  return VKMCGColorCreatePatternWithImageAndTransform(a1, 0);
}

uint64_t VKMHSBFromCGColorRef(CGColorRef color, double *a2, double *a3, double *a4, CGFloat *a5)
{
  *a5 = 0.0;
  *a4 = 0.0;
  *a3 = 0.0;
  *a2 = 0.0;
  if (!color) {
    +[VKAssert handleFailedAssertWithCondition:"color" functionName:"BOOL VKMHSBFromCGColorRef(CGColorRef, CGFloat *, CGFloat *, CGFloat *, CGFloat *)" simulateCrash:0 showAlert:0 format:@"NULL color"];
  }
  ColorSpace = CGColorGetColorSpace(color);
  if (CGColorSpaceGetModel(ColorSpace) != kCGColorSpaceModelRGB || CGColorGetNumberOfComponents(color) != 4) {
    return 0;
  }
  *a5 = CGColorGetAlpha(color);
  Components = CGColorGetComponents(color);
  VKMRGBToHSB(a2, a3, a4, *Components, Components[1], Components[2]);
  return 1;
}

double VKMRGBToHSB(double *a1, double *a2, double *a3, double a4, double a5, double a6)
{
  if (a4 < a5 || a4 < a6)
  {
    if (a5 >= a4) {
      double v7 = a4;
    }
    else {
      double v7 = a5;
    }
    if (a4 >= a6) {
      double v8 = a6;
    }
    else {
      double v8 = a4;
    }
    BOOL v9 = a5 < a4 || a5 < a6;
    if (v9) {
      double v10 = a6;
    }
    else {
      double v10 = a5;
    }
    if (v9) {
      double v11 = v7;
    }
    else {
      double v11 = v8;
    }
  }
  else
  {
    if (a5 >= a6) {
      double v11 = a6;
    }
    else {
      double v11 = a5;
    }
    double v10 = a4;
  }
  double v12 = 0.0;
  if (v10 <= 0.0)
  {
    double v14 = 0.0;
  }
  else
  {
    double v13 = v10 - v11;
    double v14 = (v10 - v11) / v10;
    if (v14 != 0.0)
    {
      double v15 = (v10 - a5) / v13;
      double v16 = (v10 - a6) / v13;
      if (v10 == a4)
      {
        if (v11 == a5) {
          double v12 = v16 + 5.0;
        }
        else {
          double v12 = 1.0 - v15;
        }
      }
      else
      {
        BOOL v18 = v10 == a5;
        double v19 = (v10 - a4) / v13;
        if (v18)
        {
          if (v11 == a6) {
            double v12 = v19 + 1.0;
          }
          else {
            double v12 = 3.0 - v16;
          }
        }
        else if (v11 == a4)
        {
          double v12 = v15 + 3.0;
        }
        else
        {
          double v12 = 5.0 - v19;
        }
      }
    }
  }
  *a3 = v10;
  double result = v12 / 6.0;
  *a1 = v12 / 6.0;
  *a2 = v14;
  return result;
}

double *VKMHSBToRGB(double *result, double *a2, double *a3, double a4, double a5, double a6)
{
  double v6 = a4 * 6.0;
  BOOL v7 = a4 == 1.0;
  double v8 = 0.0;
  if (!v7) {
    double v8 = v6;
  }
  uint64_t v9 = (uint64_t)v8;
  double v10 = v8 - (double)(uint64_t)v8;
  double v11 = (1.0 - a5) * a6;
  double v12 = (1.0 - a5 * v10) * a6;
  double v13 = (1.0 - a5 * (1.0 - v10)) * a6;
  double v14 = a6;
  double v15 = v13;
  switch(v9)
  {
    case 0:
      goto LABEL_10;
    case 1:
      double v14 = v12;
      double v15 = a6;
      goto LABEL_10;
    case 2:
      double v14 = v11;
      double v15 = a6;
      double v11 = v13;
      goto LABEL_10;
    case 3:
      double v14 = v11;
      double v15 = v12;
      goto LABEL_8;
    case 4:
      double v14 = v13;
      double v15 = v11;
LABEL_8:
      double v11 = a6;
      goto LABEL_10;
    case 5:
      double v14 = a6;
      double v15 = v11;
      double v11 = v12;
LABEL_10:
      CGAffineTransform *result = v14;
      *a2 = v15;
      *a3 = v11;
      break;
    default:
      return result;
  }
  return result;
}

double VKMCMYKToRGB(double *a1, double *a2, double *a3, double a4, double a5, double a6, double a7)
{
  *a1 = 1.0 - fmin(a7 + a4 * (1.0 - a7), 1.0);
  *a2 = 1.0 - fmin(a7 + a5 * (1.0 - a7), 1.0);
  double result = 1.0 - fmin(a7 + a6 * (1.0 - a7), 1.0);
  *a3 = result;
  return result;
}

BOOL VKMColorIsBlack(CGColor *a1)
{
  ColorSpace = CGColorGetColorSpace(a1);
  CGColorSpaceModel Model = CGColorSpaceGetModel(ColorSpace);
  Components = CGColorGetComponents(a1);
  double v5 = 0.0;
  if (Model)
  {
    if (Model == kCGColorSpaceModelCMYK)
    {
      Components += 3;
      double v5 = 1.0;
    }
    else
    {
      if (Model != kCGColorSpaceModelRGB || *Components != 0.0 || Components[1] != 0.0) {
        return 0;
      }
      Components += 2;
    }
  }
  return *Components == v5;
}

CGFloat VKMColorLightness(CGColor *a1)
{
  ColorSpace = CGColorGetColorSpace(a1);
  CGColorSpaceModel Model = CGColorSpaceGetModel(ColorSpace);
  switch(Model)
  {
    case kCGColorSpaceModelMonochrome:
      return *CGColorGetComponents(a1);
    case kCGColorSpaceModelCMYK:
      Components = CGColorGetComponents(a1);
      double v8 = Components[3];
      double v9 = 1.0 - fmin(v8 + *Components * (1.0 - v8), 1.0);
      double v10 = 1.0 - fmin(v8 + Components[1] * (1.0 - v8), 1.0);
      double v11 = 1.0 - fmin(v8 + Components[2] * (1.0 - v8), 1.0);
      double v5 = fmax(fmax(v9, v10), v11) + fmin(fmin(v9, v10), v11);
      return v5 * 0.5;
    case kCGColorSpaceModelRGB:
      CGColorRef v4 = CGColorGetComponents(a1);
      double v5 = fmax(fmax(*v4, v4[1]), v4[2]) + fmin(fmin(*v4, v4[1]), v4[2]);
      return v5 * 0.5;
  }
  NSLog(&cfstr_WarningTesting.isa);
  return 0.0;
}

CGContext *VKMCreateRGBABitmapContext(int a1, double a2, CGFloat a3, CGFloat a4)
{
  if (VKMDeviceRGBColorSpace_sDeviceRGBDispatchOnce != -1) {
    dispatch_once(&VKMDeviceRGBColorSpace_sDeviceRGBDispatchOnce, &__block_literal_global_37);
  }
  double v8 = CGBitmapContextCreate(0, (unint64_t)(a2 * a4), (unint64_t)(a3 * a4), 8uLL, (4 * (unint64_t)(a2 * a4) + 31) & 0xFFFFFFFFFFFFFFE0, (CGColorSpaceRef)VKMDeviceRGBColorSpace_sDeviceRGBColorSpace, 0x2002u);
  CGAffineTransformMakeScale(&transform, a4, a4);
  CGContextConcatCTM(v8, &transform);
  if (a1)
  {
    CGContextTranslateCTM(v8, 0.0, a3);
    CGAffineTransformMakeScale(&v10, 1.0, -1.0);
    CGContextConcatCTM(v8, &v10);
  }
  return v8;
}

unint64_t VKMBitmapGetAlignedBytesPerRow(uint64_t a1)
{
  return (a1 + 31) & 0xFFFFFFFFFFFFFFE0;
}

CGColorRef VKMCreateCheckerBoardColor(CGColor *a1, CGColor *a2, CGFloat a3, CGFloat a4)
{
  double v8 = a3 + a3;
  double v9 = a4 + a4;
  CGAffineTransform v10 = VKMCreateRGBABitmapContext(0, a3 + a3, a4 + a4, 1.0);
  if (!v10) {
    return 0;
  }
  double v11 = v10;
  CGContextSetFillColorWithColor(v10, a1);
  v15.origin.CGFloat x = 0.0;
  v15.origin.CGFloat y = 0.0;
  v15.size.CGFloat width = v8;
  v15.size.CGFloat height = v9;
  CGContextFillRect(v11, v15);
  CGContextSetFillColorWithColor(v11, a2);
  v16.origin.CGFloat x = 0.0;
  v16.origin.CGFloat y = 0.0;
  v16.size.CGFloat width = a3;
  v16.size.CGFloat height = a4;
  CGContextFillRect(v11, v16);
  v17.origin.CGFloat x = a3;
  v17.origin.CGFloat y = a4;
  v17.size.CGFloat width = a3;
  v17.size.CGFloat height = a4;
  CGContextFillRect(v11, v17);
  Image = CGBitmapContextCreateImage(v11);
  CGContextRelease(v11);
  if (!Image) {
    return 0;
  }
  CGColorRef PatternWithImageAndTransform = VKMCGColorCreatePatternWithImageAndTransform(Image, 0);
  CGImageRelease(Image);
  return PatternWithImageAndTransform;
}

id getkDDRVInteractionDidFinishNotification_0()
{
  uint64_t v5 = 0;
  double v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getkDDRVInteractionDidFinishNotificationSymbolLoc_ptr_0;
  uint64_t v8 = getkDDRVInteractionDidFinishNotificationSymbolLoc_ptr_0;
  if (!getkDDRVInteractionDidFinishNotificationSymbolLoc_ptr_0)
  {
    char v1 = (void *)DataDetectorsUILibrary_4();
    v6[3] = (uint64_t)dlsym(v1, "kDDRVInteractionDidFinishNotification");
    getkDDRVInteractionDidFinishNotificationSymbolLoc_ptr_0 = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    CGColorRef v4 = (_Unwind_Exception *)getkDDRVInteractionDidFinishNotification_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  id v2 = *v0;
  return v2;
}

void sub_1DB311C2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id getDDRevealBridgeClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getDDRevealBridgeClass_softClass_0;
  uint64_t v7 = getDDRevealBridgeClass_softClass_0;
  if (!getDDRevealBridgeClass_softClass_0)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    double v3[2] = __getDDRevealBridgeClass_block_invoke_0;
    v3[3] = &unk_1E6BF0A90;
    v3[4] = &v4;
    __getDDRevealBridgeClass_block_invoke_0((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1DB31216C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB312988(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DB314B18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void *__getkDDRVInteractionDidFinishNotificationSymbolLoc_block_invoke_0(uint64_t a1)
{
  id v2 = (void *)DataDetectorsUILibrary_4();
  double result = dlsym(v2, "kDDRVInteractionDidFinishNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkDDRVInteractionDidFinishNotificationSymbolLoc_ptr_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t DataDetectorsUILibrary_4()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!DataDetectorsUILibraryCore_frameworkLibrary_4)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    double v3[2] = 3221225472;
    v3[3] = __DataDetectorsUILibraryCore_block_invoke_4;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E6BF3E68;
    uint64_t v5 = 0;
    DataDetectorsUILibraryCore_frameworkLibrary_4 = _sl_dlopen();
  }
  uint64_t v0 = DataDetectorsUILibraryCore_frameworkLibrary_4;
  id v1 = (void *)v3[0];
  if (!DataDetectorsUILibraryCore_frameworkLibrary_4)
  {
    id v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __DataDetectorsUILibraryCore_block_invoke_4()
{
  uint64_t result = _sl_dlopen();
  DataDetectorsUILibraryCore_frameworkLibrary_4 = result;
  return result;
}

VKCFormRegion *__getDDRevealBridgeClass_block_invoke_0(uint64_t a1)
{
  DataDetectorsUILibrary_4();
  uint64_t result = (VKCFormRegion *)objc_getClass("DDRevealBridge");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getDDRevealBridgeClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    id v3 = (VKCFormRegion *)__getDDRevealBridgeClass_block_invoke_cold_1();
    return [(VKCFormRegion *)v3 initWithSourceRegion:v5];
  }
  return result;
}

id getAFTextContentTypeNone()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getAFTextContentTypeNoneSymbolLoc_ptr;
  uint64_t v8 = getAFTextContentTypeNoneSymbolLoc_ptr;
  if (!getAFTextContentTypeNoneSymbolLoc_ptr)
  {
    id v1 = (void *)AutoFillCoreLibrary();
    v6[3] = (uint64_t)dlsym(v1, "AFTextContentTypeNone");
    getAFTextContentTypeNoneSymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    SEL v4 = (_Unwind_Exception *)getkDDRVInteractionDidFinishNotification_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  id v2 = *v0;
  return v2;
}

id getAFTextContentTypeName()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getAFTextContentTypeNameSymbolLoc_ptr;
  uint64_t v8 = getAFTextContentTypeNameSymbolLoc_ptr;
  if (!getAFTextContentTypeNameSymbolLoc_ptr)
  {
    id v1 = (void *)AutoFillCoreLibrary();
    v6[3] = (uint64_t)dlsym(v1, "AFTextContentTypeName");
    getAFTextContentTypeNameSymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    SEL v4 = (_Unwind_Exception *)getkDDRVInteractionDidFinishNotification_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  id v2 = *v0;
  return v2;
}

id getAFTextContentTypeNamePrefix()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getAFTextContentTypeNamePrefixSymbolLoc_ptr;
  uint64_t v8 = getAFTextContentTypeNamePrefixSymbolLoc_ptr;
  if (!getAFTextContentTypeNamePrefixSymbolLoc_ptr)
  {
    id v1 = (void *)AutoFillCoreLibrary();
    v6[3] = (uint64_t)dlsym(v1, "AFTextContentTypeNamePrefix");
    getAFTextContentTypeNamePrefixSymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    SEL v4 = (_Unwind_Exception *)getkDDRVInteractionDidFinishNotification_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  id v2 = *v0;
  return v2;
}

id getAFTextContentTypeGivenName()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getAFTextContentTypeGivenNameSymbolLoc_ptr;
  uint64_t v8 = getAFTextContentTypeGivenNameSymbolLoc_ptr;
  if (!getAFTextContentTypeGivenNameSymbolLoc_ptr)
  {
    id v1 = (void *)AutoFillCoreLibrary();
    v6[3] = (uint64_t)dlsym(v1, "AFTextContentTypeGivenName");
    getAFTextContentTypeGivenNameSymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    SEL v4 = (_Unwind_Exception *)getkDDRVInteractionDidFinishNotification_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  id v2 = *v0;
  return v2;
}

id getAFTextContentTypeMiddleName()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getAFTextContentTypeMiddleNameSymbolLoc_ptr;
  uint64_t v8 = getAFTextContentTypeMiddleNameSymbolLoc_ptr;
  if (!getAFTextContentTypeMiddleNameSymbolLoc_ptr)
  {
    id v1 = (void *)AutoFillCoreLibrary();
    v6[3] = (uint64_t)dlsym(v1, "AFTextContentTypeMiddleName");
    getAFTextContentTypeMiddleNameSymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    SEL v4 = (_Unwind_Exception *)getkDDRVInteractionDidFinishNotification_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  id v2 = *v0;
  return v2;
}

id getAFTextContentTypeFamilyName()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getAFTextContentTypeFamilyNameSymbolLoc_ptr;
  uint64_t v8 = getAFTextContentTypeFamilyNameSymbolLoc_ptr;
  if (!getAFTextContentTypeFamilyNameSymbolLoc_ptr)
  {
    id v1 = (void *)AutoFillCoreLibrary();
    v6[3] = (uint64_t)dlsym(v1, "AFTextContentTypeFamilyName");
    getAFTextContentTypeFamilyNameSymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    SEL v4 = (_Unwind_Exception *)getkDDRVInteractionDidFinishNotification_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  id v2 = *v0;
  return v2;
}

id getAFTextContentTypeNameSuffix()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getAFTextContentTypeNameSuffixSymbolLoc_ptr;
  uint64_t v8 = getAFTextContentTypeNameSuffixSymbolLoc_ptr;
  if (!getAFTextContentTypeNameSuffixSymbolLoc_ptr)
  {
    id v1 = (void *)AutoFillCoreLibrary();
    v6[3] = (uint64_t)dlsym(v1, "AFTextContentTypeNameSuffix");
    getAFTextContentTypeNameSuffixSymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    SEL v4 = (_Unwind_Exception *)getkDDRVInteractionDidFinishNotification_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  id v2 = *v0;
  return v2;
}

id getAFTextContentTypeNickname()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getAFTextContentTypeNicknameSymbolLoc_ptr;
  uint64_t v8 = getAFTextContentTypeNicknameSymbolLoc_ptr;
  if (!getAFTextContentTypeNicknameSymbolLoc_ptr)
  {
    id v1 = (void *)AutoFillCoreLibrary();
    v6[3] = (uint64_t)dlsym(v1, "AFTextContentTypeNickname");
    getAFTextContentTypeNicknameSymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    SEL v4 = (_Unwind_Exception *)getkDDRVInteractionDidFinishNotification_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  id v2 = *v0;
  return v2;
}

id getAFTextContentTypeJobTitle()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getAFTextContentTypeJobTitleSymbolLoc_ptr;
  uint64_t v8 = getAFTextContentTypeJobTitleSymbolLoc_ptr;
  if (!getAFTextContentTypeJobTitleSymbolLoc_ptr)
  {
    id v1 = (void *)AutoFillCoreLibrary();
    v6[3] = (uint64_t)dlsym(v1, "AFTextContentTypeJobTitle");
    getAFTextContentTypeJobTitleSymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    SEL v4 = (_Unwind_Exception *)getkDDRVInteractionDidFinishNotification_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  id v2 = *v0;
  return v2;
}

id getAFTextContentTypeOrganizationName()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getAFTextContentTypeOrganizationNameSymbolLoc_ptr;
  uint64_t v8 = getAFTextContentTypeOrganizationNameSymbolLoc_ptr;
  if (!getAFTextContentTypeOrganizationNameSymbolLoc_ptr)
  {
    id v1 = (void *)AutoFillCoreLibrary();
    v6[3] = (uint64_t)dlsym(v1, "AFTextContentTypeOrganizationName");
    getAFTextContentTypeOrganizationNameSymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    SEL v4 = (_Unwind_Exception *)getkDDRVInteractionDidFinishNotification_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  id v2 = *v0;
  return v2;
}

id getAFTextContentTypeLocation()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getAFTextContentTypeLocationSymbolLoc_ptr;
  uint64_t v8 = getAFTextContentTypeLocationSymbolLoc_ptr;
  if (!getAFTextContentTypeLocationSymbolLoc_ptr)
  {
    id v1 = (void *)AutoFillCoreLibrary();
    v6[3] = (uint64_t)dlsym(v1, "AFTextContentTypeLocation");
    getAFTextContentTypeLocationSymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    SEL v4 = (_Unwind_Exception *)getkDDRVInteractionDidFinishNotification_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  id v2 = *v0;
  return v2;
}

id getAFTextContentTypeFullStreetAddress()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getAFTextContentTypeFullStreetAddressSymbolLoc_ptr;
  uint64_t v8 = getAFTextContentTypeFullStreetAddressSymbolLoc_ptr;
  if (!getAFTextContentTypeFullStreetAddressSymbolLoc_ptr)
  {
    id v1 = (void *)AutoFillCoreLibrary();
    v6[3] = (uint64_t)dlsym(v1, "AFTextContentTypeFullStreetAddress");
    getAFTextContentTypeFullStreetAddressSymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    SEL v4 = (_Unwind_Exception *)getkDDRVInteractionDidFinishNotification_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  id v2 = *v0;
  return v2;
}

id getAFTextContentTypeStreetAddressLine1()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getAFTextContentTypeStreetAddressLine1SymbolLoc_ptr;
  uint64_t v8 = getAFTextContentTypeStreetAddressLine1SymbolLoc_ptr;
  if (!getAFTextContentTypeStreetAddressLine1SymbolLoc_ptr)
  {
    id v1 = (void *)AutoFillCoreLibrary();
    v6[3] = (uint64_t)dlsym(v1, "AFTextContentTypeStreetAddressLine1");
    getAFTextContentTypeStreetAddressLine1SymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    SEL v4 = (_Unwind_Exception *)getkDDRVInteractionDidFinishNotification_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  id v2 = *v0;
  return v2;
}

id getAFTextContentTypeStreetAddressLine2()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getAFTextContentTypeStreetAddressLine2SymbolLoc_ptr;
  uint64_t v8 = getAFTextContentTypeStreetAddressLine2SymbolLoc_ptr;
  if (!getAFTextContentTypeStreetAddressLine2SymbolLoc_ptr)
  {
    id v1 = (void *)AutoFillCoreLibrary();
    v6[3] = (uint64_t)dlsym(v1, "AFTextContentTypeStreetAddressLine2");
    getAFTextContentTypeStreetAddressLine2SymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    SEL v4 = (_Unwind_Exception *)getkDDRVInteractionDidFinishNotification_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  id v2 = *v0;
  return v2;
}

id getAFTextContentTypeAddressCity()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getAFTextContentTypeAddressCitySymbolLoc_ptr;
  uint64_t v8 = getAFTextContentTypeAddressCitySymbolLoc_ptr;
  if (!getAFTextContentTypeAddressCitySymbolLoc_ptr)
  {
    id v1 = (void *)AutoFillCoreLibrary();
    v6[3] = (uint64_t)dlsym(v1, "AFTextContentTypeAddressCity");
    getAFTextContentTypeAddressCitySymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    SEL v4 = (_Unwind_Exception *)getkDDRVInteractionDidFinishNotification_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  id v2 = *v0;
  return v2;
}

id getAFTextContentTypeAddressState()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getAFTextContentTypeAddressStateSymbolLoc_ptr;
  uint64_t v8 = getAFTextContentTypeAddressStateSymbolLoc_ptr;
  if (!getAFTextContentTypeAddressStateSymbolLoc_ptr)
  {
    id v1 = (void *)AutoFillCoreLibrary();
    v6[3] = (uint64_t)dlsym(v1, "AFTextContentTypeAddressState");
    getAFTextContentTypeAddressStateSymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    SEL v4 = (_Unwind_Exception *)getkDDRVInteractionDidFinishNotification_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  id v2 = *v0;
  return v2;
}

id getAFTextContentTypeAddressCityAndState()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getAFTextContentTypeAddressCityAndStateSymbolLoc_ptr;
  uint64_t v8 = getAFTextContentTypeAddressCityAndStateSymbolLoc_ptr;
  if (!getAFTextContentTypeAddressCityAndStateSymbolLoc_ptr)
  {
    id v1 = (void *)AutoFillCoreLibrary();
    v6[3] = (uint64_t)dlsym(v1, "AFTextContentTypeAddressCityAndState");
    getAFTextContentTypeAddressCityAndStateSymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    SEL v4 = (_Unwind_Exception *)getkDDRVInteractionDidFinishNotification_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  id v2 = *v0;
  return v2;
}

id getAFTextContentTypeCountryName()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getAFTextContentTypeCountryNameSymbolLoc_ptr;
  uint64_t v8 = getAFTextContentTypeCountryNameSymbolLoc_ptr;
  if (!getAFTextContentTypeCountryNameSymbolLoc_ptr)
  {
    id v1 = (void *)AutoFillCoreLibrary();
    v6[3] = (uint64_t)dlsym(v1, "AFTextContentTypeCountryName");
    getAFTextContentTypeCountryNameSymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    SEL v4 = (_Unwind_Exception *)getkDDRVInteractionDidFinishNotification_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  id v2 = *v0;
  return v2;
}

id getAFTextContentTypePostalCode()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getAFTextContentTypePostalCodeSymbolLoc_ptr;
  uint64_t v8 = getAFTextContentTypePostalCodeSymbolLoc_ptr;
  if (!getAFTextContentTypePostalCodeSymbolLoc_ptr)
  {
    id v1 = (void *)AutoFillCoreLibrary();
    v6[3] = (uint64_t)dlsym(v1, "AFTextContentTypePostalCode");
    getAFTextContentTypePostalCodeSymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    SEL v4 = (_Unwind_Exception *)getkDDRVInteractionDidFinishNotification_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  id v2 = *v0;
  return v2;
}

id getAFTextContentTypeEmailAddress()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getAFTextContentTypeEmailAddressSymbolLoc_ptr;
  uint64_t v8 = getAFTextContentTypeEmailAddressSymbolLoc_ptr;
  if (!getAFTextContentTypeEmailAddressSymbolLoc_ptr)
  {
    id v1 = (void *)AutoFillCoreLibrary();
    v6[3] = (uint64_t)dlsym(v1, "AFTextContentTypeEmailAddress");
    getAFTextContentTypeEmailAddressSymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    SEL v4 = (_Unwind_Exception *)getkDDRVInteractionDidFinishNotification_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  id v2 = *v0;
  return v2;
}

id getAFTextContentTypeURL()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getAFTextContentTypeURLSymbolLoc_ptr;
  uint64_t v8 = getAFTextContentTypeURLSymbolLoc_ptr;
  if (!getAFTextContentTypeURLSymbolLoc_ptr)
  {
    id v1 = (void *)AutoFillCoreLibrary();
    v6[3] = (uint64_t)dlsym(v1, "AFTextContentTypeURL");
    getAFTextContentTypeURLSymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    SEL v4 = (_Unwind_Exception *)getkDDRVInteractionDidFinishNotification_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  id v2 = *v0;
  return v2;
}

id getAFTextContentTypePassword()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getAFTextContentTypePasswordSymbolLoc_ptr;
  uint64_t v8 = getAFTextContentTypePasswordSymbolLoc_ptr;
  if (!getAFTextContentTypePasswordSymbolLoc_ptr)
  {
    id v1 = (void *)AutoFillCoreLibrary();
    v6[3] = (uint64_t)dlsym(v1, "AFTextContentTypePassword");
    getAFTextContentTypePasswordSymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    SEL v4 = (_Unwind_Exception *)getkDDRVInteractionDidFinishNotification_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  id v2 = *v0;
  return v2;
}

id getAFTextContentTypeCreditCardName()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getAFTextContentTypeCreditCardNameSymbolLoc_ptr;
  uint64_t v8 = getAFTextContentTypeCreditCardNameSymbolLoc_ptr;
  if (!getAFTextContentTypeCreditCardNameSymbolLoc_ptr)
  {
    id v1 = (void *)AutoFillCoreLibrary();
    v6[3] = (uint64_t)dlsym(v1, "AFTextContentTypeCreditCardName");
    getAFTextContentTypeCreditCardNameSymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    SEL v4 = (_Unwind_Exception *)getkDDRVInteractionDidFinishNotification_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  id v2 = *v0;
  return v2;
}

id getAFTextContentTypeCreditCardGivenName()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getAFTextContentTypeCreditCardGivenNameSymbolLoc_ptr;
  uint64_t v8 = getAFTextContentTypeCreditCardGivenNameSymbolLoc_ptr;
  if (!getAFTextContentTypeCreditCardGivenNameSymbolLoc_ptr)
  {
    id v1 = (void *)AutoFillCoreLibrary();
    v6[3] = (uint64_t)dlsym(v1, "AFTextContentTypeCreditCardGivenName");
    getAFTextContentTypeCreditCardGivenNameSymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    SEL v4 = (_Unwind_Exception *)getkDDRVInteractionDidFinishNotification_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  id v2 = *v0;
  return v2;
}

id getAFTextContentTypeCreditCardMiddleName()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getAFTextContentTypeCreditCardMiddleNameSymbolLoc_ptr;
  uint64_t v8 = getAFTextContentTypeCreditCardMiddleNameSymbolLoc_ptr;
  if (!getAFTextContentTypeCreditCardMiddleNameSymbolLoc_ptr)
  {
    id v1 = (void *)AutoFillCoreLibrary();
    v6[3] = (uint64_t)dlsym(v1, "AFTextContentTypeCreditCardMiddleName");
    getAFTextContentTypeCreditCardMiddleNameSymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    SEL v4 = (_Unwind_Exception *)getkDDRVInteractionDidFinishNotification_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  id v2 = *v0;
  return v2;
}

id getAFTextContentTypeCreditCardFamilyName()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getAFTextContentTypeCreditCardFamilyNameSymbolLoc_ptr;
  uint64_t v8 = getAFTextContentTypeCreditCardFamilyNameSymbolLoc_ptr;
  if (!getAFTextContentTypeCreditCardFamilyNameSymbolLoc_ptr)
  {
    id v1 = (void *)AutoFillCoreLibrary();
    v6[3] = (uint64_t)dlsym(v1, "AFTextContentTypeCreditCardFamilyName");
    getAFTextContentTypeCreditCardFamilyNameSymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    SEL v4 = (_Unwind_Exception *)getkDDRVInteractionDidFinishNotification_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  id v2 = *v0;
  return v2;
}

id getAFTextContentTypeCreditCardNumber()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getAFTextContentTypeCreditCardNumberSymbolLoc_ptr;
  uint64_t v8 = getAFTextContentTypeCreditCardNumberSymbolLoc_ptr;
  if (!getAFTextContentTypeCreditCardNumberSymbolLoc_ptr)
  {
    id v1 = (void *)AutoFillCoreLibrary();
    v6[3] = (uint64_t)dlsym(v1, "AFTextContentTypeCreditCardNumber");
    getAFTextContentTypeCreditCardNumberSymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    SEL v4 = (_Unwind_Exception *)getkDDRVInteractionDidFinishNotification_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  id v2 = *v0;
  return v2;
}

id getAFTextContentTypeCreditCardExpiration()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getAFTextContentTypeCreditCardExpirationSymbolLoc_ptr;
  uint64_t v8 = getAFTextContentTypeCreditCardExpirationSymbolLoc_ptr;
  if (!getAFTextContentTypeCreditCardExpirationSymbolLoc_ptr)
  {
    id v1 = (void *)AutoFillCoreLibrary();
    v6[3] = (uint64_t)dlsym(v1, "AFTextContentTypeCreditCardExpiration");
    getAFTextContentTypeCreditCardExpirationSymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    SEL v4 = (_Unwind_Exception *)getkDDRVInteractionDidFinishNotification_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  id v2 = *v0;
  return v2;
}

id getAFTextContentTypeCreditCardExpirationMonth()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getAFTextContentTypeCreditCardExpirationMonthSymbolLoc_ptr;
  uint64_t v8 = getAFTextContentTypeCreditCardExpirationMonthSymbolLoc_ptr;
  if (!getAFTextContentTypeCreditCardExpirationMonthSymbolLoc_ptr)
  {
    id v1 = (void *)AutoFillCoreLibrary();
    v6[3] = (uint64_t)dlsym(v1, "AFTextContentTypeCreditCardExpirationMonth");
    getAFTextContentTypeCreditCardExpirationMonthSymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    SEL v4 = (_Unwind_Exception *)getkDDRVInteractionDidFinishNotification_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  id v2 = *v0;
  return v2;
}

id getAFTextContentTypeCreditCardExpirationYear()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getAFTextContentTypeCreditCardExpirationYearSymbolLoc_ptr;
  uint64_t v8 = getAFTextContentTypeCreditCardExpirationYearSymbolLoc_ptr;
  if (!getAFTextContentTypeCreditCardExpirationYearSymbolLoc_ptr)
  {
    id v1 = (void *)AutoFillCoreLibrary();
    v6[3] = (uint64_t)dlsym(v1, "AFTextContentTypeCreditCardExpirationYear");
    getAFTextContentTypeCreditCardExpirationYearSymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    SEL v4 = (_Unwind_Exception *)getkDDRVInteractionDidFinishNotification_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  id v2 = *v0;
  return v2;
}

id getAFTextContentTypeCreditCardSecurityCode()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getAFTextContentTypeCreditCardSecurityCodeSymbolLoc_ptr;
  uint64_t v8 = getAFTextContentTypeCreditCardSecurityCodeSymbolLoc_ptr;
  if (!getAFTextContentTypeCreditCardSecurityCodeSymbolLoc_ptr)
  {
    id v1 = (void *)AutoFillCoreLibrary();
    v6[3] = (uint64_t)dlsym(v1, "AFTextContentTypeCreditCardSecurityCode");
    getAFTextContentTypeCreditCardSecurityCodeSymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    SEL v4 = (_Unwind_Exception *)getkDDRVInteractionDidFinishNotification_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  id v2 = *v0;
  return v2;
}

id getAFTextContentTypeCreditCardType()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getAFTextContentTypeCreditCardTypeSymbolLoc_ptr;
  uint64_t v8 = getAFTextContentTypeCreditCardTypeSymbolLoc_ptr;
  if (!getAFTextContentTypeCreditCardTypeSymbolLoc_ptr)
  {
    id v1 = (void *)AutoFillCoreLibrary();
    v6[3] = (uint64_t)dlsym(v1, "AFTextContentTypeCreditCardType");
    getAFTextContentTypeCreditCardTypeSymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    SEL v4 = (_Unwind_Exception *)getkDDRVInteractionDidFinishNotification_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  id v2 = *v0;
  return v2;
}

id getAFTextContentTypeBirthdate()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getAFTextContentTypeBirthdateSymbolLoc_ptr;
  uint64_t v8 = getAFTextContentTypeBirthdateSymbolLoc_ptr;
  if (!getAFTextContentTypeBirthdateSymbolLoc_ptr)
  {
    id v1 = (void *)AutoFillCoreLibrary();
    v6[3] = (uint64_t)dlsym(v1, "AFTextContentTypeBirthdate");
    getAFTextContentTypeBirthdateSymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    SEL v4 = (_Unwind_Exception *)getkDDRVInteractionDidFinishNotification_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  id v2 = *v0;
  return v2;
}

id getAFTextContentTypeBirthdateDay()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getAFTextContentTypeBirthdateDaySymbolLoc_ptr;
  uint64_t v8 = getAFTextContentTypeBirthdateDaySymbolLoc_ptr;
  if (!getAFTextContentTypeBirthdateDaySymbolLoc_ptr)
  {
    id v1 = (void *)AutoFillCoreLibrary();
    v6[3] = (uint64_t)dlsym(v1, "AFTextContentTypeBirthdateDay");
    getAFTextContentTypeBirthdateDaySymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    SEL v4 = (_Unwind_Exception *)getkDDRVInteractionDidFinishNotification_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  id v2 = *v0;
  return v2;
}

id getAFTextContentTypeBirthdateMonth()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getAFTextContentTypeBirthdateMonthSymbolLoc_ptr;
  uint64_t v8 = getAFTextContentTypeBirthdateMonthSymbolLoc_ptr;
  if (!getAFTextContentTypeBirthdateMonthSymbolLoc_ptr)
  {
    id v1 = (void *)AutoFillCoreLibrary();
    v6[3] = (uint64_t)dlsym(v1, "AFTextContentTypeBirthdateMonth");
    getAFTextContentTypeBirthdateMonthSymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    SEL v4 = (_Unwind_Exception *)getkDDRVInteractionDidFinishNotification_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  id v2 = *v0;
  return v2;
}

id getAFTextContentTypeBirthdateYear()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getAFTextContentTypeBirthdateYearSymbolLoc_ptr;
  uint64_t v8 = getAFTextContentTypeBirthdateYearSymbolLoc_ptr;
  if (!getAFTextContentTypeBirthdateYearSymbolLoc_ptr)
  {
    id v1 = (void *)AutoFillCoreLibrary();
    v6[3] = (uint64_t)dlsym(v1, "AFTextContentTypeBirthdateYear");
    getAFTextContentTypeBirthdateYearSymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    SEL v4 = (_Unwind_Exception *)getkDDRVInteractionDidFinishNotification_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  id v2 = *v0;
  return v2;
}

id getAFTextContentTypeTelephoneNumber()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getAFTextContentTypeTelephoneNumberSymbolLoc_ptr;
  uint64_t v8 = getAFTextContentTypeTelephoneNumberSymbolLoc_ptr;
  if (!getAFTextContentTypeTelephoneNumberSymbolLoc_ptr)
  {
    id v1 = (void *)AutoFillCoreLibrary();
    v6[3] = (uint64_t)dlsym(v1, "AFTextContentTypeTelephoneNumber");
    getAFTextContentTypeTelephoneNumberSymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    SEL v4 = (_Unwind_Exception *)getkDDRVInteractionDidFinishNotification_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  id v2 = *v0;
  return v2;
}

id getAFTextContentTypeTelephoneCountryCode()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getAFTextContentTypeTelephoneCountryCodeSymbolLoc_ptr;
  uint64_t v8 = getAFTextContentTypeTelephoneCountryCodeSymbolLoc_ptr;
  if (!getAFTextContentTypeTelephoneCountryCodeSymbolLoc_ptr)
  {
    id v1 = (void *)AutoFillCoreLibrary();
    v6[3] = (uint64_t)dlsym(v1, "AFTextContentTypeTelephoneCountryCode");
    getAFTextContentTypeTelephoneCountryCodeSymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    SEL v4 = (_Unwind_Exception *)getkDDRVInteractionDidFinishNotification_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  id v2 = *v0;
  return v2;
}

id getAFTextContentTypeTelephoneNationalNumber()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getAFTextContentTypeTelephoneNationalNumberSymbolLoc_ptr;
  uint64_t v8 = getAFTextContentTypeTelephoneNationalNumberSymbolLoc_ptr;
  if (!getAFTextContentTypeTelephoneNationalNumberSymbolLoc_ptr)
  {
    id v1 = (void *)AutoFillCoreLibrary();
    v6[3] = (uint64_t)dlsym(v1, "AFTextContentTypeTelephoneNationalNumber");
    getAFTextContentTypeTelephoneNationalNumberSymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    SEL v4 = (_Unwind_Exception *)getkDDRVInteractionDidFinishNotification_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  id v2 = *v0;
  return v2;
}

id getAFTextContentTypeTelephoneAreaCode()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getAFTextContentTypeTelephoneAreaCodeSymbolLoc_ptr;
  uint64_t v8 = getAFTextContentTypeTelephoneAreaCodeSymbolLoc_ptr;
  if (!getAFTextContentTypeTelephoneAreaCodeSymbolLoc_ptr)
  {
    id v1 = (void *)AutoFillCoreLibrary();
    v6[3] = (uint64_t)dlsym(v1, "AFTextContentTypeTelephoneAreaCode");
    getAFTextContentTypeTelephoneAreaCodeSymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    SEL v4 = (_Unwind_Exception *)getkDDRVInteractionDidFinishNotification_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  id v2 = *v0;
  return v2;
}

id getAFTextContentTypeTelephoneExtension()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getAFTextContentTypeTelephoneExtensionSymbolLoc_ptr;
  uint64_t v8 = getAFTextContentTypeTelephoneExtensionSymbolLoc_ptr;
  if (!getAFTextContentTypeTelephoneExtensionSymbolLoc_ptr)
  {
    id v1 = (void *)AutoFillCoreLibrary();
    v6[3] = (uint64_t)dlsym(v1, "AFTextContentTypeTelephoneExtension");
    getAFTextContentTypeTelephoneExtensionSymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    SEL v4 = (_Unwind_Exception *)getkDDRVInteractionDidFinishNotification_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  id v2 = *v0;
  return v2;
}

void *__getAFTextContentTypeNoneSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)AutoFillCoreLibrary();
  uint64_t result = dlsym(v2, "AFTextContentTypeNone");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAFTextContentTypeNoneSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t AutoFillCoreLibrary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!AutoFillCoreLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    double v3[2] = 3221225472;
    v3[3] = __AutoFillCoreLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E6BF3E80;
    uint64_t v5 = 0;
    AutoFillCoreLibraryCore_frameworkLibrarCGFloat y = _sl_dlopen();
  }
  uint64_t v0 = AutoFillCoreLibraryCore_frameworkLibrary;
  id v1 = (void *)v3[0];
  if (!AutoFillCoreLibraryCore_frameworkLibrary)
  {
    id v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __AutoFillCoreLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AutoFillCoreLibraryCore_frameworkLibrarCGFloat y = result;
  return result;
}

void *__getAFTextContentTypeNameSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)AutoFillCoreLibrary();
  uint64_t result = dlsym(v2, "AFTextContentTypeName");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAFTextContentTypeNameSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAFTextContentTypeNamePrefixSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)AutoFillCoreLibrary();
  uint64_t result = dlsym(v2, "AFTextContentTypeNamePrefix");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAFTextContentTypeNamePrefixSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAFTextContentTypeGivenNameSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)AutoFillCoreLibrary();
  uint64_t result = dlsym(v2, "AFTextContentTypeGivenName");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAFTextContentTypeGivenNameSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAFTextContentTypeMiddleNameSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)AutoFillCoreLibrary();
  uint64_t result = dlsym(v2, "AFTextContentTypeMiddleName");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAFTextContentTypeMiddleNameSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAFTextContentTypeFamilyNameSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)AutoFillCoreLibrary();
  uint64_t result = dlsym(v2, "AFTextContentTypeFamilyName");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAFTextContentTypeFamilyNameSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAFTextContentTypeNameSuffixSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)AutoFillCoreLibrary();
  uint64_t result = dlsym(v2, "AFTextContentTypeNameSuffix");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAFTextContentTypeNameSuffixSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAFTextContentTypeNicknameSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)AutoFillCoreLibrary();
  uint64_t result = dlsym(v2, "AFTextContentTypeNickname");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAFTextContentTypeNicknameSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAFTextContentTypeJobTitleSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)AutoFillCoreLibrary();
  uint64_t result = dlsym(v2, "AFTextContentTypeJobTitle");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAFTextContentTypeJobTitleSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAFTextContentTypeOrganizationNameSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)AutoFillCoreLibrary();
  uint64_t result = dlsym(v2, "AFTextContentTypeOrganizationName");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAFTextContentTypeOrganizationNameSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAFTextContentTypeLocationSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)AutoFillCoreLibrary();
  uint64_t result = dlsym(v2, "AFTextContentTypeLocation");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAFTextContentTypeLocationSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAFTextContentTypeFullStreetAddressSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)AutoFillCoreLibrary();
  uint64_t result = dlsym(v2, "AFTextContentTypeFullStreetAddress");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAFTextContentTypeFullStreetAddressSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAFTextContentTypeStreetAddressLine1SymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)AutoFillCoreLibrary();
  uint64_t result = dlsym(v2, "AFTextContentTypeStreetAddressLine1");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAFTextContentTypeStreetAddressLine1SymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAFTextContentTypeStreetAddressLine2SymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)AutoFillCoreLibrary();
  uint64_t result = dlsym(v2, "AFTextContentTypeStreetAddressLine2");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAFTextContentTypeStreetAddressLine2SymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAFTextContentTypeAddressCitySymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)AutoFillCoreLibrary();
  uint64_t result = dlsym(v2, "AFTextContentTypeAddressCity");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAFTextContentTypeAddressCitySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAFTextContentTypeAddressStateSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)AutoFillCoreLibrary();
  uint64_t result = dlsym(v2, "AFTextContentTypeAddressState");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAFTextContentTypeAddressStateSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAFTextContentTypeAddressCityAndStateSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)AutoFillCoreLibrary();
  uint64_t result = dlsym(v2, "AFTextContentTypeAddressCityAndState");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAFTextContentTypeAddressCityAndStateSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAFTextContentTypeCountryNameSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)AutoFillCoreLibrary();
  uint64_t result = dlsym(v2, "AFTextContentTypeCountryName");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAFTextContentTypeCountryNameSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAFTextContentTypePostalCodeSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)AutoFillCoreLibrary();
  uint64_t result = dlsym(v2, "AFTextContentTypePostalCode");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAFTextContentTypePostalCodeSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAFTextContentTypeEmailAddressSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)AutoFillCoreLibrary();
  uint64_t result = dlsym(v2, "AFTextContentTypeEmailAddress");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAFTextContentTypeEmailAddressSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAFTextContentTypeURLSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)AutoFillCoreLibrary();
  uint64_t result = dlsym(v2, "AFTextContentTypeURL");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAFTextContentTypeURLSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAFTextContentTypePasswordSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)AutoFillCoreLibrary();
  uint64_t result = dlsym(v2, "AFTextContentTypePassword");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAFTextContentTypePasswordSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAFTextContentTypeCreditCardNameSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)AutoFillCoreLibrary();
  uint64_t result = dlsym(v2, "AFTextContentTypeCreditCardName");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAFTextContentTypeCreditCardNameSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAFTextContentTypeCreditCardGivenNameSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)AutoFillCoreLibrary();
  uint64_t result = dlsym(v2, "AFTextContentTypeCreditCardGivenName");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAFTextContentTypeCreditCardGivenNameSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAFTextContentTypeCreditCardMiddleNameSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)AutoFillCoreLibrary();
  uint64_t result = dlsym(v2, "AFTextContentTypeCreditCardMiddleName");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAFTextContentTypeCreditCardMiddleNameSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAFTextContentTypeCreditCardFamilyNameSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)AutoFillCoreLibrary();
  uint64_t result = dlsym(v2, "AFTextContentTypeCreditCardFamilyName");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAFTextContentTypeCreditCardFamilyNameSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAFTextContentTypeCreditCardNumberSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)AutoFillCoreLibrary();
  uint64_t result = dlsym(v2, "AFTextContentTypeCreditCardNumber");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAFTextContentTypeCreditCardNumberSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAFTextContentTypeCreditCardExpirationSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)AutoFillCoreLibrary();
  uint64_t result = dlsym(v2, "AFTextContentTypeCreditCardExpiration");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAFTextContentTypeCreditCardExpirationSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAFTextContentTypeCreditCardExpirationMonthSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)AutoFillCoreLibrary();
  uint64_t result = dlsym(v2, "AFTextContentTypeCreditCardExpirationMonth");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAFTextContentTypeCreditCardExpirationMonthSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAFTextContentTypeCreditCardExpirationYearSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)AutoFillCoreLibrary();
  uint64_t result = dlsym(v2, "AFTextContentTypeCreditCardExpirationYear");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAFTextContentTypeCreditCardExpirationYearSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAFTextContentTypeCreditCardSecurityCodeSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)AutoFillCoreLibrary();
  uint64_t result = dlsym(v2, "AFTextContentTypeCreditCardSecurityCode");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAFTextContentTypeCreditCardSecurityCodeSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAFTextContentTypeCreditCardTypeSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)AutoFillCoreLibrary();
  uint64_t result = dlsym(v2, "AFTextContentTypeCreditCardType");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAFTextContentTypeCreditCardTypeSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAFTextContentTypeBirthdateSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)AutoFillCoreLibrary();
  uint64_t result = dlsym(v2, "AFTextContentTypeBirthdate");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAFTextContentTypeBirthdateSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAFTextContentTypeBirthdateDaySymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)AutoFillCoreLibrary();
  uint64_t result = dlsym(v2, "AFTextContentTypeBirthdateDay");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAFTextContentTypeBirthdateDaySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAFTextContentTypeBirthdateMonthSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)AutoFillCoreLibrary();
  uint64_t result = dlsym(v2, "AFTextContentTypeBirthdateMonth");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAFTextContentTypeBirthdateMonthSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAFTextContentTypeBirthdateYearSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)AutoFillCoreLibrary();
  uint64_t result = dlsym(v2, "AFTextContentTypeBirthdateYear");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAFTextContentTypeBirthdateYearSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAFTextContentTypeTelephoneNumberSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)AutoFillCoreLibrary();
  uint64_t result = dlsym(v2, "AFTextContentTypeTelephoneNumber");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAFTextContentTypeTelephoneNumberSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAFTextContentTypeTelephoneCountryCodeSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)AutoFillCoreLibrary();
  uint64_t result = dlsym(v2, "AFTextContentTypeTelephoneCountryCode");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAFTextContentTypeTelephoneCountryCodeSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAFTextContentTypeTelephoneNationalNumberSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)AutoFillCoreLibrary();
  uint64_t result = dlsym(v2, "AFTextContentTypeTelephoneNationalNumber");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAFTextContentTypeTelephoneNationalNumberSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAFTextContentTypeTelephoneAreaCodeSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)AutoFillCoreLibrary();
  uint64_t result = dlsym(v2, "AFTextContentTypeTelephoneAreaCode");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAFTextContentTypeTelephoneAreaCodeSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAFTextContentTypeTelephoneLocalNumberSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)AutoFillCoreLibrary();
  uint64_t result = dlsym(v2, "AFTextContentTypeTelephoneLocalNumber");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAFTextContentTypeTelephoneLocalNumberSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAFTextContentTypeTelephoneExtensionSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)AutoFillCoreLibrary();
  uint64_t result = dlsym(v2, "AFTextContentTypeTelephoneExtension");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAFTextContentTypeTelephoneExtensionSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAFTextContentTypeDateTimeSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)AutoFillCoreLibrary();
  uint64_t result = dlsym(v2, "AFTextContentTypeDateTime");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAFTextContentTypeDateTimeSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1DB31A5B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSearchUIResultsViewControllerClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!SearchUILibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __SearchUILibraryCore_block_invoke;
    void v4[4] = &__block_descriptor_40_e5_v8__0l;
    void v4[5] = v4;
    long long v5 = xmmword_1E6BF3E98;
    uint64_t v6 = 0;
    SearchUILibraryCore_frameworkLibrarCGFloat y = _sl_dlopen();
    id v2 = (void *)v4[0];
    if (!SearchUILibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("SearchUIResultsViewController");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    id v2 = (void *)__getSearchUIResultsViewControllerClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getSearchUIResultsViewControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __SearchUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SearchUILibraryCore_frameworkLibrarCGFloat y = result;
  return result;
}

void sub_1DB31DB18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getDDContextMenuActionClass_1()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getDDContextMenuActionClass_softClass_2;
  uint64_t v7 = getDDContextMenuActionClass_softClass_2;
  if (!getDDContextMenuActionClass_softClass_2)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    double v3[2] = __getDDContextMenuActionClass_block_invoke_2;
    v3[3] = &unk_1E6BF0A90;
    v3[4] = &v4;
    __getDDContextMenuActionClass_block_invoke_2((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1DB31DC04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getDDContextMenuActionClass_block_invoke_2(uint64_t a1)
{
  DataDetectorsUILibrary_5();
  Class result = objc_getClass("DDContextMenuAction");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getDDContextMenuActionClass_softClass_2 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getDDContextMenuActionClass_block_invoke_cold_1();
    return (Class)DataDetectorsUILibrary_5();
  }
  return result;
}

uint64_t DataDetectorsUILibrary_5()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!DataDetectorsUILibraryCore_frameworkLibrary_5)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    double v3[2] = 3221225472;
    v3[3] = __DataDetectorsUILibraryCore_block_invoke_5;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E6BF3F70;
    uint64_t v5 = 0;
    DataDetectorsUILibraryCore_frameworkLibrary_5 = _sl_dlopen();
  }
  uint64_t v0 = DataDetectorsUILibraryCore_frameworkLibrary_5;
  id v1 = (void *)v3[0];
  if (!DataDetectorsUILibraryCore_frameworkLibrary_5)
  {
    id v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __DataDetectorsUILibraryCore_block_invoke_5()
{
  uint64_t result = _sl_dlopen();
  DataDetectorsUILibraryCore_frameworkLibrary_5 = result;
  return result;
}

Class __getDDUIActionClass_block_invoke_1(uint64_t a1)
{
  DataDetectorsUILibrary_5();
  Class result = objc_getClass("DDUIAction");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getDDUIActionClass_softClass_1 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getDDUIActionClass_block_invoke_cold_1();
    return (Class)__getkDataDetectorsAllResultsKeySymbolLoc_block_invoke_1(v3);
  }
  return result;
}

void *__getkDataDetectorsAllResultsKeySymbolLoc_block_invoke_1(uint64_t a1)
{
  id v2 = (void *)DataDetectorsUILibrary_5();
  Class result = dlsym(v2, "kDataDetectorsAllResultsKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkDataDetectorsAllResultsKeySymbolLoc_ptr_1 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkDataDetectorsMiddleTextSymbolLoc_block_invoke_0(uint64_t a1)
{
  id v2 = (void *)DataDetectorsUILibrary_5();
  Class result = dlsym(v2, "kDataDetectorsMiddleText");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkDataDetectorsMiddleTextSymbolLoc_ptr_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1DB320F90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB321230(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__21(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__21(uint64_t a1)
{
}

void sub_1DB3213F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB3215D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB3219FC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1DB322078(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB322870(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void VKMClipperPathsFromCGPath(const CGPath *a1, double a2)
{
  CGPathRandomAccess::CGPathRandomAccess((CGPathRandomAccess *)v3, a1);
  CGPathRandomAccess::clipperPaths((CGPathRandomAccess *)v3, a2);
}

void sub_1DB323BA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  std::vector<CGPathRandomAccessSubpath>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  _Unwind_Resume(a1);
}

void CGPathRandomAccess::clipperPaths(CGPathRandomAccess *this, double a2)
{
}

void sub_1DB323D58(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<std::vector<ClipperLib::IntPoint>>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

void CGPathRandomAccess::CGPathRandomAccess(CGPathRandomAccess *this, const CGPath *a2)
{
  *(void *)this = 0;
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0;
  CGPathRandomAccess::addPath(this, a2);
}

void sub_1DB323DA4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::vector<CGPathRandomAccessSubpath>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  _Unwind_Resume(a1);
}

unint64_t CGPathRandomAccess::addPath(CGPathRandomAccess *this, CGPathRef path)
{
  v10[0] = 0;
  v10[1] = v10;
  unint64_t v10[2] = 0x4812000000;
  v10[3] = __Block_byref_object_copy__22;
  void v10[4] = __Block_byref_object_dispose__22;
  v10[5] = &unk_1DB350762;
  double v12 = 0;
  uint64_t v13 = 0;
  double v11 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___ZN18CGPathRandomAccess7addPathEPK6CGPath_block_invoke;
  block[3] = &unk_1E6BF3718;
  void block[4] = v10;
  CGPathApplyWithBlock(path, block);
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)this + 1) - *(void *)this) >> 4);
  v7[0] = 0;
  v7[1] = v7;
  unint64_t v7[2] = 0x4012000000;
  v7[3] = __Block_byref_object_copy__1;
  v7[4] = __Block_byref_object_dispose__2;
  void v7[5] = &unk_1DB350762;
  long long v8 = *MEMORY[0x1E4F1DAD8];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  CGFloat v6[2] = ___ZN18CGPathRandomAccess7addPathEPK6CGPath_block_invoke_4;
  v6[3] = &unk_1E6BF4208;
  void v6[6] = this;
  v6[7] = v4;
  void v6[4] = v10;
  v6[5] = v7;
  CGPathApplyWithBlock(path, v6);
  CGPathRandomAccessSubpath::closeIfNeeded((CGPathRandomAccessSubpath *)(*((void *)this + 1) - 48));
  _Block_object_dispose(v7, 8);
  _Block_object_dispose(v10, 8);
  if (v11)
  {
    double v12 = v11;
    operator delete(v11);
  }
  return v4;
}

void sub_1DB323FB0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 136), 8);
  uint64_t v3 = *(void **)(v1 - 88);
  if (v3)
  {
    *(void *)(v1 - 80) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__22(__n128 *a1, __n128 *a2)
{
  a1[3].n128_u64[0] = 0;
  a1[3].n128_u64[1] = 0;
  a1[4].n128_u64[0] = 0;
  __n128 result = a2[3];
  a1[3] = result;
  a1[4].n128_u64[0] = a2[4].n128_u64[0];
  a2[3].n128_u64[0] = 0;
  a2[3].n128_u64[1] = 0;
  a2[4].n128_u64[0] = 0;
  return result;
}

void __Block_byref_object_dispose__22(uint64_t a1)
{
  id v2 = *(void **)(a1 + 48);
  if (v2)
  {
    *(void *)(a1 + 56) = v2;
    operator delete(v2);
  }
}

void ___ZN18CGPathRandomAccess7addPathEPK6CGPath_block_invoke(uint64_t a1, int *a2)
{
  int v2 = *a2;
  if ((*a2 - 2) < 2)
  {
    uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 56);
    ++*(void *)(v7 - 16);
    uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 56);
    uint64_t v9 = *(void *)(v8 - 8) + 3;
LABEL_8:
    *(void *)(v8 - 8) = v9;
    return;
  }
  if (v2 == 1)
  {
    uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 56);
    ++*(void *)(v10 - 16);
    uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 56);
    uint64_t v9 = *(void *)(v8 - 8) + 1;
    goto LABEL_8;
  }
  if (!v2)
  {
    uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 8);
    unint64_t v4 = (int64x2_t *)v3[7];
    unint64_t v5 = v3[8];
    if ((unint64_t)v4 >= v5)
    {
      double v11 = (int64x2_t *)v3[6];
      uint64_t v12 = v4 - v11;
      unint64_t v13 = v12 + 1;
      if ((unint64_t)(v12 + 1) >> 60) {
        std::vector<ClipperLib::IntPoint>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v14 = v5 - (void)v11;
      if (v14 >> 3 > v13) {
        unint64_t v13 = v14 >> 3;
      }
      if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v15 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v15 = v13;
      }
      if (v15)
      {
        CGRect v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::DoublePoint>>((uint64_t)(v3 + 8), v15);
        double v11 = (int64x2_t *)v3[6];
        unint64_t v4 = (int64x2_t *)v3[7];
      }
      else
      {
        CGRect v16 = 0;
      }
      CGRect v17 = (int64x2_t *)&v16[16 * v12];
      BOOL v18 = &v16[16 * v15];
      *CGRect v17 = vdupq_n_s64(1uLL);
      uint64_t v6 = v17 + 1;
      if (v4 != v11)
      {
        do
        {
          v17[-1] = v4[-1];
          --v17;
          --v4;
        }
        while (v4 != v11);
        double v11 = (int64x2_t *)v3[6];
      }
      void v3[6] = v17;
      v3[7] = v6;
      v3[8] = v18;
      if (v11) {
        operator delete(v11);
      }
    }
    else
    {
      int64x2_t *v4 = vdupq_n_s64(1uLL);
      uint64_t v6 = v4 + 1;
    }
    v3[7] = v6;
  }
}

__n128 __Block_byref_object_copy__1(__n128 *a1, __n128 *a2)
{
  __n128 result = a2[3];
  a1[3] = result;
  return result;
}

void ___ZN18CGPathRandomAccess7addPathEPK6CGPath_block_invoke_4(void *a1, uint64_t a2)
{
  unint64_t v4 = (uint64_t *)a1[6];
  switch(*(_DWORD *)a2)
  {
    case 0:
      unint64_t v5 = (_OWORD *)v4[1];
      if (v5 != (_OWORD *)*v4)
      {
        CGPathRandomAccessSubpath::closeIfNeeded((CGPathRandomAccessSubpath *)(v5 - 3));
        unint64_t v5 = (_OWORD *)v4[1];
      }
      unint64_t v6 = v4[2];
      if ((unint64_t)v5 >= v6)
      {
        unint64_t v23 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v5 - *v4) >> 4);
        unint64_t v24 = v23 + 1;
        if (v23 + 1 > 0x555555555555555) {
          std::vector<ClipperLib::IntPoint>::__throw_length_error[abi:ne180100]();
        }
        unint64_t v25 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v6 - *v4) >> 4);
        if (2 * v25 > v24) {
          unint64_t v24 = 2 * v25;
        }
        if (v25 >= 0x2AAAAAAAAAAAAAALL) {
          unint64_t v26 = 0x555555555555555;
        }
        else {
          unint64_t v26 = v24;
        }
        v135[4] = v4 + 2;
        if (v26) {
          uint64_t v27 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPathRandomAccessSubpath>>((uint64_t)(v4 + 2), v26);
        }
        else {
          uint64_t v27 = 0;
        }
        int64x2_t v93 = &v27[48 * v23];
        v135[0] = v27;
        v135[1] = v93;
        v135[3] = &v27[48 * v26];
        *(_OWORD *)int64x2_t v93 = 0u;
        *((_OWORD *)v93 + 1) = 0u;
        *((_OWORD *)v93 + 2) = 0u;
        v135[2] = v93 + 48;
        std::vector<CGPathRandomAccessSubpath>::__swap_out_circular_buffer(v4, v135);
        uint64_t v7 = (char **)v4[1];
        std::__split_buffer<CGPathRandomAccessSubpath>::~__split_buffer(v135);
      }
      else
      {
        v5[1] = 0u;
        v5[2] = 0u;
        _OWORD *v5 = 0u;
        uint64_t v7 = (char **)(v5 + 3);
        v4[1] = (uint64_t)(v5 + 3);
      }
      v4[1] = (uint64_t)v7;
      double v94 = (unint64_t *)(*(void *)(*(void *)(a1[4] + 8) + 48)
                               + 16 * (~a1[7] - 0x5555555555555555 * (((unint64_t)v7 - *v4) >> 4)));
      unint64_t v95 = v94[1];
      std::vector<CGPathRandomAccessElement>::reserve(v7 - 6, *v94);
      std::vector<ClipperLib::DoublePoint>::reserve((void **)(v4[1] - 24), v95);
      *(_OWORD *)(*(void *)(a1[5] + 8) + 48) = *(_OWORD *)*(void *)(a2 + 8);
      uint64_t v41 = v4[1];
      CGRect v42 = (_OWORD *)(*(void *)(a1[5] + 8) + 48);
      CGRect v43 = *(_OWORD **)(v41 - 16);
      unint64_t v96 = *(void *)(v41 - 8);
      if ((unint64_t)v43 < v96) {
        goto LABEL_117;
      }
      CGRect v45 = (void **)(v41 - 24);
      uint64_t v97 = *(void *)(v41 - 24);
      uint64_t v98 = ((uint64_t)v43 - v97) >> 4;
      unint64_t v99 = v98 + 1;
      if ((unint64_t)(v98 + 1) >> 60) {
        goto LABEL_134;
      }
      uint64_t v100 = v96 - v97;
      if (v100 >> 3 > v99) {
        unint64_t v99 = v100 >> 3;
      }
      if ((unint64_t)v100 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v101 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v101 = v99;
      }
      if (v101) {
        unint64_t v102 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::DoublePoint>>(v41 - 8, v101);
      }
      else {
        unint64_t v102 = 0;
      }
      uint64_t v103 = &v102[16 * v98];
      long long v104 = &v102[16 * v101];
      *(_OWORD *)uint64_t v103 = *v42;
      long long v105 = v103 + 16;
      unint64_t v122 = *(char **)(v41 - 24);
      uint64_t v106 = *(char **)(v41 - 16);
      if (v106 == v122) {
        goto LABEL_130;
      }
      do
      {
        *((_OWORD *)v103 - 1) = *((_OWORD *)v106 - 1);
        v103 -= 16;
        v106 -= 16;
      }
      while (v106 != v122);
      goto LABEL_129;
    case 1:
      uint64_t v8 = v4[1];
      uint64_t v9 = ((uint64_t)(*(void *)(v8 - 16) - *(void *)(v8 - 24)) >> 4) - 1;
      unint64_t v10 = *(void *)(v8 - 40);
      unint64_t v11 = *(void *)(v8 - 32);
      if (v10 < v11)
      {
        *(void *)unint64_t v10 = v9;
        *(unsigned char *)(v10 + 8) = 0;
        uint64_t v12 = (char *)(v10 + 16);
        goto LABEL_31;
      }
      uint64_t v28 = *(void *)(v8 - 48);
      uint64_t v29 = (uint64_t)(v10 - v28) >> 4;
      unint64_t v30 = v29 + 1;
      if (!((unint64_t)(v29 + 1) >> 60))
      {
        uint64_t v31 = v11 - v28;
        if (v31 >> 3 > v30) {
          unint64_t v30 = v31 >> 3;
        }
        if ((unint64_t)v31 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v32 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v32 = v30;
        }
        long long v33 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::DoublePoint>>(v8 - 32, v32);
        CGAffineTransform v34 = &v33[16 * v29];
        CGRect v36 = &v33[16 * v35];
        *(void *)CGAffineTransform v34 = v9;
        v34[8] = 0;
        uint64_t v12 = v34 + 16;
        CGFloat v38 = *(unsigned char **)(v8 - 48);
        CGRect v37 = *(unsigned char **)(v8 - 40);
        if (v37 != v38)
        {
          do
          {
            uint64_t v39 = *((void *)v37 - 2);
            v37 -= 16;
            char v40 = v37[8];
            *((void *)v34 - 2) = v39;
            v34 -= 16;
            v34[8] = v40;
          }
          while (v37 != v38);
          CGRect v37 = *(unsigned char **)(v8 - 48);
        }
        *(void *)(v8 - 48) = v34;
        *(void *)(v8 - 40) = v12;
        *(void *)(v8 - 32) = v36;
        if (v37) {
          operator delete(v37);
        }
LABEL_31:
        *(void *)(v8 - 40) = v12;
        uint64_t v41 = v4[1];
        CGRect v42 = *(_OWORD **)(a2 + 8);
        CGRect v43 = *(_OWORD **)(v41 - 16);
        unint64_t v44 = *(void *)(v41 - 8);
        if ((unint64_t)v43 >= v44)
        {
          CGRect v45 = (void **)(v41 - 24);
          uint64_t v46 = *(void *)(v41 - 24);
          uint64_t v47 = ((uint64_t)v43 - v46) >> 4;
          unint64_t v48 = v47 + 1;
          if (!((unint64_t)(v47 + 1) >> 60))
          {
            uint64_t v49 = v44 - v46;
            if (v49 >> 3 > v48) {
              unint64_t v48 = v49 >> 3;
            }
            if ((unint64_t)v49 >= 0x7FFFFFFFFFFFFFF0) {
              unint64_t v50 = 0xFFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v50 = v48;
            }
            if (v50) {
              CGRect v51 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::DoublePoint>>(v41 - 8, v50);
            }
            else {
              CGRect v51 = 0;
            }
            uint64_t v103 = &v51[16 * v47];
            long long v104 = &v51[16 * v50];
            *(_OWORD *)uint64_t v103 = *v42;
            long long v105 = v103 + 16;
            long long v107 = *(char **)(v41 - 24);
            uint64_t v106 = *(char **)(v41 - 16);
            if (v106 == v107) {
              goto LABEL_130;
            }
            do
            {
              *((_OWORD *)v103 - 1) = *((_OWORD *)v106 - 1);
              v103 -= 16;
              v106 -= 16;
            }
            while (v106 != v107);
LABEL_129:
            uint64_t v106 = (char *)*v45;
LABEL_130:
            *(void *)(v41 - 24) = v103;
            *(void *)(v41 - 16) = v105;
            *(void *)(v41 - 8) = v104;
            if (v106) {
              operator delete(v106);
            }
            goto LABEL_132;
          }
          goto LABEL_134;
        }
        goto LABEL_117;
      }
      goto LABEL_133;
    case 2:
      uint64_t v13 = v4[1];
      uint64_t v14 = ((uint64_t)(*(void *)(v13 - 16) - *(void *)(v13 - 24)) >> 4) - 1;
      unint64_t v15 = *(void *)(v13 - 40);
      unint64_t v16 = *(void *)(v13 - 32);
      if (v15 < v16)
      {
        *(void *)unint64_t v15 = v14;
        *(unsigned char *)(v15 + 8) = 1;
        CGRect v17 = (char *)(v15 + 16);
        goto LABEL_51;
      }
      uint64_t v52 = *(void *)(v13 - 48);
      uint64_t v53 = (uint64_t)(v15 - v52) >> 4;
      unint64_t v54 = v53 + 1;
      if (!((unint64_t)(v53 + 1) >> 60))
      {
        uint64_t v55 = v16 - v52;
        if (v55 >> 3 > v54) {
          unint64_t v54 = v55 >> 3;
        }
        if ((unint64_t)v55 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v56 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v56 = v54;
        }
        CGRect v57 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::DoublePoint>>(v13 - 32, v56);
        uint64_t v58 = &v57[16 * v53];
        CGRect v60 = &v57[16 * v59];
        *(void *)uint64_t v58 = v14;
        v58[8] = 1;
        CGRect v17 = v58 + 16;
        CGRect v62 = *(unsigned char **)(v13 - 48);
        CGRect v61 = *(unsigned char **)(v13 - 40);
        if (v61 != v62)
        {
          do
          {
            uint64_t v63 = *((void *)v61 - 2);
            v61 -= 16;
            char v64 = v61[8];
            *((void *)v58 - 2) = v63;
            v58 -= 16;
            v58[8] = v64;
          }
          while (v61 != v62);
          CGRect v61 = *(unsigned char **)(v13 - 48);
        }
        *(void *)(v13 - 48) = v58;
        *(void *)(v13 - 40) = v17;
        *(void *)(v13 - 32) = v60;
        if (v61) {
          operator delete(v61);
        }
LABEL_51:
        *(void *)(v13 - 40) = v17;
        uint64_t v65 = v4[1];
        CGRect v66 = *(float64x2_t **)(v65 - 16);
        float64x2_t v67 = vmlaq_f64(v66[-1], (float64x2_t)vdupq_n_s64(0x3FE5555555555555uLL), vsubq_f64(*(float64x2_t *)*(void *)(a2 + 8), v66[-1]));
        unint64_t v68 = *(void *)(v65 - 8);
        if ((unint64_t)v66 >= v68)
        {
          unint64_t v86 = *(float64x2_t **)(v65 - 24);
          uint64_t v87 = v66 - v86;
          unint64_t v88 = v87 + 1;
          if ((unint64_t)(v87 + 1) >> 60) {
            goto LABEL_135;
          }
          uint64_t v89 = v68 - (void)v86;
          if (v89 >> 3 > v88) {
            unint64_t v88 = v89 >> 3;
          }
          if ((unint64_t)v89 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v90 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v90 = v88;
          }
          if (v90)
          {
            float64x2_t v133 = v67;
            long long v91 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::DoublePoint>>(v65 - 8, v90);
            float64x2_t v67 = v133;
            int64x2_t v92 = v91;
            unint64_t v86 = *(float64x2_t **)(v65 - 24);
            CGRect v66 = *(float64x2_t **)(v65 - 16);
          }
          else
          {
            int64x2_t v92 = 0;
          }
          long long v108 = (float64x2_t *)&v92[16 * v87];
          long long v109 = &v92[16 * v90];
          *long long v108 = v67;
          f64 = (_OWORD *)v108[1].f64;
          if (v66 != v86)
          {
            do
            {
              v108[-1] = v66[-1];
              --v108;
              --v66;
            }
            while (v66 != v86);
            unint64_t v86 = *(float64x2_t **)(v65 - 24);
          }
          *(void *)(v65 - 24) = v108;
          *(void *)(v65 - 16) = f64;
          *(void *)(v65 - 8) = v109;
          if (v86) {
            operator delete(v86);
          }
        }
        else
        {
          *CGRect v66 = v67;
          f64 = (_OWORD *)v66[1].f64;
        }
        *(void *)(v65 - 16) = f64;
        uint64_t v110 = v4[1];
        float64x2_t v111 = vmlaq_f64(*(float64x2_t *)(*(void *)(a2 + 8) + 16), (float64x2_t)vdupq_n_s64(0x3FE5555555555555uLL), vsubq_f64(*(float64x2_t *)*(void *)(a2 + 8), *(float64x2_t *)(*(void *)(a2 + 8) + 16)));
        uint64_t v112 = *(char **)(v110 - 16);
        unint64_t v113 = *(void *)(v110 - 8);
        if ((unint64_t)v112 < v113)
        {
          *(float64x2_t *)uint64_t v112 = v111;
          unint64_t v114 = v112 + 16;
          goto LABEL_116;
        }
        uint64_t v115 = *(char **)(v110 - 24);
        uint64_t v116 = (v112 - v115) >> 4;
        unint64_t v117 = v116 + 1;
        if (!((unint64_t)(v116 + 1) >> 60))
        {
          uint64_t v118 = v113 - (void)v115;
          if (v118 >> 3 > v117) {
            unint64_t v117 = v118 >> 3;
          }
          if ((unint64_t)v118 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v119 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v119 = v117;
          }
          if (v119)
          {
            float64x2_t v134 = v111;
            int64x2_t v120 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::DoublePoint>>(v110 - 8, v119);
            float64x2_t v111 = v134;
            int64x2_t v121 = v120;
            uint64_t v115 = *(char **)(v110 - 24);
            uint64_t v112 = *(char **)(v110 - 16);
          }
          else
          {
            int64x2_t v121 = 0;
          }
          v123 = (float64x2_t *)&v121[16 * v116];
          v124 = &v121[16 * v119];
          float64x2_t *v123 = v111;
          unint64_t v114 = (_OWORD *)v123[1].f64;
          if (v112 != v115)
          {
            do
            {
              v123[-1] = *((float64x2_t *)v112 - 1);
              --v123;
              v112 -= 16;
            }
            while (v112 != v115);
            uint64_t v115 = *(char **)(v110 - 24);
          }
          *(void *)(v110 - 24) = v123;
          *(void *)(v110 - 16) = v114;
          *(void *)(v110 - 8) = v124;
          if (v115) {
            operator delete(v115);
          }
LABEL_116:
          *(void *)(v110 - 16) = v114;
          uint64_t v41 = v4[1];
          CGRect v42 = (_OWORD *)(*(void *)(a2 + 8) + 16);
          CGRect v43 = *(_OWORD **)(v41 - 16);
          unint64_t v125 = *(void *)(v41 - 8);
          if ((unint64_t)v43 >= v125)
          {
            CGRect v45 = (void **)(v41 - 24);
            uint64_t v126 = *(void *)(v41 - 24);
            uint64_t v127 = ((uint64_t)v43 - v126) >> 4;
            unint64_t v128 = v127 + 1;
            if (!((unint64_t)(v127 + 1) >> 60))
            {
              uint64_t v129 = v125 - v126;
              if (v129 >> 3 > v128) {
                unint64_t v128 = v129 >> 3;
              }
              if ((unint64_t)v129 >= 0x7FFFFFFFFFFFFFF0) {
                unint64_t v130 = 0xFFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v130 = v128;
              }
              if (v130) {
                v131 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::DoublePoint>>(v41 - 8, v130);
              }
              else {
                v131 = 0;
              }
              uint64_t v103 = &v131[16 * v127];
              long long v104 = &v131[16 * v130];
              *(_OWORD *)uint64_t v103 = *v42;
              long long v105 = v103 + 16;
              unint64_t v132 = *(char **)(v41 - 24);
              uint64_t v106 = *(char **)(v41 - 16);
              if (v106 == v132) {
                goto LABEL_130;
              }
              do
              {
                *((_OWORD *)v103 - 1) = *((_OWORD *)v106 - 1);
                v103 -= 16;
                v106 -= 16;
              }
              while (v106 != v132);
              goto LABEL_129;
            }
LABEL_134:
            std::vector<ClipperLib::IntPoint>::__throw_length_error[abi:ne180100]();
          }
LABEL_117:
          *CGRect v43 = *v42;
          long long v105 = v43 + 1;
LABEL_132:
          *(void *)(v41 - 16) = v105;
          return;
        }
LABEL_135:
        std::vector<ClipperLib::IntPoint>::__throw_length_error[abi:ne180100]();
      }
      goto LABEL_133;
    case 3:
      uint64_t v18 = v4[1];
      uint64_t v19 = ((uint64_t)(*(void *)(v18 - 16) - *(void *)(v18 - 24)) >> 4) - 1;
      unint64_t v20 = *(void *)(v18 - 40);
      unint64_t v21 = *(void *)(v18 - 32);
      if (v20 >= v21)
      {
        uint64_t v70 = *(void *)(v18 - 48);
        uint64_t v71 = (uint64_t)(v20 - v70) >> 4;
        unint64_t v72 = v71 + 1;
        if ((unint64_t)(v71 + 1) >> 60) {
LABEL_133:
        }
          std::vector<ClipperLib::IntPoint>::__throw_length_error[abi:ne180100]();
        uint64_t v73 = v21 - v70;
        if (v73 >> 3 > v72) {
          unint64_t v72 = v73 >> 3;
        }
        if ((unint64_t)v73 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v74 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v74 = v72;
        }
        unint64_t v75 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::DoublePoint>>(v18 - 32, v74);
        unint64_t v76 = &v75[16 * v71];
        long long v78 = &v75[16 * v77];
        *(void *)unint64_t v76 = v19;
        v76[8] = 1;
        double v22 = v76 + 16;
        double v80 = *(unsigned char **)(v18 - 48);
        double v79 = *(unsigned char **)(v18 - 40);
        if (v79 != v80)
        {
          do
          {
            uint64_t v81 = *((void *)v79 - 2);
            v79 -= 16;
            char v82 = v79[8];
            *((void *)v76 - 2) = v81;
            v76 -= 16;
            v76[8] = v82;
          }
          while (v79 != v80);
          double v79 = *(unsigned char **)(v18 - 48);
        }
        *(void *)(v18 - 48) = v76;
        *(void *)(v18 - 40) = v22;
        *(void *)(v18 - 32) = v78;
        if (v79) {
          operator delete(v79);
        }
      }
      else
      {
        *(void *)unint64_t v20 = v19;
        *(unsigned char *)(v20 + 8) = 1;
        double v22 = (char *)(v20 + 16);
      }
      *(void *)(v18 - 40) = v22;
      uint64_t v83 = v4[1];
      uint64_t v84 = *(void *)(v83 - 16);
      uint64_t v85 = *(char **)(a2 + 8);
      std::vector<CGPoint>::__insert_with_size[abi:ne180100]<CGPoint*,CGPoint*>(v83 - 24, v84, v85, v85 + 48, 3);
      return;
    default:
      return;
  }
}

void sub_1DB324A44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  std::__split_buffer<CGPathRandomAccessSubpath>::~__split_buffer((void **)va);
  _Unwind_Resume(a1);
}

void CGPathRandomAccessSubpath::closeIfNeeded(CGPathRandomAccessSubpath *this)
{
  uint64_t v1 = *(void *)this;
  unint64_t v2 = *((void *)this + 1);
  uint64_t v3 = v2 - *(void *)this;
  if ((unint64_t)v3 >= 0x20)
  {
    unint64_t v5 = (double *)*((void *)this + 3);
    uint64_t v6 = *((void *)this + 4);
    uint64_t v7 = ((v6 - (uint64_t)v5) >> 4) - 1;
    if (*(void *)(v2 - 16) != v7 && (*(double *)(v6 - 16) != *v5 || *(double *)(v6 - 8) != v5[1]))
    {
      uint64_t v9 = (char *)this + 16;
      unint64_t v10 = *((void *)this + 2);
      if (v2 >= v10)
      {
        uint64_t v12 = v3 >> 4;
        unint64_t v13 = (v3 >> 4) + 1;
        if (v13 >> 60) {
          std::vector<ClipperLib::IntPoint>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v14 = v10 - v1;
        if (v14 >> 3 > v13) {
          unint64_t v13 = v14 >> 3;
        }
        if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v15 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v15 = v13;
        }
        unint64_t v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::DoublePoint>>((uint64_t)v9, v15);
        CGRect v17 = &v16[16 * v12];
        uint64_t v19 = &v16[16 * v18];
        *(void *)CGRect v17 = v7;
        v17[8] = 0;
        unint64_t v11 = v17 + 16;
        unint64_t v21 = *(unsigned char **)this;
        unint64_t v20 = (unsigned char *)*((void *)this + 1);
        if (v20 != *(unsigned char **)this)
        {
          do
          {
            uint64_t v22 = *((void *)v20 - 2);
            v20 -= 16;
            char v23 = v20[8];
            *((void *)v17 - 2) = v22;
            v17 -= 16;
            v17[8] = v23;
          }
          while (v20 != v21);
          unint64_t v20 = *(unsigned char **)this;
        }
        *(void *)this = v17;
        *((void *)this + 1) = v11;
        *((void *)this + 2) = v19;
        if (v20) {
          operator delete(v20);
        }
      }
      else
      {
        *(void *)unint64_t v2 = v7;
        *(unsigned char *)(v2 + 8) = 0;
        unint64_t v11 = (char *)(v2 + 16);
      }
      *((void *)this + 1) = v11;
    }
  }
}

void std::vector<CGPathRandomAccessElement>::reserve(char **a1, unint64_t a2)
{
  unint64_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - *a1) >> 4)
  {
    if (a2 >> 60) {
      std::vector<ClipperLib::IntPoint>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v5 = a1[1] - *a1;
    uint64_t v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::DoublePoint>>(v3, a2);
    uint64_t v7 = &v6[v5];
    uint64_t v9 = &v6[16 * v8];
    unint64_t v11 = *a1;
    unint64_t v10 = a1[1];
    uint64_t v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        uint64_t v13 = *((void *)v10 - 2);
        v10 -= 16;
        char v14 = v10[8];
        *((void *)v12 - 2) = v13;
        v12 -= 16;
        _OWORD v12[8] = v14;
      }
      while (v10 != v11);
      unint64_t v10 = *a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
    {
      operator delete(v10);
    }
  }
}

uint64_t std::vector<CGPathRandomAccessSubpath>::__swap_out_circular_buffer(uint64_t *a1, void *a2)
{
  uint64_t result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<CGPathRandomAccessSubpath>,std::reverse_iterator<CGPathRandomAccessSubpath*>,std::reverse_iterator<CGPathRandomAccessSubpath*>,std::reverse_iterator<CGPathRandomAccessSubpath*>>((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<CGPathRandomAccessSubpath>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x555555555555556) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(48 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<CGPathRandomAccessSubpath>,std::reverse_iterator<CGPathRandomAccessSubpath*>,std::reverse_iterator<CGPathRandomAccessSubpath*>,std::reverse_iterator<CGPathRandomAccessSubpath*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v14 = a6;
  *((void *)&v14 + 1) = a7;
  long long v13 = v14;
  v11[0] = a1;
  v11[1] = &v13;
  unint64_t v11[2] = &v14;
  if (a3 == a5)
  {
    uint64_t v9 = a6;
  }
  else
  {
    do
    {
      *(void *)(v7 - 48) = 0;
      *(void *)(v7 - 40) = 0;
      *(void *)(v7 - 32) = 0;
      long long v8 = *(_OWORD *)(a3 - 48);
      a3 -= 48;
      *(_OWORD *)(v7 - 48) = v8;
      *(void *)(v7 - 32) = *(void *)(a3 + 16);
      *(void *)a3 = 0;
      *(void *)(a3 + 8) = 0;
      *(void *)(a3 + 16) = 0;
      *(void *)(v7 - 24) = 0;
      *(void *)(v7 - 16) = 0;
      *(void *)(v7 - 8) = 0;
      *(_OWORD *)(v7 - 24) = *(_OWORD *)(a3 + 24);
      *(void *)(v7 - 8) = *(void *)(a3 + 40);
      *(void *)(a3 + 24) = 0;
      *(void *)(a3 + 32) = 0;
      *(void *)(a3 + 40) = 0;
      uint64_t v7 = *((void *)&v14 + 1) - 48;
      *((void *)&v14 + 1) -= 48;
    }
    while (a3 != a5);
    uint64_t v9 = v14;
  }
  char v12 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<CGPathRandomAccessSubpath>,std::reverse_iterator<CGPathRandomAccessSubpath*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v11);
  return v9;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<CGPathRandomAccessSubpath>,std::reverse_iterator<CGPathRandomAccessSubpath*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<CGPathRandomAccessSubpath>,std::reverse_iterator<CGPathRandomAccessSubpath*>>::operator()[abi:ne180100]((uint64_t *)a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<CGPathRandomAccessSubpath>,std::reverse_iterator<CGPathRandomAccessSubpath*>>::operator()[abi:ne180100](uint64_t *a1)
{
  uint64_t v1 = *(void *)(a1[2] + 8);
  uint64_t v2 = *(void *)(a1[1] + 8);
  if (v1 != v2)
  {
    uint64_t v3 = *a1;
    do
    {
      std::allocator<CGPathRandomAccessSubpath>::destroy[abi:ne180100](v3, v1);
      v1 += 48;
    }
    while (v1 != v2);
  }
}

void std::allocator<CGPathRandomAccessSubpath>::destroy[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a2 + 24);
  if (v3)
  {
    *(void *)(a2 + 32) = v3;
    operator delete(v3);
  }
  unint64_t v4 = *(void **)a2;
  if (*(void *)a2)
  {
    *(void *)(a2 + 8) = v4;
    operator delete(v4);
  }
}

void **std::__split_buffer<CGPathRandomAccessSubpath>::~__split_buffer(void **a1)
{
  if (*a1) {
    operator delete(*a1);
  }
  return a1;
}

void std::__split_buffer<CGPathRandomAccessSubpath>::clear[abi:ne180100](void *a1)
{
  uint64_t v2 = a1[1];
  for (uint64_t i = a1[2]; i != v2; uint64_t i = a1[2])
  {
    uint64_t v4 = a1[4];
    a1[2] = i - 48;
    std::allocator<CGPathRandomAccessSubpath>::destroy[abi:ne180100](v4, i - 48);
  }
}

char *std::vector<CGPoint>::__insert_with_size[abi:ne180100]<CGPoint*,CGPoint*>(uint64_t a1, uint64_t __dst, char *__src, char *a4, uint64_t a5)
{
  uint64_t v5 = (char *)__dst;
  if (a5 < 1) {
    return v5;
  }
  uint64_t v7 = __src;
  uint64_t v11 = *(void *)(a1 + 16);
  uint64_t v9 = a1 + 16;
  uint64_t v10 = v11;
  unint64_t v12 = *(void *)(v9 - 8);
  if (a5 > (uint64_t)(v11 - v12) >> 4)
  {
    long long v13 = *(void **)a1;
    unint64_t v14 = a5 + ((uint64_t)(v12 - *(void *)a1) >> 4);
    if (v14 >> 60) {
      std::vector<ClipperLib::IntPoint>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v15 = (__dst - (uint64_t)v13) >> 4;
    uint64_t v16 = v10 - (void)v13;
    if (v16 >> 3 > v14) {
      unint64_t v14 = v16 >> 3;
    }
    if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v17 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v17 = v14;
    }
    uint64_t v37 = v9;
    if (v17) {
      uint64_t v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::DoublePoint>>(v9, v17);
    }
    else {
      uint64_t v18 = 0;
    }
    uint64_t v28 = &v18[16 * v15];
    __p = v18;
    CGAffineTransform v34 = v28;
    CGRect v36 = &v18[16 * v17];
    uint64_t v29 = 16 * a5;
    unint64_t v30 = &v28[16 * a5];
    do
    {
      long long v31 = *(_OWORD *)v7;
      v7 += 16;
      *(_OWORD *)uint64_t v28 = v31;
      v28 += 16;
      v29 -= 16;
    }
    while (v29);
    uint64_t v35 = v30;
    uint64_t v5 = (char *)std::vector<CGPoint>::__swap_out_circular_buffer((void **)a1, (uint64_t)&__p, v5);
    if (v35 != v34) {
      v35 += (v34 - v35 + 15) & 0xFFFFFFFFFFFFFFF0;
    }
    if (__p) {
      operator delete(__p);
    }
    return v5;
  }
  uint64_t v19 = v12 - __dst;
  uint64_t v20 = (uint64_t)(v12 - __dst) >> 4;
  if (v20 >= a5)
  {
    unint64_t v21 = &__src[16 * a5];
    char v23 = *(char **)(v9 - 8);
LABEL_17:
    unint64_t v24 = &v5[16 * a5];
    unint64_t v25 = &v23[-16 * a5];
    unint64_t v26 = v23;
    if ((unint64_t)v25 < v12)
    {
      unint64_t v26 = v23;
      do
      {
        long long v27 = *(_OWORD *)v25;
        v25 += 16;
        *(_OWORD *)unint64_t v26 = v27;
        v26 += 16;
      }
      while ((unint64_t)v25 < v12);
    }
    *(void *)(a1 + 8) = v26;
    if (v23 != v24) {
      memmove(&v23[-16 * ((v23 - v24) >> 4)], v5, v23 - v24);
    }
    if (v21 != v7) {
      memmove(v5, v7, v21 - v7);
    }
    return v5;
  }
  unint64_t v21 = &__src[16 * v20];
  int64_t v22 = a4 - v21;
  if (a4 != v21) {
    memmove(*(void **)(v9 - 8), &__src[16 * v20], a4 - v21);
  }
  char v23 = (char *)(v12 + v22);
  *(void *)(a1 + 8) = v12 + v22;
  if (v19 >= 1) {
    goto LABEL_17;
  }
  return v5;
}

void sub_1DB3250E4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *std::vector<CGPoint>::__swap_out_circular_buffer(void **a1, uint64_t a2, char *__src)
{
  uint64_t v5 = *(void **)(a2 + 8);
  uint64_t v6 = (char *)*a1;
  uint64_t v7 = v5;
  if (*a1 != __src)
  {
    long long v8 = __src;
    uint64_t v9 = *(void *)(a2 + 8);
    do
    {
      uint64_t v7 = (void *)(v9 - 16);
      *(_OWORD *)(v9 - 16) = *((_OWORD *)v8 - 1);
      v8 -= 16;
      v9 -= 16;
    }
    while (v8 != v6);
  }
  *(void *)(a2 + 8) = v7;
  uint64_t v10 = a1[1];
  uint64_t v11 = *(void *)(a2 + 16);
  int64_t v12 = v10 - __src;
  if (v10 != __src)
  {
    memmove(*(void **)(a2 + 16), __src, v10 - __src);
    uint64_t v7 = *(void **)(a2 + 8);
  }
  *(void *)(a2 + 16) = v11 + v12;
  long long v13 = (char *)*a1;
  *a1 = v7;
  *(void *)(a2 + 8) = v13;
  unint64_t v14 = a1[1];
  a1[1] = *(void **)(a2 + 16);
  *(void *)(a2 + 16) = v14;
  uint64_t v15 = a1[2];
  a1[2] = *(void **)(a2 + 24);
  *(void *)(a2 + 24) = v15;
  *(void *)a2 = *(void *)(a2 + 8);
  return v5;
}

void std::vector<CGPathRandomAccessSubpath>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = **a1;
  if (v2)
  {
    uint64_t v4 = (uint64_t)v1[1];
    uint64_t v5 = **a1;
    if ((void *)v4 != v2)
    {
      do
      {
        v4 -= 48;
        std::allocator<CGPathRandomAccessSubpath>::destroy[abi:ne180100]((uint64_t)(v1 + 2), v4);
      }
      while ((void *)v4 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void CGPathRandomAccessSubpath::clipperPath(uint64_t *a1, char **a2, double a3)
{
  uint64_t v4 = *a1;
  if (a1[1] != *a1)
  {
    unint64_t v6 = 0;
    uint64_t v83 = (uint64_t)(a2 + 2);
    __asm
    {
      FMOV            V1.2D, #3.0
      FMOV            V0.2D, #6.0
    }
    float64x2_t v81 = _Q0;
    float64x2_t v82 = _Q1;
    __asm
    {
      FMOV            V1.2D, #0.125
      FMOV            V0.2D, #0.25
    }
    float64x2_t v79 = _Q0;
    float64x2_t v80 = _Q1;
    __asm { FMOV            V0.2D, #0.5 }
    float64x2_t v78 = _Q0;
    do
    {
      if (!v6)
      {
        int32x2_t v15 = vmovn_s64(vcvtq_s64_f64(vmulq_n_f64(*(float64x2_t *)a1[3], a3)));
        unint64_t v16 = (unint64_t)a2[1];
        unint64_t v17 = (unint64_t)a2[2];
        if (v16 >= v17)
        {
          unint64_t v20 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v16 - (void)*a2) >> 3);
          unint64_t v21 = v20 + 1;
          if (v20 + 1 > 0xAAAAAAAAAAAAAAALL) {
            goto LABEL_53;
          }
          unint64_t v22 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v17 - (void)*a2) >> 3);
          if (2 * v22 > v21) {
            unint64_t v21 = 2 * v22;
          }
          if (v22 >= 0x555555555555555) {
            unint64_t v23 = 0xAAAAAAAAAAAAAAALL;
          }
          else {
            unint64_t v23 = v21;
          }
          unint64_t v24 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::IntPoint>>(v83, v23);
          unint64_t v26 = &v24[24 * v20];
          *(void *)&long long v27 = v15.i32[0];
          *((void *)&v27 + 1) = v15.i32[1];
          *(_OWORD *)unint64_t v26 = v27;
          *((void *)v26 + 2) = 0;
          uint64_t v29 = *a2;
          uint64_t v28 = a2[1];
          unint64_t v30 = v26;
          if (v28 != *a2)
          {
            do
            {
              long long v31 = *(_OWORD *)(v28 - 24);
              *((void *)v30 - 1) = *((void *)v28 - 1);
              *(_OWORD *)(v30 - 24) = v31;
              v30 -= 24;
              v28 -= 24;
            }
            while (v28 != v29);
            uint64_t v28 = *a2;
          }
          uint64_t v19 = v26 + 24;
          *a2 = v30;
          a2[1] = v26 + 24;
          a2[2] = &v24[24 * v25];
          if (v28) {
            operator delete(v28);
          }
        }
        else
        {
          *(void *)&long long v18 = v15.i32[0];
          *((void *)&v18 + 1) = v15.i32[1];
          *(_OWORD *)unint64_t v16 = v18;
          *(void *)(v16 + 16) = 0;
          uint64_t v19 = (char *)(v16 + 24);
        }
        a2[1] = v19;
        uint64_t v4 = *a1;
      }
      uint64_t v32 = v4 + 16 * v6;
      if (*(unsigned char *)(v32 + 8))
      {
        v95[0] = 0;
        v95[1] = v95;
        v95[2] = 0x3812000000;
        v95[3] = __Block_byref_object_copy__7;
        v95[4] = __Block_byref_object_dispose__8;
        v95[5] = &unk_1DB350762;
        v95[6] = 0;
        uint64_t v33 = a1[3] + 16 * *(void *)v32;
        v89[0] = MEMORY[0x1E4F143A8];
        v89[1] = 3221225472;
        unint64_t v90 = ___ZNK25CGPathRandomAccessSubpath11clipperPathEdRNSt3__16vectorIN10ClipperLib8IntPointENS0_9allocatorIS3_EEEE_block_invoke;
        long long v91 = &unk_1E6BF4230;
        double v94 = a3;
        int64x2_t v92 = v95;
        int64x2_t v93 = a2;
        CGAffineTransform v34 = v89;
        float64x2_t v36 = *(float64x2_t *)v33;
        float64x2_t v35 = *(float64x2_t *)(v33 + 16);
        float64x2_t v37 = vsubq_f64(v35, *(float64x2_t *)v33);
        float64x2_t v39 = *(float64x2_t *)(v33 + 32);
        __n128 v38 = *(__n128 *)(v33 + 48);
        float64x2_t v40 = vsubq_f64(v39, v35);
        float64x2_t v41 = vsubq_f64(v40, v37);
        float64x2_t v42 = vsubq_f64(vsubq_f64((float64x2_t)v38, v39), v40);
        float64x2_t v43 = (float64x2_t)vzip2q_s64((int64x2_t)v41, (int64x2_t)v42);
        float64x2_t v44 = (float64x2_t)vzip1q_s64((int64x2_t)v41, (int64x2_t)v42);
        __n128 v45 = (__n128)vmlaq_f64(vmulq_f64(v43, v43), v44, v44);
        if (v45.n128_f64[0] <= v45.n128_f64[1]) {
          v45.n128_f64[0] = v45.n128_f64[1];
        }
        double v46 = v45.n128_f64[0] * 9.0 * 0.0625;
        v45.n128_u64[0] = *(void *)(v33 + 56);
        if (v46 > 0.04)
        {
          float64x2_t v47 = vsubq_f64(v42, v41);
          float64x2_t v48 = vmulq_f64(v47, v81);
          float64x2_t v49 = vmlaq_f64(v47, v82, vaddq_f64(v37, v41));
          float64x2_t v50 = vmulq_f64(vaddq_f64(v41, v47), v81);
          uint64_t v51 = 1;
          do
          {
            float64x2_t v48 = vmulq_f64(v48, v80);
            float64x2_t v50 = vsubq_f64(vmulq_f64(v50, v79), v48);
            float64x2_t v49 = vsubq_f64(vmulq_f64(v49, v78), vmulq_f64(v50, v78));
            v51 *= 2;
            double v46 = v46 * 0.0625;
          }
          while (v46 > 0.04 && v51 <= 0x10000);
          if (v51 >= 2)
          {
            uint64_t v52 = 1;
            float64x2_t v85 = v48;
            do
            {
              float64x2_t v86 = v49;
              float64x2_t v87 = v50;
              float64x2_t v88 = vaddq_f64(v36, v49);
              ((void (*)(void *, double, double, double))v90)(v34, v88.f64[0], v88.f64[1], (double)(int)v52 / (double)v51);
              v45.n128_u64[1] = *(void *)&v86.f64[1];
              v38.n128_u64[1] = *(void *)&v87.f64[1];
              float64x2_t v49 = vaddq_f64(v86, v87);
              float64x2_t v50 = vaddq_f64(v85, v87);
              ++v52;
              float64x2_t v36 = v88;
            }
            while (v51 != v52);
            v38.n128_u64[0] = *(void *)(v33 + 48);
            v45.n128_u64[0] = *(void *)(v33 + 56);
          }
        }
        ((void (*)(void *, __n128, __n128, double))v90)(v34, v38, v45, 1.0);

        _Block_object_dispose(v95, 8);
      }
      else
      {
        int32x2_t v53 = vmovn_s64(vcvtq_s64_f64(vmulq_n_f64(*(float64x2_t *)(a1[3] + 16 * ((*(void *)v32 + 1) % (unint64_t)((a1[4] - a1[3]) >> 4))), a3)));
        unint64_t v54 = (unint64_t)a2[1];
        unint64_t v55 = (unint64_t)a2[2];
        if (v54 >= v55)
        {
          unint64_t v58 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v54 - (void)*a2) >> 3);
          unint64_t v59 = v58 + 1;
          if (v58 + 1 > 0xAAAAAAAAAAAAAAALL) {
LABEL_53:
          }
            std::vector<ClipperLib::IntPoint>::__throw_length_error[abi:ne180100]();
          unint64_t v60 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v55 - (void)*a2) >> 3);
          if (2 * v60 > v59) {
            unint64_t v59 = 2 * v60;
          }
          if (v60 >= 0x555555555555555) {
            unint64_t v61 = 0xAAAAAAAAAAAAAAALL;
          }
          else {
            unint64_t v61 = v59;
          }
          CGRect v62 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::IntPoint>>(v83, v61);
          char v64 = &v62[24 * v58];
          *(void *)&long long v65 = v53.i32[0];
          *((void *)&v65 + 1) = v53.i32[1];
          *(_OWORD *)char v64 = v65;
          *((void *)v64 + 2) = 0;
          float64x2_t v67 = *a2;
          CGRect v66 = a2[1];
          unint64_t v68 = v64;
          if (v66 != *a2)
          {
            do
            {
              long long v69 = *(_OWORD *)(v66 - 24);
              *((void *)v68 - 1) = *((void *)v66 - 1);
              *(_OWORD *)(v68 - 24) = v69;
              v68 -= 24;
              v66 -= 24;
            }
            while (v66 != v67);
            CGRect v66 = *a2;
          }
          CGRect v57 = v64 + 24;
          *a2 = v68;
          a2[1] = v64 + 24;
          a2[2] = &v62[24 * v63];
          if (v66) {
            operator delete(v66);
          }
        }
        else
        {
          *(void *)&long long v56 = v53.i32[0];
          *((void *)&v56 + 1) = v53.i32[1];
          *(_OWORD *)unint64_t v54 = v56;
          *(void *)(v54 + 16) = 0;
          CGRect v57 = (char *)(v54 + 24);
        }
        a2[1] = v57;
      }
      ++v6;
      uint64_t v4 = *a1;
    }
    while (v6 < (a1[1] - *a1) >> 4);
  }
  uint64_t v71 = *a2;
  uint64_t v70 = a2[1];
  if (0xAAAAAAAAAAAAAAABLL * ((v70 - *a2) >> 3) > 1)
  {
    uint64_t v73 = *((void *)v70 - 3);
    uint64_t v74 = *((void *)v70 - 2);
    unint64_t v72 = v70 - 24;
    uint64_t v76 = *(void *)v71;
    uint64_t v75 = *((void *)v71 + 1);
    if (v73 == v76 && v74 == v75) {
      a2[1] = v72;
    }
  }
}

void sub_1DB3257B8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v2 - 192), 8);
  _Unwind_Resume(a1);
}

void ___ZNK25CGPathRandomAccessSubpath11clipperPathEdRNSt3__16vectorIN10ClipperLib8IntPointENS0_9allocatorIS3_EEEE_block_invoke(uint64_t a1, double a2, double a3)
{
  double v3 = *(double *)(a1 + 48);
  int v4 = (int)(a2 * v3);
  int v5 = (int)(a3 * v3);
  unint64_t v6 = *(void ***)(a1 + 40);
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  long long v8 = v6[1];
  unint64_t v9 = (unint64_t)v6[2];
  if ((unint64_t)v8 >= v9)
  {
    unint64_t v11 = 0xAAAAAAAAAAAAAAABLL * (((char *)v8 - (unsigned char *)*v6) >> 3);
    unint64_t v12 = v11 + 1;
    if (v11 + 1 > 0xAAAAAAAAAAAAAAALL) {
      std::vector<ClipperLib::IntPoint>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v13 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v9 - (void)*v6) >> 3);
    if (2 * v13 > v12) {
      unint64_t v12 = 2 * v13;
    }
    if (v13 >= 0x555555555555555) {
      unint64_t v14 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v14 = v12;
    }
    int32x2_t v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::IntPoint>>((uint64_t)(v6 + 2), v14);
    unint64_t v16 = &v15[24 * v11];
    long long v18 = &v15[24 * v17];
    *(void *)unint64_t v16 = v4;
    *((void *)v16 + 1) = v5;
    *((void *)v16 + 2) = *(void *)(v7 + 48);
    uint64_t v10 = v16 + 24;
    unint64_t v20 = (char *)*v6;
    uint64_t v19 = (char *)v6[1];
    if (v19 != *v6)
    {
      do
      {
        long long v21 = *(_OWORD *)(v19 - 24);
        *((void *)v16 - 1) = *((void *)v19 - 1);
        *(_OWORD *)(v16 - 24) = v21;
        v16 -= 24;
        v19 -= 24;
      }
      while (v19 != v20);
      uint64_t v19 = (char *)*v6;
    }
    char *v6 = v16;
    v6[1] = v10;
    CGFloat v6[2] = v18;
    if (v19) {
      operator delete(v19);
    }
  }
  else
  {
    *long long v8 = v4;
    v8[1] = v5;
    _OWORD v8[2] = *(void *)(v7 + 48);
    uint64_t v10 = v8 + 3;
  }
  v6[1] = v10;
}

void sub_1DB325C2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__23(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__23(uint64_t a1)
{
}

void vk_cgImageRemoveBackground(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (!vk_cgImageRemoveBackground_requestHandler)
  {
    unint64_t v6 = objc_alloc_init(VKCRemoveBackgroundRequestHandler);
    uint64_t v7 = (void *)vk_cgImageRemoveBackground_requestHandler;
    vk_cgImageRemoveBackground_requestHandler = (uint64_t)v6;
  }
  long long v8 = [[VKCRemoveBackgroundRequest alloc] initWithCGImage:a1];
  [(VKCRemoveBackgroundRequest *)v8 setCropToFit:a2];
  [(VKCRemoveBackgroundRequest *)v8 setPerformInPlace:a2 ^ 1];
  unint64_t v9 = (void *)vk_cgImageRemoveBackground_requestHandler;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  unint64_t v11[2] = __vk_cgImageRemoveBackground_block_invoke;
  void v11[3] = &unk_1E6BF42E8;
  id v12 = v5;
  id v10 = v5;
  [v9 performRequest:v8 completion:v11];
}

void __vk_cgImageRemoveBackground_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  unint64_t v6 = 0;
  if (v8 && !v5) {
    unint64_t v6 = (CGImage *)[v8 createCGImage];
  }
  uint64_t v7 = *(void *)(a1 + 32);
  [v8 cropRect];
  (*(void (**)(uint64_t, CGImage *, id))(v7 + 16))(v7, v6, v5);
  CGImageRelease(v6);
}

void vk_cgImageRemoveBackgroundWithDownsizing(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  if (!vk_cgImageRemoveBackgroundWithDownsizing_requestHandler)
  {
    id v8 = objc_alloc_init(VKCRemoveBackgroundRequestHandler);
    unint64_t v9 = (void *)vk_cgImageRemoveBackgroundWithDownsizing_requestHandler;
    vk_cgImageRemoveBackgroundWithDownsizing_requestHandler = (uint64_t)v8;
  }
  id v10 = +[VKCRemoveBackgroundRequest requestWithImage:a1 orientation:0 canResize:a2];
  [v10 setCropToFit:a3];
  [v10 setPerformInPlace:a3 ^ 1];
  unint64_t v11 = (void *)vk_cgImageRemoveBackgroundWithDownsizing_requestHandler;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __vk_cgImageRemoveBackgroundWithDownsizing_block_invoke;
  v13[3] = &unk_1E6BF42E8;
  id v14 = v7;
  id v12 = v7;
  [v11 performRequest:v10 completion:v13];
}

void __vk_cgImageRemoveBackgroundWithDownsizing_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  unint64_t v6 = 0;
  id v7 = v5;
  if (a2 && !v5) {
    unint64_t v6 = (CGImage *)[a2 createCGImage];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  CGImageRelease(v6);
}

BOOL vk_cgImageRemoveBackgroundIsValidSize(void *a1, double a2, double a3)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  if (a2 >= a3) {
    double v6 = a2;
  }
  else {
    double v6 = a3;
  }
  double v7 = VKMAspectRatio(a2, a3);
  if (a2 * a3 <= 12582912.0)
  {
    if (v6 <= 16000.0)
    {
      if (v7 >= 0.2 && v7 <= 5.0)
      {
        unint64_t v11 = 0;
        BOOL v12 = 1;
        goto LABEL_17;
      }
      uint64_t v8 = -13;
      [NSString stringWithFormat:@"Invalid aspect ratio. ratio:%f, min:%f, max:%f", v7, 5.0, *(void *)&v7, 0x3FC999999999999ALL, 0x4014000000000000];
    }
    else
    {
      uint64_t v8 = -12;
      [NSString stringWithFormat:@"Invalid length. length:%f, max:%f", v7, 16000.0, *(void *)&v6, 0x40CF400000000000, v16];
    }
  }
  else
  {
    uint64_t v8 = -11;
    [NSString stringWithFormat:@"Invalid resolution. image-size:%f, max:%f", v7, a2 * a3, a2 * a3, 0x4168000000000000, v16];
  uint64_t v10 = };
  unint64_t v11 = (void *)v10;
  BOOL v12 = v10 == 0;
  if (a1 && v10)
  {
    unint64_t v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = *MEMORY[0x1E4F28568];
    v18[0] = v10;
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    *a1 = [v13 errorWithDomain:@"com.apple.VisionKit.RemoveBackground" code:v8 userInfo:v14];

    BOOL v12 = 0;
  }
LABEL_17:

  return v12;
}

id vk_dataFromCGImage(CGImage *a1, void *a2, void *a3)
{
  id v5 = a2;
  CFDictionaryRef v6 = a3;
  double v7 = (__CFData *)objc_alloc_init(MEMORY[0x1E4F1CA58]);
  uint64_t v8 = CGImageDestinationCreateWithData(v7, v5, 1uLL, 0);
  if (v8)
  {
    unint64_t v9 = v8;
    CGImageDestinationAddImage(v8, a1, v6);
    if (CGImageDestinationFinalize(v9))
    {
      CFRelease(v9);
      uint64_t v10 = (void *)[(__CFData *)v7 copy];
      goto LABEL_11;
    }
    BOOL v12 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      vk_dataFromCGImage_cold_2((uint64_t)v5, v12);
    }

    CFRelease(v9);
  }
  else
  {
    unint64_t v11 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      vk_dataFromCGImage_cold_1(v11);
    }
  }
  uint64_t v10 = 0;
LABEL_11:

  return v10;
}

void sub_1DB3280E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__24(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__24(uint64_t a1)
{
}

CGImageRef vk_createResizedCGImage(CGImage *a1, size_t a2, size_t a3)
{
  size_t BitsPerComponent = CGImageGetBitsPerComponent(a1);
  size_t BytesPerRow = CGImageGetBytesPerRow(a1);
  ColorSpace = CGImageGetColorSpace(a1);
  uint32_t BitmapInfo = CGImageGetBitmapInfo(a1);
  uint64_t v10 = CGBitmapContextCreate(0, a2, a3, BitsPerComponent, BytesPerRow, ColorSpace, BitmapInfo);
  CGContextSetInterpolationQuality(v10, kCGInterpolationHigh);
  v13.origin.CGFloat x = VKMRectWithSize();
  CGContextDrawImage(v10, v13, a1);
  CGImageRef Image = CGBitmapContextCreateImage(v10);
  CGContextRelease(v10);
  return Image;
}

CGColorSpace *vk_newARGB8BitmapContextFromImage(CGImage *a1)
{
  size_t Width = CGImageGetWidth(a1);
  size_t Height = CGImageGetHeight(a1);
  uint64_t result = CGImageGetColorSpace(a1);
  if (result)
  {
    return CGBitmapContextCreate(0, Width, Height, 8uLL, 4 * Width, result, 2u);
  }
  return result;
}

CVPixelBufferRef vk_pixelBufferFromCGImageWithAttributes(CGImage *a1, void *a2, CGColorSpace *a3)
{
  CFDictionaryRef v5 = a2;
  DeviceRGB = a3;
  if (!a3) {
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
  }
  CVPixelBufferRef pixelBufferOut = 0;
  if (a1)
  {
    unint64_t Width = CGImageGetWidth(a1);
    unint64_t Height = CGImageGetHeight(a1);
    if (!CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], Width, Height, 0x42475241u, v5, &pixelBufferOut))
    {
      CVPixelBufferLockBaseAddress(pixelBufferOut, 0);
      BaseAddress = CVPixelBufferGetBaseAddress(pixelBufferOut);
      size_t BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBufferOut);
      CGRect v13 = CGBitmapContextCreate(BaseAddress, Width, Height, 8uLL, BytesPerRow, DeviceRGB, 0x2002u);
      v15.size.CGFloat width = (double)Width;
      v15.size.CGFloat height = (double)Height;
      v15.origin.CGFloat x = 0.0;
      v15.origin.CGFloat y = 0.0;
      CGContextDrawImage(v13, v15, a1);
      CGContextRelease(v13);
      CVPixelBufferUnlockBaseAddress(pixelBufferOut, 0);
      if (a3) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  if (!a3) {
LABEL_6:
  }
    CGColorSpaceRelease(DeviceRGB);
LABEL_7:
  CVPixelBufferRef v9 = pixelBufferOut;

  return v9;
}

CVPixelBufferRef vk_ioSurfaceBackedPixelBufferFromCGImage(CGImage *a1, CGColorSpace *a2)
{
  v10[3] = *MEMORY[0x1E4F143B8];
  DeviceRGB = a2;
  if (!a2) {
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
  }
  uint64_t v5 = *MEMORY[0x1E4F24CA8];
  v9[0] = *MEMORY[0x1E4F24D20];
  v9[1] = v5;
  v10[0] = MEMORY[0x1E4F1CC08];
  v10[1] = MEMORY[0x1E4F1CC38];
  void v9[2] = *MEMORY[0x1E4F24CA0];
  unint64_t v10[2] = MEMORY[0x1E4F1CC38];
  CFDictionaryRef v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:3];
  CVPixelBufferRef v7 = vk_pixelBufferFromCGImageWithAttributes(a1, v6, DeviceRGB);
  if (!a2) {
    CGColorSpaceRelease(DeviceRGB);
  }

  return v7;
}

CVPixelBufferRef vk_cgImageBackedPixelBufferFromCGImage(CGImage *a1, CGColorSpace *a2)
{
  if (a2)
  {
    return vk_pixelBufferFromCGImageWithAttributes(a1, 0, a2);
  }
  else
  {
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    CVPixelBufferRef v5 = vk_pixelBufferFromCGImageWithAttributes(a1, 0, DeviceRGB);
    CGColorSpaceRelease(DeviceRGB);
    return v5;
  }
}

__CVBuffer *vk_cgImageFromPixelBuffer(__CVBuffer *result)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  CGImageRef imageOut = 0;
  if (result)
  {
    uint64_t v1 = result;
    VTCreateCGImageFromCVPixelBuffer(result, 0, &imageOut);
    uint64_t result = imageOut;
    if (!imageOut)
    {
      uint64_t v2 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.interaction");
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB266000, v2, OS_LOG_TYPE_DEFAULT, "VT did not return a CGImage from a buffer, trying CI", buf, 2u);
      }

      double v3 = [MEMORY[0x1E4F1E050] imageWithCVPixelBuffer:v1];
      int v4 = (void *)[objc_alloc(MEMORY[0x1E4F1E018]) initWithOptions:0];
      CVPixelBufferGetHeight(v1);
      CVPixelBufferGetWidth(v1);
      CGImageRef imageOut = (CGImageRef)[v4 createCGImage:v3 fromRect:VKMRectWithSize()];
      CVPixelBufferRef v5 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.interaction");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        BOOL v8 = imageOut != 0;
        _os_log_impl(&dword_1DB266000, v5, OS_LOG_TYPE_DEFAULT, "CGImage from CI has result: %d", buf, 8u);
      }

      return imageOut;
    }
  }
  return result;
}

id vk_pngDataFromCGImage(CGImage *a1)
{
  uint64_t v2 = [(id)*MEMORY[0x1E4F44460] identifier];
  double v3 = vk_dataFromCGImage(a1, v2, 0);

  return v3;
}

void vk_cgImageCropZeroAlpha(CGImage *a1, void *a2)
{
  unint64_t v26 = a2;
  if (!a1) {
    +[VKAssert handleFailedAssertWithCondition:"imageRef" functionName:"void vk_cgImageCropZeroAlpha(CGImageRef _Nonnull, void (^ _Nonnull __strong)(CGImageRef _Nullable, CGRect))" simulateCrash:0 showAlert:0 format:@"Trying to crop a NULL image"];
  }
  double v4 = *MEMORY[0x1E4F1DB28];
  double v3 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  CVPixelBufferRef v7 = vk_newARGB8BitmapContextFromImage(a1);
  if (v7)
  {
    size_t Width = CGImageGetWidth(a1);
    size_t Height = CGImageGetHeight(a1);
    double v10 = (double)Width;
    v28.size.CGFloat height = (double)Height;
    v28.origin.CGFloat x = 0.0;
    v28.origin.CGFloat y = 0.0;
    v28.size.CGFloat width = (double)Width;
    CGContextDrawImage(v7, v28, a1);
    Data = (unsigned __int8 *)CGBitmapContextGetData(v7);
    CGImageRef Image = CGBitmapContextCreateImage(v7);
    if (Data)
    {
      if (Height)
      {
        unint64_t v13 = 0;
        unint64_t v14 = 0;
        unint64_t v15 = 0;
        unint64_t v16 = Height;
        unint64_t v17 = Width;
        do
        {
          if (Width)
          {
            unint64_t v18 = 0;
            uint64_t v19 = Data;
            do
            {
              int v21 = *v19;
              v19 += 4;
              int v20 = v21;
              if (v17 >= v18) {
                unint64_t v22 = v18;
              }
              else {
                unint64_t v22 = v17;
              }
              if (v15 <= v18) {
                unint64_t v23 = v18;
              }
              else {
                unint64_t v23 = v15;
              }
              if (v16 >= v13) {
                unint64_t v24 = v13;
              }
              else {
                unint64_t v24 = v16;
              }
              if (v14 <= v13) {
                unint64_t v25 = v13;
              }
              else {
                unint64_t v25 = v14;
              }
              if (v20)
              {
                unint64_t v17 = v22;
                unint64_t v16 = v24;
                unint64_t v15 = v23;
                unint64_t v14 = v25;
              }
              ++v18;
            }
            while (Width != v18);
            Data += 4 * Width;
          }
          ++v13;
        }
        while (v13 != Height);
        double v10 = (double)v17;
        size_t Width = v17;
      }
      else
      {
        unint64_t v16 = 0;
        unint64_t v15 = 0;
        unint64_t v14 = 0;
      }
      double v3 = (double)v16;
      double v5 = (double)(v15 - Width + 1);
      double v6 = (double)(v14 - v16 + 1);
      double v4 = v10;
    }
    CGContextRelease(v7);
    if (Image)
    {
      v29.origin.CGFloat x = v4;
      v29.origin.CGFloat y = v3;
      v29.size.CGFloat width = v5;
      v29.size.CGFloat height = v6;
      CVPixelBufferRef v7 = CGImageCreateWithImageInRect(Image, v29);
    }
    else
    {
      CVPixelBufferRef v7 = 0;
    }
  }
  else
  {
    +[VKAssert handleFailedAssertWithCondition:"context" functionName:"void vk_cgImageCropZeroAlpha(CGImageRef _Nonnull, void (^ _Nonnull __strong)(CGImageRef _Nullable, CGRect))" simulateCrash:0 showAlert:0 format:@"Couldn't create a bitmap context"];
    CGImageRef Image = 0;
  }
  CGImageRelease(Image);
  v26[2](v26, v7, v4, v3, v5, v6);
  CGImageRelease(v7);
}

BOOL vk_isPixelBufferTransparentAtPoint(__CVBuffer *a1, double a2, double a3, double a4)
{
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a1);
  size_t Width = CVPixelBufferGetWidth(a1);
  size_t Height = CVPixelBufferGetHeight(a1);
  LODWORD(v4) = llround(a2);
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a1);
  if ((v4 & 0x80000000) != 0 || (LODWORD(v5) = llround(a3), (v5 & 0x80000000) != 0) || Width <= v4)
  {
    if (PixelFormatType == 1278226534) {
      return 0;
    }
LABEL_8:
    +[VKAssert handleFailedAssertWithCondition:"__objc_no" functionName:"BOOL vk_isPixelBufferTransparentAtPoint(CVPixelBufferRef _Nullable, CGPoint, CGFloat)" simulateCrash:0 showAlert:0 format:@"unsupported pixel format for vk_isPixelBufferTransparent"];
    return 0;
  }
  if (PixelFormatType != 1278226534) {
    goto LABEL_8;
  }
  if (Height <= v5) {
    return 0;
  }
  CVPixelBufferLockBaseAddress(a1, 1uLL);
  BOOL v14 = *(float *)((char *)CVPixelBufferGetBaseAddress(a1) + 4 * v4 + BytesPerRow * v5) <= a4;
  CVPixelBufferUnlockBaseAddress(a1, 1uLL);
  return v14;
}

CGImageRef vk_createScaledCGImage(CGImage *a1, double a2)
{
  size_t v4 = vcvtmd_u64_f64((double)CGImageGetWidth(a1) * a2);
  size_t v5 = vcvtmd_u64_f64((double)CGImageGetHeight(a1) * a2);
  return vk_createResizedCGImage(a1, v4, v5);
}

double vk_sizeForPixelBuffer(__CVBuffer *a1)
{
  if (!a1) {
    return *MEMORY[0x1E4F1DB30];
  }
  double Width = (double)CVPixelBufferGetWidth(a1);
  CVPixelBufferGetHeight(a1);
  return Width;
}

double vk_sizeForCGImage(CGImage *a1)
{
  if (!a1) {
    return *MEMORY[0x1E4F1DB30];
  }
  double Width = (double)CGImageGetWidth(a1);
  CGImageGetHeight(a1);
  return Width;
}

void sub_1DB32B480(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB32B784(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1DB32C1FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getLTUIVisualTranslationViewClass_block_invoke_0(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("LTUIVisualTranslationView");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getLTUIVisualTranslationViewClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getLTUIVisualTranslationViewClass_block_invoke_cold_1();
    TranslationUILibrary();
  }
}

void TranslationUILibrary()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!TranslationUILibraryCore_frameworkLibrary_0)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __TranslationUILibraryCore_block_invoke_0;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E6BF4430;
    uint64_t v3 = 0;
    TranslationUILibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  uint64_t v0 = (void *)v1[0];
  if (!TranslationUILibraryCore_frameworkLibrary_0)
  {
    uint64_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __TranslationUILibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  TranslationUILibraryCore_frameworkLibrary_0 = result;
  return result;
}

Class __getLTUIVisualTranslationServiceClass_block_invoke(uint64_t a1)
{
  TranslationUILibrary();
  Class result = objc_getClass("LTUIVisualTranslationService");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getLTUIVisualTranslationServiceClass_block_invoke_cold_1();
  }
  getLTUIVisualTranslationServiceClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id VKBundle()
{
  uint64_t v0 = (void *)VKBundle_vkBundle;
  if (!VKBundle_vkBundle)
  {
    uint64_t v1 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    long long v2 = (void *)VKBundle_vkBundle;
    VKBundle_vkBundle = v1;

    uint64_t v0 = (void *)VKBundle_vkBundle;
  }
  return v0;
}

void sub_1DB32CEF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__25(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__25(uint64_t a1)
{
}

uint64_t getkDDRVInteractionDidFinishNotification_cold_1()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return __49__VKCCornerLookupButton_queryForProcessingResult__block_invoke_3_cold_1(v0);
}

uint64_t __getDDRevealBridgeClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __69__VKCImageAnalyzer_processRequest_progressHandler_completionHandler___block_invoke_cold_1(v0);
}

void __vk_processHasUnlockEntitlement_block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1DB266000, a2, OS_LOG_TYPE_ERROR, "Failed to check if process has unlock request entitlement: %@", (uint8_t *)&v3, 0xCu);
}

uint64_t __getLTUIVisualTranslationViewClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __46__VKCImageTextSelectionView_textQueryProvider__block_invoke_3_cold_1(v0);
}

uint64_t __getDDDetectionControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[VKCImageSubjectBaseView configurePulseAnimationWithViewScale:](v0);
}

uint64_t __getBCSActionClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return +[VKRadarUtilities promptUserToFileBugWithAlertMessage:bugTitle:bugDescription:](v0);
}

uint64_t __getDDUIActionClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getDDContextMenuActionClass_block_invoke_cold_1(v0);
}

uint64_t __getDDContextMenuActionClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[VKImageAnalyzerMadInterface clearCompletedRequest:](v0);
}

void __getDDContextMenuConfigurationClass_block_invoke_cold_1()
{
}

uint64_t __getPHPhotoLibraryClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getPHFetchOptionsClass_block_invoke_cold_1(v0);
}

uint64_t __getPHFetchOptionsClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getPHAssetClass_block_invoke_cold_1(v0);
}

uint64_t __getPHAssetClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getPHImageRequestOptionsClass_block_invoke_cold_1(v0);
}

uint64_t __getPHImageRequestOptionsClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getPHImageManagerClass_block_invoke_cold_1(v0);
}

uint64_t __getPHImageManagerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[VKCRemoveBackgroundRequestHandler performRequest:completion:](v0);
}

void VKStringFromCGColor_cold_1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_1DB266000, v0, v1, "Could not get color space name from color %@", v2, v3, v4, v5, v6);
}

void VKCGColorCreateWithString_cold_1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_1DB266000, v0, v1, "No strings from color string: %@", v2, v3, v4, v5, v6);
}

void VKCGColorCreateWithString_cold_2()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_1DB266000, v0, v1, "No color space from color string: %@", v2, v3, v4, v5, v6);
}

void VKCGColorCreateWithString_cold_3()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_1DB266000, v0, v1, "No component count in color string: %@", v2, v3, v4, v5, v6);
}

void VKCGColorCreateWithString_cold_4(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  [a1 count];
  OUTLINED_FUNCTION_1_2();
  __int16 v6 = 2048;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1DB266000, a3, OS_LOG_TYPE_ERROR, "Color string component count (%zu) is different from the expected count for the color space (%zu) plus the alpha component", v5, 0x16u);
}

uint64_t __getSearchUIResultsViewControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return +[UIImage(Utilities) vk_orientedImageFromCGImage:scale:transform:](v0);
}

void vk_dataFromCGImage_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1DB266000, log, OS_LOG_TYPE_ERROR, "Failed to create CGImageDestinationRef", v1, 2u);
}

void vk_dataFromCGImage_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  uint64_t v3 = "NSData * _Nullable vk_dataFromCGImage(CGImageRef _Nullable, NSString *__strong _Nonnull, NSDictionary * _Nullable __strong)";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_1DB266000, a2, OS_LOG_TYPE_ERROR, "%s -- Failed to finalize image with type '%@'.", (uint8_t *)&v2, 0x16u);
}

void __getLTUIVisualTranslationServiceClass_block_invoke_cold_1()
{
}

uint64_t AVCaptureSessionSetAuthorizedToUseCameraInMultipleForegroundAppLayout()
{
  return MEMORY[0x1F40D0E90]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1F41138B8]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x1F40F4A90]();
  return result;
}

CATransform3D *__cdecl CATransform3DConcat(CATransform3D *__return_ptr retstr, CATransform3D *a, CATransform3D *b)
{
  return (CATransform3D *)MEMORY[0x1F40F4CD8](retstr, a, b);
}

CGAffineTransform *__cdecl CATransform3DGetAffineTransform(CGAffineTransform *__return_ptr retstr, CATransform3D *t)
{
  return (CGAffineTransform *)MEMORY[0x1F40F4CE8](retstr, t);
}

BOOL CATransform3DIsAffine(CATransform3D *t)
{
  return MEMORY[0x1F40F4D00](t);
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x1F40F4D20](retstr, sx, sy, sz);
}

CATransform3D *__cdecl CATransform3DMakeTranslation(CATransform3D *__return_ptr retstr, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return (CATransform3D *)MEMORY[0x1F40F4D30](retstr, tx, ty, tz);
}

int CC_MD5_Final(unsigned __int8 *md, CC_MD5_CTX *c)
{
  return MEMORY[0x1F40C9718](md, c);
}

int CC_MD5_Init(CC_MD5_CTX *c)
{
  return MEMORY[0x1F40C9720](c);
}

int CC_MD5_Update(CC_MD5_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C9728](c, data, *(void *)&len);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1F40D72D8](arg);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1F40D7420]();
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D79A8](allocator, capacity, theDict);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1F40D7D80](allocator, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D8388](theString1, theString2, compareOptions);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x1F40D8A28](allocator, flags, error, dictionary, timeout);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return MEMORY[0x1F40D8A68](userNotification, responseFlags, timeout);
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

CGAffineTransform *__cdecl CGAffineTransformRotate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97E8](retstr, t, angle);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97F0](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97F8](retstr, t, tx, ty);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1F40D9808](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x1F40D9818](context);
}

void *__cdecl CGBitmapContextGetData(CGContextRef context)
{
  return (void *)MEMORY[0x1F40D9868](context);
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x1F40D9970](space, components);
}

CGColorRef CGColorCreateWithPattern(CGColorSpaceRef space, CGPatternRef pattern, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x1F40D99B8](space, pattern, components);
}

CGFloat CGColorGetAlpha(CGColorRef color)
{
  MEMORY[0x1F40D99F0](color);
  return result;
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D99F8](color);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x1F40D9A00](color);
}

size_t CGColorGetNumberOfComponents(CGColorRef color)
{
  return MEMORY[0x1F40D9A18](color);
}

CFStringRef CGColorSpaceCopyName(CGColorSpaceRef space)
{
  return (CFStringRef)MEMORY[0x1F40D9AB8](space);
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

CGColorSpaceRef CGColorSpaceCreatePattern(CGColorSpaceRef baseSpace)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B38](baseSpace);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B60](name);
}

CGColorSpaceModel CGColorSpaceGetModel(CGColorSpaceRef space)
{
  return MEMORY[0x1F40D9BE0](space);
}

size_t CGColorSpaceGetNumberOfComponents(CGColorSpaceRef space)
{
  return MEMORY[0x1F40D9BF0](space);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
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

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
}

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
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

CGBitmapInfo CGImageGetBitmapInfo(CGImageRef image)
{
  return MEMORY[0x1F40DA8D8](image);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x1F40DA8E0](image);
}

size_t CGImageGetBytesPerRow(CGImageRef image)
{
  return MEMORY[0x1F40DA8F0](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x1F40DA908](image);
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

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x1F40DAA98](image);
}

CFDictionaryRef CGImageSourceCopyProperties(CGImageSourceRef isrc, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x1F40E9930](isrc, options);
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x1F40E9938](isrc, index, options);
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

void CGPathAddArc(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, BOOL clockwise)
{
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathAddRect(CGMutablePathRef path, const CGAffineTransform *m, CGRect rect)
{
}

void CGPathApplyWithBlock(CGPathRef path, CGPathApplyBlock block)
{
}

void CGPathCloseSubpath(CGMutablePathRef path)
{
}

BOOL CGPathContainsPoint(CGPathRef path, const CGAffineTransform *m, CGPoint point, BOOL eoFill)
{
  return MEMORY[0x1F40DB008](path, m, eoFill, (__n128)point, *(__n128 *)&point.y);
}

CGPathRef CGPathCreateCopyByTransformingPath(CGPathRef path, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x1F40DB048](path, transform);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x1F40DB068]();
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathRelease(CGPathRef path)
{
}

CGPatternRef CGPatternCreate(void *info, CGRect bounds, CGAffineTransform *matrix, CGFloat xStep, CGFloat yStep, CGPatternTiling tiling, BOOL isColored, const CGPatternCallbacks *callbacks)
{
  return (CGPatternRef)MEMORY[0x1F40DB180](info, matrix, *(void *)&tiling, isColored, callbacks, (__n128)bounds.origin, *(__n128 *)&bounds.origin.y, (__n128)bounds.size, *(__n128 *)&bounds.size.height, xStep, yStep);
}

void CGPatternRelease(CGPatternRef pattern)
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

CGRect CGRectStandardize(CGRect rect)
{
  MEMORY[0x1F40DB300]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.CGFloat height = v4;
  result.size.CGFloat width = v3;
  result.origin.CGFloat y = v2;
  result.origin.CGFloat x = v1;
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB310]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

CFDictionaryRef CMCopyDictionaryOfAttachments(CFAllocatorRef allocator, CMAttachmentBearerRef target, CMAttachmentMode attachmentMode)
{
  return (CFDictionaryRef)MEMORY[0x1F40DBB70](allocator, target, *(void *)&attachmentMode);
}

FourCharCode CMFormatDescriptionGetMediaSubType(CMFormatDescriptionRef desc)
{
  return MEMORY[0x1F40DBBC8](desc);
}

CFTypeRef CMGetAttachment(CMAttachmentBearerRef target, CFStringRef key, CMAttachmentMode *attachmentModeOut)
{
  return (CFTypeRef)MEMORY[0x1F40DBBF0](target, key, attachmentModeOut);
}

uint64_t CMPhotoCompressionSessionAddAuxiliaryImage()
{
  return MEMORY[0x1F410D510]();
}

uint64_t CMPhotoCompressionSessionAddImageToSequence()
{
  return MEMORY[0x1F410D580]();
}

uint64_t CMPhotoCompressionSessionCloseContainerAndCopyBacking()
{
  return MEMORY[0x1F410D5B0]();
}

uint64_t CMPhotoCompressionSessionCreate()
{
  return MEMORY[0x1F410D5B8]();
}

uint64_t CMPhotoCompressionSessionEndImageSequence()
{
  return MEMORY[0x1F410D5C8]();
}

uint64_t CMPhotoCompressionSessionOpenEmptyContainer()
{
  return MEMORY[0x1F410D5F0]();
}

uint64_t CMPhotoCompressionSessionStartImageSequence()
{
  return MEMORY[0x1F410D618]();
}

uint64_t CMPhotoDecompressionContainerCreateDictionaryDescription()
{
  return MEMORY[0x1F410D7C8]();
}

uint64_t CMPhotoDecompressionContainerCreateImageForIndex()
{
  return MEMORY[0x1F410D7D0]();
}

uint64_t CMPhotoDecompressionContainerCreateSequenceContainer()
{
  return MEMORY[0x1F410D7F0]();
}

uint64_t CMPhotoDecompressionContainerGetImageCountWithOptions()
{
  return MEMORY[0x1F410D8A8]();
}

uint64_t CMPhotoDecompressionSessionCreate()
{
  return MEMORY[0x1F410D960]();
}

uint64_t CMPhotoDecompressionSessionCreateContainer()
{
  return MEMORY[0x1F410D968]();
}

CMFormatDescriptionRef CMSampleBufferGetFormatDescription(CMSampleBufferRef sbuf)
{
  return (CMFormatDescriptionRef)MEMORY[0x1F40DBDC0](sbuf);
}

CVImageBufferRef CMSampleBufferGetImageBuffer(CMSampleBufferRef sbuf)
{
  return (CVImageBufferRef)MEMORY[0x1F40DBDC8](sbuf);
}

void CMSetAttachment(CMAttachmentBearerRef target, CFStringRef key, CFTypeRef value, CMAttachmentMode attachmentMode)
{
}

int32_t CMTimeCompare(CMTime *time1, CMTime *time2)
{
  return MEMORY[0x1F40DC0C8](time1, time2);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  MEMORY[0x1F40DC100](time);
  return result;
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x1F40DC108](retstr, value, *(void *)&timescale);
}

CMTime *__cdecl CMTimeMakeFromDictionary(CMTime *__return_ptr retstr, CFDictionaryRef dictionaryRepresentation)
{
  return (CMTime *)MEMORY[0x1F40DC110](retstr, dictionaryRepresentation);
}

CMTime *__cdecl CMTimeSubtract(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x1F40DC1F0](retstr, lhs, rhs);
}

CMVideoDimensions CMVideoFormatDescriptionGetDimensions(CMVideoFormatDescriptionRef videoDesc)
{
  return (CMVideoDimensions)MEMORY[0x1F40DC338](videoDesc);
}

void CVBufferRelease(CVBufferRef buffer)
{
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1F40DFCE0](allocator, width, height, *(void *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

CVReturn CVPixelBufferCreateWithIOSurface(CFAllocatorRef allocator, IOSurfaceRef surface, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1F40DFD08](allocator, surface, pixelBufferAttributes, pixelBufferOut);
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x1F40DFD28](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD40](pixelBuffer);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD68](pixelBuffer);
}

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return (IOSurfaceRef)MEMORY[0x1F40DFD78](pixelBuffer);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD80](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD98](pixelBuffer);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x1F40DFDB8](pixelBuffer, lockFlags);
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
}

CVPixelBufferRef CVPixelBufferRetain(CVPixelBufferRef texture)
{
  return (CVPixelBufferRef)MEMORY[0x1F40DFE40](texture);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x1F40DFE48](pixelBuffer, unlockFlags);
}

CFDictionaryRef CVPixelFormatDescriptionCreateWithPixelFormatType(CFAllocatorRef allocator, OSType pixelFormat)
{
  return (CFDictionaryRef)MEMORY[0x1F40DFE50](allocator, *(void *)&pixelFormat);
}

uint64_t IsAppleInternalBuild()
{
  return MEMORY[0x1F41165A0]();
}

uint64_t MGCancelNotifications()
{
  return MEMORY[0x1F417CDD0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1F417CE28]();
}

uint64_t MGRegisterForUpdates()
{
  return MEMORY[0x1F417CE60]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x1F412F980]();
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x1F40EDE00]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x1F40E7140](range1.location, range1.length, range2.location, range2.length);
  result.NSUInteger length = v3;
  result.NSUInteger location = v2;
  return result;
}

void NSLog(NSString *format, ...)
{
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1F40E7258](aSelectorName);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x1F4102AF8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1F40E72A0](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E72C8]();
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x1F40E72E0](range1.location, range1.length, range2.location, range2.length);
  result.NSUInteger length = v3;
  result.NSUInteger location = v2;
  return result;
}

uint64_t PPSCreateTelemetryIdentifier()
{
  return MEMORY[0x1F4145DC0]();
}

uint64_t PPSSendTelemetry()
{
  return MEMORY[0x1F4145DD0]();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1F40F7138](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1F40F7160](allocator);
}

void UIGraphicsBeginImageContext(CGSize size)
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

uint64_t UIRectCenteredIntegralRectScale()
{
  return MEMORY[0x1F4102D68]();
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x1F4102DB8]();
}

uint64_t VKInternalStickerEffectViewWithDevice()
{
  return MEMORY[0x1F41679D8]();
}

CGRect VNImageRectForNormalizedRect(CGRect normalizedRect, size_t imageWidth, size_t imageHeight)
{
  MEMORY[0x1F4103630](imageWidth, imageHeight, (__n128)normalizedRect.origin, *(__n128 *)&normalizedRect.origin.y, (__n128)normalizedRect.size, *(__n128 *)&normalizedRect.size.height);
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

OSStatus VTCreateCGImageFromCVPixelBuffer(CVPixelBufferRef pixelBuffer, CFDictionaryRef options, CGImageRef *imageOut)
{
  return MEMORY[0x1F4103190](pixelBuffer, options, imageOut);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x1F417E408](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x1F417E418](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1F417E448](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1F417E530](this);
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x1F417E848]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x1F417E850]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x1F417E8C8]();
}

void std::locale::~locale(std::locale *this)
{
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
}

void std::exception::~exception(std::exception *this)
{
}

void std::terminate(void)
{
}

void operator delete[]()
{
  while (1)
    ;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void operator new[]()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1F417EF30](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1F417EF48](a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_rethrow(void)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

simd_float3x3 __invert_f3(simd_float3x3 a1)
{
  MEMORY[0x1F40C9BF8]((__n128)a1.columns[0], (__n128)a1.columns[1], (__n128)a1.columns[2]);
  result.columns[2].i64[1] = v6;
  result.columns[2].i64[0] = v5;
  result.columns[1].i64[1] = v4;
  result.columns[1].i64[0] = v3;
  result.columns[0].i64[1] = v2;
  result.columns[0].i64[0] = v1;
  return result;
}

__double2 __sincos_stret(double a1)
{
  MEMORY[0x1F40C9C80](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
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

uint64_t abort_report_np()
{
  return MEMORY[0x1F40CA1E8]();
}

long double acos(long double __x)
{
  MEMORY[0x1F40CA330](__x);
  return result;
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1F40CA3C0](*(void *)&__upper_bound);
}

long double atan(long double __x)
{
  MEMORY[0x1F40CA450](__x);
  return result;
}

long double atan2(long double __y, long double __x)
{
  MEMORY[0x1F40CA460](__y, __x);
  return result;
}

void bzero(void *a1, size_t a2)
{
}

long double cos(long double __x)
{
  MEMORY[0x1F40CB8A8](__x);
  return result;
}

uint64_t deviceHasAppleNeuralEngine()
{
  return MEMORY[0x1F4163E50]();
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

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x1F40CBA10](buffer, size, queue, destructor);
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

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
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

long double fmod(long double __x, long double __y)
{
  MEMORY[0x1F40CC1A0](__x, __y);
  return result;
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CC1D8](a1, a2);
}

void free(void *a1)
{
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD20](__b, *(void *)&__c, __len);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1F40CCE40](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
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

void objc_end_catch(void)
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

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1F40CD560](log, ptr);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

const char *__cdecl protocol_getName(Protocol *p)
{
  return (const char *)MEMORY[0x1F4181B10](p);
}

uint64_t random(void)
{
  return MEMORY[0x1F40CDC18]();
}

long double sin(long double __x)
{
  MEMORY[0x1F40CE058](__x);
  return result;
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

long double tan(long double __x)
{
  MEMORY[0x1F40CE420](__x);
  return result;
}