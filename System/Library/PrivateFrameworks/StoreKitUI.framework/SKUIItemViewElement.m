@interface SKUIItemViewElement
- (BOOL)isSelected;
- (SKUIItemViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (SKUIViewElementText)itemText;
- (id)applyUpdatesWithElement:(id)a3;
@end

@implementation SKUIItemViewElement

- (SKUIItemViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIItemViewElement initWithDOMElement:parent:elementFactory:]();
  }
  v24.receiver = self;
  v24.super_class = (Class)SKUIItemViewElement;
  v11 = [(SKUIViewElement *)&v24 initWithDOMElement:v8 parent:v9 elementFactory:v10];
  if (!v11) {
    goto LABEL_11;
  }
  uint64_t v12 = objc_opt_class();
  if (v12 == objc_opt_class())
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v19 = [v9 parent];
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
      {
      }
      else
      {
        v22 = [v9 parent];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0) {
          goto LABEL_7;
        }
      }
    }
    v14 = SKUIBrowseItemViewElement;
    goto LABEL_17;
  }
LABEL_7:
  uint64_t v13 = objc_opt_class();
  if (v13 == objc_opt_class())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v14 = SKUIStackItemViewElement;
LABEL_17:
      v18 = (SKUIItemViewElement *)[[v14 alloc] initWithDOMElement:v8 parent:v9 elementFactory:v10];
      goto LABEL_18;
    }
  }
  uint64_t v15 = +[IKTextParser textWithDOMElement:v8 usingParseBlock:0];
  itemText = v11->_itemText;
  v11->_itemText = (SKUIViewElementText *)v15;

  v17 = [v8 getAttribute:@"selected"];
  v11->_selected = [v17 BOOLValue];

LABEL_11:
  v18 = v11;
LABEL_18:
  v20 = v18;

  return v20;
}

- (id)applyUpdatesWithElement:(id)a3
{
  v4 = (SKUIItemViewElement *)a3;
  v10.receiver = self;
  v10.super_class = (Class)SKUIItemViewElement;
  v5 = [(SKUIViewElement *)&v10 applyUpdatesWithElement:v4];
  v6 = v5;
  if (v4 != self || [v5 updateType])
  {
    v7 = [(SKUIItemViewElement *)v4 itemText];
    itemText = self->_itemText;
    self->_itemText = v7;

    self->_selected = [(SKUIItemViewElement *)v4 isSelected];
  }

  return v6;
}

- (SKUIViewElementText)itemText
{
  return self->_itemText;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void).cxx_destruct
{
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIItemViewElement initWithDOMElement:parent:elementFactory:]";
}

@end