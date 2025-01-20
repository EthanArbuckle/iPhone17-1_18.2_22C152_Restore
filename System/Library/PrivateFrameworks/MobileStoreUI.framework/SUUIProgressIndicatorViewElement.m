@interface SUUIProgressIndicatorViewElement
- (SUUIProgressIndicatorViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (float)value;
- (id)applyUpdatesWithElement:(id)a3;
@end

@implementation SUUIProgressIndicatorViewElement

- (SUUIProgressIndicatorViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SUUIProgressIndicatorViewElement;
  v9 = [(SUUIViewElement *)&v13 initWithDOMElement:v8 parent:a4 elementFactory:a5];
  if (v9)
  {
    v10 = [v8 getAttribute:@"value"];
    [v10 floatValue];
    v9->_value = v11;
  }
  return v9;
}

- (id)applyUpdatesWithElement:(id)a3
{
  v4 = (SUUIProgressIndicatorViewElement *)a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUIProgressIndicatorViewElement;
  v5 = [(SUUIViewElement *)&v9 applyUpdatesWithElement:v4];
  v6 = v5;
  if (v4 != self && v5 == self)
  {
    [(SUUIProgressIndicatorViewElement *)v4 value];
    self->_value = v7;
  }

  return v6;
}

- (float)value
{
  return self->_value;
}

@end