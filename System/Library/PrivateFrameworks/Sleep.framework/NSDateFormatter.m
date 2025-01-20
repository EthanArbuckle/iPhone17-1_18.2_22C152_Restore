@interface NSDateFormatter
@end

@implementation NSDateFormatter

void __94__NSDateFormatter_HKSPSleep__hksp_timeStringFromDate_designatorString_designatorIsBeforeTime___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v12 = [a2 objectForKeyedSubscript:*MEMORY[0x1E4F1C378]];
  if ([v12 hasPrefix:@"a"])
  {
    v7 = [*(id *)(a1 + 32) string];
    uint64_t v8 = objc_msgSend(v7, "substringWithRange:", a3, a4);
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
    *(void *)(v11 + 32) = a3;
    *(void *)(v11 + 40) = a4;
  }
}

@end