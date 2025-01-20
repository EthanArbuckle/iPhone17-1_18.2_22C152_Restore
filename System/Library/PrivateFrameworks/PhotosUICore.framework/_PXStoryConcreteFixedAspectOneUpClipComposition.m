@interface _PXStoryConcreteFixedAspectOneUpClipComposition
- (BOOL)clipFramesExtendToBounds;
- (NSString)label;
- (_PXStoryConcreteFixedAspectOneUpClipComposition)initWithAspectRatioNumerator:(int64_t)a3 denominator:(int64_t)a4;
- (const)clipAssetIndexes;
- (const)dividerAxes;
- (double)aspectRatio;
- (double)mainDividerSplitRatio;
- (id)description;
- (int64_t)mainDividerAxis;
- (int64_t)numberOfAssets;
- (int64_t)numberOfClips;
- (void)getClipFrames:(CGRect *)a3 forContext:(id *)a4;
@end

@implementation _PXStoryConcreteFixedAspectOneUpClipComposition

- (void).cxx_destruct
{
}

- (double)aspectRatio
{
  return self->_aspectRatio;
}

- (NSString)label
{
  return self->_label;
}

- (int64_t)mainDividerAxis
{
  return self->_mainDividerAxis;
}

- (const)clipAssetIndexes
{
  return &self->_clipAssetIndex;
}

- (int64_t)numberOfAssets
{
  return 1;
}

- (double)mainDividerSplitRatio
{
  return 0.0;
}

- (const)dividerAxes
{
  return &self->_mainDividerAxis;
}

- (BOOL)clipFramesExtendToBounds
{
  return 0;
}

- (void)getClipFrames:(CGRect *)a3 forContext:(id *)a4
{
}

- (int64_t)numberOfClips
{
  return 1;
}

- (id)description
{
  id v3 = [NSString alloc];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(_PXStoryConcreteFixedAspectOneUpClipComposition *)self label];
  v7 = (void *)[v3 initWithFormat:@"<%@: %p; %@>", v5, self, v6];

  return v7;
}

- (_PXStoryConcreteFixedAspectOneUpClipComposition)initWithAspectRatioNumerator:(int64_t)a3 denominator:(int64_t)a4
{
  v11.receiver = self;
  v11.super_class = (Class)_PXStoryConcreteFixedAspectOneUpClipComposition;
  v6 = [(_PXStoryConcreteFixedAspectOneUpClipComposition *)&v11 init];
  v7 = v6;
  if (v6)
  {
    v6->_aspectRatio = (double)a3 / (double)a4;
    uint64_t v8 = objc_msgSend([NSString alloc], "initWithFormat:", @"1-Up %li:%li", a3, a4);
    label = v7->_label;
    v7->_label = (NSString *)v8;

    *(_OWORD *)&v7->_clipAssetIndex = xmmword_1AB2F42D0;
  }
  return v7;
}

@end