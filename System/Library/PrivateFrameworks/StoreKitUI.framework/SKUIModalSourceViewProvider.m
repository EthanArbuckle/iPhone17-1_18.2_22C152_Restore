@interface SKUIModalSourceViewProvider
- (SKUIModalSourceViewProviderDelegate)delegate;
- (UIBarButtonItem)sourceButtonBarItem;
- (UIView)originalSourceView;
- (UIView)sourceView;
- (id)animationView;
- (id)userInfo;
- (void)animationView;
- (void)hideOriginalSourceView;
- (void)setDelegate:(id)a3;
- (void)setOriginalSourceView:(id)a3;
- (void)setSourceButtonBarItem:(id)a3;
- (void)setSourceView:(id)a3;
- (void)setUserInfo:(id)a3;
- (void)showOriginalSourceView;
@end

@implementation SKUIModalSourceViewProvider

- (id)animationView
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUIModalSourceViewProvider *)v3 animationView];
      }
    }
  }
  v11 = [(SKUIModalSourceViewProvider *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    v12 = [v11 animationViewForModalSourceViewProvider:self];
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)hideOriginalSourceView
{
}

- (void)setOriginalSourceView:(id)a3
{
  uint64_t v5 = (UIView *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v6 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v6) {
        -[SKUIModalSourceViewProvider setOriginalSourceView:](v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }
  }
  if (self->_originalSourceView != v5)
  {
    objc_storeStrong((id *)&self->_originalSourceView, a3);
    [(UIView *)self->_originalSourceView setHidden:self->_hideOriginalSourceView];
  }
}

- (void)showOriginalSourceView
{
}

- (SKUIModalSourceViewProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SKUIModalSourceViewProviderDelegate *)WeakRetained;
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

- (void)animationView
{
}

- (void)setOriginalSourceView:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end