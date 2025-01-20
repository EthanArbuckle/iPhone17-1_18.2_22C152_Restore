@interface UISDisplayContext(DisplayInfoProviding)
- (double)homeAffordanceOverlayAllowance;
- (double)peripheryInsets;
- (double)safeAreaInsetsLandscapeLeft;
- (double)safeAreaInsetsLandscapeRight;
- (double)safeAreaInsetsPortrait;
- (double)safeAreaInsetsPortraitUpsideDown;
- (double)systemMinimumMargin;
@end

@implementation UISDisplayContext(DisplayInfoProviding)

- (double)safeAreaInsetsPortrait
{
  v1 = [a1 displayEdgeInfo];
  v2 = [v1 safeAreaInsetsPortrait];
  double v3 = UIEdgeInsetsFromApplicationSupportDisplayEdgeInsetsWrapper(v2);

  return v3;
}

- (double)homeAffordanceOverlayAllowance
{
  v1 = [a1 displayEdgeInfo];
  v2 = [v1 homeAffordanceOverlayAllowance];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (double)peripheryInsets
{
  v1 = [a1 displayEdgeInfo];
  v2 = [v1 peripheryInsets];
  double v3 = UIEdgeInsetsFromApplicationSupportDisplayEdgeInsetsWrapper(v2);

  return v3;
}

- (double)safeAreaInsetsLandscapeLeft
{
  v2 = [a1 displayEdgeInfo];
  double v3 = [v2 safeAreaInsetsLandscapeLeft];

  double v4 = [a1 displayEdgeInfo];
  v5 = v4;
  if (v3)
  {
    v6 = [v4 safeAreaInsetsLandscapeLeft];
  }
  else
  {
    v7 = [v4 safeAreaInsetsLandscapeRight];

    v8 = [a1 displayEdgeInfo];
    v5 = v8;
    if (v7) {
      [v8 safeAreaInsetsLandscapeRight];
    }
    else {
    v6 = [v8 safeAreaInsetsPortrait];
    }
  }
  v9 = v6;
  double v10 = UIEdgeInsetsFromApplicationSupportDisplayEdgeInsetsWrapper(v6);

  return v10;
}

- (double)safeAreaInsetsPortraitUpsideDown
{
  v2 = [a1 displayEdgeInfo];
  double v3 = [v2 safeAreaInsetsPortraitUpsideDown];

  double v4 = [a1 displayEdgeInfo];
  v5 = v4;
  if (v3) {
    [v4 safeAreaInsetsPortraitUpsideDown];
  }
  else {
  v6 = [v4 safeAreaInsetsPortrait];
  }
  double v7 = UIEdgeInsetsFromApplicationSupportDisplayEdgeInsetsWrapper(v6);

  return v7;
}

- (double)safeAreaInsetsLandscapeRight
{
  v2 = [a1 displayEdgeInfo];
  double v3 = [v2 safeAreaInsetsLandscapeRight];

  double v4 = [a1 displayEdgeInfo];
  v5 = v4;
  if (v3)
  {
    v6 = [v4 safeAreaInsetsLandscapeRight];
  }
  else
  {
    double v7 = [v4 safeAreaInsetsLandscapeLeft];

    v8 = [a1 displayEdgeInfo];
    v5 = v8;
    if (v7) {
      [v8 safeAreaInsetsLandscapeLeft];
    }
    else {
    v6 = [v8 safeAreaInsetsPortrait];
    }
  }
  v9 = v6;
  double v10 = UIEdgeInsetsFromApplicationSupportDisplayEdgeInsetsWrapper(v6);

  return v10;
}

- (double)systemMinimumMargin
{
  v1 = [a1 displayEdgeInfo];
  v2 = [v1 systemMinimumMargin];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

@end