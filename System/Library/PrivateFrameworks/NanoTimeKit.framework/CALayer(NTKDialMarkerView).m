@interface CALayer(NTKDialMarkerView)
- (double)alpha;
- (uint64_t)_setAffineTransform:()NTKDialMarkerView;
- (uint64_t)setAlpha:()NTKDialMarkerView;
- (void)addToParentView:()NTKDialMarkerView;
@end

@implementation CALayer(NTKDialMarkerView)

- (void)addToParentView:()NTKDialMarkerView
{
  id v4 = [a3 layer];
  [v4 addSublayer:a1];
}

- (uint64_t)setAlpha:()NTKDialMarkerView
{
  *(float *)&a3 = a3;
  return [a1 setOpacity:a3];
}

- (double)alpha
{
  [a1 opacity];
  return v1;
}

- (uint64_t)_setAffineTransform:()NTKDialMarkerView
{
  long long v3 = a3[1];
  v5[0] = *a3;
  v5[1] = v3;
  v5[2] = a3[2];
  return [a1 setAffineTransform:v5];
}

@end