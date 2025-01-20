@interface PASZoneSupport
@end

@implementation PASZoneSupport

void __50___PASZoneSupport_deepCopyObject_toZone_strategy___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v5 = *(void **)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  id v7 = a3;
  id v9 = [v5 deepCopyObject:a2 toZone:v6 strategy:0];
  v8 = [*(id *)(a1 + 40) deepCopyObject:v7 toZone:*(void *)(a1 + 48) strategy:*(unsigned int *)(a1 + 56)];

  objc_msgSend(*(id *)(a1 + 32), "_pas_setObject:forNonCopiedKey:", v8, v9);
}

@end