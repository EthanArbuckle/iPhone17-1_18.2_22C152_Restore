@interface CarAdvisoriesView
- (CarAdvisoriesView)initWithFrame:(CGRect)a3;
- (GEOComposedRoute)route;
- (unint64_t)count;
- (void)_setupViews;
- (void)refreshContent;
- (void)setRoute:(id)a3;
@end

@implementation CarAdvisoriesView

- (CarAdvisoriesView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CarAdvisoriesView;
  v3 = -[CarAdvisoriesView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(CarAdvisoriesView *)v3 setAccessibilityIdentifier:@"CarAdvisoriesView"];
    [(CarAdvisoriesView *)v4 _setupViews];
  }
  return v4;
}

- (unint64_t)count
{
  v2 = [(UIStackView *)self->_advisoriesStackView arrangedSubviews];
  id v3 = [v2 count];

  return (unint64_t)v3;
}

- (void)_setupViews
{
  id v3 = (UIStackView *)objc_alloc_init((Class)UIStackView);
  advisoriesStackView = self->_advisoriesStackView;
  self->_advisoriesStackView = v3;

  [(UIStackView *)self->_advisoriesStackView setAccessibilityIdentifier:@"AdvisoriesStackView"];
  [(UIStackView *)self->_advisoriesStackView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIStackView *)self->_advisoriesStackView setAxis:1];
  [(UIStackView *)self->_advisoriesStackView setAlignment:0];
  [(UIStackView *)self->_advisoriesStackView setDistribution:2];
  [(UIStackView *)self->_advisoriesStackView setSpacing:3.0];
  [(UIStackView *)self->_advisoriesStackView setClipsToBounds:1];
  LODWORD(v5) = 1148846080;
  [(UIStackView *)self->_advisoriesStackView setContentHuggingPriority:1 forAxis:v5];
  [(CarAdvisoriesView *)self addSubview:self->_advisoriesStackView];
  v18 = [(UIStackView *)self->_advisoriesStackView leadingAnchor];
  v17 = [(CarAdvisoriesView *)self leadingAnchor];
  v16 = [v18 constraintEqualToAnchor:v17];
  v19[0] = v16;
  v15 = [(UIStackView *)self->_advisoriesStackView trailingAnchor];
  objc_super v6 = [(CarAdvisoriesView *)self trailingAnchor];
  v7 = [v15 constraintEqualToAnchor:v6];
  v19[1] = v7;
  v8 = [(UIStackView *)self->_advisoriesStackView topAnchor];
  v9 = [(CarAdvisoriesView *)self topAnchor];
  v10 = [v8 constraintEqualToAnchor:v9];
  v19[2] = v10;
  v11 = [(UIStackView *)self->_advisoriesStackView bottomAnchor];
  v12 = [(CarAdvisoriesView *)self bottomAnchor];
  v13 = [v11 constraintEqualToAnchor:v12];
  v19[3] = v13;
  v14 = +[NSArray arrayWithObjects:v19 count:4];
  [(CarAdvisoriesView *)self addConstraints:v14];
}

- (void)setRoute:(id)a3
{
  double v5 = (GEOComposedRoute *)a3;
  if (self->_route != v5)
  {
    objc_super v6 = v5;
    objc_storeStrong((id *)&self->_route, a3);
    [(CarAdvisoriesView *)self refreshContent];
    double v5 = v6;
  }
}

- (void)refreshContent
{
  id v3 = [(GEOComposedRoute *)self->_route advisories];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100B64D70;
  v8[3] = &unk_1013194E0;
  v8[4] = self;
  v4 = sub_100099700(v3, v8);

  if ((unint64_t)[v4 count] > 3) {
    uint64_t v5 = 4;
  }
  else {
    uint64_t v5 = (uint64_t)[v4 count];
  }
  advisoriesStackView = self->_advisoriesStackView;
  v7 = [v4 subarrayWithRange:0, v5];
  [(UIStackView *)advisoriesStackView _maps_setArrangedSubviews:v7];
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_route, 0);

  objc_storeStrong((id *)&self->_advisoriesStackView, 0);
}

@end