@interface FeatureDiscoveryCollectionViewCell
+ (double)estimatedHeightForContext:(unint64_t)a3;
- (FeatureDiscoveryCollectionViewCell)initWithFrame:(CGRect)a3;
- (FeatureDiscoveryView)featureDiscoveryView;
- (unint64_t)context;
- (void)_updateFeatureDiscoveryViewConstraints;
- (void)setContext:(unint64_t)a3;
@end

@implementation FeatureDiscoveryCollectionViewCell

+ (double)estimatedHeightForContext:(unint64_t)a3
{
  v4 = +[UIDevice currentDevice];
  id v5 = [v4 userInterfaceIdiom];

  +[FeatureDiscoveryView _cellMetricsForIdiom:v5 context:a3];
  double v7 = v6;
  double v9 = v8;
  +[FeatureDiscoveryView estimatedHeight];
  return v9 + v7 + v10;
}

- (FeatureDiscoveryCollectionViewCell)initWithFrame:(CGRect)a3
{
  v13.receiver = self;
  v13.super_class = (Class)FeatureDiscoveryCollectionViewCell;
  v3 = -[MapsThemeCollectionViewCell initWithFrame:](&v13, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[UIColor clearColor];
    [(FeatureDiscoveryCollectionViewCell *)v3 setBackgroundColor:v4];

    id v5 = +[UIColor clearColor];
    double v6 = [(FeatureDiscoveryCollectionViewCell *)v3 contentView];
    [v6 setBackgroundColor:v5];

    double v7 = [FeatureDiscoveryView alloc];
    double v8 = [(FeatureDiscoveryCollectionViewCell *)v3 contentView];
    [v8 bounds];
    double v9 = -[FeatureDiscoveryView initWithFrame:](v7, "initWithFrame:");
    featureDiscoveryView = v3->_featureDiscoveryView;
    v3->_featureDiscoveryView = v9;

    [(FeatureDiscoveryView *)v3->_featureDiscoveryView setTranslatesAutoresizingMaskIntoConstraints:0];
    v11 = [(FeatureDiscoveryCollectionViewCell *)v3 contentView];
    [v11 addSubview:v3->_featureDiscoveryView];

    [(FeatureDiscoveryCollectionViewCell *)v3 _updateFeatureDiscoveryViewConstraints];
  }
  return v3;
}

- (void)_updateFeatureDiscoveryViewConstraints
{
  if (self->_featureDiscoveryViewConstraints) {
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:");
  }
  featureDiscoveryView = self->_featureDiscoveryView;
  v4 = [(FeatureDiscoveryCollectionViewCell *)self contentView];
  id v5 = [(FeatureDiscoveryCollectionViewCell *)self traitCollection];
  +[FeatureDiscoveryView _constraintsForFeatureDiscoveryView:centeredInContentView:withIdiom:context:](FeatureDiscoveryView, "_constraintsForFeatureDiscoveryView:centeredInContentView:withIdiom:context:", featureDiscoveryView, v4, [v5 userInterfaceIdiom], self->_context);
  double v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  featureDiscoveryViewConstraints = self->_featureDiscoveryViewConstraints;
  self->_featureDiscoveryViewConstraints = v6;

  double v8 = self->_featureDiscoveryViewConstraints;

  +[NSLayoutConstraint activateConstraints:v8];
}

- (void)setContext:(unint64_t)a3
{
  if (self->_context != a3)
  {
    self->_context = a3;
    [(FeatureDiscoveryCollectionViewCell *)self _updateFeatureDiscoveryViewConstraints];
  }
}

- (FeatureDiscoveryView)featureDiscoveryView
{
  return self->_featureDiscoveryView;
}

- (unint64_t)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureDiscoveryView, 0);

  objc_storeStrong((id *)&self->_featureDiscoveryViewConstraints, 0);
}

@end