@interface IMUIViewAccessibility
+ (Class)imaxBaseSafeCategoryClass;
+ (id)imaxTargetClassName;
- (BOOL)_accessibilityEscape;
- (BOOL)accessibilityPerformEscape;
@end

@implementation IMUIViewAccessibility

+ (id)imaxTargetClassName
{
  return @"UIView";
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityPerformEscape
{
  v3 = [(IMUIViewAccessibility *)self imaxIdentification];
  if ([v3 isEqualToString:@"AENoteWindow"])
  {
    v4 = +[NSNotificationCenter defaultCenter];
    [v4 postNotificationName:AEAnnotationPopoverShouldHideNotification object:0];

LABEL_4:
    char v5 = 1;
    goto LABEL_8;
  }
  v8.receiver = self;
  v8.super_class = (Class)IMUIViewAccessibility;
  if ([(IMUIViewAccessibility *)&v8 accessibilityPerformEscape]) {
    goto LABEL_4;
  }
  v6 = [(IMUIViewAccessibility *)self imaxValueForKey:@"imaxParentAnnotationPopoverViewController"];
  char v5 = objc_opt_respondsToSelector();
  if (v5)
  {
    [v6 hide];
    UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, 0);
  }

LABEL_8:
  return v5 & 1;
}

- (BOOL)_accessibilityEscape
{
  return [(IMUIViewAccessibility *)self accessibilityPerformEscape];
}

@end