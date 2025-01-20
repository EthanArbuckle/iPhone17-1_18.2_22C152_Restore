@interface SUUIDynamicShelfViewElement
- (BOOL)isDynamicContainer;
- (SUUIViewElement)cellTemplateViewElement;
- (id)applyUpdatesWithElement:(id)a3;
- (void)setShelfItemViewElementValidator:(id)a3;
@end

@implementation SUUIDynamicShelfViewElement

- (SUUIViewElement)cellTemplateViewElement
{
  cellTemplateViewElement = self->_cellTemplateViewElement;
  if (!cellTemplateViewElement)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __54__SUUIDynamicShelfViewElement_cellTemplateViewElement__block_invoke;
    v5[3] = &unk_2654008B8;
    v5[4] = self;
    [(SUUIShelfViewElement *)self enumerateChildrenUsingBlock:v5];
    cellTemplateViewElement = self->_cellTemplateViewElement;
  }
  return cellTemplateViewElement;
}

void __54__SUUIDynamicShelfViewElement_cellTemplateViewElement__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  *a3 = 1;
}

- (id)applyUpdatesWithElement:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SUUIDynamicShelfViewElement;
  v4 = (SUUIDynamicShelfViewElement *)a3;
  v5 = [(SUUIShelfViewElement *)&v8 applyUpdatesWithElement:v4];

  if (v4 != self || objc_msgSend(v5, "updateType", v8.receiver, v8.super_class))
  {
    cellTemplateViewElement = self->_cellTemplateViewElement;
    self->_cellTemplateViewElement = 0;
  }
  return v5;
}

- (BOOL)isDynamicContainer
{
  return 1;
}

- (void)setShelfItemViewElementValidator:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SUUIDynamicShelfViewElement;
  [(SUUIShelfViewElement *)&v5 setShelfItemViewElementValidator:a3];
  cellTemplateViewElement = self->_cellTemplateViewElement;
  self->_cellTemplateViewElement = 0;
}

- (void).cxx_destruct
{
}

@end