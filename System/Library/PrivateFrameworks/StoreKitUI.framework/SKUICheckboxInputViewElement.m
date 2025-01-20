@interface SKUICheckboxInputViewElement
- (BOOL)isSelected;
- (SKUICheckboxInputViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (id)applyUpdatesWithElement:(id)a3;
- (unint64_t)elementType;
- (void)setSelected:(BOOL)a3;
@end

@implementation SKUICheckboxInputViewElement

- (SKUICheckboxInputViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUICheckboxInputViewElement initWithDOMElement:parent:elementFactory:]();
  }
  v16.receiver = self;
  v16.super_class = (Class)SKUICheckboxInputViewElement;
  v11 = [(SKUIInputViewElement *)&v16 initWithDOMElement:v8 parent:v9 elementFactory:v10];
  if (v11)
  {
    v12 = [v8 getAttribute:@"disabled"];
    if ([v12 length]) {
      char v13 = [v12 BOOLValue];
    }
    else {
      char v13 = -1;
    }
    v11->_disabled = v13;
    v14 = [v8 getAttribute:@"selected"];

    if ([v14 length]) {
      v11->_selected = [v14 BOOLValue];
    }
  }
  return v11;
}

- (id)applyUpdatesWithElement:(id)a3
{
  v4 = (SKUICheckboxInputViewElement *)a3;
  v8.receiver = self;
  v8.super_class = (Class)SKUICheckboxInputViewElement;
  v5 = [(SKUIViewElement *)&v8 applyUpdatesWithElement:v4];
  v6 = v5;
  if (v4 != self && v5 == self)
  {
    self->_disabled = v4->_disabled;
    self->_selected = [(SKUICheckboxInputViewElement *)v4 isSelected];
  }

  return v6;
}

- (unint64_t)elementType
{
  return 18;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUICheckboxInputViewElement initWithDOMElement:parent:elementFactory:]";
}

@end