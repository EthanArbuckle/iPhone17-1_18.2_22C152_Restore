@interface SKUIDialogTemplateViewElement
- (NSArray)buttons;
- (SKUIDialogTemplateViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (SKUIImageViewElement)image;
- (SKUILabelViewElement)message;
- (SKUILabelViewElement)title;
- (id)applyUpdatesWithElement:(id)a3;
- (int64_t)dialogType;
@end

@implementation SKUIDialogTemplateViewElement

- (SKUIDialogTemplateViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIDialogTemplateViewElement initWithDOMElement:parent:elementFactory:]();
  }
  v15.receiver = self;
  v15.super_class = (Class)SKUIDialogTemplateViewElement;
  v11 = [(SKUIViewElement *)&v15 initWithDOMElement:v8 parent:v9 elementFactory:v10];
  if (v11)
  {
    v12 = [v8 getAttribute:@"type"];
    if ([v12 isEqualToString:@"actionSheet"])
    {
      uint64_t v13 = 1;
    }
    else if ([v12 isEqualToString:@"error"])
    {
      uint64_t v13 = 3;
    }
    else if ([v12 isEqualToString:@"itemActionSheet"])
    {
      uint64_t v13 = 2;
    }
    else
    {
      if (![v12 isEqualToString:@"toast"])
      {
        v11->_dialogType = 0;
        goto LABEL_15;
      }
      uint64_t v13 = 4;
    }
    v11->_dialogType = v13;
LABEL_15:
  }
  return v11;
}

- (NSArray)buttons
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__SKUIDialogTemplateViewElement_buttons__block_invoke;
  v6[3] = &unk_1E6423570;
  id v4 = v3;
  id v7 = v4;
  [(SKUIViewElement *)self enumerateChildrenUsingBlock:v6];

  return (NSArray *)v4;
}

void __40__SKUIDialogTemplateViewElement_buttons__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 elementType] == 12) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (SKUILabelViewElement)message
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__17;
  id v9 = __Block_byref_object_dispose__17;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __40__SKUIDialogTemplateViewElement_message__block_invoke;
  v4[3] = &unk_1E6422498;
  v4[4] = &v5;
  [(SKUIViewElement *)self enumerateChildrenUsingBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (SKUILabelViewElement *)v2;
}

void __40__SKUIDialogTemplateViewElement_message__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  if ([v6 elementType] == 138 && objc_msgSend(v6, "labelViewStyle") != 5)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }
}

- (SKUILabelViewElement)title
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__17;
  id v9 = __Block_byref_object_dispose__17;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __38__SKUIDialogTemplateViewElement_title__block_invoke;
  v4[3] = &unk_1E6422498;
  v4[4] = &v5;
  [(SKUIViewElement *)self enumerateChildrenUsingBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (SKUILabelViewElement *)v2;
}

void __38__SKUIDialogTemplateViewElement_title__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  if ([v6 elementType] == 138 && objc_msgSend(v6, "labelViewStyle") == 5)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }
}

- (SKUIImageViewElement)image
{
  return (SKUIImageViewElement *)[(SKUIViewElement *)self firstChildForElementType:49];
}

- (id)applyUpdatesWithElement:(id)a3
{
  id v4 = (SKUIDialogTemplateViewElement *)a3;
  v8.receiver = self;
  v8.super_class = (Class)SKUIDialogTemplateViewElement;
  uint64_t v5 = [(SKUIViewElement *)&v8 applyUpdatesWithElement:v4];
  id v6 = v5;
  if (v4 != self || [v5 updateType]) {
    self->_dialogType = [(SKUIDialogTemplateViewElement *)v4 dialogType];
  }

  return v6;
}

- (int64_t)dialogType
{
  return self->_dialogType;
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIDialogTemplateViewElement initWithDOMElement:parent:elementFactory:]";
}

@end