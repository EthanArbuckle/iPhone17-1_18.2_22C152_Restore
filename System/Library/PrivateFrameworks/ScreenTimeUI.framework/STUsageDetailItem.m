@interface STUsageDetailItem
@end

@implementation STUsageDetailItem

void __54__STUsageDetailItem_UIAdditions__localizedDisplayName__block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x263F08A48] mainQueue];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __54__STUsageDetailItem_UIAdditions__localizedDisplayName__block_invoke_2;
  v3[3] = &unk_26449B298;
  v3[4] = *(void *)(a1 + 32);
  [v2 addOperationWithBlock:v3];
}

uint64_t __54__STUsageDetailItem_UIAdditions__localizedDisplayName__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) willChangeValueForKey:@"localizedDisplayName"];
  v2 = *(void **)(a1 + 32);

  return [v2 didChangeValueForKey:@"localizedDisplayName"];
}

@end