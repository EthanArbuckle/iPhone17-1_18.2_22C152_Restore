@interface THAEHighlightColorEditorControllerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (void)p_removeAnnotation:(id)a3;
@end

@implementation THAEHighlightColorEditorControllerAccessibility

+ (id)tsaxTargetClassName
{
  return @"AEHighlightColorEditorController";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (void)p_removeAnnotation:(id)a3
{
  if (a3)
  {
    if ([(THAEHighlightColorEditorControllerAccessibility *)self tsaxValueForKey:@"thaxOriginatingButton"] == a3)
    {
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_29A05C;
      v6[3] = &unk_456E38;
      v6[4] = self;
      v6[5] = a3;
      if (__TSAccessibilityPerformSafeBlock((uint64_t)v6)) {
        abort();
      }
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)THAEHighlightColorEditorControllerAccessibility;
  [(THAEHighlightColorEditorControllerAccessibility *)&v5 p_removeAnnotation:a3];
}

@end