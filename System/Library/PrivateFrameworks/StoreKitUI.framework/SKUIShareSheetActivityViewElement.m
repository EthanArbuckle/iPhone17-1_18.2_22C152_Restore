@interface SKUIShareSheetActivityViewElement
- (NSString)activityType;
- (NSURL)contentSourceURL;
- (SKUIImageViewElement)image;
- (SKUILabelViewElement)message;
- (SKUILabelViewElement)title;
- (SKUIShareSheetActivityViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (SKUIURLViewElement)URL;
- (id)applyUpdatesWithElement:(id)a3;
@end

@implementation SKUIShareSheetActivityViewElement

- (SKUIShareSheetActivityViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIShareSheetActivityViewElement initWithDOMElement:parent:elementFactory:]();
  }
  v18.receiver = self;
  v18.super_class = (Class)SKUIShareSheetActivityViewElement;
  v11 = [(SKUIViewElement *)&v18 initWithDOMElement:v8 parent:v9 elementFactory:v10];
  if (v11)
  {
    uint64_t v12 = [v8 getAttribute:@"type"];
    activityType = v11->_activityType;
    v11->_activityType = (NSString *)v12;

    v14 = [v8 getAttribute:@"src"];
    if ([v14 length])
    {
      uint64_t v15 = [objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v14];
      contentSourceURL = v11->_contentSourceURL;
      v11->_contentSourceURL = (NSURL *)v15;
    }
  }

  return v11;
}

- (SKUIImageViewElement)image
{
  return (SKUIImageViewElement *)[(SKUIViewElement *)self firstChildForElementType:49];
}

- (SKUILabelViewElement)message
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__61;
  id v9 = __Block_byref_object_dispose__61;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__SKUIShareSheetActivityViewElement_message__block_invoke;
  v4[3] = &unk_1E6422498;
  v4[4] = &v5;
  [(SKUIViewElement *)self enumerateChildrenUsingBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (SKUILabelViewElement *)v2;
}

void __44__SKUIShareSheetActivityViewElement_message__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
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
  id v8 = __Block_byref_object_copy__61;
  id v9 = __Block_byref_object_dispose__61;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__SKUIShareSheetActivityViewElement_title__block_invoke;
  v4[3] = &unk_1E6422498;
  v4[4] = &v5;
  [(SKUIViewElement *)self enumerateChildrenUsingBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (SKUILabelViewElement *)v2;
}

void __42__SKUIShareSheetActivityViewElement_title__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  if ([v6 elementType] == 138 && objc_msgSend(v6, "labelViewStyle") == 5)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }
}

- (SKUIURLViewElement)URL
{
  return (SKUIURLViewElement *)[(SKUIViewElement *)self firstChildForElementType:151];
}

- (id)applyUpdatesWithElement:(id)a3
{
  v4 = (SKUIShareSheetActivityViewElement *)a3;
  v12.receiver = self;
  v12.super_class = (Class)SKUIShareSheetActivityViewElement;
  uint64_t v5 = [(SKUIViewElement *)&v12 applyUpdatesWithElement:v4];
  id v6 = v5;
  if (v4 != self || [v5 updateType])
  {
    uint64_t v7 = [(SKUIShareSheetActivityViewElement *)v4 activityType];
    activityType = self->_activityType;
    self->_activityType = v7;

    id v9 = [(SKUIShareSheetActivityViewElement *)v4 contentSourceURL];
    contentSourceURL = self->_contentSourceURL;
    self->_contentSourceURL = v9;
  }

  return v6;
}

- (NSString)activityType
{
  return self->_activityType;
}

- (NSURL)contentSourceURL
{
  return self->_contentSourceURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentSourceURL, 0);

  objc_storeStrong((id *)&self->_activityType, 0);
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIShareSheetActivityViewElement initWithDOMElement:parent:elementFactory:]";
}

@end