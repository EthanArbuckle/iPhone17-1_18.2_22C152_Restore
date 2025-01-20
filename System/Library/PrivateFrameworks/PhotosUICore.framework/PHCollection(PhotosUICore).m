@interface PHCollection(PhotosUICore)
- (id)px_debugDictionary;
- (id)px_exportFolderName;
- (id)px_fetchAncestryIncludingRoot:()PhotosUICore;
- (id)px_fetchContainedAssetCollections;
- (id)px_fetchContainer;
- (id)px_fetchContainerTitle;
- (id)px_navigationURLComponents;
- (id)px_navigationURLQueryItemWithPrefix:()PhotosUICore;
- (id)px_navigationURLWithSelectedObject:()PhotosUICore;
- (id)px_rootAssetCollection;
- (id)px_rootCollectionList;
- (uint64_t)px_allowsSpringLoading;
- (uint64_t)px_assetsDropMode;
- (uint64_t)px_fetchIsEmpty;
- (uint64_t)px_fetchIsEmptyWithOptions:()PhotosUICore;
- (uint64_t)px_isTransientCollectionWithIdentifier:()PhotosUICore;
- (uint64_t)px_navigationURL;
- (void)px_navigationURLHost;
- (void)px_navigationWellKnownName;
@end

@implementation PHCollection(PhotosUICore)

- (uint64_t)px_isTransientCollectionWithIdentifier:()PhotosUICore
{
  return 0;
}

- (uint64_t)px_navigationURL
{
  return objc_msgSend(a1, "px_navigationURLWithSelectedObject:", 0);
}

- (id)px_navigationURLWithSelectedObject:()PhotosUICore
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "px_navigationURLComponents");
  id v6 = v4;
  if (!objc_opt_class() || (objc_opt_isKindOfClass() & 1) == 0)
  {
    id v7 = 0;
    v12 = v6;
LABEL_8:

    goto LABEL_9;
  }
  id v7 = v6;

  if (v5 && v7)
  {
    v8 = [v5 queryItems];
    v9 = (void *)[v8 mutableCopy];
    v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      id v11 = [MEMORY[0x1E4F1CA48] array];
    }
    v12 = v11;

    v15 = objc_msgSend(v7, "px_navigationURLQueryItemWithPrefix:", @"revealasset");
    [v12 addObject:v15];

    [v5 setQueryItems:v12];
    goto LABEL_8;
  }
LABEL_9:
  v13 = [v5 URL];

  return v13;
}

- (id)px_navigationURLComponents
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(a1, "px_navigationURLQueryItemWithPrefix:", 0);
  v3 = [v2 value];

  if (v3)
  {
    id v4 = (void *)MEMORY[0x1E4F29088];
    v5 = objc_msgSend(a1, "px_navigationURLHost");
    id v6 = [@"photos://" stringByAppendingString:v5];
    id v7 = [v4 componentsWithString:v6];

    v10[0] = v2;
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    [v7 setQueryItems:v8];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)px_navigationURLQueryItemWithPrefix:()PhotosUICore
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "px_navigationWellKnownName");
  if ([a1 isTransient])
  {
    id v6 = 0;
  }
  else
  {
    id v6 = [a1 uuid];
  }
  id v7 = &stru_1F00B0030;
  if (v4) {
    id v7 = v4;
  }
  if (v5)
  {
    v8 = [NSString stringWithFormat:@"%@%@", v7, @"name"];
    v9 = (void *)MEMORY[0x1E4F290C8];
    v10 = v8;
    id v11 = v5;
  }
  else
  {
    v8 = [NSString stringWithFormat:@"%@%@", v7, @"uuid"];
    v9 = (void *)MEMORY[0x1E4F290C8];
    v10 = v8;
    id v11 = v6;
  }
  v12 = [v9 queryItemWithName:v10 value:v11];

  return v12;
}

- (void)px_navigationWellKnownName
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, a1, @"PHCollection+PhotosUICore.m", 241, @"Method %s is a responsibility of subclass %@", "-[PHCollection(PhotosUICore) px_navigationWellKnownName]", v6 object file lineNumber description];

  abort();
}

- (void)px_navigationURLHost
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, a1, @"PHCollection+PhotosUICore.m", 237, @"Method %s is a responsibility of subclass %@", "-[PHCollection(PhotosUICore) px_navigationURLHost]", v6 object file lineNumber description];

  abort();
}

- (id)px_exportFolderName
{
  v1 = [a1 localizedTitle];
  v2 = [v1 stringByDeletingPathExtension];

  return v2;
}

- (id)px_debugDictionary
{
  v13[3] = *MEMORY[0x1E4F143B8];
  v12[0] = @"localizedTitle";
  uint64_t v2 = [a1 localizedTitle];
  v3 = (void *)v2;
  id v4 = @"nil";
  if (v2) {
    id v4 = (__CFString *)v2;
  }
  v13[0] = v4;
  v12[1] = @"canContainAssets";
  v5 = v4;
  if ([a1 canContainAssets]) {
    id v6 = @"YES";
  }
  else {
    id v6 = @"NO";
  }
  id v7 = v6;
  v13[1] = v7;
  v12[2] = @"canContainCollections";
  if ([a1 canContainCollections]) {
    v8 = @"YES";
  }
  else {
    v8 = @"NO";
  }
  v9 = v8;
  v13[2] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];

  return v10;
}

- (uint64_t)px_fetchIsEmptyWithOptions:()PhotosUICore
{
  return 1;
}

- (uint64_t)px_fetchIsEmpty
{
  uint64_t v2 = [a1 photoLibrary];
  v3 = [v2 librarySpecificFetchOptions];

  uint64_t v4 = objc_msgSend(a1, "px_fetchIsEmptyWithOptions:", v3);
  return v4;
}

- (id)px_fetchContainedAssetCollections
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v6[0] = a1;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  PXCollectAssetCollectionsInCollections(v3, v2);

  uint64_t v4 = [v2 objectEnumerator];

  return v4;
}

- (id)px_fetchAncestryIncludingRoot:()PhotosUICore
{
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", a1, 0);
  id v6 = [MEMORY[0x1E4F39008] fetchCollectionListsContainingCollection:a1 options:0];
  id v7 = [v6 firstObject];

  v8 = objc_msgSend(a1, "px_rootCollectionList");
  if (v7)
  {
    do
    {
      if ([v7 isEqual:v8]) {
        break;
      }
      [v5 insertObject:v7 atIndex:0];
      v9 = [MEMORY[0x1E4F39008] fetchCollectionListsContainingCollection:v7 options:0];
      uint64_t v10 = [v9 firstObject];

      id v7 = (void *)v10;
    }
    while (v10);
  }
  if (a3)
  {
    if (v8)
    {
      id v11 = v8;
    }
    else
    {
      objc_msgSend(a1, "px_rootAssetCollection");
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
LABEL_11:

        goto LABEL_12;
      }
    }
    if (([a1 isEqual:v11] & 1) == 0) {
      [v5 insertObject:v11 atIndex:0];
    }
    goto LABEL_11;
  }
LABEL_12:

  return v5;
}

- (id)px_fetchContainerTitle
{
  id v2 = objc_msgSend(a1, "px_fetchContainer");
  v3 = objc_msgSend(v2, "px_localizedTitle");
  if ([v3 length])
  {
    id v4 = v3;
  }
  else
  {
    if (objc_msgSend(a1, "px_isProjectsFolder")) {
      v5 = @"PXProjectsOutlineTitle";
    }
    else {
      v5 = @"PXAlbumsOutlineTitle";
    }
    PXLocalizedStringFromTable(v5, @"PhotosUICore");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v6 = v4;

  return v6;
}

- (id)px_fetchContainer
{
  id v2 = [a1 photoLibrary];
  v3 = [v2 librarySpecificFetchOptions];

  [v3 setIncludeRootFolder:1];
  id v4 = [MEMORY[0x1E4F39008] fetchCollectionListsContainingCollection:a1 options:v3];
  v5 = [v4 firstObject];

  return v5;
}

- (id)px_rootAssetCollection
{
  id v2 = [a1 photoLibrary];
  v3 = objc_msgSend(v2, "px_virtualCollections");

  if (objc_msgSend(a1, "px_isEvent"))
  {
    uint64_t v4 = [v3 eventsCollection];
LABEL_7:
    v5 = (void *)v4;
    goto LABEL_8;
  }
  if (objc_msgSend(a1, "px_isTrip"))
  {
    uint64_t v4 = [v3 tripsCollection];
    goto LABEL_7;
  }
  if (objc_msgSend(a1, "px_isMemory"))
  {
    uint64_t v4 = [v3 memoriesCollection];
    goto LABEL_7;
  }
  v5 = 0;
LABEL_8:

  return v5;
}

- (id)px_rootCollectionList
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v2 = [a1 photoLibrary];
  v3 = objc_msgSend(v2, "px_virtualCollections");

  if ((objc_msgSend(a1, "px_isSharedAlbumsFolder") & 1) != 0
    || (objc_msgSend(a1, "px_isMediaTypesFolder") & 1) != 0
    || (objc_msgSend(a1, "px_isTopLevelFolder") & 1) != 0
    || objc_msgSend(a1, "px_isProjectsFolder"))
  {
    id v4 = a1;
LABEL_6:
    v5 = v4;
    goto LABEL_7;
  }
  if (objc_msgSend(a1, "px_isSharedAlbum")) {
    goto LABEL_11;
  }
  if (objc_msgSend(a1, "px_isMediaTypeSmartAlbum"))
  {
    id v4 = [v3 mediaTypesCollectionList];
    goto LABEL_6;
  }
  if (objc_msgSend(a1, "px_isLemonadeUtilitiesAlbum"))
  {
    id v4 = [v3 utilitiesCollectionList];
    goto LABEL_6;
  }
  if (objc_msgSend(a1, "px_isUserCreated"))
  {
    id v4 = [v3 rootAlbumCollectionList];
    goto LABEL_6;
  }
  if (objc_msgSend(a1, "px_isSharedActivityVirtualCollection"))
  {
LABEL_11:
    id v4 = [v3 sharedAlbumsCollectionList];
    goto LABEL_6;
  }
  if (objc_msgSend(a1, "px_isContentSyndicationAlbum"))
  {
    id v7 = (void *)MEMORY[0x1E4F39008];
    v9[0] = a1;
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    v5 = [v7 transientCollectionListWithCollections:v8 title:@"SomeTitle"];
  }
  else
  {
    v5 = 0;
  }
LABEL_7:

  return v5;
}

- (uint64_t)px_allowsSpringLoading
{
  if (objc_msgSend(a1, "px_assetsDropMode")) {
    return 1;
  }
  return objc_msgSend(a1, "px_isFolder");
}

- (uint64_t)px_assetsDropMode
{
  return 0;
}

@end