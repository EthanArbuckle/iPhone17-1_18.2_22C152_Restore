@interface SUUIModalSourceViewProvider
- (SUUIModalSourceViewProviderDelegate)delegate;
- (UIBarButtonItem)sourceButtonBarItem;
- (UIView)originalSourceView;
- (UIView)sourceView;
- (id)animationView;
- (id)userInfo;
- (void)hideOriginalSourceView;
- (void)setDelegate:(id)a3;
- (void)setOriginalSourceView:(id)a3;
- (void)setSourceButtonBarItem:(id)a3;
- (void)setSourceView:(id)a3;
- (void)setUserInfo:(id)a3;
- (void)showOriginalSourceView;
@end

@implementation SUUIModalSourceViewProvider

- (id)animationView
{
  v3 = [(SUUIModalSourceViewProvider *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    v4 = [v3 animationViewForModalSourceViewProvider:self];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)hideOriginalSourceView
{
  self->_hideOriginalSourceView = 1;
  [(UIView *)self->_originalSourceView setHidden:1];
}

- (void)setOriginalSourceView:(id)a3
{
  v5 = (UIView *)a3;
  p_originalSourceView = &self->_originalSourceView;
  if (self->_originalSourceView != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_originalSourceView, a3);
    p_originalSourceView = (UIView **)[(UIView *)self->_originalSourceView setHidden:self->_hideOriginalSourceView];
    v5 = v7;
  }
  MEMORY[0x270F9A758](p_originalSourceView, v5);
}

- (void)showOriginalSourceView
{
  self->_hideOriginalSourceView = 0;
  [(UIView *)self->_originalSourceView setHidden:0];
}

- (SUUIModalSourceViewProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SUUIModalSourceViewProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIView)originalSourceView
{
  return self->_originalSourceView;
}

- (UIBarButtonItem)sourceButtonBarItem
{
  return self->_sourceButtonBarItem;
}

- (void)setSourceButtonBarItem:(id)a3
{
}

- (id)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (UIView)sourceView
{
  return self->_sourceView;
}

- (void)setSourceView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceView, 0);
  objc_storeStrong(&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_sourceButtonBarItem, 0);
  objc_storeStrong((id *)&self->_originalSourceView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end