@interface NSObject(AXScanner)
- (uint64_t)_accessibilityCollectionViewItemsPerRow;
- (uint64_t)_accessibilityGroupIdentifier;
- (uint64_t)_accessibilityIsScannerGroup;
- (uint64_t)_accessibilityScannerActivateBehavior;
- (uint64_t)_accessibilityScannerGroupElements;
- (uint64_t)_accessibilityScanningBehaviorTraits;
- (uint64_t)_accessibilitySetIsScannerGroup:()AXScanner;
- (uint64_t)_accessibilitySetScannerGroupTraits:()AXScanner;
- (uint64_t)_accessibilityShouldBeScannedIfAncestorCanScroll;
- (uint64_t)_accessibilityTreatCollectionViewRowsAsScannerGroups;
- (unint64_t)_accessibilityScannerGroupTraits;
- (void)_accessibilityProcessScannerGroupElementPieces:()AXScanner;
- (void)_accessibilitySetScannerActivateBehavior:()AXScanner;
@end

@implementation NSObject(AXScanner)

- (void)_accessibilityProcessScannerGroupElementPieces:()AXScanner
{
  id v6 = a3;
  v4 = +[UIAccessibilityElementTraversalOptions defaultSwitchControlOptions];
  v5 = [a1 _accessibilityLeafDescendantsWithOptions:v4];
  if ([v5 count]) {
    [v6 addObjectsFromArray:v5];
  }
}

- (uint64_t)_accessibilityScannerGroupElements
{
  return 0;
}

- (uint64_t)_accessibilityTreatCollectionViewRowsAsScannerGroups
{
  return 0;
}

- (uint64_t)_accessibilityCollectionViewItemsPerRow
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (uint64_t)_accessibilityShouldBeScannedIfAncestorCanScroll
{
  return 0;
}

- (uint64_t)_accessibilityScanningBehaviorTraits
{
  return 31;
}

- (uint64_t)_accessibilityGroupIdentifier
{
  return 0;
}

- (uint64_t)_accessibilityIsScannerGroup
{
  v2 = [a1 _accessibilityValueForKey:@"UIAccessibilityStorageKeyIsScannerGroup"];
  v3 = v2;
  if (v2) {
    uint64_t v4 = [v2 BOOLValue];
  }
  else {
    uint64_t v4 = ([a1 _accessibilityIsTouchContainer] & 1) != 0
  }
      || [a1 _accessibilityHasOrderedChildren]
      && [a1 accessibilityElementCount] > 0
      || [a1 accessibilityNavigationStyle] != 0;

  return v4;
}

- (unint64_t)_accessibilityScannerGroupTraits
{
  v2 = [a1 _accessibilityValueForKey:@"UIAccessibilityStorageKeyScannerGroupTraits"];
  v3 = v2;
  if (v2)
  {
    unint64_t v4 = (int)[v2 intValue];
  }
  else if ([a1 accessibilityNavigationStyle] == 2)
  {
    unint64_t v4 = 256;
  }
  else
  {
    unint64_t v4 = (unint64_t)([a1 accessibilityNavigationStyle] == 1) << 7;
  }

  return v4;
}

- (uint64_t)_accessibilitySetIsScannerGroup:()AXScanner
{
  return [a1 _accessibilitySetBoolValue:a3 forKey:@"UIAccessibilityStorageKeyIsScannerGroup"];
}

- (uint64_t)_accessibilitySetScannerGroupTraits:()AXScanner
{
  return [a1 _accessibilitySetIntegerValue:a3 forKey:@"UIAccessibilityStorageKeyScannerGroupTraits"];
}

- (uint64_t)_accessibilityScannerActivateBehavior
{
  v1 = objc_getAssociatedObject(a1, &UIAccessibilityStorageKeyScannerActivateBehavior);
  v2 = v1;
  if (v1) {
    uint64_t v3 = (int)[v1 intValue];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (void)_accessibilitySetScannerActivateBehavior:()AXScanner
{
  objc_msgSend(NSNumber, "numberWithLong:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, &UIAccessibilityStorageKeyScannerActivateBehavior, v2, (void *)1);
}

@end