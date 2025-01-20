@interface SUUIGroupViewElement
- (NSString)type;
- (SUUIGroupViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
@end

@implementation SUUIGroupViewElement

- (SUUIGroupViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SUUIGroupViewElement;
  v9 = [(SUUIViewElement *)&v13 initWithDOMElement:v8 parent:a4 elementFactory:a5];
  if (v9)
  {
    uint64_t v10 = [v8 getAttribute:@"type"];
    type = v9->_type;
    v9->_type = (NSString *)v10;
  }
  return v9;
}

- (NSString)type
{
  return self->_type;
}

- (void).cxx_destruct
{
}

@end