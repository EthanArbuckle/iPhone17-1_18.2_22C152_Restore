@interface SUUIPaletteViewElement
- (void)enumerateChildrenUsingBlock:(id)a3;
@end

@implementation SUUIPaletteViewElement

- (void)enumerateChildrenUsingBlock:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __54__SUUIPaletteViewElement_enumerateChildrenUsingBlock___block_invoke;
  v7[3] = &unk_265400DA0;
  id v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)SUUIPaletteViewElement;
  id v5 = v4;
  [(SUUIViewElement *)&v6 enumerateChildrenUsingBlock:v7];
}

void __54__SUUIPaletteViewElement_enumerateChildrenUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  unint64_t v3 = [v5 elementType];
  BOOL v4 = v3 > 0x3E || ((1 << v3) & 0x4004010100001000) == 0;
  if (!v4 || v3 - 95 <= 0x2E && ((1 << (v3 - 95)) & 0x480000004001) != 0) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

@end