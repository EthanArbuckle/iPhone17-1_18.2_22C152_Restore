@interface SKUIExpandViewElement
- (BOOL)isOpen;
- (BOOL)previousIsOpen;
- (SKUIExpandViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (id)applyUpdatesWithElement:(id)a3;
- (int64_t)pageComponentType;
- (void)setPreviousIsOpen:(BOOL)a3;
@end

@implementation SKUIExpandViewElement

- (SKUIExpandViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIExpandViewElement initWithDOMElement:parent:elementFactory:]();
  }
  v14.receiver = self;
  v14.super_class = (Class)SKUIExpandViewElement;
  v11 = [(SKUIViewElement *)&v14 initWithDOMElement:v8 parent:v9 elementFactory:v10];
  if (v11)
  {
    v12 = [v8 getAttribute:@"open"];
    v11->_open = [v12 BOOLValue];

    v11->_previousIsOpen = v11->_open;
  }

  return v11;
}

- (id)applyUpdatesWithElement:(id)a3
{
  v4 = (SKUIExpandViewElement *)a3;
  v8.receiver = self;
  v8.super_class = (Class)SKUIExpandViewElement;
  v5 = [(SKUIViewElement *)&v8 applyUpdatesWithElement:v4];
  v6 = v5;
  if (v4 != self || [v5 updateType])
  {
    self->_previousIsOpen = self->_open;
    self->_open = [(SKUIExpandViewElement *)v4 isOpen];
  }
  [v6 setPreviousIsOpen:self->_previousIsOpen];

  return v6;
}

- (int64_t)pageComponentType
{
  return 19;
}

- (BOOL)isOpen
{
  return self->_open;
}

- (BOOL)previousIsOpen
{
  return self->_previousIsOpen;
}

- (void)setPreviousIsOpen:(BOOL)a3
{
  self->_previousIsOpen = a3;
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIExpandViewElement initWithDOMElement:parent:elementFactory:]";
}

@end