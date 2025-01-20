@interface SKUIOrdinalViewElement
- (SKUIOrdinalViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (SKUIViewElementText)text;
- (id)applyUpdatesWithElement:(id)a3;
@end

@implementation SKUIOrdinalViewElement

- (SKUIOrdinalViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIOrdinalViewElement initWithDOMElement:parent:elementFactory:]();
  }
  v15.receiver = self;
  v15.super_class = (Class)SKUIOrdinalViewElement;
  v11 = [(SKUIViewElement *)&v15 initWithDOMElement:v8 parent:v9 elementFactory:v10];
  if (v11)
  {
    uint64_t v12 = +[IKTextParser textWithDOMElement:v8 usingParseBlock:0];
    text = v11->_text;
    v11->_text = (SKUIViewElementText *)v12;
  }
  return v11;
}

- (id)applyUpdatesWithElement:(id)a3
{
  v4 = (SKUIOrdinalViewElement *)a3;
  v10.receiver = self;
  v10.super_class = (Class)SKUIOrdinalViewElement;
  v5 = [(SKUIViewElement *)&v10 applyUpdatesWithElement:v4];
  v6 = v5;
  if (v4 != self || [v5 updateType])
  {
    v7 = [(SKUIOrdinalViewElement *)v4 text];
    text = self->_text;
    self->_text = v7;
  }

  return v6;
}

- (SKUIViewElementText)text
{
  return self->_text;
}

- (void).cxx_destruct
{
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIOrdinalViewElement initWithDOMElement:parent:elementFactory:]";
}

@end