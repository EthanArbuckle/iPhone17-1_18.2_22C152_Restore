@interface PXInlineHeadersSpriteLayout
- (Class)viewClassForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (PXInlineHeadersSpriteLayout)initWithLevel:(unint64_t)a3;
- (PXZoomableInlineHeadersDataSource)dataSource;
- (PXZoomableInlineHeadersLayoutGeometrySource)geometrySource;
- (PXZoomableInlineHeadersLayoutSpec)spec;
- (id)axSpriteIndexes;
- (id)itemsBetweenItem:(int64_t)a3 andItem:(int64_t)a4;
- (id)itemsInRect:(CGRect)a3 inLayout:(id)a4;
- (id)viewUserDataForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (int64_t)itemClosestToItem:(int64_t)a3 inDirection:(unint64_t)a4;
- (unint64_t)level;
- (unint64_t)style;
- (unsigned)axSpriteIndexClosestToSpriteIndex:(unsigned int)a3 inDirection:(unint64_t)a4;
- (void)_bumpMediaVersion;
- (void)_currentLocaleChanged:(id)a3;
- (void)_setupDateFormatters;
- (void)_updateSprites;
- (void)alphaDidChange;
- (void)displayScaleDidChange;
- (void)invalidateAnchorItemFrames;
- (void)setDataSource:(id)a3;
- (void)setGeometrySource:(id)a3;
- (void)setSpec:(id)a3;
- (void)setStyle:(unint64_t)a3;
- (void)update;
- (void)visibleRectDidChange;
@end

@implementation PXInlineHeadersSpriteLayout

void __45__PXInlineHeadersSpriteLayout__updateSprites__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) spec];
  objc_claimAutoreleasedReturnValue();
  v2 = [*(id *)(a1 + 32) dataSource];
  [v2 assetsDataSource];
  objc_claimAutoreleasedReturnValue();

  id v3 = [*(id *)(a1 + 32) dataSource];
  [v3 sectionInfos];

  [*(id *)(a1 + 32) geometrySource];
  objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) level];
  [*(id *)(a1 + 32) displayScale];
  -[PXZoomableInlineHeaderViewConfiguration initWithTitle:subtitle:swapTitleAndSubtitle:style:]([PXZoomableInlineHeaderViewConfiguration alloc], "initWithTitle:subtitle:swapTitleAndSubtitle:style:", @"AUGUST", @"2019", 0, [*(id *)(a1 + 32) style]);
  +[PXZoomableInlineHeaderView sizeWithConfiguration:](PXZoomableInlineHeaderView, "sizeWithConfiguration:");
  [*(id *)(a1 + 32) alpha];
  [*(id *)(a1 + 32) visibleRect];
  [*(id *)(a1 + 32) safeAreaInsets];
  PXEdgeInsetsInsetRect();
}

- (unint64_t)style
{
  return self->_style;
}

- (PXZoomableInlineHeadersLayoutSpec)spec
{
  return self->_spec;
}

- (unint64_t)level
{
  return self->_level;
}

- (PXZoomableInlineHeadersLayoutGeometrySource)geometrySource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_geometrySource);
  return (PXZoomableInlineHeadersLayoutGeometrySource *)WeakRetained;
}

- (void)setSpec:(id)a3
{
  v4 = (PXZoomableInlineHeadersLayoutSpec *)a3;
  spec = self->_spec;
  if (spec != v4)
  {
    v6 = v4;
    [(PXGLayout *)self safeAreaInsets];
    -[PXZoomableInlineHeadersLayoutSpec headerFloatMarginsForSafeAreaInsets:](spec, "headerFloatMarginsForSafeAreaInsets:");
    [(PXGLayout *)self safeAreaInsets];
    -[PXZoomableInlineHeadersLayoutSpec headerFloatMarginsForSafeAreaInsets:](v6, "headerFloatMarginsForSafeAreaInsets:");
    PXEdgeInsetsEqualToEdgeInsets();
  }
}

- (void)update
{
  p_updateFlags = &self->_updateFlags;
  self->_updateFlags.willPerformUpdate = 0;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (self->_updateFlags.isPerformingUpdate)
    {
      v5 = [MEMORY[0x1E4F28B00] currentHandler];
      v6 = [NSString stringWithUTF8String:"-[PXInlineHeadersSpriteLayout update]"];
      [v5 handleFailureInFunction:v6, @"PXZoomableInlineHeadersLayout.m", 247, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];

      unint64_t needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 1;
    if (needsUpdate)
    {
      p_updateFlags->unint64_t needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
      [(PXInlineHeadersSpriteLayout *)self _updateSprites];
      unint64_t needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    if (needsUpdate)
    {
      v7 = [MEMORY[0x1E4F28B00] currentHandler];
      v8 = [NSString stringWithUTF8String:"-[PXInlineHeadersSpriteLayout update]"];
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, @"PXZoomableInlineHeadersLayout.m", 251, @"still needing to update %lu after update pass", p_updateFlags->needsUpdate);
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)PXInlineHeadersSpriteLayout;
  [(PXGItemsLayout *)&v9 update];
}

- (void)_updateSprites
{
  int64_t v3 = [(PXGItemsLayout *)self numberOfItems];
  v4 = [(PXInlineHeadersSpriteLayout *)self dataSource];
  uint64_t v5 = [v4 numberOfSections];

  if (v3 != v5)
  {
    v6 = [(PXInlineHeadersSpriteLayout *)self dataSource];
    -[PXGItemsLayout setNumberOfItems:](self, "setNumberOfItems:", [v6 numberOfSections]);
  }
  [(PXGLayout *)self alpha];
  if (v7 != 0.0 || !self->_didHideSprites)
  {
    uint64_t v8 = [(PXGLayout *)self localNumberOfSprites];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __45__PXInlineHeadersSpriteLayout__updateSprites__block_invoke;
    v9[3] = &unk_1E5DBA978;
    v9[4] = self;
    [(PXGLayout *)self modifySpritesInRange:v8 << 32 state:v9];
  }
}

- (PXZoomableInlineHeadersDataSource)dataSource
{
  return self->_dataSource;
}

- (id)itemsInRect:(CGRect)a3 inLayout:(id)a4
{
  uint64_t v5 = -[PXInlineHeadersSpriteLayout axSpriteIndexesInRect:](self, "axSpriteIndexesInRect:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = [(PXGItemsLayout *)self itemsForSpriteIndexes:v5];

  return v6;
}

- (id)axSpriteIndexes
{
  if (!self->_axSpriteIndexes)
  {
    int64_t v3 = (NSIndexSet *)objc_msgSend(objc_alloc(MEMORY[0x1E4F28D60]), "initWithIndexesInRange:", 0, -[PXGLayout localNumberOfSprites](self, "localNumberOfSprites"));
    axSpriteIndexes = self->_axSpriteIndexes;
    self->_axSpriteIndexes = v3;
  }
  if (self->_didHideSprites) {
    uint64_t v5 = (NSIndexSet *)objc_alloc_init(MEMORY[0x1E4F28D60]);
  }
  else {
    uint64_t v5 = self->_axSpriteIndexes;
  }
  return v5;
}

- (void)visibleRectDidChange
{
  v8.receiver = self;
  v8.super_class = (Class)PXInlineHeadersSpriteLayout;
  [(PXGLayout *)&v8 visibleRectDidChange];
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 1;
      return;
    }
LABEL_5:
    if (self->_updateFlags.updated)
    {
      v6 = [MEMORY[0x1E4F28B00] currentHandler];
      double v7 = [NSString stringWithUTF8String:"-[PXInlineHeadersSpriteLayout visibleRectDidChange]"];
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXZoomableInlineHeadersLayout.m", 171, @"invalidating %lu after it already has been updated", 1);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 1;
  if (!willPerformUpdate) {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)displayScaleDidChange
{
  v8.receiver = self;
  v8.super_class = (Class)PXInlineHeadersSpriteLayout;
  [(PXGLayout *)&v8 displayScaleDidChange];
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 1;
      return;
    }
LABEL_5:
    if (self->_updateFlags.updated)
    {
      v6 = [MEMORY[0x1E4F28B00] currentHandler];
      double v7 = [NSString stringWithUTF8String:"-[PXInlineHeadersSpriteLayout displayScaleDidChange]"];
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXZoomableInlineHeadersLayout.m", 176, @"invalidating %lu after it already has been updated", 1);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 1;
  if (!willPerformUpdate) {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)alphaDidChange
{
  v8.receiver = self;
  v8.super_class = (Class)PXInlineHeadersSpriteLayout;
  [(PXGLayout *)&v8 alphaDidChange];
  self->_didHideSprites = 0;
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 1;
      return;
    }
LABEL_5:
    if (self->_updateFlags.updated)
    {
      v6 = [MEMORY[0x1E4F28B00] currentHandler];
      double v7 = [NSString stringWithUTF8String:"-[PXInlineHeadersSpriteLayout alphaDidChange]"];
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXZoomableInlineHeadersLayout.m", 182, @"invalidating %lu after it already has been updated", 1);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 1;
  if (!willPerformUpdate) {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)setDataSource:(id)a3
{
  uint64_t v5 = (PXZoomableInlineHeadersDataSource *)a3;
  if (self->_dataSource != v5)
  {
    double v7 = v5;
    objc_storeStrong((id *)&self->_dataSource, a3);
    axSpriteIndexes = self->_axSpriteIndexes;
    self->_axSpriteIndexes = 0;

    [(PXInlineHeadersSpriteLayout *)self _bumpMediaVersion];
    uint64_t v5 = v7;
  }
}

- (void)_bumpMediaVersion
{
  ++self->_mediaVersion;
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 1;
      return;
    }
LABEL_5:
    if (self->_updateFlags.updated)
    {
      uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
      v6 = [NSString stringWithUTF8String:"-[PXInlineHeadersSpriteLayout _bumpMediaVersion]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXZoomableInlineHeadersLayout.m", 243, @"invalidating %lu after it already has been updated", 1);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 1;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)setStyle:(unint64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    [(PXInlineHeadersSpriteLayout *)self _bumpMediaVersion];
  }
}

- (PXInlineHeadersSpriteLayout)initWithLevel:(unint64_t)a3
{
  v15.receiver = self;
  v15.super_class = (Class)PXInlineHeadersSpriteLayout;
  v4 = [(PXGItemsLayout *)&v15 init];
  uint64_t v5 = v4;
  if (v4)
  {
    v4->_level = a3;
    [(PXGLayout *)v4 setContentSource:v4];
    uint64_t v6 = [MEMORY[0x1E4F1C9A8] autoupdatingCurrentCalendar];
    calendar = v5->_calendar;
    v5->_calendar = (NSCalendar *)v6;

    [(PXInlineHeadersSpriteLayout *)v5 _setupDateFormatters];
    objc_super v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 addObserver:v5 selector:sel__currentLocaleChanged_ name:*MEMORY[0x1E4F1C370] object:0];

    p_updateFlags = (uint64_t *)&v5->_updateFlags;
    unint64_t needsUpdate = v5->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!v5->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        uint64_t *p_updateFlags = needsUpdate | 1;
        return v5;
      }
LABEL_6:
      if (v5->_updateFlags.updated)
      {
        v13 = [MEMORY[0x1E4F28B00] currentHandler];
        v14 = [NSString stringWithUTF8String:"-[PXInlineHeadersSpriteLayout initWithLevel:]"];
        objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, @"PXZoomableInlineHeadersLayout.m", 164, @"invalidating %lu after it already has been updated", 1);

        abort();
      }
      goto LABEL_7;
    }
    if (v5->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = v5->_updateFlags.willPerformUpdate;
    uint64_t *p_updateFlags = 1;
    if (!willPerformUpdate) {
      [(PXGLayout *)v5 setNeedsUpdate];
    }
  }
  return v5;
}

- (void)_setupDateFormatters
{
  id v9 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  int64_t v3 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
  [(NSDateFormatter *)v3 setLocale:v9];
  [(NSDateFormatter *)v3 setTimeStyle:0];
  [(NSDateFormatter *)v3 setLocalizedDateFormatFromTemplate:@"yyyy"];
  if (self->_level) {
    uint64_t v4 = 5;
  }
  else {
    uint64_t v4 = 2;
  }
  [(NSDateFormatter *)v3 setFormattingContext:v4];
  yearFormatter = self->_yearFormatter;
  self->_yearFormatter = v3;
  uint64_t v6 = v3;

  double v7 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
  [(NSDateFormatter *)v7 setLocale:v9];
  [(NSDateFormatter *)v7 setTimeStyle:0];
  [(NSDateFormatter *)v7 setLocalizedDateFormatFromTemplate:@"MMM"];
  [(NSDateFormatter *)v7 setFormattingContext:4];
  monthFormatter = self->_monthFormatter;
  self->_monthFormatter = v7;
}

- (void)setGeometrySource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_geometrySource);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_axSpriteIndexes, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_monthFormatter, 0);
  objc_storeStrong((id *)&self->_yearFormatter, 0);
}

- (unsigned)axSpriteIndexClosestToSpriteIndex:(unsigned int)a3 inDirection:(unint64_t)a4
{
  unsigned int v5 = -1;
  if (a4 - 4 < 2)
  {
    if ([(PXGLayout *)self localNumberOfSprites] - 1 > a3) {
      return a3 + 1;
    }
    else {
      return -1;
    }
  }
  else if (a4 == 6 || a4 == 3)
  {
    return a3 - 1;
  }
  return v5;
}

- (id)itemsBetweenItem:(int64_t)a3 andItem:(int64_t)a4
{
  return PXGItemsGeometryItemsBetweenItemAndItemDefaultImplementation(a3, a4);
}

- (int64_t)itemClosestToItem:(int64_t)a3 inDirection:(unint64_t)a4
{
  uint64_t v6 = [(PXGItemsLayout *)self numberOfItems];
  return PXGItemsGeometryItemClosestToItemVerticalGridDefaultImplementation(a3, a4, 1, v6);
}

- (id)viewUserDataForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v6 = [(PXInlineHeadersSpriteLayout *)self dataSource];
  uint64_t v7 = [v6 sectionInfos];
  uint64_t v8 = a3;

  id v9 = [(PXInlineHeadersSpriteLayout *)self level];
  uint64_t v10 = objc_msgSend(MEMORY[0x1E4F28C10], "px_shouldAlwaysDisplayYearBeforeMonthForCurrentLocale");
  v11 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceReferenceDate:*(double *)(v7 + 32 * v8 + 24)];
  if (v9)
  {
    v12 = [(NSDateFormatter *)self->_monthFormatter stringFromDate:v11];
    id v9 = [(NSDateFormatter *)self->_yearFormatter stringFromDate:v11];
  }
  else
  {
    v12 = [(NSDateFormatter *)self->_yearFormatter stringFromDate:v11];
  }
  v13 = [(PXInlineHeadersSpriteLayout *)self dataSource];
  uint64_t v14 = [v13 type];

  if (v14 == 2)
  {
    if (v9) {
      BOOL v15 = v12 == 0;
    }
    else {
      BOOL v15 = 1;
    }
    if (v15) {
      v16 = @"PXLibraryAllPhotosAddedOnYear";
    }
    else {
      v16 = @"PXLibraryAllPhotosAddedOnMonthYear";
    }
    v17 = PXLocalizedStringFromTable(v16, @"PhotosUICore");
    BOOL v18 = v9 != 0;
    if ([v17 hasPrefix:@"%"])
    {
      if ((v18 & ~v10) != 0) {
        v19 = v9;
      }
      else {
        v19 = v12;
      }
      uint64_t v20 = PXStringWithValidatedFormat();
      BOOL v21 = (v18 & ~v10) == 0;
    }
    else
    {
      if ((v10 & v18) != 0) {
        v19 = v9;
      }
      else {
        v19 = v12;
      }
      uint64_t v20 = PXStringWithValidatedFormat();
      BOOL v21 = (v10 & v18) == 0;
    }
    if (v21) {
      v12 = (void *)v20;
    }
    if (!v21) {
      id v9 = (void *)v20;
    }
  }
  v22 = [[PXZoomableInlineHeaderViewConfiguration alloc] initWithTitle:v12 subtitle:v9 swapTitleAndSubtitle:v10 style:[(PXInlineHeadersSpriteLayout *)self style]];

  return v22;
}

- (Class)viewClassForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  return (Class)objc_opt_class();
}

- (void)invalidateAnchorItemFrames
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 1;
      return;
    }
LABEL_5:
    if (self->_updateFlags.updated)
    {
      unsigned int v5 = [MEMORY[0x1E4F28B00] currentHandler];
      id v6 = [NSString stringWithUTF8String:"-[PXInlineHeadersSpriteLayout invalidateAnchorItemFrames]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXZoomableInlineHeadersLayout.m", 238, @"invalidating %lu after it already has been updated", 1);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 1;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_currentLocaleChanged:(id)a3
{
  [(PXInlineHeadersSpriteLayout *)self _setupDateFormatters];
  [(PXInlineHeadersSpriteLayout *)self _bumpMediaVersion];
}

@end