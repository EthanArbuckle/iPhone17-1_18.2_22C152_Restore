@interface UIPageViewController(IC)
- (id)ic_internalScrollView;
- (void)ic_setAutoscrollEnabled:()IC;
@end

@implementation UIPageViewController(IC)

- (id)ic_internalScrollView
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v1 = objc_msgSend(a1, "view", 0);
  v2 = [v1 subviews];

  id v3 = (id)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v3 = v6;
          goto LABEL_11;
        }
      }
      id v3 = (id)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)ic_setAutoscrollEnabled:()IC
{
  objc_msgSend(a1, "ic_internalScrollView");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 _setAutoScrollEnabled:a3];
}

@end