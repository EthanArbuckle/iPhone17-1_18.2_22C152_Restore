@interface SBHStackConfigurationView
- (SBHStackConfigurationViewHitTestDelegate)delegate;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation SBHStackConfigurationView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBHStackConfigurationView;
  v8 = -[SBHStackConfigurationView hitTest:withEvent:](&v12, sel_hitTest_withEvent_, v7, x, y);
  v9 = [(SBHStackConfigurationView *)self delegate];
  v10 = v9;
  if (v9) {
    objc_msgSend(v9, "stackConfigurationView:didHitTestView:atPoint:withEvent:", self, v8, v7, x, y);
  }

  return v8;
}

- (SBHStackConfigurationViewHitTestDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBHStackConfigurationViewHitTestDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end