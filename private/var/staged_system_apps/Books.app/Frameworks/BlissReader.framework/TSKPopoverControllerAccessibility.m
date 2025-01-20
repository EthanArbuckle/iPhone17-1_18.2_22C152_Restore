@interface TSKPopoverControllerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)_accessibilityCanDismissPopoverController:(id)a3;
- (BOOL)popoverControllerShouldDismissPopover:(id)a3;
- (BOOL)tsaxIsPopoverVisible;
- (TSUIButtonAccessibility)_tsaxCachedOriginatingButton;
- (TSUIButtonAccessibility)_tsaxCurrentlyFocusedButton;
- (UIViewController)tsaxContentViewController;
- (void)_tsaxAddToVisiblePopoverControllers;
- (void)_tsaxPopoverWasPresentedFromOriginatingButton:(id)a3;
- (void)_tsaxSetCachedOriginatingButton:(id)a3;
- (void)_tsaxUpdateOriginatingButton:(id)a3;
- (void)_tsaxUpdatePassthroughViewsWithOriginatingButton:(id)a3;
- (void)dealloc;
- (void)popoverControllerDidDismissPopover:(id)a3;
- (void)presentPopoverFromBarButtonItem:(id)a3 permittedArrowDirections:(unint64_t)a4 animated:(BOOL)a5;
- (void)presentPopoverFromRect:(CGRect)a3 inView:(id)a4 permittedArrowDirections:(unint64_t)a5 animated:(BOOL)a6;
- (void)tsaxPopoverControllerDidBecomeInvisible;
@end

@implementation TSKPopoverControllerAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSKPopoverController";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (TSUIButtonAccessibility)_tsaxCachedOriginatingButton
{
  return (TSUIButtonAccessibility *)__TSAccessibilityGetAssociatedObject(self, &unk_5739E0);
}

- (void)_tsaxSetCachedOriginatingButton:(id)a3
{
}

- (BOOL)tsaxIsPopoverVisible
{
  char v6 = 0;
  v3 = (objc_class *)objc_opt_class();
  v4 = (void *)__TSAccessibilityCastAsClass(v3, (uint64_t)self, 1, &v6);
  if (v6) {
    abort();
  }
  return [v4 isPopoverVisible];
}

- (UIViewController)tsaxContentViewController
{
  char v6 = 0;
  v3 = (objc_class *)objc_opt_class();
  v4 = (void *)__TSAccessibilityCastAsClass(v3, (uint64_t)self, 1, &v6);
  if (v6) {
    abort();
  }
  return (UIViewController *)[v4 contentViewController];
}

- (void)tsaxPopoverControllerDidBecomeInvisible
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_26DC08;
  v3[3] = &unk_456DE0;
  v3[4] = [(TSKPopoverControllerAccessibility *)self _tsaxCachedOriginatingButton];
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v3)) {
    abort();
  }
  [(TSKPopoverControllerAccessibility *)self _tsaxSetCachedOriginatingButton:0];
  if (qword_5739E8)
  {
    objc_msgSend((id)qword_5739E8, "removeObject:", +[NSValue valueWithNonretainedObject:](NSValue, "valueWithNonretainedObject:", self));
    if (![(id)qword_5739E8 count])
    {

      qword_5739E8 = 0;
    }
  }
}

- (void)presentPopoverFromRect:(CGRect)a3 inView:(id)a4 permittedArrowDirections:(unint64_t)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v14 = [(TSKPopoverControllerAccessibility *)self _tsaxCurrentlyFocusedButton];
  v15.receiver = self;
  v15.super_class = (Class)TSKPopoverControllerAccessibility;
  -[TSKPopoverControllerAccessibility presentPopoverFromRect:inView:permittedArrowDirections:animated:](&v15, "presentPopoverFromRect:inView:permittedArrowDirections:animated:", a4, a5, v6, x, y, width, height);
  if (![(TSUIButtonAccessibility *)v14 tsaxPreventPopoverAssociation]) {
    [(TSKPopoverControllerAccessibility *)self _tsaxPopoverWasPresentedFromOriginatingButton:v14];
  }
}

- (void)presentPopoverFromBarButtonItem:(id)a3 permittedArrowDirections:(unint64_t)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  v9 = [(TSKPopoverControllerAccessibility *)self _tsaxCurrentlyFocusedButton];
  v10.receiver = self;
  v10.super_class = (Class)TSKPopoverControllerAccessibility;
  [(TSKPopoverControllerAccessibility *)&v10 presentPopoverFromBarButtonItem:a3 permittedArrowDirections:a4 animated:v5];
  if (![(TSUIButtonAccessibility *)v9 tsaxPreventPopoverAssociation]) {
    [(TSKPopoverControllerAccessibility *)self _tsaxPopoverWasPresentedFromOriginatingButton:v9];
  }
}

- (BOOL)popoverControllerShouldDismissPopover:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TSKPopoverControllerAccessibility;
  BOOL v4 = [(TSKPopoverControllerAccessibility *)&v7 popoverControllerShouldDismissPopover:a3];
  if (v4)
  {
    BOOL v5 = [(TSKPopoverControllerAccessibility *)self _tsaxCachedOriginatingButton];
    if (v5) {
      [+[TSAccessibility sharedInstance] setFirstElementForUpcomingScreenChange:v5];
    }
  }
  return v4;
}

- (void)popoverControllerDidDismissPopover:(id)a3
{
  [(TSKPopoverControllerAccessibility *)self tsaxPopoverControllerDidBecomeInvisible];
  v5.receiver = self;
  v5.super_class = (Class)TSKPopoverControllerAccessibility;
  [(TSKPopoverControllerAccessibility *)&v5 popoverControllerDidDismissPopover:a3];
}

- (void)dealloc
{
  [(TSUIButtonAccessibility *)[(TSKPopoverControllerAccessibility *)self _tsaxCachedOriginatingButton] tsaxSetAssociatedPopoverController:0];
  [(TSKPopoverControllerAccessibility *)self tsaxPopoverControllerDidBecomeInvisible];
  v3.receiver = self;
  v3.super_class = (Class)TSKPopoverControllerAccessibility;
  [(TSKPopoverControllerAccessibility *)&v3 dealloc];
}

- (BOOL)_accessibilityCanDismissPopoverController:(id)a3
{
  id v4 = [(TSKPopoverControllerAccessibility *)self tsaxValueForKey:@"mSavedDelegate"];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }

  return [v4 popoverControllerShouldDismissPopover:a3];
}

- (void)_tsaxPopoverWasPresentedFromOriginatingButton:(id)a3
{
  [(TSKPopoverControllerAccessibility *)self _tsaxAddToVisiblePopoverControllers];
  [(TSKPopoverControllerAccessibility *)self _tsaxUpdateOriginatingButton:a3];

  [(TSKPopoverControllerAccessibility *)self _tsaxUpdatePassthroughViewsWithOriginatingButton:a3];
}

- (void)_tsaxAddToVisiblePopoverControllers
{
  objc_super v3 = (void *)qword_5739E8;
  if (!qword_5739E8)
  {
    objc_super v3 = objc_opt_new();
    qword_5739E8 = (uint64_t)v3;
  }
  id v4 = +[NSValue valueWithNonretainedObject:self];

  [v3 addObject:v4];
}

- (void)_tsaxUpdateOriginatingButton:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_26E03C;
  v5[3] = &unk_456E38;
  v5[4] = a3;
  v5[5] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v5)) {
    abort();
  }
  [(TSKPopoverControllerAccessibility *)self _tsaxSetCachedOriginatingButton:a3];
}

- (void)_tsaxUpdatePassthroughViewsWithOriginatingButton:(id)a3
{
  char v33 = 0;
  objc_super v5 = (objc_class *)objc_opt_class();
  BOOL v6 = (void *)__TSAccessibilityCastAsClass(v5, (uint64_t)self, 1, &v33);
  if (v33) {
    abort();
  }
  objc_super v7 = v6;
  v8 = (NSArray *)[v6 passthroughViews];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    v8 = +[NSArray array];
  }
  BOOL IsVoiceOverRunning = UIAccessibilityIsVoiceOverRunning();
  BOOL v10 = IsVoiceOverRunning;
  if (a3 && IsVoiceOverRunning && ![(NSArray *)v8 containsObject:a3]) {
    v8 = [(NSArray *)v8 arrayByAddingObject:a3];
  }
  v11 = objc_opt_new();
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v12 = [(NSArray *)v8 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v30;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v30 != v14) {
          objc_enumerationMutation(v8);
        }
        v16 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        if (!v10) {
          goto LABEL_16;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_16;
        }
        [v16 frame];
        CGFloat v18 = v17;
        CGFloat v20 = v19;
        CGFloat v22 = v21;
        CGFloat v24 = v23;
        objc_msgSend(objc_msgSend(v16, "window"), "bounds");
        v36.origin.double x = v25;
        v36.origin.double y = v26;
        v36.size.double width = v27;
        v36.size.double height = v28;
        v35.origin.double x = v18;
        v35.origin.double y = v20;
        v35.size.double width = v22;
        v35.size.double height = v24;
        if (!CGRectContainsRect(v35, v36)) {
LABEL_16:
        }
          [v11 addObject:v16];
      }
      id v13 = [(NSArray *)v8 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v13);
  }
  [v7 setPassthroughViews:v11];
}

- (TSUIButtonAccessibility)_tsaxCurrentlyFocusedButton
{
  v2 = (objc_class *)objc_opt_class();
  id v3 = [+[TSAccessibility sharedInstance] currentlyFocusedElement];

  return (TSUIButtonAccessibility *)__TSAccessibilityCastAsClass(v2, (uint64_t)v3, 0, 0);
}

@end