@interface PXCuratedLibraryStatisticsController
+ (PXCuratedLibraryStatisticsController)defaultController;
- (_PXLayoutGeometry)_layoutGeometryBufferWithCount:(int64_t)a3;
- (void)_enumerateDaysSectionsForViewModel:(id)a3 extendedTraitCollection:(id)a4 usingBlock:(id)a5;
- (void)collectStatisticsForViewModel:(id)a3 extendedTraitCollection:(id)a4 resultHandler:(id)a5;
- (void)dealloc;
@end

@implementation PXCuratedLibraryStatisticsController

- (_PXLayoutGeometry)_layoutGeometryBufferWithCount:(int64_t)a3
{
  int64_t reusableLayoutGeometriesCapacity = self->_reusableLayoutGeometriesCapacity;
  if (reusableLayoutGeometriesCapacity < a3)
  {
    if (reusableLayoutGeometriesCapacity)
    {
      do
        reusableLayoutGeometriesCapacity *= 2;
      while (reusableLayoutGeometriesCapacity < a3);
    }
    else
    {
      int64_t reusableLayoutGeometriesCapacity = a3;
    }
    self->_int64_t reusableLayoutGeometriesCapacity = reusableLayoutGeometriesCapacity;
    _PXGArrayResize();
  }
  return self->_resuableLayoutGeometries;
}

- (void)_enumerateDaysSectionsForViewModel:(id)a3 extendedTraitCollection:(id)a4 usingBlock:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = (void (**)(id, void *, void *, uint64_t, unsigned __int8 *))a5;
  v10 = [v7 assetsDataSourceManager];
  [v10 performChanges:&__block_literal_global_20];
  v33 = v10;
  v11 = [v10 dataSourceForZoomLevel:3];
  uint64_t v12 = [v11 numberOfSections];
  unsigned __int8 v35 = 0;
  v34 = v7;
  v13 = [[PXCuratedLibraryActionManager alloc] initWithViewModel:v7];
  v14 = [PXAssetsSectionLayout alloc];
  v15 = [(PXFeatureSpec *)[PXAssetsSectionLayoutSpec alloc] initWithExtendedTraitCollection:v8];
  v32 = v13;
  v16 = [(PXAssetsSectionLayout *)v14 initWithSection:0 dataSource:v11 actionManager:v13 loadingStatusManager:0 assetImportStatusManager:0 inlinePlaybackController:0 zoomLevel:3 spec:v15];

  [v8 layoutReferenceSize];
  uint64_t v17 = -[PXGLayout setReferenceSize:](v16, "setReferenceSize:");
  uint64_t v18 = v12 - 1;
  if (v12 >= 1)
  {
    uint64_t v19 = 0;
    while (1)
    {
      v20 = (void *)MEMORY[0x1AD10CB00](v17);
      [(PXAssetsSectionLayout *)v16 setDataSource:v11 section:v19];
      [(PXGLayout *)v16 updateAsRootIfNeeded];
      v21 = [(PXAssetsSectionLayout *)v16 bodyContentLayout];
      if (v21)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          goto LABEL_5;
        }
        v25 = [MEMORY[0x1E4F28B00] currentHandler];
        v28 = (objc_class *)objc_opt_class();
        v27 = NSStringFromClass(v28);
        v29 = objc_msgSend(v21, "px_descriptionForAssertionMessage");
        [v25 handleFailureInMethod:a2, self, @"PXCuratedLibraryStatisticsController.m", 81, @"%@ should be an instance inheriting from %@, but it is %@", @"sectionLayout.bodyContentLayout", v27, v29 object file lineNumber description];
      }
      else
      {
        v25 = [MEMORY[0x1E4F28B00] currentHandler];
        v26 = (objc_class *)objc_opt_class();
        v27 = NSStringFromClass(v26);
        [v25 handleFailureInMethod:a2, self, @"PXCuratedLibraryStatisticsController.m", 81, @"%@ should be an instance inheriting from %@, but it is nil", @"sectionLayout.bodyContentLayout", v27 object file lineNumber description];
      }

LABEL_5:
      v22 = (void *)[v21 newGenerator];
      v9[2](v9, v22, v11, v19, &v35);
      int v23 = v35;

      if (!v23 && v18 != v19++) {
        continue;
      }
      break;
    }
  }
}

uint64_t __110__PXCuratedLibraryStatisticsController__enumerateDaysSectionsForViewModel_extendedTraitCollection_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  return [a2 forceAccurateAllSectionsIfNeeded];
}

- (void)collectStatisticsForViewModel:(id)a3 extendedTraitCollection:(id)a4 resultHandler:(id)a5
{
  v9 = (void (**)(id, id, void))a5;
  id v10 = a4;
  id v11 = a3;
  uint64_t v12 = objc_alloc_init(PXMutableCuratedLibraryStatistics);
  id v13 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  id v14 = [[PXCuratedLibraryVideoPlaybackController alloc] initViewViewModel:v11];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __108__PXCuratedLibraryStatisticsController_collectStatisticsForViewModel_extendedTraitCollection_resultHandler___block_invoke;
  v18[3] = &unk_1E5DB4130;
  id v21 = v14;
  SEL v22 = a2;
  v18[4] = self;
  id v19 = v13;
  v20 = v12;
  id v15 = v14;
  v16 = v12;
  id v17 = v13;
  [(PXCuratedLibraryStatisticsController *)self _enumerateDaysSectionsForViewModel:v11 extendedTraitCollection:v10 usingBlock:v18];

  v9[2](v9, v16, 0);
}

void __108__PXCuratedLibraryStatisticsController_collectStatisticsForViewModel_extendedTraitCollection_resultHandler___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = [v7 itemCount];
  objc_msgSend(v7, "getGeometries:inRange:withKind:", objc_msgSend(*(id *)(a1 + 32), "_layoutGeometryBufferWithCount:", v9), 0, v9, 0);
  id v20 = v7;
  if (v20)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v16 = *(void *)(a1 + 64);
    uint64_t v17 = *(void *)(a1 + 32);
    uint64_t v18 = (objc_class *)objc_opt_class();
    id v15 = NSStringFromClass(v18);
    id v19 = objc_msgSend(v20, "px_descriptionForAssertionMessage");
    [v11 handleFailureInMethod:v16, v17, @"PXCuratedLibraryStatisticsController.m", 51, @"%@ should be an instance inheriting from %@, but it is %@", @"layoutGenerator", v15, v19 object file lineNumber description];
  }
  else
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v12 = *(void *)(a1 + 64);
    uint64_t v13 = *(void *)(a1 + 32);
    id v14 = (objc_class *)objc_opt_class();
    id v15 = NSStringFromClass(v14);
    [v11 handleFailureInMethod:v12, v13, @"PXCuratedLibraryStatisticsController.m", 51, @"%@ should be an instance inheriting from %@, but it is nil", @"layoutGenerator", v15 object file lineNumber description];
  }

LABEL_3:
  [v20 minHeroItemsSize];

  id v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28D60]), "initWithIndexesInRange:", 0, v9);
  [*(id *)(a1 + 40) removeAllIndexes];
  if (v9 >= 1) {
    PXSizeApproximatelyEqualOrBiggerThanSize();
  }
  objc_msgSend(*(id *)(a1 + 48), "appendStatisticsForSection:assetsDataSource:playbackController:visibleItems:heroItems:keyItem:", a4, v8, *(void *)(a1 + 56), v10, *(void *)(a1 + 40), objc_msgSend(v20, "keyItemIndex"));
}

- (void)dealloc
{
  free(self->_resuableLayoutGeometries);
  v3.receiver = self;
  v3.super_class = (Class)PXCuratedLibraryStatisticsController;
  [(PXCuratedLibraryStatisticsController *)&v3 dealloc];
}

+ (PXCuratedLibraryStatisticsController)defaultController
{
  if (defaultController_onceToken != -1) {
    dispatch_once(&defaultController_onceToken, &__block_literal_global_51673);
  }
  v2 = (void *)defaultController_defaultController;
  return (PXCuratedLibraryStatisticsController *)v2;
}

void __57__PXCuratedLibraryStatisticsController_defaultController__block_invoke()
{
  v0 = objc_alloc_init(PXCuratedLibraryStatisticsController);
  v1 = (void *)defaultController_defaultController;
  defaultController_defaultController = (uint64_t)v0;
}

@end