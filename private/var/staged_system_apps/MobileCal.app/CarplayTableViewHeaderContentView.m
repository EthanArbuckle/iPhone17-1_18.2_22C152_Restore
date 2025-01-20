@interface CarplayTableViewHeaderContentView
+ (double)height;
- (BOOL)anyCalendarsHiddenByFocus;
- (CarplayTableViewHeaderContentView)init;
- (UILabel)label;
- (UIView)separator;
- (id)_labelFont;
- (void)_createAndAddSeparatorView;
- (void)_createAndAddTitleView;
- (void)_createFocusImageView;
- (void)_setAnyCalendarsHiddenByFocus:(BOOL)a3 forceUpdate:(BOOL)a4;
- (void)setAnyCalendarsHiddenByFocus:(BOOL)a3;
- (void)setLabel:(id)a3;
- (void)setSeparator:(id)a3;
@end

@implementation CarplayTableViewHeaderContentView

+ (double)height
{
  return 44.0;
}

- (void)_createAndAddSeparatorView
{
  v3 = (UIView *)objc_opt_new();
  separator = self->_separator;
  self->_separator = v3;

  [(UIView *)self->_separator setTranslatesAutoresizingMaskIntoConstraints:0];
  v5 = +[UIColor separatorColor];
  [(UIView *)self->_separator setBackgroundColor:v5];

  v6 = self->_separator;

  [(CarplayTableViewHeaderContentView *)self addSubview:v6];
}

- (void)_createAndAddTitleView
{
  v3 = (UILabel *)objc_alloc_init((Class)UILabel);
  label = self->_label;
  self->_label = v3;

  v5 = +[UIColor labelColor];
  [(UILabel *)self->_label setTextColor:v5];

  v6 = [(CarplayTableViewHeaderContentView *)self _labelFont];
  [(UILabel *)self->_label setFont:v6];

  [(UILabel *)self->_label setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v7) = 1144733696;
  [(UILabel *)self->_label setContentCompressionResistancePriority:0 forAxis:v7];
  v8 = self->_label;

  [(CarplayTableViewHeaderContentView *)self addSubview:v8];
}

- (void)_createFocusImageView
{
  id v7 = +[UIImage systemImageNamed:@"moon.fill"];
  v3 = (UIImageView *)[objc_alloc((Class)UIImageView) initWithImage:v7];
  focusImageView = self->_focusImageView;
  self->_focusImageView = v3;

  [(UIImageView *)self->_focusImageView setTranslatesAutoresizingMaskIntoConstraints:0];
  v5 = +[UIColor systemIndigoColor];
  [(UIImageView *)self->_focusImageView setTintColor:v5];

  v6 = +[UIImageSymbolConfiguration configurationWithTextStyle:UIFontTextStyleTitle1];
  [(UIImageView *)self->_focusImageView setPreferredSymbolConfiguration:v6];
}

- (void)setAnyCalendarsHiddenByFocus:(BOOL)a3
{
}

- (void)_setAnyCalendarsHiddenByFocus:(BOOL)a3 forceUpdate:(BOOL)a4
{
  if (self->_anyCalendarsHiddenByFocus != a3 || a4)
  {
    BOOL v5 = a3;
    self->_anyCalendarsHiddenByFocus = a3;
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", self->_focusImageViewConstraints, a4);
    [(NSMutableArray *)self->_focusImageViewConstraints removeAllObjects];
    if (v5)
    {
      [(CarplayTableViewHeaderContentView *)self addSubview:self->_focusImageView];
      focusImageViewConstraints = self->_focusImageViewConstraints;
      v8 = [(UIImageView *)self->_focusImageView leadingAnchor];
      v9 = [(UILabel *)self->_label trailingAnchor];
      v10 = [v8 constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:v9 multiplier:1.0];
      [(NSMutableArray *)focusImageViewConstraints addObject:v10];

      v11 = self->_focusImageViewConstraints;
      v12 = [(UIImageView *)self->_focusImageView trailingAnchor];
      v13 = [(CarplayTableViewHeaderContentView *)self trailingAnchor];
      v14 = [v12 constraintEqualToAnchor:v13];
      [(NSMutableArray *)v11 addObject:v14];

      v15 = self->_focusImageViewConstraints;
      v16 = [(UIImageView *)self->_focusImageView firstBaselineAnchor];
      [(UILabel *)self->_label firstBaselineAnchor];
    }
    else
    {
      [(UIImageView *)self->_focusImageView removeFromSuperview];
      v15 = self->_focusImageViewConstraints;
      v16 = [(UILabel *)self->_label trailingAnchor];
      [(CarplayTableViewHeaderContentView *)self trailingAnchor];
    v17 = };
    v18 = [v16 constraintEqualToAnchor:v17];
    [(NSMutableArray *)v15 addObject:v18];

    v19 = self->_focusImageViewConstraints;
    +[NSLayoutConstraint activateConstraints:v19];
  }
}

- (CarplayTableViewHeaderContentView)init
{
  v26.receiver = self;
  v26.super_class = (Class)CarplayTableViewHeaderContentView;
  v2 = [(CarplayTableViewHeaderContentView *)&v26 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableArray array];
    focusImageViewConstraints = v2->_focusImageViewConstraints;
    v2->_focusImageViewConstraints = (NSMutableArray *)v3;

    [(CarplayTableViewHeaderContentView *)v2 _createAndAddSeparatorView];
    [(CarplayTableViewHeaderContentView *)v2 _createAndAddTitleView];
    [(CarplayTableViewHeaderContentView *)v2 _createFocusImageView];
    [(CarplayTableViewHeaderContentView *)v2 _setAnyCalendarsHiddenByFocus:0 forceUpdate:1];
    v25 = [(UIView *)v2->_separator leadingAnchor];
    v24 = [(CarplayTableViewHeaderContentView *)v2 leadingAnchor];
    v23 = [v25 constraintEqualToAnchor:v24];
    v27[0] = v23;
    v22 = [(UIView *)v2->_separator trailingAnchor];
    v21 = [(CarplayTableViewHeaderContentView *)v2 trailingAnchor];
    v20 = [v22 constraintEqualToAnchor:v21];
    v27[1] = v20;
    v19 = [(UIView *)v2->_separator topAnchor];
    v18 = [(CarplayTableViewHeaderContentView *)v2 topAnchor];
    v17 = [v19 constraintEqualToAnchor:v18];
    v27[2] = v17;
    v16 = [(UIView *)v2->_separator heightAnchor];
    v15 = [v16 constraintEqualToConstant:1.0];
    v27[3] = v15;
    BOOL v5 = [(UILabel *)v2->_label leadingAnchor];
    v6 = [(CarplayTableViewHeaderContentView *)v2 leadingAnchor];
    id v7 = [v5 constraintEqualToAnchor:v6];
    v27[4] = v7;
    v8 = [(UILabel *)v2->_label firstBaselineAnchor];
    v9 = [(UIView *)v2->_separator bottomAnchor];
    v10 = [v8 constraintEqualToAnchor:v9 constant:32.0];
    v27[5] = v10;
    v11 = [(CarplayTableViewHeaderContentView *)v2 heightAnchor];
    v12 = [v11 constraintEqualToConstant:44.0];
    v27[6] = v12;
    v13 = +[NSArray arrayWithObjects:v27 count:7];
    +[NSLayoutConstraint activateConstraints:v13];
  }
  return v2;
}

- (id)_labelFont
{
  v2 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleTitle1];
  uint64_t v3 = [v2 fontDescriptorWithSymbolicTraits:2];

  v4 = +[UIFont fontWithDescriptor:v3 size:0.0];

  return v4;
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (UIView)separator
{
  return self->_separator;
}

- (void)setSeparator:(id)a3
{
}

- (BOOL)anyCalendarsHiddenByFocus
{
  return self->_anyCalendarsHiddenByFocus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separator, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_focusImageViewConstraints, 0);

  objc_storeStrong((id *)&self->_focusImageView, 0);
}

@end