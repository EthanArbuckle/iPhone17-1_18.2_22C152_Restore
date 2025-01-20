@interface _PXStoryAspectFittingTimeline_DisplayAssetClip
- ($1FE1EEDD30F8401E3A9AF97812D83A51)clipInfo;
- ($28FEB1B56BB3ED5175BFC6DE64DE503F)clipTimeRange;
- (CGRect)clipFrame;
- (CGRect)transformedFrame;
- (PXDisplayAsset)displayAsset;
- (double)weight;
- (int64_t)compareByClipFrameOriginX:(id)a3;
- (int64_t)compareByClipFrameOriginY:(id)a3;
- (unint64_t)orientation;
- (void)setClipFrame:(CGRect)a3;
- (void)setClipInfo:(id *)a3;
- (void)setClipTimeRange:(id *)a3;
- (void)setDisplayAsset:(id)a3;
- (void)setTransformedFrame:(CGRect)a3;
- (void)setWeight:(double)a3;
@end

@implementation _PXStoryAspectFittingTimeline_DisplayAssetClip

- (void).cxx_destruct
{
}

- (void)setWeight:(double)a3
{
  self->_weight = a3;
}

- (double)weight
{
  return self->_weight;
}

- (void)setTransformedFrame:(CGRect)a3
{
  self->_transformedFrame = a3;
}

- (CGRect)transformedFrame
{
  double x = self->_transformedFrame.origin.x;
  double y = self->_transformedFrame.origin.y;
  double width = self->_transformedFrame.size.width;
  double height = self->_transformedFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setDisplayAsset:(id)a3
{
}

- (PXDisplayAsset)displayAsset
{
  return self->_displayAsset;
}

- (void)setClipInfo:(id *)a3
{
}

- ($1FE1EEDD30F8401E3A9AF97812D83A51)clipInfo
{
  return ($1FE1EEDD30F8401E3A9AF97812D83A51 *)memcpy(retstr, &self->_clipInfo, 0x300uLL);
}

- (void)setClipFrame:(CGRect)a3
{
  self->_clipFrame = a3;
}

- (CGRect)clipFrame
{
  double x = self->_clipFrame.origin.x;
  double y = self->_clipFrame.origin.y;
  double width = self->_clipFrame.size.width;
  double height = self->_clipFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setClipTimeRange:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0.var0;
  long long v4 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&self->_clipTimeRange.duration.timescale = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_clipTimeRange.start.epoch = v4;
  *(_OWORD *)&self->_clipTimeRange.start.value = v3;
}

- ($28FEB1B56BB3ED5175BFC6DE64DE503F)clipTimeRange
{
  long long v3 = *(_OWORD *)&self[2].var0.var1;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[1].var1.var3;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[2].var1.var0;
  return self;
}

- (int64_t)compareByClipFrameOriginY:(id)a3
{
  id v4 = a3;
  [(_PXStoryAspectFittingTimeline_DisplayAssetClip *)self clipFrame];
  double v6 = v5;
  [v4 clipFrame];
  if (v6 >= v7)
  {
    [(_PXStoryAspectFittingTimeline_DisplayAssetClip *)self clipFrame];
    double v10 = v9;
    [v4 clipFrame];
    int64_t v8 = v10 > v11;
  }
  else
  {
    int64_t v8 = -1;
  }

  return v8;
}

- (int64_t)compareByClipFrameOriginX:(id)a3
{
  id v4 = a3;
  [(_PXStoryAspectFittingTimeline_DisplayAssetClip *)self clipFrame];
  double v6 = v5;
  [v4 clipFrame];
  if (v6 >= v7)
  {
    [(_PXStoryAspectFittingTimeline_DisplayAssetClip *)self clipFrame];
    double v10 = v9;
    [v4 clipFrame];
    int64_t v8 = v10 > v11;
  }
  else
  {
    int64_t v8 = -1;
  }

  return v8;
}

- (unint64_t)orientation
{
  v2 = [(_PXStoryAspectFittingTimeline_DisplayAssetClip *)self displayAsset];
  [v2 aspectRatio];
  uint64_t v4 = 3;
  if (v3 < 1.0) {
    uint64_t v4 = 1;
  }
  if (v3 <= 1.0) {
    unint64_t v5 = v4;
  }
  else {
    unint64_t v5 = 2;
  }

  return v5;
}

@end