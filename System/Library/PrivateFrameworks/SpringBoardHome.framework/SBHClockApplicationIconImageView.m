@interface SBHClockApplicationIconImageView
+ (BOOL)generatesContentsImage;
+ (BOOL)hidesSecondsHand;
+ (NSDate)overrideDate;
+ (double)overrideDateOffset;
+ (id)appearanceStoreIcon;
+ (id)cacheKeyForIconImageWithImageInfo:(SBIconImageInfo *)a3 imageAppearance:(id)a4 options:(unint64_t)a5;
+ (id)cacheKeyIcon;
+ (id)cachedIconImageWithImageInfo:(SBIconImageInfo *)a3 imageAppearance:(id)a4 options:(unint64_t)a5;
+ (id)effectiveDate;
+ (id)fallbackNumbersImageWithIconImageInfo:(SBIconImageInfo *)a3;
+ (id)hoursMinutesHandColorWithImageAppearance:(id)a3;
+ (id)iconImageWithImageInfo:(SBIconImageInfo *)a3 imageAppearance:(id)a4 options:(unint64_t)a5;
+ (id)imageSetForMetrics:(const SBHClockApplicationIconImageMetrics *)a3 imageAppearance:(id)a4;
+ (id)makeComponentImageWithMetrics:(const SBHClockApplicationIconImageMetrics *)a3 size:(CGSize)a4 actions:(id)a5;
+ (id)makeComponentImageWithMetrics:(const SBHClockApplicationIconImageMetrics *)a3 size:(CGSize)a4 path:(CGPath *)a5 fillColor:(id)a6 options:(unint64_t)a7;
+ (id)makeDotImageWithOuterDiameter:(double)a3 innerDiameter:(double)a4 color:(id)a5 isSeconds:(BOOL)a6 metrics:(const SBHClockApplicationIconImageMetrics *)a7;
+ (id)makeDotLayerWithOuterDiameter:(double)a3 innerDiameter:(double)a4 isSeconds:(BOOL)a5 imageSet:(id)a6;
+ (id)makeHoursHandImageWithMetrics:(const SBHClockApplicationIconImageMetrics *)a3 imageAppearance:(id)a4;
+ (id)makeHoursHandLayerWithImageSet:(id)a3;
+ (id)makeIconImageWithImageInfo:(SBIconImageInfo *)a3 imageAppearance:(id)a4 options:(unint64_t)a5;
+ (id)makeImageSetForMetrics:(const SBHClockApplicationIconImageMetrics *)a3 imageAppearance:(id)a4;
+ (id)makeMinutesHandImageWithMetrics:(const SBHClockApplicationIconImageMetrics *)a3 imageAppearance:(id)a4;
+ (id)makeMinutesHandLayerWithImageSet:(id)a3;
+ (id)makeSecondsHandImageWithMetrics:(const SBHClockApplicationIconImageMetrics *)a3 imageAppearance:(id)a4;
+ (id)makeSecondsHandLayerWithImageSet:(id)a3;
+ (id)numbersImageNameWithImageInfo:(SBIconImageInfo *)a3;
+ (id)secondsHandColorWithImageAppearance:(id)a3;
+ (id)systemNumberingSystem;
+ (void)_handleTimeChange:(id)a3;
+ (void)_timerFired:(id)a3;
+ (void)cacheIconImage:(id)a3 forIconImageInfo:(SBIconImageInfo *)a4 imageAppearance:(id)a5 options:(unint64_t)a6;
+ (void)configureHandLayer:(id)a3 metrics:(const SBHClockApplicationIconImageMetrics *)a4;
+ (void)getMetrics:(SBHClockApplicationIconImageMetrics *)a3 forIconImageInfo:(SBIconImageInfo *)a4;
+ (void)initialize;
+ (void)precacheDataWithIconImageInfo:(SBIconImageInfo *)a3;
+ (void)precacheDataWithIconImageInfo:(SBIconImageInfo *)a3 appearance:(id)a4;
+ (void)precacheDataWithIconImageInfo:(SBIconImageInfo *)a3 appearance:(id)a4 options:(unint64_t)a5;
+ (void)setHidesSecondsHand:(BOOL)a3;
+ (void)setOverrideDate:(id)a3;
+ (void)setOverrideDateOffset:(double)a3;
- (BOOL)areHandsHidden;
- (BOOL)isAnimationAllowed;
- (BOOL)shouldShowHourMinuteHands;
- (BOOL)shouldShowSecondsHand;
- (NSString)currentNumberingSystem;
- (SBHClockApplicationIconImageView)initWithFrame:(CGRect)a3;
- (SBHIconImageAppearance)displayedHandsAppearance;
- (float)hourMinuteHandOpacity;
- (float)secondsHandOpacity;
- (id)appearanceStoreWithOptions:(unint64_t)a3;
- (id)contentsImage;
- (id)contentsImageWithOptions:(unint64_t)a3;
- (id)squareContentsImage;
- (void)_setAnimating:(BOOL)a3;
- (void)_timerFiredWithComponents:(id)a3 flags:(unint64_t)a4;
- (void)_updateUnanimatedWithComponents:(id)a3;
- (void)applyMetrics:(const SBHClockApplicationIconImageMetrics *)a3;
- (void)clearCachedImages;
- (void)controller:(id)a3 didChangeOverrideDateFromDate:(id)a4;
- (void)didAnimateIconImageInfoChange;
- (void)getMetrics:(SBHClockApplicationIconImageMetrics *)a3;
- (void)iconImageInfoDidChange;
- (void)layoutSubviews;
- (void)localeDidChange:(id)a3;
- (void)prepareForReuse;
- (void)resetForegroundLayers;
- (void)setCurrentNumberingSystem:(id)a3;
- (void)setDisplayedHandsAppearance:(id)a3;
- (void)setHandsHidden:(BOOL)a3;
- (void)setHandsHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)setIcon:(id)a3 location:(id)a4 animated:(BOOL)a5;
- (void)setPaused:(BOOL)a3;
- (void)updateAnimatingState;
- (void)updateImageAnimated:(BOOL)a3;
- (void)updateUnanimated;
- (void)willAnimateIconImageInfoChange;
@end

@implementation SBHClockApplicationIconImageView

- (void)setIcon:(id)a3 location:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  v8 = (void *)MEMORY[0x1E4FA5EE8];
  id v9 = a4;
  id v10 = a3;
  v11 = [v8 sharedInstance];
  v12.receiver = self;
  v12.super_class = (Class)SBHClockApplicationIconImageView;
  [(SBLiveIconImageView *)&v12 setIcon:v10 location:v9 animated:v5];

  if (v10)
  {
    [v11 addObserver:self];
    [(SBHClockApplicationIconImageView *)self setNeedsLayout];
  }
  else
  {
    [v11 removeObserver:self];
  }
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)SBHClockApplicationIconImageView;
  [(SBLiveIconImageView *)&v3 prepareForReuse];
  [(SBHClockApplicationIconImageView *)self resetForegroundLayers];
}

- (void)updateUnanimated
{
  v6.receiver = self;
  v6.super_class = (Class)SBHClockApplicationIconImageView;
  [(SBLiveIconImageView *)&v6 updateUnanimated];
  objc_super v3 = _SBClockIconGetCalendar();
  v4 = [(id)objc_opt_class() effectiveDate];
  BOOL v5 = [v3 components:224 fromDate:v4];

  [(SBHClockApplicationIconImageView *)self _updateUnanimatedWithComponents:v5];
}

- (void)_updateUnanimatedWithComponents:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1C9C8];
  id v5 = a3;
  [v4 timeIntervalSinceReferenceDate];
  double v7 = v6;
  v8 = [(id)objc_opt_class() overrideDate];
  double v9 = v7 - trunc(v7);
  if (v8) {
    double v10 = 0.0;
  }
  else {
    double v10 = v9;
  }

  double v11 = v10 + (double)[v5 second];
  double v12 = v11 / 60.0 + (double)[v5 minute];
  uint64_t v13 = [v5 hour];

  double v14 = fmod(v11 / 30.0 * 3.14159265, 6.28318531);
  __double2 v15 = __sincos_stret(v14);
  *(double *)&__cachedTransform = v15.__cosval;
  *((void *)&__cachedTransform + 1) = *(void *)&v15.__sinval;
  *(double *)&xmmword_1EB798AA8 = -v15.__sinval;
  *((void *)&xmmword_1EB798AA8 + 1) = *(void *)&v15.__cosval;
  seconds = self->_seconds;
  long long v27 = xmmword_1EB798AC8;
  long long v28 = *(_OWORD *)&qword_1EB798AD8;
  long long v29 = xmmword_1EB798AE8;
  long long v30 = unk_1EB798AF8;
  long long v23 = __cachedTransform;
  long long v24 = unk_1EB798A98;
  long long v25 = xmmword_1EB798AA8;
  long long v26 = unk_1EB798AB8;
  [(CALayer *)seconds setTransform:&v23];
  double v17 = fmod(v12 / 30.0 * 3.14159265, 6.28318531);
  __double2 v18 = __sincos_stret(v17);
  *(double *)&__cachedTransform = v18.__cosval;
  *((void *)&__cachedTransform + 1) = *(void *)&v18.__sinval;
  *(double *)&xmmword_1EB798AA8 = -v18.__sinval;
  *((void *)&xmmword_1EB798AA8 + 1) = *(void *)&v18.__cosval;
  minutes = self->_minutes;
  long long v27 = xmmword_1EB798AC8;
  long long v28 = *(_OWORD *)&qword_1EB798AD8;
  long long v29 = xmmword_1EB798AE8;
  long long v30 = unk_1EB798AF8;
  long long v23 = __cachedTransform;
  long long v24 = unk_1EB798A98;
  long long v25 = xmmword_1EB798AA8;
  long long v26 = unk_1EB798AB8;
  [(CALayer *)minutes setTransform:&v23];
  double v20 = fmod((v12 / 60.0 + (double)v13) / 6.0 * 3.14159265, 6.28318531);
  __double2 v21 = __sincos_stret(v20);
  *(double *)&__cachedTransform = v21.__cosval;
  *((void *)&__cachedTransform + 1) = *(void *)&v21.__sinval;
  *(double *)&xmmword_1EB798AA8 = -v21.__sinval;
  *((void *)&xmmword_1EB798AA8 + 1) = *(void *)&v21.__cosval;
  hours = self->_hours;
  long long v27 = xmmword_1EB798AC8;
  long long v28 = *(_OWORD *)&qword_1EB798AD8;
  long long v29 = xmmword_1EB798AE8;
  long long v30 = unk_1EB798AF8;
  long long v23 = __cachedTransform;
  long long v24 = unk_1EB798A98;
  long long v25 = xmmword_1EB798AA8;
  long long v26 = unk_1EB798AB8;
  [(CALayer *)hours setTransform:&v23];
}

- (void)updateAnimatingState
{
  if ([(SBHClockApplicationIconImageView *)self isAnimationAllowed])
  {
    objc_super v3 = [(SBIconImageView *)self icon];
    if (v3)
    {
      v4 = [(id)objc_opt_class() overrideDate];
      BOOL v5 = v4 == 0;
    }
    else
    {
      BOOL v5 = 0;
    }
  }
  else
  {
    BOOL v5 = 0;
  }
  [(SBHClockApplicationIconImageView *)self _setAnimating:v5];
}

- (void)_setAnimating:(BOOL)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    [(SBHClockApplicationIconImageView *)self updateUnanimated];
    v4 = self;
    if (_SBClockIconInitialize___once != -1) {
      dispatch_once(&_SBClockIconInitialize___once, &__block_literal_global_304);
    }
    if (([(id)__tickClients containsObject:v4] & 1) == 0)
    {
      BOOL v5 = SBLogClock();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 134218240;
        v19 = v4;
        __int16 v20 = 2048;
        uint64_t v21 = [(id)__tickClients count] + 1;
        _os_log_impl(&dword_1D7F0A000, v5, OS_LOG_TYPE_DEFAULT, "Add clock icon tick client: %p/%lu", (uint8_t *)&v18, 0x16u);
      }

      [(id)__tickClients addObject:v4];
      if (!__tickTimer)
      {
        __frameCount = 0;
        uint64_t v6 = [MEMORY[0x1E4F39B68] displayLinkWithTarget:objc_opt_class() selector:sel__timerFired_];
        double v7 = (void *)__tickTimer;
        __tickTimer = v6;

        LODWORD(v8) = __secondFrameRange_0;
        LODWORD(v9) = __secondFrameRange_1;
        LODWORD(v10) = __secondFrameRange_2;
        objc_msgSend((id)__tickTimer, "setPreferredFrameRateRange:", v8, v9, v10);
        double v11 = (void *)__tickTimer;
        double v12 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
        [v11 addToRunLoop:v12 forMode:*MEMORY[0x1E4F1C4B0]];

        uint64_t v13 = SBLogClock();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v18) = 0;
          double v14 = "Started clock icon tick timer";
LABEL_16:
          _os_log_impl(&dword_1D7F0A000, v13, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v18, 2u);
          goto LABEL_17;
        }
        goto LABEL_17;
      }
    }
  }
  else
  {
    __double2 v15 = self;
    if ([(id)__tickClients containsObject:v15])
    {
      v16 = SBLogClock();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 134218240;
        v19 = v15;
        __int16 v20 = 2048;
        uint64_t v21 = [(id)__tickClients count] - 1;
        _os_log_impl(&dword_1D7F0A000, v16, OS_LOG_TYPE_DEFAULT, "Remove clock icon tick client: %p/%lu", (uint8_t *)&v18, 0x16u);
      }

      [(id)__tickClients removeObject:v15];
      if (![(id)__tickClients count])
      {
        [(id)__tickTimer invalidate];
        double v17 = (void *)__tickTimer;
        __tickTimer = 0;

        uint64_t v13 = SBLogClock();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v18) = 0;
          double v14 = "Stopped clock icon tick timer";
          goto LABEL_16;
        }
LABEL_17:
      }
    }
  }
}

+ (void)_timerFired:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = (unint64_t)*(float *)&__secondFrameRange_2;
  uint64_t v4 = 128;
  if (!(__frameCount % (60 * (unint64_t)*(float *)&__secondFrameRange_2))) {
    uint64_t v4 = 192;
  }
  uint64_t v5 = 3600 * v3;
  int v6 = __frameCount + v3;
  if (v5 == __frameCount) {
    int v7 = 0;
  }
  else {
    int v7 = v6;
  }
  if (v5 == __frameCount) {
    uint64_t v8 = v4 | 0x20;
  }
  else {
    uint64_t v8 = v4;
  }
  __frameCount = v7;
  double v9 = objc_msgSend(a1, "effectiveDate", a3);
  double v10 = [(id)__calendar components:v8 fromDate:v9];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v11 = (id)__tickClients;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "_timerFiredWithComponents:flags:", v10, v8, (void)v17);
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v13);
  }

  v16 = SBLogClock();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    +[SBHClockApplicationIconImageView _timerFired:]();
  }
}

- (void)_timerFiredWithComponents:(id)a3 flags:(unint64_t)a4
{
  char v4 = a4;
  id v6 = a3;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  float v8 = v7 - trunc(v7) + (double)[v6 second];
  double v9 = v8;
  double v10 = fmod(v8 / 30.0 * 3.14159265, 6.28318531);
  __double2 v11 = __sincos_stret(v10);
  *(double *)&__cachedTransform = v11.__cosval;
  *((void *)&__cachedTransform + 1) = *(void *)&v11.__sinval;
  *(double *)&xmmword_1EB798AA8 = -v11.__sinval;
  *((void *)&xmmword_1EB798AA8 + 1) = *(void *)&v11.__cosval;
  seconds = self->_seconds;
  long long v26 = xmmword_1EB798AC8;
  long long v27 = *(_OWORD *)&qword_1EB798AD8;
  long long v28 = xmmword_1EB798AE8;
  long long v29 = unk_1EB798AF8;
  long long v22 = __cachedTransform;
  long long v23 = unk_1EB798A98;
  long long v24 = xmmword_1EB798AA8;
  long long v25 = unk_1EB798AB8;
  [(CALayer *)seconds setTransform:&v22];
  if ((v4 & 0x40) != 0)
  {
    float v13 = v9 / 60.0 + (double)[v6 minute];
    double v14 = v13;
    double v15 = fmod(v13 / 30.0 * 3.14159265, 6.28318531);
    __double2 v16 = __sincos_stret(v15);
    *(double *)&__cachedTransform = v16.__cosval;
    *((void *)&__cachedTransform + 1) = *(void *)&v16.__sinval;
    *(double *)&xmmword_1EB798AA8 = -v16.__sinval;
    *((void *)&xmmword_1EB798AA8 + 1) = *(void *)&v16.__cosval;
    minutes = self->_minutes;
    long long v26 = xmmword_1EB798AC8;
    long long v27 = *(_OWORD *)&qword_1EB798AD8;
    long long v28 = xmmword_1EB798AE8;
    long long v29 = unk_1EB798AF8;
    long long v22 = __cachedTransform;
    long long v23 = unk_1EB798A98;
    long long v24 = xmmword_1EB798AA8;
    long long v25 = unk_1EB798AB8;
    [(CALayer *)minutes setTransform:&v22];
    if ((v4 & 0x20) != 0)
    {
      float v18 = v14 / 60.0 + (double)[v6 hour];
      double v19 = fmod(v18 / 6.0 * 3.14159265, 6.28318531);
      __double2 v20 = __sincos_stret(v19);
      *(double *)&__cachedTransform = v20.__cosval;
      *((void *)&__cachedTransform + 1) = *(void *)&v20.__sinval;
      *(double *)&xmmword_1EB798AA8 = -v20.__sinval;
      *((void *)&xmmword_1EB798AA8 + 1) = *(void *)&v20.__cosval;
      hours = self->_hours;
      long long v26 = xmmword_1EB798AC8;
      long long v27 = *(_OWORD *)&qword_1EB798AD8;
      long long v28 = xmmword_1EB798AE8;
      long long v29 = unk_1EB798AF8;
      long long v22 = __cachedTransform;
      long long v23 = unk_1EB798A98;
      long long v24 = xmmword_1EB798AA8;
      long long v25 = unk_1EB798AB8;
      [(CALayer *)hours setTransform:&v22];
    }
  }
}

- (BOOL)isAnimationAllowed
{
  unint64_t v3 = [(id)objc_opt_class() overrideDate];
  if (v3)
  {
    BOOL v4 = 0;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)SBHClockApplicationIconImageView;
    BOOL v4 = [(SBLiveIconImageView *)&v6 isAnimationAllowed];
  }

  return v4;
}

+ (id)effectiveDate
{
  v2 = [(id)objc_opt_class() overrideDate];
  [(id)objc_opt_class() overrideDateOffset];
  double v4 = v3;
  if (v2)
  {
    id v5 = v2;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1C9C8] date];
  }
  objc_super v6 = v5;
  if (v4 != 0.0)
  {
    uint64_t v7 = [v5 dateByAddingTimeInterval:v4];

    objc_super v6 = (void *)v7;
  }

  return v6;
}

+ (NSDate)overrideDate
{
  return (NSDate *)(id)__overrideDate;
}

+ (double)overrideDateOffset
{
  return *(double *)&__overrideDateOffset;
}

- (float)secondsHandOpacity
{
  BOOL v2 = [(SBHClockApplicationIconImageView *)self shouldShowSecondsHand];
  float result = 0.0;
  if (v2) {
    return 1.0;
  }
  return result;
}

- (void)setPaused:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SBIconImageView *)self isPaused] != a3)
  {
    v12.receiver = self;
    v12.super_class = (Class)SBHClockApplicationIconImageView;
    [(SBLiveIconImageView *)&v12 setPaused:v3];
    BOOL v5 = [(SBHClockApplicationIconImageView *)self shouldShowSecondsHand];
    objc_super v6 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"opacity"];
    [v6 setDuration:0.2];
    [v6 setFromValue:&unk_1F300F110];
    double v7 = -1.0;
    if (v5)
    {
      double v7 = 1.0;
      float v8 = 1.0;
    }
    else
    {
      float v8 = 0.0;
    }
    double v9 = [NSNumber numberWithDouble:v7];
    [v6 setToValue:v9];

    [v6 setAdditive:1];
    [(CALayer *)self->_seconds addAnimation:v6 forKey:@"Paused"];
    [(CALayer *)self->_secondDot addAnimation:v6 forKey:@"Paused"];
    *(float *)&double v10 = v8;
    [(CALayer *)self->_seconds setOpacity:v10];
    *(float *)&double v11 = v8;
    [(CALayer *)self->_secondDot setOpacity:v11];
  }
}

- (BOOL)shouldShowSecondsHand
{
  if ([(SBIconImageView *)self isPaused]) {
    return 0;
  }
  else {
    return ![(SBHClockApplicationIconImageView *)self areHandsHidden];
  }
}

- (void)updateImageAnimated:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SBHClockApplicationIconImageView;
  [(SBLiveIconImageView *)&v6 updateImageAnimated:a3];
  double v4 = [(SBIconImageView *)self effectiveIconImageAppearance];
  BOOL v5 = [(SBHClockApplicationIconImageView *)self displayedHandsAppearance];
  if ((BSEqualObjects() & 1) == 0)
  {
    [(SBHClockApplicationIconImageView *)self resetForegroundLayers];
    [(SBHClockApplicationIconImageView *)self setNeedsLayout];
  }
}

- (SBHIconImageAppearance)displayedHandsAppearance
{
  return self->_displayedHandsAppearance;
}

- (BOOL)areHandsHidden
{
  return self->_handsHidden;
}

- (void)resetForegroundLayers
{
  [(CALayer *)self->_hours removeFromSuperlayer];
  hours = self->_hours;
  self->_hours = 0;

  [(CALayer *)self->_minutes removeFromSuperlayer];
  minutes = self->_minutes;
  self->_minutes = 0;

  [(CALayer *)self->_seconds removeFromSuperlayer];
  seconds = self->_seconds;
  self->_seconds = 0;

  [(CALayer *)self->_secondDot removeFromSuperlayer];
  secondDot = self->_secondDot;
  self->_secondDot = 0;

  [(CALayer *)self->_hourMinuteDot removeFromSuperlayer];
  hourMinuteDot = self->_hourMinuteDot;
  self->_hourMinuteDot = 0;
}

- (SBHClockApplicationIconImageView)initWithFrame:(CGRect)a3
{
  v14.receiver = self;
  v14.super_class = (Class)SBHClockApplicationIconImageView;
  BOOL v3 = -[SBIconImageView initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    double v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:v3 selector:sel_localeDidChange_ name:*MEMORY[0x1E4F1C370] object:0];

    BOOL v5 = [(id)objc_opt_class() systemNumberingSystem];
    uint64_t v6 = [v5 copy];
    currentNumberingSystem = v3->_currentNumberingSystem;
    v3->_currentNumberingSystem = (NSString *)v6;

    float v8 = objc_alloc_init(SBHIconImageAppearanceStore);
    contentsImages = v3->_contentsImages;
    v3->_contentsImages = v8;

    double v10 = objc_alloc_init(SBHIconImageAppearanceStore);
    squareContentsImages = v3->_squareContentsImages;
    v3->_squareContentsImages = v10;

    objc_super v12 = [(SBHClockApplicationIconImageView *)v3 layer];
    [v12 setNeedsLayoutOnGeometryChange:0];
  }
  return v3;
}

- (void)layoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)SBHClockApplicationIconImageView;
  [(SBIconImageView *)&v10 layoutSubviews];
  uint64_t v9 = 0;
  memset(v8, 0, sizeof(v8));
  [(SBHClockApplicationIconImageView *)self getMetrics:v8];
  if (!self->_minutes)
  {
    BOOL v3 = [(SBIconImageView *)self icon];

    if (v3)
    {
      [(SBHClockApplicationIconImageView *)self applyMetrics:v8];
      [(SBHClockApplicationIconImageView *)self updateUnanimated];
    }
  }
  UIRectGetCenter();
  double v5 = v4;
  double v7 = v6;
  -[CALayer setPosition:](self->_hourMinuteDot, "setPosition:");
  -[CALayer setPosition:](self->_hours, "setPosition:", v5, v7);
  -[CALayer setPosition:](self->_minutes, "setPosition:", v5, v7);
  -[CALayer setPosition:](self->_seconds, "setPosition:", v5, v7);
  -[CALayer setPosition:](self->_secondDot, "setPosition:", v5, v7);
}

- (void)getMetrics:(SBHClockApplicationIconImageMetrics *)a3
{
  [(SBIconImageView *)self iconImageInfo];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  objc_super v12 = objc_opt_class();
  objc_msgSend(v12, "getMetrics:forIconImageInfo:", a3, v5, v7, v9, v11);
}

+ (void)getMetrics:(SBHClockApplicationIconImageMetrics *)a3 forIconImageInfo:(SBIconImageInfo *)a4
{
  double v8 = v4 * 0.00263671875;
  double v9 = 1.0;
  if (v4 * 0.00263671875 < 1.0) {
    double v8 = 1.0;
  }
  a3->secondsHandWidth = v8;
  a3->secondsHandLength = v4 * 0.392578125;
  a3->secondsHandleLength = v4 * 0.04296875;
  float64x2_t v10 = vmulq_n_f64((float64x2_t)xmmword_1D81E5800, v4);
  *(float64x2_t *)&a3->secondsHandRingDiameter = v10;
  double v11 = v4 * 0.33984375;
  double v12 = v4 * 0.05078125;
  a3->minutesHandRingDiameter = v4 * 0.05078125;
  a3->minutesHandRingKnockoutDiameter = v10.f64[0];
  double v13 = v4 * 0.17578125;
  if (v4 * 0.0068359375 >= 1.0) {
    double v9 = v4 * 0.0068359375;
  }
  a3->shadowRadius = v9;
  a3->shadowInset = 3.0;
  a3->separatorWidth = v4 * 0.015625;
  float64x2_t v14 = vmulq_n_f64((float64x2_t)xmmword_1D81E5810, v4);
  a3->minutesHandWidth = v14.f64[0];
  a3->minutesHandLength = v11;
  a3->hoursHandWidth = v14.f64[0];
  a3->hoursHandLength = v13;
  *(float64x2_t *)&a3->separatorLength = v14;
  a3->secondsHandBounds.width = v10.f64[0];
  a3->secondsHandBounds.height = v4 * 0.04296875 + v4 * 0.392578125 + v10.f64[0];
  a3->minutesHandBounds.width = v12;
  a3->minutesHandBounds.height = v14.f64[0] + v11 + v12;
  a3->hoursHandBounds.width = v12;
  a3->hoursHandBounds.height = v14.f64[0] + v13 + v12;
  a3->faceRadius = v4 * 0.434570312;
  a3->numberPointSize = v4 / 60.0 * 7.0;
  a3->contentsScale = v6;
  a3->iconImageInfo.size.width = v4;
  a3->iconImageInfo.size.height = v5;
  a3->iconImageInfo.scale = v6;
  a3->iconImageInfo.continuousCornerRadius = v7;
}

- (void)applyMetrics:(const SBHClockApplicationIconImageMetrics *)a3
{
  id v24 = [(SBIconImageView *)self effectiveIconImageAppearance];
  CGFloat v5 = [(SBHClockApplicationIconImageView *)self layer];
  double v6 = [(id)objc_opt_class() imageSetForMetrics:a3 imageAppearance:v24];
  [(SBHClockApplicationIconImageView *)self hourMinuteHandOpacity];
  int v8 = v7;
  double v9 = [(id)objc_opt_class() makeHoursHandLayerWithImageSet:v6];
  LODWORD(v10) = v8;
  [v9 setOpacity:v10];
  [v5 addSublayer:v9];
  [(CALayer *)self->_hours removeFromSuperlayer];
  objc_storeStrong((id *)&self->_hours, v9);
  double v11 = [(id)objc_opt_class() makeMinutesHandLayerWithImageSet:v6];
  LODWORD(v12) = v8;
  [v11 setOpacity:v12];
  [v5 addSublayer:v11];
  [(CALayer *)self->_minutes removeFromSuperlayer];
  objc_storeStrong((id *)&self->_minutes, v11);
  double v13 = [(id)objc_opt_class() makeDotLayerWithOuterDiameter:0 innerDiameter:v6 isSeconds:a3->minutesHandRingDiameter imageSet:a3->minutesHandRingKnockoutDiameter];
  LODWORD(v14) = v8;
  [v13 setOpacity:v14];
  [v5 addSublayer:v13];
  [(CALayer *)self->_hourMinuteDot removeFromSuperlayer];
  objc_storeStrong((id *)&self->_hourMinuteDot, v13);
  if (([(id)objc_opt_class() hidesSecondsHand] & 1) == 0)
  {
    [(SBHClockApplicationIconImageView *)self secondsHandOpacity];
    int v16 = v15;
    long long v17 = [(id)objc_opt_class() makeSecondsHandLayerWithImageSet:v6];
    LODWORD(v18) = v16;
    [(CALayer *)v17 setOpacity:v18];
    [v5 addSublayer:v17];
    [(CALayer *)self->_seconds removeFromSuperlayer];
    seconds = self->_seconds;
    self->_seconds = v17;
    __double2 v20 = v17;

    uint64_t v21 = [(id)objc_opt_class() makeDotLayerWithOuterDiameter:1 innerDiameter:v6 isSeconds:a3->secondsHandRingDiameter imageSet:a3->secondsHandRingKnockoutDiameter];
    LODWORD(v22) = v16;
    [(CALayer *)v21 setOpacity:v22];
    [v5 addSublayer:v21];
    [(CALayer *)self->_secondDot removeFromSuperlayer];
    secondDot = self->_secondDot;
    self->_secondDot = v21;
  }
  [(SBHClockApplicationIconImageView *)self setDisplayedHandsAppearance:v24];
  [(SBIconImageView *)self didAddSublayer];
}

- (void)setDisplayedHandsAppearance:(id)a3
{
}

- (float)hourMinuteHandOpacity
{
  BOOL v2 = [(SBHClockApplicationIconImageView *)self shouldShowHourMinuteHands];
  float result = 0.0;
  if (v2) {
    return 1.0;
  }
  return result;
}

- (BOOL)shouldShowHourMinuteHands
{
  return ![(SBHClockApplicationIconImageView *)self areHandsHidden];
}

+ (id)makeSecondsHandLayerWithImageSet:(id)a3
{
  double v4 = (void *)MEMORY[0x1E4F39BE8];
  id v5 = a3;
  double v6 = [v4 layer];
  id v7 = [v5 seconds];
  objc_msgSend(v6, "setContents:", objc_msgSend(v7, "CGImage"));
  [v7 size];
  objc_msgSend(v6, "setBounds:", 0.0, 0.0, v8, v9);
  [v7 scale];
  objc_msgSend(v6, "setContentsScale:");
  uint64_t v25 = 0;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  [v5 getMetrics:&v11];

  objc_msgSend(v6, "setAnchorPoint:", 0.5, (*((double *)&v11 + 1) + *((double *)&v12 + 1) * 0.5) / *(double *)&v14);
  [a1 configureHandLayer:v6 metrics:&v11];

  return v6;
}

+ (id)makeMinutesHandLayerWithImageSet:(id)a3
{
  double v4 = (void *)MEMORY[0x1E4F39BE8];
  id v5 = a3;
  double v6 = [v4 layer];
  id v7 = [v5 minutes];
  objc_msgSend(v6, "setContents:", objc_msgSend(v7, "CGImage"));
  [v7 size];
  objc_msgSend(v6, "setBounds:", 0.0, 0.0, v8, v9);
  [v7 scale];
  objc_msgSend(v6, "setContentsScale:");
  uint64_t v22 = 0;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  memset(v11, 0, sizeof(v11));
  [v5 getMetrics:v11];

  objc_msgSend(v6, "setAnchorPoint:", 0.5, (*(double *)&v15 + *(double *)&v12 + *(double *)&v18 + *((double *)&v12 + 1) * 0.5)/ (*(double *)&v15 + *(double *)&v15 + *(double *)&v14));
  [a1 configureHandLayer:v6 metrics:v11];

  return v6;
}

+ (id)makeHoursHandLayerWithImageSet:(id)a3
{
  double v4 = (void *)MEMORY[0x1E4F39BE8];
  id v5 = a3;
  double v6 = [v4 layer];
  id v7 = [v5 hours];
  objc_msgSend(v6, "setContents:", objc_msgSend(v7, "CGImage"));
  [v7 size];
  objc_msgSend(v6, "setBounds:", 0.0, 0.0, v8, v9);
  [v7 scale];
  objc_msgSend(v6, "setContentsScale:");
  uint64_t v22 = 0;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  memset(v11, 0, sizeof(v11));
  [v5 getMetrics:v11];

  objc_msgSend(v6, "setAnchorPoint:", 0.5, (*(double *)&v15 + *(double *)&v16 + *(double *)&v18 + *((double *)&v12 + 1) * 0.5)/ (*(double *)&v15 + *(double *)&v15 + *(double *)&v17));
  [a1 configureHandLayer:v6 metrics:v11];

  return v6;
}

+ (BOOL)hidesSecondsHand
{
  return __hidesSecondsHand;
}

+ (BOOL)generatesContentsImage
{
  return 1;
}

- (id)contentsImageWithOptions:(unint64_t)a3
{
  id v5 = [(SBIconImageView *)self effectiveIconImageAppearance];
  double v6 = [(id)objc_opt_class() cacheKeyIcon];
  id v7 = [(SBHClockApplicationIconImageView *)self appearanceStoreWithOptions:a3];
  double v8 = [v7 imageForIcon:v6 appearance:v5];
  if (!v8)
  {
    [(SBIconImageView *)self iconImageInfo];
    if (v9 <= 0.0)
    {
      double v8 = 0;
    }
    else
    {
      double v8 = objc_msgSend((id)objc_opt_class(), "iconImageWithImageInfo:imageAppearance:options:", v5, a3, v9, v10, v11, v12);
      [v7 setImage:v8 forIcon:v6 appearance:v5];
    }
  }

  return v8;
}

- (id)appearanceStoreWithOptions:(unint64_t)a3
{
  BOOL v3 = &OBJC_IVAR___SBHClockApplicationIconImageView__contentsImages;
  if ((a3 & 1) == 0) {
    BOOL v3 = &OBJC_IVAR___SBHClockApplicationIconImageView__squareContentsImages;
  }
  id v4 = *(id *)((char *)&self->super.super.super.super.super.isa + *v3);
  return v4;
}

+ (id)cacheKeyIcon
{
  if (cacheKeyIcon_onceToken != -1) {
    dispatch_once(&cacheKeyIcon_onceToken, &__block_literal_global_48);
  }
  BOOL v2 = (void *)cacheKeyIcon_cacheKeyIcon;
  return v2;
}

- (id)contentsImage
{
  return [(SBHClockApplicationIconImageView *)self contentsImageWithOptions:1];
}

+ (id)iconImageWithImageInfo:(SBIconImageInfo *)a3 imageAppearance:(id)a4 options:(unint64_t)a5
{
  double v10 = v8;
  double v11 = v7;
  double v12 = v6;
  double v13 = v5;
  long long v15 = a3;
  BSDispatchQueueAssertMain();
  long long v16 = objc_msgSend(a1, "cachedIconImageWithImageInfo:imageAppearance:options:", v15, a4, v13, v12, v11, v10);
  long long v17 = v16;
  if (v16)
  {
    id v18 = v16;
  }
  else
  {
    objc_msgSend(a1, "makeIconImageWithImageInfo:imageAppearance:options:", v15, a4, v13, v12, v11, v10);
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "cacheIconImage:forIconImageInfo:imageAppearance:options:", v18, v15, a4, v13, v12, v11, v10);
  }

  return v18;
}

+ (id)imageSetForMetrics:(const SBHClockApplicationIconImageMetrics *)a3 imageAppearance:(id)a4
{
  id v6 = a4;
  double v7 = +[SBHIconImageAppearanceStore defaultIcon];
  double v8 = [NSNumber numberWithDouble:a3->iconImageInfo.size.width];
  double v9 = [(id)imageSetForMetrics_imageAppearance___cachedImageSets objectForKey:v8];
  uint64_t v10 = [(SBHIconImageAppearanceStore *)v9 imageForIcon:v7 appearance:v6];
  if (v10)
  {
    double v11 = (void *)v10;
    goto LABEL_6;
  }
  double v11 = [a1 makeImageSetForMetrics:a3 imageAppearance:v6];
  if (!imageSetForMetrics_imageAppearance___cachedImageSets)
  {
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v14 = (void *)imageSetForMetrics_imageAppearance___cachedImageSets;
    imageSetForMetrics_imageAppearance___cachedImageSets = (uint64_t)v13;

    if (v9) {
      goto LABEL_5;
    }
LABEL_10:
    double v9 = objc_alloc_init(SBHIconImageAppearanceStore);
    [(id)imageSetForMetrics_imageAppearance___cachedImageSets setObject:v9 forKey:v8];
    goto LABEL_5;
  }
  if (!v9) {
    goto LABEL_10;
  }
LABEL_5:
  [(SBHIconImageAppearanceStore *)v9 setImage:v11 forIcon:v7 appearance:v6];
LABEL_6:

  return v11;
}

+ (id)cachedIconImageWithImageInfo:(SBIconImageInfo *)a3 imageAppearance:(id)a4 options:(unint64_t)a5
{
  double v10 = v8;
  double v11 = v7;
  double v12 = v6;
  double v13 = v5;
  long long v15 = a3;
  BSDispatchQueueAssertMain();
  long long v16 = objc_msgSend(a1, "cacheKeyForIconImageWithImageInfo:imageAppearance:options:", v15, a4, v13, v12, v11, v10);
  long long v17 = [a1 appearanceStoreIcon];
  id v18 = [(id)sharedIconImageCache objectForKey:v16];
  long long v19 = [v18 imageForIcon:v17 appearance:v15];

  return v19;
}

+ (id)cacheKeyForIconImageWithImageInfo:(SBIconImageInfo *)a3 imageAppearance:(id)a4 options:(unint64_t)a5
{
  char v7 = (char)a4;
  uint64_t v8 = v6;
  uint64_t v9 = v5;
  double v10 = objc_msgSend(a1, "numbersImageNameWithImageInfo:", a3, a4, a5);
  id v11 = [NSString alloc];
  uint64_t v12 = 77;
  if ((v7 & 1) == 0) {
    uint64_t v12 = 109;
  }
  double v13 = (void *)[v11 initWithFormat:@"%@:%fx%f:%c", v10, v9, v8, v12];

  return v13;
}

+ (id)numbersImageNameWithImageInfo:(SBIconImageInfo *)a3
{
  if (v3 >= 76.0)
  {
    uint64_t v6 = @"1024";
    if (v3 < 100.0) {
      uint64_t v6 = @"83";
    }
    if (v3 >= 83.0) {
      uint64_t v5 = v6;
    }
    else {
      uint64_t v5 = @"76";
    }
  }
  else
  {
    uint64_t v5 = @"60";
  }
  char v7 = objc_msgSend(a1, "systemNumberingSystem", a3);
  char v8 = [v7 isEqualToString:@"arab"];

  if (v8)
  {
    uint64_t v9 = @"Arabic";
  }
  else
  {
    double v10 = [a1 systemNumberingSystem];
    int v11 = [v10 isEqualToString:@"deva"];

    uint64_t v9 = &stru_1F2FA0300;
    if (v11) {
      uint64_t v9 = @"Devanagari";
    }
  }
  return (id)[NSString stringWithFormat:@"ClockIconNumbers%@%@", v9, v5];
}

+ (id)systemNumberingSystem
{
  BOOL v2 = (void *)MEMORY[0x1E4F70FE8];
  double v3 = [MEMORY[0x1E4F1CA20] currentLocale];
  id v4 = [v3 localeIdentifier];
  uint64_t v5 = [v2 numberingSystemForLocaleID:v4];

  return v5;
}

+ (id)appearanceStoreIcon
{
  BSDispatchQueueAssertMain();
  return +[SBHIconImageAppearanceStore defaultIcon];
}

- (id)squareContentsImage
{
  return [(SBHClockApplicationIconImageView *)self contentsImageWithOptions:0];
}

+ (id)makeDotLayerWithOuterDiameter:(double)a3 innerDiameter:(double)a4 isSeconds:(BOOL)a5 imageSet:(id)a6
{
  id v8 = a6;
  uint64_t v9 = [MEMORY[0x1E4F39BE8] layer];
  if (a5) {
    [v8 secondDot];
  }
  else {
  id v10 = [v8 hourMinuteDot];
  }
  objc_msgSend(v9, "setContents:", objc_msgSend(v10, "CGImage"));
  [v10 size];
  objc_msgSend(v9, "setBounds:", 0.0, 0.0, v11, v12);
  [v10 scale];
  objc_msgSend(v9, "setContentsScale:");
  uint64_t v15 = 0;
  memset(v14, 0, sizeof(v14));
  [v8 getMetrics:v14];
  [a1 configureHandLayer:v9 metrics:v14];

  return v9;
}

+ (void)configureHandLayer:(id)a3 metrics:(const SBHClockApplicationIconImageMetrics *)a4
{
  v10[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  [v5 setAllowsEdgeAntialiasing:1];
  [v5 setContentsScale:a4->contentsScale];
  v9[0] = @"transform";
  uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
  v9[1] = @"transform.rotation";
  v10[0] = v6;
  char v7 = [MEMORY[0x1E4F1CA98] null];
  v10[1] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  [v5 setActions:v8];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayedHandsAppearance, 0);
  objc_storeStrong((id *)&self->_currentNumberingSystem, 0);
  objc_storeStrong((id *)&self->_squareContentsImages, 0);
  objc_storeStrong((id *)&self->_contentsImages, 0);
  objc_storeStrong((id *)&self->_secondDot, 0);
  objc_storeStrong((id *)&self->_hourMinuteDot, 0);
  objc_storeStrong((id *)&self->_hours, 0);
  objc_storeStrong((id *)&self->_minutes, 0);
  objc_storeStrong((id *)&self->_seconds, 0);
}

+ (void)initialize
{
  self;
  id v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3 == a1)
  {
    int v4 = MGGetBoolAnswer();
    float v5 = 10.0;
    if (v4) {
      float v5 = 8.0;
    }
    CAFrameRateRange v9 = CAFrameRateRangeMake(v5, 120.0, v5);
    __secondFrameRange_0 = LODWORD(v9.minimum);
    __secondFrameRange_1 = LODWORD(v9.maximum);
    __secondFrameRange_2 = LODWORD(v9.preferred);
    *(void *)&__cachedTransform = 0x3FF0000000000000;
    *((void *)&xmmword_1EB798AA8 + 1) = 0x3FF0000000000000;
    qword_1EB798AD8 = 0x3FF0000000000000;
    qword_1EB798B00 = 0x3FF0000000000000;
    id v7 = [MEMORY[0x1E4FA5EE8] sharedInstance];
    uint64_t v6 = [v7 overrideDate];
    [a1 setOverrideDate:v6];
  }
}

+ (void)setOverrideDate:(id)a3
{
  uint64_t v3 = [a3 copy];
  int v4 = (void *)__overrideDate;
  __overrideDate = v3;
}

+ (void)setOverrideDateOffset:(double)a3
{
  __overrideDateOffset = *(void *)&a3;
}

+ (void)setHidesSecondsHand:(BOOL)a3
{
  __hidesSecondsHand = a3;
}

+ (void)_handleTimeChange:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v4 = _SBClockIconGetCalendar();
  float v5 = [MEMORY[0x1E4F1CAF0] systemTimeZone];
  [v4 setTimeZone:v5];

  uint64_t v6 = [a1 effectiveDate];
  id v7 = [v4 components:224 fromDate:v6];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = (id)__tickClients;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v12++), "_updateUnanimatedWithComponents:", v7, (void)v13);
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void)setHandsHidden:(BOOL)a3
{
}

- (void)setHandsHidden:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_handsHidden != a3)
  {
    BOOL v4 = a4;
    self->_handsHidden = a3;
    BOOL v6 = [(SBHClockApplicationIconImageView *)self shouldShowSecondsHand];
    float v8 = v6 ? 1.0 : 0.0;
    *(float *)&double v7 = v8;
    [(CALayer *)self->_seconds setOpacity:v7];
    *(float *)&double v9 = v8;
    [(CALayer *)self->_secondDot setOpacity:v9];
    BOOL v10 = [(SBHClockApplicationIconImageView *)self shouldShowHourMinuteHands];
    float v12 = v10 ? 1.0 : 0.0;
    *(float *)&double v11 = v12;
    [(CALayer *)self->_minutes setOpacity:v11];
    *(float *)&double v13 = v12;
    [(CALayer *)self->_hours setOpacity:v13];
    *(float *)&double v14 = v12;
    [(CALayer *)self->_hourMinuteDot setOpacity:v14];
    if (v4)
    {
      id v20 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"opacity"];
      [v20 setDuration:0.2];
      [v20 setFromValue:&unk_1F300F110];
      if (v6) {
        double v15 = 1.0;
      }
      else {
        double v15 = -1.0;
      }
      long long v16 = [NSNumber numberWithDouble:v15];
      [v20 setToValue:v16];

      [v20 setAdditive:1];
      [(CALayer *)self->_seconds addAnimation:v20 forKey:@"HandsHidden"];
      [(CALayer *)self->_secondDot addAnimation:v20 forKey:@"HandsHidden"];
      long long v17 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"opacity"];
      [v17 setDuration:0.2];
      [v17 setFromValue:&unk_1F300F110];
      if (v10) {
        double v18 = 1.0;
      }
      else {
        double v18 = -1.0;
      }
      long long v19 = [NSNumber numberWithDouble:v18];
      [v17 setToValue:v19];

      [v17 setAdditive:1];
      [(CALayer *)self->_minutes addAnimation:v17 forKey:@"HandsHidden"];
      [(CALayer *)self->_hours addAnimation:v17 forKey:@"HandsHidden"];
      [(CALayer *)self->_hourMinuteDot addAnimation:v17 forKey:@"HandsHidden"];
    }
  }
}

+ (id)secondsHandColorWithImageAppearance:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 appearanceType];
  if (v4 < 2) {
    goto LABEL_4;
  }
  if (v4 == 2)
  {
    BOOL v6 = [v3 tintColor];
    double v7 = [MEMORY[0x1E4FB1618] colorWithWhite:0.745098039 alpha:1.0];
    float v5 = [v6 _colorBlendedWithColor:v7 compositingFilter:*MEMORY[0x1E4F3A298]];
  }
  else
  {
    if (v4 == 3)
    {
LABEL_4:
      float v5 = [MEMORY[0x1E4FB1618] orangeColor];
      goto LABEL_7;
    }
    float v5 = 0;
  }
LABEL_7:

  return v5;
}

+ (id)hoursMinutesHandColorWithImageAppearance:(id)a3
{
  id v3 = a3;
  switch([v3 appearanceType])
  {
    case 0:
      uint64_t v4 = [MEMORY[0x1E4FB1618] blackColor];
      goto LABEL_6;
    case 1:
    case 3:
      uint64_t v4 = [MEMORY[0x1E4FB1618] whiteColor];
      goto LABEL_6;
    case 2:
      uint64_t v4 = [v3 tintColor];
LABEL_6:
      float v5 = (void *)v4;
      break;
    default:
      float v5 = 0;
      break;
  }

  return v5;
}

+ (id)makeComponentImageWithMetrics:(const SBHClockApplicationIconImageMetrics *)a3 size:(CGSize)a4 actions:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  float v8 = (objc_class *)MEMORY[0x1E4FB17E0];
  id v9 = a5;
  id v10 = objc_alloc_init(v8);
  [v10 setScale:a3->contentsScale];
  double v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithSize:format:", v10, width, height);
  float v12 = [v11 imageWithActions:v9];

  return v12;
}

+ (id)makeComponentImageWithMetrics:(const SBHClockApplicationIconImageMetrics *)a3 size:(CGSize)a4 path:(CGPath *)a5 fillColor:(id)a6 options:(unint64_t)a7
{
  double height = a4.height;
  double width = a4.width;
  id v13 = a6;
  if (a7)
  {
    double v14 = a3->shadowInset + a3->shadowInset;
    double width = width + v14;
    double height = height + v14;
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __94__SBHClockApplicationIconImageView_makeComponentImageWithMetrics_size_path_fillColor_options___block_invoke;
  v18[3] = &unk_1E6AB15C8;
  char v23 = a7 & 1;
  id v19 = v13;
  id v20 = a3;
  long long v21 = a5;
  unint64_t v22 = a7;
  id v15 = v13;
  long long v16 = objc_msgSend(a1, "makeComponentImageWithMetrics:size:actions:", a3, v18, width, height);

  return v16;
}

void __94__SBHClockApplicationIconImageView_makeComponentImageWithMetrics_size_path_fillColor_options___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (CGContext *)[a2 CGContext];
  uint64_t v4 = v3;
  if (*(unsigned char *)(a1 + 64)) {
    CGContextTranslateCTM(v3, *(CGFloat *)(*(void *)(a1 + 40) + 112), *(CGFloat *)(*(void *)(a1 + 40) + 112));
  }
  [*(id *)(a1 + 32) set];
  if (*(unsigned char *)(a1 + 64))
  {
    GenericGray = CGColorCreateGenericGray(0.0, 0.3);
    CGContextSetShadowWithColor(v4, *MEMORY[0x1E4F1DB30], *(CGFloat *)(*(void *)(a1 + 40) + 104), GenericGray);
    CGColorRelease(GenericGray);
  }
  CGContextAddPath(v4, *(CGPathRef *)(a1 + 48));
  CGPathDrawingMode v6 = (*(_DWORD *)(a1 + 56) >> 1) & 1;
  CGContextDrawPath(v4, v6);
}

+ (id)makeDotImageWithOuterDiameter:(double)a3 innerDiameter:(double)a4 color:(id)a5 isSeconds:(BOOL)a6 metrics:(const SBHClockApplicationIconImageMetrics *)a7
{
  BOOL v8 = a6;
  id v12 = a5;
  Mutable = CGPathCreateMutable();
  v18.origin.x = (a3 - a4) * 0.5;
  v18.origin.y = v18.origin.x;
  v18.size.double width = a4;
  v18.size.double height = a4;
  CGPathAddEllipseInRect(Mutable, 0, v18);
  v19.origin.x = 0.0;
  v19.origin.y = 0.0;
  v19.size.double width = a3;
  v19.size.double height = a3;
  CGPathAddEllipseInRect(Mutable, 0, v19);
  if (v8) {
    uint64_t v14 = 2;
  }
  else {
    uint64_t v14 = 3;
  }
  id v15 = objc_msgSend(a1, "makeComponentImageWithMetrics:size:path:fillColor:options:", a7, Mutable, v12, v14, a3, a3);

  CGPathRelease(Mutable);
  return v15;
}

+ (id)makeSecondsHandImageWithMetrics:(const SBHClockApplicationIconImageMetrics *)a3 imageAppearance:(id)a4
{
  CGPathDrawingMode v6 = [a1 secondsHandColorWithImageAppearance:a4];
  double v7 = a3->secondsHandRingDiameter * 0.5;
  Mutable = CGPathCreateMutable();
  v12.size.double width = a3->secondsHandWidth;
  v12.size.double height = a3->secondsHandLength;
  v12.origin.x = v7 - a3->secondsHandWidth * 0.5;
  v12.origin.y = 0.0;
  CGPathAddRect(Mutable, 0, v12);
  v13.size.double width = a3->secondsHandWidth;
  v13.origin.x = v7 - a3->secondsHandWidth * 0.5;
  v13.size.double height = a3->secondsHandleLength;
  v13.origin.y = a3->secondsHandLength + a3->secondsHandRingDiameter;
  CGPathAddRect(Mutable, 0, v13);
  id v9 = objc_msgSend(a1, "makeComponentImageWithMetrics:size:path:fillColor:options:", a3, Mutable, v6, 0, a3->secondsHandBounds.width, a3->secondsHandBounds.height);
  CGPathRelease(Mutable);

  return v9;
}

+ (id)makeMinutesHandImageWithMetrics:(const SBHClockApplicationIconImageMetrics *)a3 imageAppearance:(id)a4
{
  CGPathDrawingMode v6 = [a1 hoursMinutesHandColorWithImageAppearance:a4];
  CGFloat v7 = a3->minutesHandRingDiameter * 0.5;
  Mutable = CGPathCreateMutable();
  v15.size.double width = a3->separatorWidth;
  v15.origin.x = v7 - v15.size.width * 0.5;
  double separatorExtraLength = a3->separatorExtraLength;
  v15.origin.y = a3->minutesHandLength - separatorExtraLength;
  v15.size.double height = separatorExtraLength + separatorExtraLength + a3->separatorLength;
  CGPathAddRect(Mutable, 0, v15);
  double minutesHandWidth = a3->minutesHandWidth;
  CGFloat v11 = minutesHandWidth * 0.5;
  CGPathMoveToPoint(Mutable, 0, v7 - minutesHandWidth * 0.5, minutesHandWidth);
  CGPathAddArc(Mutable, 0, v7, v11, v11, 3.14159265, 0.0, 0);
  CGPathAddLineToPoint(Mutable, 0, v7 + v11, a3->minutesHandLength - a3->minutesHandWidth);
  CGPathAddArc(Mutable, 0, v7, a3->minutesHandLength - v11, v11, 0.0, 3.14159265, 0);
  CGPathCloseSubpath(Mutable);
  CGRect v12 = objc_msgSend(a1, "makeComponentImageWithMetrics:size:path:fillColor:options:", a3, Mutable, v6, 1, a3->minutesHandBounds.width, a3->minutesHandBounds.height);
  CGPathRelease(Mutable);

  return v12;
}

+ (id)makeHoursHandImageWithMetrics:(const SBHClockApplicationIconImageMetrics *)a3 imageAppearance:(id)a4
{
  CGPathDrawingMode v6 = [a1 hoursMinutesHandColorWithImageAppearance:a4];
  CGFloat v7 = a3->minutesHandRingDiameter * 0.5;
  Mutable = CGPathCreateMutable();
  v15.size.double width = a3->separatorWidth;
  v15.origin.x = v7 - v15.size.width * 0.5;
  double separatorExtraLength = a3->separatorExtraLength;
  v15.origin.y = a3->hoursHandLength - separatorExtraLength;
  v15.size.double height = separatorExtraLength + separatorExtraLength + a3->separatorLength;
  CGPathAddRect(Mutable, 0, v15);
  double hoursHandWidth = a3->hoursHandWidth;
  CGFloat v11 = hoursHandWidth * 0.5;
  CGPathMoveToPoint(Mutable, 0, v7 - hoursHandWidth * 0.5, hoursHandWidth);
  CGPathAddArc(Mutable, 0, v7, v11, v11, 3.14159265, 0.0, 0);
  CGPathAddLineToPoint(Mutable, 0, v7 + v11, a3->hoursHandLength - a3->hoursHandWidth);
  CGPathAddArc(Mutable, 0, v7, a3->hoursHandLength - v11, v11, 0.0, 3.14159265, 0);
  CGPathCloseSubpath(Mutable);
  CGRect v12 = objc_msgSend(a1, "makeComponentImageWithMetrics:size:path:fillColor:options:", a3, Mutable, v6, 1, a3->hoursHandBounds.width, a3->hoursHandBounds.height);
  CGPathRelease(Mutable);

  return v12;
}

+ (id)makeImageSetForMetrics:(const SBHClockApplicationIconImageMetrics *)a3 imageAppearance:(id)a4
{
  id v6 = a4;
  CGFloat v7 = objc_alloc_init(SBHClockHandsImageSet);
  [(SBHClockHandsImageSet *)v7 setMetrics:a3];
  BOOL v8 = [a1 makeHoursHandImageWithMetrics:a3 imageAppearance:v6];
  [(SBHClockHandsImageSet *)v7 setHours:v8];
  id v9 = [a1 makeMinutesHandImageWithMetrics:a3 imageAppearance:v6];
  [(SBHClockHandsImageSet *)v7 setMinutes:v9];
  id v10 = [a1 makeSecondsHandImageWithMetrics:a3 imageAppearance:v6];
  [(SBHClockHandsImageSet *)v7 setSeconds:v10];
  CGFloat v11 = [a1 hoursMinutesHandColorWithImageAppearance:v6];
  CGRect v12 = [a1 makeDotImageWithOuterDiameter:v11 innerDiameter:0 color:a3 isSeconds:a3->minutesHandRingDiameter metrics:a3->minutesHandRingKnockoutDiameter];
  [(SBHClockHandsImageSet *)v7 setHourMinuteDot:v12];
  CGRect v13 = [a1 secondsHandColorWithImageAppearance:v6];

  uint64_t v14 = [a1 makeDotImageWithOuterDiameter:v13 innerDiameter:1 color:a3 isSeconds:a3->secondsHandRingDiameter metrics:a3->secondsHandRingKnockoutDiameter];
  [(SBHClockHandsImageSet *)v7 setSecondDot:v14];

  return v7;
}

+ (void)cacheIconImage:(id)a3 forIconImageInfo:(SBIconImageInfo *)a4 imageAppearance:(id)a5 options:(unint64_t)a6
{
  double v12 = v9;
  double v13 = v8;
  double v14 = v7;
  double v15 = v6;
  id v24 = a3;
  long long v17 = a4;
  BSDispatchQueueAssertMain();
  CGRect v18 = objc_msgSend(a1, "cacheKeyForIconImageWithImageInfo:imageAppearance:options:", v17, a5, v15, v14, v13, v12);
  CGRect v19 = (void *)sharedIconImageCache;
  if (!sharedIconImageCache)
  {
    id v20 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v21 = (void *)sharedIconImageCache;
    sharedIconImageCache = (uint64_t)v20;

    CGRect v19 = (void *)sharedIconImageCache;
  }
  unint64_t v22 = [v19 objectForKey:v18];
  if (!v22)
  {
    unint64_t v22 = objc_alloc_init(SBHIconImageAppearanceStore);
    [(id)sharedIconImageCache setObject:v22 forKey:v18];
  }
  if (v24)
  {
    char v23 = [a1 appearanceStoreIcon];
    [(SBHIconImageAppearanceStore *)v22 setImage:v24 forIcon:v23 appearance:v17];
  }
}

+ (id)makeIconImageWithImageInfo:(SBIconImageInfo *)a3 imageAppearance:(id)a4 options:(unint64_t)a5
{
  int v79 = (int)a4;
  double v9 = v8;
  double v10 = v7;
  double v11 = v6;
  double v12 = v5;
  uint64_t v117 = *MEMORY[0x1E4F143B8];
  v83 = a3;
  uint64_t v14 = [MEMORY[0x1E4FB1E20] traitCollectionWithArtworkSubtype:SBFEffectiveArtworkSubtype()];
  uint64_t v15 = objc_msgSend(a1, "numbersImageNameWithImageInfo:", v12, v11, v10, v9);
  long long v16 = (void *)MEMORY[0x1E4FB1818];
  long long v17 = SBHBundle();
  CGRect v18 = [v16 imageNamed:v15 inBundle:v17 compatibleWithTraitCollection:v14];

  if (!v18)
  {
    id v24 = SBLogClock();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
      +[SBHClockApplicationIconImageView makeIconImageWithImageInfo:imageAppearance:options:](v24);
    }

    goto LABEL_23;
  }
  data[0] = 0;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  id v20 = CGBitmapContextCreate(data, 1uLL, 1uLL, 8uLL, 0x20uLL, DeviceRGB, 1u);
  CGColorSpaceRelease(DeviceRGB);
  if (v20)
  {
    id v21 = v18;
    unint64_t v22 = (CGImage *)[v21 CGImage];
    v120.origin.x = 0.0;
    v120.origin.y = 0.0;
    v120.size.double width = 1.0;
    v120.size.double height = 1.0;
    CGContextDrawImage(v20, v120, v22);
    if (!LOBYTE(data[0]) && __PAIR16__(BYTE1(data[0]), 0) == BYTE2(data[0]))
    {

      char v23 = SBLogClock();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
        +[SBHClockApplicationIconImageView makeIconImageWithImageInfo:imageAppearance:options:]();
      }
LABEL_22:

      CGContextRelease(v20);
LABEL_23:
      CGRect v18 = objc_msgSend(a1, "fallbackNumbersImageWithIconImageInfo:", v12, v11, v10, v9);
      goto LABEL_24;
    }
    if (LOBYTE(data[0]) == 255 && BYTE1(data[0]) == 255 && BYTE2(data[0]) == 255)
    {

      char v23 = SBLogClock();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
        +[SBHClockApplicationIconImageView makeIconImageWithImageInfo:imageAppearance:options:]();
      }
      goto LABEL_22;
    }
    if (!HIBYTE(data[0]))
    {

      char v23 = SBLogClock();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
        +[SBHClockApplicationIconImageView makeIconImageWithImageInfo:imageAppearance:options:].cold.4();
      }
      goto LABEL_22;
    }
    CGContextRelease(v20);
  }
  uint64_t v25 = SBLogClock();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    long long v26 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v26 _referenceBounds];
    v119.double width = v27;
    v119.double height = v28;
    long long v29 = NSStringFromCGSize(v119);
    long long v30 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v30 scale];
    data[0] = 138543618;
    *(void *)&data[1] = v29;
    LOWORD(data[3]) = 2048;
    *(void *)((char *)&data[3] + 2) = v31;
    _os_log_impl(&dword_1D7F0A000, v25, OS_LOG_TYPE_DEFAULT, "Found clock icon asset with size(%{public}@) in scale(%f)!", (uint8_t *)data, 0x16u);
  }
LABEL_24:
  v81 = (void *)v15;
  v82 = (void *)v14;
  switch([(SBIconImageInfo *)v83 appearanceType])
  {
    case 0:
      uint64_t v32 = [MEMORY[0x1E4FB1618] blackColor];
      v33 = (void *)MEMORY[0x1E4FB1618];
      double v34 = 1.0;
      goto LABEL_28;
    case 1:
    case 3:
      uint64_t v32 = [MEMORY[0x1E4FB1618] whiteColor];
      v33 = (void *)MEMORY[0x1E4FB1618];
      double v34 = 0.18;
LABEL_28:
      v36 = [v33 colorWithRed:0.960784314 green:0.960784314 blue:0.97254902 alpha:v34];
      v35 = 0;
      if (v32) {
        goto LABEL_29;
      }
      goto LABEL_31;
    case 2:
      v38 = [(SBIconImageInfo *)v83 tintColor];
      v39 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.15];
      uint64_t v40 = *MEMORY[0x1E4F3A298];
      v41 = [v38 _colorBlendedWithColor:v39 compositingFilter:*MEMORY[0x1E4F3A298]];
      uint64_t v42 = [v41 colorWithAlphaComponent:0.85];

      v43 = [MEMORY[0x1E4FB1618] colorWithRed:0.960784314 green:0.960784314 blue:0.97254902 alpha:0.18];
      v44 = [v38 _colorBlendedWithColor:v43 compositingFilter:v40];
      v36 = [v44 colorWithAlphaComponent:0.18];

      uint64_t v32 = v42;
      v35 = v38;

      if (v32)
      {
LABEL_29:
        v77 = (void *)v32;
        uint64_t v37 = [v18 imageWithTintColor:v32];

        CGRect v18 = (void *)v37;
      }
      else
      {
LABEL_31:
        v77 = 0;
      }
      break;
    default:
      v77 = 0;
      v35 = 0;
      v36 = 0;
      break;
  }
  uint64_t v116 = 0;
  long long v114 = 0u;
  long long v115 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  memset(data, 0, sizeof(data));
  objc_msgSend(a1, "getMetrics:forIconImageInfo:", data, v12, v11, v10, v9);
  double v45 = *(double *)&v113 + *(double *)&v113;
  v46 = [MEMORY[0x1E4FB17E0] preferredFormat];
  [v46 setOpaque:1];
  v47 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithSize:format:", v46, v12, v11);
  v90[0] = MEMORY[0x1E4F143A8];
  v90[1] = 3221225472;
  v90[2] = __87__SBHClockApplicationIconImageView_makeIconImageWithImageInfo_imageAppearance_options___block_invoke;
  v90[3] = &unk_1E6AB15F0;
  double v93 = v12;
  double v94 = v11;
  double v95 = v10;
  double v96 = v9;
  double v97 = v45;
  uint64_t v98 = 0;
  uint64_t v99 = 0;
  double v100 = v12;
  double v101 = v11;
  id v48 = v36;
  id v91 = v48;
  id v49 = v18;
  id v92 = v49;
  v78 = v47;
  v50 = [v47 imageWithActions:v90];
  v51 = +[SBHIconImageAppearance lightAppearance];
  id v52 = objc_alloc(MEMORY[0x1E4F6F1E8]);
  id v53 = v50;
  uint64_t v54 = [v53 CGImage];
  [v53 scale];
  v55 = objc_msgSend(v52, "initWithCGImage:scale:", v54);
  id v56 = objc_alloc(MEMORY[0x1E4F6F248]);
  v102 = v55;
  v57 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v102 count:1];
  v58 = (void *)[v56 initWithImages:v57];

  v59 = objc_msgSend(objc_alloc(MEMORY[0x1E4F6F258]), "initWithSize:scale:", v12, v11, v10);
  char v60 = SBHIconServicesOptionsForImageOptions(v79);
  v80 = v51;
  SBHModifyImageDescriptorWithImageAppearance(v59, v51, v60);
  v61 = [v58 prepareImageForDescriptor:v59];
  v62 = v61;
  if (!v61) {
    goto LABEL_34;
  }
  v63 = (void *)MEMORY[0x1E4FB1818];
  v76 = v59;
  v64 = v58;
  id v65 = v53;
  v66 = v55;
  id v67 = v48;
  id v68 = v49;
  v69 = v46;
  v70 = v35;
  uint64_t v71 = [v61 CGImage];
  [v62 scale];
  uint64_t v72 = v71;
  v35 = v70;
  v46 = v69;
  id v49 = v68;
  id v48 = v67;
  v55 = v66;
  id v53 = v65;
  v58 = v64;
  v59 = v76;
  v73 = objc_msgSend(v63, "imageWithCGImage:scale:orientation:", v72, 0);
  if (!v73)
  {
LABEL_34:
    v74 = (void *)MEMORY[0x1E4FB1818];
    v84[0] = MEMORY[0x1E4F143A8];
    v84[1] = 3221225472;
    v84[2] = __87__SBHClockApplicationIconImageView_makeIconImageWithImageInfo_imageAppearance_options___block_invoke_2;
    v84[3] = &unk_1E6AACA38;
    double v86 = v12;
    double v87 = v11;
    double v88 = v10;
    double v89 = v9;
    id v85 = v49;
    v73 = objc_msgSend(v74, "sbf_imageFromContextWithSize:scale:type:pool:drawing:", 0, 0, v84, v12, v11, v10);
  }
  return v73;
}

void __87__SBHClockApplicationIconImageView_makeIconImageWithImageInfo_imageAppearance_options___block_invoke(uint64_t a1, void *a2)
{
  values[2] = *(void **)MEMORY[0x1E4F143B8];
  id v3 = (CGContext *)[a2 CGContext];
  uint64_t v4 = [MEMORY[0x1E4FB1618] colorWithWhite:0.192156863 alpha:1.0];
  double v5 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0784313725 alpha:1.0];
  id v6 = v4;
  values[0] = (void *)[v6 CGColor];
  id v7 = v5;
  values[1] = (void *)[v7 CGColor];
  CFArrayRef v8 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const void **)values, 2, MEMORY[0x1E4F1D510]);
  ColorSpace = CGBitmapContextGetColorSpace(v3);
  double v10 = CGGradientCreateWithColors(ColorSpace, v8, 0);
  CFRelease(v8);
  v14.y = *(CGFloat *)(a1 + 56);
  v14.x = 0.0;
  CGContextDrawLinearGradient(v3, v10, *MEMORY[0x1E4F1DAD8], v14, 0);
  CGGradientRelease(v10);
  double v11 = (void *)MEMORY[0x1E4FB14C0];
  UIRectCenteredRect();
  double v12 = objc_msgSend(v11, "bezierPathWithOvalInRect:");
  [*(id *)(a1 + 32) set];
  [v12 fill];
  objc_msgSend(*(id *)(a1 + 40), "drawInRect:", *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112));
}

void __87__SBHClockApplicationIconImageView_makeIconImageWithImageInfo_imageAppearance_options___block_invoke_2(uint64_t a1)
{
  double v2 = *(double *)(a1 + 40);
  double v3 = *(double *)(a1 + 48);
  objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, v2, v3, *(double *)(a1 + 64));
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 addClip];
  uint64_t v4 = [MEMORY[0x1E4FB1618] whiteColor];
  [v4 set];

  [v5 fill];
  objc_msgSend(*(id *)(a1 + 32), "drawInRect:", 0.0, 0.0, v2, v3);
}

+ (id)fallbackNumbersImageWithIconImageInfo:(SBIconImageInfo *)a3
{
  uint64_t v7 = v6;
  uint64_t v8 = v5;
  double v9 = v4;
  double v10 = v3;
  uint64_t v50 = 0;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  [a1 getMetrics:&v36 forIconImageInfo:v3];
  double v11 = [MEMORY[0x1E4FB17E0] preferredFormat];
  [v11 setPreferredRange:32766];
  [v11 setOpaque:1];
  double v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithSize:format:", v11, v10, v9);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __74__SBHClockApplicationIconImageView_fallbackNumbersImageWithIconImageInfo___block_invoke;
  v16[3] = &__block_descriptor_296_e40_v16__0__UIGraphicsImageRendererContext_8l;
  long long v29 = v48;
  long long v30 = v49;
  uint64_t v31 = v50;
  long long v25 = v44;
  long long v26 = v45;
  long long v28 = v47;
  long long v27 = v46;
  long long v21 = v40;
  long long v22 = v41;
  long long v24 = v43;
  long long v23 = v42;
  long long v17 = v36;
  long long v18 = v37;
  long long v20 = v39;
  long long v19 = v38;
  double v32 = v10;
  double v33 = v9;
  uint64_t v34 = v8;
  uint64_t v35 = v7;
  double v13 = [v12 imageWithActions:v16];
  CGPoint v14 = [v13 imageWithRenderingMode:2];

  return v14;
}

void __74__SBHClockApplicationIconImageView_fallbackNumbersImageWithIconImageInfo___block_invoke(double *a1)
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  [v2 setFormattingContext:2];
  [v2 setNumberStyle:1];
  v22[0] = *MEMORY[0x1E4FB06F8];
  double v3 = [MEMORY[0x1E4FB08E0] systemFontOfSize:a1[27]];
  v23[0] = v3;
  v22[1] = *MEMORY[0x1E4FB0700];
  double v4 = [MEMORY[0x1E4FB1618] blackColor];
  v23[1] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];

  unint64_t v6 = 0;
  double v20 = a1[26] * 0.8;
  double v21 = a1[33] * 0.5;
  double v7 = a1[34] * 0.5;
  double v8 = -v20;
  do
  {
    double v9 = (double)v6 * 0.523598776;
    uint64_t v10 = 1;
    while (v9 > 1.57079633)
    {
      double v9 = v9 + -1.57079633;
      ++v10;
    }
    if (v6)
    {
      double v11 = [NSNumber numberWithUnsignedInteger:v6];
      double v12 = [v2 stringFromNumber:v11];
    }
    else
    {
      double v12 = [v2 stringFromNumber:&unk_1F300EF38];
    }
    if (v10 == 3)
    {
      __double2 v17 = __sincos_stret(v9);
      double v14 = v21 + v8 * v17.__sinval;
      double v15 = v7 + v20 * v17.__cosval;
    }
    else if (v10 == 2)
    {
      __double2 v16 = __sincos_stret(v9);
      double v14 = v21 + v20 * v16.__cosval;
      double v15 = v7 + v20 * v16.__sinval;
    }
    else
    {
      __double2 v13 = __sincos_stret(1.57079633 - v9);
      if (v10 == 1)
      {
        double v14 = v21 + v20 * v13.__cosval;
        double v15 = v7 + v8 * v13.__sinval;
      }
      else
      {
        double v14 = v21 + v8 * v13.__sinval;
        double v15 = v7 + v8 * v13.__cosval;
      }
    }
    [v12 sizeWithAttributes:v5];
    objc_msgSend(v12, "drawAtPoint:withAttributes:", v5, v14 - v18 * 0.5, v15 - v19 * 0.5);

    ++v6;
  }
  while (v6 != 12);
}

+ (void)precacheDataWithIconImageInfo:(SBIconImageInfo *)a3
{
  double v7 = v6;
  double v8 = v5;
  double v9 = v4;
  double v10 = v3;
  id v12 = +[SBHIconImageAppearance defaultAppearance];
  objc_msgSend(a1, "precacheDataWithIconImageInfo:appearance:", v12, v10, v9, v8, v7);
}

+ (void)precacheDataWithIconImageInfo:(SBIconImageInfo *)a3 appearance:(id)a4
{
  double v8 = v7;
  double v9 = v6;
  double v10 = v5;
  double v11 = v4;
  __double2 v13 = a3;
  objc_msgSend(a1, "precacheDataWithIconImageInfo:appearance:options:", v13, 1, v11, v10, v9, v8);
  objc_msgSend(a1, "precacheDataWithIconImageInfo:appearance:options:", v13, 0, v11, v10, v9, v8);
}

+ (void)precacheDataWithIconImageInfo:(SBIconImageInfo *)a3 appearance:(id)a4 options:(unint64_t)a5
{
  double v10 = v8;
  double v11 = v7;
  double v12 = v6;
  double v13 = v5;
  double v15 = a3;
  __double2 v16 = objc_msgSend(a1, "cachedIconImageWithImageInfo:imageAppearance:options:", v15, a4, v13, v12, v11, v10);
  if (!v16)
  {
    __double2 v17 = precacheDataWithIconImageInfo_appearance_options__precachingQueue;
    if (!precacheDataWithIconImageInfo_appearance_options__precachingQueue)
    {
      uint64_t Serial = BSDispatchQueueCreateSerial();
      double v19 = (void *)precacheDataWithIconImageInfo_appearance_options__precachingQueue;
      precacheDataWithIconImageInfo_appearance_options__precachingQueue = Serial;

      __double2 v17 = precacheDataWithIconImageInfo_appearance_options__precachingQueue;
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __85__SBHClockApplicationIconImageView_precacheDataWithIconImageInfo_appearance_options___block_invoke;
    block[3] = &unk_1E6AAFE30;
    id v22 = a1;
    double v23 = v13;
    double v24 = v12;
    double v25 = v11;
    double v26 = v10;
    double v21 = v15;
    id v27 = a4;
    dispatch_async(v17, block);
  }
}

void __85__SBHClockApplicationIconImageView_precacheDataWithIconImageInfo_appearance_options___block_invoke(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 40), "makeIconImageWithImageInfo:imageAppearance:options:", *(void *)(a1 + 32), *(void *)(a1 + 80), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  long long v5 = *(_OWORD *)(a1 + 32);
  id v3 = (id)v5;
  id v4 = v2;
  BSDispatchMain();
}

uint64_t __85__SBHClockApplicationIconImageView_precacheDataWithIconImageInfo_appearance_options___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 48), "cacheIconImage:forIconImageInfo:imageAppearance:options:", *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 88), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
}

void __48__SBHClockApplicationIconImageView_cacheKeyIcon__block_invoke()
{
  v0 = objc_alloc_init(SBIcon);
  v1 = (void *)cacheKeyIcon_cacheKeyIcon;
  cacheKeyIcon_cacheKeyIcon = (uint64_t)v0;
}

- (void)clearCachedImages
{
  v3.receiver = self;
  v3.super_class = (Class)SBHClockApplicationIconImageView;
  [(SBIconImageView *)&v3 clearCachedImages];
  [(SBHIconImageAppearanceStore *)self->_contentsImages removeAllImages];
  [(SBHIconImageAppearanceStore *)self->_squareContentsImages removeAllImages];
}

- (void)localeDidChange:(id)a3
{
  id v5 = [(id)objc_opt_class() systemNumberingSystem];
  id v4 = [(SBHClockApplicationIconImageView *)self currentNumberingSystem];
  if (!v4 || ([v5 isEqualToString:v4] & 1) == 0)
  {
    [(SBHClockApplicationIconImageView *)self clearCachedImages];
    [(SBHClockApplicationIconImageView *)self updateImageAnimated:0];
    [(SBHClockApplicationIconImageView *)self setCurrentNumberingSystem:v5];
  }
}

- (void)willAnimateIconImageInfoChange
{
  v3.receiver = self;
  v3.super_class = (Class)SBHClockApplicationIconImageView;
  [(SBIconImageView *)&v3 willAnimateIconImageInfoChange];
  [(SBHClockApplicationIconImageView *)self setHandsHidden:1];
}

- (void)didAnimateIconImageInfoChange
{
  v3.receiver = self;
  v3.super_class = (Class)SBHClockApplicationIconImageView;
  [(SBIconImageView *)&v3 didAnimateIconImageInfoChange];
  [(SBHClockApplicationIconImageView *)self setHandsHidden:0 animated:1];
}

- (void)iconImageInfoDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)SBHClockApplicationIconImageView;
  [(SBIconImageView *)&v3 iconImageInfoDidChange];
  [(SBHClockApplicationIconImageView *)self resetForegroundLayers];
  [(SBHClockApplicationIconImageView *)self setNeedsLayout];
  [(SBHClockApplicationIconImageView *)self layoutIfNeeded];
}

- (void)controller:(id)a3 didChangeOverrideDateFromDate:(id)a4
{
  id v5 = a3;
  id v8 = [v5 overrideDate];
  [v5 overrideDateOffset];
  double v7 = v6;

  [(id)objc_opt_class() setOverrideDate:v8];
  [(id)objc_opt_class() setOverrideDateOffset:v7];
  [(SBHClockApplicationIconImageView *)self updateAnimatingState];
  [(SBHClockApplicationIconImageView *)self updateUnanimated];
}

- (NSString)currentNumberingSystem
{
  return self->_currentNumberingSystem;
}

- (void)setCurrentNumberingSystem:(id)a3
{
}

+ (void)_timerFired:.cold.1()
{
  OUTLINED_FUNCTION_6();
  _os_log_debug_impl(&dword_1D7F0A000, v0, OS_LOG_TYPE_DEBUG, "Tick...", v1, 2u);
}

+ (void)makeIconImageWithImageInfo:(NSObject *)a1 imageAppearance:options:.cold.1(NSObject *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v2 _referenceBounds];
  v13.double width = v3;
  v13.double height = v4;
  id v5 = NSStringFromCGSize(v13);
  double v6 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v6 scale];
  int v8 = 138543618;
  double v9 = v5;
  __int16 v10 = 2048;
  uint64_t v11 = v7;
  _os_log_fault_impl(&dword_1D7F0A000, a1, OS_LOG_TYPE_FAULT, "Could not find clock icon asset with size(%{public}@) in scale(%f)!", (uint8_t *)&v8, 0x16u);
}

+ (void)makeIconImageWithImageInfo:imageAppearance:options:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_3(&dword_1D7F0A000, v0, v1, "Clock icon asset was all black!", v2, v3, v4, v5, v6);
}

+ (void)makeIconImageWithImageInfo:imageAppearance:options:.cold.3()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_3(&dword_1D7F0A000, v0, v1, "Clock icon asset was all white!", v2, v3, v4, v5, v6);
}

+ (void)makeIconImageWithImageInfo:imageAppearance:options:.cold.4()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_3(&dword_1D7F0A000, v0, v1, "Clock icon asset was all clear!", v2, v3, v4, v5, v6);
}

@end