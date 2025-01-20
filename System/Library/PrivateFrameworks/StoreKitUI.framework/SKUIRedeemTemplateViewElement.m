@interface SKUIRedeemTemplateViewElement
- (NSString)initialCode;
- (SKUIRedeemTemplateViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (id)applyUpdatesWithElement:(id)a3;
@end

@implementation SKUIRedeemTemplateViewElement

- (SKUIRedeemTemplateViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIRedeemTemplateViewElement initWithDOMElement:parent:elementFactory:]();
  }
  v15.receiver = self;
  v15.super_class = (Class)SKUIRedeemTemplateViewElement;
  v11 = [(SKUIViewElement *)&v15 initWithDOMElement:v8 parent:v9 elementFactory:v10];
  if (v11)
  {
    uint64_t v12 = [v8 getAttribute:@"code"];
    initialCode = v11->_initialCode;
    v11->_initialCode = (NSString *)v12;
  }
  return v11;
}

- (id)applyUpdatesWithElement:(id)a3
{
  v4 = (SKUIRedeemTemplateViewElement *)a3;
  v10.receiver = self;
  v10.super_class = (Class)SKUIRedeemTemplateViewElement;
  v5 = [(SKUIViewElement *)&v10 applyUpdatesWithElement:v4];
  v6 = v5;
  if (v4 != self || [v5 updateType])
  {
    v7 = [(SKUIRedeemTemplateViewElement *)v4 initialCode];
    initialCode = self->_initialCode;
    self->_initialCode = v7;
  }

  return v6;
}

- (NSString)initialCode
{
  return self->_initialCode;
}

- (void).cxx_destruct
{
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIRedeemTemplateViewElement initWithDOMElement:parent:elementFactory:]";
}

@end