@interface SKUIGiftTermsAndConditionsSection
- (id)_headerView;
- (id)headerViewForTableView:(id)a3;
- (void)_headerView;
- (void)_termsAction:(id)a3;
@end

@implementation SKUIGiftTermsAndConditionsSection

- (id)headerViewForTableView:(id)a3
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v4) {
        -[SKUIGiftTermsAndConditionsSection headerViewForTableView:](v4, v5, v6, v7, v8, v9, v10, v11);
      }
    }
  }
  v12 = [(SKUIGiftTermsAndConditionsSection *)self _headerView];

  return v12;
}

- (void)_termsAction:(id)a3
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        -[SKUIGiftTermsAndConditionsSection _termsAction:](v3, v4, v5, v6, v7, v8, v9, v10);
      }
    }
  }
  uint64_t v11 = [MEMORY[0x1E4F1CB10] termsAndConditionsURL];
  SKUIMetricsOpenURL(v11);
}

- (id)_headerView
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUIGiftTermsAndConditionsSection *)v3 _headerView];
      }
    }
  }
  headerView = self->_headerView;
  if (!headerView)
  {
    v12 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    v13 = self->_headerView;
    self->_headerView = v12;

    -[UIView setFrame:](self->_headerView, "setFrame:", 0.0, 0.0, 60.0, 45.0);
    [(UIView *)self->_headerView bounds];
    double v15 = v14;
    v16 = [MEMORY[0x1E4FB1438] sharedApplication];
    uint64_t v17 = [v16 userInterfaceLayoutDirection];

    v18 = [SKUILinkButton alloc];
    if (v17) {
      uint64_t v19 = 5;
    }
    else {
      uint64_t v19 = 1;
    }
    v20 = [(SKUILinkButton *)v18 initWithArrowStyle:v19];
    [(SKUILinkButton *)v20 addTarget:self action:sel__termsAction_ forControlEvents:64];
    [(SKUILinkButton *)v20 setAutoresizingMask:5];
    v21 = [(SKUIGiftTableViewSection *)self giftConfiguration];
    v22 = [v21 clientContext];

    if (SKUIUserInterfaceIdiom(v22) == 1)
    {
      if (v22)
      {
        v23 = @"GIFTING_TERMS_LINK_IPAD";
LABEL_14:
        uint64_t v24 = [v22 localizedStringForKey:v23 inTable:@"Gifting"];
LABEL_18:
        v26 = (void *)v24;
        [(SKUILinkButton *)v20 setTitle:v24 forState:0];
        v27 = [(SKUILinkButton *)v20 titleLabel];
        v28 = [MEMORY[0x1E4FB08E0] systemFontOfSize:12.0];
        [v27 setFont:v28];

        v29 = [MEMORY[0x1E4FB1618] _secondaryLabelColor];
        [(SKUILinkButton *)v20 setTitleColor:v29 forState:0];

        v30 = [MEMORY[0x1E4FB1618] _labelColor];
        [(SKUILinkButton *)v20 setTitleColor:v30 forState:1];

        [(SKUILinkButton *)v20 sizeToFit];
        [(SKUILinkButton *)v20 frame];
        -[SKUILinkButton setFrame:](v20, "setFrame:", floor((v15 - v31) * 0.5), 25.0);
        [(UIView *)self->_headerView addSubview:v20];

        headerView = self->_headerView;
        goto LABEL_19;
      }
      v25 = @"GIFTING_TERMS_LINK_IPAD";
    }
    else
    {
      if (v22)
      {
        v23 = @"GIFTING_TERMS_LINK_IPHONE";
        goto LABEL_14;
      }
      v25 = @"GIFTING_TERMS_LINK_IPHONE";
    }
    uint64_t v24 = +[SKUIClientContext localizedStringForKey:v25 inBundles:0 inTable:@"Gifting"];
    goto LABEL_18;
  }
LABEL_19:

  return headerView;
}

- (void).cxx_destruct
{
}

- (void)headerViewForTableView:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_termsAction:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_headerView
{
}

@end