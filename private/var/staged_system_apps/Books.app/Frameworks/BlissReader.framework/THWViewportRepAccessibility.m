@interface THWViewportRepAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)isAccessibilityElement;
- (BOOL)tsaxIsReadyToLoadChildren;
- (THWScrollableCanvasControllerAccessibility)_thaxScrollableCanvasController;
- (id)thaxEmbeddedScrollView;
- (void)tsaxLoadChildrenIntoCollection:(id)a3;
@end

@implementation THWViewportRepAccessibility

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (BOOL)tsaxIsReadyToLoadChildren
{
  return [(THWViewportRepAccessibility *)self thaxEmbeddedScrollView] != 0;
}

- (void)tsaxLoadChildrenIntoCollection:(id)a3
{
  id v5 = [(THWViewportRepAccessibility *)self thaxEmbeddedScrollView];
  if (v5)
  {
    v6 = v5;
    [a3 addObject:v5];
    [v6 setAccessibilityContainer:self];
  }
}

+ (id)tsaxTargetClassName
{
  return @"THWViewportRep";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (id)thaxEmbeddedScrollView
{
  v2 = [(THWViewportRepAccessibility *)self _thaxScrollableCanvasController];

  return [(THWScrollableCanvasControllerAccessibility *)v2 thaxScrollView];
}

- (THWScrollableCanvasControllerAccessibility)_thaxScrollableCanvasController
{
  char v5 = 0;
  v3 = objc_opt_class();
  result = (THWScrollableCanvasControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(TSDRepAccessibility *)self tsaxValueForKey:@"scrollableCanvasController"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

@end