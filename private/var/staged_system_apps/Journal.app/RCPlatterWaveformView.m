@interface RCPlatterWaveformView
- ($F24F406B2B787EFB06265DBA3D28CBD5)_sliceTimeRangeForIndex:(int64_t)a3 sliceDuration:(double)a4;
- ($F24F406B2B787EFB06265DBA3D28CBD5)currentTimeWindow;
- ($F24F406B2B787EFB06265DBA3D28CBD5)sliceTimeRangeForIndex:(int64_t)a3;
- (BOOL)isAccessibilityElement;
- (CGRect)_activeSliceFrame;
- (CGRect)_inactiveSliceFrame;
- (CGRect)_leadingRoundedFrame;
- (CGRect)_trailingRoundedFrame;
- (CGRect)frameForSlice:(id)a3 sliceType:(int64_t)a4 atIndex:(int64_t)a5;
- (CGSize)intrinsicContentSize;
- (NSMutableArray)activeSliceQueue;
- (NSMutableArray)inactiveSliceStack;
- (NSMutableArray)sliceRecyclerStack;
- (RCPlatterWaveformView)initWithFrame:(CGRect)a3 dataProvider:(id)a4;
- (RCWaveformDataProviding)dataProvider;
- (UIColor)activeSliceColor;
- (UIView)sliceViewContainer;
- (double)_heightForAmplitude:(double)a3;
- (double)_maxHeightForSliceAtIndex:(int64_t)a3 sliceType:(int64_t)a4;
- (double)_roundedSliceWidthPerSide;
- (double)_xPositionForSliceAtIndex:(int64_t)a3 sliceWidth:(double)a4 slicePadding:(double)a5 sliceDuration:(double)a6 inTimeWindow:(id)a7;
- (double)heightForSlice:(id)a3 sliceType:(int64_t)a4 atIndex:(int64_t)a5;
- (double)maximumSliceHeight;
- (double)sliceDuration;
- (double)slicePadding;
- (double)sliceWidth;
- (double)timeWindow;
- (double)xPositionForSliceAtIndex:(int64_t)a3;
- (id)accessibilityLabel;
- (id)sliceWithType:(int64_t)a3;
- (int64_t)_indexForSliceStartTime:(double)a3 sliceDuration:(double)a4;
- (int64_t)indexForSliceStartTime:(double)a3;
- (int64_t)indexOfFirstActiveSlice;
- (unint64_t)numberOfInactiveSlices;
- (unint64_t)numberOfSlices;
- (void)_resetActiveSlicesWithIndex:(int64_t)a3;
- (void)_setupViews;
- (void)_updateAmplitudes;
- (void)_updateSliceColors;
- (void)appendSliceWithType:(int64_t)a3;
- (void)enumerateAllSlices:(id)a3;
- (void)layoutSubviews;
- (void)removeSliceWithType:(int64_t)a3;
- (void)setActiveSliceColor:(id)a3;
- (void)setActiveSliceQueue:(id)a3;
- (void)setCurrentTimeWindow:(id)a3;
- (void)setDataProvider:(id)a3;
- (void)setInactiveSliceStack:(id)a3;
- (void)setIndexOfFirstActiveSlice:(int64_t)a3;
- (void)setSliceColor:(id)a3;
- (void)setSliceRecyclerStack:(id)a3;
- (void)setSliceViewContainer:(id)a3;
- (void)updateActiveSlicesForTimeRange:(id)a3;
- (void)updateFrameForSlice:(id)a3 sliceType:(int64_t)a4 atIndex:(int64_t)a5;
- (void)updateInactiveSlicesForTimeRange:(id)a3 inactiveSliceCount:(unint64_t)a4;
- (void)updateSliceFrames;
- (void)updateSliceFramesForRecordingTime:(double)a3;
- (void)updateSlicesAndFrames;
@end

@implementation RCPlatterWaveformView

- (RCPlatterWaveformView)initWithFrame:(CGRect)a3 dataProvider:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v19.receiver = self;
  v19.super_class = (Class)RCPlatterWaveformView;
  v10 = -[RCPlatterWaveformView initWithFrame:](&v19, "initWithFrame:", x, y, width, height);
  v11 = v10;
  if (v10)
  {
    [(RCPlatterWaveformView *)v10 setDataProvider:v9];
    v12 = +[RCRecorderStyleProvider sharedStyleProvider];
    v13 = [v12 platterWaveformActiveSliceColor];
    [(RCPlatterWaveformView *)v11 setActiveSliceColor:v13];

    v14 = +[NSMutableArray array];
    [(RCPlatterWaveformView *)v11 setActiveSliceQueue:v14];

    v15 = +[NSMutableArray array];
    [(RCPlatterWaveformView *)v11 setInactiveSliceStack:v15];

    v16 = +[NSMutableArray array];
    [(RCPlatterWaveformView *)v11 setSliceRecyclerStack:v16];

    [(RCPlatterWaveformView *)v11 _setupViews];
    v17 = [(RCPlatterWaveformView *)v11 layer];
    [v17 setAllowsHitTesting:0];
  }
  return v11;
}

- (void)_setupViews
{
  v3 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  sliceViewContainer = self->_sliceViewContainer;
  self->_sliceViewContainer = v3;

  [(RCPlatterWaveformView *)self addSubview:self->_sliceViewContainer];
  [(UIView *)self->_sliceViewContainer setTranslatesAutoresizingMaskIntoConstraints:0];
  v5 = [(UIView *)self->_sliceViewContainer leadingAnchor];
  v6 = [(RCPlatterWaveformView *)self leadingAnchor];
  v7 = [v5 constraintEqualToAnchor:v6];
  [v7 setActive:1];

  v8 = [(UIView *)self->_sliceViewContainer trailingAnchor];
  id v9 = [(RCPlatterWaveformView *)self trailingAnchor];
  v10 = [v8 constraintEqualToAnchor:v9];
  [v10 setActive:1];

  v11 = [(UIView *)self->_sliceViewContainer topAnchor];
  v12 = [(RCPlatterWaveformView *)self topAnchor];
  v13 = [v11 constraintEqualToAnchor:v12];
  [v13 setActive:1];

  id v16 = [(UIView *)self->_sliceViewContainer bottomAnchor];
  v14 = [(RCPlatterWaveformView *)self bottomAnchor];
  v15 = [v16 constraintEqualToAnchor:v14];
  [v15 setActive:1];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)RCPlatterWaveformView;
  [(RCPlatterWaveformView *)&v3 layoutSubviews];
  [(RCPlatterWaveformView *)self updateSlicesAndFrames];
}

- (void)updateSliceFramesForRecordingTime:(double)a3
{
  id v5 = [(RCPlatterWaveformView *)self timeWindow];
  RCTimeRangeMake(v5, v7, a3 - v6, a3);
  -[RCPlatterWaveformView setCurrentTimeWindow:](self, "setCurrentTimeWindow:");

  [(RCPlatterWaveformView *)self updateSliceFrames];
}

- (void)updateSliceFrames
{
  [(RCPlatterWaveformView *)self bounds];
  double v4 = v3;
  [(RCPlatterWaveformView *)self bounds];
  if (v4 != 0.0 && v5 != 0.0)
  {
    [(RCPlatterWaveformView *)self updateSlicesAndFrames];
  }
}

- (void)updateSlicesAndFrames
{
  [(RCPlatterWaveformView *)self currentTimeWindow];
  -[RCPlatterWaveformView updateActiveSlicesForTimeRange:](self, "updateActiveSlicesForTimeRange:");
  [(RCPlatterWaveformView *)self currentTimeWindow];
  -[RCPlatterWaveformView updateInactiveSlicesForTimeRange:inactiveSliceCount:](self, "updateInactiveSlicesForTimeRange:inactiveSliceCount:", [(RCPlatterWaveformView *)self numberOfInactiveSlices], v3, v4);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100006CC4;
  v5[3] = &unk_100790DB0;
  v5[4] = self;
  [(RCPlatterWaveformView *)self enumerateAllSlices:v5];
}

- (void)updateActiveSlicesForTimeRange:(id)a3
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  int64_t v6 = -[RCPlatterWaveformView indexForSliceStartTime:](self, "indexForSliceStartTime:");
  [(RCPlatterWaveformView *)self sliceDuration];
  v8 = (unsigned char *)(uint64_t)((var1 - var0) / v7);
  if (v6 < self->_indexOfFirstActiveSlice) {
    [(RCPlatterWaveformView *)self _resetActiveSlicesWithIndex:v6];
  }
  id v9 = [(NSMutableArray *)self->_activeSliceQueue count];
  if (v6 - self->_indexOfFirstActiveSlice >= (unint64_t)v9) {
    uint64_t v10 = (uint64_t)v9;
  }
  else {
    uint64_t v10 = v6 - self->_indexOfFirstActiveSlice;
  }
  uint64_t v11 = v8 - v9 + v10;
  if (v10 >= 1)
  {
    do
    {
      [(RCPlatterWaveformView *)self removeSliceWithType:0];
      --v10;
    }
    while (v10);
  }
  if (v11 >= 1)
  {
    do
    {
      [(RCPlatterWaveformView *)self appendSliceWithType:0];
      --v11;
    }
    while (v11);
  }
  if ([(NSMutableArray *)self->_activeSliceQueue count] != v8)
  {
    v12 = OSLogForCategory(@"Default");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1006752F4(v12, v13, v14, v15, v16, v17, v18, v19);
    }
  }
  self->_indexOfFirstActiveSlice = v6;
  [(RCPlatterWaveformView *)self _updateAmplitudes];
}

- (void)_updateAmplitudes
{
  if (self->_dataProvider)
  {
    double v3 = (char *)[(NSMutableArray *)self->_activeSliceQueue count] - 1;
    if ((uint64_t)v3 < 0) {
      return;
    }
    while (1)
    {
      double v4 = [(NSMutableArray *)self->_activeSliceQueue objectAtIndexedSubscript:v3];
      if (![v4 amplitudeNeedsUpdate]) {
        break;
      }
      [(RCPlatterWaveformView *)self sliceTimeRangeForIndex:&v3[self->_indexOfFirstActiveSlice]];
      char v13 = 0;
      -[RCWaveformDataProviding amplitudeForSliceWithTimeRange:fullTimeRangeSampled:](self->_dataProvider, "amplitudeForSliceWithTimeRange:fullTimeRangeSampled:", &v13);
      -[NSObject setAmplitude:](v4, "setAmplitude:");
      [v4 setAmplitudeNeedsUpdate:v13 == 0];

      if ((uint64_t)v3-- <= 0) {
        return;
      }
    }
  }
  else
  {
    double v4 = OSLogForCategory(@"Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10067536C(v4, v6, v7, v8, v9, v10, v11, v12);
    }
  }
}

- (void)updateInactiveSlicesForTimeRange:(id)a3 inactiveSliceCount:(unint64_t)a4
{
  double var1 = a3.var1;
  [(RCPlatterWaveformView *)self sliceDuration];
  double v8 = var1 + v7 * (double)a4;
  int64_t v9 = [(RCPlatterWaveformView *)self indexForSliceStartTime:var1];
  int64_t v10 = [(RCPlatterWaveformView *)self indexForSliceStartTime:v8];
  if (a4) {
    unint64_t v11 = v10 - v9 + 1;
  }
  else {
    unint64_t v11 = 0;
  }
  while ((unint64_t)[(NSMutableArray *)self->_inactiveSliceStack count] > v11)
    [(RCPlatterWaveformView *)self removeSliceWithType:1];
  while ((unint64_t)[(NSMutableArray *)self->_inactiveSliceStack count] < v11)
    [(RCPlatterWaveformView *)self appendSliceWithType:1];
}

- (void)enumerateAllSlices:(id)a3
{
  id v4 = a3;
  int64_t indexOfFirstActiveSlice = self->_indexOfFirstActiveSlice;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v6 = self->_activeSliceQueue;
  id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      int64_t v10 = 0;
      do
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        (*((void (**)(id, int64_t, void, void))v4 + 2))(v4, (int64_t)v10 + indexOfFirstActiveSlice, *(void *)(*((void *)&v20 + 1) + 8 * (void)v10), 0);
        int64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
      indexOfFirstActiveSlice += (int64_t)v10;
    }
    while (v8);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  unint64_t v11 = self->_inactiveSliceStack;
  id v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        (*((void (**)(id, int64_t, void, uint64_t))v4 + 2))(v4, (int64_t)v15 + indexOfFirstActiveSlice, *(void *)(*((void *)&v16 + 1) + 8 * (void)v15), 1);
        uint64_t v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
      indexOfFirstActiveSlice += (int64_t)v15;
    }
    while (v13);
  }
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)sliceTimeRangeForIndex:(int64_t)a3
{
  [(RCPlatterWaveformView *)self sliceDuration];

  -[RCPlatterWaveformView _sliceTimeRangeForIndex:sliceDuration:](self, "_sliceTimeRangeForIndex:sliceDuration:", a3);
  result.double var1 = v6;
  result.double var0 = v5;
  return result;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_sliceTimeRangeForIndex:(int64_t)a3 sliceDuration:(double)a4
{
  RCTimeRangeMake(self, a2, (double)a3 * a4, (double)a3 * a4 + a4);
  result.double var1 = v5;
  result.double var0 = v4;
  return result;
}

- (int64_t)indexForSliceStartTime:(double)a3
{
  [(RCPlatterWaveformView *)self sliceDuration];

  return [(RCPlatterWaveformView *)self _indexForSliceStartTime:a3 sliceDuration:v5];
}

- (int64_t)_indexForSliceStartTime:(double)a3 sliceDuration:(double)a4
{
  return vcvtmd_s64_f64(a3 / a4);
}

- (void)updateFrameForSlice:(id)a3 sliceType:(int64_t)a4 atIndex:(int64_t)a5
{
  id v8 = a3;
  [(RCPlatterWaveformView *)self frameForSlice:v8 sliceType:a4 atIndex:a5];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  long long v17 = [v8 view];
  [v17 setFrame:v10, v12, v14, v16];

  id v22 = [v8 view];
  [v22 bounds];
  double v19 = v18 * 0.5;
  long long v20 = [v8 view];

  long long v21 = [v20 layer];
  [v21 setCornerRadius:v19];
}

- (CGRect)frameForSlice:(id)a3 sliceType:(int64_t)a4 atIndex:(int64_t)a5
{
  id v8 = a3;
  [(RCPlatterWaveformView *)self sliceWidth];
  double v10 = v9;
  [(RCPlatterWaveformView *)self heightForSlice:v8 sliceType:a4 atIndex:a5];
  double v12 = v11;

  [(RCPlatterWaveformView *)self bounds];
  CGFloat v13 = CGRectGetMidY(v18) + v12 * -0.5;
  [(RCPlatterWaveformView *)self xPositionForSliceAtIndex:a5];
  double v15 = v13;
  double v16 = v10;
  double v17 = v12;
  result.size.double height = v17;
  result.size.double width = v16;
  result.origin.double y = v15;
  result.origin.double x = v14;
  return result;
}

- (CGRect)_activeSliceFrame
{
  [(RCPlatterWaveformView *)self sliceWidth];
  double v4 = v3;
  [(RCPlatterWaveformView *)self slicePadding];
  double v6 = v5;
  unint64_t v7 = [(RCPlatterWaveformView *)self numberOfSlices];
  double v8 = v6 * (double)v7 + (double)v7 * v4;
  [(RCPlatterWaveformView *)self bounds];
  double v10 = v9;
  [(RCPlatterWaveformView *)self bounds];
  double v12 = v11;
  [(RCPlatterWaveformView *)self bounds];
  double v14 = v10;
  double v15 = v12;
  double v16 = v8;
  result.size.double height = v13;
  result.size.double width = v16;
  result.origin.double y = v15;
  result.origin.double x = v14;
  return result;
}

- (CGRect)_inactiveSliceFrame
{
  [(RCPlatterWaveformView *)self _activeSliceFrame];
  double MaxX = CGRectGetMaxX(v12);
  [(RCPlatterWaveformView *)self bounds];
  double v5 = v4 - MaxX;
  [(RCPlatterWaveformView *)self bounds];
  double v7 = v6;
  [(RCPlatterWaveformView *)self bounds];
  double v9 = MaxX;
  double v10 = v7;
  double v11 = v5;
  result.size.double height = v8;
  result.size.double width = v11;
  result.origin.double y = v10;
  result.origin.double x = v9;
  return result;
}

- (double)xPositionForSliceAtIndex:(int64_t)a3
{
  [(RCPlatterWaveformView *)self sliceWidth];
  double v6 = v5;
  [(RCPlatterWaveformView *)self slicePadding];
  double v8 = v7;
  [(RCPlatterWaveformView *)self sliceDuration];
  double v10 = v9;
  [(RCPlatterWaveformView *)self currentTimeWindow];

  -[RCPlatterWaveformView _xPositionForSliceAtIndex:sliceWidth:slicePadding:sliceDuration:inTimeWindow:](self, "_xPositionForSliceAtIndex:sliceWidth:slicePadding:sliceDuration:inTimeWindow:", a3, v6, v8, v10, v11, v12);
  return result;
}

- (double)_xPositionForSliceAtIndex:(int64_t)a3 sliceWidth:(double)a4 slicePadding:(double)a5 sliceDuration:(double)a6 inTimeWindow:(id)a7
{
  return (a4 + a5) * (double)a3 - a7.var0 * ((a4 + a5) / a6);
}

- (double)heightForSlice:(id)a3 sliceType:(int64_t)a4 atIndex:(int64_t)a5
{
  [a3 amplitude];
  -[RCPlatterWaveformView _heightForAmplitude:](self, "_heightForAmplitude:");
  double v9 = v8;
  [(RCPlatterWaveformView *)self _maxHeightForSliceAtIndex:a5 sliceType:a4];
  if (v9 < result) {
    return v9;
  }
  return result;
}

- (double)_heightForAmplitude:(double)a3
{
  [(RCPlatterWaveformView *)self maximumSliceHeight];
  double v6 = v5;
  [(RCPlatterWaveformView *)self minimumSliceHeight];
  return v7 + a3 * (v6 - v7);
}

- (double)_maxHeightForSliceAtIndex:(int64_t)a3 sliceType:(int64_t)a4
{
  [(RCPlatterWaveformView *)self maximumSliceHeight];
  double v8 = v7;
  if (a4 != 1)
  {
    [(RCPlatterWaveformView *)self _leadingRoundedFrame];
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    double v40 = v8;
    CGFloat rect = v13;
    double v15 = v14;
    [(RCPlatterWaveformView *)self _trailingRoundedFrame];
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    CGFloat v39 = v20;
    CGFloat v22 = v21;
    [(RCPlatterWaveformView *)self xPositionForSliceAtIndex:a3];
    double v24 = v23;
    [(RCPlatterWaveformView *)self sliceWidth];
    double v26 = v24 + v25;
    CGFloat v37 = v12;
    CGFloat v38 = v10;
    v42.origin.double x = v10;
    v42.origin.double y = v12;
    CGFloat v27 = v15;
    double v8 = v40;
    v42.size.double height = rect;
    v42.size.double width = v27;
    double MaxX = CGRectGetMaxX(v42);
    CGFloat v36 = v17;
    v43.origin.double x = v17;
    v43.origin.double y = v19;
    v43.size.double width = v39;
    v43.size.double height = v22;
    double MinX = CGRectGetMinX(v43);
    if (v26 <= MaxX || v24 >= MinX)
    {
      if (v26 > MaxX)
      {
        double v31 = 0.0;
        if (v24 >= MinX)
        {
          v45.origin.double y = v19;
          v45.origin.double x = v36;
          v45.size.double width = v39;
          v45.size.double height = v22;
          double v31 = CGRectGetMaxX(v45) - v26;
        }
      }
      else
      {
        v44.origin.double y = v37;
        v44.origin.double x = v38;
        v44.size.double width = v27;
        v44.size.double height = rect;
        double v31 = v24 - CGRectGetMinX(v44);
      }
      [(RCPlatterWaveformView *)self _roundedSliceWidthPerSide];
      double v33 = fmin(v31 / v32, 1.0);
      if (v33 >= 0.0) {
        double v34 = 1.0 - v33;
      }
      else {
        double v34 = 1.0;
      }
      return v40 * sqrt(1.0 - v34 * v34);
    }
  }
  return v8;
}

- (double)_roundedSliceWidthPerSide
{
  double v3 = +[RCRecorderStyleProvider sharedStyleProvider];
  [v3 platterWaveformPercentageOfRoundedSlices];
  double v5 = v4;
  [v3 platterWaveformMinimumRoundedSliceWidthPerSide];
  double v7 = v6;
  [(RCPlatterWaveformView *)self _activeSliceFrame];
  if (v7 >= v5 * v8 * 0.5) {
    double v9 = v7;
  }
  else {
    double v9 = v5 * v8 * 0.5;
  }

  return v9;
}

- (CGRect)_leadingRoundedFrame
{
  [(RCPlatterWaveformView *)self _activeSliceFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  [(RCPlatterWaveformView *)self _roundedSliceWidthPerSide];
  double v10 = v9;
  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  result.size.double height = v13;
  result.size.double width = v10;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (CGRect)_trailingRoundedFrame
{
  [(RCPlatterWaveformView *)self _activeSliceFrame];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(RCPlatterWaveformView *)self _roundedSliceWidthPerSide];
  double v12 = v11;
  v17.origin.double x = v4;
  v17.origin.double y = v6;
  v17.size.double width = v8;
  v17.size.double height = v10;
  double v13 = CGRectGetMaxX(v17) - v12;
  double v14 = v6;
  double v15 = v12;
  double v16 = v10;
  result.size.double height = v16;
  result.size.double width = v15;
  result.origin.double y = v14;
  result.origin.double x = v13;
  return result;
}

- (void)appendSliceWithType:(int64_t)a3
{
  double v5 = &OBJC_IVAR___RCPlatterWaveformView__inactiveSliceStack;
  if (!a3) {
    double v5 = &OBJC_IVAR___RCPlatterWaveformView__activeSliceQueue;
  }
  id v6 = *(id *)((char *)&self->super.super.super.isa + *v5);
  id v9 = [(RCPlatterWaveformView *)self sliceWithType:a3];
  [v6 addObject:v9];

  double v7 = [(RCPlatterWaveformView *)self sliceViewContainer];
  CGFloat v8 = [v9 view];
  [v7 addSubview:v8];
}

- (void)_resetActiveSlicesWithIndex:(int64_t)a3
{
  uint64_t v5 = (uint64_t)[(NSMutableArray *)self->_activeSliceQueue count];
  if (v5 >= 1)
  {
    uint64_t v6 = v5;
    do
    {
      [(RCPlatterWaveformView *)self removeSliceWithType:0];
      --v6;
    }
    while (v6);
  }
  self->_int64_t indexOfFirstActiveSlice = a3;
}

- (void)removeSliceWithType:(int64_t)a3
{
  if (a3 == 1)
  {
    double v7 = [(NSMutableArray *)self->_inactiveSliceStack lastObject];
    if (!v7) {
      return;
    }
    uint64_t v5 = v7;
    CGFloat v8 = [v7 view];
    [v8 removeFromSuperview];

    [(NSMutableArray *)self->_inactiveSliceStack removeLastObject];
  }
  else
  {
    if (a3)
    {
      uint64_t v5 = OSLogForCategory(@"Default");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        sub_1006753E4(v5);
      }
      goto LABEL_10;
    }
    CGFloat v4 = [(NSMutableArray *)self->_activeSliceQueue firstObject];
    if (!v4) {
      return;
    }
    uint64_t v5 = v4;
    uint64_t v6 = [v4 view];
    [v6 removeFromSuperview];

    [(NSMutableArray *)self->_activeSliceQueue removeObjectAtIndex:0];
  }
  [(NSMutableArray *)self->_sliceRecyclerStack addObject:v5];
LABEL_10:
}

- (id)sliceWithType:(int64_t)a3
{
  uint64_t v5 = [(NSMutableArray *)self->_sliceRecyclerStack lastObject];
  if (v5)
  {
    uint64_t v6 = (RCPlatterWaveformSlice *)v5;
    [(NSMutableArray *)self->_sliceRecyclerStack removeLastObject];
  }
  else
  {
    uint64_t v6 = objc_alloc_init(RCPlatterWaveformSlice);
  }
  double v7 = +[RCRecorderStyleProvider sharedStyleProvider];
  CGFloat v8 = v7;
  if (a3) {
    [v7 platterWaveformInactiveSliceColor];
  }
  else {
  id v9 = [(RCPlatterWaveformView *)self activeSliceColor];
  }
  CGFloat v10 = [(RCPlatterWaveformSlice *)v6 view];
  [v10 setBackgroundColor:v9];

  [(RCPlatterWaveformSlice *)v6 setAmplitudeNeedsUpdate:a3 == 0];
  [(RCPlatterWaveformSlice *)v6 setAmplitude:0.0];

  return v6;
}

- (unint64_t)numberOfInactiveSlices
{
  [(RCPlatterWaveformView *)self _inactiveSliceFrame];
  double v4 = v3;
  [(RCPlatterWaveformView *)self sliceWidth];
  double v6 = v5;
  [(RCPlatterWaveformView *)self slicePadding];
  return (unint64_t)(v4 / (v6 + v7));
}

- (void)setSliceColor:(id)a3
{
  [(RCPlatterWaveformView *)self setActiveSliceColor:a3];

  [(RCPlatterWaveformView *)self _updateSliceColors];
}

- (void)_updateSliceColors
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  double v3 = self->_activeSliceQueue;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      double v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        CGFloat v8 = *(void **)(*((void *)&v11 + 1) + 8 * (void)v7);
        id v9 = [(RCPlatterWaveformView *)self activeSliceColor];
        CGFloat v10 = [v8 view];
        [v10 setBackgroundColor:v9];

        double v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (double)timeWindow
{
  v2 = +[RCRecorderStyleProvider sharedStyleProvider];
  [v2 activityWaveformTimeWindowDuration];
  double v4 = v3;

  return v4;
}

- (double)sliceDuration
{
  [(RCPlatterWaveformView *)self timeWindow];
  return v3 / (double)[(RCPlatterWaveformView *)self numberOfSlices];
}

- (unint64_t)numberOfSlices
{
  return 0;
}

- (double)sliceWidth
{
  v2 = +[RCRecorderStyleProvider sharedStyleProvider];
  [v2 platterWaveformSliceWidth];
  double v4 = v3;

  return v4;
}

- (double)slicePadding
{
  v2 = +[RCRecorderStyleProvider sharedStyleProvider];
  [v2 platterWaveformSlicePadding];
  double v4 = v3;

  return v4;
}

- (double)maximumSliceHeight
{
  [(RCPlatterWaveformView *)self frame];
  return v2;
}

- (CGSize)intrinsicContentSize
{
  double v3 = (double)[(RCPlatterWaveformView *)self numberOfSlices];
  [(RCPlatterWaveformView *)self sliceWidth];
  double v5 = v4;
  [(RCPlatterWaveformView *)self slicePadding];
  double v7 = (v3 + -1.0) * v6 + v3 * v5;
  double v8 = UIViewNoIntrinsicMetric;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  double v2 = +[NSBundle mainBundle];
  double v3 = [v2 localizedStringForKey:@"AX_WAVEFORM" value:&stru_1007B9DE8 table:0];

  return v3;
}

- (RCWaveformDataProviding)dataProvider
{
  return self->_dataProvider;
}

- (void)setDataProvider:(id)a3
{
}

- (UIColor)activeSliceColor
{
  return self->_activeSliceColor;
}

- (void)setActiveSliceColor:(id)a3
{
}

- (UIView)sliceViewContainer
{
  return self->_sliceViewContainer;
}

- (void)setSliceViewContainer:(id)a3
{
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)currentTimeWindow
{
  double beginTime = self->_currentTimeWindow.beginTime;
  double endTime = self->_currentTimeWindow.endTime;
  result.double var1 = endTime;
  result.double var0 = beginTime;
  return result;
}

- (void)setCurrentTimeWindow:(id)a3
{
  self->_currentTimeWindow = ($93AB83F55FD8EAABF5C634313E89AB95)a3;
}

- (NSMutableArray)sliceRecyclerStack
{
  return self->_sliceRecyclerStack;
}

- (void)setSliceRecyclerStack:(id)a3
{
}

- (NSMutableArray)activeSliceQueue
{
  return self->_activeSliceQueue;
}

- (void)setActiveSliceQueue:(id)a3
{
}

- (NSMutableArray)inactiveSliceStack
{
  return self->_inactiveSliceStack;
}

- (void)setInactiveSliceStack:(id)a3
{
}

- (int64_t)indexOfFirstActiveSlice
{
  return self->_indexOfFirstActiveSlice;
}

- (void)setIndexOfFirstActiveSlice:(int64_t)a3
{
  self->_int64_t indexOfFirstActiveSlice = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inactiveSliceStack, 0);
  objc_storeStrong((id *)&self->_activeSliceQueue, 0);
  objc_storeStrong((id *)&self->_sliceRecyclerStack, 0);
  objc_storeStrong((id *)&self->_sliceViewContainer, 0);
  objc_storeStrong((id *)&self->_activeSliceColor, 0);

  objc_storeStrong((id *)&self->_dataProvider, 0);
}

@end