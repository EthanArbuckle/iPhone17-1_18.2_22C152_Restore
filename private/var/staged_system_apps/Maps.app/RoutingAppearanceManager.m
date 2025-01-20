@interface RoutingAppearanceManager
+ (id)backgroundViewWithLightMaterial:(int64_t)a3 darkColor:(id)a4;
+ (id)customGrayBlurCellBackgroundView;
+ (id)customGrayBlurCellSelectedBackgroundView;
+ (id)routePreviewStackedViewFont;
+ (void)_getBackgroundView:(id *)a3 selectedBackgroundView:(id *)a4 forCell:(id)a5;
+ (void)configureBackgroundViewForCell:(id)a3;
+ (void)configureBackgroundViewForStepCell:(id)a3;
+ (void)configureBackgroundViewsForOptionsCollectionViewCell:(id)a3;
+ (void)configureBackgroundViewsForOptionsTableViewCell:(id)a3;
@end

@implementation RoutingAppearanceManager

+ (id)customGrayBlurCellBackgroundView
{
  v2 = -[BlurDarkeningBackgroundView initWithFrame:]([BlurDarkeningBackgroundView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [(BlurDarkeningBackgroundView *)v2 setAppearance:4];

  return v2;
}

+ (id)customGrayBlurCellSelectedBackgroundView
{
  v2 = -[BlurDarkeningBackgroundView initWithFrame:]([BlurDarkeningBackgroundView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [(BlurDarkeningBackgroundView *)v2 setAppearance:0];

  return v2;
}

+ (id)routePreviewStackedViewFont
{
  return +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:UIFontTextStyleFootnote addingSymbolicTraits:0];
}

+ (id)backgroundViewWithLightMaterial:(int64_t)a3 darkColor:(id)a4
{
  id v5 = a4;
  v6 = [[RoutingMaterialColorSwitchingView alloc] initWithLightMaterial:a3 darkColor:v5];

  return v6;
}

+ (void)configureBackgroundViewForCell:(id)a3
{
  id v3 = a3;
  if (sub_1000BBB44(v3) == 5)
  {
    objc_initWeak(&location, v3);
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1005020B8;
    v4[3] = &unk_1012E8B98;
    objc_copyWeak(&v5, &location);
    [v3 _setBackgroundViewConfigurationProvider:v4];
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

+ (void)configureBackgroundViewForStepCell:(id)a3
{
  id v3 = a3;
  objc_initWeak(&location, v3);
  if (sub_1000BBB44(v3) == 5)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100502374;
    v7[3] = &unk_1012E8B98;
    v4 = &v8;
    objc_copyWeak(&v8, &location);
    [v3 _setBackgroundViewConfigurationProvider:v7];
  }
  else
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100502580;
    v5[3] = &unk_1012E8B98;
    v4 = &v6;
    objc_copyWeak(&v6, &location);
    [v3 _setBackgroundViewConfigurationProvider:v5];
  }
  objc_destroyWeak(v4);
  objc_destroyWeak(&location);
}

+ (void)configureBackgroundViewsForOptionsTableViewCell:(id)a3
{
  id v4 = a3;
  if (sub_1000BBB44(v4) != 5)
  {
    id v5 = [v4 backgroundView];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      id v9 = 0;
      id v10 = 0;
      [a1 _getBackgroundView:&v10 selectedBackgroundView:&v9 forCell:v4];
      id v7 = v10;
      id v8 = v9;
      [v4 setBackgroundView:v7];
      [v4 setSelectedBackgroundView:v8];
    }
  }
}

+ (void)configureBackgroundViewsForOptionsCollectionViewCell:(id)a3
{
  id v4 = a3;
  if (sub_1000BBB44(v4) != 5)
  {
    id v5 = [v4 backgroundView];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      id v9 = 0;
      id v10 = 0;
      [a1 _getBackgroundView:&v10 selectedBackgroundView:&v9 forCell:v4];
      id v7 = v10;
      id v8 = v9;
      [v4 setBackgroundView:v7];
      [v4 setSelectedBackgroundView:v8];
    }
  }
}

+ (void)_getBackgroundView:(id *)a3 selectedBackgroundView:(id *)a4 forCell:(id)a5
{
  id v31 = a5;
  if (a3)
  {
    id v7 = [RoutePlanningOptionsCellBackgroundView alloc];
    [v31 bounds];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    v16 = +[UIColor secondarySystemGroupedBackgroundColor];
    v17 = -[RoutePlanningOptionsCellBackgroundView initWithFrame:color:](v7, "initWithFrame:color:", v16, v9, v11, v13, v15);

    [(RoutePlanningOptionsCellBackgroundView *)v17 setAutoresizingMask:18];
    v18 = v17;
    *a3 = v18;
  }
  if (a4)
  {
    v19 = [RoutePlanningOptionsCellBackgroundView alloc];
    [v31 bounds];
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
    v28 = +[UIColor colorNamed:@"RouteOptionsCellSelectedBackgroundColor"];
    v29 = -[RoutePlanningOptionsCellBackgroundView initWithFrame:color:](v19, "initWithFrame:color:", v28, v21, v23, v25, v27);

    [(RoutePlanningOptionsCellBackgroundView *)v29 setAutoresizingMask:18];
    v30 = v29;
    *a4 = v30;
  }
}

@end