@interface PSDeviceStateFeatures
@end

@implementation PSDeviceStateFeatures

id __78___PSDeviceStateFeatures_isInCallWithCandidates_facetimeRequest_caches_store___block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned char *)(a1 + 40))
  {
    v3 = (void *)a1;
    v4 = *(void **)(a1 + 32);
    if (v4)
    {
      v5 = NSNumber;
      v6 = +[_PSConstants facetimeBundleId];
      char v7 = [v4 isEqualToString:v6];
      if (v7)
      {
        int v8 = 0;
        uint64_t v9 = 1;
      }
      else
      {
        v10 = (void *)v3[4];
        v1 = +[_PSConstants macFacetimeBundleId];
        if ([v10 isEqualToString:v1])
        {
          int v8 = 0;
          uint64_t v9 = 1;
        }
        else
        {
          v11 = (void *)v3[4];
          v3 = +[_PSConstants mobileFacetimeBundleId];
          uint64_t v9 = [v11 isEqualToString:v3];
          int v8 = 1;
        }
      }
      v12 = [v5 numberWithInt:v9];
      [v12 BOOLValue];

      if (v8) {
      if ((v7 & 1) == 0)
      }
    }
  }
  id v13 = objc_alloc(MEMORY[0x1E4F4FEE8]);
  v14 = [NSNumber numberWithBool:v2 == 0];
  v15 = (void *)[v13 initWithIntValue:0 doubleValue:0 stringValue:0 BOOLValue:v14 timeBucketValue:0];

  return v15;
}

@end