@interface UIImpactFeedbackGenerator
+ (Class)_configurationClass;
+ (UIImpactFeedbackGenerator)feedbackGeneratorWithStyle:(int64_t)a3 forView:(id)a4;
- (UIImpactFeedbackGenerator)initWithStyle:(UIImpactFeedbackStyle)style;
- (UIImpactFeedbackGenerator)initWithStyle:(int64_t)a3 coordinateSpace:(id)a4;
- (UIImpactFeedbackGenerator)initWithStyle:(int64_t)a3 view:(id)a4;
- (id)_stats_key;
- (id)_styleString;
- (id)_ui_descriptionBuilder;
- (void)__impactOccurredWithIntensity:(void *)a1 atLocation:(double)a2;
- (void)_impactOccurredWithIntensity:(double)a3;
- (void)impactOccurred;
- (void)impactOccurredAtLocation:(CGPoint)a3;
- (void)impactOccurredWithIntensity:(CGFloat)intensity;
@end

@implementation UIImpactFeedbackGenerator

+ (Class)_configurationClass
{
  return (Class)objc_opt_class();
}

- (void)__impactOccurredWithIntensity:(void *)a1 atLocation:(double)a2
{
  if (a1)
  {
    [a1 _clientDidUpdateGeneratorWithSelector:sel___impactOccurredWithIntensity_atLocation_];
    v4 = [a1 _impactConfiguration];
    v5 = [v4 feedback];

    if (v5)
    {
      id v13 = (id)[v5 copy];

      double v6 = 1.0;
      if (a2 <= 1.0) {
        double v6 = a2;
      }
      double v7 = fmax(v6, 0.0);
      v8 = [v13 hapticParameters];
      [v8 volume];
      *(float *)&double v7 = v7 * v9;
      v10 = [v13 hapticParameters];
      LODWORD(v11) = LODWORD(v7);
      [v10 setVolume:v11];

      v12 = [a1 _impactConfiguration];
      [v12 minimumInterval];
      objc_msgSend(a1, "_playFeedback:withMinimumIntervalPassed:since:prefersRegularPace:atLocation:", v13, &__impactOccurredWithIntensity_atLocation____lastTime, 0);
    }
  }
}

- (UIImpactFeedbackGenerator)initWithStyle:(UIImpactFeedbackStyle)style
{
  return [(UIImpactFeedbackGenerator *)self initWithStyle:style view:0];
}

- (id)_stats_key
{
  return @"impact";
}

- (void)impactOccurred
{
}

- (UIImpactFeedbackGenerator)initWithStyle:(int64_t)a3 view:(id)a4
{
  id v6 = a4;
  switch(a3)
  {
    case 0:
      uint64_t v7 = +[_UIImpactFeedbackGeneratorConfiguration lightConfiguration];
      goto LABEL_8;
    case 1:
      uint64_t v7 = +[_UIImpactFeedbackGeneratorConfiguration defaultConfiguration];
      goto LABEL_8;
    case 2:
      uint64_t v7 = +[_UIImpactFeedbackGeneratorConfiguration strongConfiguration];
      goto LABEL_8;
    case 3:
      uint64_t v7 = +[_UIImpactFeedbackGeneratorConfiguration softConfiguration];
      goto LABEL_8;
    case 4:
      uint64_t v7 = +[_UIImpactFeedbackGeneratorConfiguration rigidConfiguration];
LABEL_8:
      v8 = (void *)v7;
      break;
    default:
      v8 = 0;
      break;
  }
  v12.receiver = self;
  v12.super_class = (Class)UIImpactFeedbackGenerator;
  float v9 = [(UIFeedbackGenerator *)&v12 initWithConfiguration:v8 view:v6];
  v10 = v9;
  if (v9) {
    v9->_style = a3;
  }

  return v10;
}

- (UIImpactFeedbackGenerator)initWithStyle:(int64_t)a3 coordinateSpace:(id)a4
{
  id v6 = _viewFromCoordinateSpace(a4);
  uint64_t v7 = [(UIImpactFeedbackGenerator *)self initWithStyle:a3 view:v6];

  return v7;
}

+ (UIImpactFeedbackGenerator)feedbackGeneratorWithStyle:(int64_t)a3 forView:(id)a4
{
  id v6 = a4;
  uint64_t v7 = (void *)[objc_alloc((Class)a1) initWithStyle:a3 view:v6];

  return (UIImpactFeedbackGenerator *)v7;
}

- (void)_impactOccurredWithIntensity:(double)a3
{
}

- (void)impactOccurredAtLocation:(CGPoint)a3
{
}

- (void)impactOccurredWithIntensity:(CGFloat)intensity
{
  double v3 = fmax(intensity, 0.0);
  if (v3 > 1.0) {
    double v3 = 1.0;
  }
  -[UIImpactFeedbackGenerator __impactOccurredWithIntensity:atLocation:](self, v3);
}

- (id)_ui_descriptionBuilder
{
  v7.receiver = self;
  v7.super_class = (Class)UIImpactFeedbackGenerator;
  double v3 = [(UIFeedbackGenerator *)&v7 _ui_descriptionBuilder];
  v4 = [(UIImpactFeedbackGenerator *)self _styleString];
  v5 = [v3 appendName:@"style" object:v4];

  return v5;
}

- (id)_styleString
{
  unint64_t style = self->_style;
  if (style > 2) {
    return @"Unknown";
  }
  else {
    return off_1E52ECD10[style];
  }
}

@end