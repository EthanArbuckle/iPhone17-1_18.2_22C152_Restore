@interface UITriggerTableViewController
- (BOOL)loading;
- (BOOL)requestPluginList;
- (BOOL)triggerUIProvider:(id)a3;
- (IDSService)idsService;
- (NSMutableArray)sectionList;
- (NSMutableDictionary)sectionContents;
- (id)sectionStringForIndexPath:(id)a3;
- (id)sendProtobufRequest:(id)a3 type:(unsigned __int16)a4 priority:(int64_t)a5 expectsResponse:(BOOL)a6 errorHandler:(id)a7 withTimeout:(double)a8;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tailStringForIndexPath:(id)a3;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_extractSections:(id)a3;
- (void)dealloc;
- (void)didReceiveMemoryWarning;
- (void)idsRequestUITriggerResponse:(id)a3;
- (void)idsUIProvidersResponse:(id)a3;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)setIdsService:(id)a3;
- (void)setLoading:(BOOL)a3;
- (void)setSectionContents:(id)a3;
- (void)setSectionList:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation UITriggerTableViewController

- (void)viewDidLoad
{
  v12.receiver = self;
  v12.super_class = (Class)UITriggerTableViewController;
  [(UITriggerTableViewController *)&v12 viewDidLoad];
  v3 = (IDSService *)[objc_alloc(MEMORY[0x263F4A0C0]) initWithService:@"com.apple.private.alloy.carousel.uitrigger"];
  idsService = self->_idsService;
  self->_idsService = v3;

  [(IDSService *)self->_idsService setProtobufAction:sel_idsUIProvidersResponse_ forIncomingResponsesOfType:1];
  [(IDSService *)self->_idsService setProtobufAction:sel_idsRequestUITriggerResponse_ forIncomingResponsesOfType:2];
  [(IDSService *)self->_idsService addDelegate:self queue:MEMORY[0x263EF83A0]];
  id v5 = objc_alloc(MEMORY[0x263F1CA40]);
  v6 = objc_msgSend(v5, "initWithFrame:style:", 0, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [(UITriggerTableViewController *)self setTableView:v6];

  v7 = [(UITriggerTableViewController *)self tableView];
  [v7 setDelegate:self];

  v8 = [(UITriggerTableViewController *)self tableView];
  [v8 setDataSource:self];

  v9 = [(UITriggerTableViewController *)self tableView];
  [(UITriggerTableViewController *)self setView:v9];

  [(UITriggerTableViewController *)self setLoading:1];
  id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
  [(UITriggerTableViewController *)self setSectionList:v10];

  id v11 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [(UITriggerTableViewController *)self setSectionContents:v11];

  [(UITriggerTableViewController *)self requestPluginList];
}

- (void)dealloc
{
  v3 = [(UITriggerTableViewController *)self tableView];
  v4 = [v3 delegate];

  if (v4 == self)
  {
    id v5 = [(UITriggerTableViewController *)self tableView];
    [v5 setDelegate:0];
  }
  v6 = [(UITriggerTableViewController *)self tableView];
  v7 = [v6 dataSource];

  if (v7 == self)
  {
    v8 = [(UITriggerTableViewController *)self tableView];
    [v8 setDataSource:0];
  }
  v9.receiver = self;
  v9.super_class = (Class)UITriggerTableViewController;
  [(UITriggerTableViewController *)&v9 dealloc];
}

- (void)didReceiveMemoryWarning
{
  v2.receiver = self;
  v2.super_class = (Class)UITriggerTableViewController;
  [(UITriggerTableViewController *)&v2 didReceiveMemoryWarning];
}

- (void)viewWillLayoutSubviews
{
  v3 = [MEMORY[0x263F1C920] mainScreen];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  objc_super v12 = [MEMORY[0x263F1C408] sharedApplication];
  [v12 statusBarFrame];
  float v14 = v13;

  id v15 = [(UITriggerTableViewController *)self tableView];
  objc_msgSend(v15, "setFrame:", v5, v7 + v14, v9, v11 - v14);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if ([(UITriggerTableViewController *)self loading]) {
    return 1;
  }
  double v5 = [(UITriggerTableViewController *)self sectionList];
  int64_t v6 = [v5 count];

  return v6;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if ([(UITriggerTableViewController *)self loading]) {
    return 1;
  }
  double v7 = [(UITriggerTableViewController *)self sectionList];
  double v8 = [v7 objectAtIndexedSubscript:a4];

  double v9 = [(UITriggerTableViewController *)self sectionContents];
  double v10 = [v9 objectForKeyedSubscript:v8];
  int64_t v11 = [v10 count];

  return v11;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  double v7 = [a3 dequeueReusableCellWithIdentifier:@"MyReuseIdentifier"];
  if (!v7) {
    double v7 = (void *)[objc_alloc(MEMORY[0x263F1CA48]) initWithStyle:0 reuseIdentifier:@"MyReuseIdentifier"];
  }
  if ([(UITriggerTableViewController *)self loading])
  {
    double v8 = [v7 textLabel];
    [v8 setText:@"Loading..."];
  }
  else
  {
    double v9 = [(UITriggerTableViewController *)self sectionList];
    double v8 = objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v6, "section"));

    double v10 = [(UITriggerTableViewController *)self sectionContents];
    int64_t v11 = [v10 objectForKeyedSubscript:v8];
    objc_super v12 = objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
    double v13 = [v7 textLabel];
    [v13 setText:v12];
  }
  return v7;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if ([(UITriggerTableViewController *)self loading])
  {
    id v6 = 0;
  }
  else
  {
    double v7 = [(UITriggerTableViewController *)self sectionList];
    id v6 = [v7 objectAtIndexedSubscript:a4];
  }
  return v6;
}

- (id)sectionStringForIndexPath:(id)a3
{
  id v4 = a3;
  if ([(UITriggerTableViewController *)self loading])
  {
    double v5 = 0;
  }
  else
  {
    uint64_t v6 = [v4 section];
    double v7 = [(UITriggerTableViewController *)self sectionList];
    double v5 = [v7 objectAtIndexedSubscript:v6];
  }
  return v5;
}

- (id)tailStringForIndexPath:(id)a3
{
  id v4 = a3;
  if ([(UITriggerTableViewController *)self loading])
  {
    double v5 = 0;
  }
  else
  {
    uint64_t v6 = [(UITriggerTableViewController *)self sectionStringForIndexPath:v4];
    double v7 = [(UITriggerTableViewController *)self sectionContents];
    double v8 = [v7 objectForKeyedSubscript:v6];
    double v5 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v4, "row"));
  }
  return v5;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7 && ![(UITriggerTableViewController *)self loading])
  {
    double v8 = [(UITriggerTableViewController *)self sectionStringForIndexPath:v7];
    double v9 = [(UITriggerTableViewController *)self tailStringForIndexPath:v7];
    double v10 = [NSString stringWithFormat:@"%@.%@", v8, v9];
    NSLog(&cfstr_TriggeringUiPr.isa, v10);
    [(UITriggerTableViewController *)self triggerUIProvider:v10];
    dispatch_time_t v11 = dispatch_time(0, 500000000);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __66__UITriggerTableViewController_tableView_didSelectRowAtIndexPath___block_invoke;
    block[3] = &unk_2649143B0;
    id v13 = v6;
    id v14 = v7;
    dispatch_after(v11, MEMORY[0x263EF83A0], block);
  }
}

uint64_t __66__UITriggerTableViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) deselectRowAtIndexPath:*(void *)(a1 + 40) animated:1];
}

- (void)_extractSections:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v25 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (!v5)
  {
    id v7 = 0;
    double v8 = @"XXX";
    v23 = v4;
    goto LABEL_21;
  }
  uint64_t v6 = v5;
  id v7 = 0;
  double v8 = @"XXX";
  uint64_t v9 = *(void *)v29;
  id v24 = v4;
  do
  {
    uint64_t v10 = 0;
    uint64_t v26 = v6;
    do
    {
      if (*(void *)v29 != v9) {
        objc_enumerationMutation(v4);
      }
      dispatch_time_t v11 = *(void **)(*((void *)&v28 + 1) + 8 * v10);
      if (([v11 hasPrefix:v8] & 1) == 0)
      {
        if (v7)
        {
          objc_super v12 = [(UITriggerTableViewController *)self sectionContents];
          [v12 setObject:v7 forKey:v8];
        }
        id v13 = [v11 componentsSeparatedByString:@"."];
        if ((unint64_t)[v13 count] < 4)
        {
          NSLog(&cfstr_UiTriggerHasTo.isa, v11);
          id v7 = 0;
        }
        else
        {
          id v14 = NSString;
          [v13 objectAtIndexedSubscript:0];
          uint64_t v15 = v9;
          v17 = v16 = v8;
          v18 = [v13 objectAtIndexedSubscript:1];
          v19 = [v13 objectAtIndexedSubscript:2];
          uint64_t v20 = [v14 stringWithFormat:@"%@.%@.%@", v17, v18, v19];

          uint64_t v9 = v15;
          id v4 = v24;

          [v25 addObject:v20];
          id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
          double v8 = (__CFString *)v20;
          uint64_t v6 = v26;
        }
      }
      if (v7)
      {
        unint64_t v21 = [(__CFString *)v8 length] + 1;
        if (v21 < [v11 length])
        {
          v22 = [v11 substringFromIndex:v21];
          [v7 addObject:v22];
        }
      }
      ++v10;
    }
    while (v6 != v10);
    uint64_t v6 = [v4 countByEnumeratingWithState:&v28 objects:v32 count:16];
  }
  while (v6);

  if (v7)
  {
    v23 = [(UITriggerTableViewController *)self sectionContents];
    [v23 setObject:v7 forKey:v8];
LABEL_21:
  }
  [(UITriggerTableViewController *)self setSectionList:v25];
}

- (void)idsUIProvidersResponse:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [CSLUIPBUIPluginListResponse alloc];
  uint64_t v6 = [v4 data];

  dispatch_time_t v11 = [(CSLUIPBUIPluginListResponse *)v5 initWithData:v6];
  id v7 = [(CSLUIPBUIPluginListResponse *)v11 names];
  NSLog(&cfstr_Providers.isa, v7);

  double v8 = [(CSLUIPBUIPluginListResponse *)v11 names];
  uint64_t v9 = [v8 sortedArrayUsingComparator:&__block_literal_global];

  [(UITriggerTableViewController *)self _extractSections:v9];
  [(UITriggerTableViewController *)self setLoading:0];
  uint64_t v10 = [(UITriggerTableViewController *)self tableView];
  [v10 reloadData];
}

uint64_t __55__UITriggerTableViewController_idsUIProvidersResponse___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 compare:a3 options:2];
}

- (void)idsRequestUITriggerResponse:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [CSLUIPBUIPluginTriggerResponse alloc];
  uint64_t v6 = [v4 data];

  id v13 = [(CSLUIPBUIPluginTriggerResponse *)v5 initWithData:v6];
  if (![(CSLUIPBUIPluginTriggerResponse *)v13 success])
  {
    id v7 = (void *)MEMORY[0x263F1C3F8];
    double v8 = NSString;
    uint64_t v9 = [(CSLUIPBUIPluginTriggerResponse *)v13 errorString];
    uint64_t v10 = [v8 stringWithFormat:@"Failed to trigger UI provider because %@", v9];
    dispatch_time_t v11 = [v7 alertControllerWithTitle:@"UITrigger Failure" message:v10 preferredStyle:1];

    objc_super v12 = [MEMORY[0x263F1C3F0] actionWithTitle:@"OK" style:1 handler:0];
    [v11 addAction:v12];

    [(UITriggerTableViewController *)self presentViewController:v11 animated:1 completion:0];
  }
}

- (id)sendProtobufRequest:(id)a3 type:(unsigned __int16)a4 priority:(int64_t)a5 expectsResponse:(BOOL)a6 errorHandler:(id)a7 withTimeout:(double)a8
{
  BOOL v9 = a6;
  uint64_t v11 = a4;
  v37[2] = *MEMORY[0x263EF8340];
  id v33 = a7;
  v36[0] = *MEMORY[0x263F49EE8];
  id v14 = NSNumber;
  id v15 = a3;
  v16 = [v14 numberWithBool:v9];
  v37[0] = v16;
  v36[1] = *MEMORY[0x263F49F80];
  v17 = [NSNumber numberWithDouble:a8];
  v37[1] = v17;
  v18 = [NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:2];

  v19 = [(IDSService *)self->_idsService accounts];
  uint64_t v20 = [v19 anyObject];

  unint64_t v21 = [MEMORY[0x263EFFA08] setWithObject:*MEMORY[0x263F49E30]];
  id v22 = objc_alloc(MEMORY[0x263F4A098]);
  v23 = [v15 data];

  id v24 = (void *)[v22 initWithProtobufData:v23 type:v11 isResponse:0];
  idsService = self->_idsService;
  id v34 = 0;
  id v35 = 0;
  LODWORD(v22) = [(IDSService *)idsService sendProtobuf:v24 fromAccount:v20 toDestinations:v21 priority:a5 options:v18 identifier:&v35 error:&v34];
  id v26 = v35;
  id v27 = v34;
  long long v28 = [v24 data];
  uint64_t v29 = [v28 length];
  if (v22)
  {
    NSLog(&cfstr_IdsRequestSent.isa, v29, v26);

    long long v30 = v33;
  }
  else
  {
    NSLog(&cfstr_IdsRequestFail.isa, v29, v26);

    long long v30 = v33;
    if (v33 && v27) {
      (*((void (**)(id, id))v33 + 2))(v33, v27);
    }
  }
  id v31 = v26;

  return v31;
}

- (BOOL)requestPluginList
{
  id v3 = objc_alloc_init(CSLUIPBUIPluginListRequest);
  id v4 = [(UITriggerTableViewController *)self sendProtobufRequest:v3 type:1 priority:300 expectsResponse:1 errorHandler:&__block_literal_global_74 withTimeout:30.0];

  return v4 != 0;
}

void __49__UITriggerTableViewController_requestPluginList__block_invoke(uint64_t a1, uint64_t a2)
{
}

- (BOOL)triggerUIProvider:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_alloc_init(CSLUIPBUIPluginTriggerRequest);
  [(CSLUIPBUIPluginTriggerRequest *)v5 setName:v4];

  uint64_t v6 = [(UITriggerTableViewController *)self sendProtobufRequest:v5 type:2 priority:300 expectsResponse:1 errorHandler:&__block_literal_global_80 withTimeout:30.0];

  return v6 != 0;
}

void __50__UITriggerTableViewController_triggerUIProvider___block_invoke(uint64_t a1, uint64_t a2)
{
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  if (a7) {
    NSLog(&cfstr_IdsDidsendwith.isa, a2, a3, a4, a5, a6, a5, a7);
  }
  else {
    NSLog(&cfstr_IdsDidsendwith_0.isa, a2, a3, a4, a5, a6, a5);
  }
}

- (IDSService)idsService
{
  return self->_idsService;
}

- (void)setIdsService:(id)a3
{
}

- (BOOL)loading
{
  return self->_loading;
}

- (void)setLoading:(BOOL)a3
{
  self->_loading = a3;
}

- (NSMutableArray)sectionList
{
  return self->_sectionList;
}

- (void)setSectionList:(id)a3
{
}

- (NSMutableDictionary)sectionContents
{
  return self->_sectionContents;
}

- (void)setSectionContents:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionContents, 0);
  objc_storeStrong((id *)&self->_sectionList, 0);
  objc_storeStrong((id *)&self->_idsService, 0);
}

@end