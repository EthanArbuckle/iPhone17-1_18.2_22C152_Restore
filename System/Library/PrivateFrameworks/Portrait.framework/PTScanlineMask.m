@interface PTScanlineMask
+ (id)scanlineMaskWithFocusBlurMap:(id)a3 region:(id)a4;
- (CGRect)placement;
- (id)scanlineIter;
- (void)setPlacement:(CGRect)a3;
@end

@implementation PTScanlineMask

+ (id)scanlineMaskWithFocusBlurMap:(id)a3 region:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[PTScanlineMask_FocusBlurMap alloc] initWithFocusBlurMap:v6 region:v5];

  return v7;
}

- (id)scanlineIter
{
  return 0;
}

- (CGRect)placement
{
  objc_copyStruct(v6, &self->_placement, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setPlacement:(CGRect)a3
{
  CGRect v3 = a3;
  objc_copyStruct(&self->_placement, &v3, 32, 1, 0);
}

@end