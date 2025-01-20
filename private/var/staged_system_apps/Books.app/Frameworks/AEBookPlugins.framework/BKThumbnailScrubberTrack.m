@interface BKThumbnailScrubberTrack
- (BKThumbnailScrubberTrack)initWithFrame:(CGRect)a3;
- (CGRect)frameForSegmentAtIndex:(int64_t)a3;
- (CGSize)segmentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (Class)cellClass;
- (UIColor)segmentStrokeColor;
- (id)cellAtIndex:(unint64_t)a3;
- (int64_t)segmentCount;
- (void)deleteAllCells;
- (void)layoutSubviews;
- (void)setCellClass:(Class)a3;
- (void)setSegmentCount:(int64_t)a3;
- (void)setSegmentSize:(CGSize)a3;
- (void)setSegmentStrokeColor:(id)a3;
@end

@implementation BKThumbnailScrubberTrack

- (BKThumbnailScrubberTrack)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BKThumbnailScrubberTrack;
  v3 = -[BKThumbnailScrubberTrack initWithFrame:](&v5, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3) {
    [(BKThumbnailScrubberTrack *)v3 setCellClass:objc_opt_class()];
  }
  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  if ([(BKThumbnailScrubberTrack *)self trackOrientation])
  {
    double v5 = (double)[(BKThumbnailScrubberTrack *)self segmentCount];
    [(BKThumbnailScrubberTrack *)self segmentSize];
    double v7 = v6 * v5;
  }
  else
  {
    double v8 = (double)[(BKThumbnailScrubberTrack *)self segmentCount];
    [(BKThumbnailScrubberTrack *)self segmentSize];
    double width = v8 * (v9 + 2.0) + -2.0;
    [(BKThumbnailScrubberTrack *)self segmentSize];
  }
  double v10 = width;
  result.height = v7;
  result.double width = v10;
  return result;
}

- (void)layoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)BKThumbnailScrubberTrack;
  [(BKThumbnailScrubberTrack *)&v10 layoutSubviews];
  v3 = [(BKThumbnailScrubberTrack *)self subviews];
  id v4 = [v3 count];

  if (v4)
  {
    unint64_t v5 = 0;
    do
    {
      double v6 = [(BKThumbnailScrubberTrack *)self subviews];
      double v7 = [v6 objectAtIndex:v5];

      [(BKThumbnailScrubberTrack *)self frameForSegmentAtIndex:v5];
      [v7 setFrame:];

      ++v5;
      double v8 = [(BKThumbnailScrubberTrack *)self subviews];
      id v9 = [v8 count];
    }
    while (v5 < (unint64_t)v9);
  }
}

- (CGRect)frameForSegmentAtIndex:(int64_t)a3
{
  [(BKThumbnailScrubberTrack *)self bounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  [(BKThumbnailScrubberTrack *)self segmentSize];
  double v14 = v13;
  double v16 = v15;
  v27.origin.x = v6;
  v27.origin.y = v8;
  v27.size.double width = v10;
  v27.size.height = v12;
  double Width = CGRectGetWidth(v27);
  uint64_t v18 = [(BKThumbnailScrubberTrack *)self segmentCount];
  double v19 = 0.0;
  if ([(BKThumbnailScrubberTrack *)self trackOrientation] != 1)
  {
    v28.origin.x = v6;
    v28.origin.y = v8;
    v28.size.double width = v10;
    v28.size.height = v12;
    double v19 = round((CGRectGetHeight(v28) - v16) * 0.5);
  }
  double v20 = round((Width - (double)v18 * (v14 + 2.0)) * 0.5);
  if (v20 >= 0.0) {
    double v21 = v20;
  }
  else {
    double v21 = 0.0;
  }
  unsigned int v22 = [(BKThumbnailScrubberTrack *)self trackOrientation];
  double v23 = v19 + (double)a3 * v16;
  double v24 = v21 + (double)a3 * (v14 + 2.0);
  if (v22 == 1) {
    double v24 = v21;
  }
  else {
    double v23 = v19;
  }
  double v25 = v14;
  double v26 = v16;
  result.size.height = v26;
  result.size.double width = v25;
  result.origin.y = v23;
  result.origin.x = v24;
  return result;
}

- (id)cellAtIndex:(unint64_t)a3
{
  double v5 = [(BKThumbnailScrubberTrack *)self subviews];
  id v6 = [v5 count];

  if ((unint64_t)v6 <= a3)
  {
    CGFloat v8 = 0;
  }
  else
  {
    double v7 = [(BKThumbnailScrubberTrack *)self subviews];
    CGFloat v8 = [v7 objectAtIndex:a3];
  }

  return v8;
}

- (void)deleteAllCells
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(BKThumbnailScrubberTrack *)self subviews];
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) removeFromSuperview];
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)setCellClass:(Class)a3
{
  if (self->_cellClass != a3)
  {
    self->_cellClass = a3;
    [(BKThumbnailScrubberTrack *)self deleteAllCells];
  }
}

- (void)setSegmentSize:(CGSize)a3
{
  if (self->_segmentSize.width != a3.width || self->_segmentSize.height != a3.height) {
    self->_segmentSize = a3;
  }
}

- (void)setSegmentCount:(int64_t)a3
{
  if (self->_segmentCount != a3
    || ([(BKThumbnailScrubberTrack *)self subviews],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        id v6 = [v5 count],
        v5,
        v6 != (id)a3))
  {
    self->_segmentCount = a3;
    [(BKThumbnailScrubberTrack *)self segmentSize];
    double v8 = v7;
    double v10 = v9;
    double v11 = [(BKThumbnailScrubberTrack *)self subviews];
    id v12 = [v11 count];

    if ((unint64_t)v12 > a3)
    {
      double v13 = [(BKThumbnailScrubberTrack *)self subviews];
      id v14 = [v13 count];

      for (int64_t i = (int64_t)v14 - 1; i >= a3; --i)
      {
        double v16 = [(BKThumbnailScrubberTrack *)self subviews];
        v17 = [v16 objectAtIndex:i];

        [v17 removeFromSuperview];
      }
      [(BKThumbnailScrubberTrack *)self setNeedsLayout];
    }
    uint64_t v18 = [(BKThumbnailScrubberTrack *)self subviews];
    id v19 = [v18 count];

    if ((unint64_t)v19 < a3)
    {
      double v20 = [(BKThumbnailScrubberTrack *)self subviews];
      id v21 = [v20 count];

      BOOL v22 = __OFSUB__(a3, v21);
      uint64_t v23 = a3 - (void)v21;
      if (!((v23 < 0) ^ v22 | (v23 == 0)))
      {
        do
        {
          id v24 = [objc_alloc(-[BKThumbnailScrubberTrack cellClass](self, "cellClass")) initWithFrame:0.0, 0.0, v8, v10];
          double v25 = [(BKThumbnailScrubberTrack *)self segmentStrokeColor];
          [v24 setStrokeColor:v25];

          [(BKThumbnailScrubberTrack *)self addSubview:v24];
          --v23;
        }
        while (v23);
      }
      [(BKThumbnailScrubberTrack *)self setNeedsLayout];
    }
  }
}

- (int64_t)segmentCount
{
  return self->_segmentCount;
}

- (Class)cellClass
{
  return self->_cellClass;
}

- (CGSize)segmentSize
{
  double width = self->_segmentSize.width;
  double height = self->_segmentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (UIColor)segmentStrokeColor
{
  return self->_segmentStrokeColor;
}

- (void)setSegmentStrokeColor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end