@interface AENoteEditorViewControllerAccessibility
+ (Class)imaxBaseSafeCategoryClass;
+ (id)imaxTargetClassName;
- (void)viewDidLoad;
@end

@implementation AENoteEditorViewControllerAccessibility

+ (id)imaxTargetClassName
{
  return @"AENoteEditorViewController";
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)AENoteEditorViewControllerAccessibility;
  [(AENoteEditorViewControllerAccessibility *)&v6 viewDidLoad];
  v3 = [(AENoteEditorViewControllerAccessibility *)self imaxValueForKey:@"textView"];
  v4 = IMAXLocString(@"annotation");
  [v3 setAccessibilityLabel:v4];

  v5 = [(AENoteEditorViewControllerAccessibility *)self imaxValueForKey:@"delegate"];
  [v3 imaxSetParentAnnotationPopoverViewController:v5];
}

@end