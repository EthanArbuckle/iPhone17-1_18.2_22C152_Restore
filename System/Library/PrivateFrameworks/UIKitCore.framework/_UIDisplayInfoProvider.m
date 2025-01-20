@interface _UIDisplayInfoProvider
- (FBSDisplayConfiguration)displayConfiguration;
- (UIEdgeInsets)peripheryInsets;
- (UIEdgeInsets)safeAreaInsetsLandscapeLeft;
- (UIEdgeInsets)safeAreaInsetsLandscapeRight;
- (UIEdgeInsets)safeAreaInsetsPortrait;
- (UIEdgeInsets)safeAreaInsetsPortraitUpsideDown;
- (_UIDisplayInfoShape)exclusionArea;
- (double)homeAffordanceOverlayAllowance;
- (double)systemMinimumMargin;
- (unint64_t)artworkSubtype;
@end

@implementation _UIDisplayInfoProvider

- (FBSDisplayConfiguration)displayConfiguration
{
  return self->displayConfiguration;
}

- (unint64_t)artworkSubtype
{
  return self->artworkSubtype;
}

- (double)homeAffordanceOverlayAllowance
{
  return self->homeAffordanceOverlayAllowance;
}

- (double)systemMinimumMargin
{
  return self->systemMinimumMargin;
}

- (UIEdgeInsets)peripheryInsets
{
  double top = self->peripheryInsets.top;
  double left = self->peripheryInsets.left;
  double bottom = self->peripheryInsets.bottom;
  double right = self->peripheryInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIEdgeInsets)safeAreaInsetsPortrait
{
  double top = self->safeAreaInsetsPortrait.top;
  double left = self->safeAreaInsetsPortrait.left;
  double bottom = self->safeAreaInsetsPortrait.bottom;
  double right = self->safeAreaInsetsPortrait.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (_UIDisplayInfoShape)exclusionArea
{
  return self->exclusionArea;
}

- (UIEdgeInsets)safeAreaInsetsLandscapeLeft
{
  double top = self->safeAreaInsetsLandscapeLeft.top;
  double left = self->safeAreaInsetsLandscapeLeft.left;
  double bottom = self->safeAreaInsetsLandscapeLeft.bottom;
  double right = self->safeAreaInsetsLandscapeLeft.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIEdgeInsets)safeAreaInsetsLandscapeRight
{
  double top = self->safeAreaInsetsLandscapeRight.top;
  double left = self->safeAreaInsetsLandscapeRight.left;
  double bottom = self->safeAreaInsetsLandscapeRight.bottom;
  double right = self->safeAreaInsetsLandscapeRight.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIEdgeInsets)safeAreaInsetsPortraitUpsideDown
{
  double top = self->safeAreaInsetsPortraitUpsideDown.top;
  double left = self->safeAreaInsetsPortraitUpsideDown.left;
  double bottom = self->safeAreaInsetsPortraitUpsideDown.bottom;
  double right = self->safeAreaInsetsPortraitUpsideDown.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->exclusionArea, 0);
  objc_storeStrong((id *)&self->displayConfiguration, 0);
}

@end