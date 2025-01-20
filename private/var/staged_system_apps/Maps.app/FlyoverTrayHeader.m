@interface FlyoverTrayHeader
- (CardButton)button;
- (FlyoverTrayHeader)initWithFrame:(CGRect)a3;
- (ShorteningLabel)subtitleLabel;
- (TrayHeaderDelegate)delegate;
- (UILabel)titleLabel;
- (void)_setupConstraints;
- (void)_setupViews;
- (void)buttonDidTouchUpInside:(id)a3;
- (void)setAttributedSubtitleAlternatives:(id)a3;
- (void)setButton:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)trayHeaderDidReceiveTap:(id)a3;
@end

@implementation FlyoverTrayHeader

- (FlyoverTrayHeader)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)FlyoverTrayHeader;
  v3 = -[FlyoverTrayHeader initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(FlyoverTrayHeader *)v3 setAccessibilityIdentifier:@"FlyoverTrayHeader"];
    [(FlyoverTrayHeader *)v4 _setupViews];
    [(FlyoverTrayHeader *)v4 _setupConstraints];
  }
  return v4;
}

- (void)_setupViews
{
  id v3 = objc_alloc((Class)UILabel);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  id v7 = [v3 initWithFrame:CGRectZero.origin.x, y, width, height];
  [(FlyoverTrayHeader *)self setTitleLabel:v7];

  v8 = [(FlyoverTrayHeader *)self titleLabel];
  [v8 setNumberOfLines:0];

  v9 = [(FlyoverTrayHeader *)self titleLabel];
  LODWORD(v10) = 1132068864;
  [v9 setContentCompressionResistancePriority:0 forAxis:v10];

  v11 = [(FlyoverTrayHeader *)self titleLabel];
  LODWORD(v12) = 1148846080;
  [v11 setContentCompressionResistancePriority:1 forAxis:v12];

  v13 = [(FlyoverTrayHeader *)self titleLabel];
  [v13 setTranslatesAutoresizingMaskIntoConstraints:0];

  v14 = [(FlyoverTrayHeader *)self titleLabel];
  +[DynamicTypeWizard autorefreshLabel:v14 withFontProvider:&stru_1012F17F8];

  v15 = +[UIColor clearColor];
  v16 = [(FlyoverTrayHeader *)self titleLabel];
  [v16 setBackgroundColor:v15];

  v17 = +[UIColor labelColor];
  v18 = [(FlyoverTrayHeader *)self titleLabel];
  [v18 setTextColor:v17];

  v19 = [(FlyoverTrayHeader *)self titleLabel];
  [v19 setAccessibilityIdentifier:@"FlyoverTrayHeaderTitle"];

  v20 = [(FlyoverTrayHeader *)self titleLabel];
  [(FlyoverTrayHeader *)self addSubview:v20];

  v21 = -[ShorteningLabel initWithFrame:]([ShorteningLabel alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  [(FlyoverTrayHeader *)self setSubtitleLabel:v21];

  v22 = +[UIColor secondaryLabelColor];
  v23 = [(FlyoverTrayHeader *)self subtitleLabel];
  [v23 setTextColor:v22];

  v24 = [(FlyoverTrayHeader *)self subtitleLabel];
  [v24 setNumberOfLines:0];

  v25 = [(FlyoverTrayHeader *)self subtitleLabel];
  LODWORD(v26) = 1132068864;
  [v25 setContentCompressionResistancePriority:0 forAxis:v26];

  v27 = [(FlyoverTrayHeader *)self subtitleLabel];
  LODWORD(v28) = 1148846080;
  [v27 setContentCompressionResistancePriority:1 forAxis:v28];

  v29 = [(FlyoverTrayHeader *)self subtitleLabel];
  [v29 setTranslatesAutoresizingMaskIntoConstraints:0];

  v30 = [(FlyoverTrayHeader *)self subtitleLabel];
  +[DynamicTypeWizard autorefreshLabel:v30 withFontProvider:&stru_1012F17D8];

  v31 = +[UIColor clearColor];
  v32 = [(FlyoverTrayHeader *)self subtitleLabel];
  [v32 setBackgroundColor:v31];

  v33 = [(FlyoverTrayHeader *)self subtitleLabel];
  [v33 setAccessibilityIdentifier:@"FlyoverTrayHeaderSubtitle"];

  v34 = [(FlyoverTrayHeader *)self subtitleLabel];
  [(FlyoverTrayHeader *)self addSubview:v34];

  v35 = [CardButton alloc];
  v36 = +[CardButtonConfiguration close];
  v38 = [(CardButton *)v35 initWithConfiguration:v36];

  [(CardButton *)v38 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(CardButton *)v38 addTarget:self action:"buttonDidTouchUpInside:" forControlEvents:64];
  [(CardButton *)v38 setAccessibilityIdentifier:@"FlyoverTrayHeaderButton"];
  [(FlyoverTrayHeader *)self addSubview:v38];
  [(FlyoverTrayHeader *)self setButton:v38];
  id v37 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"trayHeaderDidReceiveTap:"];
  [(FlyoverTrayHeader *)self addGestureRecognizer:v37];
}

- (void)_setupConstraints
{
  id v3 = [(FlyoverTrayHeader *)self titleLabel];
  uint64_t v4 = [(FlyoverTrayHeader *)self subtitleLabel];
  v35 = [(FlyoverTrayHeader *)self button];
  v5 = (void *)v4;
  objc_super v6 = v3;
  v34 = _NSDictionaryOfVariableBindings(@"titleLabel, subtitleLabel, button", v3, v4, v35, 0);
  CFStringRef v37 = @"margin";
  id v7 = +[NSNumber numberWithDouble:16.0];
  v38 = v7;
  uint64_t v8 = +[NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];

  v33 = (void *)v8;
  v9 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"H:|-(margin)-[titleLabel]-(>=margin)-[button]|", 0, v8, v34);
  +[NSLayoutConstraint activateConstraints:v9];

  double v10 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"H:|-(margin)-[subtitleLabel]-(>=margin)-[button]|", 0, v8, v34);
  +[NSLayoutConstraint activateConstraints:v10];

  v31 = v6;
  v32 = [v6 firstBaselineAnchor];
  v30 = [(FlyoverTrayHeader *)self topAnchor];
  v29 = [v32 constraintEqualToAnchor:v30];
  +[DynamicTypeWizard autoscaledConstraint:v29 constant:&stru_1012F17F8 withFontProvider:35.0];
  double v28 = v27 = v5;
  v36[0] = v28;
  double v26 = [v5 firstBaselineAnchor];
  v25 = [v6 lastBaselineAnchor];
  v24 = [v26 constraintEqualToAnchor:v25];
  v23 = +[DynamicTypeWizard autoscaledConstraint:v24 constant:&stru_1012F17D8 withFontProvider:21.0];
  v36[1] = v23;
  v22 = [v5 firstBaselineAnchor];
  v21 = [(FlyoverTrayHeader *)self bottomAnchor];
  v11 = [v22 constraintEqualToAnchor:v21 constant:-21.0];
  v36[2] = v11;
  double v12 = [(FlyoverTrayHeader *)self button];
  v13 = [v12 topAnchor];
  v14 = [(FlyoverTrayHeader *)self topAnchor];
  v15 = [v13 constraintEqualToAnchor:v14];
  v36[3] = v15;
  v16 = [(FlyoverTrayHeader *)self button];
  v17 = [v16 trailingAnchor];
  v18 = [(FlyoverTrayHeader *)self trailingAnchor];
  v19 = [v17 constraintEqualToAnchor:v18];
  v36[4] = v19;
  v20 = +[NSArray arrayWithObjects:v36 count:5];
  +[NSLayoutConstraint activateConstraints:v20];
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(FlyoverTrayHeader *)self titleLabel];
  [v5 setText:v4];
}

- (void)setSubtitle:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)NSAttributedString) initWithString:v4];

  id v7 = v5;
  objc_super v6 = +[NSArray arrayWithObjects:&v7 count:1];
  [(FlyoverTrayHeader *)self setAttributedSubtitleAlternatives:v6];
}

- (void)setAttributedSubtitleAlternatives:(id)a3
{
  id v8 = a3;
  if ([v8 count])
  {
    id v4 = [v8 firstObject];
    id v5 = [(FlyoverTrayHeader *)self subtitleLabel];
    [v5 setAttributedText:v4];

    objc_super v6 = [(FlyoverTrayHeader *)self subtitleLabel];
    [v6 sizeToFit];
  }
  id v7 = [(FlyoverTrayHeader *)self subtitleLabel];
  [v7 setAttributedTextAlternatives:v8];
}

- (void)buttonDidTouchUpInside:(id)a3
{
  id v4 = a3;
  id v5 = [(FlyoverTrayHeader *)self delegate];
  [v5 trayHeaderButtonDidTouchUpInside:v4];
}

- (void)trayHeaderDidReceiveTap:(id)a3
{
  id v3 = [(FlyoverTrayHeader *)self delegate];
  [v3 trayHeaderDidReceiveTap];
}

- (TrayHeaderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TrayHeaderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (ShorteningLabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
}

- (CardButton)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end