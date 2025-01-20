@interface EditShortcutMeCardCell
- (EditShortcutMeCardCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NSString)meCardString;
- (id)openMeCardHandler;
- (void)_buttonTapped:(id)a3;
- (void)setMeCardString:(id)a3;
- (void)setOpenMeCardHandler:(id)a3;
@end

@implementation EditShortcutMeCardCell

- (EditShortcutMeCardCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v52.receiver = self;
  v52.super_class = (Class)EditShortcutMeCardCell;
  v4 = [(EditShortcutMeCardCell *)&v52 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(EditShortcutMeCardCell *)v4 setAccessibilityIdentifier:@"EditShortcutMeCardCell"];
    v6 = [(EditShortcutMeCardCell *)v5 contentView];
    v7 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    label = v5->_label;
    v5->_label = v7;

    [(UILabel *)v5->_label setTranslatesAutoresizingMaskIntoConstraints:0];
    v9 = +[UIColor secondaryLabelColor];
    [(UILabel *)v5->_label setTextColor:v9];

    [(UILabel *)v5->_label setNumberOfLines:0];
    [(UILabel *)v5->_label setAccessibilityIdentifier:@"EditShortcutMeCardLabel"];
    [v6 addSubview:v5->_label];
    if (sub_1000BBB44(v5) == 5)
    {
      v10 = +[UIFont system17Tall];
      [(UILabel *)v5->_label setFont:v10];

      v11 = [(UILabel *)v5->_label topAnchor];
      v12 = [v6 topAnchor];
      v13 = [v11 constraintEqualToAnchor:v12 constant:0.0];
      v54[0] = v13;
      v14 = [(UILabel *)v5->_label leadingAnchor];
      v15 = [v6 leadingAnchor];
      v16 = [v14 constraintEqualToAnchor:v15 constant:17.0];
      v54[1] = v16;
      v17 = [(UILabel *)v5->_label bottomAnchor];
      v50 = [v6 bottomAnchor];
      v51 = v17;
      v49 = [v17 constraintEqualToAnchor:v50 constant:0.0];
      v54[2] = v49;
      v18 = [(UILabel *)v5->_label trailingAnchor];
      v48 = [v6 trailingAnchor];
      v47 = [v18 constraintLessThanOrEqualToAnchor:-17.0];
      v54[3] = v47;
      v19 = +[NSArray arrayWithObjects:v54 count:4];
      +[NSLayoutConstraint activateConstraints:v19];
    }
    else
    {
      v20 = +[UIFont system17];
      [(UILabel *)v5->_label setFont:v20];

      uint64_t v21 = +[MapsThemeButton buttonWithType:0];
      button = v5->_button;
      v5->_button = (MapsThemeButton *)v21;

      [(MapsThemeButton *)v5->_button setTranslatesAutoresizingMaskIntoConstraints:0];
      v23 = v5->_button;
      v24 = +[NSBundle mainBundle];
      v25 = [v24 localizedStringForKey:@"[Shortcut] Contact Card" value:@"localized string not found" table:0];
      [(MapsThemeButton *)v23 setTitle:v25 forState:0];

      [(MapsThemeButton *)v5->_button setTitleColorProvider:&stru_1012EDC10];
      [(MapsThemeButton *)v5->_button addTarget:v5 action:"_buttonTapped:" forControlEvents:64];
      v26 = +[UIFont system17];
      v27 = [(MapsThemeButton *)v5->_button titleLabel];
      [v27 setFont:v26];

      [(MapsThemeButton *)v5->_button setAccessibilityIdentifier:@"EditShortcutMeCardButton"];
      [v6 addSubview:v5->_button];
      v46 = [(UILabel *)v5->_label leadingAnchor];
      uint64_t v45 = [v6 leadingAnchor];
      uint64_t v44 = [v46 constraintEqualToAnchor:v45 constant:16.0];
      v53[0] = v44;
      v42 = [(UILabel *)v5->_label trailingAnchor];
      uint64_t v41 = [v6 trailingAnchor];
      uint64_t v43 = [v42 constraintEqualToAnchor:v41 constant:-16.0];
      v53[1] = v43;
      v28 = [(MapsThemeButton *)v5->_button leadingAnchor];
      v50 = [v6 leadingAnchor];
      v51 = v28;
      v49 = [v28 constraintEqualToAnchor:v50 constant:16.0];
      v53[2] = v49;
      v39 = [(MapsThemeButton *)v5->_button trailingAnchor];
      v48 = [v6 trailingAnchor];
      v47 = [v39 constraintLessThanOrEqualToAnchor:-16.0];
      v53[3] = v47;
      v19 = [(UILabel *)v5->_label topAnchor];
      v40 = [v6 topAnchor];
      v38 = [v19 constraintEqualToAnchor:v40];
      v53[4] = v38;
      v29 = [(MapsThemeButton *)v5->_button topAnchor];
      v30 = [(UILabel *)v5->_label bottomAnchor];
      [v29 constraintEqualToAnchor:v30];
      v32 = v31 = v6;
      v53[5] = v32;
      v33 = [(MapsThemeButton *)v5->_button bottomAnchor];
      v34 = [v31 bottomAnchor];
      v35 = [v33 constraintEqualToAnchor:v34];
      v53[6] = v35;
      v36 = +[NSArray arrayWithObjects:v53 count:7];
      +[NSLayoutConstraint activateConstraints:v36];

      v15 = (void *)v41;
      v13 = (void *)v44;

      v18 = v39;
      v12 = (void *)v45;

      v6 = v31;
      v14 = v42;

      v11 = v46;
      v16 = (void *)v43;
    }
  }
  return v5;
}

- (void)setMeCardString:(id)a3
{
  id v6 = a3;
  id v4 = [(UILabel *)self->_label text];
  if (v4 == v6)
  {
  }
  else
  {
    unsigned __int8 v5 = [v6 isEqual:v4];

    if ((v5 & 1) == 0) {
      [(UILabel *)self->_label setText:v6];
    }
  }
}

- (NSString)meCardString
{
  return [(UILabel *)self->_label text];
}

- (void)_buttonTapped:(id)a3
{
  openMeCardHandler = (void (**)(void))self->_openMeCardHandler;
  if (openMeCardHandler) {
    openMeCardHandler[2]();
  }
}

- (id)openMeCardHandler
{
  return self->_openMeCardHandler;
}

- (void)setOpenMeCardHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_openMeCardHandler, 0);
  objc_storeStrong((id *)&self->_button, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

@end