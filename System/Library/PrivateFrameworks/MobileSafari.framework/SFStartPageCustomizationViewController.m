@interface SFStartPageCustomizationViewController
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (BOOL)showsBackgroundImagesCell;
- (BOOL)showsCloseButton;
- (SFStartPageCustomizationDataSource)dataSource;
- (SFStartPageCustomizationViewController)initWithDataSource:(id)a3;
- (id)_backgroundImageIdentifier;
- (id)collectionView:(id)a3 targetIndexPathForMoveOfItemFromOriginalIndexPath:(id)a4 atCurrentIndexPath:(id)a5 toProposedIndexPath:(id)a6;
- (id)identifierToCustomizationItemMapForItemVariant:(int64_t)a3;
- (id)makeBackgroundImageRegistration;
- (id)makeBackgroundImageToggleRegistration;
- (id)makeBackgroundImagesCollectionViewLayout;
- (id)makeCustomizationItemRegistration;
- (id)makeCustomizationSyncFooterRegistration;
- (id)makeCustomizationSyncToggleRegistration;
- (id)makeFixedCustomizationItemRegistration;
- (id)makeReorderingHandlers;
- (id)makeRootCollectionViewLayout;
- (id)makeSuggestionDataSourcesToggleRegistration;
- (id)makeSuggestionsDataSourcesHeaderRegistration;
- (unint64_t)preferredBackgroundImagesCollectionViewColumnCount;
- (void)_createGeneratedBackgroundImageItemProvider;
- (void)_createMobileAssetBackgroundImageItemProviders;
- (void)_didSelectMobileAssetBackgroundImageCell:(id)a3;
- (void)_dismiss:(id)a3;
- (void)_setCustomizationSyncWithValue:(id)a3;
- (void)_updateGeneratedBackgroundImageItemProviderWithImage:(id)a3;
- (void)_updateHasGeneratedBackgroundImage:(id)a3;
- (void)_updateImageWithURL:(id)a3;
- (void)_updateMobileAssetBackgroundImageItemProviderWithImage:(id)a3 fileName:(id)a4;
- (void)backgroundImageCellDidSelectClearButton:(id)a3;
- (void)backgroundImagesDidChange:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)dealloc;
- (void)didChangeCustomizationItemOrder:(id)a3 forVariant:(int64_t)a4;
- (void)mobileAssetBackgroundImageInstalled:(id)a3;
- (void)picker:(id)a3 didFinishPicking:(id)a4;
- (void)reloadDataAnimatingDifferences:(BOOL)a3;
- (void)setCustomizationItemIdentifier:(id)a3 inSection:(id)a4 enabled:(BOOL)a5;
- (void)setDataSource:(id)a3;
- (void)setPreferredBackgroundImagesCollectionViewColumnCount:(unint64_t)a3;
- (void)setShowsCloseButton:(BOOL)a3;
- (void)setUpBackgroundImagesCollectionViewDataSource;
- (void)setUpRootCollectionViewDataSource;
- (void)showPhotoPicker;
- (void)startPageCustomizationCellDidChangeValue:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation SFStartPageCustomizationViewController

- (SFStartPageCustomizationViewController)initWithDataSource:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)SFStartPageCustomizationViewController;
  v5 = [(SFStartPageCustomizationViewController *)&v31 initWithNibName:0 bundle:0];
  if (v5)
  {
    v6 = _WBSLocalizedString();
    [(SFStartPageCustomizationViewController *)v5 setTitle:v6];

    v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v8 = (void *)MEMORY[0x1E4F1CB10];
    v9 = _SFSafariContainerPath();
    v10 = [v8 fileURLWithPath:v9];
    v11 = [v10 URLByAppendingPathComponent:@"Library" isDirectory:1];
    v12 = [v11 URLByAppendingPathComponent:@"Caches" isDirectory:1];

    uint64_t v13 = [objc_alloc(MEMORY[0x1E4F98E80]) initWithBundle:v7 localCachesDirectory:v12];
    backgroundImagesDataSource = v5->_backgroundImagesDataSource;
    v5->_backgroundImagesDataSource = (WBSStartPageBackgroundImagesDataSource *)v13;

    objc_storeWeak((id *)&v5->_dataSource, v4);
    uint64_t v15 = [MEMORY[0x1E4F1CA60] dictionary];
    identifierToFixedCustomizationItemMap = v5->_identifierToFixedCustomizationItemMap;
    v5->_identifierToFixedCustomizationItemMap = (NSMutableDictionary *)v15;

    uint64_t v17 = [MEMORY[0x1E4F1CA60] dictionary];
    identifierToCustomizationItemMap = v5->_identifierToCustomizationItemMap;
    v5->_identifierToCustomizationItemMap = (NSMutableDictionary *)v17;

    uint64_t v19 = [MEMORY[0x1E4F1CA60] dictionary];
    mobileAssetFileNameToItemProvider = v5->_mobileAssetFileNameToItemProvider;
    v5->_mobileAssetFileNameToItemProvider = (NSMutableDictionary *)v19;

    uint64_t v21 = [MEMORY[0x1E4F1CA60] dictionary];
    identifierToSuggestionsDataSourceCustomizationItemMap = v5->_identifierToSuggestionsDataSourceCustomizationItemMap;
    v5->_identifierToSuggestionsDataSourceCustomizationItemMap = (NSMutableDictionary *)v21;

    [(SFStartPageCustomizationViewController *)v5 _updateHasGeneratedBackgroundImage:v4];
    v23 = [v4 backgroundImageAssetControllerForCustomizationViewController:v5];
    v24 = [v23 fileNames];
    uint64_t v25 = [v24 copy];
    mobileAssetFileNames = v5->_mobileAssetFileNames;
    v5->_mobileAssetFileNames = (NSArray *)v25;

    [(SFStartPageCustomizationViewController *)v5 _createMobileAssetBackgroundImageItemProviders];
    v27 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v27 addObserver:v5 selector:sel_mobileAssetBackgroundImageInstalled_ name:*MEMORY[0x1E4F99038] object:v5->_backgroundImagesDataSource];

    v28 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v28 addObserver:v5 selector:sel_backgroundImagesDidChange_ name:*MEMORY[0x1E4F99678] object:v5->_backgroundImagesDataSource];

    v29 = v5;
  }

  return v5;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SFStartPageCustomizationViewController;
  [(SFStartPageCustomizationViewController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v14.receiver = self;
  v14.super_class = (Class)SFStartPageCustomizationViewController;
  [(SFStartPageCustomizationViewController *)&v14 viewDidLoad];
  v3 = [(SFStartPageCustomizationViewController *)self view];
  objc_super v4 = [(SFStartPageCustomizationViewController *)self makeRootCollectionViewLayout];
  id v5 = objc_alloc(MEMORY[0x1E4FB1568]);
  [v3 bounds];
  v6 = (UICollectionView *)objc_msgSend(v5, "initWithFrame:collectionViewLayout:", v4);
  rootCollectionView = self->_rootCollectionView;
  self->_rootCollectionView = v6;

  [(UICollectionView *)self->_rootCollectionView setAutoresizingMask:18];
  v8 = [MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
  [(UICollectionView *)self->_rootCollectionView setBackgroundColor:v8];

  [(UICollectionView *)self->_rootCollectionView setDelegate:self];
  [(UICollectionView *)self->_rootCollectionView setAccessibilityIdentifier:@"StartPageCustomizationMenu"];
  [(UICollectionView *)self->_rootCollectionView registerClass:objc_opt_class() forCellWithReuseIdentifier:@"background-images-grid"];
  [v3 addSubview:self->_rootCollectionView];
  [(SFStartPageCustomizationViewController *)self setUpRootCollectionViewDataSource];
  v9 = [(SFStartPageCustomizationViewController *)self makeBackgroundImagesCollectionViewLayout];
  id v10 = objc_alloc(MEMORY[0x1E4FB1568]);
  v11 = [(SFStartPageCustomizationViewController *)self view];
  [v11 bounds];
  v12 = (UICollectionView *)objc_msgSend(v10, "initWithFrame:collectionViewLayout:", v9);
  backgroundImagesCollectionView = self->_backgroundImagesCollectionView;
  self->_backgroundImagesCollectionView = v12;

  [(UICollectionView *)self->_backgroundImagesCollectionView setDelegate:self];
  [(UICollectionView *)self->_backgroundImagesCollectionView setAccessibilityIdentifier:@"StartPageBackgroundImageCollection"];
  [(SFStartPageCustomizationViewController *)self setUpBackgroundImagesCollectionViewDataSource];
  [(SFStartPageCustomizationViewController *)self reloadDataAnimatingDifferences:0];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SFStartPageCustomizationViewController;
  [(SFStartPageCustomizationViewController *)&v5 viewDidDisappear:a3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained startPageCustomizationViewControllerDidFinish:self];
  }
}

- (void)_updateGeneratedBackgroundImageItemProviderWithImage:(id)a3
{
  id v4 = a3;
  objc_super v5 = objc_msgSend(MEMORY[0x1E4FB1818], "imageWithCGImage:", objc_msgSend(v4, "CGImage"));
  v6 = (NSItemProvider *)[objc_alloc(MEMORY[0x1E4F28D78]) initWithObject:v5];
  generatedBackgroundImageItemProvider = self->_generatedBackgroundImageItemProvider;
  self->_generatedBackgroundImageItemProvider = v6;

  [(NSItemProvider *)self->_generatedBackgroundImageItemProvider setSuggestedName:@"GeneratedProfileImage"];
  if (v5)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __95__SFStartPageCustomizationViewController__updateGeneratedBackgroundImageItemProviderWithImage___block_invoke;
    v8[3] = &unk_1E54ED4C0;
    id v9 = v5;
    [(NSItemProvider *)self->_generatedBackgroundImageItemProvider setPreviewImageHandler:v8];
  }
}

uint64_t __95__SFStartPageCustomizationViewController__updateGeneratedBackgroundImageItemProviderWithImage___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void, void))(a2 + 16))(a2, *(void *)(a1 + 32), 0);
}

- (void)_createGeneratedBackgroundImageItemProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  id v4 = [WeakRetained profileProviderForCustomizationViewController:self];

  objc_super v5 = [MEMORY[0x1E4F98E88] defaultManager];
  if (self->_hasGeneratedBackgroundImage)
  {
    v6 = [(SFStartPageCustomizationViewController *)self _backgroundImageIdentifier];
    v7 = [MEMORY[0x1E4F98E88] defaultManager];
    v8 = [v4 activeProfile];
    id v9 = [v7 imageForIdentifier:v6 forProfile:v8];

    [(SFStartPageCustomizationViewController *)self _updateGeneratedBackgroundImageItemProviderWithImage:v9];
  }
  else
  {
    objc_initWeak(&location, self);
    id v10 = [v4 activeProfile];
    v11 = [v10 symbolImageName];
    v12 = [v4 activeProfileIdentifier];
    uint64_t v13 = [v4 activeProfile];
    objc_super v14 = [v13 color];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __85__SFStartPageCustomizationViewController__createGeneratedBackgroundImageItemProvider__block_invoke;
    v15[3] = &unk_1E54ED4E8;
    objc_copyWeak(&v17, &location);
    id v16 = v5;
    [v16 generateProfileSpecificBackgroundImageWithSymbol:v11 forProfile:v12 withColor:v14 completionHandler:v15];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
}

void __85__SFStartPageCustomizationViewController__createGeneratedBackgroundImageItemProvider__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = [*(id *)(a1 + 32) fetchImage:v5];
    [WeakRetained _updateGeneratedBackgroundImageItemProviderWithImage:v4];
  }
}

- (void)_updateHasGeneratedBackgroundImage:(id)a3
{
  id v4 = [a3 profileProviderForCustomizationViewController:self];
  if ([v4 hasMultipleProfiles])
  {
    id v5 = [(SFStartPageCustomizationViewController *)self _backgroundImageIdentifier];
    v6 = [MEMORY[0x1E4F98E88] defaultManager];
    v7 = [v4 activeProfile];
    v8 = [v7 identifier];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __77__SFStartPageCustomizationViewController__updateHasGeneratedBackgroundImage___block_invoke;
    v9[3] = &unk_1E54ED510;
    v9[4] = self;
    [v6 getHasGeneratedBackgroundImage:v5 forProfileWithIdentifier:v8 completionHandler:v9];
  }
  else if (self->_hasGeneratedBackgroundImage)
  {
    self->_hasGeneratedBackgroundImage = 0;
    [(SFStartPageCustomizationViewController *)self reloadDataAnimatingDifferences:0];
  }
}

uint64_t __77__SFStartPageCustomizationViewController__updateHasGeneratedBackgroundImage___block_invoke(uint64_t result, int a2)
{
  uint64_t v2 = *(void *)(result + 32);
  if (*(unsigned __int8 *)(v2 + 1072) != a2)
  {
    *(unsigned char *)(v2 + 1072) = a2;
    return [*(id *)(result + 32) reloadDataAnimatingDifferences:0];
  }
  return result;
}

- (id)_backgroundImageIdentifier
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  id v4 = [WeakRetained profileProviderForCustomizationViewController:self];

  id v5 = [v4 activeTabGroup];
  if ([v5 isNamed])
  {
    v6 = [v4 activeTabGroup];
    [v6 uuid];
  }
  else
  {
    v6 = [v4 activeProfile];
    [v6 identifier];
  }
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  int v8 = [(__CFString *)v7 isEqualToString:*MEMORY[0x1E4F980C8]];
  id v9 = &stru_1EDA07C28;
  if (!v8) {
    id v9 = v7;
  }
  id v10 = v9;

  return v10;
}

- (void)_updateMobileAssetBackgroundImageItemProviderWithImage:(id)a3 fileName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    int v8 = objc_msgSend(MEMORY[0x1E4FB1818], "imageWithCGImage:", objc_msgSend(v6, "CGImage"));
    id v9 = (void *)[objc_alloc(MEMORY[0x1E4F28D78]) initWithObject:v8];
    [v9 setSuggestedName:v7];
    if (v8)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __106__SFStartPageCustomizationViewController__updateMobileAssetBackgroundImageItemProviderWithImage_fileName___block_invoke;
      v10[3] = &unk_1E54ED4C0;
      id v11 = v8;
      [v9 setPreviewImageHandler:v10];
    }
    [(NSMutableDictionary *)self->_mobileAssetFileNameToItemProvider setObject:v9 forKeyedSubscript:v7];
  }
}

uint64_t __106__SFStartPageCustomizationViewController__updateMobileAssetBackgroundImageItemProviderWithImage_fileName___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void, void))(a2 + 16))(a2, *(void *)(a1 + 32), 0);
}

- (void)_createMobileAssetBackgroundImageItemProviders
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  obj = self->_mobileAssetFileNames;
  uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v14;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v14 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v13 + 1) + 8 * v5);
        id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
        int v8 = objc_msgSend(v7, "safari_startPageBackgroundImageThumbnailMobileAssetFolderURL");
        CFURLRef v9 = [v8 URLByAppendingPathComponent:v6];

        id v10 = CGImageSourceCreateWithURL(v9, 0);
        id v11 = objc_msgSend(MEMORY[0x1E4F982B8], "imageByAdoptingCGImage:", CGImageSourceCreateImageAtIndex(v10, 0, 0));
        CFRelease(v10);
        [(SFStartPageCustomizationViewController *)self _updateMobileAssetBackgroundImageItemProviderWithImage:v11 fileName:v6];

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v3);
  }
}

- (void)setCustomizationItemIdentifier:(id)a3 inSection:(id)a4 enabled:(BOOL)a5
{
  BOOL v5 = a5;
  id v20 = a3;
  id v8 = a4;
  if ([v8 isEqual:@"fixed-customization-items"])
  {
    uint64_t v9 = 1;
  }
  else if ([v8 isEqual:@"customization-items"])
  {
    uint64_t v9 = 0;
  }
  else if ([v8 isEqual:@"suggestions-data"])
  {
    uint64_t v9 = 2;
  }
  else
  {
    uint64_t v9 = 0;
  }

  id v10 = [(SFStartPageCustomizationViewController *)self identifierToCustomizationItemMapForItemVariant:v9];
  id v11 = [v10 objectForKeyedSubscript:v20];
  v12 = v11;
  if (v11 && [v11 isEnabled] != v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    if (objc_opt_respondsToSelector())
    {
      long long v14 = [v12 identifier];
      [WeakRetained startPageCustomizationViewController:self willModifySectionWithIdentifier:v14 enabled:v5];
    }
    long long v15 = [v12 itemWithEnabled:v5];
    long long v16 = [v12 identifier];
    [v10 setObject:v15 forKeyedSubscript:v16];

    id v17 = [(UICollectionViewDiffableDataSource *)self->_rootCollectionViewDataSource snapshot];
    uint64_t v18 = [v17 itemIdentifiersInSectionWithIdentifier:v8];

    ++self->_reloadDataSuppressionCount;
    [(SFStartPageCustomizationViewController *)self didChangeCustomizationItemOrder:v18 forVariant:v9];
    --self->_reloadDataSuppressionCount;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && [v20 isEqualToString:*MEMORY[0x1E4F98878]]
      && !v5)
    {
      uint64_t v19 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      objc_msgSend(v19, "safari_setBool:andNotifyForKey:", 0, *MEMORY[0x1E4F98450]);
    }
  }
}

- (void)didChangeCustomizationItemOrder:(id)a3 forVariant:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(SFStartPageCustomizationViewController *)self identifierToCustomizationItemMapForItemVariant:a4];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __85__SFStartPageCustomizationViewController_didChangeCustomizationItemOrder_forVariant___block_invoke;
  v15[3] = &unk_1E54ED538;
  id v8 = v7;
  id v16 = v8;
  uint64_t v9 = objc_msgSend(v6, "safari_mapObjectsUsingBlock:", v15);
  id v10 = (void *)[v9 mutableCopy];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v12 = WeakRetained;
  if (a4 == 2)
  {
    long long v13 = [WeakRetained startPageCustomizationViewController:self customizationItemsForCustomizationVariant:0];
    [v10 addObjectsFromArray:v13];
    goto LABEL_5;
  }
  if (!a4)
  {
    long long v13 = [WeakRetained startPageCustomizationViewController:self customizationItemsForCustomizationVariant:2];
    [v10 addObjectsFromArray:v13];
LABEL_5:
  }
  ++self->_reloadDataSuppressionCount;
  long long v14 = (void *)[v10 copy];
  [v12 startPageCustomizationViewController:self didCustomizeItems:v14 withVariant:a4];

  --self->_reloadDataSuppressionCount;
}

id __85__SFStartPageCustomizationViewController_didChangeCustomizationItemOrder_forVariant___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];

  return v2;
}

- (id)identifierToCustomizationItemMapForItemVariant:(int64_t)a3
{
  if ((unint64_t)a3 <= 2) {
    a2 = (SEL)*(id *)((char *)&self->super.super.super.isa + *(&off_1E54ED8A0)[a3]);
  }
  return (id)(id)a2;
}

- (void)backgroundImagesDidChange:(id)a3
{
}

- (BOOL)showsBackgroundImagesCell
{
  if (self->_backgroundSectionUnconditionallyVisible) {
    return 1;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  char v2 = [WeakRetained isBackgroundImageEnabledForStartPageCustomizationViewController:self];

  return v2;
}

- (void)mobileAssetBackgroundImageInstalled:(id)a3
{
  uint64_t v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F99040]];

  if ([v5 length]) {
    [(SFStartPageCustomizationViewController *)self reloadDataAnimatingDifferences:1];
  }
}

- (void)setShowsCloseButton:(BOOL)a3
{
  if (self->_showsCloseButton != a3)
  {
    self->_showsCloseButton = a3;
    if (a3)
    {
      id v6 = (id)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:24 target:self action:sel__dismiss_];
      uint64_t v4 = [(SFStartPageCustomizationViewController *)self navigationItem];
      objc_msgSend(v4, "sf_setPreferredDismissOrDoneButtonItem:", v6);

      id v7 = [(SFStartPageCustomizationViewController *)self navigationItem];
      id v5 = objc_msgSend(v7, "sf_preferredDismissOrDoneButtonItem");
      [v5 setAccessibilityIdentifier:@"StartPageCustomizationMenuCloseButton"];
    }
    else
    {
      id v7 = [(SFStartPageCustomizationViewController *)self navigationItem];
      objc_msgSend(v7, "sf_setPreferredDismissOrDoneButtonItem:", 0);
    }
  }
}

- (void)_dismiss:(id)a3
{
}

- (void)reloadDataAnimatingDifferences:(BOOL)a3
{
  v78[1] = *MEMORY[0x1E4F143B8];
  if (!self->_reloadDataSuppressionCount)
  {
    BOOL v46 = a3;
    id location = (id *)&self->_dataSource;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    if (self->_rootCollectionViewDataSource)
    {
      id v47 = objc_alloc_init(MEMORY[0x1E4FB1360]);
      if ([WeakRetained isCloudSyncAvailableForStartPageCustomizationViewController:self])
      {
        v78[0] = @"customization-sync";
        uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v78 count:1];
        [v47 appendSectionsWithIdentifiers:v4];

        v77 = @"customization-sync::toggle";
        id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v77 count:1];
        [v47 appendItemsWithIdentifiers:v5 intoSectionWithIdentifier:@"customization-sync"];
      }
      v52 = [WeakRetained startPageCustomizationViewController:self customizationItemsForCustomizationVariant:1];
      configureSnapshotWithCustomizationItemsSection(v47, @"fixed-customization-items", v52, self->_identifierToFixedCustomizationItemMap);
      v49 = [WeakRetained startPageCustomizationViewController:self customizationItemsForCustomizationVariant:0];
      configureSnapshotWithCustomizationItemsSection(v47, @"customization-items", v49, self->_identifierToCustomizationItemMap);
      if ([WeakRetained isSuggestionsCustomizationAvailableForStartPageCustomizationViewController:self])
      {
        id v6 = [WeakRetained startPageCustomizationViewController:self customizationItemsForCustomizationVariant:2];
        configureSnapshotWithCustomizationItemsSection(v47, @"suggestions-data", v6, self->_identifierToSuggestionsDataSourceCustomizationItemMap);
      }
      v76 = @"background-image";
      id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v76 count:1];
      [v47 appendSectionsWithIdentifiers:v7];

      v75 = @"background-image::toggle";
      id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v75 count:1];
      [v47 appendItemsWithIdentifiers:v8 intoSectionWithIdentifier:@"background-image"];

      if ([(SFStartPageCustomizationViewController *)self showsBackgroundImagesCell])
      {
        v74 = @"background-image::grid";
        uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v74 count:1];
        [v47 appendItemsWithIdentifiers:v9 intoSectionWithIdentifier:@"background-image"];
      }
      [(UICollectionViewDiffableDataSource *)self->_rootCollectionViewDataSource applySnapshot:v47 animatingDifferences:v46];
      long long v70 = 0u;
      long long v71 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      id obj = [(UICollectionView *)self->_rootCollectionView indexPathsForVisibleItems];
      uint64_t v10 = [obj countByEnumeratingWithState:&v68 objects:v73 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v69;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v69 != v11) {
              objc_enumerationMutation(obj);
            }
            long long v13 = *(void **)(*((void *)&v68 + 1) + 8 * v12);
            long long v14 = -[UICollectionViewDiffableDataSource sectionIdentifierForIndex:](self->_rootCollectionViewDataSource, "sectionIdentifierForIndex:", [v13 section]);
            long long v15 = [(UICollectionViewDiffableDataSource *)self->_rootCollectionViewDataSource itemIdentifierForIndexPath:v13];
            if ([v15 isEqualToString:@"customization-sync::toggle"])
            {
              id v16 = [(UICollectionView *)self->_rootCollectionView cellForItemAtIndexPath:v13];
              objc_msgSend(v16, "setOn:", objc_msgSend(WeakRetained, "isCloudSyncEnabledForStartPageCustomizationViewController:", self));
LABEL_21:

              goto LABEL_22;
            }
            if ([v14 isEqual:@"fixed-customization-items"])
            {
              id v16 = [(UICollectionView *)self->_rootCollectionView cellForItemAtIndexPath:v13];
              id v17 = objc_msgSend(v52, "objectAtIndexedSubscript:", objc_msgSend(v13, "row"));
              objc_msgSend(v16, "setOn:", objc_msgSend(v17, "isEnabled"));
LABEL_20:

              goto LABEL_21;
            }
            if ([v14 isEqual:@"customization-items"])
            {
              id v16 = [(UICollectionView *)self->_rootCollectionView cellForItemAtIndexPath:v13];
              id v17 = objc_msgSend(v49, "objectAtIndexedSubscript:", objc_msgSend(v13, "row"));
              objc_msgSend(v16, "setOn:", objc_msgSend(v17, "isEnabled"));
              goto LABEL_20;
            }
            if ([v15 isEqual:@"background-image::toggle"])
            {
              id v16 = [(UICollectionView *)self->_rootCollectionView cellForItemAtIndexPath:v13];
              objc_msgSend(v16, "setOn:", -[SFStartPageCustomizationViewController showsBackgroundImagesCell](self, "showsBackgroundImagesCell"));
              goto LABEL_21;
            }
LABEL_22:

            ++v12;
          }
          while (v10 != v12);
          uint64_t v18 = [obj countByEnumeratingWithState:&v68 objects:v73 count:16];
          uint64_t v10 = v18;
        }
        while (v18);
      }
    }
    if (self->_backgroundImagesCollectionViewDataSource)
    {
      id obja = objc_alloc_init(MEMORY[0x1E4FB1360]);
      v72 = @"background-image";
      uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v72 count:1];
      [obja appendSectionsWithIdentifiers:v19];

      id v20 = [WeakRetained backgroundImageForStartPageCustomizationViewController:self];
      backgroundImagesDataSource = self->_backgroundImagesDataSource;
      v41 = v20;
      v22 = [v20 suggestedName];
      uint64_t v23 = [(WBSStartPageBackgroundImagesDataSource *)backgroundImagesDataSource indexOfBackgroundImageWithName:v22];

      v24 = [MEMORY[0x1E4F1CA48] array];
      id v48 = objc_loadWeakRetained(location);
      locationa = [v48 profileProviderForCustomizationViewController:self];
      if ([locationa hasMultipleProfiles])
      {
        BOOL hasGeneratedBackgroundImage = self->_hasGeneratedBackgroundImage;
        BOOL v26 = self->_hasGeneratedBackgroundImage;
        if (!self->_generatedBackgroundImageItemProvider) {
          [(SFStartPageCustomizationViewController *)self _createGeneratedBackgroundImageItemProvider];
        }
        v53 = [SFStartPageBackgroundImageModel alloc];
        generatedBackgroundImageItemProvider = self->_generatedBackgroundImageItemProvider;
        v42 = [locationa activeProfile];
        v50 = [v42 symbolImageName];
        v28 = [locationa activeProfile];
        v29 = [v28 identifier];
        v54 = [(SFStartPageBackgroundImageModel *)v53 initWithItemProvider:generatedBackgroundImageItemProvider symbolName:v50 profileIdentifier:v29 selected:hasGeneratedBackgroundImage];

        unint64_t v30 = 0x1E4F1C000;
      }
      else
      {
        BOOL v26 = 0;
        v54 = 0;
        unint64_t v30 = 0x1E4F1C000uLL;
      }
      uint64_t v64 = 0;
      v65 = &v64;
      uint64_t v66 = 0x2020000000;
      char v67 = 0;
      v39 = [*(id *)(v30 + 2632) array];
      objc_super v31 = [(NSMutableDictionary *)self->_mobileAssetFileNameToItemProvider keysSortedByValueUsingComparator:&__block_literal_global_59];
      v58[0] = MEMORY[0x1E4F143A8];
      v58[1] = 3221225472;
      v58[2] = __73__SFStartPageCustomizationViewController_reloadDataAnimatingDifferences___block_invoke_2;
      v58[3] = &unk_1E54ED580;
      BOOL v63 = v26;
      v62 = &v64;
      id v43 = v41;
      id v59 = v43;
      v60 = self;
      id v51 = v39;
      id v61 = v51;
      v40 = v31;
      [v31 enumerateObjectsUsingBlock:v58];
      if (*((unsigned char *)v65 + 24) || v26 || !v43 || v23 != 0x7FFFFFFFFFFFFFFFLL) {
        v32 = [[SFStartPageBackgroundImageModel alloc] initWithItemProvider:0];
      }
      else {
        v32 = [[SFStartPageBackgroundImageModel alloc] initWithItemProvider:v43];
      }
      v33 = v32;
      [v24 addObject:v32];
      if ([v51 count]) {
        [v24 addObjectsFromArray:v51];
      }
      if (v54) {
        [v24 addObject:v54];
      }
      uint64_t v34 = [(WBSStartPageBackgroundImagesDataSource *)self->_backgroundImagesDataSource itemCount];
      if (v34 >= 1)
      {
        for (uint64_t i = 0; i != v34; ++i)
        {
          char v36 = v23 != i || v26;
          BOOL v37 = (v36 & 1) == 0 && *((unsigned char *)v65 + 24) == 0;
          v38 = [[SFStartPageBackgroundImageModel alloc] initWithIndex:i inDataSource:self->_backgroundImagesDataSource selected:v37];
          [v24 addObject:v38];
        }
      }
      [obja appendItemsWithIdentifiers:v24 intoSectionWithIdentifier:@"background-image"];
      [(UICollectionViewDiffableDataSource *)self->_backgroundImagesCollectionViewDataSource applySnapshot:obja animatingDifferences:v46];

      _Block_object_dispose(&v64, 8);
    }
  }
}

uint64_t __73__SFStartPageCustomizationViewController_reloadDataAnimatingDifferences___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = [a3 suggestedName];
  id v6 = [v4 suggestedName];
  uint64_t v7 = [v5 caseInsensitiveCompare:v6];

  return v7;
}

void __73__SFStartPageCustomizationViewController_reloadDataAnimatingDifferences___block_invoke_2(uint64_t a1, void *a2)
{
  id v11 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) suggestedName];
  int v4 = [v11 isEqualToString:v3];

  if (v4 && !*(unsigned char *)(a1 + 64))
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v5 = 1;
    BOOL v7 = 1;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
    BOOL v7 = *(unsigned char *)(v6 + 24) != 0;
  }
  *(unsigned char *)(v6 + 24) = v7;
  id v8 = [SFStartPageBackgroundImageModel alloc];
  uint64_t v9 = [*(id *)(*(void *)(a1 + 40) + 1088) objectForKeyedSubscript:v11];
  uint64_t v10 = [(SFStartPageBackgroundImageModel *)v8 initWithItemProvider:v9 fileName:v11 selected:v5];

  [*(id *)(a1 + 48) addObject:v10];
}

- (void)setUpRootCollectionViewDataSource
{
  uint64_t v19 = [(SFStartPageCustomizationViewController *)self makeCustomizationSyncToggleRegistration];
  uint64_t v3 = [(SFStartPageCustomizationViewController *)self makeCustomizationSyncFooterRegistration];
  uint64_t v18 = [(SFStartPageCustomizationViewController *)self makeFixedCustomizationItemRegistration];
  id v17 = [(SFStartPageCustomizationViewController *)self makeCustomizationItemRegistration];
  id v16 = [(SFStartPageCustomizationViewController *)self makeBackgroundImageToggleRegistration];
  int v4 = [(SFStartPageCustomizationViewController *)self makeSuggestionDataSourcesToggleRegistration];
  uint64_t v5 = [(SFStartPageCustomizationViewController *)self makeSuggestionsDataSourcesHeaderRegistration];
  objc_initWeak(location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __75__SFStartPageCustomizationViewController_setUpRootCollectionViewDataSource__block_invoke;
  aBlock[3] = &unk_1E54ED5A8;
  objc_copyWeak(&v31, location);
  id v6 = v19;
  id v26 = v6;
  id v20 = v17;
  id v27 = v20;
  id v7 = v18;
  id v28 = v7;
  id v8 = v16;
  id v29 = v8;
  id v9 = v4;
  id v30 = v9;
  uint64_t v10 = _Block_copy(aBlock);
  id v11 = (UICollectionViewDiffableDataSource *)[objc_alloc(MEMORY[0x1E4FB1598]) initWithCollectionView:self->_rootCollectionView cellProvider:v10];
  rootCollectionViewDataSource = self->_rootCollectionViewDataSource;
  self->_rootCollectionViewDataSource = v11;

  long long v13 = [(SFStartPageCustomizationViewController *)self makeReorderingHandlers];
  [(UICollectionViewDiffableDataSource *)self->_rootCollectionViewDataSource setReorderingHandlers:v13];

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __75__SFStartPageCustomizationViewController_setUpRootCollectionViewDataSource__block_invoke_2;
  v21[3] = &unk_1E54ED5D0;
  objc_copyWeak(&v24, location);
  id v14 = v3;
  id v22 = v14;
  id v15 = v5;
  id v23 = v15;
  [(UICollectionViewDiffableDataSource *)self->_rootCollectionViewDataSource setSupplementaryViewProvider:v21];

  objc_destroyWeak(&v24);
  objc_destroyWeak(&v31);
  objc_destroyWeak(location);
}

id __75__SFStartPageCustomizationViewController_setUpRootCollectionViewDataSource__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 72));
  id v11 = WeakRetained;
  if (!WeakRetained)
  {
    id v17 = 0;
    goto LABEL_20;
  }
  uint64_t v12 = objc_msgSend(WeakRetained[132], "sectionIdentifierForIndex:", objc_msgSend(v8, "section"));
  if ([v12 isEqual:@"customization-sync"]
    && [v9 isEqualToString:@"customization-sync::toggle"])
  {
    uint64_t v13 = *(void *)(a1 + 32);
    id v14 = NSNumber;
    id v15 = objc_loadWeakRetained(v11 + 139);
    id v16 = objc_msgSend(v14, "numberWithBool:", objc_msgSend(v15, "isCloudSyncEnabledForStartPageCustomizationViewController:", v11));
    id v17 = [v7 dequeueConfiguredReusableCellWithRegistration:v13 forIndexPath:v8 item:v16];

LABEL_18:
    goto LABEL_19;
  }
  if ([v12 isEqual:@"customization-items"])
  {
    uint64_t v18 = *(void *)(a1 + 40);
    id v15 = [v11[127] objectForKeyedSubscript:v9];
    uint64_t v19 = [v7 dequeueConfiguredReusableCellWithRegistration:v18 forIndexPath:v8 item:v15];
LABEL_17:
    id v17 = (void *)v19;
    goto LABEL_18;
  }
  if ([v12 isEqual:@"fixed-customization-items"])
  {
    uint64_t v20 = *(void *)(a1 + 48);
    id v15 = [v11[128] objectForKeyedSubscript:v9];
    uint64_t v19 = [v7 dequeueConfiguredReusableCellWithRegistration:v20 forIndexPath:v8 item:v15];
    goto LABEL_17;
  }
  if (![v12 isEqual:@"background-image"]) {
    goto LABEL_15;
  }
  if ([v9 isEqualToString:@"background-image::toggle"])
  {
    uint64_t v21 = *(void *)(a1 + 56);
    id v15 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v11, "showsBackgroundImagesCell"));
    uint64_t v19 = [v7 dequeueConfiguredReusableCellWithRegistration:v21 forIndexPath:v8 item:v15];
    goto LABEL_17;
  }
  if (![v9 isEqualToString:@"background-image::grid"])
  {
LABEL_15:
    if (![v12 isEqual:@"suggestions-data"])
    {
      id v17 = 0;
      goto LABEL_19;
    }
    uint64_t v22 = *(void *)(a1 + 64);
    id v15 = [v11[129] objectForKeyedSubscript:v9];
    uint64_t v19 = [v7 dequeueConfiguredReusableCellWithRegistration:v22 forIndexPath:v8 item:v15];
    goto LABEL_17;
  }
  id v17 = [v7 dequeueReusableCellWithReuseIdentifier:@"background-images-grid" forIndexPath:v8];
  [v17 setCollectionView:v11[123]];
LABEL_19:

LABEL_20:

  return v17;
}

id __75__SFStartPageCustomizationViewController_setUpRootCollectionViewDataSource__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  id v9 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v10 = objc_msgSend(WeakRetained[132], "sectionIdentifierForIndex:", objc_msgSend(v7, "section"));
    int v11 = [v10 isEqual:@"customization-sync"];

    if (v11)
    {
      uint64_t v12 = (void *)(a1 + 32);
LABEL_6:
      id v15 = [v6 dequeueConfiguredReusableSupplementaryViewWithRegistration:*v12 forIndexPath:v7];
      goto LABEL_8;
    }
    uint64_t v13 = objc_msgSend(v9[132], "sectionIdentifierForIndex:", objc_msgSend(v7, "section"));
    int v14 = [v13 isEqual:@"suggestions-data"];

    if (v14)
    {
      uint64_t v12 = (void *)(a1 + 40);
      goto LABEL_6;
    }
  }
  id v15 = 0;
LABEL_8:

  return v15;
}

- (void)setUpBackgroundImagesCollectionViewDataSource
{
  uint64_t v3 = [(SFStartPageCustomizationViewController *)self makeBackgroundImageRegistration];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __87__SFStartPageCustomizationViewController_setUpBackgroundImagesCollectionViewDataSource__block_invoke;
  aBlock[3] = &unk_1E54ED5F8;
  id v4 = v3;
  id v9 = v4;
  uint64_t v5 = _Block_copy(aBlock);
  id v6 = (UICollectionViewDiffableDataSource *)[objc_alloc(MEMORY[0x1E4FB1598]) initWithCollectionView:self->_backgroundImagesCollectionView cellProvider:v5];
  backgroundImagesCollectionViewDataSource = self->_backgroundImagesCollectionViewDataSource;
  self->_backgroundImagesCollectionViewDataSource = v6;
}

id __87__SFStartPageCustomizationViewController_setUpBackgroundImagesCollectionViewDataSource__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v4 = [a2 dequeueConfiguredReusableCellWithRegistration:*(void *)(a1 + 32) forIndexPath:a3 item:a4];

  return v4;
}

- (id)makeReorderingHandlers
{
  objc_initWeak(&location, self);
  id v2 = objc_alloc_init(MEMORY[0x1E4FB15A0]);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64__SFStartPageCustomizationViewController_makeReorderingHandlers__block_invoke;
  v6[3] = &unk_1E54ED620;
  objc_copyWeak(&v7, &location);
  [v2 setCanReorderItemHandler:v6];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __64__SFStartPageCustomizationViewController_makeReorderingHandlers__block_invoke_2;
  v4[3] = &unk_1E54ED648;
  objc_copyWeak(&v5, &location);
  [v2 setDidReorderHandler:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

  return v2;
}

uint64_t __64__SFStartPageCustomizationViewController_makeReorderingHandlers__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = (void *)*((void *)WeakRetained + 132);
    id v7 = [v6 indexPathForItemIdentifier:v3];
    id v8 = objc_msgSend(v6, "sectionIdentifierForIndex:", objc_msgSend(v7, "section"));
    uint64_t v9 = [v8 isEqual:@"customization-items"];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

void __64__SFStartPageCustomizationViewController_makeReorderingHandlers__block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = [v7 finalSnapshot];
    id v5 = [v4 itemIdentifiersInSectionWithIdentifier:@"customization-items"];

    [WeakRetained didChangeCustomizationItemOrder:v5 forVariant:0];
    id v6 = objc_loadWeakRetained(WeakRetained + 139);
    if (objc_opt_respondsToSelector()) {
      [v6 didReorderSectionIdentifiersForStartPageCustomizationViewController:WeakRetained];
    }
  }
}

- (id)makeRootCollectionViewLayout
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1580]);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __70__SFStartPageCustomizationViewController_makeRootCollectionViewLayout__block_invoke;
  v6[3] = &unk_1E54ED670;
  void v6[4] = self;
  id v4 = (void *)[v3 initWithSectionProvider:v6];

  return v4;
}

id __70__SFStartPageCustomizationViewController_makeRootCollectionViewLayout__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4FB1558]) initWithAppearance:2];
  id v7 = [*(id *)(*(void *)(a1 + 32) + 1056) sectionIdentifierForIndex:a2];
  if ([v7 isEqual:@"background-image"])
  {
    id v8 = [v6 separatorConfiguration];
    [v8 setTopSeparatorVisibility:2];
    [v8 setBottomSeparatorVisibility:2];
    [v6 setSeparatorConfiguration:v8];
  }
  if ([v7 isEqual:@"customization-sync"]) {
    [v6 setFooterMode:1];
  }
  if ([v7 isEqual:@"suggestions-data"]) {
    [v6 setHeaderMode:1];
  }
  uint64_t v9 = [MEMORY[0x1E4FB1330] sectionWithListConfiguration:v6 layoutEnvironment:v5];
  [v9 contentInsets];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  if (a2 < 1)
  {
    id v16 = 0;
  }
  else
  {
    id v16 = [*(id *)(*(void *)(a1 + 32) + 1056) sectionIdentifierForIndex:a2 - 1];
  }
  int v17 = [v16 isEqual:@"customization-sync"];
  double v18 = 0.0;
  if (v17) {
    double v18 = 8.0;
  }
  objc_msgSend(v9, "setContentInsets:", v18, v11, v13, v15);

  return v9;
}

- (id)makeBackgroundImagesCollectionViewLayout
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1580]);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __82__SFStartPageCustomizationViewController_makeBackgroundImagesCollectionViewLayout__block_invoke;
  v6[3] = &unk_1E54ED670;
  void v6[4] = self;
  id v4 = (void *)[v3 initWithSectionProvider:v6];

  return v4;
}

id __82__SFStartPageCustomizationViewController_makeBackgroundImagesCollectionViewLayout__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [*(id *)(a1 + 32) preferredBackgroundImagesCollectionViewColumnCount];
  if (v5)
  {
    double v6 = (double)v5;
  }
  else
  {
    id v7 = [v4 container];
    [v7 effectiveContentSize];
    if (v8 < 430.0) {
      double v6 = 3.0;
    }
    else {
      double v6 = 5.0;
    }
  }
  uint64_t v9 = [v4 container];
  [v9 effectiveContentSize];
  double v11 = (v10 + -32.0 + (v6 + -1.0) * -8.0) / v6;

  double v12 = [MEMORY[0x1E4FB1308] absoluteDimension:v11];
  double v13 = [MEMORY[0x1E4FB1338] sizeWithWidthDimension:v12 heightDimension:v12];
  double v14 = [MEMORY[0x1E4FB1328] itemWithLayoutSize:v13];
  double v15 = (void *)MEMORY[0x1E4FB1338];
  id v16 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:1.0];
  int v17 = [MEMORY[0x1E4FB1308] estimatedDimension:100.0];
  double v18 = [v15 sizeWithWidthDimension:v16 heightDimension:v17];

  uint64_t v19 = (void *)MEMORY[0x1E4FB1318];
  v25[0] = v14;
  uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
  uint64_t v21 = [v19 horizontalGroupWithLayoutSize:v18 subitems:v20];

  uint64_t v22 = [MEMORY[0x1E4FB1340] flexibleSpacing:8.0];
  [v21 setInterItemSpacing:v22];

  id v23 = [MEMORY[0x1E4FB1330] sectionWithGroup:v21];
  objc_msgSend(v23, "setContentInsets:", 1.0, 16.0, 15.0, 16.0);
  [v23 setInterGroupSpacing:8.0];

  return v23;
}

- (id)makeCustomizationItemRegistration
{
  objc_initWeak(&location, self);
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  id v7 = __75__SFStartPageCustomizationViewController_makeCustomizationItemRegistration__block_invoke;
  double v8 = &unk_1E54ED698;
  objc_copyWeak(&v9, &location);
  id v2 = _Block_copy(&v5);
  id v3 = objc_msgSend(MEMORY[0x1E4FB1578], "registrationWithCellClass:configurationHandler:", objc_opt_class(), v2, v5, v6, v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v3;
}

void __75__SFStartPageCustomizationViewController_makeCustomizationItemRegistration__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v6, "setOn:", objc_msgSend(v7, "isEnabled"));
    [v6 setDelegate:WeakRetained];
    id v9 = [v6 defaultContentConfiguration];
    id v10 = objc_alloc(MEMORY[0x1E4F28B18]);
    double v11 = [v7 title];
    double v12 = sectionTextAttributes();
    double v13 = (void *)[v10 initWithString:v11 attributes:v12];
    [v9 setAttributedText:v13];

    double v14 = [v7 icon];
    [v9 setImage:v14];

    double v15 = [v9 textProperties];
    id v16 = [v15 color];
    int v17 = [v9 imageProperties];
    [v17 setTintColor:v16];

    [v6 setContentConfiguration:v9];
    double v18 = NSString;
    uint64_t v19 = [v7 identifier];
    uint64_t v20 = [v18 stringWithFormat:@"%@MenuRow", v19];
    [v6 setAccessibilityIdentifier:v20];

    id v21 = objc_alloc_init(MEMORY[0x1E4FB1548]);
    [v21 setDisplayedState:0];
    [v21 setShowsVerticalSeparator:0];
    v23[0] = v21;
    uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
    [v6 setAccessories:v22];
  }
}

- (id)makeBackgroundImageToggleRegistration
{
  objc_initWeak(&location, self);
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  id v7 = __79__SFStartPageCustomizationViewController_makeBackgroundImageToggleRegistration__block_invoke;
  double v8 = &unk_1E54ED6C0;
  objc_copyWeak(&v9, &location);
  id v2 = _Block_copy(&v5);
  id v3 = objc_msgSend(MEMORY[0x1E4FB1578], "registrationWithCellClass:configurationHandler:", objc_opt_class(), v2, v5, v6, v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v3;
}

void __79__SFStartPageCustomizationViewController_makeBackgroundImageToggleRegistration__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v14 = a2;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v14, "setOn:", objc_msgSend(v6, "BOOLValue"));
    [v14 setDelegate:WeakRetained];
    double v8 = [v14 defaultContentConfiguration];
    id v9 = _WBSLocalizedString();
    [v8 setText:v9];

    id v10 = [MEMORY[0x1E4FB1818] systemImageNamed:@"photo"];
    [v8 setImage:v10];

    double v11 = [v8 textProperties];
    double v12 = [v11 color];
    double v13 = [v8 imageProperties];
    [v13 setTintColor:v12];

    [v14 setContentConfiguration:v8];
    [v14 setAccessibilityIdentifier:@"backgroundImageItemIdentifierMenuRow"];
  }
}

- (id)makeSuggestionDataSourcesToggleRegistration
{
  objc_initWeak(&location, self);
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  id v7 = __85__SFStartPageCustomizationViewController_makeSuggestionDataSourcesToggleRegistration__block_invoke;
  double v8 = &unk_1E54ED698;
  objc_copyWeak(&v9, &location);
  id v2 = _Block_copy(&v5);
  id v3 = objc_msgSend(MEMORY[0x1E4FB1578], "registrationWithCellClass:configurationHandler:", objc_opt_class(), v2, v5, v6, v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v3;
}

void __85__SFStartPageCustomizationViewController_makeSuggestionDataSourcesToggleRegistration__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v20 = a2;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v20, "setOn:", objc_msgSend(v6, "isEnabled"));
    [v20 setDelegate:WeakRetained];
    double v8 = [v20 defaultContentConfiguration];
    id v9 = objc_alloc(MEMORY[0x1E4F28B18]);
    id v10 = [v6 title];
    double v11 = sectionTextAttributes();
    double v12 = (void *)[v9 initWithString:v10 attributes:v11];
    [v8 setAttributedText:v12];

    double v13 = [v6 icon];
    [v8 setImage:v13];

    id v14 = [v8 textProperties];
    double v15 = [v14 color];
    id v16 = [v8 imageProperties];
    [v16 setTintColor:v15];

    [v20 setContentConfiguration:v8];
    int v17 = NSString;
    double v18 = [v6 identifier];
    uint64_t v19 = [v17 stringWithFormat:@"%@MenuRow", v18];
    [v20 setAccessibilityIdentifier:v19];
  }
}

- (id)makeSuggestionsDataSourcesHeaderRegistration
{
  id v2 = [MEMORY[0x1E4FB15F8] registrationWithSupplementaryClass:objc_opt_class() elementKind:*MEMORY[0x1E4FB2770] configurationHandler:&__block_literal_global_129];

  return v2;
}

void __86__SFStartPageCustomizationViewController_makeSuggestionsDataSourcesHeaderRegistration__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v2 = [MEMORY[0x1E4FB1948] headerConfiguration];
  id v3 = _WBSLocalizedString();
  [v2 setText:v3];

  [v4 setContentConfiguration:v2];
}

- (id)makeBackgroundImageRegistration
{
  objc_initWeak(&location, self);
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  id v7 = __73__SFStartPageCustomizationViewController_makeBackgroundImageRegistration__block_invoke;
  double v8 = &unk_1E54ED730;
  objc_copyWeak(&v9, &location);
  id v2 = _Block_copy(&v5);
  id v3 = objc_msgSend(MEMORY[0x1E4FB1578], "registrationWithCellClass:configurationHandler:", objc_opt_class(), v2, v5, v6, v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v3;
}

void __73__SFStartPageCustomizationViewController_makeBackgroundImageRegistration__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  double v8 = (id *)(a1 + 32);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v6, "setShowsSelectionRing:", objc_msgSend(v7, "isSelected"));
    objc_msgSend(v6, "setShowsCustomImageControls:", objc_msgSend(v7, "isCustomImage"));
    [v6 setDelegate:WeakRetained];
    id v10 = [v7 mobileAssetFileName];

    if (v10)
    {
      double v11 = [v7 mobileAssetFileName];
      [v6 setMobileAssetFileName:v11];

      id v12 = objc_loadWeakRetained(WeakRetained + 139);
      double v13 = [v12 backgroundImageAssetControllerForCustomizationViewController:WeakRetained];
      id v14 = [v7 mobileAssetFileName];
      objc_msgSend(v6, "setDownloadState:", objc_msgSend(v13, "downloadStateForFileName:", v14));
    }
    uint64_t v24 = 0;
    uint64_t v25 = &v24;
    uint64_t v26 = 0x2020000000;
    char v27 = 0;
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    double v18 = __73__SFStartPageCustomizationViewController_makeBackgroundImageRegistration__block_invoke_2;
    uint64_t v19 = &unk_1E54ED708;
    objc_copyWeak(&v23, v8);
    id v15 = v6;
    id v20 = v15;
    uint64_t v22 = &v24;
    id v21 = v7;
    [v21 getThumbnailImageWithCompletionHandler:&v16];
    if (!*((unsigned char *)v25 + 24)) {
      objc_msgSend(v15, "setImage:", 0, v16, v17, v18, v19, v20);
    }

    objc_destroyWeak(&v23);
    _Block_object_dispose(&v24, 8);
  }
}

void __73__SFStartPageCustomizationViewController_makeBackgroundImageRegistration__block_invoke_2(uint64_t a1, void *a2, int a3)
{
  id v9 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    if (a3)
    {
      [*(id *)(a1 + 32) setImage:v9];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
    else
    {
      id v7 = [WeakRetained[124] indexPathForItemIdentifier:*(void *)(a1 + 40)];
      if (v7)
      {
        double v8 = [v6[123] cellForItemAtIndexPath:v7];
        [v8 setImage:v9];
      }
    }
  }
}

- (id)makeCustomizationSyncToggleRegistration
{
  objc_initWeak(&location, self);
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  id v7 = __81__SFStartPageCustomizationViewController_makeCustomizationSyncToggleRegistration__block_invoke;
  double v8 = &unk_1E54ED6C0;
  objc_copyWeak(&v9, &location);
  id v2 = _Block_copy(&v5);
  id v3 = objc_msgSend(MEMORY[0x1E4FB1578], "registrationWithCellClass:configurationHandler:", objc_opt_class(), v2, v5, v6, v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v3;
}

void __81__SFStartPageCustomizationViewController_makeCustomizationSyncToggleRegistration__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v10 = a2;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v10, "setOn:", objc_msgSend(v6, "BOOLValue"));
    [v10 setDelegate:WeakRetained];
    double v8 = [v10 defaultContentConfiguration];
    id v9 = _WBSLocalizedString();
    [v8 setText:v9];

    [v10 setContentConfiguration:v8];
  }
}

- (id)makeCustomizationSyncFooterRegistration
{
  id v2 = [MEMORY[0x1E4FB15F8] registrationWithSupplementaryClass:objc_opt_class() elementKind:*MEMORY[0x1E4FB2760] configurationHandler:&__block_literal_global_143];

  return v2;
}

void __81__SFStartPageCustomizationViewController_makeCustomizationSyncFooterRegistration__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v2 = [v4 defaultContentConfiguration];
  id v3 = _WBSLocalizedString();
  [v2 setText:v3];

  [v4 setContentConfiguration:v2];
}

- (id)makeFixedCustomizationItemRegistration
{
  objc_initWeak(&location, self);
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  id v7 = __80__SFStartPageCustomizationViewController_makeFixedCustomizationItemRegistration__block_invoke;
  double v8 = &unk_1E54ED698;
  objc_copyWeak(&v9, &location);
  id v2 = _Block_copy(&v5);
  id v3 = objc_msgSend(MEMORY[0x1E4FB1578], "registrationWithCellClass:configurationHandler:", objc_opt_class(), v2, v5, v6, v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v3;
}

void __80__SFStartPageCustomizationViewController_makeFixedCustomizationItemRegistration__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v14 = a2;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v14, "setOn:", objc_msgSend(v6, "isEnabled"));
    [v14 setDelegate:WeakRetained];
    double v8 = [v14 defaultContentConfiguration];
    id v9 = [v6 title];
    [v8 setText:v9];

    id v10 = [v6 icon];
    [v8 setImage:v10];

    double v11 = [v8 textProperties];
    id v12 = [v11 color];
    double v13 = [v8 imageProperties];
    [v13 setTintColor:v12];

    [v14 setContentConfiguration:v8];
  }
}

- (void)backgroundImageCellDidSelectClearButton:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  [WeakRetained startPageCustomizationViewController:self didSelectCustomBackgroundImage:0];

  [(SFStartPageCustomizationViewController *)self reloadDataAnimatingDifferences:1];
}

- (void)startPageCustomizationCellDidChangeValue:(id)a3
{
  id v9 = a3;
  id v4 = -[UICollectionView indexPathForCell:](self->_rootCollectionView, "indexPathForCell:");
  uint64_t v5 = -[UICollectionViewDiffableDataSource sectionIdentifierForIndex:](self->_rootCollectionViewDataSource, "sectionIdentifierForIndex:", [v4 section]);
  if ([v5 isEqual:@"customization-sync"])
  {
    [(SFStartPageCustomizationViewController *)self _setCustomizationSyncWithValue:v9];
  }
  else if (([v5 isEqual:@"fixed-customization-items"] & 1) != 0 {
         || ([v5 isEqual:@"customization-items"] & 1) != 0
  }
         || [v5 isEqual:@"suggestions-data"])
  {
    id v6 = [(UICollectionViewDiffableDataSource *)self->_rootCollectionViewDataSource itemIdentifierForIndexPath:v4];
    if (v6)
    {
      -[SFStartPageCustomizationViewController setCustomizationItemIdentifier:inSection:enabled:](self, "setCustomizationItemIdentifier:inSection:enabled:", v6, v5, [v9 isOn]);
      if ([v6 isEqualToString:*MEMORY[0x1E4F988C8]]) {
        [(SFStartPageCustomizationViewController *)self reloadDataAnimatingDifferences:1];
      }
    }
  }
  else if ([v5 isEqual:@"background-image"])
  {
    uint64_t v7 = [v9 isOn];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    [WeakRetained startPageCustomizationViewController:self didModifyBackgroundImageEnabled:v7];

    self->_backgroundSectionUnconditionallyVisible = v7;
    [(SFStartPageCustomizationViewController *)self reloadDataAnimatingDifferences:1];
  }
}

- (void)_setCustomizationSyncWithValue:(id)a3
{
  id v4 = a3;
  if ([v4 isOn])
  {
    id WeakRetained = _WBSLocalizedString();
    id v6 = _WBSLocalizedString();
    uint64_t v7 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:WeakRetained message:v6 preferredStyle:1];
    double v8 = (void *)MEMORY[0x1E4FB1410];
    id v9 = _WBSLocalizedString();
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __73__SFStartPageCustomizationViewController__setCustomizationSyncWithValue___block_invoke;
    v20[3] = &unk_1E54ED100;
    v20[4] = self;
    id v10 = [v8 actionWithTitle:v9 style:0 handler:v20];
    [v7 addAction:v10];

    double v11 = [MEMORY[0x1E4F97E88] currentDevice];
    [v11 deviceClass];

    id v12 = _WBSLocalizedString();
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __73__SFStartPageCustomizationViewController__setCustomizationSyncWithValue___block_invoke_2;
    v19[3] = &unk_1E54ED100;
    v19[4] = self;
    double v13 = [MEMORY[0x1E4FB1410] actionWithTitle:v12 style:0 handler:v19];
    [v7 addAction:v13];

    id v14 = (void *)MEMORY[0x1E4FB1410];
    id v15 = _WBSLocalizedString();
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __73__SFStartPageCustomizationViewController__setCustomizationSyncWithValue___block_invoke_3;
    v17[3] = &unk_1E54ED100;
    id v18 = v4;
    uint64_t v16 = [v14 actionWithTitle:v15 style:1 handler:v17];
    [v7 addAction:v16];

    [(SFStartPageCustomizationViewController *)self presentViewController:v7 animated:1 completion:0];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    [WeakRetained startPageCustomizationViewControllerDidDisableCloudSync:self];
  }
}

void __73__SFStartPageCustomizationViewController__setCustomizationSyncWithValue___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1112));
  [WeakRetained startPageCustomizationViewControllerDidEnableCloudSync:*(void *)(a1 + 32) withPreference:0];
}

void __73__SFStartPageCustomizationViewController__setCustomizationSyncWithValue___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1112));
  [WeakRetained startPageCustomizationViewControllerDidEnableCloudSync:*(void *)(a1 + 32) withPreference:1];
}

uint64_t __73__SFStartPageCustomizationViewController__setCustomizationSyncWithValue___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setOn:0];
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  return self->_backgroundImagesCollectionView == a3;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6 = (UICollectionView *)a3;
  id v7 = a4;
  if (self->_rootCollectionView != v6)
  {
    [(UICollectionView *)v6 deselectItemAtIndexPath:v7 animated:1];
    double v8 = [(UICollectionViewDiffableDataSource *)self->_backgroundImagesCollectionViewDataSource itemIdentifierForIndexPath:v7];
    self->_BOOL hasGeneratedBackgroundImage = 0;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    id v10 = [v8 imageDescription];
    double v11 = v10;
    if (v10)
    {
      id v12 = [v10 url];
      [v11 luminance];
      objc_msgSend(WeakRetained, "startPageCustomizationViewController:didSelectBuiltInBackgroundImageAtURL:precomputedLuminance:", self, v12);

      [(SFStartPageCustomizationViewController *)self reloadDataAnimatingDifferences:1];
    }
    else
    {
      double v13 = [v8 profileIdentifier];

      if (v13)
      {
        self->_BOOL hasGeneratedBackgroundImage = 1;
        id v14 = [MEMORY[0x1E4F98E88] defaultManager];
        char v27 = [WeakRetained profileProviderForCustomizationViewController:self];
        id v15 = [v27 activeProfile];
        uint64_t v26 = [v15 identifier];
        uint64_t v25 = [v15 symbolImageName];
        uint64_t v16 = [v15 color];
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __82__SFStartPageCustomizationViewController_collectionView_didSelectItemAtIndexPath___block_invoke;
        v28[3] = &unk_1E54ED7F0;
        id v17 = v14;
        id v29 = v17;
        id v30 = self;
        id v18 = v26;
        id v31 = v18;
        id v19 = v27;
        id v32 = v19;
        [v17 generateProfileSpecificBackgroundImageWithSymbol:v25 forProfile:v18 withColor:v16 completionHandler:v28];
      }
      else
      {
        id v20 = [v8 mobileAssetFileName];

        if (v20)
        {
          mobileAssetFileNameToItemProvider = self->_mobileAssetFileNameToItemProvider;
          uint64_t v22 = [v8 mobileAssetFileName];
          id v23 = [(NSMutableDictionary *)mobileAssetFileNameToItemProvider objectForKeyedSubscript:v22];
          [WeakRetained startPageCustomizationViewController:self didSelectMobileAssetBackgroundImageWithProvider:v23];

          uint64_t v24 = [(UICollectionView *)v6 cellForItemAtIndexPath:v7];
          [(SFStartPageCustomizationViewController *)self _didSelectMobileAssetBackgroundImageCell:v24];
        }
        else
        {
          [(SFStartPageCustomizationViewController *)self showPhotoPicker];
        }
      }
    }
  }
}

void __82__SFStartPageCustomizationViewController_collectionView_didSelectItemAtIndexPath___block_invoke(uint64_t a1, uint64_t a2)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __82__SFStartPageCustomizationViewController_collectionView_didSelectItemAtIndexPath___block_invoke_2;
  v6[3] = &unk_1E54ED7C8;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void **)(a1 + 48);
  void v6[4] = *(void *)(a1 + 40);
  id v7 = v5;
  id v8 = *(id *)(a1 + 56);
  id v9 = *(id *)(a1 + 32);
  [v4 cacheImageFromURL:a2 completion:v6];
}

void __82__SFStartPageCustomizationViewController_collectionView_didSelectItemAtIndexPath___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __82__SFStartPageCustomizationViewController_collectionView_didSelectItemAtIndexPath___block_invoke_3;
    block[3] = &unk_1E54ED7A0;
    id v4 = *(void **)(a1 + 40);
    block[4] = *(void *)(a1 + 32);
    id v6 = v4;
    id v7 = *(id *)(a1 + 48);
    id v8 = *(id *)(a1 + 56);
    id v9 = v3;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __82__SFStartPageCustomizationViewController_collectionView_didSelectItemAtIndexPath___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _backgroundImageIdentifier];
  if ([*(id *)(a1 + 40) isEqualToString:*MEMORY[0x1E4F980C8]])
  {
    uint64_t v3 = 0;
  }
  else
  {
    id v4 = [*(id *)(a1 + 48) activeTabGroup];
    uint64_t v3 = [v4 isNamed] ^ 1;
  }
  objc_initWeak(&location, *(id *)(a1 + 32));
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __82__SFStartPageCustomizationViewController_collectionView_didSelectItemAtIndexPath___block_invoke_4;
  v6[3] = &unk_1E54ED778;
  uint64_t v5 = *(void **)(a1 + 56);
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 40);
  objc_copyWeak(&v10, &location);
  id v9 = *(id *)(a1 + 64);
  [v5 processImageForIdentifier:v2 isGeneratedImage:1 withinProfile:v3 completionHandler:v6];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __82__SFStartPageCustomizationViewController_collectionView_didSelectItemAtIndexPath___block_invoke_4(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) updateProfileWithIdentifier:*(void *)(a1 + 40) persist:1 usingBlock:&__block_literal_global_171 completionHandler:0];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    [WeakRetained _updateGeneratedBackgroundImageItemProviderWithImage:*(void *)(a1 + 48)];
    [WeakRetained reloadDataAnimatingDifferences:0];
  }
}

uint64_t __82__SFStartPageCustomizationViewController_collectionView_didSelectItemAtIndexPath___block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 markBackgroundImageAsModified];
}

- (id)collectionView:(id)a3 targetIndexPathForMoveOfItemFromOriginalIndexPath:(id)a4 atCurrentIndexPath:(id)a5 toProposedIndexPath:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = [(UICollectionViewDiffableDataSource *)self->_rootCollectionViewDataSource indexForSectionIdentifier:@"customization-items"];
  if ([v11 section] != v12)
  {
    if ([v11 section] <= v12) {
      uint64_t v13 = 0;
    }
    else {
      uint64_t v13 = objc_msgSend(v9, "numberOfItemsInSection:", objc_msgSend(v10, "section")) - 1;
    }
    uint64_t v14 = [MEMORY[0x1E4F28D58] indexPathForItem:v13 inSection:v12];

    id v11 = (id)v14;
  }

  return v11;
}

- (void)picker:(id)a3 didFinishPicking:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  [v10 dismissViewControllerAnimated:1 completion:0];
  if ([v6 count])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    id v8 = [v6 objectAtIndexedSubscript:0];
    id v9 = [v8 itemProvider];
    [WeakRetained startPageCustomizationViewController:self didSelectCustomBackgroundImage:v9];

    [(SFStartPageCustomizationViewController *)self reloadDataAnimatingDifferences:1];
  }
}

- (void)showPhotoPicker
{
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2050000000;
  uint64_t v3 = (void *)getPHPickerConfigurationClass(void)::softClass;
  uint64_t v20 = getPHPickerConfigurationClass(void)::softClass;
  if (!getPHPickerConfigurationClass(void)::softClass)
  {
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    uint64_t v14 = ___ZL29getPHPickerConfigurationClassv_block_invoke;
    id v15 = &unk_1E54EA7F8;
    uint64_t v16 = &v17;
    ___ZL29getPHPickerConfigurationClassv_block_invoke((uint64_t)&v12);
    uint64_t v3 = (void *)v18[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v17, 8);
  uint64_t v5 = (void *)[[v4 alloc] init];
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2050000000;
  id v6 = (void *)getPHPickerFilterClass(void)::softClass;
  uint64_t v20 = getPHPickerFilterClass(void)::softClass;
  if (!getPHPickerFilterClass(void)::softClass)
  {
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    uint64_t v14 = ___ZL22getPHPickerFilterClassv_block_invoke;
    id v15 = &unk_1E54EA7F8;
    uint64_t v16 = &v17;
    ___ZL22getPHPickerFilterClassv_block_invoke((uint64_t)&v12);
    id v6 = (void *)v18[3];
  }
  id v7 = v6;
  _Block_object_dispose(&v17, 8);
  id v8 = [v7 imagesFilter];
  [v5 setFilter:v8];

  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2050000000;
  id v9 = (void *)getPHPickerViewControllerClass(void)::softClass;
  uint64_t v20 = getPHPickerViewControllerClass(void)::softClass;
  if (!getPHPickerViewControllerClass(void)::softClass)
  {
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    uint64_t v14 = ___ZL30getPHPickerViewControllerClassv_block_invoke;
    id v15 = &unk_1E54EA7F8;
    uint64_t v16 = &v17;
    ___ZL30getPHPickerViewControllerClassv_block_invoke((uint64_t)&v12);
    id v9 = (void *)v18[3];
  }
  id v10 = v9;
  _Block_object_dispose(&v17, 8);
  id v11 = (void *)[[v10 alloc] initWithConfiguration:v5];
  [v11 setDelegate:self];
  [(SFStartPageCustomizationViewController *)self presentViewController:v11 animated:1 completion:0];
}

- (void)_didSelectMobileAssetBackgroundImageCell:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  id v6 = [v4 mobileAssetFileName];
  lastSelectedMobileAssetFileName = self->_lastSelectedMobileAssetFileName;
  self->_lastSelectedMobileAssetFileName = v6;

  id v8 = [WeakRetained backgroundImageAssetControllerForCustomizationViewController:self];
  id v9 = [v4 mobileAssetFileName];
  uint64_t v10 = [v8 downloadStateForFileName:v9];

  if (v10 != 1)
  {
    if (v10 == 2)
    {
      id v11 = [MEMORY[0x1E4F28CB8] defaultManager];
      uint64_t v12 = objc_msgSend(v11, "safari_startPageBackgroundImageMobileAssetFolderURL");
      uint64_t v13 = [v4 mobileAssetFileName];
      uint64_t v14 = [v12 URLByAppendingPathComponent:v13];

      [(SFStartPageCustomizationViewController *)self _updateImageWithURL:v14];
    }
    else
    {
      [v4 setDownloadState:1];
      id v15 = [WeakRetained backgroundImageAssetControllerForCustomizationViewController:self];
      uint64_t v16 = [v4 mobileAssetFileName];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __83__SFStartPageCustomizationViewController__didSelectMobileAssetBackgroundImageCell___block_invoke;
      v17[3] = &unk_1E54ED840;
      id v18 = v4;
      uint64_t v19 = self;
      [v15 downloadMobileAssetBackgroundImage:v16 completionHandler:v17];
    }
  }
}

void __83__SFStartPageCustomizationViewController__didSelectMobileAssetBackgroundImageCell___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __83__SFStartPageCustomizationViewController__didSelectMobileAssetBackgroundImageCell___block_invoke_2;
  v11[3] = &unk_1E54ED818;
  id v12 = v5;
  id v13 = v6;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  id v14 = v7;
  uint64_t v15 = v8;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v11);
}

void __83__SFStartPageCustomizationViewController__didSelectMobileAssetBackgroundImageCell___block_invoke_2(void *a1)
{
  id v2 = (void *)a1[4];
  if (v2 && !a1[5])
  {
    id v4 = *(void **)(a1[7] + 1096);
    id v5 = [v2 lastPathComponent];
    LODWORD(v4) = [v4 isEqualToString:v5];

    if (v4)
    {
      id v6 = (void *)a1[7];
      uint64_t v7 = a1[4];
      [v6 _updateImageWithURL:v7];
    }
  }
  else
  {
    uint64_t v3 = (void *)a1[6];
    [v3 setDownloadState:3];
  }
}

- (void)_updateImageWithURL:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  id v6 = [WeakRetained profileProviderForCustomizationViewController:self];

  uint64_t v7 = [v6 activeProfile];
  uint64_t v8 = [v7 identifier];
  id v9 = [MEMORY[0x1E4F98E88] defaultManager];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __62__SFStartPageCustomizationViewController__updateImageWithURL___block_invoke;
  v12[3] = &unk_1E54ED868;
  v12[4] = self;
  id v10 = v8;
  id v13 = v10;
  id v11 = v6;
  id v14 = v11;
  [v9 cacheImageFromURL:v4 completion:v12];
}

void __62__SFStartPageCustomizationViewController__updateImageWithURL___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__SFStartPageCustomizationViewController__updateImageWithURL___block_invoke_2;
    block[3] = &unk_1E54ED3E0;
    uint64_t v3 = *(void **)(a1 + 40);
    block[4] = *(void *)(a1 + 32);
    id v5 = v3;
    id v6 = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __62__SFStartPageCustomizationViewController__updateImageWithURL___block_invoke_2(id *a1)
{
  id v2 = [a1[4] _backgroundImageIdentifier];
  if ([a1[5] isEqualToString:*MEMORY[0x1E4F980C8]])
  {
    uint64_t v3 = 0;
  }
  else
  {
    id v4 = [a1[6] activeTabGroup];
    uint64_t v3 = [v4 isNamed] ^ 1;
  }
  id v5 = [MEMORY[0x1E4F98E88] defaultManager];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __62__SFStartPageCustomizationViewController__updateImageWithURL___block_invoke_3;
  v8[3] = &unk_1E54ED3E0;
  id v9 = a1[6];
  id v6 = a1[5];
  id v7 = a1[4];
  id v10 = v6;
  id v11 = v7;
  [v5 processImageForIdentifier:v2 isGeneratedImage:0 withinProfile:v3 completionHandler:v8];
}

uint64_t __62__SFStartPageCustomizationViewController__updateImageWithURL___block_invoke_3(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) updateProfileWithIdentifier:*(void *)(a1 + 40) persist:1 usingBlock:&__block_literal_global_177 completionHandler:0];
  uint64_t v3 = *(void **)(a1 + 48);

  return [v3 reloadDataAnimatingDifferences:0];
}

uint64_t __62__SFStartPageCustomizationViewController__updateImageWithURL___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 markBackgroundImageAsModified];
}

- (SFStartPageCustomizationDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (SFStartPageCustomizationDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (unint64_t)preferredBackgroundImagesCollectionViewColumnCount
{
  return self->_preferredBackgroundImagesCollectionViewColumnCount;
}

- (void)setPreferredBackgroundImagesCollectionViewColumnCount:(unint64_t)a3
{
  self->_preferredBackgroundImagesCollectionViewColumnCount = a3;
}

- (BOOL)showsCloseButton
{
  return self->_showsCloseButton;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_lastSelectedMobileAssetFileName, 0);
  objc_storeStrong((id *)&self->_mobileAssetFileNameToItemProvider, 0);
  objc_storeStrong((id *)&self->_mobileAssetFileNames, 0);
  objc_storeStrong((id *)&self->_generatedBackgroundImageItemProvider, 0);
  objc_storeStrong((id *)&self->_rootCollectionViewDataSource, 0);
  objc_storeStrong((id *)&self->_rootCollectionView, 0);
  objc_storeStrong((id *)&self->_identifierToSuggestionsDataSourceCustomizationItemMap, 0);
  objc_storeStrong((id *)&self->_identifierToFixedCustomizationItemMap, 0);
  objc_storeStrong((id *)&self->_identifierToCustomizationItemMap, 0);
  objc_storeStrong((id *)&self->_backgroundImagesDataSource, 0);
  objc_storeStrong((id *)&self->_backgroundImagesCollectionViewDataSource, 0);
  objc_storeStrong((id *)&self->_backgroundImagesCollectionView, 0);

  objc_storeStrong((id *)&self->_backgroundImages, 0);
}

@end