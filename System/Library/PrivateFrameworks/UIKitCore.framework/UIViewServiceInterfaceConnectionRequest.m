@interface UIViewServiceInterfaceConnectionRequest
@end

@implementation UIViewServiceInterfaceConnectionRequest

void __65___UIViewServiceInterfaceConnectionRequest__objc_initiateDealloc__block_invoke(uint64_t a1)
{
}

void __112___UIViewServiceInterfaceConnectionRequest__connectToViewServiceWithBundleIdentifier_service_connectionHandler___block_invoke(void *a1)
{
  if ((atomic_exchange((atomic_uchar *volatile)(*(void *)(a1[5] + 8) + 48), 1u) & 1) == 0)
  {
    (*(void (**)(void))(a1[4] + 16))();
    v2 = (void *)a1[6];
  }
}

void __112___UIViewServiceInterfaceConnectionRequest__connectToViewServiceWithBundleIdentifier_service_connectionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  v3 = *(NSObject **)(v2 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __112___UIViewServiceInterfaceConnectionRequest__connectToViewServiceWithBundleIdentifier_service_connectionHandler___block_invoke_3;
  block[3] = &unk_1E530D540;
  uint64_t v4 = *(void *)(a1 + 32);
  block[5] = a2;
  block[6] = v2;
  block[4] = v4;
  dispatch_async(v3, block);
}

uint64_t __112___UIViewServiceInterfaceConnectionRequest__connectToViewServiceWithBundleIdentifier_service_connectionHandler___block_invoke_3(void *a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [NSString stringWithFormat:@"Connection Request for %@ Canceled", a1[4]];
  v3 = (void *)a1[6];
  if (!v3[6])
  {
    v5 = @"Message";
    v6[0] = v2;
    *(void *)(a1[6] + 48) = (id)objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"_UIViewServiceErrorDomain", 1, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1));
    v3 = (void *)a1[6];
  }
  return [v3 _cancelUnconditionallyThen:a1[5]];
}

uint64_t __112___UIViewServiceInterfaceConnectionRequest__connectToViewServiceWithBundleIdentifier_service_connectionHandler___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _launchService];
}

void __112___UIViewServiceInterfaceConnectionRequest__connectToViewServiceWithBundleIdentifier_service_connectionHandler___block_invoke_5(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __112___UIViewServiceInterfaceConnectionRequest__connectToViewServiceWithBundleIdentifier_service_connectionHandler___block_invoke_6;
  v4[3] = &unk_1E52EBA80;
  v4[4] = a2;
  v4[5] = v2;
  dispatch_async(v3, v4);
}

uint64_t __112___UIViewServiceInterfaceConnectionRequest__connectToViewServiceWithBundleIdentifier_service_connectionHandler___block_invoke_6(uint64_t a1)
{
  void v6[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(id **)(a1 + 40);
  if (v3)
  {
    return objc_msgSend(v2, "_cancelWithError:");
  }
  else
  {
    v5 = (void *)[v2[3] xpcServiceNameRoot];
    *(void *)(*(void *)(a1 + 40) + 80) = objc_msgSend(objc_alloc(MEMORY[0x1E4F29268]), "initWithServiceName:", objc_msgSend(v5, "stringByAppendingString:", @".viewservice"));
    *(unsigned char *)(*(void *)(a1 + 40) + 88) = 0;
    if ([*(id *)(*(void *)(a1 + 40) + 24) multipleInstances]
      && [*(id *)(*(void *)(a1 + 40) + 24) multipleInstanceUUID])
    {
      [*(id *)(*(void *)(a1 + 40) + 80) _xpcConnection];
      v6[0] = 0;
      v6[1] = 0;
      objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 40) + 24), "multipleInstanceUUID"), "getUUIDBytes:", v6);
      xpc_connection_set_oneshot_instance();
    }
    return [*(id *)(a1 + 40) _createPlugInProcessAssertion];
  }
}

void __58___UIViewServiceInterfaceConnectionRequest__launchService__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 40))
  {
    uint64_t v3 = (const char *)objc_msgSend((id)objc_msgSend(*(id *)(v1 + 16), "stringByAppendingFormat:", @"-com.apple.uikit.viewService.connectionRequest"), "UTF8String");
    notify_register_check(v3, (int *)(*(void *)(a1 + 32) + 64));
    notify_set_state(*(_DWORD *)(*(void *)(a1 + 32) + 64), 1uLL);
    notify_post(v3);
    uint64_t v4 = *(NSObject **)(__UILogGetCategoryCachedImpl("ViewServiceConnectionRequest", &_UIInternalPreference_ForceIOSDeviceInsets_block_invoke___s_category_4)+ 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 16);
      *(_DWORD *)buf = 138543618;
      uint64_t v14 = v5;
      __int16 v15 = 2082;
      v16 = v3;
      _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_DEFAULT, "Launching service %{public}@ with notification %{public}s", buf, 0x16u);
    }
    v11[0] = *MEMORY[0x1E4F625E8];
    v12[0] = objc_msgSend(NSNumber, "numberWithInteger:", +[UIApplication _classicMode](UIApplication, "_classicMode"));
    v11[1] = *MEMORY[0x1E4FB34F0];
    v12[1] = [NSNumber numberWithBool:1];
    v11[2] = *MEMORY[0x1E4F625F8];
    v12[2] = [NSNumber numberWithBool:1];
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
    id v7 = objc_alloc_init(MEMORY[0x1E4F62AF8]);
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(v8 + 16);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __58___UIViewServiceInterfaceConnectionRequest__launchService__block_invoke_31;
    v10[3] = &unk_1E530D4C8;
    v10[4] = v8;
    [v7 openApplication:v9 options:v6 withResult:v10];
  }
}

void __58___UIViewServiceInterfaceConnectionRequest__launchService__block_invoke_31(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58___UIViewServiceInterfaceConnectionRequest__launchService__block_invoke_2;
  v4[3] = &unk_1E52EBA80;
  v4[4] = a2;
  v4[5] = v2;
  dispatch_async(v3, v4);
}

uint64_t __58___UIViewServiceInterfaceConnectionRequest__launchService__block_invoke_2(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  if (v1)
  {
    uint64_t v5 = @"OriginalError";
    v6[0] = v1;
    return objc_msgSend(v2, "_cancelWithError:", objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"_UIViewServiceInterfaceErrorDomain", 0, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1)));
  }
  else
  {
    uint64_t v4 = *(void **)(a1 + 40);
    return [v4 _createProcessAssertion];
  }
}

void __67___UIViewServiceInterfaceConnectionRequest__createProcessAssertion__block_invoke(uint64_t a1, char a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __67___UIViewServiceInterfaceConnectionRequest__createProcessAssertion__block_invoke_2;
  v4[3] = &unk_1E530D4F0;
  char v5 = a2;
  v4[4] = v2;
  dispatch_async(v3, v4);
}

uint64_t __67___UIViewServiceInterfaceConnectionRequest__createProcessAssertion__block_invoke_2(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 40))
  {
    uint64_t v2 = *(void **)(a1 + 32);
    return [v2 _createAndEstablishConnection];
  }
  else
  {
    uint64_t v4 = [NSString stringWithFormat:@"Attempt to acquire assertions for %@ failed", *(void *)(*(void *)(a1 + 32) + 16)];
    char v5 = *(void **)(a1 + 32);
    uint64_t v6 = @"Message";
    v7[0] = v4;
    return objc_msgSend(v5, "_cancelWithError:", objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"_UIViewServiceInterfaceErrorDomain", 2, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1)));
  }
}

void __73___UIViewServiceInterfaceConnectionRequest__createPlugInProcessAssertion__block_invoke(uint64_t a1, char a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __73___UIViewServiceInterfaceConnectionRequest__createPlugInProcessAssertion__block_invoke_2;
  v4[3] = &unk_1E530D4F0;
  char v5 = a2;
  v4[4] = v2;
  dispatch_async(v3, v4);
}

uint64_t __73___UIViewServiceInterfaceConnectionRequest__createPlugInProcessAssertion__block_invoke_2(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 40))
  {
    [*(id *)(a1 + 32) _establishConnection];
    uint64_t v2 = *(void **)(a1 + 32);
    return [v2 _didConnectToService];
  }
  else
  {
    uint64_t v4 = [NSString stringWithFormat:@"Attempt to acquire assertions for %@ failed", *(void *)(*(void *)(a1 + 32) + 16)];
    char v5 = *(void **)(a1 + 32);
    uint64_t v6 = @"Message";
    v7[0] = v4;
    return objc_msgSend(v5, "_cancelWithError:", objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"_UIViewServiceInterfaceErrorDomain", 2, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1)));
  }
}

uint64_t __64___UIViewServiceInterfaceConnectionRequest__establishConnection__block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [NSString stringWithFormat:@"Error handler triggered for %@", *(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) + 16)];
  uint64_t v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  char v5 = @"Message";
  v6[0] = v2;
  return objc_msgSend(v3, "_cancelWithError:", objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"_UIViewServiceInterfaceErrorDomain", 3, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1)));
}

void __71___UIViewServiceInterfaceConnectionRequest__cancelUnconditionallyThen___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  if (!*(unsigned char *)(v2 + 88))
  {
    [*(id *)(v2 + 80) resume];
    *(unsigned char *)(*(void *)(a1 + 48) + 88) = 1;
    uint64_t v2 = *(void *)(a1 + 48);
  }
  uint64_t v3 = *(void *)(v2 + 72);
  if (*(unsigned char *)(v2 + 41)) {
    BOOL v4 = v3 == 0;
  }
  else {
    BOOL v4 = 0;
  }
  if (v4)
  {
    char v5 = 0;
  }
  else
  {
    _UIViewServiceInterfaceLogAssertionInfo(@"Invalidating assertion", *(void *)(a1 + 32), v3);
    char v5 = *(void **)(*(void *)(a1 + 48) + 72);
  }
  [v5 invalidate];
  [*(id *)(*(void *)(a1 + 48) + 80) invalidate];
  uint64_t v6 = *(void *)(a1 + 48);
  id v7 = *(NSObject **)(v6 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71___UIViewServiceInterfaceConnectionRequest__cancelUnconditionallyThen___block_invoke_2;
  block[3] = &unk_1E530D540;
  uint64_t v10 = v6;
  long long v9 = *(_OWORD *)(a1 + 32);
  dispatch_async(v7, block);
}

uint64_t __71___UIViewServiceInterfaceConnectionRequest__cancelUnconditionallyThen___block_invoke_2(uint64_t *a1)
{
  uint64_t v2 = a1[6];
  uint64_t v3 = *(void *)(v2 + 72);
  if (*(unsigned char *)(v2 + 41)) {
    BOOL v4 = v3 == 0;
  }
  else {
    BOOL v4 = 0;
  }
  if (!v4)
  {
    _UIViewServiceInterfaceLogAssertionInfo(@"Calling out to connection handler to cancel active service request", a1[4], v3);
    uint64_t v2 = a1[6];
  }
  (*(void (**)(void))(*(void *)(v2 + 8) + 16))();
  char v5 = *(uint64_t (**)(void))(a1[5] + 16);
  return v5();
}

@end