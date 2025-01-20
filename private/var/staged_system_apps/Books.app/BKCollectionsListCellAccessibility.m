@interface BKCollectionsListCellAccessibility
+ (Class)imaxBaseSafeCategoryClass;
+ (id)imaxTargetClassName;
- (unint64_t)accessibilityTraits;
@end

@implementation BKCollectionsListCellAccessibility

+ (id)imaxTargetClassName
{
  return @"BKCollectionsListCell";
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)accessibilityTraits
{
  v12.receiver = self;
  v12.super_class = (Class)BKCollectionsListCellAccessibility;
  unint64_t v3 = [(BKCollectionsListCellAccessibility *)&v12 accessibilityTraits];
  __int16 v11 = 10003;
  id v4 = [objc_alloc((Class)NSString) initWithCharacters:&v11 length:1];
  v5 = [(BKCollectionsListCellAccessibility *)self accessoryView];
  v6 = [v5 accessibilityLabel];
  unsigned int v7 = [v6 isEqualToString:v4];

  UIAccessibilityTraits v8 = UIAccessibilityTraitSelected;
  if (!v7) {
    UIAccessibilityTraits v8 = 0;
  }
  unint64_t v9 = v8 | v3;

  return v9;
}

@end