@interface SUUISubmitInputViewElement
- (NSString)label;
- (SUUISubmitInputViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
@end

@implementation SUUISubmitInputViewElement

- (SUUISubmitInputViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SUUISubmitInputViewElement;
  v9 = [(SUUIInputViewElement *)&v12 initWithDOMElement:v8 parent:a4 elementFactory:a5];
  if (v9)
  {
    v10 = [v8 getAttribute:@"value"];
    if (v10) {
      objc_storeStrong((id *)&v9->_label, v10);
    }
  }
  return v9;
}

- (NSString)label
{
  return self->_label;
}

- (void).cxx_destruct
{
}

@end