@interface PXEngineDrivenAssetsTilingLayout
- (BOOL)_needsUpdate;
- (BOOL)getAdditionalTileIdentifier:(PXTileIdentifier *)a3 group:(unint64_t *)a4 layoutGeometryKind:(unint64_t)a5 indexPath:(PXSimpleIndexPath *)a6;
- (BOOL)getGeometry:(PXTileGeometry *)a3 group:(unint64_t *)a4 userData:(id *)a5 forTileWithIdentifier:(PXTileIdentifier *)a6;
- (CGRect)_contentsRectForItemAtIndexPath:(PXSimpleIndexPath *)a3 forAspectRatio:(double)a4;
- (CGRect)contentBounds;
- (CGSize)playButtonSizeForItemAtIndexPath:(PXSimpleIndexPath *)a3 contentTileSize:(CGSize)a4;
- (PXEngineDrivenAssetsTilingLayout)initWithDataSource:(id)a3;
- (PXEngineDrivenAssetsTilingLayout)initWithLayoutEngineSnapshot:(id)a3;
- (PXEngineDrivenAssetsTilingLayoutDelegate)delegate;
- (PXLayoutSnapshot)layoutSnapshot;
- (double)_aspectRatioForItemAtIndexPath:(PXSimpleIndexPath *)a3;
- (double)_zPositionForItemAtIndexPath:(PXSimpleIndexPath *)a3;
- (id)dataSource;
- (int64_t)contentMode;
- (void)adjustGeometry:(PXTileGeometry *)a3 forContentTileWithIndexPath:(PXSimpleIndexPath *)a4;
- (void)enumerateTilesInRect:(CGRect)a3 withOptions:(id)a4 usingBlock:(id)a5;
- (void)setContentMode:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setLayoutSnapshot:(id)a3;
- (void)setReferenceSize:(CGSize)a3;
@end

@implementation PXEngineDrivenAssetsTilingLayout

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutSnapshot, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (int64_t)contentMode
{
  return self->_contentMode;
}

- (PXLayoutSnapshot)layoutSnapshot
{
  return self->_layoutSnapshot;
}

- (PXEngineDrivenAssetsTilingLayoutDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXEngineDrivenAssetsTilingLayoutDelegate *)WeakRetained;
}

- (CGRect)_contentsRectForItemAtIndexPath:(PXSimpleIndexPath *)a3 forAspectRatio:(double)a4
{
  if (self->_delegateFlags.respondsToEngineDrivenLayoutContentsRectForItemAtIndexPathForAspectRatio)
  {
    v7 = [(PXEngineDrivenAssetsTilingLayout *)self delegate];
    long long v8 = *(_OWORD *)&a3->item;
    v21[0] = *(_OWORD *)&a3->dataSourceIdentifier;
    v21[1] = v8;
    [v7 engineDrivenLayout:self contentsRectForItemAtIndexPath:v21 forAspectRatio:a4];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
  }
  else
  {
    double v10 = *(double *)off_1E5DAB010;
    double v12 = *((double *)off_1E5DAB010 + 1);
    double v14 = *((double *)off_1E5DAB010 + 2);
    double v16 = *((double *)off_1E5DAB010 + 3);
  }
  double v17 = v10;
  double v18 = v12;
  double v19 = v14;
  double v20 = v16;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (double)_zPositionForItemAtIndexPath:(PXSimpleIndexPath *)a3
{
  if (!self->_delegateFlags.respondsToEngineDrivenLayoutZPositionForItemAtIndexPath) {
    return 0.0;
  }
  v5 = [(PXEngineDrivenAssetsTilingLayout *)self delegate];
  long long v6 = *(_OWORD *)&a3->item;
  v10[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v10[1] = v6;
  [v5 engineDrivenLayout:self zPositionForItemAtIndexPath:v10];
  double v8 = v7;

  return v8;
}

- (double)_aspectRatioForItemAtIndexPath:(PXSimpleIndexPath *)a3
{
  if (!self->_delegateFlags.respondsToEngineDrivenLayoutAspectRatioForItemAtIndexPath) {
    return 1.0;
  }
  v5 = [(PXEngineDrivenAssetsTilingLayout *)self delegate];
  long long v6 = *(_OWORD *)&a3->item;
  v10[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v10[1] = v6;
  [v5 engineDrivenLayout:self aspectRatioForItemAtIndexPath:v10];
  double v8 = v7;

  return v8;
}

- (CGSize)playButtonSizeForItemAtIndexPath:(PXSimpleIndexPath *)a3 contentTileSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  if (self->_delegateFlags.respondsToEngineDrivenLayoutPlayButtonSizeForItemAtIndexPathForAspectRatio)
  {
    double v8 = [(PXEngineDrivenAssetsTilingLayout *)self delegate];
    long long v9 = *(_OWORD *)&a3->item;
    long long v20 = *(_OWORD *)&a3->dataSourceIdentifier;
    long long v21 = v9;
    objc_msgSend(v8, "engineDrivenLayout:playButtonSizeForItemAtIndexPath:contentTileSize:", self, &v20, width, height);
    double v11 = v10;
    double v13 = v12;
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)PXEngineDrivenAssetsTilingLayout;
    long long v14 = *(_OWORD *)&a3->item;
    long long v20 = *(_OWORD *)&a3->dataSourceIdentifier;
    long long v21 = v14;
    -[PXAssetsTilingLayout playButtonSizeForItemAtIndexPath:contentTileSize:](&v19, sel_playButtonSizeForItemAtIndexPath_contentTileSize_, &v20, a4.width, height);
    double v11 = v15;
    double v13 = v16;
  }
  double v17 = v11;
  double v18 = v13;
  result.double height = v18;
  result.double width = v17;
  return result;
}

- (id)dataSource
{
  v3 = [(PXEngineDrivenAssetsTilingLayout *)self layoutSnapshot];
  v4 = [v3 dataSourceSnapshot];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)PXEngineDrivenAssetsTilingLayout;
    id v6 = [(PXAssetsTilingLayout *)&v9 dataSource];
  }
  double v7 = v6;

  return v7;
}

- (void)setContentMode:(int64_t)a3
{
  if (self->_contentMode != a3)
  {
    self->_contentMode = a3;
    v4 = objc_alloc_init(PXTilingLayoutInvalidationContext);
    [(PXTilingLayoutInvalidationContext *)v4 invalidateAllTiles];
    [(PXTilingLayout *)self invalidateLayoutWithContext:v4];
  }
}

- (void)setLayoutSnapshot:(id)a3
{
  id v6 = (PXLayoutSnapshot *)a3;
  p_layoutSnapshot = &self->_layoutSnapshot;
  if (self->_layoutSnapshot != v6)
  {
    v22 = v6;
    if (v6)
    {
      double v8 = [(PXLayoutSnapshot *)v6 dataSourceSnapshot];
      uint64_t v9 = [v8 identifier];
      double v10 = [(PXEngineDrivenAssetsTilingLayout *)self dataSource];
      uint64_t v11 = [v10 identifier];

      if (v9 != v11)
      {
        long long v20 = [MEMORY[0x1E4F28B00] currentHandler];
        [v20 handleFailureInMethod:a2 object:self file:@"PXEngineDrivenAssetsTilingLayout.m" lineNumber:223 description:@"Changing to a layoutSnapshot with a new data source version is not supported."];
      }
      if (*p_layoutSnapshot)
      {
        double v12 = [(PXLayoutSnapshot *)v22 dataSourceSnapshot];
        uint64_t v13 = [v12 identifier];
        long long v14 = [(PXLayoutSnapshot *)*p_layoutSnapshot dataSourceSnapshot];
        uint64_t v15 = [v14 identifier];

        if (v13 != v15)
        {
          double v16 = [MEMORY[0x1E4F28B00] currentHandler];
          [v16 handleFailureInMethod:a2 object:self file:@"PXEngineDrivenAssetsTilingLayout.m" lineNumber:224 description:@"Changing to a layoutSnapshot with a new data source version is not supported."];
        }
      }
      double v17 = [(PXLayoutSnapshot *)v22 dataSourceSnapshot];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        long long v21 = [MEMORY[0x1E4F28B00] currentHandler];
        [v21 handleFailureInMethod:a2 object:self file:@"PXEngineDrivenAssetsTilingLayout.m" lineNumber:225 description:@"Requires a layout snapshot with a PXAssetsDataSource data source."];
      }
    }
    objc_storeStrong((id *)&self->_layoutSnapshot, a3);
    objc_super v19 = objc_alloc_init(PXTilingLayoutInvalidationContext);
    [(PXTilingLayoutInvalidationContext *)v19 invalidateAllTiles];
    [(PXTilingLayoutInvalidationContext *)v19 invalidateContentBounds];
    [(PXTilingLayout *)self invalidateLayoutWithContext:v19];

    id v6 = v22;
  }
}

- (BOOL)getAdditionalTileIdentifier:(PXTileIdentifier *)a3 group:(unint64_t *)a4 layoutGeometryKind:(unint64_t)a5 indexPath:(PXSimpleIndexPath *)a6
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  PXAssertGetLog();
}

- (CGRect)contentBounds
{
  v3 = [(PXEngineDrivenAssetsTilingLayout *)self layoutSnapshot];
  if (v3) {
    [v3 contentRect];
  }
  [(PXTilingLayout *)self contentInset];
  sub_1AB23B20C();
}

- (void)adjustGeometry:(PXTileGeometry *)a3 forContentTileWithIndexPath:(PXSimpleIndexPath *)a4
{
  v4.receiver = self;
  v4.super_class = (Class)PXEngineDrivenAssetsTilingLayout;
  -[PXAssetsTilingLayout adjustGeometry:forContentTileWithIndexPath:](&v4, sel_adjustGeometry_forContentTileWithIndexPath_, a4->dataSourceIdentifier, a4->section, a4->item, a4->subitem);
  PXSizeGetAspectRatio();
}

- (BOOL)getGeometry:(PXTileGeometry *)a3 group:(unint64_t *)a4 userData:(id *)a5 forTileWithIdentifier:(PXTileIdentifier *)a6
{
  unint64_t length = a6->length;
  long long v12 = *((_OWORD *)off_1E5DAB048 + 9);
  long long v42 = *((_OWORD *)off_1E5DAB048 + 8);
  long long v43 = v12;
  long long v13 = *((_OWORD *)off_1E5DAB048 + 11);
  long long v44 = *((_OWORD *)off_1E5DAB048 + 10);
  long long v45 = v13;
  long long v14 = *((_OWORD *)off_1E5DAB048 + 5);
  long long v38 = *((_OWORD *)off_1E5DAB048 + 4);
  long long v39 = v14;
  long long v15 = *((_OWORD *)off_1E5DAB048 + 7);
  long long v40 = *((_OWORD *)off_1E5DAB048 + 6);
  long long v41 = v15;
  long long v16 = *((_OWORD *)off_1E5DAB048 + 1);
  long long v34 = *(_OWORD *)off_1E5DAB048;
  long long v35 = v16;
  long long v17 = *((_OWORD *)off_1E5DAB048 + 3);
  long long v36 = *((_OWORD *)off_1E5DAB048 + 2);
  long long v37 = v17;
  if (length - 3 <= 2)
  {
    unint64_t v18 = a6->index[1];
    if (v18 != 0x7FFFFFFFFFFFFFFFLL && length == 5 && a6->index[0] == 6432423)
    {
      objc_super v19 = [(PXEngineDrivenAssetsTilingLayout *)self dataSource];
      uint64_t v20 = [v19 identifier];

      if (v18 == v20)
      {
        unint64_t v21 = a6->index[2];
        unint64_t v23 = a6->index[3];
        unint64_t v22 = a6->index[4];
        *(void *)&long long v28 = a6->index[1];
        *((void *)&v28 + 1) = v21;
        *(void *)&long long v29 = v23;
        *((void *)&v29 + 1) = v22;
        PXIndexPathFromSimpleIndexPath();
      }
    }
  }
  v27.receiver = self;
  v27.super_class = (Class)PXEngineDrivenAssetsTilingLayout;
  long long v24 = *(_OWORD *)&a6->index[5];
  long long v30 = *(_OWORD *)&a6->index[3];
  long long v31 = v24;
  long long v32 = *(_OWORD *)&a6->index[7];
  *(void *)&long long v33 = a6->index[9];
  long long v25 = *(_OWORD *)&a6->index[1];
  long long v28 = *(_OWORD *)&a6->length;
  long long v29 = v25;
  return [(PXAssetsTilingLayout *)&v27 getGeometry:a3 group:a4 userData:a5 forTileWithIdentifier:&v28];
}

- (void)enumerateTilesInRect:(CGRect)a3 withOptions:(id)a4 usingBlock:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = a4;
  id v12 = a5;
  long long v13 = [(PXEngineDrivenAssetsTilingLayout *)self dataSource];
  uint64_t v14 = [v13 identifier];

  long long v15 = [(PXTilingLayout *)self coordinateSpaceIdentifier];
  BOOL v16 = [(PXEngineDrivenAssetsTilingLayout *)self contentMode] == 0;
  long long v17 = [(PXEngineDrivenAssetsTilingLayout *)self layoutSnapshot];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __80__PXEngineDrivenAssetsTilingLayout_enumerateTilesInRect_withOptions_usingBlock___block_invoke;
  v20[3] = &unk_1E5DB24F8;
  BOOL v25 = v16;
  uint64_t v23 = v14;
  long long v24 = v15;
  id v21 = v11;
  id v22 = v12;
  v20[4] = self;
  id v18 = v11;
  id v19 = v12;
  objc_msgSend(v17, "enumerateGeometriesForItemsInRect:usingBlock:", v20, x, y, width, height);
}

void __80__PXEngineDrivenAssetsTilingLayout_enumerateTilesInRect_withOptions_usingBlock___block_invoke(uint64_t a1, void *a2, uint64_t *a3)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(void *)(a1 + 56);
  id v6 = a2;
  uint64_t v7 = objc_msgSend(v6, "px_section");
  uint64_t v8 = objc_msgSend(v6, "px_item");

  uint64_t v9 = a3[12];
  if (v9) {
    goto LABEL_8;
  }
  double v10 = [*(id *)(a1 + 32) dataSource];
  if (v7 >= [v10 numberOfSections])
  {
  }
  else
  {
    id v11 = [*(id *)(a1 + 32) dataSource];
    uint64_t v12 = [v11 numberOfItemsInSection:v7];

    if (v8 < v12)
    {
      *(void *)&long long v39 = 0;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v32 = 0u;
      if (*(unsigned char *)(a1 + 72))
      {
        long long v13 = *(void **)(a1 + 32);
        *(void *)v26 = v5;
        *(void *)&v26[8] = v7;
        uint64_t v27 = v8;
        uint64_t v28 = 0x7FFFFFFFFFFFFFFFLL;
        MEMORY[0x1AD10BC20]([v13 _aspectRatioForItemAtIndexPath:v26]);
      }
      PXRectWithCenterAndSize();
    }
  }
  uint64_t v9 = a3[12];
  if (v9)
  {
LABEL_8:
    uint64_t v25 = 0;
    memset(v24, 0, sizeof(v24));
    uint64_t v23 = 0;
    uint64_t v14 = *(void **)(a1 + 32);
    *(void *)buf = v5;
    *(void *)&buf[8] = v7;
    uint64_t v30 = v8;
    uint64_t v31 = 0x7FFFFFFFFFFFFFFFLL;
    if ([v14 getAdditionalTileIdentifier:v24 group:&v23 layoutGeometryKind:v9 indexPath:buf])PXRectWithCenterAndSize(); {
  }
    }
  else
  {
    long long v15 = PLUIGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = [*(id *)(a1 + 32) layoutSnapshot];
      BOOL v16 = NSString;
      uint64_t v17 = *a3;
      id v18 = NSStringFromCGPoint(*(CGPoint *)(a3 + 1));
      id v19 = NSStringFromCGSize(*(CGSize *)(a3 + 3));
      uint64_t v20 = [v16 stringWithFormat:@"  [geometry[%ld] = {center:%@, size:%@}]\r", v17, v18, v19, v22];

      *(void *)buf = v5;
      *(void *)&buf[8] = v7;
      uint64_t v30 = v8;
      uint64_t v31 = 0x7FFFFFFFFFFFFFFFLL;
      id v21 = v20;
      PXSimpleIndexPathDescription();
    }
  }
}

- (void)setReferenceSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(PXTilingLayout *)self referenceSize];
  if (width != v7 || height != v6)
  {
    v11.receiver = self;
    v11.super_class = (Class)PXEngineDrivenAssetsTilingLayout;
    -[PXTilingLayout setReferenceSize:](&v11, sel_setReferenceSize_, width, height);
    uint64_t v9 = [(PXEngineDrivenAssetsTilingLayout *)self delegate];
    double v10 = v9;
    if (self->_delegateFlags.respondsToEngineDrivenLayoutReferenceSizeDidChange) {
      [v9 engineDrivenLayoutReferenceSizeDidChange:self];
    }
  }
}

- (BOOL)_needsUpdate
{
  return 0;
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    p_delegateFlags = &self->_delegateFlags;
    p_delegateFlags->respondsToEngineDrivenLayoutReferenceSizeDidChange = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToEngineDrivenLayoutAspectRatioForItemAtIndexPath = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToEngineDrivenLayoutZPositionForItemAtIndexPath = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToEngineDrivenLayoutContentsRectForItemAtIndexPathForAspectRatio = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToEngineDrivenLayoutPlayButtonSizeForItemAtIndexPathForAspectRatio = objc_opt_respondsToSelector() & 1;
  }
}

- (PXEngineDrivenAssetsTilingLayout)initWithLayoutEngineSnapshot:(id)a3
{
  id v5 = a3;
  double v6 = [v5 dataSourceSnapshot];
  v10.receiver = self;
  v10.super_class = (Class)PXEngineDrivenAssetsTilingLayout;
  double v7 = [(PXAssetsTilingLayout *)&v10 initWithDataSource:v6];
  uint64_t v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_layoutSnapshot, a3);
    [(PXEngineDrivenAssetsTilingLayout *)v8 _commonInit];
  }

  return v8;
}

- (PXEngineDrivenAssetsTilingLayout)initWithDataSource:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PXEngineDrivenAssetsTilingLayout;
  v3 = [(PXAssetsTilingLayout *)&v6 initWithDataSource:a3];
  objc_super v4 = v3;
  if (v3) {
    [(PXEngineDrivenAssetsTilingLayout *)v3 _commonInit];
  }
  return v4;
}

@end