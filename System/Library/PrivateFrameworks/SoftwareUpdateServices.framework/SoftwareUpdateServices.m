void sub_21DCF9AF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void SULogInfoForSubsystem(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void SULogForSubsystem(void *a1, int a2, void *a3, uint64_t a4)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v7 = a1;
  v8 = (objc_class *)NSString;
  id v9 = a3;
  v10 = (void *)[[v8 alloc] initWithFormat:v9 arguments:a4];

  if (a2 == 3)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      SULog_cold_2();
    }
  }
  else if (a2 == 1)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      SULog_cold_1();
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v11 = 138543362;
    v12 = v10;
    _os_log_impl(&dword_21DCF7000, v7, OS_LOG_TYPE_INFO, "%{public}@", (uint8_t *)&v11, 0xCu);
  }
}

id SULogFollowUp()
{
  if (SULogFollowUp___once != -1) {
    dispatch_once(&SULogFollowUp___once, &__block_literal_global_10);
  }
  v0 = (void *)SULogFollowUp___instance;
  return v0;
}

void sub_21DCFA3A8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21DCFA82C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21DCFA9A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_21DCFAC50(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak((id *)(v4 - 72));
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void SULogInfo(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void SULogDebug(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void SULog(int a1, void *a2, uint64_t a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v5 = (objc_class *)NSString;
  id v6 = a2;
  v7 = (void *)[[v5 alloc] initWithFormat:v6 arguments:a3];

  if (a1 == 3)
  {
    v8 = SULogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      SULog_cold_2();
    }
  }
  else if (a1 == 1)
  {
    v8 = SULogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      SULog_cold_1();
    }
  }
  else
  {
    v8 = SULogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = 138543362;
      v10 = v7;
      _os_log_impl(&dword_21DCF7000, v8, OS_LOG_TYPE_INFO, "%{public}@", (uint8_t *)&v9, 0xCu);
    }
  }
}

id SULogCommon()
{
  if (SULogCommon___once != -1) {
    dispatch_once(&SULogCommon___once, &__block_literal_global_4);
  }
  v0 = (void *)SULogCommon___instance;
  return v0;
}

void SULog_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_21DCF7000, v0, OS_LOG_TYPE_DEBUG, "%{public}@", v1, 0xCu);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_21DCFD24C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id obj)
{
}

__CFString *SUStringFromClientType(int a1)
{
  v1 = @"Foreground";
  if (a1 != 1) {
    v1 = 0;
  }
  if (a1) {
    return v1;
  }
  else {
    return @"Background";
  }
}

void sub_21DCFD708(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21DCFD7B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_21DCFDD38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id obj)
{
}

uint64_t __SULogFollowUp_block_invoke()
{
  SULogFollowUp___instance = (uint64_t)os_log_create("com.apple.softwareupdateservices", "SUFollowUp");
  return MEMORY[0x270F9A758]();
}

uint64_t __SULogCommon_block_invoke()
{
  SULogCommon___instance = (uint64_t)os_log_create("com.apple.softwareupdateservices", "Common");
  return MEMORY[0x270F9A758]();
}

void sub_21DD00938(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_21DD00B28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21DD00C38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id buildPreManifest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = AMAuthInstallCreate();
  if (v8)
  {
    v16 = (const void *)v8;
    if (AMAuthInstallApSetParameters())
    {
      SULogInfo(@"%s failed to set NULL AP parameters in amai: %d", v17, v18, v19, v20, v21, v22, v23, (uint64_t)"buildPreManifest");
    }
    else
    {
      uint64_t v24 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:8];
      if (v24)
      {
        v32 = (void *)v24;
        uint64_t v33 = *MEMORY[0x263F8BF08];
        CFTypeID TypeID = CFNumberGetTypeID();
        if ((addMGProperty(v32, @"ChipID", v33, TypeID, v35, v36, v37, v38) & 1) == 0) {
          goto LABEL_15;
        }
        uint64_t v46 = *MEMORY[0x263F8BF00];
        CFTypeID v47 = CFNumberGetTypeID();
        if ((addMGProperty(v32, @"BoardId", v46, v47, v48, v49, v50, v51) & 1) == 0) {
          goto LABEL_15;
        }
        uint64_t v52 = *MEMORY[0x263F8BF10];
        CFTypeID v53 = CFNumberGetTypeID();
        if ((addMGProperty(v32, @"UniqueChipID", v52, v53, v54, v55, v56, v57) & 1) != 0
          && (uint64_t v58 = *MEMORY[0x263F8BF30],
              CFTypeID v59 = CFNumberGetTypeID(),
              (addMGProperty(v32, @"SigningFuse", v58, v59, v60, v61, v62, v63) & 1) != 0)
          && (uint64_t v64 = *MEMORY[0x263F8BF48],
              CFTypeID v65 = CFNumberGetTypeID(),
              (addMGProperty(v32, @"CertificateSecurityMode", v64, v65, v66, v67, v68, v69) & 1) != 0))
        {
          [v32 setSafeObject:&unk_26CEBCF88 forKey:*MEMORY[0x263F8BF40]];
          if (addImageDict(v32, a1, a2, @"SEP", v70, v71, v72, v73))
          {
            if (addImageDict(v32, a3, a4, @"RestoreSEP", v77, v78, v79, v80))
            {
              if (AMAuthInstallApImg4LocalCreatePreManifest()) {
                SULogInfo(@"%s failed to create pre-manifest: %d", v88, v89, v90, v91, v92, v93, v94, (uint64_t)"buildPreManifest");
              }
            }
            else
            {
              SULogInfo(@"%s couldn't add 'RestoreSEP' image to request dict", v81, v82, v83, v84, v85, v86, v87, (uint64_t)"buildPreManifest");
            }
          }
          else
          {
            SULogInfo(@"%s couldn't add 'SEP' image to request dict", v74, v75, v76, v77, v78, v79, v80, (uint64_t)"buildPreManifest");
          }
        }
        else
        {
LABEL_15:
          SULogInfo(@"%s couldn't add '%@' property to request dict", v39, v40, v41, v42, v43, v44, v45, (uint64_t)"buildPreManifest");
        }
      }
      else
      {
        SULogInfo(@"%s couldn't allocate request dict", v25, v26, v27, v28, v29, v30, v31, (uint64_t)"buildPreManifest");
      }
    }
    CFRelease(v16);
  }
  else
  {
    SULogInfo(@"%s couldn't instantiate AMAuthInstall", v9, v10, v11, v12, v13, v14, v15, (uint64_t)"buildPreManifest");
  }
  return 0;
}

uint64_t addMGProperty(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1)
  {
    SULogInfo(@"%s dict can't be NULL", a2, a3, a4, a5, a6, a7, a8, (uint64_t)"addMGProperty");
    return 0;
  }
  if (!a2)
  {
    SULogInfo(@"%s question can't be NULL", 0, a3, a4, a5, a6, a7, a8, (uint64_t)"addMGProperty");
    return 0;
  }
  if (!a3)
  {
    SULogInfo(@"%s key can't be NULL", a2, 0, a4, a5, a6, a7, a8, (uint64_t)"addMGProperty");
    return 0;
  }
  uint64_t v11 = (const void *)MGCopyAnswer();
  if (v11)
  {
    uint64_t v19 = v11;
    if (CFGetTypeID(v11) == a4) {
      [a1 setSafeObject:v19 forKey:a3];
    }
    else {
      SULogInfo(@"%s failed to get MG answer: %@ - skipping", v20, v21, v22, v23, v24, v25, v26, (uint64_t)"addMGProperty");
    }
    CFRelease(v19);
  }
  else
  {
    SULogInfo(@"%s failed to get MG answer: %@ - skipping", v12, v13, v14, v15, v16, v17, v18, (uint64_t)"addMGProperty");
  }
  return 1;
}

uint64_t addImageDict(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v26[2] = *MEMORY[0x263EF8340];
  if (!a1)
  {
    SULogInfo(@"%s dict can't be NULL", a2, a3, a4, a5, a6, a7, a8, (uint64_t)"addImageDict");
    return 0;
  }
  if (!a2)
  {
    SULogInfo(@"%s digest can't be NULL", 0, a3, a4, a5, a6, a7, a8, (uint64_t)"addImageDict");
    return 0;
  }
  if (!a4)
  {
    SULogInfo(@"%s requestTag can't be NULL", a2, a3, 0, a5, a6, a7, a8, (uint64_t)"addImageDict");
    return 0;
  }
  if (a3)
  {
    uint64_t v10 = *MEMORY[0x263F8BFE8];
    v25[0] = *MEMORY[0x263F8BFC8];
    v25[1] = v10;
    v26[0] = a2;
    v26[1] = a3;
    uint64_t v11 = NSDictionary;
    uint64_t v12 = v26;
    uint64_t v13 = v25;
    uint64_t v14 = 2;
  }
  else
  {
    uint64_t v23 = *MEMORY[0x263F8BFC8];
    uint64_t v24 = a2;
    uint64_t v11 = NSDictionary;
    uint64_t v12 = &v24;
    uint64_t v13 = &v23;
    uint64_t v14 = 1;
  }
  uint64_t v16 = [v11 dictionaryWithObjects:v12 forKeys:v13 count:v14];
  if (!v16)
  {
    SULogInfo(@"%s couldn't create image dict for '%@'", v15, 0, v17, v18, v19, v20, v21, (uint64_t)"addImageDict");
    return 0;
  }
  [a1 setSafeObject:v16 forKey:a4];
  return 1;
}

void sub_21DD06A18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21DD0890C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21DD08A84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
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

void sub_21DD0D23C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
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

void sub_21DD0F2E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
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

void sub_21DD0FAE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21DD105FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_21DD109E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21DD10B08(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_21DD10CA8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_21DD10E48(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_21DD11004(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_21DD11224(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_21DD113D8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_21DD1158C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_21DD11734(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_21DD12490(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
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

void sub_21DD12B1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21DD133C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_21DD13C1C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_21DD14230(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

BOOL useInternalPowerPolicies()
{
  os_log_t v0 = +[SUPreferences sharedInstance];
  int v1 = [v0 customerPowerPolicies];

  if (v1)
  {
    SULogInfo(@"customerPowerPolicies is set, returning NO for useInternalPowerPolicies", v2, v3, v4, v5, v6, v7, v8, v10);
    return 0;
  }
  else
  {
    return +[SUUtility currentReleaseTypeIsInternal];
  }
}

BOOL isPluggedIntoPower()
{
  int out_token = 0;
  uint32_t v0 = notify_register_check("com.apple.springboard.pluggedin", &out_token);
  BOOL result = 0;
  if (!v0)
  {
    uint64_t v2 = 0;
    notify_get_state(out_token, &v2);
    notify_cancel(out_token);
    return v2 == 1;
  }
  return result;
}

uint64_t connectedToCharger(unsigned char *a1)
{
  uint64_t v2 = (const void *)IOPSCopyPowerSourcesByType();
  uint64_t v10 = off_26447C000;
  if (!v2)
  {
    SULogInfo(@"Failed to copy powerSources", v3, v4, v5, v6, v7, v8, v9, v79);
LABEL_12:
    uint64_t v44 = 0;
    goto LABEL_21;
  }
  uint64_t v11 = v2;
  CFArrayRef v12 = IOPSCopyPowerSourcesList(v2);
  if (!v12)
  {
    SULogInfo(@"Failed to copy powerSourcesList", v13, v14, v15, v16, v17, v18, v19, v79);
    CFRelease(v11);
    goto LABEL_12;
  }
  CFArrayRef v20 = v12;
  if (CFArrayGetCount(v12) < 1)
  {
    uint64_t v44 = 0;
    goto LABEL_20;
  }
  uint64_t v80 = a1;
  CFIndex v21 = 0;
  uint64_t v22 = @"Type";
  uint64_t v23 = @"deviceType: %@";
  uint64_t v24 = @"InternalBattery";
  while (1)
  {
    ValueAtIndex = CFArrayGetValueAtIndex(v20, v21);
    uint64_t v26 = IOPSGetPowerSourceDescription(v11, ValueAtIndex);
    uint64_t v27 = [v26 objectForKey:v22];
    SULogInfo(v23, v28, v29, v30, v31, v32, v33, v34, (uint64_t)v27);
    if (![v27 isEqualToString:v24]) {
      goto LABEL_8;
    }
    uint64_t v35 = [v26 objectForKey:@"Is Charging"];
    if ([v35 BOOLValue]) {
      break;
    }
    [v26 objectForKey:@"Show Charging UI"];
    uint64_t v81 = v27;
    uint64_t v36 = v26;
    CFArrayRef v37 = v20;
    uint64_t v38 = v11;
    uint64_t v39 = v24;
    uint64_t v40 = v23;
    v42 = uint64_t v41 = v22;
    int v43 = [v42 BOOLValue];

    uint64_t v22 = v41;
    uint64_t v23 = v40;
    uint64_t v24 = v39;
    uint64_t v11 = v38;
    CFArrayRef v20 = v37;
    uint64_t v26 = v36;
    uint64_t v27 = v81;

    if (v43) {
      goto LABEL_15;
    }
LABEL_8:

    if (++v21 >= CFArrayGetCount(v20))
    {
      uint64_t v44 = 0;
      goto LABEL_19;
    }
  }

LABEL_15:
  CFDictionaryRef v45 = IOPSCopyExternalPowerAdapterDetails();
  uint64_t v46 = [(__CFDictionary *)v45 objectForKey:@"FamilyCode"];
  CFTypeID v47 = [(__CFDictionary *)v45 objectForKey:@"IsWireless"];
  uint64_t v48 = stringForFamilyCode([v46 intValue]);
  SULogInfo(@"device connected to charger. Family code: %@ Wireless: %@", v49, v50, v51, v52, v53, v54, v55, (uint64_t)v48);

  if (v80)
  {
    *uint64_t v80 = [v47 BOOLValue];
    uint64_t v56 = +[SUPreferences sharedInstance];
    uint64_t v57 = [v56 batteryOverrideWirelessCharging];

    if (v57)
    {
      uint64_t v58 = +[SUPreferences sharedInstance];
      CFTypeID v59 = [v58 batteryOverrideWirelessCharging];
      *uint64_t v80 = [v59 BOOLValue];

      SULogInfo(@"SUBatteryInfoOverrideWirelessCharging preference is set, setting wirelesslyCharging to %hhd", v60, v61, v62, v63, v64, v65, v66, *v80);
    }
  }

  uint64_t v44 = 1;
LABEL_19:
  uint64_t v10 = off_26447C000;
LABEL_20:
  CFRelease(v11);
  CFRelease(v20);
LABEL_21:
  uint64_t v67 = [(__objc2_class *)v10[57] sharedInstance];
  uint64_t v68 = [v67 batteryOverridePluggedIn];

  if (v68)
  {
    uint64_t v69 = [(__objc2_class *)v10[57] sharedInstance];
    uint64_t v70 = [v69 batteryOverridePluggedIn];
    uint64_t v44 = [v70 BOOLValue];

    SULogInfo(@"SUBatteryInfoOverridePluggedIn preference is set, setting pluggedIn to %hhd", v71, v72, v73, v74, v75, v76, v77, v44);
  }
  return v44;
}

__CFString *stringForFamilyCode(uint64_t a1)
{
  if ((int)a1 > -536838145)
  {
    switch(a1)
    {
      case 0xE0024000:
        uint64_t v2 = @"kIOPSFamilyCodeAC";
        break;
      case 0xE0024001:
        uint64_t v2 = @"kIOPSFamilyCodeExternal";
        break;
      case 0xE0024002:
        uint64_t v2 = @"kIOPSFamilyCodeExternal2";
        break;
      case 0xE0024003:
        uint64_t v2 = @"kIOPSFamilyCodeExternal3";
        break;
      case 0xE0024004:
        uint64_t v2 = @"kIOPSFamilyCodeExternal4";
        break;
      case 0xE0024005:
        uint64_t v2 = @"kIOPSFamilyCodeExternal5";
        break;
      default:
        if (a1 == -536838144)
        {
          uint64_t v2 = @"kIOPSFamilyCodeFirewire";
        }
        else if (a1)
        {
LABEL_67:
          objc_msgSend(NSString, "stringWithFormat:", @"Unknown IOPSFamilyCode: %d", a1);
          uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          uint64_t v2 = @"kIOPSFamilyCodeDisconnected";
        }
        break;
    }
  }
  else
  {
    switch(a1)
    {
      case 0xE0004000:
        uint64_t v2 = @"kIOPSFamilyCodeUSBHost";
        break;
      case 0xE0004001:
        uint64_t v2 = @"kIOPSFamilyCodeUSBHostSuspended";
        break;
      case 0xE0004002:
        uint64_t v2 = @"kIOPSFamilyCodeUSBDevice";
        break;
      case 0xE0004003:
        uint64_t v2 = @"kIOPSFamilyCodeUSBAdapter";
        break;
      case 0xE0004004:
        uint64_t v2 = @"kIOPSFamilyCodeUSBChargingPortDedicated";
        break;
      case 0xE0004005:
        uint64_t v2 = @"kIOPSFamilyCodeUSBChargingPortDownstream";
        break;
      case 0xE0004006:
        uint64_t v2 = @"kIOPSFamilyCodeUSBChargingPort";
        break;
      case 0xE0004007:
        uint64_t v2 = @"kIOPSFamilyCodeUSBUnknown";
        break;
      case 0xE0004008:
        uint64_t v2 = @"kIOPSFamilyCodeUSBCBrick";
        break;
      case 0xE0004009:
        uint64_t v2 = @"kIOPSFamilyCodeUSBCTypeC";
        break;
      case 0xE000400A:
        uint64_t v2 = @"kIOPSFamilyCodeUSBCPD";
        break;
      default:
        if (a1 != -536870201) {
          goto LABEL_67;
        }
        uint64_t v2 = @"kIOPSFamilyCodeUnsupported";
        break;
    }
  }
  return v2;
}

id requiredBatteryLevelQueryStateDescription(char a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263F089D8]);
  [v2 appendString:@"{"];
  if (a1) {
    uint64_t v3 = @"internal,";
  }
  else {
    uint64_t v3 = @"external,";
  }
  [v2 appendString:v3];
  if ((a1 & 2) != 0) {
    uint64_t v4 = @"splat,";
  }
  else {
    uint64_t v4 = @"non-splat,";
  }
  [v2 appendString:v4];
  if ((a1 & 4) != 0) {
    uint64_t v5 = @"charging,";
  }
  else {
    uint64_t v5 = @"not-charging,";
  }
  [v2 appendString:v5];
  if ((a1 & 8) != 0) {
    uint64_t v6 = @"wireless,";
  }
  else {
    uint64_t v6 = @"not-wireless,";
  }
  [v2 appendString:v6];
  if ((a1 & 0x10) != 0) {
    uint64_t v7 = @"auto";
  }
  else {
    uint64_t v7 = @"manual";
  }
  [v2 appendString:v7];
  [v2 appendString:@"}"];
  return v2;
}

id getCurrentBatteryLevel()
{
  uint32_t v0 = (void *)MGCopyAnswer();
  uint64_t v1 = +[SUPreferences sharedInstance];
  id v2 = [v1 batteryLevelOverride];

  if (v2)
  {
    uint64_t v10 = +[SUPreferences sharedInstance];
    CFIndex v21 = [v10 batteryLevelOverride];
    SULogInfo(@"%s: SUBatteryLevelOverride is set to %@, overriding battery level", v11, v12, v13, v14, v15, v16, v17, (uint64_t)"NSNumber *getCurrentBatteryLevel(void)");

    uint64_t v18 = +[SUPreferences sharedInstance];
    uint64_t v19 = [v18 batteryLevelOverride];

    uint32_t v0 = (void *)v19;
  }
  if (!v0)
  {
    SULogError(@"%s: failed to get battery level; returning 0",
      v3,
      v4,
      v5,
      v6,
      v7,
      v8,
      v9,
      (uint64_t)"NSNumber *getCurrentBatteryLevel(void)");
    uint32_t v0 = &unk_26CEBCFD0;
  }
  return v0;
}

uint64_t _requiredBatteryLevelToAutoDownload(void *a1, char a2, int a3)
{
  id v5 = a1;
  uint64_t v13 = 0;
  if (([v5 isEmergencyOrCritical] & 1) == 0 && (a2 & 1) == 0)
  {
    if ([v5 isSplatOnly])
    {
      if ([v5 releasedBefore:86400.0]) {
        uint64_t v13 = 50;
      }
      else {
        uint64_t v13 = 999;
      }
      goto LABEL_13;
    }
    if ([v5 allowAutoDownloadOnBattery])
    {
      if (!a3)
      {
        uint64_t v13 = 999;
        goto LABEL_13;
      }
LABEL_12:
      uint64_t v13 = [v5 autoDownloadOnBatteryMinBattery];
      goto LABEL_13;
    }
    uint64_t v14 = +[SUPreferences sharedInstance];
    int v15 = [v14 overrideAllowAutoDownloadOnBattery];

    uint64_t v13 = 999;
    if (v15 && (a3 & 1) != 0) {
      goto LABEL_12;
    }
  }
LABEL_13:
  SULogInfo(@"%s: %@: require %u%% battery", v6, v7, v8, v9, v10, v11, v12, (uint64_t)"unsigned int _requiredBatteryLevelToAutoDownload(SUDescriptor *__strong _Nonnull, BOOL, BOOL)");

  return v13;
}

id SURequiredBatteryLevelForAutoDownloadForDescriptor(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = [MEMORY[0x263EFF910] now];
  char v6 = connectedToCharger(0);
  if (v4)
  {
    [v5 timeIntervalSinceDate:v4];
    double v8 = v7;
  }
  else
  {
    double v8 = 0.0;
  }
  uint64_t v9 = +[SUUtility prettyPrintDate:v4];
  uint64_t v39 = [v3 productBuildVersion];
  SULogInfo(@"fullyUnrampedDate = %@ for %@; timeElapsed = %.0lf sec (~ %.2lf days)",
    v10,
    v11,
    v12,
    v13,
    v14,
    v15,
    v16,
    (uint64_t)v9);

  unsigned int v17 = [v3 autoDownloadOnBatteryDelay];
  uint64_t v18 = +[SUPreferences sharedInstance];
  uint64_t v19 = [v18 overrideAutoDownloadOnBatteryDelay];

  if (v19)
  {
    uint64_t v27 = +[SUPreferences sharedInstance];
    uint64_t v28 = [v27 overrideAutoDownloadOnBatteryDelay];
    double v29 = (double)(unint64_t)[v28 unsignedLongLongValue];

    SULogInfo(@"autoDownloadOnBatteryDelay is set to %.0lf sec by default", v30, v31, v32, v33, v34, v35, v36, *(uint64_t *)&v29);
  }
  else
  {
    double v29 = (double)v17 * 86400.0;
  }
  SULogInfo(@"autoDownloadOnBatteryDelay = %.0lf sec (~ %.2lf days)", v20, v21, v22, v23, v24, v25, v26, *(uint64_t *)&v29);
  CFArrayRef v37 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", _requiredBatteryLevelToAutoDownload(v3, v6, v8 >= v29));

  return v37;
}

BOOL SUHasEnoughBatteryForAutoDownloadForDescriptor(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  id v5 = getCurrentBatteryLevel();
  unint64_t v6 = [v5 unsignedLongLongValue];

  double v7 = SURequiredBatteryLevelForAutoDownloadForDescriptor(v4, v3);

  unint64_t v8 = [v7 unsignedLongLongValue];
  SULogInfo(@"%s: currentBatteryLevel = %llu, requiredBatteryLevel = %llu", v9, v10, v11, v12, v13, v14, v15, (uint64_t)"BOOL SUHasEnoughBatteryForAutoDownloadForDescriptor(SUDescriptor *__strong _Nonnull, NSDate *__strong _Nonnull)");
  return v6 >= v8;
}

uint64_t SUHasEnoughBatteryForDownloadForDescriptor(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return 1;
}

void *SURequiredBatteryLevelForDownloadForDescriptor(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return &unk_26CEBCFD0;
}

float SURequiredBatteryLevelForInstall()
{
  return SURequiredBatteryLevelForInstallation(0, 0);
}

float SURequiredBatteryLevelForInstallForDescriptor(void *a1)
{
  return SURequiredBatteryLevelForInstallation(a1, 0);
}

float SURequiredBatteryLevelForInstallation(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = v4;
  if (v3)
  {
    if ([v3 isSplatOnly]) {
      char v6 = 2;
    }
    else {
      char v6 = 0;
    }
    if (!v5) {
      goto LABEL_8;
    }
  }
  else
  {
    char v6 = 0;
    if (!v4) {
      goto LABEL_8;
    }
  }
  if ([v5 automaticInstallation]) {
    v6 |= 0x10u;
  }
LABEL_8:
  char v21 = 0;
  int v7 = connectedToCharger(&v21);
  char v8 = 12;
  if (!v21) {
    char v8 = 4;
  }
  if (v7) {
    char v9 = v8;
  }
  else {
    char v9 = 0;
  }
  char v10 = v6 | useInternalPowerPolicies() | v9;
  float v11 = SURequiredBatteryLevelForInstallForState(v10);
  uint64_t v12 = requiredBatteryLevelQueryStateDescription(v10);
  SULogInfo(@"state=%@, required battery level = %d%%", v13, v14, v15, v16, v17, v18, v19, (uint64_t)v12);

  return v11;
}

float SURequiredBatteryLevelForInstallForState(char a1)
{
  if ((a1 & 1) == 0)
  {
    if ((a1 & 2) == 0)
    {
      if ((a1 & 0x10) != 0) {
        goto LABEL_4;
      }
      return 0.2;
    }
    return flt_21DDCF510[(a1 & 4) == 0];
  }
  if ((a1 & 2) != 0) {
    return flt_21DDCF510[(a1 & 4) == 0];
  }
  if ((a1 & 0x10) == 0) {
    return 0.2;
  }
LABEL_4:
  float result = flt_21DDCF518[(a1 & 8) == 0];
  if ((a1 & 4) == 0) {
    return 0.3;
  }
  return result;
}

BOOL SUHasEnoughBatteryForInstall()
{
  return SUHasEnoughBatteryForInstallation(0, 0);
}

BOOL SUHasEnoughBatteryForInstallForDescriptor(void *a1)
{
  return SUHasEnoughBatteryForInstallation(a1, 0);
}

BOOL SUHasEnoughBatteryForInstallation(void *a1, void *a2)
{
  uint64_t v2 = (uint64_t)(SURequiredBatteryLevelForInstallation(a1, a2) * 100.0);
  id v3 = getCurrentBatteryLevel();
  uint64_t v4 = [v3 longLongValue];
  SULogInfo(@"Current battery level: %lld, minimumCharge:%lld", v5, v6, v7, v8, v9, v10, v11, v4);
  BOOL v12 = 0;
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v3 longLongValue] >= v2) {
      BOOL v12 = 1;
    }
  }

  return v12;
}

void SULogError(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void SULogDebugForSubsystem(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void SULogErrorForSubsystem(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

id SULogInstallConstraints()
{
  if (SULogInstallConstraints___once != -1) {
    dispatch_once(&SULogInstallConstraints___once, &__block_literal_global_4);
  }
  uint32_t v0 = (void *)SULogInstallConstraints___instance;
  return v0;
}

uint64_t __SULogInstallConstraints_block_invoke()
{
  SULogInstallConstraints___instance = (uint64_t)os_log_create("com.apple.softwareupdateservices", "InstallationConstraints");
  return MEMORY[0x270F9A758]();
}

id SULogBadging()
{
  if (SULogBadging___once != -1) {
    dispatch_once(&SULogBadging___once, &__block_literal_global_7);
  }
  uint32_t v0 = (void *)SULogBadging___instance;
  return v0;
}

uint64_t __SULogBadging_block_invoke()
{
  SULogBadging___instance = (uint64_t)os_log_create("com.apple.softwareupdateservices", "SUBadging");
  return MEMORY[0x270F9A758]();
}

id SULogAnalytics()
{
  if (SULogAnalytics___once != -1) {
    dispatch_once(&SULogAnalytics___once, &__block_literal_global_13);
  }
  uint32_t v0 = (void *)SULogAnalytics___instance;
  return v0;
}

uint64_t __SULogAnalytics_block_invoke()
{
  SULogAnalytics___instance = (uint64_t)os_log_create("com.apple.softwareupdateservices", "SUAnalytics");
  return MEMORY[0x270F9A758]();
}

id SULogAlerts()
{
  if (SULogAlerts___once != -1) {
    dispatch_once(&SULogAlerts___once, &__block_literal_global_16);
  }
  uint32_t v0 = (void *)SULogAlerts___instance;
  return v0;
}

uint64_t __SULogAlerts_block_invoke()
{
  SULogAlerts___instance = (uint64_t)os_log_create("com.apple.softwareupdateservices", "Alerts");
  return MEMORY[0x270F9A758]();
}

void sub_21DD2A7DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21DD2B610(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
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

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void sub_21DD2C994(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

void sub_21DD2D488(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21DD2D5F4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21DD2D6E4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21DD2D8B0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21DD2DABC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_21DD2DCBC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21DD2DDB0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
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

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
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

void sub_21DD435EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

void sub_21DD44638(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21DD461B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
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

void sub_21DD475BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_21DD47628(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21DD47760(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21DD4782C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21DD4793C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21DD49B84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21DD4A244(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, int a9, long long a10)
{
  if (a2 == 1)
  {
    id v10 = objc_begin_catch(exception_object);
    uint64_t v11 = SULogInstallConstraints();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      a9 = 138412546;
      WORD2(a10) = 2112;
      *(void *)((char *)&a10 + 6) = v10;
      _os_log_impl(&dword_21DCF7000, v11, OS_LOG_TYPE_DEFAULT, "%@ - exception caught: %@", (uint8_t *)&a9, 0x16u);
    }

    objc_end_catch();
    JUMPOUT(0x21DD4A214);
  }
  _Unwind_Resume(exception_object);
}

void sub_21DD4BE1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
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

uint64_t SUDownloadPhaseIsFetchingAnything(void *a1, int a2)
{
  id v3 = a1;
  uint64_t v4 = v3;
  if (a2 && ([v3 isEqualToString:@"SUDownloadPhaseStarting"] & 1) != 0
    || ([v4 isEqualToString:@"SUDownloadPhaseFetching"] & 1) != 0)
  {
    uint64_t IsFetchingBrain = 1;
  }
  else
  {
    uint64_t IsFetchingBrain = SUDownloadPhaseIsFetchingBrain(v4);
  }

  return IsFetchingBrain;
}

uint64_t SUDownloadPhaseIsFetchingUpdate(void *a1, const char *a2)
{
  return [a1 isEqualToString:@"SUDownloadPhaseFetching"];
}

uint64_t SUDownloadPhaseIsFetchingBrain(void *a1)
{
  id v1 = a1;
  if (([v1 isEqualToString:@"SUDownloadPhaseBrainFetching"] & 1) != 0
    || ([v1 isEqualToString:@"SUDownloadPhaseBrainFetchingStalled"] & 1) != 0
    || ([v1 isEqualToString:@"SUDownloadPhaseBrainFetchingQueuedLocal"] & 1) != 0)
  {
    uint64_t v2 = 1;
  }
  else
  {
    uint64_t v2 = [v1 isEqualToString:@"SUDownloadPhaseBrainFetchingQueuedRemote"];
  }

  return v2;
}

uint64_t SUDownloadPhaseIsAttemptingToFetchUpdate(void *a1)
{
  id v1 = a1;
  if (([v1 isEqualToString:@"SUDownloadPhaseFetching"] & 1) != 0
    || ([v1 isEqualToString:@"SUDownloadPhaseStarting"] & 1) != 0
    || ([v1 isEqualToString:@"SUDownloadPhaseFetching"] & 1) != 0)
  {
    uint64_t v2 = 1;
  }
  else
  {
    uint64_t v2 = [v1 isEqualToString:@"SUDownloadPhaseFetchingStalled"];
  }

  return v2;
}

uint64_t SUDownloadPhaseStartedDownloadNotPrepared(void *a1)
{
  id v1 = a1;
  if (SUDownloadPhaseIsBrainRelated(v1)) {
    uint64_t Update = 1;
  }
  else {
    uint64_t Update = SUDownloadPhaseIsAttemptingToFetchUpdate(v1);
  }

  return Update;
}

uint64_t SUDownloadPhaseIsBrainRelated(void *a1)
{
  id v1 = a1;
  if ((SUDownloadPhaseIsFetchingBrain(v1) & 1) != 0
    || ([v1 isEqualToString:@"SUDownloadPhaseBrainVerifying"] & 1) != 0)
  {
    uint64_t v2 = 1;
  }
  else
  {
    uint64_t v2 = [v1 isEqualToString:@"SUDownloadPhaseBrainExtracting"];
  }

  return v2;
}

uint64_t SUDownloadPhaseIsBeyondBrainLoad(void *a1)
{
  id v1 = a1;
  if (SUDownloadPhaseIsBrainRelated(v1)) {
    uint64_t v2 = 0;
  }
  else {
    uint64_t v2 = [v1 isEqualToString:@"SUDownloadPhaseStarting"] ^ 1;
  }

  return v2;
}

uint64_t SUDownloadPhaseIsUpdateDownloading(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"SUDownloadPhaseFetching"]) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = [v1 isEqualToString:@"SUDownloadPhaseFetchingStalled"];
  }

  return v2;
}

uint64_t SUDownloadPhaseIsHalted(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"SUDownloadPhaseBrainFetchingQueuedLocal"]) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = [v1 isEqualToString:@"SUDownloadPhaseBrainFetchingQueuedRemote"];
  }

  return v2;
}

uint64_t SUDownloadPhaseIsStalled(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"SUDownloadPhaseBrainFetchingStalled"]) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = [v1 isEqualToString:@"SUDownloadPhaseFetchingStalled"];
  }

  return v2;
}

__CFString *SUStringFromMDMSUPath(unint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown SUMDMSoftwareUpdatePath value: %lu", a1);
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v1 = off_26447DED0[a1];
  }
  return v1;
}

__CFString *SUStringFromDownloadPriority(unsigned int a1)
{
  if (a1 > 2) {
    return 0;
  }
  else {
    return off_26447DEF0[a1];
  }
}

__CFString *SUStringFromUpdateType(int a1)
{
  if ((a1 - 1) > 3) {
    return @"Not Specified";
  }
  else {
    return off_26447DF08[a1 - 1];
  }
}

__CFString *SUStringFromUpdateTypes(void *a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v1 = a1;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v17 objects:v21 count:16];
  id v3 = &stru_26CE93248;
  if (v2)
  {
    uint64_t v4 = v2;
    LODWORD(v5) = 0;
    uint64_t v6 = *(void *)v18;
    do
    {
      uint64_t v7 = 0;
      unint64_t v5 = (int)v5;
      do
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v1);
        }
        uint64_t v8 = *(void **)(*((void *)&v17 + 1) + 8 * v7);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v9 = NSString;
          unsigned int v10 = [v8 intValue] - 1;
          uint64_t v11 = @"Not Specified";
          if (v10 <= 3) {
            uint64_t v11 = off_26447DF08[v10];
          }
          ++v5;
          unint64_t v12 = [v1 count];
          uint64_t v13 = @", ";
          if (v12 <= v5) {
            uint64_t v13 = &stru_26CE93248;
          }
          uint64_t v14 = [v9 stringWithFormat:@"%@%@", v11, v13];
          uint64_t v15 = [(__CFString *)v3 stringByAppendingString:v14];

          id v3 = (__CFString *)v15;
        }
        else
        {
          ++v5;
        }
        ++v7;
      }
      while (v4 != v7);
      uint64_t v4 = [v1 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v4);
  }

  return v3;
}

__CFString *SUStringFromOSUpdateType(uint64_t a1)
{
  if (a1 == 1)
  {
    uint64_t v2 = @"Splat";
  }
  else if (a1)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknonw OSUpdateType: %u", a1);
    uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v2 = @"OS";
  }
  return v2;
}

__CFString *SUStringFromAgreementStatus(unsigned int a1)
{
  if (a1 > 2) {
    return @"Unknown Status";
  }
  else {
    return off_26447DF28[a1];
  }
}

__CFString *SUStringFromNetworkType(unsigned int a1)
{
  if (a1 > 9) {
    return @"Unknown";
  }
  else {
    return off_26447DF40[a1];
  }
}

id SUStringFromInstallationConstraints(uint64_t a1)
{
  uint64_t v17 = 0;
  long long v18 = &v17;
  uint64_t v19 = 0x3032000000;
  long long v20 = __Block_byref_object_copy__12;
  char v21 = __Block_byref_object_dispose__12;
  id v22 = 0;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  int v16 = 0;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __SUStringFromInstallationConstraints_block_invoke;
  v14[3] = &unk_26447DE88;
  v14[4] = &v17;
  v14[5] = v15;
  uint64_t v2 = (void *)MEMORY[0x223C18480](v14);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  uint64_t v11 = __SUStringFromInstallationConstraints_block_invoke_2;
  unint64_t v12 = &unk_26447DEB0;
  id v3 = v2;
  id v13 = v3;
  uint64_t v4 = v10;
  if (a1)
  {
    char v23 = 0;
    uint8x8_t v5 = (uint8x8_t)vcnt_s8((int8x8_t)a1);
    v5.i16[0] = vaddlv_u8(v5);
    int v6 = v5.i32[0];
    if (v5.i32[0])
    {
      unint64_t v7 = 0;
      do
      {
        if (((1 << v7) & a1) != 0)
        {
          ((void (*)(void *))v11)(v4);
          if (v23) {
            break;
          }
          --v6;
        }
        if (v7 > 0x3E) {
          break;
        }
        ++v7;
      }
      while (v6 > 0);
    }
  }

  id v8 = (id)v18[5];
  _Block_object_dispose(v15, 8);
  _Block_object_dispose(&v17, 8);

  return v8;
}

void sub_21DD531F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va1, a12);
  va_start(va, a12);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
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

void __SUStringFromInstallationConstraints_block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = *(void *)(a1 + 32);
  if (!*(void *)(*(void *)(v3 + 8) + 40))
  {
    id v4 = objc_alloc_init(MEMORY[0x263F089D8]);
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    int v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    uint64_t v3 = *(void *)(a1 + 32);
  }
  if (*(int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) >= 1)
  {
    [*(id *)(*(void *)(v3 + 8) + 40) appendString:@", "];
    uint64_t v3 = *(void *)(a1 + 32);
  }
  [*(id *)(*(void *)(v3 + 8) + 40) appendString:v7];
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

uint64_t __SUStringFromInstallationConstraints_block_invoke_2(uint64_t result, uint64_t a2)
{
  if (a2 > 63)
  {
    if (a2 <= 511)
    {
      if (a2 != 64 && a2 != 128 && a2 != 256) {
        return result;
      }
    }
    else if (a2 > 2047)
    {
      if (a2 != 2048 && a2 != 4096) {
        return result;
      }
    }
    else if (a2 != 512 && a2 != 1024)
    {
      return result;
    }
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  switch(a2)
  {
    case 0:
    case 1:
    case 2:
    case 4:
    case 8:
      return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
    case 3:
    case 5:
    case 6:
    case 7:
      return result;
    default:
      if (a2 == 16 || a2 == 32) {
        return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
      }
      break;
  }
  return result;
}

__CFString *SUStringFromDownloadPolicyType(unsigned int a1)
{
  if (a1 > 4) {
    return 0;
  }
  else {
    return off_26447DF90[a1];
  }
}

__CFString *SUStringFromActivationMessageType(unsigned int a1)
{
  if (a1 > 2) {
    return 0;
  }
  else {
    return off_26447DFB8[a1];
  }
}

__CFString *SUStringFromAudienceType(unint64_t a1)
{
  if (a1 > 2) {
    return @"Unknown";
  }
  else {
    return off_26447DFD0[a1];
  }
}

__CFString *SUStringFromPreferredUpdateType(unint64_t a1)
{
  if (a1 > 2) {
    return @"Unknown";
  }
  else {
    return off_26447DFE8[a1];
  }
}

__CFString *SUStringFromVersionUpgradeType(unint64_t a1)
{
  if (a1 > 2) {
    return @"Unknown";
  }
  else {
    return off_26447E000[a1];
  }
}

__CFString *SUStringFromRollbackSuggestionReasonType(unint64_t a1)
{
  if (a1 > 2) {
    return 0;
  }
  else {
    return off_26447E018[a1];
  }
}

__CFString *SUStringFromSUScanTaskType(unint64_t a1)
{
  if (a1 > 2) {
    return 0;
  }
  else {
    return off_26447E030[a1];
  }
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

void sub_21DD56A8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v16 - 136), 8);
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

void sub_21DD5BF78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_21DD5C5C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21DD5D2D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getBYSetupAssistantBundleIdentifierSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!SetupAssistantLibraryCore_frameworkLibrary)
  {
    v4[1] = (void *)MEMORY[0x263EF8330];
    v4[2] = (void *)3221225472;
    v4[3] = __SetupAssistantLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_26447E2C8;
    uint64_t v6 = 0;
    SetupAssistantLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v2 = (void *)SetupAssistantLibraryCore_frameworkLibrary;
  if (!SetupAssistantLibraryCore_frameworkLibrary) {
    __getBYSetupAssistantBundleIdentifierSymbolLoc_block_invoke_cold_1(v4);
  }
  if (v4[0]) {
    free(v4[0]);
  }
  float result = dlsym(v2, "BYSetupAssistantBundleIdentifier");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getBYSetupAssistantBundleIdentifierSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __SetupAssistantLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SetupAssistantLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t __softwareUpdateDaemonStarted(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  SULogDebug(@"softwareupdateservicesd launch detected.", (uint64_t)a2, a3, a4, a5, a6, a7, a8, v10);
  return [a2 performSelectorOnMainThread:sel_connectToServerIfNecessary withObject:0 waitUntilDone:0];
}

void sub_21DD61EBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose((const void *)(v32 - 168), 8);
  _Block_object_dispose((const void *)(v32 - 136), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__15(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__15(uint64_t a1)
{
}

void sub_21DD621D4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_21DD62D7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_21DD632F0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_21DD635B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_21DD63E64(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_21DD641B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_21DD64504(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_21DD64810(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_21DD64AD0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_21DD64D44(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_21DD64FB8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_21DD660D8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_21DD68A90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_21DD68DB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_21DD6906C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_21DD69388(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_21DD695E4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_21DD6A198(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_21DD6A618(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_21DD6AA14(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_21DD6AC50(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_21DD6BACC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_21DD6BD24(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_21DD6D1E4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21DD6D284(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21DD6F5B4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_21DD6FE58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21DD6FFC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21DD70138(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21DD702A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21DD70418(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21DD70588(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21DD706F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21DD70964(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21DD70C14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
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

void sub_21DD71640(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21DD71800(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21DD733A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21DD737B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21DD73AC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21DD73C20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21DD74004(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21DD74508(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21DD74678(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21DD7483C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21DD749AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21DD74B60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21DD74CE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21DD74E60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21DD75120(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21DD75704(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _eventIsBlacklisted(void *a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v1 = a1;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v2 = [&unk_26CEBD260 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v16;
    while (2)
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v16 != v4) {
          objc_enumerationMutation(&unk_26CEBD260);
        }
        if ([v1 containsString:*(void *)(*((void *)&v15 + 1) + 8 * v5)])
        {
          SULogInfo(@"Alarm %@ is on AutoInstall alarm blacklist. Ignoring alarm", v6, v7, v8, v9, v10, v11, v12, (uint64_t)v1);
          uint64_t v13 = 1;
          goto LABEL_11;
        }
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [&unk_26CEBD260 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
  uint64_t v13 = 0;
LABEL_11:

  return v13;
}

void sub_21DD77CB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t purgeableAssetSpaceAvailableForOTAUpdate()
{
  uint64_t v0 = purgeableAssetSpaceAvailable(&unk_26CEBD278);
  return purgeableAssetSpaceAvailableV2(&unk_26CEBD278) + v0;
}

void sub_21DD78318(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void purgeAssets(void *a1, int a2, void *a3)
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  obuint64_t j = a1;
  uint64_t v42 = [obj countByEnumeratingWithState:&v50 objects:v55 count:16];
  uint64_t v5 = 0;
  if (v42)
  {
    uint64_t v6 = *(void *)v51;
    uint64_t v39 = a3;
    uint64_t v40 = *(void *)v51;
    int v38 = a2;
    do
    {
      for (uint64_t i = 0; i != v42; ++i)
      {
        if (*(void *)v51 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        id v49 = v5;
        uint64_t v9 = _queryLocalAssetsForType(v8, a2, &v49);
        id v10 = v49;

        if (v10)
        {
          int v43 = v9;
          SULogDebug(@"%@", v11, v12, v13, v14, v15, v16, v17, (uint64_t)v10);
          if (a3 && !*a3)
          {
            id v10 = v10;
            uint64_t v5 = 0;
            *a3 = v10;
          }
          else
          {
            uint64_t v5 = 0;
          }
        }
        else
        {
          if (!v9)
          {
            uint64_t v5 = 0;
            goto LABEL_28;
          }
          long long v47 = 0u;
          long long v48 = 0u;
          long long v45 = 0u;
          long long v46 = 0u;
          int v43 = v9;
          id v10 = v9;
          uint64_t v18 = [v10 countByEnumeratingWithState:&v45 objects:v54 count:16];
          if (v18)
          {
            uint64_t v19 = v18;
            uint64_t v5 = 0;
            uint64_t v20 = *(void *)v46;
            do
            {
              for (uint64_t j = 0; j != v19; ++j)
              {
                if (*(void *)v46 != v20) {
                  objc_enumerationMutation(v10);
                }
                id v22 = *(void **)(*((void *)&v45 + 1) + 8 * j);
                if ([v22 state] == 1)
                {
                  SULogDebug(@"Deleting %@ from MAV1 path\n", v23, v24, v25, v26, v27, v28, v29, (uint64_t)v8);
                  id v44 = v5;
                  [v22 purgeAndReturnError:&v44];
                  id v30 = v44;

                  if (v30)
                  {
                    SULogDebug(@"%@", v31, v32, v33, v34, v35, v36, v37, (uint64_t)v30);
                    uint64_t v5 = v30;
                  }
                  else
                  {
                    uint64_t v5 = 0;
                  }
                }
              }
              uint64_t v19 = [v10 countByEnumeratingWithState:&v45 objects:v54 count:16];
            }
            while (v19);
            a3 = v39;
            a2 = v38;
          }
          else
          {
            uint64_t v5 = 0;
          }
          uint64_t v6 = v40;
        }

        uint64_t v9 = v43;
LABEL_28:
      }
      uint64_t v42 = [obj countByEnumeratingWithState:&v50 objects:v55 count:16];
    }
    while (v42);
  }
}

id queryLocalAssetsForTypeV2(void *a1, void *a2)
{
  id v3 = a1;
  if (v3)
  {
    uint64_t v4 = (void *)[objc_alloc(MEMORY[0x263F55950]) initWithType:v3];
    [v4 returnTypes:1];
    uint64_t v5 = [v4 queryMetaDataSync];
    if (v5)
    {
      SULogInfo(@"failed to query metadata: %ld", v6, v7, v8, v9, v10, v11, v12, v5);
      uint64_t v13 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.softwareupdateservices.errors" code:58 userInfo:0];
    }
    else
    {
      uint64_t v13 = 0;
    }
    uint64_t v14 = [v4 results];
    id v22 = v14;
    if (v13)
    {
      SULogDebug(@"queryAssetsForType(%@) - error %@\n", v15, v16, v17, v18, v19, v20, v21, (uint64_t)v3);
      uint64_t v23 = 0;
LABEL_9:

      goto LABEL_10;
    }
    if (v14)
    {
      uint64_t v23 = [v14 sortedArrayUsingComparator:&__block_literal_global_628];
      uint64_t v13 = 0;
      goto LABEL_9;
    }
    uint64_t v23 = 0;
    uint64_t v13 = 0;
  }
  else
  {
    uint64_t v23 = 0;
    uint64_t v13 = 0;
    uint64_t v4 = 0;
  }
LABEL_10:
  if (a2) {
    *a2 = v13;
  }
  id v24 = v23;

  return v24;
}

uint64_t __queryLocalAssetsForTypeV2_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = v5;
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  if (v4 && v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      uint64_t v7 = 0;
      uint64_t v8 = 0;
      uint64_t v9 = 0;
      goto LABEL_10;
    }
    uint64_t v10 = [v4 attributes];
    uint64_t v11 = *MEMORY[0x263F558A0];
    uint64_t v8 = [v10 objectForKeyedSubscript:*MEMORY[0x263F558A0]];

    uint64_t v12 = [v6 attributes];
    uint64_t v9 = [v12 objectForKeyedSubscript:v11];

    if (!v8) {
      goto LABEL_12;
    }
    objc_opt_class();
    uint64_t v7 = 0;
    if ((objc_opt_isKindOfClass() & 1) != 0 && v9)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v7 = [v9 compare:v8];
        goto LABEL_10;
      }
LABEL_12:
      uint64_t v7 = 0;
    }
  }
LABEL_10:

  return v7;
}

id queryLocalAssetsForType(void *a1, void *a2)
{
  return _queryLocalAssetsForType(a1, 0, a2);
}

id _queryLocalAssetsForType(void *a1, int a2, void *a3)
{
  id v5 = a1;
  if (!v5)
  {
    uint64_t v6 = 0;
    goto LABEL_14;
  }
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x263F55928]) initWithAssetType:v5];
  [v6 setQueriesLocalAssetInformationOnly:1];
  if (a2)
  {
    uint64_t v7 = (void *)MGCopyAnswer();
    if (v7)
    {
      uint64_t v8 = [MEMORY[0x263F08A98] predicateWithFormat:@"%@ IN %K OR %K == NULL", v7, @"SupportedDeviceModels", @"SupportedDeviceModels"];
      [v6 setPredicate:v8];
    }
  }
  id v22 = 0;
  uint64_t v9 = [v6 runQueryAndReturnError:&v22];
  id v10 = v22;
  if (v10)
  {
    uint64_t v18 = v10;
    SULogDebug(@"queryAssetsForType(%@) - error %@\n", v11, v12, v13, v14, v15, v16, v17, (uint64_t)v5);
    uint64_t v19 = 0;
    goto LABEL_10;
  }
  if (!v9)
  {
LABEL_14:
    uint64_t v18 = 0;
    uint64_t v19 = 0;
    if (!a3) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  uint64_t v19 = [v9 sortedArrayUsingComparator:&__block_literal_global_636];
  uint64_t v18 = 0;
LABEL_10:

  if (a3) {
LABEL_11:
  }
    *a3 = v18;
LABEL_12:
  id v20 = v19;

  return v20;
}

uint64_t ___queryLocalAssetsForType_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = v5;
  uint64_t v7 = 0;
  if (v4 && v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      uint64_t v8 = [v6 attributes];
      uint64_t v9 = *MEMORY[0x263F558A0];
      id v10 = [v8 objectForKeyedSubscript:*MEMORY[0x263F558A0]];
      uint64_t v11 = [v4 attributes];
      uint64_t v12 = [v11 objectForKeyedSubscript:v9];
      uint64_t v7 = [v10 compare:v12];
    }
    else
    {
      uint64_t v7 = 0;
    }
  }

  return v7;
}

uint64_t purgeableAssetSpaceAvailable(void *a1)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1)
  {
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    uint64_t v3 = [v1 countByEnumeratingWithState:&v40 objects:v45 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = 0;
      uint64_t v6 = *(void *)v41;
      uint64_t v7 = *MEMORY[0x263F558A0];
      uint64_t v30 = *(void *)v41;
      uint64_t v31 = v2;
      while (1)
      {
        uint64_t v8 = 0;
        uint64_t v32 = v4;
        do
        {
          if (*(void *)v41 != v6) {
            objc_enumerationMutation(v2);
          }
          uint64_t v9 = *(void **)(*((void *)&v40 + 1) + 8 * v8);
          id v39 = 0;
          id v10 = _queryLocalAssetsForType(v9, 0, &v39);
          id v11 = v39;
          if (v11)
          {
            id v12 = v11;
          }
          else
          {
            if (!v10) {
              goto LABEL_22;
            }
            long long v37 = 0u;
            long long v38 = 0u;
            long long v35 = 0u;
            long long v36 = 0u;
            uint64_t v34 = v10;
            id v12 = v10;
            uint64_t v13 = [v12 countByEnumeratingWithState:&v35 objects:v44 count:16];
            if (v13)
            {
              uint64_t v14 = v13;
              uint64_t v33 = v8;
              uint64_t v15 = *(void *)v36;
              do
              {
                for (uint64_t i = 0; i != v14; ++i)
                {
                  if (*(void *)v36 != v15) {
                    objc_enumerationMutation(v12);
                  }
                  uint64_t v17 = *(void **)(*((void *)&v35 + 1) + 8 * i);
                  if ([v17 state] == 1)
                  {
                    uint64_t v18 = [v17 attributes];
                    uint64_t v19 = [v18 objectForKeyedSubscript:v7];
                    [v19 unsignedLongLongValue];
                    SULogDebug(@"%@: %llu\n", v20, v21, v22, v23, v24, v25, v26, (uint64_t)v9);

                    uint64_t v27 = [v17 attributes];
                    uint64_t v28 = [v27 objectForKeyedSubscript:v7];
                    v5 += [v28 unsignedLongLongValue];
                  }
                }
                uint64_t v14 = [v12 countByEnumeratingWithState:&v35 objects:v44 count:16];
              }
              while (v14);
              uint64_t v6 = v30;
              uint64_t v2 = v31;
              uint64_t v4 = v32;
              uint64_t v8 = v33;
            }
            id v10 = v34;
          }

LABEL_22:
          ++v8;
        }
        while (v8 != v4);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v40 objects:v45 count:16];
        if (!v4) {
          goto LABEL_26;
        }
      }
    }
  }
  uint64_t v5 = 0;
LABEL_26:

  return v5;
}

uint64_t purgeableAssetSpaceAvailableV2(void *a1)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1)
  {
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    uint64_t v3 = [v1 countByEnumeratingWithState:&v42 objects:v47 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = 0;
      uint64_t v6 = *(void *)v43;
      uint64_t v7 = *MEMORY[0x263F558A0];
      uint64_t v32 = *(void *)v43;
      uint64_t v33 = v2;
      while (1)
      {
        uint64_t v8 = 0;
        uint64_t v34 = v4;
        do
        {
          if (*(void *)v43 != v6) {
            objc_enumerationMutation(v2);
          }
          uint64_t v9 = *(void **)(*((void *)&v42 + 1) + 8 * v8);
          id v41 = 0;
          id v10 = queryLocalAssetsForTypeV2(v9, &v41);
          id v11 = v41;
          if (v11)
          {
            id v12 = v11;
          }
          else
          {
            if (!v10) {
              goto LABEL_23;
            }
            long long v39 = 0u;
            long long v40 = 0u;
            long long v37 = 0u;
            long long v38 = 0u;
            long long v36 = v10;
            id v12 = v10;
            uint64_t v13 = [v12 countByEnumeratingWithState:&v37 objects:v46 count:16];
            if (v13)
            {
              uint64_t v14 = v13;
              uint64_t v35 = v8;
              uint64_t v15 = *(void *)v38;
              do
              {
                for (uint64_t i = 0; i != v14; ++i)
                {
                  if (*(void *)v38 != v15) {
                    objc_enumerationMutation(v12);
                  }
                  uint64_t v17 = *(void **)(*((void *)&v37 + 1) + 8 * i);
                  if ([v17 wasPurgeable])
                  {
                    uint64_t v18 = [v17 attributes];
                    uint64_t v19 = [v18 objectForKeyedSubscript:v7];

                    if (v19)
                    {
                      uint64_t v20 = [v17 attributes];
                      uint64_t v21 = [v20 objectForKeyedSubscript:v7];
                      [v21 unsignedLongLongValue];
                      SULogDebug(@"%@: %llu\n", v22, v23, v24, v25, v26, v27, v28, (uint64_t)v9);

                      uint64_t v29 = [v17 attributes];
                      uint64_t v30 = [v29 objectForKeyedSubscript:v7];
                      v5 += [v30 unsignedLongLongValue];
                    }
                  }
                }
                uint64_t v14 = [v12 countByEnumeratingWithState:&v37 objects:v46 count:16];
              }
              while (v14);
              uint64_t v6 = v32;
              uint64_t v2 = v33;
              uint64_t v4 = v34;
              uint64_t v8 = v35;
            }
            id v10 = v36;
          }

LABEL_23:
          ++v8;
        }
        while (v8 != v4);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v42 objects:v47 count:16];
        if (!v4) {
          goto LABEL_27;
        }
      }
    }
  }
  uint64_t v5 = 0;
LABEL_27:

  return v5;
}

unint64_t purgeAssetSpace(void *a1, unint64_t a2, void *a3)
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v5 = a1;
  id v49 = [MEMORY[0x263EFF980] array];
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  unint64_t v9 = 0;
  if (v5 && a2)
  {
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id v10 = v5;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v57 objects:v62 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      unint64_t v9 = 0;
      uint64_t v13 = *(void *)v58;
      uint64_t v50 = *MEMORY[0x263F558A0];
      long long v45 = v10;
      id v46 = v5;
      uint64_t v42 = *(void *)v58;
      long long v43 = a3;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v58 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void **)(*((void *)&v57 + 1) + 8 * i);
          id v56 = 0;
          uint64_t v16 = _queryLocalAssetsForType(v15, 0, &v56);
          id v17 = v56;
          if (v17)
          {
            id v18 = v17;
            uint64_t v48 = v16;
            if (a3 && !*a3)
            {
              id v18 = v17;
              *a3 = v18;
            }
            goto LABEL_28;
          }
          if (v16)
          {
            uint64_t v47 = i;
            uint64_t v48 = v16;
            long long v54 = 0u;
            long long v55 = 0u;
            long long v52 = 0u;
            long long v53 = 0u;
            id v18 = v16;
            uint64_t v19 = [v18 countByEnumeratingWithState:&v52 objects:v61 count:16];
            if (!v19) {
              goto LABEL_27;
            }
            uint64_t v20 = v19;
            uint64_t v44 = v12;
            uint64_t v21 = *(void *)v53;
LABEL_15:
            uint64_t v22 = 0;
            while (1)
            {
              if (*(void *)v53 != v21) {
                objc_enumerationMutation(v18);
              }
              uint64_t v23 = *(void **)(*((void *)&v52 + 1) + 8 * v22);
              if ([v23 state] == 1)
              {
                unint64_t v24 = v9;
                unint64_t v25 = a2;
                uint64_t v26 = [v23 attributes];
                uint64_t v27 = [v26 objectForKeyedSubscript:v50];
                uint64_t v28 = [v27 unsignedLongLongValue];

                if (v28)
                {
                  SULogDebug(@"Deleting %llu (%@)\n", v29, v30, v31, v32, v33, v34, v35, v28);
                  id v51 = 0;
                  [v23 purgeAndReturnError:&v51];
                  id v36 = v51;
                  if (v36)
                  {
                    uint64_t v6 = v36;
                    unint64_t v9 = v24;
                    goto LABEL_33;
                  }
                  a2 = v25;
                  long long v37 = [v23 attributes];
                  [v49 addObject:v37];

                  unint64_t v9 = v28 + v24;
                }
                else
                {
                  a2 = v25;
                  unint64_t v9 = v24;
                }
                if (v9 >= a2)
                {
                  uint64_t v6 = 0;
LABEL_33:

                  uint64_t v7 = 0;
                  uint64_t v8 = 0;
                  id v5 = v46;
                  goto LABEL_40;
                }
              }
              if (v20 == ++v22)
              {
                uint64_t v20 = [v18 countByEnumeratingWithState:&v52 objects:v61 count:16];
                if (v20) {
                  goto LABEL_15;
                }
                uint64_t v13 = v42;
                a3 = v43;
                uint64_t v12 = v44;
                id v10 = v45;
LABEL_27:
                uint64_t i = v47;
LABEL_28:

                uint64_t v16 = v48;
                break;
              }
            }
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v57 objects:v62 count:16];
        id v5 = v46;
      }
      while (v12);
    }
    else
    {
      unint64_t v9 = 0;
    }

    long long v38 = +[SUUtility systemContainerURL];
    uint64_t v8 = v38;
    if (v38)
    {
      long long v39 = NSString;
      long long v40 = [v38 path];
      uint64_t v7 = [v39 stringWithFormat:@"%@%@", v40, @"/Library/SoftwareUpdate/deletedAssets.plist"];

      if (v7) {
        writeArrayToFile(v49, v7);
      }
      uint64_t v6 = 0;
    }
    else
    {
      uint64_t v6 = 0;
      uint64_t v7 = 0;
    }
  }
LABEL_40:

  return v9;
}

void writeArrayToFile(void *a1, void *a2)
{
  uint64_t v3 = (void *)MEMORY[0x263EFF980];
  id v4 = a2;
  id v5 = a1;
  id v14 = [v3 arrayWithContentsOfFile:v4];
  [v14 addObjectsFromArray:v5];

  LOBYTE(v5) = [v14 writeToFile:v4 atomically:1];
  if ((v5 & 1) == 0) {
    SULogInfo(@"Failed to write deleted asset plist to disk", v6, v7, v8, v9, v10, v11, v12, v13);
  }
}

unint64_t purgeAssetSpaceV2(void *a1, unint64_t a2, void *a3)
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v5 = a1;
  uint64_t v6 = v5;
  unint64_t v51 = 0;
  if (v5 && a2)
  {
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v57 objects:v62 count:16];
    if (!v8)
    {
      unint64_t v51 = 0;
      goto LABEL_38;
    }
    uint64_t v9 = v8;
    unint64_t v51 = 0;
    uint64_t v10 = *(void *)v58;
    uint64_t v50 = *MEMORY[0x263F558A0];
    id v46 = v7;
    uint64_t v47 = v6;
    uint64_t v43 = *(void *)v58;
    uint64_t v44 = a3;
    while (1)
    {
      uint64_t v11 = 0;
      uint64_t v45 = v9;
      do
      {
        if (*(void *)v58 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v49 = v11;
        uint64_t v12 = *(void **)(*((void *)&v57 + 1) + 8 * v11);
        id v56 = 0;
        uint64_t v13 = queryLocalAssetsForTypeV2(v12, &v56);
        id v14 = v56;
        if (v14)
        {
          id v15 = v14;
          uint64_t v48 = v13;
          if (a3)
          {
            uint64_t v16 = v49;
            if (!*a3)
            {
              id v15 = v14;
              *a3 = v15;
            }
            goto LABEL_30;
          }
LABEL_29:
          uint64_t v16 = v49;
LABEL_30:

          uint64_t v13 = v48;
          goto LABEL_31;
        }
        if (v13)
        {
          long long v54 = 0u;
          long long v55 = 0u;
          long long v52 = 0u;
          long long v53 = 0u;
          uint64_t v48 = v13;
          id v15 = v13;
          uint64_t v17 = [v15 countByEnumeratingWithState:&v52 objects:v61 count:16];
          if (v17)
          {
            uint64_t v18 = v17;
            uint64_t v19 = *(void *)v53;
            while (2)
            {
              for (uint64_t i = 0; i != v18; ++i)
              {
                if (*(void *)v53 != v19) {
                  objc_enumerationMutation(v15);
                }
                uint64_t v21 = *(void **)(*((void *)&v52 + 1) + 8 * i);
                if ([v21 wasPurgeable])
                {
                  unint64_t v22 = a2;
                  uint64_t v23 = [v21 attributes];
                  unint64_t v24 = [v23 objectForKeyedSubscript:v50];
                  uint64_t v25 = [v24 unsignedLongLongValue];

                  if (v25)
                  {
                    SULogDebug(@"Deleting %llu (%@)\n", v26, v27, v28, v29, v30, v31, v32, v25);
                    if ([v21 purgeSync])
                    {
                      uint64_t v42 = [v21 assetId];
                      SULogDebug(@"Failed to delete asset (%@) assetID: %@\n", v33, v34, v35, v36, v37, v38, v39, (uint64_t)v12);
                    }
                    else
                    {
                      v51 += v25;
                    }
                  }
                  if (v51 >= v22)
                  {

                    id v7 = v46;
                    uint64_t v6 = v47;
                    goto LABEL_38;
                  }
                  a2 = v22;
                }
              }
              uint64_t v18 = [v15 countByEnumeratingWithState:&v52 objects:v61 count:16];
              if (v18) {
                continue;
              }
              break;
            }
            id v7 = v46;
            uint64_t v6 = v47;
            uint64_t v10 = v43;
            a3 = v44;
          }
          uint64_t v9 = v45;
          goto LABEL_29;
        }
        uint64_t v16 = v49;
LABEL_31:

        uint64_t v11 = v16 + 1;
      }
      while (v11 != v9);
      uint64_t v40 = [v7 countByEnumeratingWithState:&v57 objects:v62 count:16];
      uint64_t v9 = v40;
      if (!v40)
      {
LABEL_38:

        break;
      }
    }
  }

  return v51;
}

unint64_t purgeAssetSpaceForOTAUpdate(unint64_t a1, void *a2)
{
  unint64_t v4 = purgeAssetSpace(&unk_26CEBD290, a1, a2);
  if ((uint64_t)(a1 - v4) < 1) {
    unint64_t v5 = 0;
  }
  else {
    unint64_t v5 = purgeAssetSpaceV2(&unk_26CEBD290, a1 - v4, a2);
  }
  return v5 + v4;
}

id specificTimeOnDate(void *a1, int a2, int a3, int a4)
{
  id v7 = (void *)MEMORY[0x263EFF8F0];
  id v8 = a1;
  uint64_t v9 = [v7 currentCalendar];
  uint64_t v10 = [v9 components:2097180 fromDate:v8];

  [v10 setHour:a2];
  [v10 setMinute:a3];
  [v10 setSecond:a4];
  uint64_t v11 = [v9 dateFromComponents:v10];

  return v11;
}

void sub_21DD7AEAC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21DD7AF14(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21DD7AF80(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21DD7AFEC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21DD7B060(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21DD7B0E8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21DD7B170(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21DD7B1E4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21DD7B258(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21DD7B2CC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21DD7B338(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21DD7B3AC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21DD7B418(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21DD7B48C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21DD7B4F8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21DD7B56C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21DD7B620(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21DD7B830(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21DD841AC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_21DD84458(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21DD84554(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21DD84754(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_21DD84888(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21DD8498C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21DD84BCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21DD84D08(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_21DD84E8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21DD84FB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
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

void sub_21DD85278(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

void sub_21DD8D0FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose((const void *)(v26 - 120), 8);
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

void sub_21DD8D4BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
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

__CFString *SUStringForAutoInstallForecastScheduleType(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2) {
    return @"Unknown";
  }
  else {
    return off_26447EED8[a1 - 1];
  }
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

void sub_21DD9F0A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __SUPreferencesChanged(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  SULogInfo(@"%s: Got notification: %@", a2, a3, a4, a5, a6, a7, a8, (uint64_t)"void __SUPreferencesChanged(CFNotificationCenterRef, void *, CFStringRef, const void *, CFDictionaryRef)");
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = ____SUPreferencesChanged_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a2;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __Block_byref_object_copy__22(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__22(uint64_t a1)
{
}

void SULog_cold_2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_21DCF7000, v0, OS_LOG_TYPE_ERROR, "%{public}@", v1, 0xCu);
}

void __getBYSetupAssistantBundleIdentifierSymbolLoc_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *SetupAssistantLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SUScanner.m", 44, @"%s", *a1);

  __break(1u);
  AMAuthInstallApImg4LocalCreatePreManifest();
}

uint64_t AMAuthInstallApImg4LocalCreatePreManifest()
{
  return MEMORY[0x270F980D0]();
}

uint64_t AMAuthInstallApSetParameters()
{
  return MEMORY[0x270F980E0]();
}

uint64_t AMAuthInstallCreate()
{
  return MEMORY[0x270F980F0]();
}

uint64_t AMAuthInstallRequestAbbreviatedSendSync()
{
  return MEMORY[0x270F98100]();
}

uint64_t AMAuthInstallSupportDictionarySetBoolean()
{
  return MEMORY[0x270F98138]();
}

uint64_t AMAuthInstallSupportDictionarySetInteger32()
{
  return MEMORY[0x270F98140]();
}

uint64_t ASServerURLForAssetType()
{
  return MEMORY[0x270F4A8D0]();
}

uint64_t BSDispatchQueueAssert()
{
  return MEMORY[0x270F10750]();
}

uint64_t BSDispatchQueueAssertMain()
{
  return MEMORY[0x270F10758]();
}

uint64_t BSDispatchQueueAssertNot()
{
  return MEMORY[0x270F10760]();
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x270EE4348]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
}

Boolean CFCalendarAddComponents(CFCalendarRef calendar, CFAbsoluteTime *at, CFOptionFlags options, const char *componentDesc, ...)
{
  return MEMORY[0x270EE46B0](calendar, at, options, componentDesc);
}

CFComparisonResult CFDateCompare(CFDateRef theDate, CFDateRef otherDate, void *context)
{
  return MEMORY[0x270EE4858](theDate, otherDate, context);
}

CFTypeID CFDateGetTypeID(void)
{
  return MEMORY[0x270EE48D8]();
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x270EE48F0](theDict, key);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x270EE4930](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x270EE4948]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x270EE4C58]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x270EE4C90](applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CC0](key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x270EE4D08](applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return MEMORY[0x270EE4ED0](mode, returnAfterSourceHandled, seconds);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5048](theString1, theString2, compareOptions);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x270EE5178](theString, buffer, bufferSize, *(void *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

SInt32 CFUserNotificationCancel(CFUserNotificationRef userNotification)
{
  return MEMORY[0x270EE54B8](userNotification);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x270EE54C8](allocator, flags, error, dictionary, timeout);
}

CFDictionaryRef CFUserNotificationGetResponseDictionary(CFUserNotificationRef userNotification)
{
  return (CFDictionaryRef)MEMORY[0x270EE54E8](userNotification);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return MEMORY[0x270EE5500](userNotification, responseFlags, timeout);
}

SInt32 CFUserNotificationUpdate(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags flags, CFDictionaryRef dictionary)
{
  return MEMORY[0x270EE5508](userNotification, flags, dictionary, timeout);
}

uint64_t CPCopyBundleIdentifierAndTeamFromAuditToken()
{
  return MEMORY[0x270F0CD10]();
}

uint64_t CPCopyBundleIdentifierFromAuditToken()
{
  return MEMORY[0x270F0CD18]();
}

uint64_t CTCellularDataPlanGetIsEnabled()
{
  return MEMORY[0x270EE8670]();
}

uint64_t CacheDeleteCopyPurgeableSpaceWithInfo()
{
  return MEMORY[0x270F13090]();
}

CFMutableDictionaryRef IOBSDNameMatching(mach_port_t mainPort, uint32_t options, const char *bsdName)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF3EE8](*(void *)&mainPort, *(void *)&options, bsdName);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x270EF4820](*(void *)&object);
}

CFArrayRef IOPMCopyScheduledPowerEvents(void)
{
  return (CFArrayRef)MEMORY[0x270EF4898]();
}

CFDictionaryRef IOPSCopyExternalPowerAdapterDetails(void)
{
  return (CFDictionaryRef)MEMORY[0x270EF48F8]();
}

uint64_t IOPSCopyPowerSourcesByType()
{
  return MEMORY[0x270EF4900]();
}

CFArrayRef IOPSCopyPowerSourcesList(CFTypeRef blob)
{
  return (CFArrayRef)MEMORY[0x270EF4918](blob);
}

CFDictionaryRef IOPSGetPowerSourceDescription(CFTypeRef blob, CFTypeRef ps)
{
  return (CFDictionaryRef)MEMORY[0x270EF4950](blob, ps);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x270EF49D8](*(void *)&entry, key, allocator, *(void *)&options);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x270EF4AB0](*(void *)&mainPort, matching);
}

uint64_t MAGetPallasAudience()
{
  return MEMORY[0x270F4A8E8]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

uint64_t MGCopyAnswerWithError()
{
  return MEMORY[0x270F95FA8]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

uint64_t MKBDeviceLockAssertion()
{
  return MEMORY[0x270F4AE08]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x270F4AE20]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x270F4AE40]();
}

uint64_t MKBKeyBagKeyStashCreateWithManifest()
{
  return MEMORY[0x270F4AE70]();
}

uint64_t MKBKeyBagKeyStashCreateWithMode()
{
  return MEMORY[0x270F4AE78]();
}

uint64_t MKBKeyBagKeyStashCreateWithOpts()
{
  return MEMORY[0x270F4AE80]();
}

uint64_t MKBKeyBagKeyStashPersist()
{
  return MEMORY[0x270F4AE88]();
}

uint64_t MKBKeyBagKeyStashVerify()
{
  return MEMORY[0x270F4AE90]();
}

uint64_t MRMediaRemoteGetNowPlayingApplicationPlaybackState()
{
  return MEMORY[0x270F49F88]();
}

uint64_t MRMediaRemoteSetWantsNowPlayingNotifications()
{
  return MEMORY[0x270F4A090]();
}

uint64_t MSUAssetCalculateApplySize()
{
  return MEMORY[0x270F4AEF0]();
}

uint64_t MSUAssetCalculatePrepareSize()
{
  return MEMORY[0x270F4AEF8]();
}

uint64_t MSUPurgeSuspendedUpdate()
{
  return MEMORY[0x270F4AF30]();
}

uint64_t NEHelperSettingsSetArray()
{
  return MEMORY[0x270ED7C60]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

void NSLog(NSString *format, ...)
{
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x270EF2BE8](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

uint64_t RVGetNeRDInfo()
{
  return MEMORY[0x270F4AF50]();
}

uint64_t SBSProcessAssertionCreateForPID()
{
  return MEMORY[0x270F771A8]();
}

uint64_t SUCoreBorder_MSUBrainIsLoadable()
{
  return MEMORY[0x270F76338]();
}

uint64_t WiFiManagerClientCreate()
{
  return MEMORY[0x270F4B510]();
}

uint64_t WiFiManagerClientGetType()
{
  return MEMORY[0x270F4B578]();
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
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

void bzero(void *a1, size_t a2)
{
}

uint64_t container_system_path_for_identifier()
{
  return MEMORY[0x270ED90F8]();
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

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

dispatch_workloop_t dispatch_workloop_create(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x270ED95C8](label);
}

int dlclose(void *__handle)
{
  return MEMORY[0x270ED9618](__handle);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x270ED9628](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

void free(void *a1)
{
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x270ED9BA0](a1, a2, a3, a4, *(void *)&a5);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x270EDA748](*(void *)&token, state64);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x270EDA760](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x270EDA768](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

uint64_t nw_path_create_default_evaluator()
{
  return MEMORY[0x270EF87D8]();
}

uint64_t nw_path_evaluator_cancel()
{
  return MEMORY[0x270EF8808]();
}

uint64_t nw_path_evaluator_copy_path()
{
  return MEMORY[0x270EF8810]();
}

uint64_t nw_path_evaluator_set_update_handler()
{
  return MEMORY[0x270EF8840]();
}

uint64_t nw_path_evaluator_start()
{
  return MEMORY[0x270EF8848]();
}

nw_path_status_t nw_path_get_status(nw_path_t path)
{
  return MEMORY[0x270EF8928](path);
}

BOOL nw_path_is_constrained(nw_path_t path)
{
  return MEMORY[0x270EF8988](path);
}

BOOL nw_path_is_expensive(nw_path_t path)
{
  return MEMORY[0x270EF89B8](path);
}

BOOL nw_path_uses_interface_type(nw_path_t path, nw_interface_type_t interface_type)
{
  return MEMORY[0x270EF8A58](path, *(void *)&interface_type);
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

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int rand(void)
{
  return MEMORY[0x270EDB0D8]();
}

void srand(unsigned int a1)
{
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x270EDB560](a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x270EDB570](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x270EDB7D0](a1, *(void *)&a2, a3, a4, a5, a6);
}

time_t time(time_t *a1)
{
  return MEMORY[0x270EDB930](a1);
}

uint64_t vproc_swap_integer()
{
  return MEMORY[0x270EDBB08]();
}

xpc_object_t xpc_activity_copy_criteria(xpc_activity_t activity)
{
  return (xpc_object_t)MEMORY[0x270EDBCA8](activity);
}

uint64_t xpc_activity_copy_identifier()
{
  return MEMORY[0x270EDBCB0]();
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x270EDBCB8](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

void xpc_activity_set_criteria(xpc_activity_t activity, xpc_object_t criteria)
{
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return MEMORY[0x270EDBCE8](activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return MEMORY[0x270EDBCF0](activity);
}

void xpc_activity_unregister(const char *identifier)
{
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDBD18](objects, count);
}

void xpc_array_set_string(xpc_object_t xarray, size_t index, const char *string)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x270EDC018]();
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x270EDC0A8](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_date(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

uint64_t xpc_set_event()
{
  return MEMORY[0x270EDC398]();
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}