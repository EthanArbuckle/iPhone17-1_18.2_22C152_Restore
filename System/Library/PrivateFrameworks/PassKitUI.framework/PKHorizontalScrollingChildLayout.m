@interface PKHorizontalScrollingChildLayout
- (BOOL)isLowEndDevice;
- (BOOL)isVisible;
- (CGSize)collectionViewContentSize;
- (PKHorizontalScrollingChildLayout)init;
- (PKHorizontalScrollingChildLayoutDataSource)dataSource;
- (double)alphaTransition;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4;
- (void)_adjustItems:(id)a3 withLateralMove:(double)a4;
- (void)prepareLayout;
- (void)setAlphaTransition:(double)a3;
- (void)setDataSource:(id)a3;
- (void)setIsLowEndDevice:(BOOL)a3;
- (void)setVisible:(BOOL)a3;
@end

@implementation PKHorizontalScrollingChildLayout

- (PKHorizontalScrollingChildLayout)init
{
  v10.receiver = self;
  v10.super_class = (Class)PKHorizontalScrollingChildLayout;
  v2 = [(PKHorizontalScrollingChildLayout *)&v10 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    attributesPerIndexPath = v2->_attributesPerIndexPath;
    v2->_attributesPerIndexPath = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    headersPerIndexPath = v2->_headersPerIndexPath;
    v2->_headersPerIndexPath = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    footersPerIndexPath = v2->_footersPerIndexPath;
    v2->_footersPerIndexPath = v7;
  }
  return v2;
}

- (void)setVisible:(BOOL)a3
{
  if (self->_visible != a3)
  {
    self->_visible = a3;
    [(PKHorizontalScrollingChildLayout *)self invalidateLayout];
  }
}

- (void)setAlphaTransition:(double)a3
{
  if (self->_alphaTransition != a3)
  {
    double lastDrawnAlpha = self->_lastDrawnAlpha;
    self->_alphaTransition = a3;
    if (a3 == 1.0 || (a3 != 0.0 ? (BOOL v4 = !self->_isLowEndDevice) : (BOOL v4 = 1), v4 || vabdd_f64(a3, lastDrawnAlpha) > 0.03))
    {
      self->_double lastDrawnAlpha = a3;
      [(PKHorizontalScrollingChildLayout *)self invalidateLayout];
    }
  }
}

- (CGSize)collectionViewContentSize
{
  double width = self->_currentSize.width;
  double height = self->_currentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)prepareLayout
{
  v3 = [(PKHorizontalScrollingChildLayout *)self collectionView];
  uint64_t v4 = [v3 delegate];
  v5 = (void *)v4;
  if (v3 && v4)
  {
    [(NSMutableDictionary *)self->_attributesPerIndexPath removeAllObjects];
    [(NSMutableDictionary *)self->_headersPerIndexPath removeAllObjects];
    [(NSMutableDictionary *)self->_footersPerIndexPath removeAllObjects];
    [v3 frame];
    double v7 = v6;
    p_currentSize = &self->_currentSize;
    self->_currentSize.double width = v6;
    self->_currentSize.double height = 0.0;
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if ([v3 numberOfSections] >= 1)
    {
      uint64_t v10 = 0;
      double v11 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      double v67 = *MEMORY[0x1E4F1DB30];
      uint64_t v62 = *MEMORY[0x1E4FB2770];
      uint64_t v63 = *MEMORY[0x1E4FB2760];
      double v64 = v11;
      do
      {
        objc_msgSend(v5, "collectionView:layout:insetForSectionAtIndex:", v3, self, v10, v62);
        double v13 = v12;
        double v15 = v14;
        double v17 = v16;
        double v19 = v18;
        location = (id *)&self->_dataSource;
        id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
        [WeakRetained lineSpacingForSection:v10];
        double v68 = v21;

        double v22 = v13 + p_currentSize->height;
        p_currentSize->double height = v22;
        [v5 collectionView:v3 layout:self referenceSizeForHeaderInSection:v10];
        double v25 = v24;
        if (v24 == v67 && v23 == v11)
        {
          double v27 = v11;
          double v33 = v15;
        }
        else
        {
          double v27 = v23;
          if (v10) {
            double v22 = v22 + 8.0;
          }
          v28 = (void *)MEMORY[0x1E4FB15E0];
          v29 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:v10];
          v30 = [v28 layoutAttributesForSupplementaryViewOfKind:v62 withIndexPath:v29];

          objc_msgSend(v30, "setSize:", v25, v27);
          objc_msgSend(v30, "setFrame:", v15, v22, v25, v27);
          headersPerIndexPath = self->_headersPerIndexPath;
          v32 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:v10];
          [(NSMutableDictionary *)headersPerIndexPath setObject:v30 forKey:v32];

          [v9 addObject:v30];
          double v33 = v15 + v25;
        }
        uint64_t v34 = [v3 numberOfItemsInSection:v10];
        double v66 = v17;
        if (v34)
        {
          uint64_t v35 = v34;
          for (uint64_t i = 0; i != v35; ++i)
          {
            v37 = [MEMORY[0x1E4F28D58] indexPathForRow:i inSection:v10];
            [v5 collectionView:v3 layout:self sizeForItemAtIndexPath:v37];
            double v39 = v38;
            double v41 = v40;
            if (v7 - v33 - v19 >= v38)
            {
              if (v33 == v15) {
                double v42 = v33;
              }
              else {
                double v42 = v33 + 8.0;
              }
            }
            else
            {
              if (i | v10) {
                double v22 = v22 + v68 + v27;
              }
              else {
                double v22 = v22 + v68 + v27 + 2.0;
              }
              PKFloatRoundToPixel();
              -[PKHorizontalScrollingChildLayout _adjustItems:withLateralMove:](self, "_adjustItems:withLateralMove:", v9);
              [v9 removeAllObjects];
              double v42 = v15;
            }
            v43 = [MEMORY[0x1E4FB15E0] layoutAttributesForCellWithIndexPath:v37];
            objc_msgSend(v43, "setSize:", v39, v41);
            objc_msgSend(v43, "setFrame:", v42, v22, v39, v41);
            [(NSMutableDictionary *)self->_attributesPerIndexPath setObject:v43 forKey:v37];
            [v9 addObject:v43];
            double v33 = v39 + v42;

            double v27 = v41;
          }
        }
        else
        {
          double v41 = v27;
        }
        double v44 = v7 - v15 - v19;
        [v5 collectionView:v3 layout:self referenceSizeForFooterInSection:v10];
        double v47 = v45;
        double v48 = v46;
        if (v45 != v67 || v46 != v64)
        {
          if (v44 - v33 >= v45)
          {
            if (v33 == v15) {
              double v15 = v33;
            }
            else {
              double v15 = v33 + 8.0;
            }
          }
          else
          {
            id v49 = objc_loadWeakRetained(location);
            int v50 = [v49 horizontalAlignmentForSection:v10];

            if ((v50 | 2) == 3) {
              PKFloatRoundToPixel();
            }
            else {
              double v51 = 0.0;
            }
            double v22 = v68 + v41 + v22;
            [(PKHorizontalScrollingChildLayout *)self _adjustItems:v9 withLateralMove:v51];
            [v9 removeAllObjects];
          }
          v52 = (void *)MEMORY[0x1E4FB15E0];
          v53 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:v10];
          v54 = [v52 layoutAttributesForSupplementaryViewOfKind:v63 withIndexPath:v53];

          objc_msgSend(v54, "setSize:", v47, v48);
          objc_msgSend(v54, "setFrame:", v15, v22, v47, v48);
          footersPerIndexPath = self->_footersPerIndexPath;
          v56 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:v10];
          [(NSMutableDictionary *)footersPerIndexPath setObject:v54 forKey:v56];

          [v9 addObject:v54];
          double v41 = v48;
        }
        p_currentSize = &self->_currentSize;
        if ([v9 count])
        {
          id v57 = objc_loadWeakRetained(location);
          int v58 = [v57 horizontalAlignmentForSection:v10];

          if ((v58 | 2) == 3)
          {
            PKFloatRoundToPixel();
            double v60 = v59;
          }
          else
          {
            double v60 = 0.0;
          }
          v61 = (void *)[v9 copy];
          [(PKHorizontalScrollingChildLayout *)self _adjustItems:v61 withLateralMove:v60];

          [v9 removeAllObjects];
        }
        self->_currentSize.double height = v66 + v41 + v22;
        ++v10;
        double v11 = v64;
      }
      while (v10 < [v3 numberOfSections]);
    }
    p_currentSize->double height = p_currentSize->height + 16.0;
    v69.receiver = self;
    v69.super_class = (Class)PKHorizontalScrollingChildLayout;
    [(PKHorizontalScrollingChildLayout *)&v69 prepareLayout];
  }
}

- (void)_adjustItems:(id)a3 withLateralMove:(double)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        [v10 frame];
        [v10 setFrame:v11 + a4];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  uint64_t v4 = [(NSMutableDictionary *)self->_attributesPerIndexPath objectForKey:a3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  uint64_t v6 = [v4 indexPath];
  [WeakRetained alphaForIndexPath:v6 visible:self->_visible transition:self->_alphaTransition];
  objc_msgSend(v4, "setAlpha:");

  return v4;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v33 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  uint64_t v8 = self->_attributesPerIndexPath;
  uint64_t v9 = [(NSMutableDictionary *)v8 countByEnumeratingWithState:&v42 objects:v48 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v43 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = [(NSMutableDictionary *)self->_attributesPerIndexPath objectForKey:*(void *)(*((void *)&v42 + 1) + 8 * i)];
        [v13 frame];
        v54.origin.CGFloat x = x;
        v54.origin.CGFloat y = y;
        v54.size.CGFloat width = width;
        v54.size.CGFloat height = height;
        if (CGRectIntersectsRect(v51, v54))
        {
          id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
          long long v15 = [v13 indexPath];
          [WeakRetained alphaForIndexPath:v15 visible:self->_visible transition:self->_alphaTransition];
          objc_msgSend(v13, "setAlpha:");

          [v33 addObject:v13];
        }
      }
      uint64_t v10 = [(NSMutableDictionary *)v8 countByEnumeratingWithState:&v42 objects:v48 count:16];
    }
    while (v10);
  }

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  double v16 = self->_headersPerIndexPath;
  uint64_t v17 = [(NSMutableDictionary *)v16 countByEnumeratingWithState:&v38 objects:v47 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v39;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v39 != v19) {
          objc_enumerationMutation(v16);
        }
        double v21 = [(NSMutableDictionary *)self->_headersPerIndexPath objectForKey:*(void *)(*((void *)&v38 + 1) + 8 * j)];
        [v21 frame];
        v55.origin.CGFloat x = x;
        v55.origin.CGFloat y = y;
        v55.size.CGFloat width = width;
        v55.size.CGFloat height = height;
        if (CGRectIntersectsRect(v52, v55))
        {
          id v22 = objc_loadWeakRetained((id *)&self->_dataSource);
          double v23 = [v21 indexPath];
          [v22 alphaForIndexPath:v23 visible:self->_visible transition:self->_alphaTransition];
          objc_msgSend(v21, "setAlpha:");

          [v33 addObject:v21];
        }
      }
      uint64_t v18 = [(NSMutableDictionary *)v16 countByEnumeratingWithState:&v38 objects:v47 count:16];
    }
    while (v18);
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  double v24 = self->_footersPerIndexPath;
  uint64_t v25 = [(NSMutableDictionary *)v24 countByEnumeratingWithState:&v34 objects:v46 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v35;
    do
    {
      for (uint64_t k = 0; k != v26; ++k)
      {
        if (*(void *)v35 != v27) {
          objc_enumerationMutation(v24);
        }
        v29 = [(NSMutableDictionary *)self->_footersPerIndexPath objectForKey:*(void *)(*((void *)&v34 + 1) + 8 * k)];
        [v29 frame];
        v56.origin.CGFloat x = x;
        v56.origin.CGFloat y = y;
        v56.size.CGFloat width = width;
        v56.size.CGFloat height = height;
        if (CGRectIntersectsRect(v53, v56))
        {
          id v30 = objc_loadWeakRetained((id *)&self->_dataSource);
          v31 = [v29 indexPath];
          [v30 alphaForIndexPath:v31 visible:self->_visible transition:self->_alphaTransition];
          objc_msgSend(v29, "setAlpha:");

          [v33 addObject:v29];
        }
      }
      uint64_t v26 = [(NSMutableDictionary *)v24 countByEnumeratingWithState:&v34 objects:v46 count:16];
    }
    while (v26);
  }

  return v33;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((id)*MEMORY[0x1E4FB2770] == v6)
  {
    uint64_t v8 = [(NSMutableDictionary *)self->_headersPerIndexPath objectForKey:v7];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    uint64_t v10 = [v8 indexPath];
  }
  else
  {
    if ((id)*MEMORY[0x1E4FB2760] != v6)
    {
      uint64_t v8 = 0;
      goto LABEL_7;
    }
    uint64_t v8 = [(NSMutableDictionary *)self->_footersPerIndexPath objectForKey:v7];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    uint64_t v10 = [v8 indexPath];
  }
  [WeakRetained alphaForIndexPath:v10 visible:self->_visible transition:self->_alphaTransition];
  objc_msgSend(v8, "setAlpha:");

LABEL_7:

  return v8;
}

- (PKHorizontalScrollingChildLayoutDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (PKHorizontalScrollingChildLayoutDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (BOOL)isLowEndDevice
{
  return self->_isLowEndDevice;
}

- (void)setIsLowEndDevice:(BOOL)a3
{
  self->_isLowEndDevice = a3;
}

- (BOOL)isVisible
{
  return self->_visible;
}

- (double)alphaTransition
{
  return self->_alphaTransition;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footersPerIndexPath, 0);
  objc_storeStrong((id *)&self->_headersPerIndexPath, 0);
  objc_storeStrong((id *)&self->_attributesPerIndexPath, 0);

  objc_destroyWeak((id *)&self->_dataSource);
}

@end