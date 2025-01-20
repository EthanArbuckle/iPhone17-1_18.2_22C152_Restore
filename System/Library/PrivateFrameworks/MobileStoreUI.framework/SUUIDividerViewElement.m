@interface SUUIDividerViewElement
- (BOOL)isEnabled;
- (SUUIButtonViewElement)button;
- (SUUIDividerViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (SUUIViewElementText)text;
- (int64_t)dividerType;
- (int64_t)pageComponentType;
@end

@implementation SUUIDividerViewElement

- (SUUIDividerViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SUUIDividerViewElement;
  v9 = [(SUUIViewElement *)&v14 initWithDOMElement:v8 parent:a4 elementFactory:a5];
  if (v9)
  {
    v10 = +[IKTextParser textWithDOMElement:v8 usingParseBlock:0];
    v11 = [v10 string];
    uint64_t v12 = [v11 length];

    if (v12) {
      objc_storeStrong((id *)&v9->_text, v10);
    }
  }
  return v9;
}

- (BOOL)isEnabled
{
  return self->_button != 0;
}

- (int64_t)pageComponentType
{
  return 4;
}

- (SUUIButtonViewElement)button
{
  return (SUUIButtonViewElement *)[(SUUIViewElement *)self firstChildForElementType:12];
}

- (int64_t)dividerType
{
  if (!self->_dividerTypeWasInitialized)
  {
    v3 = [(SUUIDividerViewElement *)self style];
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

- (SUUIViewElementText)text
{
  return self->_text;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_button, 0);
}

@end