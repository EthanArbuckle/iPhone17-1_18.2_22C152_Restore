@interface SUUIProductPageTableLinksSection
- (SUUIColorScheme)colorScheme;
- (SUUIProductPageTableLinksSection)initWithItem:(id)a3 clientContext:(id)a4 askPermission:(BOOL)a5;
- (double)heightForCellInTableView:(id)a3 indexPath:(id)a4;
- (id)selectionActionForTableView:(id)a3 indexPath:(id)a4;
- (id)tableViewCellForTableView:(id)a3 indexPath:(id)a4;
- (int64_t)numberOfRowsInSection;
- (void)setColorScheme:(id)a3;
@end

@implementation SUUIProductPageTableLinksSection

- (SUUIProductPageTableLinksSection)initWithItem:(id)a3 clientContext:(id)a4 askPermission:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v75.receiver = self;
  v75.super_class = (Class)SUUIProductPageTableLinksSection;
  v11 = [(SUUIProductPageTableLinksSection *)&v75 init];
  v12 = v11;
  if (!v11) {
    goto LABEL_42;
  }
  p_item = (id *)&v11->_item;
  objc_storeStrong((id *)&v11->_item, a3);
  v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  actions = v12->_actions;
  uint64_t v56 = 48;
  v12->_actions = v14;

  v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  titles = v12->_titles;
  v12->_titles = v16;

  if (SUUIUserInterfaceIdiom(v10))
  {
    if (a5) {
      goto LABEL_42;
    }
    goto LABEL_16;
  }
  v18 = [*p_item inAppPurchases];
  if ([v18 count])
  {
    v19 = +[SUUIProductPageAction actionWithType:3];
    v72[0] = MEMORY[0x263EF8330];
    v72[1] = 3221225472;
    v72[2] = __77__SUUIProductPageTableLinksSection_initWithItem_clientContext_askPermission___block_invoke;
    v72[3] = &unk_2654006F0;
    id v73 = v18;
    id v20 = v10;
    id v74 = v20;
    [v19 setViewControllerBlock:v72];
    [(NSMutableArray *)v12->_actions addObject:v19];
    v21 = v12->_titles;
    if (v20) {
      [v20 localizedStringForKey:@"PRODUCT_PAGE_IN_APPS_TITLE" inTable:@"ProductPage"];
    }
    else {
    v22 = +[SUUIClientContext localizedStringForKey:@"PRODUCT_PAGE_IN_APPS_TITLE" inBundles:0 inTable:@"ProductPage"];
    }
    -[NSMutableArray addObject:](v21, "addObject:", v22, 48);
  }
  v23 = objc_msgSend(*p_item, "releaseNotes", v56);

  if ([v23 count])
  {
    v24 = +[SUUIProductPageAction actionWithType:3];
    v69[0] = MEMORY[0x263EF8330];
    v69[1] = 3221225472;
    v69[2] = __77__SUUIProductPageTableLinksSection_initWithItem_clientContext_askPermission___block_invoke_2;
    v69[3] = &unk_2654006F0;
    id v70 = v23;
    id v25 = v10;
    id v71 = v25;
    [v24 setViewControllerBlock:v69];
    [*(id *)((char *)&v12->super.super.super.isa + v56) addObject:v24];
    v26 = v12->_titles;
    if (v25) {
      [v25 localizedStringForKey:@"PRODUCT_PAGE_UPDATE_HISTORY_TITLE" inTable:@"ProductPage"];
    }
    else {
    v27 = +[SUUIClientContext localizedStringForKey:@"PRODUCT_PAGE_UPDATE_HISTORY_TITLE" inBundles:0 inTable:@"ProductPage"];
    }
    [(NSMutableArray *)v26 addObject:v27];
  }
  if (!a5)
  {
LABEL_16:
    v28 = objc_msgSend(v9, "supportURLString", v56);
    if (v28)
    {
      v29 = +[SUUIProductPageAction actionWithType:1];
      v30 = [NSURL URLWithString:v28];
      [v29 setURL:v30];

      [*(id *)((char *)&v12->super.super.super.isa + v57) addObject:v29];
      v31 = v12->_titles;
      if (v10) {
        [v10 localizedStringForKey:@"PRODUCT_PAGE_DEVELOPER_WEBSITE" inTable:@"ProductPage"];
      }
      else {
      v32 = +[SUUIClientContext localizedStringForKey:@"PRODUCT_PAGE_DEVELOPER_WEBSITE" inBundles:0 inTable:@"ProductPage"];
      }
      [(NSMutableArray *)v31 addObject:v32];
    }
    v33 = [v9 licenseAgreementURLString];

    if (v33)
    {
      v34 = [NSURL URLWithString:v33];
      v35 = [v34 URLByAppendingQueryParameter:@"mt" value:@"8"];

      v36 = +[SUUIProductPageAction actionWithType:2];
      [v36 setURL:v35];
      v66[0] = MEMORY[0x263EF8330];
      v66[1] = 3221225472;
      v66[2] = __77__SUUIProductPageTableLinksSection_initWithItem_clientContext_askPermission___block_invoke_3;
      v66[3] = &unk_265400718;
      id v37 = v35;
      id v67 = v37;
      id v38 = v10;
      id v68 = v38;
      [v36 setViewControllerBlock:v66];
      [*(id *)((char *)&v12->super.super.super.isa + v57) addObject:v36];
      v39 = v12->_titles;
      if (v38) {
        [v38 localizedStringForKey:@"PRODUCT_PAGE_LICENSE_AGREEMENT" inTable:@"ProductPage"];
      }
      else {
      v40 = +[SUUIClientContext localizedStringForKey:@"PRODUCT_PAGE_LICENSE_AGREEMENT" inBundles:0 inTable:@"ProductPage"];
      }
      [(NSMutableArray *)v39 addObject:v40];
    }
    v41 = [v9 privacyPolicyURLString];

    if (v41)
    {
      v42 = +[SUUIProductPageAction actionWithType:1];
      v43 = [NSURL URLWithString:v41];
      [v42 setURL:v43];

      [*(id *)((char *)&v12->super.super.super.isa + v57) addObject:v42];
      v44 = v12->_titles;
      if (v10) {
        [v10 localizedStringForKey:@"PRODUCT_PAGE_PRIVACY_POLICY" inTable:@"ProductPage"];
      }
      else {
      v45 = +[SUUIClientContext localizedStringForKey:@"PRODUCT_PAGE_PRIVACY_POLICY" inBundles:0 inTable:@"ProductPage"];
      }
      [(NSMutableArray *)v44 addObject:v45];
    }
    v46 = [v9 artistPageURL];
    if (v46)
    {
      v47 = +[SUUIProductPageAction actionWithType:2];
      [v47 setURL:v46];
      v62[0] = MEMORY[0x263EF8330];
      v62[1] = 3221225472;
      v62[2] = __77__SUUIProductPageTableLinksSection_initWithItem_clientContext_askPermission___block_invoke_4;
      v62[3] = &unk_265400740;
      id v48 = v10;
      id v63 = v48;
      id v64 = v9;
      id v65 = v46;
      [v47 setViewControllerBlock:v62];
      [*(id *)((char *)&v12->super.super.super.isa + v57) addObject:v47];
      v49 = v12->_titles;
      if (v48) {
        [v48 localizedStringForKey:@"PRODUCT_PAGE_DEVELOPER_APPS" inTable:@"ProductPage"];
      }
      else {
      v50 = +[SUUIClientContext localizedStringForKey:@"PRODUCT_PAGE_DEVELOPER_APPS" inBundles:0 inTable:@"ProductPage"];
      }
      [(NSMutableArray *)v49 addObject:v50];
    }
    v51 = [v9 developerInfo];
    if (v51)
    {
      v52 = +[SUUIProductPageAction actionWithType:3];
      if (v10) {
        [v10 localizedStringForKey:@"PRODUCT_PAGE_DEVELOPER_INFO" inTable:@"ProductPage"];
      }
      else {
      v53 = +[SUUIClientContext localizedStringForKey:@"PRODUCT_PAGE_DEVELOPER_INFO" inBundles:0 inTable:@"ProductPage"];
      }
      v58[0] = MEMORY[0x263EF8330];
      v58[1] = 3221225472;
      v58[2] = __77__SUUIProductPageTableLinksSection_initWithItem_clientContext_askPermission___block_invoke_5;
      v58[3] = &unk_265400768;
      id v59 = v51;
      id v60 = v10;
      id v61 = v53;
      id v54 = v53;
      [v52 setViewControllerBlock:v58];
      [*(id *)((char *)&v12->super.super.super.isa + v57) addObject:v52];
      [(NSMutableArray *)v12->_titles addObject:v54];
    }
  }
LABEL_42:

  return v12;
}

SUUIViewController *__77__SUUIProductPageTableLinksSection_initWithItem_clientContext_askPermission___block_invoke(uint64_t a1)
{
  v2 = [[SUUIProductPageTableViewController alloc] initWithInAppPurchases:*(void *)(a1 + 32) clientContext:*(void *)(a1 + 40)];
  v3 = [(SUUIProductPageTableViewController *)v2 view];
  [v3 setAutoresizingMask:18];

  v4 = objc_alloc_init(SUUIViewController);
  [(SUUIViewController *)v4 setClientContext:*(void *)(a1 + 40)];
  [(SUUIViewController *)v4 addChildViewController:v2];
  [(SUUIViewController *)v4 showDefaultNavigationItems];
  v5 = [(SUUIViewController *)v4 view];
  v6 = [(SUUIProductPageTableViewController *)v2 view];
  [v5 addSubview:v6];

  v7 = [(SUUIProductPageTableViewController *)v2 view];
  v8 = [(SUUIViewController *)v4 view];
  [v8 bounds];
  objc_msgSend(v7, "setFrame:");

  return v4;
}

SUUIViewController *__77__SUUIProductPageTableLinksSection_initWithItem_clientContext_askPermission___block_invoke_2(uint64_t a1)
{
  v2 = [[SUUIProductPageTableViewController alloc] initWithReleaseNotes:*(void *)(a1 + 32) clientContext:*(void *)(a1 + 40)];
  v3 = [(SUUIProductPageTableViewController *)v2 view];
  [v3 setAutoresizingMask:18];

  v4 = objc_alloc_init(SUUIViewController);
  [(SUUIViewController *)v4 setClientContext:*(void *)(a1 + 40)];
  [(SUUIViewController *)v4 addChildViewController:v2];
  [(SUUIViewController *)v4 showDefaultNavigationItems];
  v5 = [(SUUIViewController *)v4 view];
  v6 = [(SUUIProductPageTableViewController *)v2 view];
  [v5 addSubview:v6];

  v7 = [(SUUIProductPageTableViewController *)v2 view];
  v8 = [(SUUIViewController *)v4 view];
  [v8 bounds];
  objc_msgSend(v7, "setFrame:");

  return v4;
}

SUUIApplicationLicenseViewController *__77__SUUIProductPageTableLinksSection_initWithItem_clientContext_askPermission___block_invoke_3(uint64_t a1)
{
  v2 = [[SUUIApplicationLicenseViewController alloc] initWithLicenseAgreementURL:*(void *)(a1 + 32)];
  [(SUUIViewController *)v2 setClientContext:*(void *)(a1 + 40)];
  return v2;
}

SUUIStorePageViewController *__77__SUUIProductPageTableLinksSection_initWithItem_clientContext_askPermission___block_invoke_4(uint64_t a1)
{
  v2 = objc_alloc_init(SUUIStorePageViewController);
  [(SUUIStorePageViewController *)v2 setClientContext:*(void *)(a1 + 32)];
  v3 = [*(id *)(a1 + 40) artistName];
  [(SUUIStorePageViewController *)v2 setTitle:v3];

  [(SUUIStorePageViewController *)v2 loadURL:*(void *)(a1 + 48) withCompletionBlock:0];
  return v2;
}

SUUIDeveloperInfoViewController *__77__SUUIProductPageTableLinksSection_initWithItem_clientContext_askPermission___block_invoke_5(void *a1)
{
  v2 = [[SUUIDeveloperInfoViewController alloc] initWithDeveloperInfo:a1[4]];
  [(SUUIViewController *)v2 setClientContext:a1[5]];
  [(SUUIDeveloperInfoViewController *)v2 setTitle:a1[6]];
  return v2;
}

- (double)heightForCellInTableView:(id)a3 indexPath:(id)a4
{
  return *MEMORY[0x263F839B8];
}

- (int64_t)numberOfRowsInSection
{
  return [(NSMutableArray *)self->_titles count];
}

- (id)selectionActionForTableView:(id)a3 indexPath:(id)a4
{
  actions = self->_actions;
  uint64_t v5 = objc_msgSend(a4, "row", a3);
  return (id)[(NSMutableArray *)actions objectAtIndex:v5];
}

- (id)tableViewCellForTableView:(id)a3 indexPath:(id)a4
{
  id v6 = a4;
  v7 = [a3 dequeueReusableCellWithIdentifier:@"LK"];
  if (!v7)
  {
    v7 = [[SUUITableViewCell alloc] initWithStyle:0 reuseIdentifier:@"LK"];
    [(SUUITableViewCell *)v7 setAccessoryType:1];
    v8 = [(SUUIColorScheme *)self->_colorScheme primaryTextColor];
    if (v8)
    {
      [(SUUITableViewCell *)v7 setBottomBorderColor:v8];
    }
    else
    {
      id v9 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.2];
      [(SUUITableViewCell *)v7 setBottomBorderColor:v9];
    }
    id v10 = [(SUUITableViewCell *)v7 textLabel];
    v11 = [MEMORY[0x263F81708] systemFontOfSize:18.0];
    [v10 setFont:v11];

    v12 = [(SUUIColorScheme *)self->_colorScheme secondaryTextColor];
    if (v12)
    {
      [v10 setTextColor:v12];
    }
    else
    {
      v13 = [MEMORY[0x263F825C8] blackColor];
      [v10 setTextColor:v13];
    }
  }
  v14 = [(SUUITableViewCell *)v7 textLabel];
  titles = self->_titles;
  uint64_t v16 = [v6 row];

  v17 = [(NSMutableArray *)titles objectAtIndex:v16];
  [v14 setText:v17];

  return v7;
}

- (SUUIColorScheme)colorScheme
{
  return self->_colorScheme;
}

- (void)setColorScheme:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorScheme, 0);
  objc_storeStrong((id *)&self->_titles, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_actions, 0);
}

@end