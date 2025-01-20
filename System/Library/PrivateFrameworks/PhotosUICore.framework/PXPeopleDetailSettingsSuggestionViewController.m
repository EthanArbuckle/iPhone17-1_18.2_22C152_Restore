@interface PXPeopleDetailSettingsSuggestionViewController
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (NSArray)detailSettingsDataSources;
- (PHPerson)person;
- (PXPeopleDetailSettingsSuggestionViewController)initWithPerson:(id)a3;
- (UICollectionView)collectionView;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (UIImage)image;
- (id)_defaultOptionsForPhotoLibrary:(id)a3 sortKey:(id)a4;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)loadDataSource;
- (void)setCollectionView:(id)a3;
- (void)setDetailSettingsDataSources:(id)a3;
- (void)setImage:(id)a3;
- (void)viewDidLoad;
@end

@implementation PXPeopleDetailSettingsSuggestionViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_detailSettingsDataSources, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_person, 0);
}

- (void)setImage:(id)a3
{
}

- (UIImage)image
{
  return self->_image;
}

- (void)setDetailSettingsDataSources:(id)a3
{
}

- (NSArray)detailSettingsDataSources
{
  return (NSArray *)objc_getProperty(self, a2, 992, 1);
}

- (void)setCollectionView:(id)a3
{
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (PHPerson)person
{
  return self->_person;
}

- (id)_defaultOptionsForPhotoLibrary:(id)a3 sortKey:(id)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = [a3 librarySpecificFetchOptions];
  if (v5)
  {
    v7 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:v5 ascending:0];
    v11[0] = v7;
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    [v6 setInternalSortDescriptors:v8];
  }
  v9 = objc_msgSend(MEMORY[0x1E4F390A0], "px_defaultDetectionTypes");
  [v6 setIncludedDetectionTypes:v9];

  return v6;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = [(PXPeopleDetailSettingsSuggestionViewController *)self detailSettingsDataSources];
  v7 = objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));

  if ([v7 action] == 1)
  {
    v8 = objc_msgSend(v7, "modelObjectForIndex:", objc_msgSend(v5, "item"));
    v9 = [[PXPeopleDetailSettingsSuggestionViewController alloc] initWithPerson:v8];
    v10 = [(PXPeopleDetailSettingsSuggestionViewController *)self navigationController];
    [v10 pushViewController:v9 animated:1];

LABEL_15:
    goto LABEL_16;
  }
  if ([v7 action] == 2)
  {
    v8 = objc_msgSend(v7, "modelObjectForIndex:", objc_msgSend(v5, "item"));
    v11 = [v8 person];
    if (v11)
    {
      v12 = (void *)MEMORY[0x1E4F38EB8];
      v13 = [v8 person];
      v30[0] = v13;
      v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
      v15 = [v12 fetchAssetsForPersons:v14 options:0];
    }
    else
    {
      v15 = 0;
    }

    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v15, "count"));
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v17 = v15;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v26 != v20) {
            objc_enumerationMutation(v17);
          }
          objc_msgSend(v16, "addObject:", *(void *)(*((void *)&v25 + 1) + 8 * i), (void)v25);
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v19);
    }

    v22 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v16];
    v23 = [[PXPeopleDetailSettingsAssetsViewController alloc] initWithAssets:v22];
    v24 = [(PXPeopleDetailSettingsSuggestionViewController *)self navigationController];
    [v24 pushViewController:v23 animated:1];

    goto LABEL_15;
  }
LABEL_16:
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
  double v8 = [v7 dequeueReusableCellWithReuseIdentifier:@"faceCellIdentifier" forIndexPath:v6];
  uint64_t v9 = [v8 tag] + 1;
  [v8 setTag:v9];
  v10 = [(PXPeopleDetailSettingsSuggestionViewController *)self detailSettingsDataSources];
  v11 = objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v6, "section"));

  uint64_t v12 = [v6 item];
  v13 = [v7 traitCollection];

  [v13 displayScale];
  double v15 = v14;
  uint64_t v24 = MEMORY[0x1E4F143A8];
  uint64_t v25 = 3221225472;
  long long v26 = __88__PXPeopleDetailSettingsSuggestionViewController_collectionView_cellForItemAtIndexPath___block_invoke;
  long long v27 = &unk_1E5DC9C38;
  id v16 = v8;
  id v28 = v16;
  uint64_t v29 = v9;
  objc_msgSend(v11, "imageAtIndex:targetSize:displayScale:resultHandler:", v12, &v24, 110.0, 110.0, v15);

  if ([v11 hasMoreDetails])
  {
    id v17 = [v11 personNameAtIndex:v12];
    uint64_t v18 = [v11 faceCount:v12];
    uint64_t v19 = [v11 verifyTypeAtIndex:v12];
    if ((unint64_t)(v19 + 2) > 4) {
      uint64_t v20 = @"Unknown";
    }
    else {
      uint64_t v20 = off_1E5DC9C80[v19 + 2];
    }
    v21 = [NSString stringWithFormat:@"%ld (%@)", v18, v20, v24, v25, v26, v27];
    [v16 setName:v17];
    v22 = [v16 quantityLabel];
    [v22 setText:v21];

    [v16 setTextAlpha:1.0];
  }
  else
  {
    id v17 = [v16 quantityLabel];
    [v17 setHidden:1];
  }

  return v16;
}

void __88__PXPeopleDetailSettingsSuggestionViewController_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(id *)(a1 + 32);
  id v5 = v3;
  px_dispatch_on_main_queue();
}

uint64_t __88__PXPeopleDetailSettingsSuggestionViewController_collectionView_cellForItemAtIndexPath___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) tag];
  if (result == *(void *)(a1 + 48))
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    double v5 = *(double *)(a1 + 56);
    double v6 = *(double *)(a1 + 64);
    double v7 = *(double *)(a1 + 72);
    double v8 = *(double *)(a1 + 80);
    return objc_msgSend(v3, "setImage:normalizedFaceRect:", v4, v5, v6, v7, v8);
  }
  return result;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if ((id)*MEMORY[0x1E4FB2770] != v10)
  {
    uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"PXPeopleDetailSettingsViewController.m" lineNumber:650 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  uint64_t v12 = v11;
  v13 = [v9 dequeueReusableSupplementaryViewOfKind:v10 withReuseIdentifier:@"headerTitle" forIndexPath:v11];
  double v14 = [(PXPeopleDetailSettingsSuggestionViewController *)self detailSettingsDataSources];
  double v15 = objc_msgSend(v14, "objectAtIndexedSubscript:", objc_msgSend(v12, "section"));
  id v16 = [v15 title];
  [v13 setTitle:v16];

  return v13;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  double v5 = [(PXPeopleDetailSettingsSuggestionViewController *)self collectionView];
  [v5 contentSize];
  double v7 = v6;

  double v8 = 30.0;
  double v9 = v7;
  result.height = v8;
  result.width = v9;
  return result;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  id v3 = [(PXPeopleDetailSettingsSuggestionViewController *)self detailSettingsDataSources];
  int64_t v4 = [v3 count];

  return v4;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  double v5 = [(PXPeopleDetailSettingsSuggestionViewController *)self detailSettingsDataSources];
  double v6 = [v5 objectAtIndexedSubscript:a4];
  int64_t v7 = [v6 numberOfItems];

  return v7;
}

- (void)viewDidLoad
{
  v16.receiver = self;
  v16.super_class = (Class)PXPeopleDetailSettingsSuggestionViewController;
  [(PXPeopleDetailSettingsSuggestionViewController *)&v16 viewDidLoad];
  id v3 = objc_alloc_init(MEMORY[0x1E4FB15C0]);
  [v3 setMinimumLineSpacing:15.0];
  id v4 = objc_alloc(MEMORY[0x1E4FB1568]);
  double v5 = [(PXPeopleDetailSettingsSuggestionViewController *)self view];
  [v5 frame];
  double v6 = objc_msgSend(v4, "initWithFrame:collectionViewLayout:", v3);
  [(PXPeopleDetailSettingsSuggestionViewController *)self setCollectionView:v6];

  int64_t v7 = [(PXPeopleDetailSettingsSuggestionViewController *)self collectionView];
  [v7 setAutoresizingMask:18];

  double v8 = [(PXPeopleDetailSettingsSuggestionViewController *)self collectionView];
  [v8 setDataSource:self];

  double v9 = [(PXPeopleDetailSettingsSuggestionViewController *)self collectionView];
  [v9 setDelegate:self];

  id v10 = [(PXPeopleDetailSettingsSuggestionViewController *)self collectionView];
  [v10 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"faceCellIdentifier"];

  id v11 = [(PXPeopleDetailSettingsSuggestionViewController *)self collectionView];
  [v11 registerClass:objc_opt_class() forSupplementaryViewOfKind:*MEMORY[0x1E4FB2770] withReuseIdentifier:@"headerTitle"];

  uint64_t v12 = [(PXPeopleDetailSettingsSuggestionViewController *)self collectionView];
  v13 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [v12 setBackgroundColor:v13];

  double v14 = [(PXPeopleDetailSettingsSuggestionViewController *)self view];
  double v15 = [(PXPeopleDetailSettingsSuggestionViewController *)self collectionView];
  [v14 addSubview:v15];

  [(PXPeopleDetailSettingsSuggestionViewController *)self loadDataSource];
}

- (void)loadDataSource
{
  id v3 = [(PXPeopleDetailSettingsSuggestionViewController *)self person];
  id v4 = [(PXPeopleDetailSettingsSuggestionViewController *)self collectionView];
  double v5 = dispatch_get_global_queue(25, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__PXPeopleDetailSettingsSuggestionViewController_loadDataSource__block_invoke;
  block[3] = &unk_1E5DD0F30;
  id v9 = v3;
  id v10 = self;
  id v11 = v4;
  id v6 = v4;
  id v7 = v3;
  dispatch_async(v5, block);
}

void __64__PXPeopleDetailSettingsSuggestionViewController_loadDataSource__block_invoke(id *a1)
{
  v55[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA48] array];
  id v3 = [a1[4] photoLibrary];
  id v4 = [a1[5] _defaultOptionsForPhotoLibrary:v3 sortKey:0];
  [v4 setFetchLimit:9];
  double v5 = [MEMORY[0x1E4F39050] fetchSuggestedFacesForPerson:a1[4] options:v4];
  if ([v5 count])
  {
    id v6 = [[PXPeopleDetailSettingsFaceDataSource alloc] initWithTitle:@"Suggested Faces" faces:v5];
    [v2 addObject:v6];
  }
  v51 = v5;
  v50 = [a1[5] _defaultOptionsForPhotoLibrary:v3 sortKey:@"faceCount"];
  id v7 = objc_msgSend(MEMORY[0x1E4F391F0], "fetchMergeCandidatePersonsForPerson:options:", a1[4]);
  if ([v7 count])
  {
    double v8 = [[PXPeopleDetailSettingsPersonDataSource alloc] initWithTitle:@"Merged Candidate (Pet)" persons:v7];
    [v2 addObject:v8];
  }
  v48 = [a1[5] _defaultOptionsForPhotoLibrary:v3 sortKey:@"faceCount"];
  id v9 = objc_msgSend(MEMORY[0x1E4F391F0], "fetchInvalidMergeCandidatePersonsForPerson:options:", a1[4]);
  if ([v9 count])
  {
    id v10 = [[PXPeopleDetailSettingsPersonDataSource alloc] initWithTitle:@"Invalidate Candidate (Pet)" persons:v9];
    [v2 addObject:v10];
  }
  id v11 = [MEMORY[0x1E4F391F0] personSuggestionsForPerson:a1[4] confirmedPersonSuggestions:0 rejectedPersonSuggestions:0];
  if ([v11 count])
  {
    uint64_t v12 = [[PXPeopleDetailSettingsPersonSuggestionDataSource alloc] initWithTitle:@"Person Suggestion" personSuggestions:v11];
    [v2 addObject:v12];
  }
  v46 = v11;
  v45 = [a1[5] _defaultOptionsForPhotoLibrary:v3 sortKey:0];
  v13 = objc_msgSend(MEMORY[0x1E4F39050], "fetchRejectedFacesForPerson:options:", a1[4]);
  if ([v13 count])
  {
    double v14 = [[PXPeopleDetailSettingsFaceDataSource alloc] initWithTitle:@"Rejected Faces" faces:v13];
    [v2 addObject:v14];
  }
  v44 = v13;
  v47 = v9;
  v49 = v7;
  double v15 = [a1[5] _defaultOptionsForPhotoLibrary:v3 sortKey:0];
  objc_super v16 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"nameSource = %ld OR nameSource = %ld", 1, 3);
  [v15 setInternalPredicate:v16];

  id v17 = [MEMORY[0x1E4F39050] fetchFacesForPerson:a1[4] options:v15];
  if ([v17 count])
  {
    uint64_t v18 = [[PXPeopleDetailSettingsFaceDataSource alloc] initWithTitle:@"Confirmation Faces" faces:v17];
    [v2 addObject:v18];
  }
  uint64_t v19 = [v3 photoAnalysisClient];
  uint64_t v20 = [a1[4] uuid];
  v55[0] = v20;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:1];
  v43 = v19;
  v22 = [v19 faceCandidatesForKeyFaceForPersonsWithLocalIdentifiers:v21 error:0];

  if ([v22 count])
  {
    v42 = v4;
    v23 = [v22 firstObject];
    uint64_t v24 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"qualityMeasure" ascending:0];
    v41 = [MEMORY[0x1E4F1C978] arrayWithObject:v24];
    v40 = objc_msgSend(v23, "sortedArrayUsingDescriptors:");
    uint64_t v25 = [[PXPeopleDetailSettingsKeyFacesDataSource alloc] initWithTitle:@"Key Faces by Quality Measure" keyFaces:v40 qualityProperty:@"qualityMeasure" photoLibrary:v3];
    [v2 addObject:v25];

    if ([a1[4] detectionType] == 1)
    {
      v39 = v24;
      long long v26 = [v23 firstObject];
      long long v27 = [v26 objectForKeyedSubscript:@"quality"];

      if (v27)
      {
        id v28 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"quality" ascending:0];
        v54 = v28;
        uint64_t v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v54 count:1];
        v30 = [v23 sortedArrayUsingDescriptors:v29];
      }
      else
      {
        context = (void *)MEMORY[0x1AD10CB00]();
        v37 = PFMap();
        v31 = [a1[5] _defaultOptionsForPhotoLibrary:v3 sortKey:@"quality"];
        v32 = [MEMORY[0x1E4F39050] fetchFacesWithLocalIdentifiers:v37 options:v31];
        v30 = PFMap();
      }
      v33 = [[PXPeopleDetailSettingsKeyFacesDataSource alloc] initWithTitle:@"Key Faces by Face Quality" keyFaces:v30 qualityProperty:@"quality" photoLibrary:v3];
      [v2 addObject:v33];

      uint64_t v24 = v39;
    }

    id v4 = v42;
  }
  v34 = a1[5];
  v35 = (void *)v34[124];
  v34[124] = v2;
  id v36 = v2;

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__PXPeopleDetailSettingsSuggestionViewController_loadDataSource__block_invoke_4;
  block[3] = &unk_1E5DD36F8;
  id v53 = a1[6];
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __64__PXPeopleDetailSettingsSuggestionViewController_loadDataSource__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadData];
}

id __64__PXPeopleDetailSettingsSuggestionViewController_loadDataSource__block_invoke_3(uint64_t a1, void *a2)
{
  void v11[2] = *MEMORY[0x1E4F143B8];
  v10[0] = @"localIdentifier";
  id v2 = a2;
  id v3 = [v2 localIdentifier];
  v10[1] = @"quality";
  v11[0] = v3;
  id v4 = NSNumber;
  [v2 quality];
  double v6 = v5;

  id v7 = [v4 numberWithDouble:v6];
  v11[1] = v7;
  double v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];

  return v8;
}

uint64_t __64__PXPeopleDetailSettingsSuggestionViewController_loadDataSource__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 objectForKeyedSubscript:@"localIdentifier"];
}

- (PXPeopleDetailSettingsSuggestionViewController)initWithPerson:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXPeopleDetailSettingsSuggestionViewController;
  double v6 = [(PXPeopleDetailSettingsSuggestionViewController *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_person, a3);
  }

  return v7;
}

@end