@interface SKUISubmitInputViewElement
- (NSString)label;
- (SKUISubmitInputViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
@end

@implementation SKUISubmitInputViewElement

- (SKUISubmitInputViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUISubmitInputViewElement initWithDOMElement:parent:elementFactory:]();
  }
  v14.receiver = self;
  v14.super_class = (Class)SKUISubmitInputViewElement;
  v11 = [(SKUIInputViewElement *)&v14 initWithDOMElement:v8 parent:v9 elementFactory:v10];
  if (v11)
  {
    v12 = [v8 getAttribute:@"value"];
    if (v12) {
      objc_storeStrong((id *)&v11->_label, v12);
    }
  }
  return v11;
}

- (NSString)label
{
  return self->_label;
}

- (void).cxx_destruct
{
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUISubmitInputViewElement initWithDOMElement:parent:elementFactory:]";
}

@end