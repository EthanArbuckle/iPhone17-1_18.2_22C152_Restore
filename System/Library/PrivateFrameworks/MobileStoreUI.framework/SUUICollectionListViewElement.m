@interface SUUICollectionListViewElement
- (SUUICollectionListViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (SUUISearchBarViewElement)searchHeader;
@end

@implementation SUUICollectionListViewElement

- (SUUICollectionListViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v17.receiver = self;
  v17.super_class = (Class)SUUICollectionListViewElement;
  v5 = [(SUUIViewElement *)&v17 initWithDOMElement:a3 parent:a4 elementFactory:a5];
  v6 = v5;
  if (v5)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v14 = 0u;
    v7 = [(SUUICollectionListViewElement *)v5 children];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            NSLog(&cfstr_OmgSearchInACo.isa);
          }
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
      }
      while (v9);
    }
  }
  return v6;
}

- (SUUISearchBarViewElement)searchHeader
{
  return self->_searchHeader;
}

- (void).cxx_destruct
{
}

@end