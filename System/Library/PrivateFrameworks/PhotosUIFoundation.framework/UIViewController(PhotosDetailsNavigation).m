@interface UIViewController(PhotosDetailsNavigation)
- (id)representedItem;
- (uint64_t)childViewControllerForRepresentedItem;
- (uint64_t)shouldUseSystemSwipeToDismiss;
- (void)setShouldUseSystemSwipeToDismiss:()PhotosDetailsNavigation;
@end

@implementation UIViewController(PhotosDetailsNavigation)

- (void)setShouldUseSystemSwipeToDismiss:()PhotosDetailsNavigation
{
  v2 = (const void *)ShouldUseSystemSwipeToDismissAssociationKey;
  objc_msgSend(NSNumber, "numberWithBool:");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, v2, v3, (void *)1);
}

- (uint64_t)shouldUseSystemSwipeToDismiss
{
  v2 = objc_getAssociatedObject(a1, (const void *)ShouldUseSystemSwipeToDismissAssociationKey);
  id v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 BOOLValue];
  }
  else
  {
    v5 = [a1 parentViewController];
    uint64_t v4 = [v5 shouldUseSystemSwipeToDismiss];
  }
  return v4;
}

- (uint64_t)childViewControllerForRepresentedItem
{
  return 0;
}

- (id)representedItem
{
  v1 = [a1 childViewControllerForRepresentedItem];
  v2 = [v1 representedItem];

  return v2;
}

@end