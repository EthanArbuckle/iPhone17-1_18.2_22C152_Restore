@interface PXSuggestersDebugViewController
- (PXSuggestersDebugViewController)initWithOptions:(id)a3;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_fetchSuggesters;
- (void)configureCell:(id)a3 withItem:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation PXSuggestersDebugViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

- (void)_fetchSuggesters
{
  v26[1] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F39310];
  options = self->_options;
  v5 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  v6 = [v3 availableSuggestionTypeInfosWithOptions:options photoLibrary:v5];

  v7 = [v6 allValues];
  v8 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:1];
  v26[0] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
  v10 = [v7 sortedArrayUsingDescriptors:v9];

  v11 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v10, "count"));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v22;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v21 + 1) + 8 * v16);
        v18 = [PXSuggestersDebugCollectionItem alloc];
        v19 = -[PXSuggestersDebugCollectionItem initWithSuggesterInfo:](v18, "initWithSuggesterInfo:", v17, (void)v21);
        [(NSArray *)v11 addObject:v19];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v14);
  }

  items = self->_items;
  self->_items = v11;
}

- (void)configureCell:(id)a3 withItem:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v13 = [v6 textLabel];
  v7 = [v5 name];
  v8 = [v7 stringByReplacingOccurrencesOfString:@"\n" withString:&stru_1F00B0030];

  [v13 setText:v8];
  v9 = [MEMORY[0x1E4FB1618] labelColor];
  [v13 setTextColor:v9];

  v10 = [v6 detailTextLabel];

  v11 = [v5 description];

  [v10 setText:v11];
  id v12 = [MEMORY[0x1E4FB1618] labelColor];
  [v10 setTextColor:v12];

  [v10 sizeToFit];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v7 = [a3 dequeueReusableCellWithIdentifier:@"SuggestersDebugTableViewCellIdentifier"];
  if (!v7)
  {
    v7 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:3 reuseIdentifier:@"SuggestersDebugTableViewCellIdentifier"];
    v8 = [v7 detailTextLabel];
    [v8 setNumberOfLines:2];

    v9 = [v7 detailTextLabel];
    [v9 setLineBreakMode:0];
  }
  v10 = -[NSArray objectAtIndexedSubscript:](self->_items, "objectAtIndexedSubscript:", [v6 row]);
  [(PXSuggestersDebugViewController *)self configureCell:v7 withItem:v10];

  return v7;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(NSArray *)self->_items count];
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  v4 = -[NSArray objectAtIndexedSubscript:](self->_items, "objectAtIndexedSubscript:", objc_msgSend(a4, "row", a3));
  id v5 = [v4 description];
  uint64_t v6 = [v5 rangeOfString:@"\n"];

  if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
    double v7 = 44.0;
  }
  else {
    double v7 = 66.0;
  }

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  -[NSArray objectAtIndexedSubscript:](self->_items, "objectAtIndexedSubscript:", objc_msgSend(a4, "row", a3));
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [PXSuggesterDebugViewController alloc];
  uint64_t v6 = [v10 name];
  double v7 = [v10 info];
  v8 = [(PXSuggesterDebugViewController *)v5 initWithName:v6 options:v7];

  v9 = [(PXSuggestersDebugViewController *)self navigationController];
  [v9 pushViewController:v8 animated:1];
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)PXSuggestersDebugViewController;
  [(PXSuggestersDebugViewController *)&v6 viewDidLoad];
  v3 = [(PXSuggestersDebugViewController *)self navigationItem];
  [v3 setTitle:@"Suggesters"];

  v4 = [(PXSuggestersDebugViewController *)self navigationController];
  [v4 setToolbarHidden:0 animated:1];

  id v5 = [(PXSuggestersDebugViewController *)self tableView];
  [v5 setEstimatedRowHeight:44.0];

  [(PXSuggestersDebugViewController *)self _fetchSuggesters];
}

- (PXSuggestersDebugViewController)initWithOptions:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXSuggestersDebugViewController;
  objc_super v6 = [(PXSuggestersDebugViewController *)&v9 init];
  double v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_options, a3);
  }

  return v7;
}

@end