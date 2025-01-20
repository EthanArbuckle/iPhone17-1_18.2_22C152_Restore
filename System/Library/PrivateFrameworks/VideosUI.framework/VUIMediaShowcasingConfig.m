@interface VUIMediaShowcasingConfig
- (BOOL)allowsFullscreenMediaTransition;
- (BOOL)backgroundMediaTransferEnabled;
- (BOOL)carouselBehaviorEnabled;
- (BOOL)gradientUsesImageColor;
- (BOOL)isAutoAdvanceToNextPageEnabled;
- (BOOL)isParallaxEnabled;
- (BOOL)isRubberBandingEnabled;
- (VUIMediaShowcasingConfig)init;
- (double)advanceToNextPageDelayDuration;
- (double)advanceToNextPageDelayDurationImageOnly;
- (double)animationTransitionDuration;
- (double)autoSwipeAnimationDuration;
- (double)backgroundMediaFullscreenTransitionDuration;
- (double)backgroundMediaTransferAnimationDuration;
- (double)focusDebounceThreshold;
- (double)hideMuteButtonDelayDuration;
- (double)hidePageIndicatorsDelayDuration;
- (double)itemHoverDelayDuration;
- (double)playbackDelayInterval;
- (double)swipingEndAnimationDuration;
- (double)volumeTransitionAnimationDuration;
- (float)backgroundVolume;
- (float)foregroundVolume;
- (float)metadataFadeInSpeed;
- (float)metadataFadeOutSpeed;
- (float)navigationBarTransitionDistance;
- (float)parallaxRatio;
- (float)sidebarOpenDuringAnimationThreshold;
- (float)swipeCompletionSpeedFactor;
- (float)swipeSpeedFactor;
- (float)titleViewTransitionDistance;
- (unint64_t)numberOfVolumeIncrements;
- (void)setAdvanceToNextPageDelayDuration:(double)a3;
- (void)setAdvanceToNextPageDelayDurationImageOnly:(double)a3;
- (void)setAllowsFullscreenMediaTransition:(BOOL)a3;
- (void)setAnimationTransitionDuration:(double)a3;
- (void)setAutoAdvanceToNextPageEnabled:(BOOL)a3;
- (void)setAutoSwipeAnimationDuration:(double)a3;
- (void)setBackgroundMediaFullscreenTransitionDuration:(double)a3;
- (void)setBackgroundMediaTransferAnimationDuration:(double)a3;
- (void)setBackgroundMediaTransferEnabled:(BOOL)a3;
- (void)setBackgroundVolume:(float)a3;
- (void)setCarouselBehaviorEnabled:(BOOL)a3;
- (void)setFocusDebounceThreshold:(double)a3;
- (void)setForegroundVolume:(float)a3;
- (void)setGradientUsesImageColor:(BOOL)a3;
- (void)setHideMuteButtonDelayDuration:(double)a3;
- (void)setHidePageIndicatorsDelayDuration:(double)a3;
- (void)setItemHoverDelayDuration:(double)a3;
- (void)setMetadataFadeInSpeed:(float)a3;
- (void)setMetadataFadeOutSpeed:(float)a3;
- (void)setNavigationBarTransitionDistance:(float)a3;
- (void)setNumberOfVolumeIncrements:(unint64_t)a3;
- (void)setParallaxEnabled:(BOOL)a3;
- (void)setParallaxRatio:(float)a3;
- (void)setPlaybackDelayInterval:(double)a3;
- (void)setRubberBandingEnabled:(BOOL)a3;
- (void)setSidebarOpenDuringAnimationThreshold:(float)a3;
- (void)setSwipeCompletionSpeedFactor:(float)a3;
- (void)setSwipeSpeedFactor:(float)a3;
- (void)setSwipingEndAnimationDuration:(double)a3;
- (void)setTitleViewTransitionDistance:(float)a3;
- (void)setVolumeTransitionAnimationDuration:(double)a3;
@end

@implementation VUIMediaShowcasingConfig

- (void)setVolumeTransitionAnimationDuration:(double)a3
{
  self->_volumeTransitionAnimationDuration = a3;
}

- (void)setTitleViewTransitionDistance:(float)a3
{
  self->_titleViewTransitionDistance = a3;
}

- (void)setSwipingEndAnimationDuration:(double)a3
{
  self->_swipingEndAnimationDuration = a3;
}

- (void)setSidebarOpenDuringAnimationThreshold:(float)a3
{
  self->_sidebarOpenDuringAnimationThreshold = a3;
}

- (void)setRubberBandingEnabled:(BOOL)a3
{
  self->_rubberBandingEnabled = a3;
}

- (void)setPlaybackDelayInterval:(double)a3
{
  self->_playbackDelayInterval = a3;
}

- (void)setParallaxRatio:(float)a3
{
  self->_parallaxRatio = a3;
}

- (void)setParallaxEnabled:(BOOL)a3
{
  self->_parallaxEnabled = a3;
}

- (void)setNavigationBarTransitionDistance:(float)a3
{
  self->_navigationBarTransitionDistance = a3;
}

- (void)setMetadataFadeOutSpeed:(float)a3
{
  self->_metadataFadeOutSpeed = a3;
}

- (void)setMetadataFadeInSpeed:(float)a3
{
  self->_metadataFadeInSpeed = a3;
}

- (void)setItemHoverDelayDuration:(double)a3
{
  self->_itemHoverDelayDuration = a3;
}

- (void)setHidePageIndicatorsDelayDuration:(double)a3
{
  self->_hidePageIndicatorsDelayDuration = a3;
}

- (void)setHideMuteButtonDelayDuration:(double)a3
{
  self->_hideMuteButtonDelayDuration = a3;
}

- (void)setGradientUsesImageColor:(BOOL)a3
{
  self->_gradientUsesImageColor = a3;
}

- (void)setForegroundVolume:(float)a3
{
  self->_foregroundVolume = a3;
}

- (void)setCarouselBehaviorEnabled:(BOOL)a3
{
  self->_carouselBehaviorEnabled = a3;
}

- (void)setBackgroundVolume:(float)a3
{
  self->_backgroundVolume = a3;
}

- (void)setBackgroundMediaTransferEnabled:(BOOL)a3
{
  self->_backgroundMediaTransferEnabled = a3;
}

- (void)setBackgroundMediaTransferAnimationDuration:(double)a3
{
  self->_backgroundMediaTransferAnimationDuration = a3;
}

- (void)setAutoSwipeAnimationDuration:(double)a3
{
  self->_autoSwipeAnimationDuration = a3;
}

- (void)setAutoAdvanceToNextPageEnabled:(BOOL)a3
{
  self->_autoAdvanceToNextPageEnabled = a3;
}

- (void)setAnimationTransitionDuration:(double)a3
{
  self->_animationTransitionDuration = a3;
}

- (void)setAdvanceToNextPageDelayDurationImageOnly:(double)a3
{
  self->_advanceToNextPageDelayDurationImageOnly = a3;
}

- (void)setAdvanceToNextPageDelayDuration:(double)a3
{
  self->_advanceToNextPageDelayDuration = a3;
}

- (VUIMediaShowcasingConfig)init
{
  v17.receiver = self;
  v17.super_class = (Class)VUIMediaShowcasingConfig;
  v2 = [(VUIMediaShowcasingConfig *)&v17 init];
  if (v2)
  {
    char v3 = [MEMORY[0x1E4FB3C90] isPhone];
    double v4 = 0.5;
    if ((v3 & 1) == 0)
    {
      int v5 = objc_msgSend(MEMORY[0x1E4FB3C90], "isTV", 0.5);
      double v4 = 2.0;
      if (v5) {
        double v4 = 1.0;
      }
    }
    *((double *)v2 + 7) = v4;
    __asm { FMOV            V0.2S, #-1.0 }
    *((void *)v2 + 2) = _D0;
    *((_WORD *)v2 + 4) = 257;
    __asm { FMOV            V0.2D, #0.75 }
    *((_OWORD *)v2 + 4) = _Q0;
    *((_OWORD *)v2 + 5) = xmmword_1E38FDFF0;
    *((void *)v2 + 12) = 5;
    *((void *)v2 + 13) = 0x3FD3333333333333;
    char v12 = [MEMORY[0x1E4FB3C90] isTV];
    double v13 = 1.0;
    if ((v12 & 1) == 0)
    {
      int v14 = objc_msgSend(MEMORY[0x1E4FB3C90], "isMac", 1.0);
      double v13 = 0.400000006;
      if (!v14) {
        double v13 = 0.75;
      }
    }
    *((double *)v2 + 14) = v13;
    *(_OWORD *)(v2 + 120) = xmmword_1E38FE000;
    *(_OWORD *)(v2 + 24) = xmmword_1E38FE010;
    *((void *)v2 + 5) = 0x3F0000003FC00000;
    *(_OWORD *)(v2 + 136) = xmmword_1E38FE020;
    *(_DWORD *)(v2 + 10) = 65793;
    __asm { FMOV            V0.2D, #5.0 }
    *(_OWORD *)(v2 + 152) = _Q0;
    v2[14] = 0;
    *((_DWORD *)v2 + 13) = 1065185444;
  }
  return (VUIMediaShowcasingConfig *)v2;
}

- (double)playbackDelayInterval
{
  return self->_playbackDelayInterval;
}

- (double)animationTransitionDuration
{
  return self->_animationTransitionDuration;
}

- (float)backgroundVolume
{
  return self->_backgroundVolume;
}

- (float)foregroundVolume
{
  return self->_foregroundVolume;
}

- (BOOL)backgroundMediaTransferEnabled
{
  return self->_backgroundMediaTransferEnabled;
}

- (double)backgroundMediaTransferAnimationDuration
{
  return self->_backgroundMediaTransferAnimationDuration;
}

- (double)backgroundMediaFullscreenTransitionDuration
{
  return self->_backgroundMediaFullscreenTransitionDuration;
}

- (void)setBackgroundMediaFullscreenTransitionDuration:(double)a3
{
  self->_backgroundMediaFullscreenTransitionDuration = a3;
}

- (double)volumeTransitionAnimationDuration
{
  return self->_volumeTransitionAnimationDuration;
}

- (unint64_t)numberOfVolumeIncrements
{
  return self->_numberOfVolumeIncrements;
}

- (void)setNumberOfVolumeIncrements:(unint64_t)a3
{
  self->_numberOfVolumeIncrements = a3;
}

- (BOOL)isRubberBandingEnabled
{
  return self->_rubberBandingEnabled;
}

- (double)swipingEndAnimationDuration
{
  return self->_swipingEndAnimationDuration;
}

- (double)autoSwipeAnimationDuration
{
  return self->_autoSwipeAnimationDuration;
}

- (BOOL)carouselBehaviorEnabled
{
  return self->_carouselBehaviorEnabled;
}

- (float)titleViewTransitionDistance
{
  return self->_titleViewTransitionDistance;
}

- (float)navigationBarTransitionDistance
{
  return self->_navigationBarTransitionDistance;
}

- (BOOL)isAutoAdvanceToNextPageEnabled
{
  return self->_autoAdvanceToNextPageEnabled;
}

- (double)advanceToNextPageDelayDuration
{
  return self->_advanceToNextPageDelayDuration;
}

- (double)advanceToNextPageDelayDurationImageOnly
{
  return self->_advanceToNextPageDelayDurationImageOnly;
}

- (BOOL)isParallaxEnabled
{
  return self->_parallaxEnabled;
}

- (float)parallaxRatio
{
  return self->_parallaxRatio;
}

- (float)metadataFadeOutSpeed
{
  return self->_metadataFadeOutSpeed;
}

- (float)metadataFadeInSpeed
{
  return self->_metadataFadeInSpeed;
}

- (double)focusDebounceThreshold
{
  return self->_focusDebounceThreshold;
}

- (void)setFocusDebounceThreshold:(double)a3
{
  self->_focusDebounceThreshold = a3;
}

- (float)swipeCompletionSpeedFactor
{
  return self->_swipeCompletionSpeedFactor;
}

- (void)setSwipeCompletionSpeedFactor:(float)a3
{
  self->_swipeCompletionSpeedFactor = a3;
}

- (double)itemHoverDelayDuration
{
  return self->_itemHoverDelayDuration;
}

- (BOOL)gradientUsesImageColor
{
  return self->_gradientUsesImageColor;
}

- (double)hideMuteButtonDelayDuration
{
  return self->_hideMuteButtonDelayDuration;
}

- (double)hidePageIndicatorsDelayDuration
{
  return self->_hidePageIndicatorsDelayDuration;
}

- (BOOL)allowsFullscreenMediaTransition
{
  return self->_allowsFullscreenMediaTransition;
}

- (void)setAllowsFullscreenMediaTransition:(BOOL)a3
{
  self->_allowsFullscreenMediaTransition = a3;
}

- (float)swipeSpeedFactor
{
  return self->_swipeSpeedFactor;
}

- (void)setSwipeSpeedFactor:(float)a3
{
  self->_swipeSpeedFactor = a3;
}

- (float)sidebarOpenDuringAnimationThreshold
{
  return self->_sidebarOpenDuringAnimationThreshold;
}

@end