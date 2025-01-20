@interface AENoteFullscreenEditorControllerAccessibility
+ (Class)imaxBaseSafeCategoryClass;
+ (id)imaxTargetClassName;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewDidLoad;
@end

@implementation AENoteFullscreenEditorControllerAccessibility

+ (id)imaxTargetClassName
{
  return @"AENoteFullscreenEditorController";
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)AENoteFullscreenEditorControllerAccessibility;
  [(AENoteFullscreenEditorControllerAccessibility *)&v3 viewDidLoad];
  [(AENoteFullscreenEditorControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  id v3 = [(AENoteFullscreenEditorControllerAccessibility *)self imaxValueForKey:@"textView"];
  v2 = AEAXLocString(@"note.text.view.label");
  [v3 setAccessibilityLabel:v2];
}

@end