@interface SKUIStackItemViewElement
- (NSArray)imageElements;
- (SKUILabelViewElement)textElement;
- (int64_t)pageComponentType;
- (void)imageElements;
- (void)pageComponentType;
- (void)textElement;
@end

@implementation SKUIStackItemViewElement

- (NSArray)imageElements
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUIStackItemViewElement *)v3 imageElements];
      }
    }
  }
  v11 = [MEMORY[0x1E4F1CA48] array];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __41__SKUIStackItemViewElement_imageElements__block_invoke;
  v14[3] = &unk_1E6423570;
  id v12 = v11;
  id v15 = v12;
  [(SKUIViewElement *)self enumerateChildrenUsingBlock:v14];

  return (NSArray *)v12;
}

void __41__SKUIStackItemViewElement_imageElements__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 elementType] == 49) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (SKUILabelViewElement)textElement
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUIStackItemViewElement *)v3 textElement];
      }
    }
  }
  v11 = [(SKUIViewElement *)self firstChildForElementType:138];

  return (SKUILabelViewElement *)v11;
}

- (int64_t)pageComponentType
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v2) {
        [(SKUIStackItemViewElement *)v2 pageComponentType];
      }
    }
  }
  return 24;
}

- (void)imageElements
{
}

- (void)textElement
{
}

- (void)pageComponentType
{
}

@end