@interface NSPredicate
@end

@implementation NSPredicate

uint64_t __67__NSPredicate_TAEventProtocol__predicateForTAEventsInDateInterval___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 conformsToProtocol:&unk_26D688A80])
  {
    v4 = *(void **)(a1 + 32);
    v5 = [v3 getDate];
    uint64_t v6 = [v4 containsDate:v5];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

uint64_t __58__NSPredicate_TAEventProtocol__predicateForTAEventsClass___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

BOOL __74__NSPredicate_TAEventProtocol__predicateForTAEventsClass_andEventSubtype___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = (objc_opt_isKindOfClass() & 1) != 0
    && [v3 conformsToProtocol:&unk_26D688A80]
    && (objc_opt_respondsToSelector() & 1) != 0
    && [v3 getEventSubtype] == *(void *)(a1 + 40);

  return v4;
}

@end