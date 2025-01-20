@interface EditShortcutContactCell
- (EditShortcutContactCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (MSPSharedTripContact)contactValue;
- (id)action;
- (void)_buttonAction:(id)a3;
- (void)_updateFonts;
- (void)setAction:(id)a3;
- (void)setContactValue:(id)a3;
@end

@implementation EditShortcutContactCell

- (EditShortcutContactCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v56.receiver = self;
  v56.super_class = (Class)EditShortcutContactCell;
  v4 = [(EditShortcutContactCell *)&v56 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(EditShortcutContactCell *)v4 setAccessibilityIdentifier:@"EditShortcutContactCell"];
    v6 = [(EditShortcutContactCell *)v5 contentView];
    v7 = +[UIButton buttonWithType:0];
    v8 = +[UIColor tertiaryLabelColor];
    v55 = v7;
    [v7 setTintColor:v8];

    [v7 setFrame:CGRectMake(0.0, 0.0, 30.0, 30.0)];
    v9 = +[UIImage systemImageNamed:@"xmark.circle.fill"];
    [v7 setImage:v9 forState:0];

    v10 = +[UIImageSymbolConfiguration configurationWithPointSize:5 weight:17.0];
    [v7 setPreferredSymbolConfiguration:v10 forImageInState:0];

    [v7 addTarget:v5 action:"_buttonAction:" forControlEvents:64];
    [v7 setAccessibilityIdentifier:@"EditShortcutContactButton"];
    [(EditShortcutContactCell *)v5 setAccessoryView:v7];
    id v11 = objc_alloc((Class)UIImageView);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v15 = [v11 initWithFrame:CGRectZero.origin.x, y, width, height];
    [(UIImageView *)v15 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v15 _setCornerRadius:15.0];
    [(UIImageView *)v15 setClipsToBounds:1];
    [(UIImageView *)v15 setAccessibilityIdentifier:@"EditShortcutContactImage"];
    [v6 addSubview:v15];
    imageView = v5->_imageView;
    v5->_imageView = v15;
    v17 = v15;

    v18 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
    [(UILabel *)v18 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v18 setAccessibilityIdentifier:@"EditShortcutContactLabel"];
    [v6 addSubview:v18];
    label = v5->_label;
    v5->_label = v18;
    v20 = v18;

    v54 = [(UIImageView *)v17 heightAnchor];
    v53 = [v54 constraintEqualToConstant:30.0];
    v57[0] = v53;
    v52 = [(UIImageView *)v17 widthAnchor];
    v51 = [v52 constraintEqualToConstant:30.0];
    v57[1] = v51;
    v49 = [(UIImageView *)v17 centerYAnchor];
    v21 = v6;
    v48 = [v6 centerYAnchor];
    v47 = [v49 constraintEqualToAnchor:v48];
    v57[2] = v47;
    v50 = v17;
    v46 = [(UIImageView *)v17 leadingAnchor];
    v45 = [v6 leadingAnchor];
    v44 = [v46 constraintEqualToAnchor:v45 constant:16.0];
    v57[3] = v44;
    v41 = [(UILabel *)v20 leadingAnchor];
    v40 = [(UIImageView *)v17 trailingAnchor];
    v39 = [v41 constraintEqualToAnchor:v40 constant:10.0];
    v57[4] = v39;
    v38 = [(UILabel *)v20 trailingAnchor];
    v37 = [v6 trailingAnchor];
    v36 = [v38 constraintEqualToAnchor:v37 constant:-16.0];
    v57[5] = v36;
    v35 = [(UILabel *)v20 centerYAnchor];
    v22 = [v6 centerYAnchor];
    v23 = [v35 constraintEqualToAnchor:v22];
    v57[6] = v23;
    v24 = v20;
    v42 = v20;
    v25 = [(UILabel *)v20 topAnchor];
    v26 = v21;
    v43 = v21;
    v27 = [v21 topAnchor];
    v28 = [v25 constraintEqualToAnchor:v27 constant:15.0];
    v57[7] = v28;
    v29 = [(UILabel *)v24 bottomAnchor];
    v30 = [v26 bottomAnchor];
    v31 = [v29 constraintEqualToAnchor:v30 constant:-15.0];
    v57[8] = v31;
    v32 = +[NSArray arrayWithObjects:v57 count:9];
    +[NSLayoutConstraint activateConstraints:v32];

    v33 = +[NSNotificationCenter defaultCenter];
    [v33 addObserver:v5 selector:"contentSizeCategoryDidChange:" name:UIContentSizeCategoryDidChangeNotification object:0];
  }
  return v5;
}

- (void)_buttonAction:(id)a3
{
  v4 = [(EditShortcutContactCell *)self action];

  if (v4)
  {
    v5 = [(EditShortcutContactCell *)self action];
    v5[2]();
  }
}

- (void)setContactValue:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_contactValue, a3);
  v6 = self->_imageView;
  v7 = [v5 contact];

  if (v7)
  {
    v8 = [v5 contact];
    v9 = +[CNContactFormatter stringFromContact:v8 style:0];
    [(UILabel *)self->_label setText:v9];

    v10 = +[MapsUIImageCache sharedCache];
    id v11 = [v5 contact];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1008FF764;
    v20[3] = &unk_1012F3FB8;
    v12 = (id *)&v21;
    v21 = v6;
    v13 = v6;
    [v10 getImageForContact:v11 size:v20 completion:30.0];
  }
  else
  {
    v14 = [v5 stringValue];
    [(UILabel *)self->_label setText:v14];

    v10 = [(EditShortcutContactCell *)self window];
    id v11 = [v10 screen];
    [v11 scale];
    double v16 = v15;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1008FF770;
    v18[3] = &unk_1012F3FB8;
    v12 = (id *)&v19;
    v19 = v6;
    v17 = v6;
    +[CNContact _maps_imageForNoContactWithDiameter:v18 scale:30.0 completion:v16];
  }

  [(EditShortcutContactCell *)self _updateFonts];
}

- (void)_updateFonts
{
  v3 = +[UIFont system17];
  [(UILabel *)self->_label setFont:v3];

  uint64_t v4 = +[UIFont accessibilityTextEnabled] ^ 1;
  label = self->_label;

  [(UILabel *)label setNumberOfLines:v4];
}

- (id)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
}

- (MSPSharedTripContact)contactValue
{
  return self->_contactValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactValue, 0);
  objc_storeStrong(&self->_action, 0);
  objc_storeStrong((id *)&self->_label, 0);

  objc_storeStrong((id *)&self->_imageView, 0);
}

@end