@interface _UIFluidSliderFeedbackGenerator
+ (Class)_configurationClass;
- (BOOL)_canPlayDetentOnCurrentDevice;
- (BOOL)playFeedback:(int64_t)a3 forValue:(double)a4 atLocation:(CGPoint)a5;
- (_UIFluidSliderFeedbackGenerator)initWithView:(id)a3;
@end

@implementation _UIFluidSliderFeedbackGenerator

+ (Class)_configurationClass
{
  return (Class)objc_opt_class();
}

- (_UIFluidSliderFeedbackGenerator)initWithView:(id)a3
{
  id v4 = a3;
  v5 = +[_UIFluidSliderFeedbackConfiguration defaultConfiguration];
  v8.receiver = self;
  v8.super_class = (Class)_UIFluidSliderFeedbackGenerator;
  v6 = [(UIFeedbackGenerator *)&v8 initWithConfiguration:v5 view:v4];

  return v6;
}

- (BOOL)playFeedback:(int64_t)a3 forValue:(double)a4 atLocation:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  switch(a3)
  {
    case 0:
      objc_super v8 = [(_UIFluidSliderFeedbackGenerator *)self _sliderConfig];
      uint64_t v9 = [v8 minEdgeFeedback];
      goto LABEL_9;
    case 1:
      if (![(_UIFluidSliderFeedbackGenerator *)self _canPlayDetentOnCurrentDevice]) {
        return 1;
      }
      v12 = [(_UIFluidSliderFeedbackGenerator *)self _sliderConfig];
      v13 = [v12 detentFeedback];

      float v14 = a4 * 0.5 + (1.0 - a4) * 0.15;
      objc_super v8 = [v13 hapticParameters];
      *(float *)&double v15 = v14;
      [v8 setVolume:v15];
LABEL_10:

      if (!v13) {
        return 1;
      }
      -[UIFeedbackGenerator _playFeedback:atLocation:](self, "_playFeedback:atLocation:", v13, x, y);
      goto LABEL_12;
    case 2:
      if (!self) {
        return 0;
      }
      v13 = [(_UIFluidSliderFeedbackGenerator *)self _sliderConfig];
      v16 = [v13 selectionFeedback];
      -[UIFeedbackGenerator _playFeedback:withMinimumIntervalPassed:since:prefersRegularPace:atLocation:](self, "_playFeedback:withMinimumIntervalPassed:since:prefersRegularPace:atLocation:", v16, &_playSelectionFeedbackAtLocation____lastTime, 1, 0.04, x, y);

LABEL_12:
      return 1;
    case 3:
      objc_super v8 = [(_UIFluidSliderFeedbackGenerator *)self _sliderConfig];
      uint64_t v9 = [v8 maxEdgeFeedback];
LABEL_9:
      v13 = (void *)v9;
      goto LABEL_10;
    default:
      return 1;
  }
}

- (BOOL)_canPlayDetentOnCurrentDevice
{
  return MGIsDeviceOneOfType() ^ 1;
}

@end