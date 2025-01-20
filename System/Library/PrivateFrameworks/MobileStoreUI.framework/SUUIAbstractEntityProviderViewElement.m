@interface SUUIAbstractEntityProviderViewElement
- (NSArray)prefetchedProperties;
- (NSString)entityTypeString;
- (SUUIAbstractEntityProviderViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (SUUILimitListViewElement)limitListViewElement;
- (SUUIPredicateListViewElement)predicateListViewElement;
- (SUUISortDescriptorListViewElement)sortDescriptorListViewElement;
- (id)applyUpdatesWithElement:(id)a3;
@end

@implementation SUUIAbstractEntityProviderViewElement

- (SUUIAbstractEntityProviderViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SUUIAbstractEntityProviderViewElement;
  v9 = [(SUUIViewElement *)&v19 initWithDOMElement:v8 parent:a4 elementFactory:a5];
  if (v9)
  {
    v10 = [v8 getAttribute:@"entityType"];
    if ([v10 length])
    {
      uint64_t v11 = [v10 copy];
      entityTypeString = v9->_entityTypeString;
      v9->_entityTypeString = (NSString *)v11;
    }
    v13 = [v8 getAttribute:@"prefetchedProperties"];
    v14 = (void *)[v13 mutableCopy];

    objc_msgSend(v14, "replaceOccurrencesOfString:withString:options:range:", @" ", &stru_2704F8130, 1, 0, objc_msgSend(v14, "length"));
    if ([v14 length])
    {
      v15 = [v14 componentsSeparatedByString:@","];
    }
    else
    {
      v15 = 0;
    }
    if ([v15 count])
    {
      uint64_t v16 = [v15 copy];
      prefetchedProperties = v9->_prefetchedProperties;
      v9->_prefetchedProperties = (NSArray *)v16;
    }
  }

  return v9;
}

- (id)applyUpdatesWithElement:(id)a3
{
  v4 = (SUUIAbstractEntityProviderViewElement *)a3;
  v14.receiver = self;
  v14.super_class = (Class)SUUIAbstractEntityProviderViewElement;
  v5 = [(SUUIViewElement *)&v14 applyUpdatesWithElement:v4];
  v6 = v5;
  if (v4 != self && v5 == self)
  {
    v7 = [(SUUIAbstractEntityProviderViewElement *)v4 entityTypeString];
    id v8 = (NSString *)[v7 copy];
    entityTypeString = self->_entityTypeString;
    self->_entityTypeString = v8;

    v10 = [(SUUIAbstractEntityProviderViewElement *)v4 prefetchedProperties];
    uint64_t v11 = (NSArray *)[v10 copy];
    prefetchedProperties = self->_prefetchedProperties;
    self->_prefetchedProperties = v11;
  }
  return v6;
}

- (SUUILimitListViewElement)limitListViewElement
{
  return (SUUILimitListViewElement *)[(SUUIViewElement *)self firstChildForElementType:61];
}

- (SUUIPredicateListViewElement)predicateListViewElement
{
  return (SUUIPredicateListViewElement *)[(SUUIViewElement *)self firstChildForElementType:89];
}

- (SUUISortDescriptorListViewElement)sortDescriptorListViewElement
{
  return (SUUISortDescriptorListViewElement *)[(SUUIViewElement *)self firstChildForElementType:126];
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

@end