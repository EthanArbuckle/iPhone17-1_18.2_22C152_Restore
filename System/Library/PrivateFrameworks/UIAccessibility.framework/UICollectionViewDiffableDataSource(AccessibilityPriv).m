@interface UICollectionViewDiffableDataSource(AccessibilityPriv)
- (uint64_t)_accessibilityDiffableDataSourceAnnotator;
- (void)_setAccessibilityDiffableDataSourceAnnotator:()AccessibilityPriv;
@end

@implementation UICollectionViewDiffableDataSource(AccessibilityPriv)

- (void)_setAccessibilityDiffableDataSourceAnnotator:()AccessibilityPriv
{
  id v4 = _Block_copy(aBlock);
  [a1 _accessibilitySetRetainedValue:v4 forKey:@"_accessibilityDiffableDataSourceAnnotator"];
}

- (uint64_t)_accessibilityDiffableDataSourceAnnotator
{
  return [a1 _accessibilityValueForKey:@"_accessibilityDiffableDataSourceAnnotator"];
}

@end