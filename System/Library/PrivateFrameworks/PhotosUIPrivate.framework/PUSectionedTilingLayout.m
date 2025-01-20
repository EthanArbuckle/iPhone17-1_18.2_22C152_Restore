@interface PUSectionedTilingLayout
- (BOOL)_scrollsHorizontallyNotVertically;
- (BOOL)isPrepared;
- (BOOL)leftToRight;
- (CGRect)boundsForSection:(int64_t)a3;
- (CGRect)contentBounds;
- (CGRect)visibleRectForScrollingToItemAtIndexPath:(id)a3 scrollPosition:(int64_t)a4;
- (CGSize)interSectionSpacing;
- (CGSize)sizeForSection:(int64_t)a3 numberOfItems:(int64_t)a4;
- (PUSectionedTilingLayout)initWithDataSource:(id)a3;
- (_NSRange)computedSections;
- (_PUSectionedTilingLayoutSectionInfo)_sectionInfoForSection:(int64_t)a3;
- (id)layoutInfosForTilesInRect:(CGRect)a3;
- (int64_t)_numberOfSections;
- (int64_t)numberOfItemsInSection:(int64_t)a3;
- (void)_computeSeedSectionIfNeeded;
- (void)_ensureComputedSectionsHaveBeenSeeded;
- (void)_invalidateNumberOfSections;
- (void)_markAllSectionInfosInvalid;
- (void)computeSectionsInRect:(CGRect)a3;
- (void)dealloc;
- (void)invalidateLayoutForUpdateWithItems:(id)a3;
- (void)invalidateSectionInfos;
- (void)prepareLayout;
- (void)setInterSectionSpacing:(CGSize)a3;
- (void)setLeftToRight:(BOOL)a3;
- (void)setVisibleRect:(CGRect)a3;
@end

@implementation PUSectionedTilingLayout

- (void)setLeftToRight:(BOOL)a3
{
  self->_leftToRight = a3;
}

- (BOOL)leftToRight
{
  return self->_leftToRight;
}

- (void)setInterSectionSpacing:(CGSize)a3
{
  self->_interSectionSpacing = a3;
}

- (CGSize)interSectionSpacing
{
  double width = self->_interSectionSpacing.width;
  double height = self->_interSectionSpacing.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)_markAllSectionInfosInvalid
{
  int64_t numberOfSections = self->_numberOfSections;
  if ((unint64_t)(numberOfSections - 1) <= 0x7FFFFFFFFFFFFFFDLL)
  {
    sectionInfos = self->_sectionInfos;
    do
    {
      sectionInfos->var0 = 0;
      ++sectionInfos;
      --numberOfSections;
    }
    while (numberOfSections);
  }
}

- (void)_invalidateNumberOfSections
{
  self->_int64_t numberOfSections = 0x7FFFFFFFFFFFFFFFLL;
}

- (void)invalidateSectionInfos
{
  NSUInteger location = self->_computedSections.location;
  self->_seedSection = location;
  if (location != 0x7FFFFFFFFFFFFFFFLL) {
    self->_seedSectionOrigin = (CGPoint)-[PUSectionedTilingLayout _sectionInfoForSection:](self, "_sectionInfoForSection:")[16];
  }
  [(PUSectionedTilingLayout *)self _markAllSectionInfosInvalid];
  self->_computedSections = (_NSRange)xmmword_1AEFF7D70;
}

- (int64_t)_numberOfSections
{
  int64_t result = self->_numberOfSections;
  if (result == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2, self, @"PUSectionedTilingLayout.m", 349, @"Invalid parameter not satisfying: %@", @"_numberOfSections != NSNotFound" object file lineNumber description];

    return self->_numberOfSections;
  }
  return result;
}

- (_PUSectionedTilingLayoutSectionInfo)_sectionInfoForSection:(int64_t)a3
{
  if (self->_numberOfSections == 0x7FFFFFFFFFFFFFFFLL)
  {
    v45 = [MEMORY[0x1E4F28B00] currentHandler];
    [v45 handleFailureInMethod:a2, self, @"PUSectionedTilingLayout.m", 274, @"_numberOfSections is NSNotFound, this is indicative of the layout not being prepared yet. Make sure the tiling view has performed a layout pass before asking the layout for information." object file lineNumber description];

    if ((a3 & 0x8000000000000000) == 0) {
      goto LABEL_3;
    }
  }
  else if ((a3 & 0x8000000000000000) == 0)
  {
    goto LABEL_3;
  }
  v46 = [MEMORY[0x1E4F28B00] currentHandler];
  [v46 handleFailureInMethod:a2, self, @"PUSectionedTilingLayout.m", 275, @"Invalid parameter not satisfying: %@", @"section >= 0" object file lineNumber description];

LABEL_3:
  if (self->_numberOfSections <= a3)
  {
    v47 = [MEMORY[0x1E4F28B00] currentHandler];
    [v47 handleFailureInMethod:a2, self, @"PUSectionedTilingLayout.m", 276, @"Invalid parameter not satisfying: %@", @"section < _numberOfSections" object file lineNumber description];
  }
  sectionInfos = self->_sectionInfos;
  v7 = &sectionInfos[a3];
  if (!v7->var0)
  {
    [(PUSectionedTilingLayout *)self interSectionSpacing];
    double v9 = v8;
    double v11 = v10;
    if ([(PUSectionedTilingLayout *)self _numberOfSections] <= a3)
    {
      uint64_t v14 = 0;
    }
    else
    {
      v12 = [(PUTilingLayout *)self dataSource];
      v13 = [MEMORY[0x1E4F28D58] indexPathWithIndex:a3];
      uint64_t v14 = [v12 numberOfSubItemsAtIndexPath:v13];
    }
    if (v14) {
      double v15 = v11;
    }
    else {
      double v15 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    }
    if (v14) {
      double v16 = v9;
    }
    else {
      double v16 = *MEMORY[0x1E4F1DB30];
    }
    -[PUSectionedTilingLayout sizeForSection:numberOfItems:](self, "sizeForSection:numberOfItems:", a3, v14, *MEMORY[0x1E4F1DB30]);
    double v18 = v17;
    double v20 = v19;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __50__PUSectionedTilingLayout__sectionInfoForSection___block_invoke;
    aBlock[3] = &unk_1E5F2BED8;
    aBlock[4] = self;
    aBlock[5] = a3;
    v21 = _Block_copy(aBlock);
    BOOL v22 = [(PUSectionedTilingLayout *)self leftToRight];
    p_computedSections = &self->_computedSections;
    NSUInteger location = self->_computedSections.location;
    if (location == 0x7FFFFFFFFFFFFFFFLL)
    {
      p_computedSections->NSUInteger location = a3;
      self->_computedSections.length = 1;
      if (self->_seedSection == a3) {
        p_seedSectionOrigin = &self->_seedSectionOrigin;
      }
      else {
        p_seedSectionOrigin = (CGPoint *)MEMORY[0x1E4F1DAD8];
      }
      double x = p_seedSectionOrigin->x;
      double y = p_seedSectionOrigin->y;
      goto LABEL_24;
    }
    BOOL v26 = v22;
    double x = *MEMORY[0x1E4F1DB28];
    double y = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    if (location <= a3)
    {
      unint64_t v34 = self->_computedSections.length + location;
      if (a3 < v34)
      {
        v35 = [MEMORY[0x1E4F28B00] currentHandler];
        [v35 handleFailureInMethod:a2 object:self file:@"PUSectionedTilingLayout.m" lineNumber:333 description:@"unexpected section"];

LABEL_24:
        v30 = &sectionInfos[a3];
        v30->var1 = v14;
        v30->var2.origin.double x = x;
        v30->var2.origin.double y = y;
        v30->var2.size.CGFloat width = v18;
        v30->var2.size.CGFloat height = v20;
        v7->var0 = 1;
        v49.NSUInteger location = p_computedSections->location;
        v49.length = self->_computedSections.length;
        v50.NSUInteger location = a3;
        v50.length = 1;
        NSRange v31 = NSUnionRange(v49, v50);
        p_computedSections->NSUInteger location = v31.location;
        self->_computedSections.length = v31.length;
        v32 = objc_alloc_init(PUTilingLayoutInvalidationContext);
        [(PUTilingLayoutInvalidationContext *)v32 invalidateContentBounds];
        [(PUTilingLayout *)self invalidateLayoutWithContext:v32];

        return v7;
      }
      (*((void (**)(void *, unint64_t))v21 + 2))(v21, a3 - v34);
      for (int64_t i = self->_computedSections.length + p_computedSections->location; i < a3 - 1; ++i)
        [(PUSectionedTilingLayout *)self _sectionInfoForSection:i];
      v43 = [(PUSectionedTilingLayout *)self _sectionInfoForSection:a3 - 1];
      BOOL v44 = [(PUSectionedTilingLayout *)self _scrollsHorizontallyNotVertically];
      CGFloat v38 = v43->var2.origin.x;
      CGFloat v39 = v43->var2.origin.y;
      CGFloat width = v43->var2.size.width;
      CGFloat height = v43->var2.size.height;
      if (!v44)
      {
        double y = v15 + CGRectGetMaxY(*(CGRect *)&v38);
        goto LABEL_24;
      }
      if (!v26)
      {
LABEL_30:
        double x = CGRectGetMinX(*(CGRect *)&v38) - v16 - v18;
        goto LABEL_24;
      }
    }
    else
    {
      (*((void (**)(void *, NSUInteger))v21 + 2))(v21, location + ~a3);
      for (int64_t j = p_computedSections->location - 1; j > a3 + 1; --j)
        [(PUSectionedTilingLayout *)self _sectionInfoForSection:j];
      v36 = [(PUSectionedTilingLayout *)self _sectionInfoForSection:a3 + 1];
      BOOL v37 = [(PUSectionedTilingLayout *)self _scrollsHorizontallyNotVertically];
      CGFloat v38 = v36->var2.origin.x;
      CGFloat v39 = v36->var2.origin.y;
      CGFloat width = v36->var2.size.width;
      CGFloat height = v36->var2.size.height;
      if (!v37)
      {
        double y = CGRectGetMinY(*(CGRect *)&v38) - v15 - v20;
        goto LABEL_24;
      }
      if (v26) {
        goto LABEL_30;
      }
    }
    double x = v16 + CGRectGetMaxX(*(CGRect *)&v38);
    goto LABEL_24;
  }
  return v7;
}

void __50__PUSectionedTilingLayout__sectionInfoForSection___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a2 >= 21)
  {
    v4 = PLUIGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(NSRange **)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      v7 = NSStringFromRange(v5[7]);
      int v8 = 134218754;
      uint64_t v9 = a2;
      __int16 v10 = 2112;
      double v11 = v5;
      __int16 v12 = 2048;
      uint64_t v13 = v6;
      __int16 v14 = 2112;
      double v15 = v7;
      _os_log_impl(&dword_1AE9F8000, v4, OS_LOG_TYPE_DEFAULT, "Computing at once a lot of missing sections (%li) for %@ (section: %li; computed range: %@)",
        (uint8_t *)&v8,
        0x2Au);
    }
  }
}

- (void)computeSectionsInRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(PUSectionedTilingLayout *)self _computeSeedSectionIfNeeded];
  [(PUSectionedTilingLayout *)self _ensureComputedSectionsHaveBeenSeeded];
  BOOL v8 = [(PUSectionedTilingLayout *)self leftToRight];
  p_computedSections = &self->_computedSections;
  int64_t location = self->_computedSections.location;
  if (location != 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v11 = v8;
    uint64_t v30 = 0;
    NSRange v31 = &v30;
    uint64_t v32 = 0x2020000000;
    v33 = 0;
    v33 = [(PUSectionedTilingLayout *)self _sectionInfoForSection:location];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __49__PUSectionedTilingLayout_computeSectionsInRect___block_invoke;
    aBlock[3] = &unk_1E5F2BEB0;
    BOOL v29 = v11;
    aBlock[4] = self;
    aBlock[5] = &v30;
    *(CGFloat *)&void aBlock[6] = x;
    *(CGFloat *)&aBlock[7] = y;
    *(CGFloat *)&aBlock[8] = width;
    *(CGFloat *)&aBlock[9] = height;
    __int16 v12 = (uint64_t (**)(void))_Block_copy(aBlock);
    while (1)
    {
      char v13 = v12[2](v12);
      char v14 = location > 0 ? v13 : 0;
      if ((v14 & 1) == 0) {
        break;
      }
      double v15 = [(PUSectionedTilingLayout *)self _sectionInfoForSection:--location];
      v31[3] = (uint64_t)v15;
    }
    NSUInteger v16 = p_computedSections->location;
    NSUInteger length = self->_computedSections.length;
    uint64_t v18 = p_computedSections->location + length - 1;
    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x2020000000;
    v27 = 0;
    v27 = [(PUSectionedTilingLayout *)self _sectionInfoForSection:v18];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __49__PUSectionedTilingLayout_computeSectionsInRect___block_invoke_2;
    v22[3] = &unk_1E5F2BEB0;
    BOOL v23 = v11;
    v22[4] = self;
    v22[5] = &v24;
    *(CGFloat *)&v22[6] = x;
    *(CGFloat *)&v22[7] = y;
    *(CGFloat *)&v22[8] = width;
    *(CGFloat *)&v22[9] = height;
    double v19 = (unsigned int (**)(void))_Block_copy(v22);
    for (NSUInteger i = length + v16;
          v19[2](v19) && (uint64_t)(i - 1) < [(PUSectionedTilingLayout *)self _numberOfSections] - 1;
          ++i)
    {
      v21 = [(PUSectionedTilingLayout *)self _sectionInfoForSection:i];
      v25[3] = (uint64_t)v21;
    }

    _Block_object_dispose(&v24, 8);
    _Block_object_dispose(&v30, 8);
  }
}

BOOL __49__PUSectionedTilingLayout_computeSectionsInRect___block_invoke(uint64_t a1)
{
  if (![*(id *)(a1 + 32) _scrollsHorizontallyNotVertically])
  {
    double MinY = CGRectGetMinY(*(CGRect *)(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) + 16));
    double MinX = CGRectGetMinY(*(CGRect *)(a1 + 48));
    return MinY > MinX;
  }
  v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  uint64_t v3 = v2[2];
  uint64_t v4 = v2[3];
  uint64_t v5 = v2[4];
  uint64_t v6 = v2[5];
  if (*(unsigned char *)(a1 + 80))
  {
    double MinY = CGRectGetMinX(*(CGRect *)&v3);
    double MinX = CGRectGetMinX(*(CGRect *)(a1 + 48));
    return MinY > MinX;
  }
  double MaxX = CGRectGetMaxX(*(CGRect *)&v3);
  return MaxX < CGRectGetMaxX(*(CGRect *)(a1 + 48));
}

BOOL __49__PUSectionedTilingLayout_computeSectionsInRect___block_invoke_2(uint64_t a1)
{
  if (![*(id *)(a1 + 32) _scrollsHorizontallyNotVertically])
  {
    double MaxY = CGRectGetMaxY(*(CGRect *)(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) + 16));
    double MaxX = CGRectGetMaxY(*(CGRect *)(a1 + 48));
    return MaxY < MaxX;
  }
  v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  uint64_t v3 = v2[2];
  uint64_t v4 = v2[3];
  uint64_t v5 = v2[4];
  uint64_t v6 = v2[5];
  if (*(unsigned char *)(a1 + 80))
  {
    double MaxY = CGRectGetMaxX(*(CGRect *)&v3);
    double MaxX = CGRectGetMaxX(*(CGRect *)(a1 + 48));
    return MaxY < MaxX;
  }
  double MinX = CGRectGetMinX(*(CGRect *)&v3);
  return MinX > CGRectGetMinX(*(CGRect *)(a1 + 48));
}

- (void)_computeSeedSectionIfNeeded
{
  if (self->_computedSections.location == 0x7FFFFFFFFFFFFFFFLL
    && self->_seedSection != 0x7FFFFFFFFFFFFFFFLL
    && self->_numberOfSections >= 1)
  {
    -[PUSectionedTilingLayout _sectionInfoForSection:](self, "_sectionInfoForSection:");
  }
  self->_seedSection = 0x7FFFFFFFFFFFFFFFLL;
}

- (void)_ensureComputedSectionsHaveBeenSeeded
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (self->_computedSections.location == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v3 = PLOneUpGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 138412546;
      uint64_t v5 = self;
      __int16 v6 = 2112;
      v7 = &stru_1F06BE7B8;
      _os_log_impl(&dword_1AE9F8000, v3, OS_LOG_TYPE_DEFAULT, "No sections have been seeded in sectioned layout %@. Seeding with section zero, but performance impact is unbounded. %@", (uint8_t *)&v4, 0x16u);
    }

    self->_seedSection = 0;
    [(PUSectionedTilingLayout *)self _computeSeedSectionIfNeeded];
  }
}

- (BOOL)_scrollsHorizontallyNotVertically
{
  int v4 = [(PUTilingLayout *)self preferredScrollInfo];
  unint64_t v5 = [v4 scrollDirections];
  unint64_t v6 = v5 & 2;
  if (((v5 >> 2) & 1) == ((v5 >> 1) & 1))
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PUSectionedTilingLayout.m", 207, @"sectioned layout should either scroll horizontally or vertically, but not in both directions" object file lineNumber description];
  }
  return v6 != 0;
}

- (CGSize)sizeForSection:(int64_t)a3 numberOfItems:(int64_t)a4
{
  unint64_t v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  [v6 handleFailureInMethod:a2 object:self file:@"PUSectionedTilingLayout.m" lineNumber:198 description:@"subclass must implement"];

  double v7 = *MEMORY[0x1E4F1DB30];
  double v8 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.CGFloat height = v8;
  result.CGFloat width = v7;
  return result;
}

- (_NSRange)computedSections
{
  p_computedSections = &self->_computedSections;
  NSUInteger location = self->_computedSections.location;
  NSUInteger length = p_computedSections->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  return (uint64_t)[(PUSectionedTilingLayout *)self _sectionInfoForSection:a3][8];
}

- (CGRect)boundsForSection:(int64_t)a3
{
  uint64_t v3 = [(PUSectionedTilingLayout *)self _sectionInfoForSection:a3];
  double x = v3->var2.origin.x;
  double y = v3->var2.origin.y;
  double width = v3->var2.size.width;
  double height = v3->var2.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)invalidateLayoutForUpdateWithItems:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PUSectionedTilingLayout;
  [(PUTilingLayout *)&v4 invalidateLayoutForUpdateWithItems:a3];
  [(PUSectionedTilingLayout *)self invalidateSectionInfos];
  [(PUSectionedTilingLayout *)self _invalidateNumberOfSections];
}

- (CGRect)visibleRectForScrollingToItemAtIndexPath:(id)a3 scrollPosition:(int64_t)a4
{
  unint64_t v5 = [(PUTilingLayout *)self layoutInfoForTileWithIndexPath:a3 kind:@"PUTileKindItemContent"];
  [v5 center];
  double v7 = v6;
  double v9 = v8;
  [(PUTilingLayout *)self visibleRect];
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  double v14 = v7 - v10 * 0.5;
  double v15 = v9 - v12 * 0.5;
  id v16 = -[PUSectionedTilingLayout layoutInfosForTilesInRect:](self, "layoutInfosForTilesInRect:", v14, v15);
  [(PUSectionedTilingLayout *)self contentBounds];
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  CGFloat v43 = v23;
  v44.origin.double x = v14;
  v44.origin.double y = v15;
  v44.size.double width = v11;
  v44.size.double height = v13;
  double Width = CGRectGetWidth(v44);
  v45.origin.double x = v18;
  v45.origin.double y = v20;
  v45.size.double width = v22;
  v45.size.double height = v43;
  double v25 = CGRectGetWidth(v45);
  if (Width >= v25) {
    double Width = v25;
  }
  v46.origin.double x = v14;
  v46.origin.double y = v15;
  v46.size.double width = Width;
  v46.size.double height = v13;
  double MinX = CGRectGetMinX(v46);
  v47.origin.double x = v18;
  v47.origin.double y = v20;
  v47.size.double width = v22;
  v47.size.double height = v43;
  double v27 = CGRectGetMinX(v47);
  if (MinX < v27) {
    double MinX = v27;
  }
  v48.origin.double x = MinX;
  v48.origin.double y = v15;
  v48.size.double width = Width;
  v48.size.double height = v13;
  double MaxX = CGRectGetMaxX(v48);
  v49.origin.double x = v18;
  v49.origin.double y = v20;
  v49.size.double width = v22;
  v49.size.double height = v43;
  double v29 = CGRectGetMaxX(v49);
  if (MaxX >= v29) {
    double MaxX = v29;
  }
  v50.origin.double x = MinX;
  v50.origin.double y = v15;
  v50.size.double width = Width;
  v50.size.double height = v13;
  double v30 = MaxX - CGRectGetWidth(v50);
  v51.origin.double x = v30;
  v51.origin.double y = v15;
  v51.size.double width = Width;
  v51.size.double height = v13;
  double Height = CGRectGetHeight(v51);
  v52.origin.double x = v18;
  v52.origin.double y = v20;
  v52.size.double width = v22;
  v52.size.double height = v43;
  double v32 = CGRectGetHeight(v52);
  if (Height >= v32) {
    double Height = v32;
  }
  v53.origin.double x = v30;
  v53.origin.double y = v15;
  v53.size.double width = Width;
  v53.size.double height = Height;
  double MinY = CGRectGetMinY(v53);
  v54.origin.double x = v18;
  v54.origin.double y = v20;
  v54.size.double width = v22;
  v54.size.double height = v43;
  double v34 = CGRectGetMinY(v54);
  if (MinY < v34) {
    double MinY = v34;
  }
  v55.origin.double x = v30;
  v55.origin.double y = MinY;
  v55.size.double width = Width;
  v55.size.double height = Height;
  double MaxY = CGRectGetMaxY(v55);
  v56.origin.double x = v18;
  v56.origin.double y = v20;
  v56.size.double width = v22;
  v56.size.double height = v43;
  double v36 = CGRectGetMaxY(v56);
  if (MaxY >= v36) {
    double v37 = v36;
  }
  else {
    double v37 = MaxY;
  }
  v57.origin.double x = v30;
  v57.origin.double y = MinY;
  v57.size.double width = Width;
  v57.size.double height = Height;
  double v38 = v37 - CGRectGetHeight(v57);

  double v39 = v30;
  double v40 = v38;
  double v41 = Width;
  double v42 = Height;
  result.size.double height = v42;
  result.size.double width = v41;
  result.origin.double y = v40;
  result.origin.double x = v39;
  return result;
}

- (id)layoutInfosForTilesInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  -[PUSectionedTilingLayout computeSectionsInRect:](self, "computeSectionsInRect:");
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  -[PUSectionedTilingLayout addLayoutInfosForSupplementaryTilesInRect:toSet:](self, "addLayoutInfosForSupplementaryTilesInRect:toSet:", v8, x, y, width, height);
  NSUInteger location = self->_computedSections.location;
  for (NSUInteger i = self->_computedSections.length + location;
        location < i;
        NSUInteger i = self->_computedSections.length + self->_computedSections.location)
  {
    CGRect v14 = (CGRect)[(PUSectionedTilingLayout *)self _sectionInfoForSection:location][16];
    v15.origin.double x = x;
    v15.origin.double y = y;
    v15.size.double width = width;
    v15.size.double height = height;
    if (CGRectIntersectsRect(v14, v15)) {
      -[PUSectionedTilingLayout addLayoutInfosForTilesInRect:section:toSet:](self, "addLayoutInfosForTilesInRect:section:toSet:", location, v8, x, y, width, height);
    }
    ++location;
  }
  CGFloat v11 = [v8 allObjects];

  return v11;
}

- (CGRect)contentBounds
{
  [(PUSectionedTilingLayout *)self _computeSeedSectionIfNeeded];
  [(PUSectionedTilingLayout *)self _ensureComputedSectionsHaveBeenSeeded];
  BOOL v3 = [(PUSectionedTilingLayout *)self leftToRight];
  int64_t location = self->_computedSections.location;
  if (location == 0x7FFFFFFFFFFFFFFFLL)
  {
    double v5 = *MEMORY[0x1E4F1DB28];
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  else
  {
    BOOL v9 = v3;
    NSUInteger v10 = location + self->_computedSections.length - 1;
    CGRect v40 = CGRectUnion((CGRect)[(PUSectionedTilingLayout *)self _sectionInfoForSection:self->_computedSections.location][16], (CGRect)[(PUSectionedTilingLayout *)self _sectionInfoForSection:v10][16]);
    double x = v40.origin.x;
    CGFloat y = v40.origin.y;
    double width = v40.size.width;
    CGFloat height = v40.size.height;
    uint64_t v14 = MEMORY[0x1E4FB2848];
    double v15 = *MEMORY[0x1E4FB2848];
    double v16 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v17 = *(double *)(MEMORY[0x1E4FB2848] + 24);
    [(PUSectionedTilingLayout *)self estimatedSectionSize];
    double v36 = v19;
    double v37 = v18;
    [(PUSectionedTilingLayout *)self interSectionSpacing];
    double v21 = v20;
    double v23 = v22;
    double v39 = height;
    if (location >= 1)
    {
      BOOL v24 = [(PUSectionedTilingLayout *)self _scrollsHorizontallyNotVertically];
      double v25 = (double)location;
      if (v24)
      {
        double v26 = (v37 + v21) * v25;
        if (v9) {
          double v16 = -v26;
        }
        else {
          double v17 = -(v26 - v21);
        }
      }
      else
      {
        double v15 = -((v36 + v23) * v25);
      }
    }
    double v27 = *(double *)(v14 + 16);
    int64_t v28 = [(PUSectionedTilingLayout *)self _numberOfSections] - 1;
    BOOL v29 = __OFSUB__(v28, v10);
    uint64_t v30 = v28 - v10;
    if ((v30 < 0) ^ v29 | (v30 == 0))
    {
      double v33 = y;
    }
    else
    {
      BOOL v31 = [(PUSectionedTilingLayout *)self _scrollsHorizontallyNotVertically];
      double v32 = (double)v30;
      double v33 = y;
      if (v31)
      {
        double v34 = -((v37 + v21) * v32 - v21);
        double v35 = -((v37 + v21) * v32);
        if (v9) {
          double v17 = v34;
        }
        else {
          double v16 = v35;
        }
      }
      else
      {
        double v27 = -(v32 * (v36 + v23) - v23);
      }
    }
    double v5 = x + v16;
    double v6 = v33 + v15;
    double v7 = width - (v16 + v17);
    double v8 = v39 - (v15 + v27);
  }
  result.size.CGFloat height = v8;
  result.size.double width = v7;
  result.origin.CGFloat y = v6;
  result.origin.double x = v5;
  return result;
}

- (void)prepareLayout
{
  v5.receiver = self;
  v5.super_class = (Class)PUSectionedTilingLayout;
  [(PUTilingLayout *)&v5 prepareLayout];
  if (self->_numberOfSections == 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v3 = [(PUTilingLayout *)self dataSource];
    objc_super v4 = objc_msgSend(MEMORY[0x1E4F28D58], "pu_rootIndexPath");
    self->_int64_t numberOfSections = [v3 numberOfSubItemsAtIndexPath:v4];

    self->_sectionInfos = (_PUSectionedTilingLayoutSectionInfo *)malloc_type_realloc(self->_sectionInfos, 48 * self->_numberOfSections, 0x1000040AC875A91uLL);
    [(PUSectionedTilingLayout *)self _markAllSectionInfosInvalid];
  }
}

- (BOOL)isPrepared
{
  return self->_numberOfSections != 0x7FFFFFFFFFFFFFFFLL;
}

- (void)setVisibleRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(PUTilingLayout *)self visibleRect];
  double v9 = v8;
  double v11 = v10;
  v14.receiver = self;
  v14.super_class = (Class)PUSectionedTilingLayout;
  -[PUTilingLayout setVisibleRect:](&v14, sel_setVisibleRect_, x, y, width, height);
  if (width != v9 || height != v11)
  {
    [(PUSectionedTilingLayout *)self invalidateSectionInfos];
    CGFloat v13 = objc_alloc_init(PUTilingLayoutInvalidationContext);
    [(PUTilingLayout *)self invalidateLayoutWithContext:v13];
  }
}

- (void)dealloc
{
  free(self->_sectionInfos);
  v3.receiver = self;
  v3.super_class = (Class)PUSectionedTilingLayout;
  [(PUSectionedTilingLayout *)&v3 dealloc];
}

- (PUSectionedTilingLayout)initWithDataSource:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PUSectionedTilingLayout;
  objc_super v3 = [(PUTilingLayout *)&v7 initWithDataSource:a3];
  objc_super v4 = v3;
  if (v3)
  {
    v3->_interSectionSpacing = (CGSize)vdupq_n_s64(0x4049000000000000uLL);
    v3->_int64_t numberOfSections = 0x7FFFFFFFFFFFFFFFLL;
    v3->_sectionInfos = 0;
    v3->_computedSections = (_NSRange)xmmword_1AEFF7D70;
    v3->_seedSection = 0x7FFFFFFFFFFFFFFFLL;
    objc_super v5 = [MEMORY[0x1E4FB1438] sharedApplication];
    v4->_leftToRight = [v5 userInterfaceLayoutDirection] == 0;
  }
  return v4;
}

@end