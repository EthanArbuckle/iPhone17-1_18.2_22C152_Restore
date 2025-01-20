@interface TVShelfViewLayout
@end

@implementation TVShelfViewLayout

void __50___TVShelfViewLayout_invalidateLayoutWithContext___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  if ([*(id *)(a1 + 32) section] != a3
    || !*(unsigned char *)(a1 + 56)
    || ![*(id *)(a1 + 40) _bumpHeaderForLayoutSection:v8 forIndexPath:*(void *)(a1 + 32)])
  {
    [v8 sectionHeaderVerticalBump];
    if (v5 == 0.0) {
      goto LABEL_7;
    }
    [v8 setSectionHeaderVerticalBump:0.0];
  }
  v6 = *(void **)(a1 + 48);
  v7 = [MEMORY[0x263F088C8] indexPathForItem:0 inSection:a3];
  [v6 addObject:v7];

LABEL_7:
}

@end