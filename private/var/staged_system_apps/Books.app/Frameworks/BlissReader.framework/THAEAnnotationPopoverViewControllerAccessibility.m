@interface THAEAnnotationPopoverViewControllerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (id)thaxOriginatingButton;
- (void)hide;
- (void)presentFromRect:(CGRect)a3 view:(id)a4;
- (void)thaxSetOriginatingButton:(id)a3;
@end

@implementation THAEAnnotationPopoverViewControllerAccessibility

+ (id)tsaxTargetClassName
{
  return @"AEAnnotationPopoverViewController";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (id)thaxOriginatingButton
{
  return __TSAccessibilityGetAssociatedObject(self, &unk_573A78);
}

- (void)thaxSetOriginatingButton:(id)a3
{
}

- (void)presentFromRect:(CGRect)a3 view:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(THAEAnnotationPopoverViewControllerAccessibility *)self thaxSetOriginatingButton:[+[TSAccessibility sharedInstance] currentlyFocusedElement]];
  v10.receiver = self;
  v10.super_class = (Class)THAEAnnotationPopoverViewControllerAccessibility;
  -[THAEAnnotationPopoverViewControllerAccessibility presentFromRect:view:](&v10, "presentFromRect:view:", a4, x, y, width, height);
}

- (void)hide
{
  [+[TSAccessibility sharedInstance] setFirstElementForUpcomingScreenChange:[(THAEAnnotationPopoverViewControllerAccessibility *)self thaxOriginatingButton]];
  [(THAEAnnotationPopoverViewControllerAccessibility *)self thaxSetOriginatingButton:0];
  v3.receiver = self;
  v3.super_class = (Class)THAEAnnotationPopoverViewControllerAccessibility;
  [(THAEAnnotationPopoverViewControllerAccessibility *)&v3 hide];
}

@end