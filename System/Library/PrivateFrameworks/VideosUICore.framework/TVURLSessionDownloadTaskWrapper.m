@interface TVURLSessionDownloadTaskWrapper
@end

@implementation TVURLSessionDownloadTaskWrapper

void __64___TVURLSessionDownloadTaskWrapper_resumeWithCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F290E0] sharedSession];
  uint64_t v3 = *(void *)(a1 + 32);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64___TVURLSessionDownloadTaskWrapper_resumeWithCompletionHandler___block_invoke_2;
  v10[3] = &unk_1E6DDD9D8;
  objc_copyWeak(v12, (id *)(a1 + 48));
  v12[1] = *(id *)(a1 + 56);
  id v11 = *(id *)(a1 + 40);
  v4 = [v2 downloadTaskWithURL:v3 completionHandler:v10];

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64___TVURLSessionDownloadTaskWrapper_resumeWithCompletionHandler___block_invoke_4;
  block[3] = &unk_1E6DDDA00;
  objc_copyWeak(v9, (id *)(a1 + 48));
  v9[1] = *(id *)(a1 + 56);
  id v7 = v4;
  id v8 = *(id *)(a1 + 40);
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(v9);
  objc_destroyWeak(v12);
}

void __64___TVURLSessionDownloadTaskWrapper_resumeWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v11 = WeakRetained;
  if (WeakRetained)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64___TVURLSessionDownloadTaskWrapper_resumeWithCompletionHandler___block_invoke_3;
    block[3] = &unk_1E6DDD9B0;
    uint64_t v12 = *(void *)(a1 + 48);
    void block[4] = WeakRetained;
    uint64_t v15 = v12;
    id v14 = v9;
    dispatch_sync(MEMORY[0x1E4F14428], block);
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __64___TVURLSessionDownloadTaskWrapper_resumeWithCompletionHandler___block_invoke_3(void *a1)
{
  uint64_t v1 = a1[4];
  if (v1 && a1[6] == *(void *)(v1 + 24))
  {
    uint64_t v2 = 3;
    if (a1[5]) {
      uint64_t v2 = 1;
    }
    *(void *)(v1 + 32) = v2;
    uint64_t v3 = a1[4];
    v4 = *(void **)(v3 + 16);
    *(void *)(v3 + 16) = 0;
  }
}

void __64___TVURLSessionDownloadTaskWrapper_resumeWithCompletionHandler___block_invoke_4(id *a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    if (a1[7] == WeakRetained[3] && !WeakRetained[4])
    {
      objc_storeStrong(WeakRetained + 2, a1[4]);
      [v3[2] resume];
    }
    else
    {
      v4 = dispatch_get_global_queue(21, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __64___TVURLSessionDownloadTaskWrapper_resumeWithCompletionHandler___block_invoke_5;
      block[3] = &unk_1E6DDCEB0;
      id v6 = a1[5];
      dispatch_async(v4, block);
    }
  }
}

void __64___TVURLSessionDownloadTaskWrapper_resumeWithCompletionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F289A0] code:-999 userInfo:0];
  (*(void (**)(uint64_t, void, void, id))(v1 + 16))(v1, 0, 0, v2);
}

@end