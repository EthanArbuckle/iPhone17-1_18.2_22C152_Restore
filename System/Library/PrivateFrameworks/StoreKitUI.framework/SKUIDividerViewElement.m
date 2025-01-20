@interface SKUIDividerViewElement
- (BOOL)isEnabled;
- (SKUIButtonViewElement)button;
- (SKUIDividerViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (SKUIViewElementText)text;
- (int64_t)dividerType;
- (int64_t)pageComponentType;
@end

@implementation SKUIDividerViewElement

- (SKUIDividerViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIDividerViewElement initWithDOMElement:parent:elementFactory:]();
  }
  v16.receiver = self;
  v16.super_class = (Class)SKUIDividerViewElement;
  v11 = [(SKUIViewElement *)&v16 initWithDOMElement:v8 parent:v9 elementFactory:v10];
  if (v11)
  {
    v12 = +[IKTextParser textWithDOMElement:v8 usingParseBlock:0];
    v13 = [v12 string];
    uint64_t v14 = [v13 length];

    if (v14) {
      objc_storeStrong((id *)&v11->_text, v12);
    }
  }
  return v11;
}

- (BOOL)isEnabled
{
  return self->_button != 0;
}

- (int64_t)pageComponentType
{
  return 4;
}

- (SKUIButtonViewElement)button
{
  return (SKUIButtonViewElement *)[(SKUIViewElement *)self firstChildForElementType:12];
}

- (int64_t)dividerType
{
  if (!self->_dividerTypeWasInitialized)
  {
    v3 = [(SKUIDividerViewElement *)self style];
    v4 = [v3 dividerType];

    if (v4)
    {
      if ([@"full" isEqualToString:v4])
      {
        int64_t v5 = 1;
LABEL_10:
        self->_dividerType = v5;
        self->_dividerTypeWasInitialized = 1;

        return self->_dividerType;
      }
      if ([@"inset" isEqualToString:v4])
      {
        int64_t v5 = 2;
        goto LABEL_10;
      }
      if ([@"borderless" isEqualToString:v4])
      {
        int64_t v5 = 3;
        goto LABEL_10;
      }
    }
    int64_t v5 = 0;
    goto LABEL_10;
  }
  return self->_dividerType;
}

- (SKUIViewElementText)text
{
  return self->_text;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);

  objc_storeStrong((id *)&self->_button, 0);
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIDividerViewElement initWithDOMElement:parent:elementFactory:]";
}

@end