@interface PXPhotoKitAssetCollectionPlayMovieActionPerformer
+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4;
+ (BOOL)shouldDisplayTitleOfAssetCollection:(id)a3;
+ (id)_systemImageName;
+ (id)createActivityWithTitle:(id)a3 actionType:(id)a4 actionSystemImageName:(id)a5;
+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5;
+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4;
- (BOOL)canPerformWithActivityItems:(id)a3 forActivity:(id)a4;
- (id)activitySystemImageName;
- (id)activityType;
- (id)localizedTitleForUseCase:(unint64_t)a3;
- (void)performUserInteractionTask;
@end

@implementation PXPhotoKitAssetCollectionPlayMovieActionPerformer

- (void)performUserInteractionTask
{
  v4 = [(PXActionPerformer *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    PXAssertGetLog();
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __79__PXPhotoKitAssetCollectionPlayMovieActionPerformer_performUserInteractionTask__block_invoke;
  aBlock[3] = &unk_1E5DAE178;
  id v43 = v4;
  v44 = self;
  v5 = (void (**)(void *, void *))_Block_copy(aBlock);
  v6 = [(PXAssetCollectionActionPerformer *)self assetCollection];
  unint64_t v7 = 0x1E4F38000uLL;
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_4;
    }
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    v28 = (objc_class *)objc_opt_class();
    v27 = NSStringFromClass(v28);
    v29 = objc_msgSend(v6, "px_descriptionForAssertionMessage");
    [v25 handleFailureInMethod:a2, self, @"PXPhotoKitAssetCollectionPlayMovieActionPerformer.m", 130, @"%@ should be an instance inheriting from %@, but it is %@", @"self.assetCollection", v27, v29 object file lineNumber description];
  }
  else
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    v26 = (objc_class *)objc_opt_class();
    v27 = NSStringFromClass(v26);
    [v25 handleFailureInMethod:a2, self, @"PXPhotoKitAssetCollectionPlayMovieActionPerformer.m", 130, @"%@ should be an instance inheriting from %@, but it is nil", @"self.assetCollection", v27 object file lineNumber description];
  }

LABEL_4:
  if (objc_msgSend(v6, "px_highlightKind") == 2)
  {
    id v8 = v6;
    if (v6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
LABEL_7:
        v9 = [MEMORY[0x1E4F38EB8] fetchAllAssetsInYearRepresentedByYearHighlight:v8 options:0];
        v10 = [*(id *)(v7 + 3816) transientAssetCollectionWithAssetFetchResult:v9 title:0];
        v11 = [MEMORY[0x1E4F38EB8] fetchCuratedAssetsInAssetCollection:v10];
        v12 = *(void **)(v7 + 3816);
        v13 = [v8 localizedTitle];
        v14 = [v12 transientAssetCollectionWithAssetFetchResult:v11 title:v13];

        v5[2](v5, v14);
        goto LABEL_18;
      }
      v30 = [MEMORY[0x1E4F28B00] currentHandler];
      v33 = (objc_class *)objc_opt_class();
      v32 = NSStringFromClass(v33);
      v34 = objc_msgSend(v8, "px_descriptionForAssertionMessage");
      [v30 handleFailureInMethod:a2, self, @"PXPhotoKitAssetCollectionPlayMovieActionPerformer.m", 132, @"%@ should be an instance inheriting from %@, but it is %@", @"assetCollection", v32, v34 object file lineNumber description];

      unint64_t v7 = 0x1E4F38000;
    }
    else
    {
      v30 = [MEMORY[0x1E4F28B00] currentHandler];
      v31 = (objc_class *)objc_opt_class();
      v32 = NSStringFromClass(v31);
      [v30 handleFailureInMethod:a2, self, @"PXPhotoKitAssetCollectionPlayMovieActionPerformer.m", 132, @"%@ should be an instance inheriting from %@, but it is nil", @"assetCollection", v32 object file lineNumber description];
    }

    goto LABEL_7;
  }
  if ([v6 assetCollectionType] == 1 && objc_msgSend(v6, "assetCollectionSubtype") == 2)
  {
    v15 = [(PXAssetCollectionActionPerformer *)self assetCollection];
    uint64_t v16 = [v15 titleCategory];

    if (v16) {
      uint64_t v17 = v16;
    }
    else {
      uint64_t v17 = 6;
    }
    v18 = [off_1E5DA7230 defaultHelper];
    v19 = [v6 localizedTitle];
    v20 = [v18 titleForDisplayableText:v19 titleCategory:v17 options:1];

    v21 = [v6 localizedSubtitle];
    if (performUserInteractionTask_onceToken != -1) {
      dispatch_once(&performUserInteractionTask_onceToken, &__block_literal_global_1248);
    }
    v22 = performUserInteractionTask_preferredTitlesQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __79__PXPhotoKitAssetCollectionPlayMovieActionPerformer_performUserInteractionTask__block_invoke_4;
    block[3] = &unk_1E5DC89D0;
    uint64_t v41 = v17;
    id v36 = v20;
    id v37 = v21;
    id v38 = v6;
    v39 = self;
    v40 = v5;
    id v23 = v21;
    id v24 = v20;
    dispatch_async(v22, block);
  }
  else
  {
    v5[2](v5, v6);
  }
LABEL_18:
}

void __79__PXPhotoKitAssetCollectionPlayMovieActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(id *)(a1 + 32);
  id v4 = v3;
  px_dispatch_on_main_queue();
}

void __79__PXPhotoKitAssetCollectionPlayMovieActionPerformer_performUserInteractionTask__block_invoke_4(uint64_t a1)
{
  id v18 = (id)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
  uint64_t v2 = *MEMORY[0x1E4F39778];
  [v18 setObject:*(void *)(a1 + 32) forKeyedSubscript:*MEMORY[0x1E4F39778]];
  id v3 = [NSNumber numberWithInteger:*(void *)(a1 + 72)];
  uint64_t v4 = *MEMORY[0x1E4F39770];
  [v18 setObject:v3 forKeyedSubscript:*MEMORY[0x1E4F39770]];

  uint64_t v5 = *MEMORY[0x1E4F39768];
  [v18 setObject:*(void *)(a1 + 40) forKeyedSubscript:*MEMORY[0x1E4F39768]];
  v6 = [MEMORY[0x1E4F39170] preferredAttributesForMemoryCreationFromAssetCollection:*(void *)(a1 + 48) proposedAttributes:v18];
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 72);
  id v9 = *(id *)(a1 + 40);
  if (v6)
  {
    uint64_t v10 = [v6 objectForKeyedSubscript:v2];

    v11 = [v6 objectForKeyedSubscript:v4];
    uint64_t v8 = [v11 integerValue];

    uint64_t v12 = [v6 objectForKeyedSubscript:v5];

    id v9 = (id)v12;
    id v7 = (id)v10;
  }
  v13 = [MEMORY[0x1E4F38EE8] titleFontNameForTitleCategory:v8];
  v14 = (void *)MEMORY[0x1E4F38EB8];
  v15 = [*(id *)(a1 + 56) assetCollection];
  uint64_t v16 = [v14 fetchAssetsInAssetCollection:v15 options:0];

  uint64_t v17 = objc_msgSend(MEMORY[0x1E4F38EE8], "transientAssetCollectionWithAssetFetchResult:type:subtype:title:subtitle:titleFontName:", v16, objc_msgSend(*(id *)(a1 + 48), "assetCollectionType"), objc_msgSend(*(id *)(a1 + 48), "assetCollectionSubtype"), v7, v9, v13);
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

void __79__PXPhotoKitAssetCollectionPlayMovieActionPerformer_performUserInteractionTask__block_invoke_3()
{
  id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.photos.PXPhotoKitAssetCollectionPlayMovieActionPerformer.preferredTitlesQueue", v0);
  uint64_t v2 = (void *)performUserInteractionTask_preferredTitlesQueue;
  performUserInteractionTask_preferredTitlesQueue = (uint64_t)v1;
}

uint64_t __79__PXPhotoKitAssetCollectionPlayMovieActionPerformer_performUserInteractionTask__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) assetCollectionActionPerformer:*(void *)(a1 + 40) playMovieForAssetCollection:*(void *)(a1 + 48)];
  uint64_t v2 = *(void **)(a1 + 40);
  return [v2 completeUserInteractionTaskWithSuccess:1 error:0];
}

- (id)localizedTitleForUseCase:(unint64_t)a3
{
  uint64_t v5 = objc_opt_class();
  v6 = [(PXAssetCollectionActionPerformer *)self assetCollectionReference];
  id v7 = [v5 localizedTitleForUseCase:a3 assetCollectionReference:v6 withInputs:0];

  return v7;
}

- (BOOL)canPerformWithActivityItems:(id)a3 forActivity:(id)a4
{
  v6 = objc_msgSend(a4, "activityType", a3);
  id v7 = [(PXPhotoKitAssetCollectionPlayMovieActionPerformer *)self activityType];

  if (v6 != v7)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PXPhotoKitAssetCollectionPlayMovieActionPerformer.m", 110, @"Invalid parameter not satisfying: %@", @"activity.activityType == self.activityType" object file lineNumber description];
  }
  return 1;
}

- (id)activityType
{
  uint64_t v2 = @"PXActivityTypePlayMemoryMovie";
  return @"PXActivityTypePlayMemoryMovie";
}

- (id)activitySystemImageName
{
  return +[PXPhotoKitAssetCollectionPlayMovieActionPerformer _systemImageName];
}

+ (BOOL)shouldDisplayTitleOfAssetCollection:(id)a3
{
  id v3 = a3;
  if ((unint64_t)([v3 assetCollectionType] - 1) > 1
    || (objc_msgSend(v3, "px_isAllPhotosSmartAlbum") & 1) != 0)
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    int v4 = objc_msgSend(v3, "px_isRecentsSmartAlbum") ^ 1;
  }

  return v4;
}

+ (id)createActivityWithTitle:(id)a3 actionType:(id)a4 actionSystemImageName:(id)a5
{
  return +[PXActivity activityWithActionTitle:a3 actionType:a4 activityType:@"PXActivityTypePlayMemoryMovie" systemImageName:a5];
}

+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  return +[PXPhotoKitAssetCollectionPlayMovieActionPerformer _systemImageName];
}

+ (id)_systemImageName
{
  return @"memories";
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5
{
  id v7 = objc_msgSend(a4, "assetCollection", a3);
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    v14 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v14);
    v15 = objc_msgSend(v7, "px_descriptionForAssertionMessage");
    [v11 handleFailureInMethod:a2, a1, @"PXPhotoKitAssetCollectionPlayMovieActionPerformer.m", 80, @"%@ should be an instance inheriting from %@, but it is %@", @"assetCollectionReference.assetCollection", v13, v15 object file lineNumber description];
  }
  else
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    [v11 handleFailureInMethod:a2, a1, @"PXPhotoKitAssetCollectionPlayMovieActionPerformer.m", 80, @"%@ should be an instance inheriting from %@, but it is nil", @"assetCollectionReference.assetCollection", v13 object file lineNumber description];
  }

LABEL_3:
  if ([v7 assetCollectionType] == 4) {
    uint64_t v8 = @"PXPhotosDetailsActionMenuPlayMovieTitle";
  }
  else {
    uint64_t v8 = @"PXPhotosDetailsActionMenuPlayMemoryMovieTitle";
  }
  id v9 = PXLocalizedStringFromTable(v8, @"PhotosUICore");

  return v9;
}

+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  id v7 = a4;
  uint64_t v8 = [a3 assetCollection];
  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    id v24 = (objc_class *)objc_opt_class();
    id v23 = NSStringFromClass(v24);
    v25 = objc_msgSend(v8, "px_descriptionForAssertionMessage");
    [v21 handleFailureInMethod:a2, a1, @"PXPhotoKitAssetCollectionPlayMovieActionPerformer.m", 25, @"%@ should be an instance inheriting from %@, but it is %@", @"assetCollectionReference.assetCollection", v23, v25 object file lineNumber description];
  }
  else
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    v22 = (objc_class *)objc_opt_class();
    id v23 = NSStringFromClass(v22);
    [v21 handleFailureInMethod:a2, a1, @"PXPhotoKitAssetCollectionPlayMovieActionPerformer.m", 25, @"%@ should be an instance inheriting from %@, but it is nil", @"assetCollectionReference.assetCollection", v23 object file lineNumber description];
  }

LABEL_3:
  if (objc_opt_respondsToSelector())
  {
    id v9 = [v7 performerDelegate];
  }
  else
  {
    id v9 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (unint64_t)[v9 abilityToPlayMovieForAssetCollection:v8] < 2
    || [v8 assetCollectionType] == 7
    || [v8 assetCollectionType] == 9
    || [v8 assetCollectionType] == 2
    || (objc_msgSend(v8, "px_isSharedLibrarySharingSuggestion") & 1) != 0
    || (objc_msgSend(v8, "px_isSharedLibrarySharingSuggestionsSmartAlbum") & 1) != 0
    || [v8 assetCollectionSubtype] == 101)
  {
    BOOL v10 = 0;
    goto LABEL_15;
  }
  uint64_t v12 = +[PXMemoriesRelatedSettings sharedInstance];
  uint64_t v13 = [v12 minimumNumberOfCuratedAssetsForMovieHeader];

  uint64_t v14 = [v8 estimatedAssetCount];
  if ([v8 assetCollectionType] == 6)
  {
    id v15 = v8;
    if (v8)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
LABEL_19:
        uint64_t v14 = [v15 summaryCount];
        if ([v15 kind] == 2)
        {
          uint64_t v16 = [MEMORY[0x1E4F390A0] fetchOptionsWithPhotoLibrary:0 orObject:v15];
          uint64_t v17 = (void *)MEMORY[0x1E4F28F60];
          id v18 = [v15 objectID];
          v19 = [v17 predicateWithFormat:@"highlightBeingSummaryAssets.parentPhotosHighlight.parentPhotosHighlight = %@", v18];
          [v16 setInternalPredicate:v19];

          [v16 setShouldPrefetchCount:1];
          [v16 setFetchLimit:v13];
          v20 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v16];
          uint64_t v14 = [v20 count];
        }
        goto LABEL_22;
      }
      v31 = [MEMORY[0x1E4F28B00] currentHandler];
      v29 = (objc_class *)objc_opt_class();
      v28 = NSStringFromClass(v29);
      v30 = objc_msgSend(v15, "px_descriptionForAssertionMessage");
      [v31 handleFailureInMethod:a2, a1, @"PXPhotoKitAssetCollectionPlayMovieActionPerformer.m", 54, @"%@ should be an instance inheriting from %@, but it is %@", @"assetCollection", v28, v30 object file lineNumber description];
    }
    else
    {
      v26 = [MEMORY[0x1E4F28B00] currentHandler];
      v27 = (objc_class *)objc_opt_class();
      v28 = NSStringFromClass(v27);
      v31 = v26;
      [v26 handleFailureInMethod:a2, a1, @"PXPhotoKitAssetCollectionPlayMovieActionPerformer.m", 54, @"%@ should be an instance inheriting from %@, but it is nil", @"assetCollection", v28 object file lineNumber description];
    }

    goto LABEL_19;
  }
LABEL_22:
  BOOL v10 = [v8 assetCollectionType] == 4
     || +[PXMemoriesRelatedSettings isAssetCountAcceptableForMemoryPlayback:v14];
LABEL_15:

  return v10;
}

@end