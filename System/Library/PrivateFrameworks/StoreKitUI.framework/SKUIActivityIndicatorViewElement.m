@interface SKUIActivityIndicatorViewElement
- (BOOL)isDisabled;
- (SKUIActivityIndicatorViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (SKUIImageViewElement)image;
- (SKUILabelViewElement)text;
- (double)period;
- (int64_t)pageComponentType;
@end

@implementation SKUIActivityIndicatorViewElement

- (SKUIActivityIndicatorViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIActivityIndicatorViewElement initWithDOMElement:parent:elementFactory:]();
  }
  v16.receiver = self;
  v16.super_class = (Class)SKUIActivityIndicatorViewElement;
  v11 = [(SKUIViewElement *)&v16 initWithDOMElement:v8 parent:v9 elementFactory:v10];
  if (v11)
  {
    v12 = [v8 getAttribute:@"period"];
    v13 = v12;
    if (v12) {
      [v12 doubleValue];
    }
    else {
      double v14 = -1.0;
    }
    v11->_period = v14;
  }
  return v11;
}

- (SKUIImageViewElement)image
{
  return (SKUIImageViewElement *)[(SKUIViewElement *)self firstChildForElementType:49];
}

- (double)period
{
  return self->_period;
}

- (SKUILabelViewElement)text
{
  return (SKUILabelViewElement *)[(SKUIViewElement *)self firstChildForElementType:138];
}

- (BOOL)isDisabled
{
  return 1;
}

- (int64_t)pageComponentType
{
  return 24;
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIActivityIndicatorViewElement initWithDOMElement:parent:elementFactory:]";
}

@end