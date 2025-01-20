@interface PXCuratedLibraryFilterToggleButtonController
+ (id)foregroundColorOverLegibilityGradient:(BOOL)a3;
- (BOOL)shouldHideButton;
- (PXCuratedLibraryFilterToggleButtonController)initWithButtonConfiguration:(id)a3 roundedButton:(BOOL)a4;
- (PXCuratedLibraryFilterToggleButtonController)initWithViewModel:(id)a3 buttonConfiguration:(id)a4;
- (PXCuratedLibraryViewModel)viewModel;
- (id)adjustedChildMenuIfNecessary:(id)a3;
- (id)allMenuItems;
- (id)filterInlineMenuItems;
- (id)filterMenuItems;
- (id)filterMenuSubtitle;
- (id)viewOptionsMenuItems;
- (id)viewOptionsMenuSubtitle;
- (void)_updateContentFilterState;
- (void)_updateLibraryState;
- (void)_updateStyling;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
@end

@implementation PXCuratedLibraryFilterToggleButtonController

+ (id)foregroundColorOverLegibilityGradient:(BOOL)a3
{
  if (a3) {
    [MEMORY[0x1E4FB1618] whiteColor];
  }
  else {
  v3 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  }
  return v3;
}

- (void)_updateContentFilterState
{
  v3 = [(PXCuratedLibraryFilterToggleButtonController *)self viewModel];
  id v7 = [v3 currentContentFilterState];

  v4 = [(PXContentFilterToggleButtonController *)self contentFilterState];
  if ([v4 showOnlyScreenshots] && (objc_msgSend(v7, "showOnlyScreenshots") & 1) == 0)
  {
    int v5 = [v7 shouldExcludeScreenshots];

    [(PXContentFilterToggleButtonController *)self setContentFilterState:v7];
    if (v5)
    {
      v6 = +[PXGridTipsHelper filterScreenshotsHiddenTipID];
      +[PXGridTipsHelper setTip:v6 isPresentable:1];
    }
  }
  else
  {

    [(PXContentFilterToggleButtonController *)self setContentFilterState:v7];
  }
}

- (void)_updateLibraryState
{
  id v5 = [(PXCuratedLibraryFilterToggleButtonController *)self viewModel];
  v3 = [v5 libraryFilterState];
  v4 = (void *)[v3 copy];
  [(PXContentFilterToggleButtonController *)self setLibraryFilterState:v4];
}

- (BOOL)shouldHideButton
{
  v7.receiver = self;
  v7.super_class = (Class)PXCuratedLibraryFilterToggleButtonController;
  if ([(PXContentFilterToggleButtonController *)&v7 shouldHideButton]) {
    return 1;
  }
  v4 = [(PXCuratedLibraryFilterToggleButtonController *)self viewModel];
  if ([v4 zoomLevel] == 4)
  {
    id v5 = [(PXCuratedLibraryFilterToggleButtonController *)self viewModel];
    char v3 = [v5 shouldShowEmptyPlaceholder];
  }
  else
  {
    char v3 = 1;
  }

  return v3;
}

- (id)allMenuItems
{
  v4 = [(PXCuratedLibraryFilterToggleButtonController *)self viewModel];

  if (!v4)
  {
    v11 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_9;
  }
  id v5 = [(PXCuratedLibraryFilterToggleButtonController *)self viewModel];
  v6 = [v5 actionManager];
  objc_super v7 = [v6 actionPerformerForActionType:@"PXCuratedLibraryActionShowFiltersMenu"];

  if (!v7)
  {
    v11 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_8;
  }
  v8 = [(PXContentFilterToggleButtonController *)self button];
  [v7 setSender:v8];

  id v9 = [v7 menuElement];
  if (!v9)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    [v13 handleFailureInMethod:a2, self, @"PXCuratedLibraryFilterToggleButtonController.m", 135, @"%@ should be an instance inheriting from %@, but it is nil", @"filterMenuElement", v15 object file lineNumber description];
LABEL_14:

    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    v16 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v16);
    v17 = objc_msgSend(v9, "px_descriptionForAssertionMessage");
    [v13 handleFailureInMethod:a2, self, @"PXCuratedLibraryFilterToggleButtonController.m", 135, @"%@ should be an instance inheriting from %@, but it is %@", @"filterMenuElement", v15, v17 object file lineNumber description];

    goto LABEL_14;
  }
LABEL_5:
  v10 = [v9 children];
  v11 = (void *)[v10 copy];

LABEL_8:
LABEL_9:
  return v11;
}

- (PXCuratedLibraryViewModel)viewModel
{
  return self->_viewModel;
}

- (PXCuratedLibraryFilterToggleButtonController)initWithViewModel:(id)a3 buttonConfiguration:(id)a4
{
  id v7 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PXCuratedLibraryFilterToggleButtonController;
  v8 = [(PXContentFilterToggleButtonController *)&v16 initWithButtonConfiguration:a4 roundedButton:1];
  id v9 = v8;
  if (v8)
  {
    p_viewModel = (id *)&v8->_viewModel;
    objc_storeStrong((id *)&v8->_viewModel, a3);
    [*p_viewModel registerChangeObserver:v9 context:PXCuratedLibraryViewModelObserverContext_181326];
    v11 = [*p_viewModel zoomablePhotosViewModel];
    [v11 registerChangeObserver:v9 context:PXCuratedLibraryZoomablePhotosViewModelObserverContext];

    v12 = [*p_viewModel libraryFilterState];
    [v12 registerChangeObserver:v9 context:PXLibraryFilterStateObservationContext_181327];

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __86__PXCuratedLibraryFilterToggleButtonController_initWithViewModel_buttonConfiguration___block_invoke;
    v14[3] = &unk_1E5DC27B0;
    v15 = v9;
    [(PXContentFilterToggleButtonController *)v15 performChanges:v14];
  }
  return v9;
}

uint64_t __86__PXCuratedLibraryFilterToggleButtonController_initWithViewModel_buttonConfiguration___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateLibraryState];
  v2 = *(void **)(a1 + 32);
  return [v2 _updateContentFilterState];
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v10 = a3;
  if ((void *)PXCuratedLibraryViewModelObserverContext_181326 != a5)
  {
    if ((void *)PXCuratedLibraryZoomablePhotosViewModelObserverContext != a5
      && (void *)PXLibraryFilterStateObservationContext_181327 != a5)
    {
      id v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2 object:self file:@"PXCuratedLibraryFilterToggleButtonController.m" lineNumber:176 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    if ((a4 & 2) != 0) {
      goto LABEL_5;
    }
    goto LABEL_6;
  }
  if ((a4 & 0x10) != 0)
  {
    [(PXCuratedLibraryFilterToggleButtonController *)self _updateLibraryState];
    if ((a4 & 0x2000000) == 0)
    {
LABEL_11:
      if ((a4 & 0x400000000) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  else if ((a4 & 0x2000000) == 0)
  {
    goto LABEL_11;
  }
  [(PXCuratedLibraryFilterToggleButtonController *)self _updateContentFilterState];
  if ((a4 & 0x400000000) != 0) {
LABEL_12:
  }
    [(PXCuratedLibraryFilterToggleButtonController *)self _updateStyling];
LABEL_13:
  if ((a4 & 0x10004) != 0) {
LABEL_5:
  }
    [(PXContentFilterToggleButtonController *)self invalidateButtonMenu];
LABEL_6:
}

- (void).cxx_destruct
{
}

- (id)adjustedChildMenuIfNecessary:(id)a3
{
  id v4 = a3;
  id v5 = [v4 identifier];
  int v6 = [v5 isEqualToString:@"com.apple.photos.menu.contentFilterInlineMenu"];

  if (v6)
  {
    id v7 = [(PXCuratedLibraryFilterToggleButtonController *)self filterInlineMenuItems];
    if (v7)
    {
      v8 = [v4 menuByReplacingChildren:v7];
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)PXCuratedLibraryFilterToggleButtonController;
    v8 = [(PXContentFilterToggleButtonController *)&v10 adjustedChildMenuIfNecessary:v4];
  }

  return v8;
}

- (id)viewOptionsMenuSubtitle
{
  v2 = [(PXCuratedLibraryFilterToggleButtonController *)self viewModel];
  char v3 = [v2 actionManager];
  id v4 = [v3 actionPerformerForActionType:@"PXCuratedLibraryActionShowFiltersMenu"];

  id v5 = [v4 viewOptionsMenuSubtitle];

  return v5;
}

- (id)viewOptionsMenuItems
{
  v2 = [(PXCuratedLibraryFilterToggleButtonController *)self viewModel];
  char v3 = [v2 actionManager];
  id v4 = [v3 actionPerformerForActionType:@"PXCuratedLibraryActionShowFiltersMenu"];

  id v5 = [v4 viewOptionsMenuItems];

  return v5;
}

- (id)filterMenuSubtitle
{
  v2 = [(PXCuratedLibraryFilterToggleButtonController *)self viewModel];
  char v3 = [v2 actionManager];
  id v4 = [v3 actionPerformerForActionType:@"PXCuratedLibraryActionShowFiltersMenu"];

  id v5 = [v4 filterMenuSubtitle];

  return v5;
}

- (id)filterMenuItems
{
  v2 = [(PXCuratedLibraryFilterToggleButtonController *)self viewModel];
  char v3 = [v2 actionManager];
  id v4 = [v3 actionPerformerForActionType:@"PXCuratedLibraryActionShowFiltersMenu"];

  id v5 = [v4 filterMenuItems];

  return v5;
}

- (id)filterInlineMenuItems
{
  v2 = [(PXCuratedLibraryFilterToggleButtonController *)self viewModel];
  char v3 = [v2 actionManager];
  id v4 = [v3 actionPerformerForActionType:@"PXCuratedLibraryActionShowFiltersMenu"];

  id v5 = [v4 filterInlineMenuItems];

  return v5;
}

- (void)_updateStyling
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __62__PXCuratedLibraryFilterToggleButtonController__updateStyling__block_invoke;
  v2[3] = &unk_1E5DD36F8;
  v2[4] = self;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:4 delay:v2 options:0 animations:0.3 completion:0.0];
}

uint64_t __62__PXCuratedLibraryFilterToggleButtonController__updateStyling__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __62__PXCuratedLibraryFilterToggleButtonController__updateStyling__block_invoke_2;
  v3[3] = &unk_1E5DC27B0;
  v3[4] = v1;
  return [v1 performChanges:v3];
}

void __62__PXCuratedLibraryFilterToggleButtonController__updateStyling__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v2 viewModel];
  id v4 = +[PXCuratedLibraryFilterToggleButtonController foregroundColorOverLegibilityGradient:](PXCuratedLibraryFilterToggleButtonController, "foregroundColorOverLegibilityGradient:", [v5 secondaryToolbarLegibilityGradientIsVisible]);
  [v3 setSecondaryTintColor:v4];
}

- (PXCuratedLibraryFilterToggleButtonController)initWithButtonConfiguration:(id)a3 roundedButton:(BOOL)a4
{
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCuratedLibraryFilterToggleButtonController.m", 57, @"%s is not available as initializer", "-[PXCuratedLibraryFilterToggleButtonController initWithButtonConfiguration:roundedButton:]");

  abort();
}

@end