@interface UIViewFloatAnimatableProperty
- (UIViewFloatAnimatableProperty)init;
- (double)presentationValue;
- (double)value;
- (double)velocity;
- (void)setValue:(double)a3;
- (void)setVelocity:(double)a3;
@end

@implementation UIViewFloatAnimatableProperty

- (void)setValue:(double)a3
{
  id v5 = [NSNumber numberWithDouble:a3];
  v4 = [(UIAnimatablePropertyWrapper *)self animatableProperty];
  [v4 setValue:v5];
}

- (UIViewFloatAnimatableProperty)init
{
  v3 = +[UIAnimatablePropertyWrapper makeSwiftFloatAnimatableProperty];
  v6.receiver = self;
  v6.super_class = (Class)UIViewFloatAnimatableProperty;
  v4 = [(UIAnimatablePropertyWrapper *)&v6 initWithAnimatableProperty:v3];

  return v4;
}

- (double)value
{
  v2 = [(UIAnimatablePropertyWrapper *)self animatableProperty];
  v3 = [v2 value];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (double)presentationValue
{
  v2 = [(UIAnimatablePropertyWrapper *)self animatableProperty];
  v3 = [v2 presentationValue];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (double)velocity
{
  v2 = [(UIAnimatablePropertyWrapper *)self animatableProperty];
  v3 = [v2 velocity];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (void)setVelocity:(double)a3
{
  id v5 = [(UIAnimatablePropertyWrapper *)self animatableProperty];
  double v4 = [NSNumber numberWithDouble:a3];
  [v5 setVelocity:v4];
}

@end