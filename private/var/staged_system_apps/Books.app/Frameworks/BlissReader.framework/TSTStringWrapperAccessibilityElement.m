@interface TSTStringWrapperAccessibilityElement
+ (id)stringWrapperAccessibilityElementWithTableRep:(id)a3 string:(id)a4;
@end

@implementation TSTStringWrapperAccessibilityElement

+ (id)stringWrapperAccessibilityElementWithTableRep:(id)a3 string:(id)a4
{
  v4 = 0;
  if (a3 && a4)
  {
    id v7 = [a3 tsaxHeaderElementsCache];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v15;
LABEL_5:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v14 + 1) + 8 * v11);
        if (objc_msgSend(objc_msgSend(v12, "accessibilityLabel"), "isEqualToString:", a4)) {
          break;
        }
        if (v9 == (id)++v11)
        {
          id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
          if (v9) {
            goto LABEL_5;
          }
          goto LABEL_13;
        }
      }
      v4 = v12;
      if (v4) {
        return v4;
      }
    }
LABEL_13:
    v4 = [(TSAccessibilityElement *)[TSTStringWrapperAccessibilityElement alloc] initWithAccessibilityParent:a3];
    [(TSTStringWrapperAccessibilityElement *)v4 setAccessibilityLabel:a4];
    if (!v7)
    {
      id v7 = (id)objc_opt_new();
      [a3 tsaxSetHeaderElementsCache:v7];
    }
    [v7 addObject:v4];
  }
  return v4;
}

@end