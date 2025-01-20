@interface SearchUISnippetUIButtonViewContext
- (BOOL)deviceIsAuthenticated;
- (UIView)sourceView;
- (id)viewForButtonItem:(id)a3;
- (void)setSourceView:(id)a3;
@end

@implementation SearchUISnippetUIButtonViewContext

- (BOOL)deviceIsAuthenticated
{
  v2 = [(SearchUISnippetUIButtonViewContext *)self sourceView];
  BOOL v3 = +[SearchUIUtilities deviceIsAuthenticatedForView:v2];

  return v3;
}

- (id)viewForButtonItem:(id)a3
{
  return 0;
}

- (UIView)sourceView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sourceView);
  return (UIView *)WeakRetained;
}

- (void)setSourceView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end