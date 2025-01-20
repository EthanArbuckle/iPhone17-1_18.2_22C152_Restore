@interface PUBehavioralCurationCheckAssetBrowserDebugViewController
- (BOOL)shouldShowToolbar;
- (double)pickerView:(id)a3 rowHeightForComponent:(int64_t)a4;
- (double)semanticScoreFromBehavioralScore:(double)a3;
- (id)_goldAssetUUIDs;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)newToolbarItems;
- (id)phScoreKeyPathsForSelectionName:(id)a3;
- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5;
- (id)predicateForSelectionName:(id)a3;
- (id)selectionNames;
- (id)sortDescriptorForSelectionName:(id)a3;
- (int64_t)numberOfComponentsInPickerView:(id)a3;
- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4;
- (void)_doneEditingSettings:(id)a3;
- (void)_editSettings:(id)a3;
- (void)_update;
- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PUBehavioralCurationCheckAssetBrowserDebugViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortPickerView, 0);
  objc_storeStrong((id *)&self->_scorePickerView, 0);
  objc_storeStrong((id *)&self->_selectionName, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  v7 = (UIPickerView *)a3;
  v11 = v7;
  if (self->_scorePickerView == v7)
  {
    v8 = [(PUBehavioralCurationCheckAssetBrowserDebugViewController *)self selectionNames];
    v9 = [v8 objectAtIndexedSubscript:a4];
    selectionName = self->_selectionName;
    self->_selectionName = v9;
  }
  else if (self->_sortPickerView == v7)
  {
    self->_sortAscending = a4 == 0;
  }
  [(PUBehavioralCurationCheckAssetBrowserDebugViewController *)self _update];
}

- (double)pickerView:(id)a3 rowHeightForComponent:(int64_t)a4
{
  return 20.0;
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  v7 = (UIPickerView *)a3;
  v8 = v7;
  if (self->_scorePickerView == v7)
  {
    v10 = [(PUBehavioralCurationCheckAssetBrowserDebugViewController *)self selectionNames];
    v9 = [v10 objectAtIndexedSubscript:a4];
  }
  else if (self->_sortPickerView == v7)
  {
    v11 = @"Descending";
    if (!a4) {
      v11 = @"Ascending";
    }
    v9 = v11;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  if (self->_scorePickerView != a3) {
    return 2 * (self->_sortPickerView == a3);
  }
  v5 = [(PUBehavioralCurationCheckAssetBrowserDebugViewController *)self selectionNames];
  int64_t v6 = [v5 count];

  return v6;
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (double)semanticScoreFromBehavioralScore:(double)a3
{
  return fmod(a3, 0.1) * 100.0;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  v30.receiver = self;
  v30.super_class = (Class)PUBehavioralCurationCheckAssetBrowserDebugViewController;
  v7 = [(PUPhotosGridViewController *)&v30 collectionView:a3 cellForItemAtIndexPath:v6];
  v8 = [(PUBehavioralCurationCheckAssetBrowserDebugViewController *)self phScoreKeyPathsForSelectionName:self->_selectionName];
  if ([v8 count] == 1)
  {
    v9 = [(PUPhotosAlbumViewController *)self assetCollectionAssets];
    v10 = objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v6, "item"));
    v11 = [v8 firstObject];
    v12 = [v10 valueForKeyPath:v11];
    [v12 doubleValue];
    uint64_t v14 = v13;

    [NSString stringWithFormat:@"%.2f", v14, v29];
  }
  else
  {
    if ([v8 count] != 2) {
      goto LABEL_6;
    }
    v15 = [(PUPhotosAlbumViewController *)self assetCollectionAssets];
    v16 = objc_msgSend(v15, "objectAtIndex:", objc_msgSend(v6, "item"));
    v17 = [v8 firstObject];
    v18 = [v16 valueForKeyPath:v17];
    [v18 doubleValue];
    uint64_t v20 = v19;

    v21 = [(PUPhotosAlbumViewController *)self assetCollectionAssets];
    v22 = objc_msgSend(v21, "objectAtIndex:", objc_msgSend(v6, "item"));
    v23 = [v8 objectAtIndexedSubscript:1];
    v24 = [v22 valueForKeyPath:v23];
    [v24 doubleValue];
    uint64_t v26 = v25;

    [NSString stringWithFormat:@"✨%.1f❤%.2f", v20, v26];
  v27 = };
  [v7 setScore:v27];

LABEL_6:
  return v7;
}

- (id)phScoreKeyPathsForSelectionName:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Gold Assets 🏅"])
  {
    v4 = &unk_1F078B5B8;
  }
  else if (([v3 isEqualToString:@"Shiny Gem Assets ✨💎"] & 1) != 0 {
         || [v3 isEqualToString:@"Gem Assets 💎"])
  }
  {
    v4 = &unk_1F078B5D0;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)sortDescriptorForSelectionName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"Gold Assets 🏅"])
  {
    v5 = @"computedAttributes.interactionScore";
LABEL_6:
    id v6 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:v5 ascending:self->_sortAscending];
    goto LABEL_7;
  }
  if (([v4 isEqualToString:@"Shiny Gem Assets ✨💎"] & 1) != 0
    || [v4 isEqualToString:@"Gem Assets 💎"])
  {
    v5 = @"computedAttributes.behavioralScore";
    goto LABEL_6;
  }
  id v6 = 0;
LABEL_7:

  return v6;
}

- (id)predicateForSelectionName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"Gold Assets 🏅"])
  {
    v5 = (void *)MEMORY[0x1E4F28F60];
    id v6 = [(PUBehavioralCurationCheckAssetBrowserDebugViewController *)self _goldAssetUUIDs];
    v7 = [v5 predicateWithFormat:@"uuid IN %@", v6];

    goto LABEL_9;
  }
  if ([v4 isEqualToString:@"Shiny Gem Assets ✨💎"])
  {
    objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(computedAttributes.behavioralScore >= %f)", 0x3FECCCCCC0000000, v9);
    v7 = LABEL_7:;
    goto LABEL_9;
  }
  if ([v4 isEqualToString:@"Gem Assets 💎"])
  {
    objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(computedAttributes.behavioralScore < %f AND computedAttributes.behavioralScore >= %f)", 0x3FECCCCCC0000000, 0x3FE6666660000000);
    goto LABEL_7;
  }
  v7 = 0;
LABEL_9:

  return v7;
}

- (id)_goldAssetUUIDs
{
  v2 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  id v3 = [v2 urlForApplicationDataFolderIdentifier:1];

  id v4 = [v3 URLByAppendingPathComponent:@"PGUserBehaviorPreviousResults.plist"];
  if (v4)
  {
    id v10 = 0;
    v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v4 error:&v10];
    id v6 = v10;
    if (v6)
    {
      id v7 = v6;

      v8 = (void *)MEMORY[0x1E4F1CBF0];
      v5 = v7;
    }
    else
    {
      v8 = [v5 objectForKeyedSubscript:@"goldAssetUUIDs"];
    }
  }
  else
  {
    v8 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v8;
}

- (id)selectionNames
{
  v4[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"Gold Assets 🏅";
  v4[1] = @"Shiny Gem Assets ✨💎";
  v4[2] = @"Gem Assets 💎";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:3];
  return v2;
}

- (void)_doneEditingSettings:(id)a3
{
}

- (void)_editSettings:(id)a3
{
  id v29 = objc_alloc_init(MEMORY[0x1E4FB1EC0]);
  id v4 = [v29 view];
  v5 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  id v6 = [v5 colorWithAlphaComponent:0.75];
  [v4 setBackgroundColor:v6];

  id v7 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  [v4 bounds];
  uint64_t v9 = objc_msgSend(v7, "initWithFrame:", 10.0, 10.0, v8 + -20.0, 100.0);
  [v9 setAutoresizingMask:34];
  id v10 = [v9 layer];
  [v10 setCornerRadius:6.0];

  v11 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
  [v9 setBackgroundColor:v11];

  [v4 addSubview:v9];
  [v9 bounds];
  double v13 = v12 + -20.0 + -20.0 + -90.0;
  uint64_t v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB14D0]), "initWithFrame:", 20.0, 20.0, 90.0, 60.0);
  [v14 setAutoresizingMask:36];
  [v14 setTitle:@"Done" forState:0];
  v15 = [MEMORY[0x1E4FB1618] blueColor];
  [v14 setTitleColor:v15 forState:0];

  [v14 addTarget:self action:sel__doneEditingSettings_ forControlEvents:0xFFFFFFFFLL];
  [v9 addSubview:v14];
  [v14 sizeToFit];
  v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", 20.0, 90.0, 90.0, 60.0);
  [v16 setAutoresizingMask:36];
  [v16 setText:@"Score:"];
  [v9 addSubview:v16];
  v17 = (UIPickerView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1A98]), "initWithFrame:", 110.0, 90.0, v13, 60.0);
  scorePickerView = self->_scorePickerView;
  self->_scorePickerView = v17;

  uint64_t v19 = [(UIPickerView *)self->_scorePickerView layer];
  [v19 setCornerRadius:6.0];

  uint64_t v20 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [(UIPickerView *)self->_scorePickerView setBackgroundColor:v20];

  [(UIPickerView *)self->_scorePickerView setDataSource:self];
  [(UIPickerView *)self->_scorePickerView setDelegate:self];
  v21 = [(PUBehavioralCurationCheckAssetBrowserDebugViewController *)self selectionNames];
  uint64_t v22 = [v21 indexOfObject:self->_selectionName];

  [(UIPickerView *)self->_scorePickerView selectRow:v22 inComponent:0 animated:0];
  [v9 addSubview:self->_scorePickerView];
  v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", 20.0, 160.0, 90.0, 60.0);
  [v23 setAutoresizingMask:36];
  [v23 setText:@"Sort:"];
  [v9 addSubview:v23];
  v24 = (UIPickerView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1A98]), "initWithFrame:", 110.0, 160.0, v13, 60.0);
  sortPickerView = self->_sortPickerView;
  self->_sortPickerView = v24;

  uint64_t v26 = [(UIPickerView *)self->_sortPickerView layer];
  [v26 setCornerRadius:6.0];

  v27 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [(UIPickerView *)self->_sortPickerView setBackgroundColor:v27];

  [(UIPickerView *)self->_sortPickerView setDataSource:self];
  [(UIPickerView *)self->_sortPickerView setDelegate:self];
  [(UIPickerView *)self->_sortPickerView selectRow:!self->_sortAscending inComponent:0 animated:0];
  [v9 addSubview:self->_sortPickerView];
  [v4 bounds];
  objc_msgSend(v9, "setFrame:", 10.0, 10.0, v28 + -20.0, 230.0);
  [(PUBehavioralCurationCheckAssetBrowserDebugViewController *)self setModalPresentationStyle:7];
  [(PUBehavioralCurationCheckAssetBrowserDebugViewController *)self presentViewController:v29 animated:1 completion:0];
}

- (void)_update
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  id v4 = [v3 librarySpecificFetchOptions];

  v5 = [(PUBehavioralCurationCheckAssetBrowserDebugViewController *)self predicateForSelectionName:self->_selectionName];
  [v4 setInternalPredicate:v5];
  id v6 = [(PUBehavioralCurationCheckAssetBrowserDebugViewController *)self sortDescriptorForSelectionName:self->_selectionName];
  v19[0] = v6;
  id v7 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:1];
  v19[1] = v7;
  double v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
  [v4 setInternalSortDescriptors:v8];

  uint64_t v18 = *MEMORY[0x1E4F39458];
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
  [v4 setFetchPropertySets:v9];

  id v10 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v4];
  v11 = [MEMORY[0x1E4F38EE8] transientAssetCollectionWithAssetFetchResult:v10 title:self->_selectionName];
  double v12 = (void *)MEMORY[0x1E4F39008];
  v17 = v11;
  double v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
  uint64_t v14 = [v11 localizedTitle];
  v15 = [v12 transientCollectionListWithCollections:v13 title:v14];

  v16 = [MEMORY[0x1E4F38FF8] fetchCollectionsInCollectionList:v15 options:0];
  [(PUPhotosAlbumViewController *)self setAssetCollection:v11 fetchResultContainingAssetCollection:v16 filterPredicate:0];
}

- (id)newToolbarItems
{
  v7[3] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:5 target:0 action:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:2 target:self action:sel__editSettings_];
  v7[0] = v3;
  v7[1] = v4;
  v7[2] = v3;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

- (BOOL)shouldShowToolbar
{
  return 1;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PUBehavioralCurationCheckAssetBrowserDebugViewController;
  [(PUPhotosGridViewController *)&v4 viewWillAppear:a3];
  [(PUBehavioralCurationCheckAssetBrowserDebugViewController *)self _update];
}

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)PUBehavioralCurationCheckAssetBrowserDebugViewController;
  [(PUPhotosAlbumViewController *)&v10 viewDidLoad];
  id v3 = [(PUBehavioralCurationCheckAssetBrowserDebugViewController *)self navigationItem];
  [v3 setLeftItemsSupplementBackButton:1];

  [(PUBehavioralCurationCheckAssetBrowserDebugViewController *)self setDefinesPresentationContext:1];
  objc_super v4 = [(PUBehavioralCurationCheckAssetBrowserDebugViewController *)self collectionView];
  [v4 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"PUPhotoCell"];

  v5 = [(PUBehavioralCurationCheckAssetBrowserDebugViewController *)self selectionNames];
  id v6 = [v5 firstObject];
  selectionName = self->_selectionName;
  self->_selectionName = v6;

  double v8 = [(PUBehavioralCurationCheckAssetBrowserDebugViewController *)self predicateForSelectionName:self->_selectionName];
  predicate = self->_predicate;
  self->_predicate = v8;

  [(PUBehavioralCurationCheckAssetBrowserDebugViewController *)self _update];
}

@end