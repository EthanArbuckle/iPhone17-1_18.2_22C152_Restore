@interface UIViewController(Impressionable)
- (id)tv_impressionableElementsForDocument:()Impressionable;
@end

@implementation UIViewController(Impressionable)

- (id)tv_impressionableElementsForDocument:()Impressionable
{
  id v4 = a3;
  v5 = [MEMORY[0x263EFF980] array];
  if (objc_opt_respondsToSelector())
  {
    v6 = [a1 impressionableElementsContainedInDocument:v4];
    [v5 addObjectsFromArray:v6];
  }
  else if ([a1 isViewLoaded])
  {
    v6 = [a1 view];
    v7 = objc_msgSend(v6, "tv_impressionableElementsForDocument:parentViewController:", v4, a1);
    [v5 addObjectsFromArray:v7];
  }
  else
  {
    v6 = objc_msgSend(a1, "tv_associatedIKViewElement");
    if (v6) {
      [v5 addObject:v6];
    }
  }

  v8 = (void *)[v5 copy];
  return v8;
}

@end