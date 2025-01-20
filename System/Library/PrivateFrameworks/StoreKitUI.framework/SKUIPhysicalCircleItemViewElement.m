@interface SKUIPhysicalCircleItemViewElement
- (NSString)itemIdentifier;
- (SKUIImageViewElement)imageElement;
- (SKUILabelViewElement)titleElement;
- (SKUIPhysicalCircleItemViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (id)applyUpdatesWithElement:(id)a3;
- (int64_t)circleSize;
@end

@implementation SKUIPhysicalCircleItemViewElement

- (SKUIPhysicalCircleItemViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIPhysicalCircleItemViewElement initWithDOMElement:parent:elementFactory:]();
  }
  v16.receiver = self;
  v16.super_class = (Class)SKUIPhysicalCircleItemViewElement;
  v11 = [(SKUIViewElement *)&v16 initWithDOMElement:v8 parent:v9 elementFactory:v10];
  if (v11)
  {
    v12 = [v8 getAttribute:@"size"];
    v11->_circleSize = [v12 integerValue];

    uint64_t v13 = [v8 getAttribute:@"data-content-id"];
    itemIdentifier = v11->_itemIdentifier;
    v11->_itemIdentifier = (NSString *)v13;
  }
  return v11;
}

- (SKUIImageViewElement)imageElement
{
  return (SKUIImageViewElement *)[(SKUIViewElement *)self firstChildForElementType:49];
}

- (SKUILabelViewElement)titleElement
{
  return (SKUILabelViewElement *)[(SKUIViewElement *)self firstChildForElementType:138];
}

- (id)applyUpdatesWithElement:(id)a3
{
  v4 = (SKUIPhysicalCircleItemViewElement *)a3;
  v10.receiver = self;
  v10.super_class = (Class)SKUIPhysicalCircleItemViewElement;
  v5 = [(SKUIViewElement *)&v10 applyUpdatesWithElement:v4];
  v6 = v5;
  if (v4 != self && v5 == self)
  {
    self->_circleSize = [(SKUIPhysicalCircleItemViewElement *)v4 circleSize];
    v7 = [(SKUIPhysicalCircleItemViewElement *)v4 itemIdentifier];
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

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIPhysicalCircleItemViewElement initWithDOMElement:parent:elementFactory:]";
}

@end