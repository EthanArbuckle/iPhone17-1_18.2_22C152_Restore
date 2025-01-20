@interface UAFCommonUtilities
+ (BOOL)_getPopulationMapping:(id)a3 toAudience:(id *)a4 toServer:(id *)a5;
+ (BOOL)_setUAFPopulation:(id)a3 forAssetTypes:(id)a4;
+ (BOOL)deviceSupportAndUseHybridASR;
+ (BOOL)deviceSupportAssistantEngine;
+ (BOOL)deviceSupportFullUOD;
+ (BOOL)gmsAllowsAssets;
+ (BOOL)gmsWantsAssets;
+ (BOOL)isAssistantEnabled;
+ (BOOL)isChinaDeviceRegionCode;
+ (BOOL)isDictationEnabled;
+ (BOOL)isFullUODSupportedForStatus:(id)a3 language:(id)a4;
+ (BOOL)isGameModeEnabled;
+ (BOOL)isHybridUODSupportedForStatus:(id)a3 language:(id)a4;
+ (BOOL)isInexpensiveNetworkAvailable;
+ (BOOL)isInternalInstall;
+ (BOOL)isTop13Locale:(id)a3;
+ (BOOL)isUODAttentionRequired:(id)a3;
+ (BOOL)setUAFPallasURL:(id)a3 assetSet:(id)a4;
+ (BOOL)setUAFPopulation:(id)a3;
+ (BOOL)setUAFPopulation:(id)a3 assetSet:(id)a4;
+ (id)_getAssetTypeFromConfig;
+ (id)_getInternalBaseConfigDir;
+ (id)_getInternalConfigFilePath;
+ (id)_getPallasAudienceForType:(id)a3;
+ (id)_getPallasURLForType:(id)a3;
+ (id)bundle;
+ (id)currentAssistantLanguage;
+ (id)experimentIdentifiersTrialClient:(id)a3 trialNamespace:(id)a4;
+ (id)getAutoAssetType:(id)a3;
+ (id)getDefaultStoragePath;
+ (id)getDirectoryPath:(id)a3 trialNamespace:(id)a4 trialFactor:(id)a5;
+ (id)getFreeDiskSpaceInBytes;
+ (id)getISO8601Timestamp:(id)a3 withFractionalSeconds:(BOOL)a4;
+ (id)getMAPath:(int64_t)a3;
+ (id)getUAFPallasURLForAssetSet:(id)a3;
+ (id)getUAFPallasURLForAssetType:(id)a3;
+ (id)getUAFPopulationForAssetSet:(id)a3;
+ (id)getUAFPopulationForAssetType:(id)a3;
+ (id)mobileGestaltQuery:(id)a3;
+ (id)resetAutoAsset:(id)a3;
+ (id)resetAutoAssets;
+ (id)resetAutoAssets:(id)a3;
+ (id)rootDirectory;
+ (id)serializeDictToJSONData:(id)a3 error:(id *)a4;
+ (id)serializeDictToJSONStr:(id)a3 error:(id *)a4;
+ (id)simulatorResourcesDirectory;
+ (id)systemLanguage;
+ (id)trialClientWithProject:(id)a3;
+ (id)valueForEntitlement:(id)a3;
+ (int)openFD:(id)a3 oflags:(int)a4 mode:(int)a5 error:(id *)a6;
+ (int)rename:(id)a3 toPath:(id)a4 error:(id *)a5;
+ (int)stat:(id)a3 withBuf:(stat *)a4 error:(id *)a5;
+ (int64_t)_setPallasAudience:(id)a3 forType:(id)a4;
+ (int64_t)_setPallasURL:(id)a3 forType:(id)a4;
+ (passwd)getPWUID:(id)a3;
+ (unint64_t)getFreeDiskSpaceNeededInBytes:(unint64_t)a3;
+ (void)getUID:(unsigned int *)a3 andEUID:(unsigned int *)a4;
+ (void)resetAutoAsset:(id)a3 userInfo:(id)a4;
@end

@implementation UAFCommonUtilities

+ (BOOL)isInternalInstall
{
  if (qword_26AF0B9D0 != -1) {
    dispatch_once(&qword_26AF0B9D0, &__block_literal_global_6);
  }
  return _MergedGlobals_4;
}

+ (int)stat:(id)a3 withBuf:(stat *)a4 error:(id *)a5
{
  int v6 = stat((const char *)[a3 UTF8String], a4);
  int v7 = v6;
  if (a5 && v6 == -1)
  {
    *a5 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:*__error() userInfo:0];
  }
  return v7;
}

+ (id)getMAPath:(int64_t)a3
{
  v3 = @"/private/var/MobileAsset/AssetsV2";
  if (a3 == 2) {
    v3 = @"/private/var/MobileAsset/PreinstalledAssetsV2/InstallWithOs";
  }
  if (a3 == 1) {
    return @"/System/Library/PreinstalledAssetsV2/RequiredByOs";
  }
  else {
    return v3;
  }
}

+ (id)mobileGestaltQuery:(id)a3
{
  v3 = (void *)MGCopyAnswer();
  v4 = v3;
  if (v3)
  {
    v5 = [v3 description];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)rootDirectory
{
  return &stru_26EA999B8;
}

+ (id)valueForEntitlement:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v3 = (__CFString *)a3;
  v4 = SecTaskCreateFromSelf(0);
  if (v4)
  {
    v5 = v4;
    CFErrorRef error = 0;
    int v6 = (void *)SecTaskCopyValueForEntitlement(v4, v3, &error);
    CFRelease(v5);
    if (!v6)
    {
      CFErrorRef v7 = error;
      v8 = UAFGetLogCategory((void **)&UAFLogContextClient);
      v9 = v8;
      if (v7)
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v14 = "+[UAFCommonUtilities valueForEntitlement:]";
          _os_log_error_impl(&dword_23797A000, v9, OS_LOG_TYPE_ERROR, "%s SecTaskCopyValueForEntitlement() failed", buf, 0xCu);
        }

        CFRelease(error);
      }
      else
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          v14 = "+[UAFCommonUtilities valueForEntitlement:]";
          __int16 v15 = 2114;
          v16 = v3;
          _os_log_debug_impl(&dword_23797A000, v9, OS_LOG_TYPE_DEBUG, "%s %{public}@ entitlement not present", buf, 0x16u);
        }
      }
    }
  }
  else
  {
    v10 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v14 = "+[UAFCommonUtilities valueForEntitlement:]";
      _os_log_error_impl(&dword_23797A000, v10, OS_LOG_TYPE_ERROR, "%s SecTaskCreateFromSelf() failed.", buf, 0xCu);
    }

    int v6 = 0;
  }

  return v6;
}

uint64_t __39__UAFCommonUtilities_isInternalInstall__block_invoke()
{
  uint64_t result = os_variant_has_internal_content();
  _MergedGlobals_4 = result;
  return result;
}

+ (id)trialClientWithProject:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x263F80EB8] projectIdFromName:v3];
  if v4 && (uint64_t v5 = v4, (TRIProject_ProjectId_IsValidValue()))
  {
    int v6 = [MEMORY[0x263F80E18] clientWithIdentifier:v5];
    if (v6)
    {
      CFErrorRef v7 = v6;
      v8 = v7;
      goto LABEL_8;
    }
    v10 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315394;
      v12 = "+[UAFCommonUtilities trialClientWithProject:]";
      __int16 v13 = 2114;
      id v14 = v3;
      _os_log_error_impl(&dword_23797A000, v10, OS_LOG_TYPE_ERROR, "%s Could not create trial client for project %{public}@", (uint8_t *)&v11, 0x16u);
    }

    CFErrorRef v7 = 0;
  }
  else
  {
    CFErrorRef v7 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315394;
      v12 = "+[UAFCommonUtilities trialClientWithProject:]";
      __int16 v13 = 2114;
      id v14 = v3;
      _os_log_error_impl(&dword_23797A000, v7, OS_LOG_TYPE_ERROR, "%s Could not find TRIProject for %{public}@", (uint8_t *)&v11, 0x16u);
    }
  }
  v8 = 0;
LABEL_8:

  return v8;
}

+ (id)getDirectoryPath:(id)a3 trialNamespace:(id)a4 trialFactor:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = v9;
  int v11 = 0;
  if (v8 && v9)
  {
    v12 = +[UAFTrialConversions entitledTrialNamespaceNames];
    if (([v12 containsObject:v8] & 1) == 0)
    {
      id v14 = UAFGetLogCategory((void **)&UAFLogContextClient);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        int v22 = 136315650;
        v23 = "+[UAFCommonUtilities getDirectoryPath:trialNamespace:trialFactor:]";
        __int16 v24 = 2114;
        v25 = v10;
        __int16 v26 = 2114;
        id v27 = v8;
        _os_log_error_impl(&dword_23797A000, v14, OS_LOG_TYPE_ERROR, "%s Not including %{public}@ as its trial Namespace %{public}@ isn't entitled", (uint8_t *)&v22, 0x20u);
      }
      goto LABEL_17;
    }
    __int16 v13 = [v7 levelForFactor:v10 withNamespaceName:v8];
    if (!v13)
    {
      v20 = UAFGetLogCategory((void **)&UAFLogContextClient);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        int v22 = 136315394;
        v23 = "+[UAFCommonUtilities getDirectoryPath:trialNamespace:trialFactor:]";
        __int16 v24 = 2112;
        v25 = v10;
        _os_log_impl(&dword_23797A000, v20, OS_LOG_TYPE_DEFAULT, "%s No level for factor %@", (uint8_t *)&v22, 0x16u);
      }

      id v14 = 0;
      goto LABEL_17;
    }
    id v14 = v13;
    if ([v13 levelOneOfCase] == 101)
    {
      uint64_t v15 = [v14 directoryValue];
      if ([v15 hasPath])
      {
        v16 = [v14 directoryValue];
        uint64_t v17 = [v16 path];
        uint64_t v18 = [v17 length];

        if (v18)
        {
          v19 = [v14 directoryValue];
          int v11 = [v19 path];

LABEL_18:
          goto LABEL_19;
        }
LABEL_17:
        int v11 = 0;
        goto LABEL_18;
      }
    }
    else
    {
      uint64_t v15 = UAFGetLogCategory((void **)&UAFLogContextClient);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        int v22 = 136315650;
        v23 = "+[UAFCommonUtilities getDirectoryPath:trialNamespace:trialFactor:]";
        __int16 v24 = 2112;
        v25 = v10;
        __int16 v26 = 1024;
        LODWORD(v27) = [v14 levelOneOfCase];
        _os_log_error_impl(&dword_23797A000, v15, OS_LOG_TYPE_ERROR, "%s TRILevel is not a directory type: %@ %d", (uint8_t *)&v22, 0x1Cu);
      }
    }

    goto LABEL_17;
  }
LABEL_19:

  return v11;
}

+ (id)getDefaultStoragePath
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v12 = 0;
  +[UAFCommonUtilities getUID:&v12 andEUID:(char *)&v12 + 4];
  *__error() = 0;
  if (HIDWORD(v12)) {
    uint64_t v2 = HIDWORD(v12);
  }
  else {
    uint64_t v2 = v12;
  }
  id v3 = [NSNumber numberWithUnsignedInt:v2];
  uint64_t v4 = +[UAFCommonUtilities getPWUID:v3];

  if (v4 && v4->pw_dir)
  {
    uint64_t v5 = objc_msgSend(NSString, "stringWithUTF8String:");
    if (!v5)
    {
      int v6 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        id v14 = "+[UAFCommonUtilities getDefaultStoragePath]";
        _os_log_error_impl(&dword_23797A000, v6, OS_LOG_TYPE_ERROR, "%s Failed to resolve home dir path.", buf, 0xCu);
      }
    }
    id v7 = [v5 stringByAppendingString:@"/Library/UnifiedAssetFramework"];
  }
  else
  {
    uint64_t v5 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v9 = *__error();
      v10 = __error();
      int v11 = strerror(*v10);
      *(_DWORD *)buf = 136315650;
      id v14 = "+[UAFCommonUtilities getDefaultStoragePath]";
      __int16 v15 = 1024;
      int v16 = v9;
      __int16 v17 = 2082;
      uint64_t v18 = v11;
      _os_log_error_impl(&dword_23797A000, v5, OS_LOG_TYPE_ERROR, "%s Could not retrieve pwent: %d %{public}s", buf, 0x1Cu);
    }
    id v7 = 0;
  }

  return v7;
}

+ (void)getUID:(unsigned int *)a3 andEUID:(unsigned int *)a4
{
  if (a3) {
    *a3 = getuid();
  }
  if (a4) {
    *a4 = geteuid();
  }
}

+ (passwd)getPWUID:(id)a3
{
  uid_t v3 = [a3 unsignedIntValue];

  return getpwuid(v3);
}

+ (id)bundle
{
  uint64_t v2 = (void *)bundle_sUAFBundle;
  if (!bundle_sUAFBundle)
  {
    uint64_t v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v4 = (void *)bundle_sUAFBundle;
    bundle_sUAFBundle = v3;

    uint64_t v2 = (void *)bundle_sUAFBundle;
  }

  return v2;
}

+ (BOOL)isDictationEnabled
{
  uint64_t v2 = [getAFPreferencesClass() sharedPreferences];
  char v3 = [v2 dictationIsEnabled];

  return v3;
}

+ (BOOL)isAssistantEnabled
{
  uint64_t v2 = [getAFPreferencesClass() sharedPreferences];
  char v3 = [v2 assistantIsEnabled];

  return v3;
}

+ (id)currentAssistantLanguage
{
  uint64_t v2 = [getAFPreferencesClass() sharedPreferences];
  char v3 = [v2 languageCode];

  return v3;
}

+ (BOOL)deviceSupportAssistantEngine
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v2 = (uint64_t (*)(void))getAFDeviceSupportsSAESymbolLoc_ptr;
  int v9 = getAFDeviceSupportsSAESymbolLoc_ptr;
  if (!getAFDeviceSupportsSAESymbolLoc_ptr)
  {
    char v3 = (void *)AssistantServicesLibrary_1();
    v7[3] = (uint64_t)dlsym(v3, "AFDeviceSupportsSAE");
    getAFDeviceSupportsSAESymbolLoc_ptr = (_UNKNOWN *)v7[3];
    uint64_t v2 = (uint64_t (*)(void))v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (!v2)
  {
    dlerror();
    uint64_t v5 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v6, 8);
    _Unwind_Resume(v5);
  }
  return v2();
}

+ (BOOL)deviceSupportFullUOD
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v2 = (uint64_t (*)(void))getAFDeviceSupportsSiriUODSymbolLoc_ptr;
  int v9 = getAFDeviceSupportsSiriUODSymbolLoc_ptr;
  if (!getAFDeviceSupportsSiriUODSymbolLoc_ptr)
  {
    char v3 = (void *)AssistantServicesLibrary_1();
    v7[3] = (uint64_t)dlsym(v3, "AFDeviceSupportsSiriUOD");
    getAFDeviceSupportsSiriUODSymbolLoc_ptr = (_UNKNOWN *)v7[3];
    uint64_t v2 = (uint64_t (*)(void))v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (!v2)
  {
    dlerror();
    uint64_t v5 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v6, 8);
    _Unwind_Resume(v5);
  }
  return v2();
}

+ (BOOL)deviceSupportAndUseHybridASR
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v2 = (uint64_t (*)(void))getAFShouldRunAsrOnServerForUODSymbolLoc_ptr;
  int v9 = getAFShouldRunAsrOnServerForUODSymbolLoc_ptr;
  if (!getAFShouldRunAsrOnServerForUODSymbolLoc_ptr)
  {
    char v3 = (void *)AssistantServicesLibrary_1();
    v7[3] = (uint64_t)dlsym(v3, "AFShouldRunAsrOnServerForUOD");
    getAFShouldRunAsrOnServerForUODSymbolLoc_ptr = (_UNKNOWN *)v7[3];
    uint64_t v2 = (uint64_t (*)(void))v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (!v2)
  {
    dlerror();
    uint64_t v5 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v6, 8);
    _Unwind_Resume(v5);
  }
  return v2();
}

+ (BOOL)isFullUODSupportedForStatus:(id)a3 language:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  id v8 = v6;
  uint64_t v14 = 0;
  __int16 v15 = &v14;
  uint64_t v16 = 0x2020000000;
  int v9 = (uint64_t (*)(id, id))getAFUODStatusSupportedFullSymbolLoc_ptr;
  __int16 v17 = getAFUODStatusSupportedFullSymbolLoc_ptr;
  if (!getAFUODStatusSupportedFullSymbolLoc_ptr)
  {
    v10 = (void *)AssistantServicesLibrary_1();
    v15[3] = (uint64_t)dlsym(v10, "AFUODStatusSupportedFull");
    getAFUODStatusSupportedFullSymbolLoc_ptr = (_UNKNOWN *)v15[3];
    int v9 = (uint64_t (*)(id, id))v15[3];
  }
  _Block_object_dispose(&v14, 8);
  if (!v9)
  {
    dlerror();
    __int16 v13 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v14, 8);
    _Unwind_Resume(v13);
  }
  char v11 = v9(v7, v8);

  return v11;
}

+ (BOOL)isHybridUODSupportedForStatus:(id)a3 language:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  id v8 = v6;
  uint64_t v14 = 0;
  __int16 v15 = &v14;
  uint64_t v16 = 0x2020000000;
  int v9 = (uint64_t (*)(id, id))getAFUODStatusSupportedHybridSymbolLoc_ptr;
  __int16 v17 = getAFUODStatusSupportedHybridSymbolLoc_ptr;
  if (!getAFUODStatusSupportedHybridSymbolLoc_ptr)
  {
    v10 = (void *)AssistantServicesLibrary_1();
    v15[3] = (uint64_t)dlsym(v10, "AFUODStatusSupportedHybrid");
    getAFUODStatusSupportedHybridSymbolLoc_ptr = (_UNKNOWN *)v15[3];
    int v9 = (uint64_t (*)(id, id))v15[3];
  }
  _Block_object_dispose(&v14, 8);
  if (!v9)
  {
    dlerror();
    __int16 v13 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v14, 8);
    _Unwind_Resume(v13);
  }
  char v11 = v9(v7, v8);

  return v11;
}

+ (BOOL)isTop13Locale:(id)a3
{
  id v3 = a3;
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v4 = (uint64_t (*)(id))getAFIsTop13LocaleSymbolLoc_ptr;
  uint64_t v12 = getAFIsTop13LocaleSymbolLoc_ptr;
  if (!getAFIsTop13LocaleSymbolLoc_ptr)
  {
    id v5 = (void *)AssistantServicesLibrary_1();
    v10[3] = (uint64_t)dlsym(v5, "AFIsTop13Locale");
    getAFIsTop13LocaleSymbolLoc_ptr = (_UNKNOWN *)v10[3];
    uint64_t v4 = (uint64_t (*)(id))v10[3];
  }
  _Block_object_dispose(&v9, 8);
  if (!v4)
  {
    dlerror();
    id v8 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v9, 8);
    _Unwind_Resume(v8);
  }
  char v6 = v4(v3);

  return v6;
}

+ (BOOL)isUODAttentionRequired:(id)a3
{
  id v3 = a3;
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v4 = (uint64_t (*)(id))getAFUODAttentionRequiredSymbolLoc_ptr;
  uint64_t v12 = getAFUODAttentionRequiredSymbolLoc_ptr;
  if (!getAFUODAttentionRequiredSymbolLoc_ptr)
  {
    id v5 = (void *)AssistantServicesLibrary_1();
    v10[3] = (uint64_t)dlsym(v5, "AFUODAttentionRequired");
    getAFUODAttentionRequiredSymbolLoc_ptr = (_UNKNOWN *)v10[3];
    uint64_t v4 = (uint64_t (*)(id))v10[3];
  }
  _Block_object_dispose(&v9, 8);
  if (!v4)
  {
    dlerror();
    id v8 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v9, 8);
    _Unwind_Resume(v8);
  }
  char v6 = v4(v3);

  return v6;
}

+ (BOOL)gmsAllowsAssets
{
  if (gmsAllowsAssets_assetsAllowed) {
    return 1;
  }
  id v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  id GMAvailabilityWrapperClass = getGMAvailabilityWrapperClass();
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __37__UAFCommonUtilities_gmsAllowsAssets__block_invoke;
  v7[3] = &unk_264CEB5E8;
  id v8 = v3;
  id v5 = v3;
  [GMAvailabilityWrapperClass getShouldNotDownloadOrServeAppleIntelligenceAssetsWithCompletionHandler:v7];
  dispatch_group_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  BOOL v2 = gmsAllowsAssets_assetsAllowed != 0;

  return v2;
}

void __37__UAFCommonUtilities_gmsAllowsAssets__block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a3;
  gmsAllowsAssets_assetsAllowed = a2 ^ 1;
  if (v5)
  {
    char v6 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315394;
      id v8 = "+[UAFCommonUtilities gmsAllowsAssets]_block_invoke";
      __int16 v9 = 2114;
      id v10 = v5;
      _os_log_error_impl(&dword_23797A000, v6, OS_LOG_TYPE_ERROR, "%s Failed to determine if Apple Intelligence Assets allowed: %{public}@", (uint8_t *)&v7, 0x16u);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

+ (BOOL)gmsWantsAssets
{
  id GMAvailabilityWrapperClass = getGMAvailabilityWrapperClass();

  return [GMAvailabilityWrapperClass isOkayToHaveAsset];
}

+ (void)resetAutoAsset:(id)a3 userInfo:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  int v7 = [v5 autoAssetType];

  id v8 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      id v10 = [v5 name];
      *(_DWORD *)buf = 136315394;
      uint64_t v19 = "+[UAFCommonUtilities resetAutoAsset:userInfo:]";
      __int16 v20 = 2114;
      v21 = v10;
      _os_log_impl(&dword_23797A000, v8, OS_LOG_TYPE_DEFAULT, "%s Removing autoassetset %{public}@", buf, 0x16u);
    }
    uint64_t v11 = dispatch_group_create();
    dispatch_group_enter(v11);
    uint64_t v12 = +[UAFAutoAssetManager getSerialQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __46__UAFCommonUtilities_resetAutoAsset_userInfo___block_invoke;
    block[3] = &unk_264CEB638;
    id v15 = v5;
    id v16 = v6;
    __int16 v17 = v11;
    id v8 = v11;
    dispatch_sync(v12, block);

    dispatch_group_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  }
  else if (v9)
  {
    __int16 v13 = [v5 name];
    *(_DWORD *)buf = 136315394;
    uint64_t v19 = "+[UAFCommonUtilities resetAutoAsset:userInfo:]";
    __int16 v20 = 2114;
    v21 = v13;
    _os_log_impl(&dword_23797A000, v8, OS_LOG_TYPE_DEFAULT, "%s No auto asset type defined for %{public}@", buf, 0x16u);
  }
}

void __46__UAFCommonUtilities_resetAutoAsset_userInfo___block_invoke(id *a1)
{
  BOOL v2 = [a1[4] name];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __46__UAFCommonUtilities_resetAutoAsset_userInfo___block_invoke_2;
  v3[3] = &unk_264CEB610;
  id v4 = a1[5];
  id v5 = a1[4];
  id v6 = a1[6];
  +[UAFAutoAssetManager removeAutoAssetSet:v2 completion:v3];
}

void __46__UAFCommonUtilities_resetAutoAsset_userInfo___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = v3;
  if (v3 && [v3 code] != 6551)
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = [*(id *)(a1 + 40) name];
    [v5 setObject:v4 forKeyedSubscript:v6];

    int v7 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [*(id *)(a1 + 40) name];
      int v16 = 136315394;
      __int16 v17 = "+[UAFCommonUtilities resetAutoAsset:userInfo:]_block_invoke_2";
      __int16 v18 = 2114;
      uint64_t v19 = v8;
      _os_log_impl(&dword_23797A000, v7, OS_LOG_TYPE_DEFAULT, "%s Attempting force removing asset set %{public}@", (uint8_t *)&v16, 0x16u);
    }
    BOOL v9 = [*(id *)(a1 + 40) name];
    id v10 = +[UAFAutoAssetManager forceRemoveAutoAssetSet:v9];

    if (v10)
    {
      uint64_t v11 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = [*(id *)(a1 + 40) name];
        int v16 = 136315650;
        __int16 v17 = "+[UAFCommonUtilities resetAutoAsset:userInfo:]_block_invoke";
        __int16 v18 = 2114;
        uint64_t v19 = v12;
        __int16 v20 = 2112;
        v21 = v10;
        _os_log_impl(&dword_23797A000, v11, OS_LOG_TYPE_DEFAULT, "%s Force remove of %{public}@ failed: %@", (uint8_t *)&v16, 0x20u);
      }
      __int16 v13 = *(void **)(a1 + 32);
      uint64_t v14 = [*(id *)(a1 + 40) name];
      id v15 = [@"force-" stringByAppendingString:v14];
      [v13 setObject:v10 forKeyedSubscript:v15];
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

+ (id)resetAutoAsset:(id)a3
{
  id v3 = (void *)MEMORY[0x263EFF9A0];
  id v4 = a3;
  id v5 = [v3 dictionary];
  [(id)objc_opt_class() resetAutoAsset:v4 userInfo:v5];

  if ([v5 count])
  {
    id v6 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.UnifiedAssetFramework" code:-1 userInfo:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)resetAutoAssets:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263EFF9A0] dictionary];
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
        objc_msgSend((id)objc_opt_class(), "resetAutoAsset:userInfo:", *(void *)(*((void *)&v12 + 1) + 8 * i), v4, (void)v12);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  if ([v4 count])
  {
    id v10 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.UnifiedAssetFramework" code:-1 userInfo:v4];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

+ (id)resetAutoAssets
{
  BOOL v2 = objc_opt_class();
  id v3 = +[UAFConfigurationManager defaultManager];
  id v4 = [v3 getAllAssetSets];
  id v5 = [v2 resetAutoAssets:v4];

  return v5;
}

+ (BOOL)setUAFPopulation:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() _getAssetTypeFromConfig];
  char v5 = [(id)objc_opt_class() _setUAFPopulation:v3 forAssetTypes:v4];

  return v5;
}

+ (BOOL)setUAFPopulation:(id)a3 assetSet:(id)a4
{
  char v5 = (__CFString *)a3;
  id v6 = a4;
  uint64_t v7 = [[UAFConfigurationManager alloc] initWithURLs:0];
  uint64_t v8 = [(UAFConfigurationManager *)v7 getAssetSet:v6];

  if (v8)
  {
    BOOL v9 = [v8 autoAssetType];
    if (!v9)
    {
      BOOL v14 = 0;
LABEL_25:

      goto LABEL_26;
    }
    unsigned __int8 v10 = [(id)objc_opt_class() isInternalInstall];
    if (((v5 == 0) & v10) != 0) {
      uint64_t v11 = @"Carry";
    }
    else {
      uint64_t v11 = v5;
    }
    if ((v10 & 1) != 0 || v5)
    {
      id v20 = 0;
      id v21 = 0;
      int v15 = [(id)objc_opt_class() _getPopulationMapping:v11 toAudience:&v21 toServer:&v20];
      char v5 = (__CFString *)v21;
      id v12 = v20;
      if (!v15)
      {
        BOOL v14 = 0;
LABEL_24:

        char v5 = v11;
        goto LABEL_25;
      }
      if (([(__CFString *)v11 isEqualToString:v5] & 1) == 0)
      {
        if (v12)
        {
          long long v13 = [NSURL URLWithString:v12];
        }
        else
        {
          long long v13 = 0;
        }
LABEL_19:
        uint64_t v17 = [(id)objc_opt_class() _setPallasAudience:v5 forType:v9];
        uint64_t v18 = [(id)objc_opt_class() _setPallasURL:v13 forType:v9];
        if (v17) {
          uint64_t v16 = v17;
        }
        else {
          uint64_t v16 = v18;
        }

        goto LABEL_23;
      }
    }
    else
    {
      id v12 = 0;
      uint64_t v11 = 0;
      long long v13 = 0;
      if (![0 isEqualToString:0]) {
        goto LABEL_19;
      }
    }
    uint64_t v16 = [(id)objc_opt_class() _setPallasAudience:v11 forType:v9];
LABEL_23:
    BOOL v14 = v16 == 0;
    goto LABEL_24;
  }
  BOOL v14 = 0;
LABEL_26:

  return v14;
}

+ (BOOL)setUAFPallasURL:(id)a3 assetSet:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [[UAFConfigurationManager alloc] initWithURLs:0];
  uint64_t v8 = [(UAFConfigurationManager *)v7 getAssetSet:v6];

  if (v8)
  {
    BOOL v9 = [v8 autoAssetType];
    if (v9)
    {
      if (v5)
      {
        unsigned __int8 v10 = [NSURL URLWithString:v5];
      }
      else
      {
        unsigned __int8 v10 = 0;
      }
      BOOL v11 = [(id)objc_opt_class() _setPallasURL:v10 forType:v9] == 0;
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

+ (id)getAutoAssetType:(id)a3
{
  id v3 = a3;
  id v4 = [[UAFConfigurationManager alloc] initWithURLs:0];
  id v5 = [(UAFConfigurationManager *)v4 getAssetSet:v3];

  if (v5)
  {
    id v6 = [v5 autoAssetType];
    uint64_t v7 = v6;
    if (v6) {
      id v8 = v6;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

+ (id)getUAFPopulationForAssetSet:(id)a3
{
  id v3 = +[UAFCommonUtilities getAutoAssetType:a3];
  if (v3)
  {
    id v4 = [(id)objc_opt_class() getUAFPopulationForAssetType:v3];
  }
  else
  {
    id v4 = &stru_26EA999B8;
  }

  return v4;
}

+ (id)getUAFPopulationForAssetType:(id)a3
{
  id v3 = +[UAFCommonUtilities _getPallasAudienceForType:a3];
  id v4 = v3;
  if (v3) {
    id v5 = v3;
  }
  else {
    id v5 = &stru_26EA999B8;
  }

  return v5;
}

+ (id)getUAFPallasURLForAssetSet:(id)a3
{
  id v3 = +[UAFCommonUtilities getAutoAssetType:a3];
  if (v3)
  {
    id v4 = [(id)objc_opt_class() getUAFPallasURLForAssetType:v3];
  }
  else
  {
    id v4 = &stru_26EA999B8;
  }

  return v4;
}

+ (id)getUAFPallasURLForAssetType:(id)a3
{
  id v3 = +[UAFCommonUtilities _getPallasURLForType:a3];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 description];
  }
  else
  {
    id v5 = &stru_26EA999B8;
  }

  return v5;
}

+ (id)_getAssetTypeFromConfig
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  BOOL v2 = +[UAFConfigurationManager defaultManager];
  id v3 = [v2 getAllAssetSets];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = 0;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v4);
        }
        unsigned __int8 v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        BOOL v11 = objc_msgSend(v10, "autoAssetType", (void)v14);

        if (v11)
        {
          if (!v7) {
            id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
          }
          id v12 = [v10 autoAssetType];
          [v7 addObject:v12];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)_getInternalBaseConfigDir
{
  BOOL v2 = [(id)objc_opt_class() rootDirectory];
  id v3 = [v2 stringByAppendingString:@"/AppleInternal/Library/UnifiedAssetFramework"];

  return v3;
}

+ (id)_getInternalConfigFilePath
{
  return @"/Pallas/pallas_internal.plist";
}

+ (BOOL)_getPopulationMapping:(id)a3 toAudience:(id *)a4 toServer:(id *)a5
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v7 = a3;
  uint64_t v8 = [(id)objc_opt_class() _getInternalBaseConfigDir];
  BOOL v9 = [(id)objc_opt_class() _getInternalConfigFilePath];
  unsigned __int8 v10 = [v8 stringByAppendingString:v9];

  BOOL v11 = [NSURL fileURLWithPath:v10 isDirectory:0];
  id v25 = 0;
  id v12 = [NSDictionary dictionaryWithContentsOfURL:v11 error:&v25];
  id v13 = v25;
  long long v14 = v13;
  if (!v12 || v13)
  {
    uint64_t v18 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v23 = [v11 absoluteURL];
      __int16 v24 = [v23 path];
      *(_DWORD *)buf = 136315650;
      id v27 = "+[UAFCommonUtilities _getPopulationMapping:toAudience:toServer:]";
      __int16 v28 = 2112;
      id v29 = v24;
      __int16 v30 = 2112;
      v31 = v14;
      _os_log_error_impl(&dword_23797A000, v18, OS_LOG_TYPE_ERROR, "%s Failed to load %@ %@", buf, 0x20u);
    }
    goto LABEL_13;
  }
  if (a5)
  {
    long long v15 = [v12 objectForKeyedSubscript:v7];
    *a5 = [v15 objectForKeyedSubscript:@"URL"];

    if ([*a5 isEqualToString:@"nil"]) {
      *a5 = 0;
    }
  }
  if (!a4) {
    goto LABEL_10;
  }
  long long v16 = [v12 objectForKeyedSubscript:v7];
  *a4 = [v16 objectForKeyedSubscript:@"Audience"];

  if (([*a4 isEqualToString:@"prod"] & 1) != 0
    || [*a4 isEqualToString:@"seed"])
  {
    *a4 = @"0c88076f-c292-4dad-95e7-304db9d29d34";
LABEL_10:
    BOOL v17 = 1;
    goto LABEL_14;
  }
  if ([*a4 isEqualToString:@"nil"])
  {
    BOOL v20 = 0;
    *a4 = 0;
  }
  else
  {
    id v21 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v7];
    BOOL v20 = v21 == 0;
    if (v21) {
      *a4 = v7;
    }

    if (*a4) {
      goto LABEL_10;
    }
  }
  uint64_t v22 = [v12 objectForKeyedSubscript:v7];

  BOOL v17 = 1;
  if (v20 && !v22)
  {
    uint64_t v18 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v27 = "+[UAFCommonUtilities _getPopulationMapping:toAudience:toServer:]";
      __int16 v28 = 2114;
      id v29 = v7;
      _os_log_error_impl(&dword_23797A000, v18, OS_LOG_TYPE_ERROR, "%s %{public}@ is not a valid population", buf, 0x16u);
    }
LABEL_13:

    BOOL v17 = 0;
  }
LABEL_14:

  return v17;
}

+ (BOOL)_setUAFPopulation:(id)a3 forAssetTypes:(id)a4
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    int v7 = [(id)objc_opt_class() isInternalInstall];
    uint64_t v8 = 0;
    id v9 = 0;
    unsigned __int8 v10 = 0;
    if (v5 && v7)
    {
      id v35 = 0;
      id v36 = 0;
      int v11 = [(id)objc_opt_class() _getPopulationMapping:v5 toAudience:&v36 toServer:&v35];
      id v9 = v36;
      id v12 = v35;
      unsigned __int8 v10 = v12;
      if (!v11)
      {
        BOOL v13 = 0;
LABEL_30:

        goto LABEL_31;
      }
      if (v12) {
        uint64_t v8 = (void *)[objc_alloc(NSURL) initWithString:v12];
      }
      else {
        uint64_t v8 = 0;
      }
    }
    id v28 = v6;
    id v29 = v5;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id obj = v6;
    uint64_t v14 = [obj countByEnumeratingWithState:&v31 objects:v45 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v32 != v16) {
            objc_enumerationMutation(obj);
          }
          uint64_t v18 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          uint64_t v19 = [(id)objc_opt_class() _setPallasURL:v8 forType:v18];
          BOOL v20 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
          id v21 = v20;
          if (v19)
          {
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              uint64_t v22 = MEMORY[0x237E26750](v19);
              *(_DWORD *)buf = 136315906;
              v38 = "+[UAFCommonUtilities _setUAFPopulation:forAssetTypes:]";
              __int16 v39 = 2114;
              id v40 = v8;
              __int16 v41 = 2114;
              id v42 = v18;
              __int16 v43 = 2114;
              v44 = v22;
              _os_log_error_impl(&dword_23797A000, v21, OS_LOG_TYPE_ERROR, "%s Failed to set Pallas URL to %{public}@ for %{public}@: %{public}@", buf, 0x2Au);
            }
          }
          else if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315906;
            v38 = "+[UAFCommonUtilities _setUAFPopulation:forAssetTypes:]";
            __int16 v39 = 2114;
            id v40 = v29;
            __int16 v41 = 2114;
            id v42 = v8;
            __int16 v43 = 2114;
            v44 = v18;
            _os_log_impl(&dword_23797A000, v21, OS_LOG_TYPE_DEFAULT, "%s Setting MobileAsset to UAF population %{public}@ Pallas URL %{public}@ for asset type %{public}@", buf, 0x2Au);
          }

          uint64_t v23 = [(id)objc_opt_class() _setPallasAudience:v9 forType:v18];
          __int16 v24 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
          id v25 = v24;
          if (v23)
          {
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              __int16 v26 = MEMORY[0x237E26750](v23);
              *(_DWORD *)buf = 136315906;
              v38 = "+[UAFCommonUtilities _setUAFPopulation:forAssetTypes:]";
              __int16 v39 = 2114;
              id v40 = v9;
              __int16 v41 = 2114;
              id v42 = v18;
              __int16 v43 = 2114;
              v44 = v26;
              _os_log_error_impl(&dword_23797A000, v25, OS_LOG_TYPE_ERROR, "%s Failed to set Pallas audience to %{public}@ for %{public}@: %{public}@", buf, 0x2Au);
            }
          }
          else if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315906;
            v38 = "+[UAFCommonUtilities _setUAFPopulation:forAssetTypes:]";
            __int16 v39 = 2114;
            id v40 = v29;
            __int16 v41 = 2114;
            id v42 = v9;
            __int16 v43 = 2114;
            v44 = v18;
            _os_log_impl(&dword_23797A000, v25, OS_LOG_TYPE_DEFAULT, "%s Setting MobileAsset to UAF population %{public}@ Pallas Audience %{public}@ for asset type %{public}@", buf, 0x2Au);
          }
        }
        uint64_t v15 = [obj countByEnumeratingWithState:&v31 objects:v45 count:16];
      }
      while (v15);
    }

    BOOL v13 = 1;
    id v6 = v28;
    id v5 = v29;
    goto LABEL_30;
  }
  unsigned __int8 v10 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v38 = "+[UAFCommonUtilities _setUAFPopulation:forAssetTypes:]";
    _os_log_impl(&dword_23797A000, v10, OS_LOG_TYPE_DEFAULT, "%s Skipping setUAFPopulation due to nil AssetTypes", buf, 0xCu);
  }
  BOOL v13 = 1;
LABEL_31:

  return v13;
}

+ (id)_getPallasURLForType:(id)a3
{
}

+ (id)_getPallasAudienceForType:(id)a3
{
}

+ (int64_t)_setPallasURL:(id)a3 forType:(id)a4
{
}

+ (int64_t)_setPallasAudience:(id)a3 forType:(id)a4
{
}

+ (id)simulatorResourcesDirectory
{
  return 0;
}

+ (int)openFD:(id)a3 oflags:(int)a4 mode:(int)a5 error:(id *)a6
{
  int v7 = open((const char *)[a3 fileSystemRepresentation], a4, a5);
  int v8 = v7;
  if (a6 && v7 == -1)
  {
    *a6 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:*__error() userInfo:0];
  }
  return v8;
}

+ (int)rename:(id)a3 toPath:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (const std::__fs::filesystem::path *)[v7 fileSystemRepresentation];
  id v10 = v8;
  int v11 = (const std::__fs::filesystem::path *)[v10 fileSystemRepresentation];

  rename(v9, v11, v12);
  int v14 = v13;
  if (a5 && v13 == -1)
  {
    *a5 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:*__error() userInfo:0];
  }
  return v14;
}

+ (id)systemLanguage
{
  BOOL v2 = [MEMORY[0x263EFF960] currentLocale];
  id v3 = [MEMORY[0x263EFF960] preferredLanguages];
  id v4 = v3;
  if (v3 && [v3 count])
  {
    id v5 = [v4 objectAtIndexedSubscript:0];
    id v6 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:v5];
    id v7 = v6;
    if (v6)
    {
      id v8 = [v6 countryCode];

      if (v8)
      {
        id v9 = v7;

        BOOL v2 = v9;
      }
    }
  }
  id v10 = [v2 languageCode];
  int v11 = [v2 countryCode];

  if (v11)
  {
    id v12 = [v2 countryCode];
    uint64_t v13 = [v10 stringByAppendingFormat:@"-%@", v12];

    id v10 = (void *)v13;
  }

  return v10;
}

+ (id)getFreeDiskSpaceInBytes
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  BOOL v2 = +[UAFCommonUtilities getMAPath:3];
  id v3 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v15 = "+[UAFCommonUtilities getFreeDiskSpaceInBytes]";
    __int16 v16 = 2112;
    id v17 = v2;
    _os_log_impl(&dword_23797A000, v3, OS_LOG_TYPE_DEFAULT, "%s #settings Using path to check for free space: %@", buf, 0x16u);
  }

  id v4 = [MEMORY[0x263F08850] defaultManager];
  id v13 = 0;
  id v5 = [v4 attributesOfFileSystemForPath:v2 error:&v13];
  id v6 = v13;

  if (v6)
  {
    id v7 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
LABEL_5:

      id v8 = 0;
      goto LABEL_7;
    }
    *(_DWORD *)buf = 136315394;
    uint64_t v15 = "+[UAFCommonUtilities getFreeDiskSpaceInBytes]";
    __int16 v16 = 2112;
    id v17 = v6;
    id v10 = "%s #settings Error getting free disk space: %@";
    int v11 = v7;
    uint32_t v12 = 22;
LABEL_13:
    _os_log_error_impl(&dword_23797A000, v11, OS_LOG_TYPE_ERROR, v10, buf, v12);
    goto LABEL_5;
  }
  id v8 = [v5 objectForKey:*MEMORY[0x263F080C8]];
  if (!v8)
  {
    id v7 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_5;
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v15 = "+[UAFCommonUtilities getFreeDiskSpaceInBytes]";
    id v10 = "%s #settings Error getting free size";
    int v11 = v7;
    uint32_t v12 = 12;
    goto LABEL_13;
  }
LABEL_7:

  return v8;
}

+ (unint64_t)getFreeDiskSpaceNeededInBytes:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = [(id)objc_opt_class() getFreeDiskSpaceInBytes];
  id v5 = v4;
  if (v4)
  {
    unint64_t v6 = [v4 unsignedLongLongValue];
    unint64_t v7 = 2 * a3;
    id v8 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315650;
      uint32_t v12 = "+[UAFCommonUtilities getFreeDiskSpaceNeededInBytes:]";
      __int16 v13 = 2048;
      unint64_t v14 = v6;
      __int16 v15 = 2048;
      unint64_t v16 = v7;
      _os_log_impl(&dword_23797A000, v8, OS_LOG_TYPE_DEFAULT, "%s #settings Free space %llu / Download size %llu", (uint8_t *)&v11, 0x20u);
    }

    if (v7 >= v6) {
      unint64_t v9 = v7 - v6;
    }
    else {
      unint64_t v9 = 0;
    }
  }
  else
  {
    unint64_t v9 = 0;
  }

  return v9;
}

+ (id)serializeDictToJSONData:(id)a3 error:(id *)a4
{
  v20[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (([MEMORY[0x263F08900] isValidJSONObject:v5] & 1) == 0)
  {
    if (a4)
    {
      unint64_t v9 = (void *)MEMORY[0x263F087E8];
      uint64_t v19 = *MEMORY[0x263F08338];
      v20[0] = @"not a valid dictionary for JSON serialization";
      id v10 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];
      *a4 = [v9 errorWithDomain:@"com.apple.UnifiedAssetFramework" code:5100 userInfo:v10];
    }
    unint64_t v7 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    int v15 = 136315138;
    unint64_t v16 = "+[UAFCommonUtilities serializeDictToJSONData:error:]";
    int v11 = "%s not a valid dictionary for JSON serialization";
    uint32_t v12 = v7;
    uint32_t v13 = 12;
    goto LABEL_12;
  }
  unint64_t v6 = [MEMORY[0x263F08900] dataWithJSONObject:v5 options:11 error:a4];
  if (v6) {
    goto LABEL_14;
  }
  unint64_t v7 = UAFGetLogCategory((void **)&UAFLogContextClient);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (a4) {
      id v8 = (__CFString *)*a4;
    }
    else {
      id v8 = @"unknown";
    }
    int v15 = 136315394;
    unint64_t v16 = "+[UAFCommonUtilities serializeDictToJSONData:error:]";
    __int16 v17 = 2114;
    uint64_t v18 = v8;
    int v11 = "%s could not serialize dictionary to json: %{public}@";
    uint32_t v12 = v7;
    uint32_t v13 = 22;
LABEL_12:
    _os_log_impl(&dword_23797A000, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v15, v13);
  }
LABEL_13:

  unint64_t v6 = 0;
LABEL_14:

  return v6;
}

+ (id)serializeDictToJSONStr:(id)a3 error:(id *)a4
{
  id v5 = +[UAFCommonUtilities serializeDictToJSONData:error:](UAFCommonUtilities, "serializeDictToJSONData:error:", a3);
  if (!v5 || a4 && *a4)
  {
    unint64_t v6 = 0;
  }
  else
  {
    id v7 = [NSString alloc];
    id v8 = v5;
    unint64_t v6 = objc_msgSend(v7, "initWithBytes:length:encoding:", objc_msgSend(v8, "bytes"), objc_msgSend(v8, "length"), 4);
  }

  return v6;
}

+ (id)getISO8601Timestamp:(id)a3 withFractionalSeconds:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    id v5 = [MEMORY[0x263EFF910] date];
  }
  unint64_t v6 = [MEMORY[0x263EFFA18] timeZoneWithAbbreviation:@"GMT"];
  if (!v6)
  {
    unint64_t v6 = [MEMORY[0x263EFFA18] systemTimeZone];
    id v7 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = [v6 name];
      int v12 = 136315394;
      uint32_t v13 = "+[UAFCommonUtilities getISO8601Timestamp:withFractionalSeconds:]";
      __int16 v14 = 2114;
      int v15 = v8;
      _os_log_impl(&dword_23797A000, v7, OS_LOG_TYPE_INFO, "%s Failed to get GMT timezone, falling back to system TZ '%{public}@'", (uint8_t *)&v12, 0x16u);
    }
  }
  if (v4) {
    uint64_t v9 = 3955;
  }
  else {
    uint64_t v9 = 1907;
  }
  id v10 = [MEMORY[0x263F088C0] stringFromDate:v5 timeZone:v6 formatOptions:v9];

  return v10;
}

+ (id)experimentIdentifiersTrialClient:(id)a3 trialNamespace:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = +[UAFTrialConversions entitledTrialNamespaceNames];
  if ([v7 containsObject:v6])
  {
    id v8 = [v5 experimentIdentifiersWithNamespaceName:v6];
  }
  else
  {
    uint64_t v9 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315394;
      int v12 = "+[UAFCommonUtilities experimentIdentifiersTrialClient:trialNamespace:]";
      __int16 v13 = 2114;
      id v14 = v6;
      _os_log_error_impl(&dword_23797A000, v9, OS_LOG_TYPE_ERROR, "%s Not including trial Namespace %{public}@ isn't entitled", (uint8_t *)&v11, 0x16u);
    }

    id v8 = 0;
  }

  return v8;
}

+ (BOOL)isInexpensiveNetworkAvailable
{
  BOOL v2 = [MEMORY[0x263F14420] sharedDefaultEvaluator];
  id v3 = [v2 path];

  if (([v3 status] & 0xFFFFFFFFFFFFFFFDLL) == 1) {
    int v4 = [v3 isExpensive] ^ 1;
  }
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

+ (BOOL)isGameModeEnabled
{
  int out_token = 0;
  uint64_t v3 = 0;
  notify_register_check("com.apple.system.console_mode_changed", &out_token);
  notify_get_state(out_token, &v3);
  return v3 != 0;
}

+ (BOOL)isChinaDeviceRegionCode
{
  BOOL v2 = MGCopyAnswer();
  char v3 = [v2 isEqualToString:@"CH"];

  return v3;
}

@end