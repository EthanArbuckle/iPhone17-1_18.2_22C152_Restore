@interface TUISystemInputAssistantLayoutViewSet
- (TUIAssistantButtonBarView)leftButtonBar;
- (TUIAssistantButtonBarView)rightButtonBar;
- (TUIAssistantButtonBarView)unifiedButtonBar;
- (UIView)centerView;
- (UIView)viewSetContainer;
- (void)setCenterView:(id)a3;
- (void)setLeftButtonBar:(id)a3;
- (void)setRightButtonBar:(id)a3;
- (void)setUnifiedButtonBar:(id)a3;
- (void)setViewSetContainer:(id)a3;
@end

@implementation TUISystemInputAssistantLayoutViewSet

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewSetContainer, 0);
  objc_storeStrong((id *)&self->_centerView, 0);
  objc_storeStrong((id *)&self->_unifiedButtonBar, 0);
  objc_storeStrong((id *)&self->_rightButtonBar, 0);
  objc_storeStrong((id *)&self->_leftButtonBar, 0);
}

- (void)setViewSetContainer:(id)a3
{
}

- (UIView)viewSetContainer
{
  return self->_viewSetContainer;
}

- (void)setCenterView:(id)a3
{
}

- (UIView)centerView
{
  return self->_centerView;
}

- (void)setUnifiedButtonBar:(id)a3
{
}

- (TUIAssistantButtonBarView)unifiedButtonBar
{
  return self->_unifiedButtonBar;
}

- (void)setRightButtonBar:(id)a3
{
}

- (TUIAssistantButtonBarView)rightButtonBar
{
  return self->_rightButtonBar;
}

- (void)setLeftButtonBar:(id)a3
{
}

- (TUIAssistantButtonBarView)leftButtonBar
{
  return self->_leftButtonBar;
}

@end