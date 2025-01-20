@interface SKUIImageGridViewElement
- (CGSize)size;
- (SKUIImageGridViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (UIEdgeInsets)contentInset;
- (int64_t)columnCount;
@end

@implementation SKUIImageGridViewElement

- (SKUIImageGridViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIImageGridViewElement initWithDOMElement:parent:elementFactory:]();
  }
  v17.receiver = self;
  v17.super_class = (Class)SKUIImageGridViewElement;
  v11 = [(SKUIViewElement *)&v17 initWithDOMElement:v8 parent:v9 elementFactory:v10];
  if (v11)
  {
    v12 = [v8 getAttribute:@"height"];
    v13 = [v8 getAttribute:@"width"];
    if ([v12 length] && objc_msgSend(v13, "length"))
    {
      [v12 doubleValue];
      v11->_size.height = v14;
      [v13 doubleValue];
      v11->_size.width = v15;
    }
  }
  return v11;
}

- (int64_t)columnCount
{
  v2 = [(SKUIImageGridViewElement *)self style];
  int64_t v3 = [v2 columnCount];

  if (v3 <= 1) {
    return 1;
  }
  else {
    return v3;
  }
}

- (UIEdgeInsets)contentInset
{
  v2 = [(SKUIImageGridViewElement *)self style];
  [v2 elementPadding];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIImageGridViewElement initWithDOMElement:parent:elementFactory:]";
}

@end