@interface WFAutomationNotificationListContentView
- (CGSize)preferredSize;
- (NSArray)triggerDisplayInfo;
- (UITableView)tableView;
- (WFAutomationNotificationListContentView)initWithFrame:(CGRect)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)setTriggerDisplayInfo:(id)a3;
- (void)updateUIFromNotificationUserInfo:(id)a3;
@end

@implementation WFAutomationNotificationListContentView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggerDisplayInfo, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
}

- (void)setTriggerDisplayInfo:(id)a3
{
}

- (NSArray)triggerDisplayInfo
{
  return self->_triggerDisplayInfo;
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (CGSize)preferredSize
{
  v3 = [(WFAutomationNotificationListContentView *)self tableView];
  [v3 layoutIfNeeded];

  v4 = [(WFAutomationNotificationListContentView *)self tableView];
  [v4 contentSize];
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  v4 = [(WFAutomationNotificationListContentView *)self triggerDisplayInfo];
  int64_t v5 = [v4 count];

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  double v6 = (objc_class *)objc_opt_class();
  double v7 = NSStringFromClass(v6);
  double v8 = [(WFAutomationNotificationListContentView *)self triggerDisplayInfo];
  double v9 = objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v5, "row"));

  double v10 = [(WFAutomationNotificationListContentView *)self tableView];
  v11 = [v10 dequeueReusableCellWithIdentifier:v7 forIndexPath:v5];

  [v11 setAccessoryType:0];
  v12 = [v9 localizedTitle];
  v13 = [v9 localizedDescription];
  v14 = objc_msgSend((id)objc_msgSend(v9, "triggerClass"), "displayGlyph");
  v15 = objc_msgSend((id)objc_msgSend(v9, "triggerClass"), "displayGlyphTintColor");
  objc_msgSend((id)objc_msgSend(v9, "triggerClass"), "displayGlyphCornerRadius");
  double v17 = v16;
  v18 = [v9 actionIcons];
  [v11 setTitle:v12 description:v13 triggerIcon:v14 triggerTintColor:v15 triggerCornerRadius:v18 actionIcons:v17];

  return v11;
}

- (void)updateUIFromNotificationUserInfo:(id)a3
{
  WFTriggerDisplayInfoToDisableFromNotificationUserInfo();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(WFAutomationNotificationListContentView *)self setTriggerDisplayInfo:v5];
  v4 = [(WFAutomationNotificationListContentView *)self tableView];
  [v4 reloadData];
}

- (WFAutomationNotificationListContentView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v29.receiver = self;
  v29.super_class = (Class)WFAutomationNotificationListContentView;
  double v7 = -[WFAutomationNotificationListContentView initWithFrame:](&v29, sel_initWithFrame_);
  if (v7)
  {
    double v8 = (UITableView *)objc_msgSend(objc_alloc(MEMORY[0x263F82C78]), "initWithFrame:style:", 0, x, y, width, height);
    tableView = v7->_tableView;
    v7->_tableView = v8;
    double v10 = v8;

    v11 = [MEMORY[0x263F825C8] systemGroupedBackgroundColor];
    v12 = [(WFAutomationNotificationListContentView *)v7 tableView];
    [v12 setBackgroundColor:v11];

    double v13 = *MEMORY[0x263F839B8];
    v14 = [(WFAutomationNotificationListContentView *)v7 tableView];
    [v14 setRowHeight:v13];

    v15 = [(WFAutomationNotificationListContentView *)v7 tableView];
    [v15 setEstimatedRowHeight:110.0];

    double v16 = [(WFAutomationNotificationListContentView *)v7 tableView];
    objc_msgSend(v16, "setSeparatorInset:", 0.0, 124.0, 0.0, 0.0);

    double v17 = [(WFAutomationNotificationListContentView *)v7 tableView];
    [v17 setAutoresizingMask:18];

    v18 = [(WFAutomationNotificationListContentView *)v7 tableView];
    [v18 setDelegate:v7];

    v19 = [(WFAutomationNotificationListContentView *)v7 tableView];
    [v19 setDataSource:v7];

    v20 = [(WFAutomationNotificationListContentView *)v7 tableView];
    [(WFAutomationNotificationListContentView *)v7 addSubview:v20];

    v21 = [(WFAutomationNotificationListContentView *)v7 tableView];
    id v22 = (id)objc_msgSend(v21, "wf_addConstraintsToFillSuperview:", v7);

    v23 = [(WFAutomationNotificationListContentView *)v7 tableView];
    uint64_t v24 = objc_opt_class();
    v25 = (objc_class *)objc_opt_class();

    v26 = NSStringFromClass(v25);
    [v23 registerClass:v24 forCellReuseIdentifier:v26];

    v27 = v7;
  }

  return v7;
}

@end