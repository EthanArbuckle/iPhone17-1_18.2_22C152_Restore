@interface LTDContinuationOperation
@end

@implementation LTDContinuationOperation

void __72___LTDContinuationOperation_initWithGroupID_delegate_continuationBlock___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __72___LTDContinuationOperation_initWithGroupID_delegate_continuationBlock___block_invoke_2;
    v5[3] = &unk_265546680;
    id v6 = WeakRetained;
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
}

uint64_t __72___LTDContinuationOperation_initWithGroupID_delegate_continuationBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v2 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 134217984;
    uint64_t v6 = v3;
    _os_log_impl(&dword_2600DC000, v2, OS_LOG_TYPE_INFO, "Continuation operation finish: %p", (uint8_t *)&v5, 0xCu);
  }
  return [*(id *)(a1 + 32) setFinished:1];
}

void __34___LTDContinuationOperation_start__block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v4 = WeakRetained;
    id v5 = objc_loadWeakRetained(v2);
    char v6 = [v5 isFinished];

    if ((v6 & 1) == 0)
    {
      if (*(unsigned char *)(a1 + 40))
      {
        id v7 = objc_loadWeakRetained(v2);
        [v7 cancel];

        v8 = _LTOSLogTranslationEngine();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
          __34___LTDContinuationOperation_start__block_invoke_cold_2(v8);
        }
      }
      else
      {
        v9 = _LTOSLogTranslationEngine();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
          __34___LTDContinuationOperation_start__block_invoke_cold_1(v9);
        }
      }
    }
  }
}

void __34___LTDContinuationOperation_start__block_invoke_14(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    id v3 = objc_loadWeakRetained(v1);
    char v4 = [v3 isFinished];

    if ((v4 & 1) == 0)
    {
      id v5 = _LTOSLogTranslationEngine();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        __34___LTDContinuationOperation_start__block_invoke_14_cold_1(v5);
      }
    }
  }
}

void __34___LTDContinuationOperation_start__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_2600DC000, log, OS_LOG_TYPE_FAULT, "Continuation operation encountered wait timeout event, but it wasn't told to be cancelled; the operation queue might"
    " be blocked but going to let it keep waiting",
    v1,
    2u);
}

void __34___LTDContinuationOperation_start__block_invoke_cold_2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_2600DC000, log, OS_LOG_TYPE_FAULT, "Continuation operation encountered wait timeout event", v1, 2u);
}

void __34___LTDContinuationOperation_start__block_invoke_14_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2600DC000, log, OS_LOG_TYPE_ERROR, "Warning: Continuation operation hasn't finished yet, the operation queue might be backed up or stuck. Not doing anything yet though.", v1, 2u);
}

@end