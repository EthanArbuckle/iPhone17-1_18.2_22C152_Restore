@interface SUUISettingsTableHeaderFooterView
- (void)displaySettingsHeaderFooterDescriptionView:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation SUUISettingsTableHeaderFooterView

- (void)displaySettingsHeaderFooterDescriptionView:(id)a3
{
  p_settingsHeaderFooterDescriptionView = &self->_settingsHeaderFooterDescriptionView;
  objc_storeStrong((id *)&self->_settingsHeaderFooterDescriptionView, a3);
  id v6 = a3;
  v7 = [(SUUISettingsTableHeaderFooterView *)self contentView];
  [v7 addSubview:*p_settingsHeaderFooterDescriptionView];

  [(SUUISettingsTableHeaderFooterView *)self setNeedsLayout];
}

- (void)prepareForReuse
{
  [(SUUISettingsHeaderFooterDescriptionView *)self->_settingsHeaderFooterDescriptionView removeFromSuperview];
  settingsHeaderFooterDescriptionView = self->_settingsHeaderFooterDescriptionView;
  self->_settingsHeaderFooterDescriptionView = 0;
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)SUUISettingsTableHeaderFooterView;
  [(SUUISettingsTableHeaderFooterView *)&v12 layoutSubviews];
  v3 = [(SUUISettingsTableHeaderFooterView *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  [(SUUISettingsTableHeaderFooterView *)self layoutMargins];
  [(SUUISettingsHeaderFooterDescriptionView *)self->_settingsHeaderFooterDescriptionView setLayoutMargins:"setLayoutMargins:"];
  -[SUUISettingsHeaderFooterDescriptionView setFrame:](self->_settingsHeaderFooterDescriptionView, "setFrame:", v5, v7, v9, v11);
}

- (void).cxx_destruct
{
}

@end