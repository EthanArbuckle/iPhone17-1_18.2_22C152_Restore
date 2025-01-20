@interface UIGestureRecognizer(PhotosUICore)
- (BOOL)_px_isGestureRecognizerForKey:()PhotosUICore ofScrollView:;
- (double)px_locationInCoordinateSpace:()PhotosUICore;
- (uint64_t)px_cancel;
- (uint64_t)px_isPanGestureRecognizerOfScrollView:()PhotosUICore;
- (uint64_t)px_isPinchGestureRecognizerOfScrollView:()PhotosUICore;
@end

@implementation UIGestureRecognizer(PhotosUICore)

- (uint64_t)px_cancel
{
  uint64_t result = [a1 isEnabled];
  if (result)
  {
    [a1 setEnabled:0];
    return [a1 setEnabled:1];
  }
  return result;
}

- (BOOL)_px_isGestureRecognizerForKey:()PhotosUICore ofScrollView:
{
  id v6 = a3;
  v7 = [a1 delegate];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    v9 = [v8 valueForKey:v6];
    BOOL v10 = v9 == a1;

    if (a4 && v9 == a1)
    {
      id v8 = v8;
      *a4 = v8;
      BOOL v10 = 1;
    }
  }
  else
  {
    BOOL v10 = 0;
    id v8 = 0;
  }

  return v10;
}

- (uint64_t)px_isPinchGestureRecognizerOfScrollView:()PhotosUICore
{
  v5 = NSStringFromSelector(sel_pinchGestureRecognizer);
  uint64_t v6 = objc_msgSend(a1, "_px_isGestureRecognizerForKey:ofScrollView:", v5, a3);

  return v6;
}

- (uint64_t)px_isPanGestureRecognizerOfScrollView:()PhotosUICore
{
  v5 = NSStringFromSelector(sel_panGestureRecognizer);
  uint64_t v6 = objc_msgSend(a1, "_px_isGestureRecognizerForKey:ofScrollView:", v5, a3);

  return v6;
}

- (double)px_locationInCoordinateSpace:()PhotosUICore
{
  id v4 = a3;
  v5 = [a1 view];
  [a1 locationInView:v5];
  objc_msgSend(v4, "convertPoint:fromCoordinateSpace:", v5);
  double v7 = v6;

  return v7;
}

@end