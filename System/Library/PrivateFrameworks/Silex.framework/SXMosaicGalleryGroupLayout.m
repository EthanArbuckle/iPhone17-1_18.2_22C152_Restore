@interface SXMosaicGalleryGroupLayout
- (CGRect)frameForItemAtIndex:(unint64_t)a3;
- (NSArray)frames;
- (NSMutableArray)columnRanges;
- (SXMosaicGalleryCluster)cluster;
- (SXMosaicGalleryColumnLayout)columnLayout;
- (SXMosaicGalleryGroupLayout)init;
- (SXMosaicGalleryGroupLayout)initWithCluster:(id)a3 numberOfColumns:(unint64_t)a4 columnLayout:(id)a5;
- (_NSRange)columnRangeForItem:(id)a3;
- (double)calculateHeight;
- (double)desiredHeightForItem:(id)a3;
- (double)height;
- (id)calculateFrames;
- (unint64_t)numberOfColumns;
@end

@implementation SXMosaicGalleryGroupLayout

- (SXMosaicGalleryGroupLayout)init
{
  return [(SXMosaicGalleryGroupLayout *)self initWithCluster:0 numberOfColumns:0 columnLayout:0];
}

- (SXMosaicGalleryGroupLayout)initWithCluster:(id)a3 numberOfColumns:(unint64_t)a4 columnLayout:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)SXMosaicGalleryGroupLayout;
  v11 = [(SXMosaicGalleryGroupLayout *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_cluster, a3);
    objc_storeStrong((id *)&v12->_columnLayout, a5);
    v12->_height = 1.79769313e308;
    v12->_numberOfColumns = a4;
  }

  return v12;
}

- (CGRect)frameForItemAtIndex:(unint64_t)a3
{
  v4 = [(SXMosaicGalleryGroupLayout *)self frames];
  v5 = [v4 objectAtIndex:a3];

  [v5 CGRectValue];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (double)height
{
  double result = self->_height;
  if (result == 1.79769313e308)
  {
    [(SXMosaicGalleryGroupLayout *)self calculateHeight];
    self->_height = result;
  }
  return result;
}

- (NSArray)frames
{
  frames = self->_frames;
  if (!frames)
  {
    v4 = [(SXMosaicGalleryGroupLayout *)self calculateFrames];
    v5 = self->_frames;
    self->_frames = v4;

    frames = self->_frames;
  }
  return frames;
}

- (double)calculateHeight
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  unint64_t v3 = [(SXMosaicGalleryGroupLayout *)self numberOfColumns];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  v4 = [(SXMosaicGalleryGroupLayout *)self cluster];
  v5 = [v4 items];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v40;
    double v9 = 1.79769313e308;
    double v10 = 2.22507386e-308;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v40 != v8) {
          objc_enumerationMutation(v5);
        }
        [(SXMosaicGalleryGroupLayout *)self desiredHeightForItem:*(void *)(*((void *)&v39 + 1) + 8 * i)];
        if (v9 >= v12) {
          double v9 = v12;
        }
        if (v10 < v12) {
          double v10 = v12;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v7);

    double v13 = 0.0;
    if (v9 <= v10)
    {
      double v14 = 1.79769313e308;
      do
      {
        long long v37 = 0u;
        long long v38 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        double v15 = [(SXMosaicGalleryGroupLayout *)self cluster];
        double v16 = [v15 items];

        uint64_t v17 = [v16 countByEnumeratingWithState:&v35 objects:v43 count:16];
        double v18 = 0.0;
        if (v17)
        {
          uint64_t v19 = v17;
          uint64_t v20 = *(void *)v36;
          do
          {
            for (uint64_t j = 0; j != v19; ++j)
            {
              if (*(void *)v36 != v20) {
                objc_enumerationMutation(v16);
              }
              v22 = *(void **)(*((void *)&v35 + 1) + 8 * j);
              uint64_t v23 = [(SXMosaicGalleryGroupLayout *)self columnRangeForItem:v22];
              uint64_t v25 = v24;
              v26 = [(SXMosaicGalleryGroupLayout *)self columnLayout];
              objc_msgSend(v26, "widthForColumnRange:numberOfColumns:", v23, v25, v3);
              double v28 = v27;

              [v22 aspectRatio];
              double v30 = v28 + -v9 * v29;
              if (v30 >= 0.0) {
                double v31 = v30;
              }
              else {
                double v31 = -v30;
              }
              [(SXMosaicGalleryGroupLayout *)self desiredHeightForItem:v22];
              double v33 = v9 - v32;
              if (v33 < 0.0) {
                double v33 = -v33;
              }
              if (v33 < 1.0) {
                double v33 = 1.0;
              }
              double v18 = v18 + v31 * v33 * (v31 * v33);
            }
            uint64_t v19 = [v16 countByEnumeratingWithState:&v35 objects:v43 count:16];
          }
          while (v19);
        }

        if (v14 >= v18) {
          double v14 = v18;
        }
        if (v14 == v18) {
          double v13 = v9;
        }
        double v9 = v9 + 1.0;
      }
      while (v9 <= v10);
    }
  }
  else
  {

    return 0.0;
  }
  return v13;
}

- (id)calculateFrames
{
  unint64_t v3 = [MEMORY[0x263EFF980] array];
  v4 = [(SXMosaicGalleryGroupLayout *)self cluster];
  v5 = [v4 items];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    unint64_t v7 = 0;
    double v8 = *MEMORY[0x263F001A8];
    double v9 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v10 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v11 = *(double *)(MEMORY[0x263F001A8] + 24);
    do
    {
      double v12 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", v8, v9, v10, v11);
      [v3 addObject:v12];

      ++v7;
      double v13 = [(SXMosaicGalleryGroupLayout *)self cluster];
      double v14 = [v13 items];
      unint64_t v15 = [v14 count];
    }
    while (v7 < v15);
  }
  double v16 = [MEMORY[0x263EFF8C0] arrayWithArray:v3];

  return v16;
}

- (double)desiredHeightForItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SXMosaicGalleryGroupLayout *)self columnRangeForItem:v4];
  uint64_t v7 = v6;
  [v4 aspectRatio];
  double v9 = v8;

  double v10 = [(SXMosaicGalleryGroupLayout *)self columnLayout];
  objc_msgSend(v10, "widthForColumnRange:numberOfColumns:", v5, v7, -[SXMosaicGalleryGroupLayout numberOfColumns](self, "numberOfColumns"));
  double v12 = v11;

  return round(v12 / v9);
}

- (_NSRange)columnRangeForItem:(id)a3
{
  NSUInteger v3 = 0;
  NSUInteger v4 = 0;
  result.length = v4;
  result.location = v3;
  return result;
}

- (NSMutableArray)columnRanges
{
  columnRanges = self->_columnRanges;
  if (!columnRanges)
  {
    NSUInteger v4 = [MEMORY[0x263EFF980] array];
    uint64_t v5 = [(SXMosaicGalleryGroupLayout *)self cluster];
    uint64_t v6 = [v5 items];
    uint64_t v7 = [v6 count];

    if (v7)
    {
      unint64_t v8 = 0;
      do
      {
        double v9 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", 0, 0);
        [(NSMutableArray *)v4 addObject:v9];

        ++v8;
        double v10 = [(SXMosaicGalleryGroupLayout *)self cluster];
        double v11 = [v10 items];
        unint64_t v12 = [v11 count];
      }
      while (v8 < v12);
    }
    double v13 = self->_columnRanges;
    self->_columnRanges = v4;

    columnRanges = self->_columnRanges;
  }
  return columnRanges;
}

- (unint64_t)numberOfColumns
{
  return self->_numberOfColumns;
}

- (SXMosaicGalleryCluster)cluster
{
  return self->_cluster;
}

- (SXMosaicGalleryColumnLayout)columnLayout
{
  return self->_columnLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_columnLayout, 0);
  objc_storeStrong((id *)&self->_cluster, 0);
  objc_storeStrong((id *)&self->_frames, 0);
  objc_storeStrong((id *)&self->_columnRanges, 0);
}

@end