@interface SUUIShareSheetActivityViewElement
- (NSString)activityType;
- (NSURL)contentSourceURL;
- (SUUIImageViewElement)image;
- (SUUILabelViewElement)message;
- (SUUILabelViewElement)title;
- (SUUIShareSheetActivityViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (SUUIURLViewElement)URL;
- (id)applyUpdatesWithElement:(id)a3;
@end

@implementation SUUIShareSheetActivityViewElement

- (SUUIShareSheetActivityViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SUUIShareSheetActivityViewElement;
  v9 = [(SUUIViewElement *)&v16 initWithDOMElement:v8 parent:a4 elementFactory:a5];
  if (v9)
  {
    uint64_t v10 = [v8 getAttribute:@"type"];
    activityType = v9->_activityType;
    v9->_activityType = (NSString *)v10;

    v12 = [v8 getAttribute:@"src"];
    if ([v12 length])
    {
      uint64_t v13 = [objc_alloc(NSURL) initWithString:v12];
      contentSourceURL = v9->_contentSourceURL;
      v9->_contentSourceURL = (NSURL *)v13;
    }
  }

  return v9;
}

- (SUUIImageViewElement)image
{
  return (SUUIImageViewElement *)[(SUUIViewElement *)self firstChildForElementType:49];
}

- (SUUILabelViewElement)message
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__69;
  v9 = __Block_byref_object_dispose__69;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __44__SUUIShareSheetActivityViewElement_message__block_invoke;
  v4[3] = &unk_265400D50;
  v4[4] = &v5;
  [(SUUIViewElement *)self enumerateChildrenUsingBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (SUUILabelViewElement *)v2;
}

void __44__SUUIShareSheetActivityViewElement_message__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
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
  id v8 = __Block_byref_object_copy__69;
  v9 = __Block_byref_object_dispose__69;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __42__SUUIShareSheetActivityViewElement_title__block_invoke;
  v4[3] = &unk_265400D50;
  v4[4] = &v5;
  [(SUUIViewElement *)self enumerateChildrenUsingBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (SUUILabelViewElement *)v2;
}

void __42__SUUIShareSheetActivityViewElement_title__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  if ([v6 elementType] == 138 && objc_msgSend(v6, "labelViewStyle") == 5)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }
}

- (SUUIURLViewElement)URL
{
  return (SUUIURLViewElement *)[(SUUIViewElement *)self firstChildForElementType:151];
}

- (id)applyUpdatesWithElement:(id)a3
{
  v4 = (SUUIShareSheetActivityViewElement *)a3;
  v12.receiver = self;
  v12.super_class = (Class)SUUIShareSheetActivityViewElement;
  uint64_t v5 = [(SUUIViewElement *)&v12 applyUpdatesWithElement:v4];
  id v6 = v5;
  if (v4 != self || [v5 updateType])
  {
    uint64_t v7 = [(SUUIShareSheetActivityViewElement *)v4 activityType];
    activityType = self->_activityType;
    self->_activityType = v7;

    v9 = [(SUUIShareSheetActivityViewElement *)v4 contentSourceURL];
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

@end