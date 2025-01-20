@interface _UICalendarHeaderTitleButton
- (CGAffineTransform)chevronTransform;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)fontDesign;
- (_UICalendarHeaderTitleButton)initWithFrame:(CGRect)a3;
- (void)_updateChevron;
- (void)_updateFont;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setChevronTransform:(CGAffineTransform *)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setFontDesign:(id)a3;
- (void)updateTitles:(id)a3 isExpanded:(BOOL)a4;
@end

@implementation _UICalendarHeaderTitleButton

- (_UICalendarHeaderTitleButton)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_UICalendarHeaderTitleButton;
  v3 = -[UIButton initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (_UIDatePickerLinkedLabel *)objc_opt_new();
    [(UIView *)v4 setUserInteractionEnabled:0];
    [(_UIDatePickerLinkedLabel *)v4 setAdjustsFontForContentSizeCategory:1];
    v5 = +[UIColor labelColor];
    [(_UIDatePickerLinkedLabel *)v4 setTextColor:v5];

    [(UIView *)v3 addSubview:v4];
    monthYearLabel = v3->_monthYearLabel;
    v3->_monthYearLabel = v4;

    [(_UICalendarHeaderTitleButton *)v3 _updateChevron];
  }
  return v3;
}

- (void)setEnabled:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UICalendarHeaderTitleButton;
  [(UIButton *)&v4 setEnabled:a3];
  [(_UICalendarHeaderTitleButton *)self _updateChevron];
}

- (CGAffineTransform)chevronTransform
{
  result = (CGAffineTransform *)self->_chevron;
  if (result) {
    return (CGAffineTransform *)[(CGAffineTransform *)result transform];
  }
  uint64_t v4 = MEMORY[0x1E4F1DAB8];
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&retstr->c = v5;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v4 + 32);
  return result;
}

- (void)setChevronTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->c;
  v4[0] = *(_OWORD *)&a3->a;
  v4[1] = v3;
  v4[2] = *(_OWORD *)&a3->tx;
  [(UIView *)self->_chevron setTransform:v4];
}

- (void)setFontDesign:(id)a3
{
  long long v5 = (NSString *)a3;
  if (self->_fontDesign != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_fontDesign, a3);
    [(_UICalendarHeaderTitleButton *)self _updateFont];
    long long v5 = v6;
  }
}

- (void)updateTitles:(id)a3 isExpanded:(BOOL)a4
{
  id v6 = a3;
  v7 = [(UIView *)self traitCollection];
  _UICalendarViewGetPlatformMetrics([v7 userInterfaceIdiom]);
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  [(_UIDatePickerLinkedLabel *)self->_monthYearLabel setTitles:v6];
  if (a4)
  {
    objc_super v8 = [v11 expandedMonthYearLabelColor];
    [(_UIDatePickerLinkedLabel *)self->_monthYearLabel setTextColor:v8];

    [v11 expandedMonthYearChevronColor];
  }
  else
  {
    v9 = [v11 monthYearLabelColor];
    [(_UIDatePickerLinkedLabel *)self->_monthYearLabel setTextColor:v9];

    [v11 monthYearChevronColor];
  v10 = };
  [(UIView *)self->_chevron setTintColor:v10];
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)_UICalendarHeaderTitleButton;
  [(UIView *)&v4 didMoveToWindow];
  long long v3 = [(UIView *)self window];

  if (v3) {
    [(UIButton *)self setNeedsLayout];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v6 = [(UIView *)self traitCollection];
  v7 = _UICalendarViewGetPlatformMetrics([v6 userInterfaceIdiom]);

  -[UIImageView sizeThatFits:](self->_chevron, "sizeThatFits:", width, height);
  double v10 = v9;
  if (self->_chevron) {
    double v11 = v8 + 4.0;
  }
  else {
    double v11 = v8;
  }
  -[_UIDatePickerLinkedLabel sizeThatFits:](self->_monthYearLabel, "sizeThatFits:", width, height);
  double v13 = v11 + v12;
  double v15 = fmax(v10, v14);
  [v7 monthYearContainerEdgeInsets];
  double v18 = v13 - (v16 + v17);
  double v21 = v15 - (v19 + v20);

  double v22 = v18;
  double v23 = v21;
  result.double height = v23;
  result.double width = v22;
  return result;
}

- (void)layoutSubviews
{
  v49.receiver = self;
  v49.super_class = (Class)_UICalendarHeaderTitleButton;
  [(UIButton *)&v49 layoutSubviews];
  long long v3 = [(UIView *)self traitCollection];
  objc_super v4 = _UICalendarViewGetPlatformMetrics([v3 userInterfaceIdiom]);

  [(UIView *)self bounds];
  double v8 = v7;
  double v10 = v9;
  double v11 = v5;
  double v12 = v6;
  chevron = self->_chevron;
  if (chevron)
  {
    -[UIImageView sizeThatFits:](chevron, "sizeThatFits:", v5, v6);
    double v15 = v14;
    double v48 = v16;
  }
  else
  {
    double v15 = *MEMORY[0x1E4F1DB30];
    double v48 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  -[_UIDatePickerLinkedLabel sizeThatFits:](self->_monthYearLabel, "sizeThatFits:", v11 - v15 + -4.0, v12);
  double v18 = v17;
  BOOL v19 = [(UIView *)self _shouldReverseLayoutDirection];
  [v4 monthYearContainerEdgeInsets];
  double v23 = v8 - v22;
  double v25 = v10 - v24;
  double v26 = v11 - (-v21 - v22);
  double v27 = v12 - (-v20 - v24);
  double v28 = v23;
  if (v19)
  {
    v50.origin.x = v23;
    v50.origin.y = v25;
    v50.size.double width = v26;
    v50.size.double height = v27;
    double v28 = CGRectGetMaxX(v50) - v18;
  }
  -[_UIDatePickerLinkedLabel setFrame:](self->_monthYearLabel, "setFrame:", v28, v25, v18, v27);
  if (self->_chevron)
  {
    double v47 = v15;
    [(UIView *)self->_monthYearLabel layoutBelowIfNeeded];
    monthYearLabel = self->_monthYearLabel;
    v30 = [(_UIDatePickerLinkedLabel *)monthYearLabel contentLayoutGuide];
    [v30 layoutFrame];
    -[UIView convertRect:toView:](monthYearLabel, "convertRect:toView:", self);
    uint64_t v32 = v31;
    uint64_t v34 = v33;
    uint64_t v36 = v35;
    uint64_t rect = v37;

    v51.origin.x = v23;
    v51.origin.y = v25;
    v51.size.double width = v26;
    v51.size.double height = v27;
    CGFloat v38 = (CGRectGetHeight(v51) - v48) * 0.5;
    v52.origin.x = v23;
    v52.origin.y = v25;
    v52.size.double width = v26;
    v52.size.double height = v27;
    double v39 = CGRectGetMinY(v52) + v38;
    uint64_t v40 = v32;
    uint64_t v41 = v34;
    uint64_t v42 = v36;
    uint64_t v43 = rect;
    if (v19)
    {
      double v44 = v47;
      double v45 = CGRectGetMinX(*(CGRect *)&v40) + -4.0 - v47;
    }
    else
    {
      double v45 = CGRectGetMaxX(*(CGRect *)&v40) + 4.0;
      double v44 = v47;
    }
    -[UIImageView setBounds:](self->_chevron, "setBounds:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v44, v48);
    -[UIImageView setCenter:](self->_chevron, "setCenter:", v44 * 0.5 + v45, v48 * 0.5 + v39);
  }
}

- (void)_updateChevron
{
  if ([(UIControl *)self isEnabled] || (long long v3 = self->_chevron) == 0)
  {
    if ([(UIControl *)self isEnabled] && !self->_chevron)
    {
      double v5 = (UIImageView *)objc_opt_new();
      [(UIView *)v5 setUserInteractionEnabled:0];
      [(UIImageView *)v5 setAdjustsImageSizeForAccessibilityContentSizeCategory:1];
      double v6 = +[UIImage systemImageNamed:@"chevron.forward"];
      [(UIImageView *)v5 setImage:v6];

      [(UIView *)self addSubview:v5];
      chevron = self->_chevron;
      self->_chevron = v5;

      [(_UICalendarHeaderTitleButton *)self _updateFont];
    }
  }
  else
  {
    [(UIView *)v3 removeFromSuperview];
    objc_super v4 = self->_chevron;
    self->_chevron = 0;
  }
}

- (void)_updateFont
{
  long long v3 = [(UIView *)self traitCollection];
  _UICalendarViewGetPlatformMetrics([v3 userInterfaceIdiom]);
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_super v4 = [v11 monthYearLabelFontProvider];
  double v5 = [(_UICalendarHeaderTitleButton *)self fontDesign];
  double v6 = [(UIView *)self traitCollection];
  double v7 = ((void (**)(void, void *, void *))v4)[2](v4, v5, v6);
  [(_UIDatePickerLinkedLabel *)self->_monthYearLabel setFont:v7];

  double v8 = [v11 monthYearChevronSymbolConfiguration];
  double v9 = [(UIView *)self traitCollection];
  double v10 = ((void (**)(void, void *))v8)[2](v8, v9);
  [(UIImageView *)self->_chevron setPreferredSymbolConfiguration:v10];
}

- (NSString)fontDesign
{
  return self->_fontDesign;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fontDesign, 0);
  objc_storeStrong((id *)&self->_chevron, 0);
  objc_storeStrong((id *)&self->_monthYearLabel, 0);
}

@end