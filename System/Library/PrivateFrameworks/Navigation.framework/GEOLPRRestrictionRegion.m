@interface GEOLPRRestrictionRegion
@end

@implementation GEOLPRRestrictionRegion

void __75__GEOLPRRestrictionRegion_MNExtras__plateTypeIndexesMatchingVehicle_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v8 + 40);
  int v9 = [a2 hasDefinedPlateConditionsForVehicle:v7 error:&obj];
  objc_storeStrong((id *)(v8 + 40), obj);
  if (v9)
  {
    [*(id *)(a1 + 40) addIndex:a3];
  }
  else if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    *a4 = 1;
  }
}

@end