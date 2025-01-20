@interface WFValueListViewController
- (BOOL)hasSwitch;
- (BOOL)switchOn;
- (NSArray)titles;
- (NSMutableArray)sections;
- (NSString)selectedTitle;
- (NSString)switchTitle;
- (UISwitch)configSwitch;
- (WFValueListViewController)initWithTitles:(id)a3 switchTitle:(id)a4;
- (WFValueListViewController)initWithTitles:(id)a3 switchTitle:(id)a4 sublist:(id)a5;
- (WFValueListViewController)initWithTitles:(id)a3 switchTitle:(id)a4 sublist:(id)a5 appearanceProxy:(id)a6;
- (WFValueListViewController)sublist;
- (id)cellForTitleAtIndexPath:(id)a3;
- (id)completionHandler;
- (id)footerHandler;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)setCompletionHandler:(id)a3;
- (void)setConfigSwitch:(id)a3;
- (void)setFooterHandler:(id)a3;
- (void)setHasSwitch:(BOOL)a3;
- (void)setSections:(id)a3;
- (void)setSelectedTitle:(id)a3;
- (void)setSublist:(id)a3;
- (void)setSwitchOn:(BOOL)a3;
- (void)setSwitchTitle:(id)a3;
- (void)setTitles:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation WFValueListViewController

- (WFValueListViewController)initWithTitles:(id)a3 switchTitle:(id)a4
{
  return [(WFValueListViewController *)self initWithTitles:a3 switchTitle:a4 sublist:0];
}

- (WFValueListViewController)initWithTitles:(id)a3 switchTitle:(id)a4 sublist:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = +[WFAppearanceProxy defaultAppearanceProxy];
  v12 = [(WFValueListViewController *)self initWithTitles:v10 switchTitle:v9 sublist:v8 appearanceProxy:v11];

  return v12;
}

- (WFValueListViewController)initWithTitles:(id)a3 switchTitle:(id)a4 sublist:(id)a5 appearanceProxy:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v24.receiver = self;
  v24.super_class = (Class)WFValueListViewController;
  v14 = -[WFValueListViewController initWithStyle:](&v24, sel_initWithStyle_, [a6 tableViewStyle]);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_titles, a3);
    v15->_hasSwitch = v12 != 0;
    v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    sections = v15->_sections;
    v15->_sections = v16;

    objc_storeStrong((id *)&v15->_switchTitle, a4);
    if (v15->_hasSwitch)
    {
      [(NSMutableArray *)v15->_sections addObject:&unk_26D911D40];
      id v18 = objc_alloc(MEMORY[0x263F82C40]);
      uint64_t v19 = objc_msgSend(v18, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
      configSwitch = v15->_configSwitch;
      v15->_configSwitch = (UISwitch *)v19;

      [(UISwitch *)v15->_configSwitch setOn:1];
    }
    if (v13)
    {
      [(NSMutableArray *)v15->_sections addObject:&unk_26D911D58];
      [(WFValueListViewController *)v15 setSublist:v13];
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __80__WFValueListViewController_initWithTitles_switchTitle_sublist_appearanceProxy___block_invoke;
      v22[3] = &unk_264756398;
      v23 = v15;
      [v13 setCompletionHandler:v22];
    }
    if ([(NSArray *)v15->_titles count]) {
      [(NSMutableArray *)v15->_sections addObject:&unk_26D911D70];
    }
  }

  return v15;
}

void __80__WFValueListViewController_initWithTitles_switchTitle_sublist_appearanceProxy___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) sections];
  uint64_t v3 = [v2 indexOfObject:&unk_26D911D58];

  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = [*(id *)(a1 + 32) tableView];
    v4 = [MEMORY[0x263F088D0] indexSetWithIndex:v3];
    [v5 reloadSections:v4 withRowAnimation:5];
  }
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)WFValueListViewController;
  [(WFValueListViewController *)&v8 viewDidLoad];
  double v3 = *MEMORY[0x263F839B8];
  v4 = [(WFValueListViewController *)self tableView];
  [v4 setRowHeight:v3];

  id v5 = [(WFValueListViewController *)self tableView];
  [v5 setEstimatedRowHeight:44.0];

  v6 = [(WFValueListViewController *)self tableView];
  [v6 setEstimatedSectionHeaderHeight:0.0];

  v7 = [(WFValueListViewController *)self tableView];
  [v7 setEstimatedSectionFooterHeight:0.0];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)WFValueListViewController;
  [(WFValueListViewController *)&v8 viewWillDisappear:a3];
  v4 = [(WFValueListViewController *)self completionHandler];

  if (v4)
  {
    id v5 = [(WFValueListViewController *)self completionHandler];
    v6 = [(WFValueListViewController *)self selectedTitle];
    v7 = [(WFValueListViewController *)self configSwitch];
    ((void (**)(void, void *, uint64_t))v5)[2](v5, v6, [v7 isOn]);
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return [(NSMutableArray *)self->_sections count];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t v6 = [(NSMutableArray *)self->_sections indexOfObject:&unk_26D911D40];
  uint64_t v7 = [(NSMutableArray *)self->_sections indexOfObject:&unk_26D911D70];
  uint64_t v8 = [(NSMutableArray *)self->_sections indexOfObject:&unk_26D911D58];
  if (v6 == a4) {
    return a4 != 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v7 == a4)
  {
    if (a4 == 0x7FFFFFFFFFFFFFFFLL)
    {
      return 0;
    }
    else
    {
      titles = self->_titles;
      return [(NSArray *)titles count];
    }
  }
  else
  {
    return v8 == a4 && a4 != 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(NSMutableArray *)self->_sections indexOfObject:&unk_26D911D40];
  uint64_t v9 = [(NSMutableArray *)self->_sections indexOfObject:&unk_26D911D70];
  uint64_t v10 = [(NSMutableArray *)self->_sections indexOfObject:&unk_26D911D58];
  if ([v7 section] == v8)
  {
    id v11 = [v6 dequeueReusableCellWithIdentifier:@"kWFValueListCellRandomMACSwitchCellIdentifier"];
    if (!v11) {
      id v11 = (void *)[objc_alloc(MEMORY[0x263F82C80]) initWithStyle:1 reuseIdentifier:@"kWFValueListCellRandomMACSwitchCellIdentifier"];
    }
    id v12 = [(WFValueListViewController *)self switchTitle];
    id v13 = [v11 textLabel];
    [v13 setText:v12];

    [v11 setAccessoryView:self->_configSwitch];
    [v11 setSelectionStyle:0];
  }
  else if ([v7 section] == v9)
  {
    id v11 = [(WFValueListViewController *)self cellForTitleAtIndexPath:v7];
  }
  else if ([v7 section] == v10)
  {
    id v11 = [v6 dequeueReusableCellWithIdentifier:@"kWFValueListCellPrivateAddressCellIdentifier"];
    if (!v11)
    {
      id v11 = (void *)[objc_alloc(MEMORY[0x263F82C80]) initWithStyle:1 reuseIdentifier:@"kWFValueListCellPrivateAddressCellIdentifier"];
      [v11 setSelectionStyle:0];
      v14 = [MEMORY[0x263F825C8] altTextColor];
      v15 = [v11 detailTextLabel];
      [v15 setTextColor:v14];

      [v11 setAccessoryType:1];
    }
    v16 = [(WFValueListViewController *)self->_sublist navigationItem];
    v17 = [v16 title];
    id v18 = [v11 textLabel];
    [v18 setText:v17];

    uint64_t v19 = [(WFValueListViewController *)self->_sublist selectedTitle];
    v20 = [v11 detailTextLabel];
    [v20 setText:v19];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)cellForTitleAtIndexPath:(id)a3
{
  v4 = (objc_class *)MEMORY[0x263F82C80];
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initWithStyle:1 reuseIdentifier:0];
  id v7 = [(WFValueListViewController *)self titles];
  uint64_t v8 = [v5 row];

  uint64_t v9 = [v7 objectAtIndex:v8];

  uint64_t v10 = [v6 textLabel];
  [v10 setText:v9];

  id v11 = [(WFValueListViewController *)self selectedTitle];
  if ([v9 isEqualToString:v11]) {
    uint64_t v12 = 3;
  }
  else {
    uint64_t v12 = 0;
  }
  [v6 setAccessoryType:v12];

  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v21 = a4;
  [a3 deselectRowAtIndexPath:v21 animated:1];
  id v6 = [(WFValueListViewController *)self sections];
  id v7 = objc_msgSend(v6, "objectAtIndex:", objc_msgSend(v21, "section"));
  uint64_t v8 = [v7 integerValue];

  if (v8 == 1)
  {
    if (!self->_sublist) {
      goto LABEL_8;
    }
    uint64_t v10 = [(WFValueListViewController *)self navigationController];
    [v10 pushViewController:self->_sublist animated:1];
  }
  else
  {
    if (v8 != 2) {
      goto LABEL_8;
    }
    uint64_t v9 = [(WFValueListViewController *)self titles];
    uint64_t v10 = objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v21, "row"));

    id v11 = [(WFValueListViewController *)self selectedTitle];
    char v12 = [v10 isEqualToString:v11];

    if ((v12 & 1) == 0)
    {
      [(WFValueListViewController *)self setSelectedTitle:v10];
      id v13 = [(WFValueListViewController *)self tableView];
      v14 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndex:", objc_msgSend(v21, "section"));
      [v13 reloadSections:v14 withRowAnimation:5];

      v15 = [(WFValueListViewController *)self tableView];
      v16 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndex:", objc_msgSend(v21, "section"));
      [v15 _reloadSectionHeaderFooters:v16 withRowAnimation:5];
    }
  }

LABEL_8:
  v17 = [(WFValueListViewController *)self completionHandler];

  if (v17)
  {
    id v18 = [(WFValueListViewController *)self completionHandler];
    uint64_t v19 = [(WFValueListViewController *)self selectedTitle];
    v20 = [(WFValueListViewController *)self configSwitch];
    ((void (**)(void, void *, uint64_t))v18)[2](v18, v19, [v20 isOn]);
  }
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  id v5 = [(WFValueListViewController *)self footerHandler];

  if (v5)
  {
    id v6 = [(WFValueListViewController *)self footerHandler];
    id v7 = [(WFValueListViewController *)self selectedTitle];
    uint64_t v8 = ((void (**)(void, void *))v6)[2](v6, v7);
  }
  else
  {
    uint64_t v8 = 0;
  }
  return v8;
}

- (NSString)selectedTitle
{
  return self->_selectedTitle;
}

- (void)setSelectedTitle:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)footerHandler
{
  return self->_footerHandler;
}

- (void)setFooterHandler:(id)a3
{
}

- (BOOL)switchOn
{
  return self->_switchOn;
}

- (void)setSwitchOn:(BOOL)a3
{
  self->_switchOn = a3;
}

- (NSArray)titles
{
  return self->_titles;
}

- (void)setTitles:(id)a3
{
}

- (BOOL)hasSwitch
{
  return self->_hasSwitch;
}

- (void)setHasSwitch:(BOOL)a3
{
  self->_hasSwitch = a3;
}

- (UISwitch)configSwitch
{
  return self->_configSwitch;
}

- (void)setConfigSwitch:(id)a3
{
}

- (NSMutableArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
}

- (NSString)switchTitle
{
  return self->_switchTitle;
}

- (void)setSwitchTitle:(id)a3
{
}

- (WFValueListViewController)sublist
{
  return self->_sublist;
}

- (void)setSublist:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sublist, 0);
  objc_storeStrong((id *)&self->_switchTitle, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_configSwitch, 0);
  objc_storeStrong((id *)&self->_titles, 0);
  objc_storeStrong(&self->_footerHandler, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_selectedTitle, 0);
}

@end