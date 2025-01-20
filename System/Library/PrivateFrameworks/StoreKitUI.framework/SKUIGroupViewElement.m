@interface SKUIGroupViewElement
- (NSString)type;
- (SKUIGroupViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
@end

@implementation SKUIGroupViewElement

- (SKUIGroupViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIGroupViewElement initWithDOMElement:parent:elementFactory:]();
  }
  v15.receiver = self;
  v15.super_class = (Class)SKUIGroupViewElement;
  v11 = [(SKUIViewElement *)&v15 initWithDOMElement:v8 parent:v9 elementFactory:v10];
  if (v11)
  {
    uint64_t v12 = [v8 getAttribute:@"type"];
    type = v11->_type;
    v11->_type = (NSString *)v12;
  }
  return v11;
}

- (NSString)type
{
  return self->_type;
}

- (void).cxx_destruct
{
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIGroupViewElement initWithDOMElement:parent:elementFactory:]";
}

@end