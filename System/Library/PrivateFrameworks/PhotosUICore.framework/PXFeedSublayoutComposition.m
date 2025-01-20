@interface PXFeedSublayoutComposition
- (PXFeedViewLayoutSpec)spec;
- (id)configuredLayoutGenerator;
- (int64_t)scrollableAxis;
- (void)setSpec:(id)a3;
- (void)visibleRectDidChange;
@end

@implementation PXFeedSublayoutComposition

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_cachedLayoutGenerator, 0);
}

- (PXFeedViewLayoutSpec)spec
{
  return self->_spec;
}

- (void)visibleRectDidChange
{
  v16.receiver = self;
  v16.super_class = (Class)PXFeedSublayoutComposition;
  [(PXGSublayoutComposition *)&v16 visibleRectDidChange];
  v3 = [(PXFeedSublayoutComposition *)self spec];
  int v4 = [v3 wantsFirstItemFullscreen];

  if (v4)
  {
    v5 = [(PXFeedSublayoutComposition *)self configuredLayoutGenerator];
    if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }

    [(PXGSublayoutComposition *)self visibleRect];
    double v8 = v7;
    double v10 = v9;
    v11 = [(PXFeedSublayoutComposition *)self spec];
    v12 = [v11 scrollBehavior];
    [v12 intrinsicContentOffset];
    double v14 = v10 / v13;
    BOOL v15 = v10 / v13 <= 1.0;

    objc_msgSend(v6, "setVisibleOrigin:updateFirstItemPosition:", v15, v8, v10);
    if (v14 <= 1.0) {
      [(PXGSublayoutComposition *)self invalidateEstimatedSublayoutGeometries];
    }
  }
}

- (id)configuredLayoutGenerator
{
  [(PXGSublayoutComposition *)self referenceSize];
  double v5 = v4;
  double v7 = v6;
  double v8 = [(PXLayoutGenerator *)self->_cachedLayoutGenerator metrics];
  [v8 referenceSize];
  double v10 = v9;
  double v12 = v11;

  if (v5 != v10 || v7 != v12)
  {
    cachedLayoutGenerator = self->_cachedLayoutGenerator;
    self->_cachedLayoutGenerator = 0;
  }
  if (!self->_cachedLayoutGenerator)
  {
    BOOL v15 = [(PXFeedSublayoutComposition *)self spec];
    objc_msgSend(v15, "layoutGeneratorWithReferenceSize:", v5, v7);
    objc_super v16 = (PXLayoutGenerator *)objc_claimAutoreleasedReturnValue();
    v17 = self->_cachedLayoutGenerator;
    self->_cachedLayoutGenerator = v16;
  }
  [(PXLayoutGenerator *)self->_cachedLayoutGenerator setItemCount:[(PXGSublayoutComposition *)self numberOfSublayouts]];
  v18 = self->_cachedLayoutGenerator;
  if (!v18)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"PXFeedSublayoutComposition.m", 47, @"Invalid parameter not satisfying: %@", @"_cachedLayoutGenerator != nil" object file lineNumber description];

    v18 = self->_cachedLayoutGenerator;
  }
  return v18;
}

- (int64_t)scrollableAxis
{
  v2 = [(PXFeedSublayoutComposition *)self spec];
  v3 = [v2 scrollBehavior];
  int64_t v4 = [v3 axis];

  return v4;
}

- (void)setSpec:(id)a3
{
  double v8 = (PXFeedViewLayoutSpec *)a3;
  double v5 = self->_spec;
  if (v5 == v8)
  {
  }
  else
  {
    char v6 = [(PXFeedViewLayoutSpec *)v8 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_spec, a3);
      cachedLayoutGenerator = self->_cachedLayoutGenerator;
      self->_cachedLayoutGenerator = 0;

      [(PXGGeneratedSublayoutComposition *)self invalidateLayout];
    }
  }
}

@end