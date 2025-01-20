@interface PXDebugDictionaryViewController
- (NSArray)sectionTitles;
- (NSDictionary)debugDictionary;
- (NSDictionary)tableContent;
- (PXDebugDictionaryViewController)initWithDebugDictionary:(id)a3;
- (UISegmentedControl)segmentedControl;
- (UITableView)tableView;
- (id)_flattenDictionary:(id)a3;
- (id)_sanitizedTextForTitle:(id)a3 value:(id)a4;
- (id)segmentedTitles;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_closeAction:(id)a3;
- (void)_switchLogsAction:(id)a3;
- (void)_updateWithSegmentedTitle:(id)a3;
- (void)setSectionTitles:(id)a3;
- (void)setSegmentedControl:(id)a3;
- (void)setTableContent:(id)a3;
- (void)setTableView:(id)a3;
- (void)viewDidLoad;
@end

@implementation PXDebugDictionaryViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableContent, 0);
  objc_storeStrong((id *)&self->_sectionTitles, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_segmentedControl, 0);
  objc_storeStrong((id *)&self->_debugDictionary, 0);
}

- (void)setTableContent:(id)a3
{
}

- (NSDictionary)tableContent
{
  return self->_tableContent;
}

- (void)setSectionTitles:(id)a3
{
}

- (NSArray)sectionTitles
{
  return self->_sectionTitles;
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

- (NSDictionary)debugDictionary
{
  return self->_debugDictionary;
}

- (void)_closeAction:(id)a3
{
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  v5 = [(PXDebugDictionaryViewController *)self sectionTitles];
  v6 = [v5 objectAtIndexedSubscript:a4];

  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 dequeueReusableCellWithIdentifier:@"KeywordsCell"];
  if (!v8) {
    v8 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:3 reuseIdentifier:@"KeywordsCell"];
  }
  v9 = -[PXDebugDictionaryViewController tableView:titleForHeaderInSection:](self, "tableView:titleForHeaderInSection:", v7, [v6 section]);

  v10 = [(PXDebugDictionaryViewController *)self tableContent];
  v11 = [v10 objectForKeyedSubscript:v9];
  uint64_t v12 = [v6 row];

  v13 = [v11 objectAtIndexedSubscript:v12];

  v14 = [(PXDebugDictionaryViewController *)self _sanitizedTextForTitle:v9 value:v13];
  v15 = [v8 textLabel];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v15 setAttributedText:v14];
  }
  else
  {
    uint64_t v16 = [NSString stringWithFormat:@"%@", v14];

    [v15 setText:v16];
    v17 = [MEMORY[0x1E4FB08E0] systemFontOfSize:13.0];
    [v15 setFont:v17];

    v14 = (void *)v16;
  }
  [v15 setNumberOfLines:0];
  [v15 sizeToFit];

  return v8;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = [(PXDebugDictionaryViewController *)self sectionTitles];
  id v7 = [v6 objectAtIndexedSubscript:a4];

  v8 = [(PXDebugDictionaryViewController *)self tableContent];
  v9 = [v8 objectForKeyedSubscript:v7];
  int64_t v10 = [v9 count];

  return v10;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  v3 = [(PXDebugDictionaryViewController *)self sectionTitles];
  int64_t v4 = [v3 count];

  return v4;
}

- (id)_sanitizedTextForTitle:(id)a3 value:(id)a4
{
  v5 = (__CFString *)a4;
  id v6 = [a3 lowercaseString];
  int v7 = [v6 isEqualToString:@"location"];

  v8 = v5;
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = v5;
      if ((unint64_t)[(__CFString *)v9 count] < 2)
      {
        v8 = @"Invalid location";
      }
      else
      {
        int64_t v10 = NSString;
        uint64_t v11 = [(__CFString *)v9 objectAtIndexedSubscript:0];
        uint64_t v12 = [(__CFString *)v9 objectAtIndexedSubscript:1];
        v8 = [v10 stringWithFormat:@"(%@, %@)", v11, v12];

        v9 = (__CFString *)v11;
      }
    }
    else
    {
      v8 = @"Invalid location";
    }
  }
  return v8;
}

- (id)_flattenDictionary:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = a3;
  v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__PXDebugDictionaryViewController__flattenDictionary___block_invoke;
  v8[3] = &unk_1E5DD0860;
  id v6 = v5;
  id v9 = v6;
  [v4 enumerateKeysAndObjectsUsingBlock:v8];

  return v6;
}

void __54__PXDebugDictionaryViewController__flattenDictionary___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = [NSString stringWithFormat:@"%@: %@", a2, a3];
  [*(id *)(a1 + 32) addObject:v4];
}

- (void)_updateWithSegmentedTitle:(id)a3
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(NSDictionary *)self->_debugDictionary objectForKeyedSubscript:v4];
  v32[0] = v4;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
  [(PXDebugDictionaryViewController *)self setSectionTitles:v6];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v20 = v4;
    int v7 = [v5 allKeys];
    [(PXDebugDictionaryViewController *)self setSectionTitles:v7];

    v19 = v5;
    v8 = (void *)[v5 mutableCopy];
    id v9 = [v8 allKeys];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v31 count:16];
    if (!v10) {
      goto LABEL_14;
    }
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v22;
    while (1)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        v15 = [v8 objectForKeyedSubscript:v14];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v16 = [(PXDebugDictionaryViewController *)self _flattenDictionary:v15];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            goto LABEL_12;
          }
          v30 = v15;
          uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
        }
        v17 = (void *)v16;
        [v8 setObject:v16 forKeyedSubscript:v14];

LABEL_12:
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v31 count:16];
      if (!v11)
      {
LABEL_14:

        v5 = v19;
        id v4 = v20;
        goto LABEL_18;
      }
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v28 = v4;
    v29 = v5;
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
  }
  else
  {
    v25 = v5;
    id v26 = v4;
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
    v27 = v18;
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
  }
LABEL_18:
  [(PXDebugDictionaryViewController *)self setTableContent:v8];
}

- (void)_switchLogsAction:(id)a3
{
  id v8 = [(PXDebugDictionaryViewController *)self segmentedTitles];
  id v4 = [(PXDebugDictionaryViewController *)self segmentedControl];
  uint64_t v5 = [v4 selectedSegmentIndex];

  id v6 = [v8 objectAtIndexedSubscript:v5];
  [(PXDebugDictionaryViewController *)self _updateWithSegmentedTitle:v6];
  int v7 = [(PXDebugDictionaryViewController *)self tableView];
  [v7 reloadData];
}

- (id)segmentedTitles
{
}

uint64_t __50__PXDebugDictionaryViewController_segmentedTitles__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isEqualToString:@"PXDiagnosticsTitle"] ^ 1;
}

- (void)viewDidLoad
{
  v27.receiver = self;
  v27.super_class = (Class)PXDebugDictionaryViewController;
  [(PXDebugDictionaryViewController *)&v27 viewDidLoad];
  v3 = [(PXDebugDictionaryViewController *)self view];
  [v3 setAutoresizingMask:18];

  id v4 = [MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
  uint64_t v5 = [(PXDebugDictionaryViewController *)self view];
  [v5 setBackgroundColor:v4];

  id v6 = [(PXDebugDictionaryViewController *)self segmentedTitles];
  int v7 = (UISegmentedControl *)[objc_alloc(MEMORY[0x1E4FB1C10]) initWithItems:v6];
  segmentedControl = self->_segmentedControl;
  self->_segmentedControl = v7;

  [(UISegmentedControl *)self->_segmentedControl addTarget:self action:sel__switchLogsAction_ forControlEvents:4096];
  [(UISegmentedControl *)self->_segmentedControl setSelectedSegmentIndex:0];
  id v9 = [(PXDebugDictionaryViewController *)self view];
  [v9 addSubview:self->_segmentedControl];

  id v10 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  uint64_t v11 = [(PXDebugDictionaryViewController *)self view];
  [v11 addSubview:v10];

  [(UISegmentedControl *)self->_segmentedControl setTranslatesAutoresizingMaskIntoConstraints:0];
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v12 = [(UISegmentedControl *)self->_segmentedControl topAnchor];
  v13 = [(PXDebugDictionaryViewController *)self view];
  uint64_t v14 = [v13 safeAreaLayoutGuide];
  v15 = [v14 topAnchor];
  uint64_t v16 = [v12 constraintEqualToAnchor:v15 constant:10.0];
  [v16 setActive:1];

  v17 = _NSDictionaryOfVariableBindings(&cfstr_Segmentedcontr_0.isa, self->_segmentedControl, v10, 0);
  v18 = [MEMORY[0x1E4F1CA48] array];
  v19 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:[_segmentedControl(<=44)]-10-[contentView]-0-|" options:0 metrics:0 views:v17];
  [v18 addObjectsFromArray:v19];

  id v20 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|-[_segmentedControl]-|" options:0 metrics:0 views:v17];
  [v18 addObjectsFromArray:v20];

  long long v21 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|[contentView]|" options:0 metrics:0 views:v17];
  [v18 addObjectsFromArray:v21];

  [MEMORY[0x1E4F28DC8] activateConstraints:v18];
  id v22 = objc_alloc(MEMORY[0x1E4FB1D00]);
  [v10 frame];
  long long v23 = (UITableView *)objc_msgSend(v22, "initWithFrame:style:", 1);
  tableView = self->_tableView;
  self->_tableView = v23;

  [(UITableView *)self->_tableView setAutoresizingMask:18];
  [(UITableView *)self->_tableView setDataSource:self];
  [(UITableView *)self->_tableView setAllowsSelection:0];
  [v10 addSubview:self->_tableView];
  v25 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:@"Close" style:2 target:self action:sel__closeAction_];
  id v26 = [(PXDebugDictionaryViewController *)self navigationItem];
  [v26 setLeftBarButtonItem:v25];

  [(PXDebugDictionaryViewController *)self _switchLogsAction:0];
}

- (PXDebugDictionaryViewController)initWithDebugDictionary:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PXDebugDictionaryViewController;
  id v6 = [(PXDebugDictionaryViewController *)&v10 initWithNibName:0 bundle:0];
  int v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_debugDictionary, a3);
    id v8 = [v5 objectForKey:@"PXDiagnosticsTitle"];
    [(PXDebugDictionaryViewController *)v7 setTitle:v8];
  }
  return v7;
}

@end