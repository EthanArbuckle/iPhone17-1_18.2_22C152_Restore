@interface SKUISettingsTableViewCell
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (SKUISettingDescriptionView)settingDescriptionView;
- (SKUISettingsTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)displaySettingDescriptionView:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setBackgroundColor:(id)a3;
@end

@implementation SKUISettingsTableViewCell

- (SKUISettingsTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  id v6 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUISettingsTableViewCell initWithStyle:reuseIdentifier:]();
  }
  v10.receiver = self;
  v10.super_class = (Class)SKUISettingsTableViewCell;
  v7 = [(SKUISettingsTableViewCell *)&v10 initWithStyle:a3 reuseIdentifier:v6];
  v8 = v7;
  if (v7) {
    v7->_hasDisclosureChevron = 0;
  }

  return v8;
}

- (void)displaySettingDescriptionView:(id)a3
{
  v4 = (SKUISettingDescriptionView *)a3;
  self->_hasDisclosureChevron = [(SKUISettingDescriptionView *)v4 hasDisclosureChevron];
  settingDescriptionView = self->_settingDescriptionView;
  self->_settingDescriptionView = v4;
  id v6 = v4;

  v7 = [(SKUISettingsTableViewCell *)self contentView];
  [v7 addSubview:self->_settingDescriptionView];

  [(SKUISettingsTableViewCell *)self setNeedsLayout];
}

- (SKUISettingDescriptionView)settingDescriptionView
{
  return self->_settingDescriptionView;
}

- (void)prepareForReuse
{
  [(SKUISettingDescriptionView *)self->_settingDescriptionView removeFromSuperview];
  settingDescriptionView = self->_settingDescriptionView;
  self->_settingDescriptionView = 0;

  self->_hasDisclosureChevron = 0;
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  return [(SKUISettingDescriptionView *)self->_settingDescriptionView setImage:a3 forArtworkRequest:a4 context:a5];
}

- (void)layoutSubviews
{
  v38.receiver = self;
  v38.super_class = (Class)SKUISettingsTableViewCell;
  [(SKUISettingsTableViewCell *)&v38 layoutSubviews];
  v3 = [MEMORY[0x1E4FB1438] sharedApplication];
  uint64_t v4 = [v3 userInterfaceLayoutDirection];

  v5 = [(SKUISettingsTableViewCell *)self contentView];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  [(SKUISettingsTableViewCell *)self layoutMargins];
  double v16 = v14;
  double v18 = v17;
  double v19 = v15;
  double v21 = v20;
  if (self->_hasDisclosureChevron)
  {
    double v35 = v15;
    double v36 = v14;
    v22 = SKUIImageWithResourceName(@"chevronRight");
    v23 = [v22 imageFlippedForRightToLeftLayoutDirection];

    if (!self->_disclosureChevron)
    {
      v24 = (UIImageView *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v23];
      disclosureChevron = self->_disclosureChevron;
      self->_disclosureChevron = v24;

      v26 = self->_disclosureChevron;
      v27 = [MEMORY[0x1E4FB1618] colorWithWhite:0.674509804 alpha:1.0];
      [(UIImageView *)v26 setTintColor:v27];

      v28 = [(SKUISettingsTableViewCell *)self contentView];
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
  -[SKUISettingDescriptionView setLayoutMargins:](self->_settingDescriptionView, "setLayoutMargins:", v16, v18, v19, v21);
  -[SKUISettingDescriptionView setFrame:](self->_settingDescriptionView, "setFrame:", v7, v9, v11, v13);
}

- (void)setBackgroundColor:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SKUISettingsTableViewCell;
  [(SKUISettingsTableViewCell *)&v3 setBackgroundColor:a3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingDescriptionView, 0);

  objc_storeStrong((id *)&self->_disclosureChevron, 0);
}

- (void)initWithStyle:reuseIdentifier:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUISettingsTableViewCell initWithStyle:reuseIdentifier:]";
}

@end