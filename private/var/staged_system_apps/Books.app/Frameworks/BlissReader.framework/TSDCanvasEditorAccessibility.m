@interface TSDCanvasEditorAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (void)setSelectionToRep:(id)a3;
@end

@implementation TSDCanvasEditorAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSDCanvasEditor";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (void)setSelectionToRep:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)TSDCanvasEditorAccessibility;
  -[TSDCanvasEditorAccessibility setSelectionToRep:](&v11, "setSelectionToRep:");
  char v10 = 0;
  v5 = objc_opt_class();
  Class v6 = __TSAccessibilityCastAsSafeCategory(v5, (uint64_t)[(TSDCanvasEditorAccessibility *)self tsaxValueForKey:@"interactiveCanvasController"], 1, &v10);
  if (v10
    || (Class v7 = v6,
        char v10 = 0,
        v8 = objc_opt_class(),
        Class v9 = __TSAccessibilityCastAsSafeCategory(v8, (uint64_t)a3, 1, &v10),
        v10))
  {
    abort();
  }
  [(objc_class *)v7 tsaxDidFocusRep:v9];
}

@end