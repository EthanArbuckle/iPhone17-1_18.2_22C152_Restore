@interface BlurredBackgroundLabel
- (BlurredBackgroundLabel)init;
- (BlurredBackgroundLabel)initWithFrame:(CGRect)a3;
- (NSString)groupName;
- (NSString)text;
- (void)_contentSizeDidChange;
- (void)_setupConstraints;
- (void)_setupSubviews;
- (void)_sharedInit;
- (void)setGroupName:(id)a3;
- (void)setText:(id)a3;
@end

@implementation BlurredBackgroundLabel

- (BlurredBackgroundLabel)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BlurredBackgroundLabel;
  v3 = -[BlurredBackgroundLabel initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(BlurredBackgroundLabel *)v3 _sharedInit];
  }
  return v4;
}

- (BlurredBackgroundLabel)init
{
  v5.receiver = self;
  v5.super_class = (Class)BlurredBackgroundLabel;
  v2 = [(BlurredBackgroundLabel *)&v5 init];
  v3 = v2;
  if (v2) {
    [(BlurredBackgroundLabel *)v2 _sharedInit];
  }
  return v3;
}

- (void)_sharedInit
{
  v3 = +[UIColor clearColor];
  [(BlurredBackgroundLabel *)self setBackgroundColor:v3];

  [(BlurredBackgroundLabel *)self _setupSubviews];
  [(BlurredBackgroundLabel *)self _setupConstraints];
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"_contentSizeDidChange" name:UIContentSizeCategoryDidChangeNotification object:0];
}

- (void)_setupSubviews
{
  id v3 = objc_alloc((Class)UIVisualEffectView);
  id v4 = +[UIBlurEffect effectWithStyle:6];
  objc_super v5 = (UIVisualEffectView *)[v3 initWithEffect:v4];
  backgroundEffectView = self->_backgroundEffectView;
  self->_backgroundEffectView = v5;

  v7 = (UILabel *)objc_alloc_init((Class)UILabel);
  label = self->_label;
  self->_label = v7;

  [(UILabel *)self->_label setNumberOfLines:0];
  [(UILabel *)self->_label setAdjustsFontSizeToFitWidth:1];
  v9 = self->_label;
  v10 = +[RAPFontManager mapDescriptionView];
  [(UILabel *)v9 setFont:v10];

  v11 = self->_label;
  v12 = +[UIColor secondaryLabelColor];
  [(UILabel *)v11 setTextColor:v12];

  [(UIVisualEffectView *)self->_backgroundEffectView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_label setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_label setTextAlignment:1];
  [(BlurredBackgroundLabel *)self addSubview:self->_backgroundEffectView];
  id v13 = [(UIVisualEffectView *)self->_backgroundEffectView contentView];
  [v13 addSubview:self->_label];
}

- (void)_setupConstraints
{
  id v3 = [(UILabel *)self->_label firstBaselineAnchor];
  id v4 = [(UIVisualEffectView *)self->_backgroundEffectView topAnchor];
  objc_super v5 = [(UILabel *)self->_label font];
  [v5 _scaledValueForValue:25.0];
  [v3 constraintEqualToAnchor:v4];
  objc_super v6 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  topToFirstBaselineConstraint = self->_topToFirstBaselineConstraint;
  self->_topToFirstBaselineConstraint = v6;

  v8 = [(UIVisualEffectView *)self->_backgroundEffectView bottomAnchor];
  v9 = [(UILabel *)self->_label lastBaselineAnchor];
  v10 = [(UILabel *)self->_label font];
  [v10 _scaledValueForValue:15.0];
  [v8 constraintEqualToAnchor:v9];
  v11 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  lastBaselineToBottomConstraint = self->_lastBaselineToBottomConstraint;
  self->_lastBaselineToBottomConstraint = v11;

  v32 = [(UIVisualEffectView *)self->_backgroundEffectView leadingAnchor];
  v31 = [(BlurredBackgroundLabel *)self leadingAnchor];
  v30 = [v32 constraintEqualToAnchor:v31];
  v33[0] = v30;
  v29 = [(UIVisualEffectView *)self->_backgroundEffectView trailingAnchor];
  v28 = [(BlurredBackgroundLabel *)self trailingAnchor];
  v27 = [v29 constraintEqualToAnchor:v28];
  v33[1] = v27;
  v26 = [(UIVisualEffectView *)self->_backgroundEffectView topAnchor];
  v25 = [(BlurredBackgroundLabel *)self topAnchor];
  v24 = [v26 constraintEqualToAnchor:v25];
  v33[2] = v24;
  id v13 = [(UIVisualEffectView *)self->_backgroundEffectView bottomAnchor];
  v14 = [(BlurredBackgroundLabel *)self bottomAnchor];
  v15 = [v13 constraintEqualToAnchor:v14];
  v33[3] = v15;
  v16 = [(UILabel *)self->_label leadingAnchor];
  v17 = [(UIVisualEffectView *)self->_backgroundEffectView leadingAnchor];
  v18 = [v16 constraintEqualToAnchor:v17 constant:5.0];
  v33[4] = v18;
  v19 = [(UILabel *)self->_label trailingAnchor];
  v20 = [(UIVisualEffectView *)self->_backgroundEffectView trailingAnchor];
  v21 = [v19 constraintEqualToAnchor:v20 constant:-5.0];
  v22 = self->_topToFirstBaselineConstraint;
  v33[5] = v21;
  v33[6] = v22;
  v33[7] = self->_lastBaselineToBottomConstraint;
  v23 = +[NSArray arrayWithObjects:v33 count:8];
  +[NSLayoutConstraint activateConstraints:v23];
}

- (void)setText:(id)a3
{
  id v5 = a3;
  if (!-[NSString isEqualToString:](self->_text, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_text, a3);
    [(UILabel *)self->_label setText:v5];
    [(BlurredBackgroundLabel *)self setAccessibilityLabel:v5];
  }
}

- (void)setGroupName:(id)a3
{
  p_groupName = &self->_groupName;
  id v6 = a3;
  if (!-[NSString isEqualToString:](*p_groupName, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_groupName, a3);
    [(UIVisualEffectView *)self->_backgroundEffectView _setGroupName:*p_groupName];
  }
}

- (void)_contentSizeDidChange
{
  id v3 = +[RAPFontManager mapDescriptionView];
  [(UILabel *)self->_label setFont:v3];

  id v4 = [(UILabel *)self->_label font];
  [v4 _scaledValueForValue:25.0];
  -[NSLayoutConstraint setConstant:](self->_topToFirstBaselineConstraint, "setConstant:");

  id v5 = [(UILabel *)self->_label font];
  [v5 _scaledValueForValue:15.0];
  -[NSLayoutConstraint setConstant:](self->_lastBaselineToBottomConstraint, "setConstant:");
}

- (NSString)text
{
  return self->_text;
}

- (NSString)groupName
{
  return self->_groupName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_lastBaselineToBottomConstraint, 0);
  objc_storeStrong((id *)&self->_topToFirstBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_label, 0);

  objc_storeStrong((id *)&self->_backgroundEffectView, 0);
}

@end