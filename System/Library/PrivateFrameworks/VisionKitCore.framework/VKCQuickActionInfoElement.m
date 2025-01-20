@interface VKCQuickActionInfoElement
+ (id)elementFromElement:(id)a3;
+ (id)elementFromUIAction:(id)a3;
+ (id)elementFromUIMenu:(id)a3;
+ (id)elementFromUIMenuElement:(id)a3;
- (BOOL)isLeaf;
- (NSArray)children;
- (NSString)text;
- (NSUUID)correlationIdentifier;
- (UIImage)image;
- (UIMenuElement)representedMenuElement;
- (id)linearizeElements;
- (void)performAction;
- (void)setChildren:(id)a3;
- (void)setCorrelationIdentifier:(id)a3;
- (void)setImage:(id)a3;
- (void)setIsLeaf:(BOOL)a3;
- (void)setRepresentedMenuElement:(id)a3;
- (void)setText:(id)a3;
@end

@implementation VKCQuickActionInfoElement

- (void)performAction
{
  v2 = [(VKCQuickActionInfoElement *)self representedMenuElement];
  VKProtocolCast((uint64_t)&unk_1F35BC938, v2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();

  [v3 performWithSender:0 target:0];
}

- (id)linearizeElements
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 addObject:self];
  v4 = [(VKCQuickActionInfoElement *)self children];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__VKCQuickActionInfoElement_linearizeElements__block_invoke;
  v7[3] = &unk_1E6BF2A38;
  id v5 = v3;
  id v8 = v5;
  [v4 enumerateObjectsUsingBlock:v7];

  return v5;
}

void __46__VKCQuickActionInfoElement_linearizeElements__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 linearizeElements];
  [v2 addObjectsFromArray:v3];
}

+ (id)elementFromElement:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [a1 elementFromUIMenu:v4];
LABEL_7:
    v6 = (void *)v5;
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [a1 elementFromUIAction:v4];
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [a1 elementFromUIMenuElement:v4];
    goto LABEL_7;
  }
  +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "+[VKCQuickActionInfoElement elementFromElement:]", 0, 0, @"Unexpected type for element from element.");
  v6 = 0;
LABEL_8:

  return v6;
}

+ (id)elementFromUIMenu:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_alloc_init(VKCQuickActionInfoElement);
  [(VKCQuickActionInfoElement *)v5 setRepresentedMenuElement:v4];
  v6 = [v4 title];
  [(VKCQuickActionInfoElement *)v5 setText:v6];

  v7 = [v4 image];
  [(VKCQuickActionInfoElement *)v5 setImage:v7];

  id v8 = [v4 children];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __47__VKCQuickActionInfoElement_elementFromUIMenu___block_invoke;
  v11[3] = &__block_descriptor_40_e29__32__0__UIMenuElement_8q16q24l;
  v11[4] = a1;
  v9 = objc_msgSend(v8, "vk_compactMap:", v11);
  [(VKCQuickActionInfoElement *)v5 setChildren:v9];

  return v5;
}

uint64_t __47__VKCQuickActionInfoElement_elementFromUIMenu___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) elementFromElement:a2];
}

+ (id)elementFromUIAction:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(VKCQuickActionInfoElement);
  [(VKCQuickActionInfoElement *)v4 setRepresentedMenuElement:v3];
  uint64_t v5 = [v3 title];
  [(VKCQuickActionInfoElement *)v4 setText:v5];

  v6 = [v3 image];

  [(VKCQuickActionInfoElement *)v4 setImage:v6];
  [(VKCQuickActionInfoElement *)v4 setIsLeaf:1];
  return v4;
}

+ (id)elementFromUIMenuElement:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(VKCQuickActionInfoElement);
  [(VKCQuickActionInfoElement *)v4 setRepresentedMenuElement:v3];
  uint64_t v5 = [v3 title];
  [(VKCQuickActionInfoElement *)v4 setText:v5];

  v6 = [v3 image];

  [(VKCQuickActionInfoElement *)v4 setImage:v6];
  [(VKCQuickActionInfoElement *)v4 setIsLeaf:1];
  return v4;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (NSArray)children
{
  return self->_children;
}

- (void)setChildren:(id)a3
{
}

- (BOOL)isLeaf
{
  return self->_isLeaf;
}

- (void)setIsLeaf:(BOOL)a3
{
  self->_isLeaf = a3;
}

- (UIMenuElement)representedMenuElement
{
  return self->_representedMenuElement;
}

- (void)setRepresentedMenuElement:(id)a3
{
}

- (NSUUID)correlationIdentifier
{
  return self->_correlationIdentifier;
}

- (void)setCorrelationIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_correlationIdentifier, 0);
  objc_storeStrong((id *)&self->_representedMenuElement, 0);
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end