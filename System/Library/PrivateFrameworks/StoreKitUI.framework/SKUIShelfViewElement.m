@interface SKUIShelfViewElement
- (NSString)slideshowTitle;
- (SKUIShelfViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (id)applyUpdatesWithElement:(id)a3;
- (id)shelfItemViewElementValidator;
- (int64_t)numberOfRows;
- (int64_t)pageComponentType;
- (void)enumerateChildrenUsingBlock:(id)a3;
- (void)setShelfItemViewElementValidator:(id)a3;
@end

@implementation SKUIShelfViewElement

- (SKUIShelfViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIShelfViewElement initWithDOMElement:parent:elementFactory:]();
  }
  uint64_t v11 = objc_opt_class();
  if (v11 == objc_opt_class())
  {
    v14 = [v8 getAttribute:@"entityProviderID"];
    uint64_t v15 = [v14 length];

    if (v15)
    {
      v12 = [(SKUIShelfViewElement *)[SKUIDynamicShelfViewElement alloc] initWithDOMElement:v8 parent:v9 elementFactory:v10];
LABEL_16:

      goto LABEL_17;
    }
  }
  v20.receiver = self;
  v20.super_class = (Class)SKUIShelfViewElement;
  v12 = [(SKUIViewElement *)&v20 initWithDOMElement:v8 parent:v9 elementFactory:v10];
  if (v12)
  {
    self = [v8 getAttribute:@"rowCount"];
    if ([(SKUIShelfViewElement *)self length])
    {
      uint64_t numberOfRows = [(SKUIShelfViewElement *)self integerValue];
      v12->super._uint64_t numberOfRows = numberOfRows;
    }
    else
    {
      uint64_t numberOfRows = v12->super._numberOfRows;
    }
    if (numberOfRows <= 1) {
      uint64_t v16 = 1;
    }
    else {
      uint64_t v16 = numberOfRows;
    }
    v12->super._uint64_t numberOfRows = v16;
    uint64_t v17 = [v8 getAttribute:@"slideshowTitle"];
    slideshowTitle = v12->super._slideshowTitle;
    v12->super._slideshowTitle = (NSString *)v17;

    goto LABEL_16;
  }
LABEL_17:

  return &v12->super;
}

- (id)applyUpdatesWithElement:(id)a3
{
  v4 = (SKUIShelfViewElement *)a3;
  v10.receiver = self;
  v10.super_class = (Class)SKUIShelfViewElement;
  v5 = [(SKUIViewElement *)&v10 applyUpdatesWithElement:v4];
  v6 = v5;
  if (v4 != self || [v5 updateType])
  {
    self->_uint64_t numberOfRows = [(SKUIShelfViewElement *)v4 numberOfRows];
    v7 = [(SKUIShelfViewElement *)v4 slideshowTitle];
    slideshowTitle = self->_slideshowTitle;
    self->_slideshowTitle = v7;
  }

  return v6;
}

- (void)enumerateChildrenUsingBlock:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__SKUIShelfViewElement_enumerateChildrenUsingBlock___block_invoke;
  v7[3] = &unk_1E6429D00;
  v7[4] = self;
  id v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)SKUIShelfViewElement;
  id v5 = v4;
  [(SKUIViewElement *)&v6 enumerateChildrenUsingBlock:v7];
}

void __52__SKUIShelfViewElement_enumerateChildrenUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [v6 elementType];
  BOOL v4 = (unint64_t)(v3 - 14) > 0x34 || ((1 << (v3 - 14)) & 0x10000800004001) == 0;
  if (!v4 || v3 == 152)
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 296);
    if (!v5 || (*(unsigned int (**)(uint64_t, id))(v5 + 16))(v5, v6)) {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

- (int64_t)pageComponentType
{
  return 22;
}

- (int64_t)numberOfRows
{
  return self->_numberOfRows;
}

- (NSString)slideshowTitle
{
  return self->_slideshowTitle;
}

- (id)shelfItemViewElementValidator
{
  return self->_shelfItemViewElementValidator;
}

- (void)setShelfItemViewElementValidator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_shelfItemViewElementValidator, 0);

  objc_storeStrong((id *)&self->_slideshowTitle, 0);
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIShelfViewElement initWithDOMElement:parent:elementFactory:]";
}

@end