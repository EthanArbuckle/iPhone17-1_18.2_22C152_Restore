@interface THUIPopoverControllerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (id)_thaxOriginatingButton;
- (void)_axWillDismissPopover;
- (void)_axWillPresentPopover;
- (void)_thaxSetOriginatingButton:(id)a3;
- (void)dimmingViewWasTapped:(id)a3;
- (void)dismissPopoverAnimated:(BOOL)a3;
- (void)presentPopoverFromRect:(CGRect)a3 inView:(id)a4 permittedArrowDirections:(unint64_t)a5 animated:(BOOL)a6;
@end

@implementation THUIPopoverControllerAccessibility

+ (id)tsaxTargetClassName
{
  return @"UIPopoverController";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (id)_thaxOriginatingButton
{
  return __TSAccessibilityGetAssociatedObject(self, &unk_573A7F);
}

- (void)_thaxSetOriginatingButton:(id)a3
{
}

- (void)_axWillPresentPopover
{
  id v3 = [+[TSAccessibility sharedInstance] currentlyFocusedElement];

  [(THUIPopoverControllerAccessibility *)self _thaxSetOriginatingButton:v3];
}

- (void)_axWillDismissPopover
{
  [+[TSAccessibility sharedInstance] setFirstElementForUpcomingScreenChange:[(THUIPopoverControllerAccessibility *)self _thaxOriginatingButton]];

  [(THUIPopoverControllerAccessibility *)self _thaxSetOriginatingButton:0];
}

- (void)presentPopoverFromRect:(CGRect)a3 inView:(id)a4 permittedArrowDirections:(unint64_t)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if ([a4 window])
  {
    [(THUIPopoverControllerAccessibility *)self _axWillPresentPopover];
    v14.receiver = self;
    v14.super_class = (Class)THUIPopoverControllerAccessibility;
    -[THUIPopoverControllerAccessibility presentPopoverFromRect:inView:permittedArrowDirections:animated:](&v14, "presentPopoverFromRect:inView:permittedArrowDirections:animated:", a4, a5, v6, x, y, width, height);
  }
}

- (void)dismissPopoverAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  [(THUIPopoverControllerAccessibility *)self _axWillDismissPopover];
  v5.receiver = self;
  v5.super_class = (Class)THUIPopoverControllerAccessibility;
  [(THUIPopoverControllerAccessibility *)&v5 dismissPopoverAnimated:v3];
}

- (void)dimmingViewWasTapped:(id)a3
{
  [(THUIPopoverControllerAccessibility *)self _axWillDismissPopover];
  v5.receiver = self;
  v5.super_class = (Class)THUIPopoverControllerAccessibility;
  [(THUIPopoverControllerAccessibility *)&v5 dimmingViewWasTapped:a3];
}

@end