@interface PXCMMSectionHeaderController
+ (id)_buttonLabelFont;
+ (id)_photosLabelFont;
+ (id)new;
- (BOOL)_wantsActionButtons;
- (PXCMMSectionHeaderController)init;
- (PXCMMSectionHeaderController)initWithActivityType:(unint64_t)a3 viewModel:(id)a4 momentShareStatusPresentation:(id)a5 importStatusManager:(id)a6;
- (UIView)view;
- (int64_t)actionButtonType;
- (int64_t)secondaryActionButtonType;
- (void)_contentSizeCategoryDidChangeNotification:(id)a3;
- (void)_deselectAllAssets;
- (void)_handleActionButtonTapped:(id)a3;
- (void)_handleSecondaryButtonTapped:(id)a3;
- (void)_layoutButtonWithSize:(CGSize)a3;
- (void)_loadViewIfNeeded;
- (void)_selectAllAssets;
- (void)_setActionButtonType:(int64_t)a3;
- (void)_setSecondaryActionButtonType:(int64_t)a3;
- (void)_updateActionButtons;
- (void)becomeReusable;
- (void)didApplyGeometry:(PXTileGeometry *)a3 withUserData:(id)a4;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)prepareForReuse;
@end

@implementation PXCMMSectionHeaderController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photosLabel, 0);
  objc_storeStrong((id *)&self->_secondaryButton, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_underlyingView, 0);
  objc_storeStrong((id *)&self->_importStatusManager, 0);
  objc_storeStrong((id *)&self->_momentShareStatusPresentation, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

- (int64_t)secondaryActionButtonType
{
  return self->_secondaryActionButtonType;
}

- (int64_t)actionButtonType
{
  return self->_actionButtonType;
}

- (void)_contentSizeCategoryDidChangeNotification:(id)a3
{
  v4 = [(id)objc_opt_class() _photosLabelFont];
  [(UILabel *)self->_photosLabel setFont:v4];

  v5 = [(id)objc_opt_class() _buttonLabelFont];
  v6 = [(UIButton *)self->_actionButton titleLabel];
  [v6 setFont:v5];

  v7 = [(UIButton *)self->_actionButton titleLabel];
  [v7 sizeToFit];

  v8 = [(id)objc_opt_class() _buttonLabelFont];
  v9 = [(UIButton *)self->_secondaryButton titleLabel];
  [v9 setFont:v8];

  v10 = [(UIButton *)self->_secondaryButton titleLabel];
  [v10 sizeToFit];

  [(UIView *)self->_underlyingView frame];
  -[PXCMMSectionHeaderController _layoutButtonWithSize:](self, "_layoutButtonWithSize:", v11, v12);
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  __int16 v6 = a4;
  id v9 = a3;
  if ((void *)PXCMMViewModelObservationContext == a5)
  {
    if ((v6 & 0x4400) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  if ((void *)SelectionModelObservationContext == a5)
  {
    if ((v6 & 1) == 0) {
      goto LABEL_8;
    }
LABEL_7:
    id v11 = v9;
    [(PXCMMSectionHeaderController *)self _updateActionButtons];
    id v9 = v11;
    goto LABEL_8;
  }
  if ((void *)PXMomentShareStatusPresentationObservationContext_172815 != a5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PXCMMSectionHeaderController.m" lineNumber:424 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  if ((v6 & 0x4000) != 0) {
    goto LABEL_7;
  }
LABEL_8:
}

- (void)prepareForReuse
{
}

- (void)becomeReusable
{
}

- (void)didApplyGeometry:(PXTileGeometry *)a3 withUserData:(id)a4
{
}

- (void)_deselectAllAssets
{
  id v2 = [(PXCMMViewModel *)self->_viewModel selectionManager];
  [v2 performChanges:&__block_literal_global_231];
}

uint64_t __50__PXCMMSectionHeaderController__deselectAllAssets__block_invoke(uint64_t a1, void *a2)
{
  return [a2 deselectAll];
}

- (void)_selectAllAssets
{
  v3 = [(PXCMMViewModel *)self->_viewModel selectionManager];
  id v4 = v3;
  if (self->_activityType == 2 && self->_importStatusManager) {
    objc_msgSend(v3, "selectNonCopiedAssetsWithImportStatusManager:");
  }
  else {
    [v3 performChanges:&__block_literal_global_172823];
  }
}

uint64_t __48__PXCMMSectionHeaderController__selectAllAssets__block_invoke(uint64_t a1, void *a2)
{
  return [a2 selectAllItems];
}

- (void)_updateActionButtons
{
  if (!self->_isViewLoaded || ![(PXCMMSectionHeaderController *)self _wantsActionButtons]) {
    return;
  }
  if (!self->_actionButton)
  {
    v3 = [(UIView *)self->_underlyingView tintColor];
    id v4 = [v3 colorWithAlphaComponent:0.3];

    v5 = [MEMORY[0x1E4FB14D0] buttonWithType:0];
    actionButton = self->_actionButton;
    self->_actionButton = v5;

    v7 = [(id)objc_opt_class() _buttonLabelFont];
    v8 = [(UIButton *)self->_actionButton titleLabel];
    [v8 setFont:v7];

    id v9 = self->_actionButton;
    v10 = [(UIView *)self->_underlyingView tintColor];
    [(UIButton *)v9 setTitleColor:v10 forState:0];

    [(UIButton *)self->_actionButton setTitleColor:v4 forState:1];
    [(UIButton *)self->_actionButton addTarget:self action:sel__handleActionButtonTapped_ forControlEvents:0x2000];
    [(UIView *)self->_underlyingView addSubview:self->_actionButton];
  }
  BOOL v11 = [(PXCMMViewModel *)self->_viewModel isSelecting];
  uint64_t v12 = 1;
  if (v11) {
    uint64_t v13 = 2;
  }
  else {
    uint64_t v13 = 1;
  }
  [(PXCMMSectionHeaderController *)self _setActionButtonType:v13];
  [(UIButton *)self->_actionButton setHidden:[(PXCMMViewModel *)self->_viewModel selectionEnabled] ^ 1];
  if (v11)
  {
    if (!self->_secondaryButton)
    {
      v14 = [(UIView *)self->_underlyingView tintColor];
      v15 = [v14 colorWithAlphaComponent:0.3];

      v16 = [MEMORY[0x1E4FB14D0] buttonWithType:0];
      secondaryButton = self->_secondaryButton;
      self->_secondaryButton = v16;

      v18 = [(id)objc_opt_class() _buttonLabelFont];
      v19 = [(UIButton *)self->_secondaryButton titleLabel];
      [v19 setFont:v18];

      v20 = self->_secondaryButton;
      v21 = [(UIView *)self->_underlyingView tintColor];
      [(UIButton *)v20 setTitleColor:v21 forState:0];

      [(UIButton *)self->_secondaryButton setTitleColor:v15 forState:1];
      [(UIButton *)self->_secondaryButton addTarget:self action:sel__handleSecondaryButtonTapped_ forControlEvents:0x2000];
      [(UIView *)self->_underlyingView addSubview:self->_secondaryButton];
    }
    v22 = [(PXCMMViewModel *)self->_viewModel selectionManager];
    momentShareStatusPresentation = self->_momentShareStatusPresentation;
    if (momentShareStatusPresentation && self->_activityType == 2)
    {
      uint64_t v24 = [(PXMomentShareStatusPresentation *)momentShareStatusPresentation numberOfAssetsNotCopied];
      v25 = [v22 selectionSnapshot];
      v26 = [v25 selectedIndexPaths];
      uint64_t v27 = [v26 count];

      if (v24 != v27)
      {
LABEL_14:
        uint64_t v28 = 3;
LABEL_18:
        [(PXCMMSectionHeaderController *)self _setSecondaryActionButtonType:v28];

        uint64_t v12 = [(PXCMMViewModel *)self->_viewModel selectionEnabled] ^ 1;
        goto LABEL_19;
      }
    }
    else
    {
      v29 = [v22 selectionSnapshot];
      char v30 = [v29 areAllItemsSelected];

      if ((v30 & 1) == 0) {
        goto LABEL_14;
      }
    }
    uint64_t v28 = 4;
    goto LABEL_18;
  }
LABEL_19:
  [(UIButton *)self->_secondaryButton setHidden:v12];
  v31 = self->_secondaryButton;
  if (v31) {
    uint64_t v32 = [(UIButton *)v31 isHidden] ^ 1;
  }
  else {
    uint64_t v32 = 0;
  }
  photosLabel = self->_photosLabel;
  [(UILabel *)photosLabel setHidden:v32];
}

- (BOOL)_wantsActionButtons
{
  unint64_t activityType = self->_activityType;
  if (activityType == 3) {
    return 0;
  }
  if (activityType) {
    BOOL v3 = activityType == 4;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"PXCMMSectionHeaderController.m" lineNumber:294 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  return 1;
}

- (void)_layoutButtonWithSize:(CGSize)a3
{
}

void __54__PXCMMSectionHeaderController__layoutButtonWithSize___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4FB1EB0], "userInterfaceLayoutDirectionForSemanticContentAttribute:", objc_msgSend(*(id *)(a1 + 32), "semanticContentAttribute"));
  uint64_t v5 = v4;
  if (v4 == 1) {
    uint64_t v6 = 64;
  }
  else {
    uint64_t v6 = 56;
  }
  if (v4 == 1) {
    uint64_t v7 = 56;
  }
  else {
    uint64_t v7 = 64;
  }
  id v8 = *(id *)(*(void *)(a1 + 40) + v6);
  id v9 = *(id *)(*(void *)(a1 + 40) + v7);
  objc_msgSend(v8, "sizeThatFits:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  double v11 = v10;
  double v13 = v12;
  double v14 = *(double *)(a1 + 48) - v10 + -20.0;
  objc_msgSend(v9, "sizeThatFits:");
  double v16 = v15;
  double v18 = v17;
  v19 = [MEMORY[0x1E4FB1438] sharedApplication];
  v20 = [v19 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v20);

  double v22 = 20.0;
  if (IsAccessibilityCategory) {
    double v23 = 20.0;
  }
  else {
    double v23 = v14;
  }
  double v24 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  if (v5 == 1 && IsAccessibilityCategory)
  {
    double v22 = *(double *)(a1 + 48) - v16 + -20.0;
    double v23 = v14;
  }
  objc_msgSend(v8, "setFrame:", v23, *(double *)(MEMORY[0x1E4F1DB28] + 8), v11, v13);
  objc_msgSend(v9, "setFrame:", v22, v24, v16, v18);
  v47[0] = vdupq_n_s64(0x7FF8000000000000uLL);
  v47[1] = v47[0];
  v47[2] = v47[0];
  long long v48 = v47[0];
  long long v49 = v47[0];
  long long v50 = v47[0];
  long long v51 = v47[0];
  *((void *)&v48 + 1) = *(void *)(a1 + 64);
  if (v9) {
    [v3 layoutView:v9 withAttributes:v47];
  }
  if (v8) {
    [v3 layoutView:v8 withAttributes:v47];
  }
  double v25 = *(double *)(a1 + 72);
  if (IsAccessibilityCategory)
  {
    if (v5 == 1) {
      v26 = v8;
    }
    else {
      v26 = v9;
    }
    if (v5 == 1)
    {
      double v27 = v23;
    }
    else
    {
      double v13 = v18;
      double v11 = v16;
      double v27 = v22;
    }
    id v28 = v26;
    v29 = [(id)objc_opt_class() _buttonLabelFont];
    [v29 lineHeight];
    double v31 = v30;
    [v29 leading];
    double v33 = v31 + v32;
    [v29 descender];
    double v35 = v33 + v34;
    [v29 capHeight];
    double v37 = v25 - (v35 - v36);
    v52.origin.x = v27;
    v52.origin.y = v24;
    v52.size.width = v11;
    v52.size.height = v13;
    objc_msgSend(v28, "setFrame:", v27, v37 + (CGRectGetHeight(v52) - v31) * -0.5, v11, v13);
  }
  int64x2_t v38 = vdupq_n_s64(0x7FF8000000000000uLL);
  v40[1] = v38.i64[1];
  int64x2_t v41 = v38;
  int64x2_t v42 = v38;
  int64x2_t v43 = v38;
  int64x2_t v45 = v38;
  int64x2_t v46 = v38;
  v40[0] = 0x4034000000000000;
  *(double *)&v45.i64[1] = *(double *)(a1 + 48) + 20.0;
  v43.i64[1] = *(void *)(a1 + 64);
  int64x2_t v44 = vdupq_n_s64(0x7FF0000000000000uLL);
  [v3 layoutView:*(void *)(*(void *)(a1 + 40) + 72) withAttributes:v40];
  if (IsAccessibilityCategory)
  {
    v39 = [(id)objc_opt_class() _photosLabelFont];
    [v39 lineHeight];
    [v39 leading];
    [v39 descender];
    [v39 capHeight];
    [*(id *)(*(void *)(a1 + 40) + 72) frame];
    objc_msgSend(*(id *)(*(void *)(a1 + 40) + 72), "setFrame:");
  }
}

- (void)_setSecondaryActionButtonType:(int64_t)a3
{
  if (self->_secondaryActionButtonType == a3) {
    return;
  }
  self->_secondaryActionButtonType = a3;
  if (a3 == 3)
  {
    secondaryButton = self->_secondaryButton;
    uint64_t v7 = @"PXCMMSelectAllButtonTitle";
  }
  else
  {
    if (a3 != 4)
    {
      if ((unint64_t)a3 < 3)
      {
        uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
        [v5 handleFailureInMethod:a2 object:self file:@"PXCMMSectionHeaderController.m" lineNumber:187 description:@"Code which should be unreachable has been reached"];

        abort();
      }
      goto LABEL_9;
    }
    secondaryButton = self->_secondaryButton;
    uint64_t v7 = @"PXCMMDeselectAllButtonTitle";
  }
  id v8 = PXLocalizedStringFromTable(v7, @"PhotosUICore");
  [(UIButton *)secondaryButton setTitle:v8 forState:0];

LABEL_9:
  [(UIView *)self->_underlyingView frame];
  -[PXCMMSectionHeaderController _layoutButtonWithSize:](self, "_layoutButtonWithSize:", v9, v10);
}

- (void)_setActionButtonType:(int64_t)a3
{
  if (self->_actionButtonType != a3)
  {
    self->_actionButtonType = a3;
    switch(a3)
    {
      case 0:
      case 3:
      case 4:
        double v10 = [MEMORY[0x1E4F28B00] currentHandler];
        [v10 handleFailureInMethod:a2 object:self file:@"PXCMMSectionHeaderController.m" lineNumber:164 description:@"Code which should be unreachable has been reached"];

        abort();
      case 1:
        actionButton = self->_actionButton;
        uint64_t v5 = @"PXCMMSelectButtonTitle";
        goto LABEL_5;
      case 2:
        actionButton = self->_actionButton;
        uint64_t v5 = @"PXCMMCancelButtonTitle";
LABEL_5:
        uint64_t v6 = PXLocalizedStringFromTable(v5, @"PhotosUICore");
        [(UIButton *)actionButton setTitle:v6 forState:0];

        break;
      default:
        break;
    }
    [(UIView *)self->_underlyingView frame];
    -[PXCMMSectionHeaderController _layoutButtonWithSize:](self, "_layoutButtonWithSize:", v7, v8);
  }
}

- (void)_handleSecondaryButtonTapped:(id)a3
{
  id v7 = a3;
  unint64_t v5 = [(PXCMMSectionHeaderController *)self secondaryActionButtonType];
  if (v5 == 3)
  {
    [(PXCMMSectionHeaderController *)self _selectAllAssets];
  }
  else if (v5 == 4)
  {
    [(PXCMMSectionHeaderController *)self _deselectAllAssets];
  }
  else if (v5 < 3)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"PXCMMSectionHeaderController.m" lineNumber:143 description:@"Code which should be unreachable has been reached"];

    abort();
  }
}

- (void)_handleActionButtonTapped:(id)a3
{
  id v3 = self->_viewModel;
  BOOL v4 = [(PXCMMViewModel *)v3 isSelecting];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__PXCMMSectionHeaderController__handleActionButtonTapped___block_invoke;
  v5[3] = &__block_descriptor_33_e33_v16__0___PXCMMMutableViewModel__8l;
  BOOL v6 = v4;
  [(PXCMMViewModel *)v3 performChanges:v5];
}

uint64_t __58__PXCMMSectionHeaderController__handleActionButtonTapped___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setSelecting:*(unsigned char *)(a1 + 32) == 0];
}

- (UIView)view
{
  [(PXCMMSectionHeaderController *)self _loadViewIfNeeded];
  underlyingView = self->_underlyingView;
  return underlyingView;
}

- (void)_loadViewIfNeeded
{
  if (!self->_isViewLoaded)
  {
    self->_isViewLoaded = 1;
    id v3 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    BOOL v4 = (UIView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    underlyingView = self->_underlyingView;
    self->_underlyingView = v4;

    BOOL v6 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    [(UIView *)self->_underlyingView setBackgroundColor:v6];

    id v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    photosLabel = self->_photosLabel;
    self->_photosLabel = v7;

    double v9 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)self->_photosLabel setTextColor:v9];

    [(UILabel *)self->_photosLabel setNumberOfLines:1];
    double v10 = [(id)objc_opt_class() _photosLabelFont];
    [(UILabel *)self->_photosLabel setFont:v10];

    double v11 = PXLocalizedStringFromTable(@"PXCMMSectionHeaderTitle", @"PhotosUICore");
    [(UILabel *)self->_photosLabel setText:v11];

    [(UIView *)self->_underlyingView addSubview:self->_photosLabel];
    [(PXCMMSectionHeaderController *)self _updateActionButtons];
  }
}

- (PXCMMSectionHeaderController)initWithActivityType:(unint64_t)a3 viewModel:(id)a4 momentShareStatusPresentation:(id)a5 importStatusManager:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)PXCMMSectionHeaderController;
  double v14 = [(PXCMMSectionHeaderController *)&v19 init];
  double v15 = v14;
  if (v14)
  {
    v14->_unint64_t activityType = a3;
    objc_storeStrong((id *)&v14->_viewModel, a4);
    [(PXCMMViewModel *)v15->_viewModel registerChangeObserver:v15 context:PXCMMViewModelObservationContext];
    double v16 = [(PXCMMViewModel *)v15->_viewModel selectionManager];
    [v16 registerChangeObserver:v15 context:SelectionModelObservationContext];

    objc_storeStrong((id *)&v15->_momentShareStatusPresentation, a5);
    [(PXMomentShareStatusPresentation *)v15->_momentShareStatusPresentation registerChangeObserver:v15 context:PXMomentShareStatusPresentationObservationContext_172815];
    objc_storeStrong((id *)&v15->_importStatusManager, a6);
    double v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v17 addObserver:v15 selector:sel__contentSizeCategoryDidChangeNotification_ name:*MEMORY[0x1E4FB27A8] object:0];
  }
  return v15;
}

- (PXCMMSectionHeaderController)init
{
  BOOL v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCMMSectionHeaderController.m", 64, @"%s is not available as initializer", "-[PXCMMSectionHeaderController init]");

  abort();
}

+ (id)_photosLabelFont
{
  return (id)objc_msgSend(MEMORY[0x1E4FB08E0], "px_preferredFontForTextStyle:withSymbolicTraits:options:", *MEMORY[0x1E4FB2908], 0x8000, 0);
}

+ (id)_buttonLabelFont
{
  return (id)objc_msgSend(MEMORY[0x1E4FB08E0], "px_preferredFontForTextStyle:withSymbolicTraits:options:", *MEMORY[0x1E4FB2950], 0x8000, 0);
}

+ (id)new
{
  BOOL v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"PXCMMSectionHeaderController.m", 68, @"%s is not available as initializer", "+[PXCMMSectionHeaderController new]");

  abort();
}

@end