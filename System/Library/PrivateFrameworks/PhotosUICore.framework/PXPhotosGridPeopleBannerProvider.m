@interface PXPhotosGridPeopleBannerProvider
- (BOOL)_isAllowedSuggestion:(id)a3;
- (BOOL)_workQueue_isMeContactWithIdentifier:(id)a3;
- (BOOL)isDismissed;
- (BOOL)namingSuggestionsOnly;
- (PHPerson)person;
- (PXPhotosBannerInvalidationDelegate)invalidationDelegate;
- (PXPhotosBannerPresentationDelegate)presentationDelegate;
- (PXPhotosBannerView)loadedBannerView;
- (PXPhotosGridPeopleBannerProvider)initWithPerson:(id)a3;
- (PXPhotosGridPeopleBannerProvider)initWithPerson:(id)a3 namingSuggestionsOnly:(BOOL)a4;
- (id)_analyticsBannerEventPayloadForSuggestion:(id)a3 eventType:(int64_t)a4;
- (id)_fetchAutonamingSuggestion;
- (id)_loadAddNameBannerView;
- (id)_loadContactSuggestionBannerForContact:(id)a3 isMe:(BOOL)a4;
- (id)_loadNameSuggestionBannerForName:(id)a3;
- (id)_loadReviewFacesBannerForDataSource:(id)a3;
- (void)_addLoadCompletionBlock:(id)a3;
- (void)_applySuggestedContactForBanner:(id)a3;
- (void)_applySuggestedNameForBanner:(id)a3;
- (void)_dismissBanner;
- (void)_dismissBannerAfterDelay;
- (void)_dismissBannerNotifyDelegate:(BOOL)a3;
- (void)_finishLoadWithGeneration:(unint64_t)a3 bannerView:(id)a4;
- (void)_handleDismissAfterDelay;
- (void)_invalidateLoad;
- (void)_persistNegativeUserFeedback:(id)a3;
- (void)_runReviewFacesFlow;
- (void)_setSuggestionBannerView:(id)a3 addNameBannerView:(id)a4;
- (void)_suggestionsDidFinish:(id)a3;
- (void)_workQueue_loadBannerIfNeededHasDismissedSuggestion:(BOOL)a3 completion:(id)a4;
- (void)_workQueue_loadContactSuggestionBannerForContactIdentifier:(id)a3 suggestion:(id)a4 withCompletion:(id)a5;
- (void)bannerViewDidSelectNotNow:(id)a3;
- (void)bannerViewDidSelectPrimaryAction:(id)a3;
- (void)dealloc;
- (void)didTapUnnamedPersonBanner:(id)a3;
- (void)loadBannerView:(id)a3;
- (void)setInvalidationDelegate:(id)a3;
- (void)setPerson:(id)a3;
- (void)setPresentationDelegate:(id)a3;
@end

@implementation PXPhotosGridPeopleBannerProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_person, 0);
  objc_destroyWeak((id *)&self->_presentationDelegate);
  objc_destroyWeak((id *)&self->_invalidationDelegate);
  objc_storeStrong((id *)&self->_loadCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_currentSuggestion, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_reviewFacesDataSource, 0);
  objc_storeStrong((id *)&self->_loadedAddNameBannerView, 0);
  objc_storeStrong((id *)&self->_loadedSuggestionBannerView, 0);
}

- (BOOL)isDismissed
{
  return self->_dismissed;
}

- (BOOL)namingSuggestionsOnly
{
  return self->_namingSuggestionsOnly;
}

- (PHPerson)person
{
  return self->_person;
}

- (void)setPresentationDelegate:(id)a3
{
}

- (PXPhotosBannerPresentationDelegate)presentationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationDelegate);
  return (PXPhotosBannerPresentationDelegate *)WeakRetained;
}

- (void)setInvalidationDelegate:(id)a3
{
}

- (PXPhotosBannerInvalidationDelegate)invalidationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_invalidationDelegate);
  return (PXPhotosBannerInvalidationDelegate *)WeakRetained;
}

- (void)didTapUnnamedPersonBanner:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v4 = [(PXPhotosGridPeopleBannerProvider *)self person];
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v6 = log;
    v7 = [(PXPhotosGridPeopleBannerProvider *)self person];
    v8 = [v7 localIdentifier];
    *(_DWORD *)buf = 138543362;
    v19 = v8;
    _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_DEFAULT, "Presenting name bootstrap for person %{public}@", buf, 0xCu);
  }
  v9 = +[PXPeopleBootstrapContext contextWithPerson:v4 type:1];
  v10 = NSString;
  v11 = [MEMORY[0x1E4F28F80] processInfo];
  v12 = [v11 processName];
  v13 = [@"/Library/Caches/com.apple.xbs/Sources/Photos_UICore/workspaces/photosshared/PhotosUICore/PhotosUICore/GridZero/SectionHeaders/KeyAssetSectionHeader/PXPhotosGridPeopleBannerProvider.m" lastPathComponent];
  v14 = [v10 stringWithFormat:@"%@:%@:%s:%d", v12, v13, "-[PXPhotosGridPeopleBannerProvider didTapUnnamedPersonBanner:]", 881];
  [v9 setCallerInfo:v14];

  v15 = +[PXPeopleUtilities bootstrapViewControllerForContext:v9 delegate:0];
  v16 = [(PXPhotosGridPeopleBannerProvider *)self presentationDelegate];
  v17 = [v16 presentationEnvironmentForPhotosBannerProvider:self];

  [v17 presentViewController:v15 animated:1 completionHandler:0];
}

- (void)bannerViewDidSelectNotNow:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    int64_t currentBannerType = self->_currentBannerType;
    v7 = log;
    v8 = [(PXPhotosGridPeopleBannerProvider *)self person];
    v9 = [v8 localIdentifier];
    int v27 = 134218242;
    int64_t v28 = currentBannerType;
    __int16 v29 = 2114;
    v30 = v9;
    _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_DEFAULT, "User rejected suggestion of type %lu for person %{public}@", (uint8_t *)&v27, 0x16u);
  }
  v10 = self->_currentSuggestion;
  int64_t v11 = self->_currentBannerType;
  [(PXPhotosGridPeopleBannerProvider *)self _dismissBanner];
  switch(v11)
  {
    case 0:
    case 4:
      PXAssertGetLog();
    case 1:
      v12 = [(PXPhotosGridPeopleBannerProvider *)self person];
      +[PXPeopleUtilities temporarilySuppressBootstrapOrSuggestionForPerson:v12];

      [MEMORY[0x1E4F56658] sendEvent:@"com.apple.photos.CPAnalytics.people.bootstrap.inlineControl.dismiss" withPayload:MEMORY[0x1E4F1CC08]];
      break;
    case 2:
      v13 = (void *)MEMORY[0x1E4F39330];
      v14 = [(PXPhotosGridPeopleBannerProvider *)self person];
      v15 = [v4 contactSuggestion];
      v16 = [v15 identifier];
      v17 = [v13 negativeAutonamingUserFeedbackForPerson:v14 rejectedContactIdentifier:v16];

      [(PXPhotosGridPeopleBannerProvider *)self _persistNegativeUserFeedback:v17];
      if (v10)
      {
        [MEMORY[0x1E4F8E820] logUserFeedback:1 forSuggestion:v10];
        if (!-[PNPersonSuggestion suggestionSource](v10, "suggestionSource") && [v4 style] == 3)
        {
          v18 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
          [v18 setBool:1 forKey:@"PXPeopleMePrompted"];

          [MEMORY[0x1E4F56658] sendEvent:@"com.apple.photos.CPAnalytics.people.me.confirmed" withPayload:MEMORY[0x1E4F1CC08]];
        }
        v19 = [(PXPhotosGridPeopleBannerProvider *)self _analyticsBannerEventPayloadForSuggestion:v10 eventType:2];
        [MEMORY[0x1E4F56658] sendEvent:@"com.apple.photos.people.autonaming" withPayload:v19];
      }
      goto LABEL_17;
    case 3:
      uint64_t v20 = [(PNPersonSuggestion *)v10 autonamingFeedbackStandardNameRepresentation];
      v21 = v20;
      if (v20)
      {
        id v22 = v20;
      }
      else
      {
        id v22 = [v4 nameSuggestion];
      }
      v17 = v22;

      v23 = (void *)MEMORY[0x1E4F39330];
      v24 = [(PXPhotosGridPeopleBannerProvider *)self person];
      v25 = [v23 negativeAutonamingUserFeedbackForPerson:v24 rejectedName:v17];

      [(PXPhotosGridPeopleBannerProvider *)self _persistNegativeUserFeedback:v25];
      if (v10)
      {
        [MEMORY[0x1E4F8E820] logUserFeedback:1 forSuggestion:v10];
        v26 = [(PXPhotosGridPeopleBannerProvider *)self _analyticsBannerEventPayloadForSuggestion:v10 eventType:2];
        [MEMORY[0x1E4F56658] sendEvent:@"com.apple.photos.people.autonaming" withPayload:v26];
      }
LABEL_17:

      break;
    default:
      break;
  }
}

- (void)bannerViewDidSelectPrimaryAction:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    int64_t currentBannerType = self->_currentBannerType;
    v7 = log;
    v8 = [(PXPhotosGridPeopleBannerProvider *)self person];
    v9 = [v8 localIdentifier];
    int v10 = 134218242;
    int64_t v11 = currentBannerType;
    __int16 v12 = 2114;
    v13 = v9;
    _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_DEFAULT, "User accepted suggestion of type %lu for person %{public}@", (uint8_t *)&v10, 0x16u);
  }
  switch(self->_currentBannerType)
  {
    case 0:
    case 4:
      PXAssertGetLog();
    case 1:
      [(PXPhotosGridPeopleBannerProvider *)self _runReviewFacesFlow];
      break;
    case 2:
      [(PXPhotosGridPeopleBannerProvider *)self _applySuggestedContactForBanner:v4];
      break;
    case 3:
      [(PXPhotosGridPeopleBannerProvider *)self _applySuggestedNameForBanner:v4];
      break;
    default:
      break;
  }
}

- (id)_analyticsBannerEventPayloadForSuggestion:(id)a3 eventType:(int64_t)a4
{
  v21[4] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [v5 contactIdentifier];

  if (v6)
  {
    v7 = @"contact";
  }
  else
  {
    v8 = [v5 nameComponents];

    if (v8)
    {
      v7 = @"nameComponents";
    }
    else
    {
      v9 = [v5 nameString];

      v7 = @"nameString";
      if (!v9) {
        v7 = @"unknown";
      }
    }
  }
  v20[0] = @"eventType";
  if ((unint64_t)a4 >= 3)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    v16 = [NSString stringWithUTF8String:"NSString *_AnalyticsNameForEventType(PXPhotosGridPeopleBannerEventType)"];
    v17 = v15;
    v18 = v16;
    uint64_t v19 = 763;
    goto LABEL_19;
  }
  v21[0] = off_1E5DC6A38[a4];
  v21[1] = v7;
  v20[1] = @"suggestionType";
  v20[2] = @"source";
  uint64_t v10 = [v5 suggestionSource];
  if (v10)
  {
    if (v10 != 1)
    {
      v15 = [MEMORY[0x1E4F28B00] currentHandler];
      v16 = [NSString stringWithUTF8String:"NSString *_AnalyticsNameForSuggestionSource(PNPersonSuggestionSource)"];
      v17 = v15;
      v18 = v16;
      uint64_t v19 = 773;
LABEL_19:
      [v17 handleFailureInFunction:v18 file:@"PXPhotosGridPeopleBannerProvider.m" lineNumber:v19 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    int64_t v11 = @"intelligencePlatform";
  }
  else
  {
    int64_t v11 = @"photosIntelligence";
  }
  v21[2] = v11;
  v20[3] = @"attribution";
  unint64_t v12 = [v5 attribution];
  if (v12 >= 5)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    v16 = [NSString stringWithUTF8String:"NSString *_AnalyticsNameForSuggestionAttribution(PNPersonSuggestionAttribution)"];
    v17 = v15;
    v18 = v16;
    uint64_t v19 = 789;
    goto LABEL_19;
  }
  v21[3] = off_1E5DC6A50[v12];
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:4];

  return v13;
}

- (void)_applySuggestedNameForBanner:(id)a3
{
  id v4 = a3;
  id v5 = [(PXPhotosGridPeopleBannerProvider *)self person];
  v6 = [v4 nameSuggestion];

  v7 = self->_currentSuggestion;
  [(PXPhotosGridPeopleBannerProvider *)self _dismissBannerAfterDelay];
  if (v5 && v6)
  {
    v8 = [v5 photoLibrary];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __65__PXPhotosGridPeopleBannerProvider__applySuggestedNameForBanner___block_invoke;
    v11[3] = &unk_1E5DD3158;
    v11[4] = self;
    +[PXPeopleBootstrap nameAndVerifyPerson:v5 toName:v6 photoLibrary:v8 completionHandler:v11];

    if (v7)
    {
      [MEMORY[0x1E4F8E820] logUserFeedback:0 forSuggestion:v7];
      v9 = [(PXPhotosGridPeopleBannerProvider *)self _analyticsBannerEventPayloadForSuggestion:v7 eventType:1];
      [MEMORY[0x1E4F56658] sendEvent:@"com.apple.photos.people.autonaming" withPayload:v9];
    }
  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A9AE7000, log, OS_LOG_TYPE_ERROR, "Attempted to apply a name suggestion to a person when one is missing", buf, 2u);
    }
  }
}

void __65__PXPhotosGridPeopleBannerProvider__applySuggestedNameForBanner___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    v6 = *(NSObject **)(*(void *)(a1 + 32) + 56);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      id v8 = v5;
      _os_log_error_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_ERROR, "Failed to assign name to person with error %@", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (id)_loadNameSuggestionBannerForName:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = [[PXPeopleCandidateBannerView alloc] initWithStyle:2];
    [(PXPeopleCandidateBannerView *)v5 setNameSuggestion:v4];
    [(PXPeopleCandidateBannerView *)v5 setDelegate:self];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)_applySuggestedContactForBanner:(id)a3
{
  id v4 = a3;
  id v5 = [(PXPhotosGridPeopleBannerProvider *)self person];
  v6 = [v4 contactSuggestion];
  int v7 = self->_currentSuggestion;
  [(PXPhotosGridPeopleBannerProvider *)self _dismissBannerAfterDelay];
  if (v5 && v6)
  {
    id v8 = [v5 photoLibrary];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __68__PXPhotosGridPeopleBannerProvider__applySuggestedContactForBanner___block_invoke;
    v12[3] = &unk_1E5DD3158;
    v12[4] = self;
    +[PXPeopleBootstrap nameAndVerifyPerson:v5 toContact:v6 photoLibrary:v8 completionHandler:v12];

    if (v7)
    {
      [MEMORY[0x1E4F8E820] logUserFeedback:0 forSuggestion:v7];
      if (!-[PNPersonSuggestion suggestionSource](v7, "suggestionSource") && [v4 style] == 3)
      {
        uint64_t v9 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
        [v9 setBool:1 forKey:@"PXPeopleMePrompted"];

        [MEMORY[0x1E4F56658] sendEvent:@"com.apple.photos.CPAnalytics.people.me.confirmed" withPayload:MEMORY[0x1E4F1CC08]];
      }
      uint64_t v10 = [(PXPhotosGridPeopleBannerProvider *)self _analyticsBannerEventPayloadForSuggestion:v7 eventType:1];
      [MEMORY[0x1E4F56658] sendEvent:@"com.apple.photos.people.autonaming" withPayload:v10];
    }
  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A9AE7000, log, OS_LOG_TYPE_ERROR, "Attempted to apply a contact suggestion to a person when one is missing", buf, 2u);
    }
  }
}

void __68__PXPhotosGridPeopleBannerProvider__applySuggestedContactForBanner___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    v6 = *(NSObject **)(*(void *)(a1 + 32) + 56);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      id v8 = v5;
      _os_log_error_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_ERROR, "Failed to assign contact to person with error %@", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (id)_loadContactSuggestionBannerForContact:(id)a3 isMe:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v6)
  {
    if (v4) {
      uint64_t v7 = 3;
    }
    else {
      uint64_t v7 = 1;
    }
    id v8 = [[PXPeopleCandidateBannerView alloc] initWithStyle:v7];
    [(PXPeopleCandidateBannerView *)v8 setContactSuggestion:v6];
    [(PXPeopleCandidateBannerView *)v8 setDelegate:self];
  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int64_t v11 = 0;
      _os_log_error_impl(&dword_1A9AE7000, log, OS_LOG_TYPE_ERROR, "Unable to fetch contact for expected contact suggestion banner", v11, 2u);
    }
    id v8 = 0;
  }

  return v8;
}

- (BOOL)_workQueue_isMeContactWithIdentifier:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[PXPeopleUtilities sharedContactStore];
  v16[0] = *MEMORY[0x1E4F1AE08];
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  id v13 = 0;
  uint64_t v7 = [v5 _crossPlatformUnifiedMeContactWithKeysToFetch:v6 error:&v13];
  id v8 = v13;

  if (v7)
  {
    id v9 = [v7 identifier];
    if (v9 == v4) {
      char v10 = 1;
    }
    else {
      char v10 = [v4 isEqualToString:v9];
    }
  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v8;
      _os_log_error_impl(&dword_1A9AE7000, log, OS_LOG_TYPE_ERROR, "Unable to fetch 'me' contact with error %@", buf, 0xCu);
    }
    char v10 = 0;
  }

  return v10;
}

- (void)_workQueue_loadContactSuggestionBannerForContactIdentifier:(id)a3 suggestion:(id)a4 withCompletion:(id)a5
{
  v32[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 length])
  {
    int64_t v11 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:0];
    uint64_t v12 = *MEMORY[0x1E4F1AF98];
    v32[0] = v11;
    v32[1] = v12;
    id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];

    uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F1B908]) initWithKeysToFetch:v13];
    id v15 = (void *)MEMORY[0x1E4F1B8F8];
    id v31 = v8;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
    v17 = [v15 predicateForContactsWithIdentifiers:v16];
    [v14 setPredicate:v17];

    v27[0] = 0;
    v27[1] = v27;
    v27[2] = 0x3032000000;
    v27[3] = __Block_byref_object_copy__223701;
    v27[4] = __Block_byref_object_dispose__223702;
    id v28 = 0;
    v18 = +[PXPeopleUtilities sharedContactStore];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __121__PXPhotosGridPeopleBannerProvider__workQueue_loadContactSuggestionBannerForContactIdentifier_suggestion_withCompletion___block_invoke_290;
    v26[3] = &unk_1E5DC69F0;
    v26[4] = v27;
    [v18 enumerateContactsWithFetchRequest:v14 error:0 usingBlock:v26];
    if (v9)
    {
      uint64_t v19 = [v9 suggestionSource];
      if (!v19)
      {
        char v20 = [v9 isMe];
        goto LABEL_9;
      }
      if (v19 != 1)
      {
        char v20 = 0;
        goto LABEL_9;
      }
    }
    char v20 = [(PXPhotosGridPeopleBannerProvider *)self _workQueue_isMeContactWithIdentifier:v8];
LABEL_9:
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __121__PXPhotosGridPeopleBannerProvider__workQueue_loadContactSuggestionBannerForContactIdentifier_suggestion_withCompletion___block_invoke_2;
    v22[3] = &unk_1E5DC6A18;
    id v23 = v10;
    v24 = v27;
    char v25 = v20;
    v22[4] = self;
    id v21 = v10;
    dispatch_async(MEMORY[0x1E4F14428], v22);

    _Block_object_dispose(v27, 8);
    goto LABEL_10;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __121__PXPhotosGridPeopleBannerProvider__workQueue_loadContactSuggestionBannerForContactIdentifier_suggestion_withCompletion___block_invoke;
  block[3] = &unk_1E5DD3128;
  id v30 = v10;
  id v13 = v10;
  dispatch_async(MEMORY[0x1E4F14428], block);
  uint64_t v14 = v30;
LABEL_10:
}

uint64_t __121__PXPhotosGridPeopleBannerProvider__workQueue_loadContactSuggestionBannerForContactIdentifier_suggestion_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __121__PXPhotosGridPeopleBannerProvider__workQueue_loadContactSuggestionBannerForContactIdentifier_suggestion_withCompletion___block_invoke_290(uint64_t a1, void *a2, unsigned char *a3)
{
  *a3 = 1;
}

void __121__PXPhotosGridPeopleBannerProvider__workQueue_loadContactSuggestionBannerForContactIdentifier_suggestion_withCompletion___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _loadContactSuggestionBannerForContact:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) isMe:*(unsigned __int8 *)(a1 + 56)];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)_loadAddNameBannerView
{
  id v2 = [(PXPhotosGridPeopleBannerProvider *)self person];
  uint64_t v3 = objc_msgSend(v2, "px_isHuman") ^ 1;

  id v4 = [[PXPhotosGridUnnamedPersonBannerView alloc] initWithType:v3];
  return v4;
}

- (void)_runReviewFacesFlow
{
  uint64_t v3 = [(PXPhotosGridPeopleBannerProvider *)self person];
  id v4 = +[PXPeopleBootstrapContext contextWithPerson:v3 type:3];

  [v4 setPrefetchedDataSource:self->_reviewFacesDataSource];
  [v4 setWantsNaming:0];
  id v5 = NSString;
  id v6 = [MEMORY[0x1E4F28F80] processInfo];
  uint64_t v7 = [v6 processName];
  id v8 = [@"/Library/Caches/com.apple.xbs/Sources/Photos_UICore/workspaces/photosshared/PhotosUICore/PhotosUICore/GridZero/SectionHeaders/KeyAssetSectionHeader/PXPhotosGridPeopleBannerProvider.m" lastPathComponent];
  id v9 = [v5 stringWithFormat:@"%@:%@:%s:%d", v7, v8, "-[PXPhotosGridPeopleBannerProvider _runReviewFacesFlow]", 592];
  [v4 setCallerInfo:v9];

  id v10 = +[PXPeopleUtilities bootstrapViewControllerForContext:v4 delegate:0];
  if (v10)
  {
    int64_t v11 = [(PXPhotosGridPeopleBannerProvider *)self presentationDelegate];
    uint64_t v12 = [v11 presentationEnvironmentForPhotosBannerProvider:self];

    if (v12)
    {
      [v12 presentViewController:v10 animated:1 completionHandler:0];
    }
    else
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1A9AE7000, log, OS_LOG_TYPE_ERROR, "Unable to present bootstrap for review faces flow. Missing presentation environment", buf, 2u);
      }
    }
  }
  [MEMORY[0x1E4F56658] sendEvent:@"com.apple.photos.CPAnalytics.people.bootstrap.inlineControl.review" withPayload:MEMORY[0x1E4F1CC08]];
}

- (void)_suggestionsDidFinish:(id)a3
{
  id v3 = a3;
  px_dispatch_on_main_queue();
}

void __58__PXPhotosGridPeopleBannerProvider__suggestionsDidFinish___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 40) != 1) {
    return;
  }
  id v19 = [*(id *)(a1 + 40) object];
  if (v19)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_4;
    }
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v15 = *(void *)(a1 + 48);
    uint64_t v16 = *(void *)(a1 + 32);
    v17 = (objc_class *)objc_opt_class();
    uint64_t v14 = NSStringFromClass(v17);
    v18 = objc_msgSend(v19, "px_descriptionForAssertionMessage");
    [v10 handleFailureInMethod:v15, v16, @"PXPhotosGridPeopleBannerProvider.m", 577, @"%@ should be an instance inheriting from %@, but it is %@", @"notification.object", v14, v18 object file lineNumber description];
  }
  else
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v11 = *(void *)(a1 + 48);
    uint64_t v12 = *(void *)(a1 + 32);
    id v13 = (objc_class *)objc_opt_class();
    uint64_t v14 = NSStringFromClass(v13);
    [v10 handleFailureInMethod:v11, v12, @"PXPhotosGridPeopleBannerProvider.m", 577, @"%@ should be an instance inheriting from %@, but it is nil", @"notification.object", v14 object file lineNumber description];
  }

LABEL_4:
  id v2 = [*(id *)(a1 + 32) person];
  id v3 = [v19 sourcePerson];
  id v4 = [v19 targetPerson];
  id v5 = [v3 localIdentifier];
  id v6 = [v2 localIdentifier];
  if ([v5 isEqualToString:v6])
  {

LABEL_8:
    [*(id *)(a1 + 32) _dismissBanner];
    goto LABEL_9;
  }
  uint64_t v7 = [v4 localIdentifier];
  id v8 = [v2 localIdentifier];
  int v9 = [v7 isEqualToString:v8];

  if (v9) {
    goto LABEL_8;
  }
LABEL_9:
}

- (id)_loadReviewFacesBannerForDataSource:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_reviewFacesDataSource, a3);
  if (v5)
  {
    id v6 = [[PXPeopleCandidateBannerView alloc] initWithStyle:0];
    uint64_t v7 = [(PXPhotosGridPeopleBannerProvider *)self person];
    [(PXPeopleCandidateBannerView *)v6 setPerson:v7];

    [(PXPeopleCandidateBannerView *)v6 setDelegate:self];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)_persistNegativeUserFeedback:(id)a3
{
  id v4 = a3;
  id v5 = [(PXPhotosGridPeopleBannerProvider *)self person];
  [v5 fetchPropertySetsIfNeeded];
  id v6 = [MEMORY[0x1E4F1CA80] setWithObject:v4];

  uint64_t v7 = [v5 userFeedbackProperties];
  id v8 = [v7 autonamingUserFeedbacks];

  if ([v8 count])
  {
    int v9 = [v8 set];
    [v6 unionSet:v9];
  }
  id v10 = [v5 photoLibrary];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __65__PXPhotosGridPeopleBannerProvider__persistNegativeUserFeedback___block_invoke;
  v15[3] = &unk_1E5DD32A8;
  id v16 = v5;
  id v17 = v6;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __65__PXPhotosGridPeopleBannerProvider__persistNegativeUserFeedback___block_invoke_2;
  v13[3] = &unk_1E5DD2570;
  v13[4] = self;
  id v14 = v16;
  id v11 = v16;
  id v12 = v6;
  [v10 performChanges:v15 completionHandler:v13];
}

void __65__PXPhotosGridPeopleBannerProvider__persistNegativeUserFeedback___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F39200] changeRequestForPerson:*(void *)(a1 + 32)];
  [v2 setAutonamingUserFeedbacks:*(void *)(a1 + 40)];
}

void __65__PXPhotosGridPeopleBannerProvider__persistNegativeUserFeedback___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = *(NSObject **)(*(void *)(a1 + 32) + 56);
  if (!a2)
  {
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      goto LABEL_6;
    }
    id v10 = *(void **)(a1 + 40);
    id v8 = v6;
    int v9 = [v10 localIdentifier];
    int v11 = 138543618;
    id v12 = v9;
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_error_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_ERROR, "Failed to persist negative autonaming feedback for person %{public}@ with error %@", (uint8_t *)&v11, 0x16u);
    goto LABEL_4;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void **)(a1 + 40);
    id v8 = v6;
    int v9 = [v7 localIdentifier];
    int v11 = 138543362;
    id v12 = v9;
    _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_DEFAULT, "Persisted negative autonaming feedback for person %{public}@", (uint8_t *)&v11, 0xCu);
LABEL_4:
  }
LABEL_6:
}

- (id)_fetchAutonamingSuggestion
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v3 = [(PXPhotosGridPeopleBannerProvider *)self person];
  id v4 = [v3 personUri];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = log;
      id v8 = [v3 localIdentifier];
      *(_DWORD *)buf = 138543362;
      v49 = v8;
      int v9 = "Person (%{public}@) already has associated contact, will not request suggestions";
LABEL_28:
      _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_DEFAULT, v9, buf, 0xCu);

      goto LABEL_29;
    }
    goto LABEL_29;
  }
  id v10 = [v3 contactMatchingDictionary];
  uint64_t v11 = [v10 count];

  if (v11)
  {
    id v12 = self->_log;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = v12;
      id v8 = [v3 localIdentifier];
      *(_DWORD *)buf = 138543362;
      v49 = v8;
      int v9 = "Person (%{public}@) has a non-empty contact matching dictionary, will not request suggestions";
      goto LABEL_28;
    }
LABEL_29:
    v33 = 0;
    goto LABEL_30;
  }
  __int16 v13 = objc_msgSend(v3, "px_localizedName");
  uint64_t v14 = [v13 length];

  if (v14)
  {
    uint64_t v15 = self->_log;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = v15;
      id v8 = [v3 localIdentifier];
      *(_DWORD *)buf = 138543362;
      v49 = v8;
      int v9 = "Person (%{public}@) already has a non-empty name, will not request suggestions";
      goto LABEL_28;
    }
    goto LABEL_29;
  }
  if (!+[PXPeopleUtilities canShowSuggestionForPerson:v3])
  {
    v39 = self->_log;
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = v39;
      id v8 = [v3 localIdentifier];
      *(_DWORD *)buf = 138543362;
      v49 = v8;
      int v9 = "User has ignored a suggestion for person (%{public}@) too recently. Will not request suggestions";
      goto LABEL_28;
    }
    goto LABEL_29;
  }
  [v3 fetchPropertySetsIfNeeded];
  id v16 = [v3 userFeedbackProperties];
  uint64_t v17 = [v16 autonamingUserFeedbacks];
  v18 = [(id)v17 firstObject];

  id v19 = +[PXPeopleUISettings sharedInstance];
  LOBYTE(v17) = [v19 ignoreNegativeSuggestionFeedback];

  if ((v17 & 1) == 0)
  {
    if (v18)
    {
      if ([v18 type] == 3)
      {
        char v20 = [MEMORY[0x1E4F1C9C8] date];
        id v21 = [v18 lastModifiedDate];
        [v20 timeIntervalSinceDate:v21];
        double v23 = v22;

        v24 = +[PXPeopleUISettings sharedInstance];
        uint64_t v25 = [v24 negativeFeedbackWaitPeriodMinutes];

        if (v23 < (double)v25 * 60.0)
        {
          v44 = self->_log;
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
          {
            v45 = v44;
            v46 = [v3 localIdentifier];
            *(_DWORD *)buf = 138543362;
            v49 = v46;
            _os_log_impl(&dword_1A9AE7000, v45, OS_LOG_TYPE_DEFAULT, "Skipping autonaming suggestions for person (%{public}@) because a suggestion was rejected too recently", buf, 0xCu);
          }
          v33 = 0;
          goto LABEL_44;
        }
      }
    }
  }
  v26 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v27 = [v26 BOOLForKey:@"PXPeopleMePrompted"];

  id v28 = self->_log;
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v29 = v28;
    id v30 = [v3 localIdentifier];
    id v31 = @"NO";
    if (v27) {
      id v31 = @"YES";
    }
    v32 = v31;
    *(_DWORD *)buf = 138543618;
    v49 = v30;
    __int16 v50 = 2112;
    v51 = v32;
    _os_log_impl(&dword_1A9AE7000, v29, OS_LOG_TYPE_DEFAULT, "Will fetch autonaming suggestions for person %{public}@. hasPromptedForMe: %@", buf, 0x16u);
  }
  id v47 = 0;
  v33 = [MEMORY[0x1E4F8E820] fetchAutonamingSuggestionForPerson:v3 checkIsMe:v27 ^ 1u withError:&v47];
  v34 = (__CFString *)v47;
  if (!v33)
  {
    v41 = self->_log;
    if (v34)
    {
      if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
        goto LABEL_42;
      }
      v42 = v41;
      v43 = [v3 localIdentifier];
      *(_DWORD *)buf = 138543618;
      v49 = v43;
      __int16 v50 = 2112;
      v51 = v34;
      _os_log_error_impl(&dword_1A9AE7000, v42, OS_LOG_TYPE_ERROR, "Failed to get autonaming suggestions for person %{public}@ with error %@", buf, 0x16u);
    }
    else
    {
      if (!os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_42;
      }
      v42 = v41;
      v43 = [v3 localIdentifier];
      *(_DWORD *)buf = 138543362;
      v49 = v43;
      _os_log_impl(&dword_1A9AE7000, v42, OS_LOG_TYPE_DEFAULT, "No autonaming suggestions for person %{public}@", buf, 0xCu);
    }

    goto LABEL_42;
  }
  v35 = self->_log;
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    v36 = v35;
    v37 = [v3 localIdentifier];
    *(_DWORD *)buf = 138543618;
    v49 = v37;
    __int16 v50 = 2112;
    v51 = v33;
    _os_log_impl(&dword_1A9AE7000, v36, OS_LOG_TYPE_DEFAULT, "Successfully fetched autonaming suggestion for person %{public}@: %@", buf, 0x16u);
  }
  if ([(PXPhotosGridPeopleBannerProvider *)self _isAllowedSuggestion:v33]) {
    goto LABEL_43;
  }
  v38 = self->_log;
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A9AE7000, v38, OS_LOG_TYPE_DEFAULT, "Allow-list filtered autonaming suggestion based on attribution", buf, 2u);
  }

LABEL_42:
  v33 = 0;
LABEL_43:

LABEL_44:
LABEL_30:

  return v33;
}

- (BOOL)_isAllowedSuggestion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[PXPeopleUISettings sharedInstance];
  int v6 = [v5 ignoreAttributionFiltering];

  if (v6)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl(&dword_1A9AE7000, log, OS_LOG_TYPE_DEFAULT, "Skipping attribution filtering", v12, 2u);
    }
    goto LABEL_11;
  }
  if ([v4 suggestionSource] != 1)
  {
LABEL_11:
    BOOL v10 = 1;
    goto LABEL_12;
  }
  uint64_t v8 = [v4 attribution];
  if (v8) {
    BOOL v9 = v8 == 3;
  }
  else {
    BOOL v9 = 1;
  }
  BOOL v10 = !v9;
LABEL_12:

  return v10;
}

- (void)_workQueue_loadBannerIfNeededHasDismissedSuggestion:(BOOL)a3 completion:(id)a4
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  uint64_t v7 = [(PXPhotosGridPeopleBannerProvider *)self person];
  BOOL v8 = [(PXPhotosGridPeopleBannerProvider *)self namingSuggestionsOnly];
  BOOL v9 = +[PXPeopleUISettings sharedInstance];
  int v10 = [v9 alwaysShowBanner];

  if (v10 && !a3)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A9AE7000, log, OS_LOG_TYPE_DEFAULT, "Will show suggestion banner from test setting", buf, 2u);
    }
    id v12 = +[PXPeopleUISettings sharedInstance];
    uint64_t v13 = [v12 debugBannerStyle];

    switch(v13)
    {
      case 0:
        uint64_t v14 = 1;
        uint64_t v15 = [[PXPeopleSuggestionDataSource alloc] initWithFlowType:1];
        id v16 = [(PXPeopleSuggestionDataSource *)v15 fetchAndCacheMergeCandidatesForPerson:v7];
        uint64_t v17 = 0;
        v18 = 0;
        break;
      case 1:
        v36 = +[PXPeopleUISettings sharedInstance];
        v18 = [v36 debugContactIdentifier];

        uint64_t v17 = 0;
        uint64_t v15 = 0;
        uint64_t v14 = 2;
        break;
      case 2:
        v18 = 0;
        uint64_t v15 = 0;
        uint64_t v14 = 3;
        uint64_t v17 = @"Johnny Appleseed";
        break;
      case 3:
        uint64_t v17 = 0;
        v18 = 0;
        uint64_t v15 = 0;
        uint64_t v14 = 4;
        break;
      default:
        uint64_t v14 = 0;
        uint64_t v17 = 0;
        v18 = 0;
        uint64_t v15 = 0;
        break;
    }
    v37 = +[PXPeopleUISettings sharedInstance];
    uint64_t v38 = [v37 debugBannerAttribution];
    if ((unint64_t)(v38 - 1) >= 4) {
      uint64_t v22 = 0;
    }
    else {
      uint64_t v22 = v38;
    }

    double v23 = 0;
    goto LABEL_49;
  }
  if (!a3)
  {
    double v23 = [(PXPhotosGridPeopleBannerProvider *)self _fetchAutonamingSuggestion];
    v18 = [v23 contactIdentifier];
    uint64_t v24 = [v23 nameComponents];
    uint64_t v25 = [v23 nameString];
    v26 = objc_msgSend(v7, "px_localizedName");
    uint64_t v27 = [v26 length];

    v64 = (void *)v24;
    if (v18)
    {
      id v28 = v25;
      id v29 = v18;
      uint64_t v22 = _AttributionForSuggestion(v23);
      id v30 = self->_log;
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        id v31 = v30;
        v32 = objc_msgSend(v7, "localIdentifier", v64);
        *(_DWORD *)buf = 138543362;
        v83 = v32;
        _os_log_impl(&dword_1A9AE7000, v31, OS_LOG_TYPE_DEFAULT, "Will show contact suggestion for person %{public}@", buf, 0xCu);
      }
      uint64_t v17 = 0;
      uint64_t v15 = 0;
      uint64_t v14 = 2;
      goto LABEL_48;
    }
    if (v24)
    {
      if (v27) {
        goto LABEL_30;
      }
      uint64_t v48 = v24;
      id v28 = v25;
      objc_msgSend(MEMORY[0x1E4F28F38], "localizedStringFromPersonNameComponents:style:options:", v48, 2, 0, v64);
      v42 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!objc_msgSend(v25, "length", v24) || v27)
      {
LABEL_30:
        if (v8)
        {
          id v28 = v25;
          v39 = self->_log;
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            v40 = v39;
            v41 = [v7 localIdentifier];
            *(_DWORD *)buf = 138543362;
            v83 = v41;
            _os_log_impl(&dword_1A9AE7000, v40, OS_LOG_TYPE_DEFAULT, "Review photos prompt is suppressed for person %{public}@", buf, 0xCu);
          }
          goto LABEL_47;
        }
        if (+[PXPeopleUtilities shouldShowBootstrapForPerson:v7])
        {
          v43 = [[PXPeopleSuggestionDataSource alloc] initWithFlowType:1];
          v44 = [(PXPeopleSuggestionDataSource *)v43 fetchAndCacheMergeCandidatesForPerson:v7];
          if ([MEMORY[0x1E4F39228] shouldDisplayMergeCandidates:v44 forPerson:v7])
          {
            id v28 = v25;
            uint64_t v15 = v43;
            v45 = self->_log;
            if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
            {
              v46 = v45;
              id v47 = [v7 localIdentifier];
              *(_DWORD *)buf = 138543362;
              v83 = v47;
              _os_log_impl(&dword_1A9AE7000, v46, OS_LOG_TYPE_DEFAULT, "Will show review photos prompt for person %{public}@", buf, 0xCu);
            }
            uint64_t v22 = 0;
            uint64_t v17 = 0;
            uint64_t v14 = 1;
            goto LABEL_48;
          }

          if (!v27)
          {
LABEL_62:
            id v28 = v25;
            v61 = self->_log;
            if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
            {
              v62 = v61;
              v63 = [v7 localIdentifier];
              *(_DWORD *)buf = 138543362;
              v83 = v63;
              _os_log_impl(&dword_1A9AE7000, v62, OS_LOG_TYPE_DEFAULT, "Will show add name banner for person %{public}@", buf, 0xCu);
            }
            uint64_t v22 = 0;
            uint64_t v17 = 0;
            uint64_t v15 = 0;
            uint64_t v14 = 4;
            goto LABEL_48;
          }
        }
        else if (!v27)
        {
          goto LABEL_62;
        }
        id v28 = v25;
LABEL_47:
        uint64_t v14 = 0;
        uint64_t v22 = 0;
        uint64_t v17 = 0;
        uint64_t v15 = 0;
LABEL_48:

        goto LABEL_49;
      }
      id v28 = v25;
      v42 = v25;
    }
    uint64_t v17 = v42;
    uint64_t v22 = _AttributionForSuggestion(v23);
    v49 = self->_log;
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v50 = v49;
      v51 = [v7 localIdentifier];
      *(_DWORD *)buf = 138543362;
      v83 = v51;
      _os_log_impl(&dword_1A9AE7000, v50, OS_LOG_TYPE_DEFAULT, "Will show name suggestion for person %{public}@", buf, 0xCu);
    }
    uint64_t v15 = 0;
    uint64_t v14 = 3;
    goto LABEL_48;
  }
  id v19 = objc_msgSend(v7, "px_localizedName");
  uint64_t v20 = [v19 length];

  if (v20) {
    char v21 = 1;
  }
  else {
    char v21 = v8;
  }
  if (v21)
  {
    uint64_t v14 = 0;
    uint64_t v22 = 0;
    double v23 = 0;
    uint64_t v17 = 0;
    v18 = 0;
    uint64_t v15 = 0;
  }
  else
  {
    v33 = self->_log;
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      v34 = v33;
      v35 = [v7 localIdentifier];
      *(_DWORD *)buf = 138543362;
      v83 = v35;
      _os_log_impl(&dword_1A9AE7000, v34, OS_LOG_TYPE_DEFAULT, "Will show add name banner for person %{public}@", buf, 0xCu);
    }
    uint64_t v22 = 0;
    double v23 = 0;
    uint64_t v17 = 0;
    v18 = 0;
    uint64_t v15 = 0;
    uint64_t v14 = 4;
  }
LABEL_49:
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __99__PXPhotosGridPeopleBannerProvider__workQueue_loadBannerIfNeededHasDismissedSuggestion_completion___block_invoke;
  aBlock[3] = &unk_1E5DC6998;
  aBlock[4] = self;
  uint64_t v81 = v22;
  id v52 = v6;
  id v80 = v52;
  v53 = _Block_copy(aBlock);
  v54 = v53;
  switch(v14)
  {
    case 0:
      v65[0] = MEMORY[0x1E4F143A8];
      v65[1] = 3221225472;
      v65[2] = __99__PXPhotosGridPeopleBannerProvider__workQueue_loadBannerIfNeededHasDismissedSuggestion_completion___block_invoke_6;
      v65[3] = &unk_1E5DD3280;
      v65[4] = self;
      v55 = &v66;
      id v66 = v53;
      v56 = MEMORY[0x1E4F14428];
      v57 = v65;
      goto LABEL_56;
    case 1:
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __99__PXPhotosGridPeopleBannerProvider__workQueue_loadBannerIfNeededHasDismissedSuggestion_completion___block_invoke_2;
      block[3] = &unk_1E5DD0E78;
      void block[4] = self;
      v55 = (id *)&v77;
      v77 = v15;
      id v78 = v54;
      dispatch_async(MEMORY[0x1E4F14428], block);
      v58 = v78;
      goto LABEL_54;
    case 2:
      v73[0] = MEMORY[0x1E4F143A8];
      v73[1] = 3221225472;
      v73[2] = __99__PXPhotosGridPeopleBannerProvider__workQueue_loadBannerIfNeededHasDismissedSuggestion_completion___block_invoke_3;
      v73[3] = &unk_1E5DC69C0;
      v73[4] = self;
      v55 = &v74;
      id v59 = v23;
      id v74 = v59;
      id v75 = v54;
      [(PXPhotosGridPeopleBannerProvider *)self _workQueue_loadContactSuggestionBannerForContactIdentifier:v18 suggestion:v59 withCompletion:v73];
      v58 = v75;
      goto LABEL_54;
    case 3:
      v69[0] = MEMORY[0x1E4F143A8];
      v69[1] = 3221225472;
      v69[2] = __99__PXPhotosGridPeopleBannerProvider__workQueue_loadBannerIfNeededHasDismissedSuggestion_completion___block_invoke_4;
      v69[3] = &unk_1E5DD2BB8;
      v69[4] = self;
      v55 = (id *)&v70;
      v70 = v17;
      id v71 = v23;
      id v72 = v54;
      dispatch_async(MEMORY[0x1E4F14428], v69);

      v58 = v71;
LABEL_54:

      goto LABEL_57;
    case 4:
      v67[0] = MEMORY[0x1E4F143A8];
      v67[1] = 3221225472;
      v67[2] = __99__PXPhotosGridPeopleBannerProvider__workQueue_loadBannerIfNeededHasDismissedSuggestion_completion___block_invoke_5;
      v67[3] = &unk_1E5DD3280;
      v67[4] = self;
      v55 = &v68;
      id v68 = v53;
      v56 = MEMORY[0x1E4F14428];
      v57 = v67;
LABEL_56:
      dispatch_async(v56, v57);
LABEL_57:

      break;
    default:
      break;
  }
  if (v23)
  {
    v60 = [(PXPhotosGridPeopleBannerProvider *)self _analyticsBannerEventPayloadForSuggestion:v23 eventType:0];
    [MEMORY[0x1E4F56658] sendEvent:@"com.apple.photos.people.autonaming" withPayload:v60];
  }
}

void __99__PXPhotosGridPeopleBannerProvider__workQueue_loadBannerIfNeededHasDismissedSuggestion_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a2;
  [v5 _setSuggestionBannerView:v6 addNameBannerView:a3];
  [v6 setAttribution:*(void *)(a1 + 48)];

  uint64_t v7 = *(void *)(a1 + 40);
  id v8 = [*(id *)(a1 + 32) loadedBannerView];
  (*(void (**)(uint64_t, id))(v7 + 16))(v7, v8);
}

void __99__PXPhotosGridPeopleBannerProvider__workQueue_loadBannerIfNeededHasDismissedSuggestion_completion___block_invoke_2(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) _loadReviewFacesBannerForDataSource:*(void *)(a1 + 40)];
  *(void *)(*(void *)(a1 + 32) + 40) = v4 != 0;
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 48);
  *(void *)(v2 + 48) = 0;

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __99__PXPhotosGridPeopleBannerProvider__workQueue_loadBannerIfNeededHasDismissedSuggestion_completion___block_invoke_3(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(a1 + 32) + 40) = 2 * (a2 != 0);
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v6 = *(void **)(v4 + 48);
  *(void *)(v4 + 48) = v5;
  id v7 = a2;

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __99__PXPhotosGridPeopleBannerProvider__workQueue_loadBannerIfNeededHasDismissedSuggestion_completion___block_invoke_4(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) _loadNameSuggestionBannerForName:*(void *)(a1 + 40)];
  uint64_t v2 = 3;
  if (!v3) {
    uint64_t v2 = 0;
  }
  *(void *)(*(void *)(a1 + 32) + 40) = v2;
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 48), *(id *)(a1 + 48));
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __99__PXPhotosGridPeopleBannerProvider__workQueue_loadBannerIfNeededHasDismissedSuggestion_completion___block_invoke_5(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 40) = 4;
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 48);
  *(void *)(v2 + 48) = 0;

  id v4 = [*(id *)(a1 + 32) _loadAddNameBannerView];
  [v4 setDelegate:*(void *)(a1 + 32)];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __99__PXPhotosGridPeopleBannerProvider__workQueue_loadBannerIfNeededHasDismissedSuggestion_completion___block_invoke_6(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 40) = 0;
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 48);
  *(void *)(v2 + 48) = 0;

  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v4();
}

- (void)_dismissBannerNotifyDelegate:(BOOL)a3
{
  BOOL v3 = a3;
  self->_dismissed = 1;
  self->_int64_t currentBannerType = 0;
  [(PXPhotosGridPeopleBannerProvider *)self _setSuggestionBannerView:0 addNameBannerView:0];
  [(PXPhotosGridPeopleBannerProvider *)self _invalidateLoad];
  if (v3)
  {
    id v5 = [(PXPhotosGridPeopleBannerProvider *)self invalidationDelegate];
    [v5 photosBannerProviderInvalidateLoadedBanner:self];
  }
}

- (void)_dismissBanner
{
}

- (void)_handleDismissAfterDelay
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (!self->_dismissed)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      id v4 = log;
      id v5 = [(PXPhotosGridPeopleBannerProvider *)self person];
      id v6 = [v5 localIdentifier];
      int v7 = 138543362;
      id v8 = v6;
      _os_log_error_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_ERROR, "Did not receive naming change in time for person %{public}@", (uint8_t *)&v7, 0xCu);
    }
    [(PXPhotosGridPeopleBannerProvider *)self _dismissBanner];
  }
}

- (void)_dismissBannerAfterDelay
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = log;
    id v5 = [(PXPhotosGridPeopleBannerProvider *)self person];
    id v6 = [v5 localIdentifier];
    *(_DWORD *)buf = 138543362;
    uint64_t v11 = v6;
    _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_DEFAULT, "Waiting for person name/contact change for person %{public}@", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  dispatch_time_t v7 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__PXPhotosGridPeopleBannerProvider__dismissBannerAfterDelay__block_invoke;
  block[3] = &unk_1E5DD32D0;
  objc_copyWeak(&v9, (id *)buf);
  dispatch_after(v7, MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);
}

void __60__PXPhotosGridPeopleBannerProvider__dismissBannerAfterDelay__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleDismissAfterDelay];
}

- (void)_invalidateLoad
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPhotosGridPeopleBannerProvider.m", 244, @"%s must be called on the main thread", "-[PXPhotosGridPeopleBannerProvider _invalidateLoad]");
  }
  if (self->_loadState == 1)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t loadGeneration = self->_loadGeneration;
      *(_DWORD *)buf = 134217984;
      unint64_t v8 = loadGeneration;
      _os_log_impl(&dword_1A9AE7000, log, OS_LOG_TYPE_DEFAULT, "Banner view load generation %lu invalidated while in progress", buf, 0xCu);
    }
    ++self->_loadGeneration;
  }
  self->_loadState = 0;
}

- (void)_finishLoadWithGeneration:(unint64_t)a3 bannerView:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    uint64_t v22 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPhotosGridPeopleBannerProvider.m", 220, @"%s must be called on the main thread", "-[PXPhotosGridPeopleBannerProvider _finishLoadWithGeneration:bannerView:]");
  }
  loadCompletionBlocks = self->_loadCompletionBlocks;
  uint64_t v9 = [NSNumber numberWithUnsignedInteger:a3];
  int v10 = [(NSMutableDictionary *)loadCompletionBlocks objectForKeyedSubscript:v9];
  uint64_t v11 = (void *)[v10 copy];

  uint64_t v12 = self->_loadCompletionBlocks;
  uint64_t v13 = [NSNumber numberWithUnsignedInteger:a3];
  [(NSMutableDictionary *)v12 removeObjectForKey:v13];

  unint64_t loadGeneration = self->_loadGeneration;
  log = self->_log;
  BOOL v16 = os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT);
  if (loadGeneration == a3)
  {
    if (v16)
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v29 = a3;
      _os_log_impl(&dword_1A9AE7000, log, OS_LOG_TYPE_DEFAULT, "Completed current banner view load generation %lu. Entering 'complete' state", buf, 0xCu);
    }
    if ([(NSMutableDictionary *)self->_loadCompletionBlocks count]) {
      PXAssertGetLog();
    }
    self->_loadState = 2;
  }
  else if (v16)
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v29 = a3;
    _os_log_impl(&dword_1A9AE7000, log, OS_LOG_TYPE_DEFAULT, "Completed non-final banner view load generation %lu", buf, 0xCu);
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v17 = v11;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v24 != v20) {
          objc_enumerationMutation(v17);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v23 + 1) + 8 * i) + 16))();
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v19);
  }
}

- (void)_addLoadCompletionBlock:(id)a3
{
  id v4 = NSNumber;
  unint64_t loadGeneration = self->_loadGeneration;
  loadCompletionBlocks = self->_loadCompletionBlocks;
  id v7 = a3;
  unint64_t v8 = [v4 numberWithUnsignedInteger:loadGeneration];
  id v14 = [(NSMutableDictionary *)loadCompletionBlocks objectForKeyedSubscript:v8];

  if (v14)
  {
    uint64_t v9 = (void *)[v7 copy];

    int v10 = _Block_copy(v9);
    [v14 addObject:v10];
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F1CA48];
    uint64_t v9 = _Block_copy(v7);

    int v10 = [v11 arrayWithObject:v9];
    uint64_t v12 = self->_loadCompletionBlocks;
    uint64_t v13 = [NSNumber numberWithUnsignedInteger:self->_loadGeneration];
    [(NSMutableDictionary *)v12 setObject:v10 forKeyedSubscript:v13];
  }
}

- (void)loadBannerView:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = (void (**)(id, void *))a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPhotosGridPeopleBannerProvider.m", 179, @"%s must be called on the main thread", "-[PXPhotosGridPeopleBannerProvider loadBannerView:]");
  }
  int64_t loadState = self->_loadState;
  switch(loadState)
  {
    case 2:
      uint64_t v12 = [(PXPhotosGridPeopleBannerProvider *)self loadedBannerView];
      v5[2](v5, v12);

      break;
    case 1:
      [(PXPhotosGridPeopleBannerProvider *)self _addLoadCompletionBlock:v5];
      break;
    case 0:
      unint64_t v7 = self->_loadGeneration + 1;
      self->_int64_t loadState = 1;
      self->_unint64_t loadGeneration = v7;
      [(PXPhotosGridPeopleBannerProvider *)self _addLoadCompletionBlock:v5];
      unint64_t loadGeneration = (void *)self->_loadGeneration;
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v18 = loadGeneration;
        _os_log_impl(&dword_1A9AE7000, log, OS_LOG_TYPE_DEFAULT, "Will begin banner view load generation %lu", buf, 0xCu);
      }
      BOOL dismissed = self->_dismissed;
      objc_initWeak((id *)buf, self);
      workQueue = self->_workQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __51__PXPhotosGridPeopleBannerProvider_loadBannerView___block_invoke;
      block[3] = &unk_1E5DC6970;
      void block[4] = self;
      BOOL v16 = dismissed;
      objc_copyWeak(v15, (id *)buf);
      v15[1] = loadGeneration;
      dispatch_async(workQueue, block);
      objc_destroyWeak(v15);
      objc_destroyWeak((id *)buf);
      break;
  }
}

void __51__PXPhotosGridPeopleBannerProvider_loadBannerView___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 56);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__PXPhotosGridPeopleBannerProvider_loadBannerView___block_invoke_2;
  v4[3] = &unk_1E5DCD640;
  objc_copyWeak(v5, (id *)(a1 + 40));
  v5[1] = *(id *)(a1 + 48);
  objc_msgSend(v2, "_workQueue_loadBannerIfNeededHasDismissedSuggestion:completion:", v3, v4);
  objc_destroyWeak(v5);
}

void __51__PXPhotosGridPeopleBannerProvider_loadBannerView___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = (id *)(a1 + 32);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _finishLoadWithGeneration:*(void *)(a1 + 40) bannerView:v4];
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"PXPeopleConfirmationDidFinish" object:0];

  v4.receiver = self;
  v4.super_class = (Class)PXPhotosGridPeopleBannerProvider;
  [(PXPhotosGridPeopleBannerProvider *)&v4 dealloc];
}

- (PXPhotosBannerView)loadedBannerView
{
  loadedSuggestionBannerView = self->_loadedSuggestionBannerView;
  if (!loadedSuggestionBannerView) {
    loadedSuggestionBannerView = self->_loadedAddNameBannerView;
  }
  return (PXPhotosBannerView *)loadedSuggestionBannerView;
}

- (void)_setSuggestionBannerView:(id)a3 addNameBannerView:(id)a4
{
  id v6 = (PXPeopleCandidateBannerView *)a3;
  unint64_t v7 = (PXPhotosGridUnnamedPersonBannerView *)a4;
  loadedSuggestionBannerView = self->_loadedSuggestionBannerView;
  self->_loadedSuggestionBannerView = v6;
  int v10 = v6;

  loadedAddNameBannerView = self->_loadedAddNameBannerView;
  self->_loadedAddNameBannerView = v7;
}

- (void)setPerson:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = (PHPerson *)a3;
  person = self->_person;
  if (person != v5)
  {
    int IsNamed = _PersonIsNamed(person);
    objc_storeStrong((id *)&self->_person, a3);
    int v8 = _PersonIsNamed(self->_person);
    [(PXPeopleCandidateBannerView *)self->_loadedSuggestionBannerView setPerson:v5];
    if (IsNamed != v8)
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = log;
        uint64_t v11 = [(PHPerson *)v5 localIdentifier];
        uint64_t v12 = @"NO";
        if (v8) {
          uint64_t v12 = @"YES";
        }
        uint64_t v13 = v12;
        int v14 = 138543618;
        uint64_t v15 = v11;
        __int16 v16 = 2112;
        id v17 = v13;
        _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_DEFAULT, "Will dismiss suggestion banner (if any) because the person %{public}@ has become named: %@", (uint8_t *)&v14, 0x16u);
      }
      [(PXPhotosGridPeopleBannerProvider *)self _dismissBanner];
    }
  }
}

- (PXPhotosGridPeopleBannerProvider)initWithPerson:(id)a3 namingSuggestionsOnly:(BOOL)a4
{
  id v7 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PXPhotosGridPeopleBannerProvider;
  int v8 = [(PXPhotosGridPeopleBannerProvider *)&v20 init];
  uint64_t v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_person, a3);
    v9->_namingSuggestionsOnly = a4;
    v9->_int64_t currentBannerType = 0;
    int v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v11 = dispatch_queue_attr_make_with_qos_class(v10, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v12 = dispatch_queue_create("PXPhotosGridPeopleBannerProvider-workQueue", v11);
    workQueue = v9->_workQueue;
    v9->_workQueue = (OS_dispatch_queue *)v12;

    os_log_t v14 = os_log_create((const char *)*MEMORY[0x1E4F8A240], "PeopleBanners");
    log = v9->_log;
    v9->_log = (OS_os_log *)v14;

    __int16 v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    loadCompletionBlocks = v9->_loadCompletionBlocks;
    v9->_loadCompletionBlocks = v16;

    uint64_t v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v18 addObserver:v9 selector:sel__suggestionsDidFinish_ name:@"PXPeopleConfirmationDidFinish" object:0];
  }
  return v9;
}

- (PXPhotosGridPeopleBannerProvider)initWithPerson:(id)a3
{
  return [(PXPhotosGridPeopleBannerProvider *)self initWithPerson:a3 namingSuggestionsOnly:0];
}

@end