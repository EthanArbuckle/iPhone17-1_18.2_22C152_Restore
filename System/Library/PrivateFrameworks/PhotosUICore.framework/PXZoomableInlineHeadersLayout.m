@interface PXZoomableInlineHeadersLayout
- (PXZoomableInlineHeadersDataSourceManager)dataSourceManager;
- (PXZoomableInlineHeadersLayout)initWithDataSourceManager:(id)a3;
- (PXZoomableInlineHeadersLayoutGeometrySource)geometrySource;
- (PXZoomableInlineHeadersLayoutSpec)spec;
- (double)monthsAlpha;
- (double)yearsAlpha;
- (void)_updateSublayouts;
- (void)invalidateAnchorItemFrames;
- (void)invalidateGeometry;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setGeometrySource:(id)a3;
- (void)setMonthsAlpha:(double)a3;
- (void)setSpec:(id)a3;
- (void)setYearsAlpha:(double)a3;
- (void)update;
@end

@implementation PXZoomableInlineHeadersLayout

- (void)setSpec:(id)a3
{
  v5 = (PXZoomableInlineHeadersLayoutSpec *)a3;
  if (self->_spec != v5)
  {
    v11 = v5;
    objc_storeStrong((id *)&self->_spec, a3);
    [(PXInlineHeadersSpriteLayout *)self->_yearsLayout setSpec:v11];
    [(PXInlineHeadersSpriteLayout *)self->_monthsLayout setSpec:v11];
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 1;
LABEL_8:
        v5 = v11;
        goto LABEL_9;
      }
LABEL_6:
      if (self->_updateFlags.updated)
      {
        v9 = [MEMORY[0x1E4F28B00] currentHandler];
        v10 = [NSString stringWithUTF8String:"-[PXZoomableInlineHeadersLayout setSpec:]"];
        objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, @"PXZoomableInlineHeadersLayout.m", 80, @"invalidating %lu after it already has been updated", 1);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 1;
    v5 = v11;
    if (!willPerformUpdate)
    {
      [(PXGLayout *)self setNeedsUpdate];
      goto LABEL_8;
    }
  }
LABEL_9:
}

- (void)update
{
  p_updateFlags = &self->_updateFlags;
  self->_updateFlags.BOOL willPerformUpdate = 0;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (self->_updateFlags.isPerformingUpdate)
    {
      v5 = [MEMORY[0x1E4F28B00] currentHandler];
      v6 = [NSString stringWithUTF8String:"-[PXZoomableInlineHeadersLayout update]"];
      [v5 handleFailureInFunction:v6, @"PXZoomableInlineHeadersLayout.m", 110, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];

      unint64_t needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 1;
    if (needsUpdate)
    {
      p_updateFlags->unint64_t needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
      [(PXZoomableInlineHeadersLayout *)self _updateSublayouts];
      unint64_t needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    if (needsUpdate)
    {
      v7 = [MEMORY[0x1E4F28B00] currentHandler];
      v8 = [NSString stringWithUTF8String:"-[PXZoomableInlineHeadersLayout update]"];
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, @"PXZoomableInlineHeadersLayout.m", 116, @"still needing to update %lu after update pass", p_updateFlags->needsUpdate);
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)PXZoomableInlineHeadersLayout;
  [(PXGSplitLayout *)&v9 update];
}

- (void)setYearsAlpha:(double)a3
{
}

- (void)setMonthsAlpha:(double)a3
{
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v9 = a3;
  if ((void *)PXCuratedLibraryInlineHeadersObserverContext != a5)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"PXZoomableInlineHeadersLayout.m" lineNumber:135 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  if (v6)
  {
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_8:
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 1;
        goto LABEL_9;
      }
LABEL_7:
      if (self->_updateFlags.updated)
      {
        v14 = [MEMORY[0x1E4F28B00] currentHandler];
        v15 = [NSString stringWithUTF8String:"-[PXZoomableInlineHeadersLayout observable:didChange:context:]"];
        objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, @"PXZoomableInlineHeadersLayout.m", 132, @"invalidating %lu after it already has been updated", 1);

        abort();
      }
      goto LABEL_8;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_7;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 1;
    if (!willPerformUpdate)
    {
      id v16 = v9;
      [(PXGLayout *)self setNeedsUpdate];
      id v9 = v16;
    }
  }
LABEL_9:
}

- (void)_updateSublayouts
{
  v3 = [(PXZoomableInlineHeadersLayout *)self dataSourceManager];
  v4 = [v3 yearsDataSource];
  [(PXInlineHeadersSpriteLayout *)self->_yearsLayout setDataSource:v4];

  v5 = [(PXZoomableInlineHeadersLayout *)self dataSourceManager];
  char v6 = [v5 monthsDataSource];
  [(PXInlineHeadersSpriteLayout *)self->_monthsLayout setDataSource:v6];

  v7 = [(PXZoomableInlineHeadersLayout *)self spec];
  uint64_t v8 = [v7 style];

  [(PXInlineHeadersSpriteLayout *)self->_yearsLayout setStyle:v8];
  monthsLayout = self->_monthsLayout;
  [(PXInlineHeadersSpriteLayout *)monthsLayout setStyle:v8];
}

- (PXZoomableInlineHeadersDataSourceManager)dataSourceManager
{
  return self->_dataSourceManager;
}

- (PXZoomableInlineHeadersLayoutSpec)spec
{
  return self->_spec;
}

- (PXZoomableInlineHeadersLayout)initWithDataSourceManager:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PXZoomableInlineHeadersLayout;
  char v6 = [(PXGLayout *)&v18 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dataSourceManager, a3);
    [v5 registerChangeObserver:v7 context:PXCuratedLibraryInlineHeadersObserverContext];
    uint64_t v8 = [[PXInlineHeadersSpriteLayout alloc] initWithLevel:0];
    yearsLayout = v7->_yearsLayout;
    v7->_yearsLayout = v8;

    v10 = [[PXInlineHeadersSpriteLayout alloc] initWithLevel:1];
    monthsLayout = v7->_monthsLayout;
    v7->_monthsLayout = v10;

    [(PXGSplitLayout *)v7 setFirstSublayout:v7->_yearsLayout];
    [(PXGSplitLayout *)v7 setSecondSublayout:v7->_monthsLayout];
    [(PXGSplitLayout *)v7 setMode:4];
    p_updateFlags = (uint64_t *)&v7->_updateFlags;
    unint64_t needsUpdate = v7->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!v7->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        uint64_t *p_updateFlags = needsUpdate | 1;
        goto LABEL_8;
      }
LABEL_6:
      if (v7->_updateFlags.updated)
      {
        id v16 = [MEMORY[0x1E4F28B00] currentHandler];
        v17 = [NSString stringWithUTF8String:"-[PXZoomableInlineHeadersLayout initWithDataSourceManager:]"];
        objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, @"PXZoomableInlineHeadersLayout.m", 63, @"invalidating %lu after it already has been updated", 1);

        abort();
      }
      goto LABEL_7;
    }
    if (v7->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = v7->_updateFlags.willPerformUpdate;
    uint64_t *p_updateFlags = 1;
    if (!willPerformUpdate) {
      [(PXGLayout *)v7 setNeedsUpdate];
    }
  }
LABEL_8:

  return v7;
}

- (void)setGeometrySource:(id)a3
{
  yearsLayout = self->_yearsLayout;
  id v5 = a3;
  [(PXInlineHeadersSpriteLayout *)yearsLayout setGeometrySource:v5];
  [(PXInlineHeadersSpriteLayout *)self->_monthsLayout setGeometrySource:v5];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_geometrySource);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_dataSourceManager, 0);
  objc_storeStrong((id *)&self->_monthsLayout, 0);
  objc_storeStrong((id *)&self->_yearsLayout, 0);
}

- (PXZoomableInlineHeadersLayoutGeometrySource)geometrySource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_geometrySource);
  return (PXZoomableInlineHeadersLayoutGeometrySource *)WeakRetained;
}

- (void)invalidateGeometry
{
  [(PXInlineHeadersSpriteLayout *)self->_yearsLayout invalidateAnchorItemFrames];
  monthsLayout = self->_monthsLayout;
  [(PXInlineHeadersSpriteLayout *)monthsLayout invalidateAnchorItemFrames];
}

- (void)invalidateAnchorItemFrames
{
  [(PXInlineHeadersSpriteLayout *)self->_yearsLayout invalidateAnchorItemFrames];
  monthsLayout = self->_monthsLayout;
  [(PXInlineHeadersSpriteLayout *)monthsLayout invalidateAnchorItemFrames];
}

- (double)monthsAlpha
{
  [(PXGLayout *)self->_monthsLayout alpha];
  return result;
}

- (double)yearsAlpha
{
  [(PXGLayout *)self->_yearsLayout alpha];
  return result;
}

@end