@interface PUActivityViewController
+ (BOOL)_shouldReverseOrderOfSharedItemsInDataSource:(id)a3;
+ (BOOL)cmmAssetCountThresholdIsMetForAssetItems:(id)a3;
+ (BOOL)cmmFileSizeThresholdIsMetForAssetItems:(id)a3;
+ (BOOL)cmmMediaTypeSpecificFileSizeThresholdIsMetForAssetItems:(id)a3;
+ (BOOL)cmmThresholdIsMetForAssetItems:(id)a3;
+ (BOOL)isShareActivity:(id)a3;
+ (BOOL)needsConfidentialityCheckForActivityType:(id)a3;
+ (PUActivityViewController)new;
+ (id)actionSheetPhotosApplicationActivities;
+ (id)defaultActivityTypeOrder;
+ (id)excludedPhotosActivityTypesForPresentationSource:(unint64_t)a3;
+ (id)externalApplicationExcludedPhotosActivityTypes;
+ (id)photosApplicationActivities:(BOOL)a3;
- (BOOL)_activityRequiresUserLibraryAssets:(id)a3;
- (BOOL)_calculateAutomaticCMMSendingBehavior;
- (BOOL)_canCreateCMMWithCurrentItemsForActivity:(id)a3;
- (BOOL)_canShowSendAsAssetBundlesSwitchInObjectManipulationHeader;
- (BOOL)_customizationAvailableForActivityViewController:(id)a3;
- (BOOL)_shouldAutomaticallySendAsCMMForActivity:(id)a3;
- (BOOL)_shouldPresentAirplayAlertForActivity:(id)a3;
- (BOOL)_shouldShowSystemActivityType:(id)a3;
- (BOOL)_shouldSuggestSharingAsCMMForActivity:(id)a3;
- (BOOL)excludeAccessibilityDescription;
- (BOOL)excludeCaption;
- (BOOL)excludeLiveness;
- (BOOL)excludeLocation;
- (BOOL)isActionSheet;
- (BOOL)isReadyForInteraction;
- (BOOL)isUsingCustomItems;
- (BOOL)prepareForDismissingForced:(BOOL)a3;
- (BOOL)sendAsAssetBundles;
- (BOOL)sendAsUnmodifiedOriginals;
- (BOOL)shareAsCMM;
- (BOOL)shouldAutomaticallyUseCMMInMessagesIfThresholdMet;
- (NSArray)photosActivities;
- (NSOrderedSet)assets;
- (NSOrderedSet)orderedSelectedAssets;
- (NSString)localizedSubtitle;
- (NSString)localizedTitle;
- (PHPerson)person;
- (PHPhotoLibrary)photoLibrary;
- (PUActivitySharingController)activitySharingController;
- (PUActivitySharingViewModel)sharingViewModel;
- (PUActivityViewController)init;
- (PUActivityViewController)initWithAssetItems:(id)a3 photosApplicationActivities:(id)a4 linkPresentation:(id)a5;
- (PUActivityViewController)initWithAssetItems:(id)a3 photosApplicationActivities:(id)a4 linkPresentation:(id)a5 assetIdentifiers:(id)a6 sharingViewModel:(id)a7;
- (PUActivityViewControllerDelegate)delegate;
- (PXActivityProgressController)progressController;
- (PXAssetMediaTypeCount)assetTypeCount;
- (PXContentPrivacyController)privacyControllerForContainerCollection;
- (PXDisplayAsset)keyAsset;
- (__CFString)aggregateKey;
- (id)_customizationGroupsForActivityViewController:(id)a3;
- (id)_generateAnalyticsPayloadForSharingEventsToActivityType:(id)a3;
- (id)_titleForActivity:(id)a3;
- (id)ppt_readyToInteractHandler;
- (id)readyToInteractHandler;
- (int64_t)preferredExportFormat;
- (int64_t)sourceOrigin;
- (void)_activity:(id)a3 category:(int64_t)a4 didComplete:(BOOL)a5;
- (void)_adjustPreparationOptionsIfNeededForActivity:(id)a3 withCompletionHandler:(id)a4;
- (void)_cancel;
- (void)_cleanUpActivityState;
- (void)_handlePostReadyToInteractUpdatesIfNeeded;
- (void)_handleShareSheetReadyToInteractCompletion;
- (void)_handleUserCancelWithCompletion:(id)a3;
- (void)_performActivity:(id)a3;
- (void)_prepareActivity:(id)a3;
- (void)_prepareAssetsForActivity:(id)a3 forcePreparationAsMomentShareLink:(BOOL)a4;
- (void)_presentAirPlayAlertIfNeededForActivity:(id)a3 withCompletionHandler:(id)a4;
- (void)_presentCMMSuggestionAlertForActivity:(id)a3 withCompletionHandler:(id)a4;
- (void)_presentConfidentialityWarningIfNeededForActivity:(id)a3 withCompletionHandler:(id)a4;
- (void)_presentSpatialDataLossAlertIfNeededForActivity:(id)a3 withCompletionHandler:(id)a4;
- (void)_presentUnsavedSyndicatedAssetsAlertIfNeededForActivity:(id)a3 forcePreparationAsMomentShareLink:(BOOL)a4 withCompletionHandler:(id)a5;
- (void)_reloadAssetItems;
- (void)_removeRemakerProgressView;
- (void)_sendCPAnalyticsAssetExportPreparationEventWithActivityType:(id)a3 didComplete:(BOOL)a4 error:(id)a5;
- (void)_sendCPAnalyticsShareEventForMultipleSelectionShare;
- (void)_sendCPAnalyticsShareEventWithActivityType:(id)a3 category:(int64_t)a4 didComplete:(BOOL)a5;
- (void)_sharingManagerDidBeginPublishing:(id)a3;
- (void)_sharingStyleDidChangeToExpanded:(id)a3;
- (void)_showRemakerProgressView:(id)a3 forMail:(BOOL)a4 withCancelationHandler:(id)a5;
- (void)_showSharingWasInterruptedForErrors:(id)a3 withIndividualAssets:(id)a4 itemSourcesByAssetUUID:(id)a5 toActivityType:(id)a6 completion:(id)a7;
- (void)_updateSharingHeaderIfNeeded;
- (void)_updateSourceControllerPreferredPreparationBehavior;
- (void)_updateSourceControllerSharingPreferencesInAllItems;
- (void)_updateSyndicatedAssetItemsWithAssets:(id)a3 activityType:(id)a4 withCompletionHandler:(id)a5;
- (void)_updateTopBorderView;
- (void)activityItemSourceController:(id)a3 didFinishPreparationForActivityType:(id)a4 preparationType:(unint64_t)a5 withItems:(id)a6 didCancel:(BOOL)a7 errors:(id)a8 completion:(id)a9;
- (void)activityItemSourceController:(id)a3 willBeginPreparationWithActivityType:(id)a4 preparationType:(unint64_t)a5;
- (void)addAssetItem:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)dealloc;
- (void)mailActivity:(id)a3 displayVideoRemakerProgressView:(id)a4;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)ppt_performActivityOfType:(id)a3;
- (void)removeAssetItem:(id)a3;
- (void)removeProgressUIAnimated:(BOOL)a3 withDelay:(BOOL)a4;
- (void)replaceAssetItem:(id)a3 withAssetItem:(id)a4;
- (void)setActivitySharingController:(id)a3;
- (void)setAggregateKey:(__CFString *)a3;
- (void)setAssetItems:(id)a3;
- (void)setCompletionWithItemsHandler:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExcludeAccessibilityDescription:(BOOL)a3;
- (void)setExcludeCaption:(BOOL)a3;
- (void)setExcludeLiveness:(BOOL)a3;
- (void)setExcludeLocation:(BOOL)a3;
- (void)setExcludedActivityTypes:(id)a3;
- (void)setPhotosCarouselViewController:(id)a3;
- (void)setPpt_readyToInteractHandler:(id)a3;
- (void)setPreferredExportFormat:(int64_t)a3;
- (void)setPrivacyControllerForContainerCollection:(id)a3;
- (void)setProgressController:(id)a3;
- (void)setReadyForInteraction:(BOOL)a3;
- (void)setReadyToInteractHandler:(id)a3;
- (void)setSendAsAssetBundles:(BOOL)a3;
- (void)setSendAsUnmodifiedOriginals:(BOOL)a3;
- (void)setShareAsCMM:(BOOL)a3;
- (void)setShouldAutomaticallyUseCMMInMessagesIfThresholdMet:(BOOL)a3;
- (void)setUsingCustomAssetItems:(BOOL)a3;
- (void)showProgressUIAnimated:(BOOL)a3 withDelay:(BOOL)a4 cancellationHandler:(id)a5;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateProgressUITitle;
- (void)updateVisibleShareActionsIfNeeded;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PUActivityViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privacyControllerForContainerCollection, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_progressController, 0);
  objc_storeStrong((id *)&self->_activitySharingController, 0);
  objc_storeStrong(&self->_ppt_readyToInteractHandler, 0);
  objc_storeStrong(&self->_readyToInteractHandler, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_photosActivities, 0);
  objc_storeStrong((id *)&self->_sharingViewModel, 0);
  objc_storeStrong((id *)&self->_sharingHeaderController, 0);
  objc_storeStrong((id *)&self->_linkPresentation, 0);
  objc_storeStrong((id *)&self->_itemSourceController, 0);
  objc_storeStrong((id *)&self->_topBorderView, 0);
  objc_storeStrong((id *)&self->_remakerProgressView, 0);
}

- (void)setPrivacyControllerForContainerCollection:(id)a3
{
}

- (PXContentPrivacyController)privacyControllerForContainerCollection
{
  return self->_privacyControllerForContainerCollection;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (BOOL)sendAsAssetBundles
{
  return self->_sendAsAssetBundles;
}

- (BOOL)sendAsUnmodifiedOriginals
{
  return self->_sendAsUnmodifiedOriginals;
}

- (int64_t)preferredExportFormat
{
  return self->_preferredExportFormat;
}

- (BOOL)excludeAccessibilityDescription
{
  return self->_excludeAccessibilityDescription;
}

- (BOOL)excludeCaption
{
  return self->_excludeCaption;
}

- (BOOL)excludeLocation
{
  return self->_excludeLocation;
}

- (BOOL)excludeLiveness
{
  return self->_excludeLiveness;
}

- (BOOL)shareAsCMM
{
  return self->_shareAsCMM;
}

- (BOOL)shouldAutomaticallyUseCMMInMessagesIfThresholdMet
{
  return self->_shouldAutomaticallyUseCMMInMessagesIfThresholdMet;
}

- (void)setProgressController:(id)a3
{
}

- (PXActivityProgressController)progressController
{
  return self->_progressController;
}

- (void)setActivitySharingController:(id)a3
{
}

- (PUActivitySharingController)activitySharingController
{
  return self->_activitySharingController;
}

- (void)setUsingCustomAssetItems:(BOOL)a3
{
  self->_usingCustomAssetItems = a3;
}

- (BOOL)isUsingCustomItems
{
  return self->_usingCustomAssetItems;
}

- (void)setPpt_readyToInteractHandler:(id)a3
{
}

- (id)ppt_readyToInteractHandler
{
  return self->_ppt_readyToInteractHandler;
}

- (void)setReadyToInteractHandler:(id)a3
{
}

- (id)readyToInteractHandler
{
  return self->_readyToInteractHandler;
}

- (void)setAggregateKey:(__CFString *)a3
{
  self->_aggregateKey = a3;
}

- (__CFString)aggregateKey
{
  return self->_aggregateKey;
}

- (BOOL)isReadyForInteraction
{
  return self->_readyForInteraction;
}

- (void)setDelegate:(id)a3
{
}

- (PUActivityViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUActivityViewControllerDelegate *)WeakRetained;
}

- (NSArray)photosActivities
{
  return self->_photosActivities;
}

- (PUActivitySharingViewModel)sharingViewModel
{
  return self->_sharingViewModel;
}

- (void)ppt_performActivityOfType:(id)a3
{
  id v4 = a3;
  photosActivities = self->_photosActivities;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__PUActivityViewController_ppt_performActivityOfType___block_invoke;
  v7[3] = &unk_1E5F22D50;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  [(NSArray *)photosActivities enumerateObjectsUsingBlock:v7];
}

void __54__PUActivityViewController_ppt_performActivityOfType___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  id v6 = [v8 activityType];
  int v7 = [v6 isEqualToString:*(void *)(a1 + 32)];

  if (v7)
  {
    [*(id *)(a1 + 40) _performActivity:v8];
    *a4 = 1;
  }
}

- (BOOL)prepareForDismissingForced:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = +[PUPhotoSharingManager sharedInstance];
  int v6 = [v5 prepareForDismissingForced:v3];

  int v7 = [(PUActivityViewController *)self activity];

  if (v7) {
    int v8 = 0;
  }
  else {
    int v8 = v6;
  }
  BOOL v9 = v8 | v3;
  if (v9) {
    [(PUActivityViewController *)self setCompletionWithItemsHandler:0];
  }
  return v9;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v9 = a3;
  if ((v6 & 1) != 0 && (void *)PUActivityViewControllerSourceControllerObserverContext == a5) {
    goto LABEL_3;
  }
  if ((v6 & 1) != 0 && (void *)PUActivityViewControllerViewModelObserverContext == a5)
  {
    [(PUActivityViewController *)self _updateSharingHeaderIfNeeded];
    goto LABEL_9;
  }
  if ((void *)PrivacyControllerObservationContext != a5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PUActivityViewController.m" lineNumber:2426 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  if (v6) {
LABEL_3:
  }
    px_dispatch_on_main_queue();
LABEL_9:
}

uint64_t __57__PUActivityViewController_observable_didChange_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateProgressUITitle];
}

void __57__PUActivityViewController_observable_didChange_context___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) privacyControllerForContainerCollection];
  int v3 = [v2 isLocked];

  if (v3)
  {
    id v4 = PLShareSheetGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1AE9F8000, v4, OS_LOG_TYPE_DEFAULT, "Dismissing share sheet, as the privacy controller associated with share sheet was locked.", v5, 2u);
    }

    [*(id *)(a1 + 32) _cancel];
    [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
  }
}

- (BOOL)_shouldAutomaticallySendAsCMMForActivity:(id)a3
{
  id v4 = a3;
  if ([(PUActivityViewController *)self shouldAutomaticallyUseCMMInMessagesIfThresholdMet]&& ![(PUActivityViewController *)self shareAsCMM]&& [(PUActivityViewController *)self _canCreateCMMWithCurrentItemsForActivity:v4])
  {
    v5 = [v4 activityType];
    if ([v5 isEqualToString:*MEMORY[0x1E4F9F380]])
    {
      char v6 = [(PUActivityItemSourceController *)self->_itemSourceController assetItems];
      char v7 = [(id)objc_opt_class() cmmThresholdIsMetForAssetItems:v6];
    }
    else
    {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)_shouldSuggestSharingAsCMMForActivity:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F90068] sharedInstance];
  uint64_t v6 = [v5 cmmShareSheetBehavior];

  if (v6 == 3
    && ![(PUActivityViewController *)self shareAsCMM]
    && [(PUActivityViewController *)self _canCreateCMMWithCurrentItemsForActivity:v4])
  {
    char v7 = [v4 activityType];
    if (([v7 isEqualToString:*MEMORY[0x1E4F9F380]] & 1) != 0
      || [v7 isEqualToString:*MEMORY[0x1E4F9F370]])
    {
      int v8 = [(PUActivityItemSourceController *)self->_itemSourceController assetItems];
      char v9 = [(id)objc_opt_class() cmmThresholdIsMetForAssetItems:v8];
    }
    else
    {
      char v9 = 0;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (BOOL)_canCreateCMMWithCurrentItemsForActivity:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(PUActivityItemSourceController *)self->_itemSourceController itemSourcesSupportMomentShareLinkCreation];
  uint64_t v6 = [(PUActivityViewController *)self photoLibrary];
  int v7 = PXCMMHasSendAndReceiveCapabilities();

  int v8 = PLCPLIsExceedingPrimarySyncQuota();
  if (!v5 || v7 == 0 || v8 != 0)
  {
    int v11 = v8;
    v12 = PLShareSheetGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      if (v5) {
        v13 = @"NO";
      }
      else {
        v13 = @"YES";
      }
      id v26 = v4;
      v14 = v13;
      if (v7) {
        v15 = @"NO";
      }
      else {
        v15 = @"YES";
      }
      v16 = v15;
      v25 = v14;
      if (v11) {
        v17 = @"YES";
      }
      else {
        v17 = @"NO";
      }
      v18 = v17;
      v19 = v16;
      *(_DWORD *)buf = 138543874;
      v28 = v14;
      id v4 = v26;
      __int16 v29 = 2114;
      v30 = v16;
      __int16 v31 = 2114;
      v32 = v18;
      _os_log_impl(&dword_1AE9F8000, v12, OS_LOG_TYPE_DEFAULT, "CMM creation is not possible because of one or more reasons: \nNot Possible With Current Items: %{public}@\nCMM Unavailable: %{public}@\nCPL Quota Exceeded: %{public}@", buf, 0x20u);
    }
    v20 = [v4 activityType];
    int v21 = [v20 isEqualToString:*MEMORY[0x1E4F9F380]];

    if ((v5 & v7 & v11 & v21 & [(PUActivityItemSourceController *)self->_itemSourceController shouldUseMomentShareLinkInMessagesIfThresholdMet]) != 1)
    {
      BOOL v23 = 0;
      goto LABEL_25;
    }
    v22 = PLShareSheetGetLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AE9F8000, v22, OS_LOG_TYPE_DEFAULT, "User has exceeded their iCloud quota for CMM, but allowing the CMM creation to continue, to show an actionable error message", buf, 2u);
    }
  }
  BOOL v23 = 1;
LABEL_25:

  return v23;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [v6 layoutAttributesForItemAtIndexPath:v7];
  [v8 frame];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  v17 = [(PUActivityViewController *)self view];
  objc_msgSend(v6, "convertRect:toView:", v17, v10, v12, v14, v16);
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  CGFloat v25 = v24;

  self->_lastSelectedActivityFrame.origin.x = v19;
  self->_lastSelectedActivityFrame.origin.y = v21;
  self->_lastSelectedActivityFrame.size.width = v23;
  self->_lastSelectedActivityFrame.size.height = v25;
  if ([MEMORY[0x1E4F9F2E8] instancesRespondToSelector:sel_collectionView_didSelectItemAtIndexPath_])
  {
    v26.receiver = self;
    v26.super_class = (Class)PUActivityViewController;
    [(PUActivityViewController *)&v26 collectionView:v6 didSelectItemAtIndexPath:v7];
  }
}

- (void)_cancel
{
  [(PUActivityItemSourceController *)self->_itemSourceController cancel];
  v3.receiver = self;
  v3.super_class = (Class)PUActivityViewController;
  [(PUActivityViewController *)&v3 _cancel];
}

- (void)_prepareActivity:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PUActivityViewController;
  [(PUActivityViewController *)&v18 _prepareActivity:v4];
  BOOL v5 = [v4 activityType];
  int v6 = [v5 isEqualToString:*MEMORY[0x1E4F9F3C0]];

  if (v6)
  {
    id v7 = [v4 printInteractionController];
    int v8 = PXDefaultPrintInfo();
    [v7 setPrintInfo:v8];
  }
  else
  {
    double v9 = [v4 activityType];
    int v10 = [v9 isEqualToString:*MEMORY[0x1E4F9F380]];

    if (!v10) {
      goto LABEL_6;
    }
    id v7 = [v4 activityViewController];
    [v7 setModalPresentationStyle:17];
  }

LABEL_6:
  if (MEMORY[0x1B3E7C970]())
  {
    double v11 = [(PUActivityItemSourceController *)self->_itemSourceController assets];
    if ([v11 count])
    {
      double v12 = [v11 valueForKey:@"uuid"];
      double v13 = (void *)MEMORY[0x1E4F38EB8];
      double v14 = [v12 array];
      double v15 = [(PUActivityViewController *)self photoLibrary];
      uint64_t v16 = [v13 countOfAssetsWithLocationFromUUIDs:v14 photoLibrary:v15];

      if (v16 >= 1)
      {
        v17 = [v4 activityType];
        plslogGreenTea();
      }
    }
  }
}

- (void)_presentCMMSuggestionAlertForActivity:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int16 v31 = v6;
  if ([v6 conformsToProtocol:&unk_1F084EC78]) {
    int v8 = [(id)objc_opt_class() canPerformActivityAsIndividualItemsInSourceController:self->_itemSourceController];
  }
  else {
    int v8 = 1;
  }
  double v9 = [(PUActivityItemSourceController *)self->_itemSourceController assets];
  int v10 = [v9 array];

  PXMediaTypeForAssets();
  [v10 count];
  double v11 = PXLocalizationKeyForMediaType();
  double v12 = (void *)MEMORY[0x1E4FB1418];
  __int16 v29 = v11;
  double v13 = PULocalizedString(v11);
  double v14 = [v12 alertControllerWithTitle:0 message:v13 preferredStyle:0];

  double v15 = (void *)MEMORY[0x1E4FB1410];
  uint64_t v16 = PULocalizedString(@"SHARING_CMM_SUGGESTION_ACTION_SEND_AS_CMM");
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __88__PUActivityViewController__presentCMMSuggestionAlertForActivity_withCompletionHandler___block_invoke;
  v36[3] = &unk_1E5F2E898;
  id v17 = v7;
  id v37 = v17;
  objc_super v18 = [v15 actionWithTitle:v16 style:0 handler:v36];
  [v14 addAction:v18];

  if (v8)
  {
    objc_msgSend(v10, "count", v29, v6);
    CGFloat v19 = PXLocalizationKeyForMediaType();
    double v20 = (void *)MEMORY[0x1E4FB1410];
    CGFloat v21 = PULocalizedString(v19);
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __88__PUActivityViewController__presentCMMSuggestionAlertForActivity_withCompletionHandler___block_invoke_2;
    v34[3] = &unk_1E5F2E898;
    id v35 = v17;
    double v22 = [v20 actionWithTitle:v21 style:0 handler:v34];
    [v14 addAction:v22];
  }
  CGFloat v23 = (void *)MEMORY[0x1E4FB1410];
  double v24 = PULocalizedString(@"CANCEL");
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __88__PUActivityViewController__presentCMMSuggestionAlertForActivity_withCompletionHandler___block_invoke_3;
  v32[3] = &unk_1E5F2E898;
  id v33 = v17;
  id v25 = v17;
  objc_super v26 = [v23 actionWithTitle:v24 style:1 handler:v32];
  [v14 addAction:v26];

  if (!CGRectIsNull(self->_lastSelectedActivityFrame))
  {
    v27 = [v14 popoverPresentationController];
    objc_msgSend(v27, "setSourceRect:", self->_lastSelectedActivityFrame.origin.x, self->_lastSelectedActivityFrame.origin.y, self->_lastSelectedActivityFrame.size.width, self->_lastSelectedActivityFrame.size.height);
    v28 = [(PUActivityViewController *)self view];
    [v27 setSourceView:v28];

    [v27 setPermittedArrowDirections:3];
  }
  -[PUActivityViewController px_presentOverTopmostPresentedViewController:animated:completion:](self, "px_presentOverTopmostPresentedViewController:animated:completion:", v14, 1, 0, v29);
}

uint64_t __88__PUActivityViewController__presentCMMSuggestionAlertForActivity_withCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __88__PUActivityViewController__presentCMMSuggestionAlertForActivity_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __88__PUActivityViewController__presentCMMSuggestionAlertForActivity_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_presentSpatialDataLossAlertIfNeededForActivity:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = (void (**)(void))a4;
  id v7 = [a3 activityType];
  char v8 = [v7 isEqualToString:*MEMORY[0x1E4F90950]];

  if (v8)
  {
    double v9 = [(PUActivityViewController *)self assets];
    int v10 = [v9 array];

    double v11 = [MEMORY[0x1E4F908D0] defaultPresenterWithViewController:self];
    double v12 = v6;
    PXSharedAlbumsPresentSpatialMediaDataLossAlertIfNeededForAssets();
  }
  else
  {
    v6[2](v6);
  }
}

uint64_t __98__PUActivityViewController__presentSpatialDataLossAlertIfNeededForActivity_withCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_presentUnsavedSyndicatedAssetsAlertIfNeededForActivity:(id)a3 forcePreparationAsMomentShareLink:(BOOL)a4 withCompletionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if ([(PUActivityViewController *)self _activityRequiresUserLibraryAssets:v7])
  {
    double v9 = [(PUActivityViewController *)self assets];
    int v10 = [v9 array];

    double v11 = [MEMORY[0x1E4F908D0] defaultPresenterWithViewController:self];
    objc_initWeak(&location, self);
    id v13 = v8;
    objc_copyWeak(&v14, &location);
    id v12 = v7;
    PXPromptToSaveUnsavedSyndicatedAssetsIfNecessary();

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  else
  {
    (*((void (**)(id, uint64_t))v8 + 2))(v8, 1);
  }
}

void __140__PUActivityViewController__presentUnsavedSyndicatedAssetsAlertIfNeededForActivity_forcePreparationAsMomentShareLink_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (![v7 count])
  {
    id v13 = PLShareSheetGetLog();
    id v14 = v13;
    if (v8)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        uint64_t v15 = objc_opt_class();
        uint64_t v16 = *(void *)(a1 + 40);
        int v25 = 138412802;
        uint64_t v26 = v15;
        __int16 v27 = 2048;
        uint64_t v28 = v16;
        __int16 v29 = 2112;
        id v30 = v8;
        id v17 = "<%@:%p>: No assets to process: %@";
        objc_super v18 = v14;
        os_log_type_t v19 = OS_LOG_TYPE_ERROR;
        uint32_t v20 = 32;
LABEL_10:
        _os_log_impl(&dword_1AE9F8000, v18, v19, v17, (uint8_t *)&v25, v20);
      }
    }
    else if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v21 = objc_opt_class();
      uint64_t v22 = *(void *)(a1 + 40);
      int v25 = 138412546;
      uint64_t v26 = v21;
      __int16 v27 = 2048;
      uint64_t v28 = v22;
      id v17 = "<%@:%p>: No assets to process";
      objc_super v18 = v14;
      os_log_type_t v19 = OS_LOG_TYPE_DEFAULT;
      uint32_t v20 = 22;
      goto LABEL_10;
    }

    (*(void (**)(void, void, uint64_t, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), 0, v23, v24);
    goto LABEL_12;
  }
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    id v12 = [*(id *)(a1 + 32) activityType];
    [WeakRetained _updateSyndicatedAssetItemsWithAssets:v7 activityType:v12 withCompletionHandler:*(void *)(a1 + 48)];
  }
  else
  {
    (*(void (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), 1, v9, v10);
  }
LABEL_12:
}

- (BOOL)_activityRequiresUserLibraryAssets:(id)a3
{
  id v3 = a3;
  id v4 = [v3 activityType];
  char v5 = [v4 isEqualToString:*MEMORY[0x1E4F90928]];

  id v6 = [v3 activityType];
  char v7 = [v6 isEqualToString:*MEMORY[0x1E4F90940]];

  id v8 = [v3 activityType];
  char v9 = [v8 isEqualToString:*MEMORY[0x1E4F90988]];

  uint64_t v10 = [v3 activityType];

  LOBYTE(v3) = [v10 isEqualToString:@"com.apple.NanoTimeKit.CreateWatchFace"];
  return v5 | v7 | v9 | v3;
}

- (void)_updateSyndicatedAssetItemsWithAssets:(id)a3 activityType:(id)a4 withCompletionHandler:(id)a5
{
  id v7 = a3;
  id v8 = (void (**)(id, BOOL))a5;
  uint64_t v9 = [v7 count];
  uint64_t v10 = PLShareSheetGetLog();
  double v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AE9F8000, v11, OS_LOG_TYPE_DEFAULT, "[Share Sheet]: Updated new asset items to process", buf, 2u);
    }

    id v12 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v7];
    id v13 = +[PUActivityAssetItem itemsForAssets:v12];
    [(PUActivityViewController *)self setAssetItems:v13];

    [(PUActivityViewController *)self setUsingCustomAssetItems:1];
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v14 = 0;
      _os_log_impl(&dword_1AE9F8000, v11, OS_LOG_TYPE_ERROR, "[Share Sheet]: No new asset items to process", v14, 2u);
    }
  }
  v8[2](v8, v9 != 0);
}

- (void)_adjustPreparationOptionsIfNeededForActivity:(id)a3 withCompletionHandler:(id)a4
{
  id v7 = a3;
  id v6 = (void (**)(id, uint64_t, uint64_t))a4;
  if ([(PUActivityViewController *)self _shouldAutomaticallySendAsCMMForActivity:v7])
  {
    v6[2](v6, 1, 1);
  }
  else if ([(PUActivityViewController *)self _shouldSuggestSharingAsCMMForActivity:v7])
  {
    [(PUActivityViewController *)self _presentCMMSuggestionAlertForActivity:v7 withCompletionHandler:v6];
  }
  else
  {
    v6[2](v6, 1, 0);
  }
}

- (void)_presentAirPlayAlertIfNeededForActivity:(id)a3 withCompletionHandler:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, uint64_t))a4;
  if (![(PUActivityViewController *)self _shouldPresentAirplayAlertForActivity:v7])
  {
    v8[2](v8, 1);
    goto LABEL_6;
  }
  uint64_t v9 = (void *)MEMORY[0x1E4FB1418];
  uint64_t v10 = PULocalizedString(@"SHARING_AIRPLAY_ERROR_TITLE");
  id v11 = v7;
  if (!v11)
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_super v18 = (objc_class *)objc_opt_class();
    os_log_type_t v19 = NSStringFromClass(v18);
    [v17 handleFailureInMethod:a2, self, @"PUActivityViewController.m", 2013, @"%@ should be an instance inheriting from %@, but it is nil", @"activity", v19 object file lineNumber description];
LABEL_9:

    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    uint32_t v20 = (objc_class *)objc_opt_class();
    os_log_type_t v19 = NSStringFromClass(v20);
    uint64_t v21 = objc_msgSend(v11, "px_descriptionForAssertionMessage");
    [v17 handleFailureInMethod:a2, self, @"PUActivityViewController.m", 2013, @"%@ should be an instance inheriting from %@, but it is %@", @"activity", v19, v21 object file lineNumber description];

    goto LABEL_9;
  }
LABEL_4:
  id v12 = [v11 localizedRouteUnavailabilityMessage];
  id v13 = [v9 alertControllerWithTitle:v10 message:v12 preferredStyle:1];

  id v14 = (void *)MEMORY[0x1E4FB1410];
  uint64_t v15 = PULocalizedString(@"OK");
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __90__PUActivityViewController__presentAirPlayAlertIfNeededForActivity_withCompletionHandler___block_invoke;
  v22[3] = &unk_1E5F2E898;
  uint64_t v23 = v8;
  uint64_t v16 = [v14 actionWithTitle:v15 style:1 handler:v22];
  [v13 addAction:v16];

  [(PUActivityViewController *)self px_presentOverTopmostPresentedViewController:v13 animated:1 completion:0];
LABEL_6:
}

uint64_t __90__PUActivityViewController__presentAirPlayAlertIfNeededForActivity_withCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_performActivity:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__PUActivityViewController__performActivity___block_invoke;
  v6[3] = &unk_1E5F2E1C0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(PUActivityViewController *)self _presentConfidentialityWarningIfNeededForActivity:v5 withCompletionHandler:v6];
}

void __45__PUActivityViewController__performActivity___block_invoke(uint64_t a1, int a2)
{
  v2 = *(void **)(a1 + 32);
  if (a2)
  {
    id v3 = *(void **)(a1 + 40);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __45__PUActivityViewController__performActivity___block_invoke_2;
    v5[3] = &unk_1E5F2E1C0;
    v5[4] = v2;
    id v6 = v3;
    [v2 _presentAirPlayAlertIfNeededForActivity:v6 withCompletionHandler:v5];
  }
  else
  {
    id v4 = *(void **)(a1 + 32);
    [v4 _handleUserCancelWithCompletion:0];
  }
}

void __45__PUActivityViewController__performActivity___block_invoke_2(uint64_t a1, int a2)
{
  v2 = *(void **)(a1 + 32);
  if (a2)
  {
    id v3 = *(void **)(a1 + 40);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __45__PUActivityViewController__performActivity___block_invoke_3;
    v5[3] = &unk_1E5F22CF8;
    v5[4] = v2;
    id v6 = v3;
    [v2 _adjustPreparationOptionsIfNeededForActivity:v6 withCompletionHandler:v5];
  }
  else
  {
    id v4 = *(void **)(a1 + 32);
    [v4 _handleUserCancelWithCompletion:0];
  }
}

void __45__PUActivityViewController__performActivity___block_invoke_3(uint64_t a1, int a2, uint64_t a3)
{
  if (a2)
  {
    id v5 = *(void **)(a1 + 32);
    id v4 = *(void **)(a1 + 40);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __45__PUActivityViewController__performActivity___block_invoke_4;
    v7[3] = &unk_1E5F2BD70;
    void v7[4] = v5;
    id v8 = v4;
    char v9 = a3;
    [v5 _presentUnsavedSyndicatedAssetsAlertIfNeededForActivity:v8 forcePreparationAsMomentShareLink:a3 withCompletionHandler:v7];
  }
  else
  {
    id v6 = *(void **)(a1 + 32);
    [v6 _handleUserCancelWithCompletion:0];
  }
}

void __45__PUActivityViewController__performActivity___block_invoke_4(uint64_t a1, int a2)
{
  v2 = *(void **)(a1 + 32);
  if (a2)
  {
    id v4 = *(void **)(a1 + 40);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __45__PUActivityViewController__performActivity___block_invoke_5;
    v6[3] = &unk_1E5F2DCD0;
    v6[4] = v2;
    id v7 = v4;
    char v8 = *(unsigned char *)(a1 + 48);
    [v2 _presentSpatialDataLossAlertIfNeededForActivity:v7 withCompletionHandler:v6];
  }
  else
  {
    id v5 = *(void **)(a1 + 32);
    [v5 _handleUserCancelWithCompletion:0];
  }
}

__n128 __45__PUActivityViewController__performActivity___block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) _prepareAssetsForActivity:*(void *)(a1 + 40) forcePreparationAsMomentShareLink:*(unsigned __int8 *)(a1 + 48)];
  uint64_t v2 = *(void *)(a1 + 40);
  v6.receiver = *(id *)(a1 + 32);
  v6.super_class = (Class)PUActivityViewController;
  objc_msgSendSuper2(&v6, sel__performActivity_, v2);
  id v3 = (_OWORD *)(*(void *)(a1 + 32) + 1408);
  __n128 result = *(__n128 *)MEMORY[0x1E4F1DB20];
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
  *id v3 = *MEMORY[0x1E4F1DB20];
  v3[1] = v5;
  return result;
}

- (BOOL)_shouldPresentAirplayAlertForActivity:(id)a3
{
  id v5 = a3;
  objc_super v6 = [v5 activityType];
  int v7 = [v6 isEqualToString:*MEMORY[0x1E4F90948]];

  if (!v7)
  {
    LOBYTE(v9) = 0;
    goto LABEL_6;
  }
  id v8 = v5;
  if (!v8)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    id v12 = (objc_class *)objc_opt_class();
    id v13 = NSStringFromClass(v12);
    [v11 handleFailureInMethod:a2, self, @"PUActivityViewController.m", 1962, @"%@ should be an instance inheriting from %@, but it is nil", @"activity", v13 object file lineNumber description];
LABEL_9:

    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    id v14 = (objc_class *)objc_opt_class();
    id v13 = NSStringFromClass(v14);
    uint64_t v15 = objc_msgSend(v8, "px_descriptionForAssertionMessage");
    [v11 handleFailureInMethod:a2, self, @"PUActivityViewController.m", 1962, @"%@ should be an instance inheriting from %@, but it is %@", @"activity", v13, v15 object file lineNumber description];

    goto LABEL_9;
  }
LABEL_4:
  int v9 = [v8 isRouteAvailable] ^ 1;

LABEL_6:
  return v9;
}

- (id)_titleForActivity:(id)a3
{
  if ((id)*MEMORY[0x1E4F9F3E0] == a3)
  {
    id v3 = PULocalizedString(@"SHARING_PHOTOS_ACTION_SHEET");
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)PUActivityViewController;
    id v3 = -[PUActivityViewController _titleForActivity:](&v5, sel__titleForActivity_);
  }
  return v3;
}

- (BOOL)_shouldShowSystemActivityType:(id)a3
{
  uint64_t v3 = _shouldShowSystemActivityType__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&_shouldShowSystemActivityType__onceToken, &__block_literal_global_632);
  }
  char v5 = [(id)_shouldShowSystemActivityType__excludedActivityTypes containsObject:v4];

  return v5 ^ 1;
}

void __58__PUActivityViewController__shouldShowSystemActivityType___block_invoke()
{
  v5[7] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F9F380];
  v5[0] = *MEMORY[0x1E4F9F370];
  v5[1] = v0;
  uint64_t v1 = *MEMORY[0x1E4F9F3C8];
  v5[2] = *MEMORY[0x1E4F9F360];
  v5[3] = v1;
  uint64_t v2 = *MEMORY[0x1E4F9F340];
  v5[4] = *MEMORY[0x1E4F9F350];
  void v5[5] = v2;
  v5[6] = *MEMORY[0x1E4F9F3E8];
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:7];
  id v4 = (void *)_shouldShowSystemActivityType__excludedActivityTypes;
  _shouldShowSystemActivityType__excludedActivityTypes = v3;
}

- (void)setCompletionWithItemsHandler:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__PUActivityViewController_setCompletionWithItemsHandler___block_invoke;
  v7[3] = &unk_1E5F22CD0;
  objc_copyWeak(&v9, &location);
  id v5 = v4;
  id v8 = v5;
  v6.receiver = self;
  v6.super_class = (Class)PUActivityViewController;
  [(PUActivityViewController *)&v6 setCompletionWithItemsHandler:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __58__PUActivityViewController_setCompletionWithItemsHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v16 = a2;
  id v9 = a4;
  id v10 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v12 = [WeakRetained activity];

  uint64_t v13 = [(id)objc_opt_class() activityCategory];
  id v14 = objc_loadWeakRetained((id *)(a1 + 40));
  [v14 _activity:v16 category:v13 didComplete:a3];

  uint64_t v15 = *(void *)(a1 + 32);
  if (v15) {
    (*(void (**)(uint64_t, id, uint64_t, id, id))(v15 + 16))(v15, v16, a3, v9, v10);
  }
}

- (void)activityItemSourceController:(id)a3 didFinishPreparationForActivityType:(id)a4 preparationType:(unint64_t)a5 withItems:(id)a6 didCancel:(BOOL)a7 errors:(id)a8 completion:(id)a9
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a8;
  id v16 = a9;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __147__PUActivityViewController_activityItemSourceController_didFinishPreparationForActivityType_preparationType_withItems_didCancel_errors_completion___block_invoke;
  v21[3] = &unk_1E5F29358;
  BOOL v27 = a7;
  id v22 = v15;
  uint64_t v23 = self;
  id v25 = v13;
  id v26 = v16;
  id v24 = v14;
  id v17 = v13;
  id v18 = v16;
  id v19 = v14;
  id v20 = v15;
  dispatch_async(MEMORY[0x1E4F14428], v21);
}

void __147__PUActivityViewController_activityItemSourceController_didFinishPreparationForActivityType_preparationType_withItems_didCancel_errors_completion___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 72)) {
    BOOL v2 = 0;
  }
  else {
    BOOL v2 = [*(id *)(a1 + 32) count] == 0;
  }
  [*(id *)(a1 + 40) removeProgressUIAnimated:1 withDelay:v2];
  if (*(unsigned char *)(a1 + 72))
  {
    *(unsigned char *)(*(void *)(a1 + 40) + 1394) = 0;
    [*(id *)(a1 + 40) _sendCPAnalyticsAssetExportPreparationEventWithActivityType:*(void *)(a1 + 48) didComplete:0 error:0];
    uint64_t v3 = *(void **)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 64);
    [v3 _handleUserCancelWithCompletion:v4];
  }
  else if ([*(id *)(a1 + 32) count])
  {
    id v5 = [*(id *)(a1 + 56) assetItems];
    objc_super v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    int v7 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __147__PUActivityViewController_activityItemSourceController_didFinishPreparationForActivityType_preparationType_withItems_didCancel_errors_completion___block_invoke_2;
    v19[3] = &unk_1E5F22CA8;
    id v20 = v6;
    id v21 = *(id *)(a1 + 56);
    id v22 = v7;
    id v8 = v7;
    id v9 = v6;
    [v5 enumerateObjectsUsingBlock:v19];
    id v11 = *(void **)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 48);
    id v12 = [*(id *)(a1 + 32) firstObject];
    [v11 _sendCPAnalyticsAssetExportPreparationEventWithActivityType:v10 didComplete:0 error:v12];

    uint64_t v14 = *(void *)(a1 + 32);
    id v13 = *(void **)(a1 + 40);
    uint64_t v15 = *(void *)(a1 + 48);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __147__PUActivityViewController_activityItemSourceController_didFinishPreparationForActivityType_preparationType_withItems_didCancel_errors_completion___block_invoke_3;
    v17[3] = &unk_1E5F2EA60;
    v17[4] = v13;
    id v18 = *(id *)(a1 + 64);
    [v13 _showSharingWasInterruptedForErrors:v14 withIndividualAssets:v9 itemSourcesByAssetUUID:v8 toActivityType:v15 completion:v17];
  }
  else
  {
    *(unsigned char *)(*(void *)(a1 + 40) + 1394) = 0;
    *(unsigned char *)(*(void *)(a1 + 40) + 1395) = 1;
    [*(id *)(a1 + 40) _sendCPAnalyticsAssetExportPreparationEventWithActivityType:*(void *)(a1 + 48) didComplete:1 error:0];
    id v16 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    v16();
  }
}

void __147__PUActivityViewController_activityItemSourceController_didFinishPreparationForActivityType_preparationType_withItems_didCancel_errors_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 asset];
  if (v3)
  {
    int v7 = v3;
    [*(id *)(a1 + 32) addObject:v3];
    uint64_t v4 = [*(id *)(a1 + 40) activityItemSourceForAsset:v7];
    if (v4)
    {
      id v5 = *(void **)(a1 + 48);
      objc_super v6 = [v7 uuid];
      [v5 setObject:v4 forKeyedSubscript:v6];
    }
    uint64_t v3 = v7;
  }
}

uint64_t __147__PUActivityViewController_activityItemSourceController_didFinishPreparationForActivityType_preparationType_withItems_didCancel_errors_completion___block_invoke_3(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1394) = 0;
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)activityItemSourceController:(id)a3 willBeginPreparationWithActivityType:(id)a4 preparationType:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (a5 != 1)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __110__PUActivityViewController_activityItemSourceController_willBeginPreparationWithActivityType_preparationType___block_invoke;
    v14[3] = &unk_1E5F2ED10;
    id v10 = v8;
    id v15 = v10;
    [(PUActivityViewController *)self showProgressUIAnimated:1 withDelay:1 cancellationHandler:v14];
    objc_initWeak(&location, self);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __110__PUActivityViewController_activityItemSourceController_willBeginPreparationWithActivityType_preparationType___block_invoke_2;
    v11[3] = &unk_1E5F28C60;
    objc_copyWeak(&v12, &location);
    [v10 setProgressHandler:v11];
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

uint64_t __110__PUActivityViewController_activityItemSourceController_willBeginPreparationWithActivityType_preparationType___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

void __110__PUActivityViewController_activityItemSourceController_willBeginPreparationWithActivityType_preparationType___block_invoke_2(uint64_t a1, double a2)
{
  objc_copyWeak(v3, (id *)(a1 + 32));
  v3[1] = *(id *)&a2;
  px_dispatch_on_main_queue();
  objc_destroyWeak(v3);
}

void __110__PUActivityViewController_activityItemSourceController_willBeginPreparationWithActivityType_preparationType___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v2 = [WeakRetained progressController];
  [v2 setFractionCompleted:*(double *)(a1 + 40)];
}

- (id)_customizationGroupsForActivityViewController:(id)a3
{
  v134[1] = *MEMORY[0x1E4F143B8];
  id v99 = a3;
  v103 = [MEMORY[0x1E4F1CA48] array];
  v101 = [MEMORY[0x1E4F90068] sharedInstance];
  uint64_t v4 = [MEMORY[0x1E4F906A0] sharedInstance];
  id v5 = [(PUActivityItemSourceController *)self->_itemSourceController assets];
  v102 = [v5 array];

  uint64_t v128 = 0;
  long long v126 = 0u;
  long long v127 = 0u;
  long long v124 = 0u;
  long long v125 = 0u;
  itemSourceController = self->_itemSourceController;
  if (itemSourceController) {
    [(PUActivityItemSourceController *)itemSourceController requestAssetsMediaTypeCount];
  }
  PXMediaTypeForAssets();
  BOOL v100 = [(PUActivityViewController *)self _canShowSendAsAssetBundlesSwitchInObjectManipulationHeader];
  objc_initWeak(&location, self);
  int v7 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v8 = *((void *)&v125 + 1);
  int v9 = [v4 showGlobalLivenessExclusionSwitch];
  if (v8) {
    int v10 = v9;
  }
  else {
    int v10 = 0;
  }
  if (v10 == 1)
  {
    if (v8 == 1) {
      id v11 = @"SHARING_OPTIONS_LIVE_PHOTO_TITLE";
    }
    else {
      id v11 = @"SHARING_OPTIONS_LIVE_PHOTO_TITLE_MULTIPLE";
    }
    id v12 = PULocalizedString(v11);
    id v13 = (void *)MEMORY[0x1E4F9F320];
    BOOL v14 = [(PUActivityViewController *)self excludeLiveness];
    v121[0] = MEMORY[0x1E4F143A8];
    v121[1] = 3221225472;
    v121[2] = __74__PUActivityViewController__customizationGroupsForActivityViewController___block_invoke;
    v121[3] = &unk_1E5F22C30;
    objc_copyWeak(&v122, &location);
    id v15 = [v13 switchCustomizationWithTitle:v12 identifier:@"SHARING_OPTIONS_LIVE_PHOTO" footerText:0 value:!v14 valueChangedHandler:v121];
    [v7 addObject:v15];

    objc_destroyWeak(&v122);
  }
  uint64_t v16 = *((void *)&v126 + 1);
  int v17 = [v4 showGlobalLocationExclusionSwitch];
  if (v16) {
    int v18 = v17;
  }
  else {
    int v18 = 0;
  }
  if (v18 == 1)
  {
    BOOL v19 = [(PUActivityViewController *)self sendAsAssetBundles];
    id v20 = (void *)MEMORY[0x1E4F9F320];
    id v21 = PULocalizedString(@"SHARING_OPTIONS_LOCATION_TITLE");
    if (v19) {
      uint64_t v22 = 1;
    }
    else {
      uint64_t v22 = [(PUActivityViewController *)self excludeLocation] ^ 1;
    }
    v119[0] = MEMORY[0x1E4F143A8];
    v119[1] = 3221225472;
    v119[2] = __74__PUActivityViewController__customizationGroupsForActivityViewController___block_invoke_2;
    v119[3] = &unk_1E5F22C30;
    objc_copyWeak(&v120, &location);
    uint64_t v23 = [v20 switchCustomizationWithTitle:v21 identifier:@"SHARING_OPTIONS_LOCATION_TITLE" footerText:0 value:v22 valueChangedHandler:v119];

    [v23 setEnabled:!v19];
    if (v19) {
      [(PUActivityViewController *)self setExcludeLocation:0];
    }
    [v7 addObject:v23];

    objc_destroyWeak(&v120);
  }
  if (*((void *)&v127 + 1))
  {
    if ([(PUActivityViewController *)self shareAsCMM]) {
      uint64_t v24 = 0;
    }
    else {
      uint64_t v24 = [(PUActivityViewController *)self sendAsAssetBundles] ^ 1;
    }
    id v25 = (void *)MEMORY[0x1E4F9F320];
    id v26 = PULocalizedString(@"SHARING_OPTIONS_CAPTION_TITLE");
    if (v24) {
      uint64_t v27 = [(PUActivityViewController *)self excludeCaption] ^ 1;
    }
    else {
      uint64_t v27 = 1;
    }
    v117[0] = MEMORY[0x1E4F143A8];
    v117[1] = 3221225472;
    v117[2] = __74__PUActivityViewController__customizationGroupsForActivityViewController___block_invoke_3;
    v117[3] = &unk_1E5F22C30;
    objc_copyWeak(&v118, &location);
    uint64_t v28 = [v25 switchCustomizationWithTitle:v26 identifier:@"SHARING_OPTIONS_CAPTION_TITLE" footerText:0 value:v27 valueChangedHandler:v117];

    [v28 setEnabled:v24];
    if ((v24 & 1) == 0) {
      [(PUActivityViewController *)self setExcludeCaption:0];
    }
    [v7 addObject:v28];

    objc_destroyWeak(&v118);
  }
  if (v128)
  {
    if ([(PUActivityViewController *)self shareAsCMM]) {
      uint64_t v29 = 0;
    }
    else {
      uint64_t v29 = [(PUActivityViewController *)self sendAsAssetBundles] ^ 1;
    }
    id v30 = (void *)MEMORY[0x1E4F9F320];
    uint64_t v31 = PULocalizedString(@"SHARING_OPTIONS_ACCESSIBILITY_DESCRIPTION_TITLE");
    if (v29) {
      uint64_t v32 = [(PUActivityViewController *)self excludeAccessibilityDescription] ^ 1;
    }
    else {
      uint64_t v32 = 1;
    }
    v115[0] = MEMORY[0x1E4F143A8];
    v115[1] = 3221225472;
    v115[2] = __74__PUActivityViewController__customizationGroupsForActivityViewController___block_invoke_4;
    v115[3] = &unk_1E5F22C30;
    objc_copyWeak(&v116, &location);
    id v33 = [v30 switchCustomizationWithTitle:v31 identifier:@"SHARING_OPTIONS_ACCESSIBILITY_DESCRIPTION_TITLE" footerText:0 value:v32 valueChangedHandler:v115];

    [v33 setEnabled:v29];
    if ((v29 & 1) == 0) {
      [(PUActivityViewController *)self setExcludeAccessibilityDescription:0];
    }
    [v7 addObject:v33];

    objc_destroyWeak(&v116);
  }
  if (![(PUActivityViewController *)self sendAsUnmodifiedOriginals]
    && [v7 count])
  {
    id v34 = objc_alloc(MEMORY[0x1E4F9F328]);
    id v35 = PULocalizedString(@"SHARING_OPTIONS_DATA_CUSTOMIZATIONS_GROUP_TITLE");
    v36 = (void *)[v34 _initGroupWithName:v35 identifier:@"SHARING_OPTIONS_DATA_CUSTOMIZATIONS_GROUP" customizations:v7];

    [v103 addObject:v36];
  }
  if (![(PUActivityViewController *)self sendAsUnmodifiedOriginals])
  {
    int64_t v37 = [(PUActivityViewController *)self preferredExportFormat];
    if (v37 == 2) {
      uint64_t v38 = 2;
    }
    else {
      uint64_t v38 = v37 == 1;
    }
    BOOL v39 = [(PUActivityViewController *)self shareAsCMM];
    if (v39)
    {
      v40 = PULocalizedString(@"SHARING_OPTIONS_FORMAT_FOOTER_TEXT_CURRENT_CMM");
      uint64_t v38 = 1;
    }
    else
    {
      v40 = PXLocalizedString();
    }
    v41 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:3];
    v42 = PULocalizedString(@"SHARING_OPTIONS_FORMAT_AUTOMATIC");
    [v41 addObject:v42];

    v43 = PULocalizedString(@"SHARING_OPTIONS_FORMAT_CURRENT");
    [v41 addObject:v43];

    v44 = PULocalizedString(@"SHARING_OPTIONS_FORMAT_COMPATIBLE");
    [v41 addObject:v44];

    v45 = (void *)MEMORY[0x1E4F9F320];
    v113[0] = MEMORY[0x1E4F143A8];
    v113[1] = 3221225472;
    v113[2] = __74__PUActivityViewController__customizationGroupsForActivityViewController___block_invoke_5;
    v113[3] = &unk_1E5F22C58;
    objc_copyWeak(&v114, &location);
    v46 = [v45 pickerCustomizationWithIdentifier:@"SHARING_OPTIONS_FORMAT_PICKER" options:v41 selectedOptionIndex:v38 footerText:v40 valueChangedHandler:v113];
    [v46 setEnabled:!v39];
    id v47 = objc_alloc(MEMORY[0x1E4F9F328]);
    v48 = PULocalizedString(@"SHARING_OPTIONS_FORMAT_GROUP_TITLE");
    v134[0] = v46;
    v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:v134 count:1];
    v50 = (void *)[v47 _initGroupWithName:v48 identifier:@"SHARING_OPTIONS_FORMAT_GROUP" customizations:v49];

    [v103 addObject:v50];
    objc_destroyWeak(&v114);
  }
  v51 = [(PUActivityViewController *)self photoLibrary];
  if (PXCMMHasSendAndReceiveCapabilities())
  {
    BOOL v52 = [(PUActivityItemSourceController *)self->_itemSourceController itemSourcesSupportMomentShareLinkCreation];

    if (v52)
    {
      uint64_t v53 = [v101 cmmShareSheetBehavior];
      BOOL v54 = v53 == 1;
      if ([v101 cmmShareSheetBehavior] == 1)
      {
        [v102 count];
        v98 = PXLocalizationKeyForMediaType();
        v55 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:3];
        if (v53 == 1)
        {
          v56 = PULocalizedString(@"SHARING_OPTIONS_SEND_AS_AUTOMATIC");
          [v55 addObject:v56];
        }
        v57 = PULocalizedString(v98);
        v133[0] = v57;
        v58 = PULocalizedString(@"SHARING_OPTIONS_SEND_AS_CMM");
        v133[1] = v58;
        v59 = [MEMORY[0x1E4F1C978] arrayWithObjects:v133 count:2];
        [v55 addObjectsFromArray:v59];

        if ([(PUActivityViewController *)self shouldAutomaticallyUseCMMInMessagesIfThresholdMet])
        {
          uint64_t v60 = 0;
        }
        else
        {
          BOOL v90 = [(PUActivityViewController *)self shareAsCMM];
          if (v53 == 1) {
            uint64_t v60 = v90 + 1;
          }
          else {
            uint64_t v60 = v90;
          }
        }
        v91 = PULocalizedString(@"SHARING_OPTIONS_SEND_AS_GROUP_FOOTER_TEXT");
        v92 = (void *)MEMORY[0x1E4F9F320];
        v110[0] = MEMORY[0x1E4F143A8];
        v110[1] = 3221225472;
        v110[2] = __74__PUActivityViewController__customizationGroupsForActivityViewController___block_invoke_6;
        v110[3] = &unk_1E5F22C80;
        objc_copyWeak(&v111, &location);
        BOOL v112 = v54;
        v93 = [v92 pickerCustomizationWithIdentifier:@"SHARING_OPTIONS_SEND_AS_PICKER" options:v55 selectedOptionIndex:v60 footerText:v91 valueChangedHandler:v110];
        id v94 = objc_alloc(MEMORY[0x1E4F9F328]);
        v95 = PULocalizedString(@"SHARING_OPTIONS_SEND_AS_GROUP_TITLE");
        v132 = v93;
        v96 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v132 count:1];
        v97 = (void *)[v94 _initGroupWithName:v95 identifier:@"SHARING_OPTIONS_SEND_AS_GROUP" customizations:v96];

        [v103 addObject:v97];
        objc_destroyWeak(&v111);
      }
      else
      {
        v81 = (void *)MEMORY[0x1E4F9F320];
        v82 = PULocalizedString(@"SHARING_OPTIONS_SEND_AS_CMM_SWITCH_TITLE");
        v83 = PULocalizedString(@"SHARING_OPTIONS_SEND_AS_GROUP_CMM_SWITCH_FOOTER_TEXT");
        BOOL v84 = [(PUActivityViewController *)self shareAsCMM];
        v108[0] = MEMORY[0x1E4F143A8];
        v108[1] = 3221225472;
        v108[2] = __74__PUActivityViewController__customizationGroupsForActivityViewController___block_invoke_7;
        v108[3] = &unk_1E5F22C30;
        objc_copyWeak(&v109, &location);
        v85 = [v81 switchCustomizationWithTitle:v82 identifier:@"SHARING_OPTIONS_SEND_AS_CMM_SWITCH_TITLE" footerText:v83 value:v84 valueChangedHandler:v108];

        id v86 = objc_alloc(MEMORY[0x1E4F9F328]);
        v87 = PULocalizedString(@"SHARING_OPTIONS_SEND_AS_GROUP_TITLE");
        v131 = v85;
        v88 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v131 count:1];
        v89 = (void *)[v86 _initGroupWithName:v87 identifier:@"SHARING_OPTIONS_SEND_AS_GROUP" customizations:v88];

        [v103 addObject:v89];
        objc_destroyWeak(&v109);
      }
    }
  }
  else
  {
  }
  if ([v4 showUnmodifiedOriginalsExportSwitch])
  {
    if ([v102 count] == 1) {
      v61 = @"SHARING_OPTIONS_SEND_AS_UNMODIFIED_ORIGINAL";
    }
    else {
      v61 = @"SHARING_OPTIONS_SEND_AS_UNMODIFIED_ORIGINAL_MULTIPLE";
    }
    v62 = PULocalizedString(v61);
    v63 = PULocalizedString(@"SHARING_OPTIONS_SEND_AS_UNMODIFIED_FOOTER_TEXT");
    BOOL v64 = [(PUActivityViewController *)self sendAsUnmodifiedOriginals];
    v65 = (void *)MEMORY[0x1E4F9F320];
    v106[0] = MEMORY[0x1E4F143A8];
    v106[1] = 3221225472;
    v106[2] = __74__PUActivityViewController__customizationGroupsForActivityViewController___block_invoke_8;
    v106[3] = &unk_1E5F22C30;
    objc_copyWeak(&v107, &location);
    v66 = [v65 switchCustomizationWithTitle:v62 identifier:@"SHARING_OPTIONS_SEND_AS_UNMODIFIED_ORIGINAL" footerText:v63 value:v64 valueChangedHandler:v106];
    id v67 = objc_alloc(MEMORY[0x1E4F9F328]);
    v130 = v66;
    v68 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v130 count:1];
    v69 = (void *)[v67 _initGroupWithName:@"Internal" identifier:@"SHARING_OPTIONS_UNMODIFIED_ORIGINALS_GROUP" customizations:v68];

    [v103 addObject:v69];
    objc_destroyWeak(&v107);
  }
  if (v100)
  {
    v70 = PULocalizedString(@"SHARING_OPTIONS_ALL_PHOTOS_DATA_FOOTER");
    v71 = (void *)MEMORY[0x1E4F9F320];
    v72 = PULocalizedString(@"SHARING_OPTIONS_ALL_PHOTOS_DATA_TITLE");
    BOOL v73 = [(PUActivityViewController *)self sendAsAssetBundles];
    v104[0] = MEMORY[0x1E4F143A8];
    v104[1] = 3221225472;
    v104[2] = __74__PUActivityViewController__customizationGroupsForActivityViewController___block_invoke_9;
    v104[3] = &unk_1E5F22C30;
    objc_copyWeak(&v105, &location);
    v74 = [v71 switchCustomizationWithTitle:v72 identifier:@"SHARING_OPTIONS_ALL_PHOTOS_DATA" footerText:v70 value:v73 valueChangedHandler:v104];

    id v75 = objc_alloc(MEMORY[0x1E4F9F328]);
    v76 = PULocalizedString(@"SHARING_OPTIONS_ALL_PHOTOS_DATA_GROUP_TITLE");
    v129 = v74;
    v77 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v129 count:1];
    v78 = (void *)[v75 _initGroupWithName:v76 identifier:@"SHARING_OPTIONS_ALL_PHOTOS_DATA_GROUP" customizations:v77];

    [v103 addObject:v78];
    objc_destroyWeak(&v105);
  }
  v79 = (void *)[v103 copy];

  objc_destroyWeak(&location);
  return v79;
}

void __74__PUActivityViewController__customizationGroupsForActivityViewController___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 value] ^ 1;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setExcludeLiveness:v3];
}

void __74__PUActivityViewController__customizationGroupsForActivityViewController___block_invoke_2(uint64_t a1, void *a2)
{
  BOOL v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  LODWORD(v2) = [v3 value];

  [WeakRetained setExcludeLocation:v2 ^ 1];
}

void __74__PUActivityViewController__customizationGroupsForActivityViewController___block_invoke_3(uint64_t a1, void *a2)
{
  BOOL v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "setExcludeCaption:", objc_msgSend(v3, "value") ^ 1);
  LOBYTE(v2) = [v3 value];

  if ((v2 & 1) == 0) {
    [WeakRetained setShareAsCMM:0];
  }
  objc_msgSend(WeakRetained, "setShouldAutomaticallyUseCMMInMessagesIfThresholdMet:", objc_msgSend(WeakRetained, "_calculateAutomaticCMMSendingBehavior"));
}

void __74__PUActivityViewController__customizationGroupsForActivityViewController___block_invoke_4(uint64_t a1, void *a2)
{
  BOOL v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "setExcludeAccessibilityDescription:", objc_msgSend(v3, "value") ^ 1);
  LOBYTE(v2) = [v3 value];

  if ((v2 & 1) == 0) {
    [WeakRetained setShareAsCMM:0];
  }
  objc_msgSend(WeakRetained, "setShouldAutomaticallyUseCMMInMessagesIfThresholdMet:", objc_msgSend(WeakRetained, "_calculateAutomaticCMMSendingBehavior"));
}

void __74__PUActivityViewController__customizationGroupsForActivityViewController___block_invoke_5(uint64_t a1, void *a2)
{
  BOOL v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  unint64_t v4 = [v3 selectedOptionIndex];

  if (v4 <= 2) {
    [WeakRetained setPreferredExportFormat:v4];
  }
  [WeakRetained setShareAsCMM:0];
  objc_msgSend(WeakRetained, "setShouldAutomaticallyUseCMMInMessagesIfThresholdMet:", objc_msgSend(WeakRetained, "_calculateAutomaticCMMSendingBehavior"));
  [WeakRetained setSendAsAssetBundles:0];
}

void __74__PUActivityViewController__customizationGroupsForActivityViewController___block_invoke_6(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (*(unsigned char *)(a1 + 40))
  {
    objc_msgSend(WeakRetained, "setShouldAutomaticallyUseCMMInMessagesIfThresholdMet:", objc_msgSend(v6, "selectedOptionIndex") == 0);
    if (*(unsigned char *)(a1 + 40)) {
      uint64_t v4 = 2;
    }
    else {
      uint64_t v4 = 1;
    }
  }
  else
  {
    uint64_t v4 = 1;
  }
  objc_msgSend(WeakRetained, "setShareAsCMM:", objc_msgSend(v6, "selectedOptionIndex") == v4);
  if ([WeakRetained shouldAutomaticallyUseCMMInMessagesIfThresholdMet])
  {
    [WeakRetained setExcludeCaption:0];
    [WeakRetained setExcludeAccessibilityDescription:0];
  }
  if (([WeakRetained shouldAutomaticallyUseCMMInMessagesIfThresholdMet] & 1) != 0
    || [WeakRetained shareAsCMM])
  {
    [WeakRetained setPreferredExportFormat:0];
    [WeakRetained setSendAsUnmodifiedOriginals:0];
  }
  if ([WeakRetained sendAsAssetBundles]) {
    uint64_t v5 = [WeakRetained _canShowSendAsAssetBundlesSwitchInObjectManipulationHeader];
  }
  else {
    uint64_t v5 = 0;
  }
  [WeakRetained setSendAsAssetBundles:v5];
}

void __74__PUActivityViewController__customizationGroupsForActivityViewController___block_invoke_7(uint64_t a1, void *a2)
{
  BOOL v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  uint64_t v4 = [v3 value];

  [WeakRetained setShareAsCMM:v4];
  if (([WeakRetained shareAsCMM] & 1) == 0) {
    [WeakRetained setPreferredExportFormat:0];
  }
  [WeakRetained setSendAsUnmodifiedOriginals:0];
}

void __74__PUActivityViewController__customizationGroupsForActivityViewController___block_invoke_8(uint64_t a1, void *a2)
{
  BOOL v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  uint64_t v4 = [v3 value];

  [WeakRetained setSendAsUnmodifiedOriginals:v4];
  if ([WeakRetained sendAsUnmodifiedOriginals])
  {
    [WeakRetained setShareAsCMM:0];
    [WeakRetained setExcludeLocation:0];
    [WeakRetained setExcludeCaption:0];
    [WeakRetained setExcludeAccessibilityDescription:0];
    [WeakRetained setSendAsAssetBundles:0];
    [WeakRetained setPreferredExportFormat:0];
  }
  objc_msgSend(WeakRetained, "setShouldAutomaticallyUseCMMInMessagesIfThresholdMet:", objc_msgSend(WeakRetained, "_calculateAutomaticCMMSendingBehavior"));
}

void __74__PUActivityViewController__customizationGroupsForActivityViewController___block_invoke_9(uint64_t a1, void *a2)
{
  BOOL v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  uint64_t v4 = [v3 value];

  [WeakRetained setSendAsAssetBundles:v4];
  if ([WeakRetained sendAsAssetBundles]
    && [WeakRetained preferredExportFormat])
  {
    [WeakRetained setPreferredExportFormat:0];
  }
  if (PLIsLockdownMode()
    && _os_feature_enabled_impl()
    && ([WeakRetained sendAsAssetBundles] & 1) == 0)
  {
    [WeakRetained setExcludeLocation:1];
    [WeakRetained setExcludeCaption:1];
  }
}

- (BOOL)_customizationAvailableForActivityViewController:(id)a3
{
  uint64_t v4 = [(PUActivityItemSourceController *)self->_itemSourceController assetItems];
  uint64_t v5 = [v4 count];

  BOOL v6 = ![(PUActivityViewController *)self isActionSheet];
  return v5 && v6;
}

- (BOOL)_calculateAutomaticCMMSendingBehavior
{
  id v3 = [MEMORY[0x1E4F90068] sharedInstance];
  uint64_t v4 = [v3 cmmShareSheetBehavior];
  int64_t v5 = [(PUActivityViewController *)self preferredExportFormat];
  BOOL v6 = [(PUActivityViewController *)self excludeCaption]
    || [(PUActivityViewController *)self excludeAccessibilityDescription];
  BOOL v7 = [(PUActivityViewController *)self sendAsUnmodifiedOriginals];
  uint64_t v8 = [(PUActivityViewController *)self photoLibrary];
  int v9 = PXCMMHasSendAndReceiveCapabilities();

  char v10 = 0;
  if (v9)
  {
    BOOL v11 = (unint64_t)(v4 - 3) < 0xFFFFFFFFFFFFFFFELL || v5 == 2;
    if (!v11 && !v6 && !v7)
    {
      if ([v3 disableShareSheetAutomaticBehaviorIfADPEnabled])
      {
        id v12 = [(PUActivityViewController *)self photoLibrary];
        char v13 = [v12 isWalrusEnabled];

        char v10 = v13 ^ 1;
      }
      else
      {
        char v10 = 1;
      }
    }
  }

  return v10;
}

- (NSString)localizedSubtitle
{
  BOOL v2 = [(PUActivityViewController *)self sharingViewModel];
  id v3 = [v2 localizedSubtitle];

  return (NSString *)v3;
}

- (NSString)localizedTitle
{
  uint64_t v4 = [(PUActivityViewController *)self sharingViewModel];
  int v5 = [v4 isActionSheet];

  BOOL v6 = [(PUActivityViewController *)self sharingViewModel];
  BOOL v7 = [v6 localizedTitle];

  if (v5)
  {
    id v8 = v7;
  }
  else
  {
    int v9 = [MEMORY[0x1E4F1CA48] array];
    id v10 = v7;
    if ([v10 length]) {
      [v9 addObject:v10];
    }
    BOOL usePhotosStack = self->_usePhotosStack;
    uint64_t v12 = [(PUActivityViewController *)self photosCarouselViewController];
    char v13 = (void *)v12;
    if (usePhotosStack)
    {
      if (v12)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          BOOL v19 = [MEMORY[0x1E4F28B00] currentHandler];
          id v20 = (objc_class *)objc_opt_class();
          id v21 = NSStringFromClass(v20);
          uint64_t v22 = objc_msgSend(v13, "px_descriptionForAssertionMessage");
          [v19 handleFailureInMethod:a2, self, @"PUActivityViewController.m", 1496, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"self.photosCarouselViewController", v21, v22 object file lineNumber description];
        }
      }
      BOOL v14 = [v13 assetFetchResult];
      PXMediaTypeForAssets();
      [v14 count];
      id v15 = PXLocalizedSelectionMessageForAssetsCount();
    }
    else
    {
      if (v12)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
          uint64_t v24 = (objc_class *)objc_opt_class();
          id v25 = NSStringFromClass(v24);
          id v26 = objc_msgSend(v13, "px_descriptionForAssertionMessage");
          [v23 handleFailureInMethod:a2, self, @"PUActivityViewController.m", 1501, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"self.photosCarouselViewController", v25, v26 object file lineNumber description];
        }
      }
      id v15 = [v13 localizedSelectionTitle];
    }

    if ([v15 length]) {
      [v9 addObject:v15];
    }
    uint64_t v16 = PULocalizedString(@"SHARING_HEADER_TITLE_SEPARATOR");
    int v17 = [v9 componentsJoinedByString:v16];

    id v8 = v17;
  }

  return (NSString *)v8;
}

- (int64_t)sourceOrigin
{
  BOOL v2 = [(PUActivityViewController *)self sharingViewModel];
  int64_t v3 = [v2 sourceOrigin];

  return v3;
}

- (NSOrderedSet)orderedSelectedAssets
{
  int64_t v3 = [(PUActivityViewController *)self sharingViewModel];
  char v4 = [v3 isActionSheet];

  if (v4)
  {
    int v5 = 0;
  }
  else
  {
    BOOL v6 = [(PUActivityViewController *)self sharingViewModel];
    BOOL v7 = [v6 selectionManager];
    int v5 = [v7 orderedSelectedAssets];
  }
  return (NSOrderedSet *)v5;
}

- (PHPerson)person
{
  BOOL v2 = [(PUActivityViewController *)self sharingViewModel];
  int64_t v3 = [v2 person];

  return (PHPerson *)v3;
}

- (PXDisplayAsset)keyAsset
{
  BOOL v2 = [(PUActivityViewController *)self sharingViewModel];
  int64_t v3 = [v2 keyAsset];

  return (PXDisplayAsset *)v3;
}

- (void)_sharingStyleDidChangeToExpanded:(id)a3
{
  id v3 = [(PUActivityViewController *)self sharingViewModel];
  [v3 performChanges:&__block_literal_global_496];
}

uint64_t __61__PUActivityViewController__sharingStyleDidChangeToExpanded___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setActionSheet:0];
}

- (PXAssetMediaTypeCount)assetTypeCount
{
  retstr->var8 = 0;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  __n128 result = (PXAssetMediaTypeCount *)self->_itemSourceController;
  if (result) {
    return (PXAssetMediaTypeCount *)[(PXAssetMediaTypeCount *)result requestAssetsMediaTypeCount];
  }
  return result;
}

- (BOOL)isActionSheet
{
  BOOL v2 = [(PUActivityViewController *)self sharingViewModel];
  char v3 = [v2 isActionSheet];

  return v3;
}

- (void)_updateSharingHeaderIfNeeded
{
  if ((PLIsMobileSlideShow() & 1) != 0
    || (PLIsCamera() & 1) != 0
    || (PLIsPhotosMessagesApp() & 1) != 0
    || (PLIsSpotlight() & 1) != 0
    || PLIsPreferences())
  {
    if (!self->_sharingHeaderController)
    {
      char v4 = [[PUSharingHeaderController alloc] initWithDataProvider:self];
      sharingHeaderController = self->_sharingHeaderController;
      self->_sharingHeaderController = v4;
    }
    BOOL v6 = [(PUActivityViewController *)self photosHeaderMetadata];

    if (!v6)
    {
      BOOL v7 = [(PUSharingHeaderController *)self->_sharingHeaderController linkMetadata];
      if (!v7)
      {
        int v9 = [MEMORY[0x1E4F28B00] currentHandler];
        [v9 handleFailureInMethod:a2, self, @"PUActivityViewController.m", 1433, @"Invalid parameter not satisfying: %@", @"linkMetadata" object file lineNumber description];
      }
      [(PUActivityViewController *)self setPhotosHeaderMetadata:v7];
    }
    id v8 = self->_sharingHeaderController;
    [(PUSharingHeaderController *)v8 updateIfNeeded];
  }
}

- (BOOL)_canShowSendAsAssetBundlesSwitchInObjectManipulationHeader
{
  char v3 = [MEMORY[0x1E4F906A0] sharedInstance];
  char v4 = [(PUActivityViewController *)self photoLibrary];
  if (PXCMMHasSendAndReceiveCapabilities()
    && [v3 showSendAsAssetBundlesForCMM]
    && [(PUActivityViewController *)self shareAsCMM])
  {
    LOBYTE(v5) = 1;
  }
  else if ([v3 showSendAsAssetBundlesForIndividualItems])
  {
    BOOL v5 = ![(PUActivityViewController *)self shareAsCMM];
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (void)setSendAsUnmodifiedOriginals:(BOOL)a3
{
  if (self->_sendAsUnmodifiedOriginals != a3)
  {
    self->_sendAsUnmodifiedOriginals = a3;
    [(PUActivityViewController *)self _updateSharingHeaderIfNeeded];
    if (!self->_usePhotosStack)
    {
      BOOL v5 = [(PUActivityViewController *)self photosCarouselViewController];
      if (v5)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          BOOL v6 = [MEMORY[0x1E4F28B00] currentHandler];
          BOOL v7 = (objc_class *)objc_opt_class();
          id v8 = NSStringFromClass(v7);
          int v9 = objc_msgSend(v5, "px_descriptionForAssertionMessage");
          [v6 handleFailureInMethod:a2, self, @"PUActivityViewController.m", 1403, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"self.photosCarouselViewController", v8, v9 object file lineNumber description];
        }
        [v5 setSendAsUnmodifiedOriginals:self->_sendAsUnmodifiedOriginals];
      }
    }
    [(PUActivityViewController *)self _updateSourceControllerSharingPreferencesInAllItems];
  }
}

- (void)setSendAsAssetBundles:(BOOL)a3
{
  if (self->_sendAsAssetBundles != a3)
  {
    self->_sendAsAssetBundles = a3;
    [(PUActivityViewController *)self _updateSharingHeaderIfNeeded];
    if (!self->_usePhotosStack)
    {
      BOOL v5 = [(PUActivityViewController *)self photosCarouselViewController];
      if (v5)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          BOOL v6 = [MEMORY[0x1E4F28B00] currentHandler];
          BOOL v7 = (objc_class *)objc_opt_class();
          id v8 = NSStringFromClass(v7);
          int v9 = objc_msgSend(v5, "px_descriptionForAssertionMessage");
          [v6 handleFailureInMethod:a2, self, @"PUActivityViewController.m", 1386, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"self.photosCarouselViewController", v8, v9 object file lineNumber description];
        }
        [v5 setSendAsAssetBundles:self->_sendAsAssetBundles];
      }
    }
    [(PUActivityViewController *)self _updateSourceControllerSharingPreferencesInAllItems];
  }
}

- (void)setExcludeAccessibilityDescription:(BOOL)a3
{
  if (self->_excludeAccessibilityDescription != a3)
  {
    self->_excludeAccessibilityDescription = a3;
    [(PUActivityViewController *)self _updateSharingHeaderIfNeeded];
    [(PUActivityViewController *)self _updateSourceControllerSharingPreferencesInAllItems];
  }
}

- (void)setExcludeCaption:(BOOL)a3
{
  if (self->_excludeCaption != a3)
  {
    self->_excludeCaption = a3;
    [(PUActivityViewController *)self _updateSharingHeaderIfNeeded];
    [(PUActivityViewController *)self _updateSourceControllerSharingPreferencesInAllItems];
  }
}

- (void)setExcludeLocation:(BOOL)a3
{
  if (self->_excludeLocation != a3)
  {
    self->_excludeLocation = a3;
    [(PUActivityViewController *)self _updateSharingHeaderIfNeeded];
    [(PUActivityViewController *)self _updateSourceControllerSharingPreferencesInAllItems];
  }
}

- (void)setExcludeLiveness:(BOOL)a3
{
  if (self->_excludeLiveness != a3)
  {
    self->_excludeLiveness = a3;
    [(PUActivityViewController *)self _updateSharingHeaderIfNeeded];
    [(PUActivityViewController *)self _updateSourceControllerSharingPreferencesInAllItems];
  }
}

- (void)setPreferredExportFormat:(int64_t)a3
{
  if (self->_preferredExportFormat != a3)
  {
    self->_preferredExportFormat = a3;
    [(PUActivityViewController *)self _updateSharingHeaderIfNeeded];
    [(PUActivityViewController *)self _updateSourceControllerSharingPreferencesInAllItems];
  }
}

- (void)setShareAsCMM:(BOOL)a3
{
  if (self->_shareAsCMM != a3)
  {
    self->_shareAsCMM = a3;
    [(PUActivityViewController *)self _updateSharingHeaderIfNeeded];
    [(PUActivityViewController *)self _updateSourceControllerPreferredPreparationBehavior];
  }
}

- (void)setShouldAutomaticallyUseCMMInMessagesIfThresholdMet:(BOOL)a3
{
  if (self->_shouldAutomaticallyUseCMMInMessagesIfThresholdMet != a3)
  {
    self->_shouldAutomaticallyUseCMMInMessagesIfThresholdMet = a3;
    [(PUActivityViewController *)self _updateSourceControllerPreferredPreparationBehavior];
  }
}

- (void)_reloadAssetItems
{
  id v4 = [(PUActivityItemSourceController *)self->_itemSourceController assetItems];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CAA0]);
  [(PUActivityViewController *)self setAssetItems:v3];

  [(PUActivityViewController *)self setAssetItems:v4];
}

- (void)_updateSourceControllerSharingPreferencesInAllItems
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  int v3 = [(PUActivityItemSourceController *)self->_itemSourceController shouldExcludeLivenessInAllItemSources];
  int excludeLiveness = self->_excludeLiveness;
  BOOL v5 = excludeLiveness != v3;
  if (excludeLiveness != v3) {
    [(PUActivityItemSourceController *)self->_itemSourceController setShouldExcludeLivenessInAllItemSources:excludeLiveness != 0];
  }
  int v6 = [(PUActivityItemSourceController *)self->_itemSourceController shouldExcludeLocationInAllItemSources];
  int excludeLocation = self->_excludeLocation;
  if (excludeLocation != v6)
  {
    [(PUActivityItemSourceController *)self->_itemSourceController setShouldExcludeLocationInAllItemSources:excludeLocation != 0];
    BOOL v5 = 1;
  }
  int v8 = [(PUActivityItemSourceController *)self->_itemSourceController shouldExcludeCaptionInAllItemSources];
  int excludeCaption = self->_excludeCaption;
  if (excludeCaption != v8)
  {
    [(PUActivityItemSourceController *)self->_itemSourceController setShouldExcludeCaptionInAllItemSources:excludeCaption != 0];
    BOOL v5 = 1;
  }
  int v10 = [(PUActivityItemSourceController *)self->_itemSourceController shouldExcludeAccessibilityDescriptionInAllItemSources];
  int excludeAccessibilityDescription = self->_excludeAccessibilityDescription;
  if (excludeAccessibilityDescription != v10)
  {
    [(PUActivityItemSourceController *)self->_itemSourceController setShouldExcludeAccessibilityDescriptionInAllItemSources:excludeAccessibilityDescription != 0];
    BOOL v5 = 1;
  }
  int v12 = [(PUActivityItemSourceController *)self->_itemSourceController shouldShareAsAssetBundles];
  int sendAsAssetBundles = self->_sendAsAssetBundles;
  if (sendAsAssetBundles != v12)
  {
    [(PUActivityItemSourceController *)self->_itemSourceController setShouldShareAsAssetBundles:sendAsAssetBundles != 0];
    BOOL v5 = 1;
  }
  int v14 = [(PUActivityItemSourceController *)self->_itemSourceController shouldShareAsUnmodifiedOriginals];
  int sendAsUnmodifiedOriginals = self->_sendAsUnmodifiedOriginals;
  if (sendAsUnmodifiedOriginals != v14)
  {
    [(PUActivityItemSourceController *)self->_itemSourceController setShouldShareAsUnmodifiedOriginals:sendAsUnmodifiedOriginals != 0];
    BOOL v5 = 1;
  }
  if ([(PUActivityItemSourceController *)self->_itemSourceController preferredExportFormat] == self->_preferredExportFormat)
  {
    if (!v5) {
      return;
    }
  }
  else
  {
    -[PUActivityItemSourceController setPreferredExportFormat:](self->_itemSourceController, "setPreferredExportFormat:");
  }
  uint64_t v16 = PLShareSheetGetLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138412546;
    id v19 = (id)objc_opt_class();
    __int16 v20 = 2048;
    id v21 = self;
    id v17 = v19;
    _os_log_impl(&dword_1AE9F8000, v16, OS_LOG_TYPE_DEFAULT, "<%@:%p>: Reloading asset items, due to a change in share sheet metadata options", (uint8_t *)&v18, 0x16u);
  }
  [(PUActivityViewController *)self _reloadAssetItems];
}

- (void)_updateSourceControllerPreferredPreparationBehavior
{
  uint64_t shareAsCMM = self->_shareAsCMM;
  unint64_t v4 = [(PUActivityItemSourceController *)self->_itemSourceController preferredPreparationType];
  BOOL v5 = [(PUActivityItemSourceController *)self->_itemSourceController shouldUseMomentShareLinkInMessagesIfThresholdMet];
  if (v4 != shareAsCMM || self->_shouldAutomaticallyUseCMMInMessagesIfThresholdMet != v5)
  {
    [(PUActivityItemSourceController *)self->_itemSourceController setPreferredPreparationType:shareAsCMM];
    [(PUActivityItemSourceController *)self->_itemSourceController setShouldUseMomentShareLinkInMessagesIfThresholdMet:self->_shouldAutomaticallyUseCMMInMessagesIfThresholdMet];
    [(PUActivityViewController *)self updateVisibleShareActionsIfNeeded];
  }
}

- (void)setPhotosCarouselViewController:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)PUActivityViewController;
  [(PUActivityViewController *)&v10 setPhotosCarouselViewController:a3];
  if (!self->_usePhotosStack)
  {
    BOOL v5 = [(PUActivityViewController *)self photosCarouselViewController];
    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        int v6 = [MEMORY[0x1E4F28B00] currentHandler];
        BOOL v7 = (objc_class *)objc_opt_class();
        int v8 = NSStringFromClass(v7);
        int v9 = objc_msgSend(v5, "px_descriptionForAssertionMessage");
        [v6 handleFailureInMethod:a2, self, @"PUActivityViewController.m", 1237, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"self.photosCarouselViewController", v8, v9 object file lineNumber description];
      }
    }
    objc_msgSend(v5, "setSendAsAssetBundles:", -[PUActivityViewController sendAsAssetBundles](self, "sendAsAssetBundles"));
  }
  [(PUActivityViewController *)self _updateSharingHeaderIfNeeded];
}

- (void)_handlePostReadyToInteractUpdatesIfNeeded
{
  if (self->_shouldUpdateVisibleItemsWhenReady
    && [(PUActivityViewController *)self isReadyForInteraction]
    && [(PUActivityViewController *)self _appearState] == 2)
  {
    self->_shouldUpdateVisibleItemsWhenReady = 0;
    [(PUActivityViewController *)self updateVisibleShareActionsIfNeeded];
  }
}

- (void)updateVisibleShareActionsIfNeeded
{
  if (self->_isDismissed || ![(PUActivityViewController *)self isReadyForInteraction])
  {
    self->_shouldUpdateVisibleItemsWhenReady = 1;
  }
  else
  {
    int v3 = [(PUActivityItemSourceController *)self->_itemSourceController activityItems];
    unint64_t v4 = v3;
    if (self->_linkPresentation)
    {
      id v6 = v3;
      uint64_t v5 = objc_msgSend(v3, "arrayByAddingObject:");

      unint64_t v4 = (void *)v5;
    }
    id v7 = v4;
    [(PUActivityViewController *)self _updateActivityItems:v4];
  }
}

- (void)setAssetItems:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  itemSourceController = self->_itemSourceController;
  if (self->_isPreparingAssets)
  {
    id v6 = [(PUActivityItemSourceController *)itemSourceController assetItems];
    char v7 = [v6 isEqual:v4];

    if ((v7 & 1) == 0)
    {
      int v8 = PLShareSheetGetLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        int v9 = objc_opt_class();
        objc_super v10 = self->_itemSourceController;
        id v11 = v9;
        int v12 = [(PUActivityItemSourceController *)v10 assetItems];
        int v13 = 138413058;
        int v14 = v9;
        __int16 v15 = 2048;
        uint64_t v16 = self;
        __int16 v17 = 2048;
        uint64_t v18 = [v12 count];
        __int16 v19 = 2048;
        uint64_t v20 = [v4 count];
        _os_log_impl(&dword_1AE9F8000, v8, OS_LOG_TYPE_ERROR, "<%@:%p>: Trying to set different activity asset items: (%ld items to %ld items) while we are in the middle of preparing the assets", (uint8_t *)&v13, 0x2Au);
      }
    }
  }
  else
  {
    [(PUActivityItemSourceController *)itemSourceController setAssetItems:v4];
    [(PUActivityViewController *)self updateVisibleShareActionsIfNeeded];
    [(PUActivityViewController *)self _updateSharingHeaderIfNeeded];
  }
}

- (void)replaceAssetItem:(id)a3 withAssetItem:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (self->_isPreparingAssets)
  {
    int v8 = PLShareSheetGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138413058;
      id v11 = (id)objc_opt_class();
      __int16 v12 = 2048;
      int v13 = self;
      __int16 v14 = 2112;
      id v15 = v6;
      __int16 v16 = 2112;
      id v17 = v7;
      id v9 = v11;
      _os_log_impl(&dword_1AE9F8000, v8, OS_LOG_TYPE_ERROR, "<%@:%p>: Trying to replace an activity asset item:%@ with %@ while we are in the middle of preparing the assets", (uint8_t *)&v10, 0x2Au);
    }
  }
  else
  {
    [(PUActivityItemSourceController *)self->_itemSourceController removeAssetItem:v6];
    [(PUActivityItemSourceController *)self->_itemSourceController addAssetItem:v7];
    [(PUActivityViewController *)self updateVisibleShareActionsIfNeeded];
    [(PUActivityViewController *)self _updateSharingHeaderIfNeeded];
  }
}

- (void)removeAssetItem:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_isPreparingAssets)
  {
    uint64_t v5 = PLShareSheetGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412802;
      id v8 = (id)objc_opt_class();
      __int16 v9 = 2048;
      int v10 = self;
      __int16 v11 = 2112;
      id v12 = v4;
      id v6 = v8;
      _os_log_impl(&dword_1AE9F8000, v5, OS_LOG_TYPE_ERROR, "<%@:%p>: Trying to remove an activity asset item:%@ while we are in the middle of preparing the assets", (uint8_t *)&v7, 0x20u);
    }
  }
  else
  {
    [(PUActivityItemSourceController *)self->_itemSourceController removeAssetItem:v4];
    [(PUActivityViewController *)self updateVisibleShareActionsIfNeeded];
    [(PUActivityViewController *)self _updateSharingHeaderIfNeeded];
  }
}

- (void)addAssetItem:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_isPreparingAssets)
  {
    uint64_t v5 = PLShareSheetGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412802;
      id v8 = (id)objc_opt_class();
      __int16 v9 = 2048;
      int v10 = self;
      __int16 v11 = 2112;
      id v12 = v4;
      id v6 = v8;
      _os_log_impl(&dword_1AE9F8000, v5, OS_LOG_TYPE_ERROR, "<%@:%p>: Trying to add an activity asset item:%@ while we are in the middle of preparing the assets", (uint8_t *)&v7, 0x20u);
    }
  }
  else
  {
    objc_msgSend(v4, "setExcludeLocation:", -[PUActivityViewController excludeLocation](self, "excludeLocation"));
    [(PUActivityItemSourceController *)self->_itemSourceController addAssetItem:v4];
    [(PUActivityViewController *)self updateVisibleShareActionsIfNeeded];
    [(PUActivityViewController *)self _updateSharingHeaderIfNeeded];
  }
}

- (void)_cleanUpActivityState
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  BOOL v2 = [(PUActivityViewController *)self photosActivities];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        int v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v7 tearDownForCompletion];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)_sharingManagerDidBeginPublishing:(id)a3
{
  uint64_t v4 = +[PUPhotoSharingManager sharedInstance];
  uint64_t v5 = [v4 publishingProgressView];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__PUActivityViewController__sharingManagerDidBeginPublishing___block_invoke;
  v7[3] = &unk_1E5F2ED10;
  id v8 = v4;
  id v6 = v4;
  [(PUActivityViewController *)self _showRemakerProgressView:v5 forMail:0 withCancelationHandler:v7];
}

uint64_t __62__PUActivityViewController__sharingManagerDidBeginPublishing___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancelPublishing];
}

- (void)mailActivity:(id)a3 displayVideoRemakerProgressView:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __73__PUActivityViewController_mailActivity_displayVideoRemakerProgressView___block_invoke;
  v8[3] = &unk_1E5F2ED10;
  id v9 = v6;
  id v7 = v6;
  [(PUActivityViewController *)self _showRemakerProgressView:a4 forMail:1 withCancelationHandler:v8];
}

uint64_t __73__PUActivityViewController_mailActivity_displayVideoRemakerProgressView___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancelRemaking];
}

- (void)_presentConfidentialityWarningIfNeededForActivity:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![MEMORY[0x1E4F90698] confidentialityCheckRequired]) {
    goto LABEL_5;
  }
  id v8 = objc_opt_class();
  id v9 = [v6 activityType];
  LODWORD(v8) = [v8 needsConfidentialityCheckForActivityType:v9];

  if (!v8) {
    goto LABEL_5;
  }
  long long v10 = (void *)MEMORY[0x1E4F90698];
  long long v11 = [(PUActivityItemSourceController *)self->_itemSourceController assets];
  id v12 = [v11 array];
  LODWORD(v10) = [v10 confidentialWarningRequiredForAssets:v12];

  if (v10)
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F90698];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __100__PUActivityViewController__presentConfidentialityWarningIfNeededForActivity_withCompletionHandler___block_invoke;
    v20[3] = &unk_1E5F2E898;
    id v21 = v7;
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    id v17 = __100__PUActivityViewController__presentConfidentialityWarningIfNeededForActivity_withCompletionHandler___block_invoke_2;
    uint64_t v18 = &unk_1E5F2E898;
    id v19 = v21;
    __int16 v14 = [v13 confidentialityAlertWithConfirmAction:v20 abortAction:&v15];
    -[PUActivityViewController px_presentOverTopmostPresentedViewController:animated:completion:](self, "px_presentOverTopmostPresentedViewController:animated:completion:", v14, 1, 0, v15, v16, v17, v18);
  }
  else
  {
LABEL_5:
    (*((void (**)(id, uint64_t))v7 + 2))(v7, 1);
  }
}

uint64_t __100__PUActivityViewController__presentConfidentialityWarningIfNeededForActivity_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

uint64_t __100__PUActivityViewController__presentConfidentialityWarningIfNeededForActivity_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (void)_prepareAssetsForActivity:(id)a3 forcePreparationAsMomentShareLink:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  self->_isPreparingAssets = 1;
  self->_didSuccessfullyPrepareAssets = 0;
  if ([(PUActivityViewController *)self shareAsCMM] || v4)
  {
    self->_preparedAsCloudLink = 1;
  }
  else
  {
    id v6 = [v7 activityType];
    self->_preparedAsCloudLink = [v6 isEqualToString:*MEMORY[0x1E4F90988]];
  }
  [(PUActivityItemSourceController *)self->_itemSourceController configureItemSourcesForActivityIfNeeded:v7 forcePreparationAsMomentShareLink:v4];
}

- (void)_showSharingWasInterruptedForErrors:(id)a3 withIndividualAssets:(id)a4 itemSourcesByAssetUUID:(id)a5 toActivityType:(id)a6 completion:(id)a7
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v39 = a5;
  id v40 = a6;
  id v34 = a7;
  __int16 v14 = PLUIGetLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v45 = v12;
    _os_log_impl(&dword_1AE9F8000, v14, OS_LOG_TYPE_ERROR, "Share Sheet: Will show \"Unable to share\" dialogue. Reported errors: %{public}@", buf, 0xCu);
  }

  uint64_t v38 = NSString;
  uint64_t v37 = [v13 count];
  if (self->_shareAsCMM) {
    uint64_t v15 = @"iCloud Link";
  }
  else {
    uint64_t v15 = @"Individual Items";
  }
  v36 = v15;
  if (self->_sendAsUnmodifiedOriginals) {
    uint64_t v16 = @"YES";
  }
  else {
    uint64_t v16 = @"NO";
  }
  id v35 = v16;
  id v17 = v12;
  if (self->_preparedAsCloudLink) {
    uint64_t v18 = @"iCloud Link";
  }
  else {
    uint64_t v18 = @"Individual Items";
  }
  if (self->_excludeLocation) {
    id v19 = @"NO";
  }
  else {
    id v19 = @"YES";
  }
  uint64_t v20 = v19;
  if (self->_excludeCaption) {
    id v21 = @"NO";
  }
  else {
    id v21 = @"YES";
  }
  uint64_t v22 = v21;
  if (self->_excludeAccessibilityDescription) {
    uint64_t v23 = @"NO";
  }
  else {
    uint64_t v23 = @"YES";
  }
  uint64_t v24 = v23;
  if (self->_sendAsAssetBundles) {
    id v25 = @"YES";
  }
  else {
    id v25 = @"NO";
  }
  id v26 = v25;
  id v33 = v18;
  uint64_t v27 = v17;
  uint64_t v28 = v13;
  uint64_t v29 = [v38 stringWithFormat:@"Sharing %ld assets to activity type: %@\nOptions:\nSend As: %@\nExport Unmodified Originals: %@\n(Prepared As: %@)\nInclude Location: %@\nInclude Caption: %@\nInclude Accessibility Description: %@\nAll Photos Data: %@\n\n", v37, v40, v36, v35, v33, v20, v22, v24, v26];

  objc_initWeak((id *)buf, self);
  id v30 = [[PUSharingErrorPresentationController alloc] initWithErrors:v27 forAssets:v13 fromSource:0 preparationType:self->_preparedAsCloudLink];
  [(PUSharingErrorPresentationController *)v30 setItemSourcesByAssetUUID:v39];
  [(PUErrorPresentationController *)v30 setRadarDescription:v29];
  [(PUErrorPresentationController *)v30 setRadarComponentID:@"512768" name:@"Photos Backend (New Bugs)" version:@"all"];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __134__PUActivityViewController__showSharingWasInterruptedForErrors_withIndividualAssets_itemSourcesByAssetUUID_toActivityType_completion___block_invoke;
  v41[3] = &unk_1E5F29240;
  objc_copyWeak(&v43, (id *)buf);
  id v31 = v34;
  id v42 = v31;
  uint64_t v32 = [(PUErrorPresentationController *)v30 alertControllerWithCompletion:v41];
  [(PUActivityViewController *)self px_presentOverTopmostPresentedViewController:v32 animated:1 completion:0];

  objc_destroyWeak(&v43);
  objc_destroyWeak((id *)buf);
}

void __134__PUActivityViewController__showSharingWasInterruptedForErrors_withIndividualAssets_itemSourcesByAssetUUID_toActivityType_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handleUserCancelWithCompletion:*(void *)(a1 + 32)];
}

- (void)updateProgressUITitle
{
  PULocalizedString(@"SHARING_PREPARATION_TITLE");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  if ([(PUActivityItemSourceController *)self->_itemSourceController state] == 1)
  {
    uint64_t v3 = PULocalizedString(@"SHARING_DOWNLOADING_TITLE");

    id v7 = (id)v3;
  }
  BOOL v4 = [(PUActivityViewController *)self progressController];
  char v5 = [v4 isCancelled];

  if ((v5 & 1) == 0)
  {
    id v6 = [(PUActivityViewController *)self progressController];
    [v6 setTitle:v7];
  }
}

- (void)showProgressUIAnimated:(BOOL)a3 withDelay:(BOOL)a4 cancellationHandler:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  [(PUActivityViewController *)self removeProgressUIAnimated:0 withDelay:0];
  id v9 = objc_alloc_init(MEMORY[0x1E4F8FF50]);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __81__PUActivityViewController_showProgressUIAnimated_withDelay_cancellationHandler___block_invoke;
  v13[3] = &unk_1E5F2EBA0;
  id v14 = v8;
  id v10 = v8;
  [v9 setCancellationHandler:v13];
  long long v11 = [(PUActivityViewController *)self view];
  id v12 = [v11 window];

  [v9 setWindow:v12];
  [v9 showAnimated:v6 allowDelay:v5];
  [(PUActivityViewController *)self setProgressController:v9];
  [(PUActivityViewController *)self updateProgressUITitle];
}

uint64_t __81__PUActivityViewController_showProgressUIAnimated_withDelay_cancellationHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)removeProgressUIAnimated:(BOOL)a3 withDelay:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v7 = [(PUActivityViewController *)self progressController];
  [v7 hideAnimated:v5 allowDelay:v4];

  [(PUActivityViewController *)self setProgressController:0];
}

- (void)_removeRemakerProgressView
{
  [(PLProgressView *)self->_remakerProgressView removeFromSuperview];
  remakerProgressView = self->_remakerProgressView;
  self->_remakerProgressView = 0;
}

- (void)_showRemakerProgressView:(id)a3 forMail:(BOOL)a4 withCancelationHandler:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  [(PUActivityViewController *)self _removeRemakerProgressView];
  objc_storeStrong((id *)&self->_remakerProgressView, a3);
  [v9 setShowsCancelButton:1];
  objc_initWeak(&location, self);
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __84__PUActivityViewController__showRemakerProgressView_forMail_withCancelationHandler___block_invoke;
  uint64_t v16 = &unk_1E5F23FE8;
  id v11 = v10;
  id v17 = v11;
  BOOL v19 = a4;
  objc_copyWeak(&v18, &location);
  [v9 setCancelationHandler:&v13];
  id v12 = objc_alloc_init(PUPhotosSharingProgressOverlay);
  -[PUPhotosSharingProgressOverlay addProgressView:](v12, "addProgressView:", v9, v13, v14, v15, v16);
  [(PUPhotosSharingProgressOverlay *)v12 setShowing:1 animated:1];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __84__PUActivityViewController__showRemakerProgressView_forMail_withCancelationHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  if (!*(unsigned char *)(a1 + 48))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _handleUserCancelWithCompletion:0];
  }
}

- (void)_handleUserCancelWithCompletion:(id)a3
{
  BOOL v6 = (void (**)(void))a3;
  BOOL v4 = [(PUActivityViewController *)self delegate];
  BOOL v5 = v4;
  if (!v4 || [v4 activityViewControllerShouldCancelAfterPreparationCanceled:self]) {
    [(PUActivityViewController *)self _cancel];
  }
  if (v6) {
    v6[2]();
  }
}

- (void)_sendCPAnalyticsAssetExportPreparationEventWithActivityType:(id)a3 didComplete:(BOOL)a4 error:(id)a5
{
  BOOL v5 = a4;
  id v14 = a5;
  id v8 = [(PUActivityViewController *)self _generateAnalyticsPayloadForSharingEventsToActivityType:a3];
  [v8 setObject:@"Share Sheet" forKeyedSubscript:@"assetExportPreparationSource"];
  if (v5)
  {
    id v9 = (id *)MEMORY[0x1E4F56408];
  }
  else
  {
    if (v14)
    {
      id v10 = (id)*MEMORY[0x1E4F56410];
      [v8 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F56568]];
      unint64_t v11 = +[PUSharingErrorPresentationController sharingErrorTypeFromError:v14];
      if (v11 > 9) {
        id v12 = @"Unknown";
      }
      else {
        id v12 = off_1E5F242E0[v11];
      }
      uint64_t v13 = v12;
      [v8 setObject:v13 forKeyedSubscript:@"assetExportPreparationErrorType"];

      goto LABEL_10;
    }
    id v9 = (id *)MEMORY[0x1E4F56400];
  }
  id v10 = *v9;
LABEL_10:
  [MEMORY[0x1E4F56658] sendEvent:v10 withPayload:v8];
}

- (void)_sendCPAnalyticsShareEventForMultipleSelectionShare
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PUActivityItemSourceController *)self->_itemSourceController assetItems];
  unint64_t v4 = [v3 count];

  if (v4 <= 0xA)
  {
    BOOL v5 = [(PUActivityItemSourceController *)self->_itemSourceController assets];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      uint64_t v9 = *MEMORY[0x1E4F56558];
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * v10);
          id v12 = (void *)MEMORY[0x1E4F56658];
          uint64_t v18 = v9;
          uint64_t v19 = v11;
          uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
          [v12 sendEvent:@"com.apple.photos.CPAnalytics.assetSharedStandardSelectionSize" withPayload:v13];

          ++v10;
        }
        while (v7 != v10);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v20 count:16];
      }
      while (v7);
    }
  }
}

- (void)_sendCPAnalyticsShareEventWithActivityType:(id)a3 category:(int64_t)a4 didComplete:(BOOL)a5
{
  BOOL v5 = a5;
  id v11 = [(PUActivityViewController *)self _generateAnalyticsPayloadForSharingEventsToActivityType:a3];
  if (v5)
  {
    id v8 = (id)*MEMORY[0x1E4F56468];
  }
  else
  {
    id v8 = (id)*MEMORY[0x1E4F56460];
    uint64_t v9 = [NSNumber numberWithBool:self->_didSuccessfullyPrepareAssets];
    [v11 setObject:v9 forKeyedSubscript:@"didSuccessfullyPrepareAssets"];
  }
  uint64_t v10 = [NSNumber numberWithInteger:a4];
  [v11 setObject:v10 forKeyedSubscript:@"activityCategory"];

  [MEMORY[0x1E4F56658] sendEvent:v8 withPayload:v11];
  [(PUActivityViewController *)self _sendCPAnalyticsShareEventForMultipleSelectionShare];
}

- (id)_generateAnalyticsPayloadForSharingEventsToActivityType:(id)a3
{
  v24[8] = *MEMORY[0x1E4F143B8];
  id v22 = a3;
  unint64_t v4 = [(PUActivityItemSourceController *)self->_itemSourceController assets];
  uint64_t v20 = [v4 array];

  uint64_t v18 = (void *)MEMORY[0x1E4F1CA60];
  v23[0] = *MEMORY[0x1E4F56560];
  BOOL v5 = (objc_class *)objc_opt_class();
  uint64_t v21 = NSStringFromClass(v5);
  v24[0] = v21;
  v23[1] = @"excludeLiveness";
  uint64_t v19 = objc_msgSend(NSNumber, "numberWithBool:", -[PUActivityViewController excludeLiveness](self, "excludeLiveness"));
  v24[1] = v19;
  v23[2] = @"excludeLocation";
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithBool:", -[PUActivityViewController excludeLocation](self, "excludeLocation"));
  v24[2] = v6;
  v23[3] = @"hasPublishedURL";
  uint64_t v7 = NSNumber;
  id v8 = [(PUActivityItemSourceController *)self->_itemSourceController publishedURL];
  uint64_t v9 = [v8 absoluteString];
  uint64_t v10 = objc_msgSend(v7, "numberWithInt:", objc_msgSend(v9, "length") != 0);
  v24[3] = v10;
  v23[4] = @"sendAsOriginals";
  id v11 = objc_msgSend(NSNumber, "numberWithBool:", -[PUActivityViewController sendAsAssetBundles](self, "sendAsAssetBundles"));
  v24[4] = v11;
  v23[5] = @"shareAsCMM";
  id v12 = objc_msgSend(NSNumber, "numberWithBool:", -[PUActivityViewController shareAsCMM](self, "shareAsCMM"));
  v24[5] = v12;
  v23[6] = @"preparedAsCloudLink";
  uint64_t v13 = [NSNumber numberWithBool:self->_preparedAsCloudLink];
  v24[6] = v13;
  v23[7] = @"shouldAutomaticallyUseCMMInMessagesIfThresholdMet";
  long long v14 = objc_msgSend(NSNumber, "numberWithBool:", -[PUActivityViewController shouldAutomaticallyUseCMMInMessagesIfThresholdMet](self, "shouldAutomaticallyUseCMMInMessagesIfThresholdMet"));
  v24[7] = v14;
  long long v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:8];
  long long v16 = [v18 dictionaryWithDictionary:v15];

  [v16 setObject:v20 forKeyedSubscript:*MEMORY[0x1E4F56558]];
  if ([v22 length]) {
    [v16 setObject:v22 forKeyedSubscript:@"activityType"];
  }

  return v16;
}

- (void)_activity:(id)a3 category:(int64_t)a4 didComplete:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  uint64_t v10 = v9;
  id v11 = &OBJC_IVAR___PUTopPeopleWallpaperSuggesterDebugSettingsFilteringSettingsView__requiresNoBlinkCheckBox;
  if (v5)
  {
    self->_isDismissed = 1;
    if ([v9 isEqualToString:*MEMORY[0x1E4F90950]])
    {
      id v12 = [(PUActivityViewController *)self activity];
      if (v12)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
          id v22 = (objc_class *)objc_opt_class();
          uint64_t v23 = NSStringFromClass(v22);
          uint64_t v24 = objc_msgSend(v12, "px_descriptionForAssertionMessage");
          [v21 handleFailureInMethod:a2, self, @"PUActivityViewController.m", 861, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"self.activity", v23, v24 object file lineNumber description];

          id v11 = &OBJC_IVAR___PUTopPeopleWallpaperSuggesterDebugSettingsFilteringSettingsView__requiresNoBlinkCheckBox;
        }
      }
      if ([v12 destinationSharedAlbumWasCreated])
      {
        uint64_t v13 = [v12 destinationSharedAlbum];
        if (v13)
        {
          long long v14 = [(PUActivityViewController *)self presentingViewController];
          long long v15 = [v14 tabBarController];

          if ([v15 conformsToProtocol:&unk_1F090E300]) {
            [v15 navigateToRevealAlbum:v13 initiallyHidden:1 animated:1];
          }
        }
      }
    }
  }
  else
  {
    long long v16 = self->_itemSourceController;
    long long v17 = [(PUActivityItemSourceController *)v16 publishedURL];
    uint64_t v18 = PLSharingGetLog();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    if (v17)
    {
      if (v19)
      {
        uint64_t v20 = objc_msgSend(v17, "pl_redactedShareURL");
        *(_DWORD *)buf = 138543362;
        uint64_t v27 = v20;
        _os_log_impl(&dword_1AE9F8000, v18, OS_LOG_TYPE_DEFAULT, "Activity failure will expunge moment share URL: %{public}@", buf, 0xCu);
      }
      id v25 = v17;
      PXExpungeMomentShareForURL();
      uint64_t v18 = v25;
    }
    else if (v19)
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v27 = v10;
      _os_log_impl(&dword_1AE9F8000, v18, OS_LOG_TYPE_DEFAULT, "No moment share URL to expunge for activity %@.", buf, 0xCu);
    }

    [v10 isEqualToString:*MEMORY[0x1E4F90950]];
  }
  [(PUActivityViewController *)self _sendCPAnalyticsShareEventWithActivityType:v10 category:a4 didComplete:v5];
  [*(id *)((char *)&self->super.super.super.super.isa + v11[304]) cleanUpExportedFiles];
  [(PUActivityViewController *)self _cleanUpActivityState];
}

void __59__PUActivityViewController__activity_category_didComplete___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = PLSharingGetLog();
  uint64_t v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = objc_msgSend(*(id *)(a1 + 32), "pl_redactedShareURL");
      int v13 = 138543362;
      long long v14 = v8;
      id v9 = "Activity failure did expunge moment share: %{public}@";
      uint64_t v10 = v7;
      os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
      uint32_t v12 = 12;
LABEL_6:
      _os_log_impl(&dword_1AE9F8000, v10, v11, v9, (uint8_t *)&v13, v12);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v8 = objc_msgSend(*(id *)(a1 + 32), "pl_redactedShareURL");
    int v13 = 138543618;
    long long v14 = v8;
    __int16 v15 = 2112;
    id v16 = v5;
    id v9 = "Activity failure failed to expunge moment share %{public}@: %@";
    uint64_t v10 = v7;
    os_log_type_t v11 = OS_LOG_TYPE_ERROR;
    uint32_t v12 = 22;
    goto LABEL_6;
  }
}

- (void)_updateTopBorderView
{
  if ([(PUActivityViewController *)self allowsEmbedding])
  {
    uint64_t v3 = [(PUActivityViewController *)self view];
    __int16 v15 = v3;
    if (!self->_topBorderView)
    {
      unint64_t v4 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
      topBorderView = self->_topBorderView;
      self->_topBorderView = v4;

      uint64_t v6 = [MEMORY[0x1E4FB1618] colorWithWhite:0.772549033 alpha:1.0];
      [(UIView *)self->_topBorderView setBackgroundColor:v6];

      [(UIView *)self->_topBorderView setAutoresizingMask:2];
      [(UIView *)v15 addSubview:self->_topBorderView];
      uint64_t v3 = v15;
    }
    [(UIView *)v3 bounds];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    if (PUMainScreenScale_onceToken != -1) {
      dispatch_once(&PUMainScreenScale_onceToken, &__block_literal_global_28618);
    }
    -[UIView setFrame:](self->_topBorderView, "setFrame:", v8, v10, v12, 1.0 / *(double *)&PUMainScreenScale_screenScale);
    [(UIView *)v15 bringSubviewToFront:self->_topBorderView];
    int v13 = v15;
  }
  else
  {
    long long v14 = self->_topBorderView;
    if (!v14) {
      return;
    }
    [(UIView *)v14 removeFromSuperview];
    int v13 = self->_topBorderView;
    self->_topBorderView = 0;
  }
}

- (NSOrderedSet)assets
{
  return [(PUActivityItemSourceController *)self->_itemSourceController assets];
}

- (void)_handleShareSheetReadyToInteractCompletion
{
  if ([(PUActivityViewController *)self isReadyForInteraction]
    && [(PUActivityViewController *)self _appearState] == 2)
  {
    uint64_t v3 = [(PUActivityViewController *)self readyToInteractHandler];
    uint64_t v6 = (void (**)(void))[v3 copy];

    if (v6)
    {
      [(PUActivityViewController *)self setReadyToInteractHandler:0];
      v6[2]();
    }
    unint64_t v4 = [(PUActivityViewController *)self ppt_readyToInteractHandler];
    id v5 = (void (**)(void))[v4 copy];

    if (v5)
    {
      [(PUActivityViewController *)self setPpt_readyToInteractHandler:0];
      v5[2](v5);
    }
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PUActivityViewController;
  id v4 = a3;
  [(PUActivityViewController *)&v8 traitCollectionDidChange:v4];
  id v5 = objc_msgSend(v4, "preferredContentSizeCategory", v8.receiver, v8.super_class);

  uint64_t v6 = [(PUActivityViewController *)self traitCollection];
  double v7 = [v6 preferredContentSizeCategory];

  if (v5 != v7) {
    [(PUActivityViewController *)self _updateSharingHeaderIfNeeded];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PUActivityViewController;
  [(PUActivityViewController *)&v7 viewWillDisappear:a3];
  id v4 = [(PUActivityViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    uint64_t v6 = [(PUActivityViewController *)self delegate];
    [v6 activityViewControllerWillDisappear:self];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)PUActivityViewController;
  [(PUActivityViewController *)&v10 viewDidAppear:a3];
  if (self->_shouldUpdateVisibleItemsWhenReady)
  {
    objc_initWeak(&location, self);
    uint64_t v4 = MEMORY[0x1E4F143A8];
    uint64_t v5 = 3221225472;
    uint64_t v6 = __42__PUActivityViewController_viewDidAppear___block_invoke;
    objc_super v7 = &unk_1E5F2E530;
    objc_copyWeak(&v8, &location);
    dispatch_async(MEMORY[0x1E4F14428], &v4);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  [(PUActivityViewController *)self _handleShareSheetReadyToInteractCompletion];
}

void __42__PUActivityViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handlePostReadyToInteractUpdatesIfNeeded];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PUActivityViewController;
  [(PUActivityViewController *)&v3 viewDidLayoutSubviews];
  [(PUActivityViewController *)self _updateTopBorderView];
}

- (void)dealloc
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  objc_super v3 = PLShareSheetGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v7 = (id)objc_opt_class();
    __int16 v8 = 2048;
    double v9 = self;
    id v4 = v7;
    _os_log_impl(&dword_1AE9F8000, v3, OS_LOG_TYPE_DEFAULT, "<%@:%p>: dealloc", buf, 0x16u);
  }
  [(PXContentPrivacyController *)self->_privacyControllerForContainerCollection unregisterChangeObserver:self context:PrivacyControllerObservationContext];
  if (self->_progressController) {
    [(PUActivityViewController *)self removeProgressUIAnimated:0 withDelay:0];
  }
  v5.receiver = self;
  v5.super_class = (Class)PUActivityViewController;
  [(PUActivityViewController *)&v5 dealloc];
}

- (void)setReadyForInteraction:(BOOL)a3
{
  if (self->_readyForInteraction != a3)
  {
    BOOL v3 = a3;
    self->_readyForInteraction = a3;
    if (!self->_usePhotosStack)
    {
      uint64_t v6 = [(PUActivityViewController *)self photosCarouselViewController];
      if (v6)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v7 = [MEMORY[0x1E4F28B00] currentHandler];
          __int16 v8 = (objc_class *)objc_opt_class();
          double v9 = NSStringFromClass(v8);
          uint64_t v10 = objc_msgSend(v6, "px_descriptionForAssertionMessage");
          [v7 handleFailureInMethod:a2, self, @"PUActivityViewController.m", 739, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"self.photosCarouselViewController", v9, v10 object file lineNumber description];
        }
      }
      [v6 setReadyForInteraction:v3];
    }
    [(PUActivityViewController *)self _handleShareSheetReadyToInteractCompletion];
  }
}

- (void)setExcludedActivityTypes:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = [MEMORY[0x1E4F1CA80] set];
  v9[0] = *MEMORY[0x1E4F90B08];
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  [v5 addObjectsFromArray:v6];

  if (v4) {
    [v5 addObjectsFromArray:v4];
  }
  id v7 = [v5 allObjects];
  v8.receiver = self;
  v8.super_class = (Class)PUActivityViewController;
  [(PUActivityViewController *)&v8 setExcludedActivityTypes:v7];
}

- (PUActivityViewController)initWithAssetItems:(id)a3 photosApplicationActivities:(id)a4 linkPresentation:(id)a5 assetIdentifiers:(id)a6 sharingViewModel:(id)a7
{
  uint64_t v105 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v88 = a5;
  id v14 = a5;
  id v90 = a6;
  id obj = a7;
  id v15 = a7;
  id v16 = objc_opt_class();
  uint64_t v17 = [v15 photosDataSource];
  LODWORD(v16) = [v16 _shouldReverseOrderOfSharedItemsInDataSource:v17];

  if (v16)
  {
    uint64_t v18 = PLShareSheetGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v98 = (id)objc_opt_class();
      __int16 v99 = 2048;
      BOOL v100 = self;
      id v19 = v98;
      _os_log_impl(&dword_1AE9F8000, v18, OS_LOG_TYPE_DEFAULT, "<%@:%p>: Reversing the order in which we share the actual items (display unaffected), as the initial data source is in reverse chronological order", buf, 0x16u);
    }
    id v20 = v13;

    uint64_t v21 = (void *)MEMORY[0x1E4F1CAA0];
    id v22 = [v12 reverseObjectEnumerator];
    uint64_t v23 = [v22 allObjects];
    uint64_t v24 = [v21 orderedSetWithArray:v23];

    id v12 = (id)v24;
  }
  else
  {
    id v20 = v13;
  }
  id v25 = objc_alloc_init(PUActivityItemSourceController);
  [(PUActivityItemSourceController *)v25 setAssetItems:v12];
  id v26 = [v15 person];
  [(PUActivityItemSourceController *)v25 setPerson:v26];

  uint64_t v27 = [v15 socialGroup];
  [(PUActivityItemSourceController *)v25 setSocialGroup:v27];

  [(PUActivityItemSourceController *)v25 assets];
  uint64_t v29 = v28 = v15;
  id v30 = [v29 firstObject];
  id v31 = [v30 photoLibrary];
  uint64_t v32 = v31;
  v89 = v28;
  if (v31)
  {
    id v33 = v31;
  }
  else
  {
    id v34 = [v28 photosDataSource];
    uint64_t v35 = [v34 photoLibrary];

    id v33 = (id)v35;
  }

  if (!v33)
  {
    v78 = [MEMORY[0x1E4F28B00] currentHandler];
    [v78 handleFailureInMethod:a2, self, @"PUActivityViewController.m", 609, @"PUActivityViewController was initialized with no assets and no sharing model, and was unable to determine a photo library" object file lineNumber description];
  }
  v36 = [MEMORY[0x1E4F90690] sharedLibraryStatusProviderWithPhotoLibrary:v33];
  uint64_t v37 = [v36 hasSharedLibraryOrPreview];
  uint64_t v38 = v20;
  if (!v20)
  {
    uint64_t v38 = [(id)objc_opt_class() photosApplicationActivities:v37];
  }
  id v39 = [(PUActivityItemSourceController *)v25 activityItems];
  id v40 = (void *)[v39 mutableCopy];

  if (v14) {
    [v40 addObject:v14];
  }
  v41 = PLShareSheetGetLog();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    id v42 = objc_opt_class();
    *(_DWORD *)buf = 138413058;
    id v98 = v42;
    __int16 v99 = 2048;
    BOOL v100 = self;
    __int16 v101 = 2112;
    v102 = v40;
    __int16 v103 = 2112;
    v104 = v38;
    id v43 = v42;
    _os_log_impl(&dword_1AE9F8000, v41, OS_LOG_TYPE_DEFAULT, "<%@:%p>: creating PUActivityViewController with items:%@ applicationActivities:%@", buf, 0x2Au);
  }
  v95.receiver = self;
  v95.super_class = (Class)PUActivityViewController;
  v44 = [(PUActivityViewController *)&v95 initWithActivityItems:v40 applicationActivities:v38];
  id v45 = v44;
  if (v44)
  {
    v82 = v36;
    [(PUActivityViewController *)v44 _setSelectedAssetIdentifiers:v90];
    [(PUActivityViewController *)v45 setExcludedActivityTypes:MEMORY[0x1E4F1CBF0]];
    objc_storeStrong((id *)&v45->_photoLibrary, v33);
    objc_storeStrong((id *)&v45->_sharingViewModel, obj);
    [(PUActivitySharingViewModel *)v45->_sharingViewModel registerChangeObserver:v45 context:PUActivityViewControllerViewModelObserverContext];
    objc_storeStrong((id *)&v45->_linkPresentation, v88);
    v45->_BOOL usePhotosStack = _os_feature_enabled_impl();
    uint64_t v46 = [(PUActivitySharingViewModel *)v45->_sharingViewModel photosDataSource];
    uint64_t v47 = [v46 containerAssetCollection];

    v80 = (void *)v47;
    uint64_t v48 = [MEMORY[0x1E4F90070] privacyControllerForCollection:v47];
    privacyControllerForContainerCollection = v45->_privacyControllerForContainerCollection;
    v45->_privacyControllerForContainerCollection = (PXContentPrivacyController *)v48;

    if (v45->_privacyControllerForContainerCollection)
    {
      v50 = PLShareSheetGetLog();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AE9F8000, v50, OS_LOG_TYPE_DEFAULT, "Found a privacy controller for the container asset collection of share sheet. Observing changes in lock state for dismissal.", buf, 2u);
      }

      [(PXContentPrivacyController *)v45->_privacyControllerForContainerCollection registerChangeObserver:v45 context:PrivacyControllerObservationContext];
    }
    v81 = v40;
    id v83 = v33;
    id obja = v14;
    v79 = [(id)objc_opt_class() defaultActivityTypeOrder];
    -[PUActivityViewController setActivityTypeOrder:](v45, "setActivityTypeOrder:");
    [(PUActivityViewController *)v45 setObjectManipulationDelegate:v45];
    v85 = v38;
    uint64_t v51 = [v38 copy];
    photosActivities = v45->_photosActivities;
    v45->_photosActivities = (NSArray *)v51;

    objc_storeStrong((id *)&v45->_itemSourceController, v25);
    [(PUActivityItemSourceController *)v45->_itemSourceController setActivityViewController:v45];
    [(PUActivityItemSourceController *)v45->_itemSourceController setDelegate:v45];
    [(PUActivityItemSourceController *)v45->_itemSourceController registerChangeObserver:v45 context:PUActivityViewControllerSourceControllerObserverContext];
    long long v93 = 0u;
    long long v94 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    uint64_t v53 = [(PUActivityViewController *)v45 photosActivities];
    uint64_t v54 = [v53 countByEnumeratingWithState:&v91 objects:v96 count:16];
    if (v54)
    {
      uint64_t v55 = v54;
      uint64_t v56 = *(void *)v92;
      do
      {
        for (uint64_t i = 0; i != v55; ++i)
        {
          if (*(void *)v92 != v56) {
            objc_enumerationMutation(v53);
          }
          v58 = *(void **)(*((void *)&v91 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v58 setItemSourceController:v45->_itemSourceController];
          }
        }
        uint64_t v55 = [v53 countByEnumeratingWithState:&v91 objects:v96 count:16];
      }
      while (v55);
    }

    v59 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v59 addObserver:v45 selector:sel__sharingManagerDidBeginPublishing_ name:@"PUPhotoSharingManagerDidBeginPublishing" object:0];

    uint64_t v60 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v60 addObserver:v45 selector:sel__sharingStyleDidChangeToExpanded_ name:@"UIActivityViewControllerSharingExpandedNotification" object:v45];

    v45->_shouldAutomaticallyUseCMMInMessagesIfThresholdMet = 0;
    v45->_uint64_t shareAsCMM = 0;
    v61 = [MEMORY[0x1E4F906A0] sharedInstance];
    v62 = +[PURootSettings sharedInstance];
    char v63 = [v62 irisUIEnabled];

    BOOL v64 = [(PUActivityViewController *)v45 _canShowSendAsAssetBundlesSwitchInObjectManipulationHeader];
    if (v63)
    {
      v65 = [MEMORY[0x1E4F906A0] sharedInstance];
      v45->_int excludeLiveness = [v65 excludeLivenessByDefaultWhenSharing];
    }
    else
    {
      v45->_int excludeLiveness = 1;
    }
    v45->_int excludeLocation = [v61 excludeLocationByDefaultWhenSharing];
    if (PLIsLockdownMode())
    {
      int v66 = _os_feature_enabled_impl();
      int v67 = v66;
      char v68 = v66 ^ 1;
      if (!v45->_excludeLocation && v66)
      {
        v69 = PLSharingGetLog();
        if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1AE9F8000, v69, OS_LOG_TYPE_DEFAULT, "In lockdown mode. Excluding location by default in share sheet, which could require format conversions during export.", buf, 2u);
        }

        v45->_int excludeLocation = 1;
      }
      if (v45->_excludeCaption) {
        int v70 = 0;
      }
      else {
        int v70 = v67;
      }
      uint64_t v38 = v85;
      if (v70 == 1)
      {
        v71 = PLSharingGetLog();
        if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1AE9F8000, v71, OS_LOG_TYPE_DEFAULT, "In lockdown mode. Excluding caption by default in share sheet, which could require format conversions during export.", buf, 2u);
        }

        v45->_int excludeCaption = 1;
      }
    }
    else
    {
      char v68 = 1;
      uint64_t v38 = v85;
    }
    if (v64)
    {
      char v72 = [v61 sendAsAssetBundlesByDefaultWhenSharing];
      p_int sendAsAssetBundles = &v45->_sendAsAssetBundles;
      v45->_int sendAsAssetBundles = v72;
      char v74 = v72 ^ 1 | v68;
      id v33 = v83;
      if (v74)
      {
LABEL_55:
        v45->_shouldAutomaticallyUseCMMInMessagesIfThresholdMet = [(PUActivityViewController *)v45 _calculateAutomaticCMMSendingBehavior];
        [(PUActivityViewController *)v45 setCompletionWithItemsHandler:0];
        CGSize v76 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
        v45->_lastSelectedActivityFrame.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
        v45->_lastSelectedActivityFrame.size = v76;
        v45->_readyForInteraction = 1;
        [(PUActivityViewController *)v45 _updateSourceControllerPreferredPreparationBehavior];
        [(PUActivityViewController *)v45 _updateSourceControllerSharingPreferencesInAllItems];
        [(PUActivityViewController *)v45 _updateSharingHeaderIfNeeded];

        id v14 = obja;
        id v40 = v81;
        v36 = v82;
        goto LABEL_56;
      }
      id v75 = PLSharingGetLog();
      if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AE9F8000, v75, OS_LOG_TYPE_DEFAULT, "In lockdown mode. All Photos Data OFF by default.", buf, 2u);
      }
    }
    else
    {
      p_int sendAsAssetBundles = &v45->_sendAsAssetBundles;
      id v33 = v83;
    }
    *p_int sendAsAssetBundles = 0;
    goto LABEL_55;
  }
LABEL_56:

  return v45;
}

- (PUActivityViewController)initWithAssetItems:(id)a3 photosApplicationActivities:(id)a4 linkPresentation:(id)a5
{
  return [(PUActivityViewController *)self initWithAssetItems:a3 photosApplicationActivities:a4 linkPresentation:a5 assetIdentifiers:0 sharingViewModel:0];
}

- (PUActivityViewController)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUActivityViewController.m", 581, @"%s is not available as initializer", "-[PUActivityViewController init]");

  abort();
}

+ (BOOL)cmmMediaTypeSpecificFileSizeThresholdIsMetForAssetItems:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F90068] sharedInstance];
  uint64_t v5 = [v4 shareSheetLinkSpatialVideoFileSizeThresholdMB];

  uint64_t v6 = [MEMORY[0x1E4F90068] sharedInstance];
  uint64_t v7 = [v6 shareSheetLinkSpatialImageFileSizeThresholdMB];

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v8 = v3;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v43 objects:v50 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v29 = v7;
    uint64_t v30 = v5;
    unint64_t v36 = v7 << 20;
    unint64_t v37 = v5 << 20;
    uint64_t v11 = *(void *)v44;
    uint64_t v31 = *(void *)v44;
    id v32 = v8;
LABEL_3:
    uint64_t v12 = 0;
    uint64_t v33 = v10;
    while (1)
    {
      if (*(void *)v44 != v11) {
        objc_enumerationMutation(v8);
      }
      id v13 = *(void **)(*((void *)&v43 + 1) + 8 * v12);
      id v14 = objc_msgSend(v13, "asset", v29);
      [v14 fetchPropertySetsIfNeeded];
      if ([v14 isSpatialMedia]) {
        break;
      }
LABEL_31:

      if (++v12 == v10)
      {
        uint64_t v10 = [v8 countByEnumeratingWithState:&v43 objects:v50 count:16];
        if (v10) {
          goto LABEL_3;
        }
        goto LABEL_33;
      }
    }
    id v15 = [v13 asset];
    id v16 = objc_alloc_init(MEMORY[0x1E4F39278]);
    id v42 = 0;
    uint64_t v17 = [MEMORY[0x1E4F39270] fetchResourcesToShareForAsset:v15 requestOptions:v16 error:&v42];
    id v18 = v42;
    id v34 = v18;
    uint64_t v35 = v16;
    if (v17)
    {
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v19 = v17;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v38 objects:v47 count:16];
      if (v20)
      {
        unint64_t v21 = 0;
        uint64_t v22 = *(void *)v39;
        while (2)
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v39 != v22) {
              objc_enumerationMutation(v19);
            }
            v21 += [*(id *)(*((void *)&v38 + 1) + 8 * i) fileSize];
            int v24 = [v15 isVideo];
            if (v21 > v37) {
              int v25 = v24;
            }
            else {
              int v25 = 0;
            }
            if ((v25 & 1) != 0 || [v15 isPhoto] && v21 > v36)
            {
              LOBYTE(v20) = v25 ^ 1;
              goto LABEL_23;
            }
          }
          uint64_t v20 = [v19 countByEnumeratingWithState:&v38 objects:v47 count:16];
          if (v20) {
            continue;
          }
          break;
        }
        int v25 = 0;
LABEL_23:
        id v8 = v32;
        uint64_t v10 = v33;
        uint64_t v11 = v31;
        goto LABEL_28;
      }
    }
    else
    {
      uint64_t v26 = (uint64_t)v18;
      id v19 = PLShareSheetGetLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v49 = v26;
        _os_log_impl(&dword_1AE9F8000, v19, OS_LOG_TYPE_ERROR, "Auto-CMM: Spatial media resource request error: %@", buf, 0xCu);
      }
      LOBYTE(v20) = 0;
    }
    int v25 = 0;
LABEL_28:

    if (!v17) {
      goto LABEL_40;
    }
    if (v25)
    {
      uint64_t v27 = PLShareSheetGetLog();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v49 = v30;
        _os_log_impl(&dword_1AE9F8000, v27, OS_LOG_TYPE_DEFAULT, "Auto-CMM: Selected spatial video exceeds Messages size threshold (%lluMB) for maintaining spatial data", buf, 0xCu);
      }
      goto LABEL_39;
    }
    if (v20)
    {
      uint64_t v27 = PLShareSheetGetLog();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v49 = v29;
        _os_log_impl(&dword_1AE9F8000, v27, OS_LOG_TYPE_DEFAULT, "Auto-CMM: Selected spatial image exceeds Messages size threshold (%lluMB) for maintaining spatial data", buf, 0xCu);
      }
      LOBYTE(v20) = 1;
LABEL_39:

LABEL_40:
      goto LABEL_41;
    }
    goto LABEL_31;
  }
LABEL_33:
  LOBYTE(v20) = 0;
  LOBYTE(v25) = 0;
LABEL_41:

  return v25 | v20;
}

+ (BOOL)cmmFileSizeThresholdIsMetForAssetItems:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F90068] sharedInstance];
  uint64_t v5 = [v4 shareSheetLinkTotalFileSizeThresholdMB];

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v6 = v3;
  uint64_t v28 = [v6 countByEnumeratingWithState:&v35 objects:v46 count:16];
  if (v28)
  {
    uint64_t v7 = v5;
    unint64_t v8 = 0;
    uint64_t v24 = v7;
    uint64_t v25 = 0;
    unint64_t v9 = v7 << 20;
    uint64_t v26 = v6;
    uint64_t v27 = *(void *)v36;
    while (2)
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v36 != v27) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v11, "asset", v24);
        id v13 = objc_alloc_init(MEMORY[0x1E4F39278]);
        objc_msgSend(v13, "setTreatLivePhotoAsStill:", objc_msgSend(v11, "excludeLiveness"));
        id v34 = 0;
        id v14 = [MEMORY[0x1E4F39270] fetchResourcesToShareForAsset:v12 requestOptions:v13 error:&v34];
        id v29 = v34;
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        id v15 = v14;
        uint64_t v16 = [v15 countByEnumeratingWithState:&v30 objects:v45 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v31;
          while (2)
          {
            for (uint64_t j = 0; j != v17; ++j)
            {
              if (*(void *)v31 != v18) {
                objc_enumerationMutation(v15);
              }
              v8 += [*(id *)(*((void *)&v30 + 1) + 8 * j) fileSize];
              if (v8 > v9)
              {
                uint64_t v6 = v26;
                uint64_t v25 = [v26 indexOfObject:v11];
                char v20 = 1;
                goto LABEL_17;
              }
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v30 objects:v45 count:16];
            if (v17) {
              continue;
            }
            break;
          }
          char v20 = 0;
          uint64_t v6 = v26;
        }
        else
        {
          char v20 = 0;
        }
LABEL_17:

        if (v20)
        {

          uint64_t v22 = PLShareSheetGetLog();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218496;
            double v40 = (double)v8 * 0.000000953674316;
            __int16 v41 = 2048;
            uint64_t v42 = v25 + 1;
            __int16 v43 = 2048;
            uint64_t v44 = v24;
            _os_log_impl(&dword_1AE9F8000, v22, OS_LOG_TYPE_DEFAULT, "Auto-CMM: Total selected file size is %.1fMB for the first %lu items, exceeding the threshold (%lluMB)", buf, 0x20u);
          }
          BOOL v21 = 1;
          goto LABEL_24;
        }
      }
      uint64_t v28 = [v6 countByEnumeratingWithState:&v35 objects:v46 count:16];
      if (v28) {
        continue;
      }
      break;
    }
  }
  BOOL v21 = 0;
  uint64_t v22 = v6;
LABEL_24:

  return v21;
}

+ (BOOL)cmmAssetCountThresholdIsMetForAssetItems:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [a3 count];
  id v4 = [MEMORY[0x1E4F90068] sharedInstance];
  unint64_t v5 = [v4 shareSheetLinkAssetCountThreshold];

  if (v3 >= v5)
  {
    uint64_t v6 = PLShareSheetGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 134218240;
      unint64_t v9 = v3;
      __int16 v10 = 2048;
      unint64_t v11 = v5;
      _os_log_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_DEFAULT, "Auto-CMM: Selected asset count (%ld) is over threshold (%ld)", (uint8_t *)&v8, 0x16u);
    }
  }
  return v3 >= v5;
}

+ (BOOL)cmmThresholdIsMetForAssetItems:(id)a3
{
  id v3 = a3;
  if (([(id)objc_opt_class() cmmAssetCountThresholdIsMetForAssetItems:v3] & 1) != 0
    || ([(id)objc_opt_class() cmmFileSizeThresholdIsMetForAssetItems:v3] & 1) != 0)
  {
    char v4 = 1;
  }
  else
  {
    char v4 = [(id)objc_opt_class() cmmMediaTypeSpecificFileSizeThresholdIsMetForAssetItems:v3];
  }

  return v4;
}

+ (PUActivityViewController)new
{
  char v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"PUActivityViewController.m", 585, @"%s is not available as initializer", "+[PUActivityViewController new]");

  abort();
}

+ (BOOL)_shouldReverseOrderOfSharedItemsInDataSource:(id)a3
{
  id v3 = a3;
  char v4 = [v3 sortDescriptors];
  if ([v4 count])
  {
    unint64_t v5 = [v4 firstObject];
    int v6 = [v5 ascending] ^ 1;
  }
  else
  {
    unint64_t v5 = [v3 containerAssetCollection];
    char v10 = 1;
    uint64_t v8 = [MEMORY[0x1E4F90058] sortOrderFromCollection:v5 isAscending:&v10];
    if ((unint64_t)(v8 - 2) < 2)
    {
      LOBYTE(v6) = v10 == 0;
    }
    else if (v8 == 1)
    {
      if (objc_msgSend(v5, "px_isRegularAlbum"))
      {
        LOBYTE(v6) = 0;
      }
      else
      {
        int v9 = objc_msgSend(v5, "px_isHighlight");
        int v6 = (v9 | objc_msgSend(v5, "px_isMemory")) ^ 1;
      }
    }
    else
    {
      LOBYTE(v6) = v8 == 4;
    }
  }

  return v6;
}

+ (BOOL)needsConfidentialityCheckForActivityType:(id)a3
{
  uint64_t v3 = needsConfidentialityCheckForActivityType__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&needsConfidentialityCheckForActivityType__onceToken, &__block_literal_global_227);
  }
  char v5 = [(id)needsConfidentialityCheckForActivityType___confidentialityExcludedActivities containsObject:v4];

  return v5 ^ 1;
}

void __69__PUActivityViewController_needsConfidentialityCheckForActivityType___block_invoke()
{
  v8[12] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F909D0];
  v8[0] = *MEMORY[0x1E4F90A20];
  v8[1] = v0;
  uint64_t v1 = *MEMORY[0x1E4F90AF8];
  v8[2] = *MEMORY[0x1E4F90A10];
  v8[3] = v1;
  uint64_t v2 = *MEMORY[0x1E4F90940];
  void v8[4] = *MEMORY[0x1E4F90928];
  v8[5] = v2;
  uint64_t v3 = *MEMORY[0x1E4F90970];
  v8[6] = *MEMORY[0x1E4F90A60];
  v8[7] = v3;
  uint64_t v4 = *MEMORY[0x1E4F909A0];
  v8[8] = *MEMORY[0x1E4F90A38];
  v8[9] = v4;
  uint64_t v5 = *MEMORY[0x1E4F90AB0];
  v8[10] = *MEMORY[0x1E4F90B10];
  v8[11] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:12];
  uint64_t v7 = (void *)needsConfidentialityCheckForActivityType___confidentialityExcludedActivities;
  needsConfidentialityCheckForActivityType___confidentialityExcludedActivities = v6;
}

+ (id)externalApplicationExcludedPhotosActivityTypes
{
  uint8_t v5[16] = *MEMORY[0x1E4F143B8];
  v5[0] = @"PLActivityTypeUseAsWallpaper";
  v5[1] = @"com.apple.mobileslideshow.StreamShareService";
  v5[2] = @"PUActivityTypeHide";
  v5[3] = @"PUActivityTypeDuplicate";
  v5[4] = @"PUActivityTypeSetKeyFace";
  void v5[5] = @"PUActivityTypeNotThisPerson";
  v5[6] = @"PUActivityTypeInternalAutoLoopFeedback";
  v5[7] = @"PUActivityTypeInternalImageQualityFeedback";
  void v5[8] = @"PUActivityTypeAddToAlbum";
  v5[9] = @"PUActivityTypeCopyLink";
  uint64_t v2 = *MEMORY[0x1E4F90A68];
  v5[10] = *MEMORY[0x1E4F90A70];
  v5[11] = v2;
  v5[12] = @"PUActivityTypeRemoveFromFeaturedPhotos";
  v5[13] = @"PUActivityTypeEditDateTime";
  v5[14] = @"PUActivityTypeEditLocation";
  v5[15] = @"PUActivityTypeSuggestLessPerson";
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:16];
  return v3;
}

+ (id)excludedPhotosActivityTypesForPresentationSource:(unint64_t)a3
{
  v34[10] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [MEMORY[0x1E4F90108] sharedInstance];
  int v5 = [v4 excludeActionsFromShareSheet];

  uint64_t v6 = [MEMORY[0x1E4FB16C8] currentDevice];
  if ([v6 userInterfaceIdiom] == 1)
  {
    uint64_t v7 = [MEMORY[0x1E4F90108] sharedInstance];
    int v8 = [v7 enableActionsMenuOnPad];
  }
  else
  {
    int v8 = 0;
  }

  int v9 = [MEMORY[0x1E4FB16C8] currentDevice];
  if ([v9 userInterfaceIdiom])
  {
    int v10 = 0;
  }
  else
  {
    unint64_t v11 = [MEMORY[0x1E4F90108] sharedInstance];
    int v10 = [v11 enableActionsMenuOnPhone];
  }
  uint64_t v12 = [MEMORY[0x1E4F90108] sharedInstance];
  uint64_t v13 = [v12 actionsMenuLocation];

  if (v13) {
    int v14 = v5 & (v8 | v10);
  }
  else {
    int v14 = 0;
  }
  uint64_t v15 = *MEMORY[0x1E4F90A10];
  v34[0] = *MEMORY[0x1E4F909D0];
  v34[1] = v15;
  uint64_t v16 = *MEMORY[0x1E4F90AF8];
  uint64_t v17 = *MEMORY[0x1E4F90970];
  v34[2] = *MEMORY[0x1E4F90AF8];
  v34[3] = v17;
  uint64_t v18 = *MEMORY[0x1E4F909E0];
  void v34[4] = *MEMORY[0x1E4F909D8];
  v34[5] = v18;
  v34[6] = *MEMORY[0x1E4F90B10];
  v34[7] = @"PUActivityTypeRemoveFromFeaturedPhotos";
  v34[8] = *MEMORY[0x1E4F90B20];
  v34[9] = @"PUActivityTypeNotThisPerson";
  id v19 = (void *)0x1E4F1C000;
  char v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:10];
  BOOL v21 = (void *)[v20 mutableCopy];

  uint64_t v22 = [MEMORY[0x1E4F90688] sharedInstance];
  if (([v22 showMoveToLibraryActionsInShareSheet] & 1) == 0)
  {
    [v21 addObject:*MEMORY[0x1E4F90A70]];
    [v21 addObject:*MEMORY[0x1E4F90A68]];
  }
  if (a3 == 2)
  {
    v32[0] = @"PUActivityTypeHide";
    v32[1] = @"PUActivityTypeDuplicate";
    v32[2] = v16;
    v32[3] = @"PUActivityTypeEditDateTime";
    void v32[4] = @"PUActivityTypeEditLocation";
    v32[5] = @"PLActivityTypeAlbumStream";
    v32[6] = @"com.apple.mobileslideshow.StreamShareService";
    v32[7] = @"PUActivityTypeSetKeyFace";
    v32[8] = @"PUActivityTypeNotThisPerson";
    v32[9] = @"PUActivityTypeSuggestLessPerson";
    v32[10] = @"PUActivityTypeAddToAlbum";
    v32[11] = @"PUActivityTypeCopyLink";
    v32[12] = @"PUActivityTypeRemoveFromFeaturedPhotos";
    v32[13] = @"PUActivityTypeInternalAutoLoopFeedback";
    uint64_t v25 = *MEMORY[0x1E4F90A50];
    v32[14] = @"PUActivityTypeInternalImageQualityFeedback";
    v32[15] = v25;
    id v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:16];
LABEL_19:
    id v19 = v24;
    goto LABEL_23;
  }
  if (a3 != 1)
  {
    if (a3) {
      goto LABEL_23;
    }
    uint64_t v23 = (void *)MEMORY[0x1E4F1CBF0];
    if (v14) {
      uint64_t v23 = v21;
    }
    id v24 = v23;
    goto LABEL_19;
  }
  id v26 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v33[0] = @"PUActivityTypeHide";
  v33[1] = @"PUActivityTypeDuplicate";
  v33[2] = v16;
  v33[3] = @"PUActivityTypeEditDateTime";
  v33[4] = @"PUActivityTypeEditLocation";
  v33[5] = @"PUActivityTypeInternalImageQualityFeedback";
  v33[6] = *MEMORY[0x1E4F90A50];
  v33[7] = v17;
  uint64_t v27 = *MEMORY[0x1E4F90AD0];
  v33[8] = *MEMORY[0x1E4F90AB8];
  v33[9] = v27;
  uint64_t v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:10];
  id v29 = (void *)[v26 initWithArray:v28];

  if (v14) {
    [v29 addObjectsFromArray:v21];
  }
  long long v30 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v29];
  id v19 = [v30 array];

LABEL_23:
  return v19;
}

+ (id)photosApplicationActivities:(BOOL)a3
{
  int v5 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v6 = [a1 defaultActivityTypeOrder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __56__PUActivityViewController_photosApplicationActivities___block_invoke;
  v9[3] = &unk_1E5F22B70;
  id v7 = v5;
  id v10 = v7;
  BOOL v11 = a3;
  [v6 enumerateObjectsUsingBlock:v9];

  return v7;
}

void __56__PUActivityViewController_photosApplicationActivities___block_invoke(uint64_t a1, void *a2)
{
  id v32 = a2;
  if ([v32 isEqualToString:*MEMORY[0x1E4F90970]])
  {
    uint64_t v3 = objc_alloc_init(PUCompositeVideoActivity);
    if (v3) {
      [*(id *)(a1 + 32) addObject:v3];
    }
  }
  if ([v32 isEqualToString:*MEMORY[0x1E4F9F380]])
  {
    uint64_t v4 = objc_alloc_init(PUMessageActivity);
    if (v4) {
      [*(id *)(a1 + 32) addObject:v4];
    }
  }
  if ([v32 isEqualToString:*MEMORY[0x1E4F9F370]])
  {
    int v5 = objc_alloc_init(PUMailActivity);
    if (v5) {
      [*(id *)(a1 + 32) addObject:v5];
    }
  }
  if ([v32 isEqualToString:*MEMORY[0x1E4F90A38]])
  {
    uint64_t v6 = objc_alloc_init(PUInternalImageQualityFeedbackActivity);
    if (v6) {
      [*(id *)(a1 + 32) addObject:v6];
    }
  }
  if ([v32 isEqualToString:*MEMORY[0x1E4F90A20]])
  {
    id v7 = objc_alloc_init(PUInternalAutoLoopFeedbackActivity);
    if (v7) {
      [*(id *)(a1 + 32) addObject:v7];
    }
  }
  if ([v32 isEqualToString:*MEMORY[0x1E4F90A30]])
  {
    int v8 = objc_alloc_init(PUInternalGIFExportActivity);
    if (v8) {
      [*(id *)(a1 + 32) addObject:v8];
    }
  }
  if ([v32 isEqualToString:*MEMORY[0x1E4F9F360]])
  {
    int v9 = objc_alloc_init(PUCopyToPasteboardActivity);
    if (v9) {
      [*(id *)(a1 + 32) addObject:v9];
    }
  }
  if ([v32 isEqualToString:*MEMORY[0x1E4F90988]])
  {
    id v10 = objc_alloc_init(PUCopyLinkActivity);
    if (v10) {
      [*(id *)(a1 + 32) addObject:v10];
    }
  }
  if ([v32 isEqualToString:*MEMORY[0x1E4F909F8]])
  {
    BOOL v11 = objc_alloc_init(PUExportUnmodifiedOriginalsActivity);
    if (v11) {
      [*(id *)(a1 + 32) addObject:v11];
    }
  }
  if ([v32 isEqualToString:*MEMORY[0x1E4F90B20]])
  {
    uint64_t v12 = objc_alloc_init(PUContentSyndicationSaveToLibraryActivity);
    if (v12) {
      [*(id *)(a1 + 32) addObject:v12];
    }
  }
  if ([v32 isEqualToString:*MEMORY[0x1E4F909D8]])
  {
    uint64_t v13 = objc_alloc_init(PUEditDateTimeActivity);
    if (v13) {
      [*(id *)(a1 + 32) addObject:v13];
    }
  }
  if ([v32 isEqualToString:*MEMORY[0x1E4F909E0]])
  {
    int v14 = objc_alloc_init(PUEditLocationActivity);
    if (v14) {
      [*(id *)(a1 + 32) addObject:v14];
    }
  }
  if ([v32 isEqualToString:*MEMORY[0x1E4F90AB8]])
  {
    uint64_t v15 = objc_alloc_init(PUSetKeyFaceActivity);
    if (v15) {
      [*(id *)(a1 + 32) addObject:v15];
    }
  }
  if ([v32 isEqualToString:*MEMORY[0x1E4F90AD0]])
  {
    uint64_t v16 = objc_alloc_init(PUSetSocialGroupKeyPhotoActivity);
    if (v16) {
      [*(id *)(a1 + 32) addObject:v16];
    }
  }
  if ([v32 isEqualToString:*MEMORY[0x1E4F90A78]])
  {
    uint64_t v17 = objc_alloc_init(PUNotThisPersonActivity);
    if (v17) {
      [*(id *)(a1 + 32) addObject:v17];
    }
  }
  if ([v32 isEqualToString:*MEMORY[0x1E4F90AF8]])
  {
    uint64_t v18 = objc_alloc_init(PUSlideShowActivity);
    if (v18) {
      [*(id *)(a1 + 32) addObject:v18];
    }
  }
  if ([v32 isEqualToString:*MEMORY[0x1E4F90948]])
  {
    id v19 = objc_alloc_init(PUAirPlayActivity);
    if (v19) {
      [*(id *)(a1 + 32) addObject:v19];
    }
  }
  if ([v32 isEqualToString:*MEMORY[0x1E4F90A60]])
  {
    char v20 = objc_alloc_init(PUWallpaperActivity);
    if (v20) {
      [*(id *)(a1 + 32) addObject:v20];
    }
  }
  if ([v32 isEqualToString:*MEMORY[0x1E4F90A10]])
  {
    BOOL v21 = objc_alloc_init(PUHideActivity);
    if (v21) {
      [*(id *)(a1 + 32) addObject:v21];
    }
  }
  if ([v32 isEqualToString:*MEMORY[0x1E4F90B10]])
  {
    uint64_t v22 = objc_alloc_init(PUSuggestLessPersonActivity);
    if (v22) {
      [*(id *)(a1 + 32) addObject:v22];
    }
  }
  if ([v32 isEqualToString:*MEMORY[0x1E4F9F3C8]])
  {
    uint64_t v23 = objc_alloc_init(PUSaveToCameraRollActivity);
    if (v23) {
      [*(id *)(a1 + 32) addObject:v23];
    }
  }
  if ([v32 isEqualToString:*MEMORY[0x1E4F909D0]])
  {
    id v24 = objc_alloc_init(PUDuplicateActivity);
    if (v24) {
      [*(id *)(a1 + 32) addObject:v24];
    }
  }
  if ([v32 isEqualToString:*MEMORY[0x1E4F90928]])
  {
    uint64_t v25 = objc_alloc_init(PUAddToAlbumActivity);
    if (v25) {
      [*(id *)(a1 + 32) addObject:v25];
    }
  }
  if ([v32 isEqualToString:*MEMORY[0x1E4F90940]])
  {
    id v26 = objc_alloc_init(PUAddToLastUsedAlbumActivity);
    if (v26) {
      [*(id *)(a1 + 32) addObject:v26];
    }
  }
  if ([v32 isEqualToString:*MEMORY[0x1E4F90950]])
  {
    uint64_t v27 = objc_alloc_init(PUAlbumStreamActivity);
    if (v27) {
      [*(id *)(a1 + 32) addObject:v27];
    }
  }
  if ([v32 isEqualToString:*MEMORY[0x1E4F9F350]])
  {
    uint64_t v28 = objc_alloc_init(PUAssignToContactActivity);
    if (v28) {
      [*(id *)(a1 + 32) addObject:v28];
    }
  }
  if (MEMORY[0x1B3E7A510]() && [v32 isEqualToString:*MEMORY[0x1E4F90A50]])
  {
    id v29 = objc_alloc_init(MEMORY[0x1E4F90718]);
    if (v29) {
      [*(id *)(a1 + 32) addObject:v29];
    }
  }
  if (*(unsigned char *)(a1 + 40))
  {
    if ([v32 isEqualToString:*MEMORY[0x1E4F90A70]])
    {
      long long v30 = objc_alloc_init(PUMoveAssetsToSharedLibraryActivity);
      if (v30) {
        [*(id *)(a1 + 32) addObject:v30];
      }
    }
    if ([v32 isEqualToString:*MEMORY[0x1E4F90A68]])
    {
      long long v31 = objc_alloc_init(PUMoveAssetsToPersonalLibraryActivity);
      if (v31) {
        [*(id *)(a1 + 32) addObject:v31];
      }
    }
  }
}

+ (id)actionSheetPhotosApplicationActivities
{
  uint64_t v2 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v3 = objc_alloc_init(PUMessageActivity);
  [v2 addObject:v3];

  uint64_t v4 = objc_alloc_init(PUMailActivity);
  [v2 addObject:v4];

  return v2;
}

+ (id)defaultActivityTypeOrder
{
  if (defaultActivityTypeOrder_predicate != -1) {
    dispatch_once(&defaultActivityTypeOrder_predicate, &__block_literal_global_4265);
  }
  uint64_t v2 = (void *)defaultActivityTypeOrder_defaultActivityTypeOrder;
  return v2;
}

void __52__PUActivityViewController_defaultActivityTypeOrder__block_invoke()
{
  v39[3] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v1 = *MEMORY[0x1E4F9F370];
  v39[0] = *MEMORY[0x1E4F9F380];
  v39[1] = v1;
  v39[2] = *MEMORY[0x1E4F9F3D8];
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:3];
  [v0 addObjectsFromArray:v2];

  uint64_t v3 = *MEMORY[0x1E4F90AC0];
  v38[0] = *MEMORY[0x1E4F90AA8];
  v38[1] = v3;
  uint64_t v4 = *MEMORY[0x1E4F90B58];
  v38[2] = *MEMORY[0x1E4F90AC8];
  v38[3] = v4;
  uint64_t v5 = *MEMORY[0x1E4F9F3E0];
  v38[4] = *MEMORY[0x1E4F90AA0];
  v38[5] = v5;
  uint64_t v6 = *MEMORY[0x1E4F90A70];
  v38[6] = *MEMORY[0x1E4F90AF0];
  v38[7] = v6;
  uint64_t v7 = *MEMORY[0x1E4F9F3C8];
  v38[8] = *MEMORY[0x1E4F90A68];
  v38[9] = v7;
  uint64_t v8 = *MEMORY[0x1E4F909B0];
  v38[10] = *MEMORY[0x1E4F909A8];
  v38[11] = v8;
  uint64_t v9 = *MEMORY[0x1E4F90AD0];
  v38[12] = *MEMORY[0x1E4F90AB8];
  v38[13] = v9;
  uint64_t v10 = *MEMORY[0x1E4F90950];
  v38[14] = *MEMORY[0x1E4F90A78];
  v38[15] = v10;
  uint64_t v11 = *MEMORY[0x1E4F90940];
  v38[16] = *MEMORY[0x1E4F90928];
  v38[17] = v11;
  uint64_t v12 = *MEMORY[0x1E4F9F360];
  v38[18] = *MEMORY[0x1E4F90B20];
  v38[19] = v12;
  uint64_t v13 = *MEMORY[0x1E4F90B78];
  v38[20] = *MEMORY[0x1E4F90930];
  v38[21] = v13;
  uint64_t v14 = *MEMORY[0x1E4F90B30];
  v38[22] = *MEMORY[0x1E4F90B80];
  v38[23] = v14;
  uint64_t v15 = *MEMORY[0x1E4F90B40];
  v38[24] = *MEMORY[0x1E4F90968];
  v38[25] = v15;
  uint64_t v16 = *MEMORY[0x1E4F90AE8];
  v38[26] = *MEMORY[0x1E4F90B00];
  v38[27] = v16;
  uint64_t v17 = *MEMORY[0x1E4F90B48];
  v38[28] = *MEMORY[0x1E4F90B70];
  v38[29] = v17;
  uint64_t v18 = *MEMORY[0x1E4F90B50];
  v38[30] = *MEMORY[0x1E4F90B38];
  v38[31] = v18;
  uint64_t v19 = *MEMORY[0x1E4F90AE0];
  v38[32] = *MEMORY[0x1E4F90B60];
  v38[33] = v19;
  uint64_t v20 = *MEMORY[0x1E4F909D0];
  v38[34] = *MEMORY[0x1E4F90A90];
  v38[35] = v20;
  uint64_t v21 = *MEMORY[0x1E4F90A00];
  v38[36] = *MEMORY[0x1E4F90A10];
  v38[37] = v21;
  uint64_t v22 = *MEMORY[0x1E4F90978];
  v38[38] = *MEMORY[0x1E4F90990];
  v38[39] = v22;
  uint64_t v23 = *MEMORY[0x1E4F90A80];
  v38[40] = *MEMORY[0x1E4F90A18];
  v38[41] = v23;
  uint64_t v24 = *MEMORY[0x1E4F90938];
  v38[42] = *MEMORY[0x1E4F90B18];
  v38[43] = v24;
  uint64_t v25 = *MEMORY[0x1E4F90958];
  v38[44] = *MEMORY[0x1E4F909C8];
  v38[45] = v25;
  uint64_t v26 = *MEMORY[0x1E4F90B68];
  v38[46] = *MEMORY[0x1E4F90980];
  v38[47] = v26;
  uint64_t v27 = *MEMORY[0x1E4F90948];
  v38[48] = *MEMORY[0x1E4F90AF8];
  v38[49] = v27;
  uint64_t v28 = *MEMORY[0x1E4F90AB0];
  v38[50] = *MEMORY[0x1E4F90A60];
  v38[51] = v28;
  uint64_t v29 = *MEMORY[0x1E4F90970];
  v38[52] = *MEMORY[0x1E4F909A0];
  v38[53] = v29;
  uint64_t v30 = *MEMORY[0x1E4F909F8];
  v38[54] = *MEMORY[0x1E4F90988];
  v38[55] = v30;
  uint64_t v31 = *MEMORY[0x1E4F909E0];
  v38[56] = *MEMORY[0x1E4F909D8];
  v38[57] = v31;
  uint64_t v32 = *MEMORY[0x1E4F90A38];
  v38[58] = *MEMORY[0x1E4F90B10];
  v38[59] = v32;
  uint64_t v33 = *MEMORY[0x1E4F90A30];
  v38[60] = *MEMORY[0x1E4F90A20];
  v38[61] = v33;
  uint64_t v34 = *MEMORY[0x1E4F90A40];
  v38[62] = *MEMORY[0x1E4F90A50];
  v38[63] = v34;
  v38[64] = *MEMORY[0x1E4F90A58];
  v38[65] = *MEMORY[0x1E4F90A28];
  v38[66] = *MEMORY[0x1E4F90998];
  v38[67] = *MEMORY[0x1E4F909E8];
  v38[68] = *MEMORY[0x1E4F909F0];
  v38[69] = *MEMORY[0x1E4F9F378];
  v38[70] = *MEMORY[0x1E4F9F350];
  v38[71] = *MEMORY[0x1E4F9F3C0];
  long long v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:72];
  [v0 addObjectsFromArray:v35];

  uint64_t v36 = [v0 copy];
  long long v37 = (void *)defaultActivityTypeOrder_defaultActivityTypeOrder;
  defaultActivityTypeOrder_defaultActivityTypeOrder = v36;
}

+ (BOOL)isShareActivity:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4F90948];
  uint64_t v15 = *MEMORY[0x1E4F9F3C8];
  uint64_t v16 = v3;
  uint64_t v4 = *MEMORY[0x1E4F90A80];
  uint64_t v17 = *MEMORY[0x1E4F90AF8];
  uint64_t v18 = v4;
  uint64_t v5 = *MEMORY[0x1E4F90A10];
  uint64_t v19 = *MEMORY[0x1E4F9F3F0];
  uint64_t v20 = v5;
  uint64_t v6 = *MEMORY[0x1E4F909D0];
  uint64_t v21 = *MEMORY[0x1E4F90B10];
  uint64_t v22 = v6;
  uint64_t v7 = *MEMORY[0x1E4F90AD0];
  uint64_t v23 = *MEMORY[0x1E4F90AB8];
  uint64_t v24 = v7;
  uint64_t v8 = *MEMORY[0x1E4F90A20];
  uint64_t v25 = *MEMORY[0x1E4F90A78];
  uint64_t v26 = v8;
  uint64_t v9 = *MEMORY[0x1E4F90928];
  uint64_t v27 = *MEMORY[0x1E4F90A38];
  uint64_t v28 = v9;
  uint64_t v10 = *MEMORY[0x1E4F909D8];
  uint64_t v29 = *MEMORY[0x1E4F90940];
  uint64_t v30 = v10;
  uint64_t v31 = *MEMORY[0x1E4F909E0];
  uint64_t v11 = (void *)MEMORY[0x1E4F1C978];
  id v12 = a3;
  uint64_t v13 = [v11 arrayWithObjects:&v15 count:17];
  LOBYTE(v11) = objc_msgSend(v13, "containsObject:", v12, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30,
                  v31,
                  v32);

  return v11 ^ 1;
}

@end