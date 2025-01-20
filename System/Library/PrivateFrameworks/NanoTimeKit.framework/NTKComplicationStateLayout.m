@interface NTKComplicationStateLayout
@end

@implementation NTKComplicationStateLayout

void __53___NTKComplicationStateLayout_ruleForLayoutOverride___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v8 = a3;
  if ([a2 unsignedIntegerValue] == *(void *)(a1 + 40))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    *a4 = 1;
  }
}

@end