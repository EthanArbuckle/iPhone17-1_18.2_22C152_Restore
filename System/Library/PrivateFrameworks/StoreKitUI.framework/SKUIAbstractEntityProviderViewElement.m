@interface SKUIAbstractEntityProviderViewElement
- (NSArray)prefetchedProperties;
- (NSString)entityTypeString;
- (SKUIAbstractEntityProviderViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (SKUILimitListViewElement)limitListViewElement;
- (SKUIPredicateListViewElement)predicateListViewElement;
- (SKUISortDescriptorListViewElement)sortDescriptorListViewElement;
- (id)applyUpdatesWithElement:(id)a3;
@end

@implementation SKUIAbstractEntityProviderViewElement

- (SKUIAbstractEntityProviderViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIAbstractEntityProviderViewElement initWithDOMElement:parent:elementFactory:]();
  }
  v21.receiver = self;
  v21.super_class = (Class)SKUIAbstractEntityProviderViewElement;
  v11 = [(SKUIViewElement *)&v21 initWithDOMElement:v8 parent:v9 elementFactory:v10];
  if (v11)
  {
    v12 = [v8 getAttribute:@"entityType"];
    if ([v12 length])
    {
      uint64_t v13 = [v12 copy];
      entityTypeString = v11->_entityTypeString;
      v11->_entityTypeString = (NSString *)v13;
    }
    v15 = [v8 getAttribute:@"prefetchedProperties"];
    v16 = (void *)[v15 mutableCopy];

    objc_msgSend(v16, "replaceOccurrencesOfString:withString:options:range:", @" ", &stru_1F1C879E8, 1, 0, objc_msgSend(v16, "length"));
    if ([v16 length])
    {
      v17 = [v16 componentsSeparatedByString:@","];
    }
    else
    {
      v17 = 0;
    }
    if ([v17 count])
    {
      uint64_t v18 = [v17 copy];
      prefetchedProperties = v11->_prefetchedProperties;
      v11->_prefetchedProperties = (NSArray *)v18;
    }
  }

  return v11;
}

- (id)applyUpdatesWithElement:(id)a3
{
  v4 = (SKUIAbstractEntityProviderViewElement *)a3;
  v14.receiver = self;
  v14.super_class = (Class)SKUIAbstractEntityProviderViewElement;
  v5 = [(SKUIViewElement *)&v14 applyUpdatesWithElement:v4];
  v6 = v5;
  if (v4 != self && v5 == self)
  {
    v7 = [(SKUIAbstractEntityProviderViewElement *)v4 entityTypeString];
    id v8 = (NSString *)[v7 copy];
    entityTypeString = self->_entityTypeString;
    self->_entityTypeString = v8;

    id v10 = [(SKUIAbstractEntityProviderViewElement *)v4 prefetchedProperties];
    v11 = (NSArray *)[v10 copy];
    prefetchedProperties = self->_prefetchedProperties;
    self->_prefetchedProperties = v11;
  }

  return v6;
}

- (SKUILimitListViewElement)limitListViewElement
{
  return (SKUILimitListViewElement *)[(SKUIViewElement *)self firstChildForElementType:61];
}

- (SKUIPredicateListViewElement)predicateListViewElement
{
  return (SKUIPredicateListViewElement *)[(SKUIViewElement *)self firstChildForElementType:89];
}

- (SKUISortDescriptorListViewElement)sortDescriptorListViewElement
{
  return (SKUISortDescriptorListViewElement *)[(SKUIViewElement *)self firstChildForElementType:126];
}

- (NSString)entityTypeString
{
  return self->_entityTypeString;
}

- (NSArray)prefetchedProperties
{
  return self->_prefetchedProperties;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prefetchedProperties, 0);

  objc_storeStrong((id *)&self->_entityTypeString, 0);
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIAbstractEntityProviderViewElement initWithDOMElement:parent:elementFactory:]";
}

@end