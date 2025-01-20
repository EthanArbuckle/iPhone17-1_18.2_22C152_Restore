@interface SKUIEntityProviderListViewElement
- (SKUIEntityProviderListViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (id)entityProviderWithIdentifier:(id)a3;
@end

@implementation SKUIEntityProviderListViewElement

- (SKUIEntityProviderListViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIEntityProviderListViewElement initWithDOMElement:parent:elementFactory:]();
  }
  v29.receiver = self;
  v29.super_class = (Class)SKUIEntityProviderListViewElement;
  v11 = [(SKUIViewElement *)&v29 initWithDOMElement:v8 parent:v9 elementFactory:v10];
  if (v11)
  {
    id v23 = v9;
    id v24 = v8;
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v13 = [(SKUIEntityProviderListViewElement *)v11 children];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v26 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          v19 = objc_msgSend(v18, "elementID", v23, v24);
          if ([v19 length] && objc_msgSend(v18, "conformsToProtocol:", &unk_1F1E3B988)) {
            [v12 setObject:v18 forKey:v19];
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v15);
    }

    uint64_t v20 = [v12 copy];
    entityProviders = v11->_entityProviders;
    v11->_entityProviders = (NSDictionary *)v20;

    id v9 = v23;
    id v8 = v24;
  }

  return v11;
}

- (id)entityProviderWithIdentifier:(id)a3
{
  return [(NSDictionary *)self->_entityProviders objectForKey:a3];
}

- (void).cxx_destruct
{
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIEntityProviderListViewElement initWithDOMElement:parent:elementFactory:]";
}

@end