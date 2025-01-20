@interface PXAssetsTileTransitionCoordinator
+ (id)transitionCoordinatorForChange:(id)a3 changeHistory:(id)a4;
- (BOOL)_shouldCrossfade;
- (BOOL)delayInsertions;
- (BOOL)getFinalGeometry:(PXTileGeometry *)a3 finalUserData:(id *)a4 forDisappearingTileWithIdentifier:(PXTileIdentifier *)a5 fromGeometry:(PXTileGeometry *)a6 fromUserData:(id)a7;
- (BOOL)getInitialGeometry:(PXTileGeometry *)a3 initialUserData:(id *)a4 forAppearingTileWithIdentifier:(PXTileIdentifier *)a5 toGeometry:(PXTileGeometry *)a6 toUserData:(id)a7;
- (BOOL)treatRemovalsAsDeletes;
- (NSArray)_changeDetails;
- (NSIndexSet)_kindsCenteredOnContentTiles;
- (NSIndexSet)_kindsCoveringContentTiles;
- (NSIndexSet)_kindsWithDisabledAnimation;
- (PXAssetsTileTransitionCoordinator)initWithTilingChange:(id)a3 changeHistory:(id)a4;
- (PXAssetsTilingLayout)_fromLayout;
- (PXAssetsTilingLayout)_toLayout;
- (PXBasicTileAnimationOptions)_basicAnimationOptions;
- (PXSectionedChangeDetailsRepository)_changeHistory;
- (PXTilingChange)_tilingChange;
- (id)optionsForAnimatingTileWithIdentifier:(PXTileIdentifier *)a3 animationType:(int64_t)a4 fromGeometry:(PXTileGeometry *)a5 fromUserData:(id)a6 toGeometry:(PXTileGeometry *)a7 toUserData:(id)a8;
- (void)disableAnimationsForTileKind:(unint64_t)a3;
- (void)enableAnimationsForTileKind:(unint64_t)a3;
- (void)setDelayInsertions:(BOOL)a3;
- (void)setTreatRemovalsAsDeletes:(BOOL)a3;
@end

@implementation PXAssetsTileTransitionCoordinator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__toLayout, 0);
  objc_storeStrong((id *)&self->__fromLayout, 0);
  objc_storeStrong((id *)&self->__kindsCenteredOnContentTiles, 0);
  objc_storeStrong((id *)&self->__kindsCoveringContentTiles, 0);
  objc_storeStrong((id *)&self->__kindsWithDisabledAnimation, 0);
  objc_storeStrong((id *)&self->__changeDetails, 0);
  objc_storeStrong((id *)&self->__changeHistory, 0);
  objc_storeStrong((id *)&self->__basicAnimationOptions, 0);
  objc_storeStrong((id *)&self->__tilingChange, 0);
}

- (PXAssetsTilingLayout)_toLayout
{
  return self->__toLayout;
}

- (PXAssetsTilingLayout)_fromLayout
{
  return self->__fromLayout;
}

- (NSIndexSet)_kindsCenteredOnContentTiles
{
  return self->__kindsCenteredOnContentTiles;
}

- (NSIndexSet)_kindsCoveringContentTiles
{
  return self->__kindsCoveringContentTiles;
}

- (NSIndexSet)_kindsWithDisabledAnimation
{
  return self->__kindsWithDisabledAnimation;
}

- (NSArray)_changeDetails
{
  return self->__changeDetails;
}

- (PXSectionedChangeDetailsRepository)_changeHistory
{
  return self->__changeHistory;
}

- (BOOL)_shouldCrossfade
{
  return self->__shouldCrossfade;
}

- (PXBasicTileAnimationOptions)_basicAnimationOptions
{
  return self->__basicAnimationOptions;
}

- (PXTilingChange)_tilingChange
{
  return self->__tilingChange;
}

- (void)setDelayInsertions:(BOOL)a3
{
  self->_delayInsertions = a3;
}

- (BOOL)delayInsertions
{
  return self->_delayInsertions;
}

- (void)setTreatRemovalsAsDeletes:(BOOL)a3
{
  self->_treatRemovalsAsDeletes = a3;
}

- (BOOL)treatRemovalsAsDeletes
{
  return self->_treatRemovalsAsDeletes;
}

- (void)enableAnimationsForTileKind:(unint64_t)a3
{
  v5 = [(PXAssetsTileTransitionCoordinator *)self _kindsWithDisabledAnimation];
  v6 = (NSIndexSet *)[v5 mutableCopy];

  [(NSIndexSet *)v6 removeIndex:a3];
  kindsWithDisabledAnimation = self->__kindsWithDisabledAnimation;
  self->__kindsWithDisabledAnimation = v6;
}

- (void)disableAnimationsForTileKind:(unint64_t)a3
{
  v5 = [(PXAssetsTileTransitionCoordinator *)self _kindsWithDisabledAnimation];
  v6 = (NSIndexSet *)[v5 mutableCopy];

  [(NSIndexSet *)v6 addIndex:a3];
  kindsWithDisabledAnimation = self->__kindsWithDisabledAnimation;
  self->__kindsWithDisabledAnimation = v6;
}

- (BOOL)getFinalGeometry:(PXTileGeometry *)a3 finalUserData:(id *)a4 forDisappearingTileWithIdentifier:(PXTileIdentifier *)a5 fromGeometry:(PXTileGeometry *)a6 fromUserData:(id)a7
{
  a6->alpha = 0.0;
  CGPoint origin = a6->frame.origin;
  CGSize size = a6->frame.size;
  CGSize v9 = a6->size;
  a3->center = a6->center;
  a3->CGSize size = v9;
  a3->frame.CGPoint origin = origin;
  a3->frame.CGSize size = size;
  long long v10 = *(_OWORD *)&a6->hidden;
  long long v11 = *(_OWORD *)&a6->contentSize.height;
  long long v12 = *(_OWORD *)&a6->contentsRect.size.height;
  *(_OWORD *)&a3->contentsRect.origin.y = *(_OWORD *)&a6->contentsRect.origin.y;
  *(_OWORD *)&a3->contentsRect.size.height = v12;
  *(_OWORD *)&a3->hidden = v10;
  *(_OWORD *)&a3->contentSize.height = v11;
  long long v13 = *(_OWORD *)&a6->transform.a;
  long long v14 = *(_OWORD *)&a6->transform.c;
  long long v15 = *(_OWORD *)&a6->alpha;
  *(_OWORD *)&a3->transform.tx = *(_OWORD *)&a6->transform.tx;
  *(_OWORD *)&a3->alpha = v15;
  *(_OWORD *)&a3->transform.a = v13;
  *(_OWORD *)&a3->transform.c = v14;
  *a4 = a7;
  return 1;
}

- (BOOL)getInitialGeometry:(PXTileGeometry *)a3 initialUserData:(id *)a4 forAppearingTileWithIdentifier:(PXTileIdentifier *)a5 toGeometry:(PXTileGeometry *)a6 toUserData:(id)a7
{
  a6->alpha = 0.0;
  CGPoint origin = a6->frame.origin;
  CGSize size = a6->frame.size;
  CGSize v9 = a6->size;
  a3->center = a6->center;
  a3->CGSize size = v9;
  a3->frame.CGPoint origin = origin;
  a3->frame.CGSize size = size;
  long long v10 = *(_OWORD *)&a6->hidden;
  long long v11 = *(_OWORD *)&a6->contentSize.height;
  long long v12 = *(_OWORD *)&a6->contentsRect.size.height;
  *(_OWORD *)&a3->contentsRect.origin.y = *(_OWORD *)&a6->contentsRect.origin.y;
  *(_OWORD *)&a3->contentsRect.size.height = v12;
  *(_OWORD *)&a3->hidden = v10;
  *(_OWORD *)&a3->contentSize.height = v11;
  long long v13 = *(_OWORD *)&a6->transform.a;
  long long v14 = *(_OWORD *)&a6->transform.c;
  long long v15 = *(_OWORD *)&a6->alpha;
  *(_OWORD *)&a3->transform.tx = *(_OWORD *)&a6->transform.tx;
  *(_OWORD *)&a3->alpha = v15;
  *(_OWORD *)&a3->transform.a = v13;
  *(_OWORD *)&a3->transform.c = v14;
  *a4 = a7;
  return 1;
}

- (id)optionsForAnimatingTileWithIdentifier:(PXTileIdentifier *)a3 animationType:(int64_t)a4 fromGeometry:(PXTileGeometry *)a5 fromUserData:(id)a6 toGeometry:(PXTileGeometry *)a7 toUserData:(id)a8
{
  id v11 = a6;
  id v12 = a8;
  if (a3->length - 3 <= 2 && a3->index[1] != 0x7FFFFFFFFFFFFFFFLL)
  {
    long long v13 = [(PXAssetsTileTransitionCoordinator *)self _kindsWithDisabledAnimation];
    if ([v13 containsIndex:a3->index[0]])
    {
      long long v14 = [(PXAssetsTileTransitionCoordinator *)self _tilingChange];
      long long v15 = [v14 fromLayout];
      v16 = [(PXAssetsTileTransitionCoordinator *)self _tilingChange];
      v17 = [v16 toLayout];

      if (v15 == v17)
      {
        v18 = 0;
        goto LABEL_8;
      }
    }
    else
    {
    }
  }
  v18 = [(PXAssetsTileTransitionCoordinator *)self _basicAnimationOptions];
LABEL_8:

  return v18;
}

- (PXAssetsTileTransitionCoordinator)initWithTilingChange:(id)a3 changeHistory:(id)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v40 = a3;
  id v39 = a4;
  v51.receiver = self;
  v51.super_class = (Class)PXAssetsTileTransitionCoordinator;
  v41 = [(PXAssetsTileTransitionCoordinator *)&v51 init];
  if (!v41) {
    goto LABEL_19;
  }
  objc_storeStrong((id *)&v41->__tilingChange, a3);
  objc_storeStrong((id *)&v41->__changeHistory, a4);
  uint64_t v7 = [v40 fromLayout];
  fromLayout = v41->__fromLayout;
  v41->__fromLayout = (PXAssetsTilingLayout *)v7;

  uint64_t v9 = [v40 toLayout];
  toLayout = v41->__toLayout;
  v41->__toLayout = (PXAssetsTilingLayout *)v9;

  id v11 = [v40 fromLayout];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = [v40 toLayout];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      uint64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
      uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_8;
    }
    long long v14 = [v40 fromLayout];
    long long v15 = [v14 dataSource];
    uint64_t v16 = [v15 identifier];

    id v11 = [v40 toLayout];
    v17 = [v11 dataSource];
    uint64_t v18 = [v17 identifier];
  }
  else
  {
    uint64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
  }

LABEL_8:
  uint64_t v19 = [v39 changeDetailsFromDataSourceIdentifier:v16 toDataSourceIdentifier:v18];
  changeDetails = v41->__changeDetails;
  v41->__changeDetails = (NSArray *)v19;

  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x2020000000;
  char v50 = 0;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  v21 = v41->__changeDetails;
  uint64_t v22 = [(NSArray *)v21 countByEnumeratingWithState:&v43 objects:v52 count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v44;
LABEL_10:
    uint64_t v24 = 0;
    while (1)
    {
      if (*(void *)v44 != v23) {
        objc_enumerationMutation(v21);
      }
      v25 = *(void **)(*((void *)&v43 + 1) + 8 * v24);
      v26 = [v25 sectionChanges];
      v27 = [v26 removedIndexes];
      BOOL v28 = [v27 count] == 0;

      if (!v28) {
        *((unsigned char *)v48 + 24) = 1;
      }
      v29 = [v25 sectionsWithItemChanges];
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __72__PXAssetsTileTransitionCoordinator_initWithTilingChange_changeHistory___block_invoke;
      v42[3] = &unk_1E5DC5478;
      v42[4] = v25;
      v42[5] = &v47;
      [v29 enumerateIndexesUsingBlock:v42];

      if (*((unsigned char *)v48 + 24)) {
        break;
      }
      if (v22 == ++v24)
      {
        uint64_t v22 = [(NSArray *)v21 countByEnumeratingWithState:&v43 objects:v52 count:16];
        if (v22) {
          goto LABEL_10;
        }
        break;
      }
    }
  }

  v41->_treatRemovalsAsDeletes = *((unsigned char *)v48 + 24);
  v30 = +[PXAssetsSceneSettings sharedInstance];
  uint64_t v31 = +[PXBasicTileAnimationOptions defaultAnimationOptions];
  basicAnimationOptions = v41->__basicAnimationOptions;
  v41->__basicAnimationOptions = (PXBasicTileAnimationOptions *)v31;

  v33 = v41->__basicAnimationOptions;
  [v30 transitionDuration];
  -[PXBasicTileAnimationOptions setDuration:](v33, "setDuration:");
  v34 = [MEMORY[0x1E4F28E60] indexSet];
  [v34 addIndex:6332434];
  [v34 addIndex:6332436];
  objc_storeStrong((id *)&v41->__kindsWithDisabledAnimation, v34);
  v35 = [MEMORY[0x1E4F28E60] indexSet];
  [v35 addIndex:6332435];
  [v35 addIndex:6332436];
  [v35 addIndex:6332438];
  [v35 addIndex:6332441];
  [v35 addIndex:6332439];
  objc_storeStrong((id *)&v41->__kindsCoveringContentTiles, v35);
  v36 = [MEMORY[0x1E4F28E60] indexSet];
  [(NSIndexSet *)v36 addIndex:6332437];
  kindsCenteredOnContentTiles = v41->__kindsCenteredOnContentTiles;
  v41->__kindsCenteredOnContentTiles = v36;

  _Block_object_dispose(&v47, 8);
LABEL_19:

  return v41;
}

void __72__PXAssetsTileTransitionCoordinator_initWithTilingChange_changeHistory___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  v5 = [*(id *)(a1 + 32) itemChangesInSection:a2];
  v6 = [v5 removedIndexes];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
}

+ (id)transitionCoordinatorForChange:(id)a3 changeHistory:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 fromLayout];
  v8 = [v5 toLayout];
  uint64_t v9 = [v7 dataSource];
  long long v10 = [v8 dataSource];
  int v11 = [v9 isEqual:v10];

  if (v11)
  {
    id v12 = [[PXAssetsTileTransitionCoordinator alloc] initWithTilingChange:v5 changeHistory:v6];

    [v5 fromReferenceSize];
    double v14 = v13;
    double v16 = v15;
    [v5 toReferenceSize];
    if (v14 != v18 || v16 != v17) {
      v12->super.__shouldCrossfade = 1;
    }
  }
  else
  {
    id v12 = [[PXAssetsDataSourceChangeTransitionCoordinator alloc] initWithTilingChange:v5 changeHistory:v6];
  }
  return v12;
}

@end