@interface WLDetailViewController
- (WLDetailViewController)initWithContext:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)dismiss;
- (void)setCustomNavigationTitleView;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation WLDetailViewController

- (WLDetailViewController)initWithContext:(id)a3
{
  v38[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)WLDetailViewController;
  v5 = [(WLDetailViewController *)&v37 init];
  if (v5)
  {
    uint64_t v36 = 0;
    uint64_t v6 = +[WLDetailItem items:v4 size:&v36];
    data = v5->_data;
    v5->_data = (NSArray *)v6;

    id v35 = v4;
    if ([(NSArray *)v5->_data count])
    {
      v8 = [(NSArray *)v5->_data objectAtIndexedSubscript:0];
      v5->_isNothingImported = [v8 count] == 0;
    }
    else
    {
      v5->_isNothingImported = 0;
    }
    id v34 = objc_alloc_init(MEMORY[0x263F086F0]);
    uint64_t v9 = [v34 stringFromByteCount:v36];
    size = v5->_size;
    v5->_size = (NSString *)v9;

    id v11 = objc_alloc(MEMORY[0x263F82C78]);
    v12 = objc_msgSend(v11, "initWithFrame:style:", 2, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    [v12 registerClass:objc_opt_class() forCellReuseIdentifier:@"WLDetailViewCell"];
    v13 = [MEMORY[0x263F825C8] systemBackgroundColor];
    [v12 setBackgroundColor:v13];

    [v12 setDataSource:v5];
    [v12 setDelegate:v5];
    [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
    v14 = [(WLDetailViewController *)v5 view];
    [v14 addSubview:v12];

    v26 = (void *)MEMORY[0x263F08938];
    v32 = [v12 topAnchor];
    v33 = [(WLDetailViewController *)v5 view];
    v31 = [v33 topAnchor];
    v30 = [v32 constraintEqualToAnchor:v31];
    v38[0] = v30;
    v28 = [v12 leftAnchor];
    v29 = [(WLDetailViewController *)v5 view];
    v27 = [v29 leftAnchor];
    v25 = [v28 constraintEqualToAnchor:v27];
    v38[1] = v25;
    v24 = [v12 rightAnchor];
    v15 = [(WLDetailViewController *)v5 view];
    v16 = [v15 rightAnchor];
    v17 = [v24 constraintEqualToAnchor:v16];
    v38[2] = v17;
    v18 = [v12 bottomAnchor];
    v19 = [(WLDetailViewController *)v5 view];
    v20 = [v19 bottomAnchor];
    v21 = [v18 constraintEqualToAnchor:v20];
    v38[3] = v21;
    v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:4];
    [v26 activateConstraints:v22];

    id v4 = v35;
  }

  return v5;
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)WLDetailViewController;
  [(WLDetailViewController *)&v6 viewDidLoad];
  v3 = WLLocalizedString();
  [(WLDetailViewController *)self setTitle:v3];

  id v4 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:0 target:self action:sel_dismiss];
  v5 = [(WLDetailViewController *)self navigationItem];
  [v5 setRightBarButtonItem:v4];

  [(WLDetailViewController *)self setCustomNavigationTitleView];
}

- (void)setCustomNavigationTitleView
{
  v46[4] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263F82E00]);
  id v4 = [MEMORY[0x263F825C8] clearColor];
  [v3 setBackgroundColor:v4];

  id v5 = objc_alloc_init(MEMORY[0x263F828E0]);
  objc_super v6 = [MEMORY[0x263F825C8] clearColor];
  [v5 setBackgroundColor:v6];

  v7 = [MEMORY[0x263F82760] boldSystemFontOfSize:16.0];
  [v5 setFont:v7];

  [v5 setTextAlignment:1];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  v8 = [MEMORY[0x263F825C8] labelColor];
  [v5 setTextColor:v8];

  v43 = self;
  uint64_t v9 = [(WLDetailViewController *)self title];
  [v5 setText:v9];

  [v3 addSubview:v5];
  id v10 = objc_alloc_init(MEMORY[0x263F828E0]);
  id v11 = [MEMORY[0x263F825C8] clearColor];
  [v10 setBackgroundColor:v11];

  [v10 setTextAlignment:1];
  v12 = [MEMORY[0x263F82760] systemFontOfSize:13.0];
  [v10 setFont:v12];

  v13 = [MEMORY[0x263F825C8] secondaryLabelColor];
  [v10 setTextColor:v13];

  [v10 setText:self->_size];
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v3 addSubview:v10];
  v31 = (void *)MEMORY[0x263F08938];
  v41 = [v5 topAnchor];
  v39 = [v3 topAnchor];
  objc_super v37 = [v41 constraintEqualToAnchor:v39];
  v46[0] = v37;
  id v35 = [v5 leftAnchor];
  v44 = v3;
  v33 = [v3 leftAnchor];
  v14 = [v35 constraintEqualToAnchor:v33];
  v46[1] = v14;
  v15 = [v5 rightAnchor];
  v16 = [v3 rightAnchor];
  v17 = [v15 constraintEqualToAnchor:v16];
  v46[2] = v17;
  v18 = [v5 bottomAnchor];
  v19 = [v10 topAnchor];
  v20 = [v18 constraintEqualToAnchor:v19];
  v46[3] = v20;
  v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v46 count:4];
  [v31 activateConstraints:v21];

  v32 = (void *)MEMORY[0x263F08938];
  v42 = [v10 topAnchor];
  v40 = [v5 bottomAnchor];
  v38 = [v42 constraintEqualToAnchor:v40];
  v45[0] = v38;
  uint64_t v36 = [v10 leftAnchor];
  id v34 = [v44 leftAnchor];
  v22 = [v36 constraintEqualToAnchor:v34];
  v45[1] = v22;
  v23 = [v10 rightAnchor];
  v24 = [v44 rightAnchor];
  v25 = [v23 constraintEqualToAnchor:v24];
  v45[2] = v25;
  v26 = [v10 bottomAnchor];
  v27 = [v44 bottomAnchor];
  v28 = [v26 constraintEqualToAnchor:v27];
  v45[3] = v28;
  v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:v45 count:4];
  [v32 activateConstraints:v29];

  v30 = [(WLDetailViewController *)v43 navigationItem];
  [v30 setTitleView:v44];
}

- (void)dismiss
{
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  BOOL isNothingImported = self->_isNothingImported;
  return [(NSArray *)self->_data count] - isNothingImported;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v4 = [(NSArray *)self->_data objectAtIndex:self->_isNothingImported + a4];
  int64_t v5 = [v4 count];

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v7 = [a3 dequeueReusableCellWithIdentifier:@"WLDetailViewCell" forIndexPath:v6];
  v8 = [MEMORY[0x263F825C8] secondarySystemBackgroundColor];
  [v7 setBackgroundColor:v8];

  uint64_t v9 = -[NSArray objectAtIndex:](self->_data, "objectAtIndex:", [v6 section] + self->_isNothingImported);
  id v10 = objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v6, "row"));

  id v11 = [MEMORY[0x263F82918] valueCellConfiguration];
  v12 = [v10 symbolTintColor];

  if (v12)
  {
    v13 = [v10 symbolTintColor];
    v14 = [v11 imageProperties];
    [v14 setTintColor:v13];
  }
  v15 = (void *)MEMORY[0x263F827E8];
  v16 = [v10 symbol];
  v17 = [v15 systemImageNamed:v16];
  [v11 setImage:v17];

  v18 = [v10 text];
  [v11 setText:v18];

  v19 = [v10 secondaryText];
  [v11 setSecondaryText:v19];

  [v7 setContentConfiguration:v11];
  return v7;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  if ((unint64_t)self->_isNothingImported + a4 > 1)
  {
    v7 = 0;
  }
  else
  {
    v7 = WLLocalizedString();
  }

  return v7;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  int64_t v7 = self->_isNothingImported + a4;
  if (!v7)
  {
    v8 = @"DETAIL_SUCCESS_SECTION_FOOTER_TITLE";
    goto LABEL_5;
  }
  if (v7 == 1)
  {
    v8 = @"DETAIL_IMPORT_ERROR_SECTION_FOOTER_TITLE";
LABEL_5:
    uint64_t v9 = [MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:v8];
    id v10 = WLLocalizedString();

    goto LABEL_7;
  }
  id v10 = 0;
LABEL_7:

  return v10;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_size, 0);
}

@end