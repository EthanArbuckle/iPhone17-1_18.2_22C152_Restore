@interface THPageThumbnailViewAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)_thaxIsCurrentPage;
- (BOOL)_thaxIsFirstThumbnail;
- (BOOL)isAccessibilityElement;
- (NSString)thaxLocalizedPageNumber;
- (UILabel)_thaxPageNumberLabel;
- (id)_thaxPageNumberView;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation THPageThumbnailViewAccessibility

+ (id)tsaxTargetClassName
{
  return @"THPageThumbnailView";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (NSString)thaxLocalizedPageNumber
{
  v2 = [(THPageThumbnailViewAccessibility *)self _thaxPageNumberLabel];

  return [(UILabel *)v2 text];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v3 = [(THPageThumbnailViewAccessibility *)self thaxLocalizedPageNumber];
  if ([(NSString *)v3 length]) {
    v4 = +[NSString stringWithFormat:TSAccessibilityLocalizedString(@"page.number %@"), v3];
  }
  else {
    v4 = 0;
  }
  if (![(THPageThumbnailViewAccessibility *)self _thaxIsFirstThumbnail]) {
    return v4;
  }
  v5 = THAccessibilityLocalizedString(@"chapter.first.page");
  return __TSAccessibilityStringForVariables(1, v4, v6, v7, v8, v9, v10, v11, (uint64_t)v5);
}

- (unint64_t)accessibilityTraits
{
  v7.receiver = self;
  v7.super_class = (Class)THPageThumbnailViewAccessibility;
  unint64_t v3 = [(THPageThumbnailViewAccessibility *)&v7 accessibilityTraits];
  unsigned int v4 = [(THPageThumbnailViewAccessibility *)self _thaxIsCurrentPage];
  UIAccessibilityTraits v5 = UIAccessibilityTraitSelected;
  if (!v4) {
    UIAccessibilityTraits v5 = 0;
  }
  return v5 | v3;
}

- (BOOL)_thaxIsCurrentPage
{
  id v2 = [(THPageThumbnailViewAccessibility *)self _thaxPageNumberView];

  return [v2 tsaxBoolValueForKey:@"isCurrentPage"];
}

- (BOOL)_thaxIsFirstThumbnail
{
  return [(THPageThumbnailViewAccessibility *)self tsaxUnsignedIntegerValueForKey:@"pageIndex"] == 0;
}

- (UILabel)_thaxPageNumberLabel
{
  char v5 = 0;
  unint64_t v3 = (objc_class *)objc_opt_class();
  result = (UILabel *)__TSAccessibilityCastAsClass(v3, (uint64_t)[-[THPageThumbnailViewAccessibility _thaxPageNumberView](self, "_thaxPageNumberView") tsaxValueForKey:@"label"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (id)_thaxPageNumberView
{
  return [(THPageThumbnailViewAccessibility *)self tsaxValueForKey:@"mPageNumberView"];
}

@end