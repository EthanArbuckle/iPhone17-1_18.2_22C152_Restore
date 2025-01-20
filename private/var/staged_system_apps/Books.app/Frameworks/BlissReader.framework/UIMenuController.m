@interface UIMenuController
- (BOOL)_tsaxShouldPreventMakingVisible;
- (BOOL)_tsaxShouldPreventMutatingItems;
- (NSArray)_tsaxLastUpdatedMenuItemsWhilePreventingActualItemsMutation;
- (id)tsaxPerformBlockPreventingMutatingMenuItems:(id)a3;
- (void)_tsaxSetLastUpdatedMenuItemsWhilePreventingActualItemsMutation:(id)a3;
- (void)_tsaxSetShouldPreventMakingVisible:(BOOL)a3;
- (void)_tsaxSetShouldPreventMutatingItems:(BOOL)a3;
- (void)tsaxPerformBlockPreventingMakingVisible:(id)a3;
@end

@implementation UIMenuController

- (BOOL)_tsaxShouldPreventMakingVisible
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_5738C0);
}

- (void)_tsaxSetShouldPreventMakingVisible:(BOOL)a3
{
}

- (BOOL)_tsaxShouldPreventMutatingItems
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_5738C1);
}

- (void)_tsaxSetShouldPreventMutatingItems:(BOOL)a3
{
}

- (NSArray)_tsaxLastUpdatedMenuItemsWhilePreventingActualItemsMutation
{
  return (NSArray *)__TSAccessibilityGetAssociatedObject(self, &unk_5738C2);
}

- (void)_tsaxSetLastUpdatedMenuItemsWhilePreventingActualItemsMutation:(id)a3
{
}

- (void)tsaxPerformBlockPreventingMakingVisible:(id)a3
{
  if ([(UIMenuController *)self _tsaxShouldPreventMakingVisible])
  {
    v4 = (void (*)(id))*((void *)a3 + 2);
    v4(a3);
  }
  else
  {
    v5 = self;
    [(UIMenuController *)self _tsaxSetShouldPreventMakingVisible:1];
    (*((void (**)(id))a3 + 2))(a3);
    [(UIMenuController *)self _tsaxSetShouldPreventMakingVisible:0];
  }
}

- (id)tsaxPerformBlockPreventingMutatingMenuItems:(id)a3
{
  if ([(UIMenuController *)self _tsaxShouldPreventMutatingItems])
  {
    (*((void (**)(id))a3 + 2))(a3);
  }
  else
  {
    v5 = self;
    [(UIMenuController *)self _tsaxSetShouldPreventMutatingItems:1];
    (*((void (**)(id))a3 + 2))(a3);
    [(UIMenuController *)self _tsaxSetShouldPreventMutatingItems:0];
  }
  v6 = [(UIMenuController *)self _tsaxLastUpdatedMenuItemsWhilePreventingActualItemsMutation];
  [(UIMenuController *)self _tsaxSetLastUpdatedMenuItemsWhilePreventingActualItemsMutation:0];

  return v6;
}

@end