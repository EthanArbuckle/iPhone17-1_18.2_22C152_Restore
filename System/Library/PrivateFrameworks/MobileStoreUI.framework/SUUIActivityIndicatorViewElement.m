@interface SUUIActivityIndicatorViewElement
- (BOOL)isDisabled;
- (SUUIActivityIndicatorViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (SUUIImageViewElement)image;
- (SUUILabelViewElement)text;
- (double)period;
- (int64_t)pageComponentType;
@end

@implementation SUUIActivityIndicatorViewElement

- (SUUIActivityIndicatorViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SUUIActivityIndicatorViewElement;
  v9 = [(SUUIViewElement *)&v14 initWithDOMElement:v8 parent:a4 elementFactory:a5];
  if (v9)
  {
    v10 = [v8 getAttribute:@"period"];
    v11 = v10;
    if (v10) {
      [v10 doubleValue];
    }
    else {
      double v12 = -1.0;
    }
    v9->_period = v12;
  }
  return v9;
}

- (SUUIImageViewElement)image
{
  return (SUUIImageViewElement *)[(SUUIViewElement *)self firstChildForElementType:49];
}

- (double)period
{
  return self->_period;
}

- (SUUILabelViewElement)text
{
  return (SUUILabelViewElement *)[(SUUIViewElement *)self firstChildForElementType:138];
}

- (BOOL)isDisabled
{
  return 1;
}

- (int64_t)pageComponentType
{
  return 24;
}

@end