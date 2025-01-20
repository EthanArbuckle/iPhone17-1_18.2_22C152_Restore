@interface WGWidgetListEditViewTableHeaderView
- (CGRect)_explanationLabelFrameForBoundsWidth:(double)a3 withHeadlineLabelFrame:(CGRect)a4;
- (CGRect)_headlineLabelFrameForBoundsWidth:(double)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (WGWidgetListEditViewTableHeaderView)initWithReuseIdentifier:(id)a3;
- (WGWidgetListEditViewTableHeaderView)initWithReuseIdentifier:(id)a3 forTodayView:(BOOL)a4;
- (double)contentMinY;
- (void)layoutSubviews;
@end

@implementation WGWidgetListEditViewTableHeaderView

- (WGWidgetListEditViewTableHeaderView)initWithReuseIdentifier:(id)a3 forTodayView:(BOOL)a4
{
  BOOL v4 = a4;
  v31.receiver = self;
  v31.super_class = (Class)WGWidgetListEditViewTableHeaderView;
  v5 = [(WGWidgetListEditViewTableHeaderView *)&v31 initWithReuseIdentifier:a3];
  if (v5)
  {
    v6 = (UILabel *)objc_alloc_init(MEMORY[0x263F1C768]);
    headlineLabel = v5->_headlineLabel;
    v5->_headlineLabel = v6;

    [(UILabel *)v5->_headlineLabel setNumberOfLines:0];
    [(UILabel *)v5->_headlineLabel setTextAlignment:1];
    v8 = v5->_headlineLabel;
    v9 = objc_msgSend(MEMORY[0x263F1C658], "bsui_preferredFontForTextStyle:hiFontStyle:", *MEMORY[0x263F1D2F8], 4);
    [(UILabel *)v8 setFont:v9];

    v10 = v5->_headlineLabel;
    if (v4)
    {
      v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v12 = v11;
      v13 = @"WIDGETS_EDIT_TODAY_HEADLINE";
    }
    else
    {
      char v14 = _os_feature_enabled_impl();
      v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v12 = v11;
      if (v14) {
        v13 = @"WIDGETS_EDIT_HEADLINE_LEGACY";
      }
      else {
        v13 = @"WIDGETS_EDIT_HEADLINE";
      }
    }
    v15 = [v11 localizedStringForKey:v13 value:&stru_26D5C79B8 table:@"Widgets"];
    [(UILabel *)v10 setText:v15];

    v16 = v5->_headlineLabel;
    v17 = [MEMORY[0x263F1C550] _labelColor];
    [(UILabel *)v16 setTextColor:v17];

    [(WGWidgetListEditViewTableHeaderView *)v5 addSubview:v5->_headlineLabel];
    v18 = (UILabel *)objc_alloc_init(MEMORY[0x263F1C768]);
    explanationLabel = v5->_explanationLabel;
    v5->_explanationLabel = v18;

    [(UILabel *)v5->_explanationLabel setNumberOfLines:0];
    [(UILabel *)v5->_explanationLabel setTextAlignment:1];
    v20 = v5->_explanationLabel;
    v21 = objc_msgSend(MEMORY[0x263F1C658], "bsui_preferredFontForTextStyle:hiFontStyle:", *MEMORY[0x263F1D260], 1);
    [(UILabel *)v20 setFont:v21];

    v22 = v5->_explanationLabel;
    if (v4)
    {
      char v23 = _os_feature_enabled_impl();
      v24 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v25 = v24;
      if (v23) {
        v26 = @"WIDGETS_EDIT_TODAY_EXPLANATION_LEGACY";
      }
      else {
        v26 = @"WIDGETS_EDIT_TODAY_EXPLANATION";
      }
    }
    else
    {
      v24 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v25 = v24;
      v26 = @"WIDGETS_EDIT_EXPLANATION";
    }
    v27 = [v24 localizedStringForKey:v26 value:&stru_26D5C79B8 table:@"Widgets"];
    [(UILabel *)v22 setText:v27];

    v28 = v5->_explanationLabel;
    v29 = [MEMORY[0x263F1C550] _labelColor];
    [(UILabel *)v28 setTextColor:v29];

    [(WGWidgetListEditViewTableHeaderView *)v5 addSubview:v5->_explanationLabel];
  }
  return v5;
}

- (WGWidgetListEditViewTableHeaderView)initWithReuseIdentifier:(id)a3
{
  return [(WGWidgetListEditViewTableHeaderView *)self initWithReuseIdentifier:a3 forTodayView:0];
}

- (double)contentMinY
{
  [(WGWidgetListEditViewTableHeaderView *)self layoutIfNeeded];
  headlineLabel = self->_headlineLabel;
  [(UILabel *)headlineLabel bounds];
  -[UILabel textRectForBounds:limitedToNumberOfLines:](headlineLabel, "textRectForBounds:limitedToNumberOfLines:", [(UILabel *)self->_headlineLabel numberOfLines], v4, v5, v6, v7);
  -[WGWidgetListEditViewTableHeaderView convertRect:fromView:](self, "convertRect:fromView:", self->_headlineLabel);
  return CGRectGetMinY(*(CGRect *)&v8);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  -[WGWidgetListEditViewTableHeaderView _headlineLabelFrameForBoundsWidth:](self, "_headlineLabelFrameForBoundsWidth:", a3.width, a3.height);
  -[WGWidgetListEditViewTableHeaderView _explanationLabelFrameForBoundsWidth:withHeadlineLabelFrame:](self, "_explanationLabelFrameForBoundsWidth:withHeadlineLabelFrame:", width, v5, v6, v7, v8);
  double MaxY = CGRectGetMaxY(v12);
  double v10 = width;
  result.height = MaxY;
  result.double width = v10;
  return result;
}

- (CGRect)_headlineLabelFrameForBoundsWidth:(double)a3
{
  double v4 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v5 = a3 + -60.0;
  -[UILabel sizeThatFits:](self->_headlineLabel, "sizeThatFits:", a3 + -60.0, 1.79769313e308);
  -[UILabel setFrame:](self->_headlineLabel, "setFrame:", 30.0, v4, v5, v6);
  double v7 = [(UILabel *)self->_headlineLabel font];
  [v7 _scaledValueForValue:43.0];
  [(UILabel *)self->_headlineLabel _firstLineBaselineOffsetFromBoundsTop];

  _WGMainScreenScale();
  UIRectIntegralWithScale();
  result.size.height = v11;
  result.size.double width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (CGRect)_explanationLabelFrameForBoundsWidth:(double)a3 withHeadlineLabelFrame:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat x = a4.origin.x;
  CGFloat y = a4.origin.y;
  double v37 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v7 = a3 + -60.0;
  -[UILabel sizeThatFits:](self->_explanationLabel, "sizeThatFits:", a3 + -60.0, 1.79769313e308);
  double v9 = v8;
  double v10 = [(UILabel *)self->_explanationLabel font];
  [v10 _scaledValueForValue:27.0];
  double v12 = v11;
  v13 = [(UILabel *)self->_explanationLabel font];
  [v13 descender];
  double v15 = v9 + v12 + v14;

  headlineLabel = self->_headlineLabel;
  BSRectWithSize();
  -[UILabel textRectForBounds:limitedToNumberOfLines:](headlineLabel, "textRectForBounds:limitedToNumberOfLines:", [(UILabel *)self->_headlineLabel numberOfLines], v17, v18, v19, v20);
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  CGFloat v26 = v25;
  CGFloat v28 = v27;
  v39.origin.CGFloat x = x;
  v39.origin.CGFloat y = y;
  v39.size.CGFloat width = width;
  v39.size.CGFloat height = height;
  CGRectGetMaxY(v39);
  v40.origin.CGFloat x = v22;
  v40.origin.CGFloat y = v24;
  v40.size.CGFloat width = v26;
  v40.size.CGFloat height = v28;
  CGRectGetMaxY(v40);
  v41.origin.CGFloat x = v22;
  v41.origin.CGFloat y = v24;
  v41.size.CGFloat width = v26;
  v41.size.CGFloat height = v28;
  CGRectGetHeight(v41);
  v29 = [(UILabel *)self->_explanationLabel font];
  [v29 descender];

  -[UILabel setFrame:](self->_explanationLabel, "setFrame:", 30.0, v37, v7, v15);
  v30 = [(UILabel *)self->_explanationLabel font];
  [v30 _scaledValueForValue:26.0];
  [(UILabel *)self->_explanationLabel _firstLineBaselineOffsetFromBoundsTop];

  _WGMainScreenScale();
  UIRectIntegralWithScale();
  result.size.CGFloat height = v34;
  result.size.CGFloat width = v33;
  result.origin.CGFloat y = v32;
  result.origin.CGFloat x = v31;
  return result;
}

- (void)layoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)WGWidgetListEditViewTableHeaderView;
  [(WGWidgetListEditViewTableHeaderView *)&v15 layoutSubviews];
  [(WGWidgetListEditViewTableHeaderView *)self bounds];
  CGFloat x = v16.origin.x;
  CGFloat y = v16.origin.y;
  CGFloat width = v16.size.width;
  CGFloat height = v16.size.height;
  [(WGWidgetListEditViewTableHeaderView *)self _headlineLabelFrameForBoundsWidth:CGRectGetWidth(v16)];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  -[UILabel setFrame:](self->_headlineLabel, "setFrame:");
  v17.origin.CGFloat x = x;
  v17.origin.CGFloat y = y;
  v17.size.CGFloat width = width;
  v17.size.CGFloat height = height;
  -[WGWidgetListEditViewTableHeaderView _explanationLabelFrameForBoundsWidth:withHeadlineLabelFrame:](self, "_explanationLabelFrameForBoundsWidth:withHeadlineLabelFrame:", CGRectGetWidth(v17), v8, v10, v12, v14);
  -[UILabel setFrame:](self->_explanationLabel, "setFrame:");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_explanationLabel, 0);
  objc_storeStrong((id *)&self->_headlineLabel, 0);
}

@end