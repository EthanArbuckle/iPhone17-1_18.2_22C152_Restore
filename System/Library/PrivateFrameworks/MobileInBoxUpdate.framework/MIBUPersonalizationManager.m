@interface MIBUPersonalizationManager
+ (__AMAuthInstall)_createBaseAMAIObjectForDevice:(id)a3 error:(id *)a4;
+ (id)requestTatsuTicketForDevice:(id)a3 error:(id *)a4;
@end

@implementation MIBUPersonalizationManager

+ (id)requestTatsuTicketForDevice:(id)a3 error:(id *)a4
{
  uint64_t v96 = *MEMORY[0x263EF8340];
  id v6 = a3;
  char v89 = 49;
  v7 = [MEMORY[0x263EFF8F8] dataWithBytes:&v89 length:1];
  v8 = objc_opt_new();
  CFDictionaryRef theDict = 0;
  if (MIBUOnceToken != -1) {
    dispatch_once(&MIBUOnceToken, &__block_literal_global_14);
  }
  v9 = MIBUConnObj;
  if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v93 = v6;
    _os_log_impl(&dword_2309BC000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Requesting personalization ticket ...", buf, 0xCu);
  }
  if (MIBUOnceToken != -1) {
    dispatch_once(&MIBUOnceToken, &__block_literal_global_17);
  }
  v10 = (void *)MIBUConnObj;
  if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
  {
    v90[0] = @"SerialNumber";
    v11 = v10;
    v79 = [v6 serialNumber];
    v91[0] = v79;
    v90[1] = @"ECID";
    v78 = [v6 ecid];
    v91[1] = v78;
    v90[2] = @"BoardID";
    v77 = [v6 boardID];
    v91[2] = v77;
    v90[3] = @"ChipID";
    v76 = [v6 chipID];
    v91[3] = v76;
    v90[4] = @"Security Domain";
    v75 = [v6 securityDomain];
    v91[4] = v75;
    v90[5] = @"APNounce";
    v74 = [v6 apNonce];
    v91[5] = v74;
    v90[6] = @"Production Mode";
    id v80 = a1;
    v12 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v6, "productionMode"));
    v91[6] = v12;
    v90[7] = @"Security Mode";
    v13 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v6, "securityMode"));
    v91[7] = v13;
    v90[8] = @"UID Mode";
    v14 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v6, "uidMode"));
    v91[8] = v14;
    v90[9] = @"SEPNonce";
    [v6 sepNonce];
    v15 = v8;
    v17 = v16 = a4;
    v91[9] = v17;
    [NSDictionary dictionaryWithObjects:v91 forKeys:v90 count:10];
    v19 = v18 = v7;
    *(_DWORD *)buf = 138543618;
    id v93 = v6;
    __int16 v94 = 2114;
    v95 = v19;
    _os_log_impl(&dword_2309BC000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Device Info: %{public}@", buf, 0x16u);

    v7 = v18;
    a4 = v16;
    v8 = v15;

    a1 = v80;
  }
  if (os_variant_has_internal_content())
  {
    v20 = +[MIBUTestPreferences sharedInstance];
    char v21 = [v20 useLiveTatsu];

    if ((v21 & 1) == 0)
    {
      if (MIBUOnceToken != -1) {
        dispatch_once(&MIBUOnceToken, &__block_literal_global_52);
      }
      v36 = MIBUConnObj;
      if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v93 = v6;
        _os_log_impl(&dword_2309BC000, v36, OS_LOG_TYPE_DEFAULT, "%{public}@: Faking Tatsu ticket, waiting for 30s...", buf, 0xCu);
      }
      sleep(0x1Eu);
      v37 = +[MIBUTestPreferences sharedInstance];
      v38 = [v37 fakeTatsuPayloadPath];

      if (v38)
      {
        if (MIBUOnceToken != -1) {
          dispatch_once(&MIBUOnceToken, &__block_literal_global_55);
        }
        v39 = MIBUConnObj;
        if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          id v93 = v6;
          __int16 v94 = 2114;
          v95 = v38;
          _os_log_impl(&dword_2309BC000, v39, OS_LOG_TYPE_DEFAULT, "%{public}@: Loading tatsu payload from file: %{public}@", buf, 0x16u);
        }
        v40 = (void *)[objc_alloc(NSDictionary) initWithContentsOfFile:v38];
        uint64_t v41 = [v40 objectForKey:*MEMORY[0x263F8BF18]];
        if (!v41)
        {
          if (MIBUOnceToken != -1) {
            dispatch_once(&MIBUOnceToken, &__block_literal_global_58);
          }
          if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
            +[MIBUPersonalizationManager requestTatsuTicketForDevice:error:].cold.7();
          }
          id v87 = 0;
          safeAssignError(&v87, 100663296, 0, @"Failed load tatsu payload from file: %@", v69, v70, v71, v72, (uint64_t)v38);
          id v23 = v87;

          v35 = 0;
          goto LABEL_48;
        }
        v35 = (void *)v41;
      }
      else
      {
        if (MIBUOnceToken != -1) {
          dispatch_once(&MIBUOnceToken, &__block_literal_global_64);
        }
        v42 = MIBUConnObj;
        if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v93 = v6;
          _os_log_impl(&dword_2309BC000, v42, OS_LOG_TYPE_DEFAULT, "%{public}@: Generating fake tatsu payload", buf, 0xCu);
        }
        v35 = [MEMORY[0x263EFF8F8] generateRandomBytesOfSize:0xFFFFLL];
      }
      id v23 = 0;
LABEL_48:

      goto LABEL_49;
    }
  }
  id v86 = 0;
  uint64_t v22 = [a1 _createBaseAMAIObjectForDevice:v6 error:&v86];
  id v23 = v86;
  if (v22)
  {
    if (os_variant_has_internal_content())
    {
      v24 = +[MIBUTestPreferences sharedInstance];
      int v25 = [v24 useAppleConnect];

      if (v25)
      {
        if (MIBUOnceToken != -1) {
          dispatch_once(&MIBUOnceToken, &__block_literal_global_70);
        }
        v26 = MIBUConnObj;
        if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v93 = v6;
          _os_log_impl(&dword_2309BC000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@: Using AppleConnect for personalization ...", buf, 0xCu);
        }
        uint64_t v27 = AMAuthInstallSsoInitialize();
        if (v27)
        {
          uint64_t v58 = v27;
          if (MIBUOnceToken != -1) {
            dispatch_once(&MIBUOnceToken, &__block_literal_global_73);
          }
          if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
            +[MIBUPersonalizationManager requestTatsuTicketForDevice:error:].cold.6();
          }
          id v85 = v23;
          safeAssignError(&v85, 100663296, 0, @"Failed load SSOClient.framework; status: %d",
            v59,
            v60,
            v61,
            v62,
            v58);
          v49 = v85;
        }
        else
        {
          uint64_t v28 = AMAuthInstallSsoEnable();
          if (!v28) {
            goto LABEL_20;
          }
          uint64_t v63 = v28;
          if (MIBUOnceToken != -1) {
            dispatch_once(&MIBUOnceToken, &__block_literal_global_79);
          }
          if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
            +[MIBUPersonalizationManager requestTatsuTicketForDevice:error:].cold.5();
          }
          id v84 = v23;
          safeAssignError(&v84, 100663296, 0, @"Failed to enable AC SSO, status: %d", v64, v65, v66, v67, v63);
          v49 = v84;
        }
LABEL_84:
        id v68 = v49;

        v35 = 0;
        id v23 = v68;
        goto LABEL_49;
      }
    }
LABEL_20:
    [v8 setObject:v7 forKey:@"Ap,EnableInBoxUpdate"];
    v29 = [v6 sepNonce];
    [v8 setObject:v29 forKey:*MEMORY[0x263F8BF50]];

    if ([v6 sikaFuseExists])
    {
      v30 = [v6 sikaFuse];
      [v8 setObject:v30 forKey:*MEMORY[0x263F8BF58]];
    }
    uint64_t v31 = AMAuthInstallApImg4ServerRequestAddRequiredTags();
    if (v31)
    {
      uint64_t v44 = v31;
      if (MIBUOnceToken != -1) {
        dispatch_once(&MIBUOnceToken, &__block_literal_global_88);
      }
      if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
        +[MIBUPersonalizationManager requestTatsuTicketForDevice:error:].cold.4();
      }
      id v83 = v23;
      safeAssignError(&v83, 100663296, 0, @"Failed to add measurement dict, status: %d", v45, v46, v47, v48, v44);
      v49 = v83;
    }
    else
    {
      if (MIBUOnceToken != -1) {
        dispatch_once(&MIBUOnceToken, &__block_literal_global_94);
      }
      v32 = MIBUConnObj;
      if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v93 = v6;
        _os_log_impl(&dword_2309BC000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@: Sending Tatsu personalization request...", buf, 0xCu);
      }
      uint64_t PersonalizedResponse = AMAuthInstallApCreatePersonalizedResponse();
      if (PersonalizedResponse || !theDict)
      {
        if (MIBUOnceToken != -1) {
          dispatch_once(&MIBUOnceToken, &__block_literal_global_97);
        }
        if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
          +[MIBUPersonalizationManager requestTatsuTicketForDevice:error:]();
        }
        id v82 = v23;
        safeAssignError(&v82, 100663296, 0, @"Fail Tatsu personalization, status: %d", v50, v51, v52, v53, PersonalizedResponse);
        v49 = v82;
      }
      else
      {
        uint64_t v34 = CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x263F8BF18]);
        if (v34)
        {
          v35 = (void *)v34;
          goto LABEL_49;
        }
        if (MIBUOnceToken != -1) {
          dispatch_once(&MIBUOnceToken, &__block_literal_global_103);
        }
        if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
          +[MIBUPersonalizationManager requestTatsuTicketForDevice:error:]();
        }
        id v81 = v23;
        safeAssignError(&v81, 100663296, 0, @"Failed to parse payload from personalization response", v54, v55, v56, v57, v73);
        v49 = v81;
      }
    }
    goto LABEL_84;
  }
  if (MIBUOnceToken != -1) {
    dispatch_once(&MIBUOnceToken, &__block_literal_global_67);
  }
  if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
    +[MIBUPersonalizationManager requestTatsuTicketForDevice:error:]();
  }
  v35 = 0;
LABEL_49:
  if (a4) {
    *a4 = v23;
  }
  AMSupportSafeRelease();

  return v35;
}

void __64__MIBUPersonalizationManager_requestTatsuTicketForDevice_error___block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

void __64__MIBUPersonalizationManager_requestTatsuTicketForDevice_error___block_invoke_15()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

void __64__MIBUPersonalizationManager_requestTatsuTicketForDevice_error___block_invoke_50()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

void __64__MIBUPersonalizationManager_requestTatsuTicketForDevice_error___block_invoke_53()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

void __64__MIBUPersonalizationManager_requestTatsuTicketForDevice_error___block_invoke_56()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

void __64__MIBUPersonalizationManager_requestTatsuTicketForDevice_error___block_invoke_62()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

void __64__MIBUPersonalizationManager_requestTatsuTicketForDevice_error___block_invoke_65()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

void __64__MIBUPersonalizationManager_requestTatsuTicketForDevice_error___block_invoke_68()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

void __64__MIBUPersonalizationManager_requestTatsuTicketForDevice_error___block_invoke_71()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

void __64__MIBUPersonalizationManager_requestTatsuTicketForDevice_error___block_invoke_77()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

void __64__MIBUPersonalizationManager_requestTatsuTicketForDevice_error___block_invoke_86()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

void __64__MIBUPersonalizationManager_requestTatsuTicketForDevice_error___block_invoke_92()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

void __64__MIBUPersonalizationManager_requestTatsuTicketForDevice_error___block_invoke_95()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

void __64__MIBUPersonalizationManager_requestTatsuTicketForDevice_error___block_invoke_101()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

+ (__AMAuthInstall)_createBaseAMAIObjectForDevice:(id)a3 error:(id *)a4
{
  uint64_t v76 = *MEMORY[0x263EF8340];
  id v5 = a3;
  AMAuthInstallLogSetHandler();
  if (MIBUOnceToken != -1) {
    dispatch_once(&MIBUOnceToken, &__block_literal_global_111);
  }
  uint64_t v6 = (void *)MIBUConnObj;
  if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = v6;
    *(_DWORD *)buf = 138543618;
    id v73 = v5;
    __int16 v74 = 2112;
    uint64_t LibraryVersionString = AMAuthInstallSupportGetLibraryVersionString();
    _os_log_impl(&dword_2309BC000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Building base AMAI object from %@", buf, 0x16u);
  }
  CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  uint64_t v9 = (__AMAuthInstall *)AMAuthInstallCreate();
  if (!v9)
  {
    if (MIBUOnceToken != -1) {
      dispatch_once(&MIBUOnceToken, &__block_literal_global_114);
    }
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
      +[MIBUPersonalizationManager _createBaseAMAIObjectForDevice:error:]();
    }
    uint64_t v71 = 0;
    uint64_t v46 = @"Failed to create AMAuthInstall object";
    uint64_t v47 = (id *)&v71;
    uint64_t v48 = &v71;
    goto LABEL_50;
  }
  CFURLRef v10 = CFURLCreateWithString(v8, @"https://gs.apple.com:443", 0);
  if (!v10)
  {
    if (MIBUOnceToken != -1) {
      dispatch_once(&MIBUOnceToken, &__block_literal_global_120);
    }
    v49 = MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
      +[MIBUPersonalizationManager _createBaseAMAIObjectForDevice:error:]((uint64_t)v5, v49);
    }
    uint64_t v70 = 0;
    uint64_t v46 = @"Failed to create server URL object";
    uint64_t v47 = (id *)&v70;
    uint64_t v48 = &v70;
LABEL_50:
    safeAssignError(v48, 100663296, 0, v46, v42, v43, v44, v45, v65);
LABEL_72:
    char v40 = 0;
    goto LABEL_73;
  }
  uint64_t v11 = (uint64_t)v10;
  if (AMAuthInstallSetSigningServerURL())
  {
    if (MIBUOnceToken != -1) {
      dispatch_once(&MIBUOnceToken, &__block_literal_global_126);
    }
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
      +[MIBUPersonalizationManager _createBaseAMAIObjectForDevice:error:].cold.6();
    }
    uint64_t v69 = 0;
    uint64_t v47 = (id *)&v69;
    safeAssignError(&v69, 100663296, 0, @"Failed to set signing server URL to %@", v50, v51, v52, v53, v11);
    goto LABEL_72;
  }
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (Mutable)
  {
    v13 = Mutable;
    v14 = (const void *)*MEMORY[0x263F8BE80];
    v15 = [v5 ecid];
    if (v15)
    {
      v16 = [v5 ecid];
      CFDictionarySetValue(v13, v14, v16);
    }
    else
    {
      CFDictionarySetValue(v13, v14, (const void *)*MEMORY[0x263EFFD08]);
    }

    v17 = (const void *)*MEMORY[0x263F8BE78];
    v18 = [v5 chipID];
    if (v18)
    {
      v19 = [v5 chipID];
      CFDictionarySetValue(v13, v17, v19);
    }
    else
    {
      CFDictionarySetValue(v13, v17, (const void *)*MEMORY[0x263EFFD08]);
    }

    v20 = (const void *)*MEMORY[0x263F8BE70];
    char v21 = [v5 boardID];
    if (v21)
    {
      uint64_t v22 = [v5 boardID];
      CFDictionarySetValue(v13, v20, v22);
    }
    else
    {
      CFDictionarySetValue(v13, v20, (const void *)*MEMORY[0x263EFFD08]);
    }

    id v23 = (const void *)*MEMORY[0x263F8BEB0];
    v24 = [v5 securityDomain];
    if (v24)
    {
      int v25 = [v5 securityDomain];
      CFDictionarySetValue(v13, v23, v25);
    }
    else
    {
      CFDictionarySetValue(v13, v23, (const void *)*MEMORY[0x263EFFD08]);
    }

    v26 = (const void *)*MEMORY[0x263F8BEB8];
    int v27 = [v5 securityMode];
    uint64_t v28 = (const void *)*MEMORY[0x263EFFB40];
    v29 = (const void *)*MEMORY[0x263EFFB38];
    if (v27) {
      v30 = (const void *)*MEMORY[0x263EFFB40];
    }
    else {
      v30 = (const void *)*MEMORY[0x263EFFB38];
    }
    CFDictionarySetValue(v13, v26, v30);
    uint64_t v31 = (const void *)*MEMORY[0x263F8BEA0];
    if ([v5 productionMode]) {
      v32 = v28;
    }
    else {
      v32 = v29;
    }
    CFDictionarySetValue(v13, v31, v32);
    CFDictionarySetValue(v13, (const void *)*MEMORY[0x263F8BEC8], v28);
    v33 = (const void *)*MEMORY[0x263F8BE68];
    uint64_t v34 = [v5 apNonce];
    if (v34)
    {
      v35 = [v5 apNonce];
      CFDictionarySetValue(v13, v33, v35);
    }
    else
    {
      CFDictionarySetValue(v13, v33, (const void *)*MEMORY[0x263EFFD08]);
    }

    v36 = (const void *)*MEMORY[0x263F8BED0];
    if ([v5 uidMode]) {
      v37 = v28;
    }
    else {
      v37 = v29;
    }
    CFDictionarySetValue(v13, v36, v37);
    CFDictionarySetValue(v13, (const void *)*MEMORY[0x263F8BEA8], v28);
    if (AMAuthInstallApSetParameters())
    {
      if (MIBUOnceToken != -1) {
        dispatch_once(&MIBUOnceToken, &__block_literal_global_138);
      }
      if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
        +[MIBUPersonalizationManager _createBaseAMAIObjectForDevice:error:].cold.5();
      }
      uint64_t v67 = 0;
      uint64_t v62 = @"Failed to set auth install ap img4 parameters";
      uint64_t v47 = (id *)&v67;
      uint64_t v63 = &v67;
    }
    else
    {
      uint64_t v38 = AMAuthInstallApImg4ForceServerSigning();
      if (!v38)
      {
        id v39 = 0;
        char v40 = 1;
        if (!a4) {
          goto LABEL_37;
        }
        goto LABEL_36;
      }
      uint64_t v64 = v38;
      if (MIBUOnceToken != -1) {
        dispatch_once(&MIBUOnceToken, &__block_literal_global_144);
      }
      if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
        +[MIBUPersonalizationManager _createBaseAMAIObjectForDevice:error:].cold.4();
      }
      uint64_t v66 = 0;
      uint64_t v62 = @"Failed server signing, status: %d";
      uint64_t v65 = v64;
      uint64_t v47 = (id *)&v66;
      uint64_t v63 = &v66;
    }
    safeAssignError(v63, 100663296, 0, v62, v58, v59, v60, v61, v65);
    goto LABEL_72;
  }
  if (MIBUOnceToken != -1) {
    dispatch_once(&MIBUOnceToken, &__block_literal_global_132);
  }
  if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
    +[MIBUPersonalizationManager _createBaseAMAIObjectForDevice:error:]();
  }
  uint64_t v68 = 0;
  uint64_t v47 = (id *)&v68;
  safeAssignError(&v68, 100663296, 0, @"Failed to allocate options dictionary", v54, v55, v56, v57, v65);
  char v40 = 1;
LABEL_73:
  id v39 = *v47;
  if (a4) {
LABEL_36:
  }
    *a4 = v39;
LABEL_37:
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  if ((v40 & 1) == 0)
  {
    AMSupportSafeRelease();
    uint64_t v9 = 0;
  }

  return v9;
}

void __67__MIBUPersonalizationManager__createBaseAMAIObjectForDevice_error___block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

void __67__MIBUPersonalizationManager__createBaseAMAIObjectForDevice_error___block_invoke_112()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

void __67__MIBUPersonalizationManager__createBaseAMAIObjectForDevice_error___block_invoke_118()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

void __67__MIBUPersonalizationManager__createBaseAMAIObjectForDevice_error___block_invoke_124()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

void __67__MIBUPersonalizationManager__createBaseAMAIObjectForDevice_error___block_invoke_130()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

void __67__MIBUPersonalizationManager__createBaseAMAIObjectForDevice_error___block_invoke_136()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

void __67__MIBUPersonalizationManager__createBaseAMAIObjectForDevice_error___block_invoke_142()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

+ (void)requestTatsuTicketForDevice:error:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_2309BC000, v0, v1, "%{public}@: Failed to create AMAI object", v2, v3, v4, v5, v6);
}

+ (void)requestTatsuTicketForDevice:error:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_2309BC000, v0, v1, "%{public}@: Fail Tatsu personalization, status: %d");
}

+ (void)requestTatsuTicketForDevice:error:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_2309BC000, v0, v1, "%{public}@: Failed to parse payload from personalization response: %{public}@");
}

+ (void)requestTatsuTicketForDevice:error:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_2309BC000, v0, v1, "%{public}@: Failed to add measurement dict, status: %d");
}

+ (void)requestTatsuTicketForDevice:error:.cold.5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_2309BC000, v0, v1, "%{public}@: Failed to enable AC SSO, status: %d");
}

+ (void)requestTatsuTicketForDevice:error:.cold.6()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_2309BC000, v0, v1, "%{public}@: Failed load SSOClient.framework; status: %d");
}

+ (void)requestTatsuTicketForDevice:error:.cold.7()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_2309BC000, v0, v1, "%{public}@: Failed to load tatsu payload from file: %{public}@");
}

+ (void)_createBaseAMAIObjectForDevice:error:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_2309BC000, v0, v1, "%{public}@: Failed to create AMAuthInstall object", v2, v3, v4, v5, v6);
}

+ (void)_createBaseAMAIObjectForDevice:(uint64_t)a1 error:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 138543618;
  uint64_t v3 = a1;
  __int16 v4 = 2114;
  uint64_t v5 = @"https://gs.apple.com:443";
  _os_log_error_impl(&dword_2309BC000, a2, OS_LOG_TYPE_ERROR, "%{public}@: Failed to create server URL object for %{public}@", (uint8_t *)&v2, 0x16u);
}

+ (void)_createBaseAMAIObjectForDevice:error:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_2309BC000, v0, v1, "%{public}@: Failed to allocate options dictionary", v2, v3, v4, v5, v6);
}

+ (void)_createBaseAMAIObjectForDevice:error:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_2309BC000, v0, v1, "%{public}@: Failed server signing, status: %d");
}

+ (void)_createBaseAMAIObjectForDevice:error:.cold.5()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_2309BC000, v0, v1, "%{public}@: Failed to set auth install ap img4 parameters", v2, v3, v4, v5, v6);
}

+ (void)_createBaseAMAIObjectForDevice:error:.cold.6()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_2309BC000, v0, v1, "%{public}@: Failed to set signing server URL to %{public}@");
}

@end