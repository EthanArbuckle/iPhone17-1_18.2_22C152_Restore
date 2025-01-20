@interface BKPDFModernBookViewControllerAccessibility
+ (Class)imaxBaseSafeCategoryClass;
+ (id)imaxTargetClassName;
- (void)toggleBookmark:(id)a3;
@end

@implementation BKPDFModernBookViewControllerAccessibility

+ (id)imaxTargetClassName
{
  return @"BKPDFModernBookViewController";
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (void)toggleBookmark:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BKPDFModernBookViewControllerAccessibility;
  [(BKThumbnailBookViewControllerAccessibility *)&v4 toggleBookmark:a3];
  [(BKThumbnailBookViewControllerAccessibility *)self _updateBookmark];
}

@end