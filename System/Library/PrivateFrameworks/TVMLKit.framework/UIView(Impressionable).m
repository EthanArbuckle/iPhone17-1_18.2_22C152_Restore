@interface UIView(Impressionable)
- (id)tv_impressionableElementsForDocument:()Impressionable parentViewController:;
- (uint64_t)tv_impressionableElementsForDocument:()Impressionable;
@end

@implementation UIView(Impressionable)

- (uint64_t)tv_impressionableElementsForDocument:()Impressionable
{
  return objc_msgSend(a1, "tv_impressionableElementsForDocument:parentViewController:", a3, 0);
}

- (id)tv_impressionableElementsForDocument:()Impressionable parentViewController:
{
  id v6 = a3;
  id v7 = a4;
  [v6 impressionViewablePercentage];
  double v9 = v8;
  v10 = [MEMORY[0x263EFF980] array];
  if (objc_opt_respondsToSelector())
  {
    v11 = [a1 impressionableElementsContainedInDocument:v6];
    [v10 addObjectsFromArray:v11];
  }
  else
  {
    v12 = objc_msgSend(a1, "tv_associatedIKViewElement");
    v13 = v12;
    if (v12)
    {
      id v14 = v12;
    }
    else
    {
      objc_msgSend(v7, "tv_associatedIKViewElement");
      id v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    v11 = v14;

    double v15 = ImpressionVisibilityFactor(a1);
    if (v11 && v15 >= v9 && ActuallyVisibleView(a1)) {
      [v10 addObject:v11];
    }
  }

  v16 = (void *)[v10 copy];
  return v16;
}

@end