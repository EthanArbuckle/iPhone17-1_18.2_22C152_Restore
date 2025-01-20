@interface SUUIDeferredActivityItemProvider
+ (id)placeholderItem;
- (SUUIClientContext)clientContext;
- (SUUIDeferredActivityItemProvider)initWithProductPageItem:(id)a3 clientContext:(id)a4;
- (SUUIDeferredActivityItemProvider)initWithProductPageItemProvider:(id)a3 clientContext:(id)a4;
- (SUUIDeferredActivityItemProvider)initWithProductPageItemProvider:(id)a3 clientContext:(id)a4 placeholderItem:(id)a5;
- (SUUIProductPageItem)productPageItem;
- (id)itemProvider;
- (void)setClientContext:(id)a3;
- (void)setItemProvider:(id)a3;
@end

@implementation SUUIDeferredActivityItemProvider

+ (id)placeholderItem
{
  return &stru_2704F8130;
}

- (SUUIDeferredActivityItemProvider)initWithProductPageItemProvider:(id)a3 clientContext:(id)a4 placeholderItem:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SUUIDeferredActivityItemProvider;
  v10 = [(UIActivityItemProvider *)&v14 initWithPlaceholderItem:a5];
  if (v10)
  {
    v11 = _Block_copy(v8);
    id itemProvider = v10->_itemProvider;
    v10->_id itemProvider = v11;

    objc_storeStrong((id *)&v10->_clientContext, a4);
  }

  return v10;
}

- (SUUIDeferredActivityItemProvider)initWithProductPageItem:(id)a3 clientContext:(id)a4
{
  id v6 = a3;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __74__SUUIDeferredActivityItemProvider_initWithProductPageItem_clientContext___block_invoke;
  v12[3] = &unk_265403268;
  id v13 = v6;
  id v7 = v6;
  id v8 = a4;
  id v9 = [(id)objc_opt_class() placeholderItem];
  v10 = [(SUUIDeferredActivityItemProvider *)self initWithProductPageItemProvider:v12 clientContext:v8 placeholderItem:v9];

  return v10;
}

id __74__SUUIDeferredActivityItemProvider_initWithProductPageItem_clientContext___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (SUUIDeferredActivityItemProvider)initWithProductPageItemProvider:(id)a3 clientContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(id)objc_opt_class() placeholderItem];
  id v9 = [(SUUIDeferredActivityItemProvider *)self initWithProductPageItemProvider:v7 clientContext:v6 placeholderItem:v8];

  return v9;
}

- (SUUIProductPageItem)productPageItem
{
  productPageItem = (void (**)(void *, SEL))self->_productPageItem;
  if (!productPageItem)
  {
    productPageItem = (void (**)(void *, SEL))self->_itemProvider;
    if (productPageItem)
    {
      productPageItem[2](productPageItem, a2);
      v4 = (SUUIProductPageItem *)objc_claimAutoreleasedReturnValue();
      v5 = self->_productPageItem;
      self->_productPageItem = v4;

      productPageItem = (void (**)(void *, SEL))self->_productPageItem;
    }
  }
  return (SUUIProductPageItem *)productPageItem;
}

- (SUUIClientContext)clientContext
{
  return (SUUIClientContext *)objc_getProperty(self, a2, 280, 1);
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

@end