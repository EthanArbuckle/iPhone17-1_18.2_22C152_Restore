@interface THUIButtonAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)_accessibilitySupportsActivateAction;
- (BOOL)_axCanDismissParentBooksPopoverController;
- (BOOL)_axDismissParentBooksPopoverControllerIfAppropriate;
- (BOOL)accessibilityPerformEscape;
- (BOOL)accessibilityViewIsModal;
- (BOOL)isAccessibilityElement;
- (id)_axParentBooksPopoverController;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)thaxParentBooksPopoverController;
- (int64_t)accessibilityContainerType;
- (void)accessibilityActivate;
- (void)thaxSetParentBooksPopoverController:(id)a3;
@end

@implementation THUIButtonAccessibility

+ (id)tsaxTargetClassName
{
  return @"UIButton";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (id)thaxParentBooksPopoverController
{
  return __TSAccessibilityGetAssociatedObject(self, &unk_573A7E);
}

- (void)thaxSetParentBooksPopoverController:(id)a3
{
}

- (id)_axParentBooksPopoverController
{
  return 0;
}

- (BOOL)_axDismissParentBooksPopoverControllerIfAppropriate
{
  id v2 = [(THUIButtonAccessibility *)self _axParentBooksPopoverController];
  char v3 = objc_opt_respondsToSelector();
  if (v3) {
    [v2 dismissPopoverAnimated:1];
  }
  return v3 & 1;
}

- (BOOL)_axCanDismissParentBooksPopoverController
{
  return objc_opt_respondsToSelector() & 1;
}

- (BOOL)isAccessibilityElement
{
  if ([(THUIButtonAccessibility *)self _axCanDismissParentBooksPopoverController])
  {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)THUIButtonAccessibility;
  return [(THUIButtonAccessibility *)&v4 isAccessibilityElement];
}

- (id)accessibilityLabel
{
  if ([(THUIButtonAccessibility *)self _axCanDismissParentBooksPopoverController])
  {
    CFStringRef v3 = @"popover.view.dimiss.region";
    goto LABEL_7;
  }
  id v4 = [[self tsaxValueForKey:@"_accessibilityImagePath"] lastPathComponent];
  if ([v4 isEqualToString:@"ib_chevron_toc_down"])
  {
    CFStringRef v3 = @"expand.outline.button";
    goto LABEL_7;
  }
  if ([v4 isEqualToString:@"ib_chevron_toc_up"])
  {
    CFStringRef v3 = @"collapse.outline.button";
LABEL_7:
    id result = TSAccessibilityLocalizedString((uint64_t)v3);
    if (result) {
      return result;
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)THUIButtonAccessibility;
  return [(TSUIButtonAccessibility *)&v6 accessibilityLabel];
}

- (id)accessibilityHint
{
  if ([(THUIButtonAccessibility *)self _axCanDismissParentBooksPopoverController])
  {
    return TSAccessibilityLocalizedString(@"popover.view.dimiss.region.hint.iOS");
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)THUIButtonAccessibility;
    return [(THUIButtonAccessibility *)&v4 accessibilityHint];
  }
}

- (int64_t)accessibilityContainerType
{
  v5.receiver = self;
  v5.super_class = (Class)THUIButtonAccessibility;
  id v3 = [(THUIButtonAccessibility *)&v5 accessibilityContainerType];
  if ([(THUIButtonAccessibility *)self _axCanDismissParentBooksPopoverController])
  {
    return 4;
  }
  else
  {
    return (int64_t)v3;
  }
}

- (BOOL)accessibilityViewIsModal
{
  if ([(THUIButtonAccessibility *)self _axCanDismissParentBooksPopoverController])
  {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)THUIButtonAccessibility;
  return [(THUIButtonAccessibility *)&v4 accessibilityViewIsModal];
}

- (BOOL)accessibilityPerformEscape
{
  if ([(THUIButtonAccessibility *)self _axDismissParentBooksPopoverControllerIfAppropriate])
  {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)THUIButtonAccessibility;
  return [(TSUIButtonAccessibility *)&v4 accessibilityPerformEscape];
}

- (BOOL)_accessibilitySupportsActivateAction
{
  if ([(THUIButtonAccessibility *)self _axCanDismissParentBooksPopoverController])
  {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)THUIButtonAccessibility;
  return [(TSUIButtonAccessibility *)&v4 _accessibilitySupportsActivateAction];
}

- (void)accessibilityActivate
{
  if (![(THUIButtonAccessibility *)self _axDismissParentBooksPopoverControllerIfAppropriate])
  {
    v3.receiver = self;
    v3.super_class = (Class)THUIButtonAccessibility;
    [(TSUIButtonAccessibility *)&v3 accessibilityActivate];
  }
}

@end