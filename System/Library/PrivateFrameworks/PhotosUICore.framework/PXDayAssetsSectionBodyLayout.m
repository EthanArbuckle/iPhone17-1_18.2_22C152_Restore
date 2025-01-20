@interface PXDayAssetsSectionBodyLayout
+ (CGSize)estimatedSizeWithReferenceSize:(CGSize)a3 spec:(id)a4 style:(int64_t)a5 numberOfAssets:(int64_t)a6;
- (CGRect)sectionRect;
- (CGSize)_minSizeOfDominantSprites;
- (CGSize)minPlayableSpriteSize;
- (CGSize)minimumItemSize;
- (CGSize)preferredReferenceSize;
- (PXDayAssetsSectionBodyLayout)init;
- (PXDayAssetsSectionBodyLayoutSpec)spec;
- (_PXGSpriteIndexRange)spriteIndexRangeCoveringRect:(CGRect)a3;
- (double)buildingRowContentHeight;
- (double)buildingRowSpacing;
- (id)_inputItemAtIndex:(unsigned int)a3;
- (id)exploreGenerator;
- (id)itemsBetweenItem:(int64_t)a3 andItem:(int64_t)a4;
- (id)itemsInRect:(CGRect)a3 inLayout:(id)a4;
- (id)newGenerator;
- (int64_t)_initialItemInDirection:(unint64_t)a3;
- (int64_t)_itemClosestToItem:(int64_t)a3 inDirection:(unint64_t)a4;
- (int64_t)itemClosestToItem:(int64_t)a3 inDirection:(unint64_t)a4;
- (int64_t)numberOfPrecedingAssets;
- (int64_t)style;
- (void)contentSizeDidChange;
- (void)enumerateHeroSpritesInRect:(CGRect)a3 usingBlock:(id)a4;
- (void)enumerateRowsWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)enumerateVisibleAnchoringSpriteIndexesUsingBlock:(id)a3;
- (void)referenceSizeDidChange;
- (void)safeAreaInsetsDidChange;
- (void)setNumberOfPrecedingAssets:(int64_t)a3;
- (void)setPreferredReferenceSize:(CGSize)a3;
- (void)setSpec:(id)a3;
- (void)setStyle:(int64_t)a3;
@end

@implementation PXDayAssetsSectionBodyLayout

- (void).cxx_destruct
{
}

- (CGSize)preferredReferenceSize
{
  double width = self->_preferredReferenceSize.width;
  double height = self->_preferredReferenceSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (int64_t)numberOfPrecedingAssets
{
  return self->_numberOfPrecedingAssets;
}

- (int64_t)style
{
  return self->_style;
}

- (PXDayAssetsSectionBodyLayoutSpec)spec
{
  return self->_spec;
}

- (id)itemsInRect:(CGRect)a3 inLayout:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = objc_alloc_init(MEMORY[0x1E4F28D60]);
  v10 = [(PXDayAssetsSectionBodyLayout *)self exploreGenerator];
  v11 = v10;
  if (v10)
  {
    uint64_t v12 = objc_msgSend(v10, "presentedItemsInRect:", x, y, width, height);

    id v9 = (id)v12;
  }

  return v9;
}

- (id)itemsBetweenItem:(int64_t)a3 andItem:(int64_t)a4
{
  id v7 = objc_alloc_init(MEMORY[0x1E4F28D60]);
  v8 = [(PXDayAssetsSectionBodyLayout *)self exploreGenerator];
  id v9 = v8;
  if (v8)
  {
    uint64_t v10 = [v8 presentedItemsBetweenItem:a3 andItem:a4];

    id v7 = (id)v10;
  }

  return v7;
}

- (int64_t)_itemClosestToItem:(int64_t)a3 inDirection:(unint64_t)a4
{
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x2020000000;
  uint64_t v41 = 0x7FFFFFFFFFFFFFFFLL;
  id v7 = [(PXDayAssetsSectionBodyLayout *)self exploreGenerator];
  v8 = v7;
  if (!v7) {
    goto LABEL_19;
  }
  [v7 presentedRectForItemAtIndex:a3];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  long long v36 = 0u;
  long long v37 = 0u;
  [v8 presentedItemLocationForItemAtIndex:a3];
  v42.origin.double x = v10;
  v42.origin.double y = v12;
  v42.size.double width = v14;
  v42.size.double height = v16;
  if (CGRectEqualToRect(v42, *MEMORY[0x1E4F1DB20]))
  {
LABEL_19:
    v18 = v39;
    goto LABEL_20;
  }
  if (a4 - 5 > 1)
  {
    uint64_t v19 = [v8 presentedNumberOfColumnsAtRow:(void)v36];
    switch(a4)
    {
      case 1uLL:
        double v20 = 0.0;
        double v21 = -1.0;
        if ((uint64_t)v36 <= 0) {
          double v21 = 0.0;
        }
        break;
      case 2uLL:
        uint64_t v22 = [v8 presentedNumberOfRows];
        double v20 = 0.0;
        double v21 = 1.0;
        if ((uint64_t)v36 >= v22) {
          double v21 = 0.0;
        }
        break;
      case 3uLL:
        double v20 = -1.0;
        double v21 = 0.0;
        if (!*((void *)&v36 + 1)) {
          double v20 = 0.0;
        }
        break;
      case 4uLL:
        double v21 = 0.0;
        double v20 = 1.0;
        if (*((void *)&v37 + 1) + *((void *)&v36 + 1) >= v19) {
          double v20 = 0.0;
        }
        break;
      default:
        double v21 = 0.0;
        double v20 = 0.0;
        break;
    }
    v23 = -[PXDayAssetsSectionBodyLayout itemsInRect:inLayout:](self, "itemsInRect:inLayout:", self, v10 + v14 * v20, v12 + v16 * v21, v14, v16);
    v35[0] = 0;
    v35[1] = v35;
    v35[2] = 0x2020000000;
    v35[3] = 0x7FEFFFFFFFFFFFFFLL;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __63__PXDayAssetsSectionBodyLayout__itemClosestToItem_inDirection___block_invoke;
    v26[3] = &unk_1E5DC97A8;
    int64_t v30 = a3;
    double v31 = v10;
    double v32 = v12;
    double v33 = v14;
    double v34 = v16;
    id v27 = v8;
    v28 = v35;
    v29 = &v38;
    [v23 enumerateIndexesUsingBlock:v26];

    _Block_object_dispose(v35, 8);
    goto LABEL_19;
  }
  uint64_t v17 = [v8 itemIndexForItem:a3 inDirection:a4];
  v18 = v39;
  v39[3] = v17;
LABEL_20:
  int64_t v24 = v18[3];

  _Block_object_dispose(&v38, 8);
  return v24;
}

uint64_t __63__PXDayAssetsSectionBodyLayout__itemClosestToItem_inDirection___block_invoke(uint64_t result, uint64_t a2)
{
  if (*(void *)(result + 56) != a2)
  {
    [*(id *)(result + 32) presentedRectForItemAtIndex:a2];
    PXRectGetCenter();
  }
  return result;
}

- (int64_t)_initialItemInDirection:(unint64_t)a3
{
  v5 = [(PXDayAssetsSectionBodyLayout *)self exploreGenerator];
  int64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  if (v5 && a3 <= 6)
  {
    if (((1 << a3) & 0x34) != 0)
    {
      int64_t v7 = 0;
      goto LABEL_7;
    }
    if (((1 << a3) & 0x4A) != 0)
    {
      int64_t v7 = [(PXGItemsLayout *)self numberOfItems] - 1;
LABEL_7:
      int64_t v6 = [v5 itemIndexForPresentedItemIndex:v7];
    }
  }

  return v6;
}

- (int64_t)itemClosestToItem:(int64_t)a3 inDirection:(unint64_t)a4
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL) {
    return [(PXDayAssetsSectionBodyLayout *)self _initialItemInDirection:a4];
  }
  else {
    return [(PXDayAssetsSectionBodyLayout *)self _itemClosestToItem:a3 inDirection:a4];
  }
}

- (void)enumerateRowsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  unsigned int v4 = a3;
  int64_t v6 = (void (**)(id, unsigned char *, double, double, double, double))a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  id v8 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  [(PXGLayout *)self displayScale];
  double v10 = v9;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__PXDayAssetsSectionBodyLayout_enumerateRowsWithOptions_usingBlock___block_invoke;
  aBlock[3] = &__block_descriptor_40_e30_v24__0d8__NSMutableIndexSet_16l;
  *(double *)&aBlock[4] = v9;
  double v11 = (void (**)(void *, id, double))_Block_copy(aBlock);
  double v12 = [(PXGGeneratedLayout *)self generator];
  int64_t v13 = [v12 itemCount];
  double v14 = (double *)malloc_type_calloc(v13, 0x98uLL, 0x100004050011849uLL);
  v28 = v12;
  objc_msgSend(v12, "getGeometries:inRange:withKind:", v14, 0, v13, 0);
  if (v13 >= 1)
  {
    double v15 = v14 + 4;
    do
    {
      double v16 = *(v15 - 2);
      double v17 = *v15;
      v15 += 19;
      v11[2](v11, v7, v16 - v17 * 0.5);
      v11[2](v11, v8, v16 + v17 * 0.5);
      --v13;
    }
    while (v13);
  }
  free(v14);
  int v18 = (v4 >> 1) & 1;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __68__PXDayAssetsSectionBodyLayout_enumerateRowsWithOptions_usingBlock___block_invoke_2;
  v32[3] = &__block_descriptor_33_e20_q16__0__NSIndexSet_8l;
  BOOL v33 = (v4 & 2) != 0;
  uint64_t v19 = (uint64_t (**)(void *, id))_Block_copy(v32);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __68__PXDayAssetsSectionBodyLayout_enumerateRowsWithOptions_usingBlock___block_invoke_3;
  v30[3] = &__block_descriptor_33_e23_q24__0q8__NSIndexSet_16l;
  char v31 = v18;
  double v20 = (uint64_t (**)(void *, uint64_t, id))_Block_copy(v30);
  uint64_t v21 = v19[2](v19, v7);
  uint64_t v22 = v19[2](v19, v8);
  [(PXGLayout *)self contentSize];
  if (v21 != 0x7FFFFFFFFFFFFFFFLL && v22 != 0x7FFFFFFFFFFFFFFFLL)
  {
    double v24 = v23;
    double v25 = *MEMORY[0x1E4F1DAD8];
    do
    {
      char v29 = 0;
      v6[2](v6, &v29, v25, v10 * (double)v21, v24, -(v10 * (double)v21 - (double)v22 * v10));
      if (v29) {
        break;
      }
      uint64_t v21 = v20[2](v20, v21, v7);
      uint64_t v26 = v20[2](v20, v22, v8);
      uint64_t v22 = v26;
    }
    while (v21 != 0x7FFFFFFFFFFFFFFFLL && v26 != 0x7FFFFFFFFFFFFFFFLL);
  }
}

uint64_t __68__PXDayAssetsSectionBodyLayout_enumerateRowsWithOptions_usingBlock___block_invoke(uint64_t a1, void *a2, double a3)
{
  return [a2 addIndex:vcvtad_u64_f64(a3 / *(double *)(a1 + 32))];
}

uint64_t __68__PXDayAssetsSectionBodyLayout_enumerateRowsWithOptions_usingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  if (*(unsigned char *)(a1 + 32)) {
    return [a2 lastIndex];
  }
  else {
    return [a2 firstIndex];
  }
}

uint64_t __68__PXDayAssetsSectionBodyLayout_enumerateRowsWithOptions_usingBlock___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  if (*(unsigned char *)(a1 + 32)) {
    return [a3 indexLessThanIndex:a2];
  }
  else {
    return [a3 indexGreaterThanIndex:a2];
  }
}

- (double)buildingRowSpacing
{
  if ((unint64_t)([(PXDayAssetsSectionBodyLayout *)self style] - 3) <= 2)
  {
    unsigned int v4 = [(PXGGeneratedLayout *)self generator];
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
LABEL_4:
        v5 = [v4 metrics];
        [v5 interitemSpacing];
        double v7 = v6;

        return v7;
      }
      double v9 = [MEMORY[0x1E4F28B00] currentHandler];
      double v12 = (objc_class *)objc_opt_class();
      double v11 = NSStringFromClass(v12);
      int64_t v13 = objc_msgSend(v4, "px_descriptionForAssertionMessage");
      [v9 handleFailureInMethod:a2, self, @"PXDayAssetsSectionBodyLayout.m", 451, @"%@ should be an instance inheriting from %@, but it is %@", @"self.generator", v11, v13 object file lineNumber description];
    }
    else
    {
      double v9 = [MEMORY[0x1E4F28B00] currentHandler];
      double v10 = (objc_class *)objc_opt_class();
      double v11 = NSStringFromClass(v10);
      [v9 handleFailureInMethod:a2, self, @"PXDayAssetsSectionBodyLayout.m", 451, @"%@ should be an instance inheriting from %@, but it is nil", @"self.generator", v11 object file lineNumber description];
    }

    goto LABEL_4;
  }
  return 0.0;
}

- (double)buildingRowContentHeight
{
  double v4 = 0.0;
  if ((unint64_t)([(PXDayAssetsSectionBodyLayout *)self style] - 3) <= 2)
  {
    v5 = [(PXGGeneratedLayout *)self generator];
    if (v5)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
LABEL_4:
        [v5 buildingBlockSize];
        double v4 = v6;

        return v4;
      }
      id v8 = [MEMORY[0x1E4F28B00] currentHandler];
      double v11 = (objc_class *)objc_opt_class();
      double v10 = NSStringFromClass(v11);
      double v12 = objc_msgSend(v5, "px_descriptionForAssertionMessage");
      [v8 handleFailureInMethod:a2, self, @"PXDayAssetsSectionBodyLayout.m", 432, @"%@ should be an instance inheriting from %@, but it is %@", @"self.generator", v10, v12 object file lineNumber description];
    }
    else
    {
      id v8 = [MEMORY[0x1E4F28B00] currentHandler];
      double v9 = (objc_class *)objc_opt_class();
      double v10 = NSStringFromClass(v9);
      [v8 handleFailureInMethod:a2, self, @"PXDayAssetsSectionBodyLayout.m", 432, @"%@ should be an instance inheriting from %@, but it is nil", @"self.generator", v10 object file lineNumber description];
    }

    goto LABEL_4;
  }
  return v4;
}

- (CGSize)minPlayableSpriteSize
{
  v3 = [(PXDayAssetsSectionBodyLayout *)self spec];
  char v4 = [v3 allowsVideoPlaybackAtAnySize];

  if (v4)
  {
    double v5 = *MEMORY[0x1E4F1DB30];
    double v6 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  else
  {
    [(PXDayAssetsSectionBodyLayout *)self _minSizeOfDominantSprites];
  }
  result.double height = v6;
  result.double width = v5;
  return result;
}

- (void)enumerateHeroSpritesInRect:(CGRect)a3 usingBlock:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  [(PXDayAssetsSectionBodyLayout *)self minimumItemSize];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __70__PXDayAssetsSectionBodyLayout_enumerateHeroSpritesInRect_usingBlock___block_invoke;
  v13[3] = &unk_1E5DC9720;
  uint64_t v15 = v10;
  uint64_t v16 = v11;
  id v14 = v9;
  id v12 = v9;
  -[PXGLayout enumerateSpritesInRect:usingBlock:](self, "enumerateSpritesInRect:usingBlock:", v13, x, y, width, height);
}

void __70__PXDayAssetsSectionBodyLayout_enumerateHeroSpritesInRect_usingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (*(unsigned char *)(a6 + 1) == 2) {
    PXRectWithCenterAndSize();
  }
}

- (void)enumerateVisibleAnchoringSpriteIndexesUsingBlock:(id)a3
{
  id v4 = a3;
  [(PXGLayout *)self visibleRect];
  [(PXGLayout *)self safeAreaInsets];
  double v5 = +[PXCuratedLibrarySettings sharedInstance];
  [v5 topInsetForVisibilityAnchoring];

  PXEdgeInsetsInsetRect();
}

void __81__PXDayAssetsSectionBodyLayout_enumerateVisibleAnchoringSpriteIndexesUsingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  id v8 = a7;
  if (*(unsigned char *)(a6 + 1) == 2) {
    PXRectWithCenterAndSize();
  }
}

- (CGSize)_minSizeOfDominantSprites
{
  int64_t v4 = [(PXDayAssetsSectionBodyLayout *)self style];
  if ((unint64_t)(v4 - 3) < 3)
  {
    double v5 = [(PXGGeneratedLayout *)self generator];
    if (v5)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
LABEL_4:
        [v5 headerItemSize];
        double v7 = v6;
        double v9 = v8;
        [v5 minHeroItemsSize];
        if (v7 >= v10) {
          double v7 = v10;
        }
        if (v9 >= v11) {
          double v9 = v11;
        }
        goto LABEL_11;
      }
      uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v19 = (objc_class *)objc_opt_class();
      int v18 = NSStringFromClass(v19);
      double v20 = objc_msgSend(v5, "px_descriptionForAssertionMessage");
      [v16 handleFailureInMethod:a2, self, @"PXDayAssetsSectionBodyLayout.m", 320, @"%@ should be an instance inheriting from %@, but it is %@", @"self.generator", v18, v20 object file lineNumber description];
    }
    else
    {
      uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
      double v17 = (objc_class *)objc_opt_class();
      int v18 = NSStringFromClass(v17);
      [v16 handleFailureInMethod:a2, self, @"PXDayAssetsSectionBodyLayout.m", 320, @"%@ should be an instance inheriting from %@, but it is nil", @"self.generator", v18 object file lineNumber description];
    }

    goto LABEL_4;
  }
  if ((unint64_t)(v4 - 1) > 1)
  {
    double v7 = 1.79769313e308;
    double v9 = 1.79769313e308;
    goto LABEL_12;
  }
  double v5 = [(PXGGeneratedLayout *)self generator];
  [v5 size];
  double v7 = v12;
  double v9 = v13;
LABEL_11:

LABEL_12:
  double v14 = v7;
  double v15 = v9;
  result.double height = v15;
  result.double width = v14;
  return result;
}

- (CGSize)minimumItemSize
{
  int64_t v4 = [(PXDayAssetsSectionBodyLayout *)self style];
  if ((unint64_t)(v4 - 3) >= 3)
  {
    if ((unint64_t)(v4 - 1) > 1)
    {
      double v7 = *(double *)off_1E5DAB030;
      double v9 = *((double *)off_1E5DAB030 + 1);
      goto LABEL_10;
    }
    double v10 = [(PXGGeneratedLayout *)self generator];
    double v5 = [v10 metrics];

    if (v5)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
LABEL_8:
        [v5 referenceSize];
        double v12 = v11;
        [v5 interitemSpacing];
        double v14 = (v12 + v13) / (double)[v5 numberOfColumns];
        [v5 interitemSpacing];
        double v7 = v14 - v15;
        [v5 itemAspectRatio];
        double v9 = v7 / v16;
        goto LABEL_9;
      }
      double v24 = [MEMORY[0x1E4F28B00] currentHandler];
      id v27 = (objc_class *)objc_opt_class();
      uint64_t v26 = NSStringFromClass(v27);
      v28 = objc_msgSend(v5, "px_descriptionForAssertionMessage");
      [v24 handleFailureInMethod:a2, self, @"PXDayAssetsSectionBodyLayout.m", 288, @"%@ should be an instance inheriting from %@, but it is %@", @"self.generator.metrics", v26, v28 object file lineNumber description];
    }
    else
    {
      double v24 = [MEMORY[0x1E4F28B00] currentHandler];
      double v25 = (objc_class *)objc_opt_class();
      uint64_t v26 = NSStringFromClass(v25);
      [v24 handleFailureInMethod:a2, self, @"PXDayAssetsSectionBodyLayout.m", 288, @"%@ should be an instance inheriting from %@, but it is nil", @"self.generator.metrics", v26 object file lineNumber description];
    }

    goto LABEL_8;
  }
  double v5 = [(PXGGeneratedLayout *)self generator];
  if (!v5)
  {
    uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
    double v20 = (objc_class *)objc_opt_class();
    uint64_t v21 = NSStringFromClass(v20);
    [v19 handleFailureInMethod:a2, self, @"PXDayAssetsSectionBodyLayout.m", 296, @"%@ should be an instance inheriting from %@, but it is nil", @"self.generator", v21 object file lineNumber description];
LABEL_14:

    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v22 = (objc_class *)objc_opt_class();
    uint64_t v21 = NSStringFromClass(v22);
    double v23 = objc_msgSend(v5, "px_descriptionForAssertionMessage");
    [v19 handleFailureInMethod:a2, self, @"PXDayAssetsSectionBodyLayout.m", 296, @"%@ should be an instance inheriting from %@, but it is %@", @"self.generator", v21, v23 object file lineNumber description];

    goto LABEL_14;
  }
LABEL_4:
  [v5 minimumItemSize];
  double v7 = v6;
  double v9 = v8;
LABEL_9:

LABEL_10:
  double v17 = v7;
  double v18 = v9;
  result.double height = v18;
  result.double width = v17;
  return result;
}

- (CGRect)sectionRect
{
  [(PXGLayout *)self contentSize];
  [(PXGGeneratedLayout *)self padding];
  PXEdgeInsetsInsetRect();
}

- (_PXGSpriteIndexRange)spriteIndexRangeCoveringRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  unint64_t v9 = [(PXDayAssetsSectionBodyLayout *)self style];
  if (v9 > 8) {
    return (_PXGSpriteIndexRange)0;
  }
  if (((1 << v9) & 0x1F9) != 0) {
    return *(_PXGSpriteIndexRange *)off_1E5DAAF80;
  }
  if (![(PXGLayout *)self needsUpdate])
  {
    double v13 = [(PXGGeneratedLayout *)self generator];
    if (v13)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
LABEL_12:
        unsigned int v14 = objc_msgSend(v13, "geometriesRangeCoveringRect:", x, y, width, height);
        unsigned int v16 = v15;

        return (_PXGSpriteIndexRange)(v14 | ((unint64_t)v16 << 32));
      }
      double v17 = [MEMORY[0x1E4F28B00] currentHandler];
      double v20 = (objc_class *)objc_opt_class();
      uint64_t v19 = NSStringFromClass(v20);
      uint64_t v21 = objc_msgSend(v13, "px_descriptionForAssertionMessage");
      [v17 handleFailureInMethod:a2, self, @"PXDayAssetsSectionBodyLayout.m", 254, @"%@ should be an instance inheriting from %@, but it is %@", @"self.generator", v19, v21 object file lineNumber description];
    }
    else
    {
      double v17 = [MEMORY[0x1E4F28B00] currentHandler];
      double v18 = (objc_class *)objc_opt_class();
      uint64_t v19 = NSStringFromClass(v18);
      [v17 handleFailureInMethod:a2, self, @"PXDayAssetsSectionBodyLayout.m", 254, @"%@ should be an instance inheriting from %@, but it is nil", @"self.generator", v19 object file lineNumber description];
    }

    goto LABEL_12;
  }
  double v12 = PLCuratedLibraryGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_DEFAULT, "Requesting spriteIndexRangeCoveringRect on layout that is not up to date.", buf, 2u);
  }

  v22.receiver = self;
  v22.super_class = (Class)PXDayAssetsSectionBodyLayout;
  return (_PXGSpriteIndexRange)-[PXGLayout spriteIndexRangeCoveringRect:](&v22, sel_spriteIndexRangeCoveringRect_, x, y, width, height);
}

- (void)contentSizeDidChange
{
  v6.receiver = self;
  v6.super_class = (Class)PXDayAssetsSectionBodyLayout;
  [(PXGLayout *)&v6 contentSizeDidChange];
  switch([(PXDayAssetsSectionBodyLayout *)self style])
  {
    case 0:
      [(PXGLayout *)self setLastBaseline:0.0];
      break;
    case 1:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
      v3 = [(PXGGeneratedLayout *)self generator];
      [v3 size];
      double v5 = v4;
      goto LABEL_3;
    case 2:
      v3 = [(PXGGeneratedLayout *)self generator];
      [v3 lastFullRowBottomEdge];
LABEL_3:
      [(PXGLayout *)self setLastBaseline:v5];

      break;
    default:
      return;
  }
}

- (id)_inputItemAtIndex:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  double v5 = [(PXGItemsLayout *)self delegate];
  objc_super v6 = [v5 generatedLayout:self inputItemAtIndex:v3];

  return v6;
}

- (id)exploreGenerator
{
  v2 = [(PXGGeneratedLayout *)self generator];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (id)newGenerator
{
  int64_t v4 = [(PXDayAssetsSectionBodyLayout *)self style];
  double v5 = [(PXDayAssetsSectionBodyLayout *)self spec];
  [v5 interitemSpacing];
  double v7 = v6;
  [v5 bodyCornerRadius];
  -[PXGGeneratedLayout setCornerRadius:](self, "setCornerRadius:");
  [(PXGLayout *)self referenceSize];
  double v9 = v8;
  double v11 = v10;
  [(PXDayAssetsSectionBodyLayout *)self preferredReferenceSize];
  if (v12 != *MEMORY[0x1E4F1DB30] || v13 != *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    double v11 = v13;
    double v9 = v12;
  }
  switch(v4)
  {
    case 0:
      v35 = [MEMORY[0x1E4F28B00] currentHandler];
      [v35 handleFailureInMethod:a2 object:self file:@"PXDayAssetsSectionBodyLayout.m" lineNumber:112 description:@"None style is not supported"];

      abort();
    case 1:
    case 2:
      unsigned int v15 = objc_alloc_init(PXCuratedLibraryGridLayoutMetrics);
      -[PXCuratedLibraryGridLayoutMetrics setNumberOfColumns:](v15, "setNumberOfColumns:", [v5 numberOfColumns]);
      [(PXCuratedLibraryGridLayoutMetrics *)v15 setInteritemSpacing:v7];
      [(PXGGeneratedLayout *)self padding];
      -[PXCuratedLibraryGridLayoutMetrics setPadding:](v15, "setPadding:");
      [(PXGLayout *)self displayScale];
      -[PXCuratedLibraryGridLayoutMetrics setScreenScale:](v15, "setScreenScale:");
      -[PXLayoutMetrics setReferenceSize:](v15, "setReferenceSize:", v9, v11);
      [(PXCuratedLibraryGridLayoutMetrics *)v15 setNumberOfPrecedingAssets:[(PXDayAssetsSectionBodyLayout *)self numberOfPrecedingAssets]];
      uint64_t v19 = [[PXCuratedLibraryGridLayoutGenerator alloc] initWithMetrics:v15];
      [(PXCuratedLibraryGridLayoutGenerator *)v19 setItemCount:[(PXGItemsLayout *)self numberOfItems]];
      [(PXCuratedLibraryGridLayoutGenerator *)v19 setKeyItemIndex:0x7FFFFFFFFFFFFFFFLL];
      goto LABEL_19;
    case 3:
    case 4:
    case 5:
      unsigned int v14 = [[PXExploreLayoutMetrics alloc] initWithSpec:v5];
      unsigned int v15 = (PXCuratedLibraryGridLayoutMetrics *)v14;
      if (v4 == 4)
      {
        uint64_t v16 = 1;
      }
      else
      {
        if (v4 != 5) {
          goto LABEL_15;
        }
        [(PXExploreLayoutMetrics *)v14 setLargeHeroDensity:0];
        [(PXCuratedLibraryGridLayoutMetrics *)v15 setAllowHeaders:0];
        uint64_t v16 = 3;
      }
      [(PXCuratedLibraryGridLayoutMetrics *)v15 setLayoutSubtype:v16];
LABEL_15:
      [(PXGGeneratedLayout *)self padding];
      double v21 = v20;
      double v23 = v22;
      double v25 = v24;
      double v27 = v26;
      if ([v5 useHorizontalContentGuideInsets])
      {
        [v5 contentGuideInsetsForScrollAxis:1];
        double v29 = v28;
        double v31 = v9 - (v28 + v30);
      }
      else
      {
        [v5 horizontalMargin];
        double v29 = v32;
        [v5 horizontalMargin];
        double v31 = v9 + v33 * -2.0;
      }
      -[PXLayoutMetrics setReferenceSize:](v15, "setReferenceSize:", v31, v11);
      [(PXCuratedLibraryGridLayoutMetrics *)v15 setInteritemSpacing:v7];
      -[PXCuratedLibraryGridLayoutMetrics setPadding:](v15, "setPadding:", v21, v23 + v29, v25, v27);
      objc_initWeak(&location, self);
      uint64_t v19 = [[PXExploreLayoutGenerator alloc] initWithMetrics:v15];
      [(PXCuratedLibraryGridLayoutGenerator *)v19 setItemCount:[(PXGItemsLayout *)self numberOfItems]];
      [(PXCuratedLibraryGridLayoutGenerator *)v19 setKeyItemIndex:[(PXGGeneratedLayout *)self keyItemIndex]];
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __44__PXDayAssetsSectionBodyLayout_newGenerator__block_invoke;
      v39[3] = &unk_1E5DCAB40;
      objc_copyWeak(&v40, &location);
      [(PXCuratedLibraryGridLayoutGenerator *)v19 setItemLayoutInfoBlock:v39];
      objc_destroyWeak(&v40);
      objc_destroyWeak(&location);
LABEL_19:

LABEL_20:
      return v19;
    case 6:
    case 7:
    case 8:
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __44__PXDayAssetsSectionBodyLayout_newGenerator__block_invoke_2;
      aBlock[3] = &unk_1E5DC96D0;
      aBlock[4] = self;
      aBlock[5] = a2;
      unsigned int v15 = (PXCuratedLibraryGridLayoutMetrics *)_Block_copy(aBlock);
      double v17 = objc_alloc_init(PXSmallCollectionLayoutMetrics);
      [(PXSmallCollectionLayoutMetrics *)v17 setStyle:(*(uint64_t (**)(PXCuratedLibraryGridLayoutMetrics *, int64_t))&v15->super._referenceSize.height)(v15, v4)];
      -[PXLayoutMetrics setReferenceSize:](v17, "setReferenceSize:", v9, v11);
      if ((unint64_t)(v4 - 7) < 2) {
        double v7 = 6.0;
      }
      if (v4 == 6)
      {
        double v18 = +[PXLemonadeSettings sharedInstance];
        [v18 detailsViewHeaderAspectRatio];
        -[PXSmallCollectionLayoutMetrics setHeaderAspectRatio:](v17, "setHeaderAspectRatio:");
      }
      [(PXSmallCollectionLayoutMetrics *)v17 setInteritemSpacing:v7];
      [(PXGLayout *)self safeAreaInsets];
      -[PXSmallCollectionLayoutMetrics setSafeAreaInsets:](v17, "setSafeAreaInsets:");
      [(PXSmallCollectionLayoutMetrics *)v17 setEdgesForExtendedLayout:*(void *)off_1E5DAAF18 | 1];
      [(PXGGeneratedLayout *)self padding];
      -[PXSmallCollectionLayoutMetrics setPadding:](v17, "setPadding:");
      objc_initWeak(&location, self);
      uint64_t v19 = [[PXSmallCollectionLayoutGenerator alloc] initWithNumberOfItems:[(PXGItemsLayout *)self numberOfItems] metrics:v17];
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __44__PXDayAssetsSectionBodyLayout_newGenerator__block_invoke_3;
      v36[3] = &unk_1E5DCAB40;
      objc_copyWeak(&v37, &location);
      [(PXCuratedLibraryGridLayoutGenerator *)v19 setItemLayoutInfoBlock:v36];
      objc_destroyWeak(&v37);
      objc_destroyWeak(&location);

      goto LABEL_19;
    default:
      uint64_t v19 = 0;
      goto LABEL_20;
  }
}

id __44__PXDayAssetsSectionBodyLayout_newGenerator__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int64_t v4 = [WeakRetained _inputItemAtIndex:a2];

  return v4;
}

uint64_t __44__PXDayAssetsSectionBodyLayout_newGenerator__block_invoke_2(uint64_t a1, uint64_t a2)
{
  if ((unint64_t)(a2 - 6) >= 3)
  {
    uint64_t v9 = v3;
    double v8 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", v9, v2, v4, v5);
    [v8 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"PXDayAssetsSectionBodyLayout.m" lineNumber:174 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  return a2 - 6;
}

id __44__PXDayAssetsSectionBodyLayout_newGenerator__block_invoke_3(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = [WeakRetained _inputItemAtIndex:a2];

  return v4;
}

- (void)safeAreaInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXDayAssetsSectionBodyLayout;
  [(PXGLayout *)&v3 safeAreaInsetsDidChange];
  [(PXGGeneratedLayout *)self metricsDidChange];
}

- (void)referenceSizeDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXDayAssetsSectionBodyLayout;
  [(PXGGeneratedLayout *)&v3 referenceSizeDidChange];
  [(PXGGeneratedLayout *)self metricsDidChange];
}

- (void)setPreferredReferenceSize:(CGSize)a3
{
}

- (void)setStyle:(int64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    [(PXGGeneratedLayout *)self metricsDidChange];
  }
}

- (void)setNumberOfPrecedingAssets:(int64_t)a3
{
  if (self->_numberOfPrecedingAssets != a3)
  {
    self->_numberOfPrecedingAssets = a3;
    [(PXGGeneratedLayout *)self metricsDidChange];
  }
}

- (void)setSpec:(id)a3
{
  uint64_t v5 = (PXDayAssetsSectionBodyLayoutSpec *)a3;
  if (self->_spec != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_spec, a3);
    [(PXGGeneratedLayout *)self metricsDidChange];
    uint64_t v5 = v6;
  }
}

- (PXDayAssetsSectionBodyLayout)init
{
  v9.receiver = self;
  v9.super_class = (Class)PXDayAssetsSectionBodyLayout;
  uint64_t v2 = [(PXCuratedLibraryAssetsSectionGeneratedLayout *)&v9 init];
  if (v2)
  {
    objc_super v3 = +[PXKeyboardSettings sharedInstance];
    uint64_t v4 = [v3 daysFocusAnimationStyle];
    [v3 daysFocusPadding];
    -[PXGItemsLayout setAnimationParameters:forStylableType:](v2, "setAnimationParameters:forStylableType:", v4, v5, 1);
    double v6 = +[PXCursorInteractionSettings sharedInstance];
    if ([v6 enableDaysEffect])
    {
      [v6 daysPadding];
      -[PXGItemsLayout setAnimationParameters:forStylableType:](v2, "setAnimationParameters:forStylableType:", 1, v7, 0);
    }
  }
  return v2;
}

+ (CGSize)estimatedSizeWithReferenceSize:(CGSize)a3 spec:(id)a4 style:(int64_t)a5 numberOfAssets:(int64_t)a6
{
  double width = a3.width;
  if (a6)
  {
    uint64_t v9 = +[PXLayoutMetricInterpolator photosGridLayoutColumnsForWidth:](PXLayoutMetricInterpolator, "photosGridLayoutColumnsForWidth:", a4, a3.width, a3.height);
    double v10 = -0.0;
    if (a5 != 2) {
      double v10 = width;
    }
    double v11 = v10 + width / (double)v9 * (double)(a6 / v9);
  }
  else
  {
    double v11 = 0.0;
  }
  double v12 = width;
  result.double height = v11;
  result.double width = v12;
  return result;
}

@end