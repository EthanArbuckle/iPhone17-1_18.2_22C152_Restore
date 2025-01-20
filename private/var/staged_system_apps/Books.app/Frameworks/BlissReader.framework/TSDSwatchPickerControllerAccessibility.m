@interface TSDSwatchPickerControllerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (void)_tsaxResetSwatchGridViews;
- (void)loadView;
- (void)p_loadScrollViewWithPage:(int64_t)a3;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndScrollingAnimation:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation TSDSwatchPickerControllerAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSDSwatchPickerController";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (void)_tsaxResetSwatchGridViews
{
  id v3 = [(TSDSwatchPickerControllerAccessibility *)self tsaxValueForKey:@"pageControl"];
  v11 = (char *)[v3 tsaxIntegerValueForKey:@"currentPage"];
  v4 = (char *)[(TSDSwatchPickerControllerAccessibility *)self tsaxIntegerValueForKey:@"pageCount"];
  if ((uint64_t)v4 >= 1)
  {
    v5 = v4;
    for (i = 0; i != v5; ++i)
    {
      uint64_t v13 = 0;
      v14 = &v13;
      uint64_t v15 = 0x3052000000;
      v16 = sub_271F1C;
      v17 = sub_271F2C;
      uint64_t v18 = 0;
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_271F38;
      v12[3] = &unk_458E98;
      v12[4] = self;
      v12[5] = &v13;
      v12[6] = i;
      if (__TSAccessibilityPerformSafeBlock((uint64_t)v12)) {
        abort();
      }
      uint64_t v7 = v14[5];
      _Block_object_dispose(&v13, 8);
      LOBYTE(v13) = 0;
      v8 = objc_opt_class();
      Class v9 = __TSAccessibilityCastAsSafeCategory(v8, v7, 1, &v13);
      if ((_BYTE)v13) {
        abort();
      }
      Class v10 = v9;
      [(objc_class *)v9 tsaxInvalidateChildrenImmediately];
      if (v3) {
        [(objc_class *)v10 setAccessibilityElementsHidden:v11 != i];
      }
    }
  }
  UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, 0);
}

- (void)loadView
{
  v6.receiver = self;
  v6.super_class = (Class)TSDSwatchPickerControllerAccessibility;
  [(TSDSwatchPickerControllerAccessibility *)&v6 loadView];
  if ([+[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
  {
    char v5 = 0;
    id v3 = (objc_class *)objc_opt_class();
    v4 = (void *)__TSAccessibilityCastAsClass(v3, (uint64_t)[(TSDSwatchPickerControllerAccessibility *)self tsaxValueForKey:@"swatchesScrollView"], 1, &v5);
    if (v5) {
      abort();
    }
    [v4 tsaxSetScrollStatusPrefersHorizontal:1];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TSDSwatchPickerControllerAccessibility;
  [(TSDSwatchPickerControllerAccessibility *)&v4 viewDidAppear:a3];
  [(TSDSwatchPickerControllerAccessibility *)self _tsaxResetSwatchGridViews];
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TSDSwatchPickerControllerAccessibility;
  [(TSDSwatchPickerControllerAccessibility *)&v4 scrollViewDidEndScrollingAnimation:a3];
  [(TSDSwatchPickerControllerAccessibility *)self _tsaxResetSwatchGridViews];
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TSDSwatchPickerControllerAccessibility;
  [(TSDSwatchPickerControllerAccessibility *)&v4 scrollViewDidEndDecelerating:a3];
  [(TSDSwatchPickerControllerAccessibility *)self _tsaxResetSwatchGridViews];
}

- (void)p_loadScrollViewWithPage:(int64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TSDSwatchPickerControllerAccessibility;
  [(TSDSwatchPickerControllerAccessibility *)&v4 p_loadScrollViewWithPage:a3];
  [(TSDSwatchPickerControllerAccessibility *)self _tsaxResetSwatchGridViews];
}

@end