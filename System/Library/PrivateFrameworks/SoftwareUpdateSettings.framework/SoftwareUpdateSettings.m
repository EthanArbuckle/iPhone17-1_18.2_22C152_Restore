id getRUIPageClass()
{
  id v1;
  uint64_t v2;
  int v3;
  int v4;
  uint64_t (*v5)(uint64_t);
  void *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t vars8;

  v9 = 0;
  v10 = &v9;
  v11 = 1342177280;
  v12 = 32;
  v8 = getRUIPageClass_softClass;
  v13 = getRUIPageClass_softClass;
  if (!getRUIPageClass_softClass)
  {
    v2 = MEMORY[0x263EF8330];
    v3 = -1073741824;
    v4 = 0;
    v5 = __getRUIPageClass_block_invoke;
    v6 = &unk_264E072A8;
    v7 = &v9;
    __getRUIPageClass_block_invoke((uint64_t)&v2);
  }
  v1 = (id)v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

uint64_t __os_log_helper_16_2_2_8_64_8_64(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)result = 2;
  *(unsigned char *)(result + 1) = 2;
  *(unsigned char *)(result + 2) = 64;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 64;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

uint64_t __os_log_helper_16_2_1_8_64(uint64_t result, uint64_t a2)
{
  *(unsigned char *)result = 2;
  *(unsigned char *)(result + 1) = 1;
  *(unsigned char *)(result + 2) = 64;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  return result;
}

unsigned char *__os_log_helper_16_0_0(unsigned char *result)
{
  *result = 0;
  result[1] = 0;
  return result;
}

id getAASetupAssistantServiceClass()
{
  uint64_t v9 = 0;
  v10 = &v9;
  int v11 = 1342177280;
  int v12 = 32;
  uint64_t v8 = getAASetupAssistantServiceClass_softClass;
  uint64_t v13 = getAASetupAssistantServiceClass_softClass;
  if (!getAASetupAssistantServiceClass_softClass)
  {
    uint64_t v2 = MEMORY[0x263EF8330];
    int v3 = -1073741824;
    int v4 = 0;
    v5 = __getAASetupAssistantServiceClass_block_invoke;
    v6 = &unk_264E072A8;
    v7 = &v9;
    __getAASetupAssistantServiceClass_block_invoke((uint64_t)&v2);
  }
  id v1 = (id)v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

uint64_t __os_log_helper_16_2_2_8_64_8_0(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)result = 2;
  *(unsigned char *)(result + 1) = 2;
  *(unsigned char *)(result + 2) = 64;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 0;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

id getBYLicenseAgreementClass()
{
  uint64_t v9 = 0;
  v10 = &v9;
  int v11 = 1342177280;
  int v12 = 32;
  uint64_t v8 = getBYLicenseAgreementClass_softClass;
  uint64_t v13 = getBYLicenseAgreementClass_softClass;
  if (!getBYLicenseAgreementClass_softClass)
  {
    uint64_t v2 = MEMORY[0x263EF8330];
    int v3 = -1073741824;
    int v4 = 0;
    v5 = __getBYLicenseAgreementClass_block_invoke;
    v6 = &unk_264E072A8;
    v7 = &v9;
    __getBYLicenseAgreementClass_block_invoke((uint64_t)&v2);
  }
  id v1 = (id)v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

void sub_23BAF0CA0()
{
  _Unwind_Resume(v0);
}

id getkAAProtocolGenericTermsUIBuddyMLKey()
{
  uint64_t v2 = (void **)getkAAProtocolGenericTermsUIBuddyMLKeySymbolLoc();
  if (!v2)
  {
    dlerror();
    abort_report_np();
  }
  v0 = *v2;
  return v0;
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  location = (id *)(a2 + 40);
  uint64_t v2 = *(void **)(a2 + 40);
  int v3 = (id *)(a1 + 40);
  *int v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

id getAAGenericTermsUIRequestClass()
{
  uint64_t v9 = 0;
  v10 = &v9;
  int v11 = 1342177280;
  int v12 = 32;
  uint64_t v8 = getAAGenericTermsUIRequestClass_softClass;
  uint64_t v13 = getAAGenericTermsUIRequestClass_softClass;
  if (!getAAGenericTermsUIRequestClass_softClass)
  {
    uint64_t v2 = MEMORY[0x263EF8330];
    int v3 = -1073741824;
    int v4 = 0;
    v5 = __getAAGenericTermsUIRequestClass_block_invoke;
    v6 = &unk_264E072A8;
    v7 = &v9;
    __getAAGenericTermsUIRequestClass_block_invoke((uint64_t)&v2);
  }
  id v1 = (id)v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

void sub_23BAF1528(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *a11, uint64_t a12, uint64_t a13, id *location)
{
  *(void *)(v14 - 56) = a1;
  *(_DWORD *)(v14 - 60) = a2;
  objc_destroyWeak((id *)(v14 - 48));
  _Unwind_Resume(*(_Unwind_Exception **)(v14 - 56));
}

id getRemoteUIControllerClass()
{
  uint64_t v9 = 0;
  v10 = &v9;
  int v11 = 1342177280;
  int v12 = 32;
  uint64_t v8 = getRemoteUIControllerClass_softClass;
  uint64_t v13 = getRemoteUIControllerClass_softClass;
  if (!getRemoteUIControllerClass_softClass)
  {
    uint64_t v2 = MEMORY[0x263EF8330];
    int v3 = -1073741824;
    int v4 = 0;
    v5 = __getRemoteUIControllerClass_block_invoke;
    v6 = &unk_264E072A8;
    v7 = &v9;
    __getRemoteUIControllerClass_block_invoke((uint64_t)&v2);
  }
  id v1 = (id)v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

id getAAiCloudTermsAgreeRequestClass()
{
  uint64_t v9 = 0;
  v10 = &v9;
  int v11 = 1342177280;
  int v12 = 32;
  uint64_t v8 = getAAiCloudTermsAgreeRequestClass_softClass;
  uint64_t v13 = getAAiCloudTermsAgreeRequestClass_softClass;
  if (!getAAiCloudTermsAgreeRequestClass_softClass)
  {
    uint64_t v2 = MEMORY[0x263EF8330];
    int v3 = -1073741824;
    int v4 = 0;
    v5 = __getAAiCloudTermsAgreeRequestClass_block_invoke;
    v6 = &unk_264E072A8;
    v7 = &v9;
    __getAAiCloudTermsAgreeRequestClass_block_invoke((uint64_t)&v2);
  }
  id v1 = (id)v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

id getAAiCloudTermsDisagreeRequestClass()
{
  uint64_t v9 = 0;
  v10 = &v9;
  int v11 = 1342177280;
  int v12 = 32;
  uint64_t v8 = getAAiCloudTermsDisagreeRequestClass_softClass;
  uint64_t v13 = getAAiCloudTermsDisagreeRequestClass_softClass;
  if (!getAAiCloudTermsDisagreeRequestClass_softClass)
  {
    uint64_t v2 = MEMORY[0x263EF8330];
    int v3 = -1073741824;
    int v4 = 0;
    v5 = __getAAiCloudTermsDisagreeRequestClass_block_invoke;
    v6 = &unk_264E072A8;
    v7 = &v9;
    __getAAiCloudTermsDisagreeRequestClass_block_invoke((uint64_t)&v2);
  }
  id v1 = (id)v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

uint64_t __os_log_helper_16_2_2_8_32_8_64(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)result = 2;
  *(unsigned char *)(result + 1) = 2;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 64;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

uint64_t __os_log_helper_16_2_2_8_32_8_0(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)result = 2;
  *(unsigned char *)(result + 1) = 2;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 0;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

uint64_t __os_log_helper_16_2_1_8_32(uint64_t result, uint64_t a2)
{
  *(unsigned char *)result = 2;
  *(unsigned char *)(result + 1) = 1;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  return result;
}

uint64_t __getRUIPageClass_block_invoke(uint64_t a1)
{
  RemoteUILibrary();
  Class Class = objc_getClass("RUIPage");
  uint64_t result = a1;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = Class;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    uint64_t result = abort_report_np();
  }
  getRUIPageClass_softClass Class = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t RemoteUILibrary()
{
  uint64_t v1 = RemoteUILibraryCore();
  if (!v1) {
    abort_report_np();
  }
  return v1;
}

uint64_t RemoteUILibraryCore()
{
  if (!RemoteUILibraryCore_frameworkLibrary) {
    __RemoteUILibraryCore_block_invoke();
  }
  return RemoteUILibraryCore_frameworkLibrary;
}

uint64_t __RemoteUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  RemoteUILibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t __getAASetupAssistantServiceClass_block_invoke(uint64_t a1)
{
  AppleAccountLibrary();
  Class Class = objc_getClass("AASetupAssistantService");
  uint64_t result = a1;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = Class;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    uint64_t result = abort_report_np();
  }
  getAASetupAssistantServiceClass_softClass Class = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t AppleAccountLibrary()
{
  uint64_t v1 = AppleAccountLibraryCore();
  if (!v1) {
    abort_report_np();
  }
  return v1;
}

uint64_t AppleAccountLibraryCore()
{
  if (!AppleAccountLibraryCore_frameworkLibrary) {
    __AppleAccountLibraryCore_block_invoke();
  }
  return AppleAccountLibraryCore_frameworkLibrary;
}

uint64_t __AppleAccountLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AppleAccountLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t __getBYLicenseAgreementClass_block_invoke(uint64_t a1)
{
  SetupAssistantLibrary();
  Class Class = objc_getClass("BYLicenseAgreement");
  uint64_t result = a1;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = Class;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    uint64_t result = abort_report_np();
  }
  getBYLicenseAgreementClass_softClass Class = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t SetupAssistantLibrary()
{
  uint64_t v1 = SetupAssistantLibraryCore();
  if (!v1) {
    abort_report_np();
  }
  return v1;
}

uint64_t SetupAssistantLibraryCore()
{
  if (!SetupAssistantLibraryCore_frameworkLibrary) {
    __SetupAssistantLibraryCore_block_invoke();
  }
  return SetupAssistantLibraryCore_frameworkLibrary;
}

uint64_t __SetupAssistantLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SetupAssistantLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t getkAAProtocolGenericTermsUIBuddyMLKeySymbolLoc()
{
  uint64_t v9 = 0;
  v10 = &v9;
  int v11 = 0x20000000;
  int v12 = 32;
  uint64_t v8 = getkAAProtocolGenericTermsUIBuddyMLKeySymbolLoc_ptr;
  uint64_t v13 = getkAAProtocolGenericTermsUIBuddyMLKeySymbolLoc_ptr;
  if (!getkAAProtocolGenericTermsUIBuddyMLKeySymbolLoc_ptr)
  {
    uint64_t v2 = MEMORY[0x263EF8330];
    int v3 = -1073741824;
    int v4 = 0;
    v5 = __getkAAProtocolGenericTermsUIBuddyMLKeySymbolLoc_block_invoke;
    v6 = &unk_264E072A8;
    v7 = &v9;
    __getkAAProtocolGenericTermsUIBuddyMLKeySymbolLoc_block_invoke((uint64_t)&v2);
  }
  uint64_t v1 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

uint64_t __getkAAProtocolGenericTermsUIBuddyMLKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v1 = (void *)AppleAccountLibrary();
  uint64_t v2 = dlsym(v1, "kAAProtocolGenericTermsUIBuddyMLKey");
  uint64_t result = a1;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v2;
  getkAAProtocolGenericTermsUIBuddyMLKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __getAAGenericTermsUIRequestClass_block_invoke(uint64_t a1)
{
  AppleAccountLibrary();
  Class Class = objc_getClass("AAGenericTermsUIRequest");
  uint64_t result = a1;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = Class;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    uint64_t result = abort_report_np();
  }
  getAAGenericTermsUIRequestClass_softClass Class = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __getRemoteUIControllerClass_block_invoke(uint64_t a1)
{
  RemoteUILibrary();
  Class Class = objc_getClass("RemoteUIController");
  uint64_t result = a1;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = Class;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    uint64_t result = abort_report_np();
  }
  getRemoteUIControllerClass_softClass Class = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __getAAiCloudTermsAgreeRequestClass_block_invoke(uint64_t a1)
{
  AppleAccountLibrary();
  Class Class = objc_getClass("AAiCloudTermsAgreeRequest");
  uint64_t result = a1;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = Class;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    uint64_t result = abort_report_np();
  }
  getAAiCloudTermsAgreeRequestClass_softClass Class = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __getAAiCloudTermsDisagreeRequestClass_block_invoke(uint64_t a1)
{
  AppleAccountLibrary();
  Class Class = objc_getClass("AAiCloudTermsDisagreeRequest");
  uint64_t result = a1;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = Class;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    uint64_t result = abort_report_np();
  }
  getAAiCloudTermsDisagreeRequestClass_softClass Class = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void _settingDidChangeFontSize()
{
  refreshPadding = 1;
}

id _SUSLoggingFacility()
{
  predicate = (dispatch_once_t *)&_SUSLoggingFacility_onceToken;
  dispatch_block_t block = 0;
  objc_storeStrong(&block, &__block_literal_global_2);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0);
  v0 = (void *)_SUSLoggingFacility_oslog;
  return v0;
}

__CFString *SUSettingsUserDefaultsEntryTypeToString(uint64_t a1)
{
  if (a1)
  {
    if (a1 == 1)
    {
      uint64_t v2 = @"number";
    }
    else if (a1 == 2)
    {
      uint64_t v2 = @"string";
    }
  }
  else
  {
    uint64_t v2 = @"BOOL";
  }
  return v2;
}

id sub_23BB031FC()
{
  sub_23BB035F4();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  qword_268A7C420 = (uint64_t)result;
  return result;
}

uint64_t *sub_23BB03254()
{
  if (qword_268A7C088 != -1) {
    swift_once();
  }
  return &qword_268A7C420;
}

id sub_23BB032A0()
{
  if (qword_268A7C088 != -1) {
    swift_once();
  }
  v0 = (void *)qword_268A7C420;
  return v0;
}

void *sub_23BB032FC()
{
  return &unk_23BB0D1E0;
}

uint64_t sub_23BB03308()
{
  return 0x6572617774666F53;
}

uint64_t sub_23BB0332C()
{
  uint64_t v0 = sub_23BB091B0();
  __swift_allocate_value_buffer(v0, qword_268A7C428);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_268A7C428);
  sub_23BB035F4();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v3 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  id v4 = objc_msgSend(v3, sel_bundlePath);

  sub_23BB094C0();
  sub_23BB091C0();
  swift_bridgeObjectRelease();
  uint64_t v5 = *MEMORY[0x263F06D20];
  v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 104);
  return v6(v1, v5, v0);
}

uint64_t sub_23BB0344C()
{
  if (qword_268A7C090 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_23BB091B0();
  return __swift_project_value_buffer(v0, (uint64_t)qword_268A7C428);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_23BB034E8@<X0>(uint64_t a1@<X8>)
{
  if (qword_268A7C090 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_23BB091B0();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_268A7C428);
  id v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
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

unint64_t sub_23BB035F4()
{
  unint64_t result = qword_268A7BEE0;
  if (!qword_268A7BEE0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268A7BEE0);
  }
  return result;
}

uint64_t UserDefaultsBasedComingSoonTip.options.getter()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7BEE8);
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v3 = (char *)v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7BEF0);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  v7 = (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23BB092F0();
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  MEMORY[0x23ECCD8D0](v7, v4, OpaqueTypeConformance2);
  v11[0] = v4;
  v11[1] = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  uint64_t v9 = sub_23BB09300();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v9;
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

uint64_t UserDefaultsBasedComingSoonTip.title.getter()
{
  return sub_23BB03EEC();
}

uint64_t UserDefaultsBasedComingSoonTip.message.getter()
{
  id v0 = objc_msgSend(self, sel_sharedDefaults);
  id v1 = objc_msgSend(v0, sel_comingSoonTipMessage);

  if (!v1) {
    return 0;
  }
  sub_23BB094C0();

  sub_23BB03FC4();
  return sub_23BB09490();
}

uint64_t UserDefaultsBasedComingSoonTip.rules.getter()
{
  return MEMORY[0x263F8EE78];
}

unint64_t sub_23BB03948(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A7BF20);
  uint64_t v2 = sub_23BB095B0();
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
    sub_23BB04630(v6, (uint64_t)&v15);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_23BB03D90(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    int v11 = (uint64_t *)(v3[6] + 16 * result);
    *int v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_23BB04698(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 48;
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

uint64_t sub_23BB03A7C()
{
  return sub_23BB03EEC();
}

uint64_t sub_23BB03AA0()
{
  id v0 = objc_msgSend(self, sel_sharedDefaults);
  id v1 = objc_msgSend(v0, sel_comingSoonTipMessage);

  if (!v1) {
    return 0;
  }
  sub_23BB094C0();

  sub_23BB03FC4();
  return sub_23BB09490();
}

uint64_t sub_23BB03B60()
{
  return MEMORY[0x263F8EE78];
}

uint64_t sub_23BB03B6C()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7BEE8);
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v3 = (char *)v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7BEF0);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23BB092F0();
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  MEMORY[0x23ECCD8D0](v7, v4, OpaqueTypeConformance2);
  v11[0] = v4;
  v11[1] = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  uint64_t v9 = sub_23BB09300();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v9;
}

uint64_t sub_23BB03D50@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  unint64_t v4 = sub_23BB043E0();
  uint64_t result = MEMORY[0x23ECCD810](a1, v4);
  *a2 = result;
  a2[1] = v6;
  return result;
}

unint64_t sub_23BB03D90(uint64_t a1, uint64_t a2)
{
  sub_23BB095E0();
  sub_23BB094E0();
  uint64_t v4 = sub_23BB095F0();
  return sub_23BB03E08(a1, a2, v4);
}

unint64_t sub_23BB03E08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    char v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_23BB095D0() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        BOOL v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_23BB095D0() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_23BB03EEC()
{
  id v0 = objc_msgSend(self, sel_sharedDefaults);
  id v1 = objc_msgSend(v0, sel_comingSoonTipTitle);

  if (v1)
  {
    sub_23BB094C0();

    sub_23BB03FC4();
    return sub_23BB09490();
  }
  else
  {
    sub_23BB09470();
    return sub_23BB09480();
  }
}

unint64_t sub_23BB03FC4()
{
  unint64_t result = qword_268A7BEF8;
  if (!qword_268A7BEF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A7BEF8);
  }
  return result;
}

uint64_t _s22SoftwareUpdateSettings30UserDefaultsBasedComingSoonTipV7actionsSay0I3Kit4TipsO6ActionVGvg_0()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A7BF10);
  ((void (*)(void))MEMORY[0x270FA5388])();
  id v1 = (char *)&v17 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_23BB091F0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  uint64_t v5 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  unint64_t v6 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v17 - v7;
  id v9 = objc_msgSend(self, sel_sharedDefaults);
  id v10 = objc_msgSend(v9, sel_comingSoonTipLearnMoreLink);

  if (v10)
  {
    sub_23BB094C0();

    sub_23BB091E0();
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) != 1)
    {
      uint64_t v12 = *(void (**)(char *, char *, uint64_t))(v3 + 32);
      v12(v8, v1, v2);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268A7BF18);
      sub_23BB09420();
      uint64_t v11 = swift_allocObject();
      *(_OWORD *)(v11 + 16) = xmmword_23BB0D1F0;
      v13._countAndFlagsBits = 0x4F4D5F4E5241454CLL;
      v13._object = (void *)0xEF4B4E494C5F4552;
      Swift::String v17 = localizedUIString(_:)(v13);
      (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v6, v8, v2);
      unint64_t v14 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
      uint64_t v15 = swift_allocObject();
      v12((char *)(v15 + v14), v6, v2);
      sub_23BB03FC4();
      sub_23BB09410();
      (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
      return v11;
    }
    sub_23BB04434((uint64_t)v1);
  }
  return MEMORY[0x263F8EE78];
}

unint64_t sub_23BB04370()
{
  unint64_t result = qword_268A7BF00;
  if (!qword_268A7BF00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A7BF00);
  }
  return result;
}

uint64_t sub_23BB043C4()
{
  return MEMORY[0x263F8D320];
}

ValueMetadata *type metadata accessor for UserDefaultsBasedComingSoonTip()
{
  return &type metadata for UserDefaultsBasedComingSoonTip;
}

unint64_t sub_23BB043E0()
{
  unint64_t result = qword_268A7BF08;
  if (!qword_268A7BF08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A7BF08);
  }
  return result;
}

uint64_t sub_23BB04434(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7BF10);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23BB04494()
{
  uint64_t v1 = sub_23BB091F0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

void sub_23BB04524()
{
  sub_23BB091F0();
  id v2 = objc_msgSend(self, sel_defaultWorkspace);
  if (v2)
  {
    uint64_t v0 = (void *)sub_23BB091D0();
    sub_23BB03948(MEMORY[0x263F8EE78]);
    uint64_t v1 = (void *)sub_23BB094A0();
    swift_bridgeObjectRelease();
    objc_msgSend(v2, sel_openSensitiveURL_withOptions_, v0, v1);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_23BB04630(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7BF28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_23BB04698(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

Swift::String __swiftcall localizedUIString(_:)(Swift::String a1)
{
  id v1 = (id)*sub_23BB03254();
  long long v2 = (void *)sub_23BB094B0();
  uint64_t v3 = (void *)sub_23BB094B0();
  uint64_t v4 = (void *)sub_23BB094B0();
  id v5 = objc_msgSend(v1, sel_localizedStringForKey_value_table_, v2, v3, v4);

  uint64_t v6 = sub_23BB094C0();
  uint64_t v8 = v7;

  uint64_t v9 = v6;
  id v10 = v8;
  result._object = v10;
  result._countAndFlagsBits = v9;
  return result;
}

Swift::String __swiftcall localizedUIModelString(_:)(Swift::String a1)
{
  id v1 = (void *)*sub_23BB03254();
  long long v2 = self;
  id v3 = v1;
  uint64_t v4 = (void *)sub_23BB094B0();
  id v5 = objc_msgSend(v2, sel_modelSpecificLocalizedStringKeyForKey_, v4);

  if (v5)
  {
    uint64_t v8 = (void *)sub_23BB094B0();
    uint64_t v9 = (void *)sub_23BB094B0();
    id v10 = objc_msgSend(v3, sel_localizedStringForKey_value_table_, v5, v8, v9);

    uint64_t v11 = sub_23BB094C0();
    Swift::String v13 = v12;

    uint64_t v6 = v11;
    uint64_t v7 = v13;
  }
  else
  {
    __break(1u);
  }
  result._object = v7;
  result._countAndFlagsBits = v6;
  return result;
}

Swift::String __swiftcall localizedUIWAPIString(_:)(Swift::String a1)
{
  id v1 = (void *)sub_23BB094B0();
  id v2 = (id)SFLocalizableWAPIStringKeyForKey();

  sub_23BB094C0();
  id v3 = (id)*sub_23BB03254();
  uint64_t v4 = (void *)sub_23BB094B0();
  id v5 = (void *)sub_23BB094B0();
  uint64_t v6 = (void *)sub_23BB094B0();
  id v7 = objc_msgSend(v3, sel_localizedStringForKey_value_table_, v4, v5, v6);

  uint64_t v8 = sub_23BB094C0();
  id v10 = v9;
  swift_bridgeObjectRelease();

  uint64_t v11 = v8;
  uint64_t v12 = v10;
  result._object = v12;
  result._countAndFlagsBits = v11;
  return result;
}

uint64_t sub_23BB049B4()
{
  return 0;
}

Swift::String __swiftcall localizedRsrSupportedUIString(_:isSplatUpdate:)(Swift::String _, Swift::Bool isSplatUpdate)
{
  if (isSplatUpdate) {
    sub_23BB094F0();
  }
  else {
    sub_23BB092D0();
  }
  id v2 = (id)*sub_23BB03254();
  id v3 = (void *)sub_23BB094B0();
  uint64_t v4 = (void *)sub_23BB094B0();
  id v5 = (void *)sub_23BB094B0();
  id v6 = objc_msgSend(v2, sel_localizedStringForKey_value_table_, v3, v4, v5);

  uint64_t v7 = sub_23BB094C0();
  uint64_t v9 = v8;
  swift_bridgeObjectRelease();

  uint64_t v10 = v7;
  uint64_t v11 = v9;
  result._object = v11;
  result._countAndFlagsBits = v10;
  return result;
}

uint64_t sub_23BB04AE0()
{
  return 0;
}

Swift::String __swiftcall localizedRsrSupportedUIModelString(_:isSplatUpdate:)(Swift::String _, Swift::Bool isSplatUpdate)
{
  uint64_t v2 = sub_23BB04B20(_._countAndFlagsBits, (unint64_t)_._object, isSplatUpdate, (uint64_t (*)(uint64_t, unint64_t))localizedUIModelString(_:));
  result._object = v3;
  result._countAndFlagsBits = v2;
  return result;
}

uint64_t sub_23BB04B00()
{
  return 0;
}

Swift::String __swiftcall localizedRsrSupportedUIWAPIString(_:isSplatUpdate:)(Swift::String _, Swift::Bool isSplatUpdate)
{
  uint64_t v2 = sub_23BB04B20(_._countAndFlagsBits, (unint64_t)_._object, isSplatUpdate, (uint64_t (*)(uint64_t, unint64_t))localizedUIWAPIString(_:));
  result._object = v3;
  result._countAndFlagsBits = v2;
  return result;
}

uint64_t sub_23BB04B20(uint64_t a1, unint64_t a2, char a3, uint64_t (*a4)(uint64_t, unint64_t))
{
  if (a3)
  {
    sub_23BB094F0();
    a1 = 1599230802;
    a2 = 0xE400000000000000;
  }
  else
  {
    sub_23BB092D0();
  }
  uint64_t v7 = a4(a1, a2);
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t variable initialization expression of MockedComingSoonTip.titleText()
{
  return 0;
}

uint64_t MockedComingSoonTip.titleText.getter()
{
  uint64_t v1 = *v0;
  sub_23BB092D0();
  return v1;
}

uint64_t MockedComingSoonTip.titleText.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*MockedComingSoonTip.titleText.modify())()
{
  return nullsub_2;
}

uint64_t variable initialization expression of MockedComingSoonTip.messageText()
{
  return 0;
}

uint64_t MockedComingSoonTip.messageText.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  sub_23BB092D0();
  return v1;
}

uint64_t MockedComingSoonTip.messageText.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return result;
}

uint64_t (*MockedComingSoonTip.messageText.modify())()
{
  return nullsub_3;
}

uint64_t variable initialization expression of MockedComingSoonTip.learnMoreLink()
{
  return 0;
}

uint64_t MockedComingSoonTip.learnMoreLink.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  sub_23BB092D0();
  return v1;
}

uint64_t MockedComingSoonTip.learnMoreLink.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 32) = a1;
  *(void *)(v2 + 40) = a2;
  return result;
}

uint64_t (*MockedComingSoonTip.learnMoreLink.modify())()
{
  return nullsub_4;
}

uint64_t sub_23BB04D7C()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7BF30);
  __swift_allocate_value_buffer(v0, qword_268A7C440);
  __swift_project_value_buffer(v0, (uint64_t)qword_268A7C440);
  return sub_23BB09450();
}

uint64_t sub_23BB04E2C()
{
  if (qword_268A7C1A0 != -1) {
    swift_once();
  }
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7BF30);
  return __swift_project_value_buffer(v0, (uint64_t)qword_268A7C440);
}

uint64_t sub_23BB04E94@<X0>(uint64_t a1@<X8>)
{
  if (qword_268A7C1A0 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7BF30);
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_268A7C440);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_23BB04F58(uint64_t a1)
{
  if (qword_268A7C1A0 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7BF30);
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_268A7C440);
  swift_beginAccess();
  uint64_t v4 = *(void *)(v2 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 24))(v3, a1, v2);
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v2);
}

uint64_t (*sub_23BB05054())()
{
  if (qword_268A7C1A0 != -1) {
    swift_once();
  }
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7BF30);
  __swift_project_value_buffer(v0, (uint64_t)qword_268A7C440);
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_23BB050F0()
{
  if (qword_268A7C1A0 != -1) {
    swift_once();
  }
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7BF30);
  __swift_project_value_buffer(v0, (uint64_t)qword_268A7C440);
  swift_beginAccess();
  sub_23BB09430();
  swift_endAccess();
  return v2;
}

uint64_t sub_23BB05190()
{
  if (qword_268A7C1A0 != -1) {
    swift_once();
  }
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7BF30);
  __swift_project_value_buffer(v0, (uint64_t)qword_268A7C440);
  swift_beginAccess();
  sub_23BB09440();
  return swift_endAccess();
}

void (*sub_23BB05240(void *a1))(uint64_t a1)
{
  unsigned __int8 v2 = malloc(0x30uLL);
  *a1 = v2;
  if (qword_268A7C1A0 != -1) {
    swift_once();
  }
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7BF30);
  v2[3] = v3;
  v2[4] = __swift_project_value_buffer(v3, (uint64_t)qword_268A7C440);
  swift_beginAccess();
  sub_23BB09430();
  char v4 = *((unsigned char *)v2 + 41);
  swift_endAccess();
  *((unsigned char *)v2 + 40) = v4;
  return sub_23BB0532C;
}

void sub_23BB0532C(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  *(unsigned char *)(*(void *)a1 + 41) = *(unsigned char *)(*(void *)a1 + 40);
  swift_beginAccess();
  sub_23BB09440();
  swift_endAccess();
  free(v1);
}

uint64_t MockedComingSoonTip.options.getter()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7BEE8);
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7BEF0);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23BB092F0();
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  MEMORY[0x23ECCD8D0](v7, v4, OpaqueTypeConformance2);
  v11[0] = v4;
  v11[1] = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  uint64_t v9 = sub_23BB09300();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v9;
}

uint64_t MockedComingSoonTip.title.getter()
{
  return sub_23BB09490();
}

uint64_t MockedComingSoonTip.message.getter()
{
  if (!*(void *)(v0 + 24)) {
    return 0;
  }
  sub_23BB03FC4();
  sub_23BB092D0();
  return sub_23BB09490();
}

uint64_t MockedComingSoonTip.rules.getter()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7BF30);
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A7BF38);
  sub_23BB093F0();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_23BB0D1F0;
  if (qword_268A7C1A0 != -1) {
    swift_once();
  }
  uint64_t v4 = __swift_project_value_buffer(v0, (uint64_t)qword_268A7C440);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v4, v0);
  sub_23BB09400();
  sub_23BB092D0();
  swift_bridgeObjectRelease();
  uint64_t v5 = sub_23BB092D0();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_23BB05858@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7BF50);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = &v11[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7BF58);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = &v11[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_23BB06978(&qword_268A7BF60, &qword_268A7BF58);
  sub_23BB091A0();
  v11[15] = 1;
  sub_23BB09190();
  a1[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7BF68);
  a1[4] = sub_23BB06800();
  __swift_allocate_boxed_opaque_existential_1(a1);
  sub_23BB06978(&qword_268A7BF88, &qword_268A7BF50);
  sub_23BB09180();
  (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t MockedComingSoonTip.actions.getter()
{
  return sub_23BB05FF4(*(void *)(v0 + 32), *(void *)(v0 + 40));
}

double sub_23BB05AA4@<D0>(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0xE000000000000000;
  double result = 0.0;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  return result;
}

uint64_t sub_23BB05AB8()
{
  return 0;
}

uint64_t sub_23BB05AC4()
{
  return 0;
}

uint64_t sub_23BB05AD0()
{
  return 0;
}

uint64_t sub_23BB05ADC@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, void *a7@<X8>)
{
  *a7 = result;
  a7[1] = a2;
  a7[2] = a3;
  a7[3] = a4;
  a7[4] = a5;
  a7[5] = a6;
  return result;
}

uint64_t sub_23BB05AF0()
{
  return sub_23BB09490();
}

uint64_t sub_23BB05B44()
{
  if (!*(void *)(v0 + 24)) {
    return 0;
  }
  sub_23BB03FC4();
  sub_23BB092D0();
  return sub_23BB09490();
}

uint64_t sub_23BB05BB8()
{
  return sub_23BB05FF4(*(void *)(v0 + 32), *(void *)(v0 + 40));
}

uint64_t sub_23BB05BC0()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7BF30);
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A7BF38);
  sub_23BB093F0();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_23BB0D1F0;
  if (qword_268A7C1A0 != -1) {
    swift_once();
  }
  uint64_t v4 = __swift_project_value_buffer(v0, (uint64_t)qword_268A7C440);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v4, v0);
  sub_23BB09400();
  sub_23BB092D0();
  swift_bridgeObjectRelease();
  uint64_t v5 = sub_23BB092D0();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_23BB05DD0()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7BEE8);
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7BEF0);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23BB092F0();
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  MEMORY[0x23ECCD8D0](v7, v4, OpaqueTypeConformance2);
  v11[0] = v4;
  v11[1] = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  uint64_t v9 = sub_23BB09300();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v9;
}

uint64_t sub_23BB05FB4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  unint64_t v4 = sub_23BB065C8();
  uint64_t result = MEMORY[0x23ECCD810](a1, v4);
  *a2 = result;
  a2[1] = v6;
  return result;
}

uint64_t sub_23BB05FF4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A7BF10);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_23BB091F0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v19 - v11;
  if (a2)
  {
    sub_23BB091E0();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) != 1)
    {
      unint64_t v14 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
      v14(v12, v5, v6);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268A7BF18);
      sub_23BB09420();
      uint64_t v13 = swift_allocObject();
      *(_OWORD *)(v13 + 16) = xmmword_23BB0D1F0;
      v15._countAndFlagsBits = 0x4F4D5F4E5241454CLL;
      v15._object = (void *)0xEF4B4E494C5F4552;
      Swift::String v19 = localizedUIString(_:)(v15);
      (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v12, v6);
      unint64_t v16 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
      uint64_t v17 = swift_allocObject();
      v14((char *)(v17 + v16), v10, v6);
      sub_23BB03FC4();
      sub_23BB09410();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
      return v13;
    }
    sub_23BB04434((uint64_t)v5);
  }
  return MEMORY[0x263F8EE78];
}

unint64_t sub_23BB062F8()
{
  unint64_t result = qword_268A7BF40;
  if (!qword_268A7BF40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A7BF40);
  }
  return result;
}

uint64_t sub_23BB0634C()
{
  return MEMORY[0x263F8D320];
}

uint64_t initializeBufferWithCopyOfBuffer for MockedComingSoonTip(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for MockedComingSoonTip()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for MockedComingSoonTip(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  uint64_t v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  sub_23BB092D0();
  sub_23BB092D0();
  sub_23BB092D0();
  return a1;
}

void *assignWithCopy for MockedComingSoonTip(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  sub_23BB092D0();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  sub_23BB092D0();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  sub_23BB092D0();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

void *assignWithTake for MockedComingSoonTip(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for MockedComingSoonTip(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MockedComingSoonTip(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 48) = 1;
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
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MockedComingSoonTip()
{
  return &type metadata for MockedComingSoonTip;
}

unint64_t sub_23BB065C8()
{
  unint64_t result = qword_268A7BF48;
  if (!qword_268A7BF48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A7BF48);
  }
  return result;
}

uint64_t sub_23BB0661C()
{
  uint64_t v1 = sub_23BB091F0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

void sub_23BB066AC()
{
  sub_23BB091F0();
  id v2 = objc_msgSend(self, sel_defaultWorkspace);
  if (v2)
  {
    uint64_t v0 = (void *)sub_23BB091D0();
    sub_23BB03948(MEMORY[0x263F8EE78]);
    uint64_t v1 = (void *)sub_23BB094A0();
    swift_bridgeObjectRelease();
    objc_msgSend(v2, sel_openSensitiveURL_withOptions_, v0, v1);
  }
  else
  {
    __break(1u);
  }
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

unint64_t sub_23BB06800()
{
  unint64_t result = qword_268A7BF70;
  if (!qword_268A7BF70)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268A7BF68);
    sub_23BB06978(&qword_268A7BF78, &qword_268A7BF58);
    sub_23BB068A0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A7BF70);
  }
  return result;
}

unint64_t sub_23BB068A0()
{
  unint64_t result = qword_268A7BF80;
  if (!qword_268A7BF80)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268A7BF50);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A7BF80);
  }
  return result;
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

uint64_t sub_23BB06978(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_23BB069BC()
{
  uint64_t v0 = sub_23BB09240();
  __swift_allocate_value_buffer(v0, qword_268A7C2B8);
  __swift_project_value_buffer(v0, (uint64_t)qword_268A7C2B8);
  return sub_23BB09230();
}

id sub_23BB06A3C()
{
  id result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for SUSettingsSwiftTipsManager()), sel_init);
  static SUSettingsSwiftTipsManager.shared = (uint64_t)result;
  return result;
}

id SUSettingsSwiftTipsManager.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

uint64_t *SUSettingsSwiftTipsManager.shared.unsafeMutableAddressor()
{
  if (qword_268A7C2D0 != -1) {
    swift_once();
  }
  return &static SUSettingsSwiftTipsManager.shared;
}

id static SUSettingsSwiftTipsManager.shared.getter()
{
  if (qword_268A7C2D0 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)static SUSettingsSwiftTipsManager.shared;
  return v0;
}

double variable initialization expression of SUSettingsSwiftTipsManager.mockedComingSoonTip@<D0>(_OWORD *a1@<X8>)
{
  sub_23BB05AA4((uint64_t)v4);
  long long v2 = v4[1];
  *a1 = v4[0];
  a1[1] = v2;
  double result = *(double *)&v5;
  a1[2] = v5;
  return result;
}

unint64_t SUSettingsSwiftTipsManager.comingSoonTip.getter@<X0>(void *a1@<X8>)
{
  if (*((unsigned char *)v1 + OBJC_IVAR___SUSettingsSwiftTipsManager_inManualControl))
  {
    uint64_t v3 = (void *)((char *)v1 + OBJC_IVAR___SUSettingsSwiftTipsManager_mockedComingSoonTip);
    uint64_t v5 = *(void *)((char *)v1 + OBJC_IVAR___SUSettingsSwiftTipsManager_mockedComingSoonTip);
    uint64_t v4 = *(void *)((char *)v1 + OBJC_IVAR___SUSettingsSwiftTipsManager_mockedComingSoonTip + 8);
    uint64_t v7 = v3[2];
    uint64_t v6 = v3[3];
    uint64_t v9 = v3[4];
    uint64_t v8 = v3[5];
    a1[3] = &type metadata for MockedComingSoonTip;
    a1[4] = sub_23BB065C8();
    uint64_t v10 = (void *)swift_allocObject();
    *a1 = v10;
    v10[2] = v5;
    v10[3] = v4;
    v10[4] = v7;
    v10[5] = v6;
    v10[6] = v9;
    v10[7] = v8;
    sub_23BB092D0();
    sub_23BB092D0();
    return sub_23BB092D0();
  }
  else
  {
    if ((*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v1) + 0x88))())
    {
      a1[3] = &type metadata for UserDefaultsBasedComingSoonTip;
      unint64_t result = sub_23BB043E0();
    }
    else
    {
      a1[3] = &type metadata for ConstellationComingSoonTip;
      unint64_t result = sub_23BB08860();
    }
    a1[4] = result;
  }
  return result;
}

uint64_t variable initialization expression of SUSettingsSwiftTipsManager.inManualControl()
{
  return 0;
}

Swift::Void __swiftcall SUSettingsSwiftTipsManager.setup()()
{
  (*(void (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB8))(0);
}

Swift::Void __swiftcall SUSettingsSwiftTipsManager.setup(forManualControl:)(Swift::Bool forManualControl)
{
  BOOL v1 = forManualControl;
  uint64_t v2 = sub_23BB093C0();
  uint64_t v54 = *(void *)(v2 - 8);
  uint64_t v55 = v2;
  MEMORY[0x270FA5388](v2);
  v59 = (char *)&v54 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = sub_23BB09390();
  uint64_t v4 = *(void *)(v58 - 8);
  MEMORY[0x270FA5388](v58);
  uint64_t v6 = (char *)&v54 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v57 = sub_23BB09360();
  uint64_t v7 = *(void *)(v57 - 8);
  MEMORY[0x270FA5388](v57);
  uint64_t v9 = (char *)&v54 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_268A7C2B0 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_23BB09240();
  uint64_t v60 = __swift_project_value_buffer(v10, (uint64_t)qword_268A7C2B8);
  uint64_t v11 = sub_23BB09220();
  os_log_type_t v12 = sub_23BB09550();
  BOOL v13 = os_log_type_enabled(v11, v12);
  LODWORD(v61) = v1;
  if (v13)
  {
    uint64_t v14 = swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    uint64_t v62 = v15;
    *(_DWORD *)uint64_t v14 = 136315394;
    v64[0] = sub_23BB07FF4(0xD000000000000018, 0x800000023BB0C3B0, &v62);
    LOBYTE(v1) = v61;
    sub_23BB09560();
    *(_WORD *)(v14 + 12) = 1024;
    LODWORD(v64[0]) = v1;
    sub_23BB09560();
    _os_log_impl(&dword_23BAE9000, v11, v12, "%s: Setting up SUSettingsSwiftTipsManager (manual control: %{BOOL}d).", (uint8_t *)v14, 0x12u);
    swift_arrayDestroy();
    MEMORY[0x23ECCE190](v15, -1, -1);
    MEMORY[0x23ECCE190](v14, -1, -1);
  }

  unint64_t v16 = (void *)MEMORY[0x263F8EED0];
  if (v1) {
    goto LABEL_9;
  }
  if (qword_268A7C2D0 != -1) {
    swift_once();
  }
  if ((*(uint64_t (**)(void))((*v16 & *(void *)static SUSettingsSwiftTipsManager.shared) + 0x88))())
  {
LABEL_9:
    uint64_t v17 = sub_23BB09220();
    os_log_type_t v18 = sub_23BB09550();
    if (os_log_type_enabled(v17, v18))
    {
      Swift::String v19 = (uint8_t *)swift_slowAlloc();
      uint64_t v20 = swift_slowAlloc();
      uint64_t v62 = v20;
      *(_DWORD *)Swift::String v19 = 136315138;
      v64[0] = sub_23BB07FF4(0xD000000000000018, 0x800000023BB0C3B0, &v62);
      sub_23BB09560();
      _os_log_impl(&dword_23BAE9000, v17, v18, "%s: Resetting the datastore.", v19, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23ECCE190](v20, -1, -1);
      MEMORY[0x23ECCE190](v19, -1, -1);
    }

    sub_23BB09320();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A7BFA8);
  sub_23BB093E0();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_23BB0D3F0;
  sub_23BB09350();
  sub_23BB09370();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v57);
  sub_23BB09380();
  sub_23BB093A0();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v58);
  v21 = v59;
  sub_23BB093B0();
  sub_23BB093D0();
  (*(void (**)(char *, uint64_t))(v54 + 8))(v21, v55);
  sub_23BB09460();
  swift_bridgeObjectRelease();
  v22 = (void *)MEMORY[0x263F8EED0];
  if (v61)
  {
    *(unsigned char *)(v56 + OBJC_IVAR___SUSettingsSwiftTipsManager_inManualControl) = 1;
  }
  else
  {
    if (qword_268A7C2D0 != -1) {
      swift_once();
    }
    if ((*(uint64_t (**)(void))((*v22 & *(void *)static SUSettingsSwiftTipsManager.shared) + 0x88))())
    {
      v23 = sub_23BB09220();
      os_log_type_t v24 = sub_23BB09550();
      if (os_log_type_enabled(v23, v24))
      {
        uint64_t v25 = swift_slowAlloc();
        uint64_t v26 = swift_slowAlloc();
        v64[0] = v26;
        *(_DWORD *)uint64_t v25 = 136316418;
        uint64_t v62 = sub_23BB07FF4(0xD000000000000018, 0x800000023BB0C3B0, v64);
        sub_23BB09560();
        *(_WORD *)(v25 + 12) = 1024;
        v27 = self;
        id v28 = objc_msgSend(v27, sel_sharedDefaults);
        unsigned int v29 = objc_msgSend(v28, sel_shouldShowComingSoonTip);

        LODWORD(v62) = v29;
        sub_23BB09560();
        *(_WORD *)(v25 + 18) = 1024;
        id v30 = objc_msgSend(v27, sel_sharedDefaults);
        unsigned int v31 = objc_msgSend(v30, sel_shouldHideComingSoonTip);

        LODWORD(v62) = v31;
        sub_23BB09560();
        *(_WORD *)(v25 + 24) = 2080;
        id v32 = objc_msgSend(v27, sel_sharedDefaults);
        id v33 = objc_msgSend(v32, sel_comingSoonTipTitle);

        uint64_t v61 = v26;
        if (v33)
        {
          uint64_t v34 = sub_23BB094C0();
          uint64_t v36 = v35;
        }
        else
        {
          uint64_t v34 = 0;
          uint64_t v36 = 0;
        }
        uint64_t v62 = v34;
        uint64_t v63 = v36;
        __swift_instantiateConcreteTypeFromMangledName(&qword_268A7BFB0);
        uint64_t v37 = sub_23BB094D0();
        uint64_t v62 = sub_23BB07FF4(v37, v38, v64);
        sub_23BB09560();
        swift_bridgeObjectRelease();
        *(_WORD *)(v25 + 34) = 2080;
        id v39 = objc_msgSend(v27, sel_sharedDefaults);
        id v40 = objc_msgSend(v39, sel_comingSoonTipMessage);

        if (v40)
        {
          uint64_t v41 = sub_23BB094C0();
          uint64_t v43 = v42;
        }
        else
        {
          uint64_t v41 = 0;
          uint64_t v43 = 0;
        }
        uint64_t v62 = v41;
        uint64_t v63 = v43;
        uint64_t v44 = sub_23BB094D0();
        uint64_t v62 = sub_23BB07FF4(v44, v45, v64);
        sub_23BB09560();
        swift_bridgeObjectRelease();
        *(_WORD *)(v25 + 44) = 2080;
        id v46 = objc_msgSend(v27, sel_sharedDefaults);
        id v47 = objc_msgSend(v46, sel_comingSoonTipLearnMoreLink);

        if (v47)
        {
          uint64_t v48 = sub_23BB094C0();
          uint64_t v50 = v49;
        }
        else
        {
          uint64_t v48 = 0;
          uint64_t v50 = 0;
        }
        uint64_t v62 = v48;
        uint64_t v63 = v50;
        uint64_t v51 = sub_23BB094D0();
        uint64_t v62 = sub_23BB07FF4(v51, v52, v64);
        sub_23BB09560();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_23BAE9000, v23, v24, "%s Overring the default Coming Soon tip content and returning UserDefaultsBasedComingSoonTip instead.\nForce show: %{BOOL}d\nForce hide: %{BOOL}d\nTitle: %s\nMessage: %s\nLearn More URL: %s", (uint8_t *)v25, 0x36u);
        uint64_t v53 = v61;
        swift_arrayDestroy();
        MEMORY[0x23ECCE190](v53, -1, -1);
        MEMORY[0x23ECCE190](v25, -1, -1);
      }
    }
  }
}

Swift::Void __swiftcall SUSettingsSwiftTipsManager.configureManualComingSoonTip(withTitle:andContent:learnMoreLink:)(Swift::String withTitle, Swift::String_optional andContent, Swift::String_optional learnMoreLink)
{
  uint64_t v4 = v3;
  object = learnMoreLink.value._object;
  uint64_t countAndFlagsBits = learnMoreLink.value._countAndFlagsBits;
  uint64_t v7 = andContent.value._object;
  uint64_t v8 = andContent.value._countAndFlagsBits;
  uint64_t v9 = withTitle._object;
  uint64_t v10 = withTitle._countAndFlagsBits;
  if (qword_268A7C2B0 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_23BB09240();
  __swift_project_value_buffer(v11, (uint64_t)qword_268A7C2B8);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  os_log_type_t v12 = sub_23BB09220();
  os_log_type_t v13 = sub_23BB09550();
  if (os_log_type_enabled(v12, v13))
  {
    os_log_type_t type = v13;
    uint64_t v14 = swift_slowAlloc();
    uint64_t v21 = swift_slowAlloc();
    uint64_t v22 = v21;
    *(_DWORD *)uint64_t v14 = 136315906;
    sub_23BB07FF4(0xD000000000000041, 0x800000023BB0C3D0, &v22);
    sub_23BB09560();
    *(_WORD *)(v14 + 12) = 2080;
    sub_23BB092D0();
    sub_23BB07FF4(v10, (unint64_t)v9, &v22);
    sub_23BB09560();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v14 + 22) = 2080;
    sub_23BB092D0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268A7BFB0);
    uint64_t v15 = sub_23BB094D0();
    sub_23BB07FF4(v15, v16, &v22);
    sub_23BB09560();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v14 + 32) = 2080;
    sub_23BB092D0();
    uint64_t v17 = sub_23BB094D0();
    sub_23BB07FF4(v17, v18, &v22);
    sub_23BB09560();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23BAE9000, v12, type, "%s: Setting up the Mocked Coming Soon tip with:\n    title: %s\n    content: %s\n    learnMoreLink: %s", (uint8_t *)v14, 0x2Au);
    swift_arrayDestroy();
    MEMORY[0x23ECCE190](v21, -1, -1);
    MEMORY[0x23ECCE190](v14, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  *(unsigned char *)(v4 + OBJC_IVAR___SUSettingsSwiftTipsManager_inManualControl) = 1;
  Swift::String v19 = (uint64_t *)(v4 + OBJC_IVAR___SUSettingsSwiftTipsManager_mockedComingSoonTip);
  *Swift::String v19 = v10;
  v19[1] = (uint64_t)v9;
  sub_23BB092D0();
  swift_bridgeObjectRelease();
  v19[2] = v8;
  v19[3] = (uint64_t)v7;
  sub_23BB092D0();
  swift_bridgeObjectRelease();
  v19[4] = countAndFlagsBits;
  v19[5] = (uint64_t)object;
  sub_23BB092D0();
  swift_bridgeObjectRelease();
  sub_23BB05190();
}

id SUSettingsSwiftTipsManager.init()()
{
  BOOL v1 = v0;
  uint64_t v2 = nullsub_6();
  nullsub_1(v2);
  uint64_t v3 = &v1[OBJC_IVAR___SUSettingsSwiftTipsManager_mockedComingSoonTip];
  sub_23BB05AA4((uint64_t)v7);
  long long v4 = v7[1];
  *uint64_t v3 = v7[0];
  v3[1] = v4;
  v3[2] = v7[2];
  v1[OBJC_IVAR___SUSettingsSwiftTipsManager_inManualControl] = 0;

  v6.receiver = v1;
  v6.super_class = (Class)type metadata accessor for SUSettingsSwiftTipsManager();
  return objc_msgSendSuper2(&v6, sel_init);
}

id SUSettingsSwiftTipsManager.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SUSettingsSwiftTipsManager();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_23BB07EA0(void *a1)
{
  if (!a1) {
    return MEMORY[0x263F8EE78];
  }
  id v1 = a1;
  id v2 = objc_msgSend(v1, sel_superview);
  if (!v2)
  {
LABEL_9:
    __swift_instantiateConcreteTypeFromMangledName(&qword_268A7BFB8);
    uint64_t v10 = swift_allocObject();
    *(_OWORD *)(v10 + 16) = xmmword_23BB0D400;
    *(void *)(v10 + 32) = v1;
    uint64_t v12 = v10;
    sub_23BB09520();
    return v12;
  }
  uint64_t v3 = v2;
  uint64_t ObjectType = swift_getObjectType();
  if (ObjectType == sub_23BB08920())
  {

    goto LABEL_9;
  }
  id v5 = v3;
  uint64_t v6 = sub_23BB07EA0(v3);

  id v7 = v1;
  uint64_t v8 = sub_23BB092D0();
  MEMORY[0x23ECCDAD0](v8);
  if (*(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_23BB09530();
  }
  sub_23BB09540();
  sub_23BB09520();
  uint64_t v9 = v6;

  swift_bridgeObjectRelease();
  return v9;
}

uint64_t sub_23BB07FF4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_23BB080C8(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_23BB089B0((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x263F8DBE0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_23BB089B0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    sub_23BB092D0();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_23BB080C8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_23BB09570();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_23BB08284(a5, a6);
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
  uint64_t v8 = sub_23BB09590();
  if (!v8)
  {
    sub_23BB095A0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_23BB095C0();
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

uint64_t sub_23BB08284(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_23BB0831C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_23BB084FC(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_23BB084FC(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_23BB0831C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_23BB08494(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_23BB09580();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_23BB095A0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_23BB09500();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_23BB095C0();
    __break(1u);
LABEL_14:
    uint64_t result = sub_23BB095A0();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_23BB08494(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A7BFC8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  _OWORD v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_23BB084FC(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_268A7BFC8);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  os_log_type_t v13 = a4 + 32;
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
  uint64_t result = sub_23BB095C0();
  __break(1u);
  return result;
}

void _s22SoftwareUpdateSettings26SUSettingsSwiftTipsManagerC40shouldShowUserDefaultsBasedComingSoonTipSbvg_0()
{
  uint64_t v0 = self;
  id v1 = objc_msgSend(v0, sel_sharedDefaults);
  unsigned int v2 = objc_msgSend(v1, sel_shouldShowComingSoonTip);

  if (!v2) {
    return;
  }
  id v3 = objc_msgSend(v0, sel_sharedDefaults);
  id v4 = objc_msgSend(v3, sel_comingSoonTipTitle);

  if (v4)
  {

    id v5 = objc_msgSend(v0, sel_sharedDefaults);
    id v6 = objc_msgSend(v5, sel_comingSoonTipTitle);

    if (!v6)
    {
      __break(1u);
      goto LABEL_17;
    }
    uint64_t v7 = sub_23BB094C0();
    uint64_t v9 = v8;

    if (v7 || v9 != 0xE000000000000000)
    {
      char v10 = sub_23BB095D0();
      swift_bridgeObjectRelease();
      if ((v10 & 1) == 0) {
        return;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
  id v11 = objc_msgSend(v0, sel_sharedDefaults);
  id v12 = objc_msgSend(v11, sel_comingSoonTipMessage);

  if (!v12) {
    return;
  }

  id v13 = objc_msgSend(v0, sel_sharedDefaults);
  id v14 = objc_msgSend(v13, sel_comingSoonTipMessage);

  if (!v14)
  {
LABEL_17:
    __break(1u);
    return;
  }
  uint64_t v15 = sub_23BB094C0();
  uint64_t v17 = v16;

  if (v15 || v17 != 0xE000000000000000)
  {
    sub_23BB095D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

unint64_t sub_23BB08860()
{
  unint64_t result = qword_268A7BF98;
  if (!qword_268A7BF98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A7BF98);
  }
  return result;
}

uint64_t sub_23BB088B4()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t type metadata accessor for SUSettingsSwiftTipsManager()
{
  return self;
}

unint64_t sub_23BB08920()
{
  unint64_t result = qword_268A7BFC0;
  if (!qword_268A7BFC0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268A7BFC0);
  }
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_23BB089B0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_23BB08A10()
{
}

void __swiftcall SUSSoftwareUpdateComingSoonTipCell.createTipView()(UIView *__return_ptr retstr)
{
  void (*v2)(void *__return_ptr);
  id v3;
  id v4;
  void v5[5];

  uint64_t v1 = (id *)SUSettingsSwiftTipsManager.shared.unsafeMutableAddressor();
  unsigned int v2 = *(void (**)(void *__return_ptr))((*MEMORY[0x263F8EED0] & *(void *)*v1) + 0x90);
  uint64_t v3 = *v1;
  v2(v5);

  id v4 = objc_allocWithZone((Class)sub_23BB092B0());
  sub_23BB092C0();
}

void *ConstellationComingSoonTip.ConstellationIdentifier.unsafeMutableAddressor()
{
  return &static ConstellationComingSoonTip.ConstellationIdentifier;
}

unint64_t static ConstellationComingSoonTip.ConstellationIdentifier.getter()
{
  return 0xD000000000000020;
}

unint64_t ConstellationComingSoonTip.id.getter()
{
  return 0xD000000000000020;
}

uint64_t ConstellationComingSoonTip.options.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A7BFD0);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_23BB0D1F0;
  uint64_t v1 = sub_23BB09330();
  uint64_t v2 = MEMORY[0x263F1C010];
  *(void *)(v0 + 56) = v1;
  *(void *)(v0 + 64) = v2;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 32));
  sub_23BB09340();
  return v0;
}

unint64_t sub_23BB08C64()
{
  unint64_t result = qword_268A7BFD8;
  if (!qword_268A7BFD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A7BFD8);
  }
  return result;
}

unint64_t sub_23BB08CB8()
{
  return 0xD000000000000020;
}

uint64_t sub_23BB08CD4()
{
  return sub_23BB09280();
}

uint64_t sub_23BB08D08()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A7BFD0);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_23BB0D1F0;
  uint64_t v1 = sub_23BB09330();
  uint64_t v2 = MEMORY[0x263F1C010];
  *(void *)(v0 + 56) = v1;
  *(void *)(v0 + 64) = v2;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 32));
  sub_23BB09340();
  return v0;
}

uint64_t sub_23BB08D7C()
{
  return MEMORY[0x263F8D320];
}

void sub_23BB08D88(void *a1@<X8>)
{
  *a1 = 0xD000000000000020;
  a1[1] = 0x800000023BB0C7C0;
}

ValueMetadata *type metadata accessor for ConstellationComingSoonTip()
{
  return &type metadata for ConstellationComingSoonTip;
}

uint64_t sub_23BB08DB8()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

id sub_23BB08DC8()
{
  type metadata accessor for ResourceBundleClass();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  qword_268A7C3F8 = (uint64_t)result;
  return result;
}

uint64_t sub_23BB08E1C(uint64_t a1)
{
  return sub_23BB08F84(a1, qword_268A7C460);
}

uint64_t sub_23BB08E40()
{
  return sub_23BB0904C(&qword_268A7C400, (uint64_t)qword_268A7C460);
}

uint64_t sub_23BB08E64@<X0>(uint64_t a1@<X8>)
{
  return sub_23BB090C4(&qword_268A7C400, (uint64_t)qword_268A7C460, a1);
}

uint64_t sub_23BB08E88(uint64_t a1)
{
  return sub_23BB08F84(a1, qword_268A7C478);
}

uint64_t sub_23BB08EAC()
{
  return sub_23BB0904C(&qword_268A7C408, (uint64_t)qword_268A7C478);
}

uint64_t sub_23BB08ED0@<X0>(uint64_t a1@<X8>)
{
  return sub_23BB090C4(&qword_268A7C408, (uint64_t)qword_268A7C478, a1);
}

uint64_t sub_23BB08EF4(uint64_t a1)
{
  return sub_23BB08F84(a1, qword_268A7C490);
}

uint64_t sub_23BB08F18()
{
  return sub_23BB0904C(&qword_268A7C410, (uint64_t)qword_268A7C490);
}

uint64_t sub_23BB08F3C@<X0>(uint64_t a1@<X8>)
{
  return sub_23BB090C4(&qword_268A7C410, (uint64_t)qword_268A7C490, a1);
}

uint64_t sub_23BB08F60(uint64_t a1)
{
  return sub_23BB08F84(a1, qword_268A7C4A8);
}

uint64_t sub_23BB08F84(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_23BB09210();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  if (qword_268A7C3F0 != -1) {
    swift_once();
  }
  id v4 = (id)qword_268A7C3F8;
  return sub_23BB09200();
}

uint64_t sub_23BB09028()
{
  return sub_23BB0904C(&qword_268A7C418, (uint64_t)qword_268A7C4A8);
}

uint64_t sub_23BB0904C(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_23BB09210();
  return __swift_project_value_buffer(v3, a2);
}

uint64_t sub_23BB090A0@<X0>(uint64_t a1@<X8>)
{
  return sub_23BB090C4(&qword_268A7C418, (uint64_t)qword_268A7C4A8, a1);
}

uint64_t sub_23BB090C4@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_23BB09210();
  uint64_t v6 = __swift_project_value_buffer(v5, a2);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v7(a3, v6, v5);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_23BB09180()
{
  return MEMORY[0x270EEF518]();
}

uint64_t sub_23BB09190()
{
  return MEMORY[0x270EEF740]();
}

uint64_t sub_23BB091A0()
{
  return MEMORY[0x270EEF750]();
}

uint64_t sub_23BB091B0()
{
  return MEMORY[0x270EEF870]();
}

uint64_t sub_23BB091C0()
{
  return MEMORY[0x270EEFCB0]();
}

uint64_t sub_23BB091D0()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_23BB091E0()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_23BB091F0()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_23BB09200()
{
  return MEMORY[0x270EEB1D0]();
}

uint64_t sub_23BB09210()
{
  return MEMORY[0x270EEB1E0]();
}

uint64_t sub_23BB09220()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_23BB09230()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_23BB09240()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_23BB09250()
{
  return MEMORY[0x270F05B58]();
}

uint64_t sub_23BB09260()
{
  return MEMORY[0x270F05B60]();
}

uint64_t sub_23BB09270()
{
  return MEMORY[0x270F05B68]();
}

uint64_t sub_23BB09280()
{
  return MEMORY[0x270F05B70]();
}

uint64_t sub_23BB09290()
{
  return MEMORY[0x270F05B80]();
}

uint64_t sub_23BB092A0()
{
  return MEMORY[0x270F05B88]();
}

uint64_t sub_23BB092B0()
{
  return MEMORY[0x270F05BC8]();
}

uint64_t sub_23BB092C0()
{
  return MEMORY[0x270F05BD0]();
}

uint64_t sub_23BB092D0()
{
  return MEMORY[0x270F05BE8]();
}

uint64_t sub_23BB092E0()
{
  return MEMORY[0x270F05BF0]();
}

uint64_t sub_23BB092F0()
{
  return MEMORY[0x270F05C20]();
}

uint64_t sub_23BB09300()
{
  return MEMORY[0x270F05C38]();
}

uint64_t sub_23BB09310()
{
  return MEMORY[0x270F05C48]();
}

uint64_t sub_23BB09320()
{
  return MEMORY[0x270F05C50]();
}

uint64_t sub_23BB09330()
{
  return MEMORY[0x270F05C78]();
}

uint64_t sub_23BB09340()
{
  return MEMORY[0x270F05C80]();
}

uint64_t sub_23BB09350()
{
  return MEMORY[0x270F05C90]();
}

uint64_t sub_23BB09360()
{
  return MEMORY[0x270F05C98]();
}

uint64_t sub_23BB09370()
{
  return MEMORY[0x270F05CA0]();
}

uint64_t sub_23BB09380()
{
  return MEMORY[0x270F05CA8]();
}

uint64_t sub_23BB09390()
{
  return MEMORY[0x270F05CB8]();
}

uint64_t sub_23BB093A0()
{
  return MEMORY[0x270F05CC0]();
}

uint64_t sub_23BB093B0()
{
  return MEMORY[0x270F05CD0]();
}

uint64_t sub_23BB093C0()
{
  return MEMORY[0x270F05CD8]();
}

uint64_t sub_23BB093D0()
{
  return MEMORY[0x270F05CE0]();
}

uint64_t sub_23BB093E0()
{
  return MEMORY[0x270F05CE8]();
}

uint64_t sub_23BB093F0()
{
  return MEMORY[0x270F05D00]();
}

uint64_t sub_23BB09400()
{
  return MEMORY[0x270F05D10]();
}

uint64_t sub_23BB09410()
{
  return MEMORY[0x270F05D38]();
}

uint64_t sub_23BB09420()
{
  return MEMORY[0x270F05D50]();
}

uint64_t sub_23BB09430()
{
  return MEMORY[0x270F05D68]();
}

uint64_t sub_23BB09440()
{
  return MEMORY[0x270F05D70]();
}

uint64_t sub_23BB09450()
{
  return MEMORY[0x270F05D78]();
}

uint64_t sub_23BB09460()
{
  return MEMORY[0x270F05D80]();
}

uint64_t sub_23BB09470()
{
  return MEMORY[0x270F01270]();
}

uint64_t sub_23BB09480()
{
  return MEMORY[0x270F03228]();
}

uint64_t sub_23BB09490()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_23BB094A0()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_23BB094B0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_23BB094C0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_23BB094D0()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_23BB094E0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_23BB094F0()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_23BB09500()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_23BB09510()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_23BB09520()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_23BB09530()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_23BB09540()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_23BB09550()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_23BB09560()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_23BB09570()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_23BB09580()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_23BB09590()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_23BB095A0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_23BB095B0()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_23BB095C0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_23BB095D0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_23BB095E0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_23BB095F0()
{
  return MEMORY[0x270F9FC90]();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59A8](retstr, sx, sy);
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x270EE71D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

void NSLog(NSString *format, ...)
{
}

uint64_t PSIsRunningInAssistant()
{
  return MEMORY[0x270F55258]();
}

uint64_t PSRoundToPixel()
{
  return MEMORY[0x270F552D8]();
}

uint64_t SFLocalizableWAPIStringKeyForKey()
{
  return MEMORY[0x270F5D188]();
}

NSComparisonResult UIContentSizeCategoryCompareToCategory(UIContentSizeCategory lhs, UIContentSizeCategory rhs)
{
  return MEMORY[0x270F82CC8](lhs, rhs);
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x270F82CD0](category);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return (NSDictionary *)MEMORY[0x270EF2C98](commaSeparatedKeysString, firstValue);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
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

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
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

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
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

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
}

uint64_t swift_deletedMethodError()
{
  return MEMORY[0x270FA0250]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x270FA03F0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}