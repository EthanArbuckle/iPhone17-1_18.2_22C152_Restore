@interface NSTask(WiFiVelocity)
+ (BOOL)runTaskWithLaunchPath:()WiFiVelocity arguments:timeout:outputData:errorData:launchHandler:didLaunch:error:;
+ (BOOL)runTaskWithLaunchPath:()WiFiVelocity arguments:timeout:outputFileHandle:errorFileHandle:launchHandler:didLaunch:error:;
+ (BOOL)runTaskWithLaunchPath:()WiFiVelocity arguments:timeout:outputFilePath:errorFilePath:redirectErrorToOutput:launchHandler:didLaunch:error:;
+ (uint64_t)runTaskWithLaunchPath:()WiFiVelocity arguments:error:;
+ (uint64_t)runTaskWithLaunchPath:()WiFiVelocity arguments:launchHandler:didLaunch:error:;
+ (uint64_t)runTaskWithLaunchPath:()WiFiVelocity arguments:launchHandler:reply:;
+ (uint64_t)runTaskWithLaunchPath:()WiFiVelocity arguments:outputData:error:;
+ (uint64_t)runTaskWithLaunchPath:()WiFiVelocity arguments:outputData:launchHandler:didLaunch:error:;
+ (uint64_t)runTaskWithLaunchPath:()WiFiVelocity arguments:outputData:launchHandler:reply:;
+ (uint64_t)runTaskWithLaunchPath:()WiFiVelocity arguments:outputData:reply:;
+ (uint64_t)runTaskWithLaunchPath:()WiFiVelocity arguments:outputFileHandle:error:;
+ (uint64_t)runTaskWithLaunchPath:()WiFiVelocity arguments:outputFileHandle:launchHandler:didLaunch:error:;
+ (uint64_t)runTaskWithLaunchPath:()WiFiVelocity arguments:outputFileHandle:launchHandler:reply:;
+ (uint64_t)runTaskWithLaunchPath:()WiFiVelocity arguments:outputFileHandle:reply:;
+ (uint64_t)runTaskWithLaunchPath:()WiFiVelocity arguments:outputFilePath:error:;
+ (uint64_t)runTaskWithLaunchPath:()WiFiVelocity arguments:outputFilePath:launchHandler:didLaunch:error:;
+ (uint64_t)runTaskWithLaunchPath:()WiFiVelocity arguments:outputFilePath:launchHandler:reply:;
+ (uint64_t)runTaskWithLaunchPath:()WiFiVelocity arguments:outputFilePath:reply:;
+ (uint64_t)runTaskWithLaunchPath:()WiFiVelocity arguments:reply:;
+ (uint64_t)runTaskWithLaunchPath:()WiFiVelocity arguments:timeout:outputData:errorData:launchHandler:reply:;
+ (uint64_t)runTaskWithLaunchPath:()WiFiVelocity arguments:timeout:outputFileHandle:errorFileHandle:launchHandler:reply:;
+ (uint64_t)runTaskWithLaunchPath:()WiFiVelocity arguments:timeout:outputFilePath:errorFilePath:redirectErrorToOutput:launchHandler:reply:;
+ (void)runTaskWithLaunchPath:()WiFiVelocity arguments:timeout:startBlock:updateBlock:endBlock:;
@end

@implementation NSTask(WiFiVelocity)

+ (uint64_t)runTaskWithLaunchPath:()WiFiVelocity arguments:reply:
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __62__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_reply___block_invoke;
  v6[3] = &unk_2641FD7D0;
  v6[4] = a5;
  return [MEMORY[0x263F08B50] runTaskWithLaunchPath:a3 arguments:a4 timeout:0 outputData:0 errorData:0 launchHandler:v6 reply:10.0];
}

+ (uint64_t)runTaskWithLaunchPath:()WiFiVelocity arguments:launchHandler:reply:
{
  return [MEMORY[0x263F08B50] runTaskWithLaunchPath:a3 arguments:a4 timeout:0 outputData:0 errorData:a5 launchHandler:a6 reply:0.0];
}

+ (uint64_t)runTaskWithLaunchPath:()WiFiVelocity arguments:outputData:reply:
{
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __73__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_outputData_reply___block_invoke;
  v7[3] = &unk_2641FD7D0;
  v7[4] = a6;
  return [MEMORY[0x263F08B50] runTaskWithLaunchPath:a3 arguments:a4 timeout:a5 outputData:0 errorData:0 launchHandler:v7 reply:10.0];
}

+ (uint64_t)runTaskWithLaunchPath:()WiFiVelocity arguments:outputData:launchHandler:reply:
{
  return [MEMORY[0x263F08B50] runTaskWithLaunchPath:a3 arguments:a4 timeout:a5 outputData:0 errorData:a6 launchHandler:a7 reply:0.0];
}

+ (uint64_t)runTaskWithLaunchPath:()WiFiVelocity arguments:timeout:outputData:errorData:launchHandler:reply:
{
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __105__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_outputData_errorData_launchHandler_reply___block_invoke;
  v11[3] = &unk_2641FD7F8;
  v11[4] = a8;
  v11[5] = a7;
  v9[4] = a8;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __105__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_outputData_errorData_launchHandler_reply___block_invoke_2;
  v10[3] = &unk_2641FD820;
  v10[4] = a5;
  v10[5] = a6;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __105__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_outputData_errorData_launchHandler_reply___block_invoke_3;
  v9[3] = &unk_2641FD848;
  return objc_msgSend(MEMORY[0x263F08B50], "runTaskWithLaunchPath:arguments:timeout:startBlock:updateBlock:endBlock:", a3, a4, v11, v10, v9);
}

+ (uint64_t)runTaskWithLaunchPath:()WiFiVelocity arguments:outputFilePath:reply:
{
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __77__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_outputFilePath_reply___block_invoke;
  v7[3] = &unk_2641FD7D0;
  v7[4] = a6;
  return [MEMORY[0x263F08B50] runTaskWithLaunchPath:a3 arguments:a4 timeout:a5 outputFilePath:0 errorFilePath:0 redirectErrorToOutput:0 launchHandler:10.0 reply:v7];
}

+ (uint64_t)runTaskWithLaunchPath:()WiFiVelocity arguments:outputFilePath:launchHandler:reply:
{
  return [MEMORY[0x263F08B50] runTaskWithLaunchPath:a3 arguments:a4 timeout:a5 outputFilePath:0 errorFilePath:0 redirectErrorToOutput:a6 launchHandler:0.0 reply:a7];
}

+ (uint64_t)runTaskWithLaunchPath:()WiFiVelocity arguments:timeout:outputFilePath:errorFilePath:redirectErrorToOutput:launchHandler:reply:
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  if (a6 | a7)
  {
    uint64_t v16 = a6;
    if (a6)
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager"), "removeItemAtPath:error:", a6, 0);
      objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager"), "createFileAtPath:contents:attributes:", v16, 0, 0);
      uint64_t v17 = [MEMORY[0x263F08840] fileHandleForUpdatingAtPath:v16];
      if (v17)
      {
        v18 = (void *)v17;
        uint64_t v16 = 0;
        if (!a7) {
          goto LABEL_20;
        }
        goto LABEL_13;
      }
      OSLog = W5GetOSLog();
      if (os_log_type_enabled(OSLog, OS_LOG_TYPE_DEFAULT))
      {
        int v33 = 136316162;
        v34 = "+[NSTask(WiFiVelocity) runTaskWithLaunchPath:arguments:timeout:outputFilePath:errorFilePath:redirectErrorT"
              "oOutput:launchHandler:reply:]";
        __int16 v35 = 2080;
        v36 = "W5TaskUtil.m";
        __int16 v37 = 1024;
        int v38 = 146;
        __int16 v39 = 2114;
        uint64_t v40 = [a4 lastPathComponent];
        __int16 v41 = 2114;
        uint64_t v42 = v16;
        LODWORD(v27) = 48;
        v26 = &v33;
        _os_log_send_and_compose_impl();
      }
      uint64_t v31 = *MEMORY[0x263F08338];
      v32 = @"W5ResourceErr";
      uint64_t v16 = objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"com.apple.wifivelocity.error", 7, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1, v26, v27));
    }
    v18 = 0;
    if (!a7) {
      goto LABEL_20;
    }
LABEL_13:
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager"), "removeItemAtPath:error:", a7, 0);
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager"), "createFileAtPath:contents:attributes:", a7, 0, 0);
    v22 = (void *)[MEMORY[0x263F08840] fileHandleForUpdatingAtPath:a7];
    if (v22)
    {
      if (!v16)
      {
LABEL_21:
        v28[0] = MEMORY[0x263EF8330];
        v28[1] = 3221225472;
        v28[2] = __135__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_outputFilePath_errorFilePath_redirectErrorToOutput_launchHandler_reply___block_invoke;
        v28[3] = &unk_2641FD870;
        if (a8) {
          v25 = v18;
        }
        else {
          v25 = v22;
        }
        v28[4] = v18;
        v28[5] = v22;
        v28[6] = a10;
        return [MEMORY[0x263F08B50] runTaskWithLaunchPath:a4 arguments:a5 timeout:v18 outputFileHandle:v25 errorFileHandle:a9 launchHandler:v28 reply:a1];
      }
      goto LABEL_15;
    }
    v23 = W5GetOSLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v24 = [a4 lastPathComponent];
      int v33 = 136316162;
      v34 = "+[NSTask(WiFiVelocity) runTaskWithLaunchPath:arguments:timeout:outputFilePath:errorFilePath:redirectErrorToO"
            "utput:launchHandler:reply:]";
      __int16 v35 = 2080;
      v36 = "W5TaskUtil.m";
      __int16 v37 = 1024;
      int v38 = 160;
      __int16 v39 = 2114;
      uint64_t v40 = v24;
      __int16 v41 = 2114;
      uint64_t v42 = a7;
      LODWORD(v27) = 48;
      v26 = &v33;
      _os_log_send_and_compose_impl();
    }
    uint64_t v29 = *MEMORY[0x263F08338];
    v30 = @"W5ResourceErr";
    uint64_t v16 = objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"com.apple.wifivelocity.error", 7, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1, v26, v27));
LABEL_20:
    v22 = 0;
    if (!v16) {
      goto LABEL_21;
    }
LABEL_15:
    [v18 closeFile];
    uint64_t result = [v22 closeFile];
    if (a10) {
      return (*(uint64_t (**)(uint64_t, uint64_t, void))(a10 + 16))(a10, v16, 0);
    }
    return result;
  }
  v19 = (void *)MEMORY[0x263F08B50];
  return objc_msgSend(v19, "runTaskWithLaunchPath:arguments:timeout:outputData:errorData:launchHandler:reply:", a4, a5, 0, 0, a9, a10);
}

+ (uint64_t)runTaskWithLaunchPath:()WiFiVelocity arguments:outputFileHandle:reply:
{
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __79__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_outputFileHandle_reply___block_invoke;
  v7[3] = &unk_2641FD7D0;
  v7[4] = a6;
  return [MEMORY[0x263F08B50] runTaskWithLaunchPath:a3 arguments:a4 timeout:a5 outputFileHandle:0 errorFileHandle:0 launchHandler:v7 reply:10.0];
}

+ (uint64_t)runTaskWithLaunchPath:()WiFiVelocity arguments:outputFileHandle:launchHandler:reply:
{
  return [MEMORY[0x263F08B50] runTaskWithLaunchPath:a3 arguments:a4 timeout:a5 outputFileHandle:0 errorFileHandle:a6 launchHandler:a7 reply:0.0];
}

+ (uint64_t)runTaskWithLaunchPath:()WiFiVelocity arguments:timeout:outputFileHandle:errorFileHandle:launchHandler:reply:
{
  if (a6 | a7)
  {
    [(id)a6 seekToEndOfFile];
    [(id)a7 seekToEndOfFile];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __117__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_outputFileHandle_errorFileHandle_launchHandler_reply___block_invoke;
    v20[3] = &unk_2641FD7F8;
    v20[4] = a9;
    v20[5] = a8;
    v18[4] = a9;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __117__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_outputFileHandle_errorFileHandle_launchHandler_reply___block_invoke_2;
    v19[3] = &unk_2641FD820;
    v19[4] = a6;
    v19[5] = a7;
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __117__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_outputFileHandle_errorFileHandle_launchHandler_reply___block_invoke_13;
    v18[3] = &unk_2641FD848;
    return [MEMORY[0x263F08B50] runTaskWithLaunchPath:a4 arguments:a5 timeout:v20 startBlock:v19 updateBlock:v18 endBlock:a1];
  }
  else
  {
    uint64_t v17 = (void *)MEMORY[0x263F08B50];
    return objc_msgSend(v17, "runTaskWithLaunchPath:arguments:timeout:outputData:errorData:launchHandler:reply:", a4, a5, 0, 0);
  }
}

+ (void)runTaskWithLaunchPath:()WiFiVelocity arguments:timeout:startBlock:updateBlock:endBlock:
{
  v99[1] = *MEMORY[0x263EF8340];
  v13 = (void *)[NSString stringWithFormat:@"com.apple.wifivelocity.task.%@", objc_msgSend(a4, "lastPathComponent")];
  v75[0] = 0;
  v75[1] = v75;
  v75[2] = 0x3052000000;
  v75[3] = __Block_byref_object_copy_;
  v75[4] = __Block_byref_object_dispose_;
  uint64_t v76 = 0;
  [v13 UTF8String];
  uint64_t v14 = os_transaction_create();
  objc_msgSend(+[W5ActivityManager sharedActivityManager](W5ActivityManager, "sharedActivityManager"), "osTransactionCreate:transaction:", objc_msgSend(v13, "UTF8String"), v14);
  uint64_t v76 = v14;
  v73[0] = 0;
  v73[1] = v73;
  v73[2] = 0x2020000000;
  char v74 = 0;
  v71[0] = 0;
  v71[1] = v71;
  v71[2] = 0x2020000000;
  char v72 = 0;
  uint64_t v65 = 0;
  v66 = &v65;
  uint64_t v67 = 0x3052000000;
  v68 = __Block_byref_object_copy_;
  v69 = __Block_byref_object_dispose_;
  uint64_t v70 = 0;
  v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v16 = &off_2142B2000;
  identifier = dispatch_queue_create(0, v15);
  if (!identifier)
  {
    v36 = (void *)MEMORY[0x263F087E8];
    uint64_t v98 = *MEMORY[0x263F08338];
    v99[0] = @"W5NoMemErr";
    uint64_t v38 = [NSDictionary dictionaryWithObjects:v99 forKeys:&v98 count:1];
    uint64_t v37 = 2;
LABEL_33:
    uint64_t v41 = [v36 errorWithDomain:@"com.apple.wifivelocity.error" code:v37 userInfo:v38];
    v26 = 0;
    uint64_t v24 = 0;
    v51 = 0;
    v21 = 0;
    v30 = 0;
    id v54 = 0;
    goto LABEL_34;
  }
  uint64_t v17 = a4;
  if ([a4 isEqualToString:@"/bin/sh"]) {
    uint64_t v17 = (void *)[a5 firstObject];
  }
  if ((([v17 hasPrefix:@"/usr/local/"] & 1) != 0
     || [v17 hasPrefix:@"/AppleInternal/"])
    && (os_variant_allows_internal_security_policies() & 1) == 0)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      uint64_t v50 = [v17 UTF8String];
      *(_DWORD *)buf = 136446210;
      v84 = (const char *)v50;
      _os_log_error_impl(&dword_214281000, &_os_log_internal, OS_LOG_TYPE_ERROR, "[wifivelocity] '%{public}s' not allowed on non-internal install variants, will not run task", buf, 0xCu);
    }
    v36 = (void *)MEMORY[0x263F087E8];
    uint64_t v96 = *MEMORY[0x263F08338];
    v97 = @"W5NotPermittedErr";
    uint64_t v38 = [NSDictionary dictionaryWithObjects:&v97 forKeys:&v96 count:1];
    uint64_t v37 = 5;
    goto LABEL_33;
  }
  if (!a4
    || (objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager"), "isExecutableFileAtPath:", a4) & 1) == 0)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      uint64_t v49 = [a4 UTF8String];
      *(_DWORD *)buf = 136446210;
      v84 = (const char *)v49;
      _os_log_error_impl(&dword_214281000, &_os_log_internal, OS_LOG_TYPE_ERROR, "[wifivelocity] '%{public}s' does not exist, will not run task", buf, 0xCu);
    }
    v36 = (void *)MEMORY[0x263F087E8];
    uint64_t v94 = *MEMORY[0x263F08338];
    v95 = @"W5ParamErr";
    uint64_t v37 = 1;
    uint64_t v38 = [NSDictionary dictionaryWithObjects:&v95 forKeys:&v94 count:1];
    goto LABEL_33;
  }
  id v54 = objc_alloc_init(MEMORY[0x263F08B50]);
  [v54 setLaunchPath:a4];
  if (a5) {
    [v54 setArguments:a5];
  }
  *(void *)v64 = 0;
  uintptr_t handle = 0;
  memset(&v93, 0, sizeof(v93));
  int v18 = openpty(&v64[1], v64, 0, &v93, 0);
  if (v18)
  {
    __int16 v39 = (void *)MEMORY[0x263F087E8];
    uint64_t v91 = *MEMORY[0x263F08338];
    v92 = @"err";
    uint64_t v40 = [NSDictionary dictionaryWithObjects:&v92 forKeys:&v91 count:1];
    uint64_t v41 = [v39 errorWithDomain:*MEMORY[0x263F08438] code:v18 userInfo:v40];
    OSLog = W5GetOSLog();
    if (os_log_type_enabled(OSLog, OS_LOG_TYPE_DEFAULT))
    {
      int v43 = *__error();
      *(_DWORD *)buf = 136315906;
      v84 = "+[NSTask(WiFiVelocity) runTaskWithLaunchPath:arguments:timeout:startBlock:updateBlock:endBlock:]";
      __int16 v85 = 2080;
      v86 = "W5TaskUtil.m";
      __int16 v87 = 1024;
      int v88 = 335;
      __int16 v89 = 1024;
      int v90 = v43;
LABEL_25:
      _os_log_send_and_compose_impl();
    }
LABEL_26:
    v26 = 0;
    uint64_t v24 = 0;
    v51 = 0;
    v21 = 0;
LABEL_28:
    v30 = 0;
    goto LABEL_34;
  }
  memset(&v93, 0, sizeof(v93));
  int v19 = openpty((int *)&handle + 1, (int *)&handle, 0, &v93, 0);
  if (v19)
  {
    v44 = (void *)MEMORY[0x263F087E8];
    uint64_t v81 = *MEMORY[0x263F08338];
    v82 = @"err";
    uint64_t v45 = [NSDictionary dictionaryWithObjects:&v82 forKeys:&v81 count:1];
    uint64_t v41 = [v44 errorWithDomain:*MEMORY[0x263F08438] code:v19 userInfo:v45];
    v46 = W5GetOSLog();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      int v47 = *__error();
      *(_DWORD *)buf = 136315906;
      v84 = "+[NSTask(WiFiVelocity) runTaskWithLaunchPath:arguments:timeout:startBlock:updateBlock:endBlock:]";
      __int16 v85 = 2080;
      v86 = "W5TaskUtil.m";
      __int16 v87 = 1024;
      int v88 = 339;
      __int16 v89 = 1024;
      int v90 = v47;
      goto LABEL_25;
    }
    goto LABEL_26;
  }
  id v20 = objc_alloc(MEMORY[0x263F08840]);
  v21 = (void *)[v20 initWithFileDescriptor:v64[1] closeOnDealloc:1];
  id v22 = objc_alloc(MEMORY[0x263F08840]);
  v51 = (void *)[v22 initWithFileDescriptor:v64[0] closeOnDealloc:1];
  id v23 = objc_alloc(MEMORY[0x263F08840]);
  uint64_t v24 = (void *)[v23 initWithFileDescriptor:HIDWORD(handle) closeOnDealloc:1];
  id v25 = objc_alloc(MEMORY[0x263F08840]);
  v26 = (void *)[v25 initWithFileDescriptor:handle closeOnDealloc:1];
  [v54 setStandardOutput:v51];
  [v54 setStandardError:v26];
  [v54 setStandardInput:0];
  fcntl(v64[1], 4, 4);
  fcntl(SHIDWORD(handle), 4, 4);
  uintptr_t v27 = v64[1];
  global_queue = dispatch_get_global_queue(0, 0);
  uint64_t v29 = dispatch_source_create(MEMORY[0x263EF83E8], v27, 0, global_queue);
  if (!v29)
  {
    uint64_t v79 = *MEMORY[0x263F08338];
    v80 = @"W5NoMemErr";
    uint64_t v41 = objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"com.apple.wifivelocity.error", 2, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v80, &v79, 1));
    goto LABEL_28;
  }
  v30 = v29;
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __96__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_startBlock_updateBlock_endBlock___block_invoke;
  handler[3] = &unk_2641FD8C0;
  int v62 = v64[1];
  handler[7] = v71;
  handler[6] = a7;
  handler[4] = identifier;
  handler[5] = v54;
  dispatch_source_set_event_handler(v29, handler);
  v60[0] = MEMORY[0x263EF8330];
  v60[1] = 3221225472;
  v60[2] = __96__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_startBlock_updateBlock_endBlock___block_invoke_3;
  v60[3] = &unk_2641FD8E8;
  v60[4] = v51;
  v60[5] = v21;
  v60[6] = v30;
  dispatch_source_set_cancel_handler(v30, v60);
  dispatch_resume(v30);
  uint64_t v31 = dispatch_source_create(MEMORY[0x263EF83E8], SHIDWORD(handle), 0, global_queue);
  if (v31)
  {
    v32 = v31;
    v58[0] = MEMORY[0x263EF8330];
    v58[1] = 3221225472;
    v58[2] = __96__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_startBlock_updateBlock_endBlock___block_invoke_4;
    v58[3] = &unk_2641FD8C0;
    int v59 = HIDWORD(handle);
    v58[6] = a7;
    v58[7] = v71;
    v58[4] = identifier;
    v58[5] = v54;
    dispatch_source_set_event_handler(v31, v58);
    v57[0] = MEMORY[0x263EF8330];
    v57[1] = 3221225472;
    v57[2] = __96__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_startBlock_updateBlock_endBlock___block_invoke_6;
    v57[3] = &unk_2641FD8E8;
    v57[4] = v26;
    v57[5] = v24;
    v57[6] = v32;
    dispatch_source_set_cancel_handler(v32, v57);
    dispatch_resume(v32);
    int v33 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    [MEMORY[0x263F08A48] mainQueue];
    uint64_t v34 = *MEMORY[0x263F084D8];
    block[15] = MEMORY[0x263EF8330];
    block[16] = 3221225472;
    block[17] = __96__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_startBlock_updateBlock_endBlock___block_invoke_7;
    block[18] = &unk_2641FD938;
    block[27] = v71;
    block[28] = v73;
    block[19] = identifier;
    block[20] = v54;
    block[21] = a4;
    block[22] = a5;
    block[25] = a8;
    block[26] = &v65;
    block[29] = v75;
    block[23] = v32;
    block[24] = v30;
    uint64_t v35 = objc_msgSend(v33, "addObserverForName:object:queue:usingBlock:", v34);
    v66[5] = v35;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __96__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_startBlock_updateBlock_endBlock___block_invoke_62;
    block[3] = &unk_2641FD9D8;
    block[4] = v54;
    block[5] = a4;
    block[6] = v32;
    block[7] = v30;
    block[8] = identifier;
    block[9] = a5;
    block[10] = 0;
    block[11] = a6;
    *(double *)&block[14] = a1;
    block[12] = v75;
    block[13] = v73;
    dispatch_async(MEMORY[0x263EF83A0], block);
    goto LABEL_16;
  }
  uint64_t v77 = *MEMORY[0x263F08338];
  v78 = @"W5NoMemErr";
  uint64_t v16 = &off_2142B2000;
  uint64_t v41 = objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"com.apple.wifivelocity.error", 2, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v78, &v77, 1));
LABEL_34:

  if (v30)
  {
    dispatch_source_cancel(v30);
  }
  else
  {
  }
  v48 = identifier;
  if (!identifier) {
    v48 = dispatch_get_global_queue(0, 0);
  }
  v55[0] = MEMORY[0x263EF8330];
  v55[1] = *((void *)v16 + 478);
  v55[2] = __96__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_startBlock_updateBlock_endBlock___block_invoke_2_66;
  v55[3] = &unk_2641FD960;
  v55[4] = a4;
  v55[5] = v41;
  v55[6] = a5;
  v55[7] = v54;
  v55[8] = a6;
  v55[9] = v75;
  dispatch_async(v48, v55);
  if (identifier) {
    dispatch_release(identifier);
  }

LABEL_16:
  _Block_object_dispose(&v65, 8);
  _Block_object_dispose(v71, 8);
  _Block_object_dispose(v73, 8);
  _Block_object_dispose(v75, 8);
}

+ (uint64_t)runTaskWithLaunchPath:()WiFiVelocity arguments:error:
{
  return [MEMORY[0x263F08B50] runTaskWithLaunchPath:a3 arguments:a4 timeout:0 outputData:0 errorData:0 launchHandler:0 didLaunch:0.0 error:a5];
}

+ (uint64_t)runTaskWithLaunchPath:()WiFiVelocity arguments:launchHandler:didLaunch:error:
{
  return [MEMORY[0x263F08B50] runTaskWithLaunchPath:a3 arguments:a4 timeout:0 outputData:0 errorData:a5 launchHandler:a6 didLaunch:0.0 error:a7];
}

+ (uint64_t)runTaskWithLaunchPath:()WiFiVelocity arguments:outputData:error:
{
  return [MEMORY[0x263F08B50] runTaskWithLaunchPath:a3 arguments:a4 timeout:a5 outputData:0 errorData:0 launchHandler:0 didLaunch:0.0 error:a6];
}

+ (uint64_t)runTaskWithLaunchPath:()WiFiVelocity arguments:outputData:launchHandler:didLaunch:error:
{
  return [MEMORY[0x263F08B50] runTaskWithLaunchPath:a3 arguments:a4 timeout:a5 outputData:0 errorData:a6 launchHandler:a7 didLaunch:0.0 error:a8];
}

+ (BOOL)runTaskWithLaunchPath:()WiFiVelocity arguments:timeout:outputData:errorData:launchHandler:didLaunch:error:
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3052000000;
  v32 = __Block_byref_object_copy_;
  int v33 = __Block_byref_object_dispose_;
  uint64_t v34 = 0;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  uint64_t v17 = dispatch_semaphore_create(0);
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __115__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_outputData_errorData_launchHandler_didLaunch_error___block_invoke;
  v24[3] = &unk_2641FDA00;
  v24[5] = &v29;
  v24[6] = &v25;
  v24[4] = v17;
  [MEMORY[0x263F08B50] runTaskWithLaunchPath:a4 arguments:a5 timeout:a6 outputData:a7 errorData:a8 launchHandler:v24 reply:a1];
  dispatch_time_t v18 = dispatch_time(0, 600000000000);
  if (dispatch_semaphore_wait(v17, v18) >= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134349056;
    uint64_t v36 = 0x4082C00000000000;
    _os_log_error_impl(&dword_214281000, &_os_log_internal, OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
  }
  id v19 = (id)v30[5];
  if (a9) {
    *a9 = *((unsigned char *)v26 + 24);
  }
  id v20 = v30;
  if (a10)
  {
    uint64_t v21 = v30[5];
    if (v21) {
      *a10 = v21;
    }
  }
  BOOL v22 = v20[5] == 0;
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);
  return v22;
}

+ (uint64_t)runTaskWithLaunchPath:()WiFiVelocity arguments:outputFilePath:error:
{
  return [MEMORY[0x263F08B50] runTaskWithLaunchPath:a3 arguments:a4 timeout:a5 outputFilePath:0 errorFilePath:0 redirectErrorToOutput:0 launchHandler:0.0 didLaunch:0 error:a6];
}

+ (uint64_t)runTaskWithLaunchPath:()WiFiVelocity arguments:outputFilePath:launchHandler:didLaunch:error:
{
  return [MEMORY[0x263F08B50] runTaskWithLaunchPath:a3 arguments:a4 timeout:a5 outputFilePath:0 errorFilePath:0 redirectErrorToOutput:a6 launchHandler:0.0 didLaunch:a7 error:a8];
}

+ (BOOL)runTaskWithLaunchPath:()WiFiVelocity arguments:timeout:outputFilePath:errorFilePath:redirectErrorToOutput:launchHandler:didLaunch:error:
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x3052000000;
  int v33 = __Block_byref_object_copy_;
  uint64_t v34 = __Block_byref_object_dispose_;
  uint64_t v35 = 0;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  dispatch_time_t v18 = dispatch_semaphore_create(0);
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __145__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_outputFilePath_errorFilePath_redirectErrorToOutput_launchHandler_didLaunch_error___block_invoke;
  v25[3] = &unk_2641FDA00;
  v25[5] = &v30;
  v25[6] = &v26;
  v25[4] = v18;
  [MEMORY[0x263F08B50] runTaskWithLaunchPath:a4 arguments:a5 timeout:a6 outputFilePath:a7 errorFilePath:a8 redirectErrorToOutput:a9 launchHandler:a1 reply:v25];
  dispatch_time_t v19 = dispatch_time(0, 600000000000);
  if (dispatch_semaphore_wait(v18, v19) >= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134349056;
    uint64_t v37 = 0x4082C00000000000;
    _os_log_error_impl(&dword_214281000, &_os_log_internal, OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
  }
  id v20 = (id)v31[5];
  if (a10) {
    *a10 = *((unsigned char *)v27 + 24);
  }
  uint64_t v21 = v31;
  if (a11)
  {
    uint64_t v22 = v31[5];
    if (v22) {
      *a11 = v22;
    }
  }
  BOOL v23 = v21[5] == 0;
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);
  return v23;
}

+ (uint64_t)runTaskWithLaunchPath:()WiFiVelocity arguments:outputFileHandle:error:
{
  return [MEMORY[0x263F08B50] runTaskWithLaunchPath:a3 arguments:a4 timeout:a5 outputFileHandle:0 errorFileHandle:0 launchHandler:0 didLaunch:0.0 error:a6];
}

+ (uint64_t)runTaskWithLaunchPath:()WiFiVelocity arguments:outputFileHandle:launchHandler:didLaunch:error:
{
  return [MEMORY[0x263F08B50] runTaskWithLaunchPath:a3 arguments:a4 timeout:a5 outputFileHandle:0 errorFileHandle:a6 launchHandler:a7 didLaunch:0.0 error:a8];
}

+ (BOOL)runTaskWithLaunchPath:()WiFiVelocity arguments:timeout:outputFileHandle:errorFileHandle:launchHandler:didLaunch:error:
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x3052000000;
  uint64_t v32 = __Block_byref_object_copy_;
  int v33 = __Block_byref_object_dispose_;
  uint64_t v34 = 0;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  uint64_t v17 = dispatch_semaphore_create(0);
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __127__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_outputFileHandle_errorFileHandle_launchHandler_didLaunch_error___block_invoke;
  v24[3] = &unk_2641FDA00;
  v24[5] = &v29;
  v24[6] = &v25;
  v24[4] = v17;
  [MEMORY[0x263F08B50] runTaskWithLaunchPath:a4 arguments:a5 timeout:a6 outputFileHandle:a7 errorFileHandle:a8 launchHandler:v24 reply:a1];
  dispatch_time_t v18 = dispatch_time(0, 600000000000);
  if (dispatch_semaphore_wait(v17, v18) >= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134349056;
    uint64_t v36 = 0x4082C00000000000;
    _os_log_error_impl(&dword_214281000, &_os_log_internal, OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
  }
  id v19 = (id)v30[5];
  if (a9) {
    *a9 = *((unsigned char *)v26 + 24);
  }
  id v20 = v30;
  if (a10)
  {
    uint64_t v21 = v30[5];
    if (v21) {
      *a10 = v21;
    }
  }
  BOOL v22 = v20[5] == 0;
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);
  return v22;
}

@end