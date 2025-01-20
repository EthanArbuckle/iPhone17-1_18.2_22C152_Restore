@interface UIViewServiceInterface
@end

@implementation UIViewServiceInterface

void __48___UIViewServiceInterface__objc_initiateDealloc__block_invoke(uint64_t a1)
{
}

void __103___UIViewServiceInterface_connectToViewServiceWithBundleIdentifier_deputyInterfaces_connectionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4)
  {
    v5 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v5();
  }
  else
  {
    uint64_t v6 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_initWithConnectionInfo:serviceBundleIdentifier:deputyInterfaces:", a2, a3, *(void *)(a1 + 40), *(void *)(a1 + 48));
    uint64_t v7 = *(void *)(a1 + 56);
    id v11 = (id)v6;
    if (v6)
    {
      uint64_t v8 = v6;
      uint64_t v9 = 0;
    }
    else
    {
      uint64_t v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"_UIViewServiceErrorDomain" code:1 userInfo:&unk_1ED3F7BB8];
      uint64_t v8 = 0;
      uint64_t v9 = v10;
    }
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v7, v8, v9);
  }
}

void __83___UIViewServiceInterface_connectToViewService_deputyInterfaces_connectionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4)
  {
    v5 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v5();
  }
  else
  {
    uint64_t v6 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_initWithConnectionInfo:service:deputyInterfaces:", a2, a3, *(void *)(a1 + 40), *(void *)(a1 + 48));
    uint64_t v7 = *(void *)(a1 + 56);
    id v11 = (id)v6;
    if (v6)
    {
      uint64_t v8 = v6;
      uint64_t v9 = 0;
    }
    else
    {
      uint64_t v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"_UIViewServiceErrorDomain" code:1 userInfo:&unk_1ED3F7BE0];
      uint64_t v8 = 0;
      uint64_t v9 = v10;
    }
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v7, v8, v9);
  }
}

uint64_t __100___UIViewServiceInterface__initWithConnectionInfo_serviceBundleIdentifier_service_deputyInterfaces___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _terminateUnconditionallyThen:a2];
}

uint64_t __100___UIViewServiceInterface__initWithConnectionInfo_serviceBundleIdentifier_service_deputyInterfaces___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"_UIViewServiceInterfaceErrorDomain" code:3 userInfo:&unk_1ED3F7C08];
  return [v1 _terminateWithError:v2];
}

uint64_t __100___UIViewServiceInterface__initWithConnectionInfo_serviceBundleIdentifier_service_deputyInterfaces___block_invoke_3(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"_UIViewServiceInterfaceErrorDomain" code:3 userInfo:&unk_1ED3F7C30];
  return [v1 _terminateWithError:v2];
}

intptr_t __100___UIViewServiceInterface_connectToDeputyWithInterface_fromExportedHostingObject_connectionHandler___block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [NSString stringWithFormat:@"attempting to connect to %@ but that service is terminated", *(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(a1 + 48);
  v5 = @"Message";
  v6[0] = v2;
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 16))(v3, 0, objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"_UIViewServiceErrorDomain", 1, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1)));
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

uint64_t __100___UIViewServiceInterface_connectToDeputyWithInterface_fromExportedHostingObject_connectionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 32), 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(*(dispatch_object_t *)(a1 + 32));
  v4 = *(uint64_t (**)(uint64_t))(a2 + 16);
  return v4(a2);
}

void __100___UIViewServiceInterface_connectToDeputyWithInterface_fromExportedHostingObject_connectionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __100___UIViewServiceInterface_connectToDeputyWithInterface_fromExportedHostingObject_connectionHandler___block_invoke_4;
  block[3] = &unk_1E530D600;
  uint64_t v2 = *(NSObject **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  block[5] = a2;
  block[6] = v3;
  block[4] = v2;
  dispatch_sync(v2, block);
}

void __100___UIViewServiceInterface_connectToDeputyWithInterface_fromExportedHostingObject_connectionHandler___block_invoke_4(void *a1)
{
  if (atomic_exchange((atomic_uchar *volatile)(*(void *)(a1[6] + 8) + 24), 0)) {
    (*(void (**)(void))(a1[5] + 16))();
  }
  uint64_t v2 = a1[4];
  dispatch_release(v2);
}

uint64_t __100___UIViewServiceInterface_connectToDeputyWithInterface_fromExportedHostingObject_connectionHandler___block_invoke_5(uint64_t a1, uint64_t a2)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __100___UIViewServiceInterface_connectToDeputyWithInterface_fromExportedHostingObject_connectionHandler___block_invoke_6;
  v5[3] = &unk_1E530D628;
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v5[4] = a2;
  v5[5] = v3;
  return (*(uint64_t (**)(uint64_t, void *))(v2 + 16))(v2, v5);
}

uint64_t __100___UIViewServiceInterface_connectToDeputyWithInterface_fromExportedHostingObject_connectionHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __100___UIViewServiceInterface_connectToDeputyWithInterface_fromExportedHostingObject_connectionHandler___block_invoke_7(uint64_t a1, uint64_t a2)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __100___UIViewServiceInterface_connectToDeputyWithInterface_fromExportedHostingObject_connectionHandler___block_invoke_8;
  v5[3] = &unk_1E530D628;
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v5[4] = a2;
  v5[5] = v3;
  return (*(uint64_t (**)(uint64_t, void *))(v2 + 16))(v2, v5);
}

uint64_t __100___UIViewServiceInterface_connectToDeputyWithInterface_fromExportedHostingObject_connectionHandler___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void __100___UIViewServiceInterface_connectToDeputyWithInterface_fromExportedHostingObject_connectionHandler___block_invoke_9(uint64_t a1, void *a2)
{
}

uint64_t __63___UIViewServiceInterface_connection_handleInvocation_isReply___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invoke];
}

void __57___UIViewServiceInterface__terminateUnconditionallyThen___block_invoke(uint64_t a1)
{
}

@end