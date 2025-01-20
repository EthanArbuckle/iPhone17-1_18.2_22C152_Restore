@interface PXCuratedLibraryEllipsisButtonActionPerformer
- (BOOL)performerResetsAfterCompletion;
- (BOOL)presentsMenu;
- (PXCuratedLibraryActionManager)actionManager;
- (PXCuratedLibraryEllipsisButtonActionPerformer)initWithActionType:(id)a3 viewModel:(id)a4 assetCollectionReference:(id)a5;
- (PXCuratedLibraryEllipsisButtonActionPerformer)initWithViewModel:(id)a3 assetCollectionReference:(id)a4 actionManager:(id)a5;
- (PXCuratedLibraryEllipsisButtonActionPerformer)initWithViewModel:(id)a3 assetCollectionReferenceProvider:(id)a4 actionManager:(id)a5;
- (PXCuratedLibraryLayoutAssetCollectionReferenceProvider)assetCollectionReferenceProvider;
- (PXGLayout)layout;
- (id)assetCollectionReference;
- (id)buttonSpriteReference;
- (void)_presentToUserOptionsFromActionPerformers:(id)a3 forAssetCollectionReference:(id)a4;
- (void)performUserInteractionTask;
- (void)setLayout:(id)a3;
@end

@implementation PXCuratedLibraryEllipsisButtonActionPerformer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionManager, 0);
  objc_destroyWeak((id *)&self->_layout);
  objc_destroyWeak((id *)&self->_assetCollectionReferenceProvider);
}

- (PXCuratedLibraryActionManager)actionManager
{
  return self->_actionManager;
}

- (void)setLayout:(id)a3
{
}

- (PXGLayout)layout
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layout);
  return (PXGLayout *)WeakRetained;
}

- (PXCuratedLibraryLayoutAssetCollectionReferenceProvider)assetCollectionReferenceProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_assetCollectionReferenceProvider);
  return (PXCuratedLibraryLayoutAssetCollectionReferenceProvider *)WeakRetained;
}

- (void)_presentToUserOptionsFromActionPerformers:(id)a3 forAssetCollectionReference:(id)a4
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int64_t v8 = [(PXCuratedLibraryActionPerformer *)self actionZoomLevel];
  v9 = [(PXCuratedLibraryActionPerformer *)self viewModel];
  v10 = [v9 specManager];
  v11 = [v10 spec];
  int v12 = [v11 shouldExcludeNonLibraryRelatedActionsFromTopLevelEllipsisMenuForZoomLevel:v8];

  if (v7)
  {
    [v7 indexPath];
    uint64_t v13 = v53;
  }
  else
  {
    uint64_t v13 = 0;
    long long v53 = 0u;
    long long v54 = 0u;
  }
  uint64_t v14 = *(void *)off_1E5DAAED8;
  if (v13 == *(void *)off_1E5DAAED8 || v8 == 1) {
    int v16 = v12;
  }
  else {
    int v16 = 0;
  }
  if (v8 == 4) {
    int v17 = 1;
  }
  else {
    int v17 = v16;
  }
  v18 = +[PXSharingSettings sharedInstance];
  int v19 = [v18 enableNewActionContextMenu];

  if (v19)
  {
    if ((v17 & 1) == 0)
    {
      v20 = [(PXCuratedLibraryEllipsisButtonActionPerformer *)self actionManager];
      v21 = [v20 actionPerformerForActionType:@"PXCuratedLibraryActionShare" withAssetCollectionReference:v7];

      uint64_t v22 = [v6 arrayByAddingObject:v21];

      id v6 = (id)v22;
    }
    v23 = [(PXActionPerformer *)self delegate];
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      PXAssertGetLog();
    }
    [v23 curatedLibraryActionPerformer:self presentContextMenuActionsWithPerformers:v6];
    goto LABEL_49;
  }
  unsigned int v44 = v17;
  v23 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v6 = v6;
  uint64_t v24 = [v6 countByEnumeratingWithState:&v49 objects:v55 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v50 != v26) {
          objc_enumerationMutation(v6);
        }
        v28 = [*(id *)(*((void *)&v49 + 1) + 8 * i) activity];
        if (v28) {
          [v23 addObject:v28];
        }
      }
      uint64_t v25 = [v6 countByEnumeratingWithState:&v49 objects:v55 count:16];
    }
    while (v25);
  }

  v43 = [v7 keyAssetReference];
  v29 = [v43 asset];
  if (v8 == 4) {
    uint64_t v30 = 4;
  }
  else {
    uint64_t v30 = 3;
  }
  v31 = [(PXCuratedLibraryActionPerformer *)self viewModel];
  v32 = [v31 assetsDataSourceManager];
  v33 = [v32 dataSourceForZoomLevel:v30];

  if (!v29)
  {
    if (v8 == 4)
    {
      uint64_t v34 = [v33 keyAsset];
    }
    else
    {
      if (![v33 containsAnyItems]) {
        goto LABEL_42;
      }
      *(_OWORD *)buf = 0u;
      long long v48 = 0u;
      v35 = [(PXCuratedLibraryEllipsisButtonActionPerformer *)self assetCollectionReference];
      if (v33)
      {
        [v33 indexPathForAssetCollectionReference:v35];
      }
      else
      {
        *(_OWORD *)buf = 0u;
        long long v48 = 0u;
      }

      if (*(void *)buf == v14 || [v33 numberOfItemsInSection:*(void *)&buf[8]] < 1)
      {
LABEL_42:
        v29 = 0;
        goto LABEL_43;
      }
      v45[0] = [v33 identifier];
      v45[1] = *(void *)&buf[8];
      long long v46 = xmmword_1AB359AA0;
      uint64_t v34 = [v33 assetAtItemIndexPath:v45];
    }
    v29 = (void *)v34;
  }
LABEL_43:
  v36 = [PXActivitySharingContext alloc];
  v37 = [v7 assetCollection];
  v38 = [(PXActivitySharingContext *)v36 initWithAssetCollection:v37 assetsDataSource:v33];

  [(PXActivitySharingContext *)v38 setActivities:v23];
  [(PXActivitySharingContext *)v38 setWantsActionSheet:1];
  [(PXActivitySharingContext *)v38 setExcludeShareActivity:v44];
  [(PXActivitySharingContext *)v38 setKeyAsset:v29];
  v39 = [(PXCuratedLibraryActionPerformer *)self viewModel];
  uint64_t v40 = [v39 zoomLevel];
  if ((unint64_t)(v40 - 1) >= 3) {
    uint64_t v41 = 0;
  }
  else {
    uint64_t v41 = 14 - v40;
  }
  [(PXActivitySharingContext *)v38 setSourceOrigin:v41];

  v42 = [(PXActionPerformer *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    PXAssertGetLog();
  }
  [v42 curatedLibraryActionPerformer:self presentShareSheetWithSharingContext:v38];

LABEL_49:
}

- (void)performUserInteractionTask
{
  v102[2] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(PXCuratedLibraryEllipsisButtonActionPerformer *)self layout];
  v5 = (void *)v4;
  if (v4)
  {
    SEL v74 = a2;
    v80 = (void *)v4;
    v81 = [(PXCuratedLibraryActionPerformer *)self viewModel];
    v82 = [(PXCuratedLibraryEllipsisButtonActionPerformer *)self assetCollectionReference];
    int64_t v83 = [(PXCuratedLibraryActionPerformer *)self actionZoomLevel];
    BOOL v75 = v83 == 1;
    id v6 = objc_opt_new();
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __75__PXCuratedLibraryEllipsisButtonActionPerformer_performUserInteractionTask__block_invoke;
    aBlock[3] = &unk_1E5DBB0B0;
    id v78 = v6;
    id v98 = v78;
    id v7 = (void (**)(void *, void *))_Block_copy(aBlock);
    int64_t v8 = [(PXCuratedLibraryEllipsisButtonActionPerformer *)self actionManager];
    v102[0] = @"PXCuratedLibraryActionAllPhotosZoomIn";
    v102[1] = @"PXCuratedLibraryActionAllPhotosZoomOut";
    [MEMORY[0x1E4F1C978] arrayWithObjects:v102 count:2];
    long long v93 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    long long v96 = 0u;
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [v9 countByEnumeratingWithState:&v93 objects:v101 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v94;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v94 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = [v8 actionPerformerForActionType:*(void *)(*((void *)&v93 + 1) + 8 * i)];
          v7[2](v7, v14);
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v93 objects:v101 count:16];
      }
      while (v11);
    }

    v15 = [v8 actionPerformerForActionType:@"PXCuratedLibraryActionShowFiltersMenu"];
    int v16 = [(PXActionPerformer *)self sender];
    [v15 setSender:v16];

    v77 = v15;
    v7[2](v7, v15);
    int v17 = v82;
    v18 = [v82 assetCollection];
    v79 = v18;
    if (v18)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v62 = [MEMORY[0x1E4F28B00] currentHandler];
        v63 = (objc_class *)objc_opt_class();
        v64 = NSStringFromClass(v63);
        v65 = objc_msgSend(v79, "px_descriptionForAssertionMessage");
        [v62 handleFailureInMethod:v74, self, @"PXCuratedLibraryAssetCollectionActionPerformer.m", 176, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"assetCollectionReference.assetCollection", v64, v65 object file lineNumber description];

        int v17 = v82;
        v18 = v79;
      }
      int v19 = [v18 photoLibrary];
      v20 = +[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:v19];

      if ([v20 hasSharedLibraryOrPreview])
      {
        if (v17)
        {
          [v17 indexPath];
          uint64_t v21 = v91;
        }
        else
        {
          uint64_t v21 = 0;
          long long v91 = 0u;
          long long v92 = 0u;
        }
        int64_t v23 = v83;
        v72 = v20;
        if (v21 == *(void *)off_1E5DAAED8)
        {
          v100[0] = @"PXCuratedLibraryActionSetAllLibrariesFilter";
          v100[1] = @"PXCuratedLibraryActionSetPersonalLibraryFilter";
          v100[2] = @"PXCuratedLibraryActionSetSharedLibraryFilter";
          [MEMORY[0x1E4F1C978] arrayWithObjects:v100 count:3];
          long long v87 = 0u;
          long long v88 = 0u;
          long long v89 = 0u;
          long long v90 = 0u;
          id v24 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v25 = [v24 countByEnumeratingWithState:&v87 objects:v99 count:16];
          if (v25)
          {
            uint64_t v26 = v25;
            uint64_t v27 = *(void *)v88;
            do
            {
              for (uint64_t j = 0; j != v26; ++j)
              {
                if (*(void *)v88 != v27) {
                  objc_enumerationMutation(v24);
                }
                v29 = [v8 actionPerformerForActionType:*(void *)(*((void *)&v87 + 1) + 8 * j)];
                v7[2](v7, v29);
              }
              uint64_t v26 = [v24 countByEnumeratingWithState:&v87 objects:v99 count:16];
            }
            while (v26);
          }

          BOOL v75 = 1;
          int64_t v23 = v83;
        }
        uint64_t v30 = [(PXCuratedLibraryActionPerformer *)self viewModel];
        v31 = [v30 specManager];
        v32 = [v31 spec];
        char v33 = [v32 shouldExcludeNonLibraryRelatedActionsFromTopLevelEllipsisMenuForZoomLevel:v23];

        char v22 = v33 & v75;
        int v17 = v82;
        v20 = v72;
      }
      else
      {
        char v22 = 0;
        int64_t v23 = v83;
      }

      v18 = v79;
      if (!v17) {
        goto LABEL_35;
      }
    }
    else
    {
      char v22 = 0;
      int64_t v23 = v83;
      if (!v82) {
        goto LABEL_35;
      }
    }
    if ((v22 & 1) == 0)
    {
      uint64_t v34 = [v81 assetCollectionActionManager];
      v35 = (void *)[objc_alloc((Class)objc_opt_class()) initWithAssetCollectionReference:0 displayTitleInfo:0];

      v73 = +[PXCuratedLibrarySettings sharedInstance];
      v76 = v35;
      if (((v23 == 1) & ~[v73 enablePlayMovieInYears]) != 0 || v23 == 4)
      {
        if (v23 == 4)
        {
          v43 = [(PXCuratedLibraryActionPerformer *)self viewModel];
          unsigned int v44 = [v43 assetsDataSourceManager];
          uint64_t v40 = [v44 dataSourceForZoomLevel:4];

          uint64_t v84 = [v40 identifier];
          long long v85 = xmmword_1AB359AA0;
          uint64_t v86 = 0x7FFFFFFFFFFFFFFFLL;
          v42 = [v40 assetsInSectionIndexPath:&v84];
          if (!v42) {
            goto LABEL_57;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            goto LABEL_51;
          }
          v45 = [MEMORY[0x1E4F28B00] currentHandler];
          long long v46 = (objc_class *)objc_opt_class();
          v47 = NSStringFromClass(v46);
          long long v48 = objc_msgSend(v42, "px_descriptionForAssertionMessage");
          [v45 handleFailureInMethod:v74, self, @"PXCuratedLibraryAssetCollectionActionPerformer.m", 223, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"[dataSource assetsInSectionIndexPath:PXSimpleIndexPathMakeSection(dataSource.identifier, 0)]", v47, v48 object file lineNumber description];
          goto LABEL_71;
        }
      }
      else
      {
        v36 = [v35 actionPerformerForActionType:@"PXAssetCollectionActionTypePlayMovie" assetCollectionReference:v17];
        v37 = [v8 performerDelegate];
        [v36 setDelegate:v37];

        v7[2](v7, v36);
      }
      uint64_t v40 = [v17 assetCollection];
      if (v40)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
LABEL_40:
          if (objc_msgSend(v40, "px_highlightKind") == 2)
          {
            uint64_t v41 = [MEMORY[0x1E4F38EB8] fetchAllAssetsInYearRepresentedByYearHighlight:v40 options:0];
            goto LABEL_44;
          }
          if (objc_msgSend(v40, "px_highlightKind") == 3)
          {
            uint64_t v41 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:v40 options:0];
LABEL_44:
            v42 = (void *)v41;

            if (!v42)
            {
              v39 = v77;
LABEL_59:
              uint64_t v56 = [v80 superlayout];
              v57 = (void *)v56;
              if (v56) {
                v58 = (void *)v56;
              }
              else {
                v58 = v80;
              }
              id v59 = v58;

              v60 = [v8 tapToRadarPerformerAssetCollectionReference:v17 diagnosticLayout:v59];
              v7[2](v7, v60);

              v61 = [v8 curationDebugPerformerAssetCollectionReference:v17 diagnosticLayout:v59];

              v7[2](v7, v61);
              goto LABEL_63;
            }
            goto LABEL_52;
          }
          long long v49 = [v81 assetsDataSourceManager];
          v42 = [v49 assetsInAssetCollection:v40];

          if (!v42) {
            goto LABEL_57;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
LABEL_51:

LABEL_52:
            [v76 setAssetsFetchResult:v42];
            long long v50 = [(PXCuratedLibraryActionPerformer *)self viewModel];
            long long v51 = [v50 specManager];
            long long v52 = [v51 spec];
            uint64_t v53 = [v52 userInterfaceIdiom];

            int64_t v54 = v83;
            if (v53 == 4 && v83 == 4)
            {
              int v17 = v82;
              v39 = v77;
              goto LABEL_63;
            }
            int v17 = v82;
            if (![v76 canPerformActionType:@"PXAssetCollectionActionTypeShowMap" assetCollectionReference:v82])
            {
LABEL_58:
              v39 = v77;
              if (v54 != 4) {
                goto LABEL_59;
              }
LABEL_63:

              v38 = v78;
              v18 = v79;
LABEL_64:
              [(PXCuratedLibraryEllipsisButtonActionPerformer *)self _presentToUserOptionsFromActionPerformers:v38 forAssetCollectionReference:v17];
LABEL_65:
              [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:1 error:0];

              v5 = v80;
              goto LABEL_66;
            }
            uint64_t v40 = [v76 actionPerformerForActionType:@"PXAssetCollectionActionTypeShowMap" assetCollectionReference:v82];
            v55 = [v8 performerDelegate];
            [v40 setDelegate:v55];

            v7[2](v7, v40);
LABEL_57:

            int64_t v54 = v83;
            goto LABEL_58;
          }
          v45 = [MEMORY[0x1E4F28B00] currentHandler];
          v71 = (objc_class *)objc_opt_class();
          v47 = NSStringFromClass(v71);
          long long v48 = objc_msgSend(v42, "px_descriptionForAssertionMessage");
          [v45 handleFailureInMethod:v74, self, @"PXCuratedLibraryAssetCollectionActionPerformer.m", 219, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"[viewModel.assetsDataSourceManager assetsInAssetCollection:highlight]", v47, v48 object file lineNumber description];
LABEL_71:

          goto LABEL_51;
        }
        v66 = [MEMORY[0x1E4F28B00] currentHandler];
        v69 = (objc_class *)objc_opt_class();
        v68 = NSStringFromClass(v69);
        v70 = objc_msgSend(v40, "px_descriptionForAssertionMessage");
        [v66 handleFailureInMethod:v74, self, @"PXCuratedLibraryAssetCollectionActionPerformer.m", 213, @"%@ should be an instance inheriting from %@, but it is %@", @"assetCollectionReference.assetCollection", v68, v70 object file lineNumber description];
      }
      else
      {
        v66 = [MEMORY[0x1E4F28B00] currentHandler];
        v67 = (objc_class *)objc_opt_class();
        v68 = NSStringFromClass(v67);
        [v66 handleFailureInMethod:v74, self, @"PXCuratedLibraryAssetCollectionActionPerformer.m", 213, @"%@ should be an instance inheriting from %@, but it is nil", @"assetCollectionReference.assetCollection", v68 object file lineNumber description];
      }

      int v17 = v82;
      goto LABEL_40;
    }
LABEL_35:
    v39 = v77;
    v38 = v78;
    if (!v17) {
      goto LABEL_65;
    }
    goto LABEL_64;
  }
  [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:0 error:0];
LABEL_66:
}

uint64_t __75__PXCuratedLibraryEllipsisButtonActionPerformer_performUserInteractionTask__block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) addObject:a2];
  }
  return result;
}

- (id)buttonSpriteReference
{
  v3 = [(PXCuratedLibraryEllipsisButtonActionPerformer *)self layout];
  uint64_t v4 = [v3 spriteReferenceForObjectReference:self];

  return v4;
}

- (BOOL)presentsMenu
{
  v2 = +[PXSharingSettings sharedInstance];
  char v3 = [v2 enableNewActionContextMenu];

  return v3;
}

- (BOOL)performerResetsAfterCompletion
{
  return 1;
}

- (id)assetCollectionReference
{
  char v3 = [(PXCuratedLibraryEllipsisButtonActionPerformer *)self assetCollectionReferenceProvider];
  uint64_t v4 = [v3 assetCollectionReference];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)PXCuratedLibraryEllipsisButtonActionPerformer;
    id v6 = [(PXCuratedLibraryAssetCollectionActionPerformer *)&v9 assetCollectionReference];
  }
  id v7 = v6;

  return v7;
}

- (PXCuratedLibraryEllipsisButtonActionPerformer)initWithViewModel:(id)a3 assetCollectionReferenceProvider:(id)a4 actionManager:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)PXCuratedLibraryEllipsisButtonActionPerformer;
  uint64_t v10 = [(PXCuratedLibraryAssetCollectionActionPerformer *)&v13 initWithActionType:@"PXCuratedLibraryActionEllipsisButton" viewModel:a3 assetCollectionReference:0];
  uint64_t v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_actionManager, a5);
    objc_storeWeak((id *)&v11->_assetCollectionReferenceProvider, v8);
  }

  return v11;
}

- (PXCuratedLibraryEllipsisButtonActionPerformer)initWithViewModel:(id)a3 assetCollectionReference:(id)a4 actionManager:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)PXCuratedLibraryEllipsisButtonActionPerformer;
  uint64_t v10 = [(PXCuratedLibraryAssetCollectionActionPerformer *)&v13 initWithActionType:@"PXCuratedLibraryActionEllipsisButton" viewModel:a3 assetCollectionReference:a4];
  uint64_t v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_actionManager, a5);
  }

  return v11;
}

- (PXCuratedLibraryEllipsisButtonActionPerformer)initWithActionType:(id)a3 viewModel:(id)a4 assetCollectionReference:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCuratedLibraryAssetCollectionActionPerformer.m", 95, @"%s is not available as initializer", "-[PXCuratedLibraryEllipsisButtonActionPerformer initWithActionType:viewModel:assetCollectionReference:]");

  abort();
}

@end