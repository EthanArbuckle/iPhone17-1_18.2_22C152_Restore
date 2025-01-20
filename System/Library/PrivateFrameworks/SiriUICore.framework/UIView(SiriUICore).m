@interface UIView(SiriUICore)
- (uint64_t)suic_recursiveSetSemanticContentAttribute:()SiriUICore;
- (uint64_t)suic_updateViewHierarchyToUseSiriLanguageSemanticContentAttribute;
@end

@implementation UIView(SiriUICore)

- (uint64_t)suic_updateViewHierarchyToUseSiriLanguageSemanticContentAttribute
{
  uint64_t result = [a1 conformsToProtocol:&unk_1EFB741B0];
  if (result)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0
      || (uint64_t result = [a1 disallowSemanticContentModification], (result & 1) == 0))
    {
      if (SUICSiriLanguageIsRTL()) {
        uint64_t v3 = 4;
      }
      else {
        uint64_t v3 = 3;
      }
      return objc_msgSend(a1, "suic_recursiveSetSemanticContentAttribute:", v3);
    }
  }
  return result;
}

- (uint64_t)suic_recursiveSetSemanticContentAttribute:()SiriUICore
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = objc_msgSend(a1, "subviews", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v9++), "suic_recursiveSetSemanticContentAttribute:", a3);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  if ([a1 semanticContentAttribute] != a3) {
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
        return objc_msgSend(a1, "setTextAlignment:", 2* (objc_msgSend(MEMORY[0x1E4FB1EB0], "userInterfaceLayoutDirectionForSemanticContentAttribute:", objc_msgSend(a1, "semanticContentAttribute")) != 0));
      }
    }
  }
  return result;
}

@end