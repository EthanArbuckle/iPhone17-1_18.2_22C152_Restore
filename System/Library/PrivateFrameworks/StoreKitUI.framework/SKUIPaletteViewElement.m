@interface SKUIPaletteViewElement
- (void)enumerateChildrenUsingBlock:(id)a3;
@end

@implementation SKUIPaletteViewElement

- (void)enumerateChildrenUsingBlock:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIPaletteViewElement enumerateChildrenUsingBlock:]();
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__SKUIPaletteViewElement_enumerateChildrenUsingBlock___block_invoke;
  v7[3] = &unk_1E64241C8;
  id v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)SKUIPaletteViewElement;
  id v5 = v4;
  [(SKUIViewElement *)&v6 enumerateChildrenUsingBlock:v7];
}

void __54__SKUIPaletteViewElement_enumerateChildrenUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  unint64_t v3 = [v5 elementType];
  BOOL v4 = v3 > 0x3E || ((1 << v3) & 0x4004010100001000) == 0;
  if (!v4 || v3 - 95 <= 0x2E && ((1 << (v3 - 95)) & 0x480000004001) != 0) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)enumerateChildrenUsingBlock:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIPaletteViewElement enumerateChildrenUsingBlock:]";
}

@end