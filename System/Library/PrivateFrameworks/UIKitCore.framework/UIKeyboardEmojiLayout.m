@interface UIKeyboardEmojiLayout
+ (Class)invalidationContextClass;
- (BOOL)flipsHorizontallyInOppositeLayoutDirection;
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (BOOL)shouldInvalidateLayoutForPreferredLayoutAttributes:(id)a3 withOriginalAttributes:(id)a4;
- (id)invalidationContextForBoundsChange:(CGRect)a3;
- (id)invalidationContextForPreferredLayoutAttributes:(id)a3 withOriginalAttributes:(id)a4;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4;
- (void)_setAttributes:(id)a3 forSection:(int64_t)a4;
- (void)dealloc;
- (void)invalidateLayoutWithContext:(id)a3;
- (void)prepareLayout;
@end

@implementation UIKeyboardEmojiLayout

+ (Class)invalidationContextClass
{
  return (Class)objc_opt_class();
}

- (void)dealloc
{
  attributes = self->_attributes;
  self->_attributes = 0;

  headerWidths = self->_headerWidths;
  self->_headerWidths = 0;

  v5.receiver = self;
  v5.super_class = (Class)UIKeyboardEmojiLayout;
  [(UIKeyboardEmojiLayout *)&v5 dealloc];
}

- (void)_setAttributes:(id)a3 forSection:(int64_t)a4
{
  id v12 = a3;
  attributes = self->_attributes;
  v7 = [NSNumber numberWithInteger:a4];
  id v8 = [(NSMutableDictionary *)attributes objectForKeyedSubscript:v7];

  v9 = v12;
  if (v8 != v12)
  {
    v10 = self->_attributes;
    v11 = [NSNumber numberWithInteger:a4];
    if (v12) {
      [(NSMutableDictionary *)v10 setObject:v12 forKeyedSubscript:v11];
    }
    else {
      [(NSMutableDictionary *)v10 removeObjectForKey:v11];
    }

    v9 = v12;
  }
}

- (void)prepareLayout
{
  v10.receiver = self;
  v10.super_class = (Class)UIKeyboardEmojiLayout;
  [(UICollectionViewFlowLayout *)&v10 prepareLayout];
  v3 = [(UICollectionViewLayout *)self collectionView];
  uint64_t v4 = [v3 numberOfSections];

  if (!self->_attributes)
  {
    objc_super v5 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v4];
    attributes = self->_attributes;
    self->_attributes = v5;
  }
  if (self->_headerWidths)
  {
    if (!v4) {
      return;
    }
  }
  else
  {
    v7 = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v4];
    headerWidths = self->_headerWidths;
    self->_headerWidths = v7;

    if (!v4) {
      return;
    }
  }
  for (uint64_t i = 0; i != v4; ++i)
    [(NSMutableArray *)self->_headerWidths setObject:&unk_1ED3F2058 atIndexedSubscript:i];
}

- (void)invalidateLayoutWithContext:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)UIKeyboardEmojiLayout;
  [(UICollectionViewFlowLayout *)&v20 invalidateLayoutWithContext:v4];
  if (([v4 invalidateDataSourceCounts] & 1) != 0
    || [v4 invalidateEverything])
  {
    if (self->_attributes)
    {
      headerWidths = self->_headerWidths;
      if (headerWidths)
      {
        if ([(NSMutableArray *)headerWidths count])
        {
          unint64_t v6 = 0;
          do
          {
            [(UIKeyboardEmojiLayout *)self _setAttributes:0 forSection:v6];
            [(NSMutableArray *)self->_headerWidths setObject:&unk_1ED3F2058 atIndexedSubscript:v6++];
          }
          while (v6 < [(NSMutableArray *)self->_headerWidths count]);
        }
      }
    }
  }
  else
  {
    [v4 invalidatedSupplementaryIndexPaths];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v15 = long long v19 = 0u;
    v7 = [v15 objectForKeyedSubscript:@"UICollectionElementKindSectionHeader"];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = [*(id *)(*((void *)&v16 + 1) + 8 * v11) section];
          [(UIKeyboardEmojiLayout *)self _setAttributes:0 forSection:v12];
          [v4 preferredWidthForHeaderInSection:v12];
          if (v13 > 0.0)
          {
            v14 = objc_msgSend(NSNumber, "numberWithDouble:");
            [(NSMutableArray *)self->_headerWidths setObject:v14 atIndexedSubscript:v12];
          }
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v9);
    }
  }
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v41.receiver = self;
  v41.super_class = (Class)UIKeyboardEmojiLayout;
  uint64_t v8 = [(UICollectionViewFlowLayout *)&v41 layoutAttributesForElementsInRect:sel_layoutAttributesForElementsInRect_];
  uint64_t v9 = (void *)[v8 mutableCopy];

  uint64_t v10 = [(UICollectionViewLayout *)self collectionView];
  uint64_t v11 = [v10 numberOfSections];

  if (v11 >= 1)
  {
    uint64_t v12 = 0;
    double v38 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v39 = *MEMORY[0x1E4F1DB28];
    double v36 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    double v37 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    do
    {
      attributes = self->_attributes;
      v14 = [NSNumber numberWithInteger:v12];
      v15 = [(NSMutableDictionary *)attributes objectForKeyedSubscript:v14];

      if (!v15)
      {
        long long v16 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:v12];
        long long v17 = [(UIKeyboardEmojiLayout *)self layoutAttributesForSupplementaryViewOfKind:@"UICollectionElementKindSectionHeader" atIndexPath:v16];
        [(UIKeyboardEmojiLayout *)self _setAttributes:v17 forSection:v12];
      }
      long long v18 = self->_attributes;
      long long v19 = [NSNumber numberWithInteger:v12];
      objc_super v20 = [(NSMutableDictionary *)v18 objectForKeyedSubscript:v19];

      if (v20)
      {
        v21 = self->_attributes;
        uint64_t v22 = [NSNumber numberWithInteger:v12];
        v23 = [(NSMutableDictionary *)v21 objectForKeyedSubscript:v22];

        double v25 = v38;
        CGFloat v24 = v39;
        double v27 = v36;
        double v26 = v37;
        if (v23) {
          objc_msgSend(v23, "frame", v39, v38, v37, v36);
        }
        CGFloat v28 = v24;
        CGFloat v29 = v25;
        CGFloat v30 = v26;
        CGFloat v31 = v27;
        double MinX = CGRectGetMinX(*(CGRect *)&v24);
        v43.origin.CGFloat x = x;
        v43.origin.CGFloat y = y;
        v43.size.CGFloat width = width;
        v43.size.CGFloat height = height;
        if (MinX >= CGRectGetMaxX(v43))
        {

          break;
        }
        v44.origin.CGFloat x = x;
        v44.origin.CGFloat y = y;
        v44.size.CGFloat width = width;
        v44.size.CGFloat height = height;
        v45.origin.CGFloat x = v28;
        v45.origin.CGFloat y = v29;
        v45.size.CGFloat width = v30;
        v45.size.CGFloat height = v31;
        if (CGRectIntersectsRect(v44, v45))
        {
          v32 = self->_attributes;
          v33 = [NSNumber numberWithInteger:v12];
          v34 = [(NSMutableDictionary *)v32 objectForKeyedSubscript:v33];
          [v9 addObject:v34];
        }
      }
      ++v12;
    }
    while (v11 != v12);
  }
  return v9;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  v112[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(UICollectionViewFlowLayout *)self scrollDirection])
  {
    uint64_t v8 = [(UICollectionViewLayout *)self collectionView];
    [v8 bounds];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;

    uint64_t v17 = [v7 section];
    long long v18 = [(UICollectionViewLayout *)self collectionView];
    uint64_t v19 = [v18 numberOfItemsInSection:v17];

    if (!v19)
    {
      double v83 = *MEMORY[0x1E4F1DB28];
      double v84 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double v86 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double v85 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
LABEL_22:
      v73 = +[UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:v6 withIndexPath:v7];
      objc_msgSend(v73, "setFrame:", v83, v84, v86, v85);
      goto LABEL_23;
    }
    objc_super v20 = [(UICollectionViewLayout *)self collectionView];
    v21 = [v20 emojiGraphicsTraits];

    uint64_t v22 = [(NSMutableArray *)self->_headerWidths objectAtIndexedSubscript:v17];
    [v22 doubleValue];
    double v24 = v23;

    if (v24 == 0.0)
    {
      double v25 = +[UIKeyboardEmojiCategory displayName:](UIKeyboardEmojiCategory, "displayName:", +[UIKeyboardEmojiCategory categoryTypeForCategoryIndex:v17]);
      double v26 = [MEMORY[0x1E4F1CA20] currentLocale];
      double v27 = [v25 uppercaseStringWithLocale:v26];

      [v21 categoryHeaderFontSize];
      CGFloat v28 = NSNumber;
      uint64_t v111 = *(void *)off_1E52D2040;
      CGFloat v29 = objc_msgSend(off_1E52D39B8, "boldSystemFontOfSize:");
      v112[0] = v29;
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v112 forKeys:&v111 count:1];
      v31 = id v30 = v6;
      id v108 = v7;
      v32 = v27;
      [v27 sizeWithAttributes:v31];
      v33 = [(UICollectionViewLayout *)self collectionView];
      UICeilToViewScale(v33);
      v34 = objc_msgSend(v28, "numberWithDouble:");
      [(NSMutableArray *)self->_headerWidths setObject:v34 atIndexedSubscript:v17];

      id v6 = v30;
      id v7 = v108;
    }
    CGFloat v106 = v16;
    CGFloat v107 = v10;
    CGFloat v102 = v14;
    CGFloat v103 = v12;
    -[UICollectionViewFlowLayout _calculateAttributesForRect:](self, "_calculateAttributesForRect:", v10, v12, v14, v16);
    v35 = [(UICollectionViewLayout *)self collectionView];
    double v36 = [v35 layoutAttributesForItemAtIndexPath:v7];
    [v36 frame];
    CGFloat v38 = v37;
    CGFloat v40 = v39;
    CGFloat v42 = v41;
    CGFloat v44 = v43;

    CGRect v45 = [(UICollectionViewLayout *)self collectionView];
    uint64_t v46 = [v45 numberOfItemsInSection:v17] - 1;

    v47 = [(UICollectionViewLayout *)self collectionView];
    v48 = [MEMORY[0x1E4F28D58] indexPathForItem:v46 inSection:v17];
    v49 = [v47 layoutAttributesForItemAtIndexPath:v48];
    [v49 frame];
    CGFloat v51 = v50;
    CGFloat v53 = v52;
    CGFloat v55 = v54;
    CGFloat v57 = v56;

    v114.origin.CGFloat x = v38;
    v114.origin.CGFloat y = v40;
    CGFloat v101 = v42;
    v114.size.CGFloat width = v42;
    CGFloat v58 = v44;
    v114.size.CGFloat height = v44;
    v123.origin.CGFloat x = v51;
    v123.origin.CGFloat y = v53;
    v123.size.CGFloat width = v55;
    v123.size.CGFloat height = v57;
    CGRect v115 = CGRectUnion(v114, v123);
    CGFloat x = v115.origin.x;
    CGFloat y = v115.origin.y;
    CGFloat width = v115.size.width;
    CGFloat height = v115.size.height;
    v62 = [(NSMutableArray *)self->_headerWidths objectAtIndexedSubscript:v17];
    [v62 doubleValue];
    double v64 = v63;

    [v21 categoryHeaderHeight];
    double v105 = v65;
    [v21 columnOffset];
    double v67 = v66;
    [v21 inputViewLeftMostPadding];
    double v104 = v64;
    CGFloat v99 = height;
    CGFloat v100 = width;
    if (v68 <= 50.0)
    {
      [v21 categoryHeaderLeftPadding];
      double v97 = v87 + v87;
      double v72 = v67;
      if (v17)
      {
LABEL_16:
        double v109 = v72;
        v116.origin.CGFloat x = v38;
        v116.origin.CGFloat y = v40;
        v116.size.CGFloat width = v101;
        v116.size.CGFloat height = v58;
        double MinX = CGRectGetMinX(v116);
        v117.origin.CGFloat x = v107;
        v117.origin.CGFloat y = v103;
        v117.size.CGFloat width = v102;
        v117.size.CGFloat height = v106;
        if (MinX >= v109 + CGRectGetMinX(v117))
        {
          v121.origin.CGFloat x = v38;
          v121.origin.CGFloat y = v40;
          v121.size.CGFloat width = v101;
          v121.size.CGFloat height = v58;
          double v92 = CGRectGetMinX(v121);
          [v21 categoryHeaderLeftPadding];
          double v83 = v92 + v93;
          double v86 = v104;
        }
        else
        {
          v118.origin.CGFloat x = x;
          v118.origin.CGFloat y = y;
          v118.size.CGFloat height = v99;
          v118.size.CGFloat width = width;
          double MaxX = CGRectGetMaxX(v118);
          v119.origin.CGFloat x = v107;
          v119.origin.CGFloat y = v103;
          v119.size.CGFloat width = v102;
          v119.size.CGFloat height = v106;
          double v86 = v104;
          if (MaxX - CGRectGetMinX(v119) >= v104 + v67 + v97)
          {
            v122.origin.CGFloat x = v107;
            v122.origin.CGFloat y = v103;
            v122.size.CGFloat width = v102;
            v122.size.CGFloat height = v106;
            double v94 = v109 + CGRectGetMinX(v122);
            [v21 categoryHeaderLeftPadding];
            double v83 = v94 + v95;
          }
          else
          {
            v120.origin.CGFloat x = x;
            v120.origin.CGFloat y = y;
            v120.size.CGFloat height = v99;
            v120.size.CGFloat width = v100;
            CGFloat v90 = CGRectGetMaxX(v120) - v104;
            [v21 categoryHeaderLeftPadding];
            double v83 = v90 - v91;
          }
        }

        double v84 = 0.0;
        double v85 = v105;
        goto LABEL_22;
      }
    }
    else
    {
      [v21 inputViewLeftMostPadding];
      double v70 = v69;
      [v21 categoryHeaderLeftPadding];
      double v72 = v70 - (v71 + v71);
      double v97 = v72;
    }
    objc_msgSend(v21, "inputViewLeftMostPadding", v72);
    goto LABEL_16;
  }
  v110.receiver = self;
  v110.super_class = (Class)UIKeyboardEmojiLayout;
  v73 = [(UICollectionViewFlowLayout *)&v110 layoutAttributesForSupplementaryViewOfKind:v6 atIndexPath:v7];
  if (![v7 item] && !objc_msgSend(v7, "section"))
  {
    v74 = [(UICollectionViewLayout *)self collectionView];
    v75 = [v74 emojiGraphicsTraits];
    v76 = v75;
    if (v75 && v75[8])
    {
      int v77 = [v6 isEqualToString:@"UICollectionElementKindSectionHeader"];

      if (v77)
      {
        v78 = [(UICollectionViewLayout *)self collectionView];
        v79 = [v78 superview];
        [v79 frame];
        +[UIKBResizableKeyplaneTransformation estimatedProgressForHeight:v80];
        double v82 = v81;

        [v73 setAlpha:v82];
      }
    }
    else
    {
    }
  }
LABEL_23:

  return v73;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  return 1;
}

- (BOOL)flipsHorizontallyInOppositeLayoutDirection
{
  return 1;
}

- (id)invalidationContextForBoundsChange:(CGRect)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)UIKeyboardEmojiLayout;
  id v4 = -[UICollectionViewFlowLayout invalidationContextForBoundsChange:](&v11, sel_invalidationContextForBoundsChange_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_super v5 = [(UICollectionViewLayout *)self collectionView];
  uint64_t v6 = [v5 numberOfSections];

  if (v6 >= 1)
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      uint64_t v8 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:i];
      v12[0] = v8;
      double v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
      [v4 invalidateSupplementaryElementsOfKind:@"UICollectionElementKindSectionHeader" atIndexPaths:v9];
    }
  }
  return v4;
}

- (BOOL)shouldInvalidateLayoutForPreferredLayoutAttributes:(id)a3 withOriginalAttributes:(id)a4
{
  id v5 = a4;
  [a3 frame];
  double Width = CGRectGetWidth(v16);
  [v5 frame];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;

  v17.origin.CGFloat x = v8;
  v17.origin.CGFloat y = v10;
  v17.size.CGFloat width = v12;
  v17.size.CGFloat height = v14;
  return Width != CGRectGetWidth(v17);
}

- (id)invalidationContextForPreferredLayoutAttributes:(id)a3 withOriginalAttributes:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v20.receiver = self;
  v20.super_class = (Class)UIKeyboardEmojiLayout;
  id v5 = [(UICollectionViewFlowLayout *)&v20 invalidationContextForPreferredLayoutAttributes:a3 withOriginalAttributes:a4];
  uint64_t v6 = [(UICollectionViewLayout *)self collectionView];
  double v7 = [v6 indexPathsForVisibleItems];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        double v13 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", 0, objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "section", (void)v16));
        v21 = v13;
        CGFloat v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
        [v5 invalidateSupplementaryElementsOfKind:@"UICollectionElementKindSectionHeader" atIndexPaths:v14];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v10);
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerWidths, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
}

@end