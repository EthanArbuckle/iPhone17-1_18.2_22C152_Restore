@interface _UIFloatingContentCornerRadiusAnimatingView
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
@end

@implementation _UIFloatingContentCornerRadiusAnimatingView

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"cornerRadius"])
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_UIFloatingContentCornerRadiusAnimatingView;
    BOOL v5 = [(UIView *)&v7 _shouldAnimatePropertyWithKey:v4];
  }

  return v5;
}

@end