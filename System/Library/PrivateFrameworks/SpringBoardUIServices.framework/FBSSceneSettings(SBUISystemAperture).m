@interface FBSSceneSettings(SBUISystemAperture)
- (double)SBUISA_containerViewFrame;
- (double)SBUISA_obstructedAreaLayoutFrame;
- (double)SBUISA_resolvedDetachedMinimalViewFrame;
- (double)SBUISA_resolvedLeadingViewFrame;
- (double)SBUISA_resolvedMinimalViewFrame;
- (double)SBUISA_resolvedTrailingViewFrame;
- (id)SBUI_systemApertureDescription;
- (id)SBUI_systemApertureDescriptionOfDiffFromSettings:()SBUISystemAperture;
- (uint64_t)SBUISA_isBeingRemoved;
- (uint64_t)SBUISA_layoutMode;
- (uint64_t)SBUISA_minimalViewLayoutAxis;
@end

@implementation FBSSceneSettings(SBUISystemAperture)

- (uint64_t)SBUISA_layoutMode
{
  v1 = [a1 otherSettings];
  uint64_t v2 = objc_msgSend(v1, "SBUISA_layoutModeforSetting:", 3213009);

  return v2;
}

- (double)SBUISA_containerViewFrame
{
  v1 = [a1 otherSettings];
  objc_msgSend(v1, "SBUISA_CGRectforSetting:", 3213010);
  double v3 = v2;

  return v3;
}

- (double)SBUISA_resolvedLeadingViewFrame
{
  v1 = [a1 otherSettings];
  objc_msgSend(v1, "SBUISA_CGRectforSetting:", 3213011);
  double v3 = v2;

  return v3;
}

- (double)SBUISA_resolvedTrailingViewFrame
{
  v1 = [a1 otherSettings];
  objc_msgSend(v1, "SBUISA_CGRectforSetting:", 3213012);
  double v3 = v2;

  return v3;
}

- (double)SBUISA_resolvedMinimalViewFrame
{
  v1 = [a1 otherSettings];
  objc_msgSend(v1, "SBUISA_CGRectforSetting:", 3213013);
  double v3 = v2;

  return v3;
}

- (double)SBUISA_resolvedDetachedMinimalViewFrame
{
  v1 = [a1 otherSettings];
  objc_msgSend(v1, "SBUISA_CGRectforSetting:", 3213014);
  double v3 = v2;

  return v3;
}

- (double)SBUISA_obstructedAreaLayoutFrame
{
  v1 = [a1 otherSettings];
  objc_msgSend(v1, "SBUISA_CGRectforSetting:", 3213015);
  double v3 = v2;

  return v3;
}

- (uint64_t)SBUISA_minimalViewLayoutAxis
{
  v1 = [a1 otherSettings];
  double v2 = [v1 objectForSetting:3213016];
  uint64_t v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (uint64_t)SBUISA_isBeingRemoved
{
  v1 = [a1 otherSettings];
  double v2 = [v1 objectForSetting:3213017];
  uint64_t v3 = [v2 BOOLValue];

  return v3;
}

- (id)SBUI_systemApertureDescription
{
  v1 = [a1 otherSettings];
  double v2 = objc_msgSend(v1, "SBUI_systemApertureDescription");

  return v2;
}

- (id)SBUI_systemApertureDescriptionOfDiffFromSettings:()SBUISystemAperture
{
  id v4 = a3;
  v5 = [a1 otherSettings];
  v6 = [v4 otherSettings];

  v7 = objc_msgSend(v5, "SBUI_systemApertureDescriptionOfDiffFromSettings:", v6);

  return v7;
}

@end