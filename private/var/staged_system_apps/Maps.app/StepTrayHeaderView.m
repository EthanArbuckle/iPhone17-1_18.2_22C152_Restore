@interface StepTrayHeaderView
- (CGSize)intrinsicContentSize;
- (StepTrayHeaderView)initWithDelegate:(id)a3 metrics:(id)a4;
- (StepTrayHeaderViewDelegate)delegate;
- (double)layoutProgress;
- (void)_updateLayoutProgress;
- (void)setDefaultTitle:(id)a3 defaultSubtitle:(id)a4;
- (void)setLayoutProgress:(double)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation StepTrayHeaderView

- (StepTrayHeaderView)initWithDelegate:(id)a3 metrics:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v73.receiver = self;
  v73.super_class = (Class)StepTrayHeaderView;
  v8 = -[StepTrayHeaderView initWithFrame:](&v73, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  if (v8)
  {
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    [(StepTrayHeaderView *)v8 setAccessibilityIdentifier:v10];

    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeStrong((id *)&v8->_metrics, a4);
    uint64_t v11 = +[UIFont _maps_fontProviderWeight:UIContentSizeCategoryLarge minimumPointSize:UIContentSizeCategoryExtraExtraExtraLarge minimumSizeCategory:UIFontWeightBold maximumPointSize:25.0 maximumSizeCategory:33.0];
    id minimizedValueFontProvider = v8->_minimizedValueFontProvider;
    v8->_id minimizedValueFontProvider = (id)v11;

    [(StepTrayHeaderView *)v8 setUserInteractionEnabled:1];
    id v70 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:v6 action:"pressedHeaderView"];
    [(StepTrayHeaderView *)v8 addGestureRecognizer:v70];
    id v13 = objc_alloc((Class)UIImageView);
    v14 = +[UIImage imageNamed:@"NavTrayChevron"];
    v15 = (UIImageView *)[v13 initWithImage:v14];
    id v72 = v6;
    chevronImageView = v8->_chevronImageView;
    v8->_chevronImageView = v15;

    [(UIImageView *)v8->_chevronImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v8->_chevronImageView setContentMode:1];
    [(UIImageView *)v8->_chevronImageView setAccessibilityIdentifier:@"ChevronImageView"];
    [(StepTrayHeaderView *)v8 addSubview:v8->_chevronImageView];
    v17 = (void (**)(id, void *))v8->_minimizedValueFontProvider;
    v18 = [(StepTrayHeaderView *)v8 traitCollection];
    v69 = v17[2](v17, v18);

    v19 = [v7 minimizedTitleTextStyle];
    [v7 minimizedTitleFontWeight];
    v68 = +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:weight:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:weight:", v19);

    uint64_t v20 = objc_opt_new();
    defaultLabel = v8->_defaultLabel;
    v8->_defaultLabel = (NavTrayStackedLabel *)v20;

    [(NavTrayStackedLabel *)v8->_defaultLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(NavTrayMetrics *)v8->_metrics minimizedValueToTitlePadding];
    -[NavTrayStackedLabel setInterLabelPadding:](v8->_defaultLabel, "setInterLabelPadding:");
    v22 = [(NavTrayStackedLabel *)v8->_defaultLabel topLabel];
    [v22 setFont:v69];

    v23 = [(NavTrayMetrics *)v8->_metrics minimizedValueTextColor];
    v24 = [(NavTrayStackedLabel *)v8->_defaultLabel topLabel];
    [v24 setTextColor:v23];

    v25 = [(NavTrayStackedLabel *)v8->_defaultLabel topLabel];
    [v25 setAdjustsFontSizeToFitWidth:0];

    v26 = [(NavTrayStackedLabel *)v8->_defaultLabel bottomLabel];
    [v26 setFont:v68];

    v27 = [(NavTrayMetrics *)v8->_metrics minimizedTitleTextColor];
    v28 = [(NavTrayStackedLabel *)v8->_defaultLabel bottomLabel];
    [v28 setTextColor:v27];

    v29 = [(NavTrayStackedLabel *)v8->_defaultLabel bottomLabel];
    [v29 setAdjustsFontSizeToFitWidth:1];

    [(NavTrayStackedLabel *)v8->_defaultLabel setAccessibilityIdentifier:@"DefaultLabel"];
    [(StepTrayHeaderView *)v8 addSubview:v8->_defaultLabel];
    v67 = [(UIImageView *)v8->_chevronImageView trailingAnchor];
    v66 = [(StepTrayHeaderView *)v8 trailingAnchor];
    [(NavTrayMetrics *)v8->_metrics defaultHorizontalPadding];
    v65 = [v67 constraintEqualToAnchor:v66 constant:-v30];
    v74[0] = v65;
    v64 = [(UIImageView *)v8->_chevronImageView topAnchor];
    v63 = [(StepTrayHeaderView *)v8 topAnchor];
    [(NavTrayMetrics *)v8->_metrics defaultVerticalPadding];
    v62 = [v64 constraintGreaterThanOrEqualToAnchor:v63];
    v74[1] = v62;
    v61 = [(UIImageView *)v8->_chevronImageView bottomAnchor];
    v60 = [(StepTrayHeaderView *)v8 bottomAnchor];
    [(NavTrayMetrics *)v8->_metrics defaultVerticalPadding];
    v59 = [v61 constraintLessThanOrEqualToAnchor:v60 constant:-v31];
    v74[2] = v59;
    v58 = [(UIImageView *)v8->_chevronImageView centerYAnchor];
    v57 = [(StepTrayHeaderView *)v8 centerYAnchor];
    v56 = [v58 constraintEqualToAnchor:v57];
    v74[3] = v56;
    v55 = [(UIImageView *)v8->_chevronImageView widthAnchor];
    [(NavTrayMetrics *)v8->_metrics expandCollapseImageSize];
    v54 = [v55 constraintEqualToConstant:];
    v74[4] = v54;
    v53 = [(UIImageView *)v8->_chevronImageView heightAnchor];
    [(NavTrayMetrics *)v8->_metrics expandCollapseImageSize];
    v52 = [v53 constraintEqualToConstant:v32];
    v74[5] = v52;
    v51 = [(NavTrayStackedLabel *)v8->_defaultLabel leadingAnchor];
    v50 = [(StepTrayHeaderView *)v8 leadingAnchor];
    [(NavTrayMetrics *)v8->_metrics defaultHorizontalPadding];
    v49 = [v51 constraintEqualToAnchor:v50];
    v74[6] = v49;
    v48 = [(NavTrayStackedLabel *)v8->_defaultLabel trailingAnchor];
    v47 = [(UIImageView *)v8->_chevronImageView leadingAnchor];
    [(NavTrayMetrics *)v8->_metrics defaultHorizontalPadding];
    v46 = [v48 constraintEqualToAnchor:v47 constant:-v33];
    v74[7] = v46;
    v45 = [(NavTrayStackedLabel *)v8->_defaultLabel topAnchor];
    v34 = [(StepTrayHeaderView *)v8 topAnchor];
    [(NavTrayMetrics *)v8->_metrics defaultVerticalPadding];
    v35 = [v45 constraintGreaterThanOrEqualToAnchor:v34];
    v74[8] = v35;
    [(NavTrayStackedLabel *)v8->_defaultLabel bottomAnchor];
    v36 = id v71 = v7;
    v37 = [(StepTrayHeaderView *)v8 bottomAnchor];
    [(NavTrayMetrics *)v8->_metrics defaultVerticalPadding];
    v39 = [v36 constraintLessThanOrEqualToAnchor:v37 constant:-v38];
    v74[9] = v39;
    v40 = [(NavTrayStackedLabel *)v8->_defaultLabel centerYAnchor];
    v41 = [(StepTrayHeaderView *)v8 centerYAnchor];
    v42 = [v40 constraintEqualToAnchor:v41];
    v74[10] = v42;
    v43 = +[NSArray arrayWithObjects:v74 count:11];
    +[NSLayoutConstraint activateConstraints:v43];

    id v6 = v72;
    id v7 = v71;

    [(StepTrayHeaderView *)v8 _updateLayoutProgress];
  }

  return v8;
}

- (void)setDefaultTitle:(id)a3 defaultSubtitle:(id)a4
{
  defaultLabel = self->_defaultLabel;
  id v7 = a4;
  id v8 = a3;
  v9 = [(NavTrayStackedLabel *)defaultLabel topLabel];
  [v9 setText:v8];

  id v10 = [(NavTrayStackedLabel *)self->_defaultLabel bottomLabel];
  [v10 setText:v7];
}

- (void)_updateLayoutProgress
{
  [(StepTrayHeaderView *)self layoutProgress];
  CGAffineTransformMakeRotation(&v6, (v3 * 2.0 + -1.0) * 1.57079633);
  chevronImageView = self->_chevronImageView;
  CGAffineTransform v5 = v6;
  [(UIImageView *)chevronImageView setTransform:&v5];
}

- (void)setLayoutProgress:(double)a3
{
  double v3 = fmax(fmin(a3, 1.0), 0.0);
  if (vabdd_f64(self->_layoutProgress, v3) > 2.22044605e-16)
  {
    self->_layoutProgress = v3;
    [(StepTrayHeaderView *)self _updateLayoutProgress];
  }
}

- (CGSize)intrinsicContentSize
{
  [(NavTrayMetrics *)self->_metrics expandCollapseImageSize];
  double v4 = v3;
  [(NavTrayStackedLabel *)self->_defaultLabel intrinsicContentSize];
  double v6 = v5;
  [(StepTrayHeaderView *)self frame];
  double v8 = v7;
  if (v6 <= v4) {
    double v9 = v4;
  }
  else {
    double v9 = v6;
  }
  double v10 = fmax(v9, 60.0);
  [(NavTrayMetrics *)self->_metrics defaultVerticalPadding];
  double v12 = v10 + v11 * 2.0;
  double v13 = v8;
  result.height = v12;
  result.width = v13;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)StepTrayHeaderView;
  id v4 = a3;
  [(StepTrayHeaderView *)&v15 traitCollectionDidChange:v4];
  double v5 = [(StepTrayHeaderView *)self traitCollection];
  double v6 = [v5 preferredContentSizeCategory];
  double v7 = [v4 preferredContentSizeCategory];

  if (v6 != v7)
  {
    id minimizedValueFontProvider = (void (**)(id, void *))self->_minimizedValueFontProvider;
    double v9 = [(StepTrayHeaderView *)self traitCollection];
    double v10 = minimizedValueFontProvider[2](minimizedValueFontProvider, v9);

    double v11 = [(NavTrayMetrics *)self->_metrics minimizedTitleTextStyle];
    [(NavTrayMetrics *)self->_metrics minimizedTitleFontWeight];
    double v12 = +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:weight:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:weight:", v11);

    double v13 = [(NavTrayStackedLabel *)self->_defaultLabel topLabel];
    [v13 setFont:v10];

    v14 = [(NavTrayStackedLabel *)self->_defaultLabel bottomLabel];
    [v14 setFont:v12];
  }
}

- (double)layoutProgress
{
  return self->_layoutProgress;
}

- (StepTrayHeaderViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (StepTrayHeaderViewDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_defaultLabel, 0);
  objc_storeStrong(&self->_minimizedValueFontProvider, 0);
  objc_storeStrong((id *)&self->_chevronImageView, 0);

  objc_storeStrong((id *)&self->_metrics, 0);
}

@end