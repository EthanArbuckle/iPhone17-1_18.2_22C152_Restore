@interface PXStoryStyleManager
- ($1A23BB056C565A410801C90FE7234890)styleOptions;
- (BOOL)areSelectionDataSourceStylesFinal;
- (BOOL)areStylesFinal;
- (BOOL)focusedStyleIsCurrentStyle;
- (BOOL)isCurrentStyleFinal;
- (NSArray)predefinedStyleInfos;
- (OS_dispatch_queue)storyQueue;
- (PXAudioCueProvider)cueProvider;
- (PXAudioCueSource)cueSource;
- (PXStoryColorGradingRepository)colorGradingRepository;
- (PXStoryErrorReporter)errorReporter;
- (PXStoryRecipeManager)recipeManager;
- (PXStoryStyle)currentStyle;
- (PXStoryStyleConfiguration)currentStyleInfo;
- (PXStoryStyleConfigurationList)styleConfigurationList;
- (PXStoryStyleManager)init;
- (PXStoryStyleManager)initWithRecipeManager:(id)a3 errorReporter:(id)a4;
- (PXStoryStyleProducer)styleProducer;
- (PXStoryStyleSelectionDataSource)selectionDataSource;
- (PXUpdater)updater;
- (double)selectionFocus;
- (int64_t)cueRequestID;
- (int64_t)focusedStyleIndex;
- (unint64_t)changesOrigin;
- (unint64_t)currentStyleAttributes;
- (unint64_t)selectionDataSourceStylesAttributes;
- (unint64_t)stylesAttributes;
- (void)_handleCueSource:(id)a3 error:(id)a4 requestID:(int64_t)a5;
- (void)_invalidateCueSource;
- (void)_invalidateCurrentStyle;
- (void)_invalidateCurrentStyleAttributes;
- (void)_invalidateCurrentStyleInfo;
- (void)_invalidatePredefinedStyleInfos;
- (void)_invalidateSelectionDataSource;
- (void)_invalidateSelectionDataSourceAttributes;
- (void)_invalidateStyleConfigurationList;
- (void)_invalidateStylesAttributes;
- (void)_setNeedsUpdate;
- (void)_updateCueSource;
- (void)_updateCurrentStyle;
- (void)_updateCurrentStyleAttributes;
- (void)_updateCurrentStyleInfo;
- (void)_updatePredefinedStyleInfos;
- (void)_updateSelectionDataSource;
- (void)_updateSelectionDataSourceStylesAttributes;
- (void)_updateStyleConfigurationList;
- (void)_updateStylesAttributes;
- (void)applyFocusedStyle;
- (void)applyFocusedStyleWithCustomizedColorGradeKind:(int64_t)a3;
- (void)applyFocusedStyleWithCustomizedSongResource:(id)a3;
- (void)applyStyleAtIndex:(int64_t)a3 fromDataSource:(id)a4;
- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3;
- (void)didEndChangeHandling;
- (void)didPerformChanges;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)performChanges:(id)a3;
- (void)performChanges:(id)a3 origin:(unint64_t)a4;
- (void)setAreSelectionDataSourceStylesFinal:(BOOL)a3;
- (void)setAreStylesFinal:(BOOL)a3;
- (void)setCueProvider:(id)a3;
- (void)setCueRequestID:(int64_t)a3;
- (void)setCueSource:(id)a3;
- (void)setCurrentStyle:(id)a3;
- (void)setCurrentStyleAttributes:(unint64_t)a3;
- (void)setCurrentStyleInfo:(id)a3;
- (void)setIsCurrentStyleFinal:(BOOL)a3;
- (void)setPredefinedStyleInfos:(id)a3;
- (void)setSelectionDataSource:(id)a3;
- (void)setSelectionDataSourceStylesAttributes:(unint64_t)a3;
- (void)setSelectionFocus:(double)a3;
- (void)setStyleConfigurationList:(id)a3;
- (void)setStylesAttributes:(unint64_t)a3;
@end

@implementation PXStoryStyleManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cueProvider, 0);
  objc_storeStrong((id *)&self->_predefinedStyleInfos, 0);
  objc_storeStrong((id *)&self->_currentStyleInfo, 0);
  objc_storeStrong((id *)&self->_cueSource, 0);
  objc_storeStrong((id *)&self->_styleConfigurationList, 0);
  objc_storeStrong((id *)&self->_styleProducer, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_errorReporter, 0);
  objc_storeStrong((id *)&self->_selectionDataSource, 0);
  objc_storeStrong((id *)&self->_currentStyle, 0);
  objc_storeStrong((id *)&self->_colorGradingRepository, 0);
  objc_storeStrong((id *)&self->_recipeManager, 0);
  objc_storeStrong((id *)&self->_storyQueue, 0);
}

- (void)setCueProvider:(id)a3
{
}

- (PXAudioCueProvider)cueProvider
{
  return self->_cueProvider;
}

- (NSArray)predefinedStyleInfos
{
  return self->_predefinedStyleInfos;
}

- (PXStoryStyleConfiguration)currentStyleInfo
{
  return self->_currentStyleInfo;
}

- (void)setCueRequestID:(int64_t)a3
{
  self->_cueRequestID = a3;
}

- (int64_t)cueRequestID
{
  return self->_cueRequestID;
}

- (PXAudioCueSource)cueSource
{
  return self->_cueSource;
}

- (BOOL)areStylesFinal
{
  return self->_areStylesFinal;
}

- (unint64_t)stylesAttributes
{
  return self->_stylesAttributes;
}

- (PXStoryStyleConfigurationList)styleConfigurationList
{
  return self->_styleConfigurationList;
}

- ($1A23BB056C565A410801C90FE7234890)styleOptions
{
  p_styleOptions = &self->_styleOptions;
  unint64_t croppingOptions = self->_styleOptions.croppingOptions;
  uint64_t v4 = *(void *)&p_styleOptions->preferStillKeySegment;
  result.var1 = v4;
  result.var0 = croppingOptions;
  return result;
}

- (PXStoryStyleProducer)styleProducer
{
  return self->_styleProducer;
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (PXStoryErrorReporter)errorReporter
{
  return self->_errorReporter;
}

- (double)selectionFocus
{
  return self->_selectionFocus;
}

- (BOOL)areSelectionDataSourceStylesFinal
{
  return self->_areSelectionDataSourceStylesFinal;
}

- (unint64_t)selectionDataSourceStylesAttributes
{
  return self->_selectionDataSourceStylesAttributes;
}

- (PXStoryStyleSelectionDataSource)selectionDataSource
{
  return self->_selectionDataSource;
}

- (BOOL)isCurrentStyleFinal
{
  return self->_isCurrentStyleFinal;
}

- (unint64_t)currentStyleAttributes
{
  return self->_currentStyleAttributes;
}

- (PXStoryStyle)currentStyle
{
  return self->_currentStyle;
}

- (PXStoryColorGradingRepository)colorGradingRepository
{
  return self->_colorGradingRepository;
}

- (PXStoryRecipeManager)recipeManager
{
  return self->_recipeManager;
}

- (unint64_t)changesOrigin
{
  return self->_changesOrigin;
}

- (OS_dispatch_queue)storyQueue
{
  return self->_storyQueue;
}

- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3
{
  id v4 = a3;
  id v5 = [(PXStoryStyleManager *)self recipeManager];
  [v4 addSubprovider:v5];
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__PXStoryStyleManager_observable_didChange_context___block_invoke;
  v5[3] = &unk_1E5DCCD20;
  v5[4] = self;
  v5[5] = a5;
  v5[6] = a4;
  v5[7] = a2;
  [(PXStoryStyleManager *)self performChanges:v5 origin:1];
}

void __52__PXStoryStyleManager_observable_didChange_context___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 40) != RecipeManagerObservationContext_166233)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:*(void *)(a1 + 56) object:*(void *)(a1 + 32) file:@"PXStoryStyleManager.m" lineNumber:562 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = v3;
  if (v4)
  {
    [*(id *)(a1 + 32) _invalidateCurrentStyleInfo];
    [*(id *)(a1 + 32) _invalidateStyleConfigurationList];
    id v3 = v6;
    uint64_t v4 = *(void *)(a1 + 48);
  }
  if ((v4 & 4) != 0)
  {
    [*(id *)(a1 + 32) _invalidateStylesAttributes];
    [*(id *)(a1 + 32) _invalidateCurrentStyleAttributes];
    id v3 = v6;
  }
}

- (void)_updateSelectionDataSourceStylesAttributes
{
  id v3 = [(PXStoryStyleManager *)self recipeManager];
  int v4 = [v3 isRecipeFinal];

  if (v4) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 0;
  }
  [(PXStoryStyleManager *)self setSelectionDataSourceStylesAttributes:v5];
}

- (void)_invalidateSelectionDataSourceAttributes
{
  id v2 = [(PXStoryStyleManager *)self updater];
  [v2 setNeedsUpdateOf:sel__updateSelectionDataSourceStylesAttributes];
}

- (void)_updateSelectionDataSource
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(PXStoryStyleManager *)self predefinedStyleInfos];
  int v4 = [(PXStoryStyleManager *)self recipeManager];
  uint64_t v5 = [v4 configuration];

  if (([v5 options] & 0x10) != 0)
  {
    v17 = [v5 songsConfiguration];
    v7 = [v17 currentAsset];

    uint64_t v18 = 0;
    if (v7 && v3)
    {
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __49__PXStoryStyleManager__updateSelectionDataSource__block_invoke;
      v26[3] = &unk_1E5DC15C0;
      id v27 = v7;
      uint64_t v19 = [v3 indexOfObjectPassingTest:v26];
      if (v19 == 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v18 = 0;
      }
      else {
        uint64_t v18 = v19;
      }
    }
    v13 = [PXStoryStyleSelectionDataSource alloc];
    v14 = v3;
    uint64_t v15 = v18;
    uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    id v6 = [(PXStoryStyleManager *)self currentStyleInfo];
    v7 = v6;
    uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
    if (v6 && v3)
    {
      uint64_t v21 = MEMORY[0x1E4F143A8];
      uint64_t v22 = 3221225472;
      v23 = __49__PXStoryStyleManager__updateSelectionDataSource__block_invoke_2;
      v24 = &unk_1E5DC15C0;
      id v25 = v6;
      uint64_t v9 = [v3 indexOfObjectPassingTest:&v21];
    }
    if (v9 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v10 = 0;
    }
    else {
      uint64_t v10 = v9;
    }
    if (v7 && v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v28[0] = v7;
      v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
      uint64_t v12 = [v11 arrayByAddingObjectsFromArray:v3];

      uint64_t v10 = 0;
      uint64_t v8 = 0;
      id v3 = (void *)v12;
    }
    v13 = [PXStoryStyleSelectionDataSource alloc];
    v14 = v3;
    uint64_t v15 = v10;
    uint64_t v16 = v8;
  }
  v20 = -[PXStoryStyleSelectionDataSource initWithStyleInfos:indexOfCurrentStyle:indexOfCustomStyle:](v13, "initWithStyleInfos:indexOfCurrentStyle:indexOfCustomStyle:", v14, v15, v16, v21, v22, v23, v24);

  [(PXStoryStyleManager *)self setSelectionDataSource:v20];
}

uint64_t __49__PXStoryStyleManager__updateSelectionDataSource__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 songResource];
  int v4 = v3;
  if (v3 == *(void **)(a1 + 32)) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = objc_msgSend(v3, "isEqual:");
  }

  return v5;
}

uint64_t __49__PXStoryStyleManager__updateSelectionDataSource__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 originalColorGradeCategory];
  id v5 = [*(id *)(a1 + 32) originalColorGradeCategory];
  if (v4 == v5)
  {
  }
  else
  {
    int v6 = [v4 isEqualToString:v5];

    if (!v6) {
      goto LABEL_8;
    }
  }
  uint64_t v7 = [v3 customColorGradeKind];
  if (v7 != [*(id *)(a1 + 32) customColorGradeKind])
  {
LABEL_8:
    uint64_t v10 = 0;
    goto LABEL_11;
  }
  uint64_t v8 = [v3 songResource];
  uint64_t v9 = [*(id *)(a1 + 32) songResource];
  if (v8 == v9) {
    uint64_t v10 = 1;
  }
  else {
    uint64_t v10 = [v8 isEqual:v9];
  }

LABEL_11:
  return v10;
}

- (void)_invalidateSelectionDataSource
{
  id v2 = [(PXStoryStyleManager *)self updater];
  [v2 setNeedsUpdateOf:sel__updateSelectionDataSource];
}

- (void)_updateCurrentStyleAttributes
{
  id v3 = [(PXStoryStyleManager *)self recipeManager];
  char v4 = [v3 recipeAttributes];

  uint64_t v5 = v4 & 1;
  if ((v4 & 3) != 0)
  {
    int v6 = [(PXStoryStyleManager *)self cueSource];

    if (v6) {
      v5 |= 2uLL;
    }
  }
  [(PXStoryStyleManager *)self setCurrentStyleAttributes:v5];
}

- (void)_invalidateCurrentStyleAttributes
{
  id v2 = [(PXStoryStyleManager *)self updater];
  [v2 setNeedsUpdateOf:sel__updateCurrentStyleAttributes];
}

- (void)_updateCurrentStyle
{
  id v14 = [(PXStoryStyleManager *)self currentStyleInfo];
  id v3 = [(PXStoryStyleManager *)self styleProducer];
  uint64_t v4 = [v14 customColorGradeKind];
  uint64_t v5 = [v14 originalColorGradeCategory];
  int v6 = [v14 songResource];
  uint64_t v7 = [(PXStoryStyleManager *)self cueSource];
  uint64_t v8 = [v14 autoEditDecisionList];
  uint64_t v9 = [(PXStoryStyleManager *)self styleOptions];
  uint64_t v11 = v10;
  LOBYTE(v13) = [v14 isCustomized];
  uint64_t v12 = objc_msgSend(v3, "styleWithCustomColorGradeKind:originalColorGradeCategory:songResource:cueSource:autoEditDecisionList:styleOptions:isCustomized:", v4, v5, v6, v7, v8, v9, v11, v13);
  [(PXStoryStyleManager *)self setCurrentStyle:v12];
}

- (void)_updateCurrentStyleInfo
{
  id v23 = [(PXStoryStyleManager *)self currentStyleInfo];
  id v3 = [(PXStoryStyleManager *)self styleConfigurationList];
  if (v3)
  {
    uint64_t v4 = [v23 songResource];
    uint64_t v5 = v4;
    if (v4 && !PXStorySongResourceIsNullResource(v4))
    {
      uint64_t v7 = objc_msgSend(v5, "px_storyResourceSongAsset");
      if (!v7) {
        goto LABEL_12;
      }
      uint64_t v19 = [(PXStoryStyleManager *)self recipeManager];
      v20 = [v19 recipe];
      uint64_t v21 = [v20 autoEditDecisionListsBySong];
      uint64_t v16 = [v21 objectForKeyedSubscript:v7];

      if (!v16) {
        goto LABEL_12;
      }
      uint64_t v17 = [v23 copyWithAutoEditDecisionList:v16];
      uint64_t v18 = v23;
    }
    else
    {
      int v6 = [v3 initialStyleConfiguration];
      uint64_t v7 = v6;
      if (!v6)
      {
LABEL_12:

        goto LABEL_13;
      }
      uint64_t v22 = [v6 songResource];
      uint64_t v8 = [v7 originalColorGradeCategory];
      uint64_t v9 = [v7 autoEditDecisionList];
      uint64_t v10 = [v7 customColorGradeKind];
      uint64_t v11 = [v7 isCustomized];
      if (!v10)
      {
        uint64_t v12 = [(PXStoryStyleManager *)self colorGradingRepository];
        uint64_t v10 = [v12 colorGradeKindForColorGradeCategory:v8];
      }
      uint64_t v13 = [PXStoryStyleConfiguration alloc];
      id v14 = [v7 originalColorGradeCategory];
      uint64_t v15 = v10;
      uint64_t v16 = (void *)v22;
      uint64_t v17 = [(PXStoryStyleConfiguration *)v13 initWithOriginalColorGradeCategory:v14 customColorGradeKind:v15 songResource:v22 autoEditDecisionList:v9 isCustomized:v11];

      uint64_t v18 = (void *)v8;
    }

    id v23 = (id)v17;
    goto LABEL_12;
  }
LABEL_13:
  [(PXStoryStyleManager *)self setCurrentStyleInfo:v23];
}

- (void)_invalidateCurrentStyleInfo
{
  id v2 = [(PXStoryStyleManager *)self updater];
  [v2 setNeedsUpdateOf:sel__updateCurrentStyleInfo];
}

- (void)_handleCueSource:(id)a3 error:(id)a4 requestID:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(PXStoryStyleManager *)self storyQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __56__PXStoryStyleManager__handleCueSource_error_requestID___block_invoke;
  v13[3] = &unk_1E5DD1508;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a5;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

void __56__PXStoryStyleManager__handleCueSource_error_requestID___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 56);
  if (v2 == [*(id *)(a1 + 32) cueRequestID])
  {
    if (*(void *)(a1 + 40))
    {
      id v3 = *(void **)(a1 + 32);
      objc_msgSend(v3, "setCueSource:");
    }
    else
    {
      uint64_t v4 = objc_alloc_init(PXConcreteAudioCueSource);
      [*(id *)(a1 + 32) setCueSource:v4];

      uint64_t v5 = PLStoryGetLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        uint64_t v6 = *(void *)(a1 + 48);
        int v7 = 138412290;
        uint64_t v8 = v6;
        _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_ERROR, "Did not find audio cues for current style. Cues may not be available for the current song. Error %@", (uint8_t *)&v7, 0xCu);
      }
    }
  }
}

- (void)_updateCueSource
{
  id v3 = [(PXStoryStyleManager *)self currentStyleInfo];
  uint64_t v4 = [v3 songResource];
  if ((PXStorySongResourceIsNullResource(v4) & 1) != 0
    || ([(PXStoryStyleManager *)self recipeManager],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        [v5 configuration],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = [v6 options],
        v6,
        v5,
        (v7 & 2) != 0))
  {
    uint64_t v8 = objc_alloc_init(PXConcreteAudioCueSource);
    [(PXStoryStyleManager *)self setCueSource:v8];
  }
  else
  {
    objc_msgSend(v4, "px_storyResourceSongAsset");
    uint64_t v8 = (PXConcreteAudioCueSource *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      [(PXStoryStyleManager *)self setCueRequestID:[(PXStoryStyleManager *)self cueRequestID] + 1];
      uint64_t v9 = [(PXStoryStyleManager *)self cueRequestID];
      objc_initWeak(&location, self);
      uint64_t v10 = [(PXStoryStyleManager *)self cueProvider];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __39__PXStoryStyleManager__updateCueSource__block_invoke;
      v12[3] = &unk_1E5DC1598;
      objc_copyWeak(v13, &location);
      v13[1] = v9;
      id v11 = (id)[v10 requestCuesForAudioAsset:v8 resultHandler:v12];

      objc_destroyWeak(v13);
      objc_destroyWeak(&location);
    }
  }
}

void __39__PXStoryStyleManager__updateCueSource__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  char v7 = +[PXStorySettings sharedInstance];
  [v7 simulatedAudioCuesLoadingDelay];
  double v9 = v8;

  if (v9 == 0.0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained _handleCueSource:v5 error:v6 requestID:*(void *)(a1 + 40)];
  }
  else
  {
    dispatch_time_t v11 = dispatch_time(0, (uint64_t)(v9 * 1000000000.0));
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __39__PXStoryStyleManager__updateCueSource__block_invoke_2;
    v14[3] = &unk_1E5DC8380;
    objc_copyWeak(v17, (id *)(a1 + 32));
    id v15 = v5;
    id v12 = v6;
    uint64_t v13 = *(void **)(a1 + 40);
    id v16 = v12;
    v17[1] = v13;
    dispatch_after(v11, MEMORY[0x1E4F14428], v14);

    objc_destroyWeak(v17);
  }
}

void __39__PXStoryStyleManager__updateCueSource__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _handleCueSource:*(void *)(a1 + 32) error:*(void *)(a1 + 40) requestID:*(void *)(a1 + 56)];
}

- (void)_invalidateCueSource
{
  id v2 = [(PXStoryStyleManager *)self updater];
  [v2 setNeedsUpdateOf:sel__updateCueSource];
}

- (void)_invalidateCurrentStyle
{
  id v2 = [(PXStoryStyleManager *)self updater];
  [v2 setNeedsUpdateOf:sel__updateCurrentStyle];
}

- (void)_updateStylesAttributes
{
  id v3 = [(PXStoryStyleManager *)self recipeManager];
  -[PXStoryStyleManager setStylesAttributes:](self, "setStylesAttributes:", [v3 recipeAttributes]);
}

- (void)_invalidateStylesAttributes
{
  id v2 = [(PXStoryStyleManager *)self updater];
  [v2 setNeedsUpdateOf:sel__updateStylesAttributes];
}

- (void)_updatePredefinedStyleInfos
{
  uint64_t v4 = [(PXStoryStyleManager *)self styleConfigurationList];
  id v5 = [v4 autoEditStyleConfigurations];
  id v6 = [(PXStoryStyleManager *)self recipeManager];
  char v7 = [v6 configuration];

  BOOL v8 = ([v7 options] & 0x10) == 0;
  if ([v5 count])
  {
    double v9 = [(PXStoryStyleManager *)self colorGradingRepository];
    uint64_t v10 = [(PXStoryStyleManager *)self currentStyleInfo];
    uint64_t v11 = [v10 customColorGradeKind];
    if (!v11)
    {
      id v12 = [v10 originalColorGradeCategory];
      uint64_t v11 = [v9 colorGradeKindForColorGradeCategory:v12 excludingKinds:0];
    }
    uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F28E60]) initWithIndex:v11];
    id v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    uint64_t v21 = __50__PXStoryStyleManager__updatePredefinedStyleInfos__block_invoke;
    uint64_t v22 = &unk_1E5DC1570;
    BOOL v28 = v8;
    id v26 = v14;
    SEL v27 = a2;
    id v23 = self;
    id v24 = v9;
    id v25 = v13;
    id v15 = v14;
    id v16 = v13;
    id v17 = v9;
    [v5 enumerateObjectsUsingBlock:&v19];
    uint64_t v18 = objc_msgSend(v15, "copy", v19, v20, v21, v22, v23);
  }
  else
  {
    uint64_t v18 = 0;
  }
  [(PXStoryStyleManager *)self setPredefinedStyleInfos:v18];
}

void __50__PXStoryStyleManager__updatePredefinedStyleInfos__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  id v6 = [v5 songResource];
  if (!*(unsigned char *)(a1 + 72)) {
    goto LABEL_4;
  }
  char v7 = [*(id *)(a1 + 32) currentStyleInfo];
  id v8 = [v7 songResource];
  if (v6 == v8)
  {

LABEL_10:
    goto LABEL_11;
  }
  double v9 = v8;
  char v10 = [v6 isEqual:v8];

  if ((v10 & 1) == 0)
  {
LABEL_4:
    char v7 = [v5 originalColorGradeCategory];
    uint64_t v11 = [v5 autoEditDecisionList];
    if ([v5 customColorGradeKind]) {
      PXAssertGetLog();
    }
    uint64_t v12 = [*(id *)(a1 + 40) colorGradeKindForColorGradeCategory:v7 excludingKinds:*(void *)(a1 + 48)];
    uint64_t v13 = [[PXStoryStyleConfiguration alloc] initWithOriginalColorGradeCategory:v7 customColorGradeKind:v12 songResource:v6 autoEditDecisionList:v11 isCustomized:0];
    unint64_t v14 = [*(id *)(a1 + 40) minimumCategoryKindFallbacks];
    if (a3 >= v14)
    {
      id v15 = [*(id *)(a1 + 56) objectAtIndexedSubscript:a3 - v14];
      uint64_t v16 = [v15 customColorGradeKind];

      [*(id *)(a1 + 48) removeIndex:v16];
    }
    [*(id *)(a1 + 48) addIndex:v12];
    [*(id *)(a1 + 56) addObject:v13];

    goto LABEL_10;
  }
LABEL_11:
}

- (void)_invalidatePredefinedStyleInfos
{
  id v2 = [(PXStoryStyleManager *)self updater];
  [v2 setNeedsUpdateOf:sel__updatePredefinedStyleInfos];
}

- (void)_updateStyleConfigurationList
{
  id v5 = [(PXStoryStyleManager *)self recipeManager];
  id v3 = [v5 recipe];
  uint64_t v4 = [v3 styleConfigurationList];
  [(PXStoryStyleManager *)self setStyleConfigurationList:v4];
}

- (void)_invalidateStyleConfigurationList
{
  id v2 = [(PXStoryStyleManager *)self updater];
  [v2 setNeedsUpdateOf:sel__updateStyleConfigurationList];
}

- (void)_setNeedsUpdate
{
}

- (void)setCueSource:(id)a3
{
  id v5 = (PXAudioCueSource *)a3;
  id v6 = self->_cueSource;
  if (v6 == v5)
  {
  }
  else
  {
    char v7 = v6;
    char v8 = [(PXAudioCueSource *)v5 isEqual:v6];

    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_cueSource, a3);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __36__PXStoryStyleManager_setCueSource___block_invoke;
      v9[3] = &unk_1E5DC3518;
      v9[4] = self;
      [(PXStoryStyleManager *)self performChanges:v9 origin:1];
    }
  }
}

uint64_t __36__PXStoryStyleManager_setCueSource___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _invalidateCurrentStyle];
  id v2 = *(void **)(a1 + 32);
  return [v2 _invalidateCurrentStyleAttributes];
}

- (void)setSelectionFocus:(double)a3
{
  if (self->_selectionFocus != a3)
  {
    self->_selectionFocus = a3;
    [(PXStoryStyleManager *)self signalChange:256];
  }
}

- (void)applyStyleAtIndex:(int64_t)a3 fromDataSource:(id)a4
{
  char v7 = [a4 styleInfos];
  id v13 = [v7 objectAtIndexedSubscript:a3];

  if (v13)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    char v8 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v11 = (objc_class *)objc_opt_class();
    char v10 = NSStringFromClass(v11);
    uint64_t v12 = objc_msgSend(v13, "px_descriptionForAssertionMessage");
    [v8 handleFailureInMethod:a2, self, @"PXStoryStyleManager.m", 280, @"%@ should be an instance inheriting from %@, but it is %@", @"dataSource.styleInfos[index]", v10, v12 object file lineNumber description];
  }
  else
  {
    char v8 = [MEMORY[0x1E4F28B00] currentHandler];
    double v9 = (objc_class *)objc_opt_class();
    char v10 = NSStringFromClass(v9);
    [v8 handleFailureInMethod:a2, self, @"PXStoryStyleManager.m", 280, @"%@ should be an instance inheriting from %@, but it is nil", @"dataSource.styleInfos[index]", v10 object file lineNumber description];
  }

LABEL_3:
  [(PXStoryStyleManager *)self setCurrentStyleInfo:v13];
}

- (void)applyFocusedStyle
{
  int64_t v3 = [(PXStoryStyleManager *)self focusedStyleIndex];
  id v4 = [(PXStoryStyleManager *)self selectionDataSource];
  [(PXStoryStyleManager *)self applyStyleAtIndex:v3 fromDataSource:v4];
}

- (void)applyFocusedStyleWithCustomizedSongResource:(id)a3
{
  id v5 = a3;
  id v6 = [(PXStoryStyleManager *)self selectionDataSource];
  char v7 = [v6 styleInfos];
  char v8 = objc_msgSend(v7, "objectAtIndexedSubscript:", -[PXStoryStyleManager focusedStyleIndex](self, "focusedStyleIndex"));

  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    id v15 = (objc_class *)objc_opt_class();
    unint64_t v14 = NSStringFromClass(v15);
    uint64_t v16 = objc_msgSend(v8, "px_descriptionForAssertionMessage");
    [v12 handleFailureInMethod:a2, self, @"PXStoryStyleManager.m", 265, @"%@ should be an instance inheriting from %@, but it is %@", @"self.selectionDataSource.styleInfos[self.focusedStyleIndex]", v14, v16 object file lineNumber description];
  }
  else
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    id v13 = (objc_class *)objc_opt_class();
    unint64_t v14 = NSStringFromClass(v13);
    [v12 handleFailureInMethod:a2, self, @"PXStoryStyleManager.m", 265, @"%@ should be an instance inheriting from %@, but it is nil", @"self.selectionDataSource.styleInfos[self.focusedStyleIndex]", v14 object file lineNumber description];
  }

LABEL_3:
  double v9 = objc_msgSend(v5, "px_storyResourceSongAsset");
  if (v9)
  {
    char v10 = [(PXStoryStyleManager *)self recipeManager];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    id v17[2] = __67__PXStoryStyleManager_applyFocusedStyleWithCustomizedSongResource___block_invoke;
    v17[3] = &unk_1E5DC1548;
    id v18 = v9;
    [v10 performChanges:v17];
  }
  uint64_t v11 = (void *)[v8 copyWithCustomizedSongResource:v5];
  [(PXStoryStyleManager *)self setCurrentStyleInfo:v11];
}

uint64_t __67__PXStoryStyleManager_applyFocusedStyleWithCustomizedSongResource___block_invoke(uint64_t a1, void *a2)
{
  return [a2 ensureAutoEditDecisionListForSong:*(void *)(a1 + 32)];
}

- (void)applyFocusedStyleWithCustomizedColorGradeKind:(int64_t)a3
{
  id v6 = [(PXStoryStyleManager *)self selectionDataSource];
  char v7 = [v6 styleInfos];
  objc_msgSend(v7, "objectAtIndexedSubscript:", -[PXStoryStyleManager focusedStyleIndex](self, "focusedStyleIndex"));
  id v14 = (id)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    double v9 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v12 = (objc_class *)objc_opt_class();
    uint64_t v11 = NSStringFromClass(v12);
    id v13 = objc_msgSend(v14, "px_descriptionForAssertionMessage");
    [v9 handleFailureInMethod:a2, self, @"PXStoryStyleManager.m", 260, @"%@ should be an instance inheriting from %@, but it is %@", @"self.selectionDataSource.styleInfos[self.focusedStyleIndex]", v11, v13 object file lineNumber description];
  }
  else
  {
    double v9 = [MEMORY[0x1E4F28B00] currentHandler];
    char v10 = (objc_class *)objc_opt_class();
    uint64_t v11 = NSStringFromClass(v10);
    [v9 handleFailureInMethod:a2, self, @"PXStoryStyleManager.m", 260, @"%@ should be an instance inheriting from %@, but it is nil", @"self.selectionDataSource.styleInfos[self.focusedStyleIndex]", v11 object file lineNumber description];
  }

LABEL_3:
  char v8 = (void *)[v14 copyWithCustomizedColorGradeKind:a3];
  [(PXStoryStyleManager *)self setCurrentStyleInfo:v8];
}

- (void)didPerformChanges
{
  v4.receiver = self;
  v4.super_class = (Class)PXStoryStyleManager;
  [(PXStoryStyleManager *)&v4 didPerformChanges];
  int64_t v3 = [(PXStoryStyleManager *)self updater];
  [v3 updateIfNeeded];
}

- (BOOL)focusedStyleIsCurrentStyle
{
  int64_t v3 = [(PXStoryStyleManager *)self focusedStyleIndex];
  objc_super v4 = [(PXStoryStyleManager *)self selectionDataSource];
  LOBYTE(v3) = v3 == [v4 indexOfCurrentStyle];

  return v3;
}

- (int64_t)focusedStyleIndex
{
  [(PXStoryStyleManager *)self selectionFocus];
  double v4 = round(v3);
  id v5 = [(PXStoryStyleManager *)self selectionDataSource];
  uint64_t v6 = [v5 numberOfStyles] - 1;

  double v7 = (double)v6;
  if (v4 < (double)v6) {
    double v7 = v4;
  }
  return (uint64_t)fmax(v7, 0.0);
}

- (void)setSelectionDataSource:(id)a3
{
  double v7 = (PXStoryStyleSelectionDataSource *)a3;
  id v5 = self->_selectionDataSource;
  if (v5 == v7)
  {
  }
  else
  {
    BOOL v6 = [(PXStoryStyleSelectionDataSource *)v7 isEqual:v5];

    if (!v6)
    {
      objc_storeStrong((id *)&self->_selectionDataSource, a3);
      [(PXStoryStyleManager *)self setSelectionFocus:(double)[(PXStoryStyleSelectionDataSource *)v7 indexOfCurrentStyle]];
      [(PXStoryStyleManager *)self _invalidateSelectionDataSourceAttributes];
      [(PXStoryStyleManager *)self signalChange:32];
    }
  }
}

- (void)setAreSelectionDataSourceStylesFinal:(BOOL)a3
{
  if (self->_areSelectionDataSourceStylesFinal != a3)
  {
    self->_areSelectionDataSourceStylesFinal = a3;
    [(PXStoryStyleManager *)self signalChange:128];
  }
}

- (void)setSelectionDataSourceStylesAttributes:(unint64_t)a3
{
  unint64_t selectionDataSourceStylesAttributes = self->_selectionDataSourceStylesAttributes;
  if (selectionDataSourceStylesAttributes != a3)
  {
    if ((selectionDataSourceStylesAttributes & 2) != 0
      && ((self->_selectionDataSourceStylesAttributes & 1) == 0) | a3 & 1)
    {
      if ((a3 & 2) != 0) {
        goto LABEL_8;
      }
    }
    else if ((((self->_selectionDataSourceStylesAttributes & 2) == 0) & (((self->_selectionDataSourceStylesAttributes & 1) == 0) | a3)) != 0)
    {
LABEL_8:
      self->_unint64_t selectionDataSourceStylesAttributes = a3;
      [(PXStoryStyleManager *)self signalChange:64];
      [(PXStoryStyleManager *)self setAreSelectionDataSourceStylesFinal:(self->_selectionDataSourceStylesAttributes >> 1) & 1];
      return;
    }
    PXAssertGetLog();
  }
}

- (void)setIsCurrentStyleFinal:(BOOL)a3
{
  if (self->_isCurrentStyleFinal != a3)
  {
    self->_isCurrentStyleFinal = a3;
    [(PXStoryStyleManager *)self signalChange:16];
  }
}

- (void)setCurrentStyleAttributes:(unint64_t)a3
{
  unint64_t currentStyleAttributes = self->_currentStyleAttributes;
  if (currentStyleAttributes != a3)
  {
    if ((currentStyleAttributes & 2) != 0 && ((self->_currentStyleAttributes & 1) == 0) | a3 & 1)
    {
      if ((a3 & 2) != 0) {
        goto LABEL_8;
      }
    }
    else if ((((self->_currentStyleAttributes & 2) == 0) & (((self->_currentStyleAttributes & 1) == 0) | a3)) != 0)
    {
LABEL_8:
      self->_unint64_t currentStyleAttributes = a3;
      [(PXStoryStyleManager *)self signalChange:8];
      [(PXStoryStyleManager *)self setIsCurrentStyleFinal:(self->_currentStyleAttributes >> 1) & 1];
      return;
    }
    PXAssertGetLog();
  }
}

- (void)setCurrentStyle:(id)a3
{
  double v7 = (PXStoryStyle *)a3;
  id v5 = self->_currentStyle;
  if (v5 == v7)
  {
  }
  else
  {
    char v6 = [(PXStoryStyle *)v7 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_currentStyle, a3);
      [(PXStoryStyleManager *)self signalChange:4];
    }
  }
}

- (void)setCurrentStyleInfo:(id)a3
{
  double v7 = (PXStoryStyleConfiguration *)a3;
  id v5 = self->_currentStyleInfo;
  if (v5 == v7)
  {
  }
  else
  {
    BOOL v6 = [(PXStoryStyleConfiguration *)v7 isEqual:v5];

    if (!v6)
    {
      objc_storeStrong((id *)&self->_currentStyleInfo, a3);
      [(PXStoryStyleManager *)self _invalidateCueSource];
      [(PXStoryStyleManager *)self _invalidateCurrentStyle];
      [(PXStoryStyleManager *)self _invalidatePredefinedStyleInfos];
      [(PXStoryStyleManager *)self _invalidateSelectionDataSource];
      [(PXStoryStyleManager *)self _invalidateCurrentStyleAttributes];
    }
  }
}

- (void)setAreStylesFinal:(BOOL)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (self->_areStylesFinal != a3)
  {
    self->_BOOL areStylesFinal = a3;
    double v4 = PLStoryGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      BOOL areStylesFinal = self->_areStylesFinal;
      int v6 = 138412546;
      double v7 = self;
      __int16 v8 = 1024;
      BOOL v9 = areStylesFinal;
      _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_INFO, "%@ areStylesFinal: %i", (uint8_t *)&v6, 0x12u);
    }
  }
}

- (void)setStylesAttributes:(unint64_t)a3
{
  unint64_t stylesAttributes = self->_stylesAttributes;
  if (stylesAttributes != a3)
  {
    if ((stylesAttributes & 2) != 0 && ((self->_stylesAttributes & 1) == 0) | a3 & 1)
    {
      if ((a3 & 2) != 0) {
        goto LABEL_8;
      }
    }
    else if ((((self->_stylesAttributes & 2) == 0) & (((self->_stylesAttributes & 1) == 0) | a3)) != 0)
    {
LABEL_8:
      self->_unint64_t stylesAttributes = a3;
      [(PXStoryStyleManager *)self setAreStylesFinal:(a3 >> 1) & 1];
      return;
    }
    PXAssertGetLog();
  }
}

- (void)setPredefinedStyleInfos:(id)a3
{
  __int16 v8 = (NSArray *)a3;
  double v4 = self->_predefinedStyleInfos;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSArray *)v8 isEqual:v4];

    if ((v5 & 1) == 0)
    {
      int v6 = (NSArray *)[(NSArray *)v8 copy];
      predefinedStyleInfos = self->_predefinedStyleInfos;
      self->_predefinedStyleInfos = v6;

      [(PXStoryStyleManager *)self _invalidateCurrentStyle];
      [(PXStoryStyleManager *)self _invalidateSelectionDataSource];
    }
  }
}

- (void)setStyleConfigurationList:(id)a3
{
  double v7 = (PXStoryStyleConfigurationList *)a3;
  char v5 = self->_styleConfigurationList;
  if (v5 == v7)
  {
  }
  else
  {
    BOOL v6 = [(PXStoryStyleConfigurationList *)v7 isEqual:v5];

    if (!v6)
    {
      objc_storeStrong((id *)&self->_styleConfigurationList, a3);
      [(PXStoryStyleManager *)self _invalidatePredefinedStyleInfos];
      [(PXStoryStyleManager *)self _invalidateCurrentStyleInfo];
    }
  }
}

- (void)didEndChangeHandling
{
  v3.receiver = self;
  v3.super_class = (Class)PXStoryStyleManager;
  [(PXStoryStyleManager *)&v3 didEndChangeHandling];
  self->_changesOrigin = 0;
}

- (void)performChanges:(id)a3 origin:(unint64_t)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = [(PXStoryStyleManager *)self storyQueue];
  dispatch_assert_queue_V2(v7);

  self->_changesOrigin |= a4;
  __int16 v8 = PLStoryGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v11 = self;
    __int16 v12 = 2048;
    unint64_t v13 = a4;
    _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_DEBUG, "%@ performChanges with origin: %lu", buf, 0x16u);
  }

  v9.receiver = self;
  v9.super_class = (Class)PXStoryStyleManager;
  [(PXStoryStyleManager *)&v9 performChanges:v6];
}

- (void)performChanges:(id)a3
{
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F28B00] currentHandler];
  [v6 handleFailureInMethod:a2 object:self file:@"PXStoryStyleManager.m" lineNumber:116 description:@"Code which should be unreachable has been reached"];

  abort();
}

- (PXStoryStyleManager)initWithRecipeManager:(id)a3 errorReporter:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v26.receiver = self;
  v26.super_class = (Class)PXStoryStyleManager;
  objc_super v9 = [(PXStoryStyleManager *)&v26 init];
  uint64_t v10 = v9;
  if (v9)
  {
    [(PXStoryStyleManager *)v9 copyLogConfigurationFrom:v7];
    objc_storeStrong((id *)&v10->_recipeManager, a3);
    objc_storeStrong((id *)&v10->_errorReporter, a4);
    uint64_t v11 = +[PXStoryColorGradingRepositoryFactory sharedRepository];
    colorGradingRepository = v10->_colorGradingRepository;
    v10->_colorGradingRepository = (PXStoryColorGradingRepository *)v11;

    [(PXStoryRecipeManager *)v10->_recipeManager registerChangeObserver:v10 context:RecipeManagerObservationContext_166233];
    unint64_t v13 = [v7 configuration];
    uint64_t v14 = PXStoryDefaultStyleProducerForConfiguration(v13);
    styleProducer = v10->_styleProducer;
    v10->_styleProducer = (PXStoryStyleProducer *)v14;

    char v16 = [v13 options];
    v10->_styleOptions.unint64_t croppingOptions = 0;
    *(void *)&v10->_styleOptions.preferStillKeySegment = (v16 & 2) == 0;
    uint64_t v17 = [(PXStoryRecipeManager *)v10->_recipeManager storyQueue];
    storyQueue = v10->_storyQueue;
    v10->_storyQueue = (OS_dispatch_queue *)v17;

    uint64_t v19 = objc_alloc_init(_PXDefaultAudioCueProvider);
    cueProvider = v10->_cueProvider;
    v10->_cueProvider = (PXAudioCueProvider *)v19;

    uint64_t v21 = [objc_alloc((Class)off_1E5DA9778) initWithTarget:v10 needsUpdateSelector:sel__setNeedsUpdate];
    updater = v10->_updater;
    v10->_updater = (PXUpdater *)v21;

    [(PXUpdater *)v10->_updater addUpdateSelector:sel__updateStyleConfigurationList];
    [(PXUpdater *)v10->_updater addUpdateSelector:sel__updateCurrentStyleInfo];
    [(PXUpdater *)v10->_updater addUpdateSelector:sel__updatePredefinedStyleInfos];
    [(PXUpdater *)v10->_updater addUpdateSelector:sel__updateStylesAttributes];
    [(PXUpdater *)v10->_updater addUpdateSelector:sel__updateCueSource];
    [(PXUpdater *)v10->_updater addUpdateSelector:sel__updateSelectionDataSource];
    [(PXUpdater *)v10->_updater addUpdateSelector:sel__updateSelectionDataSourceStylesAttributes];
    [(PXUpdater *)v10->_updater addUpdateSelector:sel__updateCurrentStyle];
    [(PXUpdater *)v10->_updater addUpdateSelector:sel__updateCurrentStyleAttributes];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __59__PXStoryStyleManager_initWithRecipeManager_errorReporter___block_invoke;
    v24[3] = &unk_1E5DC3518;
    id v25 = v10;
    [(PXStoryStyleManager *)v25 performChanges:v24 origin:1];
  }
  return v10;
}

uint64_t __59__PXStoryStyleManager_initWithRecipeManager_errorReporter___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _invalidateStyleConfigurationList];
  [*(id *)(a1 + 32) _invalidatePredefinedStyleInfos];
  [*(id *)(a1 + 32) _invalidateCurrentStyleInfo];
  [*(id *)(a1 + 32) _invalidateStylesAttributes];
  [*(id *)(a1 + 32) _invalidateCurrentStyle];
  id v2 = *(void **)(a1 + 32);
  return [v2 _invalidateCurrentStyleAttributes];
}

- (PXStoryStyleManager)init
{
  double v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryStyleManager.m", 59, @"%s is not available as initializer", "-[PXStoryStyleManager init]");

  abort();
}

@end