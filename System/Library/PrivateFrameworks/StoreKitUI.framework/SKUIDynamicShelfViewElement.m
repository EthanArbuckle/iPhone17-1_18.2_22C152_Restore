@interface SKUIDynamicShelfViewElement
- (BOOL)isDynamicContainer;
- (SKUIViewElement)cellTemplateViewElement;
- (id)applyUpdatesWithElement:(id)a3;
- (void)cellTemplateViewElement;
- (void)isDynamicContainer;
- (void)setShelfItemViewElementValidator:(id)a3;
@end

@implementation SKUIDynamicShelfViewElement

- (SKUIViewElement)cellTemplateViewElement
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUIDynamicShelfViewElement *)v3 cellTemplateViewElement];
      }
    }
  }
  cellTemplateViewElement = self->_cellTemplateViewElement;
  if (!cellTemplateViewElement)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __54__SKUIDynamicShelfViewElement_cellTemplateViewElement__block_invoke;
    v13[3] = &unk_1E6423570;
    v13[4] = self;
    [(SKUIShelfViewElement *)self enumerateChildrenUsingBlock:v13];
    cellTemplateViewElement = self->_cellTemplateViewElement;
  }

  return cellTemplateViewElement;
}

void __54__SKUIDynamicShelfViewElement_cellTemplateViewElement__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  *a3 = 1;
}

- (id)applyUpdatesWithElement:(id)a3
{
  uint64_t v4 = (SKUIDynamicShelfViewElement *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIDynamicShelfViewElement applyUpdatesWithElement:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  v16.receiver = self;
  v16.super_class = (Class)SKUIDynamicShelfViewElement;
  v13 = [(SKUIShelfViewElement *)&v16 applyUpdatesWithElement:v4];

  if (v4 != self || [v13 updateType])
  {
    cellTemplateViewElement = self->_cellTemplateViewElement;
    self->_cellTemplateViewElement = 0;
  }

  return v13;
}

- (BOOL)isDynamicContainer
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v2) {
        [(SKUIDynamicShelfViewElement *)v2 isDynamicContainer];
      }
    }
  }
  return 1;
}

- (void)setShelfItemViewElementValidator:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIDynamicShelfViewElement setShelfItemViewElementValidator:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  v14.receiver = self;
  v14.super_class = (Class)SKUIDynamicShelfViewElement;
  [(SKUIShelfViewElement *)&v14 setShelfItemViewElementValidator:v4];
  cellTemplateViewElement = self->_cellTemplateViewElement;
  self->_cellTemplateViewElement = 0;
}

- (void).cxx_destruct
{
}

- (void)cellTemplateViewElement
{
}

- (void)applyUpdatesWithElement:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)isDynamicContainer
{
}

- (void)setShelfItemViewElementValidator:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end