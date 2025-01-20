@interface SKUIDeferredActivityItemProvider
+ (id)placeholderItem;
- (SKUIClientContext)clientContext;
- (SKUIDeferredActivityItemProvider)initWithProductPageItem:(id)a3 clientContext:(id)a4;
- (SKUIDeferredActivityItemProvider)initWithProductPageItemProvider:(id)a3 clientContext:(id)a4;
- (SKUIDeferredActivityItemProvider)initWithProductPageItemProvider:(id)a3 clientContext:(id)a4 placeholderItem:(id)a5;
- (SKUIProductPageItem)productPageItem;
- (id)itemProvider;
- (void)setClientContext:(id)a3;
- (void)setItemProvider:(id)a3;
@end

@implementation SKUIDeferredActivityItemProvider

+ (id)placeholderItem
{
  return &stru_1F1C879E8;
}

- (SKUIDeferredActivityItemProvider)initWithProductPageItemProvider:(id)a3 clientContext:(id)a4 placeholderItem:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIDeferredActivityItemProvider initWithProductPageItemProvider:clientContext:placeholderItem:]();
  }
  v15.receiver = self;
  v15.super_class = (Class)SKUIDeferredActivityItemProvider;
  v11 = [(UIActivityItemProvider *)&v15 initWithPlaceholderItem:v10];
  if (v11)
  {
    v12 = _Block_copy(v8);
    id itemProvider = v11->_itemProvider;
    v11->_id itemProvider = v12;

    objc_storeStrong((id *)&v11->_clientContext, a4);
  }

  return v11;
}

- (SKUIDeferredActivityItemProvider)initWithProductPageItem:(id)a3 clientContext:(id)a4
{
  id v6 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __74__SKUIDeferredActivityItemProvider_initWithProductPageItem_clientContext___block_invoke;
  v12[3] = &unk_1E6427D58;
  id v13 = v6;
  id v7 = v6;
  id v8 = a4;
  id v9 = [(id)objc_opt_class() placeholderItem];
  id v10 = [(SKUIDeferredActivityItemProvider *)self initWithProductPageItemProvider:v12 clientContext:v8 placeholderItem:v9];

  return v10;
}

id __74__SKUIDeferredActivityItemProvider_initWithProductPageItem_clientContext___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (SKUIDeferredActivityItemProvider)initWithProductPageItemProvider:(id)a3 clientContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(id)objc_opt_class() placeholderItem];
  id v9 = [(SKUIDeferredActivityItemProvider *)self initWithProductPageItemProvider:v7 clientContext:v6 placeholderItem:v8];

  return v9;
}

- (SKUIProductPageItem)productPageItem
{
  productPageItem = (void (**)(void *, SEL))self->_productPageItem;
  if (!productPageItem)
  {
    productPageItem = (void (**)(void *, SEL))self->_itemProvider;
    if (productPageItem)
    {
      productPageItem[2](productPageItem, a2);
      v4 = (SKUIProductPageItem *)objc_claimAutoreleasedReturnValue();
      v5 = self->_productPageItem;
      self->_productPageItem = v4;

      productPageItem = (void (**)(void *, SEL))self->_productPageItem;
    }
  }

  return (SKUIProductPageItem *)productPageItem;
}

- (SKUIClientContext)clientContext
{
  return (SKUIClientContext *)objc_getProperty(self, a2, 280, 1);
}

- (void)setClientContext:(id)a3
{
}

- (id)itemProvider
{
  return objc_getProperty(self, a2, 288, 1);
}

- (void)setItemProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_itemProvider, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);

  objc_storeStrong((id *)&self->_productPageItem, 0);
}

- (void)initWithProductPageItemProvider:clientContext:placeholderItem:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIDeferredActivityItemProvider initWithProductPageItemProvider:clientContext:placeholderItem:]";
}

@end