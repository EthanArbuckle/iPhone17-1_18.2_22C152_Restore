@interface SUUIGiftTermsAndConditionsSection
- (id)_headerView;
- (void)_termsAction:(id)a3;
@end

@implementation SUUIGiftTermsAndConditionsSection

- (void)_termsAction:(id)a3
{
  objc_msgSend(NSURL, "termsAndConditionsURL", a3);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  SUUIMetricsOpenURL(v3);
}

- (id)_headerView
{
  headerView = self->_headerView;
  if (!headerView)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    v5 = self->_headerView;
    self->_headerView = v4;

    -[UIView setFrame:](self->_headerView, "setFrame:", 0.0, 0.0, 60.0, 45.0);
    [(UIView *)self->_headerView bounds];
    double v7 = v6;
    v8 = [MEMORY[0x263F82438] sharedApplication];
    uint64_t v9 = [v8 userInterfaceLayoutDirection];

    v10 = [SUUILinkButton alloc];
    if (v9) {
      uint64_t v11 = 5;
    }
    else {
      uint64_t v11 = 1;
    }
    v12 = [(SUUILinkButton *)v10 initWithArrowStyle:v11];
    [(SUUILinkButton *)v12 addTarget:self action:sel__termsAction_ forControlEvents:64];
    [(SUUILinkButton *)v12 setAutoresizingMask:5];
    v13 = [(SUUIGiftTableViewSection *)self giftConfiguration];
    v14 = [v13 clientContext];

    if (SUUIUserInterfaceIdiom(v14) == 1)
    {
      if (v14)
      {
        v15 = @"GIFTING_TERMS_LINK_IPAD";
LABEL_10:
        uint64_t v16 = [v14 localizedStringForKey:v15 inTable:@"Gifting"];
LABEL_14:
        v18 = (void *)v16;
        [(SUUILinkButton *)v12 setTitle:v16 forState:0];
        v19 = [(SUUILinkButton *)v12 titleLabel];
        v20 = [MEMORY[0x263F81708] systemFontOfSize:12.0];
        [v19 setFont:v20];

        v21 = [MEMORY[0x263F825C8] secondaryLabelColor];
        [(SUUILinkButton *)v12 setTitleColor:v21 forState:0];

        v22 = [MEMORY[0x263F825C8] labelColor];
        [(SUUILinkButton *)v12 setTitleColor:v22 forState:1];

        [(SUUILinkButton *)v12 sizeToFit];
        [(SUUILinkButton *)v12 frame];
        -[SUUILinkButton setFrame:](v12, "setFrame:", floor((v7 - v23) * 0.5), 25.0);
        [(UIView *)self->_headerView addSubview:v12];

        headerView = self->_headerView;
        goto LABEL_15;
      }
      v17 = @"GIFTING_TERMS_LINK_IPAD";
    }
    else
    {
      if (v14)
      {
        v15 = @"GIFTING_TERMS_LINK_IPHONE";
        goto LABEL_10;
      }
      v17 = @"GIFTING_TERMS_LINK_IPHONE";
    }
    uint64_t v16 = +[SUUIClientContext localizedStringForKey:v17 inBundles:0 inTable:@"Gifting"];
    goto LABEL_14;
  }
LABEL_15:
  return headerView;
}

- (void).cxx_destruct
{
}

@end