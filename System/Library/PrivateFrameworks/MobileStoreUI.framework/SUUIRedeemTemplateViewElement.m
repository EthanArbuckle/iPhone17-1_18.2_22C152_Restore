@interface SUUIRedeemTemplateViewElement
- (NSString)initialCode;
- (SUUIRedeemTemplateViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (id)applyUpdatesWithElement:(id)a3;
@end

@implementation SUUIRedeemTemplateViewElement

- (SUUIRedeemTemplateViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SUUIRedeemTemplateViewElement;
  v9 = [(SUUIViewElement *)&v13 initWithDOMElement:v8 parent:a4 elementFactory:a5];
  if (v9)
  {
    uint64_t v10 = [v8 getAttribute:@"code"];
    initialCode = v9->_initialCode;
    v9->_initialCode = (NSString *)v10;
  }
  return v9;
}

- (id)applyUpdatesWithElement:(id)a3
{
  v4 = (SUUIRedeemTemplateViewElement *)a3;
  v10.receiver = self;
  v10.super_class = (Class)SUUIRedeemTemplateViewElement;
  v5 = [(SUUIViewElement *)&v10 applyUpdatesWithElement:v4];
  v6 = v5;
  if (v4 != self || [v5 updateType])
  {
    v7 = [(SUUIRedeemTemplateViewElement *)v4 initialCode];
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

@end