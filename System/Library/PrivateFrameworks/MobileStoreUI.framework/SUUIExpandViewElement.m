@interface SUUIExpandViewElement
- (BOOL)isOpen;
- (BOOL)previousIsOpen;
- (SUUIExpandViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (id)applyUpdatesWithElement:(id)a3;
- (int64_t)pageComponentType;
- (void)setPreviousIsOpen:(BOOL)a3;
@end

@implementation SUUIExpandViewElement

- (SUUIExpandViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SUUIExpandViewElement;
  v9 = [(SUUIViewElement *)&v12 initWithDOMElement:v8 parent:a4 elementFactory:a5];
  if (v9)
  {
    v10 = [v8 getAttribute:@"open"];
    v9->_open = [v10 BOOLValue];

    v9->_previousIsOpen = v9->_open;
  }

  return v9;
}

- (id)applyUpdatesWithElement:(id)a3
{
  v4 = (SUUIExpandViewElement *)a3;
  v8.receiver = self;
  v8.super_class = (Class)SUUIExpandViewElement;
  v5 = [(SUUIViewElement *)&v8 applyUpdatesWithElement:v4];
  v6 = v5;
  if (v4 != self || [v5 updateType])
  {
    self->_previousIsOpen = self->_open;
    self->_open = [(SUUIExpandViewElement *)v4 isOpen];
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

@end