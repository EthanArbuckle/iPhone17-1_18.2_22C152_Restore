@interface _PXStoryConcreteAspectFitOneUpClipComposition
- (BOOL)clipFramesExtendToBounds;
- (NSString)label;
- (_PXStoryConcreteAspectFitOneUpClipComposition)init;
- (const)clipAssetIndexes;
- (const)dividerAxes;
- (double)mainDividerSplitRatio;
- (id)description;
- (int64_t)mainDividerAxis;
- (int64_t)numberOfAssets;
- (int64_t)numberOfClips;
- (void)getClipFrames:(CGRect *)a3 forContext:(id *)a4;
@end

@implementation _PXStoryConcreteAspectFitOneUpClipComposition

- (int64_t)mainDividerAxis
{
  return self->_mainDividerAxis;
}

- (NSString)label
{
  return (NSString *)@"1-Up Aspect Fit";
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
  v6 = [(_PXStoryConcreteAspectFitOneUpClipComposition *)self label];
  v7 = (void *)[v3 initWithFormat:@"<%@: %p; %@>", v5, self, v6];

  return v7;
}

- (_PXStoryConcreteAspectFitOneUpClipComposition)init
{
  v3.receiver = self;
  v3.super_class = (Class)_PXStoryConcreteAspectFitOneUpClipComposition;
  result = [(_PXStoryConcreteAspectFitOneUpClipComposition *)&v3 init];
  if (result) {
    *(_OWORD *)&result->_clipAssetIndex = xmmword_1AB2F42D0;
  }
  return result;
}

@end