id NMLogForCategory(uint64_t a1)
{
  void *v2;
  uint64_t vars8;

  if (NMLogForCategory_onceToken != -1) {
    dispatch_once(&NMLogForCategory_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)NMLogForCategory_logObjects[a1];

  return v2;
}

uint64_t __NMLogForCategory_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.nanomusic", "NanoMusicCore");
  v1 = (void *)NMLogForCategory_logObjects;
  NMLogForCategory_logObjects = (uint64_t)v0;

  os_log_t v2 = os_log_create("com.apple.nanomusic", "NanoMusicCore-Oversize");
  v3 = (void *)qword_26882C508;
  qword_26882C508 = (uint64_t)v2;

  os_log_t v4 = os_log_create("com.apple.nanomusic", "NanoMediaRemote");
  v5 = (void *)qword_26882C510;
  qword_26882C510 = (uint64_t)v4;

  os_log_t v6 = os_log_create("com.apple.nanomusic", "NanoMediaRemote-Oversize");
  v7 = (void *)qword_26882C518;
  qword_26882C518 = (uint64_t)v6;

  os_log_t v8 = os_log_create("com.apple.nanomusic", "NanoAudioControl");
  v9 = (void *)qword_26882C520;
  qword_26882C520 = (uint64_t)v8;

  os_log_t v10 = os_log_create("com.apple.nanomusic", "NanoMusicSync");
  v11 = (void *)qword_26882C528;
  qword_26882C528 = (uint64_t)v10;

  os_log_t v12 = os_log_create("com.apple.nanomusic", "NanoMusicSync-Oversize");
  v13 = (void *)qword_26882C530;
  qword_26882C530 = (uint64_t)v12;

  os_log_t v14 = os_log_create("com.apple.nanomusic", "NanoMediaUI");
  v15 = (void *)qword_26882C538;
  qword_26882C538 = (uint64_t)v14;

  os_log_t v16 = os_log_create("com.apple.nanomusic", "NanoMediaUI-Oversize");
  v17 = (void *)qword_26882C540;
  qword_26882C540 = (uint64_t)v16;

  os_log_t v18 = os_log_create("com.apple.nanomusic", "NanoMediaAPI");
  v19 = (void *)qword_26882C548;
  qword_26882C548 = (uint64_t)v18;

  os_log_t v20 = os_log_create("com.apple.nanomusic", "NanoMediaAPI-Oversize");
  v21 = (void *)qword_26882C550;
  qword_26882C550 = (uint64_t)v20;

  os_log_t v22 = os_log_create("com.apple.nanomusic", "NanoMediaTool");
  v23 = (void *)qword_26882C558;
  qword_26882C558 = (uint64_t)v22;

  os_log_t v24 = os_log_create("com.apple.nanomusic", "NanoMediaBridgeUI");
  v25 = (void *)qword_26882C568;
  qword_26882C568 = (uint64_t)v24;

  os_log_t v26 = os_log_create("com.apple.nanomusic", "NanoMediaBridgeUI-Oversize");
  v27 = (void *)qword_26882C570;
  qword_26882C570 = (uint64_t)v26;

  qword_26882C560 = (uint64_t)os_log_create("com.apple.nanomusic", "NanoMediaAppActivity");

  return MEMORY[0x270F9A758]();
}

id _NMCachedActivePairedDeviceValueForProperty(void *a1, void *a2)
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  v5 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  os_log_t v6 = [v5 firstObject];
  v7 = [v6 stringByAppendingPathComponent:@"activeDeviceProperties"];

  os_log_t v8 = [MEMORY[0x263F08850] defaultManager];
  LODWORD(v6) = [v8 fileExistsAtPath:v7];

  if (!v6)
  {
    v21 = [MEMORY[0x263F08850] defaultManager];
    os_log_t v22 = [v7 stringByDeletingLastPathComponent];
    v23 = [v22 stringByAppendingPathComponent:@"isAltAccount"];
    [v21 removeItemAtPath:v23 error:0];

    os_log_t v24 = [MEMORY[0x263F08850] defaultManager];
    v25 = [v7 stringByDeletingLastPathComponent];
    os_log_t v26 = [v25 stringByAppendingPathComponent:@"hasHomeButton"];
    [v24 removeItemAtPath:v26 error:0];

    v27 = 0;
    goto LABEL_16;
  }
  id v52 = 0;
  v9 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v7 options:0 error:&v52];
  id v10 = v52;
  if (v9)
  {
    v11 = (void *)MEMORY[0x263F08928];
    os_log_t v12 = (void *)MEMORY[0x263EFFA08];
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    v15 = objc_msgSend(v12, "setWithObjects:", v13, v14, objc_opt_class(), 0);
    id v51 = v10;
    id v16 = [v11 unarchivedObjectOfClasses:v15 fromData:v9 error:&v51];
    id v17 = v51;

    if (v16)
    {
      uint64_t v18 = [v16 objectForKeyedSubscript:v3];
      if (v18)
      {
        id v19 = (id)v18;
        os_log_t v20 = NMLogForCategory(2);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v54 = v3;
          __int16 v55 = 2112;
          id v56 = v19;
          _os_log_impl(&dword_2359CF000, v20, OS_LOG_TYPE_DEFAULT, "[DeviceInfoCaching] Found cached property: %@ value: %@", buf, 0x16u);
        }

        goto LABEL_38;
      }
      goto LABEL_15;
    }
    v28 = NMLogForCategory(2);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      _NMCachedActivePairedDeviceValueForProperty_cold_4();
    }
  }
  else
  {
    v28 = NMLogForCategory(2);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      _NMCachedActivePairedDeviceValueForProperty_cold_3();
    }
    id v17 = v10;
  }

  id v16 = 0;
LABEL_15:

  v27 = v16;
LABEL_16:
  v29 = [MEMORY[0x263F57730] sharedInstance];
  v30 = [MEMORY[0x263F57730] activePairedDeviceSelectorBlock];
  v31 = [v29 getAllDevicesWithArchivedAltAccountDevicesMatching:v30];
  id v17 = [v31 firstObject];

  if (v17)
  {
    uint64_t v32 = [v17 valueForProperty:v3];
    id v33 = (id)v32;
    if (v4 && !v32)
    {
      v34 = NMLogForCategory(2);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v54 = v3;
        __int16 v55 = 2112;
        id v56 = v4;
        _os_log_impl(&dword_2359CF000, v34, OS_LOG_TYPE_DEFAULT, "[DeviceInfoCaching] Using fallback default value for property: %@ value: %@", buf, 0x16u);
      }

      id v33 = v4;
    }
    v35 = (void *)[v27 mutableCopy];
    v36 = v35;
    id v47 = v4;
    if (v35)
    {
      v37 = v35;
    }
    else
    {
      v37 = [MEMORY[0x263EFF9A0] dictionary];
    }
    v9 = v37;

    id v38 = v3;
    [v9 setObject:v33 forKeyedSubscript:v3];
    id v16 = [v9 copy];

    id v50 = 0;
    v39 = [MEMORY[0x263F08910] archivedDataWithRootObject:v16 requiringSecureCoding:1 error:&v50];
    id v40 = v50;
    v41 = v40;
    v48 = v7;
    if (v39)
    {
      id v49 = v40;
      int v42 = [v39 writeToFile:v7 options:268435457 error:&v49];
      id v43 = v49;

      v44 = NMLogForCategory(2);
      v45 = v44;
      if (v42)
      {
        id v3 = v38;
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          id v54 = v38;
          __int16 v55 = 2112;
          id v56 = v33;
          __int16 v57 = 2112;
          id v58 = v48;
          _os_log_impl(&dword_2359CF000, v45, OS_LOG_TYPE_DEFAULT, "[DeviceInfoCaching] Successfully cached property: %@ value: %@ file path: %@", buf, 0x20u);
        }
      }
      else
      {
        id v3 = v38;
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          id v54 = v39;
          __int16 v55 = 2112;
          id v56 = v48;
          __int16 v57 = 2112;
          id v58 = v43;
          _os_log_error_impl(&dword_2359CF000, v45, OS_LOG_TYPE_ERROR, "[DeviceInfoCaching] Failed to write data: %@ file path: %@ error: %@", buf, 0x20u);
        }
      }
    }
    else
    {
      v45 = NMLogForCategory(2);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
        _NMCachedActivePairedDeviceValueForProperty_cold_2();
      }
      id v43 = v41;
      id v3 = v38;
    }
    id v4 = v47;

    id v19 = v33;
    v7 = v48;
  }
  else
  {
    v9 = NMLogForCategory(2);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      _NMCachedActivePairedDeviceValueForProperty_cold_1((uint64_t)v3, v9);
    }
    id v19 = 0;
    id v16 = v27;
  }
LABEL_38:

  return v19;
}

uint64_t NMDeviceIsTinker()
{
  if (NMDeviceIsTinker_onceToken != -1) {
    dispatch_once(&NMDeviceIsTinker_onceToken, &__block_literal_global_1);
  }
  return NMDeviceIsTinker_isAltAccount;
}

void __NMDeviceIsTinker_block_invoke()
{
  _NMCachedActivePairedDeviceValueForProperty((void *)*MEMORY[0x263F575B0], MEMORY[0x263EFFA80]);
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  NMDeviceIsTinker_isAltAccount = [v0 BOOLValue];
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void _NMCachedActivePairedDeviceValueForProperty_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2359CF000, a2, OS_LOG_TYPE_ERROR, "[DeviceInfoCaching] Failed to fetch %@ since we are missing an active device.", (uint8_t *)&v2, 0xCu);
}

void _NMCachedActivePairedDeviceValueForProperty_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2359CF000, v0, v1, "[DeviceInfoCaching] Failed to archive values: %@ error: %@");
}

void _NMCachedActivePairedDeviceValueForProperty_cold_3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2359CF000, v0, v1, "[DeviceInfoCaching] Failed to read data contents of file: %@ error: %@");
}

void _NMCachedActivePairedDeviceValueForProperty_cold_4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2359CF000, v0, v1, "[DeviceInfoCaching] Failed to unarchive data: %@ error: %@");
}

uint64_t MRMediaRemoteApplicationIsSystemBooksApplication()
{
  return MEMORY[0x270F49E48]();
}

uint64_t MRMediaRemoteApplicationIsSystemPodcastApplication()
{
  return MEMORY[0x270F49E58]();
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x270EF2BD8](directory, domainMask, expandTilde);
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
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

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}