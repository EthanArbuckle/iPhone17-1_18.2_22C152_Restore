@interface SKUICollectionListViewElement
- (SKUICollectionListViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (SKUISearchBarViewElement)searchHeader;
@end

@implementation SKUICollectionListViewElement

- (SKUICollectionListViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUICollectionListViewElement initWithDOMElement:parent:elementFactory:]();
  }
  v24.receiver = self;
  v24.super_class = (Class)SKUICollectionListViewElement;
  v11 = [(SKUIViewElement *)&v24 initWithDOMElement:v8 parent:v9 elementFactory:v10];
  v12 = v11;
  if (v11)
  {
    id v19 = v8;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v13 = [(SKUICollectionListViewElement *)v11 children];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v21;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v21 != v16) {
            objc_enumerationMutation(v13);
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            NSLog(&cfstr_OmgSearchInACo.isa);
          }
          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v15);
    }

    id v8 = v19;
  }

  return v12;
}

- (SKUISearchBarViewElement)searchHeader
{
  return self->_searchHeader;
}

- (void).cxx_destruct
{
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUICollectionListViewElement initWithDOMElement:parent:elementFactory:]";
}

@end