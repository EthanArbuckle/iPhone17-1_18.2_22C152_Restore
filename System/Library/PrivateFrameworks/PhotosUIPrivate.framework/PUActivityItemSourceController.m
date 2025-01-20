@interface PUActivityItemSourceController
- ($9D9B13A340AA60ED2DD68408BD7D962F)synthesizedSharingPreferencesForAssetItem:(id)a3;
- (BOOL)_prepareForPerformWithActivityType:(id)a3 error:(id *)a4;
- (BOOL)actionPerformer:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5;
- (BOOL)actionPerformer:(id)a3 presentViewController:(id)a4;
- (BOOL)isPreparingIndividualItems;
- (BOOL)itemSourcesSupportMomentShareLinkCreation;
- (BOOL)itemSourcesSupportSlideshow;
- (BOOL)momentSharePublishAttempted;
- (BOOL)shouldExcludeAccessibilityDescriptionInAllItemSources;
- (BOOL)shouldExcludeCaptionInAllItemSources;
- (BOOL)shouldExcludeLivenessInAllItemSources;
- (BOOL)shouldExcludeLocationInAllItemSources;
- (BOOL)shouldShareAsAssetBundles;
- (BOOL)shouldShareAsUnmodifiedOriginals;
- (BOOL)shouldUseMomentShareLinkInMessagesIfThresholdMet;
- (NSArray)activeItemSources;
- (NSArray)activityItems;
- (NSMutableArray)errors;
- (NSOrderedSet)assetItemSources;
- (NSOrderedSet)assetItems;
- (NSOrderedSet)assets;
- (NSString)activeActivityType;
- (NSURL)publishedURL;
- (OS_dispatch_queue)externalIsolation;
- (PHPerson)person;
- (PHPhotoLibrary)appPhotoLibrary;
- (PHSocialGroup)socialGroup;
- (PUActivityItemSourceController)init;
- (PUActivityItemSourceControllerDelegate)delegate;
- (PUActivityViewController)activityViewController;
- (PUCMMActivityItemSource)cmmActivityItemSource;
- (PXAssetMediaTypeCount)requestAssetsMediaTypeCount;
- (id)activityItemSourceForAsset:(id)a3;
- (id)presentationEnvironmentForActionPerformer:(id)a3;
- (id)progressHandler;
- (id)undoManagerForActionPerformer:(id)a3;
- (int64_t)preferredExportFormat;
- (unint64_t)numSourcesDownloading;
- (unint64_t)preferredPreparationType;
- (unint64_t)state;
- (unint64_t)unsavedSyndicatedAssetCount;
- (unsigned)powerAssertionIdentifier;
- (void)_cleanupAfterPerform;
- (void)_didPublishMomentShareLinkToURL:(id)a3 error:(id)a4 completionHandler:(id)a5;
- (void)_prepareIndividualItemSourcesForActivity:(id)a3;
- (void)_prepareMomentShareLinkFromIndividualItemSourcesForActivity:(id)a3;
- (void)_setPublishedURL:(id)a3;
- (void)addAssetItem:(id)a3;
- (void)cancel;
- (void)cleanUpExportedFiles;
- (void)cmmActivityItemSource:(id)a3 didFinishPreparationForActivityType:(id)a4 preparationType:(unint64_t)a5 withItems:(id)a6 didCancel:(BOOL)a7 error:(id)a8 completion:(id)a9;
- (void)cmmActivityItemSource:(id)a3 willBeginPreparationWithActivityType:(id)a4 preparationType:(unint64_t)a5;
- (void)configureItemSourcesForActivityIfNeeded:(id)a3 forcePreparationAsMomentShareLink:(BOOL)a4;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)publishLinkForActivityType:(id)a3 completionHandler:(id)a4;
- (void)removeAssetItem:(id)a3;
- (void)runExplicitly:(BOOL)a3 withActivityType:(id)a4 completionHandler:(id)a5;
- (void)setActiveActivityType:(id)a3;
- (void)setActiveItemSources:(id)a3;
- (void)setActivityViewController:(id)a3;
- (void)setAssetItems:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setErrors:(id)a3;
- (void)setNumSourcesDownloading:(unint64_t)a3;
- (void)setPerson:(id)a3;
- (void)setPreferredExportFormat:(int64_t)a3;
- (void)setPreferredPreparationType:(unint64_t)a3;
- (void)setProgressHandler:(id)a3;
- (void)setShouldExcludeAccessibilityDescriptionInAllItemSources:(BOOL)a3;
- (void)setShouldExcludeCaptionInAllItemSources:(BOOL)a3;
- (void)setShouldExcludeLivenessInAllItemSources:(BOOL)a3;
- (void)setShouldExcludeLocationInAllItemSources:(BOOL)a3;
- (void)setShouldShareAsAssetBundles:(BOOL)a3;
- (void)setShouldShareAsUnmodifiedOriginals:(BOOL)a3;
- (void)setShouldUseMomentShareLinkInMessagesIfThresholdMet:(BOOL)a3;
- (void)setSocialGroup:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)updateSharingPreferencesInItemSources;
- (void)updateState;
@end

@implementation PUActivityItemSourceController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalIsolation, 0);
  objc_storeStrong((id *)&self->_activeActivityType, 0);
  objc_storeStrong((id *)&self->_errors, 0);
  objc_storeStrong((id *)&self->_cmmActivityItemSource, 0);
  objc_storeStrong((id *)&self->_publishedURL, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_socialGroup, 0);
  objc_storeStrong((id *)&self->_person, 0);
  objc_destroyWeak((id *)&self->_activityViewController);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_activeItemSources, 0);
  objc_storeStrong((id *)&self->_assetItemSources, 0);
  objc_storeStrong((id *)&self->_assetItems, 0);
}

- (unsigned)powerAssertionIdentifier
{
  return self->_powerAssertionIdentifier;
}

- (OS_dispatch_queue)externalIsolation
{
  return self->_externalIsolation;
}

- (void)setNumSourcesDownloading:(unint64_t)a3
{
  self->_numSourcesDownloading = a3;
}

- (unint64_t)numSourcesDownloading
{
  return self->_numSourcesDownloading;
}

- (void)setActiveActivityType:(id)a3
{
}

- (NSString)activeActivityType
{
  return (NSString *)objc_getProperty(self, a2, 264, 1);
}

- (void)setErrors:(id)a3
{
}

- (NSMutableArray)errors
{
  return (NSMutableArray *)objc_getProperty(self, a2, 256, 1);
}

- (PUCMMActivityItemSource)cmmActivityItemSource
{
  return self->_cmmActivityItemSource;
}

- (void)_setPublishedURL:(id)a3
{
}

- (NSURL)publishedURL
{
  return self->_publishedURL;
}

- (BOOL)momentSharePublishAttempted
{
  return self->_momentSharePublishAttempted;
}

- (void)setProgressHandler:(id)a3
{
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void)setSocialGroup:(id)a3
{
}

- (PHSocialGroup)socialGroup
{
  return self->_socialGroup;
}

- (void)setPerson:(id)a3
{
}

- (PHPerson)person
{
  return self->_person;
}

- (int64_t)preferredExportFormat
{
  return self->_preferredExportFormat;
}

- (BOOL)shouldShareAsUnmodifiedOriginals
{
  return self->_shouldShareAsUnmodifiedOriginals;
}

- (BOOL)shouldShareAsAssetBundles
{
  return self->_shouldShareAsAssetBundles;
}

- (BOOL)shouldExcludeAccessibilityDescriptionInAllItemSources
{
  return self->_shouldExcludeAccessibilityDescriptionInAllItemSources;
}

- (BOOL)shouldExcludeCaptionInAllItemSources
{
  return self->_shouldExcludeCaptionInAllItemSources;
}

- (BOOL)shouldExcludeLocationInAllItemSources
{
  return self->_shouldExcludeLocationInAllItemSources;
}

- (BOOL)shouldExcludeLivenessInAllItemSources
{
  return self->_shouldExcludeLivenessInAllItemSources;
}

- (NSOrderedSet)assetItems
{
  return &self->_assetItems->super;
}

- (void)setActivityViewController:(id)a3
{
}

- (PUActivityViewController)activityViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activityViewController);
  return (PUActivityViewController *)WeakRetained;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setDelegate:(id)a3
{
}

- (PUActivityItemSourceControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUActivityItemSourceControllerDelegate *)WeakRetained;
}

- (void)setShouldUseMomentShareLinkInMessagesIfThresholdMet:(BOOL)a3
{
  self->_shouldUseMomentShareLinkInMessagesIfThresholdMet = a3;
}

- (BOOL)shouldUseMomentShareLinkInMessagesIfThresholdMet
{
  return self->_shouldUseMomentShareLinkInMessagesIfThresholdMet;
}

- (void)setPreferredPreparationType:(unint64_t)a3
{
  self->_preferredPreparationType = a3;
}

- (unint64_t)preferredPreparationType
{
  return self->_preferredPreparationType;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v10 = a3;
  if (((v6 & 1) == 0 || (void *)PUActivityItemSourceControllerItemSourceObserverContext != a5)
    && ((v6 & 1) == 0 || (void *)PUActivityItemSourceControllerCMMSourceObserverContext != a5))
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"PUActivityItemSourceController.m" lineNumber:1007 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  [(PUActivityItemSourceController *)self updateState];
}

- (void)cmmActivityItemSource:(id)a3 didFinishPreparationForActivityType:(id)a4 preparationType:(unint64_t)a5 withItems:(id)a6 didCancel:(BOOL)a7 error:(id)a8 completion:(id)a9
{
  BOOL v10 = a7;
  v24[1] = *MEMORY[0x1E4F143B8];
  id v14 = a4;
  id v15 = a6;
  id v16 = a8;
  v17 = (void (**)(void))a9;
  v18 = [(PUActivityItemSourceController *)self delegate];
  char v19 = objc_opt_respondsToSelector();

  if (v19)
  {
    if (v16)
    {
      v24[0] = v16;
      v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
    }
    else
    {
      v20 = 0;
    }
    v21 = [(PUActivityItemSourceController *)self delegate];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __145__PUActivityItemSourceController_cmmActivityItemSource_didFinishPreparationForActivityType_preparationType_withItems_didCancel_error_completion___block_invoke;
    v22[3] = &unk_1E5F2EBA0;
    v23 = v17;
    [v21 activityItemSourceController:self didFinishPreparationForActivityType:v14 preparationType:a5 withItems:v15 didCancel:v10 errors:v20 completion:v22];
  }
  else
  {
    v17[2](v17);
  }
}

uint64_t __145__PUActivityItemSourceController_cmmActivityItemSource_didFinishPreparationForActivityType_preparationType_withItems_didCancel_error_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)cmmActivityItemSource:(id)a3 willBeginPreparationWithActivityType:(id)a4 preparationType:(unint64_t)a5
{
  id v10 = a4;
  v7 = [(PUActivityItemSourceController *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    v9 = [(PUActivityItemSourceController *)self delegate];
    [v9 activityItemSourceController:self willBeginPreparationWithActivityType:v10 preparationType:a5];
  }
}

- (id)undoManagerForActionPerformer:(id)a3
{
  return 0;
}

- (BOOL)actionPerformer:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  char v8 = (void (**)(void))a5;
  v9 = [v7 presentingViewController];
  if (!v9)
  {
    v9 = [(PUActivityItemSourceController *)self activityViewController];
    if (v9)
    {
      do
      {
        id v12 = [v9 presentedViewController];

        if (v12 == v7) {
          break;
        }
        uint64_t v13 = [v9 presentedViewController];

        v9 = (void *)v13;
      }
      while (v13);
    }
  }
  id v10 = [v9 presentedViewController];

  if (v10 == v7)
  {
    [v9 dismissViewControllerAnimated:1 completion:v8];
  }
  else
  {
    v11 = PLShareSheetGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412290;
      id v16 = self;
      _os_log_impl(&dword_1AE9F8000, v11, OS_LOG_TYPE_DEFAULT, "PUActivityItemSourceController=%@: Did not find a parent view controller for dismissing the CMM progress alert.", (uint8_t *)&v15, 0xCu);
    }

    v8[2](v8);
  }

  return v10 == v7;
}

- (BOOL)actionPerformer:(id)a3 presentViewController:(id)a4
{
  if (a4)
  {
    id v6 = a4;
    id v7 = [(PUActivityItemSourceController *)self activityViewController];
    objc_msgSend(v7, "px_presentOverTopmostPresentedViewController:animated:completion:", v6, 1, 0);
  }
  return a4 != 0;
}

- (id)presentationEnvironmentForActionPerformer:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F908D0];
  v4 = [(PUActivityItemSourceController *)self activityViewController];
  v5 = [v3 defaultPresenterWithViewController:v4];

  return v5;
}

- (id)activityItemSourceForAsset:(id)a3
{
  id v4 = a3;
  assetItemSources = self->_assetItemSources;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61__PUActivityItemSourceController_activityItemSourceForAsset___block_invoke;
  v10[3] = &unk_1E5F228F0;
  id v6 = v4;
  id v11 = v6;
  uint64_t v7 = [(NSMutableOrderedSet *)assetItemSources indexOfObjectPassingTest:v10];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    char v8 = 0;
  }
  else
  {
    char v8 = [(NSMutableOrderedSet *)self->_assetItemSources objectAtIndexedSubscript:v7];
  }

  return v8;
}

uint64_t __61__PUActivityItemSourceController_activityItemSourceForAsset___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 asset];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (void)cancel
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"PUActivityItemSourceController.m" lineNumber:888 description:@"expect main thread"];
  }
  atomic_fetch_add(&self->_taskId, 1u);
  uint64_t v4 = PLShareSheetGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v18 = self;
    _os_log_impl(&dword_1AE9F8000, v4, OS_LOG_TYPE_DEFAULT, "cancel PUActivityItemSourceController=%@", buf, 0xCu);
  }

  v5 = [(PUActivityItemSourceController *)self activeItemSources];
  if (v5)
  {
    [(PUActivityItemSourceController *)self setActiveItemSources:0];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "cancel", (void)v12);
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
  else
  {
    [(PUActivityItemSourceController *)self setProgressHandler:0];
    [(PUActivityItemSourceController *)self setErrors:0];
  }
  [(PUActivityItemSourceController *)self updateState];
  [(PUActivityItemSourceController *)self setActiveActivityType:0];
}

- (void)_didPublishMomentShareLinkToURL:(id)a3 error:(id)a4 completionHandler:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUActivityItemSourceController.m", 865, @"%s must be called on the main thread", "-[PUActivityItemSourceController _didPublishMomentShareLinkToURL:error:completionHandler:]");
  }
  long long v12 = [v10 domain];
  if ([v12 isEqualToString:*MEMORY[0x1E4F90E30]]) {
    BOOL v13 = [v10 code] == -1001;
  }
  else {
    BOOL v13 = 0;
  }

  long long v14 = PLShareSheetGetLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    long long v15 = objc_msgSend(v9, "pl_redactedShareURL");
    id v16 = [(PUActivityItemSourceController *)self activeActivityType];
    uint64_t v17 = @"NO";
    if (v13) {
      uint64_t v17 = @"YES";
    }
    v18 = v17;
    *(_DWORD *)buf = 138544386;
    v26 = v15;
    __int16 v27 = 2112;
    v28 = self;
    __int16 v29 = 2112;
    v30 = v16;
    __int16 v31 = 2112;
    v32 = v18;
    __int16 v33 = 2112;
    id v34 = v10;
    _os_log_impl(&dword_1AE9F8000, v14, OS_LOG_TYPE_DEFAULT, "Share Sheet: Finished publishing moment share link: %{public}@ PUActivityItemSourceController=%@ activityType=%@ didCancel=%@ error=%@", buf, 0x34u);
  }
  if (v11)
  {
    [(PUActivityItemSourceController *)self _setPublishedURL:v9];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __90__PUActivityItemSourceController__didPublishMomentShareLinkToURL_error_completionHandler___block_invoke;
    block[3] = &unk_1E5F29330;
    id v23 = v11;
    id v21 = v9;
    BOOL v24 = v13;
    id v22 = v10;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  if (v13) {
    [(PUActivityItemSourceController *)self cancel];
  }
  [(PUActivityItemSourceController *)self _cleanupAfterPerform];
  [(PUActivityItemSourceController *)self updateState];
}

uint64_t __90__PUActivityItemSourceController__didPublishMomentShareLinkToURL_error_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 40));
}

- (void)publishLinkForActivityType:(id)a3 completionHandler:(id)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v34 = a4;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    __int16 v29 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUActivityItemSourceController.m", 813, @"%s must be called on the main thread", "-[PUActivityItemSourceController publishLinkForActivityType:completionHandler:]");
  }
  id v45 = 0;
  __int16 v33 = v7;
  BOOL v8 = [(PUActivityItemSourceController *)self _prepareForPerformWithActivityType:v7 error:&v45];
  id v9 = v45;
  __int16 v31 = v9;
  if (v8)
  {
    id v10 = [(NSMutableOrderedSet *)self->_assetItemSources array];
    v32 = (void *)[v10 copy];

    BOOL v11 = [v32 count] == 0;
    long long v12 = PLShareSheetGetLog();
    BOOL v13 = v12;
    if (v11)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AE9F8000, v13, OS_LOG_TYPE_ERROR, "Share Sheet: Attempted to publish a link with no items selected", buf, 2u);
      }

      v30 = objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"No items selected for moment share link");
      (*((void (**)(id, void, void, void *))v34 + 2))(v34, 0, 0, v30);
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v49 = self;
        __int16 v50 = 2112;
        v51 = v33;
        __int16 v52 = 2112;
        v53 = v32;
        _os_log_impl(&dword_1AE9F8000, v13, OS_LOG_TYPE_DEFAULT, "Share Sheet: Begin publishing moment share link PUActivityItemSourceController=%@ with activityType=%@ activeItemSources=%@", buf, 0x20u);
      }

      [(PUActivityItemSourceController *)self setActiveItemSources:v32];
      [(PUActivityItemSourceController *)self setActiveActivityType:v33];
      [(PUActivityItemSourceController *)self _setPublishedURL:0];
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id v14 = v32;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v41 objects:v47 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v42;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v42 != v16) {
              objc_enumerationMutation(v14);
            }
            [*(id *)(*((void *)&v41 + 1) + 8 * i) setShouldSkipPreparation:1];
          }
          uint64_t v15 = [v14 countByEnumeratingWithState:&v41 objects:v47 count:16];
        }
        while (v15);
      }

      v18 = [(PUActivityItemSourceController *)self assets];
      v30 = [v18 array];

      objc_initWeak((id *)buf, self);
      uint64_t v19 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v30, "count"));
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      v20 = [(PUActivityItemSourceController *)self activeItemSources];
      uint64_t v21 = [v20 countByEnumeratingWithState:&v37 objects:v46 count:16];
      if (v21)
      {
        uint64_t v22 = *(void *)v38;
        do
        {
          for (uint64_t j = 0; j != v21; ++j)
          {
            if (*(void *)v38 != v22) {
              objc_enumerationMutation(v20);
            }
            BOOL v24 = *(void **)(*((void *)&v37 + 1) + 8 * j);
            unint64_t v25 = [v24 sharingPreferences];
            if ((v25 & 0x100000101) != 0)
            {
              id v26 = objc_alloc_init(MEMORY[0x1E4F90028]);
              [v26 setPublishAsOriginal:HIDWORD(v25) & 1];
              [v26 setPublishLivePhotoAsStill:v25 & 1];
              [v26 setRemoveLocationData:(v25 >> 8) & 1];
              __int16 v27 = [v24 asset];
              v28 = [v27 uuid];
              [v19 setObject:v26 forKeyedSubscript:v28];
            }
          }
          uint64_t v21 = [v20 countByEnumeratingWithState:&v37 objects:v46 count:16];
        }
        while (v21);
      }

      objc_copyWeak(&v36, (id *)buf);
      id v35 = v34;
      PXPublishMomentShareWithCompletion();

      objc_destroyWeak(&v36);
      objc_destroyWeak((id *)buf);
    }
  }
  else
  {
    (*((void (**)(id, void, void, id))v34 + 2))(v34, 0, 0, v9);
  }
}

void __79__PUActivityItemSourceController_publishLinkForActivityType_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_copyWeak(&v10, (id *)(a1 + 40));
  id v7 = v5;
  id v8 = v6;
  id v9 = *(id *)(a1 + 32);
  px_dispatch_on_main_queue();

  objc_destroyWeak(&v10);
}

void __79__PUActivityItemSourceController_publishLinkForActivityType_completionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained _didPublishMomentShareLinkToURL:*(void *)(a1 + 32) error:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)runExplicitly:(BOOL)a3 withActivityType:(id)a4 completionHandler:(id)a5
{
  BOOL v37 = a3;
  v92[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v39 = a5;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v35 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUActivityItemSourceController.m", 662, @"%s must be called on the main thread", "-[PUActivityItemSourceController runExplicitly:withActivityType:completionHandler:]");
  }
  id v85 = 0;
  v49 = self;
  long long v40 = v7;
  BOOL v8 = [(PUActivityItemSourceController *)self _prepareForPerformWithActivityType:v7 error:&v85];
  id v9 = v85;
  long long v38 = v9;
  if (v8)
  {
    id v10 = [MEMORY[0x1E4F905D8] sharedController];
    objc_msgSend(v10, "addPowerAssertionForIdentifier:withReason:completion:", -[PUActivityItemSourceController powerAssertionIdentifier](self, "powerAssertionIdentifier"), 8, 0);

    BOOL v11 = [(NSMutableOrderedSet *)self->_assetItemSources array];
    obuint64_t j = (id)[v11 copy];

    long long v12 = PLShareSheetGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = [obj count];
      *(_DWORD *)buf = 138413314;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v37;
      *(_WORD *)&buf[18] = 2112;
      *(void *)&buf[20] = v7;
      *(_WORD *)&buf[28] = 2048;
      *(void *)&buf[30] = v13;
      __int16 v90 = 2112;
      id v91 = obj;
      _os_log_impl(&dword_1AE9F8000, v12, OS_LOG_TYPE_DEFAULT, "begin running PUActivityItemSourceController=%@ runExplicitly=%i for activityType=%@ with %lu activeItemSources=%@", buf, 0x30u);
    }

    [(PUActivityItemSourceController *)self setActiveItemSources:obj];
    [(PUActivityItemSourceController *)self setActiveActivityType:v7];
    uint64_t v45 = [obj count];
    v48 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v45];
    id v14 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v45];
    [(PUActivityItemSourceController *)self setErrors:v14];

    unsigned int v15 = atomic_load((unsigned int *)&self->_taskId);
    unsigned int v43 = v15;
    long long v44 = [(PUActivityItemSourceController *)self progressHandler];
    if (v44)
    {
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000;
      *(void *)&buf[24] = 0;
      v84[0] = 0;
      v84[1] = v84;
      v84[2] = 0x2020000000;
      v84[3] = 0;
      long long v80 = 0u;
      long long v81 = 0u;
      long long v82 = 0u;
      long long v83 = 0u;
      id v16 = obj;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v80 objects:v88 count:16];
      if (v17)
      {
        uint64_t v18 = *(void *)v81;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v81 != v18) {
              objc_enumerationMutation(v16);
            }
            v20 = *(void **)(*((void *)&v80 + 1) + 8 * i);
            v73[0] = MEMORY[0x1E4F143A8];
            v73[1] = 3221225472;
            v73[2] = __83__PUActivityItemSourceController_runExplicitly_withActivityType_completionHandler___block_invoke;
            v73[3] = &unk_1E5F229B0;
            unsigned int v79 = v43;
            v73[4] = self;
            v75 = v84;
            v76 = buf;
            SEL v77 = a2;
            uint64_t v78 = v45;
            id v74 = v44;
            [v20 setProgressHandler:v73];
          }
          uint64_t v17 = [v16 countByEnumeratingWithState:&v80 objects:v88 count:16];
        }
        while (v17);
      }

      _Block_object_dispose(v84, 8);
      _Block_object_dispose(buf, 8);
    }
    uint64_t v21 = dispatch_group_create();
    v47 = dispatch_get_global_queue(0, 0);
    queue = dispatch_queue_create(0, 0);
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    *(void *)&buf[24] = 0;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    id obja = obj;
    uint64_t v22 = [obja countByEnumeratingWithState:&v69 objects:v87 count:16];
    if (v22)
    {
      unint64_t v23 = 0;
      uint64_t v24 = *(void *)v70;
      unint64_t v25 = *MEMORY[0x1E4F393D0];
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v70 != v24) {
            objc_enumerationMutation(obja);
          }
          __int16 v27 = *(void **)(*((void *)&v69 + 1) + 8 * j);
          [v27 setShouldSkipPreparation:0];
          dispatch_group_enter(v21);
          v63[0] = MEMORY[0x1E4F143A8];
          v63[1] = 3221225472;
          v63[2] = __83__PUActivityItemSourceController_runExplicitly_withActivityType_completionHandler___block_invoke_2;
          v63[3] = &unk_1E5F229D8;
          id v28 = v47;
          v68 = buf;
          id v64 = v28;
          v65 = v49;
          id v66 = v48;
          v67 = v21;
          [v27 setCompletionHandler:v63];
          if (v23 <= v25)
          {
            [v27 setShouldSendAnalyticsInterval:1];
            ++v23;
          }
        }
        uint64_t v22 = [obja countByEnumeratingWithState:&v69 objects:v87 count:16];
      }
      while (v22);
    }

    if (v37)
    {
      long long v61 = 0u;
      long long v62 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      id v29 = obja;
      uint64_t v30 = [v29 countByEnumeratingWithState:&v59 objects:v86 count:16];
      if (v30)
      {
        uint64_t v31 = *(void *)v60;
        do
        {
          for (uint64_t k = 0; k != v30; ++k)
          {
            if (*(void *)v60 != v31) {
              objc_enumerationMutation(v29);
            }
            [*(id *)(*((void *)&v59 + 1) + 8 * k) runWithActivityType:v40];
          }
          uint64_t v30 = [v29 countByEnumeratingWithState:&v59 objects:v86 count:16];
        }
        while (v30);
      }
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __83__PUActivityItemSourceController_runExplicitly_withActivityType_completionHandler___block_invoke_4;
    block[3] = &unk_1E5F22A00;
    v56 = buf;
    uint64_t v57 = v45;
    unsigned int v58 = v43;
    v51 = v21;
    __int16 v52 = v49;
    id v53 = v48;
    id v54 = v40;
    id v55 = v39;
    id v33 = v48;
    id v34 = v21;
    dispatch_async(queue, block);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v92[0] = v9;
    id obja = [MEMORY[0x1E4F1C978] arrayWithObjects:v92 count:1];
    (*((void (**)(id, void, void, id))v39 + 2))(v39, 0, 0, obja);
  }
}

void __83__PUActivityItemSourceController_runExplicitly_withActivityType_completionHandler___block_invoke(uint64_t a1, double a2)
{
  double v2 = a2;
  if (a2 < 0.0 || a2 > 1.0)
  {
    long long v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:*(void *)(a1 + 64) object:*(void *)(a1 + 32) file:@"PUActivityItemSourceController.m" lineNumber:702 description:@"expect progress range"];
  }
  unsigned int v5 = atomic_load((unsigned int *)(a1 + 80));
  unsigned int v6 = atomic_load((unsigned int *)(*(void *)(a1 + 32) + 120));
  if (v5 == v6)
  {
    id v7 = [*(id *)(a1 + 32) errors];
    uint64_t v8 = [v7 count];

    if (!v8)
    {
      if (v2 >= 1.0)
      {
        ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
        double v2 = 0.0;
      }
      *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = (v2
                                                                   + (double)*(unint64_t *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                                                 + 24))
                                                                  / (double)*(unint64_t *)(a1 + 72);
      uint64_t v10 = *(void *)(a1 + 40);
      if (v10)
      {
        v9.n128_u64[0] = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
        BOOL v11 = *(void (**)(__n128))(v10 + 16);
        v11(v9);
      }
    }
  }
}

void __83__PUActivityItemSourceController_runExplicitly_withActivityType_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __83__PUActivityItemSourceController_runExplicitly_withActivityType_completionHandler___block_invoke_3;
  v14[3] = &unk_1E5F2A6B0;
  uint64_t v8 = *(void *)(a1 + 64);
  uint64_t v10 = *(NSObject **)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  BOOL v11 = *(void **)(a1 + 48);
  id v15 = v7;
  uint64_t v16 = v9;
  uint64_t v20 = v8;
  id v17 = v6;
  id v18 = v11;
  id v19 = *(id *)(a1 + 56);
  id v12 = v6;
  id v13 = v7;
  dispatch_async(v10, v14);
}

void __83__PUActivityItemSourceController_runExplicitly_withActivityType_completionHandler___block_invoke_4(uint64_t a1)
{
  v46[1] = *MEMORY[0x1E4F143B8];
  dispatch_group_wait(*(dispatch_group_t *)(a1 + 32), 0xFFFFFFFFFFFFFFFFLL);
  double v2 = PLShareSheetGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 80);
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
    *(_DWORD *)buf = 134218240;
    uint64_t v40 = v4;
    __int16 v41 = 2048;
    *(void *)long long v42 = v3;
    _os_log_impl(&dword_1AE9F8000, v2, OS_LOG_TYPE_DEFAULT, "PUActivityItemSourceController finished waiting after %lu item source completions (started with %lu)", buf, 0x16u);
  }

  unsigned int v5 = atomic_load((unsigned int *)(a1 + 88));
  unsigned int v6 = atomic_load((unsigned int *)(*(void *)(a1 + 40) + 120));
  id v7 = [*(id *)(a1 + 40) errors];
  uint64_t v8 = (void *)[v7 copy];

  BOOL v9 = v5 == v6 && [v8 count] == 0;
  uint64_t v10 = PLShareSheetGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412802;
    uint64_t v40 = v11;
    __int16 v41 = 1024;
    *(_DWORD *)long long v42 = v5 != v6;
    *(_WORD *)&v42[4] = 2112;
    *(void *)&v42[6] = v8;
    _os_log_impl(&dword_1AE9F8000, v10, OS_LOG_TYPE_DEFAULT, "end running PUActivityItemSourceController=%@ didCancel=%i errors=%@", buf, 0x1Cu);
  }

  if (v9)
  {
    id v12 = [MEMORY[0x1E4F906A0] sharedInstance];
    int v13 = [v12 simulateError];

    id v14 = [MEMORY[0x1E4F906A0] sharedInstance];
    int v15 = [v14 simulateMismatchedExportCounts];

    if (v13)
    {
      uint64_t v16 = objc_msgSend(MEMORY[0x1E4F28C58], "px_errorWithDomain:code:debugDescription:", @"PXSharingSettingsErrorDomain", 0, @"Simulated error, because PXSharingSettings.simulateError is YES");
      v46[0] = v16;
      uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:1];

      uint64_t v8 = (void *)v17;
    }
    else if (v15)
    {
      [*(id *)(a1 + 48) removeLastObject];
    }
    uint64_t v18 = *(void *)(a1 + 80);
    if (v18 == [*(id *)(a1 + 48) count])
    {
      id v19 = PLShareSheetGetLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v20 = [*(id *)(a1 + 48) count];
        uint64_t v21 = *(void *)(a1 + 80);
        uint64_t v22 = *(void *)(a1 + 56);
        *(_DWORD *)buf = 134218498;
        uint64_t v40 = v20;
        __int16 v41 = 2048;
        *(void *)long long v42 = v21;
        *(_WORD *)&v42[8] = 2112;
        *(void *)&v42[10] = v22;
        unint64_t v23 = "PUActivityItemSourceController succeeded (no errors or cancellation) and prepared %ld/%ld items for activity %@.";
        uint64_t v24 = v19;
        os_log_type_t v25 = OS_LOG_TYPE_DEFAULT;
LABEL_19:
        _os_log_impl(&dword_1AE9F8000, v24, v25, v23, buf, 0x20u);
      }
    }
    else
    {
      id v26 = [MEMORY[0x1E4F906A0] sharedInstance];
      char v27 = [v26 allowFallbacksWhilePreparing];

      id v19 = PLShareSheetGetLog();
      BOOL v28 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
      if ((v27 & 1) == 0)
      {
        if (v28)
        {
          uint64_t v32 = *(void *)(a1 + 80);
          uint64_t v33 = [*(id *)(a1 + 48) count];
          *(_DWORD *)buf = 134218240;
          uint64_t v40 = v32;
          __int16 v41 = 2048;
          *(void *)long long v42 = v33;
          _os_log_impl(&dword_1AE9F8000, v19, OS_LOG_TYPE_ERROR, "PUActivityItemSourceController succeeded (no errors or cancellation), but from preparing %ld item sources, it ended with %ld items.", buf, 0x16u);
        }

        id v19 = objc_msgSend(NSString, "stringWithFormat:", @"The number of prepared items (%ld) does not match the number of items initially being prepared (%ld).", objc_msgSend(*(id *)(a1 + 48), "count"), *(void *)(a1 + 80));
        id v34 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v44 = *MEMORY[0x1E4F28228];
        uint64_t v45 = v19;
        id v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v45 forKeys:&v44 count:1];
        id v36 = [v34 errorWithDomain:@"com.apple.PUActivityItemSourceController" code:-1 userInfo:v35];

        unsigned int v43 = v36;
        uint64_t v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v43 count:1];

        uint64_t v8 = (void *)v37;
        goto LABEL_23;
      }
      if (v28)
      {
        uint64_t v29 = *(void *)(a1 + 80);
        uint64_t v30 = [*(id *)(a1 + 48) count];
        uint64_t v31 = [*(id *)(a1 + 48) count];
        *(_DWORD *)buf = 134218496;
        uint64_t v40 = v29;
        __int16 v41 = 2048;
        *(void *)long long v42 = v30;
        *(_WORD *)&v42[8] = 2048;
        *(void *)&v42[10] = v31;
        unint64_t v23 = "PUActivityItemSourceController succeeded (no errors or cancellation), but from preparing %ld item sources,"
              " it ended with %ld items. Sharing just the %ld items.";
        uint64_t v24 = v19;
        os_log_type_t v25 = OS_LOG_TYPE_ERROR;
        goto LABEL_19;
      }
    }
LABEL_23:
  }
  uint64_t v38 = *(void *)(a1 + 64);
  if (v38) {
    (*(void (**)(uint64_t, void, BOOL, void *))(v38 + 16))(v38, *(void *)(a1 + 48), v5 != v6, v8);
  }
  px_dispatch_on_main_queue();
}

void __83__PUActivityItemSourceController_runExplicitly_withActivityType_completionHandler___block_invoke_269(uint64_t a1)
{
  [*(id *)(a1 + 32) _cleanupAfterPerform];
  [*(id *)(a1 + 32) updateState];
  id v2 = [MEMORY[0x1E4F905D8] sharedController];
  objc_msgSend(v2, "removePowerAssertionForIdentifier:withReason:completion:", objc_msgSend(*(id *)(a1 + 32), "powerAssertionIdentifier"), 8, 0);
}

void __83__PUActivityItemSourceController_runExplicitly_withActivityType_completionHandler___block_invoke_3(uint64_t a1)
{
  ++*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
  if (*(void *)(a1 + 32))
  {
    id v2 = [*(id *)(a1 + 40) errors];
    [v2 addObject:*(void *)(a1 + 32)];
  }
  if (*(void *)(a1 + 48)) {
    objc_msgSend(*(id *)(a1 + 56), "addObject:");
  }
  uint64_t v3 = *(NSObject **)(a1 + 64);
  dispatch_group_leave(v3);
}

- (void)cleanUpExportedFiles
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = PLShareSheetGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AE9F8000, v3, OS_LOG_TYPE_DEFAULT, "PUActivityItemSourceController cleaning up exported files", buf, 2u);
  }

  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v4 = [(PUActivityItemSourceController *)self assetItemSources];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) cleanUpExportedFiles];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)_cleanupAfterPerform
{
  [(PUActivityItemSourceController *)self setProgressHandler:0];
  [(PUActivityItemSourceController *)self setActiveItemSources:0];
  [(PUActivityItemSourceController *)self setErrors:0];
  [(PUActivityItemSourceController *)self setActiveActivityType:0];
}

- (BOOL)_prepareForPerformWithActivityType:(id)a3 error:(id *)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(PUActivityItemSourceController *)self activeItemSources];

  if (v7)
  {
    uint64_t v8 = NSString;
    long long v9 = [(PUActivityItemSourceController *)self activeItemSources];
    long long v10 = [(PUActivityItemSourceController *)self activeActivityType];
    [v8 stringWithFormat:@"unexpected previous task with activeItemSources=%@, activeActivityType=%@, new activityType %@", v9, v10, v6];
    long long v11 = (PUActivityItemSourceController *)objc_claimAutoreleasedReturnValue();

    long long v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v22 = *MEMORY[0x1E4F28228];
    v23[0] = v11;
    int v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
    id v14 = [v12 errorWithDomain:@"com.apple.PUActivityItemSourceController" code:-1 userInfo:v13];

    uint64_t v15 = PLShareSheetGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v19 = self;
      __int16 v20 = 2112;
      uint64_t v21 = v14;
      _os_log_impl(&dword_1AE9F8000, v15, OS_LOG_TYPE_ERROR, "failed running PUActivityItemSourceController=%@ with error=%@", buf, 0x16u);
    }

    uint64_t v16 = PXAssertGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v11;
      _os_log_fault_impl(&dword_1AE9F8000, v16, OS_LOG_TYPE_FAULT, "%@", buf, 0xCu);
    }

    if (a4) {
      *a4 = v14;
    }
  }
  else
  {
    [(PUActivityItemSourceController *)self _setPublishedURL:0];
    [(PUActivityItemSourceController *)self updateState];
  }

  return v7 == 0;
}

- (void)_prepareMomentShareLinkFromIndividualItemSourcesForActivity:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 activityType];
  id v6 = PLShareSheetGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_DEFAULT, "Preparing moment-share link from individual item sources", buf, 2u);
  }

  uint64_t v7 = [(PUActivityItemSourceController *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    long long v9 = [(PUActivityItemSourceController *)self delegate];
    [v9 activityItemSourceController:self willBeginPreparationWithActivityType:v5 preparationType:1];
  }
  self->_momentSharePublishAttempted = 1;
  long long v10 = [(PUActivityItemSourceController *)self assetItemSources];
  long long v11 = [v10 lastObject];

  [v11 setShouldAnchorPreparation:1];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __94__PUActivityItemSourceController__prepareMomentShareLinkFromIndividualItemSourcesForActivity___block_invoke;
  aBlock[3] = &unk_1E5F2E908;
  id v21 = v11;
  uint64_t v22 = self;
  id v23 = v4;
  id v12 = v4;
  id v13 = v11;
  id v14 = _Block_copy(aBlock);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __94__PUActivityItemSourceController__prepareMomentShareLinkFromIndividualItemSourcesForActivity___block_invoke_241;
  v17[3] = &unk_1E5F22988;
  v17[4] = self;
  id v18 = v5;
  id v19 = v14;
  id v15 = v14;
  id v16 = v5;
  [(PUActivityItemSourceController *)self publishLinkForActivityType:v16 completionHandler:v17];
}

void __94__PUActivityItemSourceController__prepareMomentShareLinkFromIndividualItemSourcesForActivity___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) signalAnchorCompletion];
  id v2 = PLShareSheetGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = objc_opt_class();
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    int v7 = 138412802;
    char v8 = v3;
    __int16 v9 = 2048;
    uint64_t v10 = v4;
    __int16 v11 = 2114;
    uint64_t v12 = v5;
    id v6 = v3;
    _os_log_impl(&dword_1AE9F8000, v2, OS_LOG_TYPE_DEFAULT, "<%@:%p>: Finished preparing moment-share link from individual assets for activity: %{public}@", (uint8_t *)&v7, 0x20u);
  }
}

void __94__PUActivityItemSourceController__prepareMomentShareLinkFromIndividualItemSourcesForActivity___block_invoke_241(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  __int16 v9 = [*(id *)(a1 + 32) delegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    if (v7)
    {
      v19[0] = v7;
      __int16 v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
      if (v8)
      {
LABEL_4:
        id v18 = v8;
        uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
LABEL_8:
        uint64_t v13 = [*(id *)(a1 + 32) delegate];
        uint64_t v14 = *(void *)(a1 + 32);
        uint64_t v15 = *(void *)(a1 + 40);
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __94__PUActivityItemSourceController__prepareMomentShareLinkFromIndividualItemSourcesForActivity___block_invoke_2;
        v16[3] = &unk_1E5F2EBA0;
        id v17 = *(id *)(a1 + 48);
        [v13 activityItemSourceController:v14 didFinishPreparationForActivityType:v15 preparationType:1 withItems:v11 didCancel:a3 errors:v12 completion:v16];

        goto LABEL_9;
      }
    }
    else
    {
      __int16 v11 = 0;
      if (v8) {
        goto LABEL_4;
      }
    }
    uint64_t v12 = 0;
    goto LABEL_8;
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_9:
}

uint64_t __94__PUActivityItemSourceController__prepareMomentShareLinkFromIndividualItemSourcesForActivity___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_prepareIndividualItemSourcesForActivity:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 activityType];
  id v6 = PLShareSheetGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_DEFAULT, "Performing per-item preparations", buf, 2u);
  }

  id v7 = [(PUActivityItemSourceController *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    __int16 v9 = [(PUActivityItemSourceController *)self delegate];
    [v9 activityItemSourceController:self willBeginPreparationWithActivityType:v5 preparationType:0];
  }
  self->_momentSharePublishAttempted = 0;
  char v10 = [(PUActivityItemSourceController *)self assetItemSources];
  __int16 v11 = [v10 lastObject];

  if (v11)
  {
    dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __75__PUActivityItemSourceController__prepareIndividualItemSourcesForActivity___block_invoke;
    v26[3] = &unk_1E5F2ED10;
    uint64_t v13 = v12;
    char v27 = v13;
    [v11 setPostCompletionHandler:v26];
  }
  else
  {
    uint64_t v13 = 0;
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __75__PUActivityItemSourceController__prepareIndividualItemSourcesForActivity___block_invoke_2;
  aBlock[3] = &unk_1E5F2E908;
  id v23 = v13;
  uint64_t v24 = self;
  id v25 = v4;
  id v14 = v4;
  uint64_t v15 = v13;
  id v16 = _Block_copy(aBlock);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  void v19[2] = __75__PUActivityItemSourceController__prepareIndividualItemSourcesForActivity___block_invoke_236;
  v19[3] = &unk_1E5F22960;
  v19[4] = self;
  id v20 = v5;
  id v21 = v16;
  id v17 = v16;
  id v18 = v5;
  [(PUActivityItemSourceController *)self runExplicitly:0 withActivityType:v18 completionHandler:v19];
}

intptr_t __75__PUActivityItemSourceController__prepareIndividualItemSourcesForActivity___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 32), 0xFFFFFFFFFFFFFFFFLL);
}

void __75__PUActivityItemSourceController__prepareIndividualItemSourcesForActivity___block_invoke_2(void *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = a1[4];
  if (v2) {
    dispatch_semaphore_signal(v2);
  }
  uint64_t v3 = PLShareSheetGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = objc_opt_class();
    uint64_t v5 = a1[5];
    uint64_t v6 = a1[6];
    int v8 = 138412802;
    __int16 v9 = v4;
    __int16 v10 = 2048;
    uint64_t v11 = v5;
    __int16 v12 = 2114;
    uint64_t v13 = v6;
    id v7 = v4;
    _os_log_impl(&dword_1AE9F8000, v3, OS_LOG_TYPE_DEFAULT, "<%@:%p>: Finished preparing assets for activity: %{public}@", (uint8_t *)&v8, 0x20u);
  }
}

void __75__PUActivityItemSourceController__prepareIndividualItemSourcesForActivity___block_invoke_236(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  __int16 v9 = [*(id *)(a1 + 32) delegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    uint64_t v11 = [*(id *)(a1 + 32) delegate];
    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v13 = *(void *)(a1 + 40);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __75__PUActivityItemSourceController__prepareIndividualItemSourcesForActivity___block_invoke_2_239;
    v14[3] = &unk_1E5F2EBA0;
    id v15 = *(id *)(a1 + 48);
    [v11 activityItemSourceController:v12 didFinishPreparationForActivityType:v13 preparationType:0 withItems:v7 didCancel:a3 errors:v8 completion:v14];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t __75__PUActivityItemSourceController__prepareIndividualItemSourcesForActivity___block_invoke_2_239(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)configureItemSourcesForActivityIfNeeded:(id)a3 forcePreparationAsMomentShareLink:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (![(PUActivityItemSourceController *)self preferredPreparationType])
  {
    id v7 = [(PUActivityItemSourceController *)self assetItemSources];
    uint64_t v8 = [v7 count];

    __int16 v9 = PLShareSheetGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t v13 = 138413058;
      *(void *)&v13[4] = objc_opt_class();
      *(_WORD *)&v13[12] = 2048;
      *(void *)&v13[14] = self;
      *(_WORD *)&v13[22] = 2048;
      uint64_t v14 = v8;
      LOWORD(v15) = 2114;
      *(void *)((char *)&v15 + 2) = v6;
      id v10 = *(id *)&v13[4];
      _os_log_impl(&dword_1AE9F8000, v9, OS_LOG_TYPE_DEFAULT, "<%@:%p>: Begin preparing %ld assets for activity: %{public}@", v13, 0x2Au);
    }
    uint64_t v11 = [v6 activityType];
    BOOL v12 = +[PUActivityItemSourceConfiguration isIndividualItemPreparationSupportedByActivityType:v11];

    if (!v12 || v4) {
      -[PUActivityItemSourceController _prepareMomentShareLinkFromIndividualItemSourcesForActivity:](self, "_prepareMomentShareLinkFromIndividualItemSourcesForActivity:", v6, *(_OWORD *)v13, *(void *)&v13[16], v14, v15);
    }
    else {
      [(PUActivityItemSourceController *)self _prepareIndividualItemSourcesForActivity:v6];
    }
  }
}

- (unint64_t)unsavedSyndicatedAssetCount
{
  return self->_unsavedSyndicatedAssetCount;
}

- (BOOL)isPreparingIndividualItems
{
  unint64_t v3 = [(PUActivityItemSourceController *)self preferredPreparationType];
  BOOL v4 = [(PUActivityItemSourceController *)self assets];
  uint64_t v5 = [v4 count];

  if (v3) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v5 == 0;
  }
  return !v6;
}

- (PXAssetMediaTypeCount)requestAssetsMediaTypeCount
{
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x2020000000;
  uint64_t v50 = 0;
  uint64_t v43 = 0;
  uint64_t v44 = &v43;
  uint64_t v45 = 0x2020000000;
  uint64_t v46 = 0;
  uint64_t v39 = 0;
  uint64_t v40 = &v39;
  uint64_t v41 = 0x2020000000;
  uint64_t v42 = 0;
  uint64_t v35 = 0;
  id v36 = &v35;
  uint64_t v37 = 0x2020000000;
  uint64_t v38 = 0;
  uint64_t v31 = 0;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x2020000000;
  uint64_t v34 = 0;
  uint64_t v27 = 0;
  BOOL v28 = &v27;
  uint64_t v29 = 0x2020000000;
  uint64_t v30 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x2020000000;
  uint64_t v26 = 0;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  assetItems = self->_assetItems;
  uint64_t v18 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __61__PUActivityItemSourceController_requestAssetsMediaTypeCount__block_invoke;
  v14[3] = &unk_1E5F22938;
  void v14[4] = &v27;
  v14[5] = &v23;
  v14[6] = &v19;
  v14[7] = &v15;
  v14[8] = &v47;
  v14[9] = &v43;
  v14[10] = &v39;
  v14[11] = &v35;
  v14[12] = &v31;
  [(NSMutableOrderedSet *)assetItems enumerateObjectsUsingBlock:v14];
  unint64_t v5 = v44[3];
  unint64_t v6 = v40[3];
  unint64_t v7 = v36[3];
  unint64_t v8 = v32[3];
  unint64_t v9 = v28[3];
  unint64_t v10 = v24[3];
  unint64_t v11 = v20[3];
  unint64_t v12 = v16[3];
  retstr->var0 = v48[3];
  retstr->var1 = v5;
  retstr->var2 = v6;
  retstr->var3 = v7;
  retstr->var4 = v8;
  retstr->var5 = v9;
  retstr->var6 = v10;
  retstr->var7 = v11;
  retstr->var8 = v12;
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v47, 8);
  return result;
}

void __61__PUActivityItemSourceController_requestAssetsMediaTypeCount__block_invoke(void *a1, void *a2)
{
  id v13 = a2;
  unint64_t v3 = [v13 asset];
  uint64_t v4 = [v3 playbackStyle];
  unint64_t v5 = [v3 location];

  if (v5)
  {
    ++*(void *)(*(void *)(a1[4] + 8) + 24);
    if ([v13 excludeLocation]) {
      ++*(void *)(*(void *)(a1[5] + 8) + 24);
    }
  }
  unint64_t v6 = [v3 descriptionProperties];
  unint64_t v7 = [v6 assetDescription];
  uint64_t v8 = [v7 length];

  if (v8) {
    ++*(void *)(*(void *)(a1[6] + 8) + 24);
  }
  unint64_t v9 = [v3 descriptionProperties];
  unint64_t v10 = [v9 accessibilityDescription];
  uint64_t v11 = [v10 length];

  if (v11) {
    ++*(void *)(*(void *)(a1[7] + 8) + 24);
  }
  if ((unint64_t)(v4 - 1) <= 2) {
    ++*(void *)(*(void *)(a1[8] + 8) + 24);
  }
  if ((v4 & 0xFFFFFFFFFFFFFFFELL) == 4) {
    ++*(void *)(*(void *)(a1[9] + 8) + 24);
  }
  if (v4 == 3)
  {
    ++*(void *)(*(void *)(a1[11] + 8) + 24);
    if (![v13 excludeLiveness]) {
      goto LABEL_18;
    }
    unint64_t v12 = a1 + 12;
  }
  else
  {
    if (v4 != 5) {
      goto LABEL_18;
    }
    unint64_t v12 = a1 + 10;
  }
  ++*(void *)(*(void *)(*v12 + 8) + 24);
LABEL_18:
}

- (NSOrderedSet)assets
{
  return (NSOrderedSet *)[(NSMutableOrderedSet *)self->_assetItems valueForKey:@"asset"];
}

- (void)updateState
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(PUActivityItemSourceController *)self cmmActivityItemSource];
  uint64_t v4 = [v3 state];

  if (v4)
  {
    if (v4 == 2) {
      uint64_t v5 = 2;
    }
    else {
      uint64_t v5 = v4 == 1;
    }
  }
  else
  {
    unint64_t v6 = [(PUActivityItemSourceController *)self activeItemSources];
    uint64_t v7 = [v6 count];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = 0;
      uint64_t v12 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v8);
          }
          if ([*(id *)(*((void *)&v15 + 1) + 8 * i) state] == 1) {
            ++v11;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }
    else
    {
      uint64_t v11 = 0;
    }

    if (v7)
    {
      if (v11) {
        uint64_t v5 = 1;
      }
      else {
        uint64_t v5 = 2;
      }
      if (v7 != 1 && [(PUActivityItemSourceController *)self state] == 1) {
        uint64_t v5 = 1;
      }
    }
    else
    {
      uint64_t v5 = 0;
    }
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __45__PUActivityItemSourceController_updateState__block_invoke;
  v14[3] = &__block_descriptor_40_e49_v16__0___PUMutableActivityItemSourceController__8l;
  void v14[4] = v5;
  [(PUActivityItemSourceController *)self performChanges:v14];
}

uint64_t __45__PUActivityItemSourceController_updateState__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setState:*(void *)(a1 + 32)];
}

- (void)setState:(unint64_t)a3
{
  externalIsolation = self->_externalIsolation;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __43__PUActivityItemSourceController_setState___block_invoke;
  v4[3] = &unk_1E5F2E0A8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(externalIsolation, v4);
}

uint64_t __43__PUActivityItemSourceController_setState___block_invoke(uint64_t result)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(result + 32) + 192) != *(void *)(result + 40))
  {
    uint64_t v1 = result;
    id v2 = PLShareSheetGetLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v3 = *(void *)(*(void *)(v1 + 32) + 192);
      if (v3 > 2) {
        uint64_t v4 = @"unknown";
      }
      else {
        uint64_t v4 = off_1E5F22A48[v3];
      }
      unint64_t v5 = *(void *)(v1 + 40);
      if (v5 > 2) {
        unint64_t v6 = @"unknown";
      }
      else {
        unint64_t v6 = off_1E5F22A48[v5];
      }
      int v7 = 138543618;
      id v8 = v4;
      __int16 v9 = 2114;
      uint64_t v10 = v6;
      _os_log_impl(&dword_1AE9F8000, v2, OS_LOG_TYPE_DEFAULT, "PUActivityItemSourceController changing state from %{public}@ to %{public}@", (uint8_t *)&v7, 0x16u);
    }

    *(void *)(*(void *)(v1 + 32) + 192) = *(void *)(v1 + 40);
    return [*(id *)(v1 + 32) signalChange:1];
  }
  return result;
}

- (void)setActiveItemSources:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (NSArray *)a3;
  unint64_t v5 = self;
  objc_sync_enter(v5);
  activeItemSources = v5->_activeItemSources;
  if (activeItemSources != v4)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    int v7 = activeItemSources;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v22;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v22 != v9) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v21 + 1) + 8 * v10++) unregisterChangeObserver:v5 context:&PUActivityItemSourceControllerItemSourceObserverContext];
        }
        while (v8 != v10);
        uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v8);
    }

    uint64_t v11 = [(NSArray *)v4 copy];
    uint64_t v12 = v5->_activeItemSources;
    v5->_activeItemSources = (NSArray *)v11;

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v13 = v5->_activeItemSources;
    uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v18;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v18 != v15) {
            objc_enumerationMutation(v13);
          }
          objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v16++), "registerChangeObserver:context:", v5, &PUActivityItemSourceControllerItemSourceObserverContext, (void)v17);
        }
        while (v14 != v16);
        uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v14);
    }
  }
  objc_sync_exit(v5);
}

- (NSArray)activeItemSources
{
  id v2 = self;
  objc_sync_enter(v2);
  unint64_t v3 = v2->_activeItemSources;
  objc_sync_exit(v2);

  return v3;
}

- (void)removeAssetItem:(id)a3
{
  id v5 = a3;
  if (![(NSMutableOrderedSet *)self->_assetItems containsObject:v5]) {
    goto LABEL_13;
  }
  [(NSMutableOrderedSet *)self->_assetItems removeObject:v5];
  unint64_t v6 = [v5 asset];
  if ([v6 sourceType] == 2)
  {
    p_unint64_t cloudSharedAssetCount = &self->_cloudSharedAssetCount;
    unint64_t cloudSharedAssetCount = self->_cloudSharedAssetCount;
LABEL_5:
    void *p_cloudSharedAssetCount = cloudSharedAssetCount - 1;
    goto LABEL_6;
  }
  unint64_t cloudSharedAssetCount = [v6 sourceType];
  p_unint64_t cloudSharedAssetCount = &self->_momentShareAssetCount;
  if (cloudSharedAssetCount == self->_momentShareAssetCount) {
    goto LABEL_5;
  }
LABEL_6:
  if (objc_msgSend(v6, "px_isUnsavedSyndicatedAsset")) {
    --self->_unsavedSyndicatedAssetCount;
  }
  uint64_t v9 = [(PUActivityItemSourceController *)self appPhotoLibrary];
  uint64_t v10 = [v9 photoLibraryURL];

  uint64_t v11 = [v6 photoLibrary];
  uint64_t v12 = [v11 photoLibraryURL];

  if (([v12 isEqual:v10] & 1) == 0) {
    --self->_externalLibraryAssetCount;
  }
  assetItemSources = self->_assetItemSources;
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  long long v18 = __50__PUActivityItemSourceController_removeAssetItem___block_invoke;
  long long v19 = &unk_1E5F228F0;
  id v20 = v5;
  uint64_t v14 = [(NSMutableOrderedSet *)assetItemSources indexOfObjectPassingTest:&v16];
  if (v14 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PUActivityItemSourceController.m", 364, @"Invalid parameter not satisfying: %@", @"idx != NSNotFound", v16, v17, v18, v19 object file lineNumber description];
  }
  [(NSMutableOrderedSet *)self->_assetItemSources removeObjectAtIndex:v14];

LABEL_13:
}

uint64_t __50__PUActivityItemSourceController_removeAssetItem___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3 = [a2 asset];
  uint64_t v4 = [*(id *)(a1 + 32) asset];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

- (void)addAssetItem:(id)a3
{
  id v5 = a3;
  id v19 = v5;
  if (!v5)
  {
    long long v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"PUActivityItemSourceController.m", 307, @"Invalid parameter not satisfying: %@", @"assetItem" object file lineNumber description];

    id v5 = 0;
  }
  if (([(NSMutableOrderedSet *)self->_assetItems containsObject:v5] & 1) == 0)
  {
    assetItems = self->_assetItems;
    if (!assetItems)
    {
      int v7 = [MEMORY[0x1E4F1CA70] orderedSet];
      uint64_t v8 = self->_assetItems;
      self->_assetItems = v7;

      assetItems = self->_assetItems;
    }
    [(NSMutableOrderedSet *)assetItems addObject:v19];
    uint64_t v9 = [v19 asset];
    if ([v9 sourceType] == 2)
    {
      uint64_t v10 = &OBJC_IVAR___PUActivityItemSourceController__cloudSharedAssetCount;
    }
    else
    {
      if ([v9 sourceType] != 8)
      {
LABEL_11:
        if (objc_msgSend(v9, "px_isUnsavedSyndicatedAsset")) {
          ++self->_unsavedSyndicatedAssetCount;
        }
        uint64_t v11 = [(PUActivityItemSourceController *)self appPhotoLibrary];
        uint64_t v12 = [v11 photoLibraryURL];

        id v13 = [v9 photoLibrary];
        uint64_t v14 = [v13 photoLibraryURL];

        if (([v14 isEqual:v12] & 1) == 0) {
          ++self->_externalLibraryAssetCount;
        }
        uint64_t v15 = [(PUActivityItemSourceController *)self synthesizedSharingPreferencesForAssetItem:v19];
        uint64_t v17 = -[PUActivityItemSource initWithAsset:sharingPreferences:]([PUActivityItemSource alloc], "initWithAsset:sharingPreferences:", v9, v15, v16);
        [(NSMutableOrderedSet *)self->_assetItemSources addObject:v17];

        goto LABEL_16;
      }
      uint64_t v10 = &OBJC_IVAR___PUActivityItemSourceController__momentShareAssetCount;
    }
    ++*(Class *)((char *)&self->super.super.isa + *v10);
    goto LABEL_11;
  }
LABEL_16:
}

- ($9D9B13A340AA60ED2DD68408BD7D962F)synthesizedSharingPreferencesForAssetItem:(id)a3
{
  id v4 = a3;
  if ([v4 excludeLiveness]) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = [(PUActivityItemSourceController *)self shouldExcludeLivenessInAllItemSources];
  }
  if ([v4 excludeLocation])
  {
    uint64_t v6 = 256;
  }
  else if ([(PUActivityItemSourceController *)self shouldExcludeLocationInAllItemSources])
  {
    uint64_t v6 = 256;
  }
  else
  {
    uint64_t v6 = 0;
  }
  if ([v4 excludeCaption])
  {
    uint64_t v7 = 0x10000;
  }
  else if ([(PUActivityItemSourceController *)self shouldExcludeCaptionInAllItemSources])
  {
    uint64_t v7 = 0x10000;
  }
  else
  {
    uint64_t v7 = 0;
  }
  if ([v4 excludeAccessibilityDescription])
  {
    uint64_t v8 = 0x1000000;
  }
  else if ([(PUActivityItemSourceController *)self shouldExcludeAccessibilityDescriptionInAllItemSources])
  {
    uint64_t v8 = 0x1000000;
  }
  else
  {
    uint64_t v8 = 0;
  }
  BOOL v9 = [(PUActivityItemSourceController *)self shouldShareAsAssetBundles];
  BOOL v10 = [(PUActivityItemSourceController *)self shouldShareAsUnmodifiedOriginals];
  int64_t v11 = [(PUActivityItemSourceController *)self preferredExportFormat];
  uint64_t v12 = 0x10000000000;
  if (!v10) {
    uint64_t v12 = 0;
  }
  uint64_t v13 = 0x100000000;
  if (!v9) {
    uint64_t v13 = 0;
  }
  uint64_t v14 = v6 | v5 | v7 | v8 | v13 | v12;

  BOOL v15 = v14;
  int64_t v16 = v11;
  result.var6 = v16;
  result.var0 = v15;
  result.var1 = BYTE1(v15);
  result.var2 = BYTE2(v15);
  result.var3 = BYTE3(v15);
  result.var4 = BYTE4(v15);
  result.var5 = BYTE5(v15);
  return result;
}

- (void)updateSharingPreferencesInItemSources
{
  assetItems = self->_assetItems;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __71__PUActivityItemSourceController_updateSharingPreferencesInItemSources__block_invoke;
  v3[3] = &unk_1E5F228C8;
  v3[4] = self;
  [(NSMutableOrderedSet *)assetItems enumerateObjectsUsingBlock:v3];
}

void __71__PUActivityItemSourceController_updateSharingPreferencesInItemSources__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 104);
  id v6 = a2;
  uint64_t v7 = [v5 objectAtIndexedSubscript:a3];
  uint64_t v8 = [*(id *)(a1 + 32) synthesizedSharingPreferencesForAssetItem:v6];
  uint64_t v10 = v9;

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __71__PUActivityItemSourceController_updateSharingPreferencesInItemSources__block_invoke_2;
  v11[3] = &__block_descriptor_48_e39_v16__0___PUMutableActivityItemSource__8l;
  v11[4] = v8;
  v11[5] = v10;
  [v7 performChanges:v11];
}

uint64_t __71__PUActivityItemSourceController_updateSharingPreferencesInItemSources__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSharingPreferences:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (void)setPreferredExportFormat:(int64_t)a3
{
  if (self->_preferredExportFormat != a3)
  {
    self->_preferredExportFormat = a3;
    [(PUActivityItemSourceController *)self updateSharingPreferencesInItemSources];
  }
}

- (void)setShouldShareAsUnmodifiedOriginals:(BOOL)a3
{
  if (self->_shouldShareAsUnmodifiedOriginals != a3)
  {
    self->_shouldShareAsUnmodifiedOriginals = a3;
    [(PUActivityItemSourceController *)self updateSharingPreferencesInItemSources];
  }
}

- (void)setShouldShareAsAssetBundles:(BOOL)a3
{
  if (self->_shouldShareAsAssetBundles != a3)
  {
    self->_shouldShareAsAssetBundles = a3;
    [(PUActivityItemSourceController *)self updateSharingPreferencesInItemSources];
  }
}

- (void)setShouldExcludeAccessibilityDescriptionInAllItemSources:(BOOL)a3
{
  if (self->_shouldExcludeAccessibilityDescriptionInAllItemSources != a3)
  {
    self->_shouldExcludeAccessibilityDescriptionInAllItemSources = a3;
    [(PUActivityItemSourceController *)self updateSharingPreferencesInItemSources];
  }
}

- (void)setShouldExcludeCaptionInAllItemSources:(BOOL)a3
{
  if (self->_shouldExcludeCaptionInAllItemSources != a3)
  {
    self->_shouldExcludeCaptionInAllItemSources = a3;
    [(PUActivityItemSourceController *)self updateSharingPreferencesInItemSources];
  }
}

- (void)setShouldExcludeLocationInAllItemSources:(BOOL)a3
{
  if (self->_shouldExcludeLocationInAllItemSources != a3)
  {
    self->_shouldExcludeLocationInAllItemSources = a3;
    [(PUActivityItemSourceController *)self updateSharingPreferencesInItemSources];
  }
}

- (void)setShouldExcludeLivenessInAllItemSources:(BOOL)a3
{
  if (self->_shouldExcludeLivenessInAllItemSources != a3)
  {
    self->_shouldExcludeLivenessInAllItemSources = a3;
    [(PUActivityItemSourceController *)self updateSharingPreferencesInItemSources];
  }
}

- (BOOL)itemSourcesSupportSlideshow
{
  return self->_momentShareAssetCount == 0;
}

- (BOOL)itemSourcesSupportMomentShareLinkCreation
{
  return self->_momentShareAssetCount + self->_cloudSharedAssetCount + self->_externalLibraryAssetCount == 0;
}

- (PHPhotoLibrary)appPhotoLibrary
{
  return (PHPhotoLibrary *)objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
}

- (void)setAssetItems:(id)a3
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = self->_assetItems;
  id v6 = (NSMutableOrderedSet *)v4;
  uint64_t v7 = v6;
  if (v5 == v6)
  {
  }
  else
  {
    uint64_t v8 = [(NSMutableOrderedSet *)v5 count];
    if (v8 == [(NSMutableOrderedSet *)v7 count])
    {
      long long v9 = *(_OWORD *)(MEMORY[0x1E4F1D048] + 16);
      *(_OWORD *)&keyCallBacks.version = *MEMORY[0x1E4F1D048];
      *(_OWORD *)&keyCallBacks.release = v9;
      *(_OWORD *)&keyCallBacks.equal = *(_OWORD *)(MEMORY[0x1E4F1D048] + 32);
      keyCallBacks.retain = 0;
      keyCallBacks.release = 0;
      uint64_t v10 = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, &keyCallBacks, 0);
      long long v62 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      uint64_t v5 = v5;
      uint64_t v11 = [(NSMutableOrderedSet *)v5 countByEnumeratingWithState:&v62 objects:buf count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v63;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v63 != v13) {
              objc_enumerationMutation(v5);
            }
            CFDictionarySetValue(v10, (const void *)[*(id *)(*((void *)&v62 + 1) + 8 * i) localIdentifier], 0);
          }
          uint64_t v12 = [(NSMutableOrderedSet *)v5 countByEnumeratingWithState:&v62 objects:buf count:16];
        }
        while (v12);
      }

      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      BOOL v15 = v7;
      uint64_t v16 = [(NSMutableOrderedSet *)v15 countByEnumeratingWithState:&v58 objects:v68 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v59;
        while (2)
        {
          for (uint64_t j = 0; j != v17; ++j)
          {
            if (*(void *)v59 != v18) {
              objc_enumerationMutation(v15);
            }
            if (!CFDictionaryContainsKey(v10, (const void *)[*(id *)(*((void *)&v58 + 1) + 8 * j) localIdentifier]))
            {

              CFRelease(v10);
              goto LABEL_22;
            }
          }
          uint64_t v17 = [(NSMutableOrderedSet *)v15 countByEnumeratingWithState:&v58 objects:v68 count:16];
          if (v17) {
            continue;
          }
          break;
        }
      }

      CFRelease(v10);
    }
    else
    {

LABEL_22:
      id v20 = (NSMutableOrderedSet *)[(NSMutableOrderedSet *)v7 mutableCopy];
      assetItems = self->_assetItems;
      self->_assetItems = v20;

      long long v22 = self->_assetItems;
      if (v22) {
        long long v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA70]), "initWithCapacity:", -[NSMutableOrderedSet count](self->_assetItems, "count"));
      }
      else {
        long long v23 = 0;
      }
      objc_storeStrong((id *)&self->_assetItemSources, v23);
      if (v22) {

      }
      self->_unint64_t cloudSharedAssetCount = 0;
      self->_momentShareAssetCount = 0;
      self->_unsavedSyndicatedAssetCount = 0;
      uint64_t v46 = v7;
      self->_externalLibraryAssetCount = 0;
      long long v24 = [(PUActivityItemSourceController *)self appPhotoLibrary];
      v48 = [v24 photoLibraryURL];

      uint64_t v25 = PLShareSheetGetLog();
      os_signpost_id_t v26 = os_signpost_id_generate(v25);
      uint64_t v27 = v25;
      BOOL v28 = v27;
      if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v28, OS_SIGNPOST_INTERVAL_BEGIN, v26, "SharingVariantsDuration", "", buf, 2u);
      }
      uint64_t v45 = v28;

      uint64_t v29 = dispatch_group_create();
      long long v54 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      obuint64_t j = self->_assetItems;
      uint64_t v30 = [(NSMutableOrderedSet *)obj countByEnumeratingWithState:&v54 objects:v67 count:16];
      if (v30)
      {
        uint64_t v31 = v30;
        uint64_t v32 = *(void *)v55;
        do
        {
          for (uint64_t k = 0; k != v31; ++k)
          {
            if (*(void *)v55 != v32) {
              objc_enumerationMutation(obj);
            }
            uint64_t v34 = *(void **)(*((void *)&v54 + 1) + 8 * k);
            uint64_t v35 = [v34 asset];
            uint64_t v36 = [v35 sourceType];
            p_unint64_t cloudSharedAssetCount = &self->_cloudSharedAssetCount;
            if (v36 == 2
              || (uint64_t v38 = [v35 sourceType],
                  p_unint64_t cloudSharedAssetCount = &self->_momentShareAssetCount,
                  v38 == 8))
            {
              ++*p_cloudSharedAssetCount;
            }
            if (objc_msgSend(v35, "px_isUnsavedSyndicatedAsset")) {
              ++self->_unsavedSyndicatedAssetCount;
            }
            uint64_t v39 = [v35 photoLibrary];
            uint64_t v40 = [v39 photoLibraryURL];

            if (([v40 isEqual:v48] & 1) == 0) {
              ++self->_externalLibraryAssetCount;
            }
            uint64_t v41 = [(PUActivityItemSourceController *)self synthesizedSharingPreferencesForAssetItem:v34];
            uint64_t v43 = -[PUActivityItemSource initWithAsset:sharingPreferences:]([PUActivityItemSource alloc], "initWithAsset:sharingPreferences:", v35, v41, v42);
            dispatch_group_enter(v29);
            v52[0] = MEMORY[0x1E4F143A8];
            v52[1] = 3221225472;
            v52[2] = __48__PUActivityItemSourceController_setAssetItems___block_invoke;
            v52[3] = &unk_1E5F2ED10;
            id v53 = v29;
            [(PUActivityItemSource *)v43 setPpt_didFetchSharingVariantsHandler:v52];
            [(NSMutableOrderedSet *)self->_assetItemSources addObject:v43];
          }
          uint64_t v31 = [(NSMutableOrderedSet *)obj countByEnumeratingWithState:&v54 objects:v67 count:16];
        }
        while (v31);
      }

      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __48__PUActivityItemSourceController_setAssetItems___block_invoke_2;
      block[3] = &unk_1E5F2E0A8;
      uint64_t v50 = v45;
      os_signpost_id_t v51 = v26;
      uint64_t v44 = v45;
      dispatch_group_notify(v29, MEMORY[0x1E4F14428], block);

      uint64_t v7 = v46;
    }
  }
}

void __48__PUActivityItemSourceController_setAssetItems___block_invoke(uint64_t a1)
{
}

void __48__PUActivityItemSourceController_setAssetItems___block_invoke_2(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  unint64_t v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 40);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v3, OS_SIGNPOST_INTERVAL_END, v4, "SharingVariantsDuration", "", v5, 2u);
  }
}

- (NSArray)activityItems
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if ([(PUActivityItemSourceController *)self preferredPreparationType] == 1)
  {
    unint64_t v3 = [(PUActivityItemSourceController *)self cmmActivityItemSource];
    v7[0] = v3;
    os_signpost_id_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  }
  else
  {
    unint64_t v3 = [(PUActivityItemSourceController *)self assetItemSources];
    uint64_t v5 = [v3 array];
    os_signpost_id_t v4 = (void *)[v5 copy];
  }
  return (NSArray *)v4;
}

- (NSOrderedSet)assetItemSources
{
  return (NSOrderedSet *)self->_assetItemSources;
}

- (PUActivityItemSourceController)init
{
  v10.receiver = self;
  v10.super_class = (Class)PUActivityItemSourceController;
  id v2 = [(PUActivityItemSourceController *)&v10 init];
  if (v2)
  {
    unint64_t v3 = [[PUCMMActivityItemSource alloc] initWithActivityItemSourceController:v2];
    cmmActivityItemSource = v2->_cmmActivityItemSource;
    v2->_cmmActivityItemSource = v3;

    [(PUCMMActivityItemSource *)v2->_cmmActivityItemSource setDelegate:v2];
    [(PUCMMActivityItemSource *)v2->_cmmActivityItemSource registerChangeObserver:v2 context:PUActivityItemSourceControllerCMMSourceObserverContext];
    uint64_t v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.PUActivityItemSourceController.isolationQueue", v5);
    externalIsolation = v2->_externalIsolation;
    v2->_externalIsolation = (OS_dispatch_queue *)v6;

    v2->_unint64_t cloudSharedAssetCount = 0;
    v2->_momentShareAssetCount = 0;
    v2->_unsavedSyndicatedAssetCount = 0;
    v2->_externalLibraryAssetCount = 0;
    uint64_t v8 = [MEMORY[0x1E4F905D8] sharedController];
    v2->_powerAssertionIdentifier = [v8 generateAssertionIdentifier];
  }
  return v2;
}

@end