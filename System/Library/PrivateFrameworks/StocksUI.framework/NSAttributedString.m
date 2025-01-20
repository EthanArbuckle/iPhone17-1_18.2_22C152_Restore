@interface NSAttributedString
@end

@implementation NSAttributedString

void __71__NSAttributedString_StocksUICoreText__su_languageAwareOutsetsAtScale___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend(v8, "su_languageAwareOutsetsAtScale:", *(double *)(a1 + 40));
    UIEdgeInsetsMin();
    v3 = *(void **)(*(void *)(a1 + 32) + 8);
    v3[4] = v4;
    v3[5] = v5;
    v3[6] = v6;
    v3[7] = v7;
  }
}

@end