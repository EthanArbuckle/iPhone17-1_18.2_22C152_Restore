@interface PXAlbumSectionHeaderLayoutProvider
- (BOOL)allowsFloatingBackground;
- (BOOL)editorialStyle;
- (CGSize)singleViewLayout:(id)a3 desiredSizeForReferenceSize:(CGSize)a4;
- (PXAlbumSectionHeaderLayoutProvider)init;
- (PXAlbumSectionHeaderLayoutProvider)initWithViewModel:(id)a3 viewProvider:(id)a4;
- (PXPhotosSectionHeaderLayoutViewProvider)viewProvider;
- (PXPhotosViewModel)viewModel;
- (UIImage)gradientImage;
- (id)configurationForSingleViewLayout:(id)a3;
- (id)createSectionHeaderLayoutForSectionedLayout:(id)a3 dataSource:(id)a4 sectionIndexPath:(PXSimpleIndexPath *)a5 spec:(id)a6 outAlignment:(unint64_t *)a7;
- (void)didTapSectionHeader:(id)a3;
- (void)sectionHeader:(id)a3 didToggleFiltersDisabled:(BOOL)a4;
- (void)sectionHeader:(id)a3 didToggleSelectedState:(BOOL)a4;
- (void)sectionedLayout:(id)a3 headerLayout:(id)a4 didChangeDataSource:(id)a5 sectionIndexPath:(PXSimpleIndexPath *)a6 hasSectionChanges:(BOOL)a7;
- (void)setAllowsFloatingBackground:(BOOL)a3;
- (void)setEditorialStyle:(BOOL)a3;
@end

@implementation PXAlbumSectionHeaderLayoutProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradientImage, 0);
  objc_destroyWeak((id *)&self->_viewProvider);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

- (UIImage)gradientImage
{
  return self->_gradientImage;
}

- (void)setAllowsFloatingBackground:(BOOL)a3
{
  self->_allowsFloatingBackground = a3;
}

- (BOOL)allowsFloatingBackground
{
  return self->_allowsFloatingBackground;
}

- (void)setEditorialStyle:(BOOL)a3
{
  self->_editorialStyle = a3;
}

- (BOOL)editorialStyle
{
  return self->_editorialStyle;
}

- (PXPhotosSectionHeaderLayoutViewProvider)viewProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewProvider);
  return (PXPhotosSectionHeaderLayoutViewProvider *)WeakRetained;
}

- (PXPhotosViewModel)viewModel
{
  return self->_viewModel;
}

- (void)sectionHeader:(id)a3 didToggleFiltersDisabled:(BOOL)a4
{
  id v6 = a3;
  v7 = [v6 dataSource];
  if (v6) {
    [v6 sectionIndexPath];
  }
  else {
    memset(v15, 0, sizeof(v15));
  }
  v8 = [v7 assetCollectionAtSectionIndexPath:v15];

  v9 = [(PXAlbumSectionHeaderLayoutProvider *)self viewModel];
  v10 = [v9 dataSourceManager];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __77__PXAlbumSectionHeaderLayoutProvider_sectionHeader_didToggleFiltersDisabled___block_invoke;
  v12[3] = &unk_1E5DCFE70;
  BOOL v14 = a4;
  id v13 = v8;
  id v11 = v8;
  [v10 performChanges:v12];
}

uint64_t __77__PXAlbumSectionHeaderLayoutProvider_sectionHeader_didToggleFiltersDisabled___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setFilteringDisabled:*(unsigned __int8 *)(a1 + 40) forAssetCollection:*(void *)(a1 + 32)];
}

- (void)sectionHeader:(id)a3 didToggleSelectedState:(BOOL)a4
{
  id v6 = a3;
  v7 = [(PXAlbumSectionHeaderLayoutProvider *)self viewModel];
  v8 = [v7 selectionManager];

  v9 = [v8 selectionSnapshot];
  v10 = [v9 dataSource];

  long long v20 = 0u;
  long long v21 = 0u;
  if (v6) {
    [v6 sectionIndexPath];
  }
  else {
    memset(v19, 0, sizeof(v19));
  }
  id v11 = [v6 dataSource];
  if (v10)
  {
    [v10 convertIndexPath:v19 fromSectionedDataSource:v11];
  }
  else
  {
    long long v20 = 0u;
    long long v21 = 0u;
  }

  v18[0] = v20;
  v18[1] = v21;
  v12 = [off_1E5DA6F50 indexPathSetWithIndexPath:v18];
  id v13 = [v10 itemIndexPathsForSections:v12];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  _OWORD v15[2] = __75__PXAlbumSectionHeaderLayoutProvider_sectionHeader_didToggleSelectedState___block_invoke;
  v15[3] = &unk_1E5DCFE48;
  BOOL v17 = a4;
  id v16 = v13;
  id v14 = v13;
  [v8 performChanges:v15];
}

uint64_t __75__PXAlbumSectionHeaderLayoutProvider_sectionHeader_didToggleSelectedState___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setSelectedState:*(unsigned __int8 *)(a1 + 40) forIndexPathSet:*(void *)(a1 + 32)];
}

- (void)didTapSectionHeader:(id)a3
{
  id v4 = a3;
  v5 = [v4 dataSource];
  if (v4) {
    [v4 sectionIndexPath];
  }
  else {
    memset(v13, 0, sizeof(v13));
  }
  id v6 = [v5 assetCollectionReferenceAtSectionIndexPath:v13];

  v7 = [(PXAlbumSectionHeaderLayoutProvider *)self viewModel];
  v8 = [v7 assetCollectionActionManager];
  v9 = [v8 actionPerformerForActionType:@"PXAssetCollectionActionTypeShowDetails" assetCollectionReference:v6];

  v10 = PLGridZeroGetLog();
  id v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_DEFAULT, "Will present details view from photos grid header tap", v12, 2u);
    }

    [v9 performActionWithCompletionHandler:&__block_literal_global_279491];
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_ERROR, "No action performer found for presenting details", v12, 2u);
    }
  }
}

void __58__PXAlbumSectionHeaderLayoutProvider_didTapSectionHeader___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((a2 & 1) == 0)
  {
    v5 = PLGridZeroGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_ERROR, "Failed to present details view from photos grid header tap, error %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (CGSize)singleViewLayout:(id)a3 desiredSizeForReferenceSize:(CGSize)a4
{
  double width = a4.width;
  id v5 = a3;
  uint64_t v41 = 0;
  int v6 = [v5 dataSource];
  if (v5) {
    [v5 sectionIndexPath];
  }
  else {
    memset(v40, 0, sizeof(v40));
  }
  id v38 = 0;
  id v39 = 0;
  id v36 = 0;
  id v37 = 0;
  _PXGetSectionHeaderData(v6, v40, &v39, &v38, &v37, &v36, &v41);
  id v7 = v39;
  id v8 = v38;
  id v9 = v37;
  id v10 = v36;

  id v11 = [v5 userData];
  uint64_t v33 = [v7 length];
  if (v8) {
    BOOL v12 = v9 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  uint64_t v13 = !v12;
  uint64_t v32 = [v10 count];
  if (v41) {
    unsigned int v34 = 1;
  }
  else {
    unsigned int v34 = [v5 isInSelectMode];
  }
  unsigned int v31 = [v11 allowsPhotosDetailsInteraction];
  uint64_t v35 = [v11 headerStyle];
  id v14 = [MEMORY[0x1E4FB1438] sharedApplication];
  v15 = [v14 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v15);

  BOOL v17 = +[PXPhotosSectionHeaderMetrics sharedMetrics];
  v18 = v17;
  if (IsAccessibilityCategory)
  {
    v19 = [v5 spec];
    long long v20 = [v19 sectionHeaderSpec];
    [v20 curatedLibraryHeaderSpec];
    id v21 = v10;
    id v22 = v9;
    id v23 = v8;
    v25 = id v24 = v7;
    [v18 accessibilitySectionHeaderHeightForStyle:v35 width:v34 actionButton:v31 disclosure:v24 title:v23 startDate:v22 endDate:width locations:v21 actionButtonSpec:v25];
    double v27 = v26;

    id v7 = v24;
    id v8 = v23;
    id v9 = v22;
    id v10 = v21;
  }
  else
  {
    [v17 sectionHeaderHeightForStyle:v35 hasTitle:v33 != 0 hasDates:v13 hasLocation:v32 != 0];
    double v27 = v28;
  }

  double v29 = width;
  double v30 = v27;
  result.height = v30;
  result.double width = v29;
  return result;
}

- (id)configurationForSingleViewLayout:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(_PXPhotosSectionHeaderViewConfiguration);
  uint64_t v39 = 0;
  int v6 = [v4 dataSource];
  long long v37 = 0u;
  long long v38 = 0u;
  if (v4) {
    [v4 sectionIndexPath];
  }
  id v35 = 0;
  id v36 = 0;
  id v33 = 0;
  id v34 = 0;
  long long v31 = v37;
  long long v32 = v38;
  _PXGetSectionHeaderData(v6, &v31, &v36, &v35, &v34, &v33, &v39);
  id v7 = v36;
  id v8 = v35;
  id v9 = v34;
  id v10 = v33;
  [(_PXPhotosSectionHeaderViewConfiguration *)v5 setTitle:v7];
  [(_PXPhotosSectionHeaderViewConfiguration *)v5 setStartDate:v8];
  [(_PXPhotosSectionHeaderViewConfiguration *)v5 setEndDate:v9];
  [(_PXPhotosSectionHeaderViewConfiguration *)v5 setLocationNames:v10];

  if ([(PXAlbumSectionHeaderLayoutProvider *)self editorialStyle]) {
    uint64_t v11 = 2;
  }
  else {
    uint64_t v11 = 0;
  }
  [(_PXPhotosSectionHeaderViewConfiguration *)v5 setHeaderStyle:v11];
  BOOL v12 = [v4 spec];
  uint64_t v13 = [v12 sectionHeaderSpec];
  [v13 padding];
  -[_PXPhotosSectionHeaderViewConfiguration setEdgeInsets:](v5, "setEdgeInsets:");

  id v14 = [v4 spec];
  v15 = [v14 visualEffectViewGroupName];
  [(_PXPhotosSectionHeaderViewConfiguration *)v5 setBackdropViewGroupName:v15];

  if ([(PXAlbumSectionHeaderLayoutProvider *)self editorialStyle])
  {
    [(_PXPhotosSectionHeaderViewConfiguration *)v5 setGradientImage:0];
  }
  else
  {
    id v16 = [(PXAlbumSectionHeaderLayoutProvider *)self gradientImage];
    [(_PXPhotosSectionHeaderViewConfiguration *)v5 setGradientImage:v16];
  }
  BOOL v17 = [v4 spec];
  v18 = [v17 sectionHeaderSpec];
  [v18 gradientAlpha];
  -[_PXPhotosSectionHeaderViewConfiguration setGradientAlpha:](v5, "setGradientAlpha:");

  v19 = [v4 spec];
  long long v20 = [v19 sectionHeaderSpec];
  [v20 gradientOverhang];
  -[_PXPhotosSectionHeaderViewConfiguration setGradientOverhang:](v5, "setGradientOverhang:");

  id v21 = [v4 spec];
  id v22 = [v21 sectionHeaderSpec];
  id v23 = [v22 curatedLibraryHeaderSpec];
  [(_PXPhotosSectionHeaderViewConfiguration *)v5 setButtonSpec:v23];

  if ([v4 allowsFloatingBackground]) {
    uint64_t v24 = 1;
  }
  else {
    uint64_t v24 = 2;
  }
  [(_PXPhotosSectionHeaderViewConfiguration *)v5 setBackgroundStyle:v24];
  if ([v4 isInSelectMode])
  {
    uint64_t v25 = 0;
    if ([v4 areAllItemsSelected]) {
      uint64_t v26 = 2;
    }
    else {
      uint64_t v26 = 1;
    }
  }
  else
  {
    double v27 = [(PXAlbumSectionHeaderLayoutProvider *)self viewModel];
    long long v31 = v37;
    long long v32 = v38;
    double v28 = [v6 assetCollectionReferenceAtSectionIndexPath:&v31];
    if ([v27 allowsShowDetails])
    {
      double v29 = [v27 assetCollectionActionManager];
      uint64_t v25 = [v29 canPerformActionType:@"PXAssetCollectionActionTypeShowDetails" assetCollectionReference:v28];
    }
    else
    {
      uint64_t v25 = 0;
    }

    uint64_t v26 = v39;
  }
  [(_PXPhotosSectionHeaderViewConfiguration *)v5 setActionType:v26];
  [(_PXPhotosSectionHeaderViewConfiguration *)v5 setAllowsPhotosDetailsInteraction:v25];

  return v5;
}

- (void)sectionedLayout:(id)a3 headerLayout:(id)a4 didChangeDataSource:(id)a5 sectionIndexPath:(PXSimpleIndexPath *)a6 hasSectionChanges:(BOOL)a7
{
  BOOL v7 = a7;
  id v10 = a4;
  [v10 setDataSource:a5];
  long long v11 = *(_OWORD *)&a6->item;
  v12[0] = *(_OWORD *)&a6->dataSourceIdentifier;
  v12[1] = v11;
  [v10 setSectionIndexPath:v12];
  if (v7) {
    [v10 viewContentDidChange];
  }
}

- (id)createSectionHeaderLayoutForSectionedLayout:(id)a3 dataSource:(id)a4 sectionIndexPath:(PXSimpleIndexPath *)a5 spec:(id)a6 outAlignment:(unint64_t *)a7
{
  id v11 = a6;
  id v12 = a4;
  uint64_t v13 = [[_PXAlbumSectionHeaderLayout alloc] initWithSpec:v11];

  [(_PXAlbumSectionHeaderLayout *)v13 setDataSource:v12];
  long long v14 = *(_OWORD *)&a5->item;
  v18[0] = *(_OWORD *)&a5->dataSourceIdentifier;
  v18[1] = v14;
  [(_PXAlbumSectionHeaderLayout *)v13 setSectionIndexPath:v18];
  [(PXGSingleViewLayout *)v13 setStyle:2];
  [(PXGSingleViewLayout *)v13 setContentViewClass:objc_opt_class()];
  [(PXGSingleViewLayout *)v13 setDelegate:self];
  [(_PXAlbumSectionHeaderLayout *)v13 setInteractionDelegate:self];
  v15 = [(PXAlbumSectionHeaderLayoutProvider *)self viewProvider];
  [(_PXAlbumSectionHeaderLayout *)v13 setViewProvider:v15];

  LODWORD(v16) = -1080452710;
  [(PXGSingleViewLayout *)v13 setZPosition:v16];
  [(_PXAlbumSectionHeaderLayout *)v13 setAllowsFloatingBackground:[(PXAlbumSectionHeaderLayoutProvider *)self allowsFloatingBackground]];
  if ([(PXAlbumSectionHeaderLayoutProvider *)self editorialStyle])
  {
    *a7 = 3;
    [(_PXAlbumSectionHeaderLayout *)v13 setAlwaysWantsBackground:1];
  }
  else
  {
    *a7 = 1;
  }
  return v13;
}

- (PXAlbumSectionHeaderLayoutProvider)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXAlbumSectionHeaderLayoutProvider+iOS.m", 143, @"%s is not available as initializer", "-[PXAlbumSectionHeaderLayoutProvider init]");

  abort();
}

- (PXAlbumSectionHeaderLayoutProvider)initWithViewModel:(id)a3 viewProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PXAlbumSectionHeaderLayoutProvider;
  id v9 = [(PXAlbumSectionHeaderLayoutProvider *)&v16 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_viewModel, a3);
    objc_storeWeak((id *)&v10->_viewProvider, v8);
    id v11 = +[PXPhotosGridSettings sharedInstance];
    if ([v11 enableTitleLegibilityDimmingFilter]) {
      id v12 = @"PXHeaderGradient2";
    }
    else {
      id v12 = @"PXHeaderGradient";
    }
    uint64_t v13 = objc_msgSend(MEMORY[0x1E4FB1818], "px_imageNamed:", v12);
    gradientImage = v10->_gradientImage;
    v10->_gradientImage = (UIImage *)v13;

    v10->_allowsFloatingBackground = 1;
  }

  return v10;
}

@end