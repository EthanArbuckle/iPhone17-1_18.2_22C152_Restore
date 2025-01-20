@interface NSArray
@end

@implementation NSArray

uint64_t __75__NSArray_SBSAAdditions__sbsa_arrayByAddingOrReplacingObjectMatchingClass___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 isMemberOfClass:objc_opt_class()];

  return v3;
}

void __59__NSArray_SBSystemApertureAdditions__dictionaryDescription__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v9 = a2;
  v5 = v9;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v5 = [v9 description];
  }
  v6 = *(void **)(a1 + 32);
  v7 = [NSNumber numberWithUnsignedInteger:a3];
  v8 = [v7 stringValue];
  [v6 setObject:v5 forKey:v8];
}

void __78__NSArray_SBHistorianDescription__sb_switcherModifierDebugTimelineDescription__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v4 = *(void **)(a1 + 32);
  v5 = NSString;
  objc_msgSend(a2, "sb_switcherModifierDebugTimelineDescription");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = [v5 stringWithFormat:@"[%lu] %@", a3, v7];
  [v4 addObject:v6];
}

@end