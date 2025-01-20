@interface SAVolumeSizer
+ (BOOL)isInternalVolume:(id)a3;
+ (void)computeSizeOfVolumeAtURL:(id)a3 completionHandler:(id)a4;
+ (void)computeSizeOfVolumeAtURL:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
@end

@implementation SAVolumeSizer

+ (BOOL)isInternalVolume:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a3;
  io_iterator_t existing = 0;
  bzero(&v23, 0x878uLL);
  id v4 = v3;
  if (!statfs((const char *)[v4 fileSystemRepresentation], &v23))
  {
    v7 = objc_msgSend(NSString, "stringWithFormat:", @"%s", v23.f_mntfromname);
    v8 = [v7 componentsSeparatedByString:@"/dev/"];
    v9 = [v8 objectAtIndex:1];

    LODWORD(v8) = *MEMORY[0x263F0EC88];
    v6 = v9;
    CFDictionaryRef v10 = IOBSDNameMatching((mach_port_t)v8, 0, (const char *)[v6 UTF8String]);
    if (IOServiceGetMatchingServices((mach_port_t)v8, v10, &existing))
    {
      v11 = SALog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        +[SAVolumeSizer isInternalVolume:]();
      }

      goto LABEL_8;
    }
    io_registry_entry_t v14 = IOIteratorNext(existing);
    if (!v14)
    {
      v21 = SALog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        +[SAVolumeSizer isInternalVolume:]();
      }

      BOOL v12 = 0;
      goto LABEL_25;
    }
    io_object_t v15 = v14;
    CFDictionaryRef v16 = (const __CFDictionary *)IORegistryEntrySearchCFProperty(v14, "IOService", @"Protocol Characteristics", (CFAllocatorRef)*MEMORY[0x263EFFB08], 3u);
    if (v16 && (CFTypeID TypeID = CFDictionaryGetTypeID(), TypeID == CFGetTypeID(v16)))
    {
      CFStringRef Value = (const __CFString *)CFDictionaryGetValue(v16, @"Physical Interconnect Location");
      if (Value) {
        BOOL v19 = CFEqual(Value, @"Internal");
      }
      else {
        BOOL v19 = 0;
      }
    }
    else
    {
      v20 = SALog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        +[SAVolumeSizer isInternalVolume:]();
      }

      BOOL v19 = 0;
      BOOL v12 = 0;
      if (!v16) {
        goto LABEL_24;
      }
    }
    CFRelease(v16);
    BOOL v12 = v19;
LABEL_24:
    IOObjectRelease(v15);
LABEL_25:
    IOObjectRelease(existing);
    goto LABEL_9;
  }
  int v5 = *__error();
  v6 = SALog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    +[SAVolumeSizer isInternalVolume:v6];
  }
LABEL_8:
  BOOL v12 = 0;
LABEL_9:

  return v12;
}

+ (void)computeSizeOfVolumeAtURL:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  v68[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  v8 = (void (**)(id, uint64_t, uint64_t, uint64_t))a5;
  if (+[SAVolumeSizer isInternalVolume:v7])
  {
    uint64_t v63 = 0;
    v64 = &v63;
    uint64_t v65 = 0x2020000000;
    char v66 = 1;
    v9 = objc_opt_new();
    uint64_t v57 = 0;
    v58 = &v57;
    uint64_t v59 = 0x3032000000;
    v60 = __Block_byref_object_copy_;
    v61 = __Block_byref_object_dispose_;
    id v62 = 0;
    v54[0] = MEMORY[0x263EF8330];
    v54[1] = 3221225472;
    v54[2] = __68__SAVolumeSizer_computeSizeOfVolumeAtURL_options_completionHandler___block_invoke;
    v54[3] = &unk_26551E5D0;
    v56 = &v57;
    id v10 = v9;
    id v55 = v10;
    id v11 = +[SADaemonXPC newWithInvalidationHandler:v54];
    BOOL v12 = (void *)v58[5];
    v58[5] = (uint64_t)v11;

    v13 = (void *)v58[5];
    v51[0] = MEMORY[0x263EF8330];
    v51[1] = 3221225472;
    v51[2] = __68__SAVolumeSizer_computeSizeOfVolumeAtURL_options_completionHandler___block_invoke_59;
    v51[3] = &unk_26551E5D0;
    v53 = &v57;
    id v14 = v10;
    id v52 = v14;
    io_object_t v15 = [v13 remoteObjectProxyWithErrorHandler:v51];
    uint64_t v47 = 0;
    v48 = &v47;
    uint64_t v49 = 0x2020000000;
    uint64_t v50 = 0;
    uint64_t v43 = 0;
    v44 = &v43;
    uint64_t v45 = 0x2020000000;
    uint64_t v46 = 0;
    uint64_t v37 = 0;
    v38 = &v37;
    uint64_t v39 = 0x3032000000;
    v40 = __Block_byref_object_copy_;
    v41 = __Block_byref_object_dispose_;
    id v42 = 0;
    v36[0] = 0;
    v36[1] = v36;
    v36[2] = 0x2020000000;
    v36[3] = 0;
    [v14 enter];
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __68__SAVolumeSizer_computeSizeOfVolumeAtURL_options_completionHandler___block_invoke_60;
    v30[3] = &unk_26551E5F8;
    v32 = &v47;
    v33 = &v43;
    v34 = &v37;
    v35 = &v63;
    id v16 = v14;
    id v31 = v16;
    [v15 computeSizeOfVolumeAtURL:v7 options:a4 completionHandler:v30];
    objc_msgSend(v16, "wait:", dispatch_time(0, 60000000000));
    if ((a4 & 3) != 0)
    {
      *((unsigned char *)v64 + 24) = 1;
      [v16 enter];
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __68__SAVolumeSizer_computeSizeOfVolumeAtURL_options_completionHandler___block_invoke_2;
      v24[3] = &unk_26551E620;
      v26 = v36;
      v27 = &v47;
      v28 = &v37;
      v29 = &v63;
      id v17 = v16;
      id v25 = v17;
      [v15 getPurgeableInfo:v7 options:a4 reply:v24];
      objc_msgSend(v17, "wait:", dispatch_time(0, 60000000000));
    }
    if (*((unsigned char *)v64 + 24))
    {
      uint64_t v18 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:60 userInfo:0];
      BOOL v19 = (void *)v38[5];
      v38[5] = v18;
    }
    [(id)v58[5] invalidate];
    v8[2](v8, v48[3], v44[3], v38[5]);

    _Block_object_dispose(v36, 8);
    _Block_object_dispose(&v37, 8);

    _Block_object_dispose(&v43, 8);
    _Block_object_dispose(&v47, 8);

    _Block_object_dispose(&v57, 8);
    _Block_object_dispose(&v63, 8);
  }
  else
  {
    v20 = SALog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      +[SAVolumeSizer computeSizeOfVolumeAtURL:options:completionHandler:](v7);
    }

    v21 = (void *)MEMORY[0x263F087E8];
    uint64_t v67 = *MEMORY[0x263F08338];
    v68[0] = @"Non internal URL";
    v22 = [NSDictionary dictionaryWithObjects:v68 forKeys:&v67 count:1];
    statfs v23 = [v21 errorWithDomain:*MEMORY[0x263F08438] code:22 userInfo:v22];
    v8[2](v8, 0, 0, (uint64_t)v23);
  }
}

void __68__SAVolumeSizer_computeSizeOfVolumeAtURL_options_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = SALog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __68__SAVolumeSizer_computeSizeOfVolumeAtURL_options_completionHandler___block_invoke_cold_1(v3);
  }

  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) invalidate];
  [*(id *)(a1 + 32) leave];
}

void __68__SAVolumeSizer_computeSizeOfVolumeAtURL_options_completionHandler___block_invoke_59(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = SALog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __68__SAVolumeSizer_computeSizeOfVolumeAtURL_options_completionHandler___block_invoke_59_cold_1(v3);
  }

  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) invalidate];
  [*(id *)(a1 + 32) leave];
}

void __68__SAVolumeSizer_computeSizeOfVolumeAtURL_options_completionHandler___block_invoke_60(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v6 rawUsed];
  uint64_t v7 = [v6 capacity];

  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v7;
  uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
  v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
  id v10 = v5;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
  [*(id *)(a1 + 32) leave];
}

void __68__SAVolumeSizer_computeSizeOfVolumeAtURL_options_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a3;
  uint64_t v7 = v6;
  if (!a2 || v6)
  {
    id v16 = SALog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      __68__SAVolumeSizer_computeSizeOfVolumeAtURL_options_completionHandler___block_invoke_2_cold_3(v7);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = [a2 objectForKeyedSubscript:@"CACHE_DELETE_TOTAL_AVAILABLE"];
    v9 = SALog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __68__SAVolumeSizer_computeSizeOfVolumeAtURL_options_completionHandler___block_invoke_2_cold_2((uint64_t)v8, v9);
    }

    if ([v8 unsignedLongLongValue])
    {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v8 longLongValue];
      uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
      unint64_t v11 = *(void *)(v10 + 24);
      unint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      BOOL v13 = v11 >= v12;
      unint64_t v14 = v11 - v12;
      if (v13)
      {
        *(void *)(v10 + 24) = v14;
      }
      else
      {
        io_object_t v15 = SALog();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          __68__SAVolumeSizer_computeSizeOfVolumeAtURL_options_completionHandler___block_invoke_2_cold_1(a1 + 40, a1 + 48, v15);
        }
      }
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
  [*(id *)(a1 + 32) leave];
}

+ (void)computeSizeOfVolumeAtURL:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  if (!v5)
  {
    uint64_t v8 = SALog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[SAVolumeSizer computeSizeOfVolumeAtURL:completionHandler:](v8);
    }
    goto LABEL_8;
  }
  if (!v6)
  {
    uint64_t v8 = SALog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[SAVolumeSizer computeSizeOfVolumeAtURL:completionHandler:](v8);
    }
LABEL_8:

    goto LABEL_9;
  }
  +[SAVolumeSizer computeSizeOfVolumeAtURL:v5 options:1 completionHandler:v6];
LABEL_9:
}

+ (void)isInternalVolume:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_0(&dword_25E2BB000, v0, v1, "%s: Empty iterator, couldn't decide if device (%@) is internal or not", v2, v3, v4, v5, 2u);
}

+ (void)isInternalVolume:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_0(&dword_25E2BB000, v0, v1, "%s: No 'Protocol Characteristics' found, couldn't decide if device (%@) is internal or not", v2, v3, v4, v5, 2u);
}

+ (void)isInternalVolume:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_0(&dword_25E2BB000, v0, v1, "%s: Can't find BSD name (%@) on ioreg", v2, v3, v4, v5, 2u);
}

+ (void)isInternalVolume:(NSObject *)a3 .cold.4(void *a1, int a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v5 = 136315650;
  id v6 = "+[SAVolumeSizer isInternalVolume:]";
  __int16 v7 = 2080;
  uint64_t v8 = [a1 fileSystemRepresentation];
  __int16 v9 = 1024;
  int v10 = a2;
  _os_log_error_impl(&dword_25E2BB000, a3, OS_LOG_TYPE_ERROR, "%s: Can't get f_mntfromname field on volume of %s, statfs returned %d", (uint8_t *)&v5, 0x1Cu);
}

+ (void)computeSizeOfVolumeAtURL:(void *)a1 options:completionHandler:.cold.1(void *a1)
{
  uint64_t v1 = [a1 absoluteString];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_25E2BB000, v2, v3, "Can't compute size of volume, given volume URL (%@) isn't internal.", v4, v5, v6, v7, v8);
}

void __68__SAVolumeSizer_computeSizeOfVolumeAtURL_options_completionHandler___block_invoke_cold_1(void *a1)
{
  uint64_t v1 = [a1 description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_25E2BB000, v2, v3, "SADaemonXPC connection invalidated, purgeable size is set to 0: %@", v4, v5, v6, v7, v8);
}

void __68__SAVolumeSizer_computeSizeOfVolumeAtURL_options_completionHandler___block_invoke_59_cold_1(void *a1)
{
  uint64_t v1 = [a1 description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_25E2BB000, v2, v3, "Failed to get proxy object %@", v4, v5, v6, v7, v8);
}

void __68__SAVolumeSizer_computeSizeOfVolumeAtURL_options_completionHandler___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(*(void *)(*(void *)a1 + 8) + 24);
  uint64_t v4 = *(void *)(*(void *)(*(void *)a2 + 8) + 24);
  int v5 = 134218240;
  uint64_t v6 = v3;
  __int16 v7 = 2048;
  uint64_t v8 = v4;
  _os_log_error_impl(&dword_25E2BB000, log, OS_LOG_TYPE_ERROR, "Purgeable size %llu is larger than used size %llu, ignoring", (uint8_t *)&v5, 0x16u);
}

void __68__SAVolumeSizer_computeSizeOfVolumeAtURL_options_completionHandler___block_invoke_2_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v2 = 136315650;
  uint64_t v3 = "+[SAVolumeSizer computeSizeOfVolumeAtURL:options:completionHandler:]_block_invoke_2";
  __int16 v4 = 2112;
  int v5 = @"/private/var";
  __int16 v6 = 2112;
  uint64_t v7 = a1;
  _os_log_debug_impl(&dword_25E2BB000, a2, OS_LOG_TYPE_DEBUG, "%s: Volume %@, CACHE_DELETE_TOTAL_AVAILABLE %@", (uint8_t *)&v2, 0x20u);
}

void __68__SAVolumeSizer_computeSizeOfVolumeAtURL_options_completionHandler___block_invoke_2_cold_3(void *a1)
{
  uint64_t v1 = [a1 description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_25E2BB000, v2, v3, "Unable to get CACHE_DELETE_TOTAL_AVAILABLE, purgeable size is set to 0: %@", v4, v5, v6, v7, v8);
}

+ (void)computeSizeOfVolumeAtURL:(os_log_t)log completionHandler:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "+[SAVolumeSizer computeSizeOfVolumeAtURL:completionHandler:]";
  _os_log_error_impl(&dword_25E2BB000, log, OS_LOG_TYPE_ERROR, "%s: url is nil", (uint8_t *)&v1, 0xCu);
}

+ (void)computeSizeOfVolumeAtURL:(os_log_t)log completionHandler:.cold.2(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "+[SAVolumeSizer computeSizeOfVolumeAtURL:completionHandler:]";
  _os_log_error_impl(&dword_25E2BB000, log, OS_LOG_TYPE_ERROR, "%s: completionHandler is nil", (uint8_t *)&v1, 0xCu);
}

@end