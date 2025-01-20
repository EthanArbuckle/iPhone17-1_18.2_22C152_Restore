@interface AutomationOverlayWindow
- (AutomationOverlayWindowDelegate)automationWindowDelegate;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)setAutomationWindowDelegate:(id)a3;
@end

@implementation AutomationOverlayWindow

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)AutomationOverlayWindow;
  v5 = -[AutomationOverlayWindow hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_automationWindowDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([WeakRetained automationWindowAllowsUserInteraction:self] & 1) != 0)
  {
    id v7 = 0;
  }
  else
  {
    id v7 = v5;
  }

  return v7;
}

- (AutomationOverlayWindowDelegate)automationWindowDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_automationWindowDelegate);
  return (AutomationOverlayWindowDelegate *)WeakRetained;
}

- (void)setAutomationWindowDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end