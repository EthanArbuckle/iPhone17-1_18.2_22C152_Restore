@interface SUUIDeveloperInfoView
- (CGSize)sizeThatFits:(CGSize)a3;
- (SUUIClientContext)clientContext;
- (SUUIDeveloperInfo)developerInfo;
- (SUUIDeveloperInfoView)initWithDeveloperInfo:(id)a3 clientContext:(id)a4;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
@end

@implementation SUUIDeveloperInfoView

- (SUUIDeveloperInfoView)initWithDeveloperInfo:(id)a3 clientContext:(id)a4
{
  v53[2] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v48.receiver = self;
  v48.super_class = (Class)SUUIDeveloperInfoView;
  v9 = [(SUUIDeveloperInfoView *)&v48 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_clientContext, a4);
    objc_storeStrong((id *)&v10->_developerInfo, a3);
    uint64_t v11 = SUUIUserInterfaceIdiom(v8);
    if (v11 == 1) {
      double v12 = 0.0;
    }
    else {
      double v12 = 15.0;
    }
    id v13 = objc_alloc_init(MEMORY[0x263EFF980]);
    v14 = [v7 tradeName];
    if (v14)
    {
      if (v8) {
        [v8 localizedStringForKey:@"DEVELOPER_INFO_LABEL_TRADE_NAME" inTable:@"ProductPage"];
      }
      else {
      v15 = +[SUUIClientContext localizedStringForKey:@"DEVELOPER_INFO_LABEL_TRADE_NAME" inBundles:0 inTable:@"ProductPage"];
      }
      v53[0] = v15;
      v53[1] = v14;
      v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v53 count:2];
      [v13 addObject:v16];
    }
    v17 = [v7 tradeRepresentativeName];

    if (v17)
    {
      if (v8) {
        [v8 localizedStringForKey:@"DEVELOPER_INFO_LABEL_TRADE_REP" inTable:@"ProductPage"];
      }
      else {
      v18 = +[SUUIClientContext localizedStringForKey:@"DEVELOPER_INFO_LABEL_TRADE_REP" inBundles:0 inTable:@"ProductPage"];
      }
      v52[0] = v18;
      v52[1] = v17;
      v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v52 count:2];
      [v13 addObject:v19];
    }
    v20 = [v7 formattedAddressString];

    if (v20)
    {
      if (v8) {
        [v8 localizedStringForKey:@"DEVELOPER_INFO_LABEL_ADDRESS" inTable:@"ProductPage"];
      }
      else {
      v21 = +[SUUIClientContext localizedStringForKey:@"DEVELOPER_INFO_LABEL_ADDRESS" inBundles:0 inTable:@"ProductPage"];
      }
      v51[0] = v21;
      v51[1] = v20;
      v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v51 count:2];
      [v13 addObject:v22];
    }
    v23 = [v7 phoneNumber];

    if (v23)
    {
      if (v8) {
        [v8 localizedStringForKey:@"DEVELOPER_INFO_LABEL_PHONE" inTable:@"ProductPage"];
      }
      else {
      v24 = +[SUUIClientContext localizedStringForKey:@"DEVELOPER_INFO_LABEL_PHONE" inBundles:0 inTable:@"ProductPage"];
      }
      v50[0] = v24;
      v50[1] = v23;
      v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v50 count:2];
      [v13 addObject:v25];
    }
    v26 = [v7 emailAddress];

    if (v26)
    {
      if (v8) {
        [v8 localizedStringForKey:@"DEVELOPER_INFO_LABEL_EMAIL" inTable:@"ProductPage"];
      }
      else {
      v27 = +[SUUIClientContext localizedStringForKey:@"DEVELOPER_INFO_LABEL_EMAIL" inBundles:0 inTable:@"ProductPage"];
      }
      v49[0] = v27;
      v49[1] = v26;
      v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:v49 count:2];
      [v13 addObject:v28];
    }
    if ([v13 count])
    {
      v29 = objc_alloc_init(SUUIProductInformationView);
      infoView = v10->_infoView;
      v10->_infoView = v29;

      double v31 = 15.0;
      if (v11 == 1) {
        double v31 = 0.0;
      }
      -[SUUIProductInformationView setContentInset:](v10->_infoView, "setContentInset:", v31, v31, 17.0, 15.0);
      [(SUUIProductInformationView *)v10->_infoView setHidesSeparatorView:1];
      [(SUUIProductInformationView *)v10->_infoView setInformationLines:v13];
      [(SUUIDeveloperInfoView *)v10 addSubview:v10->_infoView];
      v32 = [MEMORY[0x263F82B60] mainScreen];
      [v32 scale];
      double v34 = 1.0 / v33;

      uint64_t v35 = objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", v12, 0.0, 0.0, v34);
      infoSeparatorView = v10->_infoSeparatorView;
      v10->_infoSeparatorView = (UIView *)v35;

      v37 = v10->_infoSeparatorView;
      v38 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.2];
      [(UIView *)v37 setBackgroundColor:v38];

      [(SUUIDeveloperInfoView *)v10 addSubview:v10->_infoSeparatorView];
    }
    v39 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    lineViews = v10->_lineViews;
    v10->_lineViews = v39;

    v41 = [v7 ECommerceRegistrationIdentifier];
    if (v41)
    {
      if (v8) {
        [v8 localizedStringForKey:@"DEVELOPER_INFO_LABEL_ECOMMERCE_REGISTRATION_ID" inTable:@"ProductPage"];
      }
      else {
      v42 = +[SUUIClientContext localizedStringForKey:@"DEVELOPER_INFO_LABEL_ECOMMERCE_REGISTRATION_ID" inBundles:0 inTable:@"ProductPage"];
      }
      v43 = [[SUUIDeveloperInfoLineItemView alloc] initWithLabel:v42 value:v41];
      -[SUUIDeveloperInfoLineItemView setContentInset:](v43, "setContentInset:", 11.0, v12, 11.0, 15.0);
      [(NSMutableArray *)v10->_lineViews addObject:v43];
      [(SUUIDeveloperInfoView *)v10 addSubview:v43];
    }
    v44 = [v7 businessRegistrationIdentifier];

    if (v44)
    {
      if (v8) {
        [v8 localizedStringForKey:@"DEVELOPER_INFO_LABEL_BUSINESS_REGISTRATION_ID" inTable:@"ProductPage"];
      }
      else {
      v45 = +[SUUIClientContext localizedStringForKey:@"DEVELOPER_INFO_LABEL_BUSINESS_REGISTRATION_ID" inBundles:0 inTable:@"ProductPage"];
      }
      v46 = [[SUUIDeveloperInfoLineItemView alloc] initWithLabel:v45 value:v44];
      -[SUUIDeveloperInfoLineItemView setContentInset:](v46, "setContentInset:", 11.0, v12, 11.0, 15.0);
      [(NSMutableArray *)v10->_lineViews addObject:v46];
      [(SUUIDeveloperInfoView *)v10 addSubview:v46];
    }
  }

  return v10;
}

- (void)layoutSubviews
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  [(SUUIDeveloperInfoView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  [(SUUIProductInformationView *)self->_infoView frame];
  double v8 = v7;
  -[SUUIProductInformationView sizeThatFits:](self->_infoView, "sizeThatFits:", v4, v6);
  double v10 = v9;
  CGFloat v12 = v11;
  *(float *)&double v9 = (v4 - v9) * 0.5;
  CGFloat v13 = floorf(*(float *)&v9);
  -[SUUIProductInformationView setFrame:](self->_infoView, "setFrame:", v13, v8, v10, v11);
  v35.origin.x = v13;
  v35.origin.y = v8;
  v35.size.width = v10;
  v35.size.height = v12;
  double MaxY = CGRectGetMaxY(v35);
  [(UIView *)self->_infoSeparatorView frame];
  -[UIView setFrame:](self->_infoSeparatorView, "setFrame:", v16, MaxY - v15, v4 - v16);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v17 = self->_lineViews;
  uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v30 != v20) {
          objc_enumerationMutation(v17);
        }
        v22 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        objc_msgSend(v22, "frame", (void)v29);
        double v24 = v23;
        objc_msgSend(v22, "sizeThatFits:", v4, v6);
        CGFloat v26 = v25;
        CGFloat v28 = v27;
        objc_msgSend(v22, "setFrame:", v24, MaxY, v25, v27);
        v36.origin.x = v24;
        v36.origin.y = MaxY;
        v36.size.width = v26;
        v36.size.height = v28;
        double MaxY = CGRectGetMaxY(v36);
      }
      uint64_t v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v19);
  }
}

- (void)setBackgroundColor:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(SUUIProductInformationView *)self->_infoView setBackgroundColor:v4];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  double v5 = self->_lineViews;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v9++) setBackgroundColor:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  v10.receiver = self;
  v10.super_class = (Class)SUUIDeveloperInfoView;
  [(SUUIDeveloperInfoView *)&v10 setBackgroundColor:v4];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v23 = *MEMORY[0x263EF8340];
  -[SUUIProductInformationView sizeThatFits:](self->_infoView, "sizeThatFits:");
  double v7 = v6;
  double v9 = v8;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  objc_super v10 = self->_lineViews;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v14), "sizeThatFits:", width, height, (void)v18);
        double v9 = v9 + v15;
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v12);
  }

  double v16 = v7;
  double v17 = v9;
  result.double height = v17;
  result.double width = v16;
  return result;
}

- (SUUIClientContext)clientContext
{
  return self->_clientContext;
}

- (SUUIDeveloperInfo)developerInfo
{
  return self->_developerInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lineViews, 0);
  objc_storeStrong((id *)&self->_infoView, 0);
  objc_storeStrong((id *)&self->_infoSeparatorView, 0);
  objc_storeStrong((id *)&self->_developerInfo, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

@end