@interface THWPEditingControllerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)editorCanHideEditMenu;
- (BOOL)shouldShowEditMenu;
- (BOOL)thaxCanEditTextString;
- (id)tsaxEditingRepWithCaret;
- (int)canPerformEditorAction:(SEL)a3 withSender:(id)a4;
@end

@implementation THWPEditingControllerAccessibility

- (BOOL)shouldShowEditMenu
{
  if (UIAccessibilityIsVoiceOverRunning()) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)THWPEditingControllerAccessibility;
  return [(THWPEditingControllerAccessibility *)&v4 shouldShowEditMenu];
}

- (BOOL)editorCanHideEditMenu
{
  if (UIAccessibilityIsVoiceOverRunning()) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)THWPEditingControllerAccessibility;
  return [(THWPEditingControllerAccessibility *)&v4 editorCanHideEditMenu];
}

+ (id)tsaxTargetClassName
{
  return @"THWPEditingController";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (BOOL)thaxCanEditTextString
{
  return [(THWPEditingControllerAccessibility *)self tsaxBoolValueForKey:@"canEditTextString"];
}

- (int)canPerformEditorAction:(SEL)a3 withSender:(id)a4
{
  if ([(THWPEditingControllerAccessibility *)self tsaxRespondsToSelector:"thaxCanPerformEditorAction:withSender:" fromExtrasProtocol:&OBJC_PROTOCOL___THWPEditingControllerAccessibilityExtras])
  {
    return [(THWPEditingControllerAccessibility *)self thaxCanPerformEditorAction:a3 withSender:a4];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)THWPEditingControllerAccessibility;
    return [(THWPEditingControllerAccessibility *)&v8 canPerformEditorAction:a3 withSender:a4];
  }
}

- (id)tsaxEditingRepWithCaret
{
  char v6 = 0;
  v3 = (objc_class *)objc_opt_class();
  objc_super v4 = (void *)__TSAccessibilityCastAsClass(v3, (uint64_t)[(THWPEditingControllerAccessibility *)self tsaxValueForKey:@"editingReps"], 1, &v6);
  if (v6) {
    abort();
  }
  return [v4 anyObject];
}

@end