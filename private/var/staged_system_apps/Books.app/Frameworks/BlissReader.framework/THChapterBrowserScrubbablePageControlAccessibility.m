@interface THChapterBrowserScrubbablePageControlAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)_thaxFirstDotSpecialRendering;
- (BOOL)isAccessibilityElement;
- (THChapterBrowserScrubbablePageControlAccessibilityDelegate)thaxDelegate;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)_thaxCurrentPage;
- (unint64_t)accessibilityTraits;
- (unint64_t)thaxNumberOfPages;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
- (void)thaxSetDelegate:(id)a3;
@end

@implementation THChapterBrowserScrubbablePageControlAccessibility

+ (id)tsaxTargetClassName
{
  return @"THChapterBrowserScrubbablePageControl";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (THChapterBrowserScrubbablePageControlAccessibilityDelegate)thaxDelegate
{
  return (THChapterBrowserScrubbablePageControlAccessibilityDelegate *)__TSAccessibilityGetAssociatedObject(self, &unk_573A6B);
}

- (void)thaxSetDelegate:(id)a3
{
}

- (unint64_t)thaxNumberOfPages
{
  return (unint64_t)[(THChapterBrowserScrubbablePageControlAccessibility *)self tsaxUnsignedIntegerValueForKey:@"numberOfPages"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return UIAccessibilityTraitAdjustable;
}

- (id)accessibilityLabel
{
  return THAccessibilityLocalizedString(@"tableofcontents.page.scrubber.label");
}

- (id)accessibilityValue
{
  v3 = [(THChapterBrowserScrubbablePageControlAccessibility *)self thaxDelegate];
  unint64_t v4 = [(THChapterBrowserScrubbablePageControlAccessibility *)self _thaxCurrentPage];
  unint64_t v5 = [(THChapterBrowserScrubbablePageControlAccessibility *)self thaxNumberOfPages];

  return [(THChapterBrowserScrubbablePageControlAccessibilityDelegate *)v3 thaxTitleForPageIndex:v4 numberOfPages:v5];
}

- (void)accessibilityIncrement
{
  v3 = (char *)[(THChapterBrowserScrubbablePageControlAccessibility *)self thaxNumberOfPages] - 1;
  unint64_t v4 = [(THChapterBrowserScrubbablePageControlAccessibility *)self _thaxCurrentPage];
  if ((unint64_t)v3 >= v4 + 1) {
    v3 = (char *)(v4 + 1);
  }
  if (v3 != (char *)[(THChapterBrowserScrubbablePageControlAccessibility *)self _thaxCurrentPage])
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_292C2C;
    v5[3] = &unk_457250;
    v5[4] = self;
    v5[5] = v3;
    if (__TSAccessibilityPerformSafeBlock((uint64_t)v5)) {
      abort();
    }
    TSAccessibilityPostLayoutChangedNotification(0);
  }
}

- (void)accessibilityDecrement
{
  v3 = (char *)[(THChapterBrowserScrubbablePageControlAccessibility *)self _thaxCurrentPage] - 1;
  if (v3 != (char *)[(THChapterBrowserScrubbablePageControlAccessibility *)self _thaxCurrentPage])
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_292CDC;
    v4[3] = &unk_457250;
    v4[4] = self;
    v4[5] = v3;
    if (__TSAccessibilityPerformSafeBlock((uint64_t)v4)) {
      abort();
    }
    TSAccessibilityPostLayoutChangedNotification(0);
  }
}

- (BOOL)_thaxFirstDotSpecialRendering
{
  return [(THChapterBrowserScrubbablePageControlAccessibility *)self tsaxBoolValueForKey:@"firstDotSpecialRendering"];
}

- (unint64_t)_thaxCurrentPage
{
  return (unint64_t)[(THChapterBrowserScrubbablePageControlAccessibility *)self tsaxUnsignedIntegerValueForKey:@"currentPage"];
}

@end