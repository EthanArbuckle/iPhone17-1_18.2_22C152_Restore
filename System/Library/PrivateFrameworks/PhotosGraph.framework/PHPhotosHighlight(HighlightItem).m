@interface PHPhotosHighlight(HighlightItem)
- (id)extendedCuratedAssets;
- (id)keyAssetForHighlightFilter:()HighlightItem;
- (uint64_t)numberOfAssetsInExtendedForSharingFilter:()HighlightItem;
- (uint64_t)numberOfAssetsInExtendedMixed;
- (uint64_t)numberOfAssetsInExtendedPrivate;
- (uint64_t)numberOfAssetsInExtendedShared;
- (uint64_t)visibilityStateForHighlightFilter:()HighlightItem;
@end

@implementation PHPhotosHighlight(HighlightItem)

- (uint64_t)visibilityStateForHighlightFilter:()HighlightItem
{
  if (a3 == 2) {
    return [a1 visibilityStateMixed];
  }
  if (a3 == 1) {
    return [a1 visibilityStateShared];
  }
  if (a3) {
    return 0;
  }
  return [a1 visibilityState];
}

- (id)keyAssetForHighlightFilter:()HighlightItem
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(a1, "keyAssetObjectIDForKindWithFilter:");
  if (v2)
  {
    v3 = [a1 photoLibrary];
    v4 = [v3 librarySpecificFetchOptions];

    [v4 setIncludeGuestAssets:1];
    v5 = (void *)MEMORY[0x1E4F38EB8];
    v10[0] = v2;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    v7 = [v5 fetchAssetsWithObjectIDs:v6 options:v4];

    v8 = [v7 firstObject];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)extendedCuratedAssets
{
  v2 = [a1 photoLibrary];
  v3 = [v2 librarySpecificFetchOptions];

  [v3 setIncludeGuestAssets:1];
  v4 = [MEMORY[0x1E4F38EB8] fetchExtendedCuratedAssetsInAssetCollection:a1 options:v3];
  v5 = [v4 fetchedObjects];

  return v5;
}

- (uint64_t)numberOfAssetsInExtendedForSharingFilter:()HighlightItem
{
  int v5 = [a1 kind];
  if (v5 == 3)
  {
    if (a3 == 2)
    {
      return [a1 dayGroupExtendedAssetsCountMixed];
    }
    else if (a3 == 1)
    {
      return [a1 dayGroupExtendedAssetsCountShared];
    }
    else
    {
      if (a3) {
        return 0;
      }
      return [a1 dayGroupExtendedAssetsCountPrivate];
    }
  }
  else
  {
    if (v5) {
      return 0;
    }
    switch(a3)
    {
      case 2:
        return [a1 extendedCountMixed];
      case 1:
        return [a1 extendedCountShared];
      case 0:
        return [a1 extendedCountPrivate];
      default:
        return 0;
    }
  }
}

- (uint64_t)numberOfAssetsInExtendedMixed
{
  return [a1 numberOfAssetsInExtendedForSharingFilter:2];
}

- (uint64_t)numberOfAssetsInExtendedShared
{
  return [a1 numberOfAssetsInExtendedForSharingFilter:1];
}

- (uint64_t)numberOfAssetsInExtendedPrivate
{
  return [a1 numberOfAssetsInExtendedForSharingFilter:0];
}

@end