DYGTMTLDeviceProfile *newProfileWithMTLDevice(void *a1)
{
  id v1;
  DYGTMTLDeviceProfile *v2;
  void *v3;
  void *v4;
  uint64_t i;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  size_t v10;
  char *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  uint64_t j;
  uint64_t v21;
  void *v22;
  id v23;
  DYGTMTLDeviceProfile *v25;
  uint64_t vars8;

  v1 = a1;
  v2 = objc_alloc_init(DYGTMTLDeviceProfile);
  v3 = [v1 name];
  [(DYGTMTLDeviceProfile *)v2 setName:v3];

  v4 = +[NSMutableArray arrayWithCapacity:17];
  for (i = 0; i != 17; ++i)
  {
    v6 = qword_10002B900[i];
    if ([v1 supportsFeatureSet:v6])
    {
      v7 = +[NSNumber numberWithUnsignedInteger:v6];
      [v4 addObject:v7];
    }
  }
  v8 = [v4 copy];
  v25 = v2;
  [(DYGTMTLDeviceProfile *)v2 setSupportedFeatureSets:v8];

  v9 = +[NSMutableDictionary dictionary];
  if ([v1 areProgrammableSamplePositionsSupported]
    && [v1 maxCustomSamplePositions])
  {
    v10 = 1;
    do
    {
      if ([v1 supportsTextureSampleCount:v10])
      {
        v11 = (char *)malloc_type_calloc(v10, 8uLL, 0x100004000313F17uLL);
        [v1 getDefaultSamplePositions:v11 count:v10];
        v12 = objc_alloc_init((Class)NSMutableArray);
        v13 = 0;
        do
        {
          v14 = +[NSValue valueWithPoint:vcvtq_f64_f32(*(float32x2_t *)&v11[8 * v13])];
          [v12 addObject:v14];

          ++v13;
        }
        while (v10 != v13);
        free(v11);
        v15 = +[NSArray arrayWithArray:v12];
        v16 = +[NSNumber numberWithInt:v10];
        [v9 setObject:v15 forKey:v16];
      }
    }
    while ((unint64_t)[v1 maxCustomSamplePositions] > v10++);
  }
  v18 = +[NSDictionary dictionaryWithDictionary:v9];
  [(DYGTMTLDeviceProfile *)v25 setDefaultSamplePositions:v18];

  if (objc_opt_respondsToSelector())
  {
    v19 = +[NSMutableArray arrayWithCapacity:12];
    for (j = 0; j != 12; ++j)
    {
      v21 = qword_10002B988[j];
      if ([v1 supportsFamily:v21])
      {
        v22 = +[NSNumber numberWithInteger:v21];
        [v19 addObject:v22];
      }
    }
    v23 = [v19 copy];
    [(DYGTMTLDeviceProfile *)v25 setSupportedGPUFamilies:v23];
  }

  return v25;
}

id DaemonDeviceCapabilities(void *a1)
{
  id v1 = a1;
  id v2 = MTLCreateSystemDefaultDevice();
  v3 = newProfileWithMTLDevice(v2);

  v4 = [v1 stringByAppendingPathComponent:@"/System/Library/Frameworks/Metal.framework"];

  v5 = +[NSBundle bundleWithPath:v4];

  if (v5)
  {
    v6 = [v5 objectForInfoDictionaryKey:kCFBundleVersionKey];
  }
  else
  {
    v6 = &stru_100035040;
  }

  *(_OWORD *)values = *(_OWORD *)off_100034858;
  long long v16 = *(_OWORD *)off_100034868;
  CFStringRef v17 = @"main-screen-scale";
  CFArrayRef v7 = CFArrayCreate(0, (const void **)values, 5, &kCFTypeArrayCallBacks);
  v8 = (void *)MGCopyMultipleAnswers();
  CFRelease(v7);
  v12 = v3;
  v13[0] = @"gputools.contexts-info";
  v9 = +[NSArray arrayWithObjects:&v12 count:1];
  v14[0] = v9;
  v14[1] = v8;
  v13[1] = @"screen-dimensions";
  v13[2] = @"metal_version";
  v13[3] = @"nativePointerSize";
  v14[2] = v6;
  v14[3] = &off_100037500;
  v10 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:4];

  return v10;
}

_UNKNOWN **GPUToolsVersionQuery()
{
  return &off_100037578;
}

id modifyReplayerEnvironment(void *a1)
{
  id v1 = [a1 mutableCopy];
  [v1 removeObjectsForKeys:&off_1000375A0];
  [v1 removeObjectForKey:@"METAL_DEVICE_WRAPPER_TYPE"];
  id v2 = +[NSUserDefaults standardUserDefaults];
  v3 = [v2 dictionaryForKey:@"GPUDebugger.ReplayerEnvironment"];

  if (v3) {
    [v1 addEntriesFromDictionary:v3];
  }
  id v4 = [v1 copy];

  return v4;
}

id DaemonCreateGuestAppTransport(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  if (!v1) {
    goto LABEL_29;
  }
  v3 = [v1 objectForKeyedSubscript:@"environment"];
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_28:

LABEL_29:
      long long v16 = 0;
      goto LABEL_30;
    }
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v4 = v3;
    id v5 = [v4 countByEnumeratingWithState:&v44 objects:v48 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v45;
LABEL_6:
      uint64_t v8 = 0;
      while (1)
      {
        if (*(void *)v45 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v44 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_27;
        }
        v10 = [v4 objectForKeyedSubscript:v9];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0) {
          goto LABEL_27;
        }
        if (v6 == (id)++v8)
        {
          id v6 = [v4 countByEnumeratingWithState:&v44 objects:v48 count:16];
          if (v6) {
            goto LABEL_6;
          }
          break;
        }
      }
    }
  }
  id v4 = [v2 objectForKeyedSubscript:@"platformPrefix"];
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_27:

      goto LABEL_28;
    }
  }
  v12 = [v2 objectForKeyedSubscript:@"shouldLoadCapture"];
  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_26:

      goto LABEL_27;
    }
  }
  v13 = [v2 objectForKeyedSubscript:@"shouldLoadReplayer"];
  if (v13)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_25:

      goto LABEL_26;
    }
  }
  v14 = [v2 objectForKeyedSubscript:@"shouldLoadDiagnostics"];
  if (v14)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      goto LABEL_25;
    }
  }

  v15 = [v2 objectForKeyedSubscript:@"environment"];
  long long v16 = v15;
  if (v15) {
    id v17 = [v15 mutableCopy];
  }
  else {
    id v17 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:2];
  }
  v19 = v17;
  v20 = [v16 objectForKeyedSubscript:@"DYLD_INSERT_LIBRARIES"];
  v21 = [v20 componentsSeparatedByString:@":"];
  v22 = v21;
  if (v21) {
    id v23 = [v21 mutableCopy];
  }
  else {
    id v23 = [objc_alloc((Class)NSMutableArray) initWithCapacity:2];
  }
  v24 = v23;
  v25 = [v2 objectForKeyedSubscript:@"platformPrefix"];
  v26 = [v16 objectForKeyedSubscript:@"GPUTOOLS_EXTRA_PLUGIN_PATHS"];
  uint64_t v27 = [v2 objectForKeyedSubscript:@"shouldLoadReplayer"];
  if (!v27) {
    goto LABEL_39;
  }
  v28 = (void *)v27;
  [v2 objectForKeyedSubscript:@"shouldLoadCapture"];
  v43 = v24;
  v29 = v22;
  v30 = v19;
  v31 = v20;
  v32 = v26;
  v34 = v33 = v25;
  unsigned int v35 = [v34 BOOLValue];

  v25 = v33;
  v26 = v32;
  v20 = v31;
  v19 = v30;
  v22 = v29;
  v24 = v43;

  if (v35)
  {
LABEL_39:
    v36 = [@"/System/Library/PrivateFrameworks/" stringByAppendingPathComponent:@"GPUToolsCapture.framework/GPUToolsCapture"];
    if (([v24 containsObject:v36] & 1) == 0) {
      [v24 addObject:v36];
    }
    [v19 setObject:v36 forKeyedSubscript:@"DYMTL_TOOLS_DYLIB_PATH"];
  }
  v37 = [v2 objectForKeyedSubscript:@"shouldLoadDiagnostics"];
  unsigned int v38 = [v37 BOOLValue];

  if (v38)
  {
    v39 = [@"/System/Library/PrivateFrameworks/" stringByAppendingPathComponent:@"GPUToolsDiagnostics.framework/GPUToolsDiagnostics"];
    if (([v24 containsObject:v39] & 1) == 0) {
      [v24 addObject:v39];
    }
  }
  id v40 = [v22 count];
  if (v40 != [v24 count])
  {
    v41 = [v24 componentsJoinedByString:@":"];
    [v19 setObject:v41 forKeyedSubscript:@"DYLD_INSERT_LIBRARIES"];

    id v42 = [v19 copy];
    long long v16 = v42;
  }

LABEL_30:

  return v16;
}

__CFString *GTTransportArchiveDirectory()
{
  v0 = +[NSProcessInfo processInfo];
  unsigned __int8 v1 = [v0 isiOSAppOnMac];

  if (v1)
  {
    id v2 = @"/tmp/com.apple.GPUToolsAgent";
  }
  else
  {
    v3 = +[NSString stringWithUTF8String:getpwnam("mobile")->pw_dir];
    id v2 = [v3 stringByAppendingPathComponent:@"Library/GPUTools"];
  }

  return v2;
}

void sub_100005178(os_log_t log)
{
  *(_WORD *)unsigned __int8 v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Malformed message: missing selector", v1, 2u);
}

uint64_t GTTransportEnvironment_init()
{
  GT_TRANSPORT_ENV = sub_100005224("MTLTRANSPORT_REPLAY_MAX_RECORD_REQUEST", 64);
  qword_100041CF0 = qword_100041CF0 & 0xFFFFFFFFFFFFFFFELL | sub_100005224("MTLTRANSPORT_REPLAY_RECORD_REQUEST", 1) & 1;
  uint64_t result = sub_100005224("MTLTRANSPORT_LAUNCH_TIMEOUT", 30);
  qword_100041CE8 = result;
  return result;
}

uint64_t sub_100005224(const char *a1, uint64_t a2)
{
  v3 = getenv(a1);
  if (!v3) {
    return a2;
  }

  return strtol(v3, 0, 0);
}

void DeleteAllArchives(void *a1)
{
  id v1 = a1;
  id v2 = objc_alloc_init((Class)NSMutableArray);
  v22 = v1;
  uint64_t v3 = +[NSURL fileURLWithPath:v1];
  id v4 = +[NSFileManager defaultManager];
  v21 = (void *)v3;
  id v5 = [v4 enumeratorAtURL:v3 includingPropertiesForKeys:&__NSArray0__struct options:0 errorHandler:0];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v28;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        v12 = [v11 pathExtension];
        id v13 = [v12 caseInsensitiveCompare:@"gputrace"];

        if (!v13) {
          [v2 addObject:v11];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v8);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v14 = v2;
  id v15 = [v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v24;
    do
    {
      for (j = 0; j != v16; j = (char *)j + 1)
      {
        if (*(void *)v24 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v23 + 1) + 8 * (void)j);
        v20 = +[NSFileManager defaultManager];
        [v20 removeItemAtURL:v19 error:0];
      }
      id v16 = [v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v16);
  }
}

void sub_100009BB4(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3) {
    [*(id *)(a1[4] + 16) setObject:v3 forKeyedSubscript:a1[5]];
  }
  (*(void (**)(void))(a1[6] + 16))();
}

void sub_100009C24(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = [v5 scheme];
    unsigned int v8 = [v7 isEqualToString:@"gtsandboxid"];

    if (v8) {
      [*(id *)(a1[4] + 16) objectForKeyedSubscript:v5];
    }
    else {
    v10 = sub_100009D2C(v5);
    }
    [*(id *)(a1[4] + 16) setObject:v10 forKeyedSubscript:a1[5]];
    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    uint64_t v9 = *(NSObject **)(a1[4] + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100011684(v9, v6);
    }
    (*(void (**)(void))(a1[6] + 16))();
  }
}

id sub_100009D2C(void *a1)
{
  id v1 = a1;
  id v2 = objc_alloc((Class)NSURL);
  id v3 = GTTransportArchiveDirectory();
  id v4 = [v2 initFileURLWithPath:v3 isDirectory:1];

  id v5 = [v4 path];
  id v6 = [v1 path];

  id v7 = [v5 stringByAppendingPathComponent:v6];
  unsigned int v8 = +[NSURL fileURLWithPath:v7 isDirectory:1];

  return v8;
}

void sub_100009E10(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    id v5 = sub_100009D2C(v3);
    [*(id *)(a1[4] + 16) setObject:v5 forKeyedSubscript:a1[5]];
    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    id v6 = *(NSObject **)(a1[4] + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100011728(v6, v7, v8, v9, v10, v11, v12, v13);
    }
    (*(void (**)(void))(a1[6] + 16))();
  }
}

uint64_t sub_10000A074(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_10000A84C(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = allServicesForDeviceUDID(a1, a2);
  uint64_t v7 = filteredArrayByService(v6, (Protocol *)&OBJC_PROTOCOL___GTFileWriterService);
  if ([v7 count] == (id)1)
  {
    uint64_t v8 = [v7 firstObject];
  }
  else
  {
    uint64_t v9 = filteredArrayByPID(v7, (int)[v5 currentRemoteRelayPid]);
    uint64_t v8 = [v9 firstObject];
  }

  return v8;
}

uint64_t sub_10000A91C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10000A92C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), a2);
}

void sub_10000AD10(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  if (xdict)
  {
    uint64_t v3 = objc_opt_class();
    nsobject = xpc_dictionary_get_nsobject(xdict, "url", v3);
    id v5 = nsobject;
    if (nsobject
      && ([nsobject path],
          id v6 = objc_claimAutoreleasedReturnValue(),
          id v7 = [v6 length],
          v6,
          v7))
    {
      string = xpc_dictionary_get_string(xdict, "sandboxExtension");
      if (string)
      {
        uint64_t v9 = +[NSData dataWithBytes:string length:strlen(string) + 1];
        _CFURLAttachSecurityScopeToFileURL();
      }
      uint64_t v10 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    }
    else
    {
      uint64_t v10 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    }
    v10();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_10000B0E0(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (v5)
  {
    uint64_t v3 = objc_opt_class();
    nsobject = xpc_dictionary_get_nsobject(v5, "url", v3);
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_10000B2B4(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (v6)
  {
    uint64_t v3 = objc_opt_class();
    nsobject = xpc_dictionary_get_nsobject(v6, "url", v3);
    nserror = (void *)xpc_dictionary_get_nserror(v6, "error");
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_10000B710(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    unsigned int v5 = [v3 startAccessingSecurityScopedResource];
    xpc_dictionary_set_nsobject(*(void **)(a1 + 40), "url", (uint64_t)v4);
    id v6 = v4;
    [v6 fileSystemRepresentation];
    long long v9 = *(_OWORD *)(a1 + 48);
    long long v10 = *(_OWORD *)(a1 + 64);
    id v7 = (const char *)sandbox_extension_issue_file_to_process();
    if (v7)
    {
      uint64_t v8 = (char *)v7;
      xpc_dictionary_set_string(*(xpc_object_t *)(a1 + 40), "sandboxExtension", v7);
      free(v8);
    }
    if (v5) {
      [v6 stopAccessingSecurityScopedResource:v9 withError:v10];
    }
  }
  [*(id *)(a1 + 32) sendMessage:v9, v10];
}

id sub_10000BAC8(uint64_t a1, uint64_t a2)
{
  xpc_dictionary_set_nsobject(*(void **)(a1 + 32), "url", a2);
  uint64_t v4 = *(void *)(a1 + 32);
  id v3 = *(void **)(a1 + 40);

  return [v3 sendMessage:v4];
}

id sub_10000BD48(uint64_t a1, uint64_t a2, void *a3)
{
  unsigned int v5 = *(void **)(a1 + 32);
  id v6 = a3;
  xpc_dictionary_set_nsobject(v5, "url", a2);
  xpc_dictionary_set_nserror(*(void *)(a1 + 32), "error", v6);

  uint64_t v8 = *(void *)(a1 + 32);
  id v7 = *(void **)(a1 + 40);

  return [v7 sendMessage:v8];
}

uint64_t sub_10000CFFC(compression_stream *a1, const uint8_t *a2, size_t a3, uint8_t *a4, size_t a5, uint64_t a6, void *a7)
{
  uint64_t v13 = a7;
  a1->src_ptr = a2;
  a1->src_size = a3;
  if (a3)
  {
    while (compression_stream_process(a1, 0) != COMPRESSION_STATUS_ERROR)
    {
      if (!a1->dst_size)
      {
        if (!v13[2](v13, a4, a5, a6)) {
          goto LABEL_10;
        }
        a1->dst_ptr = a4;
        a1->dst_size = a5;
      }
      if (!a1->src_size) {
        goto LABEL_7;
      }
    }
    if (!a6) {
      goto LABEL_11;
    }
    id v14 = +[NSString stringWithFormat:@"Compression failed: %@", @"Failed to process compression stream", NSLocalizedDescriptionKey];
    v18 = v14;
    id v15 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    *(void *)a6 = +[NSError errorWithDomain:@"com.apple.gputools.filestreamer" code:0 userInfo:v15];

LABEL_10:
    a6 = 0;
  }
  else
  {
LABEL_7:
    a6 = 1;
  }
LABEL_11:

  return a6;
}

id sub_10000D178(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(*(void *)(a1 + 32) + 64) _writeUncompressedFileData:a2 length:a3 error:a4];
}

uint64_t sub_10000D2A8(compression_stream *a1, uint8_t *a2, size_t a3, uint64_t a4, void *a5)
{
  long long v9 = a5;
  compression_status v10 = compression_stream_process(a1, 1);
  if (v10 == COMPRESSION_STATUS_OK)
  {
    while (v9[2](v9, a2, a3, a4))
    {
      a1->dst_ptr = a2;
      a1->dst_size = a3;
      compression_status v10 = compression_stream_process(a1, 1);
      if (v10) {
        goto LABEL_4;
      }
    }
    goto LABEL_9;
  }
LABEL_4:
  if (v10 == COMPRESSION_STATUS_ERROR)
  {
    if (a4)
    {
      uint64_t v11 = +[NSString stringWithFormat:@"Compression failed: %@", @"Failed to finalize compression stream", NSLocalizedDescriptionKey];
      id v15 = v11;
      uint64_t v12 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
      *(void *)a4 = +[NSError errorWithDomain:@"com.apple.gputools.filestreamer" code:0 userInfo:v12];

LABEL_9:
      a4 = 0;
    }
  }
  else
  {
    if (!v9[2](v9, a2, a3 - a1->dst_size, a4)) {
      goto LABEL_9;
    }
    a1->dst_ptr = a2;
    a1->dst_size = a3;
    a4 = 1;
  }

  return a4;
}

id sub_10000D438(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(*(void *)(a1 + 32) + 64) _writeUncompressedFileData:a2 length:a3 error:a4];
}

uint64_t GTFileWriterTransferFileEntries(void *a1, void *a2, void *a3, NSString **a4, void *a5)
{
  id v8 = a1;
  id v9 = a2;
  id v10 = a3;
  id v11 = a5;
  v89 = (uint8_t *)malloc_type_malloc((size_t)[v10 chunkSize], 0x73AD97B3uLL);
  id v76 = v9;
  id v77 = v8;
  id v75 = v10;
  v73 = v11;
  if ([v10 compressionAlgorithm])
  {
    id v12 = v8;
    id v85 = v9;
    id v13 = v10;
    id v83 = v11;
    id v74 = v12;
    if ([v12 count])
    {
      memset(&stream, 0, sizeof(stream));
      unint64_t v14 = (unint64_t)[v13 compressionAlgorithm] - 1;
      if (v14 > 4) {
        compression_algorithm v15 = 0;
      }
      else {
        compression_algorithm v15 = dword_10002BA40[v14];
      }
      v91 = v13;
      if (compression_stream_init(&stream, COMPRESSION_STREAM_ENCODE, v15) == COMPRESSION_STATUS_OK)
      {
        contexta = (uint8_t *)malloc_type_malloc((size_t)[v13 chunkSize], 0xB778C515uLL);
        stream.src_size = 0;
        stream.dst_ptr = v89;
        stream.dst_size = (size_t)[v13 chunkSize];
        long long v98 = 0u;
        long long v99 = 0u;
        long long v100 = 0u;
        long long v101 = 0u;
        id v72 = v12;
        id v82 = [v72 countByEnumeratingWithState:&v98 objects:v97 count:16];
        if (v82)
        {
          uint64_t v80 = *(void *)v99;
          while (2)
          {
            long long v44 = 0;
            do
            {
              if (*(void *)v99 != v80) {
                objc_enumerationMutation(v72);
              }
              long long v45 = *(void **)(*((void *)&v98 + 1) + 8 * (void)v44);
              id v47 = objc_alloc((Class)NSURL);
              v48 = [v45 path];
              id v49 = [v47 initFileURLWithPath:v48 isDirectory:0 relativeToURL:v85];

              id v50 = v49;
              int v51 = open((const char *)[v50 fileSystemRepresentation], 0);
              if (v51 < 0)
              {
                uint64_t v67 = *__error();
                CFStringRef v95 = (const __CFString *)NSLocalizedDescriptionKey;
                CFStringRef v96 = @"Failed to open file for reading";
                v68 = +[NSDictionary dictionaryWithObjects:&v96 forKeys:&v95 count:1];
                id v42 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v67 userInfo:v68];

                id v9 = v76;
                id v8 = v77;
                id v10 = v75;
                if (!v42) {
                  goto LABEL_77;
                }
                goto LABEL_79;
              }
              int v52 = v51;
              v53 = 0;
              unint64_t v54 = 0;
              while (2)
              {
                if (v54 >= (unint64_t)[v45 fileSize])
                {
                  id v42 = v53;
                }
                else
                {
                  size_t v55 = (size_t)[v45 fileSize] - v54;
                  if (v55 >= (unint64_t)[v91 chunkSize]) {
                    size_t v55 = (size_t)[v91 chunkSize];
                  }
                  v56 = contexta;
                  v57 = &contexta[v55];
                  while (v56 < v57)
                  {
                    ssize_t v58 = read(v52, v56, v57 - v56);
                    v56 += v58;
                    if (v58 < 0) {
                      goto LABEL_57;
                    }
                  }
                  if ((v55 & 0x8000000000000000) != 0)
                  {
LABEL_57:
                    uint64_t v61 = *__error();
                    NSErrorUserInfoKey v93 = NSLocalizedDescriptionKey;
                    CFStringRef v94 = @"Failed to read from file";
                    v62 = +[NSDictionary dictionaryWithObjects:&v94 forKeys:&v93 count:1];
                    id v42 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v61 userInfo:v62];

                    break;
                  }
                  v54 += v55;
                  id v59 = [v91 chunkSize];
                  id v92 = v53;
                  char v60 = sub_10000CFFC(&stream, contexta, v55, v89, (size_t)v59, (uint64_t)&v92, v83);
                  id v42 = v92;

                  v53 = v42;
                  if (v60) {
                    continue;
                  }
                }
                break;
              }
              close(v52);

              if (v42)
              {

                id v9 = v76;
                id v8 = v77;
                id v10 = v75;
LABEL_79:
                if (a4)
                {
                  id v42 = v42;
                  uint64_t v41 = 0;
                  *a4 = (NSString *)v42;
                }
                else
                {
                  uint64_t v41 = 0;
                }
                goto LABEL_82;
              }
              long long v44 = (char *)v44 + 1;
              id v9 = v76;
              id v8 = v77;
              id v10 = v75;
            }
            while (v44 != v82);
            id v63 = [v72 countByEnumeratingWithState:&v98 objects:v97 count:16];
            id v82 = v63;
            if (v63) {
              continue;
            }
            break;
          }
        }

LABEL_77:
        uint64_t v41 = sub_10000D2A8(&stream, v89, (size_t)[v91 chunkSize], (uint64_t)a4, v83);
        id v42 = 0;
LABEL_82:
        free(contexta);
        compression_stream_destroy(&stream);
        goto LABEL_83;
      }
      if (a4)
      {
        *(void *)&long long v98 = NSLocalizedDescriptionKey;
        id v42 = +[NSString stringWithFormat:@"Compression failed: %@", @"Failed to initialize compression stream"];
        v97[0] = v42;
        v43 = +[NSDictionary dictionaryWithObjects:v97 forKeys:&v98 count:1];
        *a4 = +[NSError errorWithDomain:@"com.apple.gputools.filestreamer" code:0 userInfo:v43];

        uint64_t v41 = 0;
LABEL_83:

        id v13 = v91;
        goto LABEL_84;
      }
      uint64_t v41 = 0;
    }
    else
    {
      uint64_t v41 = 1;
    }
LABEL_84:

    v66 = v74;
    goto LABEL_85;
  }
  id v16 = v11;
  id v17 = v8;
  id v84 = v9;
  id v86 = v10;
  v18 = v16;
  long long v98 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  id obj = v17;
  v71 = v18;
  id v81 = [obj countByEnumeratingWithState:&v98 objects:v97 count:16];
  if (v81)
  {
    uint64_t v90 = 0;
    uint64_t v79 = *(void *)v99;
LABEL_7:
    uint64_t v19 = 0;
    while (1)
    {
      if (*(void *)v99 != v79) {
        objc_enumerationMutation(obj);
      }
      v20 = *(void **)(*((void *)&v98 + 1) + 8 * v19);
      id v22 = objc_alloc((Class)NSURL);
      long long v23 = [v20 path];
      id v24 = [v22 initFileURLWithPath:v23 isDirectory:0 relativeToURL:v84];

      id v25 = v24;
      int v26 = open((const char *)[v25 fileSystemRepresentation], 0);
      if (v26 < 0)
      {
        uint64_t v64 = *__error();
        CFStringRef v96 = (const __CFString *)NSLocalizedDescriptionKey;
        stream.dst_ptr = (uint8_t *)@"Failed to open file for reading";
        v65 = +[NSDictionary dictionaryWithObjects:&stream forKeys:&v96 count:1];
        v37 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v64 userInfo:v65];

        id v9 = v76;
        id v8 = v77;
        id v10 = v75;
        if (!v37) {
          goto LABEL_67;
        }
        goto LABEL_70;
      }
      int v27 = v26;
      context = v21;
      if (![v20 fileSize])
      {
        v37 = 0;
        goto LABEL_29;
      }
      long long v28 = 0;
      unint64_t v29 = 0;
      while (2)
      {
        long long v30 = (char *)[v20 fileSize] - v29;
        v31 = (char *)[v86 chunkSize];
        if (v30 >= &v31[-v90]) {
          unint64_t v32 = (unint64_t)&v31[-v90];
        }
        else {
          unint64_t v32 = (unint64_t)v30;
        }
        v33 = &v89[v90];
        v34 = &v89[v90 + v32];
        while (v33 < v34)
        {
          ssize_t v35 = read(v27, v33, v34 - v33);
          v33 += v35;
          if (v35 < 0) {
            goto LABEL_27;
          }
        }
        if ((v32 & 0x8000000000000000) != 0)
        {
LABEL_27:
          uint64_t v38 = *__error();
          CFStringRef v94 = (const __CFString *)NSLocalizedDescriptionKey;
          CFStringRef v95 = @"Failed to read from file";
          v39 = +[NSDictionary dictionaryWithObjects:&v95 forKeys:&v94 count:1];
          v37 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v38 userInfo:v39];

          break;
        }
        if ((id)(v32 + v90) == [v86 chunkSize])
        {
          NSErrorUserInfoKey v93 = v28;
          int v36 = v71[2](v71, v89, v32 + v90, &v93);
          v37 = v93;

          if (!v36)
          {
            v90 += v32;
            break;
          }
          uint64_t v90 = 0;
          long long v28 = v37;
        }
        else
        {
          v90 += v32;
          v37 = v28;
        }
        v29 += v32;
        if (v29 < (unint64_t)[v20 fileSize]) {
          continue;
        }
        break;
      }
LABEL_29:
      close(v27);

      if (v37)
      {

        id v9 = v76;
        id v8 = v77;
        id v10 = v75;
LABEL_70:
        if (a4)
        {
          v37 = v37;
          uint64_t v41 = 0;
          *a4 = v37;
        }
        else
        {
          uint64_t v41 = 0;
        }
        goto LABEL_75;
      }
      if ((id)++v19 == v81)
      {
        id v40 = [obj countByEnumeratingWithState:&v98 objects:v97 count:16];
        id v9 = v76;
        id v8 = v77;
        id v10 = v75;
        id v81 = v40;
        if (v40) {
          goto LABEL_7;
        }
        goto LABEL_65;
      }
    }
  }
  uint64_t v90 = 0;
LABEL_65:

LABEL_67:
  if (v90)
  {
    uint64_t v41 = v71[2](v71, v89, v90, a4);
    v37 = 0;
  }
  else
  {
    v37 = 0;
    uint64_t v41 = 1;
  }
LABEL_75:

  v66 = obj;
LABEL_85:

  free(v89);
  return v41;
}

void sub_10000E7B0(void *a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = *(void (**)(void))(a1[6] + 16);
    v3();
  }
  else
  {
    id v4 = [*(id *)(a1[4] + 56) makeURL:a1[5]];
    (*(void (**)(void))(a1[6] + 16))();
  }
}

BOOL sub_10000EDAC(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  BOOL v3 = v1 && [v1 chunkSize] && (unint64_t)[v2 compressionAlgorithm] < 6;

  return v3;
}

void sub_10000EE00(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = a1[6];
  unsigned int v5 = (void *)a1[4];
  id v17 = 0;
  unsigned __int8 v6 = [v5 _finishSession:v4 error:&v17];
  id v7 = v17;
  id v8 = *(NSObject **)(a1[4] + 8);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v9) {
      sub_1000119F4((uint64_t)(a1 + 6), v8, v3);
    }
    id v16 = *(void (**)(void))(a1[5] + 16);
  }
  else if (v6)
  {
    if (v9) {
      sub_100011984((uint64_t)(a1 + 6), v8, v10, v11, v12, v13, v14, v15);
    }
    id v16 = *(void (**)(void))(a1[5] + 16);
  }
  else
  {
    if (v9) {
      sub_1000119F4((uint64_t)(a1 + 6), v8, v7);
    }
    id v16 = *(void (**)(void))(a1[5] + 16);
  }
  v16();
}

void sub_10000F3E8(uint64_t a1)
{
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  int v26 = sub_10000F690;
  int v27 = sub_10000F6A0;
  id v28 = 0;
  id v2 = *(void **)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  id v22 = 0;
  uint64_t v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  id v16 = sub_10000F6A8;
  id v17 = &unk_100034A98;
  uint64_t v4 = *(void **)(a1 + 48);
  unsigned int v5 = *(void **)(a1 + 64);
  uint64_t v18 = *(void *)(a1 + 56);
  id v6 = v5;
  uint64_t v7 = *(void *)(a1 + 88);
  v20 = &v23;
  uint64_t v21 = v7;
  id v19 = v6;
  LOBYTE(v3) = GTFileWriterTransferFileEntries(v2, v3, v4, &v22, &v14);
  id v8 = v22;
  if ((v3 & 1) == 0) {
    goto LABEL_4;
  }
  dispatch_time_t v9 = dispatch_time(0xFFFFFFFFFFFFFFFELL, 2000000000);
  if (!dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 56) + 64), v9))
  {
    if (!v24[5])
    {
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 56) + 64));
      [*(id *)(a1 + 72) stopAccessingSecurityScopedResource];
      uint64_t v13 = *(void (**)(void))(*(void *)(a1 + 80) + 16);
      goto LABEL_5;
    }
LABEL_4:
    [*(id *)(a1 + 72) stopAccessingSecurityScopedResource];
    uint64_t v13 = *(void (**)(void))(*(void *)(a1 + 80) + 16);
LABEL_5:
    v13();
    goto LABEL_6;
  }
  NSErrorUserInfoKey v29 = NSLocalizedDescriptionKey;
  uint64_t v10 = +[NSString stringWithFormat:@"%@ hit a timeout: %@", @"GTFileWriterService", @"beginTransferSessionWithFileEntires timed out waiting for final write to complete", v14, v15, v16, v17, v18];
  long long v30 = v10;
  uint64_t v11 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
  uint64_t v12 = +[NSError errorWithDomain:@"com.apple.gputools.transport" code:6 userInfo:v11];

  [*(id *)(a1 + 72) stopAccessingSecurityScopedResource];
  (*(void (**)(void))(*(void *)(a1 + 80) + 16))();

LABEL_6:
  _Block_object_dispose(&v23, 8);
}

uint64_t sub_10000F690(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000F6A0(uint64_t a1)
{
}

BOOL sub_10000F6A8(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = +[NSData dataWithBytesNoCopy:a2 length:a3 freeWhenDone:0];
  dispatch_time_t v7 = dispatch_time(0xFFFFFFFFFFFFFFFELL, 2000000000);
  intptr_t v8 = dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1[4] + 64), v7);
  if (v8)
  {
    if (a4)
    {
      NSErrorUserInfoKey v17 = NSLocalizedDescriptionKey;
      dispatch_time_t v9 = +[NSString stringWithFormat:@"%@ hit a timeout: %@", @"GTFileWriterService", @"beginTransferSessionWithFileEntires timed out waiting for transfer to complete"];
      uint64_t v18 = v9;
      uint64_t v10 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
      *a4 = +[NSError errorWithDomain:@"com.apple.gputools.transport" code:6 userInfo:v10];
    }
  }
  else
  {
    uint64_t v12 = a1[7];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10000F888;
    v16[3] = &unk_100034A70;
    uint64_t v13 = (void *)a1[5];
    uint64_t v14 = a1[6];
    v16[4] = a1[4];
    v16[5] = v14;
    [v13 writeFileData:v6 sessionID:v12 completionHandler:v16];
  }

  return v8 == 0;
}

void sub_10000F888(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void *)(v4 + 40);
  unsigned int v5 = (id *)(v4 + 40);
  if (!v6) {
    objc_storeStrong(v5, a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 64));
}

void sub_10000FE1C(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  if (a2)
  {
    uint64_t nserror = xpc_dictionary_get_nserror(a2, "error");

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    uint64_t v6 = (void *)nserror;
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    uint64_t v6 = v7;
  }
}

void sub_100010054(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (v6)
  {
    uint64_t v3 = objc_opt_class();
    nsobject = xpc_dictionary_get_nsobject(v6, "url", v3);
    uint64_t nserror = (void *)xpc_dictionary_get_nserror(v6, "error");
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_1000102D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a2)
  {
    id nserror = (id)xpc_dictionary_get_nserror(a2, "error");
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, nserror);
  }
  else
  {
    uint64_t v4 = *(void (**)(uint64_t, uint64_t))(v3 + 16);
    uint64_t v5 = *(void *)(a1 + 32);
    v4(v5, a3);
  }
}

void sub_100010490(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a2)
  {
    id nserror = (id)xpc_dictionary_get_nserror(a2, "error");
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, nserror);
  }
  else
  {
    uint64_t v4 = *(void (**)(uint64_t, uint64_t))(v3 + 16);
    uint64_t v5 = *(void *)(a1 + 32);
    v4(v5, a3);
  }
}

id sub_100010970(uint64_t a1, uint64_t a2)
{
  xpc_dictionary_set_nserror(*(void *)(a1 + 32), "error", a2);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);

  return [v3 sendMessage:v4];
}

id sub_100010D14(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  xpc_dictionary_set_nsobject(v5, "url", a2);
  xpc_dictionary_set_nserror(*(void *)(a1 + 32), "error", v6);

  uint64_t v8 = *(void *)(a1 + 32);
  id v7 = *(void **)(a1 + 40);

  return [v7 sendMessage:v8];
}

id sub_100011100(uint64_t a1, uint64_t a2)
{
  xpc_dictionary_set_nserror(*(void *)(a1 + 32), "error", a2);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);

  return [v3 sendMessage:v4];
}

id sub_100011260(uint64_t a1, uint64_t a2)
{
  xpc_dictionary_set_nserror(*(void *)(a1 + 32), "error", a2);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);

  return [v3 sendMessage:v4];
}

BOOL sub_1000112BC(id a1, NSURL *a2, NSError *a3)
{
  return 1;
}

id sub_1000112C4(void *a1, void *a2)
{
  id v11 = 0;
  id v3 = a2;
  [a1 getResourceValue:&v11 forKey:NSURLCanonicalPathKey error:0];
  id v4 = v11;
  uint64_t v5 = [v4 pathComponents];
  id v10 = 0;
  [v3 getResourceValue:&v10 forKey:NSURLCanonicalPathKey error:0];

  id v6 = [v10 pathComponents];
  id v7 = [v5 subarrayWithRange:[v6 count] count:[v5 count] - [v6 count]];

  uint64_t v8 = +[NSString pathWithComponents:v7];

  return v8;
}

void sub_1000113E8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_100011404(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100011420(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100011454(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_100011474(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000114AC()
{
  sub_1000113DC();
  sub_100011404((void *)&_mh_execute_header, v0, v1, "Missing remote connection for %@", v2, v3, v4, v5, v6);
}

void sub_100011514(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001154C()
{
  sub_1000113DC();
  sub_1000113E8((void *)&_mh_execute_header, v0, v1, "File found locally %@", v2, v3, v4, v5, v6);
}

void sub_1000115B4()
{
  sub_1000113DC();
  sub_100011404((void *)&_mh_execute_header, v0, v1, "File should exist locally at %@ but can't be found on disk", v2, v3, v4, v5, v6);
}

void sub_10001161C()
{
  sub_1000113DC();
  sub_1000113E8((void *)&_mh_execute_header, v0, v1, "securityScopedURLFromSandboxID %@", v2, v3, v4, v5, v6);
}

void sub_100011684(void *a1, void *a2)
{
  uint64_t v3 = a1;
  uint64_t v4 = [a2 localizedDescription];
  sub_1000113DC();
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Failed to transfer archive, %@", v5, 0xCu);
}

void sub_100011728(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100011760()
{
  sub_1000113DC();
  sub_100011404((void *)&_mh_execute_header, v0, v1, "No remote connection for device %@", v2, v3, v4, v5, v6);
}

void sub_1000117C8()
{
  sub_1000113DC();
  sub_100011404((void *)&_mh_execute_header, v0, v1, "Failed to find remote file writer service for device %@", v2, v3, v4, v5, v6);
}

void sub_100011830()
{
  sub_1000113DC();
  sub_1000113E8((void *)&_mh_execute_header, v0, v1, "Failed to consume sandbox extension for URL %@", v2, v3, v4, v5, v6);
}

void sub_100011898()
{
  sub_1000113DC();
  sub_1000113E8((void *)&_mh_execute_header, v0, v1, "currentURL %@", v2, v3, v4, v5, v6);
}

void sub_100011900()
{
  sub_1000113DC();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "transferIdentifier %@ to device %@", v2, 0x16u);
}

void sub_100011984(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000119F4(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  uint64_t v5 = [a3 localizedDescription];
  sub_10001143C();
  sub_100011454((void *)&_mh_execute_header, v6, v7, "Transfer session %llu failed with error \"%@\"", v8, v9, v10, v11, v12);
}

void sub_1000120B4(uint64_t a1, void *a2)
{
  if (a2)
  {
    id nsdata = xpc_dictionary_get_nsdata(a2, "signature");
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    __int16 v3 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v3();
  }
}

void sub_100012240(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    id nserror = (void *)xpc_dictionary_get_nserror(v3, "error");
    if (nserror)
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
    else
    {
      uint64_t v6 = xpc_dictionary_get_dictionary(v4, "processState");
      if (v6)
      {
        uint64_t v7 = objc_alloc_init(GTProcessState);
        [(GTProcessState *)v7 setIsSuspended:xpc_dictionary_get_BOOL(v6, "isSuspended")];
      }
      else
      {
        uint64_t v8 = +[NSString stringWithFormat:@"Deserialization failed for %@", @"processState", NSLocalizedDescriptionKey];
        uint64_t v11 = v8;
        uint64_t v9 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
        uint64_t v7 = +[NSError errorWithDomain:@"com.apple.gputools.transport" code:10 userInfo:v9];
      }
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

BOOL IsServicePort(unint64_t a1)
{
  return a1 >> 30 == 0;
}

void MessagePathPush(void *a1, uint64_t a2)
{
  id v3 = a1;
  id v4 = xpc_uint64_create(a2);
  xpc_dictionary_array_push(v3, "_pathHistory", v4);
}

uint64_t MessagePathPop(void *a1)
{
  os_log_t v1 = xpc_dictionary_array_pop(a1, "_replyPath");
  uint64_t v2 = v1;
  if (v1) {
    uint64_t value = xpc_uint64_get_value(v1);
  }
  else {
    uint64_t value = 0;
  }

  return value;
}

uint64_t MessagePathEndsWith(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = v4;
  if (!v4 || !xpc_array_get_count(v4))
  {
LABEL_12:
    uint64_t v7 = 1;
    goto LABEL_13;
  }
  if (v3)
  {
    size_t count = xpc_array_get_count(v5);
    if (count <= xpc_array_get_count(v3))
    {
      if (xpc_array_get_count(v3))
      {
        size_t v8 = 0;
        uint64_t v9 = -1;
        while (v8 < xpc_array_get_count(v5))
        {
          size_t v10 = xpc_array_get_count(v3) + v9;
          size_t v11 = xpc_array_get_count(v5) + v9;
          uint64_t uint64 = xpc_array_get_uint64(v3, v10);
          if (uint64 != xpc_array_get_uint64(v5, v11)) {
            goto LABEL_5;
          }
          ++v8;
          --v9;
          uint64_t v7 = 1;
          if (v8 >= xpc_array_get_count(v3)) {
            goto LABEL_13;
          }
        }
      }
      goto LABEL_12;
    }
  }
LABEL_5:
  uint64_t v7 = 0;
LABEL_13:

  return v7;
}

BOOL MessageIsStreamReply(void *a1)
{
  os_log_t v1 = xpc_dictionary_get_value(a1, "_replyPath");
  BOOL v2 = v1 != 0;

  return v2;
}

BOOL MessageHasReply(void *a1)
{
  id v1 = a1;
  BOOL v2 = (xpc_dictionary_get_flag(v1, "_flags", 0) & 1) != 0 || xpc_dictionary_get_BOOL(v1, "_reply");

  return v2;
}

void MessageSetHasReply(void *a1)
{
  xpc_object_t xdict = a1;
  xpc_dictionary_set_flag(xdict, "_flags", 0);
  xpc_dictionary_set_BOOL(xdict, "_reply", 1);
}

BOOL MessageRecordsPathHistory(void *a1)
{
  id v1 = a1;
  if (xpc_dictionary_get_flag(v1, "_flags", 2))
  {
    BOOL v2 = 1;
  }
  else
  {
    id v3 = xpc_dictionary_get_value(v1, "_replyStreamId");
    BOOL v2 = v3 != 0;
  }
  return v2;
}

BOOL MessageIsValid(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = v3;
  if (!v3)
  {
    if (a2)
    {
      NSErrorUserInfoKey v20 = NSLocalizedDescriptionKey;
      uint64_t v5 = +[NSString stringWithFormat:@"Encountered an XPC error: %@", @"Message is nil"];
      uint64_t v21 = v5;
      uint64_t v6 = &v21;
      uint64_t v7 = &v20;
      goto LABEL_8;
    }
LABEL_11:
    BOOL v12 = 0;
    goto LABEL_12;
  }
  if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_error)
  {
    if (a2)
    {
      NSErrorUserInfoKey v18 = NSLocalizedDescriptionKey;
      uint64_t v9 = +[NSString stringWithUTF8String:xpc_error_string(v4)];
      size_t v10 = +[NSString stringWithFormat:@"Encountered an XPC error: %@", v9];
      id v19 = v10;
      size_t v11 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
      *a2 = +[NSError errorWithDomain:@"com.apple.gputools.transport" code:7 userInfo:v11];
    }
    goto LABEL_11;
  }
  if (xpc_get_type(v4) != (xpc_type_t)&_xpc_type_dictionary)
  {
    if (a2)
    {
      uint64_t v5 = +[NSString stringWithFormat:@"Encountered an XPC error: %@", @"Unexpected XPC object type", NSLocalizedDescriptionKey];
      NSErrorUserInfoKey v17 = v5;
      uint64_t v6 = &v17;
      uint64_t v7 = (NSErrorUserInfoKey *)&v16;
LABEL_8:
      size_t v8 = +[NSDictionary dictionaryWithObjects:v6 forKeys:v7 count:1];
      *a2 = +[NSError errorWithDomain:@"com.apple.gputools.transport" code:7 userInfo:v8];

      goto LABEL_11;
    }
    goto LABEL_11;
  }
  id nserror = (void *)xpc_dictionary_get_nserror(v4, "_error");
  uint64_t v15 = nserror;
  BOOL v12 = nserror == 0;
  if (a2 && nserror) {
    *a2 = nserror;
  }

LABEL_12:
  return v12;
}

BOOL MessageVisit(void *a1, const char *a2)
{
  id v3 = a1;
  BOOL v4 = xpc_dictionary_string_array_contains(v3, "_visited", (uint64_t)a2);
  if (!v4)
  {
    xpc_object_t v5 = xpc_string_create(a2);
    xpc_dictionary_array_push(v3, "_visited", v5);
  }
  return !v4;
}

uint64_t sub_1000135D4(void *a1)
{
  if (a1[7])
  {
    unint64_t v2 = 0;
    do
    {
      (*(void (**)(void))(a1[5] + 16))();
      ++v2;
    }
    while (v2 < a1[7]);
  }
  id v3 = *(uint64_t (**)(void))(a1[6] + 16);

  return v3();
}

void sub_100013B4C(uint64_t a1, void *a2)
{
  if (a2)
  {
    id nsdictionary_any = xpc_dictionary_get_nsdictionary_any(a2, "data");
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v3();
  }
}

void sub_100013E78(uint64_t a1, void *a2)
{
  if (a2)
  {
    id nsdictionary_any = xpc_dictionary_get_nsdictionary_any(a2, "result");
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    [*(id *)(*(void *)(a1 + 32) + 8) deregisterDispatcher:[*(id *)(a1 + 40) dispatcherId]];
  }
  else
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v3();
  }
}

id sub_1000141D8(uint64_t a1, uint64_t a2)
{
  xpc_dictionary_set_nsobject(*(void **)(a1 + 32), "data", a2);
  uint64_t v4 = *(void *)(a1 + 32);
  id v3 = *(void **)(a1 + 40);

  return [v3 sendMessage:v4];
}

void sub_100014388(uint64_t a1, void *a2)
{
  id v3 = a2;
  xpc_object_t xdict = xpc_dictionary_create_empty();
  xpc_dictionary_set_uint64(xdict, "_port", *(void *)(a1 + 56));
  xpc_dictionary_set_value(xdict, "_replyPath", *(xpc_object_t *)(a1 + 32));
  xpc_dictionary_set_nsobject(xdict, "data", (uint64_t)v3);

  if (++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) == *(void *)(a1 + 64)) {
    xpc_dictionary_set_BOOL(xdict, "_endOfStream", 1);
  }
  [*(id *)(a1 + 40) sendMessage:xdict];
}

void sub_10001461C(uint64_t a1, void *a2)
{
  id v3 = a2;
  xpc_object_t xdict = xpc_dictionary_create_empty();
  xpc_dictionary_set_uint64(xdict, "_port", *(void *)(a1 + 48));
  xpc_dictionary_set_value(xdict, "_replyPath", *(xpc_object_t *)(a1 + 32));
  xpc_dictionary_set_nsobject(xdict, "data", (uint64_t)v3);

  MessageSetHasReply(xdict);
  id v4 = [*(id *)(a1 + 40) sendMessageWithReplySync:xdict error:0];
}

id sub_1000146C4(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  xpc_dictionary_set_BOOL(v3, "_endOfStream", 1);
  xpc_dictionary_set_nsobject(*(void **)(a1 + 32), "result", (uint64_t)v4);

  uint64_t v6 = *(void *)(a1 + 32);
  xpc_object_t v5 = *(void **)(a1 + 40);

  return [v5 sendMessage:v6];
}

uint64_t sub_100014FE0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100014FF0(uint64_t a1)
{
}

void sub_100014FF8(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id sub_100015394(uint64_t a1, void *a2)
{
  return [a2 notifyServiceListChanged:*(void *)(a1 + 32)];
}

void sub_100015AD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a2)
  {
    id nserror = (id)xpc_dictionary_get_nserror(a2, "error");
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, nserror);
  }
  else
  {
    id v4 = *(void (**)(uint64_t, uint64_t))(v3 + 16);
    uint64_t v5 = *(void *)(a1 + 32);
    v4(v5, a3);
  }
}

id sub_100016660(uint64_t a1, uint64_t a2)
{
  xpc_dictionary_set_nserror(*(void *)(a1 + 32), "error", a2);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);

  return [v3 sendMessage:v4];
}

id sub_1000167C4(uint64_t a1, uint64_t a2)
{
  xpc_dictionary_set_nserror(*(void *)(a1 + 32), "error", a2);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);

  return [v3 sendMessage:v4];
}

void sub_100016AE0(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Invalid remote properties - unable to locate remote service", v1, 2u);
}

id allServicesForDeviceUDID(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  xpc_object_t empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_string(empty, "_cmd", "allServices");
  if (v4) {
    xpc_dictionary_set_string(empty, "_device_dest", (const char *)[v4 UTF8String]);
  }
  MessageSetHasReply(empty);
  uint64_t v10 = 0;
  uint64_t v6 = [v3 sendMessageWithReplySync:empty error:&v10];
  if (v6)
  {
    uint64_t v7 = objc_opt_class();
    nsarray = (void *)xpc_dictionary_get_nsarray(v6, "returnValue", v7);
  }
  else
  {
    [v3 setError:0];
    nsarray = 0;
  }

  return nsarray;
}

id filteredArrayByService(void *a1, Protocol *a2)
{
  id v3 = a1;
  id v4 = NSStringFromProtocol(a2);
  id v5 = objc_alloc_init((Class)NSMutableArray);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v3;
  id v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        size_t v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        BOOL v12 = [v11 serviceProperties:v17];
        uint64_t v13 = [v12 protocolName];
        unsigned int v14 = [v13 isEqualToString:v4];

        if (v14) {
          [v5 addObject:v11];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  id v15 = [v5 copy];

  return v15;
}

id filteredArrayByPID(void *a1, int a2)
{
  id v3 = a1;
  id v4 = objc_alloc_init((Class)NSMutableArray);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        size_t v11 = [v10 processInfo:v14];
        if ([v11 processIdentifier] == a2) {
          [v4 addObject:v10];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  id v12 = [v4 copy];

  return v12;
}

id filteredArrayByPort(void *a1, id a2)
{
  id v3 = a1;
  id v4 = objc_alloc_init((Class)NSMutableArray);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        size_t v11 = [v10 serviceProperties:v14];
        if ([v11 servicePort] == a2) {
          [v4 addObject:v10];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  id v12 = [v4 copy];

  return v12;
}

id newSetWithArrayMinusArray(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  id v5 = [objc_alloc((Class)NSMutableSet) initWithArray:v4];

  id v6 = [objc_alloc((Class)NSSet) initWithArray:v3];
  [v5 minusSet:v6];

  id v7 = [v5 copy];

  return v7;
}

void xpc_dictionary_set_nsobject(void *a1, const char *a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v7 = 0;
    id v5 = a1;
    id v6 = +[NSKeyedArchiver archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v7];
    xpc_dictionary_set_data(v5, a2, [v6 bytes], (size_t)[v6 length]);
  }
}

void xpc_dictionary_set_nsdata(void *a1, const char *a2, id a3)
{
  if (a3)
  {
    id v5 = a3;
    xpc_object_t xdict = a1;
    id v6 = [v5 bytes];
    id v7 = [v5 length];

    xpc_dictionary_set_data(xdict, a2, v6, (size_t)v7);
  }
}

id xpc_dictionary_get_nsdata(void *a1, const char *a2)
{
  size_t length = 0;
  id result = (id)xpc_dictionary_get_data(a1, a2, &length);
  if (result)
  {
    id v3 = result;
    id v4 = objc_alloc((Class)NSData);
    return [v4 initWithBytes:v3 length:length];
  }
  return result;
}

id xpc_dictionary_get_nsdata_nocopy(void *a1, const char *a2)
{
  size_t length = 0;
  id result = (id)xpc_dictionary_get_data(a1, a2, &length);
  if (result)
  {
    id v3 = result;
    id v4 = objc_alloc((Class)NSData);
    return [v4 initWithBytesNoCopy:v3 length:length freeWhenDone:0];
  }
  return result;
}

void *xpc_dictionary_get_nsobject(void *a1, const char *a2, uint64_t a3)
{
  id nsdata_nocopy = xpc_dictionary_get_nsdata_nocopy(a1, a2);
  if (!nsdata_nocopy) {
    goto LABEL_5;
  }
  uint64_t v7 = 0;
  id v5 = +[NSKeyedUnarchiver unarchivedObjectOfClass:a3 fromData:nsdata_nocopy error:&v7];
  if (v5 && (objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_5:
    id v5 = 0;
  }

  return v5;
}

uint64_t sub_1000185AC(void *a1, const char *a2)
{
  id v2 = a1;
  id v3 = objc_alloc((Class)NSSet);
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  id v12 = [v3 initWithObjects:v4, v5, v6, v7, v8, v9, v10, v11, objc_opt_class(), 0];
  uint64_t nsobject_classes = xpc_dictionary_get_nsobject_classes(v2, a2, v12);

  return nsobject_classes;
}

uint64_t xpc_dictionary_get_nsarray(void *a1, const char *a2, uint64_t a3)
{
  id nsdata_nocopy = xpc_dictionary_get_nsdata_nocopy(a1, a2);
  if (nsdata_nocopy)
  {
    uint64_t v7 = 0;
    uint64_t v5 = +[NSKeyedUnarchiver unarchivedArrayOfObjectsOfClass:a3 fromData:nsdata_nocopy error:&v7];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

uint64_t xpc_dictionary_get_nsdictionary(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  id nsdata_nocopy = xpc_dictionary_get_nsdata_nocopy(a1, a2);
  if (nsdata_nocopy)
  {
    uint64_t v9 = 0;
    uint64_t v7 = +[NSKeyedUnarchiver unarchivedDictionaryWithKeysOfClass:a3 objectsOfClass:a4 fromData:nsdata_nocopy error:&v9];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

uint64_t xpc_dictionary_get_nsobject_classes(void *a1, const char *a2, void *a3)
{
  id v5 = a3;
  id nsdata_nocopy = xpc_dictionary_get_nsdata_nocopy(a1, a2);
  if (nsdata_nocopy)
  {
    uint64_t v9 = 0;
    uint64_t v7 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v5 fromData:nsdata_nocopy error:&v9];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

id xpc_dictionary_get_nsdictionary_any(void *a1, const char *a2)
{
  id v2 = (void *)sub_1000185AC(a1, a2);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  return v4;
}

const char *xpc_error_string(void *a1)
{
  id result = xpc_dictionary_get_string(a1, _xpc_error_key_description);
  if (!result) {
    return "Unknown";
  }
  return result;
}

void xpc_dictionary_set_flag(void *a1, const char *a2, char a3)
{
  xpc_object_t xdict = a1;
  uint64_t uint64 = xpc_dictionary_get_uint64(xdict, a2);
  xpc_dictionary_set_uint64(xdict, a2, uint64 | (1 << a3));
}

uint64_t xpc_dictionary_get_flag(void *a1, const char *a2, char a3)
{
  return (xpc_dictionary_get_uint64(a1, a2) >> a3) & 1;
}

id xpc_array_pop(void *a1)
{
  id v1 = a1;
  size_t count = xpc_array_get_count(v1);
  if (count)
  {
    size_t v3 = count - 1;
    while (1)
    {
      id v4 = xpc_array_get_value(v1, v3);
      if (xpc_get_type(v4) != (xpc_type_t)&_xpc_type_null) {
        break;
      }

      if (--v3 == -1) {
        goto LABEL_5;
      }
    }
    xpc_object_t v5 = xpc_null_create();
    xpc_array_set_value(v1, v3, v5);
  }
  else
  {
LABEL_5:
    id v4 = 0;
  }

  return v4;
}

void xpc_dictionary_array_push(void *a1, const char *a2, void *a3)
{
  xpc_object_t value = a3;
  id v5 = a1;
  xpc_object_t empty = xpc_dictionary_get_array(v5, a2);
  if (!empty) {
    xpc_object_t empty = xpc_array_create_empty();
  }
  xpc_array_append_value(empty, value);
  xpc_dictionary_set_value(v5, a2, empty);
}

id xpc_dictionary_array_pop(void *a1, const char *a2)
{
  id v3 = a1;
  id v4 = xpc_dictionary_get_array(v3, a2);
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = xpc_array_pop(v4);
    xpc_dictionary_set_value(v3, a2, v5);
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

BOOL xpc_dictionary_string_array_contains(void *a1, const char *a2, uint64_t a3)
{
  id v4 = xpc_dictionary_get_array(a1, a2);
  id v5 = v4;
  if (v4 && xpc_get_type(v4) == (xpc_type_t)&_xpc_type_array)
  {
    uint64_t v9 = 0;
    uint64_t v10 = &v9;
    uint64_t v11 = 0x2020000000;
    char v12 = 0;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100018C14;
    v8[3] = &unk_100034CC8;
    v8[4] = &v9;
    v8[5] = a3;
    xpc_array_apply(v5, v8);
    BOOL v6 = *((unsigned char *)v10 + 24) != 0;
    _Block_object_dispose(&v9, 8);
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

uint64_t sub_100018C14(uint64_t a1, int a2, xpc_object_t xstring)
{
  string_ptr = xpc_string_get_string_ptr(xstring);
  if (!string_ptr) {
    return 1;
  }
  int v5 = strcmp(*(const char **)(a1 + 40), string_ptr);
  uint64_t result = 1;
  if (!v5)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    return 0;
  }
  return result;
}

id gt_xpc_dictionary_create_reply(void *a1)
{
  xpc_object_t reply = xpc_dictionary_create_reply(a1);

  return reply;
}

void sub_100018EB8(void *a1)
{
  id v1 = *(void **)(a1[4] + 32);
  if (v1)
  {
    uint64_t v2 = a1[5];
    id v3 = +[NSNumber numberWithUnsignedLongLong:a1[6]];
    [v1 setObject:v2 forKeyedSubscript:v3];
  }
}

void sub_100018FF0(void *a1)
{
  id v1 = *(void **)(a1[4] + 32);
  if (v1)
  {
    uint64_t v2 = a1[5];
    id v3 = +[NSNumber numberWithUnsignedLongLong:a1[6]];
    [v1 setObject:v2 forKeyedSubscript:v3];
  }
}

void sub_1000190E4(uint64_t a1)
{
  id v1 = *(void **)(*(void *)(a1 + 32) + 32);
  if (v1)
  {
    id v2 = +[NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 40)];
    [v1 removeObjectForKey:v2];
  }
}

void sub_100019224(uint64_t a1)
{
  if (xpc_dictionary_get_flag(*(void **)(a1 + 32), "_flags", 1))
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v2 = *(id *)(*(void *)(a1 + 40) + 32);
    id v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v3)
    {
      id v4 = v3;
      uint64_t v5 = *(void *)v14;
      do
      {
        for (i = 0; i != v4; i = (char *)i + 1)
        {
          if (*(void *)v14 != v5) {
            objc_enumerationMutation(v2);
          }
          uint64_t v7 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if (IsServicePort((unint64_t)[v7 unsignedLongLongValue]))
          {
            uint64_t v8 = [*(id *)(*(void *)(a1 + 40) + 32) objectForKeyedSubscript:v7];
            [v8 dispatchMessage:*(void *)(a1 + 32) replyConnection:*(void *)(a1 + 48)];
          }
        }
        id v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v4);
    }
  }
  else
  {
    uint64_t uint64 = xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 32), "_port");
    uint64_t v10 = *(void **)(*(void *)(a1 + 40) + 32);
    uint64_t v11 = +[NSNumber numberWithUnsignedLongLong:uint64];
    id v12 = [v10 objectForKeyedSubscript:v11];

    [v12 dispatchMessage:*(void *)(a1 + 32) replyConnection:*(void *)(a1 + 48)];
  }
}

void sub_1000194E8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = 0;
  BOOL IsValid = MessageIsValid(v3, &v6);
  id v5 = v6;
  if (!IsValid)
  {

    id v3 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000196B8(uint64_t a1)
{
}

void sub_1000197C0(id *a1, void *a2)
{
  id v3 = a2;
  WeakRetained = (NSObject **)objc_loadWeakRetained(a1 + 6);
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = WeakRetained[3];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000198AC;
    v7[3] = &unk_100034DB8;
    id v8 = v3;
    uint64_t v9 = v5;
    id v10 = a1[4];
    id v11 = a1[5];
    dispatch_async(v6, v7);
  }
}

uint64_t sub_1000198AC(uint64_t a1)
{
  if (xpc_get_type(*(xpc_object_t *)(a1 + 32)) == (xpc_type_t)&_xpc_type_error)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 40) + 40), *(id *)(a1 + 32));
    uint64_t v2 = a1 + 48;
  }
  else
  {
    uint64_t v2 = a1 + 56;
  }
  id v3 = *(uint64_t (**)(void))(*(void *)v2 + 16);

  return v3();
}

void sub_1000199A0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 32);
  *(void *)(v1 + 32) = 0;
}

uint64_t start()
{
  size_t v6 = 8;
  uint64_t v7 = 0;
  if (sysctlbyname("security.mac.amfi.developer_mode_status", &v7, &v6, 0, 0))
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    int v3 = *__error();
    *(_DWORD *)buf = 67109120;
    int v9 = v3;
    id v4 = "Failed to read developer mode status: %{darwin.errno}d";
    uint32_t v5 = 8;
    goto LABEL_8;
  }
  if (v7 != 1)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    *(_WORD *)buf = 0;
    id v4 = "Service prohibited from running (developer mode not enabled)";
    uint32_t v5 = 2;
LABEL_8:
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, v4, buf, v5);
LABEL_9:
    exit(1);
  }
  MTLSetReportFailureBlock();
  GTTransportEnvironment_init();
  uint64_t v1 = objc_alloc_init(GTServiceDaemon);
  [(GTServiceDaemon *)v1 enterRunLoop];

  return 0;
}

void sub_10001B584(id a1, unint64_t a2, const char *a3, unsigned int a4, NSString *a5)
{
  int v8 = a2;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    v9[0] = 67109890;
    v9[1] = v8;
    __int16 v10 = 2080;
    id v11 = a3;
    __int16 v12 = 1024;
    unsigned int v13 = a4;
    __int16 v14 = 2080;
    long long v15 = [(NSString *)a5 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Metal Validation Error found: ! %d, %s, %d, %s", (uint8_t *)v9, 0x22u);
  }
}

id sub_10001BEE0(uint64_t a1, void *a2, uint64_t a3)
{
  if (a2)
  {
    applier[0] = _NSConcreteStackBlock;
    applier[1] = 3221225472;
    applier[2] = sub_10001BF94;
    applier[3] = &unk_100034EB8;
    id v7 = *(id *)(a1 + 32);
    xpc_dictionary_apply(a2, applier);
  }
  else
  {
    xpc_dictionary_set_nserror(*(void *)(a1 + 32), "_error", a3);
  }
  return [*(id *)(a1 + 40) updateAndRelayMessage:*(void *)(a1 + 32) fromConnection:*(void *)(a1 + 48) toConnection:*(void *)(a1 + 56)];
}

uint64_t sub_10001BF94(uint64_t a1, const char *a2, void *a3)
{
  return 1;
}

id sub_10001CBBC(void *a1)
{
  string = (void *)xpc_dictionary_get_string(a1, "_device_dest");
  if (string)
  {
    string = +[NSString stringWithUTF8String:string];
  }

  return string;
}

void sub_10001D254(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained) {
    [*(id *)(a1 + 32) handleMessage:v4 fromConnection:WeakRetained];
  }
}

uint64_t sub_10001D2BC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained) {
    [*(id *)(a1 + 32) handleDisconnection:WeakRetained];
  }

  return _objc_release_x1();
}

void sub_10001D3A4(uint64_t a1, void *a2)
{
  xpc_object_t object = a2;
  if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_connection)
  {
    [*(id *)(a1 + 32) handleConnection:object];
  }
  else
  {
    int v3 = xpc_copy_description(object);

    id v4 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v7 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Listener: received object:%s", buf, 0xCu);
    }
    free(v3);
  }
}

uint64_t sub_10001E458(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10001E930(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10001E940(uint64_t a1)
{
}

void sub_10001E948(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), obj);
  id v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10001ECC0(void *a1, char a2, void *a3)
{
  id v6 = a3;
  *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = a2;
  if ((a2 & 1) == 0) {
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a3);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1[6] + 8) + 40));
}

void sub_10001EFB8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    int v8 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    if (v6)
    {
      int v9 = *(NSObject **)(*(void *)(a1 + 32) + 8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        __int16 v10 = v9;
        id v11 = [v7 description];
        int v12 = 136315138;
        id v13 = [v11 UTF8String];
        _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Cannot bring app to foreground: error = %s", (uint8_t *)&v12, 0xCu);
      }
    }
    int v8 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v8();
}

void sub_10001F698(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v9 = v7;
      __int16 v10 = [v6 localizedDescription];
      int v11 = 138412290;
      int v12 = v10;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Error Launching Replayer: %@", (uint8_t *)&v11, 0xCu);
    }
    int v8 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    int v8 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v8();
}

void sub_10001F878(uint64_t a1)
{
  CSSymbolicatorCreateWithPid();
  if (CSIsNull())
  {
    id Signature = 0;
  }
  else
  {
    id Signature = (id)CSSymbolicatorCreateSignature();
    CSRelease();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10001FAB4(uint64_t a1, void *a2, void *a3)
{
  id v8 = a3;
  if (a2)
  {
    id v5 = a2;
    xpc_object_t empty = xpc_dictionary_create_empty();
    xpc_dictionary_set_value(*(xpc_object_t *)(a1 + 32), "processState", empty);
    unsigned __int8 v7 = [v5 isSuspended];

    xpc_dictionary_set_BOOL(empty, "isSuspended", v7);
  }
  xpc_dictionary_set_nserror(*(void *)(a1 + 32), "error", v8);
  [*(id *)(a1 + 40) sendMessage:*(void *)(a1 + 32)];
}

id sub_10001FC6C(uint64_t a1, id a2)
{
  xpc_dictionary_set_nsdata(*(void **)(a1 + 32), "signature", a2);
  uint64_t v4 = *(void *)(a1 + 32);
  int v3 = *(void **)(a1 + 40);

  return [v3 sendMessage:v4];
}

id sub_1000203D8(const uint8_t *a1)
{
  uint64_t v10 = 2049;
  uint64_t v9 = 49680;
  uint64_t v2 = (uint8_t *)malloc_type_calloc(1uLL, 0xC210uLL, 0x2CC67910uLL);
  size_t v3 = compression_encode_buffer(v2, 0xC210uLL, a1, 0xC210uLL, 0, COMPRESSION_LZFSE);
  int v7 = 1;
  int v8 = 1;
  id v4 = objc_alloc_init((Class)NSMutableData);
  [v4 appendBytes:&v8 length:4];
  [v4 appendBytes:&v7 length:4];
  [v4 appendBytes:&v10 length:8];
  [v4 appendBytes:&v9 length:8];
  [v4 appendBytes:v2 length:v3];
  free(v2);
  id v5 = [v4 copy];

  return v5;
}

uint8_t *sub_1000204DC(const uint8_t *a1, size_t a2, uint64_t a3, size_t a4, size_t a5, uint64_t a6)
{
  if (a4 <= a5) {
    unint64_t v10 = a5;
  }
  else {
    unint64_t v10 = a4;
  }
  uint64_t result = (uint8_t *)sub_100022C10(a6, v10);
  if (result)
  {
    int v12 = result;
    bzero(result, v10);
    if (a3)
    {
      size_t v13 = compression_decode_buffer(v12, a4, a1, a2, 0, (compression_algorithm)a3);
      uint64_t result = 0;
      if (v13 != a4) {
        return result;
      }
    }
    else
    {
      if (a2 < a4) {
        return 0;
      }
      memcpy(v12, a1, a4);
    }
    return v12;
  }
  return result;
}

uint64_t sub_100020594(void *a1, uint64_t a2, unsigned char *a3)
{
  v14[0] = 0;
  v14[1] = 0;
  if (a3) {
    *a3 = 0;
  }
  id v5 = a1;
  unint64_t v6 = (unint64_t)[v5 length];
  id v7 = v5;
  id v8 = [v7 bytes];

  if (v6 <= 3
    || (int v9 = *(_DWORD *)v8, *(_DWORD *)v8 >= 2u)
    || (v6 & 0xFFFFFFFFFFFFFFFCLL) == 4
    || (v6 & 0xFFFFFFFFFFFFFFF8) == 8
    || (v6 & 0xFFFFFFFFFFFFFFF0) == 0x10)
  {
LABEL_8:
    if (a3)
    {
      uint64_t result = 0;
      *a3 = 1;
      return result;
    }
    return 0;
  }
  uint64_t v11 = *((void *)v8 + 2);
  if (v11)
  {
    unint64_t v12 = *((void *)v8 + 3);
    size_t v13 = (char *)sub_1000204DC((const uint8_t *)v8 + 32, v6 - 32, *((void *)v8 + 1), v12 * v11, v12 * v11, a2);
    if (v13)
    {
      sub_1000206B4(v13, (uint64_t)v14, v12, v11, v9, a3, a2);
      return v14[0];
    }
    goto LABEL_8;
  }
  return 0;
}

char *sub_1000206B4(char *result, uint64_t a2, unint64_t a3, uint64_t a4, int a5, unsigned char *a6, uint64_t a7)
{
  if (a5 == 1 && (v11 = result, v12 = 24 * a4, (uint64_t result = (char *)sub_100022C10(a7, 24 * a4)) != 0))
  {
    size_t v13 = result;
    bzero(result, v12);
    if (a3 >= 0x18) {
      size_t v14 = 24;
    }
    else {
      size_t v14 = a3;
    }
    long long v15 = v13;
    uint64_t v16 = a4;
    do
    {
      uint64_t result = (char *)memcpy(v15, v11, v14);
      v15 += 24;
      v11 += a3;
      --v16;
    }
    while (v16);
    *(void *)a2 = v13;
    *(_DWORD *)(a2 + 8) = a4;
  }
  else if (a6)
  {
    *a6 = 1;
  }
  return result;
}

uint64_t sub_100020774(void *a1, uint64_t a2, unsigned char *a3)
{
  v15[0] = 0;
  v15[1] = 0;
  if (a3) {
    *a3 = 0;
  }
  id v5 = a1;
  unint64_t v6 = (unint64_t)[v5 length];
  id v7 = v5;
  id v8 = (unsigned int *)[v7 bytes];

  if (v6 <= 3
    || (uint64_t v9 = *v8, v9 >= 2)
    || (v6 & 0xFFFFFFFFFFFFFFFCLL) == 4
    || (v6 & 0xFFFFFFFFFFFFFFF8) == 8
    || v6 - 16 <= 0x17)
  {
LABEL_8:
    if (a3)
    {
      uint64_t result = 0;
      *a3 = 1;
      return result;
    }
    return 0;
  }
  unint64_t v11 = *((void *)v8 + 2);
  if (v11)
  {
    unint64_t v12 = *((void *)v8 + 3);
    uint64_t v13 = *((void *)v8 + 4);
    size_t v14 = (char *)sub_1000204DC((const uint8_t *)v8 + 40, v6 - 40, *((void *)v8 + 1), (v13 + v12) * v11, (v13 + v12) * v11, a2);
    if (v14)
    {
      sub_10002089C(v14, (uint64_t)v15, v12, v13, v11, v9, a3, a2);
      return v15[0];
    }
    goto LABEL_8;
  }
  return 0;
}

void sub_10002089C(char *a1, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, unsigned char *a7, uint64_t a8)
{
  if (a6 != 1 || (size_t v14 = 24 * a5, (v15 = (void *)sub_100022C10(a8, 24 * a5)) == 0))
  {
    BOOL v21 = 0;
    if (!a7) {
      return;
    }
    goto LABEL_35;
  }
  uint64_t v16 = v15;
  uint64_t v38 = a2;
  v39 = a7;
  bzero(v15, v14);
  if (a3 >= 0x10) {
    size_t v17 = 16;
  }
  else {
    size_t v17 = a3;
  }
  uint64_t v18 = 1;
  long long v19 = a1;
  unint64_t v20 = a5;
  do
  {
    memcpy(&v16[v18], v19, v17);
    v18 += 3;
    v19 += a3;
    --v20;
  }
  while (v20);
  BOOL v21 = 0;
  unint64_t v22 = 0;
  id v40 = &a1[a5 * a3];
  while (1)
  {
    uint64_t v23 = 0;
    unint64_t v24 = 0;
    uint64_t v56 = 0;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    uint64_t v43 = 0;
    long long v45 = 0u;
    memset(v42, 0, sizeof(v42));
    uint64_t v44 = 56;
    do
    {
      v24 += (*(void *)((char *)v42 + v23) + 7) & 0xFFFFFFFFFFFFFFF8;
      v23 += 8;
    }
    while (v23 != 424);
    uint64_t v25 = (char *)sub_100022C10(a8, v24);
    if (!v25) {
      break;
    }
    int v26 = v25;
    int v27 = &v40[v22 * a4];
    bzero(v25, v24);
    uint64_t v28 = 0;
    NSErrorUserInfoKey v29 = v26;
    do
    {
      if (((*(void *)((char *)v42 + v28) + 7) & 0xFFFFFFFFFFFFFFF8) != 0) {
        long long v30 = v29;
      }
      else {
        long long v30 = 0;
      }
      v29 += (*(void *)((char *)v42 + v28) + 7) & 0xFFFFFFFFFFFFFFF8;
      *(void *)((char *)v42 + v28) = v30;
      v28 += 8;
    }
    while (v28 != 424);
    uint64_t v31 = v44;
    v44 += 56;
    *(void *)(v31 + 48) = 512;
    *(_OWORD *)uint64_t v31 = xmmword_10002BAE8;
    *(_OWORD *)(v31 + 16) = unk_10002BAF8;
    *(_OWORD *)(v31 + 32) = xmmword_10002BB08;
    unsigned int v32 = *(_DWORD *)v27;
    *(unsigned char *)(v31 + 49) = *((void *)v27 + 1);
    *(_WORD *)(v31 + 34) = *((void *)v27 + 2);
    *(_DWORD *)(v31 + 24) = *((void *)v27 + 3);
    *(_WORD *)(v31 + 32) = *((void *)v27 + 4);
    *(_WORD *)(v31 + 30) = *((void *)v27 + 5);
    *(unsigned char *)(v31 + 45) = *((void *)v27 + 6);
    *(unsigned char *)(v31 + 47) = *((void *)v27 + 7);
    *(_WORD *)(v31 + 28) = *((void *)v27 + 8);
    uint64_t v33 = 72;
    if (v32 < 3) {
      uint64_t v33 = 80;
    }
    v34 = &v27[v33];
    *(unsigned char *)(v31 + 43) = *(void *)v34;
    *(unsigned char *)(v31 + 44) = *((void *)v34 + 1);
    if (v32)
    {
      *(_DWORD *)(v31 + 20) = *((void *)v34 + 2);
      if (v32 <= 3)
      {
        if (v32 == 3) {
          *(_WORD *)(v31 + 36) = *((_WORD *)v34 + 16) | (16 * *((_WORD *)v34 + 12));
        }
      }
      else
      {
        int v35 = v34[24];
        *(unsigned char *)(v31 + 46) = v35;
        int v36 = *((_DWORD *)v34 + 10);
        int v37 = v36 | (16 * *((_DWORD *)v34 + 8));
        *(_WORD *)(v31 + 36) = v36 | (16 * *((_WORD *)v34 + 16));
        if (v32 >= 0x15)
        {
          *(unsigned char *)(v31 + 38) = *((void *)v34 + 6);
          *(unsigned char *)(v31 + 40) = *((void *)v34 + 7);
          if (v32 != 21)
          {
            *(void *)(v31 + 8) = *((void *)v34 + 8);
            *(unsigned char *)(v31 + 42) = *((void *)v34 + 9);
            if (v32 >= 0x23)
            {
              *(_DWORD *)(v31 + 16) = v34[80] | (unsigned __int16)(*((_DWORD *)v34 + 22) << 8) | (*((_DWORD *)v34 + 24) << 16) | (*((_DWORD *)v34 + 26) << 24);
              if (v32 >= 0x27)
              {
                *(_DWORD *)(v31 + 16) = *((void *)v34 + 14);
                if (v32 >= 0x2A)
                {
                  *(_WORD *)(v31 + 36) = v37 | (*((_WORD *)v34 + 60) << 8);
                  *(void *)uint64_t v31 = *((void *)v34 + 16);
                  *(unsigned char *)(v31 + 48) = *((void *)v34 + 17);
                  *(unsigned char *)(v31 + 50) = *((void *)v34 + 18);
                  if (v32 >= 0x31)
                  {
                    *(unsigned char *)(v31 + 41) = *((void *)v34 + 19);
                    *(unsigned char *)(v31 + 39) = *((void *)v34 + 20);
                  }
                }
              }
            }
          }
        }
        if (v35 == 255) {
          *(unsigned char *)(v31 + 46) = 0;
        }
      }
    }
    v16[3 * v22++] = v26;
    BOOL v21 = v22 >= a5;
    if (v22 == a5)
    {
      *(void *)uint64_t v38 = v16;
      *(_DWORD *)(v38 + 8) = a5;
      return;
    }
  }
  a7 = v39;
  if (v39)
  {
LABEL_35:
    if (!v21) {
      *a7 = 1;
    }
  }
}

char *sub_100020C14(void *a1, uint64_t a2)
{
  kern_return_t v13;
  BOOL v14;
  kern_return_t v15;
  uint64_t i;
  uint64_t v17;
  uint64_t v18;
  unsigned __int8 v19;
  unsigned __int8 v20;
  unsigned __int8 v21;
  unsigned __int8 v22;
  unsigned __int8 v23;
  unsigned __int8 v24;
  unsigned __int8 v25;
  unsigned __int8 v26;
  unsigned __int8 v27;
  unsigned __int8 v28;
  unsigned __int8 v29;
  unsigned __int8 v30;
  unsigned __int8 v31;
  uint64_t j;
  uint64_t k;
  uint64_t m;
  unsigned __int8 v35;
  unsigned __int8 v36;
  unsigned __int8 v37;
  unsigned __int8 v38;
  unsigned __int8 v39;
  unsigned __int8 v40;
  unsigned __int8 v41;
  unsigned __int8 v42;
  unsigned __int8 v43;
  unsigned __int8 v44;
  unsigned __int8 v45;
  unsigned __int8 v46;
  unsigned __int8 v47;
  unsigned __int8 v48;
  unsigned __int8 v49;
  unsigned __int8 v50;
  unsigned __int8 v51;
  unsigned __int8 v52;
  unsigned __int8 v53;
  unsigned __int8 v54;
  unsigned __int8 v55;
  unsigned __int8 v56;
  unsigned __int8 v57;
  unsigned __int8 v58;
  unsigned __int8 v59;
  unsigned __int8 v60;
  unsigned __int8 v61;
  unsigned __int8 v62;
  unsigned __int8 v63;
  unsigned __int8 v64;
  unsigned __int8 v65;
  unsigned __int8 v66;
  unsigned __int8 v67;
  unsigned __int8 v68;
  unsigned __int8 v69;
  unsigned __int8 v70;
  unsigned __int8 v71;
  unsigned __int8 v72;
  unsigned __int8 v73;
  unsigned __int8 v74;
  unsigned __int8 v75;
  unsigned __int8 v76;
  unsigned __int8 v77;
  unsigned __int8 v78;
  unsigned __int8 v79;
  unsigned __int8 v80;
  unsigned __int8 v81;
  unsigned __int8 v82;
  unsigned __int8 v83;
  unsigned __int8 v84;
  unsigned __int8 v85;
  unsigned __int8 v86;
  unsigned __int8 v87;
  unsigned __int8 v88;
  unsigned __int8 v89;
  unsigned __int8 v90;
  unsigned __int8 v91;
  unsigned __int8 v92;
  unsigned __int8 v93;
  unsigned __int8 v94;
  unsigned __int8 v95;
  unsigned __int8 v96;
  unsigned __int8 v97;
  unsigned __int8 v98;
  unsigned __int8 v99;
  unsigned __int8 v100;
  unsigned __int8 v101;
  unsigned __int8 v102;
  unsigned __int8 v103;
  unsigned __int8 v104;
  unsigned __int8 v105;
  unsigned __int8 v106;
  unsigned __int8 v107;
  unsigned __int8 v108;
  unsigned __int8 v109;
  unsigned __int8 v110;
  unsigned __int8 v111;
  unsigned __int8 v112;
  unsigned __int8 v113;
  unsigned __int8 v114;
  unsigned __int8 v115;
  unsigned __int8 v116;
  unsigned __int8 v117;
  uint64_t v118;
  uint64_t v119;
  __int16 v120;
  char *v121;
  char *v122;
  long long outputStruct;
  long long v125;
  long long v126;
  uint64_t v127;
  size_t outputStructCnt;
  io_connect_t connect;

  id v3 = a1;
  id v4 = (char *)sub_100022C10(a2, 0xC210uLL);
  id v5 = v4;
  unint64_t v6 = v4 + 49408;
  if (v4) {
    bzero(v4, 0xC210uLL);
  }
  id v7 = v3;
  id v8 = v7;
  if (v7)
  {
    id v9 = [v7 name];
    snprintf(v5 + 49152, 0x100uLL, "%s", (const char *)[v9 UTF8String]);

    unint64_t v10 = [v8 targetDeviceArchitecture];
    *(_DWORD *)unint64_t v6 = [v10 cpuType];
    *((_DWORD *)v6 + 1) = [v10 subType];
    *((_WORD *)v6 + 4) = (unsigned __int16)[v10 version];
    v6[10] = [v10 version] >> 16;
    v6[11] = [v10 version] >> 24;
    *((_DWORD *)v6 + 3) = [v10 versionCombined];
    *((void *)v6 + 2) = [v10 driverVersion];

    if (*(_DWORD *)v6 == 16777235)
    {
      *((_OWORD *)v5 + 3090) = 0u;
      CFDictionaryRef v11 = IOServiceMatching("AGXAccelerator");
      io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v11);
      if (MatchingService)
      {
        connect = 0;
        uint64_t v13 = IOServiceOpen(MatchingService, mach_task_self_, 1u, &connect);
        size_t v14 = 0;
        if (!v13)
        {
          outputStruct = 0uLL;
          outputStructCnt = 16;
          long long v15 = IOConnectCallStructMethod(connect, 0x10Au, 0, 0, &outputStruct, &outputStructCnt);
          size_t v14 = v15 == 0;
          if (!v15) {
            *((_OWORD *)v5 + 3090) = outputStruct;
          }
        }
      }
      else
      {
        size_t v14 = 0;
      }
      v6[268] = v14;
    }
    if (objc_opt_respondsToSelector())
    {
      for (i = 0; i != 9; ++i)
        v5[i + 49497] = [v8 supportsFamily:i + 1001];
      v6[98] = [v8 supportsFamily:2002];
      size_t v17 = 0;
      v6[99] = [v8 supportsFamily:2003];
      do
      {
        v5[v17 + 49508] = [v8 supportsFamily:v17 + 3001];
        ++v17;
      }
      while (v17 != 3);
      v6[103] = [v8 supportsFamily:5001];
    }
    *((void *)v6 + 3) = -1;
    if (objc_opt_respondsToSelector()) {
      *((void *)v6 + 6) = [v8 maxThreadgroupMemoryLength];
    }
    if (objc_opt_respondsToSelector())
    {
      outputStruct = 0uLL;
      *(void *)&v125 = 0;
      [v8 maxThreadsPerThreadgroup];
      uint64_t v18 = v125;
      *(_OWORD *)(v6 + 56) = outputStruct;
      *((void *)v6 + 9) = v18;
    }
    if (objc_opt_respondsToSelector()) {
      *((void *)v6 + 10) = [v8 maxBufferLength];
    }
    if (objc_opt_respondsToSelector()) {
      long long v19 = [v8 supportsLateEvalEvent];
    }
    else {
      long long v19 = 0;
    }
    v6[213] = v19;
    if (objc_opt_respondsToSelector()) {
      unint64_t v20 = [v8 supportsRaytracing];
    }
    else {
      unint64_t v20 = 0;
    }
    v6[215] = v20;
    if (objc_opt_respondsToSelector()) {
      BOOL v21 = [v8 supportsTileShaders];
    }
    else {
      BOOL v21 = 0;
    }
    v6[214] = v21;
    if (objc_opt_respondsToSelector()) {
      unint64_t v22 = [v8 supportsMeshShaders];
    }
    else {
      unint64_t v22 = 0;
    }
    v6[216] = v22;
    if (objc_opt_respondsToSelector()) {
      uint64_t v23 = [v8 isMsaa32bSupported];
    }
    else {
      uint64_t v23 = 0;
    }
    v6[142] = v23;
    if (objc_opt_respondsToSelector()) {
      unint64_t v24 = [v8 supportsBufferWithIOSurface];
    }
    else {
      unint64_t v24 = 0;
    }
    v6[219] = v24;
    if (objc_opt_respondsToSelector()) {
      uint64_t v25 = [v8 supportsBGR10A2];
    }
    else {
      uint64_t v25 = 0;
    }
    v6[155] = v25;
    if (objc_opt_respondsToSelector()) {
      int v26 = [v8 supportsSparseHeaps];
    }
    else {
      int v26 = 0;
    }
    v6[223] = v26;
    if (objc_opt_respondsToSelector()) {
      int v27 = [v8 supportsSparseTextures];
    }
    else {
      int v27 = 0;
    }
    v6[224] = v27;
    if (objc_opt_respondsToSelector()) {
      uint64_t v28 = [v8 supportsPlacementHeaps];
    }
    else {
      uint64_t v28 = 0;
    }
    v6[222] = v28;
    if (objc_opt_respondsToSelector()) {
      NSErrorUserInfoKey v29 = [v8 supportsComputeMemoryBarrier];
    }
    else {
      NSErrorUserInfoKey v29 = 0;
    }
    v6[206] = v29;
    if (objc_opt_respondsToSelector()) {
      long long v30 = [v8 supportsRenderMemoryBarrier];
    }
    else {
      long long v30 = 0;
    }
    v6[207] = v30;
    if (objc_opt_respondsToSelector()) {
      uint64_t v31 = [v8 supportsPartialRenderMemoryBarrier];
    }
    else {
      uint64_t v31 = 0;
    }
    v6[208] = v31;
    if (objc_opt_respondsToSelector())
    {
      for (j = 0; j != 16; ++j)
        v5[j + 49593] = [v8 supportsVertexAmplificationCount:j];
    }
    if (objc_opt_respondsToSelector())
    {
      for (k = 0; k != 32; ++k)
        v5[k + 49512] = [v8 supportsTextureSampleCount:k];
    }
    if (objc_opt_respondsToSelector())
    {
      for (m = 0; m != 16; ++m)
        v5[m + 49577] = [v8 supportsRasterizationRateMapWithLayerCount:m];
    }
    if (objc_opt_respondsToSelector()) {
      int v35 = [v8 supportsProgrammableSamplePositions];
    }
    else {
      int v35 = 0;
    }
    v6[168] = v35;
    if (objc_opt_respondsToSelector()) {
      int v36 = [v8 supportsGFXIndirectCommandBuffers];
    }
    else {
      int v36 = 0;
    }
    v6[209] = v36;
    if (objc_opt_respondsToSelector()) {
      int v37 = [v8 supportsCMPIndirectCommandBuffers];
    }
    else {
      int v37 = 0;
    }
    v6[210] = v37;
    if (objc_opt_respondsToSelector()) {
      uint64_t v38 = [v8 supportsIndirectDrawAndDispatch];
    }
    else {
      uint64_t v38 = 0;
    }
    v6[212] = v38;
    if (objc_opt_respondsToSelector()) {
      v39 = [v8 supportsMeshShadersInICB];
    }
    else {
      v39 = 0;
    }
    v6[211] = v39;
    if (objc_opt_respondsToSelector()) {
      id v40 = [v8 supportsMemorylessRenderTargets];
    }
    else {
      id v40 = 0;
    }
    v6[137] = v40;
    if (objc_opt_respondsToSelector()) {
      uint64_t v41 = [v8 supportsRenderTargetTextureRotation];
    }
    else {
      uint64_t v41 = 0;
    }
    v6[140] = v41;
    if (objc_opt_respondsToSelector()) {
      id v42 = [v8 supportsNonUniformThreadgroupSize];
    }
    else {
      id v42 = 0;
    }
    v6[217] = v42;
    if (objc_opt_respondsToSelector()) {
      uint64_t v43 = [v8 supportsArgumentBuffersTier2];
    }
    else {
      uint64_t v43 = 0;
    }
    v6[136] = v43;
    if (objc_opt_respondsToSelector()) {
      uint64_t v44 = [v8 supportsConcurrentComputeDispatch];
    }
    else {
      uint64_t v44 = 0;
    }
    v6[218] = v44;
    if (objc_opt_respondsToSelector()) {
      long long v45 = [v8 supportsSharedStorageHeapResources];
    }
    else {
      long long v45 = 0;
    }
    v6[221] = v45;
    if (objc_opt_respondsToSelector()) {
      long long v46 = [v8 supportsSharedStorageTextures];
    }
    else {
      long long v46 = 0;
    }
    v6[138] = v46;
    if (objc_opt_respondsToSelector()) {
      long long v47 = [v8 supportsSharedTextureHandles];
    }
    else {
      long long v47 = 0;
    }
    v6[139] = v47;
    if (objc_opt_respondsToSelector()) {
      long long v48 = [v8 supportsDynamicAttributeStride];
    }
    else {
      long long v48 = 0;
    }
    v6[227] = v48;
    if (objc_opt_respondsToSelector()) {
      long long v49 = [v8 supportsNonSquareTileShaders];
    }
    else {
      long long v49 = 0;
    }
    v6[228] = v49;
    if (objc_opt_respondsToSelector()) {
      long long v50 = [v8 supportsLayeredRendering];
    }
    else {
      long long v50 = 0;
    }
    v6[229] = v50;
    if (objc_opt_respondsToSelector()) {
      long long v51 = [v8 supportsViewportAndScissorArray];
    }
    else {
      long long v51 = 0;
    }
    v6[230] = v51;
    if (objc_opt_respondsToSelector()) {
      long long v52 = [v8 supportsLinearTextureFromSharedBuffer];
    }
    else {
      long long v52 = 0;
    }
    v6[143] = v52;
    if (objc_opt_respondsToSelector()) {
      long long v53 = [v8 supportsNonPrivateDepthStencilTextures];
    }
    else {
      long long v53 = 0;
    }
    v6[144] = v53;
    if (objc_opt_respondsToSelector()) {
      long long v54 = [v8 supportsRenderToLinearTextures];
    }
    else {
      long long v54 = 0;
    }
    v6[145] = v54;
    if (objc_opt_respondsToSelector()) {
      long long v55 = [v8 supportsSeparateDepthStencil];
    }
    else {
      long long v55 = 0;
    }
    v6[147] = v55;
    if (objc_opt_respondsToSelector()) {
      uint64_t v56 = [v8 supportsRelaxedTextureViewRequirements];
    }
    else {
      uint64_t v56 = 0;
    }
    v6[148] = v56;
    if (objc_opt_respondsToSelector()) {
      v57 = [v8 supportsVariableRateRasterization];
    }
    else {
      v57 = 0;
    }
    v6[238] = v57;
    if (objc_opt_respondsToSelector()) {
      ssize_t v58 = [v8 supportsExtendedVertexFormats];
    }
    else {
      ssize_t v58 = 0;
    }
    v6[231] = v58;
    if (objc_opt_respondsToSelector()) {
      id v59 = [v8 supportsFunctionPointers];
    }
    else {
      id v59 = 0;
    }
    v6[203] = v59;
    if (objc_opt_respondsToSelector()) {
      char v60 = [v8 supportsFunctionPointersFromRender];
    }
    else {
      char v60 = 0;
    }
    v6[204] = v60;
    if (objc_opt_respondsToSelector()) {
      uint64_t v61 = [v8 supportsFunctionPointersFromMesh];
    }
    else {
      uint64_t v61 = 0;
    }
    v6[205] = v61;
    if (objc_opt_respondsToSelector()) {
      v62 = [v8 supportsDynamicLibraries];
    }
    else {
      v62 = 0;
    }
    v6[201] = v62;
    if (objc_opt_respondsToSelector()) {
      id v63 = [v8 supportsRenderDynamicLibraries];
    }
    else {
      id v63 = 0;
    }
    v6[202] = v63;
    if (objc_opt_respondsToSelector()) {
      uint64_t v64 = [v8 supportsDepthClipMode];
    }
    else {
      uint64_t v64 = 0;
    }
    v6[239] = v64;
    if (objc_opt_respondsToSelector()) {
      v65 = [v8 supportsDepthClipModeClampExtended];
    }
    else {
      v65 = 0;
    }
    v6[240] = v65;
    if (objc_opt_respondsToSelector()) {
      v66 = [v8 supportsSparseDepthAttachments];
    }
    else {
      v66 = 0;
    }
    v6[225] = v66;
    if (objc_opt_respondsToSelector()) {
      uint64_t v67 = [v8 supportsLossyCompression];
    }
    else {
      uint64_t v67 = 0;
    }
    v6[146] = v67;
    if (objc_opt_respondsToSelector()) {
      v68 = [v8 supportsTextureSwizzle];
    }
    else {
      v68 = 0;
    }
    v6[149] = v68;
    if (objc_opt_respondsToSelector()) {
      v69 = [v8 supportsTextureCubeArray];
    }
    else {
      v69 = 0;
    }
    v6[150] = v69;
    if (objc_opt_respondsToSelector()) {
      v70 = [v8 supportsTexture2DMultisampleArray];
    }
    else {
      v70 = 0;
    }
    v6[151] = v70;
    if (objc_opt_respondsToSelector()) {
      v71 = [v8 supportsLinearTexture2DArray];
    }
    else {
      v71 = 0;
    }
    v6[152] = v71;
    if (objc_opt_respondsToSelector()) {
      id v72 = [v8 supports2DLinearTexArraySPI];
    }
    else {
      id v72 = 0;
    }
    v6[153] = v72;
    if (objc_opt_respondsToSelector()) {
      v73 = [v8 supportsRGBA10A2Gamma];
    }
    else {
      v73 = 0;
    }
    v6[154] = v73;
    if (objc_opt_respondsToSelector()) {
      id v74 = [v8 supportsBGR10A2];
    }
    else {
      id v74 = 0;
    }
    v6[155] = v74;
    if (objc_opt_respondsToSelector()) {
      id v75 = [v8 supportsSRGBwrites];
    }
    else {
      id v75 = 0;
    }
    v6[156] = v75;
    if (objc_opt_respondsToSelector()) {
      id v76 = [v8 supportsBfloat16Format];
    }
    else {
      id v76 = 0;
    }
    v6[157] = v76;
    if (objc_opt_respondsToSelector()) {
      id v77 = [v8 supportsSamplerAddressModeClampToHalfBorder];
    }
    else {
      id v77 = 0;
    }
    v6[233] = v77;
    if (objc_opt_respondsToSelector()) {
      v78 = [v8 supportsCustomBorderColor];
    }
    else {
      v78 = 0;
    }
    v6[234] = v78;
    if (objc_opt_respondsToSelector()) {
      uint64_t v79 = [v8 supportsSamplerCompareFunction];
    }
    else {
      uint64_t v79 = 0;
    }
    v6[235] = v79;
    if (objc_opt_respondsToSelector()) {
      uint64_t v80 = [v8 supportsBlackOrWhiteSamplerBorderColors];
    }
    else {
      uint64_t v80 = 0;
    }
    v6[236] = v80;
    if (objc_opt_respondsToSelector()) {
      id v81 = [v8 supportsMirrorClampToEdgeSamplerMode];
    }
    else {
      id v81 = 0;
    }
    v6[237] = v81;
    if (objc_opt_respondsToSelector()) {
      id v82 = [v8 supportsPrimitiveMotionBlur];
    }
    else {
      id v82 = 0;
    }
    v6[158] = v82;
    if (objc_opt_respondsToSelector()) {
      id v83 = [v8 supportsRayTracingICBs];
    }
    else {
      id v83 = 0;
    }
    v6[159] = v83;
    if (objc_opt_respondsToSelector()) {
      id v84 = [v8 supportsRayTracingExtendedVertexFormats];
    }
    else {
      id v84 = 0;
    }
    v6[160] = v84;
    if (objc_opt_respondsToSelector()) {
      id v85 = [v8 supportsHeapAccelerationStructureAllocation];
    }
    else {
      id v85 = 0;
    }
    v6[226] = v85;
    if (objc_opt_respondsToSelector()) {
      id v86 = [v8 supportsRayTracingPerPrimitiveData];
    }
    else {
      id v86 = 0;
    }
    v6[161] = v86;
    if (objc_opt_respondsToSelector()) {
      v87 = [v8 supportsRayTracingBuffersFromTables];
    }
    else {
      v87 = 0;
    }
    v6[162] = v87;
    if (objc_opt_respondsToSelector()) {
      v88 = [v8 supportsRayTracingAccelerationStructureCPUDeserialization];
    }
    else {
      v88 = 0;
    }
    v6[163] = v88;
    if (objc_opt_respondsToSelector()) {
      v89 = [v8 supportsRayTracingMultiLevelInstancing];
    }
    else {
      v89 = 0;
    }
    v6[164] = v89;
    if (objc_opt_respondsToSelector()) {
      uint64_t v90 = [v8 supportsRayTracingIndirectInstanceAccelerationStructureBuild];
    }
    else {
      uint64_t v90 = 0;
    }
    v6[165] = v90;
    if (objc_opt_respondsToSelector()) {
      v91 = [v8 supportsRayTracingGPUTableUpdateBuffers];
    }
    else {
      v91 = 0;
    }
    v6[166] = v91;
    if (objc_opt_respondsToSelector()) {
      id v92 = [v8 supportsRayTracingCurves];
    }
    else {
      id v92 = 0;
    }
    v6[167] = v92;
    if (objc_opt_respondsToSelector()) {
      NSErrorUserInfoKey v93 = [v8 supportsBCTextureCompression];
    }
    else {
      NSErrorUserInfoKey v93 = 0;
    }
    v6[241] = v93;
    if (objc_opt_respondsToSelector()) {
      CFStringRef v94 = [v8 supports3DBCTextures];
    }
    else {
      CFStringRef v94 = 0;
    }
    v6[242] = v94;
    if (objc_opt_respondsToSelector()) {
      CFStringRef v95 = [v8 supportsMSAADepthResolve];
    }
    else {
      CFStringRef v95 = 0;
    }
    v6[243] = v95;
    if (objc_opt_respondsToSelector()) {
      CFStringRef v96 = [v8 supportsMSAAStencilResolve];
    }
    else {
      CFStringRef v96 = 0;
    }
    v6[244] = v96;
    if (objc_opt_respondsToSelector()) {
      v97 = [v8 supportsMSAADepthResolveFilter];
    }
    else {
      v97 = 0;
    }
    v6[245] = v97;
    if (objc_opt_respondsToSelector()) {
      long long v98 = [v8 supports32bpcMSAATextures];
    }
    else {
      long long v98 = 0;
    }
    v6[246] = v98;
    if (objc_opt_respondsToSelector()) {
      long long v99 = [v8 supports32BitMSAA];
    }
    else {
      long long v99 = 0;
    }
    v6[247] = v99;
    if (objc_opt_respondsToSelector()) {
      long long v100 = [v8 supportsNonPrivateMSAATextures];
    }
    else {
      long long v100 = 0;
    }
    v6[248] = v100;
    if (objc_opt_respondsToSelector()) {
      long long v101 = [v8 supportsCombinedMSAAStoreAndResolveAction];
    }
    else {
      long long v101 = 0;
    }
    v6[249] = v101;
    if (objc_opt_respondsToSelector()) {
      v102 = [v8 supportsMSAAStencilResolveFilter];
    }
    else {
      v102 = 0;
    }
    v6[250] = v102;
    if (objc_opt_respondsToSelector()) {
      v103 = [v8 supportsASTCTextureCompression];
    }
    else {
      v103 = 0;
    }
    v6[251] = v103;
    if (objc_opt_respondsToSelector()) {
      v104 = [v8 supports3DASTCTextures];
    }
    else {
      v104 = 0;
    }
    v6[252] = v104;
    if (objc_opt_respondsToSelector()) {
      v105 = [v8 supportsASTCHDRTextureCompression];
    }
    else {
      v105 = 0;
    }
    v6[253] = v105;
    if (objc_opt_respondsToSelector()) {
      v106 = [v8 supportsLimitedYUVFormats];
    }
    else {
      v106 = 0;
    }
    v6[254] = v106;
    if (objc_opt_respondsToSelector()) {
      v107 = [v8 supportsExtendedYUVFormats];
    }
    else {
      v107 = 0;
    }
    v6[255] = v107;
    if (objc_opt_respondsToSelector()) {
      v108 = [v8 supportsAlphaYUVFormats];
    }
    else {
      v108 = 0;
    }
    v6[256] = v108;
    if (objc_opt_respondsToSelector()) {
      v109 = [v8 supportsYCBCRFormats];
    }
    else {
      v109 = 0;
    }
    v6[257] = v109;
    if (objc_opt_respondsToSelector()) {
      v110 = [v8 supportsYCBCRFormatsPQ];
    }
    else {
      v110 = 0;
    }
    v6[258] = v110;
    if (objc_opt_respondsToSelector()) {
      v111 = [v8 supportsYCBCRFormats12];
    }
    else {
      v111 = 0;
    }
    v6[259] = v111;
    if (objc_opt_respondsToSelector()) {
      v112 = [v8 supportsYCBCRFormatsXR];
    }
    else {
      v112 = 0;
    }
    v6[260] = v112;
    if (objc_opt_respondsToSelector()) {
      v113 = [v8 supportsYCBCRPackedFormatsPQ];
    }
    else {
      v113 = 0;
    }
    v6[261] = v113;
    if (objc_opt_respondsToSelector()) {
      v114 = [v8 supportsYCBCRPackedFormats12];
    }
    else {
      v114 = 0;
    }
    v6[262] = v114;
    if (objc_opt_respondsToSelector()) {
      v115 = [v8 supportsYCBCRPackedFormatsXR];
    }
    else {
      v115 = 0;
    }
    v6[263] = v115;
    if (objc_opt_respondsToSelector()) {
      v116 = [v8 supportsPublicXR10Formats];
    }
    else {
      v116 = 0;
    }
    v6[264] = v116;
    if (objc_opt_respondsToSelector()) {
      v117 = [v8 supportsExtendedXR10Formats];
    }
    else {
      v117 = 0;
    }
    v118 = 0;
    v6[265] = v117;
    do
    {
      v119 = (unsigned __int16)word_10002BB20[v118];
      v127 = 0;
      v125 = 0u;
      v126 = 0u;
      outputStruct = 0u;
      MTLPixelFormatGetInfoForDevice();
      v120 = WORD4(outputStruct);
      v121 = &v5[12 * v119];
      *(_DWORD *)v121 = DWORD2(outputStruct);
      *((_WORD *)v121 + 2) = v119;
      if ((v120 & 0x400) == 0) {
        *(_WORD *)&v5[12 * v119 + 6] = BYTE1(v126);
      }
      if ((v120 & 0x461) == 1)
      {
        v122 = &v5[12 * v119];
        *((_WORD *)v122 + 4) = (unsigned __int16)[v8 minimumLinearTextureAlignmentForPixelFormat:v119];
        *((_WORD *)v122 + 5) = (unsigned __int16)[v8 minimumTextureBufferAlignmentForPixelFormat:v119];
      }
      ++v118;
    }
    while (v118 != 275);
    v6[267] = +[MTLFXSpatialScalerDescriptor supportsDevice:v8];
    v6[266] = +[MTLFXTemporalScalerDescriptor supportsDevice:v8];
  }
  else
  {
    v6[88] = 1;
  }

  return v5;
}

uint64_t sub_100021F90(uint64_t *a1, uint64_t a2, void *a3)
{
  id v22 = a3;
  unint64_t v5 = *((unsigned int *)a1 + 2);
  if (v5)
  {
    uint64_t v6 = 0;
    unint64_t v7 = 0;
    char v8 = 1;
    do
    {
      uint64_t v9 = *a1;
      uint64_t v10 = *(void *)(*a1 + v6);
      if (*(unsigned char *)(a2 + 12 * *(unsigned __int16 *)(v10 + 34)))
      {
        id v11 = v22;
        id v12 = objc_alloc_init((Class)MTLTextureDescriptor);
        [v12 setTextureType:*(unsigned __int8 *)(v10 + 49)];
        [v12 setPixelFormat:*(unsigned __int16 *)(v10 + 34)];
        [v12 setWidth:*(unsigned int *)(v10 + 24)];
        [v12 setHeight:*(unsigned __int16 *)(v10 + 32)];
        [v12 setDepth:*(unsigned __int16 *)(v10 + 30)];
        [v12 setMipmapLevelCount:*(unsigned __int8 *)(v10 + 45)];
        [v12 setSampleCount:*(unsigned __int8 *)(v10 + 47)];
        [v12 setArrayLength:*(unsigned __int16 *)(v10 + 28)];
        [v12 setUsage:*(unsigned int *)(v10 + 20)];
        [v12 setResourceOptions:*(unsigned __int16 *)(v10 + 36)];
        if (objc_opt_respondsToSelector()) {
          [v12 setSwizzleKey:*(unsigned int *)(v10 + 16)];
        }
        if (objc_opt_respondsToSelector()) {
          [v12 setRotation:*(unsigned __int8 *)(v10 + 46)];
        }
        if (objc_opt_respondsToSelector()) {
          [v12 setAllowGPUOptimizedContents:*(unsigned char *)(v10 + 38) != 0];
        }
        if (objc_opt_respondsToSelector()) {
          [v12 setSparseSurfaceDefaultValue:*(unsigned __int8 *)(v10 + 48)];
        }
        if (objc_opt_respondsToSelector()) {
          [v12 setWriteSwizzleEnabled:*(unsigned char *)(v10 + 50) != 0];
        }
        if (objc_opt_respondsToSelector())
        {
          [v12 setCompressionType:*(unsigned __int8 *)(v10 + 41)];
        }
        else if (objc_opt_respondsToSelector())
        {
          [v12 setLossyCompressionMode:*(unsigned __int8 *)(v10 + 41)];
        }
        if (objc_opt_respondsToSelector()) {
          [v12 setCompressionFootprint:*(unsigned __int8 *)(v10 + 39)];
        }
        if (objc_opt_respondsToSelector()) {
          [v12 setCompressionMode:*(unsigned __int8 *)(v10 + 40)];
        }
        [v12 setAllowGPUOptimizedContents:*(unsigned char *)(v10 + 38) != 0];
        [v12 setFramebufferOnly:*(unsigned char *)(v10 + 43) != 0];
        [v12 setIsDrawable:*(unsigned char *)(v10 + 44) != 0];
        id v13 = [v11 heapTextureSizeAndAlignWithDescriptor:v12];
        unint64_t v15 = v14;

        uint64_t v16 = v9 + v6;
        unint64_t v17 = *(void *)(v9 + v6 + 8);
        unint64_t v18 = *(void *)(v16 + 16);

        BOOL v20 = v17 >= v15 && v18 <= (unint64_t)v13;
        v8 &= v20;
        unint64_t v5 = *((unsigned int *)a1 + 2);
      }
      ++v7;
      v6 += 24;
    }
    while (v7 < v5);
  }
  else
  {
    char v8 = 1;
  }

  return v8 & 1;
}

uint64_t sub_1000222B4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (*(unsigned char *)(a2 + 49623) && *(_DWORD *)(a1 + 8))
  {
    uint64_t v6 = 0;
    unint64_t v7 = 0;
    int v8 = 1;
    do
    {
      uint64_t v9 = (void *)(*(void *)a1 + v6);
      if (v9[2] > (unint64_t)[v5 heapAccelerationStructureSizeAndAlignWithSize:*v9]) {
        int v11 = 0;
      }
      else {
        int v11 = v8;
      }
      if (v9[1] >= v10) {
        int v8 = v11;
      }
      else {
        int v8 = 0;
      }
      ++v7;
      v6 += 24;
    }
    while (v7 < *(unsigned int *)(a1 + 8));
    uint64_t v12 = v8 & 1;
  }
  else
  {
    uint64_t v12 = 1;
  }

  return v12;
}

vm_address_t sub_100022368(memory_object_size_t a1)
{
  kern_return_t memory_entry_64;
  mach_error_t v3;
  char *v4;
  const char *v5;
  kern_return_t v6;
  mach_error_t v7;
  char *v9;
  memory_object_size_t size;
  mach_port_t object_handle;
  vm_address_t address;
  uint8_t buf[4];
  mach_error_t v14;
  __int16 v15;
  char *v16;

  address = 0;
  object_handle = 0;
  size = a1;
  memory_entry_64 = mach_make_memory_entry_64(mach_task_self_, &size, 0, 139267, &object_handle, 0);
  if (memory_entry_64)
  {
    id v3 = memory_entry_64;
    sub_100023110();
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      id v4 = mach_error_string(v3);
      *(_DWORD *)buf = 67109378;
      unint64_t v14 = v3;
      unint64_t v15 = 2080;
      uint64_t v16 = v4;
      id v5 = "warning: failed to create memory entry error 0x%x (%s)";
LABEL_10:
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, v5, buf, 0x12u);
    }
  }
  else
  {
    uint64_t v6 = vm_map(mach_task_self_, &address, a1, 0, 1, object_handle, 0, 0, 3, 3, 1u);
    if (!v6)
    {
      mach_port_deallocate(mach_task_self_, object_handle);
      return address;
    }
    unint64_t v7 = v6;
    sub_100023110();
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = mach_error_string(v7);
      *(_DWORD *)buf = 67109378;
      unint64_t v14 = v7;
      unint64_t v15 = 2080;
      uint64_t v16 = v9;
      id v5 = "warning: failed to map memory error 0x%x (%s)";
      goto LABEL_10;
    }
  }
  return 0;
}

uint64_t sub_100022514(uint64_t a1)
{
  if (qword_100041D00 == a1) {
    qword_100041D00 = 0;
  }
  return 0;
}

void apr_pool_destroy(apr_pool_t *p)
{
  for (uint64_t i = *((void *)p + 14); i; uint64_t i = *((void *)p + 14))
  {
    *((void *)p + 14) = *(void *)i;
    (*(void (**)(void))(i + 16))(*(void *)(i + 8));
  }
  *((void *)p + 14) = 0;
  while (1)
  {
    id v3 = (apr_pool_t *)*((void *)p + 1);
    if (!v3) {
      break;
    }
    apr_pool_destroy(v3);
  }
  while (1)
  {
    uint64_t v4 = *((void *)p + 4);
    if (!v4) {
      break;
    }
    *((void *)p + 4) = *(void *)v4;
    (*(void (**)(void))(v4 + 16))(*(void *)(v4 + 8));
  }
  uint64_t v5 = *((void *)p + 7);
  if (!v5) {
    goto LABEL_42;
  }
  uint64_t v6 = *((void *)p + 7);
  do
  {
    if (sub_100022DAC(*(pid_t **)v6, 1) != 70006) {
      *(_DWORD *)(v6 + 8) = 0;
    }
    uint64_t v6 = *(void *)(v6 + 16);
  }
  while (v6);
  uint64_t v7 = v5;
  do
  {
    int v8 = *(_DWORD *)(v7 + 8);
    if (v8 == 1)
    {
      sub_10002303C(**(_DWORD **)v7, 9);
    }
    else
    {
      BOOL v9 = v8 == 4 || v8 == 2;
      if (v9 && !sub_10002303C(**(_DWORD **)v7, 15)) {
        LODWORD(v6) = 1;
      }
    }
    uint64_t v7 = *(void *)(v7 + 16);
  }
  while (v7);
  uint64_t v10 = v5;
  if (!v6) {
    goto LABEL_36;
  }
  long long v32 = xmmword_10002BA90;
  select(0, 0, 0, 0, (timeval *)&v32);
  unint64_t v11 = 46875;
  while (2)
  {
    uint64_t v12 = 0;
    uint64_t v13 = v5;
    do
    {
      uint64_t v14 = v12;
      if (*(_DWORD *)(v13 + 8) == 2)
      {
        uint64_t v12 = 1;
        if (sub_100022DAC(*(pid_t **)v13, 1) == 70006) {
          goto LABEL_31;
        }
        *(_DWORD *)(v13 + 8) = 0;
      }
      uint64_t v12 = v14;
LABEL_31:
      uint64_t v13 = *(void *)(v13 + 16);
    }
    while (v13);
    if (v12 && v11 <= 0x2DC6BF)
    {
      *(void *)&long long v32 = v11 / 0xF4240;
      *((void *)&v32 + 1) = v11 % 0xF4240;
      select(0, 0, 0, 0, (timeval *)&v32);
      v11 *= 2;
      continue;
    }
    break;
  }
  uint64_t v10 = v5;
  do
  {
LABEL_36:
    if (*(_DWORD *)(v10 + 8) == 2) {
      sub_10002303C(**(_DWORD **)v10, 9);
    }
    uint64_t v10 = *(void *)(v10 + 16);
  }
  while (v10);
  do
  {
    if (*(_DWORD *)(v5 + 8)) {
      sub_100022DAC(*(pid_t **)v5, 0);
    }
    uint64_t v5 = *(void *)(v5 + 16);
  }
  while (v5);
LABEL_42:
  if (*(void *)p)
  {
    uint64_t v15 = *(void *)(*(void *)(*(void *)p + 48) + 24);
    if (v15) {
      pthread_mutex_lock((pthread_mutex_t *)(v15 + 8));
    }
    uint64_t v16 = *((void *)p + 2);
    **((void **)p + 3) = v16;
    if (v16) {
      *(void *)(*((void *)p + 2) + 24) = *((void *)p + 3);
    }
    if (v15) {
      pthread_mutex_unlock((pthread_mutex_t *)(v15 + 8));
    }
  }
  vm_address_t v17 = *((void *)p + 6);
  vm_address_t v18 = *((void *)p + 12);
  **(void **)(v18 + 8) = 0;
  if (*(apr_pool_t **)(v17 + 32) == p)
  {
    *(void *)(v17 + 24) = 0;
  }
  else
  {
    uint64_t v19 = *(void *)(v17 + 24);
    if (v19) {
      pthread_mutex_lock((pthread_mutex_t *)(v19 + 8));
    }
  }
  vm_address_t v20 = 0;
  unint64_t v21 = *(void *)v17;
  uint64_t v22 = *(void *)(v17 + 8);
  unint64_t v23 = *(void *)(v17 + 16);
  do
  {
    while (1)
    {
      while (1)
      {
        vm_address_t v24 = v18;
        vm_address_t v18 = *(void *)v18;
        unint64_t v25 = *(unsigned int *)(v24 + 16);
        if (!v22 || v23 > v25) {
          break;
        }
        *(void *)vm_address_t v24 = v20;
        vm_address_t v20 = v24;
        if (!v18) {
          goto LABEL_72;
        }
      }
      if (v25 > 0x13) {
        break;
      }
      vm_address_t v26 = v17 + 8 * v25;
      uint64_t v27 = *(void *)(v26 + 40);
      *(void *)vm_address_t v24 = v27;
      if (v21 < v25 && v27 == 0) {
        unint64_t v21 = v25;
      }
      *(void *)(v26 + 40) = v24;
      if (v23 <= v25)
      {
        unint64_t v23 = 0;
        if (!v18) {
          goto LABEL_72;
        }
      }
      else
      {
        v23 += ~v25;
        if (!v18) {
          goto LABEL_72;
        }
      }
    }
    *(void *)vm_address_t v24 = *(void *)(v17 + 40);
    *(void *)(v17 + 40) = v24;
    BOOL v29 = v23 > v25;
    v23 += ~v25;
    if (!v29) {
      unint64_t v23 = 0;
    }
  }
  while (v18);
LABEL_72:
  *(void *)vm_address_t v17 = v21;
  *(void *)(v17 + 16) = v23;
  uint64_t v30 = *(void *)(v17 + 24);
  if (v30) {
    pthread_mutex_unlock((pthread_mutex_t *)(v30 + 8));
  }
  if (v20)
  {
    do
    {
      vm_address_t v31 = *(void *)v20;
      vm_deallocate(mach_task_self_, v20, ((*(_DWORD *)(v20 + 16) << 12) + 4096));
      vm_address_t v20 = v31;
    }
    while (v31);
  }
  if (*(apr_pool_t **)(v17 + 32) == p) {
    sub_1000228C4(v17);
  }
}

uint64_t sub_1000228C4(vm_address_t address)
{
  for (uint64_t i = 0; i != 20; ++i)
  {
    vm_address_t v3 = address + 8 * i;
    vm_address_t v6 = *(void *)(v3 + 40);
    uint64_t v5 = (vm_address_t *)(v3 + 40);
    vm_address_t v4 = v6;
    if (v6)
    {
      do
      {
        vm_address_t *v5 = *(void *)v4;
        vm_deallocate(mach_task_self_, v4, ((*(_DWORD *)(v4 + 16) << 12) + 4096));
        vm_address_t v4 = *v5;
      }
      while (*v5);
    }
  }
  vm_map_t v7 = mach_task_self_;

  return vm_deallocate(v7, address, 0xC8uLL);
}

void *sub_100022950(unint64_t *a1, unint64_t a2)
{
  uint64_t v2 = 0;
  unint64_t v3 = (a2 + 4135) & 0xFFFFFFFFFFFFF000;
  unint64_t v4 = 0x2000;
  if (v3 > 0x2000) {
    unint64_t v4 = (a2 + 4135) & 0xFFFFFFFFFFFFF000;
  }
  if (v3 >= a2) {
    memory_object_size_t v5 = v4;
  }
  else {
    memory_object_size_t v5 = 0;
  }
  if (v3 >= a2)
  {
    unint64_t v6 = v4 >> 12;
    unint64_t v7 = (v4 >> 12) - 1;
    if (HIDWORD(v7)) {
      return 0;
    }
    unint64_t v9 = *a1;
    if (v7 <= *a1)
    {
      unint64_t v14 = a1[3];
      if (v14)
      {
        pthread_mutex_lock((pthread_mutex_t *)(v14 + 8));
        unint64_t v9 = *a1;
      }
      uint64_t v15 = &a1[v7];
      vm_address_t v17 = (void *)v15[5];
      uint64_t v16 = v15 + 5;
      uint64_t v2 = v17;
      BOOL v18 = v17 == 0;
      BOOL v19 = v7 < v9;
      if (v17) {
        BOOL v20 = 1;
      }
      else {
        BOOL v20 = v7 >= v9;
      }
      if (!v20)
      {
        do
        {
          unint64_t v21 = (void *)v16[1];
          ++v16;
          uint64_t v2 = v21;
          BOOL v18 = v21 == 0;
          BOOL v19 = v6 < v9;
          if (v21) {
            BOOL v22 = 1;
          }
          else {
            BOOL v22 = v6 >= v9;
          }
          ++v6;
        }
        while (!v22);
      }
      if (!v18)
      {
        uint64_t v25 = *v2;
        *uint64_t v16 = *v2;
        if (v25) {
          BOOL v19 = 1;
        }
        if (!v19)
        {
          vm_address_t v26 = v16 - 1;
          do
          {
            if (*v26--) {
              BOOL v28 = 1;
            }
            else {
              BOOL v28 = v9 == 1;
            }
            --v9;
          }
          while (!v28);
          *a1 = v9;
        }
        uint64_t v13 = (*((_DWORD *)v2 + 4) + 1);
LABEL_43:
        unint64_t v29 = a1[2] + v13;
        if (v29 >= a1[1]) {
          unint64_t v29 = a1[1];
        }
        a1[2] = v29;
        unint64_t v30 = a1[3];
        if (v30) {
          pthread_mutex_unlock((pthread_mutex_t *)(v30 + 8));
        }
        goto LABEL_47;
      }
    }
    else
    {
      uint64_t v2 = a1 + 5;
      if (!a1[5])
      {
LABEL_30:
        vm_address_t v24 = sub_100022368(v5);
        uint64_t v2 = (void *)v24;
        if (!v24) {
          return v2;
        }
        *(_DWORD *)(v24 + 16) = v7;
        *(void *)(v24 + 32) = v24 + v5;
LABEL_47:
        *uint64_t v2 = 0;
        v2[3] = v2 + 5;
        return v2;
      }
      unint64_t v10 = a1[3];
      if (v10) {
        pthread_mutex_lock((pthread_mutex_t *)(v10 + 8));
      }
      while (1)
      {
        unint64_t v11 = v2;
        uint64_t v2 = (void *)*v2;
        if (!v2) {
          break;
        }
        unint64_t v12 = *((unsigned int *)v2 + 4);
        if (v7 <= v12)
        {
          void *v11 = *v2;
          uint64_t v13 = (v12 + 1);
          goto LABEL_43;
        }
      }
    }
    unint64_t v23 = a1[3];
    if (v23) {
      pthread_mutex_unlock((pthread_mutex_t *)(v23 + 8));
    }
    goto LABEL_30;
  }
  return v2;
}

apr_status_t apr_pool_create_ex(apr_pool_t **newpool, apr_pool_t *parent, apr_abortfunc_t abort_fn, apr_allocator_t *allocator)
{
  unint64_t v4 = (unint64_t *)allocator;
  apr_abortfunc_t v5 = abort_fn;
  *newpool = 0;
  if (parent) {
    unint64_t v7 = parent;
  }
  else {
    unint64_t v7 = (apr_pool_t *)qword_100041D18;
  }
  if (!abort_fn && v7) {
    apr_abortfunc_t v5 = (apr_abortfunc_t)*((void *)v7 + 8);
  }
  if (!allocator) {
    unint64_t v4 = (unint64_t *)*((void *)v7 + 6);
  }
  int v8 = (apr_pool_t *)sub_100022950(v4, 0x1FD8uLL);
  if (v8)
  {
    *(void *)int v8 = v8;
    *((void *)v8 + 1) = v8;
    unint64_t v9 = (apr_pool_t **)*((void *)v8 + 3);
    *((void *)v8 + 3) = v9 + 15;
    v9[12] = v8;
    v9[13] = (apr_pool_t *)(v9 + 15);
    v9[14] = 0;
    v9[6] = (apr_pool_t *)v4;
    v9[7] = 0;
    v9[4] = 0;
    v9[5] = 0;
    v9[10] = 0;
    v9[11] = v8;
    v9[8] = (apr_pool_t *)v5;
    v9[9] = 0;
    void *v9 = v7;
    v9[1] = 0;
    if (v7)
    {
      uint64_t v10 = *(void *)(*((void *)v7 + 6) + 24);
      if (v10) {
        pthread_mutex_lock((pthread_mutex_t *)(v10 + 8));
      }
      uint64_t v13 = (apr_pool_t *)*((void *)v7 + 1);
      unint64_t v12 = (apr_pool_t ***)((char *)v7 + 8);
      unint64_t v11 = v13;
      _DWORD v9[2] = v13;
      if (v13) {
        *((void *)v11 + 3) = v9 + 2;
      }
      uint8_t *v12 = v9;
      v9[3] = (apr_pool_t *)v12;
      if (v10) {
        pthread_mutex_unlock((pthread_mutex_t *)(v10 + 8));
      }
    }
    else
    {
      _DWORD v9[2] = 0;
      v9[3] = 0;
    }
    apr_status_t v14 = 0;
    *newpool = (apr_pool_t *)v9;
  }
  else
  {
    apr_status_t v14 = 12;
    if (v5) {
      ((void (*)(uint64_t))v5)(12);
    }
  }
  return v14;
}

uint64_t sub_100022C10(uint64_t a1, unint64_t a2)
{
  unint64_t v3 = (a2 + 7) & 0xFFFFFFFFFFFFFFF8;
  if (v3 < a2)
  {
LABEL_2:
    unint64_t v4 = *(void (**)(uint64_t))(a1 + 64);
    if (v4) {
      v4(12);
    }
    return 0;
  }
  unint64_t v6 = *(void **)(a1 + 88);
  uint64_t result = v6[3];
  if (v3 <= v6[4] - result)
  {
    v6[3] = result + v3;
    return result;
  }
  unint64_t v7 = (void *)*v6;
  if (v3 <= *(void *)(*v6 + 32) - *(void *)(*v6 + 24))
  {
    *(void *)v7[1] = *v7;
    *(void *)(*v7 + 8) = v7[1];
  }
  else
  {
    unint64_t v7 = sub_100022950(*(unint64_t **)(a1 + 48), (a2 + 7) & 0xFFFFFFFFFFFFFFF8);
    if (!v7) {
      goto LABEL_2;
    }
  }
  *((_DWORD *)v7 + 5) = 0;
  uint64_t result = v7[3];
  v7[3] = result + v3;
  int v8 = (void *)v6[1];
  v7[1] = v8;
  void *v8 = v7;
  *unint64_t v7 = v6;
  v6[1] = v7;
  *(void *)(a1 + 88) = v7;
  unint64_t v9 = (uint64_t)(v6[4] - v6[3]) >> 12;
  *((_DWORD *)v6 + 5) = v9;
  if (v9 < *(unsigned int *)(*v6 + 20))
  {
    uint64_t v10 = (uint64_t *)*v6;
    do
      uint64_t v10 = (uint64_t *)*v10;
    while (*((_DWORD *)v10 + 5) > v9);
    *unint64_t v7 = *v6;
    *(void *)(*v6 + 8) = v6[1];
    unint64_t v11 = (void *)v10[1];
    v6[1] = v11;
    void *v11 = v6;
    void *v6 = v10;
    v10[1] = (uint64_t)v6;
  }
  return result;
}

void *sub_100022D38(void *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (result)
  {
    uint64_t v7 = (uint64_t)result;
    uint64_t result = (void *)result[5];
    if (result) {
      *(void *)(v7 + 40) = *result;
    }
    else {
      uint64_t result = (void *)sub_100022C10(v7, 0x20uLL);
    }
    result[2] = a3;
    result[3] = a4;
    *uint64_t result = *(void *)(v7 + 32);
    result[1] = a2;
    *(void *)(v7 + 32) = result;
  }
  return result;
}

uint64_t sub_100022DA4()
{
  return 0;
}

uint64_t sub_100022DAC(pid_t *a1, int a2)
{
  int v6 = 0;
  if (a2) {
    int v3 = 3;
  }
  else {
    int v3 = 2;
  }
  while (1)
  {
    pid_t v4 = waitpid(*a1, &v6, v3);
    if ((v4 & 0x80000000) == 0) {
      break;
    }
    if (*__error() != 4) {
      return *__error();
    }
  }
  if (!v4) {
    return 70006;
  }
  *a1 = v4;
  if ((~v6 & 0x7F) != 0) {
    return 70005;
  }
  else {
    return 20014;
  }
}

apr_status_t apr_initialize(void)
{
  if (dword_100041D20++) {
    return 0;
  }
  if (!byte_100041D08++)
  {
    qword_100041D10 = 0;
    vm_address_t v4 = sub_100022368(0xC8uLL);
    if (!v4)
    {
      byte_100041D08 = 0;
      return 12;
    }
    *(_OWORD *)vm_address_t v4 = 0u;
    *(_OWORD *)(v4 + 16) = 0u;
    *(void *)(v4 + 192) = 0;
    *(_OWORD *)(v4 + 160) = 0u;
    *(_OWORD *)(v4 + 176) = 0u;
    *(_OWORD *)(v4 + 128) = 0u;
    *(_OWORD *)(v4 + 144) = 0u;
    *(_OWORD *)(v4 + 96) = 0u;
    *(_OWORD *)(v4 + 112) = 0u;
    *(_OWORD *)(v4 + 64) = 0u;
    *(_OWORD *)(v4 + 80) = 0u;
    *(_OWORD *)(v4 + 32) = 0u;
    *(_OWORD *)(v4 + 48) = 0u;
    qword_100041D10 = v4;
    *(int64x2_t *)(v4 + 8) = vdupq_n_s64(0x8000uLL);
    apr_status_t v5 = apr_pool_create_ex((apr_pool_t **)&qword_100041D18, 0, 0, (apr_allocator_t *)v4);
    if (v5)
    {
      apr_status_t v1 = v5;
      sub_1000228C4(qword_100041D10);
      qword_100041D10 = 0;
      byte_100041D08 = 0;
      return v1;
    }
    uint64_t v6 = qword_100041D18;
    *(void *)(qword_100041D18 + 80) = "apr_global_pool";
    if (qword_100041D00)
    {
LABEL_20:
      newpool = 0;
      apr_status_t v10 = sub_10002306C(&newpool, v6);
      if (!v10)
      {
        uint64_t v11 = qword_100041D10;
        uint64_t v12 = qword_100041D18;
        *(void *)(qword_100041D10 + 24) = newpool;
        *(void *)(v11 + 32) = v12;
        goto LABEL_5;
      }
    }
    else
    {
      uint64_t v7 = sub_100022C10(v6, 0x38uLL);
      qword_100041D00 = v7;
      int v8 = *(void **)(v6 + 40);
      if (v8) {
        *(void *)(v6 + 40) = *v8;
      }
      else {
        int v8 = (void *)sub_100022C10(v6, 0x20uLL);
      }
      uint64_t v9 = 0;
      v8[1] = v7;
      v8[2] = sub_100022514;
      v8[3] = sub_100022DA4;
      void *v8 = *(void *)(v6 + 32);
      *(void *)(v6 + 32) = v8;
      while (1)
      {
        apr_status_t v10 = sub_10002306C((void *)(qword_100041D00 + v9), v6);
        if (v10) {
          break;
        }
        v9 += 8;
        if (v9 == 56)
        {
          uint64_t v6 = qword_100041D18;
          goto LABEL_20;
        }
      }
    }
    return v10;
  }
LABEL_5:
  newpool = 0;
  if (apr_pool_create_ex(&newpool, 0, 0, 0)) {
    return 20002;
  }
  apr_status_t v1 = 0;
  *((void *)newpool + 10) = "apr_initialize";
  return v1;
}

uint64_t sub_10002303C(pid_t a1, int a2)
{
  if (kill(a1, a2) == -1) {
    return *__error();
  }
  else {
    return 0;
  }
}

uint64_t sub_10002306C(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_100022C10(a2, 0x48uLL);
  apr_status_t v5 = (void **)v4;
  if (v4)
  {
    *(_OWORD *)(v4 + 56) = 0u;
    *(_OWORD *)(v4 + 40) = 0u;
    *(_OWORD *)(v4 + 24) = 0u;
    *(_OWORD *)(v4 + 8) = 0u;
  }
  *(void *)uint64_t v4 = a2;
  uint64_t result = pthread_mutex_init((pthread_mutex_t *)(v4 + 8), 0);
  if (!result)
  {
    sub_100022D38(*v5, (uint64_t)v5, (uint64_t)sub_100023108, (uint64_t)sub_100022DA4);
    uint64_t result = 0;
    *a1 = v5;
  }
  return result;
}

uint64_t sub_100023108(uint64_t a1)
{
  return pthread_mutex_destroy((pthread_mutex_t *)(a1 + 8));
}

void *sub_100023110()
{
  if (qword_100041D28 != -1) {
    dispatch_once(&qword_100041D28, &stru_100035018);
  }

  return &_os_log_default;
}

void sub_100023164(id a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)apr_status_t v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "GPUTOOLS(warning): Log uninitialized, please call GTCoreLogInit(), logging to OS_LOG_DEFAULT instead", v1, 2u);
  }
}

uint64_t GTCorePlatformGet()
{
  return 1;
}

id PrettifyFenumString(void *a1, int a2, int a3)
{
  id v5 = a1;
  if (v5)
  {
    uint64_t v6 = v5;
    if ([v5 hasPrefix:@"kDYFE"])
    {
      uint64_t v7 = [v6 substringFromIndex:5];

      uint64_t v6 = (void *)v7;
    }
    id v8 = [v6 rangeOfString:@"_"];
    if (v8 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v10 = [v6 stringByReplacingOccurrencesOfString:@"_" withString:@" " options:0 range:v8];

      uint64_t v6 = (void *)v10;
    }
    uint64_t v11 = [v6 stringByReplacingOccurrencesOfString:@"_" withString:@":"];

    CFStringRef v12 = @"-";
    if (a2) {
      CFStringRef v12 = @"+";
    }
    CFStringRef v13 = &stru_100035040;
    if (a3) {
      CFStringRef v13 = @":";
    }
    apr_status_t v14 = +[NSString stringWithFormat:@"%@[%@%@]", v12, v11, v13];
  }
  else
  {
    apr_status_t v14 = 0;
  }

  return v14;
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreate(allocator, values, numValues, callBacks);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t CSIsNull()
{
  return _CSIsNull();
}

uint64_t CSRelease()
{
  return _CSRelease();
}

uint64_t CSSymbolicatorCreateSignature()
{
  return _CSSymbolicatorCreateSignature();
}

uint64_t CSSymbolicatorCreateWithPid()
{
  return _CSSymbolicatorCreateWithPid();
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return _IOConnectCallStructMethod(connection, selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return _IOServiceGetMatchingService(mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return _IOServiceOpen(service, owningTask, type, connect);
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t MGCopyMultipleAnswers()
{
  return _MGCopyMultipleAnswers();
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

id MTLCreateSystemDefaultDevice(void)
{
  return _MTLCreateSystemDefaultDevice();
}

uint64_t MTLPixelFormatGetInfoForDevice()
{
  return _MTLPixelFormatGetInfoForDevice();
}

uint64_t MTLSetReportFailureBlock()
{
  return _MTLSetReportFailureBlock();
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return _NSSelectorFromString(aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromProtocol(Protocol *proto)
{
  return _NSStringFromProtocol(proto);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

CFStringRef SecTaskCopySigningIdentifier(SecTaskRef task, CFErrorRef *error)
{
  return _SecTaskCopySigningIdentifier(task, error);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return _SecTaskCopyValueForEntitlement(task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return _SecTaskCreateWithAuditToken(allocator, token);
}

uint32_t SecTaskGetCodeSignStatus(SecTaskRef task)
{
  return _SecTaskGetCodeSignStatus(task);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFCopySystemVersionDictionary()
{
  return __CFCopySystemVersionDictionary();
}

uint64_t _CFURLAttachSecurityScopeToFileURL()
{
  return __CFURLAttachSecurityScopeToFileURL();
}

int *__error(void)
{
  return ___error();
}

uint64_t _os_assumes_log()
{
  return __os_assumes_log();
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

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return _close(a1);
}

size_t compression_decode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return _compression_decode_buffer(dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, algorithm);
}

size_t compression_encode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return _compression_encode_buffer(dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, algorithm);
}

compression_status compression_stream_destroy(compression_stream *stream)
{
  return _compression_stream_destroy(stream);
}

compression_status compression_stream_init(compression_stream *stream, compression_stream_operation operation, compression_algorithm algorithm)
{
  return _compression_stream_init(stream, operation, algorithm);
}

compression_status compression_stream_process(compression_stream *stream, int flags)
{
  return _compression_stream_process(stream, flags);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
}

void dispatch_main(void)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void exit(int a1)
{
}

void free(void *a1)
{
}

int fsync(int a1)
{
  return _fsync(a1);
}

int ftruncate(int a1, off_t a2)
{
  return _ftruncate(a1, a2);
}

char *__cdecl getenv(const char *a1)
{
  return _getenv(a1);
}

int gethostuuid(uuid_t a1, const timespec *a2)
{
  return _gethostuuid(a1, a2);
}

pid_t getppid(void)
{
  return _getppid();
}

passwd *__cdecl getpwnam(const char *a1)
{
  return _getpwnam(a1);
}

int kill(pid_t a1, int a2)
{
  return _kill(a1, a2);
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return _mach_error_string(error_value);
}

kern_return_t mach_make_memory_entry_64(vm_map_t target_task, memory_object_size_t *size, memory_object_offset_t offset, vm_prot_t permission, mach_port_t *object_handle, mem_entry_name_port_t parent_entry)
{
  return _mach_make_memory_entry_64(target_task, size, offset, permission, object_handle, parent_entry);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return _mach_port_deallocate(task, name);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
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

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

uint64_t os_variant_has_internal_content()
{
  return _os_variant_has_internal_content();
}

objc_method_description *__cdecl protocol_copyMethodDescriptionList(Protocol *p, BOOL isRequiredMethod, BOOL isInstanceMethod, unsigned int *outCount)
{
  return _protocol_copyMethodDescriptionList(p, isRequiredMethod, isInstanceMethod, outCount);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return _pthread_mutex_destroy(a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return _pthread_mutex_init(a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return _pthread_mutex_lock(a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return _pthread_mutex_unlock(a1);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return _read(a1, a2, a3);
}

uint64_t sandbox_extension_issue_file_to_process()
{
  return _sandbox_extension_issue_file_to_process();
}

const char *__cdecl sel_getName(SEL sel)
{
  return _sel_getName(sel);
}

int select(int a1, fd_set *a2, fd_set *a3, fd_set *a4, timeval *a5)
{
  return _select(a1, a2, a3, a4, a5);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return _strdup(__s1);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return _strtol(__str, __endptr, __base);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return _task_info(target_task, flavor, task_info_out, task_info_outCnt);
}

kern_return_t task_name_for_pid(mach_port_name_t target_tport, int pid, mach_port_name_t *tn)
{
  return _task_name_for_pid(target_tport, pid, tn);
}

uint64_t task_read_for_pid()
{
  return _task_read_for_pid();
}

kern_return_t task_resume(task_read_t target_task)
{
  return _task_resume(target_task);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return _vm_deallocate(target_task, address, size);
}

kern_return_t vm_map(vm_map_t target_task, vm_address_t *address, vm_size_t size, vm_address_t mask, int flags, mem_entry_name_port_t object, vm_offset_t offset, BOOLean_t copy, vm_prot_t cur_protection, vm_prot_t max_protection, vm_inherit_t inheritance)
{
  return _vm_map(target_task, address, size, mask, flags, object, offset, copy, cur_protection, max_protection, inheritance);
}

pid_t waitpid(pid_t a1, int *a2, int a3)
{
  return _waitpid(a1, a2, a3);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return _write(__fd, __buf, __nbyte);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return _xpc_array_apply(xarray, applier);
}

xpc_object_t xpc_array_create_empty(void)
{
  return _xpc_array_create_empty();
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return _xpc_array_get_count(xarray);
}

uint64_t xpc_array_get_uint64(xpc_object_t xarray, size_t index)
{
  return _xpc_array_get_uint64(xarray, index);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return _xpc_array_get_value(xarray, index);
}

void xpc_array_set_value(xpc_object_t xarray, size_t index, xpc_object_t value)
{
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return _xpc_connection_create_mach_service(name, targetq, flags);
}

uint64_t xpc_connection_get_audit_token()
{
  return _xpc_connection_get_audit_token();
}

void xpc_connection_send_barrier(xpc_connection_t connection, dispatch_block_t barrier)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return _xpc_connection_send_message_with_reply_sync(connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return _xpc_copy_description(object);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return _xpc_dictionary_apply(xdict, applier);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return _xpc_dictionary_create_empty();
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_array(xdict, key);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_BOOL(xdict, key);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return _xpc_dictionary_get_data(xdict, key, length);
}

xpc_object_t xpc_dictionary_get_dictionary(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_dictionary(xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_uint64(xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
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

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

xpc_object_t xpc_null_create(void)
{
  return _xpc_null_create();
}

xpc_object_t xpc_string_create(const char *string)
{
  return _xpc_string_create(string);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return _xpc_string_get_string_ptr(xstring);
}

xpc_object_t xpc_uint64_create(uint64_t value)
{
  return _xpc_uint64_create(value);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return _xpc_uint64_get_value(xuint);
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend_URLByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 URLByDeletingLastPathComponent];
}

id objc_msgSend_URLByResolvingSymlinksInPath(void *a1, const char *a2, ...)
{
  return [a1 URLByResolvingSymlinksInPath];
}

id objc_msgSend_URLPathAllowedCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 URLPathAllowedCharacterSet];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend_allServices(void *a1, const char *a2, ...)
{
  return [a1 allServices];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_archiveURL(void *a1, const char *a2, ...)
{
  return [a1 archiveURL];
}

id objc_msgSend_areProgrammableSamplePositionsSupported(void *a1, const char *a2, ...)
{
  return [a1 areProgrammableSamplePositionsSupported];
}

id objc_msgSend_arguments(void *a1, const char *a2, ...)
{
  return [a1 arguments];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bundle(void *a1, const char *a2, ...)
{
  return [a1 bundle];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_chunkSize(void *a1, const char *a2, ...)
{
  return [a1 chunkSize];
}

id objc_msgSend_compressionAlgorithm(void *a1, const char *a2, ...)
{
  return [a1 compressionAlgorithm];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return [a1 connection];
}

id objc_msgSend_connections(void *a1, const char *a2, ...)
{
  return [a1 connections];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_cpuType(void *a1, const char *a2, ...)
{
  return [a1 cpuType];
}

id objc_msgSend_currentRemoteRelayPid(void *a1, const char *a2, ...)
{
  return [a1 currentRemoteRelayPid];
}

id objc_msgSend_daemonDeviceCapabilities(void *a1, const char *a2, ...)
{
  return [a1 daemonDeviceCapabilities];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_destination(void *a1, const char *a2, ...)
{
  return [a1 destination];
}

id objc_msgSend_deviceUDID(void *a1, const char *a2, ...)
{
  return [a1 deviceUDID];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_dispatcherId(void *a1, const char *a2, ...)
{
  return [a1 dispatcherId];
}

id objc_msgSend_driverVersion(void *a1, const char *a2, ...)
{
  return [a1 driverVersion];
}

id objc_msgSend_enterRunLoop(void *a1, const char *a2, ...)
{
  return [a1 enterRunLoop];
}

id objc_msgSend_environment(void *a1, const char *a2, ...)
{
  return [a1 environment];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_fileSize(void *a1, const char *a2, ...)
{
  return [a1 fileSize];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_gpuToolsVersionQuery(void *a1, const char *a2, ...)
{
  return [a1 gpuToolsVersionQuery];
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return [a1 host];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_isMsaa32bSupported(void *a1, const char *a2, ...)
{
  return [a1 isMsaa32bSupported];
}

id objc_msgSend_isSuspended(void *a1, const char *a2, ...)
{
  return [a1 isSuspended];
}

id objc_msgSend_isTrusted(void *a1, const char *a2, ...)
{
  return [a1 isTrusted];
}

id objc_msgSend_isiOSAppOnMac(void *a1, const char *a2, ...)
{
  return [a1 isiOSAppOnMac];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_maxBufferLength(void *a1, const char *a2, ...)
{
  return [a1 maxBufferLength];
}

id objc_msgSend_maxCustomSamplePositions(void *a1, const char *a2, ...)
{
  return [a1 maxCustomSamplePositions];
}

id objc_msgSend_maxThreadgroupMemoryLength(void *a1, const char *a2, ...)
{
  return [a1 maxThreadgroupMemoryLength];
}

id objc_msgSend_maxThreadsPerThreadgroup(void *a1, const char *a2, ...)
{
  return [a1 maxThreadsPerThreadgroup];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pathComponents(void *a1, const char *a2, ...)
{
  return [a1 pathComponents];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return [a1 pathExtension];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return [a1 processInfo];
}

id objc_msgSend_processName(void *a1, const char *a2, ...)
{
  return [a1 processName];
}

id objc_msgSend_protocolMethods(void *a1, const char *a2, ...)
{
  return [a1 protocolMethods];
}

id objc_msgSend_protocolName(void *a1, const char *a2, ...)
{
  return [a1 protocolName];
}

id objc_msgSend_registerServices(void *a1, const char *a2, ...)
{
  return [a1 registerServices];
}

id objc_msgSend_replyPath(void *a1, const char *a2, ...)
{
  return [a1 replyPath];
}

id objc_msgSend_replyStream(void *a1, const char *a2, ...)
{
  return [a1 replyStream];
}

id objc_msgSend_requestID(void *a1, const char *a2, ...)
{
  return [a1 requestID];
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return [a1 scheme];
}

id objc_msgSend_servicePort(void *a1, const char *a2, ...)
{
  return [a1 servicePort];
}

id objc_msgSend_serviceProperties(void *a1, const char *a2, ...)
{
  return [a1 serviceProperties];
}

id objc_msgSend_serviceWithDefaultShellEndpoint(void *a1, const char *a2, ...)
{
  return [a1 serviceWithDefaultShellEndpoint];
}

id objc_msgSend_sessionUUID(void *a1, const char *a2, ...)
{
  return [a1 sessionUUID];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_startAccessingSecurityScopedResource(void *a1, const char *a2, ...)
{
  return [a1 startAccessingSecurityScopedResource];
}

id objc_msgSend_stopAccessingSecurityScopedResource(void *a1, const char *a2, ...)
{
  return [a1 stopAccessingSecurityScopedResource];
}

id objc_msgSend_stringByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingPathExtension];
}

id objc_msgSend_subType(void *a1, const char *a2, ...)
{
  return [a1 subType];
}

id objc_msgSend_supports2DLinearTexArraySPI(void *a1, const char *a2, ...)
{
  return [a1 supports2DLinearTexArraySPI];
}

id objc_msgSend_supports32BitMSAA(void *a1, const char *a2, ...)
{
  return [a1 supports32BitMSAA];
}

id objc_msgSend_supports32bpcMSAATextures(void *a1, const char *a2, ...)
{
  return [a1 supports32bpcMSAATextures];
}

id objc_msgSend_supports3DASTCTextures(void *a1, const char *a2, ...)
{
  return [a1 supports3DASTCTextures];
}

id objc_msgSend_supports3DBCTextures(void *a1, const char *a2, ...)
{
  return [a1 supports3DBCTextures];
}

id objc_msgSend_supportsASTCHDRTextureCompression(void *a1, const char *a2, ...)
{
  return [a1 supportsASTCHDRTextureCompression];
}

id objc_msgSend_supportsASTCTextureCompression(void *a1, const char *a2, ...)
{
  return [a1 supportsASTCTextureCompression];
}

id objc_msgSend_supportsAlphaYUVFormats(void *a1, const char *a2, ...)
{
  return [a1 supportsAlphaYUVFormats];
}

id objc_msgSend_supportsArgumentBuffersTier2(void *a1, const char *a2, ...)
{
  return [a1 supportsArgumentBuffersTier2];
}

id objc_msgSend_supportsBCTextureCompression(void *a1, const char *a2, ...)
{
  return [a1 supportsBCTextureCompression];
}

id objc_msgSend_supportsBGR10A2(void *a1, const char *a2, ...)
{
  return [a1 supportsBGR10A2];
}

id objc_msgSend_supportsBfloat16Format(void *a1, const char *a2, ...)
{
  return [a1 supportsBfloat16Format];
}

id objc_msgSend_supportsBlackOrWhiteSamplerBorderColors(void *a1, const char *a2, ...)
{
  return [a1 supportsBlackOrWhiteSamplerBorderColors];
}

id objc_msgSend_supportsBufferWithIOSurface(void *a1, const char *a2, ...)
{
  return [a1 supportsBufferWithIOSurface];
}

id objc_msgSend_supportsCMPIndirectCommandBuffers(void *a1, const char *a2, ...)
{
  return [a1 supportsCMPIndirectCommandBuffers];
}

id objc_msgSend_supportsCombinedMSAAStoreAndResolveAction(void *a1, const char *a2, ...)
{
  return [a1 supportsCombinedMSAAStoreAndResolveAction];
}

id objc_msgSend_supportsComputeMemoryBarrier(void *a1, const char *a2, ...)
{
  return [a1 supportsComputeMemoryBarrier];
}

id objc_msgSend_supportsConcurrentComputeDispatch(void *a1, const char *a2, ...)
{
  return [a1 supportsConcurrentComputeDispatch];
}

id objc_msgSend_supportsCustomBorderColor(void *a1, const char *a2, ...)
{
  return [a1 supportsCustomBorderColor];
}

id objc_msgSend_supportsDepthClipMode(void *a1, const char *a2, ...)
{
  return [a1 supportsDepthClipMode];
}

id objc_msgSend_supportsDepthClipModeClampExtended(void *a1, const char *a2, ...)
{
  return [a1 supportsDepthClipModeClampExtended];
}

id objc_msgSend_supportsDynamicAttributeStride(void *a1, const char *a2, ...)
{
  return [a1 supportsDynamicAttributeStride];
}

id objc_msgSend_supportsDynamicLibraries(void *a1, const char *a2, ...)
{
  return [a1 supportsDynamicLibraries];
}

id objc_msgSend_supportsExtendedVertexFormats(void *a1, const char *a2, ...)
{
  return [a1 supportsExtendedVertexFormats];
}

id objc_msgSend_supportsExtendedXR10Formats(void *a1, const char *a2, ...)
{
  return [a1 supportsExtendedXR10Formats];
}

id objc_msgSend_supportsExtendedYUVFormats(void *a1, const char *a2, ...)
{
  return [a1 supportsExtendedYUVFormats];
}

id objc_msgSend_supportsFunctionPointers(void *a1, const char *a2, ...)
{
  return [a1 supportsFunctionPointers];
}

id objc_msgSend_supportsFunctionPointersFromMesh(void *a1, const char *a2, ...)
{
  return [a1 supportsFunctionPointersFromMesh];
}

id objc_msgSend_supportsFunctionPointersFromRender(void *a1, const char *a2, ...)
{
  return [a1 supportsFunctionPointersFromRender];
}

id objc_msgSend_supportsGFXIndirectCommandBuffers(void *a1, const char *a2, ...)
{
  return [a1 supportsGFXIndirectCommandBuffers];
}

id objc_msgSend_supportsHeapAccelerationStructureAllocation(void *a1, const char *a2, ...)
{
  return [a1 supportsHeapAccelerationStructureAllocation];
}

id objc_msgSend_supportsIndirectDrawAndDispatch(void *a1, const char *a2, ...)
{
  return [a1 supportsIndirectDrawAndDispatch];
}

id objc_msgSend_supportsLateEvalEvent(void *a1, const char *a2, ...)
{
  return [a1 supportsLateEvalEvent];
}

id objc_msgSend_supportsLayeredRendering(void *a1, const char *a2, ...)
{
  return [a1 supportsLayeredRendering];
}

id objc_msgSend_supportsLimitedYUVFormats(void *a1, const char *a2, ...)
{
  return [a1 supportsLimitedYUVFormats];
}

id objc_msgSend_supportsLinearTexture2DArray(void *a1, const char *a2, ...)
{
  return [a1 supportsLinearTexture2DArray];
}

id objc_msgSend_supportsLinearTextureFromSharedBuffer(void *a1, const char *a2, ...)
{
  return [a1 supportsLinearTextureFromSharedBuffer];
}

id objc_msgSend_supportsLossyCompression(void *a1, const char *a2, ...)
{
  return [a1 supportsLossyCompression];
}

id objc_msgSend_supportsMSAADepthResolve(void *a1, const char *a2, ...)
{
  return [a1 supportsMSAADepthResolve];
}

id objc_msgSend_supportsMSAADepthResolveFilter(void *a1, const char *a2, ...)
{
  return [a1 supportsMSAADepthResolveFilter];
}

id objc_msgSend_supportsMSAAStencilResolve(void *a1, const char *a2, ...)
{
  return [a1 supportsMSAAStencilResolve];
}

id objc_msgSend_supportsMSAAStencilResolveFilter(void *a1, const char *a2, ...)
{
  return [a1 supportsMSAAStencilResolveFilter];
}

id objc_msgSend_supportsMemorylessRenderTargets(void *a1, const char *a2, ...)
{
  return [a1 supportsMemorylessRenderTargets];
}

id objc_msgSend_supportsMeshShaders(void *a1, const char *a2, ...)
{
  return [a1 supportsMeshShaders];
}

id objc_msgSend_supportsMeshShadersInICB(void *a1, const char *a2, ...)
{
  return [a1 supportsMeshShadersInICB];
}

id objc_msgSend_supportsMirrorClampToEdgeSamplerMode(void *a1, const char *a2, ...)
{
  return [a1 supportsMirrorClampToEdgeSamplerMode];
}

id objc_msgSend_supportsNonPrivateDepthStencilTextures(void *a1, const char *a2, ...)
{
  return [a1 supportsNonPrivateDepthStencilTextures];
}

id objc_msgSend_supportsNonPrivateMSAATextures(void *a1, const char *a2, ...)
{
  return [a1 supportsNonPrivateMSAATextures];
}

id objc_msgSend_supportsNonSquareTileShaders(void *a1, const char *a2, ...)
{
  return [a1 supportsNonSquareTileShaders];
}

id objc_msgSend_supportsNonUniformThreadgroupSize(void *a1, const char *a2, ...)
{
  return [a1 supportsNonUniformThreadgroupSize];
}

id objc_msgSend_supportsPartialRenderMemoryBarrier(void *a1, const char *a2, ...)
{
  return [a1 supportsPartialRenderMemoryBarrier];
}

id objc_msgSend_supportsPlacementHeaps(void *a1, const char *a2, ...)
{
  return [a1 supportsPlacementHeaps];
}

id objc_msgSend_supportsPrimitiveMotionBlur(void *a1, const char *a2, ...)
{
  return [a1 supportsPrimitiveMotionBlur];
}

id objc_msgSend_supportsProgrammableSamplePositions(void *a1, const char *a2, ...)
{
  return [a1 supportsProgrammableSamplePositions];
}

id objc_msgSend_supportsPublicXR10Formats(void *a1, const char *a2, ...)
{
  return [a1 supportsPublicXR10Formats];
}

id objc_msgSend_supportsRGBA10A2Gamma(void *a1, const char *a2, ...)
{
  return [a1 supportsRGBA10A2Gamma];
}

id objc_msgSend_supportsRayTracingAccelerationStructureCPUDeserialization(void *a1, const char *a2, ...)
{
  return [a1 supportsRayTracingAccelerationStructureCPUDeserialization];
}

id objc_msgSend_supportsRayTracingBuffersFromTables(void *a1, const char *a2, ...)
{
  return [a1 supportsRayTracingBuffersFromTables];
}

id objc_msgSend_supportsRayTracingCurves(void *a1, const char *a2, ...)
{
  return [a1 supportsRayTracingCurves];
}

id objc_msgSend_supportsRayTracingExtendedVertexFormats(void *a1, const char *a2, ...)
{
  return [a1 supportsRayTracingExtendedVertexFormats];
}

id objc_msgSend_supportsRayTracingGPUTableUpdateBuffers(void *a1, const char *a2, ...)
{
  return [a1 supportsRayTracingGPUTableUpdateBuffers];
}

id objc_msgSend_supportsRayTracingICBs(void *a1, const char *a2, ...)
{
  return [a1 supportsRayTracingICBs];
}

id objc_msgSend_supportsRayTracingIndirectInstanceAccelerationStructureBuild(void *a1, const char *a2, ...)
{
  return [a1 supportsRayTracingIndirectInstanceAccelerationStructureBuild];
}

id objc_msgSend_supportsRayTracingMultiLevelInstancing(void *a1, const char *a2, ...)
{
  return [a1 supportsRayTracingMultiLevelInstancing];
}

id objc_msgSend_supportsRayTracingPerPrimitiveData(void *a1, const char *a2, ...)
{
  return [a1 supportsRayTracingPerPrimitiveData];
}

id objc_msgSend_supportsRaytracing(void *a1, const char *a2, ...)
{
  return [a1 supportsRaytracing];
}

id objc_msgSend_supportsRelaxedTextureViewRequirements(void *a1, const char *a2, ...)
{
  return [a1 supportsRelaxedTextureViewRequirements];
}

id objc_msgSend_supportsRenderDynamicLibraries(void *a1, const char *a2, ...)
{
  return [a1 supportsRenderDynamicLibraries];
}

id objc_msgSend_supportsRenderMemoryBarrier(void *a1, const char *a2, ...)
{
  return [a1 supportsRenderMemoryBarrier];
}

id objc_msgSend_supportsRenderTargetTextureRotation(void *a1, const char *a2, ...)
{
  return [a1 supportsRenderTargetTextureRotation];
}

id objc_msgSend_supportsRenderToLinearTextures(void *a1, const char *a2, ...)
{
  return [a1 supportsRenderToLinearTextures];
}

id objc_msgSend_supportsSRGBwrites(void *a1, const char *a2, ...)
{
  return [a1 supportsSRGBwrites];
}

id objc_msgSend_supportsSamplerAddressModeClampToHalfBorder(void *a1, const char *a2, ...)
{
  return [a1 supportsSamplerAddressModeClampToHalfBorder];
}

id objc_msgSend_supportsSamplerCompareFunction(void *a1, const char *a2, ...)
{
  return [a1 supportsSamplerCompareFunction];
}

id objc_msgSend_supportsSeparateDepthStencil(void *a1, const char *a2, ...)
{
  return [a1 supportsSeparateDepthStencil];
}

id objc_msgSend_supportsSharedStorageHeapResources(void *a1, const char *a2, ...)
{
  return [a1 supportsSharedStorageHeapResources];
}

id objc_msgSend_supportsSharedStorageTextures(void *a1, const char *a2, ...)
{
  return [a1 supportsSharedStorageTextures];
}

id objc_msgSend_supportsSharedTextureHandles(void *a1, const char *a2, ...)
{
  return [a1 supportsSharedTextureHandles];
}

id objc_msgSend_supportsSparseDepthAttachments(void *a1, const char *a2, ...)
{
  return [a1 supportsSparseDepthAttachments];
}

id objc_msgSend_supportsSparseHeaps(void *a1, const char *a2, ...)
{
  return [a1 supportsSparseHeaps];
}

id objc_msgSend_supportsSparseTextures(void *a1, const char *a2, ...)
{
  return [a1 supportsSparseTextures];
}

id objc_msgSend_supportsTexture2DMultisampleArray(void *a1, const char *a2, ...)
{
  return [a1 supportsTexture2DMultisampleArray];
}

id objc_msgSend_supportsTextureCubeArray(void *a1, const char *a2, ...)
{
  return [a1 supportsTextureCubeArray];
}

id objc_msgSend_supportsTextureSwizzle(void *a1, const char *a2, ...)
{
  return [a1 supportsTextureSwizzle];
}

id objc_msgSend_supportsTileShaders(void *a1, const char *a2, ...)
{
  return [a1 supportsTileShaders];
}

id objc_msgSend_supportsVariableRateRasterization(void *a1, const char *a2, ...)
{
  return [a1 supportsVariableRateRasterization];
}

id objc_msgSend_supportsViewportAndScissorArray(void *a1, const char *a2, ...)
{
  return [a1 supportsViewportAndScissorArray];
}

id objc_msgSend_supportsYCBCRFormats(void *a1, const char *a2, ...)
{
  return [a1 supportsYCBCRFormats];
}

id objc_msgSend_supportsYCBCRFormats12(void *a1, const char *a2, ...)
{
  return [a1 supportsYCBCRFormats12];
}

id objc_msgSend_supportsYCBCRFormatsPQ(void *a1, const char *a2, ...)
{
  return [a1 supportsYCBCRFormatsPQ];
}

id objc_msgSend_supportsYCBCRFormatsXR(void *a1, const char *a2, ...)
{
  return [a1 supportsYCBCRFormatsXR];
}

id objc_msgSend_supportsYCBCRPackedFormats12(void *a1, const char *a2, ...)
{
  return [a1 supportsYCBCRPackedFormats12];
}

id objc_msgSend_supportsYCBCRPackedFormatsPQ(void *a1, const char *a2, ...)
{
  return [a1 supportsYCBCRPackedFormatsPQ];
}

id objc_msgSend_supportsYCBCRPackedFormatsXR(void *a1, const char *a2, ...)
{
  return [a1 supportsYCBCRPackedFormatsXR];
}

id objc_msgSend_targetDeviceArchitecture(void *a1, const char *a2, ...)
{
  return [a1 targetDeviceArchitecture];
}

id objc_msgSend_uniqueDeviceID(void *a1, const char *a2, ...)
{
  return [a1 uniqueDeviceID];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongValue];
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return [a1 version];
}

id objc_msgSend_versionCombined(void *a1, const char *a2, ...)
{
  return [a1 versionCombined];
}

id objc_msgSend_writeToURL_options_error_(void *a1, const char *a2, ...)
{
  return [a1 writeToURL:x0 options:x1 error:x2];
}