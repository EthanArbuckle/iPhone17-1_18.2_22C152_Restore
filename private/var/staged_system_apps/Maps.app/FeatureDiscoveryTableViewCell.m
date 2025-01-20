@interface FeatureDiscoveryTableViewCell
+ (double)estimatedHeightForContext:(unint64_t)a3;
+ (id)reuseIdentifier;
- (FeatureDiscoveryTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (FeatureDiscoveryView)featureDiscoveryView;
- (unint64_t)context;
- (void)_updateFeatureDiscoveryViewConstraints;
- (void)setContext:(unint64_t)a3;
@end

@implementation FeatureDiscoveryTableViewCell

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

- (FeatureDiscoveryTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v15.receiver = self;
  v15.super_class = (Class)FeatureDiscoveryTableViewCell;
  v4 = [(FeatureDiscoveryTableViewCell *)&v15 initWithStyle:a3 reuseIdentifier:a4];
  id v5 = v4;
  if (v4)
  {
    [(FeatureDiscoveryTableViewCell *)v4 setSelectionStyle:0];
    double v6 = +[UIColor clearColor];
    [(FeatureDiscoveryTableViewCell *)v5 setBackgroundColor:v6];

    double v7 = +[UIColor clearColor];
    double v8 = [(FeatureDiscoveryTableViewCell *)v5 contentView];
    [v8 setBackgroundColor:v7];

    double v9 = [FeatureDiscoveryView alloc];
    double v10 = [(FeatureDiscoveryTableViewCell *)v5 contentView];
    [v10 bounds];
    v11 = -[FeatureDiscoveryView initWithFrame:](v9, "initWithFrame:");
    featureDiscoveryView = v5->_featureDiscoveryView;
    v5->_featureDiscoveryView = v11;

    [(FeatureDiscoveryView *)v5->_featureDiscoveryView setTranslatesAutoresizingMaskIntoConstraints:0];
    v13 = [(FeatureDiscoveryTableViewCell *)v5 contentView];
    [v13 addSubview:v5->_featureDiscoveryView];

    [(FeatureDiscoveryTableViewCell *)v5 _updateFeatureDiscoveryViewConstraints];
  }
  return v5;
}

+ (id)reuseIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (void)_updateFeatureDiscoveryViewConstraints
{
  if (self->_featureDiscoveryViewConstraints) {
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:");
  }
  featureDiscoveryView = self->_featureDiscoveryView;
  v4 = [(FeatureDiscoveryTableViewCell *)self contentView];
  id v5 = [(FeatureDiscoveryTableViewCell *)self traitCollection];
  +[FeatureDiscoveryView _constraintsForFeatureDiscoveryView:centeredInContentView:withIdiom:context:](FeatureDiscoveryView, "_constraintsForFeatureDiscoveryView:centeredInContentView:withIdiom:context:", featureDiscoveryView, v4, [v5 userInterfaceIdiom], self->_context);
  double v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  featureDiscoveryViewConstraints = self->_featureDiscoveryViewConstraints;
  self->_featureDiscoveryViewConstraints = v6;

  double v8 = self->_featureDiscoveryViewConstraints;

  +[NSLayoutConstraint activateConstraints:v8];
}

- (void)setContext:(unint64_t)a3
{
  if (self->_context != a3) {
    [(FeatureDiscoveryTableViewCell *)self _updateFeatureDiscoveryViewConstraints];
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