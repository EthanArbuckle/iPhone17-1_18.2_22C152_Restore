@interface PUPhotoPickerFileSizeToolbarProvider
- (BOOL)shouldShowToolbar;
- (NSArray)toolbarItems;
- (PUPhotoPickerFileSizeToolbarProvider)initWithDataSource:(id)a3;
- (PUPhotoPickerFileSizeToolbarProviderDelegate)delegate;
- (id)_computeSelectedIndexPath;
- (id)_localizedLabelForResizeTaskDescriptor:(id)a3;
- (id)_orderedResizeTaskDescriptors;
- (id)_orderedResizeTaskDescriptorsForCurrentlySelectedAssets;
- (id)_sizePickerItem;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_presentSizePicker:(id)a3;
- (void)_updateSizePickerItemIfNeeded;
- (void)_updateTableViewSelection;
- (void)setDelegate:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation PUPhotoPickerFileSizeToolbarProvider

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_taskDescriptorsToCachedLabels, 0);
  objc_storeStrong((id *)&self->_selectedTaskDescriptor, 0);
  objc_storeStrong((id *)&self->_cachedAssetSet, 0);
  objc_storeStrong((id *)&self->_resizeTaskDescriptors, 0);
  objc_storeStrong((id *)&self->_toolbarItems, 0);
  objc_storeStrong((id *)&self->_sizePickerViewController, 0);
  objc_storeStrong((id *)&self->_sizePickerDescriptionLabel, 0);
  objc_storeStrong((id *)&self->_sizePickerItem, 0);
  objc_destroyWeak((id *)&self->_dataSource);
}

- (void)setDelegate:(id)a3
{
}

- (PUPhotoPickerFileSizeToolbarProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUPhotoPickerFileSizeToolbarProviderDelegate *)WeakRetained;
}

- (id)_computeSelectedIndexPath
{
  if (self->_selectedTaskDescriptor
    && (-[PUPhotoPickerFileSizeToolbarProvider _orderedResizeTaskDescriptorsForCurrentlySelectedAssets](self, "_orderedResizeTaskDescriptorsForCurrentlySelectedAssets"), v3 = objc_claimAutoreleasedReturnValue(), uint64_t v4 = [v3 indexOfObject:self->_selectedTaskDescriptor], v3, v4 != 0x7FFFFFFFFFFFFFFFLL))
  {
    v5 = [MEMORY[0x1E4F28D58] indexPathForRow:v4 inSection:0];
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)_updateTableViewSelection
{
  id v8 = [(UITableViewController *)self->_sizePickerViewController tableView];
  v3 = [(PUPhotoPickerFileSizeToolbarProvider *)self _computeSelectedIndexPath];
  if ([v8 numberOfRowsInSection:0])
  {
    unint64_t v4 = 0;
    do
    {
      if (v4 == [v3 row]) {
        uint64_t v5 = 3;
      }
      else {
        uint64_t v5 = 0;
      }
      v6 = [MEMORY[0x1E4F28D58] indexPathForRow:v4 inSection:0];
      v7 = [v8 cellForRowAtIndexPath:v6];
      [v7 setAccessoryType:v5];

      ++v4;
    }
    while (v4 < [v8 numberOfRowsInSection:0]);
  }
}

- (void)_updateSizePickerItemIfNeeded
{
  id v6 = [(PUPhotoPickerFileSizeToolbarProvider *)self _orderedResizeTaskDescriptorsForCurrentlySelectedAssets];
  if (!self->_selectedTaskDescriptor || (objc_msgSend(v6, "containsObject:") & 1) == 0)
  {
    v3 = [v6 lastObject];
    selectedTaskDescriptor = self->_selectedTaskDescriptor;
    self->_selectedTaskDescriptor = v3;
  }
  uint64_t v5 = [(PUPhotoPickerFileSizeToolbarProvider *)self _localizedLabelForResizeTaskDescriptor:self->_selectedTaskDescriptor];
  [(UILabel *)self->_sizePickerDescriptionLabel setText:v5];
}

- (id)_localizedLabelForResizeTaskDescriptor:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  id v6 = [WeakRetained selectedAssets];

  v7 = [MEMORY[0x1E4F1CAD0] setWithArray:v6];
  if (![(NSSet *)self->_cachedAssetSet isEqualToSet:v7])
  {
    taskDescriptorsToCachedLabels = self->_taskDescriptorsToCachedLabels;
    self->_taskDescriptorsToCachedLabels = 0;

    objc_storeStrong((id *)&self->_cachedAssetSet, v7);
  }
  v9 = [(NSMutableDictionary *)self->_taskDescriptorsToCachedLabels objectForKeyedSubscript:v4];
  if (!v9)
  {
    if (!self->_taskDescriptorsToCachedLabels)
    {
      v10 = [MEMORY[0x1E4F1CA60] dictionary];
      v11 = self->_taskDescriptorsToCachedLabels;
      self->_taskDescriptorsToCachedLabels = v10;
    }
    v9 = [v4 localizedDescriptionForAssets:v6];
    [(NSMutableDictionary *)self->_taskDescriptorsToCachedLabels setObject:v9 forKeyedSubscript:v4];
  }

  return v9;
}

- (void)_presentSizePicker:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = (UITableViewController *)[objc_alloc(MEMORY[0x1E4FB1D18]) initWithStyle:1];
    sizePickerViewController = self->_sizePickerViewController;
    self->_sizePickerViewController = v7;

    v9 = PULocalizedString(@"SIZE_PICKER_TITLE");
    v10 = [(UITableViewController *)self->_sizePickerViewController navigationItem];
    [v10 setTitle:v9];

    v11 = [(UITableViewController *)self->_sizePickerViewController tableView];
    [v11 setDataSource:self];

    v12 = [(UITableViewController *)self->_sizePickerViewController tableView];
    [v12 setDelegate:self];

    v13 = [(UITableViewController *)self->_sizePickerViewController tableView];
    [v13 registerClass:objc_opt_class() forCellReuseIdentifier:@"Size picker cell"];

    [(PUPhotoPickerFileSizeToolbarProvider *)self _updateTableViewSelection];
    self->_preparingToPresentSizePickerViewController = 1;
    id v14 = objc_loadWeakRetained((id *)p_delegate);
    [v14 photoPickerFileSizeToolbarProvider:self presentSizePickerViewController:self->_sizePickerViewController];

    self->_preparingToPresentSizePickerViewController = 0;
  }
}

- (id)_orderedResizeTaskDescriptorsForCurrentlySelectedAssets
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v3 = [(PUPhotoPickerFileSizeToolbarProvider *)self _orderedResizeTaskDescriptors];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  uint64_t v5 = [WeakRetained selectedAssets];

  if ([v5 count])
  {
    char v6 = [MEMORY[0x1E4F1CA80] set];
    v7 = [MEMORY[0x1E4F1CA48] array];
    id v8 = [v3 lastObject];
    uint64_t v9 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", objc_msgSend(v8, "estimatedSizeForAssets:", v5));
    v22 = v8;
    id v23 = v7;
    [v7 addObject:v8];
    v21 = (void *)v9;
    [v6 addObject:v9];
    uint64_t v10 = [v3 count];
    uint64_t v11 = v10 - 1;
    if (v10 != 1)
    {
      uint64_t v12 = 0;
      do
      {
        v13 = [v3 objectAtIndexedSubscript:v12];
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v14 = v5;
        uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v25;
          while (2)
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v25 != v17) {
                objc_enumerationMutation(v14);
              }
              if ([v13 appliesToAsset:*(void *)(*((void *)&v24 + 1) + 8 * i)])
              {
                v19 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", objc_msgSend(v13, "estimatedSizeForAssets:", v14));
                if (([v6 containsObject:v19] & 1) == 0)
                {
                  objc_msgSend(v23, "insertObject:atIndex:", v13, objc_msgSend(v23, "count") - 1);
                  [v6 addObject:v19];
                }

                goto LABEL_16;
              }
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
            if (v16) {
              continue;
            }
            break;
          }
        }
LABEL_16:

        ++v12;
      }
      while (v12 != v11);
    }
  }
  else
  {
    id v23 = v3;
  }

  return v23;
}

- (id)_orderedResizeTaskDescriptors
{
  v11[4] = *MEMORY[0x1E4F143B8];
  resizeTaskDescriptors = self->_resizeTaskDescriptors;
  if (!resizeTaskDescriptors)
  {
    id v4 = +[PUPhotoPickerResizeTaskDescriptor defaultSmallDescriptor];
    uint64_t v5 = +[PUPhotoPickerResizeTaskDescriptor defaultMediumDescriptor];
    char v6 = +[PUPhotoPickerResizeTaskDescriptor defaultLargeDescriptor];
    v7 = +[PUPhotoPickerResizeTaskDescriptor defaultActualSizeDescriptor];
    v11[0] = v6;
    v11[1] = v5;
    v11[2] = v4;
    v11[3] = v7;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:4];
    uint64_t v9 = self->_resizeTaskDescriptors;
    self->_resizeTaskDescriptors = v8;

    resizeTaskDescriptors = self->_resizeTaskDescriptors;
  }
  return resizeTaskDescriptors;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  [a3 deselectRowAtIndexPath:v6 animated:1];
  v7 = [(PUPhotoPickerFileSizeToolbarProvider *)self _orderedResizeTaskDescriptorsForCurrentlySelectedAssets];
  uint64_t v8 = [v6 row];

  uint64_t v9 = [v7 objectAtIndexedSubscript:v8];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    id v12 = objc_loadWeakRetained((id *)&self->_delegate);
    [v12 photoPickerFileSizeToolbarProvider:self didSelectResizeTaskDescriptor:v9];
  }
  selectedTaskDescriptor = self->_selectedTaskDescriptor;
  self->_selectedTaskDescriptor = v9;

  [(PUPhotoPickerFileSizeToolbarProvider *)self _updateTableViewSelection];
  [(PUPhotoPickerFileSizeToolbarProvider *)self _updateSizePickerItemIfNeeded];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(PUPhotoPickerFileSizeToolbarProvider *)self _orderedResizeTaskDescriptorsForCurrentlySelectedAssets];
  uint64_t v9 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));

  uint64_t v10 = [v7 dequeueReusableCellWithIdentifier:@"Size picker cell" forIndexPath:v6];

  char v11 = [v9 localizedDescription];
  id v12 = [v10 textLabel];
  [v12 setText:v11];

  return v10;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v4 = [(PUPhotoPickerFileSizeToolbarProvider *)self _orderedResizeTaskDescriptorsForCurrentlySelectedAssets];
  int64_t v5 = [v4 count];

  return v5;
}

- (id)_sizePickerItem
{
  v16[2] = *MEMORY[0x1E4F143B8];
  sizePickerItem = self->_sizePickerItem;
  if (!sizePickerItem)
  {
    id v4 = [MEMORY[0x1E4FB08E0] systemFontOfSize:13.0];
    int64_t v5 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
    id v6 = PULocalizedString(@"SIZE_PICKER_CHOOSE_SIZE");
    [v5 setTitle:v6 forState:0];

    id v7 = [v5 titleLabel];
    [v7 setFont:v4];

    objc_msgSend(v5, "_setTouchInsets:", -12.0, -12.0, -12.0, -12.0);
    [v5 addTarget:self action:sel__presentSizePicker_ forControlEvents:64];
    uint64_t v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    sizePickerDescriptionLabel = self->_sizePickerDescriptionLabel;
    self->_sizePickerDescriptionLabel = v8;

    [(UILabel *)self->_sizePickerDescriptionLabel setFont:v4];
    id v10 = objc_alloc(MEMORY[0x1E4FB1C60]);
    v16[0] = self->_sizePickerDescriptionLabel;
    v16[1] = v5;
    char v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
    id v12 = (void *)[v10 initWithArrangedSubviews:v11];

    [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v12 setAxis:1];
    [v12 setDistribution:0];
    [v12 setAlignment:3];
    [v12 setLayoutMarginsRelativeArrangement:1];
    objc_msgSend(v12, "setLayoutMargins:", 3.0, 0.0, -3.0, 0.0);
    [v12 setBaselineRelativeArrangement:1];
    [v12 setSpacing:19.0];
    v13 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:v12];
    id v14 = self->_sizePickerItem;
    self->_sizePickerItem = v13;

    sizePickerItem = self->_sizePickerItem;
  }
  return sizePickerItem;
}

- (NSArray)toolbarItems
{
  v13[3] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  int v4 = [WeakRetained isAnyAssetSelected];

  if (v4)
  {
    toolbarItems = self->_toolbarItems;
    if (toolbarItems)
    {
      id v6 = toolbarItems;
    }
    else
    {
      id v7 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:5 target:0 action:0];
      uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:5 target:0 action:0];
      uint64_t v9 = [(PUPhotoPickerFileSizeToolbarProvider *)self _sizePickerItem];
      v13[1] = v9;
      v13[2] = v8;
      id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:3];
      char v11 = self->_toolbarItems;
      self->_toolbarItems = v10;

      id v6 = self->_toolbarItems;
    }
  }
  else
  {
    id v6 = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  [(PUPhotoPickerFileSizeToolbarProvider *)self _updateSizePickerItemIfNeeded];
  return v6;
}

- (BOOL)shouldShowToolbar
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v3 = [(UITableViewController *)self->_sizePickerViewController navigationController];
  if (self->_preparingToPresentSizePickerViewController) {
    goto LABEL_4;
  }
  int v4 = [(UITableViewController *)self->_sizePickerViewController presentingViewController];
  if (v4)
  {

    goto LABEL_4;
  }
  if (v3)
  {
    id v7 = [v3 topViewController];
    sizePickerViewController = self->_sizePickerViewController;

    if (v7 == sizePickerViewController) {
      goto LABEL_4;
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  id v10 = [WeakRetained sessionInfo];
  if (([v10 showsFileSizePicker] & 1) == 0)
  {

    goto LABEL_4;
  }
  id v11 = objc_loadWeakRetained((id *)&self->_dataSource);
  int v12 = [v11 isAnyAssetSelected];

  if (!v12)
  {
LABEL_4:
    BOOL v5 = 0;
    goto LABEL_5;
  }
  id v13 = objc_loadWeakRetained((id *)&self->_dataSource);
  if (objc_opt_respondsToSelector())
  {
    id v14 = objc_loadWeakRetained((id *)&self->_dataSource);
    char v15 = [v14 isAnyAssetDownloading];

    if (v15) {
      goto LABEL_4;
    }
  }
  else
  {
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v16 = objc_loadWeakRetained((id *)&self->_dataSource);
  uint64_t v17 = objc_msgSend(v16, "selectedAssets", 0);

  uint64_t v18 = [v17 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v24;
    while (2)
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v24 != v20) {
          objc_enumerationMutation(v17);
        }
        if (!+[PUPhotoPickerScaledFileSizeEstimator isAssetResizable:*(void *)(*((void *)&v23 + 1) + 8 * i)])
        {

          goto LABEL_4;
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v19) {
        continue;
      }
      break;
    }
  }

  v22 = [(PUPhotoPickerFileSizeToolbarProvider *)self _orderedResizeTaskDescriptorsForCurrentlySelectedAssets];
  BOOL v5 = (unint64_t)[v22 count] > 1;

LABEL_5:
  return v5;
}

- (PUPhotoPickerFileSizeToolbarProvider)initWithDataSource:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PUPhotoPickerFileSizeToolbarProvider;
  BOOL v5 = [(PUPhotoPickerFileSizeToolbarProvider *)&v8 init];
  id v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_dataSource, v4);
  }

  return v6;
}

@end