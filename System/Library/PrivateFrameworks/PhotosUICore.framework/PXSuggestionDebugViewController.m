@interface PXSuggestionDebugViewController
- (PXSuggestionDebugViewController)initWithSuggestion:(id)a3 suggestionInfo:(id)a4;
- (id)existingSectionsWithSuggestion:(id)a3 suggestionInfo:(id)a4;
- (id)infoSectionsWithSuggestion:(id)a3 suggestionInfo:(id)a4 compact:(BOOL)a5;
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

@implementation PXSuggestionDebugViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionInfo, 0);
  objc_storeStrong((id *)&self->_suggestion, 0);
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
  v9 = -[PXSuggestionDebugViewController tableView:titleForHeaderInSection:](self, "tableView:titleForHeaderInSection:", v7, [v6 section]);

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
  v5 = [(PXSuggestionDebugViewController *)self tableView:a3 titleForHeaderInSection:a4];
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
  if ([getMFMailComposeViewControllerClass_45776() canSendMail])
  {
    v4 = [(PXSuggestionDebugViewController *)self title];
    v5 = [@"PhotosGraph " stringByAppendingString:v4];

    id v6 = [MEMORY[0x1E4F1C978] arrayWithObject:@"photos-memories-feedback@group.apple.com"];
    id v7 = objc_alloc_init((Class)getMFMailComposeViewControllerClass_45776());
    [v7 setMailComposeDelegate:self];
    [v7 setSubject:v5];
    [v7 setToRecipients:v6];
    v8 = +[PXMemoriesRelatedDiagnosticsHelper getSummaryFromProviderItem:self->_suggestion];
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
    [(PXSuggestionDebugViewController *)self presentViewController:v7 animated:1 completion:0];

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

- (id)existingSectionsWithSuggestion:(id)a3 suggestionInfo:(id)a4
{
  v59[1] = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  id v5 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v5 setDateStyle:1];
  [v5 setTimeStyle:2];
  id v6 = [v4 objectForKeyedSubscript:@"identicalExistingSuggestionInfo"];
  id v7 = v6;
  if (v6)
  {
    v8 = [v6 objectForKeyedSubscript:@"uuid"];
    if (v8)
    {
      v9 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
      id v10 = [v9 librarySpecificFetchOptions];

      uint64_t v11 = [MEMORY[0x1E4F39310] localIdentifierWithUUID:v8];
      v12 = v8;
      v13 = (void *)MEMORY[0x1E4F38EE8];
      v59[0] = v11;
      id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:1];
      v15 = [v13 fetchAssetCollectionsWithLocalIdentifiers:v14 options:v10];
      uint64_t v16 = [v15 firstObject];

      v8 = v12;
      v17 = (void *)v16;
    }
    else
    {
      v17 = 0;
    }
    id v47 = [(PXSuggestionDebugViewController *)self infoSectionsWithSuggestion:v17 suggestionInfo:v7 compact:0];
  }
  else
  {
    id v47 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v8 = [v4 objectForKeyedSubscript:@"suggestionsByCollisionReason"];
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    v18 = [v8 allKeys];
    uint64_t v19 = [v18 sortedArrayUsingSelector:sel_compare_];

    id obj = v19;
    uint64_t v43 = [v19 countByEnumeratingWithState:&v52 objects:v58 count:16];
    if (v43)
    {
      id v38 = v5;
      id v39 = v4;
      uint64_t v41 = *(void *)v53;
      v42 = v8;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v53 != v41) {
            objc_enumerationMutation(obj);
          }
          uint64_t v44 = v20;
          uint64_t v21 = *(void *)(*((void *)&v52 + 1) + 8 * v20);
          long long v48 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          id v45 = [v8 objectForKeyedSubscript:v21];
          uint64_t v22 = [v45 countByEnumeratingWithState:&v48 objects:v57 count:16];
          if (v22)
          {
            uint64_t v23 = v22;
            uint64_t v24 = *(void *)v49;
            do
            {
              for (uint64_t i = 0; i != v23; ++i)
              {
                if (*(void *)v49 != v24) {
                  objc_enumerationMutation(v45);
                }
                v26 = [*(id *)(*((void *)&v48 + 1) + 8 * i) objectForKeyedSubscript:@"uuid"];
                if (v26)
                {
                  v27 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
                  v28 = [v27 librarySpecificFetchOptions];

                  v29 = [MEMORY[0x1E4F39310] localIdentifierWithUUID:v26];
                  v30 = (void *)MEMORY[0x1E4F38EE8];
                  v56 = v29;
                  v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v56 count:1];
                  v32 = [v30 fetchAssetCollectionsWithLocalIdentifiers:v31 options:v28];
                  v33 = [v32 firstObject];
                }
                else
                {
                  v33 = 0;
                }
                v34 = [(PXSuggestionDebugViewController *)self infoSectionsWithSuggestion:v33 suggestionInfo:0 compact:1];
                v35 = [v34 objectForKeyedSubscript:@"1. Info"];
                v36 = [NSString stringWithFormat:@"%@ %d", v21, 0];
                [v47 setObject:v35 forKey:v36];
              }
              uint64_t v23 = [v45 countByEnumeratingWithState:&v48 objects:v57 count:16];
            }
            while (v23);
          }

          uint64_t v20 = v44 + 1;
          v8 = v42;
        }
        while (v44 + 1 != v43);
        uint64_t v43 = [obj countByEnumeratingWithState:&v52 objects:v58 count:16];
      }
      while (v43);
      id v5 = v38;
      id v4 = v39;
      id v7 = 0;
    }
    v17 = obj;
  }

  return v47;
}

- (id)infoSectionsWithSuggestion:(id)a3 suggestionInfo:(id)a4 compact:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  id v72 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v9 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v9 setDateStyle:1];
  [v9 setTimeStyle:2];
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v11 = NSString;
  [v7 type];
  v12 = PHSuggestionStringWithType();
  v13 = [v11 stringWithFormat:@"[Type] %@", v12];
  [v10 addObject:v13];

  id v14 = NSString;
  [v7 subtype];
  v15 = PHSuggestionStringWithSubtype();
  uint64_t v16 = [v14 stringWithFormat:@"[Subtype] %@", v15];
  [v10 addObject:v16];

  v17 = [v7 uuid];
  if (v17
    || ([v8 objectForKeyedSubscript:@"uuid"],
        (v17 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v18 = [NSString stringWithFormat:@"[UUID] %@", v17];
    [v10 addObject:v18];
  }
  uint64_t v19 = [v7 creationDate];
  if (v19
    || ([v8 objectForKeyedSubscript:@"creationDate"],
        (uint64_t v19 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v20 = NSString;
    uint64_t v21 = [v9 stringFromDate:v19];
    uint64_t v22 = [v20 stringWithFormat:@"[Creation Date] %@", v21];
    [v10 addObject:v22];
  }
  uint64_t v23 = NSString;
  [v7 state];
  uint64_t v24 = PHSuggestionStateStringWithState();
  v25 = [v23 stringWithFormat:@"[State] %@", v24];
  [v10 addObject:v25];

  v26 = NSString;
  [v7 notificationState];
  v27 = PHSuggestionNotificationStateStringWithNotificationState();
  v28 = [v26 stringWithFormat:@"[Notification state] %@", v27];
  [v10 addObject:v28];

  v29 = [v7 localizedTitle];
  if (v29
    || ([v8 objectForKeyedSubscript:@"title"],
        (v29 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v30 = [NSString stringWithFormat:@"[Title] %@", v29];
    [v10 addObject:v30];
  }
  v31 = [v7 localizedSubtitle];
  if (v31
    || ([v8 objectForKeyedSubscript:@"subtitle"],
        (v31 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v32 = [NSString stringWithFormat:@"[Subtitle] %@", v31];
    [v10 addObject:v32];
  }
  v33 = [v7 startDate];
  if (v33
    || ([v8 objectForKeyedSubscript:@"universalStartDate"],
        (v33 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v34 = NSString;
    v35 = [v9 stringFromDate:v33];
    v36 = [v34 stringWithFormat:@"[Start Date] %@", v35];
    [v10 addObject:v36];
  }
  v37 = [v7 endDate];
  if (v37
    || ([v8 objectForKeyedSubscript:@"universalEndDate"],
        (v37 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v38 = NSString;
    id v39 = [v9 stringFromDate:v37];
    v40 = [v38 stringWithFormat:@"[End Date] %@", v39];
    [v10 addObject:v40];
  }
  uint64_t v41 = [v7 context];
  if (v41)
  {
    v42 = [NSString stringWithFormat:@"[Context] %@", v41];
    [v10 addObject:v42];
  }
  uint64_t v43 = [v7 relevantUntilDate];
  v69 = (void *)v43;
  if (v43)
  {
    uint64_t v44 = NSString;
    id v45 = [v9 stringFromDate:v43];
    v46 = [v44 stringWithFormat:@"[Relevant Until Date] %@", v45];
    [v10 addObject:v46];
  }
  v70 = v9;
  [v72 setObject:v10 forKeyedSubscript:@"1. Info"];
  id v47 = v10;
  id v48 = v47;
  if (!a5)
  {
    id v48 = objc_alloc_init(MEMORY[0x1E4F1CA48]);

    [v72 setObject:v48 forKeyedSubscript:@"2. Assets"];
  }
  uint64_t v49 = [v8 objectForKeyedSubscript:@"keyAssetUUID"];
  long long v50 = v8;
  long long v51 = (void *)v49;
  v71 = v50;
  long long v52 = [v50 objectForKeyedSubscript:@"keyAssetCreationDate"];
  if (!v51)
  {
    long long v53 = [MEMORY[0x1E4F38EB8] fetchKeyAssetsInAssetCollection:v7 options:0];
    long long v54 = [v53 firstObject];

    long long v51 = [v54 uuid];
    uint64_t v55 = [v54 creationDate];

    long long v52 = (void *)v55;
  }
  v56 = [NSString stringWithFormat:@"[Key Asset UUID] %@", v51];
  [v48 addObject:v56];

  v57 = NSString;
  v58 = [v70 stringFromDate:v52];
  v59 = [v57 stringWithFormat:@"[Key Asset Creation Date] %@", v58];
  [v48 addObject:v59];

  v60 = [v71 objectForKeyedSubscript:@"reasons"];
  if (v60) {
    [v72 setObject:v60 forKeyedSubscript:@"3. Reasons"];
  }
  v61 = [v7 featuresProperties];
  v62 = v61;
  if (v61)
  {
    id v68 = v47;
    v63 = v41;
    v64 = [v61 objectForKeyedSubscript:@"widgetIdentifier"];
    id v65 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (v64)
    {
      v66 = [NSString stringWithFormat:@"[WidgetIdentifier] %@", v64];
      [v65 addObject:v66];
    }
    if ([v65 count]) {
      [v72 setObject:v65 forKeyedSubscript:@"4. Featured Properties"];
    }

    uint64_t v41 = v63;
    id v47 = v68;
  }

  return v72;
}

- (void)_switchLogsAction:(id)a3
{
  NSInteger v4 = [(UISegmentedControl *)self->_segmentedControl selectedSegmentIndex];
  if (v4)
  {
    if (v4 != 1) {
      goto LABEL_6;
    }
    id v5 = [(PXSuggestionDebugViewController *)self existingSectionsWithSuggestion:self->_suggestion suggestionInfo:self->_suggestionInfo];
  }
  else
  {
    id v5 = [(PXSuggestionDebugViewController *)self infoSectionsWithSuggestion:self->_suggestion suggestionInfo:self->_suggestionInfo compact:0];
  }
  tableContent = self->_tableContent;
  self->_tableContent = v5;

LABEL_6:
  id v7 = [(NSDictionary *)self->_tableContent allKeys];
  id v8 = [v7 sortedArrayUsingSelector:sel_compare_];
  sectionTitles = self->_sectionTitles;
  self->_sectionTitles = v8;

  tableView = self->_tableView;
  [(UITableView *)tableView reloadData];
}

- (void)viewDidLoad
{
  v37[2] = *MEMORY[0x1E4F143B8];
  v36.receiver = self;
  v36.super_class = (Class)PXSuggestionDebugViewController;
  [(PXSuggestionDebugViewController *)&v36 viewDidLoad];
  v3 = [(PXSuggestionDebugViewController *)self view];
  [v3 setAutoresizingMask:18];

  NSInteger v4 = [(PXSuggestionDebugViewController *)self view];
  id v5 = [MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
  [v4 setBackgroundColor:v5];

  id v6 = [(NSDictionary *)self->_suggestionInfo objectForKeyedSubscript:@"identicalExistingSuggestionInfo"];
  if (v6)
  {

    id v7 = @"Nightly";
  }
  else
  {
    id v8 = [(NSDictionary *)self->_suggestionInfo objectForKeyedSubscript:@"suggestionsByCollisionReason"];
    id v7 = @"Colliding";
    if (v8) {
      id v9 = @"Colliding";
    }
    else {
      id v9 = 0;
    }
    id v10 = v9;

    if (!v8)
    {
      uint64_t v11 = &unk_1F02D37F0;
      goto LABEL_8;
    }
  }
  v37[0] = @"Info";
  v37[1] = v7;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:2];
LABEL_8:
  v12 = (UISegmentedControl *)[objc_alloc(MEMORY[0x1E4FB1C10]) initWithItems:v11];
  segmentedControl = self->_segmentedControl;
  self->_segmentedControl = v12;

  [(UISegmentedControl *)self->_segmentedControl addTarget:self action:sel__switchLogsAction_ forControlEvents:4096];
  [(UISegmentedControl *)self->_segmentedControl setSelectedSegmentIndex:0];
  id v14 = [(PXSuggestionDebugViewController *)self view];
  [v14 addSubview:self->_segmentedControl];

  id v15 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  uint64_t v16 = [(PXSuggestionDebugViewController *)self view];
  [v16 addSubview:v15];

  [(UISegmentedControl *)self->_segmentedControl setTranslatesAutoresizingMaskIntoConstraints:0];
  [v15 setTranslatesAutoresizingMaskIntoConstraints:0];
  v17 = [(UISegmentedControl *)self->_segmentedControl topAnchor];
  v18 = [(PXSuggestionDebugViewController *)self view];
  uint64_t v19 = [v18 safeAreaLayoutGuide];
  uint64_t v20 = [v19 topAnchor];
  uint64_t v21 = [v17 constraintEqualToAnchor:v20 constant:10.0];
  [v21 setActive:1];

  uint64_t v22 = _NSDictionaryOfVariableBindings(&cfstr_Segmentedcontr_0.isa, self->_segmentedControl, v15, 0);
  uint64_t v23 = [(PXSuggestionDebugViewController *)self view];
  uint64_t v24 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:[_segmentedControl(<=44)]-10-[contentView]-0-|" options:0 metrics:0 views:v22];
  [v23 addConstraints:v24];

  v25 = [(PXSuggestionDebugViewController *)self view];
  v26 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|-[_segmentedControl]-|" options:0 metrics:0 views:v22];
  [v25 addConstraints:v26];

  v27 = [(PXSuggestionDebugViewController *)self view];
  v28 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|[contentView]|" options:0 metrics:0 views:v22];
  [v27 addConstraints:v28];

  id v29 = objc_alloc(MEMORY[0x1E4FB1D00]);
  [v15 frame];
  v30 = (UITableView *)objc_msgSend(v29, "initWithFrame:style:", 1);
  tableView = self->_tableView;
  self->_tableView = v30;

  [(UITableView *)self->_tableView setAutoresizingMask:18];
  [(UITableView *)self->_tableView setDataSource:self];
  [(UITableView *)self->_tableView setAllowsSelection:0];
  [v15 addSubview:self->_tableView];
  v32 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:@"Close" style:2 target:self action:sel__closeAction_];
  v33 = [(PXSuggestionDebugViewController *)self navigationItem];
  [v33 setLeftBarButtonItem:v32];

  v34 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:7 target:self action:sel__sendByEmailAction_];
  v35 = [(PXSuggestionDebugViewController *)self navigationItem];
  [v35 setRightBarButtonItem:v34];

  [(PXSuggestionDebugViewController *)self _switchLogsAction:0];
}

- (PXSuggestionDebugViewController)initWithSuggestion:(id)a3 suggestionInfo:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXSuggestionDebugViewController;
  id v9 = [(PXSuggestionDebugViewController *)&v12 init];
  id v10 = v9;
  if (v9)
  {
    [(PXSuggestionDebugViewController *)v9 setTitle:@"Suggestion Debug"];
    objc_storeStrong((id *)&v10->_suggestion, a3);
    objc_storeStrong((id *)&v10->_suggestionInfo, a4);
  }

  return v10;
}

@end