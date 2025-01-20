@interface SKUIProgressIndicatorViewElement
- (SKUIProgressIndicatorViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (float)value;
- (id)applyUpdatesWithElement:(id)a3;
@end

@implementation SKUIProgressIndicatorViewElement

- (SKUIProgressIndicatorViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIProgressIndicatorViewElement initWithDOMElement:parent:elementFactory:]();
  }
  v15.receiver = self;
  v15.super_class = (Class)SKUIProgressIndicatorViewElement;
  v11 = [(SKUIViewElement *)&v15 initWithDOMElement:v8 parent:v9 elementFactory:v10];
  if (v11)
  {
    v12 = [v8 getAttribute:@"value"];
    [v12 floatValue];
    v11->_value = v13;
  }
  return v11;
}

- (id)applyUpdatesWithElement:(id)a3
{
  v4 = (SKUIProgressIndicatorViewElement *)a3;
  v9.receiver = self;
  v9.super_class = (Class)SKUIProgressIndicatorViewElement;
  v5 = [(SKUIViewElement *)&v9 applyUpdatesWithElement:v4];
  v6 = v5;
  if (v4 != self && v5 == self)
  {
    [(SKUIProgressIndicatorViewElement *)v4 value];
    self->_value = v7;
  }

  return v6;
}

- (float)value
{
  return self->_value;
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIProgressIndicatorViewElement initWithDOMElement:parent:elementFactory:]";
}

@end