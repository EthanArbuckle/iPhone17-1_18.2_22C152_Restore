@interface SUUIPhysicalCircleItemViewElement
- (NSString)itemIdentifier;
- (SUUIImageViewElement)imageElement;
- (SUUILabelViewElement)titleElement;
- (SUUIPhysicalCircleItemViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (id)applyUpdatesWithElement:(id)a3;
- (int64_t)circleSize;
@end

@implementation SUUIPhysicalCircleItemViewElement

- (SUUIPhysicalCircleItemViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SUUIPhysicalCircleItemViewElement;
  v9 = [(SUUIViewElement *)&v14 initWithDOMElement:v8 parent:a4 elementFactory:a5];
  if (v9)
  {
    v10 = [v8 getAttribute:@"size"];
    v9->_circleSize = [v10 integerValue];

    uint64_t v11 = [v8 getAttribute:@"data-content-id"];
    itemIdentifier = v9->_itemIdentifier;
    v9->_itemIdentifier = (NSString *)v11;
  }
  return v9;
}

- (SUUIImageViewElement)imageElement
{
  return (SUUIImageViewElement *)[(SUUIViewElement *)self firstChildForElementType:49];
}

- (SUUILabelViewElement)titleElement
{
  return (SUUILabelViewElement *)[(SUUIViewElement *)self firstChildForElementType:138];
}

- (id)applyUpdatesWithElement:(id)a3
{
  v4 = (SUUIPhysicalCircleItemViewElement *)a3;
  v10.receiver = self;
  v10.super_class = (Class)SUUIPhysicalCircleItemViewElement;
  v5 = [(SUUIViewElement *)&v10 applyUpdatesWithElement:v4];
  v6 = v5;
  if (v4 != self && v5 == self)
  {
    self->_circleSize = [(SUUIPhysicalCircleItemViewElement *)v4 circleSize];
    v7 = [(SUUIPhysicalCircleItemViewElement *)v4 itemIdentifier];
    itemIdentifier = self->_itemIdentifier;
    self->_itemIdentifier = v7;
  }
  return v6;
}

- (int64_t)circleSize
{
  return self->_circleSize;
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void).cxx_destruct
{
}

@end