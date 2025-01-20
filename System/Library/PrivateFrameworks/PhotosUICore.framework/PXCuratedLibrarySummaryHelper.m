@interface PXCuratedLibrarySummaryHelper
- (BOOL)_needsUpdate;
- (BOOL)browserSummaryControllerShouldUpdateImmediately:(id)a3;
- (BOOL)shouldUseAbbreviatedDates;
- (PXBrowserSummaryController)summaryController;
- (PXCuratedLibrarySummaryHelper)init;
- (PXDisplayAssetCollection)topMostAssetCollection;
- (PXLibrarySummaryDataSource)dataSource;
- (PXLibrarySummaryOutputPresenter)outputPresenter;
- (id)visibleContentSnapshotForBrowserSummaryController:(id)a3;
- (void)_invalidateSubtitle;
- (void)_invalidateTitle;
- (void)_invalidateTopMostAssetCollection;
- (void)_performChanges:(id)a3;
- (void)_setNeedsUpdate;
- (void)_setTopMostAssetCollection:(id)a3;
- (void)_updateIfNeeded;
- (void)_updateSubtitle;
- (void)_updateSubtitleFromSummaryController;
- (void)_updateTitle;
- (void)_updateTitleFromSummaryController;
- (void)_updateTopMostAssetCollection;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setDataSource:(id)a3;
- (void)setOutputPresenter:(id)a3;
- (void)setShouldUseAbbreviatedDates:(BOOL)a3;
- (void)visibleContentDidChange;
@end

@implementation PXCuratedLibrarySummaryHelper

- (BOOL)browserSummaryControllerShouldUpdateImmediately:(id)a3
{
  if (!self->_dataSourceRespondsTo.shouldUpdateImmediately) {
    return 0;
  }
  v3 = self;
  v4 = [(PXCuratedLibrarySummaryHelper *)self dataSource];
  LOBYTE(v3) = [v4 curatedLibrarySummaryHelperShouldUpdateImmediately:v3];

  return (char)v3;
}

- (PXLibrarySummaryDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (PXLibrarySummaryDataSource *)WeakRetained;
}

- (id)visibleContentSnapshotForBrowserSummaryController:(id)a3
{
  if (self->_dataSourceRespondsTo.visibleContentSnapshot)
  {
    v3 = [(PXCuratedLibrarySummaryHelper *)self dataSource];
    v4 = [v3 visibleContentSnapshot];
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

uint64_t __56__PXCuratedLibrarySummaryHelper_visibleContentDidChange__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 invalidateVisibleContent];
}

uint64_t __47__PXCuratedLibrarySummaryHelper_setDataSource___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 invalidateVisibleContent];
}

uint64_t __62__PXCuratedLibrarySummaryHelper_setShouldUseAbbreviatedDates___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setShouldUseAbbreviatedDates:*(unsigned __int8 *)(a1 + 32)];
}

- (void)setDataSource:(id)a3
{
  id v4 = a3;
  id v5 = objc_loadWeakRetained((id *)&self->_dataSource);
  if (v5 == v4)
  {
  }
  else
  {
    v6 = v5;
    char v7 = [v5 isEqual:v4];

    if ((v7 & 1) == 0)
    {
      objc_storeWeak((id *)&self->_dataSource, v4);
      self->_dataSourceRespondsTo.visibleContentSnapshot = objc_opt_respondsToSelector() & 1;
      self->_dataSourceRespondsTo.topMostAssetCollection = objc_opt_respondsToSelector() & 1;
      self->_dataSourceRespondsTo.shouldUpdateImmediately = objc_opt_respondsToSelector() & 1;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __47__PXCuratedLibrarySummaryHelper_setDataSource___block_invoke;
      v9[3] = &unk_1E5DD36F8;
      v9[4] = self;
      [(PXCuratedLibrarySummaryHelper *)self _performChanges:v9];
      v8 = [(PXCuratedLibrarySummaryHelper *)self summaryController];
      [v8 performChanges:&__block_literal_global_129669];
    }
  }
}

- (void)setShouldUseAbbreviatedDates:(BOOL)a3
{
  if (self->_shouldUseAbbreviatedDates != a3)
  {
    self->_shouldUseAbbreviatedDates = a3;
    summaryController = self->_summaryController;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __62__PXCuratedLibrarySummaryHelper_setShouldUseAbbreviatedDates___block_invoke;
    v4[3] = &__block_descriptor_33_e45_v16__0___PXMutableBrowserSummaryController__8l;
    BOOL v5 = a3;
    [(PXBrowserSummaryController *)summaryController performChanges:v4];
  }
}

- (void)setOutputPresenter:(id)a3
{
  id v4 = a3;
  id v5 = objc_loadWeakRetained((id *)&self->_outputPresenter);
  if (v5 == v4)
  {
  }
  else
  {
    v6 = v5;
    char v7 = [v5 isEqual:v4];

    if ((v7 & 1) == 0)
    {
      objc_storeWeak((id *)&self->_outputPresenter, v4);
      self->_outputPresenterRespondsTo.setTitle = objc_opt_respondsToSelector() & 1;
      self->_outputPresenterRespondsTo.setSubtitle = objc_opt_respondsToSelector() & 1;
      self->_outputPresenterRespondsTo.setAttributedTitle = objc_opt_respondsToSelector() & 1;
      self->_outputPresenterRespondsTo.defaultAttributes = objc_opt_respondsToSelector() & 1;
      self->_outputPresenterRespondsTo.emphasizedAttributes = objc_opt_respondsToSelector() & 1;
      if (objc_opt_respondsToSelector()) {
        char v8 = [v4 wantsLocationNames];
      }
      else {
        char v8 = 1;
      }
      v9 = [(PXCuratedLibrarySummaryHelper *)self summaryController];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __52__PXCuratedLibrarySummaryHelper_setOutputPresenter___block_invoke;
      v11[3] = &unk_1E5DBD328;
      v11[4] = self;
      id v12 = v4;
      char v13 = v8;
      [v9 performChanges:v11];

      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __52__PXCuratedLibrarySummaryHelper_setOutputPresenter___block_invoke_2;
      v10[3] = &unk_1E5DD36F8;
      v10[4] = self;
      [(PXCuratedLibrarySummaryHelper *)self _performChanges:v10];
    }
  }
}

- (PXCuratedLibrarySummaryHelper)init
{
  v6.receiver = self;
  v6.super_class = (Class)PXCuratedLibrarySummaryHelper;
  v2 = [(PXCuratedLibrarySummaryHelper *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(PXBrowserSummaryController);
    summaryController = v2->_summaryController;
    v2->_summaryController = v3;

    [(PXBrowserSummaryController *)v2->_summaryController setDataSource:v2];
    [(PXBrowserSummaryController *)v2->_summaryController registerChangeObserver:v2 context:PXSummaryControllerObservationContext];
  }
  return v2;
}

uint64_t __52__PXCuratedLibrarySummaryHelper_setOutputPresenter___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _invalidateTopMostAssetCollection];
  [*(id *)(a1 + 32) _invalidateTitle];
  v2 = *(void **)(a1 + 32);
  return [v2 _invalidateSubtitle];
}

- (void)_updateTitleFromSummaryController
{
  if (self->_outputPresenterRespondsTo.setAttributedTitle)
  {
    id v6 = [(PXCuratedLibrarySummaryHelper *)self summaryController];
    v3 = [v6 attributedPrimaryTitle];
    id v4 = [(PXCuratedLibrarySummaryHelper *)self outputPresenter];
    [v4 setAttributedTitle:v3];
  }
  else
  {
    if (!self->_outputPresenterRespondsTo.setTitle) {
      return;
    }
    id v6 = [(PXCuratedLibrarySummaryHelper *)self summaryController];
    v3 = [v6 attributedPrimaryTitle];
    id v4 = [v3 string];
    id v5 = [(PXCuratedLibrarySummaryHelper *)self outputPresenter];
    [v5 setTitle:v4];
  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v9 = a3;
  if ((void *)PXSummaryControllerObservationContext != a5)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"PXCuratedLibrarySummaryHelper.m" lineNumber:269 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  v10 = v9;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __62__PXCuratedLibrarySummaryHelper_observable_didChange_context___block_invoke;
  v12[3] = &unk_1E5DD08D8;
  v12[4] = self;
  v12[5] = a4;
  [(PXCuratedLibrarySummaryHelper *)self _performChanges:v12];
}

- (void)visibleContentDidChange
{
  v3 = [(PXCuratedLibrarySummaryHelper *)self dataSource];

  if (v3)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __56__PXCuratedLibrarySummaryHelper_visibleContentDidChange__block_invoke;
    v5[3] = &unk_1E5DD36F8;
    v5[4] = self;
    [(PXCuratedLibrarySummaryHelper *)self _performChanges:v5];
    id v4 = [(PXCuratedLibrarySummaryHelper *)self summaryController];
    [v4 performChanges:&__block_literal_global_21_129662];
  }
}

- (void)_updateIfNeeded
{
  if ([(PXCuratedLibrarySummaryHelper *)self _needsUpdate])
  {
    BOOL isPerformingUpdates = self->_isPerformingUpdates;
    self->_BOOL isPerformingUpdates = 1;
    [(PXCuratedLibrarySummaryHelper *)self _updateTopMostAssetCollection];
    [(PXCuratedLibrarySummaryHelper *)self _updateTitle];
    [(PXCuratedLibrarySummaryHelper *)self _updateSubtitle];
    self->_BOOL isPerformingUpdates = isPerformingUpdates;
  }
}

- (BOOL)_needsUpdate
{
  return self->_needsUpdateFlags.title
      || self->_needsUpdateFlags.subtitle
      || self->_needsUpdateFlags.topMostAssetCollection;
}

- (void)_updateTopMostAssetCollection
{
  if (self->_needsUpdateFlags.topMostAssetCollection)
  {
    self->_needsUpdateFlags.topMostAssetCollection = 0;
    if (self->_dataSourceRespondsTo.topMostAssetCollection)
    {
      id v4 = [(PXCuratedLibrarySummaryHelper *)self dataSource];
      v3 = [v4 topMostAssetCollection];
      [(PXCuratedLibrarySummaryHelper *)self _setTopMostAssetCollection:v3];
    }
  }
}

- (void)_updateTitle
{
  if (!self->_needsUpdateFlags.title) {
    return;
  }
  self->_needsUpdateFlags.title = 0;
  if (self->_dataSourceRespondsTo.topMostAssetCollection)
  {
    v3 = [(PXCuratedLibrarySummaryHelper *)self topMostAssetCollection];
    if (v3)
    {
      if (!self->_outputPresenterRespondsTo.setTitle)
      {
LABEL_12:

        return;
      }
      id v6 = v3;
      id v4 = [v3 localizedTitle];
      id v5 = [(PXCuratedLibrarySummaryHelper *)self outputPresenter];
      [v5 setTitle:v4];
    }
    else
    {
      id v6 = 0;
      [(PXCuratedLibrarySummaryHelper *)self _updateTitleFromSummaryController];
    }
    v3 = v6;
    goto LABEL_12;
  }
  [(PXCuratedLibrarySummaryHelper *)self _updateTitleFromSummaryController];
}

- (void)_updateSubtitle
{
  if (!self->_needsUpdateFlags.subtitle) {
    return;
  }
  self->_needsUpdateFlags.subtitle = 0;
  if (self->_dataSourceRespondsTo.topMostAssetCollection)
  {
    v3 = [(PXCuratedLibrarySummaryHelper *)self topMostAssetCollection];
    if (v3)
    {
      if (!self->_outputPresenterRespondsTo.setSubtitle)
      {
LABEL_12:

        return;
      }
      id v6 = v3;
      id v4 = [v3 localizedSubtitle];
      id v5 = [(PXCuratedLibrarySummaryHelper *)self outputPresenter];
      [v5 setSubtitle:v4];
    }
    else
    {
      id v6 = 0;
      [(PXCuratedLibrarySummaryHelper *)self _updateSubtitleFromSummaryController];
    }
    v3 = v6;
    goto LABEL_12;
  }
  [(PXCuratedLibrarySummaryHelper *)self _updateSubtitleFromSummaryController];
}

- (void)_performChanges:(id)a3
{
  BOOL isPerformingChanges = self->_isPerformingChanges;
  self->_BOOL isPerformingChanges = 1;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  self->_BOOL isPerformingChanges = isPerformingChanges;
  if (!isPerformingChanges && !self->_isPerformingUpdates)
  {
    [(PXCuratedLibrarySummaryHelper *)self _updateIfNeeded];
  }
}

- (void)_setNeedsUpdate
{
  if (!self->_isPerformingChanges && !self->_isPerformingUpdates)
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"PXCuratedLibrarySummaryHelper.m" lineNumber:155 description:@"not inside -performChanges: or _updateIfNeeded"];
  }
}

- (PXBrowserSummaryController)summaryController
{
  return self->_summaryController;
}

- (void)_invalidateTopMostAssetCollection
{
  self->_needsUpdateFlags.topMostAssetCollection = 1;
  [(PXCuratedLibrarySummaryHelper *)self _setNeedsUpdate];
}

uint64_t __56__PXCuratedLibrarySummaryHelper_visibleContentDidChange__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateTopMostAssetCollection];
}

uint64_t __62__PXCuratedLibrarySummaryHelper_observable_didChange_context___block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v2 = *(void *)(result + 40);
  if (v2)
  {
    result = [*(id *)(result + 32) _invalidateTitle];
    uint64_t v2 = *(void *)(v1 + 40);
  }
  if ((v2 & 2) != 0)
  {
    v3 = *(void **)(v1 + 32);
    return [v3 _invalidateSubtitle];
  }
  return result;
}

- (PXLibrarySummaryOutputPresenter)outputPresenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_outputPresenter);
  return (PXLibrarySummaryOutputPresenter *)WeakRetained;
}

- (void)_updateSubtitleFromSummaryController
{
  if (self->_outputPresenterRespondsTo.setSubtitle)
  {
    id v5 = [(PXCuratedLibrarySummaryHelper *)self summaryController];
    v3 = [v5 secondaryTitle];
    id v4 = [(PXCuratedLibrarySummaryHelper *)self outputPresenter];
    [v4 setSubtitle:v3];
  }
}

- (void)_invalidateSubtitle
{
  self->_needsUpdateFlags.subtitle = 1;
  [(PXCuratedLibrarySummaryHelper *)self _setNeedsUpdate];
}

- (void)_invalidateTitle
{
  self->_needsUpdateFlags.title = 1;
  [(PXCuratedLibrarySummaryHelper *)self _setNeedsUpdate];
}

uint64_t __47__PXCuratedLibrarySummaryHelper_setDataSource___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _invalidateTopMostAssetCollection];
  [*(id *)(a1 + 32) _invalidateTitle];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 _invalidateSubtitle];
}

void __52__PXCuratedLibrarySummaryHelper_setOutputPresenter___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = v3;
  if (*(unsigned char *)(*(void *)(a1 + 32) + 19))
  {
    id v4 = [*(id *)(a1 + 40) defaultAttributes];
    [v6 setDefaultAttributes:v4];
  }
  else
  {
    [v3 setDefaultAttributes:0];
  }
  if (*(unsigned char *)(*(void *)(a1 + 32) + 20))
  {
    id v5 = [*(id *)(a1 + 40) emphasizedAttributes];
    [v6 setEmphasizedAttributes:v5];
  }
  else
  {
    [v6 setEmphasizedAttributes:0];
  }
  [v6 setShouldShowLocationNames:*(unsigned __int8 *)(a1 + 48)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topMostAssetCollection, 0);
  objc_storeStrong((id *)&self->_summaryController, 0);
  objc_destroyWeak((id *)&self->_outputPresenter);
  objc_destroyWeak((id *)&self->_dataSource);
}

- (PXDisplayAssetCollection)topMostAssetCollection
{
  return self->_topMostAssetCollection;
}

- (BOOL)shouldUseAbbreviatedDates
{
  return self->_shouldUseAbbreviatedDates;
}

- (void)_setTopMostAssetCollection:(id)a3
{
  id v5 = (PXDisplayAssetCollection *)a3;
  if (self->_topMostAssetCollection != v5)
  {
    objc_storeStrong((id *)&self->_topMostAssetCollection, a3);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __60__PXCuratedLibrarySummaryHelper__setTopMostAssetCollection___block_invoke;
    v6[3] = &unk_1E5DD36F8;
    v6[4] = self;
    [(PXCuratedLibrarySummaryHelper *)self _performChanges:v6];
  }
}

uint64_t __60__PXCuratedLibrarySummaryHelper__setTopMostAssetCollection___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _invalidateTitle];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 _invalidateSubtitle];
}

@end