@interface SKUISortDescriptorViewElement
+ (BOOL)shouldParseChildDOMElements;
- (BOOL)isAscending;
- (NSString)property;
- (SKUISortDescriptorViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (id)applyUpdatesWithElement:(id)a3;
@end

@implementation SKUISortDescriptorViewElement

- (SKUISortDescriptorViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUISortDescriptorViewElement initWithDOMElement:parent:elementFactory:]();
  }
  v16.receiver = self;
  v16.super_class = (Class)SKUISortDescriptorViewElement;
  v11 = [(SKUIViewElement *)&v16 initWithDOMElement:v8 parent:v9 elementFactory:v10];
  if (v11)
  {
    v12 = [v8 getAttribute:@"direction"];
    if ([v12 length]) {
      int v13 = [v12 isEqualToString:@"descending"] ^ 1;
    }
    else {
      LOBYTE(v13) = 1;
    }
    v11->_ascending = v13;
    v14 = [v8 getAttribute:@"property"];
    if ([v14 length]) {
      objc_storeStrong((id *)&v11->_property, v14);
    }
  }
  return v11;
}

+ (BOOL)shouldParseChildDOMElements
{
  return 0;
}

- (id)applyUpdatesWithElement:(id)a3
{
  v4 = (SKUISortDescriptorViewElement *)a3;
  v10.receiver = self;
  v10.super_class = (Class)SKUISortDescriptorViewElement;
  v5 = [(SKUIViewElement *)&v10 applyUpdatesWithElement:v4];
  v6 = v5;
  if (v4 != self && v5 == self)
  {
    self->_ascending = [(SKUISortDescriptorViewElement *)v4 isAscending];
    v7 = [(SKUISortDescriptorViewElement *)v4 property];
    property = self->_property;
    self->_property = v7;
  }

  return v6;
}

- (BOOL)isAscending
{
  return self->_ascending;
}

- (NSString)property
{
  return self->_property;
}

- (void).cxx_destruct
{
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUISortDescriptorViewElement initWithDOMElement:parent:elementFactory:]";
}

@end