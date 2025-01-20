@interface PXChangeDetailsEntryForSection
@end

@implementation PXChangeDetailsEntryForSection

void ___PXChangeDetailsEntryForSection_block_invoke(uint64_t a1, uint64_t a2)
{
  id v5 = [*(id *)(a1 + 32) subitemChangesInItem:a2 section:*(void *)(a1 + 48)];
  v4 = [[_PXChangeDetailsEntry alloc] initWithIndex:a2 changeDetails:v5];
  [*(id *)(a1 + 40) addSubitemEntry:v4];
}

@end