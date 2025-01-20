@interface PHCollectionList(PXDisplayAssetAdoption)
- (BOOL)px_isFolder;
- (BOOL)px_isMacSyncedEventsFolder;
- (BOOL)px_isMacSyncedFacesFolder;
- (BOOL)px_isSmartFolder;
- (BOOL)px_isTopLevelFolder;
- (uint64_t)px_isRegularFolder;
- (uint64_t)px_isTransientPlacesCollection;
@end

@implementation PHCollectionList(PXDisplayAssetAdoption)

- (uint64_t)px_isTransientPlacesCollection
{
  v1 = [a1 transientIdentifier];
  uint64_t v2 = [v1 isEqualToString:@"PXPlacesGridVirtualCollection"];

  return v2;
}

- (BOOL)px_isMacSyncedFacesFolder
{
  return [a1 collectionListType] == 3 && objc_msgSend(a1, "collectionListSubtype") == 201;
}

- (BOOL)px_isMacSyncedEventsFolder
{
  return [a1 collectionListType] == 3 && objc_msgSend(a1, "collectionListSubtype") == 200;
}

- (BOOL)px_isTopLevelFolder
{
  return [a1 collectionListType] == 2 && objc_msgSend(a1, "collectionListSubtype") == 1000000101;
}

- (uint64_t)px_isRegularFolder
{
  if ([a1 collectionListType] == 2 && objc_msgSend(a1, "collectionListSubtype") == 100) {
    return [a1 isTransient] ^ 1;
  }
  else {
    return 0;
  }
}

- (BOOL)px_isSmartFolder
{
  return [a1 collectionListType] == 3;
}

- (BOOL)px_isFolder
{
  return ([a1 collectionListType] & 0xFFFFFFFFFFFFFFFELL) == 2;
}

@end