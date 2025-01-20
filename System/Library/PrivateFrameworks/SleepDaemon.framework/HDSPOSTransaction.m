@interface HDSPOSTransaction
@end

@implementation HDSPOSTransaction

void __49___HDSPOSTransaction_initWithIdentifier_timeout___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __49___HDSPOSTransaction_initWithIdentifier_timeout___block_invoke_2;
  v3[3] = &unk_2645D90C0;
  id v4 = WeakRetained;
  id v2 = WeakRetained;
  [v2 _withLock:v3];
}

uint64_t __49___HDSPOSTransaction_initWithIdentifier_timeout___block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = *(void **)(a1 + 32);
  if (v2[4])
  {
    v3 = HKSPLogForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v6 = 138543362;
      *(void *)&v6[4] = objc_opt_class();
      id v5 = *(id *)&v6[4];
      _os_log_error_impl(&dword_221A52000, v3, OS_LOG_TYPE_ERROR, "[%{public}@] transaction timed out", v6, 0xCu);
    }
    id v2 = *(void **)(a1 + 32);
  }
  return objc_msgSend(v2, "_locked_release", *(_OWORD *)v6);
}

uint64_t __38___HDSPOSTransaction_releaseAssertion__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_locked_release");
}

@end