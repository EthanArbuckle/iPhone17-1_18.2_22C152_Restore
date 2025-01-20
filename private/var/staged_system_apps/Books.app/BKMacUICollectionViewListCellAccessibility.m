@interface BKMacUICollectionViewListCellAccessibility
+ (Class)imaxBaseSafeCategoryClass;
+ (id)imaxTargetClassName;
- (BOOL)_isNewCollectionItem;
- (id)_bkaxIndexPath;
- (id)_bkaxParent;
- (id)_bkaxTarget;
- (unint64_t)accessibilityTraits;
- (void)accessibilityElementDidBecomeFocused;
@end

@implementation BKMacUICollectionViewListCellAccessibility

+ (id)imaxTargetClassName
{
  return @"UICollectionViewListCell";
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (void)accessibilityElementDidBecomeFocused
{
  v5.receiver = self;
  v5.super_class = (Class)BKMacUICollectionViewListCellAccessibility;
  [(BKMacUICollectionViewListCellAccessibility *)&v5 accessibilityElementDidBecomeFocused];
  dispatch_time_t v3 = dispatch_time(0, 500000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100126490;
  block[3] = &unk_100A43D60;
  block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (unint64_t)accessibilityTraits
{
  v7.receiver = self;
  v7.super_class = (Class)BKMacUICollectionViewListCellAccessibility;
  unint64_t v3 = [(BKMacUICollectionViewListCellAccessibility *)&v7 accessibilityTraits];
  unsigned int v4 = [(BKMacUICollectionViewListCellAccessibility *)self _isNewCollectionItem];
  UIAccessibilityTraits v5 = UIAccessibilityTraitButton;
  if (!v4) {
    UIAccessibilityTraits v5 = 0;
  }
  return v5 | v3;
}

- (id)_bkaxTarget
{
  objc_opt_class();
  v2 = __IMAccessibilityCastAsClass();

  return v2;
}

- (id)_bkaxParent
{
  objc_opt_class();
  unint64_t v3 = [(BKMacUICollectionViewListCellAccessibility *)self _bkaxTarget];
  unsigned int v4 = [v3 superview];
  UIAccessibilityTraits v5 = __IMAccessibilityCastAsClass();

  return v5;
}

- (id)_bkaxIndexPath
{
  unint64_t v3 = [(BKMacUICollectionViewListCellAccessibility *)self _bkaxParent];
  unsigned int v4 = [(BKMacUICollectionViewListCellAccessibility *)self _bkaxTarget];
  UIAccessibilityTraits v5 = [v3 indexPathForCell:v4];

  return v5;
}

- (BOOL)_isNewCollectionItem
{
  v2 = [(BKMacUICollectionViewListCellAccessibility *)self _bkaxTarget];
  unint64_t v3 = [v2 accessibilityIdentifier];
  unsigned __int8 v4 = [v3 isEqualToString:@"newCollection"];

  return v4;
}

@end