@interface THUIViewAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
+ (void)tsaxAddSafeCategoryDependenciesToCollection:(id)a3;
- (BOOL)_accessibilitySupportsActivateAction;
- (BOOL)_thaxCanDismissPresentedWidgetPopoverController;
- (BOOL)_thaxDismissPresentedWidgetPopoverControllerIfAppropriate;
- (BOOL)_thaxIsDescendentOfExpandedViewController;
- (BOOL)_thaxIsPerformingHitTest;
- (BOOL)accessibilityPerformEscape;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)thaxCoversParentView;
- (BOOL)thaxShouldPreceedSiblingsForHitTesting;
- (THUIViewAccessibilityContainerElementsDataSource)thaxContainerElementsDataSource;
- (id)__accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)_thaxPresentedWidgetPopoverController;
- (id)accessibilityElements;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)subviews;
- (id)thaxDocumentViewController;
- (int64_t)accessibilityContainerType;
- (void)_thaxSetPerformingHitTest:(BOOL)a3;
- (void)_thaxSetPresentedWidgetPopoverController:(id)a3;
- (void)accessibilityActivate;
- (void)dealloc;
- (void)thaxSetContainerElementsDataSource:(id)a3;
- (void)thaxSetCoversParentView:(BOOL)a3;
- (void)thaxSetPresentedWidgetPopoverController:(id)a3;
- (void)thaxSetShouldPreceedSiblingsForHitTesting:(BOOL)a3;
@end

@implementation THUIViewAccessibility

+ (id)tsaxTargetClassName
{
  return @"UIView";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

+ (void)tsaxAddSafeCategoryDependenciesToCollection:(id)a3
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___THUIViewAccessibility;
  [super tsaxAddSafeCategoryDependenciesToCollection:];
  [a3 addObject:@"TSUIViewAccessibility"];
}

- (void)dealloc
{
  [(THUIViewAccessibility *)self thaxSetPresentedWidgetPopoverController:0];
  v3.receiver = self;
  v3.super_class = (Class)THUIViewAccessibility;
  [(THUIViewAccessibility *)&v3 dealloc];
}

- (THUIViewAccessibilityContainerElementsDataSource)thaxContainerElementsDataSource
{
  return (THUIViewAccessibilityContainerElementsDataSource *)__TSAccessibilityGetAssociatedObject(self, &unk_573A83);
}

- (void)thaxSetContainerElementsDataSource:(id)a3
{
}

- (BOOL)thaxCoversParentView
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_573A84);
}

- (void)thaxSetCoversParentView:(BOOL)a3
{
}

- (BOOL)thaxShouldPreceedSiblingsForHitTesting
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_573A85);
}

- (void)thaxSetShouldPreceedSiblingsForHitTesting:(BOOL)a3
{
}

- (BOOL)_thaxIsPerformingHitTest
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_573A86);
}

- (void)_thaxSetPerformingHitTest:(BOOL)a3
{
}

- (id)_thaxPresentedWidgetPopoverController
{
  return __TSAccessibilityGetAssociatedObject(self, &unk_573A87);
}

- (void)_thaxSetPresentedWidgetPopoverController:(id)a3
{
}

- (void)thaxSetPresentedWidgetPopoverController:(id)a3
{
  [self _thaxPresentedWidgetPopoverController].thaxSetPopoverParentView:0;
  [a3 thaxSetPopoverParentView:self];

  [(THUIViewAccessibility *)self _thaxSetPresentedWidgetPopoverController:a3];
}

- (id)thaxDocumentViewController
{
  id v2 = [NSClassFromString(@"THApplePubAssetPlugin") tsaxValueForKey:@"sharedPlugin"] tsaxValueForKey:@"currentBook"];

  return [v2 tsaxValueForKey:@"documentViewController"];
}

- (BOOL)_thaxIsDescendentOfExpandedViewController
{
  id v2 = self;
  id v3 = [[self thaxDocumentViewController] thaxExpandedViewController];
  if (v3)
  {
    objc_super v4 = (THUIViewAccessibility *)[v3 view];
    LOBYTE(v3) = v2 != 0;
    if (v2)
    {
      if (v4 != v2)
      {
        do
        {
          id v2 = (THUIViewAccessibility *)[(THUIViewAccessibility *)v2 superview];
          LOBYTE(v3) = v2 != 0;
        }
        while (v2 && v2 != v4);
      }
    }
  }
  return (char)v3;
}

- (BOOL)_thaxDismissPresentedWidgetPopoverControllerIfAppropriate
{
  id v2 = [(THUIViewAccessibility *)self thaxPresentedWidgetPopoverController];
  char v3 = objc_opt_respondsToSelector();
  if (v3) {
    [v2 dismissPopoverAnimated:1];
  }
  return v3 & 1;
}

- (BOOL)_thaxCanDismissPresentedWidgetPopoverController
{
  return objc_opt_respondsToSelector() & 1;
}

- (id)accessibilityLabel
{
  if ([(THUIViewAccessibility *)self _thaxCanDismissPresentedWidgetPopoverController])
  {
    return TSAccessibilityLocalizedString(@"popover.view.dimiss.region");
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)THUIViewAccessibility;
    return [(THUIViewAccessibility *)&v4 accessibilityLabel];
  }
}

- (id)accessibilityHint
{
  if ([(THUIViewAccessibility *)self _thaxCanDismissPresentedWidgetPopoverController])
  {
    return TSAccessibilityLocalizedString(@"popover.view.dimiss.region.hint.iOS");
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)THUIViewAccessibility;
    return [(THUIViewAccessibility *)&v4 accessibilityHint];
  }
}

- (int64_t)accessibilityContainerType
{
  v5.receiver = self;
  v5.super_class = (Class)THUIViewAccessibility;
  id v3 = [(THUIViewAccessibility *)&v5 accessibilityContainerType];
  if ([(THUIViewAccessibility *)self _thaxCanDismissPresentedWidgetPopoverController])
  {
    return 4;
  }
  else
  {
    return (int64_t)v3;
  }
}

- (BOOL)accessibilityPerformEscape
{
  if ([(THUIViewAccessibility *)self _thaxDismissPresentedWidgetPopoverControllerIfAppropriate])
  {
    goto LABEL_9;
  }
  v7.receiver = self;
  v7.super_class = (Class)THUIViewAccessibility;
  if ([(THUIViewAccessibility *)&v7 accessibilityPerformEscape]) {
    goto LABEL_9;
  }
  if ([(THUIViewAccessibility *)self _thaxIsDescendentOfExpandedViewController])
  {
    id v3 = [(THUIViewAccessibility *)self thaxDocumentViewController];
    if (v3)
    {
      [v3 thaxDismissExpandedViewController];
LABEL_9:
      LOBYTE(v4) = 1;
      return v4;
    }
  }
  unsigned int v4 = [[self accessibilityIdentifier] isEqualToString:@"ChapterFlipView"];
  if (v4)
  {
    id v5 = [(THUIViewAccessibility *)self tsaxValueForKey:@"superview"];
    NSClassFromString(@"THFlipViewTransition");
    if (objc_opt_isKindOfClass())
    {
      [v5 tsaxValueForKey:@"flipClosed"];
      UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, 0);
      goto LABEL_9;
    }
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (BOOL)_accessibilitySupportsActivateAction
{
  if ([(THUIViewAccessibility *)self _thaxCanDismissPresentedWidgetPopoverController])
  {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)THUIViewAccessibility;
  return [(THUIViewAccessibility *)&v4 _accessibilitySupportsActivateAction];
}

- (void)accessibilityActivate
{
  if (![(THUIViewAccessibility *)self _thaxDismissPresentedWidgetPopoverControllerIfAppropriate])
  {
    v3.receiver = self;
    v3.super_class = (Class)THUIViewAccessibility;
    [(THUIViewAccessibility *)&v3 accessibilityActivate];
  }
}

- (id)accessibilityElements
{
  objc_super v3 = [(THUIViewAccessibility *)self thaxContainerElementsDataSource];
  if (objc_opt_respondsToSelector())
  {
    return [(THUIViewAccessibilityContainerElementsDataSource *)v3 thaxContainerElementsForView:self];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)THUIViewAccessibility;
    return [(THUIViewAccessibility *)&v5 accessibilityElements];
  }
}

- (id)__accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  BOOL v8 = [(THUIViewAccessibility *)self _thaxIsPerformingHitTest];
  [(THUIViewAccessibility *)self _thaxSetPerformingHitTest:1];
  v11.receiver = self;
  v11.super_class = (Class)THUIViewAccessibility;
  id v9 = -[THUIViewAccessibility __accessibilityHitTest:withEvent:](&v11, "__accessibilityHitTest:withEvent:", a4, x, y);
  [(THUIViewAccessibility *)self _thaxSetPerformingHitTest:v8];
  return v9;
}

- (id)subviews
{
  v25.receiver = self;
  v25.super_class = (Class)THUIViewAccessibility;
  objc_super v3 = [(THUIViewAccessibility *)&v25 subviews];
  if ([(THUIViewAccessibility *)self _thaxIsPerformingHitTest])
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v4 = [(NSArray *)v3 countByEnumeratingWithState:&v21 objects:v27 count:16];
    if (v4)
    {
      id v5 = v4;
      v6 = 0;
      uint64_t v7 = *(void *)v22;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v22 != v7) {
            objc_enumerationMutation(v3);
          }
          id v9 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if ([v9 thaxShouldPreceedSiblingsForHitTesting])
          {
            if (!v6) {
              v6 = objc_opt_new();
            }
            [v6 addObject:v9];
          }
        }
        id v5 = [(NSArray *)v3 countByEnumeratingWithState:&v21 objects:v27 count:16];
      }
      while (v5);
      if (v6)
      {
        v10 = objc_opt_new();
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        id v11 = [(NSArray *)v3 countByEnumeratingWithState:&v17 objects:v26 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v18;
          do
          {
            for (j = 0; j != v12; j = (char *)j + 1)
            {
              if (*(void *)v18 != v13) {
                objc_enumerationMutation(v3);
              }
              v15 = *(void **)(*((void *)&v17 + 1) + 8 * (void)j);
              if (([v15 thaxShouldPreceedSiblingsForHitTesting] & 1) == 0) {
                [v10 addObject:v15];
              }
            }
            id v12 = [(NSArray *)v3 countByEnumeratingWithState:&v17 objects:v26 count:16];
          }
          while (v12);
        }
        [v10 addObjectsFromArray:v6];
        objc_super v3 = +[NSArray arrayWithArray:v10];
      }
    }
  }
  return v3;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  if ([(THUIViewAccessibility *)self thaxCoversParentView]
    && [(THUIViewAccessibility *)self _thaxIsPerformingHitTest])
  {
    id v8 = [(THUIViewAccessibility *)self superview];
    [v8 convertPoint:self x:y];
    return [v8 pointInside:a4];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)THUIViewAccessibility;
    return -[THUIViewAccessibility pointInside:withEvent:](&v10, "pointInside:withEvent:", a4, x, y);
  }
}

@end