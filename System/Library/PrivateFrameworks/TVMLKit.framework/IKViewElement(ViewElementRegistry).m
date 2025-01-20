@interface IKViewElement(ViewElementRegistry)
+ (id)tv_approximateViewElementForView:()ViewElementRegistry;
- (id)tv_proxyView;
- (void)tv_setProxyView:()ViewElementRegistry;
@end

@implementation IKViewElement(ViewElementRegistry)

- (id)tv_proxyView
{
  v2 = objc_getAssociatedObject(a1, sel_tv_proxyView);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = objc_getAssociatedObject(a1, sel_tv_proxyView);
  }
  else
  {
    v3 = 0;
  }

  v4 = [v3 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v4 isViewLoaded])
    {
      id v5 = [v4 view];
LABEL_9:
      v6 = v5;
      goto LABEL_11;
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      goto LABEL_9;
    }
  }
  v6 = 0;
LABEL_11:

  return v6;
}

- (void)tv_setProxyView:()ViewElementRegistry
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    v4 = objc_getAssociatedObject(a1, sel_tv_proxyView);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_getAssociatedObject(a1, sel_tv_proxyView);
      id v5 = (_TVProxyWeakContainer *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
LABEL_8:
        [(_TVProxyWeakContainer *)v5 setObject:v6];

        goto LABEL_9;
      }
    }
    else
    {
    }
    id v5 = objc_alloc_init(_TVProxyWeakContainer);
    objc_setAssociatedObject(a1, sel_tv_proxyView, v5, (void *)1);
    goto LABEL_8;
  }
LABEL_9:
}

+ (id)tv_approximateViewElementForView:()ViewElementRegistry
{
  id v3 = a3;
  v4 = objc_msgSend(v3, "tv_associatedIKViewElement");
  id v5 = v3;
  if (!v4)
  {
    id v5 = v3;
    while (1)
    {
      id v6 = v5;
      id v5 = [v5 superview];

      if (!v5) {
        break;
      }
      uint64_t v7 = objc_msgSend(v5, "tv_associatedIKViewElement");
      if (v7)
      {
        v4 = (void *)v7;
        goto LABEL_7;
      }
    }
    v4 = 0;
  }
LABEL_7:

  return v4;
}

@end