@interface EditShortcutTypeCell
- (BOOL)isChecked;
- (EditShortcutTypeCell)initWithShortcut:(id)a3 shortcutType:(id)a4;
- (void)_updateFonts;
- (void)setChecked:(BOOL)a3;
@end

@implementation EditShortcutTypeCell

- (EditShortcutTypeCell)initWithShortcut:(id)a3 shortcutType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v72.receiver = self;
  v72.super_class = (Class)EditShortcutTypeCell;
  v8 = [(EditShortcutTypeCell *)&v72 initWithStyle:0 reuseIdentifier:@"EditShortcutTypeCell"];
  v9 = v8;
  if (v8)
  {
    [(EditShortcutTypeCell *)v8 setAccessibilityIdentifier:@"EditShortcutTypeCell"];
    v10 = [(EditShortcutTypeCell *)v9 contentView];
    id v11 = objc_alloc((Class)UIImageView);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    id v15 = [v11 initWithFrame:CGRectZero.origin.x, y, width, height];
    [v15 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v15 setAccessibilityIdentifier:@"EditShortcutTypeImage"];
    [v10 addSubview:v15];
    objc_storeStrong((id *)&v9->_imageView, v15);
    id v16 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
    [v16 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v16 setAccessibilityIdentifier:@"EditShortcutTypeLabel"];
    [v10 addSubview:v16];
    v51 = v9;
    objc_storeStrong((id *)&v9->_label, v16);
    v68 = [v15 heightAnchor];
    v67 = [v68 constraintEqualToConstant:30.0];
    v73[0] = v67;
    v66 = [v15 widthAnchor];
    v65 = [v66 constraintEqualToConstant:30.0];
    v73[1] = v65;
    v64 = [v15 centerYAnchor];
    v63 = [v10 centerYAnchor];
    v62 = [v64 constraintEqualToAnchor:v63];
    v73[2] = v62;
    v61 = [v15 leadingAnchor];
    v60 = [v10 leadingAnchor];
    v59 = [v61 constraintEqualToAnchor:v60 constant:16.0];
    v73[3] = v59;
    v58 = [v16 leadingAnchor];
    id v49 = v15;
    v57 = [v15 trailingAnchor];
    v56 = [v58 constraintEqualToAnchor:v57 constant:10.0];
    v73[4] = v56;
    v55 = [v16 trailingAnchor];
    v54 = [v10 trailingAnchor];
    v53 = [v55 constraintEqualToAnchor:v54 constant:-10.0];
    v73[5] = v53;
    v52 = [v16 centerYAnchor];
    v17 = [v10 centerYAnchor];
    v18 = [v52 constraintEqualToAnchor:v17];
    v73[6] = v18;
    v19 = [v16 topAnchor];
    v20 = [v10 topAnchor];
    [v19 constraintEqualToAnchor:v20 constant:15.0];
    v21 = v69 = v6;
    v73[7] = v21;
    id v48 = v16;
    v22 = [v16 bottomAnchor];
    v50 = v10;
    v23 = [v10 bottomAnchor];
    [v22 constraintEqualToAnchor:v23 constant:-15.0];
    v25 = v24 = v7;
    v73[8] = v25;
    v26 = +[NSArray arrayWithObjects:v73 count:9];
    +[NSLayoutConstraint activateConstraints:v26];

    id v7 = v24;
    id v6 = v69;

    id v27 = objc_alloc((Class)MKMapItem);
    v28 = [v69 geoMapItem];
    id v29 = [v27 initWithGeoMapItem:v28 isPlaceHolderPlace:0];

    unint64_t v30 = (unint64_t)[v24 type];
    id v31 = v29;
    v32 = v31;
    if (v30 <= 5 && ((1 << v30) & 0x2C) != 0)
    {
      MapsSuggestionsLocalizedMyTitleForShortcutType();
      id v33 = (id)objc_claimAutoreleasedReturnValue();
      v34 = v50;
      v9 = v51;
      v36 = v48;
      v35 = v49;
    }
    else
    {
      v37 = [v31 _firstLocalizedCategoryName];
      v38 = v37;
      if (v37)
      {
        id v33 = v37;
      }
      else
      {
        v39 = +[NSBundle mainBundle];
        id v33 = [v39 localizedStringForKey:@"[Shortcut] Address Label" value:@"localized string not found" table:0];
      }
      v34 = v50;
      v9 = v51;
      v36 = v48;
      v35 = v49;
    }
    [v36 setText:v33];

    if (sub_1000BBB44(v9) != 5)
    {
      unint64_t v40 = (unint64_t)[v7 type];
      id v41 = v32;
      v42 = v41;
      if (v40 <= 5 && ((1 << v40) & 0x2C) != 0)
      {
        uint64_t v43 = MapsSuggestionsShortcutTypeStyleAttributes();
      }
      else
      {
        uint64_t v43 = [v41 _styleAttributes];
      }
      v44 = (void *)v43;

      v45 = +[MapsUIImageCache sharedCache];
      v70[0] = _NSConcreteStackBlock;
      v70[1] = 3221225472;
      v70[2] = sub_1008C5188;
      v70[3] = &unk_1012F3FB8;
      id v71 = v35;
      [v45 getImageForStyleAttributes:v44 completion:v70];
    }
    v46 = +[NSNotificationCenter defaultCenter];
    [v46 addObserver:v9 selector:"contentSizeCategoryDidChange:" name:UIContentSizeCategoryDidChangeNotification object:0];

    [(EditShortcutTypeCell *)v9 _updateFonts];
  }

  return v9;
}

- (void)_updateFonts
{
  if (sub_1000BBB44(self) == 5) {
    +[UIFont system17Tall];
  }
  else {
  v3 = +[UIFont system17];
  }
  [(UILabel *)self->_label setFont:v3];

  uint64_t v4 = +[UIFont accessibilityTextEnabled] ^ 1;
  label = self->_label;

  [(UILabel *)label setNumberOfLines:v4];
}

- (void)setChecked:(BOOL)a3
{
  BOOL v3 = a3;
  if (sub_1000BBB44(self) == 5)
  {
    if (v3)
    {
      v5 = +[UIColor systemWhiteColor];
      v14[0] = v5;
      id v6 = [(EditShortcutTypeCell *)self theme];
      id v7 = [v6 keyColor];
      v14[1] = v7;
      v8 = +[NSArray arrayWithObjects:v14 count:2];
      v9 = +[UIImageSymbolConfiguration configurationWithPaletteColors:v8];

      v10 = +[UIImage systemImageNamed:@"record.circle.fill" withConfiguration:v9];
      [(UIImageView *)self->_imageView setImage:v10];
    }
    else
    {
      v12 = +[UIColor systemWhiteColor];
      [(UIImageView *)self->_imageView setTintColor:v12];

      id v13 = +[UIImage systemImageNamed:@"circle.fill"];
      -[UIImageView setImage:](self->_imageView, "setImage:");
    }
  }
  else
  {
    if (v3) {
      uint64_t v11 = 3;
    }
    else {
      uint64_t v11 = 0;
    }
    [(EditShortcutTypeCell *)self setAccessoryType:v11];
  }
}

- (BOOL)isChecked
{
  return [(EditShortcutTypeCell *)self accessoryType] == (id)3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

@end