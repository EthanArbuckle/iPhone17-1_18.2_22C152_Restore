@interface SUUIContentUnavailableTemplateElement
- (SUUIButtonViewElement)button;
- (SUUIImageViewElement)image;
- (SUUILabelViewElement)messageLabel;
- (SUUILabelViewElement)titleLabel;
- (int64_t)pageComponentType;
@end

@implementation SUUIContentUnavailableTemplateElement

- (SUUIButtonViewElement)button
{
  return (SUUIButtonViewElement *)[(SUUIViewElement *)self firstChildForElementType:12];
}

- (SUUIImageViewElement)image
{
  return (SUUIImageViewElement *)[(SUUIViewElement *)self firstChildForElementType:49];
}

- (SUUILabelViewElement)messageLabel
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__45;
  v9 = __Block_byref_object_dispose__45;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __53__SUUIContentUnavailableTemplateElement_messageLabel__block_invoke;
  v4[3] = &unk_265400D50;
  v4[4] = &v5;
  [(SUUIViewElement *)self enumerateChildrenUsingBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (SUUILabelViewElement *)v2;
}

void __53__SUUIContentUnavailableTemplateElement_messageLabel__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  if ([v6 elementType] == 138 && objc_msgSend(v6, "labelViewStyle") != 5)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }
}

- (SUUILabelViewElement)titleLabel
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__45;
  v9 = __Block_byref_object_dispose__45;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __51__SUUIContentUnavailableTemplateElement_titleLabel__block_invoke;
  v4[3] = &unk_265400D50;
  v4[4] = &v5;
  [(SUUIViewElement *)self enumerateChildrenUsingBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (SUUILabelViewElement *)v2;
}

void __51__SUUIContentUnavailableTemplateElement_titleLabel__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  if ([v6 elementType] == 138 && objc_msgSend(v6, "labelViewStyle") == 5)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }
}

- (int64_t)pageComponentType
{
  return 24;
}

@end