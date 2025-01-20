@interface LookAroundTrayHeaderViewController
- (BOOL)_canShowWhileLocked;
- (NSString)subtitle;
- (NSString)title;
- (TrayHeaderDelegate)delegate;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (void)_setupConstraints;
- (void)_setupViews;
- (void)setDelegate:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)trayHeaderDidReceiveTap:(id)a3;
- (void)viewDidLoad;
@end

@implementation LookAroundTrayHeaderViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)LookAroundTrayHeaderViewController;
  [(LookAroundTrayHeaderViewController *)&v3 viewDidLoad];
  [(LookAroundTrayHeaderViewController *)self _setupViews];
  [(LookAroundTrayHeaderViewController *)self _setupConstraints];
}

- (NSString)title
{
  return [(UILabel *)self->_titleLabel text];
}

- (void)setTitle:(id)a3
{
  id v4 = [a3 copy];
  [(UILabel *)self->_titleLabel setText:v4];
}

- (NSString)subtitle
{
  return [(UILabel *)self->_subtitleLabel text];
}

- (void)setSubtitle:(id)a3
{
  id v4 = [a3 copy];
  [(UILabel *)self->_subtitleLabel setText:v4];
}

- (void)trayHeaderDidReceiveTap:(id)a3
{
  id v3 = [(LookAroundTrayHeaderViewController *)self delegate];
  [v3 trayHeaderDidReceiveTap];
}

- (void)_setupViews
{
  id v3 = objc_alloc((Class)UILabel);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v7 = [v3 initWithFrame:CGRectZero.origin.x, y, width, height];
  titleLabel = self->_titleLabel;
  self->_titleLabel = v7;

  [(UILabel *)self->_titleLabel setNumberOfLines:2];
  [(UILabel *)self->_titleLabel setText:@" "];
  LODWORD(v9) = 1132068864;
  [(UILabel *)self->_titleLabel setContentCompressionResistancePriority:0 forAxis:v9];
  LODWORD(v10) = 1148846080;
  [(UILabel *)self->_titleLabel setContentCompressionResistancePriority:1 forAxis:v10];
  [(UILabel *)self->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  +[DynamicTypeWizard autorefreshLabel:self->_titleLabel withFontProvider:&stru_1012FF618];
  v11 = +[UIColor clearColor];
  [(UILabel *)self->_titleLabel setBackgroundColor:v11];

  v12 = +[UIColor labelColor];
  [(UILabel *)self->_titleLabel setTextColor:v12];

  [(UILabel *)self->_titleLabel setAccessibilityIdentifier:@"LookAroundTrayHeaderTitle"];
  v13 = [(LookAroundTrayHeaderViewController *)self view];
  [v13 addSubview:self->_titleLabel];

  v14 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
  subtitleLabel = self->_subtitleLabel;
  self->_subtitleLabel = v14;

  [(UILabel *)self->_subtitleLabel setNumberOfLines:2];
  [(UILabel *)self->_subtitleLabel setText:@" "];
  LODWORD(v16) = 1132068864;
  [(UILabel *)self->_subtitleLabel setContentCompressionResistancePriority:0 forAxis:v16];
  LODWORD(v17) = 1148846080;
  [(UILabel *)self->_subtitleLabel setContentCompressionResistancePriority:1 forAxis:v17];
  [(UILabel *)self->_subtitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  +[DynamicTypeWizard autorefreshLabel:self->_subtitleLabel withFontProvider:&stru_1012FF5F8];
  v18 = +[UIColor clearColor];
  [(UILabel *)self->_subtitleLabel setBackgroundColor:v18];

  v19 = +[UIColor secondaryLabelColor];
  [(UILabel *)self->_subtitleLabel setTextColor:v19];

  [(UILabel *)self->_subtitleLabel setAccessibilityIdentifier:@"LookAroundTrayHeaderSubtitle"];
  v20 = [(LookAroundTrayHeaderViewController *)self view];
  [v20 addSubview:self->_subtitleLabel];

  id v22 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"trayHeaderDidReceiveTap:"];
  v21 = [(LookAroundTrayHeaderViewController *)self view];
  [v21 addGestureRecognizer:v22];
}

- (void)_setupConstraints
{
  v31 = [(UILabel *)self->_titleLabel leadingAnchor];
  v32 = [(LookAroundTrayHeaderViewController *)self view];
  v30 = [v32 leadingAnchor];
  v29 = [v31 constraintEqualToAnchor:v30 constant:16.0];
  v33[0] = v29;
  v27 = [(UILabel *)self->_titleLabel trailingAnchor];
  v28 = [(LookAroundTrayHeaderViewController *)self view];
  v26 = [v28 trailingAnchor];
  v25 = [v27 constraintEqualToAnchor:v26 constant:-16.0];
  v33[1] = v25;
  v23 = [(UILabel *)self->_titleLabel firstBaselineAnchor];
  v24 = [(LookAroundTrayHeaderViewController *)self view];
  id v22 = [v24 topAnchor];
  v21 = [v23 constraintEqualToAnchor:v22];
  v20 = +[DynamicTypeWizard autoscaledConstraint:v21 constant:&stru_1012FF618 withFontProvider:35.0];
  v33[2] = v20;
  v18 = [(UILabel *)self->_subtitleLabel leadingAnchor];
  v19 = [(LookAroundTrayHeaderViewController *)self view];
  double v17 = [v19 leadingAnchor];
  double v16 = [v18 constraintEqualToAnchor:v17 constant:16.0];
  v33[3] = v16;
  v14 = [(UILabel *)self->_subtitleLabel trailingAnchor];
  v15 = [(LookAroundTrayHeaderViewController *)self view];
  v13 = [v15 trailingAnchor];
  id v3 = [v14 constraintEqualToAnchor:v13 constant:-16.0];
  v33[4] = v3;
  id v4 = [(UILabel *)self->_subtitleLabel firstBaselineAnchor];
  v5 = [(UILabel *)self->_titleLabel lastBaselineAnchor];
  v6 = [v4 constraintEqualToAnchor:v5];
  v7 = +[DynamicTypeWizard autoscaledConstraint:v6 constant:&stru_1012FF5F8 withFontProvider:21.0];
  v33[5] = v7;
  v8 = [(LookAroundTrayHeaderViewController *)self view];
  double v9 = [v8 bottomAnchor];
  double v10 = [(UILabel *)self->_subtitleLabel lastBaselineAnchor];
  v11 = [v9 constraintEqualToAnchor:v10 constant:21.0];
  v33[6] = v11;
  v12 = +[NSArray arrayWithObjects:v33 count:7];
  +[NSLayoutConstraint activateConstraints:v12];
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

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end