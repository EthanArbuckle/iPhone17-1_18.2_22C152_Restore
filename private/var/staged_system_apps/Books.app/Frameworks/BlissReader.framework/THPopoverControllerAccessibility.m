@interface THPopoverControllerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (void)dismissPopoverAnimated:(BOOL)a3;
- (void)presentPopoverFromRect:(CGRect)a3 inView:(id)a4 permittedArrowDirections:(unint64_t)a5 animated:(BOOL)a6;
@end

@implementation THPopoverControllerAccessibility

+ (id)tsaxTargetClassName
{
  return @"THPopoverController";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (void)presentPopoverFromRect:(CGRect)a3 inView:(id)a4 permittedArrowDirections:(unint64_t)a5 animated:(BOOL)a6
{
  v7.receiver = self;
  v7.super_class = (Class)THPopoverControllerAccessibility;
  -[THPopoverControllerAccessibility presentPopoverFromRect:inView:permittedArrowDirections:animated:](&v7, "presentPopoverFromRect:inView:permittedArrowDirections:animated:", a4, a5, a6, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (objc_opt_respondsToSelector()) {
    [(THPopoverControllerAccessibility *)self _axRegisterForDismissPopupNotification];
  }
}

- (void)dismissPopoverAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = self;
  v6.receiver = self;
  v6.super_class = (Class)THPopoverControllerAccessibility;
  [(THPopoverControllerAccessibility *)&v6 dismissPopoverAnimated:v3];
  if (objc_opt_respondsToSelector()) {
    [(THPopoverControllerAccessibility *)self _axRegisterForDismissPopupNotification];
  }
}

@end