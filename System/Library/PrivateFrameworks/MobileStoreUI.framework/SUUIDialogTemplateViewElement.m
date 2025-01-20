@interface SUUIDialogTemplateViewElement
- (NSArray)buttons;
- (SUUIDialogTemplateViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (SUUIImageViewElement)image;
- (SUUILabelViewElement)message;
- (SUUILabelViewElement)title;
- (id)applyUpdatesWithElement:(id)a3;
- (int64_t)dialogType;
@end

@implementation SUUIDialogTemplateViewElement

- (SUUIDialogTemplateViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SUUIDialogTemplateViewElement;
  v9 = [(SUUIViewElement *)&v13 initWithDOMElement:v8 parent:a4 elementFactory:a5];
  if (v9)
  {
    v10 = [v8 getAttribute:@"type"];
    if ([v10 isEqualToString:@"actionSheet"])
    {
      uint64_t v11 = 1;
    }
    else if ([v10 isEqualToString:@"error"])
    {
      uint64_t v11 = 3;
    }
    else if ([v10 isEqualToString:@"itemActionSheet"])
    {
      uint64_t v11 = 2;
    }
    else
    {
      if (![v10 isEqualToString:@"toast"])
      {
        v9->_dialogType = 0;
        goto LABEL_11;
      }
      uint64_t v11 = 4;
    }
    v9->_dialogType = v11;
LABEL_11:
  }
  return v9;
}

- (NSArray)buttons
{
  v3 = [MEMORY[0x263EFF980] array];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __40__SUUIDialogTemplateViewElement_buttons__block_invoke;
  v6[3] = &unk_2654008B8;
  id v4 = v3;
  id v7 = v4;
  [(SUUIViewElement *)self enumerateChildrenUsingBlock:v6];

  return (NSArray *)v4;
}

void __40__SUUIDialogTemplateViewElement_buttons__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 elementType] == 12) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (SUUILabelViewElement)message
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__98;
  v9 = __Block_byref_object_dispose__98;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __40__SUUIDialogTemplateViewElement_message__block_invoke;
  v4[3] = &unk_265400D50;
  v4[4] = &v5;
  [(SUUIViewElement *)self enumerateChildrenUsingBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (SUUILabelViewElement *)v2;
}

void __40__SUUIDialogTemplateViewElement_message__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  if ([v6 elementType] == 138 && objc_msgSend(v6, "labelViewStyle") != 5)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }
}

- (SUUILabelViewElement)title
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__98;
  v9 = __Block_byref_object_dispose__98;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __38__SUUIDialogTemplateViewElement_title__block_invoke;
  v4[3] = &unk_265400D50;
  v4[4] = &v5;
  [(SUUIViewElement *)self enumerateChildrenUsingBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (SUUILabelViewElement *)v2;
}

void __38__SUUIDialogTemplateViewElement_title__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  if ([v6 elementType] == 138 && objc_msgSend(v6, "labelViewStyle") == 5)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }
}

- (SUUIImageViewElement)image
{
  return (SUUIImageViewElement *)[(SUUIViewElement *)self firstChildForElementType:49];
}

- (id)applyUpdatesWithElement:(id)a3
{
  id v4 = (SUUIDialogTemplateViewElement *)a3;
  v8.receiver = self;
  v8.super_class = (Class)SUUIDialogTemplateViewElement;
  uint64_t v5 = [(SUUIViewElement *)&v8 applyUpdatesWithElement:v4];
  id v6 = v5;
  if (v4 != self || [v5 updateType]) {
    self->_dialogType = [(SUUIDialogTemplateViewElement *)v4 dialogType];
  }

  return v6;
}

- (int64_t)dialogType
{
  return self->_dialogType;
}

@end