@interface UIAccessibilityCustomRotorSearchPredicate
- (UIAccessibilityCustomRotorDirection)searchDirection;
- (UIAccessibilityCustomRotorItemResult)currentItem;
- (void)setCurrentItem:(UIAccessibilityCustomRotorItemResult *)currentItem;
- (void)setSearchDirection:(UIAccessibilityCustomRotorDirection)searchDirection;
@end

@implementation UIAccessibilityCustomRotorSearchPredicate

- (UIAccessibilityCustomRotorItemResult)currentItem
{
  return self->_currentItem;
}

- (void)setCurrentItem:(UIAccessibilityCustomRotorItemResult *)currentItem
{
}

- (UIAccessibilityCustomRotorDirection)searchDirection
{
  return self->_searchDirection;
}

- (void)setSearchDirection:(UIAccessibilityCustomRotorDirection)searchDirection
{
  self->_searchDirection = searchDirection;
}

- (void).cxx_destruct
{
}

@end