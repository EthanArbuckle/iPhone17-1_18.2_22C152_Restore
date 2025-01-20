@interface PXAssetsTilingLayout
- (BOOL)_getAnimatedImageOverlayTileIdentifier:(PXTileIdentifier *)a3 outGeometry:(PXTileGeometry *)a4 group:(unint64_t *)a5 userData:(id *)a6 forContentTileGeometry:(const PXTileGeometry *)a7 indexPath:(PXSimpleIndexPath *)a8;
- (BOOL)_getDimmingTileIdentifier:(PXTileIdentifier *)a3 outGeometry:(PXTileGeometry *)a4 group:(unint64_t *)a5 userData:(id *)a6 forContentTileGeometry:(const PXTileGeometry *)a7 indexPath:(PXSimpleIndexPath *)a8;
- (BOOL)_getLivePhotoOverlayTileIdentifier:(PXTileIdentifier *)a3 outGeometry:(PXTileGeometry *)a4 group:(unint64_t *)a5 userData:(id *)a6 forContentTileGeometry:(const PXTileGeometry *)a7 indexPath:(PXSimpleIndexPath *)a8;
- (BOOL)_getLoopingVideoOverlayTileIdentifier:(PXTileIdentifier *)a3 outGeometry:(PXTileGeometry *)a4 group:(unint64_t *)a5 userData:(id *)a6 forContentTileGeometry:(const PXTileGeometry *)a7 indexPath:(PXSimpleIndexPath *)a8;
- (BOOL)_getOverlayBadgeTileIdentifier:(PXTileIdentifier *)a3 outGeometry:(PXTileGeometry *)a4 group:(unint64_t *)a5 userData:(id *)a6 forContentTileGeometry:(const PXTileGeometry *)a7 indexPath:(PXSimpleIndexPath *)a8;
- (BOOL)_getPlayButtonTileIdentifier:(PXTileIdentifier *)a3 outGeometry:(PXTileGeometry *)a4 group:(unint64_t *)a5 userData:(id *)a6 forContentTileGeometry:(const PXTileGeometry *)a7 indexPath:(PXSimpleIndexPath *)a8;
- (BOOL)_getSelectionBadgeTileIdentifier:(PXTileIdentifier *)a3 outGeometry:(PXTileGeometry *)a4 group:(unint64_t *)a5 userData:(id *)a6 forContentTileGeometry:(const PXTileGeometry *)a7 indexPath:(PXSimpleIndexPath *)a8;
- (BOOL)_getVideoOverlayTileIdentifier:(PXTileIdentifier *)a3 outGeometry:(PXTileGeometry *)a4 group:(unint64_t *)a5 userData:(id *)a6 forContentTileGeometry:(const PXTileGeometry *)a7 indexPath:(PXSimpleIndexPath *)a8;
- (BOOL)getAdditionalAccessoryTileIdentifier:(PXTileIdentifier *)a3 outGeometry:(PXTileGeometry *)a4 group:(unint64_t *)a5 userData:(id *)a6 forTileKind:(unint64_t)a7 contentTileGeometry:(const PXTileGeometry *)a8 indexPath:(PXSimpleIndexPath *)a9;
- (BOOL)getGeometry:(PXTileGeometry *)a3 group:(unint64_t *)a4 userData:(id *)a5 forTileWithIdentifier:(PXTileIdentifier *)a6;
- (CGSize)_preferredSelectionBadgeSize;
- (CGSize)playButtonSizeForItemAtIndexPath:(PXSimpleIndexPath *)a3 contentTileSize:(CGSize)a4;
- (NSIndexSet)additionalAccessoryTileKinds;
- (PXAssetsDataSource)dataSource;
- (PXAssetsTilingLayout)init;
- (PXAssetsTilingLayout)initWithDataSource:(id)a3;
- (PXBasicTileUserData)_draggingDimmingUserData;
- (PXBasicTileUserData)_highlightedDimmingUserData;
- (PXBasicTileUserData)_selectedDimmingUserData;
- (PXIndexPathSet)draggingIndexPaths;
- (PXIndexPathSet)hiddenIndexPaths;
- (PXIndexPathSet)selectedIndexPaths;
- (PXOverlayBadgeTileUserData)_overlayBadgeTileUserData;
- (PXSelectionBadgeTileUserData)_selectedUserData;
- (PXSelectionBadgeTileUserData)_unselectedUserData;
- (PXSimpleIndexPath)focusedIndexPath;
- (PXSimpleIndexPath)highlightedIndexPath;
- (double)zPositionOffsetForKind:(unint64_t)a3;
- (id)description;
- (unint64_t)animatedOverlayBehavior;
- (unint64_t)badgeOptions;
- (unint64_t)selectionBadgeOptions;
- (void)_invalidateAllAnimatedOverlayTiles;
- (void)_invalidateAllSelectionTiles;
- (void)_setContentTileUserData:(id)a3;
- (void)adjustGeometry:(PXTileGeometry *)a3 forContentTileWithIndexPath:(PXSimpleIndexPath *)a4;
- (void)enumerateAccessoryTilesForContentTileWithIndexPath:(PXSimpleIndexPath *)a3 geometry:(const PXTileGeometry *)a4 withOptions:(id)a5 usingBlock:(id)a6;
- (void)setAdditionalAccessoryTileKinds:(id)a3;
- (void)setAnimatedOverlayBehavior:(unint64_t)a3;
- (void)setBadgeOptions:(unint64_t)a3;
- (void)setDraggingIndexPaths:(id)a3;
- (void)setFocusedIndexPath:(PXSimpleIndexPath *)a3;
- (void)setHiddenIndexPaths:(id)a3;
- (void)setHighlightedIndexPath:(PXSimpleIndexPath *)a3;
- (void)setSelectedIndexPaths:(id)a3;
- (void)setSelectionBadgeOptions:(unint64_t)a3;
@end

@implementation PXAssetsTilingLayout

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalAccessoryTileKinds, 0);
  objc_storeStrong((id *)&self->__draggingDimmingUserData, 0);
  objc_storeStrong((id *)&self->__selectedDimmingUserData, 0);
  objc_storeStrong((id *)&self->__highlightedDimmingUserData, 0);
  objc_storeStrong((id *)&self->__unselectedUserData, 0);
  objc_storeStrong((id *)&self->__selectedUserData, 0);
  objc_storeStrong((id *)&self->_draggingIndexPaths, 0);
  objc_storeStrong((id *)&self->_selectedIndexPaths, 0);
  objc_storeStrong((id *)&self->_hiddenIndexPaths, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_overlayBadgeTileUserData, 0);
}

- (void)setAdditionalAccessoryTileKinds:(id)a3
{
}

- (NSIndexSet)additionalAccessoryTileKinds
{
  return self->_additionalAccessoryTileKinds;
}

- (PXBasicTileUserData)_draggingDimmingUserData
{
  return self->__draggingDimmingUserData;
}

- (PXBasicTileUserData)_selectedDimmingUserData
{
  return self->__selectedDimmingUserData;
}

- (PXBasicTileUserData)_highlightedDimmingUserData
{
  return self->__highlightedDimmingUserData;
}

- (PXSelectionBadgeTileUserData)_unselectedUserData
{
  return self->__unselectedUserData;
}

- (PXSelectionBadgeTileUserData)_selectedUserData
{
  return self->__selectedUserData;
}

- (unint64_t)animatedOverlayBehavior
{
  return self->_animatedOverlayBehavior;
}

- (unint64_t)badgeOptions
{
  return self->_badgeOptions;
}

- (unint64_t)selectionBadgeOptions
{
  return self->_selectionBadgeOptions;
}

- (PXIndexPathSet)draggingIndexPaths
{
  return self->_draggingIndexPaths;
}

- (PXIndexPathSet)selectedIndexPaths
{
  return self->_selectedIndexPaths;
}

- (PXSimpleIndexPath)focusedIndexPath
{
  long long v3 = *(_OWORD *)&self[8].subitem;
  *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)&self[8].section;
  *(_OWORD *)&retstr->item = v3;
  return self;
}

- (PXSimpleIndexPath)highlightedIndexPath
{
  long long v3 = *(_OWORD *)&self[7].subitem;
  *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)&self[7].section;
  *(_OWORD *)&retstr->item = v3;
  return self;
}

- (PXIndexPathSet)hiddenIndexPaths
{
  return self->_hiddenIndexPaths;
}

- (PXAssetsDataSource)dataSource
{
  return self->_dataSource;
}

- (void)_setContentTileUserData:(id)a3
{
}

- (PXOverlayBadgeTileUserData)_overlayBadgeTileUserData
{
  return self->_overlayBadgeTileUserData;
}

- (double)zPositionOffsetForKind:(unint64_t)a3
{
  double result = 0.0;
  if (a3 - 6332434 <= 7) {
    return dbl_1AB35C918[a3 - 6332434];
  }
  return result;
}

- (id)description
{
  long long v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PXAssetsTilingLayout;
  v4 = [(PXAssetsTilingLayout *)&v8 description];
  v5 = [(PXAssetsTilingLayout *)self dataSource];
  v6 = [v3 stringWithFormat:@"<%@ dataSource:%@>", v4, v5];

  return v6;
}

- (void)_invalidateAllAnimatedOverlayTiles
{
  long long v3 = objc_alloc_init(PXTilingLayoutInvalidationContext);
  [(PXTilingLayoutInvalidationContext *)v3 invalidateTilesInGroup:450001];
  [(PXTilingLayout *)self invalidateLayoutWithContext:v3];
}

- (void)_invalidateAllSelectionTiles
{
  long long v3 = objc_alloc_init(PXTilingLayoutInvalidationContext);
  [(PXTilingLayoutInvalidationContext *)v3 invalidateTilesInGroup:450000];
  [(PXTilingLayout *)self invalidateLayoutWithContext:v3];
}

- (BOOL)getAdditionalAccessoryTileIdentifier:(PXTileIdentifier *)a3 outGeometry:(PXTileGeometry *)a4 group:(unint64_t *)a5 userData:(id *)a6 forTileKind:(unint64_t)a7 contentTileGeometry:(const PXTileGeometry *)a8 indexPath:(PXSimpleIndexPath *)a9
{
  return 0;
}

- (BOOL)_getOverlayBadgeTileIdentifier:(PXTileIdentifier *)a3 outGeometry:(PXTileGeometry *)a4 group:(unint64_t *)a5 userData:(id *)a6 forContentTileGeometry:(const PXTileGeometry *)a7 indexPath:(PXSimpleIndexPath *)a8
{
  unsigned int v15 = !a7->hidden & [(PXAssetsTilingLayout *)self badgeOptions];
  if (v15 == 1)
  {
    if (a3)
    {
      long long v16 = *(_OWORD *)&a8->dataSourceIdentifier;
      long long v17 = *(_OWORD *)&a8->item;
      *(_OWORD *)&a3->length = xmmword_1AB35A070;
      *(_OWORD *)&a3->index[1] = v16;
      *(_OWORD *)&a3->index[3] = v17;
      *(_OWORD *)&a3->index[5] = 0u;
      *(_OWORD *)&a3->index[7] = 0u;
      a3->index[9] = 0;
    }
    if (a4)
    {
      CGPoint origin = a7->frame.origin;
      CGSize size = a7->frame.size;
      CGSize v20 = a7->size;
      a4->center = a7->center;
      a4->CGSize size = v20;
      a4->frame.CGPoint origin = origin;
      a4->frame.CGSize size = size;
      long long v21 = *(_OWORD *)&a7->transform.a;
      long long v22 = *(_OWORD *)&a7->transform.c;
      long long v23 = *(_OWORD *)&a7->alpha;
      *(_OWORD *)&a4->transform.tx = *(_OWORD *)&a7->transform.tx;
      *(_OWORD *)&a4->alpha = v23;
      *(_OWORD *)&a4->transform.a = v21;
      *(_OWORD *)&a4->transform.c = v22;
      long long v24 = *(_OWORD *)&a7->hidden;
      long long v25 = *(_OWORD *)&a7->contentSize.height;
      long long v26 = *(_OWORD *)&a7->contentsRect.size.height;
      *(_OWORD *)&a4->contentsRect.origin.y = *(_OWORD *)&a7->contentsRect.origin.y;
      *(_OWORD *)&a4->contentsRect.size.height = v26;
      *(_OWORD *)&a4->hidden = v24;
      *(_OWORD *)&a4->contentSize.height = v25;
      double zPosition = a7->zPosition;
      [(PXAssetsTilingLayout *)self zPositionOffsetForKind:6332435];
      a4->double zPosition = zPosition + v28;
    }
    if (a5) {
      *a5 = 450000;
    }
    if (a6)
    {
      *a6 = [(PXAssetsTilingLayout *)self _overlayBadgeTileUserData];
    }
  }
  return v15;
}

- (BOOL)_getDimmingTileIdentifier:(PXTileIdentifier *)a3 outGeometry:(PXTileGeometry *)a4 group:(unint64_t *)a5 userData:(id *)a6 forContentTileGeometry:(const PXTileGeometry *)a7 indexPath:(PXSimpleIndexPath *)a8
{
  unint64_t v14 = [(PXAssetsTilingLayout *)self selectionBadgeOptions];
  [(PXAssetsTilingLayout *)self highlightedIndexPath];
  BOOL v16 = a8->dataSourceIdentifier == v47 && a8->section == v48 && a8->item == v49;
  v42 = a6;
  unint64_t v44 = v14;
  BOOL v17 = v16 && a8->subitem == v50;
  v18 = [(PXAssetsTilingLayout *)self draggingIndexPaths];
  long long v19 = *(_OWORD *)&a8->item;
  long long v45 = *(_OWORD *)&a8->dataSourceIdentifier;
  long long v46 = v19;
  int v20 = [v18 containsIndexPath:&v45];

  long long v21 = [(PXAssetsTilingLayout *)self selectedIndexPaths];
  long long v22 = *(_OWORD *)&a8->item;
  long long v45 = *(_OWORD *)&a8->dataSourceIdentifier;
  long long v46 = v22;
  int v23 = [v21 containsIndexPath:&v45];

  long long v24 = +[PXGridSettings sharedInstance];
  int v25 = [v24 disableSelectionOverlayView];

  if (a7->hidden
    || ((v23 & ~v25) != 1 || (v44 & 0x400) == 0)
    && ((v44 >> 11) & 1 & ~v23 | v20 & ((v44 & 0x400) != 0) | v17) != 1)
  {
    return 0;
  }
  if (a3)
  {
    long long v27 = *(_OWORD *)&a8->dataSourceIdentifier;
    long long v28 = *(_OWORD *)&a8->item;
    *(_OWORD *)&a3->length = xmmword_1AB35A080;
    *(_OWORD *)&a3->index[1] = v27;
    *(_OWORD *)&a3->index[3] = v28;
    *(_OWORD *)&a3->index[5] = 0u;
    *(_OWORD *)&a3->index[7] = 0u;
    a3->index[9] = 0;
  }
  if (a4)
  {
    CGPoint origin = a7->frame.origin;
    CGSize size = a7->frame.size;
    CGSize v31 = a7->size;
    a4->center = a7->center;
    a4->CGSize size = v31;
    a4->frame.CGPoint origin = origin;
    a4->frame.CGSize size = size;
    long long v32 = *(_OWORD *)&a7->transform.a;
    long long v33 = *(_OWORD *)&a7->transform.c;
    long long v34 = *(_OWORD *)&a7->alpha;
    *(_OWORD *)&a4->transform.tx = *(_OWORD *)&a7->transform.tx;
    *(_OWORD *)&a4->alpha = v34;
    *(_OWORD *)&a4->transform.a = v32;
    *(_OWORD *)&a4->transform.c = v33;
    long long v35 = *(_OWORD *)&a7->hidden;
    long long v36 = *(_OWORD *)&a7->contentSize.height;
    long long v37 = *(_OWORD *)&a7->contentsRect.size.height;
    *(_OWORD *)&a4->contentsRect.origin.y = *(_OWORD *)&a7->contentsRect.origin.y;
    *(_OWORD *)&a4->contentsRect.size.height = v37;
    *(_OWORD *)&a4->hidden = v35;
    *(_OWORD *)&a4->contentSize.height = v36;
    double zPosition = a7->zPosition;
    [(PXAssetsTilingLayout *)self zPositionOffsetForKind:6332436];
    a4->double zPosition = zPosition + v39;
    if ((v44 & 0xC00) == 0 && !v17) {
      a4->alpha = 0.0;
    }
  }
  if (a5) {
    *a5 = 450000;
  }
  if (v42)
  {
    if (v20)
    {
      v41 = [(PXAssetsTilingLayout *)self _draggingDimmingUserData];
    }
    else
    {
      if (v17) {
        [(PXAssetsTilingLayout *)self _highlightedDimmingUserData];
      }
      else {
      v41 = [(PXAssetsTilingLayout *)self _selectedDimmingUserData];
      }
    }
    id *v42 = v41;
  }
  return 1;
}

- (BOOL)_getAnimatedImageOverlayTileIdentifier:(PXTileIdentifier *)a3 outGeometry:(PXTileGeometry *)a4 group:(unint64_t *)a5 userData:(id *)a6 forContentTileGeometry:(const PXTileGeometry *)a7 indexPath:(PXSimpleIndexPath *)a8
{
  unsigned int v14 = [(PXAssetsTilingLayout *)self animatedOverlayBehavior];
  unsigned int v15 = [(PXAssetsTilingLayout *)self dataSource];
  long long v16 = *(_OWORD *)&a8->item;
  v35[0] = *(_OWORD *)&a8->dataSourceIdentifier;
  v35[1] = v16;
  BOOL v17 = [v15 assetAtItemIndexPath:v35];
  uint64_t v18 = [v17 playbackStyle];

  BOOL v19 = (v18 == 2) & (v14 >> 1);
  if (v19)
  {
    if (a3)
    {
      long long v20 = *(_OWORD *)&a8->dataSourceIdentifier;
      long long v21 = *(_OWORD *)&a8->item;
      *(_OWORD *)&a3->length = xmmword_1AB35A090;
      *(_OWORD *)&a3->index[1] = v20;
      *(_OWORD *)&a3->index[3] = v21;
      *(_OWORD *)&a3->index[5] = 0u;
      *(_OWORD *)&a3->index[7] = 0u;
      a3->index[9] = 0;
    }
    if (a4)
    {
      CGPoint origin = a7->frame.origin;
      CGSize size = a7->frame.size;
      CGSize v24 = a7->size;
      a4->center = a7->center;
      a4->CGSize size = v24;
      a4->frame.CGPoint origin = origin;
      a4->frame.CGSize size = size;
      long long v25 = *(_OWORD *)&a7->transform.a;
      long long v26 = *(_OWORD *)&a7->transform.c;
      long long v27 = *(_OWORD *)&a7->alpha;
      *(_OWORD *)&a4->transform.tx = *(_OWORD *)&a7->transform.tx;
      *(_OWORD *)&a4->alpha = v27;
      *(_OWORD *)&a4->transform.a = v25;
      *(_OWORD *)&a4->transform.c = v26;
      long long v28 = *(_OWORD *)&a7->hidden;
      long long v29 = *(_OWORD *)&a7->contentSize.height;
      long long v30 = *(_OWORD *)&a7->contentsRect.size.height;
      *(_OWORD *)&a4->contentsRect.origin.y = *(_OWORD *)&a7->contentsRect.origin.y;
      *(_OWORD *)&a4->contentsRect.size.height = v30;
      *(_OWORD *)&a4->hidden = v28;
      *(_OWORD *)&a4->contentSize.height = v29;
      double zPosition = a7->zPosition;
      [(PXAssetsTilingLayout *)self zPositionOffsetForKind:6332438];
      a4->double zPosition = zPosition + v32;
    }
    if (a5) {
      *a5 = 450001;
    }
    if (a6) {
      *a6 = 0;
    }
  }
  return v19;
}

- (BOOL)_getLoopingVideoOverlayTileIdentifier:(PXTileIdentifier *)a3 outGeometry:(PXTileGeometry *)a4 group:(unint64_t *)a5 userData:(id *)a6 forContentTileGeometry:(const PXTileGeometry *)a7 indexPath:(PXSimpleIndexPath *)a8
{
  char v14 = [(PXAssetsTilingLayout *)self animatedOverlayBehavior];
  unsigned int v15 = [(PXAssetsTilingLayout *)self dataSource];
  long long v16 = *(_OWORD *)&a8->item;
  v35[0] = *(_OWORD *)&a8->dataSourceIdentifier;
  v35[1] = v16;
  BOOL v17 = [v15 assetAtItemIndexPath:v35];
  uint64_t v18 = [v17 playbackStyle];

  unsigned int v19 = [(PXAssetsTilingLayout *)self animatedOverlayBehavior];
  if ((v14 & 1) == 0 || v18 != 5 && ((v18 == 3) & (v19 >> 4)) == 0) {
    return 0;
  }
  if (a3)
  {
    long long v21 = *(_OWORD *)&a8->dataSourceIdentifier;
    long long v22 = *(_OWORD *)&a8->item;
    *(_OWORD *)&a3->length = xmmword_1AB35A0A0;
    *(_OWORD *)&a3->index[1] = v21;
    *(_OWORD *)&a3->index[3] = v22;
    *(_OWORD *)&a3->index[5] = 0u;
    *(_OWORD *)&a3->index[7] = 0u;
    a3->index[9] = 0;
  }
  if (a4)
  {
    CGPoint origin = a7->frame.origin;
    CGSize size = a7->frame.size;
    CGSize v25 = a7->size;
    a4->center = a7->center;
    a4->CGSize size = v25;
    a4->frame.CGPoint origin = origin;
    a4->frame.CGSize size = size;
    long long v26 = *(_OWORD *)&a7->transform.a;
    long long v27 = *(_OWORD *)&a7->transform.c;
    long long v28 = *(_OWORD *)&a7->alpha;
    *(_OWORD *)&a4->transform.tx = *(_OWORD *)&a7->transform.tx;
    *(_OWORD *)&a4->alpha = v28;
    *(_OWORD *)&a4->transform.a = v26;
    *(_OWORD *)&a4->transform.c = v27;
    long long v29 = *(_OWORD *)&a7->hidden;
    long long v30 = *(_OWORD *)&a7->contentSize.height;
    long long v31 = *(_OWORD *)&a7->contentsRect.size.height;
    *(_OWORD *)&a4->contentsRect.origin.y = *(_OWORD *)&a7->contentsRect.origin.y;
    *(_OWORD *)&a4->contentsRect.size.height = v31;
    *(_OWORD *)&a4->hidden = v29;
    *(_OWORD *)&a4->contentSize.height = v30;
    double zPosition = a7->zPosition;
    [(PXAssetsTilingLayout *)self zPositionOffsetForKind:6332440];
    a4->double zPosition = zPosition + v33;
  }
  if (a5) {
    *a5 = 450001;
  }
  if (a6) {
    *a6 = 0;
  }
  return 1;
}

- (BOOL)_getVideoOverlayTileIdentifier:(PXTileIdentifier *)a3 outGeometry:(PXTileGeometry *)a4 group:(unint64_t *)a5 userData:(id *)a6 forContentTileGeometry:(const PXTileGeometry *)a7 indexPath:(PXSimpleIndexPath *)a8
{
  unsigned int v14 = [(PXAssetsTilingLayout *)self animatedOverlayBehavior];
  unsigned int v15 = [(PXAssetsTilingLayout *)self dataSource];
  long long v16 = *(_OWORD *)&a8->item;
  v35[0] = *(_OWORD *)&a8->dataSourceIdentifier;
  v35[1] = v16;
  BOOL v17 = [v15 assetAtItemIndexPath:v35];
  uint64_t v18 = [v17 playbackStyle];

  BOOL v19 = (v18 == 4) & (v14 >> 2);
  if (v19)
  {
    if (a3)
    {
      long long v20 = *(_OWORD *)&a8->dataSourceIdentifier;
      long long v21 = *(_OWORD *)&a8->item;
      *(_OWORD *)&a3->length = xmmword_1AB35A0B0;
      *(_OWORD *)&a3->index[1] = v20;
      *(_OWORD *)&a3->index[3] = v21;
      *(_OWORD *)&a3->index[5] = 0u;
      *(_OWORD *)&a3->index[7] = 0u;
      a3->index[9] = 0;
    }
    if (a4)
    {
      CGPoint origin = a7->frame.origin;
      CGSize size = a7->frame.size;
      CGSize v24 = a7->size;
      a4->center = a7->center;
      a4->CGSize size = v24;
      a4->frame.CGPoint origin = origin;
      a4->frame.CGSize size = size;
      long long v25 = *(_OWORD *)&a7->transform.a;
      long long v26 = *(_OWORD *)&a7->transform.c;
      long long v27 = *(_OWORD *)&a7->alpha;
      *(_OWORD *)&a4->transform.tx = *(_OWORD *)&a7->transform.tx;
      *(_OWORD *)&a4->alpha = v27;
      *(_OWORD *)&a4->transform.a = v25;
      *(_OWORD *)&a4->transform.c = v26;
      long long v28 = *(_OWORD *)&a7->hidden;
      long long v29 = *(_OWORD *)&a7->contentSize.height;
      long long v30 = *(_OWORD *)&a7->contentsRect.size.height;
      *(_OWORD *)&a4->contentsRect.origin.y = *(_OWORD *)&a7->contentsRect.origin.y;
      *(_OWORD *)&a4->contentsRect.size.height = v30;
      *(_OWORD *)&a4->hidden = v28;
      *(_OWORD *)&a4->contentSize.height = v29;
      double zPosition = a7->zPosition;
      [(PXAssetsTilingLayout *)self zPositionOffsetForKind:6332439];
      a4->double zPosition = zPosition + v32;
    }
    if (a5) {
      *a5 = 450001;
    }
    if (a6) {
      *a6 = 0;
    }
  }
  return v19;
}

- (BOOL)_getLivePhotoOverlayTileIdentifier:(PXTileIdentifier *)a3 outGeometry:(PXTileGeometry *)a4 group:(unint64_t *)a5 userData:(id *)a6 forContentTileGeometry:(const PXTileGeometry *)a7 indexPath:(PXSimpleIndexPath *)a8
{
  if (([(PXAssetsTilingLayout *)self animatedOverlayBehavior] & 8) == 0) {
    return 0;
  }
  unsigned int v15 = [(PXAssetsTilingLayout *)self dataSource];
  long long v16 = *(_OWORD *)&a8->item;
  v33[0] = *(_OWORD *)&a8->dataSourceIdentifier;
  v33[1] = v16;
  BOOL v17 = [v15 assetAtItemIndexPath:v33];
  uint64_t v18 = [v17 playbackStyle];

  if (v18 != 3 || ([(PXAssetsTilingLayout *)self animatedOverlayBehavior] & 0x10) != 0) {
    return 0;
  }
  if (a3)
  {
    long long v19 = *(_OWORD *)&a8->dataSourceIdentifier;
    long long v20 = *(_OWORD *)&a8->item;
    *(_OWORD *)&a3->length = xmmword_1AB35A0C0;
    *(_OWORD *)&a3->index[1] = v19;
    *(_OWORD *)&a3->index[3] = v20;
    *(_OWORD *)&a3->index[5] = 0u;
    *(_OWORD *)&a3->index[7] = 0u;
    a3->index[9] = 0;
  }
  if (a4)
  {
    CGPoint origin = a7->frame.origin;
    CGSize size = a7->frame.size;
    CGSize v23 = a7->size;
    a4->center = a7->center;
    a4->CGSize size = v23;
    a4->frame.CGPoint origin = origin;
    a4->frame.CGSize size = size;
    long long v24 = *(_OWORD *)&a7->transform.a;
    long long v25 = *(_OWORD *)&a7->transform.c;
    long long v26 = *(_OWORD *)&a7->alpha;
    *(_OWORD *)&a4->transform.tx = *(_OWORD *)&a7->transform.tx;
    *(_OWORD *)&a4->alpha = v26;
    *(_OWORD *)&a4->transform.a = v24;
    *(_OWORD *)&a4->transform.c = v25;
    long long v27 = *(_OWORD *)&a7->hidden;
    long long v28 = *(_OWORD *)&a7->contentSize.height;
    long long v29 = *(_OWORD *)&a7->contentsRect.size.height;
    *(_OWORD *)&a4->contentsRect.origin.y = *(_OWORD *)&a7->contentsRect.origin.y;
    *(_OWORD *)&a4->contentsRect.size.height = v29;
    *(_OWORD *)&a4->hidden = v27;
    *(_OWORD *)&a4->contentSize.height = v28;
    double zPosition = a7->zPosition;
    [(PXAssetsTilingLayout *)self zPositionOffsetForKind:6332441];
    a4->double zPosition = zPosition + v31;
  }
  if (a5) {
    *a5 = 450001;
  }
  if (a6) {
    *a6 = 0;
  }
  return 1;
}

- (BOOL)_getPlayButtonTileIdentifier:(PXTileIdentifier *)a3 outGeometry:(PXTileGeometry *)a4 group:(unint64_t *)a5 userData:(id *)a6 forContentTileGeometry:(const PXTileGeometry *)a7 indexPath:(PXSimpleIndexPath *)a8
{
  long long v14 = *(_OWORD *)&a8->item;
  v21[0] = *(_OWORD *)&a8->dataSourceIdentifier;
  v21[1] = v14;
  -[PXAssetsTilingLayout playButtonSizeForItemAtIndexPath:contentTileSize:](self, "playButtonSizeForItemAtIndexPath:contentTileSize:", v21, a7->size.width, a7->size.height);
  if (a7->hidden) {
    return 0;
  }
  if (v15 == *MEMORY[0x1E4F1DB30] && v16 == *(double *)(MEMORY[0x1E4F1DB30] + 8)) {
    return 0;
  }
  if (a3)
  {
    long long v18 = *(_OWORD *)&a8->dataSourceIdentifier;
    long long v19 = *(_OWORD *)&a8->item;
    *(_OWORD *)&a3->length = xmmword_1AB35A0D0;
    *(_OWORD *)&a3->index[1] = v18;
    *(_OWORD *)&a3->index[3] = v19;
    *(_OWORD *)&a3->index[5] = 0u;
    *(_OWORD *)&a3->index[7] = 0u;
    a3->index[9] = 0;
  }
  if (a4) {
    PXRectWithCenterAndSize();
  }
  if (a5) {
    *a5 = 0;
  }
  if (a6) {
    *a6 = 0;
  }
  return 1;
}

- (BOOL)_getSelectionBadgeTileIdentifier:(PXTileIdentifier *)a3 outGeometry:(PXTileGeometry *)a4 group:(unint64_t *)a5 userData:(id *)a6 forContentTileGeometry:(const PXTileGeometry *)a7 indexPath:(PXSimpleIndexPath *)a8
{
  char v15 = [(PXAssetsTilingLayout *)self selectionBadgeOptions];
  if (a7->hidden) {
    return 0;
  }
  if ((v15 & 2) == 0)
  {
    if ((v15 & 1) == 0) {
      return 0;
    }
    BOOL v17 = [(PXAssetsTilingLayout *)self selectedIndexPaths];
    long long v18 = *(_OWORD *)&a8->item;
    long long v26 = *(_OWORD *)&a8->dataSourceIdentifier;
    long long v27 = v18;
    int v19 = [v17 containsIndexPath:&v26];

    if (!v19) {
      return 0;
    }
  }
  if (a3)
  {
    long long v20 = *(_OWORD *)&a8->dataSourceIdentifier;
    long long v21 = *(_OWORD *)&a8->item;
    *(_OWORD *)&a3->length = xmmword_1AB35A0E0;
    *(_OWORD *)&a3->index[1] = v20;
    *(_OWORD *)&a3->index[3] = v21;
    *(_OWORD *)&a3->index[5] = 0u;
    *(_OWORD *)&a3->index[7] = 0u;
    a3->index[9] = 0;
  }
  if (a4)
  {
    [(PXAssetsTilingLayout *)self _preferredSelectionBadgeSize];
    CGRectGetMaxX(a7->frame);
    CGRectGetMaxY(a7->frame);
    [(PXTilingLayout *)self coordinateSpaceIdentifier];
    PXRectGetCenter();
  }
  if (a5) {
    *a5 = 450000;
  }
  if (a6)
  {
    long long v22 = [(PXAssetsTilingLayout *)self selectedIndexPaths];
    long long v23 = *(_OWORD *)&a8->item;
    long long v26 = *(_OWORD *)&a8->dataSourceIdentifier;
    long long v27 = v23;
    char v24 = [v22 containsIndexPath:&v26];

    if (v24) {
      [(PXAssetsTilingLayout *)self _selectedUserData];
    }
    else {
    id v25 = [(PXAssetsTilingLayout *)self _unselectedUserData];
    }
    *a6 = v25;
  }
  return 1;
}

- (CGSize)playButtonSizeForItemAtIndexPath:(PXSimpleIndexPath *)a3 contentTileSize:(CGSize)a4
{
  double v4 = *MEMORY[0x1E4F1DB30];
  double v5 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.height = v5;
  result.width = v4;
  return result;
}

- (BOOL)getGeometry:(PXTileGeometry *)a3 group:(unint64_t *)a4 userData:(id *)a5 forTileWithIdentifier:(PXTileIdentifier *)a6
{
  if (a6->length - 3 > 2
    || (unint64_t v7 = a6->index[1], v7 == 0x7FFFFFFFFFFFFFFFLL)
    || ([(PXAssetsTilingLayout *)self dataSource],
        v12 = objc_claimAutoreleasedReturnValue(),
        uint64_t v13 = [v12 identifier],
        v12,
        v7 != v13))
  {
LABEL_16:
    LOBYTE(v20) = 0;
  }
  else
  {
    unint64_t v15 = a6->index[2];
    unint64_t v14 = a6->index[3];
    unint64_t v16 = a6->index[4];
    index = a6->index;
    unint64_t v17 = a6->index[0];
    unint64_t v18 = index[1];
    memset(v38, 0, 192);
    uint64_t v37 = 0;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v30 = xmmword_1AB359AB0;
    unint64_t v31 = v18;
    unint64_t v32 = v15;
    unint64_t v33 = v14;
    unint64_t v34 = v16;
    BOOL v20 = [(PXAssetsTilingLayout *)self getGeometry:v38 group:0 userData:0 forTileWithIdentifier:&v30];
    if (v20)
    {
      uint64_t v29 = 0;
      memset(v28, 0, sizeof(v28));
      switch(v17)
      {
        case 0x60A012uLL:
          unint64_t v24 = v18;
          unint64_t v25 = v15;
          unint64_t v26 = v14;
          unint64_t v27 = v16;
          LOBYTE(v20) = [(PXAssetsTilingLayout *)self _getSelectionBadgeTileIdentifier:v28 outGeometry:a3 group:a4 userData:a5 forContentTileGeometry:v38 indexPath:&v24];
          break;
        case 0x60A013uLL:
          unint64_t v24 = v18;
          unint64_t v25 = v15;
          unint64_t v26 = v14;
          unint64_t v27 = v16;
          LOBYTE(v20) = [(PXAssetsTilingLayout *)self _getOverlayBadgeTileIdentifier:v28 outGeometry:a3 group:a4 userData:a5 forContentTileGeometry:v38 indexPath:&v24];
          break;
        case 0x60A014uLL:
          unint64_t v24 = v18;
          unint64_t v25 = v15;
          unint64_t v26 = v14;
          unint64_t v27 = v16;
          LOBYTE(v20) = [(PXAssetsTilingLayout *)self _getDimmingTileIdentifier:v28 outGeometry:a3 group:a4 userData:a5 forContentTileGeometry:v38 indexPath:&v24];
          break;
        case 0x60A015uLL:
          unint64_t v24 = v18;
          unint64_t v25 = v15;
          unint64_t v26 = v14;
          unint64_t v27 = v16;
          LOBYTE(v20) = [(PXAssetsTilingLayout *)self _getPlayButtonTileIdentifier:v28 outGeometry:a3 group:a4 userData:a5 forContentTileGeometry:v38 indexPath:&v24];
          break;
        case 0x60A016uLL:
          unint64_t v24 = v18;
          unint64_t v25 = v15;
          unint64_t v26 = v14;
          unint64_t v27 = v16;
          LOBYTE(v20) = [(PXAssetsTilingLayout *)self _getAnimatedImageOverlayTileIdentifier:v28 outGeometry:a3 group:a4 userData:a5 forContentTileGeometry:v38 indexPath:&v24];
          break;
        case 0x60A017uLL:
          unint64_t v24 = v18;
          unint64_t v25 = v15;
          unint64_t v26 = v14;
          unint64_t v27 = v16;
          LOBYTE(v20) = [(PXAssetsTilingLayout *)self _getVideoOverlayTileIdentifier:v28 outGeometry:a3 group:a4 userData:a5 forContentTileGeometry:v38 indexPath:&v24];
          break;
        case 0x60A018uLL:
          unint64_t v24 = v18;
          unint64_t v25 = v15;
          unint64_t v26 = v14;
          unint64_t v27 = v16;
          LOBYTE(v20) = [(PXAssetsTilingLayout *)self _getLoopingVideoOverlayTileIdentifier:v28 outGeometry:a3 group:a4 userData:a5 forContentTileGeometry:v38 indexPath:&v24];
          break;
        case 0x60A019uLL:
          unint64_t v24 = v18;
          unint64_t v25 = v15;
          unint64_t v26 = v14;
          unint64_t v27 = v16;
          LOBYTE(v20) = [(PXAssetsTilingLayout *)self _getLivePhotoOverlayTileIdentifier:v28 outGeometry:a3 group:a4 userData:a5 forContentTileGeometry:v38 indexPath:&v24];
          break;
        default:
          long long v21 = [(PXAssetsTilingLayout *)self additionalAccessoryTileKinds];
          int v23 = [v21 containsIndex:v17];

          if (!v23) {
            goto LABEL_16;
          }
          unint64_t v24 = v18;
          unint64_t v25 = v15;
          unint64_t v26 = v14;
          unint64_t v27 = v16;
          LOBYTE(v20) = [(PXAssetsTilingLayout *)self getAdditionalAccessoryTileIdentifier:v28 outGeometry:a3 group:a4 userData:a5 forTileKind:v17 contentTileGeometry:v38 indexPath:&v24];
          break;
      }
    }
  }
  return v20;
}

- (void)enumerateAccessoryTilesForContentTileWithIndexPath:(PXSimpleIndexPath *)a3 geometry:(const PXTileGeometry *)a4 withOptions:(id)a5 usingBlock:(id)a6
{
  id v10 = a5;
  v11 = a6;
  uint64_t v184 = 0;
  v185 = &v184;
  uint64_t v186 = 0x2020000000;
  char v187 = 0;
  uint64_t v178 = 0;
  v179 = &v178;
  uint64_t v180 = 0x7810000000;
  v181 = &unk_1AB5D584F;
  memset(v182, 0, sizeof(v182));
  uint64_t v183 = 0;
  uint64_t v173 = 0;
  v174 = &v173;
  uint64_t v175 = 0xE010000000;
  v176 = &unk_1AB5D584F;
  memset(v177, 0, sizeof(v177));
  uint64_t v169 = 0;
  v170 = &v169;
  uint64_t v171 = 0x2020000000;
  uint64_t v172 = 0;
  uint64_t v163 = 0;
  v164 = (id *)&v163;
  uint64_t v165 = 0x3032000000;
  v166 = __Block_byref_object_copy__255869;
  v167 = __Block_byref_object_dispose__255870;
  id v168 = 0;
  id obj = 0;
  long long v12 = *(_OWORD *)&a3->item;
  long long v144 = *(_OWORD *)&a3->dataSourceIdentifier;
  long long v145 = v12;
  BOOL v13 = [(PXAssetsTilingLayout *)self _getSelectionBadgeTileIdentifier:v182 outGeometry:v177 group:&v172 userData:&obj forContentTileGeometry:a4 indexPath:&v144];
  objc_storeStrong(&v168, obj);
  if (v13)
  {
    uint64_t v14 = v170[3];
    id v15 = v164[5];
    unint64_t v16 = (void (*)(void *, long long *, long long *, uint64_t, id, uint64_t *))v11[2];
    long long v17 = *((_OWORD *)v179 + 5);
    long long v158 = *((_OWORD *)v179 + 4);
    long long v159 = v17;
    long long v160 = *((_OWORD *)v179 + 6);
    uint64_t v161 = v179[14];
    long long v18 = *((_OWORD *)v179 + 3);
    long long v156 = *((_OWORD *)v179 + 2);
    long long v157 = v18;
    long long v19 = *((_OWORD *)v174 + 11);
    long long v152 = *((_OWORD *)v174 + 10);
    long long v153 = v19;
    long long v20 = *((_OWORD *)v174 + 13);
    long long v154 = *((_OWORD *)v174 + 12);
    long long v155 = v20;
    long long v21 = *((_OWORD *)v174 + 7);
    long long v148 = *((_OWORD *)v174 + 6);
    long long v149 = v21;
    long long v22 = *((_OWORD *)v174 + 9);
    long long v150 = *((_OWORD *)v174 + 8);
    long long v151 = v22;
    long long v23 = *((_OWORD *)v174 + 3);
    long long v144 = *((_OWORD *)v174 + 2);
    long long v145 = v23;
    long long v24 = *((_OWORD *)v174 + 5);
    long long v146 = *((_OWORD *)v174 + 4);
    long long v147 = v24;
    v16(v11, &v156, &v144, v14, v15, v185 + 3);
  }
  unint64_t v25 = v185;
  if (!*((unsigned char *)v185 + 24))
  {
    unint64_t v26 = v164;
    id v143 = 0;
    long long v27 = *(_OWORD *)&a3->item;
    long long v144 = *(_OWORD *)&a3->dataSourceIdentifier;
    long long v145 = v27;
    BOOL v28 = [(PXAssetsTilingLayout *)self _getDimmingTileIdentifier:v179 + 4 outGeometry:v174 + 4 group:v170 + 3 userData:&v143 forContentTileGeometry:a4 indexPath:&v144];
    objc_storeStrong(v26 + 5, v143);
    unint64_t v25 = v185;
    if (v28)
    {
      uint64_t v29 = v170[3];
      id v30 = v164[5];
      unint64_t v31 = (void (*)(void *, long long *, long long *, uint64_t, id, uint64_t *))v11[2];
      long long v32 = *((_OWORD *)v179 + 5);
      long long v158 = *((_OWORD *)v179 + 4);
      long long v159 = v32;
      long long v160 = *((_OWORD *)v179 + 6);
      uint64_t v161 = v179[14];
      long long v33 = *((_OWORD *)v179 + 3);
      long long v156 = *((_OWORD *)v179 + 2);
      long long v157 = v33;
      long long v34 = *((_OWORD *)v174 + 11);
      long long v152 = *((_OWORD *)v174 + 10);
      long long v153 = v34;
      long long v35 = *((_OWORD *)v174 + 13);
      long long v154 = *((_OWORD *)v174 + 12);
      long long v155 = v35;
      long long v36 = *((_OWORD *)v174 + 7);
      long long v148 = *((_OWORD *)v174 + 6);
      long long v149 = v36;
      long long v37 = *((_OWORD *)v174 + 9);
      long long v150 = *((_OWORD *)v174 + 8);
      long long v151 = v37;
      long long v38 = *((_OWORD *)v174 + 3);
      long long v144 = *((_OWORD *)v174 + 2);
      long long v145 = v38;
      long long v39 = *((_OWORD *)v174 + 5);
      long long v146 = *((_OWORD *)v174 + 4);
      long long v147 = v39;
      v31(v11, &v156, &v144, v29, v30, v185 + 3);
      unint64_t v25 = v185;
    }
  }
  if (!*((unsigned char *)v25 + 24))
  {
    v40 = v164;
    id v142 = 0;
    long long v41 = *(_OWORD *)&a3->item;
    long long v144 = *(_OWORD *)&a3->dataSourceIdentifier;
    long long v145 = v41;
    BOOL v42 = [(PXAssetsTilingLayout *)self _getOverlayBadgeTileIdentifier:v179 + 4 outGeometry:v174 + 4 group:v170 + 3 userData:&v142 forContentTileGeometry:a4 indexPath:&v144];
    objc_storeStrong(v40 + 5, v142);
    unint64_t v25 = v185;
    if (v42)
    {
      uint64_t v43 = v170[3];
      id v44 = v164[5];
      long long v45 = (void (*)(void *, long long *, long long *, uint64_t, id, uint64_t *))v11[2];
      long long v46 = *((_OWORD *)v179 + 5);
      long long v158 = *((_OWORD *)v179 + 4);
      long long v159 = v46;
      long long v160 = *((_OWORD *)v179 + 6);
      uint64_t v161 = v179[14];
      long long v47 = *((_OWORD *)v179 + 3);
      long long v156 = *((_OWORD *)v179 + 2);
      long long v157 = v47;
      long long v48 = *((_OWORD *)v174 + 11);
      long long v152 = *((_OWORD *)v174 + 10);
      long long v153 = v48;
      long long v49 = *((_OWORD *)v174 + 13);
      long long v154 = *((_OWORD *)v174 + 12);
      long long v155 = v49;
      long long v50 = *((_OWORD *)v174 + 7);
      long long v148 = *((_OWORD *)v174 + 6);
      long long v149 = v50;
      long long v51 = *((_OWORD *)v174 + 9);
      long long v150 = *((_OWORD *)v174 + 8);
      long long v151 = v51;
      long long v52 = *((_OWORD *)v174 + 3);
      long long v144 = *((_OWORD *)v174 + 2);
      long long v145 = v52;
      long long v53 = *((_OWORD *)v174 + 5);
      long long v146 = *((_OWORD *)v174 + 4);
      long long v147 = v53;
      v45(v11, &v156, &v144, v43, v44, v185 + 3);
      unint64_t v25 = v185;
    }
  }
  if (!*((unsigned char *)v25 + 24))
  {
    v54 = v164;
    id v141 = 0;
    long long v55 = *(_OWORD *)&a3->item;
    long long v144 = *(_OWORD *)&a3->dataSourceIdentifier;
    long long v145 = v55;
    BOOL v56 = [(PXAssetsTilingLayout *)self _getPlayButtonTileIdentifier:v179 + 4 outGeometry:v174 + 4 group:v170 + 3 userData:&v141 forContentTileGeometry:a4 indexPath:&v144];
    objc_storeStrong(v54 + 5, v141);
    unint64_t v25 = v185;
    if (v56)
    {
      uint64_t v57 = v170[3];
      id v58 = v164[5];
      v59 = (void (*)(void *, long long *, long long *, uint64_t, id, uint64_t *))v11[2];
      long long v60 = *((_OWORD *)v179 + 5);
      long long v158 = *((_OWORD *)v179 + 4);
      long long v159 = v60;
      long long v160 = *((_OWORD *)v179 + 6);
      uint64_t v161 = v179[14];
      long long v61 = *((_OWORD *)v179 + 3);
      long long v156 = *((_OWORD *)v179 + 2);
      long long v157 = v61;
      long long v62 = *((_OWORD *)v174 + 11);
      long long v152 = *((_OWORD *)v174 + 10);
      long long v153 = v62;
      long long v63 = *((_OWORD *)v174 + 13);
      long long v154 = *((_OWORD *)v174 + 12);
      long long v155 = v63;
      long long v64 = *((_OWORD *)v174 + 7);
      long long v148 = *((_OWORD *)v174 + 6);
      long long v149 = v64;
      long long v65 = *((_OWORD *)v174 + 9);
      long long v150 = *((_OWORD *)v174 + 8);
      long long v151 = v65;
      long long v66 = *((_OWORD *)v174 + 3);
      long long v144 = *((_OWORD *)v174 + 2);
      long long v145 = v66;
      long long v67 = *((_OWORD *)v174 + 5);
      long long v146 = *((_OWORD *)v174 + 4);
      long long v147 = v67;
      v59(v11, &v156, &v144, v57, v58, v185 + 3);
      unint64_t v25 = v185;
    }
  }
  if (!*((unsigned char *)v25 + 24))
  {
    v68 = v164;
    id v140 = 0;
    long long v69 = *(_OWORD *)&a3->item;
    long long v144 = *(_OWORD *)&a3->dataSourceIdentifier;
    long long v145 = v69;
    BOOL v70 = [(PXAssetsTilingLayout *)self _getVideoOverlayTileIdentifier:v179 + 4 outGeometry:v174 + 4 group:v170 + 3 userData:&v140 forContentTileGeometry:a4 indexPath:&v144];
    objc_storeStrong(v68 + 5, v140);
    unint64_t v25 = v185;
    if (v70)
    {
      uint64_t v71 = v170[3];
      id v72 = v164[5];
      v73 = (void (*)(void *, long long *, long long *, uint64_t, id, uint64_t *))v11[2];
      long long v74 = *((_OWORD *)v179 + 5);
      long long v158 = *((_OWORD *)v179 + 4);
      long long v159 = v74;
      long long v160 = *((_OWORD *)v179 + 6);
      uint64_t v161 = v179[14];
      long long v75 = *((_OWORD *)v179 + 3);
      long long v156 = *((_OWORD *)v179 + 2);
      long long v157 = v75;
      long long v76 = *((_OWORD *)v174 + 11);
      long long v152 = *((_OWORD *)v174 + 10);
      long long v153 = v76;
      long long v77 = *((_OWORD *)v174 + 13);
      long long v154 = *((_OWORD *)v174 + 12);
      long long v155 = v77;
      long long v78 = *((_OWORD *)v174 + 7);
      long long v148 = *((_OWORD *)v174 + 6);
      long long v149 = v78;
      long long v79 = *((_OWORD *)v174 + 9);
      long long v150 = *((_OWORD *)v174 + 8);
      long long v151 = v79;
      long long v80 = *((_OWORD *)v174 + 3);
      long long v144 = *((_OWORD *)v174 + 2);
      long long v145 = v80;
      long long v81 = *((_OWORD *)v174 + 5);
      long long v146 = *((_OWORD *)v174 + 4);
      long long v147 = v81;
      v73(v11, &v156, &v144, v71, v72, v185 + 3);
      unint64_t v25 = v185;
    }
  }
  if (!*((unsigned char *)v25 + 24))
  {
    v82 = v164;
    id v139 = 0;
    long long v83 = *(_OWORD *)&a3->item;
    long long v144 = *(_OWORD *)&a3->dataSourceIdentifier;
    long long v145 = v83;
    BOOL v84 = [(PXAssetsTilingLayout *)self _getLoopingVideoOverlayTileIdentifier:v179 + 4 outGeometry:v174 + 4 group:v170 + 3 userData:&v139 forContentTileGeometry:a4 indexPath:&v144];
    objc_storeStrong(v82 + 5, v139);
    unint64_t v25 = v185;
    if (v84)
    {
      uint64_t v85 = v170[3];
      id v86 = v164[5];
      v87 = (void (*)(void *, long long *, long long *, uint64_t, id, uint64_t *))v11[2];
      long long v88 = *((_OWORD *)v179 + 5);
      long long v158 = *((_OWORD *)v179 + 4);
      long long v159 = v88;
      long long v160 = *((_OWORD *)v179 + 6);
      uint64_t v161 = v179[14];
      long long v89 = *((_OWORD *)v179 + 3);
      long long v156 = *((_OWORD *)v179 + 2);
      long long v157 = v89;
      long long v90 = *((_OWORD *)v174 + 11);
      long long v152 = *((_OWORD *)v174 + 10);
      long long v153 = v90;
      long long v91 = *((_OWORD *)v174 + 13);
      long long v154 = *((_OWORD *)v174 + 12);
      long long v155 = v91;
      long long v92 = *((_OWORD *)v174 + 7);
      long long v148 = *((_OWORD *)v174 + 6);
      long long v149 = v92;
      long long v93 = *((_OWORD *)v174 + 9);
      long long v150 = *((_OWORD *)v174 + 8);
      long long v151 = v93;
      long long v94 = *((_OWORD *)v174 + 3);
      long long v144 = *((_OWORD *)v174 + 2);
      long long v145 = v94;
      long long v95 = *((_OWORD *)v174 + 5);
      long long v146 = *((_OWORD *)v174 + 4);
      long long v147 = v95;
      v87(v11, &v156, &v144, v85, v86, v185 + 3);
      unint64_t v25 = v185;
    }
  }
  if (!*((unsigned char *)v25 + 24))
  {
    v96 = v164;
    id v138 = 0;
    long long v97 = *(_OWORD *)&a3->item;
    long long v144 = *(_OWORD *)&a3->dataSourceIdentifier;
    long long v145 = v97;
    BOOL v98 = [(PXAssetsTilingLayout *)self _getAnimatedImageOverlayTileIdentifier:v179 + 4 outGeometry:v174 + 4 group:v170 + 3 userData:&v138 forContentTileGeometry:a4 indexPath:&v144];
    objc_storeStrong(v96 + 5, v138);
    unint64_t v25 = v185;
    if (v98)
    {
      uint64_t v99 = v170[3];
      id v100 = v164[5];
      v101 = (void (*)(void *, long long *, long long *, uint64_t, id, uint64_t *))v11[2];
      long long v102 = *((_OWORD *)v179 + 5);
      long long v158 = *((_OWORD *)v179 + 4);
      long long v159 = v102;
      long long v160 = *((_OWORD *)v179 + 6);
      uint64_t v161 = v179[14];
      long long v103 = *((_OWORD *)v179 + 3);
      long long v156 = *((_OWORD *)v179 + 2);
      long long v157 = v103;
      long long v104 = *((_OWORD *)v174 + 11);
      long long v152 = *((_OWORD *)v174 + 10);
      long long v153 = v104;
      long long v105 = *((_OWORD *)v174 + 13);
      long long v154 = *((_OWORD *)v174 + 12);
      long long v155 = v105;
      long long v106 = *((_OWORD *)v174 + 7);
      long long v148 = *((_OWORD *)v174 + 6);
      long long v149 = v106;
      long long v107 = *((_OWORD *)v174 + 9);
      long long v150 = *((_OWORD *)v174 + 8);
      long long v151 = v107;
      long long v108 = *((_OWORD *)v174 + 3);
      long long v144 = *((_OWORD *)v174 + 2);
      long long v145 = v108;
      long long v109 = *((_OWORD *)v174 + 5);
      long long v146 = *((_OWORD *)v174 + 4);
      long long v147 = v109;
      v101(v11, &v156, &v144, v99, v100, v185 + 3);
      unint64_t v25 = v185;
    }
  }
  if (!*((unsigned char *)v25 + 24))
  {
    v110 = v164;
    id v137 = 0;
    long long v111 = *(_OWORD *)&a3->item;
    long long v144 = *(_OWORD *)&a3->dataSourceIdentifier;
    long long v145 = v111;
    BOOL v112 = [(PXAssetsTilingLayout *)self _getLivePhotoOverlayTileIdentifier:v179 + 4 outGeometry:v174 + 4 group:v170 + 3 userData:&v137 forContentTileGeometry:a4 indexPath:&v144];
    objc_storeStrong(v110 + 5, v137);
    if (v112)
    {
      uint64_t v113 = v170[3];
      id v114 = v164[5];
      v115 = (void (*)(void *, long long *, long long *, uint64_t, id, uint64_t *))v11[2];
      long long v116 = *((_OWORD *)v179 + 5);
      long long v158 = *((_OWORD *)v179 + 4);
      long long v159 = v116;
      long long v160 = *((_OWORD *)v179 + 6);
      uint64_t v161 = v179[14];
      long long v117 = *((_OWORD *)v179 + 3);
      long long v156 = *((_OWORD *)v179 + 2);
      long long v157 = v117;
      long long v118 = *((_OWORD *)v174 + 11);
      long long v152 = *((_OWORD *)v174 + 10);
      long long v153 = v118;
      long long v119 = *((_OWORD *)v174 + 13);
      long long v154 = *((_OWORD *)v174 + 12);
      long long v155 = v119;
      long long v120 = *((_OWORD *)v174 + 7);
      long long v148 = *((_OWORD *)v174 + 6);
      long long v149 = v120;
      long long v121 = *((_OWORD *)v174 + 9);
      long long v150 = *((_OWORD *)v174 + 8);
      long long v151 = v121;
      long long v122 = *((_OWORD *)v174 + 3);
      long long v144 = *((_OWORD *)v174 + 2);
      long long v145 = v122;
      long long v123 = *((_OWORD *)v174 + 5);
      long long v146 = *((_OWORD *)v174 + 4);
      long long v147 = v123;
      v115(v11, &v156, &v144, v113, v114, v185 + 3);
    }
  }
  v124 = [(PXAssetsTilingLayout *)self additionalAccessoryTileKinds];
  v127[0] = MEMORY[0x1E4F143A8];
  v127[1] = 3221225472;
  v127[2] = __107__PXAssetsTilingLayout_enumerateAccessoryTilesForContentTileWithIndexPath_geometry_withOptions_usingBlock___block_invoke;
  v127[3] = &unk_1E5DCC298;
  v129 = &v184;
  v127[4] = self;
  v130 = &v178;
  v131 = &v173;
  v132 = &v169;
  v133 = &v163;
  v134 = a4;
  long long v125 = *(_OWORD *)&a3->item;
  long long v135 = *(_OWORD *)&a3->dataSourceIdentifier;
  long long v136 = v125;
  v126 = v11;
  id v128 = v126;
  [v124 enumerateIndexesUsingBlock:v127];

  _Block_object_dispose(&v163, 8);
  _Block_object_dispose(&v169, 8);
  _Block_object_dispose(&v173, 8);
  _Block_object_dispose(&v178, 8);
  _Block_object_dispose(&v184, 8);
}

void __107__PXAssetsTilingLayout_enumerateAccessoryTilesForContentTileWithIndexPath_geometry_withOptions_usingBlock___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t v4 = *(void *)(a1 + 48);
  if (!*(unsigned char *)(*(void *)(v4 + 8) + 24))
  {
    v6 = *(void **)(a1 + 32);
    uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8) + 32;
    uint64_t v8 = *(void *)(*(void *)(a1 + 64) + 8) + 32;
    uint64_t v9 = *(void *)(*(void *)(a1 + 72) + 8) + 24;
    id v10 = (id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
    id v43 = 0;
    uint64_t v11 = *(void *)(a1 + 88);
    long long v12 = *(_OWORD *)(a1 + 112);
    long long v25 = *(_OWORD *)(a1 + 96);
    long long v26 = v12;
    int v13 = [v6 getAdditionalAccessoryTileIdentifier:v7 outGeometry:v8 group:v9 userData:&v43 forTileKind:a2 contentTileGeometry:v11 indexPath:&v25];
    objc_storeStrong(v10, v43);
    uint64_t v4 = *(void *)(a1 + 48);
    if (v13)
    {
      uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
      id v15 = *(_OWORD **)(*(void *)(a1 + 64) + 8);
      unint64_t v16 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
      long long v17 = *(_OWORD *)(v14 + 80);
      long long v39 = *(_OWORD *)(v14 + 64);
      long long v40 = v17;
      long long v41 = *(_OWORD *)(v14 + 96);
      uint64_t v42 = *(void *)(v14 + 112);
      long long v18 = *(_OWORD *)(v14 + 48);
      long long v37 = *(_OWORD *)(v14 + 32);
      long long v38 = v18;
      long long v19 = v15[11];
      long long v33 = v15[10];
      long long v34 = v19;
      long long v20 = v15[13];
      long long v35 = v15[12];
      long long v36 = v20;
      long long v21 = v15[7];
      long long v29 = v15[6];
      long long v30 = v21;
      long long v22 = v15[9];
      long long v31 = v15[8];
      long long v32 = v22;
      long long v23 = v15[3];
      long long v25 = v15[2];
      long long v26 = v23;
      long long v24 = v15[5];
      long long v27 = v15[4];
      long long v28 = v24;
      v16();
      uint64_t v4 = *(void *)(a1 + 48);
    }
  }
  if (*(unsigned char *)(*(void *)(v4 + 8) + 24)) {
    *a3 = 1;
  }
}

- (void)adjustGeometry:(PXTileGeometry *)a3 forContentTileWithIndexPath:(PXSimpleIndexPath *)a4
{
  v6 = [(PXAssetsTilingLayout *)self hiddenIndexPaths];
  long long v7 = *(_OWORD *)&a4->item;
  v8[0] = *(_OWORD *)&a4->dataSourceIdentifier;
  v8[1] = v7;
  if ([v6 containsIndexPath:v8]) {
    a3->hidden = 1;
  }
}

- (void)setFocusedIndexPath:(PXSimpleIndexPath *)a3
{
  int64x2_t v3 = *(int64x2_t *)&self->_focusedIndexPath.dataSourceIdentifier;
  int64x2_t v4 = *(int64x2_t *)&self->_focusedIndexPath.item;
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64(*(int64x2_t *)&a3->dataSourceIdentifier, v3), (int32x4_t)vceqq_s64(*(int64x2_t *)&a3->item, v4))), 0xFuLL))) & 1) == 0)
  {
    long long v7 = *(_OWORD *)&a3->item;
    *(_OWORD *)&self->_focusedIndexPath.int64_t dataSourceIdentifier = *(_OWORD *)&a3->dataSourceIdentifier;
    *(_OWORD *)&self->_focusedIndexPath.int64_t item = v7;
    int64x2_t v18 = v4;
    int64x2_t v19 = v3;
    uint64_t v8 = objc_alloc_init(PXTilingLayoutInvalidationContext);
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)off_1E5DAAED8;
    if (v19.i64[0] != *(void *)off_1E5DAAED8
      && v18.i64[0] != 0x7FFFFFFFFFFFFFFFLL
      && v18.i64[1] == 0x7FFFFFFFFFFFFFFFLL)
    {
      long long v20 = xmmword_1AB359AB0;
      int64x2_t v21 = v19;
      int64_t v22 = v18.i64[0];
      uint64_t v23 = 0x7FFFFFFFFFFFFFFFLL;
      long long v24 = 0u;
      long long v25 = 0u;
      uint64_t v26 = 0;
      [(PXTilingLayoutInvalidationContext *)v8 invalidateTileWithIdentifier:&v20];
    }
    int64_t dataSourceIdentifier = a3->dataSourceIdentifier;
    int64_t item = a3->item;
    if (a3->dataSourceIdentifier != v10 && item != 0x7FFFFFFFFFFFFFFFLL && a3->subitem == 0x7FFFFFFFFFFFFFFFLL)
    {
      int64_t section = a3->section;
      long long v20 = xmmword_1AB359AB0;
      v21.i64[0] = dataSourceIdentifier;
      v21.i64[1] = section;
      int64_t v22 = item;
      uint64_t v23 = 0x7FFFFFFFFFFFFFFFLL;
      long long v24 = 0u;
      long long v25 = 0u;
      uint64_t v26 = 0;
      [(PXTilingLayoutInvalidationContext *)v9 invalidateTileWithIdentifier:&v20];
    }
    -[PXTilingLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v9, v18.i64[0]);
  }
}

- (void)setHighlightedIndexPath:(PXSimpleIndexPath *)a3
{
  int64x2_t v3 = *(int64x2_t *)&self->_highlightedIndexPath.dataSourceIdentifier;
  int64x2_t v4 = *(int64x2_t *)&self->_highlightedIndexPath.item;
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64(*(int64x2_t *)&a3->dataSourceIdentifier, v3), (int32x4_t)vceqq_s64(*(int64x2_t *)&a3->item, v4))), 0xFuLL))) & 1) == 0)
  {
    long long v7 = *(_OWORD *)&a3->item;
    *(_OWORD *)&self->_highlightedIndexPath.int64_t dataSourceIdentifier = *(_OWORD *)&a3->dataSourceIdentifier;
    *(_OWORD *)&self->_highlightedIndexPath.int64_t item = v7;
    int64x2_t v18 = v4;
    int64x2_t v19 = v3;
    uint64_t v8 = objc_alloc_init(PXTilingLayoutInvalidationContext);
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)off_1E5DAAED8;
    if (v19.i64[0] != *(void *)off_1E5DAAED8
      && v18.i64[0] != 0x7FFFFFFFFFFFFFFFLL
      && v18.i64[1] == 0x7FFFFFFFFFFFFFFFLL)
    {
      long long v20 = xmmword_1AB359AB0;
      int64x2_t v21 = v19;
      int64_t v22 = v18.i64[0];
      uint64_t v23 = 0x7FFFFFFFFFFFFFFFLL;
      long long v24 = 0u;
      long long v25 = 0u;
      uint64_t v26 = 0;
      [(PXTilingLayoutInvalidationContext *)v8 invalidateTileWithIdentifier:&v20];
    }
    int64_t dataSourceIdentifier = a3->dataSourceIdentifier;
    int64_t item = a3->item;
    if (a3->dataSourceIdentifier != v10 && item != 0x7FFFFFFFFFFFFFFFLL && a3->subitem == 0x7FFFFFFFFFFFFFFFLL)
    {
      int64_t section = a3->section;
      long long v20 = xmmword_1AB359AB0;
      v21.i64[0] = dataSourceIdentifier;
      v21.i64[1] = section;
      int64_t v22 = item;
      uint64_t v23 = 0x7FFFFFFFFFFFFFFFLL;
      long long v24 = 0u;
      long long v25 = 0u;
      uint64_t v26 = 0;
      [(PXTilingLayoutInvalidationContext *)v9 invalidateTileWithIdentifier:&v20];
    }
    -[PXTilingLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v9, v18.i64[0]);
  }
}

- (void)setAnimatedOverlayBehavior:(unint64_t)a3
{
  if (self->_animatedOverlayBehavior != a3)
  {
    self->_animatedOverlayBehavior = a3;
    [(PXAssetsTilingLayout *)self _invalidateAllAnimatedOverlayTiles];
  }
}

- (void)setDraggingIndexPaths:(id)a3
{
  double v5 = (PXIndexPathSet *)a3;
  if (self->_draggingIndexPaths != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_draggingIndexPaths, a3);
    [(PXAssetsTilingLayout *)self _invalidateAllSelectionTiles];
    double v5 = v6;
  }
}

- (void)setSelectedIndexPaths:(id)a3
{
  double v5 = (PXIndexPathSet *)a3;
  if (self->_selectedIndexPaths != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_selectedIndexPaths, a3);
    [(PXAssetsTilingLayout *)self _invalidateAllSelectionTiles];
    double v5 = v6;
  }
}

- (void)setSelectionBadgeOptions:(unint64_t)a3
{
  if (self->_selectionBadgeOptions != a3)
  {
    self->_selectionBadgeOptions = a3;
    [(PXAssetsTilingLayout *)self _invalidateAllSelectionTiles];
  }
}

- (void)setHiddenIndexPaths:(id)a3
{
  v6 = (PXIndexPathSet *)a3;
  hiddenIndexPaths = self->_hiddenIndexPaths;
  if (hiddenIndexPaths != v6 && ([(PXIndexPathSet *)hiddenIndexPaths isEqual:v6] & 1) == 0)
  {
    uint64_t v8 = objc_alloc_init(PXTilingLayoutInvalidationContext);
    uint64_t v9 = self->_hiddenIndexPaths;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __44__PXAssetsTilingLayout_setHiddenIndexPaths___block_invoke;
    v19[3] = &unk_1E5DCC248;
    uint64_t v10 = v8;
    long long v20 = v10;
    [(PXIndexPathSet *)v9 enumerateAllIndexPathsUsingBlock:v19];
    objc_storeStrong((id *)&self->_hiddenIndexPaths, a3);
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    uint64_t v14 = __44__PXAssetsTilingLayout_setHiddenIndexPaths___block_invoke_2;
    id v15 = &unk_1E5DCC270;
    long long v17 = v10;
    SEL v18 = a2;
    unint64_t v16 = self;
    uint64_t v11 = v10;
    [(PXIndexPathSet *)v6 enumerateAllIndexPathsUsingBlock:&v12];
    -[PXTilingLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v11, v12, v13, v14, v15, v16);
  }
}

uint64_t __44__PXAssetsTilingLayout_setHiddenIndexPaths___block_invoke(uint64_t a1, long long *a2)
{
  int64x2_t v4 = *(void **)(a1 + 32);
  long long v5 = *a2;
  long long v6 = a2[1];
  long long v17 = xmmword_1AB359AB0;
  long long v18 = v5;
  long long v19 = v6;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v22 = 0;
  [v4 invalidateTileWithIdentifier:&v17];
  long long v7 = *(void **)(a1 + 32);
  long long v8 = *a2;
  long long v9 = a2[1];
  long long v17 = xmmword_1AB35A0B0;
  long long v18 = v8;
  long long v19 = v9;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v22 = 0;
  [v7 invalidateTileWithIdentifier:&v17];
  uint64_t v10 = *(void **)(a1 + 32);
  long long v11 = *a2;
  long long v12 = a2[1];
  long long v17 = xmmword_1AB35A0A0;
  long long v18 = v11;
  long long v19 = v12;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v22 = 0;
  [v10 invalidateTileWithIdentifier:&v17];
  uint64_t v13 = *(void **)(a1 + 32);
  long long v14 = *a2;
  long long v15 = a2[1];
  long long v17 = xmmword_1AB35A090;
  long long v18 = v14;
  long long v19 = v15;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v22 = 0;
  return [v13 invalidateTileWithIdentifier:&v17];
}

uint64_t __44__PXAssetsTilingLayout_setHiddenIndexPaths___block_invoke_2(uint64_t a1, long long *a2)
{
  int64x2_t v4 = *(void **)(a1 + 40);
  long long v5 = *a2;
  long long v6 = a2[1];
  long long v17 = xmmword_1AB359AB0;
  long long v18 = v5;
  long long v19 = v6;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v22 = 0;
  [v4 invalidateTileWithIdentifier:&v17];
  long long v7 = *(void **)(a1 + 40);
  long long v8 = *a2;
  long long v9 = a2[1];
  long long v17 = xmmword_1AB35A0B0;
  long long v18 = v8;
  long long v19 = v9;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v22 = 0;
  [v7 invalidateTileWithIdentifier:&v17];
  uint64_t v10 = *(void **)(a1 + 40);
  long long v11 = *a2;
  long long v12 = a2[1];
  long long v17 = xmmword_1AB35A0A0;
  long long v18 = v11;
  long long v19 = v12;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v22 = 0;
  [v10 invalidateTileWithIdentifier:&v17];
  uint64_t v13 = *(void **)(a1 + 40);
  long long v14 = *a2;
  long long v15 = a2[1];
  long long v17 = xmmword_1AB35A090;
  long long v18 = v14;
  long long v19 = v15;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v22 = 0;
  return [v13 invalidateTileWithIdentifier:&v17];
}

- (CGSize)_preferredSelectionBadgeSize
{
  +[PXSelectionBadgeUIViewTile preferredSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setBadgeOptions:(unint64_t)a3
{
  if (self->_badgeOptions != a3)
  {
    self->_badgeOptions = a3;
    int64x2_t v4 = objc_alloc_init(PXOverlayBadgeTileUserData);
    overlayBadgeTileUserData = self->_overlayBadgeTileUserData;
    self->_overlayBadgeTileUserData = v4;

    [(PXOverlayBadgeTileUserData *)self->_overlayBadgeTileUserData setBadgeOptions:[(PXAssetsTilingLayout *)self badgeOptions]];
    long long v6 = objc_alloc_init(PXTilingLayoutInvalidationContext);
    [(PXTilingLayoutInvalidationContext *)v6 invalidateAllTiles];
    [(PXTilingLayout *)self invalidateLayoutWithContext:v6];
  }
}

- (PXAssetsTilingLayout)init
{
  int64x2_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  long long v5 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, self, @"PXAssetsTilingLayout.m", 88, @"%@ is not available", v5 object file lineNumber description];

  abort();
}

- (PXAssetsTilingLayout)initWithDataSource:(id)a3
{
  id v5 = a3;
  v28.receiver = self;
  v28.super_class = (Class)PXAssetsTilingLayout;
  long long v6 = [(PXTilingLayout *)&v28 init];
  long long v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dataSource, a3);
    long long v8 = objc_alloc_init(PXSelectionBadgeTileUserData);
    unselectedUserData = v7->__unselectedUserData;
    v7->__unselectedUserData = v8;

    uint64_t v10 = objc_alloc_init(PXSelectionBadgeTileUserData);
    selectedUserData = v7->__selectedUserData;
    v7->__selectedUserData = v10;

    [(PXSelectionBadgeTileUserData *)v7->__selectedUserData setSelected:1];
    id v12 = objc_alloc_init((Class)off_1E5DA9858);
    uint64_t v13 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    long long v14 = [v13 colorWithAlphaComponent:0.25];
    [v12 setBackgroundColor:v14];

    uint64_t v15 = +[PXBasicTileUserData userDataWithViewSpec:v12];
    selectedDimmingUserData = v7->__selectedDimmingUserData;
    v7->__selectedDimmingUserData = (PXBasicTileUserData *)v15;

    id v17 = objc_alloc_init((Class)off_1E5DA9858);
    long long v18 = [MEMORY[0x1E4FB1618] labelColor];
    long long v19 = [v18 colorWithAlphaComponent:0.4];
    [v17 setBackgroundColor:v19];

    uint64_t v20 = +[PXBasicTileUserData userDataWithViewSpec:v17];
    highlightedDimmingUserData = v7->__highlightedDimmingUserData;
    v7->__highlightedDimmingUserData = (PXBasicTileUserData *)v20;

    id v22 = objc_alloc_init((Class)off_1E5DA9858);
    uint64_t v23 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    long long v24 = [v23 colorWithAlphaComponent:0.5];
    [v22 setBackgroundColor:v24];

    uint64_t v25 = +[PXBasicTileUserData userDataWithViewSpec:v22];
    draggingDimmingUserData = v7->__draggingDimmingUserData;
    v7->__draggingDimmingUserData = (PXBasicTileUserData *)v25;

    v7->_animatedOverlayBehavior = 0;
  }

  return v7;
}

@end