@interface SKUISettingsTableHeaderFooterView
- (void)displaySettingsHeaderFooterDescriptionView:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation SKUISettingsTableHeaderFooterView

- (void)displaySettingsHeaderFooterDescriptionView:(id)a3
{
  v4 = (SKUISettingsHeaderFooterDescriptionView *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUISettingsTableHeaderFooterView displaySettingsHeaderFooterDescriptionView:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  settingsHeaderFooterDescriptionView = self->_settingsHeaderFooterDescriptionView;
  self->_settingsHeaderFooterDescriptionView = v4;
  v14 = v4;

  v15 = [(SKUISettingsTableHeaderFooterView *)self contentView];
  [v15 addSubview:self->_settingsHeaderFooterDescriptionView];

  [(SKUISettingsTableHeaderFooterView *)self setNeedsLayout];
}

- (void)prepareForReuse
{
}

- (void)layoutSubviews
{
}

- (void).cxx_destruct
{
}

- (void)displaySettingsHeaderFooterDescriptionView:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end