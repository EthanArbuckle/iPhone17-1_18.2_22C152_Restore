@interface SKUIInfoViewElement
- (NSArray)valueElements;
- (SKUILabelViewElement)titleElement;
- (void)titleElement;
- (void)valueElements;
@end

@implementation SKUIInfoViewElement

- (SKUILabelViewElement)titleElement
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIInfoViewElement titleElement]();
  }
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__8;
  v10 = __Block_byref_object_dispose__8;
  id v11 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35__SKUIInfoViewElement_titleElement__block_invoke;
  v5[3] = &unk_1E6422498;
  v5[4] = &v6;
  [(SKUIViewElement *)self enumerateChildrenUsingBlock:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (SKUILabelViewElement *)v3;
}

void __35__SKUIInfoViewElement_titleElement__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  if ([v6 elementType] == 138 && objc_msgSend(v6, "labelViewStyle") == 5)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }
}

- (NSArray)valueElements
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIInfoViewElement valueElements]();
  }
  id v3 = [MEMORY[0x1E4F1CA48] array];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36__SKUIInfoViewElement_valueElements__block_invoke;
  v6[3] = &unk_1E6423570;
  id v4 = v3;
  id v7 = v4;
  [(SKUIViewElement *)self enumerateChildrenUsingBlock:v6];

  return (NSArray *)v4;
}

void __36__SKUIInfoViewElement_valueElements__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  unint64_t v3 = [v5 elementType];
  if (v3 > 0x3E || ((1 << v3) & 0x4006004100001100) == 0)
  {
    switch(v3)
    {
      case 0x87uLL:
      case 0x8DuLL:
      case 0x90uLL:
        goto LABEL_7;
      case 0x88uLL:
      case 0x89uLL:
      case 0x8BuLL:
      case 0x8CuLL:
      case 0x8EuLL:
      case 0x8FuLL:
        break;
      case 0x8AuLL:
        if ([v5 labelViewStyle] != 5) {
          goto LABEL_7;
        }
        break;
      default:
        if (v3 == 152) {
          goto LABEL_7;
        }
        break;
    }
  }
  else
  {
LABEL_7:
    [*(id *)(a1 + 32) addObject:v5];
  }
}

- (void)titleElement
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIInfoViewElement titleElement]";
}

- (void)valueElements
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIInfoViewElement valueElements]";
}

@end