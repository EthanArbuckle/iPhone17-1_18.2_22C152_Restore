@interface SUUIDynamicShelfMenuBarViewElement
- (BOOL)isDynamicContainer;
- (SUUIViewElement)cellTemplateViewElement;
- (id)applyUpdatesWithElement:(id)a3;
- (void)setShelfItemViewElementValidator:(id)a3;
@end

@implementation SUUIDynamicShelfMenuBarViewElement

- (SUUIViewElement)cellTemplateViewElement
{
  cellTemplateViewElement = self->_cellTemplateViewElement;
  if (!cellTemplateViewElement)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __61__SUUIDynamicShelfMenuBarViewElement_cellTemplateViewElement__block_invoke;
    v5[3] = &unk_2654008B8;
    v5[4] = self;
    [(SUUIShelfMenuBarViewElement *)self enumerateChildrenUsingBlock:v5];
    cellTemplateViewElement = self->_cellTemplateViewElement;
  }
  return cellTemplateViewElement;
}

void __61__SUUIDynamicShelfMenuBarViewElement_cellTemplateViewElement__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  *a3 = 1;
}

- (id)applyUpdatesWithElement:(id)a3
{
  v4 = (SUUIDynamicShelfMenuBarViewElement *)a3;
  v10.receiver = self;
  v10.super_class = (Class)SUUIDynamicShelfMenuBarViewElement;
  v5 = [(SUUIShelfMenuBarViewElement *)&v10 applyUpdatesWithElement:v4];
  v6 = v5;
  if (v4 != self || [v5 updateType])
  {
    v7 = [(SUUIDynamicShelfMenuBarViewElement *)v4 cellTemplateViewElement];
    cellTemplateViewElement = self->_cellTemplateViewElement;
    self->_cellTemplateViewElement = v7;
  }
  return v6;
}

- (BOOL)isDynamicContainer
{
  return 1;
}

- (void)setShelfItemViewElementValidator:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SUUIDynamicShelfMenuBarViewElement;
  [(SUUIShelfViewElement *)&v5 setShelfItemViewElementValidator:a3];
  cellTemplateViewElement = self->_cellTemplateViewElement;
  self->_cellTemplateViewElement = 0;
}

- (void).cxx_destruct
{
}

@end