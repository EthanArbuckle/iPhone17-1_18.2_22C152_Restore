void sub_1B5646D9C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

__CFString *PGStringFromPictureInPictureInterruptionReason(unint64_t a1)
{
  if (a1 > 4) {
    return @"invalid";
  }
  else {
    return off_1E610CDE0[a1];
  }
}

id PGLogCommon()
{
  if (PGLogCommon_onceToken != -1) {
    dispatch_once(&PGLogCommon_onceToken, &__block_literal_global_8);
  }
  v0 = (void *)PGLogCommon___log;

  return v0;
}

uint64_t PGIsPictureInPictureSupported()
{
  return MEMORY[0x1F417CE00](@"nVh/gwNpy7Jv1NOk00CMrw");
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void PGActivateApplication(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  v6 = a3;
  if ((int)a1 < 1)
  {
    v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PGPegasusErrorDomain" code:-1000 userInfo:0];
    v6[2](v6, 0, v9);
  }
  else
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F4E278]);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __PGActivateApplication_block_invoke;
    v10[3] = &unk_1E610C0B8;
    id v11 = v5;
    id v12 = v7;
    v13 = v6;
    id v8 = v7;
    [v8 applicationInfoForPID:a1 completion:v10];
  }
}

void __PGActivateApplication_block_invoke(uint64_t a1, void *a2)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  v3 = [a2 objectForKeyedSubscript:*MEMORY[0x1E4F4E230]];
  if (v3)
  {
    if (openApplicationService_block_invoke_onceToken != -1) {
      dispatch_once(&openApplicationService_block_invoke_onceToken, &__block_literal_global_0);
    }
    if (openApplicationService)
    {
      uint64_t v4 = *(void *)(a1 + 32);
      if (v4)
      {
        uint64_t v15 = *MEMORY[0x1E4FB3500];
        v16[0] = v4;
        id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
      }
      else
      {
        id v5 = 0;
      }
      id v8 = [MEMORY[0x1E4F629C8] optionsWithDictionary:v5];
      v9 = (void *)openApplicationService;
      uint64_t v10 = MEMORY[0x1E4F143A8];
      uint64_t v11 = 3221225472;
      id v12 = __PGActivateApplication_block_invoke_3;
      v13 = &unk_1E610C090;
      id v14 = *(id *)(a1 + 48);
      [v9 openApplication:v3 withOptions:v8 completion:&v10];
    }
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 48);
    id v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PGPegasusErrorDomain" code:-1000 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v7);
  }
  objc_msgSend(*(id *)(a1 + 40), "invalidate", v10, v11, v12, v13);
}

uint64_t __PGActivateApplication_block_invoke_2()
{
  openApplicationService = [MEMORY[0x1E4F629E0] serviceWithDefaultShellEndpoint];

  return MEMORY[0x1F41817F8]();
}

void __PGActivateApplication_block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PGPegasusErrorDomain" code:-1000 userInfo:0];
    (*(void (**)(uint64_t, void, id))(v3 + 16))(v3, 0, v6);
  }
  else
  {
    uint64_t v4 = *(void (**)(uint64_t, uint64_t))(v3 + 16);
    uint64_t v5 = *(void *)(a1 + 32);
    v4(v5, 1);
  }
}

id PGBundleIdentifierForProcessIdentifier(uint64_t a1)
{
  if ((int)a1 < 1)
  {
    uint64_t v3 = 0;
  }
  else
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F4E278]);
    uint64_t v3 = [v2 bundleInfoValueForKey:@"CFBundleIdentifier" PID:a1];
    [v2 invalidate];
  }

  return v3;
}

void sub_1B5648B9C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B56495D0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B5649694(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B564984C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B564C50C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_1B564E93C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id PGBundle()
{
  if (PGBundle_onceToken != -1) {
    dispatch_once(&PGBundle_onceToken, &__block_literal_global_3);
  }
  v0 = (void *)PGBundle_bundle;

  return v0;
}

uint64_t __PGBundle_block_invoke()
{
  PGBundle_bundle = +[_PGBundle bundle];

  return MEMORY[0x1F41817F8]();
}

id PGLocalizedString(void *a1)
{
  id v1 = a1;
  uint64_t v2 = PGBundle();
  uint64_t v3 = [v2 localizedStringForKey:v1 value:&stru_1F0E4F210 table:0];

  return v3;
}

id PGLocalizedStringFromTable(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  uint64_t v5 = PGBundle();
  id v6 = [v5 localizedStringForKey:v4 value:&stru_1F0E4F210 table:v3];

  return v6;
}

void sub_1B56521E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a23, 8);
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

__CFString *NSStringFromPGBackgroundPIPAuthorizationState(unint64_t a1)
{
  if (a1 > 5) {
    return @"invalid";
  }
  else {
    return off_1E610C5E0[a1];
  }
}

void sub_1B5652B70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B5652D68(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B56542FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B5654AAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
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

void sub_1B5654D20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B5655C28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B56568F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id PGPictureInPictureRemoteObjectInterface()
{
  v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0E76708];
  id v1 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", NSClassFromString(&cfstr_Uihostedwindow.isa), 0);
  [v0 setClasses:v1 forSelector:sel_setupStartAnimated_hostedWindowHostingHandle_sceneSessionPersistentIdentifier_preferredContentSize_initialInterfaceOrientation_initialLayerFrame_completionHandler_ argumentIndex:1 ofReply:0];

  return v0;
}

id PGPictureInPictureExportedInterface()
{
  v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0E7A598];
  id v1 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v0 setClasses:v1 forSelector:sel_updateHostedWindowSize_animationType_initialSpringVelocity_synchronizationFence_ argumentIndex:3 ofReply:0];

  return v0;
}

uint64_t __PGLogCommon_block_invoke()
{
  PGLogCommon___log = (uint64_t)os_log_create("com.apple.pegasus", "Common");

  return MEMORY[0x1F41817F8]();
}

id _PGLogMethodProem(void *a1, int a2)
{
  id v3 = a1;
  id v4 = _NSFullMethodName();
  uint64_t v5 = v4;
  if (a2)
  {
    uint64_t v6 = [v4 rangeOfString:@" "];
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v7 = v6;
      id v8 = NSString;
      v9 = [v5 substringToIndex:v6];
      uint64_t v10 = [v5 substringFromIndex:v7 + 1];
      uint64_t v11 = [v8 stringWithFormat:@"%@ (%p) %@", v9, v3, v10];

      uint64_t v5 = (void *)v11;
    }
  }

  return v5;
}

__CFString *PGStringFromPictureInPictureRemoteObjectState(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0xD) {
    return @"Maiden";
  }
  else {
    return off_1E610CD70[a1 - 1];
  }
}

void sub_1B56595D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B565A3E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B565DD74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B565E690(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_1B56627A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B56628C4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B5664704(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

Class __getFBSceneManagerClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!FrontBoardLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __FrontBoardLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_1E610CD38;
    uint64_t v5 = 0;
    FrontBoardLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!FrontBoardLibraryCore_frameworkLibrary) {
    __getFBSceneManagerClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("FBSceneManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getFBSceneManagerClass_block_invoke_cold_2();
  }
  getFBSceneManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __FrontBoardLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  FrontBoardLibraryCore_frameworkLibrary = result;
  return result;
}

__CFString *PGStringFromPictureInPictureControlsStyle(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 4) {
    return @"None";
  }
  else {
    return off_1E610CF50[a1 - 1];
  }
}

__CFString *PGStringFromPlaybackStateContentType(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 5) {
    return @"Unknown";
  }
  else {
    return off_1E610CF78[a1 - 1];
  }
}

void sub_1B5665988(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void PG_dispatch_async_with_timeout(void *a1, void *a2, void *a3, double a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  uint64_t v10 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v11 = dispatch_queue_create("com.apple.pegasus.PG_dispatch_async_with_timeout", v10);

  id v12 = dispatch_get_global_queue(25, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __PG_dispatch_async_with_timeout_block_invoke;
  block[3] = &unk_1E610D078;
  id v18 = v7;
  dispatch_queue_t v19 = v11;
  double v22 = a4;
  id v20 = v8;
  id v21 = v9;
  id v13 = v9;
  id v14 = v11;
  id v15 = v8;
  id v16 = v7;
  dispatch_async(v12, block);
}

void PGWaitForNotificationWithTimeout(void *a1, void *a2, void *a3, void *a4, void *a5, double a6)
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy__1;
  v27[4] = __Block_byref_object_dispose__1;
  id v28 = 0;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __PGWaitForNotificationWithTimeout_block_invoke;
  v22[3] = &unk_1E610D0C8;
  id v25 = v13;
  v26 = v27;
  id v23 = v11;
  id v24 = v12;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __PGWaitForNotificationWithTimeout_block_invoke_3;
  v19[3] = &unk_1E610D0F0;
  id v20 = v14;
  id v21 = v27;
  id v15 = v14;
  id v16 = v12;
  id v17 = v11;
  id v18 = v13;
  PG_dispatch_async_with_timeout(a1, v22, v19, a6);

  _Block_object_dispose(v27, 8);
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

void __PGWaitForNotificationWithTimeout_block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = a1[6];
  if (v4 && (*(unsigned int (**)(void))(v4 + 16))())
  {
    v3[2](v3);
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v6 = a1[4];
    uint64_t v7 = a1[5];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __PGWaitForNotificationWithTimeout_block_invoke_2;
    v11[3] = &unk_1E610D0A0;
    id v12 = v3;
    uint64_t v8 = [v5 addObserverForName:v6 object:v7 queue:0 usingBlock:v11];
    uint64_t v9 = *(void *)(a1[7] + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
}

uint64_t __PGWaitForNotificationWithTimeout_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __PGWaitForNotificationWithTimeout_block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 removeObserver:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];

  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v3();
}

void sub_1B566E544(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
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

void sub_1B566F9DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_1B5672744(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
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
  _Block_object_dispose((const void *)(v11 - 112), 8);
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

void sub_1B567A27C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B567A544(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B567AC94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B567AE08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B567B144(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B567B7C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B567BF84(_Unwind_Exception *a1)
{
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v5 - 96));
  objc_destroyWeak((id *)(v5 - 88));
  _Unwind_Resume(a1);
}

void sub_1B567C528(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1B568308C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
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

uint64_t PGSizeIsInvalid()
{
  return 0;
}

BOOL PGSizeIsZero(double a1, double a2)
{
  return a2 == 0.0 && a1 == 0.0;
}

uint64_t PGSizeIsPositive()
{
  uint64_t result = BSFloatGreaterThanFloat();
  if (result)
  {
    return BSFloatGreaterThanFloat();
  }
  return result;
}

uint64_t PGSizeIsValid()
{
  return 1;
}

uint64_t PGRectIsValid()
{
  return 1;
}

void __getFBSceneManagerClass_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  id v3 = [NSString stringWithUTF8String:"void *FrontBoardLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"PGPictureInPictureRemoteObject.m", 43, @"%s", *a1);

  __break(1u);
}

void __getFBSceneManagerClass_block_invoke_cold_2()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getFBSceneManagerClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"PGPictureInPictureRemoteObject.m", 44, @"Unable to find class %s", "FBSceneManager");

  __break(1u);
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

uint64_t BSDispatchQueueAssertNotMain()
{
  return MEMORY[0x1F410C298]();
}

uint64_t BSFloatGreaterThanFloat()
{
  return MEMORY[0x1F410C338]();
}

uint64_t BSFloatIsZero()
{
  return MEMORY[0x1F410C350]();
}

uint64_t BSLogAddStateCaptureBlockWithTitle()
{
  return MEMORY[0x1F410C420]();
}

uint64_t CAColorMatrixConcat()
{
  return MEMORY[0x1F40F4A48]();
}

uint64_t CAColorMatrixMakeColorSourceOver()
{
  return MEMORY[0x1F40F4A58]();
}

uint64_t CAColorMatrixMakeSaturation()
{
  return MEMORY[0x1F40F4A80]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

void CFRelease(CFTypeRef cf)
{
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

void CFRunLoopObserverInvalidate(CFRunLoopObserverRef observer)
{
}

BOOL CGAffineTransformIsIdentity(CGAffineTransform *t)
{
  return MEMORY[0x1F40D97B0](t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97C8](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D0](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97F0](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97F8](retstr, t, tx, ty);
}

uint64_t CGFloatIsValid()
{
  return MEMORY[0x1F40DA3A0]();
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

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB2C8]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
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

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
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

BOOL UIAccessibilityIsReduceTransparencyEnabled(void)
{
  return MEMORY[0x1F4102B40]();
}

uint64_t UIAnimationDragCoefficient()
{
  return MEMORY[0x1F4102B78]();
}

uint64_t UIPointRoundToScale()
{
  return MEMORY[0x1F4102D40]();
}

uint64_t UIPointRoundToViewScale()
{
  return MEMORY[0x1F4102D48]();
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x1F4102DB8]();
}

uint64_t UIRoundToScale()
{
  return MEMORY[0x1F4102DF0]();
}

uint64_t UIRoundToViewScale()
{
  return MEMORY[0x1F4102E00]();
}

uint64_t UISizeRoundToScale()
{
  return MEMORY[0x1F4102E10]();
}

uint64_t UISizeRoundToViewScale()
{
  return MEMORY[0x1F4102E18]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _NSFullMethodName()
{
  return MEMORY[0x1F40E7358]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x1F40CBEC8]();
}

void free(void *a1)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}