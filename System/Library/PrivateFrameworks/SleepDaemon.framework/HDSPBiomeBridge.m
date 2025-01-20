@interface HDSPBiomeBridge
@end

@implementation HDSPBiomeBridge

void __39___HDSPBiomeBridge_subscribe_callback___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = a2;
  v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = objc_opt_class();
    v5 = [v2 error];
    int v6 = 138543618;
    uint64_t v7 = v4;
    __int16 v8 = 2114;
    v9 = v5;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] finished subscribing with error %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

void __39___HDSPBiomeBridge_subscribe_callback___block_invoke_391(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = HKSPLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543618;
    uint64_t v8 = objc_opt_class();
    __int16 v9 = 2114;
    id v10 = v3;
    _os_log_impl(&dword_221A52000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] received callback with event %{public}@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  int v6 = [v3 eventBody];
  (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
}

@end