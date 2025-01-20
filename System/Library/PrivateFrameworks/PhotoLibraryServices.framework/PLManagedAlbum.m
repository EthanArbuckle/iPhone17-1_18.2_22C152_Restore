@interface PLManagedAlbum
+ (NSString)cloudUUIDKeyForDeletion;
+ (id)albumSupportsAssetOrderKeysPredicate;
+ (id)childKeyForOrdering;
+ (id)entityName;
+ (id)keyPathsForValuesAffectingApproximateCount;
+ (id)keyPathsForValuesAffectingPhotosCount;
+ (id)keyPathsForValuesAffectingVideosCount;
+ (id)validKindsForPersistence;
+ (int64_t)cloudDeletionTypeForTombstone:(id)a3;
+ (void)clearAssetOrderByAbumUUIDs;
- (BOOL)_shouldCopyAssetToCameraRollBeforeAdding:(id)a3;
- (BOOL)albumShouldBeAutomaticallyDeleted;
- (BOOL)canPerformDeleteOperation;
- (BOOL)canPerformEditOperation:(unint64_t)a3;
- (BOOL)isEmpty;
- (BOOL)isValidForPersistence;
- (BOOL)needsPersistenceUpdate;
- (BOOL)supportsAssetOrderKeys;
- (NSMutableOrderedSet)mutableAssets;
- (NSMutableOrderedSet)userEditableAssets;
- (id)_assetOrderByAssetUUID;
- (id)_keysToBeObserved;
- (id)_orderComparisonValueForAsset:(id)a3 iTunesLookupOrder:(id)a4;
- (id)assetOrderByAbumUUIDs;
- (id)childKeyForOrdering;
- (id)descriptionOfAssetOrderValues;
- (id)filteredIndexesForPredicate:(id)a3;
- (id)internalUserEditableAssetsAtIndexes:(id)a3;
- (id)objectInInternalUserEditableAssetsAtIndex:(unint64_t)a3;
- (id)payloadForChangedKeys:(id)a3;
- (int64_t)cloudDeletionType;
- (unint64_t)_albumStandInCount;
- (unint64_t)approximateCount;
- (unint64_t)assetsCount;
- (unint64_t)countOfInternalUserEditableAssets;
- (unint64_t)indexInInternalUserEditableAssetsOfObject:(id)a3;
- (unint64_t)photosCount;
- (unint64_t)videosCount;
- (void)_insertInternalUserEditableAssets:(id)a3 atIndexes:(id)a4 assetsSharingInfos:(id)a5 customExportsInfo:(id)a6 trimmedVideoPathInfo:(id)a7 commentText:(id)a8;
- (void)_removeAssetFromUserAlbumSuggestionIfNeededWithManagedObjectContext:(id)a3;
- (void)addAssetUsingiTunesAlbumOrder:(id)a3;
- (void)didSave;
- (void)insertAssets:(id)a3 atIndexes:(id)a4;
- (void)insertInternalUserEditableAssets:(id)a3 atIndexes:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)persistMetadataToFileSystemWithPathManager:(id)a3;
- (void)prepareForDeletion;
- (void)registerForChanges;
- (void)removeAssetsAtIndexes:(id)a3;
- (void)removeInternalUserEditableAssetsAtIndexes:(id)a3;
- (void)removePersistedFileSystemDataWithPathManager:(id)a3;
- (void)replaceAssetsAtIndexes:(id)a3 withAssets:(id)a4;
- (void)setAlbumShouldBeAutomaticallyDeleted:(BOOL)a3;
- (void)setNeedsPersistenceUpdate:(BOOL)a3;
- (void)sortAssetsUsingiTunesAlbumOrder;
- (void)unregisterForChanges;
- (void)willSave;
@end

@implementation PLManagedAlbum

+ (id)entityName
{
  return @"Album";
}

- (void)setNeedsPersistenceUpdate:(BOOL)a3
{
  *(&self->super.didRegisteredWithUserInterfaceContext + 2) = a3;
}

- (BOOL)needsPersistenceUpdate
{
  return *(&self->super.didRegisteredWithUserInterfaceContext + 2);
}

- (void)setAlbumShouldBeAutomaticallyDeleted:(BOOL)a3
{
  *(&self->super.didRegisteredWithUserInterfaceContext + 1) = a3;
}

- (BOOL)albumShouldBeAutomaticallyDeleted
{
  return *(&self->super.didRegisteredWithUserInterfaceContext + 1);
}

- (id)filteredIndexesForPredicate:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(PLManagedAlbum *)self managedObjectContext];
  v6 = (void *)MEMORY[0x1E4F1C0D0];
  v7 = +[PLManagedAsset entityName];
  v8 = [v6 fetchRequestWithEntityName:v7];

  v9 = (void *)MEMORY[0x1E4F28F60];
  v10 = [(PLManagedAlbum *)self objectID];
  v11 = [v9 predicateWithFormat:@"albums contains %@", v10];

  v12 = (void *)MEMORY[0x1E4F28BA0];
  v13 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v11, v4, 0);

  v14 = [v12 andPredicateWithSubpredicates:v13];

  [v8 setPredicate:v14];
  v15 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"albums" ascending:1];
  v16 = [MEMORY[0x1E4F1C978] arrayWithObject:v15];
  [v8 setSortDescriptors:v16];

  [v8 setResultType:1];
  [v8 setIncludesPropertyValues:0];
  id v22 = 0;
  v17 = [v5 executeFetchRequest:v8 error:&v22];
  id v18 = v22;
  if (v17)
  {
    v19 = [(PLManagedAlbum *)self assets];
    v20 = indexSetForManagedObjectsMatchingIDs();
  }
  else
  {
    v19 = PLBackendGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = v18;
      _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_ERROR, "Failed to get assets in album: %@", buf, 0xCu);
    }
    v20 = 0;
  }

  return v20;
}

- (void)addAssetUsingiTunesAlbumOrder:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_24;
  }
  id v23 = v4;
  v5 = [(PLManagedAlbum *)self _assetOrderByAssetUUID];
  v6 = [(PLManagedAlbum *)self mutableAssets];
  v7 = [(PLManagedAlbum *)self _orderComparisonValueForAsset:v23 iTunesLookupOrder:v5];
  uint64_t v8 = [v6 count];
  if (!v8 || !v7)
  {
    [v6 addObject:v23];
    goto LABEL_23;
  }
  uint64_t v9 = v8;
  unint64_t v10 = v8 - 1;
  v11 = [v6 objectAtIndex:v8 - 1];
  v12 = [(PLManagedAlbum *)self _orderComparisonValueForAsset:v11 iTunesLookupOrder:v5];
  if ([v12 compare:v7] == -1) {
    goto LABEL_20;
  }
  if ((v10 & 0x8000000000000000) != 0)
  {
    uint64_t v18 = -(uint64_t)((unint64_t)(1 - v9) >> 1);
    goto LABEL_19;
  }
  v21 = v12;
  id v22 = v11;
  uint64_t v13 = 0;
  v14 = 0;
  int64_t v15 = v10;
  while (1)
  {
    v16 = v14;
    uint64_t v17 = v15 - v13;
    if (v15 < v13) {
      ++v17;
    }
    uint64_t v18 = v13 + (v17 >> 1);
    v14 = [v6 objectAtIndex:v18];

    v19 = [(PLManagedAlbum *)self _orderComparisonValueForAsset:v14 iTunesLookupOrder:v5];
    uint64_t v20 = [v19 compare:v7];
    if (v20 == -1)
    {
      uint64_t v13 = ++v18;
      goto LABEL_13;
    }
    if (v20 != 1) {
      break;
    }
    int64_t v15 = v18 - 1;
LABEL_13:

    if (v13 > v15) {
      goto LABEL_18;
    }
  }

LABEL_18:
  v12 = v21;
  v11 = v22;
LABEL_19:
  if ((v18 & (unint64_t)~(v18 >> 63)) <= v10) {
    objc_msgSend(v6, "insertObject:atIndex:", v23);
  }
  else {
LABEL_20:
  }
    [v6 addObject:v23];

LABEL_23:
  id v4 = v23;
LABEL_24:
}

- (void)sortAssetsUsingiTunesAlbumOrder
{
  v3 = [(PLManagedAlbum *)self mutableAssets];
  id v4 = [(PLManagedAlbum *)self _assetOrderByAssetUUID];
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __49__PLManagedAlbum_sortAssetsUsingiTunesAlbumOrder__block_invoke;
  unint64_t v10 = &unk_1E58653E8;
  v11 = self;
  id v12 = v4;
  id v5 = v4;
  v6 = (void *)MEMORY[0x19F38D650](&v7);
  if ((objc_msgSend(v3, "pl_isSortedUsingComparator:", v6, v7, v8, v9, v10, v11) & 1) == 0) {
    [v3 sortUsingComparator:v6];
  }
}

uint64_t __49__PLManagedAlbum_sortAssetsUsingiTunesAlbumOrder__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = a3;
  uint64_t v8 = [v5 _orderComparisonValueForAsset:a2 iTunesLookupOrder:v6];
  uint64_t v9 = [*(id *)(a1 + 32) _orderComparisonValueForAsset:v7 iTunesLookupOrder:*(void *)(a1 + 40)];

  uint64_t v10 = [v8 compare:v9];
  return v10;
}

- (id)_assetOrderByAssetUUID
{
  v3 = [(PLManagedAlbum *)self uuid];
  if (v3)
  {
    id v4 = [(PLManagedAlbum *)self assetOrderByAbumUUIDs];
    id v5 = [v4 objectForKey:v3];

    if (!v5)
    {
      uint64_t v6 = [(PLManagedAlbum *)self title];
      NSLog(&cfstr_WarningDidNotF.isa, v6, v3);
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_orderComparisonValueForAsset:(id)a3 iTunesLookupOrder:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [v6 uuid];
  uint64_t v8 = (void *)v7;
  if (v5 && v7)
  {
    uint64_t v9 = [v6 uuid];

    uint64_t v10 = [v5 objectForKey:v9];

    if (!v10)
    {
      uint64_t v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
    }
  }
  else
  {
    uint64_t v10 = [v6 dateCreated];
  }
  return v10;
}

- (id)assetOrderByAbumUUIDs
{
  v3 = (void *)_assetOrderByAbumUUIDs;
  if (!_assetOrderByAbumUUIDs)
  {
    id v4 = (void *)MEMORY[0x1E4F1C9E8];
    id v5 = [(PLGenericAlbum *)self photoLibrary];
    id v6 = [v5 pathManager];
    uint64_t v7 = [v6 pathToAssetAlbumOrderStructure];
    uint64_t v8 = [v4 dictionaryWithContentsOfFile:v7];
    uint64_t v9 = (void *)_assetOrderByAbumUUIDs;
    _assetOrderByAbumUUIDs = v8;

    v3 = (void *)_assetOrderByAbumUUIDs;
    if (!_assetOrderByAbumUUIDs)
    {
      uint64_t v10 = [(PLGenericAlbum *)self photoLibrary];
      v11 = [v10 pathManager];
      id v12 = [v11 pathToAssetAlbumOrderStructure];
      NSLog(&cfstr_ErrorDidNotLoa.isa, v12);

      v3 = (void *)_assetOrderByAbumUUIDs;
    }
  }
  return v3;
}

- (void)removePersistedFileSystemDataWithPathManager:(id)a3
{
  id v5 = a3;
  id v8 = v5;
  if (!v5)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PLManagedAlbum.m", 643, @"Invalid parameter not satisfying: %@", @"pathManager" object file lineNumber description];

    id v5 = 0;
  }
  if ([v5 isDCIM])
  {
    id v6 = [[PLPersistedAlbumMetadata alloc] initWithPLGenericAlbum:self pathManager:v8];
    [(PLPersistedAlbumMetadata *)v6 removePersistedAlbumData];
  }
}

- (void)persistMetadataToFileSystemWithPathManager:(id)a3
{
  id v5 = a3;
  id v8 = v5;
  if (!v5)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PLManagedAlbum.m", 635, @"Invalid parameter not satisfying: %@", @"pathManager" object file lineNumber description];

    id v5 = 0;
  }
  if ([v5 isDCIM])
  {
    id v6 = [[PLPersistedAlbumMetadata alloc] initWithPLGenericAlbum:self pathManager:v8];
    [(PLPersistedAlbumMetadata *)v6 persistAlbumData];
  }
}

- (BOOL)isValidForPersistence
{
  v3 = [(id)objc_opt_class() validKindsForPersistence];
  id v4 = [(PLManagedAlbum *)self kind];
  char v5 = [v3 containsObject:v4];

  return v5;
}

- (void)replaceAssetsAtIndexes:(id)a3 withAssets:(id)a4
{
  id v6 = a4;
  id v8 = a3;
  [(PLManagedAlbum *)self willChange:3 valuesAtIndexes:v8 forKey:@"assets"];
  uint64_t v7 = [(PLManagedAlbum *)self primitiveAssets];
  [v7 replaceObjectsAtIndexes:v8 withObjects:v6];

  [(PLManagedAlbum *)self didChange:3 valuesAtIndexes:v8 forKey:@"assets"];
}

- (void)removeAssetsAtIndexes:(id)a3
{
  id v5 = a3;
  [(PLManagedAlbum *)self willChange:3 valuesAtIndexes:v5 forKey:@"assets"];
  id v4 = [(PLManagedAlbum *)self primitiveAssets];
  [v4 removeObjectsAtIndexes:v5];

  [(PLManagedAlbum *)self didChange:3 valuesAtIndexes:v5 forKey:@"assets"];
}

- (void)insertAssets:(id)a3 atIndexes:(id)a4
{
  id v8 = a4;
  id v6 = a3;
  [(PLManagedAlbum *)self willChange:2 valuesAtIndexes:v8 forKey:@"assets"];
  uint64_t v7 = [(PLManagedAlbum *)self primitiveAssets];
  [v7 insertObjects:v6 atIndexes:v8];

  [(PLManagedAlbum *)self didChange:2 valuesAtIndexes:v8 forKey:@"assets"];
}

- (unint64_t)videosCount
{
  return (int)[(PLManagedAlbum *)self cachedVideosCount];
}

- (unint64_t)photosCount
{
  return (int)[(PLManagedAlbum *)self cachedPhotosCount];
}

- (BOOL)isEmpty
{
  if ([(PLGenericAlbum *)self kindValue] == 4001)
  {
    v3 = [(PLGenericAlbum *)self photoLibrary];
    uint64_t v4 = +[PLManagedAlbumList facesAlbumListInPhotoLibrary:v3];
  }
  else if ([(PLGenericAlbum *)self kindValue] == 4003)
  {
    v3 = [(PLGenericAlbum *)self photoLibrary];
    uint64_t v4 = +[PLManagedAlbumList importListInPhotoLibrary:v3];
  }
  else
  {
    if ([(PLGenericAlbum *)self kindValue] != 4002)
    {
      v8.receiver = self;
      v8.super_class = (Class)PLManagedAlbum;
      return [(PLGenericAlbum *)&v8 isEmpty];
    }
    v3 = [(PLGenericAlbum *)self photoLibrary];
    uint64_t v4 = +[PLManagedAlbumList eventListInPhotoLibrary:v3];
  }
  id v5 = (void *)v4;

  char v6 = [v5 isEmpty];
  return v6;
}

- (unint64_t)assetsCount
{
  if ([(PLGenericAlbum *)self isStandInAlbum])
  {
    return [(PLManagedAlbum *)self _albumStandInCount];
  }
  else
  {
    uint64_t v4 = (void *)MEMORY[0x19F38D3B0]();
    id v5 = [(PLManagedAlbum *)self assets];
    unint64_t v6 = [v5 count];

    return v6;
  }
}

- (unint64_t)approximateCount
{
  if (![(PLGenericAlbum *)self isStandInAlbum]) {
    return (int)[(PLManagedAlbum *)self cachedCount];
  }
  return [(PLManagedAlbum *)self _albumStandInCount];
}

- (unint64_t)_albumStandInCount
{
  if ([(PLGenericAlbum *)self kindValue] == 4001)
  {
    v3 = [(PLGenericAlbum *)self photoLibrary];
    uint64_t v4 = +[PLManagedAlbumList facesAlbumListInPhotoLibrary:v3];
LABEL_7:
    id v5 = (void *)v4;

    unint64_t v6 = [v5 albumsCount];
    return v6;
  }
  if ([(PLGenericAlbum *)self kindValue] == 4003)
  {
    v3 = [(PLGenericAlbum *)self photoLibrary];
    uint64_t v4 = +[PLManagedAlbumList importListInPhotoLibrary:v3];
    goto LABEL_7;
  }
  if ([(PLGenericAlbum *)self kindValue] == 4002)
  {
    v3 = [(PLGenericAlbum *)self photoLibrary];
    uint64_t v4 = +[PLManagedAlbumList eventListInPhotoLibrary:v3];
    goto LABEL_7;
  }
  return 0;
}

- (void)unregisterForChanges
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([(PLGenericAlbum *)self isRegisteredForChanges])
  {
    if ([(PLGenericAlbum *)self didRegisteredWithUserInterfaceContext])
    {
      v3 = +[PLChangeNotificationCenter defaultCenter];
      [(PLManagedAlbum *)self removeObserver:v3 forKeyPath:@"assets" context:&PLChangeNotificationCenterKVOContext];

      uint64_t v4 = +[PLChangeNotificationCenter defaultCenter];
      [(PLManagedAlbum *)self removeObserver:v4 forKeyPath:@"invitationRecords" context:&PLChangeNotificationCenterKVOContext];

      [(PLGenericAlbum *)self setDidRegisteredWithUserInterfaceContext:0];
    }
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v5 = [(PLManagedAlbum *)self _keysToBeObserved];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          [(PLManagedAlbum *)self removeObserver:self forKeyPath:*(void *)(*((void *)&v11 + 1) + 8 * v9++) context:objc_opt_class()];
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)PLManagedAlbum;
  [(PLGenericAlbum *)&v10 unregisterForChanges];
}

- (void)registerForChanges
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (![(PLGenericAlbum *)self isRegisteredForChanges])
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    v3 = [(PLManagedAlbum *)self _keysToBeObserved];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v12;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v3);
          }
          [(PLManagedAlbum *)self addObserver:self forKeyPath:*(void *)(*((void *)&v11 + 1) + 8 * v7++) options:3 context:objc_opt_class()];
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v5);
    }

    if ([(PLManagedObject *)self isRegisteredWithUserInterfaceContext])
    {
      [(PLGenericAlbum *)self setDidRegisteredWithUserInterfaceContext:1];
      uint64_t v8 = +[PLChangeNotificationCenter defaultCenter];
      [(PLManagedAlbum *)self addObserver:v8 forKeyPath:@"assets" options:8 context:&PLChangeNotificationCenterKVOContext];

      uint64_t v9 = +[PLChangeNotificationCenter defaultCenter];
      [(PLManagedAlbum *)self addObserver:v9 forKeyPath:@"invitationRecords" options:8 context:&PLChangeNotificationCenterKVOContext];
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)PLManagedAlbum;
  [(PLGenericAlbum *)&v10 registerForChanges];
}

- (id)_keysToBeObserved
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v4[0] = xmmword_1E58653C0;
  v4[1] = *(_OWORD *)off_1E58653D0;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:4];
  return v2;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  long long v11 = (PLManagedAlbum *)a4;
  id v12 = a5;
  if (objc_opt_class() == a6)
  {
    if (v11 == self)
    {
      if ([(PLManagedAlbum *)v11 faultingState])
      {
        [v10 isEqualToString:@"assets"];
      }
      else
      {
        long long v13 = [(PLManagedAlbum *)v11 managedObjectContext];
        int v14 = [v13 hasChanges];

        int v15 = [v10 isEqualToString:@"assets"];
        if (v14)
        {
          int v16 = v15;
          uint64_t v17 = [(PLManagedAlbum *)v11 managedObjectContext];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            int v18 = [v17 mergingChanges];
          }
          else {
            int v18 = 0;
          }
          if (([(PLManagedAlbum *)v11 isDeleted] & 1) == 0 && ((v16 ^ 1) & 1) == 0)
          {
            v19 = [v12 valueForKey:*MEMORY[0x1E4F284C0]];
            uint64_t v20 = [v19 unsignedIntegerValue];

            if ((v20 & 0xFFFFFFFFFFFFFFFDLL) == 1
              && !v18
              && [(PLGenericAlbum *)v11 shouldDeleteWhenEmpty]
              && ![(PLManagedAlbum *)v11 assetsCount])
            {
              [(PLManagedAlbum *)v11 setAlbumShouldBeAutomaticallyDeleted:1];
            }
          }
        }
      }
    }
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)PLManagedAlbum;
    [(PLManagedAlbum *)&v21 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (void)removeInternalUserEditableAssetsAtIndexes:(id)a3
{
  id v4 = a3;
  id v5 = [(PLManagedAlbum *)self mutableAssets];
  [v5 removeObjectsAtIndexes:v4];
}

- (void)_insertInternalUserEditableAssets:(id)a3 atIndexes:(id)a4 assetsSharingInfos:(id)a5 customExportsInfo:(id)a6 trimmedVideoPathInfo:(id)a7 commentText:(id)a8
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v48 = a8;
  if (!v15)
  {
    v41 = [MEMORY[0x1E4F28B00] currentHandler];
    [v41 handleFailureInMethod:a2, self, @"PLManagedAlbum.m", 331, @"assets cannot be nil. Album: %@", self object file lineNumber description];
  }
  context = (void *)MEMORY[0x19F38D3B0]();
  if ([(PLGenericAlbum *)self isCloudSharedAlbum])
  {
    uint64_t v20 = [(PLGenericAlbum *)self photoLibrary];
    v60[0] = MEMORY[0x1E4F143A8];
    v60[1] = 3221225472;
    v60[2] = __132__PLManagedAlbum__insertInternalUserEditableAssets_atIndexes_assetsSharingInfos_customExportsInfo_trimmedVideoPathInfo_commentText___block_invoke;
    v60[3] = &unk_1E5874110;
    id v61 = v15;
    v62 = self;
    objc_super v21 = v48;
    id v63 = v48;
    id v64 = v17;
    id v65 = v18;
    id v66 = v19;
    [v20 addCompletionHandlerToCurrentTransaction:v60];

    id v22 = v61;
  }
  else
  {
    id v43 = v19;
    id v44 = v18;
    id v45 = v17;
    uint64_t v20 = [(PLGenericAlbum *)self sortingComparator];
    id v23 = [(PLManagedAlbum *)self mutableAssets];
    id v24 = v23;
    id v46 = v16;
    if (v20)
    {
      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      id v42 = v15;
      id v25 = v15;
      uint64_t v26 = [v25 countByEnumeratingWithState:&v56 objects:v68 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v57;
        do
        {
          for (uint64_t i = 0; i != v27; ++i)
          {
            if (*(void *)v57 != v28) {
              objc_enumerationMutation(v25);
            }
            uint64_t v30 = *(void *)(*((void *)&v56 + 1) + 8 * i);
            uint64_t v31 = [v24 count];
            v32 = [v24 array];
            uint64_t v33 = objc_msgSend(v32, "indexOfObject:inSortedRange:options:usingComparator:", v30, 0, v31, 1024, v20);

            [v24 insertObject:v30 atIndex:v33];
          }
          uint64_t v27 = [v25 countByEnumeratingWithState:&v56 objects:v68 count:16];
        }
        while (v27);
      }

      id v15 = v42;
    }
    else
    {
      [v23 insertObjects:v15 atIndexes:v16];
    }
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v34 = v15;
    uint64_t v35 = [v34 countByEnumeratingWithState:&v52 objects:v67 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      id v22 = 0;
      uint64_t v37 = *(void *)v53;
      do
      {
        for (uint64_t j = 0; j != v36; ++j)
        {
          if (*(void *)v53 != v37) {
            objc_enumerationMutation(v34);
          }
          uint64_t v39 = *(void *)(*((void *)&v52 + 1) + 8 * j);
          if ([(PLManagedAlbum *)self _shouldCopyAssetToCameraRollBeforeAdding:v39])
          {
            if (!v22)
            {
              id v22 = [MEMORY[0x1E4F1CA48] array];
            }
            [v22 addObject:v39];
          }
        }
        uint64_t v36 = [v34 countByEnumeratingWithState:&v52 objects:v67 count:16];
      }
      while (v36);
    }
    else
    {
      id v22 = 0;
    }

    if ([v22 count])
    {
      v40 = [(PLGenericAlbum *)self photoLibrary];
      v49[0] = MEMORY[0x1E4F143A8];
      v49[1] = 3221225472;
      v49[2] = __132__PLManagedAlbum__insertInternalUserEditableAssets_atIndexes_assetsSharingInfos_customExportsInfo_trimmedVideoPathInfo_commentText___block_invoke_2;
      v49[3] = &unk_1E5875E18;
      id v22 = v22;
      id v50 = v22;
      v51 = self;
      [v40 addCompletionHandlerToCurrentTransaction:v49];
    }
    id v17 = v45;
    id v16 = v46;
    id v19 = v43;
    id v18 = v44;
    objc_super v21 = v48;
  }
}

void __132__PLManagedAlbum__insertInternalUserEditableAssets_atIndexes_assetsSharingInfos_customExportsInfo_trimmedVideoPathInfo_commentText___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) valueForKeyPath:@"uuid"];
  [*(id *)(a1 + 40) publishBatchOfOriginalAssetUUIDs:v2 withBatchCommentText:*(void *)(a1 + 48) assetsSharingInfos:*(void *)(a1 + 56) customExportsInfo:*(void *)(a1 + 64) andTrimmedVideoPathInfo:*(void *)(a1 + 72) isNewAlbum:0];
}

uint64_t __132__PLManagedAlbum__insertInternalUserEditableAssets_atIndexes_assetsSharingInfos_customExportsInfo_trimmedVideoPathInfo_commentText___block_invoke_2(uint64_t a1)
{
  return +[PLReplaceAssetsWithCameraRollCopiesJob replaceAssets:*(void *)(a1 + 32) withCameraRollCopiesInAlbum:*(void *)(a1 + 40)];
}

- (void)insertInternalUserEditableAssets:(id)a3 atIndexes:(id)a4
{
}

- (id)internalUserEditableAssetsAtIndexes:(id)a3
{
  id v4 = a3;
  id v5 = [(PLManagedAlbum *)self assets];
  uint64_t v6 = [v5 objectsAtIndexes:v4];

  return v6;
}

- (id)objectInInternalUserEditableAssetsAtIndex:(unint64_t)a3
{
  id v4 = [(PLManagedAlbum *)self assets];
  id v5 = [v4 objectAtIndex:a3];

  return v5;
}

- (unint64_t)indexInInternalUserEditableAssetsOfObject:(id)a3
{
  id v4 = a3;
  id v5 = [(PLManagedAlbum *)self assets];
  unint64_t v6 = [v5 indexOfObject:v4];

  return v6;
}

- (unint64_t)countOfInternalUserEditableAssets
{
  id v2 = [(PLManagedAlbum *)self assets];
  unint64_t v3 = [v2 count];

  return v3;
}

- (NSMutableOrderedSet)userEditableAssets
{
  unint64_t v3 = (uint64_t (*)(PLManagedAlbum *, char *, __CFString *))[MEMORY[0x1E4FBA8A8] instanceMethodForSelector:sel_mutableOrderedSetValueForKey_];
  return (NSMutableOrderedSet *)v3(self, sel_mutableOrderedSetValueForKey_, @"internalUserEditableAssets");
}

- (void)didSave
{
  v14.receiver = self;
  v14.super_class = (Class)PLManagedAlbum;
  [(PLGenericAlbum *)&v14 didSave];
  if ([(PLManagedAlbum *)self albumShouldBeAutomaticallyDeleted])
  {
    int v3 = PLIsAssetsd();
    id v4 = [(PLGenericAlbum *)self photoLibrary];
    id v5 = v4;
    if (v3)
    {
      unint64_t v6 = [v4 libraryServicesManager];
      uint64_t v7 = [v6 imageWriter];
      uint64_t v8 = [(PLManagedAlbum *)self objectID];
      [v7 enqueueAutoDeleteEmptyAlbumJobWithAlbumID:v8];
    }
    else
    {
      uint64_t v9 = [v4 assetsdClient];

      unint64_t v6 = [v9 libraryClient];
      uint64_t v7 = [(PLManagedAlbum *)self objectID];
      [v6 automaticallyDeleteEmptyAlbumWithObjectID:v7 completionHandler:&__block_literal_global_14964];
      id v5 = v9;
    }

    [(PLManagedAlbum *)self setAlbumShouldBeAutomaticallyDeleted:0];
  }
  id v10 = [(PLManagedAlbum *)self managedObjectContext];
  if ([(PLManagedAlbum *)self needsPersistenceUpdate])
  {
    long long v11 = [(PLManagedAlbum *)self uuid];
    if (!v11
      || ([(PLManagedAlbum *)self isDeleted] & 1) != 0
      || ![(PLManagedAlbum *)self isValidForPersistence])
    {
      goto LABEL_12;
    }
    int v12 = [(id)objc_opt_class() shouldHavePhotoLibrary];

    if (v12)
    {
      long long v11 = [(PLGenericAlbum *)self photoLibrary];
      long long v13 = [v11 pathManager];
      [(PLManagedAlbum *)self persistMetadataToFileSystemWithPathManager:v13];

LABEL_12:
    }
  }
  [(PLManagedAlbum *)self setNeedsPersistenceUpdate:0];
}

void __25__PLManagedAlbum_didSave__block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((a2 & 1) == 0)
  {
    id v5 = PLBackendGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_ERROR, "Failed to request assetsd to automatically delete empty album: %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)willSave
{
  v18.receiver = self;
  v18.super_class = (Class)PLManagedAlbum;
  [(PLGenericAlbum *)&v18 willSave];
  [(PLManagedAlbum *)self setNeedsPersistenceUpdate:0];
  int v3 = [(PLManagedAlbum *)self managedObjectContext];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [(PLManagedAlbum *)self changedValues];
    if (![(PLManagedAlbum *)self isValidForPersistence]) {
      goto LABEL_9;
    }
    if (([(PLManagedAlbum *)self isInserted] & 1) == 0)
    {
      id v5 = [v4 objectForKeyedSubscript:@"assets"];
      if (v5
        || ([v4 objectForKeyedSubscript:@"title"],
            (id v5 = objc_claimAutoreleasedReturnValue()) != 0)
        || ([v4 objectForKeyedSubscript:@"trashedState"],
            (id v5 = objc_claimAutoreleasedReturnValue()) != 0))
      {
      }
      else
      {
        id v17 = [v4 objectForKeyedSubscript:@"isPrototype"];

        if (!v17)
        {
LABEL_9:
          if (PLPlatformSearchSupported())
          {
            int v6 = [v3 delayedSaveActions];
            [v6 recordAlbumForSearchIndexUpdate:self];
          }
          if ([(PLManagedAlbum *)self isDeleted]) {
            goto LABEL_27;
          }
          if ([(PLManagedAlbum *)self isInserted])
          {
            BOOL v7 = 1;
          }
          else
          {
            uint64_t v8 = [v4 objectForKeyedSubscript:@"assets"];
            BOOL v7 = v8 != 0;
          }
          uint64_t v9 = [v4 objectForKeyedSubscript:@"customKeyAsset"];
          if (v9)
          {

            if (!v7) {
              goto LABEL_23;
            }
          }
          else
          {
            id v10 = [v4 objectForKeyedSubscript:@"customSortKey"];
            if (v10)
            {

              if (!v7) {
                goto LABEL_23;
              }
            }
            else
            {
              long long v11 = [v4 objectForKeyedSubscript:@"customSortAscending"];

              if (!v7)
              {
                if (!v11) {
                  goto LABEL_24;
                }
                goto LABEL_23;
              }
            }
          }
          int v12 = [v3 delayedSaveActions];
          [v12 recordAlbumForCountsAndDateRangeUpdate:self];

LABEL_23:
          long long v13 = [v3 delayedSaveActions];
          [v13 recordAlbumForKeyAssetsUpdate:self];

LABEL_24:
          +[PLDelayedSearchIndexUpdates recordAlbumIfNeeded:self];
          uint64_t v14 = [v4 objectForKeyedSubscript:@"trashedState"];
          if (v14)
          {
            id v15 = (void *)v14;
            int v16 = [(PLManagedAlbum *)self trashedState];

            if (v16 >= 1) {
              [(PLManagedAlbum *)self _removeAssetFromUserAlbumSuggestionIfNeededWithManagedObjectContext:v3];
            }
          }
LABEL_27:

          goto LABEL_28;
        }
      }
    }
    [(PLManagedAlbum *)self setNeedsPersistenceUpdate:1];
    goto LABEL_9;
  }
LABEL_28:
}

- (void)_removeAssetFromUserAlbumSuggestionIfNeededWithManagedObjectContext:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(PLManagedAlbum *)self objectIDsForRelationshipNamed:@"assets", 0];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * v9);
        long long v11 = [v4 delayedSaveActions];
        [v11 recordAssetID:v10 forWidgetUserAlbumRemoval:self];

        int v12 = [v4 delayedSaveActions];
        [v12 recordAssetID:v10 forWallpaperUserAlbumRemoval:self];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

- (int64_t)cloudDeletionType
{
  return 2;
}

- (void)prepareForDeletion
{
  v8.receiver = self;
  v8.super_class = (Class)PLManagedAlbum;
  [(PLManagedObject *)&v8 prepareForDeletion];
  int v3 = [(PLManagedAlbum *)self managedObjectContext];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    +[PLDelayedSearchIndexUpdates recordAlbumIfNeeded:self];
    if (([v3 mergingChanges] & 1) == 0)
    {
      if ([(PLGenericAlbum *)self kindValue] == 2 || [(PLGenericAlbum *)self kindValue] == 1508) {
        [v3 recordCloudDeletionForObject:self];
      }
      id v4 = [(PLManagedAlbum *)self uuid];
      if (v4
        && ([(PLManagedAlbum *)self isValidForPersistence]
         || +[PLGenericAlbum is1WaySyncKind:[(PLGenericAlbum *)self kindValue]]))
      {
        id v5 = [(PLManagedAlbum *)self managedObjectContext];
        char v6 = [v5 isReadOnly];

        if (v6)
        {
LABEL_12:
          [(PLManagedAlbum *)self _removeAssetFromUserAlbumSuggestionIfNeededWithManagedObjectContext:v3];
          goto LABEL_13;
        }
        id v4 = [(PLGenericAlbum *)self photoLibrary];
        uint64_t v7 = [v4 pathManager];
        [(PLManagedAlbum *)self removePersistedFileSystemDataWithPathManager:v7];
      }
      goto LABEL_12;
    }
  }
LABEL_13:
}

- (NSMutableOrderedSet)mutableAssets
{
  return (NSMutableOrderedSet *)[(PLManagedAlbum *)self mutableOrderedSetValueForKey:@"assets"];
}

- (id)childKeyForOrdering
{
  return @"assets";
}

- (BOOL)supportsAssetOrderKeys
{
  int v2 = [(PLGenericAlbum *)self kindValue];
  return v2 == 2 || v2 == 1000;
}

- (BOOL)_shouldCopyAssetToCameraRollBeforeAdding:(id)a3
{
  id v4 = a3;
  if ([(PLGenericAlbum *)self kindValue] == 2) {
    char v5 = [v4 isPhotoStreamPhoto];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)canPerformDeleteOperation
{
  return [(PLManagedAlbum *)self canPerformEditOperation:32];
}

- (BOOL)canPerformEditOperation:(unint64_t)a3
{
  int v5 = [(PLGenericAlbum *)self kindValue];
  if (v5 > 1499)
  {
    if ((v5 - 1600) <= 4 && ((1 << (v5 - 64)) & 0x19) != 0 || v5 == 1500) {
      return a3 < 2;
    }
    if (v5 != 1505) {
      return 0;
    }
    BOOL v11 = [(PLGenericAlbum *)self isFamilyCloudSharedAlbum];
    BOOL v12 = [(PLGenericAlbum *)self isOwnedCloudSharedAlbum];
    if (v11)
    {
      uint64_t v13 = -6;
    }
    else
    {
      if (v12) {
        return (a3 & 0xFFFFFFFFFFFFFFEFLL) != 0;
      }
      BOOL v12 = [(PLGenericAlbum *)self isMultipleContributorCloudSharedAlbum];
      uint64_t v13 = -34;
    }
    BOOL v6 = (a3 & v13) == 0;
    BOOL v8 = (a3 & 0xFFFFFFFFFFFFFFDALL) == 0;
    BOOL v9 = !v12;
  }
  else
  {
    BOOL v6 = (a3 & 1) == 0;
    BOOL v7 = (a3 & 0xFFFFFFFFFFFFFFF6) == 0;
    if (v5 != 1000) {
      BOOL v7 = 0;
    }
    BOOL v8 = v5 == 12 || v7;
    BOOL v9 = v5 == 2;
  }
  if (v9) {
    return v6;
  }
  else {
    return v8;
  }
}

+ (void)clearAssetOrderByAbumUUIDs
{
  int v2 = (void *)_assetOrderByAbumUUIDs;
  _assetOrderByAbumUUIDs = 0;
}

+ (id)validKindsForPersistence
{
  pl_dispatch_once();
  int v2 = (void *)validKindsForPersistence_pl_once_object_16;
  return v2;
}

void __42__PLManagedAlbum_validKindsForPersistence__block_invoke()
{
  uint64_t v0 = [&unk_1EEBF16A0 copy];
  v1 = (void *)validKindsForPersistence_pl_once_object_16;
  validKindsForPersistence_pl_once_object_16 = v0;
}

+ (id)keyPathsForValuesAffectingVideosCount
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"cachedVideosCount"];
}

+ (id)keyPathsForValuesAffectingPhotosCount
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"cachedPhotosCount"];
}

+ (id)keyPathsForValuesAffectingApproximateCount
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"cachedCount"];
}

+ (NSString)cloudUUIDKeyForDeletion
{
  return (NSString *)@"cloudGUID";
}

+ (int64_t)cloudDeletionTypeForTombstone:(id)a3
{
  return 2;
}

+ (id)childKeyForOrdering
{
  return @"assets";
}

+ (id)albumSupportsAssetOrderKeysPredicate
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"kind == %d || kind == %d", 2, 1000);
}

- (id)descriptionOfAssetOrderValues
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  int v3 = [(PLManagedAlbum *)self managedObjectContext];
  id v4 = [MEMORY[0x1E4F28E78] string];
  int v5 = (void *)MEMORY[0x19F38D3B0]();
  BOOL v6 = [(PLManagedAlbum *)self objectID];
  BOOL v7 = objc_msgSend(v3, "_orderKeysForRelationshipWithName__:onObjectWithID:", @"assets", v6);

  if ([v7 count] == 2)
  {
    id v24 = v5;
    id v25 = v3;
    BOOL v8 = [v7 objectAtIndexedSubscript:1];
    BOOL v9 = [v8 objectEnumerator];

    uint64_t v10 = [(PLManagedAlbum *)self objectID];
    BOOL v11 = [v10 URIRepresentation];
    BOOL v12 = [v7 objectAtIndexedSubscript:0];
    [v4 appendFormat:@"ALBUM %@ [%d]\n", v11, objc_msgSend(v12, "count")];

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v13 = [v7 objectAtIndexedSubscript:0];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v27 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          id v19 = [v9 nextObject];
          uint64_t v20 = [v18 URIRepresentation];
          [v4 appendFormat:@"%@ -> %@\n", v19, v20];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v15);
    }

    int v5 = v24;
    int v3 = v25;
  }
  else
  {
    objc_super v21 = [(PLManagedAlbum *)self objectID];
    id v22 = [v21 URIRepresentation];
    [v4 appendFormat:@"ALBUM %@ [0 assets]\n", v22];
  }

  return v4;
}

- (id)payloadForChangedKeys:(id)a3
{
  id v4 = a3;
  if ([(PLManagedAlbum *)self isValidForPersistence]) {
    int v5 = [(PLManagedObjectJournalEntryPayload *)[PLAlbumJournalEntryPayload alloc] initWithManagedObject:self changedKeys:v4];
  }
  else {
    int v5 = 0;
  }

  return v5;
}

@end