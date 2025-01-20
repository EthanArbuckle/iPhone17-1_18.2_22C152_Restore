@interface PXActionableSectionHeaderLayoutProvider
- (BOOL)wantsHeaderForDataSource:(id)a3 sectionIndexPath:(PXSimpleIndexPath *)a4;
- (BOOL)wantsTopHeaderForDataSource:(id)a3;
- (CGSize)singleViewLayout:(id)a3 desiredSizeForReferenceSize:(CGSize)a4;
- (NSNumber)customBackgroundStyle;
- (PXActionableSectionHeaderLayoutProvider)init;
- (PXActionableSectionHeaderLayoutProvider)initWithViewModel:(id)a3 viewProvider:(id)a4;
- (PXActionableSectionHeaderView)referenceHeaderView;
- (PXPhotosSectionHeaderLayoutProviderInvalidationDelegate)invalidationDelegate;
- (PXPhotosSectionHeaderLayoutProviderInvalidationDelegate)topHeaderInvalidationDelegate;
- (PXPhotosSectionHeaderLayoutViewProvider)viewProvider;
- (PXPhotosViewModel)viewModel;
- (UIImage)gradientImage;
- (id)_createSectionHeaderLayoutForDataSource:(id)a3 sectionIndexPath:(PXSimpleIndexPath *)a4 spec:(id)a5 outAlignment:(unint64_t *)a6;
- (id)actionTextForActionType:(int64_t)a3 dataSource:(id)a4 sectionIndexPath:(PXSimpleIndexPath *)a5;
- (id)configurationForSingleViewLayout:(id)a3;
- (id)createFilterButtonControllerForLayout:(id)a3;
- (id)createSectionHeaderLayoutForSectionedLayout:(id)a3 dataSource:(id)a4 sectionIndexPath:(PXSimpleIndexPath *)a5 spec:(id)a6 outAlignment:(unint64_t *)a7;
- (id)createTopHeaderLayoutForSectionedLayout:(id)a3 dataSource:(id)a4 spec:(id)a5 outShouldFloat:(BOOL *)a6;
- (id)primaryTextForDataSource:(id)a3 sectionIndexPath:(PXSimpleIndexPath *)a4;
- (id)primaryTopHeaderTextForDataSource:(id)a3;
- (id)secondaryTextForDataSource:(id)a3 sectionIndexPath:(PXSimpleIndexPath *)a4;
- (id)secondaryTopHeaderTextForDataSource:(id)a3;
- (int64_t)actionTypeForHeaderLayout:(id)a3;
- (int64_t)actionVisibilityForHeaderLayout:(id)a3;
- (void)_getPrimaryText:(id *)a3 secondaryText:(id *)a4 forLayout:(id)a5;
- (void)configureSectionHeaderLayout:(id)a3 inAssetSectionLayout:(id)a4 forSectionedLayout:(id)a5;
- (void)configureTopHeaderLayout:(id)a3 dataSource:(id)a4 spec:(id)a5;
- (void)sectionHeader:(id)a3 didPressButtonForActionType:(int64_t)a4 sender:(id)a5;
- (void)sectionHeader:(id)a3 didToggleSelectedState:(BOOL)a4;
- (void)sectionedLayout:(id)a3 headerLayout:(id)a4 didChangeDataSource:(id)a5 sectionIndexPath:(PXSimpleIndexPath *)a6 hasSectionChanges:(BOOL)a7;
- (void)setCustomBackgroundStyle:(id)a3;
- (void)setInvalidationDelegate:(id)a3;
- (void)setSelectedState:(BOOL)a3 forItemsInSectionHeaderLayout:(id)a4;
- (void)setTopHeaderInvalidationDelegate:(id)a3;
- (void)topHeaderLayout:(id)a3 didChangeDataSource:(id)a4;
@end

@implementation PXActionableSectionHeaderLayoutProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customBackgroundStyle, 0);
  objc_storeStrong((id *)&self->_gradientImage, 0);
  objc_storeStrong((id *)&self->_referenceHeaderView, 0);
  objc_destroyWeak((id *)&self->_viewProvider);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_destroyWeak((id *)&self->_topHeaderInvalidationDelegate);
  objc_destroyWeak((id *)&self->_invalidationDelegate);
}

- (void)setCustomBackgroundStyle:(id)a3
{
}

- (NSNumber)customBackgroundStyle
{
  return self->_customBackgroundStyle;
}

- (UIImage)gradientImage
{
  return self->_gradientImage;
}

- (PXActionableSectionHeaderView)referenceHeaderView
{
  return self->_referenceHeaderView;
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

- (void)setTopHeaderInvalidationDelegate:(id)a3
{
}

- (PXPhotosSectionHeaderLayoutProviderInvalidationDelegate)topHeaderInvalidationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_topHeaderInvalidationDelegate);
  return (PXPhotosSectionHeaderLayoutProviderInvalidationDelegate *)WeakRetained;
}

- (void)setInvalidationDelegate:(id)a3
{
}

- (PXPhotosSectionHeaderLayoutProviderInvalidationDelegate)invalidationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_invalidationDelegate);
  return (PXPhotosSectionHeaderLayoutProviderInvalidationDelegate *)WeakRetained;
}

- (id)createFilterButtonControllerForLayout:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PXActionableSectionHeaderLayoutProvider *)self viewModel];
  if (!v5) {
    goto LABEL_4;
  }
  v6 = (void *)v5;
  v7 = [v4 spec];
  v8 = [v7 sectionHeaderSpec];
  v9 = [v8 filterButtonConfiguration];

  if (v9)
  {
    v10 = [PXPhotosFilterToggleButtonController alloc];
    v11 = [(PXActionableSectionHeaderLayoutProvider *)self viewModel];
    v12 = [v4 spec];
    v13 = [v12 sectionHeaderSpec];
    v14 = [v13 filterButtonConfiguration];
    v15 = [(PXPhotosFilterToggleButtonController *)v10 initWithViewModel:v11 buttonConfiguration:v14];
  }
  else
  {
LABEL_4:
    v15 = 0;
  }

  return v15;
}

- (void)setSelectedState:(BOOL)a3 forItemsInSectionHeaderLayout:(id)a4
{
  id v6 = a4;
  v7 = [(PXActionableSectionHeaderLayoutProvider *)self viewModel];
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
  v11 = [v6 dataSource];
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
  v13 = [v10 itemIndexPathsForSections:v12];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __90__PXActionableSectionHeaderLayoutProvider_setSelectedState_forItemsInSectionHeaderLayout___block_invoke;
  v15[3] = &unk_1E5DCFE48;
  BOOL v17 = a3;
  id v16 = v13;
  id v14 = v13;
  [v8 performChanges:v15];
}

uint64_t __90__PXActionableSectionHeaderLayoutProvider_setSelectedState_forItemsInSectionHeaderLayout___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setSelectedState:*(unsigned __int8 *)(a1 + 40) forIndexPathSet:*(void *)(a1 + 32)];
}

- (void)sectionHeader:(id)a3 didToggleSelectedState:(BOOL)a4
{
}

- (void)sectionHeader:(id)a3 didPressButtonForActionType:(int64_t)a4 sender:(id)a5
{
  id v13 = a3;
  id v9 = a5;
  if ((unint64_t)a4 <= 0xA)
  {
    if (((1 << a4) & 0x282) != 0)
    {
      uint64_t v11 = 1;
      id v10 = v13;
      goto LABEL_6;
    }
    if (((1 << a4) & 0x504) != 0)
    {
      id v10 = v13;
      uint64_t v11 = 0;
LABEL_6:
      [(PXActionableSectionHeaderLayoutProvider *)self sectionHeader:v10 didToggleSelectedState:v11];
      goto LABEL_7;
    }
    if (((1 << a4) & 0x39) != 0)
    {
      v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2 object:self file:@"PXActionableSectionHeaderLayoutProvider+iOS.m" lineNumber:402 description:@"Code which should be unreachable has been reached"];

      abort();
    }
  }
LABEL_7:
}

- (id)configurationForSingleViewLayout:(id)a3
{
  id v5 = a3;
  id v6 = objc_alloc_init(_PXActionableSectionHeaderViewConfiguration);
  id v57 = 0;
  v58[0] = 0;
  [(PXActionableSectionHeaderLayoutProvider *)self _getPrimaryText:v58 secondaryText:&v57 forLayout:v5];
  id v7 = v58[0];
  id v8 = v57;
  [(_PXActionableSectionHeaderViewConfiguration *)v6 setPrimaryText:v7];
  [(_PXActionableSectionHeaderViewConfiguration *)v6 setSecondaryText:v8];
  id v9 = [v5 spec];
  id v10 = [v9 sectionHeaderSpec];
  [v10 padding];
  -[_PXActionableSectionHeaderViewConfiguration setEdgeInsets:](v6, "setEdgeInsets:");

  unint64_t v11 = [(PXActionableSectionHeaderLayoutProvider *)self actionTypeForHeaderLayout:v5];
  v12 = [v5 dataSource];
  if (v5) {
    [v5 sectionIndexPath];
  }
  else {
    memset(v56, 0, sizeof(v56));
  }
  id v13 = [(PXActionableSectionHeaderLayoutProvider *)self actionTextForActionType:v11 dataSource:v12 sectionIndexPath:v56];

  [(_PXActionableSectionHeaderViewConfiguration *)v6 setActionText:v13];
  [(_PXActionableSectionHeaderViewConfiguration *)v6 setActionType:v11];
  SEL v45 = a2;
  if ([v5 isTopHeader])
  {
    uint64_t v14 = 0;
  }
  else
  {
    v15 = +[PXPhotosGridSettings sharedInstance];
    uint64_t v14 = [v15 useGradientSectionHeaders];
  }
  v46 = v8;
  v47 = v7;
  if (v11 >= 6)
  {
    if (v11 - 7 >= 4)
    {
      if (v11 == 6) {
        uint64_t v17 = 3;
      }
      else {
        uint64_t v17 = 0;
      }
      id v16 = 0;
    }
    else
    {
      if (v11 - 9 > 1)
      {
        id v16 = 0;
      }
      else
      {
        objc_initWeak(location, self);
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __76__PXActionableSectionHeaderLayoutProvider_configurationForSingleViewLayout___block_invoke;
        aBlock[3] = &unk_1E5DC2130;
        objc_copyWeak(&v55, location);
        id v54 = v5;
        id v16 = _Block_copy(aBlock);

        objc_destroyWeak(&v55);
        objc_destroyWeak(location);
      }
      uint64_t v17 = 1;
    }
  }
  else
  {
    id v16 = 0;
    if ([v5 isTopHeader]) {
      uint64_t v17 = 2;
    }
    else {
      uint64_t v17 = 1;
    }
  }
  [(_PXActionableSectionHeaderViewConfiguration *)v6 setFilterButtonControllerFactory:v16];
  uint64_t v18 = [v13 length];
  uint64_t v19 = v18 != 0;
  uint64_t v20 = v16 != 0;
  if ([(PXActionableSectionHeaderLayoutProvider *)self actionVisibilityForHeaderLayout:v5] == 1)
  {
    unsigned int v21 = [v5 wantsBackground];
    if (v18) {
      uint64_t v19 = v21;
    }
    else {
      uint64_t v19 = 0;
    }
    if (v16) {
      uint64_t v20 = v21;
    }
    else {
      uint64_t v20 = 0;
    }
  }
  [(_PXActionableSectionHeaderViewConfiguration *)v6 setShowsActionButton:v19];
  [(_PXActionableSectionHeaderViewConfiguration *)v6 setShowsSecondaryButton:v20];
  v22 = [(PXActionableSectionHeaderLayoutProvider *)self customBackgroundStyle];
  if (v22)
  {
    v23 = [(PXActionableSectionHeaderLayoutProvider *)self customBackgroundStyle];
    uint64_t v14 = [v23 unsignedIntegerValue];
  }
  [(_PXActionableSectionHeaderViewConfiguration *)v6 setButtonStyle:v17];
  [(_PXActionableSectionHeaderViewConfiguration *)v6 setBackgroundStyle:v14];
  v24 = [v5 spec];
  v25 = [v24 visualEffectViewGroupName];
  [(_PXActionableSectionHeaderViewConfiguration *)v6 setBackdropViewGroupName:v25];

  v26 = [(PXActionableSectionHeaderLayoutProvider *)self gradientImage];
  [(_PXActionableSectionHeaderViewConfiguration *)v6 setGradientImage:v26];

  v27 = [v5 spec];
  v28 = [v27 sectionHeaderSpec];
  [v28 gradientAlpha];
  -[_PXActionableSectionHeaderViewConfiguration setGradientAlpha:](v6, "setGradientAlpha:");

  v29 = [v5 spec];
  v30 = [v29 sectionHeaderSpec];
  [v30 gradientOverhang];
  -[_PXActionableSectionHeaderViewConfiguration setGradientOverhang:](v6, "setGradientOverhang:");

  v31 = [v5 spec];
  v32 = [v31 sectionHeaderSpec];
  v33 = [v32 curatedLibraryHeaderSpec];
  [(_PXActionableSectionHeaderViewConfiguration *)v6 setButtonSpec:v33];

  [(_PXActionableSectionHeaderViewConfiguration *)v6 setShowsTopSeparator:1];
  v34 = [v5 spec];
  -[_PXActionableSectionHeaderViewConfiguration setPreferredUserInterfaceStyle:](v6, "setPreferredUserInterfaceStyle:", [v34 preferredUserInterfaceStyle]);

  if (v5)
  {
    [v5 sectionIndexPath];
  }
  else
  {
    long long v51 = 0u;
    long long v52 = 0u;
  }
  v50[0] = v51;
  v50[1] = v52;
  [(_PXActionableSectionHeaderViewConfiguration *)v6 setSectionIndexPath:v50];
  if ([v5 isTopHeader])
  {
    BOOL v35 = 0;
  }
  else
  {
    *(_OWORD *)location = 0u;
    long long v49 = 0u;
    if (v5) {
      [v5 sectionIndexPath];
    }
    v36 = [v5 dataSource];
    v37 = v36;
    id v38 = location[0];
    if (location[0] == *(id *)off_1E5DAAED8
      || location[1] == (id)0x7FFFFFFFFFFFFFFFLL
      || (void)v49 != 0x7FFFFFFFFFFFFFFFLL
      || v38 != (id)[v36 identifier])
    {
      v44 = [MEMORY[0x1E4F28B00] currentHandler];
      [v44 handleFailureInMethod:v45 object:self file:@"PXActionableSectionHeaderLayoutProvider+iOS.m" lineNumber:384 description:@"Header layouts that are not global must be associated with a current section"];
    }
    uint64_t v39 = [v37 numberOfItemsInSection:location[1]];
    v40 = [v5 spec];
    v41 = [v40 assetsSpec];
    v42 = [v41 zoomableSpec];
    BOOL v35 = v39 >= [v42 staticNumberOfColumns];
  }
  [(_PXActionableSectionHeaderViewConfiguration *)v6 setAvoidsTintedButtonsAtHighSpeeds:v35];
  [(_PXActionableSectionHeaderViewConfiguration *)v6 setSupportsMultipleLinesInCompactLayout:1];

  return v6;
}

id __76__PXActionableSectionHeaderLayoutProvider_configurationForSingleViewLayout___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = [WeakRetained createFilterButtonControllerForLayout:*(void *)(a1 + 32)];

  return v3;
}

- (CGSize)singleViewLayout:(id)a3 desiredSizeForReferenceSize:(CGSize)a4
{
  double width = a4.width;
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    [v6 sectionIndexPath];
    uint64_t v8 = v61;
  }
  else
  {
    uint64_t v8 = 0;
    long long v61 = 0u;
    long long v62 = 0u;
  }
  if (v8 == *(void *)off_1E5DAAED8)
  {
    double v9 = 0.0;
    if ([v7 isInSelectMode]) {
      goto LABEL_27;
    }
  }
  id v59 = 0;
  id v60 = 0;
  [(PXActionableSectionHeaderLayoutProvider *)self _getPrimaryText:&v60 secondaryText:&v59 forLayout:v7];
  id v10 = v60;
  id v11 = v59;
  unint64_t v12 = [(PXActionableSectionHeaderLayoutProvider *)self actionTypeForHeaderLayout:v7];
  id v13 = [v7 spec];
  uint64_t v14 = [v13 sectionHeaderSpec];
  v15 = [v14 curatedLibraryHeaderSpec];
  id v16 = [(PXActionableSectionHeaderLayoutProvider *)self referenceHeaderView];
  [v16 setBackdropButtonSpec:v15];

  uint64_t v17 = [(PXActionableSectionHeaderLayoutProvider *)self referenceHeaderView];
  [v17 setPrimaryText:v10];

  uint64_t v18 = [(PXActionableSectionHeaderLayoutProvider *)self referenceHeaderView];
  [v18 setSecondaryText:v11];

  uint64_t v19 = [v7 spec];
  uint64_t v20 = [v19 sectionHeaderSpec];
  [v20 padding];
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  v29 = [(PXActionableSectionHeaderLayoutProvider *)self referenceHeaderView];
  objc_msgSend(v29, "setContentInsets:", v22, v24, v26, v28);

  v30 = [(PXActionableSectionHeaderLayoutProvider *)self referenceHeaderView];
  [v30 setSupportsMultipleLinesInCompactLayout:1];

  if (v12 < 6)
  {
    v31 = [(PXActionableSectionHeaderLayoutProvider *)self referenceHeaderView];
    v32 = v31;
    uint64_t v33 = 1;
LABEL_8:
    [v31 setButtonStyle:v33];

LABEL_12:
    BOOL v35 = 0;
    goto LABEL_13;
  }
  if (v12 - 7 >= 4)
  {
    BOOL v35 = 0;
    if (v12 != 6) {
      goto LABEL_13;
    }
    v31 = [(PXActionableSectionHeaderLayoutProvider *)self referenceHeaderView];
    v32 = v31;
    uint64_t v33 = 3;
    goto LABEL_8;
  }
  v34 = [(PXActionableSectionHeaderLayoutProvider *)self referenceHeaderView];
  [v34 setButtonStyle:1];

  if (v12 - 9 > 1) {
    goto LABEL_12;
  }
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __88__PXActionableSectionHeaderLayoutProvider_singleViewLayout_desiredSizeForReferenceSize___block_invoke;
  aBlock[3] = &unk_1E5DC2130;
  objc_copyWeak(&v57, &location);
  id v56 = v7;
  BOOL v35 = _Block_copy(aBlock);

  objc_destroyWeak(&v57);
  objc_destroyWeak(&location);
LABEL_13:
  v36 = [(PXActionableSectionHeaderLayoutProvider *)self referenceHeaderView];
  [v36 setFilterButtonControllerFactory:v35];

  v37 = [v7 dataSource];
  if (v7)
  {
    [v7 sectionIndexPath];
  }
  else
  {
    long long v53 = 0u;
    long long v54 = 0u;
  }
  id v38 = [(PXActionableSectionHeaderLayoutProvider *)self actionTextForActionType:v12 dataSource:v37 sectionIndexPath:&v53];

  uint64_t v39 = [v38 length];
  uint64_t v40 = v39 != 0;
  uint64_t v41 = v35 != 0;
  if (-[PXActionableSectionHeaderLayoutProvider actionVisibilityForHeaderLayout:](self, "actionVisibilityForHeaderLayout:", v7, v53, v54) == 1)
  {
    unsigned int v42 = [v7 wantsBackground];
    if (v39) {
      uint64_t v40 = v42;
    }
    else {
      uint64_t v40 = 0;
    }
    if (v35) {
      uint64_t v41 = v42;
    }
    else {
      uint64_t v41 = 0;
    }
  }
  v43 = [(PXActionableSectionHeaderLayoutProvider *)self referenceHeaderView];
  [v43 setShowsActionButton:v40];

  v44 = [(PXActionableSectionHeaderLayoutProvider *)self referenceHeaderView];
  [v44 setShowsSecondaryButton:v41];

  SEL v45 = [(PXActionableSectionHeaderLayoutProvider *)self referenceHeaderView];
  [v45 setActionText:v38];

  v46 = [v7 spec];
  uint64_t v47 = PXHorizontalSizeClassFromFeatureSpec(v46);
  if (v47 == 2) {
    uint64_t v48 = 2;
  }
  else {
    uint64_t v48 = v47 == 1;
  }

  long long v49 = [(PXActionableSectionHeaderLayoutProvider *)self referenceHeaderView];
  objc_msgSend(v49, "heightForSizeClass:width:safeAreaInsets:", v48, width, *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
  double v9 = v50;

LABEL_27:
  double v51 = width;
  double v52 = v9;
  result.height = v52;
  result.double width = v51;
  return result;
}

id __88__PXActionableSectionHeaderLayoutProvider_singleViewLayout_desiredSizeForReferenceSize___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = [WeakRetained createFilterButtonControllerForLayout:*(void *)(a1 + 32)];

  return v3;
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

- (void)configureSectionHeaderLayout:(id)a3 inAssetSectionLayout:(id)a4 forSectionedLayout:(id)a5
{
}

- (id)createSectionHeaderLayoutForSectionedLayout:(id)a3 dataSource:(id)a4 sectionIndexPath:(PXSimpleIndexPath *)a5 spec:(id)a6 outAlignment:(unint64_t *)a7
{
  id v11 = a4;
  id v12 = a6;
  long long v13 = *(_OWORD *)&a5->item;
  long long v17 = *(_OWORD *)&a5->dataSourceIdentifier;
  long long v18 = v13;
  if ([(PXActionableSectionHeaderLayoutProvider *)self wantsHeaderForDataSource:v11 sectionIndexPath:&v17])
  {
    long long v14 = *(_OWORD *)&a5->item;
    long long v17 = *(_OWORD *)&a5->dataSourceIdentifier;
    long long v18 = v14;
    v15 = [(PXActionableSectionHeaderLayoutProvider *)self _createSectionHeaderLayoutForDataSource:v11 sectionIndexPath:&v17 spec:v12 outAlignment:a7];
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)topHeaderLayout:(id)a3 didChangeDataSource:(id)a4
{
  id v5 = a3;
  [v5 setDataSource:a4];
  [v5 viewContentDidChange];
}

- (void)configureTopHeaderLayout:(id)a3 dataSource:(id)a4 spec:(id)a5
{
}

- (id)createTopHeaderLayoutForSectionedLayout:(id)a3 dataSource:(id)a4 spec:(id)a5 outShouldFloat:(BOOL *)a6
{
  id v9 = a4;
  id v10 = a5;
  if ([(PXActionableSectionHeaderLayoutProvider *)self wantsTopHeaderForDataSource:v9])
  {
    uint64_t v15 = 0;
    long long v11 = *((_OWORD *)off_1E5DAB028 + 1);
    v14[0] = *(_OWORD *)off_1E5DAB028;
    v14[1] = v11;
    id v12 = [(PXActionableSectionHeaderLayoutProvider *)self _createSectionHeaderLayoutForDataSource:v9 sectionIndexPath:v14 spec:v10 outAlignment:&v15];
    *a6 = v15 != 0;
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (void)_getPrimaryText:(id *)a3 secondaryText:(id *)a4 forLayout:(id)a5
{
  id v8 = a5;
  int v9 = [v8 isTopHeader];
  id v10 = [v8 dataSource];
  if (v9)
  {
    *a3 = [(PXActionableSectionHeaderLayoutProvider *)self primaryTopHeaderTextForDataSource:v10];

    long long v11 = [v8 dataSource];
    id v12 = [(PXActionableSectionHeaderLayoutProvider *)self secondaryTopHeaderTextForDataSource:v11];
  }
  else
  {
    if (v8) {
      [v8 sectionIndexPath];
    }
    else {
      memset(v14, 0, sizeof(v14));
    }
    *a3 = [(PXActionableSectionHeaderLayoutProvider *)self primaryTextForDataSource:v10 sectionIndexPath:v14];

    long long v11 = [v8 dataSource];
    if (v8) {
      [v8 sectionIndexPath];
    }
    else {
      memset(v13, 0, sizeof(v13));
    }
    id v12 = [(PXActionableSectionHeaderLayoutProvider *)self secondaryTextForDataSource:v11 sectionIndexPath:v13];
  }
  *a4 = v12;
}

- (id)_createSectionHeaderLayoutForDataSource:(id)a3 sectionIndexPath:(PXSimpleIndexPath *)a4 spec:(id)a5 outAlignment:(unint64_t *)a6
{
  id v10 = a5;
  id v11 = a3;
  id v12 = [[PXActionableSectionHeaderLayout alloc] initWithSpec:v10];

  [(PXActionableSectionHeaderLayout *)v12 setDataSource:v11];
  long long v13 = *(_OWORD *)&a4->item;
  v17[0] = *(_OWORD *)&a4->dataSourceIdentifier;
  v17[1] = v13;
  [(PXActionableSectionHeaderLayout *)v12 setSectionIndexPath:v17];
  [(PXGSingleViewLayout *)v12 setStyle:2];
  [(PXGSingleViewLayout *)v12 setContentViewClass:objc_opt_class()];
  [(PXGSingleViewLayout *)v12 setDelegate:self];
  [(PXActionableSectionHeaderLayout *)v12 setInteractionDelegate:self];
  long long v14 = [(PXActionableSectionHeaderLayoutProvider *)self viewProvider];
  [(PXActionableSectionHeaderLayout *)v12 setViewProvider:v14];

  LODWORD(v15) = -1080452710;
  [(PXGSingleViewLayout *)v12 setZPosition:v15];
  [(PXActionableSectionHeaderLayout *)v12 setAlwaysWantsBackground:a4->dataSourceIdentifier == *(void *)off_1E5DAAED8];
  *a6 = 1;
  return v12;
}

- (int64_t)actionVisibilityForHeaderLayout:(id)a3
{
  return 0;
}

- (int64_t)actionTypeForHeaderLayout:(id)a3
{
  id v3 = a3;
  if ([v3 isInSelectMode] && (objc_msgSend(v3, "isTopHeader") & 1) == 0)
  {
    if ([v3 areAllItemsSelected]) {
      int64_t v4 = 2;
    }
    else {
      int64_t v4 = 1;
    }
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (id)actionTextForActionType:(int64_t)a3 dataSource:(id)a4 sectionIndexPath:(PXSimpleIndexPath *)a5
{
  id v6 = a4;
  switch(a3)
  {
    case 1:
      BOOL v7 = @"PXPhotosGridsSectionSelectButton";
      goto LABEL_7;
    case 2:
      BOOL v7 = @"PXPhotosGridsSectionDeselectButton";
      goto LABEL_7;
    case 3:
    case 4:
    case 5:
      id v10 = [MEMORY[0x1E4F28B00] currentHandler];
      id v11 = [NSString stringWithUTF8String:"-[PXActionableSectionHeaderLayoutProvider actionTextForActionType:dataSource:sectionIndexPath:]"];
      [v10 handleFailureInFunction:v11 file:@"PXActionableSectionHeaderLayoutProvider+iOS.m" lineNumber:146 description:@"Code which should be unreachable has been reached"];

      abort();
    case 6:
      id v8 = @"checkmark.circle";
      break;
    case 7:
    case 9:
      BOOL v7 = @"PXPhotosGridsSectionEnterSelectModeButton";
      goto LABEL_7;
    case 8:
    case 10:
      BOOL v7 = @"PXPhotosGridsSectionLeaveSelectModeButton";
LABEL_7:
      PXLocalizedStringFromTable(v7, @"PhotosUICore");
      id v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      id v8 = 0;
      break;
  }

  return v8;
}

- (id)secondaryTextForDataSource:(id)a3 sectionIndexPath:(PXSimpleIndexPath *)a4
{
  return 0;
}

- (id)primaryTextForDataSource:(id)a3 sectionIndexPath:(PXSimpleIndexPath *)a4
{
  return 0;
}

- (id)secondaryTopHeaderTextForDataSource:(id)a3
{
  return 0;
}

- (id)primaryTopHeaderTextForDataSource:(id)a3
{
  return 0;
}

- (BOOL)wantsHeaderForDataSource:(id)a3 sectionIndexPath:(PXSimpleIndexPath *)a4
{
  return 1;
}

- (BOOL)wantsTopHeaderForDataSource:(id)a3
{
  return 0;
}

- (PXActionableSectionHeaderLayoutProvider)init
{
  int64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXActionableSectionHeaderLayoutProvider+iOS.m", 94, @"%s is not available as initializer", "-[PXActionableSectionHeaderLayoutProvider init]");

  abort();
}

- (PXActionableSectionHeaderLayoutProvider)initWithViewModel:(id)a3 viewProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)PXActionableSectionHeaderLayoutProvider;
  int v9 = [(PXActionableSectionHeaderLayoutProvider *)&v19 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_viewModel, a3);
    objc_storeWeak((id *)&v10->_viewProvider, v8);
    id v11 = [PXActionableSectionHeaderView alloc];
    uint64_t v12 = -[PXActionableSectionHeaderView initWithFrame:](v11, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    referenceHeaderView = v10->_referenceHeaderView;
    v10->_referenceHeaderView = (PXActionableSectionHeaderView *)v12;

    long long v14 = +[PXPhotosGridSettings sharedInstance];
    if ([v14 enableTitleLegibilityDimmingFilter]) {
      double v15 = @"PXHeaderGradient2";
    }
    else {
      double v15 = @"PXHeaderGradient";
    }
    uint64_t v16 = objc_msgSend(MEMORY[0x1E4FB1818], "px_imageNamed:", v15);
    gradientImage = v10->_gradientImage;
    v10->_gradientImage = (UIImage *)v16;
  }
  return v10;
}

@end