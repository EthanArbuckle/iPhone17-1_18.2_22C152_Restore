@interface TSWSelfContainedWPViewControllerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)_thaxNeedsRepSetup;
- (void)_thaxSetNeedsRepSetup:(BOOL)a3;
- (void)interactiveCanvasControllerDidLayout:(id)a3;
- (void)layoutWithFrame:(CGRect)a3;
@end

@implementation TSWSelfContainedWPViewControllerAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSWSelfContainedWPViewController";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_thaxNeedsRepSetup
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_573A70);
}

- (void)_thaxSetNeedsRepSetup:(BOOL)a3
{
}

- (void)layoutWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = [(TSWSelfContainedWPViewControllerAccessibility *)self tsaxValueForKey:@"icc"];
  id v9 = [v8 tsaxValueForKey:@"infosToDisplay"];
  v11.receiver = self;
  v11.super_class = (Class)TSWSelfContainedWPViewControllerAccessibility;
  -[TSWSelfContainedWPViewControllerAccessibility layoutWithFrame:](&v11, "layoutWithFrame:", x, y, width, height);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && ![v9 count])
  {
    id v10 = [v8 tsaxValueForKey:@"infosToDisplay"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v10 count]) {
        [(TSWSelfContainedWPViewControllerAccessibility *)self _thaxSetNeedsRepSetup:1];
      }
    }
  }
}

- (void)interactiveCanvasControllerDidLayout:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TSWSelfContainedWPViewControllerAccessibility;
  [(TSWSelfContainedWPViewControllerAccessibility *)&v7 interactiveCanvasControllerDidLayout:"interactiveCanvasControllerDidLayout:"];
  if ([(TSWSelfContainedWPViewControllerAccessibility *)self _thaxNeedsRepSetup])
  {
    id v5 = [(TSWSelfContainedWPViewControllerAccessibility *)self tsaxValueForKey:@"storage"];
    if (v5)
    {
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_296FA8;
      v6[3] = &unk_456E38;
      v6[4] = a3;
      v6[5] = v5;
      if (__TSAccessibilityPerformSafeBlock((uint64_t)v6)) {
        abort();
      }
    }
    [(TSWSelfContainedWPViewControllerAccessibility *)self _thaxSetNeedsRepSetup:0];
  }
}

@end