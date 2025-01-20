@interface TUICFInterface
+ (id)allowCallForDestinationID:(id)a3 providerIdentifier:(id)a4;
+ (void)allowCallForDestinationID:(id)a3 providerIdentifier:(id)a4 queue:(id)a5 completionHandler:(id)a6;
@end

@implementation TUICFInterface

+ (id)allowCallForDestinationID:(id)a3 providerIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_alloc_init(TUICFQueryResult);
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __63__TUICFInterface_allowCallForDestinationID_providerIdentifier___block_invoke;
  v18[3] = &unk_1E58E8740;
  v10 = v8;
  v19 = v10;
  v11 = v9;
  v20 = v11;
  [a1 allowCallForDestinationID:v7 providerIdentifier:v6 queue:0 completionHandler:v18];

  dispatch_time_t v12 = dispatch_time(0, 2000000000);
  if (dispatch_semaphore_wait(v11, v12))
  {
    v13 = TUDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v17[0] = 0;
      _os_log_impl(&dword_19C496000, v13, OS_LOG_TYPE_DEFAULT, "[WARN] Timed out waiting for ICFCallProviderShouldAllowIncomingCall(). Defaulting to allowCall=YES, fromBlockList=NO", (uint8_t *)v17, 2u);
    }

    [(TUICFQueryResult *)v10 setAllowCallForDestinationID:1];
    [(TUICFQueryResult *)v10 setFromBlockList:0];
  }
  v14 = v20;
  v15 = v10;

  return v15;
}

intptr_t __63__TUICFInterface_allowCallForDestinationID_providerIdentifier___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  [*(id *)(a1 + 32) setAllowCallForDestinationID:a2];
  [*(id *)(a1 + 32) setFromBlockList:a3];
  v5 = *(NSObject **)(a1 + 40);

  return dispatch_semaphore_signal(v5);
}

+ (void)allowCallForDestinationID:(id)a3 providerIdentifier:(id)a4 queue:(id)a5 completionHandler:(id)a6
{
  id v7 = a6;
  id v6 = v7;
  ICFCallProviderShouldAllowIncomingCallWithQueue();
}

uint64_t __87__TUICFInterface_allowCallForDestinationID_providerIdentifier_queue_completionHandler___block_invoke(uint64_t a1, int a2, int a3)
{
  return (*(uint64_t (**)(void, BOOL, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2 != 0, a3 != 0);
}

@end