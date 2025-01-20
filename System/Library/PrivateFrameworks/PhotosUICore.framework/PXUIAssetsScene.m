@interface PXUIAssetsScene
+ (void)preloadResources;
- (BOOL)needsUpdate;
- (CGSize)maximumImageSize;
- (PXUIAssetsScene)initWithTilingController:(id)a3 mediaProvider:(id)a4 dataSourceManager:(id)a5 selectionManager:(id)a6 delegate:(id)a7;
- (PXUIScrollViewController)scrollViewController;
- (double)contentTileCornerRadius;
- (id)_assetsBySizeWithTileIdentifiers:(const PXTileIdentifier *)a3 withGeometries:(const PXTileGeometry *)a4 count:(unint64_t)a5;
- (id)_imageRequesterForAssetReference:(id)a3;
- (id)_imageRequesterForIndexPath:(PXSimpleIndexPath *)a3 inDataSource:(id)a4;
- (void)_invalidatePreheating;
- (void)_registerDefaultTiles;
- (void)_transitionImageRequestersToDataSource:(id)a3;
- (void)_updatePreheatingIfNeeded;
- (void)checkInTile:(void *)a3 withIdentifier:(PXTileIdentifier *)a4;
- (void)checkOutTileForIdentifier:(PXTileIdentifier *)a3 layout:(id)a4;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)reusableObjectPool:(id)a3 didCreateReusableObject:(id)a4;
- (void)reusableObjectPool:(id)a3 didEvictReusableObject:(id)a4;
- (void)setContentTileCornerRadius:(double)a3;
- (void)setMaximumImageSize:(CGSize)a3;
- (void)startPreheatingTilesForIdentifiers:(const PXTileIdentifier *)a3 withGeometries:(const PXTileGeometry *)a4 count:(unint64_t)a5 context:(void *)a6;
- (void)stopPreheatingTilesForIdentifiers:(const PXTileIdentifier *)a3 withGeometries:(const PXTileGeometry *)a4 count:(unint64_t)a5 context:(void *)a6;
- (void)updateIfNeeded;
- (void)willTransitionToDataSource:(id)a3;
@end

@implementation PXUIAssetsScene

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageRequesterByAssetReference, 0);
  objc_storeStrong((id *)&self->_tilesInUse, 0);
}

- (void)setContentTileCornerRadius:(double)a3
{
  self->_contentTileCornerRadius = a3;
}

- (double)contentTileCornerRadius
{
  return self->_contentTileCornerRadius;
}

- (void)setMaximumImageSize:(CGSize)a3
{
  self->_maximumImageSize = a3;
}

- (CGSize)maximumImageSize
{
  double width = self->_maximumImageSize.width;
  double height = self->_maximumImageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (id)_assetsBySizeWithTileIdentifiers:(const PXTileIdentifier *)a3 withGeometries:(const PXTileGeometry *)a4 count:(unint64_t)a5
{
  v9 = [MEMORY[0x1E4F1CA60] dictionary];
  v10 = [(PXAssetsScene *)self dataSourceManager];
  v11 = [v10 dataSource];

  uint64_t v12 = [v11 identifier];
  double v14 = *MEMORY[0x1E4F1DB30];
  double v13 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  v15 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGSize:", *MEMORY[0x1E4F1DB30], v13);
  if (a5)
  {
    v16 = &a3->index[2];
    p_double height = &a4->contentSize.height;
    do
    {
      if (*(v16 - 3) == 5 && (*(v16 - 2) == 6432423 ? (BOOL v18 = *(v16 - 1) == v12) : (BOOL v18 = 0), v18))
      {
        long long v21 = *(_OWORD *)v16;
        unint64_t v22 = v16[2];
        uint64_t v29 = v12;
        long long v30 = v21;
        unint64_t v31 = v22;
        v23 = [v11 assetAtItemIndexPath:&v29];
        double v19 = *(p_height - 1);
        double v20 = *p_height;
        if (v19 == v14 && v20 == v13)
        {
          double v19 = v14;
          double v20 = v13;
        }
        else
        {
          uint64_t v25 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGSize:", *(p_height - 1), *p_height);

          v15 = (void *)v25;
        }
        v26 = [v9 objectForKeyedSubscript:v15];
        if (v26)
        {
          v27 = v26;
          [v26 addObject:v23];
        }
        else
        {
          v27 = [MEMORY[0x1E4F1CA48] arrayWithObject:v23];
          [v9 setObject:v27 forKeyedSubscript:v15];
        }
      }
      else
      {
        double v19 = v14;
        double v20 = v13;
      }
      v16 += 11;
      p_height += 24;
      double v13 = v20;
      double v14 = v19;
      --a5;
    }
    while (a5);
  }

  return v9;
}

- (void)stopPreheatingTilesForIdentifiers:(const PXTileIdentifier *)a3 withGeometries:(const PXTileGeometry *)a4 count:(unint64_t)a5 context:(void *)a6
{
  if ((void *)PXImagePreheatContext == a6)
  {
    v7 = [(PXUIAssetsScene *)self _assetsBySizeWithTileIdentifiers:a3 withGeometries:a4 count:a5];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __82__PXUIAssetsScene_stopPreheatingTilesForIdentifiers_withGeometries_count_context___block_invoke;
    v8[3] = &unk_1E5DB8C68;
    v8[4] = self;
    [v7 enumerateKeysAndObjectsUsingBlock:v8];
  }
}

void __82__PXUIAssetsScene_stopPreheatingTilesForIdentifiers_withGeometries_count_context___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 CGSizeValue];
  [MEMORY[0x1E4FB1BA8] mainScreen];
  [(id)objc_claimAutoreleasedReturnValue() scale];
  PXSizeScale();
}

- (void)startPreheatingTilesForIdentifiers:(const PXTileIdentifier *)a3 withGeometries:(const PXTileGeometry *)a4 count:(unint64_t)a5 context:(void *)a6
{
  if ((void *)PXImagePreheatContext == a6)
  {
    v7 = [(PXUIAssetsScene *)self _assetsBySizeWithTileIdentifiers:a3 withGeometries:a4 count:a5];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __83__PXUIAssetsScene_startPreheatingTilesForIdentifiers_withGeometries_count_context___block_invoke;
    v8[3] = &unk_1E5DB8C68;
    v8[4] = self;
    [v7 enumerateKeysAndObjectsUsingBlock:v8];
  }
}

void __83__PXUIAssetsScene_startPreheatingTilesForIdentifiers_withGeometries_count_context___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 CGSizeValue];
  [MEMORY[0x1E4FB1BA8] mainScreen];
  [(id)objc_claimAutoreleasedReturnValue() scale];
  PXSizeScale();
}

- (void)reusableObjectPool:(id)a3 didEvictReusableObject:(id)a4
{
  objc_msgSend(a4, "view", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 removeFromSuperview];
}

- (void)reusableObjectPool:(id)a3 didCreateReusableObject:(id)a4
{
  objc_msgSend(a4, "view", a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = [(PXUIAssetsScene *)self scrollViewController];
  [v5 addSubview:v6];
}

- (void)checkInTile:(void *)a3 withIdentifier:(PXTileIdentifier *)a4
{
  id v6 = [(PXAssetsScene *)self viewTileReusePool];
  [v6 checkInReusableObject:a3];

  tilesInUse = self->_tilesInUse;
  [(NSMutableSet *)tilesInUse removeObject:a3];
}

- (void)checkOutTileForIdentifier:(PXTileIdentifier *)a3 layout:(id)a4
{
  id v7 = a4;
  unint64_t v8 = a3->index[0];
  if (a3->length != 5 || v8 != 6432423)
  {
    switch(v8)
    {
      case 0x60A012uLL:
        v10 = [(PXAssetsScene *)self viewTileReusePool];
        id v11 = v10;
        uint64_t v12 = 333133;
        goto LABEL_14;
      case 0x60A013uLL:
        unint64_t v22 = [(PXAssetsScene *)self viewTileReusePool];
        id v23 = [v22 checkOutReusableObjectWithReuseIdentifier:333163];

        v24 = [(PXAssetsScene *)self badgeManager];
        [v23 setBadgeManager:v24];

        long long v47 = *(_OWORD *)&a3->index[1];
        unint64_t v25 = a3->index[3];
        unint64_t v26 = a3->index[4];
        v27 = [v7 dataSource];
        long long v50 = v47;
        *(void *)&long long v51 = v25;
        *((void *)&v51 + 1) = v26;
        v28 = [(PXUIAssetsScene *)self _imageRequesterForIndexPath:&v50 inDataSource:v27];

        [v23 setImageRequester:v28];
        goto LABEL_23;
      case 0x60A014uLL:
        v10 = [(PXAssetsScene *)self viewTileReusePool];
        id v11 = v10;
        uint64_t v12 = 333153;
LABEL_14:
        id v23 = [v10 checkOutReusableObjectWithReuseIdentifier:v12];
        break;
      case 0x60A015uLL:
        uint64_t v29 = [(PXAssetsScene *)self viewTileReusePool];
        id v23 = [v29 checkOutReusableObjectWithReuseIdentifier:333173];

        long long v48 = *(_OWORD *)&a3->index[1];
        unint64_t v30 = a3->index[3];
        unint64_t v31 = a3->index[4];
        v32 = [v7 dataSource];
        long long v50 = v48;
        *(void *)&long long v51 = v30;
        *((void *)&v51 + 1) = v31;
        v33 = [(PXUIAssetsScene *)self _imageRequesterForIndexPath:&v50 inDataSource:v32];

        v56[0] = MEMORY[0x1E4F143A8];
        v56[1] = 3221225472;
        v56[2] = __52__PXUIAssetsScene_checkOutTileForIdentifier_layout___block_invoke;
        v56[3] = &unk_1E5DB8C40;
        id v57 = v33;
        id v11 = v33;
        [v23 performChanges:v56];

        break;
      case 0x60A019uLL:
        long long v21 = [(PXAssetsScene *)self viewTileReusePool];
        double v14 = [v21 checkOutReusableObjectWithReuseIdentifier:333203];
        goto LABEL_20;
      default:
        if (v8 - 6332439 > 1)
        {
          if (v8 != 6332438)
          {
            v43 = [MEMORY[0x1E4F28B00] currentHandler];
            long long v44 = *(_OWORD *)&a3->index[5];
            long long v52 = *(_OWORD *)&a3->index[3];
            long long v53 = v44;
            long long v54 = *(_OWORD *)&a3->index[7];
            unint64_t v55 = a3->index[9];
            long long v45 = *(_OWORD *)&a3->index[1];
            long long v50 = *(_OWORD *)&a3->length;
            long long v51 = v45;
            v46 = PXTileIdentifierDescription((unint64_t *)&v50);
            [v43 handleFailureInMethod:a2, self, @"PXUIAssetsScene.m", 343, @"%@ got asked to produce a tile for an unknown identifier:%@. If you're adding custom tile kinds, those have to be returned by your own tile source and not bubble up to the assets scene.", self, v46 object file lineNumber description];

            abort();
          }
          v34 = [(PXAssetsScene *)self viewTileReusePool];
          v35 = v34;
          uint64_t v36 = 333183;
        }
        else
        {
          v34 = [(PXAssetsScene *)self viewTileReusePool];
          v35 = v34;
          uint64_t v36 = 333193;
        }
        double v14 = [v34 checkOutReusableObjectWithReuseIdentifier:v36];

        objc_msgSend(v14, "setDesiredPlayState:", -[PXAssetsScene autoplayTilesWaitForInput](self, "autoplayTilesWaitForInput") ^ 1);
        goto LABEL_21;
    }

LABEL_23:
    v41 = 0;
    goto LABEL_24;
  }
  double v13 = [(PXAssetsScene *)self viewTileReusePool];
  double v14 = [v13 checkOutReusableObjectWithReuseIdentifier:333123];

  v15 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v16 = [v15 userInterfaceIdiom];

  if (v16 == 2)
  {
    v17 = [MEMORY[0x1E4FB1BA8] mainScreen];
    BOOL v18 = [v17 traitCollection];
    uint64_t v19 = [v18 userInterfaceStyle];

    if (v19 == 1) {
      double v20 = @"PreloadAsset-iCloud";
    }
    else {
      double v20 = @"PreloadAsset-iCloud-Dark";
    }
    long long v21 = objc_msgSend(MEMORY[0x1E4FB1818], "px_imageNamed:", v20);
    [v14 setPlaceholderImage:v21];
LABEL_20:
  }
LABEL_21:
  id v23 = v14;
  if (!v23) {
    goto LABEL_23;
  }
  long long v49 = *(_OWORD *)&a3->index[1];
  unint64_t v37 = a3->index[3];
  unint64_t v38 = a3->index[4];
  v39 = [v7 dataSource];
  long long v50 = v49;
  *(void *)&long long v51 = v37;
  *((void *)&v51 + 1) = v38;
  v40 = [(PXUIAssetsScene *)self _imageRequesterForIndexPath:&v50 inDataSource:v39];

  [v23 setImageRequester:v40];
  [(PXUIAssetsScene *)self contentTileCornerRadius];
  objc_msgSend(v23, "setCornerRadius:");

  v41 = v23;
LABEL_24:
  [(NSMutableSet *)self->_tilesInUse addObject:v23];

  return v23;
}

uint64_t __52__PXUIAssetsScene_checkOutTileForIdentifier_layout___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setImageRequester:*(void *)(a1 + 32)];
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v8 = a3;
  if ((a4 & 6) != 0 && (void *)PXAssetsSceneSpeedometerObserverContext == a5)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __48__PXUIAssetsScene_observable_didChange_context___block_invoke;
    v10[3] = &unk_1E5DD36F8;
    v10[4] = self;
    [(PXAssetsScene *)self performChanges:v10];
  }
  v9.receiver = self;
  v9.super_class = (Class)PXUIAssetsScene;
  [(PXAssetsScene *)&v9 observable:v8 didChange:a4 context:a5];
}

uint64_t __48__PXUIAssetsScene_observable_didChange_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidatePreheating];
}

- (void)willTransitionToDataSource:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PXUIAssetsScene;
  id v4 = a3;
  [(PXAssetsScene *)&v5 willTransitionToDataSource:v4];
  -[PXUIAssetsScene _transitionImageRequestersToDataSource:](self, "_transitionImageRequestersToDataSource:", v4, v5.receiver, v5.super_class);
}

- (void)_updatePreheatingIfNeeded
{
  if (self->_needsUpdateFlags.preheating)
  {
    self->_needsUpdateFlags.preheating = 0;
    id v4 = [(PXAssetsScene *)self scrollSpeedometer];
    switch([v4 regime])
    {
      case -1:

        return;
      case 1:
        [v4 previousRegime];
        goto LABEL_5;
      default:
LABEL_5:
        v2 = [v4 scrollViewController];
        v3 = [v2 scrollView];

        [v3 contentSize];
        [v3 contentInset];
        sub_1AB23B20C();
    }
  }
}

- (void)_invalidatePreheating
{
  self->_needsUpdateFlags.preheating = 1;
  [(PXAssetsScene *)self setNeedsUpdate];
}

- (void)updateIfNeeded
{
  v3.receiver = self;
  v3.super_class = (Class)PXUIAssetsScene;
  [(PXAssetsScene *)&v3 updateIfNeeded];
  if ([(PXUIAssetsScene *)self needsUpdate]) {
    [(PXUIAssetsScene *)self _updatePreheatingIfNeeded];
  }
}

- (BOOL)needsUpdate
{
  v4.receiver = self;
  v4.super_class = (Class)PXUIAssetsScene;
  return [(PXAssetsScene *)&v4 needsUpdate] || self->_needsUpdateFlags.preheating;
}

- (void)_transitionImageRequestersToDataSource:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(NSMapTable *)self->_imageRequesterByAssetReference count])
  {
    double v14 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    objc_super v5 = [(NSMapTable *)self->_imageRequesterByAssetReference keyEnumerator];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          id v11 = [(NSMapTable *)self->_imageRequesterByAssetReference objectForKey:v10];
          if (v11)
          {
            uint64_t v12 = [v4 assetReferenceForAssetReference:v10];
            if (v12)
            {
              [(NSMapTable *)v14 setObject:v11 forKey:v12];
              v15[0] = MEMORY[0x1E4F143A8];
              v15[1] = 3221225472;
              v15[2] = __58__PXUIAssetsScene__transitionImageRequestersToDataSource___block_invoke;
              v15[3] = &unk_1E5DB8C18;
              id v16 = v12;
              [v11 performChanges:v15];
            }
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v7);
    }

    imageRequesterByAssetReference = self->_imageRequesterByAssetReference;
    self->_imageRequesterByAssetReference = v14;
  }
}

void __58__PXUIAssetsScene__transitionImageRequestersToDataSource___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 asset];
  [v3 setAsset:v4];
}

- (id)_imageRequesterForAssetReference:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(NSMapTable *)self->_imageRequesterByAssetReference objectForKey:v4];
  if (!v5)
  {
    uint64_t v6 = [PXImageRequester alloc];
    uint64_t v7 = [(PXAssetsScene *)self mediaProvider];
    uint64_t v8 = [v4 asset];
    objc_super v5 = [(PXImageRequester *)v6 initWithMediaProvider:v7 asset:v8];

    [(PXUIAssetsScene *)self maximumImageSize];
    if (*MEMORY[0x1E4F1DB30] != v10 || *(double *)(MEMORY[0x1E4F1DB30] + 8) != v9)
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __52__PXUIAssetsScene__imageRequesterForAssetReference___block_invoke;
      v13[3] = &unk_1E5DB8C18;
      v13[4] = self;
      [(PXImageRequester *)v5 performChanges:v13];
    }
    [(NSMapTable *)self->_imageRequesterByAssetReference setObject:v5 forKey:v4];
  }

  return v5;
}

void __52__PXUIAssetsScene__imageRequesterForAssetReference___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 maximumImageSize];
  objc_msgSend(v3, "setMaximumRequestSize:");
}

- (id)_imageRequesterForIndexPath:(PXSimpleIndexPath *)a3 inDataSource:(id)a4
{
  long long v5 = *(_OWORD *)&a3->item;
  v9[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v9[1] = v5;
  uint64_t v6 = [a4 assetReferenceAtItemIndexPath:v9];
  uint64_t v7 = [(PXUIAssetsScene *)self _imageRequesterForAssetReference:v6];

  return v7;
}

- (void)_registerDefaultTiles
{
  id v2 = [(PXAssetsScene *)self viewTileReusePool];
  [v2 registerReusableObjectForReuseIdentifier:333123 creationHandler:&__block_literal_global_93122];
  [v2 registerReusableObjectForReuseIdentifier:333183 creationHandler:&__block_literal_global_7_93123];
  [v2 registerReusableObjectForReuseIdentifier:333193 creationHandler:&__block_literal_global_10_93124];
  [v2 registerReusableObjectForReuseIdentifier:333203 creationHandler:&__block_literal_global_13_93125];
  [v2 registerReusableObjectForReuseIdentifier:333133 creationHandler:&__block_literal_global_16];
  [v2 registerReusableObjectForReuseIdentifier:333153 creationHandler:&__block_literal_global_19_93126];
  [v2 registerReusableObjectForReuseIdentifier:333163 creationHandler:&__block_literal_global_22];
  [v2 registerReusableObjectForReuseIdentifier:333173 creationHandler:&__block_literal_global_24_93127];
}

PXUIPlayButtonTile *__40__PXUIAssetsScene__registerDefaultTiles__block_invoke_8()
{
  v0 = objc_alloc_init(PXUIPlayButtonTile);
  [(PXUIPlayButtonTile *)v0 performChanges:&__block_literal_global_28];
  return v0;
}

uint64_t __40__PXUIAssetsScene__registerDefaultTiles__block_invoke_9(uint64_t a1, void *a2)
{
  return [a2 setPlayButtonStyle:0];
}

PXOverlayBadgeUIViewTile *__40__PXUIAssetsScene__registerDefaultTiles__block_invoke_7()
{
  v0 = objc_alloc_init(PXOverlayBadgeUIViewTile);
  return v0;
}

PXDimmingUIViewTile *__40__PXUIAssetsScene__registerDefaultTiles__block_invoke_6()
{
  v0 = objc_alloc_init(PXDimmingUIViewTile);
  v1 = [MEMORY[0x1E4FB1618] whiteColor];
  [(PXDimmingUIViewTile *)v0 setBackgroundColor:v1];

  [(PXDimmingUIViewTile *)v0 setUserInteractionEnabled:0];
  return v0;
}

PXSelectionBadgeUIViewTile *__40__PXUIAssetsScene__registerDefaultTiles__block_invoke_5()
{
  v0 = objc_alloc_init(PXSelectionBadgeUIViewTile);
  return v0;
}

PXAssetLivePhotoUIViewTile *__40__PXUIAssetsScene__registerDefaultTiles__block_invoke_4()
{
  v0 = objc_alloc_init(PXAssetLivePhotoUIViewTile);
  return v0;
}

PXAssetLoopUIViewTile *__40__PXUIAssetsScene__registerDefaultTiles__block_invoke_3()
{
  v0 = objc_alloc_init(PXAssetLoopUIViewTile);
  return v0;
}

PXAssetAnimatedImageUIViewTile *__40__PXUIAssetsScene__registerDefaultTiles__block_invoke_2()
{
  v0 = objc_alloc_init(PXAssetAnimatedImageUIViewTile);
  return v0;
}

PXAssetUIImageViewTile *__40__PXUIAssetsScene__registerDefaultTiles__block_invoke()
{
  v0 = objc_alloc_init(PXAssetUIImageViewTile);
  v1 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v2 = [v1 userInterfaceIdiom];

  if (v2 == 2)
  {
    [(PXAssetUIImageViewTile *)v0 setShouldAllowFocus:1];
    id v3 = [MEMORY[0x1E4FB1618] clearColor];
    [(PXAssetUIImageViewTile *)v0 setPlaceholderColor:v3];
  }
  else
  {
    [(PXAssetUIImageViewTile *)v0 setShouldAllowFocus:0];
  }
  return v0;
}

- (PXUIScrollViewController)scrollViewController
{
  uint64_t v2 = [(PXAssetsScene *)self tilingController];
  id v3 = [v2 scrollController];

  return (PXUIScrollViewController *)v3;
}

- (PXUIAssetsScene)initWithTilingController:(id)a3 mediaProvider:(id)a4 dataSourceManager:(id)a5 selectionManager:(id)a6 delegate:(id)a7
{
  id v12 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PXUIAssetsScene;
  double v13 = [(PXAssetsScene *)&v21 initWithTilingController:v12 mediaProvider:a4 dataSourceManager:a5 selectionManager:a6 delegate:a7];
  if (v13)
  {
    double v14 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    tilesInUse = v13->_tilesInUse;
    v13->_tilesInUse = v14;

    uint64_t v16 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    imageRequesterByAssetReference = v13->_imageRequesterByAssetReference;
    v13->_imageRequesterByAssetReference = (NSMapTable *)v16;

    long long v18 = [v12 scrollController];
    long long v19 = [v18 scrollView];
    [v19 _setAutomaticContentOffsetAdjustmentEnabled:0];

    [(PXUIAssetsScene *)v13 _registerDefaultTiles];
    [(PXUIAssetsScene *)v13 _invalidatePreheating];
    [(PXUIAssetsScene *)v13 _updatePreheatingIfNeeded];
  }

  return v13;
}

+ (void)preloadResources
{
}

@end