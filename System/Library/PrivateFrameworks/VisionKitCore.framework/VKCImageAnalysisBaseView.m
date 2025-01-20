@interface VKCImageAnalysisBaseView
+ (id)keyPathsForValuesAffectingHasActiveTextSelection;
- ($0FD61D44AD30C1CDCD15B60AC4039C90)videoPreviewTimeRange;
- (BOOL)_hasActiveTextSelection;
- (BOOL)_photosInfoSingleTapSubjectModeEnabled;
- (BOOL)actionInfoHiddenForZoomAnimation;
- (BOOL)analysisContainsTextAtPoint:(CGPoint)a3;
- (BOOL)analysisIsAllDataDetectors;
- (BOOL)clientDidSetNormalizedRect;
- (BOOL)containsActionInfoItemAtPoint:(CGPoint)a3;
- (BOOL)containsImageSubjectAtPoint:(CGPoint)a3;
- (BOOL)containsInteractiveItemAtPoint:(CGPoint)a3;
- (BOOL)containsTextAtPoint:(CGPoint)a3;
- (BOOL)containsVisualSearchItemAtPoint:(CGPoint)a3;
- (BOOL)dataDetectorView:(id)a3 dataDetectorInteractionShouldBeginAtPoint:(CGPoint)a4;
- (BOOL)didAddVisualSearchCornerView;
- (BOOL)didLogContentsRectError;
- (BOOL)hasActiveTextSelection;
- (BOOL)highlightSelectableItems;
- (BOOL)highlightedMenuItemUpdateScheduled;
- (BOOL)inhibitSubjectDimmingAndLiftView;
- (BOOL)isAnalysisVisible;
- (BOOL)isPublicAPI;
- (BOOL)isShowingTranslation;
- (BOOL)isSubjectAnalysisComplete;
- (BOOL)isSubjectHighlightAvailable;
- (BOOL)isSubjectHighlightShowingLivePhoto:(id)a3 delegateHasImplementation:(BOOL *)a4;
- (BOOL)longPressDataDetectorsInTextMode;
- (BOOL)presentVisualSearchForItem:(id)a3;
- (BOOL)stringHighlightsActive;
- (BOOL)subjectHighlightActive;
- (BOOL)subjectHighlightFeatureFlagEnabled;
- (BOOL)subjectHighlightView:(id)a3 containsVSItemForNormalizedPath:(id)a4;
- (BOOL)subjectHighlightView:(id)a3 shouldBeginInteractionAtPoint:(CGPoint)a4 withType:(unint64_t)a5;
- (BOOL)subjectInteractionInProgress;
- (BOOL)subjectViewUserInteractionDisabled;
- (BOOL)textSelectionView:(id)a3 dataDetectorExistsAtPoint:(CGPoint)a4;
- (BOOL)textSelectionView:(id)a3 shouldBeginAtPoint:(CGPoint)a4;
- (BOOL)textSelectionView:(id)a3 shouldHandleShareWithRanges:(id)a4 boundingRect:(CGRect)a5 selectedText:(id)a6 selectedAttributedText:(id)a7;
- (BOOL)usesLightDimmingViewInLightMode;
- (BOOL)visibleTextAreaInfoIsValid;
- (BOOL)visualSearchItemView:(id)a3 shouldBeginAtPoint:(CGPoint)a4;
- (BOOL)visualSearchView:(id)a3 shouldShowDotForItem:(id)a4 allItems:(id)a5;
- (BOOL)wantsAutomaticContentsRectCalculation;
- (CALayer)layerForObservingContentsRect;
- (CGRect)calculateNormalizedVisibleRect;
- (CGRect)frameWhenResigningActive;
- (CGRect)subjectFrame;
- (CGRect)videoPreviewNormalizedCropRect;
- (CGRect)visibleImageRect;
- (NSArray)filteredNormalizedRectangleQuads;
- (NSArray)filteredRectangleQuads;
- (NSArray)highlightStrings;
- (NSArray)keyPathsAffectingContentMode;
- (NSArray)quickActions;
- (NSArray)rawRectangleObservations;
- (NSArray)selectedRanges;
- (NSAttributedString)selectedAttributedText;
- (NSIndexSet)activeSubjectIndexSet;
- (NSIndexSet)allSubjectsIndexSet;
- (NSIndexSet)highlightStringsIndexSet;
- (NSString)description;
- (NSString)selectedText;
- (NSString)text;
- (OS_dispatch_queue)backgroundQueue;
- (UIFont)actionInfoCustomFont;
- (UIImage)customImageForRemoveBackground;
- (UIImageView)debugImageView;
- (UILabel)textInfoView;
- (UIScrollView)scrollViewToObserve;
- (UIView)viewForObservingContentMode;
- (VKCActionInfoButton)copyAllQuickAction;
- (VKCActionInfoButton)translateQuickAction;
- (VKCActionInfoView)actionInfoView;
- (VKCAnalysisDebugMenuProvider)debugMenuProvider;
- (VKCImageAnalysisBaseView)init;
- (VKCImageAnalysisBaseViewDelegate)delegate;
- (VKCImageAnalysisResult)analysisResult;
- (VKCImageCustomHighlightView)regexHighlightView;
- (VKCImageCustomHighlightView)regexHighlightViewIfExists;
- (VKCImageDataDetectorView)dataDetectorView;
- (VKCImageSubjectContext)subjectContext;
- (VKCImageSubjectHighlightView)subjectHighlightView;
- (VKCImageTextSelectionView)textSelectionView;
- (VKCImageTranslationView)translationView;
- (VKCImageVisualSearchView)visualSearchView;
- (VKCRemoveBackgroundRequest)inProcessMaskRemoveBackgroundRequest;
- (VKCRemoveBackgroundRequestHandler)removeBackgroundRequestHandler;
- (VKCVisualSearchResultItem)vsItemPresentedFromMenu;
- (VKTextRange)selectedRange;
- (VKTextRange)selectedTextRangeBeforeDataDetectorMenu;
- (VKVisibleTextAreaInfo)calculateVisibleTextAreaInfo;
- (VKVisibleTextAreaInfo)visibleTextAreaInfo;
- (double)currentExtraOffsetForViewScale;
- (double)totalBoundingBoxTextArea;
- (double)totalQuadTextArea;
- (id)dataDetectorElementPoint:(CGPoint)a3 requestingView:(id)a4;
- (id)disposableFolderPath;
- (id)disposableSubjectPNGURLWithTitle:(id)a3;
- (id)generateSubjectImage;
- (id)highlightView:(id)a3 selectionRectsForRanges:(id)a4;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4 usingSubviewsOf:(id)a5;
- (id)imageSubjectPathWithIndexes:(id)a3;
- (id)indexOfSubjectAtPoint:(CGPoint)a3;
- (id)loggingParentObject;
- (id)nonTextNormalizedHighlightAllQuadsForTextSelectionView:(id)a3;
- (id)presentingViewControllerForImageAnalysisInteraction;
- (id)presentingViewControllerForSubjectHighlightView:(id)a3;
- (id)presentingViewControllerForTextSelectionView:(id)a3;
- (id)previewForDataDetectorElementView:(id)a3;
- (id)previewImageForDataDetectorElementView:(id)a3;
- (id)summaryDescription;
- (id)tempPNGURLForSubjectHighlightView:(id)a3;
- (id)textSelectionView:(id)a3 closestVisualSearchItemForRange:(id)a4;
- (id)textSelectionView:(id)a3 updateAttributedStringForCopy:(id)a4;
- (id)textSelectionView:(id)a3 updateStringForCopy:(id)a4;
- (id)videoPreviewSubjectMatteAtCompositionTime:(id *)a3;
- (id)videoPreviewSubjectMatteForImage:(id)a3 atCompositionTime:(id *)a4;
- (id)viewForImageSnapshotForTextSelectionView:(id)a3;
- (id)visualSearchResultItems;
- (id)visualSearchView:(id)a3 normalizedPathForSubjectAtNormalizedPoint:(CGPoint)a4;
- (int64_t)scrollViewToObserveCount;
- (unint64_t)activeInteractionTypes;
- (unint64_t)checkForQuickActionsIndex;
- (unint64_t)dataDetectorTypeAtPoint:(CGPoint)a3;
- (unint64_t)dataDetectorTypes;
- (unint64_t)subjectRequestStatus;
- (void)_logVisualSearchHintAvailabilityUpdate;
- (void)_updateAnalysisVisibility;
- (void)actionInfoButtonDidActivatePrimaryAction:(id)a3;
- (void)addMetadataToVSFeedbackItem:(id)a3;
- (void)analysisDidUpdateForTypes:(unint64_t)a3;
- (void)applicationWillResignActive:(id)a3;
- (void)automaticallyShowVisualSearchResultsIfApplicable;
- (void)beginImageSubjectAnalysisIfNecessary;
- (void)beginImageSubjectAnalysisIfNecessaryWithCompletion:(id)a3;
- (void)beginImageSubjectAnalysisWithDelayIfNecessary;
- (void)checkForTranslationResultsWithCompletion:(id)a3;
- (void)clearDataDetectorViewIfNecessary;
- (void)clearRegexHighlightsAnimated:(BOOL)a3 updateActiveTypes:(BOOL)a4;
- (void)clearSelection;
- (void)clearStringHighlightsAnimated:(BOOL)a3;
- (void)clearTextSelectionViewIfNecessary;
- (void)clearTranslationViewIfNecessary;
- (void)clearVisualSearchViewIfNecessary;
- (void)configureForActiveTypes:(unint64_t)a3;
- (void)configureForCurrentActiveInteractionTypes;
- (void)copyAllToClipboard;
- (void)copyButtonPressed:(id)a3;
- (void)createStickerRepresentationsAtIndexSet:(id)a3 type:(unint64_t)a4 stickerIDs:(id)a5 progress:(id)a6 completion:(id)a7;
- (void)dataDetectorView:(id)a3 analyticsEventOccured:(id)a4;
- (void)dealloc;
- (void)debugButtonDidTap:(id)a3;
- (void)deleteDisposableFiles;
- (void)didMoveToWindow;
- (void)generateTextualVisualSearchResultForQueryInfo:(id)a3 completionHandler:(id)a4;
- (void)generateVisualSearchResultForItems:(id)a3 queryID:(unint64_t)a4 completionHandler:(id)a5;
- (void)highlightMatchesWithString:(id)a3 animated:(BOOL)a4;
- (void)highlightSubjectAtIndexSet:(id)a3 showCallout:(BOOL)a4 showBurst:(BOOL)a5 burstPoint:(CGPoint)a6 animated:(BOOL)a7;
- (void)invalidateVisibleTextAreaInfo;
- (void)layoutSubviews;
- (void)loadImageSubjectIfAvailableWithCompletion:(id)a3;
- (void)loadImageSubjectWithIndexes:(id)a3 completion:(id)a4;
- (void)loadQuickActionsIfNecessary;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)resetSelection;
- (void)safeAreaInsetsDidChange;
- (void)scrollViewDidChange:(id)a3;
- (void)scrollViewDidZoomToUnitRect:(CGRect)a3;
- (void)scrollViewWillChange:(id)a3;
- (void)selectAll;
- (void)sendActiveInteractionTypesDidChangeAnalyticsEvent;
- (void)sendAnalysisDidChangeAnalyticsEvent;
- (void)sendQuickActionAnalyticsWithDidBecomeVisible:(BOOL)a3;
- (void)sendVisualSearchAnalyticsWithDidBecomeActive:(BOOL)a3;
- (void)setActionInfoCustomFont:(id)a3;
- (void)setActionInfoHiddenForZoomAnimation:(BOOL)a3;
- (void)setActionInfoView:(id)a3;
- (void)setActiveInteractionTypes:(unint64_t)a3;
- (void)setActiveSubjectIndexSet:(id)a3;
- (void)setAnalysisResult:(id)a3;
- (void)setBackgroundQueue:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setCheckForQuickActionsIndex:(unint64_t)a3;
- (void)setClientDidSetNormalizedRect:(BOOL)a3;
- (void)setContentsRect:(CGRect)a3;
- (void)setCopyAllQuickAction:(id)a3;
- (void)setCustomImageForRemoveBackground:(id)a3;
- (void)setDataDetectorTypes:(unint64_t)a3;
- (void)setDataDetectorView:(id)a3;
- (void)setDebugImageView:(id)a3;
- (void)setDebugMenuProvider:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDidAddVisualSearchCornerView:(BOOL)a3;
- (void)setDidLogContentsRectError:(BOOL)a3;
- (void)setFrame:(CGRect)a3;
- (void)setFrameWhenResigningActive:(CGRect)a3;
- (void)setHighlightSelectableItems:(BOOL)a3;
- (void)setHighlightSelectableItems:(BOOL)a3 animated:(BOOL)a4;
- (void)setHighlightStrings:(id)a3;
- (void)setHighlightStringsIndexSet:(id)a3;
- (void)setHighlightedMenuItemUpdateScheduled:(BOOL)a3;
- (void)setIdentifierIndex:(int64_t)a3;
- (void)setInProcessMaskRemoveBackgroundRequest:(id)a3;
- (void)setInhibitSubjectDimmingAndLiftView:(BOOL)a3;
- (void)setIsAnalysisVisible:(BOOL)a3;
- (void)setIsPublicAPI:(BOOL)a3;
- (void)setIsShowingTranslation:(BOOL)a3;
- (void)setLayerForObservingContentsRect:(id)a3;
- (void)setLoggingParentObject:(id)a3;
- (void)setLongPressDataDetectorsInTextMode:(BOOL)a3;
- (void)setNormalizedVisibleRect:(CGRect)a3;
- (void)setQuickActions:(id)a3;
- (void)setRegexHighlightView:(id)a3;
- (void)setRemoveBackgroundRequestHandler:(id)a3;
- (void)setScrollViewToObserve:(id)a3;
- (void)setScrollViewToObserveCount:(int64_t)a3;
- (void)setSelectedRanges:(id)a3;
- (void)setSelectedTextRangeBeforeDataDetectorMenu:(id)a3;
- (void)setStringHighlightsActive:(BOOL)a3;
- (void)setSubjectHighlightFeatureFlagEnabled:(BOOL)a3;
- (void)setSubjectHighlightView:(id)a3;
- (void)setSubjectViewUserInteractionDisabled:(BOOL)a3;
- (void)setTextInfoView:(id)a3;
- (void)setTextSelectionView:(id)a3;
- (void)setTranslateQuickAction:(id)a3;
- (void)setTranslationView:(id)a3;
- (void)setUsesLightDimmingViewInLightMode:(BOOL)a3;
- (void)setViewForObservingContentMode:(id)a3;
- (void)setVisibleImageRect:(CGRect)a3;
- (void)setVisibleTextAreaInfo:(VKVisibleTextAreaInfo *)a3;
- (void)setVisibleTextAreaInfoIsValid:(BOOL)a3;
- (void)setVisualSearchView:(id)a3;
- (void)setVsItemPresentedFromMenu:(id)a3;
- (void)setWantsAutomaticContentsRectCalculation:(BOOL)a3;
- (void)set_hasActiveTextSelection:(BOOL)a3;
- (void)set_photosInfoSingleTapSubjectModeEnabled:(BOOL)a3;
- (void)showTopVisualSearchResult;
- (void)subjectBaseView:(id)a3 analyticsEventOccurred:(id)a4;
- (void)subjectBaseViewDidBeginSubjectAnalysis:(id)a3;
- (void)subjectBaseViewViewDidCompleteSubjectAnalysis:(id)a3;
- (void)subjectHighlightView:(id)a3 activateVSItemForNormalizedPath:(id)a4;
- (void)subjectHighlightView:(id)a3 livePhotoShouldPlay:(BOOL)a4;
- (void)subjectHighlightView:(id)a3 prepareForCalloutAction:(SEL)a4 completion:(id)a5;
- (void)subjectHighlightView:(id)a3 willBeginInteractionAtPoint:(CGPoint)a4 withType:(unint64_t)a5;
- (void)subjectHighlightViewSubjectInteractionInProgressDidChange:(id)a3;
- (void)submitVisualSearchUserFeedbackForReportIdentifier:(id)a3 userFeedbackPayload:(id)a4 sfReportData:(id)a5;
- (void)tearDownQuickActions;
- (void)test_activateTranslationOverlay;
- (void)textSelectionView:(id)a3 analyticsEventOccured:(id)a4;
- (void)textSelectionView:(id)a3 boundsDidChangeFromRect:(CGRect)a4 toRect:(CGRect)a5;
- (void)textSelectionView:(id)a3 prepareForCalloutAction:(SEL)a4 completion:(id)a5;
- (void)textSelectionView:(id)a3 requestsDataDetectorActivationAtPoint:(CGPoint)a4;
- (void)textSelectionView:(id)a3 selectionDidChange:(id)a4;
- (void)translateButtonPressed:(id)a3;
- (void)triggerTapToRadar;
- (void)updateAndNotifyAfterValidNormalizedVisibleRectChange;
- (void)updateAndNotifyAfterValidNormalizedVisibleRectChangeIfNecessary;
- (void)updateCurrentDisplayedViewContentsRect;
- (void)updateDebugButtonIfNecessary;
- (void)updateNormalizedVisibleRect;
- (void)updateNormalizedVisibleRectIfNecessary;
- (void)updateSubviewsToMatchBounds;
- (void)useInteractionOptions:(unint64_t)a3;
- (void)videoPreviewAvailableForSubjectHighlightView:(id)a3;
- (void)visualSearchItemView:(id)a3 didTapVisualSearchIndicatorWithNormalizedBoundingBox:(CGRect)a4;
- (void)visualSearchItemViewDidActivateVSItem:(id)a3;
- (void)visualSearchItemViewDidDismissController:(id)a3;
- (void)visualSearchView:(id)a3 analyticsEventOccured:(id)a4;
- (void)willDismissMenuForDataDetectorView:(id)a3;
- (void)willDisplayMenuForActionInfoButton:(id)a3;
- (void)willDisplayMenuForDataDetectorView:(id)a3;
- (void)willHideMenuForActionInfoButton:(id)a3;
@end

@implementation VKCImageAnalysisBaseView

- (void)dealloc
{
  v3 = [(VKCImageAnalysisBaseView *)self keyPathsAffectingContentMode];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __35__VKCImageAnalysisBaseView_dealloc__block_invoke;
  v9[3] = &unk_1E6BF3270;
  v9[4] = self;
  [v3 enumerateObjectsUsingBlock:v9];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_layerForObservingContentsRect);
  [WeakRetained removeObserver:self forKeyPath:@"contentsRect" context:VKImageRecognitionContentModeContext];

  v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self];

  id v6 = objc_loadWeakRetained((id *)&self->_scrollViewToObserve);
  [v6 _removeScrollViewScrollObserver:self];

  if ([(VKCImageAnalysisBaseView *)self isAnalysisVisible]
    && (self->_activeInteractionTypes & 4) != 0)
  {
    v7 = +[VKImageAnalyzerMadInterface sharedInterface];
    [v7 didLeaveVisualSearchHints];
  }
  [(VKCImageAnalysisBaseView *)self tearDownQuickActions];
  [(VKCImageAnalysisBaseView *)self deleteDisposableFiles];
  v8.receiver = self;
  v8.super_class = (Class)VKCImageAnalysisBaseView;
  [(VKCImageAnalysisBaseView *)&v8 dealloc];
}

void __35__VKCImageAnalysisBaseView_dealloc__block_invoke(uint64_t a1, void *a2)
{
  v3 = (id *)(*(void *)(a1 + 32) + 600);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained removeObserver:*(void *)(a1 + 32) forKeyPath:v4 context:VKImageRecognitionContentModeContext];
}

- (VKCImageAnalysisBaseView)init
{
  v36.receiver = self;
  v36.super_class = (Class)VKCImageAnalysisBaseView;
  v2 = [(VKCImageAnalysisBaseView *)&v36 init];
  v3 = v2;
  if (v2)
  {
    ++sIdentifierIndex;
    -[VKCImageAnalysisBaseView setIdentifierIndex:](v2, "setIdentifierIndex:");
    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:v3 selector:sel_scrollViewWillChange_ name:*MEMORY[0x1E4F43E88] object:0];
    [v4 addObserver:v3 selector:sel_scrollViewDidChange_ name:*MEMORY[0x1E4F43E78] object:0];
    [v4 addObserver:v3 selector:sel_scrollViewWillChange_ name:*MEMORY[0x1E4F43E80] object:0];
    [v4 addObserver:v3 selector:sel_scrollViewDidChange_ name:*MEMORY[0x1E4F43E70] object:0];
    [(VKCImageAnalysisBaseView *)v3 setAccessibilityIgnoresInvertColors:1];
    [v4 addObserver:v3 selector:sel_applicationWillResignActive_ name:*MEMORY[0x1E4F43710] object:0];
    v3->_longPressDataDetectorsInTextMode = 1;
    v5 = objc_alloc_init(VKCImageTextSelectionView_iOS);
    objc_storeStrong((id *)&v3->_textSelectionView, v5);
    [(VKCImageTextSelectionView *)v3->_textSelectionView setTextSelectionDelegate:v3];
    [(VKCImageBaseOverlayView *)v3->_textSelectionView setBaseDelegate:v3];
    uint64_t v6 = objc_opt_new();
    translationView = v3->_translationView;
    v3->_translationView = (VKCImageTranslationView *)v6;

    [(VKCImageBaseOverlayView *)v3->_translationView setBaseDelegate:v3];
    objc_super v8 = v3->_translationView;
    v9 = [(VKCImageAnalysisBaseView *)v3 translateQuickAction];
    [(VKCImageTranslationView *)v8 setPresentationAnchorView:v9];

    if (vk_isInternalBuild()
      && +[VKCInternalSettings debugMenuEnabled])
    {
      v10 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4F42AA0]);
      debugImageView = v3->_debugImageView;
      v3->_debugImageView = v10;

      v12 = objc_msgSend(MEMORY[0x1E4F42A80], "vk_symbolImageWithName:", @"eye.circle.fill");
      [(UIImageView *)v3->_debugImageView setImage:v12];

      v13 = [(UIImageView *)v3->_debugImageView layer];
      LODWORD(v14) = 0.5;
      [v13 setShadowOpacity:v14];

      id v15 = [MEMORY[0x1E4F428B8] blackColor];
      uint64_t v16 = [v15 CGColor];
      v17 = [(UIImageView *)v3->_debugImageView layer];
      [v17 setShadowColor:v16];

      double v18 = *MEMORY[0x1E4F1DB30];
      double v19 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      v20 = [(UIImageView *)v3->_debugImageView layer];
      objc_msgSend(v20, "setShadowOffset:", v18, v19);

      v21 = objc_alloc_init(VKCAnalysisDebugMenuProvider);
      debugMenuProvider = v3->_debugMenuProvider;
      v3->_debugMenuProvider = v21;

      [(UIImageView *)v3->_debugImageView setVk_userInteractionEnabled:1];
      v23 = (void *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:v3 action:sel_debugButtonDidTap_];
      [(UIImageView *)v3->_debugImageView addGestureRecognizer:v23];
      v24 = objc_alloc_init(VKCAnalysisDebugMenuProvider);
      v25 = v3->_debugMenuProvider;
      v3->_debugMenuProvider = v24;

      v26 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
      textInfoView = v3->_textInfoView;
      v3->_textInfoView = v26;

      v28 = [MEMORY[0x1E4F428B8] whiteColor];
      v29 = objc_msgSend(v28, "vk_colorWith40PercentOpacity");
      [(UILabel *)v3->_textInfoView setVk_backgroundColor:v29];

      [(UIImageView *)v3->_debugImageView addSubview:v3->_textInfoView];
      [(VKCImageAnalysisBaseView *)v3 addSubview:v3->_debugImageView];
    }
    v30 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v31 = dispatch_queue_create("VKBaseViewBackground", v30);
    backgroundQueue = v3->_backgroundQueue;
    v3->_backgroundQueue = (OS_dispatch_queue *)v31;

    -[VKCImageAnalysisBaseView setNormalizedVisibleRect:](v3, "setNormalizedVisibleRect:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    _os_feature_enabled_impl();
    v3->_subjectHighlightFeatureFlagEnabled = 1;
    v33 = objc_alloc_init(VKCRemoveBackgroundRequestHandler);
    removeBackgroundRequestHandler = v3->_removeBackgroundRequestHandler;
    v3->_removeBackgroundRequestHandler = v33;
  }
  return v3;
}

- (void)useInteractionOptions:(unint64_t)a3
{
  uint64_t v5 = objc_opt_class();
  VKDynamicCast(v5, (uint64_t)self->_textSelectionView);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v6 useInteractionOptions:a3];
}

- (void)applicationWillResignActive:(id)a3
{
  [(VKCImageAnalysisBaseView *)self frameWhenResigningActive];
  if (CGRectIsNull(v6))
  {
    id v4 = [(VKCImageAnalysisBaseView *)self window];
    [v4 frame];
    -[VKCImageAnalysisBaseView setFrameWhenResigningActive:](self, "setFrameWhenResigningActive:");
  }
}

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)VKCImageAnalysisBaseView;
  [(VKCImageAnalysisBaseView *)&v9 layoutSubviews];
  [(VKCImageAnalysisBaseView *)self frameWhenResigningActive];
  if (!CGRectIsNull(v10))
  {
    [(VKCImageAnalysisBaseView *)self frameWhenResigningActive];
    double v4 = v3;
    uint64_t v5 = [(VKCImageAnalysisBaseView *)self window];
    [v5 frame];
    double v7 = v6;

    if (v4 != v7)
    {
      objc_super v8 = [(VKCImageAnalysisBaseView *)self textSelectionView];
      [v8 updateSelectionRectsForWindowChange];

      -[VKCImageAnalysisBaseView setFrameWhenResigningActive:](self, "setFrameWhenResigningActive:", *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((void *)VKImageRecognitionContentModeContext == a6)
  {
    [(VKCImageAnalysisBaseView *)self updateCurrentDisplayedViewContentsRect];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)VKCImageAnalysisBaseView;
    -[VKCImageAnalysisBaseView observeValueForKeyPath:ofObject:change:context:](&v6, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (NSArray)keyPathsAffectingContentMode
{
  return (NSArray *)&unk_1F357DEC8;
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)VKCImageAnalysisBaseView;
  [(VKCImageAnalysisBaseView *)&v3 didMoveToWindow];
  [(VKCImageAnalysisBaseView *)self updateNormalizedVisibleRectIfNecessary];
}

- (void)safeAreaInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)VKCImageAnalysisBaseView;
  [(VKCImageAnalysisBaseView *)&v3 safeAreaInsetsDidChange];
  [(VKCImageAnalysisBaseView *)self updateNormalizedVisibleRectIfNecessary];
}

- (void)setContentsRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v15.receiver = self;
  v15.super_class = (Class)VKCImageAnalysisBaseView;
  -[VKCImageBaseOverlayView setContentsRect:](&v15, sel_setContentsRect_);
  objc_super v8 = [(VKCImageAnalysisBaseView *)self textSelectionView];
  objc_msgSend(v8, "setContentsRect:", x, y, width, height);

  objc_super v9 = [(VKCImageAnalysisBaseView *)self dataDetectorView];
  objc_msgSend(v9, "setContentsRect:", x, y, width, height);

  CGRect v10 = [(VKCImageAnalysisBaseView *)self visualSearchView];
  objc_msgSend(v10, "setContentsRect:", x, y, width, height);

  v11 = [(VKCImageAnalysisBaseView *)self translationView];
  objc_msgSend(v11, "setContentsRect:", x, y, width, height);

  v12 = [(VKCImageAnalysisBaseView *)self regexHighlightViewIfExists];
  objc_msgSend(v12, "setContentsRect:", x, y, width, height);

  v13 = [(VKCImageAnalysisBaseView *)self actionInfoView];
  objc_msgSend(v13, "setContentsRect:", x, y, width, height);

  double v14 = [(VKCImageAnalysisBaseView *)self subjectHighlightView];
  objc_msgSend(v14, "setContentsRect:", x, y, width, height);
}

- (void)setAnalysisResult:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (VKCImageAnalysisResult *)a3;
  if (vk_isInternalBuild()
    && +[VKCInternalSettings disableAllLiveText])
  {
    objc_super v6 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB266000, v6, OS_LOG_TYPE_DEFAULT, "Ignoring setting analysis result on base view due todue to internal setting to disable all live text.", buf, 2u);
    }
  }
  else
  {
    p_analysisResult = (id *)&self->_analysisResult;
    if (self->_analysisResult != v5)
    {
      objc_storeStrong((id *)&self->_analysisResult, a3);
      objc_super v8 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.interaction");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = *p_analysisResult;
        *(_DWORD *)buf = 138412546;
        id v25 = v9;
        __int16 v26 = 2112;
        v27 = self;
        _os_log_impl(&dword_1DB266000, v8, OS_LOG_TYPE_DEFAULT, "Setting Analysis: %@, %@", buf, 0x16u);
      }

      [(VKCImageAnalysisBaseView *)self clearRegexHighlightsAnimated:0 updateActiveTypes:0];
      [(VKCImageAnalysisBaseView *)self updateCurrentDisplayedViewContentsRect];
      id v10 = *p_analysisResult;
      v11 = [(VKCImageAnalysisBaseView *)self dataDetectorView];
      [v11 setRecognitionResult:v10];

      id v12 = *p_analysisResult;
      v13 = [(VKCImageAnalysisBaseView *)self textSelectionView];
      [v13 setRecognitionResult:v12];

      double v14 = [*p_analysisResult visualSearchResult];
      objc_super v15 = [(VKCImageAnalysisBaseView *)self visualSearchView];
      [v15 setVisualSearchResult:v14];

      id v16 = *p_analysisResult;
      v17 = [(VKCImageAnalysisBaseView *)self translationView];
      [v17 setRecognitionResult:v16];

      id v18 = *p_analysisResult;
      double v19 = [(VKCImageAnalysisBaseView *)self regexHighlightViewIfExists];
      [v19 setRecognitionResult:v18];

      id v20 = *p_analysisResult;
      v21 = [(VKCImageAnalysisBaseView *)self subjectHighlightView];
      [v21 setRecognitionResult:v20];

      [(VKCImageAnalysisBaseView *)self configureForActiveTypes:[(VKCImageAnalysisBaseView *)self activeInteractionTypes]];
      [(VKCImageAnalysisBaseView *)self updateNormalizedVisibleRectIfNecessary];
      [(VKCImageAnalysisBaseView *)self sendAnalysisDidChangeAnalyticsEvent];
      [(VKCImageAnalysisBaseView *)self invalidateVisibleTextAreaInfo];
      [(VKCImageAnalysisBaseView *)self tearDownQuickActions];
      [(VKCImageAnalysisBaseView *)self setQuickActions:MEMORY[0x1E4F1CBF0]];
      if (*p_analysisResult) {
        [(VKCImageAnalysisBaseView *)self loadQuickActionsIfNecessary];
      }
      v22 = [(VKCImageAnalysisBaseView *)self backgroundQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __46__VKCImageAnalysisBaseView_setAnalysisResult___block_invoke;
      block[3] = &unk_1E6BF0D18;
      block[4] = self;
      dispatch_async(v22, block);

      [(UIImageView *)self->_debugImageView setHidden:0];
    }
  }
}

uint64_t __46__VKCImageAnalysisBaseView_setAnalysisResult___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) deleteDisposableFiles];
}

- (void)analysisDidUpdateForTypes:(unint64_t)a3
{
  char v3 = a3;
  id v11 = [(VKCImageAnalysisBaseView *)self analysisResult];
  if (v3)
  {
    uint64_t v5 = [(VKCImageAnalysisBaseView *)self textSelectionView];
    [v5 setRecognitionResult:v11];

    objc_super v6 = [(VKCImageAnalysisBaseView *)self translationView];
    [v6 setRecognitionResult:v11];

    double v7 = [(VKCImageAnalysisBaseView *)self regexHighlightViewIfExists];
    [v7 setRecognitionResult:v11];

    [(VKCImageAnalysisBaseView *)self invalidateVisibleTextAreaInfo];
  }
  if ((v3 & 5) != 0)
  {
    objc_super v8 = [(VKCImageAnalysisBaseView *)self dataDetectorView];
    [v8 setRecognitionResult:v11];
  }
  if ((v3 & 0x10) != 0)
  {
    id v9 = [v11 visualSearchResult];
    id v10 = [(VKCImageAnalysisBaseView *)self visualSearchView];
    [v10 setVisualSearchResult:v9];

    goto LABEL_9;
  }
  if ((v3 & 0x15) != 0)
  {
LABEL_9:
    [(VKCImageAnalysisBaseView *)self updateCurrentDisplayedViewContentsRect];
    [(VKCImageAnalysisBaseView *)self configureForActiveTypes:[(VKCImageAnalysisBaseView *)self activeInteractionTypes]];
    [(VKCImageAnalysisBaseView *)self updateNormalizedVisibleRectIfNecessary];
    [(VKCImageAnalysisBaseView *)self updateSubviewsToMatchBounds];
  }
  if ([(VKCImageAnalysisBaseView *)self highlightSelectableItems])
  {
    [(VKCImageAnalysisBaseView *)self setHighlightSelectableItems:0 animated:0];
    [(VKCImageAnalysisBaseView *)self setHighlightSelectableItems:1 animated:1];
  }
  [(VKCImageAnalysisBaseView *)self updateDebugButtonIfNecessary];
}

- (void)setActiveInteractionTypes:(unint64_t)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (self->_activeInteractionTypes != a3)
  {
    [(VKCImageAnalysisBaseView *)self clearRegexHighlightsAnimated:0 updateActiveTypes:0];
    uint64_t v5 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.interaction");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v6 = VKMUIStringForAnalysisInteractionTypes(a3);
      int v7 = 138412546;
      objc_super v8 = v6;
      __int16 v9 = 2112;
      id v10 = self;
      _os_log_impl(&dword_1DB266000, v5, OS_LOG_TYPE_DEFAULT, "Setting Active Interaction Types: %@, %@", (uint8_t *)&v7, 0x16u);
    }
    [(VKCImageAnalysisBaseView *)self updateCurrentDisplayedViewContentsRect];
    [(VKCImageAnalysisBaseView *)self updateNormalizedVisibleRect];
    [(VKCImageAnalysisBaseView *)self configureForActiveTypes:a3];
    [(VKCImageAnalysisBaseView *)self sendActiveInteractionTypesDidChangeAnalyticsEvent];
    [(VKCImageAnalysisBaseView *)self invalidateVisibleTextAreaInfo];
    if (!a3) {
      [(VKCImageAnalysisBaseView *)self setIsShowingTranslation:0];
    }
    [(VKCImageAnalysisBaseView *)self set_hasActiveTextSelection:[(VKCImageAnalysisBaseView *)self hasActiveTextSelection]];
  }
}

- (NSString)text
{
  v2 = [(VKCImageAnalysisBaseView *)self textSelectionView];
  char v3 = [v2 text];

  return (NSString *)v3;
}

- (NSString)selectedText
{
  v2 = [(VKCImageAnalysisBaseView *)self textSelectionView];
  char v3 = [v2 selectedText];

  return (NSString *)v3;
}

- (NSAttributedString)selectedAttributedText
{
  v2 = [(VKCImageAnalysisBaseView *)self textSelectionView];
  char v3 = [v2 selectedAttributedText];

  return (NSAttributedString *)v3;
}

- (NSArray)selectedRanges
{
  v2 = [(VKCImageAnalysisBaseView *)self textSelectionView];
  char v3 = [v2 selectedVKRange];
  double v4 = [v3 nsRangeArray];

  return (NSArray *)v4;
}

- (void)setSelectedRanges:(id)a3
{
  id v5 = +[VKTextRange rangeWithNSRanges:a3];
  double v4 = [(VKCImageAnalysisBaseView *)self textSelectionView];
  [v4 setSelectedVKRange:v5];
}

- (VKTextRange)selectedRange
{
  v2 = [(VKCImageAnalysisBaseView *)self textSelectionView];
  char v3 = [v2 selectedVKRange];

  return (VKTextRange *)v3;
}

- (void)setDataDetectorTypes:(unint64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.interaction");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v6 = VKMUIStringForDDTypes(a3);
    int v8 = 138412546;
    __int16 v9 = v6;
    __int16 v10 = 2112;
    uint64_t v11 = self;
    _os_log_impl(&dword_1DB266000, v5, OS_LOG_TYPE_DEFAULT, "Setting DDTypes: %@, %@", (uint8_t *)&v8, 0x16u);
  }
  self->_dataDetectorTypes = a3;
  [(VKCImageDataDetectorView *)self->_dataDetectorView setDataDetectorTypes:a3];
  int v7 = [(VKCImageAnalysisBaseView *)self textSelectionView];
  [v7 updateHighlightLayerContentIfVisible];
}

- (void)setHighlightSelectableItems:(BOOL)a3
{
}

- (void)setHighlightSelectableItems:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ([(VKCImageAnalysisBaseView *)self highlightSelectableItems] != a3)
  {
    int v7 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.interaction");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = VKMUIStringForBool(v5);
      int v15 = 138412546;
      id v16 = v8;
      __int16 v17 = 2112;
      id v18 = self;
      _os_log_impl(&dword_1DB266000, v7, OS_LOG_TYPE_DEFAULT, "Highlight selectable items enabled: %@, %@", (uint8_t *)&v15, 0x16u);
    }
    [(VKCImageAnalysisBaseView *)self clearRegexHighlightsAnimated:0 updateActiveTypes:0];
    __int16 v9 = [(VKCImageAnalysisBaseView *)self textSelectionView];
    [v9 setHighlightSelectableItems:v5 animated:v4];

    __int16 v10 = [(VKCImageAnalysisBaseView *)self dataDetectorView];
    [v10 setHighlightSelectableItems:v5 animated:v4];

    uint64_t v11 = [(VKCImageAnalysisBaseView *)self quickActions];
    uint64_t v12 = [v11 count];

    if (v12) {
      [(VKCImageAnalysisBaseView *)self sendQuickActionAnalyticsWithDidBecomeVisible:1];
    }
    v13 = [(VKCImageAnalysisBaseView *)self delegate];
    [v13 highlightSelectableItemsDidChangeForBaseOverlayView:self];

    if (!v5)
    {
      if ([(VKCImageAnalysisBaseView *)self isShowingTranslation])
      {
        [(VKCImageAnalysisBaseView *)self setIsShowingTranslation:0];
        double v14 = [(VKCImageAnalysisBaseView *)self translateQuickAction];
        [v14 setSelected:0];
      }
    }
  }
}

- (BOOL)highlightSelectableItems
{
  v2 = [(VKCImageAnalysisBaseView *)self textSelectionView];
  char v3 = [v2 highlightSelectableItems];

  return v3;
}

- (VKCImageSubjectContext)subjectContext
{
  v2 = [(VKCImageAnalysisBaseView *)self subjectHighlightView];
  char v3 = [v2 subjectContext];

  return (VKCImageSubjectContext *)v3;
}

- (BOOL)subjectHighlightActive
{
  v2 = [(VKCImageAnalysisBaseView *)self subjectHighlightView];
  char v3 = [v2 subjectHighlightActive];

  return v3;
}

- (BOOL)isSubjectHighlightAvailable
{
  v2 = [(VKCImageAnalysisBaseView *)self subjectHighlightView];
  char v3 = [v2 subjectContext];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)isSubjectAnalysisComplete
{
  v2 = [(VKCImageAnalysisBaseView *)self subjectHighlightView];
  BOOL v3 = [v2 loadMaskRequestStatus] == 2;

  return v3;
}

- (BOOL)subjectInteractionInProgress
{
  v2 = [(VKCImageAnalysisBaseView *)self subjectHighlightView];
  char v3 = [v2 subjectInteractionInProgress];

  return v3;
}

- (CGRect)subjectFrame
{
  v2 = [(VKCImageAnalysisBaseView *)self subjectHighlightView];
  [v2 subjectFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (unint64_t)subjectRequestStatus
{
  v2 = [(VKCImageAnalysisBaseView *)self subjectHighlightView];
  unint64_t v3 = [v2 loadMaskRequestStatus];

  return v3;
}

- (void)setIdentifierIndex:(int64_t)a3
{
  v11.receiver = self;
  v11.super_class = (Class)VKCImageAnalysisBaseView;
  -[VKCImageBaseOverlayView setIdentifierIndex:](&v11, sel_setIdentifierIndex_);
  double v5 = [(VKCImageAnalysisBaseView *)self translationView];
  [v5 setIdentifierIndex:a3];

  double v6 = [(VKCImageAnalysisBaseView *)self dataDetectorView];
  [v6 setIdentifierIndex:a3];

  double v7 = [(VKCImageAnalysisBaseView *)self textSelectionView];
  [v7 setIdentifierIndex:a3];

  double v8 = [(VKCImageAnalysisBaseView *)self visualSearchView];
  [v8 setIdentifierIndex:a3];

  double v9 = [(VKCImageAnalysisBaseView *)self subjectHighlightView];
  [v9 setIdentifierIndex:a3];

  double v10 = [(VKCImageAnalysisBaseView *)self regexHighlightView];
  [v10 setIdentifierIndex:a3];
}

- (void)setCustomImageForRemoveBackground:(id)a3
{
  id v4 = a3;
  id v5 = [(VKCImageAnalysisBaseView *)self subjectHighlightView];
  [v5 setCustomImageForRemoveBackground:v4];
}

- (UIImage)customImageForRemoveBackground
{
  v2 = [(VKCImageAnalysisBaseView *)self subjectHighlightView];
  unint64_t v3 = [v2 customImageForRemoveBackground];

  return (UIImage *)v3;
}

- (BOOL)usesLightDimmingViewInLightMode
{
  v2 = [(VKCImageAnalysisBaseView *)self subjectHighlightView];
  char v3 = [v2 usesLightDimmingViewInLightMode];

  return v3;
}

- (void)setUsesLightDimmingViewInLightMode:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(VKCImageAnalysisBaseView *)self subjectHighlightView];
  [v4 setUsesLightDimmingViewInLightMode:v3];
}

- (void)beginImageSubjectAnalysisIfNecessary
{
  id v2 = [(VKCImageAnalysisBaseView *)self subjectHighlightView];
  [v2 loadSubjectMaskIfNecessary];
}

- (void)beginImageSubjectAnalysisWithDelayIfNecessary
{
  id v2 = [(VKCImageAnalysisBaseView *)self subjectHighlightView];
  [v2 beginImageSubjectAnalysisWithDelayIfNecessary];
}

- (void)beginImageSubjectAnalysisIfNecessaryWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(VKCImageAnalysisBaseView *)self subjectHighlightView];
  [v5 beginImageSubjectAnalysisIfNecessaryWithCompletion:v4];
}

- (void)loadImageSubjectIfAvailableWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(VKCImageAnalysisBaseView *)self subjectHighlightView];
  [v5 loadImageSubjectIfNecessaryWithCompletion:v4];
}

- (void)loadImageSubjectWithIndexes:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(VKCImageAnalysisBaseView *)self subjectHighlightView];
  [v8 loadImageSubjectWithIndexes:v7 completion:v6];
}

- (id)imageSubjectPathWithIndexes:(id)a3
{
  id v4 = a3;
  id v5 = [(VKCImageAnalysisBaseView *)self subjectHighlightView];
  id v6 = [v5 imageSubjectPathWithIndexes:v4];

  return v6;
}

- (id)generateSubjectImage
{
  return 0;
}

- (void)highlightSubjectAtIndexSet:(id)a3 showCallout:(BOOL)a4 showBurst:(BOOL)a5 burstPoint:(CGPoint)a6 animated:(BOOL)a7
{
  BOOL v7 = a7;
  double y = a6.y;
  double x = a6.x;
  BOOL v10 = a5;
  BOOL v11 = a4;
  id v13 = a3;
  id v14 = [(VKCImageAnalysisBaseView *)self subjectHighlightView];
  objc_msgSend(v14, "highlightSubjectAtIndexSet:showCallout:showBurst:burstPoint:animated:", v13, v11, v10, v7, x, y);
}

- (void)set_photosInfoSingleTapSubjectModeEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(VKCImageAnalysisBaseView *)self subjectHighlightView];
  [v5 setTapToSelectModeEnabled:v3];

  id v6 = [(VKCImageAnalysisBaseView *)self actionInfoView];
  [v6 setVisualSearchCornerViewDisabled:v3];

  [(VKCImageAnalysisBaseView *)self configureForCurrentActiveInteractionTypes];
}

- (BOOL)_photosInfoSingleTapSubjectModeEnabled
{
  id v2 = [(VKCImageAnalysisBaseView *)self subjectHighlightView];
  char v3 = [v2 tapToSelectModeEnabled];

  return v3;
}

- (void)setSubjectViewUserInteractionDisabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(VKCImageAnalysisBaseView *)self subjectHighlightView];
  [v4 setSubjectViewUserInteractionDisabled:v3];
}

- (BOOL)subjectViewUserInteractionDisabled
{
  id v2 = [(VKCImageAnalysisBaseView *)self subjectHighlightView];
  char v3 = [v2 subjectViewUserInteractionDisabled];

  return v3;
}

- (BOOL)inhibitSubjectDimmingAndLiftView
{
  id v2 = [(VKCImageAnalysisBaseView *)self subjectHighlightView];
  char v3 = [v2 inhibitDimmingAndLiftView];

  return v3;
}

- (void)setInhibitSubjectDimmingAndLiftView:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(VKCImageAnalysisBaseView *)self subjectHighlightView];
  [v4 setInhibitDimmingAndLiftView:v3];
}

- (void)loadQuickActionsIfNecessary
{
  BOOL v3 = [(VKCImageAnalysisBaseView *)self analysisResult];
  if (v3)
  {
    objc_initWeak(&location, self);
    id v4 = [(VKCImageAnalysisBaseView *)self translationView];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __55__VKCImageAnalysisBaseView_loadQuickActionsIfNecessary__block_invoke;
    v5[3] = &unk_1E6BF32C0;
    objc_copyWeak(&v8, &location);
    id v6 = v3;
    BOOL v7 = self;
    [v4 checkForTranslationResultsWithCompletion:v5];

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __55__VKCImageAnalysisBaseView_loadQuickActionsIfNecessary__block_invoke(id *a1, int a2, void *a3)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = [WeakRetained analysisResult];
    id v8 = a1[4];

    if (v7 == v8)
    {
      double v9 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.interaction");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v10 = VKMUIStringForBool(a2);
        id v11 = a1[5];
        *(_DWORD *)buf = 138412546;
        v35 = v10;
        __int16 v36 = 2112;
        id v37 = v11;
        _os_log_impl(&dword_1DB266000, v9, OS_LOG_TYPE_DEFAULT, "Translation Check completed with result: %@, %@", buf, 0x16u);
      }
      id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      double v12 = [v6 textSelectionView];
      id v13 = [v12 text];
      char v23 = objc_msgSend(v13, "vk_containsNonWhitespaceCharacters");

      int v25 = [v6 analysisIsAllDataDetectors];
      id v14 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.interaction");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = VKMUIStringForBool(v25);
        id v16 = a1[5];
        *(_DWORD *)buf = 138412546;
        v35 = v15;
        __int16 v36 = 2112;
        id v37 = v16;
        _os_log_impl(&dword_1DB266000, v14, OS_LOG_TYPE_DEFAULT, "Check for is analysis all data detectors completed with result: %@, %@", buf, 0x16u);
      }
      __int16 v26 = [v6 dataDetectorView];
      __int16 v17 = [v26 displayedElements];
      id v18 = [v6 dataDetectorView];
      uint64_t v19 = [v18 unfilteredElements];
      id v20 = [a1[5] analysisResult];
      v21 = [v6 backgroundQueue];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __55__VKCImageAnalysisBaseView_loadQuickActionsIfNecessary__block_invoke_90;
      v28[3] = &unk_1E6BF3298;
      objc_copyWeak(&v31, a1 + 6);
      id v29 = a1[4];
      id v22 = v24;
      id v30 = v22;
      char v32 = a2 & (v25 ^ 1);
      char v33 = v23;
      +[VKCQuickActionsProcessor quickActionsFromElements:v17 unfilteredElements:v19 analysis:v20 queue:v21 completionHandler:v28];

      objc_destroyWeak(&v31);
    }
  }
}

void __55__VKCImageAnalysisBaseView_loadQuickActionsIfNecessary__block_invoke_90(uint64_t a1, void *a2)
{
  id v12 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = [WeakRetained analysisResult];
    id v6 = *(void **)(a1 + 32);

    if (v5 == v6)
    {
      [*(id *)(a1 + 40) addObjectsFromArray:v12];
      if (*(unsigned char *)(a1 + 56))
      {
        id v7 = *(void **)(a1 + 40);
        id v8 = [v4 translateQuickAction];
        [v7 insertObject:v8 atIndex:0];
      }
      else
      {
        if (!*(unsigned char *)(a1 + 57) || [*(id *)(a1 + 40) count]) {
          goto LABEL_6;
        }
        id v11 = *(void **)(a1 + 40);
        id v8 = [v4 copyAllQuickAction];
        [v11 addObject:v8];
      }

LABEL_6:
      double v9 = (void *)[*(id *)(a1 + 40) copy];
      [v4 setQuickActions:v9];

      [v4 sendQuickActionAnalyticsWithDidBecomeVisible:0];
      BOOL v10 = [v4 delegate];
      [v10 quickActionProcessingCompleteForBaseOverlayView:v4];
    }
  }
}

- (BOOL)analysisIsAllDataDetectors
{
  BOOL v3 = [(VKCImageAnalysisBaseView *)self textSelectionView];
  id v4 = [v3 text];

  id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E60]), "initWithIndexesInRange:", 0, objc_msgSend(v4, "length"));
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 1;
  id v6 = [(VKCImageAnalysisBaseView *)self dataDetectorView];
  id v7 = [v6 displayedElements];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __54__VKCImageAnalysisBaseView_analysisIsAllDataDetectors__block_invoke;
  v17[3] = &unk_1E6BF32E8;
  id v8 = v5;
  id v18 = v8;
  [v7 enumerateObjectsUsingBlock:v17];

  double v9 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __54__VKCImageAnalysisBaseView_analysisIsAllDataDetectors__block_invoke_2;
  v13[3] = &unk_1E6BF3310;
  id v16 = &v19;
  id v10 = v4;
  id v14 = v10;
  id v11 = v9;
  id v15 = v11;
  [v8 enumerateRangesUsingBlock:v13];
  LOBYTE(v7) = *((unsigned char *)v20 + 24);

  _Block_object_dispose(&v19, 8);
  return (char)v7;
}

void __54__VKCImageAnalysisBaseView_analysisIsAllDataDetectors__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  VKDynamicCast(v4, (uint64_t)v3);
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  id v5 = v9;
  if (v9)
  {
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = [v9 characterRange];
    objc_msgSend(v6, "removeIndexesInRange:", v7, v8);
    id v5 = v9;
  }
}

uint64_t __54__VKCImageAnalysisBaseView_analysisIsAllDataDetectors__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [*(id *)(a1 + 32) rangeOfCharacterFromSet:*(void *)(a1 + 40)];
  BOOL v11 = result == a2 && v9 == a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v11;
  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) ^ 1;
  return result;
}

- (void)tearDownQuickActions
{
  id v2 = [(VKCImageAnalysisBaseView *)self quickActions];
  [v2 enumerateObjectsUsingBlock:&__block_literal_global_29];
}

uint64_t __48__VKCImageAnalysisBaseView_tearDownQuickActions__block_invoke(uint64_t a1, void *a2)
{
  return [a2 tearDown];
}

- (void)setQuickActions:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (NSArray *)a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * v8++) setDelegate:self];
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  quickActions = self->_quickActions;
  self->_quickActions = v4;
  id v10 = v4;

  BOOL v11 = [(VKCImageAnalysisBaseView *)self actionInfoView];
  [v11 setQuickActions:v10];
}

- (void)setActionInfoCustomFont:(id)a3
{
  objc_storeStrong((id *)&self->_actionInfoCustomFont, a3);
  id v4 = [(VKCImageAnalysisBaseView *)self quickActions];
  [(VKCImageAnalysisBaseView *)self setQuickActions:v4];
}

- (VKCActionInfoButton)copyAllQuickAction
{
  copyAllQuickAction = self->_copyAllQuickAction;
  if (!copyAllQuickAction)
  {
    id v4 = objc_msgSend(MEMORY[0x1E4F42A80], "vk_symbolImageWithName:", @"doc.on.doc");
    uint64_t v5 = VKBundle();
    uint64_t v6 = [v5 localizedStringForKey:@"VK_QUICK_ACTION_TITLE_COPY_ALL" value:@"VK_QUICK_ACTION_TITLE_COPY_ALL" table:@"Localizable"];

    uint64_t v7 = [MEMORY[0x1E4F42A98] configurationWithScale:1];
    uint64_t v8 = +[VKCActionInfoButton buttonWithImage:v4 text:v6];
    uint64_t v9 = self->_copyAllQuickAction;
    self->_copyAllQuickAction = v8;

    [(VKCActionInfoButton *)self->_copyAllQuickAction setPreferredSymbolConfiguration:v7];
    [(VKCActionInfoButton *)self->_copyAllQuickAction setQuickActionType:4];
    [(VKCActionInfoButton *)self->_copyAllQuickAction vk_addTarget:self action:sel_copyButtonPressed_];

    copyAllQuickAction = self->_copyAllQuickAction;
  }
  return copyAllQuickAction;
}

- (VKCActionInfoButton)translateQuickAction
{
  translateQuickAction = self->_translateQuickAction;
  if (!translateQuickAction)
  {
    id v4 = objc_msgSend(MEMORY[0x1E4F42A80], "vk_symbolImageWithName:", @"translate");
    uint64_t v5 = VKBundle();
    uint64_t v6 = [v5 localizedStringForKey:@"VK_QUICK_ACTION_TITLE_TRANSLATE" value:@"VK_QUICK_ACTION_TITLE_TRANSLATE" table:@"Localizable"];

    uint64_t v7 = +[VKCActionInfoButton buttonWithImage:v4 text:v6];
    uint64_t v8 = self->_translateQuickAction;
    self->_translateQuickAction = v7;

    [(VKCActionInfoButton *)self->_translateQuickAction setChangesSelectionAsPrimaryAction:1];
    [(VKCActionInfoButton *)self->_translateQuickAction setQuickActionType:0];
    [(VKCActionInfoButton *)self->_translateQuickAction vk_addTarget:self action:sel_translateButtonPressed_];

    translateQuickAction = self->_translateQuickAction;
  }
  return translateQuickAction;
}

- (void)setActionInfoView:(id)a3
{
  p_actionInfoView = &self->_actionInfoView;
  objc_storeStrong((id *)&self->_actionInfoView, a3);
  id v6 = a3;
  [(VKCImageAnalysisBaseView *)self bounds];
  -[VKCActionInfoView setFrame:](*p_actionInfoView, "setFrame:");
  [(VKCImageBaseOverlayView *)self contentsRect];
  -[VKCActionInfoView setContentsRect:](*p_actionInfoView, "setContentsRect:");
  [(VKCImageBaseOverlayView *)self normalizedVisibleRect];
  -[VKCActionInfoView setNormalizedVisibleRect:](*p_actionInfoView, "setNormalizedVisibleRect:");
  uint64_t v7 = [(VKCImageAnalysisBaseView *)self quickActions];
  [(VKCActionInfoView *)*p_actionInfoView setQuickActions:v7];

  [(VKCImageAnalysisBaseView *)self configureForCurrentActiveInteractionTypes];
}

- (void)resetSelection
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1DB266000, a2, OS_LOG_TYPE_DEBUG, "Resetting Selection for baseView: %@", (uint8_t *)&v2, 0xCu);
}

- (void)setWantsAutomaticContentsRectCalculation:(BOOL)a3
{
  if (self->_wantsAutomaticContentsRectCalculation != a3)
  {
    self->_wantsAutomaticContentsRectCalculation = a3;
    [(VKCImageAnalysisBaseView *)self updateCurrentDisplayedViewContentsRect];
  }
}

- (void)translateButtonPressed:(id)a3
{
  id v4 = a3;
  -[VKCImageAnalysisBaseView setIsShowingTranslation:](self, "setIsShowingTranslation:", [v4 isSelected]);
  int v5 = [v4 isSelected];

  if (v5)
  {
    id v6 = [VKAnalyticsQuickActionEvent alloc];
    uint64_t v7 = [(VKCImageAnalysisBaseView *)self quickActions];
    uint64_t v8 = [v7 count];
    uint64_t v9 = [(VKCImageAnalysisBaseView *)self analysisResult];
    id v10 = [v9 text];
    uint64_t v11 = [v10 length];
    long long v12 = [(VKCImageBaseOverlayView *)self customAnalyticsIdentifier];
    long long v14 = [(VKAnalyticsQuickActionEvent *)v6 initWithQuickActionType:@"Translation" quickActionsCount:v8 textLength:v11 eventType:2 customIdentifier:v12];

    long long v13 = [(VKCImageAnalysisBaseView *)self delegate];
    [v13 baseOverlayView:self analyticsEventDidOccur:v14];
  }
}

- (void)copyButtonPressed:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.interaction");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412290;
    id v16 = self;
    _os_log_impl(&dword_1DB266000, v4, OS_LOG_TYPE_DEFAULT, "Copy All QuickAction activated: %@", (uint8_t *)&v15, 0xCu);
  }

  [(VKCImageAnalysisBaseView *)self copyAllToClipboard];
  [(VKCImageAnalysisBaseView *)self setHighlightSelectableItems:0];
  int v5 = [(VKCImageAnalysisBaseView *)self delegate];
  [v5 baseOverlayViewDidRequestButtonStateUpdate:self];

  id v6 = [VKAnalyticsQuickActionEvent alloc];
  uint64_t v7 = [(VKCImageAnalysisBaseView *)self quickActions];
  uint64_t v8 = [v7 count];
  uint64_t v9 = [(VKCImageAnalysisBaseView *)self analysisResult];
  id v10 = [v9 text];
  uint64_t v11 = [v10 length];
  long long v12 = [(VKCImageBaseOverlayView *)self customAnalyticsIdentifier];
  long long v13 = [(VKAnalyticsQuickActionEvent *)v6 initWithQuickActionType:@"CopyAll" quickActionsCount:v8 textLength:v11 eventType:2 customIdentifier:v12];

  long long v14 = [(VKCImageAnalysisBaseView *)self delegate];
  [v14 baseOverlayView:self analyticsEventDidOccur:v13];
}

- (void)copyAllToClipboard
{
  v17[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(VKCImageAnalysisBaseView *)self textSelectionView];
  id v4 = [v3 attributedText];
  int v5 = v4;
  if (v4) {
    id v6 = v4;
  }
  else {
    id v6 = objc_alloc_init(MEMORY[0x1E4F28B18]);
  }
  uint64_t v7 = v6;

  uint64_t v8 = [(VKCImageAnalysisBaseView *)self textSelectionView];
  uint64_t v9 = [v8 text];

  id v10 = [(VKCImageAnalysisBaseView *)self delegate];
  uint64_t v11 = [v10 baseOverlayView:self updateStringForCopy:v9];

  long long v12 = [(VKCImageAnalysisBaseView *)self delegate];
  long long v13 = [v12 baseOverlayView:self updateAttributedStringForCopy:v7];

  long long v14 = (void *)[objc_alloc(MEMORY[0x1E4F28D78]) initWithObject:v11];
  [v14 registerObject:v13 visibility:0];
  int v15 = [MEMORY[0x1E4F42C50] generalPasteboard];
  v17[0] = v14;
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  [v15 setItemProviders:v16];
}

- (void)selectAll
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.interaction");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = self;
    _os_log_impl(&dword_1DB266000, v3, OS_LOG_TYPE_DEFAULT, "Select All: %@", (uint8_t *)&v5, 0xCu);
  }

  id v4 = [(VKCImageAnalysisBaseView *)self textSelectionView];
  [v4 selectAll:0];
}

- (void)clearSelection
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.interaction");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    uint64_t v7 = self;
    _os_log_impl(&dword_1DB266000, v3, OS_LOG_TYPE_DEFAULT, "Clear Selection: %@", (uint8_t *)&v6, 0xCu);
  }

  id v4 = +[VKTextRange emptyRange];
  int v5 = [(VKCImageAnalysisBaseView *)self textSelectionView];
  [v5 setSelectedVKRange:v4];
}

- (void)setIsShowingTranslation:(BOOL)a3
{
  if (self->_isShowingTranslation != a3)
  {
    BOOL v3 = a3;
    self->_isShowingTranslation = a3;
    int v5 = [(VKCImageAnalysisBaseView *)self translationView];
    int v6 = v5;
    if (v3) {
      [v5 showTranslationOverlay];
    }
    else {
      [v5 hideTranslationOverlay];
    }

    unint64_t v7 = [(VKCImageAnalysisBaseView *)self activeInteractionTypes];
    [(VKCImageAnalysisBaseView *)self configureForActiveTypes:v7];
  }
}

- (void)checkForTranslationResultsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(VKCImageAnalysisBaseView *)self translationView];
  [v5 checkForTranslationResultsWithCompletion:v4];
}

- (void)test_activateTranslationOverlay
{
  BOOL v3 = [(VKCImageAnalysisBaseView *)self quickActions];
  id v4 = [(VKCImageAnalysisBaseView *)self translateQuickAction];
  int v5 = [v3 containsObject:v4];

  if (v5)
  {
    id v6 = [(VKCImageAnalysisBaseView *)self translateQuickAction];
    objc_msgSend(v6, "_vk_performAction");
  }
}

+ (id)keyPathsForValuesAffectingHasActiveTextSelection
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"activeInteractionTypes", @"textSelectionView.selectedRange", 0);
}

- (BOOL)hasActiveTextSelection
{
  if (([(VKCImageAnalysisBaseView *)self activeInteractionTypes] & 1) == 0) {
    return 0;
  }
  id v4 = [(VKCImageAnalysisBaseView *)self textSelectionView];
  int v5 = [v4 selectedVKRange];
  BOOL v3 = [v5 length] != 0;

  return v3;
}

- (void)set_hasActiveTextSelection:(BOOL)a3
{
  if (self->__hasActiveTextSelection != a3)
  {
    self->__hasActiveTextSelection = a3;
    id v4 = [(VKCImageAnalysisBaseView *)self delegate];
    [v4 hasActiveTextSelectionDidChangeForBaseOverlayView:self];
  }
}

- (VKVisibleTextAreaInfo)calculateVisibleTextAreaInfo
{
  uint64_t v49 = 0;
  v50 = (double *)&v49;
  uint64_t v51 = 0x2020000000;
  uint64_t v52 = 0;
  uint64_t v45 = 0;
  v46 = (double *)&v45;
  uint64_t v47 = 0x2020000000;
  uint64_t v48 = 0x7FF0000000000000;
  uint64_t v41 = 0;
  v42 = (double *)&v41;
  uint64_t v43 = 0x2020000000;
  uint64_t v44 = 0;
  uint64_t v37 = 0;
  uint64_t v38 = (double *)&v37;
  uint64_t v39 = 0x2020000000;
  uint64_t v40 = 0;
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x2020000000;
  uint64_t v36 = 0;
  BOOL v5 = +[VKCInternalSettings debugMenuEnabled];
  [(VKCImageBaseOverlayView *)self normalizedVisibleRect];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  long long v14 = [(VKCImageAnalysisBaseView *)self analysisResult];
  int v15 = [v14 normalizedTextLineBoundingBoxes];

  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __56__VKCImageAnalysisBaseView_calculateVisibleTextAreaInfo__block_invoke;
  v31[3] = &unk_1E6BF3338;
  *(double *)&v31[9] = v7;
  *(double *)&v31[10] = v9;
  *(double *)&v31[11] = v11;
  *(double *)&v31[12] = v13;
  BOOL v32 = v5;
  v31[4] = &v49;
  v31[5] = &v45;
  v31[6] = &v41;
  v31[7] = &v37;
  v31[8] = &v33;
  [v15 enumerateObjectsUsingBlock:v31];
  retstr->dataDetectors = 0;
  *(_OWORD *)&retstr->boundingBoxArea = 0u;
  *(_OWORD *)&retstr->maxQuadHeight = 0u;
  [(UIView *)self vk_windowLengthFromViewLength:1.0];
  double v17 = v16;
  [(VKCImageAnalysisBaseView *)self visibleImageRect];
  double v19 = v18 / v11;
  BOOL IsFinite = VKMRectIsFinite(v7, v9, v11, v13);
  double v21 = 0.0;
  double v22 = 0.0;
  if (IsFinite) {
    double v22 = v50[3] / (v11 * v13);
  }
  if (fabs(v22) == INFINITY) {
    double v22 = 0.0;
  }
  double v23 = v22;
  double v24 = v17 * v19;
  retstr->boundingBoxArea = v23;
  double v25 = v46[3];
  if (v25 == INFINITY) {
    double v26 = 0.0;
  }
  else {
    double v26 = v17 * v19 * v25;
  }
  retstr->maxQuadHeight = v24 * v42[3];
  retstr->minQuadHeight = v26;
  unint64_t v27 = v34[3];
  if (v27) {
    double v21 = v24 * (v38[3] / (double)v27);
  }
  retstr->averageQuadHeight = v21;
  uint64_t v28 = [(VKCImageAnalysisBaseView *)self dataDetectorView];
  id v29 = [v28 displayedElements];
  retstr->dataDetectors = [v29 count];

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v49, 8);
  return result;
}

BOOL __56__VKCImageAnalysisBaseView_calculateVisibleTextAreaInfo__block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "vk_rectValue");
  double height = v11.size.height;
  CGRect v12 = CGRectIntersection(v11, *(CGRect *)(a1 + 72));
  double width = v12.size.width;
  double v5 = v12.size.height;
  BOOL result = VKMRectIsFinite(v12.origin.x, v12.origin.y, v12.size.width, v12.size.height);
  if (result)
  {
    *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                            + 24)
                                                                + width * v5;
    if (*(unsigned char *)(a1 + 104))
    {
      uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
      double v8 = *(double *)(v7 + 24);
      if (v8 >= height) {
        double v8 = height;
      }
      *(double *)(v7 + 24) = v8;
      uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
      double v10 = *(double *)(v9 + 24);
      if (v10 < height) {
        double v10 = height;
      }
      *(double *)(v9 + 24) = v10;
      *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = height
                                                                  + *(double *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                              + 24);
      ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    }
  }
  return result;
}

- (void)invalidateVisibleTextAreaInfo
{
  [(VKCImageAnalysisBaseView *)self setVisibleTextAreaInfoIsValid:0];
  [(VKCImageAnalysisBaseView *)self updateAndNotifyAfterValidNormalizedVisibleRectChangeIfNecessary];
}

- (double)totalQuadTextArea
{
  int v2 = [(VKCImageAnalysisBaseView *)self analysisResult];
  [v2 totalQuadTextArea];
  double v4 = v3;

  return v4;
}

- (double)totalBoundingBoxTextArea
{
  int v2 = [(VKCImageAnalysisBaseView *)self analysisResult];
  [v2 totalBoundingBoxTextArea];
  double v4 = v3;

  return v4;
}

- (NSArray)rawRectangleObservations
{
  int v2 = [(VKCImageAnalysisBaseView *)self analysisResult];
  double v3 = [v2 rectangleObservations];

  return (NSArray *)v3;
}

- (NSArray)filteredNormalizedRectangleQuads
{
  int v2 = [(VKCImageAnalysisBaseView *)self analysisResult];
  double v3 = [v2 filteredNormalizedRectangleQuads];

  return (NSArray *)v3;
}

- (NSArray)filteredRectangleQuads
{
  [(VKCImageBaseOverlayView *)self contentsRect];
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  CGRect v11 = [(VKCImageAnalysisBaseView *)self filteredNormalizedRectangleQuads];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __50__VKCImageAnalysisBaseView_filteredRectangleQuads__block_invoke;
  v14[3] = &unk_1E6BF3360;
  v14[4] = self;
  v14[5] = v4;
  v14[6] = v6;
  v14[7] = v8;
  v14[8] = v10;
  CGRect v12 = objc_msgSend(v11, "vk_compactMap:", v14);

  return (NSArray *)v12;
}

uint64_t __50__VKCImageAnalysisBaseView_filteredRectangleQuads__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "quadByConvertingFromNormalizedRectToView:contentsRect:", *(void *)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)setViewForObservingContentMode:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewForObservingContentMode);

  if (WeakRetained != v4)
  {
    uint64_t v6 = [(VKCImageAnalysisBaseView *)self keyPathsAffectingContentMode];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __59__VKCImageAnalysisBaseView_setViewForObservingContentMode___block_invoke;
    v10[3] = &unk_1E6BF3270;
    v10[4] = self;
    [v6 enumerateObjectsUsingBlock:v10];
    objc_storeWeak((id *)&self->_viewForObservingContentMode, v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __59__VKCImageAnalysisBaseView_setViewForObservingContentMode___block_invoke_2;
    v9[3] = &unk_1E6BF3270;
    v9[4] = self;
    [v6 enumerateObjectsUsingBlock:v9];
    id v7 = objc_loadWeakRetained((id *)&self->_viewForObservingContentMode);
    uint64_t v8 = [v7 layer];
    [(VKCImageAnalysisBaseView *)self setLayerForObservingContentsRect:v8];

    [(VKCImageAnalysisBaseView *)self updateCurrentDisplayedViewContentsRect];
  }
}

void __59__VKCImageAnalysisBaseView_setViewForObservingContentMode___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (id *)(*(void *)(a1 + 32) + 600);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained removeObserver:*(void *)(a1 + 32) forKeyPath:v4 context:VKImageRecognitionContentModeContext];
}

void __59__VKCImageAnalysisBaseView_setViewForObservingContentMode___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = (id *)(*(void *)(a1 + 32) + 600);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained addObserver:*(void *)(a1 + 32) forKeyPath:v4 options:0 context:VKImageRecognitionContentModeContext];
}

- (void)setLayerForObservingContentsRect:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layerForObservingContentsRect);

  if (WeakRetained != obj)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_layerForObservingContentsRect);
    [v5 removeObserver:self forKeyPath:@"contentsRect" context:VKImageRecognitionContentModeContext];

    id v6 = objc_storeWeak((id *)&self->_layerForObservingContentsRect, obj);
    [obj addObserver:self forKeyPath:@"contentsRect" options:0 context:VKImageRecognitionContentModeContext];
  }
}

- (void)setLongPressDataDetectorsInTextMode:(BOOL)a3
{
  self->_longPressDataDetectorsInTextMode = a3;
  [(VKCImageAnalysisBaseView *)self configureForCurrentActiveInteractionTypes];
}

- (void)setFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VKCImageAnalysisBaseView;
  -[VKCImageAnalysisBaseView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(VKCImageAnalysisBaseView *)self updateSubviewsToMatchBounds];
  [(VKCImageAnalysisBaseView *)self updateNormalizedVisibleRectIfNecessary];
  [(VKCImageAnalysisBaseView *)self updateCurrentDisplayedViewContentsRect];
  [(VKCImageAnalysisBaseView *)self invalidateVisibleTextAreaInfo];
}

- (void)setBounds:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VKCImageAnalysisBaseView;
  -[VKCImageAnalysisBaseView setBounds:](&v4, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(VKCImageAnalysisBaseView *)self updateSubviewsToMatchBounds];
}

- (void)updateSubviewsToMatchBounds
{
  [(VKCImageAnalysisBaseView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  CGRect v11 = [(VKCImageAnalysisBaseView *)self textSelectionView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  CGRect v12 = [(VKCImageAnalysisBaseView *)self dataDetectorView];
  objc_msgSend(v12, "setFrame:", v4, v6, v8, v10);

  double v13 = [(VKCImageAnalysisBaseView *)self visualSearchView];
  objc_msgSend(v13, "setFrame:", v4, v6, v8, v10);

  long long v14 = [(VKCImageAnalysisBaseView *)self translationView];
  objc_msgSend(v14, "setFrame:", v4, v6, v8, v10);

  int v15 = [(VKCImageAnalysisBaseView *)self regexHighlightViewIfExists];
  objc_msgSend(v15, "setFrame:", v4, v6, v8, v10);

  double v16 = [(VKCImageAnalysisBaseView *)self subjectHighlightView];
  objc_msgSend(v16, "setFrame:", v4, v6, v8, v10);

  double v17 = [(VKCImageAnalysisBaseView *)self actionInfoView];
  double v18 = [v17 superview];

  if (v18 == self)
  {
    id v19 = [(VKCImageAnalysisBaseView *)self actionInfoView];
    objc_msgSend(v19, "setFrame:", v4, v6, v8, v10);
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  double v8 = -[VKCImageAnalysisBaseView hitTest:withEvent:usingSubviewsOf:](self, "hitTest:withEvent:usingSubviewsOf:", v7, self->_actionInfoView, x, y);
  if (!v8)
  {
    if (![(VKCImageAnalysisBaseView *)self subjectHighlightActive]) {
      goto LABEL_9;
    }
    double v8 = [(VKCImageAnalysisBaseView *)self subjectHighlightView];
    if (([(VKCImageAnalysisBaseView *)self activeInteractionTypes] & 4) != 0)
    {
      double v9 = [(VKCImageAnalysisBaseView *)self visualSearchView];
      uint64_t v10 = -[VKCImageAnalysisBaseView hitTest:withEvent:usingSubviewsOf:](self, "hitTest:withEvent:usingSubviewsOf:", v7, v9, x, y);
      CGRect v11 = (void *)v10;
      if (v10) {
        CGRect v12 = (void *)v10;
      }
      else {
        CGRect v12 = v8;
      }
      id v13 = v12;

      double v8 = v13;
    }
    if (!v8)
    {
LABEL_9:
      long long v14 = [(VKCImageAnalysisBaseView *)self translationView];
      double v8 = -[VKCImageAnalysisBaseView hitTest:withEvent:usingSubviewsOf:](self, "hitTest:withEvent:usingSubviewsOf:", v7, v14, x, y);

      if (!v8)
      {
        int v15 = [(VKCImageAnalysisBaseView *)self dataDetectorView];
        double v8 = -[VKCImageAnalysisBaseView hitTest:withEvent:usingSubviewsOf:](self, "hitTest:withEvent:usingSubviewsOf:", v7, v15, x, y);

        if (!v8)
        {
          double v16 = [(VKCImageAnalysisBaseView *)self visualSearchView];
          double v8 = -[VKCImageAnalysisBaseView hitTest:withEvent:usingSubviewsOf:](self, "hitTest:withEvent:usingSubviewsOf:", v7, v16, x, y);

          if (!v8)
          {
            double v17 = [(VKCImageAnalysisBaseView *)self regexHighlightViewIfExists];
            double v8 = -[VKCImageAnalysisBaseView hitTest:withEvent:usingSubviewsOf:](self, "hitTest:withEvent:usingSubviewsOf:", v7, v17, x, y);

            if (!v8)
            {
              double v18 = [(VKCImageAnalysisBaseView *)self textSelectionView];
              -[VKCImageAnalysisBaseView convertPoint:toView:](self, "convertPoint:toView:", v18, x, y);
              double v20 = v19;
              double v22 = v21;

              double v23 = [(VKCImageAnalysisBaseView *)self textSelectionView];
              double v8 = objc_msgSend(v23, "hitTest:withEvent:", v7, v20, v22);

              BOOL v24 = -[VKCImageAnalysisBaseView containsTextAtPoint:](self, "containsTextAtPoint:", x, y);
              BOOL v25 = [(VKCImageAnalysisBaseView *)self hasActiveTextSelection];
              BOOL v26 = -[VKCImageAnalysisBaseView longPressDataDetectorsInTextMode](self, "longPressDataDetectorsInTextMode")&& -[VKCImageAnalysisBaseView dataDetectorTypeAtPoint:](self, "dataDetectorTypeAtPoint:", x, y) != 0;
              char v27 = [(VKCImageAnalysisBaseView *)self activeInteractionTypes];
              if (!v24 && !v26)
              {
                char v28 = v27;
                if ((!v25 || vk_isSeedBuild())
                  && (v28 & 8) != 0
                  && ![(VKCImageAnalysisBaseView *)self subjectViewUserInteractionDisabled])
                {
                  if ([(VKCImageAnalysisBaseView *)self isSubjectHighlightAvailable]) {
                    BOOL v29 = -[VKCImageAnalysisBaseView containsImageSubjectAtPoint:](self, "containsImageSubjectAtPoint:", x, y);
                  }
                  else {
                    BOOL v29 = 0;
                  }
                  id v30 = [(VKCImageAnalysisBaseView *)self subjectHighlightView];
                  char v31 = [v30 isLivePhoto];

                  if ((v31 & 1) != 0 || v29)
                  {
                    uint64_t v32 = [(VKCImageAnalysisBaseView *)self subjectHighlightView];

                    double v8 = (void *)v32;
                  }
                  if (!v8)
                  {
                    if (vk_isSeedBuild() && [v7 buttonMask] == 2)
                    {
                      double v8 = [(VKCImageAnalysisBaseView *)self subjectHighlightView];
                    }
                    else
                    {
                      double v8 = 0;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  uint64_t v33 = [(VKCImageAnalysisBaseView *)self debugImageView];
  if (v33)
  {
    -[VKCImageAnalysisBaseView convertPoint:toView:](self, "convertPoint:toView:", v33, x, y);
    CGFloat v35 = v34;
    CGFloat v37 = v36;
    [v33 bounds];
    v41.double x = v35;
    v41.double y = v37;
    if (CGRectContainsPoint(v42, v41))
    {
      id v38 = v33;

      double v8 = v38;
    }
  }

  return v8;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4 usingSubviewsOf:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    -[VKCImageAnalysisBaseView convertPoint:toView:](self, "convertPoint:toView:", v10, x, y);
    objc_msgSend(v10, "hitTest:withEvent:", v9);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    if (v11 != v10) {
      goto LABEL_5;
    }
  }
  id v11 = 0;
LABEL_5:

  return v11;
}

- (void)updateCurrentDisplayedViewContentsRect
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  double v3 = [(VKCImageAnalysisBaseView *)self analysisResult];

  if (v3)
  {
    [(VKCImageAnalysisBaseView *)self bounds];
    if ((VKMSizeIsEmptyOrHasNanOrInf(v4, v5) & 1) == 0)
    {
      if ([(VKCImageAnalysisBaseView *)self wantsAutomaticContentsRectCalculation])
      {
        double v6 = [(VKCImageAnalysisBaseView *)self viewForObservingContentMode];
        if (v6)
        {
          [(VKCImageAnalysisBaseView *)self bounds];
          double v8 = v7;
          double v10 = v9;
          double v12 = v11;
          double v14 = v13;
          uint64_t v15 = [v6 contentMode];
          double v16 = [(VKCImageAnalysisBaseView *)self analysisResult];
          [v16 imageSize];
          double v18 = v17;
          double v20 = v19;
          double v21 = [(VKCImageAnalysisBaseView *)self analysisResult];
          double v22 = [v21 request];
          +[VKCImageContentRectCalculator unitContentsRectForBounds:contentMode:imageSize:orientation:view:](VKCImageContentRectCalculator, "unitContentsRectForBounds:contentMode:imageSize:orientation:view:", v15, [v22 imageOrientation], v6, v8, v10, v12, v14, v18, v20);
          double v24 = v23;
          double v26 = v25;
          double v28 = v27;
          double v30 = v29;
        }
        else
        {
          double v24 = 0.0;
          double v26 = 0.0;
          double v28 = 1.0;
          double v30 = 1.0;
        }
        -[VKCImageAnalysisBaseView setContentsRect:](self, "setContentsRect:", v24, v26, v28, v30);
      }
      else
      {
        char v31 = [(VKCImageAnalysisBaseView *)self delegate];
        int v32 = [v31 topLevelImplementsContentsRectDelegateForBaseView:self];

        if (v32)
        {
          uint64_t v33 = [(VKCImageAnalysisBaseView *)self delegate];
          [v33 contentsRectForImageRecognitionBaseView:self];
          double v35 = v34;
          double v37 = v36;
          double v39 = v38;
          double v41 = v40;

          CGRect v42 = self;
          double v43 = v35;
          double v44 = v37;
          double v45 = v39;
          double v46 = v41;
        }
        else
        {
          if (![(VKCImageAnalysisBaseView *)self didLogContentsRectError])
          {
            [(VKCImageAnalysisBaseView *)self setDidLogContentsRectError:1];
            uint64_t v47 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.interaction");
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
            {
              int v49 = 138412290;
              v50 = self;
              _os_log_impl(&dword_1DB266000, v47, OS_LOG_TYPE_DEFAULT, "Interaction does not want automaticContentsRectCalculation, but did not implement contentsRectFor...... Falling back to Unit Rect: %@", (uint8_t *)&v49, 0xCu);
            }
          }
          double v43 = 0.0;
          double v44 = 0.0;
          double v45 = 1.0;
          double v46 = 1.0;
          CGRect v42 = self;
        }
        -[VKCImageAnalysisBaseView setContentsRect:](v42, "setContentsRect:", v43, v44, v45, v46);
      }
      uint64_t v48 = [(VKCImageAnalysisBaseView *)self textSelectionView];
      [v48 updateSelectionRectsForBoundsChange];
    }
  }
  [(VKCImageAnalysisBaseView *)self updateDebugButtonIfNecessary];
}

- (void)_logVisualSearchHintAvailabilityUpdate
{
  char v3 = [(VKCImageAnalysisBaseView *)self activeInteractionTypes];
  if ([(VKCImageAnalysisBaseView *)self isAnalysisVisible] && (v3 & 4) != 0)
  {
    [(VKCImageAnalysisBaseView *)self sendVisualSearchAnalyticsWithDidBecomeActive:1];
    double v4 = [(VKCImageAnalysisBaseView *)self delegate];
    char v5 = [v4 automaticallyShowVisualSearchResults];

    if (v5) {
      return;
    }
    id v8 = +[VKImageAnalyzerMadInterface sharedInterface];
    double v6 = [(VKCImageAnalysisBaseView *)self analysisResult];
    double v7 = [v6 request];
    [v8 didShowVisualSearchHintsForRequest:v7 invocationType:3];
  }
  else
  {
    [(VKCImageAnalysisBaseView *)self sendVisualSearchAnalyticsWithDidBecomeActive:0];
    id v8 = +[VKImageAnalyzerMadInterface sharedInterface];
    [v8 didLeaveVisualSearchHints];
  }
}

- (void)_updateAnalysisVisibility
{
  char v3 = [(VKCImageAnalysisBaseView *)self superview];
  double v4 = [v3 superview];

  if (v4)
  {
    do
    {
      id v23 = [v3 superview];

      char v5 = [v23 superview];

      id v6 = v23;
      char v3 = v23;
    }
    while (v5);
  }
  else
  {
    id v6 = v3;
  }
  id v24 = v6;
  [(VKCImageAnalysisBaseView *)self bounds];
  double v11 = VKMCenterOfRect(v7, v8, v9, v10);
  -[VKCImageAnalysisBaseView convertRect:toView:](self, "convertRect:toView:", v24, v11 + -20.0, v12 + -20.0, 40.0, 40.0);
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  [v24 bounds];
  v27.origin.double x = v14;
  v27.origin.double y = v16;
  v27.size.double width = v18;
  v27.size.double height = v20;
  if (CGRectContainsRect(v26, v27))
  {
    double v21 = [(VKCImageAnalysisBaseView *)self analysisResult];
    BOOL v22 = v21 != 0;

    if (v22 == [(VKCImageAnalysisBaseView *)self isAnalysisVisible]) {
      goto LABEL_12;
    }
  }
  else
  {
    if (![(VKCImageAnalysisBaseView *)self isAnalysisVisible]) {
      goto LABEL_12;
    }
    BOOL v22 = 0;
  }
  [(VKCImageAnalysisBaseView *)self setIsAnalysisVisible:v22];
  if ((self->_activeInteractionTypes & 4) != 0) {
    [(VKCImageAnalysisBaseView *)self _logVisualSearchHintAvailabilityUpdate];
  }
LABEL_12:
}

- (CGRect)visibleImageRect
{
  [(VKCImageAnalysisBaseView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(VKCImageBaseOverlayView *)self contentsRect];
  VKMRectFromNormalizedSubrect(v4, v6, v8, v10, v11, v12, v13, v14);
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  [(VKCImageBaseOverlayView *)self normalizedVisibleRect];
  VKMRectFromNormalizedSubrect(v16, v18, v20, v22, v23, v24, v25, v26);
  uint64_t v28 = v27;
  uint64_t v30 = v29;
  uint64_t v32 = v31;
  uint64_t v34 = v33;
  CGFloat v35 = v16;
  CGFloat v36 = v18;
  CGFloat v37 = v20;
  CGFloat v38 = v22;
  return CGRectIntersection(*(CGRect *)&v35, *(CGRect *)&v28);
}

- (void)updateNormalizedVisibleRectIfNecessary
{
  unint64_t v4 = [(VKCImageAnalysisBaseView *)self activeInteractionTypes];
  BOOL v5 = [(VKCImageAnalysisBaseView *)self stringHighlightsActive];
  BOOL v6 = v5;
  BOOL clientDidSetNormalizedRect = self->_clientDidSetNormalizedRect;
  if (self->_clientDidSetNormalizedRect)
  {
    CGFloat v8 = [(VKCImageAnalysisBaseView *)self actionInfoView];
    int v2 = v8;
    if (!v8 || !((v4 >> 2) & 1 | v6) && (v4 & 1) == 0 && (v4 & 8) == 0)
    {

      goto LABEL_16;
    }
  }
  else if (!((v4 >> 2) & 1 | v5) && (v4 & 1) == 0 && (v4 & 8) == 0)
  {
LABEL_16:
    [(VKCImageAnalysisBaseView *)self _updateAnalysisVisibility];
    return;
  }
  double v9 = [(VKCImageAnalysisBaseView *)self window];

  if (clientDidSetNormalizedRect) {
  if (!v9)
  }
    goto LABEL_16;
  [(VKCImageAnalysisBaseView *)self updateNormalizedVisibleRect];
}

- (void)updateNormalizedVisibleRect
{
  double v3 = [(VKCImageAnalysisBaseView *)self scrollViewToObserve];
  CGFloat v12 = v3;
  if (!v3) {
    goto LABEL_8;
  }
  [v3 zoomScale];
  double v5 = v4;
  [v12 minimumZoomScale];
  double v7 = v6;
  [v12 maximumZoomScale];
  CGFloat v8 = v12;
  if (v5 <= v9 && v5 >= v7)
  {
    if (v5 != v7 || (v11 = [v12 isZoomBouncing], CGFloat v8 = v12, (v11 & 1) == 0))
    {
LABEL_8:
      [(VKCImageAnalysisBaseView *)self calculateNormalizedVisibleRect];
      -[VKCImageAnalysisBaseView setNormalizedVisibleRect:](self, "setNormalizedVisibleRect:");
      [(VKCImageAnalysisBaseView *)self _updateAnalysisVisibility];
      CGFloat v8 = v12;
    }
  }
}

- (void)setNormalizedVisibleRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (VKMRectIsFinite(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height))
  {
    [(VKCImageBaseOverlayView *)self normalizedVisibleRect];
    v17.origin.double x = x;
    v17.origin.double y = y;
    v17.size.double width = width;
    v17.size.double height = height;
    if (!CGRectEqualToRect(v16, v17))
    {
      v15.receiver = self;
      v15.super_class = (Class)VKCImageAnalysisBaseView;
      -[VKCImageBaseOverlayView setNormalizedVisibleRect:](&v15, sel_setNormalizedVisibleRect_, x, y, width, height);
      CGFloat v8 = [(VKCImageAnalysisBaseView *)self textSelectionView];
      objc_msgSend(v8, "setNormalizedVisibleRect:", x, y, width, height);

      double v9 = [(VKCImageAnalysisBaseView *)self dataDetectorView];
      objc_msgSend(v9, "setNormalizedVisibleRect:", x, y, width, height);

      CGFloat v10 = [(VKCImageAnalysisBaseView *)self regexHighlightViewIfExists];
      objc_msgSend(v10, "setNormalizedVisibleRect:", x, y, width, height);

      char v11 = [(VKCImageAnalysisBaseView *)self visualSearchView];
      objc_msgSend(v11, "setNormalizedVisibleRect:", x, y, width, height);

      CGFloat v12 = [(VKCImageAnalysisBaseView *)self translationView];
      objc_msgSend(v12, "setNormalizedVisibleRect:", x, y, width, height);

      CGFloat v13 = [(VKCImageAnalysisBaseView *)self actionInfoView];
      objc_msgSend(v13, "setNormalizedVisibleRect:", x, y, width, height);

      CGFloat v14 = [(VKCImageAnalysisBaseView *)self subjectHighlightView];
      objc_msgSend(v14, "setNormalizedVisibleRect:", x, y, width, height);

      [(VKCImageAnalysisBaseView *)self setVisibleTextAreaInfoIsValid:0];
    }
  }
  [(VKCImageAnalysisBaseView *)self updateAndNotifyAfterValidNormalizedVisibleRectChangeIfNecessary];
}

- (void)updateAndNotifyAfterValidNormalizedVisibleRectChangeIfNecessary
{
  [(VKCImageAnalysisBaseView *)self bounds];
  if (VKMRectHasArea(v3, v4, v5, v6))
  {
    double v7 = [(VKCImageAnalysisBaseView *)self textSelectionView];
    [v7 bounds];
    BOOL HasArea = VKMRectHasArea(v8, v9, v10, v11);

    if (HasArea)
    {
      [(VKCImageAnalysisBaseView *)self updateAndNotifyAfterValidNormalizedVisibleRectChange];
    }
  }
}

- (void)updateAndNotifyAfterValidNormalizedVisibleRectChange
{
  [(VKCImageAnalysisBaseView *)self setVisibleTextAreaInfoIsValid:1];
  [(VKCImageAnalysisBaseView *)self calculateVisibleTextAreaInfo];
  v5[0] = v7;
  v5[1] = v8;
  uint64_t v6 = v9;
  [(VKCImageAnalysisBaseView *)self setVisibleTextAreaInfo:v5];
  double v3 = [(VKCImageAnalysisBaseView *)self delegate];
  [(VKCImageBaseOverlayView *)self normalizedVisibleRect];
  objc_msgSend(v3, "baseOverlayView:didUpdateToNormalizedVisibleRect:", self);

  [(VKCImageAnalysisBaseView *)self updateDebugButtonIfNecessary];
  double v4 = [(VKCImageAnalysisBaseView *)self actionInfoView];
  objc_msgSend(v4, "vk_setNeedsLayout");
}

- (void)updateDebugButtonIfNecessary
{
  [(VKCImageAnalysisBaseView *)self visibleImageRect];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  uint64_t v11 = [(VKCImageAnalysisBaseView *)self debugImageView];
  if (!v11) {
    return;
  }
  id v74 = (id)v11;
  uint64_t v12 = [(VKCImageAnalysisBaseView *)self window];
  if (v12)
  {
    CGFloat v13 = (void *)v12;
    BOOL HasArea = VKMRectHasArea(v4, v6, v8, v10);

    if (!HasArea) {
      return;
    }
    objc_super v15 = [(VKCImageAnalysisBaseView *)self analysisResult];
    if (v15) {
      [MEMORY[0x1E4F428B8] greenColor];
    }
    else {
    CGRect v16 = [MEMORY[0x1E4F428B8] orangeColor];
    }

    objc_msgSend(v16, "vk_colorWith80PercentOpacity");
    id v74 = (id)objc_claimAutoreleasedReturnValue();

    [(UIView *)self vk_viewLengthFromWindowLength:1.0];
    double v18 = v17;
    double v19 = [(VKCImageAnalysisBaseView *)self traitCollection];
    if (objc_msgSend(v19, "vk_hasCompactSize")) {
      double v20 = 22.0;
    }
    else {
      double v20 = 30.0;
    }

    [(UIView *)self vk_viewLengthFromWindowLength:v20];
    double v22 = v21;
    VKMRectWithCenterAndSize(*MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v21);
    double v24 = v23;
    double v26 = v25;
    double v27 = VKMAddPoints(v22 * 0.5, v22 * 0.5, v4);
    double v29 = v28;
    uint64_t v30 = [(VKCImageAnalysisBaseView *)self debugImageView];
    objc_msgSend(v30, "setVk_contentTintColor:", v74);
    if (!VKMRectIsFinite(v27, v29, v24, v26)) {
      goto LABEL_35;
    }
    v71 = v30;
    objc_msgSend(v30, "setFrame:", v27, v29, v24, v26);
    uint64_t v31 = [(VKCImageAnalysisBaseView *)self analysisResult];
    uint64_t v32 = (void *)MEMORY[0x1E4F28E78];
    v72 = [(VKCImageAnalysisBaseView *)self analysisResult];
    uint64_t v33 = [v72 request];
    uint64_t v34 = [v33 requestID];
    CGFloat v35 = [v31 textDataDetectorElements];
    uint64_t v36 = [v35 count];
    CGFloat v37 = [v31 mrcDataDetectorElements];
    uint64_t v38 = [v37 count];
    v73 = v31;
    double v39 = [v31 visualSearchResult];
    double v40 = [v39 resultItems];
    double v41 = objc_msgSend(v32, "stringWithFormat:", @"ID:%d DD:%lu MRC:%lu VS:%lu ", v34, v36, v38, objc_msgSend(v40, "count"));

    char v42 = [(VKCImageAnalysisBaseView *)self activeInteractionTypes];
    [v41 appendString:@"["];
    if (v42)
    {
      [v41 appendString:@"T,"];
      if ((v42 & 2) == 0)
      {
LABEL_14:
        if ((v42 & 4) == 0) {
          goto LABEL_15;
        }
        goto LABEL_29;
      }
    }
    else if ((v42 & 2) == 0)
    {
      goto LABEL_14;
    }
    [v41 appendString:@"DD,"];
    if ((v42 & 4) == 0)
    {
LABEL_15:
      if ((v42 & 8) == 0) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }
LABEL_29:
    [v41 appendString:@"VS,"];
    if ((v42 & 8) == 0)
    {
LABEL_17:
      if (objc_msgSend(v41, "characterAtIndex:", objc_msgSend(v41, "length") - 1)) {
        objc_msgSend(v41, "replaceCharactersInRange:withString:", objc_msgSend(v41, "length") - 1, 1, &stru_1F35566F8);
      }
      [v41 appendString:@"] "];
      double v43 = [(VKCImageAnalysisBaseView *)self analysisResult];
      double v44 = [v43 sourceDocument];

      if (v44) {
        [v41 appendString:@"🔤"];
      }
      double v45 = [(VKCImageAnalysisBaseView *)self analysisResult];
      double v46 = [v45 mrcDataDetectorElements];

      if (v46) {
        [v41 appendString:@"🎛"];
      }
      uint64_t v47 = [(VKCImageAnalysisBaseView *)self analysisResult];
      uint64_t v48 = [v47 visualSearchResult];

      if (v48) {
        [v41 appendString:@"🏞"];
      }
      int v49 = [(VKCImageAnalysisBaseView *)self subjectContext];
      uint64_t v50 = [v49 subjectCount];

      if (v50)
      {
        uint64_t v51 = @"😻";
        uint64_t v30 = v71;
      }
      else
      {
        uint64_t v30 = v71;
        if (![(VKCImageAnalysisBaseView *)self isSubjectAnalysisComplete])
        {
LABEL_34:
          uint64_t v52 = [(VKCImageAnalysisBaseView *)self textInfoView];
          [v52 setText:v41];
          v53 = [MEMORY[0x1E4F42A30] systemFontOfSize:v26 * 0.5];
          [v52 setFont:v53];

          [v52 sizeToFit];
          [v52 bounds];
          double v55 = v54;
          [v30 bounds];
          double v57 = v56;
          double v60 = v58 + v59;
          VKMCenterOfRect(v58 + v59, v56, v59, v61);
          double v63 = v57 + v62 - v55 * 0.5;
          [v52 frame];
          double v65 = v64;
          double v67 = v66;
          double v68 = v66 / 3.0;
          v69 = [v52 layer];
          [v69 setCornerRadius:v68];

          objc_msgSend(v52, "setFrame:", v60, v63, v65, v67);
LABEL_35:
          v70 = [v30 layer];
          [v70 setShadowRadius:v18 + v18];

          goto LABEL_36;
        }
        uint64_t v51 = @"😿";
      }
      [v41 appendString:v51];
      goto LABEL_34;
    }
LABEL_16:
    [v41 appendString:@"S,"];
    goto LABEL_17;
  }
LABEL_36:
}

- (void)debugButtonDidTap:(id)a3
{
  id v6 = [(VKCImageAnalysisBaseView *)self debugMenuProvider];
  double v4 = [(VKCImageAnalysisBaseView *)self debugImageView];
  double v5 = [(VKCImageAnalysisBaseView *)self debugImageView];
  [v5 bounds];
  objc_msgSend(v6, "presentDebugMenuProvider:fromView:rect:", self, v4);
}

- (CGRect)calculateNormalizedVisibleRect
{
  [(VKCImageBaseOverlayView *)self normalizedVisibleRect];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v12 = [(VKCImageAnalysisBaseView *)self superview];
  if (v12)
  {
    CGFloat v13 = (void *)v12;
    do
    {
      uint64_t v14 = objc_opt_class();
      objc_super v15 = VKDynamicCast(v14, (uint64_t)v13);
      CGRect v16 = v15;
      if (v15)
      {
        [v15 zoomScale];
        if (v17 != 1.0
          && vabdd_f64(1.0, v17) >= fabs(v17 * 0.000000999999997)
          && [v16 contentInsetAdjustmentBehavior] == 2)
        {
          [v11 addObject:v16];
        }
      }
      uint64_t v18 = [v13 superview];

      CGFloat v13 = (void *)v18;
    }
    while (v18);
  }
  double v128 = v10;
  double v131 = v8;
  double v134 = v6;
  double v137 = v4;
  double v19 = [(VKCImageAnalysisBaseView *)self superview];
  [(VKCImageAnalysisBaseView *)self bounds];
  -[VKCImageAnalysisBaseView convertRect:toView:](self, "convertRect:toView:", 0);
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  CGFloat v27 = v26;
  double v28 = [(VKCImageAnalysisBaseView *)self window];
  objc_msgSend(v28, "vk_safeAreaBounds");
  CGFloat v30 = v29;
  CGFloat v32 = v31;
  CGFloat v34 = v33;
  CGFloat v36 = v35;

  v140.origin.double x = v21;
  v140.origin.double y = v23;
  v140.size.double width = v25;
  v140.size.double height = v27;
  v151.origin.double x = v30;
  v151.origin.double y = v32;
  v151.size.double width = v34;
  v151.size.double height = v36;
  CGRect v141 = CGRectIntersection(v140, v151);
  double x = v141.origin.x;
  double y = v141.origin.y;
  double width = v141.size.width;
  double height = v141.size.height;
  double v41 = [(VKCImageAnalysisBaseView *)self window];
  if (VKMRectHasArea(x, y, width, height))
  {
    if (v19)
    {
      CGFloat v42 = x;
      CGFloat v43 = y;
      CGFloat v44 = width;
      CGFloat v45 = height;
      while (1)
      {
        double v46 = [v11 lastObject];

        if (v46 == self) {
          [v11 removeLastObject];
        }
        uint64_t v47 = [v11 lastObject];
        if (v47) {
          [v19 bounds];
        }
        else {
          objc_msgSend(v19, "vk_safeAreaBounds");
        }
        objc_msgSend(v19, "convertRect:toView:", 0);
        v152.origin.double x = v48;
        v152.origin.double y = v49;
        v152.size.double width = v50;
        v152.size.double height = v51;
        v142.origin.double x = x;
        v142.origin.double y = y;
        v142.size.double width = width;
        v142.size.double height = height;
        CGRect v143 = CGRectIntersection(v142, v152);
        double x = v143.origin.x;
        double y = v143.origin.y;
        double width = v143.size.width;
        double height = v143.size.height;
        if (VKMRectHasInfComponents(v143.origin.x, v143.origin.y, v143.size.width, v143.size.height)) {
          break;
        }
        uint64_t v52 = [v19 superview];

        v144.origin.double x = v42;
        v144.origin.double y = v43;
        v144.size.double width = v44;
        v144.size.double height = v45;
        v153.origin.double x = x;
        v153.origin.double y = y;
        v153.size.double width = width;
        v153.size.double height = height;
        if (!CGRectEqualToRect(v144, v153))
        {
          CGFloat v45 = height;
          CGFloat v44 = width;
          CGFloat v43 = y;
          CGFloat v42 = x;
        }

        double v19 = (void *)v52;
        if (!v52) {
          goto LABEL_25;
        }
      }

LABEL_25:
      double v57 = x;
      double v58 = y;
      double v59 = width;
      double v60 = height;
      double height = v45;
      double width = v44;
      double y = v43;
      double x = v42;
    }
    else
    {
      double v57 = x;
      double v58 = y;
      double v59 = width;
      double v60 = height;
    }
    double v54 = v134;
    double v53 = v137;
    double v56 = v128;
    double v55 = v131;
    CGFloat v135 = v58;
    CGFloat v138 = v57;
    CGFloat v129 = v60;
    CGFloat v132 = v59;
    if ((VKMRectHasInfComponents(v57, v58, v59, v60) & 1) == 0)
    {
      CGFloat v61 = self;
      double v62 = [(VKCImageAnalysisBaseView *)v61 window];
      objc_msgSend(v62, "vk_safeAreaBounds");
      v154.origin.double x = v63;
      v154.origin.double y = v64;
      v154.size.double width = v65;
      v154.size.double height = v66;
      v145.origin.double y = v135;
      v145.origin.double x = v138;
      v145.size.double height = v129;
      v145.size.double width = v132;
      CGRect v146 = CGRectIntersection(v145, v154);
      double v67 = v146.origin.x;
      double v68 = v146.origin.y;
      double v69 = v146.size.width;
      double v70 = v146.size.height;

      if (v61)
      {
        v71 = v61;
        do
        {
          uint64_t v72 = objc_opt_class();
          v73 = VKDynamicCast(v72, (uint64_t)v71);
          id v74 = v73;
          if (v73)
          {
            v75 = [v73 navigationController];
            v76 = [v75 toolbar];
            if (v76 && ([v75 isToolbarHidden] & 1) == 0)
            {
              v77 = [v75 toolbar];
              v78 = [v75 toolbar];
              [v78 bounds];
              objc_msgSend(v77, "convertRect:toView:", 0);
              double v136 = v69;
              double v139 = v70;
              CGFloat v80 = v79;
              CGFloat v82 = v81;
              double v130 = v67;
              double v133 = v68;
              CGFloat v84 = v83;
              CGFloat v86 = v85;

              v147.origin.double x = v80;
              v147.origin.double y = v82;
              v147.size.double width = v84;
              v147.size.double height = v86;
              CGRectGetMinY(v147);
              double v67 = VKMClipRectToMaxY(v130, v133, v136, v139);
              double v68 = v87;
              double v69 = v88;
              double v70 = v89;
            }
            v90 = [v74 navigationItem];
            v91 = [v90 navigationBar];

            if (v91 && ([v91 isHidden] & 1) == 0)
            {
              [v91 bounds];
              objc_msgSend(v91, "convertRect:toView:", 0);
              CGRectGetMaxY(v148);
              double v67 = VKMClipRectToMinY(v67, v68, v69, v70);
              double v68 = v92;
              double v69 = v93;
              double v70 = v94;
            }
          }
          uint64_t v95 = [v71 nextResponder];

          v149.origin.double x = x;
          v149.origin.double y = y;
          v149.size.double width = width;
          v149.size.double height = height;
          v155.origin.double x = v67;
          v155.origin.double y = v68;
          v155.size.double width = v69;
          v155.size.double height = v70;
          if (!CGRectEqualToRect(v149, v155))
          {
            double height = v70;
            double width = v69;
            double y = v68;
            double x = v67;
          }

          v71 = (void *)v95;
        }
        while (v95);
      }
      -[VKCImageAnalysisBaseView convertRect:fromView:](v61, "convertRect:fromView:", 0, v67, v68, v69, v70);
      CGFloat v97 = v96;
      CGFloat v99 = v98;
      CGFloat v101 = v100;
      CGFloat v103 = v102;
      [(VKCImageAnalysisBaseView *)v61 bounds];
      CGFloat v105 = v104;
      CGFloat v107 = v106;
      CGFloat v109 = v108;
      CGFloat v111 = v110;
      [(VKCImageBaseOverlayView *)v61 contentsRect];
      VKMRectFromNormalizedSubrect(v105, v107, v109, v111, v112, v113, v114, v115);
      VKMNormalizedSubrectInRect(v97, v99, v101, v103, v116, v117, v118, v119);
      double v53 = v120;
      double v54 = v121;
      double v55 = v122;
      double v56 = v123;
    }

    double v41 = 0;
  }
  else
  {
    double v54 = v134;
    double v53 = v137;
    double v56 = v128;
    double v55 = v131;
  }

  double v124 = v53;
  double v125 = v54;
  double v126 = v55;
  double v127 = v56;
  result.size.double height = v127;
  result.size.double width = v126;
  result.origin.double y = v125;
  result.origin.double x = v124;
  return result;
}

- (void)configureForCurrentActiveInteractionTypes
{
  unint64_t v3 = [(VKCImageAnalysisBaseView *)self activeInteractionTypes];
  [(VKCImageAnalysisBaseView *)self configureForActiveTypes:v3];
}

- (void)configureForActiveTypes:(unint64_t)a3
{
  unint64_t activeInteractionTypes = self->_activeInteractionTypes;
  self->_unint64_t activeInteractionTypes = a3;
  double v56 = [(VKCImageAnalysisBaseView *)self textSelectionView];
  double v5 = [(VKCImageAnalysisBaseView *)self dataDetectorView];
  CGFloat v61 = [(VKCImageAnalysisBaseView *)self visualSearchView];
  uint64_t v52 = [(VKCImageAnalysisBaseView *)self translationView];
  double v62 = [(VKCImageAnalysisBaseView *)self regexHighlightViewIfExists];
  double v55 = [(VKCImageAnalysisBaseView *)self subjectHighlightView];
  double v60 = [(VKCImageAnalysisBaseView *)self debugImageView];
  double v59 = [(VKCImageAnalysisBaseView *)self actionInfoView];
  if ((a3 & 1) != 0
    && ([(VKCImageAnalysisBaseView *)self analysisResult],
        double v6 = objc_claimAutoreleasedReturnValue(),
        [v6 text],
        double v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 length],
        v7,
        v6,
        v8))
  {
    int v9 = ![(VKCImageAnalysisBaseView *)self isShowingTranslation];
  }
  else
  {
    int v9 = 0;
  }
  double v10 = [(VKCImageAnalysisBaseView *)self subjectHighlightView];
  int v11 = [v10 glowLayerActive];

  BOOL v12 = [(VKCImageAnalysisBaseView *)self isShowingTranslation];
  int isSeedBuild = vk_isSeedBuild();
  if ([(VKCImageAnalysisBaseView *)self longPressDataDetectorsInTextMode]) {
    uint64_t v14 = a3 & ((a3 & 2) == 0);
  }
  else {
    uint64_t v14 = 0;
  }
  int v15 = (a3 >> 3) & 1 | isSeedBuild;
  unint64_t v58 = a3;
  int v16 = (a3 >> 1) & 1 | v14;
  BOOL v17 = [(VKCImageAnalysisBaseView *)self stringHighlightsActive];
  BOOL v18 = v17;
  if (!v62 && v17)
  {
    double v62 = [(VKCImageAnalysisBaseView *)self regexHighlightView];
  }
  BOOL v19 = [(VKCImageAnalysisBaseView *)self _photosInfoSingleTapSubjectModeEnabled];
  int v20 = (v58 & 4) == 0 || v19;
  if (!v15) {
    int v20 = 0;
  }
  BOOL v21 = ((v16 ^ 1 | v18) & 1) == 0 && !self->_isShowingTranslation;
  unsigned int v22 = !v18 & (v58 >> 2);
  int v23 = v19 | v20;
  LODWORD(v24) = v22 & v19;
  if (v11) {
    BOOL v25 = 0;
  }
  else {
    BOOL v25 = v21;
  }
  if (v11) {
    int v26 = 0;
  }
  else {
    int v26 = v9;
  }
  if (v11)
  {
    BOOL v27 = 0;
  }
  else
  {
    LODWORD(v24) = !v18 & (v58 >> 2);
    BOOL v27 = v12;
  }
  int v50 = v23;
  if (v23 == 1)
  {
    BOOL v21 = v25;
    unsigned int v28 = v26;
  }
  else
  {
    unsigned int v28 = v9;
  }
  if (v23 == 1) {
    unint64_t v24 = v24;
  }
  else {
    unint64_t v24 = v22;
  }
  unint64_t v57 = v24;
  if (v23 == 1) {
    BOOL v29 = v27;
  }
  else {
    BOOL v29 = v12;
  }
  BOOL v53 = v29;
  BOOL v54 = v21;
  [v5 setAllowLongPressDDActivationOnly:v14 & v21];
  [v56 setLongPressDataDetectorsInTextMode:v14];
  CGFloat v30 = [(VKCImageAnalysisBaseView *)self dataDetectorView];
  double v31 = [v30 displayedElements];
  int v32 = objc_msgSend(v31, "vk_containsObjectPassingTest:", &__block_literal_global_192_0);

  int v49 = v28 | v32;
  if ((v28 | v32) == 1)
  {
    double v33 = [v56 superview];

    if (v33 != self) {
      [(VKCImageAnalysisBaseView *)self addSubview:v56];
    }
  }
  int v34 = v11 ^ 1;
  double v35 = v61;
  CGFloat v36 = [v61 superview];

  if (v36 != self) {
    [(VKCImageAnalysisBaseView *)self addSubview:v61];
  }
  int v37 = v18 & v34;
  if (v54)
  {
    uint64_t v38 = [v5 superview];

    if (v38 != self) {
      [(VKCImageAnalysisBaseView *)self addSubview:v5];
    }
  }
  if (v37)
  {
    double v39 = [v62 superview];

    if (v39 != self) {
      [(VKCImageAnalysisBaseView *)self addSubview:v62];
    }
  }
  if (v59)
  {
    double v40 = [v59 superview];
    if (v40 == self)
    {

      double v35 = v61;
    }
    else
    {
      double v41 = v40;
      char v42 = [v59 automaticVisualRectLayoutDisabled];

      double v35 = v61;
      if ((v42 & 1) == 0) {
        [(VKCImageAnalysisBaseView *)self addSubview:v59];
      }
    }
  }
  if (v53)
  {
    CGFloat v43 = [v52 superview];

    if (v43 != self) {
      [(VKCImageAnalysisBaseView *)self addSubview:v52];
    }
  }
  CGFloat v44 = [v55 superview];

  if (v44 != self) {
    [(VKCImageAnalysisBaseView *)self addSubview:v55];
  }
  [v5 setAllowLongPressDDActivationOnly:v14];
  [v56 setLongPressDataDetectorsInTextMode:v14];
  CGFloat v45 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:8];
  objc_msgSend(v45, "vk_addNonNilObject:", v62);
  objc_msgSend(v45, "vk_addNonNilObject:", v56);
  objc_msgSend(v45, "vk_addNonNilObject:", v5);
  objc_msgSend(v45, "vk_addNonNilObject:", v55);
  objc_msgSend(v45, "vk_addNonNilObject:", v35);
  objc_msgSend(v45, "vk_addNonNilObject:", v52);
  if (([v59 automaticVisualRectLayoutDisabled] & 1) == 0) {
    objc_msgSend(v45, "vk_addNonNilObject:", v59);
  }
  objc_msgSend(v45, "vk_addNonNilObject:", v60);
  v63[0] = MEMORY[0x1E4F143A8];
  v63[1] = 3221225472;
  v63[2] = __52__VKCImageAnalysisBaseView_configureForActiveTypes___block_invoke_2;
  v63[3] = &unk_1E6BF3388;
  v63[4] = self;
  [v45 enumerateObjectsUsingBlock:v63];
  LODWORD(v46) = v50;
  if ([(VKCImageAnalysisBaseView *)self isPublicAPI])
  {
    unint64_t v57 = ([(VKCImageAnalysisBaseView *)self activeInteractionTypes] >> 2) & 1;
    int v37 = 0;
    unint64_t v46 = ([(VKCImageAnalysisBaseView *)self activeInteractionTypes] >> 3) & 1;
  }
  [v56 setHidden:v49 ^ 1u];
  [v5 setHidden:!v54];
  [v61 setHidden:v57 ^ 1];
  [v52 setHidden:!v53];
  [v62 setHidden:(v28 | v37) ^ 1];
  [v60 setHidden:v58 == 0];
  uint64_t v47 = v46 ^ 1;
  [v55 setHidden:v47];
  [v61 setUserInteractionEnabled:v57];
  [v56 setUserInteractionEnabled:v28];
  [v5 setUserInteractionEnabled:v54];
  objc_msgSend(v52, "setUserInteractionEnabled:", -[VKCImageAnalysisBaseView isShowingTranslation](self, "isShowingTranslation"));
  if (v47) {
    uint64_t v48 = 0;
  }
  else {
    uint64_t v48 = [(VKCImageAnalysisBaseView *)self subjectViewUserInteractionDisabled] ^ 1;
  }
  [v55 setUserInteractionEnabled:v48];
  if (((((activeInteractionTypes & 4) == 0) ^ v57) & 1) == 0
    && [(VKCImageAnalysisBaseView *)self isAnalysisVisible])
  {
    [(VKCImageAnalysisBaseView *)self _logVisualSearchHintAvailabilityUpdate];
  }
}

uint64_t __52__VKCImageAnalysisBaseView_configureForActiveTypes___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isMRCDataDetector];
}

uint64_t __52__VKCImageAnalysisBaseView_configureForActiveTypes___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) bringSubviewToFront:a2];
}

- (void)clearTextSelectionViewIfNecessary
{
  [(VKCImageTextSelectionView *)self->_textSelectionView removeFromSuperview];
  textSelectionView = self->_textSelectionView;
  self->_textSelectionView = 0;
}

- (void)clearDataDetectorViewIfNecessary
{
  [(VKCImageDataDetectorView *)self->_dataDetectorView removeFromSuperview];
  dataDetectorView = self->_dataDetectorView;
  self->_dataDetectorView = 0;
}

- (void)clearVisualSearchViewIfNecessary
{
  [(VKCImageVisualSearchView *)self->_visualSearchView removeFromSuperview];
  visualSearchView = self->_visualSearchView;
  self->_visualSearchView = 0;
}

- (void)clearTranslationViewIfNecessary
{
  [(VKCImageTranslationView *)self->_translationView removeFromSuperview];
  translationView = self->_translationView;
  self->_translationView = 0;
}

- (BOOL)containsInteractiveItemAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  char v6 = [(VKCImageAnalysisBaseView *)self activeInteractionTypes];
  if ((v6 & 1) == 0) {
    goto LABEL_6;
  }
  if (-[VKCImageAnalysisBaseView containsTextAtPoint:](self, "containsTextAtPoint:", x, y)) {
    return 1;
  }
  if ([(VKCImageAnalysisBaseView *)self longPressDataDetectorsInTextMode])
  {
    BOOL v7 = -[VKCImageAnalysisBaseView dataDetectorTypeAtPoint:](self, "dataDetectorTypeAtPoint:", x, y) != 0;
    if ((v6 & 2) == 0) {
      goto LABEL_9;
    }
  }
  else
  {
LABEL_6:
    BOOL v7 = 0;
    if ((v6 & 2) == 0) {
      goto LABEL_9;
    }
  }
  if (!v7) {
    BOOL v7 = -[VKCImageAnalysisBaseView dataDetectorTypeAtPoint:](self, "dataDetectorTypeAtPoint:", x, y) != 0;
  }
LABEL_9:
  if ((v6 & 4) != 0 && !v7)
  {
    if (!-[VKCImageAnalysisBaseView containsVisualSearchItemAtPoint:](self, "containsVisualSearchItemAtPoint:", x, y)) {
      goto LABEL_12;
    }
    return 1;
  }
  if (v7) {
    return 1;
  }
LABEL_12:
  uint64_t v8 = [(VKCImageAnalysisBaseView *)self actionInfoView];
  char v9 = [v8 isHidden];

  if (v9)
  {
    BOOL result = 0;
    if ((v6 & 8) == 0) {
      return result;
    }
  }
  else
  {
    BOOL result = -[VKCImageAnalysisBaseView containsActionInfoItemAtPoint:](self, "containsActionInfoItemAtPoint:", x, y);
    if ((v6 & 8) == 0) {
      return result;
    }
  }
  if (!result)
  {
    return -[VKCImageAnalysisBaseView containsImageSubjectAtPoint:](self, "containsImageSubjectAtPoint:", x, y);
  }
  return result;
}

- (BOOL)containsTextAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (([(VKCImageAnalysisBaseView *)self activeInteractionTypes] & 1) == 0) {
    return 0;
  }
  return -[VKCImageAnalysisBaseView analysisContainsTextAtPoint:](self, "analysisContainsTextAtPoint:", x, y);
}

- (BOOL)containsActionInfoItemAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  char v6 = [(VKCImageAnalysisBaseView *)self actionInfoView];
  objc_msgSend(v6, "convertPoint:fromView:", self, x, y);
  double v8 = v7;
  double v10 = v9;

  int v11 = [(VKCImageAnalysisBaseView *)self actionInfoView];
  char v12 = objc_msgSend(v11, "containsInteractableItemAtPoint:", v8, v10);

  if (v12) {
    return 1;
  }
  uint64_t v14 = [(VKCImageAnalysisBaseView *)self debugImageView];

  if (!v14) {
    return 0;
  }
  int v15 = [(VKCImageAnalysisBaseView *)self debugImageView];
  -[VKCImageAnalysisBaseView convertPoint:toView:](self, "convertPoint:toView:", v15, x, y);
  CGFloat v17 = v16;
  CGFloat v19 = v18;

  int v20 = [(VKCImageAnalysisBaseView *)self debugImageView];
  [v20 bounds];
  v21.double x = v17;
  v21.double y = v19;
  LOBYTE(v15) = CGRectContainsPoint(v22, v21);

  return (char)v15;
}

- (BOOL)containsImageSubjectAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  char v6 = [(VKCImageAnalysisBaseView *)self subjectHighlightView];
  objc_msgSend(v6, "convertPoint:fromView:", self, x, y);
  double v8 = v7;
  double v10 = v9;

  int v11 = [(VKCImageAnalysisBaseView *)self subjectHighlightView];
  LOBYTE(v6) = objc_msgSend(v11, "subjectExistsAtPoint:", v8, v10);

  return (char)v6;
}

- (BOOL)analysisContainsTextAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  char v6 = [(VKCImageAnalysisBaseView *)self textSelectionView];
  -[VKCImageAnalysisBaseView convertPoint:toView:](self, "convertPoint:toView:", v6, x, y);
  double v8 = v7;
  double v10 = v9;

  int v11 = [(VKCImageAnalysisBaseView *)self textSelectionView];
  [(VKCImageAnalysisBaseView *)self currentExtraOffsetForViewScale];
  CGFloat v13 = objc_msgSend(v11, "closestQuadForBlockOfType:toPoint:maxDistance:", 8, v8, v10, v12);

  return v13 != 0;
}

- (void)setActiveSubjectIndexSet:(id)a3
{
  id v4 = a3;
  id v5 = [(VKCImageAnalysisBaseView *)self subjectHighlightView];
  [v5 setActiveSubjectIndexSet:v4];
}

- (NSIndexSet)activeSubjectIndexSet
{
  int v2 = [(VKCImageAnalysisBaseView *)self subjectHighlightView];
  unint64_t v3 = [v2 activeSubjectIndexSet];

  return (NSIndexSet *)v3;
}

- (NSIndexSet)allSubjectsIndexSet
{
  int v2 = [(VKCImageAnalysisBaseView *)self subjectHighlightView];
  unint64_t v3 = [v2 allSubjectsIndexSet];

  return (NSIndexSet *)v3;
}

- (id)indexOfSubjectAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  char v6 = [(VKCImageAnalysisBaseView *)self subjectHighlightView];
  -[VKCImageAnalysisBaseView convertPoint:toView:](self, "convertPoint:toView:", v6, x, y);
  double v8 = v7;
  double v10 = v9;

  int v11 = [(VKCImageAnalysisBaseView *)self subjectHighlightView];
  double v12 = objc_msgSend(v11, "indexOfSubjectAtPoint:", v8, v10);

  return v12;
}

- (double)currentExtraOffsetForViewScale
{
  int v2 = [(VKCImageAnalysisBaseView *)self textSelectionView];
  +[VKCInternalSettings extraWindowPointTouchOffset];
  objc_msgSend(v2, "vk_viewLengthFromWindowLength:");
  double v4 = v3;

  return v4;
}

- (id)dataDetectorElementPoint:(CGPoint)a3 requestingView:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  char v8 = [(VKCImageAnalysisBaseView *)self activeInteractionTypes];
  if ((v8 & 2) != 0
    || (v8 & 1) != 0
    && [(VKCImageAnalysisBaseView *)self longPressDataDetectorsInTextMode])
  {
    double v9 = [(VKCImageAnalysisBaseView *)self dataDetectorView];
    objc_msgSend(v7, "convertPoint:toView:", v9, x, y);
    double v11 = v10;
    double v13 = v12;

    uint64_t v14 = [(VKCImageAnalysisBaseView *)self dataDetectorView];
    [(VKCImageAnalysisBaseView *)self currentExtraOffsetForViewScale];
    double v16 = objc_msgSend(v14, "closestElementToPoint:maxDistance:", v11, v13, v15);
  }
  else
  {
    double v16 = 0;
  }

  return v16;
}

- (unint64_t)dataDetectorTypeAtPoint:(CGPoint)a3
{
  double v3 = -[VKCImageAnalysisBaseView dataDetectorElementPoint:requestingView:](self, "dataDetectorElementPoint:requestingView:", self, a3.x, a3.y);
  double v4 = v3;
  if (v3) {
    unint64_t v5 = [v3 dataDetectorTypes];
  }
  else {
    unint64_t v5 = 0;
  }

  return v5;
}

- (BOOL)containsVisualSearchItemAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (([(VKCImageAnalysisBaseView *)self activeInteractionTypes] & 4) == 0) {
    return 0;
  }
  id v7 = [(VKCImageAnalysisBaseView *)self visualSearchView];
  -[VKCImageAnalysisBaseView convertPoint:toView:](self, "convertPoint:toView:", v7, x, y);
  double v9 = v8;
  double v11 = v10;

  double v12 = [(VKCImageAnalysisBaseView *)self visualSearchView];
  LOBYTE(v7) = objc_msgSend(v12, "containsVisualSearchItemAtPoint:", v9, v11);

  return (char)v7;
}

- (VKCImageDataDetectorView)dataDetectorView
{
  dataDetectorView = self->_dataDetectorView;
  if (!dataDetectorView)
  {
    double v4 = objc_alloc_init(VKCImageDataDetectorView);
    unint64_t v5 = self->_dataDetectorView;
    self->_dataDetectorView = v4;

    [(VKCImageDataDetectorView *)self->_dataDetectorView setAllowLongPressDDActivationOnly:[(VKCImageAnalysisBaseView *)self longPressDataDetectorsInTextMode]];
    [(VKCImageDataDetectorView *)self->_dataDetectorView setDataDetectorTypes:[(VKCImageAnalysisBaseView *)self dataDetectorTypes]];
    [(VKCImageDataDetectorView *)self->_dataDetectorView setDelegate:self];
    [(VKCImageBaseOverlayView *)self->_dataDetectorView setBaseDelegate:self];
    [(VKCImageBaseOverlayView *)self->_dataDetectorView setIdentifierIndex:[(VKCImageBaseOverlayView *)self identifierIndex]];
    dataDetectorView = self->_dataDetectorView;
  }
  return dataDetectorView;
}

- (VKCImageVisualSearchView)visualSearchView
{
  visualSearchView = self->_visualSearchView;
  if (!visualSearchView)
  {
    double v4 = objc_alloc_init(VKCImageVisualSearchView);
    unint64_t v5 = self->_visualSearchView;
    self->_visualSearchView = v4;

    [(VKCImageVisualSearchView *)self->_visualSearchView setDelegate:self];
    [(VKCImageBaseOverlayView *)self->_visualSearchView setBaseDelegate:self];
    [(VKCImageBaseOverlayView *)self->_visualSearchView setIdentifierIndex:[(VKCImageBaseOverlayView *)self identifierIndex]];
    visualSearchView = self->_visualSearchView;
  }
  return visualSearchView;
}

- (VKCImageCustomHighlightView)regexHighlightView
{
  regexHighlightView = self->_regexHighlightView;
  if (!regexHighlightView)
  {
    double v4 = [[VKCImageCustomHighlightView alloc] initWithDelegate:self];
    unint64_t v5 = self->_regexHighlightView;
    self->_regexHighlightView = v4;

    char v6 = [(VKCImageAnalysisBaseView *)self analysisResult];
    [(VKCImageBaseOverlayView *)self->_regexHighlightView setRecognitionResult:v6];

    [(VKCImageBaseOverlayView *)self normalizedVisibleRect];
    -[VKCImageBaseOverlayView setNormalizedVisibleRect:](self->_regexHighlightView, "setNormalizedVisibleRect:");
    [(VKCImageBaseOverlayView *)self contentsRect];
    -[VKCImageBaseOverlayView setContentsRect:](self->_regexHighlightView, "setContentsRect:");
    [(VKCImageAnalysisBaseView *)self bounds];
    -[VKCImageCustomHighlightView setFrame:](self->_regexHighlightView, "setFrame:");
    [(VKCImageBaseOverlayView *)self->_regexHighlightView setBaseDelegate:self];
    [(VKCImageBaseOverlayView *)self->_regexHighlightView setIdentifierIndex:[(VKCImageBaseOverlayView *)self identifierIndex]];
    regexHighlightView = self->_regexHighlightView;
  }
  return regexHighlightView;
}

- (VKCImageCustomHighlightView)regexHighlightViewIfExists
{
  return self->_regexHighlightView;
}

- (VKCImageSubjectHighlightView)subjectHighlightView
{
  if (!self->_subjectHighlightView
    && [(VKCImageAnalysisBaseView *)self subjectHighlightFeatureFlagEnabled])
  {
    double v3 = objc_alloc_init(VKCImageSubjectHighlightView);
    subjectHighlightView = self->_subjectHighlightView;
    self->_subjectHighlightView = v3;

    [(VKCImageBaseOverlayView *)self contentsRect];
    -[VKCImageSubjectBaseView setContentsRect:](self->_subjectHighlightView, "setContentsRect:");
    [(VKCImageAnalysisBaseView *)self bounds];
    -[VKCImageSubjectHighlightView setFrame:](self->_subjectHighlightView, "setFrame:");
    [(VKCImageSubjectHighlightView *)self->_subjectHighlightView setDelegate:self];
    [(VKCImageSubjectBaseView *)self->_subjectHighlightView setBaseSubjectDelegate:self];
    [(VKCImageBaseOverlayView *)self->_subjectHighlightView setBaseDelegate:self];
    unint64_t v5 = [(VKCImageAnalysisBaseView *)self analysisResult];
    [(VKCImageSubjectHighlightView *)self->_subjectHighlightView setRecognitionResult:v5];

    [(VKCImageBaseOverlayView *)self normalizedVisibleRect];
    -[VKCImageSubjectHighlightView setNormalizedVisibleRect:](self->_subjectHighlightView, "setNormalizedVisibleRect:");
    [(VKCImageBaseOverlayView *)self->_subjectHighlightView setIdentifierIndex:[(VKCImageBaseOverlayView *)self identifierIndex]];
    [(VKCImageAnalysisBaseView *)self configureForCurrentActiveInteractionTypes];
  }
  char v6 = self->_subjectHighlightView;
  return v6;
}

- (void)scrollViewWillChange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  char v6 = [v4 object];

  VKDynamicCast(v5, (uint64_t)v6);
  id v14 = (id)objc_claimAutoreleasedReturnValue();

  if ([(UIView *)self vk_isDescendantOfView:v14])
  {
    id v7 = [v14 layer];
    double v8 = [v7 animationKeys];
    uint64_t v9 = [v8 count];

    if (v9)
    {
      double v10 = [(VKCImageAnalysisBaseView *)self actionInfoView];
      char v11 = [v10 isHidden];

      if ((v11 & 1) == 0)
      {
        [(VKCImageAnalysisBaseView *)self setActionInfoHiddenForZoomAnimation:1];
        double v12 = [(VKCImageAnalysisBaseView *)self actionInfoView];
        objc_msgSend(v12, "setVk_alpha:", 0.0);
      }
    }
    id v13 = [(VKCImageAnalysisBaseView *)self scrollViewToObserve];

    if (v14 == v13)
    {
      [(VKCImageAnalysisBaseView *)self setScrollViewToObserveCount:[(VKCImageAnalysisBaseView *)self scrollViewToObserveCount] + 1];
    }
    else
    {
      [(VKCImageAnalysisBaseView *)self setScrollViewToObserveCount:0];
      [(VKCImageAnalysisBaseView *)self setScrollViewToObserve:v14];
    }
  }
}

- (void)scrollViewDidChange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  char v6 = [v4 object];

  VKDynamicCast(v5, (uint64_t)v6);
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  if ([(VKCImageAnalysisBaseView *)self actionInfoHiddenForZoomAnimation])
  {
    id v7 = [v13 layer];
    double v8 = [v7 animationKeys];
    uint64_t v9 = [v8 count];

    if (!v9)
    {
      [(VKCImageAnalysisBaseView *)self setActionInfoHiddenForZoomAnimation:0];
      [(VKCImageAnalysisBaseView *)self updateNormalizedVisibleRectIfNecessary];
      double v10 = [(VKCImageAnalysisBaseView *)self actionInfoView];
      objc_msgSend(v10, "setVk_alpha:", 1.0);
    }
  }
  id v11 = [(VKCImageAnalysisBaseView *)self scrollViewToObserve];

  if (v13 == v11)
  {
    if ([(VKCImageAnalysisBaseView *)self scrollViewToObserveCount] >= 1)
    {
      [(VKCImageAnalysisBaseView *)self setScrollViewToObserveCount:[(VKCImageAnalysisBaseView *)self scrollViewToObserveCount] - 1];
      goto LABEL_11;
    }
    [(VKCImageAnalysisBaseView *)self setScrollViewToObserve:0];
    [(VKCImageAnalysisBaseView *)self setScrollViewToObserveCount:0];
    goto LABEL_10;
  }
  if ([(VKCImageAnalysisBaseView *)self isDescendantOfView:v13])
  {
LABEL_10:
    [(VKCImageAnalysisBaseView *)self updateNormalizedVisibleRectIfNecessary];
    double v12 = [(VKCImageAnalysisBaseView *)self delegate];
    [(VKCImageBaseOverlayView *)self normalizedVisibleRect];
    objc_msgSend(v12, "baseOverlayView:didFinishTransitionToNormalizedVisibleRect:", self);
  }
LABEL_11:
}

- (void)setScrollViewToObserve:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollViewToObserve);

  if (WeakRetained != obj)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_scrollViewToObserve);
    [v5 _removeScrollViewScrollObserver:self];

    id v6 = objc_storeWeak((id *)&self->_scrollViewToObserve, obj);
    [obj _addScrollViewScrollObserver:self];
  }
}

- (void)highlightMatchesWithString:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v15[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v15[0] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  [(VKCImageAnalysisBaseView *)self setHighlightStrings:v7];

  double v8 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.interaction");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = self;
    _os_log_impl(&dword_1DB266000, v8, OS_LOG_TYPE_DEFAULT, "Activating String Highlight Matches Activated: %@", (uint8_t *)&v13, 0xCu);
  }

  [(VKCImageAnalysisBaseView *)self setStringHighlightsActive:1];
  [(VKCImageAnalysisBaseView *)self configureForCurrentActiveInteractionTypes];
  uint64_t v9 = [(VKCImageAnalysisBaseView *)self analysisResult];
  double v10 = [v9 text];

  if (v10)
  {
    id v11 = objc_msgSend(v10, "vk_rangesOfMatchesForString:", v6);
  }
  else
  {
    id v11 = (void *)MEMORY[0x1E4F1CBF0];
  }
  double v12 = [(VKCImageAnalysisBaseView *)self regexHighlightView];
  [v12 beginHighlightWithRanges:v11 animated:v4];
}

- (void)clearStringHighlightsAnimated:(BOOL)a3
{
}

- (void)clearRegexHighlightsAnimated:(BOOL)a3 updateActiveTypes:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ([(VKCImageAnalysisBaseView *)self stringHighlightsActive])
  {
    id v7 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.interaction");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      double v10 = self;
      _os_log_impl(&dword_1DB266000, v7, OS_LOG_TYPE_DEFAULT, "String Highlight Matches Deactivated: %@", (uint8_t *)&v9, 0xCu);
    }

    [(VKCImageAnalysisBaseView *)self setStringHighlightsActive:0];
    double v8 = [(VKCImageAnalysisBaseView *)self regexHighlightViewIfExists];
    [v8 clearHighlightsAnimated:v5];

    [(VKCImageAnalysisBaseView *)self setHighlightStrings:0];
    if (v4) {
      [(VKCImageAnalysisBaseView *)self configureForCurrentActiveInteractionTypes];
    }
  }
}

- (void)subjectBaseViewViewDidCompleteSubjectAnalysis:(id)a3
{
  [(VKCImageAnalysisBaseView *)self updateDebugButtonIfNecessary];
  if ([(VKCImageAnalysisBaseView *)self _photosInfoSingleTapSubjectModeEnabled])
  {
    if (([(VKCImageAnalysisBaseView *)self activeInteractionTypes] & 4) != 0)
    {
      BOOL v4 = [(VKCImageAnalysisBaseView *)self subjectHighlightView];
      BOOL v5 = [v4 subjectContext];
      uint64_t v6 = [v5 subjectCount];

      if (v6)
      {
        id v7 = [(VKCImageAnalysisBaseView *)self visualSearchView];
        [v7 updateVisibleItems];

        double v8 = [(VKCImageAnalysisBaseView *)self visualSearchView];
        [v8 animateDotsIn];
      }
    }
  }
  id v9 = [(VKCImageAnalysisBaseView *)self delegate];
  [v9 baseOverlayViewDidCompleteSubjectAnalysis:self];
}

- (void)subjectBaseViewDidBeginSubjectAnalysis:(id)a3
{
  id v4 = [(VKCImageAnalysisBaseView *)self delegate];
  [v4 baseOverlayViewDidBeginSubjectAnalysis:self];
}

- (void)subjectBaseView:(id)a3 analyticsEventOccurred:(id)a4
{
  id v5 = a4;
  id v6 = [(VKCImageAnalysisBaseView *)self delegate];
  [v6 baseOverlayView:self analyticsEventDidOccur:v5];
}

- (BOOL)subjectHighlightView:(id)a3 shouldBeginInteractionAtPoint:(CGPoint)a4 withType:(unint64_t)a5
{
  id v5 = self;
  -[VKCImageAnalysisBaseView convertPoint:fromView:](self, "convertPoint:fromView:", a3, a5, a4.x, a4.y);
  double v7 = v6;
  double v9 = v8;
  double v10 = [(VKCImageAnalysisBaseView *)v5 delegate];
  LOBYTE(v5) = objc_msgSend(v10, "baseOverlayView:shouldBeginInteractionAtPoint:withTypes:", v5, 8, v7, v9);

  return (char)v5;
}

- (void)subjectHighlightView:(id)a3 willBeginInteractionAtPoint:(CGPoint)a4 withType:(unint64_t)a5
{
  id v7 = +[VKTextRange emptyRange];
  double v6 = [(VKCImageAnalysisBaseView *)self textSelectionView];
  [v6 setSelectedVKRange:v7];
}

- (void)subjectHighlightViewSubjectInteractionInProgressDidChange:(id)a3
{
  id v4 = [(VKCImageAnalysisBaseView *)self delegate];
  [v4 baseOverlayViewSubjectInteractionInProgressDidChange:self];
}

- (BOOL)isSubjectHighlightShowingLivePhoto:(id)a3 delegateHasImplementation:(BOOL *)a4
{
  double v6 = [(VKCImageAnalysisBaseView *)self delegate];
  LOBYTE(a4) = [v6 isBaseOverlayViewShowingLivePhoto:self delegateHasImplementation:a4];

  return (char)a4;
}

- (void)subjectHighlightView:(id)a3 livePhotoShouldPlay:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(VKCImageAnalysisBaseView *)self delegate];
  [v6 baseOverlayView:self livePhotoShouldPlay:v4];
}

- (id)presentingViewControllerForSubjectHighlightView:(id)a3
{
  double v3 = [(VKCImageAnalysisBaseView *)self delegate];
  BOOL v4 = [v3 presentingViewControllerForImageAnalysisInteraction];

  return v4;
}

- (BOOL)subjectHighlightView:(id)a3 containsVSItemForNormalizedPath:(id)a4
{
  id v5 = a4;
  id v6 = [(VKCImageAnalysisBaseView *)self visualSearchView];
  id v7 = [v6 visualSearchResult];
  double v8 = [v7 resultItems];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __81__VKCImageAnalysisBaseView_subjectHighlightView_containsVSItemForNormalizedPath___block_invoke;
  v12[3] = &unk_1E6BF33B0;
  id v13 = v5;
  id v9 = v5;
  double v10 = objc_msgSend(v8, "vk_objectsPassingTest:", v12);
  LOBYTE(v7) = [v10 count] == 1;

  return (char)v7;
}

uint64_t __81__VKCImageAnalysisBaseView_subjectHighlightView_containsVSItemForNormalizedPath___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 hasFocalPoint])
  {
    BOOL v4 = *(void **)(a1 + 32);
    [v3 normalizedIconLocation];
    uint64_t v5 = objc_msgSend(v4, "containsPoint:");
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (void)subjectHighlightView:(id)a3 activateVSItemForNormalizedPath:(id)a4
{
  id v5 = a4;
  id v6 = [(VKCImageAnalysisBaseView *)self visualSearchView];
  id v7 = [v6 visualSearchResult];
  double v8 = [v7 resultItems];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __81__VKCImageAnalysisBaseView_subjectHighlightView_activateVSItemForNormalizedPath___block_invoke;
  v15[3] = &unk_1E6BF33B0;
  id v9 = v5;
  id v16 = v9;
  double v10 = objc_msgSend(v8, "vk_objectPassingTest:", v15);
  if (v10)
  {
    uint64_t v11 = [(VKCImageAnalysisBaseView *)self delegate];
    int v12 = [v11 baseOverlayView:self shouldShowLookupForItemFromCallout:v10];

    if (v12)
    {
      unint64_t v13 = [(VKCImageAnalysisBaseView *)self activeInteractionTypes];
      [(VKCImageAnalysisBaseView *)self setActiveInteractionTypes:4];
      [v10 setCurrentInvocationType:2];
      id v14 = [(VKCImageAnalysisBaseView *)self visualSearchView];
      [v14 presentVisualSearchForItem:v10];

      [(VKCImageAnalysisBaseView *)self setActiveInteractionTypes:v13];
    }
  }
  else
  {
    +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "item != ((void *)0)", "-[VKCImageAnalysisBaseView subjectHighlightView:activateVSItemForNormalizedPath:]", 0, 0, @"Trying to show lookup for an item, but no item was found.");
  }
}

uint64_t __81__VKCImageAnalysisBaseView_subjectHighlightView_activateVSItemForNormalizedPath___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 hasFocalPoint])
  {
    BOOL v4 = *(void **)(a1 + 32);
    [v3 normalizedIconLocation];
    uint64_t v5 = objc_msgSend(v4, "containsPoint:");
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (void)videoPreviewAvailableForSubjectHighlightView:(id)a3
{
  id v4 = [(VKCImageAnalysisBaseView *)self delegate];
  [v4 videoPreviewAvailableForBaseOverlayView:self];
}

- (BOOL)presentVisualSearchForItem:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.visualSearch");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412546;
    id v18 = v4;
    __int16 v19 = 2112;
    int v20 = self;
    _os_log_impl(&dword_1DB266000, v5, OS_LOG_TYPE_DEFAULT, "Presenting visual search result for item: %@: %@", (uint8_t *)&v17, 0x16u);
  }

  id v6 = [(VKCImageAnalysisBaseView *)self visualSearchView];
  id v7 = [v6 visualSearchResult];
  double v8 = [v7 resultItems];
  int v9 = [v8 containsObject:v4];

  if (v9)
  {
    unint64_t v10 = [(VKCImageAnalysisBaseView *)self activeInteractionTypes];
    [(VKCImageAnalysisBaseView *)self setActiveInteractionTypes:4];
    uint64_t v11 = [(VKCImageAnalysisBaseView *)self visualSearchView];
    [v11 presentVisualSearchForItem:v4];

    if (([v4 shouldPlaceInCorner] & 1) == 0
      && [(VKCImageAnalysisBaseView *)self _photosInfoSingleTapSubjectModeEnabled])
    {
      int v12 = [(VKCImageAnalysisBaseView *)self subjectHighlightView];
      [v4 normalizedIconLocation];
      objc_msgSend(v12, "viewPointFromNormalizedPoint:");
      unint64_t v13 = objc_msgSend(v12, "indexOfSubjectAtPoint:");
      id v14 = v13;
      if (v13)
      {
        double v15 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndex:", objc_msgSend(v13, "integerValue"));
        objc_msgSend(v12, "highlightSubjectAtIndexSet:showCallout:showBurst:burstPoint:animated:", v15, 0, 0, 1, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
      }
    }
    [(VKCImageAnalysisBaseView *)self setActiveInteractionTypes:v10];
  }

  return v9;
}

- (id)tempPNGURLForSubjectHighlightView:(id)a3
{
  id v4 = VKBundle();
  uint64_t v5 = [v4 localizedStringForKey:@"VK_SUBJECT_SHARE_FILE_NAME" value:@"VK_SUBJECT_SHARE_FILE_NAME" table:@"Localizable"];
  id v6 = [(VKCImageAnalysisBaseView *)self disposableSubjectPNGURLWithTitle:v5];

  return v6;
}

- (id)previewForDataDetectorElementView:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(VKCImageAnalysisBaseView *)self delegate];
  id v6 = [v5 previewForDataDetectorElementView:v4];

  return v6;
}

- (void)dataDetectorView:(id)a3 analyticsEventOccured:(id)a4
{
  id v5 = a4;
  id v6 = [(VKCImageAnalysisBaseView *)self delegate];
  [v6 baseOverlayView:self analyticsEventDidOccur:v5];
}

- (id)viewForImageSnapshotForTextSelectionView:(id)a3
{
  id v4 = [(VKCImageAnalysisBaseView *)self delegate];
  id v5 = [v4 viewForImageSnapshotForBaseView:self];

  return v5;
}

- (id)previewImageForDataDetectorElementView:(id)a3
{
  id v4 = [(VKCImageAnalysisBaseView *)self delegate];
  id v5 = [v4 imageForImageSnapshotForBaseView:self];

  return v5;
}

- (BOOL)textSelectionView:(id)a3 shouldBeginAtPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  -[VKCImageAnalysisBaseView convertPoint:fromView:](self, "convertPoint:fromView:", a3);
  double v8 = v7;
  double v10 = v9;
  if ([(VKCImageAnalysisBaseView *)self hasActiveTextSelection]
    || -[VKCImageAnalysisBaseView containsTextAtPoint:](self, "containsTextAtPoint:", x, y))
  {
    uint64_t v11 = [(VKCImageAnalysisBaseView *)self delegate];
    char v12 = objc_msgSend(v11, "baseOverlayView:shouldBeginInteractionAtPoint:withTypes:", self, 1, v8, v10);
  }
  else
  {
    char v12 = 0;
  }
  unint64_t v13 = [(VKCImageAnalysisBaseView *)self debugImageView];

  if (v13)
  {
    id v14 = [(VKCImageAnalysisBaseView *)self debugImageView];
    [v14 frame];
    v17.double x = v8;
    v17.double y = v10;
    char v15 = CGRectContainsPoint(v18, v17);

    return v12 & ~v15;
  }
  return v12;
}

- (BOOL)textSelectionView:(id)a3 dataDetectorExistsAtPoint:(CGPoint)a4
{
  return -[VKCImageAnalysisBaseView dataDetectorTypeAtPoint:](self, "dataDetectorTypeAtPoint:") != 0;
}

- (void)textSelectionView:(id)a3 requestsDataDetectorActivationAtPoint:(CGPoint)a4
{
  -[VKCImageAnalysisBaseView convertPoint:fromView:](self, "convertPoint:fromView:", a3, a4.x, a4.y);
  double v6 = v5;
  double v8 = v7;
  id v10 = [(VKCImageAnalysisBaseView *)self dataDetectorView];
  [(VKCImageAnalysisBaseView *)self currentExtraOffsetForViewScale];
  objc_msgSend(v10, "activateLongPressDataDetectorAtPoint:maxDistance:", v6, v8, v9);
}

- (void)textSelectionView:(id)a3 selectionDidChange:(id)a4
{
  double v5 = (void *)MEMORY[0x1E4F28EB8];
  id v6 = a3;
  double v7 = [v5 defaultCenter];
  [v7 postNotificationName:@"VKCImageTextSelectionViewSelectionDidChange" object:v6];

  [(VKCImageAnalysisBaseView *)self set_hasActiveTextSelection:[(VKCImageAnalysisBaseView *)self hasActiveTextSelection]];
  [(VKCImageAnalysisBaseView *)self clearStringHighlightsAnimated:0];
  id v8 = [(VKCImageAnalysisBaseView *)self delegate];
  [v8 textSelectionDidChangeForBaseOverlayView:self];
}

- (void)textSelectionView:(id)a3 boundsDidChangeFromRect:(CGRect)a4 toRect:(CGRect)a5
{
  [(VKCImageAnalysisBaseView *)self invalidateVisibleTextAreaInfo];
  [(VKCImageAnalysisBaseView *)self updateNormalizedVisibleRectIfNecessary];
}

- (id)presentingViewControllerForTextSelectionView:(id)a3
{
  id v3 = [(VKCImageAnalysisBaseView *)self delegate];
  id v4 = [v3 presentingViewControllerForImageAnalysisInteraction];

  return v4;
}

- (void)textSelectionView:(id)a3 prepareForCalloutAction:(SEL)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = [(VKCImageAnalysisBaseView *)self delegate];
  [v8 baseOverlayView:self prepareForCalloutAction:a4 completion:v7];
}

- (void)subjectHighlightView:(id)a3 prepareForCalloutAction:(SEL)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = [(VKCImageAnalysisBaseView *)self delegate];
  [v8 baseOverlayView:self prepareForCalloutAction:a4 completion:v7];
}

- (id)textSelectionView:(id)a3 updateStringForCopy:(id)a4
{
  id v5 = a4;
  id v6 = [(VKCImageAnalysisBaseView *)self delegate];
  id v7 = [v6 baseOverlayView:self updateStringForCopy:v5];

  return v7;
}

- (id)textSelectionView:(id)a3 updateAttributedStringForCopy:(id)a4
{
  id v5 = a4;
  id v6 = [(VKCImageAnalysisBaseView *)self delegate];
  id v7 = [v6 baseOverlayView:self updateAttributedStringForCopy:v5];

  return v7;
}

- (BOOL)textSelectionView:(id)a3 shouldHandleShareWithRanges:(id)a4 boundingRect:(CGRect)a5 selectedText:(id)a6 selectedAttributedText:(id)a7
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v14 = a7;
  id v15 = a6;
  id v16 = a4;
  CGPoint v17 = [(VKCImageAnalysisBaseView *)self delegate];
  LOBYTE(self) = objc_msgSend(v17, "baseOverlayView:shouldHandleShareWithRanges:boundingRect:selectedText:selectedAttributedText:", self, v16, v15, v14, x, y, width, height);

  return (char)self;
}

- (BOOL)dataDetectorView:(id)a3 dataDetectorInteractionShouldBeginAtPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v6 = self;
  id v7 = [(VKCImageAnalysisBaseView *)self delegate];
  LOBYTE(v6) = objc_msgSend(v7, "baseOverlayView:shouldBeginInteractionAtPoint:withTypes:", v6, 2, x, y);

  return (char)v6;
}

- (void)willDisplayMenuForDataDetectorView:(id)a3
{
  id v6 = [(VKCImageAnalysisBaseView *)self textSelectionView];
  id v4 = [v6 selectedVKRange];
  [(VKCImageAnalysisBaseView *)self setSelectedTextRangeBeforeDataDetectorMenu:v4];

  id v5 = +[VKTextRange emptyRange];
  [v6 setSelectedVKRange:v5];
}

- (void)willDismissMenuForDataDetectorView:(id)a3
{
  id v4 = [(VKCImageAnalysisBaseView *)self selectedTextRangeBeforeDataDetectorMenu];
  id v5 = [(VKCImageAnalysisBaseView *)self textSelectionView];
  [v5 setSelectedVKRange:v4];

  [(VKCImageAnalysisBaseView *)self setSelectedTextRangeBeforeDataDetectorMenu:0];
}

- (BOOL)visualSearchItemView:(id)a3 shouldBeginAtPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v6 = self;
  id v7 = [(VKCImageAnalysisBaseView *)self delegate];
  LOBYTE(v6) = objc_msgSend(v7, "baseOverlayView:shouldBeginInteractionAtPoint:withTypes:", v6, 4, x, y);

  return (char)v6;
}

- (void)textSelectionView:(id)a3 analyticsEventOccured:(id)a4
{
  id v5 = a4;
  id v6 = [(VKCImageAnalysisBaseView *)self delegate];
  [v6 baseOverlayView:self analyticsEventDidOccur:v5];
}

- (id)nonTextNormalizedHighlightAllQuadsForTextSelectionView:(id)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v5 = [(VKCImageAnalysisBaseView *)self dataDetectorView];
  id v6 = [v5 displayedElements];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __83__VKCImageAnalysisBaseView_nonTextNormalizedHighlightAllQuadsForTextSelectionView___block_invoke;
  v9[3] = &unk_1E6BF32E8;
  id v7 = v4;
  id v10 = v7;
  [v6 enumerateObjectsUsingBlock:v9];

  return v7;
}

void __83__VKCImageAnalysisBaseView_nonTextNormalizedHighlightAllQuadsForTextSelectionView___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([v5 isMRCDataDetector])
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = [v5 boundingQuads];
    [v3 addObjectsFromArray:v4];
  }
}

- (NSString)description
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [(VKCImageAnalysisBaseView *)self analysisResult];
  id v7 = [v3 stringWithFormat:@"<%@: %p> id: %d", v5, self, objc_msgSend(v6, "analysisRequestID")];

  return (NSString *)v7;
}

- (id)summaryDescription
{
  int v2 = [(VKCImageAnalysisBaseView *)self textSelectionView];
  id v3 = [v2 text];
  id v4 = objc_msgSend(v3, "vk_substringToIndex:", 40);

  return v4;
}

- (void)triggerTapToRadar
{
  id v2 = [(VKCImageAnalysisBaseView *)self delegate];
  [v2 triggerTapToRadar];
}

- (id)textSelectionView:(id)a3 closestVisualSearchItemForRange:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(VKCImageAnalysisBaseView *)self visualSearchView];
  double v9 = [v8 visualSearchResult];
  id v10 = [v9 resultItems];

  uint64_t v21 = 0;
  CGRect v22 = &v21;
  uint64_t v23 = 0x3032000000;
  unint64_t v24 = __Block_byref_object_copy__12;
  BOOL v25 = __Block_byref_object_dispose__12;
  id v26 = [v10 firstObject];
  if ((unint64_t)[v10 count] >= 2)
  {
    uint64_t v11 = [(VKCImageAnalysisBaseView *)self textSelectionView];
    [v11 selectionQuadsVertexCentroid];
    double v13 = v12;
    double v15 = v14;

    if (v13 != *MEMORY[0x1E4F1DAD8] || v15 != *(double *)(MEMORY[0x1E4F1DAD8] + 8))
    {
      v20[0] = 0;
      v20[1] = v20;
      v20[2] = 0x2020000000;
      v20[3] = 0x7FF0000000000000;
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __78__VKCImageAnalysisBaseView_textSelectionView_closestVisualSearchItemForRange___block_invoke;
      v19[3] = &unk_1E6BF33D8;
      *(double *)&v19[7] = v13;
      *(double *)&v19[8] = v15;
      v19[4] = self;
      v19[5] = v20;
      v19[6] = &v21;
      [v10 enumerateObjectsUsingBlock:v19];
      _Block_object_dispose(v20, 8);
    }
  }
  id v17 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  return v17;
}

void __78__VKCImageAnalysisBaseView_textSelectionView_closestVisualSearchItemForRange___block_invoke(uint64_t a1, void *a2)
{
  id v13 = a2;
  char v4 = [v13 shouldPlaceInCorner];
  id v5 = v13;
  if ((v4 & 1) == 0)
  {
    [v13 normalizedBoundingBox];
    id v6 = +[VKQuad quadFromCGRect:](VKQuad, "quadFromCGRect:");
    id v7 = [*(id *)(a1 + 32) visualSearchView];
    id v8 = [v7 viewQuadFromNormalizedQuad:v6];

    [v8 vertexCentroid];
    double v11 = VKMDistance(*(double *)(a1 + 56), *(double *)(a1 + 64), v9, v10);
    uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
    if (v11 < *(double *)(v12 + 24))
    {
      *(double *)(v12 + 24) = v11;
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
    }

    id v5 = v13;
  }
}

- (void)generateTextualVisualSearchResultForQueryInfo:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(VKCImageAnalysisBaseView *)self delegate];
  [v8 generateTextualVisualSearchResultForQueryInfo:v7 completionHandler:v6];
}

- (id)visualSearchResultItems
{
  id v2 = [(VKCImageAnalysisBaseView *)self analysisResult];
  id v3 = [v2 visualSearchResultItems];

  return v3;
}

- (void)visualSearchItemView:(id)a3 didTapVisualSearchIndicatorWithNormalizedBoundingBox:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = [(VKCImageAnalysisBaseView *)self delegate];
  objc_msgSend(v9, "baseOverlayView:didTapVisualSearchIndicatorWithNormalizedBoundingBox:", self, x, y, width, height);
}

- (void)visualSearchItemViewDidDismissController:(id)a3
{
  [(VKCImageAnalysisBaseView *)self setVsItemPresentedFromMenu:0];
  id v4 = [(VKCImageAnalysisBaseView *)self delegate];
  [v4 baseOverlayViewDismissVisualSearchController:self];
}

- (void)generateVisualSearchResultForItems:(id)a3 queryID:(unint64_t)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [(VKCImageAnalysisBaseView *)self delegate];
  [v10 generateVisualSearchResultForItems:v9 queryID:a4 completionHandler:v8];
}

- (void)submitVisualSearchUserFeedbackForReportIdentifier:(id)a3 userFeedbackPayload:(id)a4 sfReportData:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(VKCImageAnalysisBaseView *)self delegate];
  [v11 submitVisualSearchUserFeedbackForReportIdentifier:v10 userFeedbackPayload:v9 sfReportData:v8];
}

- (void)visualSearchView:(id)a3 analyticsEventOccured:(id)a4
{
  id v5 = a4;
  id v6 = [(VKCImageAnalysisBaseView *)self delegate];
  [v6 baseOverlayView:self analyticsEventDidOccur:v5];
}

- (id)visualSearchView:(id)a3 normalizedPathForSubjectAtNormalizedPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = [(VKCImageAnalysisBaseView *)self subjectHighlightView];
  id v8 = [v7 subjectContext];

  id v9 = objc_msgSend(v8, "indexOfSubjectAtNormalizedPoint:", x, y);
  if (v9)
  {
    [(VKCImageBaseOverlayView *)self contentsRect];
    id v10 = objc_msgSend(v8, "normalizedPathForSubjectAtIndex:contentsRect:topLevelOnly:", v9, 1);
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (void)visualSearchItemViewDidActivateVSItem:(id)a3
{
  id v4 = a3;
  id v5 = [(VKCImageAnalysisBaseView *)self delegate];
  int v6 = [v5 automaticallyShowVisualSearchResults];

  if (v6)
  {
    id v7 = [v4 visualSearchResultItem];
    id v8 = [v7 analysis];
    id v9 = [v8 imageAnalysisResult];
    id v10 = [v9 request];

    id v11 = [v4 visualSearchResultItem];
    uint64_t v12 = [v11 currentInvocationType];

    if (v12)
    {
      id v13 = +[VKImageAnalyzerMadInterface sharedInterface];
      [v13 didShowVisualSearchHintsForRequest:v10 invocationType:v12];
    }
    else
    {
      double v14 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.visualSearch");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[VKCImageAnalysisBaseView visualSearchItemViewDidActivateVSItem:]((uint64_t)self, v14);
      }
    }
  }
}

- (id)presentingViewControllerForImageAnalysisInteraction
{
  id v2 = [(VKCImageAnalysisBaseView *)self delegate];
  id v3 = [v2 presentingViewControllerForImageAnalysisInteraction];

  return v3;
}

- (void)setDidAddVisualSearchCornerView:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(VKCImageAnalysisBaseView *)self visualSearchView];
  [v4 setDidAddVisualSearchCornerView:v3];
}

- (BOOL)visualSearchView:(id)a3 shouldShowDotForItem:(id)a4 allItems:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if ([(VKCImageAnalysisBaseView *)self _photosInfoSingleTapSubjectModeEnabled])
  {
    id v9 = [(VKCImageAnalysisBaseView *)self subjectHighlightView];
    id v10 = [v9 subjectContext];

    if (v10)
    {
      id v11 = [(VKCImageAnalysisBaseView *)self subjectHighlightView];
      uint64_t v12 = [(VKCImageAnalysisBaseView *)self subjectHighlightView];
      id v13 = [v12 subjectContext];
      uint64_t v14 = [v13 subjectCount];

      if (v14)
      {
        [v7 normalizedIconLocation];
        -[VKCImageBaseOverlayView viewPointFromNormalizedPoint:](self, "viewPointFromNormalizedPoint:");
        double v15 = objc_msgSend(v11, "indexOfSubjectAtPoint:");
        if (v15)
        {
          v18[0] = MEMORY[0x1E4F143A8];
          v18[1] = 3221225472;
          v18[2] = __75__VKCImageAnalysisBaseView_visualSearchView_shouldShowDotForItem_allItems___block_invoke;
          v18[3] = &unk_1E6BF3400;
          v18[4] = self;
          id v19 = v11;
          id v20 = v7;
          id v21 = v15;
          char v16 = objc_msgSend(v8, "vk_containsObjectPassingTest:", v18);
        }
        else
        {
          char v16 = 0;
        }
      }
      else
      {
        [v8 count];
        char v16 = 1;
      }
    }
    else
    {
      char v16 = 0;
    }
  }
  else
  {
    char v16 = 1;
  }

  return v16;
}

BOOL __75__VKCImageAnalysisBaseView_visualSearchView_shouldShowDotForItem_allItems___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v4 normalizedIconLocation];
  objc_msgSend(v3, "viewPointFromNormalizedPoint:");
  id v5 = objc_msgSend(*(id *)(a1 + 40), "indexOfSubjectAtPoint:");
  id v6 = *(id *)(a1 + 48);

  BOOL v7 = v6 != v4 && v5 == *(void **)(a1 + 56);
  return v7;
}

- (void)scrollViewDidZoomToUnitRect:(CGRect)a3
{
  self->_BOOL clientDidSetNormalizedRect = 1;
  -[VKCImageAnalysisBaseView setNormalizedVisibleRect:](self, "setNormalizedVisibleRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)automaticallyShowVisualSearchResultsIfApplicable
{
  if (![(VKCImageAnalysisBaseView *)self _photosInfoSingleTapSubjectModeEnabled])
  {
    id v3 = [(VKCImageAnalysisBaseView *)self visualSearchView];
    [v3 automaticallyShowVisualSearchResults];
  }
}

- (void)showTopVisualSearchResult
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.interaction");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = self;
    _os_log_impl(&dword_1DB266000, v3, OS_LOG_TYPE_DEFAULT, "ShowTopVisualSearchResult: %@", (uint8_t *)&v5, 0xCu);
  }

  id v4 = [(VKCImageAnalysisBaseView *)self visualSearchView];
  [v4 showTopVisualSearchResult];
}

- (void)addMetadataToVSFeedbackItem:(id)a3
{
  id v4 = a3;
  int v5 = [(VKCImageAnalysisBaseView *)self analysisResult];
  int v6 = [v5 analysisRequestID];

  uint64_t v7 = [(VKCImageAnalysisBaseView *)self analysisResult];
  id v8 = [v7 request];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56__VKCImageAnalysisBaseView_addMetadataToVSFeedbackItem___block_invoke;
  v10[3] = &unk_1E6BF3428;
  id v11 = v8;
  int v12 = v6;
  id v9 = v8;
  [v4 setReportAnIssueMetadataFetchingBlock:v10];
}

id __56__VKCImageAnalysisBaseView_addMetadataToVSFeedbackItem___block_invoke(uint64_t a1, void *a2)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) blockingCreatePNGAssetDataWithError:0];
  if (v4)
  {
    uint64_t v5 = *MEMORY[0x1E4F96300];
    if ([v3 containsObject:*MEMORY[0x1E4F96300]])
    {
      uint64_t v8 = v5;
      v9[0] = v4;
      int v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
      goto LABEL_6;
    }
  }
  else
  {
    +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "data != ((void *)0)", "-[VKCImageAnalysisBaseView addMetadataToVSFeedbackItem:]_block_invoke", 0, 0, @"preview image is nil for VSFeedbackItem. Request: %d", *(unsigned int *)(a1 + 40));
  }
  int v6 = (void *)MEMORY[0x1E4F1CC08];
LABEL_6:

  return v6;
}

- (void)createStickerRepresentationsAtIndexSet:(id)a3 type:(unint64_t)a4 stickerIDs:(id)a5 progress:(id)a6 completion:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a3;
  id v16 = [(VKCImageAnalysisBaseView *)self subjectHighlightView];
  [v16 createStickerRepresentationsAtIndexSet:v15 type:a4 stickerIDs:v14 progress:v13 completion:v12];
}

- (id)videoPreviewSubjectMatteAtCompositionTime:(id *)a3
{
  id v4 = [(VKCImageAnalysisBaseView *)self subjectHighlightView];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7 = *a3;
  uint64_t v5 = [v4 videoPreviewSubjectMatteAtCompositionTime:&v7];

  return v5;
}

- (id)videoPreviewSubjectMatteForImage:(id)a3 atCompositionTime:(id *)a4
{
  id v6 = a3;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7 = [(VKCImageAnalysisBaseView *)self subjectHighlightView];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = *a4;
  uint64_t v8 = [v7 videoPreviewSubjectMatteForImage:v6 atCompositionTime:&v10];

  return v8;
}

- ($0FD61D44AD30C1CDCD15B60AC4039C90)videoPreviewTimeRange
{
  id v4 = [(VKCImageAnalysisBaseView *)self subjectHighlightView];
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
  id v2 = [(VKCImageAnalysisBaseView *)self subjectHighlightView];
  [v2 videoPreviewNormalizedCropRect];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (void)sendAnalysisDidChangeAnalyticsEvent
{
  double v3 = [VKAnalyticsInteractionEvent alloc];
  double v4 = [(VKCImageAnalysisBaseView *)self analysisResult];
  unint64_t v5 = [(VKCImageAnalysisBaseView *)self activeInteractionTypes];
  double v6 = [(VKCImageBaseOverlayView *)self customAnalyticsIdentifier];
  double v8 = [(VKAnalyticsInteractionEvent *)v3 initWithEventType:2 analysis:v4 source:0 interactionTypes:v5 buttonActive:0 customIdentifier:v6];

  double v7 = [(VKCImageAnalysisBaseView *)self delegate];
  [v7 baseOverlayView:self analyticsEventDidOccur:v8];
}

- (void)sendActiveInteractionTypesDidChangeAnalyticsEvent
{
  double v3 = [VKAnalyticsInteractionEvent alloc];
  double v4 = [(VKCImageAnalysisBaseView *)self analysisResult];
  unint64_t v5 = [(VKCImageAnalysisBaseView *)self activeInteractionTypes];
  double v6 = [(VKCImageBaseOverlayView *)self customAnalyticsIdentifier];
  double v8 = [(VKAnalyticsInteractionEvent *)v3 initWithEventType:1 analysis:v4 source:0 interactionTypes:v5 buttonActive:0 customIdentifier:v6];

  double v7 = [(VKCImageAnalysisBaseView *)self delegate];
  [v7 baseOverlayView:self analyticsEventDidOccur:v8];
}

- (void)sendVisualSearchAnalyticsWithDidBecomeActive:(BOOL)a3
{
  BOOL v3 = a3;
  id v11 = [(VKCImageAnalysisBaseView *)self visualSearchView];
  unint64_t v5 = [VKAnalyticsVisualSearchEvent alloc];
  double v6 = [v11 visualSearchResult];
  double v7 = [v6 resultItems];
  double v8 = [(VKCImageBaseOverlayView *)self customAnalyticsIdentifier];
  double v9 = [(VKAnalyticsVisualSearchEvent *)v5 initWithType:!v3 items:v7 interactedItem:0 serverProcessingTime:v8 customIdentifier:0.0];

  double v10 = [(VKCImageAnalysisBaseView *)self delegate];
  [v10 baseOverlayView:self analyticsEventDidOccur:v9];
}

- (void)sendQuickActionAnalyticsWithDidBecomeVisible:(BOOL)a3
{
  BOOL v4 = a3;
  unint64_t v5 = [VKAnalyticsQuickActionEvent alloc];
  double v6 = [(VKCImageAnalysisBaseView *)self quickActions];
  uint64_t v7 = [v6 count];
  double v8 = [(VKCImageAnalysisBaseView *)self analysisResult];
  double v9 = [v8 text];
  uint64_t v10 = [v9 length];
  id v11 = [(VKCImageBaseOverlayView *)self customAnalyticsIdentifier];
  double v13 = [(VKAnalyticsQuickActionEvent *)v5 initWithQuickActionType:0 quickActionsCount:v7 textLength:v10 eventType:v4 customIdentifier:v11];

  double v12 = [(VKCImageAnalysisBaseView *)self delegate];
  [v12 baseOverlayView:self analyticsEventDidOccur:v13];
}

- (id)highlightView:(id)a3 selectionRectsForRanges:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(VKCImageAnalysisBaseView *)self analysisResult];
  uint64_t v39 = 0;
  double v40 = &v39;
  uint64_t v41 = 0x3032000000;
  char v42 = __Block_byref_object_copy__12;
  CGFloat v43 = __Block_byref_object_dispose__12;
  id v44 = 0;
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __66__VKCImageAnalysisBaseView_highlightView_selectionRectsForRanges___block_invoke;
  v36[3] = &unk_1E6BF24A0;
  uint64_t v38 = &v39;
  id v9 = v8;
  id v37 = v9;
  [v7 enumerateObjectsUsingBlock:v36];
  BOOL v27 = v7;
  unsigned int v28 = v6;
  uint64_t v10 = objc_msgSend((id)v40[5], "vk_rangeArray");
  id v11 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  double v12 = [v9 text];
  for (unint64_t i = 0; i < [v10 count] - 1; ++i)
  {
    double v14 = [v10 objectAtIndexedSubscript:i];
    uint64_t v15 = [v14 rangeValue];
    uint64_t v17 = v16;

    CGRect v18 = [v10 objectAtIndexedSubscript:i + 1];
    uint64_t v19 = [v18 rangeValue];

    uint64_t v20 = v15 + v17;
    if (v19 - v20 == 1
      && (objc_msgSend(v11, "characterIsMember:", objc_msgSend(v12, "characterAtIndex:", v20)) & 1) != 0)
    {
      [(id)v40[5] addIndex:v20];
    }
  }
  uint64_t v30 = 0;
  double v31 = &v30;
  uint64_t v32 = 0x3032000000;
  double v33 = __Block_byref_object_copy__12;
  int v34 = __Block_byref_object_dispose__12;
  id v35 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v21 = (void *)v40[5];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __66__VKCImageAnalysisBaseView_highlightView_selectionRectsForRanges___block_invoke_2;
  v29[3] = &unk_1E6BF3450;
  v29[4] = self;
  v29[5] = &v30;
  [v21 enumerateRangesUsingBlock:v29];
  uint64_t v22 = [(id)v31[5] copy];
  uint64_t v23 = (void *)v22;
  unint64_t v24 = (void *)MEMORY[0x1E4F1CBF0];
  if (v22) {
    unint64_t v24 = (void *)v22;
  }
  id v25 = v24;

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v39, 8);

  return v25;
}

void __66__VKCImageAnalysisBaseView_highlightView_selectionRectsForRanges___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v13 = v3;
  if (!v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    id v3 = v13;
    BOOL v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  }
  double v8 = *(void **)(a1 + 32);
  id v9 = [v3 start];
  uint64_t v10 = [v8 smallestSelectableRangeForPosition:v9];
  uint64_t v11 = [v10 nsRange];
  objc_msgSend(v4, "addIndexesInRange:", v11, v12);
}

void __66__VKCImageAnalysisBaseView_highlightView_selectionRectsForRanges___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v8 = [*(id *)(a1 + 32) textSelectionView];
  uint64_t v6 = -[VKTextRange initWithRange:]([VKTextRange alloc], "initWithRange:", a2, a3);
  id v7 = [v8 selectionRectsForRange:v6];
  objc_msgSend(v5, "vk_addObjectsFromNonNilArray:", v7);
}

- (void)willDisplayMenuForActionInfoButton:(id)a3
{
  id v5 = a3;
  BOOL v4 = [(VKCImageAnalysisBaseView *)self textSelectionView];
  [v4 suppressSelectionViewGrabbers];

  [(VKCImageAnalysisBaseView *)self actionInfoButtonDidActivatePrimaryAction:v5];
}

- (void)willHideMenuForActionInfoButton:(id)a3
{
  id v3 = [(VKCImageAnalysisBaseView *)self textSelectionView];
  [v3 unsuppressSelectionViewGrabbers];
}

- (void)actionInfoButtonDidActivatePrimaryAction:(id)a3
{
  BOOL v4 = [a3 representedElement];
  VKMUIStringForDDTypes([v4 dataDetectorTypes]);
  id v14 = (id)objc_claimAutoreleasedReturnValue();

  id v5 = [VKAnalyticsQuickActionEvent alloc];
  uint64_t v6 = [(VKCImageAnalysisBaseView *)self quickActions];
  uint64_t v7 = [v6 count];
  id v8 = [(VKCImageAnalysisBaseView *)self analysisResult];
  id v9 = [v8 text];
  uint64_t v10 = [v9 length];
  uint64_t v11 = [(VKCImageBaseOverlayView *)self customAnalyticsIdentifier];
  uint64_t v12 = [(VKAnalyticsQuickActionEvent *)v5 initWithQuickActionType:v14 quickActionsCount:v7 textLength:v10 eventType:2 customIdentifier:v11];

  id v13 = [(VKCImageAnalysisBaseView *)self delegate];
  [v13 baseOverlayView:self analyticsEventDidOccur:v12];
}

- (id)disposableFolderPath
{
  id v2 = NSTemporaryDirectory();
  id v3 = [v2 stringByAppendingPathComponent:@"VKTemp"];

  return v3;
}

- (id)disposableSubjectPNGURLWithTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(VKCImageAnalysisBaseView *)self disposableFolderPath];
  uint64_t v6 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v7 = [v6 UUIDString];
  id v8 = [v5 stringByAppendingPathComponent:v7];

  id v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  if (([v9 fileExistsAtPath:v8] & 1) == 0) {
    [v9 createDirectoryAtPath:v8 withIntermediateDirectories:1 attributes:0 error:0];
  }
  uint64_t v10 = [v8 stringByAppendingPathComponent:v4];

  uint64_t v11 = [v10 stringByAppendingPathExtension:@"png"];

  uint64_t v12 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v11];

  return v12;
}

- (void)deleteDisposableFiles
{
  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v3 = [(VKCImageAnalysisBaseView *)self disposableFolderPath];
  [v4 removeItemAtPath:v3 error:0];
}

- (BOOL)isShowingTranslation
{
  return self->_isShowingTranslation;
}

- (BOOL)subjectHighlightFeatureFlagEnabled
{
  return self->_subjectHighlightFeatureFlagEnabled;
}

- (void)setSubjectHighlightFeatureFlagEnabled:(BOOL)a3
{
  self->_subjectHighlightFeatureFlagEnabled = a3;
}

- (VKCImageAnalysisResult)analysisResult
{
  return self->_analysisResult;
}

- (BOOL)isPublicAPI
{
  return self->_isPublicAPI;
}

- (void)setIsPublicAPI:(BOOL)a3
{
  self->_isPublicAPI = a3;
}

- (id)loggingParentObject
{
  id WeakRetained = objc_loadWeakRetained(&self->_loggingParentObject);
  return WeakRetained;
}

- (void)setLoggingParentObject:(id)a3
{
}

- (VKCImageTextSelectionView)textSelectionView
{
  return self->_textSelectionView;
}

- (void)setTextSelectionView:(id)a3
{
}

- (void)setDataDetectorView:(id)a3
{
}

- (void)setVisualSearchView:(id)a3
{
}

- (VKCImageTranslationView)translationView
{
  return self->_translationView;
}

- (void)setTranslationView:(id)a3
{
}

- (VKCImageAnalysisBaseViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VKCImageAnalysisBaseViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)activeInteractionTypes
{
  return self->_activeInteractionTypes;
}

- (BOOL)longPressDataDetectorsInTextMode
{
  return self->_longPressDataDetectorsInTextMode;
}

- (BOOL)wantsAutomaticContentsRectCalculation
{
  return self->_wantsAutomaticContentsRectCalculation;
}

- (void)setVisibleImageRect:(CGRect)a3
{
  self->_visibleImageRect = a3;
}

- (NSArray)quickActions
{
  return self->_quickActions;
}

- (unint64_t)dataDetectorTypes
{
  return self->_dataDetectorTypes;
}

- (VKVisibleTextAreaInfo)visibleTextAreaInfo
{
  long long v3 = *(_OWORD *)&self[21].averageQuadHeight;
  *(_OWORD *)&retstr->boundingBoxArea = *(_OWORD *)&self[20].dataDetectors;
  *(_OWORD *)&retstr->maxQuadHeight = v3;
  retstr->dataDetectors = *(void *)&self[21].minQuadHeight;
  return self;
}

- (void)setVisibleTextAreaInfo:(VKVisibleTextAreaInfo *)a3
{
  unint64_t dataDetectors = a3->dataDetectors;
  long long v4 = *(_OWORD *)&a3->maxQuadHeight;
  *(_OWORD *)&self->_visibleTextAreaInfo.boundingBoxArea = *(_OWORD *)&a3->boundingBoxArea;
  *(_OWORD *)&self->_visibleTextAreaInfo.maxQuadHeight = v4;
  self->_visibleTextAreaInfo.unint64_t dataDetectors = dataDetectors;
}

- (UIView)viewForObservingContentMode
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewForObservingContentMode);
  return (UIView *)WeakRetained;
}

- (VKCActionInfoView)actionInfoView
{
  return self->_actionInfoView;
}

- (UIFont)actionInfoCustomFont
{
  return self->_actionInfoCustomFont;
}

- (BOOL)stringHighlightsActive
{
  return self->_stringHighlightsActive;
}

- (void)setStringHighlightsActive:(BOOL)a3
{
  self->_stringHighlightsActive = a3;
}

- (BOOL)didAddVisualSearchCornerView
{
  return self->_didAddVisualSearchCornerView;
}

- (OS_dispatch_queue)backgroundQueue
{
  return self->_backgroundQueue;
}

- (void)setBackgroundQueue:(id)a3
{
}

- (void)setRegexHighlightView:(id)a3
{
}

- (void)setSubjectHighlightView:(id)a3
{
}

- (BOOL)didLogContentsRectError
{
  return self->_didLogContentsRectError;
}

- (void)setDidLogContentsRectError:(BOOL)a3
{
  self->_didLogContentsRectError = a3;
}

- (unint64_t)checkForQuickActionsIndex
{
  return self->_checkForQuickActionsIndex;
}

- (void)setCheckForQuickActionsIndex:(unint64_t)a3
{
  self->_checkForQuickActionsIndedouble x = a3;
}

- (BOOL)visibleTextAreaInfoIsValid
{
  return self->_visibleTextAreaInfoIsValid;
}

- (void)setVisibleTextAreaInfoIsValid:(BOOL)a3
{
  self->_visibleTextAreaInfoIsValid = a3;
}

- (BOOL)isAnalysisVisible
{
  return self->_isAnalysisVisible;
}

- (void)setIsAnalysisVisible:(BOOL)a3
{
  self->_isAnalysisVisible = a3;
}

- (BOOL)_hasActiveTextSelection
{
  return self->__hasActiveTextSelection;
}

- (NSArray)highlightStrings
{
  return self->_highlightStrings;
}

- (void)setHighlightStrings:(id)a3
{
}

- (NSIndexSet)highlightStringsIndexSet
{
  return self->_highlightStringsIndexSet;
}

- (void)setHighlightStringsIndexSet:(id)a3
{
}

- (UIImageView)debugImageView
{
  return self->_debugImageView;
}

- (void)setDebugImageView:(id)a3
{
}

- (VKCRemoveBackgroundRequestHandler)removeBackgroundRequestHandler
{
  return self->_removeBackgroundRequestHandler;
}

- (void)setRemoveBackgroundRequestHandler:(id)a3
{
}

- (VKCRemoveBackgroundRequest)inProcessMaskRemoveBackgroundRequest
{
  return self->_inProcessMaskRemoveBackgroundRequest;
}

- (void)setInProcessMaskRemoveBackgroundRequest:(id)a3
{
}

- (BOOL)clientDidSetNormalizedRect
{
  return self->_clientDidSetNormalizedRect;
}

- (void)setClientDidSetNormalizedRect:(BOOL)a3
{
  self->_BOOL clientDidSetNormalizedRect = a3;
}

- (BOOL)highlightedMenuItemUpdateScheduled
{
  return self->_highlightedMenuItemUpdateScheduled;
}

- (void)setHighlightedMenuItemUpdateScheduled:(BOOL)a3
{
  self->_highlightedMenuItemUpdateScheduled = a3;
}

- (void)setCopyAllQuickAction:(id)a3
{
}

- (void)setTranslateQuickAction:(id)a3
{
}

- (UILabel)textInfoView
{
  return self->_textInfoView;
}

- (void)setTextInfoView:(id)a3
{
}

- (VKTextRange)selectedTextRangeBeforeDataDetectorMenu
{
  return self->_selectedTextRangeBeforeDataDetectorMenu;
}

- (void)setSelectedTextRangeBeforeDataDetectorMenu:(id)a3
{
}

- (VKCAnalysisDebugMenuProvider)debugMenuProvider
{
  return self->_debugMenuProvider;
}

- (void)setDebugMenuProvider:(id)a3
{
}

- (UIScrollView)scrollViewToObserve
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollViewToObserve);
  return (UIScrollView *)WeakRetained;
}

- (int64_t)scrollViewToObserveCount
{
  return self->_scrollViewToObserveCount;
}

- (void)setScrollViewToObserveCount:(int64_t)a3
{
  self->_scrollViewToObserveCount = a3;
}

- (BOOL)actionInfoHiddenForZoomAnimation
{
  return self->_actionInfoHiddenForZoomAnimation;
}

- (void)setActionInfoHiddenForZoomAnimation:(BOOL)a3
{
  self->_actionInfoHiddenForZoomAnimation = a3;
}

- (VKCVisualSearchResultItem)vsItemPresentedFromMenu
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_vsItemPresentedFromMenu);
  return (VKCVisualSearchResultItem *)WeakRetained;
}

- (void)setVsItemPresentedFromMenu:(id)a3
{
}

- (CALayer)layerForObservingContentsRect
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layerForObservingContentsRect);
  return (CALayer *)WeakRetained;
}

- (CGRect)frameWhenResigningActive
{
  double x = self->_frameWhenResigningActive.origin.x;
  double y = self->_frameWhenResigningActive.origin.y;
  double width = self->_frameWhenResigningActive.size.width;
  double height = self->_frameWhenResigningActive.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setFrameWhenResigningActive:(CGRect)a3
{
  self->_frameWhenResigningActive = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_layerForObservingContentsRect);
  objc_destroyWeak((id *)&self->_vsItemPresentedFromMenu);
  objc_destroyWeak((id *)&self->_scrollViewToObserve);
  objc_storeStrong((id *)&self->_debugMenuProvider, 0);
  objc_storeStrong((id *)&self->_selectedTextRangeBeforeDataDetectorMenu, 0);
  objc_storeStrong((id *)&self->_textInfoView, 0);
  objc_storeStrong((id *)&self->_translateQuickAction, 0);
  objc_storeStrong((id *)&self->_copyAllQuickAction, 0);
  objc_storeStrong((id *)&self->_inProcessMaskRemoveBackgroundRequest, 0);
  objc_storeStrong((id *)&self->_removeBackgroundRequestHandler, 0);
  objc_storeStrong((id *)&self->_debugImageView, 0);
  objc_storeStrong((id *)&self->_highlightStringsIndexSet, 0);
  objc_storeStrong((id *)&self->_highlightStrings, 0);
  objc_storeStrong((id *)&self->_subjectHighlightView, 0);
  objc_storeStrong((id *)&self->_regexHighlightView, 0);
  objc_storeStrong((id *)&self->_backgroundQueue, 0);
  objc_storeStrong((id *)&self->_actionInfoCustomFont, 0);
  objc_storeStrong((id *)&self->_actionInfoView, 0);
  objc_destroyWeak((id *)&self->_viewForObservingContentMode);
  objc_storeStrong((id *)&self->_quickActions, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_translationView, 0);
  objc_storeStrong((id *)&self->_visualSearchView, 0);
  objc_storeStrong((id *)&self->_dataDetectorView, 0);
  objc_storeStrong((id *)&self->_textSelectionView, 0);
  objc_destroyWeak(&self->_loggingParentObject);
  objc_storeStrong((id *)&self->_analysisResult, 0);
}

- (void)visualSearchItemViewDidActivateVSItem:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DB266000, a2, OS_LOG_TYPE_ERROR, "invocationType should not be VKCVSInvocationTypeUnknown : %@", (uint8_t *)&v2, 0xCu);
}

@end