@interface UILongPressGestureRecognizer
+ (void)be_enableUIVariableDelayLoupeGestureOverrides;
- (double)be_gestureDelay;
- (void)be_setDelay:(double)a3;
- (void)setBe_gestureDelay:(double)a3;
@end

@implementation UILongPressGestureRecognizer

+ (void)be_enableUIVariableDelayLoupeGestureOverrides
{
  if (qword_409BD0 != -1) {
    dispatch_once(&qword_409BD0, &stru_3C0EC8);
  }
}

- (double)be_gestureDelay
{
  v2 = objc_getAssociatedObject(self, "be_gestureDelay");
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (void)setBe_gestureDelay:(double)a3
{
  v5 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  objc_setAssociatedObject(self, "be_gestureDelay", v5, (char *)&def_7BFC0 + 1);

  [(UILongPressGestureRecognizer *)self setDelay:a3];
}

- (void)be_setDelay:(double)a3
{
  objc_getAssociatedObject(self, "be_gestureDelay");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    [v6 doubleValue];
    a3 = v5;
  }
  [(UILongPressGestureRecognizer *)self be_setDelay:a3];
}

@end