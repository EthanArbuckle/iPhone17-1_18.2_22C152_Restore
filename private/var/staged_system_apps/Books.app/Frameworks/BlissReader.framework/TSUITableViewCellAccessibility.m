@interface TSUITableViewCellAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (void)editControlWasClicked:(id)a3;
@end

@implementation TSUITableViewCellAccessibility

+ (id)tsaxTargetClassName
{
  return @"UITableViewCell";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (void)editControlWasClicked:(id)a3
{
  v5 = self;
  v6.receiver = self;
  v6.super_class = (Class)TSUITableViewCellAccessibility;
  [(TSUITableViewCellAccessibility *)&v6 editControlWasClicked:a3];
}

@end