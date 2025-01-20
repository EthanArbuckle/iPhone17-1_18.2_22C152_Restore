@interface PXDebugMemoriesViewController
- (PXDebugMemoriesViewController)initWithMemory:(id)a3 memoryInfo:(id)a4;
- (id)_debugDictionary;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_closeAction:(id)a3;
- (void)_sendByEmailAction:(id)a3;
- (void)_switchLogsAction:(id)a3;
- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5;
- (void)viewDidLoad;
@end

@implementation PXDebugMemoriesViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceMemory, 0);
  objc_storeStrong((id *)&self->_sourceDictionary, 0);
  objc_storeStrong((id *)&self->_tableContent, 0);
  objc_storeStrong((id *)&self->_sectionTitles, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_segmentedControl, 0);
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return [(NSArray *)self->_sectionTitles objectAtIndexedSubscript:a4];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 dequeueReusableCellWithIdentifier:@"KeywordsCell"];
  if (!v8) {
    v8 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:3 reuseIdentifier:@"KeywordsCell"];
  }
  v9 = -[PXDebugMemoriesViewController tableView:titleForHeaderInSection:](self, "tableView:titleForHeaderInSection:", v7, [v6 section]);

  v10 = [(NSDictionary *)self->_tableContent objectForKeyedSubscript:v9];
  uint64_t v11 = [v6 row];

  v12 = [v10 objectAtIndexedSubscript:v11];

  v13 = [v9 lowercaseString];
  LODWORD(v11) = [v13 isEqualToString:@"location"];

  if (v11)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v14 = v12;
      if ((unint64_t)[v14 count] < 2)
      {
        v18 = @"Invalid location";
      }
      else
      {
        v15 = NSString;
        uint64_t v16 = [v14 objectAtIndexedSubscript:0];
        v17 = [v14 objectAtIndexedSubscript:1];
        v18 = [v15 stringWithFormat:@"(%@, %@)", v16, v17];

        id v14 = (id)v16;
      }
    }
    else
    {
      v18 = @"Invalid location";
    }

    v12 = v18;
  }
  v19 = [v8 textLabel];
  [v19 setText:v12];

  v20 = [v8 textLabel];
  v21 = [MEMORY[0x1E4FB08E0] systemFontOfSize:13.0];
  [v20 setFont:v21];

  v22 = [v8 textLabel];
  [v22 setNumberOfLines:0];

  v23 = [v8 textLabel];
  [v23 sizeToFit];

  return v8;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  v5 = [(PXDebugMemoriesViewController *)self tableView:a3 titleForHeaderInSection:a4];
  id v6 = [(NSDictionary *)self->_tableContent objectForKeyedSubscript:v5];
  int64_t v7 = [v6 count];

  return v7;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return [(NSArray *)self->_sectionTitles count];
}

- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5
{
}

- (void)_closeAction:(id)a3
{
}

- (void)_sendByEmailAction:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ([getMFMailComposeViewControllerClass_104735() canSendMail])
  {
    v4 = [(PXDebugMemoriesViewController *)self title];
    v5 = [@"PhotosGraph " stringByAppendingString:v4];

    id v6 = [MEMORY[0x1E4F1C978] arrayWithObject:@"photos-memories-feedback@group.apple.com"];
    id v7 = objc_alloc_init((Class)getMFMailComposeViewControllerClass_104735());
    [v7 setMailComposeDelegate:self];
    [v7 setSubject:v5];
    [v7 setToRecipients:v6];
    v8 = +[PXMemoriesRelatedDiagnosticsHelper getSummaryFromProviderItem:self->_sourceMemory];
    if (v8)
    {
      id v16 = 0;
      v9 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v8 format:200 options:0 error:&v16];
      id v10 = v16;
      if (v9) {
        [v7 addAttachmentData:v9 mimeType:@"application/x-plist" fileName:@"results.plist"];
      }
      if (v10)
      {
        uint64_t v11 = NSString;
        v12 = [v10 localizedDescription];
        v13 = [v11 stringWithFormat:@"Cannot attach results.plist: %@.", v12];

        id v14 = v13;
        v15 = PLUIGetLog();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v18 = v14;
          _os_log_impl(&dword_1A9AE7000, v15, OS_LOG_TYPE_DEFAULT, "ERROR: %@", buf, 0xCu);
        }

        goto LABEL_13;
      }
    }
    else
    {
      v9 = 0;
      id v10 = 0;
    }
    id v14 = &stru_1F00B0030;
LABEL_13:
    [v7 setMessageBody:v14 isHTML:0];
    [(PXDebugMemoriesViewController *)self presentViewController:v7 animated:1 completion:0];

    goto LABEL_14;
  }
  v5 = PLUIGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEFAULT, "ERROR: Looks like email is not setup on this system.", buf, 2u);
  }
LABEL_14:
}

- (void)_switchLogsAction:(id)a3
{
  NSInteger v4 = [(UISegmentedControl *)self->_segmentedControl selectedSegmentIndex];
  id v11 = 0;
  id v12 = 0;
  +[PXMemoriesRelatedDiagnosticsHelper generateSectionTitles:&v12 andTableContent:&v11 forIndex:v4 sourceMemory:self->_sourceMemory sourceDictionary:self->_sourceDictionary];
  v5 = (NSArray *)v12;
  id v6 = (NSDictionary *)v11;
  sectionTitles = self->_sectionTitles;
  self->_sectionTitles = v5;
  v8 = v5;

  tableContent = self->_tableContent;
  self->_tableContent = v6;
  id v10 = v6;

  [(UITableView *)self->_tableView reloadData];
}

- (void)viewDidLoad
{
  v30.receiver = self;
  v30.super_class = (Class)PXDebugMemoriesViewController;
  [(PXDebugMemoriesViewController *)&v30 viewDidLoad];
  v3 = [(PXDebugMemoriesViewController *)self view];
  [v3 setAutoresizingMask:18];

  NSInteger v4 = [(PXDebugMemoriesViewController *)self view];
  v5 = [MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
  [v4 setBackgroundColor:v5];

  id v6 = (UISegmentedControl *)[objc_alloc(MEMORY[0x1E4FB1C10]) initWithItems:&unk_1F02D42B8];
  segmentedControl = self->_segmentedControl;
  self->_segmentedControl = v6;

  [(UISegmentedControl *)self->_segmentedControl addTarget:self action:sel__switchLogsAction_ forControlEvents:4096];
  [(UISegmentedControl *)self->_segmentedControl setSelectedSegmentIndex:0];
  v8 = [(PXDebugMemoriesViewController *)self view];
  [v8 addSubview:self->_segmentedControl];

  id v9 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  id v10 = [(PXDebugMemoriesViewController *)self view];
  [v10 addSubview:v9];

  [(UISegmentedControl *)self->_segmentedControl setTranslatesAutoresizingMaskIntoConstraints:0];
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v11 = [(UISegmentedControl *)self->_segmentedControl topAnchor];
  id v12 = [(PXDebugMemoriesViewController *)self view];
  v13 = [v12 safeAreaLayoutGuide];
  id v14 = [v13 topAnchor];
  v15 = [v11 constraintEqualToAnchor:v14 constant:10.0];
  [v15 setActive:1];

  id v16 = _NSDictionaryOfVariableBindings(&cfstr_Segmentedcontr_0.isa, self->_segmentedControl, v9, 0);
  v17 = [(PXDebugMemoriesViewController *)self view];
  v18 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:[_segmentedControl(<=44)]-10-[contentView]-0-|" options:0 metrics:0 views:v16];
  [v17 addConstraints:v18];

  uint64_t v19 = [(PXDebugMemoriesViewController *)self view];
  v20 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|-[_segmentedControl]-|" options:0 metrics:0 views:v16];
  [v19 addConstraints:v20];

  v21 = [(PXDebugMemoriesViewController *)self view];
  v22 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|[contentView]|" options:0 metrics:0 views:v16];
  [v21 addConstraints:v22];

  id v23 = objc_alloc(MEMORY[0x1E4FB1D00]);
  [v9 frame];
  v24 = (UITableView *)objc_msgSend(v23, "initWithFrame:style:", 1);
  tableView = self->_tableView;
  self->_tableView = v24;

  [(UITableView *)self->_tableView setAutoresizingMask:18];
  [(UITableView *)self->_tableView setDataSource:self];
  [(UITableView *)self->_tableView setAllowsSelection:0];
  [v9 addSubview:self->_tableView];
  v26 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:@"Close" style:2 target:self action:sel__closeAction_];
  v27 = [(PXDebugMemoriesViewController *)self navigationItem];
  [v27 setLeftBarButtonItem:v26];

  v28 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:7 target:self action:sel__sendByEmailAction_];
  v29 = [(PXDebugMemoriesViewController *)self navigationItem];
  [v29 setRightBarButtonItem:v28];

  [(PXDebugMemoriesViewController *)self _switchLogsAction:0];
}

- (PXDebugMemoriesViewController)initWithMemory:(id)a3 memoryInfo:(id)a4
{
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PXDebugMemoriesViewController;
  id v7 = [(PXDebugMemoriesViewController *)&v17 init];
  v8 = v7;
  if (v7)
  {
    [(PXDebugMemoriesViewController *)v7 setTitle:@"Memory Debug"];
    p_sourceMemory = (id *)&v8->_sourceMemory;
    objc_storeStrong((id *)&v8->_sourceMemory, a3);
    id v10 = [v6 photosGraphProperties];
    if (!v10)
    {
      id v10 = [(PXDebugMemoriesViewController *)v8 _debugDictionary];
    }
    id v11 = [*p_sourceMemory localIdentifier];
    uint64_t v12 = (unsigned __int16)[*p_sourceMemory photosGraphVersion];
    v13 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
    uint64_t v14 = +[PXMemoriesRelatedDiagnosticsHelper preprocessDictionary:v10 forMemoryWithLocalIdentifier:v11 algorithmsVersion:v12 inPhotoLibrary:v13];
    sourceDictionary = v8->_sourceDictionary;
    v8->_sourceDictionary = (NSDictionary *)v14;
  }
  return v8;
}

- (id)_debugDictionary
{
  return &unk_1F02DB4A0;
}

@end