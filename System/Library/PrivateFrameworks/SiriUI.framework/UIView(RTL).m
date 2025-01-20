@interface UIView(RTL)
+ (uint64_t)siriChevronShouldBeOnLeadingSide;
- (uint64_t)recursive_setSemanticContentAttribute:()RTL;
@end

@implementation UIView(RTL)

- (uint64_t)recursive_setSemanticContentAttribute:()RTL
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = objc_msgSend(a1, "subviews", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          objc_msgSend(v10, "recursive_setSemanticContentAttribute:", a3);
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 && [a1 semanticContentAttribute] != a3) {
    [a1 setSemanticContentAttribute:a3];
  }
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t result = objc_opt_respondsToSelector();
    if (result)
    {
      uint64_t result = [a1 textAlignment];
      if (result == 4) {
        return objc_msgSend(a1, "setTextAlignment:", 2* (objc_msgSend(MEMORY[0x263F1CB60], "userInterfaceLayoutDirectionForSemanticContentAttribute:", objc_msgSend(a1, "semanticContentAttribute")) != 0));
      }
    }
  }
  return result;
}

+ (uint64_t)siriChevronShouldBeOnLeadingSide
{
  BOOL IsRTL = SiriUISystemLanguageIsRTL();
  return IsRTL ^ SiriLanguageIsRTL();
}

@end