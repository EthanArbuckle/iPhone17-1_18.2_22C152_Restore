@interface EditShortcutTitleCell
- (BOOL)makeFirstResponder;
- (EditShortcutTitleCell)initWithShortcut:(id)a3 delegate:(id)a4;
- (NSString)titleText;
- (void)_updateFonts;
- (void)resignResponder;
- (void)updateContent;
@end

@implementation EditShortcutTitleCell

- (EditShortcutTitleCell)initWithShortcut:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v61.receiver = self;
  v61.super_class = (Class)EditShortcutTitleCell;
  v9 = [(EditShortcutTitleCell *)&v61 initWithStyle:0 reuseIdentifier:@"EditShortcutTitleCell"];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_shortcut, a3);
    [(EditShortcutTitleCell *)v10 setAccessibilityIdentifier:@"EditShortcutTitleCell"];
    v11 = [(EditShortcutTitleCell *)v10 contentView];
    id v59 = v7;
    id v60 = v8;
    if (sub_1000BBB44(v10) == 5)
    {
      double x = CGRectZero.origin.x;
      double y = CGRectZero.origin.y;
      double width = CGRectZero.size.width;
      double height = CGRectZero.size.height;
    }
    else
    {
      id v16 = objc_alloc((Class)UIImageView);
      double x = CGRectZero.origin.x;
      double y = CGRectZero.origin.y;
      double width = CGRectZero.size.width;
      double height = CGRectZero.size.height;
      v17 = [v16 initWithFrame:CGRectZero.origin.x, y, width, height];
      [(UIImageView *)v17 setTranslatesAutoresizingMaskIntoConstraints:0];
      [(UIImageView *)v17 setAccessibilityIdentifier:@"EditShortcutTitleImage"];
      [v11 addSubview:v17];
      imageView = v10->_imageView;
      v10->_imageView = v17;
      v19 = v17;

      v57 = [(UIImageView *)v19 heightAnchor];
      v56 = [v57 constraintEqualToConstant:30.0];
      v63[0] = v56;
      v54 = [(UIImageView *)v19 widthAnchor];
      v52 = [v54 constraintEqualToConstant:30.0];
      v63[1] = v52;
      v20 = [(UIImageView *)v19 centerYAnchor];
      v21 = [v11 centerYAnchor];
      v22 = [v20 constraintEqualToAnchor:v21];
      v63[2] = v22;
      v23 = [(UIImageView *)v19 leadingAnchor];
      v24 = [v11 leadingAnchor];
      v25 = [v23 constraintEqualToAnchor:v24 constant:16.0];
      v63[3] = v25;
      v26 = +[NSArray arrayWithObjects:v63 count:4];
      +[NSLayoutConstraint activateConstraints:v26];

      id v8 = v60;
    }
    id v27 = [objc_alloc((Class)UITextField) initWithFrame:x, y, width, height];
    [v27 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v27 setDelegate:v8];
    if (sub_1000BBB44(v10) == 5) {
      uint64_t v28 = 3;
    }
    else {
      uint64_t v28 = 0;
    }
    [v27 setBorderStyle:v28];
    [v27 setAccessibilityIdentifier:@"EditShortcutTitleTextField"];
    [v11 addSubview:v27];
    objc_storeStrong((id *)&v10->_textField, v27);
    double v29 = 15.0;
    if (sub_1000BBB44(v10) == 5)
    {
      v30 = [v27 heightAnchor];
      v31 = [v30 constraintEqualToConstant:32.0];
      [v31 setActive:1];

      double v29 = 0.0;
    }
    v32 = [v27 leadingAnchor];
    if (sub_1000BBB44(v10) == 5) {
      [v11 leadingAnchor];
    }
    else {
    uint64_t v33 = [(UIImageView *)v10->_imageView trailingAnchor];
    }
    v46 = (void *)v33;
    uint64_t v34 = sub_1000BBB44(v10);
    double v35 = 10.0;
    if (v34 == 5) {
      double v35 = 16.0;
    }
    v58 = [v32 constraintEqualToAnchor:v33 constant:v35];
    v62[0] = v58;
    v55 = [v27 trailingAnchor];
    v53 = [v11 trailingAnchor];
    v51 = [v55 constraintEqualToAnchor:v53 constant:-16.0];
    v62[1] = v51;
    v49 = [v27 centerYAnchor];
    v47 = [v11 centerYAnchor];
    v36 = [v49 constraintEqualToAnchor:v47];
    v62[2] = v36;
    v37 = [v27 topAnchor];
    v38 = [v11 topAnchor];
    v39 = [v37 constraintEqualToAnchor:v38 constant:v29];
    v62[3] = v39;
    [v27 bottomAnchor];
    v40 = v48 = v32;
    v41 = [v11 bottomAnchor];
    v42 = [v40 constraintEqualToAnchor:v41 constant:-v29];
    v62[4] = v42;
    +[NSArray arrayWithObjects:v62 count:5];
    v43 = v50 = v11;
    +[NSLayoutConstraint activateConstraints:v43];

    v44 = +[NSNotificationCenter defaultCenter];
    [v44 addObserver:v10 selector:"contentSizeCategoryDidChange:" name:UIContentSizeCategoryDidChangeNotification object:0];

    [(EditShortcutTitleCell *)v10 updateContent];
    id v7 = v59;
    id v8 = v60;
  }

  return v10;
}

- (void)updateContent
{
  v3 = [(MapsSuggestionsShortcutLike *)self->_shortcut title];
  [(UITextField *)self->_textField setText:v3];

  if (sub_1000BBB44(self) != 5)
  {
    v4 = [(MapsSuggestionsShortcutLike *)self->_shortcut styleAttributes];
    v5 = self->_imageView;
    v6 = +[MapsUIImageCache sharedCache];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10067F1A8;
    v8[3] = &unk_1012F3FB8;
    v9 = v5;
    id v7 = v5;
    [v6 getImageForStyleAttributes:v4 completion:v8];
  }
  [(EditShortcutTitleCell *)self _updateFonts];
}

- (NSString)titleText
{
  return [(UITextField *)self->_textField text];
}

- (BOOL)makeFirstResponder
{
  return [(UITextField *)self->_textField becomeFirstResponder];
}

- (void)resignResponder
{
}

- (void)_updateFonts
{
  if (sub_1000BBB44(self) == 5) {
    +[UIFont system20Semibold];
  }
  else {
  id v3 = +[UIFont system17];
  }
  [(UITextField *)self->_textField setFont:v3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortcut, 0);
  objc_storeStrong((id *)&self->_imageView, 0);

  objc_storeStrong((id *)&self->_textField, 0);
}

@end