@interface SUUIEntityProviderListViewElement
- (SUUIEntityProviderListViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (id)entityProviderWithIdentifier:(id)a3;
@end

@implementation SUUIEntityProviderListViewElement

- (SUUIEntityProviderListViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v21.receiver = self;
  v21.super_class = (Class)SUUIEntityProviderListViewElement;
  v5 = [(SUUIViewElement *)&v21 initWithDOMElement:a3 parent:a4 elementFactory:a5];
  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v7 = [(SUUIEntityProviderListViewElement *)v5 children];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          v13 = [v12 elementID];
          if ([v13 length] && objc_msgSend(v12, "conformsToProtocol:", &unk_2706A7800)) {
            [v6 setObject:v12 forKey:v13];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v9);
    }

    uint64_t v14 = [v6 copy];
    entityProviders = v5->_entityProviders;
    v5->_entityProviders = (NSDictionary *)v14;
  }
  return v5;
}

- (id)entityProviderWithIdentifier:(id)a3
{
  return [(NSDictionary *)self->_entityProviders objectForKey:a3];
}

- (void).cxx_destruct
{
}

@end