@interface SKUICountLimitViewElement
+ (BOOL)shouldParseChildDOMElements;
- (NSString)entityTypeString;
- (SKUICountLimitViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (id)applyUpdatesWithElement:(id)a3;
- (int64_t)limitValue;
@end

@implementation SKUICountLimitViewElement

- (SKUICountLimitViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUICountLimitViewElement initWithDOMElement:parent:elementFactory:]();
  }
  v17.receiver = self;
  v17.super_class = (Class)SKUICountLimitViewElement;
  v11 = [(SKUIViewElement *)&v17 initWithDOMElement:v8 parent:v9 elementFactory:v10];
  if (v11)
  {
    v12 = [v8 getAttribute:@"value"];
    v11->_limitValue = [v12 integerValue];

    v13 = [v8 getAttribute:@"entityType"];
    if ([v13 length])
    {
      uint64_t v14 = [v13 copy];
      entityTypeString = v11->_entityTypeString;
      v11->_entityTypeString = (NSString *)v14;
    }
  }

  return v11;
}

+ (BOOL)shouldParseChildDOMElements
{
  return 0;
}

- (id)applyUpdatesWithElement:(id)a3
{
  v4 = (SKUICountLimitViewElement *)a3;
  v11.receiver = self;
  v11.super_class = (Class)SKUICountLimitViewElement;
  v5 = [(SKUIViewElement *)&v11 applyUpdatesWithElement:v4];
  v6 = v5;
  if (v4 != self && v5 == self)
  {
    self->_limitValue = [(SKUICountLimitViewElement *)v4 limitValue];
    v7 = [(SKUICountLimitViewElement *)v4 entityTypeString];
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

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUICountLimitViewElement initWithDOMElement:parent:elementFactory:]";
}

@end