@interface HDSPIDSService
+ (id)cloudServiceWithScheduler:(id)a3;
+ (id)localServiceWithScheduler:(id)a3;
@end

@implementation HDSPIDSService

+ (id)localServiceWithScheduler:(id)a3
{
  id v3 = a3;
  v4 = [[_HDSPIDSService alloc] initWithIsCloudService:0 scheduler:v3];

  return v4;
}

+ (id)cloudServiceWithScheduler:(id)a3
{
  id v3 = a3;
  v4 = [[_HDSPIDSService alloc] initWithIsCloudService:1 scheduler:v3];

  return v4;
}

void __64___HDSPIDSService__sendSerializedMessage_identifier_completion___block_invoke(uint64_t a1)
{
  v32[5] = *MEMORY[0x263EF8340];
  v2 = *(unsigned char **)(a1 + 32);
  if (v2[24]) {
    [v2 _cloudDestinations];
  }
  else {
  id v3 = [v2 _localDestinations];
  }
  v4 = HKSPLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = [*(id *)(a1 + 32) _loggingDescription];
    *(_DWORD *)buf = 138543618;
    v26 = v5;
    __int16 v27 = 2114;
    id v28 = v3;
    _os_log_impl(&dword_221A52000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] destinations: %{public}@", buf, 0x16u);
  }
  uint64_t v6 = MEMORY[0x263EFFA88];
  uint64_t v7 = *MEMORY[0x263F49EF8];
  v31[0] = *MEMORY[0x263F49ED8];
  v31[1] = v7;
  v32[0] = MEMORY[0x263EFFA88];
  v32[1] = MEMORY[0x263EFFA88];
  v31[2] = *MEMORY[0x263F49F08];
  v8 = [NSNumber numberWithInt:*(unsigned char *)(*(void *)(a1 + 32) + 24) == 0];
  uint64_t v9 = *MEMORY[0x263F49EB8];
  v32[2] = v8;
  v32[3] = v6;
  uint64_t v10 = *MEMORY[0x263F49F60];
  v31[3] = v9;
  v31[4] = v10;
  v32[4] = *(void *)(a1 + 40);
  v11 = [NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:5];

  v12 = HKSPLogForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = [*(id *)(a1 + 32) _loggingDescription];
    v14 = *(void **)(a1 + 48);
    *(_DWORD *)buf = 138543874;
    v26 = v13;
    __int16 v27 = 2114;
    id v28 = v14;
    __int16 v29 = 2114;
    id v30 = v11;
    _os_log_impl(&dword_221A52000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] enqueuing message %{public}@ with options %{public}@", buf, 0x20u);
  }
  v15 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v16 = *(void *)(a1 + 48);
  id v23 = 0;
  id v24 = 0;
  int v17 = [v15 sendMessage:v16 toDestinations:v3 priority:300 options:v11 identifier:&v24 error:&v23];
  id v18 = v24;
  id v19 = v23;
  v20 = HKSPLogForCategory();
  v21 = v20;
  if (!v17)
  {
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    v22 = [*(id *)(a1 + 32) _loggingDescription];
    *(_DWORD *)buf = 138543874;
    v26 = v22;
    __int16 v27 = 2114;
    id v28 = v18;
    __int16 v29 = 2114;
    id v30 = v19;
    _os_log_error_impl(&dword_221A52000, v21, OS_LOG_TYPE_ERROR, "[%{public}@] failed to enqueue message %{public}@ with error %{public}@", buf, 0x20u);
    goto LABEL_11;
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v22 = [*(id *)(a1 + 32) _loggingDescription];
    *(_DWORD *)buf = 138543618;
    v26 = v22;
    __int16 v27 = 2114;
    id v28 = v18;
    _os_log_impl(&dword_221A52000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@] successfully enqueued message %{public}@", buf, 0x16u);
LABEL_11:
  }
LABEL_13:

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

uint64_t __37___HDSPIDSService__cloudDestinations__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isActive]) {
    uint64_t v3 = [v2 isDefaultPairedDevice] ^ 1;
  }
  else {
    uint64_t v3 = 1;
  }

  return v3;
}

id __37___HDSPIDSService__cloudDestinations__block_invoke_2()
{
  v0 = (void *)IDSCopyIDForDevice();

  return v0;
}

@end