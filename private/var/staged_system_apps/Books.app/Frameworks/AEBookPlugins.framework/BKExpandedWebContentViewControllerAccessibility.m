@interface BKExpandedWebContentViewControllerAccessibility
+ (Class)imaxBaseSafeCategoryClass;
+ (id)imaxTargetClassName;
- (id)contentView;
@end

@implementation BKExpandedWebContentViewControllerAccessibility

+ (id)imaxTargetClassName
{
  return @"BKExpandedWebContentViewController";
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (id)contentView
{
  v4.receiver = self;
  v4.super_class = (Class)BKExpandedWebContentViewControllerAccessibility;
  v2 = [(BKExpandedWebContentViewControllerAccessibility *)&v4 contentView];
  [v2 imaxSetIdentification:@"PreviewContentView"];

  return v2;
}

@end