@interface BCMetrics
+ (id)_manager;
+ (id)_metricsTemplateURL;
+ (id)_templateFactory;
+ (id)_templatePackageURL;
+ (id)supportedMetrics;
+ (void)registerNamedColorsWithTemplateManger:(id)a3;
- (BCLayoutMetrics)metrics;
- (BCMetrics)initWithObserver:(id)a3;
- (BOOL)compactWidth;
- (BOOL)updateIfNeededWithEnvironment:(id)a3;
- (BOOL)updateIfNeededWithViewController:(id)a3;
- (NSDictionary)computedMetrics;
- (id)metricsTemplateURL;
- (void)setMetrics:(id)a3;
@end

@implementation BCMetrics

+ (id)_manager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_113C0;
  block[3] = &unk_2C3BB8;
  block[4] = a1;
  if (qword_345530 != -1) {
    dispatch_once(&qword_345530, block);
  }
  v2 = (void *)qword_345528;

  return v2;
}

+ (void)registerNamedColorsWithTemplateManger:(id)a3
{
  id v3 = a3;
  v4 = [v3 colorRegistry];
  v5 = +[UIColor bc_booksBackground];
  [v4 registerColor:v5 withName:@"booksBackground"];

  v6 = [v3 colorRegistry];
  v7 = +[UIColor bc_booksSecondaryBackground];
  [v6 registerColor:v7 withName:@"booksSecondaryBackground"];

  v8 = [v3 colorRegistry];
  v9 = +[UIColor bc_booksTertiaryBackground];
  [v8 registerColor:v9 withName:@"booksTertiaryBackground"];

  v10 = [v3 colorRegistry];
  v11 = +[UIColor bc_booksGroupedBackground];
  [v10 registerColor:v11 withName:@"booksGroupedBackground"];

  v12 = [v3 colorRegistry];
  v13 = +[UIColor bc_booksSecondaryGroupedBackground];
  [v12 registerColor:v13 withName:@"booksSecondaryGroupedBackground"];

  v14 = [v3 colorRegistry];
  v15 = +[UIColor bc_booksWidgetBackgroundOverlayTop];
  [v14 registerColor:v15 withName:@"booksWidgetBackgroundOverlayTop"];

  v16 = [v3 colorRegistry];
  v17 = +[UIColor bc_booksWidgetBackgroundOverlayBottom];
  [v16 registerColor:v17 withName:@"booksWidgetBackgroundOverlayBottom"];

  v18 = [v3 colorRegistry];
  v19 = +[UIColor bc_booksBrickBackground];
  [v18 registerColor:v19 withName:@"booksBrickBackground"];

  v20 = [v3 colorRegistry];
  v21 = +[UIColor bc_booksKeyColor];
  [v20 registerColor:v21 withName:@"booksKeyColor"];

  v22 = [v3 colorRegistry];
  v23 = +[UIColor bc_booksLabelColor];
  [v22 registerColor:v23 withName:@"booksLabelColor"];

  v24 = [v3 colorRegistry];
  v25 = +[UIColor bc_booksSecondaryLabelColor];
  [v24 registerColor:v25 withName:@"booksSecondaryLabelColor"];

  v26 = [v3 colorRegistry];
  v27 = +[UIColor bc_booksTertiaryLabelColor];
  [v26 registerColor:v27 withName:@"booksTertiaryLabelColor"];

  v28 = [v3 colorRegistry];
  v29 = +[UIColor bc_booksQuaternaryLabelColor];
  [v28 registerColor:v29 withName:@"booksQuaternaryLabelColor"];

  v30 = [v3 colorRegistry];
  v31 = +[UIColor bc_booksRed];
  [v30 registerColor:v31 withName:@"booksRed"];

  v32 = [v3 colorRegistry];
  v33 = +[UIColor bc_booksOrange];
  [v32 registerColor:v33 withName:@"booksOrange"];

  v34 = [v3 colorRegistry];
  v35 = +[UIColor bc_booksGreen];
  [v34 registerColor:v35 withName:@"booksGreen"];

  v36 = [v3 colorRegistry];
  v37 = +[UIColor bc_booksCyan];
  [v36 registerColor:v37 withName:@"booksCyan"];

  v38 = [v3 colorRegistry];
  v39 = +[UIColor bc_booksBlue];
  [v38 registerColor:v39 withName:@"booksBlue"];

  v40 = [v3 colorRegistry];
  v41 = +[UIColor bc_booksPurple];
  [v40 registerColor:v41 withName:@"booksPurple"];

  v42 = [v3 colorRegistry];
  v43 = +[UIColor bc_booksMagenta];
  [v42 registerColor:v43 withName:@"booksMagenta"];

  v44 = [v3 colorRegistry];
  v45 = +[UIColor bc_booksGray];
  [v44 registerColor:v45 withName:@"booksGray"];

  v46 = [v3 colorRegistry];
  v47 = +[UIColor bc_booksBlack];
  [v46 registerColor:v47 withName:@"booksBlack"];

  v48 = [v3 colorRegistry];
  v49 = +[UIColor bc_booksWhite];
  [v48 registerColor:v49 withName:@"booksWhite"];

  v50 = [v3 colorRegistry];
  v51 = +[UIColor bc_booksNestedIconGlyphColor];
  [v50 registerColor:v51 withName:@"booksNestedIconGlyphColor"];

  v52 = [v3 colorRegistry];
  v53 = +[UIColor bc_booksChevronColor];
  [v52 registerColor:v53 withName:@"booksChevronColor"];

  v54 = [v3 colorRegistry];
  v55 = +[UIColor bc_booksIconBackgroundColor];
  [v54 registerColor:v55 withName:@"booksIconBackgroundColor"];

  v56 = [v3 colorRegistry];
  v57 = +[UIColor bc_booksSecondaryIconBackgroundColor];
  [v56 registerColor:v57 withName:@"booksSecondaryIconBackgroundColor"];

  v58 = [v3 colorRegistry];
  v59 = +[UIColor bc_booksSeparatorColor];
  [v58 registerColor:v59 withName:@"booksSeparatorColor"];

  id v61 = [v3 colorRegistry];

  v60 = +[UIColor bc_booksAXSeparatorColor];
  [v61 registerColor:v60 withName:@"booksAXSeparatorColor"];
}

+ (id)_templatePackageURL
{
  return 0;
}

+ (id)_templateFactory
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_11C00;
  block[3] = &unk_2C3BB8;
  block[4] = a1;
  if (qword_345540 != -1) {
    dispatch_once(&qword_345540, block);
  }
  v2 = (void *)qword_345538;

  return v2;
}

+ (id)_metricsTemplateURL
{
  return 0;
}

- (BCMetrics)initWithObserver:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BCMetrics;
  v5 = [(BCMetrics *)&v12 init];
  if (v5)
  {
    v6 = [BCLayoutMetrics alloc];
    v7 = [(id)objc_opt_class() _templateFactory];
    v8 = [(id)objc_opt_class() _manager];
    v9 = [(BCLayoutMetrics *)v6 initWithObserver:v4 factory:v7 manager:v8 delegate:v5];
    metrics = v5->_metrics;
    v5->_metrics = v9;
  }
  return v5;
}

- (NSDictionary)computedMetrics
{
  return [(BCLayoutMetrics *)self->_metrics metrics];
}

- (BOOL)compactWidth
{
  v2 = [(BCMetrics *)self metrics];
  unsigned __int8 v3 = [v2 compactWidth];

  return v3;
}

- (BOOL)updateIfNeededWithEnvironment:(id)a3
{
  id v4 = a3;
  v5 = [(BCMetrics *)self metrics];
  unsigned __int8 v6 = [v5 updateIfNeededWithEnvironment:v4];

  return v6;
}

- (BOOL)updateIfNeededWithViewController:(id)a3
{
  id v4 = a3;
  v5 = [v4 viewIfLoaded];
  unsigned __int8 v6 = [v5 traitCollection];
  uint64_t v7 = [v5 window];
  v8 = (void *)v7;
  LOBYTE(v9) = 0;
  if (v5 && v6 && v7)
  {
    id v10 = objc_alloc((Class)TUIEnvironment);
    [v5 bounds];
    double v12 = v11;
    double v14 = v13;
    [v8 bounds];
    id v15 = [v10 initWithTraitCollection:v6 viewController:v4 viewSize:v12 windowSize:v14];
    v16 = [(BCMetrics *)self metrics];
    unsigned int v9 = [v16 updateIfNeededWithEnvironment:v15];

    if (v9) {
      [v5 setNeedsLayout];
    }
  }
  return v9;
}

- (id)metricsTemplateURL
{
  v2 = objc_opt_class();

  return _[v2 _metricsTemplateURL];
}

+ (id)supportedMetrics
{
  return &__NSArray0__struct;
}

- (BCLayoutMetrics)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
}

- (void).cxx_destruct
{
}

@end