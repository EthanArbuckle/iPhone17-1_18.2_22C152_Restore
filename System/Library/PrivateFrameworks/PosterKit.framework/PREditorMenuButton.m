@interface PREditorMenuButton
- (BSInvalidatable)menuPresentationAssertion;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
- (void)setMenuPresentationAssertion:(id)a3;
@end

@implementation PREditorMenuButton

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  v7.receiver = self;
  v7.super_class = (Class)PREditorMenuButton;
  [(PREditorMenuButton *)&v7 contextMenuInteraction:a3 willEndForConfiguration:a4 animator:a5];
  [(BSInvalidatable *)self->_menuPresentationAssertion invalidate];
  menuPresentationAssertion = self->_menuPresentationAssertion;
  self->_menuPresentationAssertion = 0;
}

- (void)setMenuPresentationAssertion:(id)a3
{
  p_menuPresentationAssertion = &self->_menuPresentationAssertion;
  id v5 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    [(BSInvalidatable *)*p_menuPresentationAssertion invalidate];
    objc_storeStrong((id *)p_menuPresentationAssertion, a3);
  }
}

- (BSInvalidatable)menuPresentationAssertion
{
  return self->_menuPresentationAssertion;
}

- (void).cxx_destruct
{
}

@end