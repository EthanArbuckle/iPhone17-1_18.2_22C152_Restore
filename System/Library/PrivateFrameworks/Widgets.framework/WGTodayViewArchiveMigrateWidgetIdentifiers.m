@interface WGTodayViewArchiveMigrateWidgetIdentifiers
@end

@implementation WGTodayViewArchiveMigrateWidgetIdentifiers

uint64_t ___WGTodayViewArchiveMigrateWidgetIdentifiers_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = [*(id *)(a1 + 32) objectForKey:a2];
  uint64_t v6 = v5;
  if (v5)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    uint64_t v8 = v5;
    [*(id *)(a1 + 40) replaceObjectAtIndex:a3 withObject:v5];
    uint64_t v5 = [*(id *)(a1 + 48) addObject:v8];
    uint64_t v6 = v8;
  }
  return MEMORY[0x270F9A758](v5, v6);
}

@end