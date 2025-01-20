@interface PHAssetCollection(PhotosUICore)
+ (__CFString)px_builtInAlbumNameForSubtype:()PhotosUICore;
+ (id)px_albumNameForTransientIdentifier:()PhotosUICore;
+ (id)px_fetchContainingCollectionsForAsset:()PhotosUICore excludedAssetCollection:;
+ (id)px_fetchSmartAlbumCollectionsBySubtypeForAlbumSubtypes:()PhotosUICore photoLibrary:;
+ (id)px_fetchSmartAlbumWithSubtype:()PhotosUICore;
+ (id)px_mediaTypeSmartAlbumSubtypes;
+ (id)px_otherAlbumsSubtypes;
+ (id)px_regularAlbumWithTitle:()PhotosUICore;
+ (id)px_smartAlbumWithSubtype:()PhotosUICore;
+ (void)px_fetchAssetCollectionsWithAlbumSubtypes:()PhotosUICore photoLibrary:;
+ (void)px_getType:()PhotosUICore subtype:forBuiltInAlbumName:;
- (BOOL)px_fetchIsEmptyWithOptions:()PhotosUICore;
- (__CFString)px_navigationURLHost;
- (id)px_debugDictionary;
- (id)px_fetchAncestorThatSupportsCustomKeyAssets;
- (id)px_fetchAncestorThatSupportsExplictlyRemovingAssets;
- (id)px_navigationURLComponents;
- (uint64_t)px_assetsDropMode;
- (uint64_t)px_curationType;
- (uint64_t)px_estimatedCuratedAssetsCount;
- (uint64_t)px_isTransientCollectionWithIdentifier:()PhotosUICore;
- (uint64_t)px_navigationWellKnownName;
@end

@implementation PHAssetCollection(PhotosUICore)

+ (id)px_mediaTypeSmartAlbumSubtypes
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__PHAssetCollection_PhotosUICore__px_mediaTypeSmartAlbumSubtypes__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (px_mediaTypeSmartAlbumSubtypes_onceToken != -1) {
    dispatch_once(&px_mediaTypeSmartAlbumSubtypes_onceToken, block);
  }
  v1 = (void *)px_mediaTypeSmartAlbumSubtypes_subtypes;
  return v1;
}

+ (void)px_fetchAssetCollectionsWithAlbumSubtypes:()PhotosUICore photoLibrary:
{
  objc_msgSend(a1, "px_fetchSmartAlbumCollectionsBySubtypeForAlbumSubtypes:photoLibrary:", a3, a4);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  PXMap();
}

+ (id)px_fetchSmartAlbumCollectionsBySubtypeForAlbumSubtypes:()PhotosUICore photoLibrary:
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = objc_msgSend(a4, "px_standardLibrarySpecificFetchOptions");
  objc_msgSend(v6, "setIncludePlacesSmartAlbum:", objc_msgSend(v5, "containsObject:", &unk_1F02D99A0));
  objc_msgSend(v6, "setIncludeDuplicatesAlbums:", objc_msgSend(v5, "containsObject:", &unk_1F02D9970));
  objc_msgSend(v6, "setIncludeAllPhotosSmartAlbum:", objc_msgSend(v5, "containsObject:", &unk_1F02D99B8));
  objc_msgSend(v6, "setIncludeRecentlyEditedSmartAlbum:", objc_msgSend(v5, "containsObject:", &unk_1F02D9988));
  objc_msgSend(v6, "setIncludeScreenRecordingsSmartAlbum:", objc_msgSend(v5, "containsObject:", &unk_1F02D9898));
  objc_msgSend(v6, "setIncludeActionCamVideoSmartAlbum:", objc_msgSend(v5, "containsObject:", &unk_1F02D9820));
  objc_msgSend(v6, "setIncludeProResSmartAlbum:", objc_msgSend(v5, "containsObject:", &unk_1F02D98F8));
  objc_msgSend(v6, "setIncludeSharedLibrarySharingSuggestionsSmartAlbum:", objc_msgSend(v5, "containsObject:", &unk_1F02D99D0));
  objc_msgSend(v6, "setIncludeTrashBinAlbum:", objc_msgSend(v5, "containsObject:", &unk_1F02D9928));
  v17 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"assetCollectionSubtype IN %@", v5];
  objc_msgSend(v6, "setPredicate:");
  v7 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:2 subtype:0x7FFFFFFFFFFFFFFFLL options:v6];
  v8 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v15 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v14, "assetCollectionSubtype"));
        [v8 setObject:v14 forKeyedSubscript:v15];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  return v8;
}

- (id)px_fetchAncestorThatSupportsExplictlyRemovingAssets
{
  if ([a1 assetCollectionType] != 6)
  {
    id v4 = 0;
    goto LABEL_11;
  }
  id v2 = a1;
  __int16 v3 = [v2 type];
  if (!MEMORY[0x1AD10A0B0]())
  {
    if ((unsigned __int16)(v3 - 5) <= 1u)
    {
      id v5 = [MEMORY[0x1E4F39238] fetchParentDayGroupHighlightForHighlight:v2 options:0];
      id v4 = [v5 firstObject];
      if (MEMORY[0x1AD10A0B0]([v4 type]))
      {

        goto LABEL_10;
      }
    }
    id v4 = 0;
    goto LABEL_10;
  }
  id v4 = v2;
LABEL_10:

LABEL_11:
  return v4;
}

- (id)px_fetchAncestorThatSupportsCustomKeyAssets
{
  if ([a1 canContainCustomKeyAssets])
  {
    id v2 = a1;
    goto LABEL_10;
  }
  if ([a1 assetCollectionType] == 6)
  {
    id v3 = a1;
    if ([v3 type] - 5 <= 1)
    {
      id v4 = [MEMORY[0x1E4F39238] fetchParentDayGroupHighlightForHighlight:v3 options:0];
      id v2 = [v4 firstObject];
      if ([v2 canContainCustomKeyAssets])
      {

        goto LABEL_10;
      }
    }
  }
  id v2 = 0;
LABEL_10:
  return v2;
}

- (uint64_t)px_isTransientCollectionWithIdentifier:()PhotosUICore
{
  id v4 = a3;
  if ([a1 isTransient])
  {
    id v5 = [a1 transientIdentifier];
    uint64_t v6 = [v5 isEqual:v4];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (uint64_t)px_estimatedCuratedAssetsCount
{
  uint64_t v4 = [a1 estimatedAssetCount];
  if ([a1 assetCollectionType] == 6)
  {
    id v5 = a1;
    if (v5)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_4;
      }
      id v9 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v12 = (objc_class *)objc_opt_class();
      uint64_t v11 = NSStringFromClass(v12);
      v13 = objc_msgSend(v5, "px_descriptionForAssertionMessage");
      [v9 handleFailureInMethod:a2, v5, @"PHCollection+PhotosUICore.m", 742, @"%@ should be an instance inheriting from %@, but it is %@", @"self", v11, v13 object file lineNumber description];
    }
    else
    {
      id v9 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v10 = (objc_class *)objc_opt_class();
      uint64_t v11 = NSStringFromClass(v10);
      [v9 handleFailureInMethod:a2, 0, @"PHCollection+PhotosUICore.m", 742, @"%@ should be an instance inheriting from %@, but it is nil", @"self", v11 object file lineNumber description];
    }

LABEL_4:
    int v6 = objc_msgSend(v5, "px_curationType");
    if (v6 == 2)
    {
      uint64_t v7 = [v5 extendedCount];
    }
    else
    {
      if (v6 != 1)
      {
LABEL_9:

        return v4;
      }
      uint64_t v7 = [v5 summaryCount];
    }
    uint64_t v4 = v7;
    goto LABEL_9;
  }
  return v4;
}

- (uint64_t)px_curationType
{
  return 0;
}

- (id)px_debugDictionary
{
  v33[8] = *MEMORY[0x1E4F143B8];
  v31.receiver = a1;
  v31.super_class = (Class)&off_1F04AAEB0;
  id v2 = objc_msgSendSuper2(&v31, sel_px_debugDictionary);
  uint64_t v3 = [v2 mutableCopy];

  unint64_t v4 = [a1 assetCollectionType];
  if (v4 > 0xB) {
    id v5 = @"nil";
  }
  else {
    id v5 = off_1E5DC7EB8[v4];
  }
  uint64_t v6 = [a1 assetCollectionSubtype];
  uint64_t v7 = @"nil";
  v30 = (void *)v3;
  if (v6 > 1000000000)
  {
    if (v6 > 1000000300)
    {
      if (v6 > 1000000400)
      {
        if (v6 > 1000000600)
        {
          if (v6 == 1000000601)
          {
            uint64_t v7 = @"Duplicates";
          }
          else if (v6 == 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v7 = @"Any";
          }
        }
        else if (v6 == 1000000401)
        {
          uint64_t v7 = @"Screen Saver Activity Collection";
        }
        else if (v6 == 1000000501)
        {
          uint64_t v7 = @"Content Syndication";
        }
      }
      else
      {
        switch(v6)
        {
          case 1000000301:
            uint64_t v7 = @"Photos Highlight Day";
            break;
          case 1000000302:
            uint64_t v7 = @"Photos Highlight Month";
            break;
          case 1000000303:
            uint64_t v7 = @"Photos Highlight Year";
            break;
          case 1000000304:
            uint64_t v7 = @"Photos Highlight Day Group";
            break;
          default:
            break;
        }
      }
    }
    else
    {
      switch(v6)
      {
        case 1000000201:
          uint64_t v7 = @"Trash Bin";
          break;
        case 1000000202:
        case 1000000208:
        case 1000000209:
        case 1000000210:
        case 1000000213:
        case 1000000216:
        case 1000000217:
          break;
        case 1000000203:
          uint64_t v7 = @"Places";
          break;
        case 1000000204:
          uint64_t v7 = @"User Smart Album";
          break;
        case 1000000205:
          uint64_t v7 = @"Smart Album All Photos";
          break;
        case 1000000206:
          uint64_t v7 = @"Smart Album Recently Edited";
          break;
        case 1000000207:
          uint64_t v7 = @"Smart Album Screen Recordings";
          break;
        case 1000000211:
          uint64_t v7 = @"Smart Album ProRes";
          break;
        case 1000000212:
          uint64_t v7 = @"All Library Duplicates";
          break;
        case 1000000214:
          uint64_t v7 = @"Smart Album Shared Library Sharing Suggestions";
          break;
        case 1000000215:
          id v5 = @"Smart Album Action Cam";
          uint64_t v7 = @"nil";
          break;
        case 1000000218:
          uint64_t v7 = @"Saved";
          break;
        case 1000000219:
          uint64_t v7 = @"Recovered";
          break;
        default:
          if (v6 == 1000000001) {
            uint64_t v7 = @"Camera Roll";
          }
          break;
      }
    }
  }
  else if (v6 <= 199)
  {
    switch(v6)
    {
      case 2:
        uint64_t v7 = @"Regular";
        break;
      case 3:
        uint64_t v7 = @"Synced Event";
        break;
      case 4:
        uint64_t v7 = @"Synced Faces";
        break;
      case 5:
        uint64_t v7 = @"Synced Album";
        break;
      case 6:
        uint64_t v7 = @"Imported";
        break;
      default:
        if (v6 == 100)
        {
          uint64_t v7 = @"My Photo Stream";
        }
        else if (v6 == 101)
        {
          uint64_t v7 = @"Cloud Shared";
        }
        break;
    }
  }
  else
  {
    switch(v6)
    {
      case 200:
        uint64_t v7 = @"Smart Album Generic";
        break;
      case 201:
        uint64_t v7 = @"Smart Album Panaramas";
        break;
      case 202:
        uint64_t v7 = @"Smart Album Videos";
        break;
      case 203:
        uint64_t v7 = @"Smart Album Favorites";
        break;
      case 204:
        uint64_t v7 = @"Smart Album Timelapses";
        break;
      case 205:
        uint64_t v7 = @"Smart Album All Hidden";
        break;
      case 206:
        uint64_t v7 = @"Smart Album Recently Added";
        break;
      case 207:
        uint64_t v7 = @"Smart Album Bursts";
        break;
      case 208:
        uint64_t v7 = @"Smart Album Slomo Videos";
        break;
      case 209:
        uint64_t v7 = @"Smart Album User Library";
        break;
      case 210:
        uint64_t v7 = @"Smart Album Self Portraits";
        break;
      case 211:
        uint64_t v7 = @"Smart Album Screenshots";
        break;
      case 212:
        uint64_t v7 = @"Smart Album Depth Effect";
        break;
      case 213:
        uint64_t v7 = @"Smart Album Live Photos";
        break;
      case 214:
        uint64_t v7 = @"Smart Album Animated";
        break;
      case 215:
        uint64_t v7 = @"Smart album Long Exposures";
        break;
      case 216:
        uint64_t v7 = @"Smart album Unable to Upload";
        break;
      case 217:
        uint64_t v7 = @"Smart Album RAW";
        break;
      case 218:
        uint64_t v7 = @"Smart Album Cinematic";
        break;
      case 219:
        uint64_t v7 = @"Smart Album Spatial";
        break;
      default:
        break;
    }
  }
  v32[0] = @"debugDescription";
  v29 = [a1 debugDescription];
  v33[0] = v29;
  v33[1] = v5;
  v32[1] = @"assetCollectionType";
  v32[2] = @"assetCollectionSubtype";
  v33[2] = v7;
  v32[3] = @"estimatedAssetCount";
  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "estimatedAssetCount"));
  v33[3] = v8;
  v32[4] = @"startDate";
  uint64_t v9 = [a1 startDate];
  uint64_t v10 = (void *)v9;
  if (v9) {
    uint64_t v11 = (__CFString *)v9;
  }
  else {
    uint64_t v11 = @"nil";
  }
  v33[4] = v11;
  v32[5] = @"endDate";
  v28 = v11;
  uint64_t v12 = [a1 endDate];
  v13 = (void *)v12;
  if (v12) {
    v14 = (__CFString *)v12;
  }
  else {
    v14 = @"nil";
  }
  v33[5] = v14;
  v32[6] = @"approximateLocation";
  v15 = v14;
  v16 = [a1 approximateLocation];
  uint64_t v17 = [v16 debugDescription];
  long long v18 = (void *)v17;
  if (v17) {
    long long v19 = (__CFString *)v17;
  }
  else {
    long long v19 = @"nil";
  }
  v33[6] = v19;
  v32[7] = @"localizedLocationNames";
  long long v20 = v19;
  uint64_t v21 = [a1 localizedLocationNames];
  v22 = (void *)v21;
  if (v21) {
    uint64_t v23 = (__CFString *)v21;
  }
  else {
    uint64_t v23 = @"nil";
  }
  v33[7] = v23;
  v24 = (void *)MEMORY[0x1E4F1C9E8];
  v25 = v23;
  v26 = [v24 dictionaryWithObjects:v33 forKeys:v32 count:8];

  [v30 addEntriesFromDictionary:v26];
  return v30;
}

- (id)px_navigationURLComponents
{
  if (objc_msgSend(a1, "px_isPlacesSmartAlbum"))
  {
    id v2 = @"places";
LABEL_5:
    id v5 = (void *)MEMORY[0x1E4F29088];
    uint64_t v6 = [@"photos://" stringByAppendingString:v2];
    uint64_t v7 = [v5 componentsWithString:v6];

    goto LABEL_7;
  }
  if ([a1 isTransient])
  {
    uint64_t v3 = (void *)MEMORY[0x1E4F38EE8];
    unint64_t v4 = [a1 transientIdentifier];
    objc_msgSend(v3, "px_albumNameForTransientIdentifier:", v4);
    id v2 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (v2) {
      goto LABEL_5;
    }
  }
  v9.receiver = a1;
  v9.super_class = (Class)&off_1F04AAEB0;
  uint64_t v7 = objc_msgSendSuper2(&v9, sel_px_navigationURLComponents);
LABEL_7:
  return v7;
}

- (uint64_t)px_navigationWellKnownName
{
  v1 = (void *)MEMORY[0x1E4F38EE8];
  uint64_t v2 = [a1 assetCollectionSubtype];
  return objc_msgSend(v1, "px_builtInAlbumNameForSubtype:", v2);
}

- (__CFString)px_navigationURLHost
{
  return @"album";
}

- (uint64_t)px_assetsDropMode
{
  if ((objc_msgSend(a1, "px_isAllPhotosSmartAlbum") & 1) != 0
    || (objc_msgSend(a1, "px_isRecentsSmartAlbum") & 1) != 0
    || (objc_msgSend(a1, "px_isPhotosVirtualCollection") & 1) != 0)
  {
    return 2;
  }
  if (objc_msgSend(a1, "px_isFavoritesSmartAlbum")) {
    return 1;
  }
  if ([a1 canPerformEditOperation:3]) {
    return 1;
  }
  if (objc_msgSend(a1, "px_isMemory"))
  {
    uint64_t v3 = +[PXStorySettings sharedInstance];
    int v4 = [v3 allowCustomUserAssets];

    if (v4) {
      return 1;
    }
  }
  return 0;
}

- (BOOL)px_fetchIsEmptyWithOptions:()PhotosUICore
{
  id v4 = a3;
  uint64_t v5 = [a1 estimatedAssetCount];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_6;
  }
  uint64_t v6 = v5;
  if ([v4 sharingFilter] != 2) {
    goto LABEL_6;
  }
  uint64_t v7 = [v4 predicate];
  if (v7)
  {

LABEL_6:
    objc_super v9 = (void *)[v4 copy];
    [v9 setWantsIncrementalChangeDetails:0];
    [v9 setFetchLimit:1];
    uint64_t v10 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:a1 options:v9];
    uint64_t v6 = [v10 count];

    goto LABEL_7;
  }
  v8 = [v4 internalPredicate];

  if (v8) {
    goto LABEL_6;
  }
LABEL_7:

  return v6 == 0;
}

+ (id)px_fetchContainingCollectionsForAsset:()PhotosUICore excludedAssetCollection:
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 photoLibrary];
  v8 = [v7 librarySpecificFetchOptions];

  if (v6)
  {
    objc_super v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self != %@", v6];
    [v8 setPredicate:v9];
  }
  uint64_t v10 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsContainingAsset:v5 withType:1 options:v8];

  return v10;
}

+ (id)px_fetchSmartAlbumWithSubtype:()PhotosUICore
{
  id v5 = objc_msgSend(MEMORY[0x1E4F390A0], "px_standardFetchOptions");
  [v5 setIncludePlacesSmartAlbum:a3 == 1000000203];
  [v5 setIncludeAllPhotosSmartAlbum:a3 == 1000000205];
  [v5 setIncludeRecentlyEditedSmartAlbum:a3 == 1000000206];
  [v5 setIncludeScreenRecordingsSmartAlbum:a3 == 1000000207];
  [v5 setIncludeUserSmartAlbums:a3 == 1000000204];
  [v5 setIncludeProResSmartAlbum:a3 == 1000000211];
  [v5 setIncludeSharedLibrarySharingSuggestionsSmartAlbum:a3 == 1000000214];
  [v5 setIncludeDuplicatesAlbums:a3 == 1000000212];
  id v6 = [a1 fetchAssetCollectionsWithType:2 subtype:a3 options:v5];

  return v6;
}

+ (id)px_smartAlbumWithSubtype:()PhotosUICore
{
  v1 = objc_msgSend(a1, "px_fetchSmartAlbumWithSubtype:");
  uint64_t v2 = [v1 firstObject];

  return v2;
}

+ (id)px_regularAlbumWithTitle:()PhotosUICore
{
  uint64_t v3 = (void *)MEMORY[0x1E4F390A0];
  id v4 = a3;
  id v5 = objc_msgSend(v3, "px_standardFetchOptions");
  [v5 setFetchLimit:1];
  id v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"title == %@", v4];

  [v5 setPredicate:v6];
  uint64_t v7 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:1 subtype:2 options:v5];
  v8 = [v7 firstObject];

  return v8;
}

+ (id)px_otherAlbumsSubtypes
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__PHAssetCollection_PhotosUICore__px_otherAlbumsSubtypes__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (px_otherAlbumsSubtypes_onceToken != -1) {
    dispatch_once(&px_otherAlbumsSubtypes_onceToken, block);
  }
  v1 = (void *)px_otherAlbumsSubtypes_subtypes;
  return v1;
}

+ (void)px_getType:()PhotosUICore subtype:forBuiltInAlbumName:
{
  id v10 = a5;
  if ([v10 isEqualToString:@"faces"])
  {
    uint64_t v7 = 4;
LABEL_7:
    uint64_t v8 = 1;
    goto LABEL_8;
  }
  if ([v10 isEqualToString:@"import-history"])
  {
    uint64_t v7 = 200;
    uint64_t v8 = 9;
    goto LABEL_8;
  }
  if ([v10 isEqualToString:@"photostream"])
  {
    uint64_t v7 = 100;
    goto LABEL_7;
  }
  if ([v10 isEqualToString:@"panoramas"])
  {
    uint64_t v7 = 201;
  }
  else if ([v10 isEqualToString:@"spatial"])
  {
    uint64_t v7 = 219;
  }
  else if ([v10 isEqualToString:@"videos"])
  {
    uint64_t v7 = 202;
  }
  else if ([v10 isEqualToString:@"favorites"])
  {
    uint64_t v7 = 203;
  }
  else if ([v10 isEqualToString:@"timelapses"])
  {
    uint64_t v7 = 204;
  }
  else if ([v10 isEqualToString:@"hidden"])
  {
    uint64_t v7 = 205;
  }
  else
  {
    if ([v10 isEqualToString:@"recents"]) {
      goto LABEL_24;
    }
    if ([v10 isEqualToString:@"bursts"])
    {
      uint64_t v7 = 207;
      goto LABEL_58;
    }
    if ([v10 isEqualToString:@"slomo"])
    {
      uint64_t v7 = 208;
      goto LABEL_58;
    }
    if ([v10 isEqualToString:@"camera-roll"])
    {
LABEL_24:
      uint64_t v7 = 209;
    }
    else if ([v10 isEqualToString:@"selfies"])
    {
      uint64_t v7 = 210;
    }
    else if ([v10 isEqualToString:@"screenshots"])
    {
      uint64_t v7 = 211;
    }
    else if ([v10 isEqualToString:@"depth-effect"])
    {
      uint64_t v7 = 212;
    }
    else if ([v10 isEqualToString:@"live-photos"])
    {
      uint64_t v7 = 213;
    }
    else if ([v10 isEqualToString:@"animated"])
    {
      uint64_t v7 = 214;
    }
    else if ([v10 isEqualToString:@"long-exposures"])
    {
      uint64_t v7 = 215;
    }
    else if ([v10 isEqualToString:@"unable-to-upload"])
    {
      uint64_t v7 = 216;
    }
    else
    {
      if ([v10 isEqualToString:@"recently-deleted"])
      {
        uint64_t v8 = 2;
        uint64_t v7 = 1000000201;
        goto LABEL_8;
      }
      if ([v10 isEqualToString:@"shared-library-sharing-suggestions"])
      {
        uint64_t v7 = 1000000214;
      }
      else if ([v10 isEqualToString:@"duplicates"])
      {
        uint64_t v7 = 1000000212;
      }
      else if ([v10 isEqualToString:@"cinematic"])
      {
        uint64_t v7 = 218;
      }
      else if ([v10 isEqualToString:@"raw"])
      {
        uint64_t v7 = 217;
      }
      else if ([v10 isEqualToString:@"recently-saved"])
      {
        uint64_t v7 = 1000000218;
      }
      else
      {
        int v9 = [v10 isEqualToString:@"recovered"];
        uint64_t v7 = 1000000219;
        if (!v9) {
          uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
        }
      }
    }
  }
LABEL_58:
  uint64_t v8 = 2;
LABEL_8:
  *a3 = v8;
  *a4 = v7;
}

+ (__CFString)px_builtInAlbumNameForSubtype:()PhotosUICore
{
  id v4 = 0;
  if (a3 > 1000000200)
  {
    switch(a3)
    {
      case 1000000212:
        id v5 = PXProgrammaticNavigationWellKnownNameDuplicates;
        break;
      case 1000000213:
      case 1000000215:
      case 1000000216:
      case 1000000217:
        goto LABEL_33;
      case 1000000214:
        id v5 = PXProgrammaticNavigationWellKnownNameSharedLibrarySuggestions;
        break;
      case 1000000218:
        id v5 = PXProgrammaticNavigationWellKnownNameRecentlySaved;
        break;
      case 1000000219:
        id v5 = PXProgrammaticNavigationWellKnownNameRecovered;
        break;
      default:
        if (a3 != 1000000201) {
          goto LABEL_33;
        }
        id v5 = PXProgrammaticNavigationWellKnownNameRecentlyDeleted;
        break;
    }
  }
  else
  {
    switch(a3)
    {
      case 201:
        id v5 = PXProgrammaticNavigationWellKnownNamePanoramas;
        break;
      case 202:
        id v5 = PXProgrammaticNavigationWellKnownNameVideos;
        break;
      case 203:
        id v5 = PXProgrammaticNavigationWellKnownNameFavorites;
        break;
      case 204:
        id v5 = PXProgrammaticNavigationWellKnownNameTimelapses;
        break;
      case 205:
        id v5 = PXProgrammaticNavigationWellKnownNameHidden;
        break;
      case 206:
        goto LABEL_33;
      case 207:
        id v5 = PXProgrammaticNavigationWellKnownNameBursts;
        break;
      case 208:
        id v5 = PXProgrammaticNavigationWellKnownNameSlomo;
        break;
      case 209:
        id v5 = PXProgrammaticNavigationWellKnownNameCameraRoll;
        break;
      case 210:
        id v5 = PXProgrammaticNavigationWellKnownNameSelfies;
        break;
      case 211:
        id v5 = PXProgrammaticNavigationWellKnownNameScreenshots;
        break;
      case 212:
        id v5 = PXProgrammaticNavigationWellKnownNameDepthEffect;
        break;
      case 213:
        id v5 = PXProgrammaticNavigationWellKnownNameLivePhotos;
        break;
      case 214:
        id v5 = PXProgrammaticNavigationWellKnownNameAnimated;
        break;
      case 215:
        id v5 = PXProgrammaticNavigationWellKnownNameLongExposures;
        break;
      case 216:
        id v5 = PXProgrammaticNavigationWellKnownNameUnableToUpload;
        break;
      case 217:
        id v5 = PXProgrammaticNavigationWellKnownNameRaw;
        break;
      case 218:
        id v5 = PXProgrammaticNavigationWellKnownNameCinematicVideos;
        break;
      case 219:
        id v5 = PXProgrammaticNavigationWellKnownNameSpatial;
        break;
      default:
        if (a3 == 4)
        {
          id v5 = PXProgrammaticNavigationWellKnownNameSyncedFaces;
        }
        else
        {
          if (a3 != 100) {
            goto LABEL_33;
          }
          id v5 = PXProgrammaticNavigationWellKnownNamePhotoStream;
        }
        break;
    }
  }
  id v4 = *v5;
LABEL_33:
  return v4;
}

+ (id)px_albumNameForTransientIdentifier:()PhotosUICore
{
  uint64_t v3 = px_albumNameForTransientIdentifier__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&px_albumNameForTransientIdentifier__onceToken, &__block_literal_global_231269);
  }
  id v5 = [(id)px_albumNameForTransientIdentifier__albumNames objectForKeyedSubscript:v4];

  return v5;
}

@end