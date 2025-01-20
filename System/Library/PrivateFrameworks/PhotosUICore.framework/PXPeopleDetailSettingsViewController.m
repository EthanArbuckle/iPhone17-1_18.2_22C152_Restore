@interface PXPeopleDetailSettingsViewController
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForFooterInSection:(int64_t)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (NSArray)personDetectionTypes;
- (PXPeopleDetailSettingsViewController)init;
- (PXPeopleDetailSettingsViewController)initWithDataSourceReloadBlock:(id)a3;
- (PXPeopleDetailSettingsViewController)initWithPersonDetectionType:(signed __int16)a3;
- (PXPeoplePersonDataSource)dataSource;
- (PXPeopleSuggestionDataSource)suggestionDataSource;
- (UICollectionView)collectionView;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)infoForPerson:(id)a3;
- (id)stringFromFaceCropType:(signed __int16)a3;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)commonInit;
- (void)commonInitWithDataSourceReloadBlock:(id)a3;
- (void)fileVURadar:(id)a3;
- (void)loadSuggestionsForPerson:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setPersonDetectionTypes:(id)a3;
- (void)setSuggestionDataSource:(id)a3;
- (void)toggle_selectDuplicatesMode:(id)a3;
- (void)viewDidLoad;
@end

@implementation PXPeopleDetailSettingsViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personDetectionTypes, 0);
  objc_storeStrong((id *)&self->_suggestionDataSource, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_previousLeftBarButtonItem, 0);
  objc_storeStrong((id *)&self->_selectedIndexPaths, 0);
}

- (void)setPersonDetectionTypes:(id)a3
{
}

- (NSArray)personDetectionTypes
{
  return self->_personDetectionTypes;
}

- (void)setSuggestionDataSource:(id)a3
{
}

- (PXPeopleSuggestionDataSource)suggestionDataSource
{
  return self->_suggestionDataSource;
}

- (void)setCollectionView:(id)a3
{
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setDataSource:(id)a3
{
}

- (PXPeoplePersonDataSource)dataSource
{
  return self->_dataSource;
}

- (void)loadSuggestionsForPerson:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 item];
  v6 = [(PXPeopleDetailSettingsViewController *)self dataSource];
  v7 = [v6 personAtIndex:v5];
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__241777;
  v22[4] = __Block_byref_object_dispose__241778;
  id v23 = 0;
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
  v9 = [(PXPeopleDetailSettingsViewController *)self collectionView];
  v10 = [v9 traitCollection];
  [v10 displayScale];
  double v12 = v11;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __65__PXPeopleDetailSettingsViewController_loadSuggestionsForPerson___block_invoke;
  v19[3] = &unk_1E5DC9BD0;
  v21 = v22;
  v13 = v8;
  v20 = v13;
  objc_msgSend(v6, "imageAtIndex:targetSize:displayScale:resultHandler:", v5, v19, 110.0, 110.0, v12);

  dispatch_time_t v14 = dispatch_time(0, 20000000000);
  dispatch_semaphore_wait(v13, v14);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __65__PXPeopleDetailSettingsViewController_loadSuggestionsForPerson___block_invoke_2;
  v16[3] = &unk_1E5DD32A8;
  id v17 = v7;
  v18 = self;
  id v15 = v7;
  dispatch_async(MEMORY[0x1E4F14428], v16);

  _Block_object_dispose(v22, 8);
}

void __65__PXPeopleDetailSettingsViewController_loadSuggestionsForPerson___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __65__PXPeopleDetailSettingsViewController_loadSuggestionsForPerson___block_invoke_2(uint64_t a1)
{
  v3 = [[PXPeopleDetailSettingsSuggestionViewController alloc] initWithPerson:*(void *)(a1 + 32)];
  v2 = [*(id *)(a1 + 40) navigationController];
  [v2 pushViewController:v3 animated:1];
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (self->_selectDuplicatesMode)
  {
    char v8 = [(NSMutableSet *)self->_selectedIndexPaths containsObject:v7];
    selectedIndexPaths = self->_selectedIndexPaths;
    if (v8) {
      [(NSMutableSet *)selectedIndexPaths removeObject:v7];
    }
    else {
      [(NSMutableSet *)selectedIndexPaths addObject:v7];
    }
    v14[0] = v7;
    double v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    [v6 reloadItemsAtIndexPaths:v11];
  }
  else
  {
    v10 = dispatch_get_global_queue(25, 0);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __80__PXPeopleDetailSettingsViewController_collectionView_didSelectItemAtIndexPath___block_invoke;
    v12[3] = &unk_1E5DD32A8;
    v12[4] = self;
    id v13 = v7;
    dispatch_async(v10, v12);
  }
}

uint64_t __80__PXPeopleDetailSettingsViewController_collectionView_didSelectItemAtIndexPath___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) loadSuggestionsForPerson:*(void *)(a1 + 40)];
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  double v5 = 10.0;
  double v6 = 0.0;
  double v7 = 10.0;
  double v8 = 2.0;
  result.right = v8;
  result.bottom = v7;
  result.left = v6;
  result.top = v5;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForFooterInSection:(int64_t)a5
{
  [a3 bounds];
  double v6 = v5;
  double v7 = 10.0;
  result.height = v7;
  result.width = v6;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  [a3 bounds];
  double v6 = v5;
  double v7 = 10.0;
  result.height = v7;
  result.width = v6;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  double v5 = 110.0;
  double v6 = 110.0;
  result.height = v6;
  result.width = v5;
  return result;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [v7 dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:v6];
  uint64_t v9 = [v8 tag] + 1;
  [v8 setTag:v9];
  v10 = [(PXPeopleDetailSettingsViewController *)self dataSource];
  uint64_t v11 = [v6 item];
  double v12 = [v7 traitCollection];

  [v12 displayScale];
  double v14 = v13;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __78__PXPeopleDetailSettingsViewController_collectionView_cellForItemAtIndexPath___block_invoke;
  v35[3] = &unk_1E5DCDF50;
  id v15 = v8;
  id v36 = v15;
  uint64_t v37 = v9;
  objc_msgSend(v10, "imageAtIndex:targetSize:displayScale:resultHandler:", v11, v35, 110.0, 110.0, v14);

  v16 = [(PXPeopleDetailSettingsViewController *)self dataSource];
  id v17 = [v16 personAtIndex:v11];

  v18 = [v10 titleAtIndex:v11];
  if (![v18 length])
  {
    uint64_t v19 = [v17 uuid];

    v18 = (void *)v19;
  }
  uint64_t v20 = [v10 photoQuantityAtIndex:v11];
  uint64_t v21 = [v17 verifiedType];
  if ((unint64_t)(v21 + 2) > 4) {
    v22 = @"Unknown";
  }
  else {
    v22 = off_1E5DC9C80[v21 + 2];
  }
  id v23 = [NSString stringWithFormat:@"%ld (%@)", v20, v22];
  v24 = [v15 quantityLabel];
  [v24 setText:v23];

  if (self->_selectDuplicatesMode)
  {
    if ([(NSMutableSet *)self->_selectedIndexPaths containsObject:v6]) {
      double v25 = 1.0;
    }
    else {
      double v25 = 0.4;
    }
  }
  else
  {
    double v25 = 1.0;
  }
  v26 = [v15 avatarView];
  [v26 setAlpha:v25];
  [v26 setHighlighted:0];
  long long v31 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  long long v32 = *MEMORY[0x1E4F1DAB8];
  long long v30 = v32;
  long long v33 = v31;
  long long v34 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  long long v29 = v34;
  [v26 setTransform:&v32];
  long long v32 = v30;
  long long v33 = v31;
  long long v34 = v29;
  [v15 setTransform:&v32];
  [v15 setName:v18];
  [v15 setTextAlpha:v25];
  id v27 = v15;

  return v27;
}

void __78__PXPeopleDetailSettingsViewController_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(id *)(a1 + 32);
  id v5 = v3;
  px_dispatch_on_main_queue();
}

uint64_t __78__PXPeopleDetailSettingsViewController_collectionView_cellForItemAtIndexPath___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) tag];
  if (result == *(void *)(a1 + 48))
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    return [v3 setImage:v4];
  }
  return result;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  uint64_t v4 = [(PXPeopleDetailSettingsViewController *)self dataSource];
  int64_t v5 = [v4 numberOfMembers];

  return v5;
}

- (id)infoForPerson:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 mdID];
  if (v5) {
    id v6 = (__CFString *)v5;
  }
  else {
    id v6 = @"No mdID";
  }
  id v7 = [v4 photoLibrary];
  double v8 = [v7 librarySpecificFetchOptions];

  [v8 setIncludedDetectionTypes:self->_personDetectionTypes];
  uint64_t v9 = [MEMORY[0x1E4F39050] fetchFacesForPerson:v4 options:v8];
  uint64_t v24 = 0;
  double v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy__241777;
  v28 = __Block_byref_object_dispose__241778;
  v10 = NSString;
  uint64_t v11 = [v4 uuid];
  id v29 = [v10 stringWithFormat:@"-- Person uuid %@ (%lu faces) --\nVU entity ID: %@\n", v11, objc_msgSend(v9, "count"), v6];

  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __54__PXPeopleDetailSettingsViewController_infoForPerson___block_invoke;
  v22[3] = &unk_1E5DC9B80;
  id v13 = v12;
  id v23 = v13;
  [v9 enumerateObjectsUsingBlock:v22];
  double v14 = [MEMORY[0x1E4F39060] fetchFaceCropByFaceLocalIdentifierForFaces:v9 fetchOptions:v8];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __54__PXPeopleDetailSettingsViewController_infoForPerson___block_invoke_2;
  v18[3] = &unk_1E5DC9BA8;
  id v15 = v13;
  uint64_t v20 = self;
  uint64_t v21 = &v24;
  id v19 = v15;
  [v14 enumerateKeysAndObjectsUsingBlock:v18];
  id v16 = (id)v25[5];

  _Block_object_dispose(&v24, 8);
  return v16;
}

void __54__PXPeopleDetailSettingsViewController_infoForPerson___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v3 localIdentifier];
  [v2 setObject:v3 forKeyedSubscript:v4];
}

void __54__PXPeopleDetailSettingsViewController_infoForPerson___block_invoke_2(void *a1, uint64_t a2, void *a3)
{
  uint64_t v5 = (void *)a1[4];
  id v6 = a3;
  id v16 = [v5 objectForKeyedSubscript:a2];
  id v7 = *(void **)(*(void *)(a1[6] + 8) + 40);
  double v8 = [v6 uuid];
  uint64_t v9 = (void *)a1[5];
  uint64_t v10 = [v6 type];

  uint64_t v11 = [v9 stringFromFaceCropType:v10];
  id v12 = [v16 uuid];
  uint64_t v13 = [v7 stringByAppendingFormat:@"\tFace crop %@ of type \"%@\" linked to detected face %@ with vuObservationID %ld\n", v8, v11, v12, objc_msgSend(v16, "vuObservationID")];
  uint64_t v14 = *(void *)(a1[6] + 8);
  id v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v13;
}

- (id)stringFromFaceCropType:(signed __int16)a3
{
  if ((a3 - 1) > 4) {
    return @"Unknown";
  }
  else {
    return off_1E5DC9C58[a3 - 1];
  }
}

- (void)fileVURadar:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v5 = (void *)[v4 initWithArray:MEMORY[0x1E4F1CBF0]];
  selectedIndexPaths = self->_selectedIndexPaths;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  id v15 = __52__PXPeopleDetailSettingsViewController_fileVURadar___block_invoke;
  id v16 = &unk_1E5DC9B58;
  id v17 = self;
  id v18 = v5;
  id v7 = v5;
  [(NSMutableSet *)selectedIndexPaths enumerateObjectsUsingBlock:&v13];
  double v8 = NSString;
  uint64_t v9 = [v7 componentsJoinedByString:@"\n"];
  uint64_t v10 = [v8 stringWithFormat:@"This Radar contains a Photo library that has duplicate persons:\n%@", v9];

  v19[0] = @"com.apple.PhotoLibraryServices.PhotosDiagnostics";
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  LOWORD(v12) = 257;
  +[PXFeedbackTapToRadarUtilities fileRadarWithTitle:description:classification:componentID:componentName:componentVersion:keyword:screenshotURLs:attachmentURLs:includeSysDiagnose:includeInternalRelease:additionalExtensionIdentifiers:completionHandler:](PXFeedbackTapToRadarUtilities, "fileRadarWithTitle:description:classification:componentID:componentName:componentVersion:keyword:screenshotURLs:attachmentURLs:includeSysDiagnose:includeInternalRelease:additionalExtensionIdentifiers:completionHandler:", @"[People][VU] Annotated duplicate persons in library", v10, @"Other Bug", @"1540673", @"VisualUnderstanding", @"all", 0, 0, 0, v12, v11, 0, v13, v14, v15, v16,
    v17);
}

void __52__PXPeopleDetailSettingsViewController_fileVURadar___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 item];
  id v4 = [*(id *)(a1 + 32) dataSource];
  id v7 = [v4 personAtIndex:v3];

  uint64_t v5 = *(void **)(a1 + 40);
  id v6 = [*(id *)(a1 + 32) infoForPerson:v7];
  [v5 addObject:v6];
}

- (void)toggle_selectDuplicatesMode:(id)a3
{
  BOOL selectDuplicatesMode = self->_selectDuplicatesMode;
  self->_BOOL selectDuplicatesMode = !selectDuplicatesMode;
  uint64_t v5 = [(PXPeopleDetailSettingsViewController *)self navigationItem];
  id v6 = [v5 rightBarButtonItem];
  id v7 = v6;
  if (selectDuplicatesMode)
  {
    [v6 setStyle:0];

    previousLeftBarButtonItem = self->_previousLeftBarButtonItem;
    uint64_t v9 = [(PXPeopleDetailSettingsViewController *)self navigationItem];
    [v9 setLeftBarButtonItem:previousLeftBarButtonItem];

    uint64_t v10 = self->_previousLeftBarButtonItem;
    self->_previousLeftBarButtonItem = 0;

    [(NSMutableSet *)self->_selectedIndexPaths removeAllObjects];
  }
  else
  {
    [v6 setStyle:2];

    uint64_t v11 = [(PXPeopleDetailSettingsViewController *)self navigationItem];
    uint64_t v12 = [v11 leftBarButtonItem];
    uint64_t v13 = self->_previousLeftBarButtonItem;
    self->_previousLeftBarButtonItem = v12;

    uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:@"File People Radar" style:0 target:self action:sel_fileVURadar_];
    id v15 = [(PXPeopleDetailSettingsViewController *)self navigationItem];
    [v15 setLeftBarButtonItem:v14];
  }
  id v16 = [(PXPeopleDetailSettingsViewController *)self collectionView];
  [v16 reloadData];
}

- (void)viewDidLoad
{
  v14.receiver = self;
  v14.super_class = (Class)PXPeopleDetailSettingsViewController;
  [(PXPeopleDetailSettingsViewController *)&v14 viewDidLoad];
  id v3 = objc_alloc_init(MEMORY[0x1E4FB15C0]);
  [v3 setMinimumInteritemSpacing:15.0];
  [v3 setMinimumLineSpacing:15.0];
  id v4 = [(PXPeopleDetailSettingsViewController *)self view];
  id v5 = objc_alloc(MEMORY[0x1E4FB1568]);
  [v4 frame];
  id v6 = objc_msgSend(v5, "initWithFrame:collectionViewLayout:", v3);
  [(PXPeopleDetailSettingsViewController *)self setCollectionView:v6];
  [v6 setAutoresizingMask:18];
  [v6 setDataSource:self];
  [v6 setDelegate:self];
  [v6 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"cellIdentifier"];
  id v7 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [v6 setBackgroundColor:v7];

  [v4 addSubview:v6];
  double v8 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:@"Select Dupes" style:0 target:self action:sel_toggle_selectDuplicatesMode_];
  uint64_t v9 = [(PXPeopleDetailSettingsViewController *)self navigationItem];
  [v9 setRightBarButtonItem:v8];

  objc_initWeak(&location, self);
  uint64_t v10 = [(PXPeopleDetailSettingsViewController *)self dataSource];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __51__PXPeopleDetailSettingsViewController_viewDidLoad__block_invoke;
  v11[3] = &unk_1E5DD32D0;
  objc_copyWeak(&v12, &location);
  [v10 loadObjectsAndUpdateMembersWithCompletion:v11];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __51__PXPeopleDetailSettingsViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__PXPeopleDetailSettingsViewController_viewDidLoad__block_invoke_2;
  block[3] = &unk_1E5DD32D0;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v2);
}

void __51__PXPeopleDetailSettingsViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained collectionView];
  [v1 reloadData];
}

- (PXPeopleDetailSettingsViewController)initWithPersonDetectionType:(signed __int16)a3
{
  uint64_t v3 = a3;
  v9[1] = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)PXPeopleDetailSettingsViewController;
  id v4 = [(PXPeopleDetailSettingsViewController *)&v8 init];
  if (v4)
  {
    id v5 = [NSNumber numberWithShort:v3];
    v9[0] = v5;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    [(PXPeopleDetailSettingsViewController *)v4 setPersonDetectionTypes:v6];

    [(PXPeopleDetailSettingsViewController *)v4 commonInit];
  }
  return v4;
}

- (PXPeopleDetailSettingsViewController)initWithDataSourceReloadBlock:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PXPeopleDetailSettingsViewController;
  id v5 = [(PXPeopleDetailSettingsViewController *)&v8 init];
  id v6 = v5;
  if (v5) {
    [(PXPeopleDetailSettingsViewController *)v5 commonInitWithDataSourceReloadBlock:v4];
  }

  return v6;
}

- (PXPeopleDetailSettingsViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)PXPeopleDetailSettingsViewController;
  id v2 = [(PXPeopleDetailSettingsViewController *)&v5 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F390A0] defaultDetectionTypes];
    [(PXPeopleDetailSettingsViewController *)v2 setPersonDetectionTypes:v3];

    [(PXPeopleDetailSettingsViewController *)v2 commonInit];
  }
  return v2;
}

- (void)commonInitWithDataSourceReloadBlock:(id)a3
{
  id v7 = a3;
  id v4 = [(PXPeopleDetailSettingsViewController *)self dataSource];

  if (!v4)
  {
    objc_super v5 = [(PXPeopleDataSource *)[PXPeoplePersonDataSource alloc] initWithName:@"PeopleAdditionalDataSource" objectsReloadBlock:v7 asynchronousLoad:1 callbackDelegate:self];
    [(PXPeopleDataSource *)v5 setSortComparator:&__block_literal_global_241975];
    [(PXPeopleDetailSettingsViewController *)self setDataSource:v5];
    id v6 = [[PXPeopleSuggestionDataSource alloc] initWithFlowType:0];
    [(PXPeopleDetailSettingsViewController *)self setSuggestionDataSource:v6];
  }
}

uint64_t __76__PXPeopleDetailSettingsViewController_commonInitWithDataSourceReloadBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  objc_super v5 = [a2 modelObject];
  id v6 = [v4 modelObject];

  uint64_t v7 = [v5 verifiedType];
  uint64_t v8 = [v6 verifiedType];
  if (v7 != v8)
  {
    if (v7 == 1) {
      goto LABEL_10;
    }
    if (v8 == 1) {
      goto LABEL_12;
    }
    if (v7 == 2) {
      goto LABEL_10;
    }
    if (v8 == 2) {
      goto LABEL_12;
    }
    if (v7 > v8)
    {
LABEL_10:
      uint64_t v13 = -1;
      goto LABEL_13;
    }
    if (v7 < v8) {
      goto LABEL_12;
    }
  }
  unint64_t v9 = [v5 faceCount];
  unint64_t v10 = [v6 faceCount];
  if (v9 > v10) {
    goto LABEL_10;
  }
  if (v9 < v10)
  {
LABEL_12:
    uint64_t v13 = 1;
    goto LABEL_13;
  }
  uint64_t v11 = [v5 localIdentifier];
  id v12 = [v6 localIdentifier];
  uint64_t v13 = [v11 compare:v12];

LABEL_13:
  return v13;
}

- (void)commonInit
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __50__PXPeopleDetailSettingsViewController_commonInit__block_invoke;
  v2[3] = &unk_1E5DC9B30;
  v2[4] = self;
  [(PXPeopleDetailSettingsViewController *)self commonInitWithDataSourceReloadBlock:v2];
}

id __50__PXPeopleDetailSettingsViewController_commonInit__block_invoke(uint64_t a1)
{
  id v2 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  uint64_t v3 = [v2 librarySpecificFetchOptions];

  id v4 = [*(id *)(a1 + 32) personDetectionTypes];
  [v3 setIncludedDetectionTypes:v4];

  objc_super v5 = [MEMORY[0x1E4F391F0] fetchPersonsWithOptions:v3];
  *(unsigned char *)(*(void *)(a1 + 32) + 976) = 0;
  id v6 = objc_alloc(MEMORY[0x1E4F1CA80]);
  uint64_t v7 = [v6 initWithArray:MEMORY[0x1E4F1CBF0]];
  uint64_t v8 = *(void *)(a1 + 32);
  unint64_t v9 = *(void **)(v8 + 984);
  *(void *)(v8 + 984) = v7;

  return v5;
}

@end