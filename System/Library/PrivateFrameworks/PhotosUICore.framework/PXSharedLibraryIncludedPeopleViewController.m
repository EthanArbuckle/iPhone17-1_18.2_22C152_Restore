@interface PXSharedLibraryIncludedPeopleViewController
+ (double)heightForWidth:(double)a3 numberOfItems:(unint64_t)a4;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (NSIndexPath)currentSelectedIndexPath;
- (PXSharedLibraryIncludedPeopleDataSourceManager)dataSourceManager;
- (PXSharedLibraryIncludedPeopleViewController)initWithDataSourceManager:(id)a3;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (id)_infoAtIndexPath:(id)a3;
- (id)_personAtIndexPath:(id)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)_removeCell:(id)a3;
- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)picker:(id)a3 didFinishPicking:(id)a4;
- (void)setCurrentSelectedIndexPath:(id)a3;
- (void)setDataSourceManager:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation PXSharedLibraryIncludedPeopleViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentSelectedIndexPath, 0);
  objc_storeStrong((id *)&self->_dataSourceManager, 0);
}

- (void)setCurrentSelectedIndexPath:(id)a3
{
}

- (NSIndexPath)currentSelectedIndexPath
{
  return self->_currentSelectedIndexPath;
}

- (void)setDataSourceManager:(id)a3
{
}

- (PXSharedLibraryIncludedPeopleDataSourceManager)dataSourceManager
{
  return self->_dataSourceManager;
}

- (void)picker:(id)a3 didFinishPicking:(id)a4
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ((unint64_t)[v8 count] >= 2)
  {
    v35 = [MEMORY[0x1E4F28B00] currentHandler];
    [v35 handleFailureInMethod:a2, self, @"PXSharedLibraryIncludedPeopleViewController.m", 259, @"Invalid parameter not satisfying: %@", @"results.count <= 1" object file lineNumber description];
  }
  [(PXSharedLibraryIncludedPeopleViewController *)self dismissViewControllerAnimated:1 completion:0];
  v9 = [v8 firstObject];

  v10 = [v9 itemIdentifier];
  if ([v10 length])
  {
    v11 = [(PXSharedLibraryIncludedPeopleViewController *)self dataSourceManager];
    v12 = [v11 dataSource];
    v13 = [MEMORY[0x1E4F391F0] uuidFromLocalIdentifier:v10];
    v14 = [v12 infoForPersonUUID:v13];

    if (v14)
    {
      v15 = [v14 participant];

      if (!v15)
      {
        v16 = [(PXSharedLibraryIncludedPeopleViewController *)self currentSelectedIndexPath];
        v17 = [(PXSharedLibraryIncludedPeopleViewController *)self _infoAtIndexPath:v16];

        v18 = [v17 participant];
        v19 = [PXSharedLibraryIncludedPeopleInfo alloc];
        [v14 person];
        v21 = id v20 = v7;
        v22 = [(PXSharedLibraryIncludedPeopleInfo *)v19 initWithParticipant:v18 person:v21];

        id v7 = v20;
        [v11 removeInfo:v14];
        [v11 replaceInfo:v17 withInfo:v22];
      }
    }
    else
    {
      id v38 = v7;
      v23 = [v7 configuration];
      v24 = [v23 photoLibrary];
      v25 = [v24 librarySpecificFetchOptions];

      [v25 setFetchLimit:1];
      v26 = (void *)MEMORY[0x1E4F391F0];
      v39[0] = v10;
      v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:1];
      v28 = [v26 fetchPersonsWithLocalIdentifiers:v27 options:v25];

      v37 = v28;
      v29 = [v28 firstObject];
      if (!v29)
      {
        v36 = [MEMORY[0x1E4F28B00] currentHandler];
        [v36 handleFailureInMethod:a2, self, @"PXSharedLibraryIncludedPeopleViewController.m", 283, @"Invalid parameter not satisfying: %@", @"person" object file lineNumber description];
      }
      v30 = [(PXSharedLibraryIncludedPeopleViewController *)self currentSelectedIndexPath];
      v31 = [(PXSharedLibraryIncludedPeopleViewController *)self _infoAtIndexPath:v30];

      v32 = [PXSharedLibraryIncludedPeopleInfo alloc];
      v33 = [v31 participant];
      v34 = [(PXSharedLibraryIncludedPeopleInfo *)v32 initWithParticipant:v33 person:v29];

      [v11 replaceInfo:v31 withInfo:v34];
      id v7 = v38;
    }
    [(PXSharedLibraryIncludedPeopleViewController *)self setCurrentSelectedIndexPath:0];
  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  if ((a4 & 1) != 0 && (void *)PXSharedLibraryIncludedPeopleRulesObservationContext == a5)
  {
    id v5 = [(PXSharedLibraryIncludedPeopleViewController *)self collectionView];
    [v5 reloadData];
  }
}

- (void)_removeCell:(id)a3
{
  id v19 = a3;
  if (v19)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    v17 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v17);
    v18 = objc_msgSend(v19, "px_descriptionForAssertionMessage");
    [v14 handleFailureInMethod:a2, self, @"PXSharedLibraryIncludedPeopleViewController.m", 240, @"%@ should be an instance inheriting from %@, but it is %@", @"sender", v16, v18 object file lineNumber description];
  }
  else
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    [v14 handleFailureInMethod:a2, self, @"PXSharedLibraryIncludedPeopleViewController.m", 240, @"%@ should be an instance inheriting from %@, but it is nil", @"sender", v16 object file lineNumber description];
  }

LABEL_3:
  id v5 = [(PXSharedLibraryIncludedPeopleViewController *)self collectionView];
  [v19 center];
  double v7 = v6;
  double v9 = v8;
  v10 = [v19 superview];
  objc_msgSend(v5, "convertPoint:fromView:", v10, v7, v9);
  v11 = objc_msgSend(v5, "indexPathForItemAtPoint:");

  v12 = [(PXSharedLibraryIncludedPeopleViewController *)self _infoAtIndexPath:v11];
  v13 = [(PXSharedLibraryIncludedPeopleViewController *)self dataSourceManager];
  [v13 removeInfo:v12];
}

- (id)_infoAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(PXSharedLibraryIncludedPeopleViewController *)self dataSourceManager];
  double v6 = [v5 dataSource];

  uint64_t v7 = [v6 identifier];
  uint64_t v8 = [v4 section];
  uint64_t v9 = [v4 item];

  v12[0] = v7;
  v12[1] = v8;
  v12[2] = v9;
  v12[3] = 0x7FFFFFFFFFFFFFFFLL;
  v10 = [v6 infoAtItemIndexPath:v12];

  return v10;
}

- (id)_personAtIndexPath:(id)a3
{
  v3 = [(PXSharedLibraryIncludedPeopleViewController *)self _infoAtIndexPath:a3];
  id v4 = [v3 person];

  return v4;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  [a3 frame];
  +[PXPeopleGridSizer cellSizeForGridClass:0 width:v5];
  result.height = v7;
  result.width = v6;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  [a3 frame];
  +[PXPeopleGridSizer marginForGridClass:0 width:v5];
  double v7 = v6;
  double v8 = v6 * 0.85;
  double v9 = v8;
  double v10 = v7;
  result.right = v10;
  result.bottom = v9;
  result.left = v7;
  result.top = v8;
  return result;
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  double v6 = [(PXSharedLibraryIncludedPeopleViewController *)self _personAtIndexPath:v5];
  if (!v6)
  {
    double v7 = [(PXSharedLibraryIncludedPeopleDataSourceManager *)self->_dataSourceManager viewModel];
    double v8 = [v7 sourceLibraryInfo];

    id v9 = v8;
    if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }

    v11 = [v10 photoLibrary];

    if (v11)
    {
      v12 = [(PXSharedLibraryIncludedPeopleViewController *)self _infoAtIndexPath:v5];
      v13 = [v12 name];

      if ([v13 length])
      {
        v14 = PXLocalizedSharedLibraryString(@"PXSharedLibraryAssistant_Rules_IdentifyPerson_Named");
        id v20 = v13;
        v15 = PXStringWithValidatedFormat();
      }
      else
      {
        v15 = PXLocalizedSharedLibraryString(@"PXSharedLibraryAssistant_Rules_IdentifyPerson_Unnamed");
      }
      -[PXSharedLibraryIncludedPeopleViewController setCurrentSelectedIndexPath:](self, "setCurrentSelectedIndexPath:", v5, v20);
      v17 = (void *)[objc_alloc(MEMORY[0x1E4F39930]) initWithPhotoLibrary:v11];
      [v17 setSelectionLimit:1];
      [v17 _setSourceType:1];
      id v18 = objc_alloc_init(MEMORY[0x1E4F399B0]);
      [v18 setPurpose:v15];
      [v18 setAllowsEditingCollection:1];
      [v17 _setPeopleConfiguration:v18];
      id v19 = (void *)[objc_alloc(MEMORY[0x1E4F39948]) initWithConfiguration:v17];
      [v19 setDelegate:self];
      [(PXSharedLibraryIncludedPeopleViewController *)self presentViewController:v19 animated:1 completion:0];
    }
    else
    {
      v16 = PLSharedLibraryGetLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v22 = v9;
        _os_log_impl(&dword_1A9AE7000, v16, OS_LOG_TYPE_DEFAULT, "Unable to present PHPickerViewController since %@ does not provide a PHPhotoLibrary.", buf, 0xCu);
      }
    }
  }
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  v66[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = [v7 dequeueReusableCellWithReuseIdentifier:@"PXSharedLibraryIncludedPeopleCellReuseIdentifier" forIndexPath:v8];
  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    v46 = [MEMORY[0x1E4F28B00] currentHandler];
    v49 = (objc_class *)objc_opt_class();
    v48 = NSStringFromClass(v49);
    v50 = objc_msgSend(v9, "px_descriptionForAssertionMessage");
    [v46 handleFailureInMethod:a2, self, @"PXSharedLibraryIncludedPeopleViewController.m", 97, @"%@ should be an instance inheriting from %@, but it is %@", @"[collectionView dequeueReusableCellWithReuseIdentifier:PXSharedLibraryIncludedPeopleCellReuseIdentifier forIndexPath:indexPath]", v48, v50 object file lineNumber description];
  }
  else
  {
    v46 = [MEMORY[0x1E4F28B00] currentHandler];
    v47 = (objc_class *)objc_opt_class();
    v48 = NSStringFromClass(v47);
    [v46 handleFailureInMethod:a2, self, @"PXSharedLibraryIncludedPeopleViewController.m", 97, @"%@ should be an instance inheriting from %@, but it is nil", @"[collectionView dequeueReusableCellWithReuseIdentifier:PXSharedLibraryIncludedPeopleCellReuseIdentifier forIndexPath:indexPath]", v48 object file lineNumber description];
  }

LABEL_3:
  [v9 setRemoveTarget:self];
  [v9 setRemoveAction:sel__removeCell_];
  id v10 = [(PXSharedLibraryIncludedPeopleViewController *)self _infoAtIndexPath:v8];

  v11 = [v10 person];
  [v7 frame];
  +[PXPeopleGridSizer cellSizeForGridClass:0 width:v12];
  double v14 = v13;
  double v16 = v15;
  objc_msgSend(v7, "px_screenScale");
  double v18 = v17;
  id v19 = [v10 name];
  uint64_t v20 = [v9 tag] + 1;
  [v9 setTag:v20];
  id v55 = v9;
  if (v11)
  {
    v21 = [v9 nameLabel];
    [v21 setText:v19];

    id v22 = [v9 subtitleLabel];
    [v22 setText:&stru_1F00B0030];

    v51 = -[PXPeopleFaceCropFetchOptions initWithPerson:targetSize:displayScale:]([PXPeopleFaceCropFetchOptions alloc], "initWithPerson:targetSize:displayScale:", v11, v14, v16, v18);
    uint64_t v23 = +[PXPeopleFaceCropManager sharedManager];
    v63[0] = MEMORY[0x1E4F143A8];
    v63[1] = 3221225472;
    v63[2] = __85__PXSharedLibraryIncludedPeopleViewController_collectionView_cellForItemAtIndexPath___block_invoke;
    v63[3] = &unk_1E5DD15E0;
    id v24 = v9;
    id v64 = v24;
    uint64_t v65 = v20;
    [v23 requestFaceCropForOptions:v51 resultHandler:v63];

    v25 = [(PXSharedLibraryIncludedPeopleViewController *)self dataSourceManager];
    v26 = [v25 viewModel];

    [v26 sourceLibraryInfo];
    v27 = id v53 = v7;
    v28 = [v26 startDate];
    [v11 uuid];
    v30 = uint64_t v29 = v20;
    v66[0] = v30;
    [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:1];
    v31 = v19;
    v32 = v11;
    v34 = v33 = v10;
    v60[0] = MEMORY[0x1E4F143A8];
    v60[1] = 3221225472;
    v60[2] = __85__PXSharedLibraryIncludedPeopleViewController_collectionView_cellForItemAtIndexPath___block_invoke_223;
    v60[3] = &unk_1E5DD1608;
    id v61 = v24;
    uint64_t v62 = v29;
    [v27 fetchEstimatedAssetsCountsForStartDate:v28 personUUIDs:v34 completion:v60];

    id v10 = v33;
    v11 = v32;
    id v19 = v31;
    v35 = v51;

    id v7 = v53;
    v36 = v64;
  }
  else
  {
    uint64_t v54 = v20;
    v35 = [v10 nameComponents];
    v37 = [v7 traitCollection];
    uint64_t v38 = [v37 layoutDirection];

    BOOL v39 = v38 == 1;
    if (v35)
    {
      [v35 givenName];
      v40 = v52 = v10;
      v41 = [v35 familyName];
      v58[0] = MEMORY[0x1E4F143A8];
      v58[1] = 3221225472;
      v58[2] = __85__PXSharedLibraryIncludedPeopleViewController_collectionView_cellForItemAtIndexPath___block_invoke_2_226;
      v58[3] = &unk_1E5DD1630;
      v42 = (id *)v59;
      v59[0] = v9;
      v59[1] = v54;
      +[PXActivityUtilities requestMonogramForGivenName:familyName:targetSize:displayScale:isRTL:completion:](PXActivityUtilities, "requestMonogramForGivenName:familyName:targetSize:displayScale:isRTL:completion:", v40, v41, v39, v58, v14, v16, v18);

      id v10 = v52;
    }
    else
    {
      v56[0] = MEMORY[0x1E4F143A8];
      v56[1] = 3221225472;
      v56[2] = __85__PXSharedLibraryIncludedPeopleViewController_collectionView_cellForItemAtIndexPath___block_invoke_3;
      v56[3] = &unk_1E5DD1630;
      v42 = (id *)v57;
      v57[0] = v9;
      v57[1] = v54;
      +[PXActivityUtilities requestMonogramForEmailAddress:targetSize:displayScale:isRTL:completion:](PXActivityUtilities, "requestMonogramForEmailAddress:targetSize:displayScale:isRTL:completion:", v19, v38 == 1, v56, v14, v16, v18);
    }

    v43 = [v9 minusImageView];
    [v43 setHidden:1];

    v44 = [v9 nameLabel];
    [v44 setText:v19];

    v36 = [v9 subtitleLabel];
    [v36 setText:&stru_1F00B0030];
  }

  return v55;
}

void __85__PXSharedLibraryIncludedPeopleViewController_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  [a3 objectForKeyedSubscript:@"PXPeopleContentsRectKey"];
  [(id)objc_claimAutoreleasedReturnValue() CGRectValue];
  id v6 = *(id *)(a1 + 32);
  id v7 = v5;
  px_dispatch_on_main_queue();
}

void __85__PXSharedLibraryIncludedPeopleViewController_collectionView_cellForItemAtIndexPath___block_invoke_223(uint64_t a1, uint64_t a2)
{
  if ([*(id *)(a1 + 32) tag] == *(void *)(a1 + 40))
  {
    long long v6 = *(_OWORD *)a2;
    uint64_t v7 = *(void *)(a2 + 16);
    PXSharedLibraryTitleForCounts(&v6);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    id v4 = [*(id *)(a1 + 32) subtitleLabel];
    [v4 setText:v5];
  }
}

void __85__PXSharedLibraryIncludedPeopleViewController_collectionView_cellForItemAtIndexPath___block_invoke_2_226(uint64_t a1, void *a2)
{
  id v9 = a2;
  if ([*(id *)(a1 + 32) tag] == *(void *)(a1 + 40))
  {
    v3 = [*(id *)(a1 + 32) faceImageView];
    double v4 = *(double *)off_1E5DAB010;
    double v5 = *((double *)off_1E5DAB010 + 1);
    double v6 = *((double *)off_1E5DAB010 + 2);
    double v7 = *((double *)off_1E5DAB010 + 3);
    id v8 = [v3 layer];
    objc_msgSend(v8, "setContentsRect:", v4, v5, v6, v7);

    [v3 setImage:v9];
  }
}

void __85__PXSharedLibraryIncludedPeopleViewController_collectionView_cellForItemAtIndexPath___block_invoke_3(uint64_t a1, void *a2)
{
  id v9 = a2;
  if ([*(id *)(a1 + 32) tag] == *(void *)(a1 + 40))
  {
    v3 = [*(id *)(a1 + 32) faceImageView];
    double v4 = *(double *)off_1E5DAB010;
    double v5 = *((double *)off_1E5DAB010 + 1);
    double v6 = *((double *)off_1E5DAB010 + 2);
    double v7 = *((double *)off_1E5DAB010 + 3);
    id v8 = [v3 layer];
    objc_msgSend(v8, "setContentsRect:", v4, v5, v6, v7);

    [v3 setImage:v9];
  }
}

void __85__PXSharedLibraryIncludedPeopleViewController_collectionView_cellForItemAtIndexPath___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) tag] == *(void *)(a1 + 48))
  {
    id v7 = [*(id *)(a1 + 32) faceImageView];
    double v2 = *(double *)(a1 + 56);
    double v3 = *(double *)(a1 + 64);
    double v4 = *(double *)(a1 + 72);
    double v5 = *(double *)(a1 + 80);
    double v6 = [v7 layer];
    objc_msgSend(v6, "setContentsRect:", v2, v3, v4, v5);

    [v7 setImage:*(void *)(a1 + 40)];
  }
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  double v5 = [(PXSharedLibraryIncludedPeopleViewController *)self dataSourceManager];
  double v6 = [v5 dataSource];
  int64_t v7 = [v6 numberOfItemsInSection:a4];

  return v7;
}

- (void)viewDidLayoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)PXSharedLibraryIncludedPeopleViewController;
  [(PXSharedLibraryIncludedPeopleViewController *)&v14 viewDidLayoutSubviews];
  double v3 = [(PXSharedLibraryIncludedPeopleViewController *)self collectionView];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  p_collectionViewBounds = &self->_collectionViewBounds;
  v15.origin.x = v4;
  v15.origin.y = v6;
  v15.size.width = v8;
  v15.size.height = v10;
  if (!CGRectEqualToRect(*p_collectionViewBounds, v15))
  {
    p_collectionViewBounds->origin.x = v5;
    p_collectionViewBounds->origin.y = v7;
    p_collectionViewBounds->size.width = v9;
    p_collectionViewBounds->size.height = v11;
    double v13 = [v3 collectionViewLayout];
    [v13 invalidateLayout];
  }
}

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)PXSharedLibraryIncludedPeopleViewController;
  [(PXSharedLibraryIncludedPeopleViewController *)&v10 viewDidLoad];
  double v3 = [(PXSharedLibraryIncludedPeopleViewController *)self collectionView];
  CGFloat v4 = [MEMORY[0x1E4FB1618] clearColor];
  [v3 setBackgroundColor:v4];

  [v3 setDataSource:self];
  [v3 setDelegate:self];
  [v3 bounds];
  self->_collectionViewBounds.origin.x = v5;
  self->_collectionViewBounds.origin.y = v6;
  self->_collectionViewBounds.size.width = v7;
  self->_collectionViewBounds.size.height = v8;
  [v3 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"PXSharedLibraryIncludedPeopleCellReuseIdentifier"];
  [v3 reloadData];
  CGFloat v9 = [(PXSharedLibraryIncludedPeopleViewController *)self dataSourceManager];
  [v9 registerChangeObserver:self context:PXSharedLibraryIncludedPeopleRulesObservationContext];
}

- (PXSharedLibraryIncludedPeopleViewController)initWithDataSourceManager:(id)a3
{
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4FB15C0]);
  [v6 setMinimumLineSpacing:58.0];
  v10.receiver = self;
  v10.super_class = (Class)PXSharedLibraryIncludedPeopleViewController;
  CGFloat v7 = [(PXSharedLibraryIncludedPeopleViewController *)&v10 initWithCollectionViewLayout:v6];
  CGFloat v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_dataSourceManager, a3);
  }

  return v8;
}

+ (double)heightForWidth:(double)a3 numberOfItems:(unint64_t)a4
{
  +[PXPeopleGridSizer marginForGridClass:width:](PXPeopleGridSizer, "marginForGridClass:width:", 0);
  double v7 = v6;
  +[PXPeopleGridSizer cellSizeForGridClass:0 width:a3];
  double v9 = v8;
  float v10 = (double)a4
      / (double)+[PXPeopleGridSizer numberOfColumnsForGridClass:0 width:a3];
  double v11 = (v9 + 58.0) * (double)vcvtps_u32_f32(v10);
  double v12 = v7 + v11;
  BOOL v13 = v11 <= 0.0;
  double result = 0.0;
  if (!v13) {
    return v12;
  }
  return result;
}

@end