id PFLogPosterContents()
{
  void *v0;
  uint64_t vars8;

  if (PFLogPosterContents_onceToken != -1) {
    dispatch_once(&PFLogPosterContents_onceToken, &__block_literal_global_4);
  }
  v0 = (void *)PFLogPosterContents___logObj;
  return v0;
}

uint64_t __PFPosterRoleIsValid_block_invoke()
{
  PFPosterRoleIsValid_validPosterRoles = PFPosterRolesSupportedForCurrentDeviceClass();
  return MEMORY[0x270F9A758]();
}

uint64_t PFCurrentDeviceClass()
{
  v0 = (void *)MGCopyAnswer();
  unsigned int v1 = [v0 intValue] - 1;
  if (v1 > 3) {
    uint64_t v2 = -1;
  }
  else {
    uint64_t v2 = qword_25A0A0CD0[v1];
  }

  return v2;
}

uint64_t __PFPosterRolesSupportedForCurrentDeviceClass_block_invoke()
{
  uint64_t v0 = PFCurrentDeviceClass();
  PFPosterRolesSupportedForCurrentDeviceClass_appropriateForCurrentDeviceClass = PFPosterRolesSupportedForDeviceClass(v0);
  return MEMORY[0x270F9A758]();
}

uint64_t PFPosterRoleIsValid(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1 && [v1 length])
  {
    if (PFPosterRoleIsValid_onceToken != -1) {
      dispatch_once(&PFPosterRoleIsValid_onceToken, &__block_literal_global_15);
    }
    uint64_t v3 = [(id)PFPosterRoleIsValid_validPosterRoles containsObject:v2];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

uint64_t __PFLogPosterContents_block_invoke()
{
  PFLogPosterContents___logObj = (uint64_t)os_log_create("com.apple.PosterFoundation", "PosterContents");
  return MEMORY[0x270F9A758]();
}

id PFPosterRolesSupportedForDeviceClass(uint64_t a1)
{
  switch(a1)
  {
    case 0:
      objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"PRPosterRoleLockScreen", @"PRPosterRoleAmbient", @"PRPosterRoleIncomingCall", 0);
      goto LABEL_8;
    case 1:
      if (PFPosterRolesSupportedForDeviceClass_onceToken != -1) {
        dispatch_once(&PFPosterRolesSupportedForDeviceClass_onceToken, &__block_literal_global);
      }
      id v1 = (id)PFPosterRolesSupportedForDeviceClass_roles;
      break;
    case 2:
      objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"PRPosterRoleAmbient", 0, v3, v4);
LABEL_8:
      id v1 = (id)objc_claimAutoreleasedReturnValue();
      break;
    default:
      id v1 = [MEMORY[0x263EFFA08] set];
      break;
  }
  return v1;
}

id PFPosterRolesSupportedForCurrentDeviceClass()
{
  if (PFPosterRolesSupportedForCurrentDeviceClass_onceToken != -1) {
    dispatch_once(&PFPosterRolesSupportedForCurrentDeviceClass_onceToken, &__block_literal_global_13);
  }
  uint64_t v0 = (void *)PFPosterRolesSupportedForCurrentDeviceClass_appropriateForCurrentDeviceClass;
  return v0;
}

void __PFPosterRolesSupportedForDeviceClass_block_invoke()
{
  id v2 = [MEMORY[0x263EFF9C0] set];
  if (_os_feature_enabled_impl()) {
    [v2 addObject:@"PRPosterRoleLockScreen"];
  }
  if (_os_feature_enabled_impl()) {
    [v2 addObject:@"PRPosterRoleAmbient"];
  }
  uint64_t v0 = [v2 copy];
  id v1 = (void *)PFPosterRolesSupportedForDeviceClass_roles;
  PFPosterRolesSupportedForDeviceClass_roles = v0;
}

uint64_t PFPosterRoles()
{
  return objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"PRPosterRoleLockScreen", @"PRPosterRoleAmbient", @"PRPosterRoleIncomingCall", 0);
}

uint64_t PFPosterRoleSupportsDynamicDescriptors(void *a1)
{
  return [a1 isEqualToString:@"PRPosterRoleIncomingCall"] ^ 1;
}

void PFPosterRoleEnumerateValidRolesForCurrentDeviceClass(void *a1)
{
  id v1 = a1;
  id v2 = PFPosterRolesSupportedForCurrentDeviceClass();
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __PFPosterRoleEnumerateValidRolesForCurrentDeviceClass_block_invoke;
  v4[3] = &unk_26546EAB8;
  id v5 = v1;
  id v3 = v1;
  [v2 enumerateObjectsUsingBlock:v4];
}

uint64_t __PFPosterRoleEnumerateValidRolesForCurrentDeviceClass_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void PFPosterRoleEnumerateAllRoles(void *a1)
{
  id v1 = a1;
  id v2 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"PRPosterRoleLockScreen", @"PRPosterRoleAmbient", @"PRPosterRoleIncomingCall", 0);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __PFPosterRoleEnumerateAllRoles_block_invoke;
  v4[3] = &unk_26546EAB8;
  id v5 = v1;
  id v3 = v1;
  [v2 enumerateObjectsUsingBlock:v4];
}

uint64_t __PFPosterRoleEnumerateAllRoles_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

__CFString *PFPosterRoleDefaultRoleForCurrentExtensionProcess(int a1)
{
  id v2 = [MEMORY[0x263F086E0] mainBundle];
  id v3 = [v2 bundleIdentifier];

  if ([v3 isEqualToString:@"com.apple.PosterBoard"]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 isEqualToString:@"com.apple.PosterTester"];
  }
  id v5 = [MEMORY[0x263F086E0] mainBundle];
  objc_msgSend(v5, "pf_defaultRole");
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v6 || (v4 & 1) != 0)
  {
LABEL_10:

    return v6;
  }
  if (!a1)
  {
    v7 = PFLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      PFPosterRoleDefaultRoleForCurrentExtensionProcess_cold_2();
    }

    v6 = @"PRPosterRoleLockScreen";
    goto LABEL_10;
  }
  objc_msgSend(NSString, "stringWithFormat:", @"Unable to determine Role for process %@; error looking up bundle: %@",
    v3,
  v9 = 0);
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
    PFPosterRoleDefaultRoleForCurrentExtensionProcess_cold_1((uint64_t)v9);
  }
  [v9 UTF8String];
  result = (__CFString *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

id PFPosterRolesKnownAmbient()
{
  if (PFPosterRolesKnownAmbient_onceToken != -1) {
    dispatch_once(&PFPosterRolesKnownAmbient_onceToken, &__block_literal_global_32);
  }
  uint64_t v0 = (void *)PFPosterRolesKnownAmbient_knownBundleIdentifiers;
  return v0;
}

uint64_t __PFPosterRolesKnownAmbient_block_invoke()
{
  PFPosterRolesKnownAmbient_knownBundleIdentifiers = [MEMORY[0x263EFFA08] setWithArray:&unk_270800670];
  return MEMORY[0x270F9A758]();
}

id PFPosterRolesKnownIncomingCall()
{
  if (PFPosterRolesKnownIncomingCall_onceToken != -1) {
    dispatch_once(&PFPosterRolesKnownIncomingCall_onceToken, &__block_literal_global_49);
  }
  uint64_t v0 = (void *)PFPosterRolesKnownIncomingCall_knownBundleIdentifiers;
  return v0;
}

uint64_t __PFPosterRolesKnownIncomingCall_block_invoke()
{
  PFPosterRolesKnownIncomingCall_knownBundleIdentifiers = [MEMORY[0x263EFFA08] setWithArray:&unk_270800688];
  return MEMORY[0x270F9A758]();
}

id PFPosterRolesKnownLockScreen()
{
  if (PFPosterRolesKnownLockScreen_onceToken != -1) {
    dispatch_once(&PFPosterRolesKnownLockScreen_onceToken, &__block_literal_global_63);
  }
  uint64_t v0 = (void *)PFPosterRolesKnownLockScreen_knownBundleIdentifiers;
  return v0;
}

uint64_t __PFPosterRolesKnownLockScreen_block_invoke()
{
  PFPosterRolesKnownLockScreen_knownBundleIdentifiers = [MEMORY[0x263EFFA08] setWithArray:&unk_2708006A0];
  return MEMORY[0x270F9A758]();
}

id PFProvidersForRole(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"PRPosterRoleAmbient"])
  {
    uint64_t v2 = PFPosterRolesKnownAmbient();
LABEL_7:
    id v3 = (void *)v2;

    return v3;
  }
  if ([v1 isEqualToString:@"PRPosterRoleLockScreen"])
  {
    uint64_t v2 = PFPosterRolesKnownLockScreen();
    goto LABEL_7;
  }
  if ([v1 isEqualToString:@"PRPosterRoleIncomingCall"])
  {
    uint64_t v2 = PFPosterRolesKnownIncomingCall();
    goto LABEL_7;
  }
  id v5 = [NSString stringWithFormat:@"Unknown role: %@", v1];
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
    PFProvidersForRole_cold_1((uint64_t)v5);
  }
  [v5 UTF8String];
  id result = (id)_bs_set_crash_log_message();
  __break(0);
  return result;
}

id PFPosterRolesForBundleIdentifier(void *a1)
{
  id v1 = a1;
  uint64_t v2 = objc_opt_new();
  id v3 = PFPosterRolesKnownAmbient();
  int v4 = [v3 containsObject:v1];

  if (v4) {
    [v2 addObject:@"PRPosterRoleAmbient"];
  }
  id v5 = PFPosterRolesKnownLockScreen();
  int v6 = [v5 containsObject:v1];

  if (v6) {
    [v2 addObject:@"PRPosterRoleLockScreen"];
  }
  v7 = PFPosterRolesKnownIncomingCall();
  int v8 = [v7 containsObject:v1];

  if (v8) {
    [v2 addObject:@"PRPosterRoleIncomingCall"];
  }
  v9 = (void *)[v2 copy];

  return v9;
}

__CFString *PFPosterDefaultRoleForBundleIdentifier(void *a1)
{
  id v1 = PFPosterRolesForBundleIdentifier(a1);
  if ([v1 count] == 1)
  {
    uint64_t v2 = [v1 firstObject];
  }
  else
  {
    uint64_t v2 = @"PRPosterRoleLockScreen";
  }

  return v2;
}

_PFRoleManifest *PFRoleProviderForLSApplicationExtensionRecord(void *a1)
{
  v22[3] = *MEMORY[0x263EF8340];
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1)
  {
    id v3 = [v1 bundleIdentifier];
    if (v3)
    {
      int v4 = [v2 infoDictionary];
      uint64_t v5 = *MEMORY[0x263EFFB58];
      int v6 = self;
      v7 = [v4 objectForKey:v5 ofClass:v6];
      int v8 = [v7 isEqualToString:v3];

      if (v8)
      {
        v9 = v4;
      }
      else
      {
        id v10 = objc_alloc(MEMORY[0x263F086E0]);
        v11 = [v2 URL];
        v12 = (void *)[v10 initWithURL:v11];

        v13 = objc_msgSend(v12, "pf_roleManifest");
        if (v13
          || (objc_getAssociatedObject(v2, "roleManifest"), (v13 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          v9 = v13;
        }
        else
        {
          v15 = PFPosterRolesForBundleIdentifier(v3);
          uint64_t v16 = PFPosterDefaultRoleForBundleIdentifier(v3);
          v17 = (void *)v16;
          v9 = 0;
          if (v15 && v16)
          {
            v18 = [_PFRoleManifest alloc];
            v21[0] = v5;
            v21[1] = @"PRSupportedRoles";
            v22[0] = v3;
            v22[1] = v15;
            v21[2] = @"PRDefaultRole";
            v22[2] = v17;
            v19 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:3];
            v20 = [(_PFRoleManifest *)v18 initWithInfoDictionary:v19];

            objc_setAssociatedObject(v2, "roleManifest", v20, (void *)0x301);
            v9 = v20;
          }
        }
      }
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x3Au);
}

uint64_t OUTLINED_FUNCTION_5()
{
  return objc_opt_class();
}

void sub_25A08C154(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_25A08C3B4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_25A08C468(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_25A08C7C4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_25A08C8CC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_25A08CB48(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_25A08CC94(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id PFTemporaryDirectoryCreatingIfItDoesntExistWithSubdirectoryNamed(void *a1)
{
  id v1 = a1;
  if (PFTemporaryDirectoryCreatingIfItDoesntExistWithSubdirectoryNamed_onceToken != -1) {
    dispatch_once(&PFTemporaryDirectoryCreatingIfItDoesntExistWithSubdirectoryNamed_onceToken, &__block_literal_global_1);
  }
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy_;
  v13 = __Block_byref_object_dispose_;
  id v14 = 0;
  uint64_t v2 = (void *)PFTemporaryDirectoryCreatingIfItDoesntExistWithSubdirectoryNamed_tempDirectoryLock;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __PFTemporaryDirectoryCreatingIfItDoesntExistWithSubdirectoryNamed_block_invoke_85;
  v6[3] = &unk_26546EC98;
  int v8 = &v9;
  id v3 = v1;
  id v7 = v3;
  [v2 performBlock:v6];
  id v4 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v4;
}

void sub_25A08EC9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __PFTemporaryDirectoryCreatingIfItDoesntExistWithSubdirectoryNamed_block_invoke()
{
  PFTemporaryDirectoryCreatingIfItDoesntExistWithSubdirectoryNamed_tempDirectoryLock = [[PFOSUnfairLock alloc] initWithLockIdentifier:@"PFTemporaryDirectoryLock"];
  return MEMORY[0x270F9A758]();
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

void __PFTemporaryDirectoryCreatingIfItDoesntExistWithSubdirectoryNamed_block_invoke_85(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x263F08850] defaultManager];
  id v3 = NSTemporaryDirectory();
  uint64_t v4 = [v3 stringByAppendingPathComponent:@"PFTemporaryDirectory"];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  int v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if ([*(id *)(a1 + 32) length])
  {
    uint64_t v7 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) stringByAppendingPathComponent:*(void *)(a1 + 32)];
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
  if ([v2 fileExistsAtPath:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)])
  {
    id v10 = PFLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      __PFTemporaryDirectoryCreatingIfItDoesntExistWithSubdirectoryNamed_block_invoke_85_cold_1(v10);
    }
  }
  else
  {
    uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    v12 = PFFileProtectionNoneAttributes();
    id v17 = 0;
    int v13 = [v2 createDirectoryAtPath:v11 withIntermediateDirectories:1 attributes:v12 error:&v17];
    id v10 = v17;

    id v14 = PFLogCommon();
    v15 = v14;
    if (v13)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v16 = 0;
        _os_log_impl(&dword_25A085000, v15, OS_LOG_TYPE_DEFAULT, "CREATED POSTERBOARD TEMPORARY DIRECTORY", v16, 2u);
      }
    }
    else if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      __PFTemporaryDirectoryCreatingIfItDoesntExistWithSubdirectoryNamed_block_invoke_85_cold_2((uint64_t)v10, v15);
    }
  }
}

id PFTemporaryDirectoryCreatingIfItDoesntExist()
{
  return PFTemporaryDirectoryCreatingIfItDoesntExistWithSubdirectoryNamed(0);
}

id PFTemporaryDirectory()
{
  if (PFTemporaryDirectory_onceToken != -1) {
    dispatch_once(&PFTemporaryDirectory_onceToken, &__block_literal_global_91);
  }
  uint64_t v0 = (void *)PFTemporaryDirectory_temporaryDirectory;
  return v0;
}

uint64_t __PFTemporaryDirectory_block_invoke()
{
  PFTemporaryDirectory_temporaryDirectory = PFTemporaryDirectoryCreatingIfItDoesntExistWithSubdirectoryNamed(0);
  return MEMORY[0x270F9A758]();
}

void OUTLINED_FUNCTION_5_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

uint64_t PFCurrentDeviceIsVirtualMachine()
{
  return 0;
}

uint64_t PFIsPhotosPosterProviderBundleId(void *a1)
{
  uint64_t v1 = PFIsPhotosPosterProviderBundleId_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&PFIsPhotosPosterProviderBundleId_onceToken, &__block_literal_global_4);
  }
  uint64_t v3 = [(id)PFIsPhotosPosterProviderBundleId_photosBundleIdentifiers containsObject:v2];

  return v3;
}

uint64_t __PFIsPhotosPosterProviderBundleId_block_invoke()
{
  PFIsPhotosPosterProviderBundleId_photosBundleIdentifiers = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"com.apple.PhotosUIPrivate.PhotosPosterProvider", @"com.apple.mobileslideshow.PhotosPosterProvider", @"com.apple.PhotosUIPrivate.PhotosAmbientPosterProvider", 0);
  return MEMORY[0x270F9A758]();
}

uint64_t PFIsLegacyPosterBundleId(void *a1, const char *a2)
{
  return [a1 isEqualToString:@"com.apple.PaperBoard.LegacyPoster"];
}

uint64_t PFBundleIdentifierRequiresMemoryHogAssertion(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"com.apple.PaperBoard.LegacyPoster"]) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = PFIsPhotosPosterProviderBundleId(v1);
  }

  return v2;
}

uint64_t PF_IS_PAD_DEVICE()
{
  if (PF_IS_PAD_DEVICE_onceToken != -1) {
    dispatch_once(&PF_IS_PAD_DEVICE_onceToken, &__block_literal_global_15_0);
  }
  return PF_IS_PAD_DEVICE_isPad;
}

void sub_25A0909A0(void *a1)
{
  objc_begin_catch(a1);

  objc_exception_rethrow();
}

void sub_25A0909B0(_Unwind_Exception *a1)
{
}

__CFString *PFObjectFromXPCObject(void *a1)
{
  id v1 = a1;
  uint64_t v2 = MEMORY[0x25A2F4D30]();
  if (v2 == MEMORY[0x263EF8738])
  {
    int v6 = [NSNumber numberWithLongLong:xpc_int64_get_value(v1)];
    goto LABEL_30;
  }
  uint64_t v3 = v2;
  if (v2 == MEMORY[0x263EF87A0])
  {
    int v6 = [NSNumber numberWithUnsignedLongLong:xpc_uint64_get_value(v1)];
    goto LABEL_30;
  }
  if (v2 == MEMORY[0x263EF86E0])
  {
    BOOL value = xpc_BOOL_get_value(v1);
    uint64_t v8 = (void *)MEMORY[0x263EFFA80];
    if (value) {
      uint64_t v8 = (void *)MEMORY[0x263EFFA88];
    }
    int v6 = v8;
    goto LABEL_30;
  }
  if (v2 != MEMORY[0x263EF8798])
  {
    if (v2 == MEMORY[0x263EF86F8])
    {
      id v12 = objc_alloc(MEMORY[0x263EFF8F8]);
      bytes_ptr = xpc_data_get_bytes_ptr(v1);
      int v6 = (__CFString *)[v12 initWithBytes:bytes_ptr length:xpc_data_get_length(v1)];
    }
    else if (v2 == MEMORY[0x263EF87A8])
    {
      int v6 = (__CFString *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:xpc_uuid_get_bytes(v1)];
    }
    else if (v2 == MEMORY[0x263EF86D8])
    {
      PFNSArrayFromXPCArray(v1);
      int v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else if (v2 == MEMORY[0x263EF8708])
    {
      PFNSDictionaryFromXPCDictionary(v1);
      int v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else if (v2 == MEMORY[0x263EF8728])
    {
      int v6 = [NSNumber numberWithInt:xpc_fd_dup(v1)];
    }
    else if (v2 == MEMORY[0x263EF8710])
    {
      int v6 = [NSNumber numberWithDouble:xpc_double_get_value(v1)];
    }
    else
    {
      if (v2 != MEMORY[0x263EF8758])
      {
        uint64_t v4 = PFLogCommon();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
          +[NSObject(PosterFoundation) pf_secureDecodedFromData:ofClasses:classReplacementMap:](v3, v4);
        }

        uint64_t v5 = 0;
        goto LABEL_31;
      }
      int v6 = [MEMORY[0x263EFF9D0] null];
    }
LABEL_30:
    uint64_t v5 = v6;
    goto LABEL_31;
  }
  uint64_t v9 = [NSString stringWithUTF8String:xpc_string_get_string_ptr(v1)];
  uint64_t v10 = (void *)v9;
  uint64_t v11 = &stru_2707FB7C8;
  if (v9) {
    uint64_t v11 = (__CFString *)v9;
  }
  uint64_t v5 = v11;

LABEL_31:
  return v5;
}

id PFNSArrayFromXPCArray(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [MEMORY[0x263EFF980] arrayWithCapacity:xpc_array_get_count(v1)];
  applier[0] = MEMORY[0x263EF8330];
  applier[1] = 3221225472;
  applier[2] = __PFNSArrayFromXPCArray_block_invoke;
  applier[3] = &unk_26546ED28;
  id v7 = v2;
  id v3 = v2;
  xpc_array_apply(v1, applier);

  uint64_t v4 = (void *)[v3 copy];
  return v4;
}

id PFNSDictionaryFromXPCDictionary(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:xpc_dictionary_get_count(v1)];
  applier[0] = MEMORY[0x263EF8330];
  applier[1] = 3221225472;
  applier[2] = __PFNSDictionaryFromXPCDictionary_block_invoke;
  applier[3] = &unk_26546ED50;
  id v7 = v2;
  id v3 = v2;
  xpc_dictionary_apply(v1, applier);

  uint64_t v4 = (void *)[v3 copy];
  return v4;
}

uint64_t __PFNSArrayFromXPCArray_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = PFObjectFromXPCObject(a3);
  objc_msgSend(v3, "bs_safeAddObject:", v4);

  return 1;
}

uint64_t __PFNSDictionaryFromXPCDictionary_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = NSString;
  id v6 = a3;
  id v7 = [v5 stringWithUTF8String:a2];
  uint64_t v8 = PFObjectFromXPCObject(v6);

  objc_msgSend(*(id *)(a1 + 32), "bs_setSafeObject:forKey:", v8, v7);
  return 1;
}

id PFXPCArrayFromNSArray(void *a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v1 = a1;
  [v1 count];
  xpc_object_t empty = xpc_array_create_empty();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = PFXPCObjectFromNSObject(*(void **)(*((void *)&v10 + 1) + 8 * i));
        if (v8) {
          xpc_array_append_value(empty, v8);
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  return empty;
}

id PFXPCObjectFromNSObject(void *a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v1 = a1;
  if ([v1 isNSNumber])
  {
    id v2 = v1;
    if (CFNumberIsFloatType((CFNumberRef)v2))
    {
      [v2 doubleValue];
      xpc_object_t v4 = xpc_double_create(v3);
    }
    else
    {
      xpc_object_t v4 = xpc_int64_create([v2 longLongValue]);
    }
    id v7 = v4;

    if (v7) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  if ([v1 isNSString])
  {
    uint64_t v5 = (uint64_t)xpc_string_create((const char *)[v1 UTF8String]);
    goto LABEL_19;
  }
  if ([v1 isNSData])
  {
    id v6 = v1;
    uint64_t v5 = (uint64_t)xpc_data_create((const void *)[v6 bytes], objc_msgSend(v6, "length"));
    goto LABEL_19;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    *(void *)uuid = 0;
    uint64_t v10 = 0;
    [v1 getUUIDBytes:uuid];
    uint64_t v5 = (uint64_t)xpc_uuid_create(uuid);
    goto LABEL_19;
  }
  if ([v1 isNSArray])
  {
    uint64_t v5 = PFXPCArrayFromNSArray(v1);
    goto LABEL_19;
  }
  if ([v1 isNSDictionary])
  {
    uint64_t v5 = PFXPCDictionaryFromNSDictionary(v1);
    goto LABEL_19;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = (uint64_t)xpc_null_create();
LABEL_19:
    id v7 = (void *)v5;
    if (v5) {
      goto LABEL_21;
    }
  }
LABEL_20:
  [MEMORY[0x263EFF940] raise:@"Invalid Object", @"Object %@ is invalid", v1 format];
  id v7 = 0;
LABEL_21:

  return v7;
}

id PFXPCDictionaryFromNSDictionary(void *a1)
{
  id v1 = a1;
  [v1 count];
  xpc_object_t empty = xpc_dictionary_create_empty();
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __PFXPCDictionaryFromNSDictionary_block_invoke;
  v5[3] = &unk_26546ED78;
  id v3 = empty;
  id v6 = v3;
  [v1 enumerateKeysAndObjectsUsingBlock:v5];

  return v3;
}

void __PFXPCDictionaryFromNSDictionary_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if ([v9 isNSString])
  {
    if ([v9 isNSString])
    {
      id v6 = (const char *)[v9 UTF8String];
      id v7 = PFXPCObjectFromNSObject(v5);
      if (v7) {
        xpc_dictionary_set_value(*(xpc_object_t *)(a1 + 32), v6, v7);
      }
    }
  }
  else
  {
    uint64_t v8 = [NSString stringWithFormat:@"PFXPCDictionaryFromNSDictionary expects NSString keys"];
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      __PFXPCDictionaryFromNSDictionary_block_invoke_cold_1((uint64_t)v8);
    }
    [v8 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
}

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

id PFFileProtectionNoneAttributes()
{
  if (PFFileProtectionNoneAttributes_onceToken != -1) {
    dispatch_once(&PFFileProtectionNoneAttributes_onceToken, &__block_literal_global_5);
  }
  uint64_t v0 = (void *)PFFileProtectionNoneAttributes___sharedInstance;
  return v0;
}

void __PFFileProtectionNoneAttributes_block_invoke()
{
  v5[2] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F080A8];
  v4[0] = *MEMORY[0x263F08078];
  v4[1] = v0;
  uint64_t v1 = *MEMORY[0x263F080B0];
  v5[0] = &unk_2708006B8;
  v5[1] = v1;
  uint64_t v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];
  id v3 = (void *)PFFileProtectionNoneAttributes___sharedInstance;
  PFFileProtectionNoneAttributes___sharedInstance = v2;
}

uint64_t PFServerPosterTypeFromDirectoryName(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"staticdescriptors"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"descriptors"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"configurations"])
  {
    uint64_t v2 = 3;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

uint64_t PFServerPosterTypeToDirectoryName(unint64_t a1)
{
  if (a1 - 1 < 3) {
    return *((void *)&off_26546EDC0 + a1 - 1);
  }
  uint64_t v2 = NSString;
  id v3 = NSStringFromPFServerPosterType(a1);
  xpc_object_t v4 = [v2 stringWithFormat:@"cannot map PFServerPosterType %@ to a directoryName", v3];

  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
    PFServerPosterTypeToDirectoryName_cold_1((uint64_t)v4);
  }
  [v4 UTF8String];
  uint64_t result = _bs_set_crash_log_message();
  __break(0);
  return result;
}

id NSStringFromPFServerPosterType(unint64_t a1)
{
  if (a1 >= 4)
  {
    id v1 = objc_msgSend(NSString, "stringWithFormat:", @"(lli)", a1);
  }
  else
  {
    id v1 = (void *)*((void *)&off_26546EDD8 + a1);
  }
  return v1;
}

BOOL PFServerPosterTypeIsValid(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 3;
}

void OUTLINED_FUNCTION_7_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

__CFString *PFErrorCodeToDebugDescription(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2) {
    return @"Unknown error.";
  }
  else {
    return (__CFString *)*((void *)&off_26546EE00 + a1 - 1);
  }
}

id PFLogCommon()
{
  if (PFLogCommon_onceToken != -1) {
    dispatch_once(&PFLogCommon_onceToken, &__block_literal_global_6);
  }
  uint64_t v0 = (void *)PFLogCommon___logObj;
  return v0;
}

uint64_t __PFLogCommon_block_invoke()
{
  PFLogCommon___logObj = (uint64_t)os_log_create("com.apple.PosterFoundation", "Common");
  return MEMORY[0x270F9A758]();
}

id PFLogHosting()
{
  if (PFLogHosting_onceToken != -1) {
    dispatch_once(&PFLogHosting_onceToken, &__block_literal_global_7);
  }
  uint64_t v0 = (void *)PFLogHosting___logObj;
  return v0;
}

uint64_t __PFLogHosting_block_invoke()
{
  PFLogHosting___logObj = (uint64_t)os_log_create("com.apple.PosterFoundation", "Hosting");
  return MEMORY[0x270F9A758]();
}

id PFLogExtensions()
{
  if (PFLogExtensions_onceToken != -1) {
    dispatch_once(&PFLogExtensions_onceToken, &__block_literal_global_10);
  }
  uint64_t v0 = (void *)PFLogExtensions___logObj;
  return v0;
}

uint64_t __PFLogExtensions_block_invoke()
{
  PFLogExtensions___logObj = (uint64_t)os_log_create("com.apple.PosterFoundation", "Extensions");
  return MEMORY[0x270F9A758]();
}

id PFLogExtensionInstance()
{
  if (PFLogExtensionInstance_onceToken != -1) {
    dispatch_once(&PFLogExtensionInstance_onceToken, &__block_literal_global_13_0);
  }
  uint64_t v0 = (void *)PFLogExtensionInstance___logObj;
  return v0;
}

uint64_t __PFLogExtensionInstance_block_invoke()
{
  PFLogExtensionInstance___logObj = (uint64_t)os_log_create("com.apple.PosterFoundation", "ExtensionInstance");
  return MEMORY[0x270F9A758]();
}

void sub_25A0940CC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_25A095BC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_25A095E74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v15);
  objc_sync_exit(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_25A096098(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_25A096268(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_25A096388(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_25A096420(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_25A0964AC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_25A0966B0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_25A096838(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id PFPosterPathFileAttributes()
{
  if (PFPosterPathFileAttributes_onceToken != -1) {
    dispatch_once(&PFPosterPathFileAttributes_onceToken, &__block_literal_global_9);
  }
  uint64_t v0 = (void *)PFPosterPathFileAttributes___sharedInstance;
  return v0;
}

void __PFPosterPathFileAttributes_block_invoke()
{
  v5[2] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F080A8];
  v4[0] = *MEMORY[0x263F08078];
  v4[1] = v0;
  uint64_t v1 = *MEMORY[0x263F080B0];
  v5[0] = &unk_2708006D0;
  v5[1] = v1;
  uint64_t v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];
  id v3 = (void *)PFPosterPathFileAttributes___sharedInstance;
  PFPosterPathFileAttributes___sharedInstance = v2;
}

id PFPosterPathURLResourceValues()
{
  if (PFPosterPathURLResourceValues_onceToken != -1) {
    dispatch_once(&PFPosterPathURLResourceValues_onceToken, &__block_literal_global_3_0);
  }
  uint64_t v0 = (void *)PFPosterPathURLResourceValues___sharedInstance;
  return v0;
}

void __PFPosterPathURLResourceValues_block_invoke()
{
  v5[2] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263EFF650];
  v4[0] = *MEMORY[0x263EFF6E0];
  v4[1] = v0;
  uint64_t v1 = *MEMORY[0x263EFF658];
  v5[0] = MEMORY[0x263EFFA88];
  v5[1] = v1;
  uint64_t v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];
  id v3 = (void *)PFPosterPathURLResourceValues___sharedInstance;
  PFPosterPathURLResourceValues___sharedInstance = v2;
}

void sub_25A098F44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
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

void sub_25A099260(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_25A0994A8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_7_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_8_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void PFPosterRoleDefaultRoleForCurrentExtensionProcess_cold_1(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v2 = [NSString stringWithUTF8String:"PFPosterRole  _Nonnull PFPosterRoleDefaultRoleForCurrentExtensionProcess(BOOL)"];
  OUTLINED_FUNCTION_3();
  id v5 = @"PFPosterRole.m";
  __int16 v6 = 1024;
  int v7 = 108;
  __int16 v8 = v3;
  uint64_t v9 = a1;
  _os_log_error_impl(&dword_25A085000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", v4, 0x26u);
}

void PFPosterRoleDefaultRoleForCurrentExtensionProcess_cold_2()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  uint64_t v2 = 0;
  _os_log_fault_impl(&dword_25A085000, v0, OS_LOG_TYPE_FAULT, "Unable to determine Role for process %{public}@; error looking up bundle: %{public}@",
    v1,
    0x16u);
}

void PFProvidersForRole_cold_1(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v2 = [NSString stringWithUTF8String:"NSSet<NSString *> * _Nonnull PFProvidersForRole(__strong PFPosterRole _Nonnull)"];
  OUTLINED_FUNCTION_3();
  id v5 = @"PFPosterRole.m";
  __int16 v6 = 1024;
  int v7 = 186;
  __int16 v8 = v3;
  uint64_t v9 = a1;
  _os_log_error_impl(&dword_25A085000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", v4, 0x26u);
}

void __PFTemporaryDirectoryCreatingIfItDoesntExistWithSubdirectoryNamed_block_invoke_85_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_25A085000, log, OS_LOG_TYPE_DEBUG, "POSTERBOARD TEMPORARY DIRECTORY ALREADY CREATED", v1, 2u);
}

void __PFTemporaryDirectoryCreatingIfItDoesntExistWithSubdirectoryNamed_block_invoke_85_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_25A085000, a2, OS_LOG_TYPE_FAULT, "ERROR CREATING POSTERBOARD TEMPORARY DIRECTORY: %{public}@", (uint8_t *)&v2, 0xCu);
}

void __PFXPCDictionaryFromNSDictionary_block_invoke_cold_1(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v2 = [NSString stringWithUTF8String:"xpc_object_t  _Nonnull PFXPCDictionaryFromNSDictionary(NSDictionary *__strong _Nonnull)_block_invoke"];
  OUTLINED_FUNCTION_3();
  id v5 = @"PFUtilities.m";
  __int16 v6 = 1024;
  int v7 = 349;
  __int16 v8 = v3;
  uint64_t v9 = a1;
  _os_log_error_impl(&dword_25A085000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", v4, 0x26u);
}

void PFServerPosterTypeToDirectoryName_cold_1(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v2 = [NSString stringWithUTF8String:"NSString * _Nonnull PFServerPosterTypeToDirectoryName(PFServerPosterType)"];
  int v3 = 138544130;
  uint64_t v4 = v2;
  __int16 v5 = 2114;
  __int16 v6 = @"PFServerPosterIdentity.m";
  __int16 v7 = 1024;
  int v8 = 41;
  __int16 v9 = 2114;
  uint64_t v10 = a1;
  _os_log_error_impl(&dword_25A085000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", (uint8_t *)&v3, 0x26u);
}

uint64_t BSEqualObjects()
{
  return MEMORY[0x270F107B8]();
}

uint64_t BSEqualStrings()
{
  return MEMORY[0x270F107C8]();
}

uint64_t BSStringFromBOOL()
{
  return MEMORY[0x270F10960]();
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x270ED7B28](data, *(void *)&len, md);
}

Boolean CFNumberIsFloatType(CFNumberRef number)
{
  return MEMORY[0x270EE4C78](number);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C48]();
}

uint64_t _BSIsInternalInstall()
{
  return MEMORY[0x270F109A0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

uint64_t _bs_set_crash_log_message()
{
  return MEMORY[0x270F109A8]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
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

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x270ED9468](label, attr, target);
}

uint64_t dispatch_set_qos_class_fallback()
{
  return MEMORY[0x270ED94F0]();
}

dispatch_workloop_t dispatch_workloop_create_inactive(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x270ED95D0](label);
}

void dispatch_workloop_set_autorelease_frequency(dispatch_workloop_t workloop, dispatch_autorelease_frequency_t frequency)
{
}

void free(void *a1)
{
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

char *__cdecl mkdtemp(char *a1)
{
  return (char *)MEMORY[0x270EDA528](a1);
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

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
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

void objc_exception_rethrow(void)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x270F9A648](object, key);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

void objc_terminate(void)
{
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

uint64_t os_transaction_create()
{
  return MEMORY[0x270EDAA90]();
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

BOOL os_unfair_lock_trylock(os_unfair_lock_t lock)
{
  return MEMORY[0x270EDAAD8](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x270EDB2B8]();
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x270EDB2C0]();
}

uint64_t sandbox_extension_issue_file_to_process()
{
  return MEMORY[0x270EDB2C8]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x270EDB2D8]();
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x270EDB5D0](__s1);
}

int strerror_r(int __errnum, char *__strerrbuf, size_t __buflen)
{
  return MEMORY[0x270EDB5E8](*(void *)&__errnum, __strerrbuf, __buflen);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x270EDB7D8](a1, a2, a3, a4, a5);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x270EDBD10](xarray, applier);
}

xpc_object_t xpc_array_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x270EDBD20]();
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x270EDBD38](xarray);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x270EDBDE0](xBOOL);
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x270EDBF90](bytes, length);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x270EDBFA8](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x270EDBFB8](xdata);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x270EDBFE8](xdict, applier);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x270EDC018]();
}

size_t xpc_dictionary_get_count(xpc_object_t xdict)
{
  return MEMORY[0x270EDC058](xdict);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_object_t xpc_double_create(double value)
{
  return (xpc_object_t)MEMORY[0x270EDC168](value);
}

double xpc_double_get_value(xpc_object_t xdouble)
{
  MEMORY[0x270EDC170](xdouble);
  return result;
}

int xpc_fd_dup(xpc_object_t xfd)
{
  return MEMORY[0x270EDC1D0](xfd);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}

xpc_object_t xpc_int64_create(int64_t value)
{
  return (xpc_object_t)MEMORY[0x270EDC210](value);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x270EDC218](xint);
}

xpc_object_t xpc_null_create(void)
{
  return (xpc_object_t)MEMORY[0x270EDC290]();
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x270EDC3D0](string);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x270EDC3F8](xstring);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x270EDC440](xuint);
}

xpc_object_t xpc_uuid_create(const unsigned __int8 *uuid)
{
  return (xpc_object_t)MEMORY[0x270EDC458](uuid);
}

const uint8_t *__cdecl xpc_uuid_get_bytes(xpc_object_t xuuid)
{
  return (const uint8_t *)MEMORY[0x270EDC460](xuuid);
}