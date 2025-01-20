@interface SBIconView(SwitcherIconZooming)
- (double)adjustedCrossfadeProgressForCrossfadeProgress:()SwitcherIconZooming;
- (id)matchingIconZoomingViewOverlay;
- (uint64_t)cleanUpAfterCrossfadeCompletion;
- (uint64_t)hasSameOriginatingIconAsForIconZoomingView:()SwitcherIconZooming;
- (uint64_t)iconImageAlignment;
- (uint64_t)scaleForFadeValue:()SwitcherIconZooming originalSize:containerSize:;
- (uint64_t)shouldClipToBoundsWhenSizeChanges;
- (void)prepareToCrossfadeImageWithView:()SwitcherIconZooming;
@end

@implementation SBIconView(SwitcherIconZooming)

- (uint64_t)scaleForFadeValue:()SwitcherIconZooming originalSize:containerSize:
{
  return [a1 iconImageFrame];
}

- (uint64_t)shouldClipToBoundsWhenSizeChanges
{
  v2 = [a1 icon];
  v3 = [v2 gridSizeClass];
  uint64_t v4 = *MEMORY[0x1E4FA6518];
  if (v3 == (void *)*MEMORY[0x1E4FA6518])
  {
    uint64_t v7 = 0;
  }
  else
  {
    v5 = [a1 icon];
    v6 = [v5 gridSizeClass];
    uint64_t v7 = [v6 isEqualToString:v4] ^ 1;
  }
  return v7;
}

- (uint64_t)iconImageAlignment
{
  v1 = [a1 customIconImageViewController];
  uint64_t v2 = [v1 imageViewAlignment];

  if (v2) {
    return 2;
  }
  else {
    return 1;
  }
}

- (id)matchingIconZoomingViewOverlay
{
  uint64_t v2 = [a1 matchingIconViewByAddingConfigurationOptions:6 removingConfigurationOptions:0];
  [v2 setCustomIconImageViewControllerPriority:2];
  [v2 setShowsSquareCorners:1];
  [v2 setEnabled:0];
  [v2 setIconContentScale:1.0];
  if ([a1 iconImageSizeMatchesBoundsSize])
  {
    [v2 setIconImageSizeMatchesBoundsSize:1];
    [a1 bounds];
    objc_msgSend(v2, "setBounds:");
  }
  return v2;
}

- (void)prepareToCrossfadeImageWithView:()SwitcherIconZooming
{
  id v13 = a3;
  uint64_t v4 = [a1 icon];
  v5 = [v4 gridSizeClass];
  unint64_t v6 = *MEMORY[0x1E4FA6518];

  if ((unint64_t)v5 <= v6)
  {
    uint64_t v12 = 3;
  }
  else
  {
    uint64_t v7 = objc_opt_class();
    v8 = SBSafeCast(v7, v4);
    v9 = [v8 activeWidget];
    v10 = [v9 containerBundleIdentifier];
    int v11 = [v10 isEqualToString:@"com.apple.mobileslideshow"];

    if (v11) {
      uint64_t v12 = 11;
    }
    else {
      uint64_t v12 = 3;
    }
  }
  [a1 prepareToCrossfadeImageWithView:v13 options:v12];
}

- (uint64_t)cleanUpAfterCrossfadeCompletion
{
  [a1 cleanupAfterCrossfade];
  return [a1 setIcon:0];
}

- (uint64_t)hasSameOriginatingIconAsForIconZoomingView:()SwitcherIconZooming
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    v9 = [v8 icon];
    uint64_t v10 = [a1 isEqual:v9];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (double)adjustedCrossfadeProgressForCrossfadeProgress:()SwitcherIconZooming
{
  id v4 = [a1 icon];
  uint64_t v5 = [v4 gridSizeClass];
  id v6 = v5;
  uint64_t v7 = *MEMORY[0x1E4FA6530];
  if (v5 == (void *)*MEMORY[0x1E4FA6530])
  {

    goto LABEL_5;
  }
  id v8 = [a1 icon];
  v9 = [v8 gridSizeClass];
  int v10 = [v9 isEqualToString:v7];

  if (v10)
  {
LABEL_5:
    double v11 = (a2 + -0.05) * 4.0;
    return fmin(fmax(v11 + 0.0, 0.0), 1.0);
  }
  double v11 = (a2 + -0.25) / 0.35;
  return fmin(fmax(v11 + 0.0, 0.0), 1.0);
}

@end