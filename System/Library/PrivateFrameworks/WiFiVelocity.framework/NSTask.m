@interface NSTask
@end

@implementation NSTask

uint64_t __62__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_reply___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __73__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_outputData_reply___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __105__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_outputData_errorData_launchHandler_reply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t result = *(void *)(a1 + 32);
    if (result) {
      return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, a3, 0);
    }
  }
  else
  {
    uint64_t result = *(void *)(a1 + 40);
    if (result) {
      return (*(uint64_t (**)(void))(result + 16))();
    }
  }
  return result;
}

uint64_t __105__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_outputData_errorData_launchHandler_reply___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3) {
    uint64_t result = objc_msgSend(*(id *)(result + 32), "appendData:");
  }
  if (a4)
  {
    v6 = *(void **)(v5 + 40);
    return [v6 appendData:a4];
  }
  return result;
}

uint64_t __105__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_outputData_errorData_launchHandler_reply___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a3, 1);
  }
  return result;
}

uint64_t __77__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_outputFilePath_reply___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __135__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_outputFilePath_errorFilePath_redirectErrorToOutput_launchHandler_reply___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) closeFile];
  [*(id *)(a1 + 40) closeFile];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

uint64_t __79__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_outputFileHandle_reply___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __117__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_outputFileHandle_errorFileHandle_launchHandler_reply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t result = *(void *)(a1 + 32);
    if (result) {
      return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, a3, 0);
    }
  }
  else
  {
    uint64_t result = *(void *)(a1 + 40);
    if (result) {
      return (*(uint64_t (**)(void))(result + 16))();
    }
  }
  return result;
}

void *__117__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_outputFileHandle_errorFileHandle_launchHandler_reply___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v6 = *(void **)(a1 + 32);
  if (v6) {
    objc_msgSend(v6, "writeData:");
  }
  uint64_t result = *(void **)(a1 + 40);
  if (result) {
    return (void *)[result writeData:a4];
  }
  return result;
}

uint64_t __117__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_outputFileHandle_errorFileHandle_launchHandler_reply___block_invoke_13(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a3, 1);
  }
  return result;
}

void __96__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_startBlock_updateBlock_endBlock___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x21669CC20]();
  ssize_t v3 = read(*(_DWORD *)(a1 + 64), v8, 0x1000uLL);
  if (v3 >= 1)
  {
    uint64_t v4 = [MEMORY[0x263EFF8F8] dataWithBytes:v8 length:v3];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __96__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_startBlock_updateBlock_endBlock___block_invoke_2;
    block[3] = &unk_2641FD898;
    long long v7 = *(_OWORD *)(a1 + 48);
    uint64_t v5 = *(NSObject **)(a1 + 32);
    block[4] = *(void *)(a1 + 40);
    block[5] = v4;
    dispatch_async(v5, block);
  }
}

void __96__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_startBlock_updateBlock_endBlock___block_invoke_2(void *a1)
{
  v2 = (void *)MEMORY[0x21669CC20]();
  if (!*(unsigned char *)(*(void *)(a1[7] + 8) + 24))
  {
    uint64_t v3 = a1[6];
    if (v3) {
      (*(void (**)(uint64_t, void, void, void))(v3 + 16))(v3, a1[4], a1[5], 0);
    }
  }
}

void __96__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_startBlock_updateBlock_endBlock___block_invoke_3(uint64_t a1)
{
  v2 = *(NSObject **)(a1 + 48);
  dispatch_release(v2);
}

void __96__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_startBlock_updateBlock_endBlock___block_invoke_4(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x21669CC20]();
  ssize_t v3 = read(*(_DWORD *)(a1 + 64), v8, 0x1000uLL);
  if (v3 >= 1)
  {
    uint64_t v4 = [MEMORY[0x263EFF8F8] dataWithBytes:v8 length:v3];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __96__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_startBlock_updateBlock_endBlock___block_invoke_5;
    block[3] = &unk_2641FD898;
    long long v7 = *(_OWORD *)(a1 + 48);
    uint64_t v5 = *(NSObject **)(a1 + 32);
    block[4] = *(void *)(a1 + 40);
    block[5] = v4;
    dispatch_async(v5, block);
  }
}

void __96__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_startBlock_updateBlock_endBlock___block_invoke_5(void *a1)
{
  v2 = (void *)MEMORY[0x21669CC20]();
  if (!*(unsigned char *)(*(void *)(a1[7] + 8) + 24))
  {
    uint64_t v3 = a1[6];
    if (v3) {
      (*(void (**)(uint64_t, void, void, void))(v3 + 16))(v3, a1[4], 0, a1[5]);
    }
  }
}

void __96__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_startBlock_updateBlock_endBlock___block_invoke_6(uint64_t a1)
{
  v2 = *(NSObject **)(a1 + 48);
  dispatch_release(v2);
}

void __96__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_startBlock_updateBlock_endBlock___block_invoke_7(uint64_t a1)
{
  v16[1] = *MEMORY[0x263EF8340];
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "removeObserver:", *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40));
  v2 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __96__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_startBlock_updateBlock_endBlock___block_invoke_8;
  block[3] = &unk_2641FD910;
  block[4] = *(void *)(a1 + 96);
  dispatch_async(v2, block);
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8) + 24))
  {
    uint64_t v15 = *MEMORY[0x263F08338];
    v16[0] = @"W5TimeoutErr";
    uint64_t v3 = objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"com.apple.wifivelocity.error", 3, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v16, &v15, 1));
  }
  else
  {
    int v4 = [*(id *)(a1 + 40) terminationStatus];
    if (v4)
    {
      uint64_t v5 = (void *)MEMORY[0x263F087E8];
      uint64_t v13 = *MEMORY[0x263F08338];
      v14 = @"terminationStatus";
      uint64_t v6 = [NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
      uint64_t v3 = [v5 errorWithDomain:*MEMORY[0x263F08438] code:v4 userInfo:v6];
    }
    else
    {
      uint64_t v3 = 0;
    }
  }
  long long v7 = *(NSObject **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __96__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_startBlock_updateBlock_endBlock___block_invoke_51;
  v11[3] = &unk_2641FD960;
  v11[4] = *(void *)(a1 + 48);
  v11[5] = v3;
  uint64_t v9 = *(void *)(a1 + 80);
  v11[6] = *(void *)(a1 + 56);
  v11[7] = v8;
  uint64_t v10 = *(void *)(a1 + 112);
  v11[8] = v9;
  v11[9] = v10;
  dispatch_async(v7, v11);
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 64));
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 72));
  dispatch_release(*(dispatch_object_t *)(a1 + 32));
}

void __96__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_startBlock_updateBlock_endBlock___block_invoke_8(uint64_t a1)
{
  v2 = (void *)MEMORY[0x21669CC20]();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
}

void __96__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_startBlock_updateBlock_endBlock___block_invoke_51(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x21669CC20]();
  OSLog = W5GetOSLog();
  if (os_log_type_enabled(OSLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [*(id *)(a1 + 32) lastPathComponent];
    if (*(void *)(a1 + 40)) {
      uint64_t v5 = (__CFString *)[NSString stringWithFormat:@" (error=%@)", *(void *)(a1 + 40)];
    }
    else {
      uint64_t v5 = &stru_26C4FB5C0;
    }
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = [*(id *)(a1 + 48) componentsJoinedByString:@" "];
    int v11 = 136316674;
    v12 = "+[NSTask(WiFiVelocity) runTaskWithLaunchPath:arguments:timeout:startBlock:updateBlock:endBlock:]_block_invoke";
    __int16 v13 = 2080;
    v14 = "W5TaskUtil.m";
    __int16 v15 = 1024;
    int v16 = 451;
    __int16 v17 = 2114;
    uint64_t v18 = v4;
    __int16 v19 = 2114;
    v20 = v5;
    __int16 v21 = 2114;
    uint64_t v22 = v6;
    __int16 v23 = 2114;
    uint64_t v24 = v7;
    LODWORD(v10) = 68;
    uint64_t v9 = &v11;
    _os_log_send_and_compose_impl();
  }
  uint64_t v8 = *(void *)(a1 + 64);
  if (v8) {
    (*(void (**)(uint64_t, void, void))(v8 + 16))(v8, *(void *)(a1 + 56), *(void *)(a1 + 40));
  }
  objc_msgSend(+[W5ActivityManager sharedActivityManager](W5ActivityManager, "sharedActivityManager", v9, v10), "osTransactionComplete:", *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40));

  *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) = 0;
}

void __96__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_startBlock_updateBlock_endBlock___block_invoke_62(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x21669CC20]();
  [*(id *)(a1 + 32) launch];
  uint64_t v3 = *(NSObject **)(a1 + 64);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __96__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_startBlock_updateBlock_endBlock___block_invoke_64;
  block[3] = &unk_2641FD988;
  uint64_t v4 = *(void *)(a1 + 32);
  block[4] = *(void *)(a1 + 40);
  int8x16_t v11 = vextq_s8(*(int8x16_t *)(a1 + 72), *(int8x16_t *)(a1 + 72), 8uLL);
  uint64_t v5 = *(void *)(a1 + 88);
  uint64_t v12 = v4;
  uint64_t v13 = v5;
  dispatch_async(v3, block);
  double v6 = *(double *)(a1 + 112);
  if (v6 > 0.0)
  {
    dispatch_time_t v7 = dispatch_time(0, (uint64_t)(v6 * 1000000000.0));
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __96__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_startBlock_updateBlock_endBlock___block_invoke_65;
    v9[3] = &unk_2641FD9B0;
    uint64_t v8 = *(void *)(a1 + 104);
    v9[4] = *(void *)(a1 + 32);
    v9[5] = v8;
    dispatch_after(v7, MEMORY[0x263EF83A0], v9);
  }
}

void __96__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_startBlock_updateBlock_endBlock___block_invoke_63(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x21669CC20]();
  OSLog = W5GetOSLog();
  if (os_log_type_enabled(OSLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [*(id *)(a1 + 32) lastPathComponent];
    uint64_t v9 = *MEMORY[0x263F08338];
    uint64_t v10 = @"W5ResourceErr";
    uint64_t v5 = objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"com.apple.wifivelocity.error", 7, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = [*(id *)(a1 + 40) componentsJoinedByString:@" "];
    int v11 = 136316674;
    uint64_t v12 = "+[NSTask(WiFiVelocity) runTaskWithLaunchPath:arguments:timeout:startBlock:updateBlock:endBlock:]_block_invoke";
    __int16 v13 = 2080;
    uint64_t v14 = "W5TaskUtil.m";
    __int16 v15 = 1024;
    int v16 = 486;
    __int16 v17 = 2114;
    uint64_t v18 = v4;
    __int16 v19 = 2114;
    uint64_t v20 = v5;
    __int16 v21 = 2114;
    uint64_t v22 = v6;
    __int16 v23 = 2114;
    uint64_t v24 = v7;
    _os_log_send_and_compose_impl();
  }
  uint64_t v8 = *(void *)(a1 + 64);
  if (v8) {
    (*(void (**)(uint64_t, void, void))(v8 + 16))(v8, *(void *)(a1 + 48), *(void *)(a1 + 56));
  }
}

void __96__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_startBlock_updateBlock_endBlock___block_invoke_64(uint64_t a1)
{
  v2 = (void *)MEMORY[0x21669CC20]();
  OSLog = W5GetOSLog();
  if (os_log_type_enabled(OSLog, OS_LOG_TYPE_DEFAULT))
  {
    [*(id *)(a1 + 32) lastPathComponent];
    if (*(void *)(a1 + 40)) {
      [NSString stringWithFormat:@" (error=%@)", *(void *)(a1 + 40)];
    }
    [*(id *)(a1 + 48) componentsJoinedByString:@" "];
    _os_log_send_and_compose_impl();
  }
  uint64_t v4 = *(void *)(a1 + 64);
  if (v4) {
    (*(void (**)(uint64_t, void, void))(v4 + 16))(v4, *(void *)(a1 + 56), *(void *)(a1 + 40));
  }
}

uint64_t __96__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_startBlock_updateBlock_endBlock___block_invoke_65(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  pid_t v1 = [*(id *)(a1 + 32) processIdentifier];
  return kill(v1, 9);
}

void __96__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_startBlock_updateBlock_endBlock___block_invoke_2_66(uint64_t a1)
{
  v2 = (void *)MEMORY[0x21669CC20]();
  OSLog = W5GetOSLog();
  if (os_log_type_enabled(OSLog, OS_LOG_TYPE_DEFAULT))
  {
    [*(id *)(a1 + 32) lastPathComponent];
    if (*(void *)(a1 + 40)) {
      [NSString stringWithFormat:@" (error=%@)", *(void *)(a1 + 40)];
    }
    [*(id *)(a1 + 48) componentsJoinedByString:@" "];
    _os_log_send_and_compose_impl();
  }
  uint64_t v4 = *(void *)(a1 + 64);
  if (v4) {
    (*(void (**)(uint64_t, void, void))(v4 + 16))(v4, *(void *)(a1 + 56), *(void *)(a1 + 40));
  }
}

intptr_t __115__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_outputData_errorData_launchHandler_didLaunch_error___block_invoke(void *a1, void *a2, char a3)
{
  *(void *)(*(void *)(a1[5] + 8) + 40) = a2;
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = a3;
  uint64_t v5 = a1[4];
  return dispatch_semaphore_signal(v5);
}

intptr_t __145__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_outputFilePath_errorFilePath_redirectErrorToOutput_launchHandler_didLaunch_error___block_invoke(void *a1, void *a2, char a3)
{
  *(void *)(*(void *)(a1[5] + 8) + 40) = [a2 copy];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = a3;
  uint64_t v5 = a1[4];
  return dispatch_semaphore_signal(v5);
}

intptr_t __127__NSTask_WiFiVelocity__runTaskWithLaunchPath_arguments_timeout_outputFileHandle_errorFileHandle_launchHandler_didLaunch_error___block_invoke(void *a1, void *a2, char a3)
{
  *(void *)(*(void *)(a1[5] + 8) + 40) = [a2 copy];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = a3;
  uint64_t v5 = a1[4];
  return dispatch_semaphore_signal(v5);
}

@end