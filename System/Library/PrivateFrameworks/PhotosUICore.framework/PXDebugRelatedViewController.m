@interface PXDebugRelatedViewController
- (PXDebugRelatedViewController)initWithDictionary:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_closeAction:(id)a3;
- (void)_initDataSourceWithKeywords:(id)a3;
- (void)_sendByEmailAction:(id)a3;
- (void)_setupWithDictionary:(id)a3;
- (void)_switchLogsAction:(id)a3;
- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5;
- (void)viewDidLoad;
@end

@implementation PXDebugRelatedViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countedKeywords, 0);
  objc_storeStrong((id *)&self->_currentKeywords, 0);
  objc_storeStrong((id *)&self->_relatedKeywords, 0);
  objc_storeStrong((id *)&self->_referenceKeywords, 0);
  objc_storeStrong((id *)&self->_matchingKeywords, 0);
  objc_storeStrong((id *)&self->_matchingWeight, 0);
  objc_storeStrong((id *)&self->_debugDescription, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_segmentedControl, 0);
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  v5 = [(NSMutableDictionary *)self->_currentKeywords allKeys];
  v6 = [v5 objectAtIndex:a4];

  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v7 = [a3 dequeueReusableCellWithIdentifier:@"KeywordsCell"];
  if (!v7) {
    v7 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:3 reuseIdentifier:@"KeywordsCell"];
  }
  v8 = [(NSMutableDictionary *)self->_currentKeywords allKeys];
  v9 = objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v6, "section"));

  v10 = [v7 textLabel];
  v11 = [(NSMutableDictionary *)self->_currentKeywords objectForKeyedSubscript:v9];
  uint64_t v12 = [v6 row];

  v13 = [v11 objectAtIndexedSubscript:v12];
  [v10 setText:v13];

  countedKeywords = self->_countedKeywords;
  v15 = [v7 textLabel];
  v16 = [v15 text];
  unint64_t v17 = [(NSCountedSet *)countedKeywords countForObject:v16];

  v18 = [v7 detailTextLabel];
  v19 = v18;
  if (v17 < 2)
  {
    [v18 setText:&stru_1F00B0030];
  }
  else
  {
    v20 = objc_msgSend(NSString, "stringWithFormat:", @"x%ld", v17);
    [v19 setText:v20];

    v19 = [v7 detailTextLabel];
    [v19 setTextAlignment:2];
  }

  v21 = [v7 textLabel];
  v22 = [MEMORY[0x1E4FB08E0] systemFontOfSize:13.0];
  [v21 setFont:v22];

  v23 = [v7 textLabel];
  [v23 setNumberOfLines:0];

  v24 = [v7 textLabel];
  [v24 sizeToFit];

  return v7;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = [(NSMutableDictionary *)self->_currentKeywords allKeys];
  v7 = [v6 objectAtIndex:a4];

  v8 = [(NSMutableDictionary *)self->_currentKeywords objectForKeyedSubscript:v7];
  int64_t v9 = [v8 count];

  return v9;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_currentKeywords allKeys];
  int64_t v4 = [v3 count];

  return v4;
}

- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5
{
}

- (void)_closeAction:(id)a3
{
}

- (void)_sendByEmailAction:(id)a3
{
  if ([getMFMailComposeViewControllerClass_43071() canSendMail])
  {
    int64_t v4 = [(PXDebugRelatedViewController *)self title];
    v5 = [@"PhotosGraph " stringByAppendingString:v4];

    id v6 = [MEMORY[0x1E4F1C978] arrayWithObject:@"photos-memories-feedback@group.apple.com"];
    id v7 = objc_alloc_init((Class)getMFMailComposeViewControllerClass_43071());
    [v7 setMailComposeDelegate:self];
    [v7 setSubject:v5];
    [v7 setToRecipients:v6];
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    int64_t v9 = [NSNumber numberWithDouble:self->_relatedScore];
    [v8 setObject:v9 forKeyedSubscript:@"relatedScore"];

    v10 = [NSNumber numberWithDouble:self->_matchingScore];
    [v8 setObject:v10 forKeyedSubscript:@"matchingScore"];

    v11 = [NSNumber numberWithDouble:self->_curationScore];
    [v8 setObject:v11 forKeyedSubscript:@"curationScore"];

    uint64_t v12 = [NSNumber numberWithDouble:self->_graphScore];
    [v8 setObject:v12 forKeyedSubscript:@"graphScore"];

    v13 = [NSNumber numberWithDouble:self->_neighborScore];
    [v8 setObject:v13 forKeyedSubscript:@"neighborScore"];

    v14 = [NSNumber numberWithUnsignedInteger:self->_relatedType];
    [v8 setObject:v14 forKeyedSubscript:@"relatedType"];

    [v8 setObject:self->_debugDescription forKeyedSubscript:@"debugDescription"];
    [v8 setObject:self->_matchingWeight forKeyedSubscript:@"matchingWeight"];
    [v8 setObject:self->_matchingKeywords forKeyedSubscript:@"matchingKeywords"];
    [v8 setObject:self->_referenceKeywords forKeyedSubscript:@"referenceKeywords"];
    [v8 setObject:self->_relatedKeywords forKeyedSubscript:@"relatedKeywords"];
    id v21 = 0;
    v15 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v8 format:200 options:0 error:&v21];
    id v16 = v21;
    if (v15) {
      [v7 addAttachmentData:v15 mimeType:@"application/x-plist" fileName:@"results.plist"];
    }
    if (v16)
    {
      unint64_t v17 = NSString;
      v18 = [v16 localizedDescription];
      v19 = [v17 stringWithFormat:@"Cannot attach results.plist: %@.", v18];

      NSLog(&cfstr_Error_1.isa, v19);
    }
    else
    {
      v19 = &stru_1F00B0030;
    }
    [v7 setMessageBody:v19 isHTML:0];
    [(PXDebugRelatedViewController *)self presentViewController:v7 animated:1 completion:0];
  }
  else
  {
    v5 = PLUIGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_ERROR, "ERROR: Looks like email is not setup on this system.", buf, 2u);
    }
  }
}

- (void)_switchLogsAction:(id)a3
{
  unint64_t v4 = [(UISegmentedControl *)self->_segmentedControl selectedSegmentIndex];
  if (v4 > 2) {
    id v5 = 0;
  }
  else {
    id v5 = *(id *)((char *)&self->super.super.super.isa + *off_1E5DB3320[v4]);
  }
  id v6 = v5;
  [(PXDebugRelatedViewController *)self _initDataSourceWithKeywords:v5];
  [(UITableView *)self->_tableView reloadData];
}

- (void)_initDataSourceWithKeywords:(id)a3
{
  currentKeywords = self->_currentKeywords;
  id v5 = a3;
  [(NSMutableDictionary *)currentKeywords removeAllObjects];
  [(NSCountedSet *)self->_countedKeywords removeAllObjects];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__PXDebugRelatedViewController__initDataSourceWithKeywords___block_invoke;
  v6[3] = &unk_1E5DB32E8;
  v6[4] = self;
  [v5 enumerateKeysAndObjectsUsingBlock:v6];
}

void __60__PXDebugRelatedViewController__initDataSourceWithKeywords___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if ([v5 count])
  {
    id v6 = [MEMORY[0x1E4F28BD0] setWithArray:v5];
    [*(id *)(*(void *)(a1 + 32) + 1096) unionSet:v6];
    id v7 = *(void **)(*(void *)(a1 + 32) + 1088);
    id v8 = [v6 allObjects];
    [v7 setObject:v8 forKey:v9];
  }
}

- (void)viewDidLoad
{
  v53.receiver = self;
  v53.super_class = (Class)PXDebugRelatedViewController;
  [(PXDebugRelatedViewController *)&v53 viewDidLoad];
  v3 = [(PXDebugRelatedViewController *)self view];
  [v3 setAutoresizingMask:18];

  unint64_t v4 = [(PXDebugRelatedViewController *)self view];
  id v5 = [MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
  [v4 setBackgroundColor:v5];

  id v6 = (UISegmentedControl *)[objc_alloc(MEMORY[0x1E4FB1C10]) initWithItems:&unk_1F02D37D8];
  segmentedControl = self->_segmentedControl;
  self->_segmentedControl = v6;

  [(UISegmentedControl *)self->_segmentedControl addTarget:self action:sel__switchLogsAction_ forControlEvents:4096];
  id v8 = [(PXDebugRelatedViewController *)self view];
  [v8 addSubview:self->_segmentedControl];

  id v52 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  id v9 = [(PXDebugRelatedViewController *)self view];
  [v9 addSubview:v52];

  v10 = objc_opt_new();
  v11 = [(PXDebugRelatedViewController *)self view];
  [v11 addSubview:v10];

  uint64_t v12 = objc_opt_new();
  [v12 setTextAlignment:1];
  v13 = [MEMORY[0x1E4FB08E0] systemFontOfSize:12.0];
  [v12 setFont:v13];

  [v10 addSubview:v12];
  v14 = objc_opt_new();
  [v14 setTextAlignment:1];
  if (self->_isInteresting) {
    v15 = @"YES";
  }
  else {
    v15 = @"NO";
  }
  id v16 = [NSString stringWithFormat:@"Curation: %.3f (%@)", *(void *)&self->_curationScore, v15];
  [v14 setText:v16];

  unint64_t v17 = [MEMORY[0x1E4FB08E0] systemFontOfSize:12.0];
  [v14 setFont:v17];

  [v10 addSubview:v14];
  v18 = objc_opt_new();
  [v18 setTextAlignment:1];
  v19 = objc_msgSend(NSString, "stringWithFormat:", @"Graph: %.3f", *(void *)&self->_graphScore);
  [v18 setText:v19];

  v20 = [MEMORY[0x1E4FB08E0] systemFontOfSize:12.0];
  [v18 setFont:v20];

  [v10 addSubview:v18];
  id v21 = objc_opt_new();
  [v21 setTextAlignment:1];
  v22 = objc_msgSend(NSString, "stringWithFormat:", @"Neighbor: %.3f", *(void *)&self->_neighborScore);
  [v21 setText:v22];

  v23 = [MEMORY[0x1E4FB08E0] systemFontOfSize:12.0];
  [v21 setFont:v23];

  [v10 addSubview:v21];
  v24 = objc_msgSend(NSString, "stringWithFormat:", @"Related: %0.3f (%.3f)", *(void *)&self->_relatedScore, *(void *)&self->_matchingScore);
  [v12 setText:v24];

  [(UISegmentedControl *)self->_segmentedControl setSelectedSegmentIndex:0];
  [(UISegmentedControl *)self->_segmentedControl setTranslatesAutoresizingMaskIntoConstraints:0];
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v52 setTranslatesAutoresizingMaskIntoConstraints:0];
  v51 = v12;
  [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
  v50 = v14;
  [v14 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v18 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v21 setTranslatesAutoresizingMaskIntoConstraints:0];
  v25 = _NSDictionaryOfVariableBindings(&cfstr_Segmentedcontr.isa, self->_segmentedControl, v52, v12, v14, v18, v21, v10, 0);
  v26 = [v10 topAnchor];
  v27 = [(PXDebugRelatedViewController *)self view];
  v28 = [v27 safeAreaLayoutGuide];
  v29 = [v28 topAnchor];
  v30 = [v26 constraintEqualToAnchor:v29 constant:10.0];
  [v30 setActive:1];

  v31 = [(PXDebugRelatedViewController *)self view];
  v32 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:[labelsView]-10-[_segmentedControl(<=44)]-10-[contentView]-0-|" options:0 metrics:0 views:v25];
  [v31 addConstraints:v32];

  v33 = [(PXDebugRelatedViewController *)self view];
  v34 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|-[_segmentedControl]-|" options:0 metrics:0 views:v25];
  [v33 addConstraints:v34];

  v35 = [(PXDebugRelatedViewController *)self view];
  v36 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|-20-[labelsView]-20-|" options:0 metrics:0 views:v25];
  [v35 addConstraints:v36];

  v37 = [(PXDebugRelatedViewController *)self view];
  v38 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|[contentView]|" options:0 metrics:0 views:v25];
  [v37 addConstraints:v38];

  v39 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:|-[relatedScoreLabel]-[curationScoreLabel]-|" options:0 metrics:0 views:v25];
  [v10 addConstraints:v39];

  v40 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:|-[graphScoreLabel]-[neighborScoreLabel]-|" options:0 metrics:0 views:v25];
  [v10 addConstraints:v40];

  v41 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|[curationScoreLabel(==neighborScoreLabel)]-[neighborScoreLabel]|" options:0 metrics:0 views:v25];
  [v10 addConstraints:v41];

  v42 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|[relatedScoreLabel(==graphScoreLabel)]-[graphScoreLabel]|" options:0 metrics:0 views:v25];
  [v10 addConstraints:v42];

  id v43 = objc_alloc(MEMORY[0x1E4FB1D00]);
  [v52 frame];
  v44 = (UITableView *)objc_msgSend(v43, "initWithFrame:style:", 1);
  tableView = self->_tableView;
  self->_tableView = v44;

  [(UITableView *)self->_tableView setAutoresizingMask:18];
  [(UITableView *)self->_tableView setDataSource:self];
  [(UITableView *)self->_tableView setAllowsSelection:0];
  [v52 addSubview:self->_tableView];
  v46 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:@"Close" style:2 target:self action:sel__closeAction_];
  v47 = [(PXDebugRelatedViewController *)self navigationItem];
  [v47 setLeftBarButtonItem:v46];

  v48 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:7 target:self action:sel__sendByEmailAction_];
  v49 = [(PXDebugRelatedViewController *)self navigationItem];
  [v49 setRightBarButtonItem:v48];

  [(PXDebugRelatedViewController *)self _switchLogsAction:0];
}

- (void)_setupWithDictionary:(id)a3
{
  unint64_t v4 = (void *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  id v6 = [v4 dictionary];
  currentKeywords = self->_currentKeywords;
  self->_currentKeywords = v6;

  id v8 = [MEMORY[0x1E4F28BD0] set];
  countedKeywords = self->_countedKeywords;
  self->_countedKeywords = v8;

  v10 = [v5 objectForKeyedSubscript:@"graphScore"];
  [v10 doubleValue];
  self->_graphScore = v11;

  uint64_t v12 = [v5 objectForKeyedSubscript:@"neighborScore"];
  [v12 doubleValue];
  self->_neighborScore = v13;

  v14 = [v5 objectForKeyedSubscript:@"curationScore"];
  [v14 doubleValue];
  self->_curationScore = v15;

  id v16 = [v5 objectForKeyedSubscript:@"relatedScore"];
  [v16 doubleValue];
  self->_relatedScore = v17;

  v18 = [v5 objectForKeyedSubscript:@"matchingScore"];
  [v18 doubleValue];
  self->_matchingScore = v19;

  v20 = [v5 objectForKeyedSubscript:@"isInteresting"];
  self->_isInteresting = [v20 BOOLValue];

  id v21 = [v5 objectForKeyedSubscript:@"relatedType"];
  self->_relatedType = [v21 integerValue];

  v22 = [v5 objectForKeyedSubscript:@"debugDescription"];
  debugDescription = self->_debugDescription;
  self->_debugDescription = v22;

  v24 = [v5 objectForKeyedSubscript:@"matchingWeight"];
  matchingWeight = self->_matchingWeight;
  self->_matchingWeight = v24;

  v26 = [v5 objectForKeyedSubscript:@"matchingKeywords"];
  matchingKeywords = self->_matchingKeywords;
  self->_matchingKeywords = v26;

  v28 = [v5 objectForKeyedSubscript:@"referenceKeywords"];
  referenceKeywords = self->_referenceKeywords;
  self->_referenceKeywords = v28;

  v30 = [v5 objectForKeyedSubscript:@"relatedKeywords"];

  relatedKeywords = self->_relatedKeywords;
  self->_relatedKeywords = v30;
}

- (PXDebugRelatedViewController)initWithDictionary:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PXDebugRelatedViewController;
  id v5 = [(PXDebugRelatedViewController *)&v8 init];
  id v6 = v5;
  if (v5)
  {
    [(PXDebugRelatedViewController *)v5 setTitle:@"Related Debug"];
    [(PXDebugRelatedViewController *)v6 _setupWithDictionary:v4];
  }

  return v6;
}

@end