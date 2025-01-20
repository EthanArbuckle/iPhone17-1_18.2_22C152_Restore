@interface UIViewController(PXViewController)
- (double)px_referenceSize;
- (double)px_windowReferenceSize;
@end

@implementation UIViewController(PXViewController)

- (double)px_windowReferenceSize
{
  v1 = [a1 viewIfLoaded];
  v2 = [v1 window];

  if (v2)
  {
    [v2 bounds];
    double v4 = v3;
  }
  else
  {
    double v4 = *(double *)off_1E5DAB030;
  }

  return v4;
}

- (double)px_referenceSize
{
  if (([a1 isViewLoaded] & 1) == 0) {
    return *(double *)off_1E5DAB030;
  }
  v2 = [a1 view];
  [v2 bounds];
  double v4 = v3;

  return v4;
}

@end