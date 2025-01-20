@interface _PUVideoHighlightStripView
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)videoDuration;
- (BOOL)isOpaque;
- (BOOL)isPlaying;
- (NSArray)highlightTimeRanges;
- (UIColor)highlightColor;
- (_PUVideoHighlightStripView)initWithFrame:(CGRect)a3;
- (int64_t)currentTimeRangeIndex;
- (void)_updateBarsExpanded;
- (void)_updateCurrentTimeRangeIndex;
- (void)_updateHighlightViews;
- (void)layoutSubviews;
- (void)setCurrentTime:(id *)a3;
- (void)setCurrentTimeRangeIndex:(int64_t)a3;
- (void)setHighlightColor:(id)a3;
- (void)setHighlightTimeRanges:(id)a3;
- (void)setIsPlaying:(BOOL)a3;
- (void)setVideoDuration:(id *)a3;
@end

@implementation _PUVideoHighlightStripView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightColor, 0);
  objc_storeStrong((id *)&self->_highlightTimeRanges, 0);
  objc_storeStrong((id *)&self->_highlightViews, 0);
}

- (UIColor)highlightColor
{
  return self->_highlightColor;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 472);
  return self;
}

- (int64_t)currentTimeRangeIndex
{
  return self->_currentTimeRangeIndex;
}

- (NSArray)highlightTimeRanges
{
  return self->_highlightTimeRanges;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)videoDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 448);
  return self;
}

- (BOOL)isPlaying
{
  return self->_isPlaying;
}

- (void)_updateBarsExpanded
{
  int64_t v3 = [(_PUVideoHighlightStripView *)self currentTimeRangeIndex];
  BOOL v4 = [(_PUVideoHighlightStripView *)self isPlaying];
  highlightViews = self->_highlightViews;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49___PUVideoHighlightStripView__updateBarsExpanded__block_invoke;
  v6[3] = &__block_descriptor_41_e41_v32__0___PUVideoHighlightBarView_8Q16_B24l;
  BOOL v7 = v4;
  v6[4] = v3;
  [(NSArray *)highlightViews enumerateObjectsUsingBlock:v6];
}

- (void)layoutSubviews
{
  v31.receiver = self;
  v31.super_class = (Class)_PUVideoHighlightStripView;
  [(_PUVideoHighlightStripView *)&v31 layoutSubviews];
  [(_PUVideoHighlightStripView *)self bounds];
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  memset(&v30, 0, sizeof(v30));
  [(_PUVideoHighlightStripView *)self videoDuration];
  CMTime time = v30;
  Float64 Seconds = CMTimeGetSeconds(&time);
  v12 = [(_PUVideoHighlightStripView *)self highlightTimeRanges];
  v13 = [(_PUVideoHighlightStripView *)self highlightColor];
  highlightViews = self->_highlightViews;
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  v19 = __44___PUVideoHighlightStripView_layoutSubviews__block_invoke;
  v20 = &unk_1E5F2C488;
  id v21 = v13;
  id v22 = v12;
  Float64 v23 = Seconds;
  uint64_t v24 = v4;
  uint64_t v25 = v6;
  uint64_t v26 = v8;
  uint64_t v27 = v10;
  uint64_t v28 = v8;
  id v15 = v12;
  id v16 = v13;
  [(NSArray *)highlightViews enumerateObjectsUsingBlock:&v17];
  [(_PUVideoHighlightStripView *)self _updateBarsExpanded];
}

- (void)_updateHighlightViews
{
  uint64_t v3 = [(_PUVideoHighlightStripView *)self highlightTimeRanges];
  unint64_t v4 = [v3 count];

  uint64_t v9 = self->_highlightViews;
  if ([(NSArray *)v9 count] < v4)
  {
    uint64_t v5 = (void *)[(NSArray *)v9 mutableCopy];
    while ([v5 count] < v4)
    {
      uint64_t v6 = objc_alloc_init(_PUVideoHighlightBarView);
      [(_PUVideoHighlightBarView *)v6 setUserInteractionEnabled:0];
      [(_PUVideoHighlightStripView *)self addSubview:v6];
      [v5 addObject:v6];
    }
    uint64_t v7 = (NSArray *)[v5 copy];
    highlightViews = self->_highlightViews;
    self->_highlightViews = v7;
  }
  [(_PUVideoHighlightStripView *)self layoutIfNeeded];
}

- (void)setCurrentTimeRangeIndex:(int64_t)a3
{
  if (self->_currentTimeRangeIndex != a3)
  {
    self->_currentTimeRangeIndex = a3;
    [(_PUVideoHighlightStripView *)self _updateBarsExpanded];
  }
}

- (void)_updateCurrentTimeRangeIndex
{
  long long v11 = 0uLL;
  uint64_t v12 = 0;
  [(_PUVideoHighlightStripView *)self currentTime];
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v3 = [(_PUVideoHighlightStripView *)self highlightTimeRanges];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58___PUVideoHighlightStripView__updateCurrentTimeRangeIndex__block_invoke;
  v4[3] = &unk_1E5F2C460;
  long long v5 = v11;
  uint64_t v6 = v12;
  v4[4] = &v7;
  [v3 enumerateObjectsUsingBlock:v4];

  [(_PUVideoHighlightStripView *)self setCurrentTimeRangeIndex:v8[3]];
  _Block_object_dispose(&v7, 8);
}

- (void)setHighlightTimeRanges:(id)a3
{
  uint64_t v8 = (NSArray *)a3;
  unint64_t v4 = self->_highlightTimeRanges;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSArray *)v8 isEqual:v4];

    if ((v5 & 1) == 0)
    {
      uint64_t v6 = (NSArray *)[(NSArray *)v8 copy];
      highlightTimeRanges = self->_highlightTimeRanges;
      self->_highlightTimeRanges = v6;

      [(_PUVideoHighlightStripView *)self _updateHighlightViews];
      [(_PUVideoHighlightStripView *)self _updateCurrentTimeRangeIndex];
      [(_PUVideoHighlightStripView *)self setNeedsLayout];
    }
  }
}

- (void)setIsPlaying:(BOOL)a3
{
  if (self->_isPlaying != a3)
  {
    self->_isPlaying = a3;
    [(_PUVideoHighlightStripView *)self _updateBarsExpanded];
  }
}

- (void)setCurrentTime:(id *)a3
{
  p_$95D729B680665BEAEFA1D6FCA8238556 currentTime = &self->_currentTime;
  CMTime time1 = *(CMTime *)a3;
  $95D729B680665BEAEFA1D6FCA8238556 currentTime = self->_currentTime;
  if (CMTimeCompare(&time1, (CMTime *)&currentTime))
  {
    long long v6 = *(_OWORD *)&a3->var0;
    p_currentTime->epoch = a3->var3;
    *(_OWORD *)&p_currentTime->value = v6;
    [(_PUVideoHighlightStripView *)self _updateCurrentTimeRangeIndex];
  }
}

- (void)setVideoDuration:(id *)a3
{
  p_$95D729B680665BEAEFA1D6FCA8238556 videoDuration = &self->_videoDuration;
  CMTime time1 = *(CMTime *)a3;
  $95D729B680665BEAEFA1D6FCA8238556 videoDuration = self->_videoDuration;
  if (CMTimeCompare(&time1, (CMTime *)&videoDuration))
  {
    long long v6 = *(_OWORD *)&a3->var0;
    p_videoDuration->epoch = a3->var3;
    *(_OWORD *)&p_videoDuration->value = v6;
    [(_PUVideoHighlightStripView *)self setNeedsLayout];
  }
}

- (void)setHighlightColor:(id)a3
{
  uint64_t v7 = (UIColor *)a3;
  char v5 = self->_highlightColor;
  if (v5 == v7)
  {
  }
  else
  {
    char v6 = [(UIColor *)v7 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_highlightColor, a3);
      [(_PUVideoHighlightStripView *)self setNeedsLayout];
    }
  }
}

- (BOOL)isOpaque
{
  return 0;
}

- (_PUVideoHighlightStripView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_PUVideoHighlightStripView;
  uint64_t v3 = -[_PUVideoHighlightStripView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  unint64_t v4 = v3;
  if (v3)
  {
    highlightViews = v3->_highlightViews;
    v3->_highlightViews = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  return v4;
}

@end