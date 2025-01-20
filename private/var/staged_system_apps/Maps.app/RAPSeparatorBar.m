@interface RAPSeparatorBar
+ (double)thickness;
- (RAPSeparatorBar)init;
- (void)_updateBackgroundColor;
@end

@implementation RAPSeparatorBar

- (RAPSeparatorBar)init
{
  v5.receiver = self;
  v5.super_class = (Class)RAPSeparatorBar;
  v2 = [(RAPSeparatorBar *)&v5 init];
  v3 = v2;
  if (v2) {
    [(RAPSeparatorBar *)v2 _updateBackgroundColor];
  }
  return v3;
}

- (void)_updateBackgroundColor
{
  id v4 = [(RAPSeparatorBar *)self traitCollection];
  if ([v4 userInterfaceStyle] == (id)1) {
    +[UIColor tableSeparatorDarkColor];
  }
  else {
  v3 = +[UIColor tableSeparatorLightColor];
  }
  [(RAPSeparatorBar *)self setBackgroundColor:v3];
}

+ (double)thickness
{
  v2 = +[UIScreen mainScreen];
  [v2 scale];
  double v4 = 1.0 / v3;

  return v4;
}

@end