@interface PXCMMDebugSharingSuggestionViewController
+ (BOOL)generateSectionTitles:(id *)a3 andTableContent:(id *)a4 forIndex:(int64_t)a5 sourceSuggestion:(id)a6 sourceDictionary:(id)a7;
- (PHAssetCollection)sourceSuggestion;
- (PXCMMDebugSharingSuggestionViewController)initWithSharingSuggestion:(id)a3;
- (UISegmentedControl)segmentedControl;
- (UITableView)tableView;
- (id)_debugDictionary;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_closeAction:(id)a3;
- (void)_sendByEmailAction:(id)a3;
- (void)_switchLogsAction:(id)a3;
- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5;
- (void)setSegmentedControl:(id)a3;
- (void)setSourceSuggestion:(id)a3;
- (void)setTableView:(id)a3;
- (void)viewDidLoad;
@end

@implementation PXCMMDebugSharingSuggestionViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceSuggestion, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_segmentedControl, 0);
  objc_storeStrong((id *)&self->_sourceDictionary, 0);
  objc_storeStrong((id *)&self->_tableContent, 0);
  objc_storeStrong((id *)&self->_sectionTitles, 0);
}

- (void)setSourceSuggestion:(id)a3
{
}

- (PHAssetCollection)sourceSuggestion
{
  return self->_sourceSuggestion;
}

- (void)setTableView:(id)a3
{
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setSegmentedControl:(id)a3
{
}

- (UISegmentedControl)segmentedControl
{
  return self->_segmentedControl;
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
  v9 = -[PXCMMDebugSharingSuggestionViewController tableView:titleForHeaderInSection:](self, "tableView:titleForHeaderInSection:", v7, [v6 section]);

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
  v20 = [MEMORY[0x1E4FB08E0] systemFontOfSize:13.0];
  [v19 setFont:v20];

  [v19 setNumberOfLines:0];
  [v19 sizeToFit];

  return v8;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  v5 = [(PXCMMDebugSharingSuggestionViewController *)self tableView:a3 titleForHeaderInSection:a4];
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
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ([getMFMailComposeViewControllerClass_299522() canSendMail])
  {
    v4 = [(PXCMMDebugSharingSuggestionViewController *)self title];
    v5 = [@"PhotosGraph " stringByAppendingString:v4];

    id v6 = [MEMORY[0x1E4F1C978] arrayWithObject:@"photos-memories-feedback@group.apple.com"];
    id v7 = objc_alloc_init((Class)getMFMailComposeViewControllerClass_299522());
    [v7 setMailComposeDelegate:self];
    [v7 setSubject:v5];
    [v7 setToRecipients:v6];
    v8 = self->_sourceDictionary;
    if (v8)
    {
      id v15 = 0;
      v9 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v8 format:200 options:0 error:&v15];
      id v10 = v15;
      if (v9) {
        [v7 addAttachmentData:v9 mimeType:@"application/x-plist" fileName:@"results.plist"];
      }
      if (v10)
      {
        uint64_t v11 = NSString;
        v12 = [v10 localizedDescription];
        v13 = [v11 stringWithFormat:@"Cannot attach results.plist: %@.", v12];

        id v14 = PLSharingGetLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v17 = v10;
          _os_log_impl(&dword_1A9AE7000, v14, OS_LOG_TYPE_ERROR, "Failed to attach results: %@", buf, 0xCu);
        }

        goto LABEL_13;
      }
    }
    else
    {
      v9 = 0;
      id v10 = 0;
    }
    v13 = &stru_1F00B0030;
LABEL_13:
    [v7 setMessageBody:v13 isHTML:0];
    [(PXCMMDebugSharingSuggestionViewController *)self presentViewController:v7 animated:1 completion:0];

    goto LABEL_14;
  }
  v5 = PLSharingGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_ERROR, "Diagnostics: Looks like email is not setup on this system.", buf, 2u);
  }
LABEL_14:
}

- (void)_switchLogsAction:(id)a3
{
  v4 = [(PXCMMDebugSharingSuggestionViewController *)self segmentedControl];
  uint64_t v5 = [v4 selectedSegmentIndex];

  id v13 = 0;
  id v14 = 0;
  id v6 = [(PXCMMDebugSharingSuggestionViewController *)self sourceSuggestion];
  +[PXCMMDebugSharingSuggestionViewController generateSectionTitles:&v14 andTableContent:&v13 forIndex:v5 sourceSuggestion:v6 sourceDictionary:self->_sourceDictionary];
  id v7 = (NSArray *)v14;
  v8 = (NSDictionary *)v13;

  sectionTitles = self->_sectionTitles;
  self->_sectionTitles = v7;
  id v10 = v7;

  tableContent = self->_tableContent;
  self->_tableContent = v8;

  v12 = [(PXCMMDebugSharingSuggestionViewController *)self tableView];
  [v12 reloadData];
}

- (void)viewDidLoad
{
  v21.receiver = self;
  v21.super_class = (Class)PXCMMDebugSharingSuggestionViewController;
  [(PXCMMDebugSharingSuggestionViewController *)&v21 viewDidLoad];
  v3 = [(PXCMMDebugSharingSuggestionViewController *)self view];
  [v3 setAutoresizingMask:18];
  v4 = [MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
  [v3 setBackgroundColor:v4];

  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4FB1C10]) initWithItems:&unk_1F02D5740];
  [v5 addTarget:self action:sel__switchLogsAction_ forControlEvents:4096];
  [v5 setSelectedSegmentIndex:0];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(PXCMMDebugSharingSuggestionViewController *)self setSegmentedControl:v5];
  [v3 addSubview:v5];
  id v6 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v3 addSubview:v6];
  id v7 = [v5 topAnchor];
  v8 = [v3 safeAreaLayoutGuide];
  v9 = [v8 topAnchor];
  id v10 = [v7 constraintEqualToAnchor:v9 constant:10.0];
  [v10 setActive:1];

  uint64_t v11 = _NSDictionaryOfVariableBindings(&cfstr_Segmentedcontr_2.isa, v5, v6, 0);
  v12 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:[segmentedControl(<=44)]-10-[contentView]-0-|" options:0 metrics:0 views:v11];
  [v3 addConstraints:v12];

  id v13 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|-[segmentedControl]-|" options:0 metrics:0 views:v11];
  [v3 addConstraints:v13];

  id v14 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|[contentView]|" options:0 metrics:0 views:v11];
  [v3 addConstraints:v14];

  id v15 = objc_alloc(MEMORY[0x1E4FB1D00]);
  [v6 frame];
  uint64_t v16 = objc_msgSend(v15, "initWithFrame:style:", 1);
  [v16 setAutoresizingMask:18];
  [v16 setDataSource:self];
  [v16 setAllowsSelection:0];
  [v6 addSubview:v16];
  [(PXCMMDebugSharingSuggestionViewController *)self setTableView:v16];
  id v17 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:@"Close" style:2 target:self action:sel__closeAction_];
  uint64_t v18 = [(PXCMMDebugSharingSuggestionViewController *)self navigationItem];
  [v18 setLeftBarButtonItem:v17];

  v19 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:7 target:self action:sel__sendByEmailAction_];
  v20 = [(PXCMMDebugSharingSuggestionViewController *)self navigationItem];
  [v20 setRightBarButtonItem:v19];

  [(PXCMMDebugSharingSuggestionViewController *)self _switchLogsAction:0];
}

- (id)_debugDictionary
{
  return &unk_1F02DB9C8;
}

- (PXCMMDebugSharingSuggestionViewController)initWithSharingSuggestion:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PXCMMDebugSharingSuggestionViewController;
  id v6 = [(PXCMMDebugSharingSuggestionViewController *)&v18 init];
  id v7 = v6;
  if (v6)
  {
    [(PXCMMDebugSharingSuggestionViewController *)v6 setTitle:@"Suggestion Debug"];
    objc_storeStrong((id *)&v7->_sourceSuggestion, a3);
    v8 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
    v9 = [v5 localIdentifier];
    id v17 = 0;
    uint64_t v10 = [v8 sharingSuggestionDebugInformationForAssetCollectionLocalIdentifier:v9 error:&v17];
    id v11 = v17;
    sourceDictionary = v7->_sourceDictionary;
    v7->_sourceDictionary = (NSDictionary *)v10;

    if (!v7->_sourceDictionary)
    {
      id v13 = PLSharingGetLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v20 = v5;
        _os_log_impl(&dword_1A9AE7000, v13, OS_LOG_TYPE_DEFAULT, "Failed to retrieve debug information for asset collection %@", buf, 0xCu);
      }

      uint64_t v14 = [(PXCMMDebugSharingSuggestionViewController *)v7 _debugDictionary];
      id v15 = v7->_sourceDictionary;
      v7->_sourceDictionary = (NSDictionary *)v14;
    }
  }

  return v7;
}

+ (BOOL)generateSectionTitles:(id *)a3 andTableContent:(id *)a4 forIndex:(int64_t)a5 sourceSuggestion:(id)a6 sourceDictionary:(id)a7
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v11 = a6;
  id v12 = a7;
  id v13 = v12;
  if (a3) {
    BOOL v14 = a4 == 0;
  }
  else {
    BOOL v14 = 1;
  }
  BOOL v15 = !v14;
  if (!v14)
  {
    switch(a5)
    {
      case 2:
        id v17 = [v12 objectForKeyedSubscript:@"content"];
        id v20 = objc_opt_new();
        uint64_t v21 = objc_opt_new();
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __126__PXCMMDebugSharingSuggestionViewController_generateSectionTitles_andTableContent_forIndex_sourceSuggestion_sourceDictionary___block_invoke_3;
        v26[3] = &unk_1E5DD2AE0;
        id v27 = v20;
        id v28 = v21;
        id v22 = v21;
        id v23 = v20;
        [v17 enumerateKeysAndObjectsUsingBlock:v26];
        id v18 = v23;
        *a3 = v18;
        id v19 = v22;
        *a4 = v19;

        goto LABEL_14;
      case 1:
        v24 = objc_opt_new();
        id v17 = [v13 objectForKeyedSubscript:@"people"];
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __126__PXCMMDebugSharingSuggestionViewController_generateSectionTitles_andTableContent_forIndex_sourceSuggestion_sourceDictionary___block_invoke_2;
        v29[3] = &unk_1E5DD2A90;
        v30 = v24;
        id v18 = v24;
        [v17 enumerateKeysAndObjectsUsingBlock:v29];
        *a3 = &unk_1F02D5770;
        v33 = &stru_1F00B0030;
        id v34 = v18;
        *a4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
        id v19 = v30;
        goto LABEL_14;
      case 0:
        uint64_t v16 = objc_opt_new();
        id v17 = [v13 objectForKeyedSubscript:@"info"];
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __126__PXCMMDebugSharingSuggestionViewController_generateSectionTitles_andTableContent_forIndex_sourceSuggestion_sourceDictionary___block_invoke;
        v31[3] = &unk_1E5DD2A90;
        v32 = v16;
        id v18 = v16;
        [v17 enumerateKeysAndObjectsUsingBlock:v31];
        *a3 = &unk_1F02D5758;
        v35 = &stru_1F00B0030;
        v36[0] = v18;
        *a4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:&v35 count:1];
        id v19 = v32;
LABEL_14:

        break;
    }
  }

  return v15;
}

void __126__PXCMMDebugSharingSuggestionViewController_generateSectionTitles_andTableContent_forIndex_sourceSuggestion_sourceDictionary___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = [NSString stringWithFormat:@"[%@] %@", a2, a3];
  [*(id *)(a1 + 32) addObject:v4];
}

void __126__PXCMMDebugSharingSuggestionViewController_generateSectionTitles_andTableContent_forIndex_sourceSuggestion_sourceDictionary___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    BOOL v15 = [NSString stringWithFormat:@"%@ - Number of sources: %lu", v5, objc_msgSend(v7, "count")];
    objc_msgSend(*(id *)(a1 + 32), "addObject:");
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = [NSString stringWithFormat:@"\t• %@", *(void *)(*((void *)&v16 + 1) + 8 * v12)];
          [*(id *)(a1 + 32) addObject:v13];

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }
  }
  else
  {
    BOOL v14 = [NSString stringWithFormat:@"[%@] %@", v5, v6];
    [*(id *)(a1 + 32) addObject:v14];
  }
}

void __126__PXCMMDebugSharingSuggestionViewController_generateSectionTitles_andTableContent_forIndex_sourceSuggestion_sourceDictionary___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  id v7 = a2;
  [v6 addObject:v7];
  id v8 = objc_opt_new();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __126__PXCMMDebugSharingSuggestionViewController_generateSectionTitles_andTableContent_forIndex_sourceSuggestion_sourceDictionary___block_invoke_4;
  v10[3] = &unk_1E5DD2AB8;
  id v11 = v8;
  id v9 = v8;
  [v5 enumerateObjectsUsingBlock:v10];
  [*(id *)(a1 + 40) setObject:v9 forKeyedSubscript:v7];
}

uint64_t __126__PXCMMDebugSharingSuggestionViewController_generateSectionTitles_andTableContent_forIndex_sourceSuggestion_sourceDictionary___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

@end