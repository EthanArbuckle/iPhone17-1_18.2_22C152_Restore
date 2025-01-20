@interface TSWPopoverControllerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)thaxIsPopoverVisible;
- (THWPopUpContentProviderAccessibility)thaxContentProvider;
- (id)_thaxPreviouslyFocusedElement;
- (id)thaxPopoverParentView;
- (void)_thaxSetPreviouslyFocusedElement:(id)a3;
- (void)dismissPopoverAnimated:(BOOL)a3;
- (void)loadView;
- (void)p_didFade;
- (void)presentPopoverFromRect:(CGRect)a3 inView:(id)a4 viewBounds:(CGRect)a5 permittedArrowDirections:(unint64_t)a6 displayMode:(unint64_t)a7 animated:(BOOL)a8;
- (void)thaxDidPresentPopoverInView:(id)a3;
- (void)thaxDismissPopoverAnimated:(BOOL)a3;
- (void)thaxSetPopoverParentView:(id)a3;
- (void)thaxWillPresentPopoverInView:(id)a3;
@end

@implementation TSWPopoverControllerAccessibility

- (id)thaxPopoverParentView
{
  return __TSAccessibilityGetAssociatedObject(self, &unk_573A5E);
}

- (void)thaxSetPopoverParentView:(id)a3
{
}

- (id)_thaxPreviouslyFocusedElement
{
  return __TSAccessibilityGetAssociatedObject(self, &unk_573A5F);
}

- (void)_thaxSetPreviouslyFocusedElement:(id)a3
{
}

- (void)loadView
{
  v4.receiver = self;
  v4.super_class = (Class)TSWPopoverControllerAccessibility;
  [(TSWPopoverControllerAccessibility *)&v4 loadView];
  id v3 = [(TSWPopoverControllerAccessibility *)self tsaxValueForKey:@"view"];
  [v3 setAccessibilityContainerType:4];
  [v3 setAccessibilityViewIsModal:1];
}

- (void)dismissPopoverAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_28B968;
  v6[3] = &unk_456DE0;
  v6[4] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v6)) {
    abort();
  }
  [+[TSAccessibility sharedInstance] setFirstElementForUpcomingScreenChange:[(TSWPopoverControllerAccessibility *)self _thaxPreviouslyFocusedElement]];
  [(TSWPopoverControllerAccessibility *)self _thaxSetPreviouslyFocusedElement:0];
  v5.receiver = self;
  v5.super_class = (Class)TSWPopoverControllerAccessibility;
  [(TSWPopoverControllerAccessibility *)&v5 dismissPopoverAnimated:v3];
}

- (void)p_didFade
{
  v2.receiver = self;
  v2.super_class = (Class)TSWPopoverControllerAccessibility;
  [(TSWPopoverControllerAccessibility *)&v2 p_didFade];
  UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, 0);
}

- (void)thaxWillPresentPopoverInView:(id)a3
{
  id v4 = [+[TSAccessibility sharedInstance] currentlyFocusedElement];

  [(TSWPopoverControllerAccessibility *)self _thaxSetPreviouslyFocusedElement:v4];
}

- (void)thaxDidPresentPopoverInView:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_28BAA0;
  v3[3] = &unk_456E38;
  v3[4] = a3;
  v3[5] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v3)) {
    abort();
  }
}

+ (id)tsaxTargetClassName
{
  return @"TSWPopoverController";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (BOOL)thaxIsPopoverVisible
{
  return [(TSWPopoverControllerAccessibility *)self tsaxBoolValueForKey:@"isPopoverVisible"];
}

- (THWPopUpContentProviderAccessibility)thaxContentProvider
{
  char v5 = 0;
  BOOL v3 = objc_opt_class();
  result = (THWPopUpContentProviderAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(TSWPopoverControllerAccessibility *)self tsaxValueForKey:@"contentProvider"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (void)thaxDismissPopoverAnimated:(BOOL)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_297C04;
  v3[3] = &unk_457278;
  v3[4] = self;
  BOOL v4 = a3;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v3)) {
    abort();
  }
}

- (void)presentPopoverFromRect:(CGRect)a3 inView:(id)a4 viewBounds:(CGRect)a5 permittedArrowDirections:(unint64_t)a6 displayMode:(unint64_t)a7 animated:(BOOL)a8
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  double v15 = a3.size.height;
  double v16 = a3.size.width;
  double v17 = a3.origin.y;
  double v18 = a3.origin.x;
  uint64_t v20 = a8 & ~[+[TSAccessibility sharedInstance] needsAccessibilityElements];
  if ([(TSWPopoverControllerAccessibility *)self tsaxRespondsToSelector:"thaxWillPresentPopoverInView:" fromExtrasProtocol:&OBJC_PROTOCOL___THWPopoverControllerAccessibilityExtras])[(TSWPopoverControllerAccessibility *)self thaxWillPresentPopoverInView:a4]; {
  v21.receiver = self;
  }
  v21.super_class = (Class)TSWPopoverControllerAccessibility;
  -[TSWPopoverControllerAccessibility presentPopoverFromRect:inView:viewBounds:permittedArrowDirections:displayMode:animated:](&v21, "presentPopoverFromRect:inView:viewBounds:permittedArrowDirections:displayMode:animated:", a4, a6, a7, v20, v18, v17, v16, v15, x, y, width, height);
  if ([(TSWPopoverControllerAccessibility *)self tsaxRespondsToSelector:"thaxDidPresentPopoverInView:" fromExtrasProtocol:&OBJC_PROTOCOL___THWPopoverControllerAccessibilityExtras])[(TSWPopoverControllerAccessibility *)self thaxDidPresentPopoverInView:a4]; {
}
  }

@end