@interface UIDictationLandingViewSettings
+ (id)sharedInstance;
- (BOOL)useBlackWave;
- (UIDictationLandingViewSettings)init;
- (double)circleRPM;
- (double)colorTransitionInDuration;
- (double)colorTransitionOutDuration;
- (double)fadeInDuration;
- (double)fadeOutDuration;
- (double)shrinkDuration;
- (void)setCircleRPM:(double)a3;
- (void)setColorTransitionInDuration:(double)a3;
- (void)setColorTransitionOutDuration:(double)a3;
- (void)setFadeInDuration:(double)a3;
- (void)setFadeOutDuration:(double)a3;
- (void)setShrinkDuration:(double)a3;
- (void)setUseBlackWave:(BOOL)a3;
@end

@implementation UIDictationLandingViewSettings

+ (id)sharedInstance
{
  v2 = (void *)gSettings;
  if (!gSettings)
  {
    v3 = objc_alloc_init(UIDictationLandingViewSettings);
    v4 = (void *)gSettings;
    gSettings = (uint64_t)v3;

    v2 = (void *)gSettings;
  }
  return v2;
}

- (UIDictationLandingViewSettings)init
{
  v6.receiver = self;
  v6.super_class = (Class)UIDictationLandingViewSettings;
  v2 = [(UIDictationLandingViewSettings *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(UIDictationLandingViewSettings *)v2 setUseBlackWave:0];
    [(UIDictationLandingViewSettings *)v3 setFadeInDuration:0.416];
    [(UIDictationLandingViewSettings *)v3 setFadeOutDuration:0.2];
    [(UIDictationLandingViewSettings *)v3 setShrinkDuration:0.316];
    [(UIDictationLandingViewSettings *)v3 setColorTransitionInDuration:0.3];
    [(UIDictationLandingViewSettings *)v3 setColorTransitionOutDuration:0.3];
    [(UIDictationLandingViewSettings *)v3 setCircleRPM:83.0];
    v4 = v3;
  }

  return v3;
}

- (double)fadeInDuration
{
  return self->_fadeInDuration;
}

- (void)setFadeInDuration:(double)a3
{
  self->_fadeInDuration = a3;
}

- (double)fadeOutDuration
{
  return self->_fadeOutDuration;
}

- (void)setFadeOutDuration:(double)a3
{
  self->_fadeOutDuration = a3;
}

- (double)shrinkDuration
{
  return self->_shrinkDuration;
}

- (void)setShrinkDuration:(double)a3
{
  self->_shrinkDuration = a3;
}

- (double)colorTransitionInDuration
{
  return self->_colorTransitionInDuration;
}

- (void)setColorTransitionInDuration:(double)a3
{
  self->_colorTransitionInDuration = a3;
}

- (double)colorTransitionOutDuration
{
  return self->_colorTransitionOutDuration;
}

- (void)setColorTransitionOutDuration:(double)a3
{
  self->_colorTransitionOutDuration = a3;
}

- (double)circleRPM
{
  return self->_circleRPM;
}

- (void)setCircleRPM:(double)a3
{
  self->_circleRPM = a3;
}

- (BOOL)useBlackWave
{
  return self->_useBlackWave;
}

- (void)setUseBlackWave:(BOOL)a3
{
  self->_useBlackWave = a3;
}

@end