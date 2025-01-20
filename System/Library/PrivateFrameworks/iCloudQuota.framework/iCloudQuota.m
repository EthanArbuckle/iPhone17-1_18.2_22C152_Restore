uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

id _ICQBannerLogSystem()
{
  if (_ICQBannerLogSystem_onceToken != -1) {
    dispatch_once(&_ICQBannerLogSystem_onceToken, &__block_literal_global_7);
  }
  v0 = (void *)_ICQBannerLogSystem_log;
  return v0;
}

uint64_t objectdestroy_41Tm(uint64_t *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = (v4 + 16) & ~v4;
  uint64_t v6 = v5 + *(void *)(v3 + 64);
  uint64_t v7 = v4 | 7;
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1 + v5, v2);
  return MEMORY[0x1F4186498](v1, v6, v7);
}

uint64_t objectdestroyTm()
{
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return MEMORY[0x1F4186498](v0, 88, 7);
}

uint64_t objectdestroyTm_0()
{
  uint64_t v1 = sub_1D58CC700();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x1F4186498](v0, v5, v6);
}

void sub_1D58546F8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
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

id _ICQGetLogSystem()
{
  if (_ICQGetLogSystem_onceToken != -1) {
    dispatch_once(&_ICQGetLogSystem_onceToken, &__block_literal_global_23);
  }
  uint64_t v0 = (void *)_ICQGetLogSystem_log;
  return v0;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
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

void sub_1D5855200(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void *__swift_project_boxed_opaque_existential_0(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

void sub_1D5856310(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_1D58565CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id _ICQSignpostLogSystem()
{
  if (_ICQSignpostLogSystem_onceToken != -1) {
    dispatch_once(&_ICQSignpostLogSystem_onceToken, &__block_literal_global_4_0);
  }
  uint64_t v0 = (void *)_ICQSignpostLogSystem_log;
  return v0;
}

unint64_t _ICQSignpostGetNanoseconds(uint64_t a1, uint64_t a2)
{
  if (_ICQSignpostGetNanoseconds_onceToken != -1) {
    dispatch_once(&_ICQSignpostGetNanoseconds_onceToken, &__block_literal_global_76);
  }
  uint64_t v3 = mach_continuous_time();
  LODWORD(v4) = _ICQSignpostGetNanoseconds_timebase_info;
  LODWORD(v5) = *(_DWORD *)algn_1EB786EDC;
  return (unint64_t)((double)v4 / (double)v5 * (double)(v3 - a2));
}

os_signpost_id_t _ICQSignpostCreateWithObject(NSObject *a1, const void *a2)
{
  os_signpost_id_t v2 = os_signpost_id_make_with_pointer(a1, a2);
  mach_continuous_time();
  return v2;
}

uint64_t ICQCreateError(uint64_t a1)
{
  return [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.icloud.quota" code:a1 userInfo:0];
}

id _ICQAlertSpecificationForServerDict(void *a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = [a1 objectForKeyedSubscript:@"alertInfo"];
  if (v1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      os_signpost_id_t v2 = objc_opt_new();
      [v2 setServerDict:v1];
      goto LABEL_9;
    }
    uint64_t v3 = _ICQGetLogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138412290;
      uint64_t v6 = v1;
      _os_log_impl(&dword_1D5851000, v3, OS_LOG_TYPE_DEFAULT, "alertInfo: expected NSDictionary, got %@", (uint8_t *)&v5, 0xCu);
    }
  }
  else
  {
    uint64_t v3 = _ICQGetLogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      _ICQAlertSpecificationForServerDict_cold_1(v3);
    }
  }

  os_signpost_id_t v2 = 0;
LABEL_9:

  return v2;
}

__CFString *_ICQStringForAction(uint64_t a1)
{
  switch(a1)
  {
    case 'd':
      uint64_t result = @"ICQActionPresentManageStorage";
      break;
    case 'e':
      uint64_t result = @"ICQActionCancel";
      break;
    case 'f':
      uint64_t result = @"ICQActionShowInlineAlert";
      break;
    case 'g':
      uint64_t result = @"ICQActionOpenPaymentUpdate";
      break;
    case 'h':
      uint64_t result = @"ICQActionOpenCloudBackup";
      break;
    case 'i':
      uint64_t result = @"ICQActionCloudUpgrade";
      break;
    case 'j':
      uint64_t result = @"ICQActionPhotosOptimize";
      break;
    case 'k':
      uint64_t result = @"ICQActionPhotosCloudEnable";
      break;
    case 'l':
      uint64_t result = @"ICQActionPhotosCloudUpgradeEnable";
      break;
    case 'm':
      uint64_t result = @"ICQActionFamilySetup";
      break;
    case 'n':
      uint64_t result = @"ICQActionFamilyUsageWithRUI";
      break;
    case 'o':
      uint64_t result = @"ICQActionStartFamilySharing";
      break;
    case 'p':
      uint64_t result = @"ICQActionLaunchRemoteUI";
      break;
    case 'q':
      uint64_t result = @"ICQActionLaunchJITAppKitUI";
      break;
    case 'r':
      uint64_t result = @"ICQActionLaunchAMSDynamicUI";
      break;
    case 's':
      uint64_t result = @"ICQActionLaunchLiftUI";
      break;
    case 't':
      uint64_t result = @"ICQActionCloudUpgradeOslo";
      break;
    case 'u':
      uint64_t result = @"ICQActionPhotosCloudUpgradeEnableOslo";
      break;
    case 'v':
      uint64_t result = @"ICQActionDirectToOslo";
      break;
    case 'w':
      uint64_t result = @"ICQActionLaunchLegacyPurchase";
      break;
    case 'x':
      uint64_t result = @"ICQActionLaunchUpgradeFlowWithRUI";
      break;
    case 'y':
      uint64_t result = @"ICQActionLaunchUpgradeFlowWithLiftUI";
      break;
    case 'z':
      uint64_t result = @"ICQActionLaunchAppleOne";
      break;
    case '{':
      uint64_t result = @"ICQActionHTTPCall";
      break;
    case '|':
      uint64_t result = @"ICQActionHTTPGETCall";
      break;
    case '}':
      uint64_t result = @"ICQActionDismissBanner";
      break;
    case '~':
      uint64_t result = @"ICQActionLaunchNativeView";
      break;
    case '\x7F':
      uint64_t result = @"ICQActionUpgradeOslo";
      break;
    default:
      switch(a1)
      {
        case 1:
          uint64_t result = @"ICQActionDismiss";
          break;
        case 2:
          uint64_t result = @"ICQActionRejectOffer";
          break;
        case 3:
          uint64_t result = @"ICQActionPresentPurchaseFlow";
          break;
        case 4:
          uint64_t result = @"ICQActionPurchaseBuy";
          break;
        case 5:
          uint64_t result = @"ICQActionPurchaseComplete";
          break;
        case 6:
          uint64_t result = @"ICQActionOpenURL";
          break;
        default:
          uint64_t result = @"ICQActionNone";
          break;
      }
      break;
  }
  return result;
}

uint64_t _ICQActionForString(void *a1)
{
  id v1 = a1;
  if (_ICQActionForString_onceToken != -1) {
    dispatch_once(&_ICQActionForString_onceToken, &__block_literal_global);
  }
  os_signpost_id_t v2 = [(id)_ICQActionForString_sActionForString objectForKeyedSubscript:v1];
  if (!v2)
  {
    uint64_t v3 = _ICQGetLogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      _ICQActionForString_cold_1((uint64_t)v1, v3);
    }

    os_signpost_id_t v2 = &unk_1F2DDFB58;
  }
  uint64_t v4 = [v2 integerValue];

  return v4;
}

void sub_1D585A5D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  _Block_object_dispose(&a24, 8);
  objc_destroyWeak(v30);
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose((const void *)(v31 - 184), 8);
  _Block_object_dispose((const void *)(v31 - 152), 8);
  objc_destroyWeak((id *)(v31 - 104));
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

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t ___isWAPIDevice_block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  _isWAPIDevice_sIsWAPIDevice = result;
  return result;
}

uint64_t ICQUsedDiskSpaceForVolume(void *a1)
{
  v5[2] = 0;
  memset(v6, 0, 12);
  v5[0] = 5;
  v5[1] = 2155872256;
  int v1 = getattrlist((const char *)[a1 fileSystemRepresentation], v5, v6, 0xCuLL, 0);
  if (!v1) {
    return *(void *)((char *)v6 + 4);
  }
  int v2 = v1;
  uint64_t v3 = _ICQGetLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    ICQUsedDiskSpaceForVolume_cold_1(v2, v3);
  }

  return 0;
}

void sub_1D585D610(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
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

void *__Block_byref_object_copy__1(uint64_t a1, uint64_t a2)
{
  uint64_t result = _Block_copy(*(const void **)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

id _ICQUpgradeNowSampleLink()
{
  if (_ICQUpgradeNowSampleLink_onceToken != -1) {
    dispatch_once(&_ICQUpgradeNowSampleLink_onceToken, &__block_literal_global_4);
  }
  uint64_t v0 = (void *)_ICQUpgradeNowSampleLink_sUpgradeNowSampleLink;
  return v0;
}

void sub_1D586320C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

Class __getINDaemonConnectionClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!iCloudNotificationLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __iCloudNotificationLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6A522F0;
    uint64_t v6 = 0;
    iCloudNotificationLibraryCore_frameworkLibrary = _sl_dlopen();
    int v2 = (void *)v4[0];
    if (!iCloudNotificationLibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("INDaemonConnection");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    int v2 = (void *)__getINDaemonConnectionClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getINDaemonConnectionClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __iCloudNotificationLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  iCloudNotificationLibraryCore_frameworkLibrary = result;
  return result;
}

void ICQOpenURL(void *a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v2 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    [v2 openSensitiveURL:v1 withOptions:0];
  }
  else
  {
    int v2 = _ICQGetLogSystem();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      if (v1)
      {
        uint64_t v3 = (objc_class *)objc_opt_class();
        NSStringFromClass(v3);
        uint64_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v4 = @"Nil";
      }
      int v5 = 138412546;
      id v6 = v1;
      __int16 v7 = 2112;
      v8 = v4;
      _os_log_impl(&dword_1D5851000, v2, OS_LOG_TYPE_DEFAULT, "attempt to open URL %@ of class %@", (uint8_t *)&v5, 0x16u);
      if (v1) {
    }
      }
  }
}

void _ICQOpenPurchaseFlowInSettings()
{
  [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE/STORAGE_AND_BACKUP/STORAGE_UPGRADE"];
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  ICQOpenURL(v0);
}

void _ICQOpenManageStorageInSettings()
{
  [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE/STORAGE_AND_BACKUP/MANAGE_STORAGE"];
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  ICQOpenURL(v0);
}

void _ICQOpenFamilySetupInSettings()
{
  [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=APPLE_ACCOUNT&aaaction=setupFamily&clientAppContext=iCloudStorage"];
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  ICQOpenURL(v0);
}

void _ICQOpenPrimaryPaymentInSettings()
{
  [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=APPLE_ACCOUNT&path=PAYMENT_AND_SHIPPING/PRIMARY_PAYMENT"];
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  ICQOpenURL(v0);
}

void _ICQOpenCloudBackupInSettings()
{
  [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE/BACKUP"];
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  ICQOpenURL(v0);
}

void __AlertSpecificationSampleForAlmostFullLevel_block_invoke()
{
  id v0 = objc_opt_new();
  [v0 setTitle:@"Add iCloud Storage"];
  [v0 setMessage:@"You are using 4.6 GB of your 5 GB iCloud storage. Add more storage to keep using iCloud Photo Library, iCloud Mail, and Backup."];
  uint64_t v1 = MEMORY[0x1E4F1CC08];
  id v5 = +[ICQLink linkWithText:@"Add iCloud Storage" action:3 parameters:MEMORY[0x1E4F1CC08]];
  int v2 = +[ICQLink linkWithText:@"Manage Storage" action:100 parameters:v1];
  uint64_t v3 = +[ICQLink linkWithText:@"Not Now" action:2 parameters:v1];
  [v0 setLink:v5 forButtonIndex:1];
  [v0 setLink:v2 forButtonIndex:2];
  [v0 setLink:v3 forButtonIndex:3];
  [v0 setDefaultButtonIndex:1];
  uint64_t v4 = (void *)AlertSpecificationSampleForAlmostFullLevel_sAlertSpecification;
  AlertSpecificationSampleForAlmostFullLevel_sAlertSpecification = (uint64_t)v0;
}

void __AlertSpecificationSampleForFullLevel_block_invoke()
{
  id v0 = objc_opt_new();
  [v0 setTitle:@"iCloud Storage is Full"];
  [v0 setMessage:@"iCloud Photo Library, iCloud Mail, and Backup are no longer updating. Add more storage to keep using iCloud.\n[ENG: LOCAL SAMPLE UI]"];
  uint64_t v1 = MEMORY[0x1E4F1CC08];
  id v5 = +[ICQLink linkWithText:@"Add iCloud Storage" action:3 parameters:MEMORY[0x1E4F1CC08]];
  int v2 = +[ICQLink linkWithText:@"Manage Storage" action:100 parameters:v1];
  uint64_t v3 = +[ICQLink linkWithText:@"Not Now" action:2 parameters:v1];
  [v0 setLink:v5 forButtonIndex:1];
  [v0 setLink:v2 forButtonIndex:2];
  [v0 setLink:v3 forButtonIndex:3];
  [v0 setDefaultButtonIndex:1];
  uint64_t v4 = (void *)AlertSpecificationSampleForFullLevel_sAlertSpecification;
  AlertSpecificationSampleForFullLevel_sAlertSpecification = (uint64_t)v0;
}

void OUTLINED_FUNCTION_0_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

id getINDaemonConnectionClass()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  id v0 = (void *)getINDaemonConnectionClass_softClass_0;
  uint64_t v7 = getINDaemonConnectionClass_softClass_0;
  if (!getINDaemonConnectionClass_softClass_0)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getINDaemonConnectionClass_block_invoke_0;
    v3[3] = &unk_1E6A52090;
    v3[4] = &v4;
    __getINDaemonConnectionClass_block_invoke_0((uint64_t)v3);
    id v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1D5869670(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D5869C98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
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

void sub_1D586AE14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _handlePushReceivedDarwinNotification(uint64_t a1, uint64_t a2, uint64_t a3)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___handlePushReceivedDarwinNotification_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void sub_1D586B884(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

Class __getINDaemonConnectionClass_block_invoke_0(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!iCloudNotificationLibraryCore_frameworkLibrary_0)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __iCloudNotificationLibraryCore_block_invoke_0;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6A526C0;
    uint64_t v6 = 0;
    iCloudNotificationLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    int v2 = (void *)v4[0];
    if (!iCloudNotificationLibraryCore_frameworkLibrary_0)
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
    Class result = objc_getClass("INDaemonConnection");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    int v2 = (void *)__getINDaemonConnectionClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getINDaemonConnectionClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __iCloudNotificationLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  iCloudNotificationLibraryCore_frameworkLibrary_0 = result;
  return result;
}

void ___handlePushReceivedDarwinNotification_block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v1 = (uint64_t *)(a1 + 32);
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = _ICQGetLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *v1;
    int v14 = 138412290;
    uint64_t v15 = v4;
    _os_log_impl(&dword_1D5851000, v3, OS_LOG_TYPE_DEFAULT, "received push received darwin notification %@", (uint8_t *)&v14, 0xCu);
  }

  if ([v2 isEqualToString:@"ICQDaemonOfferChangedDueToPushDarwinNotificationRegular"])
  {
    long long v5 = +[ICQOfferManager sharedOfferManager];
    uint64_t v6 = v5;
    uint64_t v7 = 3;
LABEL_9:
    [v5 _handlePushReceivedDarwinNotificationRequestType:v7];
    goto LABEL_10;
  }
  if ([v2 isEqualToString:@"ICQDaemonOfferChangedDueToPushDarwinNotificationPremium"])
  {
    long long v5 = +[ICQOfferManager sharedOfferManager];
    uint64_t v6 = v5;
    uint64_t v7 = 2;
    goto LABEL_9;
  }
  if ([v2 isEqualToString:@"ICQDaemonOfferChangedDueToPushDarwinNotificationDefault"])
  {
    long long v5 = +[ICQOfferManager sharedOfferManager];
    uint64_t v6 = v5;
    uint64_t v7 = 1;
    goto LABEL_9;
  }
  uint64_t v6 = _ICQGetLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    ___handlePushReceivedDarwinNotification_block_invoke_cold_1((uint64_t)v1, v6, v8, v9, v10, v11, v12, v13);
  }
LABEL_10:
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1D586D494(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
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

void sub_1D586DEAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
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

id _ICQModelSpecificLocalizedStringKeyForKey(void *a1)
{
  id v1 = a1;
  id v2 = (void *)MGCopyAnswer();
  uint64_t v3 = [v2 uppercaseString];
  uint64_t v4 = [v3 stringByReplacingOccurrencesOfString:@" " withString:@"_"];

  if ([v4 hasSuffix:@"_SIMULATOR"])
  {
    uint64_t v5 = objc_msgSend(v4, "substringToIndex:", objc_msgSend(v4, "rangeOfString:", @"_SIMULATOR"));

    uint64_t v4 = (void *)v5;
  }
  uint64_t v6 = [NSString stringWithFormat:@"%@_%@", v1, v4];

  return v6;
}

void sub_1D586FAA0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D58710F8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
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

void sub_1D5871EB0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_1D5872BF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D58749B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D5875424(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

Class __getCKContainerClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!CloudKitLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __CloudKitLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6A52FD8;
    uint64_t v6 = 0;
    CloudKitLibraryCore_frameworkLibrary = _sl_dlopen();
    id v2 = (void *)v4[0];
    if (!CloudKitLibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("CKContainer");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    id v2 = (void *)__getCKContainerClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getCKContainerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CloudKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CloudKitLibraryCore_frameworkLibrary = result;
  return result;
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_5(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_8(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x12u);
}

void sub_1D587A1C4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

__CFString *_ICQStringForOfferType(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 7) {
    return @"ICQOfferTypeUnknown";
  }
  else {
    return off_1E6A53158[a1 - 1];
  }
}

uint64_t _ICQOfferTypeForString(void *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  id v2 = v1;
  if (_ICQOfferTypeForString_onceToken != -1)
  {
    dispatch_once(&_ICQOfferTypeForString_onceToken, &__block_literal_global_12);
    if (v2) {
      goto LABEL_3;
    }
LABEL_10:
    uint64_t v5 = 0;
    goto LABEL_11;
  }
  if (!v1) {
    goto LABEL_10;
  }
LABEL_3:
  uint64_t v3 = [(id)_ICQOfferTypeForString_sOfferTypeForString objectForKeyedSubscript:v2];
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 integerValue];
  }
  else
  {
    uint64_t v6 = _ICQGetLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      uint64_t v9 = v2;
      _os_log_impl(&dword_1D5851000, v6, OS_LOG_TYPE_DEFAULT, "_ICQOfferTypeForString - illegal offer type %@", (uint8_t *)&v8, 0xCu);
    }

    uint64_t v5 = 0;
  }

LABEL_11:
  return v5;
}

uint64_t _ICQOfferTypeForServerString(void *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  id v2 = v1;
  if (_ICQOfferTypeForServerString_onceToken != -1)
  {
    dispatch_once(&_ICQOfferTypeForServerString_onceToken, &__block_literal_global_45);
    if (v2) {
      goto LABEL_3;
    }
LABEL_10:
    uint64_t v5 = 0;
    goto LABEL_11;
  }
  if (!v1) {
    goto LABEL_10;
  }
LABEL_3:
  uint64_t v3 = [(id)_ICQOfferTypeForServerString_sOfferTypeForServerString objectForKeyedSubscript:v2];
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 integerValue];
  }
  else
  {
    uint64_t v6 = _ICQGetLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      uint64_t v9 = v2;
      _os_log_impl(&dword_1D5851000, v6, OS_LOG_TYPE_DEFAULT, "_ICQOfferTypeForServerString - illegal server offer type %@", (uint8_t *)&v8, 0xCu);
    }

    uint64_t v5 = 0;
  }

LABEL_11:
  return v5;
}

uint64_t _ICQIntegerFromDictionaryKey(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = NSNumber;
  id v6 = a2;
  id v7 = a1;
  int v8 = [v5 numberWithInteger:a3];
  objc_opt_class();
  uint64_t v9 = _ICQObjectForKey(v7, v6, v8);

  uint64_t v10 = [v9 integerValue];
  return v10;
}

id _ICQObjectForKey(void *a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [a1 objectForKey:v5];
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
  }
  else
  {
    id v8 = v6;
    if (v7)
    {
      uint64_t v9 = _ICQGetLogSystem();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138412546;
        id v12 = v5;
        __int16 v13 = 2112;
        int v14 = v7;
        _os_log_impl(&dword_1D5851000, v9, OS_LOG_TYPE_DEFAULT, "persisted offer(s) bad %@: %@", (uint8_t *)&v11, 0x16u);
      }

      id v8 = v6;
    }
  }

  return v8;
}

id _ICQStringFromDictionaryKey(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = a1;
  objc_opt_class();
  id v8 = _ICQObjectForKey(v7, v6, v5);

  return v8;
}

uint64_t _ICQLevelForString(void *a1)
{
  id v1 = a1;
  if (_ICQLevelForString_onceToken != -1) {
    dispatch_once(&_ICQLevelForString_onceToken, &__block_literal_global_13);
  }
  id v2 = [(id)_ICQLevelForString_sLevelForString objectForKeyedSubscript:v1];
  uint64_t v3 = v2;
  if (v2) {
    uint64_t v4 = [v2 integerValue];
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

__CFString *_ICQStringForLevel(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 5) {
    return @"None";
  }
  else {
    return off_1E6A531F0[a1 - 1];
  }
}

void sub_1D5882CC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

void sub_1D5884C74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 112), 8);
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

id ICQCreateErrorWithMessage(uint64_t a1, void *a2)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = *MEMORY[0x1E4F28568];
  v9[0] = a2;
  uint64_t v3 = (void *)MEMORY[0x1E4F1C9E8];
  id v4 = a2;
  id v5 = [v3 dictionaryWithObjects:v9 forKeys:&v8 count:1];
  id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.icloud.quota" code:a1 userInfo:v5];

  return v6;
}

void sub_1D5886984(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8(uint64_t a1)
{
}

void sub_1D5886C50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D5886F48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D58870B0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void *__getPLIsCPLDataclassEnabledSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)PhotoLibraryServicesLibrary();
  uint64_t result = dlsym(v2, "PLIsCPLDataclassEnabled");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getPLIsCPLDataclassEnabledSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t PhotoLibraryServicesLibrary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!PhotoLibraryServicesLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __PhotoLibraryServicesLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E6A534C8;
    uint64_t v5 = 0;
    PhotoLibraryServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = PhotoLibraryServicesLibraryCore_frameworkLibrary;
  uint64_t v1 = (void *)v3[0];
  if (!PhotoLibraryServicesLibraryCore_frameworkLibrary)
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

uint64_t __PhotoLibraryServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  PhotoLibraryServicesLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getPLCPLHasBeenEnabledForCurrentAccountSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)PhotoLibraryServicesLibrary();
  uint64_t result = dlsym(v2, "PLCPLHasBeenEnabledForCurrentAccount");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getPLCPLHasBeenEnabledForCurrentAccountSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getPLCloudPhotoLibraryKeepOriginalsIsEnabledSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)PhotoLibraryServicesLibrary();
  uint64_t result = dlsym(v2, "PLCloudPhotoLibraryKeepOriginalsIsEnabled");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getPLCloudPhotoLibraryKeepOriginalsIsEnabledSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                           + 24);
  return result;
}

Class __getPLPhotoLibraryClass_block_invoke(uint64_t a1)
{
  PhotoLibraryServicesLibrary();
  Class result = objc_getClass("PLPhotoLibrary");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getPLPhotoLibraryClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getPLPhotoLibraryClass_block_invoke_cold_1();
    return (Class)__getPLGatekeeperClientClass_block_invoke(v3);
  }
  return result;
}

Class __getPLGatekeeperClientClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!PhotoLibraryServicesCoreLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __PhotoLibraryServicesCoreLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6A534E0;
    uint64_t v6 = 0;
    PhotoLibraryServicesCoreLibraryCore_frameworkLibrary = _sl_dlopen();
    id v2 = (void *)v4[0];
    if (!PhotoLibraryServicesCoreLibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("PLGatekeeperClient");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    id v2 = (void *)__getPLGatekeeperClientClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getPLGatekeeperClientClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __PhotoLibraryServicesCoreLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  PhotoLibraryServicesCoreLibraryCore_frameworkLibrary = result;
  return result;
}

id getINDaemonConnectionClass_0()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getINDaemonConnectionClass_softClass_1;
  uint64_t v7 = getINDaemonConnectionClass_softClass_1;
  if (!getINDaemonConnectionClass_softClass_1)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getINDaemonConnectionClass_block_invoke_1;
    v3[3] = &unk_1E6A52090;
    v3[4] = &v4;
    __getINDaemonConnectionClass_block_invoke_1((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1D5889BD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getINDaemonConnectionClass_block_invoke_1(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!iCloudNotificationLibraryCore_frameworkLibrary_1)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __iCloudNotificationLibraryCore_block_invoke_1;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6A535F8;
    uint64_t v6 = 0;
    iCloudNotificationLibraryCore_frameworkLibrary_1 = _sl_dlopen();
    id v2 = (void *)v4[0];
    if (!iCloudNotificationLibraryCore_frameworkLibrary_1)
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
    Class result = objc_getClass("INDaemonConnection");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    id v2 = (void *)__getINDaemonConnectionClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getINDaemonConnectionClass_softClass_1 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __iCloudNotificationLibraryCore_block_invoke_1()
{
  uint64_t result = _sl_dlopen();
  iCloudNotificationLibraryCore_frameworkLibrary_1 = result;
  return result;
}

void OUTLINED_FUNCTION_6(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

id _ICQServerDictionaryForBundleIdentifier(void *a1, void *a2, void *a3, int a4)
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  id v7 = a1;
  id v68 = a2;
  v69 = a3;
  if (![v68 isEqualToString:@"__WILDCARD__"])
  {
    long long v76 = 0u;
    long long v77 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    id v66 = v7;
    id v20 = v7;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v74 objects:v87 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v75;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v75 != v23) {
            objc_enumerationMutation(v20);
          }
          v25 = *(void **)(*((void *)&v74 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (v25)
            {
              v53 = _ICQGetLogSystem();
              if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
              {
                v54 = (objc_class *)objc_opt_class();
                Name = class_getName(v54);
                *(_DWORD *)buf = 136315394;
                v90 = Name;
                __int16 v91 = 2112;
                v92 = v25;
                _os_log_impl(&dword_1D5851000, v53, OS_LOG_TYPE_DEFAULT, "GUARD_OBJECT_CLASS: expected %s, got %@", buf, 0x16u);
              }
            }
            id v52 = 0;
LABEL_64:

LABEL_73:
            v32 = v68;
            id v7 = v66;
            goto LABEL_90;
          }
          v26 = [v25 objectForKeyedSubscript:@"appId"];
          int v27 = [v26 isEqualToString:v68];

          if (v27)
          {
            if (!v69
              || ([v25 objectForKeyedSubscript:@"reason"],
                  v28 = objc_claimAutoreleasedReturnValue(),
                  int v29 = [v28 isEqualToString:v69],
                  v28,
                  v29))
            {
              id v52 = v25;
              goto LABEL_64;
            }
          }
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v74 objects:v87 count:16];
      }
      while (v22);
    }

    v30 = _ICQGetLogSystem();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v90 = (const char *)v68;
      _os_log_impl(&dword_1D5851000, v30, OS_LOG_TYPE_DEFAULT, "app specific spec for %@ not found in appId array; using workaround",
        buf,
        0xCu);
    }

    uint64_t v31 = _ICQGetLogSystem();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
      _ICQServerDictionaryForBundleIdentifier_cold_1();
    }

    v32 = _ICQContainerIDForKnownBundleID(v68);
    if (!v32)
    {
      v32 = _ICQBundleIDForKnownContainerID(v68);
    }
    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    v33 = v20;
    uint64_t v34 = [v33 countByEnumeratingWithState:&v70 objects:v86 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = *(void *)v71;
      do
      {
        for (uint64_t j = 0; j != v35; ++j)
        {
          if (*(void *)v71 != v36) {
            objc_enumerationMutation(v33);
          }
          v38 = *(void **)(*((void *)&v70 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (v38)
            {
              v62 = _ICQGetLogSystem();
              id v7 = v66;
              if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
              {
                v63 = (objc_class *)objc_opt_class();
                v64 = class_getName(v63);
                *(_DWORD *)buf = 136315394;
                v90 = v64;
                __int16 v91 = 2112;
                v92 = v38;
                _os_log_impl(&dword_1D5851000, v62, OS_LOG_TYPE_DEFAULT, "GUARD_OBJECT_CLASS: expected %s, got %@", buf, 0x16u);
              }

              id v52 = 0;
              goto LABEL_86;
            }
LABEL_84:
            id v52 = 0;
LABEL_85:
            id v7 = v66;
LABEL_86:

            goto LABEL_90;
          }
          v39 = [v38 objectForKeyedSubscript:@"appId"];
          int v40 = [v39 isEqualToString:v32];

          if (!v40)
          {
            if (![v32 isEqualToString:@"com.apple.icloud.docs"]) {
              continue;
            }
            v41 = [v38 objectForKeyedSubscript:@"appId"];
            int v42 = [v41 isEqualToString:@"com.apple.icloud.drive"];

            if (!v42) {
              continue;
            }
          }
          id v52 = v38;
          goto LABEL_85;
        }
        uint64_t v35 = [v33 countByEnumeratingWithState:&v70 objects:v86 count:16];
      }
      while (v35);
    }

    v33 = _ICQGetLogSystem();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D5851000, v33, OS_LOG_TYPE_DEFAULT, "app specific spec still not found using workaround", buf, 2u);
    }
    goto LABEL_84;
  }
  if (a4)
  {
    long long v84 = 0u;
    long long v85 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    obuint64_t j = v7;
    uint64_t v8 = [obj countByEnumeratingWithState:&v82 objects:v93 count:16];
    if (!v8) {
      goto LABEL_12;
    }
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v83;
    id v66 = v7;
LABEL_5:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v83 != v10) {
        objc_enumerationMutation(obj);
      }
      id v12 = *(void **)(*((void *)&v82 + 1) + 8 * v11);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        break;
      }
      __int16 v13 = [v12 objectForKeyedSubscript:@"mesg"];
      int v14 = [v13 objectForKeyedSubscript:@"format"];
      int v15 = [v14 isEqualToString:@"%@"];

      if (v15)
      {
        id v52 = v12;
LABEL_72:

        goto LABEL_73;
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [obj countByEnumeratingWithState:&v82 objects:v93 count:16];
        id v7 = v66;
        if (v9) {
          goto LABEL_5;
        }
LABEL_12:

        uint64_t v16 = _ICQGetLogSystem();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          uint64_t v17 = "warning: missing appBannerInfo that could be considered a button";
          v18 = v16;
          uint32_t v19 = 2;
          goto LABEL_56;
        }
        goto LABEL_57;
      }
    }
    if (v12)
    {
      v56 = _ICQGetLogSystem();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
      {
        v57 = (objc_class *)objc_opt_class();
        v58 = class_getName(v57);
        *(_DWORD *)buf = 136315394;
        v90 = v58;
        __int16 v91 = 2112;
        v92 = v12;
        _os_log_impl(&dword_1D5851000, v56, OS_LOG_TYPE_DEFAULT, "GUARD_OBJECT_CLASS: expected %s, got %@", buf, 0x16u);
      }
    }
    id v52 = 0;
    goto LABEL_72;
  }
  if (!v69)
  {
    id v52 = [v7 firstObject];
    goto LABEL_89;
  }
  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  id v43 = v7;
  uint64_t v44 = [v43 countByEnumeratingWithState:&v78 objects:v88 count:16];
  if (!v44) {
    goto LABEL_54;
  }
  uint64_t v45 = v44;
  uint64_t v46 = *(void *)v79;
  while (2)
  {
    id v47 = v7;
    for (uint64_t k = 0; k != v45; ++k)
    {
      if (*(void *)v79 != v46) {
        objc_enumerationMutation(v43);
      }
      v49 = *(void **)(*((void *)&v78 + 1) + 8 * k);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v7 = v47;
        if (v49)
        {
          v59 = _ICQGetLogSystem();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
          {
            v60 = (objc_class *)objc_opt_class();
            v61 = class_getName(v60);
            *(_DWORD *)buf = 136315394;
            v90 = v61;
            __int16 v91 = 2112;
            v92 = v49;
            _os_log_impl(&dword_1D5851000, v59, OS_LOG_TYPE_DEFAULT, "GUARD_OBJECT_CLASS: expected %s, got %@", buf, 0x16u);
          }
        }
        id v52 = 0;
        goto LABEL_88;
      }
      v50 = [v49 objectForKeyedSubscript:@"reason"];
      int v51 = [v50 isEqualToString:v69];

      if (v51)
      {
        id v52 = v49;
        id v7 = v47;
LABEL_88:

        goto LABEL_89;
      }
    }
    uint64_t v45 = [v43 countByEnumeratingWithState:&v78 objects:v88 count:16];
    id v7 = v47;
    if (v45) {
      continue;
    }
    break;
  }
LABEL_54:

  uint64_t v16 = _ICQGetLogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v90 = v69;
    uint64_t v17 = "warning: missing appBannerInfo for reason %@";
    v18 = v16;
    uint32_t v19 = 12;
LABEL_56:
    _os_log_impl(&dword_1D5851000, v18, OS_LOG_TYPE_DEFAULT, v17, buf, v19);
  }
LABEL_57:

  id v52 = 0;
LABEL_89:
  v32 = v68;
LABEL_90:

  return v52;
}

_ICQBannerSpecification *_ICQBubbleBannerSpecificationForServerDict(void *a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [a1 objectForKeyedSubscript:@"bubbleBannerInfo"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v5 = _ICQServerDictionaryForBundleIdentifier(v4, v3, 0, 0);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = [[_ICQBannerSpecification alloc] initWithDetailBannerInfo:v5 source:@"ICQBannerSourceBubbleBannerInfo"];
LABEL_12:

      goto LABEL_13;
    }
    if (v5)
    {
      uint64_t v8 = _ICQGetLogSystem();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = (objc_class *)objc_opt_class();
        int v11 = 136315394;
        Name = class_getName(v9);
        __int16 v13 = 2112;
        int v14 = v5;
        _os_log_impl(&dword_1D5851000, v8, OS_LOG_TYPE_DEFAULT, "GUARD_OBJECT_CLASS: expected %s, got %@", (uint8_t *)&v11, 0x16u);
      }
    }
LABEL_11:
    uint64_t v6 = 0;
    goto LABEL_12;
  }
  if (v4)
  {
    long long v5 = _ICQGetLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = (objc_class *)objc_opt_class();
      int v11 = 136315394;
      Name = class_getName(v7);
      __int16 v13 = 2112;
      int v14 = v4;
      _os_log_impl(&dword_1D5851000, v5, OS_LOG_TYPE_DEFAULT, "GUARD_OBJECT_CLASS: expected %s, got %@", (uint8_t *)&v11, 0x16u);
    }
    goto LABEL_11;
  }
  uint64_t v6 = 0;
LABEL_13:

  return v6;
}

void OUTLINED_FUNCTION_1_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void sub_1D5892324(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D5893EA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D589636C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _ICQDoesCriterionValueEqualBOOL(void *a1, int a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v4 = [v3 BOOLValue] ^ a2 ^ 1;
  }
  else
  {
    uint64_t v5 = _ICQGetLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl(&dword_1D5851000, v5, OS_LOG_TYPE_DEFAULT, "criterion: expected BOOL value, got %@", (uint8_t *)&v7, 0xCu);
    }

    uint64_t v4 = 0;
  }

  return v4;
}

void *__getBYSetupAssistantNeedsToRunSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  if (!SetupAssistantLibraryCore_frameworkLibrary)
  {
    v5[1] = MEMORY[0x1E4F143A8];
    v5[2] = 3221225472;
    void v5[3] = __SetupAssistantLibraryCore_block_invoke;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_1E6A53798;
    uint64_t v7 = 0;
    SetupAssistantLibraryCore_frameworkLibrary = _sl_dlopen();
    id v3 = (void *)v5[0];
    id v2 = (void *)SetupAssistantLibraryCore_frameworkLibrary;
    if (SetupAssistantLibraryCore_frameworkLibrary)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      id v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  id v2 = (void *)SetupAssistantLibraryCore_frameworkLibrary;
LABEL_5:
  uint64_t result = dlsym(v2, "BYSetupAssistantNeedsToRun");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getBYSetupAssistantNeedsToRunSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __SetupAssistantLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SetupAssistantLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1D589C67C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

Class __getINDaemonConnectionClass_block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!iCloudNotificationLibraryCore_frameworkLibrary_2)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __iCloudNotificationLibraryCore_block_invoke_2;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6A53828;
    uint64_t v6 = 0;
    iCloudNotificationLibraryCore_frameworkLibrary_2 = _sl_dlopen();
    id v2 = (void *)v4[0];
    if (!iCloudNotificationLibraryCore_frameworkLibrary_2)
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
    Class result = objc_getClass("INDaemonConnection");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    id v2 = (void *)__getINDaemonConnectionClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getINDaemonConnectionClass_softClass_2 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __iCloudNotificationLibraryCore_block_invoke_2()
{
  uint64_t result = _sl_dlopen();
  iCloudNotificationLibraryCore_frameworkLibrary_2 = result;
  return result;
}

void ICQLogOfferDetailsForServerDictionary(void *a1)
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (v1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v2 = [v1 objectForKeyedSubscript:@"offerType"];
      uint64_t v3 = [v1 objectForKeyedSubscript:@"type"];
      uint64_t v4 = [v1 objectForKeyedSubscript:@"notificationInfo"];
      uint64_t v73 = [v1 objectForKeyedSubscript:@"iTunesAccountExists"];
      long long v82 = [v1 objectForKeyedSubscript:@"callbackInterval"];
      uint64_t v5 = [v1 objectForKeyedSubscript:@"quotaInfo"];
      long long v81 = [v1 objectForKeyedSubscript:@"showAlert"];
      long long v78 = [v1 objectForKeyedSubscript:@"alertInfo"];
      long long v80 = [v1 objectForKeyedSubscript:@"showBanner"];
      uint64_t v6 = [v1 objectForKeyedSubscript:@"appBannerInfo"];
      uint64_t v72 = [v1 objectForKeyedSubscript:@"appContextInfo"];
      long long v77 = [v1 objectForKeyedSubscript:@"followUpInfo"];
      long long v76 = [v1 objectForKeyedSubscript:@"offerInfo"];
      long long v75 = [v1 objectForKeyedSubscript:@"planDetails"];
      long long v79 = [v1 objectForKeyedSubscript:@"container"];
      uint64_t v7 = _ICQGetLogSystem();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v89 = (uint64_t)v2;
        _os_log_impl(&dword_1D5851000, v7, OS_LOG_TYPE_DEFAULT, "offerType: %{public}@", buf, 0xCu);
      }

      uint64_t v8 = _ICQGetLogSystem();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v89 = v3;
        _os_log_impl(&dword_1D5851000, v8, OS_LOG_TYPE_DEFAULT, "type: %{public}@", buf, 0xCu);
      }
      long long v74 = (void *)v3;

      uint64_t v9 = _ICQGetLogSystem();
      BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
      int v11 = (void *)v6;
      id v12 = (void *)v5;
      if (v4)
      {
        __int16 v13 = (void *)v73;
        if (!v10) {
          goto LABEL_17;
        }
        *(_DWORD *)buf = 138412290;
        uint64_t v89 = (uint64_t)v4;
        int v14 = "notificationInfo: present %@";
        uint64_t v15 = v9;
        uint32_t v16 = 12;
      }
      else
      {
        __int16 v13 = (void *)v73;
        if (!v10) {
          goto LABEL_17;
        }
        *(_WORD *)buf = 0;
        int v14 = "notificationInfo: missing";
        uint64_t v15 = v9;
        uint32_t v16 = 2;
      }
      _os_log_impl(&dword_1D5851000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
LABEL_17:

      if (v13)
      {
        char v19 = objc_opt_respondsToSelector();
        id v20 = _ICQGetLogSystem();
        BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
        if (v19)
        {
          if (v21)
          {
            int v22 = [v13 BOOLValue];
            *(_DWORD *)buf = 67109120;
            LODWORD(v89) = v22;
            _os_log_impl(&dword_1D5851000, v20, OS_LOG_TYPE_DEFAULT, "iTunesAccountExists: %d", buf, 8u);
          }
        }
        else if (v21)
        {
          uint64_t v23 = objc_opt_class();
          *(_DWORD *)buf = 138412290;
          uint64_t v89 = (uint64_t)v23;
          id v24 = v23;
          _os_log_impl(&dword_1D5851000, v20, OS_LOG_TYPE_DEFAULT, "iTunesAccountExists: unexpected class %@", buf, 0xCu);
        }
      }
      if (v82)
      {
        char v25 = objc_opt_respondsToSelector();
        v26 = _ICQGetLogSystem();
        BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
        if (v25)
        {
          if (v27)
          {
            [v82 doubleValue];
            *(_DWORD *)buf = 134217984;
            uint64_t v89 = v28;
            _os_log_impl(&dword_1D5851000, v26, OS_LOG_TYPE_DEFAULT, "callbackInterval: %g", buf, 0xCu);
          }
        }
        else if (v27)
        {
          int v29 = objc_opt_class();
          *(_DWORD *)buf = 138412290;
          uint64_t v89 = (uint64_t)v29;
          id v30 = v29;
          _os_log_impl(&dword_1D5851000, v26, OS_LOG_TYPE_DEFAULT, "callbackInterval: unexpected class %@", buf, 0xCu);
        }
      }
      if (v81)
      {
        char v31 = objc_opt_respondsToSelector();
        v32 = _ICQGetLogSystem();
        BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
        if (v31)
        {
          if (v33)
          {
            int v34 = [v81 BOOLValue];
            *(_DWORD *)buf = 67109120;
            LODWORD(v89) = v34;
            _os_log_impl(&dword_1D5851000, v32, OS_LOG_TYPE_DEFAULT, "showAlert: %d", buf, 8u);
          }
        }
        else if (v33)
        {
          uint64_t v35 = objc_opt_class();
          *(_DWORD *)buf = 138412290;
          uint64_t v89 = (uint64_t)v35;
          id v36 = v35;
          _os_log_impl(&dword_1D5851000, v32, OS_LOG_TYPE_DEFAULT, "showAlert: unexpected class %@", buf, 0xCu);
        }
      }
      v37 = _ICQGetLogSystem();
      BOOL v38 = os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT);
      if (v78)
      {
        if (!v38) {
          goto LABEL_44;
        }
        *(_WORD *)buf = 0;
        v39 = "alertInfo: present";
      }
      else
      {
        if (!v38) {
          goto LABEL_44;
        }
        *(_WORD *)buf = 0;
        v39 = "alertInfo: missing";
      }
      _os_log_impl(&dword_1D5851000, v37, OS_LOG_TYPE_DEFAULT, v39, buf, 2u);
LABEL_44:

      if (v80)
      {
        char v40 = objc_opt_respondsToSelector();
        v41 = _ICQGetLogSystem();
        BOOL v42 = os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT);
        if (v40)
        {
          if (v42)
          {
            int v43 = [v80 BOOLValue];
            *(_DWORD *)buf = 67109120;
            LODWORD(v89) = v43;
            _os_log_impl(&dword_1D5851000, v41, OS_LOG_TYPE_DEFAULT, "showBanner: %d", buf, 8u);
          }
        }
        else if (v42)
        {
          uint64_t v44 = objc_opt_class();
          *(_DWORD *)buf = 138412290;
          uint64_t v89 = (uint64_t)v44;
          id v45 = v44;
          _os_log_impl(&dword_1D5851000, v41, OS_LOG_TYPE_DEFAULT, "showBanner: unexpected class %@", buf, 0xCu);
        }
      }
      uint64_t v46 = _ICQGetLogSystem();
      BOOL v47 = os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT);
      v48 = v12;
      if (v6)
      {
        v49 = (void *)v72;
        if (!v47) {
          goto LABEL_57;
        }
        *(_WORD *)buf = 0;
        v50 = "appBannerInfo: present";
      }
      else
      {
        v49 = (void *)v72;
        if (!v47) {
          goto LABEL_57;
        }
        *(_WORD *)buf = 0;
        v50 = "appBannerInfo: missing";
      }
      _os_log_impl(&dword_1D5851000, v46, OS_LOG_TYPE_DEFAULT, v50, buf, 2u);
LABEL_57:

      int v51 = v74;
      if (v49)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v68 = v11;
          v69 = v48;
          long long v70 = v4;
          id v71 = v1;
          long long v85 = 0u;
          long long v86 = 0u;
          long long v83 = 0u;
          long long v84 = 0u;
          id v52 = v49;
          uint64_t v53 = [v52 countByEnumeratingWithState:&v83 objects:v87 count:16];
          if (v53)
          {
            uint64_t v54 = v53;
            uint64_t v55 = *(void *)v84;
            do
            {
              for (uint64_t i = 0; i != v54; ++i)
              {
                if (*(void *)v84 != v55) {
                  objc_enumerationMutation(v52);
                }
                v57 = *(void **)(*((void *)&v83 + 1) + 8 * i);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v58 = NSString;
                  v59 = [v57 objectForKeyedSubscript:@"appId"];
                  v60 = [v58 stringWithFormat:@"appContextInfo: appId:%@ offerInfo: ", v59];

                  v61 = [v57 objectForKeyedSubscript:@"offerInfo"];
                  ICQLogDictKeys(v60, v61);
                }
              }
              uint64_t v54 = [v52 countByEnumeratingWithState:&v83 objects:v87 count:16];
            }
            while (v54);
          }

          id v1 = v71;
          __int16 v13 = (void *)v73;
          int v51 = v74;
          v48 = v69;
          uint64_t v4 = v70;
          int v11 = v68;
          v49 = (void *)v72;
        }
        v62 = _ICQGetLogSystem();
        if (!os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
        {
LABEL_74:

          v64 = _ICQGetLogSystem();
          BOOL v65 = os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT);
          if (v77)
          {
            if (v65)
            {
              *(_WORD *)buf = 0;
              id v66 = "followUpInfo: present";
LABEL_79:
              _os_log_impl(&dword_1D5851000, v64, OS_LOG_TYPE_DEFAULT, v66, buf, 2u);
            }
          }
          else if (v65)
          {
            *(_WORD *)buf = 0;
            id v66 = "followUpInfo: missing";
            goto LABEL_79;
          }

          ICQLogDictKeys(@"app-independent offerInfo: ", v76);
          ICQLogDictKeys(@"planDetails: ", v75);
          ICQLogDictKeys(@"quotaInfo: ", v48);
          if (v79)
          {
            v67 = _ICQGetLogSystem();
            if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v89 = (uint64_t)v79;
              _os_log_impl(&dword_1D5851000, v67, OS_LOG_TYPE_DEFAULT, "container: %@", buf, 0xCu);
            }
          }
          goto LABEL_85;
        }
        *(_WORD *)buf = 0;
        v63 = "appContextInfo: present";
      }
      else
      {
        v62 = _ICQGetLogSystem();
        if (!os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_74;
        }
        *(_WORD *)buf = 0;
        v63 = "appContextInfo: missing";
      }
      _os_log_impl(&dword_1D5851000, v62, OS_LOG_TYPE_DEFAULT, v63, buf, 2u);
      goto LABEL_74;
    }
    id v2 = _ICQGetLogSystem();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = objc_opt_class();
      *(_DWORD *)buf = 138412290;
      uint64_t v89 = (uint64_t)v17;
      id v18 = v17;
      _os_log_impl(&dword_1D5851000, v2, OS_LOG_TYPE_DEFAULT, "event details: unexpected class %@", buf, 0xCu);
    }
  }
  else
  {
    id v2 = _ICQGetLogSystem();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D5851000, v2, OS_LOG_TYPE_DEFAULT, "event details: nil", buf, 2u);
    }
  }
LABEL_85:
}

void ICQLogDictKeys(void *a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v4 count])
  {
    uint64_t v5 = [v4 allKeys];
  }
  else
  {
    uint64_t v5 = @"missing";
  }
  uint64_t v6 = _ICQGetLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543618;
    id v8 = v3;
    __int16 v9 = 2114;
    BOOL v10 = v5;
    _os_log_impl(&dword_1D5851000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@%{public}@", (uint8_t *)&v7, 0x16u);
  }
}

__CFString *StringFromResponseData(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    id v7 = 0;
    id v2 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v1 options:0 error:&v7];
    id v3 = v7;
    if (v3)
    {
      id v4 = v3;
      uint64_t v5 = [[NSString alloc] initWithData:v1 encoding:4];

      id v2 = (__CFString *)v5;
    }
  }
  else
  {
    id v2 = @"<no data>";
  }

  return v2;
}

void ICQLogDataTaskComplete(void *a1, void *a2, void *a3, void *a4)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = _ICQGetLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = StringFromResponseData(v8);
    int v13 = 138544130;
    id v14 = v7;
    __int16 v15 = 2114;
    uint32_t v16 = v12;
    __int16 v17 = 2114;
    id v18 = v9;
    __int16 v19 = 2114;
    id v20 = v10;
    _os_log_impl(&dword_1D5851000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ request completed with data: %{public}@\n\nwith response: %{public}@\n\t\nwith error: %{public}@", (uint8_t *)&v13, 0x2Au);
  }
}

os_signpost_id_t _ICQSignpostCreate(NSObject *a1)
{
  os_signpost_id_t v1 = os_signpost_id_generate(a1);
  mach_continuous_time();
  return v1;
}

id _ICQBundleIDForKnownContainerID(void *a1)
{
  uint64_t v1 = _ICQInitKnownBundleContainerMappings_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&_ICQInitKnownBundleContainerMappings_onceToken, &__block_literal_global_263);
  }
  id v3 = [(id)sBundleIDForKnownContainerID objectForKeyedSubscript:v2];

  return v3;
}

id _ICQContainerIDForKnownBundleID(void *a1)
{
  uint64_t v1 = _ICQInitKnownBundleContainerMappings_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&_ICQInitKnownBundleContainerMappings_onceToken, &__block_literal_global_263);
  }
  id v3 = [(id)sContainerIDForKnownBundleID objectForKeyedSubscript:v2];

  return v3;
}

id _ICQStringForKey(void *a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [a1 objectForKeyedSubscript:v3];
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v5 = _ICQGetLogSystem();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = (objc_class *)objc_opt_class();
        id v7 = NSStringFromClass(v6);
        int v9 = 138412546;
        id v10 = v3;
        __int16 v11 = 2112;
        id v12 = v7;
        _os_log_impl(&dword_1D5851000, v5, OS_LOG_TYPE_DEFAULT, "expected NSString from key %@ but got %@", (uint8_t *)&v9, 0x16u);
      }
      id v4 = 0;
    }
  }

  return v4;
}

id _ICQStringForOneOfKeys(void *a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = a2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = _ICQStringForKey(v3, *(void **)(*((void *)&v12 + 1) + 8 * i));
        if (v9)
        {
          id v10 = (void *)v9;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

id _ICQDictionaryForKey(void *a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [a1 objectForKeyedSubscript:v3];
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v5 = _ICQGetLogSystem();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = (objc_class *)objc_opt_class();
        uint64_t v7 = NSStringFromClass(v6);
        int v9 = 138412546;
        id v10 = v3;
        __int16 v11 = 2112;
        long long v12 = v7;
        _os_log_impl(&dword_1D5851000, v5, OS_LOG_TYPE_DEFAULT, "expected NSDictionary from key %@ but got %@", (uint8_t *)&v9, 0x16u);
      }
      id v4 = 0;
    }
  }

  return v4;
}

id _ICQArrayForKey(void *a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [a1 objectForKeyedSubscript:v3];
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v5 = _ICQGetLogSystem();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = (objc_class *)objc_opt_class();
        uint64_t v7 = NSStringFromClass(v6);
        int v9 = 138412546;
        id v10 = v3;
        __int16 v11 = 2112;
        long long v12 = v7;
        _os_log_impl(&dword_1D5851000, v5, OS_LOG_TYPE_DEFAULT, "expected NSDictionary from key %@ but got %@", (uint8_t *)&v9, 0x16u);
      }
      id v4 = 0;
    }
  }

  return v4;
}

id _ICQDictionaryForOneOfKeys(void *a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = a2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = _ICQDictionaryForKey(v3, *(void **)(*((void *)&v12 + 1) + 8 * i));
        if (v9)
        {
          id v10 = (void *)v9;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

uint64_t _ICQBooleanForServerObjectDefault(void *a1, uint64_t a2)
{
  id v3 = a1;
  if (_ICQBooleanForServerObjectDefault_onceToken != -1) {
    dispatch_once(&_ICQBooleanForServerObjectDefault_onceToken, &__block_literal_global_24);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    a2 = [v3 BOOLValue];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = (void *)_ICQBooleanForServerObjectDefault_sBoolDict;
      uint64_t v5 = [v3 uppercaseString];
      uint64_t v6 = [v4 objectForKey:v5];

      if (v6) {
        a2 = [v6 BOOLValue];
      }
    }
  }

  return a2;
}

uint64_t _ICQActionForServerActionString(void *a1)
{
  id v1 = a1;
  if (_ICQActionForServerActionString_onceToken != -1) {
    dispatch_once(&_ICQActionForServerActionString_onceToken, &__block_literal_global_55);
  }
  id v2 = [(id)_ICQActionForServerActionString_actionForServerActionString objectForKeyedSubscript:v1];
  id v3 = v2;
  if (v2) {
    uint64_t v4 = [v2 integerValue];
  }
  else {
    uint64_t v4 = _ICQActionForString(v1);
  }
  uint64_t v5 = v4;

  return v5;
}

id _ICQActionParametersForServerActionParameters(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = v6;
  if (v5) {
    [v6 setObject:v5 forKey:@"URL"];
  }
  id v24 = v5;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v8 = v4;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v26;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(__CFString **)(*((void *)&v25 + 1) + 8 * v12);
        if ([(__CFString *)v13 isEqualToString:@"buyQueryParams"])
        {
          long long v14 = [v8 objectForKeyedSubscript:v13];
          long long v15 = v7;
          uint32_t v16 = v14;
          uint64_t v17 = @"URLQueryParameters";
          goto LABEL_14;
        }
        if ([(__CFString *)v13 isEqualToString:@"linkURL"])
        {
          long long v14 = [v8 objectForKeyedSubscript:v13];
          long long v15 = v7;
          uint32_t v16 = v14;
          uint64_t v17 = @"URL";
          goto LABEL_14;
        }
        if ([(__CFString *)v13 isEqualToString:@"openUrl"])
        {
          long long v14 = [v8 objectForKeyedSubscript:v13];
          long long v15 = v7;
          uint32_t v16 = v14;
          uint64_t v17 = @"openURL";
LABEL_14:
          [v15 setObject:v16 forKey:v17];
LABEL_15:

          goto LABEL_16;
        }
        if ([(__CFString *)v13 isEqualToString:@"route"])
        {
          long long v14 = [v8 objectForKeyedSubscript:v13];
          id v18 = v7;
          __int16 v19 = v14;
          id v20 = @"route";
LABEL_30:
          [v18 setObject:v19 forKeyedSubscript:v20];
          goto LABEL_15;
        }
        if ([(__CFString *)v13 isEqualToString:@"purchaseAttribution"])
        {
          long long v14 = [v8 objectForKeyedSubscript:v13];
          id v18 = v7;
          __int16 v19 = v14;
          id v20 = @"purchaseAttribution";
          goto LABEL_30;
        }
        if (([(__CFString *)v13 isEqualToString:@"skipCFU"] & 1) != 0
          || ([(__CFString *)v13 isEqualToString:@"dismissLockScreen"] & 1) != 0
          || [(__CFString *)v13 isEqualToString:@"zeroCFUAction"])
        {
          long long v14 = [v8 objectForKeyedSubscript:v13];
          if ([(__CFString *)v14 BOOLValue]) {
            __int16 v19 = @"true";
          }
          else {
            __int16 v19 = @"false";
          }
          id v18 = v7;
LABEL_29:
          id v20 = v13;
          goto LABEL_30;
        }
        if (([(__CFString *)v13 isEqualToString:@"amsParams"] & 1) != 0
          || ([(__CFString *)v13 isEqualToString:@"buyParams"] & 1) != 0
          || ([(__CFString *)v13 isEqualToString:@"interruptedBuyErrorCodes"] & 1) != 0
          || ([(__CFString *)v13 isEqualToString:@"userAgentSuffix"] & 1) != 0
          || ([(__CFString *)v13 isEqualToString:@"actionOnActionCompleteURL"] & 1) != 0
          || [(__CFString *)v13 isEqualToString:@"actionOnActionComplete"])
        {
          long long v14 = [v8 objectForKeyedSubscript:v13];
          id v18 = v7;
          __int16 v19 = v14;
          goto LABEL_29;
        }
LABEL_16:
        ++v12;
      }
      while (v10 != v12);
      uint64_t v21 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
      uint64_t v10 = v21;
    }
    while (v21);
  }

  int v22 = (void *)[v7 copy];
  return v22;
}

id _ICQLinkForServerValues(void *a1, void *a2, void *a3, void *a4, void *a5, uint64_t a6)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v11 = a1;
  id v12 = a2;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  uint32_t v16 = v15;
  if (v12 && v14)
  {
    uint64_t v17 = _ICQGetLogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v26 = 138413058;
      id v27 = v11;
      __int16 v28 = 2112;
      id v29 = v12;
      __int16 v30 = 2112;
      id v31 = v13;
      __int16 v32 = 2112;
      id v33 = v14;
      _os_log_impl(&dword_1D5851000, v17, OS_LOG_TYPE_DEFAULT, "link overrides action in text:%@ action:%@ params:%@ link:%@", (uint8_t *)&v26, 0x2Au);
    }

    goto LABEL_7;
  }
  if (v14)
  {
LABEL_7:
    uint64_t v18 = 6;
    goto LABEL_8;
  }
  if (_ICQActionForServerActionString(v12)) {
    id v15 = (id)_ICQActionForServerActionString(v12);
  }
  else {
    id v15 = (id)_ICQActionForString(v12);
  }
  uint64_t v18 = (uint64_t)v15;
LABEL_8:
  __int16 v19 = _ICQActionParametersForServerActionParameters((uint64_t)v15, v13, v14);
  id v20 = v19;
  if (v16)
  {
    if (v19) {
      uint64_t v21 = (void *)[v19 mutableCopy];
    }
    else {
      uint64_t v21 = objc_opt_new();
    }
    int v22 = v21;
    [v21 setObject:v16 forKey:@"ServerLinkId"];
    uint64_t v23 = [v22 copy];

    id v20 = (void *)v23;
  }
  id v24 = +[ICQLink linkWithText:v11 options:a6 action:v18 parameters:v20];

  return v24;
}

id _ICQLinkForServerMessageParameterWithOptions(void *a1, uint64_t a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  if (!v3) {
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v8 = _ICQGetLogSystem();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
LABEL_9:

LABEL_10:
      uint64_t v10 = 0;
      goto LABEL_22;
    }
    int v25 = 138412290;
    id v26 = v3;
    uint64_t v9 = "link: expected dict: invalid server message parameter:%@";
LABEL_8:
    _os_log_impl(&dword_1D5851000, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v25, 0xCu);
    goto LABEL_9;
  }
  id v4 = [v3 objectForKeyedSubscript:@"display"];

  if (v4)
  {
    id v5 = [v3 objectForKeyedSubscript:@"actParams"];
    uint64_t v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      id v7 = [v3 objectForKeyedSubscript:@"params"];
    }
    id v12 = v7;

    id v13 = [v3 objectForKeyedSubscript:@"display"];
    id v14 = [v3 objectForKeyedSubscript:@"action"];
    id v15 = [v3 objectForKeyedSubscript:@"link"];
    uint64_t v17 = v13;
    uint64_t v18 = v14;
    __int16 v19 = v12;
    id v20 = v15;
    uint64_t v21 = 0;
    goto LABEL_18;
  }
  id v11 = [v3 objectForKeyedSubscript:@"btnTitle"];

  if (v11)
  {
    id v12 = [v3 objectForKeyedSubscript:@"btnTitle"];
    id v13 = [v3 objectForKeyedSubscript:@"btnAction"];
    id v14 = [v3 objectForKeyedSubscript:@"btnActParams"];
    id v15 = v14;
    if (!v14)
    {
      id v15 = [v3 objectForKeyedSubscript:@"actParams"];
    }
    uint32_t v16 = [v3 objectForKeyedSubscript:@"btnId"];
    uint64_t v10 = _ICQLinkForServerValues(v12, v13, v15, 0, v16, a2);

    if (v14) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  uint64_t v23 = [v3 objectForKeyedSubscript:@"BtnTitle"];

  if (!v23)
  {
    id v24 = [v3 objectForKeyedSubscript:@"action"];

    if (v24)
    {
      id v12 = [v3 objectForKeyedSubscript:@"action"];
      id v13 = [v3 objectForKeyedSubscript:@"btnActParams"];
      id v14 = v13;
      if (!v13)
      {
        id v14 = [v3 objectForKeyedSubscript:@"actParams"];
      }
      uint64_t v10 = _ICQLinkForServerValues(0, v12, v14, 0, 0, a2);
      if (v13) {
        goto LABEL_21;
      }
      goto LABEL_20;
    }
    id v8 = _ICQGetLogSystem();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    int v25 = 138412290;
    id v26 = v3;
    uint64_t v9 = "Invalid link: %@";
    goto LABEL_8;
  }
  id v12 = [v3 objectForKeyedSubscript:@"BtnTitle"];
  id v13 = [v3 objectForKeyedSubscript:@"BtnAction"];
  id v14 = [v3 objectForKeyedSubscript:@"BtnActParams"];
  id v15 = [v3 objectForKeyedSubscript:@"BtnId"];
  uint64_t v17 = v12;
  uint64_t v18 = v13;
  __int16 v19 = v14;
  id v20 = 0;
  uint64_t v21 = v15;
LABEL_18:
  uint64_t v10 = _ICQLinkForServerValues(v17, v18, v19, v20, v21, a2);
LABEL_19:

LABEL_20:
LABEL_21:

LABEL_22:
  return v10;
}

id _ICQLinkForServerMessageParameter(void *a1)
{
  return _ICQLinkForServerMessageParameterWithOptions(a1, 0);
}

id _ICQLinksForServerMessageParametersWithOptions(void *a1, uint64_t a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint32_t v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v15 = v3;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v18 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          uint64_t v10 = [v9 objectForKeyedSubscript:@"id"];
          if ([v10 isEqualToString:@"cancel"])
          {
            id v11 = _ICQGetLogSystem();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              id v23 = v9;
              _os_log_debug_impl(&dword_1D5851000, v11, OS_LOG_TYPE_DEBUG, "Main links array excludes dismiss link: %@", buf, 0xCu);
            }
          }
          else
          {
            id v11 = _ICQLinkForServerMessageParameterWithOptions(v9, a2);
            if (v11) {
              [v16 addObject:v11];
            }
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v6);
    }

    id v12 = v16;
    id v13 = [v16 copy];
    id v3 = v15;
LABEL_19:

    goto LABEL_20;
  }
  if (v3)
  {
    id v12 = _ICQGetLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v3;
      _os_log_impl(&dword_1D5851000, v12, OS_LOG_TYPE_DEFAULT, "links: expected array: invalid server message parameters:%@", buf, 0xCu);
    }
    id v13 = (id)MEMORY[0x1E4F1CBF0];
    goto LABEL_19;
  }
  id v13 = (id)MEMORY[0x1E4F1CBF0];
LABEL_20:

  return v13;
}

id _ICQLinksForServerMessageParameters(void *a1)
{
  return _ICQLinksForServerMessageParametersWithOptions(a1, 0);
}

id _ICQLinksForServerActionBasedUniversalLink(void *a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  id v2 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v3 = v1;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v20 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      id v13 = v1;
      uint64_t v6 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v15 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v9 = [v3 objectForKeyedSubscript:v8];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v10 = _ICQLinkForServerMessageParameterWithOptions(v9, 0);
              [v2 setObject:v10 forKeyedSubscript:v8];
            }
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v20 count:16];
      }
      while (v5);
      id v1 = v13;
    }
  }
  else
  {
    id v3 = _ICQGetLogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v1;
      _os_log_impl(&dword_1D5851000, v3, OS_LOG_TYPE_DEFAULT, "universal links: invalid server parameters:%@", buf, 0xCu);
    }
  }

  id v11 = (void *)[v2 copy];
  return v11;
}

id _ICQBindingsKeyForServerMessageParameterKey(void *a1, void *a2)
{
  id v2 = _ICQStringForKey(a1, a2);
  if ([v2 hasPrefix:@"%$"])
  {
    id v3 = [v2 substringFromIndex:objc_msgSend(@"%$", "length")];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

id _ICQLinkVisibleKeyForServerMessageParameter(void *a1)
{
  return _ICQBindingsKeyForServerMessageParameterKey(a1, @"btnVisible");
}

id _ICQMessageWithFormat(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = [v3 length];
  uint64_t v6 = objc_opt_new();
  uint64_t v27 = v5;
  uint64_t v7 = [v3 rangeOfString:@"%@", 2, 0, v5 options range];
  uint64_t v9 = v8;
  uint64_t v10 = [v4 count];
  if (v10) {
    uint64_t v11 = v9;
  }
  else {
    uint64_t v11 = 0;
  }
  if (v10) {
    uint64_t v12 = v7;
  }
  else {
    uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v13 = 0;
  if (v11)
  {
    unint64_t v14 = 0;
    do
    {
      long long v15 = [v4 objectAtIndexedSubscript:v14];
      long long v16 = objc_msgSend(v3, "substringWithRange:", v13, v12 - v13);
      [v6 appendString:v16];

      long long v17 = NSString;
      long long v18 = [v15 text];
      id v19 = [v17 stringWithFormat:@"%@", v18];
      [v6 appendString:v19];

      if ([v15 options]) {
        [v6 appendString:@" >"];
      }
      uint64_t v13 = v12 + v11;
      ++v14;

      uint64_t v20 = [v3 rangeOfString:@"%@", 2, v12 + v11, v27 - (v12 + v11) options range];
      uint64_t v22 = v21;
      unint64_t v23 = [v4 count];
      if (v14 >= v23) {
        uint64_t v11 = 0;
      }
      else {
        uint64_t v11 = v22;
      }
      if (v14 >= v23) {
        uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        uint64_t v12 = v20;
      }
    }
    while (v11);
  }
  uint64_t v24 = [v3 substringFromIndex:v13];
  [v6 appendString:v24];

  int v25 = (void *)[v6 copy];
  return v25;
}

id _ICQLinkButtonForServerMessage(void *a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 objectForKeyedSubscript:@"format"];
    uint64_t v5 = v4;
    if (v4)
    {
      uint64_t v6 = [v4 componentsSeparatedByString:@"%@"];
      unint64_t v7 = [v6 count];

      if (v7 >= 3)
      {
        uint64_t v8 = _ICQGetLogSystem();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          int v13 = 138412290;
          unint64_t v14 = v5;
          _os_log_impl(&dword_1D5851000, v8, OS_LOG_TYPE_DEFAULT, "format is \"%@\"; button may not contain more than one \"%%@\"",
            (uint8_t *)&v13,
            0xCu);
        }
      }
    }
    uint64_t v9 = [v3 objectForKeyedSubscript:@"params"];
    uint64_t v10 = _ICQLinksForServerMessageParametersWithOptions(v9, a2);

    uint64_t v11 = [v10 firstObject];
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

void _ICQAppendServerMessageFormatAndLinks(void *a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = (__CFString *)v5;
LABEL_10:
    int v13 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    unint64_t v14 = _ICQGetLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412290;
      id v16 = v5;
      _os_log_impl(&dword_1D5851000, v14, OS_LOG_TYPE_DEFAULT, "expected message; bad plist object:%@",
        (uint8_t *)&v15,
        0xCu);
    }

    uint64_t v8 = &stru_1F2DCE430;
    goto LABEL_10;
  }
  uint64_t v9 = [v5 objectForKeyedSubscript:@"format"];
  uint64_t v10 = (void *)v9;
  uint64_t v11 = &stru_1F2DCE430;
  if (v9) {
    uint64_t v11 = (__CFString *)v9;
  }
  uint64_t v8 = v11;

  uint64_t v12 = [v5 objectForKeyedSubscript:@"params"];
  int v13 = _ICQLinksForServerMessageParametersWithOptions(v12, 0);

LABEL_11:
  if ([v6 length]) {
    [v6 appendString:@"\u2029"];
  }
  [v6 appendString:v8];
  [v7 addObjectsFromArray:v13];
}

void _ICQServerHeaderGetFormatAndLinks(void *a1, void *a2, void *a3)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v19[0] = v5;
      uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];

      id v5 = (id)v6;
    }
  }
  id v7 = objc_opt_new();
  uint64_t v8 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        _ICQAppendServerMessageFormatAndLinks(*(void **)(*((void *)&v14 + 1) + 8 * v13++), v7, v8);
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }

  if (a2) {
    *a2 = (id)objc_msgSend(v7, "copy", (void)v14);
  }
  if (a3) {
    *a3 = (id)[v8 copy];
  }
}

id _ICQMessageForServerHeader(void *a1)
{
  uint64_t v6 = &stru_1F2DCE430;
  id v5 = (id)MEMORY[0x1E4F1CBF0];
  _ICQServerHeaderGetFormatAndLinks(a1, &v6, &v5);
  id v1 = v6;
  id v2 = v5;
  id v3 = _ICQMessageWithFormat(v1, v2);

  return v3;
}

void _ICQServerDictToOfferTypeAndLevel(void *a1, unint64_t *a2, uint64_t *a3)
{
  id v5 = a1;
  uint64_t v6 = [v5 objectForKeyedSubscript:@"offerType"];
  unint64_t v7 = _ICQOfferTypeForServerString(v6);

  uint64_t v8 = [v5 objectForKeyedSubscript:@"type"];

  uint64_t v9 = _ICQLevelForString(v8);
  if (v7 - 2 < 7)
  {
    uint64_t v10 = qword_1D58D3298[v7 - 2];
    if (!a2) {
      goto LABEL_20;
    }
LABEL_19:
    *a2 = v7;
    goto LABEL_20;
  }
  unint64_t v11 = v9 - 1;
  if (v7 <= 1) {
    uint64_t v12 = 1;
  }
  else {
    uint64_t v12 = v7;
  }
  if (v9) {
    uint64_t v13 = v9;
  }
  else {
    uint64_t v13 = 0;
  }
  if (v9) {
    uint64_t v12 = v7;
  }
  BOOL v14 = v11 >= 3;
  if (v11 >= 3) {
    uint64_t v10 = v13;
  }
  else {
    uint64_t v10 = v9;
  }
  if (v14) {
    unint64_t v7 = v12;
  }
  else {
    unint64_t v7 = 1;
  }
  if (a2) {
    goto LABEL_19;
  }
LABEL_20:
  if (a3) {
    *a3 = v10;
  }
}

uint64_t _ICQIsBuddyOfferDictionary(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = [v1 objectForKeyedSubscript:@"isBuddyOffer"];
    uint64_t v3 = _ICQBooleanForServerObjectDefault(v2, 0);
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

uint64_t _ICQIsDefaultOfferDictionary(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = [v1 objectForKeyedSubscript:@"isDefaultOffer"];
    uint64_t v3 = _ICQBooleanForServerObjectDefault(v2, 0);
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

uint64_t _ICQIsPremiumOfferDictionary(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = [v1 objectForKeyedSubscript:@"isPremiumOffer"];
    uint64_t v3 = _ICQBooleanForServerObjectDefault(v2, 0);
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

uint64_t _ICQIsEventOfferDictionary(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = [v1 objectForKeyedSubscript:@"isEventOffer"];
    uint64_t v3 = _ICQBooleanForServerObjectDefault(v2, 0);
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

void sub_1D58A1A2C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

Class __getINDaemonConnectionClass_block_invoke_3(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!iCloudNotificationLibraryCore_frameworkLibrary_3)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __iCloudNotificationLibraryCore_block_invoke_3;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6A53948;
    uint64_t v6 = 0;
    iCloudNotificationLibraryCore_frameworkLibrary_3 = _sl_dlopen();
    id v2 = (void *)v4[0];
    if (!iCloudNotificationLibraryCore_frameworkLibrary_3)
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
    Class result = objc_getClass("INDaemonConnection");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    id v2 = (void *)__getINDaemonConnectionClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getINDaemonConnectionClass_softClass_3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __iCloudNotificationLibraryCore_block_invoke_3()
{
  uint64_t result = _sl_dlopen();
  iCloudNotificationLibraryCore_frameworkLibrary_3 = result;
  return result;
}

uint64_t sub_1D58A5350()
{
  return sub_1D58CC9C0();
}

uint64_t sub_1D58A5398@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 120))();
  *a2 = result;
  return result;
}

uint64_t sub_1D58A53E4(id *a1, uint64_t a2)
{
  id v2 = *a1;
  uint64_t v3 = *(uint64_t (**)(id))(**(void **)a2 + 128);
  id v4 = *a1;
  return v3(v2);
}

uint64_t sub_1D58A543C()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1D58CCA00();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_1D58A54B0()
{
  return sub_1D58CCA10();
}

uint64_t (*sub_1D58A5520(void *a1))()
{
  id v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_1D58CC9F0();
  return sub_1D58A55AC;
}

uint64_t sub_1D58A55B0()
{
  return 0;
}

uint64_t sub_1D58A55B8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)a1 + 144))();
}

uint64_t sub_1D58A55FC(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA7232F8);
  MEMORY[0x1F4188790]();
  long long v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v6 + 16))(v5, a1);
  return (*(uint64_t (**)(char *))(**(void **)a2 + 152))(v5);
}

uint64_t sub_1D58A56EC()
{
  return sub_1D58A60F8((uint64_t)&OBJC_IVAR____TtC11iCloudQuota16StorageAppsModel__storageApps, &qword_1EA7232F0);
}

uint64_t sub_1D58A5700(uint64_t a1)
{
  return sub_1D58A617C(a1, &qword_1EA7232F8, (uint64_t)&OBJC_IVAR____TtC11iCloudQuota16StorageAppsModel__storageApps, &qword_1EA7232F0);
}

uint64_t (*sub_1D58A571C(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA7232F8);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC11iCloudQuota16StorageAppsModel__storageApps;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA7232F0);
  sub_1D58CC9D0();
  swift_endAccess();
  return sub_1D58A582C;
}

uint64_t sub_1D58A5830()
{
  return sub_1D58CC9C0();
}

uint64_t sub_1D58A5860@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 168))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_1D58A58B0(unsigned __int8 *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(**(void **)a2 + 176))(*a1);
}

uint64_t sub_1D58A58F8()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1D58CCA00();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_1D58A596C()
{
  return sub_1D58CCA10();
}

uint64_t (*sub_1D58A59DC(void *a1))()
{
  id v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_1D58CC9F0();
  return sub_1D58A55AC;
}

uint64_t sub_1D58A5A68()
{
  return 0;
}

uint64_t sub_1D58A5A70(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)a1 + 192))();
}

uint64_t sub_1D58A5AB4(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA723308);
  MEMORY[0x1F4188790]();
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v6 + 16))(v5, a1);
  return (*(uint64_t (**)(char *))(**(void **)a2 + 200))(v5);
}

uint64_t sub_1D58A5BA4()
{
  return sub_1D58A60F8((uint64_t)&OBJC_IVAR____TtC11iCloudQuota16StorageAppsModel__didError, &qword_1EA723300);
}

uint64_t sub_1D58A5BB8(uint64_t a1)
{
  return sub_1D58A617C(a1, &qword_1EA723308, (uint64_t)&OBJC_IVAR____TtC11iCloudQuota16StorageAppsModel__didError, &qword_1EA723300);
}

uint64_t (*sub_1D58A5BD4(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA723308);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC11iCloudQuota16StorageAppsModel__didError;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA723300);
  sub_1D58CC9D0();
  swift_endAccess();
  return sub_1D58A582C;
}

uint64_t sub_1D58A5CE4()
{
  return sub_1D58CC9C0();
}

uint64_t sub_1D58A5D2C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 216))();
  *a2 = result;
  return result;
}

uint64_t sub_1D58A5D78(uint64_t a1, uint64_t a2)
{
  id v2 = *(uint64_t (**)(uint64_t))(**(void **)a2 + 224);
  uint64_t v3 = swift_bridgeObjectRetain();
  return v2(v3);
}

uint64_t sub_1D58A5DCC()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1D58CCA00();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_1D58A5E40()
{
  return sub_1D58CCA10();
}

uint64_t (*sub_1D58A5EB0(void *a1))()
{
  id v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_1D58CC9F0();
  return sub_1D58A55AC;
}

void sub_1D58A5F3C(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 48))(*a1, 0);
  swift_release();
  swift_release();
  free(v1);
}

uint64_t sub_1D58A5FA4()
{
  return MEMORY[0x1E4FBC860];
}

uint64_t sub_1D58A5FB0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)a1 + 240))();
}

uint64_t sub_1D58A5FF4(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA723320);
  MEMORY[0x1F4188790]();
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v6 + 16))(v5, a1);
  return (*(uint64_t (**)(char *))(**(void **)a2 + 248))(v5);
}

uint64_t sub_1D58A60E4()
{
  return sub_1D58A60F8((uint64_t)&OBJC_IVAR____TtC11iCloudQuota16StorageAppsModel__navigationPath, &qword_1EA723318);
}

uint64_t sub_1D58A60F8(uint64_t a1, uint64_t *a2)
{
  return swift_endAccess();
}

uint64_t sub_1D58A6160(uint64_t a1)
{
  return sub_1D58A617C(a1, &qword_1EA723320, (uint64_t)&OBJC_IVAR____TtC11iCloudQuota16StorageAppsModel__navigationPath, &qword_1EA723318);
}

uint64_t sub_1D58A617C(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790]();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v10 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a4);
  sub_1D58CC9E0();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
}

uint64_t (*sub_1D58A62AC(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA723320);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC11iCloudQuota16StorageAppsModel__navigationPath;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA723318);
  sub_1D58CC9D0();
  swift_endAccess();
  return sub_1D58A582C;
}

void sub_1D58A63BC(uint64_t a1, char a2)
{
  uint64_t v3 = *(void **)a1;
  uint64_t v4 = *(void (**)(void, void, void))(*(void *)(*(void *)a1 + 88) + 16);
  v4(*(void *)(*(void *)a1 + 104), v3[14], v3[10]);
  uint64_t v5 = (void *)v3[14];
  size_t v6 = (void *)v3[12];
  uint64_t v7 = (void *)v3[13];
  uint64_t v8 = v3[10];
  uint64_t v9 = v3[11];
  if (a2)
  {
    v4(v3[12], v3[13], v3[10]);
    swift_beginAccess();
    sub_1D58CC9E0();
    swift_endAccess();
    uint64_t v10 = *(void (**)(void *, uint64_t))(v9 + 8);
    v10(v7, v8);
    v10(v5, v8);
  }
  else
  {
    swift_beginAccess();
    sub_1D58CC9E0();
    swift_endAccess();
    (*(void (**)(void *, uint64_t))(v9 + 8))(v5, v8);
  }
  free(v5);
  free(v7);
  free(v6);
  free(v3);
}

id StorageAppsModel.account.getter()
{
  return *(id *)(v0 + OBJC_IVAR____TtC11iCloudQuota16StorageAppsModel_account);
}

uint64_t sub_1D58A653C()
{
  return 0;
}

char *StorageAppsModel.__allocating_init(account:)(void *a1)
{
  swift_allocObject();
  id v2 = sub_1D58A7CD8(a1);

  return v2;
}

char *StorageAppsModel.init(account:)(void *a1)
{
  id v2 = sub_1D58A7CD8(a1);

  return v2;
}

char *StorageAppsModel.deinit()
{
  uint64_t v1 = v0;
  type metadata accessor for DarwinRegistrar();
  type metadata accessor for StorageAppsModel();
  sub_1D58A9344(v0);
  id v2 = &v0[OBJC_IVAR____TtC11iCloudQuota16StorageAppsModel__storageApps];
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA7232F0);
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  uint64_t v4 = &v1[OBJC_IVAR____TtC11iCloudQuota16StorageAppsModel__didError];
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA723300);
  (*(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  size_t v6 = &v1[OBJC_IVAR____TtC11iCloudQuota16StorageAppsModel__navigationPath];
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA723318);
  (*(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);

  swift_bridgeObjectRelease();
  return v1;
}

uint64_t StorageAppsModel.__deallocating_deinit()
{
  uint64_t v1 = v0;
  type metadata accessor for DarwinRegistrar();
  type metadata accessor for StorageAppsModel();
  sub_1D58A9344(v0);
  id v2 = &v0[OBJC_IVAR____TtC11iCloudQuota16StorageAppsModel__storageApps];
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA7232F0);
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  uint64_t v4 = &v1[OBJC_IVAR____TtC11iCloudQuota16StorageAppsModel__didError];
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA723300);
  (*(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  size_t v6 = &v1[OBJC_IVAR____TtC11iCloudQuota16StorageAppsModel__navigationPath];
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA723318);
  (*(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);

  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_1D58A687C()
{
  return (*(uint64_t (**)(void, void))(*(void *)v0 + 304))(0, 0);
}

void sub_1D58A68B0(uint64_t a1, uint64_t a2)
{
  (*(void (**)(void))(*(void *)v2 + 176))(0);
  id v5 = objc_msgSend(objc_allocWithZone((Class)ICQCloudStorageDataController), sel_initWithAccount_, *(void *)(v2 + OBJC_IVAR____TtC11iCloudQuota16StorageAppsModel_account));
  uint64_t v6 = swift_allocObject();
  swift_weakInit();
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = v6;
  v7[3] = a1;
  v7[4] = a2;
  v9[4] = sub_1D58A80BC;
  v9[5] = v7;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 1107296256;
  void v9[2] = sub_1D58A6D24;
  v9[3] = &block_descriptor_1;
  uint64_t v8 = _Block_copy(v9);
  sub_1D58A80C8(a1);
  swift_release();
  objc_msgSend(v5, sel_fetchStorageAppsWithCompletion_, v8);
  _Block_release(v8);
}

uint64_t sub_1D58A6A1C(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = sub_1D58CCA30();
  uint64_t v25 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1D58CCA50();
  uint64_t v23 = *(void *)(v13 - 8);
  uint64_t v24 = v13;
  MEMORY[0x1F4188790]();
  long long v15 = (char *)&v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D58A8D34(0, &qword_1EA723360);
  uint64_t v22 = sub_1D58CCC90();
  long long v16 = (void *)swift_allocObject();
  v16[2] = a2;
  v16[3] = a1;
  v16[4] = a3;
  v16[5] = a4;
  v16[6] = a5;
  aBlock[4] = sub_1D58A8DC8;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1D58A6CE0;
  aBlock[3] = &block_descriptor_24;
  long long v17 = _Block_copy(aBlock);
  id v18 = a2;
  id v19 = a1;
  swift_retain();
  sub_1D58A80C8(a4);
  swift_release();
  sub_1D58CCA40();
  aBlock[0] = MEMORY[0x1E4FBC860];
  sub_1D58A8FA4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA723370);
  sub_1D58A8FFC();
  sub_1D58CCD30();
  uint64_t v20 = (void *)v22;
  MEMORY[0x1D9453660](0, v15, v12, v17);
  _Block_release(v17);

  (*(void (**)(char *, uint64_t))(v25 + 8))(v12, v10);
  return (*(uint64_t (**)(char *, uint64_t))(v23 + 8))(v15, v24);
}

uint64_t sub_1D58A6CE0(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void sub_1D58A6D24(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

void sub_1D58A6DB0(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_1D58CC990();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = ((uint64_t (*)(void))MEMORY[0x1F4188790])();
  uint64_t v10 = (char *)&v53 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x1F4188790](v8);
  v56 = (char *)&v53 - v12;
  MEMORY[0x1F4188790](v11);
  uint64_t v14 = (char *)&v53 - v13;
  uint64_t v15 = sub_1D58BE804();
  long long v16 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  uint64_t v57 = v15;
  v58 = v16;
  uint64_t v59 = v7 + 16;
  ((void (*)(char *))v16)(v14);
  swift_bridgeObjectRetain_n();
  long long v17 = sub_1D58CC980();
  os_log_type_t v18 = sub_1D58CCC80();
  BOOL v19 = os_log_type_enabled(v17, v18);
  uint64_t v60 = v7;
  uint64_t v61 = a1;
  uint64_t v62 = a2;
  if (v19)
  {
    uint64_t v20 = swift_slowAlloc();
    uint64_t v53 = v10;
    uint64_t v21 = (uint8_t *)v20;
    uint64_t v22 = swift_slowAlloc();
    v64[0] = v22;
    *(_DWORD *)uint64_t v21 = 136315138;
    if (a2) {
      uint64_t v23 = a1;
    }
    else {
      uint64_t v23 = 7104878;
    }
    uint64_t v54 = v6;
    uint64_t v55 = v3;
    if (a2) {
      unint64_t v24 = a2;
    }
    else {
      unint64_t v24 = 0xE300000000000000;
    }
    swift_bridgeObjectRetain();
    uint64_t v63 = sub_1D58A7680(v23, v24, v64);
    sub_1D58CCD00();
    swift_bridgeObjectRelease_n();
    uint64_t v6 = v54;
    uint64_t v3 = v55;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1D5851000, v17, v18, "Manage Storage navigation to bundleId: %s!", v21, 0xCu);
    swift_arrayDestroy();
    uint64_t v25 = v22;
    uint64_t v7 = v60;
    MEMORY[0x1D9454520](v25, -1, -1);
    id v26 = v21;
    uint64_t v10 = v53;
    MEMORY[0x1D9454520](v26, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v27 = *(uint64_t (**)(char *, uint64_t))(v7 + 8);
  uint64_t v28 = v27(v14, v6);
  uint64_t v29 = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 120))(v28);
  if (v29)
  {
    __int16 v30 = (void *)v29;
    id v31 = (void *)(v3 + OBJC_IVAR____TtC11iCloudQuota16StorageAppsModel_needsNavigatingToBundleId);
    *id v31 = 0;
    v31[1] = 0;
    uint64_t v32 = swift_bridgeObjectRelease();
    unint64_t v33 = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 216))(v32);
    if (v33 >> 62) {
      uint64_t v34 = sub_1D58CCDB0();
    }
    else {
      uint64_t v34 = *(void *)((v33 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    uint64_t v35 = *(uint64_t (**)(uint64_t *))(*(void *)v3 + 232);
    id v36 = (void (*)(uint64_t *, void))v35(v64);
    sub_1D58A73EC(v34);
    v36(v64, 0);
    uint64_t v37 = v62;
    if (!v62) {
      goto LABEL_20;
    }
    id v38 = objc_msgSend(v30, sel_apps);
    sub_1D58A8D34(0, &qword_1EA723328);
    unint64_t v39 = sub_1D58CCB60();

    swift_bridgeObjectRetain();
    char v40 = sub_1D58A83F4(v39, v61, v37);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v40)
    {
      v58(v56, v57, v6);
      v41 = sub_1D58CC980();
      os_log_type_t v42 = sub_1D58CCC80();
      if (os_log_type_enabled(v41, v42))
      {
        int v43 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)int v43 = 0;
        _os_log_impl(&dword_1D5851000, v41, v42, "Manage Storage navigation found matching bundleId", v43, 2u);
        MEMORY[0x1D9454520](v43, -1, -1);
      }

      v27(v56, v6);
      id v44 = objc_msgSend(v40, sel_action);
      id v45 = (void (*)(uint64_t *, void))v35(v64);
      BOOL v47 = v46;
      MEMORY[0x1D9453500]();
      if (*(void *)((*v47 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v47 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_1D58CCB80();
      }
      sub_1D58CCB90();
      sub_1D58CCB70();
      v45(v64, 0);
    }
    else
    {
LABEL_20:
    }
  }
  else
  {
    v58(v10, v57, v6);
    v48 = sub_1D58CC980();
    os_log_type_t v49 = sub_1D58CCC80();
    if (os_log_type_enabled(v48, v49))
    {
      v50 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v50 = 0;
      _os_log_impl(&dword_1D5851000, v48, v49, "No storage apps, delaying navigation until request returns", v50, 2u);
      MEMORY[0x1D9454520](v50, -1, -1);
    }

    v27(v10, v6);
    int v51 = (void *)(v3 + OBJC_IVAR____TtC11iCloudQuota16StorageAppsModel_needsNavigatingToBundleId);
    uint64_t v52 = v62;
    *int v51 = v61;
    v51[1] = v52;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_1D58A73EC(uint64_t result)
{
  if (!result) {
    return result;
  }
  uint64_t v2 = result;
  if (result < 0)
  {
    __break(1u);
  }
  else if (!(*v1 >> 62))
  {
    uint64_t v3 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t v4 = -v3;
    if (!__OFSUB__(0, v3)) {
      goto LABEL_5;
    }
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  swift_bridgeObjectRetain();
  uint64_t v3 = sub_1D58CCDB0();
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v4 = -v3;
  if (__OFSUB__(0, v3)) {
    goto LABEL_19;
  }
LABEL_5:
  uint64_t v5 = -v2;
  if (v4 <= 0 && v4 > v5) {
    goto LABEL_22;
  }
  uint64_t result = v3 - v2;
  if (__OFADD__(v3, v5)) {
    goto LABEL_20;
  }
  if (v3 < result)
  {
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
    return result;
  }
  return sub_1D58A80D8(result, v3);
}

uint64_t sub_1D58A74C0()
{
  uint64_t v1 = (void (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v0 + 232))(v5);
  *uint64_t v2 = MEMORY[0x1E4FBC860];
  swift_bridgeObjectRelease();
  v1(v5, 0);
  uint64_t v3 = (void *)(v0 + OBJC_IVAR____TtC11iCloudQuota16StorageAppsModel_needsNavigatingToBundleId);
  *uint64_t v3 = 0;
  v3[1] = 0;
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))(0);
}

void *sub_1D58A7584(void *result, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  if (a2)
  {
    uint64_t v7 = *(void (**)(uint64_t))(*(void *)a2 + 296);
    id v8 = result;
    id v9 = a3;
    id v10 = a5;
    uint64_t v11 = swift_retain();
    v7(v11);

    return (void *)swift_release();
  }
  return result;
}

uint64_t sub_1D58A7634@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for StorageAppsModel();
  uint64_t result = sub_1D58CC9B0();
  *a1 = result;
  return result;
}

uint64_t sub_1D58A7674(uint64_t *a1, uint64_t *a2)
{
  return _s11iCloudQuota16StorageAppsModelC2eeoiySbAC_ACtFZ_0(*a1, *a2);
}

uint64_t sub_1D58A7680(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1D58A7754(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1D58A8CD4((uint64_t)v12, *a3);
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
      sub_1D58A8CD4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_1D58A7754(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_1D58CCD10();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_1D58A7910(a5, a6);
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
  uint64_t v8 = sub_1D58CCD90();
  if (!v8)
  {
    sub_1D58CCDA0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_1D58CCDF0();
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

uint64_t sub_1D58A7910(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_1D58A79A8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1D58A7B88(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1D58A7B88(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1D58A79A8(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_1D58A7B20(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_1D58CCD60();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_1D58CCDA0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_1D58CCB10();
      if (!v2) {
        return MEMORY[0x1E4FBC860];
      }
    }
    sub_1D58CCDF0();
    __break(1u);
LABEL_14:
    uint64_t result = sub_1D58CCDA0();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E4FBC860];
  }
  return result;
}

void *sub_1D58A7B20(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA723730);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1D58A7B88(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA723730);
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
  uint64_t v13 = a4 + 32;
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
  uint64_t result = sub_1D58CCDF0();
  __break(1u);
  return result;
}

char *sub_1D58A7CD8(void *a1)
{
  uint64_t v2 = v1;
  id v26 = a1;
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA723318);
  uint64_t v3 = *(void *)(v25 - 8);
  MEMORY[0x1F4188790]();
  size_t v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA723300);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790]();
  int64_t v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA7232F0);
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = &v2[OBJC_IVAR____TtC11iCloudQuota16StorageAppsModel__storageApps];
  uint64_t v27 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA7232E8);
  sub_1D58CC9C0();
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v14, v13, v10);
  uint64_t v15 = &v2[OBJC_IVAR____TtC11iCloudQuota16StorageAppsModel__didError];
  LOBYTE(v27) = 0;
  sub_1D58CC9C0();
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v15, v9, v6);
  long long v16 = &v2[OBJC_IVAR____TtC11iCloudQuota16StorageAppsModel__navigationPath];
  uint64_t v27 = MEMORY[0x1E4FBC860];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA723310);
  sub_1D58CC9C0();
  (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v16, v5, v25);
  long long v17 = &v2[OBJC_IVAR____TtC11iCloudQuota16StorageAppsModel_needsNavigatingToBundleId];
  *(void *)long long v17 = 0;
  *((void *)v17 + 1) = 0;
  os_log_type_t v18 = v26;
  *(void *)&v2[OBJC_IVAR____TtC11iCloudQuota16StorageAppsModel_account] = v26;
  type metadata accessor for DarwinRegistrar();
  id v19 = v18;
  uint64_t v20 = (uint64_t *)sub_1D58A9074();
  uint64_t v21 = *v20;
  unint64_t v22 = v20[1];
  type metadata accessor for StorageAppsModel();
  swift_bridgeObjectRetain();
  sub_1D58A909C(v2, v21, v22, (void (__cdecl *)(CFNotificationCenterRef, void *, CFNotificationName, const void *, CFDictionaryRef))sub_1D58A7584);
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t type metadata accessor for StorageAppsModel()
{
  uint64_t result = qword_1EA723B10;
  if (!qword_1EA723B10) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1D58A803C()
{
  swift_weakDestroy();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1D58A8074()
{
  swift_release();
  if (*(void *)(v0 + 24)) {
    swift_release();
  }
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1D58A80BC(void *a1, void *a2)
{
  return sub_1D58A6A1C(a1, a2, v2[2], v2[3], v2[4]);
}

uint64_t sub_1D58A80C8(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_1D58A80D8(uint64_t a1, uint64_t a2)
{
  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v2 = a2;
    uint64_t v4 = a1;
    if (!(*v3 >> 62))
    {
      if (*(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10) >= a2) {
        goto LABEL_4;
      }
LABEL_33:
      __break(1u);
      goto LABEL_34;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v21 = sub_1D58CCDB0();
  swift_bridgeObjectRelease();
  if (v21 < v2) {
    goto LABEL_33;
  }
LABEL_4:
  uint64_t v6 = v2 - v4;
  if (__OFSUB__(v2, v4))
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  uint64_t v5 = v4 - v2;
  if (__OFSUB__(0, v6))
  {
LABEL_35:
    __break(1u);
LABEL_36:
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_1D58CCDB0();
    swift_bridgeObjectRelease();
    uint64_t v8 = v7 + v5;
    if (!__OFADD__(v7, v5)) {
      goto LABEL_8;
    }
LABEL_38:
    __break(1u);
LABEL_39:
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_1D58CCDB0();
    swift_bridgeObjectRelease();
    unint64_t v9 = *v3;
    goto LABEL_15;
  }
  if (*v3 >> 62) {
    goto LABEL_36;
  }
  uint64_t v7 = *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v8 = v7 - v6;
  if (__OFADD__(v7, v5)) {
    goto LABEL_38;
  }
LABEL_8:
  unint64_t v9 = *v3;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v3 = v9;
  uint64_t v7 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v9 & 0x8000000000000000) == 0 && (v9 & 0x4000000000000000) == 0)
  {
    uint64_t v11 = v9 & 0xFFFFFFFFFFFFFF8;
    if (v8 <= *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_18;
    }
    uint64_t v7 = 1;
  }
  if (v9 >> 62) {
    goto LABEL_39;
  }
  uint64_t v12 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
LABEL_15:
  if (v12 <= v8) {
    uint64_t v12 = v8;
  }
  swift_bridgeObjectRetain();
  *uint64_t v3 = MEMORY[0x1D9453740](v7, v12, 1, v9);
  swift_bridgeObjectRelease();
  uint64_t v11 = *v3 & 0xFFFFFFFFFFFFFF8;
LABEL_18:
  uint64_t v13 = v11 + 32;
  uint64_t v14 = (char *)(v11 + 32 + 8 * v4);
  sub_1D58A8D34(0, &qword_1EA723358);
  swift_arrayDestroy();
  if (v5)
  {
    if (*v3 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v22 = sub_1D58CCDB0();
      swift_bridgeObjectRelease();
      uint64_t v16 = v22 - v2;
      if (!__OFSUB__(v22, v2))
      {
LABEL_21:
        if (v16 < 0)
        {
LABEL_46:
          uint64_t result = sub_1D58CCDF0();
          __break(1u);
          return result;
        }
        long long v17 = (char *)(v13 + 8 * v2);
        if (v4 != v2 || v14 >= &v17[8 * v16]) {
          memmove(v14, v17, 8 * v16);
        }
        if (!(*v3 >> 62))
        {
          uint64_t v18 = *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
          uint64_t v19 = v18 + v5;
          if (!__OFADD__(v18, v5))
          {
LABEL_27:
            *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10) = v19;
            goto LABEL_28;
          }
          goto LABEL_45;
        }
LABEL_43:
        swift_bridgeObjectRetain();
        uint64_t v23 = sub_1D58CCDB0();
        swift_bridgeObjectRelease();
        uint64_t v19 = v23 + v5;
        if (!__OFADD__(v23, v5)) {
          goto LABEL_27;
        }
LABEL_45:
        __break(1u);
        goto LABEL_46;
      }
    }
    else
    {
      uint64_t v15 = *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
      uint64_t v16 = v15 - v2;
      if (!__OFSUB__(v15, v2)) {
        goto LABEL_21;
      }
    }
    __break(1u);
    goto LABEL_43;
  }
LABEL_28:
  return sub_1D58CCB70();
}

void *sub_1D58A83F4(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = a1;
  if (a1 >> 62) {
    goto LABEL_30;
  }
  uint64_t v6 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v6; uint64_t v6 = sub_1D58CCDB0())
  {
    uint64_t v7 = 0;
    unint64_t v8 = v5 & 0xC000000000000001;
    uint64_t v21 = v5 + 32;
    unint64_t v9 = &selRef_startDataTaskWithRequest_;
    unint64_t v22 = v5 & 0xC000000000000001;
    uint64_t v23 = v5;
    while (1)
    {
      id v10 = v8 ? (id)MEMORY[0x1D9453730](v7, v5) : *(id *)(v21 + 8 * v7);
      uint64_t v11 = v10;
      if (__OFADD__(v7++, 1)) {
        break;
      }
      id v13 = [v10 v9[400]];
      uint64_t v14 = (void *)sub_1D58CCB60();

      uint64_t v15 = v14[2];
      if (v15)
      {
        BOOL v16 = v14[4] == a2 && v14[5] == a3;
        if (v16 || (sub_1D58CCE90() & 1) != 0)
        {
LABEL_27:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          return v11;
        }
        if (v15 != 1)
        {
          long long v17 = v14 + 7;
          uint64_t v18 = 1;
          while (1)
          {
            uint64_t v5 = v18 + 1;
            if (__OFADD__(v18, 1)) {
              break;
            }
            BOOL v19 = *(v17 - 1) == a2 && *v17 == a3;
            if (v19 || (sub_1D58CCE90() & 1) != 0) {
              goto LABEL_27;
            }
            v17 += 2;
            ++v18;
            if (v5 == v15) {
              goto LABEL_4;
            }
          }
          __break(1u);
          break;
        }
LABEL_4:

        swift_bridgeObjectRelease();
        unint64_t v8 = v22;
        uint64_t v5 = v23;
        unint64_t v9 = &selRef_startDataTaskWithRequest_;
        if (v7 == v6) {
          goto LABEL_31;
        }
      }
      else
      {

        swift_bridgeObjectRelease();
        if (v7 == v6) {
          goto LABEL_31;
        }
      }
    }
    __break(1u);
LABEL_30:
    swift_bridgeObjectRetain();
  }
LABEL_31:
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t _s11iCloudQuota16StorageAppsModelC2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)(*(uint64_t (**)(void))(*(void *)a1 + 120))();
  uint64_t v4 = (void *)(*(uint64_t (**)(void))(*(void *)a2 + 120))();
  uint64_t v5 = v4;
  if (v3)
  {
    if (v4)
    {
      sub_1D58A8D34(0, &qword_1EA723350);
      id v6 = v3;
      char v7 = sub_1D58CCCD0();

      if ((v7 & 1) == 0) {
        return 0;
      }
LABEL_7:
      sub_1D58A8D34(0, (unint64_t *)&qword_1EA723348);
      return sub_1D58CCCD0() & 1;
    }
  }
  else
  {
    if (!v4) {
      goto LABEL_7;
    }
  }
  return 0;
}

uint64_t sub_1D58A8720()
{
  return MEMORY[0x1E4F1ABE8];
}

uint64_t sub_1D58A872C()
{
  return type metadata accessor for StorageAppsModel();
}

void sub_1D58A8734()
{
  sub_1D58A8C34(319, &qword_1EA723330, &qword_1EA7232E8);
  if (v0 <= 0x3F)
  {
    sub_1D58A8BDC();
    if (v1 <= 0x3F)
    {
      sub_1D58A8C34(319, &qword_1EA723340, &qword_1EA723310);
      if (v2 <= 0x3F) {
        swift_updateClassMetadata2();
      }
    }
  }
}

uint64_t method lookup function for StorageAppsModel(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for StorageAppsModel);
}

uint64_t dispatch thunk of StorageAppsModel.storageApps.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of StorageAppsModel.storageApps.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of StorageAppsModel.storageApps.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of StorageAppsModel.$storageApps.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of StorageAppsModel.$storageApps.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of StorageAppsModel.$storageApps.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of StorageAppsModel.didError.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t dispatch thunk of StorageAppsModel.didError.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t dispatch thunk of StorageAppsModel.didError.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

uint64_t dispatch thunk of StorageAppsModel.$didError.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192))();
}

uint64_t dispatch thunk of StorageAppsModel.$didError.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

uint64_t dispatch thunk of StorageAppsModel.$didError.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 208))();
}

uint64_t dispatch thunk of StorageAppsModel.navigationPath.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 216))();
}

uint64_t dispatch thunk of StorageAppsModel.navigationPath.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 224))();
}

uint64_t dispatch thunk of StorageAppsModel.navigationPath.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 232))();
}

uint64_t dispatch thunk of StorageAppsModel.$navigationPath.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 240))();
}

uint64_t dispatch thunk of StorageAppsModel.$navigationPath.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 248))();
}

uint64_t dispatch thunk of StorageAppsModel.$navigationPath.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 256))();
}

uint64_t dispatch thunk of StorageAppsModel.__allocating_init(account:)()
{
  return (*(uint64_t (**)(void))(v0 + 288))();
}

uint64_t dispatch thunk of StorageAppsModel.fetchCloudStorageApps()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 296))();
}

uint64_t dispatch thunk of StorageAppsModel.fetchCloudStorageApps(completion:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 304))();
}

uint64_t dispatch thunk of StorageAppsModel.navigateTo(bundleId:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 312))();
}

uint64_t dispatch thunk of StorageAppsModel.reset()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 320))();
}

void sub_1D58A8BDC()
{
  if (!qword_1EA723338)
  {
    unint64_t v0 = sub_1D58CCA20();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EA723338);
    }
  }
}

void sub_1D58A8C34(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  if (!*a2)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a3);
    unint64_t v4 = sub_1D58CCA20();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
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

uint64_t sub_1D58A8CD4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1D58A8D34(uint64_t a1, unint64_t *a2)
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

uint64_t sub_1D58A8D70()
{
  swift_release();
  if (*(void *)(v0 + 40)) {
    swift_release();
  }
  return MEMORY[0x1F4186498](v0, 56, 7);
}

void sub_1D58A8DC8()
{
  uint64_t v1 = (void *)v0[3];
  if (v0[2]) {
    BOOL v2 = 1;
  }
  else {
    BOOL v2 = v1 == 0;
  }
  if (v2)
  {
    swift_beginAccess();
    uint64_t Strong = swift_weakLoadStrong();
    if (Strong)
    {
      (*(void (**)(uint64_t))(*(void *)Strong + 176))(1);
      swift_release();
    }
  }
  else
  {
    unint64_t v4 = (void (*)(uint64_t))v0[5];
    swift_beginAccess();
    uint64_t v5 = swift_weakLoadStrong();
    if (v5)
    {
      id v6 = *(void (**)(void *))(*(void *)v5 + 128);
      id v7 = v1;
      v6(v1);
      swift_release();
    }
    else
    {
      id v8 = v1;
    }
    swift_beginAccess();
    uint64_t v9 = swift_weakLoadStrong();
    if (v9)
    {
      uint64_t v10 = *(void *)(v9 + OBJC_IVAR____TtC11iCloudQuota16StorageAppsModel_needsNavigatingToBundleId);
      uint64_t v11 = *(void *)(v9 + OBJC_IVAR____TtC11iCloudQuota16StorageAppsModel_needsNavigatingToBundleId + 8);
      swift_bridgeObjectRetain();
      uint64_t v9 = swift_release();
      if (v11)
      {
        swift_beginAccess();
        uint64_t v12 = swift_weakLoadStrong();
        if (v12)
        {
          (*(void (**)(uint64_t, uint64_t))(*(void *)v12 + 312))(v10, v11);
          swift_release();
        }
        uint64_t v9 = swift_bridgeObjectRelease();
      }
    }
    if (v4) {
      v4(v9);
    }
  }
}

unint64_t sub_1D58A8FA4()
{
  unint64_t result = qword_1EA723368;
  if (!qword_1EA723368)
  {
    sub_1D58CCA30();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA723368);
  }
  return result;
}

unint64_t sub_1D58A8FFC()
{
  unint64_t result = qword_1EA723378;
  if (!qword_1EA723378)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA723370);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_1EA723378);
  }
  return result;
}

void sub_1D58A9058()
{
}

void *sub_1D58A9074()
{
  return &unk_1E6A53AD0;
}

unint64_t sub_1D58A9080()
{
  return 0xD000000000000037;
}

void sub_1D58A909C(const void *a1, uint64_t a2, unint64_t a3, void (__cdecl *a4)(CFNotificationCenterRef, void *, CFNotificationName, const void *, CFDictionaryRef))
{
  uint64_t v8 = sub_1D58CC990();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = CFNotificationCenterGetDarwinNotifyCenter();
  if (v12)
  {
    id v13 = v12;
    uint64_t v21 = (__CFString *)sub_1D58CCAC0();
    CFNotificationCenterAddObserver(v13, a1, a4, v21, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

    uint64_t v14 = v21;
  }
  else
  {
    uint64_t v15 = sub_1D58BE804();
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v15, v8);
    swift_bridgeObjectRetain_n();
    BOOL v16 = sub_1D58CC980();
    os_log_type_t v17 = sub_1D58CCC70();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      uint64_t v23 = v19;
      *(_DWORD *)uint64_t v18 = 136315138;
      uint64_t v21 = (__CFString *)(v18 + 4);
      swift_bridgeObjectRetain();
      uint64_t v22 = sub_1D58A7680(a2, a3, &v23);
      sub_1D58CCD00();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1D5851000, v16, v17, "Could not get darwin notification center, failed to register object for notification %s", (uint8_t *)v18, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1D9454520](v19, -1, -1);
      MEMORY[0x1D9454520](v18, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
}

void sub_1D58A9344(const void *a1)
{
  uint64_t v2 = sub_1D58CC990();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = CFNotificationCenterGetDarwinNotifyCenter();
  if (v6)
  {
    id v13 = v6;
    CFNotificationCenterRemoveEveryObserver(v6, a1);
    id v7 = v13;
  }
  else
  {
    uint64_t v8 = sub_1D58BE804();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v8, v2);
    uint64_t v9 = sub_1D58CC980();
    os_log_type_t v10 = sub_1D58CCC70();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_1D5851000, v9, v10, "Could not get darwin notification center, failed to unregister object.", v11, 2u);
      MEMORY[0x1D9454520](v11, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
}

uint64_t sub_1D58A94E4()
{
  return v0;
}

uint64_t sub_1D58A94EC()
{
  return swift_deallocClassInstance();
}

uint64_t sub_1D58A94FC()
{
  return swift_allocObject();
}

uint64_t type metadata accessor for DarwinRegistrar()
{
  return self;
}

uint64_t sub_1D58A9530(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + OBJC_IVAR____TtC11iCloudQuota22ManageStorageAnalytics_manageStorageDrilldownLoad) = 0;
  uint64_t v3 = v2 + OBJC_IVAR____TtC11iCloudQuota22ManageStorageAnalytics_signposter;
  uint64_t v4 = sub_1D58CC920();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(v3, a1, v4);
  return v2;
}

uint64_t sub_1D58A95C4(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR____TtC11iCloudQuota22ManageStorageAnalytics_manageStorageDrilldownLoad) = 0;
  uint64_t v3 = v1 + OBJC_IVAR____TtC11iCloudQuota22ManageStorageAnalytics_signposter;
  uint64_t v4 = sub_1D58CC920();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(v3, a1, v4);
  return v1;
}

uint64_t sub_1D58A9644()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1D58CC900();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x1F4188790](v2);
  id v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v4);
  uint64_t v8 = (char *)&v18 - v7;
  sub_1D58CC8F0();
  uint64_t v9 = sub_1D58CC910();
  os_signpost_type_t v10 = sub_1D58CCCC0();
  if (sub_1D58CCCE0())
  {
    uint64_t v11 = *(void (**)(char *, char *, uint64_t))(v3 + 16);
    v11(v6, v8, v2);
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v19 = v0;
    id v13 = v12;
    *(_WORD *)uint64_t v12 = 0;
    os_signpost_id_t v14 = sub_1D58CC8E0();
    _os_signpost_emit_with_name_impl(&dword_1D5851000, v9, v10, v14, "ManageStorageDrilldown", "", v13, 2u);
    uint64_t v15 = v13;
    uint64_t v1 = v19;
    MEMORY[0x1D9454520](v15, -1, -1);

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  }
  else
  {

    uint64_t v11 = *(void (**)(char *, char *, uint64_t))(v3 + 16);
  }
  v11(v6, v8, v2);
  sub_1D58CC960();
  swift_allocObject();
  uint64_t v16 = sub_1D58CC950();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
  *(void *)(v1 + OBJC_IVAR____TtC11iCloudQuota22ManageStorageAnalytics_manageStorageDrilldownLoad) = v16;
  return swift_release();
}

uint64_t sub_1D58A9878(int a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_1D58CC930();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = &v27[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = sub_1D58CC900();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x1F4188790](v8);
  uint64_t result = MEMORY[0x1F4188790](v10);
  os_signpost_id_t v14 = &v27[-v13];
  uint64_t v15 = OBJC_IVAR____TtC11iCloudQuota22ManageStorageAnalytics_manageStorageDrilldownLoad;
  if (*(void *)(v2 + OBJC_IVAR____TtC11iCloudQuota22ManageStorageAnalytics_manageStorageDrilldownLoad))
  {
    __int16 v30 = v12;
    uint64_t v31 = v5;
    uint64_t v33 = result;
    int v32 = a1;
    swift_retain();
    uint64_t v16 = sub_1D58CC910();
    sub_1D58CC940();
    int v17 = sub_1D58CCCB0();
    if (sub_1D58CCCE0())
    {
      int v28 = v17;
      os_log_t v29 = v16;
      swift_retain();
      sub_1D58CC970();
      swift_release();
      uint64_t v18 = v31;
      if ((*(unsigned int (**)(unsigned char *, uint64_t))(v31 + 88))(v7, v4) == *MEMORY[0x1E4FBD340])
      {
        char v19 = 0;
        uint64_t v20 = "[Error] Interval already ended";
      }
      else
      {
        (*(void (**)(unsigned char *, uint64_t))(v18 + 8))(v7, v4);
        uint64_t v20 = "success: %{BOOL}d";
        char v19 = 1;
      }
      uint64_t v21 = v30;
      uint64_t v22 = v33;
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v9 + 16))(v30, v14, v33);
      uint64_t v23 = swift_slowAlloc();
      *(unsigned char *)uint64_t v23 = 0;
      *(unsigned char *)(v23 + 1) = v19;
      *(_WORD *)(v23 + 2) = 1024;
      int v34 = v32 & 1;
      sub_1D58CCD00();
      os_signpost_id_t v24 = sub_1D58CC8E0();
      os_log_t v25 = v29;
      _os_signpost_emit_with_name_impl(&dword_1D5851000, v29, (os_signpost_type_t)v28, v24, "ManageStorageDrilldown", v20, (uint8_t *)v23, 8u);
      MEMORY[0x1D9454520](v23, -1, -1);

      id v26 = *(void (**)(unsigned char *, uint64_t))(v9 + 8);
      v26(v14, v22);
      swift_release();
      v26(v21, v22);
    }
    else
    {

      (*(void (**)(unsigned char *, uint64_t))(v9 + 8))(v14, v33);
      swift_release();
    }
    *(void *)(v2 + v15) = 0;
    return swift_release();
  }
  return result;
}

uint64_t sub_1D58A9BD4()
{
  uint64_t v1 = sub_1D58CC930();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x1F4188790](v1);
  uint64_t v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1D58CC900();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x1F4188790](v5);
  uint64_t v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = MEMORY[0x1F4188790](v7);
  uint64_t v12 = (char *)&v23 - v11;
  uint64_t v13 = OBJC_IVAR____TtC11iCloudQuota22ManageStorageAnalytics_manageStorageDrilldownLoad;
  if (*(void *)(v0 + OBJC_IVAR____TtC11iCloudQuota22ManageStorageAnalytics_manageStorageDrilldownLoad))
  {
    uint64_t v25 = v0;
    uint64_t v26 = result;
    uint64_t v24 = v2;
    swift_retain();
    os_signpost_id_t v14 = sub_1D58CC910();
    sub_1D58CC940();
    os_signpost_type_t v15 = sub_1D58CCCB0();
    if (sub_1D58CCCE0())
    {
      os_log_t v23 = v14;
      swift_retain();
      sub_1D58CC970();
      swift_release();
      uint64_t v16 = v24;
      if ((*(unsigned int (**)(char *, uint64_t))(v24 + 88))(v4, v1) == *MEMORY[0x1E4FBD340])
      {
        int v17 = "[Error] Interval already ended";
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v16 + 8))(v4, v1);
        int v17 = "didExitBeforeLoaded";
      }
      uint64_t v18 = v26;
      (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v9, v12, v26);
      char v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v19 = 0;
      os_signpost_id_t v20 = sub_1D58CC8E0();
      os_log_t v21 = v23;
      _os_signpost_emit_with_name_impl(&dword_1D5851000, v23, v15, v20, "ManageStorageDrilldown", v17, v19, 2u);
      MEMORY[0x1D9454520](v19, -1, -1);

      uint64_t v22 = *(void (**)(char *, uint64_t))(v6 + 8);
      v22(v12, v18);
      swift_release();
      v22(v9, v18);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v6 + 8))(v12, v26);
      swift_release();
    }
    *(void *)(v25 + v13) = 0;
    return swift_release();
  }
  return result;
}

uint64_t sub_1D58A9EE4()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC11iCloudQuota22ManageStorageAnalytics_signposter;
  uint64_t v2 = sub_1D58CC920();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  return v0;
}

uint64_t sub_1D58A9F58()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC11iCloudQuota22ManageStorageAnalytics_signposter;
  uint64_t v2 = sub_1D58CC920();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_1D58AA008()
{
  return type metadata accessor for ManageStorageAnalytics();
}

uint64_t type metadata accessor for ManageStorageAnalytics()
{
  uint64_t result = qword_1EA723B30;
  if (!qword_1EA723B30) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1D58AA05C()
{
  uint64_t result = sub_1D58CC920();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_1D58AA0F4()
{
  return sub_1D58AF8B0();
}

uint64_t sub_1D58AA120(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_1D58AB30C(a1, a2, a3, a4, a5, a6, (uint64_t)&unk_1F2DCCF28, (uint64_t)&unk_1EA723388, (void (*)(char *, uint64_t, void *))sub_1D58AAC84);
}

uint64_t sub_1D58AA170(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[29] = v10;
  v8[30] = v11;
  v8[27] = a7;
  v8[28] = a8;
  v8[25] = a5;
  v8[26] = a6;
  v8[24] = a4;
  return MEMORY[0x1F4188298](sub_1D58AA1A4, 0, 0);
}

uint64_t sub_1D58AA1A4()
{
  *(void *)(v0 + 248) = *(void *)(*(void *)(v0 + 192) + OBJC_IVAR____TtC11iCloudQuota15ICQTaskLimiters_taskLimiters);
  return MEMORY[0x1F4188298](sub_1D58AA1D0);
}

uint64_t sub_1D58AA1D0()
{
  v0[32] = sub_1D58AE52C(v0[25], v0[26]);
  return MEMORY[0x1F4188298](sub_1D58AA240, 0, 0);
}

uint64_t sub_1D58AA240()
{
  uint64_t v1 = v0[32];
  uint64_t v3 = v0[27];
  uint64_t v2 = v0[28];
  uint64_t v4 = (void *)v0[24];
  uint64_t v5 = (void *)swift_allocObject();
  v0[33] = v5;
  v5[2] = v4;
  void v5[3] = v3;
  v5[4] = v2;
  uint64_t v12 = (uint64_t (*)(void *, uint64_t, uint64_t, void *, void *, uint64_t))(*(void *)(*(void *)v1 + 120)
                                                                                      + **(int **)(*(void *)v1 + 120));
  id v6 = v4;
  swift_retain();
  uint64_t v7 = (void *)swift_task_alloc();
  v0[34] = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_1D58AA3C4;
  uint64_t v8 = v0[25];
  uint64_t v9 = v0[26];
  uint64_t v10 = MEMORY[0x1E4FBC840] + 8;
  return v12(v0 + 12, v8, v9, &unk_1EA7233E0, v5, v10);
}

uint64_t sub_1D58AA3C4()
{
  *(void *)(*(void *)v1 + 280) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_1D58AA594;
  }
  else
  {
    swift_release();
    uint64_t v2 = sub_1D58AA4E0;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1D58AA4E0()
{
  uint64_t v1 = *(void (**)(uint64_t, void))(v0 + 232);
  sub_1D58A8CD4(v0 + 96, v0 + 160);
  v1(v0 + 160, 0);
  swift_release();
  sub_1D58AC5C4(v0 + 160, &qword_1EB786C68);
  __swift_destroy_boxed_opaque_existential_0(v0 + 96);
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_1D58AA594()
{
  id v18 = *(id *)(v0 + 280);
  int v17 = *(void (**)(uint64_t, id))(v0 + 232);
  swift_release();
  uint64_t v1 = (void *)sub_1D58CC670();
  id v2 = objc_msgSend(v1, sel_domain);
  sub_1D58CCAF0();

  id v3 = objc_msgSend(v1, sel_code);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA7233E8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1D58D34D0;
  *(void *)(inited + 32) = sub_1D58CCAF0();
  *(void *)(inited + 40) = v5;
  id v6 = objc_msgSend(v1, sel_localizedDescription);
  uint64_t v7 = sub_1D58CCAF0();
  uint64_t v9 = v8;

  *(void *)(inited + 72) = MEMORY[0x1E4FBB1A0];
  *(void *)(inited + 48) = v7;
  *(void *)(inited + 56) = v9;
  sub_1D58AAB4C(inited);
  id v10 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
  uint64_t v11 = (void *)sub_1D58CCAC0();
  swift_bridgeObjectRelease();
  uint64_t v12 = (void *)sub_1D58CCA60();
  swift_bridgeObjectRelease();
  id v13 = objc_msgSend(v10, sel_initWithDomain_code_userInfo_, v11, v3, v12);

  *(_OWORD *)(v0 + 144) = 0u;
  *(_OWORD *)(v0 + 128) = 0u;
  id v14 = v13;
  v17(v0 + 128, v13);
  swift_release();

  sub_1D58AC5C4(v0 + 128, &qword_1EB786C68);
  os_signpost_type_t v15 = *(uint64_t (**)(void))(v0 + 8);
  return v15();
}

uint64_t sub_1D58AA7C8()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = *(void *)(v0 + 40);
  uint64_t v4 = *(void *)(v0 + 80);
  uint64_t v5 = swift_task_alloc();
  long long v6 = *(_OWORD *)(v0 + 48);
  long long v7 = *(_OWORD *)(v0 + 64);
  *(void *)(v1 + 16) = v5;
  *(void *)uint64_t v5 = v1;
  *(void *)(v5 + 8) = sub_1D58ACE7C;
  *(void *)(v5 + 240) = v4;
  *(_OWORD *)(v5 + 208) = v6;
  *(_OWORD *)(v5 + 224) = v7;
  *(void *)(v5 + 192) = v2;
  *(void *)(v5 + 200) = v3;
  return MEMORY[0x1F4188298](sub_1D58AA1A4, 0, 0);
}

uint64_t sub_1D58AA88C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[3] = a3;
  v4[4] = a4;
  v4[2] = a1;
  return MEMORY[0x1F4188298](sub_1D58AA8B0, 0, 0);
}

uint64_t sub_1D58AA8B0()
{
  uint64_t v1 = swift_task_alloc();
  *(void *)(v0 + 40) = v1;
  *(_OWORD *)(v1 + 16) = *(_OWORD *)(v0 + 24);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 48) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_1D58AA9AC;
  uint64_t v3 = *(void *)(v0 + 16);
  uint64_t v4 = MEMORY[0x1E4FBC840] + 8;
  return MEMORY[0x1F4188160](v3, 0, 0, 0x286D726F66726570, 0xEE00293A6B736174, sub_1D58ACD14, v1, v4);
}

uint64_t sub_1D58AA9AC()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 56) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    swift_task_dealloc();
    uint64_t v3 = *(void *)(v2 + 8);
    __asm { BRAA            X1, X16 }
  }
  return MEMORY[0x1F4188298](sub_1D58AAAE8, 0, 0);
}

uint64_t sub_1D58AAAE8()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

unint64_t sub_1D58AAB4C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x1E4FBC868];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA7233F0);
  uint64_t v2 = sub_1D58CCDE0();
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
    sub_1D58ACBBC(v6, (uint64_t)&v15, qword_1EA7233F8);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_1D58ACB44(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_1D58ACC20(&v17, (_OWORD *)(v3[7] + 32 * result));
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

uint64_t sub_1D58AAC84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1D58CCBF0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_1D58CCBE0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_1D58AC5C4(a1, &qword_1EB786C48);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1D58CCBB0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_1D58AB010(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v7[4] = a1;
  v7[5] = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 1107296256;
  v7[2] = sub_1D58AB0CC;
  v7[3] = &block_descriptor_32;
  uint64_t v4 = _Block_copy(v7);
  uint64_t v5 = *(void (**)(uint64_t, void *))(a3 + 16);
  swift_retain();
  v5(a3, v4);
  _Block_release(v4);
  return swift_release();
}

uint64_t sub_1D58AB0CC(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void (**)(long long *, void *))(a1 + 32);
  if (a2)
  {
    *((void *)&v9 + 1) = swift_getObjectType();
    *(void *)&long long v8 = a2;
  }
  else
  {
    long long v8 = 0u;
    long long v9 = 0u;
  }
  swift_retain();
  swift_unknownObjectRetain();
  id v6 = a3;
  v5(&v8, a3);

  swift_release();
  return sub_1D58AC5C4((uint64_t)&v8, &qword_1EB786C68);
}

uint64_t sub_1D58AB168(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1D58ACBBC(a1, (uint64_t)v12, &qword_1EB786C68);
  uint64_t v5 = v13;
  if (v13)
  {
    id v6 = __swift_project_boxed_opaque_existential_0(v12, v13);
    uint64_t v7 = *(void *)(v5 - 8);
    MEMORY[0x1F4188790](v6);
    long long v9 = (char *)v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v7 + 16))(v9);
    uint64_t v10 = sub_1D58CCE80();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v5);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  }
  else
  {
    uint64_t v10 = 0;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(a3 + 16))(a3, v10, a2);
  return swift_unknownObjectRelease();
}

uint64_t sub_1D58AB2BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_1D58AB30C(a1, a2, a3, a4, a5, a6, (uint64_t)&unk_1F2DCCF50, (uint64_t)&unk_1EA723398, (void (*)(char *, uint64_t, void *))sub_1D58ABCC0);
}

uint64_t sub_1D58AB30C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void (*a9)(char *, uint64_t, void *))
{
  uint64_t v24 = a8;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB786C48);
  MEMORY[0x1F4188790](v16 - 8);
  id v18 = (char *)&v23 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_1D58CCBF0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v18, 1, 1, v19);
  os_signpost_id_t v20 = (void *)swift_allocObject();
  v20[2] = 0;
  v20[3] = 0;
  v20[4] = v9;
  v20[5] = a1;
  v20[6] = a2;
  v20[7] = a3;
  v20[8] = a4;
  v20[9] = a5;
  v20[10] = a6;
  id v21 = v9;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  a9(v18, v24, v20);
  return swift_release();
}

uint64_t sub_1D58AB458(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[7] = v10;
  v8[8] = v11;
  v8[5] = a7;
  v8[6] = a8;
  v8[3] = a5;
  v8[4] = a6;
  v8[2] = a4;
  return MEMORY[0x1F4188298](sub_1D58AB48C, 0, 0);
}

uint64_t sub_1D58AB48C()
{
  *(void *)(v0 + 72) = *(void *)(*(void *)(v0 + 16) + OBJC_IVAR____TtC11iCloudQuota15ICQTaskLimiters_taskLimiters);
  return MEMORY[0x1F4188298](sub_1D58AB4B8);
}

uint64_t sub_1D58AB4B8()
{
  v0[10] = sub_1D58AE52C(v0[3], v0[4]);
  return MEMORY[0x1F4188298](sub_1D58AB528, 0, 0);
}

uint64_t sub_1D58AB528()
{
  uint64_t v1 = v0[10];
  uint64_t v3 = v0[5];
  uint64_t v2 = v0[6];
  uint64_t v4 = swift_allocObject();
  v0[11] = v4;
  *(void *)(v4 + 16) = v3;
  *(void *)(v4 + 24) = v2;
  uint64_t v7 = (uint64_t (*)(void))(*(void *)(*(void *)v1 + 120) + **(int **)(*(void *)v1 + 120));
  swift_retain();
  uint64_t v5 = (void *)swift_task_alloc();
  v0[12] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_1D58AB68C;
  return v7();
}

uint64_t sub_1D58AB68C()
{
  *(void *)(*(void *)v1 + 104) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_1D58AB81C;
  }
  else
  {
    swift_release();
    uint64_t v2 = sub_1D58AB7A8;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1D58AB7A8()
{
  (*(void (**)(void))(v0 + 56))();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1D58AB81C()
{
  swift_release();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1D58AB88C()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = *(void *)(v0 + 40);
  uint64_t v4 = *(void *)(v0 + 80);
  uint64_t v5 = swift_task_alloc();
  long long v6 = *(_OWORD *)(v0 + 48);
  long long v7 = *(_OWORD *)(v0 + 64);
  *(void *)(v1 + 16) = v5;
  *(void *)uint64_t v5 = v1;
  *(void *)(v5 + 8) = sub_1D58ACE7C;
  *(void *)(v5 + 64) = v4;
  *(_OWORD *)(v5 + 32) = v6;
  *(_OWORD *)(v5 + 48) = v7;
  *(void *)(v5 + 16) = v2;
  *(void *)(v5 + 24) = v3;
  return MEMORY[0x1F4188298](sub_1D58AB48C, 0, 0);
}

uint64_t sub_1D58AB950(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  return MEMORY[0x1F4188298](sub_1D58AB974, 0, 0);
}

uint64_t sub_1D58AB974()
{
  uint64_t v1 = swift_task_alloc();
  *(void *)(v0 + 40) = v1;
  *(_OWORD *)(v1 + 16) = *(_OWORD *)(v0 + 24);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 48) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_1D58ABA68;
  uint64_t v3 = *(void *)(v0 + 16);
  uint64_t v4 = MEMORY[0x1E4FBC848] + 8;
  return MEMORY[0x1F41880D8](v3, 0, 0, 0xD000000000000033, 0x80000001D58D9D20, sub_1D58AC70C, v1, v4);
}

uint64_t sub_1D58ABA68()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1D58ABB7C(uint64_t a1, void (*a2)(uint64_t, uint64_t), uint64_t a3, uint64_t *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(a4);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x1F4188790](v9);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v9);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v13 + v12, (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v9);
  a2(a6, v13);
  return swift_release();
}

uint64_t sub_1D58ABCC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_1D58CCBF0();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_1D58CCBE0();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(void *)(a3 + 16)) {
      return swift_task_create();
    }
    goto LABEL_3;
  }
  sub_1D58AC5C4(a1, &qword_1EB786C48);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1D58CCBB0();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_1D58AC028(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v7[4] = a1;
  v7[5] = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 1107296256;
  v7[2] = sub_1D58A6CE0;
  v7[3] = &block_descriptor_2;
  uint64_t v4 = _Block_copy(v7);
  uint64_t v5 = *(void (**)(uint64_t, void *))(a3 + 16);
  swift_retain();
  v5(a3, v4);
  _Block_release(v4);
  return swift_release();
}

id ICQTaskLimiters.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id ICQTaskLimiters.init()()
{
  uint64_t v1 = OBJC_IVAR____TtC11iCloudQuota15ICQTaskLimiters_taskLimiters;
  type metadata accessor for TaskLimiters();
  uint64_t v2 = v0;
  *(void *)&v0[v1] = sub_1D58AF8B0();

  v4.receiver = v2;
  v4.super_class = (Class)type metadata accessor for ICQTaskLimiters();
  return objc_msgSendSuper2(&v4, sel_init);
}

uint64_t type metadata accessor for ICQTaskLimiters()
{
  return self;
}

id ICQTaskLimiters.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ICQTaskLimiters();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for ICQTaskLimiters(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for ICQTaskLimiters);
}

uint64_t dispatch thunk of ICQTaskLimiters.perform(identifier:task:completion:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x58))();
}

uint64_t dispatch thunk of ICQTaskLimiters.performClosureNoParams(identifier:task:completion:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x68))();
}

uint64_t sub_1D58AC2E0(uint64_t a1, uint64_t a2)
{
  return sub_1D58AC028(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_1D58AC2E8()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1D58AC320()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_1D58AC334()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = *(void *)(v0 + 40);
  uint64_t v4 = *(void *)(v0 + 80);
  uint64_t v5 = swift_task_alloc();
  long long v6 = *(_OWORD *)(v0 + 48);
  long long v7 = *(_OWORD *)(v0 + 64);
  *(void *)(v1 + 16) = v5;
  *(void *)uint64_t v5 = v1;
  *(void *)(v5 + 8) = sub_1D58AC3F8;
  *(void *)(v5 + 64) = v4;
  *(_OWORD *)(v5 + 32) = v6;
  *(_OWORD *)(v5 + 48) = v7;
  *(void *)(v5 + 16) = v2;
  *(void *)(v5 + 24) = v3;
  return MEMORY[0x1F4188298](sub_1D58AB48C, 0, 0);
}

uint64_t sub_1D58AC3F8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1D58AC4EC(uint64_t a1, uint64_t a2)
{
  return sub_1D58AB010(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_1D58AC4F4(uint64_t a1, uint64_t a2)
{
  return sub_1D58AB168(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_1D58AC500()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = *(void *)(v0 + 40);
  uint64_t v4 = *(void *)(v0 + 80);
  uint64_t v5 = swift_task_alloc();
  long long v6 = *(_OWORD *)(v0 + 48);
  long long v7 = *(_OWORD *)(v0 + 64);
  *(void *)(v1 + 16) = v5;
  *(void *)uint64_t v5 = v1;
  *(void *)(v5 + 8) = sub_1D58AC3F8;
  *(void *)(v5 + 240) = v4;
  *(_OWORD *)(v5 + 208) = v6;
  *(_OWORD *)(v5 + 224) = v7;
  *(void *)(v5 + 192) = v2;
  *(void *)(v5 + 200) = v3;
  return MEMORY[0x1F4188298](sub_1D58AA1A4, 0, 0);
}

uint64_t sub_1D58AC5C4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1D58AC620()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1D58AC658(uint64_t a1)
{
  uint64_t v4 = swift_task_alloc();
  long long v5 = *(_OWORD *)(v1 + 16);
  *(void *)(v2 + 16) = v4;
  *(void *)uint64_t v4 = v2;
  *(void *)(v4 + 8) = sub_1D58ACE7C;
  *(_OWORD *)(v4 + 24) = v5;
  *(void *)(v4 + 16) = a1;
  return MEMORY[0x1F4188298](sub_1D58AB974, 0, 0);
}

uint64_t sub_1D58AC70C(uint64_t a1)
{
  return sub_1D58ABB7C(a1, *(void (**)(uint64_t, uint64_t))(v1 + 16), *(void *)(v1 + 24), &qword_1EB786C40, (uint64_t)&unk_1F2DCD0E0, (uint64_t)sub_1D58AC75C);
}

uint64_t sub_1D58AC750()
{
  return objectdestroy_41Tm(&qword_1EB786C40);
}

uint64_t sub_1D58AC75C()
{
  return sub_1D58CCBD0();
}

uint64_t sub_1D58AC7C4(uint64_t a1, int *a2)
{
  long long v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_1D58AC8A0;
  return v6(a1);
}

uint64_t sub_1D58AC8A0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1D58AC998(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  long long v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *long long v5 = v2;
  v5[1] = sub_1D58ACE7C;
  long long v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1EA7233C8 + dword_1EA7233C8);
  return v6(a1, v4);
}

uint64_t sub_1D58ACA50()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1D58ACA90(uint64_t a1)
{
  uint64_t v4 = swift_task_alloc();
  long long v5 = *(_OWORD *)(v1 + 24);
  *(void *)(v2 + 16) = v4;
  *(void *)uint64_t v4 = v2;
  *(void *)(v4 + 8) = sub_1D58ACE7C;
  *(_OWORD *)(v4 + 24) = v5;
  *(void *)(v4 + 16) = a1;
  return MEMORY[0x1F4188298](sub_1D58AA8B0, 0, 0);
}

unint64_t sub_1D58ACB44(uint64_t a1, uint64_t a2)
{
  sub_1D58CCF00();
  sub_1D58CCB00();
  uint64_t v4 = sub_1D58CCF20();
  return sub_1D58ACC30(a1, a2, v4);
}

uint64_t sub_1D58ACBBC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

_OWORD *sub_1D58ACC20(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_1D58ACC30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_1D58CCE90() & 1) == 0)
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
      while (!v14 && (sub_1D58CCE90() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_1D58ACD14(uint64_t a1)
{
  return sub_1D58ABB7C(a1, *(void (**)(uint64_t, uint64_t))(v1 + 16), *(void *)(v1 + 24), &qword_1EB786C38, (uint64_t)&unk_1F2DCD158, (uint64_t)sub_1D58ACD64);
}

uint64_t sub_1D58ACD58()
{
  return objectdestroy_41Tm(&qword_1EB786C38);
}

uint64_t sub_1D58ACD64(uint64_t a1, void *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB786C38);
  if (a2)
  {
    *(void *)&v8[0] = a2;
    id v4 = a2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB786C38);
    return sub_1D58CCBC0();
  }
  else
  {
    sub_1D58ACBBC(a1, (uint64_t)&v6, &qword_1EB786C68);
    if (v7)
    {
      sub_1D58ACC20(&v6, v8);
      sub_1D58A8CD4((uint64_t)v8, (uint64_t)&v6);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EB786C38);
      sub_1D58CCBD0();
      return __swift_destroy_boxed_opaque_existential_0((uint64_t)v8);
    }
    else
    {
      return sub_1D58AC5C4((uint64_t)&v6, &qword_1EB786C68);
    }
  }
}

void _swift_dead_method_stub()
{
}

uint64_t sub_1D58ACE90()
{
  return MEMORY[0x1E4FBC868];
}

uint64_t sub_1D58ACE9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v7[33] = a6;
  v7[34] = v6;
  v7[31] = a4;
  v7[32] = a5;
  v7[29] = a2;
  v7[30] = a3;
  v7[28] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB786C48);
  v7[35] = swift_task_alloc();
  uint64_t v8 = sub_1D58CC990();
  v7[36] = v8;
  v7[37] = *(void *)(v8 - 8);
  v7[38] = swift_task_alloc();
  v7[39] = swift_task_alloc();
  v7[40] = swift_task_alloc();
  v7[41] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1D58ACFC0, v6, 0);
}

uint64_t sub_1D58ACFC0()
{
  uint64_t v91 = v0;
  uint64_t v1 = (_OWORD *)(v0 + 56);
  uint64_t v2 = *(void *)(v0 + 272) + 112;
  swift_beginAccess();
  uint64_t v3 = *(void *)v2;
  if (!*(void *)(*(void *)v2 + 16))
  {
    *(void *)(v0 + 88) = 0;
    *uint64_t v1 = 0u;
    *(_OWORD *)(v0 + 72) = 0u;
LABEL_10:
    sub_1D58AC5C4(v0 + 56, &qword_1EB786C30);
LABEL_12:
    uint64_t v23 = *(void *)(v0 + 320);
    long long v80 = (void (**)(uint64_t))(*(void *)(v0 + 296) + 16);
    uint64_t v81 = sub_1D58BE804();
    v88 = *v80;
    (*v80)(v23);
    swift_bridgeObjectRetain_n();
    uint64_t v24 = sub_1D58CC980();
    os_log_type_t v25 = sub_1D58CCC60();
    BOOL v26 = os_log_type_enabled(v24, v25);
    uint64_t v27 = *(void *)(v0 + 320);
    uint64_t v28 = *(void *)(v0 + 296);
    unint64_t v29 = *(void *)(v0 + 240);
    if (v26)
    {
      uint64_t v78 = *(void *)(v0 + 232);
      uint64_t v86 = *(void *)(v0 + 288);
      __int16 v30 = (uint8_t *)swift_slowAlloc();
      uint64_t v31 = swift_slowAlloc();
      v90[0] = v31;
      *(_DWORD *)__int16 v30 = 136315138;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 192) = sub_1D58A7680(v78, v29, v90);
      sub_1D58CCD00();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1D5851000, v24, v25, "TaskLimiter: creating new task for identifier %s", v30, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1D9454520](v31, -1, -1);
      MEMORY[0x1D9454520](v30, -1, -1);

      int v32 = *(void (**)(uint64_t, uint64_t))(v28 + 8);
      uint64_t v33 = v27;
      uint64_t v34 = v86;
    }
    else
    {
      uint64_t v35 = *(void *)(v0 + 288);
      swift_bridgeObjectRelease_n();

      int v32 = *(void (**)(uint64_t, uint64_t))(v28 + 8);
      uint64_t v33 = v27;
      uint64_t v34 = v35;
    }
    long long v84 = v32;
    v32(v33, v34);
    uint64_t v36 = *(void *)(v0 + 312);
    uint64_t v38 = *(void *)(v0 + 280);
    uint64_t v37 = *(void *)(v0 + 288);
    uint64_t v40 = *(void *)(v0 + 256);
    uint64_t v39 = *(void *)(v0 + 264);
    uint64_t v41 = *(void *)(v0 + 248);
    uint64_t v42 = sub_1D58CCBF0();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v42 - 8) + 56))(v38, 1, 1, v42);
    int v43 = (void *)swift_allocObject();
    v43[2] = 0;
    v43[3] = 0;
    v43[4] = v39;
    v43[5] = v41;
    v43[6] = v40;
    swift_retain();
    uint64_t v87 = sub_1D58AE228(v38, (uint64_t)&unk_1EA723418, (uint64_t)v43);
    *(void *)(v0 + 360) = v87;
    uint64_t v44 = v81;
    ((void (*)(uint64_t, uint64_t, uint64_t))v88)(v36, v81, v37);
    swift_bridgeObjectRetain_n();
    id v45 = sub_1D58CC980();
    os_log_type_t v46 = sub_1D58CCC60();
    BOOL v47 = os_log_type_enabled(v45, v46);
    uint64_t v48 = *(void *)(v0 + 312);
    uint64_t v49 = *(void *)(v0 + 288);
    unint64_t v50 = *(void *)(v0 + 240);
    if (v47)
    {
      uint64_t v77 = *(void *)(v0 + 312);
      uint64_t v51 = *(void *)(v0 + 232);
      uint64_t v52 = (uint8_t *)swift_slowAlloc();
      uint64_t v53 = swift_slowAlloc();
      v90[0] = v53;
      *(_DWORD *)uint64_t v52 = 136315138;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 184) = sub_1D58A7680(v51, v50, v90);
      uint64_t v44 = v81;
      sub_1D58CCD00();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1D5851000, v45, v46, "TaskLimiter: storing task for identifier %s", v52, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1D9454520](v53, -1, -1);
      MEMORY[0x1D9454520](v52, -1, -1);

      uint64_t v54 = v77;
    }
    else
    {
      swift_bridgeObjectRelease_n();

      uint64_t v54 = v48;
    }
    v84(v54, v49);
    uint64_t v55 = *(void *)(v0 + 304);
    uint64_t v56 = *(void *)(v0 + 288);
    uint64_t v58 = *(void *)(v0 + 232);
    uint64_t v57 = *(void *)(v0 + 240);
    uint64_t v82 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EB786C60);
    v90[3] = sub_1D58CCC10();
    v90[4] = (uint64_t)&off_1F2DCD198;
    v90[0] = v87;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    swift_retain();
    sub_1D58AE3AC((uint64_t)v90, v58, v57);
    swift_endAccess();
    ((void (*)(uint64_t, uint64_t, uint64_t))v88)(v55, v44, v56);
    swift_bridgeObjectRetain_n();
    uint64_t v59 = sub_1D58CC980();
    os_log_type_t v60 = sub_1D58CCC60();
    BOOL v61 = os_log_type_enabled(v59, v60);
    uint64_t v62 = *(void *)(v0 + 304);
    uint64_t v63 = *(void *)(v0 + 288);
    unint64_t v64 = *(void *)(v0 + 240);
    if (v61)
    {
      uint64_t v65 = *(void *)(v0 + 232);
      uint64_t v89 = *(void *)(v0 + 304);
      id v66 = (uint8_t *)swift_slowAlloc();
      uint64_t v67 = swift_slowAlloc();
      v90[0] = v67;
      *(_DWORD *)id v66 = 136315138;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 200) = sub_1D58A7680(v65, v64, v90);
      sub_1D58CCD00();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1D5851000, v59, v60, "TaskLimiter: performing task operation for identifier %s", v66, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1D9454520](v67, -1, -1);
      MEMORY[0x1D9454520](v66, -1, -1);

      uint64_t v68 = v89;
    }
    else
    {
      swift_bridgeObjectRelease_n();

      uint64_t v68 = v62;
    }
    v84(v68, v63);
    v69 = (void *)swift_task_alloc();
    *(void *)(v0 + 368) = v69;
    void *v69 = v0;
    v69[1] = sub_1D58ADB7C;
    uint64_t v70 = *(void *)(v0 + 264);
    uint64_t v71 = *(void *)(v0 + 224);
    uint64_t v72 = MEMORY[0x1E4FBC0F0];
    uint64_t v73 = v87;
    uint64_t v74 = v82;
    goto LABEL_22;
  }
  uint64_t v5 = *(void *)(v0 + 232);
  uint64_t v4 = *(void *)(v0 + 240);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_1D58ACB44(v5, v4);
  if (v7)
  {
    sub_1D58AE7E4(*(void *)(v3 + 56) + 40 * v6, v0 + 56);
  }
  else
  {
    *(void *)(v0 + 88) = 0;
    *uint64_t v1 = 0u;
    *(_OWORD *)(v0 + 72) = 0u;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*(void *)(v0 + 80)) {
    goto LABEL_10;
  }
  sub_1D58AE7CC((long long *)(v0 + 56), v0 + 16);
  sub_1D58AE7E4(v0 + 16, v0 + 96);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB786C98);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EB786C60);
  sub_1D58CCC10();
  if ((swift_dynamicCast() & 1) == 0)
  {
    __swift_destroy_boxed_opaque_existential_0(v0 + 16);
    goto LABEL_12;
  }
  uint64_t v9 = *(void *)(v0 + 328);
  uint64_t v11 = *(void *)(v0 + 288);
  uint64_t v10 = *(void *)(v0 + 296);
  uint64_t v12 = *(void *)(v0 + 208);
  *(void *)(v0 + 336) = v12;
  uint64_t v13 = sub_1D58BE804();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v9, v13, v11);
  swift_bridgeObjectRetain_n();
  BOOL v14 = sub_1D58CC980();
  os_log_type_t v15 = sub_1D58CCC60();
  BOOL v16 = os_log_type_enabled(v14, v15);
  uint64_t v17 = *(void *)(v0 + 328);
  uint64_t v19 = *(void *)(v0 + 288);
  uint64_t v18 = *(void *)(v0 + 296);
  unint64_t v20 = *(void *)(v0 + 240);
  if (v16)
  {
    uint64_t v79 = *(void *)(v0 + 232);
    uint64_t v85 = *(void *)(v0 + 288);
    id v21 = (uint8_t *)swift_slowAlloc();
    uint64_t v83 = v17;
    uint64_t v22 = swift_slowAlloc();
    v90[0] = v22;
    *(_DWORD *)id v21 = 136315138;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 216) = sub_1D58A7680(v79, v20, v90);
    sub_1D58CCD00();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1D5851000, v14, v15, "TaskLimiter: reusing existing task for identifier %s", v21, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1D9454520](v22, -1, -1);
    MEMORY[0x1D9454520](v21, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v83, v85);
  }
  else
  {
    swift_bridgeObjectRelease_n();

    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v17, v19);
  }
  long long v75 = (void *)swift_task_alloc();
  *(void *)(v0 + 344) = v75;
  *long long v75 = v0;
  v75[1] = sub_1D58AD9A8;
  uint64_t v70 = *(void *)(v0 + 264);
  uint64_t v71 = *(void *)(v0 + 224);
  uint64_t v72 = MEMORY[0x1E4FBC0F0];
  uint64_t v73 = v12;
  uint64_t v74 = v8;
LABEL_22:
  return MEMORY[0x1F4187D90](v71, v73, v70, v74, v72);
}

uint64_t sub_1D58AD9A8()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 352) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 272);
  if (v0) {
    uint64_t v4 = sub_1D58ADD5C;
  }
  else {
    uint64_t v4 = sub_1D58ADAD4;
  }
  return MEMORY[0x1F4188298](v4, v3, 0);
}

uint64_t sub_1D58ADAD4()
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_0(v0 + 16);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1D58ADB7C()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 376) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 272);
  if (v0) {
    uint64_t v4 = sub_1D58ADE0C;
  }
  else {
    uint64_t v4 = sub_1D58ADCA8;
  }
  return MEMORY[0x1F4188298](v4, v3, 0);
}

uint64_t sub_1D58ADCA8()
{
  uint64_t v1 = v0[34];
  uint64_t v3 = v0[29];
  unint64_t v2 = v0[30];
  swift_release();
  sub_1D58ADEC8(v3, v2, v1);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_1D58ADD5C()
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_0(v0 + 16);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1D58ADE0C()
{
  uint64_t v1 = v0[34];
  uint64_t v3 = v0[29];
  unint64_t v2 = v0[30];
  swift_release();
  sub_1D58ADEC8(v3, v2, v1);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_1D58ADEC8(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1D58CC990();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1D58BE804();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v10, v6);
  swift_bridgeObjectRetain_n();
  uint64_t v11 = sub_1D58CC980();
  os_log_type_t v12 = sub_1D58CCC60();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v19 = a3;
    uint64_t v13 = swift_slowAlloc();
    uint64_t v18 = v6;
    BOOL v14 = (uint8_t *)v13;
    uint64_t v15 = swift_slowAlloc();
    *(void *)&v21[0] = v15;
    *(_DWORD *)BOOL v14 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v20 = sub_1D58A7680(a1, a2, (uint64_t *)v21);
    sub_1D58CCD00();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1D5851000, v11, v12, "TaskLimiter: cleaning up task for identifier %s", v14, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1D9454520](v15, -1, -1);
    MEMORY[0x1D9454520](v14, -1, -1);

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v18);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  uint64_t v22 = 0;
  memset(v21, 0, sizeof(v21));
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_1D58AE3AC((uint64_t)v21, a1, a2);
  return swift_endAccess();
}

uint64_t sub_1D58AE14C(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v8 = (uint64_t (*)(uint64_t))((char *)a4 + *a4);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v6;
  *uint64_t v6 = v4;
  v6[1] = sub_1D58AC3F8;
  return v8(a1);
}

uint64_t sub_1D58AE228(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_1D58CCBF0();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_1D58CCBE0();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(void *)(a3 + 16)) {
      return swift_task_create();
    }
    goto LABEL_3;
  }
  sub_1D58AC5C4(a1, &qword_1EB786C48);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1D58CCBB0();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_1D58AE3AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a1 + 24))
  {
    sub_1D58AE7CC((long long *)a1, (uint64_t)v9);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v8 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_1D58AF1A4(v9, a2, a3, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v8;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_1D58AC5C4(a1, &qword_1EB786C30);
    sub_1D58AE86C(a2, a3, (uint64_t)v9);
    swift_bridgeObjectRelease();
    return sub_1D58AC5C4((uint64_t)v9, &qword_1EB786C30);
  }
}

uint64_t sub_1D58AE484()
{
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t sub_1D58AE4B0()
{
  uint64_t v0 = swift_allocObject();
  swift_defaultActor_initialize();
  *(void *)(v0 + 112) = MEMORY[0x1E4FBC868];
  return v0;
}

uint64_t sub_1D58AE4F4()
{
  swift_defaultActor_initialize();
  *(void *)(v0 + 112) = MEMORY[0x1E4FBC868];
  return v0;
}

uint64_t sub_1D58AE520()
{
  return v0;
}

uint64_t sub_1D58AE52C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (uint64_t *)(v2 + 112);
  swift_beginAccess();
  uint64_t v6 = *(void *)(v2 + 112);
  if (!*(void *)(v6 + 16)) {
    goto LABEL_5;
  }
  swift_bridgeObjectRetain();
  unint64_t v7 = sub_1D58ACB44(a1, a2);
  if ((v8 & 1) == 0)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    swift_endAccess();
    type metadata accessor for TaskLimiter();
    uint64_t v9 = swift_allocObject();
    swift_defaultActor_initialize();
    *(void *)(v9 + 112) = MEMORY[0x1E4FBC868];
    swift_beginAccess();
    swift_bridgeObjectRetain();
    swift_retain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v12 = *v5;
    *uint64_t v5 = 0x8000000000000000;
    sub_1D58AF2FC(v9, a1, a2, isUniquelyReferenced_nonNull_native);
    *uint64_t v5 = v12;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
    return v9;
  }
  uint64_t v9 = *(void *)(*(void *)(v6 + 56) + 8 * v7);
  swift_endAccess();
  swift_retain();
  swift_bridgeObjectRelease();
  return v9;
}

uint64_t sub_1D58AE678()
{
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return MEMORY[0x1F4188210](v0);
}

uint64_t sub_1D58AE6B0()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x1F4186498](v0, 56, 7);
}

uint64_t sub_1D58AE6F0(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[5];
  unint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *unint64_t v7 = v2;
  v7[1] = sub_1D58AC3F8;
  char v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_1EA723410 + dword_1EA723410);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_1D58AE7CC(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_1D58AE7E4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t type metadata accessor for TaskLimiter()
{
  return self;
}

double sub_1D58AE86C@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_1D58ACB44(a1, a2);
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
      sub_1D58AF500();
      uint64_t v11 = v13;
    }
    swift_bridgeObjectRelease();
    sub_1D58AE7CC((long long *)(*(void *)(v11 + 56) + 40 * v8), a3);
    sub_1D58AEFB8(v8, v11);
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

uint64_t sub_1D58AE978(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB786C58);
  char v37 = a2;
  uint64_t v6 = sub_1D58CCDD0();
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
    uint64_t v19 = (void *)(v5 + 64);
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
    os_log_type_t v25 = (long long *)(*(void *)(v5 + 56) + 40 * v17);
    if (v37)
    {
      sub_1D58AE7CC(v25, (uint64_t)v38);
    }
    else
    {
      sub_1D58AE7E4((uint64_t)v25, (uint64_t)v38);
      swift_bridgeObjectRetain();
    }
    sub_1D58CCF00();
    sub_1D58CCB00();
    uint64_t result = sub_1D58CCF20();
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
    uint64_t v15 = (void *)(*(void *)(v7 + 48) + 16 * v14);
    *uint64_t v15 = v24;
    v15[1] = v23;
    uint64_t result = sub_1D58AE7CC(v38, *(void *)(v7 + 56) + 40 * v14);
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v34;
  uint64_t v19 = (void *)(v5 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v19, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v19 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_1D58AECA0(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB786C50);
  char v36 = a2;
  uint64_t v6 = sub_1D58CCDD0();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v35 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v34 = (unint64_t)(v8 + 63) >> 6;
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
    if (v21 >= v34) {
      break;
    }
    uint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v34) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v35 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v34) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v35 + 8 * v13);
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
    char v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_retain();
    }
    sub_1D58CCF00();
    sub_1D58CCB00();
    uint64_t result = sub_1D58CCF20();
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
    void *v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v22 = (void *)(v5 + 64);
  if ((v36 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

unint64_t sub_1D58AEFB8(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_1D58CCD40();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_1D58CCF00();
        swift_bridgeObjectRetain();
        sub_1D58CCB00();
        uint64_t v11 = sub_1D58CCF20();
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
            *uint64_t v14 = *v15;
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
  *unint64_t v19 = v21 & v20;
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

uint64_t sub_1D58AF1A4(long long *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  long long v10 = (void *)*v4;
  unint64_t v12 = sub_1D58ACB44(a2, a3);
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
      sub_1D58AF500();
      goto LABEL_7;
    }
    sub_1D58AE978(v15, a4 & 1);
    unint64_t v21 = sub_1D58ACB44(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      unint64_t v12 = v21;
      int64_t v18 = *v5;
      if (v16) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = sub_1D58CCEB0();
    __break(1u);
    return result;
  }
LABEL_7:
  int64_t v18 = *v5;
  if (v16)
  {
LABEL_8:
    uint64_t v19 = v18[7] + 40 * v12;
    __swift_destroy_boxed_opaque_existential_0(v19);
    return sub_1D58AE7CC(a1, v19);
  }
LABEL_13:
  sub_1D58AF490(v12, a2, a3, a1, v18);
  return swift_bridgeObjectRetain();
}

uint64_t sub_1D58AF2FC(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_1D58ACB44(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_1D58AF6EC();
LABEL_7:
    int64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];
      uint64_t result = swift_release();
      *(void *)(v19 + 8 * v12) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_1D58AECA0(v15, a4 & 1);
  unint64_t v21 = sub_1D58ACB44(a2, a3);
  if ((v16 & 1) != (v22 & 1))
  {
LABEL_17:
    uint64_t result = sub_1D58CCEB0();
    __break(1u);
    return result;
  }
  unint64_t v12 = v21;
  int64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  BOOL v23 = (uint64_t *)(v18[6] + 16 * v12);
  *BOOL v23 = a2;
  v23[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v24 = v18[2];
  BOOL v25 = __OFADD__(v24, 1);
  uint64_t v26 = v24 + 1;
  if (v25)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v26;
  return swift_bridgeObjectRetain();
}

uint64_t type metadata accessor for TaskLimiters()
{
  return self;
}

uint64_t sub_1D58AF490(unint64_t a1, uint64_t a2, uint64_t a3, long long *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  unint64_t v6 = (void *)(a5[6] + 16 * a1);
  *unint64_t v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_1D58AE7CC(a4, a5[7] + 40 * a1);
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

void *sub_1D58AF500()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB786C58);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1D58CCDC0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_28:
    *uint64_t v1 = v4;
    return result;
  }
  BOOL v25 = v1;
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    sub_1D58AE7E4(*(void *)(v2 + 56) + 40 * v15, (uint64_t)v26);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v21 = v19;
    v21[1] = v18;
    sub_1D58AE7CC(v26, *(void *)(v4 + 56) + v20);
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
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

void *sub_1D58AF6EC()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB786C50);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1D58CCDC0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
      goto LABEL_28;
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
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_retain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
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
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_1D58AF8B4()
{
  uint64_t v0 = sub_1D58CCE10();
  swift_bridgeObjectRelease();
  if (v0 == 1) {
    unsigned int v1 = 1;
  }
  else {
    unsigned int v1 = 2;
  }
  if (v0) {
    return v1;
  }
  else {
    return 0;
  }
}

uint64_t sub_1D58AF908(char a1)
{
  if (a1) {
    return 0x7373696D736964;
  }
  else {
    return 0x79616C70736964;
  }
}

uint64_t sub_1D58AF938(char *a1, char *a2)
{
  return sub_1D58AF944(*a1, *a2);
}

uint64_t sub_1D58AF944(char a1, char a2)
{
  if (a1) {
    uint64_t v2 = 0x7373696D736964;
  }
  else {
    uint64_t v2 = 0x79616C70736964;
  }
  if (a2) {
    uint64_t v3 = 0x7373696D736964;
  }
  else {
    uint64_t v3 = 0x79616C70736964;
  }
  if (v2 == v3) {
    char v4 = 1;
  }
  else {
    char v4 = sub_1D58CCE90();
  }
  swift_bridgeObjectRelease_n();
  return v4 & 1;
}

uint64_t sub_1D58AF9C4()
{
  return sub_1D58AF9CC();
}

uint64_t sub_1D58AF9CC()
{
  return sub_1D58CCF20();
}

uint64_t sub_1D58AFA44()
{
  return sub_1D58AFA4C();
}

uint64_t sub_1D58AFA4C()
{
  sub_1D58CCB00();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1D58AFAA4()
{
  return sub_1D58AFAAC();
}

uint64_t sub_1D58AFAAC()
{
  return sub_1D58CCF20();
}

uint64_t sub_1D58AFB20@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_1D58CCE10();
  uint64_t result = swift_bridgeObjectRelease();
  if (v2 == 1) {
    char v4 = 1;
  }
  else {
    char v4 = 2;
  }
  if (!v2) {
    char v4 = 0;
  }
  *a1 = v4;
  return result;
}

uint64_t sub_1D58AFB80@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1D58AF908(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_1D58AFBAC()
{
  return sub_1D58CCB30();
}

uint64_t sub_1D58AFC0C()
{
  return sub_1D58CCB20();
}

unint64_t sub_1D58AFC5C()
{
  return 0xD000000000000015;
}

unint64_t sub_1D58AFC78()
{
  return 0xD000000000000015;
}

unint64_t sub_1D58AFC94()
{
  return 0xD00000000000001CLL;
}

unint64_t sub_1D58AFCB0()
{
  return 0xD000000000000011;
}

unint64_t sub_1D58AFCCC()
{
  return 0xD000000000000017;
}

id sub_1D58AFCE8()
{
  uint64_t v0 = (objc_class *)type metadata accessor for BubbleBannerTracker();
  unsigned int v1 = (char *)objc_allocWithZone(v0);
  uint64_t v2 = &v1[OBJC_IVAR___ICQBubbleBannerTracker_kBubbleBannerDismissedKey];
  *(void *)uint64_t v2 = 0xD000000000000015;
  *((void *)v2 + 1) = 0x80000001D58D9DF0;
  uint64_t v3 = &v1[OBJC_IVAR___ICQBubbleBannerTracker_kBubbleBannerDisplayedKey];
  *(void *)uint64_t v3 = 0xD000000000000015;
  *((void *)v3 + 1) = 0x80000001D58D9E10;
  uint64_t v4 = &v1[OBJC_IVAR___ICQBubbleBannerTracker_kBubbleBannerCAEventKey];
  *(void *)uint64_t v4 = 0xD00000000000001CLL;
  *((void *)v4 + 1) = 0x80000001D58D9E30;
  uint64_t v5 = &v1[OBJC_IVAR___ICQBubbleBannerTracker_kFullReason];
  *(void *)uint64_t v5 = 0xD000000000000011;
  *((void *)v5 + 1) = 0x80000001D58D9E50;
  uint64_t v6 = &v1[OBJC_IVAR___ICQBubbleBannerTracker_kAlmostFullReason];
  *(void *)uint64_t v6 = 0xD000000000000017;
  *((void *)v6 + 1) = 0x80000001D58D9E70;
  unint64_t v7 = self;
  uint64_t v8 = v1;
  id v9 = objc_msgSend(v7, sel_standardUserDefaults);
  *(void *)&v8[OBJC_IVAR___ICQBubbleBannerTracker_userDefaults] = v9;

  v11.receiver = v8;
  v11.super_class = v0;
  id result = objc_msgSendSuper2(&v11, sel_init);
  qword_1EB786E38 = (uint64_t)result;
  return result;
}

id sub_1D58AFE34(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  id v4 = sub_1D58B3534(a1);

  return v4;
}

uint64_t *sub_1D58AFE74()
{
  if (qword_1EB786E10 != -1) {
    swift_once();
  }
  return &qword_1EB786E38;
}

id static BubbleBannerTracker.shared.getter()
{
  if (qword_1EB786E10 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_1EB786E38;
  return v0;
}

id sub_1D58AFF78(void *a1)
{
  id v2 = sub_1D58B3534(a1);

  return v2;
}

id sub_1D58AFFA8(void *a1, uint64_t a2)
{
  return sub_1D58B3680(a1, a2, 0);
}

id sub_1D58AFFB8(void *a1, uint64_t a2)
{
  return sub_1D58B3680(a1, a2, 1);
}

uint64_t sub_1D58AFFC8(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t v9 = sub_1D58CC790();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  unint64_t v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D58CC760();
  id v13 = a3;
  id v14 = a1;
  sub_1D58B3680(v13, (uint64_t)v12, a6);

  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

void sub_1D58B00D4(char a1, uint64_t a2, uint64_t a3, double a4, double a5)
{
  BOOL v10 = *(void *)(v5 + OBJC_IVAR___ICQBubbleBannerTracker_kFullReason) == a2
     && *(void *)(v5 + OBJC_IVAR___ICQBubbleBannerTracker_kFullReason + 8) == a3;
  if (v10 || (sub_1D58CCE90() & 1) != 0)
  {
    uint64_t v12 = 0;
  }
  else if (*(void *)(v5 + OBJC_IVAR___ICQBubbleBannerTracker_kAlmostFullReason) == a2 {
         && *(void *)(v5 + OBJC_IVAR___ICQBubbleBannerTracker_kAlmostFullReason + 8) == a3)
  }
  {
    uint64_t v12 = 1;
  }
  else if (sub_1D58CCE90())
  {
    uint64_t v12 = 1;
  }
  else
  {
    uint64_t v12 = -1;
  }
  id v13 = (void *)sub_1D58CCAC0();
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v12;
  *(unsigned char *)(v14 + 24) = a1 & 1;
  *(double *)(v14 + 32) = a4;
  *(double *)(v14 + 40) = a5;
  v17[4] = sub_1D58B3F90;
  v17[5] = v14;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 1107296256;
  v17[2] = sub_1D58B0370;
  v17[3] = &block_descriptor_3;
  unint64_t v15 = _Block_copy(v17);
  swift_release();
  AnalyticsSendEventLazy();
  _Block_release(v15);
}

unint64_t sub_1D58B0254(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    id v2 = (void *)MEMORY[0x1E4FBC868];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(qword_1EA723478);
  id v2 = (void *)sub_1D58CCDE0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  id v4 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v5 = (uint64_t)*(v4 - 2);
    uint64_t v6 = (uint64_t)*(v4 - 1);
    unint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    id v8 = v7;
    unint64_t result = sub_1D58ACB44(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v11 = v5;
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

id sub_1D58B0370(uint64_t a1)
{
  unsigned int v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  uint64_t v3 = v1(v2);
  swift_release();
  if (v3)
  {
    sub_1D58B40B0();
    id v4 = (void *)sub_1D58CCA60();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

uint64_t sub_1D58B03FC@<X0>(uint64_t a1@<X8>)
{
  sub_1D58CC770();
  uint64_t v2 = sub_1D58CC790();
  uint64_t v3 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);
  return v3(a1, 0, 1, v2);
}

uint64_t sub_1D58B046C(void (*a1)(char *, char *, uint64_t), double a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  unint64_t v7 = v6;
  uint64_t v155 = a4;
  uint64_t v156 = a5;
  v164 = a1;
  uint64_t v10 = sub_1D58CC990();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x1F4188790](v10);
  uint64_t v14 = (char *)&v141 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x1F4188790](v12);
  uint64_t v17 = (char *)&v141 - v16;
  uint64_t v18 = MEMORY[0x1F4188790](v15);
  v154 = (char *)&v141 - v19;
  uint64_t v20 = MEMORY[0x1F4188790](v18);
  v153 = (char *)&v141 - v21;
  uint64_t v22 = MEMORY[0x1F4188790](v20);
  v152 = (char *)&v141 - v23;
  MEMORY[0x1F4188790](v22);
  v157 = (char *)&v141 - v24;
  uint64_t v25 = sub_1D58CC850();
  v161 = *(void (**)(uint64_t, uint64_t))(v25 - 8);
  v162 = (void (*)(void, void, void))v25;
  MEMORY[0x1F4188790](v25);
  BOOL v27 = (char *)&v141 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = sub_1D58CC860();
  os_log_t v159 = *(os_log_t *)(v28 - 8);
  uint64_t v160 = v28;
  MEMORY[0x1F4188790](v28);
  uint64_t v30 = (char *)&v141 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB786CC8);
  uint64_t v32 = MEMORY[0x1F4188790](v31 - 8);
  int64_t v34 = (char *)&v141 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v32);
  char v36 = (char *)&v141 - v35;
  uint64_t v37 = sub_1D58CC790();
  uint64_t v38 = MEMORY[0x1F4188790](v37);
  uint64_t v39 = MEMORY[0x1F4188790](v38);
  uint64_t v40 = MEMORY[0x1F4188790](v39);
  uint64_t v41 = MEMORY[0x1F4188790](v40);
  uint64_t v42 = MEMORY[0x1F4188790](v41);
  if (a6)
  {
    uint64_t v49 = sub_1D58BE94C();
    (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v14, v49, v10);
    unint64_t v50 = sub_1D58CC980();
    os_log_type_t v51 = sub_1D58CCC60();
    uint64_t v52 = v11;
    if (os_log_type_enabled(v50, v51))
    {
      uint64_t v53 = (uint8_t *)swift_slowAlloc();
      uint64_t v54 = swift_slowAlloc();
      *(void *)&long long v165 = v54;
      *(_DWORD *)uint64_t v53 = 136315138;
      uint64_t v167 = sub_1D58A7680(0xD00000000000003ALL, 0x80000001D58D9E90, (uint64_t *)&v165);
      sub_1D58CCD00();
      _os_log_impl(&dword_1D5851000, v50, v51, "%s Banner was dismissed in the same session returning false", v53, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1D9454520](v54, -1, -1);
      MEMORY[0x1D9454520](v53, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v52 + 8))(v14, v10);
    return 0;
  }
  uint64_t v142 = v44;
  uint64_t v143 = v43;
  v144 = v48;
  uint64_t v145 = v47;
  v146 = (char *)&v141 - v45;
  uint64_t v150 = v46;
  uint64_t v151 = v42;
  uint64_t v158 = v11;
  uint64_t v163 = v10;
  uint64_t v56 = *(void **)&v7[OBJC_IVAR___ICQBubbleBannerTracker_userDefaults];
  unint64_t v57 = *(void *)&v7[OBJC_IVAR___ICQBubbleBannerTracker_kBubbleBannerDismissedKey + 8];
  uint64_t v148 = *(void *)&v7[OBJC_IVAR___ICQBubbleBannerTracker_kBubbleBannerDismissedKey];
  unint64_t v149 = v57;
  uint64_t v58 = (void *)sub_1D58CCAC0();
  id v59 = objc_msgSend(v56, sel_dictionaryForKey_, v58);

  os_log_type_t v60 = v7;
  if (!v59)
  {
LABEL_22:
    uint64_t v91 = sub_1D58BE94C();
    uint64_t v92 = v158;
    v93 = v17;
    uint64_t v94 = v163;
    (*(void (**)(char *, uint64_t, uint64_t))(v158 + 16))(v17, v91, v163);
    id v95 = v60;
    v96 = sub_1D58CC980();
    os_log_type_t v97 = sub_1D58CCC60();
    if (os_log_type_enabled(v96, v97))
    {
      uint64_t v98 = swift_slowAlloc();
      uint64_t v99 = swift_slowAlloc();
      *(void *)&long long v165 = v99;
      *(_DWORD *)uint64_t v98 = 136315394;
      uint64_t v167 = sub_1D58A7680(0xD00000000000003ALL, 0x80000001D58D9E90, (uint64_t *)&v165);
      sub_1D58CCD00();
      *(_WORD *)(v98 + 12) = 2080;
      unint64_t v100 = v149;
      swift_bridgeObjectRetain();
      uint64_t v167 = sub_1D58A7680(v148, v100, (uint64_t *)&v165);
      sub_1D58CCD00();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1D5851000, v96, v97, "%s No cached event found for, possibly first display of the banner %s returning true", (uint8_t *)v98, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1D9454520](v99, -1, -1);
      MEMORY[0x1D9454520](v98, -1, -1);

      (*(void (**)(char *, uint64_t))(v92 + 8))(v93, v163);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v92 + 8))(v17, v94);
    }
    return 1;
  }
  v147 = v7;
  uint64_t v61 = sub_1D58CCA70();

  uint64_t result = (uint64_t)objc_msgSend(v164, sel_aa_altDSID);
  if (result)
  {
    uint64_t v63 = (void *)result;
    uint64_t v64 = sub_1D58CCAF0();
    uint64_t v66 = v65;

    if (*(void *)(v61 + 16) && (unint64_t v67 = sub_1D58ACB44(v64, v66), (v68 & 1) != 0))
    {
      sub_1D58A8CD4(*(void *)(v61 + 56) + 32 * v67, (uint64_t)&v165);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (*((void *)&v166 + 1))
      {
        uint64_t v69 = v151;
        int v70 = swift_dynamicCast();
        uint64_t v71 = v150;
        (*(void (**)(char *, void, uint64_t, uint64_t))(v150 + 56))(v36, v70 ^ 1u, 1, v69);
        uint64_t v72 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v71 + 48);
        if (v72(v36, 1, v69) != 1)
        {
          uint64_t v73 = *(void (**)(char *, char *, uint64_t))(v71 + 32);
          v73(v146, v36, v69);
          uint64_t result = sub_1D58CC770();
          double v74 = a2 / 1000.0;
          if ((~COERCE__INT64(a2 / 1000.0) & 0x7FF0000000000000) != 0)
          {
            if (v74 > -9.22337204e18)
            {
              v164 = v73;
              if (v74 < 9.22337204e18)
              {
                sub_1D58CC840();
                long long v76 = v161;
                long long v75 = v162;
                (*((void (**)(char *, void, void))v161 + 13))(v27, *MEMORY[0x1E4F27C50], v162);
                uint64_t v77 = v146;
                sub_1D58CC830();
                (*((void (**)(char *, void (*)(void, void, void)))v76 + 1))(v27, v75);
                ((void (*)(char *, uint64_t))v159[1].isa)(v30, v160);
                uint64_t v78 = v151;
                int v79 = v72(v34, 1, v151);
                uint64_t v80 = v158;
                uint64_t v81 = (void (**)(char *, uint64_t, uint64_t))(v158 + 16);
                if (v79 == 1)
                {
                  sub_1D58AC5C4((uint64_t)v34, &qword_1EB786CC8);
                  uint64_t v82 = sub_1D58BE94C();
                  uint64_t v83 = v154;
                  uint64_t v84 = v163;
                  (*v81)(v154, v82, v163);
                  uint64_t v85 = sub_1D58CC980();
                  os_log_type_t v86 = sub_1D58CCC60();
                  if (os_log_type_enabled(v85, v86))
                  {
                    uint64_t v87 = (uint8_t *)swift_slowAlloc();
                    uint64_t v88 = swift_slowAlloc();
                    *(void *)&long long v165 = v88;
                    *(_DWORD *)uint64_t v87 = 136315138;
                    uint64_t v167 = sub_1D58A7680(0xD00000000000003ALL, 0x80000001D58D9E90, (uint64_t *)&v165);
                    sub_1D58CCD00();
                    _os_log_impl(&dword_1D5851000, v85, v86, "%s Unable to compute endate from given info.", v87, 0xCu);
                    swift_arrayDestroy();
                    MEMORY[0x1D9454520](v88, -1, -1);
                    MEMORY[0x1D9454520](v87, -1, -1);
                  }

                  (*(void (**)(char *, uint64_t))(v80 + 8))(v83, v84);
                  uint64_t v89 = *(void (**)(uint64_t, uint64_t))(v150 + 8);
                  uint64_t v90 = v151;
                  v89(v145, v151);
                  v89((uint64_t)v146, v90);
                }
                else
                {
                  v164(v144, v34, v78);
                  v101 = (void (*)(char *, char *, uint64_t))sub_1D58BE94C();
                  v102 = *v81;
                  v103 = v157;
                  v164 = v101;
                  uint64_t v104 = v163;
                  v162 = (void (*)(void, void, void))v102;
                  ((void (*)(char *))v102)(v157);
                  uint64_t v105 = v150;
                  v106 = *(void (**)(void))(v150 + 16);
                  uint64_t v107 = v142;
                  ((void (*)(uint64_t, char *, uint64_t))v106)(v142, v77, v78);
                  uint64_t v108 = v143;
                  v106();
                  v109 = sub_1D58CC980();
                  os_log_type_t v110 = sub_1D58CCC60();
                  int v111 = v110;
                  if (os_log_type_enabled(v109, v110))
                  {
                    uint64_t v112 = swift_slowAlloc();
                    os_log_t v159 = v109;
                    uint64_t v113 = v112;
                    uint64_t v160 = swift_slowAlloc();
                    *(void *)&long long v165 = v160;
                    *(_DWORD *)uint64_t v113 = 136315906;
                    uint64_t v167 = sub_1D58A7680(0xD00000000000003ALL, 0x80000001D58D9E90, (uint64_t *)&v165);
                    sub_1D58CCD00();
                    *(_WORD *)(v113 + 12) = 2080;
                    LODWORD(v154) = v111;
                    sub_1D58B3BC8(&qword_1EA723438);
                    uint64_t v114 = sub_1D58CCE60();
                    uint64_t v167 = sub_1D58A7680(v114, v115, (uint64_t *)&v165);
                    sub_1D58CCD00();
                    swift_bridgeObjectRelease();
                    v116 = *(void (**)(uint64_t, uint64_t))(v105 + 8);
                    v116(v107, v78);
                    *(_WORD *)(v113 + 22) = 2048;
                    uint64_t v167 = *(void *)&a2;
                    sub_1D58CCD00();
                    *(_WORD *)(v113 + 32) = 2080;
                    uint64_t v104 = v163;
                    uint64_t v117 = sub_1D58CCE60();
                    uint64_t v167 = sub_1D58A7680(v117, v118, (uint64_t *)&v165);
                    sub_1D58CCD00();
                    swift_bridgeObjectRelease();
                    v161 = v116;
                    v116(v108, v78);
                    os_log_t v119 = v159;
                    _os_log_impl(&dword_1D5851000, v159, (os_log_type_t)v154, "%s Checking Banner supression threshold lastDismissed: %s supressUntil: %f current: %s", (uint8_t *)v113, 0x2Au);
                    uint64_t v120 = v160;
                    swift_arrayDestroy();
                    MEMORY[0x1D9454520](v120, -1, -1);
                    MEMORY[0x1D9454520](v113, -1, -1);

                    v121 = *(void (**)(char *, uint64_t))(v158 + 8);
                    v121(v157, v104);
                  }
                  else
                  {
                    v122 = *(void (**)(uint64_t, uint64_t))(v105 + 8);
                    v122(v107, v78);
                    v161 = v122;
                    v122(v108, v78);

                    v121 = *(void (**)(char *, uint64_t))(v158 + 8);
                    v121(v103, v104);
                  }
                  sub_1D58B3BC8(&qword_1EA723430);
                  if ((sub_1D58CCAA0() & 1) == 0)
                  {
                    v132 = v152;
                    v162(v152, v164, v104);
                    v133 = sub_1D58CC980();
                    os_log_type_t v134 = sub_1D58CCC60();
                    if (os_log_type_enabled(v133, v134))
                    {
                      v135 = (uint8_t *)swift_slowAlloc();
                      uint64_t v136 = swift_slowAlloc();
                      *(void *)&long long v165 = v136;
                      *(_DWORD *)v135 = 136315138;
                      uint64_t v167 = sub_1D58A7680(0xD00000000000003ALL, 0x80000001D58D9E90, (uint64_t *)&v165);
                      sub_1D58CCD00();
                      _os_log_impl(&dword_1D5851000, v133, v134, "%s Supression threshold passed. Displaying banner", v135, 0xCu);
                      swift_arrayDestroy();
                      MEMORY[0x1D9454520](v136, -1, -1);
                      MEMORY[0x1D9454520](v135, -1, -1);
                    }

                    v121(v132, v104);
                    v137 = v146;
                    sub_1D58CC750();
                    uint64_t v55 = 1;
                    sub_1D58B00D4(1, v155, v156, v138, a2);
                    uint64_t v139 = v151;
                    v140 = v161;
                    v161((uint64_t)v144, v151);
                    v140(v145, v139);
                    v140((uint64_t)v137, v139);
                    return v55;
                  }
                  v123 = v153;
                  v162(v153, v164, v104);
                  v124 = sub_1D58CC980();
                  os_log_type_t v125 = sub_1D58CCC60();
                  if (os_log_type_enabled(v124, v125))
                  {
                    v126 = (uint8_t *)swift_slowAlloc();
                    uint64_t v127 = swift_slowAlloc();
                    *(void *)&long long v165 = v127;
                    *(_DWORD *)v126 = 136315138;
                    uint64_t v167 = sub_1D58A7680(0xD00000000000003ALL, 0x80000001D58D9E90, (uint64_t *)&v165);
                    sub_1D58CCD00();
                    _os_log_impl(&dword_1D5851000, v124, v125, "%s Supression threshold not passed. Supressing banner", v126, 0xCu);
                    swift_arrayDestroy();
                    MEMORY[0x1D9454520](v127, -1, -1);
                    MEMORY[0x1D9454520](v126, -1, -1);
                  }

                  v121(v123, v104);
                  v128 = v146;
                  sub_1D58CC750();
                  sub_1D58B00D4(0, v155, v156, v129, a2);
                  uint64_t v130 = v151;
                  v131 = v161;
                  v161((uint64_t)v144, v151);
                  v131(v145, v130);
                  v131((uint64_t)v128, v130);
                }
                return 0;
              }
              goto LABEL_39;
            }
          }
          else
          {
            __break(1u);
          }
          __break(1u);
LABEL_39:
          __break(1u);
          goto LABEL_40;
        }
        goto LABEL_21;
      }
    }
    else
    {
      long long v165 = 0u;
      long long v166 = 0u;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    sub_1D58AC5C4((uint64_t)&v165, &qword_1EB786C68);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v150 + 56))(v36, 1, 1, v151);
LABEL_21:
    sub_1D58AC5C4((uint64_t)v36, &qword_1EB786CC8);
    os_log_type_t v60 = v147;
    goto LABEL_22;
  }
LABEL_40:
  __break(1u);
  return result;
}

id sub_1D58B187C@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>, uint64_t a5@<D0>)
{
  uint64_t v169 = a2;
  uint64_t v170 = a3;
  uint64_t v9 = sub_1D58CC990();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v172 = v9;
  uint64_t v173 = v10;
  uint64_t v11 = MEMORY[0x1F4188790](v9);
  v174 = (char *)&v147 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x1F4188790](v11);
  v157 = (char *)&v147 - v14;
  uint64_t v15 = MEMORY[0x1F4188790](v13);
  uint64_t v17 = (char *)&v147 - v16;
  uint64_t v18 = MEMORY[0x1F4188790](v15);
  uint64_t v158 = (char *)&v147 - v19;
  MEMORY[0x1F4188790](v18);
  uint64_t v21 = (char *)&v147 - v20;
  uint64_t v22 = sub_1D58CC850();
  uint64_t v164 = *(void *)(v22 - 8);
  long long v165 = (void (**)(char *, uint64_t, void))v22;
  MEMORY[0x1F4188790](v22);
  v162 = (char *)&v147 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v163 = (void (*)(char *, uint64_t, uint64_t))sub_1D58CC860();
  uint64_t v161 = *((void *)v163 - 1);
  MEMORY[0x1F4188790](v163);
  uint64_t v25 = (char *)&v147 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB786CC8);
  uint64_t v27 = MEMORY[0x1F4188790](v26 - 8);
  uint64_t v29 = (char *)&v147 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v27);
  uint64_t v31 = (char *)&v147 - v30;
  uint64_t v32 = sub_1D58CC790();
  uint64_t v175 = *(void *)(v32 - 8);
  uint64_t v176 = v32;
  uint64_t v33 = MEMORY[0x1F4188790](v32);
  v154 = (char *)&v147 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = MEMORY[0x1F4188790](v33);
  os_log_t v159 = (char *)&v147 - v36;
  uint64_t v37 = MEMORY[0x1F4188790](v35);
  uint64_t v156 = (char *)&v147 - v38;
  uint64_t v39 = MEMORY[0x1F4188790](v37);
  uint64_t v155 = (char *)&v147 - v40;
  uint64_t v41 = MEMORY[0x1F4188790](v39);
  uint64_t v160 = (char *)&v147 - v42;
  uint64_t v43 = MEMORY[0x1F4188790](v41);
  long long v166 = (char *)&v147 - v44;
  MEMORY[0x1F4188790](v43);
  uint64_t v46 = (char *)&v147 - v45;
  uint64_t v47 = *(void **)((char *)v5 + OBJC_IVAR___ICQBubbleBannerTracker_userDefaults);
  v171 = v5;
  uint64_t v48 = (void *)sub_1D58CCAC0();
  id v49 = objc_msgSend(v47, sel_dictionaryForKey_, v48);

  if (!v49)
  {
LABEL_16:
    uint64_t v84 = a4;
    uint64_t v85 = sub_1D58BE94C();
    uint64_t v87 = v173;
    os_log_type_t v86 = v174;
    uint64_t v88 = v172;
    (*(void (**)(char *, uint64_t, uint64_t))(v173 + 16))(v174, v85, v172);
    uint64_t v89 = sub_1D58CC980();
    os_log_type_t v90 = sub_1D58CCC60();
    if (os_log_type_enabled(v89, v90))
    {
      uint64_t v91 = (uint8_t *)swift_slowAlloc();
      uint64_t v92 = swift_slowAlloc();
      *(void *)&long long v177 = v92;
      *(_DWORD *)uint64_t v91 = 136315138;
      uint64_t v179 = sub_1D58A7680(0xD000000000000021, 0x80000001D58D9ED0, (uint64_t *)&v177);
      sub_1D58CCD00();
      _os_log_impl(&dword_1D5851000, v89, v90, "%s No cached events found, ignoring decay thresholds and displaying banner at the top.", v91, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1D9454520](v92, -1, -1);
      MEMORY[0x1D9454520](v91, -1, -1);

      (*(void (**)(char *, uint64_t))(v87 + 8))(v174, v88);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v87 + 8))(v86, v88);
    }
    uint64_t v93 = v170;
    uint64_t v94 = v171;
    uint64_t v95 = v169;
    uint64_t v78 = v84;
    sub_1D58CC770();
    (*(void (**)(void *, uint64_t, uint64_t, uint64_t))((*MEMORY[0x1E4FBC8C8] & *v94) + 0x88))(a1, v84, v95, v93);
    uint64_t v65 = v176;
    v96 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v175 + 56);
    return (id)v96(v78, 0, 1, v65);
  }
  v153 = v46;
  uint64_t v168 = a4;
  uint64_t v50 = sub_1D58CCA70();

  uint64_t v167 = a1;
  id result = objc_msgSend(a1, sel_aa_altDSID);
  if (!result)
  {
LABEL_39:
    __break(1u);
    return result;
  }
  uint64_t v52 = result;
  uint64_t v53 = sub_1D58CCAF0();
  uint64_t v55 = v54;

  if (!*(void *)(v50 + 16) || (v56 = v21, unint64_t v57 = sub_1D58ACB44(v53, v55), (v58 & 1) == 0))
  {
    long long v177 = 0u;
    long long v178 = 0u;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_14;
  }
  sub_1D58A8CD4(*(void *)(v50 + 56) + 32 * v57, (uint64_t)&v177);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*((void *)&v178 + 1))
  {
LABEL_14:
    sub_1D58AC5C4((uint64_t)&v177, &qword_1EB786C68);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v175 + 56))(v31, 1, 1, v176);
    goto LABEL_15;
  }
  uint64_t v59 = v176;
  int v60 = swift_dynamicCast();
  uint64_t v61 = v175;
  uint64_t v62 = v175 + 56;
  v152 = *(void (**)(char *, void, uint64_t, uint64_t))(v175 + 56);
  v152(v31, v60 ^ 1u, 1, v59);
  uint64_t v63 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v61 + 48);
  if (v63(v31, 1, v59) == 1)
  {
LABEL_15:
    sub_1D58AC5C4((uint64_t)v31, &qword_1EB786CC8);
    a1 = v167;
    a4 = v168;
    goto LABEL_16;
  }
  uint64_t v148 = v17;
  uint64_t v64 = *(void (**)(uint64_t, char *, uint64_t))(v61 + 32);
  uint64_t v65 = v176;
  v174 = (char *)(v61 + 32);
  uint64_t v151 = v64;
  v64((uint64_t)v153, v31, v176);
  id result = (id)sub_1D58CC770();
  double v66 = *(double *)&a5 / 1000.0;
  if ((~COERCE__INT64(*(double *)&a5 / 1000.0) & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_37;
  }
  if (v66 <= -9.22337204e18)
  {
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  uint64_t v150 = (uint64_t (*)(char *, uint64_t, uint64_t))v63;
  uint64_t v149 = v62;
  if (v66 >= 9.22337204e18)
  {
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  sub_1D58CC840();
  uint64_t v68 = v164;
  unint64_t v67 = v165;
  uint64_t v69 = v162;
  (*(void (**)(char *, void, void))(v164 + 104))(v162, *MEMORY[0x1E4F27C50], v165);
  sub_1D58CC830();
  (*(void (**)(char *, void (**)(char *, uint64_t, void)))(v68 + 8))(v69, v67);
  (*(void (**)(char *, void (*)(char *, uint64_t, uint64_t)))(v161 + 8))(v25, v163);
  int v70 = v150(v29, 1, v65);
  uint64_t v71 = (void (**)(char *, uint64_t, uint64_t))(v173 + 16);
  if (v70 == 1)
  {
    sub_1D58AC5C4((uint64_t)v29, &qword_1EB786CC8);
    uint64_t v72 = sub_1D58BE94C();
    uint64_t v73 = v157;
    uint64_t v74 = v172;
    (*v71)(v157, v72, v172);
    long long v75 = sub_1D58CC980();
    os_log_type_t v76 = sub_1D58CCC60();
    BOOL v77 = os_log_type_enabled(v75, v76);
    uint64_t v78 = v168;
    if (v77)
    {
      int v79 = v73;
      uint64_t v80 = (uint8_t *)swift_slowAlloc();
      uint64_t v81 = v78;
      uint64_t v82 = swift_slowAlloc();
      *(void *)&long long v177 = v82;
      *(_DWORD *)uint64_t v80 = 136315138;
      uint64_t v179 = sub_1D58A7680(0xD000000000000021, 0x80000001D58D9ED0, (uint64_t *)&v177);
      sub_1D58CCD00();
      _os_log_impl(&dword_1D5851000, v75, v76, "%s Unable to compute endate from given info.", v80, 0xCu);
      swift_arrayDestroy();
      uint64_t v83 = v82;
      uint64_t v78 = v81;
      MEMORY[0x1D9454520](v83, -1, -1);
      MEMORY[0x1D9454520](v80, -1, -1);

      (*(void (**)(char *, uint64_t))(v173 + 8))(v79, v74);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v173 + 8))(v73, v74);
    }
    (*(void (**)(char *, uint64_t))(v175 + 8))(v166, v65);
    v121 = v153;
    v96 = (uint64_t (*)(uint64_t, void, uint64_t, uint64_t))v152;
    uint64_t v122 = v78;
LABEL_33:
    v151(v122, v121, v65);
    return (id)v96(v78, 0, 1, v65);
  }
  os_log_type_t v97 = v160;
  v151((uint64_t)v160, v29, v65);
  uint64_t v98 = sub_1D58BE94C();
  uint64_t v99 = *v71;
  uint64_t v164 = v98;
  long long v165 = v71;
  uint64_t v163 = v99;
  ((void (*)(char *))v99)(v56);
  uint64_t v100 = v175;
  v101 = *(void (**)(char *, char *, uint64_t))(v175 + 16);
  v102 = v155;
  v101(v155, v153, v65);
  v103 = v156;
  v101(v156, v166, v65);
  uint64_t v104 = v159;
  v101(v159, v97, v65);
  uint64_t v105 = sub_1D58CC980();
  os_log_type_t v106 = sub_1D58CCC60();
  int v107 = v106;
  if (os_log_type_enabled(v105, v106))
  {
    uint64_t v108 = swift_slowAlloc();
    uint64_t v161 = swift_slowAlloc();
    *(void *)&long long v177 = v161;
    *(_DWORD *)uint64_t v108 = 136316162;
    uint64_t v179 = sub_1D58A7680(0xD000000000000021, 0x80000001D58D9ED0, (uint64_t *)&v177);
    sub_1D58CCD00();
    *(_WORD *)(v108 + 12) = 2080;
    sub_1D58B3BC8(&qword_1EA723438);
    LODWORD(v150) = v107;
    uint64_t v109 = sub_1D58CCE60();
    uint64_t v179 = sub_1D58A7680(v109, v110, (uint64_t *)&v177);
    sub_1D58CCD00();
    swift_bridgeObjectRelease();
    v157 = v56;
    int v111 = *(void (**)(char *, uint64_t))(v100 + 8);
    v111(v102, v176);
    *(_WORD *)(v108 + 22) = 2048;
    uint64_t v179 = a5;
    sub_1D58CCD00();
    *(_WORD *)(v108 + 32) = 2080;
    uint64_t v112 = sub_1D58CCE60();
    uint64_t v179 = sub_1D58A7680(v112, v113, (uint64_t *)&v177);
    sub_1D58CCD00();
    swift_bridgeObjectRelease();
    v111(v103, v176);
    *(_WORD *)(v108 + 42) = 2080;
    uint64_t v114 = v159;
    uint64_t v65 = v176;
    uint64_t v115 = sub_1D58CCE60();
    uint64_t v179 = sub_1D58A7680(v115, v116, (uint64_t *)&v177);
    sub_1D58CCD00();
    swift_bridgeObjectRelease();
    v162 = (char *)v111;
    v111(v114, v65);
    _os_log_impl(&dword_1D5851000, v105, (os_log_type_t)v150, "%s Checking Banner decay threshold lastDisplayed: %s decayUntil: %f current: %s end: %s", (uint8_t *)v108, 0x34u);
    uint64_t v117 = v161;
    swift_arrayDestroy();
    MEMORY[0x1D9454520](v117, -1, -1);
    uint64_t v118 = v108;
    os_log_type_t v97 = v160;
    MEMORY[0x1D9454520](v118, -1, -1);

    os_log_t v119 = *(void (**)(char *, uint64_t))(v173 + 8);
    uint64_t v120 = v157;
  }
  else
  {
    v123 = *(void (**)(char *, uint64_t))(v100 + 8);
    v123(v102, v65);
    v123(v103, v65);
    v162 = (char *)v123;
    v123(v104, v65);

    os_log_t v119 = *(void (**)(char *, uint64_t))(v173 + 8);
    uint64_t v120 = v56;
  }
  uint64_t v124 = v172;
  v119(v120, v172);
  uint64_t v78 = v168;
  sub_1D58B3BC8(&qword_1EA723430);
  char v125 = sub_1D58CCAA0();
  v126 = v158;
  if (v125)
  {
    uint64_t v127 = v148;
    v163(v148, v164, v124);
    v128 = sub_1D58CC980();
    os_log_type_t v129 = sub_1D58CCC60();
    if (os_log_type_enabled(v128, v129))
    {
      uint64_t v130 = (uint8_t *)swift_slowAlloc();
      uint64_t v131 = swift_slowAlloc();
      *(void *)&long long v177 = v131;
      *(_DWORD *)uint64_t v130 = 136315138;
      uint64_t v179 = sub_1D58A7680(0xD000000000000021, 0x80000001D58D9ED0, (uint64_t *)&v177);
      sub_1D58CCD00();
      _os_log_impl(&dword_1D5851000, v128, v129, "%s Decay threshold not passed. We will let the banner decay.", v130, 0xCu);
      swift_arrayDestroy();
      uint64_t v132 = v131;
      uint64_t v78 = v168;
      MEMORY[0x1D9454520](v132, -1, -1);
      MEMORY[0x1D9454520](v130, -1, -1);

      v119(v127, v172);
    }
    else
    {

      v119(v127, v124);
    }
    uint64_t v141 = v162;
    ((void (*)(char *, uint64_t))v162)(v97, v65);
    ((void (*)(char *, uint64_t))v141)(v166, v65);
    v96 = (uint64_t (*)(uint64_t, void, uint64_t, uint64_t))v152;
    uint64_t v122 = v78;
    v121 = v153;
    goto LABEL_33;
  }
  v163(v158, v164, v124);
  v133 = sub_1D58CC980();
  os_log_type_t v134 = sub_1D58CCC60();
  if (os_log_type_enabled(v133, v134))
  {
    v135 = (uint8_t *)swift_slowAlloc();
    uint64_t v136 = v78;
    uint64_t v137 = swift_slowAlloc();
    *(void *)&long long v177 = v137;
    *(_DWORD *)v135 = 136315138;
    uint64_t v179 = sub_1D58A7680(0xD000000000000021, 0x80000001D58D9ED0, (uint64_t *)&v177);
    os_log_type_t v97 = v160;
    sub_1D58CCD00();
    _os_log_impl(&dword_1D5851000, v133, v134, "%s Decay threshold passed. Displaying banner at the top of the stack.", v135, 0xCu);
    swift_arrayDestroy();
    uint64_t v138 = v137;
    uint64_t v78 = v136;
    MEMORY[0x1D9454520](v138, -1, -1);
    MEMORY[0x1D9454520](v135, -1, -1);

    uint64_t v139 = v172;
    v140 = v126;
  }
  else
  {

    v140 = v126;
    uint64_t v139 = v124;
  }
  v119(v140, v139);
  uint64_t v142 = v170;
  uint64_t v143 = v171;
  uint64_t v144 = v169;
  uint64_t v145 = v154;
  sub_1D58CC770();
  (*(void (**)(void *, char *, uint64_t, uint64_t))((*MEMORY[0x1E4FBC8C8] & *v143) + 0x88))(v167, v145, v144, v142);
  v146 = v162;
  ((void (*)(char *, uint64_t))v162)(v97, v65);
  ((void (*)(char *, uint64_t))v146)(v166, v65);
  ((void (*)(char *, uint64_t))v146)(v153, v65);
  v151(v78, v145, v65);
  return (id)((uint64_t (*)(uint64_t, void, uint64_t, uint64_t))v152)(v78, 0, 1, v65);
}

id BubbleBannerTracker.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void BubbleBannerTracker.init()()
{
}

id BubbleBannerTracker.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BubbleBannerTracker();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1D58B2E8C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA7233F0);
  uint64_t v6 = sub_1D58CCDD0();
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
                  *uint64_t v34 = -1 << v32;
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
      uint64_t v21 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
      uint64_t v23 = *v21;
      uint64_t v22 = v21[1];
      uint64_t v24 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v17);
      if (a2)
      {
        sub_1D58ACC20(v24, v35);
      }
      else
      {
        sub_1D58A8CD4((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_1D58CCF00();
      sub_1D58CCB00();
      uint64_t result = sub_1D58CCF20();
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
      uint64_t v15 = (void *)(*(void *)(v7 + 48) + 16 * v14);
      *uint64_t v15 = v23;
      v15[1] = v22;
      uint64_t result = (uint64_t)sub_1D58ACC20(v35, (_OWORD *)(*(void *)(v7 + 56) + 32 * v14));
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

_OWORD *sub_1D58B318C(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  unint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_1D58ACB44(a2, a3);
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
      sub_1D58B334C();
      goto LABEL_7;
    }
    sub_1D58B2E8C(v15, a4 & 1);
    unint64_t v21 = sub_1D58ACB44(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      unint64_t v12 = v21;
      int64_t v18 = *v5;
      if (v16) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = (_OWORD *)sub_1D58CCEB0();
    __break(1u);
    return result;
  }
LABEL_7:
  int64_t v18 = *v5;
  if (v16)
  {
LABEL_8:
    unint64_t v19 = (_OWORD *)(v18[7] + 32 * v12);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v19);
    return sub_1D58ACC20(a1, v19);
  }
LABEL_13:
  sub_1D58B32E0(v12, a2, a3, a1, v18);
  return (_OWORD *)swift_bridgeObjectRetain();
}

_OWORD *sub_1D58B32E0(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v6 = (void *)(a5[6] + 16 * a1);
  *uint64_t v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_1D58ACC20(a4, (_OWORD *)(a5[7] + 32 * a1));
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

void *sub_1D58B334C()
{
  id v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA7233F0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1D58CCDC0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_28:
    *id v1 = v4;
    return result;
  }
  uint64_t v25 = v1;
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    sub_1D58A8CD4(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v21 = v19;
    v21[1] = v18;
    sub_1D58ACC20(v26, (_OWORD *)(*(void *)(v4 + 56) + v20));
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    id v1 = v25;
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

id sub_1D58B3534(void *a1)
{
  uint64_t v3 = &v1[OBJC_IVAR___ICQBubbleBannerTracker_kBubbleBannerDismissedKey];
  *(void *)uint64_t v3 = 0xD000000000000015;
  *((void *)v3 + 1) = 0x80000001D58D9DF0;
  uint64_t v4 = &v1[OBJC_IVAR___ICQBubbleBannerTracker_kBubbleBannerDisplayedKey];
  *(void *)uint64_t v4 = 0xD000000000000015;
  *((void *)v4 + 1) = 0x80000001D58D9E10;
  uint64_t v5 = &v1[OBJC_IVAR___ICQBubbleBannerTracker_kBubbleBannerCAEventKey];
  *(void *)uint64_t v5 = 0xD00000000000001CLL;
  *((void *)v5 + 1) = 0x80000001D58D9E30;
  uint64_t v6 = &v1[OBJC_IVAR___ICQBubbleBannerTracker_kFullReason];
  *(void *)uint64_t v6 = 0xD000000000000011;
  *((void *)v6 + 1) = 0x80000001D58D9E50;
  unint64_t v7 = &v1[OBJC_IVAR___ICQBubbleBannerTracker_kAlmostFullReason];
  *(void *)unint64_t v7 = 0xD000000000000017;
  *((void *)v7 + 1) = 0x80000001D58D9E70;
  if (a1)
  {
    uint64_t v8 = v1;
    id v9 = a1;
  }
  else
  {
    uint64_t v10 = self;
    uint64_t v11 = v1;
    id v9 = objc_msgSend(v10, sel_standardUserDefaults);
  }
  *(void *)&v1[OBJC_IVAR___ICQBubbleBannerTracker_userDefaults] = v9;
  id v12 = a1;

  v14.receiver = v1;
  v14.super_class = (Class)type metadata accessor for BubbleBannerTracker();
  return objc_msgSendSuper2(&v14, sel_init);
}

id sub_1D58B3680(void *a1, uint64_t a2, char a3)
{
  uint64_t v7 = sub_1D58CC990();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)v43 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    swift_bridgeObjectRelease();
    id v12 = &OBJC_IVAR___ICQBubbleBannerTracker_kBubbleBannerDismissedKey;
  }
  else
  {
    char v11 = sub_1D58CCE90();
    swift_bridgeObjectRelease();
    id v12 = &OBJC_IVAR___ICQBubbleBannerTracker_kBubbleBannerDisplayedKey;
    if (v11) {
      id v12 = &OBJC_IVAR___ICQBubbleBannerTracker_kBubbleBannerDismissedKey;
    }
  }
  int64_t v13 = (uint64_t *)(v3 + *v12);
  uint64_t v14 = *v13;
  unint64_t v15 = v13[1];
  swift_bridgeObjectRetain();
  uint64_t v52 = v14;
  unint64_t v53 = v15;
  uint64_t v16 = *(void **)(v3 + OBJC_IVAR___ICQBubbleBannerTracker_userDefaults);
  swift_bridgeObjectRetain();
  uint64_t v46 = v14;
  uint64_t v17 = (void *)sub_1D58CCAC0();
  id v18 = objc_msgSend(v16, sel_dictionaryForKey_, v17);

  uint64_t v19 = MEMORY[0x1E4FBC840];
  if (v18)
  {
    uint64_t v20 = sub_1D58CCA70();
  }
  else
  {
    uint64_t v20 = MEMORY[0x1E4FBC868];
  }
  unint64_t v51 = v20;
  id result = objc_msgSend(a1, sel_aa_altDSID);
  if (result)
  {
    int64_t v22 = result;
    uint64_t v23 = sub_1D58CCAF0();
    uint64_t v25 = v24;

    uint64_t v26 = sub_1D58CC790();
    uint64_t v50 = v26;
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v49);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v26 - 8) + 16))(boxed_opaque_existential_0, a2, v26);
    sub_1D58ACC20(&v49, v48);
    unint64_t v28 = v51;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v47 = v28;
    unint64_t v51 = 0x8000000000000000;
    sub_1D58B318C(v48, v23, v25, isUniquelyReferenced_nonNull_native);
    unint64_t v51 = v47;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v30 = sub_1D58BE94C();
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v30, v7);
    swift_bridgeObjectRetain();
    uint64_t v31 = sub_1D58CC980();
    os_log_type_t v32 = sub_1D58CCC60();
    if (os_log_type_enabled(v31, v32))
    {
      uint64_t v33 = swift_slowAlloc();
      uint64_t v34 = swift_slowAlloc();
      *(void *)&long long v49 = v34;
      *(_DWORD *)uint64_t v33 = 136315394;
      v43[0] = v33 + 4;
      swift_beginAccess();
      uint64_t v45 = v7;
      swift_bridgeObjectRetain();
      v43[1] = v19 + 8;
      uint64_t v35 = v16;
      uint64_t v36 = sub_1D58CCA80();
      uint64_t v44 = v10;
      uint64_t v37 = v8;
      unint64_t v39 = v38;
      swift_bridgeObjectRelease();
      uint64_t v40 = v36;
      uint64_t v16 = v35;
      *(void *)&v48[0] = sub_1D58A7680(v40, v39, (uint64_t *)&v49);
      sub_1D58CCD00();
      swift_bridgeObjectRelease();
      *(_WORD *)(v33 + 12) = 2080;
      swift_bridgeObjectRetain();
      *(void *)&v48[0] = sub_1D58A7680(v46, v15, (uint64_t *)&v49);
      sub_1D58CCD00();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1D5851000, v31, v32, "Tracking event %s for key %s", (uint8_t *)v33, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1D9454520](v34, -1, -1);
      MEMORY[0x1D9454520](v33, -1, -1);

      (*(void (**)(char *, uint64_t))(v37 + 8))(v44, v45);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    }
    swift_beginAccess();
    swift_bridgeObjectRetain();
    uint64_t v41 = (void *)sub_1D58CCA60();
    swift_bridgeObjectRelease();
    swift_beginAccess();
    uint64_t v42 = (void *)sub_1D58CCAC0();
    swift_bridgeObjectRelease();
    objc_msgSend(v16, sel_setObject_forKey_, v41, v42);

    return (id)swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1D58B3BC8(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1D58CC790();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t type metadata accessor for BubbleBannerTracker()
{
  return self;
}

unint64_t sub_1D58B3C34()
{
  unint64_t result = qword_1EA723460;
  if (!qword_1EA723460)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA723460);
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for BubbleBannerEventType(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for BubbleBannerEventType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1D58B3DF4);
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

uint64_t sub_1D58B3E1C(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_1D58B3E28(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for BubbleBannerEventType()
{
  return &type metadata for BubbleBannerEventType;
}

uint64_t method lookup function for BubbleBannerTracker(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for BubbleBannerTracker);
}

uint64_t dispatch thunk of BubbleBannerTracker.trackLastDisplayedAtTheTop(_:date:reason:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x88))();
}

uint64_t dispatch thunk of BubbleBannerTracker.trackLastDismissed(_:date:reason:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x90))();
}

uint64_t dispatch thunk of BubbleBannerTracker.shouldDisplay(_:date:for:dismissedInSession:supressUntil:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of BubbleBannerTracker.lastUpdated(_:reason:decayUntil:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xB0))();
}

unint64_t sub_1D58B3F2C()
{
  unint64_t result = qword_1EA723468;
  if (!qword_1EA723468)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA723468);
  }
  return result;
}

uint64_t sub_1D58B3F80()
{
  return MEMORY[0x1F4186498](v0, 48, 7);
}

unint64_t sub_1D58B3F90()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA723470);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1D58D35D0;
  *(void *)(inited + 32) = 0x795472656E6E6162;
  *(void *)(inited + 40) = 0xEA00000000006570;
  *(void *)(inited + 48) = sub_1D58CCC40();
  *(void *)(inited + 56) = 0x616C707369447369;
  *(void *)(inited + 64) = 0xEB00000000646579;
  *(void *)(inited + 72) = sub_1D58CCBA0();
  strcpy((char *)(inited + 80), "lastDismissed");
  *(_WORD *)(inited + 94) = -4864;
  *(void *)(inited + 96) = sub_1D58CCC30();
  strcpy((char *)(inited + 104), "suppressUntil");
  *(_WORD *)(inited + 118) = -4864;
  *(void *)(inited + 120) = sub_1D58CCC30();
  return sub_1D58B0254(inited);
}

unint64_t sub_1D58B40B0()
{
  unint64_t result = qword_1EA723348;
  if (!qword_1EA723348)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EA723348);
  }
  return result;
}

uint64_t *__swift_allocate_boxed_opaque_existential_0(uint64_t *a1)
{
  id v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_1D58B4154()
{
  id v1 = *v0;
  uint64_t v2 = (void *)sub_1D58CCAC0();
  id v3 = objc_msgSend(v1, sel_dictionaryForKey_, v2);

  if (!v3) {
    return 0;
  }
  uint64_t v4 = sub_1D58CCA70();

  return v4;
}

void sub_1D58B41DC(uint64_t a1)
{
}

void sub_1D58B4200(uint64_t a1)
{
  sub_1D58ACBBC(a1, (uint64_t)v9, &qword_1EB786C68);
  uint64_t v2 = v10;
  if (v10)
  {
    id v3 = __swift_project_boxed_opaque_existential_0(v9, v10);
    uint64_t v4 = *(void *)(v2 - 8);
    MEMORY[0x1F4188790](v3);
    unsigned int v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v4 + 16))(v6);
    uint64_t v7 = sub_1D58CCE80();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v2);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);
  }
  else
  {
    uint64_t v7 = 0;
  }
  int v8 = (void *)sub_1D58CCAC0();
  objc_msgSend(v1, sel_setObject_forKey_, v7, v8);
  swift_unknownObjectRelease();
}

void sub_1D58B4368()
{
  id v1 = *v0;
  id v2 = (id)sub_1D58CCAC0();
  objc_msgSend(v1, sel_removeObjectForKey_, v2);
}

uint64_t sub_1D58B43C0()
{
  return sub_1D58CC710();
}

void sub_1D58B43DC(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X8>)
{
}

void sub_1D58B4400(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X8>)
{
  unsigned int v6 = v5;
  v21[1] = a5;
  v22[1] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA7234A0);
  MEMORY[0x1F4188790](v11 - 8);
  int64_t v13 = (char *)v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D58ACBBC(a3, (uint64_t)v13, &qword_1EA7234A0);
  uint64_t v14 = sub_1D58CC700();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14) != 1)
  {
    uint64_t v16 = (void *)sub_1D58CC6B0();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v13, v14);
  }
  v22[0] = 0;
  id v17 = objc_msgSend(v6, sel_URLForDirectory_inDomain_appropriateForURL_create_error_, a1, a2, v16, a4 & 1, v22);

  id v18 = v22[0];
  if (v17)
  {
    sub_1D58CC6C0();
    id v19 = v18;
  }
  else
  {
    id v20 = v22[0];
    sub_1D58CC680();

    swift_willThrow();
  }
}

id sub_1D58B45E8(uint64_t a1, char a2, void *a3)
{
  return sub_1D58B460C(a1, a2, a3);
}

id sub_1D58B460C(uint64_t a1, char a2, void *a3)
{
  uint64_t v4 = v3;
  v11[1] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v7 = (void *)sub_1D58CC6B0();
  if (a3)
  {
    type metadata accessor for FileAttributeKey();
    sub_1D58BE6FC(&qword_1EA723588, 255, (void (*)(uint64_t))type metadata accessor for FileAttributeKey);
    a3 = (void *)sub_1D58CCA60();
  }
  v11[0] = 0;
  unsigned int v8 = objc_msgSend(v4, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v7, a2 & 1, a3, v11);

  if (v8) {
    return v11[0];
  }
  id v10 = v11[0];
  sub_1D58CC680();

  return (id)swift_willThrow();
}

id sub_1D58B4754()
{
  id v1 = *v0;
  id v2 = (void *)sub_1D58CCAC0();
  id v3 = objc_msgSend(v1, sel_fileExistsAtPath_, v2);

  return v3;
}

uint64_t sub_1D58B479C()
{
  return sub_1D58CC730();
}

uint64_t sub_1D58B47B8(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_1D58B4854;
  return ICQLiftUIDataSource.data(for:)(a2);
}

uint64_t sub_1D58B4854(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *v3;
  uint64_t v7 = *v3;
  swift_task_dealloc();
  if (v2)
  {
    uint64_t v8 = *(void *)(v7 + 8);
    __asm { BRAA            X1, X16 }
  }
  *(void *)(v6 + 32) = a2;
  *(void *)(v6 + 40) = a1;
  return MEMORY[0x1F4188298](sub_1D58B49B0, 0, 0);
}

uint64_t sub_1D58B49B0()
{
  id v1 = *(int8x16_t **)(v0 + 16);
  int8x16_t v2 = *(int8x16_t *)(v0 + 32);
  v1[1].i64[1] = MEMORY[0x1E4F277C0];
  v1[2].i64[0] = (uint64_t)&off_1F2DCD368;
  *id v1 = vextq_s8(v2, v2, 8uLL);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1D58B49EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return ICQLiftUIDataSource.request(for:)(a1, a2);
}

uint64_t sub_1D58B4A10(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_1D58B4AB0;
  return ICQLiftUIDataSource.data(for:)(a2);
}

uint64_t sub_1D58B4AB0(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *v3;
  uint64_t v7 = *v3;
  swift_task_dealloc();
  if (v2)
  {
    uint64_t v8 = *(void *)(v7 + 8);
    __asm { BRAA            X1, X16 }
  }
  *(void *)(v6 + 32) = a2;
  *(void *)(v6 + 40) = a1;
  return MEMORY[0x1F4188298](sub_1D58BE74C, 0, 0);
}

uint64_t sub_1D58B4C0C()
{
  id v0 = objc_msgSend(self, sel_standardUserDefaults);
  uint64_t v8 = sub_1D58A8D34(0, &qword_1EB786AB8);
  uint64_t v9 = &off_1F2DCD320;
  *(void *)&long long v7 = v0;
  id v1 = objc_msgSend(self, sel_defaultManager);
  uint64_t v5 = sub_1D58A8D34(0, &qword_1EB786AB0);
  uint64_t v6 = &off_1F2DCD340;
  *(void *)&long long v4 = v1;
  type metadata accessor for LiftUICache();
  uint64_t v2 = swift_allocObject();
  swift_defaultActor_initialize();
  sub_1D58AE7CC(&v7, v2 + 112);
  uint64_t result = sub_1D58AE7CC(&v4, v2 + 152);
  qword_1EB786D68 = v2;
  return result;
}

uint64_t *sub_1D58B4D00()
{
  if (qword_1EB786D70 != -1) {
    swift_once();
  }
  return &qword_1EB786D68;
}

uint64_t static LiftUICache.shared.getter()
{
  if (qword_1EB786D70 != -1) {
    swift_once();
  }
  return swift_retain();
}

uint64_t sub_1D58B4E08(long long *a1, long long *a2)
{
  uint64_t v4 = swift_allocObject();
  swift_defaultActor_initialize();
  sub_1D58AE7CC(a1, v4 + 112);
  sub_1D58AE7CC(a2, v4 + 152);
  return v4;
}

uint64_t sub_1D58B4E68(long long *a1, long long *a2)
{
  swift_defaultActor_initialize();
  sub_1D58AE7CC(a1, v2 + 112);
  sub_1D58AE7CC(a2, v2 + 152);
  return v2;
}

uint64_t sub_1D58B4EB8()
{
  return sub_1D58CC8B0();
}

uint64_t sub_1D58B4F20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1D58CC700();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB786C48);
  MEMORY[0x1F4188790](v9 - 8);
  uint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1D58CCBF0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 1, 1, v12);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a3, v6);
  unint64_t v13 = (*(unsigned __int8 *)(v7 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v14 = (char *)swift_allocObject();
  *((void *)v14 + 2) = 0;
  *((void *)v14 + 3) = 0;
  *((void *)v14 + 4) = a2;
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(&v14[v13], (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  *(void *)&v14[(v8 + v13 + 7) & 0xFFFFFFFFFFFFFFF8] = a1;
  swift_retain();
  swift_retain();
  sub_1D58AAC84((uint64_t)v11, (uint64_t)&unk_1EA7235E8, (uint64_t)v14);
  return swift_release();
}

uint64_t sub_1D58B5118(uint64_t a1)
{
  return sub_1D58B4F20(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_1D58B5120(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(void *)(v6 + 16) = a6;
  uint64_t v10 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)a4 + 120) + **(int **)(*(void *)a4 + 120));
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v6 + 24) = v8;
  void *v8 = v6;
  v8[1] = sub_1D58B5230;
  return v10(a5);
}

uint64_t sub_1D58B5230()
{
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_1D58B532C, 0, 0);
}

uint64_t sub_1D58B532C()
{
  MEMORY[0x1D9453280]();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1D58B538C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1D58CCBF0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_1D58CCBE0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_1D58AC5C4(a1, &qword_1EB786C48);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1D58CCBB0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA7234E8);
  return swift_task_create();
}

uint64_t sub_1D58B5664(uint64_t a1)
{
  v2[21] = a1;
  v2[22] = v1;
  uint64_t v3 = sub_1D58CC990();
  v2[23] = v3;
  v2[24] = *(void *)(v3 - 8);
  v2[25] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1D58B5724, v1, 0);
}

uint64_t sub_1D58B5724()
{
  id v1 = objc_msgSend(self, sel_defaultStore);
  v0[26] = v1;
  if (v1)
  {
    uint64_t v2 = v1;
    v0[2] = v0;
    v0[7] = v0 + 20;
    v0[3] = sub_1D58B584C;
    uint64_t v3 = swift_continuation_init();
    v0[10] = MEMORY[0x1E4F143A8];
    v0[11] = 0x40000000;
    v0[12] = sub_1D58B5E70;
    v0[13] = &block_descriptor;
    v0[14] = v3;
    objc_msgSend(v2, sel_aa_primaryAppleAccountWithCompletion_, v0 + 10);
    id v1 = v0 + 2;
  }
  else
  {
    __break(1u);
  }
  return MEMORY[0x1F41881E8](v1);
}

uint64_t sub_1D58B584C()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 48);
  *(void *)(*v0 + 216) = v2;
  uint64_t v3 = *(void *)(v1 + 176);
  if (v2) {
    uint64_t v4 = sub_1D58B5D34;
  }
  else {
    uint64_t v4 = sub_1D58B596C;
  }
  return MEMORY[0x1F4188298](v4, v3, 0);
}

uint64_t sub_1D58B596C()
{
  uint64_t v1 = (void *)v0[26];
  uint64_t v2 = (void *)v0[20];
  v0[28] = v2;

  if (v2)
  {
    uint64_t v3 = v0[22];
    uint64_t v4 = type metadata accessor for ICQLiftUIDataSource();
    id v5 = ICQLiftUIDataSource.__allocating_init(account:)((uint64_t)v2);
    v0[18] = v4;
    v0[19] = &off_1F2DCD378;
    v0[15] = v5;
    id v20 = (uint64_t (*)(uint64_t, void *))(*(void *)(*(void *)v3 + 128)
                                                    + **(int **)(*(void *)v3 + 128));
    uint64_t v6 = (void *)swift_task_alloc();
    v0[29] = v6;
    *uint64_t v6 = v0;
    v6[1] = sub_1D58B5BB0;
    uint64_t v7 = v0[21];
    return v20(v7, v0 + 15);
  }
  else
  {
    uint64_t v10 = v0[24];
    uint64_t v9 = v0[25];
    uint64_t v11 = v0[23];
    uint64_t v12 = sub_1D58BE804();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v9, v12, v11);
    unint64_t v13 = sub_1D58CC980();
    os_log_type_t v14 = sub_1D58CCC80();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl(&dword_1D5851000, v13, v14, "LiftUI cache failed to get primary account", v15, 2u);
      MEMORY[0x1D9454520](v15, -1, -1);
    }
    uint64_t v17 = v0[24];
    uint64_t v16 = v0[25];
    uint64_t v18 = v0[23];

    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v16, v18);
    swift_task_dealloc();
    id v19 = (uint64_t (*)(void))v0[1];
    return v19();
  }
}

uint64_t sub_1D58B5BB0()
{
  uint64_t v1 = *(void *)v0 + 120;
  uint64_t v2 = *(void *)(*(void *)v0 + 176);
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_0(v1);
  return MEMORY[0x1F4188298](sub_1D58B5CCC, v2, 0);
}

uint64_t sub_1D58B5CCC()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1D58B5D34()
{
  uint64_t v1 = (void *)v0[26];
  uint64_t v2 = (void *)v0[27];
  swift_willThrow();

  uint64_t v4 = v0[24];
  uint64_t v3 = v0[25];
  uint64_t v5 = v0[23];
  uint64_t v6 = sub_1D58BE804();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v3, v6, v5);
  uint64_t v7 = sub_1D58CC980();
  os_log_type_t v8 = sub_1D58CCC80();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_1D5851000, v7, v8, "LiftUI cache failed to get primary account", v9, 2u);
    MEMORY[0x1D9454520](v9, -1, -1);
  }
  uint64_t v11 = v0[24];
  uint64_t v10 = v0[25];
  uint64_t v12 = v0[23];

  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
  swift_task_dealloc();
  unint64_t v13 = (uint64_t (*)(void))v0[1];
  return v13();
}

uint64_t sub_1D58B5E70(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB786C60);
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = a3;
    id v7 = a3;
    return MEMORY[0x1F4188208](v3, v5);
  }
  else
  {
    uint64_t v11 = a2;
    uint64_t v8 = *(void *)(*(void *)(v3 + 64) + 40);
    id v9 = a2;
    sub_1D58BE3B4((uint64_t)&v11, v8);
    return swift_continuation_throwingResume();
  }
}

uint64_t sub_1D58B5F34(uint64_t a1, uint64_t a2)
{
  v3[31] = a2;
  v3[32] = v2;
  v3[30] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA723498);
  v3[33] = swift_task_alloc();
  uint64_t v4 = sub_1D58CC5E0();
  v3[34] = v4;
  v3[35] = *(void *)(v4 - 8);
  v3[36] = swift_task_alloc();
  uint64_t v5 = sub_1D58CC690();
  v3[37] = v5;
  v3[38] = *(void *)(v5 - 8);
  v3[39] = swift_task_alloc();
  uint64_t v6 = sub_1D58CC7C0();
  v3[40] = v6;
  v3[41] = *(void *)(v6 - 8);
  v3[42] = swift_task_alloc();
  uint64_t v7 = sub_1D58CC990();
  v3[43] = v7;
  v3[44] = *(void *)(v7 - 8);
  v3[45] = swift_task_alloc();
  v3[46] = swift_task_alloc();
  v3[47] = swift_task_alloc();
  v3[48] = swift_task_alloc();
  v3[49] = swift_task_alloc();
  v3[50] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA7234A0);
  v3[51] = swift_task_alloc();
  v3[52] = swift_task_alloc();
  uint64_t v8 = sub_1D58CC700();
  v3[53] = v8;
  v3[54] = *(void *)(v8 - 8);
  v3[55] = swift_task_alloc();
  v3[56] = swift_task_alloc();
  v3[57] = swift_task_alloc();
  v3[58] = swift_task_alloc();
  v3[59] = swift_task_alloc();
  v3[60] = swift_task_alloc();
  v3[61] = swift_task_alloc();
  v3[62] = swift_task_alloc();
  v3[63] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1D58B627C, v2, 0);
}

uint64_t sub_1D58B627C()
{
  v152 = v0;
  uint64_t v1 = (void *)v0[32];
  uint64_t v2 = v1[17];
  uint64_t v3 = v1[18];
  __swift_project_boxed_opaque_existential_0(v1 + 14, v2);
  uint64_t v4 = (*(uint64_t (**)(unint64_t, unint64_t, uint64_t, uint64_t))(v3 + 8))(0xD000000000000013, 0x80000001D58DA0D0, v2, v3);
  if (!v4) {
    goto LABEL_9;
  }
  unint64_t v5 = sub_1D58B81A4(v4);
  swift_bridgeObjectRelease();
  if (!v5) {
    goto LABEL_9;
  }
  unint64_t v150 = v5;
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_1D58CC6A0();
  if (!*(void *)(v5 + 16) || (sub_1D58ACB44(v6, v7), (v8 & 1) == 0))
  {
    swift_bridgeObjectRelease_n();
LABEL_8:
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  uint64_t v9 = v0[54];
  uint64_t v145 = v0[53];
  uint64_t v10 = v0[52];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1D58CC6E0();
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v10, 1, v145) == 1)
  {
    uint64_t v11 = v0[52];
    swift_bridgeObjectRelease();
    sub_1D58AC5C4(v11, &qword_1EA7234A0);
    goto LABEL_9;
  }
  uint64_t v87 = (void *)v0[32];
  (*(void (**)(void, void, void))(v0[54] + 32))(v0[63], v0[52], v0[53]);
  uint64_t v88 = v87 + 19;
  uint64_t v89 = v87[22];
  uint64_t v90 = v87[23];
  __swift_project_boxed_opaque_existential_0(v88, v89);
  uint64_t v91 = sub_1D58CC6D0();
  char v92 = (*(uint64_t (**)(uint64_t))(v90 + 24))(v91);
  swift_bridgeObjectRelease();
  if ((v92 & 1) == 0)
  {
    (*(void (**)(void, void))(v0[54] + 8))(v0[63], v0[53]);
    goto LABEL_8;
  }
  uint64_t v140 = (uint64_t)(v0 + 12);
  uint64_t v148 = v0[62];
  uint64_t v93 = v0[53];
  uint64_t v94 = v0[54];
  uint64_t v95 = v0[50];
  uint64_t v97 = v0[43];
  uint64_t v96 = v0[44];
  uint64_t v98 = v0[30];
  uint64_t v99 = sub_1D58BE804();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v96 + 16))(v95, v99, v97);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v94 + 16))(v148, v98, v93);
  uint64_t v100 = sub_1D58CC980();
  os_log_type_t v101 = sub_1D58CCC60();
  BOOL v102 = os_log_type_enabled(v100, v101);
  uint64_t v103 = v0[62];
  uint64_t v104 = v0[54];
  uint64_t v105 = v0[50];
  uint64_t v106 = v0[44];
  uint64_t v149 = v0[43];
  if (v102)
  {
    uint64_t v129 = v0[53];
    uint64_t v136 = v0[50];
    int v107 = (uint8_t *)swift_slowAlloc();
    uint64_t v131 = swift_slowAlloc();
    v151[0] = v131;
    os_log_type_t typea = v101;
    *(_DWORD *)int v107 = 136315138;
    uint64_t v108 = sub_1D58CC6A0();
    v0[29] = sub_1D58A7680(v108, v109, v151);
    sub_1D58CCD00();
    swift_bridgeObjectRelease();
    unint64_t v110 = *(void (**)(uint64_t, uint64_t))(v104 + 8);
    v110(v103, v129);
    _os_log_impl(&dword_1D5851000, v100, typea, "LiftUI cache exists for %s deleting", v107, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1D9454520](v131, -1, -1);
    MEMORY[0x1D9454520](v107, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v106 + 8))(v136, v149);
  }
  else
  {
    unint64_t v110 = *(void (**)(uint64_t, uint64_t))(v104 + 8);
    v110(v103, v0[53]);

    (*(void (**)(uint64_t, uint64_t))(v106 + 8))(v105, v149);
  }
  sub_1D58BC62C(v0[63]);
  uint64_t v111 = v0[63];
  uint64_t v112 = v0[53];
  uint64_t v113 = sub_1D58CC6A0();
  sub_1D58BBD00(v113, v114);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v115 = v1[17];
  uint64_t v116 = v1[18];
  __swift_project_boxed_opaque_existential_0(v1 + 14, v115);
  v0[15] = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA7234C8);
  v0[12] = v150;
  (*(void (**)(uint64_t, unint64_t, unint64_t, uint64_t, uint64_t))(v116 + 16))(v140, 0xD000000000000013, 0x80000001D58DA0D0, v115, v116);
  v110(v111, v112);
  sub_1D58AC5C4(v140, &qword_1EB786C68);
LABEL_9:
  uint64_t v12 = v0[49];
  uint64_t v13 = v0[44];
  uint64_t v14 = sub_1D58BE804();
  v0[64] = v14;
  uint64_t v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16);
  v0[65] = v15;
  v0[66] = (v13 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  uint64_t v130 = v14;
  v128 = v15;
  ((void (*)(uint64_t))v15)(v12);
  uint64_t v16 = sub_1D58CC980();
  os_log_type_t v17 = sub_1D58CCC60();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v18 = 0;
    _os_log_impl(&dword_1D5851000, v16, v17, "LiftUI cache creating path URL", v18, 2u);
    MEMORY[0x1D9454520](v18, -1, -1);
  }
  uint64_t v19 = v0[54];
  uint64_t v141 = v0[53];
  uint64_t v137 = v0[51];
  uint64_t v20 = v0[49];
  uint64_t v22 = v0[43];
  uint64_t v21 = v0[44];
  uint64_t v23 = v0[41];
  uint64_t v24 = v0[42];
  uint64_t v25 = v0[40];
  uint64_t v26 = (void *)v0[32];

  unint64_t v27 = *(void (**)(uint64_t, uint64_t))(v21 + 8);
  v0[67] = v27;
  v0[68] = (v21 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  type = v27;
  v27(v20, v22);
  sub_1D58CC7B0();
  uint64_t v125 = sub_1D58CC7A0();
  uint64_t v133 = v28;
  (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v24, v25);
  uint64_t v29 = v26[22];
  uint64_t v30 = v26[23];
  __swift_project_boxed_opaque_existential_0(v26 + 19, v29);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v19 + 56))(v137, 1, 1, v141);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v30 + 8))(9, 1, v137, 1, v29, v30);
  uint64_t v142 = v26 + 19;
  v146 = v26;
  uint64_t v119 = v0[60];
  uint64_t v138 = v0[59];
  uint64_t v31 = v0[54];
  uint64_t v123 = v0[53];
  uint64_t v120 = v0[48];
  uint64_t v121 = v0[43];
  uint64_t v32 = v0[38];
  uint64_t v33 = v0[39];
  uint64_t v34 = v0[37];
  sub_1D58AC5C4(v0[51], &qword_1EA7234A0);
  v0[20] = 0x2F69757466696CLL;
  v0[21] = 0xE700000000000000;
  unsigned int v118 = *MEMORY[0x1E4F276C0];
  uint64_t v117 = *(void (**)(uint64_t))(v32 + 104);
  v117(v33);
  sub_1D58BBCAC();
  sub_1D58CC6F0();
  uint64_t v35 = *(void (**)(uint64_t, uint64_t))(v32 + 8);
  v35(v33, v34);
  swift_bridgeObjectRelease();
  v0[22] = v125;
  v0[23] = v133;
  ((void (*)(uint64_t, void, uint64_t))v117)(v33, v118, v34);
  sub_1D58CC6F0();
  v35(v33, v34);
  swift_bridgeObjectRelease();
  v128(v120, v130, v121);
  uint64_t v36 = *(void (**)(uint64_t, uint64_t, uint64_t))(v31 + 16);
  v0[69] = v36;
  v0[70] = (v31 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  uint64_t v37 = v36;
  v36(v138, v119, v123);
  unint64_t v38 = sub_1D58CC980();
  os_log_type_t v39 = sub_1D58CCC60();
  BOOL v40 = os_log_type_enabled(v38, v39);
  uint64_t v41 = v0[59];
  uint64_t v42 = v0[54];
  uint64_t v43 = v0[48];
  uint64_t v44 = v0[43];
  if (v40)
  {
    uint64_t v134 = v0[43];
    uint64_t v122 = v0[53];
    uint64_t v45 = (uint8_t *)swift_slowAlloc();
    uint64_t v124 = swift_slowAlloc();
    v151[0] = v124;
    *(_DWORD *)uint64_t v45 = 136315138;
    uint64_t v46 = sub_1D58CC6A0();
    v0[27] = sub_1D58A7680(v46, v47, v151);
    sub_1D58CCD00();
    swift_bridgeObjectRelease();
    uint64_t v48 = *(void (**)(uint64_t, uint64_t))(v42 + 8);
    v48(v41, v122);
    _os_log_impl(&dword_1D5851000, v38, v39, "LiftUI cache path url: %s", v45, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1D9454520](v124, -1, -1);
    MEMORY[0x1D9454520](v45, -1, -1);

    uint64_t v49 = v43;
    uint64_t v50 = v134;
  }
  else
  {
    uint64_t v48 = *(void (**)(uint64_t, uint64_t))(v42 + 8);
    v48(v0[59], v0[53]);

    uint64_t v49 = v43;
    uint64_t v50 = v44;
  }
  type(v49, v50);
  v0[71] = v48;
  uint64_t v51 = v0[58];
  uint64_t v52 = v146[22];
  uint64_t v53 = v146[23];
  __swift_project_boxed_opaque_existential_0(v142, v52);
  (*(void (**)(uint64_t, uint64_t, void, uint64_t, uint64_t))(v53 + 16))(v51, 1, 0, v52, v53);
  uint64_t v55 = v0[30];
  uint64_t v54 = (void *)v0[31];
  uint64_t v56 = v54[3];
  uint64_t v57 = v54[4];
  __swift_project_boxed_opaque_existential_0(v54, v56);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v57 + 8))(v55, v56, v57);
  uint64_t v58 = v0[34];
  uint64_t v59 = v0[35];
  uint64_t v60 = v0[33];
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v59 + 56))(v60, 0, 1, v58);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v59 + 48))(v60, 1, v58) == 1)
  {
    uint64_t v147 = v48;
    uint64_t v61 = v0[56];
    uint64_t v62 = v0[53];
    uint64_t v63 = v0[46];
    uint64_t v64 = v0[43];
    uint64_t v65 = v0[30];
    sub_1D58AC5C4(v0[33], &qword_1EA723498);
    v128(v63, v130, v64);
    v37(v61, v65, v62);
    double v66 = sub_1D58CC980();
    os_log_type_t v67 = sub_1D58CCC70();
    BOOL v68 = os_log_type_enabled(v66, v67);
    uint64_t v70 = v0[60];
    uint64_t v69 = v0[61];
    uint64_t v71 = v0[58];
    uint64_t v72 = v0[56];
    uint64_t v73 = v0[53];
    uint64_t v74 = v0[46];
    if (v68)
    {
      uint64_t v139 = v0[43];
      uint64_t v143 = v0[60];
      os_log_t log = (os_log_t)v0[46];
      long long v75 = (uint8_t *)swift_slowAlloc();
      uint64_t v135 = v71;
      uint64_t v76 = swift_slowAlloc();
      v151[0] = v76;
      *(_DWORD *)long long v75 = 136315138;
      sub_1D58BE6FC(&qword_1EA7234A8, 255, MEMORY[0x1E4F276F0]);
      uint64_t v77 = sub_1D58CCE60();
      v0[26] = sub_1D58A7680(v77, v78, v151);
      sub_1D58CCD00();
      swift_bridgeObjectRelease();
      v147(v72, v73);
      _os_log_impl(&dword_1D5851000, v66, v67, "Failed to build LiftUI request for %s", v75, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1D9454520](v76, -1, -1);
      MEMORY[0x1D9454520](v75, -1, -1);

      type((uint64_t)log, v139);
      v147(v143, v73);
      v147(v135, v73);
    }
    else
    {
      uint64_t v79 = v0[43];

      v147(v72, v73);
      type(v74, v79);
      v147(v70, v73);
      v147(v71, v73);
    }
    v147(v69, v73);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v80 = (uint64_t (*)(void))v0[1];
    return v80();
  }
  else
  {
    uint64_t v82 = (void *)v0[31];
    (*(void (**)(void, void, void))(v0[35] + 32))(v0[36], v0[33], v0[34]);
    uint64_t v84 = v54[3];
    uint64_t v83 = v54[4];
    __swift_project_boxed_opaque_existential_0(v82, v84);
    uint64_t v144 = (uint64_t (*)(void *, uint64_t, uint64_t, uint64_t))(*(void *)(v83 + 16) + **(int **)(v83 + 16));
    uint64_t v85 = (void *)swift_task_alloc();
    v0[72] = v85;
    *uint64_t v85 = v0;
    v85[1] = sub_1D58B74E4;
    uint64_t v86 = v0[36];
    return v144(v0 + 2, v86, v84, v83);
  }
}

uint64_t sub_1D58B74E4()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 584) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 256);
  if (v0)
  {

    uint64_t v4 = sub_1D58B7D04;
  }
  else
  {
    uint64_t v4 = sub_1D58B761C;
  }
  return MEMORY[0x1F4188298](v4, v3, 0);
}

uint64_t sub_1D58B761C()
{
  uint64_t v60 = v0;
  uint64_t v1 = *(void **)(v0 + 584);
  uint64_t v2 = *(void *)(v0 + 480);
  sub_1D58AE7CC((long long *)(v0 + 16), v0 + 56);
  uint64_t v3 = *(void *)(v0 + 80);
  uint64_t v4 = *(void *)(v0 + 88);
  __swift_project_boxed_opaque_existential_0((void *)(v0 + 56), v3);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v4 + 8))(v2, 0, v3, v4);
  if (v1)
  {
    unint64_t v5 = *(void (**)(uint64_t, uint64_t))(v0 + 568);
    uint64_t v7 = *(void *)(v0 + 480);
    uint64_t v6 = *(void *)(v0 + 488);
    uint64_t v8 = *(void *)(v0 + 464);
    uint64_t v9 = *(void *)(v0 + 424);
    (*(void (**)(void, void))(*(void *)(v0 + 280) + 8))(*(void *)(v0 + 288), *(void *)(v0 + 272));
    v5(v7, v9);
    v5(v8, v9);
    v5(v6, v9);
    __swift_destroy_boxed_opaque_existential_0(v0 + 56);
    uint64_t v11 = *(void *)(v0 + 432);
    uint64_t v10 = *(void *)(v0 + 440);
    uint64_t v12 = *(void *)(v0 + 424);
    uint64_t v13 = *(void *)(v0 + 240);
    (*(void (**)(void, void, void))(v0 + 520))(*(void *)(v0 + 360), *(void *)(v0 + 512), *(void *)(v0 + 344));
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v10, v13, v12);
    id v14 = v1;
    id v15 = v1;
    uint64_t v16 = sub_1D58CC980();
    os_log_type_t v17 = sub_1D58CCC70();
    BOOL v18 = os_log_type_enabled(v16, v17);
    uint64_t v19 = *(void (**)(uint64_t, uint64_t))(v0 + 536);
    uint64_t v21 = *(void *)(v0 + 432);
    uint64_t v20 = *(void *)(v0 + 440);
    uint64_t v22 = *(void *)(v0 + 424);
    uint64_t v23 = *(void *)(v0 + 360);
    uint64_t v58 = *(void *)(v0 + 344);
    if (v18)
    {
      uint64_t v57 = *(void (**)(uint64_t, uint64_t))(v0 + 536);
      uint64_t v24 = swift_slowAlloc();
      uint64_t v51 = (void *)swift_slowAlloc();
      uint64_t v54 = swift_slowAlloc();
      unint64_t v59 = v54;
      *(_DWORD *)uint64_t v24 = 136315394;
      sub_1D58BE6FC(&qword_1EA7234A8, 255, MEMORY[0x1E4F276F0]);
      uint64_t v25 = sub_1D58CCE60();
      *(void *)(v0 + 192) = sub_1D58A7680(v25, v26, (uint64_t *)&v59);
      sub_1D58CCD00();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v20, v22);
      *(_WORD *)(v24 + 12) = 2112;
      id v27 = v1;
      uint64_t v28 = _swift_stdlib_bridgeErrorToNSError();
      *(void *)(v0 + 224) = v28;
      sub_1D58CCD00();
      *uint64_t v51 = v28;

      _os_log_impl(&dword_1D5851000, v16, v17, "Failed to save LiftUI content at %s with error: %@", (uint8_t *)v24, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EA7234B0);
      swift_arrayDestroy();
      MEMORY[0x1D9454520](v51, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x1D9454520](v54, -1, -1);
      MEMORY[0x1D9454520](v24, -1, -1);

      v57(v23, v58);
    }
    else
    {

      (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v20, v22);
      v19(v23, v58);
    }
  }
  else
  {
    uint64_t v29 = *(void **)(v0 + 256);
    uint64_t v30 = v29[17];
    uint64_t v31 = v29[18];
    __swift_project_boxed_opaque_existential_0(v29 + 14, v30);
    uint64_t v32 = (*(uint64_t (**)(unint64_t, unint64_t, uint64_t, uint64_t))(v31 + 8))(0xD000000000000013, 0x80000001D58DA0D0, v30, v31);
    if (!v32 || (unint64_t v33 = sub_1D58B81A4(v32), swift_bridgeObjectRelease(), !v33))
    {
      unint64_t v33 = sub_1D58B8524(MEMORY[0x1E4FBC860]);
      swift_bridgeObjectRelease();
    }
    uint64_t v56 = *(void *)(v0 + 488);
    uint64_t v53 = *(void (**)(uint64_t, uint64_t))(v0 + 568);
    uint64_t v55 = *(void *)(v0 + 464);
    uint64_t v52 = *(void *)(v0 + 424);
    uint64_t v34 = *(void *)(v0 + 280);
    uint64_t v50 = *(void *)(v0 + 288);
    uint64_t v48 = *(void *)(v0 + 480);
    uint64_t v49 = *(void *)(v0 + 272);
    uint64_t v35 = *(void **)(v0 + 256);
    uint64_t v36 = sub_1D58CC6A0();
    uint64_t v38 = v37;
    uint64_t v39 = sub_1D58CC6A0();
    uint64_t v41 = v40;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v59 = v33;
    sub_1D58BC2E8(v39, v41, v36, v38, isUniquelyReferenced_nonNull_native);
    unint64_t v43 = v33;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v44 = v35[17];
    uint64_t v45 = v35[18];
    __swift_project_boxed_opaque_existential_0(v35 + 14, v44);
    *(void *)(v0 + 152) = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA7234C8);
    *(void *)(v0 + 128) = v43;
    (*(void (**)(uint64_t, unint64_t, unint64_t, uint64_t, uint64_t))(v45 + 16))(v0 + 128, 0xD000000000000013, 0x80000001D58DA0D0, v44, v45);
    (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v50, v49);
    v53(v48, v52);
    v53(v55, v52);
    v53(v56, v52);
    sub_1D58AC5C4(v0 + 128, &qword_1EB786C68);
    __swift_destroy_boxed_opaque_existential_0(v0 + 56);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v46 = *(uint64_t (**)(void))(v0 + 8);
  return v46();
}

uint64_t sub_1D58B7D04()
{
  uint64_t v43 = v0;
  *(_OWORD *)(v0 + 16) = 0u;
  uint64_t v1 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 552);
  uint64_t v2 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 520);
  uint64_t v3 = *(void *)(v0 + 512);
  uint64_t v4 = *(void *)(v0 + 456);
  uint64_t v5 = *(void *)(v0 + 424);
  uint64_t v6 = *(void *)(v0 + 376);
  uint64_t v7 = *(void *)(v0 + 344);
  uint64_t v8 = *(void *)(v0 + 240);
  *(_OWORD *)(v0 + 32) = 0u;
  *(void *)(v0 + 48) = 0;
  sub_1D58AC5C4(v0 + 16, &qword_1EA7234C0);
  v2(v6, v3, v7);
  v1(v4, v8, v5);
  uint64_t v9 = sub_1D58CC980();
  os_log_type_t v10 = sub_1D58CCC70();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v34 = *(void (**)(uint64_t, uint64_t))(v0 + 536);
    uint64_t v36 = *(void *)(v0 + 480);
    uint64_t v11 = *(void *)(v0 + 456);
    uint64_t v38 = *(void *)(v0 + 464);
    uint64_t v40 = *(void *)(v0 + 488);
    uint64_t v12 = *(void *)(v0 + 424);
    uint64_t v28 = *(void (**)(uint64_t, uint64_t))(v0 + 568);
    uint64_t v29 = *(void *)(v0 + 344);
    uint64_t v30 = *(void *)(v0 + 376);
    uint64_t v31 = *(void *)(v0 + 280);
    uint64_t v32 = *(void *)(v0 + 272);
    uint64_t v33 = *(void *)(v0 + 288);
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    uint64_t v42 = v14;
    *(_DWORD *)uint64_t v13 = 136315138;
    sub_1D58BE6FC(&qword_1EA7234A8, 255, MEMORY[0x1E4F276F0]);
    uint64_t v15 = sub_1D58CCE60();
    *(void *)(v0 + 200) = sub_1D58A7680(v15, v16, &v42);
    sub_1D58CCD00();
    swift_bridgeObjectRelease();
    v28(v11, v12);
    _os_log_impl(&dword_1D5851000, v9, v10, "Failed to fetch LiftUI content at %s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1D9454520](v14, -1, -1);
    MEMORY[0x1D9454520](v13, -1, -1);

    v34(v30, v29);
    (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v33, v32);
    v28(v36, v12);
    v28(v38, v12);
    v28(v40, v12);
  }
  else
  {
    os_log_type_t v17 = *(void (**)(uint64_t, uint64_t))(v0 + 568);
    uint64_t v35 = *(void (**)(uint64_t, uint64_t))(v0 + 536);
    uint64_t v37 = *(void *)(v0 + 480);
    uint64_t v18 = *(void *)(v0 + 456);
    uint64_t v39 = *(void *)(v0 + 464);
    uint64_t v41 = *(void *)(v0 + 488);
    uint64_t v19 = *(void *)(v0 + 424);
    uint64_t v20 = *(void *)(v0 + 376);
    uint64_t v21 = *(void *)(v0 + 344);
    uint64_t v22 = v9;
    uint64_t v23 = *(void *)(v0 + 280);
    uint64_t v24 = *(void *)(v0 + 288);
    uint64_t v25 = *(void *)(v0 + 272);

    v17(v18, v19);
    v35(v20, v21);
    (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v24, v25);
    v17(v37, v19);
    v17(v39, v19);
    v17(v41, v19);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v26 = *(uint64_t (**)(void))(v0 + 8);
  return v26();
}

unint64_t sub_1D58B81A4(uint64_t a1)
{
  uint64_t v1 = a1;
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA7235C0);
    uint64_t v2 = (void *)sub_1D58CCDE0();
  }
  else
  {
    uint64_t v2 = (void *)MEMORY[0x1E4FBC868];
  }
  uint64_t v31 = v1 + 64;
  uint64_t v3 = -1;
  uint64_t v4 = -1 << *(unsigned char *)(v1 + 32);
  if (-v4 < 64) {
    uint64_t v3 = ~(-1 << -(char)v4);
  }
  unint64_t v5 = v3 & *(void *)(v1 + 64);
  int64_t v30 = (unint64_t)(63 - v4) >> 6;
  uint64_t v6 = &v38;
  unint64_t result = swift_bridgeObjectRetain();
  int64_t v8 = 0;
  uint64_t v9 = (uint64_t *)&unk_1EA7235D0;
  while (1)
  {
    if (v5)
    {
      uint64_t v33 = (v5 - 1) & v5;
      unint64_t v16 = __clz(__rbit64(v5)) | (v8 << 6);
      int64_t v17 = v8;
    }
    else
    {
      int64_t v18 = v8 + 1;
      if (__OFADD__(v8, 1)) {
        goto LABEL_37;
      }
      if (v18 >= v30)
      {
LABEL_33:
        sub_1D58BE3AC();
        return (unint64_t)v2;
      }
      unint64_t v19 = *(void *)(v31 + 8 * v18);
      int64_t v17 = v8 + 1;
      if (!v19)
      {
        int64_t v17 = v8 + 2;
        if (v8 + 2 >= v30) {
          goto LABEL_33;
        }
        unint64_t v19 = *(void *)(v31 + 8 * v17);
        if (!v19)
        {
          int64_t v17 = v8 + 3;
          if (v8 + 3 >= v30) {
            goto LABEL_33;
          }
          unint64_t v19 = *(void *)(v31 + 8 * v17);
          if (!v19)
          {
            int64_t v17 = v8 + 4;
            if (v8 + 4 >= v30) {
              goto LABEL_33;
            }
            unint64_t v19 = *(void *)(v31 + 8 * v17);
            if (!v19)
            {
              int64_t v20 = v8 + 5;
              if (v8 + 5 >= v30) {
                goto LABEL_33;
              }
              unint64_t v19 = *(void *)(v31 + 8 * v20);
              if (!v19)
              {
                while (1)
                {
                  int64_t v17 = v20 + 1;
                  if (__OFADD__(v20, 1)) {
                    goto LABEL_38;
                  }
                  if (v17 >= v30) {
                    goto LABEL_33;
                  }
                  unint64_t v19 = *(void *)(v31 + 8 * v17);
                  ++v20;
                  if (v19) {
                    goto LABEL_26;
                  }
                }
              }
              int64_t v17 = v8 + 5;
            }
          }
        }
      }
LABEL_26:
      uint64_t v33 = (v19 - 1) & v19;
      unint64_t v16 = __clz(__rbit64(v19)) + (v17 << 6);
    }
    uint64_t v21 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v16);
    uint64_t v23 = *v21;
    uint64_t v22 = v21[1];
    sub_1D58A8CD4(*(void *)(v1 + 56) + 32 * v16, (uint64_t)v6);
    v37[0] = v23;
    v37[1] = v22;
    sub_1D58A8CD4((uint64_t)v6, (uint64_t)v36);
    swift_bridgeObjectRetain_n();
    sub_1D58AC5C4((uint64_t)v37, v9);
    if (!swift_dynamicCast())
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_1D58BE3AC();
      swift_release();
      return 0;
    }
    int64_t v32 = v17;
    unint64_t result = sub_1D58ACB44(v23, v22);
    if (v24)
    {
      os_log_type_t v10 = v9;
      uint64_t v11 = 16 * result;
      uint64_t v12 = v6;
      uint64_t v13 = v1;
      uint64_t v14 = (uint64_t *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      *uint64_t v14 = v23;
      v14[1] = v22;
      uint64_t v15 = (void *)(v2[7] + v11);
      uint64_t v9 = v10;
      unint64_t result = swift_bridgeObjectRelease();
      *uint64_t v15 = v34;
      v15[1] = v35;
      uint64_t v1 = v13;
      uint64_t v6 = v12;
      goto LABEL_8;
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v25 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v25 = v23;
    v25[1] = v22;
    unint64_t v26 = (void *)(v2[7] + 16 * result);
    void *v26 = v34;
    v26[1] = v35;
    uint64_t v27 = v2[2];
    BOOL v28 = __OFADD__(v27, 1);
    uint64_t v29 = v27 + 1;
    if (v28) {
      goto LABEL_36;
    }
    v2[2] = v29;
LABEL_8:
    int64_t v8 = v32;
    unint64_t v5 = v33;
  }
  __break(1u);
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
  return result;
}

unint64_t sub_1D58B8524(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x1E4FBC868];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA7235C0);
  uint64_t v2 = (void *)sub_1D58CCDE0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    uint64_t v5 = *(v4 - 3);
    uint64_t v6 = *(v4 - 2);
    uint64_t v8 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_1D58ACB44(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v11 = v5;
    v11[1] = v6;
    uint64_t v12 = (void *)(v2[7] + 16 * result);
    *uint64_t v12 = v8;
    v12[1] = v7;
    uint64_t v13 = v2[2];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v4 += 4;
    v2[2] = v15;
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

uint64_t sub_1D58B8648(uint64_t a1)
{
  v2[4] = a1;
  v2[5] = v1;
  uint64_t v3 = sub_1D58CC700();
  v2[6] = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  v2[7] = v4;
  v2[8] = *(void *)(v4 + 64);
  v2[9] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB786C48);
  v2[10] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1D58B8740, 0, 0);
}

uint64_t sub_1D58B8740()
{
  uint64_t v2 = v0[9];
  uint64_t v1 = v0[10];
  uint64_t v3 = v0[7];
  uint64_t v5 = v0[5];
  uint64_t v4 = v0[6];
  uint64_t v6 = v0[4];
  uint64_t v7 = sub_1D58CCBF0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v1, 1, 1, v7);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v6, v4);
  unint64_t v8 = (*(unsigned __int8 *)(v3 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v9 = (char *)swift_allocObject();
  *((void *)v9 + 2) = 0;
  *((void *)v9 + 3) = 0;
  *((void *)v9 + 4) = v5;
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 32))(&v9[v8], v2, v4);
  swift_retain();
  uint64_t v10 = sub_1D58B538C(v1, (uint64_t)&unk_1EA7234E0, (uint64_t)v9);
  v0[11] = v10;
  uint64_t v11 = (void *)swift_task_alloc();
  v0[12] = v11;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA7234E8);
  *uint64_t v11 = v0;
  v11[1] = sub_1D58B88F8;
  return MEMORY[0x1F4187DC0](v0 + 2, v10, v12);
}

uint64_t sub_1D58B88F8()
{
  swift_task_dealloc();
  swift_release();
  return MEMORY[0x1F4188298](sub_1D58B8A10, 0, 0);
}

uint64_t sub_1D58B8A10()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = v0[3];
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(uint64_t, uint64_t))v0[1];
  return v3(v1, v2);
}

uint64_t sub_1D58B8A8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 16) = a1;
  uint64_t v9 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)a4 + 144) + **(int **)(*(void *)a4 + 144));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v5 + 24) = v7;
  *uint64_t v7 = v5;
  v7[1] = sub_1D58B8B9C;
  return v9(a5);
}

uint64_t sub_1D58B8B9C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 32) = a1;
  *(void *)(v3 + 40) = a2;
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_1D58B8C9C, 0, 0);
}

uint64_t sub_1D58B8C9C()
{
  *(_OWORD *)*(void *)(v0 + 16) = *(_OWORD *)(v0 + 32);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1D58B8E3C(uint64_t a1, const void *a2, uint64_t a3)
{
  v3[4] = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB786C48);
  void v3[5] = swift_task_alloc();
  uint64_t v5 = sub_1D58CC700();
  void v3[6] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  v3[7] = v6;
  v3[8] = *(void *)(v6 + 64);
  v3[9] = swift_task_alloc();
  v3[10] = swift_task_alloc();
  v3[11] = _Block_copy(a2);
  sub_1D58CC6C0();
  swift_retain();
  return MEMORY[0x1F4188298](sub_1D58B8F80, 0, 0);
}

uint64_t sub_1D58B8F80()
{
  uint64_t v2 = v0[9];
  uint64_t v1 = v0[10];
  uint64_t v3 = v0[7];
  uint64_t v4 = v0[5];
  uint64_t v5 = v0[6];
  uint64_t v6 = v0[4];
  uint64_t v7 = sub_1D58CCBF0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v4, 1, 1, v7);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v1, v5);
  unint64_t v8 = (*(unsigned __int8 *)(v3 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v9 = (char *)swift_allocObject();
  *((void *)v9 + 2) = 0;
  *((void *)v9 + 3) = 0;
  *((void *)v9 + 4) = v6;
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 32))(&v9[v8], v2, v5);
  swift_retain();
  uint64_t v10 = sub_1D58B538C(v4, (uint64_t)&unk_1EA723580, (uint64_t)v9);
  v0[12] = v10;
  uint64_t v11 = (void *)swift_task_alloc();
  v0[13] = v11;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA7234E8);
  *uint64_t v11 = v0;
  v11[1] = sub_1D58B9138;
  return MEMORY[0x1F4187DC0](v0 + 2, v10, v12);
}

uint64_t sub_1D58B9138()
{
  swift_task_dealloc();
  swift_release();
  return MEMORY[0x1F4188298](sub_1D58B9250, 0, 0);
}

uint64_t sub_1D58B9250()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = v0[6];
  uint64_t v3 = v0[7];
  swift_release();
  uint64_t v4 = v0[2];
  unint64_t v5 = v0[3];
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  if (v5 >> 60 == 15)
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = (void *)sub_1D58CC720();
    sub_1D58BE074(v4, v5);
  }
  uint64_t v7 = (void (**)(void, void))v0[11];
  ((void (**)(void, void *))v7)[2](v7, v6);

  _Block_release(v7);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_1D58B9358(uint64_t a1)
{
  v2[4] = a1;
  v2[5] = v1;
  uint64_t v3 = sub_1D58CC700();
  v2[6] = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  v2[7] = v4;
  v2[8] = *(void *)(v4 + 64);
  v2[9] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB786C48);
  v2[10] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1D58B9450, v1, 0);
}

uint64_t sub_1D58B9450()
{
  uint64_t v2 = v0[9];
  uint64_t v1 = v0[10];
  uint64_t v4 = v0[7];
  uint64_t v3 = v0[8];
  uint64_t v5 = v0[5];
  uint64_t v6 = v0[6];
  uint64_t v7 = v0[4];
  uint64_t v8 = sub_1D58CCBF0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v1, 1, 1, v8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v2, v7, v6);
  uint64_t v10 = sub_1D58BE6FC(&qword_1EA723500, v9, (void (*)(uint64_t))type metadata accessor for LiftUICache);
  unint64_t v11 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  unint64_t v12 = (v3 + v11 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v5;
  *(void *)(v13 + 24) = v10;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v4 + 32))(v13 + v11, v2, v6);
  *(void *)(v13 + v12) = v5;
  swift_retain_n();
  uint64_t v14 = sub_1D58BAB1C(v1, (uint64_t)&unk_1EA723508, v13);
  v0[11] = v14;
  uint64_t v15 = (void *)swift_task_alloc();
  v0[12] = v15;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB786C60);
  *uint64_t v15 = v0;
  v15[1] = sub_1D58B9664;
  uint64_t v17 = MEMORY[0x1E4F277C0];
  uint64_t v18 = MEMORY[0x1E4FBC0F0];
  return MEMORY[0x1F4187D90](v0 + 2, v14, v17, v16, v18);
}

uint64_t sub_1D58B9664()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 40);
  if (v0)
  {

    swift_release();
    uint64_t v4 = sub_1D58B983C;
  }
  else
  {
    swift_release();
    uint64_t v4 = sub_1D58B97C0;
  }
  return MEMORY[0x1F4188298](v4, v3, 0);
}

uint64_t sub_1D58B97C0()
{
  uint64_t v2 = v0[2];
  uint64_t v1 = v0[3];
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(uint64_t, uint64_t))v0[1];
  return v3(v2, v1);
}

uint64_t sub_1D58B983C()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void, unint64_t))(v0 + 8);
  return v1(0, 0xF000000000000000);
}

uint64_t sub_1D58B98AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[14] = a4;
  v5[15] = a5;
  v5[13] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA7234A0);
  v5[16] = swift_task_alloc();
  uint64_t v7 = sub_1D58CC700();
  v5[17] = v7;
  v5[18] = *(void *)(v7 - 8);
  v5[19] = swift_task_alloc();
  v5[20] = swift_task_alloc();
  v5[21] = swift_task_alloc();
  v5[22] = swift_task_alloc();
  v5[23] = swift_task_alloc();
  v5[24] = swift_task_alloc();
  uint64_t v8 = sub_1D58CC990();
  v5[25] = v8;
  v5[26] = *(void *)(v8 - 8);
  v5[27] = swift_task_alloc();
  v5[28] = swift_task_alloc();
  v5[29] = swift_task_alloc();
  v5[30] = swift_task_alloc();
  v5[31] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1D58B9A74, a5, 0);
}

uint64_t sub_1D58B9A74()
{
  unsigned int v118 = v0;
  uint64_t v1 = v0[31];
  uint64_t v2 = v0[26];
  uint64_t v3 = v0[24];
  uint64_t v4 = v0[17];
  uint64_t v5 = v0[18];
  uint64_t v6 = v0[14];
  uint64_t v107 = sub_1D58BE804();
  unint64_t v110 = *(void (**)(uint64_t))(v2 + 16);
  v110(v1);
  uint64_t v113 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  v113(v3, v6, v4);
  uint64_t v7 = sub_1D58CC980();
  os_log_type_t v8 = sub_1D58CCC60();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v101 = v0[31];
    uint64_t v9 = v0[24];
    uint64_t v99 = v0[26];
    uint64_t v100 = v0[25];
    uint64_t v10 = v0[17];
    uint64_t v11 = v0[18];
    unint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    v117[0] = v13;
    *(_DWORD *)unint64_t v12 = 136315138;
    sub_1D58BE6FC(&qword_1EA7234A8, 255, MEMORY[0x1E4F276F0]);
    uint64_t v14 = sub_1D58CCE60();
    v0[12] = sub_1D58A7680(v14, v15, v117);
    sub_1D58CCD00();
    swift_bridgeObjectRelease();
    uint64_t v106 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
    v106(v9, v10);
    _os_log_impl(&dword_1D5851000, v7, v8, "Fetching LiftUI content at %s", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1D9454520](v13, -1, -1);
    MEMORY[0x1D9454520](v12, -1, -1);

    uint64_t v16 = *(void (**)(uint64_t, uint64_t))(v99 + 8);
    v16(v101, v100);
  }
  else
  {
    uint64_t v17 = v0[31];
    uint64_t v18 = v0[25];
    uint64_t v19 = v0[26];
    uint64_t v106 = *(void (**)(uint64_t, uint64_t))(v0[18] + 8);
    v106(v0[24], v0[17]);

    uint64_t v16 = *(void (**)(uint64_t, uint64_t))(v19 + 8);
    v16(v17, v18);
  }
  uint64_t v20 = (void *)v0[15];
  uint64_t v21 = v20[17];
  uint64_t v22 = v20[18];
  BOOL v102 = v20;
  uint64_t v116 = v20 + 14;
  __swift_project_boxed_opaque_existential_0(v20 + 14, v21);
  uint64_t v23 = (*(uint64_t (**)(unint64_t, unint64_t, uint64_t, uint64_t))(v22 + 8))(0xD000000000000013, 0x80000001D58DA0D0, v21, v22);
  if (!v23 || (unint64_t v24 = sub_1D58B81A4(v23), swift_bridgeObjectRelease(), !v24))
  {
LABEL_11:
    uint64_t v31 = v0[20];
    uint64_t v32 = v0[17];
    uint64_t v33 = v0[14];
    ((void (*)(void, uint64_t, void))v110)(v0[28], v107, v0[25]);
    v113(v31, v33, v32);
    uint64_t v34 = sub_1D58CC980();
    os_log_type_t v35 = sub_1D58CCC60();
    BOOL v36 = os_log_type_enabled(v34, v35);
    uint64_t v37 = v0[28];
    uint64_t v38 = v0[25];
    uint64_t v39 = v0[20];
    uint64_t v40 = v0[17];
    if (v36)
    {
      uint64_t v111 = v0[25];
      uint64_t v41 = (uint8_t *)swift_slowAlloc();
      uint64_t v108 = v37;
      uint64_t v42 = swift_slowAlloc();
      v117[0] = v42;
      *(_DWORD *)uint64_t v41 = 136315138;
      sub_1D58BE6FC(&qword_1EA7234A8, 255, MEMORY[0x1E4F276F0]);
      uint64_t v43 = sub_1D58CCE60();
      v0[6] = sub_1D58A7680(v43, v44, v117);
      sub_1D58CCD00();
      swift_bridgeObjectRelease();
      v106(v39, v40);
      _os_log_impl(&dword_1D5851000, v34, v35, "No cached LiftUI data for %s", v41, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1D9454520](v42, -1, -1);
      MEMORY[0x1D9454520](v41, -1, -1);

      v16(v108, v111);
    }
    else
    {
      v106(v0[20], v0[17]);

      v16(v37, v38);
    }
    uint64_t v45 = v102[17];
    uint64_t v46 = v102[18];
    __swift_project_boxed_opaque_existential_0(v116, v45);
    uint64_t v47 = (*(uint64_t (**)(unint64_t, unint64_t, uint64_t, uint64_t))(v46 + 8))(0xD000000000000013, 0x80000001D58DA0D0, v45, v46);
    if (v47)
    {
      unint64_t v48 = sub_1D58B81A4(v47);
      swift_bridgeObjectRelease();
      if (v48)
      {
        v117[0] = v48;
        uint64_t v49 = sub_1D58CC6A0();
        sub_1D58BBD00(v49, v50);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v51 = v102[17];
        uint64_t v52 = v102[18];
        __swift_project_boxed_opaque_existential_0(v116, v51);
        uint64_t v53 = v117[0];
        v0[5] = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA7234C8);
        v0[2] = v53;
        (*(void (**)(void *, unint64_t, unint64_t, uint64_t, uint64_t))(v52 + 16))(v0 + 2, 0xD000000000000013, 0x80000001D58DA0D0, v51, v52);
        sub_1D58AC5C4((uint64_t)(v0 + 2), &qword_1EB786C68);
      }
    }
    sub_1D58BE248();
    swift_allocError();
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v54 = (uint64_t (*)(void))v0[1];
    goto LABEL_18;
  }
  uint64_t v25 = sub_1D58CC6A0();
  if (!*(void *)(v24 + 16) || (sub_1D58ACB44(v25, v26), (v27 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  uint64_t v28 = v0[17];
  uint64_t v29 = v0[18];
  uint64_t v30 = v0[16];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1D58CC6E0();
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v29 + 48))(v30, 1, v28) == 1)
  {
    sub_1D58AC5C4(v0[16], &qword_1EA7234A0);
    goto LABEL_11;
  }
  uint64_t v56 = v0[30];
  uint64_t v57 = v0[25];
  uint64_t v59 = v0[22];
  uint64_t v58 = v0[23];
  uint64_t v60 = v0[17];
  (*(void (**)(uint64_t, void, uint64_t))(v0[18] + 32))(v58, v0[16], v60);
  ((void (*)(uint64_t, uint64_t, uint64_t))v110)(v56, v107, v57);
  v113(v59, v58, v60);
  uint64_t v61 = sub_1D58CC980();
  os_log_type_t v62 = sub_1D58CCC60();
  BOOL v63 = os_log_type_enabled(v61, v62);
  uint64_t v64 = v0[30];
  uint64_t v104 = v0[25];
  uint64_t v65 = v0[22];
  uint64_t v66 = v0[17];
  if (v63)
  {
    os_log_type_t v67 = (uint8_t *)swift_slowAlloc();
    uint64_t v68 = swift_slowAlloc();
    v117[0] = v68;
    *(_DWORD *)os_log_type_t v67 = 136315138;
    sub_1D58BE6FC(&qword_1EA7234A8, 255, MEMORY[0x1E4F276F0]);
    uint64_t v69 = sub_1D58CCE60();
    v0[11] = sub_1D58A7680(v69, v70, v117);
    sub_1D58CCD00();
    swift_bridgeObjectRelease();
    v106(v65, v66);
    _os_log_impl(&dword_1D5851000, v61, v62, "Cache file path: %s", v67, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1D9454520](v68, -1, -1);
    MEMORY[0x1D9454520](v67, -1, -1);
  }
  else
  {
    v106(v65, v66);
  }

  v16(v64, v104);
  uint64_t v71 = v0[23];
  uint64_t v72 = (void *)v0[15];
  uint64_t v73 = v72[22];
  uint64_t v74 = v72[23];
  __swift_project_boxed_opaque_existential_0(v72 + 19, v73);
  uint64_t v75 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v74 + 32))(v71, v73, v74);
  unint64_t v77 = v76;
  uint64_t v78 = v0[21];
  uint64_t v79 = v0[17];
  uint64_t v80 = v0[14];
  uint64_t v81 = v75;
  ((void (*)(void, uint64_t, void))v110)(v0[29], v107, v0[25]);
  v113(v78, v80, v79);
  sub_1D58BE29C(v81, v77);
  uint64_t v82 = sub_1D58CC980();
  os_log_type_t v83 = sub_1D58CCC60();
  unint64_t v105 = v77;
  if (os_log_type_enabled(v82, v83))
  {
    uint64_t v84 = swift_slowAlloc();
    uint64_t v114 = swift_slowAlloc();
    v117[0] = v114;
    *(_DWORD *)uint64_t v84 = 134218242;
    uint64_t v85 = 0;
    switch(v77 >> 62)
    {
      case 1uLL:
        LODWORD(v85) = HIDWORD(v81) - v81;
        if (__OFSUB__(HIDWORD(v81), v81))
        {
          __break(1u);
LABEL_34:
          __break(1u);
          JUMPOUT(0x1D58BAB0CLL);
        }
        uint64_t v85 = (int)v85;
LABEL_31:
        uint64_t v103 = v0[25];
        uint64_t v109 = v0[29];
        uint64_t v112 = v0[23];
        uint64_t v93 = v0[21];
        unint64_t v94 = v77;
        uint64_t v95 = v0[17];
        v0[9] = v85;
        sub_1D58CCD00();
        sub_1D58BE088(v81, v94);
        *(_WORD *)(v84 + 12) = 2080;
        sub_1D58BE6FC(&qword_1EA7234A8, 255, MEMORY[0x1E4F276F0]);
        uint64_t v96 = sub_1D58CCE60();
        v0[10] = sub_1D58A7680(v96, v97, v117);
        sub_1D58CCD00();
        swift_bridgeObjectRelease();
        v106(v93, v95);
        _os_log_impl(&dword_1D5851000, v82, v83, "Fetched LiftUI content (%ld bytes) at %s", (uint8_t *)v84, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x1D9454520](v114, -1, -1);
        MEMORY[0x1D9454520](v84, -1, -1);

        v16(v109, v103);
        v106(v112, v95);
        break;
      case 2uLL:
        uint64_t v91 = *(void *)(v81 + 16);
        uint64_t v90 = *(void *)(v81 + 24);
        BOOL v92 = __OFSUB__(v90, v91);
        uint64_t v85 = v90 - v91;
        if (!v92) {
          goto LABEL_31;
        }
        goto LABEL_34;
      case 3uLL:
        goto LABEL_31;
      default:
        uint64_t v85 = BYTE6(v77);
        goto LABEL_31;
    }
  }
  else
  {
    uint64_t v86 = v0[29];
    uint64_t v87 = v0[25];
    uint64_t v115 = v0[23];
    uint64_t v88 = v0[21];
    uint64_t v89 = v0[17];

    v106(v88, v89);
    sub_1D58BE088(v81, v77);
    v16(v86, v87);
    v106(v115, v89);
  }
  uint64_t v98 = (uint64_t *)v0[13];
  *uint64_t v98 = v81;
  v98[1] = v105;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v54 = (uint64_t (*)(void))v0[1];
LABEL_18:
  return v54();
}

uint64_t sub_1D58BAB1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_1D58CCBF0();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_1D58CCBE0();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(void *)(a3 + 16)) {
      return swift_task_create();
    }
    goto LABEL_3;
  }
  sub_1D58AC5C4(a1, &qword_1EB786C48);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1D58CCBB0();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_1D58BACA0()
{
  return sub_1D58CC8B0();
}

uint64_t sub_1D58BACF8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB786C48);
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1D58CCBF0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  os_log_type_t v8 = (void *)swift_allocObject();
  _OWORD v8[2] = 0;
  v8[3] = 0;
  v8[4] = a2;
  v8[5] = a1;
  swift_retain();
  swift_retain();
  sub_1D58AAC84((uint64_t)v6, (uint64_t)&unk_1EA723598, (uint64_t)v8);
  return swift_release();
}

uint64_t sub_1D58BAE04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[2] = a4;
  void v5[3] = a5;
  uint64_t v6 = (*(void *)a4 + 160) & 0xFFFFFFFFFFFFLL | 0x654F000000000000;
  v5[4] = *(void *)(*(void *)a4 + 160);
  v5[5] = v6;
  return MEMORY[0x1F4188298](sub_1D58BAE40, a4, 0);
}

uint64_t sub_1D58BAE40()
{
  (*(void (**)(void))(v0 + 32))();
  return MEMORY[0x1F4188298](sub_1D58BAEAC, 0, 0);
}

uint64_t sub_1D58BAEAC()
{
  MEMORY[0x1D9453280]();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1D58BAF80()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1D58CC990();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = v0 + 14;
  uint64_t v7 = v0[17];
  uint64_t v8 = v0[18];
  __swift_project_boxed_opaque_existential_0(v0 + 14, v7);
  uint64_t v9 = (*(uint64_t (**)(unint64_t, unint64_t, uint64_t, uint64_t))(v8 + 8))(0xD000000000000013, 0x80000001D58DA0D0, v7, v8);
  if (v9 && (unint64_t v10 = sub_1D58B81A4(v9), swift_bridgeObjectRelease(), v10))
  {
    swift_retain();
    sub_1D58BD2D4(v10);
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v11 = v1[17];
    uint64_t v12 = v1[18];
    __swift_project_boxed_opaque_existential_0(v6, v11);
    return (*(uint64_t (**)(unint64_t, unint64_t, uint64_t, uint64_t))(v12 + 24))(0xD000000000000013, 0x80000001D58DA0D0, v11, v12);
  }
  else
  {
    uint64_t v14 = sub_1D58BE804();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v14, v2);
    unint64_t v15 = sub_1D58CC980();
    os_log_type_t v16 = sub_1D58CCC60();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl(&dword_1D5851000, v15, v16, "No cached LiftUI data to discard", v17, 2u);
      MEMORY[0x1D9454520](v17, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
}

id sub_1D58BB1B8(uint64_t a1)
{
  v11[1] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)sub_1D58CC6B0();
  v11[0] = 0;
  id v3 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_fileHandleForReadingFromURL_error_, v2, v11);

  id v4 = v11[0];
  if (v3)
  {
    uint64_t v5 = sub_1D58CC700();
    uint64_t v6 = *(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
    id v7 = v4;
    v6(a1, v5);
  }
  else
  {
    id v8 = v11[0];
    sub_1D58CC680();

    swift_willThrow();
    uint64_t v9 = sub_1D58CC700();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(a1, v9);
  }
  return v3;
}

uint64_t LiftUICache.deinit()
{
  __swift_destroy_boxed_opaque_existential_0(v0 + 112);
  __swift_destroy_boxed_opaque_existential_0(v0 + 152);
  swift_defaultActor_destroy();
  return v0;
}

uint64_t LiftUICache.__deallocating_deinit()
{
  __swift_destroy_boxed_opaque_existential_0(v0 + 112);
  __swift_destroy_boxed_opaque_existential_0(v0 + 152);
  swift_defaultActor_destroy();
  return MEMORY[0x1F4188210](v0);
}

uint64_t LiftUICache.unownedExecutor.getter()
{
  return v0;
}

uint64_t sub_1D58BB38C()
{
  return 1;
}

uint64_t sub_1D58BB394()
{
  return sub_1D58CCF10();
}

uint64_t sub_1D58BB3BC()
{
  return sub_1D58CCF20();
}

uint64_t sub_1D58BB400()
{
  return sub_1D58CCF20();
}

uint64_t sub_1D58BB450(uint64_t a1, uint64_t a2)
{
  return sub_1D58BB548(a1, a2, MEMORY[0x1E4FBB198]);
}

uint64_t sub_1D58BB468()
{
  sub_1D58CCAF0();
  sub_1D58CCB00();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1D58BB4BC()
{
  sub_1D58CCAF0();
  sub_1D58CCF00();
  sub_1D58CCB00();
  uint64_t v0 = sub_1D58CCF20();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1D58BB530(uint64_t a1, uint64_t a2)
{
  return sub_1D58BB548(a1, a2, MEMORY[0x1E4F27EB8]);
}

uint64_t sub_1D58BB548(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_1D58CCAF0();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_1D58BB58C(uint64_t a1, id *a2)
{
  uint64_t result = sub_1D58CCAD0();
  *a2 = 0;
  return result;
}

uint64_t sub_1D58BB604(uint64_t a1, id *a2)
{
  char v3 = sub_1D58CCAE0();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_1D58BB684@<X0>(uint64_t *a1@<X8>)
{
  sub_1D58CCAF0();
  uint64_t v2 = sub_1D58CCAC0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1D58BB6C8()
{
  uint64_t v0 = sub_1D58CCAF0();
  uint64_t v2 = v1;
  if (v0 == sub_1D58CCAF0() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_1D58CCE90();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_1D58BB754@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_1D58CCAC0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1D58BB79C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1D58CCAF0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1D58BB7C8(uint64_t a1)
{
  uint64_t v2 = sub_1D58BE6FC(&qword_1EA723588, 255, (void (*)(uint64_t))type metadata accessor for FileAttributeKey);
  uint64_t v3 = sub_1D58BE6FC(&qword_1EA723610, 255, (void (*)(uint64_t))type metadata accessor for FileAttributeKey);
  uint64_t v4 = MEMORY[0x1E4FBB1B0];
  return MEMORY[0x1F4185450](a1, v2, v3, v4);
}

uint64_t sub_1D58BB88C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_1D58ACE7C;
  return v6();
}

uint64_t sub_1D58BB958(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  char v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *char v5 = v4;
  v5[1] = sub_1D58ACE7C;
  return v7();
}

uint64_t sub_1D58BBA24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1D58CCBF0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_1D58CCBE0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_1D58AC5C4(a1, &qword_1EB786C48);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1D58CCBB0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_1D58BBBD0(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_1D58BE758;
  return v6(a1);
}

unint64_t sub_1D58BBCAC()
{
  unint64_t result = qword_1EA7234B8;
  if (!qword_1EA7234B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA7234B8);
  }
  return result;
}

uint64_t sub_1D58BBD00(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_1D58ACB44(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v9 = *v3;
  uint64_t v12 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_1D58BC470();
    uint64_t v9 = v12;
  }
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(*(void *)(v9 + 56) + 16 * v6);
  sub_1D58BC110(v6, v9);
  *uint64_t v3 = v9;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_1D58BBDE8(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA7235C0);
  char v42 = a2;
  uint64_t v6 = sub_1D58CCDD0();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v41 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v39 = v2;
  int64_t v40 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v21 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v22 = v21 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v23 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v23 >= v40) {
      break;
    }
    unint64_t v24 = (void *)(v5 + 64);
    unint64_t v25 = *(void *)(v41 + 8 * v23);
    ++v13;
    if (!v25)
    {
      int64_t v13 = v23 + 1;
      if (v23 + 1 >= v40) {
        goto LABEL_33;
      }
      unint64_t v25 = *(void *)(v41 + 8 * v13);
      if (!v25)
      {
        int64_t v26 = v23 + 2;
        if (v26 >= v40)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v39;
          if ((v42 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v25 = *(void *)(v41 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            int64_t v13 = v26 + 1;
            if (__OFADD__(v26, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v40) {
              goto LABEL_33;
            }
            unint64_t v25 = *(void *)(v41 + 8 * v13);
            ++v26;
            if (v25) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v26;
      }
    }
LABEL_30:
    unint64_t v10 = (v25 - 1) & v25;
    unint64_t v22 = __clz(__rbit64(v25)) + (v13 << 6);
LABEL_31:
    uint64_t v31 = 16 * v22;
    uint64_t v32 = (uint64_t *)(*(void *)(v5 + 48) + v31);
    uint64_t v34 = *v32;
    uint64_t v33 = v32[1];
    os_log_type_t v35 = (uint64_t *)(*(void *)(v5 + 56) + v31);
    uint64_t v36 = *v35;
    uint64_t v37 = v35[1];
    if ((v42 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_1D58CCF00();
    sub_1D58CCB00();
    uint64_t result = sub_1D58CCF20();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v27 = 0;
      unint64_t v28 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v29 = v16 == v28;
        if (v16 == v28) {
          unint64_t v16 = 0;
        }
        v27 |= v29;
        uint64_t v30 = *(void *)(v11 + 8 * v16);
      }
      while (v30 == -1);
      unint64_t v17 = __clz(__rbit64(~v30)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t v18 = 16 * v17;
    uint64_t v19 = (void *)(*(void *)(v7 + 48) + v18);
    *uint64_t v19 = v34;
    v19[1] = v33;
    uint64_t v20 = (void *)(*(void *)(v7 + 56) + v18);
    *uint64_t v20 = v36;
    v20[1] = v37;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v39;
  unint64_t v24 = (void *)(v5 + 64);
  if ((v42 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v38 = 1 << *(unsigned char *)(v5 + 32);
  if (v38 >= 64) {
    bzero(v24, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v24 = -1 << v38;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

unint64_t sub_1D58BC110(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_1D58CCD40();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_1D58CCF00();
        swift_bridgeObjectRetain();
        sub_1D58CCB00();
        uint64_t v9 = sub_1D58CCF20();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8) {
            goto LABEL_5;
          }
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          uint64_t v11 = *(void *)(a2 + 48);
          uint64_t v12 = (_OWORD *)(v11 + 16 * v3);
          int64_t v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1) {
            *uint64_t v12 = *v13;
          }
          uint64_t v14 = *(void *)(a2 + 56);
          unint64_t v15 = (_OWORD *)(v14 + 16 * v3);
          unint64_t v16 = (_OWORD *)(v14 + 16 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v15 >= v16 + 1))
          {
            *unint64_t v15 = *v16;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    unint64_t v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v18 = *v17;
    uint64_t v19 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v19 = *v17;
    uint64_t v18 = (-1 << result) - 1;
  }
  *unint64_t v17 = v19 & v18;
  uint64_t v20 = *(void *)(a2 + 16);
  BOOL v21 = __OFSUB__(v20, 1);
  uint64_t v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_1D58BC2E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  unint64_t v6 = v5;
  uint64_t v12 = *v5;
  unint64_t v14 = sub_1D58ACB44(a3, a4);
  uint64_t v15 = *(void *)(v12 + 16);
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v18 = v13;
  uint64_t v19 = *(void *)(v12 + 24);
  if (v19 >= v17 && (a5 & 1) != 0) {
    goto LABEL_7;
  }
  if (v19 >= v17 && (a5 & 1) == 0)
  {
    sub_1D58BC470();
LABEL_7:
    uint64_t v20 = (void *)*v6;
    if (v18)
    {
LABEL_8:
      BOOL v21 = (void *)(v20[7] + 16 * v14);
      uint64_t result = swift_bridgeObjectRelease();
      *BOOL v21 = a1;
      v21[1] = a2;
      return result;
    }
    goto LABEL_11;
  }
  sub_1D58BBDE8(v17, a5 & 1);
  unint64_t v23 = sub_1D58ACB44(a3, a4);
  if ((v18 & 1) != (v24 & 1))
  {
LABEL_17:
    uint64_t result = sub_1D58CCEB0();
    __break(1u);
    return result;
  }
  unint64_t v14 = v23;
  uint64_t v20 = (void *)*v6;
  if (v18) {
    goto LABEL_8;
  }
LABEL_11:
  v20[(v14 >> 6) + 8] |= 1 << v14;
  unint64_t v25 = (uint64_t *)(v20[6] + 16 * v14);
  uint64_t *v25 = a3;
  v25[1] = a4;
  int64_t v26 = (void *)(v20[7] + 16 * v14);
  void *v26 = a1;
  v26[1] = a2;
  uint64_t v27 = v20[2];
  BOOL v28 = __OFADD__(v27, 1);
  uint64_t v29 = v27 + 1;
  if (v28)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v20[2] = v29;
  return swift_bridgeObjectRetain();
}

void *sub_1D58BC470()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA7235C0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1D58CCDC0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v25 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v25 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v25);
    ++v9;
    if (!v26)
    {
      int64_t v9 = v25 + 1;
      if (v25 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v26 = *(void *)(v6 + 8 * v9);
      if (!v26) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v26 - 1) & v26;
    unint64_t v15 = __clz(__rbit64(v26)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + v16);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = (uint64_t *)(*(void *)(v2 + 56) + v16);
    uint64_t v21 = *v20;
    uint64_t v22 = v20[1];
    unint64_t v23 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v23 = v19;
    v23[1] = v18;
    char v24 = (void *)(*(void *)(v4 + 56) + v16);
    *char v24 = v21;
    v24[1] = v22;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v27 = v25 + 2;
  if (v27 >= v13) {
    goto LABEL_26;
  }
  unint64_t v26 = *(void *)(v6 + 8 * v27);
  if (v26)
  {
    int64_t v9 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v27 + 1;
    if (__OFADD__(v27, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v9);
    ++v27;
    if (v26) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void sub_1D58BC62C(uint64_t a1)
{
  v21[11] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = sub_1D58CC700();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D58A8D34(0, &qword_1EA7235C8);
  unint64_t v7 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  v7(v6, a1, v3);
  id v8 = sub_1D58BB1B8((uint64_t)v6);
  if (!v1)
  {
    int64_t v9 = v8;
    int v10 = objc_msgSend(v8, sel_fileDescriptor);
    v21[0] = 66053;
    int v11 = ffsctl(v10, 0xC0084A44uLL, v21, 0);
    if (v11)
    {
      int v12 = v11;
      sub_1D58CCAF0();
      uint64_t v20 = v12;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EA7233E8);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_1D58D34D0;
      *(void *)(inited + 32) = sub_1D58CCAF0();
      *(void *)(inited + 40) = v14;
      *(void *)(inited + 72) = v3;
      boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(inited + 48));
      v7((char *)boxed_opaque_existential_0, a1, v3);
      sub_1D58AAB4C(inited);
      id v16 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
      uint64_t v17 = (void *)sub_1D58CCAC0();
      swift_bridgeObjectRelease();
      uint64_t v18 = (void *)sub_1D58CCA60();
      swift_bridgeObjectRelease();
      objc_msgSend(v16, sel_initWithDomain_code_userInfo_, v17, v20, v18);

      swift_willThrow();
    }
  }
}

uint64_t sub_1D58BC8C0(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_1D58CC700() - 8);
  uint64_t v5 = *(void *)(v1 + 32);
  uint64_t v6 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  int64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *int64_t v9 = v2;
  v9[1] = sub_1D58ACE7C;
  return sub_1D58B8A8C(a1, v7, v8, v5, v6);
}

uint64_t type metadata accessor for LiftUICache()
{
  return self;
}

uint64_t sub_1D58BC9CC()
{
  uint64_t v1 = sub_1D58CC700();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();
  return MEMORY[0x1F4186498](v0, v6, v5);
}

uint64_t sub_1D58BCAB4(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_1D58CC700() - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = v1 + v5;
  uint64_t v7 = *(void *)(v1 + ((*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  int v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  *int v10 = v2;
  v10[1] = sub_1D58AC3F8;
  return sub_1D58B98AC(a1, v8, v9, v6, v7);
}

uint64_t sub_1D58BCBC4(uint64_t a1)
{
  return sub_1D58BACF8(a1, v1);
}

uint64_t sub_1D58BCBCC(uint64_t *a1)
{
  uint64_t v2 = sub_1D58CC990();
  uint64_t v65 = *(void *)(v2 - 8);
  uint64_t v66 = v2;
  uint64_t v3 = MEMORY[0x1F4188790](v2);
  unint64_t v5 = &v58[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1F4188790](v3);
  uint64_t v64 = &v58[-v6];
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA7234A0);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v9 = &v58[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = sub_1D58CC700();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x1F4188790](v10);
  uint64_t v14 = &v58[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1F4188790](v12);
  id v16 = &v58[-v15];
  uint64_t v18 = *a1;
  unint64_t v17 = a1[1];
  sub_1D58CC6E0();
  uint64_t v19 = v11;
  uint64_t v20 = v11;
  uint64_t v21 = v10;
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v20 + 48))(v9, 1, v10) == 1)
  {
    sub_1D58AC5C4((uint64_t)v9, &qword_1EA7234A0);
    uint64_t v22 = sub_1D58BE804();
    unint64_t v23 = v64;
    uint64_t v24 = v65;
    uint64_t v25 = v66;
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v65 + 16))(v64, v22, v66);
    swift_bridgeObjectRetain_n();
    unint64_t v26 = sub_1D58CC980();
    os_log_type_t v27 = sub_1D58CCC70();
    if (os_log_type_enabled(v26, v27))
    {
      BOOL v28 = (uint8_t *)swift_slowAlloc();
      uint64_t v29 = swift_slowAlloc();
      uint64_t v69 = v29;
      *(_DWORD *)BOOL v28 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v68 = sub_1D58A7680(v18, v17, &v69);
      sub_1D58CCD00();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1D5851000, v26, v27, "Invalid URL was stored in LiftUI cache: %s", v28, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1D9454520](v29, -1, -1);
      MEMORY[0x1D9454520](v28, -1, -1);

      return (*(uint64_t (**)(unsigned char *, uint64_t))(v65 + 8))(v23, v66);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      return (*(uint64_t (**)(unsigned char *, uint64_t))(v24 + 8))(v23, v25);
    }
  }
  else
  {
    uint64_t v31 = v65;
    uint64_t v32 = v66;
    uint64_t v33 = v16;
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v19 + 32))(v16, v9, v21);
    id v34 = v67;
    sub_1D58BC62C((uint64_t)v16);
    id v67 = v34;
    if (v34)
    {
      uint64_t v35 = sub_1D58BE804();
      uint64_t v36 = v31;
      uint64_t v37 = v5;
      (*(void (**)(unsigned char *, uint64_t, uint64_t))(v31 + 16))(v5, v35, v32);
      uint64_t v38 = v14;
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v19 + 16))(v14, v33, v21);
      id v39 = v67;
      id v40 = v67;
      id v41 = v39;
      char v42 = sub_1D58CC980();
      os_log_type_t v43 = sub_1D58CCC70();
      int v44 = v43;
      if (os_log_type_enabled(v42, v43))
      {
        uint64_t v45 = swift_slowAlloc();
        uint64_t v64 = v33;
        uint64_t v46 = v45;
        uint64_t v61 = (void *)swift_slowAlloc();
        uint64_t v63 = swift_slowAlloc();
        uint64_t v69 = v63;
        *(_DWORD *)uint64_t v46 = 136315394;
        uint64_t v62 = v19;
        id v47 = v67;
        os_log_t v60 = v42;
        sub_1D58BE6FC(&qword_1EA7234A8, 255, MEMORY[0x1E4F276F0]);
        int v59 = v44;
        uint64_t v48 = sub_1D58CCE60();
        uint64_t v68 = sub_1D58A7680(v48, v49, &v69);
        uint64_t v50 = v36;
        sub_1D58CCD00();
        swift_bridgeObjectRelease();
        uint64_t v62 = *(void *)(v62 + 8);
        ((void (*)(unsigned char *, uint64_t))v62)(v38, v21);
        *(_WORD *)(v46 + 12) = 2112;
        id v51 = v47;
        uint64_t v52 = _swift_stdlib_bridgeErrorToNSError();
        uint64_t v68 = v52;
        sub_1D58CCD00();
        uint64_t v53 = v61;
        void *v61 = v52;

        os_log_t v54 = v60;
        _os_log_impl(&dword_1D5851000, v60, (os_log_type_t)v59, "Failed to mark LiftUI content at %s for purge with error: %@", (uint8_t *)v46, 0x16u);
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EA7234B0);
        swift_arrayDestroy();
        MEMORY[0x1D9454520](v53, -1, -1);
        uint64_t v55 = v63;
        swift_arrayDestroy();
        MEMORY[0x1D9454520](v55, -1, -1);
        MEMORY[0x1D9454520](v46, -1, -1);

        (*(void (**)(unsigned char *, uint64_t))(v50 + 8))(v37, v66);
        return ((uint64_t (*)(unsigned char *, uint64_t))v62)(v64, v21);
      }
      else
      {

        id v56 = v67;
        uint64_t v57 = *(void (**)(unsigned char *, uint64_t))(v19 + 8);
        v57(v38, v21);

        (*(void (**)(unsigned char *, uint64_t))(v36 + 8))(v37, v32);
        return ((uint64_t (*)(unsigned char *, uint64_t))v57)(v33, v21);
      }
    }
    else
    {
      return (*(uint64_t (**)(unsigned char *, uint64_t))(v19 + 8))(v16, v21);
    }
  }
}

uint64_t sub_1D58BD2D4(uint64_t a1)
{
  uint64_t v3 = a1 + 64;
  uint64_t v4 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(a1 + 64);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v9 = 0;
  if (!v6) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v10 = __clz(__rbit64(v6));
  v6 &= v6 - 1;
  for (unint64_t i = v10 | (v9 << 6); ; unint64_t i = __clz(__rbit64(v13)) + (v9 << 6))
  {
    uint64_t v15 = (uint64_t *)(*(void *)(a1 + 56) + 16 * i);
    uint64_t v16 = v15[1];
    v18[0] = *v15;
    v18[1] = v16;
    swift_bridgeObjectRetain();
    sub_1D58BCBCC(v18);
    if (v1)
    {
      swift_release();
      return swift_bridgeObjectRelease();
    }
    uint64_t result = swift_bridgeObjectRelease();
    if (v6) {
      goto LABEL_4;
    }
LABEL_5:
    if (__OFADD__(v9++, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v9 >= v7) {
      return swift_release();
    }
    unint64_t v13 = *(void *)(v3 + 8 * v9);
    if (!v13)
    {
      int64_t v14 = v9 + 1;
      if (v9 + 1 >= v7) {
        return swift_release();
      }
      unint64_t v13 = *(void *)(v3 + 8 * v14);
      if (v13) {
        goto LABEL_14;
      }
      int64_t v14 = v9 + 2;
      if (v9 + 2 >= v7) {
        return swift_release();
      }
      unint64_t v13 = *(void *)(v3 + 8 * v14);
      if (v13) {
        goto LABEL_14;
      }
      int64_t v14 = v9 + 3;
      if (v9 + 3 >= v7) {
        return swift_release();
      }
      unint64_t v13 = *(void *)(v3 + 8 * v14);
      if (v13)
      {
LABEL_14:
        int64_t v9 = v14;
        goto LABEL_15;
      }
      int64_t v17 = v9 + 4;
      if (v9 + 4 >= v7) {
        return swift_release();
      }
      unint64_t v13 = *(void *)(v3 + 8 * v17);
      v9 += 4;
      if (!v13) {
        break;
      }
    }
LABEL_15:
    unint64_t v6 = (v13 - 1) & v13;
  }
  while (1)
  {
    int64_t v9 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v9 >= v7) {
      return swift_release();
    }
    unint64_t v13 = *(void *)(v3 + 8 * v9);
    ++v17;
    if (v13) {
      goto LABEL_15;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

unint64_t sub_1D58BD478()
{
  unint64_t result = qword_1EA723518;
  if (!qword_1EA723518)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA723518);
  }
  return result;
}

uint64_t sub_1D58BD4CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t sub_1D58BD4E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 16))();
}

uint64_t sub_1D58BD4F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t sub_1D58BD508(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 8))();
}

uint64_t sub_1D58BD530(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 16))();
}

uint64_t sub_1D58BD558(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t sub_1D58BD56C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t sub_1D58BD594(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t sub_1D58BD5BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t sub_1D58BD5E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 + 16) + **(int **)(a4 + 16));
  int64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *int64_t v9 = v4;
  v9[1] = sub_1D58ACE7C;
  return v11(a1, a2, a3, a4);
}

uint64_t method lookup function for LiftUICache(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for LiftUICache);
}

uint64_t dispatch thunk of LiftUICache.cacheResponseObjC(from:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t dispatch thunk of LiftUICache.cacheResponse(from:)(uint64_t a1)
{
  unint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 120) + **(int **)(*(void *)v1 + 120));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_1D58AC3F8;
  return v6(a1);
}

uint64_t dispatch thunk of LiftUICache.fetchResponseForURLObjc(url:)(uint64_t a1)
{
  unint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 136) + **(int **)(*(void *)v1 + 136));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_1D58BE754;
  return v6(a1);
}

uint64_t dispatch thunk of LiftUICache.fetchResponse(for:)(uint64_t a1)
{
  unint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 144) + **(int **)(*(void *)v1 + 144));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_1D58BDA3C;
  return v6(a1);
}

uint64_t sub_1D58BDA3C(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *v2;
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(v7 + 8);
  return v5(a1, a2);
}

uint64_t dispatch thunk of LiftUICache.discardCachesObjc()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of LiftUICache.discardCaches()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t getEnumTagSinglePayload for LiftUICacheError(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for LiftUICacheError(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x1D58BDC78);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for LiftUICacheError()
{
  return &type metadata for LiftUICacheError;
}

uint64_t sub_1D58BDCB0()
{
  _Block_release(*(const void **)(v0 + 24));
  swift_release();
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1D58BDCF8()
{
  uint64_t v2 = v0[2];
  int v3 = (const void *)v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_1D58ACE7C;
  unint64_t v6 = (uint64_t (*)(uint64_t, const void *, uint64_t))((char *)&dword_1EA723540 + dword_1EA723540);
  return v6(v2, v3, v4);
}

uint64_t sub_1D58BDDB0()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_1D58ACE7C;
  unint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_1EA723550 + dword_1EA723550);
  return v6(v2, v3, v4);
}

uint64_t objectdestroy_27Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x1F4186498](v0, 48, 7);
}

uint64_t sub_1D58BDEB4(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  unint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_1D58ACE7C;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_1EA723560 + dword_1EA723560);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_1D58BDF80()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1D58BDFB8(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1D58ACE7C;
  unint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1EA723570 + dword_1EA723570);
  return v6(a1, v4);
}

uint64_t sub_1D58BE074(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_1D58BE088(a1, a2);
  }
  return a1;
}

uint64_t sub_1D58BE088(uint64_t a1, unint64_t a2)
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

void type metadata accessor for FileAttributeKey()
{
  if (!qword_1EA7235F0)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1EA7235F0);
    }
  }
}

uint64_t sub_1D58BE138()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return MEMORY[0x1F4186498](v0, 48, 7);
}

uint64_t sub_1D58BE180()
{
  uint64_t v2 = swift_task_alloc();
  long long v3 = *(_OWORD *)(v0 + 32);
  *(void *)(v1 + 16) = v2;
  *(void *)uint64_t v2 = v1;
  *(void *)(v2 + 8) = sub_1D58ACE7C;
  *(_OWORD *)(v2 + 16) = v3;
  uint64_t v4 = (*(void *)v3 + 160) & 0xFFFFFFFFFFFFLL | 0x654F000000000000;
  *(void *)(v2 + 32) = *(void *)(*(void *)v3 + 160);
  *(void *)(v2 + 40) = v4;
  return MEMORY[0x1F4188298](sub_1D58BAE40);
}

unint64_t sub_1D58BE248()
{
  unint64_t result = qword_1EA7235A8;
  if (!qword_1EA7235A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA7235A8);
  }
  return result;
}

uint64_t sub_1D58BE29C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }
  return swift_retain();
}

uint64_t sub_1D58BE2F4(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1D58ACE7C;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1EA7235B0 + dword_1EA7235B0);
  return v6(a1, v4);
}

uint64_t sub_1D58BE3AC()
{
  return swift_release();
}

uint64_t sub_1D58BE3B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA7235D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1D58BE41C()
{
  uint64_t v1 = sub_1D58CC700();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();
  return MEMORY[0x1F4186498](v0, v6, v5);
}

uint64_t sub_1D58BE50C()
{
  uint64_t v2 = *(void *)(sub_1D58CC700() - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = *(void *)(v0 + 32);
  uint64_t v5 = v0 + v3;
  uint64_t v6 = *(void *)(v0 + ((*(void *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v7;
  *uint64_t v7 = v1;
  v7[1] = sub_1D58ACE7C;
  return sub_1D58B5120((uint64_t)v7, v8, v9, v4, v5, v6);
}

uint64_t sub_1D58BE618()
{
  return sub_1D58BE6FC(&qword_1EA7235F8, 255, (void (*)(uint64_t))type metadata accessor for FileAttributeKey);
}

uint64_t sub_1D58BE664()
{
  return sub_1D58BE6FC(&qword_1EA723600, 255, (void (*)(uint64_t))type metadata accessor for FileAttributeKey);
}

uint64_t sub_1D58BE6B0()
{
  return sub_1D58BE6FC(&qword_1EA723608, 255, (void (*)(uint64_t))type metadata accessor for FileAttributeKey);
}

uint64_t sub_1D58BE6FC(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a3(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1D58BE75C(uint64_t a1)
{
  return sub_1D58BE868(a1, qword_1EB786DB0);
}

uint64_t sub_1D58BE774()
{
  return sub_1D58CCCF0();
}

unint64_t sub_1D58BE7C4()
{
  unint64_t result = qword_1EB786CD0;
  if (!qword_1EB786CD0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EB786CD0);
  }
  return result;
}

uint64_t sub_1D58BE804()
{
  return sub_1D58BE970(&qword_1EB786DC8, (uint64_t)qword_1EB786DB0);
}

uint64_t static QuotaLogger.core.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1D58BE9E8(&qword_1EB786DC8, (uint64_t)qword_1EB786DB0, a1);
}

uint64_t sub_1D58BE84C(uint64_t a1)
{
  return sub_1D58BE868(a1, qword_1EB786E18);
}

uint64_t sub_1D58BE868(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_1D58CC990();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  sub_1D58BE7C4();
  sub_1D58CCCF0();
  return sub_1D58CC9A0();
}

uint64_t sub_1D58BE8F8()
{
  return sub_1D58CCCF0();
}

uint64_t sub_1D58BE94C()
{
  return sub_1D58BE970(&qword_1EB786E30, (uint64_t)qword_1EB786E18);
}

uint64_t sub_1D58BE970(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_1D58CC990();
  return __swift_project_value_buffer(v3, a2);
}

uint64_t static QuotaLogger.banner.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1D58BE9E8(&qword_1EB786E30, (uint64_t)qword_1EB786E18, a1);
}

uint64_t sub_1D58BE9E8@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_1D58CC990();
  uint64_t v6 = __swift_project_value_buffer(v5, a2);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v7(a3, v6, v5);
}

ValueMetadata *type metadata accessor for QuotaLogger()
{
  return &type metadata for QuotaLogger;
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

void sub_1D58BEAF4()
{
  byte_1EB786D78 = 1;
  qword_1EB786D80 = 0xED00006B6E694C68;
}

void *sub_1D58BEB1C()
{
  return &unk_1D58D3AE0;
}

uint64_t static AppLaunchLinkTracker.neverShown.getter()
{
  return -1;
}

void sub_1D58BEB38()
{
  id v0 = objc_allocWithZone(MEMORY[0x1E4F1CB18]);
  uint64_t v1 = (void *)sub_1D58CCAC0();
  id v2 = objc_msgSend(v0, sel_initWithSuiteName_, v1);

  uint64_t v3 = (objc_class *)type metadata accessor for AppLaunchLinkTracker();
  uint64_t v4 = (char *)objc_allocWithZone(v3);
  uint64_t v5 = v4;
  if (v2)
  {
    uint64_t v6 = v4;
    id v7 = v2;
  }
  else
  {
    uint64_t v8 = self;
    uint64_t v9 = v5;
    id v7 = objc_msgSend(v8, sel_standardUserDefaults);
  }
  *(void *)&v5[OBJC_IVAR___ICQAppLaunchLinkTracker_userDefaults] = v7;
  id v10 = v2;

  v12.receiver = v5;
  v12.super_class = v3;
  id v11 = objc_msgSendSuper2(&v12, sel_init);

  qword_1EB786DA0 = (uint64_t)v11;
}

id sub_1D58BEC34()
{
  id v0 = objc_allocWithZone(MEMORY[0x1E4F1CB18]);
  uint64_t v1 = (void *)sub_1D58CCAC0();
  id v2 = objc_msgSend(v0, sel_initWithSuiteName_, v1);

  return v2;
}

id sub_1D58BECA0(void *a1)
{
  uint64_t v3 = (char *)objc_allocWithZone(v1);
  uint64_t v4 = v3;
  if (a1)
  {
    uint64_t v5 = v3;
    id v6 = a1;
  }
  else
  {
    id v7 = self;
    uint64_t v8 = v4;
    id v6 = objc_msgSend(v7, sel_standardUserDefaults);
  }
  *(void *)&v4[OBJC_IVAR___ICQAppLaunchLinkTracker_userDefaults] = v6;
  id v9 = a1;

  v12.receiver = v4;
  v12.super_class = v1;
  id v10 = objc_msgSendSuper2(&v12, sel_init);

  return v10;
}

uint64_t *sub_1D58BED50()
{
  if (qword_1EB786DA8 != -1) {
    swift_once();
  }
  return &qword_1EB786DA0;
}

id static AppLaunchLinkTracker.shared.getter()
{
  if (qword_1EB786DA8 != -1) {
    swift_once();
  }
  id v0 = (void *)qword_1EB786DA0;
  return v0;
}

id sub_1D58BEE54(void *a1)
{
  if (a1)
  {
    uint64_t v3 = v1;
    id v4 = a1;
  }
  else
  {
    uint64_t v5 = self;
    id v6 = v1;
    id v4 = objc_msgSend(v5, sel_standardUserDefaults);
  }
  *(void *)&v1[OBJC_IVAR___ICQAppLaunchLinkTracker_userDefaults] = v4;
  id v7 = a1;

  v10.receiver = v1;
  v10.super_class = (Class)type metadata accessor for AppLaunchLinkTracker();
  id v8 = objc_msgSendSuper2(&v10, sel_init);

  return v8;
}

uint64_t type metadata accessor for AppLaunchLinkTracker()
{
  return self;
}

uint64_t sub_1D58BEF20@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA723620);
  MEMORY[0x1F4188790](v7 - 8);
  id v9 = (char *)v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_super v10 = *(void **)(v3 + OBJC_IVAR___ICQAppLaunchLinkTracker_userDefaults);
  if (qword_1EB786D90 != -1) {
    swift_once();
  }
  id v11 = (void *)sub_1D58CCAC0();
  id v12 = objc_msgSend(v10, sel_objectForKey_, v11);

  if (v12)
  {
    sub_1D58CCD20();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v28, 0, sizeof(v28));
  }
  sub_1D58BF530((uint64_t)v28, (uint64_t)v29);
  if (!v30)
  {
    sub_1D58AC5C4((uint64_t)v29, &qword_1EB786C68);
LABEL_16:
    uint64_t v25 = type metadata accessor for AppLaunchEvent();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v9, 1, 1, v25);
    goto LABEL_17;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA723630);
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_16;
  }
  uint64_t v13 = v27;
  if (!v27) {
    goto LABEL_16;
  }
  if (!*(void *)(v27 + 16))
  {
LABEL_15:
    swift_bridgeObjectRelease();
    goto LABEL_16;
  }
  swift_bridgeObjectRetain();
  unint64_t v14 = sub_1D58ACB44(a1, a2);
  if ((v15 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_15;
  }
  uint64_t v16 = (uint64_t *)(*(void *)(v13 + 56) + 16 * v14);
  uint64_t v17 = *v16;
  unint64_t v18 = v16[1];
  sub_1D58BE29C(*v16, v18);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1D58CC630();
  swift_allocObject();
  sub_1D58BE29C(v17, v18);
  sub_1D58CC620();
  uint64_t v19 = type metadata accessor for AppLaunchEvent();
  sub_1D58C39A0(&qword_1EA723628, (void (*)(uint64_t))type metadata accessor for AppLaunchEvent);
  sub_1D58CC610();
  swift_release();
  sub_1D58BE088(v17, v18);
  uint64_t v20 = *(void *)(v19 - 8);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(v9, 0, 1, v19);
  sub_1D58BE088(v17, v18);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v9, 1, v19) != 1)
  {
    uint64_t v21 = &v9[*(int *)(v19 + 20)];
    uint64_t v22 = sub_1D58CC790();
    uint64_t v23 = *(void *)(v22 - 8);
    (*(void (**)(uint64_t, char *, uint64_t))(v23 + 16))(a3, v21, v22);
    sub_1D58C2150((uint64_t)v9);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v23 + 56))(a3, 0, 1, v22);
  }
LABEL_17:
  sub_1D58AC5C4((uint64_t)v9, &qword_1EA723620);
  uint64_t v26 = sub_1D58CC790();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(a3, 1, 1, v26);
}

uint64_t sub_1D58BF380@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (a2 >> 60 == 15)
  {
    uint64_t v4 = type metadata accessor for AppLaunchEvent();
    uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
    uint64_t v6 = v4;
    uint64_t v7 = a3;
    uint64_t v8 = 1;
  }
  else
  {
    sub_1D58CC630();
    swift_allocObject();
    sub_1D58BE29C(a1, a2);
    sub_1D58CC620();
    uint64_t v11 = type metadata accessor for AppLaunchEvent();
    sub_1D58C39A0(&qword_1EA723628, (void (*)(uint64_t))type metadata accessor for AppLaunchEvent);
    sub_1D58CC610();
    swift_release();
    sub_1D58BE074(a1, a2);
    uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
    uint64_t v7 = a3;
    uint64_t v8 = 0;
    uint64_t v6 = v11;
  }
  return v5(v7, v8, 1, v6);
}

uint64_t sub_1D58BF530(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB786C68);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for AppLaunchEvent()
{
  uint64_t result = qword_1EA7244D0;
  if (!qword_1EA7244D0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1D58BF730(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_1D58CC860();
  uint64_t v56 = *(void *)(v5 - 8);
  uint64_t v57 = v5;
  MEMORY[0x1F4188790](v5);
  uint64_t v53 = &v48[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = sub_1D58CC600();
  uint64_t v54 = *(void *)(v7 - 8);
  uint64_t v55 = v7;
  MEMORY[0x1F4188790](v7);
  uint64_t v52 = &v48[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA723620);
  MEMORY[0x1F4188790](v9 - 8);
  uint64_t v11 = &v48[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB786CC8);
  MEMORY[0x1F4188790](v12 - 8);
  unint64_t v14 = &v48[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v15 = sub_1D58CC790();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = MEMORY[0x1F4188790](v15);
  uint64_t v19 = &v48[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1F4188790](v17);
  uint64_t v21 = &v48[-v20];
  uint64_t v22 = *(void **)(v2 + OBJC_IVAR___ICQAppLaunchLinkTracker_userDefaults);
  if (qword_1EB786D90 != -1) {
    swift_once();
  }
  uint64_t v23 = (void *)sub_1D58CCAC0();
  id v24 = objc_msgSend(v22, sel_objectForKey_, v23);

  if (v24)
  {
    sub_1D58CCD20();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v59, 0, sizeof(v59));
  }
  sub_1D58BF530((uint64_t)v59, (uint64_t)v60);
  if (!v61)
  {
    sub_1D58AC5C4((uint64_t)v60, &qword_1EB786C68);
LABEL_15:
    uint64_t v33 = type metadata accessor for AppLaunchEvent();
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 56))(v11, 1, 1, v33);
LABEL_16:
    sub_1D58AC5C4((uint64_t)v11, &qword_1EA723620);
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v16 + 56))(v14, 1, 1, v15);
LABEL_17:
    sub_1D58AC5C4((uint64_t)v14, &qword_1EB786CC8);
    return -1;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA723630);
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_15;
  }
  uint64_t v25 = v58;
  if (!v58) {
    goto LABEL_15;
  }
  if (!*(void *)(v58 + 16))
  {
LABEL_14:
    swift_bridgeObjectRelease();
    goto LABEL_15;
  }
  swift_bridgeObjectRetain();
  unint64_t v26 = sub_1D58ACB44(a1, a2);
  if ((v27 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_14;
  }
  BOOL v28 = (uint64_t *)(*(void *)(v25 + 56) + 16 * v26);
  uint64_t v29 = *v28;
  unint64_t v30 = v28[1];
  sub_1D58BE29C(*v28, v30);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1D58CC630();
  swift_allocObject();
  uint64_t v31 = v29;
  sub_1D58BE29C(v29, v30);
  sub_1D58CC620();
  uint64_t v32 = type metadata accessor for AppLaunchEvent();
  sub_1D58C39A0(&qword_1EA723628, (void (*)(uint64_t))type metadata accessor for AppLaunchEvent);
  uint64_t v50 = v31;
  unint64_t v51 = v30;
  sub_1D58CC610();
  unsigned int v49 = 0;
  swift_release();
  uint64_t v35 = v50;
  unint64_t v36 = v51;
  sub_1D58BE088(v50, v51);
  uint64_t v37 = *(void *)(v32 - 8);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v37 + 56))(v11, v49, 1, v32);
  sub_1D58BE088(v35, v36);
  int v38 = (*(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v37 + 48))(v11, 1, v32);
  if (v38 == 1) {
    goto LABEL_16;
  }
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v16 + 16))(v14, &v11[*(int *)(v32 + 20)], v15);
  sub_1D58C2150((uint64_t)v11);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v16 + 56))(v14, 0, 1, v15);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15) == 1) {
    goto LABEL_17;
  }
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v16 + 32))(v21, v14, v15);
  id v39 = v53;
  sub_1D58CC840();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA723638);
  uint64_t v40 = sub_1D58CC850();
  uint64_t v41 = *(void *)(v40 - 8);
  unint64_t v42 = (*(unsigned __int8 *)(v41 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v41 + 80);
  uint64_t v43 = swift_allocObject();
  *(_OWORD *)(v43 + 16) = xmmword_1D58D34D0;
  (*(void (**)(unint64_t, void, uint64_t))(v41 + 104))(v43 + v42, *MEMORY[0x1E4F27BF0], v40);
  sub_1D58C2C90(v43);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  sub_1D58CC770();
  int v44 = v52;
  sub_1D58CC820();
  swift_bridgeObjectRelease();
  uint64_t v45 = *(void (**)(unsigned char *, uint64_t))(v16 + 8);
  v45(v19, v15);
  (*(void (**)(unsigned char *, uint64_t))(v56 + 8))(v39, v57);
  uint64_t v46 = sub_1D58CC5F0();
  LOBYTE(v40) = v47;
  (*(void (**)(unsigned char *, uint64_t))(v54 + 8))(v44, v55);
  v45(v21, v15);
  if (v40) {
    return 0;
  }
  else {
    return v46;
  }
}

uint64_t sub_1D58BFF60()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR___ICQAppLaunchLinkTracker_userDefaults);
  if (qword_1EB786D90 != -1) {
    swift_once();
  }
  uint64_t v2 = (void *)sub_1D58CCAC0();
  id v3 = objc_msgSend(v1, sel_objectForKey_, v2);

  if (v3)
  {
    sub_1D58CCD20();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
  }
  sub_1D58BF530((uint64_t)v8, (uint64_t)v9);
  if (!v10)
  {
    sub_1D58AC5C4((uint64_t)v9, &qword_1EB786C68);
    return 0;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA723630);
  if ((swift_dynamicCast() & 1) == 0) {
    return 0;
  }
  uint64_t v4 = sub_1D58C21AC(v7);
  swift_bridgeObjectRelease();
  uint64_t v5 = sub_1D58C0868(v4);
  swift_release();
  return v5;
}

uint64_t sub_1D58C00D4@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v54 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA723620);
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v5 = (char *)&v42 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB786CC8);
  MEMORY[0x1F4188790](v6 - 8);
  uint64_t v43 = (char *)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1D58CC790();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x1F4188790](v8);
  uint64_t v46 = (char *)&v42 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v10);
  uint64_t v45 = (char *)&v42 - v12;
  uint64_t v44 = sub_1D58CC860();
  uint64_t v53 = *(void *)(v44 - 8);
  MEMORY[0x1F4188790](v44);
  unint64_t v14 = (char *)&v42 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_1D58CC600();
  uint64_t v51 = *(void *)(v15 - 8);
  uint64_t v52 = v15;
  MEMORY[0x1F4188790](v15);
  unsigned int v49 = (char *)&v42 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v50 = v14;
  uint64_t v18 = *a1;
  unint64_t v17 = a1[1];
  sub_1D58CC840();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA723638);
  uint64_t v19 = sub_1D58CC850();
  uint64_t v20 = *(void *)(v19 - 8);
  unint64_t v21 = (*(unsigned __int8 *)(v20 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80);
  uint64_t v22 = swift_allocObject();
  *(_OWORD *)(v22 + 16) = xmmword_1D58D34D0;
  (*(void (**)(unint64_t, void, uint64_t))(v20 + 104))(v22 + v21, *MEMORY[0x1E4F27BF0], v19);
  uint64_t v23 = sub_1D58C2C90(v22);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  sub_1D58CC630();
  swift_allocObject();
  sub_1D58BE29C(v18, v17);
  sub_1D58CC620();
  uint64_t v24 = type metadata accessor for AppLaunchEvent();
  sub_1D58C39A0(&qword_1EA723628, (void (*)(uint64_t))type metadata accessor for AppLaunchEvent);
  uint64_t v25 = v48;
  sub_1D58CC610();
  uint64_t v47 = v23;
  if (v25)
  {

    swift_release();
    sub_1D58BE088(v18, v17);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v5, 1, 1, v24);
    sub_1D58AC5C4((uint64_t)v5, &qword_1EA723620);
    uint64_t v26 = v9;
    uint64_t v27 = (uint64_t)v43;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v43, 1, 1, v8);
    uint64_t v29 = v45;
    BOOL v28 = v46;
    uint64_t v30 = v44;
LABEL_5:
    uint64_t v32 = v8;
    sub_1D58CC770();
    sub_1D58AC5C4(v27, &qword_1EB786CC8);
    goto LABEL_7;
  }
  swift_release();
  sub_1D58BE088(v18, v17);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v5, 0, 1, v24);
  uint64_t v27 = (uint64_t)v43;
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v43, &v5[*(int *)(v24 + 20)], v8);
  sub_1D58C2150((uint64_t)v5);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v9 + 56))(v27, 0, 1, v8);
  int v31 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v27, 1, v8);
  uint64_t v29 = v45;
  BOOL v28 = v46;
  uint64_t v30 = v44;
  if (v31 == 1)
  {
    uint64_t v26 = v9;
    goto LABEL_5;
  }
  uint64_t v26 = v9;
  uint64_t v33 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 32);
  uint64_t v32 = v8;
  v33(v45, v27, v8);
LABEL_7:
  sub_1D58CC770();
  uint64_t v35 = v49;
  id v34 = v50;
  sub_1D58CC820();
  swift_bridgeObjectRelease();
  unint64_t v36 = *(void (**)(char *, uint64_t))(v26 + 8);
  v36(v28, v32);
  v36(v29, v32);
  (*(void (**)(char *, uint64_t))(v53 + 8))(v34, v30);
  uint64_t v37 = sub_1D58CC5F0();
  char v39 = v38;
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v51 + 8))(v35, v52);
  if (v39) {
    uint64_t v41 = 0;
  }
  else {
    uint64_t v41 = v37;
  }
  uint64_t *v54 = v41;
  return result;
}

unint64_t sub_1D58C0740(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x1E4FBC868];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA723670);
  uint64_t v2 = (void *)sub_1D58CCDE0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (unint64_t *)(a1 + 56);
  while (1)
  {
    uint64_t v5 = *(v4 - 3);
    uint64_t v6 = *(v4 - 2);
    uint64_t v7 = *(v4 - 1);
    unint64_t v8 = *v4;
    swift_bridgeObjectRetain();
    sub_1D58BE29C(v7, v8);
    unint64_t result = sub_1D58ACB44(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v11 = v5;
    v11[1] = v6;
    uint64_t v12 = (uint64_t *)(v2[7] + 16 * result);
    *uint64_t v12 = v7;
    v12[1] = v8;
    uint64_t v13 = v2[2];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v4 += 4;
    v2[2] = v15;
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

uint64_t sub_1D58C0868(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x1E4FBC860];
  if (!v1) {
    return v2;
  }
  uint64_t v28 = MEMORY[0x1E4FBC860];
  sub_1D58C270C(0, v1, 0);
  uint64_t v2 = v28;
  uint64_t result = sub_1D58C2C08(a1);
  uint64_t v6 = result;
  uint64_t v7 = 0;
  uint64_t v8 = a1 + 64;
  uint64_t v27 = a1 + 64;
  int64_t v25 = v1;
  int v26 = v5;
  while ((v6 & 0x8000000000000000) == 0 && v6 < 1 << *(unsigned char *)(a1 + 32))
  {
    unint64_t v11 = (unint64_t)v6 >> 6;
    if ((*(void *)(v8 + 8 * ((unint64_t)v6 >> 6)) & (1 << v6)) == 0) {
      goto LABEL_23;
    }
    if (*(_DWORD *)(a1 + 36) != v5) {
      goto LABEL_24;
    }
    uint64_t v12 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v6);
    uint64_t v13 = *v12;
    uint64_t v14 = v12[1];
    uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8 * v6);
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA7233E8);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1D58D3AD0;
    *(void *)(inited + 32) = 0x6449707061;
    *(void *)(inited + 40) = 0xE500000000000000;
    *(void *)(inited + 48) = v13;
    *(void *)(inited + 56) = v14;
    *(void *)(inited + 72) = MEMORY[0x1E4FBB1A0];
    *(void *)(inited + 80) = 0xD000000000000015;
    *(void *)(inited + 120) = MEMORY[0x1E4FBB550];
    *(void *)(inited + 88) = 0x80000001D58DA2C0;
    *(void *)(inited + 96) = v15;
    swift_bridgeObjectRetain();
    unint64_t v17 = sub_1D58AAB4C(inited);
    uint64_t result = swift_bridgeObjectRelease();
    unint64_t v19 = *(void *)(v28 + 16);
    unint64_t v18 = *(void *)(v28 + 24);
    if (v19 >= v18 >> 1) {
      uint64_t result = sub_1D58C270C(v18 > 1, v19 + 1, 1);
    }
    *(void *)(v28 + 16) = v19 + 1;
    *(void *)(v28 + 8 * v19 + 32) = v17;
    int64_t v9 = 1 << *(unsigned char *)(a1 + 32);
    if (v6 >= v9) {
      goto LABEL_25;
    }
    uint64_t v8 = a1 + 64;
    uint64_t v20 = *(void *)(v27 + 8 * v11);
    if ((v20 & (1 << v6)) == 0) {
      goto LABEL_26;
    }
    int v5 = v26;
    if (*(_DWORD *)(a1 + 36) != v26) {
      goto LABEL_27;
    }
    unint64_t v21 = v20 & (-2 << (v6 & 0x3F));
    if (v21)
    {
      int64_t v9 = __clz(__rbit64(v21)) | v6 & 0xFFFFFFFFFFFFFFC0;
      int64_t v10 = v25;
    }
    else
    {
      unint64_t v22 = v11 + 1;
      unint64_t v23 = (unint64_t)(v9 + 63) >> 6;
      int64_t v10 = v25;
      if (v11 + 1 < v23)
      {
        unint64_t v24 = *(void *)(v27 + 8 * v22);
        if (v24)
        {
LABEL_20:
          int64_t v9 = __clz(__rbit64(v24)) + (v22 << 6);
        }
        else
        {
          while (v23 - 2 != v11)
          {
            unint64_t v24 = *(void *)(a1 + 80 + 8 * v11++);
            if (v24)
            {
              unint64_t v22 = v11 + 1;
              goto LABEL_20;
            }
          }
        }
      }
    }
    ++v7;
    uint64_t v6 = v9;
    if (v7 == v10) {
      return v2;
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

BOOL sub_1D58C0B84(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA723620);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (uint64_t *)((char *)v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = *(void **)(v2 + OBJC_IVAR___ICQAppLaunchLinkTracker_userDefaults);
  if (qword_1EB786D90 != -1) {
    swift_once();
  }
  int64_t v9 = (void *)sub_1D58CCAC0();
  id v10 = objc_msgSend(v8, sel_objectForKey_, v9);

  if (v10)
  {
    sub_1D58CCD20();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v25, 0, sizeof(v25));
  }
  sub_1D58BF530((uint64_t)v25, (uint64_t)v26);
  if (!v26[3])
  {
    sub_1D58AC5C4((uint64_t)v26, &qword_1EB786C68);
LABEL_16:
    uint64_t v20 = type metadata accessor for AppLaunchEvent();
    (*(void (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v7, 1, 1, v20);
    goto LABEL_17;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA723630);
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_16;
  }
  uint64_t v11 = v24;
  if (!v24) {
    goto LABEL_16;
  }
  if (!*(void *)(v24 + 16))
  {
LABEL_15:
    swift_bridgeObjectRelease();
    goto LABEL_16;
  }
  swift_bridgeObjectRetain();
  unint64_t v12 = sub_1D58ACB44(a1, a2);
  if ((v13 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_15;
  }
  uint64_t v14 = (uint64_t *)(*(void *)(v11 + 56) + 16 * v12);
  uint64_t v15 = *v14;
  unint64_t v16 = v14[1];
  sub_1D58BE29C(*v14, v16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1D58CC630();
  swift_allocObject();
  sub_1D58BE29C(v15, v16);
  sub_1D58CC620();
  uint64_t v17 = type metadata accessor for AppLaunchEvent();
  sub_1D58C39A0(&qword_1EA723628, (void (*)(uint64_t))type metadata accessor for AppLaunchEvent);
  sub_1D58CC610();
  swift_release();
  sub_1D58BE088(v15, v16);
  uint64_t v18 = *(void *)(v17 - 8);
  (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v18 + 56))(v7, 0, 1, v17);
  sub_1D58BE088(v15, v16);
  if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v18 + 48))(v7, 1, v17) == 1)
  {
LABEL_17:
    sub_1D58AC5C4((uint64_t)v7, &qword_1EA723620);
    uint64_t v19 = 0;
    goto LABEL_18;
  }
  uint64_t v19 = *v7;
  sub_1D58C2150((uint64_t)v7);
LABEL_18:
  id v21 = objc_msgSend(self, sel_processInfo);
  objc_msgSend(v21, sel_operatingSystemVersion);
  uint64_t v22 = v26[0];

  return v19 < v22;
}

void sub_1D58C0FB4(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6 = type metadata accessor for AppLaunchEvent();
  MEMORY[0x1F4188790](v6);
  uint64_t v56 = (uint64_t *)((char *)&v43 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = sub_1D58CC790();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)&v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1D58CC990();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x1F4188790](v12);
  uint64_t v15 = (char *)&v43 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_1D58BE804();
  uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 16);
  uint64_t v51 = v12;
  v17(v15, v16, v12);
  uint64_t v54 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  uint64_t v55 = a1;
  v54(v11, a1, v8);
  swift_bridgeObjectRetain_n();
  uint64_t v18 = sub_1D58CC980();
  os_log_type_t v19 = sub_1D58CCC60();
  uint64_t v50 = v18;
  int v48 = v19;
  BOOL v20 = os_log_type_enabled(v18, v19);
  unint64_t v49 = a3;
  uint64_t v47 = a2;
  uint64_t v53 = v8;
  if (v20)
  {
    uint64_t v21 = swift_slowAlloc();
    uint64_t v45 = v9 + 16;
    uint64_t v22 = v8;
    uint64_t v23 = v21;
    uint64_t v44 = swift_slowAlloc();
    v59[0] = v44;
    *(_DWORD *)uint64_t v23 = 136315394;
    sub_1D58C39A0(&qword_1EA723438, MEMORY[0x1E4F27928]);
    uint64_t v24 = sub_1D58CCE60();
    *(void *)&v58[0] = sub_1D58A7680(v24, v25, v59);
    uint64_t v46 = v6;
    unint64_t v26 = v49;
    sub_1D58CCD00();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v22);
    *(_WORD *)(v23 + 12) = 2080;
    swift_bridgeObjectRetain();
    *(void *)&v58[0] = sub_1D58A7680(a2, v26, v59);
    uint64_t v6 = v46;
    sub_1D58CCD00();
    swift_bridgeObjectRelease_n();
    uint64_t v27 = v50;
    _os_log_impl(&dword_1D5851000, v50, (os_log_type_t)v48, "Saving last shown date %s for bundle: %s", (uint8_t *)v23, 0x16u);
    uint64_t v28 = v44;
    swift_arrayDestroy();
    MEMORY[0x1D9454520](v28, -1, -1);
    MEMORY[0x1D9454520](v23, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);

    swift_bridgeObjectRelease_n();
  }
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v51);
  uint64_t v29 = *(void **)(v52 + OBJC_IVAR___ICQAppLaunchLinkTracker_userDefaults);
  uint64_t v30 = v56;
  if (qword_1EB786D90 != -1) {
    swift_once();
  }
  int v31 = (void *)sub_1D58CCAC0();
  id v32 = objc_msgSend(v29, sel_objectForKey_, v31);

  if (v32)
  {
    sub_1D58CCD20();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v58, 0, sizeof(v58));
  }
  sub_1D58BF530((uint64_t)v58, (uint64_t)v59);
  if (!v59[3])
  {
    sub_1D58AC5C4((uint64_t)v59, &qword_1EB786C68);
    goto LABEL_13;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA723630);
  if (!swift_dynamicCast())
  {
LABEL_13:
    unint64_t v33 = sub_1D58C0740(MEMORY[0x1E4FBC860]);
    goto LABEL_14;
  }
  unint64_t v33 = v57;
LABEL_14:
  id v34 = objc_msgSend(self, sel_processInfo);
  objc_msgSend(v34, sel_operatingSystemVersion);
  uint64_t v35 = v59[0];

  v54((char *)v30 + *(int *)(v6 + 20), v55, v53);
  uint64_t *v30 = v35;
  sub_1D58CC660();
  swift_allocObject();
  sub_1D58CC650();
  sub_1D58C39A0(&qword_1EA723640, (void (*)(uint64_t))type metadata accessor for AppLaunchEvent);
  uint64_t v36 = sub_1D58CC640();
  unint64_t v38 = v37;
  swift_release();
  sub_1D58C2150((uint64_t)v30);
  uint64_t v39 = v49;
  swift_bridgeObjectRetain();
  sub_1D58BE29C(v36, v38);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v59[0] = v33;
  sub_1D58C28B8(v36, v38, v47, v39, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1D58BE088(v36, v38);
  uint64_t v41 = (void *)sub_1D58CCA60();
  swift_bridgeObjectRelease();
  uint64_t v42 = (void *)sub_1D58CCAC0();
  objc_msgSend(v29, sel_setObject_forKey_, v41, v42);
}

uint64_t sub_1D58C16E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  *a3 = a1;
  uint64_t v4 = (char *)a3 + *(int *)(type metadata accessor for AppLaunchEvent() + 20);
  uint64_t v5 = sub_1D58CC790();
  uint64_t v6 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32);
  return v6(v4, a2, v5);
}

uint64_t sub_1D58C1764()
{
  sub_1D58CC660();
  swift_allocObject();
  sub_1D58CC650();
  type metadata accessor for AppLaunchEvent();
  sub_1D58C39A0(&qword_1EA723640, (void (*)(uint64_t))type metadata accessor for AppLaunchEvent);
  uint64_t v0 = sub_1D58CC640();
  swift_release();
  return v0;
}

id AppLaunchLinkTracker.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void AppLaunchLinkTracker.init()()
{
}

id AppLaunchLinkTracker.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppLaunchLinkTracker();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1D58C1A2C()
{
  return *(void *)v0;
}

uint64_t sub_1D58C1A34@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for AppLaunchEvent() + 20);
  uint64_t v4 = sub_1D58CC790();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t sub_1D58C1AAC(char a1)
{
  if (a1) {
    return 1702125924;
  }
  else {
    return 0x6F6973726556736FLL;
  }
}

BOOL sub_1D58C1AE0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_1D58C1AF8()
{
  return sub_1D58CCF20();
}

uint64_t sub_1D58C1B40()
{
  return sub_1D58CCF10();
}

uint64_t sub_1D58C1B6C()
{
  return sub_1D58CCF20();
}

uint64_t sub_1D58C1BB0()
{
  return sub_1D58C1AAC(*v0);
}

uint64_t sub_1D58C1BB8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1D58C3854(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1D58C1BE0()
{
  return 0;
}

void sub_1D58C1BEC(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_1D58C1BF8(uint64_t a1)
{
  unint64_t v2 = sub_1D58C2FA8();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1D58C1C34(uint64_t a1)
{
  unint64_t v2 = sub_1D58C2FA8();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1D58C1C70(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA723648);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_1D58C2FA8();
  sub_1D58CCF40();
  v8[15] = 0;
  sub_1D58CCE40();
  if (!v1)
  {
    type metadata accessor for AppLaunchEvent();
    v8[14] = 1;
    sub_1D58CC790();
    sub_1D58C39A0(&qword_1EA723650, MEMORY[0x1E4F27928]);
    sub_1D58CCE50();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_1D58C1E28@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v22 = a2;
  uint64_t v25 = sub_1D58CC790();
  uint64_t v23 = *(void *)(v25 - 8);
  MEMORY[0x1F4188790](v25);
  uint64_t v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA723658);
  uint64_t v24 = *(void *)(v26 - 8);
  MEMORY[0x1F4188790](v26);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for AppLaunchEvent();
  MEMORY[0x1F4188790](v8);
  uint64_t v10 = (uint64_t *)((char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_1D58C2FA8();
  sub_1D58CCF30();
  if (!v2)
  {
    uint64_t v21 = v8;
    uint64_t v11 = v24;
    uint64_t v12 = v25;
    uint64_t v13 = v5;
    char v28 = 0;
    uint64_t v14 = v26;
    uint64_t v15 = sub_1D58CCE20();
    BOOL v20 = v10;
    *uint64_t v10 = v15;
    char v27 = 1;
    sub_1D58C39A0(&qword_1EA723660, MEMORY[0x1E4F27928]);
    sub_1D58CCE30();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v7, v14);
    uint64_t v16 = v22;
    uint64_t v17 = (uint64_t)v20;
    (*(void (**)(char *, char *, uint64_t))(v23 + 32))((char *)v20 + *(int *)(v21 + 20), v13, v12);
    sub_1D58C2FFC(v17, v16);
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
}

uint64_t sub_1D58C2120@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1D58C1E28(a1, a2);
}

uint64_t sub_1D58C2138(void *a1)
{
  return sub_1D58C1C70(a1);
}

uint64_t sub_1D58C2150(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AppLaunchEvent();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1D58C21AC(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA723680);
  uint64_t result = sub_1D58CCDC0();
  uint64_t v4 = (void *)result;
  int64_t v5 = 0;
  uint64_t v29 = a1;
  uint64_t v8 = *(void *)(a1 + 64);
  uint64_t v7 = a1 + 64;
  uint64_t v6 = v8;
  uint64_t v9 = 1 << *(unsigned char *)(v7 - 32);
  uint64_t v10 = -1;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  unint64_t v11 = v10 & v6;
  uint64_t v26 = v7;
  int64_t v27 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v28 = result + 64;
  if ((v10 & v6) == 0) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v12 = __clz(__rbit64(v11));
  v11 &= v11 - 1;
  for (unint64_t i = v12 | (v5 << 6); ; unint64_t i = __clz(__rbit64(v15)) + (v5 << 6))
  {
    uint64_t v17 = (uint64_t *)(*(void *)(v29 + 48) + 16 * i);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    BOOL v20 = (uint64_t *)(*(void *)(v29 + 56) + 16 * i);
    unint64_t v21 = v20[1];
    v30[0] = *v20;
    uint64_t v22 = v30[0];
    v30[1] = v21;
    swift_bridgeObjectRetain();
    sub_1D58BE29C(v22, v21);
    sub_1D58C00D4(v30, &v31);
    if (v1)
    {
      swift_bridgeObjectRelease();
      swift_release();
      sub_1D58BE088(v22, v21);
      return (uint64_t)v4;
    }
    uint64_t result = sub_1D58BE088(v22, v21);
    *(void *)(v28 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << i;
    uint64_t v23 = (void *)(v4[6] + 16 * i);
    *uint64_t v23 = v19;
    v23[1] = v18;
    *(void *)(v4[7] + 8 * i) = v31;
    uint64_t v24 = v4[2];
    BOOL v14 = __OFADD__(v24, 1);
    uint64_t v25 = v24 + 1;
    if (v14)
    {
      __break(1u);
LABEL_27:
      __break(1u);
      goto LABEL_28;
    }
    v4[2] = v25;
    if (v11) {
      goto LABEL_4;
    }
LABEL_5:
    BOOL v14 = __OFADD__(v5++, 1);
    if (v14) {
      goto LABEL_27;
    }
    if (v5 >= v27) {
      return (uint64_t)v4;
    }
    unint64_t v15 = *(void *)(v26 + 8 * v5);
    if (!v15) {
      break;
    }
LABEL_15:
    unint64_t v11 = (v15 - 1) & v15;
  }
  int64_t v16 = v5 + 1;
  if (v5 + 1 >= v27) {
    return (uint64_t)v4;
  }
  unint64_t v15 = *(void *)(v26 + 8 * v16);
  if (v15) {
    goto LABEL_14;
  }
  int64_t v16 = v5 + 2;
  if (v5 + 2 >= v27) {
    return (uint64_t)v4;
  }
  unint64_t v15 = *(void *)(v26 + 8 * v16);
  if (v15) {
    goto LABEL_14;
  }
  int64_t v16 = v5 + 3;
  if (v5 + 3 >= v27) {
    return (uint64_t)v4;
  }
  unint64_t v15 = *(void *)(v26 + 8 * v16);
  if (v15)
  {
LABEL_14:
    int64_t v5 = v16;
    goto LABEL_15;
  }
  while (1)
  {
    int64_t v5 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v5 >= v27) {
      return (uint64_t)v4;
    }
    unint64_t v15 = *(void *)(v26 + 8 * v5);
    ++v16;
    if (v15) {
      goto LABEL_15;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_1D58C23FC(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA723670);
  char v6 = a2;
  uint64_t v7 = sub_1D58CCDD0();
  uint64_t v8 = v7;
  if (*(void *)(v5 + 16))
  {
    uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v36 = (void *)(v5 + 64);
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v35 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v12 = v7 + 64;
    uint64_t result = swift_retain();
    int64_t v14 = 0;
    while (1)
    {
      if (v11)
      {
        unint64_t v21 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v22 = v21 | (v14 << 6);
      }
      else
      {
        int64_t v23 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v23 >= v35) {
          goto LABEL_33;
        }
        unint64_t v24 = v36[v23];
        ++v14;
        if (!v24)
        {
          int64_t v14 = v23 + 1;
          if (v23 + 1 >= v35) {
            goto LABEL_33;
          }
          unint64_t v24 = v36[v14];
          if (!v24)
          {
            int64_t v25 = v23 + 2;
            if (v25 >= v35)
            {
LABEL_33:
              swift_release();
              uint64_t v3 = v2;
              if (v6)
              {
                uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
                if (v34 >= 64) {
                  bzero(v36, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v36 = -1 << v34;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v24 = v36[v25];
            if (!v24)
            {
              while (1)
              {
                int64_t v14 = v25 + 1;
                if (__OFADD__(v25, 1)) {
                  goto LABEL_40;
                }
                if (v14 >= v35) {
                  goto LABEL_33;
                }
                unint64_t v24 = v36[v14];
                ++v25;
                if (v24) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v14 = v25;
          }
        }
LABEL_30:
        unint64_t v11 = (v24 - 1) & v24;
        unint64_t v22 = __clz(__rbit64(v24)) + (v14 << 6);
      }
      uint64_t v30 = 16 * v22;
      uint64_t v31 = (uint64_t *)(*(void *)(v5 + 48) + v30);
      uint64_t v33 = *v31;
      uint64_t v32 = v31[1];
      long long v37 = *(_OWORD *)(*(void *)(v5 + 56) + v30);
      if ((v6 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        sub_1D58BE29C(v37, *((unint64_t *)&v37 + 1));
      }
      sub_1D58CCF00();
      sub_1D58CCB00();
      uint64_t result = sub_1D58CCF20();
      uint64_t v15 = -1 << *(unsigned char *)(v8 + 32);
      unint64_t v16 = result & ~v15;
      unint64_t v17 = v16 >> 6;
      if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
      {
        unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v26 = 0;
        unint64_t v27 = (unint64_t)(63 - v15) >> 6;
        do
        {
          if (++v17 == v27 && (v26 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          BOOL v28 = v17 == v27;
          if (v17 == v27) {
            unint64_t v17 = 0;
          }
          v26 |= v28;
          uint64_t v29 = *(void *)(v12 + 8 * v17);
        }
        while (v29 == -1);
        unint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
      }
      *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
      uint64_t v19 = 16 * v18;
      BOOL v20 = (void *)(*(void *)(v8 + 48) + v19);
      *BOOL v20 = v33;
      v20[1] = v32;
      *(_OWORD *)(*(void *)(v8 + 56) + v19) = v37;
      ++*(void *)(v8 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v8;
  return result;
}

uint64_t sub_1D58C270C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1D58C272C(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_1D58C272C(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
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
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA723678);
    uint64_t v10 = (void *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 3);
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x1E4FBC860];
  }
  unint64_t v13 = (unint64_t)(v10 + 4);
  unint64_t v14 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v13 >= v14 + 8 * v8) {
      memmove(v10 + 4, a4 + 4, 8 * v8);
    }
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v14 >= v13 + 8 * v8 || v13 >= v14 + 8 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA723668);
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_1D58CCDF0();
  __break(1u);
  return result;
}

uint64_t sub_1D58C28B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  unint64_t v6 = v5;
  uint64_t v12 = *v5;
  unint64_t v14 = sub_1D58ACB44(a3, a4);
  uint64_t v15 = *(void *)(v12 + 16);
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v18 = v13;
  uint64_t v19 = *(void *)(v12 + 24);
  if (v19 >= v17 && (a5 & 1) != 0) {
    goto LABEL_7;
  }
  if (v19 >= v17 && (a5 & 1) == 0)
  {
    sub_1D58C2A40();
LABEL_7:
    BOOL v20 = (void *)*v6;
    if (v18)
    {
LABEL_8:
      uint64_t v21 = v20[7] + 16 * v14;
      uint64_t result = sub_1D58BE088(*(void *)v21, *(void *)(v21 + 8));
      *(void *)uint64_t v21 = a1;
      *(void *)(v21 + 8) = a2;
      return result;
    }
    goto LABEL_11;
  }
  sub_1D58C23FC(v17, a5 & 1);
  unint64_t v23 = sub_1D58ACB44(a3, a4);
  if ((v18 & 1) != (v24 & 1))
  {
LABEL_17:
    uint64_t result = sub_1D58CCEB0();
    __break(1u);
    return result;
  }
  unint64_t v14 = v23;
  BOOL v20 = (void *)*v6;
  if (v18) {
    goto LABEL_8;
  }
LABEL_11:
  v20[(v14 >> 6) + 8] |= 1 << v14;
  int64_t v25 = (uint64_t *)(v20[6] + 16 * v14);
  uint64_t *v25 = a3;
  v25[1] = a4;
  char v26 = (void *)(v20[7] + 16 * v14);
  void *v26 = a1;
  v26[1] = a2;
  uint64_t v27 = v20[2];
  BOOL v28 = __OFADD__(v27, 1);
  uint64_t v29 = v27 + 1;
  if (v28)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v20[2] = v29;
  return swift_bridgeObjectRetain();
}

void *sub_1D58C2A40()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA723670);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1D58CCDC0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v21 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v21 >= v13) {
      goto LABEL_26;
    }
    unint64_t v22 = *(void *)(v6 + 8 * v21);
    ++v9;
    if (!v22)
    {
      int64_t v9 = v21 + 1;
      if (v21 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v22 = *(void *)(v6 + 8 * v9);
      if (!v22) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v22 - 1) & v22;
    unint64_t v15 = __clz(__rbit64(v22)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + v16);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    long long v24 = *(_OWORD *)(*(void *)(v2 + 56) + v16);
    BOOL v20 = (void *)(*(void *)(v4 + 48) + v16);
    *BOOL v20 = v19;
    v20[1] = v18;
    *(_OWORD *)(*(void *)(v4 + 56) + v16) = v24;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)sub_1D58BE29C(v24, *((unint64_t *)&v24 + 1));
  }
  int64_t v23 = v21 + 2;
  if (v23 >= v13) {
    goto LABEL_26;
  }
  unint64_t v22 = *(void *)(v6 + 8 * v23);
  if (v22)
  {
    int64_t v9 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v22 = *(void *)(v6 + 8 * v9);
    ++v23;
    if (v22) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_1D58C2C08(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v3 = 1 << v5;
  if (v6 < 7) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2) {
    unint64_t v7 = 2;
  }
  unint64_t v8 = v7 - 2;
  int64_t v9 = (unint64_t *)(a1 + 80);
  uint64_t v2 = 64;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v1 = v10;
    --v8;
    v2 += 64;
    if (v10) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

uint64_t sub_1D58C2C90(uint64_t a1)
{
  uint64_t v2 = sub_1D58CC850();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x1F4188790](v2);
  unsigned int v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v4);
  long long v37 = (char *)&v30 - v7;
  uint64_t v8 = *(void *)(a1 + 16);
  if (v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA723688);
    uint64_t v9 = sub_1D58CCD50();
    uint64_t v10 = 0;
    unint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v11 = v3 + 16;
    int64_t v35 = v12;
    uint64_t v36 = v9 + 56;
    uint64_t v13 = *(unsigned __int8 *)(v11 + 64);
    uint64_t v32 = v8;
    uint64_t v33 = a1 + ((v13 + 32) & ~v13);
    uint64_t v14 = *(void *)(v11 + 56);
    unint64_t v15 = (void (**)(char *, uint64_t))(v11 - 8);
    uint64_t v31 = (uint64_t (**)(unint64_t, char *, uint64_t))(v11 + 16);
    while (1)
    {
      uint64_t v34 = v10;
      v35(v37, v33 + v14 * v10, v2);
      sub_1D58C39A0(&qword_1EA723690, MEMORY[0x1E4F27C88]);
      uint64_t v16 = sub_1D58CCA90();
      uint64_t v17 = ~(-1 << *(unsigned char *)(v9 + 32));
      unint64_t v18 = v16 & v17;
      unint64_t v19 = (v16 & (unint64_t)v17) >> 6;
      uint64_t v20 = *(void *)(v36 + 8 * v19);
      uint64_t v21 = 1 << (v16 & v17);
      if ((v21 & v20) != 0)
      {
        while (1)
        {
          uint64_t v22 = v11;
          v35(v6, *(void *)(v9 + 48) + v18 * v14, v2);
          sub_1D58C39A0(&qword_1EA723698, MEMORY[0x1E4F27C88]);
          char v23 = sub_1D58CCAB0();
          long long v24 = *v15;
          (*v15)(v6, v2);
          if (v23) {
            break;
          }
          unint64_t v18 = (v18 + 1) & v17;
          unint64_t v19 = v18 >> 6;
          uint64_t v20 = *(void *)(v36 + 8 * (v18 >> 6));
          uint64_t v21 = 1 << v18;
          uint64_t v11 = v22;
          if ((v20 & (1 << v18)) == 0) {
            goto LABEL_8;
          }
        }
        v24(v37, v2);
        uint64_t v11 = v22;
      }
      else
      {
LABEL_8:
        int64_t v25 = v37;
        *(void *)(v36 + 8 * v19) = v21 | v20;
        uint64_t result = (*v31)(*(void *)(v9 + 48) + v18 * v14, v25, v2);
        uint64_t v27 = *(void *)(v9 + 16);
        BOOL v28 = __OFADD__(v27, 1);
        uint64_t v29 = v27 + 1;
        if (v28)
        {
          __break(1u);
          return result;
        }
        *(void *)(v9 + 16) = v29;
      }
      uint64_t v10 = v34 + 1;
      if (v34 + 1 == v32) {
        return v9;
      }
    }
  }
  return MEMORY[0x1E4FBC870];
}

unint64_t sub_1D58C2FA8()
{
  unint64_t result = qword_1EA7243C8[0];
  if (!qword_1EA7243C8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1EA7243C8);
  }
  return result;
}

uint64_t sub_1D58C2FFC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AppLaunchEvent();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t method lookup function for AppLaunchLinkTracker(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for AppLaunchLinkTracker);
}

uint64_t dispatch thunk of AppLaunchLinkTracker.lastShownDate(for:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x60))();
}

uint64_t dispatch thunk of AppLaunchLinkTracker.daysSinceLastShown(for:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x68))();
}

uint64_t dispatch thunk of AppLaunchLinkTracker.allDaysSinceLastShown()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x70))();
}

uint64_t dispatch thunk of AppLaunchLinkTracker.osUpgradeSinceLastShown(for:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of AppLaunchLinkTracker.setLastShownDate(_:for:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x80))();
}

uint64_t *sub_1D58C317C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v9 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *a1 = *a2;
    uint64_t v5 = *(int *)(a3 + 20);
    unsigned int v6 = (char *)a1 + v5;
    uint64_t v7 = (char *)a2 + v5;
    uint64_t v8 = sub_1D58CC790();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16))(v6, v7, v8);
  }
  return v3;
}

uint64_t sub_1D58C3248(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + *(int *)(a2 + 20);
  uint64_t v3 = sub_1D58CC790();
  int v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
  return v4(v2, v3);
}

void *sub_1D58C32B0(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  unsigned int v6 = (char *)a2 + v4;
  uint64_t v7 = sub_1D58CC790();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16))(v5, v6, v7);
  return a1;
}

void *sub_1D58C332C(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  unsigned int v6 = (char *)a2 + v4;
  uint64_t v7 = sub_1D58CC790();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 24))(v5, v6, v7);
  return a1;
}

void *sub_1D58C33A8(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  unsigned int v6 = (char *)a2 + v4;
  uint64_t v7 = sub_1D58CC790();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

void *sub_1D58C3424(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  unsigned int v6 = (char *)a2 + v4;
  uint64_t v7 = sub_1D58CC790();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 40))(v5, v6, v7);
  return a1;
}

uint64_t sub_1D58C34A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1D58C34B4);
}

uint64_t sub_1D58C34B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a1 + *(int *)(a3 + 20);
  uint64_t v5 = sub_1D58CC790();
  unsigned int v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48);
  return v6(v4, a2, v5);
}

uint64_t sub_1D58C3524(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1D58C3538);
}

uint64_t sub_1D58C3538(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a1 + *(int *)(a4 + 20);
  uint64_t v6 = sub_1D58CC790();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);
  return v7(v5, a2, a2, v6);
}

uint64_t sub_1D58C35AC()
{
  uint64_t result = sub_1D58CC790();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for AppLaunchEvent.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 1;
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
        JUMPOUT(0x1D58C3714);
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
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AppLaunchEvent.CodingKeys()
{
  return &type metadata for AppLaunchEvent.CodingKeys;
}

unint64_t sub_1D58C3750()
{
  unint64_t result = qword_1EA7245E0[0];
  if (!qword_1EA7245E0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1EA7245E0);
  }
  return result;
}

unint64_t sub_1D58C37A8()
{
  unint64_t result = qword_1EA7246F0;
  if (!qword_1EA7246F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA7246F0);
  }
  return result;
}

unint64_t sub_1D58C3800()
{
  unint64_t result = qword_1EA7246F8[0];
  if (!qword_1EA7246F8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1EA7246F8);
  }
  return result;
}

uint64_t sub_1D58C3854(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6F6973726556736FLL && a2 == 0xE90000000000006ELL;
  if (v3 || (sub_1D58CCE90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1702125924 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_1D58CCE90();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_1D58C3938(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(qword_1EA7233F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1D58C39A0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1D58C39E8()
{
  unint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC11iCloudQuota19ICQLiftUIDataSource____lazy_storage___backupDeviceUUID);
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC11iCloudQuota19ICQLiftUIDataSource____lazy_storage___backupDeviceUUID);
  uint64_t v3 = *(void *)(v0 + OBJC_IVAR____TtC11iCloudQuota19ICQLiftUIDataSource____lazy_storage___backupDeviceUUID + 8);
  uint64_t v4 = v2;
  if (v3 == 1)
  {
    uint64_t v5 = *(void **)(v0 + OBJC_IVAR____TtC11iCloudQuota19ICQLiftUIDataSource_account);
    id v6 = objc_allocWithZone(MEMORY[0x1E4F78010]);
    id v20 = 0;
    id v7 = v5;
    id v8 = objc_msgSend(v6, sel_initWithAccount_delegate_eventQueue_error_, v7, 0, 0, &v20);
    if (v8)
    {
      uint64_t v9 = v8;
      id v10 = v20;

      id v11 = objc_msgSend(v9, sel_backupDeviceUUID);
      if (v11)
      {
        unint64_t v12 = v11;
        uint64_t v4 = sub_1D58CCAF0();
        uint64_t v14 = v13;

LABEL_8:
        uint64_t v17 = *v1;
        uint64_t v18 = v1[1];
        *unint64_t v1 = v4;
        v1[1] = v14;
        swift_bridgeObjectRetain();
        sub_1D58C720C(v17, v18);
        goto LABEL_9;
      }
    }
    else
    {
      id v15 = v20;
      uint64_t v16 = (void *)sub_1D58CC680();

      swift_willThrow();
    }
    uint64_t v4 = 0;
    uint64_t v14 = 0;
    goto LABEL_8;
  }
LABEL_9:
  sub_1D58C7A70(v2, v3);
  return v4;
}

id ICQLiftUIDataSource.__allocating_init(account:)(uint64_t a1)
{
  uint64_t v3 = (char *)objc_allocWithZone(v1);
  *(_OWORD *)&v3[OBJC_IVAR____TtC11iCloudQuota19ICQLiftUIDataSource____lazy_storage___backupDeviceUUID] = xmmword_1D58D3CA0;
  *(void *)&v3[OBJC_IVAR____TtC11iCloudQuota19ICQLiftUIDataSource_account] = a1;
  v5.receiver = v3;
  v5.super_class = v1;
  return objc_msgSendSuper2(&v5, sel_init);
}

id ICQLiftUIDataSource.init(account:)(uint64_t a1)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  *(_OWORD *)&v1[OBJC_IVAR____TtC11iCloudQuota19ICQLiftUIDataSource____lazy_storage___backupDeviceUUID] = xmmword_1D58D3CA0;
  *(void *)&v1[OBJC_IVAR____TtC11iCloudQuota19ICQLiftUIDataSource_account] = a1;
  v5.receiver = v1;
  v5.super_class = ObjectType;
  return objc_msgSendSuper2(&v5, sel_init);
}

uint64_t ICQLiftUIDataSource.request(for:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_1D58CC8A0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  id v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D58CC890();
  ICQLiftUIDataSource.request(for:timeZone:)(a1, (uint64_t)v7, a2);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

void ICQLiftUIDataSource.request(for:timeZone:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = v3;
  uint64_t v38 = a2;
  uint64_t v39 = a3;
  uint64_t v7 = sub_1D58CC700();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  id v10 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1D58CC990();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  uint64_t v14 = (char *)&v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_1D58BE804();
  uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
  uint64_t v36 = v11;
  v16(v14, v15, v11);
  uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  uint64_t v37 = a1;
  uint64_t v35 = v7;
  v17(v10, a1, v7);
  uint64_t v18 = sub_1D58CC980();
  os_log_type_t v19 = sub_1D58CCC80();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = swift_slowAlloc();
    uint64_t v34 = v4;
    uint64_t v21 = (uint8_t *)v20;
    uint64_t v32 = swift_slowAlloc();
    uint64_t v41 = v32;
    uint64_t v33 = v5;
    *(_DWORD *)uint64_t v21 = 136315138;
    uint64_t v31 = v21 + 4;
    uint64_t v22 = sub_1D58CC6A0();
    uint64_t v40 = sub_1D58A7680(v22, v23, &v41);
    uint64_t v5 = v33;
    sub_1D58CCD00();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v35);
    _os_log_impl(&dword_1D5851000, v18, v19, "Loading LiftUI for url: %s", v21, 0xCu);
    uint64_t v24 = v32;
    swift_arrayDestroy();
    MEMORY[0x1D9454520](v24, -1, -1);
    MEMORY[0x1D9454520](v21, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v35);
  }

  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v36);
  id v25 = objc_allocWithZone(MEMORY[0x1E4F28E88]);
  char v26 = (void *)sub_1D58CC6B0();
  id v27 = objc_msgSend(v25, sel_initWithURL_cachePolicy_timeoutInterval_, v26, 1, 30.0);

  uint64_t v28 = *(void *)(v5 + OBJC_IVAR____TtC11iCloudQuota19ICQLiftUIDataSource_account);
  uint64_t v29 = sub_1D58C39E8();
  sub_1D58C40F0(v28, v29, v30);
  swift_bridgeObjectRelease();
  sub_1D58CC5D0();
}

void sub_1D58C40F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v48 = a3;
  uint64_t v42 = a2;
  uint64_t v6 = sub_1D58CC7E0();
  uint64_t v46 = *(void *)(v6 - 8);
  uint64_t v47 = v6;
  MEMORY[0x1F4188790](v6);
  uint64_t v45 = (char *)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1D58CC810();
  uint64_t v43 = *(void *)(v8 - 8);
  uint64_t v44 = v8;
  MEMORY[0x1F4188790](v8);
  id v10 = (char *)&v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1D58CC790();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  uint64_t v14 = (char *)&v42 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_msgSend(v3, sel_aa_addMultiUserDeviceHeaderIfEnabled, v42);
  objc_msgSend(v3, sel_aa_addBasicAuthorizationHeaderWithAccount_preferUsingPassword_, a1, 0);
  objc_msgSend(v3, sel_aa_addClientInfoHeaders);
  objc_msgSend(v3, sel_aa_addDeviceIDHeader);
  uint64_t v15 = (void *)sub_1D58CCAC0();
  objc_msgSend(v3, sel_aa_addContentTypeHeaders_, v15);

  sub_1D58CC780();
  sub_1D58CC870();
  uint64_t v17 = v16;
  uint64_t v18 = *(void (**)(char *, uint64_t))(v12 + 8);
  v18(v14, v11);
  if (v17)
  {
    os_log_type_t v19 = (void *)sub_1D58CCAC0();
    swift_bridgeObjectRelease();
    uint64_t v20 = (void *)sub_1D58CCAC0();
    objc_msgSend(v3, sel_setValue_forHTTPHeaderField_, v19, v20);
  }
  sub_1D58CC780();
  uint64_t v21 = sub_1D58CC880();
  v18(v14, v11);
  if ((unsigned __int128)(v21 * (__int128)1000) >> 64 == (1000 * v21) >> 63)
  {
    uint64_t v49 = 1000 * v21;
    sub_1D58CCE60();
    uint64_t v22 = (void *)sub_1D58CCAC0();
    swift_bridgeObjectRelease();
    unint64_t v23 = (void *)sub_1D58CCAC0();
    objc_msgSend(v4, sel_setValue_forHTTPHeaderField_, v22, v23);

    sub_1D58CC800();
    uint64_t v24 = v45;
    sub_1D58CC7F0();
    (*(void (**)(char *, uint64_t))(v43 + 8))(v10, v44);
    sub_1D58CC7D0();
    (*(void (**)(char *, uint64_t))(v46 + 8))(v24, v47);
    id v25 = (void *)sub_1D58CCAC0();
    swift_bridgeObjectRelease();
    char v26 = (void *)sub_1D58CCAC0();
    objc_msgSend(v4, sel_setValue_forHTTPHeaderField_, v25, v26);

    id v27 = self;
    id v28 = objc_msgSend(v27, sel_standardDateFormat_, 3);
    if (!v28)
    {
      sub_1D58CCAF0();
      id v28 = (id)sub_1D58CCAC0();
      swift_bridgeObjectRelease();
    }
    uint64_t v29 = (void *)sub_1D58CCAC0();
    objc_msgSend(v4, (SEL)&selRef_setVideoCount_, v28, v29);

    id v30 = objc_msgSend(v27, sel_standardDateFormat_, 1);
    if (!v30)
    {
      sub_1D58CCAF0();
      id v30 = (id)sub_1D58CCAC0();
      swift_bridgeObjectRelease();
    }
    uint64_t v31 = (void *)sub_1D58CCAC0();
    objc_msgSend(v4, (SEL)&selRef_setVideoCount_, v30, v31);

    if (v48)
    {
      uint64_t v32 = (void *)sub_1D58CCAC0();
      uint64_t v33 = (void *)sub_1D58CCAC0();
      objc_msgSend(v4, (SEL)&selRef_setVideoCount_, v32, v33);
    }
    id v34 = objc_msgSend(self, sel_ams_sharedAccountStore);
    id v35 = objc_msgSend(v34, sel_ams_activeiTunesAccount);
    if (v35)
    {
      id v36 = v35;
      id v37 = objc_msgSend(v35, sel_ams_DSID);
      if (v37)
      {
        uint64_t v38 = v37;
        id v39 = objc_msgSend(v37, sel_stringValue);
        if (!v39)
        {
          sub_1D58CCAF0();
          id v39 = (id)sub_1D58CCAC0();
          swift_bridgeObjectRelease();
        }
        uint64_t v40 = (void *)sub_1D58CCAC0();
        objc_msgSend(v4, (SEL)&selRef_setVideoCount_, v39, v40);

        uint64_t v41 = v34;
        id v34 = v36;
      }
      else
      {
        uint64_t v41 = v36;
      }
    }
  }
  else
  {
    __break(1u);
  }
}

uint64_t ICQLiftUIDataSource.data(for:)(uint64_t a1)
{
  v2[33] = a1;
  v2[34] = v1;
  uint64_t v3 = sub_1D58CC8A0();
  v2[35] = v3;
  v2[36] = *(void *)(v3 - 8);
  v2[37] = swift_task_alloc();
  uint64_t v4 = sub_1D58CC5E0();
  v2[38] = v4;
  v2[39] = *(void *)(v4 - 8);
  v2[40] = swift_task_alloc();
  v2[41] = swift_task_alloc();
  v2[42] = swift_task_alloc();
  v2[43] = swift_task_alloc();
  v2[44] = swift_task_alloc();
  v2[45] = swift_task_alloc();
  v2[46] = swift_task_alloc();
  uint64_t v5 = sub_1D58CC990();
  v2[47] = v5;
  v2[48] = *(void *)(v5 - 8);
  v2[49] = swift_task_alloc();
  v2[50] = swift_task_alloc();
  v2[51] = swift_task_alloc();
  v2[52] = swift_task_alloc();
  v2[53] = swift_task_alloc();
  v2[54] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1D58C4948, 0, 0);
}

uint64_t sub_1D58C4948()
{
  id v35 = v0;
  uint64_t v1 = v0[54];
  uint64_t v2 = v0[47];
  uint64_t v3 = v0[48];
  uint64_t v4 = v0[46];
  uint64_t v5 = v0[38];
  uint64_t v6 = v0[39];
  uint64_t v7 = v0[33];
  uint64_t v8 = sub_1D58BE804();
  v0[55] = v8;
  uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v0[56] = v9;
  v0[57] = (v3 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v9(v1, v8, v2);
  id v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
  v0[58] = v10;
  v0[59] = (v6 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v10(v4, v7, v5);
  uint64_t v11 = sub_1D58CC980();
  os_log_type_t v12 = sub_1D58CCC60();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v31 = v0[48];
    uint64_t v13 = v0[46];
    uint64_t v32 = v0[47];
    uint64_t v33 = v0[54];
    uint64_t v14 = v0[39];
    uint64_t v30 = v0[38];
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    uint64_t v34 = v16;
    *(_DWORD *)uint64_t v15 = 136315138;
    sub_1D58C7174();
    uint64_t v17 = sub_1D58CCE60();
    v0[32] = sub_1D58A7680(v17, v18, &v34);
    sub_1D58CCD00();
    swift_bridgeObjectRelease();
    os_log_type_t v19 = *(void (**)(uint64_t, uint64_t))(v14 + 8);
    v19(v13, v30);
    _os_log_impl(&dword_1D5851000, v11, v12, "Fetching data for LiftUI request %s", v15, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1D9454520](v16, -1, -1);
    MEMORY[0x1D9454520](v15, -1, -1);

    uint64_t v20 = *(void (**)(uint64_t, uint64_t))(v31 + 8);
    v20(v33, v32);
  }
  else
  {
    uint64_t v21 = v0[54];
    uint64_t v22 = v0[47];
    uint64_t v23 = v0[48];
    os_log_type_t v19 = *(void (**)(uint64_t, uint64_t))(v0[39] + 8);
    v19(v0[46], v0[38]);

    uint64_t v20 = *(void (**)(uint64_t, uint64_t))(v23 + 8);
    v20(v21, v22);
  }
  v0[60] = v20;
  v0[61] = v19;
  uint64_t v24 = v0[34];
  id v25 = objc_msgSend(self, sel_defaultSessionConfiguration);
  v0[62] = v25;
  id v26 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F4EF78]), sel_init);
  objc_msgSend(v25, sel_set_appleIDContext_, v26);

  v0[63] = objc_msgSend(self, sel_sessionWithConfiguration_delegate_delegateQueue_, v25, v24, 0);
  id v27 = (void *)swift_task_alloc();
  v0[64] = v27;
  *id v27 = v0;
  v27[1] = sub_1D58C4C94;
  uint64_t v28 = v0[33];
  return MEMORY[0x1F40E65F8](v28, 0);
}

uint64_t sub_1D58C4C94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (void *)*v4;
  v5[65] = a1;
  v5[66] = a2;
  v5[67] = a3;
  v5[68] = v3;
  swift_task_dealloc();
  if (v3) {
    uint64_t v6 = sub_1D58C64A8;
  }
  else {
    uint64_t v6 = sub_1D58C4DB4;
  }
  return MEMORY[0x1F4188298](v6, 0, 0);
}

uint64_t sub_1D58C4DB4()
{
  uint64_t v63 = v0;
  *(_OWORD *)(v0 + 176) = *(_OWORD *)(v0 + 520);
  self;
  uint64_t v1 = swift_dynamicCastObjCClass();
  if (v1)
  {
    uint64_t v2 = (void *)v1;
    id v3 = *(id *)(v0 + 536);
    if (objc_msgSend(v2, sel_statusCode) == (id)401)
    {
      uint64_t v4 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 464);
      uint64_t v5 = *(void *)(v0 + 360);
      uint64_t v6 = *(void *)(v0 + 304);
      uint64_t v7 = *(void *)(v0 + 264);
      (*(void (**)(void, void, void))(v0 + 448))(*(void *)(v0 + 424), *(void *)(v0 + 440), *(void *)(v0 + 376));
      v4(v5, v7, v6);
      uint64_t v8 = sub_1D58CC980();
      os_log_type_t type = sub_1D58CCC80();
      BOOL v9 = os_log_type_enabled(v8, type);
      id v10 = *(void (**)(uint64_t, uint64_t))(v0 + 480);
      uint64_t v11 = *(void *)(v0 + 424);
      uint64_t v12 = *(void *)(v0 + 376);
      uint64_t v13 = *(void *)(v0 + 360);
      uint64_t v14 = *(void *)(v0 + 304);
      if (v9)
      {
        uint64_t v53 = *(void (**)(uint64_t, uint64_t))(v0 + 488);
        uint64_t v56 = *(void *)(v0 + 424);
        uint64_t v15 = (uint8_t *)swift_slowAlloc();
        uint64_t v16 = swift_slowAlloc();
        uint64_t v62 = v16;
        *(_DWORD *)uint64_t v15 = 136315138;
        sub_1D58C7174();
        uint64_t v17 = sub_1D58CCE60();
        *(void *)(v0 + 248) = sub_1D58A7680(v17, v18, &v62);
        sub_1D58CCD00();
        swift_bridgeObjectRelease();
        v53(v13, v14);
        _os_log_impl(&dword_1D5851000, v8, type, "LiftUI auth failure. Renewing credentials for request %s", v15, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1D9454520](v16, -1, -1);
        MEMORY[0x1D9454520](v15, -1, -1);

        v10(v56, v12);
      }
      else
      {
        (*(void (**)(void, void))(v0 + 488))(*(void *)(v0 + 360), *(void *)(v0 + 304));

        v10(v11, v12);
      }
      id v36 = objc_msgSend(self, sel_defaultStore);
      *(void *)(v0 + 552) = v36;
      if (v36)
      {
        id v37 = v36;
        uint64_t v38 = *(void *)(*(void *)(v0 + 272) + OBJC_IVAR____TtC11iCloudQuota19ICQLiftUIDataSource_account);
        *(void *)(v0 + 560) = v38;
        *(void *)(v0 + 16) = v0;
        *(void *)(v0 + 56) = v0 + 192;
        *(void *)(v0 + 24) = sub_1D58C54FC;
        uint64_t v39 = swift_continuation_init();
        *(void *)(v0 + 80) = MEMORY[0x1E4F143A8];
        *(void *)(v0 + 88) = 0x40000000;
        *(void *)(v0 + 96) = sub_1D58C6860;
        *(void *)(v0 + 104) = &block_descriptor_0;
        *(void *)(v0 + 112) = v39;
        objc_msgSend(v37, sel_renewCredentialsForAccount_completion_, v38, v0 + 80);
        return MEMORY[0x1F41881E8](v0 + 16);
      }
LABEL_24:
      __break(1u);
      JUMPOUT(0x1D58C54ECLL);
    }
  }
  unint64_t v19 = *(void *)(v0 + 528);
  uint64_t v20 = *(void *)(v0 + 520);
  uint64_t v21 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 464);
  uint64_t v22 = *(void *)(v0 + 320);
  uint64_t v23 = *(void *)(v0 + 304);
  uint64_t v24 = *(void *)(v0 + 264);
  (*(void (**)(void, void, void))(v0 + 448))(*(void *)(v0 + 392), *(void *)(v0 + 440), *(void *)(v0 + 376));
  v21(v22, v24, v23);
  sub_1D58BE29C(v20, v19);
  id v25 = sub_1D58CC980();
  os_log_type_t v26 = sub_1D58CCC60();
  if (os_log_type_enabled(v25, v26))
  {
    uint64_t v27 = swift_slowAlloc();
    uint64_t v28 = swift_slowAlloc();
    uint64_t v62 = v28;
    *(_DWORD *)uint64_t v27 = 134218242;
    uint64_t v29 = v28;
    uint64_t v30 = 0;
    switch(v19 >> 62)
    {
      case 1uLL:
        LODWORD(v30) = HIDWORD(v20) - v20;
        if (__OFSUB__(HIDWORD(v20), v20))
        {
          __break(1u);
LABEL_23:
          __break(1u);
          goto LABEL_24;
        }
        uint64_t v30 = (int)v30;
LABEL_18:
        uint64_t v43 = *(void (**)(uint64_t, uint64_t))(v0 + 480);
        uint64_t v54 = *(void (**)(uint64_t, uint64_t))(v0 + 488);
        uint64_t v55 = *(void *)(v0 + 376);
        uint64_t v57 = *(void *)(v0 + 392);
        uint64_t v44 = *(void *)(v0 + 320);
        uint64_t v45 = *(void *)(v0 + 304);
        *(void *)(v0 + 216) = v30;
        sub_1D58CCD00();
        sub_1D58BE088(v20, v19);
        *(_WORD *)(v27 + 12) = 2080;
        sub_1D58C7174();
        uint64_t v46 = sub_1D58CCE60();
        *(void *)(v0 + 200) = sub_1D58A7680(v46, v47, &v62);
        sub_1D58CCD00();
        swift_bridgeObjectRelease();
        v54(v44, v45);
        _os_log_impl(&dword_1D5851000, v25, v26, "Finished fetching data (%ld bytes) for LiftUI request %s", (uint8_t *)v27, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x1D9454520](v29, -1, -1);
        MEMORY[0x1D9454520](v27, -1, -1);

        v43(v57, v55);
        break;
      case 2uLL:
        uint64_t v41 = *(void *)(v20 + 16);
        uint64_t v40 = *(void *)(v20 + 24);
        BOOL v42 = __OFSUB__(v40, v41);
        uint64_t v30 = v40 - v41;
        if (!v42) {
          goto LABEL_18;
        }
        goto LABEL_23;
      case 3uLL:
        goto LABEL_18;
      default:
        uint64_t v30 = BYTE6(v19);
        goto LABEL_18;
    }
  }
  else
  {
    uint64_t v31 = *(void (**)(uint64_t, uint64_t))(v0 + 488);
    typeb = *(void (**)(uint64_t, uint64_t))(v0 + 480);
    uint64_t v32 = *(void *)(v0 + 392);
    uint64_t v33 = *(void *)(v0 + 376);
    uint64_t v34 = *(void *)(v0 + 320);
    uint64_t v35 = *(void *)(v0 + 304);
    sub_1D58BE088(v20, v19);
    v31(v34, v35);

    typeb(v32, v33);
  }
  uint64_t v48 = *(void **)(v0 + 536);
  uint64_t v50 = *(void **)(v0 + 496);
  uint64_t v49 = *(void **)(v0 + 504);
  objc_msgSend(v49, sel_invalidateAndCancel);

  swift_beginAccess();
  *(void *)os_log_type_t typea = *(void *)(v0 + 176);
  uint64_t v61 = *(void *)(v0 + 184);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v51 = *(uint64_t (**)(void, uint64_t))(v0 + 8);
  return v51(*(void *)typea, v61);
}

uint64_t sub_1D58C54FC()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 568) = v1;
  if (v1) {
    uint64_t v2 = sub_1D58C65D0;
  }
  else {
    uint64_t v2 = sub_1D58C560C;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1D58C560C()
{
  uint64_t v87 = v0;
  uint64_t v1 = *(void *)(v0 + 192);

  if (v1)
  {
    uint64_t v2 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 464);
    uint64_t v3 = *(void *)(v0 + 328);
    uint64_t v4 = *(void *)(v0 + 304);
    uint64_t v5 = *(void *)(v0 + 264);
    (*(void (**)(void, void, void))(v0 + 448))(*(void *)(v0 + 400), *(void *)(v0 + 440), *(void *)(v0 + 376));
    v2(v3, v5, v4);
    uint64_t v6 = sub_1D58CC980();
    os_log_type_t v7 = sub_1D58CCC70();
    BOOL v8 = os_log_type_enabled(v6, v7);
    BOOL v9 = *(void **)(v0 + 536);
    id v10 = *(void (**)(uint64_t, uint64_t))(v0 + 480);
    uint64_t v11 = *(void (**)(uint64_t, uint64_t))(v0 + 488);
    uint64_t v12 = *(void *)(v0 + 376);
    uint64_t v83 = *(void *)(v0 + 400);
    uint64_t v13 = *(void *)(v0 + 328);
    uint64_t v14 = *(void *)(v0 + 304);
    if (v8)
    {
      os_log_type_t typea = *(void **)(v0 + 504);
      uint64_t v80 = *(void **)(v0 + 496);
      os_log_t log = v6;
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      uint64_t v77 = v12;
      uint64_t v16 = swift_slowAlloc();
      uint64_t v86 = v16;
      *(_DWORD *)uint64_t v15 = 136315138;
      sub_1D58C7174();
      uint64_t v17 = sub_1D58CCE60();
      *(void *)(v0 + 208) = sub_1D58A7680(v17, v18, &v86);
      sub_1D58CCD00();
      swift_bridgeObjectRelease();
      v11(v13, v14);
      _os_log_impl(&dword_1D5851000, log, v7, "Failed to renew credentials for request %s", v15, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1D9454520](v16, -1, -1);
      MEMORY[0x1D9454520](v15, -1, -1);

      v10(v83, v77);
    }
    else
    {
      uint64_t v41 = *(void **)(v0 + 504);
      uint64_t v42 = *(void *)(v0 + 304);
      uint64_t v43 = *(void *)(v0 + 328);

      v11(v43, v42);
      v10(v83, v12);
    }
    goto LABEL_15;
  }
  unint64_t v19 = (void *)sub_1D58CC5C0();
  objc_msgSend(v19, sel_mutableCopy);

  sub_1D58CCD20();
  swift_unknownObjectRelease();
  sub_1D58C71CC();
  if (!swift_dynamicCast())
  {
    uint64_t v44 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 464);
    uint64_t v45 = *(void *)(v0 + 336);
    uint64_t v46 = *(void *)(v0 + 304);
    uint64_t v47 = *(void *)(v0 + 264);
    (*(void (**)(void, void, void))(v0 + 448))(*(void *)(v0 + 408), *(void *)(v0 + 440), *(void *)(v0 + 376));
    v44(v45, v47, v46);
    uint64_t v48 = sub_1D58CC980();
    os_log_type_t type = sub_1D58CCC70();
    BOOL v49 = os_log_type_enabled(v48, type);
    uint64_t v79 = *(void **)(v0 + 536);
    uint64_t v82 = *(void **)(v0 + 504);
    unint64_t v76 = *(void (**)(uint64_t, uint64_t))(v0 + 488);
    uint64_t v50 = *(void (**)(os_log_t, uint64_t))(v0 + 480);
    uint64_t v51 = *(NSObject **)(v0 + 408);
    uint64_t v52 = *(void *)(v0 + 376);
    uint64_t v53 = *(void *)(v0 + 336);
    uint64_t v54 = *(void *)(v0 + 304);
    if (v49)
    {
      uint64_t v66 = *(void **)(v0 + 496);
      os_log_t logb = *(os_log_t *)(v0 + 408);
      uint64_t v55 = (uint8_t *)swift_slowAlloc();
      uint64_t v63 = v48;
      uint64_t v56 = swift_slowAlloc();
      uint64_t v86 = v56;
      *(_DWORD *)uint64_t v55 = 136315138;
      sub_1D58C7174();
      uint64_t v57 = sub_1D58CCE60();
      *(void *)(v0 + 232) = sub_1D58A7680(v57, v58, &v86);
      sub_1D58CCD00();
      swift_bridgeObjectRelease();
      v76(v53, v54);
      _os_log_impl(&dword_1D5851000, v63, type, "Failed to renew credentials for request %s. Unable to rerun request.", v55, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1D9454520](v56, -1, -1);
      MEMORY[0x1D9454520](v55, -1, -1);

      v50(logb, v52);
    }
    else
    {

      v76(v53, v54);
      v50(v51, v52);
    }
LABEL_15:
    uint64_t v84 = *(void *)(v0 + 176);
    uint64_t v85 = *(void *)(v0 + 184);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v61 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
    return v61(v84, v85);
  }
  uint64_t v20 = *(void *)(v0 + 560);
  uint64_t v78 = *(void (**)(os_log_t, uint64_t, uint64_t))(v0 + 464);
  typeb = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 448);
  uint64_t v21 = *(void *)(v0 + 416);
  uint64_t v64 = *(void *)(v0 + 376);
  uint64_t v65 = *(void *)(v0 + 440);
  uint64_t v22 = *(void *)(v0 + 296);
  os_log_t loga = *(os_log_t *)(v0 + 352);
  uint64_t v70 = *(void *)(v0 + 304);
  uint64_t v23 = *(void *)(v0 + 280);
  uint64_t v24 = *(void *)(v0 + 288);
  uint64_t v25 = *(void *)(v0 + 264);
  *(void *)(v0 + 576) = *(void *)(v0 + 224);
  uint64_t v26 = sub_1D58C39E8();
  uint64_t v28 = v27;
  sub_1D58CC890();
  sub_1D58C40F0(v20, v26, v28);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v22, v23);
  typeb(v21, v65, v64);
  v78(loga, v25, v70);
  uint64_t v29 = sub_1D58CC980();
  os_log_type_t v30 = sub_1D58CCC80();
  BOOL v31 = os_log_type_enabled(v29, v30);
  uint64_t v32 = *(void (**)(uint64_t, uint64_t))(v0 + 480);
  uint64_t v33 = *(void *)(v0 + 416);
  uint64_t v34 = *(void *)(v0 + 376);
  uint64_t v35 = *(void *)(v0 + 352);
  uint64_t v36 = *(void *)(v0 + 304);
  if (v31)
  {
    uint64_t v81 = *(void *)(v0 + 376);
    uint64_t v71 = *(void (**)(uint64_t, uint64_t))(v0 + 488);
    id v37 = (uint8_t *)swift_slowAlloc();
    uint64_t v75 = v32;
    uint64_t v38 = swift_slowAlloc();
    uint64_t v86 = v38;
    *(_DWORD *)id v37 = 136315138;
    sub_1D58C7174();
    uint64_t v39 = sub_1D58CCE60();
    *(void *)(v0 + 240) = sub_1D58A7680(v39, v40, &v86);
    sub_1D58CCD00();
    swift_bridgeObjectRelease();
    v71(v35, v36);
    _os_log_impl(&dword_1D5851000, v29, v30, "Renewing credentials succeeded for request %s, retrying", v37, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1D9454520](v38, -1, -1);
    MEMORY[0x1D9454520](v37, -1, -1);

    v75(v33, v81);
  }
  else
  {
    (*(void (**)(void, void))(v0 + 488))(*(void *)(v0 + 352), *(void *)(v0 + 304));

    v32(v33, v34);
  }
  sub_1D58CC5D0();
  int v59 = (void *)swift_task_alloc();
  *(void *)(v0 + 584) = v59;
  void *v59 = v0;
  v59[1] = sub_1D58C5ED8;
  uint64_t v60 = *(void *)(v0 + 344);
  return MEMORY[0x1F40E65F8](v60, 0);
}

uint64_t sub_1D58C5ED8(uint64_t a1, uint64_t a2, void *a3)
{
  BOOL v8 = (void *)*v4;
  v8[74] = v3;
  swift_task_dealloc();
  BOOL v9 = (void (*)(uint64_t, uint64_t))v8[61];
  uint64_t v10 = v8[43];
  uint64_t v11 = v8[38];
  if (v3)
  {
    v9(v10, v11);
    uint64_t v12 = sub_1D58C671C;
  }
  else
  {
    v8[75] = a2;
    v8[76] = a1;
    v9(v10, v11);

    uint64_t v12 = sub_1D58C608C;
  }
  return MEMORY[0x1F4188298](v12, 0, 0);
}

uint64_t sub_1D58C608C()
{
  uint64_t v42 = v0;
  uint64_t v1 = *(void *)(v0 + 608);
  uint64_t v2 = *(void *)(v0 + 600);
  uint64_t v3 = *(void **)(v0 + 576);

  sub_1D58BE088(*(void *)(v0 + 176), *(void *)(v0 + 184));
  *(void *)(v0 + 176) = v1;
  *(void *)(v0 + 184) = v2;
  uint64_t v4 = *(void *)(v0 + 608);
  unint64_t v5 = *(void *)(v0 + 600);
  uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 464);
  uint64_t v7 = *(void *)(v0 + 320);
  uint64_t v8 = *(void *)(v0 + 304);
  uint64_t v9 = *(void *)(v0 + 264);
  (*(void (**)(void, void, void))(v0 + 448))(*(void *)(v0 + 392), *(void *)(v0 + 440), *(void *)(v0 + 376));
  v6(v7, v9, v8);
  sub_1D58BE29C(v4, v5);
  uint64_t v10 = sub_1D58CC980();
  os_log_type_t v11 = sub_1D58CCC60();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    uint64_t v41 = v13;
    *(_DWORD *)uint64_t v12 = 134218242;
    uint64_t v14 = 0;
    switch(v5 >> 62)
    {
      case 1uLL:
        LODWORD(v14) = HIDWORD(v4) - v4;
        if (__OFSUB__(HIDWORD(v4), v4))
        {
          __break(1u);
LABEL_13:
          __break(1u);
          JUMPOUT(0x1D58C6498);
        }
        uint64_t v14 = (int)v14;
LABEL_8:
        uint64_t v37 = *(void *)(v0 + 392);
        uint64_t v39 = *(void (**)(uint64_t, uint64_t))(v0 + 480);
        uint64_t v34 = *(void (**)(uint64_t, uint64_t))(v0 + 488);
        uint64_t v35 = *(void *)(v0 + 376);
        uint64_t v24 = *(void *)(v0 + 320);
        uint64_t v25 = *(void *)(v0 + 304);
        *(void *)(v0 + 216) = v14;
        uint64_t v26 = v13;
        sub_1D58CCD00();
        sub_1D58BE088(v4, v5);
        *(_WORD *)(v12 + 12) = 2080;
        sub_1D58C7174();
        uint64_t v27 = sub_1D58CCE60();
        *(void *)(v0 + 200) = sub_1D58A7680(v27, v28, &v41);
        sub_1D58CCD00();
        swift_bridgeObjectRelease();
        v34(v24, v25);
        _os_log_impl(&dword_1D5851000, v10, v11, "Finished fetching data (%ld bytes) for LiftUI request %s", (uint8_t *)v12, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x1D9454520](v26, -1, -1);
        MEMORY[0x1D9454520](v12, -1, -1);

        uint64_t v20 = v35;
        uint64_t v19 = v37;
        break;
      case 2uLL:
        uint64_t v22 = *(void *)(v4 + 16);
        uint64_t v21 = *(void *)(v4 + 24);
        BOOL v23 = __OFSUB__(v21, v22);
        uint64_t v14 = v21 - v22;
        if (!v23) {
          goto LABEL_8;
        }
        goto LABEL_13;
      case 3uLL:
        goto LABEL_8;
      default:
        uint64_t v14 = BYTE6(v5);
        goto LABEL_8;
    }
  }
  else
  {
    uint64_t v15 = *(void (**)(uint64_t, uint64_t))(v0 + 488);
    uint64_t v36 = *(void *)(v0 + 392);
    uint64_t v39 = *(void (**)(uint64_t, uint64_t))(v0 + 480);
    uint64_t v16 = *(void *)(v0 + 376);
    uint64_t v17 = *(void *)(v0 + 320);
    uint64_t v18 = *(void *)(v0 + 304);
    sub_1D58BE088(v4, v5);
    v15(v17, v18);

    uint64_t v19 = v36;
    uint64_t v20 = v16;
  }
  v39(v19, v20);
  uint64_t v29 = *(void **)(v0 + 536);
  BOOL v31 = *(void **)(v0 + 496);
  os_log_type_t v30 = *(void **)(v0 + 504);
  objc_msgSend(v30, sel_invalidateAndCancel);

  swift_beginAccess();
  uint64_t v38 = *(void *)(v0 + 176);
  uint64_t v40 = *(void *)(v0 + 184);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v32 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return v32(v38, v40);
}

uint64_t sub_1D58C64A8()
{
  uint64_t v1 = *(void **)(v0 + 504);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_1D58C65D0()
{
  uint64_t v1 = (void *)v0[69];
  uint64_t v2 = (void *)v0[67];
  uint64_t v4 = (void *)v0[62];
  uint64_t v3 = (void *)v0[63];
  swift_willThrow();

  sub_1D58BE088(v0[22], v0[23]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_1D58C671C()
{
  uint64_t v1 = (void *)v0[72];
  uint64_t v2 = (void *)v0[67];
  uint64_t v4 = (void *)v0[62];
  uint64_t v3 = (void *)v0[63];

  sub_1D58BE088(v0[22], v0[23]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_1D58C6860(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB786C60);
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = a3;
    id v7 = a3;
    return MEMORY[0x1F4188208](v3, v5);
  }
  else
  {
    **(void **)(*(void *)(v3 + 64) + 40) = a2;
    return swift_continuation_throwingResume();
  }
}

id ICQLiftUIDataSource.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void ICQLiftUIDataSource.init()()
{
}

id ICQLiftUIDataSource.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t ICQLiftUIDataSource.urlSession(_:task:willPerformHTTPRedirection:newRequest:completionHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t), uint64_t a6)
{
  uint64_t v50 = a6;
  uint64_t v51 = a5;
  uint64_t v52 = a4;
  uint64_t v49 = sub_1D58CC5E0();
  uint64_t v53 = *(void *)(v49 - 8);
  MEMORY[0x1F4188790](v49);
  uint64_t v46 = (char *)&v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA723498);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v48 = (char *)&v43 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1D58CC8A0();
  uint64_t v43 = *(uint8_t **)(v9 - 8);
  uint64_t v44 = (void (*)(char *, uint64_t, uint64_t))v9;
  MEMORY[0x1F4188790](v9);
  os_log_type_t v11 = (char *)&v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1D58CC990();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = MEMORY[0x1F4188790](v12);
  uint64_t v47 = (char *)&v43 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v14);
  uint64_t v17 = (char *)&v43 - v16;
  uint64_t v18 = sub_1D58BE804();
  uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 16);
  v19(v17, v18, v12);
  uint64_t v20 = sub_1D58CC980();
  os_log_type_t v21 = sub_1D58CCC80();
  if (os_log_type_enabled(v20, v21))
  {
    uint64_t v22 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v22 = 0;
    _os_log_impl(&dword_1D5851000, v20, v21, "ICQLiftUIDataSource handling redirect, re-adding headers", v22, 2u);
    MEMORY[0x1D9454520](v22, -1, -1);
  }

  BOOL v23 = *(void (**)(char *, uint64_t))(v13 + 8);
  v23(v17, v12);
  uint64_t v24 = v52;
  uint64_t v25 = (void *)sub_1D58CC5C0();
  objc_msgSend(v25, sel_mutableCopy);

  sub_1D58CCD20();
  swift_unknownObjectRelease();
  sub_1D58C71CC();
  if (swift_dynamicCast())
  {
    uint64_t v26 = (void *)v54;
    uint64_t v27 = *(void *)((char *)v45 + OBJC_IVAR____TtC11iCloudQuota19ICQLiftUIDataSource_account);
    uint64_t v28 = sub_1D58C39E8();
    uint64_t v30 = v29;
    sub_1D58CC890();
    sub_1D58C40F0(v27, v28, v30);
    swift_bridgeObjectRelease();
    (*((void (**)(char *, void (*)(char *, uint64_t, uint64_t)))v43 + 1))(v11, v44);
    uint64_t v31 = (uint64_t)v48;
    sub_1D58CC5D0();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v53 + 56))(v31, 0, 1, v49);
    v51(v31);
  }
  else
  {
    uint64_t v45 = v23;
    v19(v47, v18, v12);
    uint64_t v32 = v53;
    uint64_t v33 = v46;
    uint64_t v34 = v49;
    uint64_t v44 = *(void (**)(char *, uint64_t, uint64_t))(v53 + 16);
    v44(v46, v24, v49);
    uint64_t v35 = sub_1D58CC980();
    os_log_type_t v36 = sub_1D58CCC70();
    if (os_log_type_enabled(v35, v36))
    {
      uint64_t v37 = (uint8_t *)swift_slowAlloc();
      uint64_t v38 = swift_slowAlloc();
      v55[0] = v38;
      *(_DWORD *)uint64_t v37 = 136315138;
      uint64_t v43 = v37 + 4;
      sub_1D58C7174();
      uint64_t v39 = sub_1D58CCE60();
      uint64_t v54 = sub_1D58A7680(v39, v40, v55);
      uint64_t v32 = v53;
      sub_1D58CCD00();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v32 + 8))(v46, v34);
      _os_log_impl(&dword_1D5851000, v35, v36, "Failed to copy %s. Skipping adding headers", v37, 0xCu);
      swift_arrayDestroy();
      uint64_t v41 = v38;
      uint64_t v24 = v52;
      MEMORY[0x1D9454520](v41, -1, -1);
      MEMORY[0x1D9454520](v37, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v32 + 8))(v33, v34);
    }

    v45(v47, v12);
    uint64_t v31 = (uint64_t)v48;
    v44(v48, v24, v34);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v32 + 56))(v31, 0, 1, v34);
    v51(v31);
  }
  return sub_1D58C7220(v31);
}

unint64_t sub_1D58C7174()
{
  unint64_t result = qword_1EA7236B8;
  if (!qword_1EA7236B8)
  {
    sub_1D58CC5E0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA7236B8);
  }
  return result;
}

unint64_t sub_1D58C71CC()
{
  unint64_t result = qword_1EA7236C0;
  if (!qword_1EA7236C0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EA7236C0);
  }
  return result;
}

uint64_t sub_1D58C720C(uint64_t a1, uint64_t a2)
{
  if (a2 != 1) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1D58C7220(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA723498);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for ICQLiftUIDataSource()
{
  return self;
}

uint64_t method lookup function for ICQLiftUIDataSource(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for ICQLiftUIDataSource);
}

uint64_t dispatch thunk of ICQLiftUIDataSource.__allocating_init(account:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t sub_1D58C72D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v63 = a3;
  uint64_t v64 = a1;
  uint64_t v55 = a2;
  uint64_t v62 = sub_1D58CC5E0();
  uint64_t v65 = *(void *)(v62 - 8);
  MEMORY[0x1F4188790](v62);
  uint64_t v60 = (char *)&v52 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA723498);
  uint64_t v5 = MEMORY[0x1F4188790](v4 - 8);
  uint64_t v58 = (uint64_t)&v52 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x1F4188790](v5);
  int v59 = (char *)&v52 - v8;
  uint64_t v9 = MEMORY[0x1F4188790](v7);
  uint64_t v56 = (uint8_t *)&v52 - v10;
  MEMORY[0x1F4188790](v9);
  uint64_t v57 = (void (*)(char *, uint64_t, uint64_t))((char *)&v52 - v11);
  uint64_t v12 = sub_1D58CC8A0();
  uint64_t v52 = *(void *)(v12 - 8);
  uint64_t v53 = v12;
  MEMORY[0x1F4188790](v12);
  uint64_t v14 = (char *)&v52 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_1D58CC990();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = MEMORY[0x1F4188790](v15);
  uint64_t v61 = (char *)&v52 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v17);
  uint64_t v20 = (char *)&v52 - v19;
  uint64_t v21 = sub_1D58BE804();
  uint64_t v22 = *(void (**)(char *, uint64_t, uint64_t))(v16 + 16);
  uint64_t v23 = v15;
  v22(v20, v21, v15);
  uint64_t v24 = sub_1D58CC980();
  os_log_type_t v25 = sub_1D58CCC80();
  if (os_log_type_enabled(v24, v25))
  {
    uint64_t v26 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v26 = 0;
    _os_log_impl(&dword_1D5851000, v24, v25, "ICQLiftUIDataSource handling redirect, re-adding headers", v26, 2u);
    MEMORY[0x1D9454520](v26, -1, -1);
  }

  uint64_t v54 = *(void (**)(char *, uint64_t))(v16 + 8);
  v54(v20, v23);
  uint64_t v27 = v64;
  uint64_t v28 = (void *)sub_1D58CC5C0();
  objc_msgSend(v28, sel_mutableCopy);

  sub_1D58CCD20();
  swift_unknownObjectRelease();
  sub_1D58C71CC();
  if (swift_dynamicCast())
  {
    uint64_t v29 = (void *)v66;
    uint64_t v30 = *(void *)(v55 + OBJC_IVAR____TtC11iCloudQuota19ICQLiftUIDataSource_account);
    uint64_t v31 = sub_1D58C39E8();
    uint64_t v33 = v32;
    sub_1D58CC890();
    sub_1D58C40F0(v30, v31, v33);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v52 + 8))(v14, v53);
    uint64_t v34 = (uint64_t)v57;
    sub_1D58CC5D0();
    uint64_t v35 = v65;
    uint64_t v36 = v62;
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v65 + 56))(v34, 0, 1, v62);
    uint64_t v37 = (uint64_t)v56;
    sub_1D58C7A08(v34, (uint64_t)v56);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v35 + 48))(v37, 1, v36) == 1)
    {
      uint64_t v38 = 0;
    }
    else
    {
      uint64_t v38 = (void *)sub_1D58CC5C0();
      (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v37, v36);
    }
    (*(void (**)(uint64_t, void *))(v63 + 16))(v63, v38);
  }
  else
  {
    v22(v61, v21, v23);
    uint64_t v39 = v65;
    unint64_t v40 = v60;
    uint64_t v41 = v62;
    uint64_t v57 = *(void (**)(char *, uint64_t, uint64_t))(v65 + 16);
    v57(v60, v27, v62);
    uint64_t v42 = sub_1D58CC980();
    os_log_type_t v43 = sub_1D58CCC70();
    if (os_log_type_enabled(v42, v43))
    {
      uint64_t v44 = (uint8_t *)swift_slowAlloc();
      uint64_t v45 = swift_slowAlloc();
      v67[0] = v45;
      *(_DWORD *)uint64_t v44 = 136315138;
      uint64_t v56 = v44 + 4;
      sub_1D58C7174();
      uint64_t v46 = sub_1D58CCE60();
      uint64_t v66 = sub_1D58A7680(v46, v47, v67);
      sub_1D58CCD00();
      swift_bridgeObjectRelease();
      uint64_t v48 = *(void (**)(char *, uint64_t))(v65 + 8);
      v48(v60, v41);
      _os_log_impl(&dword_1D5851000, v42, v43, "Failed to copy %s. Skipping adding headers", v44, 0xCu);
      swift_arrayDestroy();
      uint64_t v49 = v45;
      uint64_t v39 = v65;
      MEMORY[0x1D9454520](v49, -1, -1);
      MEMORY[0x1D9454520](v44, -1, -1);
    }
    else
    {
      uint64_t v48 = *(void (**)(char *, uint64_t))(v39 + 8);
      v48(v40, v41);
    }

    v54(v61, v23);
    uint64_t v34 = (uint64_t)v59;
    v57(v59, v64, v41);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v39 + 56))(v34, 0, 1, v41);
    uint64_t v50 = v58;
    sub_1D58C7A08(v34, v58);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v39 + 48))(v50, 1, v41) == 1)
    {
      uint64_t v38 = 0;
    }
    else
    {
      uint64_t v38 = (void *)sub_1D58CC5C0();
      v48((char *)v50, v41);
    }
    (*(void (**)(uint64_t, void *))(v63 + 16))(v63, v38);
  }

  return sub_1D58C7220(v34);
}

uint64_t sub_1D58C7A08(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA723498);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1D58C7A70(uint64_t a1, uint64_t a2)
{
  if (a2 != 1) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_1D58C7A84()
{
  _s13OptionalErrorOMa();
  swift_getWitnessTable();
  return swift_allocError();
}

uint64_t _s13OptionalErrorOMa()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_1D58C7B04@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  MEMORY[0x1F4188790](a1);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v6, v8, a2);
  uint64_t v9 = *(void *)(a2 + 16);
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v6, 1, v9) != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v10 + 32))(a3, v6, v9);
  }
  _s13OptionalErrorOMa();
  swift_getWitnessTable();
  swift_allocError();
  return swift_willThrow();
}

uint64_t sub_1D58C7C94()
{
  return swift_getWitnessTable();
}

uint64_t sub_1D58C7CB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F41863F8](a1, a2, a3, 8);
}

unsigned char *sub_1D58C7CB8(unsigned char *result, int a2, int a3)
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
        *uint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)uint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)uint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *uint64_t result = 0;
      break;
    case 2:
      *(_WORD *)uint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x1D58C7D54);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t sub_1D58C7DAC()
{
  return sub_1D58CC9C0();
}

uint64_t StorageSummaryModel.storageSummary.getter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1D58CCA00();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_1D58C7E68@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1D58CCA00();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_1D58C7EE8(void **a1)
{
  uint64_t v1 = *a1;
  swift_getKeyPath();
  swift_getKeyPath();
  id v2 = v1;
  swift_retain();
  return sub_1D58CCA10();
}

uint64_t StorageSummaryModel.storageSummary.setter()
{
  return sub_1D58CCA10();
}

uint64_t (*StorageSummaryModel.storageSummary.modify(void *a1))()
{
  id v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_1D58CC9F0();
  return sub_1D58A55AC;
}

uint64_t StorageSummaryModel.$storageSummary.getter()
{
  return sub_1D58A60F8((uint64_t)&OBJC_IVAR____TtC11iCloudQuota19StorageSummaryModel__storageSummary, &qword_1EA723808);
}

uint64_t sub_1D58C8070(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1D58C8458(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC11iCloudQuota19StorageSummaryModel__storageSummary, &qword_1EA723808);
}

uint64_t sub_1D58C8084(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1D58C84E4(a1, a2, a3, a4, &qword_1EA723810, (uint64_t)&OBJC_IVAR____TtC11iCloudQuota19StorageSummaryModel__storageSummary, &qword_1EA723808);
}

uint64_t StorageSummaryModel.$storageSummary.setter(uint64_t a1)
{
  return sub_1D58C867C(a1, &qword_1EA723810, (uint64_t)&OBJC_IVAR____TtC11iCloudQuota19StorageSummaryModel__storageSummary, &qword_1EA723808);
}

uint64_t (*StorageSummaryModel.$storageSummary.modify(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA723810);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC11iCloudQuota19StorageSummaryModel__storageSummary;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA723808);
  sub_1D58CC9D0();
  swift_endAccess();
  return sub_1D58A582C;
}

uint64_t StorageSummaryModel.didError.getter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1D58CCA00();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_1D58C8240@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1D58CCA00();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_1D58C82C0()
{
  return sub_1D58CCA10();
}

uint64_t StorageSummaryModel.didError.setter()
{
  return sub_1D58CCA10();
}

uint64_t (*StorageSummaryModel.didError.modify(void *a1))()
{
  id v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_1D58CC9F0();
  return sub_1D58A55AC;
}

uint64_t StorageSummaryModel.$didError.getter()
{
  return sub_1D58A60F8((uint64_t)&OBJC_IVAR____TtC11iCloudQuota19StorageSummaryModel__didError, &qword_1EA723300);
}

uint64_t sub_1D58C8444(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1D58C8458(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC11iCloudQuota19StorageSummaryModel__didError, &qword_1EA723300);
}

uint64_t sub_1D58C8458(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  return swift_endAccess();
}

uint64_t sub_1D58C84C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1D58C84E4(a1, a2, a3, a4, &qword_1EA723308, (uint64_t)&OBJC_IVAR____TtC11iCloudQuota19StorageSummaryModel__didError, &qword_1EA723300);
}

uint64_t sub_1D58C84E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t a6, uint64_t *a7)
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(a5);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x1F4188790](v9);
  uint64_t v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v11);
  uint64_t v15 = (char *)&v18 - v14;
  uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v16((char *)&v18 - v14, a1, v9);
  v16(v13, (uint64_t)v15, v9);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a7);
  sub_1D58CC9E0();
  swift_endAccess();
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v15, v9);
}

uint64_t StorageSummaryModel.$didError.setter(uint64_t a1)
{
  return sub_1D58C867C(a1, &qword_1EA723308, (uint64_t)&OBJC_IVAR____TtC11iCloudQuota19StorageSummaryModel__didError, &qword_1EA723300);
}

uint64_t sub_1D58C867C(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v10 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a4);
  sub_1D58CC9E0();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
}

uint64_t (*StorageSummaryModel.$didError.modify(void *a1))()
{
  char v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA723308);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC11iCloudQuota19StorageSummaryModel__didError;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA723300);
  sub_1D58CC9D0();
  swift_endAccess();
  return sub_1D58A582C;
}

id StorageSummaryModel.account.getter()
{
  return *(id *)(v0 + OBJC_IVAR____TtC11iCloudQuota19StorageSummaryModel_account);
}

id sub_1D58C88CC()
{
  uint64_t v1 = OBJC_IVAR____TtC11iCloudQuota19StorageSummaryModel____lazy_storage___dataController;
  id v2 = *(void **)(v0 + OBJC_IVAR____TtC11iCloudQuota19StorageSummaryModel____lazy_storage___dataController);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC11iCloudQuota19StorageSummaryModel____lazy_storage___dataController);
  }
  else
  {
    id v4 = objc_msgSend(objc_allocWithZone((Class)ICQCloudStorageDataController), sel_initWithAccount_, *(void *)(v0 + OBJC_IVAR____TtC11iCloudQuota19StorageSummaryModel_account));
    uint64_t v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    id v2 = 0;
  }
  id v6 = v2;
  return v3;
}

char *StorageSummaryModel.__allocating_init(account:)(void *a1)
{
  swift_allocObject();
  id v2 = sub_1D58C910C(a1);

  return v2;
}

char *StorageSummaryModel.init(account:)(void *a1)
{
  id v2 = sub_1D58C910C(a1);

  return v2;
}

char *StorageSummaryModel.deinit()
{
  uint64_t v1 = v0;
  type metadata accessor for DarwinRegistrar();
  sub_1D58A9344(v0);
  id v2 = &v0[OBJC_IVAR____TtC11iCloudQuota19StorageSummaryModel__storageSummary];
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA723808);
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  id v4 = &v1[OBJC_IVAR____TtC11iCloudQuota19StorageSummaryModel__didError];
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA723300);
  (*(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);

  return v1;
}

uint64_t StorageSummaryModel.__deallocating_deinit()
{
  uint64_t v1 = v0;
  type metadata accessor for DarwinRegistrar();
  sub_1D58A9344(v0);
  id v2 = &v0[OBJC_IVAR____TtC11iCloudQuota19StorageSummaryModel__storageSummary];
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA723808);
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  id v4 = &v1[OBJC_IVAR____TtC11iCloudQuota19StorageSummaryModel__didError];
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA723300);
  (*(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);

  return swift_deallocClassInstance();
}

Swift::Void __swiftcall StorageSummaryModel.fetchCloudStorageSummary(shouldIgnoreCache:)(Swift::Bool shouldIgnoreCache)
{
  swift_getKeyPath();
  swift_getKeyPath();
  LOBYTE(v6[0]) = 0;
  swift_retain();
  sub_1D58CCA10();
  id v2 = sub_1D58C88CC();
  objc_msgSend(v2, sel_setShouldIgnoreCache_, shouldIgnoreCache, v6[0]);

  id v3 = sub_1D58C88CC();
  uint64_t v4 = swift_allocObject();
  swift_weakInit();
  v6[4] = sub_1D58C9408;
  v6[5] = v4;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 1107296256;
  void v6[2] = sub_1D58A6D24;
  v6[3] = &block_descriptor_4;
  uint64_t v5 = _Block_copy(v6);
  swift_release();
  objc_msgSend(v3, sel_fetchStorageSummaryWithCompletion_, v5);
  _Block_release(v5);
}

uint64_t sub_1D58C8D80(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = sub_1D58CCA30();
  uint64_t v19 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_1D58CCA50();
  uint64_t v9 = *(void *)(v18 - 8);
  MEMORY[0x1F4188790](v18);
  uint64_t v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D58A8D34(0, &qword_1EA723360);
  uint64_t v12 = (void *)sub_1D58CCC90();
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = a2;
  v13[3] = a1;
  v13[4] = a3;
  aBlock[4] = sub_1D58C977C;
  aBlock[5] = v13;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1D58A6CE0;
  aBlock[3] = &block_descriptor_14;
  uint64_t v14 = _Block_copy(aBlock);
  id v15 = a2;
  id v16 = a1;
  swift_retain();
  swift_release();
  sub_1D58CCA40();
  aBlock[0] = MEMORY[0x1E4FBC860];
  sub_1D58A8FA4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA723370);
  sub_1D58A8FFC();
  sub_1D58CCD30();
  MEMORY[0x1D9453660](0, v11, v8, v14);
  _Block_release(v14);

  (*(void (**)(char *, uint64_t))(v19 + 8))(v8, v6);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v18);
}

void *sub_1D58C9030(void *result, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  if (a2)
  {
    id v7 = result;
    id v8 = a3;
    id v9 = a5;
    swift_retain();
    StorageSummaryModel.fetchCloudStorageSummary(shouldIgnoreCache:)(1);

    return (void *)swift_release();
  }
  return result;
}

uint64_t sub_1D58C90B0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1D58CC9B0();
  *a1 = result;
  return result;
}

uint64_t sub_1D58C9100()
{
  return _s11iCloudQuota19StorageSummaryModelC2eeoiySbAC_ACtFZ_0();
}

char *sub_1D58C910C(void *a1)
{
  id v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA723300);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  id v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA723808);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = &v2[OBJC_IVAR____TtC11iCloudQuota19StorageSummaryModel__storageSummary];
  id v22 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA723800);
  sub_1D58CC9C0();
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v12, v11, v8);
  uint64_t v13 = &v2[OBJC_IVAR____TtC11iCloudQuota19StorageSummaryModel__didError];
  LOBYTE(v22) = 0;
  sub_1D58CC9C0();
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v13, v7, v4);
  *(void *)&v2[OBJC_IVAR____TtC11iCloudQuota19StorageSummaryModel____lazy_storage___dataController] = 0;
  *(void *)&v2[OBJC_IVAR____TtC11iCloudQuota19StorageSummaryModel_account] = a1;
  id v14 = a1;
  id v15 = sub_1D58C88CC();
  id v16 = objc_msgSend(v15, sel_cachedStorageSummary);

  swift_getKeyPath();
  swift_getKeyPath();
  id v22 = v16;
  swift_retain();
  sub_1D58CCA10();
  type metadata accessor for DarwinRegistrar();
  uint64_t v17 = (uint64_t *)sub_1D58A9074();
  uint64_t v18 = *v17;
  unint64_t v19 = v17[1];
  swift_bridgeObjectRetain();
  sub_1D58A909C(v2, v18, v19, (void (__cdecl *)(CFNotificationCenterRef, void *, CFNotificationName, const void *, CFDictionaryRef))sub_1D58C9030);
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_1D58C93D0()
{
  swift_weakDestroy();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1D58C9408(void *a1, void *a2)
{
  return sub_1D58C8D80(a1, a2, v2);
}

uint64_t _s11iCloudQuota19StorageSummaryModelC2eeoiySbAC_ACtFZ_0()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1D58CCA00();
  swift_release();
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1D58CCA00();
  swift_release();
  swift_release();
  if (v4
    && (sub_1D58A8D34(0, (unint64_t *)&unk_1EA723820),
        id v0 = v4,
        char v1 = sub_1D58CCCD0(),
        v0,
        v0,
        v4,
        (v1 & 1) == 0))
  {
    char v2 = 0;
  }
  else
  {
    sub_1D58A8D34(0, (unint64_t *)&qword_1EA723348);
    char v2 = sub_1D58CCCD0();
  }
  return v2 & 1;
}

uint64_t sub_1D58C9574()
{
  return type metadata accessor for StorageSummaryModel();
}

uint64_t type metadata accessor for StorageSummaryModel()
{
  uint64_t result = qword_1EA724AC0;
  if (!qword_1EA724AC0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1D58C95C8()
{
  sub_1D58C96D8();
  if (v0 <= 0x3F)
  {
    sub_1D58A8BDC();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

uint64_t method lookup function for StorageSummaryModel(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for StorageSummaryModel);
}

uint64_t dispatch thunk of StorageSummaryModel.__allocating_init(account:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

void sub_1D58C96D8()
{
  if (!qword_1EA723818)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA723800);
    unint64_t v0 = sub_1D58CCA20();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EA723818);
    }
  }
}

uint64_t sub_1D58C9734()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1D58C977C()
{
  uint64_t v1 = *(void **)(v0 + 24);
  if (*(void *)(v0 + 16)) {
    BOOL v2 = 1;
  }
  else {
    BOOL v2 = v1 == 0;
  }
  if (v2)
  {
    swift_beginAccess();
    uint64_t result = swift_weakLoadStrong();
    if (!result) {
      return result;
    }
    swift_getKeyPath();
    swift_getKeyPath();
    return sub_1D58CCA10();
  }
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    id v4 = v1;
    return sub_1D58CCA10();
  }
  return result;
}

void _ICQAlertSpecificationForServerDict_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1D5851000, log, OS_LOG_TYPE_DEBUG, "no alertInfo provided", v1, 2u);
}

void _ICQActionForString_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D5851000, a2, OS_LOG_TYPE_ERROR, "_ICQActionFromString - illegal action %@", (uint8_t *)&v2, 0xCu);
}

void ICQUsedDiskSpaceForVolume_cold_1(int a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  uint64_t v3 = "UInt64 ICQUsedDiskSpaceForVolume(NSString *__strong _Nonnull)";
  __int16 v4 = 1024;
  int v5 = a1;
  _os_log_error_impl(&dword_1D5851000, a2, OS_LOG_TYPE_ERROR, "Error in %s: %d", (uint8_t *)&v2, 0x12u);
}

uint64_t __getINDaemonConnectionClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[ICQLink dynamicUIRouteURL](v0);
}

void ___handlePushReceivedDarwinNotification_block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t __getCKContainerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[ICQNetworkThrottleController requestShouldThrottle:](v0);
}

uint64_t __getPLPhotoLibraryClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getPLGatekeeperClientClass_block_invoke_cold_1(v0);
}

uint64_t __getPLGatekeeperClientClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[_ICQXMLSpecification stringForPlaceholder:withDeviceInfo:](v0);
}

void _ICQServerDictionaryForBundleIdentifier_cold_1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_2(&dword_1D5851000, v0, v1, "appId array: %@", v2);
}

uint64_t sub_1D58CC5C0()
{
  return MEMORY[0x1F40E2EA8]();
}

uint64_t sub_1D58CC5D0()
{
  return MEMORY[0x1F40E2ED8]();
}

uint64_t sub_1D58CC5E0()
{
  return MEMORY[0x1F40E2F60]();
}

uint64_t sub_1D58CC5F0()
{
  return MEMORY[0x1F40E38F8]();
}

uint64_t sub_1D58CC600()
{
  return MEMORY[0x1F40E3A58]();
}

uint64_t sub_1D58CC610()
{
  return MEMORY[0x1F40E41E0]();
}

uint64_t sub_1D58CC620()
{
  return MEMORY[0x1F40E4210]();
}

uint64_t sub_1D58CC630()
{
  return MEMORY[0x1F40E4220]();
}

uint64_t sub_1D58CC640()
{
  return MEMORY[0x1F40E4240]();
}

uint64_t sub_1D58CC650()
{
  return MEMORY[0x1F40E4260]();
}

uint64_t sub_1D58CC660()
{
  return MEMORY[0x1F40E4270]();
}

uint64_t sub_1D58CC670()
{
  return MEMORY[0x1F40E4540]();
}

uint64_t sub_1D58CC680()
{
  return MEMORY[0x1F40E4550]();
}

uint64_t sub_1D58CC690()
{
  return MEMORY[0x1F40E48D8]();
}

uint64_t sub_1D58CC6A0()
{
  return MEMORY[0x1F40E48F8]();
}

uint64_t sub_1D58CC6B0()
{
  return MEMORY[0x1F40E49A0]();
}

uint64_t sub_1D58CC6C0()
{
  return MEMORY[0x1F40E4A70]();
}

uint64_t sub_1D58CC6D0()
{
  return MEMORY[0x1F40E4AC0]();
}

uint64_t sub_1D58CC6E0()
{
  return MEMORY[0x1F40E4B20]();
}

uint64_t sub_1D58CC6F0()
{
  return MEMORY[0x1F40E4B58]();
}

uint64_t sub_1D58CC700()
{
  return MEMORY[0x1F40E4B80]();
}

uint64_t sub_1D58CC710()
{
  return MEMORY[0x1F40E4BE0]();
}

uint64_t sub_1D58CC720()
{
  return MEMORY[0x1F40E4D48]();
}

uint64_t sub_1D58CC730()
{
  return MEMORY[0x1F40E4E10]();
}

uint64_t sub_1D58CC740()
{
  return MEMORY[0x1F40E5188]();
}

uint64_t sub_1D58CC750()
{
  return MEMORY[0x1F40E52B0]();
}

uint64_t sub_1D58CC760()
{
  return MEMORY[0x1F40E52E0]();
}

uint64_t sub_1D58CC770()
{
  return MEMORY[0x1F40E52F0]();
}

uint64_t sub_1D58CC780()
{
  return MEMORY[0x1F40E5378]();
}

uint64_t sub_1D58CC790()
{
  return MEMORY[0x1F40E5388]();
}

uint64_t sub_1D58CC7A0()
{
  return MEMORY[0x1F40E53B0]();
}

uint64_t sub_1D58CC7B0()
{
  return MEMORY[0x1F40E5438]();
}

uint64_t sub_1D58CC7C0()
{
  return MEMORY[0x1F40E5448]();
}

uint64_t sub_1D58CC7D0()
{
  return MEMORY[0x1F40E55B0]();
}

uint64_t sub_1D58CC7E0()
{
  return MEMORY[0x1F40E55C0]();
}

uint64_t sub_1D58CC7F0()
{
  return MEMORY[0x1F40E55E0]();
}

uint64_t sub_1D58CC800()
{
  return MEMORY[0x1F40E5728]();
}

uint64_t sub_1D58CC810()
{
  return MEMORY[0x1F40E5890]();
}

uint64_t sub_1D58CC820()
{
  return MEMORY[0x1F40E5960]();
}

uint64_t sub_1D58CC830()
{
  return MEMORY[0x1F40E5A58]();
}

uint64_t sub_1D58CC840()
{
  return MEMORY[0x1F40E5AB8]();
}

uint64_t sub_1D58CC850()
{
  return MEMORY[0x1F40E5AF0]();
}

uint64_t sub_1D58CC860()
{
  return MEMORY[0x1F40E5B18]();
}

uint64_t sub_1D58CC870()
{
  return MEMORY[0x1F40E5CE8]();
}

uint64_t sub_1D58CC880()
{
  return MEMORY[0x1F40E5D08]();
}

uint64_t sub_1D58CC890()
{
  return MEMORY[0x1F40E5D60]();
}

uint64_t sub_1D58CC8A0()
{
  return MEMORY[0x1F40E5D70]();
}

uint64_t sub_1D58CC8B0()
{
  return MEMORY[0x1F4104E10]();
}

uint64_t sub_1D58CC8C0()
{
  return MEMORY[0x1F4104E20]();
}

uint64_t sub_1D58CC8D0()
{
  return MEMORY[0x1F4104E28]();
}

uint64_t sub_1D58CC8E0()
{
  return MEMORY[0x1F4188570]();
}

uint64_t sub_1D58CC8F0()
{
  return MEMORY[0x1F4188578]();
}

uint64_t sub_1D58CC900()
{
  return MEMORY[0x1F4188580]();
}

uint64_t sub_1D58CC910()
{
  return MEMORY[0x1F41885B0]();
}

uint64_t sub_1D58CC920()
{
  return MEMORY[0x1F41885D0]();
}

uint64_t sub_1D58CC930()
{
  return MEMORY[0x1F41885E0]();
}

uint64_t sub_1D58CC940()
{
  return MEMORY[0x1F4188650]();
}

uint64_t sub_1D58CC950()
{
  return MEMORY[0x1F4188658]();
}

uint64_t sub_1D58CC960()
{
  return MEMORY[0x1F4188660]();
}

uint64_t sub_1D58CC970()
{
  return MEMORY[0x1F4188668]();
}

uint64_t sub_1D58CC980()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1D58CC990()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1D58CC9A0()
{
  return MEMORY[0x1F41886B0]();
}

uint64_t sub_1D58CC9B0()
{
  return MEMORY[0x1F40D69E0]();
}

uint64_t sub_1D58CC9C0()
{
  return MEMORY[0x1F40D6B80]();
}

uint64_t sub_1D58CC9D0()
{
  return MEMORY[0x1F40D6B88]();
}

uint64_t sub_1D58CC9E0()
{
  return MEMORY[0x1F40D6B90]();
}

uint64_t sub_1D58CC9F0()
{
  return MEMORY[0x1F40D6B98]();
}

uint64_t sub_1D58CCA00()
{
  return MEMORY[0x1F40D6BA0]();
}

uint64_t sub_1D58CCA10()
{
  return MEMORY[0x1F40D6BA8]();
}

uint64_t sub_1D58CCA20()
{
  return MEMORY[0x1F40D6BB8]();
}

uint64_t sub_1D58CCA30()
{
  return MEMORY[0x1F4186CB0]();
}

uint64_t sub_1D58CCA40()
{
  return MEMORY[0x1F4186CF8]();
}

uint64_t sub_1D58CCA50()
{
  return MEMORY[0x1F4186D60]();
}

uint64_t sub_1D58CCA60()
{
  return MEMORY[0x1F40E6000]();
}

uint64_t sub_1D58CCA70()
{
  return MEMORY[0x1F40E6030]();
}

uint64_t sub_1D58CCA80()
{
  return MEMORY[0x1F4183318]();
}

uint64_t sub_1D58CCA90()
{
  return MEMORY[0x1F41835C0]();
}

uint64_t sub_1D58CCAA0()
{
  return MEMORY[0x1F4183740]();
}

uint64_t sub_1D58CCAB0()
{
  return MEMORY[0x1F4183838]();
}

uint64_t sub_1D58CCAC0()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1D58CCAD0()
{
  return MEMORY[0x1F40E61B8]();
}

uint64_t sub_1D58CCAE0()
{
  return MEMORY[0x1F40E61C8]();
}

uint64_t sub_1D58CCAF0()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1D58CCB00()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1D58CCB10()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1D58CCB20()
{
  return MEMORY[0x1F4183D80]();
}

uint64_t sub_1D58CCB30()
{
  return MEMORY[0x1F4183DF8]();
}

uint64_t sub_1D58CCB40()
{
  return MEMORY[0x1F4183E80]();
}

uint64_t sub_1D58CCB50()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_1D58CCB60()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_1D58CCB70()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t sub_1D58CCB80()
{
  return MEMORY[0x1F4183EC8]();
}

uint64_t sub_1D58CCB90()
{
  return MEMORY[0x1F4183F38]();
}

uint64_t sub_1D58CCBA0()
{
  return MEMORY[0x1F40E6388]();
}

uint64_t sub_1D58CCBB0()
{
  return MEMORY[0x1F4187BF0]();
}

uint64_t sub_1D58CCBC0()
{
  return MEMORY[0x1F4187C00]();
}

uint64_t sub_1D58CCBD0()
{
  return MEMORY[0x1F4187C08]();
}

uint64_t sub_1D58CCBE0()
{
  return MEMORY[0x1F4187CF8]();
}

uint64_t sub_1D58CCBF0()
{
  return MEMORY[0x1F4187D00]();
}

uint64_t sub_1D58CCC10()
{
  return MEMORY[0x1F4187DB0]();
}

uint64_t sub_1D58CCC30()
{
  return MEMORY[0x1F40E63C8]();
}

uint64_t sub_1D58CCC40()
{
  return MEMORY[0x1F40E6478]();
}

uint64_t sub_1D58CCC60()
{
  return MEMORY[0x1F41886D0]();
}

uint64_t sub_1D58CCC70()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1D58CCC80()
{
  return MEMORY[0x1F4188700]();
}

uint64_t sub_1D58CCC90()
{
  return MEMORY[0x1F41870B8]();
}

uint64_t sub_1D58CCCA0()
{
  return MEMORY[0x1F41870E0]();
}

uint64_t sub_1D58CCCB0()
{
  return MEMORY[0x1F4188708]();
}

uint64_t sub_1D58CCCC0()
{
  return MEMORY[0x1F4188710]();
}

uint64_t sub_1D58CCCD0()
{
  return MEMORY[0x1F41874C0]();
}

uint64_t sub_1D58CCCE0()
{
  return MEMORY[0x1F4188720]();
}

uint64_t sub_1D58CCCF0()
{
  return MEMORY[0x1F4188758]();
}

uint64_t sub_1D58CCD00()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1D58CCD10()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_1D58CCD20()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_1D58CCD30()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t sub_1D58CCD40()
{
  return MEMORY[0x1F4184B20]();
}

uint64_t sub_1D58CCD50()
{
  return MEMORY[0x1F4184CA8]();
}

uint64_t sub_1D58CCD60()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1D58CCD70()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1D58CCD80()
{
  return MEMORY[0x1F4184D88]();
}

uint64_t sub_1D58CCD90()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1D58CCDA0()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1D58CCDB0()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_1D58CCDC0()
{
  return MEMORY[0x1F4185368]();
}

uint64_t sub_1D58CCDD0()
{
  return MEMORY[0x1F4185370]();
}

uint64_t sub_1D58CCDE0()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_1D58CCDF0()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1D58CCE10()
{
  return MEMORY[0x1F41854C8]();
}

uint64_t sub_1D58CCE20()
{
  return MEMORY[0x1F4185588]();
}

uint64_t sub_1D58CCE30()
{
  return MEMORY[0x1F4185598]();
}

uint64_t sub_1D58CCE40()
{
  return MEMORY[0x1F41856B0]();
}

uint64_t sub_1D58CCE50()
{
  return MEMORY[0x1F41856C0]();
}

uint64_t sub_1D58CCE60()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_1D58CCE80()
{
  return MEMORY[0x1F4185A30]();
}

uint64_t sub_1D58CCE90()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1D58CCEB0()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_1D58CCEC0()
{
  return MEMORY[0x1F4185E00]();
}

uint64_t sub_1D58CCED0()
{
  return MEMORY[0x1F4185E08]();
}

uint64_t sub_1D58CCEE0()
{
  return MEMORY[0x1F4185E10]();
}

uint64_t sub_1D58CCEF0()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t sub_1D58CCF00()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1D58CCF10()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1D58CCF20()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t sub_1D58CCF30()
{
  return MEMORY[0x1F4185FC8]();
}

uint64_t sub_1D58CCF40()
{
  return MEMORY[0x1F4185FF0]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1F41138B8]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x1F410C8D0]();
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

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1F40D7E90](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
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

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return MEMORY[0x1F40D8A68](userNotification, responseFlags, timeout);
}

uint64_t CacheDeleteCopyPurgeableSpaceWithInfo()
{
  return MEMORY[0x1F410DCB0]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

uint64_t PLRequestCloudPhotoLibraryTransferProgressForLibrary()
{
  return MEMORY[0x1F413F720]();
}

uint64_t PLRequestSizeOfOriginalResourcesForLibrary()
{
  return MEMORY[0x1F413F728]();
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

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1F4186370]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1F40CA1E8]();
}

void bzero(void *a1, size_t a2)
{
}

const char *__cdecl class_getName(Class cls)
{
  return (const char *)MEMORY[0x1F4181548](cls);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
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

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBAC0](group, timeout);
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

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

int ffsctl(int a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x1F40CC0D8](*(void *)&a1, a2, a3, *(void *)&a4);
}

void free(void *a1)
{
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x1F40CC360](a1, a2, a3, a4, *(void *)&a5);
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1F40CC930]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1F40CCA60](info);
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

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1F40CD560](log, ptr);
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

uint64_t swift_allocBox()
{
  return MEMORY[0x1F41863D0]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x1F41863E0]();
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

uint64_t swift_continuation_init()
{
  return MEMORY[0x1F41881F0]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x1F4188200]();
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

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1F41864E0]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x1F41866A8]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1F41866F8]();
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

uint64_t swift_retain_n()
{
  return MEMORY[0x1F4186778]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1F4186898]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x1F41868B8]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x1F41868C0]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x1F41868C8]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}