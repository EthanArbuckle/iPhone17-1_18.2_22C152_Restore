@interface PXLemonadeOneUpSettings
+ (BOOL)isOneUpRefreshEnabled;
+ (id)settingsControllerModule;
+ (id)sharedInstance;
- (BOOL)chromeLibraryScrubberEnabled;
- (BOOL)chromeLibraryScrubberHiddenWhileZoomed;
- (BOOL)doubleTapFillsScreen;
- (BOOL)enableChromeDebugHorizontalCenterGuides;
- (BOOL)enableLegibilityBlur;
- (BOOL)enableSideCommentsInLandscape;
- (BOOL)insetAllContent;
- (BOOL)internal_isOneUpRefreshEnabled;
- (BOOL)loopAllVideos;
- (BOOL)showAudioMixButton;
- (BOOL)showChromeSafeAreaBox;
- (BOOL)showLegibilityGradientBorders;
- (BOOL)showPlaybackRateButton;
- (BOOL)useCenteredTitleStyle;
- (double)chromeButtonsEDRBoost;
- (double)chromeDebugHorizontalCenterRadius;
- (double)chromeTitleEDRBoost;
- (double)chromeVideoControlsEDRBoost;
- (double)dismissalFractionForHidingChrome;
- (double)insetContentBorderOpacityDarkMode;
- (double)insetContentBorderOpacityLightMode;
- (double)insetContentBorderWidth;
- (double)insetContentCornerRadius;
- (double)legibilityBlurDistanceToBaseline;
- (double)legibilityBlurRadius;
- (double)legibilityTintOpacity;
- (double)minimumDurationForVideoLooping;
- (double)minimumMarginForInsetContent;
- (double)minimumVideoScrubberWidth;
- (id)parentSettings;
- (int64_t)chromeEDRBoostBehavior;
- (int64_t)debugBarKindRawValue;
- (int64_t)insetMode;
- (int64_t)legibilityBlurCurve;
- (int64_t)legibilityTintCurve;
- (int64_t)regularSizeClassInsetMode;
- (int64_t)screenshotInsetMode;
- (int64_t)version;
- (void)setChromeButtonsEDRBoost:(double)a3;
- (void)setChromeDebugHorizontalCenterRadius:(double)a3;
- (void)setChromeEDRBoostBehavior:(int64_t)a3;
- (void)setChromeLibraryScrubberEnabled:(BOOL)a3;
- (void)setChromeLibraryScrubberHiddenWhileZoomed:(BOOL)a3;
- (void)setChromeTitleEDRBoost:(double)a3;
- (void)setChromeVideoControlsEDRBoost:(double)a3;
- (void)setDebugBarKindRawValue:(int64_t)a3;
- (void)setDefaultValues;
- (void)setDismissalFractionForHidingChrome:(double)a3;
- (void)setDoubleTapFillsScreen:(BOOL)a3;
- (void)setEnableChromeDebugHorizontalCenterGuides:(BOOL)a3;
- (void)setEnableLegibilityBlur:(BOOL)a3;
- (void)setEnableSideCommentsInLandscape:(BOOL)a3;
- (void)setInsetAllContent:(BOOL)a3;
- (void)setInsetContentBorderOpacityDarkMode:(double)a3;
- (void)setInsetContentBorderOpacityLightMode:(double)a3;
- (void)setInsetContentBorderWidth:(double)a3;
- (void)setInsetContentCornerRadius:(double)a3;
- (void)setInsetMode:(int64_t)a3;
- (void)setInternal_isOneUpRefreshEnabled:(BOOL)a3;
- (void)setLegibilityBlurCurve:(int64_t)a3;
- (void)setLegibilityBlurDistanceToBaseline:(double)a3;
- (void)setLegibilityBlurRadius:(double)a3;
- (void)setLegibilityTintCurve:(int64_t)a3;
- (void)setLegibilityTintOpacity:(double)a3;
- (void)setLoopAllVideos:(BOOL)a3;
- (void)setMinimumDurationForVideoLooping:(double)a3;
- (void)setMinimumMarginForInsetContent:(double)a3;
- (void)setMinimumVideoScrubberWidth:(double)a3;
- (void)setRegularSizeClassInsetMode:(int64_t)a3;
- (void)setScreenshotInsetMode:(int64_t)a3;
- (void)setShowAudioMixButton:(BOOL)a3;
- (void)setShowChromeSafeAreaBox:(BOOL)a3;
- (void)setShowLegibilityGradientBorders:(BOOL)a3;
- (void)setShowPlaybackRateButton:(BOOL)a3;
- (void)setUseCenteredTitleStyle:(BOOL)a3;
@end

@implementation PXLemonadeOneUpSettings

- (void)setDefaultValues
{
  v4.receiver = self;
  v4.super_class = (Class)PXLemonadeOneUpSettings;
  [(PTSettings *)&v4 setDefaultValues];
  if (PLIsPhotosAppAnyPlatform() & 1) != 0 || (PLIsCamera()) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = PLIsPreferences();
  }
  [(PXLemonadeOneUpSettings *)self setInternal_isOneUpRefreshEnabled:v3];
  [(PXLemonadeOneUpSettings *)self setChromeLibraryScrubberEnabled:1];
  [(PXLemonadeOneUpSettings *)self setChromeLibraryScrubberHiddenWhileZoomed:1];
  [(PXLemonadeOneUpSettings *)self setChromeEDRBoostBehavior:3];
  [(PXLemonadeOneUpSettings *)self setChromeButtonsEDRBoost:2.0];
  [(PXLemonadeOneUpSettings *)self setChromeTitleEDRBoost:3.0];
  [(PXLemonadeOneUpSettings *)self setChromeVideoControlsEDRBoost:3.0];
  [(PXLemonadeOneUpSettings *)self setEnableChromeDebugHorizontalCenterGuides:0];
  [(PXLemonadeOneUpSettings *)self setChromeDebugHorizontalCenterRadius:60.0];
  [(PXLemonadeOneUpSettings *)self setMinimumDurationForVideoLooping:1.0];
  [(PXLemonadeOneUpSettings *)self setMinimumMarginForInsetContent:12.0];
  [(PXLemonadeOneUpSettings *)self setInsetContentCornerRadius:5.0];
  [(PXLemonadeOneUpSettings *)self setInsetContentBorderWidth:1.0];
  [(PXLemonadeOneUpSettings *)self setInsetContentBorderOpacityDarkMode:0.1];
  [(PXLemonadeOneUpSettings *)self setInsetContentBorderOpacityLightMode:0.05];
  [(PXLemonadeOneUpSettings *)self setInsetAllContent:0];
  [(PXLemonadeOneUpSettings *)self setDebugBarKindRawValue:0x7FFFFFFFFFFFFFFFLL];
  [(PXLemonadeOneUpSettings *)self setUseCenteredTitleStyle:1];
  [(PXLemonadeOneUpSettings *)self setEnableLegibilityBlur:1];
  [(PXLemonadeOneUpSettings *)self setLegibilityBlurCurve:4];
  [(PXLemonadeOneUpSettings *)self setLegibilityBlurRadius:5.0];
  [(PXLemonadeOneUpSettings *)self setLegibilityBlurDistanceToBaseline:20.0];
  [(PXLemonadeOneUpSettings *)self setLegibilityTintCurve:4];
  [(PXLemonadeOneUpSettings *)self setLegibilityTintOpacity:0.75];
  [(PXLemonadeOneUpSettings *)self setDismissalFractionForHidingChrome:0.05];
  [(PXLemonadeOneUpSettings *)self setMinimumVideoScrubberWidth:200.0];
  [(PXLemonadeOneUpSettings *)self setShowPlaybackRateButton:0];
  [(PXLemonadeOneUpSettings *)self setShowAudioMixButton:0];
  [(PXLemonadeOneUpSettings *)self setLoopAllVideos:1];
  [(PXLemonadeOneUpSettings *)self setEnableSideCommentsInLandscape:1];
  [(PXLemonadeOneUpSettings *)self setShowChromeSafeAreaBox:0];
  [(PXLemonadeOneUpSettings *)self setShowLegibilityGradientBorders:0];
  [(PXLemonadeOneUpSettings *)self setDoubleTapFillsScreen:1];
  [(PXLemonadeOneUpSettings *)self setInsetMode:2];
  [(PXLemonadeOneUpSettings *)self setScreenshotInsetMode:2];
  [(PXLemonadeOneUpSettings *)self setRegularSizeClassInsetMode:1];
}

- (void)setShowPlaybackRateButton:(BOOL)a3
{
  self->_showPlaybackRateButton = a3;
}

- (void)setShowLegibilityGradientBorders:(BOOL)a3
{
  self->_showLegibilityGradientBorders = a3;
}

- (void)setShowChromeSafeAreaBox:(BOOL)a3
{
  self->_showChromeSafeAreaBox = a3;
}

- (void)setShowAudioMixButton:(BOOL)a3
{
  self->_showAudioMixButton = a3;
}

- (void)setMinimumVideoScrubberWidth:(double)a3
{
  self->_minimumVideoScrubberWidth = a3;
}

- (void)setMinimumMarginForInsetContent:(double)a3
{
  self->_minimumMarginForInsetContent = a3;
}

- (void)setMinimumDurationForVideoLooping:(double)a3
{
  self->_minimumDurationForVideoLooping = a3;
}

- (void)setLoopAllVideos:(BOOL)a3
{
  self->_loopAllVideos = a3;
}

- (void)setLegibilityTintOpacity:(double)a3
{
  self->_legibilityTintOpacity = a3;
}

- (void)setLegibilityTintCurve:(int64_t)a3
{
  self->_legibilityTintCurve = a3;
}

- (void)setLegibilityBlurRadius:(double)a3
{
  self->_legibilityBlurRadius = a3;
}

- (void)setLegibilityBlurDistanceToBaseline:(double)a3
{
  self->_legibilityBlurDistanceToBaseline = a3;
}

- (void)setLegibilityBlurCurve:(int64_t)a3
{
  self->_legibilityBlurCurve = a3;
}

- (void)setInternal_isOneUpRefreshEnabled:(BOOL)a3
{
  self->_internal_isOneUpRefreshEnabled = a3;
}

- (void)setInsetContentCornerRadius:(double)a3
{
  self->_insetContentCornerRadius = a3;
}

- (void)setInsetContentBorderWidth:(double)a3
{
  self->_insetContentBorderWidth = a3;
}

- (void)setInsetContentBorderOpacityLightMode:(double)a3
{
  self->_insetContentBorderOpacityLightMode = a3;
}

- (void)setInsetContentBorderOpacityDarkMode:(double)a3
{
  self->_insetContentBorderOpacityDarkMode = a3;
}

- (void)setInsetAllContent:(BOOL)a3
{
  self->_insetAllContent = a3;
}

- (void)setEnableSideCommentsInLandscape:(BOOL)a3
{
  self->_enableSideCommentsInLandscape = a3;
}

- (void)setEnableLegibilityBlur:(BOOL)a3
{
  self->_enableLegibilityBlur = a3;
}

- (void)setEnableChromeDebugHorizontalCenterGuides:(BOOL)a3
{
  self->_enableChromeDebugHorizontalCenterGuides = a3;
}

- (void)setDoubleTapFillsScreen:(BOOL)a3
{
  self->_doubleTapFillsScreen = a3;
}

- (void)setDismissalFractionForHidingChrome:(double)a3
{
  self->_dismissalFractionForHidingChrome = a3;
}

- (void)setDebugBarKindRawValue:(int64_t)a3
{
  self->_debugBarKindRawValue = a3;
}

- (void)setChromeVideoControlsEDRBoost:(double)a3
{
  self->_chromeVideoControlsEDRBoost = a3;
}

- (void)setChromeTitleEDRBoost:(double)a3
{
  self->_chromeTitleEDRBoost = a3;
}

- (void)setChromeLibraryScrubberHiddenWhileZoomed:(BOOL)a3
{
  self->_chromeLibraryScrubberHiddenWhileZoomed = a3;
}

- (void)setChromeLibraryScrubberEnabled:(BOOL)a3
{
  self->_chromeLibraryScrubberEnabled = a3;
}

- (void)setChromeEDRBoostBehavior:(int64_t)a3
{
  self->_chromeEDRBoostBehavior = a3;
}

- (void)setChromeDebugHorizontalCenterRadius:(double)a3
{
  self->_chromeDebugHorizontalCenterRadius = a3;
}

- (void)setChromeButtonsEDRBoost:(double)a3
{
  self->_chromeButtonsEDRBoost = a3;
}

+ (id)settingsControllerModule
{
}

- (BOOL)internal_isOneUpRefreshEnabled
{
  return self->_internal_isOneUpRefreshEnabled;
}

- (void)setUseCenteredTitleStyle:(BOOL)a3
{
  self->_useCenteredTitleStyle = a3;
}

- (BOOL)useCenteredTitleStyle
{
  return self->_useCenteredTitleStyle;
}

- (BOOL)showLegibilityGradientBorders
{
  return self->_showLegibilityGradientBorders;
}

- (BOOL)showChromeSafeAreaBox
{
  return self->_showChromeSafeAreaBox;
}

- (int64_t)debugBarKindRawValue
{
  return self->_debugBarKindRawValue;
}

- (BOOL)enableSideCommentsInLandscape
{
  return self->_enableSideCommentsInLandscape;
}

- (double)dismissalFractionForHidingChrome
{
  return self->_dismissalFractionForHidingChrome;
}

- (BOOL)doubleTapFillsScreen
{
  return self->_doubleTapFillsScreen;
}

- (double)minimumDurationForVideoLooping
{
  return self->_minimumDurationForVideoLooping;
}

- (BOOL)loopAllVideos
{
  return self->_loopAllVideos;
}

- (BOOL)showAudioMixButton
{
  return self->_showAudioMixButton;
}

- (BOOL)showPlaybackRateButton
{
  return self->_showPlaybackRateButton;
}

- (double)minimumVideoScrubberWidth
{
  return self->_minimumVideoScrubberWidth;
}

- (void)setRegularSizeClassInsetMode:(int64_t)a3
{
  self->_regularSizeClassInsetMode = a3;
}

- (int64_t)regularSizeClassInsetMode
{
  return self->_regularSizeClassInsetMode;
}

- (void)setScreenshotInsetMode:(int64_t)a3
{
  self->_screenshotInsetMode = a3;
}

- (int64_t)screenshotInsetMode
{
  return self->_screenshotInsetMode;
}

- (void)setInsetMode:(int64_t)a3
{
  self->_insetMode = a3;
}

- (int64_t)insetMode
{
  return self->_insetMode;
}

- (BOOL)insetAllContent
{
  return self->_insetAllContent;
}

- (double)insetContentBorderOpacityLightMode
{
  return self->_insetContentBorderOpacityLightMode;
}

- (double)insetContentBorderOpacityDarkMode
{
  return self->_insetContentBorderOpacityDarkMode;
}

- (double)insetContentBorderWidth
{
  return self->_insetContentBorderWidth;
}

- (double)insetContentCornerRadius
{
  return self->_insetContentCornerRadius;
}

- (double)minimumMarginForInsetContent
{
  return self->_minimumMarginForInsetContent;
}

- (double)chromeDebugHorizontalCenterRadius
{
  return self->_chromeDebugHorizontalCenterRadius;
}

- (BOOL)enableChromeDebugHorizontalCenterGuides
{
  return self->_enableChromeDebugHorizontalCenterGuides;
}

- (double)legibilityTintOpacity
{
  return self->_legibilityTintOpacity;
}

- (int64_t)legibilityTintCurve
{
  return self->_legibilityTintCurve;
}

- (double)legibilityBlurDistanceToBaseline
{
  return self->_legibilityBlurDistanceToBaseline;
}

- (double)legibilityBlurRadius
{
  return self->_legibilityBlurRadius;
}

- (int64_t)legibilityBlurCurve
{
  return self->_legibilityBlurCurve;
}

- (BOOL)enableLegibilityBlur
{
  return self->_enableLegibilityBlur;
}

- (double)chromeVideoControlsEDRBoost
{
  return self->_chromeVideoControlsEDRBoost;
}

- (double)chromeTitleEDRBoost
{
  return self->_chromeTitleEDRBoost;
}

- (double)chromeButtonsEDRBoost
{
  return self->_chromeButtonsEDRBoost;
}

- (int64_t)chromeEDRBoostBehavior
{
  return self->_chromeEDRBoostBehavior;
}

- (BOOL)chromeLibraryScrubberHiddenWhileZoomed
{
  return self->_chromeLibraryScrubberHiddenWhileZoomed;
}

- (BOOL)chromeLibraryScrubberEnabled
{
  return self->_chromeLibraryScrubberEnabled;
}

- (int64_t)version
{
  return 1;
}

- (id)parentSettings
{
  return +[PXLemonadeSettings sharedInstance];
}

+ (BOOL)isOneUpRefreshEnabled
{
  v2 = +[PXLemonadeOneUpSettings sharedInstance];
  char v3 = objc_msgSend(v2, "internal_isOneUpRefreshEnabled");

  return v3;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_32853 != -1) {
    dispatch_once(&sharedInstance_onceToken_32853, &__block_literal_global_32854);
  }
  v2 = (void *)sharedInstance_sharedInstance_32855;
  return v2;
}

void __41__PXLemonadeOneUpSettings_sharedInstance__block_invoke()
{
  id v2 = +[PXLemonadeSettings sharedInstance];
  uint64_t v0 = [v2 oneUpSettings];
  v1 = (void *)sharedInstance_sharedInstance_32855;
  sharedInstance_sharedInstance_32855 = v0;
}

@end