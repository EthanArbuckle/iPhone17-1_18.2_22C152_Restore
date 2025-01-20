@interface SUUINavigationBarSectionController
- (SUUINavigationBarContext)context;
- (SUUIViewElementLayoutContext)viewLayoutContext;
- (UIView)view;
- (id)barButtonItemForElementIdentifier:(id)a3;
- (id)viewForElementIdentifier:(id)a3;
- (void)dealloc;
- (void)setContext:(id)a3;
@end

@implementation SUUINavigationBarSectionController

- (void)dealloc
{
  [(SUUIViewElementLayoutContext *)self->_viewLayoutContext setArtworkRequestDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)SUUINavigationBarSectionController;
  [(SUUINavigationBarSectionController *)&v3 dealloc];
}

- (id)barButtonItemForElementIdentifier:(id)a3
{
  return 0;
}

- (UIView)view
{
  return 0;
}

- (id)viewForElementIdentifier:(id)a3
{
  return 0;
}

- (SUUIViewElementLayoutContext)viewLayoutContext
{
  viewLayoutContext = self->_viewLayoutContext;
  if (!viewLayoutContext)
  {
    v4 = objc_alloc_init(SUUIViewElementLayoutContext);
    v5 = self->_viewLayoutContext;
    self->_viewLayoutContext = v4;

    [(SUUIViewElementLayoutContext *)self->_viewLayoutContext setArtworkRequestDelegate:self];
    v6 = self->_viewLayoutContext;
    v7 = [(SUUINavigationBarContext *)self->_navigationBarContext clientContext];
    [(SUUIViewElementLayoutContext *)v6 setClientContext:v7];

    v8 = self->_viewLayoutContext;
    v9 = [(SUUINavigationBarContext *)self->_navigationBarContext parentViewController];
    [(SUUIViewElementLayoutContext *)v8 setParentViewController:v9];

    v10 = self->_viewLayoutContext;
    v11 = [(SUUINavigationBarContext *)self->_navigationBarContext resourceLoader];
    [(SUUIViewElementLayoutContext *)v10 setResourceLoader:v11];

    v12 = [SUUIViewElementTextLayoutCache alloc];
    v13 = [(SUUINavigationBarContext *)self->_navigationBarContext textLayoutCache];
    v14 = [(SUUIViewElementTextLayoutCache *)v12 initWithLayoutCache:v13];

    [(SUUIViewElementLayoutContext *)self->_viewLayoutContext setLabelLayoutCache:v14];
    viewLayoutContext = self->_viewLayoutContext;
  }
  return viewLayoutContext;
}

- (SUUINavigationBarContext)context
{
  return self->_navigationBarContext;
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewLayoutContext, 0);
  objc_storeStrong((id *)&self->_navigationBarContext, 0);
}

@end