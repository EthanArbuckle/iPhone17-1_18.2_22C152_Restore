@interface PXPeopleDetailViewController
- (BOOL)pu_shouldOptOutFromChromelessBars;
- (BOOL)shouldUpdateStatusBarTitle;
- (NSArray)people;
- (PXPeopleDetailViewController)initWithPeople:(id)a3 ignoreSharedLibraryFilters:(BOOL)a4;
- (PXPeopleDetailViewController)initWithPeople:(id)a3 options:(unint64_t)a4 ignoreSharedLibraryFilters:(BOOL)a5;
- (void)_launchNaming:(id)a3;
- (void)_replaceSelfWithNewDetailViewForPerson:(id)a3;
- (void)_setupHeader;
- (void)_updateDataSourceWithCollectionForPerson:(id)a3;
- (void)_updateHeader;
- (void)photoLibraryDidChangeOnMainQueue:(id)a3 withPreparedInfo:(id)a4;
- (void)presentBootstrapViewControllerWithType:(unint64_t)a3;
- (void)setPeople:(id)a3;
- (void)viewDidLoad;
@end

@implementation PXPeopleDetailViewController

- (void).cxx_destruct
{
}

- (void)setPeople:(id)a3
{
}

- (NSArray)people
{
  return self->_people;
}

- (void)photoLibraryDidChangeOnMainQueue:(id)a3 withPreparedInfo:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [(PXPeopleDetailViewController *)self people];
  uint64_t v7 = [v6 count];

  if (v7 == 1)
  {
    v8 = [(PXPeopleDetailViewController *)self people];
    v9 = [v8 firstObject];

    v10 = [v5 changeDetailsForObject:v9];
    if (v10)
    {
      v11 = PLUIGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v28 = v9;
        __int16 v29 = 2112;
        uint64_t v30 = (uint64_t)v10;
        _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_DEFAULT, "Change details for person (%@): %@", buf, 0x16u);
      }

      v12 = [v9 localIdentifier];
      v13 = +[PXPeopleUtilities personWithLocalIdentifier:v12];

      if (v13 && [v13 verifiedType] != -2)
      {
        v20 = objc_msgSend(v13, "px_localizedName");
        v21 = objc_msgSend(v9, "px_localizedName");
        char v22 = [v20 isEqualToString:v21];

        if ((v22 & 1) == 0)
        {
          v26 = v13;
          v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
          [(PXPeopleDetailViewController *)self setPeople:v23];

          [(PXPeopleDetailViewController *)self refreshName];
        }
      }
      else
      {
        v14 = PLUIGetLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v15 = [v13 verifiedType];
          *(_DWORD *)buf = 138412546;
          v28 = v13;
          __int16 v29 = 2048;
          uint64_t v30 = v15;
          _os_log_impl(&dword_1A9AE7000, v14, OS_LOG_TYPE_DEFAULT, "Current person is missing or tombstoned. %@ (%ld)", buf, 0x16u);
        }

        v16 = [v9 uuid];
        v17 = +[PXPeopleUtilities finalMergeTargetPersonForPersonWithUUID:v16];

        v18 = PLUIGetLog();
        v19 = v18;
        if (v17)
        {
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v28 = v17;
            _os_log_impl(&dword_1A9AE7000, v19, OS_LOG_TYPE_DEFAULT, "Replacing the people detail view with the final merge target person %@.", buf, 0xCu);
          }

          [(PXPeopleDetailViewController *)self _replaceSelfWithNewDetailViewForPerson:v17];
        }
        else
        {
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A9AE7000, v19, OS_LOG_TYPE_ERROR, "Dismissing the people detail view because current person is missing and no final merge target can be found.", buf, 2u);
          }

          v24 = [(PXPeopleDetailViewController *)self navigationController];
          id v25 = (id)[v24 popToRootViewControllerAnimated:1];
        }
      }
    }
  }
}

- (void)_updateDataSourceWithCollectionForPerson:(id)a3
{
  id v6 = +[PXPeopleUtilities assetCollectionListFetchResultForPerson:a3];
  v4 = [(PXPhotosDetailsUIViewController *)self context];
  id v5 = [v4 photosDataSource];
  [v5 setCollectionListFetchResult:v6];
}

- (void)_launchNaming:(id)a3
{
}

- (void)_updateHeader
{
  id v9 = [(PXPhotosDetailsUIViewController *)self barsController];
  v3 = [(PXPeopleDetailViewController *)self people];
  v4 = +[PXPeopleUtilities titleStringForPeople:v3];

  if (![v4 length])
  {
    uint64_t v5 = PXLocalizedStringFromTable(@"PXPeopleAddNameNoPlus", @"PhotosUICore");

    v4 = (void *)v5;
  }
  id v6 = [v9 peopleTitleView];
  [v6 setTitle:v4 forState:0];
  uint64_t v7 = [(PXPeopleDetailViewController *)self navigationItem];
  v8 = [v7 titleView];
  [v8 sizeToFit];
}

- (void)_setupHeader
{
  id v9 = [(PXPhotosDetailsUIViewController *)self barsController];
  v3 = [(PXPeopleDetailViewController *)self people];
  v4 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
  uint64_t v5 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2908]];
  id v6 = [v4 titleLabel];
  [v6 setFont:v5];

  if ([v3 count] == 1)
  {
    [v4 addTarget:self action:sel__launchNaming_ forControlEvents:64];
    uint64_t v7 = [v3 firstObject];
    [v9 setPeopleTitleView:v4];
    if (v7)
    {
      [v9 setPerson:v7];
    }
  }
  else
  {
    [v4 setUserInteractionEnabled:0];
    v8 = [MEMORY[0x1E4FB1618] labelColor];
    [v4 setTintColor:v8];

    [v9 setPeopleTitleView:v4];
  }
  [(PXPeopleDetailViewController *)self _updateHeader];
}

- (void)_replaceSelfWithNewDetailViewForPerson:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(PXPeopleDetailViewController *)self navigationController];
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 topViewController];
    NSClassFromString(&cfstr_Puoneupviewcon.isa);
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v9 = [(UIViewController *)self px_oneUpPresentation];
      v10 = [v9 lastViewedAssetReference];
    }
    else
    {
      v10 = 0;
    }
    v11 = [PXPeopleDetailViewController alloc];
    v19[0] = v4;
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
    v13 = [(PXPeopleDetailViewController *)v11 initWithPeople:v12 ignoreSharedLibraryFilters:0];

    if (v10) {
      [(PXPhotosDetailsUIViewController *)v13 setInitiallyPresentedAssetReference:v10];
    }
    v14 = [v6 viewControllers];
    uint64_t v15 = (void *)[v14 mutableCopy];

    uint64_t v16 = [v15 indexOfObject:self];
    objc_msgSend(v15, "removeObjectsInRange:", v16, objc_msgSend(v15, "count") - v16);
    if (v13)
    {
      [v15 addObject:v13];
    }
    else
    {
      v17 = PLUIGetLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v18 = 0;
        _os_log_impl(&dword_1A9AE7000, v17, OS_LOG_TYPE_ERROR, "Popping people detail view because a replacement view controller came back as nil.", v18, 2u);
      }
    }
    [v6 setViewControllers:v15 animated:0];
  }
}

- (void)presentBootstrapViewControllerWithType:(unint64_t)a3
{
  uint64_t v5 = [(PXPeopleDetailViewController *)self people];
  id v12 = [v5 firstObject];

  id v6 = +[PXPeopleBootstrapContext contextWithPerson:v12 type:a3];
  uint64_t v7 = NSString;
  v8 = [MEMORY[0x1E4F28F80] processInfo];
  id v9 = [v8 processName];
  v10 = [@"/Library/Caches/com.apple.xbs/Sources/Photos_UICore/workspaces/photosshared/PhotosUICore/PhotosUICore/People/Detail/PXPeopleDetailViewController.m" lastPathComponent];
  v11 = [v7 stringWithFormat:@"%@:%@:%s:%d", v9, v10, "-[PXPeopleDetailViewController presentBootstrapViewControllerWithType:]", 75];
  [v6 setCallerInfo:v11];

  +[PXPeopleUtilities showBootstrapIfNeededWithContext:v6 fromParentVC:self force:a3 == 1 delegate:0];
}

- (BOOL)pu_shouldOptOutFromChromelessBars
{
  return 1;
}

- (BOOL)shouldUpdateStatusBarTitle
{
  return 0;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)PXPeopleDetailViewController;
  [(PXPhotosDetailsUIViewController *)&v4 viewDidLoad];
  v3 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  objc_msgSend(v3, "px_registerChangeObserver:", self);

  [(PXPeopleDetailViewController *)self _setupHeader];
}

- (PXPeopleDetailViewController)initWithPeople:(id)a3 options:(unint64_t)a4 ignoreSharedLibraryFilters:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  if ([v8 count])
  {
    id v9 = [[PXPeopleDetailsContext alloc] initWithPeople:v8 parentContext:0 ignoreSharedLibraryFilters:v5];
    v10 = objc_alloc_init(PXPhotosDetailsConfiguration);
    [(PXPhotosDetailsConfiguration *)v10 setBarsControllerClass:objc_opt_class()];
    [(PXPhotosDetailsConfiguration *)v10 setOptions:a4];
    v16.receiver = self;
    v16.super_class = (Class)PXPeopleDetailViewController;
    v11 = [(PXPhotosDetailsUIViewController *)&v16 initWithContext:v9 configuration:v10];
    if (v11)
    {
      uint64_t v12 = [v8 copy];
      people = v11->_people;
      v11->_people = (NSArray *)v12;
    }
    self = v11;

    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (PXPeopleDetailViewController)initWithPeople:(id)a3 ignoreSharedLibraryFilters:(BOOL)a4
{
  return [(PXPeopleDetailViewController *)self initWithPeople:a3 options:0 ignoreSharedLibraryFilters:a4];
}

@end