@interface _UICoversheetClickInteractionDriver
- (_UICoversheetClickInteractionDriver)init;
- (double)clickDownDuration;
@end

@implementation _UICoversheetClickInteractionDriver

- (_UICoversheetClickInteractionDriver)init
{
  v6.receiver = self;
  v6.super_class = (Class)_UICoversheetClickInteractionDriver;
  v2 = [(_UILongPressClickInteractionDriver *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v4 = [(_UILongPressClickInteractionDriver *)v2 primaryGestureRecognizer];
    [v4 setMinimumDurationRequired:0.0];
  }
  return v3;
}

- (double)clickDownDuration
{
  int v2 = _AXSForceTouchTimeDuration();
  double result = 0.2;
  if (v2 == 1) {
    double result = 0.25;
  }
  if (!v2) {
    return 0.5;
  }
  return result;
}

@end