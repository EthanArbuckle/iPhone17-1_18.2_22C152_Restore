@interface SXMosaicGalleryPortraitLivingRoomLayout
- (_NSRange)columnRangeForItem:(id)a3;
- (_NSRange)columnRangeForLargeItem;
- (_NSRange)columnRangeForSmallerItems;
- (double)calculateHeight;
- (double)desiredHeightForLargeItem;
- (double)desiredHeightForSmallerItems;
- (id)calculateFrames;
- (unint64_t)indexOfLargeItem;
@end

@implementation SXMosaicGalleryPortraitLivingRoomLayout

- (double)calculateHeight
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  [(SXMosaicGalleryPortraitLivingRoomLayout *)self desiredHeightForLargeItem];
  double v4 = v3;
  [(SXMosaicGalleryPortraitLivingRoomLayout *)self desiredHeightForSmallerItems];
  if (v4 >= v5) {
    double v6 = v5;
  }
  else {
    double v6 = v4;
  }
  if (v4 >= v5) {
    double v7 = v4;
  }
  else {
    double v7 = v5;
  }
  double v8 = 0.0;
  if (v6 <= v7)
  {
    double v9 = 1.79769313e308;
    do
    {
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      v10 = [(SXMosaicGalleryGroupLayout *)self cluster];
      v11 = [v10 items];

      uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v34 count:16];
      double v13 = 0.0;
      if (v12)
      {
        uint64_t v14 = v12;
        uint64_t v15 = *(void *)v31;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v31 != v15) {
              objc_enumerationMutation(v11);
            }
            v17 = *(void **)(*((void *)&v30 + 1) + 8 * i);
            uint64_t v18 = [(SXMosaicGalleryPortraitLivingRoomLayout *)self columnRangeForItem:v17];
            uint64_t v20 = v19;
            v21 = [(SXMosaicGalleryGroupLayout *)self columnLayout];
            objc_msgSend(v21, "widthForColumnRange:numberOfColumns:", v18, v20, -[SXMosaicGalleryGroupLayout numberOfColumns](self, "numberOfColumns"));
            double v23 = v22;

            [v17 aspectRatio];
            double v25 = v23 + -v6 * v24;
            if (v25 >= 0.0) {
              double v26 = v25;
            }
            else {
              double v26 = -v25;
            }
            [(SXMosaicGalleryGroupLayout *)self desiredHeightForItem:v17];
            double v28 = v6 - v27;
            if (v28 < 0.0) {
              double v28 = -v28;
            }
            if (v28 < 1.0) {
              double v28 = 1.0;
            }
            double v13 = v13 + v26 * v28 * (v26 * v28);
          }
          uint64_t v14 = [v11 countByEnumeratingWithState:&v30 objects:v34 count:16];
        }
        while (v14);
      }

      if (v9 >= v13) {
        double v9 = v13;
      }
      if (v9 == v13) {
        double v8 = v6;
      }
      double v6 = v6 + 1.0;
    }
    while (v6 <= v7);
  }
  return v8;
}

- (id)calculateFrames
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  double v3 = [MEMORY[0x263EFF980] array];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  double v4 = [(SXMosaicGalleryGroupLayout *)self cluster];
  double v5 = [v4 items];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v36;
    double v9 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v36 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = [(SXMosaicGalleryPortraitLivingRoomLayout *)self columnRangeForItem:*(void *)(*((void *)&v35 + 1) + 8 * i)];
        uint64_t v13 = v12;
        uint64_t v14 = [(SXMosaicGalleryPortraitLivingRoomLayout *)self columnRangeForLargeItem];
        if (v13 == v15 && v11 == v14) {
          double v9 = 0.0;
        }
        v17 = [(SXMosaicGalleryGroupLayout *)self columnLayout];
        objc_msgSend(v17, "widthForColumnRange:numberOfColumns:", v11, v13, -[SXMosaicGalleryGroupLayout numberOfColumns](self, "numberOfColumns"));
        double v19 = v18;

        uint64_t v20 = [(SXMosaicGalleryGroupLayout *)self columnLayout];
        objc_msgSend(v20, "positionForColumnRange:numberOfColumns:", v11, v13, -[SXMosaicGalleryGroupLayout numberOfColumns](self, "numberOfColumns"));
        double v22 = v21;

        [(SXMosaicGalleryGroupLayout *)self height];
        double v24 = v23;
        if (v11 == [(SXMosaicGalleryPortraitLivingRoomLayout *)self columnRangeForSmallerItems]&& v13 == v25)
        {
          double v27 = [(SXMosaicGalleryGroupLayout *)self columnLayout];
          [v27 gutter];
          double v24 = (v24 - v28) * 0.5;
        }
        v29 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", v22, v9, v19, v24);
        [v3 addObject:v29];

        if (v11 == [(SXMosaicGalleryPortraitLivingRoomLayout *)self columnRangeForSmallerItems]&& v13 == v30)
        {
          long long v31 = [(SXMosaicGalleryGroupLayout *)self columnLayout];
          [v31 gutter];
          double v9 = v9 + v24 + v32;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v7);
  }

  long long v33 = [MEMORY[0x263EFF8C0] arrayWithArray:v3];

  return v33;
}

- (_NSRange)columnRangeForItem:(id)a3
{
  id v4 = a3;
  double v5 = [(SXMosaicGalleryGroupLayout *)self cluster];
  uint64_t v6 = [v5 items];
  uint64_t v7 = [v6 indexOfObject:v4];

  uint64_t v8 = [(SXMosaicGalleryGroupLayout *)self columnRanges];
  double v9 = [v8 objectAtIndex:v7];
  uint64_t v10 = [v9 rangeValue];
  NSUInteger v12 = v11;

  if (!(v10 | v12))
  {
    if (v7 == [(SXMosaicGalleryPortraitLivingRoomLayout *)self indexOfLargeItem]) {
      uint64_t v13 = [(SXMosaicGalleryPortraitLivingRoomLayout *)self columnRangeForLargeItem];
    }
    else {
      uint64_t v13 = [(SXMosaicGalleryPortraitLivingRoomLayout *)self columnRangeForSmallerItems];
    }
    uint64_t v10 = v13;
    NSUInteger v12 = v14;
    uint64_t v15 = [(SXMosaicGalleryGroupLayout *)self columnRanges];
    v16 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", v10, v12);
    [v15 replaceObjectAtIndex:v7 withObject:v16];
  }
  NSUInteger v17 = v10;
  NSUInteger v18 = v12;
  result.length = v18;
  result.location = v17;
  return result;
}

- (_NSRange)columnRangeForSmallerItems
{
  unint64_t v3 = [(SXMosaicGalleryGroupLayout *)self numberOfColumns];
  NSUInteger v4 = v3 + ~[(SXMosaicGalleryPortraitLivingRoomLayout *)self columnRangeForLargeItem];
  NSUInteger v5 = 1;
  result.length = v5;
  result.location = v4;
  return result;
}

- (_NSRange)columnRangeForLargeItem
{
  NSUInteger v2 = [(SXMosaicGalleryPortraitLivingRoomLayout *)self indexOfLargeItem] != 0;
  NSUInteger v3 = 1;
  result.length = v3;
  result.location = v2;
  return result;
}

- (double)desiredHeightForLargeItem
{
  NSUInteger v3 = [(SXMosaicGalleryGroupLayout *)self cluster];
  NSUInteger v4 = [v3 items];
  NSUInteger v5 = objc_msgSend(v4, "objectAtIndex:", -[SXMosaicGalleryPortraitLivingRoomLayout indexOfLargeItem](self, "indexOfLargeItem"));

  [(SXMosaicGalleryGroupLayout *)self desiredHeightForItem:v5];
  double v7 = v6;

  return v7;
}

- (double)desiredHeightForSmallerItems
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  BOOL v3 = [(SXMosaicGalleryPortraitLivingRoomLayout *)self indexOfLargeItem] == 0;
  NSUInteger v4 = [(SXMosaicGalleryGroupLayout *)self columnLayout];
  [v4 gutter];
  double v6 = v5;

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  double v7 = [(SXMosaicGalleryGroupLayout *)self cluster];
  uint64_t v8 = [v7 items];
  double v9 = objc_msgSend(v8, "subarrayWithRange:", v3, 2);

  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        [(SXMosaicGalleryGroupLayout *)self desiredHeightForItem:*(void *)(*((void *)&v16 + 1) + 8 * v13)];
        double v6 = v6 + v14;
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  return v6;
}

- (unint64_t)indexOfLargeItem
{
  NSUInteger v2 = [(SXMosaicGalleryGroupLayout *)self cluster];
  BOOL v3 = [v2 items];
  unint64_t v4 = [v3 indexOfObjectPassingTest:&__block_literal_global_18];

  return v4;
}

BOOL __59__SXMosaicGalleryPortraitLivingRoomLayout_indexOfLargeItem__block_invoke(uint64_t a1, void *a2)
{
  return [a2 tileType] == 2;
}

@end