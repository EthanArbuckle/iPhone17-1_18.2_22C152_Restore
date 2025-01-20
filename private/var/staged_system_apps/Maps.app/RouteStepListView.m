@interface RouteStepListView
+ (double)heightForItem:(id)a3 width:(double)a4 maximumHeight:(double)a5;
- (BOOL)shouldUseTextToBottomConstraint;
- (RouteStepItem)item;
- (RouteStepListView)initWithFrame:(CGRect)a3;
- (void)_updateHairline;
- (void)setItem:(id)a3;
- (void)setShouldUseTextToBottomConstraint:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation RouteStepListView

- (RouteStepListView)initWithFrame:(CGRect)a3
{
  v22.receiver = self;
  v22.super_class = (Class)RouteStepListView;
  v3 = -[RouteStepListView initWithFrame:](&v22, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = objc_opt_new();
    hairlineView = v3->_hairlineView;
    v3->_hairlineView = (UIView *)v4;

    [(UIView *)v3->_hairlineView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(RouteStepListView *)v3 addSubview:v3->_hairlineView];
    v6 = [(UIView *)v3->_hairlineView leadingAnchor];
    v7 = [(RouteStepListView *)v3 leadingAnchor];
    uint64_t v8 = [v6 constraintEqualToAnchor:v7];
    hairlineLeadingConstraint = v3->_hairlineLeadingConstraint;
    v3->_hairlineLeadingConstraint = (NSLayoutConstraint *)v8;

    v10 = [(UIView *)v3->_hairlineView trailingAnchor];
    v11 = [(RouteStepListView *)v3 trailingAnchor];
    uint64_t v12 = [v10 constraintEqualToAnchor:v11];
    hairlineTrailingConstraint = v3->_hairlineTrailingConstraint;
    v3->_hairlineTrailingConstraint = (NSLayoutConstraint *)v12;

    v14 = [(UIView *)v3->_hairlineView heightAnchor];
    uint64_t v15 = [v14 constraintEqualToConstant:1.0];
    hairlineHeightConstraint = v3->_hairlineHeightConstraint;
    v3->_hairlineHeightConstraint = (NSLayoutConstraint *)v15;

    v23[0] = v3->_hairlineLeadingConstraint;
    v23[1] = v3->_hairlineTrailingConstraint;
    v23[2] = v3->_hairlineHeightConstraint;
    v17 = [(UIView *)v3->_hairlineView bottomAnchor];
    v18 = [(RouteStepListView *)v3 bottomAnchor];
    v19 = [v17 constraintEqualToAnchor:v18];
    v23[3] = v19;
    v20 = +[NSArray arrayWithObjects:v23 count:4];
    +[NSLayoutConstraint activateConstraints:v20];

    [(RouteStepListView *)v3 _updateHairline];
  }
  return v3;
}

- (void)setShouldUseTextToBottomConstraint:(BOOL)a3
{
  v3 = sub_1005762E4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = +[NSString stringWithFormat:@"Subclass should override"];
    int v7 = 136315906;
    uint64_t v8 = "-[RouteStepListView setShouldUseTextToBottomConstraint:]";
    __int16 v9 = 2080;
    v10 = "RouteStepListCell.m";
    __int16 v11 = 1024;
    int v12 = 54;
    __int16 v13 = 2112;
    v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly! '%@'", (uint8_t *)&v7, 0x26u);
  }
  if (sub_100BB36BC())
  {
    v5 = sub_1005762E4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = +[NSThread callStackSymbols];
      int v7 = 138412290;
      uint64_t v8 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (BOOL)shouldUseTextToBottomConstraint
{
  v2 = sub_1005762E4();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v3 = +[NSString stringWithFormat:@"Subclass should override"];
    int v7 = 136315906;
    uint64_t v8 = "-[RouteStepListView shouldUseTextToBottomConstraint]";
    __int16 v9 = 2080;
    v10 = "RouteStepListCell.m";
    __int16 v11 = 1024;
    int v12 = 60;
    __int16 v13 = 2112;
    v14 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly! '%@'", (uint8_t *)&v7, 0x26u);
  }
  if (sub_100BB36BC())
  {
    uint64_t v4 = sub_1005762E4();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = +[NSThread callStackSymbols];
      int v7 = 138412290;
      uint64_t v8 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v7, 0xCu);
    }
  }
  return 0;
}

+ (double)heightForItem:(id)a3 width:(double)a4 maximumHeight:(double)a5
{
  v5 = sub_1005762E4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = +[NSString stringWithFormat:@"Subclass should override"];
    int v10 = 136315906;
    __int16 v11 = "+[RouteStepListView heightForItem:width:maximumHeight:]";
    __int16 v12 = 2080;
    __int16 v13 = "RouteStepListCell.m";
    __int16 v14 = 1024;
    int v15 = 66;
    __int16 v16 = 2112;
    v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly! '%@'", (uint8_t *)&v10, 0x26u);
  }
  if (sub_100BB36BC())
  {
    int v7 = sub_1005762E4();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = +[NSThread callStackSymbols];
      int v10 = 138412290;
      __int16 v11 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v10, 0xCu);
    }
  }
  return 0.0;
}

- (void)setItem:(id)a3
{
  v5 = (RouteStepItem *)a3;
  if (self->_item != v5)
  {
    int v10 = v5;
    objc_storeStrong((id *)&self->_item, a3);
    if (v10) {
      uint64_t v6 = [(RouteStepItem *)v10 showsHairline] ^ 1;
    }
    else {
      uint64_t v6 = 1;
    }
    [(UIView *)self->_hairlineView setHidden:v6];
    int v7 = [(RouteStepItem *)v10 metrics];
    uint64_t v8 = [v7 hairlineColor];
    [(UIView *)self->_hairlineView setBackgroundColor:v8];

    [(RouteStepItem *)v10 hairlineLeadingInset];
    -[NSLayoutConstraint setConstant:](self->_hairlineLeadingConstraint, "setConstant:");
    [(RouteStepItem *)v10 hairlineTrailingInset];
    [(NSLayoutConstraint *)self->_hairlineTrailingConstraint setConstant:-v9];
    v5 = v10;
  }
}

- (void)_updateHairline
{
  v3 = [(UIView *)self->_hairlineView traitCollection];
  [v3 displayScale];
  double v5 = v4;

  double v6 = 1.0;
  if (v5 > 0.0) {
    double v6 = 1.0 / v5;
  }
  hairlineHeightConstraint = self->_hairlineHeightConstraint;

  [(NSLayoutConstraint *)hairlineHeightConstraint setConstant:v6];
}

- (void)traitCollectionDidChange:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)RouteStepListView;
  id v4 = a3;
  [(RouteStepListView *)&v10 traitCollectionDidChange:v4];
  double v5 = [(RouteStepListView *)self traitCollection];
  [v5 displayScale];
  double v7 = v6;
  [v4 displayScale];
  double v9 = v8;

  if (v7 != v9) {
    [(RouteStepListView *)self _updateHairline];
  }
}

- (RouteStepItem)item
{
  return self->_item;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_hairlineHeightConstraint, 0);
  objc_storeStrong((id *)&self->_hairlineTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_hairlineLeadingConstraint, 0);

  objc_storeStrong((id *)&self->_hairlineView, 0);
}

@end