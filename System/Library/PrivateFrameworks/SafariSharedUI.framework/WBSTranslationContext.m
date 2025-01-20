@interface WBSTranslationContext
+ (id)translationContextWithWebView:(id)a3 delegate:(id)a4;
- (BOOL)_canLogSourcePageURL;
- (BOOL)_nextURLIsEligibleForContinuedTranslation:(id)a3;
- (BOOL)_restoreContextSnapshotIfNeeded:(id)a3 forURL:(id)a4;
- (BOOL)_translationSupportedInCurrentRegion;
- (BOOL)_validateTargetLocaleSynchronously:(id)a3;
- (BOOL)createFluidProgressState;
- (BOOL)debugAlwaysShowConsentAlert;
- (BOOL)debugDelayLanguageDetection;
- (BOOL)hasConsentedToFirstTimeAlert;
- (BOOL)hasFailedURL;
- (BOOL)hasStartedTranslating;
- (BOOL)hideMessageInUnifiedField;
- (BOOL)isContinuedTranslationEnabled;
- (BOOL)isTranslationEnabled;
- (BOOL)shouldOfferTranslationUI;
- (NSArray)allowedTargetLocaleIdentifiers;
- (NSArray)availableTargetLocaleIdentifiers;
- (NSString)lastDeterminedWebpageLanguage;
- (NSString)webpageLocale;
- (WBSFluidProgressController)fluidProgressController;
- (WBSTranslationContext)initWithContentExtractor:(id)a3 contentFiller:(id)a4 delegate:(id)a5;
- (WBSTranslationContextDelegate)delegate;
- (double)_estimatedProgressWithScope:(int64_t)a3;
- (double)estimatedProgress;
- (id)_availableTargetLocaleIdentifiersConsideringCurrentWebpageLocale:(BOOL)a3;
- (id)_currentSession;
- (id)_currentSnapshot;
- (id)_genericErrorMessage;
- (id)_userVisibleErrorMessageForError:(id)a3;
- (id)expectedOrCurrentURL;
- (id)progressState;
- (id)sourceLocaleForContentExtractor:(id)a3;
- (id)targetLocaleForContentExtractor:(id)a3;
- (id)userPreferredTargetLocales;
- (id)webpageLocaleInWebExtensionFormat;
- (unint64_t)detectionNotificationLevel;
- (unint64_t)state;
- (void)_cancelProgressForNavigation:(BOOL)a3;
- (void)_computeVisibleParagraphsIfDuringInitialExtraction:(id)a3;
- (void)_dominantLocaleForTextSamples:(id)a3 url:(id)a4 completionHandler:(id)a5;
- (void)_generateJSONVersionOfContent:(id)a3 forPurpose:(unint64_t)a4 completionHandler:(id)a5;
- (void)_generateJSONVersionOfErrors:(id)a3 completionHandler:(id)a4;
- (void)_notifyDelegateToReportProgressInUnifiedField:(BOOL)a3;
- (void)_promptIfNeededToConsentToTranslationWithCompletionHandler:(id)a3;
- (void)_reportFilledFirstParagraphIfNeeded;
- (void)_reportFinishedFillingInitialPageContentIfNeeded;
- (void)_reportFinishedFillingInitialVisiblePageContentIfNeeded;
- (void)_reportLanguageDetectionAnalyticsForWebpageLocale:(id)a3 notificationLevel:(unint64_t)a4;
- (void)_reportRequestedTranslationAnalyticsForWebpageLocale:(id)a3 targetLocale:(id)a4 requestType:(int64_t)a5;
- (void)_requestTranslatingWebpageToLocale:(id)a3 requestType:(int64_t)a4 completionHandler:(id)a5;
- (void)_setState:(unint64_t)a3 usingLock:(BOOL)a4;
- (void)_setState:(unint64_t)a3 usingLock:(BOOL)a4 validatingTransitionIsAllowed:(BOOL)a5;
- (void)_startProgressForExtractingContent;
- (void)_updateCachedAPISupportedValues;
- (void)_updateProgressForFinishingInitialContentExtraction;
- (void)_updateProgressWithExtractedParagraphCount:(unint64_t)a3;
- (void)_updateProgressWithTranslatedParagraphCount:(unint64_t)a3;
- (void)cacheTextSamples:(id)a3;
- (void)clearFluidProgressState;
- (void)contentExtractor:(id)a3 didExtractContent:(id)a4;
- (void)contentExtractorDidFinishExtractingInitialContent:(id)a3;
- (void)contentFiller:(id)a3 didCompleteFillingItem:(id)a4 withError:(id)a5;
- (void)dominantLocaleForTextSamples:(id)a3 completionHandler:(id)a4;
- (void)dominantLocaleForTextSamples:(id)a3 url:(id)a4 completionHandler:(id)a5;
- (void)errorController:(id)a3 didReachThresholdForError:(id)a4;
- (void)generateDiagnosticDataForPurpose:(unint64_t)a3 completionHandler:(id)a4;
- (void)isTranslationSupportedForCurrentRegionWithCompletionHandler:(id)a3;
- (void)owningWebViewDidCommitNavigationWithURL:(id)a3 completionHandler:(id)a4;
- (void)owningWebViewDidDecidePolicy:(int64_t)a3 forNavigationAction:(id)a4 currentBackForwardListItem:(id)a5;
- (void)owningWebViewWillNavigateAndSaveCurrentSnapshotToStore:(id)a3 isEligibleForContinuedTranslation:(BOOL)a4;
- (void)owningWebViewWillNavigateToBackForwardListItemWithSnapshotStore:(id)a3 inPageCache:(BOOL)a4;
- (void)reloadPageInOriginalLanguage;
- (void)requestSendFeedbackForTranslationIssue:(int64_t)a3;
- (void)requestSendFeedbackWithCompletionHandler:(id)a3;
- (void)requestTranslatingWebpageToLocale:(id)a3 completionHandler:(id)a4;
- (void)setConsentedToFirstTimeAlert:(BOOL)a3;
- (void)setContentTranslator:(id)a3;
- (void)setFluidProgressController:(id)a3;
- (void)setPreferenceProvider:(id)a3;
- (void)setWebpageLocaleUsingCachedTextSamplesIfNeeded:(id)a3;
- (void)setWebpageLocaleWithExtractedTextSamples:(id)a3 url:(id)a4 completionHandler:(id)a5;
- (void)supportedLocalePairsWithCompletionHandler:(id)a3;
- (void)translationContext:(id)a3 translateWebpageContents:(id)a4 toTargetLocale:(id)a5 translationHandler:(id)a6;
- (void)updateMaxVisibleHeightPercentageIfNeeded:(double)a3 userDriven:(BOOL)a4;
- (void)validateTargetLocale:(id)a3 completionHandler:(id)a4;
@end

@implementation WBSTranslationContext

- (WBSTranslationContext)initWithContentExtractor:(id)a3 contentFiller:(id)a4 delegate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v24.receiver = self;
  v24.super_class = (Class)WBSTranslationContext;
  v12 = [(WBSTranslationContext *)&v24 init];
  if (v12 && get_LTTranslatorClass())
  {
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.Safari.TranslationContext", 0);
    internalQueue = v12->_internalQueue;
    v12->_internalQueue = (OS_dispatch_queue *)v13;

    v12->_synchronousIvarLock._os_unfair_lock_opaque = 0;
    v15 = (_LTTranslator *)objc_alloc_init((Class)get_LTTranslatorClass());
    translator = v12->_translator;
    v12->_translator = v15;

    objc_storeStrong((id *)&v12->_contentExtractor, a3);
    [(WBSTranslationContentExtracting *)v12->_contentExtractor setExtractionDelegate:v12];
    objc_storeStrong((id *)&v12->_contentFiller, a4);
    [(WBSTranslationContentFilling *)v12->_contentFiller setFillingDelegate:v12];
    objc_storeWeak((id *)&v12->_delegate, v11);
    objc_storeWeak((id *)&v12->_contentTranslator, v12);
    objc_storeWeak((id *)&v12->_preferenceProvider, v12);
    objc_storeWeak((id *)&v12->_languageDetector, v12);
    v17 = objc_alloc_init(WBSTranslationDiagnosticData);
    diagnosticData = v12->_diagnosticData;
    v12->_diagnosticData = v17;

    v19 = objc_alloc_init(WBSTranslationErrorController);
    errorController = v12->_errorController;
    v12->_errorController = v19;

    [(WBSTranslationErrorController *)v12->_errorController setDelegate:v12];
    [(WBSTranslationContext *)v12 _updateCachedAPISupportedValues];
    v21 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v21 addObserver:v12 selector:sel__updateCachedAPISupportedValues name:@"translationAvailabilityDidChange" object:0];

    v22 = v12;
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (NSArray)availableTargetLocaleIdentifiers
{
  return (NSArray *)[(WBSTranslationContext *)self _availableTargetLocaleIdentifiersConsideringCurrentWebpageLocale:1];
}

- (NSArray)allowedTargetLocaleIdentifiers
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__29;
  v15 = __Block_byref_object_dispose__29;
  id v16 = 0;
  p_synchronousIvarLock = &self->_synchronousIvarLock;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __55__WBSTranslationContext_allowedTargetLocaleIdentifiers__block_invoke;
  v10[3] = &unk_1E5E43620;
  v10[4] = self;
  v10[5] = &v11;
  performWithLock(&self->_synchronousIvarLock, v10);
  v4 = (void *)v12[5];
  if (!v4)
  {
    uint64_t v5 = [(WBSTranslationContext *)self _availableTargetLocaleIdentifiersConsideringCurrentWebpageLocale:0];
    v6 = (void *)v12[5];
    v12[5] = v5;

    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __55__WBSTranslationContext_allowedTargetLocaleIdentifiers__block_invoke_2;
    v9[3] = &unk_1E5E44398;
    v9[4] = self;
    v9[5] = &v11;
    performWithLock(p_synchronousIvarLock, v9);
    v4 = (void *)v12[5];
  }
  id v7 = v4;
  _Block_object_dispose(&v11, 8);

  return (NSArray *)v7;
}

void __55__WBSTranslationContext_allowedTargetLocaleIdentifiers__block_invoke(uint64_t a1)
{
}

void __55__WBSTranslationContext_allowedTargetLocaleIdentifiers__block_invoke_2(uint64_t a1)
{
}

- (BOOL)shouldOfferTranslationUI
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__WBSTranslationContext_shouldOfferTranslationUI__block_invoke;
  v8[3] = &unk_1E5E43620;
  v8[4] = self;
  v8[5] = &v9;
  performWithLock(&self->_synchronousIvarLock, v8);
  uint64_t v3 = v10[3];
  if ((unint64_t)(v3 - 1) < 4 || v3 == 6)
  {
    uint64_t v5 = [(WBSTranslationContext *)self availableTargetLocaleIdentifiers];
    BOOL v7 = [v5 count] != 0;
  }
  else
  {
    BOOL v7 = 0;
  }
  _Block_object_dispose(&v9, 8);
  return v7;
}

uint64_t __49__WBSTranslationContext_shouldOfferTranslationUI__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 176);
  return result;
}

- (unint64_t)detectionNotificationLevel
{
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = 0;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__29;
  v20 = __Block_byref_object_dispose__29;
  id v21 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__29;
  v14 = __Block_byref_object_dispose__29;
  id v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __51__WBSTranslationContext_detectionNotificationLevel__block_invoke;
  v9[3] = &unk_1E5E457B0;
  v9[4] = self;
  v9[5] = &v22;
  void v9[6] = &v16;
  v9[7] = &v10;
  performWithLock(&self->_synchronousIvarLock, v9);
  unint64_t v3 = v23[3];
  if (v3 < 8 && ((0xFDu >> v3) & 1) != 0
    || ([(id)v17[5] hideMessageInUnifiedField] & 1) != 0
    || ![(id)v11[5] length]
    || ([(WBSTranslationContext *)self availableTargetLocaleIdentifiers],
        v4 = objc_claimAutoreleasedReturnValue(),
        uint64_t v5 = [v4 count],
        v4,
        !v5))
  {
    unint64_t v7 = 0;
  }
  else
  {
    v6 = [(id)v17[5] userPreferredTargetLocales];
    unint64_t v7 = preferredBaseLocalesContainBaseLocaleIdentifier(v6, (void *)v11[5]) ^ 1;
  }
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);
  return v7;
}

void __51__WBSTranslationContext_detectionNotificationLevel__block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[5] + 8) + 24) = *(void *)(a1[4] + 176);
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 192));
  uint64_t v3 = *(void *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = WeakRetained;

  uint64_t v5 = *(void **)(a1[4] + 184);
  v6 = (id *)(*(void *)(a1[7] + 8) + 40);
  objc_storeStrong(v6, v5);
}

- (BOOL)hasStartedTranslating
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__WBSTranslationContext_hasStartedTranslating__block_invoke;
  v4[3] = &unk_1E5E43620;
  v4[4] = self;
  v4[5] = &v5;
  performWithLock(&self->_synchronousIvarLock, v4);
  unsigned int v2 = ((unint64_t)v6[3] < 8) & (0xDCu >> v6[3]);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __46__WBSTranslationContext_hasStartedTranslating__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 176);
  return result;
}

- (unint64_t)state
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __30__WBSTranslationContext_state__block_invoke;
  v4[3] = &unk_1E5E43620;
  v4[4] = self;
  v4[5] = &v5;
  performWithLock(&self->_synchronousIvarLock, v4);
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __30__WBSTranslationContext_state__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 176);
  return result;
}

- (NSString)webpageLocale
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__29;
  uint64_t v9 = __Block_byref_object_dispose__29;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __38__WBSTranslationContext_webpageLocale__block_invoke;
  v4[3] = &unk_1E5E43620;
  v4[4] = self;
  v4[5] = &v5;
  performWithLock(&self->_synchronousIvarLock, v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

void __38__WBSTranslationContext_webpageLocale__block_invoke(uint64_t a1)
{
}

- (void)setPreferenceProvider:(id)a3
{
  if (a3) {
    v4 = a3;
  }
  else {
    v4 = self;
  }
  id v5 = v4;
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __47__WBSTranslationContext_setPreferenceProvider___block_invoke;
  id v10 = &unk_1E5E40D38;
  uint64_t v11 = self;
  id v12 = v5;
  id v6 = v5;
  performWithLock(&self->_synchronousIvarLock, &v7);
  [(WBSTranslationContext *)self _updateCachedAPISupportedValues];
}

id __47__WBSTranslationContext_setPreferenceProvider___block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(void *)(a1 + 32) + 192), *(id *)(a1 + 40));
}

- (WBSFluidProgressController)fluidProgressController
{
  uint64_t v5 = 0;
  id v6 = (id *)&v5;
  uint64_t v7 = 0x3042000000;
  uint64_t v8 = __Block_byref_object_copy__22;
  uint64_t v9 = __Block_byref_object_dispose__23;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__WBSTranslationContext_fluidProgressController__block_invoke;
  v4[3] = &unk_1E5E43620;
  v4[4] = self;
  v4[5] = &v5;
  performWithLock(&self->_synchronousIvarLock, v4);
  id WeakRetained = objc_loadWeakRetained(v6 + 5);
  _Block_object_dispose(&v5, 8);
  objc_destroyWeak(&v10);
  return (WBSFluidProgressController *)WeakRetained;
}

void __48__WBSTranslationContext_fluidProgressController__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 264));
  objc_storeWeak((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), WeakRetained);
}

- (void)setFluidProgressController:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__WBSTranslationContext_setFluidProgressController___block_invoke;
  v7[3] = &unk_1E5E40D38;
  p_synchronousIvarLock = &self->_synchronousIvarLock;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  performWithLock(p_synchronousIvarLock, v7);
}

id __52__WBSTranslationContext_setFluidProgressController___block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(void *)(a1 + 32) + 264), *(id *)(a1 + 40));
}

- (WBSTranslationContextDelegate)delegate
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__29;
  id v10 = __Block_byref_object_dispose__29;
  id v11 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__WBSTranslationContext_delegate__block_invoke;
  v5[3] = &unk_1E5E43620;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (WBSTranslationContextDelegate *)v3;
}

void __33__WBSTranslationContext_delegate__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = WeakRetained;
}

- (id)webpageLocaleInWebExtensionFormat
{
  uint64_t v3 = (void *)[@"und" copy];
  id v4 = (void *)MEMORY[0x1E4F1CA20];
  uint64_t v5 = [(WBSTranslationContext *)self webpageLocale];
  uint64_t v6 = [v4 localeWithLocaleIdentifier:v5];

  uint64_t v7 = objc_msgSend(v6, "safari_localeStringInWebExtensionFormat");
  if ([v7 length])
  {
    id v8 = v7;

    uint64_t v3 = v8;
  }

  return v3;
}

- (void)cacheTextSamples:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__WBSTranslationContext_cacheTextSamples___block_invoke;
  v7[3] = &unk_1E5E40D38;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

void __42__WBSTranslationContext_cacheTextSamples___block_invoke(uint64_t a1)
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  id v2 = *(os_unfair_lock_s **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __42__WBSTranslationContext_cacheTextSamples___block_invoke_2;
  v3[3] = &unk_1E5E43620;
  v3[4] = v2;
  v3[5] = &v4;
  performWithLock(v2 + 43, v3);
  if (*((unsigned char *)v5 + 24)) {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 120), *(id *)(a1 + 40));
  }
  _Block_object_dispose(&v4, 8);
}

uint64_t __42__WBSTranslationContext_cacheTextSamples___block_invoke_2(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 32) + 176);
  if (v1) {
    BOOL v2 = v1 == 5;
  }
  else {
    BOOL v2 = 1;
  }
  char v3 = v2;
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = v3;
  return result;
}

- (void)setWebpageLocaleUsingCachedTextSamplesIfNeeded:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__WBSTranslationContext_setWebpageLocaleUsingCachedTextSamplesIfNeeded___block_invoke;
  v7[3] = &unk_1E5E420C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

void __72__WBSTranslationContext_setWebpageLocaleUsingCachedTextSamplesIfNeeded___block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 120) count])
  {
    uint64_t v2 = *(void *)(a1 + 32);
    char v3 = *(void **)(v2 + 120);
    *(void *)(v2 + 120) = 0;
    id v5 = v3;

    [*(id *)(a1 + 32) setWebpageLocaleWithExtractedTextSamples:v5 url:0 completionHandler:*(void *)(a1 + 40)];
  }
  else if (*(void *)(a1 + 40))
  {
    v7[0] = 0;
    v7[1] = v7;
    v7[2] = 0x3032000000;
    v7[3] = __Block_byref_object_copy__29;
    v7[4] = __Block_byref_object_dispose__29;
    id v8 = 0;
    id v4 = *(os_unfair_lock_s **)(a1 + 32);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __72__WBSTranslationContext_setWebpageLocaleUsingCachedTextSamplesIfNeeded___block_invoke_2;
    v6[3] = &unk_1E5E43620;
    v6[4] = v4;
    v6[5] = v7;
    performWithLock(v4 + 43, v6);
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    _Block_object_dispose(v7, 8);
  }
}

void __72__WBSTranslationContext_setWebpageLocaleUsingCachedTextSamplesIfNeeded___block_invoke_2(uint64_t a1)
{
}

- (void)setWebpageLocaleWithExtractedTextSamples:(id)a3 url:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  internalQueue = self->_internalQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __88__WBSTranslationContext_setWebpageLocaleWithExtractedTextSamples_url_completionHandler___block_invoke;
  v15[3] = &unk_1E5E44488;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  objc_copyWeak(&v19, &location);
  dispatch_async(internalQueue, v15);
  objc_destroyWeak(&v19);

  objc_destroyWeak(&location);
}

void __88__WBSTranslationContext_setWebpageLocaleWithExtractedTextSamples_url_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__29;
  v33 = __Block_byref_object_dispose__29;
  id v34 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__29;
  v27 = __Block_byref_object_dispose__29;
  id v28 = 0;
  uint64_t v2 = *(os_unfair_lock_s **)(a1 + 32);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __88__WBSTranslationContext_setWebpageLocaleWithExtractedTextSamples_url_completionHandler___block_invoke_2;
  v22[3] = &unk_1E5E45540;
  v22[4] = v2;
  v22[5] = &v29;
  v22[6] = &v23;
  performWithLock(v2 + 43, v22);
  *(unsigned char *)(*(void *)(a1 + 32) + 168) = 0;
  uint64_t v3 = [*(id *)(a1 + 40) count];
  int v4 = [(id)v30[5] isTranslationEnabled];
  if (v3) {
    int v5 = v4;
  }
  else {
    int v5 = 0;
  }
  if (v5 == 1)
  {
    id v6 = *(id *)(a1 + 40);
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v36;
      while (2)
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v36 != v9) {
            objc_enumerationMutation(v7);
          }
          if ([*(id *)(*((void *)&v35 + 1) + 8 * v10) length])
          {

            id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
            uint64_t v14 = *(void *)(a1 + 40);
            uint64_t v15 = *(void *)(a1 + 48);
            v16[0] = MEMORY[0x1E4F143A8];
            v16[1] = 3221225472;
            v16[2] = __88__WBSTranslationContext_setWebpageLocaleWithExtractedTextSamples_url_completionHandler___block_invoke_25;
            v16[3] = &unk_1E5E45800;
            objc_copyWeak(&v21, (id *)(a1 + 64));
            id v19 = *(id *)(a1 + 56);
            id v17 = *(id *)(a1 + 48);
            v20 = &v29;
            id v18 = *(id *)(a1 + 40);
            [WeakRetained dominantLocaleForTextSamples:v14 url:v15 completionHandler:v16];

            objc_destroyWeak(&v21);
            goto LABEL_19;
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v7 countByEnumeratingWithState:&v35 objects:v39 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
  }
  id v11 = WBS_LOG_CHANNEL_PREFIXTranslation();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    __88__WBSTranslationContext_setWebpageLocaleWithExtractedTextSamples_url_completionHandler___block_invoke_cold_1(a1, v3, v11);
  }
  uint64_t v12 = *(void *)(a1 + 56);
  if (v12) {
    (*(void (**)(uint64_t, uint64_t))(v12 + 16))(v12, v24[5]);
  }
LABEL_19:
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(&v29, 8);
}

void __88__WBSTranslationContext_setWebpageLocaleWithExtractedTextSamples_url_completionHandler___block_invoke_2(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 192));
  uint64_t v3 = *(void *)(a1[5] + 8);
  int v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = WeakRetained;

  int v5 = *(void **)(a1[4] + 184);
  id v6 = (id *)(*(void *)(a1[6] + 8) + 40);
  objc_storeStrong(v6, v5);
}

void __88__WBSTranslationContext_setWebpageLocaleWithExtractedTextSamples_url_completionHandler___block_invoke_25(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v8 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v9 = WeakRetained[1];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __88__WBSTranslationContext_setWebpageLocaleWithExtractedTextSamples_url_completionHandler___block_invoke_2_26;
    block[3] = &unk_1E5E457D8;
    block[4] = WeakRetained;
    id v14 = v5;
    id v15 = *(id *)(a1 + 32);
    id v18 = *(id *)(a1 + 48);
    id v10 = v6;
    uint64_t v11 = *(void *)(a1 + 56);
    id v16 = v10;
    uint64_t v19 = v11;
    id v17 = *(id *)(a1 + 40);
    dispatch_async(v9, block);
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 48);
    if (v12) {
      (*(void (**)(uint64_t, void))(v12 + 16))(v12, 0);
    }
  }
}

void __88__WBSTranslationContext_setWebpageLocaleWithExtractedTextSamples_url_completionHandler___block_invoke_2_26(uint64_t a1)
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  uint64_t v54 = 0;
  v55 = &v54;
  uint64_t v56 = 0x2020000000;
  uint64_t v57 = 0;
  uint64_t v48 = 0;
  v49 = &v48;
  uint64_t v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__29;
  v52 = __Block_byref_object_dispose__29;
  id v53 = 0;
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__29;
  v46 = __Block_byref_object_dispose__29;
  id v47 = 0;
  uint64_t v2 = *(os_unfair_lock_s **)(a1 + 32);
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __88__WBSTranslationContext_setWebpageLocaleWithExtractedTextSamples_url_completionHandler___block_invoke_3;
  v41[3] = &unk_1E5E457B0;
  v41[4] = v2;
  v41[5] = &v54;
  v41[6] = &v48;
  v41[7] = &v42;
  performWithLock(v2 + 43, v41);
  unint64_t v3 = v55[3];
  if (v3 > 7 || ((1 << v3) & 0xDC) == 0 && (v3 != 1 || ![(id)v49[5] length]))
  {
    uint64_t v9 = *(void **)(a1 + 40);
    if (!v9) {
      uint64_t v9 = *(void **)(a1 + 56);
    }
    id v10 = v9;
    uint64_t v11 = v55[3];
    uint64_t v12 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) userPreferredTargetLocales];
    id v13 = availablePreferredTargetLocalesFilteredBySupportedLocales(v12, (void *)v43[5], v10);

    id v14 = *(os_unfair_lock_s **)(a1 + 32);
    id v15 = v14 + 43;
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __88__WBSTranslationContext_setWebpageLocaleWithExtractedTextSamples_url_completionHandler___block_invoke_27;
    v38[3] = &unk_1E5E40D60;
    v38[4] = v14;
    id v16 = v10;
    id v39 = v16;
    id v17 = v13;
    id v40 = v17;
    performWithLock(v15, v38);
    uint64_t v18 = [*(id *)(a1 + 32) detectionNotificationLevel];
    if (![*(id *)(a1 + 40) length])
    {
      uint64_t v24 = (id)WBS_LOG_CHANNEL_PREFIXTranslation();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v25 = *(void **)(a1 + 56);
        uint64_t v26 = [*(id *)(a1 + 64) count];
        v27 = loggingStringForTextSampleArray(*(void **)(a1 + 64));
        uint64_t v28 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 138544131;
        id v61 = v25;
        __int16 v62 = 2048;
        uint64_t v63 = v26;
        __int16 v64 = 2114;
        v65 = v27;
        __int16 v66 = 2117;
        uint64_t v67 = v28;
        _os_log_impl(&dword_1ABB70000, v24, OS_LOG_TYPE_DEFAULT, "Unable to determine webpage locale, likely because it's the unsupported language '%{public}@'; used %lu text s"
          "ample(s) of length(s): %{public}@. URL: %{sensitive}@",
          buf,
          0x2Au);
      }
      logTextSamplesIfNeededPreservingPrivacy(*(void **)(a1 + 64));
      goto LABEL_28;
    }
    uint64_t v19 = (id)WBS_LOG_CHANNEL_PREFIXTranslation();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      uint64_t v20 = [*(id *)(a1 + 64) count];
      id v21 = loggingStringForTextSampleArray(*(void **)(a1 + 64));
      uint64_t v22 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138544131;
      id v61 = v16;
      __int16 v62 = 2048;
      uint64_t v63 = v20;
      __int16 v64 = 2114;
      v65 = v21;
      __int16 v66 = 2117;
      uint64_t v67 = v22;
      _os_log_impl(&dword_1ABB70000, v19, OS_LOG_TYPE_INFO, "Detected webpage locale as %{public}@ from %lu text sample(s) of length(s): %{public}@. URL: %{sensitive}@", buf, 0x2Au);
    }
    logTextSamplesIfNeededPreservingPrivacy(*(void **)(a1 + 64));
    if (v11 == 5)
    {
      if ([*(id *)(*(void *)(a1 + 32) + 152) isEqualToString:v16])
      {
        uint64_t v23 = WBS_LOG_CHANNEL_PREFIXTranslation();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v61 = v16;
          _os_log_impl(&dword_1ABB70000, v23, OS_LOG_TYPE_DEFAULT, "Automatically translating into locale '%{public}@' since the previous page was the same domain and locale", buf, 0xCu);
        }
        [*(id *)(a1 + 32) _requestTranslatingWebpageToLocale:*(void *)(*(void *)(a1 + 32) + 144) requestType:1 completionHandler:0];
        goto LABEL_28;
      }
      uint64_t v29 = WBS_LOG_CHANNEL_PREFIXTranslation();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        v30 = *(void **)(*(void *)(a1 + 32) + 152);
        *(_DWORD *)buf = 138543618;
        id v61 = v30;
        __int16 v62 = 2114;
        uint64_t v63 = (uint64_t)v16;
        _os_log_impl(&dword_1ABB70000, v29, OS_LOG_TYPE_INFO, "Not Automatically translating webpage because the source locales don't match; previous page locale: '%{public}"
          "@'; current page locale '%{public}@'",
          buf,
          0x16u);
      }
    }
    v58[0] = @"webpageLanguage";
    v58[1] = @"notificationLevel";
    v59[0] = v16;
    uint64_t v31 = [NSNumber numberWithUnsignedInteger:v18];
    v59[1] = v31;
    v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v59 forKeys:v58 count:2];

    v33 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v33 postNotificationName:@"translationDetectionDidChange" object:*(void *)(a1 + 32) userInfo:v32];

LABEL_28:
    [*(id *)(a1 + 32) _reportLanguageDetectionAnalyticsForWebpageLocale:v16 notificationLevel:v18];
    uint64_t v34 = *(void *)(a1 + 72);
    if (v34) {
      (*(void (**)(uint64_t, id))(v34 + 16))(v34, v16);
    }

    goto LABEL_31;
  }
  if ([(id)v49[5] isEqualToString:*(void *)(a1 + 40)])
  {
    int v4 = WBS_LOG_CHANNEL_PREFIXTranslation();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = (void *)v49[5];
      uint64_t v6 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138543619;
      id v61 = v5;
      __int16 v62 = 2117;
      uint64_t v63 = v6;
      _os_log_impl(&dword_1ABB70000, v4, OS_LOG_TYPE_INFO, "Already detected that this page is locale '%{public}@; won't fire detection notification again; URL: %{sensitive}@",
        buf,
        0x16u);
    }
  }
  else
  {
    id v7 = WBS_LOG_CHANNEL_PREFIXTranslation();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      long long v35 = (void *)v49[5];
      uint64_t v36 = *(void *)(a1 + 40);
      long long v37 = *(void **)(a1 + 48);
      *(_DWORD *)buf = 138543875;
      id v61 = v35;
      __int16 v62 = 2114;
      uint64_t v63 = v36;
      __int16 v64 = 2117;
      v65 = v37;
      _os_log_fault_impl(&dword_1ABB70000, v7, OS_LOG_TYPE_FAULT, "Previously detected this page was locale '%{public}@' but now it changed to '%{public}@'; unable to proceed with"
        " translation. URL: %{sensitive}@",
        buf,
        0x20u);
    }
  }
  uint64_t v8 = *(void *)(a1 + 72);
  if (v8) {
    (*(void (**)(uint64_t, uint64_t))(v8 + 16))(v8, v49[5]);
  }
LABEL_31:
  _Block_object_dispose(&v42, 8);

  _Block_object_dispose(&v48, 8);
  _Block_object_dispose(&v54, 8);
}

void __88__WBSTranslationContext_setWebpageLocaleWithExtractedTextSamples_url_completionHandler___block_invoke_3(void *a1)
{
  *(void *)(*(void *)(a1[5] + 8) + 24) = *(void *)(a1[4] + 176);
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), *(id *)(a1[4] + 184));
  uint64_t v2 = *(void **)(a1[4] + 200);
  unint64_t v3 = (id *)(*(void *)(a1[7] + 8) + 40);
  objc_storeStrong(v3, v2);
}

uint64_t __88__WBSTranslationContext_setWebpageLocaleWithExtractedTextSamples_url_completionHandler___block_invoke_27(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = *(void **)(v3 + 184);
  *(void *)(v3 + 184) = v2;

  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA20]) initWithLocaleIdentifier:*(void *)(*(void *)(a1 + 32) + 184)];
  uint64_t v6 = [v5 languageCode];
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void **)(v7 + 288);
  *(void *)(v7 + 288) = v6;

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 280), *(id *)(a1 + 48));
  uint64_t v9 = *(void **)(a1 + 32);
  return [v9 _setState:1 usingLock:0];
}

- (void)validateTargetLocale:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__WBSTranslationContext_validateTargetLocale_completionHandler___block_invoke;
  block[3] = &unk_1E5E40940;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(internalQueue, block);
}

uint64_t __64__WBSTranslationContext_validateTargetLocale_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _validateTargetLocaleSynchronously:*(void *)(a1 + 40)];
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v2();
}

- (void)requestTranslatingWebpageToLocale:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__WBSTranslationContext_requestTranslatingWebpageToLocale_completionHandler___block_invoke;
  block[3] = &unk_1E5E40940;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(internalQueue, block);
}

uint64_t __77__WBSTranslationContext_requestTranslatingWebpageToLocale_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _requestTranslatingWebpageToLocale:*(void *)(a1 + 40) requestType:0 completionHandler:*(void *)(a1 + 48)];
}

- (void)requestSendFeedbackForTranslationIssue:(int64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__WBSTranslationContext_requestSendFeedbackForTranslationIssue___block_invoke;
  block[3] = &unk_1E5E449B0;
  id v9 = WeakRetained;
  int64_t v10 = a3;
  block[4] = self;
  id v7 = WeakRetained;
  dispatch_async(internalQueue, block);
}

void __64__WBSTranslationContext_requestSendFeedbackForTranslationIssue___block_invoke(void *a1)
{
  uint64_t v2 = WBS_LOG_CHANNEL_PREFIXTranslation();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1ABB70000, v2, OS_LOG_TYPE_DEFAULT, "User reported translation issue", buf, 2u);
  }
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64__WBSTranslationContext_requestSendFeedbackForTranslationIssue___block_invoke_31;
  v5[3] = &unk_1E5E45850;
  uint64_t v3 = a1[6];
  int v4 = (void *)a1[5];
  id v6 = (id)a1[4];
  uint64_t v8 = v3;
  id v7 = v4;
  [v6 generateDiagnosticDataForPurpose:0 completionHandler:v5];
}

void __64__WBSTranslationContext_requestSendFeedbackForTranslationIssue___block_invoke_31(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = a1[4];
  id v5 = *(NSObject **)(v4 + 8);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__WBSTranslationContext_requestSendFeedbackForTranslationIssue___block_invoke_2;
  v8[3] = &unk_1E5E45828;
  id v6 = (void *)a1[5];
  uint64_t v12 = a1[6];
  id v9 = v3;
  uint64_t v10 = v4;
  id v11 = v6;
  id v7 = v3;
  dispatch_async(v5, v8);
}

void __64__WBSTranslationContext_requestSendFeedbackForTranslationIssue___block_invoke_2(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)get_LTTranslationFeedbackClass());
  objc_msgSend(v2, "setCategory:", *(void *)(a1 + 56) | objc_msgSend(v2, "category"));
  id v3 = [*(id *)(a1 + 32) extractedParagraphsAsJSON];
  [v2 setSourceContentAsJSON:v3];

  uint64_t v4 = [*(id *)(a1 + 32) translatedParagraphsAsJSON];
  [v2 setTargetContentAsJSON:v4];

  id v5 = [*(id *)(a1 + 32) errorsAsJSON];
  [v2 setErrorsAsJSON:v5];

  [v2 setWebpageURL:*(void *)(*(void *)(a1 + 40) + 96)];
  id v6 = [*(id *)(a1 + 48) safariApplicationVersionForTranslationContext:*(void *)(a1 + 40)];
  [v2 setSafariVersion:v6];

  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__29;
  id v16 = __Block_byref_object_dispose__29;
  id v17 = 0;
  id v7 = *(os_unfair_lock_s **)(a1 + 40);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __64__WBSTranslationContext_requestSendFeedbackForTranslationIssue___block_invoke_3;
  v11[3] = &unk_1E5E43620;
  v11[4] = v7;
  v11[5] = &v12;
  performWithLock(v7 + 43, v11);
  uint64_t v8 = [WBSLocalePair alloc];
  id v9 = [(WBSLocalePair *)v8 initWithSourceLocaleIdentifier:v13[5] targetLocaleIdentifier:*(void *)(*(void *)(a1 + 40) + 72)];
  uint64_t v10 = [(WBSLocalePair *)v9 lt_localePair];
  [v2 setLocalePair:v10];

  [*(id *)(*(void *)(a1 + 40) + 24) provideFeedback:v2];
  _Block_object_dispose(&v12, 8);
}

void __64__WBSTranslationContext_requestSendFeedbackForTranslationIssue___block_invoke_3(uint64_t a1)
{
}

- (void)requestSendFeedbackWithCompletionHandler:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__WBSTranslationContext_requestSendFeedbackWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5E420C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

void __66__WBSTranslationContext_requestSendFeedbackWithCompletionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = *(void *)(a1 + 32);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __66__WBSTranslationContext_requestSendFeedbackWithCompletionHandler___block_invoke_36;
    v6[3] = &unk_1E5E458F0;
    v6[4] = v3;
    id v7 = WeakRetained;
    id v8 = *(id *)(a1 + 40);
    [v7 translationContext:v3 showFeedbackConsentAlertWithCompletionHandler:v6];
  }
  else
  {
    id v4 = WBS_LOG_CHANNEL_PREFIXTranslation();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __66__WBSTranslationContext_requestSendFeedbackWithCompletionHandler___block_invoke_cold_1(v4);
    }
    uint64_t v5 = *(void *)(a1 + 40);
    if (v5) {
      (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
    }
  }
}

void __66__WBSTranslationContext_requestSendFeedbackWithCompletionHandler___block_invoke_36(uint64_t a1, char a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(NSObject **)(v3 + 8);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __66__WBSTranslationContext_requestSendFeedbackWithCompletionHandler___block_invoke_2;
  v5[3] = &unk_1E5E458C8;
  char v8 = a2;
  void v5[4] = v3;
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  dispatch_async(v4, v5);
}

void __66__WBSTranslationContext_requestSendFeedbackWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 56))
  {
    id v2 = WBS_LOG_CHANNEL_PREFIXTranslation();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      if (*(unsigned char *)(a1 + 56)) {
        uint64_t v3 = @"YES";
      }
      else {
        uint64_t v3 = @"NO";
      }
      id v4 = v3;
      *(_DWORD *)buf = 138543362;
      id v13 = v4;
      _os_log_impl(&dword_1ABB70000, v2, OS_LOG_TYPE_DEFAULT, "User responded to translation feedback consent prompt with result: %{public}@", buf, 0xCu);
    }
    uint64_t v5 = *(void **)(a1 + 32);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __66__WBSTranslationContext_requestSendFeedbackWithCompletionHandler___block_invoke_37;
    v8[3] = &unk_1E5E458A0;
    void v8[4] = v5;
    id v9 = *(id *)(a1 + 40);
    id v10 = *(id *)(a1 + 48);
    char v11 = *(unsigned char *)(a1 + 56);
    [v5 generateDiagnosticDataForPurpose:0 completionHandler:v8];
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 48);
    if (v6)
    {
      id v7 = *(void (**)(void))(v6 + 16);
      v7();
    }
  }
}

void __66__WBSTranslationContext_requestSendFeedbackWithCompletionHandler___block_invoke_37(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(NSObject **)(v4 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__WBSTranslationContext_requestSendFeedbackWithCompletionHandler___block_invoke_2_38;
  block[3] = &unk_1E5E45878;
  id v8 = v3;
  uint64_t v9 = v4;
  id v10 = *(id *)(a1 + 40);
  id v11 = *(id *)(a1 + 48);
  char v12 = *(unsigned char *)(a1 + 56);
  id v6 = v3;
  dispatch_async(v5, block);
}

void __66__WBSTranslationContext_requestSendFeedbackWithCompletionHandler___block_invoke_2_38(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)get_LTTranslationFeedbackClass());
  id v3 = [*(id *)(a1 + 32) extractedParagraphsAsJSON];
  [v2 setSourceContentAsJSON:v3];

  uint64_t v4 = [*(id *)(a1 + 32) translatedParagraphsAsJSON];
  [v2 setTargetContentAsJSON:v4];

  uint64_t v5 = [*(id *)(a1 + 32) errorsAsJSON];
  [v2 setErrorsAsJSON:v5];

  [v2 setWebpageURL:*(void *)(*(void *)(a1 + 40) + 96)];
  if (objc_opt_respondsToSelector())
  {
    id v6 = [*(id *)(a1 + 48) safariApplicationVersionForTranslationContext:*(void *)(a1 + 40)];
    [v2 setSafariVersion:v6];
  }
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__29;
  id v17 = __Block_byref_object_dispose__29;
  id v18 = 0;
  id v7 = *(os_unfair_lock_s **)(a1 + 40);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __66__WBSTranslationContext_requestSendFeedbackWithCompletionHandler___block_invoke_3;
  v12[3] = &unk_1E5E43620;
  v12[4] = v7;
  v12[5] = &v13;
  performWithLock(v7 + 43, v12);
  id v8 = [WBSLocalePair alloc];
  uint64_t v9 = [(WBSLocalePair *)v8 initWithSourceLocaleIdentifier:v14[5] targetLocaleIdentifier:*(void *)(*(void *)(a1 + 40) + 72)];
  id v10 = [(WBSLocalePair *)v9 lt_localePair];
  [v2 setLocalePair:v10];

  [*(id *)(*(void *)(a1 + 40) + 24) provideFeedback:v2];
  uint64_t v11 = *(void *)(a1 + 56);
  if (v11) {
    (*(void (**)(uint64_t, void))(v11 + 16))(v11, *(unsigned __int8 *)(a1 + 64));
  }
  _Block_object_dispose(&v13, 8);
}

void __66__WBSTranslationContext_requestSendFeedbackWithCompletionHandler___block_invoke_3(uint64_t a1)
{
}

- (void)_requestTranslatingWebpageToLocale:(id)a3 requestType:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __90__WBSTranslationContext__requestTranslatingWebpageToLocale_requestType_completionHandler___block_invoke;
  v12[3] = &unk_1E5E45918;
  v12[4] = self;
  id v13 = v8;
  id v14 = v9;
  int64_t v15 = a4;
  id v10 = v8;
  id v11 = v9;
  [(WBSTranslationContext *)self _promptIfNeededToConsentToTranslationWithCompletionHandler:v12];
}

void __90__WBSTranslationContext__requestTranslatingWebpageToLocale_requestType_completionHandler___block_invoke(uint64_t a1, char a2)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __90__WBSTranslationContext__requestTranslatingWebpageToLocale_requestType_completionHandler___block_invoke_42;
    block[3] = &unk_1E5E40968;
    void block[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], block);
    *(void *)v30 = 0;
    uint64_t v31 = v30;
    uint64_t v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__29;
    uint64_t v34 = __Block_byref_object_dispose__29;
    id v35 = 0;
    id v3 = *(os_unfair_lock_s **)(a1 + 32);
    uint64_t v4 = v3 + 43;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __90__WBSTranslationContext__requestTranslatingWebpageToLocale_requestType_completionHandler___block_invoke_2;
    v27[3] = &unk_1E5E45088;
    uint64_t v29 = v30;
    v27[4] = v3;
    id v28 = *(id *)(a1 + 40);
    performWithLock(v4, v27);
    uint64_t v5 = objc_alloc_init(WBSTranslationScrollInteractionAnalyticsHelper);
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void **)(v6 + 136);
    *(void *)(v6 + 136) = v5;

    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
    if (objc_opt_respondsToSelector())
    {
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __90__WBSTranslationContext__requestTranslatingWebpageToLocale_requestType_completionHandler___block_invoke_3;
      v24[3] = &unk_1E5E40D38;
      id v9 = WeakRetained;
      uint64_t v10 = *(void *)(a1 + 32);
      id v25 = v9;
      uint64_t v26 = v10;
      id v11 = (void *)MEMORY[0x1E4F14428];
      dispatch_async(MEMORY[0x1E4F14428], v24);
    }
    char v12 = WBS_LOG_CHANNEL_PREFIXTranslation();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = *((void *)v31 + 5);
      uint64_t v14 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v38 = v13;
      __int16 v39 = 2114;
      uint64_t v40 = v14;
      _os_log_impl(&dword_1ABB70000, v12, OS_LOG_TYPE_DEFAULT, "Translating page from '%{public}@' to '%{public}@'", buf, 0x16u);
    }
    uint64_t v15 = [*(id *)(a1 + 40) copy];
    uint64_t v16 = *(void *)(a1 + 32);
    id v17 = *(void **)(v16 + 72);
    *(void *)(v16 + 72) = v15;

    [*(id *)(*(void *)(a1 + 32) + 40) beginExtractingContent];
    [*(id *)(a1 + 32) _startProgressForExtractingContent];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v18 = *(void *)(a1 + 32);
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __90__WBSTranslationContext__requestTranslatingWebpageToLocale_requestType_completionHandler___block_invoke_50;
      v22[3] = &unk_1E5E42410;
      v22[4] = v18;
      id v23 = *(id *)(a1 + 48);
      [WeakRetained translationContext:v18 urlForCurrentPageWithCompletionHandler:v22];
    }
    else
    {
      uint64_t v21 = *(void *)(a1 + 48);
      if (v21) {
        (*(void (**)(void))(v21 + 16))();
      }
    }
    [*(id *)(a1 + 32) _reportRequestedTranslationAnalyticsForWebpageLocale:*((void *)v31 + 5) targetLocale:*(void *)(a1 + 40) requestType:*(void *)(a1 + 56)];

    _Block_object_dispose(v30, 8);
  }
  else
  {
    uint64_t v19 = WBS_LOG_CHANNEL_PREFIXTranslation();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v30 = 0;
      _os_log_impl(&dword_1ABB70000, v19, OS_LOG_TYPE_DEFAULT, "User didn't consent to use Translation, won't proceed", v30, 2u);
    }
    uint64_t v20 = *(void *)(a1 + 48);
    if (v20) {
      (*(void (**)(void))(v20 + 16))();
    }
  }
}

void __90__WBSTranslationContext__requestTranslatingWebpageToLocale_requestType_completionHandler___block_invoke_42(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
  if (objc_opt_respondsToSelector()) {
    [WeakRetained translationContextWillRequestTranslatingWebpage:*(void *)(a1 + 32)];
  }
}

uint64_t __90__WBSTranslationContext__requestTranslatingWebpageToLocale_requestType_completionHandler___block_invoke_2(void *a1)
{
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), *(id *)(a1[4] + 184));
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CA20]) initWithLocaleIdentifier:a1[5]];
  uint64_t v3 = [v2 languageCode];
  uint64_t v4 = a1[4];
  uint64_t v5 = *(void **)(v4 + 288);
  *(void *)(v4 + 288) = v3;

  uint64_t v6 = (void *)a1[4];
  return [v6 _setState:2 usingLock:0];
}

uint64_t __90__WBSTranslationContext__requestTranslatingWebpageToLocale_requestType_completionHandler___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) translationContextNeedsScrollHeightVisibilityUpdate:*(void *)(a1 + 40)];
}

void __90__WBSTranslationContext__requestTranslatingWebpageToLocale_requestType_completionHandler___block_invoke_50(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(NSObject **)(v4 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __90__WBSTranslationContext__requestTranslatingWebpageToLocale_requestType_completionHandler___block_invoke_2_51;
  block[3] = &unk_1E5E40940;
  void block[4] = v4;
  id v8 = v3;
  id v9 = *(id *)(a1 + 40);
  id v6 = v3;
  dispatch_async(v5, block);
}

uint64_t __90__WBSTranslationContext__requestTranslatingWebpageToLocale_requestType_completionHandler___block_invoke_2_51(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 96), *(id *)(a1 + 40));
  id v2 = [*(id *)(a1 + 40) absoluteString];
  [*(id *)(*(void *)(a1 + 32) + 80) setURLString:v2];

  id v3 = [*(id *)(a1 + 40) host];
  uint64_t v4 = objc_msgSend(v3, "safari_highLevelDomainFromHost");
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 160);
  *(void *)(v5 + 160) = v4;

  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v8 = *(uint64_t (**)(void))(result + 16);
    return v8();
  }
  return result;
}

- (void)reloadPageInOriginalLanguage
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__WBSTranslationContext_reloadPageInOriginalLanguage__block_invoke;
  block[3] = &unk_1E5E40968;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __53__WBSTranslationContext_reloadPageInOriginalLanguage__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
  if (objc_opt_respondsToSelector()) {
    [WeakRetained translationContextReloadPageInOriginalLanguage:*(void *)(a1 + 32)];
  }
}

- (void)owningWebViewDidCommitNavigationWithURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__WBSTranslationContext_owningWebViewDidCommitNavigationWithURL_completionHandler___block_invoke;
  block[3] = &unk_1E5E40940;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(internalQueue, block);
}

uint64_t __83__WBSTranslationContext_owningWebViewDidCommitNavigationWithURL_completionHandler___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) _restoreContextSnapshotIfNeeded:*(void *)(*(void *)(a1 + 32) + 112) forURL:*(void *)(a1 + 40)] & 1) == 0)
  {
    uint64_t v52 = 0;
    id v53 = &v52;
    uint64_t v54 = 0x3032000000;
    v55 = __Block_byref_object_copy__29;
    uint64_t v56 = __Block_byref_object_dispose__29;
    id v57 = 0;
    uint64_t v46 = 0;
    id v47 = &v46;
    uint64_t v48 = 0x3032000000;
    v49 = __Block_byref_object_copy__29;
    uint64_t v50 = __Block_byref_object_dispose__29;
    id v51 = 0;
    uint64_t v40 = 0;
    uint64_t v41 = &v40;
    uint64_t v42 = 0x3032000000;
    v43 = __Block_byref_object_copy__29;
    uint64_t v44 = __Block_byref_object_dispose__29;
    id v45 = 0;
    id v2 = *(os_unfair_lock_s **)(a1 + 32);
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __83__WBSTranslationContext_owningWebViewDidCommitNavigationWithURL_completionHandler___block_invoke_2;
    v39[3] = &unk_1E5E457B0;
    v39[4] = v2;
    v39[5] = &v52;
    v39[6] = &v46;
    v39[7] = &v40;
    performWithLock(v2 + 43, v39);
    int v3 = [*(id *)(a1 + 32) _nextURLIsEligibleForContinuedTranslation:*(void *)(a1 + 40)];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 160);
    *(void *)(v4 + 160) = 0;

    uint64_t v6 = *(void *)(a1 + 32);
    if (v3)
    {
      objc_storeStrong((id *)(v6 + 144), *(id *)(v6 + 72));
      uint64_t v7 = *(void *)(a1 + 32);
      id v8 = (id)v53[5];
      id v9 = *(void **)(v7 + 152);
      *(void *)(v7 + 152) = v8;
      uint64_t v10 = 5;
    }
    else
    {
      id v11 = *(void **)(v6 + 144);
      *(void *)(v6 + 144) = 0;

      uint64_t v10 = 0;
      uint64_t v12 = *(void *)(a1 + 32);
      id v9 = *(void **)(v12 + 152);
      *(void *)(v12 + 152) = 0;
    }

    id v13 = [(id)v47[5] userPreferredTargetLocales];
    uint64_t v14 = availablePreferredTargetLocalesFilteredBySupportedLocales(v13, (void *)v41[5], 0);

    uint64_t v15 = *(os_unfair_lock_s **)(a1 + 32);
    uint64_t v16 = v15 + 43;
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __83__WBSTranslationContext_owningWebViewDidCommitNavigationWithURL_completionHandler___block_invoke_3;
    v36[3] = &unk_1E5E449B0;
    v36[4] = v15;
    uint64_t v38 = v10;
    id v17 = v14;
    id v37 = v17;
    performWithLock(v16, v36);
    uint64_t v18 = *(void *)(a1 + 32);
    uint64_t v19 = *(void **)(v18 + 72);
    *(void *)(v18 + 72) = 0;

    uint64_t v20 = *(void *)(a1 + 32);
    uint64_t v21 = *(void **)(v20 + 96);
    *(void *)(v20 + 96) = 0;

    _Block_object_dispose(&v40, 8);
    _Block_object_dispose(&v46, 8);

    _Block_object_dispose(&v52, 8);
  }
  uint64_t v22 = *(void *)(a1 + 32);
  id v23 = *(void **)(v22 + 88);
  *(void *)(v22 + 88) = 0;

  [*(id *)(*(void *)(a1 + 32) + 40) stopExtractingContent];
  [*(id *)(*(void *)(a1 + 32) + 104) invalidate];
  [*(id *)(a1 + 32) _cancelProgressForNavigation:1];
  uint64_t v24 = objc_alloc_init(WBSTranslationDiagnosticData);
  uint64_t v25 = *(void *)(a1 + 32);
  uint64_t v26 = *(void **)(v25 + 80);
  *(void *)(v25 + 80) = v24;

  uint64_t v27 = *(void *)(a1 + 32);
  id v28 = *(void **)(v27 + 112);
  *(void *)(v27 + 112) = 0;

  uint64_t v29 = *(void *)(a1 + 32);
  v30 = *(void **)(v29 + 120);
  *(void *)(v29 + 120) = 0;

  *(unsigned char *)(*(void *)(a1 + 32) + 128) = 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 129) = 0;
  uint64_t v31 = *(void *)(a1 + 32);
  uint64_t v32 = *(void **)(v31 + 136);
  *(void *)(v31 + 136) = 0;

  uint64_t v33 = *(void *)(a1 + 32);
  uint64_t v34 = *(void **)(v33 + 24);
  *(void *)(v33 + 24) = 0;

  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __83__WBSTranslationContext_owningWebViewDidCommitNavigationWithURL_completionHandler___block_invoke_2(void *a1)
{
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), *(id *)(a1[4] + 184));
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 192));
  uint64_t v3 = *(void *)(a1[6] + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = WeakRetained;

  uint64_t v5 = *(void **)(a1[4] + 200);
  uint64_t v6 = (id *)(*(void *)(a1[7] + 8) + 40);
  objc_storeStrong(v6, v5);
}

void __83__WBSTranslationContext_owningWebViewDidCommitNavigationWithURL_completionHandler___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) _setState:*(void *)(a1 + 48) usingLock:0];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 184);
  *(void *)(v2 + 184) = 0;

  uint64_t v4 = *(void **)(a1 + 40);
  uint64_t v5 = (id *)(*(void *)(a1 + 32) + 280);
  objc_storeStrong(v5, v4);
}

- (void)owningWebViewWillNavigateAndSaveCurrentSnapshotToStore:(id)a3 isEligibleForContinuedTranslation:(BOOL)a4
{
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = __Block_byref_object_copy__29;
  v10[4] = __Block_byref_object_dispose__29;
  id v11 = a3;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __114__WBSTranslationContext_owningWebViewWillNavigateAndSaveCurrentSnapshotToStore_isEligibleForContinuedTranslation___block_invoke;
  block[3] = &unk_1E5E45940;
  void block[4] = self;
  void block[5] = v10;
  BOOL v9 = a4;
  id v7 = v11;
  dispatch_async(internalQueue, block);
  _Block_object_dispose(v10, 8);
}

void __114__WBSTranslationContext_owningWebViewWillNavigateAndSaveCurrentSnapshotToStore_isEligibleForContinuedTranslation___block_invoke(uint64_t a1)
{
  id v5 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  *(unsigned char *)(*(void *)(a1 + 32) + 168) = *(unsigned char *)(a1 + 48);
  uint64_t v4 = [*(id *)(a1 + 32) _currentSnapshot];
  objc_msgSend(v5, "_safari_setTranslationContextSnapshot:", v4);

  WBSReleaseOnMainQueueImpl();
}

- (void)owningWebViewWillNavigateToBackForwardListItemWithSnapshotStore:(id)a3 inPageCache:(BOOL)a4
{
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = __Block_byref_object_copy__29;
  v10[4] = __Block_byref_object_dispose__29;
  id v11 = a3;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __101__WBSTranslationContext_owningWebViewWillNavigateToBackForwardListItemWithSnapshotStore_inPageCache___block_invoke;
  block[3] = &unk_1E5E45940;
  BOOL v9 = a4;
  void block[4] = self;
  void block[5] = v10;
  id v7 = v11;
  dispatch_async(internalQueue, block);
  _Block_object_dispose(v10, 8);
}

void __101__WBSTranslationContext_owningWebViewWillNavigateToBackForwardListItemWithSnapshotStore_inPageCache___block_invoke(uint64_t a1)
{
  id v5 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  uint64_t v4 = objc_msgSend(v5, "_safari_translationContextSnapshot");
  objc_msgSend(v5, "_safari_setTranslationContextSnapshot:", 0);
  if (v4 && *(unsigned char *)(a1 + 48)) {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 112), v4);
  }

  WBSReleaseOnMainQueueImpl();
}

- (void)setContentTranslator:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__WBSTranslationContext_setContentTranslator___block_invoke;
  v7[3] = &unk_1E5E40D38;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

id __46__WBSTranslationContext_setContentTranslator___block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(void *)(a1 + 32) + 32), *(id *)(a1 + 40));
}

- (void)generateDiagnosticDataForPurpose:(unint64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__WBSTranslationContext_generateDiagnosticDataForPurpose_completionHandler___block_invoke;
  block[3] = &unk_1E5E43CA8;
  id v10 = v6;
  unint64_t v11 = a3;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(internalQueue, block);
}

void __76__WBSTranslationContext_generateDiagnosticDataForPurpose_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 80) copy];
  uint64_t v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  id v4 = *(void **)(a1 + 32);
  id v5 = [v2 extractedParagraphs];
  uint64_t v6 = *(void *)(a1 + 48);
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __76__WBSTranslationContext_generateDiagnosticDataForPurpose_completionHandler___block_invoke_2;
  v31[3] = &unk_1E5E45968;
  id v7 = v2;
  id v32 = v7;
  id v8 = v3;
  uint64_t v33 = v8;
  [v4 _generateJSONVersionOfContent:v5 forPurpose:v6 completionHandler:v31];

  dispatch_group_enter(v8);
  BOOL v9 = *(void **)(a1 + 32);
  id v10 = [v7 translatedParagraphs];
  uint64_t v11 = *(void *)(a1 + 48);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __76__WBSTranslationContext_generateDiagnosticDataForPurpose_completionHandler___block_invoke_3;
  v28[3] = &unk_1E5E45968;
  id v12 = v7;
  id v29 = v12;
  id v13 = v8;
  v30 = v13;
  [v9 _generateJSONVersionOfContent:v10 forPurpose:v11 completionHandler:v28];

  dispatch_group_enter(v13);
  uint64_t v14 = *(id **)(a1 + 32);
  uint64_t v15 = [v14[10] errors];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __76__WBSTranslationContext_generateDiagnosticDataForPurpose_completionHandler___block_invoke_4;
  v25[3] = &unk_1E5E45968;
  id v16 = v12;
  id v26 = v16;
  uint64_t v27 = v13;
  id v17 = v13;
  [v14 _generateJSONVersionOfErrors:v15 completionHandler:v25];

  uint64_t v18 = *(void *)(a1 + 32);
  uint64_t v19 = *(NSObject **)(v18 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__WBSTranslationContext_generateDiagnosticDataForPurpose_completionHandler___block_invoke_5;
  block[3] = &unk_1E5E422A8;
  void block[4] = v18;
  id v20 = *(id *)(a1 + 40);
  id v23 = v16;
  id v24 = v20;
  id v21 = v16;
  dispatch_group_notify(v17, v19, block);
}

void __76__WBSTranslationContext_generateDiagnosticDataForPurpose_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setExtractedParagraphsAsJSON:a2];
  uint64_t v3 = *(NSObject **)(a1 + 40);
  dispatch_group_leave(v3);
}

void __76__WBSTranslationContext_generateDiagnosticDataForPurpose_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setTranslatedParagraphsAsJSON:a2];
  uint64_t v3 = *(NSObject **)(a1 + 40);
  dispatch_group_leave(v3);
}

void __76__WBSTranslationContext_generateDiagnosticDataForPurpose_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setErrorsAsJSON:a2];
  uint64_t v3 = *(NSObject **)(a1 + 40);
  dispatch_group_leave(v3);
}

void __76__WBSTranslationContext_generateDiagnosticDataForPurpose_completionHandler___block_invoke_5(uint64_t a1)
{
  id obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  objc_sync_exit(obj);
}

- (void)updateMaxVisibleHeightPercentageIfNeeded:(double)a3 userDriven:(BOOL)a4
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__WBSTranslationContext_updateMaxVisibleHeightPercentageIfNeeded_userDriven___block_invoke;
  block[3] = &unk_1E5E45990;
  BOOL v6 = a4;
  void block[4] = self;
  *(double *)&void block[5] = a3;
  dispatch_async(internalQueue, block);
}

uint64_t __77__WBSTranslationContext_updateMaxVisibleHeightPercentageIfNeeded_userDriven___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48)) {
    [*(id *)(*(void *)(a1 + 32) + 136) recordFirstInteractionIfNeeded];
  }
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 136);
  double v3 = *(double *)(a1 + 40);
  return [v2 updateMaxVisibleHeightPercentage:v3];
}

- (BOOL)isTranslationEnabled
{
  uint64_t v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"WBSTranslationEnabledSettingsKey"];

  return v3;
}

- (BOOL)hasConsentedToFirstTimeAlert
{
  uint64_t v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"WBSTranslationConsentedToFirstTimeAlertSettingsKey"];

  return v3;
}

- (void)setConsentedToFirstTimeAlert:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v4 setBool:v3 forKey:@"WBSTranslationConsentedToFirstTimeAlertSettingsKey"];
}

- (BOOL)isContinuedTranslationEnabled
{
  uint64_t v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"WBSTranslationEnableContinuedTranslationSettingsKey"];

  return v3;
}

- (BOOL)debugAlwaysShowConsentAlert
{
  uint64_t v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"WBSTranslationDebugAlwaysShowConsentAlertSettingsKey"];

  return v3;
}

- (BOOL)hideMessageInUnifiedField
{
  uint64_t v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"WBSTranslationHideMessageInUnifiedFieldSettingsKey"];

  return v3;
}

- (BOOL)debugDelayLanguageDetection
{
  uint64_t v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"WBSTranslationDebugDelayLanguageDetectionSettingsKey"];

  return v3;
}

- (id)userPreferredTargetLocales
{
  uint64_t v2 = +[WBSTranslationAvailability sharedAvailability];
  char v3 = [v2 userPreferredTargetLocales];

  return v3;
}

- (void)supportedLocalePairsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__WBSTranslationContext_supportedLocalePairsWithCompletionHandler___block_invoke;
  block[3] = &unk_1E5E41548;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, block);
}

void __67__WBSTranslationContext_supportedLocalePairsWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = +[WBSTranslationAvailability sharedAvailability];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __67__WBSTranslationContext_supportedLocalePairsWithCompletionHandler___block_invoke_2;
  v3[3] = &unk_1E5E42B10;
  id v4 = *(id *)(a1 + 32);
  [v2 getAvailableLocalePairsWithCompletionHandler:v3];
}

void __67__WBSTranslationContext_supportedLocalePairsWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = WBS_LOG_CHANNEL_PREFIXTranslation();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = v4;
    int v6 = 134217984;
    uint64_t v7 = [v3 count];
    _os_log_impl(&dword_1ABB70000, v5, OS_LOG_TYPE_INFO, "API supports %lu locale pairs", (uint8_t *)&v6, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)isTranslationSupportedForCurrentRegionWithCompletionHandler:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__WBSTranslationContext_isTranslationSupportedForCurrentRegionWithCompletionHandler___block_invoke;
  block[3] = &unk_1E5E41548;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, block);
}

void __85__WBSTranslationContext_isTranslationSupportedForCurrentRegionWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = +[WBSTranslationAvailability sharedAvailability];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __85__WBSTranslationContext_isTranslationSupportedForCurrentRegionWithCompletionHandler___block_invoke_2;
  v3[3] = &unk_1E5E412A0;
  id v4 = *(id *)(a1 + 32);
  [v2 getTranslationAvailabilityWithCompletionHandler:v3];
}

uint64_t __85__WBSTranslationContext_isTranslationSupportedForCurrentRegionWithCompletionHandler___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = WBS_LOG_CHANNEL_PREFIXTranslation();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = @"NO";
    if (a2) {
      id v5 = @"YES";
    }
    id v6 = v5;
    int v8 = 138543362;
    BOOL v9 = v6;
    _os_log_impl(&dword_1ABB70000, v4, OS_LOG_TYPE_INFO, "Translation supported in current region: %{public}@", (uint8_t *)&v8, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)translationContext:(id)a3 translateWebpageContents:(id)a4 toTargetLocale:(id)a5 translationHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  internalQueue = self->_internalQueue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __103__WBSTranslationContext_translationContext_translateWebpageContents_toTargetLocale_translationHandler___block_invoke;
  v16[3] = &unk_1E5E40990;
  void v16[4] = self;
  id v17 = v9;
  id v18 = v10;
  id v19 = v11;
  id v13 = v11;
  id v14 = v10;
  id v15 = v9;
  dispatch_async(internalQueue, v16);
}

void __103__WBSTranslationContext_translationContext_translateWebpageContents_toTargetLocale_translationHandler___block_invoke(uint64_t a1)
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  uint64_t v47 = 0;
  uint64_t v48 = &v47;
  uint64_t v49 = 0x3032000000;
  uint64_t v50 = __Block_byref_object_copy__29;
  id v51 = __Block_byref_object_dispose__29;
  id v52 = 0;
  uint64_t v2 = *(os_unfair_lock_s **)(a1 + 32);
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __103__WBSTranslationContext_translationContext_translateWebpageContents_toTargetLocale_translationHandler___block_invoke_2;
  v46[3] = &unk_1E5E43620;
  v46[4] = v2;
  v46[5] = &v47;
  performWithLock(v2 + 43, v46);
  id v3 = (id)WBS_LOG_CHANNEL_PREFIXTranslation();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v26 = [*(id *)(a1 + 40) count];
    uint64_t v27 = v48[5];
    uint64_t v28 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 134218498;
    uint64_t v57 = v26;
    __int16 v58 = 2114;
    uint64_t v59 = v27;
    __int16 v60 = 2114;
    uint64_t v61 = v28;
    _os_log_debug_impl(&dword_1ABB70000, v3, OS_LOG_TYPE_DEBUG, "Translating %lu paragraphs from locale '%{public}@' to locale '%{public}@'", buf, 0x20u);
  }

  uint64_t v31 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  if ([v31 BOOLForKey:@"WBSTranslationUseTranslationAPIsSettingsKey"])
  {
    if (get_LTParagraphTranslationRequestClass())
    {
      id v4 = [MEMORY[0x1E4F1CA48] array];
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id obj = *(id *)(a1 + 40);
      uint64_t v5 = [obj countByEnumeratingWithState:&v34 objects:v53 count:16];
      if (v5)
      {
        uint64_t v30 = *(void *)v35;
        do
        {
          for (uint64_t i = 0; i != v5; ++i)
          {
            if (*(void *)v35 != v30) {
              objc_enumerationMutation(obj);
            }
            uint64_t v7 = *(void **)(*((void *)&v34 + 1) + 8 * i);
            id v8 = objc_alloc((Class)get_LTParagraphTranslationRequestClass());
            id v9 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v48[5]];
            id v10 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:*(void *)(a1 + 48)];
            id v11 = (void *)[v8 initWithSourceLocale:v9 targetLocale:v10];

            objc_msgSend(v7, "safari_updateTranslationRequest:", v11);
            v32[0] = MEMORY[0x1E4F143A8];
            v32[1] = 3221225472;
            v32[2] = __103__WBSTranslationContext_translationContext_translateWebpageContents_toTargetLocale_translationHandler___block_invoke_60;
            v32[3] = &unk_1E5E459B8;
            v32[4] = *(void *)(a1 + 32);
            id v12 = *(id *)(a1 + 56);
            v32[5] = v7;
            id v33 = v12;
            [v11 setCompletionHandler:v32];
            if ([v31 BOOLForKey:@"WBSTranslationForceOnlineTranslationSettingsKey"])objc_msgSend(v11, "set_forcedOnlineTranslation:", 1); {
            if ([v31 BOOLForKey:@"WBSTranslationSetWebpageTranslationTaskSettingsKey"])objc_msgSend(v11, "setTaskHint:", 2);
            }
            [v4 addObject:v11];
          }
          uint64_t v5 = [obj countByEnumeratingWithState:&v34 objects:v53 count:16];
        }
        while (v5);
      }

      id v13 = [*(id *)(a1 + 32) _currentSession];
      [v13 translate:v4];
    }
    else
    {
      id v20 = WBS_LOG_CHANNEL_PREFIXTranslation();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        __103__WBSTranslationContext_translationContext_translateWebpageContents_toTargetLocale_translationHandler___block_invoke_cold_1();
      }
      long long v40 = 0u;
      long long v41 = 0u;
      long long v39 = 0u;
      long long v38 = 0u;
      id v4 = *(id *)(a1 + 40);
      uint64_t v21 = [v4 countByEnumeratingWithState:&v38 objects:v54 count:16];
      if (v21)
      {
        uint64_t v22 = *(void *)v39;
        do
        {
          for (uint64_t j = 0; j != v21; ++j)
          {
            if (*(void *)v39 != v22) {
              objc_enumerationMutation(v4);
            }
            uint64_t v24 = *(void *)(a1 + 56);
            uint64_t v25 = [*(id *)(*((void *)&v38 + 1) + 8 * j) identifier];
            (*(void (**)(uint64_t, void, void *, void))(v24 + 16))(v24, 0, v25, 0);
          }
          uint64_t v21 = [v4 countByEnumeratingWithState:&v38 objects:v54 count:16];
        }
        while (v21);
      }
    }
  }
  else
  {
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v4 = *(id *)(a1 + 40);
    uint64_t v14 = [v4 countByEnumeratingWithState:&v42 objects:v55 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v43;
      do
      {
        for (uint64_t k = 0; k != v14; ++k)
        {
          if (*(void *)v43 != v15) {
            objc_enumerationMutation(v4);
          }
          id v17 = *(void **)(*((void *)&v42 + 1) + 8 * k);
          uint64_t v18 = *(void *)(a1 + 56);
          id v19 = [v17 identifier];
          (*(void (**)(uint64_t, void *, void *, void))(v18 + 16))(v18, v17, v19, 0);
        }
        uint64_t v14 = [v4 countByEnumeratingWithState:&v42 objects:v55 count:16];
      }
      while (v14);
    }
  }

  _Block_object_dispose(&v47, 8);
}

void __103__WBSTranslationContext_translationContext_translateWebpageContents_toTargetLocale_translationHandler___block_invoke_2(uint64_t a1)
{
}

void __103__WBSTranslationContext_translationContext_translateWebpageContents_toTargetLocale_translationHandler___block_invoke_60(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __103__WBSTranslationContext_translationContext_translateWebpageContents_toTargetLocale_translationHandler___block_invoke_2_61;
  v11[3] = &unk_1E5E42348;
  id v12 = v5;
  id v8 = *(id *)(a1 + 48);
  id v14 = v6;
  id v15 = v8;
  uint64_t v13 = *(void *)(a1 + 40);
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, v11);
}

void __103__WBSTranslationContext_translationContext_translateWebpageContents_toTargetLocale_translationHandler___block_invoke_2_61(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E4F467B0], "safari_textManipulationItemWithTranslationResult:", *(void *)(a1 + 32));
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = *(void *)(a1 + 56);
  id v3 = [*(id *)(a1 + 40) identifier];
  (*(void (**)(uint64_t, id, void *, void))(v2 + 16))(v2, v4, v3, *(void *)(a1 + 48));
}

- (void)_computeVisibleParagraphsIfDuringInitialExtraction:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __76__WBSTranslationContext__computeVisibleParagraphsIfDuringInitialExtraction___block_invoke;
  v24[3] = &unk_1E5E43620;
  void v24[4] = self;
  v24[5] = &v25;
  p_synchronousIvarLocuint64_t k = &self->_synchronousIvarLock;
  id v17 = self;
  performWithLock(&self->_synchronousIvarLock, v24);
  if (!*((unsigned char *)v26 + 24))
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id obj = v14;
    uint64_t v4 = [obj countByEnumeratingWithState:&v20 objects:v33 count:16];
    if (v4)
    {
      uint64_t v18 = *(void *)v21;
      uint64_t v5 = *MEMORY[0x1E4F46830];
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v21 != v18) {
            objc_enumerationMutation(obj);
          }
          uint64_t v7 = *(void **)(*((void *)&v20 + 1) + 8 * v6);
          long long v29 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
          id v8 = objc_msgSend(v7, "tokens", v14);
          uint64_t v9 = [v8 countByEnumeratingWithState:&v29 objects:v34 count:16];
          if (v9)
          {
            uint64_t v10 = *(void *)v30;
            while (2)
            {
              uint64_t v11 = 0;
              do
              {
                if (*(void *)v30 != v10) {
                  objc_enumerationMutation(v8);
                }
                id v12 = [*(id *)(*((void *)&v29 + 1) + 8 * v11) userInfo];
                char v13 = objc_msgSend(v12, "safari_BOOLForKey:", v5);

                if (v13)
                {

                  v19[0] = MEMORY[0x1E4F143A8];
                  v19[1] = 3221225472;
                  v19[2] = __76__WBSTranslationContext__computeVisibleParagraphsIfDuringInitialExtraction___block_invoke_2;
                  v19[3] = &unk_1E5E40D38;
                  v19[4] = v17;
                  v19[5] = v7;
                  performWithLock(p_synchronousIvarLock, v19);
                  goto LABEL_17;
                }
                ++v11;
              }
              while (v9 != v11);
              uint64_t v9 = [v8 countByEnumeratingWithState:&v29 objects:v34 count:16];
              if (v9) {
                continue;
              }
              break;
            }
          }

LABEL_17:
          ++v6;
        }
        while (v6 != v4);
        uint64_t v4 = [obj countByEnumeratingWithState:&v20 objects:v33 count:16];
      }
      while (v4);
    }
  }
  _Block_object_dispose(&v25, 8);
}

uint64_t __76__WBSTranslationContext__computeVisibleParagraphsIfDuringInitialExtraction___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 249);
  return result;
}

void __76__WBSTranslationContext__computeVisibleParagraphsIfDuringInitialExtraction___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 232);
  if (!v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA80] set];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 232);
    *(void *)(v4 + 232) = v3;

    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 232);
  }
  uint64_t v6 = [*(id *)(a1 + 40) identifier];
  [v2 addObject:v6];

  ++*(void *)(*(void *)(a1 + 32) + 240);
}

- (void)contentExtractor:(id)a3 didExtractContent:(id)a4
{
  id v5 = a4;
  objc_initWeak(&location, self);
  internalQueue = self->_internalQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__WBSTranslationContext_contentExtractor_didExtractContent___block_invoke;
  v8[3] = &unk_1E5E434E8;
  id v9 = v5;
  uint64_t v10 = self;
  id v7 = v5;
  objc_copyWeak(&v11, &location);
  dispatch_async(internalQueue, v8);
  objc_destroyWeak(&v11);

  objc_destroyWeak(&location);
}

void __60__WBSTranslationContext_contentExtractor_didExtractContent___block_invoke(id *a1)
{
  if ([a1[4] count]
    && ([a1[4] firstObject],
        uint64_t v2 = objc_claimAutoreleasedReturnValue(),
        [v2 tokens],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        uint64_t v4 = [v3 count],
        v3,
        v2,
        v4))
  {
    objc_msgSend(a1[5], "_updateProgressWithExtractedParagraphCount:", objc_msgSend(a1[4], "count"));
    [*((id *)a1[5] + 10) addExtractedParagraphs:a1[4]];
    [a1[5] _setState:3 usingLock:1];
    id WeakRetained = objc_loadWeakRetained((id *)a1[5] + 4);
    [a1[5] _computeVisibleParagraphsIfDuringInitialExtraction:a1[4]];
    id v7 = a1[4];
    uint64_t v6 = a1[5];
    uint64_t v8 = v6[9];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __60__WBSTranslationContext_contentExtractor_didExtractContent___block_invoke_65;
    v10[3] = &unk_1E5E45A30;
    objc_copyWeak(&v12, a1 + 6);
    id v11 = a1[4];
    [WeakRetained translationContext:v6 translateWebpageContents:v7 toTargetLocale:v8 translationHandler:v10];

    objc_destroyWeak(&v12);
  }
  else
  {
    id v9 = WBS_LOG_CHANNEL_PREFIXTranslation();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __60__WBSTranslationContext_contentExtractor_didExtractContent___block_invoke_cold_1();
    }
  }
}

void __60__WBSTranslationContext_contentExtractor_didExtractContent___block_invoke_65(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  id v11 = WeakRetained;
  if (WeakRetained)
  {
    id v12 = WeakRetained[1];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__WBSTranslationContext_contentExtractor_didExtractContent___block_invoke_2;
    block[3] = &unk_1E5E45A08;
    void block[4] = WeakRetained;
    id v14 = v7;
    id v15 = v9;
    id v16 = v8;
    id v17 = *(id *)(a1 + 32);
    dispatch_async(v12, block);
  }
}

void __60__WBSTranslationContext_contentExtractor_didExtractContent___block_invoke_2(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2020000000;
  uint64_t v27 = 0;
  uint64_t v2 = *(os_unfair_lock_s **)(a1 + 32);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __60__WBSTranslationContext_contentExtractor_didExtractContent___block_invoke_3;
  v23[3] = &unk_1E5E43620;
  v23[4] = v2;
  v23[5] = &v24;
  performWithLock(v2 + 43, v23);
  unint64_t v3 = v25[3];
  BOOL v4 = v3 > 6;
  uint64_t v5 = (1 << v3) & 0x58;
  if (v4 || v5 == 0)
  {
    id v14 = (id)WBS_LOG_CHANNEL_PREFIXTranslation();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      id v15 = objc_msgSend(*(id *)(a1 + 40), "safari_privacyPreservingDescription");
      *(_DWORD *)buf = 138543362;
      long long v29 = v15;
      _os_log_impl(&dword_1ABB70000, v14, OS_LOG_TYPE_INFO, "The webpage likely navigated before translation results came back; not filling paragraph into page: %{public}@",
        buf,
        0xCu);
    }
  }
  else if (*(void *)(a1 + 48))
  {
    id v7 = (id)WBS_LOG_CHANNEL_PREFIXTranslation();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v16 = *(void **)(a1 + 56);
      id v17 = objc_msgSend(*(id *)(a1 + 48), "safari_privacyPreservingDescription");
      uint64_t v18 = *(void *)(*(void *)(a1 + 32) + 96);
      *(_DWORD *)buf = 138543875;
      long long v29 = v16;
      __int16 v30 = 2114;
      long long v31 = v17;
      __int16 v32 = 2117;
      uint64_t v33 = v18;
      _os_log_error_impl(&dword_1ABB70000, v7, OS_LOG_TYPE_ERROR, "Error translating request for paragraph '%{public}@': %{public}@; webpage URL: %{sensitive}@",
        buf,
        0x20u);
    }
    [*(id *)(*(void *)(a1 + 32) + 104) addError:*(void *)(a1 + 48)];
    [*(id *)(*(void *)(a1 + 32) + 80) addError:*(void *)(a1 + 48) forParagraphIdentifier:*(void *)(a1 + 56)];
    id v8 = *(os_unfair_lock_s **)(a1 + 32);
    id v9 = v8 + 43;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __60__WBSTranslationContext_contentExtractor_didExtractContent___block_invoke_66;
    v21[3] = &unk_1E5E40D38;
    v21[4] = v8;
    id v22 = *(id *)(a1 + 56);
    performWithLock(v9, v21);
    [*(id *)(a1 + 32) _updateProgressWithTranslatedParagraphCount:1];
  }
  else
  {
    uint64_t v10 = (id)WBS_LOG_CHANNEL_PREFIXTranslation();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = objc_msgSend(*(id *)(a1 + 40), "safari_privacyPreservingDescription");
      *(_DWORD *)buf = 138477827;
      long long v29 = v11;
      _os_log_impl(&dword_1ABB70000, v10, OS_LOG_TYPE_INFO, "Translated text with result: %{private}@", buf, 0xCu);
    }
    [*(id *)(*(void *)(a1 + 32) + 80) addTranslatedParagraph:*(void *)(a1 + 40)];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __60__WBSTranslationContext_contentExtractor_didExtractContent___block_invoke_67;
    v19[3] = &unk_1E5E459E0;
    id v12 = *(void **)(a1 + 64);
    id v20 = *(id *)(a1 + 56);
    char v13 = objc_msgSend(v12, "safari_firstObjectPassingTest:", v19);
    [*(id *)(*(void *)(a1 + 32) + 48) replaceExtractedContent:v13 withTranslatedContent:*(void *)(a1 + 40) targetLocale:*(void *)(*(void *)(a1 + 32) + 72)];
    [*(id *)(a1 + 32) _setState:4 usingLock:1];
  }
  _Block_object_dispose(&v24, 8);
}

uint64_t __60__WBSTranslationContext_contentExtractor_didExtractContent___block_invoke_3(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 176);
  return result;
}

uint64_t __60__WBSTranslationContext_contentExtractor_didExtractContent___block_invoke_66(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 232) removeObject:*(void *)(a1 + 40)];
}

uint64_t __60__WBSTranslationContext_contentExtractor_didExtractContent___block_invoke_67(uint64_t a1, void *a2)
{
  unint64_t v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (void)contentExtractorDidFinishExtractingInitialContent:(id)a3
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__WBSTranslationContext_contentExtractorDidFinishExtractingInitialContent___block_invoke;
  block[3] = &unk_1E5E40968;
  void block[4] = self;
  dispatch_async(internalQueue, block);
}

uint64_t __75__WBSTranslationContext_contentExtractorDidFinishExtractingInitialContent___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateProgressForFinishingInitialContentExtraction];
}

- (id)targetLocaleForContentExtractor:(id)a3
{
  return self->_targetLocale;
}

- (id)sourceLocaleForContentExtractor:(id)a3
{
  return self->_webpageLocale;
}

- (void)contentFiller:(id)a3 didCompleteFillingItem:(id)a4 withError:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __72__WBSTranslationContext_contentFiller_didCompleteFillingItem_withError___block_invoke;
  v16[3] = &unk_1E5E40D38;
  void v16[4] = self;
  id v9 = v7;
  id v17 = v9;
  performWithLock(&self->_synchronousIvarLock, v16);
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__WBSTranslationContext_contentFiller_didCompleteFillingItem_withError___block_invoke_2;
  block[3] = &unk_1E5E40D60;
  void block[4] = self;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(internalQueue, block);
}

void __72__WBSTranslationContext_contentFiller_didCompleteFillingItem_withError___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 232);
  id v2 = [*(id *)(a1 + 40) identifier];
  [v1 removeObject:v2];
}

void __72__WBSTranslationContext_contentFiller_didCompleteFillingItem_withError___block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _updateProgressWithTranslatedParagraphCount:1];
  uint64_t v2 = *(void *)(a1 + 40);
  unint64_t v3 = WBS_LOG_CHANNEL_PREFIXTranslation();
  uint64_t v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __72__WBSTranslationContext_contentFiller_didCompleteFillingItem_withError___block_invoke_2_cold_2((void **)(a1 + 40), v4, a1);
    }
    uint64_t v5 = WBS_LOG_CHANNEL_PREFIXTranslation();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 96);
      int v7 = 138739971;
      uint64_t v8 = v6;
      _os_log_impl(&dword_1ABB70000, v5, OS_LOG_TYPE_INFO, "Failed to fill translated content on page with URL: %{sensitive}@", (uint8_t *)&v7, 0xCu);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    __72__WBSTranslationContext_contentFiller_didCompleteFillingItem_withError___block_invoke_2_cold_1(a1, v4);
  }
}

- (void)dominantLocaleForTextSamples:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (TranslationLibraryCore())
  {
    int v7 = getkLTUnknownLanguageCode();
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    id v15 = __72__WBSTranslationContext_dominantLocaleForTextSamples_completionHandler___block_invoke;
    id v16 = &unk_1E5E45A58;
    id v8 = v7;
    id v17 = v8;
    id v18 = v6;
    uint64_t v9 = (void *)MEMORY[0x1AD115160](&v13);
    get_LTTranslatorClass();
    char v10 = objc_opt_respondsToSelector();
    id LTTranslatorClass = get_LTTranslatorClass();
    if (v10) {
      objc_msgSend(LTTranslatorClass, "languagesForText:usingModel:strategy:useDedicatedTextMachPort:completion:", v5, 0, 2, 0, v9, v13, v14, v15, v16, v17);
    }
    else {
      objc_msgSend(LTTranslatorClass, "languagesForText:completion:", v5, v9, v13, v14, v15, v16, v17);
    }
  }
  else
  {
    id v12 = WBS_LOG_CHANNEL_PREFIXTranslation();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[WBSTranslationContext dominantLocaleForTextSamples:completionHandler:]();
    }
    (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
  }
}

void __72__WBSTranslationContext_dominantLocaleForTextSamples_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  unint64_t v3 = [v7 dominantLocale];
  uint64_t v4 = [v3 localeIdentifier];
  if (![v4 length])
  {
    id v5 = [v7 unsupportedLanguageCounts];
    id v6 = objc_msgSend(v5, "safari_highestFrequencyObject");

    if (![v6 isEqualToString:*(void *)(a1 + 32)]) {
      goto LABEL_5;
    }
  }
  id v6 = 0;
LABEL_5:
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)dominantLocaleForTextSamples:(id)a3 url:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __76__WBSTranslationContext_dominantLocaleForTextSamples_url_completionHandler___block_invoke;
  v23[3] = &unk_1E5E45A80;
  objc_copyWeak(&v27, &location);
  id v11 = v8;
  id v24 = v11;
  id v12 = v9;
  id v25 = v12;
  id v13 = v10;
  id v26 = v13;
  uint64_t v14 = (void (**)(void))MEMORY[0x1AD115160](v23);
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__29;
  long long v21 = __Block_byref_object_dispose__29;
  id v22 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __76__WBSTranslationContext_dominantLocaleForTextSamples_url_completionHandler___block_invoke_2;
  v16[3] = &unk_1E5E43620;
  void v16[4] = self;
  void v16[5] = &v17;
  performWithLock(&self->_synchronousIvarLock, v16);
  if ([(id)v18[5] debugDelayLanguageDetection])
  {
    dispatch_time_t v15 = dispatch_time(0, 3000000000);
    dispatch_after(v15, (dispatch_queue_t)self->_internalQueue, v14);
  }
  else
  {
    v14[2](v14);
  }
  _Block_object_dispose(&v17, 8);

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);
}

void __76__WBSTranslationContext_dominantLocaleForTextSamples_url_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _dominantLocaleForTextSamples:*(void *)(a1 + 32) url:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
    id WeakRetained = v3;
  }
}

void __76__WBSTranslationContext_dominantLocaleForTextSamples_url_completionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 192));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = WeakRetained;
}

- (void)_dominantLocaleForTextSamples:(id)a3 url:(id)a4 completionHandler:(id)a5
{
}

- (void)errorController:(id)a3 didReachThresholdForError:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v20 = 0;
  long long v21 = &v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __67__WBSTranslationContext_errorController_didReachThresholdForError___block_invoke;
  v19[3] = &unk_1E5E43620;
  void v19[4] = self;
  v19[5] = &v20;
  performWithLock(&self->_synchronousIvarLock, v19);
  if (v21[3] == 6)
  {
    id v8 = (id)WBS_LOG_CHANNEL_PREFIXTranslation();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = objc_msgSend(v7, "safari_privacyPreservingDescription");
      *(_DWORD *)buf = 138543362;
      id v25 = v9;
      _os_log_impl(&dword_1ABB70000, v8, OS_LOG_TYPE_DEFAULT, "Not showing error alert since we've already shown an error on this page; new error: %{public}@",
        buf,
        0xCu);
    }
  }
  else
  {
    id v8 = [(WBSTranslationContext *)self _userVisibleErrorMessageForError:v7];
    if (v8)
    {
      [(WBSTranslationContext *)self _cancelProgressForNavigation:0];
      [(WBSTranslationContext *)self _setState:6 usingLock:1];
      id v10 = _WBSLocalizedString();
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if (objc_opt_respondsToSelector())
      {
        id v12 = (id)WBS_LOG_CHANNEL_PREFIXTranslation();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          id v13 = objc_msgSend(v7, "safari_privacyPreservingDescription");
          *(_DWORD *)buf = 138543362;
          id v25 = v13;
          _os_log_impl(&dword_1ABB70000, v12, OS_LOG_TYPE_DEFAULT, "Showing user error message because its threshold was met: %{public}@", buf, 0xCu);
        }
        [WeakRetained translationContext:self showTranslationErrorAlertWithTitle:v10 message:v8];
      }
      else
      {
        dispatch_time_t v15 = (id)WBS_LOG_CHANNEL_PREFIXTranslation();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        {
          id v16 = (objc_class *)objc_opt_class();
          NSStringFromClass(v16);
          id v17 = (id)objc_claimAutoreleasedReturnValue();
          id v18 = objc_msgSend(v7, "safari_privacyPreservingDescription");
          [(WBSTranslationContext *)v17 errorController:buf didReachThresholdForError:v15];
        }
      }
    }
    else
    {
      id v10 = (id)WBS_LOG_CHANNEL_PREFIXTranslation();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = objc_msgSend(v7, "safari_privacyPreservingDescription");
        *(_DWORD *)buf = 138543362;
        id v25 = v14;
        _os_log_impl(&dword_1ABB70000, v10, OS_LOG_TYPE_DEFAULT, "Not showing error alert to user because it hasn't been added to the error message allow-list: %{public}@", buf, 0xCu);
      }
    }
  }
  _Block_object_dispose(&v20, 8);
}

uint64_t __67__WBSTranslationContext_errorController_didReachThresholdForError___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 176);
  return result;
}

- (BOOL)createFluidProgressState
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__29;
  id v13 = __Block_byref_object_dispose__29;
  id v14 = 0;
  p_synchronousIvarLocuint64_t k = &self->_synchronousIvarLock;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__WBSTranslationContext_createFluidProgressState__block_invoke;
  v8[3] = &unk_1E5E43620;
  void v8[4] = self;
  void v8[5] = &v9;
  performWithLock(&self->_synchronousIvarLock, v8);
  if (!v10[5])
  {
    uint64_t v4 = [[WBSFluidProgressState alloc] initWithType:0];
    id v5 = (void *)v10[5];
    void v10[5] = (uint64_t)v4;

    [(id)v10[5] setHasCommittedLoad:1];
    [(id)v10[5] setFluidProgressAnimationPhase:0];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __49__WBSTranslationContext_createFluidProgressState__block_invoke_2;
    v7[3] = &unk_1E5E44398;
    v7[4] = self;
    void v7[5] = &v9;
    performWithLock(p_synchronousIvarLock, v7);
  }
  _Block_object_dispose(&v9, 8);

  return 1;
}

void __49__WBSTranslationContext_createFluidProgressState__block_invoke(uint64_t a1)
{
}

void __49__WBSTranslationContext_createFluidProgressState__block_invoke_2(uint64_t a1)
{
}

- (void)clearFluidProgressState
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __48__WBSTranslationContext_clearFluidProgressState__block_invoke;
  v3[3] = &unk_1E5E40968;
  void v3[4] = self;
  performWithLock(&self->_synchronousIvarLock, v3);
  [(WBSTranslationContext *)self _notifyDelegateToReportProgressInUnifiedField:0];
}

void __48__WBSTranslationContext_clearFluidProgressState__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 256);
  *(void *)(v1 + 256) = 0;
}

- (id)expectedOrCurrentURL
{
  return 0;
}

- (id)progressState
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__29;
  uint64_t v9 = __Block_byref_object_dispose__29;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __38__WBSTranslationContext_progressState__block_invoke;
  v4[3] = &unk_1E5E43620;
  v4[4] = self;
  v4[5] = &v5;
  performWithLock(&self->_synchronousIvarLock, v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __38__WBSTranslationContext_progressState__block_invoke(uint64_t a1)
{
}

- (double)_estimatedProgressWithScope:(int64_t)a3
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__WBSTranslationContext__estimatedProgressWithScope___block_invoke;
  v6[3] = &unk_1E5E45AA8;
  v6[4] = self;
  void v6[5] = &v19;
  void v6[6] = &v15;
  v6[7] = &v11;
  v6[8] = &v7;
  v6[9] = a3;
  performWithLock(&self->_synchronousIvarLock, v6);
  unint64_t v3 = v20[3];
  double v4 = 1.0;
  if (v3 <= 6 && ((1 << v3) & 0x5C) != 0)
  {
    if (*((unsigned char *)v16 + 24)) {
      double v4 = fmin((double)(unint64_t)v8[3] / (double)(unint64_t)v12[3], 1.0);
    }
    else {
      double v4 = 0.0;
    }
  }
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);
  return v4;
}

void *__53__WBSTranslationContext__estimatedProgressWithScope___block_invoke(void *result)
{
  uint64_t v1 = result;
  *(void *)(*(void *)(result[5] + 8) + 24) = *(void *)(result[4] + 176);
  *(unsigned char *)(*(void *)(result[6] + 8) + 24) = *(unsigned char *)(result[4] + 249);
  uint64_t v2 = result[9];
  if (v2 == 1)
  {
    *(void *)(*(void *)(result[7] + 8) + 24) = *(void *)(result[4] + 240);
    uint64_t v4 = result[4];
    uint64_t v5 = *(void *)(v4 + 240);
    uint64_t result = (void *)[*(id *)(v4 + 232) count];
    uint64_t v3 = v5 - (void)result;
  }
  else
  {
    if (v2) {
      return result;
    }
    *(void *)(*(void *)(result[7] + 8) + 24) = *(void *)(result[4] + 216);
    uint64_t v3 = *(void *)(result[4] + 224);
  }
  *(void *)(*(void *)(v1[8] + 8) + 24) = v3;
  return result;
}

- (double)estimatedProgress
{
  [(WBSTranslationContext *)self _estimatedProgressWithScope:1];
  return result;
}

- (BOOL)hasFailedURL
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __37__WBSTranslationContext_hasFailedURL__block_invoke;
  v4[3] = &unk_1E5E43620;
  v4[4] = self;
  v4[5] = &v5;
  performWithLock(&self->_synchronousIvarLock, v4);
  BOOL v2 = v6[3] == 6;
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __37__WBSTranslationContext_hasFailedURL__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 176);
  return result;
}

- (id)_availableTargetLocaleIdentifiersConsideringCurrentWebpageLocale:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v35 = 0;
  long long v36 = &v35;
  uint64_t v37 = 0x3032000000;
  long long v38 = __Block_byref_object_copy__29;
  long long v39 = __Block_byref_object_dispose__29;
  id v40 = 0;
  uint64_t v29 = 0;
  __int16 v30 = &v29;
  uint64_t v31 = 0x3032000000;
  __int16 v32 = __Block_byref_object_copy__29;
  uint64_t v33 = __Block_byref_object_dispose__29;
  id v34 = 0;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = __Block_byref_object_copy__29;
  id v27 = __Block_byref_object_dispose__29;
  id v28 = 0;
  uint64_t v17 = 0;
  char v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__29;
  uint64_t v21 = __Block_byref_object_dispose__29;
  id v22 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __90__WBSTranslationContext__availableTargetLocaleIdentifiersConsideringCurrentWebpageLocale___block_invoke;
  v12[3] = &unk_1E5E45AD0;
  v12[4] = self;
  void v12[5] = &v35;
  void v12[6] = &v29;
  v12[7] = &v23;
  v12[8] = &v17;
  v12[9] = &v13;
  performWithLock(&self->_synchronousIvarLock, v12);
  if (([(id)v36[5] isTranslationEnabled] & 1) == 0
    || ![(WBSTranslationContext *)self _translationSupportedInCurrentRegion])
  {
    goto LABEL_6;
  }
  if (!v3)
  {
    uint64_t v8 = [(id)v36[5] userPreferredTargetLocales];
    availablePreferredTargetLocalesFilteredBySupportedLocales(v8, (void *)v18[5], 0);
    id v9 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_11;
  }
  unint64_t v5 = v14[3];
  if (v5 <= 7 && (((1 << v5) & 0xDC) != 0 || v5 == 1 && ![(id)v30[5] length]))
  {
LABEL_6:
    id v6 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_7;
  }
  id v9 = (id)v24[5];
LABEL_11:
  if ([(id)v30[5] length] && v3)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __90__WBSTranslationContext__availableTargetLocaleIdentifiersConsideringCurrentWebpageLocale___block_invoke_2;
    v11[3] = &unk_1E5E45AF8;
    void v11[4] = &v29;
    objc_msgSend(v9, "safari_filterObjectsUsingBlock:", v11);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v10 = v9;
  }
  id v6 = v10;

LABEL_7:
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  _Block_object_dispose(&v35, 8);
  return v6;
}

void __90__WBSTranslationContext__availableTargetLocaleIdentifiersConsideringCurrentWebpageLocale___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 192));
  uint64_t v3 = *(void *)(a1[5] + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = WeakRetained;

  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), *(id *)(a1[4] + 184));
  objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), *(id *)(a1[4] + 280));
  objc_storeStrong((id *)(*(void *)(a1[8] + 8) + 40), *(id *)(a1[4] + 200));
  *(void *)(*(void *)(a1[9] + 8) + 24) = *(void *)(a1[4] + 176);
}

uint64_t __90__WBSTranslationContext__availableTargetLocaleIdentifiersConsideringCurrentWebpageLocale___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isEqualToString:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)] ^ 1;
}

- (BOOL)_validateTargetLocaleSynchronously:(id)a3
{
  id v4 = a3;
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x3032000000;
  uint64_t v31 = __Block_byref_object_copy__29;
  __int16 v32 = __Block_byref_object_dispose__29;
  id v33 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2020000000;
  uint64_t v27 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__29;
  id v22 = __Block_byref_object_dispose__29;
  id v23 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__29;
  uint64_t v16 = __Block_byref_object_dispose__29;
  id v17 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __60__WBSTranslationContext__validateTargetLocaleSynchronously___block_invoke;
  v11[3] = &unk_1E5E456C0;
  void v11[4] = self;
  void v11[5] = &v28;
  void v11[6] = &v24;
  v11[7] = &v18;
  v11[8] = &v12;
  performWithLock(&self->_synchronousIvarLock, v11);
  if (([(id)v29[5] isTranslationEnabled] & 1) != 0
    && [(WBSTranslationContext *)self _translationSupportedInCurrentRegion]
    && v25[3] == 1
    && [(id)v19[5] length])
  {
    unint64_t v5 = [(id)v29[5] userPreferredTargetLocales];
    if ((preferredBaseLocalesContainBaseLocaleIdentifier(v5, v4) & 1) != 0
      && ([v4 isEqualToString:v19[5]] & 1) == 0)
    {
      id v6 = (void *)v13[5];
      if (v6)
      {
        v8[0] = MEMORY[0x1E4F143A8];
        v8[1] = 3221225472;
        v8[2] = __60__WBSTranslationContext__validateTargetLocaleSynchronously___block_invoke_2;
        v8[3] = &unk_1E5E45B20;
        id v10 = &v18;
        id v9 = v4;
        LOBYTE(v6) = objc_msgSend(v6, "safari_containsObjectPassingTest:", v8);
      }
    }
    else
    {
      LOBYTE(v6) = 0;
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);

  return (char)v6;
}

void __60__WBSTranslationContext__validateTargetLocaleSynchronously___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 192));
  uint64_t v3 = *(void *)(a1[5] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = WeakRetained;

  *(void *)(*(void *)(a1[6] + 8) + 24) = *(void *)(a1[4] + 176);
  objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), *(id *)(a1[4] + 184));
  unint64_t v5 = *(void **)(a1[4] + 200);
  id v6 = (id *)(*(void *)(a1[8] + 8) + 40);
  objc_storeStrong(v6, v5);
}

uint64_t __60__WBSTranslationContext__validateTargetLocaleSynchronously___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v4 = a2;
  unint64_t v5 = [v4 sourceLocaleIdentifier];
  LODWORD(v3) = [v3 isEqualToString:v5];

  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = [v4 targetLocaleIdentifier];

  LODWORD(v6) = [v6 isEqualToString:v7];
  return v3 & v6;
}

- (void)_updateCachedAPISupportedValues
{
  objc_initWeak(&location, self);
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__29;
  id v17 = __Block_byref_object_dispose__29;
  id v18 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __56__WBSTranslationContext__updateCachedAPISupportedValues__block_invoke;
  v12[3] = &unk_1E5E44398;
  v12[4] = self;
  void v12[5] = &v13;
  performWithLock(&self->_synchronousIvarLock, v12);
  objc_initWeak(&from, (id)v14[5]);
  uint64_t v3 = (void *)v14[5];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__WBSTranslationContext__updateCachedAPISupportedValues__block_invoke_2;
  v8[3] = &unk_1E5E45B48;
  objc_copyWeak(&v9, &location);
  objc_copyWeak(&v10, &from);
  [v3 isTranslationSupportedForCurrentRegionWithCompletionHandler:v8];
  id v4 = (void *)v14[5];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__WBSTranslationContext__updateCachedAPISupportedValues__block_invoke_4;
  v5[3] = &unk_1E5E45B98;
  objc_copyWeak(&v6, &location);
  void v5[4] = &v13;
  objc_copyWeak(&v7, &from);
  [v4 supportedLocalePairsWithCompletionHandler:v5];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&from);
  _Block_object_dispose(&v13, 8);

  objc_destroyWeak(&location);
}

void __56__WBSTranslationContext__updateCachedAPISupportedValues__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 272);
  *(void *)(v2 + 272) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  unint64_t v5 = *(void **)(v4 + 200);
  *(void *)(v4 + 200) = 0;

  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 208);
  *(void *)(v6 + 208) = 0;

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 192));
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = WeakRetained;
}

void __56__WBSTranslationContext__updateCachedAPISupportedValues__block_invoke_2(uint64_t a1, char a2)
{
  id WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  unint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __56__WBSTranslationContext__updateCachedAPISupportedValues__block_invoke_3;
    v6[3] = &unk_1E5E455D0;
    v6[4] = WeakRetained;
    objc_copyWeak(&v7, (id *)(a1 + 40));
    char v8 = a2;
    performWithLock(v5 + 43, v6);
    objc_destroyWeak(&v7);
  }
}

void __56__WBSTranslationContext__updateCachedAPISupportedValues__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 192));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));

  if (WeakRetained == v3)
  {
    uint64_t v4 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void **)(v5 + 208);
    *(void *)(v5 + 208) = v4;
  }
}

void __56__WBSTranslationContext__updateCachedAPISupportedValues__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v14 = 0;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x3032000000;
    id v17 = __Block_byref_object_copy__29;
    id v18 = __Block_byref_object_dispose__29;
    id v19 = 0;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __56__WBSTranslationContext__updateCachedAPISupportedValues__block_invoke_5;
    v13[3] = &unk_1E5E43620;
    v13[4] = WeakRetained;
    v13[5] = &v14;
    performWithLock(WeakRetained + 43, v13);
    uint64_t v6 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) userPreferredTargetLocales];
    id v7 = availablePreferredTargetLocalesFilteredBySupportedLocales(v6, v3, (void *)v15[5]);

    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __56__WBSTranslationContext__updateCachedAPISupportedValues__block_invoke_6;
    v9[3] = &unk_1E5E45B70;
    v9[4] = v5;
    objc_copyWeak(&v12, (id *)(a1 + 48));
    id v10 = v3;
    id v8 = v7;
    id v11 = v8;
    performWithLock(v5 + 43, v9);

    objc_destroyWeak(&v12);
    _Block_object_dispose(&v14, 8);
  }
}

void __56__WBSTranslationContext__updateCachedAPISupportedValues__block_invoke_5(uint64_t a1)
{
}

void __56__WBSTranslationContext__updateCachedAPISupportedValues__block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 192));
  id v3 = objc_loadWeakRetained((id *)(a1 + 56));

  if (WeakRetained == v3)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 200), *(id *)(a1 + 40));
    uint64_t v4 = *(void **)(a1 + 48);
    uint64_t v5 = (id *)(*(void *)(a1 + 32) + 280);
    objc_storeStrong(v5, v4);
  }
}

- (void)_setState:(unint64_t)a3 usingLock:(BOOL)a4
{
}

- (void)_setState:(unint64_t)a3 usingLock:(BOOL)a4 validatingTransitionIsAllowed:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2020000000;
  unint64_t v27 = 0;
  if (a4)
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __75__WBSTranslationContext__setState_usingLock_validatingTransitionIsAllowed___block_invoke;
    v23[3] = &unk_1E5E43620;
    void v23[4] = self;
    v23[5] = &v24;
    performWithLock(&self->_synchronousIvarLock, v23);
    unint64_t state = v25[3];
  }
  else
  {
    unint64_t state = self->_state;
    unint64_t v27 = state;
  }
  if (state != a3)
  {
    if ((canTransitionFromStateToState(state, a3) | !v5))
    {
      objc_initWeak(&location, self);
      if (v6)
      {
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __75__WBSTranslationContext__setState_usingLock_validatingTransitionIsAllowed___block_invoke_81;
        v21[3] = &unk_1E5E420F0;
        v21[4] = self;
        void v21[5] = a3;
        performWithLock(&self->_synchronousIvarLock, v21);
      }
      else
      {
        self->_unint64_t state = a3;
      }
      uint64_t v13 = WBS_LOG_CHANNEL_PREFIXTranslation();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        unint64_t v14 = v25[3] - 1;
        if (v14 > 6) {
          uint64_t v15 = @"Unknown";
        }
        else {
          uint64_t v15 = off_1E5E45C90[v14];
        }
        if (a3 - 1 > 6) {
          id v17 = @"Unknown";
        }
        else {
          id v17 = off_1E5E45C90[a3 - 1];
        }
        *(_DWORD *)buf = 138543618;
        uint64_t v29 = v15;
        __int16 v30 = 2114;
        uint64_t v31 = v17;
        _os_log_impl(&dword_1ABB70000, v13, OS_LOG_TYPE_INFO, "Changed state from '%{public}@' to '%{public}@'", buf, 0x16u);
      }
      internalQueue = self->_internalQueue;
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __75__WBSTranslationContext__setState_usingLock_validatingTransitionIsAllowed___block_invoke_82;
      v19[3] = &unk_1E5E45BC0;
      objc_copyWeak(v20, &location);
      void v19[4] = &v24;
      v20[1] = (id)a3;
      dispatch_async(internalQueue, v19);
      objc_destroyWeak(v20);
      objc_destroyWeak(&location);
    }
    else
    {
      id v10 = WBS_LOG_CHANNEL_PREFIXTranslation();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        unint64_t v11 = v25[3] - 1;
        if (v11 > 6) {
          id v12 = @"Unknown";
        }
        else {
          id v12 = off_1E5E45C90[v11];
        }
        if (a3 - 1 > 6) {
          uint64_t v16 = @"Unknown";
        }
        else {
          uint64_t v16 = off_1E5E45C90[a3 - 1];
        }
        *(_DWORD *)buf = 138543618;
        uint64_t v29 = v12;
        __int16 v30 = 2114;
        uint64_t v31 = v16;
        _os_log_impl(&dword_1ABB70000, v10, OS_LOG_TYPE_INFO, "Unable to change state from '%{public}@' to '%{public}@'; invalid state transition",
          buf,
          0x16u);
      }
    }
  }
  _Block_object_dispose(&v24, 8);
}

uint64_t __75__WBSTranslationContext__setState_usingLock_validatingTransitionIsAllowed___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 176);
  return result;
}

uint64_t __75__WBSTranslationContext__setState_usingLock_validatingTransitionIsAllowed___block_invoke_81(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 176) = *(void *)(result + 40);
  return result;
}

void __75__WBSTranslationContext__setState_usingLock_validatingTransitionIsAllowed___block_invoke_82(uint64_t a1)
{
  v8[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7[0] = @"previousState";
  uint64_t v4 = [NSNumber numberWithUnsignedInteger:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)];
  v7[1] = @"newState";
  v8[0] = v4;
  BOOL v5 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 48)];
  v8[1] = v5;
  BOOL v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];
  [v2 postNotificationName:@"translationStateDidChange" object:WeakRetained userInfo:v6];
}

- (id)_currentSession
{
  cachedSession = self->_cachedSession;
  if (!cachedSession)
  {
    uint64_t v4 = [(_LTTranslator *)self->_translator startTranslationSession];
    BOOL v5 = self->_cachedSession;
    self->_cachedSession = v4;

    if ([(WBSTranslationContext *)self _canLogSourcePageURL]) {
      [(_LTTranslationSession *)self->_cachedSession setURL:self->_cachedWebViewURL];
    }
    cachedSession = self->_cachedSession;
  }
  BOOL v6 = cachedSession;
  return v6;
}

- (BOOL)_canLogSourcePageURL
{
  cachedClientIsUsingPrivateBrowsingValue = self->_cachedClientIsUsingPrivateBrowsingValue;
  if (cachedClientIsUsingPrivateBrowsingValue)
  {
    LOBYTE(v4) = [(NSNumber *)cachedClientIsUsingPrivateBrowsingValue BOOLValue];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      uint64_t v4 = [WeakRetained translationContextIsUsingPrivateBrowsing:self];
    }
    else {
      uint64_t v4 = 1;
    }
    BOOL v6 = [NSNumber numberWithBool:v4];
    id v7 = self->_cachedClientIsUsingPrivateBrowsingValue;
    self->_cachedClientIsUsingPrivateBrowsingValue = v6;
  }
  return v4 ^ 1;
}

- (void)_promptIfNeededToConsentToTranslationWithCompletionHandler:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(id, uint64_t))a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  unint64_t v14 = __Block_byref_object_copy__29;
  uint64_t v15 = __Block_byref_object_dispose__29;
  id v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __84__WBSTranslationContext__promptIfNeededToConsentToTranslationWithCompletionHandler___block_invoke;
  v10[3] = &unk_1E5E43620;
  void v10[4] = self;
  void v10[5] = &v11;
  performWithLock(&self->_synchronousIvarLock, v10);
  if ([(id)v12[5] hasConsentedToFirstTimeAlert]
    && ([(id)v12[5] debugAlwaysShowConsentAlert] & 1) == 0)
  {
    v4[2](v4, 1);
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector())
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __84__WBSTranslationContext__promptIfNeededToConsentToTranslationWithCompletionHandler___block_invoke_87;
      void v8[3] = &unk_1E5E41200;
      void v8[4] = self;
      uint64_t v9 = v4;
      [WeakRetained translationContext:self showFirstTimeConsentAlertWithCompletionHandler:v8];
    }
    else
    {
      BOOL v6 = (id)WBS_LOG_CHANNEL_PREFIXTranslation();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        id v7 = objc_opt_class();
        [(WBSTranslationContext *)v7 _promptIfNeededToConsentToTranslationWithCompletionHandler:v6];
      }

      v4[2](v4, 0);
    }
  }
  _Block_object_dispose(&v11, 8);
}

void __84__WBSTranslationContext__promptIfNeededToConsentToTranslationWithCompletionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 192));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = WeakRetained;
}

void __84__WBSTranslationContext__promptIfNeededToConsentToTranslationWithCompletionHandler___block_invoke_87(uint64_t a1, char a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__WBSTranslationContext__promptIfNeededToConsentToTranslationWithCompletionHandler___block_invoke_2;
  block[3] = &unk_1E5E411D8;
  char v6 = a2;
  void block[4] = v2;
  id v5 = *(id *)(a1 + 40);
  dispatch_async(v3, block);
}

uint64_t __84__WBSTranslationContext__promptIfNeededToConsentToTranslationWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 48))
  {
    *(void *)buf = 0;
    id v8 = buf;
    uint64_t v9 = 0x3032000000;
    id v10 = __Block_byref_object_copy__29;
    uint64_t v11 = __Block_byref_object_dispose__29;
    id v12 = 0;
    uint64_t v2 = *(os_unfair_lock_s **)(a1 + 32);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __84__WBSTranslationContext__promptIfNeededToConsentToTranslationWithCompletionHandler___block_invoke_3;
    v6[3] = &unk_1E5E43620;
    v6[4] = v2;
    void v6[5] = buf;
    performWithLock(v2 + 43, v6);
    [*((id *)v8 + 5) setConsentedToFirstTimeAlert:1];
    _Block_object_dispose(buf, 8);
  }
  uint64_t v3 = WBS_LOG_CHANNEL_PREFIXTranslation();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = *(unsigned __int8 *)(a1 + 48);
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = v4;
    _os_log_impl(&dword_1ABB70000, v3, OS_LOG_TYPE_DEFAULT, "User responded to translation consent prompt with result: %i", buf, 8u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __84__WBSTranslationContext__promptIfNeededToConsentToTranslationWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 192));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  int v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = WeakRetained;
}

- (void)_generateJSONVersionOfContent:(id)a3 forPurpose:(unint64_t)a4 completionHandler:(id)a5
{
  id v20[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = (void (**)(id, void *))a5;
  if (a4 == 1)
  {
    v19[0] = @"URL";
    id v10 = [(WBSTranslationDiagnosticData *)self->_diagnosticData URLString];
    v19[1] = @"paragraphs";
    v20[0] = v10;
    v20[1] = v8;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
  }
  else
  {
    id v17 = @"paragraphs";
    id v18 = v8;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  }
  id v16 = 0;
  id v12 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v11 options:(a4 == 1) | 2 error:&v16];
  id v13 = v16;
  if (v12)
  {
    unint64_t v14 = (void *)[[NSString alloc] initWithData:v12 encoding:4];
    v9[2](v9, v14);
  }
  else
  {
    uint64_t v15 = WBS_LOG_CHANNEL_PREFIXTranslation();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[WBSTranslationContext _generateJSONVersionOfContent:forPurpose:completionHandler:](v15, v8);
    }
    v9[2](v9, &stru_1F031A860);
  }
}

- (void)_generateJSONVersionOfErrors:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  char v6 = (void *)MEMORY[0x1E4F28D90];
  id v12 = 0;
  id v7 = (void (**)(id, uint64_t))a4;
  id v8 = [v6 dataWithJSONObject:v5 options:2 error:&v12];
  id v9 = v12;
  if (v8)
  {
    uint64_t v10 = [[NSString alloc] initWithData:v8 encoding:4];
    v7[2](v7, v10);

    id v7 = (void (**)(id, uint64_t))v10;
  }
  else
  {
    uint64_t v11 = WBS_LOG_CHANNEL_PREFIXTranslation();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[WBSTranslationContext _generateJSONVersionOfErrors:completionHandler:](v11, v5);
    }
    v7[2](v7, (uint64_t)&stru_1F031A860);
  }
}

- (id)_userVisibleErrorMessageForError:(id)a3
{
  id v4 = a3;
  id v5 = [v4 domain];
  unint64_t v6 = [v4 code];

  id v7 = get_LTTranslationErrorDomain();
  int v8 = [v5 isEqualToString:v7];

  if (v8)
  {
    if (v6 > 0xB || ((1 << v6) & 0xEEF) == 0) {
      goto LABEL_6;
    }
  }
  else
  {
    if ([v5 isEqualToString:*MEMORY[0x1E4F46820]])
    {
LABEL_6:
      uint64_t v9 = [(WBSTranslationContext *)self _genericErrorMessage];
LABEL_9:
      uint64_t v10 = (void *)v9;
      goto LABEL_11;
    }
    if ([v5 isEqualToString:*MEMORY[0x1E4F289A0]])
    {
      uint64_t v9 = _WBSLocalizedString();
      goto LABEL_9;
    }
  }
  uint64_t v10 = 0;
LABEL_11:

  return v10;
}

- (id)_genericErrorMessage
{
  return (id)_WBSLocalizedString();
}

- (BOOL)_translationSupportedInCurrentRegion
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__29;
  uint64_t v10 = __Block_byref_object_dispose__29;
  id v11 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __61__WBSTranslationContext__translationSupportedInCurrentRegion__block_invoke;
  v5[3] = &unk_1E5E43620;
  void v5[4] = self;
  void v5[5] = &v6;
  performWithLock(&self->_synchronousIvarLock, v5);
  uint64_t v2 = (void *)v7[5];
  if (v2) {
    char v3 = [v2 BOOLValue];
  }
  else {
    char v3 = 0;
  }
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __61__WBSTranslationContext__translationSupportedInCurrentRegion__block_invoke(uint64_t a1)
{
}

- (BOOL)_nextURLIsEligibleForContinuedTranslation:(id)a3
{
  id v4 = a3;
  if (self->_nextNavigationIsEligibleForContinuedTranslation)
  {
    uint64_t v16 = 0;
    id v17 = &v16;
    uint64_t v18 = 0x2020000000;
    uint64_t v19 = 0;
    uint64_t v10 = 0;
    id v11 = &v10;
    uint64_t v12 = 0x3032000000;
    id v13 = __Block_byref_object_copy__29;
    unint64_t v14 = __Block_byref_object_dispose__29;
    id v15 = 0;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __67__WBSTranslationContext__nextURLIsEligibleForContinuedTranslation___block_invoke;
    v9[3] = &unk_1E5E45540;
    v9[4] = self;
    void v9[5] = &v16;
    void v9[6] = &v10;
    performWithLock(&self->_synchronousIvarLock, v9);
    if (([(id)v11[5] isContinuedTranslationEnabled] & 1) != 0
      && canTransitionFromStateToState(v17[3], 5))
    {
      id v5 = [v4 host];
      uint64_t v6 = objc_msgSend(v5, "safari_highLevelDomainFromHost");

      char v7 = [v6 isEqualToString:self->_previousPageHighLevelDomain];
    }
    else
    {
      char v7 = 0;
    }
    _Block_object_dispose(&v10, 8);

    _Block_object_dispose(&v16, 8);
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

void __67__WBSTranslationContext__nextURLIsEligibleForContinuedTranslation___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[5] + 8) + 24) = *(void *)(a1[4] + 176);
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 192));
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = WeakRetained;
}

- (id)_currentSnapshot
{
  uint64_t v13 = 0;
  unint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__29;
  id v11 = __Block_byref_object_dispose__29;
  id v12 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41__WBSTranslationContext__currentSnapshot__block_invoke;
  v6[3] = &unk_1E5E45540;
  v6[4] = self;
  void v6[5] = &v13;
  void v6[6] = &v7;
  performWithLock(&self->_synchronousIvarLock, v6);
  uint64_t v3 = 0;
  unint64_t v4 = v14[3];
  if (v4 <= 7 && ((1 << v4) & 0xDC) != 0)
  {
    uint64_t v3 = objc_alloc_init(WBSTranslationContextSnapshot);
    [(WBSTranslationContextSnapshot *)v3 setWebpageLocale:v8[5]];
    [(WBSTranslationContextSnapshot *)v3 setState:v14[3]];
    [(WBSTranslationContextSnapshot *)v3 setTargetLocale:self->_targetLocale];
    [(WBSTranslationContextSnapshot *)v3 setWebpageURL:self->_cachedWebViewURL];
  }
  _Block_object_dispose(&v7, 8);

  _Block_object_dispose(&v13, 8);
  return v3;
}

void __41__WBSTranslationContext__currentSnapshot__block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[5] + 8) + 24) = *(void *)(a1[4] + 176);
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), *(id *)(a1[4] + 184));
}

- (BOOL)_restoreContextSnapshotIfNeeded:(id)a3 forURL:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    uint64_t v15 = WBS_LOG_CHANNEL_PREFIXTranslation();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[WBSTranslationContext _restoreContextSnapshotIfNeeded:forURL:]();
    }
    goto LABEL_10;
  }
  uint64_t v8 = [v6 webpageURL];
  char v9 = [v7 isEqual:v8];

  uint64_t v10 = WBS_LOG_CHANNEL_PREFIXTranslation();
  id v11 = v10;
  if ((v9 & 1) == 0)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1ABB70000, v11, OS_LOG_TYPE_INFO, "Can't restore snapshot because URLs don't match", (uint8_t *)&buf, 2u);
    }
LABEL_10:
    BOOL v16 = 0;
    goto LABEL_14;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = v11;
    uint64_t v13 = [v6 state];
    if ((unint64_t)(v13 - 1) > 6) {
      unint64_t v14 = @"Unknown";
    }
    else {
      unint64_t v14 = off_1E5E45C90[v13 - 1];
    }
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v14;
    _os_log_impl(&dword_1ABB70000, v12, OS_LOG_TYPE_DEFAULT, "Restoring using snapshot to state '%{public}@'", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v43 = 0x3032000000;
  long long v44 = __Block_byref_object_copy__29;
  long long v45 = __Block_byref_object_dispose__29;
  id v46 = 0;
  uint64_t v36 = 0;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x3032000000;
  long long v39 = __Block_byref_object_copy__29;
  id v40 = __Block_byref_object_dispose__29;
  id v41 = 0;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __64__WBSTranslationContext__restoreContextSnapshotIfNeeded_forURL___block_invoke;
  v35[3] = &unk_1E5E45540;
  v35[4] = self;
  v35[5] = &buf;
  v35[6] = &v36;
  performWithLock(&self->_synchronousIvarLock, v35);
  id v17 = [*(id *)(*((void *)&buf + 1) + 40) userPreferredTargetLocales];
  uint64_t v18 = (void *)v37[5];
  uint64_t v19 = [v6 webpageLocale];
  uint64_t v20 = availablePreferredTargetLocalesFilteredBySupportedLocales(v17, v18, v19);

  uint64_t v28 = MEMORY[0x1E4F143A8];
  uint64_t v29 = 3221225472;
  __int16 v30 = __64__WBSTranslationContext__restoreContextSnapshotIfNeeded_forURL___block_invoke_2;
  uint64_t v31 = &unk_1E5E40D60;
  uint64_t v32 = self;
  id v21 = v6;
  id v33 = v21;
  id v22 = v20;
  id v34 = v22;
  performWithLock(&self->_synchronousIvarLock, &v28);
  objc_msgSend(v21, "targetLocale", v28, v29, v30, v31, v32);
  id v23 = (NSString *)objc_claimAutoreleasedReturnValue();
  targetLocale = self->_targetLocale;
  self->_targetLocale = v23;

  uint64_t v25 = [v21 webpageURL];
  cachedWebViewURL = self->_cachedWebViewURL;
  self->_cachedWebViewURL = v25;

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&buf, 8);

  BOOL v16 = 1;
LABEL_14:

  return v16;
}

void __64__WBSTranslationContext__restoreContextSnapshotIfNeeded_forURL___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 192));
  uint64_t v3 = *(void *)(a1[5] + 8);
  unint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = WeakRetained;

  id v5 = *(void **)(a1[4] + 200);
  id v6 = (id *)(*(void *)(a1[6] + 8) + 40);
  objc_storeStrong(v6, v5);
}

uint64_t __64__WBSTranslationContext__restoreContextSnapshotIfNeeded_forURL___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) webpageLocale];
  uint64_t v3 = *(void *)(a1 + 32);
  unint64_t v4 = *(void **)(v3 + 184);
  *(void *)(v3 + 184) = v2;

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 280), *(id *)(a1 + 48));
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = [*(id *)(a1 + 40) state];
  return [v5 _setState:v6 usingLock:0 validatingTransitionIsAllowed:0];
}

- (void)_reportLanguageDetectionAnalyticsForWebpageLocale:(id)a3 notificationLevel:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__29;
  id v22 = __Block_byref_object_dispose__29;
  id v23 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __93__WBSTranslationContext__reportLanguageDetectionAnalyticsForWebpageLocale_notificationLevel___block_invoke;
  v17[3] = &unk_1E5E43620;
  v17[4] = self;
  v17[5] = &v18;
  performWithLock(&self->_synchronousIvarLock, v17);
  id v7 = [(id)v19[5] userPreferredTargetLocales];
  uint64_t v8 = [(WBSTranslationContext *)self availableTargetLocaleIdentifiers];
  uint64_t v9 = [v8 count];
  uint64_t v10 = [v7 firstObject];
  uint64_t v11 = preferredBaseLocalesContainBaseLocaleIdentifier(v8, v10);
  id v12 = [v8 firstObject];
  uint64_t v13 = v12;
  if (v11) {
    id v14 = 0;
  }
  else {
    id v14 = v12;
  }
  if (a4) {
    uint64_t v15 = 2;
  }
  else {
    uint64_t v15 = v9 != 0;
  }
  BOOL v16 = [MEMORY[0x1E4F98290] sharedLogger];
  objc_msgSend(v16, "didDetectLanguageOfWebpage:primaryLocale:webpageCanBeTranslatedToPrimaryLocale:canOfferTranslation:firstNonPrimaryLocaleThatCanBeTranslatedTo:numberOfPreferredLocales:notificationLevel:", v6, v10, v11, v9 != 0, v14, objc_msgSend(v7, "count"), v15);

  _Block_object_dispose(&v18, 8);
}

void __93__WBSTranslationContext__reportLanguageDetectionAnalyticsForWebpageLocale_notificationLevel___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 192));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  unint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = WeakRetained;
}

- (void)_reportRequestedTranslationAnalyticsForWebpageLocale:(id)a3 targetLocale:(id)a4 requestType:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__29;
  id v21 = __Block_byref_object_dispose__29;
  id v22 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __103__WBSTranslationContext__reportRequestedTranslationAnalyticsForWebpageLocale_targetLocale_requestType___block_invoke;
  v16[3] = &unk_1E5E43620;
  void v16[4] = self;
  void v16[5] = &v17;
  performWithLock(&self->_synchronousIvarLock, v16);
  uint64_t v10 = [(id)v18[5] userPreferredTargetLocales];
  uint64_t v11 = [v10 firstObject];
  id v12 = objc_msgSend(MEMORY[0x1E4F1CA20], "safari_baseLanguageFromLanguage:", v11);
  uint64_t v13 = objc_msgSend(MEMORY[0x1E4F1CA20], "safari_baseLanguageFromLanguage:", v9);
  uint64_t v14 = [v12 isEqualToString:v13];

  uint64_t v15 = [MEMORY[0x1E4F98290] sharedLogger];
  [v15 didRequestTranslatingToLocale:v9 webpageLocale:v8 requestType:a5 != 0 isTargetLocalePrimaryLocale:v14];

  _Block_object_dispose(&v17, 8);
}

void __103__WBSTranslationContext__reportRequestedTranslationAnalyticsForWebpageLocale_targetLocale_requestType___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 192));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  unint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = WeakRetained;
}

- (void)_reportFilledFirstParagraphIfNeeded
{
  if (!self->_hasReportedFirstParagraphFinishedFillingForAnalytics)
  {
    self->_hasReportedFirstParagraphFinishedFillingForAnalytics = 1;
    [(_LTTranslationSession *)self->_cachedSession markFirstParagraphComplete];
  }
}

- (void)_reportFinishedFillingInitialPageContentIfNeeded
{
  if (!self->_hasReportedInitialPageFinishedFillingForAnalytics)
  {
    self->_hasReportedInitialPageFinishedFillingForAnalytics = 1;
    [(_LTTranslationSession *)self->_cachedSession markPageComplete];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector())
    {
      v4[0] = MEMORY[0x1E4F143A8];
      v4[1] = 3221225472;
      v4[2] = __73__WBSTranslationContext__reportFinishedFillingInitialPageContentIfNeeded__block_invoke;
      v4[3] = &unk_1E5E40D38;
      id v5 = WeakRetained;
      id v6 = self;
      dispatch_async(MEMORY[0x1E4F14428], v4);
    }
  }
}

uint64_t __73__WBSTranslationContext__reportFinishedFillingInitialPageContentIfNeeded__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) translationContextNeedsScrollHeightVisibilityUpdate:*(void *)(a1 + 40)];
}

- (void)_reportFinishedFillingInitialVisiblePageContentIfNeeded
{
  if (!self->_hasReportedInitialVisibleParagraphsFinishedFillingForAnalytics)
  {
    self->_hasReportedInitialVisibleParagraphsFinishedFillingForAnalytics = 1;
    if (objc_opt_respondsToSelector())
    {
      cachedSession = self->_cachedSession;
      [(_LTTranslationSession *)cachedSession markProgressDone];
    }
  }
}

- (void)_cancelProgressForNavigation:(BOOL)a3
{
  if (a3)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __54__WBSTranslationContext__cancelProgressForNavigation___block_invoke;
    v5[3] = &unk_1E5E40968;
    void v5[4] = self;
    performWithLock(&self->_synchronousIvarLock, v5);
  }
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __54__WBSTranslationContext__cancelProgressForNavigation___block_invoke_2;
  v4[3] = &unk_1E5E40968;
  void v4[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], v4);
}

void __54__WBSTranslationContext__cancelProgressForNavigation___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 216) = 0;
  *(void *)(*(void *)(a1 + 32) + 224) = 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 249) = 0;
  *(void *)(*(void *)(a1 + 32) + 240) = 0;
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 232);
  *(void *)(v1 + 232) = 0;
}

uint64_t __54__WBSTranslationContext__cancelProgressForNavigation___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) fluidProgressController];
  [v2 cancelFluidProgressWithProgressStateSource:*(void *)(a1 + 32)];

  uint64_t v3 = *(void **)(a1 + 32);
  return [v3 _notifyDelegateToReportProgressInUnifiedField:0];
}

- (void)_startProgressForExtractingContent
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_1ABB70000, v0, OS_LOG_TYPE_DEBUG, "Progress for %{public}@: Starting progress for extracting content", v1, 0xCu);
}

void __59__WBSTranslationContext__startProgressForExtractingContent__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) fluidProgressController];
  [v2 startFluidProgressWithProgressStateSource:*(void *)(a1 + 32)];
}

- (void)_updateProgressWithExtractedParagraphCount:(unint64_t)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68__WBSTranslationContext__updateProgressWithExtractedParagraphCount___block_invoke;
  void v8[3] = &unk_1E5E45BE8;
  void v8[4] = self;
  void v8[5] = &v13;
  void v8[6] = &v9;
  v8[7] = a3;
  performWithLock(&self->_synchronousIvarLock, v8);
  id v5 = WBS_LOG_CHANNEL_PREFIXTranslation();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    if (*((unsigned char *)v14 + 24)) {
      id v6 = @"YES";
    }
    else {
      id v6 = @"NO";
    }
    uint64_t v7 = v10[3];
    *(_DWORD *)long long buf = 138544130;
    uint64_t v18 = self;
    __int16 v19 = 2048;
    unint64_t v20 = a3;
    __int16 v21 = 2114;
    id v22 = v6;
    __int16 v23 = 2048;
    uint64_t v24 = v7;
    _os_log_debug_impl(&dword_1ABB70000, v5, OS_LOG_TYPE_DEBUG, "Progress for %{public}@: Extracted %lu new paragraphs; part of initial set: %{public}@; now have %lu initially ext"
      "racted paragraphs",
      buf,
      0x2Au);
  }
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);
}

void *__68__WBSTranslationContext__updateProgressWithExtractedParagraphCount___block_invoke(void *result)
{
  uint64_t v1 = result[4];
  if (!*(unsigned char *)(v1 + 249))
  {
    *(void *)(v1 + 216) += result[7];
    *(unsigned char *)(*(void *)(result[5] + 8) + 24) = 1;
    uint64_t v1 = result[4];
  }
  *(void *)(*(void *)(result[6] + 8) + 24) = *(void *)(v1 + 216);
  return result;
}

- (void)_updateProgressWithTranslatedParagraphCount:(unint64_t)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __69__WBSTranslationContext__updateProgressWithTranslatedParagraphCount___block_invoke;
  v12[3] = &unk_1E5E45BE8;
  v12[4] = self;
  void v12[5] = &v17;
  void v12[6] = &v13;
  v12[7] = a3;
  performWithLock(&self->_synchronousIvarLock, v12);
  [(WBSTranslationContext *)self estimatedProgress];
  double v6 = v5;
  uint64_t v7 = WBS_LOG_CHANNEL_PREFIXTranslation();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = v18[3];
    uint64_t v10 = v14[3];
    *(_DWORD *)long long buf = 138544386;
    id v22 = self;
    __int16 v23 = 2048;
    unint64_t v24 = a3;
    __int16 v25 = 2048;
    uint64_t v26 = v9;
    __int16 v27 = 2048;
    uint64_t v28 = v10;
    __int16 v29 = 2048;
    double v30 = v6;
    _os_log_debug_impl(&dword_1ABB70000, v7, OS_LOG_TYPE_DEBUG, "Progress for %{public}@: Translated %lu new paragraph(s); total translated paragraphs: %lu; initially extracted pa"
      "ragraphs: %lu; current estimated progress: %f",
      buf,
      0x34u);
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __69__WBSTranslationContext__updateProgressWithTranslatedParagraphCount___block_invoke_109;
  v11[3] = &unk_1E5E420F0;
  void v11[4] = self;
  *(double *)&void v11[5] = v6;
  dispatch_async(MEMORY[0x1E4F14428], v11);
  if (v6 >= 1.0) {
    [(WBSTranslationContext *)self _reportFinishedFillingInitialVisiblePageContentIfNeeded];
  }
  [(WBSTranslationContext *)self _estimatedProgressWithScope:0];
  if (v8 >= 1.0) {
    [(WBSTranslationContext *)self _reportFinishedFillingInitialPageContentIfNeeded];
  }
  else {
    [(WBSTranslationContext *)self _reportFilledFirstParagraphIfNeeded];
  }
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
}

void *__69__WBSTranslationContext__updateProgressWithTranslatedParagraphCount___block_invoke(void *result)
{
  *(void *)(result[4] + 224) += result[7];
  *(void *)(*(void *)(result[5] + 8) + 24) = *(void *)(result[4] + 224);
  *(void *)(*(void *)(result[6] + 8) + 24) = *(void *)(result[4] + 216);
  return result;
}

void __69__WBSTranslationContext__updateProgressWithTranslatedParagraphCount___block_invoke_109(uint64_t a1)
{
  uint64_t v1 = a1 + 32;
  id v2 = [*(id *)(a1 + 32) fluidProgressController];
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)v1;
  if (*(double *)(v1 + 8) >= 1.0)
  {
    [v2 finishFluidProgressWithProgressStateSource:v4];
    double v5 = WBS_LOG_CHANNEL_PREFIXTranslation();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __69__WBSTranslationContext__updateProgressWithTranslatedParagraphCount___block_invoke_109_cold_1((uint64_t *)v1, v5);
    }
  }
  else
  {
    [v2 updateFluidProgressWithProgressStateSource:v4];
  }
}

- (void)_updateProgressForFinishingInitialContentExtraction
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __76__WBSTranslationContext__updateProgressForFinishingInitialContentExtraction__block_invoke;
  void v8[3] = &unk_1E5E45C10;
  void v8[4] = self;
  void v8[5] = &v13;
  void v8[6] = &v9;
  performWithLock(&self->_synchronousIvarLock, v8);
  uint64_t v3 = (id)WBS_LOG_CHANNEL_PREFIXTranslation();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = v14[3];
    uint64_t v5 = v10[3];
    [(WBSTranslationContext *)self estimatedProgress];
    *(_DWORD *)long long buf = 138544130;
    uint64_t v18 = self;
    __int16 v19 = 2048;
    uint64_t v20 = v4;
    __int16 v21 = 2048;
    uint64_t v22 = v5;
    __int16 v23 = 2048;
    uint64_t v24 = v6;
    _os_log_debug_impl(&dword_1ABB70000, v3, OS_LOG_TYPE_DEBUG, "Progress for %{public}@: Finished extracting initial paragraphs with count %lu; translated paragraphs: %lu; curren"
      "t estimated progress: %f",
      buf,
      0x2Au);
  }

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __76__WBSTranslationContext__updateProgressForFinishingInitialContentExtraction__block_invoke_110;
  v7[3] = &unk_1E5E40968;
  v7[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], v7);
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);
}

uint64_t __76__WBSTranslationContext__updateProgressForFinishingInitialContentExtraction__block_invoke(void *a1)
{
  *(unsigned char *)(a1[4] + 249) = 1;
  uint64_t result = [*(id *)(a1[4] + 256) setFluidProgressAnimationPhase:1];
  *(void *)(*(void *)(a1[5] + 8) + 24) = *(void *)(a1[4] + 216);
  *(void *)(*(void *)(a1[6] + 8) + 24) = *(void *)(a1[4] + 224);
  return result;
}

void __76__WBSTranslationContext__updateProgressForFinishingInitialContentExtraction__block_invoke_110(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) fluidProgressController];
  [v2 updateFluidProgressWithProgressStateSource:*(void *)(a1 + 32)];
}

- (void)_notifyDelegateToReportProgressInUnifiedField:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = WBS_LOG_CHANNEL_PREFIXTranslation();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[WBSTranslationContext _notifyDelegateToReportProgressInUnifiedField:]();
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained translationContext:self shouldReportProgressInUnifiedField:v3];
  }
}

- (NSString)lastDeterminedWebpageLanguage
{
  return self->_lastDeterminedWebpageLanguage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastDeterminedWebpageLanguage, 0);
  objc_storeStrong((id *)&self->_cachedAvailablePreferredTargetLocalesFilteredBySupportedLocales, 0);
  objc_storeStrong((id *)&self->_cachedAllowedTargetLocaleIdentifiers, 0);
  objc_destroyWeak((id *)&self->_fluidProgressController);
  objc_storeStrong((id *)&self->_fluidProgressState, 0);
  objc_storeStrong((id *)&self->_initiallyVisibleParagraphIdentifiersQueuedForTranslation, 0);
  objc_storeStrong((id *)&self->_cachedTranslationSupportedInCurrentRegion, 0);
  objc_storeStrong((id *)&self->_cachedSupportedLocalePairs, 0);
  objc_destroyWeak((id *)&self->_preferenceProvider);
  objc_storeStrong((id *)&self->_webpageLocale, 0);
  objc_storeStrong((id *)&self->_previousPageHighLevelDomain, 0);
  objc_storeStrong((id *)&self->_previousPageSourceLocale, 0);
  objc_storeStrong((id *)&self->_previousPageTargetLocale, 0);
  objc_storeStrong((id *)&self->_scrollInteractionAnalyticsHelper, 0);
  objc_storeStrong((id *)&self->_cachedTextSamples, 0);
  objc_storeStrong((id *)&self->_snapshotToRestoreOnNextNavigation, 0);
  objc_storeStrong((id *)&self->_errorController, 0);
  objc_storeStrong((id *)&self->_cachedWebViewURL, 0);
  objc_storeStrong((id *)&self->_cachedClientIsUsingPrivateBrowsingValue, 0);
  objc_storeStrong((id *)&self->_diagnosticData, 0);
  objc_storeStrong((id *)&self->_targetLocale, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_languageDetector);
  objc_storeStrong((id *)&self->_contentFiller, 0);
  objc_storeStrong((id *)&self->_contentExtractor, 0);
  objc_destroyWeak((id *)&self->_contentTranslator);
  objc_storeStrong((id *)&self->_cachedSession, 0);
  objc_storeStrong((id *)&self->_translator, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

+ (id)translationContextWithWebView:(id)a3 delegate:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [[WBSTranslationWebpageContentExtractor alloc] initWithWebView:v6];

  double v8 = [[WBSTranslationContext alloc] initWithContentExtractor:v7 contentFiller:v7 delegate:v5];
  return v8;
}

- (void)owningWebViewDidDecidePolicy:(int64_t)a3 forNavigationAction:(id)a4 currentBackForwardListItem:(id)a5
{
  id v13 = a4;
  id v8 = a5;
  uint64_t v9 = [v13 targetFrame];
  uint64_t v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v11 = [v13 sourceFrame];
  }
  uint64_t v12 = v11;

  if ([v12 isMainFrame]) {
    -[WBSTranslationContext owningWebViewWillNavigateAndSaveCurrentSnapshotToStore:isEligibleForContinuedTranslation:](self, "owningWebViewWillNavigateAndSaveCurrentSnapshotToStore:isEligibleForContinuedTranslation:", v8, objc_msgSend(v13, "safari_isEligibleForContinuedTranslationWithPolicy:", a3));
  }
}

void __88__WBSTranslationContext_setWebpageLocaleWithExtractedTextSamples_url_completionHandler___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)BOOL v3 = 134218243;
  *(void *)&void v3[4] = a2;
  *(_WORD *)&v3[12] = 2117;
  *(void *)&v3[14] = *(void *)(a1 + 48);
  OUTLINED_FUNCTION_5(&dword_1ABB70000, a2, a3, "Ignoring text samples of count %lu. URL: %{sensitive}@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

void __66__WBSTranslationContext_requestSendFeedbackWithCompletionHandler___block_invoke_cold_1(void *a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a1;
  OUTLINED_FUNCTION_3();
  objc_opt_class();
  OUTLINED_FUNCTION_1();
  id v4 = v3;
  _os_log_error_impl(&dword_1ABB70000, v1, OS_LOG_TYPE_ERROR, "Delegate <%{public}@> does not implement selector -translationContext:showFeedbackConsentAlertWithCompletionHandler:, so we can't send feedback", v5, 0xCu);
}

void __103__WBSTranslationContext_translationContext_translateWebpageContents_toTargetLocale_translationHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_4(&dword_1ABB70000, v0, v1, "Can't load class _LTParagraphTranslationRequest; this new SPI is required for translation to continue working. Nothi"
    "ng will be translated; please install a newer build or a Translation root",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void __60__WBSTranslationContext_contentExtractor_didExtractContent___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_4(&dword_1ABB70000, v0, v1, "Failed to extract text from webpage to translate", v2, v3, v4, v5, v6);
}

void __72__WBSTranslationContext_contentFiller_didCompleteFillingItem_withError___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = objc_msgSend((id)OUTLINED_FUNCTION_3(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_1ABB70000, v2, OS_LOG_TYPE_DEBUG, "Successfully filled translated item: %{public}@", v5, 0xCu);
}

void __72__WBSTranslationContext_contentFiller_didCompleteFillingItem_withError___block_invoke_2_cold_2(void **a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *a1;
  id v5 = a2;
  uint64_t v6 = objc_msgSend(v4, "safari_privacyPreservingDescription");
  uint64_t v7 = objc_msgSend(*(id *)(a3 + 48), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_8();
  OUTLINED_FUNCTION_1_8(&dword_1ABB70000, v8, v9, "Failed to fill translated content into webpage with error: %{public}@; content: %{public}@",
    v10,
    v11,
    v12,
    v13,
    v14);
}

- (void)dominantLocaleForTextSamples:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_4(&dword_1ABB70000, v0, v1, "Translation framework not available, not identifying language", v2, v3, v4, v5, v6);
}

- (void)errorController:(uint8_t *)buf didReachThresholdForError:(os_log_t)log .cold.1(void *a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)long long buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_fault_impl(&dword_1ABB70000, log, OS_LOG_TYPE_FAULT, "Reached error threshold but can't show user an error message because delegate '%{public}@' doesn't respond to the selector. Error: %{public}@", buf, 0x16u);
}

- (void)_promptIfNeededToConsentToTranslationWithCompletionHandler:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(void *)(a2 + 4) = a1;
  id v5 = a1;
  _os_log_fault_impl(&dword_1ABB70000, a3, OS_LOG_TYPE_FAULT, "Delegate <%{public}@> does not implement selector -translationContext:showFirstTimeConsentAlertWithCompletionHandler:, so we can't perform translation", (uint8_t *)a2, 0xCu);
}

- (void)_generateJSONVersionOfContent:(void *)a1 forPurpose:(void *)a2 completionHandler:.cold.1(void *a1, void *a2)
{
  id v3 = a1;
  [a2 count];
  uint64_t v4 = objc_msgSend((id)OUTLINED_FUNCTION_3(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_8();
  OUTLINED_FUNCTION_1_8(&dword_1ABB70000, v5, v6, "Failed to generate JSON version of extracted paragraphs with count %lu and with error %{public}@", v7, v8, v9, v10, v11);
}

- (void)_generateJSONVersionOfErrors:(void *)a1 completionHandler:(void *)a2 .cold.1(void *a1, void *a2)
{
  id v3 = a1;
  [a2 count];
  uint64_t v4 = objc_msgSend((id)OUTLINED_FUNCTION_3(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_8();
  OUTLINED_FUNCTION_1_8(&dword_1ABB70000, v5, v6, "Failed to generate JSON version of errors with count %lu and with error %{public}@", v7, v8, v9, v10, v11);
}

- (void)_restoreContextSnapshotIfNeeded:forURL:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  _os_log_debug_impl(&dword_1ABB70000, v0, OS_LOG_TYPE_DEBUG, "No snapshot to restore", v1, 2u);
}

void __69__WBSTranslationContext__updateProgressWithTranslatedParagraphCount___block_invoke_109_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1ABB70000, a2, OS_LOG_TYPE_DEBUG, "Progress for %{public}@: Finished translating initial content, animating progress bar completion", (uint8_t *)&v3, 0xCu);
}

- (void)_notifyDelegateToReportProgressInUnifiedField:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5(&dword_1ABB70000, v0, v1, "Progress for %{public}@: Updating delegate whether to report progress in unified field: %{public}@");
}

@end