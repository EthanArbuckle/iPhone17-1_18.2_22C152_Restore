@interface NSLayoutConstraint(TKExtensions)
- (void)tk_removeFromContainer;
@end

@implementation NSLayoutConstraint(TKExtensions)

- (void)tk_removeFromContainer
{
  id v15 = [a1 firstItem];
  v2 = [a1 secondItem];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = v15;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v2;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  v7 = v6;
  if (v4) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (v4) {
      v9 = v4;
    }
    else {
      v9 = v6;
    }
    id v10 = v9;
  }
  else
  {
    objc_msgSend(v4, "tk_firstCommonAncestorWithView:", v6);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;
  if (v10)
  {
    while (1)
    {
      v12 = [v11 constraints];
      int v13 = [v12 containsObject:a1];

      if (v13) {
        break;
      }
      uint64_t v14 = [v11 superview];

      v11 = (void *)v14;
      if (!v14) {
        goto LABEL_21;
      }
    }
    [v11 removeConstraint:a1];
  }
LABEL_21:
}

@end