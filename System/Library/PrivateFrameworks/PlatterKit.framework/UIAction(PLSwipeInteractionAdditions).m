@interface UIAction(PLSwipeInteractionAdditions)
- (uint64_t)pl_isDefaultAction;
- (void)setPl_defaultAction:()PLSwipeInteractionAdditions;
@end

@implementation UIAction(PLSwipeInteractionAdditions)

- (void)setPl_defaultAction:()PLSwipeInteractionAdditions
{
  objc_msgSend(NSNumber, "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, "UIView.PLSwipeInteractionAdditions.pl_defaultAction", v2, (void *)0x303);
}

- (uint64_t)pl_isDefaultAction
{
  v1 = objc_getAssociatedObject(a1, "UIView.PLSwipeInteractionAdditions.pl_defaultAction");
  id v2 = v1;
  if (v1) {
    uint64_t v3 = [v1 BOOLValue];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

@end