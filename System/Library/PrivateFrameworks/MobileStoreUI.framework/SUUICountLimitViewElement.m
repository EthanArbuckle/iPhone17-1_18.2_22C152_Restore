@interface SUUICountLimitViewElement
+ (BOOL)shouldParseChildDOMElements;
- (NSString)entityTypeString;
- (SUUICountLimitViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (id)applyUpdatesWithElement:(id)a3;
- (int64_t)limitValue;
@end

@implementation SUUICountLimitViewElement

- (SUUICountLimitViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SUUICountLimitViewElement;
  v9 = [(SUUIViewElement *)&v15 initWithDOMElement:v8 parent:a4 elementFactory:a5];
  if (v9)
  {
    v10 = [v8 getAttribute:@"value"];
    v9->_limitValue = [v10 integerValue];

    v11 = [v8 getAttribute:@"entityType"];
    if ([v11 length])
    {
      uint64_t v12 = [v11 copy];
      entityTypeString = v9->_entityTypeString;
      v9->_entityTypeString = (NSString *)v12;
    }
  }

  return v9;
}

+ (BOOL)shouldParseChildDOMElements
{
  return 0;
}

- (id)applyUpdatesWithElement:(id)a3
{
  v4 = (SUUICountLimitViewElement *)a3;
  v11.receiver = self;
  v11.super_class = (Class)SUUICountLimitViewElement;
  v5 = [(SUUIViewElement *)&v11 applyUpdatesWithElement:v4];
  v6 = v5;
  if (v4 != self && v5 == self)
  {
    self->_limitValue = [(SUUICountLimitViewElement *)v4 limitValue];
    v7 = [(SUUICountLimitViewElement *)v4 entityTypeString];
    id v8 = (NSString *)[v7 copy];
    entityTypeString = self->_entityTypeString;
    self->_entityTypeString = v8;
  }
  return v6;
}

- (int64_t)limitValue
{
  return self->_limitValue;
}

- (NSString)entityTypeString
{
  return self->_entityTypeString;
}

- (void).cxx_destruct
{
}

@end