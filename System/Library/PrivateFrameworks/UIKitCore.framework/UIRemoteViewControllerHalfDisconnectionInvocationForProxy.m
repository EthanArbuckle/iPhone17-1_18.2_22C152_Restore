@interface UIRemoteViewControllerHalfDisconnectionInvocationForProxy
@end

@implementation UIRemoteViewControllerHalfDisconnectionInvocationForProxy

void ___UIRemoteViewControllerHalfDisconnectionInvocationForProxy_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  char v28 = 0;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2810000000;
  v25[3] = &unk_186D7DBA7;
  int v26 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = ___UIRemoteViewControllerHalfDisconnectionInvocationForProxy_block_invoke_2;
  aBlock[3] = &unk_1E530D988;
  aBlock[4] = v25;
  aBlock[5] = v27;
  v4 = _Block_copy(aBlock);
  v5 = *(void **)(a1 + 32);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = ___UIRemoteViewControllerHalfDisconnectionInvocationForProxy_block_invoke_3;
  v21[3] = &unk_1E530D9B0;
  id v6 = v4;
  id v22 = v6;
  id v7 = v3;
  id v23 = v7;
  v8 = [v5 remoteObjectProxyWithErrorHandler:v21];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = ___UIRemoteViewControllerHalfDisconnectionInvocationForProxy_block_invoke_4;
  v18[3] = &unk_1E530D9D8;
  id v9 = v6;
  id v19 = v9;
  id v10 = v7;
  id v20 = v10;
  objc_msgSend(v8, "__prepareForDisconnectionWithCompletionHandler:", v18);

  dispatch_time_t v11 = dispatch_time(0, 1000000000);
  v12 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___UIRemoteViewControllerHalfDisconnectionInvocationForProxy_block_invoke_5;
  block[3] = &unk_1E52DE9A0;
  id v16 = v9;
  id v17 = v10;
  id v13 = v10;
  id v14 = v9;
  dispatch_after(v11, v12, block);

  _Block_object_dispose(v25, 8);
  _Block_object_dispose(v27, 8);
}

void ___UIRemoteViewControllerHalfDisconnectionInvocationForProxy_block_invoke_2(uint64_t a1, void *a2)
{
  v4 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 32) + 8) + 32));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  if (!*(unsigned char *)(v3 + 24))
  {
    *(unsigned char *)(v3 + 24) = 1;
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 32) + 8) + 32));
    if (v4) {
      v4[2]();
    }
  }
}

uint64_t ___UIRemoteViewControllerHalfDisconnectionInvocationForProxy_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t ___UIRemoteViewControllerHalfDisconnectionInvocationForProxy_block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

void ___UIRemoteViewControllerHalfDisconnectionInvocationForProxy_block_invoke_5(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = ___UIRemoteViewControllerHalfDisconnectionInvocationForProxy_block_invoke_6;
  v2[3] = &unk_1E52DA040;
  uint64_t v1 = *(void *)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v2);
}

uint64_t ___UIRemoteViewControllerHalfDisconnectionInvocationForProxy_block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end