@interface UIMenuController
- (BOOL)_crlaxShouldPreventMakingVisible;
- (BOOL)_crlaxShouldPreventMutatingItems;
- (NSArray)_crlaxLastUpdatedMenuItemsWhilePreventingActualItemsMutation;
- (id)crlaxPerformBlockPreventingMutatingMenuItems:(id)a3;
- (void)_crlaxSetLastUpdatedMenuItemsWhilePreventingActualItemsMutation:(id)a3;
- (void)_crlaxSetShouldPreventMakingVisible:(BOOL)a3;
- (void)_crlaxSetShouldPreventMutatingItems:(BOOL)a3;
- (void)crlaxPerformBlockPreventingMakingVisible:(id)a3;
@end

@implementation UIMenuController

- (BOOL)_crlaxShouldPreventMakingVisible
{
  return __CRLAccessibilityGetAssociatedBool(self, &unk_1016A8DD8);
}

- (void)_crlaxSetShouldPreventMakingVisible:(BOOL)a3
{
}

- (BOOL)_crlaxShouldPreventMutatingItems
{
  return __CRLAccessibilityGetAssociatedBool(self, &unk_1016A8DD9);
}

- (void)_crlaxSetShouldPreventMutatingItems:(BOOL)a3
{
}

- (NSArray)_crlaxLastUpdatedMenuItemsWhilePreventingActualItemsMutation
{
  return (NSArray *)__CRLAccessibilityGetAssociatedObject(self, &unk_1016A8DDA);
}

- (void)_crlaxSetLastUpdatedMenuItemsWhilePreventingActualItemsMutation:(id)a3
{
}

- (void)crlaxPerformBlockPreventingMakingVisible:(id)a3
{
  v4 = (void (**)(void))a3;
  if ([(UIMenuController *)self _crlaxShouldPreventMakingVisible])
  {
    v4[2]();
  }
  else
  {
    [(UIMenuController *)self _crlaxSetShouldPreventMakingVisible:1];
    v4[2]();
    [(UIMenuController *)self _crlaxSetShouldPreventMakingVisible:0];
  }
}

- (id)crlaxPerformBlockPreventingMutatingMenuItems:(id)a3
{
  v4 = (void (**)(void))a3;
  if ([(UIMenuController *)self _crlaxShouldPreventMutatingItems])
  {
    v4[2](v4);
  }
  else
  {
    [(UIMenuController *)self _crlaxSetShouldPreventMutatingItems:1];
    v4[2](v4);
    [(UIMenuController *)self _crlaxSetShouldPreventMutatingItems:0];
  }
  v5 = [(UIMenuController *)self _crlaxLastUpdatedMenuItemsWhilePreventingActualItemsMutation];
  [(UIMenuController *)self _crlaxSetLastUpdatedMenuItemsWhilePreventingActualItemsMutation:0];

  return v5;
}

@end