@interface PKNumberFormatterWithMinimalFractionDigits
@end

@implementation PKNumberFormatterWithMinimalFractionDigits

void ___PKNumberFormatterWithMinimalFractionDigits_block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.PassKit.currencyformatterWithMinimalFractionDigits", 0);
  v1 = (void *)qword_1EB402888;
  qword_1EB402888 = (uint64_t)v0;

  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v3 = (void *)qword_1EB402878;
  qword_1EB402878 = (uint64_t)v2;
}

void ___PKNumberFormatterWithMinimalFractionDigits_block_invoke_2(uint64_t a1)
{
  id v8 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
  uint64_t v2 = objc_msgSend((id)qword_1EB402878, "objectForKeyedSubscript:");
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setNumberStyle:1];
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setMinimumFractionDigits:*(void *)(a1 + 40) & ~(*(uint64_t *)(a1 + 40) >> 63)];
    [(id)qword_1EB402878 setObject:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) forKeyedSubscript:v8];
  }
}

@end