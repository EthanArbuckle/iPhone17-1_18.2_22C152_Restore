@interface THWMacOverlayViewHandlerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)thaxIsShowingAlternateUI;
- (NSDictionary)_thaxNameToViewMapping;
- (void)mouseEnteredAtPoint:(CGPoint)a3;
- (void)mouseExitedAtPoint:(CGPoint)a3;
- (void)p_hideOverlay:(id)a3;
- (void)p_showOverlay:(id)a3 withAutoHide:(BOOL)a4;
- (void)thaxHideAllOverlays;
- (void)thaxSetShowingAlternateUI:(BOOL)a3;
- (void)thaxShowAllOverlays;
@end

@implementation THWMacOverlayViewHandlerAccessibility

+ (id)tsaxTargetClassName
{
  return @"THWMacOverlayViewHandler";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (BOOL)thaxIsShowingAlternateUI
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_573A59);
}

- (void)thaxSetShowingAlternateUI:(BOOL)a3
{
}

- (void)thaxShowAllOverlays
{
  v3 = [(NSDictionary *)[(THWMacOverlayViewHandlerAccessibility *)self _thaxNameToViewMapping] allValues];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(NSArray *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * (void)v7);
        v9 = (objc_class *)objc_opt_class();
        uint64_t v10 = __TSAccessibilityCastAsClass(v9, v8, 0, 0);
        v11[0] = _NSConcreteStackBlock;
        v11[1] = 3221225472;
        v11[2] = sub_286EA8;
        v11[3] = &unk_456E38;
        v11[4] = self;
        v11[5] = v10;
        if (__TSAccessibilityPerformSafeBlock((uint64_t)v11)) {
          abort();
        }
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSArray *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
}

- (void)thaxHideAllOverlays
{
  v3 = [(NSDictionary *)[(THWMacOverlayViewHandlerAccessibility *)self _thaxNameToViewMapping] allValues];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(NSArray *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * (void)v7);
        v9 = (objc_class *)objc_opt_class();
        uint64_t v10 = __TSAccessibilityCastAsClass(v9, v8, 0, 0);
        v11[0] = _NSConcreteStackBlock;
        v11[1] = 3221225472;
        v11[2] = sub_28702C;
        v11[3] = &unk_456E38;
        v11[4] = self;
        v11[5] = v10;
        if (__TSAccessibilityPerformSafeBlock((uint64_t)v11)) {
          abort();
        }
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSArray *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
}

- (void)p_showOverlay:(id)a3 withAutoHide:(BOOL)a4
{
  v4.receiver = self;
  v4.super_class = (Class)THWMacOverlayViewHandlerAccessibility;
  [(THWMacOverlayViewHandlerAccessibility *)&v4 p_showOverlay:a3 withAutoHide:a4 & ~[(THWMacOverlayViewHandlerAccessibility *)self thaxIsShowingAlternateUI]];
}

- (void)p_hideOverlay:(id)a3
{
  if (![(THWMacOverlayViewHandlerAccessibility *)self thaxIsShowingAlternateUI])
  {
    v5.receiver = self;
    v5.super_class = (Class)THWMacOverlayViewHandlerAccessibility;
    [(THWMacOverlayViewHandlerAccessibility *)&v5 p_hideOverlay:a3];
  }
}

- (void)mouseEnteredAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (![(THWMacOverlayViewHandlerAccessibility *)self thaxIsShowingAlternateUI])
  {
    v6.receiver = self;
    v6.super_class = (Class)THWMacOverlayViewHandlerAccessibility;
    -[THWMacOverlayViewHandlerAccessibility mouseEnteredAtPoint:](&v6, "mouseEnteredAtPoint:", x, y);
  }
}

- (void)mouseExitedAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (![(THWMacOverlayViewHandlerAccessibility *)self thaxIsShowingAlternateUI])
  {
    v6.receiver = self;
    v6.super_class = (Class)THWMacOverlayViewHandlerAccessibility;
    -[THWMacOverlayViewHandlerAccessibility mouseEnteredAtPoint:](&v6, "mouseEnteredAtPoint:", x, y);
  }
}

- (NSDictionary)_thaxNameToViewMapping
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = [(THWMacOverlayViewHandlerAccessibility *)self tsaxValueForKey:@"nameToViewMapping"];

  return (NSDictionary *)__TSAccessibilityCastAsClass(v3, (uint64_t)v4, 0, 0);
}

@end