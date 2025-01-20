@interface PHFetchResult(PXDisplayAssetAdoption)
- (id)thumbnailAssetAtIndex:()PXDisplayAssetAdoption;
- (uint64_t)hasIdentifiersEqualTo:()PXDisplayAssetAdoption;
@end

@implementation PHFetchResult(PXDisplayAssetAdoption)

- (id)thumbnailAssetAtIndex:()PXDisplayAssetAdoption
{
  v5 = [a1 thumbnailAssets];
  v6 = [v5 objectAtIndexedSubscript:a3];

  if (!v6)
  {
    v6 = [a1 objectAtIndex:a3];
  }
  return v6;
}

- (uint64_t)hasIdentifiersEqualTo:()PXDisplayAssetAdoption
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [a1 fetchedObjectIDs];
    uint64_t v7 = [v5 fetchedObjectIDs];
    v8 = (void *)v7;
    if (v6 && v7)
    {
      if (v6 == (void *)v7) {
        uint64_t v9 = 1;
      }
      else {
        uint64_t v9 = [v6 isEqual:v7];
      }
    }
    else
    {
      v10 = [a1 fetchedObjects];
      v11 = [v5 fetchedObjects];
      if (v10 == v11) {
        uint64_t v9 = 1;
      }
      else {
        uint64_t v9 = [v10 isEqual:v11];
      }
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

@end