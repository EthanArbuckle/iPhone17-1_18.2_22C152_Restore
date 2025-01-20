@interface SearchUICollectionViewLayout
+ (Class)layoutAttributesClass;
+ (void)applyForcedFrameToAttributes:(id)a3 frame:(CGRect)a4;
+ (void)applyForcedMaxHeightToAttributes:(id)a3 maxHeight:(double)a4;
- (CGRect)sectionContentFrameFromCellAttributes:(id)a3;
- (SearchUICollectionViewLayoutConfiguration)snapshotConfiguration;
- (SearchUICollectionViewSizingDelegate)sizingDelegate;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4;
- (void)invalidateLayoutWithContext:(id)a3;
- (void)prepareLayout;
- (void)setSizingDelegate:(id)a3;
@end

@implementation SearchUICollectionViewLayout

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  v74.receiver = self;
  v74.super_class = (Class)SearchUICollectionViewLayout;
  v4 = -[SearchUICollectionViewLayout layoutAttributesForElementsInRect:](&v74, sel_layoutAttributesForElementsInRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = [(SearchUICollectionViewLayout *)self snapshotConfiguration];

  if (v5)
  {
    v6 = objc_opt_new();
    v59 = objc_opt_new();
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    v55 = v4;
    obuint64_t j = v4;
    uint64_t v7 = [obj countByEnumeratingWithState:&v70 objects:v77 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v71;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v71 != v9) {
            objc_enumerationMutation(obj);
          }
          v11 = *(void **)(*((void *)&v70 + 1) + 8 * i);
          v12 = NSNumber;
          v13 = objc_msgSend(v11, "indexPath", v55);
          v14 = objc_msgSend(v12, "numberWithInteger:", objc_msgSend(v13, "section"));

          v15 = [v11 representedElementKind];

          if (v15)
          {
            v16 = [v11 representedElementKind];
            int v17 = [v16 isEqualToString:@"SearchUIBackgroundReuseIdentifer"];

            if (v17) {
              [v59 setObject:v11 forKeyedSubscript:v14];
            }
          }
          else
          {
            v18 = [v6 objectForKeyedSubscript:v14];

            if (!v18)
            {
              v19 = objc_opt_new();
              [v6 setObject:v19 forKeyedSubscript:v14];
            }
            v20 = [v6 objectForKeyedSubscript:v14];
            [v20 addObject:v11];
          }
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v70 objects:v77 count:16];
      }
      while (v8);
    }

    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id v21 = v6;
    uint64_t v58 = [v21 countByEnumeratingWithState:&v66 objects:v76 count:16];
    if (v58)
    {
      uint64_t v56 = *(void *)v67;
      v57 = v21;
      do
      {
        v22 = 0;
        do
        {
          if (*(void *)v67 != v56) {
            objc_enumerationMutation(v21);
          }
          obja = v22;
          v23 = *(void **)(*((void *)&v66 + 1) + 8 * (void)v22);
          -[SearchUICollectionViewLayout _contentFrameForSection:](self, "_contentFrameForSection:", objc_msgSend(v23, "integerValue", v55));
          double v25 = v24;
          double v27 = v26;
          double v29 = v28;
          double v31 = v30;
          long long v62 = 0u;
          long long v63 = 0u;
          long long v64 = 0u;
          long long v65 = 0u;
          v32 = [v21 objectForKeyedSubscript:v23];
          uint64_t v33 = [v32 countByEnumeratingWithState:&v62 objects:v75 count:16];
          if (v33)
          {
            uint64_t v34 = v33;
            uint64_t v35 = *(void *)v63;
            do
            {
              for (uint64_t j = 0; j != v34; ++j)
              {
                if (*(void *)v63 != v35) {
                  objc_enumerationMutation(v32);
                }
                uint64_t v37 = *(void *)(*((void *)&v62 + 1) + 8 * j);
                v38 = [(SearchUICollectionViewLayout *)self snapshotConfiguration];
                v39 = [v38 sectionIndexesForHeightMatching];
                int v40 = [v39 containsObject:v23];

                if (v40) {
                  [(id)objc_opt_class() applyForcedMaxHeightToAttributes:v37 maxHeight:v31];
                }
              }
              uint64_t v34 = [v32 countByEnumeratingWithState:&v62 objects:v75 count:16];
            }
            while (v34);
          }

          uint64_t v41 = [v59 objectForKeyedSubscript:v23];
          id v21 = v57;
          if (v41)
          {
            v42 = (void *)v41;
            v43 = [v57 objectForKeyedSubscript:v23];

            if (v43)
            {
              v44 = [v59 objectForKeyedSubscript:v23];
              if (([MEMORY[0x1E4FAE198] isMacOS] & 1) != 0
                || ([(SearchUICollectionViewLayout *)self snapshotConfiguration],
                    v45 = objc_claimAutoreleasedReturnValue(),
                    [v45 sectionIndexesUsingListLayout],
                    v46 = objc_claimAutoreleasedReturnValue(),
                    int v47 = [v46 containsObject:v23],
                    v46,
                    v45,
                    v47))
              {
                v48 = [v57 objectForKeyedSubscript:v23];
                if ([v48 count])
                {
                  v49 = [v57 objectForKeyedSubscript:v23];
                  [(SearchUICollectionViewLayout *)self sectionContentFrameFromCellAttributes:v49];
                  double v25 = v50;
                  double v27 = v51;
                  double v29 = v52;
                  double v31 = v53;
                }
              }
              objc_msgSend((id)objc_opt_class(), "applyForcedFrameToAttributes:frame:", v44, v25, v27, v29, v31);
            }
          }
          v22 = obja + 1;
        }
        while (obja + 1 != (char *)v58);
        uint64_t v58 = [v57 countByEnumeratingWithState:&v66 objects:v76 count:16];
      }
      while (v58);
    }

    v4 = v55;
  }
  return v4;
}

- (SearchUICollectionViewLayoutConfiguration)snapshotConfiguration
{
  return (SearchUICollectionViewLayoutConfiguration *)objc_getProperty(self, a2, 520, 1);
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SearchUICollectionViewLayout;
  v5 = [(SearchUICollectionViewLayout *)&v12 layoutAttributesForItemAtIndexPath:v4];
  v6 = [(SearchUICollectionViewLayout *)self snapshotConfiguration];
  uint64_t v7 = [v6 sectionIndexesForHeightMatching];
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "section"));
  int v9 = [v7 containsObject:v8];

  if (v9)
  {
    -[SearchUICollectionViewLayout _contentFrameForSection:](self, "_contentFrameForSection:", [v4 section]);
    [(id)objc_opt_class() applyForcedMaxHeightToAttributes:v5 maxHeight:v10];
  }

  return v5;
}

- (void)setSizingDelegate:(id)a3
{
}

- (void)invalidateLayoutWithContext:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SearchUICollectionViewLayout;
  [(SearchUICollectionViewLayout *)&v6 invalidateLayoutWithContext:a3];
  [(SearchUICollectionViewLayout *)self collectionViewContentSize];
  if (v4 > 0.0)
  {
    v5 = [(SearchUICollectionViewLayout *)self sizingDelegate];
    [(SearchUICollectionViewLayout *)self collectionViewContentSize];
    objc_msgSend(v5, "contentSizeDidChange:");
  }
}

- (void)prepareLayout
{
  v3 = [(SearchUICollectionViewLayout *)self sizingDelegate];
  double v4 = [v3 currentSnapshotLayoutConfiguration];
  snapshotConfiguration = self->_snapshotConfiguration;
  self->_snapshotConfiguration = v4;

  v6.receiver = self;
  v6.super_class = (Class)SearchUICollectionViewLayout;
  [(SearchUICollectionViewLayout *)&v6 prepareLayout];
}

- (SearchUICollectionViewSizingDelegate)sizingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sizingDelegate);
  return (SearchUICollectionViewSizingDelegate *)WeakRetained;
}

+ (Class)layoutAttributesClass
{
  return (Class)objc_opt_class();
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  id v6 = a4;
  v26.receiver = self;
  v26.super_class = (Class)SearchUICollectionViewLayout;
  uint64_t v7 = [(SearchUICollectionViewLayout *)&v26 layoutAttributesForSupplementaryViewOfKind:a3 atIndexPath:v6];
  uint64_t v8 = [v7 representedElementKind];
  int v9 = [v8 isEqualToString:@"SearchUIBackgroundReuseIdentifer"];

  if (v9)
  {
    if ([MEMORY[0x1E4FAE198] isMacOS]) {
      goto LABEL_4;
    }
    double v10 = [(SearchUICollectionViewLayout *)self snapshotConfiguration];
    v11 = [v10 sectionIndexesUsingListLayout];
    objc_super v12 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "section"));
    int v13 = [v11 containsObject:v12];

    if (v13)
    {
LABEL_4:
      v14 = objc_opt_new();
      v15 = [(SearchUICollectionViewLayout *)self collectionView];
      uint64_t v16 = objc_msgSend(v15, "numberOfItemsInSection:", objc_msgSend(v6, "section"));

      if (v16 >= 1)
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          v18 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", i, objc_msgSend(v6, "section"));
          v19 = [(SearchUICollectionViewLayout *)self layoutAttributesForItemAtIndexPath:v18];
          [v14 addObject:v19];
        }
      }
      if ([v14 count]) {
        [(SearchUICollectionViewLayout *)self sectionContentFrameFromCellAttributes:v14];
      }
      else {
        -[SearchUICollectionViewLayout _contentFrameForSection:](self, "_contentFrameForSection:", [v6 section]);
      }
      objc_msgSend((id)objc_opt_class(), "applyForcedFrameToAttributes:frame:", v7, v20, v21, v22, v23);
    }
    else
    {
      double v24 = objc_opt_class();
      -[SearchUICollectionViewLayout _contentFrameForSection:](self, "_contentFrameForSection:", [v6 section]);
      objc_msgSend(v24, "applyForcedFrameToAttributes:frame:", v7);
    }
  }

  return v7;
}

+ (void)applyForcedFrameToAttributes:(id)a3 frame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v8 = a3;
  objc_msgSend(v8, "setFrame:", x, y, width, height);
  [v8 setIsForcingHeight:1];
}

+ (void)applyForcedMaxHeightToAttributes:(id)a3 maxHeight:(double)a4
{
  id v16 = a3;
  [v16 frame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  if (v11 != 1.0
    || ([v16 representedElementKind],
        int v13 = objc_claimAutoreleasedReturnValue(),
        int v14 = [v13 isEqualToString:@"SearchUIBackgroundReuseIdentifer"],
        v13,
        v14))
  {
    if (v12 >= a4) {
      double v15 = v12;
    }
    else {
      double v15 = a4;
    }
    objc_msgSend(v16, "setFrame:", v6, v8, v10, v15);
    [v16 setIsForcingHeight:1];
  }
}

- (CGRect)sectionContentFrameFromCellAttributes:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  CGFloat v4 = *MEMORY[0x1E4F1DB28];
  CGFloat v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  CGFloat v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  CGFloat v7 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v8 = [v3 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v27;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(v3);
        }
        double v12 = *(void **)(*((void *)&v26 + 1) + 8 * v11);
        int v13 = [v3 firstObject];

        [v12 frame];
        CGFloat v18 = v14;
        double v19 = v15;
        double v20 = v16;
        double v21 = v17;
        if (v12 != v13)
        {
          v32.origin.double x = v4;
          v32.origin.double y = v5;
          v32.size.double width = v6;
          v32.size.double height = v7;
          *(CGRect *)&CGFloat v14 = CGRectUnion(v32, *(CGRect *)&v18);
        }
        CGFloat v4 = v14;
        CGFloat v5 = v15;
        CGFloat v6 = v16;
        CGFloat v7 = v17;
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v3 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v9);
  }

  double v22 = v4;
  double v23 = v5;
  double v24 = v6;
  double v25 = v7;
  result.size.double height = v25;
  result.size.double width = v24;
  result.origin.double y = v23;
  result.origin.double x = v22;
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sizingDelegate);
  objc_storeStrong((id *)&self->_snapshotConfiguration, 0);
}

@end