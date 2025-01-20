@interface _NCFullScreenPresentableViewControllerView
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation _NCFullScreenPresentableViewControllerView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)_NCFullScreenPresentableViewControllerView;
  -[_NCFullScreenPresentableViewControllerView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (_NCFullScreenPresentableViewControllerView *)objc_claimAutoreleasedReturnValue();
  if (v5 == self)
  {
    v6 = [(_NCFullScreenPresentableViewControllerView *)self layer];
    char v7 = [v6 allowsHitTesting];

    if (v7)
    {
      v5 = self;
    }
    else
    {

      v5 = 0;
    }
  }

  return v5;
}

@end