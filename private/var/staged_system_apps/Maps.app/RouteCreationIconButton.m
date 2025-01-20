@interface RouteCreationIconButton
- (NSString)title;
- (RouteCreationIconButton)initWithImage:(id)a3 title:(id)a4;
- (UIImage)image;
- (void)_updateDisabledState;
- (void)layoutSubviews;
- (void)setEnabled:(BOOL)a3;
@end

@implementation RouteCreationIconButton

- (RouteCreationIconButton)initWithImage:(id)a3 title:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v43.receiver = self;
  v43.super_class = (Class)RouteCreationIconButton;
  v9 = -[RouteCreationIconButton initWithFrame:](&v43, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  if (v9)
  {
    v10 = +[UIColor secondarySystemFillColor];
    [(RouteCreationIconButton *)v9 setBackgroundColor:v10];

    [(RouteCreationIconButton *)v9 _setContinuousCornerRadius:12.0];
    [(RouteCreationIconButton *)v9 setAccessibilityLabel:v8];
    uint64_t v11 = objc_opt_new();
    iconImageView = v9->_iconImageView;
    v9->_iconImageView = (UIImageView *)v11;

    [(UIImageView *)v9->_iconImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v9->_iconImageView setContentMode:1];
    uint64_t v13 = objc_opt_new();
    subtitleLabel = v9->_subtitleLabel;
    v9->_subtitleLabel = (UILabel *)v13;

    [(UILabel *)v9->_subtitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v15 = +[UIFont systemFontOfSize:13.0 weight:UIFontWeightMedium];
    [(UILabel *)v9->_subtitleLabel setFont:v15];

    v16 = +[UIColor systemBlueColor];
    [(UILabel *)v9->_subtitleLabel setTextColor:v16];

    [(UILabel *)v9->_subtitleLabel setTextAlignment:1];
    objc_storeStrong((id *)&v9->_image, a3);
    [(UIImageView *)v9->_iconImageView setImage:v7];
    objc_storeStrong((id *)&v9->_title, a4);
    [(UILabel *)v9->_subtitleLabel setText:v8];
    v17 = +[UIColor colorWithDynamicProvider:&stru_101312E38];
    [(UIImageView *)v9->_iconImageView setTintColor:v17];

    v18 = [(UIImageView *)v9->_iconImageView tintColor];
    [(UILabel *)v9->_subtitleLabel setTextColor:v18];

    [(RouteCreationIconButton *)v9 addSubview:v9->_iconImageView];
    [(RouteCreationIconButton *)v9 addSubview:v9->_subtitleLabel];
    v40 = [(UIImageView *)v9->_iconImageView leadingAnchor];
    v39 = [(RouteCreationIconButton *)v9 leadingAnchor];
    v38 = [v40 constraintEqualToAnchor:v39 constant:6.0];
    v44[0] = v38;
    v37 = [(UIImageView *)v9->_iconImageView trailingAnchor];
    v36 = [(RouteCreationIconButton *)v9 trailingAnchor];
    v35 = [v37 constraintEqualToAnchor:v36 constant:-6.0];
    v44[1] = v35;
    v34 = [(UIImageView *)v9->_iconImageView topAnchor];
    v33 = [(RouteCreationIconButton *)v9 topAnchor];
    v32 = [v34 constraintEqualToAnchor:v33 constant:6.0];
    v44[2] = v32;
    v31 = [(UIImageView *)v9->_iconImageView heightAnchor];
    v30 = [v31 constraintEqualToConstant:18.0];
    v44[3] = v30;
    v29 = [(UILabel *)v9->_subtitleLabel leadingAnchor];
    v19 = [(RouteCreationIconButton *)v9 leadingAnchor];
    v20 = [v29 constraintEqualToAnchor:v19 constant:6.0];
    v44[4] = v20;
    [(UILabel *)v9->_subtitleLabel trailingAnchor];
    v21 = id v42 = v7;
    [(RouteCreationIconButton *)v9 trailingAnchor];
    v22 = id v41 = v8;
    v23 = [v21 constraintEqualToAnchor:v22 constant:-6.0];
    v44[5] = v23;
    v24 = [(UILabel *)v9->_subtitleLabel topAnchor];
    v25 = [(UIImageView *)v9->_iconImageView bottomAnchor];
    v26 = [v24 constraintEqualToAnchor:v25 constant:4.0];
    v44[6] = v26;
    v27 = +[NSArray arrayWithObjects:v44 count:7];
    +[NSLayoutConstraint activateConstraints:v27];

    id v8 = v41;
    id v7 = v42;
  }
  return v9;
}

- (void)setEnabled:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)RouteCreationIconButton;
  [(RouteCreationIconButton *)&v4 setEnabled:a3];
  [(RouteCreationIconButton *)self _updateDisabledState];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)RouteCreationIconButton;
  [(RouteCreationIconButton *)&v3 layoutSubviews];
  [(RouteCreationIconButton *)self _updateDisabledState];
}

- (void)_updateDisabledState
{
  unsigned int v3 = [(RouteCreationIconButton *)self isEnabled];
  double v4 = 0.400000006;
  if (v3) {
    double v4 = 1.0;
  }

  [(RouteCreationIconButton *)self setAlpha:v4];
}

- (UIImage)image
{
  return self->_image;
}

- (NSString)title
{
  return self->_title;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);

  objc_storeStrong((id *)&self->_iconImageView, 0);
}

@end