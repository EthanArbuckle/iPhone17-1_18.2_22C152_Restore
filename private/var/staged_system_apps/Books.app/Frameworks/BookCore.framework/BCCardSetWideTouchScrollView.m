@interface BCCardSetWideTouchScrollView
- (BCCardSetWideTouchScrollViewDelegate)accessibilityDelegate;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (id)_accessibilityScrollStatus;
- (void)accessibilityApplyScrollContent:(CGPoint)a3 sendScrollStatus:(BOOL)a4 animated:(BOOL)a5;
- (void)setAccessibilityDelegate:(id)a3;
@end

@implementation BCCardSetWideTouchScrollView

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(BCCardSetWideTouchScrollView *)self contentSize];
  CGRectMakeWithSize();
  CGFloat v10 = x;
  CGFloat v11 = y;

  return CGRectContainsPoint(*(CGRect *)&v6, *(CGPoint *)&v10);
}

- (id)_accessibilityScrollStatus
{
  v3 = [(BCCardSetWideTouchScrollView *)self accessibilityDelegate];
  v4 = [v3 accessibilityScrollStatusForWideTouchScrollView:self];

  return v4;
}

- (void)accessibilityApplyScrollContent:(CGPoint)a3 sendScrollStatus:(BOOL)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  double x = a3.x;
  [(BCCardSetWideTouchScrollView *)self contentOffset];
  v9.receiver = self;
  v9.super_class = (Class)BCCardSetWideTouchScrollView;
  [(BCCardSetWideTouchScrollView *)&v9 accessibilityApplyScrollContent:v6 sendScrollStatus:v5 animated:x];
}

- (BCCardSetWideTouchScrollViewDelegate)accessibilityDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessibilityDelegate);

  return (BCCardSetWideTouchScrollViewDelegate *)WeakRetained;
}

- (void)setAccessibilityDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end