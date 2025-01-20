@interface PXSurveyQuestionsGadgetProvider
- (BOOL)currentlyLoadingMoreQuestions;
- (BOOL)gadget:(id)a3 transitionToViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (NSArray)surveyGadgets;
- (NSDate)previousMostRecentQuestionCreationDate;
- (PXSurveyQuestionGadgetsProviderLemonadeUIDelegate)lemonadeUIDelegate;
- (PXSurveyQuestionsDataSource)dataSource;
- (PXSurveyQuestionsGadgetProvider)init;
- (PXSurveyQuestionsGadgetProvider)initWithDataSource:(id)a3 gadgetType:(unint64_t)a4;
- (PXSurveyQuestionsGadgetProvider)initWithIdentifier:(id)a3;
- (PXSurveyQuestionsGadgetProviderDelegate)gadgetProviderDelegate;
- (id)_gadgetForSurveyQuestion:(id)a3;
- (id)_targetGadgetForCurrentOneUpPresentation;
- (id)oneUpPresentation:(id)a3 currentImageForAssetReference:(id)a4;
- (id)oneUpPresentation:(id)a3 regionOfInterestForAssetReference:(id)a4;
- (id)oneUpPresentationDataSourceManager:(id)a3;
- (id)oneUpPresentationInitialAssetReference:(id)a3;
- (id)oneUpPresentationMediaProvider:(id)a3;
- (id)prepareForPhotoLibraryChange:(id)a3;
- (int64_t)oneUpPresentationActionContext:(id)a3;
- (int64_t)oneUpPresentationOrigin:(id)a3;
- (unint64_t)estimatedNumberOfGadgets;
- (unint64_t)gadgetType;
- (void)_addCongratulationsGadgetWithCompletionHandlerIfNeeded:(id)a3;
- (void)_generateGadgetsWithLimit:(unint64_t)a3;
- (void)_generateGadgetsWithLimit:(unint64_t)a3 removeExistingGadgets:(BOOL)a4;
- (void)_reloadGadgetsWithLimit:(unint64_t)a3 completionHandler:(id)a4;
- (void)dealloc;
- (void)didAnswerQuestionForGadget:(id)a3;
- (void)didSelectActionButtonForType:(unint64_t)a3;
- (void)generateGadgets;
- (void)loadDataForGadgets;
- (void)oneUpPresentation:(id)a3 setHiddenAssetReferences:(id)a4;
- (void)pauseLibraryUpdates;
- (void)performChanges:(id)a3;
- (void)photoLibraryDidChangeOnMainQueue:(id)a3 withPreparedInfo:(id)a4;
- (void)presentGadgetViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)resumeLibraryUpdates;
- (void)setCurrentlyLoadingMoreQuestions:(BOOL)a3;
- (void)setGadgetProviderDelegate:(id)a3;
- (void)setLemonadeUIDelegate:(id)a3;
- (void)setPreviousMostRecentQuestionCreationDate:(id)a3;
- (void)setSurveyGadgets:(id)a3;
- (void)showViewController:(id)a3 fromGadget:(id)a4;
@end

@implementation PXSurveyQuestionsGadgetProvider

- (void)setGadgetProviderDelegate:(id)a3
{
}

- (PXSurveyQuestionsGadgetProvider)initWithDataSource:(id)a3 gadgetType:(unint64_t)a4
{
  id v8 = a3;
  if (!v8)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PXSurveyQuestionsGadgetProvider.m", 69, @"Invalid parameter not satisfying: %@", @"dataSource" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)PXSurveyQuestionsGadgetProvider;
  v9 = [(PXGadgetProvider *)&v14 init];
  if (v9)
  {
    uint64_t v10 = [v8 photoLibrary];
    photoLibrary = v9->_photoLibrary;
    v9->_photoLibrary = (PHPhotoLibrary *)v10;

    [(PHPhotoLibrary *)v9->_photoLibrary px_registerChangeObserver:v9];
    objc_storeStrong((id *)&v9->_dataSource, a3);
    v9->_gadgetType = a4;
    v9->_currentlyLoadingMoreQuestions = 0;
  }

  return v9;
}

- (void)generateGadgets
{
}

- (void)_generateGadgetsWithLimit:(unint64_t)a3 removeExistingGadgets:(BOOL)a4
{
  v7 = [(PXSurveyQuestionsDataSource *)self->_dataSource mostRecentQuestionCreationDate];
  previousMostRecentQuestionCreationDate = self->_previousMostRecentQuestionCreationDate;
  self->_previousMostRecentQuestionCreationDate = v7;

  v9 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v10 = [(PXSurveyQuestionsDataSource *)self->_dataSource fetchSortedAllUnansweredQuestionsWithLimit:a3];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __83__PXSurveyQuestionsGadgetProvider__generateGadgetsWithLimit_removeExistingGadgets___block_invoke;
  v25[3] = &unk_1E5DC33C0;
  v25[4] = self;
  id v11 = v9;
  id v26 = v11;
  [v10 enumerateObjectsUsingBlock:v25];
  uint64_t v12 = [v11 count];
  if (v12)
  {
    uint64_t v13 = v12;
    objc_super v14 = (void *)MEMORY[0x1E4F1CAD0];
    v15 = [(PXSurveyQuestionsGadgetProvider *)self surveyGadgets];
    v16 = [v14 setWithArray:v15];

    v17 = [MEMORY[0x1E4F1CAD0] setWithArray:v11];
    if (([v16 isEqualToSet:v17] & 1) == 0)
    {
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __83__PXSurveyQuestionsGadgetProvider__generateGadgetsWithLimit_removeExistingGadgets___block_invoke_2;
      v21[3] = &unk_1E5DC33E8;
      BOOL v24 = a4;
      v21[4] = self;
      id v22 = v11;
      uint64_t v23 = v13;
      [(PXSurveyQuestionsGadgetProvider *)self performChanges:v21];
    }
  }
  else
  {
    if (!self->_placeholderGadget)
    {
      v18 = objc_alloc_init(PXSurveyQuestionPlaceholderGadget);
      placeholderGadget = self->_placeholderGadget;
      self->_placeholderGadget = v18;
    }
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __83__PXSurveyQuestionsGadgetProvider__generateGadgetsWithLimit_removeExistingGadgets___block_invoke_3;
    v20[3] = &unk_1E5DC3398;
    v20[4] = self;
    [(PXSurveyQuestionsGadgetProvider *)self performChanges:v20];
  }
}

- (void)_generateGadgetsWithLimit:(unint64_t)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousMostRecentQuestionCreationDate, 0);
  objc_storeStrong((id *)&self->_surveyGadgets, 0);
  objc_destroyWeak((id *)&self->_lemonadeUIDelegate);
  objc_destroyWeak((id *)&self->_gadgetProviderDelegate);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_placeholderGadget, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_oneUpInitialAssetReference, 0);
  objc_storeStrong((id *)&self->_oneUpDataSourceManager, 0);
  objc_storeStrong((id *)&self->_oneUpMediaProvider, 0);
}

- (void)setPreviousMostRecentQuestionCreationDate:(id)a3
{
}

- (NSDate)previousMostRecentQuestionCreationDate
{
  return self->_previousMostRecentQuestionCreationDate;
}

- (void)setCurrentlyLoadingMoreQuestions:(BOOL)a3
{
  self->_currentlyLoadingMoreQuestions = a3;
}

- (BOOL)currentlyLoadingMoreQuestions
{
  return self->_currentlyLoadingMoreQuestions;
}

- (void)setSurveyGadgets:(id)a3
{
}

- (PXSurveyQuestionGadgetsProviderLemonadeUIDelegate)lemonadeUIDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lemonadeUIDelegate);
  return (PXSurveyQuestionGadgetsProviderLemonadeUIDelegate *)WeakRetained;
}

- (PXSurveyQuestionsGadgetProviderDelegate)gadgetProviderDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_gadgetProviderDelegate);
  return (PXSurveyQuestionsGadgetProviderDelegate *)WeakRetained;
}

- (unint64_t)gadgetType
{
  return self->_gadgetType;
}

- (PXSurveyQuestionsDataSource)dataSource
{
  return self->_dataSource;
}

- (void)_reloadGadgetsWithLimit:(unint64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__PXSurveyQuestionsGadgetProvider__reloadGadgetsWithLimit_completionHandler___block_invoke;
  block[3] = &unk_1E5DD34C0;
  id v9 = v6;
  unint64_t v10 = a3;
  block[4] = self;
  id v7 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __77__PXSurveyQuestionsGadgetProvider__reloadGadgetsWithLimit_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _generateGadgetsWithLimit:*(void *)(a1 + 48)];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (void)oneUpPresentation:(id)a3 setHiddenAssetReferences:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v5 = [a4 valueForKeyPath:@"asset.uuid"];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = [(PXSurveyQuestionsGadgetProvider *)self surveyGadgets];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v11 currentlyInOneUp])
        {
          uint64_t v12 = [v11 assetUUIDsAssociatedWithGadget];
          objc_msgSend(v11, "setContentHidden:", objc_msgSend(v12, "intersectsSet:", v5));
        }
        else
        {
          [v11 setContentHidden:0];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

- (int64_t)oneUpPresentationActionContext:(id)a3
{
  return 0;
}

- (id)oneUpPresentationInitialAssetReference:(id)a3
{
  return self->_oneUpInitialAssetReference;
}

- (id)_targetGadgetForCurrentOneUpPresentation
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(PXSurveyQuestionsGadgetProvider *)self surveyGadgets];
  id v3 = (id)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v3; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if ([v6 currentlyInOneUp])
        {
          id v3 = v6;
          goto LABEL_11;
        }
      }
      id v3 = (id)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)oneUpPresentation:(id)a3 currentImageForAssetReference:(id)a4
{
  uint64_t v4 = [(PXSurveyQuestionsGadgetProvider *)self _targetGadgetForCurrentOneUpPresentation];
  v5 = [v4 currentImage];

  return v5;
}

- (id)oneUpPresentation:(id)a3 regionOfInterestForAssetReference:(id)a4
{
  uint64_t v4 = [(PXSurveyQuestionsGadgetProvider *)self _targetGadgetForCurrentOneUpPresentation];
  v5 = [v4 regionOfInterestForOneUpTransition];

  return v5;
}

- (id)oneUpPresentationMediaProvider:(id)a3
{
  oneUpMediaProvider = self->_oneUpMediaProvider;
  if (!oneUpMediaProvider)
  {
    v5 = objc_alloc_init(PXPhotoKitUIMediaProvider);
    id v6 = self->_oneUpMediaProvider;
    self->_oneUpMediaProvider = v5;

    oneUpMediaProvider = self->_oneUpMediaProvider;
  }
  return oneUpMediaProvider;
}

- (id)oneUpPresentationDataSourceManager:(id)a3
{
  return self->_oneUpDataSourceManager;
}

- (int64_t)oneUpPresentationOrigin:(id)a3
{
  return 0;
}

- (void)presentGadgetViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  v5.receiver = self;
  v5.super_class = (Class)PXSurveyQuestionsGadgetProvider;
  [(PXGadgetProvider *)&v5 presentGadgetViewController:a3 animated:a4 completion:a5];
}

- (BOOL)gadget:(id)a3 transitionToViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  v7.receiver = self;
  v7.super_class = (Class)PXSurveyQuestionsGadgetProvider;
  return [(PXGadgetProvider *)&v7 gadget:a3 transitionToViewController:a4 animated:a5 completion:a6];
}

- (void)didSelectActionButtonForType:(unint64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a3 == 1)
  {
    if ([(PXSurveyQuestionsGadgetProvider *)self currentlyLoadingMoreQuestions]) {
      return;
    }
    [(PXSurveyQuestionsGadgetProvider *)self setCurrentlyLoadingMoreQuestions:1];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    objc_super v5 = [(PXGadgetProvider *)self gadgets];
    id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v5);
          }
          long long v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if ([v9 gadgetType] == 2)
          {
            id v6 = v9;
            goto LABEL_15;
          }
        }
        id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_15:

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __64__PXSurveyQuestionsGadgetProvider_didSelectActionButtonForType___block_invoke_234;
    v10[3] = &unk_1E5DD32A8;
    id v11 = v6;
    uint64_t v12 = self;
    uint64_t v4 = v6;
    [(PXSurveyQuestionsGadgetProvider *)self _reloadGadgetsWithLimit:50 completionHandler:v10];
  }
  else
  {
    if (a3) {
      return;
    }
    [(PXSurveyQuestionsGadgetProvider *)self performChanges:&__block_literal_global_189148];
    uint64_t v4 = dispatch_get_global_queue(25, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__PXSurveyQuestionsGadgetProvider_didSelectActionButtonForType___block_invoke_2;
    block[3] = &unk_1E5DD36F8;
    block[4] = self;
    dispatch_async(v4, block);
  }
}

void __64__PXSurveyQuestionsGadgetProvider_didSelectActionButtonForType___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v1 = [*(id *)(*(void *)(a1 + 32) + 72) photoAnalysisClient];
  id v10 = 0;
  int v2 = [v1 reportMetricsWithOptions:MEMORY[0x1E4F1CC08] error:&v10];
  id v3 = v10;

  uint64_t v4 = PLUIGetLog();
  objc_super v5 = v4;
  if (v2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      id v6 = "Sent photos challenge metrics";
      uint64_t v7 = v5;
      os_log_type_t v8 = OS_LOG_TYPE_INFO;
      uint32_t v9 = 2;
LABEL_6:
      _os_log_impl(&dword_1A9AE7000, v7, v8, v6, buf, v9);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v3;
    id v6 = "Failed to send photos challenge metrics: %@";
    uint64_t v7 = v5;
    os_log_type_t v8 = OS_LOG_TYPE_ERROR;
    uint32_t v9 = 12;
    goto LABEL_6;
  }
}

uint64_t __64__PXSurveyQuestionsGadgetProvider_didSelectActionButtonForType___block_invoke_234(uint64_t a1)
{
  int v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v3 = *(void **)(a1 + 40);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __64__PXSurveyQuestionsGadgetProvider_didSelectActionButtonForType___block_invoke_2_235;
    v5[3] = &unk_1E5DC3398;
    id v6 = v2;
    [v3 performChanges:v5];
  }
  return [*(id *)(a1 + 40) setCurrentlyLoadingMoreQuestions:0];
}

void __64__PXSurveyQuestionsGadgetProvider_didSelectActionButtonForType___block_invoke_2_235(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(void *)(a1 + 32);
  int v2 = (void *)MEMORY[0x1E4F1C978];
  id v3 = a2;
  uint64_t v4 = [v2 arrayWithObjects:&v5 count:1];
  objc_msgSend(v3, "removeGadgets:", v4, v5, v6);
}

uint64_t __64__PXSurveyQuestionsGadgetProvider_didSelectActionButtonForType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeAllGadgets];
}

- (void)_addCongratulationsGadgetWithCompletionHandlerIfNeeded:(id)a3
{
  uint64_t v4 = (void (**)(id, void))a3;
  if ([(PXSurveyQuestionsDataSource *)self->_dataSource numberOfQuestionsRemainingToBeAnswered])
  {
    v4[2](v4, 0);
  }
  else
  {
    uint64_t v5 = [[PXSurveyQuestionCongratulationsGadget alloc] initWithType:[(PXSurveyQuestionsDataSource *)self->_dataSource fetchTotalNumberOfUnansweredQuestions] != 0];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __90__PXSurveyQuestionsGadgetProvider__addCongratulationsGadgetWithCompletionHandlerIfNeeded___block_invoke;
    v7[3] = &unk_1E5DC3398;
    os_log_type_t v8 = v5;
    uint64_t v6 = v5;
    [(PXSurveyQuestionsGadgetProvider *)self performChanges:v7];
    v4[2](v4, 1);
  }
}

void __90__PXSurveyQuestionsGadgetProvider__addCongratulationsGadgetWithCompletionHandlerIfNeeded___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(void *)(a1 + 32);
  int v2 = (void *)MEMORY[0x1E4F1C978];
  id v3 = a2;
  uint64_t v4 = [v2 arrayWithObjects:&v5 count:1];
  objc_msgSend(v3, "addGadgets:", v4, v5, v6);
}

- (void)showViewController:(id)a3 fromGadget:(id)a4
{
}

- (void)didAnswerQuestionForGadget:(id)a3
{
  id v4 = a3;
  dataSource = self->_dataSource;
  uint64_t v6 = [v4 uniqueGadgetIdentifier];
  BOOL v7 = [(PXSurveyQuestionsDataSource *)dataSource didAnswerQuestionForGadgetIdentifier:v6];

  objc_initWeak(&location, self);
  os_log_type_t v8 = [(PXSurveyQuestionsGadgetProvider *)self gadgetProviderDelegate];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __62__PXSurveyQuestionsGadgetProvider_didAnswerQuestionForGadget___block_invoke;
  v10[3] = &unk_1E5DD0928;
  BOOL v13 = v7;
  objc_copyWeak(&v12, &location);
  id v9 = v4;
  id v11 = v9;
  [v8 didAnswerQuestionForGadgetProvider:self completionHandler:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __62__PXSurveyQuestionsGadgetProvider_didAnswerQuestionForGadget___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    int v2 = (id *)(a1 + 40);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __62__PXSurveyQuestionsGadgetProvider_didAnswerQuestionForGadget___block_invoke_2;
    v4[3] = &unk_1E5DD21B0;
    objc_copyWeak(&v6, v2);
    id v5 = *(id *)(a1 + 32);
    [WeakRetained _addCongratulationsGadgetWithCompletionHandlerIfNeeded:v4];

    objc_destroyWeak(&v6);
  }
}

void __62__PXSurveyQuestionsGadgetProvider_didAnswerQuestionForGadget___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = [WeakRetained gadgets];

  if (a2)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v22;
LABEL_4:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v21 + 1) + 8 * v11);
        if (objc_msgSend(v12, "gadgetType", (void)v21) == 2) {
          break;
        }
        if (v9 == ++v11)
        {
          uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
          if (v9) {
            goto LABEL_4;
          }
          goto LABEL_16;
        }
      }
      id v17 = v12;

      if (!v17) {
        goto LABEL_17;
      }
      id v18 = objc_loadWeakRetained(v4);
      uint64_t v19 = [v18 lemonadeUIDelegate];
      [v19 navigateToGadget:v17];

      v20 = [v17 contentView];
      [v20 startConfettiAnimation];

      id v7 = v17;
    }
    goto LABEL_16;
  }
  unint64_t v13 = [v6 indexOfObject:*(void *)(a1 + 32)] + 1;
  if (v13 < [v6 count])
  {
    uint64_t v14 = [v6 objectAtIndex:v13];
    if (v14)
    {
      id v7 = (id)v14;
      id v15 = objc_loadWeakRetained(v4);
      long long v16 = [v15 lemonadeUIDelegate];
      [v16 navigateToGadget:v7];

LABEL_16:
    }
  }
LABEL_17:
}

- (id)_gadgetForSurveyQuestion:(id)a3
{
  id v4 = a3;
  id v5 = [[PXSurveyQuestionGadget alloc] initWithSurveyQuestion:v4 gadgetType:self->_gadgetType];

  [(PXSurveyQuestionGadget *)v5 setDelegate:self];
  return v5;
}

- (NSArray)surveyGadgets
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(PXGadgetProvider *)self gadgets];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v9 gadgetType] == self->_gadgetType) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (unint64_t)estimatedNumberOfGadgets
{
  return 1;
}

- (void)loadDataForGadgets
{
}

void __83__PXSurveyQuestionsGadgetProvider__generateGadgetsWithLimit_removeExistingGadgets___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) _gadgetForSurveyQuestion:a2];
  if (v3)
  {
    id v4 = v3;
    [*(id *)(a1 + 40) addObject:v3];
    id v3 = v4;
  }
}

void __83__PXSurveyQuestionsGadgetProvider__generateGadgetsWithLimit_removeExistingGadgets___block_invoke_2(uint64_t a1, void *a2)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (*(unsigned char *)(a1 + 56))
  {
    [v3 removeAllGadgets];
    uint64_t v5 = [*(id *)(a1 + 32) dataSource];
    [v5 resetGeneratedQuestions];
LABEL_5:

    goto LABEL_6;
  }
  if (*(void *)(*(void *)(a1 + 32) + 80))
  {
    v7[0] = *(void *)(*(void *)(a1 + 32) + 80);
    uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
    [v4 removeGadgets:v5];
    goto LABEL_5;
  }
LABEL_6:
  [v4 addGadgets:*(void *)(a1 + 40)];
  uint64_t v6 = [*(id *)(a1 + 32) dataSource];
  [v6 didGenerateNumberOfGadgets:*(void *)(a1 + 48)];
}

void __83__PXSurveyQuestionsGadgetProvider__generateGadgetsWithLimit_removeExistingGadgets___block_invoke_3(uint64_t a1, void *a2)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [v3 removeAllGadgets];
  v5[0] = *(void *)(*(void *)(a1 + 32) + 80);
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  [v3 addGadgets:v4];
}

- (void)photoLibraryDidChangeOnMainQueue:(id)a3 withPreparedInfo:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = [v5 objectForKeyedSubscript:@"GadgetsNeedReset"];
  int v7 = [v6 BOOLValue];

  if (v7) {
    [(PXSurveyQuestionsGadgetProvider *)self _generateGadgetsWithLimit:10 removeExistingGadgets:1];
  }
  uint64_t v8 = [v5 objectForKeyedSubscript:@"GadgetsWithInvalidEntities"];
  if ([v8 count])
  {
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __85__PXSurveyQuestionsGadgetProvider_photoLibraryDidChangeOnMainQueue_withPreparedInfo___block_invoke;
    v30[3] = &unk_1E5DC3398;
    id v9 = v8;
    id v31 = v9;
    [(PXSurveyQuestionsGadgetProvider *)self performChanges:v30];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v26 objects:v33 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v27;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v27 != v13) {
            objc_enumerationMutation(v10);
          }
          dataSource = self->_dataSource;
          uint64_t v16 = [*(id *)(*((void *)&v26 + 1) + 8 * v14) uniqueGadgetIdentifier];
          [(PXSurveyQuestionsDataSource *)dataSource didRemoveGadgetWithIdentifier:v16];

          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v26 objects:v33 count:16];
      }
      while (v12);
    }
  }
  id v17 = [v5 objectForKeyedSubscript:@"GadgetsWithStaleContent"];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v22 objects:v32 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v23;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v23 != v20) {
          objc_enumerationMutation(v17);
        }
        [*(id *)(*((void *)&v22 + 1) + 8 * v21++) refreshQuestionContentView];
      }
      while (v19 != v21);
      uint64_t v19 = [v17 countByEnumeratingWithState:&v22 objects:v32 count:16];
    }
    while (v19);
  }
}

uint64_t __85__PXSurveyQuestionsGadgetProvider_photoLibraryDidChangeOnMainQueue_withPreparedInfo___block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeGadgets:*(void *)(a1 + 32)];
}

- (id)prepareForPhotoLibraryChange:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PXSurveyQuestionsDataSource *)self->_dataSource mostRecentQuestionCreationDate];
  previousMostRecentQuestionCreationDate = self->_previousMostRecentQuestionCreationDate;
  if (!previousMostRecentQuestionCreationDate)
  {
    if ([(PXSurveyQuestionsDataSource *)self->_dataSource fetchTotalNumberOfUnansweredQuestions])
    {
      objc_storeStrong((id *)&self->_previousMostRecentQuestionCreationDate, v5);
      uint64_t v7 = 1;
      goto LABEL_5;
    }
    previousMostRecentQuestionCreationDate = self->_previousMostRecentQuestionCreationDate;
  }
  uint64_t v7 = [(NSDate *)previousMostRecentQuestionCreationDate compare:v5] == NSOrderedAscending;
LABEL_5:
  id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v7) {
    goto LABEL_21;
  }
  unsigned int v20 = v7;
  uint64_t v21 = self;
  long long v22 = v5;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v8 = [(PXSurveyQuestionsGadgetProvider *)self surveyGadgets];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (!v9) {
    goto LABEL_20;
  }
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)v27;
  do
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v27 != v11) {
        objc_enumerationMutation(v8);
      }
      uint64_t v13 = *(void **)(*((void *)&v26 + 1) + 8 * i);
      uint64_t v14 = [v13 question];
      id v15 = [v13 configuration];
      if ((objc_opt_respondsToSelector() & 1) != 0
        && [v15 needsQuestionInvalidationForChange:v4])
      {
        [v24 addObject:v14];
        uint64_t v16 = v25;
LABEL_17:
        [v16 addObject:v13];
        goto LABEL_18;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0
        && [v15 needsDisplayRefreshForChange:v4])
      {
        [v15 setIsStale:1];
        uint64_t v16 = v23;
        goto LABEL_17;
      }
LABEL_18:
    }
    uint64_t v10 = [v8 countByEnumeratingWithState:&v26 objects:v32 count:16];
  }
  while (v10);
LABEL_20:

  self = v21;
  id v5 = v22;
  uint64_t v7 = v20;
LABEL_21:
  [(PXSurveyQuestionsDataSource *)self->_dataSource invalidateQuestions:v24];
  v30[0] = @"GadgetsNeedReset";
  id v17 = [NSNumber numberWithBool:v7];
  v31[0] = v17;
  v31[1] = v25;
  v30[1] = @"GadgetsWithInvalidEntities";
  v30[2] = @"GadgetsWithStaleContent";
  v31[2] = v23;
  uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:3];

  return v18;
}

- (void)pauseLibraryUpdates
{
}

- (void)resumeLibraryUpdates
{
}

- (void)performChanges:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PXSurveyQuestionsGadgetProvider;
  [(PXGadgetProvider *)&v5 performChanges:a3];
  id v4 = [(PXSurveyQuestionsGadgetProvider *)self lemonadeUIDelegate];
  [v4 invalidateGadgets];
}

- (void)setLemonadeUIDelegate:(id)a3
{
  id obj = a3;
  id v4 = [(PXSurveyQuestionsGadgetProvider *)self lemonadeUIDelegate];

  objc_super v5 = obj;
  if (v4 != obj)
  {
    objc_storeWeak((id *)&self->_lemonadeUIDelegate, obj);
    objc_super v5 = obj;
  }
}

- (void)dealloc
{
  [(PHPhotoLibrary *)self->_photoLibrary px_unregisterChangeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)PXSurveyQuestionsGadgetProvider;
  [(PXSurveyQuestionsGadgetProvider *)&v3 dealloc];
}

- (PXSurveyQuestionsGadgetProvider)initWithIdentifier:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXSurveyQuestionsGadgetProvider.m", 65, @"%s is not available as initializer", "-[PXSurveyQuestionsGadgetProvider initWithIdentifier:]");

  abort();
}

- (PXSurveyQuestionsGadgetProvider)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXSurveyQuestionsGadgetProvider.m", 61, @"%s is not available as initializer", "-[PXSurveyQuestionsGadgetProvider init]");

  abort();
}

@end