@interface BSUIReadingGoalsGaugeView
+ (id)renderModelWithIdentifier:(id)a3 metrics:(id)a4;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BSUIReadingGoalsGaugeMetrics)metrics;
- (TUIDynamicProgress)dynamicProgress;
- (_TtP11BookStoreUI34ReadingGaugeViewControllerProtocol_)hostingViewController;
- (void)_configureHostingController;
- (void)_configureWithModel:(id)a3;
- (void)applyLayoutAttributes:(id)a3;
- (void)dealloc;
- (void)dynamicProgressChanged:(id)a3;
- (void)layoutSubviews;
- (void)setDynamicProgress:(id)a3;
- (void)setHostingViewController:(id)a3;
@end

@implementation BSUIReadingGoalsGaugeView

+ (id)renderModelWithIdentifier:(id)a3 metrics:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(_BSUIRenderModelReadingGoalsGauge);
  [(_BSUIRenderModelReadingGoalsGauge *)v7 setMetrics:v5];

  id v8 = [objc_alloc((Class)TUIRenderModelView) initWithReuseIdentifier:@"BSUIReuseIdentifierReadingGoalsGaugeView" identifier:v6 submodel:v7];

  return v8;
}

- (void)applyLayoutAttributes:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BSUIReadingGoalsGaugeView;
  id v4 = a3;
  [(BSUIReadingGoalsGaugeView *)&v7 applyLayoutAttributes:v4];
  [v4 renderModel];

  id v6 = [v5 submodel];
  [(BSUIReadingGoalsGaugeView *)self _configureWithModel:v6];
}

- (void)dealloc
{
  [(TUIDynamicProgress *)self->_dynamicProgress unregisterProgressObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)BSUIReadingGoalsGaugeView;
  [(BSUIReadingGoalsGaugeView *)&v3 dealloc];
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)BSUIReadingGoalsGaugeView;
  [(BSUIReadingGoalsGaugeView *)&v13 layoutSubviews];
  [(BSUIReadingGoalsGaugeView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(BSUIReadingGoalsGaugeView *)self hostingViewController];
  v12 = [v11 view];
  [v12 setFrame:v4, v6, v8, v10];
}

- (void)_configureWithModel:(id)a3
{
  id v5 = a3;
  if (([v5 isEqualToRenderModel:self->_renderModel] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_renderModel, a3);
    [(BSUIReadingGoalsGaugeView *)self _configureHostingController];
  }
}

- (void)_configureHostingController
{
  if (!self->_hostingViewController)
  {
    double v3 = [(_BSUIRenderModelReadingGoalsGauge *)self->_renderModel metrics];
    [v3 size];
    +[BSUIReadingGoalsGaugeHostingControllerFactory createWith:](BSUIReadingGoalsGaugeHostingControllerFactory, "createWith:");
    double v4 = (_TtP11BookStoreUI34ReadingGaugeViewControllerProtocol_ *)objc_claimAutoreleasedReturnValue();
    hostingViewController = self->_hostingViewController;
    self->_hostingViewController = v4;

    double v6 = [(BSUIReadingGoalsGaugeView *)self hostingViewController];
    double v7 = [v6 view];
    [(BSUIReadingGoalsGaugeView *)self addSubview:v7];

    double v8 = +[BSUITemplate manager];
    double v9 = [v8 dynamicRegistry];

    double v10 = +[BCReadingTimeToday kind];
    v11 = [v9 progressProviderForKind:v10];
    v12 = [v11 dynamicProgressForKind:v10 instance:0 parameters:0];
    [v12 registerProgressObserver:self];
    dynamicProgress = self->_dynamicProgress;
    self->_dynamicProgress = (TUIDynamicProgress *)v12;
  }
  id v14 = [(_BSUIRenderModelReadingGoalsGauge *)self->_renderModel metrics];
  [(ReadingGaugeViewControllerProtocol *)self->_hostingViewController setMetrics:v14];
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

- (void)dynamicProgressChanged:(id)a3
{
  id v4 = a3;
  id v5 = [v4 progress];

  if (v5)
  {
    objc_initWeak(&location, self);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_BEE8;
    block[3] = &unk_38E2A0;
    objc_copyWeak(&v8, &location);
    id v7 = v4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

- (BSUIReadingGoalsGaugeMetrics)metrics
{
  return self->_metrics;
}

- (_TtP11BookStoreUI34ReadingGaugeViewControllerProtocol_)hostingViewController
{
  return self->_hostingViewController;
}

- (void)setHostingViewController:(id)a3
{
}

- (TUIDynamicProgress)dynamicProgress
{
  return self->_dynamicProgress;
}

- (void)setDynamicProgress:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dynamicProgress, 0);
  objc_storeStrong((id *)&self->_hostingViewController, 0);
  objc_storeStrong((id *)&self->_metrics, 0);

  objc_storeStrong((id *)&self->_renderModel, 0);
}

@end