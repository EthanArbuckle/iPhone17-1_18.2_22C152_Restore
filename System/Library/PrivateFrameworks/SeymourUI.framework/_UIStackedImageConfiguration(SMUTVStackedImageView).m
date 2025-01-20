@interface _UIStackedImageConfiguration(SMUTVStackedImageView)
+ (id)smu_newImageConfiguration;
- (void)resetShadowSettings;
@end

@implementation _UIStackedImageConfiguration(SMUTVStackedImageView)

+ (id)smu_newImageConfiguration
{
  v0 = (void *)[MEMORY[0x263F830F0] newStandardConfiguration];
  [v0 setMaximumParallaxImages:6];
  [v0 setRadiosityStrength:0.0];

  return v0;
}

- (void)resetShadowSettings
{
  objc_msgSend((id)objc_opt_class(), "smu_newImageConfiguration");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 defaultFocusedShadowOpacity];
  objc_msgSend(a1, "setDefaultFocusedShadowOpacity:");
  [v2 defaultHighlightedShadowOpacity];
  objc_msgSend(a1, "setDefaultHighlightedShadowOpacity:");
  [v2 defaultUnfocusedShadowOpacity];
  objc_msgSend(a1, "setDefaultUnfocusedShadowOpacity:");
  [v2 defaultFocusedShadowRadius];
  objc_msgSend(a1, "setDefaultFocusedShadowRadius:");
  [v2 defaultHighlightedShadowRadius];
  objc_msgSend(a1, "setDefaultHighlightedShadowRadius:");
  [v2 defaultUnfocusedShadowRadius];
  objc_msgSend(a1, "setDefaultUnfocusedShadowRadius:");
  [v2 defaultFocusedShadowVerticalOffset];
  objc_msgSend(a1, "setDefaultFocusedShadowVerticalOffset:");
  [v2 defaultHighlightedShadowVerticalOffset];
  objc_msgSend(a1, "setDefaultHighlightedShadowVerticalOffset:");
  [v2 defaultUnfocusedShadowVerticalOffset];
  objc_msgSend(a1, "setDefaultUnfocusedShadowVerticalOffset:");
}

@end