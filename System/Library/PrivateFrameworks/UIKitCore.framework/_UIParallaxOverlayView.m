@interface _UIParallaxOverlayView
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation _UIParallaxOverlayView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)_UIParallaxOverlayView;
  -[UIView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (_UIParallaxOverlayView *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == self) {
    v7 = 0;
  }
  else {
    v7 = v5;
  }

  return v7;
}

@end