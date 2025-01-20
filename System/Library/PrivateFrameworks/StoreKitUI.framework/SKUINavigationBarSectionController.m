@interface SKUINavigationBarSectionController
- (SKUINavigationBarContext)context;
- (SKUIViewElementLayoutContext)viewLayoutContext;
- (UIView)view;
- (id)barButtonItemForElementIdentifier:(id)a3;
- (id)viewForElementIdentifier:(id)a3;
- (void)artworkRequest:(id)a3 didLoadImage:(id)a4;
- (void)dealloc;
- (void)reloadAfterDocumentUpdateWithNavigationItem:(id)a3;
- (void)setContext:(id)a3;
- (void)view;
- (void)viewLayoutContext;
@end

@implementation SKUINavigationBarSectionController

- (void)dealloc
{
  [(SKUIViewElementLayoutContext *)self->_viewLayoutContext setArtworkRequestDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)SKUINavigationBarSectionController;
  [(SKUINavigationBarSectionController *)&v3 dealloc];
}

- (id)barButtonItemForElementIdentifier:(id)a3
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        -[SKUINavigationBarSectionController barButtonItemForElementIdentifier:](v3, v4, v5, v6, v7, v8, v9, v10);
      }
    }
  }
  return 0;
}

- (void)reloadAfterDocumentUpdateWithNavigationItem:(id)a3
{
  if (os_variant_has_internal_content() && _os_feature_enabled_impl())
  {
    BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
    if (v3) {
      -[SKUINavigationBarSectionController reloadAfterDocumentUpdateWithNavigationItem:](v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

- (UIView)view
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v2) {
        [(SKUINavigationBarSectionController *)v2 view];
      }
    }
  }
  return 0;
}

- (id)viewForElementIdentifier:(id)a3
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        -[SKUINavigationBarSectionController viewForElementIdentifier:](v3, v4, v5, v6, v7, v8, v9, v10);
      }
    }
  }
  return 0;
}

- (SKUIViewElementLayoutContext)viewLayoutContext
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUINavigationBarSectionController viewLayoutContext]();
  }
  viewLayoutContext = self->_viewLayoutContext;
  if (!viewLayoutContext)
  {
    uint64_t v4 = objc_alloc_init(SKUIViewElementLayoutContext);
    uint64_t v5 = self->_viewLayoutContext;
    self->_viewLayoutContext = v4;

    [(SKUIViewElementLayoutContext *)self->_viewLayoutContext setArtworkRequestDelegate:self];
    uint64_t v6 = self->_viewLayoutContext;
    uint64_t v7 = [(SKUINavigationBarContext *)self->_navigationBarContext clientContext];
    [(SKUIViewElementLayoutContext *)v6 setClientContext:v7];

    uint64_t v8 = self->_viewLayoutContext;
    uint64_t v9 = [(SKUINavigationBarContext *)self->_navigationBarContext parentViewController];
    [(SKUIViewElementLayoutContext *)v8 setParentViewController:v9];

    uint64_t v10 = self->_viewLayoutContext;
    v11 = [(SKUINavigationBarContext *)self->_navigationBarContext resourceLoader];
    [(SKUIViewElementLayoutContext *)v10 setResourceLoader:v11];

    v12 = [SKUIViewElementTextLayoutCache alloc];
    v13 = [(SKUINavigationBarContext *)self->_navigationBarContext textLayoutCache];
    v14 = [(SKUIViewElementTextLayoutCache *)v12 initWithLayoutCache:v13];

    [(SKUIViewElementLayoutContext *)self->_viewLayoutContext setLabelLayoutCache:v14];
    viewLayoutContext = self->_viewLayoutContext;
  }

  return viewLayoutContext;
}

- (void)artworkRequest:(id)a3 didLoadImage:(id)a4
{
  if (os_variant_has_internal_content() && _os_feature_enabled_impl())
  {
    BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
    if (v4) {
      -[SKUINavigationBarSectionController artworkRequest:didLoadImage:](v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
}

- (SKUINavigationBarContext)context
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

- (void)barButtonItemForElementIdentifier:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)reloadAfterDocumentUpdateWithNavigationItem:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)view
{
}

- (void)viewForElementIdentifier:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)viewLayoutContext
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUINavigationBarSectionController viewLayoutContext]";
}

- (void)artworkRequest:(uint64_t)a3 didLoadImage:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end