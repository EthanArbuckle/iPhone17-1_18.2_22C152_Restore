@interface THNSObjectAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
+ (void)tsaxAddSafeCategoryDependenciesToCollection:(id)a3;
- (BOOL)_accessibilityUsesChildrenFramesForSorting;
- (BOOL)_accessibilityUsesScrollParentForOrdering;
- (BOOL)_axShouldTreatAsCustomItemForTextElement;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityContainerForAccumulatingCustomRotorItems;
- (id)_accessibilityScrollAncestorForSelector:(SEL)a3;
- (id)_axAncestorPassingTest:(id)a3;
- (id)accessibilityContainer;
- (id)thaxParentRep;
- (id)tsaxAncestorView;
- (void)_axEnumerateAncestorsUsingBlock:(id)a3;
- (void)_axHandleCustomItemDidBecomeFocused;
- (void)accessibilityElementDidBecomeFocused;
@end

@implementation THNSObjectAccessibility

+ (void)tsaxAddSafeCategoryDependenciesToCollection:(id)a3
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___THNSObjectAccessibility;
  [super tsaxAddSafeCategoryDependenciesToCollection:];
  [a3 addObject:@"TSNSObjectAccessibility_iOS"];
}

- (void)_axEnumerateAncestorsUsingBlock:(id)a3
{
  char v5 = 0;
  if (self)
  {
    objc_super v4 = self;
    do
    {
      (*((void (**)(id, THNSObjectAccessibility *, char *))a3 + 2))(a3, v4, &v5);
      if (v5) {
        break;
      }
      objc_super v4 = (THNSObjectAccessibility *)[(THNSObjectAccessibility *)v4 tsaxValueForKey:@"accessibilityContainer"];
    }
    while (v4);
  }
}

- (id)_axAncestorPassingTest:(id)a3
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3052000000;
  v9 = sub_292284;
  v10 = sub_292294;
  uint64_t v11 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_2922A0;
  v5[3] = &unk_46C778;
  v5[4] = a3;
  v5[5] = &v6;
  [(THNSObjectAccessibility *)self _axEnumerateAncestorsUsingBlock:v5];
  v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)accessibilityElementDidBecomeFocused
{
  v3.receiver = self;
  v3.super_class = (Class)THNSObjectAccessibility;
  [(THNSObjectAccessibility *)&v3 accessibilityElementDidBecomeFocused];
  if ([+[TSAccessibility sharedInstance] _firstElementForUpcomingPageTurn] == self)[(THNSObjectAccessibility *)self tsaxValueForKey:@"_accessibilityScrollToVisible"]; {
  [(THNSObjectAccessibility *)self _axHandleCustomItemDidBecomeFocused];
  }
}

- (BOOL)_accessibilityUsesScrollParentForOrdering
{
  [(THNSObjectAccessibility *)self tsaxValueForKey:@"accessibilityContainer"];
  NSClassFromString(@"TSDCanvasView");
  if (objc_opt_isKindOfClass()) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)THNSObjectAccessibility;
  return [(THNSObjectAccessibility *)&v4 _accessibilityUsesScrollParentForOrdering];
}

- (BOOL)_accessibilityUsesChildrenFramesForSorting
{
  return [(THNSObjectAccessibility *)self thaxUsesChildrenFramesForSorting];
}

- (id)thaxParentRep
{
  return 0;
}

- (BOOL)_axShouldTreatAsCustomItemForTextElement
{
  return 0;
}

- (BOOL)isAccessibilityElement
{
  if ([(THNSObjectAccessibility *)self _axShouldTreatAsCustomItemForTextElement])
  {
    return [(THNSObjectAccessibility *)self thaxParentRep] != 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)THNSObjectAccessibility;
  return [(THNSObjectAccessibility *)&v4 isAccessibilityElement];
}

- (id)_accessibilityScrollAncestorForSelector:(SEL)a3
{
  if (!-[THNSObjectAccessibility _axShouldTreatAsCustomItemForTextElement](self, "_axShouldTreatAsCustomItemForTextElement")|| (id result = objc_msgSend(-[THNSObjectAccessibility thaxParentRep](self, "thaxParentRep"), "_accessibilityScrollAncestorForSelector:", a3)) == 0)
  {
    v6.receiver = self;
    v6.super_class = (Class)THNSObjectAccessibility;
    return [(THNSObjectAccessibility *)&v6 _accessibilityScrollAncestorForSelector:a3];
  }
  return result;
}

- (id)accessibilityContainer
{
  if (![(THNSObjectAccessibility *)self _axShouldTreatAsCustomItemForTextElement])
  {
    v5.receiver = self;
    v5.super_class = (Class)THNSObjectAccessibility;
    return [(THNSObjectAccessibility *)&v5 accessibilityContainer];
  }
  id v3 = [(THNSObjectAccessibility *)self thaxParentRep];
  if ([v3 isAccessibilityElement]) {
    return v3;
  }

  return [v3 tsaxValueForKey:@"accessibilityContainer"];
}

- (id)_accessibilityContainerForAccumulatingCustomRotorItems
{
  if (![(THNSObjectAccessibility *)self _axShouldTreatAsCustomItemForTextElement]|| (id result = [(THNSObjectAccessibility *)self thaxParentRep]) == 0)
  {
    v4.receiver = self;
    v4.super_class = (Class)THNSObjectAccessibility;
    return [(THNSObjectAccessibility *)&v4 _accessibilityContainerForAccumulatingCustomRotorItems];
  }
  return result;
}

- (id)tsaxAncestorView
{
  if (!-[THNSObjectAccessibility _axShouldTreatAsCustomItemForTextElement](self, "_axShouldTreatAsCustomItemForTextElement")|| (id result = objc_msgSend(-[THNSObjectAccessibility thaxParentRep](self, "thaxParentRep"), "tsaxValueForKey:", @"accessibilityContainer")) == 0)
  {
    v4.receiver = self;
    v4.super_class = (Class)THNSObjectAccessibility;
    return [(THNSObjectAccessibility *)&v4 tsaxAncestorView];
  }
  return result;
}

- (void)_axHandleCustomItemDidBecomeFocused
{
  if ([(THNSObjectAccessibility *)self _axShouldTreatAsCustomItemForTextElement])
  {
    id v3 = [(THNSObjectAccessibility *)self thaxParentRep];
    if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
    {
      id v4 = [v3 _axSelectedTextRange];
      [v3 _axSetSelectedTextRange:v4];
    }
  }
}

+ (id)tsaxTargetClassName
{
  return @"NSObject";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

@end