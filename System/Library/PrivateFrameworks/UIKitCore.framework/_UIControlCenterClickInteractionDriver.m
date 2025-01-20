@interface _UIControlCenterClickInteractionDriver
+ (BOOL)prefersCancelsTouchesInView;
- (_UIControlCenterClickInteractionDriver)init;
- (double)clickDownDuration;
@end

@implementation _UIControlCenterClickInteractionDriver

- (_UIControlCenterClickInteractionDriver)init
{
  v6.receiver = self;
  v6.super_class = (Class)_UIControlCenterClickInteractionDriver;
  v2 = [(_UILongPressClickInteractionDriver *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v4 = [(_UILongPressClickInteractionDriver *)v2 primaryGestureRecognizer];
    [v4 setMinimumDurationRequired:0.0];
    [v4 _setKeepTouchesOnContinuation:1];
    -[_UILongPressClickInteractionDriver setCancelsTouchesInView:](v3, "setCancelsTouchesInView:", [(id)objc_opt_class() prefersCancelsTouchesInView]);
  }
  return v3;
}

- (double)clickDownDuration
{
  int v2 = _AXSForceTouchTimeDuration();
  double result = dbl_186B94D20[v2 == 1];
  if (!v2) {
    return 0.5;
  }
  return result;
}

+ (BOOL)prefersCancelsTouchesInView
{
  return 0;
}

@end