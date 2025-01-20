@interface THWAdornmentPanelAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (TSDCanvasViewAccessibility)thaxCanvasView;
- (id)thaxView;
@end

@implementation THWAdornmentPanelAccessibility

+ (id)tsaxTargetClassName
{
  return @"THWAdornmentPanel";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (id)thaxView
{
  return [(THWAdornmentPanelAccessibility *)self tsaxValueForKey:@"view"];
}

- (TSDCanvasViewAccessibility)thaxCanvasView
{
  char v5 = 0;
  v3 = objc_opt_class();
  result = (TSDCanvasViewAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[self tsaxValueForKey:@"autosizedCanvasController"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

@end