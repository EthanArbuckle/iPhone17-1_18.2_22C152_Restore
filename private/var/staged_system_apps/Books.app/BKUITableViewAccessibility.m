@interface BKUITableViewAccessibility
+ (Class)imaxBaseSafeCategoryClass;
+ (id)imaxTargetClassName;
@end

@implementation BKUITableViewAccessibility

+ (id)imaxTargetClassName
{
  return @"UITableView";
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

@end