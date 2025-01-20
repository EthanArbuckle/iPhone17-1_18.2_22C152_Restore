@interface SUUIItemViewElement
- (BOOL)isSelected;
- (SUUIItemViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (SUUIViewElementText)itemText;
- (id)applyUpdatesWithElement:(id)a3;
@end

@implementation SUUIItemViewElement

- (SUUIItemViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v24.receiver = self;
  v24.super_class = (Class)SUUIItemViewElement;
  v11 = [(SUUIViewElement *)&v24 initWithDOMElement:v8 parent:v9 elementFactory:v10];
  if (!v11) {
    goto LABEL_7;
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
          goto LABEL_3;
        }
      }
    }
    v14 = SUUIBrowseItemViewElement;
    goto LABEL_13;
  }
LABEL_3:
  uint64_t v13 = objc_opt_class();
  if (v13 == objc_opt_class())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v14 = SUUIStackItemViewElement;
LABEL_13:
      v18 = (SUUIItemViewElement *)[[v14 alloc] initWithDOMElement:v8 parent:v9 elementFactory:v10];
      goto LABEL_14;
    }
  }
  uint64_t v15 = +[IKTextParser textWithDOMElement:v8 usingParseBlock:0];
  itemText = v11->_itemText;
  v11->_itemText = (SUUIViewElementText *)v15;

  v17 = [v8 getAttribute:@"selected"];
  v11->_selected = [v17 BOOLValue];

LABEL_7:
  v18 = v11;
LABEL_14:
  v20 = v18;

  return v20;
}

- (id)applyUpdatesWithElement:(id)a3
{
  v4 = (SUUIItemViewElement *)a3;
  v10.receiver = self;
  v10.super_class = (Class)SUUIItemViewElement;
  v5 = [(SUUIViewElement *)&v10 applyUpdatesWithElement:v4];
  v6 = v5;
  if (v4 != self || [v5 updateType])
  {
    v7 = [(SUUIItemViewElement *)v4 itemText];
    itemText = self->_itemText;
    self->_itemText = v7;

    self->_selected = [(SUUIItemViewElement *)v4 isSelected];
  }

  return v6;
}

- (SUUIViewElementText)itemText
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

@end