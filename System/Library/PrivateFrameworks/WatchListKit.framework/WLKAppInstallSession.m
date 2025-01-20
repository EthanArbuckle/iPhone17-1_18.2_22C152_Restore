@interface WLKAppInstallSession
@end

@implementation WLKAppInstallSession

void __53___WLKAppInstallSession_applicationInstallsDidStart___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 24);
  if (v1)
  {
    id v2 = [*(id *)(a1 + 40) installProgress];
    [v2 fractionCompleted];
    (*(void (**)(uint64_t))(v1 + 16))(v1);
  }
}

void __54___WLKAppInstallSession_applicationInstallsDidChange___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 24);
  if (v1)
  {
    id v2 = [*(id *)(a1 + 40) installProgress];
    [v2 fractionCompleted];
    (*(void (**)(uint64_t))(v1 + 16))(v1);
  }
}

void __73___WLKAppInstallSession_beginInstallationWithProgressHandler_completion___block_invoke(uint64_t a1)
{
  v22[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = v2;

  uint64_t v5 = [*(id *)(a1 + 48) copy];
  uint64_t v6 = *(void *)(a1 + 32);
  v7 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v5;

  v8 = *(void **)(*(void *)(a1 + 32) + 32);
  v9 = [v8 appAdamIDs];
  NSLog(&cfstr_InstallingAppF.isa, v8, v9);

  v10 = [*(id *)(*(void *)(a1 + 32) + 32) appAdamIDs];
  v11 = [v10 firstObject];

  v12 = *(void **)(a1 + 32);
  v13 = (void *)v12[5];
  if (v13)
  {
    v14 = [v13 buyParameters];
    [v12 _doPurchaseWithAppAdamID:v11 offerBuyParams:v14];
  }
  else
  {
    id v15 = objc_alloc(MEMORY[0x1E4F4DD40]);
    v16 = objc_msgSend(MEMORY[0x1E4F4DBD8], "wlk_defaultBag");
    v17 = (void *)[v15 initWithType:0 clientIdentifier:@"com.tv.videosui" clientVersion:@"1" bag:v16];

    v22[0] = v11;
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
    [v17 setItemIdentifiers:v18];

    v19 = [v17 perform];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __73___WLKAppInstallSession_beginInstallationWithProgressHandler_completion___block_invoke_2;
    v20[3] = &unk_1E620B4B0;
    v20[4] = *(void *)(a1 + 32);
    id v21 = v11;
    [v19 addFinishBlock:v20];
  }
}

void __73___WLKAppInstallSession_beginInstallationWithProgressHandler_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v17 = a2;
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5)
  {
    NSLog(&cfstr_Wlkappinstalle_3.isa, v5);
    [*(id *)(a1 + 32) _sendCompletionWithError:v6];
  }
  v7 = [WLKAMSMediaProxy alloc];
  v8 = [v17 responseDictionary];
  v9 = [(WLKAMSMediaProxy *)v7 initWithDictionary:v8];

  v10 = [(WLKAMSMediaProxy *)v9 buyParameters];
  uint64_t v11 = [v10 count];

  if (v11)
  {
    NSLog(&cfstr_Wlkappinstalle_5.isa);
    v12 = *(void **)(a1 + 32);
    uint64_t v13 = *(void *)(a1 + 40);
    v14 = [(WLKAMSMediaProxy *)v9 buyParameters];
    id v15 = [v14 firstObject];
    [v12 _doPurchaseWithAppAdamID:v13 offerBuyParams:v15];
  }
  else
  {
    NSLog(&cfstr_Wlkappinstalle_4.isa);
    v16 = *(void **)(a1 + 32);
    v14 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WLKAppInstallerErrorDomain" code:-1 userInfo:0];
    [v16 _sendCompletionWithError:v14];
  }
}

void __65___WLKAppInstallSession__doPurchaseWithAppAdamID_offerBuyParams___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (v6)
  {
    NSLog(&cfstr_RedownloadFail.isa, *(void *)(a1 + 32), v6);
    v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = *MEMORY[0x1E4F28A50];
    v18[0] = v7;
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    v10 = [v8 errorWithDomain:@"WLKAppInstallerErrorDomain" code:-1 userInfo:v9];

    [*(id *)(a1 + 40) _sendCompletionWithError:v10];
  }
  else
  {
    if (![v5 success])
    {
      NSLog(&cfstr_RedownloadCanc.isa, *(void *)(a1 + 32));
      [*(id *)(a1 + 40) _sendCompletionWithError:0];
      goto LABEL_4;
    }
    uint64_t v11 = [v5 items];
    if ([v11 count])
    {
      v12 = [v5 items];
      v10 = [v12 firstObject];

      if (v10 && ([v10 success] & 1) == 0)
      {
        uint64_t v13 = [v10 error];
        v14 = v13;
        if (v13)
        {
          id v15 = v13;
        }
        else
        {
          id v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WLKAppInstallerErrorDomain" code:-1 userInfo:0];
        }
        v16 = v15;

        NSLog(&cfstr_RedownloadFail.isa, *(void *)(a1 + 32), v16);
        [*(id *)(a1 + 40) _sendCompletionWithError:v16];

        goto LABEL_3;
      }
    }
    else
    {

      v10 = 0;
    }
    NSLog(&cfstr_RedownloadComp.isa, *(void *)(a1 + 32));
  }
LABEL_3:

LABEL_4:
}

void __50___WLKAppInstallSession__sendCompletionWithError___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA9E94D0](*(void *)(*(void *)(a1 + 32) + 8));
  if (v2)
  {
    uint64_t v3 = dispatch_get_global_queue(21, 0);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __50___WLKAppInstallSession__sendCompletionWithError___block_invoke_2;
    v8[3] = &unk_1E620AF40;
    id v10 = v2;
    id v9 = *(id *)(a1 + 40);
    dispatch_async(v3, v8);
  }
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = 0;

  uint64_t v6 = *(void *)(a1 + 32);
  v7 = *(void **)(v6 + 8);
  *(void *)(v6 + 8) = 0;
}

uint64_t __50___WLKAppInstallSession__sendCompletionWithError___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

@end