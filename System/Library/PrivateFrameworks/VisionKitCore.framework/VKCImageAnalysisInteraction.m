@interface VKCImageAnalysisInteraction
+ (id)keyPathsForValuesAffectingHasActiveTextSelection;
+ (void)_quickActionResultForDocumentObservation:(id)a3 queue:(id)a4 completionHandler:(id)a5;
- ($0FD61D44AD30C1CDCD15B60AC4039C90)videoPreviewTimeRange;
- (BOOL)_highlightSelectableItems;
- (BOOL)_inhibitSubjectDimmingAndLiftView;
- (BOOL)_isInPublicAutomaticMode;
- (BOOL)_isPublicAPI;
- (BOOL)_isShowingTranslationOverlay;
- (BOOL)_manuallyManagesActionInfoButtons;
- (BOOL)_photosInfoSingleTapSubjectModeEnabled;
- (BOOL)_publicAPIDelegateExists;
- (BOOL)_showVSResultForItem:(id)a3;
- (BOOL)actionInfoItemExistsAtPoint:(CGPoint)a3;
- (BOOL)actionInfoLayoutUpdatesSuspended;
- (BOOL)actionInfoLiveTextButtonDisabled;
- (BOOL)actionInfoQuickActionsDisabled;
- (BOOL)actionInfoViewHidden;
- (BOOL)actionInfoVisualSearchCornerViewDisabled;
- (BOOL)allowLongPressForDataDetectorsInTextMode;
- (BOOL)analysisButtonPrefersDarkGlyphWhenSelected;
- (BOOL)analysisButtonRequiresVisibleContentGating;
- (BOOL)analysisContainsTextAtPoint:(CGPoint)a3;
- (BOOL)automaticallyShowVisualSearchResults;
- (BOOL)baseOverlayView:(id)a3 shouldBeginInteractionAtPoint:(CGPoint)a4 withTypes:(unint64_t)a5;
- (BOOL)baseOverlayView:(id)a3 shouldHandleShareWithRanges:(id)a4 boundingRect:(CGRect)a5 selectedText:(id)a6 selectedAttributedText:(id)a7;
- (BOOL)baseOverlayView:(id)a3 shouldShowLookupForItemFromCallout:(id)a4;
- (BOOL)buttonsVisible;
- (BOOL)dataDetectorExistsAtPoint:(CGPoint)a3;
- (BOOL)deriveQuickActionsVisibilityFromState;
- (BOOL)didAddVisualSearchCornerView;
- (BOOL)didInteractWithVisualSearchItem;
- (BOOL)didLogAnalysisButtonVisible;
- (BOOL)didToggleAAButton;
- (BOOL)forceAnalysisBarButtonItemEnabled;
- (BOOL)hasActiveTextSelection;
- (BOOL)imageSubjectExistsAtPoint:(CGPoint)a3;
- (BOOL)interactableItemExistsAtPoint:(CGPoint)a3;
- (BOOL)isBaseOverlayViewShowingLivePhoto:(id)a3 delegateHasImplementation:(BOOL *)a4;
- (BOOL)isSettingAnalysis;
- (BOOL)isSubjectAnalysisComplete;
- (BOOL)isSubjectHighlightAvailable;
- (BOOL)isUpdatingActiveTypes;
- (BOOL)liveTextButtonVisible;
- (BOOL)subjectHighlightActive;
- (BOOL)subjectInteractionInProgress;
- (BOOL)subjectViewUserInteractionDisabled;
- (BOOL)textExistsAtPoint:(CGPoint)a3;
- (BOOL)topLevelImplementsContentsRectDelegateForBaseView:(id)a3;
- (BOOL)usesLightDimmingViewInLightMode;
- (BOOL)visualSearchExistsAtPoint:(CGPoint)a3;
- (BOOL)wantsAutomaticContentsRectCalculation;
- (BOOL)wantsTranslucentActionInfoButtons;
- (CGRect)contentsRect;
- (CGRect)contentsRectForImageRecognitionBaseView:(id)a3;
- (CGRect)imageSubjectBoundsWithIndexes:(id)a3;
- (CGRect)subjectFrame;
- (CGRect)videoPreviewNormalizedCropRect;
- (NSArray)_actionInfoButtons;
- (NSArray)actionButtons;
- (NSArray)baseViewConstraints;
- (NSArray)selectedRanges;
- (NSArray)visualSearchResultItems;
- (NSAttributedString)selectedAttributedText;
- (NSIndexSet)allSubjectIndexes;
- (NSIndexSet)selectedSubjectIndexes;
- (NSString)_customAnalyticsIdentifier;
- (NSString)description;
- (NSString)selectedText;
- (NSString)text;
- (UIActivity)feedbackActivity;
- (UIEdgeInsets)actionInfoEdgeInsets;
- (UIFont)actionInfoCustomFont;
- (UIGestureRecognizer)feedbackGestureRecognizer;
- (UIImage)_photosImageForRemoveBackground;
- (UIView)view;
- (UIView)viewForObservingContentMode;
- (VKAnalyticsProcessor)analyticsProcessor;
- (VKAnalyticsSessionAccumulator)analyticsSession;
- (VKCActionInfoView)actionInfoView;
- (VKCImageAnalysis)analysis;
- (VKCImageAnalysisBaseView)baseView;
- (VKCImageAnalysisInteraction)init;
- (VKCImageAnalysisInteraction)initWithInteractionOptions:(unint64_t)a3;
- (VKCImageAnalysisInteractionDelegate)delegate;
- (VKCVisualSearchCornerView)actionInfoCornerButtonView;
- (VKCVisualSearchCornerView)actionInfoCornerButtonViewIfExists;
- (VKCVisualSearchCornerView)visualSearchCornerButtonView;
- (VKImageAnalysisBarButtonItem)analysisBarButtonItem;
- (VKImageAnalysisButton)actionInfoAnalysisButton;
- (VKImageAnalysisButton)actionInfoAnalysisButtonIfExists;
- (VKImageAnalysisButton)analysisButton;
- (VKInteractionAnalyticsDelegate)_analyticsDelegate;
- (double)preferredQuickActionButtonHeight;
- (double)visibleTextAreaThreshold;
- (id)_createQuickActionInfos;
- (id)_filteredNormalizedRectangleQuads;
- (id)_filteredRectangleQuads;
- (id)_rawRectangleObservations;
- (id)actionInfoViewIfExists;
- (id)baseOverlayView:(id)a3 updateAttributedStringForCopy:(id)a4;
- (id)baseOverlayView:(id)a3 updateStringForCopy:(id)a4;
- (id)createAnalysisButton;
- (id)customLayoutActionInfoView;
- (id)generatePlistsForScalingAndAlignment;
- (id)generateSubjectImage;
- (id)imageForImageSnapshotForBaseView:(id)a3;
- (id)imageSubjectPathWithIndexes:(id)a3;
- (id)presentingViewControllerForFeedbackProvider;
- (id)presentingViewControllerForImageAnalysisInteraction;
- (id)previewForDataDetectorElementView:(id)a3;
- (id)quickActionConfigurationUpdateHandler;
- (id)resultItems;
- (id)subjectIndexAtPoint:(CGPoint)a3;
- (id)summaryDescription;
- (id)videoPreviewSubjectMatteAtCompositionTime:(id *)a3;
- (id)videoPreviewSubjectMatteForImage:(id)a3 atCompositionTime:(id *)a4;
- (id)viewForImageSnapshotForBaseView:(id)a3;
- (unint64_t)activeInteractionTypes;
- (unint64_t)analyticsTimeoutIndex;
- (unint64_t)dataDetectorTypes;
- (unint64_t)deriveCurrentAutomaticState;
- (unint64_t)interactionTypesSetByClient;
- (void)_automaticallyShowVisualSearchResultsIfApplicable;
- (void)_copyAllToClipboard;
- (void)_highlightFilteredRectangleQuads;
- (void)_highlightRectangleObservations;
- (void)_provideFeedback;
- (void)_setActiveInteractionTypes:(unint64_t)a3 updateAutomaticState:(BOOL)a4;
- (void)_test_activateTranslationOverlay;
- (void)aAAnalysisButtonPressed:(id)a3;
- (void)addEventToAnalyticsSession:(id)a3;
- (void)addMetadataToVSFeedbackItem:(id)a3;
- (void)analysisDidUpdate:(id)a3;
- (void)baseOverlayView:(id)a3 analyticsEventDidOccur:(id)a4;
- (void)baseOverlayView:(id)a3 didFinishTransitionToNormalizedVisibleRect:(CGRect)a4;
- (void)baseOverlayView:(id)a3 didTapVisualSearchIndicatorWithNormalizedBoundingBox:(CGRect)a4;
- (void)baseOverlayView:(id)a3 didUpdateToNormalizedVisibleRect:(CGRect)a4;
- (void)baseOverlayView:(id)a3 livePhotoShouldPlay:(BOOL)a4;
- (void)baseOverlayView:(id)a3 prepareForCalloutAction:(SEL)a4 completion:(id)a5;
- (void)baseOverlayViewDidBeginSubjectAnalysis:(id)a3;
- (void)baseOverlayViewDidCompleteSubjectAnalysis:(id)a3;
- (void)baseOverlayViewDidRequestButtonStateUpdate:(id)a3;
- (void)baseOverlayViewDismissVisualSearchController:(id)a3;
- (void)baseOverlayViewSubjectInteractionInProgressDidChange:(id)a3;
- (void)beginImageSubjectAnalysisIfNecessary;
- (void)beginImageSubjectAnalysisIfNecessaryWithCompletion:(id)a3;
- (void)beginImageSubjectAnalysisWithDelayIfNecessary;
- (void)beginNewAnalyticsSessionIfNecessary;
- (void)clearMatchedHighlightsIfNecessaryAnimated:(BOOL)a3;
- (void)closeAndSendCurrentAnalyticsSession;
- (void)commonInit;
- (void)configureButtonsForState:(unint64_t)a3 updateActiveTypes:(BOOL)a4;
- (void)configureForCurrentDerivedAutomaticStateWithUpdateActiveTypes:(BOOL)a3;
- (void)createStickerImageAtIndexSet:(id)a3 completion:(id)a4;
- (void)createStickerRepresentationsAtIndexSet:(id)a3 completion:(id)a4;
- (void)createStickerRepresentationsAtIndexSet:(id)a3 type:(unint64_t)a4 stickerIDs:(id)a5 progress:(id)a6 completion:(id)a7;
- (void)dealloc;
- (void)didMoveToView:(id)a3;
- (void)generateTextualVisualSearchResultForQueryInfo:(id)a3 completionHandler:(id)a4;
- (void)generateVisualSearchResultForItems:(id)a3 queryID:(unint64_t)a4 completionHandler:(id)a5;
- (void)hasActiveTextSelectionDidChangeForBaseOverlayView:(id)a3;
- (void)highlightMatchesForString:(id)a3 animated:(BOOL)a4;
- (void)highlightMatchesForStrings:(id)a3 animated:(BOOL)a4;
- (void)highlightSelectableItemsDidChangeForBaseOverlayView:(id)a3;
- (void)highlightSubjectAtIndexSet:(id)a3 showCallout:(BOOL)a4 showBurst:(BOOL)a5 burstPoint:(CGPoint)a6 animated:(BOOL)a7;
- (void)loadImageSubjectIfAvailableWithCompletion:(id)a3;
- (void)loadImageSubjectWithIndexes:(id)a3 completion:(id)a4;
- (void)logButtonsVisibleStatus;
- (void)navOrToolbarVisibilityDidChange:(id)a3;
- (void)navOrToolbarVisibilityWillChange:(id)a3;
- (void)openInfoPaneForTopItem;
- (void)quickActionProcessingCompleteForBaseOverlayView:(id)a3;
- (void)resetSelection;
- (void)scrollViewDidZoomToUnitRect:(CGRect)a3;
- (void)sendAAButtonPressedDelegateCallbackIfNecessaryForSender:(id)a3;
- (void)sendAnalyticsEventWithType:(int64_t)a3 source:(int64_t)a4 analysisButtonActive:(BOOL)a5;
- (void)setActionButtons:(id)a3;
- (void)setActionInfoAnalysisButton:(id)a3;
- (void)setActionInfoCornerButtonView:(id)a3;
- (void)setActionInfoCustomFont:(id)a3;
- (void)setActionInfoEdgeInsets:(UIEdgeInsets)a3;
- (void)setActionInfoLayoutUpdatesSuspended:(BOOL)a3;
- (void)setActionInfoLiveTextButtonDisabled:(BOOL)a3;
- (void)setActionInfoQuickActionsDisabled:(BOOL)a3;
- (void)setActionInfoView:(id)a3;
- (void)setActionInfoViewHidden:(BOOL)a3;
- (void)setActionInfoViewHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)setActionInfoVisualSearchCornerViewDisabled:(BOOL)a3;
- (void)setActiveInteractionTypes:(unint64_t)a3;
- (void)setActiveSubjectIndexSet:(id)a3;
- (void)setAllowLongPressForDataDetectorsInTextMode:(BOOL)a3;
- (void)setAnalysis:(id)a3;
- (void)setAnalysisBarButtonItem:(id)a3;
- (void)setAnalysisButton:(id)a3;
- (void)setAnalysisButtonPrefersDarkGlyphWhenSelected:(BOOL)a3;
- (void)setAnalysisButtonRequiresVisibleContentGating:(BOOL)a3;
- (void)setAnalyticsProcessor:(id)a3;
- (void)setAnalyticsSession:(id)a3;
- (void)setAnalyticsTimeoutIndex:(unint64_t)a3;
- (void)setAutomaticallyShowVisualSearchResults:(BOOL)a3;
- (void)setBaseView:(id)a3;
- (void)setBaseViewConstraints:(id)a3;
- (void)setButtonsVisible:(BOOL)a3;
- (void)setDataDetectorTypes:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDeriveQuickActionsVisibilityFromState:(BOOL)a3;
- (void)setDidInteractWithVisualSearchItem:(BOOL)a3;
- (void)setDidLogAnalysisButtonVisible:(BOOL)a3;
- (void)setDidToggleAAButton:(BOOL)a3;
- (void)setFeedbackGestureRecognizer:(id)a3;
- (void)setForceAnalysisBarButtonItemEnabled:(BOOL)a3;
- (void)setHighlightSelectableItems:(BOOL)a3;
- (void)setInteractionTypesSetByClient:(unint64_t)a3;
- (void)setIsSettingAnalysis:(BOOL)a3;
- (void)setIsUpdatingActiveTypes:(BOOL)a3;
- (void)setPreferredQuickActionButtonHeight:(double)a3;
- (void)setQuickActionConfigurationUpdateHandler:(id)a3;
- (void)setSelectedRanges:(id)a3;
- (void)setSubjectHighlightActive:(BOOL)a3;
- (void)setSubjectViewUserInteractionDisabled:(BOOL)a3;
- (void)setUsesLightDimmingViewInLightMode:(BOOL)a3;
- (void)setView:(id)a3;
- (void)setViewForObservingContentMode:(id)a3;
- (void)setVisibleTextAreaThreshold:(double)a3;
- (void)setVisualSearchCornerButtonView:(id)a3;
- (void)setWantsAutomaticContentsRectCalculation:(BOOL)a3;
- (void)setWantsTranslucentActionInfoButtons:(BOOL)a3;
- (void)set_analyticsDelegate:(id)a3;
- (void)set_customAnalyticsIdentifier:(id)a3;
- (void)set_highlightSelectableItems:(BOOL)a3;
- (void)set_inhibitSubjectDimmingAndLiftView:(BOOL)a3;
- (void)set_isInPublicAutomaticMode:(BOOL)a3;
- (void)set_isPublicAPI:(BOOL)a3;
- (void)set_isShowingTranslationOverlay:(BOOL)a3;
- (void)set_manuallyManagesActionInfoButtons:(BOOL)a3;
- (void)set_photosImageForRemoveBackground:(id)a3;
- (void)set_photosInfoSingleTapSubjectModeEnabled:(BOOL)a3;
- (void)set_publicAPIDelegateExists:(BOOL)a3;
- (void)showVisualSearchForResultItem:(id)a3;
- (void)submitVisualSearchUserFeedbackForReportIdentifier:(id)a3 userFeedbackPayload:(id)a4 sfReportData:(id)a5;
- (void)textSelectionDidChangeForBaseOverlayView:(id)a3;
- (void)triggerTapToRadar:(id)a3;
- (void)updateActionInfoLayout;
- (void)updateContentsRect;
- (void)updateForAnalyticsVisualSearchEventIfNecessary:(id)a3;
- (void)videoPreviewAvailableForBaseOverlayView:(id)a3;
- (void)visualSearchCornerView:(id)a3 analyticsEventDidOccur:(id)a4;
- (void)visualSearchCornerView:(id)a3 didTapVisualSearchIndicatorWithNormalizedBoundingBox:(CGRect)a4;
- (void)visualSearchCornerViewDidDismissVisualSearchController:(id)a3;
- (void)willMoveToView:(id)a3;
@end

@implementation VKCImageAnalysisInteraction

- (id)resultItems
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA48] array];
  v21 = [(VKCImageAnalysisInteraction *)self analysis];
  v20 = [v21 imageAnalysisResult];
  v4 = [v20 visualSearchResult];
  v5 = [v4 resultItems];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        v11 = [v10 domainInfo];
        v12 = [v11 displayLabel];

        v13 = [v10 domainInfo];
        v14 = [v13 displayMessage];

        v15 = [VKImageAnalysisInteractionResultInfo alloc];
        v16 = [v10 domainInfo];
        v17 = [v16 glyphName];
        [v10 normalizedBoundingBox];
        v18 = -[VKImageAnalysisInteractionResultInfo initWithDisplayLabel:displayMessage:glyphName:rect:](v15, "initWithDisplayLabel:displayMessage:glyphName:rect:", v12, v14, v17);

        [v3 addObject:v18];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v7);
  }

  return v3;
}

- (void)dealloc
{
  [(VKCImageAnalysisInteraction *)self setViewForObservingContentMode:0];
  [(VKCImageAnalysisInteraction *)self closeAndSendCurrentAnalyticsSession];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)VKCImageAnalysisInteraction;
  [(VKCImageAnalysisInteraction *)&v4 dealloc];
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(VKCImageAnalysisInteraction *)self analysis];
  uint64_t v6 = [v3 stringWithFormat:@"<%@ %p> id: %d", v4, self, objc_msgSend(v5, "analysisRequestID")];

  return (NSString *)v6;
}

- (id)summaryDescription
{
  v2 = [(VKCImageAnalysisInteraction *)self baseView];
  v3 = [v2 text];
  uint64_t v4 = objc_msgSend(v3, "vk_substringToIndex:", 40);

  return v4;
}

- (VKCImageAnalysisInteraction)init
{
  v6.receiver = self;
  v6.super_class = (Class)VKCImageAnalysisInteraction;
  v2 = [(VKCImageAnalysisInteraction *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(VKCImageAnalysisBaseView);
    baseView = v2->_baseView;
    v2->_baseView = v3;

    [(VKCImageAnalysisInteraction *)v2 commonInit];
  }
  return v2;
}

- (VKCImageAnalysisInteraction)initWithInteractionOptions:(unint64_t)a3
{
  uint64_t v4 = [(VKCImageAnalysisInteraction *)self init];
  v5 = v4;
  if (v4) {
    [(VKCImageAnalysisBaseView *)v4->_baseView useInteractionOptions:a3];
  }
  return v5;
}

- (void)commonInit
{
  id v12 = [(VKCImageAnalysisInteraction *)self baseView];
  [v12 setTranslatesAutoresizingMaskIntoConstraints:1];
  [v12 setWantsAutomaticContentsRectCalculation:1];
  [v12 setDataDetectorTypes:-1];
  [v12 setDelegate:self];
  [v12 setLoggingParentObject:self];
  v3 = objc_alloc_init(VKCVisualSearchCornerView);
  [(VKCImageAnalysisInteraction *)self setVisualSearchCornerButtonView:v3];

  uint64_t v4 = [(VKCImageAnalysisInteraction *)self _customAnalyticsIdentifier];
  v5 = [(VKCImageAnalysisInteraction *)self visualSearchCornerButtonView];
  objc_msgSend(v5, "set_customAnalyticsIdentifier:", v4);

  objc_super v6 = [(VKCImageAnalysisInteraction *)self visualSearchCornerButtonView];
  [v6 setDelegate:self];

  [v12 setDidAddVisualSearchCornerView:1];
  [(VKCImageAnalysisInteraction *)self setAnalysisButtonRequiresVisibleContentGating:1];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:self action:sel_triggerTapToRadar_];
  [v7 setNumberOfTapsRequired:2];
  [v7 setNumberOfTouchesRequired:2];
  [v7 setEnabled:vk_isInternalBuild()];
  [(VKCImageAnalysisInteraction *)self setFeedbackGestureRecognizer:v7];
  uint64_t v8 = objc_alloc_init(VKAnalyticsProcessor);
  analyticsProcessor = self->_analyticsProcessor;
  self->_analyticsProcessor = v8;

  v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v11 addObserver:self selector:sel_applicationWillResignActive_ name:*MEMORY[0x1E4F43710] object:0];

  [v10 addObserver:self selector:sel_navOrToolbarVisibilityDidChange_ name:*MEMORY[0x1E4F44120] object:0];
  [v10 addObserver:self selector:sel_navOrToolbarVisibilityWillChange_ name:*MEMORY[0x1E4F44128] object:0];
  [v10 addObserver:self selector:sel_navOrToolbarVisibilityDidChange_ name:*MEMORY[0x1E4F44110] object:0];
  [v10 addObserver:self selector:sel_navOrToolbarVisibilityWillChange_ name:*MEMORY[0x1E4F44118] object:0];
  [(VKCImageAnalysisInteraction *)self setActionInfoViewHidden:1 animated:0];
  [(VKCImageAnalysisInteraction *)self setDeriveQuickActionsVisibilityFromState:1];
  [(VKCImageAnalysisInteraction *)self setWantsTranslucentActionInfoButtons:1];
}

- (void)navOrToolbarVisibilityWillChange:(id)a3
{
  id v4 = a3;
  v5 = [(VKCImageAnalysisInteraction *)self view];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = [v4 object];

  uint64_t v8 = VKDynamicCast(v6, (uint64_t)v7);
  v9 = [v8 view];
  int v10 = objc_msgSend(v5, "vk_isDescendantOfView:", v9);

  if (v10)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __64__VKCImageAnalysisInteraction_navOrToolbarVisibilityWillChange___block_invoke;
    v11[3] = &unk_1E6BF0D18;
    v11[4] = self;
    vk_dispatchMainAfterDelay(v11, 0.0);
  }
}

void __64__VKCImageAnalysisInteraction_navOrToolbarVisibilityWillChange___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) baseView];
  [v1 updateNormalizedVisibleRectIfNecessary];
}

- (void)navOrToolbarVisibilityDidChange:(id)a3
{
  id v4 = a3;
  v5 = [(VKCImageAnalysisInteraction *)self view];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = [v4 object];

  uint64_t v8 = VKDynamicCast(v6, (uint64_t)v7);
  v9 = [v8 view];
  int v10 = objc_msgSend(v5, "vk_isDescendantOfView:", v9);

  if (v10)
  {
    id v11 = [(VKCImageAnalysisInteraction *)self baseView];
    [v11 updateNormalizedVisibleRectIfNecessary];
  }
}

- (void)willMoveToView:(id)a3
{
  if (!a3)
  {
    uint64_t v5 = [(VKCImageAnalysisInteraction *)self view];
    [(id)v5 removeGestureRecognizer:self->_feedbackGestureRecognizer];

    id v7 = +[VKImageAnalyzerMadInterface sharedInterface];
    uint64_t v6 = [(VKCImageAnalysisInteraction *)self baseView];
    LOBYTE(v5) = [v6 activeInteractionTypes];

    if ((v5 & 4) != 0) {
      [v7 didLeaveVisualSearchHints];
    }
  }
}

- (void)didMoveToView:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.interaction");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    int v10 = self;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_1DB266000, v5, OS_LOG_TYPE_DEFAULT, "Interaction %@ did move to view: %@", (uint8_t *)&v9, 0x16u);
  }

  [(VKCImageAnalysisInteraction *)self setView:v4];
  uint64_t v6 = [(VKCImageAnalysisInteraction *)self baseView];
  if (v4)
  {
    [v4 bounds];
    objc_msgSend(v6, "setFrame:");
    [v6 setAutoresizingMask:18];
    id v7 = [(VKCImageAnalysisInteraction *)self baseView];
    [v4 addSubview:v7];

    [(VKCImageAnalysisInteraction *)self setViewForObservingContentMode:v4];
    [v6 configureForCurrentActiveInteractionTypes];
    [v6 updateCurrentDisplayedViewContentsRect];
    [v4 addGestureRecognizer:self->_feedbackGestureRecognizer];
  }
  else
  {
    uint64_t v8 = [(VKCImageAnalysisInteraction *)self visualSearchCornerView];
    [v8 removeFromSuperview];

    [(VKCImageAnalysisInteraction *)self setViewForObservingContentMode:0];
    [v6 resetSelection];
    [v6 resignFirstResponder];
    [v6 removeFromSuperview];
  }
}

- (CGRect)contentsRect
{
  v2 = [(VKCImageAnalysisInteraction *)self baseView];
  [v2 contentsRect];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)setView:(id)a3
{
  p_view = &self->_view;
  id v6 = a3;
  objc_storeWeak((id *)p_view, v6);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v6;
  }
  else {
    id v5 = 0;
  }
  [(VKCImageAnalysisInteraction *)self setViewForObservingContentMode:v5];
}

- (void)setViewForObservingContentMode:(id)a3
{
  id v4 = a3;
  id v5 = [(VKCImageAnalysisInteraction *)self baseView];
  [v5 setViewForObservingContentMode:v4];
}

- (UIView)viewForObservingContentMode
{
  v2 = [(VKCImageAnalysisInteraction *)self baseView];
  double v3 = [v2 viewForObservingContentMode];

  return (UIView *)v3;
}

- (void)setAllowLongPressForDataDetectorsInTextMode:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(VKCImageAnalysisInteraction *)self baseView];
  [v4 setLongPressDataDetectorsInTextMode:v3];
}

- (BOOL)allowLongPressForDataDetectorsInTextMode
{
  v2 = [(VKCImageAnalysisInteraction *)self baseView];
  char v3 = [v2 longPressDataDetectorsInTextMode];

  return v3;
}

- (void)setAnalysis:(id)a3
{
  id v5 = (VKCImageAnalysis *)a3;
  id v6 = _VKSignpostLog();
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DB266000, v6, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "VKImageAnalyzerProcessRequestEvent", (const char *)&unk_1DB3491BE, buf, 2u);
  }

  double v7 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v17 = 0;
    _os_log_impl(&dword_1DB266000, v7, OS_LOG_TYPE_INFO, "Signpost End: \"VKImageAnalyzerProcessRequestEvent\"", v17, 2u);
  }

  p_analysis = &self->_analysis;
  if (self->_analysis != v5)
  {
    [(VKCImageAnalysisInteraction *)self setIsSettingAnalysis:1];
    [(VKCImageAnalysisInteraction *)self setDidLogAnalysisButtonVisible:0];
    double v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    analysis = self->_analysis;
    if (analysis)
    {
      double v11 = [(VKImageAnalysis *)analysis imageAnalysisResult];
      [v9 removeObserver:self name:@"VKAnalysisDidUpdateNotification" object:v11];
    }
    objc_storeStrong((id *)&self->_analysis, a3);
    if (*p_analysis)
    {
      double v12 = [(VKImageAnalysis *)*p_analysis imageAnalysisResult];
      [v9 addObserver:self selector:sel_analysisDidUpdate_ name:@"VKAnalysisDidUpdateNotification" object:v12];
    }
    [(VKCImageAnalysisInteraction *)self closeAndSendCurrentAnalyticsSession];
    [(VKCImageAnalysisInteraction *)self clearMatchedHighlightsIfNecessaryAnimated:0];
    double v13 = [(VKImageAnalysis *)v5 imageAnalysisResult];
    double v14 = [(VKCImageAnalysisInteraction *)self baseView];
    [v14 setAnalysisResult:v13];

    v15 = [(VKCImageAnalysisInteraction *)self visualSearchCornerButtonView];
    [v15 setAnalysis:v5];

    v16 = [(VKCImageAnalysisInteraction *)self actionInfoCornerButtonViewIfExists];
    [v16 setAnalysis:v5];

    [(VKCImageAnalysisInteraction *)self configureForCurrentDerivedAutomaticStateWithUpdateActiveTypes:0];
    [(VKCImageAnalysisInteraction *)self setDidToggleAAButton:0];
    [(VKCImageAnalysisInteraction *)self _automaticallyShowVisualSearchResultsIfApplicable];
    if (![(VKCImageAnalysisInteraction *)self didLogAnalysisButtonVisible]) {
      [(VKCImageAnalysisInteraction *)self logButtonsVisibleStatus];
    }
    [(VKCImageAnalysisInteraction *)self set_highlightSelectableItems:0];
    [(VKCImageAnalysisInteraction *)self setIsSettingAnalysis:0];
  }
}

- (NSString)text
{
  v2 = [(VKCImageAnalysisInteraction *)self baseView];
  char v3 = [v2 text];

  return (NSString *)v3;
}

- (NSString)selectedText
{
  v2 = [(VKCImageAnalysisInteraction *)self baseView];
  char v3 = [v2 selectedText];

  return (NSString *)v3;
}

- (NSAttributedString)selectedAttributedText
{
  v2 = [(VKCImageAnalysisInteraction *)self baseView];
  char v3 = [v2 selectedAttributedText];

  return (NSAttributedString *)v3;
}

- (NSArray)selectedRanges
{
  v2 = [(VKCImageAnalysisInteraction *)self baseView];
  char v3 = [v2 selectedRanges];

  return (NSArray *)v3;
}

- (void)setSelectedRanges:(id)a3
{
  id v4 = a3;
  id v5 = [(VKCImageAnalysisInteraction *)self baseView];
  [v5 setSelectedRanges:v4];
}

- (void)setActiveInteractionTypes:(unint64_t)a3
{
  if ([(VKCImageAnalysisInteraction *)self activeInteractionTypes] != a3)
  {
    [(VKCImageAnalysisInteraction *)self setInteractionTypesSetByClient:a3];
    [(VKCImageAnalysisInteraction *)self _setActiveInteractionTypes:a3 updateAutomaticState:1];
  }
}

- (void)_setActiveInteractionTypes:(unint64_t)a3 updateAutomaticState:(BOOL)a4
{
  BOOL v4 = a4;
  if ([(VKCImageAnalysisInteraction *)self isUpdatingActiveTypes]) {
    return;
  }
  [(VKCImageAnalysisInteraction *)self setIsUpdatingActiveTypes:1];
  double v7 = [(VKCImageAnalysisInteraction *)self baseView];
  [v7 setActiveInteractionTypes:a3];

  double v8 = [(VKCImageAnalysisInteraction *)self visualSearchCornerButtonView];
  [v8 setHidden:(a3 & 4) == 0];

  double v9 = [(VKCImageAnalysisInteraction *)self actionInfoCornerButtonViewIfExists];
  [v9 setHidden:(a3 & 4) == 0];

  if (!a3)
  {
    [(VKCImageAnalysisInteraction *)self set_highlightSelectableItems:0];
    if (!v4) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  if (v4) {
LABEL_4:
  }
    [(VKCImageAnalysisInteraction *)self configureForCurrentDerivedAutomaticStateWithUpdateActiveTypes:0];
LABEL_5:
  [(VKCImageAnalysisInteraction *)self _automaticallyShowVisualSearchResultsIfApplicable];
  double v10 = [(VKCImageAnalysisInteraction *)self actionInfoViewIfExists];
  [v10 updateLayoutIfNecessary];

  [(VKCImageAnalysisInteraction *)self setSubjectHighlightActive:0];
  [(VKCImageAnalysisInteraction *)self setIsUpdatingActiveTypes:0];
  [(VKCImageAnalysisInteraction *)self beginImageSubjectAnalysisWithDelayIfNecessary];
}

- (void)_automaticallyShowVisualSearchResultsIfApplicable
{
  char v3 = [(VKCImageAnalysisInteraction *)self baseView];
  char v4 = [v3 activeInteractionTypes];

  if ((v4 & 4) != 0
    && [(VKCImageAnalysisInteraction *)self automaticallyShowVisualSearchResults])
  {
    id v5 = [(VKCImageAnalysisInteraction *)self actionInfoCornerButtonViewIfExists];

    if (v5) {
      [(VKCImageAnalysisInteraction *)self actionInfoCornerButtonViewIfExists];
    }
    else {
    id v6 = [(VKCImageAnalysisInteraction *)self visualSearchCornerButtonView];
    }
    [v6 automaticallyShowVisualSearchResultsIfApplicable];

    id v7 = [(VKCImageAnalysisInteraction *)self baseView];
    [v7 automaticallyShowVisualSearchResultsIfApplicable];
  }
}

- (unint64_t)activeInteractionTypes
{
  v2 = [(VKCImageAnalysisInteraction *)self baseView];
  unint64_t v3 = [v2 activeInteractionTypes];

  return v3;
}

- (unint64_t)dataDetectorTypes
{
  v2 = [(VKCImageAnalysisInteraction *)self baseView];
  unint64_t v3 = [v2 dataDetectorTypes];

  return v3;
}

- (void)setDataDetectorTypes:(unint64_t)a3
{
  id v4 = [(VKCImageAnalysisInteraction *)self baseView];
  [v4 setDataDetectorTypes:a3];
}

- (void)setWantsAutomaticContentsRectCalculation:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(VKCImageAnalysisInteraction *)self baseView];
  [v4 setWantsAutomaticContentsRectCalculation:v3];
}

- (BOOL)wantsAutomaticContentsRectCalculation
{
  v2 = [(VKCImageAnalysisInteraction *)self baseView];
  char v3 = [v2 wantsAutomaticContentsRectCalculation];

  return v3;
}

+ (id)keyPathsForValuesAffectingHasActiveTextSelection
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"baseView.hasActiveTextSelection", 0);
}

- (BOOL)hasActiveTextSelection
{
  v2 = [(VKCImageAnalysisInteraction *)self baseView];
  char v3 = [v2 hasActiveTextSelection];

  return v3;
}

- (void)set_highlightSelectableItems:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(VKCImageAnalysisInteraction *)self baseView];
  [v4 setHighlightSelectableItems:v3];
}

- (BOOL)subjectViewUserInteractionDisabled
{
  v2 = [(VKCImageAnalysisInteraction *)self baseView];
  char v3 = [v2 subjectViewUserInteractionDisabled];

  return v3;
}

- (void)setSubjectViewUserInteractionDisabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(VKCImageAnalysisInteraction *)self baseView];
  [v4 setSubjectViewUserInteractionDisabled:v3];
}

- (BOOL)_highlightSelectableItems
{
  v2 = [(VKCImageAnalysisInteraction *)self baseView];
  char v3 = [v2 highlightSelectableItems];

  return v3;
}

- (void)setHighlightSelectableItems:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(VKCImageAnalysisInteraction *)self _highlightSelectableItems] != a3)
  {
    [(VKCImageAnalysisInteraction *)self set_highlightSelectableItems:v3];
    [(VKCImageAnalysisInteraction *)self configureForCurrentDerivedAutomaticStateWithUpdateActiveTypes:1];
  }
}

- (void)setSubjectHighlightActive:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(VKCImageAnalysisInteraction *)self baseView];
  [v4 setSubjectHighlightActive:v3];
}

- (void)highlightSubjectAtIndexSet:(id)a3 showCallout:(BOOL)a4 showBurst:(BOOL)a5 burstPoint:(CGPoint)a6 animated:(BOOL)a7
{
  BOOL v7 = a7;
  double y = a6.y;
  double x = a6.x;
  BOOL v10 = a5;
  BOOL v11 = a4;
  id v13 = a3;
  id v14 = [(VKCImageAnalysisInteraction *)self baseView];
  objc_msgSend(v14, "highlightSubjectAtIndexSet:showCallout:showBurst:burstPoint:animated:", v13, v11, v10, v7, x, y);
}

- (void)createStickerImageAtIndexSet:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __71__VKCImageAnalysisInteraction_createStickerImageAtIndexSet_completion___block_invoke;
  v8[3] = &unk_1E6BF1DE8;
  id v9 = v6;
  id v7 = v6;
  [(VKCImageAnalysisInteraction *)self loadImageSubjectWithIndexes:a3 completion:v8];
}

void __71__VKCImageAnalysisInteraction_createStickerImageAtIndexSet_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  id v5 = +[VKImageDataRequirements stickerRequirements];
  id v4 = objc_msgSend(v3, "vk_imageDataWithRequirements:", v5);

  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v4);
}

- (void)createStickerRepresentationsAtIndexSet:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [(VKCImageAnalysisInteraction *)self baseView];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __81__VKCImageAnalysisInteraction_createStickerRepresentationsAtIndexSet_completion___block_invoke;
  v10[3] = &unk_1E6BF2058;
  id v11 = v6;
  id v9 = v6;
  [v8 createStickerRepresentationsAtIndexSet:v7 type:7 stickerIDs:MEMORY[0x1E4F1CBF0] progress:0 completion:v10];
}

uint64_t __81__VKCImageAnalysisInteraction_createStickerRepresentationsAtIndexSet_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)createStickerRepresentationsAtIndexSet:(id)a3 type:(unint64_t)a4 stickerIDs:(id)a5 progress:(id)a6 completion:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a3;
  id v16 = [(VKCImageAnalysisInteraction *)self baseView];
  [v16 createStickerRepresentationsAtIndexSet:v15 type:a4 stickerIDs:v14 progress:v13 completion:v12];
}

- (id)videoPreviewSubjectMatteAtCompositionTime:(id *)a3
{
  id v4 = [(VKCImageAnalysisInteraction *)self baseView];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7 = *a3;
  id v5 = [v4 videoPreviewSubjectMatteAtCompositionTime:&v7];

  return v5;
}

- (id)videoPreviewSubjectMatteForImage:(id)a3 atCompositionTime:(id *)a4
{
  id v6 = a3;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7 = [(VKCImageAnalysisInteraction *)self baseView];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = *a4;
  double v8 = [v7 videoPreviewSubjectMatteForImage:v6 atCompositionTime:&v10];

  return v8;
}

- ($0FD61D44AD30C1CDCD15B60AC4039C90)videoPreviewTimeRange
{
  id v4 = [(VKCImageAnalysisInteraction *)self baseView];
  if (v4)
  {
    id v6 = v4;
    [v4 videoPreviewTimeRange];
    id v4 = v6;
  }
  else
  {
    *(_OWORD *)&retstr->var0.var3 = 0u;
    *(_OWORD *)&retstr->var1.var1 = 0u;
    *(_OWORD *)&retstr->var0.var0 = 0u;
  }

  return result;
}

- (CGRect)videoPreviewNormalizedCropRect
{
  uint64_t v2 = [(VKCImageAnalysisInteraction *)self baseView];
  [v2 videoPreviewNormalizedCropRect];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (BOOL)subjectHighlightActive
{
  uint64_t v2 = [(VKCImageAnalysisInteraction *)self baseView];
  char v3 = [v2 subjectHighlightActive];

  return v3;
}

- (BOOL)subjectInteractionInProgress
{
  uint64_t v2 = [(VKCImageAnalysisInteraction *)self baseView];
  char v3 = [v2 subjectInteractionInProgress];

  return v3;
}

- (void)setActiveSubjectIndexSet:(id)a3
{
  id v4 = a3;
  id v5 = [(VKCImageAnalysisInteraction *)self baseView];
  [v5 setActiveSubjectIndexSet:v4];
}

- (void)set_isPublicAPI:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(VKCImageAnalysisInteraction *)self baseView];
  [v5 setIsPublicAPI:v3];

  id v6 = [(VKCImageAnalysisInteraction *)self analyticsProcessor];
  [v6 setIsPublicAPI:v3];
}

- (BOOL)_isPublicAPI
{
  uint64_t v2 = [(VKCImageAnalysisInteraction *)self baseView];
  char v3 = [v2 isPublicAPI];

  return v3;
}

- (CGRect)subjectFrame
{
  uint64_t v2 = [(VKCImageAnalysisInteraction *)self baseView];
  [v2 subjectFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (BOOL)isSubjectHighlightAvailable
{
  uint64_t v2 = [(VKCImageAnalysisInteraction *)self baseView];
  char v3 = [v2 isSubjectHighlightAvailable];

  return v3;
}

- (BOOL)isSubjectAnalysisComplete
{
  uint64_t v2 = [(VKCImageAnalysisInteraction *)self baseView];
  char v3 = [v2 isSubjectAnalysisComplete];

  return v3;
}

- (NSIndexSet)allSubjectIndexes
{
  uint64_t v2 = [(VKCImageAnalysisInteraction *)self baseView];
  char v3 = [v2 allSubjectsIndexSet];

  return (NSIndexSet *)v3;
}

- (NSIndexSet)selectedSubjectIndexes
{
  uint64_t v2 = [(VKCImageAnalysisInteraction *)self baseView];
  char v3 = [v2 activeSubjectIndexSet];

  return (NSIndexSet *)v3;
}

- (id)generateSubjectImage
{
  uint64_t v2 = [(VKCImageAnalysisInteraction *)self baseView];
  char v3 = [v2 generateSubjectImage];

  return v3;
}

- (BOOL)_photosInfoSingleTapSubjectModeEnabled
{
  uint64_t v2 = [(VKCImageAnalysisInteraction *)self baseView];
  char v3 = [v2 _photosInfoSingleTapSubjectModeEnabled];

  return v3;
}

- (void)set_photosInfoSingleTapSubjectModeEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(VKCImageAnalysisInteraction *)self baseView];
  objc_msgSend(v4, "set_photosInfoSingleTapSubjectModeEnabled:", v3);
}

- (BOOL)_inhibitSubjectDimmingAndLiftView
{
  uint64_t v2 = [(VKCImageAnalysisInteraction *)self baseView];
  char v3 = [v2 inhibitSubjectDimmingAndLiftView];

  return v3;
}

- (void)set_inhibitSubjectDimmingAndLiftView:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(VKCImageAnalysisInteraction *)self baseView];
  [v4 setInhibitSubjectDimmingAndLiftView:v3];
}

- (void)loadImageSubjectIfAvailableWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(VKCImageAnalysisInteraction *)self baseView];
  [v5 loadImageSubjectIfAvailableWithCompletion:v4];
}

- (void)set_photosImageForRemoveBackground:(id)a3
{
  id v4 = a3;
  id v5 = [(VKCImageAnalysisInteraction *)self baseView];
  [v5 setCustomImageForRemoveBackground:v4];
}

- (UIImage)_photosImageForRemoveBackground
{
  uint64_t v2 = [(VKCImageAnalysisInteraction *)self baseView];
  BOOL v3 = [v2 customImageForRemoveBackground];

  return (UIImage *)v3;
}

- (BOOL)usesLightDimmingViewInLightMode
{
  uint64_t v2 = [(VKCImageAnalysisInteraction *)self baseView];
  char v3 = [v2 usesLightDimmingViewInLightMode];

  return v3;
}

- (void)setUsesLightDimmingViewInLightMode:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(VKCImageAnalysisInteraction *)self baseView];
  [v4 setUsesLightDimmingViewInLightMode:v3];
}

- (void)set_customAnalyticsIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(VKCImageAnalysisInteraction *)self baseView];
  [v5 setCustomAnalyticsIdentifier:v4];

  double v6 = [(VKCImageAnalysisInteraction *)self visualSearchCornerButtonView];
  objc_msgSend(v6, "set_customAnalyticsIdentifier:", v4);

  id v7 = [(VKCImageAnalysisInteraction *)self actionInfoCornerButtonViewIfExists];
  objc_msgSend(v7, "set_customAnalyticsIdentifier:", v4);
}

- (NSString)_customAnalyticsIdentifier
{
  uint64_t v2 = [(VKCImageAnalysisInteraction *)self baseView];
  BOOL v3 = [v2 customAnalyticsIdentifier];

  return (NSString *)v3;
}

- (BOOL)liveTextButtonVisible
{
  return self->_buttonsVisible;
}

- (void)setButtonsVisible:(BOOL)a3
{
  if (self->_buttonsVisible != a3)
  {
    self->_buttonsVisible = a3;
    id v4 = [(VKCImageAnalysisInteraction *)self delegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      double v6 = [(VKCImageAnalysisInteraction *)self delegate];
      [v6 imageAnalysisInteraction:self liveTextButtonDidChangeToVisible:self->_buttonsVisible];
    }
    [(VKCImageAnalysisInteraction *)self logButtonsVisibleStatus];
  }
}

- (void)logButtonsVisibleStatus
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  BOOL v3 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.interaction");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = VKMUIStringForBool([(VKCImageAnalysisInteraction *)self buttonsVisible]);
    int v5 = 138412546;
    double v6 = v4;
    __int16 v7 = 2112;
    double v8 = self;
    _os_log_impl(&dword_1DB266000, v3, OS_LOG_TYPE_DEFAULT, "Analysis button is visible: %@, %@ ", (uint8_t *)&v5, 0x16u);
  }
  [(VKCImageAnalysisInteraction *)self setDidLogAnalysisButtonVisible:1];
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
  if (![(VKCImageAnalysisInteraction *)self wantsAutomaticContentsRectCalculation])
  {
    id v4 = [(VKCImageAnalysisInteraction *)self baseView];
    [v4 updateCurrentDisplayedViewContentsRect];
  }
}

- (BOOL)interactableItemExistsAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = [(VKCImageAnalysisInteraction *)self view];
  __int16 v7 = [(VKCImageAnalysisInteraction *)self baseView];
  objc_msgSend(v6, "convertPoint:toView:", v7, x, y);
  double v9 = v8;
  double v11 = v10;

  double v12 = [(VKCImageAnalysisInteraction *)self baseView];
  LOBYTE(v6) = objc_msgSend(v12, "containsInteractiveItemAtPoint:", v9, v11);

  return (char)v6;
}

- (BOOL)textExistsAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = [(VKCImageAnalysisInteraction *)self view];
  __int16 v7 = [(VKCImageAnalysisInteraction *)self baseView];
  objc_msgSend(v6, "convertPoint:toView:", v7, x, y);
  double v9 = v8;
  double v11 = v10;

  double v12 = [(VKCImageAnalysisInteraction *)self baseView];
  LOBYTE(v6) = objc_msgSend(v12, "containsTextAtPoint:", v9, v11);

  return (char)v6;
}

- (BOOL)dataDetectorExistsAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = [(VKCImageAnalysisInteraction *)self view];
  __int16 v7 = [(VKCImageAnalysisInteraction *)self baseView];
  objc_msgSend(v6, "convertPoint:toView:", v7, x, y);
  double v9 = v8;
  double v11 = v10;

  double v12 = [(VKCImageAnalysisInteraction *)self baseView];
  uint64_t v13 = objc_msgSend(v12, "dataDetectorTypeAtPoint:", v9, v11);

  return v13 != 0;
}

- (BOOL)visualSearchExistsAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = [(VKCImageAnalysisInteraction *)self view];
  __int16 v7 = [(VKCImageAnalysisInteraction *)self baseView];
  objc_msgSend(v6, "convertPoint:toView:", v7, x, y);
  double v9 = v8;
  double v11 = v10;

  double v12 = [(VKCImageAnalysisInteraction *)self baseView];
  LOBYTE(v6) = objc_msgSend(v12, "containsVisualSearchItemAtPoint:", v9, v11);

  return (char)v6;
}

- (BOOL)actionInfoItemExistsAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = [(VKCImageAnalysisInteraction *)self view];
  __int16 v7 = [(VKCImageAnalysisInteraction *)self baseView];
  objc_msgSend(v6, "convertPoint:toView:", v7, x, y);
  double v9 = v8;
  double v11 = v10;

  double v12 = [(VKCImageAnalysisInteraction *)self baseView];
  LOBYTE(v6) = objc_msgSend(v12, "containsActionInfoItemAtPoint:", v9, v11);

  return (char)v6;
}

- (BOOL)analysisContainsTextAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = [(VKCImageAnalysisInteraction *)self view];
  __int16 v7 = [(VKCImageAnalysisInteraction *)self baseView];
  objc_msgSend(v6, "convertPoint:toView:", v7, x, y);
  double v9 = v8;
  double v11 = v10;

  double v12 = [(VKCImageAnalysisInteraction *)self baseView];
  LOBYTE(v6) = objc_msgSend(v12, "analysisContainsTextAtPoint:", v9, v11);

  return (char)v6;
}

- (BOOL)imageSubjectExistsAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = [(VKCImageAnalysisInteraction *)self view];
  __int16 v7 = [(VKCImageAnalysisInteraction *)self baseView];
  objc_msgSend(v6, "convertPoint:toView:", v7, x, y);
  double v9 = v8;
  double v11 = v10;

  double v12 = [(VKCImageAnalysisInteraction *)self baseView];
  LOBYTE(v6) = objc_msgSend(v12, "containsImageSubjectAtPoint:", v9, v11);

  return (char)v6;
}

- (id)subjectIndexAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = [(VKCImageAnalysisInteraction *)self view];
  __int16 v7 = [(VKCImageAnalysisInteraction *)self baseView];
  objc_msgSend(v6, "convertPoint:toView:", v7, x, y);
  double v9 = v8;
  double v11 = v10;

  double v12 = [(VKCImageAnalysisInteraction *)self baseView];
  uint64_t v13 = objc_msgSend(v12, "indexOfSubjectAtPoint:", v9, v11);

  return v13;
}

- (void)resetSelection
{
  id v2 = [(VKCImageAnalysisInteraction *)self baseView];
  [v2 resetSelection];
}

- (void)updateContentsRect
{
  id v2 = [(VKCImageAnalysisInteraction *)self baseView];
  [v2 updateCurrentDisplayedViewContentsRect];
}

- (void)beginImageSubjectAnalysisIfNecessary
{
  id v2 = [(VKCImageAnalysisInteraction *)self baseView];
  [v2 beginImageSubjectAnalysisIfNecessary];
}

- (void)beginImageSubjectAnalysisWithDelayIfNecessary
{
  id v2 = [(VKCImageAnalysisInteraction *)self baseView];
  [v2 beginImageSubjectAnalysisWithDelayIfNecessary];
}

- (void)beginImageSubjectAnalysisIfNecessaryWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(VKCImageAnalysisInteraction *)self baseView];
  [v5 beginImageSubjectAnalysisIfNecessaryWithCompletion:v4];
}

- (void)loadImageSubjectWithIndexes:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(VKCImageAnalysisInteraction *)self baseView];
  [v8 loadImageSubjectWithIndexes:v7 completion:v6];
}

- (id)imageSubjectPathWithIndexes:(id)a3
{
  id v4 = a3;
  id v5 = [(VKCImageAnalysisInteraction *)self baseView];
  id v6 = [v5 imageSubjectPathWithIndexes:v4];

  return v6;
}

- (CGRect)imageSubjectBoundsWithIndexes:(id)a3
{
  BOOL v3 = [(VKCImageAnalysisInteraction *)self imageSubjectPathWithIndexes:a3];
  id v4 = v3;
  if (v3)
  {
    [v3 bounds];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
  }
  else
  {
    double v6 = *MEMORY[0x1E4F1DB20];
    double v8 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v10 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v12 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.double y = v14;
  result.origin.double x = v13;
  return result;
}

- (void)setForceAnalysisBarButtonItemEnabled:(BOOL)a3
{
  if (self->_forceAnalysisBarButtonItemEnabled != a3)
  {
    self->_forceAnalysisBarButtonItemEnabled = a3;
    [(VKCImageAnalysisInteraction *)self configureForCurrentDerivedAutomaticStateWithUpdateActiveTypes:0];
  }
}

- (BOOL)_showVSResultForItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  double v6 = VKCheckedDynamicCast(v5, (uint64_t)v4);

  if (v6)
  {
    double v7 = [(VKCImageAnalysisInteraction *)self baseView];
    char v8 = [v7 presentVisualSearchForItem:v6];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (void)set_isShowingTranslationOverlay:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(VKCImageAnalysisInteraction *)self baseView];
  [v4 setIsShowingTranslation:v3];
}

- (BOOL)_isShowingTranslationOverlay
{
  id v2 = [(VKCImageAnalysisInteraction *)self baseView];
  char v3 = [v2 isShowingTranslation];

  return v3;
}

- (NSArray)visualSearchResultItems
{
  id v2 = [(VKCImageAnalysisInteraction *)self baseView];
  char v3 = [v2 visualSearchResultItems];

  return (NSArray *)v3;
}

- (void)showVisualSearchForResultItem:(id)a3
{
  id v4 = a3;
  id v6 = [(VKCImageAnalysisInteraction *)self baseView];
  uint64_t v5 = [v4 item];

  [v6 presentVisualSearchForItem:v5];
}

- (void)openInfoPaneForTopItem
{
  char v3 = [(VKCImageAnalysisInteraction *)self baseView];
  [v3 showTopVisualSearchResult];

  id v4 = [(VKCImageAnalysisInteraction *)self visualSearchResultItems];
  uint64_t v5 = [v4 firstObject];
  id v6 = [v5 item];
  [v6 setCurrentInvocationType:5];

  double v7 = [(VKCImageAnalysisInteraction *)self actionInfoCornerButtonViewIfExists];

  if (v7) {
    [(VKCImageAnalysisInteraction *)self actionInfoCornerButtonViewIfExists];
  }
  else {
  id v8 = [(VKCImageAnalysisInteraction *)self visualSearchCornerButtonView];
  }
  [v8 showVisualSearchResultView];
}

- (id)_createQuickActionInfos
{
  id v2 = [(VKCImageAnalysisInteraction *)self actionInfoView];
  char v3 = [v2 allQuickActions];

  id v4 = +[VKCDataDetectorInfo quickActionInfosFromQuickActions:v3];

  return v4;
}

- (void)_copyAllToClipboard
{
  id v2 = [(VKCImageAnalysisInteraction *)self baseView];
  [v2 copyAllToClipboard];
}

- (void)setActionInfoViewHidden:(BOOL)a3
{
}

- (void)setActionInfoViewHidden:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_actionInfoViewHidden != a3)
  {
    BOOL v4 = a4;
    BOOL v5 = a3;
    self->_actionInfoViewHidden = a3;
    if (a3)
    {
      id v8 = [(VKCImageAnalysisInteraction *)self actionInfoViewIfExists];
    }
    else
    {
      id v8 = [(VKCImageAnalysisInteraction *)self actionInfoView];
      double v7 = [(VKCImageAnalysisInteraction *)self baseView];
      [v7 updateNormalizedVisibleRectIfNecessary];
    }
    objc_msgSend(v8, "vk_setHidden:animated:", v5, v4);
  }
}

- (BOOL)actionInfoLiveTextButtonDisabled
{
  id v2 = [(VKCImageAnalysisInteraction *)self actionInfoViewIfExists];
  char v3 = v2;
  if (v2) {
    char v4 = [v2 liveTextButtonDisabled];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (void)setActionInfoLiveTextButtonDisabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(VKCImageAnalysisInteraction *)self actionInfoView];
  [v4 setLiveTextButtonDisabled:v3];
}

- (BOOL)actionInfoVisualSearchCornerViewDisabled
{
  id v2 = [(VKCImageAnalysisInteraction *)self actionInfoViewIfExists];
  BOOL v3 = v2;
  if (v2) {
    char v4 = [v2 visualSearchCornerViewDisabled];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (void)setActionInfoVisualSearchCornerViewDisabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(VKCImageAnalysisInteraction *)self actionInfoView];
  [v4 setVisualSearchCornerViewDisabled:v3];
}

- (BOOL)actionInfoQuickActionsDisabled
{
  id v2 = [(VKCImageAnalysisInteraction *)self actionInfoViewIfExists];
  BOOL v3 = v2;
  if (v2) {
    char v4 = [v2 quickActionsDisabled];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (void)setActionInfoQuickActionsDisabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(VKCImageAnalysisInteraction *)self actionInfoView];
  [v4 setQuickActionsDisabled:v3];
}

- (void)setActionInfoLayoutUpdatesSuspended:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(VKCImageAnalysisInteraction *)self actionInfoView];
  [v4 setLayoutUpdatesSuspended:v3];
}

- (UIEdgeInsets)actionInfoEdgeInsets
{
  id v2 = [(VKCImageAnalysisInteraction *)self actionInfoView];
  [v2 edgeInsets];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (void)setActionInfoEdgeInsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  id v7 = [(VKCImageAnalysisInteraction *)self actionInfoView];
  objc_msgSend(v7, "setEdgeInsets:", top, left, bottom, right);
}

- (void)setPreferredQuickActionButtonHeight:(double)a3
{
  if (self->_preferredQuickActionButtonHeight != a3)
  {
    self->_preferredQuickActionButtonHeight = a3;
    id v4 = [(VKCImageAnalysisInteraction *)self actionInfoViewIfExists];
    [v4 setPreferredQuickActionButtonHeight:a3];
  }
}

- (void)setActionInfoCustomFont:(id)a3
{
  double v5 = (UIFont *)a3;
  if (self->_actionInfoCustomFont != v5)
  {
    objc_storeStrong((id *)&self->_actionInfoCustomFont, a3);
    if (self->_actionInfoCustomFont)
    {
      objc_initWeak(&location, self);
      uint64_t v11 = MEMORY[0x1E4F143A8];
      uint64_t v12 = 3221225472;
      double v13 = __55__VKCImageAnalysisInteraction_setActionInfoCustomFont___block_invoke;
      double v14 = &unk_1E6BF20A8;
      objc_copyWeak(&v15, &location);
      [(VKCImageAnalysisInteraction *)self setQuickActionConfigurationUpdateHandler:&v11];
      actionInfoCustomFont = self->_actionInfoCustomFont;
      id v7 = [(VKCImageAnalysisInteraction *)self actionInfoView];
      double v8 = [v7 liveTextButton];
      [v8 setCustomSymbolFont:actionInfoCustomFont];

      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }
    else
    {
      [(VKCImageAnalysisInteraction *)self setQuickActionConfigurationUpdateHandler:0];
      double v9 = [(VKCImageAnalysisInteraction *)self actionInfoView];
      double v10 = [v9 liveTextButton];
      [v10 setCustomSymbolFont:0];
    }
  }
}

void __55__VKCImageAnalysisInteraction_setActionInfoCustomFont___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    double v5 = [v3 configuration];
    double v6 = (void *)[v5 copy];

    id v7 = [WeakRetained actionInfoCustomFont];
    [MEMORY[0x1E4F42A30] defaultFontSize];
    double v8 = objc_msgSend(v7, "fontWithSize:");

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __55__VKCImageAnalysisInteraction_setActionInfoCustomFont___block_invoke_2;
    v12[3] = &unk_1E6BF2080;
    id v13 = v8;
    id v9 = v8;
    [v6 setTitleTextAttributesTransformer:v12];
    double v10 = [MEMORY[0x1E4F42A98] configurationWithFont:v9];
    [v6 setPreferredSymbolConfigurationForImage:v10];

    [v3 setConfiguration:v6];
    uint64_t v11 = [WeakRetained actionInfoView];
    [v11 updateLayoutIfNecessary];
  }
}

id __55__VKCImageAnalysisInteraction_setActionInfoCustomFont___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (void *)[a2 mutableCopy];
  [v3 setObject:*(void *)(a1 + 32) forKeyedSubscript:*MEMORY[0x1E4F42508]];
  return v3;
}

- (void)setQuickActionConfigurationUpdateHandler:(id)a3
{
  id v4 = a3;
  id quickActionConfigurationUpdateHandler = self->_quickActionConfigurationUpdateHandler;
  id v10 = v4;
  double v6 = (void *)MEMORY[0x1E018E600]();
  LOBYTE(quickActionConfigurationUpdateHandler) = [quickActionConfigurationUpdateHandler isEqual:v6];

  if ((quickActionConfigurationUpdateHandler & 1) == 0)
  {
    id v7 = (void *)[v10 copy];
    id v8 = self->_quickActionConfigurationUpdateHandler;
    self->_id quickActionConfigurationUpdateHandler = v7;

    id v9 = [(VKCImageAnalysisInteraction *)self actionInfoViewIfExists];
    [v9 setQuickActionConfigurationUpdateHandler:v10];
  }
}

- (BOOL)actionInfoLayoutUpdatesSuspended
{
  id v2 = [(VKCImageAnalysisInteraction *)self actionInfoView];
  char v3 = [v2 layoutUpdatesSuspended];

  return v3;
}

- (void)updateActionInfoLayout
{
  id v2 = [(VKCImageAnalysisInteraction *)self actionInfoViewIfExists];
  [v2 updateLayoutIfNecessary];
}

- (id)customLayoutActionInfoView
{
  char v3 = [(VKCImageAnalysisInteraction *)self actionInfoView];
  [v3 setAutomaticVisualRectLayoutDisabled:1];
  id v4 = [v3 superview];
  double v5 = [(VKCImageAnalysisInteraction *)self baseView];

  if (v4 == v5) {
    [v3 removeFromSuperview];
  }
  [(VKCImageAnalysisInteraction *)self setActionInfoViewHidden:0 animated:0];
  return v3;
}

- (void)setWantsTranslucentActionInfoButtons:(BOOL)a3
{
  if (self->_wantsTranslucentActionInfoButtons != a3)
  {
    BOOL v3 = a3;
    self->_wantsTranslucentActionInfoButtons = a3;
    id v4 = [(VKCImageAnalysisInteraction *)self actionInfoViewIfExists];
    [v4 setWantsTranslucentActionInfoButtons:v3];
  }
}

- (NSArray)_actionInfoButtons
{
  if (!self->_actionButtons)
  {
    BOOL v3 = [(VKCImageAnalysisInteraction *)self baseView];
    id v4 = [v3 quickActions];
    actionButtons = self->_actionButtons;
    self->_actionButtons = v4;
  }
  double v6 = [(VKCImageAnalysisInteraction *)self actionButtons];
  id v7 = (void *)[v6 copy];

  return (NSArray *)v7;
}

- (void)analysisDidUpdate:(id)a3
{
  id v4 = [a3 userInfo];
  double v5 = [v4 objectForKeyedSubscript:@"updatedTypes"];
  uint64_t v6 = [v5 integerValue];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__VKCImageAnalysisInteraction_analysisDidUpdate___block_invoke;
  v7[3] = &__block_descriptor_40_e37_v16__0__VKCImageAnalysisInteraction_8l;
  v7[4] = v6;
  vk_performBlockOnMainThreadWithStrongSelf(self, v7);
}

void __49__VKCImageAnalysisInteraction_analysisDidUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v28 = a2;
  BOOL v3 = [v28 baseView];
  [v3 analysisDidUpdateForTypes:*(void *)(a1 + 32)];

  if ((*(unsigned char *)(a1 + 32) & 0x10) != 0)
  {
    id v4 = [v28 analysis];
    double v5 = [v28 visualSearchCornerButtonView];
    [v5 setAnalysis:v4];

    uint64_t v6 = [v28 analysis];
    id v7 = [v28 actionInfoCornerButtonViewIfExists];
    [v7 setAnalysis:v6];

    id v8 = [v28 baseView];
    [v8 normalizedVisibleRect];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    v17 = [v28 visualSearchCornerButtonView];
    objc_msgSend(v17, "setNormalizedVisibleRect:", v10, v12, v14, v16);

    v18 = [v28 baseView];
    [v18 normalizedVisibleRect];
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;
    v27 = [v28 actionInfoCornerButtonViewIfExists];
    objc_msgSend(v27, "setNormalizedVisibleRect:", v20, v22, v24, v26);
  }
}

- (id)previewForDataDetectorElementView:(id)a3
{
  id v4 = [(VKCImageAnalysisInteraction *)self baseView];
  double v5 = [(VKCImageAnalysisInteraction *)self viewForImageSnapshotForBaseView:v4];

  return v5;
}

- (BOOL)topLevelImplementsContentsRectDelegateForBaseView:(id)a3
{
  BOOL v3 = [(VKCImageAnalysisInteraction *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  return v4 & 1;
}

- (id)viewForImageSnapshotForBaseView:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    id v8 = [v7 contentViewForImageAnalysisInteraction:self];
  }
  else
  {
    id v8 = [(VKCImageAnalysisInteraction *)self view];
  }
  return v8;
}

- (id)imageForImageSnapshotForBaseView:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    id v8 = [v7 contentImageForImageAnalysisInteraction:self];
  }
  else
  {
    id v8 = 0;
  }
  return v8;
}

- (CGRect)contentsRectForImageRecognitionBaseView:(id)a3
{
  char v4 = [(VKCImageAnalysisInteraction *)self delegate];
  [v4 contentsRectForImageAnalysisInteraction:self];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.double y = v14;
  result.origin.double x = v13;
  return result;
}

- (BOOL)baseOverlayView:(id)a3 shouldBeginInteractionAtPoint:(CGPoint)a4 withTypes:(unint64_t)a5
{
  double y = a4.y;
  double x = a4.x;
  unint64_t v9 = [(VKCImageAnalysisInteraction *)self activeInteractionTypes] & a5;
  if (a5 & 2) != 0 && ([(VKCImageAnalysisInteraction *)self activeInteractionTypes])
  {
    if ([(VKCImageAnalysisInteraction *)self allowLongPressForDataDetectorsInTextMode]|| v9)
    {
      goto LABEL_4;
    }
    return 0;
  }
  if (!v9) {
    return 0;
  }
LABEL_4:
  double v10 = [(VKCImageAnalysisInteraction *)self delegate];
  char v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) == 0) {
    return 1;
  }
  double v12 = [(VKCImageAnalysisInteraction *)self delegate];
  char v13 = objc_msgSend(v12, "imageAnalysisInteraction:shouldBeginAtPoint:forAnalysisType:", self, a5, x, y);

  return v13;
}

- (void)textSelectionDidChangeForBaseOverlayView:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    [v7 textSelectionDidChangeForImageAnalysisInteraction:self];
  }
}

- (void)baseOverlayViewSubjectInteractionInProgressDidChange:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    [v7 imageAnalysisInteractionSubjectInteractionInProgressDidChange:self];
  }
}

- (void)baseOverlayView:(id)a3 analyticsEventDidOccur:(id)a4
{
  id v6 = a4;
  [(VKCImageAnalysisInteraction *)self updateForAnalyticsVisualSearchEventIfNecessary:v6];
  double v5 = [(VKCImageAnalysisInteraction *)self _analyticsDelegate];
  [v5 _visionKitAnalyticsEventDidOccur:v6 interaction:self];

  [(VKCImageAnalysisInteraction *)self addEventToAnalyticsSession:v6];
}

- (void)visualSearchCornerView:(id)a3 analyticsEventDidOccur:(id)a4
{
  id v6 = a4;
  [(VKCImageAnalysisInteraction *)self updateForAnalyticsVisualSearchEventIfNecessary:v6];
  double v5 = [(VKCImageAnalysisInteraction *)self _analyticsDelegate];
  [v5 _visionKitAnalyticsEventDidOccur:v6 interaction:self];

  [(VKCImageAnalysisInteraction *)self addEventToAnalyticsSession:v6];
}

- (void)updateForAnalyticsVisualSearchEventIfNecessary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  double v10 = VKDynamicCast(v5, (uint64_t)v4);

  id v6 = v10;
  if (v10)
  {
    uint64_t v7 = [v10 eventType];
    if (v7 == 2)
    {
      double v8 = self;
      uint64_t v9 = 1;
    }
    else
    {
      if (v7 == 1)
      {
        objc_msgSend(v10, "setDidInteractWithResultItem:", -[VKCImageAnalysisInteraction didInteractWithVisualSearchItem](self, "didInteractWithVisualSearchItem"));
        goto LABEL_9;
      }
      id v6 = v10;
      if (v7) {
        goto LABEL_10;
      }
      double v8 = self;
      uint64_t v9 = 0;
    }
    [(VKCImageAnalysisInteraction *)v8 setDidInteractWithVisualSearchItem:v9];
LABEL_9:
    id v6 = v10;
  }
LABEL_10:
}

- (id)baseOverlayView:(id)a3 updateStringForCopy:(id)a4
{
  id v5 = a4;
  id v6 = [(VKCImageAnalysisInteraction *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  double v8 = v5;
  if (v7)
  {
    uint64_t v9 = [(VKCImageAnalysisInteraction *)self delegate];
    double v8 = [v9 imageAnalysisInteraction:self updateStringForCopy:v5];
  }
  return v8;
}

- (id)baseOverlayView:(id)a3 updateAttributedStringForCopy:(id)a4
{
  id v5 = a4;
  id v6 = [(VKCImageAnalysisInteraction *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  double v8 = v5;
  if (v7)
  {
    uint64_t v9 = [(VKCImageAnalysisInteraction *)self delegate];
    double v8 = [v9 imageAnalysisInteraction:self updateAttributedStringForCopy:v5];
  }
  return v8;
}

- (BOOL)baseOverlayView:(id)a3 shouldHandleShareWithRanges:(id)a4 boundingRect:(CGRect)a5 selectedText:(id)a6 selectedAttributedText:(id)a7
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  v17 = [(VKCImageAnalysisInteraction *)self delegate];
  char v18 = objc_opt_respondsToSelector();

  if (v18)
  {
    double v19 = [(VKCImageAnalysisInteraction *)self delegate];
    char v20 = objc_msgSend(v19, "imageAnalysisInteraction:shouldHandleShareWithRanges:boundingRect:selectedText:selectedAttributedText:", self, v14, v15, v16, x, y, width, height);
  }
  else
  {
    char v20 = 1;
  }

  return v20;
}

- (void)baseOverlayView:(id)a3 didTapVisualSearchIndicatorWithNormalizedBoundingBox:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v9 = [(VKCImageAnalysisInteraction *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    id v11 = [(VKCImageAnalysisInteraction *)self delegate];
    objc_msgSend(v11, "imageAnalysisInteraction:didTapVisualSearchIndicatorWithNormalizedBoundingBox:", self, x, y, width, height);
  }
}

- (void)baseOverlayView:(id)a3 didUpdateToNormalizedVisibleRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v9 = [(VKCImageAnalysisInteraction *)self visualSearchCornerButtonView];
  objc_msgSend(v9, "setNormalizedVisibleRect:", x, y, width, height);

  char v10 = [(VKCImageAnalysisInteraction *)self actionInfoCornerButtonViewIfExists];
  objc_msgSend(v10, "setNormalizedVisibleRect:", x, y, width, height);

  if (![(VKCImageAnalysisInteraction *)self isUpdatingActiveTypes])
  {
    [(VKCImageAnalysisInteraction *)self configureForCurrentDerivedAutomaticStateWithUpdateActiveTypes:0];
  }
}

- (void)baseOverlayView:(id)a3 didFinishTransitionToNormalizedVisibleRect:(CGRect)a4
{
  if (![(VKCImageAnalysisInteraction *)self didToggleAAButton])
  {
    [(VKCImageAnalysisInteraction *)self configureForCurrentDerivedAutomaticStateWithUpdateActiveTypes:0];
  }
}

- (void)baseOverlayView:(id)a3 prepareForCalloutAction:(SEL)a4 completion:(id)a5
{
  char v10 = (void (**)(void))a5;
  char v7 = [(VKCImageAnalysisInteraction *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    uint64_t v9 = [(VKCImageAnalysisInteraction *)self delegate];
    [v9 imageAnalysisInteraction:self prepareForCalloutAction:a4 competion:v10];
  }
  else
  {
    v10[2]();
  }
}

- (BOOL)isBaseOverlayViewShowingLivePhoto:(id)a3 delegateHasImplementation:(BOOL *)a4
{
  id v6 = [(VKCImageAnalysisInteraction *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) == 0) {
    return 0;
  }
  *a4 = 1;
  char v8 = [(VKCImageAnalysisInteraction *)self delegate];
  char v9 = [v8 isShowingLivePhotoForImageAnalysisInteraction:self];

  return v9;
}

- (void)baseOverlayView:(id)a3 livePhotoShouldPlay:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(VKCImageAnalysisInteraction *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(VKCImageAnalysisInteraction *)self delegate];
    [v8 imageAnalysisInteraction:self livePhotoShouldPlay:v4];
  }
}

- (BOOL)baseOverlayView:(id)a3 shouldShowLookupForItemFromCallout:(id)a4
{
  id v5 = a4;
  id v6 = [(VKCImageAnalysisInteraction *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(VKCImageAnalysisInteraction *)self delegate];
    char v9 = [v8 imageAnalysisInteraction:self shouldShowLookupForItemFromCallout:v5];
  }
  else
  {
    char v9 = 1;
  }

  return v9;
}

- (void)baseOverlayViewDidCompleteSubjectAnalysis:(id)a3
{
  BOOL v4 = [(VKCImageAnalysisInteraction *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(VKCImageAnalysisInteraction *)self delegate];
    [v6 imageAnalysisInteractionDidCompleteSubjectAnalysis:self];
  }
}

- (void)baseOverlayViewDidBeginSubjectAnalysis:(id)a3
{
  BOOL v4 = [(VKCImageAnalysisInteraction *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(VKCImageAnalysisInteraction *)self delegate];
    [v6 imageAnalysisInteractionDidBeginSubjectAnalysis:self];
  }
}

- (void)hasActiveTextSelectionDidChangeForBaseOverlayView:(id)a3
{
  BOOL v4 = [(VKCImageAnalysisInteraction *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(VKCImageAnalysisInteraction *)self delegate];
    [v6 hasActiveTextSelectionDidChangeForImageAnalysisInteraction:self];
  }
}

- (void)baseOverlayViewDidRequestButtonStateUpdate:(id)a3
{
  id v7 = a3;
  [(VKCImageAnalysisInteraction *)self configureForCurrentDerivedAutomaticStateWithUpdateActiveTypes:1];
  BOOL v4 = [(VKCImageAnalysisInteraction *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(VKCImageAnalysisInteraction *)self delegate];
    objc_msgSend(v6, "imageAnalysisInteraction:didRequestLiveTextButtonSelectedState:", self, objc_msgSend(v7, "highlightSelectableItems"));
  }
}

- (void)highlightSelectableItemsDidChangeForBaseOverlayView:(id)a3
{
  BOOL v4 = [(VKCImageAnalysisInteraction *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(VKCImageAnalysisInteraction *)self delegate];
    objc_msgSend(v6, "imageAnalysisInteraction:highlightSelectedItemsValueDidChange:", self, -[VKCImageAnalysisInteraction highlightSelectableItems](self, "highlightSelectableItems"));
  }
}

- (void)visualSearchCornerView:(id)a3 didTapVisualSearchIndicatorWithNormalizedBoundingBox:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  char v9 = [(VKCImageAnalysisInteraction *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    id v11 = [(VKCImageAnalysisInteraction *)self delegate];
    objc_msgSend(v11, "imageAnalysisInteraction:didTapVisualSearchIndicatorWithNormalizedBoundingBox:", self, x, y, width, height);
  }
}

- (void)baseOverlayViewDismissVisualSearchController:(id)a3
{
  BOOL v4 = [(VKCImageAnalysisInteraction *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(VKCImageAnalysisInteraction *)self delegate];
    [v6 imageAnalysisInteractionDidDismissVisualSearchController:self];
  }
}

- (void)visualSearchCornerViewDidDismissVisualSearchController:(id)a3
{
  BOOL v4 = [(VKCImageAnalysisInteraction *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(VKCImageAnalysisInteraction *)self delegate];
    [v6 imageAnalysisInteractionDidDismissVisualSearchController:self];
  }
}

- (void)generateVisualSearchResultForItems:(id)a3 queryID:(unint64_t)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  char v10 = +[VKImageAnalyzerMadInterface sharedInterface];
  id v11 = [(VKImageAnalysis *)self->_analysis imageAnalysisResult];
  double v12 = [v11 request];
  analysis = self->_analysis;
  id v14 = [(VKImageAnalysis *)analysis imageAnalysisResult];
  id v15 = [v14 visualSearchResult];
  id v16 = [v15 payload];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __92__VKCImageAnalysisInteraction_generateVisualSearchResultForItems_queryID_completionHandler___block_invoke;
  v18[3] = &unk_1E6BF20F0;
  id v19 = v8;
  id v17 = v8;
  [v10 generateVisualSearchResultForRequest:v12 analysis:analysis items:v9 payload:v16 queryID:a4 completionHandler:v18];
}

void __92__VKCImageAnalysisInteraction_generateVisualSearchResultForItems_queryID_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(VKCVisualSearchResult);
  [(VKCVisualSearchResult *)v8 setSearchResult:v7];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)generateTextualVisualSearchResultForQueryInfo:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[VKImageAnalyzerMadInterface sharedInterface];
  id v9 = [(VKCImageAnalysisInteraction *)self analysis];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __95__VKCImageAnalysisInteraction_generateTextualVisualSearchResultForQueryInfo_completionHandler___block_invoke;
  v11[3] = &unk_1E6BF15E0;
  id v12 = v6;
  id v10 = v6;
  [v8 generateTextualVisualSearchResultForAnalysis:v9 queryInfo:v7 completionHandler:v11];
}

uint64_t __95__VKCImageAnalysisInteraction_generateTextualVisualSearchResultForQueryInfo_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)submitVisualSearchUserFeedbackForReportIdentifier:(id)a3 userFeedbackPayload:(id)a4 sfReportData:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v13 = +[VKImageAnalyzerMadInterface sharedInterface];
  id v11 = [(VKImageAnalysis *)self->_analysis imageAnalysisResult];
  id v12 = [v11 request];
  [v13 submitVisualIntelligenceUserFeedbackForRequest:v12 reportIdentifier:v10 userFeedbackPayload:v9 sfReportData:v8];
}

- (void)addMetadataToVSFeedbackItem:(id)a3
{
  id v4 = a3;
  id v5 = [(VKCImageAnalysisInteraction *)self baseView];
  [v5 addMetadataToVSFeedbackItem:v4];
}

- (id)presentingViewControllerForImageAnalysisInteraction
{
  BOOL v3 = [(VKCImageAnalysisInteraction *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(VKCImageAnalysisInteraction *)self delegate];
    id v6 = [v5 presentingViewControllerForImageAnalysisInteraction:self];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (void)videoPreviewAvailableForBaseOverlayView:(id)a3
{
  char v4 = [(VKCImageAnalysisInteraction *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(VKCImageAnalysisInteraction *)self delegate];
    [v6 videoPreviewAvailableForImageAnalysisInteraction:self];
  }
}

- (void)quickActionProcessingCompleteForBaseOverlayView:(id)a3
{
  char v4 = [(VKCImageAnalysisInteraction *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(VKCImageAnalysisInteraction *)self delegate];
    [v6 quickActionProcessingCompleteForImageAnalysisInteraction:self];
  }
}

- (id)_filteredNormalizedRectangleQuads
{
  id v2 = [(VKCImageAnalysisInteraction *)self baseView];
  BOOL v3 = [v2 filteredNormalizedRectangleQuads];

  return v3;
}

- (id)_filteredRectangleQuads
{
  id v2 = [(VKCImageAnalysisInteraction *)self baseView];
  BOOL v3 = [v2 filteredRectangleQuads];

  return v3;
}

- (id)_rawRectangleObservations
{
  id v2 = [(VKCImageAnalysisInteraction *)self baseView];
  BOOL v3 = [v2 rawRectangleObservations];

  return v3;
}

- (void)_highlightRectangleObservations
{
  [(VKCImageAnalysisInteraction *)self contentsRect];
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  id v11 = [(VKCImageAnalysisInteraction *)self view];
  id v12 = [(VKCImageAnalysisInteraction *)self baseView];
  id v13 = [v12 rawRectangleObservations];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __62__VKCImageAnalysisInteraction__highlightRectangleObservations__block_invoke;
  v15[3] = &unk_1E6BF2118;
  uint64_t v18 = v4;
  uint64_t v19 = v6;
  uint64_t v20 = v8;
  uint64_t v21 = v10;
  id v16 = v11;
  id v17 = self;
  id v14 = v11;
  [v13 enumerateObjectsUsingBlock:v15];
}

void __62__VKCImageAnalysisInteraction__highlightRectangleObservations__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 vkQuad];
  objc_msgSend(v3, "quadByConvertingFromNormalizedRectToView:contentsRect:", *(void *)(a1 + 32), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v4 = [*(id *)(a1 + 40) view];
  id v5 = (id)objc_msgSend(v4, "vk_autoFadeOutLayerWithQuad:", v6);
}

- (void)_highlightFilteredRectangleQuads
{
  uint64_t v3 = [(VKCImageAnalysisInteraction *)self view];
  uint64_t v4 = [(VKCImageAnalysisInteraction *)self _filteredRectangleQuads];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__VKCImageAnalysisInteraction__highlightFilteredRectangleQuads__block_invoke;
  v6[3] = &unk_1E6BF1190;
  id v7 = v3;
  id v5 = v3;
  [v4 enumerateObjectsUsingBlock:v6];
}

id __63__VKCImageAnalysisInteraction__highlightFilteredRectangleQuads__block_invoke(uint64_t a1, uint64_t a2)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "vk_autoFadeOutLayerWithQuad:", a2);
}

- (void)highlightMatchesForString:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v9[1] = *MEMORY[0x1E4F143B8];
  id v6 = &stru_1F35566F8;
  if (a3) {
    id v6 = (__CFString *)a3;
  }
  id v7 = v6;
  v9[0] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];

  [(VKCImageAnalysisInteraction *)self highlightMatchesForStrings:v8 animated:v4];
}

- (void)highlightMatchesForStrings:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  if ([v8 count])
  {
    id v6 = [v8 componentsJoinedByString:@" "];
    id v7 = [(VKCImageAnalysisInteraction *)self baseView];
    [v7 highlightMatchesWithString:v6 animated:1];

    [(VKCImageAnalysisInteraction *)self sendAnalyticsEventWithType:3 source:0 analysisButtonActive:0];
  }
  else
  {
    id v6 = [(VKCImageAnalysisInteraction *)self baseView];
    [v6 clearStringHighlightsAnimated:v4];
  }
}

- (void)clearMatchedHighlightsIfNecessaryAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(VKCImageAnalysisInteraction *)self baseView];
  [v4 clearStringHighlightsAnimated:v3];
}

- (void)triggerTapToRadar:(id)a3
{
  if ([a3 state] == 3)
  {
    [(VKCImageAnalysisInteraction *)self _provideFeedback];
  }
}

- (UIActivity)feedbackActivity
{
  if (vk_isInternalBuild())
  {
    objc_initWeak(&location, self);
    BOOL v3 = [VKBlockUIActivity alloc];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __47__VKCImageAnalysisInteraction_feedbackActivity__block_invoke;
    v6[3] = &unk_1E6BF0D90;
    objc_copyWeak(&v7, &location);
    id v4 = [(VKBlockUIActivity *)v3 initWithTitle:@"Provide Scarlett Feedback" systemImageName:@"ant.fill" block:v6];
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
  else
  {
    id v4 = 0;
  }
  return (UIActivity *)v4;
}

void __47__VKCImageAnalysisInteraction_feedbackActivity__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _provideFeedback];
}

- (void)_provideFeedback
{
  BOOL v3 = [(VKCImageAnalysisInteraction *)self analysis];
  id v4 = [v3 feedbackProvider];

  if (v4)
  {
    id v5 = [(VKCImageAnalysisInteraction *)self delegate];
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (objc_opt_respondsToSelector()) {
      uint64_t v7 = [v5 feedbackTypeForImageAnalysisInteraction:self];
    }
    else {
      uint64_t v7 = 0;
    }
    if (objc_opt_respondsToSelector()) {
      uint64_t v8 = [v5 feedbackOptionsForImageAnalysisInteraction:self];
    }
    else {
      uint64_t v8 = -1;
    }
    if (objc_opt_respondsToSelector())
    {
      uint64_t v9 = [v5 feedbackMetadataForImageAnalysisInteraction:self];
    }
    else
    {
      uint64_t v9 = 0;
    }
    if (objc_opt_respondsToSelector())
    {
      uint64_t v10 = [v5 promisedFeedbackAttachementsForImageAnalysisInteraction:self];
      [v6 addObjectsFromArray:v10];
    }
    id v11 = [(VKCImageAnalysisInteraction *)self analysis];
    [v4 setImageAnalysis:v11];

    objc_initWeak(&location, self);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __47__VKCImageAnalysisInteraction__provideFeedback__block_invoke;
    v13[3] = &unk_1E6BF2140;
    id v12 = v5;
    id v14 = v12;
    objc_copyWeak(&v15, &location);
    [v4 provideFeedbackWithType:v7 options:v8 metadata:v9 promisedAttachments:v6 userResponseHandler:v13];
    objc_destroyWeak(&v15);

    objc_destroyWeak(&location);
  }
}

void __47__VKCImageAnalysisInteraction__provideFeedback__block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2 & 1) == 0 && (objc_opt_respondsToSelector())
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * v10);
          id v12 = *(void **)(a1 + 32);
          id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
          objc_msgSend(v12, "writeFeedbackAttachementForImageAnalysisInteraction:to:", WeakRetained, v11, (void)v14);

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }
  }
}

- (id)presentingViewControllerForFeedbackProvider
{
  BOOL v3 = [(VKCImageAnalysisInteraction *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(VKCImageAnalysisInteraction *)self delegate];
    id v6 = [v5 presentingViewControllerForImageAnalysisInteraction:self];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (void)scrollViewDidZoomToUnitRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v8 = [(VKCImageAnalysisInteraction *)self baseView];
  objc_msgSend(v8, "scrollViewDidZoomToUnitRect:", x, y, width, height);

  uint64_t v9 = [(VKCImageAnalysisInteraction *)self visualSearchCornerButtonView];
  objc_msgSend(v9, "setNormalizedVisibleRect:", x, y, width, height);

  id v10 = [(VKCImageAnalysisInteraction *)self actionInfoCornerButtonViewIfExists];
  objc_msgSend(v10, "setNormalizedVisibleRect:", x, y, width, height);
}

- (VKImageAnalysisBarButtonItem)analysisBarButtonItem
{
  analysisBarButtonItem = self->_analysisBarButtonItem;
  if (!analysisBarButtonItem)
  {
    char v4 = +[VKImageAnalysisBarButtonItem analysisButtonWithTarget:self action:sel_aAAnalysisButtonPressed_ mode:0];
    id v5 = self->_analysisBarButtonItem;
    self->_analysisBarButtonItem = v4;

    [(VKCImageAnalysisInteraction *)self configureForCurrentDerivedAutomaticStateWithUpdateActiveTypes:0];
    analysisBarButtonItem = self->_analysisBarButtonItem;
  }
  return analysisBarButtonItem;
}

- (VKImageAnalysisButton)analysisButton
{
  analysisButton = self->_analysisButton;
  if (!analysisButton)
  {
    char v4 = [(VKCImageAnalysisInteraction *)self createAnalysisButton];
    id v5 = self->_analysisButton;
    self->_analysisButton = v4;

    [(VKCImageAnalysisInteraction *)self configureForCurrentDerivedAutomaticStateWithUpdateActiveTypes:0];
    analysisButton = self->_analysisButton;
  }
  return analysisButton;
}

- (VKImageAnalysisButton)actionInfoAnalysisButtonIfExists
{
  return self->_actionInfoAnalysisButton;
}

- (VKImageAnalysisButton)actionInfoAnalysisButton
{
  actionInfoAnalysisButton = self->_actionInfoAnalysisButton;
  if (!actionInfoAnalysisButton)
  {
    char v4 = [(VKCImageAnalysisInteraction *)self createAnalysisButton];
    id v5 = self->_actionInfoAnalysisButton;
    self->_actionInfoAnalysisButton = v4;

    [(VKCImageAnalysisInteraction *)self configureForCurrentDerivedAutomaticStateWithUpdateActiveTypes:0];
    actionInfoAnalysisButton = self->_actionInfoAnalysisButton;
  }
  return actionInfoAnalysisButton;
}

- (id)createAnalysisButton
{
  BOOL v3 = +[VKImageAnalysisButton buttonWithType:1];
  [v3 addTarget:self action:sel_aAAnalysisButtonPressed_ forControlEvents:64];
  [v3 setFunction:2];
  [v3 setGlyphConfiguration:1];
  [v3 setMode:1];
  [v3 setSupportsDynamicType:1];
  char v4 = [MEMORY[0x1E4F428B8] systemBlueColor];
  [v3 setTintColor:v4];

  [v3 setAlpha:0.0];
  return v3;
}

- (void)setAnalysisButtonPrefersDarkGlyphWhenSelected:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = [(VKCImageAnalysisInteraction *)self analysisButton];
  uint64_t v7 = VKCheckedDynamicCast(v5, (uint64_t)v6);
  [v7 setPrefersDarkGlyphWhenSelected:v3];

  id v8 = [(VKCImageAnalysisInteraction *)self actionInfoAnalysisButtonIfExists];
  [v8 setPrefersDarkGlyphWhenSelected:v3];
}

- (BOOL)analysisButtonPrefersDarkGlyphWhenSelected
{
  uint64_t v3 = objc_opt_class();
  char v4 = [(VKCImageAnalysisInteraction *)self analysisButton];
  uint64_t v5 = VKCheckedDynamicCast(v3, (uint64_t)v4);
  char v6 = [v5 prefersDarkGlyphWhenSelected];

  return v6;
}

- (void)aAAnalysisButtonPressed:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  char v4 = (VKImageAnalysisButton *)a3;
  uint64_t v5 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.interaction");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = self;
    _os_log_impl(&dword_1DB266000, v5, OS_LOG_TYPE_DEFAULT, "Live Text Button Pressed: %@", (uint8_t *)&v11, 0xCu);
  }

  unint64_t v6 = [(VKCImageAnalysisInteraction *)self deriveCurrentAutomaticState];
  if ([(VKCImageAnalysisInteraction *)self _isPublicAPI]
    && ![(VKCImageAnalysisInteraction *)self _isInPublicAutomaticMode])
  {
    if ([(VKCImageAnalysisInteraction *)self _isPublicAPI])
    {
      unint64_t v7 = v6 - 1;
      if (v6 - 1 < 4)
      {
        id v8 = &unk_1DB33EA00;
        goto LABEL_11;
      }
    }
  }
  else
  {
    unint64_t v7 = v6 - 1;
    if (v6 - 1 < 6 && ((0x27u >> v7) & 1) != 0)
    {
      id v8 = &unk_1DB33E9D0;
LABEL_11:
      unint64_t v6 = v8[v7];
    }
  }
  [(VKCImageAnalysisInteraction *)self setDidToggleAAButton:1];
  [(VKCImageAnalysisInteraction *)self configureButtonsForState:v6 updateActiveTypes:1];
  [(VKCImageAnalysisInteraction *)self sendAAButtonPressedDelegateCallbackIfNecessaryForSender:v4];
  if (self->_analysisButton == v4)
  {
    uint64_t v10 = 4;
  }
  else
  {
    uint64_t v9 = [(VKCImageAnalysisInteraction *)self actionInfoAnalysisButtonIfExists];
    if (v9 == v4) {
      uint64_t v10 = 4;
    }
    else {
      uint64_t v10 = 5;
    }
  }
  [(VKCImageAnalysisInteraction *)self sendAnalyticsEventWithType:0 source:v10 analysisButtonActive:[(VKCImageAnalysisInteraction *)self _highlightSelectableItems]];
}

- (void)sendAAButtonPressedDelegateCallbackIfNecessaryForSender:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  VKCheckedDynamicCast(v5, (uint64_t)v4);
  long long v15 = (VKImageAnalysisButton *)objc_claimAutoreleasedReturnValue();

  if (v15 == self->_analysisButton
    || ([(VKCImageAnalysisInteraction *)self actionInfoAnalysisButtonIfExists],
        unint64_t v6 = (VKImageAnalysisButton *)objc_claimAutoreleasedReturnValue(),
        v6,
        v15 == v6))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v14 = objc_opt_respondsToSelector();

    if ((v14 & 1) == 0) {
      goto LABEL_10;
    }
    id v12 = objc_loadWeakRetained((id *)&self->_delegate);
    [v12 imageAnalysisInteraction:self imageAnalysisButtonPressed:v15];
    goto LABEL_9;
  }
  analysisBarButtonItem = self->_analysisBarButtonItem;
  if (analysisBarButtonItem)
  {
    id v8 = [(VKImageAnalysisBarButtonItem *)analysisBarButtonItem customView];
    int v9 = [(VKImageAnalysisButton *)v15 isDescendantOfView:v8];

    if (v9)
    {
      id v10 = objc_loadWeakRetained((id *)&self->_delegate);
      char v11 = objc_opt_respondsToSelector();

      if (v11)
      {
        id v12 = objc_loadWeakRetained((id *)&self->_delegate);
        [v12 imageAnalysisInteraction:self imageAnalysisBarItemPressed:self->_analysisBarButtonItem];
LABEL_9:
      }
    }
  }
LABEL_10:
}

- (VKCVisualSearchCornerView)actionInfoCornerButtonViewIfExists
{
  return self->_actionInfoCornerButtonView;
}

- (VKCVisualSearchCornerView)actionInfoCornerButtonView
{
  actionInfoCornerButtonView = self->_actionInfoCornerButtonView;
  if (!actionInfoCornerButtonView)
  {
    id v4 = objc_alloc_init(VKCVisualSearchCornerView);
    uint64_t v5 = self->_actionInfoCornerButtonView;
    self->_actionInfoCornerButtonView = v4;

    unint64_t v6 = [(VKCImageAnalysisInteraction *)self _customAnalyticsIdentifier];
    [(VKCVisualSearchCornerView *)self->_actionInfoCornerButtonView set_customAnalyticsIdentifier:v6];

    unint64_t v7 = [(VKCImageAnalysisInteraction *)self analysis];
    [(VKCVisualSearchCornerView *)self->_actionInfoCornerButtonView setAnalysis:v7];

    [(VKCVisualSearchCornerView *)self->_actionInfoCornerButtonView setDelegate:self];
    id v8 = [(VKCImageAnalysisInteraction *)self _customAnalyticsIdentifier];
    [(VKCVisualSearchCornerView *)self->_actionInfoCornerButtonView set_customAnalyticsIdentifier:v8];

    int v9 = [(VKCImageAnalysisInteraction *)self baseView];
    [v9 normalizedVisibleRect];
    -[VKCVisualSearchCornerView setNormalizedVisibleRect:](self->_actionInfoCornerButtonView, "setNormalizedVisibleRect:");

    [(VKCVisualSearchCornerView *)self->_actionInfoCornerButtonView setHidden:([(VKCImageAnalysisInteraction *)self activeInteractionTypes] & 4) == 0];
    id v10 = [(VKCImageAnalysisInteraction *)self baseView];
    [v10 setDidAddVisualSearchCornerView:1];

    actionInfoCornerButtonView = self->_actionInfoCornerButtonView;
  }
  return actionInfoCornerButtonView;
}

- (void)set_manuallyManagesActionInfoButtons:(BOOL)a3
{
  self->__manuallyManagesActionInfoButtons = a3;
  if (a3)
  {
    id v5 = [(VKCImageAnalysisInteraction *)self actionInfoView];
    [v5 setQuickActions:MEMORY[0x1E4F1CBF0]];
  }
  else
  {
    id v5 = [(VKCImageAnalysisInteraction *)self actionButtons];
    id v4 = [(VKCImageAnalysisInteraction *)self actionInfoView];
    [v4 setQuickActions:v5];
  }
}

- (id)actionInfoViewIfExists
{
  return self->_actionInfoView;
}

- (VKCActionInfoView)actionInfoView
{
  actionInfoView = self->_actionInfoView;
  if (!actionInfoView)
  {
    id v4 = [VKCActionInfoView alloc];
    id v5 = [(VKCImageAnalysisInteraction *)self actionInfoAnalysisButton];
    uint64_t v6 = objc_opt_class();
    unint64_t v7 = [(VKCImageAnalysisInteraction *)self actionInfoCornerButtonView];
    id v8 = VKCheckedDynamicCast(v6, (uint64_t)v7);
    int v9 = [(VKCActionInfoView *)v4 initWithLiveTextButton:v5 cornerView:v8];
    id v10 = self->_actionInfoView;
    self->_actionInfoView = v9;

    [(VKCImageAnalysisInteraction *)self preferredQuickActionButtonHeight];
    -[VKCActionInfoView setPreferredQuickActionButtonHeight:](self->_actionInfoView, "setPreferredQuickActionButtonHeight:");
    char v11 = [(VKCImageAnalysisInteraction *)self quickActionConfigurationUpdateHandler];
    [(VKCActionInfoView *)self->_actionInfoView setQuickActionConfigurationUpdateHandler:v11];

    id v12 = self->_actionInfoView;
    uint64_t v13 = [(VKCImageAnalysisInteraction *)self baseView];
    [v13 setActionInfoView:v12];

    char v14 = [(VKCImageAnalysisInteraction *)self baseView];
    long long v15 = [v14 quickActions];
    actionButtons = self->_actionButtons;
    self->_actionButtons = v15;

    if (!self->__manuallyManagesActionInfoButtons) {
      [(VKCActionInfoView *)self->_actionInfoView setQuickActions:self->_actionButtons];
    }
    [(VKCActionInfoView *)self->_actionInfoView setWantsTranslucentActionInfoButtons:[(VKCImageAnalysisInteraction *)self wantsTranslucentActionInfoButtons]];
    [(VKCActionInfoView *)self->_actionInfoView set_quickActionsHidden:1];
    [(VKCActionInfoView *)self->_actionInfoView setHidden:[(VKCImageAnalysisInteraction *)self actionInfoViewHidden]];
    actionInfoView = self->_actionInfoView;
  }
  return actionInfoView;
}

- (void)configureForCurrentDerivedAutomaticStateWithUpdateActiveTypes:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = [(VKCImageAnalysisInteraction *)self deriveCurrentAutomaticState];
  [(VKCImageAnalysisInteraction *)self configureButtonsForState:v5 updateActiveTypes:v3];
}

- (unint64_t)deriveCurrentAutomaticState
{
  BOOL v3 = [(VKCImageAnalysisInteraction *)self _isPublicAPI];
  BOOL v4 = [(VKCImageAnalysisInteraction *)self _isInPublicAutomaticMode];
  BOOL v5 = [(VKCImageAnalysisInteraction *)self _highlightSelectableItems];
  uint64_t v6 = [(VKCImageAnalysisInteraction *)self analysis];
  unint64_t v7 = [(VKCImageAnalysisInteraction *)self activeInteractionTypes];
  unint64_t v8 = 0;
  if (v6 && v7)
  {
    if (!v3 || v4)
    {
      if ((v7 & 4) != 0)
      {
        unint64_t v8 = 6;
      }
      else
      {
        unint64_t v8 = 2;
        if ((!v3 || !v4 || !v5) && (v3 || !v5))
        {
          if (v7 == 3) {
            unint64_t v8 = 1;
          }
          else {
            unint64_t v8 = ((uint64_t)(v7 << 63) >> 63) & 3;
          }
        }
      }
    }
    else
    {
      unint64_t v9 = v7 & 0xFFFFFFFFFFFFFFF7;
      uint64_t v10 = 5;
      uint64_t v11 = 3;
      if (v5) {
        uint64_t v11 = 4;
      }
      uint64_t v12 = ((uint64_t)(v7 << 61) >> 63) & 6;
      uint64_t v13 = 1;
      if (v5) {
        uint64_t v13 = 2;
      }
      if (v9 == 3) {
        uint64_t v12 = v13;
      }
      if (v9 != 2) {
        uint64_t v10 = v12;
      }
      if (v9 == 1) {
        unint64_t v8 = v11;
      }
      else {
        unint64_t v8 = v10;
      }
    }
  }

  return v8;
}

- (void)configureButtonsForState:(unint64_t)a3 updateActiveTypes:(BOOL)a4
{
  BOOL v43 = a4;
  uint64_t v6 = [(VKCImageAnalysisInteraction *)self analysis];
  v40 = self->_analysisButton;
  unint64_t v7 = [(VKCImageAnalysisInteraction *)self actionInfoAnalysisButtonIfExists];
  v41 = self->_analysisBarButtonItem;
  v42 = [(VKCImageAnalysisInteraction *)self visualSearchCornerButtonView];
  unint64_t v8 = [(VKCImageAnalysisInteraction *)self actionInfoCornerButtonViewIfExists];
  int v9 = [v6 hasResultsForAnalysisTypes:2];
  int v10 = [v6 hasResultsForAnalysisTypes:1];
  v44 = v6;
  int v11 = v9 | [v6 hasResultsForAnalysisTypes:4];
  uint64_t v12 = [(VKCImageAnalysisInteraction *)self baseView];
  uint64_t v13 = v12;
  if (v12)
  {
    [v12 visibleTextAreaInfo];
    double v14 = *(double *)&v62 * 100.0;
  }
  else
  {
    uint64_t v64 = 0;
    long long v62 = 0u;
    long long v63 = 0u;
    double v14 = 0.0;
  }
  int v15 = v10 | v11;

  +[VKCInternalSettings visibleTextAreaButtonThreshold];
  if (v14 >= v16)
  {
    int v17 = 1;
  }
  else
  {
    int v17 = [(VKCImageAnalysisInteraction *)self didToggleAAButton] | v11;
    if ((v17 & 1) == 0 && ((v15 ^ 1) & 1) == 0) {
      int v17 = ![(VKCImageAnalysisInteraction *)self analysisButtonRequiresVisibleContentGating];
    }
  }
  if (([(VKCImageAnalysisInteraction *)self interactionTypesSetByClient] & 8) != 0)
  {
    if ([(VKCImageAnalysisInteraction *)self _isPublicAPI]) {
      BOOL v18 = [(VKCImageAnalysisInteraction *)self _isInPublicAutomaticMode];
    }
    else {
      BOOL v18 = 1;
    }
  }
  else
  {
    BOOL v18 = 0;
  }
  int v19 = 0;
  double v20 = 0.0;
  switch(a3)
  {
    case 0uLL:
      unint64_t v39 = 0;
      uint64_t v37 = 0;
      int v19 = 0;
      char v21 = 0;
      char v22 = 0;
      uint64_t v23 = 0;
      break;
    case 1uLL:
      goto LABEL_18;
    case 2uLL:
      BOOL v18 = 0;
      int v19 = 1;
LABEL_18:
      int v24 = 0;
      uint64_t v23 = 0;
      char v21 = v19;
      int v25 = v15 & v17;
      char v22 = 1;
      uint64_t v37 = 3;
      unint64_t v39 = __PAIR64__(v19, v18);
      int v19 = 0;
      if (v25 != 1) {
        break;
      }
      goto LABEL_23;
    case 3uLL:
      unint64_t v39 = v18;
      int v24 = 0;
      char v21 = 0;
      int v19 = 0;
      uint64_t v23 = 0;
      char v26 = v15 & v17;
      uint64_t v37 = 1;
      goto LABEL_22;
    case 4uLL:
      char v21 = 0;
      uint64_t v23 = 0;
      char v26 = v15 & v17;
      uint64_t v37 = 1;
      int v24 = 1;
      int v19 = 1;
      unint64_t v39 = 0x100000000;
LABEL_22:
      char v22 = v15;
      if (v26)
      {
LABEL_23:
        double v20 = 1.0;
        uint64_t v23 = 1;
        int v19 = v24;
      }
      break;
    case 5uLL:
      unint64_t v39 = 0;
      int v19 = 0;
      char v21 = 0;
      char v22 = 0;
      uint64_t v23 = 0;
      uint64_t v27 = 2;
      goto LABEL_26;
    case 6uLL:
      unint64_t v39 = 0;
      int v19 = 0;
      char v21 = 0;
      char v22 = 0;
      uint64_t v23 = 0;
      uint64_t v27 = 4;
LABEL_26:
      uint64_t v37 = v27;
      break;
    default:
      unint64_t v39 = v18;
      uint64_t v37 = 0;
      char v21 = 0;
      char v22 = 0;
      uint64_t v23 = 0;
      break;
  }
  int v38 = v19;
  char v28 = [(VKCImageAnalysisInteraction *)self forceAnalysisBarButtonItemEnabled] & v15;
  v29 = (void *)MEMORY[0x1E4F42FF0];
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __74__VKCImageAnalysisInteraction_configureButtonsForState_updateActiveTypes___block_invoke;
  v49[3] = &unk_1E6BF2168;
  v50 = v40;
  double v56 = v20;
  char v57 = v22;
  char v58 = v21;
  id v51 = v7;
  v30 = v41;
  char v59 = v23;
  char v60 = v28;
  v52 = v30;
  id v53 = v42;
  BOOL v61 = v43;
  id v54 = v8;
  v55 = self;
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __74__VKCImageAnalysisInteraction_configureButtonsForState_updateActiveTypes___block_invoke_2;
  v45[3] = &unk_1E6BF2190;
  v31 = v50;
  char v48 = v23;
  v46 = v31;
  id v47 = v51;
  id v32 = v51;
  id v33 = v8;
  id v34 = v42;
  [v29 animateWithDuration:v49 animations:v45 completion:0.15];
  if (v43)
  {
    if (v39) {
      uint64_t v35 = v37 | 8;
    }
    else {
      uint64_t v35 = v37;
    }
    [(VKCImageAnalysisInteraction *)self _setActiveInteractionTypes:v35 updateAutomaticState:0];
  }
  [(VKCImageAnalysisInteraction *)self set_highlightSelectableItems:HIDWORD(v39)];
  [(VKCImageAnalysisInteraction *)self setButtonsVisible:v23];
  if ([(VKCImageAnalysisInteraction *)self deriveQuickActionsVisibilityFromState])
  {
    v36 = [(VKCImageAnalysisInteraction *)self actionInfoViewIfExists];
    objc_msgSend(v36, "set_quickActionsHidden:", v38 | HIDWORD(v39) ^ 1u);
  }
  [(VKImageAnalysisButton *)v31 setMode:0];
  [v32 setMode:0];
  [(VKImageAnalysisBarButtonItem *)v30 setMode:0];
}

void __74__VKCImageAnalysisInteraction_configureButtonsForState_updateActiveTypes___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 80)];
  [*(id *)(a1 + 32) setEnabled:*(unsigned __int8 *)(a1 + 88)];
  [*(id *)(a1 + 32) setSelected:*(unsigned __int8 *)(a1 + 89)];
  [*(id *)(a1 + 40) setAlpha:*(double *)(a1 + 80)];
  [*(id *)(a1 + 40) setEnabled:*(unsigned __int8 *)(a1 + 88)];
  [*(id *)(a1 + 40) setSelected:*(unsigned __int8 *)(a1 + 89)];
  BOOL v2 = *(unsigned char *)(a1 + 88) && *(unsigned char *)(a1 + 90) || *(unsigned char *)(a1 + 91) != 0;
  [*(id *)(a1 + 48) setEnabled:v2];
  [*(id *)(a1 + 48) setSelected:*(unsigned __int8 *)(a1 + 89)];
  if (!*(unsigned char *)(a1 + 90)
    && ([*(id *)(a1 + 56) isHidden] & 1) == 0
    && ([*(id *)(a1 + 64) isHidden] & 1) == 0)
  {
    [*(id *)(a1 + 32) setHidden:1];
    [*(id *)(a1 + 40) setHidden:1];
  }
  if (!*(unsigned char *)(a1 + 89) && *(unsigned char *)(a1 + 92))
  {
    id v3 = [*(id *)(a1 + 72) baseView];
    [v3 setIsShowingTranslation:0];
  }
}

uint64_t __74__VKCImageAnalysisInteraction_configureButtonsForState_updateActiveTypes___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setHidden:*(unsigned char *)(a1 + 48) == 0];
  BOOL v2 = *(unsigned char *)(a1 + 48) == 0;
  id v3 = *(void **)(a1 + 40);
  return [v3 setHidden:v2];
}

- (void)sendAnalyticsEventWithType:(int64_t)a3 source:(int64_t)a4 analysisButtonActive:(BOOL)a5
{
  BOOL v5 = a5;
  int v9 = [VKAnalyticsInteractionEvent alloc];
  int v10 = [(VKCImageAnalysisInteraction *)self analysis];
  int v11 = [v10 imageAnalysisResult];
  unint64_t v12 = [(VKCImageAnalysisInteraction *)self activeInteractionTypes];
  uint64_t v13 = [(VKCImageAnalysisInteraction *)self _customAnalyticsIdentifier];
  int v15 = [(VKAnalyticsInteractionEvent *)v9 initWithEventType:a3 analysis:v11 source:a4 interactionTypes:v12 buttonActive:v5 customIdentifier:v13];

  if ([(VKCImageAnalysisInteraction *)self activeInteractionTypes]) {
    [(VKCImageAnalysisInteraction *)self addEventToAnalyticsSession:v15];
  }
  else {
    [(VKCImageAnalysisInteraction *)self closeAndSendCurrentAnalyticsSession];
  }
  double v14 = [(VKCImageAnalysisInteraction *)self _analyticsDelegate];
  [v14 _visionKitAnalyticsEventDidOccur:v15 interaction:self];
}

- (void)addEventToAnalyticsSession:(id)a3
{
  id v4 = a3;
  if (![(VKCImageAnalysisInteraction *)self isSettingAnalysis])
  {
    BOOL v5 = [(VKCImageAnalysisInteraction *)self analyticsProcessor];
    [v5 processAndSendEvent:v4];

    [(VKCImageAnalysisInteraction *)self beginNewAnalyticsSessionIfNecessary];
    uint64_t v6 = [(VKCImageAnalysisInteraction *)self analyticsSession];
    [v6 addEvent:v4];

    unint64_t v7 = (void *)([(VKCImageAnalysisInteraction *)self analyticsTimeoutIndex] + 1);
    [(VKCImageAnalysisInteraction *)self setAnalyticsTimeoutIndex:v7];
    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __58__VKCImageAnalysisInteraction_addEventToAnalyticsSession___block_invoke;
    v8[3] = &unk_1E6BF21B8;
    objc_copyWeak(v9, &location);
    v9[1] = v7;
    vk_dispatchMainAfterDelay(v8, 7.0);
    objc_destroyWeak(v9);
    objc_destroyWeak(&location);
  }
}

void __58__VKCImageAnalysisInteraction_addEventToAnalyticsSession___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    BOOL v3 = [WeakRetained analyticsTimeoutIndex] == *(void *)(a1 + 40);
    id WeakRetained = v4;
    if (v3)
    {
      [v4 closeAndSendCurrentAnalyticsSession];
      id WeakRetained = v4;
    }
  }
}

- (void)beginNewAnalyticsSessionIfNecessary
{
  uint64_t v3 = [(VKCImageAnalysisInteraction *)self analysis];
  if (v3)
  {
    id v4 = (void *)v3;
    unint64_t v5 = [(VKCImageAnalysisInteraction *)self activeInteractionTypes];

    if (v5)
    {
      uint64_t v6 = [(VKCImageAnalysisInteraction *)self analyticsSession];

      if (!v6)
      {
        unint64_t v7 = [VKAnalyticsSessionAccumulator alloc];
        unint64_t v8 = [(VKCImageAnalysisInteraction *)self analysis];
        int v9 = [(VKCImageAnalysisInteraction *)self _customAnalyticsIdentifier];
        int v10 = [(VKAnalyticsSessionAccumulator *)v7 initWithAnalysis:v8 customIdentifier:v9];
        [(VKCImageAnalysisInteraction *)self setAnalyticsSession:v10];

        unint64_t v11 = [(VKCImageAnalysisInteraction *)self analyticsTimeoutIndex] + 1;
        [(VKCImageAnalysisInteraction *)self setAnalyticsTimeoutIndex:v11];
      }
    }
  }
}

- (void)closeAndSendCurrentAnalyticsSession
{
  uint64_t v3 = [(VKCImageAnalysisInteraction *)self analyticsSession];
  if (v3)
  {
    id v5 = v3;
    [v3 close];
    id v4 = [(VKCImageAnalysisInteraction *)self analyticsProcessor];
    [v4 processAndSendSession:v5];

    [(VKCImageAnalysisInteraction *)self setAnalyticsTimeoutIndex:[(VKCImageAnalysisInteraction *)self analyticsTimeoutIndex] + 1];
    [(VKCImageAnalysisInteraction *)self setAnalyticsSession:0];
    uint64_t v3 = v5;
  }
}

+ (void)_quickActionResultForDocumentObservation:(id)a3 queue:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!v8)
  {
    id v8 = (id)MEMORY[0x1E4F14428];
    id v10 = MEMORY[0x1E4F14428];
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __96__VKCImageAnalysisInteraction__quickActionResultForDocumentObservation_queue_completionHandler___block_invoke;
  block[3] = &unk_1E6BF0EF8;
  id v15 = v7;
  id v16 = v8;
  id v17 = v9;
  id v11 = v9;
  unint64_t v12 = v8;
  id v13 = v7;
  dispatch_async(v12, block);
}

void __96__VKCImageAnalysisInteraction__quickActionResultForDocumentObservation_queue_completionHandler___block_invoke(uint64_t a1)
{
  BOOL v2 = [VKCImageAnalysisResult alloc];
  uint64_t v3 = -[VKCImageAnalysisResult initWithDocumentObservation:mrcDataDetectors:imageSize:](v2, "initWithDocumentObservation:mrcDataDetectors:imageSize:", *(void *)(a1 + 32), MEMORY[0x1E4F1CBF0], 1.0, 1.0);
  id v4 = [(VKCTextRecognitionResult *)v3 dataDetectors];
  id v5 = [(VKCTextRecognitionResult *)v3 unfilteredDataDetectors];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __96__VKCImageAnalysisInteraction__quickActionResultForDocumentObservation_queue_completionHandler___block_invoke_2;
  v7[3] = &unk_1E6BF2200;
  uint64_t v6 = *(void *)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  +[VKCQuickActionsProcessor quickActionsFromElements:v4 unfilteredElements:v5 analysis:v3 queue:v6 completionHandler:v7];
}

void __96__VKCImageAnalysisInteraction__quickActionResultForDocumentObservation_queue_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 enumerateObjectsUsingBlock:&__block_literal_global_10];
  id v4 = VKBundle();
  id v9 = [v4 localizedStringForKey:@"VK_QUICK_ACTION_TITLE_MORE" value:@"VK_QUICK_ACTION_TITLE_MORE" table:@"Localizable"];

  id v5 = objc_msgSend(MEMORY[0x1E4F42A80], "vk_symbolImageWithName:", @"ellipsis.circle.fill");
  uint64_t v6 = +[VKCActionInfoButton buttonWithImage:v5 text:v9];
  [v6 setAccessibilityIdentifier:@"QuickActionMore"];
  id v7 = +[VKCActionInfoView buildMoreButtonMenuFromQuickActions:v3 moreButton:v6 isStandAloneMoreButton:1];
  [v6 setMenu:v7];

  id v8 = objc_alloc_init(VKCExternalQuickActionsResult);
  [(VKCExternalQuickActionsResult *)v8 setQuickActions:v3];

  [(VKCExternalQuickActionsResult *)v8 setMoreButton:v6];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __96__VKCImageAnalysisInteraction__quickActionResultForDocumentObservation_queue_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 translucentButtonConfiguration];
  [v2 setConfiguration:v3];
}

- (void)_test_activateTranslationOverlay
{
  id v2 = [(VKCImageAnalysisInteraction *)self baseView];
  objc_msgSend(v2, "test_activateTranslationOverlay");
}

- (VKCImageAnalysisInteractionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VKCImageAnalysisInteractionDelegate *)WeakRetained;
}

- (VKCImageAnalysis)analysis
{
  return self->_analysis;
}

- (void)setAnalysisBarButtonItem:(id)a3
{
}

- (void)setAnalysisButton:(id)a3
{
}

- (BOOL)analysisButtonRequiresVisibleContentGating
{
  return self->_analysisButtonRequiresVisibleContentGating;
}

- (void)setAnalysisButtonRequiresVisibleContentGating:(BOOL)a3
{
  self->_analysisButtonRequiresVisibleContentGating = a3;
}

- (BOOL)didAddVisualSearchCornerView
{
  return self->_didAddVisualSearchCornerView;
}

- (UIGestureRecognizer)feedbackGestureRecognizer
{
  return self->_feedbackGestureRecognizer;
}

- (void)setFeedbackGestureRecognizer:(id)a3
{
}

- (BOOL)automaticallyShowVisualSearchResults
{
  return self->_automaticallyShowVisualSearchResults;
}

- (void)setAutomaticallyShowVisualSearchResults:(BOOL)a3
{
  self->_automaticallyShowVisualSearchResults = a3;
}

- (BOOL)actionInfoViewHidden
{
  return self->_actionInfoViewHidden;
}

- (double)preferredQuickActionButtonHeight
{
  return self->_preferredQuickActionButtonHeight;
}

- (UIFont)actionInfoCustomFont
{
  return self->_actionInfoCustomFont;
}

- (id)quickActionConfigurationUpdateHandler
{
  return self->_quickActionConfigurationUpdateHandler;
}

- (NSArray)baseViewConstraints
{
  return self->_baseViewConstraints;
}

- (void)setBaseViewConstraints:(id)a3
{
}

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  return (UIView *)WeakRetained;
}

- (VKCImageAnalysisBaseView)baseView
{
  return self->_baseView;
}

- (void)setBaseView:(id)a3
{
}

- (BOOL)isSettingAnalysis
{
  return self->_isSettingAnalysis;
}

- (void)setIsSettingAnalysis:(BOOL)a3
{
  self->_isSettingAnalysis = a3;
}

- (BOOL)isUpdatingActiveTypes
{
  return self->_isUpdatingActiveTypes;
}

- (void)setIsUpdatingActiveTypes:(BOOL)a3
{
  self->_isUpdatingActiveTypes = a3;
}

- (VKCVisualSearchCornerView)visualSearchCornerButtonView
{
  return self->_visualSearchCornerButtonView;
}

- (void)setVisualSearchCornerButtonView:(id)a3
{
}

- (void)setActionInfoView:(id)a3
{
}

- (void)setActionInfoAnalysisButton:(id)a3
{
}

- (void)setActionInfoCornerButtonView:(id)a3
{
}

- (BOOL)wantsTranslucentActionInfoButtons
{
  return self->_wantsTranslucentActionInfoButtons;
}

- (NSArray)actionButtons
{
  return self->_actionButtons;
}

- (void)setActionButtons:(id)a3
{
}

- (BOOL)_manuallyManagesActionInfoButtons
{
  return self->__manuallyManagesActionInfoButtons;
}

- (VKInteractionAnalyticsDelegate)_analyticsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__analyticsDelegate);
  return (VKInteractionAnalyticsDelegate *)WeakRetained;
}

- (void)set_analyticsDelegate:(id)a3
{
}

- (BOOL)didInteractWithVisualSearchItem
{
  return self->_didInteractWithVisualSearchItem;
}

- (void)setDidInteractWithVisualSearchItem:(BOOL)a3
{
  self->_didInteractWithVisualSearchItem = a3;
}

- (BOOL)forceAnalysisBarButtonItemEnabled
{
  return self->_forceAnalysisBarButtonItemEnabled;
}

- (BOOL)didToggleAAButton
{
  return self->_didToggleAAButton;
}

- (void)setDidToggleAAButton:(BOOL)a3
{
  self->_didToggleAAButton = a3;
}

- (double)visibleTextAreaThreshold
{
  return self->_visibleTextAreaThreshold;
}

- (void)setVisibleTextAreaThreshold:(double)a3
{
  self->_visibleTextAreaThreshold = a3;
}

- (VKAnalyticsSessionAccumulator)analyticsSession
{
  return self->_analyticsSession;
}

- (void)setAnalyticsSession:(id)a3
{
}

- (VKAnalyticsProcessor)analyticsProcessor
{
  return self->_analyticsProcessor;
}

- (void)setAnalyticsProcessor:(id)a3
{
}

- (unint64_t)analyticsTimeoutIndex
{
  return self->_analyticsTimeoutIndex;
}

- (void)setAnalyticsTimeoutIndex:(unint64_t)a3
{
  self->_analyticsTimeoutIndedouble x = a3;
}

- (BOOL)buttonsVisible
{
  return self->_buttonsVisible;
}

- (BOOL)didLogAnalysisButtonVisible
{
  return self->_didLogAnalysisButtonVisible;
}

- (void)setDidLogAnalysisButtonVisible:(BOOL)a3
{
  self->_didLogAnalysisButtonVisible = a3;
}

- (BOOL)deriveQuickActionsVisibilityFromState
{
  return self->_deriveQuickActionsVisibilityFromState;
}

- (void)setDeriveQuickActionsVisibilityFromState:(BOOL)a3
{
  self->_deriveQuickActionsVisibilityFromState = a3;
}

- (unint64_t)interactionTypesSetByClient
{
  return self->_interactionTypesSetByClient;
}

- (void)setInteractionTypesSetByClient:(unint64_t)a3
{
  self->_interactionTypesSetByClient = a3;
}

- (BOOL)_isInPublicAutomaticMode
{
  return self->__isInPublicAutomaticMode;
}

- (void)set_isInPublicAutomaticMode:(BOOL)a3
{
  self->__isInPublicAutomaticMode = a3;
}

- (BOOL)_publicAPIDelegateExists
{
  return self->__publicAPIDelegateExists;
}

- (void)set_publicAPIDelegateExists:(BOOL)a3
{
  self->__publicAPIDelegateExists = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsProcessor, 0);
  objc_storeStrong((id *)&self->_analyticsSession, 0);
  objc_destroyWeak((id *)&self->__analyticsDelegate);
  objc_storeStrong((id *)&self->_actionButtons, 0);
  objc_storeStrong((id *)&self->_actionInfoCornerButtonView, 0);
  objc_storeStrong((id *)&self->_actionInfoAnalysisButton, 0);
  objc_storeStrong((id *)&self->_actionInfoView, 0);
  objc_storeStrong((id *)&self->_visualSearchCornerButtonView, 0);
  objc_storeStrong((id *)&self->_baseView, 0);
  objc_destroyWeak((id *)&self->_view);
  objc_storeStrong((id *)&self->_baseViewConstraints, 0);
  objc_storeStrong(&self->_quickActionConfigurationUpdateHandler, 0);
  objc_storeStrong((id *)&self->_actionInfoCustomFont, 0);
  objc_storeStrong((id *)&self->_feedbackGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_analysisButton, 0);
  objc_storeStrong((id *)&self->_analysisBarButtonItem, 0);
  objc_storeStrong((id *)&self->_analysis, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (id)generatePlistsForScalingAndAlignment
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:15];
  id v4 = [(VKCImageAnalysisInteraction *)self view];
  [v4 bounds];
  id v7 = +[VKCMockHelper plistFromSize:](VKCMockHelper, "plistFromSize:", v5, v6);
  [v3 setObject:v7 forKeyedSubscript:VKCMockResultLayoutBoundsKey];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v8 = [&unk_1F357DF58 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(&unk_1F357DF58);
        }
        unint64_t v12 = [*(id *)(*((void *)&v21 + 1) + 8 * i) integerValue];
        unint64_t v13 = v12;
        if (v12 > 0xC) {
          double v14 = 0;
        }
        else {
          double v14 = off_1E6BF4278[v12];
        }
        id v15 = [NSString stringWithFormat:@"%@", v14];
        id v16 = [(VKCImageAnalysisInteraction *)self view];
        [v16 setContentMode:v13];

        id v17 = [(VKCImageAnalysisInteraction *)self baseView];
        BOOL v18 = [v17 textSelectionView];
        int v19 = [v18 quadsForAllWordsForCurrentLayout];
        [v3 setObject:v19 forKeyedSubscript:v15];
      }
      uint64_t v9 = [&unk_1F357DF58 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v9);
  }
  return v3;
}

@end