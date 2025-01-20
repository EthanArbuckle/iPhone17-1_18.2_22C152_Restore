@interface SUUISettingsTableViewCell
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (SUUISettingDescriptionView)settingDescriptionView;
- (SUUISettingsTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)displaySettingDescriptionView:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setBackgroundColor:(id)a3;
@end

@implementation SUUISettingsTableViewCell

- (SUUISettingsTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)SUUISettingsTableViewCell;
  result = [(SUUISettingsTableViewCell *)&v5 initWithStyle:a3 reuseIdentifier:a4];
  if (result) {
    result->_hasDisclosureChevron = 0;
  }
  return result;
}

- (void)displaySettingDescriptionView:(id)a3
{
  v4 = (SUUISettingDescriptionView *)a3;
  self->_hasDisclosureChevron = [(SUUISettingDescriptionView *)v4 hasDisclosureChevron];
  settingDescriptionView = self->_settingDescriptionView;
  self->_settingDescriptionView = v4;
  v6 = v4;

  v7 = [(SUUISettingsTableViewCell *)self contentView];
  [v7 addSubview:self->_settingDescriptionView];

  [(SUUISettingsTableViewCell *)self setNeedsLayout];
}

- (SUUISettingDescriptionView)settingDescriptionView
{
  return self->_settingDescriptionView;
}

- (void)prepareForReuse
{
  [(SUUISettingDescriptionView *)self->_settingDescriptionView removeFromSuperview];
  settingDescriptionView = self->_settingDescriptionView;
  self->_settingDescriptionView = 0;

  self->_hasDisclosureChevron = 0;
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  return [(SUUISettingDescriptionView *)self->_settingDescriptionView setImage:a3 forArtworkRequest:a4 context:a5];
}

- (void)layoutSubviews
{
  v38.receiver = self;
  v38.super_class = (Class)SUUISettingsTableViewCell;
  [(SUUISettingsTableViewCell *)&v38 layoutSubviews];
  v3 = [MEMORY[0x263F82438] sharedApplication];
  uint64_t v4 = [v3 userInterfaceLayoutDirection];

  objc_super v5 = [(SUUISettingsTableViewCell *)self contentView];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  [(SUUISettingsTableViewCell *)self layoutMargins];
  double v16 = v14;
  double v18 = v17;
  double v19 = v15;
  double v21 = v20;
  if (self->_hasDisclosureChevron)
  {
    double v35 = v15;
    double v36 = v14;
    v22 = SUUIImageWithResourceName(@"chevronRight");
    v23 = [v22 imageFlippedForRightToLeftLayoutDirection];

    if (!self->_disclosureChevron)
    {
      v24 = (UIImageView *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v23];
      disclosureChevron = self->_disclosureChevron;
      self->_disclosureChevron = v24;

      v26 = self->_disclosureChevron;
      v27 = [MEMORY[0x263F825C8] colorWithWhite:0.674509804 alpha:1.0];
      [(UIImageView *)v26 setTintColor:v27];

      v28 = [(SUUISettingsTableViewCell *)self contentView];
      [v28 addSubview:self->_disclosureChevron];
    }
    double v37 = v18;
    [v23 size];
    double v30 = v29;
    double v32 = v31;
    if (v4)
    {
      double v33 = v21;
      double v34 = v37;
    }
    else
    {
      v39.origin.x = v7;
      v39.origin.y = v9;
      v39.size.width = v11;
      v39.size.height = v13;
      double v33 = v21;
      double v34 = CGRectGetWidth(v39) - v30 - v21;
    }
    v40.origin.x = v7;
    v40.origin.y = v9;
    v40.size.width = v11;
    v40.size.height = v13;
    -[UIImageView setFrame:](self->_disclosureChevron, "setFrame:", v34, (CGRectGetHeight(v40) - v32) * 0.5, v30, v32);
    [(UIImageView *)self->_disclosureChevron setHidden:0];

    double v19 = v35;
    double v16 = v36;
    double v21 = v33;
    double v18 = v37;
  }
  else
  {
    [(UIImageView *)self->_disclosureChevron setHidden:1];
  }
  -[SUUISettingDescriptionView setLayoutMargins:](self->_settingDescriptionView, "setLayoutMargins:", v16, v18, v19, v21);
  -[SUUISettingDescriptionView setFrame:](self->_settingDescriptionView, "setFrame:", v7, v9, v11, v13);
}

- (void)setBackgroundColor:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SUUISettingsTableViewCell;
  [(SUUISettingsTableViewCell *)&v3 setBackgroundColor:a3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingDescriptionView, 0);
  objc_storeStrong((id *)&self->_disclosureChevron, 0);
}

@end