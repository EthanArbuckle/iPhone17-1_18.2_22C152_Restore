@interface PXCMMEngineDrivenLayout
+ (id)_additionalTileKinds;
- (BOOL)_getAdditionalTileIdentifierForEditorial:(PXTileIdentifier *)a3 group:(unint64_t *)a4 layoutGeometryKind:(int64_t)a5 indexPath:(PXSimpleIndexPath *)a6;
- (BOOL)_getAdditionalTileIdentifierForGrid:(PXTileIdentifier *)a3 group:(unint64_t *)a4 layoutGeometryKind:(int64_t)a5 indexPath:(PXSimpleIndexPath *)a6;
- (BOOL)_getAssetStatusTileIdentifier:(PXTileIdentifier *)a3 outGeometry:(PXTileGeometry *)a4 group:(unint64_t *)a5 userData:(id *)a6 forContentTileGeometry:(const PXTileGeometry *)a7 indexPath:(PXSimpleIndexPath *)a8;
- (BOOL)_getDuplicateTileIdentifier:(PXTileIdentifier *)a3 outGeometry:(PXTileGeometry *)a4 group:(unint64_t *)a5 userData:(id *)a6 forContentTileGeometry:(const PXTileGeometry *)a7 indexPath:(PXSimpleIndexPath *)a8;
- (BOOL)getAdditionalAccessoryTileIdentifier:(PXTileIdentifier *)a3 outGeometry:(PXTileGeometry *)a4 group:(unint64_t *)a5 userData:(id *)a6 forTileKind:(unint64_t)a7 contentTileGeometry:(const PXTileGeometry *)a8 indexPath:(PXSimpleIndexPath *)a9;
- (BOOL)getAdditionalTileIdentifier:(PXTileIdentifier *)a3 group:(unint64_t *)a4 layoutGeometryKind:(unint64_t)a5 indexPath:(PXSimpleIndexPath *)a6;
- (BOOL)getGeometry:(PXTileGeometry *)a3 group:(unint64_t *)a4 userData:(id *)a5 forTileWithIdentifier:(PXTileIdentifier *)a6;
- (BOOL)hasFloatingBanner;
- (BOOL)hasFloatingSectionHeaders;
- (BOOL)headerViewIsVisible;
- (CGRect)_bannerFrame;
- (CGRect)_headerFrame;
- (CGRect)_placeholderFrame;
- (CGRect)_sectionHeaderTileFrame;
- (CGRect)_statusFooterFrame;
- (CGRect)contentBounds;
- (CGSize)_preferredSelectionBadgeSize;
- (PXCMMAssetStatusBadgeTileUserData)_copiedUserData;
- (PXCMMAssetStatusBadgeTileUserData)_failedUserData;
- (PXCMMEngineDrivenLayout)initWithDataSource:(id)a3;
- (PXCMMEngineDrivenLayout)initWithLayoutEngineSnapshot:(id)a3;
- (PXCMMEngineDrivenLayout)initWithLayoutEngineSnapshot:(id)a3 configuration:(id)a4;
- (PXTileIdentifier)_bannerTileIdentifier;
- (PXTileIdentifier)_headerTileIdentifier;
- (PXTileIdentifier)_identifierForUniqueTileWithKind:(SEL)a3;
- (PXTileIdentifier)_placeholderTileIdentifier;
- (PXTileIdentifier)_statusFooterTileIdentifier;
- (UIEdgeInsets)reviewSafeAreaInsets;
- (double)bannerHeight;
- (double)footerBottomInset;
- (double)headerFooterSideInset;
- (double)headerHeight;
- (double)headerTopInset;
- (double)statusFooterHeight;
- (double)zPositionOffsetForKind:(unint64_t)a3;
- (int64_t)layoutType;
- (int64_t)placeholderMode;
- (unint64_t)_editorialGeneratorGeometryKindForTileKind:(unint64_t)a3;
- (unint64_t)_generatorGeometryKindForTileKind:(unint64_t)a3;
- (unint64_t)_gridGeneratorGeometryKindForTileKind:(unint64_t)a3;
- (void)_invalidateAssetStatusBadgeTiles;
- (void)_invalidateBanner;
- (void)_invalidateHeader;
- (void)_invalidateSectionHeaders;
- (void)_invalidateStatusFooter;
- (void)adjustGeometry:(PXTileGeometry *)a3 forAdditionalTileWithKind:(unint64_t)a4 indexPath:(PXSimpleIndexPath *)a5;
- (void)enumerateTilesInRect:(CGRect)a3 withOptions:(id)a4 usingBlock:(id)a5;
- (void)setFooterBottomInset:(double)a3;
- (void)setHasFloatingBanner:(BOOL)a3;
- (void)setHasFloatingSectionHeaders:(BOOL)a3;
- (void)setHeaderFooterSideInset:(double)a3;
- (void)setHeaderTopInset:(double)a3;
- (void)setHeaderViewIsVisible:(BOOL)a3;
- (void)setPlaceholderMode:(int64_t)a3;
- (void)setReviewSafeAreaInsets:(UIEdgeInsets)a3;
- (void)setVisibleOrigin:(CGPoint)a3;
@end

@implementation PXCMMEngineDrivenLayout

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__failedUserData, 0);
  objc_storeStrong((id *)&self->__copiedUserData, 0);
}

- (PXCMMAssetStatusBadgeTileUserData)_failedUserData
{
  return self->__failedUserData;
}

- (PXCMMAssetStatusBadgeTileUserData)_copiedUserData
{
  return self->__copiedUserData;
}

- (UIEdgeInsets)reviewSafeAreaInsets
{
  double top = self->_reviewSafeAreaInsets.top;
  double left = self->_reviewSafeAreaInsets.left;
  double bottom = self->_reviewSafeAreaInsets.bottom;
  double right = self->_reviewSafeAreaInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (double)headerFooterSideInset
{
  return self->_headerFooterSideInset;
}

- (double)footerBottomInset
{
  return self->_footerBottomInset;
}

- (double)headerTopInset
{
  return self->_headerTopInset;
}

- (BOOL)hasFloatingSectionHeaders
{
  return self->_hasFloatingSectionHeaders;
}

- (BOOL)hasFloatingBanner
{
  return self->_hasFloatingBanner;
}

- (void)setHeaderViewIsVisible:(BOOL)a3
{
  self->_headerViewIsVisible = a3;
}

- (int64_t)placeholderMode
{
  return self->_placeholderMode;
}

- (double)statusFooterHeight
{
  return self->_statusFooterHeight;
}

- (double)bannerHeight
{
  return self->_bannerHeight;
}

- (double)headerHeight
{
  return self->_headerHeight;
}

- (int64_t)layoutType
{
  return self->_layoutType;
}

- (void)adjustGeometry:(PXTileGeometry *)a3 forAdditionalTileWithKind:(unint64_t)a4 indexPath:(PXSimpleIndexPath *)a5
{
  int64_t v9 = [(PXCMMEngineDrivenLayout *)self layoutType];
  if ((unint64_t)(v9 - 2) >= 3)
  {
    if (v9 == 1)
    {
      if (a4 != 1) {
        return;
      }
      goto LABEL_5;
    }
    if (v9) {
      return;
    }
  }
  if (a4 != 2) {
    return;
  }
LABEL_5:
  double y = a3->frame.origin.y;
  if ([(PXCMMEngineDrivenLayout *)self hasFloatingSectionHeaders])
  {
    [(PXTilingLayout *)self contentInset];
    double v12 = v11;
    [(PXTilingLayout *)self visibleOrigin];
    if (v12 + v13 > y)
    {
      a3->zPosition = 40.0;
      [(PXTilingLayout *)self contentInset];
      double v15 = v14;
      [(PXTilingLayout *)self visibleOrigin];
      double v17 = v15 + v16 - y;
      a3->center.double y = a3->center.y + v17;
      a3->frame.origin.double y = a3->frame.origin.y + v17;
      uint64_t v18 = objc_msgSend(MEMORY[0x1E4F28D58], "px_indexPathForItem:inSection:withKind:", 0, a5->section + 1, a4);
      v19 = [(PXEngineDrivenAssetsTilingLayout *)self layoutSnapshot];
      v20 = v19;
      if (v19) {
        [v19 geometryForItem:v18];
      }

      [(PXTilingLayout *)self coordinateSpaceIdentifier];
      PXRectWithCenterAndSize();
    }
  }
}

- (BOOL)_getAdditionalTileIdentifierForEditorial:(PXTileIdentifier *)a3 group:(unint64_t *)a4 layoutGeometryKind:(int64_t)a5 indexPath:(PXSimpleIndexPath *)a6
{
  if (a5 != 1) {
    PXAssertGetLog();
  }
  long long v6 = *(_OWORD *)&a6->dataSourceIdentifier;
  long long v7 = *(_OWORD *)&a6->item;
  *(_OWORD *)&a3->length = xmmword_1AB359C00;
  *(_OWORD *)&a3->index[1] = v6;
  *(_OWORD *)&a3->index[3] = v7;
  *(_OWORD *)&a3->index[5] = 0u;
  *(_OWORD *)&a3->index[7] = 0u;
  a3->index[9] = 0;
  *a4 = 42;
  return 1;
}

- (BOOL)_getAdditionalTileIdentifierForGrid:(PXTileIdentifier *)a3 group:(unint64_t *)a4 layoutGeometryKind:(int64_t)a5 indexPath:(PXSimpleIndexPath *)a6
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  unint64_t v6 = 8439962;
  if (a5 == 1)
  {
    unint64_t v7 = 0;
  }
  else
  {
    if (a5 != 2) {
      PXAssertGetLog();
    }
    unint64_t v6 = 8439963;
    unint64_t v7 = 42;
  }
  long long v8 = *(_OWORD *)&a6->dataSourceIdentifier;
  long long v9 = *(_OWORD *)&a6->item;
  a3->length = 5;
  a3->index[0] = v6;
  *(_OWORD *)&a3->index[1] = v8;
  *(_OWORD *)&a3->index[3] = v9;
  *(_OWORD *)&a3->index[5] = 0u;
  *(_OWORD *)&a3->index[7] = 0u;
  a3->index[9] = 0;
  *a4 = v7;
  return 1;
}

- (BOOL)getAdditionalTileIdentifier:(PXTileIdentifier *)a3 group:(unint64_t *)a4 layoutGeometryKind:(unint64_t)a5 indexPath:(PXSimpleIndexPath *)a6
{
  int64_t v11 = [(PXCMMEngineDrivenLayout *)self layoutType];
  if ((unint64_t)(v11 - 2) < 3 || v11 == 0)
  {
    long long v13 = *(_OWORD *)&a6->item;
    long long v16 = *(_OWORD *)&a6->dataSourceIdentifier;
    long long v17 = v13;
    return [(PXCMMEngineDrivenLayout *)self _getAdditionalTileIdentifierForGrid:a3 group:a4 layoutGeometryKind:a5 indexPath:&v16];
  }
  else if (v11 == 1)
  {
    long long v15 = *(_OWORD *)&a6->item;
    long long v16 = *(_OWORD *)&a6->dataSourceIdentifier;
    long long v17 = v15;
    return [(PXCMMEngineDrivenLayout *)self _getAdditionalTileIdentifierForEditorial:a3 group:a4 layoutGeometryKind:a5 indexPath:&v16];
  }
  else
  {
    return 0;
  }
}

- (double)zPositionOffsetForKind:(unint64_t)a3
{
  if (a3 == 8439952) {
    return 35.0;
  }
  if (a3 == 8439964) {
    return 30.0;
  }
  v4.receiver = self;
  v4.super_class = (Class)PXCMMEngineDrivenLayout;
  -[PXAssetsTilingLayout zPositionOffsetForKind:](&v4, sel_zPositionOffsetForKind_);
  return result;
}

- (BOOL)_getAssetStatusTileIdentifier:(PXTileIdentifier *)a3 outGeometry:(PXTileGeometry *)a4 group:(unint64_t *)a5 userData:(id *)a6 forContentTileGeometry:(const PXTileGeometry *)a7 indexPath:(PXSimpleIndexPath *)a8
{
  if (!a7->hidden)
  {
    double v12 = [(PXEngineDrivenAssetsTilingLayout *)self delegate];
    long long v13 = *(_OWORD *)&a8->item;
    v18[0] = *(_OWORD *)&a8->dataSourceIdentifier;
    v18[1] = v13;
    int v14 = [v12 engineDrivenLayout:self shouldShowStatusBadgeAtIndexPath:v18];

    if (v14)
    {
      long long v15 = *(_OWORD *)&a8->dataSourceIdentifier;
      long long v16 = *(_OWORD *)&a8->item;
      *(_OWORD *)&a3->length = xmmword_1AB359C10;
      *(_OWORD *)&a3->index[1] = v15;
      *(_OWORD *)&a3->index[3] = v16;
      *(_OWORD *)&a3->index[5] = 0u;
      *(_OWORD *)&a3->index[7] = 0u;
      a3->index[9] = 0;
      [(PXCMMEngineDrivenLayout *)self _preferredSelectionBadgeSize];
      CGRectGetMaxX(a7->frame);
      CGRectGetMaxY(a7->frame);
      [(PXTilingLayout *)self coordinateSpaceIdentifier];
      PXRectGetCenter();
    }
  }
  return 0;
}

- (BOOL)_getDuplicateTileIdentifier:(PXTileIdentifier *)a3 outGeometry:(PXTileGeometry *)a4 group:(unint64_t *)a5 userData:(id *)a6 forContentTileGeometry:(const PXTileGeometry *)a7 indexPath:(PXSimpleIndexPath *)a8
{
  if (a7->hidden) {
    return 0;
  }
  long long v15 = [(PXEngineDrivenAssetsTilingLayout *)self delegate];
  long long v16 = *(_OWORD *)&a8->item;
  v32[0] = *(_OWORD *)&a8->dataSourceIdentifier;
  v32[1] = v16;
  int v17 = [v15 engineDrivenLayout:self shouldShowDimmingOverlayAtIndexPath:v32];

  if (!v17) {
    return 0;
  }
  long long v18 = *(_OWORD *)&a8->dataSourceIdentifier;
  long long v19 = *(_OWORD *)&a8->item;
  *(_OWORD *)&a3->length = xmmword_1AB359C20;
  *(_OWORD *)&a3->index[1] = v18;
  *(_OWORD *)&a3->index[3] = v19;
  *(_OWORD *)&a3->index[5] = 0u;
  *(_OWORD *)&a3->index[7] = 0u;
  a3->index[9] = 0;
  CGPoint origin = a7->frame.origin;
  CGSize size = a7->frame.size;
  CGSize v22 = a7->size;
  a4->center = a7->center;
  a4->CGSize size = v22;
  a4->frame.CGPoint origin = origin;
  a4->frame.CGSize size = size;
  long long v23 = *(_OWORD *)&a7->transform.a;
  long long v24 = *(_OWORD *)&a7->transform.c;
  long long v25 = *(_OWORD *)&a7->alpha;
  *(_OWORD *)&a4->transform.tx = *(_OWORD *)&a7->transform.tx;
  *(_OWORD *)&a4->alpha = v25;
  *(_OWORD *)&a4->transform.a = v23;
  *(_OWORD *)&a4->transform.c = v24;
  long long v26 = *(_OWORD *)&a7->hidden;
  long long v27 = *(_OWORD *)&a7->contentSize.height;
  long long v28 = *(_OWORD *)&a7->contentsRect.size.height;
  *(_OWORD *)&a4->contentsRect.origin.double y = *(_OWORD *)&a7->contentsRect.origin.y;
  *(_OWORD *)&a4->contentsRect.size.height = v28;
  *(_OWORD *)&a4->hidden = v26;
  *(_OWORD *)&a4->contentSize.height = v27;
  double zPosition = a7->zPosition;
  [(PXCMMEngineDrivenLayout *)self zPositionOffsetForKind:8439952];
  a4->double zPosition = zPosition + v30;
  if (a5) {
    *a5 = 0;
  }
  if (a6) {
    *a6 = 0;
  }
  return 1;
}

- (BOOL)getAdditionalAccessoryTileIdentifier:(PXTileIdentifier *)a3 outGeometry:(PXTileGeometry *)a4 group:(unint64_t *)a5 userData:(id *)a6 forTileKind:(unint64_t)a7 contentTileGeometry:(const PXTileGeometry *)a8 indexPath:(PXSimpleIndexPath *)a9
{
  if (a7 == 8439964)
  {
    long long v11 = *(_OWORD *)&a9->item;
    long long v12 = *(_OWORD *)&a9->dataSourceIdentifier;
    long long v13 = v11;
    return [(PXCMMEngineDrivenLayout *)self _getAssetStatusTileIdentifier:a3 outGeometry:a4 group:a5 userData:a6 forContentTileGeometry:a8 indexPath:&v12];
  }
  else if (a7 == 8439952)
  {
    long long v9 = *(_OWORD *)&a9->item;
    long long v12 = *(_OWORD *)&a9->dataSourceIdentifier;
    long long v13 = v9;
    return [(PXCMMEngineDrivenLayout *)self _getDuplicateTileIdentifier:a3 outGeometry:a4 group:a5 userData:a6 forContentTileGeometry:a8 indexPath:&v12];
  }
  else
  {
    return 0;
  }
}

- (CGSize)_preferredSelectionBadgeSize
{
  +[PXCMMAssetStatusBadgeView preferredSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (unint64_t)_editorialGeneratorGeometryKindForTileKind:(unint64_t)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (a3 == 8439963) {
    return 1;
  }
  v5 = PLUIGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v6 = 134217984;
    unint64_t v7 = a3;
    _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_ERROR, "Unrecognized grid geometry tile kind: %lu", (uint8_t *)&v6, 0xCu);
  }

  return -1;
}

- (unint64_t)_gridGeneratorGeometryKindForTileKind:(unint64_t)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (a3 == 8439963) {
    return 2;
  }
  if (a3 == 8439962) {
    return 1;
  }
  v5 = PLUIGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v6 = 134217984;
    unint64_t v7 = a3;
    _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_ERROR, "Unrecognized grid geometry tile kind: %lu", (uint8_t *)&v6, 0xCu);
  }

  return -1;
}

- (unint64_t)_generatorGeometryKindForTileKind:(unint64_t)a3
{
  int64_t v5 = [(PXCMMEngineDrivenLayout *)self layoutType];
  if ((unint64_t)(v5 - 2) < 3 || v5 == 0)
  {
    return [(PXCMMEngineDrivenLayout *)self _gridGeneratorGeometryKindForTileKind:a3];
  }
  else if (v5 == 1)
  {
    return [(PXCMMEngineDrivenLayout *)self _editorialGeneratorGeometryKindForTileKind:a3];
  }
  else
  {
    return -1;
  }
}

- (void)enumerateTilesInRect:(CGRect)a3 withOptions:(id)a4 usingBlock:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = a4;
  long long v12 = a5;
  unsigned __int8 v101 = 0;
  [(PXCMMEngineDrivenLayout *)self _headerFrame];
  v106.origin.double x = v13;
  v106.origin.double y = v14;
  v106.size.double width = v15;
  v106.size.double height = v16;
  v102.origin.double x = x;
  v102.origin.double y = y;
  v102.size.double width = width;
  v102.size.double height = height;
  if (!CGRectIntersectsRect(v102, v106)) {
    goto LABEL_5;
  }
  long long v17 = *((_OWORD *)off_1E5DAB048 + 9);
  long long v97 = *((_OWORD *)off_1E5DAB048 + 8);
  long long v98 = v17;
  long long v18 = *((_OWORD *)off_1E5DAB048 + 11);
  long long v99 = *((_OWORD *)off_1E5DAB048 + 10);
  long long v100 = v18;
  long long v19 = *((_OWORD *)off_1E5DAB048 + 5);
  long long v93 = *((_OWORD *)off_1E5DAB048 + 4);
  long long v94 = v19;
  long long v20 = *((_OWORD *)off_1E5DAB048 + 7);
  long long v95 = *((_OWORD *)off_1E5DAB048 + 6);
  long long v96 = v20;
  long long v21 = *((_OWORD *)off_1E5DAB048 + 1);
  long long v89 = *(_OWORD *)off_1E5DAB048;
  long long v90 = v21;
  long long v22 = *((_OWORD *)off_1E5DAB048 + 3);
  long long v91 = *((_OWORD *)off_1E5DAB048 + 2);
  long long v92 = v22;
  uint64_t v87 = 0;
  uint64_t v88 = 0;
  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  long long v82 = 0u;
  [(PXCMMEngineDrivenLayout *)self _headerTileIdentifier];
  uint64_t v81 = 0;
  long long v65 = v84;
  long long v66 = v85;
  long long v67 = v86;
  *(void *)&long long v68 = v87;
  long long v63 = v82;
  long long v64 = v83;
  if ([(PXCMMEngineDrivenLayout *)self getGeometry:&v89 group:&v88 userData:&v81 forTileWithIdentifier:&v63])
  {
    long long v23 = (void (*)(void *, long long *, long long *, uint64_t, uint64_t, unsigned __int8 *))v12[2];
    long long v77 = v84;
    long long v78 = v85;
    long long v79 = v86;
    uint64_t v80 = v87;
    long long v75 = v82;
    long long v76 = v83;
    long long v71 = v97;
    long long v72 = v98;
    long long v73 = v99;
    long long v74 = v100;
    long long v67 = v93;
    long long v68 = v94;
    long long v69 = v95;
    long long v70 = v96;
    long long v63 = v89;
    long long v64 = v90;
    long long v65 = v91;
    long long v66 = v92;
    v23(v12, &v75, &v63, v88, v81, &v101);
  }
  if (!v101)
  {
LABEL_5:
    [(PXCMMEngineDrivenLayout *)self _bannerFrame];
    v107.origin.double x = v24;
    v107.origin.double y = v25;
    v107.size.double width = v26;
    v107.size.double height = v27;
    v103.origin.double x = x;
    v103.origin.double y = y;
    v103.size.double width = width;
    v103.size.double height = height;
    if (CGRectIntersectsRect(v103, v107))
    {
      long long v28 = *((_OWORD *)off_1E5DAB048 + 9);
      long long v97 = *((_OWORD *)off_1E5DAB048 + 8);
      long long v98 = v28;
      long long v29 = *((_OWORD *)off_1E5DAB048 + 11);
      long long v99 = *((_OWORD *)off_1E5DAB048 + 10);
      long long v100 = v29;
      long long v30 = *((_OWORD *)off_1E5DAB048 + 5);
      long long v93 = *((_OWORD *)off_1E5DAB048 + 4);
      long long v94 = v30;
      long long v31 = *((_OWORD *)off_1E5DAB048 + 7);
      long long v95 = *((_OWORD *)off_1E5DAB048 + 6);
      long long v96 = v31;
      long long v32 = *((_OWORD *)off_1E5DAB048 + 1);
      long long v89 = *(_OWORD *)off_1E5DAB048;
      long long v90 = v32;
      long long v33 = *((_OWORD *)off_1E5DAB048 + 3);
      long long v91 = *((_OWORD *)off_1E5DAB048 + 2);
      long long v92 = v33;
      uint64_t v87 = 0;
      uint64_t v88 = 0;
      long long v85 = 0u;
      long long v86 = 0u;
      long long v83 = 0u;
      long long v84 = 0u;
      long long v82 = 0u;
      [(PXCMMEngineDrivenLayout *)self _bannerTileIdentifier];
      uint64_t v62 = 0;
      long long v65 = v84;
      long long v66 = v85;
      long long v67 = v86;
      *(void *)&long long v68 = v87;
      long long v63 = v82;
      long long v64 = v83;
      if ([(PXCMMEngineDrivenLayout *)self getGeometry:&v89 group:&v88 userData:&v62 forTileWithIdentifier:&v63])
      {
        v34 = (void (*)(void *, long long *, long long *, uint64_t, uint64_t, unsigned __int8 *))v12[2];
        long long v77 = v84;
        long long v78 = v85;
        long long v79 = v86;
        uint64_t v80 = v87;
        long long v75 = v82;
        long long v76 = v83;
        long long v71 = v97;
        long long v72 = v98;
        long long v73 = v99;
        long long v74 = v100;
        long long v67 = v93;
        long long v68 = v94;
        long long v69 = v95;
        long long v70 = v96;
        long long v63 = v89;
        long long v64 = v90;
        long long v65 = v91;
        long long v66 = v92;
        v34(v12, &v75, &v63, v88, v62, &v101);
      }
    }
    if (!v101)
    {
      [(PXCMMEngineDrivenLayout *)self _statusFooterFrame];
      v108.origin.double x = v35;
      v108.origin.double y = v36;
      v108.size.double width = v37;
      v108.size.double height = v38;
      v104.origin.double x = x;
      v104.origin.double y = y;
      v104.size.double width = width;
      v104.size.double height = height;
      if (CGRectIntersectsRect(v104, v108))
      {
        long long v39 = *((_OWORD *)off_1E5DAB048 + 9);
        long long v97 = *((_OWORD *)off_1E5DAB048 + 8);
        long long v98 = v39;
        long long v40 = *((_OWORD *)off_1E5DAB048 + 11);
        long long v99 = *((_OWORD *)off_1E5DAB048 + 10);
        long long v100 = v40;
        long long v41 = *((_OWORD *)off_1E5DAB048 + 5);
        long long v93 = *((_OWORD *)off_1E5DAB048 + 4);
        long long v94 = v41;
        long long v42 = *((_OWORD *)off_1E5DAB048 + 7);
        long long v95 = *((_OWORD *)off_1E5DAB048 + 6);
        long long v96 = v42;
        long long v43 = *((_OWORD *)off_1E5DAB048 + 1);
        long long v89 = *(_OWORD *)off_1E5DAB048;
        long long v90 = v43;
        long long v44 = *((_OWORD *)off_1E5DAB048 + 3);
        long long v91 = *((_OWORD *)off_1E5DAB048 + 2);
        long long v92 = v44;
        uint64_t v87 = 0;
        uint64_t v88 = 0;
        long long v85 = 0u;
        long long v86 = 0u;
        long long v83 = 0u;
        long long v84 = 0u;
        long long v82 = 0u;
        [(PXCMMEngineDrivenLayout *)self _statusFooterTileIdentifier];
        uint64_t v61 = 0;
        long long v65 = v84;
        long long v66 = v85;
        long long v67 = v86;
        *(void *)&long long v68 = v87;
        long long v63 = v82;
        long long v64 = v83;
        if ([(PXCMMEngineDrivenLayout *)self getGeometry:&v89 group:&v88 userData:&v61 forTileWithIdentifier:&v63])
        {
          v45 = (void (*)(void *, long long *, long long *, uint64_t, uint64_t, unsigned __int8 *))v12[2];
          long long v77 = v84;
          long long v78 = v85;
          long long v79 = v86;
          uint64_t v80 = v87;
          long long v75 = v82;
          long long v76 = v83;
          long long v71 = v97;
          long long v72 = v98;
          long long v73 = v99;
          long long v74 = v100;
          long long v67 = v93;
          long long v68 = v94;
          long long v69 = v95;
          long long v70 = v96;
          long long v63 = v89;
          long long v64 = v90;
          long long v65 = v91;
          long long v66 = v92;
          v45(v12, &v75, &v63, v88, v61, &v101);
        }
      }
    }
  }
  int64_t v46 = [(PXCMMEngineDrivenLayout *)self placeholderMode];
  int v47 = v101;
  if (!v101 && v46)
  {
    [(PXCMMEngineDrivenLayout *)self _placeholderFrame];
    v109.origin.double x = v48;
    v109.origin.double y = v49;
    v109.size.double width = v50;
    v109.size.double height = v51;
    v105.origin.double x = x;
    v105.origin.double y = y;
    v105.size.double width = width;
    v105.size.double height = height;
    if (CGRectIntersectsRect(v105, v109))
    {
      long long v52 = *((_OWORD *)off_1E5DAB048 + 9);
      long long v97 = *((_OWORD *)off_1E5DAB048 + 8);
      long long v98 = v52;
      long long v53 = *((_OWORD *)off_1E5DAB048 + 11);
      long long v99 = *((_OWORD *)off_1E5DAB048 + 10);
      long long v100 = v53;
      long long v54 = *((_OWORD *)off_1E5DAB048 + 5);
      long long v93 = *((_OWORD *)off_1E5DAB048 + 4);
      long long v94 = v54;
      long long v55 = *((_OWORD *)off_1E5DAB048 + 7);
      long long v95 = *((_OWORD *)off_1E5DAB048 + 6);
      long long v96 = v55;
      long long v56 = *((_OWORD *)off_1E5DAB048 + 1);
      long long v89 = *(_OWORD *)off_1E5DAB048;
      long long v90 = v56;
      long long v57 = *((_OWORD *)off_1E5DAB048 + 3);
      long long v91 = *((_OWORD *)off_1E5DAB048 + 2);
      long long v92 = v57;
      uint64_t v87 = 0;
      uint64_t v88 = 0;
      long long v85 = 0u;
      long long v86 = 0u;
      long long v83 = 0u;
      long long v84 = 0u;
      long long v82 = 0u;
      [(PXCMMEngineDrivenLayout *)self _placeholderTileIdentifier];
      uint64_t v60 = 0;
      long long v65 = v84;
      long long v66 = v85;
      long long v67 = v86;
      *(void *)&long long v68 = v87;
      long long v63 = v82;
      long long v64 = v83;
      if ([(PXCMMEngineDrivenLayout *)self getGeometry:&v89 group:&v88 userData:&v60 forTileWithIdentifier:&v63])
      {
        v58 = (void (*)(void *, long long *, long long *, uint64_t, uint64_t, unsigned __int8 *))v12[2];
        long long v77 = v84;
        long long v78 = v85;
        long long v79 = v86;
        uint64_t v80 = v87;
        long long v75 = v82;
        long long v76 = v83;
        long long v71 = v97;
        long long v72 = v98;
        long long v73 = v99;
        long long v74 = v100;
        long long v67 = v93;
        long long v68 = v94;
        long long v69 = v95;
        long long v70 = v96;
        long long v63 = v89;
        long long v64 = v90;
        long long v65 = v91;
        long long v66 = v92;
        v58(v12, &v75, &v63, v88, v60, &v101);
      }
    }
    int v47 = v101;
  }
  if (!v47)
  {
    v59.receiver = self;
    v59.super_class = (Class)PXCMMEngineDrivenLayout;
    -[PXEngineDrivenAssetsTilingLayout enumerateTilesInRect:withOptions:usingBlock:](&v59, sel_enumerateTilesInRect_withOptions_usingBlock_, v11, v12, x, y, width, height);
  }
}

- (BOOL)getGeometry:(PXTileGeometry *)a3 group:(unint64_t *)a4 userData:(id *)a5 forTileWithIdentifier:(PXTileIdentifier *)a6
{
  unint64_t length = a6->length;
  long long v12 = *((_OWORD *)off_1E5DAB048 + 9);
  long long v67 = *((_OWORD *)off_1E5DAB048 + 8);
  long long v68 = v12;
  long long v13 = *((_OWORD *)off_1E5DAB048 + 11);
  long long v69 = *((_OWORD *)off_1E5DAB048 + 10);
  long long v70 = v13;
  long long v14 = *((_OWORD *)off_1E5DAB048 + 5);
  long long v63 = *((_OWORD *)off_1E5DAB048 + 4);
  long long v64 = v14;
  long long v15 = *((_OWORD *)off_1E5DAB048 + 7);
  long long v65 = *((_OWORD *)off_1E5DAB048 + 6);
  long long v66 = v15;
  CGSize v16 = (CGSize)*((_OWORD *)off_1E5DAB048 + 1);
  CGPoint v59 = *(CGPoint *)off_1E5DAB048;
  CGSize v60 = v16;
  CGSize v17 = (CGSize)*((_OWORD *)off_1E5DAB048 + 3);
  CGPoint v61 = (CGPoint)*((_OWORD *)off_1E5DAB048 + 2);
  CGSize v62 = v17;
  if (length - 3 > 2 || (unint64_t v18 = a6->index[1], v18 == 0x7FFFFFFFFFFFFFFFLL))
  {
LABEL_3:
    v48.receiver = self;
    v48.super_class = (Class)PXCMMEngineDrivenLayout;
    long long v19 = *(_OWORD *)&a6->index[5];
    long long v51 = *(_OWORD *)&a6->index[3];
    long long v52 = v19;
    long long v53 = *(_OWORD *)&a6->index[7];
    *(void *)&long long v54 = a6->index[9];
    long long v20 = *(_OWORD *)&a6->index[1];
    long long v49 = *(_OWORD *)&a6->length;
    long long v50 = v20;
    return [(PXEngineDrivenAssetsTilingLayout *)&v48 getGeometry:a3 group:a4 userData:a5 forTileWithIdentifier:&v49];
  }
  unint64_t v23 = a6->index[0];
  CGFloat v24 = [(id)objc_opt_class() _additionalTileKinds];
  if (([v24 containsIndex:v23] & 1) == 0)
  {

    goto LABEL_13;
  }
  CGFloat v25 = [(PXEngineDrivenAssetsTilingLayout *)self dataSource];
  uint64_t v26 = [v25 identifier];

  if (v18 != v26)
  {
LABEL_13:
    switch(v23)
    {
      case 0x80C8ACuLL:
        v34 = [(PXEngineDrivenAssetsTilingLayout *)self dataSource];
        uint64_t v35 = [v34 identifier];

        if (v18 != v35) {
          goto LABEL_3;
        }
        if (self->_headerHeight <= 0.0) {
          goto LABEL_27;
        }
        [(PXCMMEngineDrivenLayout *)self _headerFrame];
        goto LABEL_26;
      case 0x80C8ADuLL:
        CGFloat v38 = [(PXEngineDrivenAssetsTilingLayout *)self dataSource];
        uint64_t v39 = [v38 identifier];

        if (v18 != v39) {
          goto LABEL_3;
        }
        if (self->_bannerHeight > 0.0)
        {
          [(PXCMMEngineDrivenLayout *)self _bannerFrame];
          [(PXTilingLayout *)self coordinateSpaceIdentifier];
          *(_DWORD *)((char *)&v67 + 1) = 0;
          DWORD1(v67) = 0;
          PXRectGetCenter();
        }
        BOOL v21 = 0;
        unint64_t v27 = 41;
        if (!a3) {
          goto LABEL_34;
        }
        goto LABEL_33;
      case 0x80C8AEuLL:
        CGFloat v36 = [(PXEngineDrivenAssetsTilingLayout *)self dataSource];
        uint64_t v37 = [v36 identifier];

        if (v18 != v37) {
          goto LABEL_3;
        }
        if (self->_statusFooterHeight <= 0.0) {
          goto LABEL_27;
        }
        [(PXCMMEngineDrivenLayout *)self _statusFooterFrame];
        goto LABEL_26;
      case 0x80C8B0uLL:
        long long v40 = [(PXEngineDrivenAssetsTilingLayout *)self dataSource];
        uint64_t v41 = [v40 identifier];

        if (v18 != v41) {
          goto LABEL_3;
        }
        if ([(PXCMMEngineDrivenLayout *)self placeholderMode])
        {
          [(PXCMMEngineDrivenLayout *)self _placeholderFrame];
LABEL_26:
          [(PXTilingLayout *)self coordinateSpaceIdentifier];
          *(_DWORD *)((char *)&v67 + 1) = 0;
          DWORD1(v67) = 0;
          PXRectGetCenter();
        }
LABEL_27:
        unint64_t v27 = 0;
        BOOL v21 = 0;
        if (!a3) {
          goto LABEL_34;
        }
        goto LABEL_33;
      default:
        goto LABEL_3;
    }
  }
  if (v23 == 8439963) {
    unint64_t v27 = 42;
  }
  else {
    unint64_t v27 = 0;
  }
  unint64_t v28 = a6->index[2];
  unint64_t v29 = a6->index[3];
  unint64_t v30 = [(PXCMMEngineDrivenLayout *)self _generatorGeometryKindForTileKind:v23];
  long long v31 = objc_msgSend(MEMORY[0x1E4F28D58], "px_indexPathForItem:inSection:withKind:", v29, v28, v30);
  uint64_t v58 = 0;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v49 = 0u;
  long long v32 = [(PXEngineDrivenAssetsTilingLayout *)self layoutSnapshot];
  long long v33 = v32;
  if (v32)
  {
    [v32 geometryForItem:v31];
  }
  else
  {
    uint64_t v58 = 0;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v49 = 0u;
  }

  BOOL v21 = (void)v49 != 0x7FFFFFFFFFFFFFFFLL;
  if ((void)v49 != 0x7FFFFFFFFFFFFFFFLL)
  {
    [(PXTilingLayout *)self coordinateSpaceIdentifier];
    PXRectWithCenterAndSize();
  }

  if (a3)
  {
LABEL_33:
    long long v42 = v68;
    *(_OWORD *)&a3->hidden = v67;
    *(_OWORD *)&a3->contentSize.double height = v42;
    long long v43 = v70;
    *(_OWORD *)&a3->contentsRect.origin.double y = v69;
    *(_OWORD *)&a3->contentsRect.size.double height = v43;
    long long v44 = v64;
    *(_OWORD *)&a3->transform.a = v63;
    *(_OWORD *)&a3->transform.c = v44;
    long long v45 = v66;
    *(_OWORD *)&a3->transform.tdouble x = v65;
    *(_OWORD *)&a3->alpha = v45;
    CGSize v46 = v60;
    a3->frame.CGPoint origin = v59;
    a3->frame.CGSize size = v46;
    CGSize v47 = v62;
    a3->center = v61;
    a3->CGSize size = v47;
  }
LABEL_34:
  if (a4) {
    *a4 = v27;
  }
  if (a5) {
    *a5 = 0;
  }
  return v21;
}

- (CGRect)_placeholderFrame
{
  [(PXCMMEngineDrivenLayout *)self _headerFrame];
  CGFloat x = v16.origin.x;
  CGFloat y = v16.origin.y;
  CGFloat width = v16.size.width;
  CGFloat height = v16.size.height;
  if (CGRectIsEmpty(v16))
  {
    CGFloat MinX = *MEMORY[0x1E4F1DB28];
    CGFloat MaxY = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double headerHeight = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  else
  {
    [(PXTilingLayout *)self referenceSize];
    double headerHeight = self->_headerHeight;
    if (v12 > v11) {
      PXEdgeInsetsInsetSize();
    }
    v17.origin.CGFloat x = x;
    v17.origin.CGFloat y = y;
    v17.size.CGFloat width = width;
    v17.size.CGFloat height = height;
    CGFloat MinX = CGRectGetMinX(v17);
    v18.origin.CGFloat x = x;
    v18.origin.CGFloat y = y;
    v18.size.CGFloat width = width;
    v18.size.CGFloat height = height;
    CGFloat MaxY = CGRectGetMaxY(v18);
    v19.origin.CGFloat x = x;
    v19.origin.CGFloat y = y;
    v19.size.CGFloat width = width;
    v19.size.CGFloat height = height;
    double v9 = CGRectGetWidth(v19);
  }
  double v13 = MinX;
  double v14 = MaxY;
  double v15 = headerHeight;
  result.size.CGFloat height = v15;
  result.size.CGFloat width = v9;
  result.origin.CGFloat y = v14;
  result.origin.CGFloat x = v13;
  return result;
}

- (CGRect)_sectionHeaderTileFrame
{
  double v3 = *MEMORY[0x1E4F1DB28];
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  if (![(PXCMMEngineDrivenLayout *)self placeholderMode])
  {
    unint64_t v7 = [(PXCMMEngineDrivenLayout *)self _generatorGeometryKindForTileKind:8439963];
    uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28D58], "px_indexPathForItem:inSection:withKind:", 0, 0, v7);
    double v9 = [(PXEngineDrivenAssetsTilingLayout *)self layoutSnapshot];
    v10 = v9;
    if (v9) {
      [v9 geometryForItem:v8];
    }

    PXRectWithCenterAndSize();
  }
  double v11 = v3;
  double v12 = v4;
  double v13 = v5;
  double v14 = v6;
  result.size.CGFloat height = v14;
  result.size.CGFloat width = v13;
  result.origin.CGFloat y = v12;
  result.origin.CGFloat x = v11;
  return result;
}

- (PXTileIdentifier)_placeholderTileIdentifier
{
  int64_t v5 = [(PXCMMEngineDrivenLayout *)self placeholderMode];
  if ((unint64_t)(v5 - 1) >= 2)
  {
    if (!v5)
    {
      uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:a3 object:self file:@"PXCMMEngineDrivenLayout.m" lineNumber:316 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = 8439984;
  }
  return [(PXCMMEngineDrivenLayout *)self _identifierForUniqueTileWithKind:v6];
}

- (PXTileIdentifier)_statusFooterTileIdentifier
{
  return [(PXCMMEngineDrivenLayout *)self _identifierForUniqueTileWithKind:8439982];
}

- (CGRect)_statusFooterFrame
{
  p_statusFooterHeight = &self->_statusFooterHeight;
  if (self->_statusFooterHeight <= 0.0)
  {
    double v13 = *MEMORY[0x1E4F1DB28];
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    p_statusFooterHeight = (double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  else
  {
    [(PXCMMEngineDrivenLayout *)self contentBounds];
    double MaxY = CGRectGetMaxY(v17);
    [(PXCMMEngineDrivenLayout *)self reviewSafeAreaInsets];
    double v6 = MaxY - v5 - *p_statusFooterHeight;
    [(PXCMMEngineDrivenLayout *)self footerBottomInset];
    double v8 = v6 - v7;
    [(PXCMMEngineDrivenLayout *)self contentBounds];
    double v10 = v9;
    [(PXCMMEngineDrivenLayout *)self headerFooterSideInset];
    double v12 = fmax(v10 + v11 * -2.0, 0.0);
    [(PXCMMEngineDrivenLayout *)self headerFooterSideInset];
  }
  double v14 = *p_statusFooterHeight;
  double v15 = v8;
  double v16 = v12;
  result.size.CGFloat height = v14;
  result.size.CGFloat width = v16;
  result.origin.CGFloat y = v15;
  result.origin.CGFloat x = v13;
  return result;
}

- (PXTileIdentifier)_bannerTileIdentifier
{
  return [(PXCMMEngineDrivenLayout *)self _identifierForUniqueTileWithKind:8439981];
}

- (CGRect)_bannerFrame
{
  [(PXCMMEngineDrivenLayout *)self _headerFrame];
  CGFloat x = v17.origin.x;
  CGFloat width = v17.size.width;
  double MaxY = CGRectGetMaxY(v17);
  double bannerHeight = self->_bannerHeight;
  if (self->_hasFloatingBanner)
  {
    [(PXTilingLayout *)self contentInset];
    double v8 = v7;
    [(PXCMMEngineDrivenLayout *)self reviewSafeAreaInsets];
    double v10 = v8 + v9;
    [(PXTilingLayout *)self visibleOrigin];
    if (v10 + v11 > MaxY)
    {
      [(PXTilingLayout *)self visibleOrigin];
      double MaxY = MaxY + v10 + v12 - MaxY;
    }
  }
  double v13 = x;
  double v14 = MaxY;
  double v15 = width;
  double v16 = bannerHeight;
  result.size.CGFloat height = v16;
  result.size.CGFloat width = v15;
  result.origin.CGFloat y = v14;
  result.origin.CGFloat x = v13;
  return result;
}

- (PXTileIdentifier)_headerTileIdentifier
{
  return [(PXCMMEngineDrivenLayout *)self _identifierForUniqueTileWithKind:8439980];
}

- (CGRect)_headerFrame
{
  [(PXCMMEngineDrivenLayout *)self reviewSafeAreaInsets];
  double v4 = v3;
  [(PXCMMEngineDrivenLayout *)self reviewSafeAreaInsets];
  double v6 = v4 + v5;
  [(PXCMMEngineDrivenLayout *)self contentBounds];
  double v8 = v7;
  [(PXCMMEngineDrivenLayout *)self headerFooterSideInset];
  double v10 = fmax(v8 + v9 * -2.0 - v6, 0.0);
  [(PXCMMEngineDrivenLayout *)self reviewSafeAreaInsets];
  double v12 = v11;
  [(PXCMMEngineDrivenLayout *)self headerFooterSideInset];
  double v14 = v12 + v13;
  [(PXCMMEngineDrivenLayout *)self reviewSafeAreaInsets];
  double v16 = v15;
  [(PXCMMEngineDrivenLayout *)self headerTopInset];
  double v18 = v16 + v17;
  double headerHeight = self->_headerHeight;
  double v20 = v14;
  double v21 = v10;
  result.size.CGFloat height = headerHeight;
  result.size.CGFloat width = v21;
  result.origin.CGFloat y = v18;
  result.origin.CGFloat x = v20;
  return result;
}

- (PXTileIdentifier)_identifierForUniqueTileWithKind:(SEL)a3
{
  double v6 = [(PXEngineDrivenAssetsTilingLayout *)self dataSource];
  uint64_t v7 = [v6 identifier];

  retstr->index[9] = 0;
  *(_OWORD *)&retstr->index[5] = 0u;
  *(_OWORD *)&retstr->index[7] = 0u;
  retstr->unint64_t length = 5;
  retstr->index[0] = a4;
  retstr->index[1] = v7;
  retstr->index[2] = 0;
  retstr->index[3] = 0;
  retstr->index[4] = 0x7FFFFFFFFFFFFFFFLL;
  return result;
}

- (void)_invalidateAssetStatusBadgeTiles
{
  double v3 = objc_alloc_init(PXTilingLayoutInvalidationContext);
  [(PXTilingLayoutInvalidationContext *)v3 invalidateTilesInGroup:48];
  [(PXTilingLayout *)self invalidateLayoutWithContext:v3];
}

- (void)_invalidateStatusFooter
{
  double v3 = objc_alloc_init(PXTilingLayoutInvalidationContext);
  [(PXCMMEngineDrivenLayout *)self _statusFooterTileIdentifier];
  [(PXTilingLayoutInvalidationContext *)v3 invalidateTileWithIdentifier:v4];
  [(PXTilingLayout *)self invalidateLayoutWithContext:v3];
}

- (void)_invalidateBanner
{
  double v3 = objc_alloc_init(PXTilingLayoutInvalidationContext);
  [(PXTilingLayoutInvalidationContext *)v3 invalidateTilesInGroup:41];
  [(PXTilingLayoutInvalidationContext *)v3 setTag:@"PXCMMBannerTileGroupInvalidationTag"];
  [(PXTilingLayout *)self invalidateLayoutWithContext:v3];
}

- (void)_invalidateHeader
{
  double v3 = objc_alloc_init(PXTilingLayoutInvalidationContext);
  [(PXCMMEngineDrivenLayout *)self _headerTileIdentifier];
  [(PXTilingLayoutInvalidationContext *)v3 invalidateTileWithIdentifier:v4];
  [(PXTilingLayout *)self invalidateLayoutWithContext:v3];
}

- (void)_invalidateSectionHeaders
{
  double v3 = objc_alloc_init(PXTilingLayoutInvalidationContext);
  [(PXTilingLayoutInvalidationContext *)v3 invalidateTilesInGroup:42];
  [(PXTilingLayoutInvalidationContext *)v3 setTag:@"PXCMMSectionHeaderTileGroupInvalidation"];
  [(PXTilingLayout *)self invalidateLayoutWithContext:v3];
}

- (void)setReviewSafeAreaInsets:(UIEdgeInsets)a3
{
}

- (void)setHeaderFooterSideInset:(double)a3
{
  if (self->_headerFooterSideInset != a3)
  {
    self->_headerFooterSideInset = a3;
    [(PXCMMEngineDrivenLayout *)self _invalidateHeader];
    [(PXCMMEngineDrivenLayout *)self _invalidateBanner];
    [(PXCMMEngineDrivenLayout *)self _invalidateStatusFooter];
  }
}

- (void)setFooterBottomInset:(double)a3
{
  if (self->_footerBottomInset != a3)
  {
    self->_footerBottomInset = a3;
    [(PXCMMEngineDrivenLayout *)self _invalidateStatusFooter];
  }
}

- (void)setHeaderTopInset:(double)a3
{
  if (self->_headerTopInset != a3)
  {
    self->_headerTopInset = a3;
    [(PXCMMEngineDrivenLayout *)self _invalidateHeader];
    [(PXCMMEngineDrivenLayout *)self _invalidateBanner];
    [(PXCMMEngineDrivenLayout *)self _invalidateStatusFooter];
  }
}

- (void)setHasFloatingSectionHeaders:(BOOL)a3
{
  if (self->_hasFloatingSectionHeaders != a3)
  {
    self->_hasFloatingSectionHeaders = a3;
    [(PXCMMEngineDrivenLayout *)self _invalidateSectionHeaders];
  }
}

- (void)setHasFloatingBanner:(BOOL)a3
{
  if (self->_hasFloatingBanner != a3)
  {
    self->_hasFloatingBanner = a3;
    [(PXCMMEngineDrivenLayout *)self _invalidateBanner];
  }
}

- (BOOL)headerViewIsVisible
{
}

- (void)setVisibleOrigin:(CGPoint)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXCMMEngineDrivenLayout;
  -[PXTilingLayout setVisibleOrigin:](&v4, sel_setVisibleOrigin_, a3.x, a3.y);
  if ([(PXCMMEngineDrivenLayout *)self hasFloatingSectionHeaders]) {
    [(PXCMMEngineDrivenLayout *)self _invalidateSectionHeaders];
  }
  if ([(PXCMMEngineDrivenLayout *)self hasFloatingBanner]) {
    [(PXCMMEngineDrivenLayout *)self _invalidateBanner];
  }
}

- (CGRect)contentBounds
{
  double v3 = [(PXEngineDrivenAssetsTilingLayout *)self layoutSnapshot];
  objc_super v4 = v3;
  if (v3)
  {
    [v3 contentRect];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
  }
  else
  {
    double v6 = *MEMORY[0x1E4F1DB28];
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  if ([(PXCMMEngineDrivenLayout *)self placeholderMode])
  {
    [(PXTilingLayout *)self referenceSize];
    if (v14 > v13) {
      PXEdgeInsetsInsetSize();
    }
    double v12 = v12 + self->_headerHeight;
  }

  double v15 = v6;
  double v16 = v8;
  double v17 = v10;
  double v18 = v12;
  result.size.CGFloat height = v18;
  result.size.CGFloat width = v17;
  result.origin.CGFloat y = v16;
  result.origin.CGFloat x = v15;
  return result;
}

- (void)setPlaceholderMode:(int64_t)a3
{
  if (self->_placeholderMode != a3)
  {
    self->_placeholderMode = a3;
    objc_super v4 = objc_alloc_init(PXTilingLayoutInvalidationContext);
    [(PXTilingLayoutInvalidationContext *)v4 invalidateAllTiles];
    [(PXTilingLayoutInvalidationContext *)v4 invalidateContentBounds];
    [(PXTilingLayout *)self invalidateLayoutWithContext:v4];
  }
}

- (PXCMMEngineDrivenLayout)initWithLayoutEngineSnapshot:(id)a3 configuration:(id)a4
{
  id v6 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PXCMMEngineDrivenLayout;
  double v7 = [(PXEngineDrivenAssetsTilingLayout *)&v18 initWithLayoutEngineSnapshot:a3];
  if (v7)
  {
    v7->_layoutType = [v6 layoutType];
    [v6 headerHeight];
    v7->_double headerHeight = v8;
    [v6 bannerHeight];
    v7->_double bannerHeight = v9;
    [v6 statusFooterHeight];
    v7->_statusFooterHeight = v10;
    double v11 = objc_alloc_init(PXCMMAssetStatusBadgeTileUserData);
    copiedUserData = v7->__copiedUserData;
    v7->__copiedUserData = v11;

    [(PXCMMAssetStatusBadgeTileUserData *)v7->__copiedUserData setStatus:2];
    double v13 = objc_alloc_init(PXCMMAssetStatusBadgeTileUserData);
    failedUserData = v7->__failedUserData;
    v7->__failedUserData = v13;

    [(PXCMMAssetStatusBadgeTileUserData *)v7->__failedUserData setStatus:-1];
    double v15 = [MEMORY[0x1E4F28E60] indexSet];
    [v15 addIndex:8439952];
    [v15 addIndex:8439964];
    double v16 = (void *)[objc_alloc(MEMORY[0x1E4F28D60]) initWithIndexSet:v15];
    [(PXAssetsTilingLayout *)v7 setAdditionalAccessoryTileKinds:v16];
  }
  return v7;
}

- (PXCMMEngineDrivenLayout)initWithDataSource:(id)a3
{
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCMMEngineDrivenLayout.m", 71, @"%s is not available as initializer", "-[PXCMMEngineDrivenLayout initWithDataSource:]");

  abort();
}

- (PXCMMEngineDrivenLayout)initWithLayoutEngineSnapshot:(id)a3
{
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCMMEngineDrivenLayout.m", 67, @"%s is not available as initializer", "-[PXCMMEngineDrivenLayout initWithLayoutEngineSnapshot:]");

  abort();
}

+ (id)_additionalTileKinds
{
  if (_additionalTileKinds_onceToken != -1) {
    dispatch_once(&_additionalTileKinds_onceToken, &__block_literal_global_35791);
  }
  double v2 = (void *)_additionalTileKinds_additionalTileKinds;
  return v2;
}

void __47__PXCMMEngineDrivenLayout__additionalTileKinds__block_invoke()
{
  id v2 = [MEMORY[0x1E4F28E60] indexSetWithIndex:8439962];
  [v2 addIndex:8439963];
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F28D60]) initWithIndexSet:v2];
  v1 = (void *)_additionalTileKinds_additionalTileKinds;
  _additionalTileKinds_additionalTileKinds = v0;
}

@end