@interface SXMosaicGalleryVerticalLivingRoomLayout
- (SXMosaicGalleryVerticalLivingRoomLayout)initWithCluster:(id)a3 numberOfColumns:(unint64_t)a4 columnLayout:(id)a5;
- (_NSRange)columnRangeForItem:(id)a3;
- (double)calculateHeight;
- (double)largeItemHeight;
- (double)smallItemHeight;
- (id)calculateFrames;
@end

@implementation SXMosaicGalleryVerticalLivingRoomLayout

- (SXMosaicGalleryVerticalLivingRoomLayout)initWithCluster:(id)a3 numberOfColumns:(unint64_t)a4 columnLayout:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)SXMosaicGalleryVerticalLivingRoomLayout;
  result = [(SXMosaicGalleryGroupLayout *)&v6 initWithCluster:a3 numberOfColumns:a4 columnLayout:a5];
  if (result)
  {
    result->_largeItemHeight = 1.79769313e308;
    result->_smallItemHeight = 1.79769313e308;
  }
  return result;
}

- (double)calculateHeight
{
  [(SXMosaicGalleryVerticalLivingRoomLayout *)self largeItemHeight];
  double v4 = v3;
  v5 = [(SXMosaicGalleryGroupLayout *)self columnLayout];
  [v5 gutter];
  double v7 = v4 + v6;
  [(SXMosaicGalleryVerticalLivingRoomLayout *)self smallItemHeight];
  double v9 = v7 + v8;

  return v9;
}

- (id)calculateFrames
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  double v3 = [MEMORY[0x263EFF980] array];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  double v4 = [(SXMosaicGalleryGroupLayout *)self cluster];
  v5 = [v4 items];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v31 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = [(SXMosaicGalleryVerticalLivingRoomLayout *)self columnRangeForItem:*(void *)(*((void *)&v30 + 1) + 8 * i)];
        uint64_t v12 = v10;
        if (v10 == 1)
        {
          [(SXMosaicGalleryVerticalLivingRoomLayout *)self smallItemHeight];
          double v15 = v16;
          [(SXMosaicGalleryVerticalLivingRoomLayout *)self largeItemHeight];
          double v18 = v17;
          v19 = [(SXMosaicGalleryGroupLayout *)self columnLayout];
          [v19 gutter];
          double v13 = v18 + v20;
        }
        else
        {
          double v13 = 0.0;
          if (v10 == 2)
          {
            [(SXMosaicGalleryVerticalLivingRoomLayout *)self largeItemHeight];
            double v15 = v14;
          }
          else
          {
            double v15 = 0.0;
          }
        }
        v21 = [(SXMosaicGalleryGroupLayout *)self columnLayout];
        objc_msgSend(v21, "widthForColumnRange:numberOfColumns:", v11, v12, -[SXMosaicGalleryGroupLayout numberOfColumns](self, "numberOfColumns"));
        double v23 = v22;

        v24 = [(SXMosaicGalleryGroupLayout *)self columnLayout];
        objc_msgSend(v24, "positionForColumnRange:numberOfColumns:", v11, v12, -[SXMosaicGalleryGroupLayout numberOfColumns](self, "numberOfColumns"));
        double v26 = v25;

        v27 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", v26, v13, v23, v15);
        [v3 addObject:v27];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v7);
  }

  v28 = [MEMORY[0x263EFF8C0] arrayWithArray:v3];

  return v28;
}

- (_NSRange)columnRangeForItem:(id)a3
{
  id v4 = a3;
  v5 = [(SXMosaicGalleryGroupLayout *)self cluster];
  uint64_t v6 = [v5 items];
  uint64_t v7 = [v6 indexOfObject:v4];

  uint64_t v8 = [(SXMosaicGalleryGroupLayout *)self columnRanges];
  double v9 = [v8 objectAtIndex:v7];
  uint64_t v10 = [v9 rangeValue];
  uint64_t v12 = v11;

  if (!(v10 | v12))
  {
    if (v7) {
      uint64_t v10 = v7 - 1;
    }
    else {
      uint64_t v10 = 0;
    }
    if (v7) {
      uint64_t v12 = 1;
    }
    else {
      uint64_t v12 = 2;
    }
    double v13 = [(SXMosaicGalleryGroupLayout *)self columnRanges];
    double v14 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", v10, v12);
    [v13 replaceObjectAtIndex:v7 withObject:v14];
  }
  NSUInteger v15 = v10;
  NSUInteger v16 = v12;
  result.length = v16;
  result.location = v15;
  return result;
}

- (double)largeItemHeight
{
  double result = self->_largeItemHeight;
  if (result == 1.79769313e308)
  {
    id v4 = [(SXMosaicGalleryGroupLayout *)self cluster];
    v5 = [v4 items];
    uint64_t v6 = [v5 firstObject];

    [(SXMosaicGalleryGroupLayout *)self desiredHeightForItem:v6];
    self->_largeItemHeight = v7;

    return self->_largeItemHeight;
  }
  return result;
}

- (double)smallItemHeight
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  double smallItemHeight = self->_smallItemHeight;
  if (smallItemHeight == 1.79769313e308)
  {
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v4 = [(SXMosaicGalleryGroupLayout *)self cluster];
    v5 = [v4 items];
    uint64_t v6 = objc_msgSend(v5, "subarrayWithRange:", 1, 2);

    uint64_t v7 = [v6 countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v36;
      double v10 = 1.79769313e308;
      double v11 = 2.22507386e-308;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v36 != v9) {
            objc_enumerationMutation(v6);
          }
          [(SXMosaicGalleryGroupLayout *)self desiredHeightForItem:*(void *)(*((void *)&v35 + 1) + 8 * i)];
          if (v10 >= v13) {
            double v10 = v13;
          }
          if (v11 < v13) {
            double v11 = v13;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v35 objects:v40 count:16];
      }
      while (v8);

      double smallItemHeight = 0.0;
      if (v10 <= v11)
      {
        double v14 = 1.79769313e308;
        do
        {
          long long v33 = 0u;
          long long v34 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
          NSUInteger v15 = [(SXMosaicGalleryGroupLayout *)self cluster];
          NSUInteger v16 = [v15 items];

          uint64_t v17 = [v16 countByEnumeratingWithState:&v31 objects:v39 count:16];
          double v18 = 0.0;
          if (v17)
          {
            uint64_t v19 = v17;
            uint64_t v20 = *(void *)v32;
            do
            {
              for (uint64_t j = 0; j != v19; ++j)
              {
                if (*(void *)v32 != v20) {
                  objc_enumerationMutation(v16);
                }
                double v22 = *(void **)(*((void *)&v31 + 1) + 8 * j);
                uint64_t v23 = [(SXMosaicGalleryVerticalLivingRoomLayout *)self columnRangeForItem:v22];
                uint64_t v25 = v24;
                double v26 = [(SXMosaicGalleryGroupLayout *)self columnLayout];
                objc_msgSend(v26, "widthForColumnRange:numberOfColumns:", v23, v25, -[SXMosaicGalleryGroupLayout numberOfColumns](self, "numberOfColumns"));
                double v28 = v27;

                [v22 aspectRatio];
                double v18 = v18 + (v28 + -v10 * v29) * (v28 + -v10 * v29);
              }
              uint64_t v19 = [v16 countByEnumeratingWithState:&v31 objects:v39 count:16];
            }
            while (v19);
          }

          if (v14 >= v18) {
            double v14 = v18;
          }
          if (v14 == v18) {
            double smallItemHeight = v10;
          }
          double v10 = v10 + 1.0;
        }
        while (v10 <= v11);
      }
    }
    else
    {

      double smallItemHeight = 0.0;
    }
    self->_double smallItemHeight = smallItemHeight;
  }
  return smallItemHeight;
}

@end