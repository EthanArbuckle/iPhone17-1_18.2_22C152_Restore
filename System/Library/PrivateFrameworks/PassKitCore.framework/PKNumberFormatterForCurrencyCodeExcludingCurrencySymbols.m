@interface PKNumberFormatterForCurrencyCodeExcludingCurrencySymbols
@end

@implementation PKNumberFormatterForCurrencyCodeExcludingCurrencySymbols

void ___PKNumberFormatterForCurrencyCodeExcludingCurrencySymbols_block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.PassKit.currencyformatterExcludingCurrencySymbols", 0);
  v1 = (void *)qword_1EB4028B8;
  qword_1EB4028B8 = (uint64_t)v0;

  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v3 = (void *)qword_1EB4028A8;
  qword_1EB4028A8 = (uint64_t)v2;
}

void ___PKNumberFormatterForCurrencyCodeExcludingCurrencySymbols_block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v3 = v2;
  }
  else
  {
    id v3 = [MEMORY[0x1E4F1CA98] null];
  }
  id v10 = v3;
  uint64_t v4 = [(id)qword_1EB4028A8 objectForKeyedSubscript:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setCurrencyCode:*(void *)(a1 + 32)];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setNumberStyle:2];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setCurrencySymbol:&stru_1EE0F5368];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setInternationalCurrencySymbol:&stru_1EE0F5368];
    [(id)qword_1EB4028A8 setObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) forKeyedSubscript:v10];
  }
}

@end