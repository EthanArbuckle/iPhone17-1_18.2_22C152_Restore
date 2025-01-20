@interface PLAvalanche
+ (BOOL)isValidBurstWithAssets:(id)a3;
+ (BOOL)shouldOnlyShowAvalanchePicks;
+ (CGRect)frameOfTopImageInStackForStackFrame:(CGRect)result;
+ (id)_assetAmongAssets:(id)a3 fromIndexes:(id)a4 excludingIndexes:(id)a5;
+ (id)_fetchRequestForAssetsWithAvalancheUUID:(id)a3;
+ (id)_visibleIndexesAmongAssets:(id)a3 fromUserFavoriteIndexes:(id)a4 stackIndex:(unint64_t)a5;
+ (id)assetsWithAvalancheUUID:(id)a3 inManagedObjectContext:(id)a4;
+ (id)revalidateAvalancheAssets:(id)a3 inLibrary:(id)a4 deleteNonPicks:(BOOL)a5 allowDissolve:(BOOL)a6;
+ (id)updatePropertiesForAssets:(id)a3 autoPicks:(id)a4 stackAsset:(id)a5 userFavorites:(id)a6 deleteNonPicks:(BOOL)a7 setFirstPick:(BOOL)a8 allowDissolve:(BOOL)a9;
+ (unint64_t)_calculateStackAssetForAssetCount:(unint64_t)a3 autoPicks:(id)a4 userFavorites:(id)a5;
+ (unint64_t)countForAssetsWithAvalancheUUID:(id)a3 inLibrary:(id)a4;
+ (void)disolveBurstForAssets:(id)a3 permanently:(BOOL)a4;
+ (void)handleUpdatesForContextWillSave:(id)a3;
+ (void)removeFavoriteStatus:(id)a3;
+ (void)updateMembershipForAssets:(id)a3 autoPicks:(id)a4 stackAsset:(id)a5 userFavorites:(id)a6 deleteNonPicks:(BOOL)a7 allowDissolve:(BOOL)a8 inLibrary:(id)a9;
- (BOOL)canPerformEditOperation:(unint64_t)a3;
- (BOOL)canShowAvalancheStacks;
- (BOOL)canShowComments;
- (BOOL)isAutoPick:(id)a3;
- (BOOL)isEmpty;
- (BOOL)isUserFavorite:(id)a3;
- (NSArray)localizedLocationNames;
- (NSIndexSet)_originalAutoPickIndexes;
- (NSIndexSet)_originalUserFavoriteIndexes;
- (NSMutableIndexSet)_autoPickIndexes;
- (NSMutableIndexSet)_userFavoriteIndexes;
- (NSOrderedSet)assets;
- (NSString)description;
- (NSString)localizedTitle;
- (NSString)title;
- (NSString)uuid;
- (PLAvalanche)initWithUUID:(id)a3 photoLibrary:(id)a4;
- (PLManagedAsset)_aNewPick;
- (PLManagedAsset)_anOldPick;
- (PLPhotoLibrary)photoLibrary;
- (id)_completionHandler;
- (id)autoPicks;
- (id)proposedStackAssetAfterRemovingFavorite:(id)a3;
- (id)stackAsset;
- (id)userFavorites;
- (unint64_t)_originalStackIndex;
- (unint64_t)_stackIndex;
- (unint64_t)approximateCount;
- (unint64_t)assetsCount;
- (unint64_t)photosCount;
- (unint64_t)videosCount;
- (void)_recalculateStackAsset;
- (void)_setANewPick:(id)a3;
- (void)_setAnOldPick:(id)a3;
- (void)_setCompletionHandler:(id)a3;
- (void)addUserFavorite:(id)a3;
- (void)applyChangesAndDeleteNonPicks:(BOOL)a3 currentContainer:(id)a4 completionHandler:(id)a5;
- (void)applyTrashedState:(signed __int16)a3 withTrashedReason:(unsigned __int16)a4;
- (void)assetsDidChange:(id)a3;
- (void)dealloc;
- (void)removeUserFavorite:(id)a3;
- (void)setAssets:(id)a3;
- (void)setHidden:(BOOL)a3;
- (void)set_autoPickIndexes:(id)a3;
- (void)set_originalAutoPickIndexes:(id)a3;
- (void)set_originalStackIndex:(unint64_t)a3;
- (void)set_originalUserFavoriteIndexes:(id)a3;
- (void)set_stackIndex:(unint64_t)a3;
- (void)set_userFavoriteIndexes:(id)a3;
@end

@implementation PLAvalanche

- (void).cxx_destruct
{
  objc_storeStrong(&self->__completionHandler, 0);
  objc_storeStrong((id *)&self->__anOldPick, 0);
  objc_storeStrong((id *)&self->__aNewPick, 0);
  objc_storeStrong((id *)&self->__userFavoriteIndexes, 0);
  objc_storeStrong((id *)&self->__originalUserFavoriteIndexes, 0);
  objc_storeStrong((id *)&self->__autoPickIndexes, 0);
  objc_storeStrong((id *)&self->__originalAutoPickIndexes, 0);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (void)_setCompletionHandler:(id)a3
{
}

- (id)_completionHandler
{
  return self->__completionHandler;
}

- (void)_setAnOldPick:(id)a3
{
}

- (PLManagedAsset)_anOldPick
{
  return self->__anOldPick;
}

- (void)_setANewPick:(id)a3
{
}

- (PLManagedAsset)_aNewPick
{
  return self->__aNewPick;
}

- (void)set_stackIndex:(unint64_t)a3
{
  self->__stackIndex = a3;
}

- (unint64_t)_stackIndex
{
  return self->__stackIndex;
}

- (void)set_originalStackIndex:(unint64_t)a3
{
  self->__originalStackIndex = a3;
}

- (unint64_t)_originalStackIndex
{
  return self->__originalStackIndex;
}

- (void)set_userFavoriteIndexes:(id)a3
{
}

- (NSMutableIndexSet)_userFavoriteIndexes
{
  return self->__userFavoriteIndexes;
}

- (void)set_originalUserFavoriteIndexes:(id)a3
{
}

- (NSIndexSet)_originalUserFavoriteIndexes
{
  return self->__originalUserFavoriteIndexes;
}

- (void)set_autoPickIndexes:(id)a3
{
}

- (NSMutableIndexSet)_autoPickIndexes
{
  return self->__autoPickIndexes;
}

- (void)set_originalAutoPickIndexes:(id)a3
{
}

- (NSIndexSet)_originalAutoPickIndexes
{
  return self->__originalAutoPickIndexes;
}

- (void)setAssets:(id)a3
{
}

- (NSOrderedSet)assets
{
  return self->_assets;
}

- (PLPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (NSArray)localizedLocationNames
{
  return 0;
}

- (BOOL)canShowAvalancheStacks
{
  return 0;
}

- (BOOL)canShowComments
{
  return 0;
}

- (BOOL)canPerformEditOperation:(unint64_t)a3
{
  return a3 < 2;
}

- (BOOL)isEmpty
{
  v2 = [(PLAvalanche *)self assets];
  BOOL v3 = [v2 count] == 0;

  return v3;
}

- (unint64_t)videosCount
{
  return 0;
}

- (unint64_t)photosCount
{
  v2 = [(PLAvalanche *)self assets];
  unint64_t v3 = [v2 count];

  return v3;
}

- (unint64_t)assetsCount
{
  v2 = [(PLAvalanche *)self assets];
  unint64_t v3 = [v2 count];

  return v3;
}

- (unint64_t)approximateCount
{
  v2 = [(PLAvalanche *)self assets];
  unint64_t v3 = [v2 count];

  return v3;
}

- (NSString)localizedTitle
{
  return 0;
}

- (NSString)title
{
  return 0;
}

- (id)proposedStackAssetAfterRemovingFavorite:(id)a3
{
  id v4 = a3;
  v5 = [(PLAvalanche *)self stackAsset];
  v6 = [(PLAvalanche *)self assets];
  uint64_t v7 = [v6 indexOfObject:v4];

  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = [(PLAvalanche *)self _userFavoriteIndexes];
    v9 = (void *)[v8 mutableCopy];

    [v9 removeIndex:v7];
    v10 = [(PLAvalanche *)self assets];
    uint64_t v11 = [v10 count];
    v12 = [(PLAvalanche *)self _originalAutoPickIndexes];
    unint64_t v13 = +[PLAvalanche _calculateStackAssetForAssetCount:v11 autoPicks:v12 userFavorites:v9];

    if (v13 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v14 = [(PLAvalanche *)self assets];
      uint64_t v15 = [v14 objectAtIndex:v13];

      v5 = (void *)v15;
    }
  }
  return v5;
}

- (BOOL)isAutoPick:(id)a3
{
  id v4 = a3;
  v5 = [(PLAvalanche *)self assets];
  uint64_t v6 = [v5 indexOfObject:v4];

  if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  v8 = [(PLAvalanche *)self _autoPickIndexes];
  char v9 = [v8 containsIndex:v6];

  return v9;
}

- (BOOL)isUserFavorite:(id)a3
{
  id v4 = a3;
  v5 = [(PLAvalanche *)self assets];
  uint64_t v6 = [v5 indexOfObject:v4];

  if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  v8 = [(PLAvalanche *)self _userFavoriteIndexes];
  char v9 = [v8 containsIndex:v6];

  return v9;
}

- (void)removeUserFavorite:(id)a3
{
  id v4 = a3;
  v5 = [(PLAvalanche *)self assets];
  uint64_t v6 = [v5 indexOfObject:v4];

  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = [(PLAvalanche *)self _userFavoriteIndexes];
    [v7 removeIndex:v6];

    [(PLAvalanche *)self _recalculateStackAsset];
  }
}

- (void)addUserFavorite:(id)a3
{
  id v4 = a3;
  v5 = [(PLAvalanche *)self assets];
  uint64_t v6 = [v5 indexOfObject:v4];

  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = [(PLAvalanche *)self _userFavoriteIndexes];
    [v7 addIndex:v6];

    [(PLAvalanche *)self _recalculateStackAsset];
  }
}

- (void)_recalculateStackAsset
{
  id v6 = [(PLAvalanche *)self assets];
  uint64_t v3 = [v6 count];
  id v4 = [(PLAvalanche *)self _originalAutoPickIndexes];
  v5 = [(PLAvalanche *)self _userFavoriteIndexes];
  self->__stackIndex = +[PLAvalanche _calculateStackAssetForAssetCount:v3 autoPicks:v4 userFavorites:v5];
}

- (id)stackAsset
{
  if ([(PLAvalanche *)self _stackIndex] == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v3 = 0;
  }
  else
  {
    id v4 = [(PLAvalanche *)self assets];
    uint64_t v3 = objc_msgSend(v4, "objectAtIndex:", -[PLAvalanche _stackIndex](self, "_stackIndex"));
  }
  return v3;
}

- (id)userFavorites
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CAA0];
  id v4 = [(PLAvalanche *)self assets];
  v5 = [(PLAvalanche *)self _userFavoriteIndexes];
  id v6 = [v4 objectsAtIndexes:v5];
  uint64_t v7 = [v3 orderedSetWithArray:v6];

  return v7;
}

- (id)autoPicks
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CAA0];
  id v4 = [(PLAvalanche *)self assets];
  v5 = [(PLAvalanche *)self _autoPickIndexes];
  id v6 = [v4 objectsAtIndexes:v5];
  uint64_t v7 = [v3 orderedSetWithArray:v6];

  return v7;
}

- (void)setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v5 = [(PLAvalanche *)self assets];
  id v6 = (void *)[v5 mutableCopy];

  uint64_t v7 = [(PLAvalanche *)self userFavorites];
  [v6 minusOrderedSet:v7];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v12++), "setHidden:", v3, (void)v13);
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void)applyTrashedState:(signed __int16)a3 withTrashedReason:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  uint64_t v5 = a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [(PLAvalanche *)self assets];
  id v8 = (void *)[v7 mutableCopy];

  uint64_t v9 = [(PLAvalanche *)self userFavorites];
  [v8 minusOrderedSet:v9];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v14++), "applyTrashedState:withTrashedReason:expungeReasonFromClient:", v5, v4, 0, (void)v16);
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v12);
  }

  if (v5 == 2)
  {
    long long v15 = [v9 array];
    +[PLAvalanche disolveBurstForAssets:v15 permanently:1];
  }
}

- (void)assetsDidChange:(id)a3
{
  id v12 = [a3 updatedAssets];
  if ([v12 count])
  {
    uint64_t v4 = [(PLAvalanche *)self _anOldPick];
    uint64_t v5 = [(PLAvalanche *)self _aNewPick];
    id v6 = (void *)v5;
    if (!(v5 | v4)) {
      goto LABEL_14;
    }
    if (v5)
    {
      if ([v12 containsObject:v5])
      {
        uint64_t v7 = [v6 moment];
        BOOL v8 = v7 == 0;

        if (!v4) {
          goto LABEL_8;
        }
        goto LABEL_10;
      }
      BOOL v8 = 1;
      if (v4)
      {
LABEL_10:
        if ([v12 containsObject:v4])
        {
          id v10 = [(id)v4 moment];
          BOOL v9 = v10 != 0;

LABEL_12:
          if (!v8 && !v9)
          {
            uint64_t v11 = [(PLAvalanche *)self _completionHandler];
            pl_dispatch_async();

            [(PLAvalanche *)self _setAnOldPick:0];
            [(PLAvalanche *)self _setANewPick:0];
            [(PLAvalanche *)self _setCompletionHandler:0];
          }
        }
LABEL_14:

        goto LABEL_15;
      }
    }
    else
    {
      BOOL v8 = 0;
      if (v4) {
        goto LABEL_10;
      }
    }
LABEL_8:
    BOOL v9 = 0;
    goto LABEL_12;
  }
LABEL_15:
}

- (void)applyChangesAndDeleteNonPicks:(BOOL)a3 currentContainer:(id)a4 completionHandler:(id)a5
{
  BOOL v6 = a3;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v34 = a4;
  id v8 = a5;
  BOOL v9 = [(PLAvalanche *)self assets];
  if ([v9 count] == 1)
  {
    id v10 = [v9 firstObject];
    [(PLAvalanche *)self addUserFavorite:v10];
  }
  v33 = v8;
  uint64_t v11 = [(PLAvalanche *)self autoPicks];
  id v12 = [(PLAvalanche *)self userFavorites];
  uint64_t v13 = [(PLAvalanche *)self stackAsset];
  [(PLAvalanche *)self _originalStackIndex];
  v30 = [(PLAvalanche *)self _originalUserFavoriteIndexes];
  v35 = +[PLAvalanche _visibleIndexesAmongAssets:fromUserFavoriteIndexes:stackIndex:](PLAvalanche, "_visibleIndexesAmongAssets:fromUserFavoriteIndexes:stackIndex:", v9);
  LOBYTE(v29) = 1;
  v31 = (void *)v13;
  v32 = (void *)v11;
  id v14 = +[PLAvalanche updatePropertiesForAssets:v9 autoPicks:v11 stackAsset:v13 userFavorites:v12 deleteNonPicks:v6 setFirstPick:0 allowDissolve:v29];
  if (([v9 isSubsetOfOrderedSet:v12] & 1) == 0)
  {
    long long v15 = [v9 firstObject];
    long long v16 = [v15 photoLibrary];

    long long v17 = [v9 array];
    id v18 = +[PLAvalanche revalidateAvalancheAssets:v17 inLibrary:v16 deleteNonPicks:v6 allowDissolve:1];
  }
  unint64_t v19 = [(PLAvalanche *)self _stackIndex];
  v20 = [(PLAvalanche *)self _userFavoriteIndexes];
  uint64_t v21 = +[PLAvalanche _visibleIndexesAmongAssets:v9 fromUserFavoriteIndexes:v20 stackIndex:v19];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v22 = [v9 objectsAtIndexes:v21];
  uint64_t v23 = [v22 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v37 != v25) {
          objc_enumerationMutation(v22);
        }
        [*(id *)(*((void *)&v36 + 1) + 8 * i) generateLargeThumbnailFileIfNecessary];
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v24);
  }

  if (v33)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v27 = +[PLAvalanche _assetAmongAssets:v9 fromIndexes:v35 excludingIndexes:v21];
      uint64_t v28 = +[PLAvalanche _assetAmongAssets:v9 fromIndexes:v21 excludingIndexes:v35];
    }
    else
    {
      uint64_t v27 = 0;
      uint64_t v28 = 0;
    }
    if (v27 | v28)
    {
      [(PLAvalanche *)self _setAnOldPick:v27];
      [(PLAvalanche *)self _setANewPick:v28];
      [(PLAvalanche *)self _setCompletionHandler:v33];
    }
    else
    {
      pl_dispatch_async();
    }
  }
}

- (NSString)description
{
  BOOL v3 = NSString;
  v12.receiver = self;
  v12.super_class = (Class)PLAvalanche;
  uint64_t v4 = [(PLAvalanche *)&v12 description];
  uuid = self->_uuid;
  BOOL v6 = [(NSOrderedSet *)self->_assets valueForKey:@"shortObjectIDURI"];
  uint64_t v7 = [(PLAvalanche *)self _autoPickIndexes];
  unint64_t v8 = [(PLAvalanche *)self _stackIndex];
  BOOL v9 = [(PLAvalanche *)self _userFavoriteIndexes];
  id v10 = [v3 stringWithFormat:@"%@ uuid %@, assets %@, autoPicks %@ stackAsset %lu userFavorites %@ ", v4, uuid, v6, v7, v8, v9];

  return (NSString *)v10;
}

- (void)dealloc
{
  if ((PLIsAssetsd() & 1) == 0)
  {
    BOOL v3 = +[PLChangeNotificationCenter defaultCenter];
    [v3 removeAssetChangeObserver:self];
  }
  v4.receiver = self;
  v4.super_class = (Class)PLAvalanche;
  [(PLAvalanche *)&v4 dealloc];
}

- (PLAvalanche)initWithUUID:(id)a3 photoLibrary:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v29.receiver = self;
  v29.super_class = (Class)PLAvalanche;
  BOOL v9 = [(PLAvalanche *)&v29 init];
  if (v9)
  {
    if (!v7) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"tried to create with nil uuid"];
    }
    objc_storeStrong((id *)&v9->_uuid, a3);
    objc_storeStrong((id *)&v9->_photoLibrary, a4);
    id v10 = [v8 managedObjectContext];
    uint64_t v11 = +[PLAvalanche assetsWithAvalancheUUID:v7 inManagedObjectContext:v10];

    uint64_t v12 = [objc_alloc(MEMORY[0x1E4F1CAA0]) initWithArray:v11];
    assets = v9->_assets;
    v9->_assets = (NSOrderedSet *)v12;

    uint64_t v14 = objc_opt_new();
    autoPickIndexes = v9->__autoPickIndexes;
    v9->__autoPickIndexes = (NSMutableIndexSet *)v14;

    uint64_t v16 = objc_opt_new();
    userFavoriteIndexes = v9->__userFavoriteIndexes;
    v9->__userFavoriteIndexes = (NSMutableIndexSet *)v16;

    v9->__unint64_t stackIndex = 0x7FFFFFFFFFFFFFFFLL;
    id v18 = v9->_assets;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __41__PLAvalanche_initWithUUID_photoLibrary___block_invoke;
    v27[3] = &unk_1E58758A8;
    unint64_t v19 = v9;
    uint64_t v28 = v19;
    [(NSOrderedSet *)v18 enumerateObjectsUsingBlock:v27];
    uint64_t v20 = [(NSMutableIndexSet *)v9->__autoPickIndexes copy];
    originalAutoPickIndexes = v19->__originalAutoPickIndexes;
    v19->__originalAutoPickIndexes = (NSIndexSet *)v20;

    uint64_t v22 = [(NSMutableIndexSet *)v9->__userFavoriteIndexes copy];
    originalUserFavoriteIndexes = v19->__originalUserFavoriteIndexes;
    v19->__originalUserFavoriteIndexes = (NSIndexSet *)v22;

    unint64_t stackIndex = v9->__stackIndex;
    v19->__originalStackIndex = stackIndex;
    if (stackIndex == 0x7FFFFFFFFFFFFFFFLL) {
      [(PLAvalanche *)v19 _recalculateStackAsset];
    }
    if ((PLIsAssetsd() & 1) == 0)
    {
      uint64_t v25 = +[PLChangeNotificationCenter defaultCenter];
      [v25 addAssetChangeObserver:v19];
    }
  }

  return v9;
}

uint64_t __41__PLAvalanche_initWithUUID_photoLibrary___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result = [a2 avalanchePickType];
  char v6 = result;
  if ((result & 4) == 0)
  {
    if ((result & 0x10) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    *(void *)(*(void *)(a1 + 32) + 72) = a3;
    if ((v6 & 8) == 0) {
      return result;
    }
    goto LABEL_7;
  }
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 40) addIndex:a3];
  if ((v6 & 0x10) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v6 & 8) == 0) {
    return result;
  }
LABEL_7:
  id v7 = *(void **)(*(void *)(a1 + 32) + 56);
  return [v7 addIndex:a3];
}

+ (BOOL)shouldOnlyShowAvalanchePicks
{
  return shouldOnlyShowAvalanchePicks_sOnlyShowPicks;
}

uint64_t __43__PLAvalanche_shouldOnlyShowAvalanchePicks__block_invoke()
{
  CFPreferencesAppSynchronize(@"com.apple.mobileslideshow");
  Boolean keyExistsAndHasValidFormat = 0;
  uint64_t result = CFPreferencesGetAppBooleanValue(@"PLOnlyShowAvalanchePicks", @"com.apple.mobileslideshow", &keyExistsAndHasValidFormat);
  if (result) {
    BOOL v1 = 1;
  }
  else {
    BOOL v1 = keyExistsAndHasValidFormat == 0;
  }
  char v2 = v1;
  shouldOnlyShowAvalanchePicks_sOnlyShowPicks = v2;
  return result;
}

+ (CGRect)frameOfTopImageInStackForStackFrame:(CGRect)result
{
  double v3 = result.origin.x + 0.0;
  double v4 = result.origin.y + 5.0;
  double v5 = result.size.height + -5.0;
  result.size.height = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

+ (void)removeFavoriteStatus:(id)a3
{
  id v10 = a3;
  int v3 = [v10 isAvalanchePhoto];
  double v4 = v10;
  if (v3)
  {
    int v5 = [v10 avalanchePickType];
    int v6 = [v10 visibilityState];
    if ((v5 & 4) != 0) {
      int v7 = 36;
    }
    else {
      int v7 = 34;
    }
    if (v5 != (v7 & v5)) {
      objc_msgSend(v10, "setAvalanchePickType:");
    }
    BOOL v8 = +[PLAvalanche shouldOnlyShowAvalanchePicks];
    double v4 = v10;
    if (v8)
    {
      BOOL v9 = v10;
      if (v6 != 2)
      {
        [v10 setVisibilityState:2];
        BOOL v9 = v10;
      }
      [v9 setAlbums:0];
      [v10 setNeedsMomentUpdate:1];
      double v4 = v10;
    }
  }
}

+ (unint64_t)_calculateStackAssetForAssetCount:(unint64_t)a3 autoPicks:(id)a4 userFavorites:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  long long v15 = __73__PLAvalanche__calculateStackAssetForAssetCount_autoPicks_userFavorites___block_invoke;
  uint64_t v16 = &unk_1E58737A8;
  id v9 = v8;
  id v17 = v9;
  id v18 = &v19;
  [v7 enumerateIndexesUsingBlock:&v13];
  unint64_t v10 = v20[3];
  if (v10 == 0x7FFFFFFFFFFFFFFFLL && a3 != 0)
  {
    unint64_t v10 = 0;
    while ((objc_msgSend(v9, "containsIndex:", v10, v13, v14, v15, v16) & 1) != 0)
    {
      if (a3 == ++v10)
      {
        unint64_t v10 = v20[3];
        goto LABEL_10;
      }
    }
    v20[3] = v10;
  }
LABEL_10:

  _Block_object_dispose(&v19, 8);
  return v10;
}

uint64_t __73__PLAvalanche__calculateStackAssetForAssetCount_autoPicks_userFavorites___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = [*(id *)(a1 + 32) containsIndex:a2];
  if ((result & 1) == 0)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
    *a3 = 1;
  }
  return result;
}

+ (id)_assetAmongAssets:(id)a3 fromIndexes:(id)a4 excludingIndexes:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __62__PLAvalanche__assetAmongAssets_fromIndexes_excludingIndexes___block_invoke;
  v13[3] = &unk_1E58709B8;
  id v14 = v8;
  id v9 = v8;
  uint64_t v10 = [a4 indexPassingTest:v13];
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v11 = [v7 objectAtIndex:v10];
  }

  return v11;
}

uint64_t __62__PLAvalanche__assetAmongAssets_fromIndexes_excludingIndexes___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsIndex:a2] ^ 1;
}

+ (id)_visibleIndexesAmongAssets:(id)a3 fromUserFavoriteIndexes:(id)a4 stackIndex:(unint64_t)a5
{
  id v7 = a3;
  id v8 = (void *)MEMORY[0x1E4F28E60];
  id v9 = a4;
  uint64_t v10 = [v8 indexSet];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __77__PLAvalanche__visibleIndexesAmongAssets_fromUserFavoriteIndexes_stackIndex___block_invoke;
  v21[3] = &unk_1E5870968;
  id v22 = v7;
  id v11 = v7;
  uint64_t v12 = (void *)MEMORY[0x19F38D650](v21);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __77__PLAvalanche__visibleIndexesAmongAssets_fromUserFavoriteIndexes_stackIndex___block_invoke_2;
  v18[3] = &unk_1E5870990;
  id v13 = v12;
  id v20 = v13;
  id v14 = v10;
  id v19 = v14;
  [v9 enumerateIndexesUsingBlock:v18];

  if (a5 != 0x7FFFFFFFFFFFFFFFLL && (*((unsigned int (**)(id, unint64_t))v13 + 2))(v13, a5)) {
    [v14 addIndex:a5];
  }
  long long v15 = v19;
  id v16 = v14;

  return v16;
}

BOOL __77__PLAvalanche__visibleIndexesAmongAssets_fromUserFavoriteIndexes_stackIndex___block_invoke(uint64_t a1, uint64_t a2)
{
  char v2 = [*(id *)(a1 + 32) objectAtIndex:a2];
  if ([v2 visibilityState]) {
    BOOL v3 = 0;
  }
  else {
    BOOL v3 = [v2 trashedState] == 0;
  }

  return v3;
}

uint64_t __77__PLAvalanche__visibleIndexesAmongAssets_fromUserFavoriteIndexes_stackIndex___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  if (result)
  {
    int v5 = *(void **)(a1 + 32);
    return [v5 addIndex:a2];
  }
  return result;
}

+ (void)updateMembershipForAssets:(id)a3 autoPicks:(id)a4 stackAsset:(id)a5 userFavorites:(id)a6 deleteNonPicks:(BOOL)a7 allowDissolve:(BOOL)a8 inLibrary:(id)a9
{
  int v9 = a8;
  BOOL v10 = a7;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  if (+[PLAvalanche shouldOnlyShowAvalanchePicks])
  {
    if (v9) {
      LOBYTE(v9) = [v13 isSubsetOfOrderedSet:v15];
    }
    id v16 = (void *)[v13 mutableCopy];
    [v16 minusOrderedSet:v15];
    if (v14) {
      char v17 = v9;
    }
    else {
      char v17 = 1;
    }
    char v18 = v17 | v10;
    if (((v17 | v10) & 1) == 0 && ([v14 isDeleted] & 1) == 0) {
      [v16 removeObject:v14];
    }
    id v19 = [MEMORY[0x1E4F1CA70] orderedSetWithOrderedSet:v15];
    if ((v18 & 1) == 0 && ([v14 isDeleted] & 1) == 0) {
      [v19 insertObject:v14 atIndex:0];
    }
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v20 = v16;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v27 != v23) {
            objc_enumerationMutation(v20);
          }
          uint64_t v25 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          if (v10) {
            [v25 trashWithReason:5];
          }
          else {
            objc_msgSend(v25, "setAlbums:", 0, (void)v26);
          }
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v22);
    }
  }
}

+ (id)updatePropertiesForAssets:(id)a3 autoPicks:(id)a4 stackAsset:(id)a5 userFavorites:(id)a6 deleteNonPicks:(BOOL)a7 setFirstPick:(BOOL)a8 allowDissolve:(BOOL)a9
{
  int v13 = a9;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v41 = a4;
  id v15 = a5;
  id v16 = a6;
  if (a9) {
    int v13 = [v14 isSubsetOfOrderedSet:v16];
  }
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  obuint64_t j = v14;
  uint64_t v17 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
  id v42 = v16;
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v49 != v19) {
          objc_enumerationMutation(obj);
        }
        id v21 = *(id *)(*((void *)&v48 + 1) + 8 * i);
        if (([v21 isDeleted] & 1) == 0)
        {
          int v22 = [v21 avalanchePickType];
          int v23 = [v21 visibilityState];
          if ([v16 containsObject:v21])
          {
            if (v13) {
              int v24 = 0;
            }
            else {
              int v24 = v22 & 0x24 | 8;
            }
            if ([v21 isInTrash])
            {
              [v21 setTrashedState:0];
              [v21 setTrashedDate:0];
            }
            unsigned int v25 = 0;
          }
          else
          {
            if ([v41 containsObject:v21])
            {
              if (!v15)
              {
                id v15 = v21;
                a8 = 0;
              }
              int v24 = v22 & 0x20 | 4;
            }
            else
            {
              int v24 = v22 & 0x20 | 2;
            }
            unsigned int v25 = 2;
          }
          if (a8) {
            int v26 = 48;
          }
          else {
            int v26 = 16;
          }
          if (v15 == v21) {
            unsigned int v27 = v24 & 0xFFFFFFFD | v26;
          }
          else {
            unsigned int v27 = v24;
          }
          if (v15 == v21) {
            uint64_t v28 = 0;
          }
          else {
            uint64_t v28 = v25;
          }
          if (v22 != v27) {
            objc_msgSend(v21, "setAvalanchePickType:");
          }
          if (+[PLAvalanche shouldOnlyShowAvalanchePicks])
          {
            if (v23 != v28) {
              [v21 setVisibilityState:v28];
            }
            [v21 setNeedsMomentUpdate:1];
          }
          if (v13)
          {
            [v21 setAvalancheUUID:0];
            long long v29 = [v21 additionalAttributes];
            [v29 setCloudAvalanchePickType:0];
          }
          id v16 = v42;
        }
      }
      uint64_t v18 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
    }
    while (v18);
  }

  if (v15) {
    int v30 = 1;
  }
  else {
    int v30 = v13;
  }
  if (v30) {
    id v31 = v15;
  }
  else {
    id v31 = 0;
  }
  if ((v30 & 1) == 0 && !a7)
  {
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v32 = obj;
    uint64_t v33 = [v32 countByEnumeratingWithState:&v44 objects:v52 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v45;
      while (2)
      {
        for (uint64_t j = 0; j != v34; ++j)
        {
          if (*(void *)v45 != v35) {
            objc_enumerationMutation(v32);
          }
          long long v37 = *(void **)(*((void *)&v44 + 1) + 8 * j);
          if (([v37 isDeleted] & 1) == 0)
          {
            int v38 = [v37 avalanchePickType];
            if ((v38 & 8) == 0)
            {
              if (v38 != (v38 & 0x24 | 0x10)) {
                objc_msgSend(v37, "setAvalanchePickType:");
              }
              id v16 = v42;
              if (+[PLAvalanche shouldOnlyShowAvalanchePicks](PLAvalanche, "shouldOnlyShowAvalanchePicks")&& [v37 visibilityState])
              {
                [v37 setVisibilityState:0];
              }
              id v31 = v37;
              goto LABEL_67;
            }
          }
        }
        uint64_t v34 = [v32 countByEnumeratingWithState:&v44 objects:v52 count:16];
        if (v34) {
          continue;
        }
        break;
      }
      id v31 = 0;
      id v16 = v42;
    }
    else
    {
      id v31 = 0;
    }
LABEL_67:
  }
  return v31;
}

+ (void)handleUpdatesForContextWillSave:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  double v4 = [v3 object];
  if (v4)
  {
    id v18 = v3;
    context = (void *)MEMORY[0x19F38D3B0]();
    [v4 getAndClearRecordedAvalancheUUIDsForUpdate];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v26 != v7) {
            objc_enumerationMutation(obj);
          }
          int v9 = [a1 assetsWithAvalancheUUID:*(void *)(*((void *)&v25 + 1) + 8 * i) inManagedObjectContext:v4];
          long long v21 = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          id v10 = v9;
          uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v29 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            id v13 = 0;
            uint64_t v14 = *(void *)v22;
            do
            {
              for (uint64_t j = 0; j != v12; ++j)
              {
                if (*(void *)v22 != v14) {
                  objc_enumerationMutation(v10);
                }
                id v16 = *(void **)(*((void *)&v21 + 1) + 8 * j);
                if (([v16 isDeleted] & 1) == 0)
                {
                  if ([v16 isAvalancheStackPhoto]) {
                    goto LABEL_26;
                  }
                  if (!v13)
                  {
                    if ([v16 avalanchePickTypeIsVisible]) {
                      id v13 = 0;
                    }
                    else {
                      id v13 = v16;
                    }
                  }
                }
              }
              uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v29 count:16];
            }
            while (v12);

            if (v13)
            {
              objc_msgSend(v13, "setAvalanchePickType:", objc_msgSend(v13, "avalanchePickType") & 0x24 | 0x10);
              if (+[PLAvalanche shouldOnlyShowAvalanchePicks])
              {
                if ([v13 visibilityState]) {
                  [v13 setVisibilityState:0];
                }
                [v13 setNeedsMomentUpdate:1];
              }
            }
          }
          else
          {
            id v13 = 0;
LABEL_26:
          }
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v6);
    }

    id v3 = v18;
  }
}

+ (id)revalidateAvalancheAssets:(id)a3 inLibrary:(id)a4 deleteNonPicks:(BOOL)a5 allowDissolve:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if ([v9 count] == 1)
  {
    +[PLAvalanche disolveBurstForAssets:v9 permanently:0];
LABEL_41:
    id v19 = 0;
    goto LABEL_51;
  }
  if (![v9 count]) {
    goto LABEL_41;
  }
  BOOL v53 = v7;
  BOOL v54 = v6;
  id v50 = v10;
  uint64_t v11 = [v9 firstObject];
  uint64_t v12 = [v11 avalancheUUID];
  v52 = (void *)[v12 copy];

  id v13 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v14 = [MEMORY[0x1E4F1CA48] array];
  id v15 = [MEMORY[0x1E4F1CA48] array];
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v51 = v9;
  id v16 = v9;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v59 objects:v70 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    id v19 = 0;
    uint64_t v20 = *(void *)v60;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v60 != v20) {
          objc_enumerationMutation(v16);
        }
        long long v22 = *(void **)(*((void *)&v59 + 1) + 8 * i);
        if (([v22 avalanchePickType] & 4) != 0) {
          [v13 addObject:v22];
        }
        if (([v22 avalanchePickType] & 0x20) != 0 && (objc_msgSend(v22, "avalanchePickType") & 8) == 0)
        {
          if (v19) {
            [v14 addObject:v19];
          }
          id v23 = v22;

          id v19 = v23;
        }
        if (([v22 avalanchePickType] & 8) == 0)
        {
          if (v19)
          {
            if (([v19 avalanchePickType] & 4) == 0 && (objc_msgSend(v22, "avalanchePickType") & 4) != 0)
            {
              id v24 = v22;

              id v19 = v24;
            }
          }
          else
          {
            id v19 = v22;
          }
        }
        if (([v22 avalanchePickType] & 0x10) != 0) {
          [v14 addObject:v22];
        }
        if (([v22 avalanchePickType] & 8) != 0) {
          [v15 addObject:v22];
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v59 objects:v70 count:16];
    }
    while (v18);

    if (v19)
    {
      if ((unint64_t)[v14 count] > 1
        || ([v14 firstObject],
            id v25 = (id)objc_claimAutoreleasedReturnValue(),
            v25,
            v25 != v19))
      {
        [v14 removeObject:v19];
        long long v57 = 0u;
        long long v58 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        id v26 = v14;
        uint64_t v27 = [v26 countByEnumeratingWithState:&v55 objects:v69 count:16];
        if (v27)
        {
          uint64_t v28 = v27;
          uint64_t v29 = *(void *)v56;
          do
          {
            for (uint64_t j = 0; j != v28; ++j)
            {
              if (*(void *)v56 != v29) {
                objc_enumerationMutation(v26);
              }
              uint64_t v31 = *(void **)(*((void *)&v55 + 1) + 8 * j);
              objc_msgSend(v31, "setAvalanchePickType:", objc_msgSend(v31, "avalanchePickType") & 0xFFFFFFEFLL);
              if (([v31 avalanchePickType] & 4) == 0) {
                objc_msgSend(v31, "setAvalanchePickType:", objc_msgSend(v31, "avalanchePickType") | 2);
              }
              [v31 setVisibilityState:2];
            }
            uint64_t v28 = [v26 countByEnumeratingWithState:&v55 objects:v69 count:16];
          }
          while (v28);
        }

        [v19 setVisibilityState:0];
        objc_msgSend(v19, "setAvalanchePickType:", objc_msgSend(v19, "avalanchePickType") & 0xFFFFFFED | 0x10);
      }
    }
  }
  else
  {

    id v19 = 0;
  }
  id v32 = (unsigned char *)MEMORY[0x1E4F59AC0];
  if (!*MEMORY[0x1E4F59AC0])
  {
    uint64_t v33 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v34 = [v19 avalancheUUID];
      uint64_t v35 = [v19 uuid];
      *(_DWORD *)buf = 138412546;
      v64 = v34;
      __int16 v65 = 2112;
      v66 = v35;
      _os_log_impl(&dword_19B3C7000, v33, OS_LOG_TYPE_DEFAULT, "Updating burst %@, stack will be set to %@", buf, 0x16u);
    }
    if (!*v32)
    {
      long long v36 = __CPLAssetsdOSLogDomain();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        v64 = v13;
        __int16 v65 = 2112;
        v66 = v15;
        __int16 v67 = 2112;
        id v68 = v16;
        _os_log_impl(&dword_19B3C7000, v36, OS_LOG_TYPE_DEBUG, "autoPicks are %@, favorites are %@, the rest of burst are %@", buf, 0x20u);
      }
    }
  }
  long long v37 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v16];
  int v38 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v13];
  long long v39 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v15];
  LOBYTE(v49) = v54;
  id v40 = +[PLAvalanche updatePropertiesForAssets:v37 autoPicks:v38 stackAsset:v19 userFavorites:v39 deleteNonPicks:v53 setFirstPick:0 allowDissolve:v49];

  id v41 = [[PLAvalanche alloc] initWithUUID:v52 photoLibrary:v50];
  id v42 = [(PLAvalanche *)v41 stackAsset];
  [v42 generateLargeThumbnailFileIfNecessary];

  v43 = [(PLAvalanche *)v41 assets];
  long long v44 = [(PLAvalanche *)v41 autoPicks];
  long long v45 = [(PLAvalanche *)v41 stackAsset];
  long long v46 = [(PLAvalanche *)v41 userFavorites];
  +[PLAvalanche updateMembershipForAssets:v43 autoPicks:v44 stackAsset:v45 userFavorites:v46 deleteNonPicks:v53 allowDissolve:v54 inLibrary:v50];

  id v10 = v50;
  id v9 = v51;
LABEL_51:
  long long v47 = [v19 uuid];

  return v47;
}

+ (void)disolveBurstForAssets:(id)a3 permanently:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
        if (v4)
        {
          [*(id *)(*((void *)&v12 + 1) + 8 * v9) setAvalancheUUID:0];
          [v10 setAvalancheKind:0];
        }
        [v10 setAvalanchePickType:0];
        uint64_t v11 = [v10 additionalAttributes];
        [v11 setCloudAvalanchePickType:0];

        [v10 setVisibilityState:0];
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

+ (BOOL)isValidBurstWithAssets:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ((unint64_t)[v3 count] < 2)
  {
    if (*MEMORY[0x1E4F59AC0]) {
      goto LABEL_35;
    }
    BOOL v4 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      long long v12 = [v3 firstObject];
      long long v13 = [v12 avalancheUUID];
      *(_DWORD *)buf = 138543362;
      int v30 = v13;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "Invalid burst %{public}@, has only 1 asset", buf, 0xCu);
    }
LABEL_34:

    goto LABEL_35;
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  BOOL v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    char v7 = 0;
    uint64_t v8 = *(void *)v26;
LABEL_4:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v26 != v8) {
        objc_enumerationMutation(v4);
      }
      int v10 = objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * v9), "avalanchePickType", (void)v25);
      if ((v10 & 0x10) != 0)
      {
        if (v7)
        {
          if (!*MEMORY[0x1E4F59AC0])
          {
            long long v21 = __CPLAssetsdOSLogDomain();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              long long v22 = [v4 firstObject];
              id v23 = [v22 avalancheUUID];
              *(_DWORD *)buf = 138543362;
              int v30 = v23;
              _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_DEFAULT, "Invalid burst %{public}@, has more than 1 stack pick", buf, 0xCu);
            }
          }
          goto LABEL_34;
        }
        char v7 = 1;
      }
      else if (!v10)
      {
        long long v14 = (unsigned char *)MEMORY[0x1E4F59AC0];
        if (!*MEMORY[0x1E4F59AC0])
        {
          long long v15 = __CPLAssetsdOSLogDomain();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            id v16 = [v4 firstObject];
            uint64_t v17 = [v16 avalancheUUID];
            *(_DWORD *)buf = 138543362;
            int v30 = v17;
            _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_DEFAULT, "Invalid burst %{public}@, burst marked as not in burst", buf, 0xCu);
          }
        }

        if (v7 & 1 | (*v14 != 0)) {
          goto LABEL_35;
        }
        goto LABEL_27;
      }
      if (v6 == ++v9)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v25 objects:v31 count:16];
        if (v6) {
          goto LABEL_4;
        }

        if (v7)
        {
          BOOL v11 = 1;
          goto LABEL_36;
        }
        goto LABEL_20;
      }
    }
  }

LABEL_20:
  if (!*MEMORY[0x1E4F59AC0])
  {
LABEL_27:
    uint64_t v18 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = [v4 firstObject];
      uint64_t v20 = [v19 avalancheUUID];
      *(_DWORD *)buf = 138543362;
      int v30 = v20;
      _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_DEFAULT, "Invalid burst %{public}@, can't find a stack pick", buf, 0xCu);
    }
    BOOL v4 = v18;
    goto LABEL_34;
  }
LABEL_35:
  BOOL v11 = 0;
LABEL_36:

  return v11;
}

+ (id)_fetchRequestForAssetsWithAvalancheUUID:(id)a3
{
  v14[3] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F1C0D0];
  id v4 = a3;
  uint64_t v5 = +[PLManagedAsset entityName];
  uint64_t v6 = [v3 fetchRequestWithEntityName:v5];

  char v7 = (void *)MEMORY[0x1E4F28BA0];
  uint64_t v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K = %@", @"avalancheUUID", v4];

  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = %d", @"avalancheKind", 1, v8);
  v14[1] = v9;
  int v10 = objc_msgSend(MEMORY[0x1E4F8BA10], "predicateForIncludeMask:useIndex:", objc_msgSend(MEMORY[0x1E4F8BA10], "maskForAvalancheSupportedAssets"), 0);
  v14[2] = v10;
  BOOL v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:3];
  long long v12 = [v7 andPredicateWithSubpredicates:v11];

  [v6 setPredicate:v12];
  return v6;
}

+ (unint64_t)countForAssetsWithAvalancheUUID:(id)a3 inLibrary:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [a1 _fetchRequestForAssetsWithAvalancheUUID:v6];
  uint64_t v9 = [v7 managedObjectContext];

  id v14 = 0;
  unint64_t v10 = [v9 countForFetchRequest:v8 error:&v14];
  id v11 = v14;

  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    long long v12 = PLBackendGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v16 = v6;
      __int16 v17 = 2112;
      id v18 = v11;
      _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_ERROR, "Error counting assets with avalancheUUID %@: %@", buf, 0x16u);
    }
  }
  return v10;
}

+ (id)assetsWithAvalancheUUID:(id)a3 inManagedObjectContext:(id)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [a1 _fetchRequestForAssetsWithAvalancheUUID:v6];
  v23[0] = @"additionalAttributes";
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  [v8 setRelationshipKeyPathsForPrefetching:v9];

  unint64_t v10 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"dateCreated" ascending:1];
  v22[0] = v10;
  id v11 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"additionalAttributes.originalFilename" ascending:1];
  v22[1] = v11;
  long long v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
  [v8 setSortDescriptors:v12];

  id v17 = 0;
  long long v13 = [v7 executeFetchRequest:v8 error:&v17];

  id v14 = v17;
  if (!v13)
  {
    long long v15 = PLBackendGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v19 = v6;
      __int16 v20 = 2112;
      id v21 = v14;
      _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_ERROR, "Error fetching assets with avalancheUUID %@: %@", buf, 0x16u);
    }
  }
  return v13;
}

@end