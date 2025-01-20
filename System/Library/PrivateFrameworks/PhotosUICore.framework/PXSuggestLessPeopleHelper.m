@interface PXSuggestLessPeopleHelper
+ (BOOL)canPerformOnAsset:(id)a3;
- (NSUndoManager)undoManager;
- (PXSuggestLessPeopleHelper)initWithUndoManager:(id)a3;
- (PXSuggestLessPeopleHelperDelegate)delegate;
- (void)_showSuggestLessOptionForPerson:(id)a3 completionHandler:(id)a4;
- (void)_showSuggestLessPeopleSelectionForPeople:(id)a3 completionHandler:(id)a4;
- (void)_suggestLessPeople:(id)a3 withSuggestLessOption:(int64_t)a4 undoManager:(id)a5 completionHandler:(id)a6;
- (void)completeActionWithCompletionHandler:(id)a3;
- (void)completeOptionSelectionActionWithCompletionHandler:(id)a3;
- (void)didSelectPersonToSuggestLess:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5;
- (void)dismissOptionSelectionViewController:(id)a3 completionHandler:(id)a4;
- (void)dismissViewController:(id)a3 completionHandler:(id)a4;
- (void)setDelegate:(id)a3;
- (void)suggestLessPeople:(id)a3 completionHandler:(id)a4;
- (void)suggestLessPeopleFromAssets:(id)a3 completionHandler:(id)a4;
@end

@implementation PXSuggestLessPeopleHelper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_undoManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (NSUndoManager)undoManager
{
  return self->_undoManager;
}

- (void)setDelegate:(id)a3
{
}

- (PXSuggestLessPeopleHelperDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXSuggestLessPeopleHelperDelegate *)WeakRetained;
}

- (void)dismissOptionSelectionViewController:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PXSuggestLessPeopleHelper *)self delegate];
  [v8 suggestLessPeopleHelper:self dismissViewController:v7 completionHandler:v6];
}

- (void)completeOptionSelectionActionWithCompletionHandler:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F28C58];
  id v5 = a3;
  objc_msgSend(v4, "px_genericErrorWithDebugDescription:", @"User cancelled confirmation alert");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void, id))a3 + 2))(v5, 0, v6);
}

- (void)didSelectPersonToSuggestLess:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5
{
  if (a3) {
    [(PXSuggestLessPeopleHelper *)self _showSuggestLessOptionForPerson:a3 completionHandler:a5];
  }
}

- (void)dismissViewController:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PXSuggestLessPeopleHelper *)self delegate];
  [v8 suggestLessPeopleHelper:self dismissViewController:v7 completionHandler:v6];
}

- (void)completeActionWithCompletionHandler:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F28C58];
  id v5 = a3;
  objc_msgSend(v4, "px_genericErrorWithDebugDescription:", @"User cancelled confirmation alert");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void, id))a3 + 2))(v5, 0, v6);
}

- (void)_suggestLessPeople:(id)a3 withSuggestLessOption:(int64_t)a4 undoManager:(id)a5 completionHandler:(id)a6
{
  BOOL v10 = a4 == 1;
  id v11 = a6;
  if (a4 == 2) {
    uint64_t v12 = 3;
  }
  else {
    uint64_t v12 = 2 * v10;
  }
  id v13 = a5;
  id v14 = a3;
  v15 = [[PXPeopleUserFeedbackAction alloc] initWithPeople:v14 feedbackType:v12];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __100__PXSuggestLessPeopleHelper__suggestLessPeople_withSuggestLessOption_undoManager_completionHandler___block_invoke;
  v17[3] = &unk_1E5DB9C38;
  id v18 = v11;
  uint64_t v19 = v12;
  v17[4] = self;
  id v16 = v11;
  [(PXAction *)v15 executeWithUndoManager:v13 completionHandler:v17];
}

void __100__PXSuggestLessPeopleHelper__suggestLessPeople_withSuggestLessOption_undoManager_completionHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!a2) {
    goto LABEL_11;
  }
  uint64_t v6 = *(void *)(a1 + 48);
  if (v6 == 2)
  {
    id v7 = PXAnalyticsEventUserFeedbackDislikePerson;
  }
  else
  {
    if (v6 != 3)
    {
      id v8 = 0;
      goto LABEL_8;
    }
    id v7 = PXAnalyticsEventUserFeedbackAvoidPerson;
  }
  id v8 = *v7;
LABEL_8:
  if ([(__CFString *)v8 length])
  {
    v9 = (void *)MEMORY[0x1E4F56658];
    uint64_t v13 = *MEMORY[0x1E4F56560];
    BOOL v10 = (objc_class *)objc_opt_class();
    id v11 = NSStringFromClass(v10);
    v14[0] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    [v9 sendEvent:v8 withPayload:v12];
  }
LABEL_11:
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_showSuggestLessOptionForPerson:(id)a3 completionHandler:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 userFeedbackProperties];
  v9 = [v8 userFeedback];

  if (v9)
  {
    BOOL v10 = +[PXPeopleUtilities alertControllerForRevertingSuggestLess:v6 completion:v7];
  }
  else
  {
    v13[0] = v6;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    BOOL v10 = +[PXPeopleUtilities suggestLessOptionSelectionViewController:v11 delegate:self completionHandler:v7];
  }
  uint64_t v12 = [(PXSuggestLessPeopleHelper *)self delegate];
  [v12 suggestLessPeopleHelper:self presentViewController:v10];
}

- (void)_showSuggestLessPeopleSelectionForPeople:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v9 = [[_TtC12PhotosUICore40SuggestLessPeopleSelectionViewController alloc] initWithPeople:v7 delegate:self completionHandler:v6];

  id v8 = [(PXSuggestLessPeopleHelper *)self delegate];
  [v8 suggestLessPeopleHelper:self presentViewController:v9];
}

- (void)suggestLessPeopleFromAssets:(id)a3 completionHandler:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = (void *)MEMORY[0x1E4F390A0];
  id v7 = a4;
  id v8 = a3;
  v9 = [v8 firstObject];
  BOOL v10 = [v6 fetchOptionsWithPhotoLibrary:0 orObject:v9];

  v14[0] = *MEMORY[0x1E4F397E0];
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  [v10 setFetchPropertySets:v11];

  [v10 setPersonContext:5];
  uint64_t v12 = [MEMORY[0x1E4F391F0] fetchPersonsInAssets:v8 options:v10];

  uint64_t v13 = [v12 fetchedObjects];
  [(PXSuggestLessPeopleHelper *)self suggestLessPeople:v13 completionHandler:v7];
}

- (void)suggestLessPeople:(id)a3 completionHandler:(id)a4
{
  id v9 = a3;
  id v6 = (void (**)(id, void, void *))a4;
  if ((unint64_t)[v9 count] < 2)
  {
    if ([v9 count])
    {
      id v7 = [v9 firstObject];
      [(PXSuggestLessPeopleHelper *)self _showSuggestLessOptionForPerson:v7 completionHandler:v6];
    }
    else
    {
      id v8 = objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"No persons were provided for blocking");
      v6[2](v6, 0, v8);
    }
  }
  else
  {
    [(PXSuggestLessPeopleHelper *)self _showSuggestLessPeopleSelectionForPeople:v9 completionHandler:v6];
  }
}

- (PXSuggestLessPeopleHelper)initWithUndoManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXSuggestLessPeopleHelper;
  id v6 = [(PXSuggestLessPeopleHelper *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_undoManager, a3);
  }

  return v7;
}

+ (BOOL)canPerformOnAsset:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = v3;
  if (v3 && (objc_msgSend(v3, "px_isUnsavedSyndicatedAsset") & 1) == 0)
  {
    id v6 = [v4 photoLibrary];
    id v7 = [v6 librarySpecificFetchOptions];

    [v7 setPersonContext:5];
    id v8 = (void *)MEMORY[0x1E4F391F0];
    v12[0] = v4;
    objc_super v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    BOOL v10 = [v8 fetchPersonsInAssets:v9 options:v7];
    BOOL v5 = [v10 count] != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

@end