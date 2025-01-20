@interface UIApplicationRotationFollowingControllerView
- (UIApplicationRotationFollowingControllerView)init;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation UIApplicationRotationFollowingControllerView

- (UIApplicationRotationFollowingControllerView)init
{
  v6.receiver = self;
  v6.super_class = (Class)UIApplicationRotationFollowingControllerView;
  v2 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v3 = v2;
  if (v2)
  {
    [(UIView *)v2 setOpaque:0];
    v4 = +[UIColor clearColor];
    [(UIView *)v3 setBackgroundColor:v4];
  }
  return v3;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)UIApplicationRotationFollowingControllerView;
  -[UIView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (UIApplicationRotationFollowingControllerView *)objc_claimAutoreleasedReturnValue();
  objc_super v6 = v5;
  if (v5 == self) {
    v7 = 0;
  }
  else {
    v7 = v5;
  }

  return v7;
}

@end