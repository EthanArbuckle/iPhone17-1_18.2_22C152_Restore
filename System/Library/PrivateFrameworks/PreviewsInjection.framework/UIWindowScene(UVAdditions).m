@interface UIWindowScene(UVAdditions)
- (double)displayScale;
- (double)previewMaximumSize;
- (id)displayName;
@end

@implementation UIWindowScene(UVAdditions)

- (double)previewMaximumSize
{
  v1 = [a1 _FBSScene];
  v2 = [v1 settings];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v2 previewMaximumSize];
    double v4 = v3;
  }
  else
  {
    v5 = [v2 displayConfiguration];
    [v5 bounds];
    double v4 = v6;
  }
  return v4;
}

- (id)displayName
{
  v1 = [a1 _FBSScene];
  v2 = [v1 settings];
  double v3 = [v2 displayConfiguration];
  double v4 = [v3 name];

  return v4;
}

- (double)displayScale
{
  v1 = [a1 _FBSScene];
  v2 = [v1 settings];
  double v3 = [v2 displayConfiguration];
  [v3 pointScale];
  double v5 = v4;

  return v5;
}

@end