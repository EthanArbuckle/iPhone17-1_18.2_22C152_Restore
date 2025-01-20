@interface SXMosaicGalleryHorizontalLayout
- (_NSRange)columnRangeForItem:(id)a3;
- (id)calculateFrames;
@end

@implementation SXMosaicGalleryHorizontalLayout

- (id)calculateFrames
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF980] array];
  unint64_t v4 = [(SXMosaicGalleryGroupLayout *)self numberOfColumns];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v5 = [(SXMosaicGalleryGroupLayout *)self cluster];
  v6 = [v5 items];

  id obj = v6;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = [(SXMosaicGalleryHorizontalLayout *)self columnRangeForItem:*(void *)(*((void *)&v25 + 1) + 8 * i)];
        uint64_t v13 = v12;
        v14 = [(SXMosaicGalleryGroupLayout *)self columnLayout];
        objc_msgSend(v14, "positionForColumnRange:numberOfColumns:", v11, v13, v4);
        double v16 = v15;

        v17 = [(SXMosaicGalleryGroupLayout *)self columnLayout];
        objc_msgSend(v17, "widthForColumnRange:numberOfColumns:", v11, v13, v4);
        double v19 = v18;

        [(SXMosaicGalleryGroupLayout *)self height];
        v21 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", v16, 0.0, v19, v20);
        [v3 addObject:v21];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v8);
  }

  v22 = [MEMORY[0x263EFF8C0] arrayWithArray:v3];

  return v22;
}

- (_NSRange)columnRangeForItem:(id)a3
{
  id v4 = a3;
  v5 = [(SXMosaicGalleryGroupLayout *)self cluster];
  v6 = [v5 items];
  uint64_t v7 = [v6 indexOfObject:v4];

  uint64_t v8 = [(SXMosaicGalleryGroupLayout *)self columnRanges];
  uint64_t v9 = [v8 objectAtIndex:v7];
  uint64_t v10 = [v9 rangeValue];
  uint64_t v12 = v11;

  if (!(v10 | v12))
  {
    uint64_t v13 = [v4 tileType];
    v14 = [(SXMosaicGalleryGroupLayout *)self cluster];
    double v15 = [v14 items];
    uint64_t v16 = [v15 count];

    unint64_t v17 = [(SXMosaicGalleryGroupLayout *)self numberOfColumns];
    double v18 = [(SXMosaicGalleryGroupLayout *)self cluster];
    char v19 = [v18 isClusterOfType:v13];

    if (v19)
    {
      uint64_t v12 = 1;
      uint64_t v10 = v7;
    }
    else if (v16 == 2)
    {
      if (v13 == 3) {
        uint64_t v12 = 2;
      }
      else {
        uint64_t v12 = (v13 - 1) < 2;
      }
      uint64_t v10 = (v17 - v12) * v7;
    }
    else
    {
      double v20 = [MEMORY[0x263EFF940] exceptionWithName:@"Unexpected cluster in horizontal layout" reason:@"The provided cluster contains three items of possibly different types" userInfo:0];
      [v20 raise];

      uint64_t v10 = 0;
      uint64_t v12 = 0;
    }
    v21 = [(SXMosaicGalleryGroupLayout *)self columnRanges];
    v22 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", v10, v12);
    [v21 replaceObjectAtIndex:v7 withObject:v22];
  }
  NSUInteger v23 = v10;
  NSUInteger v24 = v12;
  result.length = v24;
  result.location = v23;
  return result;
}

@end