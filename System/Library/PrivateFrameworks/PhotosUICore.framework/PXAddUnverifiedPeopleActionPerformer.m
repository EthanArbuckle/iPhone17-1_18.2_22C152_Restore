@interface PXAddUnverifiedPeopleActionPerformer
- (NSArray)selectedPeopleToAdd;
- (PHPhotoLibrary)photoLibrary;
- (PXAddUnverifiedPeopleActionPerformer)initWithPresentationEnvironment:(id)a3 photoLibrary:(id)a4;
- (void)_createPersonWithPickerResults:(id)a3;
- (void)performUserInteractionTask;
- (void)picker:(id)a3 didFinishPicking:(id)a4;
- (void)setPhotoLibrary:(id)a3;
- (void)setSelectedPeopleToAdd:(id)a3;
@end

@implementation PXAddUnverifiedPeopleActionPerformer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_selectedPeopleToAdd, 0);
}

- (void)setPhotoLibrary:(id)a3
{
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)setSelectedPeopleToAdd:(id)a3
{
}

- (NSArray)selectedPeopleToAdd
{
  return self->_selectedPeopleToAdd;
}

- (void)picker:(id)a3 didFinishPicking:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_initWeak(&location, self);
  [(PXAddUnverifiedPeopleActionPerformer *)self _createPersonWithPickerResults:v7];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __64__PXAddUnverifiedPeopleActionPerformer_picker_didFinishPicking___block_invoke;
  v9[3] = &unk_1E5DD36F8;
  v9[4] = self;
  [v6 dismissViewControllerAnimated:1 completion:v9];
  objc_destroyWeak(&location);
}

uint64_t __64__PXAddUnverifiedPeopleActionPerformer_picker_didFinishPicking___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeUserInteractionTaskWithSuccess:1 error:0];
}

- (void)_createPersonWithPickerResults:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    v5 = [(PXAddUnverifiedPeopleActionPerformer *)self photoLibrary];
    id v6 = [v5 librarySpecificFetchOptions];

    id v7 = objc_msgSend(MEMORY[0x1E4F390A0], "px_defaultDetectionTypes");
    [v6 setIncludedDetectionTypes:v7];

    PXMap();
  }
}

void __71__PXAddUnverifiedPeopleActionPerformer__createPersonWithPickerResults___block_invoke_242(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v8;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v1);
        }
        id v6 = objc_msgSend(MEMORY[0x1E4F39200], "changeRequestForPerson:", *(void *)(*((void *)&v7 + 1) + 8 * v5), (void)v7);
        objc_msgSend(v6, "setManualOrder:verified:", +[PXPeopleUtilities manualOrderForInsertingAtEndOfSectionWithType:](PXPeopleUtilities, "manualOrderForInsertingAtEndOfSectionWithType:", 0), 1);

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

void __71__PXAddUnverifiedPeopleActionPerformer__createPersonWithPickerResults___block_invoke_249(uint64_t a1, int a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = PLPeopleGetLog();
  uint64_t v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [*(id *)(a1 + 32) localIdentifier];
      int v10 = 138412290;
      v11 = v6;
      long long v7 = "PXAddUnverifiedPeopleActionPerformer: Added person: %@";
      long long v8 = v5;
      os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
LABEL_6:
      _os_log_impl(&dword_1A9AE7000, v8, v9, v7, (uint8_t *)&v10, 0xCu);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v6 = [*(id *)(a1 + 32) localIdentifier];
    int v10 = 138412290;
    v11 = v6;
    long long v7 = "PXAddUnverifiedPeopleActionPerformer: Failed to add person: %@";
    long long v8 = v5;
    os_log_type_t v9 = OS_LOG_TYPE_ERROR;
    goto LABEL_6;
  }
}

void __71__PXAddUnverifiedPeopleActionPerformer__createPersonWithPickerResults___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = PLPeopleGetLog();
  id v6 = v5;
  if (a2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      long long v7 = "PXAddUnverifiedPeopleActionPerformer: Reset Sort Order for people succeeded";
      long long v8 = v6;
      os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
      uint32_t v10 = 2;
LABEL_6:
      _os_log_impl(&dword_1A9AE7000, v8, v9, v7, (uint8_t *)&v11, v10);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v11 = 138412290;
    id v12 = v4;
    long long v7 = "PXAddUnverifiedPeopleActionPerformer: Reset Sort Order for people Failed with error: %@.";
    long long v8 = v6;
    os_log_type_t v9 = OS_LOG_TYPE_ERROR;
    uint32_t v10 = 12;
    goto LABEL_6;
  }
}

uint64_t __71__PXAddUnverifiedPeopleActionPerformer__createPersonWithPickerResults___block_invoke(uint64_t a1, void *a2)
{
  return [a2 itemIdentifier];
}

- (void)performUserInteractionTask
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(PXAddUnverifiedPeopleActionPerformer *)self photoLibrary];
  +[PXPeopleSwiftUtilities fetchAddPeopleCandidatesIn:v2];
  objc_claimAutoreleasedReturnValue();

  PXMap();
}

void __66__PXAddUnverifiedPeopleActionPerformer_performUserInteractionTask__block_invoke_230()
{
  v0 = PLUIGetLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v1 = 0;
    _os_log_impl(&dword_1A9AE7000, v0, OS_LOG_TYPE_DEFAULT, "Presented unverified people picker", v1, 2u);
  }
}

uint64_t __66__PXAddUnverifiedPeopleActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, void *a2)
{
  return [a2 localIdentifier];
}

- (PXAddUnverifiedPeopleActionPerformer)initWithPresentationEnvironment:(id)a3 photoLibrary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PXAddUnverifiedPeopleActionPerformer;
  long long v8 = [(PXActionPerformer *)&v11 initWithActionType:@"PXActionAddUnverifiedPeople"];
  os_log_type_t v9 = v8;
  if (v8)
  {
    [(PXActionPerformer *)v8 setPresentationEnvironment:v6];
    [(PXAddUnverifiedPeopleActionPerformer *)v9 setPhotoLibrary:v7];
  }

  return v9;
}

@end