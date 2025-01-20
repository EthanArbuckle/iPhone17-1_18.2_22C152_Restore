@interface PUParallaxLayerStackDebugStyleTableViewController
- (PUParallaxLayerStackViewModel)viewModel;
- (PUParallaxLayerStackViewModelUpdater)viewModelUpdater;
- (id)availableStyles;
- (id)indexPathForStyle:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)cellValueUpdated:(id)a3;
- (void)setViewModel:(id)a3;
- (void)setViewModelUpdater:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation PUParallaxLayerStackDebugStyleTableViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModelUpdater, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_cachedAvailableStyles, 0);
}

- (void)setViewModelUpdater:(id)a3
{
}

- (PUParallaxLayerStackViewModelUpdater)viewModelUpdater
{
  return self->_viewModelUpdater;
}

- (void)setViewModel:(id)a3
{
}

- (PUParallaxLayerStackViewModel)viewModel
{
  return self->_viewModel;
}

- (void)cellValueUpdated:(id)a3
{
  id v4 = a3;
  if ([v4 accessoryType] == 3)
  {
    v5 = [v4 styleKind];
    v6 = [(PUParallaxLayerStackDebugStyleTableViewController *)self availableStyles];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __70__PUParallaxLayerStackDebugStyleTableViewController_cellValueUpdated___block_invoke;
    v21[3] = &unk_1E5F27D70;
    id v22 = v5;
    id v7 = v5;
    uint64_t v8 = [v6 indexOfObjectPassingTest:v21];

    v9 = [(PUParallaxLayerStackDebugStyleTableViewController *)self availableStyles];
    v10 = [v9 objectAtIndexedSubscript:v8];

    v11 = [MEMORY[0x1E4F8A340] styleWithBakedStyle:v10];
    [v4 applyToStyle:v11];
    v12 = [(PUParallaxLayerStackDebugStyleTableViewController *)self viewModel];
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    v18 = __70__PUParallaxLayerStackDebugStyleTableViewController_cellValueUpdated___block_invoke_2;
    v19 = &unk_1E5F2E420;
    id v20 = v11;
    id v13 = v11;
    [v12 performChanges:&v16];

    v14 = [(PUParallaxLayerStackDebugStyleTableViewController *)self viewModelUpdater];
    v15 = [(PUParallaxLayerStackDebugStyleTableViewController *)self viewModel];
    [v14 renderOnscreenModelAfterStyleChange:v15];
  }
}

uint64_t __70__PUParallaxLayerStackDebugStyleTableViewController_cellValueUpdated___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 kind];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __70__PUParallaxLayerStackDebugStyleTableViewController_cellValueUpdated___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setStyle:*(void *)(a1 + 32)];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v7 = [(PUParallaxLayerStackViewModel *)self->_viewModel style];
  uint64_t v8 = [(PUParallaxLayerStackDebugStyleTableViewController *)self indexPathForStyle:v7];
  if ([v6 isEqual:v8])
  {
    [v13 deselectRowAtIndexPath:v6 animated:1];
  }
  else
  {
    v9 = [v13 cellForRowAtIndexPath:v8];
    [v9 setAccessoryType:0];

    v10 = [v13 cellForRowAtIndexPath:v6];
    [v10 setAccessoryType:3];

    [v13 deselectRowAtIndexPath:v6 animated:1];
    v11 = [(PUParallaxLayerStackDebugStyleTableViewController *)self tableView];
    v12 = [v11 cellForRowAtIndexPath:v6];

    [(PUParallaxLayerStackDebugStyleTableViewController *)self cellValueUpdated:v12];
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [a3 dequeueReusableCellWithIdentifier:@"styleCell" forIndexPath:v6];
  uint64_t v8 = [MEMORY[0x1E4FB1948] cellConfiguration];
  v9 = [(PUParallaxLayerStackDebugStyleTableViewController *)self availableStyles];
  v10 = objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));

  v11 = [(PUParallaxLayerStackViewModel *)self->_viewModel style];
  v12 = [(PUParallaxLayerStackDebugStyleTableViewController *)self indexPathForStyle:v11];
  id v13 = [v10 kind];
  [v8 setText:v13];

  v14 = [(PUParallaxLayerStackViewModel *)self->_viewModel segmentationItem];
  v15 = [v14 availableStyles];
  id v16 = v10;
  uint64_t v17 = PFFind();

  if (!v17)
  {
    v18 = [v8 text];
    v19 = [v18 stringByAppendingString:@" (not suggested)"];
    [v8 setText:v19];
  }
  [v7 setContentConfiguration:v8];
  [v7 setStyleCellDelegate:self];
  if ([v12 isEqual:v6])
  {
    [v7 rebuildControlsViewForStyle:v11];
    [v7 setAccessoryType:3];
  }
  else
  {
    id v20 = [MEMORY[0x1E4F8A340] styleWithBakedStyle:v16];
    [v7 rebuildControlsViewForStyle:v20];
    [v7 setAccessoryType:0];
  }
  return v7;
}

uint64_t __85__PUParallaxLayerStackDebugStyleTableViewController_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 kind];
  uint64_t v4 = [*(id *)(a1 + 32) kind];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t v4 = [(PUParallaxLayerStackDebugStyleTableViewController *)self availableStyles];
  int64_t v5 = [v4 count];

  return v5;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (id)indexPathForStyle:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PUParallaxLayerStackDebugStyleTableViewController.m", 246, @"Invalid parameter not satisfying: %@", @"style" object file lineNumber description];
  }
  id v6 = [(PUParallaxLayerStackDebugStyleTableViewController *)self availableStyles];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __71__PUParallaxLayerStackDebugStyleTableViewController_indexPathForStyle___block_invoke;
  v12[3] = &unk_1E5F27D70;
  id v13 = v5;
  id v7 = v5;
  uint64_t v8 = [v6 indexOfObjectPassingTest:v12];

  v9 = [MEMORY[0x1E4F28D58] indexPathForRow:v8 inSection:0];

  return v9;
}

uint64_t __71__PUParallaxLayerStackDebugStyleTableViewController_indexPathForStyle___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 kind];
  uint64_t v4 = [*(id *)(a1 + 32) kind];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

- (id)availableStyles
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  cachedAvailableStyles = self->_cachedAvailableStyles;
  if (!cachedAvailableStyles)
  {
    uint64_t v5 = [(PUParallaxLayerStackViewModel *)self->_viewModel segmentationItem];

    if (!v5)
    {
      id v22 = [MEMORY[0x1E4F28B00] currentHandler];
      [v22 handleFailureInMethod:a2 object:self file:@"PUParallaxLayerStackDebugStyleTableViewController.m" lineNumber:229 description:@"editing requires a segmentation item"];
    }
    id v6 = [(PUParallaxLayerStackViewModel *)self->_viewModel segmentationItem];
    id v7 = [v6 colorAnalysis];

    if (!v7)
    {
      v23 = [MEMORY[0x1E4F28B00] currentHandler];
      [v23 handleFailureInMethod:a2 object:self file:@"PUParallaxLayerStackDebugStyleTableViewController.m" lineNumber:230 description:@"editing requires color analysis"];
    }
    uint64_t v8 = [(PUParallaxLayerStackViewModel *)self->_viewModel segmentationItem];
    v9 = [v8 availableStyles];

    if (!v9)
    {
      v24 = [MEMORY[0x1E4F28B00] currentHandler];
      [v24 handleFailureInMethod:a2 object:self file:@"PUParallaxLayerStackDebugStyleTableViewController.m" lineNumber:231 description:@"expected available styles"];
    }
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v11 = PFParallaxLayerStyleSupportedKinds();
    uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v26;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v26 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v25 + 1) + 8 * v15);
          uint64_t v17 = [(PUParallaxLayerStackViewModel *)self->_viewModel segmentationItem];
          v18 = [v17 defaultStyleOfKind:v16];

          [v10 addObject:v18];
          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v13);
    }

    v19 = (NSArray *)[v10 copy];
    id v20 = self->_cachedAvailableStyles;
    self->_cachedAvailableStyles = v19;

    cachedAvailableStyles = self->_cachedAvailableStyles;
  }
  return cachedAvailableStyles;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)PUParallaxLayerStackDebugStyleTableViewController;
  [(PUParallaxLayerStackDebugStyleTableViewController *)&v4 viewDidLoad];
  v3 = [(PUParallaxLayerStackDebugStyleTableViewController *)self tableView];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"styleCell"];
}

@end