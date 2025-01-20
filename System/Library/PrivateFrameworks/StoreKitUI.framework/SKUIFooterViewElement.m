@interface SKUIFooterViewElement
- (NSArray)titleLabels;
- (SKUIButtonViewElement)button;
- (void)button;
- (void)titleLabels;
@end

@implementation SKUIFooterViewElement

- (SKUIButtonViewElement)button
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIFooterViewElement button]();
  }
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__95;
  v10 = __Block_byref_object_dispose__95;
  id v11 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __31__SKUIFooterViewElement_button__block_invoke;
  v5[3] = &unk_1E6422498;
  v5[4] = &v6;
  [(SKUIViewElement *)self enumerateChildrenUsingBlock:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (SKUIButtonViewElement *)v3;
}

void __31__SKUIFooterViewElement_button__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  if (SKUIIKViewElementTypeIsButton([v6 elementType]))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }
}

- (NSArray)titleLabels
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIFooterViewElement titleLabels]();
  }
  id v3 = [MEMORY[0x1E4F1CA48] array];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36__SKUIFooterViewElement_titleLabels__block_invoke;
  v6[3] = &unk_1E6423570;
  id v4 = v3;
  id v7 = v4;
  [(SKUIViewElement *)self enumerateChildrenUsingBlock:v6];

  return (NSArray *)v4;
}

void __36__SKUIFooterViewElement_titleLabels__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 elementType] == 138) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (void)button
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIFooterViewElement button]";
}

- (void)titleLabels
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIFooterViewElement titleLabels]";
}

@end