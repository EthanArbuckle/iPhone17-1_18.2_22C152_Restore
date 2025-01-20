@interface _SBSystemApertureProximityTouchHandlingView
- (_SBSystemApertureProximityTouchHandlingView)initWithDelegate:(id)a3 hitTestsAsOpaque:(BOOL)a4;
- (_SBSystemApertureProximityTouchHandlingViewDelegate)delegate;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation _SBSystemApertureProximityTouchHandlingView

- (_SBSystemApertureProximityTouchHandlingView)initWithDelegate:(id)a3 hitTestsAsOpaque:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_SBSystemApertureProximityTouchHandlingView;
  v7 = [(_SBSystemApertureProximityTouchHandlingView *)&v11 init];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_delegate, v6);
    v9 = [(_SBSystemApertureProximityTouchHandlingView *)v8 layer];
    [v9 setHitTestsAsOpaque:v4];
  }
  return v8;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v8 = [(_SBSystemApertureProximityTouchHandlingView *)self delegate];
  int v9 = objc_msgSend(v8, "proximityBacklightPolicyTouchHandlingView:shouldConsumeTouchForHitTest:withEvent:", self, v7, x, y);

  if (v9) {
    v10 = self;
  }
  else {
    v10 = 0;
  }
  objc_super v11 = v10;

  return v11;
}

- (_SBSystemApertureProximityTouchHandlingViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_SBSystemApertureProximityTouchHandlingViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end