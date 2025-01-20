@interface AENotePopoverEditorControllerAccessibility
+ (Class)imaxBaseSafeCategoryClass;
+ (id)imaxTargetClassName;
- (void)_axClearReferencesToSelfInButtons;
- (void)dealloc;
@end

@implementation AENotePopoverEditorControllerAccessibility

+ (id)imaxTargetClassName
{
  return @"AENotePopoverEditorController";
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (void)_axClearReferencesToSelfInButtons
{
  id v3 = [(AENotePopoverEditorControllerAccessibility *)self imaxValueForKey:@"noteEditorViewController"];
  v2 = [v3 imaxValueForKey:@"textView"];
  [v2 imaxSetParentAnnotationPopoverViewController:0];
}

- (void)dealloc
{
  [(AENotePopoverEditorControllerAccessibility *)self _axClearReferencesToSelfInButtons];
  v3.receiver = self;
  v3.super_class = (Class)AENotePopoverEditorControllerAccessibility;
  [(AENotePopoverEditorControllerAccessibility *)&v3 dealloc];
}

@end