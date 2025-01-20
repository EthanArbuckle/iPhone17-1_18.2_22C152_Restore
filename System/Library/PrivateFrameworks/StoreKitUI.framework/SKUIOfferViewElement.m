@interface SKUIOfferViewElement
- (BOOL)isCompactModeEnabled;
- (BOOL)isSimpleOffer;
- (int64_t)pageComponentType;
- (void)enumerateChildrenUsingBlock:(id)a3;
@end

@implementation SKUIOfferViewElement

- (BOOL)isSimpleOffer
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 1;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __37__SKUIOfferViewElement_isSimpleOffer__block_invoke;
  v4[3] = &unk_1E6422498;
  v4[4] = &v5;
  [(SKUIOfferViewElement *)self enumerateChildrenUsingBlock:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __37__SKUIOfferViewElement_isSimpleOffer__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  if ([v5 elementType] == 138 && objc_msgSend(v5, "labelViewStyle") != 3)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a3 = 1;
  }
}

- (BOOL)isCompactModeEnabled
{
  char v2 = [(SKUIOfferViewElement *)self attributes];
  v3 = [v2 objectForKey:@"compact"];

  if (v3 && (objc_opt_respondsToSelector() & 1) != 0) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (void)enumerateChildrenUsingBlock:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__SKUIOfferViewElement_enumerateChildrenUsingBlock___block_invoke;
  v7[3] = &unk_1E64241C8;
  id v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)SKUIOfferViewElement;
  id v5 = v4;
  [(SKUIViewElement *)&v6 enumerateChildrenUsingBlock:v7];
}

void __52__SKUIOfferViewElement_enumerateChildrenUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  unint64_t v3 = [v5 elementType];
  BOOL v4 = v3 > 0x32 || ((1 << v3) & 0x4000000003000) == 0;
  if (!v4 || v3 == 141 || v3 == 138) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (int64_t)pageComponentType
{
  return 24;
}

@end