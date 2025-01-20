@interface UIView(AccessibilityBridging)
- (id)ttriAccessibilityShouldUseViewHierarchyForFindingScrollParent;
- (uint64_t)ttriAccessibilityShowContextMenuAtPoint:()AccessibilityBridging;
@end

@implementation UIView(AccessibilityBridging)

- (uint64_t)ttriAccessibilityShowContextMenuAtPoint:()AccessibilityBridging
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  if (v5)
  {
    v6 = v5;
    char v7 = 0;
    do
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      v8 = objc_msgSend(v6, "interactions", 0);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v18;
        while (2)
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v18 != v11) {
              objc_enumerationMutation(v8);
            }
            v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
            if (v13)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v14 = v13;
                if (objc_opt_respondsToSelector())
                {
                  objc_msgSend(v14, "_presentMenuAtLocation:", a2, a3);

                  char v7 = 1;
                  goto LABEL_16;
                }
              }
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
          if (v10) {
            continue;
          }
          break;
        }
      }
LABEL_16:

      uint64_t v15 = [v6 superview];

      v6 = (void *)v15;
    }
    while (v15);
  }
  else
  {
    char v7 = 0;
  }
  return v7 & 1;
}

- (id)ttriAccessibilityShouldUseViewHierarchyForFindingScrollParent
{
  v2.receiver = a1;
  v2.super_class = (Class)UIView_0;
  return objc_msgSendSuper2(&v2, sel__accessibilityShouldUseViewHierarchyForFindingScrollParent);
}

@end