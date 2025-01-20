@interface UIView(NTKDialMarkerView)
- (uint64_t)_setAffineTransform:()NTKDialMarkerView;
- (uint64_t)addToParentView:()NTKDialMarkerView;
@end

@implementation UIView(NTKDialMarkerView)

- (uint64_t)addToParentView:()NTKDialMarkerView
{
  return [a3 addSubview:a1];
}

- (uint64_t)_setAffineTransform:()NTKDialMarkerView
{
  long long v3 = a3[1];
  v5[0] = *a3;
  v5[1] = v3;
  v5[2] = a3[2];
  return [a1 setTransform:v5];
}

@end