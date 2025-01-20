@interface THFlowTOCTableViewCellAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (void)p_setupContentView;
@end

@implementation THFlowTOCTableViewCellAccessibility

+ (id)tsaxTargetClassName
{
  return @"THFlowTOCTableViewCell";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (void)p_setupContentView
{
  v3.receiver = self;
  v3.super_class = (Class)THFlowTOCTableViewCellAccessibility;
  [(THFlowTOCTableViewCellAccessibility *)&v3 p_setupContentView];
  [-[THFlowTOCTableViewCellAccessibility tsaxValueForKey:](self tsaxValueForKey:@"openCloseButton", "setAccessibilityLabel:", THAccessibilityLocalizedString(@"open.close.chapter.button")];
}

@end