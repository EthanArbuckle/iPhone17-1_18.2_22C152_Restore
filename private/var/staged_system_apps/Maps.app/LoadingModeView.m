@interface LoadingModeView
- (LoadingModeView)initWithTitle:(id)a3;
- (LoadingModeView)initWithTitle:(id)a3 axis:(int64_t)a4;
- (NSString)title;
- (double)bottomInset;
- (double)fittingHeight;
- (void)setBottomInset:(double)a3;
- (void)setTitle:(id)a3;
- (void)setTitleColor:(id)a3;
- (void)setTitleFont:(id)a3;
- (void)setupConstraints;
- (void)startAnimating;
- (void)stopAnimating;
- (void)updateTheme;
@end

@implementation LoadingModeView

- (void)updateTheme
{
  v4.receiver = self;
  v4.super_class = (Class)LoadingModeView;
  [(MapsThemeView *)&v4 updateTheme];
  v3 = [(LoadingModeView *)self theme];
  -[UIActivityIndicatorView setActivityIndicatorViewStyle:](self->_activityView, "setActivityIndicatorViewStyle:", [v3 activityIndicatorStyle]);
}

- (LoadingModeView)initWithTitle:(id)a3
{
  return [(LoadingModeView *)self initWithTitle:a3 axis:1];
}

- (LoadingModeView)initWithTitle:(id)a3 axis:(int64_t)a4
{
  id v6 = a3;
  v7 = +[UIScreen mainScreen];
  [v7 bounds];
  v21.receiver = self;
  v21.super_class = (Class)LoadingModeView;
  v8 = -[LoadingModeView initWithFrame:](&v21, "initWithFrame:");

  if (v8)
  {
    [(LoadingModeView *)v8 _setHostsLayoutEngine:1];
    [(LoadingModeView *)v8 setUserInteractionEnabled:0];
    v9 = +[UIColor clearColor];
    [(LoadingModeView *)v8 setBackgroundColor:v9];

    [(LoadingModeView *)v8 setClipsToBounds:1];
    v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    [(LoadingModeView *)v8 setAccessibilityIdentifier:v11];

    v8->_axis = a4;
    id v12 = objc_alloc((Class)UIView);
    [(LoadingModeView *)v8 bounds];
    v13 = [v12 initWithFrame:];
    contentView = v8->_contentView;
    v8->_contentView = v13;

    [(UIView *)v8->_contentView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v8->_contentView setAccessibilityIdentifier:@"LoadingModeContentView"];
    [(LoadingModeView *)v8 addSubview:v8->_contentView];
    v15 = (UIActivityIndicatorView *)[objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
    activityView = v8->_activityView;
    v8->_activityView = v15;

    [(UIActivityIndicatorView *)v8->_activityView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIActivityIndicatorView *)v8->_activityView setAccessibilityIdentifier:@"LoadingModeActivityView"];
    [(UIView *)v8->_contentView addSubview:v8->_activityView];
    [(UIActivityIndicatorView *)v8->_activityView startAnimating];
    v17 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    titleLabel = v8->_titleLabel;
    v8->_titleLabel = v17;

    [(UILabel *)v8->_titleLabel setText:v6];
    v19 = +[UIColor secondaryLabelColor];
    [(UILabel *)v8->_titleLabel setTextColor:v19];

    [(UILabel *)v8->_titleLabel setAccessibilityIdentifier:@"LoadingModeTitle"];
    if (a4 == 1)
    {
      [(UILabel *)v8->_titleLabel setNumberOfLines:0];
      [(UILabel *)v8->_titleLabel setTextAlignment:1];
    }
    +[DynamicTypeWizard autorefreshLabel:v8->_titleLabel withFontProvider:&stru_101316168];
    [(UILabel *)v8->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v8->_contentView addSubview:v8->_titleLabel];
    [(LoadingModeView *)v8 setupConstraints];
  }

  return v8;
}

- (NSString)title
{
  return [(UILabel *)self->_titleLabel text];
}

- (void)setTitle:(id)a3
{
}

- (double)bottomInset
{
  [(NSLayoutConstraint *)self->_bottomContentConstraint constant];
  return result;
}

- (void)setBottomInset:(double)a3
{
  [(NSLayoutConstraint *)self->_bottomContentConstraint constant];
  if (v5 != a3)
  {
    [(NSLayoutConstraint *)self->_bottomContentConstraint setConstant:a3];
    [(LoadingModeView *)self setNeedsLayout];
  }
}

- (void)setupConstraints
{
  int64_t axis = self->_axis;
  if (axis == 1)
  {
    v22 = [(LoadingModeView *)self bottomAnchor];
    v23 = [(UIView *)self->_contentView bottomAnchor];
    v24 = [v22 constraintGreaterThanOrEqualToAnchor:v23];
    bottomContentConstraint = self->_bottomContentConstraint;
    self->_bottomContentConstraint = v24;

    v57[0] = self->_bottomContentConstraint;
    v26 = [(UIView *)self->_contentView topAnchor];
    v55 = [(LoadingModeView *)self topAnchor];
    v56 = v26;
    v54 = [v26 constraintGreaterThanOrEqualToAnchor:v55];
    v57[1] = v54;
    v27 = [(UIView *)self->_contentView leadingAnchor];
    v52 = [(LoadingModeView *)self leadingAnchor];
    v53 = v27;
    v51 = [v27 constraintEqualToAnchor:v52 constant:16.0];
    v57[2] = v51;
    v28 = [(UIView *)self->_contentView trailingAnchor];
    v49 = [(LoadingModeView *)self trailingAnchor];
    v50 = v28;
    v48 = [v28 constraintEqualToAnchor:v49 constant:-16.0];
    v57[3] = v48;
    v29 = [(UIView *)self->_contentView centerYAnchor];
    v46 = [(LoadingModeView *)self centerYAnchor];
    v47 = v29;
    v45 = [v29 constraintEqualToAnchor:v46];
    v57[4] = v45;
    v30 = [(UIActivityIndicatorView *)self->_activityView topAnchor];
    v43 = [(UIView *)self->_contentView topAnchor];
    v44 = v30;
    v42 = [v30 constraintEqualToAnchor:v43];
    v57[5] = v42;
    v31 = [(UIActivityIndicatorView *)self->_activityView bottomAnchor];
    v40 = [(UILabel *)self->_titleLabel topAnchor];
    v41 = v31;
    v39 = [v31 constraintEqualToAnchor:v40 constant:-5.0];
    v57[6] = v39;
    v32 = [(UILabel *)self->_titleLabel bottomAnchor];
    v37 = [(UIView *)self->_contentView bottomAnchor];
    v38 = v32;
    v36 = [v32 constraintEqualToAnchor:v37];
    v57[7] = v36;
    v15 = [(UIActivityIndicatorView *)self->_activityView centerXAnchor];
    v16 = [(UIView *)self->_contentView centerXAnchor];
    v17 = [v15 constraintEqualToAnchor:v16];
    v57[8] = v17;
    v18 = [(UILabel *)self->_titleLabel leadingAnchor];
    v19 = [(UIView *)self->_contentView leadingAnchor];
    v20 = [v18 constraintEqualToAnchor:v19];
    v57[9] = v20;
    v33 = [(UILabel *)self->_titleLabel trailingAnchor];
    v34 = [(UIView *)self->_contentView trailingAnchor];
    v35 = [v33 constraintEqualToAnchor:v34];
    v57[10] = v35;
    objc_super v21 = +[NSArray arrayWithObjects:v57 count:11];
  }
  else
  {
    if (axis)
    {
      objc_super v21 = 0;
      goto LABEL_7;
    }
    objc_super v4 = [(LoadingModeView *)self bottomAnchor];
    double v5 = [(UIView *)self->_contentView bottomAnchor];
    id v6 = [v4 constraintEqualToAnchor:v5];
    v7 = self->_bottomContentConstraint;
    self->_bottomContentConstraint = v6;

    v58[0] = self->_bottomContentConstraint;
    v8 = [(UIView *)self->_contentView topAnchor];
    v55 = [(LoadingModeView *)self topAnchor];
    v56 = v8;
    v54 = [v8 constraintEqualToAnchor:v55];
    v58[1] = v54;
    v9 = [(UIView *)self->_contentView leadingAnchor];
    v52 = [(LoadingModeView *)self leadingAnchor];
    v53 = v9;
    v51 = [v9 constraintGreaterThanOrEqualToAnchor:v52];
    v58[2] = v51;
    v10 = [(UIView *)self->_contentView trailingAnchor];
    v49 = [(LoadingModeView *)self trailingAnchor];
    v50 = v10;
    v48 = [v10 constraintLessThanOrEqualToAnchor:v49];
    v58[3] = v48;
    v11 = [(UIView *)self->_contentView centerXAnchor];
    v46 = [(LoadingModeView *)self centerXAnchor];
    v47 = v11;
    v45 = [v11 constraintEqualToAnchor:v46];
    v58[4] = v45;
    id v12 = [(UIActivityIndicatorView *)self->_activityView leadingAnchor];
    v43 = [(UIView *)self->_contentView leadingAnchor];
    v44 = v12;
    v42 = [v12 constraintEqualToAnchor:v43];
    v58[5] = v42;
    v13 = [(UIActivityIndicatorView *)self->_activityView trailingAnchor];
    v40 = [(UILabel *)self->_titleLabel leadingAnchor];
    v41 = v13;
    v39 = [v13 constraintEqualToAnchor:v40 constant:-5.0];
    v58[6] = v39;
    v14 = [(UILabel *)self->_titleLabel trailingAnchor];
    v37 = [(UIView *)self->_contentView trailingAnchor];
    v38 = v14;
    v36 = [v14 constraintEqualToAnchor:v37];
    v58[7] = v36;
    v15 = [(UIActivityIndicatorView *)self->_activityView centerYAnchor];
    v16 = [(UIView *)self->_contentView centerYAnchor];
    v17 = [v15 constraintEqualToAnchor:v16];
    v58[8] = v17;
    v18 = [(UILabel *)self->_titleLabel centerYAnchor];
    v19 = [(UIView *)self->_contentView centerYAnchor];
    v20 = [v18 constraintEqualToAnchor:v19];
    v58[9] = v20;
    objc_super v21 = +[NSArray arrayWithObjects:v58 count:10];
  }

LABEL_7:
  +[NSLayoutConstraint activateConstraints:v21];
}

- (void)setTitleFont:(id)a3
{
}

- (void)setTitleColor:(id)a3
{
}

- (void)startAnimating
{
  [(UIActivityIndicatorView *)self->_activityView setHidden:0];
  activityView = self->_activityView;

  [(UIActivityIndicatorView *)activityView startAnimating];
}

- (void)stopAnimating
{
}

- (double)fittingHeight
{
  -[LoadingModeView systemLayoutSizeFittingSize:](self, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomContentConstraint, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_storeStrong((id *)&self->_activityView, 0);
}

@end