@interface BKHTMLContentViewController
- (AEHighlightRenderingController)highlightRenderingController;
- (BEKindOfWebView)webView;
- (BKActivityIndicatorOverlayView)activityIndicator;
- (BKAnnotationDataProvider)annotationDataProvider;
- (BKHTMLContentViewController)init;
- (BKReadAloudEventHandler)readAloudEventHandler;
- (BKWK2WebViewLoader)loader;
- (BKWebViewProxy)webViewProxy;
- (BOOL)_accessibilityQuickSpeakContentIsSpeakable;
- (BOOL)_bkaxPerformSelector:(id)a3;
- (BOOL)_hasDraggableSelectionAtPosition:(CGPoint)a3;
- (BOOL)_isCachedAnnotationRectVisible:(id)a3 considerEntirePage:(BOOL)a4;
- (BOOL)_isDoubleWide;
- (BOOL)_shouldBeginCustomHighlighterActionForTouchType:(int64_t)a3 modifierFlags:(int64_t)initialTextInteractionModifiers;
- (BOOL)_shouldDoubleTapReceiveTouch:(id)a3;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canCopyContent;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)contentBasedOverlayRefreshScheduled;
- (BOOL)contentNeedsFilter;
- (BOOL)currentlyHighlighting;
- (BOOL)firstSignificantPaintCompleted;
- (BOOL)gestureRecognizer:(id)a3 canBePreventedByGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)hasTextSelected;
- (BOOL)haveDeterminedInitialModifiers;
- (BOOL)interactionShouldBegin:(id)a3 atPoint:(CGPoint)a4;
- (BOOL)isAnnotationVisible:(id)a3;
- (BOOL)isLoading;
- (BOOL)isLocationFromThisDocument:(id)a3;
- (BOOL)isLocationOnCurrentPage:(id)a3;
- (BOOL)isRectVisible:(id)a3;
- (BOOL)navigationHandler:(id)a3 handleInternalLoadRequest:(id)a4;
- (BOOL)preflightTap:(id)a3;
- (BOOL)shouldHighlightReceiveTouch:(id)a3;
- (BOOL)shouldShowExpandedContentForURL:(id)a3;
- (BOOL)supportsExpandedContent;
- (BOOL)supportsNotesAndHighlights;
- (CGPoint)_originPointForPoint:(CGPoint)a3;
- (CGPoint)_webkit2LocationForContentViewPoint:(CGPoint)a3;
- (CGPoint)overrideBuildMenuLocation;
- (CGRect)_contentRectFromRects:(id)a3 visible:(BOOL)a4;
- (CGRect)cachedRectForAnnotation:(id)a3;
- (CGRect)cachedVisibleRectForAnnotation:(id)a3;
- (CGRect)rectForLocation:(id)a3;
- (CGRect)rectForLocation:(id)a3 adjustedForContentOffset:(BOOL)a4;
- (CGRect)rectForPresentedMenuForTextInteraction;
- (IMPerformSelectorProxy)performSelectorProxy;
- (NSDictionary)currentHighlightSearchSelection;
- (NSMutableDictionary)annotationRectUnionCache;
- (NSMutableDictionary)annotationRectsCache;
- (NSString)mediaSource;
- (NSString)visibleCFIString;
- (UIGestureRecognizer)indirectHighlightRecognizer;
- (UILongPressGestureRecognizer)indirectImmediateHighlightRecognizer;
- (UIScrollView)contentScrollView;
- (double)_timeIntervalForHighlightGesture;
- (double)underlinePercent;
- (id)URLForLoadingDocument;
- (id)_accessibilityQuickSpeakContent;
- (id)_activityItemsConfiguration;
- (id)_annotationUuidIntersectingPoint:(CGPoint)a3 inView:(id)a4 annotationLayerRect:(CGRect *)a5;
- (id)_errorForURL:(id)a3;
- (id)_excerptCitedStringForAnnotation:(id)a3;
- (id)_highlightRects:(id)a3 withHighlightType:(int)a4 owner:(id)a5 forWK2:(BOOL)a6 clearSelection:(BOOL)a7;
- (id)_payloadForKey:(id)a3 fromSender:(id)a4;
- (id)_preflightTapLocation:(CGPoint)a3;
- (id)_rectsFromDictionary:(id)a3;
- (id)adjustedItemProvidersWithCitation:(id)a3 withExcerptString:(id)a4;
- (id)annotations;
- (id)arrayOfVisibleRectsFromRects:(id)a3;
- (id)arrayOfVisibleRectsFromRects:(id)a3 contentRect:(CGRect)a4;
- (id)author;
- (id)bookTitle;
- (id)currentLocation;
- (id)handler:(id)a3 citationForText:(id)a4 webView:(id)a5;
- (id)highlightRangeFromRects:(id)a3;
- (id)highlightViewContainerWK2;
- (id)locationEnsuredFirstPaintWorkBlock;
- (id)nextResponder;
- (id)objectForMatchingAnnotation:(id)a3;
- (id)pageNumberStringForAnnotation:(id)a3;
- (id)pathForSoundtrack;
- (id)predicateForOverlayCache;
- (id)preservedSelectionHighlights;
- (id)selectedAnnotation;
- (id)selectedText;
- (id)selectedTextForAccessibility;
- (id)storeURL;
- (id)stylesheetSet;
- (id)tempOwnerID;
- (id)webView2;
- (int64_t)effectivePageOffset;
- (int64_t)initialTextInteractionModifiers;
- (int64_t)totalPages;
- (int64_t)visiblePageCount;
- (unint64_t)loadFailureCount;
- (unint64_t)pageOffsetForLocation:(id)a3;
- (void)__webView2_performHighlighterActionWithGestureState:(int64_t)a3 location:(CGPoint)a4 isTouch:(BOOL)a5;
- (void)_annotationChanged:(id)a3 forceRender:(BOOL)a4;
- (void)_bkaxCheckCanPerformEditActions;
- (void)_bkaxPerformEditAction:(id)a3;
- (void)_bookmarkSelectionAndAnnotate:(BOOL)a3 showColorEditor:(BOOL)a4;
- (void)_bookmarkSelectionAndAnnotate:(BOOL)a3 showColorEditor:(BOOL)a4 completion:(id)a5;
- (void)_combineAnnotation:(id)a3 withAnnotation:(id)a4;
- (void)_contentForSelectedRangeWithCompletion:(id)a3;
- (void)_contentRectForLocation:(id)a3 visible:(BOOL)a4 completion:(id)a5;
- (void)_extractSelectedTextWithSender:(id)a3 completion:(id)a4;
- (void)_fetchMissingCfiLocationRects:(id)a3 forAnnotations:(id)a4;
- (void)_handleStylusGesture:(id)a3;
- (void)_highlightAnnotation:(id)a3;
- (void)_highlightAnnotation:(id)a3 rects:(id)a4;
- (void)_highlightAnnotationWK2:(id)a3;
- (void)_highlightLocation:(id)a3 withHighlightType:(int)a4 owner:(id)a5;
- (void)_highlightTimerFired:(id)a3;
- (void)_performHighlighterActionWithGestureState:(int64_t)a3 location:(CGPoint)a4;
- (void)_recheckRemoveAccessApproval;
- (void)_refreshAnnotationsAndSearchResult;
- (void)_refreshContentBasedOverlay;
- (void)_refreshContentBasedOverlayAfterDelay;
- (void)_resetInteractionTracking;
- (void)_scheduleInteractionReset;
- (void)_setupAnnotationRectCachesFromClientRects:(id)a3;
- (void)_setupSelectionContextMenu;
- (void)_share:(id)a3;
- (void)_shareAnnotation:(id)a3 annotationRects:(id)a4;
- (void)_showAnnotationWithState:(BOOL)a3 showColorEditor:(BOOL)a4 forAnnotation:(id)a5;
- (void)_showAnnotations:(BOOL)a3;
- (void)_showMenuForRect:(CGRect)a3;
- (void)_smilElementIDSelected:(id)a3 inHREF:(id)a4;
- (void)_updateReadingState;
- (void)_updateReadingStateVisibilityPossible:(BOOL)a3;
- (void)_updateReadingStateVisibilityPossible:(BOOL)a3 knownDOMRange:(id)a4;
- (void)_willMoveTextRangeExtentAtPoint:(CGPoint)a3;
- (void)addHighlightToCurrentSelection:(id)a3;
- (void)addNote:(id)a3;
- (void)addNoteToCurrentSelection:(id)a3;
- (void)adjustGesturesForTextInteractionAssistant:(id)a3 view:(id)a4;
- (void)afterEnsuringFirstPaintPerform:(id)a3;
- (void)annotateSelection:(id)a3;
- (void)bookmarkSelection:(id)a3;
- (void)books_useSelectionForFind:(id)a3;
- (void)buildMenuWithBuilder:(id)a3 inWebView:(id)a4 atPoint:(CGPoint)a5;
- (void)changeAnnotationStyle:(id)a3;
- (void)changeAnnotationStyle:(id)a3 annotation:(id)a4;
- (void)cleanDocumentForMediaOverlay;
- (void)clearHighlights;
- (void)clearHighlightsForSearchResults;
- (void)clearMediaOverlayElement:(id)a3;
- (void)clearSearchLocation;
- (void)clearSelectedAnnotation;
- (void)clearSelection;
- (void)clearSelectionHighlights;
- (void)contentReady;
- (void)contentRectForAnnotation:(id)a3 completion:(id)a4;
- (void)contentRectForLocation:(id)a3 completion:(id)a4;
- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7;
- (void)controllerDidChangeContent:(id)a3;
- (void)controllerWillChangeContent:(id)a3;
- (void)copy:(id)a3;
- (void)copyContent;
- (void)dealloc;
- (void)didChangeLocationClosing:(BOOL)a3;
- (void)drawHighlights;
- (void)dummyAnnotationForSelectionWK2WithCompletion:(id)a3;
- (void)endOfBook:(id)a3;
- (void)handleTap:(id)a3;
- (void)handler:(id)a3 presentAlertController:(id)a4 completion:(id)a5;
- (void)handler:(id)a3 webView:(id)a4 didNotHandleTapAsClickAtPoint:(CGPoint)a5;
- (void)highlightAnnotations:(id)a3;
- (void)highlightMediaOverlayElement:(id)a3;
- (void)highlightSearchLocation:(id)a3;
- (void)installReadAloudClickHandlersOnMediaOverlayElements:(id)a3;
- (void)interactionDidEnd:(id)a3;
- (void)invalidateContentBasedOverlay;
- (void)invalidateContentBasedOverlayCache;
- (void)invokedSMILControlAction:(int)a3 withSMILTurnStyle:(int)a4;
- (void)isLocationVisible:(id)a3 annotation:(id)a4 completion:(id)a5;
- (void)load;
- (void)lookupSelection:(id)a3;
- (void)markupDocumentForMediaOverlay;
- (void)menuWillClose:(id)a3;
- (void)navigationHandler:(id)a3 didFinishLoadOfURL:(id)a4;
- (void)navigationHandler:(id)a3 didStartLoadOfURL:(id)a4;
- (void)navigationHandler:(id)a3 handleExternalLoadRequest:(id)a4 likelyUserInitiated:(BOOL)a5;
- (void)navigationHandler:(id)a3 handleUserRequestForFrameToLoadExternalURL:(id)a4 completion:(id)a5;
- (void)navigationHandlerFirstSignificantPaintCompleted:(id)a3;
- (void)navigationHandlerWebContentLoadFailed:(id)a3 reason:(id)a4;
- (void)navigationHandlerWebContentProcessAttemptingReload:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)pageOffsetRangeForLocation:(id)a3 completion:(id)a4;
- (void)playFirstVisibleAutoplayMediaObject;
- (void)prepareContentBasedOverlayCache;
- (void)prepareForReuse;
- (void)readAloudEventHandler:(id)a3 audioElementEnded:(id)a4;
- (void)readAloudEventHandler:(id)a3 foundMediaSource:(id)a4;
- (void)readAloudEventHandler:(id)a3 performedAction:(id)a4 turnStyle:(id)a5;
- (void)readAloudEventHandler:(id)a3 tappedElementID:(id)a4 inHref:(id)a5;
- (void)rectForLocation:(id)a3 completion:(id)a4;
- (void)registerScriptMessageHandlersWithUserContentController:(id)a3;
- (void)releaseViews;
- (void)reload;
- (void)removeDummyHighlight;
- (void)removeHighlightForAnnotation:(id)a3;
- (void)removeNote:(id)a3;
- (void)removeNoteAndHighlight:(id)a3;
- (void)removeReadAloudClickHandlersOnMediaOverlayElements:(id)a3;
- (void)resume;
- (void)searchUsingSelection:(id)a3;
- (void)searchWeb:(id)a3;
- (void)searchWikipedia:(id)a3;
- (void)selectAnnotation:(id)a3;
- (void)selectBookmarkedLink:(id)a3;
- (void)selectLocation:(id)a3 completion:(id)a4;
- (void)setActivityIndicator:(id)a3;
- (void)setActivityIndicatorVisible:(BOOL)a3 animated:(BOOL)a4 afterDelay:(double)a5;
- (void)setAnnotationDataProvider:(id)a3;
- (void)setAnnotationRectUnionCache:(id)a3;
- (void)setAnnotationRectsCache:(id)a3;
- (void)setContentBasedOverlayRefreshScheduled:(BOOL)a3;
- (void)setCurrentHighlightSearchSelection:(id)a3;
- (void)setEstimatedContentSize:(CGSize)a3;
- (void)setFirstSignificantPaintCompleted:(BOOL)a3;
- (void)setHaveDeterminedInitialModifiers:(BOOL)a3;
- (void)setHighlightRenderingController:(id)a3;
- (void)setHighlightViews:(id)a3;
- (void)setIgnorePageTurnGestures:(BOOL)a3;
- (void)setIndirectHighlightRecognizer:(id)a3;
- (void)setIndirectImmediateHighlightRecognizer:(id)a3;
- (void)setInitialTextInteractionModifiers:(int64_t)a3;
- (void)setLoadFailureCount:(unint64_t)a3;
- (void)setLoader:(id)a3;
- (void)setLocationEnsuredFirstPaintWorkBlock:(id)a3;
- (void)setMediaSource:(id)a3;
- (void)setNeedsRestyle;
- (void)setOrdinal:(int64_t)a3;
- (void)setOverrideBuildMenuLocation:(CGPoint)a3;
- (void)setReadAloudEventHandler:(id)a3;
- (void)setRectForPresentedMenuForTextInteraction:(CGRect)a3;
- (void)setSupportsExpandedContent:(BOOL)a3;
- (void)setTempOwnerID:(id)a3;
- (void)setTheme:(id)a3;
- (void)setTheme:(id)a3 force:(BOOL)a4;
- (void)setVisibleCFIString:(id)a3;
- (void)setWebViewProxy:(id)a3;
- (void)setupNotifications;
- (void)shareSelection:(id)a3;
- (void)showContextMenuAtLocation:(CGPoint)a3;
- (void)showHighlightingMenuForAnnotation:(id)a3;
- (void)startActivityIndicatorAfterDelay:(double)a3;
- (void)startFetchingAnnotations;
- (void)stopActivityIndicator:(BOOL)a3;
- (void)stopPlayingMedia:(BOOL)a3;
- (void)stopPlayingMediaIfNoLongerVisible;
- (void)suspend;
- (void)teardownNotifications;
- (void)translateSelection:(id)a3;
- (void)updateReadingStatisticsForScroll;
- (void)userContentController:(id)a3 didReceiveScriptMessage:(id)a4;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)visibleRectForLocation:(id)a3 completion:(id)a4;
- (void)webViewDidEnterFullscreen:(id)a3;
- (void)webViewDidExitFullscreen:(id)a3;
- (void)webViewFullscreenMayReturnToInline:(id)a3;
- (void)webViewLoader:(id)a3 didUpdateCurrentVisibleCFILocation:(id)a4;
- (void)writeAnnotationsToWebProcessPlugin:(id)a3 andHighlights:(id)a4;
- (void)writeControlVisibilityStateToWebProcessPlugin:(BOOL)a3;
@end

@implementation BKHTMLContentViewController

- (void)setIgnorePageTurnGestures:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(BKContentViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 setIgnorePageTurnGestures:v3];
  }
}

- (void)adjustGesturesForTextInteractionAssistant:(id)a3 view:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v7 = [(WKWebView *)self->_webView2 be_textInputChild];

  if (v7 == v6)
  {
    v8 = [v13 loupeGesture];
    [v8 setMinimumPressDuration:0.25];
    [v8 setAllowedTouchTypes:&off_1E95C8];
    [(BKHTMLContentViewController *)self _timeIntervalForHighlightGesture];
    [v8 setBe_gestureDelay:];
    if (!self->_indirectImmediateHighlightRecognizer)
    {
      v9 = (UILongPressGestureRecognizer *)[objc_alloc((Class)UILongPressGestureRecognizer) initWithTarget:self action:"_handleStylusGesture:"];
      indirectImmediateHighlightRecognizer = self->_indirectImmediateHighlightRecognizer;
      self->_indirectImmediateHighlightRecognizer = v9;

      [(UILongPressGestureRecognizer *)self->_indirectImmediateHighlightRecognizer setMinimumPressDuration:0.0];
      [(UILongPressGestureRecognizer *)self->_indirectImmediateHighlightRecognizer setDelegate:self];
      [(UILongPressGestureRecognizer *)self->_indirectImmediateHighlightRecognizer setAllowedTouchTypes:&off_1E95E0];
      [v6 addGestureRecognizer:self->_indirectImmediateHighlightRecognizer];
    }
    if (!self->_indirectHighlightRecognizer)
    {
      v11 = (UIGestureRecognizer *)[objc_alloc((Class)UIPanGestureRecognizer) initWithTarget:self action:"_handleStylusGesture:"];
      indirectHighlightRecognizer = self->_indirectHighlightRecognizer;
      self->_indirectHighlightRecognizer = v11;

      [(UIGestureRecognizer *)self->_indirectHighlightRecognizer setDelegate:self];
      [(UIGestureRecognizer *)self->_indirectHighlightRecognizer setAllowedTouchTypes:&off_1E95F8];
      [v6 addGestureRecognizer:self->_indirectHighlightRecognizer];
    }
  }
}

- (void)showContextMenuAtLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = [(BKHTMLContentViewController *)self webView2];
  [v6 be_contentView];
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    id v7 = [(BKHTMLContentViewController *)self view];
    [v12 convertPoint:v7 fromView:x, y];
    double v9 = v8;
    double v11 = v10;

    -[BKHTMLContentViewController setOverrideBuildMenuLocation:](self, "setOverrideBuildMenuLocation:", v9, v11);
    -[BKHTMLContentViewController setOverrideBuildMenuLocation:](self, "setOverrideBuildMenuLocation:", CGPointZero.x, CGPointZero.y);
  }
}

- (BOOL)interactionShouldBegin:(id)a3 atPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v6 = [(BKHTMLContentViewController *)self webView2];
  unsigned __int8 v7 = [v6 be_hasSelectablePositionAtPoint:x, y];

  return v7;
}

- (void)interactionDidEnd:(id)a3
{
  id v38 = a3;
  id v4 = [(BKHTMLContentViewController *)self webView2];
  v5 = [v4 be_selectionRects];

  id v6 = [v5 firstObject];
  unsigned __int8 v7 = [v5 lastObject];
  if ([v5 count])
  {
    [v6 CGRectValue];
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    [v7 CGRectValue];
    v45.origin.double x = v16;
    v45.origin.double y = v17;
    v45.size.double width = v18;
    v45.size.double height = v19;
    v40.origin.double x = v9;
    v40.origin.double y = v11;
    v40.size.double width = v13;
    v40.size.double height = v15;
    CGRect v41 = CGRectUnion(v40, v45);
    double width = v41.size.width;
    double height = v41.size.height;
    [v6 CGRectValue:v41.origin.x, v41.origin.y];
    double x = v22;
    double y = v24;
    if (!v7) {
      goto LABEL_7;
    }
  }
  else
  {
    double x = CGRectNull.origin.x;
    double y = CGRectNull.origin.y;
    double width = CGRectNull.size.width;
    double height = CGRectNull.size.height;
    if (!v7) {
      goto LABEL_7;
    }
  }
  [(BKHTMLContentViewController *)self rectForPresentedMenuForTextInteraction];
  v46.origin.double x = x;
  v46.origin.double y = y;
  v46.size.double width = width;
  v46.size.double height = height;
  if (!CGRectEqualToRect(v42, v46))
  {
    [v7 CGRectValue];
    CGFloat v27 = v26;
    CGFloat v29 = v28;
    CGFloat v31 = v30;
    CGFloat v33 = v32;
    -[BKHTMLContentViewController setRectForPresentedMenuForTextInteraction:](self, "setRectForPresentedMenuForTextInteraction:", x, y, width, height);
    v43.origin.double x = v27;
    v43.origin.double y = v29;
    v43.size.double width = v31;
    v43.size.double height = v33;
    double MaxX = CGRectGetMaxX(v43);
    v44.origin.double x = v27;
    v44.origin.double y = v29;
    v44.size.double width = v31;
    v44.size.double height = v33;
    double MaxY = CGRectGetMaxY(v44);
    v36 = [(BKHTMLContentViewController *)self view];
    v37 = [v38 view];
    [v36 convertPoint:v37 fromView:MaxX, MaxY];
    -[BKHTMLContentViewController showContextMenuAtLocation:](self, "showContextMenuAtLocation:");
  }
LABEL_7:
}

- (void)buildMenuWithBuilder:(id)a3 inWebView:(id)a4 atPoint:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  id v9 = a3;
  id v10 = a4;
  [(BKHTMLContentViewController *)self overrideBuildMenuLocation];
  if (v12 != CGPointZero.x || v11 != CGPointZero.y)
  {
    [(BKHTMLContentViewController *)self overrideBuildMenuLocation];
    double x = v14;
    double y = v15;
  }
  [(BKHTMLContentViewController *)self clearSelectedAnnotation];
  CGFloat v16 = [v10 be_textInputChild];
  CGFloat v17 = [(BKHTMLContentViewController *)self view];
  [v16 convertPoint:v17 toView:x, y];
  double v19 = v18;
  double v21 = v20;

  id v22 = -[BKHTMLContentViewController _preflightTapLocation:](self, "_preflightTapLocation:", v19, v21);
  v23 = [(BKHTMLContentViewController *)self selectedText];
  [v10 be_selectionRects];
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  id v24 = (id)objc_claimAutoreleasedReturnValue();
  id v25 = [v24 countByEnumeratingWithState:&v82 objects:v93 count:16];
  if (v25)
  {
    id v26 = v25;
    uint64_t v27 = *(void *)v83;
    while (2)
    {
      for (i = 0; i != v26; i = (char *)i + 1)
      {
        if (*(void *)v83 != v27) {
          objc_enumerationMutation(v24);
        }
        [*(id *)(*((void *)&v82 + 1) + 8 * i) CGRectValue];
        CGRect v96 = CGRectInset(v95, -10.0, -10.0);
        v94.double x = x;
        v94.double y = y;
        if (CGRectContainsPoint(v96, v94))
        {
          char v29 = 0;
          goto LABEL_16;
        }
      }
      id v26 = [v24 countByEnumeratingWithState:&v82 objects:v93 count:16];
      if (v26) {
        continue;
      }
      break;
    }
  }
  char v29 = 1;
LABEL_16:

  double v30 = [(BKHTMLContentViewController *)self selectedAnnotation];
  CGFloat v31 = [(BKHTMLContentViewController *)self _activityItemsConfiguration];
  [(BKHTMLContentViewController *)self setActivityItemsConfiguration:v31];

  [(__CFString *)v23 length];
  if (v23 && [(__CFString *)v23 length])
  {
    if (v30) {
      char v32 = 0;
    }
    else {
      char v32 = v29;
    }
    if ((v32 & 1) == 0) {
      goto LABEL_26;
    }
  }
  else if (v30)
  {
    goto LABEL_26;
  }
  if (objc_msgSend(v10, "be_hasSelectablePositionAtPoint:", x, y))
  {
    CGFloat v33 = [v10 be_textInputChild];
    v81[0] = _NSConcreteStackBlock;
    v81[1] = 3221225472;
    v81[2] = sub_1FA64;
    v81[3] = &unk_1DAB88;
    v81[4] = self;
    [v33 selectTextWithGranularity:1 atPoint:v81 completionHandler:x, y];
  }
LABEL_26:
  v78 = v10;
  [v9 removeMenuForIdentifier:UIMenuLookup];
  [v9 removeMenuForIdentifier:UIMenuServices];
  [v9 removeMenuForIdentifier:UIMenuShare];
  [v9 replaceChildrenOfMenuForIdentifier:UIMenuStandardEdit fromChildrenBlock:&stru_1DB020];
  uint64_t v34 = +[UIImage systemImageNamed:@"doc.on.doc"];
  v35 = AEBundle();
  v36 = [v35 localizedStringForKey:@"Copy" value:&stru_1DF0D8 table:0];
  v77 = (void *)v34;
  uint64_t v37 = +[UIKeyCommand commandWithTitle:v36 image:v34 action:"copy:" input:@"C" modifierFlags:0x80000 propertyList:0];

  id v38 = UIMenu;
  v76 = (void *)v37;
  uint64_t v92 = v37;
  v39 = +[NSArray arrayWithObjects:&v92 count:1];
  uint64_t v40 = +[UIMenu menuWithTitle:&stru_1DF0D8 image:0 identifier:@"BKContextMenuEditIdentifier" options:17 children:v39];

  v79 = v9;
  v75 = (void *)v40;
  [v9 insertSiblingMenu:v40 afterMenuForIdentifier:UIMenuStandardEdit];
  CGRect v41 = +[NSMutableArray array];
  CFStringRef v90 = @"lookUpTerm";
  CFStringRef v42 = v23;
  if (!v23)
  {
    uint64_t v43 = [v30 annotationSelectedText];
    id v38 = (void *)v43;
    if (v43) {
      CFStringRef v42 = (const __CFString *)v43;
    }
    else {
      CFStringRef v42 = &stru_1DF0D8;
    }
  }
  v80 = v30;
  CFStringRef v91 = v42;
  uint64_t v44 = +[NSDictionary dictionaryWithObjects:&v91 forKeys:&v90 count:1];
  if (!v23) {

  }
  CGRect v45 = +[UIImage systemImageNamed:@"magnifyingglass.circle"];
  CGRect v46 = AEBundle();
  v47 = [v46 localizedStringForKey:@"Look Up" value:&stru_1DF0D8 table:0];
  v74 = (void *)v44;
  uint64_t v48 = +[UICommand commandWithTitle:v47 image:v45 action:"lookupSelection:" propertyList:v44];

  v73 = (void *)v48;
  [v41 addObject:v48];
  v49 = AEBundle();
  v50 = [v49 localizedStringForKey:@"Translate" value:&stru_1DF0D8 table:0];

  v51 = +[UIImage _systemImageNamed:@"translate"];
  if (v23)
  {
    v52 = v23;
    CFStringRef v53 = v23;
  }
  else
  {
    uint64_t v54 = [v80 annotationSelectedText];
    CFStringRef v53 = 0;
    v55 = (void *)v54;
    if (v54) {
      v56 = (__CFString *)v54;
    }
    else {
      v56 = &stru_1DF0D8;
    }
    v52 = v56;
  }
  v71 = v24;
  CFStringRef v88 = @"translateTerm";
  v89 = v52;
  v57 = +[NSDictionary dictionaryWithObjects:&v89 forKeys:&v88 count:1];
  v58 = +[UICommand commandWithTitle:v50 image:v51 action:"translateSelection:" propertyList:v57];

  [v41 addObject:v58];
  CFStringRef v86 = @"searchTerm";
  CFStringRef v59 = v53;
  if (!v53)
  {
    uint64_t v60 = [v80 annotationSelectedText];
    v50 = (void *)v60;
    CFStringRef v59 = &stru_1DF0D8;
    if (v60) {
      CFStringRef v59 = (const __CFString *)v60;
    }
  }
  CFStringRef v87 = v59;
  v61 = +[NSDictionary dictionaryWithObjects:&v87 forKeys:&v86 count:1];
  v72 = (__CFString *)v53;
  if (!v53) {

  }
  v62 = +[UIImage systemImageNamed:@"doc.text.magnifyingglass"];
  v63 = AEBundle();
  v64 = [v63 localizedStringForKey:@"Search" value:&stru_1DF0D8 table:0];
  v65 = +[UICommand commandWithTitle:v64 image:v62 action:"searchUsingSelection:" propertyList:v61];

  [v41 addObject:v65];
  v66 = +[UIImage systemImageNamed:@"square.and.arrow.up"];
  v67 = AEBundle();
  v68 = [v67 localizedStringForKey:@"Share" value:&stru_1DF0D8 table:0];
  v69 = +[UICommand commandWithTitle:v68 image:v66 action:"_share:" propertyList:UICommandTagShare];

  [v41 addObject:v69];
  v70 = +[UIMenu menuWithTitle:&stru_1DF0D8 image:0 identifier:@"BKContextMenuAnnotationIdentifier" options:17 children:v41];
  [v79 insertSiblingMenu:v70 afterMenuForIdentifier:@"BKContextMenuEditIdentifier"];
  [v79 removeMenuForIdentifier:UIMenuStandardEdit];
}

- (id)_payloadForKey:(id)a3 fromSender:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  unsigned __int8 v7 = BUDynamicCast();

  if (v7 && [v5 length])
  {
    objc_opt_class();
    double v8 = [v7 propertyList];
    id v9 = BUDynamicCast();

    objc_opt_class();
    id v10 = [v9 objectForKeyedSubscript:v5];
    double v11 = BUDynamicCast();
  }
  else
  {
    double v11 = 0;
  }

  return v11;
}

- (void)searchWeb:(id)a3
{
  id v5 = [(BKHTMLContentViewController *)self _payloadForKey:@"searchTerm" fromSender:a3];
  if ([v5 length])
  {
    id v4 = [(BKContentViewController *)self delegate];
    [v4 contentViewController:self searchWebForString:v5];
  }
}

- (void)searchWikipedia:(id)a3
{
  id v5 = [(BKHTMLContentViewController *)self _payloadForKey:@"searchTerm" fromSender:a3];
  if ([v5 length])
  {
    id v4 = [(BKContentViewController *)self delegate];
    [v4 contentViewController:self searchEncyclopediaForString:v5];
  }
}

- (void)changeAnnotationStyle:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BUDynamicCast();
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  id v5 = [(BKHTMLContentViewController *)self selectedAnnotation];
  if (v5) {
    [(BKHTMLContentViewController *)self changeAnnotationStyle:v6 annotation:v5];
  }
}

- (void)changeAnnotationStyle:(id)a3 annotation:(id)a4
{
  id v15 = a4;
  id v6 = [a3 propertyList];
  unsigned __int8 v7 = [v6 objectForKeyedSubscript:@"style"];

  if (v7)
  {
    id v8 = [v7 integerValue];
    id v9 = [(BKHTMLContentViewController *)self themePage];
    id v10 = [v9 annotationPageTheme];

    switch((unint64_t)v8)
    {
      case 1uLL:
        uint64_t v11 = +[AEAnnotationTheme yellowTheme:v10];
        goto LABEL_9;
      case 2uLL:
        uint64_t v11 = +[AEAnnotationTheme greenTheme:v10];
        goto LABEL_9;
      case 3uLL:
        uint64_t v11 = +[AEAnnotationTheme blueTheme:v10];
        goto LABEL_9;
      case 4uLL:
        uint64_t v11 = +[AEAnnotationTheme pinkTheme:v10];
        goto LABEL_9;
      case 5uLL:
        uint64_t v11 = +[AEAnnotationTheme purpleTheme:v10];
        goto LABEL_9;
      case 6uLL:
        uint64_t v11 = +[AEAnnotationTheme underlineTheme:v10];
LABEL_9:
        double v12 = (void *)v11;
        break;
      default:
        double v12 = 0;
        break;
    }
    CGFloat v13 = [(BKContentViewController *)self delegate];
    double v14 = BUProtocolCast();

    if (v12 && v14)
    {
      [v14 editorController:0 setTheme:v12 forAnnotation:v15];
      [(BKHTMLContentViewController *)self clearSelection];
    }
  }
}

- (void)addNote:(id)a3
{
  id v4 = [(BKHTMLContentViewController *)self selectedAnnotation];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
    [(BKHTMLContentViewController *)self selectAnnotation:v4];
    id v4 = [(BKHTMLContentViewController *)self annotateSelection:v6];
    id v5 = v6;
  }

  _objc_release_x1(v4, v5);
}

- (void)removeNote:(id)a3
{
  BOOL v3 = [(BKHTMLContentViewController *)self selectedAnnotation];
  if (v3)
  {
    id v4 = v3;
    [v3 setAnnotationNote:&stru_1DF0D8];
    BOOL v3 = v4;
  }
}

- (void)removeNoteAndHighlight:(id)a3
{
  id v4 = [(BKHTMLContentViewController *)self selectedAnnotation];
  if (v4)
  {
    id v5 = v4;
    [v4 setAnnotationNote:&stru_1DF0D8];
    [v5 setAnnotationDeleted:1];
    [(BKHTMLContentViewController *)self removeHighlightForAnnotation:v5];
    id v4 = v5;
  }
}

- (id)_activityItemsConfiguration
{
  uint64_t v3 = [(BKHTMLContentViewController *)self selectedAnnotation];
  uint64_t v4 = [(BKHTMLContentViewController *)self selectedText];
  id v5 = (void *)v4;
  unint64_t v6 = 0;
  if (!v3 && v4)
  {
    unint64_t v6 = objc_alloc_init(BKHTMLContentViewControllerDummyAnnotation);
    [(id)v6 setAnnotationStyle:0];
    [(id)v6 setAnnotationRepresentativeText:v5];
    unsigned __int8 v7 = [(BKHTMLContentViewController *)self annotationDataProvider];
    if (v7 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      id v8 = [v7 chapterTitleForOrdinal:[self ordinal] pageOffset:[self pageOffset]];
      [(id)v6 setChapterTitle:v8];
    }
  }
  if (v3 | v6)
  {
    if (v3) {
      uint64_t v9 = v3;
    }
    else {
      uint64_t v9 = v6;
    }
    id v10 = +[AEAnnotationCatalystItemProvider itemProviderWithAnnotation:v9 propertyProvider:self];
    id v11 = [objc_alloc((Class)NSItemProvider) initWithObject:v10];
    id v12 = objc_alloc((Class)UIActivityItemsConfiguration);
    id v16 = v11;
    CGFloat v13 = +[NSArray arrayWithObjects:&v16 count:1];
    id v14 = [v12 initWithItemProviders:v13];
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (void)addNoteToCurrentSelection:(id)a3
{
}

- (void)addHighlightToCurrentSelection:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_202F4;
  v5[3] = &unk_1DB048;
  id v6 = a3;
  unsigned __int8 v7 = self;
  id v4 = v6;
  [(BKHTMLContentViewController *)self _bookmarkSelectionAndAnnotate:0 showColorEditor:0 completion:v5];
}

- (BKHTMLContentViewController)init
{
  v6.receiver = self;
  v6.super_class = (Class)BKHTMLContentViewController;
  v2 = [(BKContentViewController *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_alloc_init(BKWebViewProxy);
    webViewProxdouble y = v2->_webViewProxy;
    v2->_webViewProxdouble y = v3;

    [(BKWebViewProxy *)v2->_webViewProxy setHasWKWebView:1];
  }
  return v2;
}

- (void)releaseViews
{
  fadeView = self->_fadeView;
  self->_fadeView = 0;

  [(UITapGestureRecognizer *)self->_tapGesture setDelegate:0];
  [(UITapGestureRecognizer *)self->_tapGesture removeTarget:0 action:0];
  tapGesture = self->_tapGesture;
  self->_tapGesture = 0;

  [(UITapGestureRecognizer *)self->_doubleTapGesture setDelegate:0];
  [(UITapGestureRecognizer *)self->_doubleTapGesture removeTarget:0 action:0];
  doubleTapGesture = self->_doubleTapGesture;
  self->_doubleTapGesture = 0;

  [(UIGestureRecognizer *)self->_indirectHighlightRecognizer setDelegate:0];
  [(UIGestureRecognizer *)self->_indirectHighlightRecognizer removeTarget:0 action:0];
  indirectHighlightRecognizer = self->_indirectHighlightRecognizer;
  self->_indirectHighlightRecognizer = 0;

  [(UILongPressGestureRecognizer *)self->_indirectImmediateHighlightRecognizer setDelegate:0];
  [(UILongPressGestureRecognizer *)self->_indirectImmediateHighlightRecognizer removeTarget:0 action:0];
  indirectImmediateHighlightRecognizer = self->_indirectImmediateHighlightRecognizer;
  self->_indirectImmediateHighlightRecognizer = 0;

  highlightWordStart = self->_highlightWordStart;
  self->_highlightWordStart = 0;

  highlightWordEnd = self->_highlightWordEnd;
  self->_highlightWordEnd = 0;

  highlightLastPos = self->_highlightLastPos;
  self->_highlightLastPos = 0;

  CGPoint v11 = CGPointZero;
  self->_highlightStartPoint = CGPointZero;
  self->_highlightStartPoint2 = v11;
  highlightDummyAnnotation = self->_highlightDummyAnnotation;
  self->_highlightDummyAnnotation = 0;

  [(NSFetchedResultsController *)self->_highlightsFRC setDelegate:0];
  highlightsFRC = self->_highlightsFRC;
  self->_highlightsFRC = 0;

  highlightRenderingController = self->_highlightRenderingController;
  self->_highlightRenderingController = 0;

  self->super._contentLoaded = 0;
  [(BKContentViewController *)self setContentLoadPending:0];
  [(BKHTMLContentViewController *)self _updateReadingStateVisibilityPossible:0];
  [(BKActivityIndicatorOverlayView *)self->_activityIndicator hideIndicatorAnimated:0 animationDelay:0.0];
  activityIndicator = self->_activityIndicator;
  self->_activityIndicator = 0;

  v16.receiver = self;
  v16.super_class = (Class)BKHTMLContentViewController;
  [(BKContentViewController *)&v16 releaseViews];
}

- (void)dealloc
{
  [(BKHTMLContentViewController *)self teardownNotifications];
  [(BKHTMLContentViewController *)self releaseViews];
  [(BKHTMLContentViewController *)self clearCurrentHighlighting];
  annotationRectUnionCache = self->_annotationRectUnionCache;
  self->_annotationRectUnionCache = 0;

  annotationRectsCache = self->_annotationRectsCache;
  self->_annotationRectsCache = 0;

  [(BKHTMLContentViewController *)self setTempOwnerID:0];
  [(IMPerformSelectorProxy *)self->_performSelectorProxy teardown];
  v5.receiver = self;
  v5.super_class = (Class)BKHTMLContentViewController;
  [(BKContentViewController *)&v5 dealloc];
}

- (void)setupNotifications
{
  if (!self->_areNotificationsSetup)
  {
    self->_areNotificationsSetup = 1;
    id v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:self selector:"menuWillClose:" name:UIMenuControllerWillHideMenuNotification object:0];
    [v4 addObserver:self selector:"menuDidClose:" name:UIMenuControllerDidHideMenuNotification object:0];
    uint64_t v3 = +[NSUserDefaults standardUserDefaults];
    [v3 addObserver:self forKeyPath:BEDocumentExternalLoadApprovalCacheDefaultsClearKey options:0 context:off_227970];
  }
}

- (void)teardownNotifications
{
  if (self->_areNotificationsSetup)
  {
    self->_areNotificationsSetup = 0;
    id v4 = +[NSNotificationCenter defaultCenter];
    [v4 removeObserver:self name:UIMenuControllerWillHideMenuNotification object:0];
    [v4 removeObserver:self name:UIMenuControllerDidHideMenuNotification object:0];
    uint64_t v3 = +[NSUserDefaults standardUserDefaults];
    [v3 removeObserver:self forKeyPath:BEDocumentExternalLoadApprovalCacheDefaultsClearKey context:off_227970];
  }
}

- (IMPerformSelectorProxy)performSelectorProxy
{
  performSelectorProxdouble y = self->_performSelectorProxy;
  if (!performSelectorProxy)
  {
    id v4 = (IMPerformSelectorProxy *)[objc_alloc((Class)IMPerformSelectorProxy) initWithTarget:self];
    objc_super v5 = self->_performSelectorProxy;
    self->_performSelectorProxdouble y = v4;

    performSelectorProxdouble y = self->_performSelectorProxy;
  }

  return performSelectorProxy;
}

- (void)viewDidLoad
{
  v14.receiver = self;
  v14.super_class = (Class)BKHTMLContentViewController;
  [(BKContentViewController *)&v14 viewDidLoad];
  uint64_t v3 = [(BKHTMLContentViewController *)self view];
  id v4 = [(BKContentViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 preloadContentViewController:self highPriority:1];
  }
  objc_super v5 = (UITapGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"handleTap:"];
  tapGesture = self->_tapGesture;
  self->_tapGesture = v5;

  [(UITapGestureRecognizer *)self->_tapGesture setDelegate:self];
  [v3 addGestureRecognizer:self->_tapGesture];
  unsigned __int8 v7 = [(BKHTMLContentViewController *)self themePage];
  id v8 = [BKActivityIndicatorOverlayView alloc];
  uint64_t v9 = [v7 contentTextColor];
  id v10 = [v9 colorWithAlphaComponent:0.7];
  CGPoint v11 = [v7 backgroundColorForTraitEnvironment:self];
  id v12 = [(BKActivityIndicatorOverlayView *)v8 initWithBackgroundColor:v10 foregroundColor:v11];
  activityIndicator = self->_activityIndicator;
  self->_activityIndicator = v12;

  [(WKWebView *)self->_webView2 setBe_textInteractionAssistantDelegate:self];
  if ([(BKHTMLContentViewController *)self supportsNotesAndHighlights]) {
    [(WKWebView *)self->_webView2 setBe_textInteractionDelegate:self];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BKHTMLContentViewController;
  [(BKHTMLContentViewController *)&v4 viewWillAppear:a3];
  [(BKHTMLContentViewController *)self setupNotifications];
  [(BKHTMLContentViewController *)self _refreshAnnotationsAndSearchResult];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  -[BKHTMLContentViewController stopActivityIndicator:](self, "stopActivityIndicator:");
  v5.receiver = self;
  v5.super_class = (Class)BKHTMLContentViewController;
  [(BKContentViewController *)&v5 viewWillDisappear:v3];
  [(BKHTMLContentViewController *)self teardownNotifications];
  [(BKHTMLContentViewController *)self clearCurrentHighlighting];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BKHTMLContentViewController;
  [(BKContentViewController *)&v4 viewDidDisappear:a3];
  [(BKHTMLContentViewController *)self setHighlightViews:0];
  [(BKHTMLContentViewController *)self _updateReadingStateVisibilityPossible:0];
}

- (void)startActivityIndicatorAfterDelay:(double)a3
{
}

- (void)stopActivityIndicator:(BOOL)a3
{
}

- (void)setActivityIndicatorVisible:(BOOL)a3 animated:(BOOL)a4 afterDelay:(double)a5
{
  BOOL v6 = a4;
  if (a3)
  {
    id v8 = [(BKHTMLContentViewController *)self view];
    id v13 = [v8 window];

    uint64_t v9 = [(BKContentViewController *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v10 = [v9 contentViewController:self hostViewForActivityIndicator:self->_activityIndicator];

      id v11 = (id)v10;
    }
    else
    {
      id v11 = v13;
    }
    id v14 = v11;
    [(BKActivityIndicatorOverlayView *)self->_activityIndicator showIndicatorCenteredInView:v11 animated:v6 animationDelay:a5];
  }
  else
  {
    activityIndicator = self->_activityIndicator;
    -[BKActivityIndicatorOverlayView hideIndicatorAnimated:animationDelay:](activityIndicator, "hideIndicatorAnimated:animationDelay:", a4);
  }
}

- (void)setEstimatedContentSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v8.receiver = self;
  v8.super_class = (Class)BKHTMLContentViewController;
  -[BKContentViewController setEstimatedContentSize:](&v8, "setEstimatedContentSize:");
  *(CGFloat *)unsigned __int8 v7 = width;
  *(CGFloat *)&v7[1] = height;
  BOOL v6 = +[NSValue valueWithBytes:v7 objCType:"{CGSize=dd}"];
  [(WKWebView *)self->_webView2 setBe_estimatedContentSizeValue:v6];
}

- (void)setTheme:(id)a3
{
}

- (void)setTheme:(id)a3 force:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  unsigned __int8 v7 = [(BKHTMLContentViewController *)self theme];
  unsigned int v8 = [v6 isEqual:v7];

  if (!v8 || v4)
  {
    v13.receiver = self;
    v13.super_class = (Class)BKHTMLContentViewController;
    [(BKContentViewController *)&v13 setTheme:v6 force:v4];
    if (self->_highlightRenderingController)
    {
      uint64_t v9 = [(BKHTMLContentViewController *)self theme];
      -[AEHighlightRenderingController setAnnotationBlendMode:](self->_highlightRenderingController, "setAnnotationBlendMode:", [v9 annotationBlendMode]);

      uint64_t v10 = [(BKHTMLContentViewController *)self theme];
      -[AEHighlightRenderingController setPageTheme:](self->_highlightRenderingController, "setPageTheme:", [v10 annotationPageTheme]);

      id v11 = [(BKHTMLContentViewController *)self theme];
      if ([v11 shouldInvertContent])
      {
        id v12 = [(BKContentViewController *)self configuration];
        -[AEHighlightRenderingController setDrawSpecialGrayHighlights:](self->_highlightRenderingController, "setDrawSpecialGrayHighlights:", [v12 isScroll] ^ 1);
      }
      else
      {
        [(AEHighlightRenderingController *)self->_highlightRenderingController setDrawSpecialGrayHighlights:0];
      }
    }
  }
  [(BKHTMLContentViewController *)self invalidateContentBasedOverlay];
}

- (void)setNeedsRestyle
{
  v3.receiver = self;
  v3.super_class = (Class)BKHTMLContentViewController;
  [(BKContentViewController *)&v3 setNeedsRestyle];
  self->_underlinePercent = 0.0;
  [(BKHTMLContentViewController *)self invalidateContentBasedOverlayCache];
}

- (int64_t)effectivePageOffset
{
  if ([(BKContentViewController *)self pageProgressionDirection] == 1
    && [(BKHTMLContentViewController *)self _isDoubleWide]
    && [(BKContentViewController *)self pageOffset] >= 1)
  {
    return [(BKContentViewController *)self pageOffset] - 1;
  }

  return [(BKContentViewController *)self pageOffset];
}

- (void)playFirstVisibleAutoplayMediaObject
{
  id v5 = +[NSString stringWithFormat:@"__ibooks_cfi_utilities.playFirstAutoplayMedia();"];
  objc_super v3 = [(BKHTMLContentViewController *)self loader];
  BOOL v4 = [v3 webView];
  [v4 evaluateJavaScript:v5 completionHandler:0];
}

- (void)didChangeLocationClosing:(BOOL)a3
{
  if ([(BKContentViewController *)self isContentLoaded])
  {
    [(BKHTMLContentViewController *)self playFirstVisibleAutoplayMediaObject];
  }
  else
  {
    self->_shouldAutopladouble y = 1;
  }
}

- (void)reload
{
  id v2 = [(WKWebView *)self->_webView2 reload];
}

- (id)arrayOfVisibleRectsFromRects:(id)a3
{
  id v3 = a3;

  return v3;
}

- (id)arrayOfVisibleRectsFromRects:(id)a3 contentRect:(CGRect)a4
{
  id v4 = a3;

  return v4;
}

- (void)setHighlightViews:(id)a3
{
  id v4 = a3;
  if (![v4 count]) {
    [(BKHTMLContentViewController *)self clearHighlights];
  }
  v5.receiver = self;
  v5.super_class = (Class)BKHTMLContentViewController;
  [(BKContentViewController *)&v5 setHighlightViews:v4];
}

- (void)highlightSearchLocation:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)BKHTMLContentViewController;
  [(BKContentViewController *)&v5 highlightSearchLocation:v4];
  if ([(BKHTMLContentViewController *)self isLocationFromThisDocument:v4]
    && [(BKContentViewController *)self isContentLoaded])
  {
    [(BKHTMLContentViewController *)self _highlightLocation:v4 withHighlightType:[(BKContentViewController *)self selectionHighlightType] owner:v4];
  }
}

- (void)clearSearchLocation
{
  v3.receiver = self;
  v3.super_class = (Class)BKHTMLContentViewController;
  [(BKContentViewController *)&v3 clearSearchLocation];
  [(BKHTMLContentViewController *)self clearSelectionHighlights];
}

- (void)clearHighlightsForSearchResults
{
  [(BKContentViewController *)self setSearchLocation:0];

  [(BKHTMLContentViewController *)self setHighlightViews:0];
}

- (void)drawHighlights
{
  objc_super v3 = [(BKHTMLContentViewController *)self highlightRenderingController];
  id v4 = [v3 highlightLayers];

  objc_super v5 = [(BKHTMLContentViewController *)self __highlightContainerView];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * (void)v10);
        id v12 = [v5 layer];
        [v12 addSublayer:v11];

        uint64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

- (void)clearHighlights
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  objc_super v3 = [(NSFetchedResultsController *)self->_highlightsFRC fetchedObjects];
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8 * (void)v7);
        uint64_t v9 = [(BKHTMLContentViewController *)self highlightRenderingController];
        uint64_t v10 = [v8 annotationUuid];
        [v9 removeHighlightForData:v10];

        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (id)preservedSelectionHighlights
{
  objc_super v3 = [(BKContentViewController *)self highlightViews];
  id v4 = [v3 count];

  if (v4)
  {
    id v5 = +[NSMutableArray array];
    uint64_t v6 = [(BKContentViewController *)self highlightViews];
    id v7 = [v6 copy];

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v8 = v7;
    id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          -[NSMutableArray removeObject:](self->super._highlightViews, "removeObject:", v13, (void)v15);
          [v5 addObject:v13];
        }
        id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)highlightAnnotations:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BKHTMLContentViewController *)self annotationRectUnionCache];
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    id v7 = [(BKHTMLContentViewController *)self highlightRenderingController];
    unsigned __int8 v8 = [v7 isAddingHighlights];

    if ((v8 & 1) == 0)
    {
      id v9 = [(BKHTMLContentViewController *)self highlightRenderingController];
      [v9 setAddingHighlights:1];

      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      id v10 = v4;
      id v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v17;
        do
        {
          long long v14 = 0;
          do
          {
            if (*(void *)v17 != v13) {
              objc_enumerationMutation(v10);
            }
            -[BKHTMLContentViewController _highlightAnnotation:](self, "_highlightAnnotation:", *(void *)(*((void *)&v16 + 1) + 8 * (void)v14), (void)v16);
            long long v14 = (char *)v14 + 1;
          }
          while (v12 != v14);
          id v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }
        while (v12);
      }

      long long v15 = [(BKHTMLContentViewController *)self highlightRenderingController];
      [v15 setAddingHighlights:0];
    }
  }
}

- (double)underlinePercent
{
  double result = self->_underlinePercent;
  if (result == 0.0)
  {
    id v4 = [(BKContentViewController *)self configuration];
    uint64_t v5 = [v4 style];
    uint64_t v6 = [v5 fontFamily];

    CFDictionaryRef v7 = +[NSDictionary dictionaryWithObject:v6 forKey:kCTFontFamilyNameAttribute];
    unsigned __int8 v8 = CTFontDescriptorCreateWithAttributes(v7);
    if (!v8 || (id v9 = v8, v10 = CTFontCreateWithFontDescriptor(v8, 0.0, 0), CFRelease(v9), !v10)) {
      id v10 = CTFontCreateWithName(v6, 0.0, 0);
    }
    double Ascent = CTFontGetAscent(v10);
    double v12 = Ascent + CTFontGetDescent(v10);
    self->_underlinePercent = CTFontGetAscent(v10) / v12;
    if (v10) {
      CFRelease(v10);
    }

    return self->_underlinePercent;
  }
  return result;
}

- (BOOL)_isCachedAnnotationRectVisible:(id)a3 considerEntirePage:(BOOL)a4
{
  id v6 = a3;
  if (a4)
  {
    CFDictionaryRef v7 = [(BKHTMLContentViewController *)self loader];
    [v7 contentRectForVisiblePage];
  }
  else
  {
    CFDictionaryRef v7 = [(BKHTMLContentViewController *)self webViewProxy];
    [v7 contentRectForVisibleContent];
  }
  double v12 = v8;
  double v13 = v9;
  double v14 = v10;
  double v15 = v11;

  id v20 = v6;
  long long v16 = +[NSArray arrayWithObjects:&v20 count:1];

  long long v17 = -[BKHTMLContentViewController arrayOfVisibleRectsFromRects:contentRect:](self, "arrayOfVisibleRectsFromRects:contentRect:", v16, v12, v13, v14, v15);

  v21.origin.double x = BKUnionRects(v17);
  BOOL IsNull = CGRectIsNull(v21);

  return !IsNull;
}

- (void)_highlightAnnotation:(id)a3
{
  id v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) == 0 || ([v4 isAnnotationDeleted] & 1) == 0)
  {
    uint64_t v5 = [v4 location];
    objc_initWeak(&location, self);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_21C18;
    v13[3] = &unk_1DAC28;
    objc_copyWeak(&v15, &location);
    id v6 = v4;
    id v14 = v6;
    CFDictionaryRef v7 = objc_retainBlock(v13);
    double v8 = [(BKContentViewController *)self configuration];
    unsigned int v9 = [v8 isScroll];

    if (v9)
    {
      ((void (*)(void *, uint64_t))v7[2])(v7, 1);
    }
    else
    {
      double v10 = [v6 annotationLocation];
      if (v10
        && ([(BKHTMLContentViewController *)self annotationRectUnionCache],
            double v11 = objc_claimAutoreleasedReturnValue(),
            [v11 objectForKeyedSubscript:v10],
            double v12 = objc_claimAutoreleasedReturnValue(),
            v11,
            v12))
      {
        if (([(BKContentViewController *)self pageOffset] & 0x8000000000000000) == 0
          && [(BKContentViewController *)self pageOffset] != 0x7FFFFFFFFFFFFFFFLL
          && [(BKHTMLContentViewController *)self isLocationFromThisDocument:v5])
        {
          ((void (*)(void *, BOOL))v7[2])(v7, [(BKHTMLContentViewController *)self _isCachedAnnotationRectVisible:v12 considerEntirePage:0]);
        }
      }
      else
      {
        [(BKHTMLContentViewController *)self isLocationVisible:v5 annotation:v6 completion:v7];
        double v12 = 0;
      }
    }
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

- (void)_highlightAnnotation:(id)a3 rects:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(BKHTMLContentViewController *)self highlightRenderingController];
  unsigned int v9 = [v6 annotationUuid];
  uint64_t v10 = [v8 highlightWithData:v9];

  id v11 = (id)v10;
  if (!v10)
  {
    id v11 = objc_alloc_init((Class)AEHighlight);
    [v11 setAnnotation:v6];
    double v12 = +[NSArray array];
    [v11 setLines:v12];
  }
  double v13 = [v11 lines];
  [v13 enumerateObjectsUsingBlock:&stru_1DB088];

  id v14 = [(BKHTMLContentViewController *)self loader];
  unsigned int v15 = [v14 isVerticalDocument];

  if (v15)
  {
    if ([(BKContentViewController *)self pageProgressionDirection] == 1) {
      int v16 = 2;
    }
    else {
      int v16 = 1;
    }
  }
  else
  {
    int v16 = 0;
  }
  long long v17 = [(BKContentViewController *)self configuration];
  unsigned int v18 = [v17 isScroll];

  if (v18)
  {
    id v19 = v7;
  }
  else
  {
    id v19 = [(BKHTMLContentViewController *)self arrayOfVisibleRectsFromRects:v7];
  }
  id v20 = v19;
  CGRect v21 = [v11 lines];
  id v22 = [v21 mutableCopy];

  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_21F78;
  v32[3] = &unk_1DB0D0;
  id v23 = v11;
  id v33 = v23;
  uint64_t v34 = self;
  int v37 = v16;
  id v24 = v20;
  id v35 = v24;
  id v25 = v22;
  id v36 = v25;
  [v24 enumerateObjectsUsingBlock:v32];
  [v23 setLines:v25];
  id v26 = [(BKHTMLContentViewController *)self highlightRenderingController];
  uint64_t v27 = v26;
  if (v10)
  {
    [v26 updatedHighlight:v23];
  }
  else
  {
    double v28 = [v6 annotationUuid];
    [v27 addHighlight:v23 forData:v28];
  }
  [(BKHTMLContentViewController *)self drawHighlights];
  char v29 = [(BKContentViewController *)self delegate];
  char v30 = objc_opt_respondsToSelector();

  if (v30)
  {
    CGFloat v31 = [(BKContentViewController *)self delegate];
    [v31 contentViewControllerAnnotationCacheDidChange:self];
  }
}

- (void)_highlightAnnotationWK2:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v5 = [v4 location];
  id v6 = [v5 selectionRects];
  id v7 = [v4 annotationLocation];
  if (!v7)
  {
    if (!v6) {
      goto LABEL_8;
    }
    unsigned int v9 = 0;
LABEL_7:
    [(BKHTMLContentViewController *)self _highlightAnnotation:v4 rects:v6];
    goto LABEL_14;
  }
  double v8 = [(BKHTMLContentViewController *)self annotationRectsCache];
  unsigned int v9 = [v8 objectForKeyedSubscript:v7];

  if (v6) {
    goto LABEL_7;
  }
  if (v9)
  {
    [(BKHTMLContentViewController *)self _highlightAnnotation:v4 rects:v9];
    goto LABEL_14;
  }
LABEL_8:
  if (v5)
  {
    uint64_t v10 = [(BKHTMLContentViewController *)self webViewProxy];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_22410;
    v13[3] = &unk_1DB0F8;
    objc_copyWeak(&v17, &location);
    id v14 = v7;
    id v15 = v4;
    id v16 = v5;
    [v10 clientRectsForLocation:v16 completion:v13];

    objc_destroyWeak(&v17);
  }
  else
  {
    id v11 = _AEAnnotationLocationLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)double v12 = 0;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_ERROR, "_highlightAnnotationWK2 nil location.", v12, 2u);
    }
  }
  unsigned int v9 = 0;
LABEL_14:

  objc_destroyWeak(&location);
}

- (BOOL)currentlyHighlighting
{
  id v2 = [(BKHTMLContentViewControllerDummyAnnotation *)self->_highlightDummyAnnotation dummyLocation2];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)_showAnnotations:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(BKHTMLContentViewController *)self supportsNotesAndHighlights])
  {
    uint64_t v5 = [(BKHTMLContentViewController *)self annotationRectUnionCache];

    if (v5)
    {
      id v6 = [(BKHTMLContentViewController *)self view];
      [v6 layoutIfNeeded];

      if (v3)
      {
        id v10 = [(BKHTMLContentViewController *)self preservedSelectionHighlights];
      }
      else
      {
        id v10 = 0;
      }
      [(BKHTMLContentViewController *)self setHighlightViews:0];
      id v7 = [(NSFetchedResultsController *)self->_highlightsFRC fetchedObjects];
      double v8 = +[NSPredicate predicateWithFormat:@"annotationType == %d", 2];
      unsigned int v9 = [v7 filteredArrayUsingPredicate:v8];

      [(BKHTMLContentViewController *)self highlightAnnotations:v9];
      if ([v10 count]) {
        [(NSMutableArray *)self->super._highlightViews addObjectsFromArray:v10];
      }
      [(BKHTMLContentViewController *)self drawHighlights];
    }
  }
}

- (void)removeHighlightForAnnotation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 annotationUuid];
  id v6 = +[NSPredicate predicateWithFormat:@"owner == %@", v5, 0];

  id v7 = [(BKContentViewController *)self highlightViews];
  double v8 = [v7 filteredArrayUsingPredicate:v6];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      double v13 = 0;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        [(BKContentViewController *)self removeHighlightView:*(void *)(*((void *)&v16 + 1) + 8 * (void)v13)];
        double v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  id v14 = [(BKHTMLContentViewController *)self highlightRenderingController];
  id v15 = [v4 annotationUuid];
  [v14 removeHighlightForData:v15];
}

- (void)_annotationChanged:(id)a3 forceRender:(BOOL)a4
{
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 ordinal];
    if (v7 == (id)[(BKContentViewController *)self ordinal])
    {
      double v8 = _AEAnnotationLocationLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = [v6 annotationUuid];
        *(_DWORD *)buf = 138412290;
        double v28 = v9;
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "_annotationChanged for %@", buf, 0xCu);
      }
      if ([v6 annotationType] == 2)
      {
        id v10 = [v6 annotationUuid];
        id v11 = +[NSPredicate predicateWithFormat:@"owner == %@", v10, 0];

        uint64_t v12 = [(BKContentViewController *)self highlightViews];
        double v13 = [v12 filteredArrayUsingPredicate:v11];

        id v14 = _AEAnnotationLocationLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          id v15 = [v6 annotationUuid];
          *(_DWORD *)buf = 138412546;
          double v28 = v15;
          __int16 v29 = 2112;
          char v30 = v13;
          _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "_annotationChanged for %@ found views: %@", buf, 0x16u);
        }
        long long v24 = 0u;
        long long v25 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        id v16 = v13;
        id v17 = [v16 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v17)
        {
          id v18 = v17;
          uint64_t v19 = *(void *)v23;
          do
          {
            id v20 = 0;
            do
            {
              if (*(void *)v23 != v19) {
                objc_enumerationMutation(v16);
              }
              [(BKContentViewController *)self removeHighlightView:*(void *)(*((void *)&v22 + 1) + 8 * (void)v20)];
              id v20 = (char *)v20 + 1;
            }
            while (v18 != v20);
            id v18 = [v16 countByEnumeratingWithState:&v22 objects:v26 count:16];
          }
          while (v18);
        }

        CGRect v21 = +[NSArray arrayWithObject:v6];
        [(BKHTMLContentViewController *)self highlightAnnotations:v21];
      }
    }
  }
}

- (void)_refreshAnnotationsAndSearchResult
{
  if ([(BKContentViewController *)self isContentLoaded])
  {
    BOOL v3 = [(BKContentViewController *)self searchLocation];
    [(BKHTMLContentViewController *)self _showAnnotations:v3 == 0];

    id v4 = [(BKContentViewController *)self searchLocation];

    if (v4)
    {
      id v5 = [(BKContentViewController *)self searchLocation];
      [(BKHTMLContentViewController *)self highlightSearchLocation:v5];
    }
    id v6 = [(BKContentViewController *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v6 contentViewControllerAnnotationsDidChange:self];
    }
  }
}

- (void)_highlightLocation:(id)a3 withHighlightType:(int)a4 owner:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v8)
  {
    objc_initWeak(&location, self);
    id v10 = [(BKHTMLContentViewController *)self webViewProxy];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_22DB8;
    v11[3] = &unk_1DB148;
    objc_copyWeak(&v15, &location);
    id v12 = v8;
    double v13 = self;
    int v16 = a4;
    id v14 = v9;
    [v10 clientRectsForLocation:v12 completion:v11];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  else
  {
    [(BKHTMLContentViewController *)self clearSelection];
  }
}

- (id)_highlightRects:(id)a3 withHighlightType:(int)a4 owner:(id)a5 forWK2:(BOOL)a6 clearSelection:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v39 = a6;
  uint64_t v9 = *(void *)&a4;
  id v11 = a3;
  id v12 = a5;
  double v13 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v11 count]);
  [(WKWebView *)self->_webView2 be_scale];
  double v15 = v14;
  if (v7) {
    [(BKHTMLContentViewController *)self clearSelection];
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v16 = v11;
  id v17 = [v16 countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v41;
    float v20 = v15;
    float v38 = v20;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v41 != v19) {
          objc_enumerationMutation(v16);
        }
        [*(id *)(*((void *)&v40 + 1) + 8 * i) CGRectValue];
        double v23 = v22;
        double v25 = v24;
        -[BKHTMLContentViewController _originPointForPoint:](self, "_originPointForPoint:");
        double x = v46.origin.x;
        double v27 = v15 * v23;
        double v28 = v15 * v25;
        double v30 = v15 + v29;
        v46.origin.double y = v15 + v29;
        v46.size.CGFloat width = v27;
        v46.size.CGFloat height = v15 * v25;
        double v31 = v15 + v15;
        double v32 = v15 * 3.0;
        if (CGRectGetHeight(v46) <= v15 * 19.0)
        {
          id v33 = [v16 count];
          if ((unint64_t)v33 <= 1) {
            double v31 = v15 + v15;
          }
          else {
            double v31 = v15;
          }
          if ((unint64_t)v33 <= 1) {
            double v32 = v15 * 3.0;
          }
          else {
            double v32 = v15 + v15;
          }
        }
        uint64_t v34 = -[BKTextHighlightView initWithFrame:]([BKTextHighlightView alloc], "initWithFrame:", x - v15 * 3.0, v30 - v31, v15 * 3.0 + v15 * 3.0 + v27, v28 + v31 + v32);
        [(BKTextHighlightView *)v34 setHighlightType:v9];
        [(BKTextHighlightView *)v34 setOwner:v12];
        *(float *)&double v35 = v38;
        [(BKTextHighlightView *)v34 setCurrentScale:v35];
        id v36 = [(BKHTMLContentViewController *)self theme];
        -[BKTextHighlightView setLightenBlend:](v34, "setLightenBlend:", [v36 shouldInvertContent]);

        -[BKTextHighlightView setContentInsets:](v34, "setContentInsets:", v31, v15 * 3.0, v32, v15 * 3.0);
        [(BKContentViewController *)self addHighlightView:v34 forWK2:v39];
        [v13 addObject:v34];
      }
      id v18 = [v16 countByEnumeratingWithState:&v40 objects:v44 count:16];
    }
    while (v18);
  }

  return v13;
}

- (id)highlightRangeFromRects:(id)a3
{
  id v4 = a3;
  id v5 = [(BKHTMLContentViewController *)self loader];
  id v6 = +[BEJavascriptUtilities collapsedLineRectsFromArrayOfRectDictionaries:isVerticalDocument:](BEJavascriptUtilities, "collapsedLineRectsFromArrayOfRectDictionaries:isVerticalDocument:", v4, [v5 isVerticalDocument]);

  BOOL v7 = [(BKHTMLContentViewController *)self _highlightRects:v6 withHighlightType:[(BKContentViewController *)self selectionHighlightType] owner:0 forWK2:1 clearSelection:1];

  return v7;
}

- (void)clearSelectionHighlights
{
  v13.receiver = self;
  v13.super_class = (Class)BKHTMLContentViewController;
  [(BKContentViewController *)&v13 clearSelectionHighlights];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  BOOL v3 = [(BKContentViewController *)self highlightViews];
  id v4 = [v3 copy];

  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(BKContentViewController *)self removeHighlightView:*(void *)(*((void *)&v9 + 1) + 8 * (void)v8)];
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
    }
    while (v6);
  }
}

- (id)highlightViewContainerWK2
{
  return 0;
}

- (id)selectedAnnotation
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    BOOL v3 = [(NSFetchedResultsController *)self->_highlightsFRC fetchedObjects];
    id v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v14;
      while (2)
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v14 != v6) {
            objc_enumerationMutation(v3);
          }
          id v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          long long v9 = [v8 annotationUuid];
          unsigned int v10 = [v9 isEqualToString:self->_tempOwnerID];

          if (v10)
          {
            id v11 = v8;
            goto LABEL_13;
          }
        }
        id v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
    id v11 = 0;
LABEL_13:
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (void)_contentRectForLocation:(id)a3 visible:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  objc_opt_class();
  unsigned int v10 = BUDynamicCast();
  if (v10)
  {
    [(BKHTMLContentViewController *)self rectForLocation:v10 adjustedForContentOffset:0];
    v48[0] = v11;
    v48[1] = v12;
    v48[2] = v13;
    v48[3] = v14;
    long long v15 = +[NSValue valueWithBytes:v48 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
    v49 = v15;
    long long v16 = +[NSArray arrayWithObjects:&v49 count:1];
    [(BKHTMLContentViewController *)self _contentRectFromRects:v16 visible:v6];
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;

    id v25 = objc_retainBlock(v9);
    id v26 = v25;
    if (v25) {
      (*((void (**)(id, double, double, double, double))v25 + 2))(v25, v18, v20, v22, v24);
    }
  }
  else
  {
    objc_opt_class();
    double v27 = BUDynamicCast();
    id v26 = v27;
    if (v27
      && ([v27 jsonObject], double v28 = objc_claimAutoreleasedReturnValue(), v28, v28))
    {
      double v29 = [(BKHTMLContentViewController *)self loader];
      v46[0] = _NSConcreteStackBlock;
      v46[1] = 3221225472;
      v46[2] = sub_23CE8;
      v46[3] = &unk_1DB170;
      id v47 = v9;
      [v29 clientRectForEpubLocation:v26 completion:v46];

      double v30 = v47;
    }
    else
    {
      objc_opt_class();
      double v30 = BUDynamicCast();
      double v31 = [v30 cfiString];
      if (v30
        && ([(BKHTMLContentViewController *)self annotationRectUnionCache],
            double v32 = objc_claimAutoreleasedReturnValue(),
            [v32 objectForKeyedSubscript:v31],
            id v33 = objc_claimAutoreleasedReturnValue(),
            v32,
            v33))
      {
        if (v6)
        {
          uint64_t v34 = [(BKHTMLContentViewController *)self annotationRectsCache];
          double v35 = [v34 objectForKeyedSubscript:v31];

          id v36 = [(BKHTMLContentViewController *)self arrayOfVisibleRectsFromRects:v35];
          int v37 = (void (**)(void, double))objc_retainBlock(v9);
          if (v37)
          {
            double v38 = BKUnionRects(v36);
            v37[2](v37, v38);
          }
        }
        else
        {
          double v35 = (void (**)(void))objc_retainBlock(v9);
          if (v35)
          {
            [v33 CGRectValue];
            v35[2](v35);
          }
        }
      }
      else
      {
        BOOL v39 = [(BKHTMLContentViewController *)self webViewProxy];
        v40[0] = _NSConcreteStackBlock;
        v40[1] = 3221225472;
        v40[2] = sub_23D80;
        v40[3] = &unk_1DB198;
        id v41 = v30;
        long long v42 = self;
        id v43 = v31;
        BOOL v45 = v6;
        id v44 = v9;
        [v39 clientRectsForLocation:v8 completion:v40];
      }
    }
  }
}

- (CGRect)_contentRectFromRects:(id)a3 visible:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  CGFloat x = CGRectZero.origin.x;
  CGFloat y = CGRectZero.origin.y;
  CGFloat width = CGRectZero.size.width;
  CGFloat height = CGRectZero.size.height;
  id v11 = [v6 count];
  if (v4)
  {
    if (v11)
    {
      uint64_t v12 = [(BKHTMLContentViewController *)self arrayOfVisibleRectsFromRects:v6];
      CGFloat x = BKUnionRects(v12);
      CGFloat y = v13;
      CGFloat width = v14;
      CGFloat height = v15;
    }
  }
  else if (v11)
  {
    CGFloat x = BKUnionRects(v6);
    CGFloat y = v16;
    CGFloat width = v17;
    CGFloat height = v18;
  }

  double v19 = x;
  double v20 = y;
  double v21 = width;
  double v22 = height;
  result.size.CGFloat height = v22;
  result.size.CGFloat width = v21;
  result.origin.CGFloat y = v20;
  result.origin.CGFloat x = v19;
  return result;
}

- (void)contentRectForLocation:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    [(BKHTMLContentViewController *)self _contentRectForLocation:v6 visible:0 completion:v7];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(BKHTMLContentViewController *)self rectForLocation:v6];
      unint64_t v9 = v8;
      unint64_t v11 = v10;
      unint64_t v13 = v12;
      unint64_t v15 = v14;
      id v16 = objc_retainBlock(v7);
      double v21 = v16;
      if (v16)
      {
        v17.n128_u64[0] = v9;
        v18.n128_u64[0] = v11;
        v19.n128_u64[0] = v13;
        v20.n128_u64[0] = v15;
        (*((void (**)(__n128, __n128, __n128, __n128))v16 + 2))(v17, v18, v19, v20);
      }
    }
    else
    {
      double v22 = _AECaptureLocationLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        double v23 = (objc_class *)objc_opt_class();
        double v24 = NSStringFromClass(v23);
        int v30 = 138412290;
        double v31 = v24;
      }
      id v25 = objc_retainBlock(v7);
      double v21 = v25;
      if (v25)
      {
        v26.n128_u64[0] = *(void *)&CGRectZero.origin.x;
        v27.n128_u64[0] = *(void *)&CGRectZero.origin.y;
        v28.n128_u64[0] = *(void *)&CGRectZero.size.width;
        v29.n128_u64[0] = *(void *)&CGRectZero.size.height;
        (*((void (**)(__n128, __n128, __n128, __n128))v25 + 2))(v26, v27, v28, v29);
      }
    }
  }
}

- (void)contentRectForAnnotation:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [a3 location];
  [(BKHTMLContentViewController *)self _contentRectForLocation:v7 visible:0 completion:v6];
}

- (CGRect)rectForLocation:(id)a3
{
  [(BKHTMLContentViewController *)self rectForLocation:a3 adjustedForContentOffset:1];
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

- (CGRect)rectForLocation:(id)a3 adjustedForContentOffset:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  double x = CGRectNull.origin.x;
  double y = CGRectNull.origin.y;
  CGFloat width = CGRectNull.size.width;
  CGFloat height = CGRectNull.size.height;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v11 = [v6 anchor];
    unint64_t v12 = [(BKHTMLContentViewController *)self loader];
    unint64_t v13 = [v12 anchorFrameForAnchor:v11];

    if (v13)
    {
      [v13 rectValue];
      double x = v14;
      double y = v15;
      CGFloat width = v16;
      CGFloat height = v17;
    }

LABEL_7:
    if (v4)
    {
LABEL_8:
      -[BKHTMLContentViewController _originPointForPoint:](self, "_originPointForPoint:", x, y);
      double x = v26;
      double y = v27;
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!v4) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  id v18 = v6;
  __n128 v19 = [(BKHTMLContentViewController *)self loader];
  id v20 = [v18 pageOffset];

  [v19 rectForPageOffset:v20];
  double x = v21;
  double y = v22;
  CGFloat width = v23;
  CGFloat height = v24;

  id v25 = [(BKContentViewController *)self configuration];
  LODWORD(v19) = [v25 isScroll];

  if (!v19) {
    goto LABEL_7;
  }
LABEL_9:

  double v28 = x;
  double v29 = y;
  double v30 = width;
  double v31 = height;
  result.size.CGFloat height = v31;
  result.size.CGFloat width = v30;
  result.origin.double y = v29;
  result.origin.double x = v28;
  return result;
}

- (void)rectForLocation:(id)a3 completion:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_24440;
  v6[3] = &unk_1DB1C0;
  id v7 = self;
  id v8 = a4;
  id v5 = v8;
  [(BKHTMLContentViewController *)v7 _contentRectForLocation:a3 visible:0 completion:v6];
}

- (void)visibleRectForLocation:(id)a3 completion:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_245B8;
  v6[3] = &unk_1DB1C0;
  id v7 = self;
  id v8 = a4;
  id v5 = v8;
  [(BKHTMLContentViewController *)v7 _contentRectForLocation:a3 visible:1 completion:v6];
}

- (BOOL)isRectVisible:(id)a3
{
  id v8 = a3;
  id v4 = a3;
  id v5 = +[NSArray arrayWithObjects:&v8 count:1];

  id v6 = -[BKHTMLContentViewController arrayOfVisibleRectsFromRects:](self, "arrayOfVisibleRectsFromRects:", v5, v8);

  v9.origin.double x = BKUnionRects(v6);
  LOBYTE(self) = CGRectIsNull(v9);

  return self ^ 1;
}

- (id)_annotationUuidIntersectingPoint:(CGPoint)a3 inView:(id)a4 annotationLayerRect:(CGRect *)a5
{
  double y = a3.y;
  double x = a3.x;
  CGRect v9 = [a4 layer];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  unint64_t v10 = [(BKHTMLContentViewController *)self highlightRenderingController];
  unint64_t v11 = [v10 highlightLayers];

  id v12 = [v11 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v39;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v39 != v13) {
          objc_enumerationMutation(v11);
        }
        double v15 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        [v15 convertPoint:v9 fromLayer:x, y];
        double v17 = v16;
        double v19 = v18;
        id v20 = [(BKHTMLContentViewController *)self highlightRenderingController];
        unsigned int v21 = [v20 layer:v15 containsHighlightAtPoint:v17 v19];

        if (v21)
        {
          double v22 = [(BKHTMLContentViewController *)self highlightRenderingController];
          id v12 = [v22 annotationUuidForHighlightLayer:v15];

          if (a5)
          {
            [v15 bounds];
            double v24 = v23;
            double v26 = v25;
            double v28 = v27;
            double v30 = v29;
            double v31 = [(BKHTMLContentViewController *)self view];
            double v32 = [v31 layer];
            [v15 convertRect:v32 toLayer:v24];
            a5->origin.double x = v33;
            a5->origin.double y = v34;
            a5->size.CGFloat width = v35;
            a5->size.CGFloat height = v36;
          }
          goto LABEL_12;
        }
      }
      id v12 = [v11 countByEnumeratingWithState:&v38 objects:v42 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v12;
}

- (void)handleTap:(id)a3
{
  id v17 = a3;
  id v4 = [v17 retrieveAndClearSelectionRectValue];
  id v5 = v4;
  if (v4)
  {
    [v4 CGRectValue];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    [(BKHTMLContentViewController *)self becomeFirstResponder];
    double v14 = [(BKHTMLContentViewController *)self selectedAnnotation];
    unsigned int v15 = +[BKBookViewController useEnhancedEditMenu];
    if (v14)
    {
      if (v15)
      {
        double v16 = [(BKHTMLContentViewController *)self view];
        [v17 locationInView:v16];
        -[BKHTMLContentViewController showContextMenuAtLocation:](self, "showContextMenuAtLocation:");
      }
      else
      {
        [(BKHTMLContentViewController *)self showHighlightingMenuForAnnotation:v14];
      }
    }
    else if ((v15 & 1) == 0)
    {
      -[BKHTMLContentViewController _showMenuForRect:](self, "_showMenuForRect:", v7, v9, v11, v13);
    }
  }
}

- (id)_preflightTapLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (+[BKBookViewController useEnhancedEditMenu]
    || (+[UIMenuController sharedMenuController],
        double v6 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v7 = [v6 isMenuVisible],
        v6,
        (v7 & 1) != 0))
  {
    double v8 = 0;
    goto LABEL_13;
  }
  double v9 = [(BKHTMLContentViewController *)self view];
  double v10 = [v9 hitTest:0 withEvent:x, y];

  objc_opt_class();
  double v11 = BUDynamicCast();
  if (v11)
  {
    objc_opt_class();
    double v12 = [v11 owner];
    double v13 = BUDynamicCast();

    if (v13)
    {
      [v11 bounds];
      double v15 = v14;
      double v17 = v16;
      double v19 = v18;
      double v21 = v20;
      double v22 = [(BKHTMLContentViewController *)self view];
      [v11 convertRect:v22 toView:v15, v17, v19, v21];
      double v24 = v23;
      double v26 = v25;
      double v28 = v27;
      double v30 = v29;

      [(BKHTMLContentViewController *)self setTempOwnerID:v13];
      double v31 = v24;
      double v32 = v26;
      double width = v28;
      double height = v30;
LABEL_11:
      double v8 = +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", v31, v32, width, height);
      goto LABEL_12;
    }
  }
  else
  {
    CGSize size = CGRectNull.size;
    v38.origin = CGRectNull.origin;
    v38.CGSize size = size;
    CGFloat v36 = [(BKHTMLContentViewController *)self view];
    double v13 = -[BKHTMLContentViewController _annotationUuidIntersectingPoint:inView:annotationLayerRect:](self, "_annotationUuidIntersectingPoint:inView:annotationLayerRect:", v36, &v38, x, y);

    if (v13)
    {
      [(BKHTMLContentViewController *)self setTempOwnerID:v13];
      v40.origin.double x = CGRectNull.origin.x;
      v40.origin.double y = CGRectNull.origin.y;
      v40.size.double width = CGRectNull.size.width;
      v40.size.double height = CGRectNull.size.height;
      if (!CGRectEqualToRect(v38, v40))
      {
        double v32 = v38.origin.y;
        double v31 = v38.origin.x;
        double height = v38.size.height;
        double width = v38.size.width;
        goto LABEL_11;
      }
    }
  }
  double v8 = 0;
LABEL_12:

LABEL_13:

  return v8;
}

- (BOOL)preflightTap:(id)a3
{
  id v4 = a3;
  id v5 = [(BKHTMLContentViewController *)self view];
  [v4 locationInView:v5];
  double v6 = -[BKHTMLContentViewController _preflightTapLocation:](self, "_preflightTapLocation:");

  if (v6) {
    [v4 captureSelectionRectValueForTap:v6];
  }

  return v6 != 0;
}

- (BOOL)_shouldDoubleTapReceiveTouch:(id)a3
{
  return 0;
}

- (void)removeDummyHighlight
{
  if (self->_highlightDummyAnnotation)
  {
    double v3 = _AEAnnotationLocationLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      highlightDummyAnnotation = self->_highlightDummyAnnotation;
      int v11 = 138412290;
      double v12 = highlightDummyAnnotation;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "Removing _highlightDummyAnnotation:%@", (uint8_t *)&v11, 0xCu);
    }

    [(BKHTMLContentViewControllerDummyAnnotation *)self->_highlightDummyAnnotation setRemoved:1];
    [(BKHTMLContentViewController *)self removeHighlightForAnnotation:self->_highlightDummyAnnotation];
    highlightWordStart = self->_highlightWordStart;
    self->_highlightWordStart = 0;

    highlightWordEnd = self->_highlightWordEnd;
    self->_highlightWordEnd = 0;

    highlightLastPos = self->_highlightLastPos;
    self->_highlightLastPos = 0;

    self->_highlightStartPoint2 = CGPointZero;
    double v8 = self->_highlightDummyAnnotation;
    self->_highlightDummyAnnotation = 0;

    double v9 = [(BKHTMLContentViewController *)self annotationRectUnionCache];
    [v9 setObject:0 forKeyedSubscript:@"BKHTMLContentViewControllerDummyAnnotationUUID"];

    self->_highlightCancelled = 0;
    [(NSTimer *)self->_highlightTimer invalidate];
    highlightTimer = self->_highlightTimer;
    self->_highlightTimer = 0;
  }
}

- (void)_scheduleInteractionReset
{
  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"_resetInteractionTracking" object:0];

  [(BKHTMLContentViewController *)self performSelector:"_resetInteractionTracking" withObject:0 afterDelay:0.25];
}

- (void)_resetInteractionTracking
{
  self->_haveDeterminedInitialModifiers = 0;
  self->_initialTextInteractionModifiers = 0;
}

- (BOOL)_shouldBeginCustomHighlighterActionForTouchType:(int64_t)a3 modifierFlags:(int64_t)initialTextInteractionModifiers
{
  if (a3 == 3)
  {
    if (self->_haveDeterminedInitialModifiers)
    {
      initialTextInteractionModifiers = self->_initialTextInteractionModifiers;
    }
    else
    {
      self->_haveDeterminedInitialModifiers = 1;
      self->_initialTextInteractionModifiers = initialTextInteractionModifiers;
    }
    unint64_t v4 = ((unint64_t)initialTextInteractionModifiers >> 20) & 1;
  }
  else
  {
    LOBYTE(v4) = 1;
  }
  [(BKHTMLContentViewController *)self _scheduleInteractionReset];
  return v4;
}

- (CGPoint)_webkit2LocationForContentViewPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = [(WKWebView *)self->_webView2 be_textInputChild];
  [v6 convertPoint:self->_webView2 toView:x, y];
  double v8 = v7;
  double v10 = v9;

  [(WKWebView *)self->_webView2 bounds];
  CGFloat v11 = v28.origin.x;
  CGFloat v12 = v28.origin.y;
  CGFloat width = v28.size.width;
  CGFloat height = v28.size.height;
  double MinX = CGRectGetMinX(v28);
  if (v8 < MinX) {
    double v8 = MinX;
  }
  v29.origin.double x = v11;
  v29.origin.double y = v12;
  v29.size.CGFloat width = width;
  v29.size.CGFloat height = height;
  double MaxX = CGRectGetMaxX(v29);
  if (v8 >= MaxX) {
    double v8 = MaxX;
  }
  v30.origin.double x = v11;
  v30.origin.double y = v12;
  v30.size.CGFloat width = width;
  v30.size.CGFloat height = height;
  double MinY = CGRectGetMinY(v30);
  if (v10 < MinY) {
    double v10 = MinY;
  }
  v31.origin.double x = v11;
  v31.origin.double y = v12;
  v31.size.CGFloat width = width;
  v31.size.CGFloat height = height;
  double MaxY = CGRectGetMaxY(v31);
  if (v10 >= MaxY) {
    double v10 = MaxY;
  }
  webView2 = self->_webView2;
  double v20 = [(WKWebView *)webView2 be_textInputChild];
  -[WKWebView convertPoint:toView:](webView2, "convertPoint:toView:", v20, v8, v10);
  double v22 = v21;
  double v24 = v23;

  double v25 = v22;
  double v26 = v24;
  result.double y = v26;
  result.double x = v25;
  return result;
}

- (void)_highlightTimerFired:(id)a3
{
  [(NSTimer *)self->_highlightTimer invalidate];
  highlightTimer = self->_highlightTimer;
  self->_highlightTimer = 0;

  if (!self->_highlightCancelled)
  {
    self->_highlightCancelled = 1;
    webView2 = self->_webView2;
    [(WKWebView *)webView2 be_selectForWebView:0];
  }
}

- (double)_timeIntervalForHighlightGesture
{
  id v2 = [(BKContentViewController *)self configuration];
  unsigned int v3 = [v2 isScroll];

  double result = 0.25;
  if (v3) {
    return 0.5;
  }
  return result;
}

- (void)__webView2_performHighlighterActionWithGestureState:(int64_t)a3 location:(CGPoint)a4 isTouch:(BOOL)a5
{
  if ((unint64_t)(a3 - 4) < 2)
  {
    [(BKHTMLContentViewController *)self removeDummyHighlight];
    +[UIViewController attemptRotationToDeviceOrientation];
    [(BKHTMLContentViewController *)self _resetInteractionTracking];
    return;
  }
  if (a3 == 3)
  {
    highlightDummyAnnotation = self->_highlightDummyAnnotation;
    if (highlightDummyAnnotation)
    {
      -[BKHTMLContentViewControllerDummyAnnotation setRemoved:](highlightDummyAnnotation, "setRemoved:", 1, a5, a4.x, a4.y);
      v53[0] = _NSConcreteStackBlock;
      v53[1] = 3221225472;
      v53[2] = sub_257FC;
      v53[3] = &unk_1DB1E8;
      v53[4] = self;
      [(BKHTMLContentViewController *)self _bookmarkSelectionAndAnnotate:0 showColorEditor:0 completion:v53];
    }
    +[UIViewController attemptRotationToDeviceOrientation];
    [(BKHTMLContentViewController *)self _resetInteractionTracking];
    return;
  }
  BOOL v8 = a5;
  double y = a4.y;
  double x = a4.x;
  -[BKHTMLContentViewController _webkit2LocationForContentViewPoint:](self, "_webkit2LocationForContentViewPoint:");
  double v13 = v11;
  double v14 = v12;
  double v15 = &selRef_imageAnalysisInteraction_updateStringForCopy_;
  if (a3 == 1)
  {
    self->_highlightCancelled = 0;
    self->_highlightStartPoint2.double x = v11;
    self->_highlightStartPoint2.double y = v12;
    if (v8)
    {
      [(NSTimer *)self->_highlightTimer invalidate];
      [(BKHTMLContentViewController *)self _timeIntervalForHighlightGesture];
      +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "_highlightTimerFired:", 0, 0);
      double v16 = (NSTimer *)objc_claimAutoreleasedReturnValue();
      highlightTimer = self->_highlightTimer;
      self->_highlightTimer = v16;
    }
    double v18 = [(WKWebView *)self->_webView2 be_textInputChild];
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472;
    v52[2] = sub_25804;
    v52[3] = &unk_1DAB88;
    v52[4] = self;
    [v18 selectTextWithGranularity:1 atPoint:v52 completionHandler:v13, v14];

    double v19 = self->_highlightDummyAnnotation;
    self->_highlightDummyAnnotation = 0;
  }
  if (v8
    && (v14 - self->_highlightStartPoint2.y) * (v14 - self->_highlightStartPoint2.y)
     + (v13 - self->_highlightStartPoint2.x) * (v13 - self->_highlightStartPoint2.x) < 113.2096)
  {
    if (self->_highlightDummyAnnotation)
    {
      self->_highlightCancelled = 1;
      [(BKHTMLContentViewController *)self removeDummyHighlight];
    }
    return;
  }
  [(NSTimer *)self->_highlightTimer invalidate];
  double v20 = self->_highlightTimer;
  self->_highlightTimer = 0;

  if (!self->_highlightCancelled && !self->_highlightDummyAnnotation)
  {
    double v21 = objc_alloc_init(BKHTMLContentViewControllerDummyAnnotation);
    double v22 = self->_highlightDummyAnnotation;
    self->_highlightDummyAnnotation = v21;

    double v23 = [(WKWebView *)self->_webView2 be_textInputChild];
    double v24 = [(BKHTMLContentViewController *)self view];
    [v23 convertPoint:v24 toView:x, y];
    double v26 = v25;
    double v28 = v27;

    CGRect v29 = [(BKHTMLContentViewController *)self view];
    CGRect v30 = [v29 hitTest:0 withEvent:v26];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (objc_opt_respondsToSelector())
      {
        CGRect v31 = [v30 owner];
      }
      else
      {
        CGRect v31 = 0;
      }
    }
    else
    {
      double v32 = [(BKHTMLContentViewController *)self view];
      CGRect v31 = -[BKHTMLContentViewController _annotationUuidIntersectingPoint:inView:annotationLayerRect:](self, "_annotationUuidIntersectingPoint:inView:annotationLayerRect:", v32, 0, v26, v28);
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      CGRect v46 = v30;
      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      CGFloat v33 = [(NSFetchedResultsController *)self->_highlightsFRC fetchedObjects];
      id v34 = [v33 countByEnumeratingWithState:&v48 objects:v54 count:16];
      if (v34)
      {
        id v35 = v34;
        uint64_t v36 = *(void *)v49;
LABEL_27:
        uint64_t v37 = 0;
        while (1)
        {
          if (*(void *)v49 != v36) {
            objc_enumerationMutation(v33);
          }
          CGRect v38 = *(void **)(*((void *)&v48 + 1) + 8 * v37);
          long long v39 = [v38 annotationUuid];
          unsigned __int8 v40 = [v39 isEqualToString:v31];

          if (v40) {
            break;
          }
          if (v35 == (id)++v37)
          {
            id v35 = [v33 countByEnumeratingWithState:&v48 objects:v54 count:16];
            if (v35) {
              goto LABEL_27;
            }
            goto LABEL_33;
          }
        }
        id v41 = v38;

        double v15 = &selRef_imageAnalysisInteraction_updateStringForCopy_;
        CGRect v30 = v46;
        if (!v41) {
          goto LABEL_36;
        }
        -[BKHTMLContentViewControllerDummyAnnotation setAnnotationStyle:](self->_highlightDummyAnnotation, "setAnnotationStyle:", [v41 annotationStyle]);
        id v42 = [v41 annotationIsUnderline];
        goto LABEL_37;
      }
LABEL_33:

      double v15 = &selRef_imageAnalysisInteraction_updateStringForCopy_;
      CGRect v30 = v46;
    }
LABEL_36:
    id v43 = +[NSUserDefaults standardUserDefaults];
    -[BKHTMLContentViewControllerDummyAnnotation setAnnotationStyle:](self->_highlightDummyAnnotation, "setAnnotationStyle:", [v43 integerForKey:BKDefaultHighlightColor[0]]);

    id v41 = +[NSUserDefaults standardUserDefaults];
    id v42 = [v41 BOOLForKey:BKDefaultUnderlineState];
LABEL_37:
    [(BKHTMLContentViewControllerDummyAnnotation *)self->_highlightDummyAnnotation setAnnotationIsUnderline:v42];
  }
  uint64_t v44 = *((int *)v15 + 914);
  if (self->_highlightDummyAnnotation
    || objc_msgSend(*(id *)&self->super.super.IMViewController_opaque[v44], "be_hasSelectablePositionAtPoint:", v13, v14))
  {
    BOOL v45 = [*(id *)&self->super.super.IMViewController_opaque[v44] be_textInputChild];
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    v47[2] = sub_25830;
    v47[3] = &unk_1DABD8;
    v47[4] = self;
    [v45 updateSelectionWithExtentPoint:1 withBoundary:v47 completionHandler:v13, v14];
  }
}

- (void)_performHighlighterActionWithGestureState:(int64_t)a3 location:(CGPoint)a4
{
}

- (void)_handleStylusGesture:(id)a3
{
  id v4 = a3;
  id v5 = [v4 state];
  id v10 = [(WKWebView *)self->_webView2 be_textInputChild];
  [v4 locationInView:v10];
  double v7 = v6;
  double v9 = v8;

  -[BKHTMLContentViewController __webView2_performHighlighterActionWithGestureState:location:isTouch:](self, "__webView2_performHighlighterActionWithGestureState:location:isTouch:", v5, 0, v7, v9);
}

- (void)_willMoveTextRangeExtentAtPoint:(CGPoint)a3
{
  id v4 = [(BKContentViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 contentViewControllerIgnoreNextSwipe:self];
  }
}

- (BOOL)_hasDraggableSelectionAtPosition:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [(WKWebView *)self->_webView2 be_webSelectionRects];
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * i) rect];
        v15.CGFloat x = x;
        v15.CGFloat y = y;
        if (CGRectContainsPoint(v16, v15))
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v6;
}

- (BOOL)shouldHighlightReceiveTouch:(id)a3
{
  id v4 = a3;
  if ([(UIGestureRecognizer *)self->_indirectHighlightRecognizer state] == UIGestureRecognizerStatePossible
    && ![(UILongPressGestureRecognizer *)self->_indirectImmediateHighlightRecognizer state])
  {
    uint64_t v7 = [(BKHTMLContentViewController *)self webView];
    [v4 locationInView:v7];
    double v9 = v8;
    double v11 = v10;
    long long v12 = [(BKContentViewController *)self configuration];
    unint64_t v13 = (unint64_t)[v12 layout];

    if ((v13 & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      [v7 bounds];
      CGFloat v18 = v14;
      CGFloat v19 = v15;
      CGFloat v20 = v16;
      CGFloat v21 = v17;
      if (v13 == 3)
      {
        if (v11 >= CGRectGetMinY(*(CGRect *)&v14) + -20.0)
        {
          v30.origin.CGFloat x = v18;
          v30.origin.CGFloat y = v19;
          v30.size.CGFloat width = v20;
          v30.size.CGFloat height = v21;
          if (v11 <= CGRectGetMaxY(v30) + 20.0) {
            goto LABEL_14;
          }
        }
      }
      else
      {
        if (v13 != 2) {
          goto LABEL_14;
        }
        if (v9 >= CGRectGetMinX(*(CGRect *)&v14) + -20.0)
        {
          v29.origin.CGFloat x = v18;
          v29.origin.CGFloat y = v19;
          v29.size.CGFloat width = v20;
          v29.size.CGFloat height = v21;
          if (v9 <= CGRectGetMaxX(v29) + 20.0) {
            goto LABEL_14;
          }
        }
      }
      unsigned __int8 v5 = 0;
LABEL_15:

      goto LABEL_4;
    }
LABEL_14:
    double v22 = [(BKHTMLContentViewController *)self webView2];
    double v23 = [v22 be_textInputChild];

    double v24 = [(BKHTMLContentViewController *)self webView2];
    [v24 convertPoint:v23 toView:v9];
    double v26 = v25;
    double v28 = v27;

    unsigned __int8 v5 = [v23 hasSelectablePositionAtPoint:v26, v28];
    goto LABEL_15;
  }
  unsigned __int8 v5 = 0;
LABEL_4:

  return v5;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = (UILongPressGestureRecognizer *)a3;
  id v7 = a4;
  if (self->_indirectImmediateHighlightRecognizer != v6) {
    goto LABEL_3;
  }
  double v11 = [(BKHTMLContentViewController *)self view];
  [v7 locationInView:v11];
  double v13 = v12;
  double v15 = v14;

  double v16 = [(BKHTMLContentViewController *)self view];
  double v17 = -[BKHTMLContentViewController _annotationUuidIntersectingPoint:inView:annotationLayerRect:](self, "_annotationUuidIntersectingPoint:inView:annotationLayerRect:", v16, 0, v13, v15);

  if (v17)
  {
    unsigned __int8 v10 = 0;
  }
  else
  {
LABEL_3:
    if ((UILongPressGestureRecognizer *)self->_indirectHighlightRecognizer == v6
      || self->_indirectImmediateHighlightRecognizer == v6)
    {
      unsigned __int8 v10 = [(BKHTMLContentViewController *)self shouldHighlightReceiveTouch:v7];
    }
    else if ((UILongPressGestureRecognizer *)self->_doubleTapGesture == v6 {
           && [(BKHTMLContentViewController *)self _shouldDoubleTapReceiveTouch:v7]
    }
           || ([v7 view],
               double v8 = objc_claimAutoreleasedReturnValue(),
               objc_opt_class(),
               char isKindOfClass = objc_opt_isKindOfClass(),
               v8,
               (isKindOfClass & 1) != 0))
    {
      unsigned __int8 v10 = 1;
    }
    else
    {
      CGFloat v18 = [v7 view];
      [v7 locationInView:v18];
      double v20 = v19;
      double v22 = v21;
      double v23 = [v7 view];
      double v24 = -[BKHTMLContentViewController _annotationUuidIntersectingPoint:inView:annotationLayerRect:](self, "_annotationUuidIntersectingPoint:inView:annotationLayerRect:", v23, 0, v20, v22);

      unsigned __int8 v10 = v24 != 0;
    }
  }

  return v10;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  if (self->_tapGesture == a3) {
    return -[BKHTMLContentViewController preflightTap:](self, "preflightTap:");
  }
  else {
    return 1;
  }
}

- (BOOL)gestureRecognizer:(id)a3 canBePreventedByGestureRecognizer:(id)a4
{
  id v6 = (UITapGestureRecognizer *)a3;
  id v7 = a4;
  if (![(BKHTMLContentViewController *)self supportsExpandedContent]
    || self->_tapGesture == v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char v8 = 0;
  }
  else if (self->_doubleTapGesture == v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v9 = v7;
    char v8 = [v9 numberOfTapsRequired] != (char *)&dword_0 + 2
      || [v9 numberOfTouchesRequired] != (char *)&dword_0 + 1;
  }
  else
  {
    char v8 = 1;
  }

  return v8;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (id)nextResponder
{
  if ([(BKHTMLContentViewController *)self isViewLoaded])
  {
    v5.receiver = self;
    v5.super_class = (Class)BKHTMLContentViewController;
    unsigned int v3 = [(BKHTMLContentViewController *)&v5 nextResponder];
  }
  else
  {
    unsigned int v3 = 0;
  }

  return v3;
}

- (void)menuWillClose:(id)a3
{
  [(BKHTMLContentViewController *)self setTempOwnerID:0];

  [(BKHTMLContentViewController *)self resignFirstResponder];
}

- (void)showHighlightingMenuForAnnotation:(id)a3
{
  id v5 = a3;
  id v4 = [(BKContentViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 contentViewController:self showHighlightingMenuForAnnotation:v5];
  }
}

- (void)_showMenuForRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (!+[BKBookViewController useEnhancedEditMenu])
  {
    id v9 = +[UIMenuController sharedMenuController];
    char v8 = [(BKHTMLContentViewController *)self view];
    [v9 showMenuFromView:v8 rect:x, y, width, height];
  }
}

- (void)selectLocation:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  char v8 = BUDynamicCast();
  if (v8)
  {
    objc_initWeak(&location, self);
    webView2 = self->_webView2;
    unsigned __int8 v10 = [v8 cfiString];
    double v11 = +[NSString stringWithFormat:@"__ibooks_cfi_utilities.setSelectedRange('%@')", v10];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_26374;
    v12[3] = &unk_1DB238;
    objc_copyWeak(&v14, &location);
    id v13 = v7;
    [(WKWebView *)webView2 evaluateJavaScript:v11 completionHandler:v12];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

- (void)selectAnnotation:(id)a3
{
  id v5 = [(BKHTMLContentViewController *)self selectedAnnotation];
  id v4 = [v5 location];
  [(BKHTMLContentViewController *)self selectLocation:v4 completion:0];
}

- (AEHighlightRenderingController)highlightRenderingController
{
  highlightRenderingController = self->_highlightRenderingController;
  if (!highlightRenderingController)
  {
    id v4 = (AEHighlightRenderingController *)objc_alloc_init((Class)AEHighlightRenderingController);
    id v5 = self->_highlightRenderingController;
    self->_highlightRenderingController = v4;

    id v6 = [(BKHTMLContentViewController *)self theme];
    -[AEHighlightRenderingController setAnnotationBlendMode:](self->_highlightRenderingController, "setAnnotationBlendMode:", [v6 annotationBlendMode]);

    id v7 = [(BKHTMLContentViewController *)self theme];
    -[AEHighlightRenderingController setPageTheme:](self->_highlightRenderingController, "setPageTheme:", [v7 annotationPageTheme]);

    char v8 = [(BKHTMLContentViewController *)self theme];
    if ([v8 shouldInvertContent])
    {
      id v9 = [(BKContentViewController *)self configuration];
      -[AEHighlightRenderingController setDrawSpecialGrayHighlights:](self->_highlightRenderingController, "setDrawSpecialGrayHighlights:", [v9 isScroll] ^ 1);
    }
    else
    {
      [(AEHighlightRenderingController *)self->_highlightRenderingController setDrawSpecialGrayHighlights:0];
    }

    [(AEHighlightRenderingController *)self->_highlightRenderingController setCanUseFilters:1];
    highlightRenderingController = self->_highlightRenderingController;
  }

  return highlightRenderingController;
}

- (BOOL)supportsNotesAndHighlights
{
  return 0;
}

- (BOOL)canCopyContent
{
  unsigned int v5 = [(AEBookInfo *)self->super._book isProtected];
  if (v5
    && (+[AEAssetEngine storeMgr],
        id v2 = objc_claimAutoreleasedReturnValue(),
        [v2 clientApplicationController],
        unsigned int v3 = objc_claimAutoreleasedReturnValue(),
        ![v3 allowCitationForProtectedBooks]))
  {
    LOBYTE(v7) = 0;
  }
  else
  {
    id v6 = [(AEBookInfo *)self->super._book sampleContent];
    unsigned int v7 = [v6 BOOLValue] ^ 1;

    if (!v5) {
      return v7;
    }
  }

  return v7;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  unsigned int v7 = [(BKHTMLContentViewController *)self hasTextSelected];
  unsigned int v8 = [(WKWebView *)self->_webView2 be_hasSelection];
  objc_opt_class();
  int isKindOfClass = objc_opt_isKindOfClass();
  objc_opt_class();
  int v10 = objc_opt_isKindOfClass();
  uint64_t v11 = [(BKHTMLContentViewController *)self selectedText];
  double v12 = (void *)v11;
  int v13 = isKindOfClass ^ 1;
  if (((isKindOfClass ^ 1) & 1) == 0 && (v10 & 1) == 0 && (v7 & v8 & 1) == 0)
  {
    unsigned int v34 = v8;
    int v35 = v10;
    id v14 = (void *)v11;
    double v15 = [(BKHTMLContentViewController *)self annotations];
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_26B70;
    v37[3] = &unk_1DB260;
    v37[4] = self;
    double v16 = +[NSPredicate predicateWithBlock:v37];
    double v17 = [v15 filteredArrayUsingPredicate:v16];
    CGFloat v18 = [v17 firstObject];

    if (v18)
    {
      double v12 = [v18 annotationSelectedText];

      unsigned int v7 = 1;
    }
    else
    {
      double v12 = v14;
    }

    unsigned int v8 = v34;
    int v10 = v35;
  }
  if ("selectAnnotation:" == a3)
  {
    if ((v13 | v7)) {
      goto LABEL_35;
    }
LABEL_23:
    unsigned __int8 v19 = [(BKHTMLContentViewController *)self supportsNotesAndHighlights];
    goto LABEL_24;
  }
  if ("selectBookmarkedLink:" == a3)
  {
    double v21 = [(BKHTMLContentViewController *)self loader];
    unsigned __int8 v22 = [v21 currentSelectionContainsAnchor];
LABEL_26:
    char v20 = v22;
LABEL_27:

    goto LABEL_36;
  }
  if ("annotateSelection:" == a3)
  {
    if ([(BKHTMLContentViewController *)self supportsNotesAndHighlights])
    {
      char v20 = v10 | v8;
      if ((v10 | v8 | v13)) {
        goto LABEL_36;
      }
      double v21 = [(BKHTMLContentViewController *)self selectedAnnotation];
      double v23 = [v21 annotationNote];
      char v20 = [v23 length] == 0;

      goto LABEL_27;
    }
LABEL_35:
    char v20 = 0;
    goto LABEL_36;
  }
  if ("bookmarkSelection:" == a3)
  {
    if (((v10 | v8) & 1) == 0) {
      goto LABEL_35;
    }
    goto LABEL_23;
  }
  if ("lookupSelection:" == a3)
  {
    if ((v10 | v7))
    {
      char v20 = (unint64_t)[v12 tokenCountWithEnumerationOptions:3 maxTokenCount:4 outLimitLength:0] < 4;
      goto LABEL_36;
    }
    goto LABEL_35;
  }
  if ("searchUsingSelection:" == a3 || "books_useSelectionForFind:" == a3)
  {
    char v20 = v10 | v7;
    goto LABEL_36;
  }
  if ("translateSelection:" == a3)
  {
    double v25 = [(BKContentViewController *)self book];
    unsigned __int8 v26 = +[BKBookViewController areCitationsAllowedForBook:v25];

    char v20 = v7 & v26;
    goto LABEL_36;
  }
  if ("shareSelection:" != a3 && "_share:" != a3 && "copyContent:" != a3 && "copy:" != a3)
  {
    if ("endOfBook:" != a3)
    {
      v36.receiver = self;
      v36.super_class = (Class)BKHTMLContentViewController;
      unsigned __int8 v19 = [(BKHTMLContentViewController *)&v36 canPerformAction:a3 withSender:v6];
LABEL_24:
      char v20 = v19;
      goto LABEL_36;
    }
    double v21 = +[NSUserDefaults standardUserDefaults];
    unsigned __int8 v22 = [v21 BOOLForKey:@"BKAllowEndOfBookDebugMenu"];
    goto LABEL_26;
  }
  char v27 = v10 | v7;
  double v28 = [(BKContentViewController *)self book];
  unsigned __int8 v29 = +[BKBookViewController areCitationsAllowedForBook:v28];

  CGRect v30 = [(BKContentViewController *)self delegate];
  if (v30)
  {
    CGRect v31 = [(BKContentViewController *)self delegate];
    unsigned __int8 v32 = [v31 isAnnotationSharingSupportedForContentViewController:self];
  }
  else
  {
    unsigned __int8 v32 = 1;
  }

  char v20 = v27 & v29 & v32;
  if ("shareSelection:" != a3 && "_share:" != a3)
  {
    if ("copyContent:" == a3 || "copy:" == a3) {
      char v20 = v29;
    }
    else {
      char v20 = 0;
    }
  }
LABEL_36:

  return v20 & 1;
}

- (void)endOfBook:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(BKContentViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    objc_initWeak(&location, self);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    void v7[2] = sub_26CBC;
    v7[3] = &unk_1DB288;
    objc_copyWeak(&v8, &location);
    [(BKHTMLContentViewController *)self _contentForSelectedRangeWithCompletion:v7];
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

- (void)lookupSelection:(id)a3
{
  id v4 = a3;
  objc_initWeak(location, self);
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_27240;
  v39[3] = &unk_1DB2D8;
  objc_copyWeak(&v40, location);
  unsigned int v5 = objc_retainBlock(v39);
  id v6 = self->_tempOwnerID;
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_273DC;
  v35[3] = &unk_1DB328;
  v35[4] = self;
  objc_copyWeak(&v38, location);
  id v7 = v6;
  id v36 = v7;
  id v8 = v5;
  id v37 = v8;
  id v9 = objc_retainBlock(v35);
  if ([(BKHTMLContentViewController *)self hasTextSelected])
  {
    ((void (*)(void *))v9[2])(v9);
  }
  else
  {
    id v32 = v4;
    int v10 = [(BKHTMLContentViewController *)self _payloadForKey:@"lookUpTerm" fromSender:v4];
    if ([v10 length])
    {
      uint64_t v11 = [(BKHTMLContentViewController *)self annotations];
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_276AC;
      v33[3] = &unk_1DB260;
      id v34 = v7;
      double v12 = +[NSPredicate predicateWithBlock:v33];
      int v13 = [v11 filteredArrayUsingPredicate:v12];
      CGRect v31 = [v13 firstObject];

      id v14 = [(BKHTMLContentViewController *)self annotationRectUnionCache];
      double v15 = [v31 annotationLocation];
      double v16 = [v14 objectForKeyedSubscript:v15];
      [v16 CGRectValue];
      double v18 = v17;
      double v20 = v19;
      double v22 = v21;
      double v24 = v23;

      v42.origin.double x = v18;
      v42.origin.double y = v20;
      v42.size.double width = v22;
      v42.size.double height = v24;
      if (CGRectIsEmpty(v42))
      {
        [(BKHTMLContentViewController *)self rectForPresentedMenuForTextInteraction];
        double v18 = v25;
        double v20 = v26;
        double v22 = v27;
        double v24 = v28;
      }
      id v29 = [objc_alloc((Class)UIView) initWithFrame:v18, v20, v22, v24];
      CGRect v30 = [(WKWebView *)self->_webView2 be_contentView];
      [v30 addSubview:v29];

      ((void (*)(void *, void *, id, uint64_t))v8[2])(v8, v10, v29, 1);
    }
    else
    {
      ((void (*)(void *))v9[2])(v9);
    }

    id v4 = v32;
  }

  objc_destroyWeak(&v38);
  objc_destroyWeak(&v40);
  objc_destroyWeak(location);
}

- (id)_rectsFromDictionary:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableArray array];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v3;
  id v5 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v26;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v26 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        int v10 = [v9 objectForKeyedSubscript:@"top"];
        [v10 doubleValue];
        double v12 = v11;

        int v13 = [v9 objectForKeyedSubscript:@"left"];
        [v13 doubleValue];
        double v15 = v14;

        double v16 = [v9 objectForKeyedSubscript:@"width"];
        [v16 doubleValue];
        double v18 = v17;

        double v19 = [v9 objectForKeyedSubscript:@"height"];
        [v19 doubleValue];
        double v21 = v20;

        double v22 = +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", v15, v12, v18, v21);
        [v4 addObject:v22];
      }
      id v6 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v6);
  }

  return v4;
}

- (void)translateSelection:(id)a3
{
  id v4 = [(BKContentViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_279D0;
    v6[3] = &unk_1DB350;
    void v6[4] = self;
    [(BKHTMLContentViewController *)self _contentForSelectedRangeWithCompletion:v6];
  }
}

- (void)dummyAnnotationForSelectionWK2WithCompletion:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_27C20;
  v4[3] = &unk_1DB378;
  char v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(BKHTMLContentViewController *)v5 _contentForSelectedRangeWithCompletion:v4];
}

- (void)searchUsingSelection:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_281F0;
  v5[3] = &unk_1DB3A0;
  objc_copyWeak(&v6, &location);
  [(BKHTMLContentViewController *)self _extractSelectedTextWithSender:v4 completion:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)_extractSelectedTextWithSender:(id)a3 completion:(id)a4
{
  id v6 = a3;
  double v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  double v14 = sub_283F4;
  double v15 = &unk_1DB3F0;
  double v16 = self;
  id v7 = a4;
  id v17 = v7;
  id v8 = objc_retainBlock(&v12);
  if ([(BKHTMLContentViewController *)self hasTextSelected])
  {
    ((void (*)(void ***))v8[2])(v8);
  }
  else
  {
    id v9 = [(BKHTMLContentViewController *)self _payloadForKey:@"searchTerm" fromSender:v6];
    if ([v9 length])
    {
      id v10 = objc_retainBlock(v7);
      double v11 = v10;
      if (v10) {
        (*((void (**)(id, void *))v10 + 2))(v10, v9);
      }
    }
    else
    {
      ((void (*)(void ***))v8[2])(v8);
    }
  }
}

- (void)books_useSelectionForFind:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_2861C;
  v5[3] = &unk_1DB3A0;
  objc_copyWeak(&v6, &location);
  [(BKHTMLContentViewController *)self _extractSelectedTextWithSender:v4 completion:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)_share:(id)a3
{
}

- (void)shareSelection:(id)a3
{
  id v4 = a3;
  char v5 = [(BKHTMLContentViewController *)self selectedAnnotation];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 location];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_28964;
    v8[3] = &unk_1DB440;
    v8[4] = self;
    id v9 = v6;
    [(BKHTMLContentViewController *)self visibleRectForLocation:v7 completion:v8];
  }
  else
  {
    objc_initWeak(&location, self);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_288EC;
    v10[3] = &unk_1DB418;
    objc_copyWeak(&v11, &location);
    [(BKHTMLContentViewController *)self dummyAnnotationForSelectionWK2WithCompletion:v10];
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

- (void)_shareAnnotation:(id)a3 annotationRects:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BKContentViewController *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    objc_initWeak(&location, self);
    id v10 = [(BKContentViewController *)self delegate];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_28B5C;
    v11[3] = &unk_1DB468;
    objc_copyWeak(&v12, &location);
    [v10 contentViewController:self shareAnnotation:v6 annotationRects:v7 completion:v11];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

- (void)_bookmarkSelectionAndAnnotate:(BOOL)a3 showColorEditor:(BOOL)a4
{
}

- (void)_bookmarkSelectionAndAnnotate:(BOOL)a3 showColorEditor:(BOOL)a4 completion:(id)a5
{
  id v8 = a5;
  char v9 = [(BKContentViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v9 clearSearchResultForContentViewController:self];
  }
  objc_initWeak(&location, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_28D10;
  v11[3] = &unk_1DB4E0;
  objc_copyWeak(&v13, &location);
  id v10 = v8;
  id v12 = v10;
  BOOL v14 = a3;
  BOOL v15 = a4;
  [(BKHTMLContentViewController *)self _contentForSelectedRangeWithCompletion:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)_combineAnnotation:(id)a3 withAnnotation:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  if (v13 != v6)
  {
    id v7 = [v13 annotationNote];
    id v8 = [v7 length];

    if (v8)
    {
      char v9 = [v6 annotationNote];
      if ([v9 length])
      {
        uint64_t v10 = [v13 annotationNote];
        id v11 = +[NSString stringWithFormat:@"%@\n\n%@", v9, v10];

        char v9 = (void *)v10;
      }
      else
      {
        id v11 = [v13 annotationNote];
      }

      [v6 setAnnotationNote:v11];
    }
    id v12 = [(BKContentViewController *)self book];
    [v12 deleteAnnotation:v13];
  }
}

- (void)_showAnnotationWithState:(BOOL)a3 showColorEditor:(BOOL)a4 forAnnotation:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  [(BKHTMLContentViewController *)self clearSelection];
  char v9 = [(BKContentViewController *)self delegate];
  if (v6)
  {
    if (objc_opt_respondsToSelector()) {
      [v9 contentViewController:self showNoteForAnnotation:v8];
    }
  }
  else
  {
    if (v5) {
      [(BKHTMLContentViewController *)self showHighlightingMenuForAnnotation:v8];
    }
    uint64_t v10 = [v8 managedObjectContext];
    id v13 = 0;
    unsigned __int8 v11 = [v10 save:&v13];
    id v12 = v13;

    if ((v11 & 1) == 0 && v12) {
      NSLog(@"Error Saving Annotation MOC: %@", v12);
    }
    if (objc_opt_respondsToSelector()) {
      [v9 paginationUpdateRequiredForContentViewController:self];
    }
  }
}

- (void)bookmarkSelection:(id)a3
{
}

- (void)annotateSelection:(id)a3
{
}

- (void)selectBookmarkedLink:(id)a3
{
  id v4 = [(BKHTMLContentViewController *)self loader];
  unsigned int v5 = [v4 currentSelectionContainsAnchor];

  if (v5)
  {
    id v6 = [(BKHTMLContentViewController *)self webView2];
    [v6 evaluateJavaScript:@"__ibooks_content_support.clickFirstAnchorInSelection()" completionHandler:0];
  }
}

- (void)_contentForSelectedRangeWithCompletion:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  unsigned int v5 = [(BKHTMLContentViewController *)self tempOwnerID];
  id v6 = BUDynamicCast();

  objc_initWeak(&location, self);
  id v7 = self->_webView2;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_29CA8;
  v11[3] = &unk_1DB530;
  objc_copyWeak(&v15, &location);
  id v8 = v4;
  id v14 = v8;
  id v9 = v6;
  id v12 = v9;
  uint64_t v10 = v7;
  id v13 = v10;
  [(WKWebView *)v10 evaluateJavaScript:@"__ibooks_cfi_utilities.getSelectedRange()" completionHandler:v11];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)copy:(id)a3
{
}

- (void)copyContent
{
  if ([(BKHTMLContentViewController *)self canCopyContent])
  {
    objc_initWeak(&location, self);
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_2A21C;
    v3[3] = &unk_1DB598;
    objc_copyWeak(&v5, &location);
    id v4 = &stru_1DB570;
    [(BKHTMLContentViewController *)self dummyAnnotationForSelectionWK2WithCompletion:v3];

    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

- (unint64_t)pageOffsetForLocation:(id)a3
{
  return 0;
}

- (void)pageOffsetRangeForLocation:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(BKHTMLContentViewController *)self loader];
  [v8 pageOffsetRangeForLocation:v7 completion:v6];
}

- (BOOL)isLocationFromThisDocument:(id)a3
{
  id v4 = a3;
  id v5 = [v4 ordinal];
  if (v5 == (id)[(BKContentViewController *)self ordinal])
  {
    unsigned __int8 v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [v4 path];
      id v8 = [(BKContentViewController *)self document];
      id v9 = [v8 href];
      unsigned __int8 v6 = [v7 isEqualToString:v9];
    }
    else
    {
      unsigned __int8 v6 = 0;
    }
  }

  return v6;
}

- (BOOL)isLocationOnCurrentPage:(id)a3
{
  id v4 = a3;
  if ([(BKContentViewController *)self pageOffset] < 0
    || [(BKContentViewController *)self pageOffset] == 0x7FFFFFFFFFFFFFFFLL
    || ![(BKHTMLContentViewController *)self isLocationFromThisDocument:v4])
  {
    LOBYTE(v10) = 0;
  }
  else
  {
    objc_opt_class();
    id v5 = BUDynamicCast();
    if (v5)
    {
      unsigned __int8 v6 = [(BKHTMLContentViewController *)self loader];
      id v7 = [v6 currentVisbleCFILocation];
      id v8 = [v7 cfi];
      id v9 = [v5 cfi];
      id v10 = [v8 rangeIntersectsCFI:v9];
    }
    else
    {
      id v10 = 0;
    }
    id v12 = _AEAnnotationLocationLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = [(BKHTMLContentViewController *)self loader];
      id v14 = [v13 currentVisbleCFILocation];
      id v15 = +[NSNumber numberWithBool:v10];
      int v16 = 138412802;
      id v17 = v14;
      __int16 v18 = 2112;
      double v19 = v5;
      __int16 v20 = 2112;
      double v21 = v15;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "isLocationOnCurrentPage: currentVisibleCFI:%@ forLocation:%@ isVisible:%@", (uint8_t *)&v16, 0x20u);
    }
  }

  return (char)v10;
}

- (void)isLocationVisible:(id)a3 annotation:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if ([(BKContentViewController *)self pageOffset] < 0
    || [(BKContentViewController *)self pageOffset] == 0x7FFFFFFFFFFFFFFFLL
    || ![(BKHTMLContentViewController *)self isLocationFromThisDocument:v7])
  {
    id v9 = objc_retainBlock(v8);
    id v10 = v9;
    if (v9) {
      (*((void (**)(id, void))v9 + 2))(v9, 0);
    }
  }
  else
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_2A6E0;
    v11[3] = &unk_1DB1C0;
    id v12 = v7;
    id v13 = v8;
    [(BKHTMLContentViewController *)self visibleRectForLocation:v12 completion:v11];
  }
}

- (BOOL)isAnnotationVisible:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    unsigned __int8 v6 = [v4 location];
    unsigned int v7 = [(BKHTMLContentViewController *)self isLocationFromThisDocument:v6];

    if (v7)
    {
      id v8 = [v5 annotationLocation];
      if (v8)
      {
        id v9 = [(BKHTMLContentViewController *)self annotationRectUnionCache];
        id v10 = [v9 objectForKeyedSubscript:v8];

        if (v10)
        {
          unsigned __int8 v11 = [(BKContentViewController *)self configuration];
          if ([v11 isScroll]) {
            BOOL v12 = [v5 annotationType] == 1;
          }
          else {
            BOOL v12 = 0;
          }
          unsigned __int8 v14 = [(BKHTMLContentViewController *)self _isCachedAnnotationRectVisible:v10 considerEntirePage:v12];

          if (v14)
          {
            LOBYTE(v13) = 1;
            goto LABEL_15;
          }
          [(BKHTMLContentViewController *)self cachedVisibleRectForAnnotation:v5];
          CGFloat v16 = v15;
          CGFloat v18 = v17;
          CGFloat v20 = v19;
          CGFloat v22 = v21;
          v24.origin.double x = CGRectZero.origin.x;
          v24.origin.double y = CGRectZero.origin.y;
          v24.size.double width = CGRectZero.size.width;
          v24.size.double height = CGRectZero.size.height;
          v26.origin.double x = v16;
          v26.origin.double y = v18;
          v26.size.double width = v20;
          v26.size.double height = v22;
          if (!CGRectEqualToRect(v24, v26))
          {
            v25.origin.double x = v16;
            v25.origin.double y = v18;
            v25.size.double width = v20;
            v25.size.double height = v22;
            BOOL v13 = !CGRectIsNull(v25);
            goto LABEL_15;
          }
        }
      }
      else
      {
        id v10 = 0;
      }
      LOBYTE(v13) = 0;
LABEL_15:

      goto LABEL_16;
    }
  }
  LOBYTE(v13) = 0;
LABEL_16:

  return v13;
}

- (CGRect)cachedRectForAnnotation:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  CGFloat x = CGRectZero.origin.x;
  CGFloat y = CGRectZero.origin.y;
  CGFloat width = CGRectZero.size.width;
  CGFloat height = CGRectZero.size.height;
  if (v4)
  {
    id v10 = [v4 location];
    unsigned int v11 = [(BKHTMLContentViewController *)self isLocationFromThisDocument:v10];

    if (v11)
    {
      BOOL v12 = [v5 annotationLocation];
      if (v12)
      {
        BOOL v13 = [(BKHTMLContentViewController *)self annotationRectUnionCache];
        unsigned __int8 v14 = [v13 objectForKeyedSubscript:v12];

        if (v14)
        {
          [v14 rectValue];
          CGFloat x = v15;
          CGFloat y = v16;
          CGFloat width = v17;
          CGFloat height = v18;
        }
      }
    }
  }

  double v19 = x;
  double v20 = y;
  double v21 = width;
  double v22 = height;
  result.size.CGFloat height = v22;
  result.size.CGFloat width = v21;
  result.origin.CGFloat y = v20;
  result.origin.CGFloat x = v19;
  return result;
}

- (CGRect)cachedVisibleRectForAnnotation:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  CGFloat x = CGRectZero.origin.x;
  CGFloat y = CGRectZero.origin.y;
  CGFloat width = CGRectZero.size.width;
  CGFloat height = CGRectZero.size.height;
  if (v4)
  {
    id v10 = [v4 location];
    unsigned int v11 = [(BKHTMLContentViewController *)self isLocationFromThisDocument:v10];

    if (v11)
    {
      BOOL v12 = [v5 annotationLocation];
      BOOL v13 = [(BKHTMLContentViewController *)self annotationRectsCache];
      unsigned __int8 v14 = [v13 objectForKeyedSubscript:v12];

      if ([v14 count])
      {
        double v15 = [(BKHTMLContentViewController *)self arrayOfVisibleRectsFromRects:v14];
        CGFloat x = BKUnionRects(v15);
        CGFloat y = v16;
        CGFloat width = v17;
        CGFloat height = v18;
      }
    }
  }

  double v19 = x;
  double v20 = y;
  double v21 = width;
  double v22 = height;
  result.size.CGFloat height = v22;
  result.size.CGFloat width = v21;
  result.origin.CGFloat y = v20;
  result.origin.CGFloat x = v19;
  return result;
}

- (BOOL)_isDoubleWide
{
  return 0;
}

- (int64_t)totalPages
{
  return 1;
}

- (int64_t)visiblePageCount
{
  if (![(BKHTMLContentViewController *)self _isDoubleWide]) {
    return 1;
  }
  unsigned int v3 = [(BKContentViewController *)self pageProgressionDirection];
  if (v3 == 1)
  {
    if ([(BKContentViewController *)self pageOffset] <= 0) {
      return 1;
    }
  }
  else
  {
    if (v3) {
      return 1;
    }
    int64_t v4 = [(BKHTMLContentViewController *)self totalPages];
    if (v4 < [(BKContentViewController *)self pageOffset] + 2) {
      return 1;
    }
  }
  return 2;
}

- (void)setOrdinal:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BKHTMLContentViewController;
  if ([(BKContentViewController *)&v6 ordinal] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)BKHTMLContentViewController;
    [(BKContentViewController *)&v5 setOrdinal:a3];
    [(BKContentViewController *)self setTotalPages:-1];
    [(BKContentViewController *)self setContentLoaded:0];
    [(BKContentViewController *)self setContentLoadPending:0];
    [(BKHTMLContentViewController *)self _updateReadingStateVisibilityPossible:0];
  }
}

- (id)currentLocation
{
  uint64_t v3 = [(BKHTMLContentViewController *)self contentView];
  if (v3
    && (int64_t v4 = (void *)v3, v5 = [(BKContentViewController *)self isContentLoaded], v4, v5))
  {
    objc_super v6 = [(BKHTMLContentViewController *)self loader];
    unsigned int v7 = [v6 currentFirstVisbleCFILocation];
  }
  else
  {
    unsigned int v7 = 0;
  }

  return v7;
}

- (BOOL)isLoading
{
  return ![(BKContentViewController *)self isContentLoaded];
}

- (void)contentReady
{
  v5.receiver = self;
  v5.super_class = (Class)BKHTMLContentViewController;
  [(BKContentViewController *)&v5 contentReady];
  uint64_t v3 = [(BKContentViewController *)self searchLocation];

  if (v3)
  {
    int64_t v4 = [(BKContentViewController *)self searchLocation];
    [(BKHTMLContentViewController *)self highlightSearchLocation:v4];
  }
  [(BKHTMLContentViewController *)self _updateReadingState];
  if (self->_shouldAutoplay)
  {
    [(BKHTMLContentViewController *)self playFirstVisibleAutoplayMediaObject];
    self->_shouldAutoplaCGFloat y = 0;
  }
  [(WKWebView *)self->_webView2 setHidden:0];
}

- (void)suspend
{
  if ([(BKContentViewController *)self isContentLoaded])
  {
    uint64_t v3 = [(BKHTMLContentViewController *)self loader];
    int64_t v4 = [v3 webView];
    [v4 _suspendAllMediaPlayback];

    id v5 = [(BKHTMLContentViewController *)self loader];
    [v5 unregisterForVisibleCFIUpdates];
  }
}

- (void)resume
{
  if ([(BKContentViewController *)self isContentLoaded])
  {
    uint64_t v3 = [(BKHTMLContentViewController *)self loader];
    int64_t v4 = [v3 webView];
    [v4 _resumeAllMediaPlayback];

    id v5 = [(BKHTMLContentViewController *)self loader];
    [v5 registerForVisibleCFIUpdates];
  }
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)BKHTMLContentViewController;
  [(BKContentViewController *)&v3 prepareForReuse];
  [(BKHTMLContentViewController *)self _updateReadingStateVisibilityPossible:0];
}

- (void)_updateReadingState
{
}

- (void)_updateReadingStateVisibilityPossible:(BOOL)a3
{
}

- (void)_updateReadingStateVisibilityPossible:(BOOL)a3 knownDOMRange:(id)a4
{
  BOOL v4 = a3;
  objc_super v6 = [(BKContentViewController *)self delegate];
  id v36 = [v6 assetViewControllerDelegateForContentViewController:self];

  id v7 = [v36 readingStatisticsEnabled];
  id v8 = v36;
  if (v7)
  {
    if (v4
      && [(BKContentViewController *)self isContentLoaded]
      && [(BKHTMLContentViewController *)self isViewLoaded]
      && ([(BKHTMLContentViewController *)self view],
          id v9 = objc_claimAutoreleasedReturnValue(),
          [v9 window],
          id v10 = objc_claimAutoreleasedReturnValue(),
          v10,
          v9,
          v10))
    {
      unsigned int v11 = [(BKHTMLContentViewController *)self view];
      BOOL v12 = [(BKHTMLContentViewController *)self view];
      [v12 bounds];
      [v11 convertRect:0 toView:];
      CGFloat v14 = v13;
      CGFloat v16 = v15;
      CGFloat v18 = v17;
      CGFloat v20 = v19;

      double v21 = +[UIScreen mainScreen];
      [v21 bounds];
      v40.origin.CGFloat x = v14;
      v40.origin.CGFloat y = v16;
      v40.size.double width = v18;
      v40.size.double height = v20;
      CGRect v39 = CGRectIntersection(v38, v40);
      double width = v39.size.width;
      double height = v39.size.height;

      CGRect v24 = 0;
      if (width > 0.0 && height > 0.0)
      {
        CGRect v25 = [(BKHTMLContentViewController *)self loader];
        CGRect v26 = [v25 currentVisbleCFILocation];

        long long v27 = [v26 ensureRange];
        CGRect v24 = [v27 cfiString];
      }
    }
    else
    {
      CGRect v24 = 0;
    }
    long long v28 = [(BKHTMLContentViewController *)self visibleCFIString];
    unsigned __int8 v29 = [v28 isEqualToString:v24];

    if ((v29 & 1) == 0)
    {
      CGRect v30 = [(BKHTMLContentViewController *)self visibleCFIString];
      id v31 = [v30 length];

      if (v31)
      {
        id v32 = [(BKHTMLContentViewController *)self visibleCFIString];
        CGFloat v33 = +[BCCFISet cfiSetWithCFIString:v32];

        if (v33) {
          [v36 assetViewController:0 willHideContentWithCFIs:v33];
        }
      }
      [(BKHTMLContentViewController *)self setVisibleCFIString:v24];
      if ([v24 length])
      {
        id v34 = [(BKHTMLContentViewController *)self visibleCFIString];
        int v35 = +[BCCFISet cfiSetWithCFIString:v34];

        if (v35) {
          [v36 assetViewController:0 didShowContentWithCFIs:v35];
        }
      }
    }

    id v8 = v36;
  }

  _objc_release_x1(v7, v8);
}

- (void)clearSelection
{
  v3.receiver = self;
  v3.super_class = (Class)BKHTMLContentViewController;
  [(BKContentViewController *)&v3 clearSelection];
  [(WKWebView *)self->_webView2 be_clearSelection];
}

- (void)clearSelectedAnnotation
{
}

- (BOOL)hasTextSelected
{
  id v2 = [(BKHTMLContentViewController *)self selectedText];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (id)selectedText
{
  return [(WKWebView *)self->_webView2 be_selectedText];
}

- (id)selectedTextForAccessibility
{
  id v2 = [(BKHTMLContentViewController *)self loader];
  BOOL v3 = [v2 currentTextSelection];

  return v3;
}

- (void)stopPlayingMedia:(BOOL)a3
{
  id v5 = [&off_1E9610 mutableCopy];
  id v8 = v5;
  if (!a3)
  {
    [v5 addObject:@"audio"];
    id v5 = v8;
  }
  objc_super v6 = [v5 componentsJoinedByString:@","];
  id v7 = +[NSString stringWithFormat:@"__ibooks_content_support._pauseMediaTypes(\"%@\")", v6];
  [(WKWebView *)self->_webView2 evaluateJavaScript:v7 completionHandler:0];
}

- (void)stopPlayingMediaIfNoLongerVisible
{
}

- (void)_setupSelectionContextMenu
{
  AEBundle();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = [v3 localizedStringForKey:@"Last page in this chapter" value:&stru_1DF0D8 table:0];
}

- (BOOL)contentNeedsFilter
{
  id v2 = [(BKHTMLContentViewController *)self theme];
  char v3 = [v2 shouldInvertContent] ^ 1;

  return v3;
}

- (id)_errorForURL:(id)a3
{
  double v17 = [(id)objc_opt_class() description];
  CGFloat v16 = +[NSNumber numberWithBool:a3 != 0];
  id v5 = +[NSNumber numberWithBool:self->super._book != 0];
  objc_super v6 = +[NSNumber numberWithInteger:self->super._ordinal];
  id v7 = [(AEBookInfo *)self->super._book databaseKey];
  if (v7)
  {
    id v8 = [(AEBookInfo *)self->super._book databaseKey];
  }
  else
  {
    id v8 = @"<nil>";
  }
  id v9 = [(AEBookInfo *)self->super._book bookTitle];
  if (v9)
  {
    id v10 = [(AEBookInfo *)self->super._book bookTitle];
  }
  else
  {
    id v10 = @"<nil>";
  }
  unsigned int v11 = [(AEBookInfo *)self->super._book bookBundlePath];
  if (v11)
  {
    BOOL v12 = [(AEBookInfo *)self->super._book bookBundlePath];
  }
  else
  {
    BOOL v12 = @"<nil>";
  }
  double v13 = +[NSDictionary dictionaryWithObjectsAndKeys:v16, @"url!=nil", v5, @"_book!=nil", v6, @"_ordinal", v8, @"_book.databaseKey", v10, @"_book.bookTitle", v12, @"_book.bookBundlePath", 0];
  CGFloat v14 = +[NSError errorWithDomain:v17 code:1 userInfo:v13];

  if (v11) {
  if (v9)
  }

  if (v7) {

  }
  return v14;
}

- (id)URLForLoadingDocument
{
  book = self->super._book;
  char v3 = [(BKContentViewController *)self document];
  BOOL v4 = [(AEBookInfo *)book urlForDocument:v3];

  return v4;
}

- (void)load
{
  v10.receiver = self;
  v10.super_class = (Class)BKHTMLContentViewController;
  [(BKContentViewController *)&v10 load];
  if ([(BKContentViewController *)self isContentLoaded])
  {
    char v3 = [(WKWebView *)self->_webView2 be_navigationHandler];
    BOOL v4 = [(WKWebView *)self->_webView2 URL];
    [(BKHTMLContentViewController *)self navigationHandler:v3 didFinishLoadOfURL:v4];
LABEL_7:

    goto LABEL_8;
  }
  char v3 = [(BKHTMLContentViewController *)self URLForLoadingDocument];
  if (!v3)
  {
    [(BKContentViewController *)self setContentLoadPending:0];
    BOOL v4 = [(BKContentViewController *)self delegate];
    id v9 = [(BKHTMLContentViewController *)self _errorForURL:0];
    [v4 contentViewFailedToLoad:self error:v9];

    goto LABEL_7;
  }
  [(BKHTMLContentViewController *)self _recheckRemoveAccessApproval];
  id v5 = [(WKWebView *)self->_webView2 URL];
  unsigned __int8 v6 = [v5 be_isEquivalentToURL:v3 ignoringFragment:0];

  if ((v6 & 1) == 0)
  {
    webView2 = self->_webView2;
    BOOL v4 = +[NSURLRequest requestWithURL:v3];
    id v8 = [(WKWebView *)webView2 loadRequest:v4];
    goto LABEL_7;
  }
LABEL_8:
}

- (void)_recheckRemoveAccessApproval
{
  char v3 = [(BKContentViewController *)self document];

  if (v3)
  {
    if (self->_webView2)
    {
      BOOL v4 = [(BKContentViewController *)self book];
      id v5 = [v4 cacheItem];
      id v6 = [v5 contentBlockingRule];

      objc_initWeak(&location, self->_webView2);
      id v7 = +[BEContentBlockingRules sharedInstance];
      id v8 = objc_loadWeakRetained(&location);
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_2BA7C;
      v9[3] = &unk_1DB5C0;
      objc_copyWeak(&v10, &location);
      [v7 applyContentBlockingRule:v6 toWebView:v8 completion:v9];

      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_227970 == a6)
  {
    if (objc_msgSend(a3, "isEqualToString:", BEDocumentExternalLoadApprovalCacheDefaultsClearKey, a4, a5))
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_2BB9C;
      block[3] = &unk_1DAB88;
      block[4] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)BKHTMLContentViewController;
    -[BKHTMLContentViewController observeValueForKeyPath:ofObject:change:context:](&v7, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  id v8 = v7;
  if (v7) {
    [v7 targetTransform];
  }
  else {
    memset(&v11, 0, sizeof(v11));
  }
  self->_isRotating = !CGAffineTransformIsIdentity(&v11);
  v10.receiver = self;
  v10.super_class = (Class)BKHTMLContentViewController;
  -[BKHTMLContentViewController viewWillTransitionToSize:withTransitionCoordinator:](&v10, "viewWillTransitionToSize:withTransitionCoordinator:", v8, width, height);
  [(BKContentViewController *)self setTotalPages:-1];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_2BCB0;
  v9[3] = &unk_1DAA18;
  void v9[4] = self;
  [v8 animateAlongsideTransition:0 completion:v9];
}

- (id)objectForMatchingAnnotation:(id)a3
{
  id v4 = a3;
  id v5 = [(BKHTMLContentViewController *)self annotationRectUnionCache];
  id v6 = [v4 objectForKeyedSubscript:@"annotationLocation"];
  id v7 = [v5 objectForKeyedSubscript:v6];

  if (v7)
  {
    id v8 = +[NSMutableDictionary dictionary];
    uint64_t v9 = [v4 objectForKeyedSubscript:@"annotationSelectedText"];
    objc_super v10 = (void *)v9;
    if (v9) {
      CFStringRef v11 = (const __CFString *)v9;
    }
    else {
      CFStringRef v11 = &stru_1DF0D8;
    }
    [v8 setObject:v11 forKeyedSubscript:@"text"];

    uint64_t v12 = [v4 objectForKeyedSubscript:@"annotationLocation"];
    double v13 = (void *)v12;
    if (v12) {
      CFStringRef v14 = (const __CFString *)v12;
    }
    else {
      CFStringRef v14 = &stru_1DF0D8;
    }
    [v8 setObject:v14 forKeyedSubscript:@"uuid"];

    [v7 rectValue];
    CGFloat v16 = v15;
    double v18 = v17;
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    double v23 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v35[0] = v23;
    CGRect v24 = +[NSNumber numberWithDouble:v18];
    v35[1] = v24;
    CGRect v25 = +[NSArray arrayWithObjects:v35 count:2];

    v37.origin.CGFloat x = v16;
    v37.origin.CGFloat y = v18;
    v37.size.double width = v20;
    v37.size.double height = v22;
    double MaxX = CGRectGetMaxX(v37);
    v38.origin.CGFloat x = v16;
    v38.origin.CGFloat y = v18;
    v38.size.double width = v20;
    v38.size.double height = v22;
    double MaxY = CGRectGetMaxY(v38);
    long long v28 = +[NSNumber numberWithDouble:MaxX];
    v34[0] = v28;
    unsigned __int8 v29 = +[NSNumber numberWithDouble:MaxY];
    v34[1] = v29;
    CGRect v30 = +[NSArray arrayWithObjects:v34 count:2];

    if (v25) {
      id v31 = v25;
    }
    else {
      id v31 = &__NSArray0__struct;
    }
    [v8 setObject:v31 forKeyedSubscript:@"startPoint"];
    if (v30) {
      id v32 = v30;
    }
    else {
      id v32 = &__NSArray0__struct;
    }
    [v8 setObject:v32 forKeyedSubscript:@"endPoint"];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)writeAnnotationsToWebProcessPlugin:(id)a3 andHighlights:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(BKHTMLContentViewController *)self webView2];
  uint64_t v9 = [(BKHTMLContentViewController *)self webView2];
  objc_super v10 = objc_msgSend(v9, "be_updateAXValueForMessage:", v7);

  [v8 be_updateAXCurrentReadingStateWithMessage:@"BEWebProcessPluginBookmarkStateParameterKey" forValue:v10];
  id v13 = [(BKHTMLContentViewController *)self webView2];
  CFStringRef v11 = [(BKHTMLContentViewController *)self webView2];
  uint64_t v12 = [v11 be_updateAXValueForMessage:v6];

  [v13 be_updateAXCurrentReadingStateWithMessage:@"BEWebProcessPluginAnnotationParameterKey" forValue:v12];
}

- (void)writeControlVisibilityStateToWebProcessPlugin:(BOOL)a3
{
  BOOL v3 = a3;
  id v8 = [(BKHTMLContentViewController *)self webView2];
  id v5 = [(BKHTMLContentViewController *)self webView2];
  id v6 = +[NSNumber numberWithBool:v3];
  id v7 = [v5 be_updateAXValueForMessage:v6];
  [v8 be_updateAXCurrentReadingStateWithMessage:@"BEWebProcessPluginHasVisibleControlsParameterKey" forValue:v7];
}

- (void)navigationHandler:(id)a3 didStartLoadOfURL:(id)a4
{
}

- (void)navigationHandler:(id)a3 handleUserRequestForFrameToLoadExternalURL:(id)a4 completion:(id)a5
{
  id v10 = a4;
  id v7 = a5;
  id v8 = [(BKContentViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    [v8 contentViewController:self handleUserRequestForFrameToLoadExternalURL:v10 completion:v7];
  }
  else
  {
    uint64_t v9 = (void (**)(id, void))objc_retainBlock(v7);

    if (v9) {
      v9[2](v9, 0);
    }
    id v7 = v9;
  }
}

- (void)navigationHandler:(id)a3 handleExternalLoadRequest:(id)a4 likelyUserInitiated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v7 = [(BKContentViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v7 contentViewController:self goToURL:v8 likelyUserInitiated:v5];
  }
}

- (BOOL)navigationHandler:(id)a3 handleInternalLoadRequest:(id)a4
{
  id v5 = a4;
  book = self->super._book;
  id v7 = [(BKContentViewController *)self document];
  id v8 = [(AEBookInfo *)book urlForDocument:v7];
  unsigned __int8 v9 = [v5 be_isEquivalentToURL:v8 ignoringFragment:0];

  if (v9)
  {
    [(WKWebView *)self->_webView2 setHidden:1];
  }
  else
  {
    if ([(BKHTMLContentViewController *)self shouldShowExpandedContentForURL:v5])
    {
      id v10 = +[BKExpandedContentResource resourceForURL:v5];
      CFStringRef v11 = [(BKContentViewController *)self book];
      uint64_t v12 = [v11 cacheItem];
      [v10 setCacheItem:v12];

      if (BEDoesURLPointToUSDZFile())
      {
        id v13 = [v5 absoluteURL];
        CFStringRef v14 = [v13 standardizedURL];
        double v15 = BEURLHandlerAssetInfoPathForBookURL();
        [v10 setSourceURL:v15];
      }
      CGFloat v16 = [(BKContentViewController *)self delegate];
      [v16 contentViewController:self showExpandedContentForResource:v10 atLocation:0];
    }
    else
    {
      id v10 = [(BKContentViewController *)self delegate];
      [v10 contentViewController:self goToURL:v5 likelyUserInitiated:0];
    }
  }
  return v9;
}

- (void)navigationHandler:(id)a3 didFinishLoadOfURL:(id)a4
{
  [(BKContentViewController *)self setTotalPages:[(BKWK2WebViewLoader *)self->_loader pageCount]];
  id v5 = [(BKContentViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 contentViewControllerDidFinishLayout:self];
  }
  [(BKHTMLContentViewController *)self stopActivityIndicator:1];
}

- (void)navigationHandlerFirstSignificantPaintCompleted:(id)a3
{
  self->_firstSignificantPaintCompleted = 1;
  id v4 = [(BKHTMLContentViewController *)self locationEnsuredFirstPaintWorkBlock];
  if (v4)
  {
    [(BKHTMLContentViewController *)self setLocationEnsuredFirstPaintWorkBlock:0];
    webView2 = self->_webView2;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_2C570;
    v6[3] = &unk_1DADC0;
    id v7 = v4;
    [(WKWebView *)webView2 _doAfterNextStablePresentationUpdate:v6];
  }
}

- (void)navigationHandlerWebContentProcessAttemptingReload:(id)a3
{
  id v4 = _AEBookPluginsLifeCycleLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138412290;
    id v7 = self;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_ERROR, "Content for %@ Attempting reload", (uint8_t *)&v6, 0xCu);
  }

  id v5 = [(BKContentViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 contentViewControllerAttemptingReload:self];
  }
}

- (void)navigationHandlerWebContentLoadFailed:(id)a3 reason:(id)a4
{
  id v5 = a4;
  [(BKHTMLContentViewController *)self setLoadFailureCount:(char *)[(BKHTMLContentViewController *)self loadFailureCount] + 1];
  int v6 = _AEBookPluginsLifeCycleLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v7 = +[NSNumber numberWithUnsignedInteger:[(BKHTMLContentViewController *)self loadFailureCount]];
    int v9 = 138412802;
    id v10 = self;
    __int16 v11 = 2112;
    id v12 = v5;
    __int16 v13 = 2112;
    CFStringRef v14 = v7;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_ERROR, "Content for %@ crashed with reason %@ - %@", (uint8_t *)&v9, 0x20u);
  }
  id v8 = [(BKContentViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v8 contentViewController:self encounteredIssueWithContent:v5 failureCount:[self loadFailureCount]];
  }
}

- (void)userContentController:(id)a3 didReceiveScriptMessage:(id)a4
{
  id v5 = a4;
  objc_opt_class();
  int v6 = [v5 body];
  id v7 = BUDynamicCast();

  id v8 = [v5 name];

  int v9 = [(BKContentViewController *)self delegate];
  if ([v8 isEqualToString:@"showAside"])
  {
    id v10 = objc_alloc_init(BKExpandedContentResource);
    objc_opt_class();
    __int16 v11 = [v7 objectForKeyedSubscript:@"documentURL"];
    id v12 = BUDynamicCast();

    if (v12)
    {
      __int16 v13 = +[NSURL URLWithString:v12];
      [(BKExpandedContentResource *)v10 setSourceURL:v13];
    }
    objc_opt_class();
    CFStringRef v14 = [v7 objectForKeyedSubscript:@"html"];
    double v15 = BUDynamicCast();
    [(BKExpandedContentResource *)v10 setResource:v15];

    objc_opt_class();
    CGFloat v16 = [v7 objectForKeyedSubscript:@"title"];
    double v17 = BUDynamicCast();
    [(BKExpandedContentResource *)v10 setTitle:v17];

    objc_opt_class();
    double v18 = [v7 objectForKeyedSubscript:@"contentType"];
    double v19 = BUDynamicCast();
    [(BKExpandedContentResource *)v10 setContentType:v19];

    CGFloat v20 = [(BKContentViewController *)self configuration];
    [v20 fontSize];
    -[BKExpandedContentResource setZoomScale:](v10, "setZoomScale:");

    double v21 = [(BKContentViewController *)self book];
    CGFloat v22 = [v21 cacheItem];
    [(BKExpandedContentResource *)v10 setCacheItem:v22];

    objc_opt_class();
    double v23 = [v7 objectForKeyedSubscript:@"rect"];
    CGRect v24 = BUDynamicCast();

    if (v24)
    {
      CGRect v40 = v24;
      CGRect v25 = +[NSArray arrayWithObjects:&v40 count:1];
      CGRect v26 = [(BKHTMLContentViewController *)self loader];
      long long v27 = +[BEJavascriptUtilities collapsedLineRectsFromArrayOfRectDictionaries:isVerticalDocument:](BEJavascriptUtilities, "collapsedLineRectsFromArrayOfRectDictionaries:isVerticalDocument:", v25, [v26 isVerticalDocument]);

      id v28 = [(BKHTMLContentViewController *)self _highlightRects:v27 withHighlightType:[(BKContentViewController *)self selectionHighlightType] owner:0 forWK2:1 clearSelection:0];
      if (objc_opt_respondsToSelector())
      {
        unsigned __int8 v29 = [(NSMutableArray *)self->super._highlightViews firstObject];
        CGRect v30 = [(BKHTMLContentViewController *)self stylesheetSet];
        [v9 showFootnoteInContentViewController:self resource:v10 fromView:v29 stylesheetSet:v30];
      }
    }

    goto LABEL_9;
  }
  if ([v8 isEqualToString:@"toggleBookmark"])
  {
    if (objc_opt_respondsToSelector()) {
      [v9 toggleBookmarkForContentViewController:self];
    }
  }
  else if ([v8 isEqualToString:@"toggleControlsVisibility"])
  {
    if (objc_opt_respondsToSelector()) {
      [v9 toggleControlsForContentViewController:self];
    }
  }
  else
  {
    if ([v8 isEqualToString:@"showHighlightMenu"])
    {
      id v31 = [(BKHTMLContentViewController *)self webView2];
      [v31 be_selectionRects];
      id v10 = (BKExpandedContentResource *)objc_claimAutoreleasedReturnValue();

      if ([(BKExpandedContentResource *)v10 count])
      {
        id v32 = [(BKExpandedContentResource *)v10 firstObject];
        [v32 CGRectValue];
        double x = v33;
        double y = v35;
      }
      else
      {
        double x = CGPointZero.x;
        double y = CGPointZero.y;
      }
      -[BKHTMLContentViewController showContextMenuAtLocation:](self, "showContextMenuAtLocation:", x, y);
LABEL_9:

      goto LABEL_10;
    }
    if ([v8 isEqualToString:@"turnPage"])
    {
      if ((objc_opt_respondsToSelector() & 1) == 0) {
        goto LABEL_10;
      }
      objc_opt_class();
      CGRect v37 = [v7 objectForKeyedSubscript:@"direction"];
      BUDynamicCast();
      id v10 = (BKExpandedContentResource *)objc_claimAutoreleasedReturnValue();

      [v9 contentViewController:self navigatePageDirection:v10];
      goto LABEL_9;
    }
    if ([v8 isEqualToString:@"checkOperation"])
    {
      [(BKHTMLContentViewController *)self _bkaxCheckCanPerformEditActions];
    }
    else if ([v8 isEqualToString:@"performOperation"])
    {
      objc_opt_class();
      CGRect v38 = [v7 objectForKeyedSubscript:@"selector"];
      CGRect v39 = BUDynamicCast();
      [(BKHTMLContentViewController *)self _bkaxPerformEditAction:v39];
    }
  }
LABEL_10:
}

- (BKReadAloudEventHandler)readAloudEventHandler
{
  readAloudEventHandler = self->_readAloudEventHandler;
  if (!readAloudEventHandler)
  {
    id v4 = [(BKContentViewController *)self book];
    id v5 = [v4 mediaActiveClass];
    int v6 = +[BKReadAloudEventHandler readAloudEventHandlerWithMediaClass:v5 delegate:self];
    id v7 = self->_readAloudEventHandler;
    self->_readAloudEventHandler = v6;

    readAloudEventHandler = self->_readAloudEventHandler;
  }

  return readAloudEventHandler;
}

- (void)_bkaxPerformEditAction:(id)a3
{
  id v4 = a3;
  id v5 = AEBundle();
  int v6 = [v5 localizedStringForKey:@"Select highlight" value:&stru_1DF0D8 table:0];
  unsigned int v7 = [v4 isEqualToString:v6];

  if (v7)
  {
    CFStringRef v8 = @"selectAnnotation:";
    goto LABEL_21;
  }
  int v9 = AEBundle();
  id v10 = [v9 localizedStringForKey:@"Open link" value:&stru_1DF0D8 table:0];
  unsigned int v11 = [v4 isEqualToString:v10];

  if (v11)
  {
    CFStringRef v8 = @"selectBookmarkedLink:";
    goto LABEL_21;
  }
  id v12 = AEBundle();
  __int16 v13 = [v12 localizedStringForKey:@"Add note" value:&stru_1DF0D8 table:0];
  unsigned int v14 = [v4 isEqualToString:v13];

  if (v14)
  {
    CFStringRef v8 = @"annotateSelection:";
    goto LABEL_21;
  }
  double v15 = AEBundle();
  CGFloat v16 = [v15 localizedStringForKey:@"Highlight" value:&stru_1DF0D8 table:0];
  unsigned int v17 = [v4 isEqualToString:v16];

  if (v17)
  {
    CFStringRef v8 = @"bookmarkSelection:";
    goto LABEL_21;
  }
  double v18 = AEBundle();
  double v19 = [v18 localizedStringForKey:@"Lookup" value:&stru_1DF0D8 table:0];
  unsigned int v20 = [v4 isEqualToString:v19];

  if (v20)
  {
    CFStringRef v8 = @"lookupSelection:";
    goto LABEL_21;
  }
  double v21 = AEBundle();
  CGFloat v22 = [v21 localizedStringForKey:@"Search" value:&stru_1DF0D8 table:0];
  unsigned int v23 = [v4 isEqualToString:v22];

  if (v23)
  {
    CFStringRef v8 = @"searchUsingSelection:";
    goto LABEL_21;
  }
  CGRect v24 = AEBundle();
  CGRect v25 = [v24 localizedStringForKey:@"Translate" value:&stru_1DF0D8 table:0];
  unsigned int v26 = [v4 isEqualToString:v25];

  if (v26)
  {
    CFStringRef v8 = @"translateSelection:";
    goto LABEL_21;
  }
  long long v27 = AEBundle();
  id v28 = [v27 localizedStringForKey:@"Copy" value:&stru_1DF0D8 table:0];
  unsigned int v29 = [v4 isEqualToString:v28];

  if (v29)
  {
    CFStringRef v8 = @"copy:";
    goto LABEL_21;
  }
  CGRect v30 = AEBundle();
  id v31 = [v30 localizedStringForKey:@"Share selection" value:&stru_1DF0D8 table:0];
  unsigned int v32 = [v4 isEqualToString:v31];

  if (v32)
  {
    CFStringRef v8 = @"shareSelection:";
    goto LABEL_21;
  }
  if ([v4 isEqualToString:@"Debug end of book experience"])
  {
    CFStringRef v8 = @"endOfBook:";
LABEL_21:
    if ([(BKHTMLContentViewController *)self _bkaxPerformSelector:v8]) {
      goto LABEL_25;
    }
  }
  double v33 = BCIMLog();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
    sub_137400((uint64_t)v4, v33, v34, v35, v36, v37, v38, v39);
  }

LABEL_25:
}

- (BOOL)_bkaxPerformSelector:(id)a3
{
  SEL v4 = NSSelectorFromString((NSString *)a3);
  char v5 = objc_opt_respondsToSelector();
  if (v5) {
    [(BKHTMLContentViewController *)self performSelector:v4 withObject:0];
  }
  return v5 & 1;
}

- (void)_bkaxCheckCanPerformEditActions
{
  id v25 = +[NSMutableArray array];
  if ([(BKHTMLContentViewController *)self canPerformAction:NSSelectorFromString(@"selectAnnotation:") withSender:0])
  {
    BOOL v3 = AEBundle();
    SEL v4 = [v3 localizedStringForKey:@"Select highlight" value:&stru_1DF0D8 table:0];
    [v25 addObject:v4];
  }
  if ([(BKHTMLContentViewController *)self canPerformAction:NSSelectorFromString(@"selectBookmarkedLink:") withSender:0])
  {
    char v5 = AEBundle();
    int v6 = [v5 localizedStringForKey:@"Open link" value:&stru_1DF0D8 table:0];
    [v25 addObject:v6];
  }
  if ([(BKHTMLContentViewController *)self canPerformAction:NSSelectorFromString(@"annotateSelection:") withSender:0])
  {
    unsigned int v7 = AEBundle();
    CFStringRef v8 = [v7 localizedStringForKey:@"Add note" value:&stru_1DF0D8 table:0];
    [v25 addObject:v8];
  }
  if ([(BKHTMLContentViewController *)self canPerformAction:NSSelectorFromString(@"bookmarkSelection:") withSender:0])
  {
    int v9 = AEBundle();
    id v10 = [v9 localizedStringForKey:@"Highlight" value:&stru_1DF0D8 table:0];
    [v25 addObject:v10];
  }
  if ([(BKHTMLContentViewController *)self canPerformAction:NSSelectorFromString(@"lookupSelection:") withSender:0])
  {
    unsigned int v11 = AEBundle();
    id v12 = [v11 localizedStringForKey:@"Lookup" value:&stru_1DF0D8 table:0];
    [v25 addObject:v12];
  }
  if ([(BKHTMLContentViewController *)self canPerformAction:NSSelectorFromString(@"searchUsingSelection:") withSender:0])
  {
    __int16 v13 = AEBundle();
    unsigned int v14 = [v13 localizedStringForKey:@"Search" value:&stru_1DF0D8 table:0];
    [v25 addObject:v14];
  }
  if ([(BKHTMLContentViewController *)self canPerformAction:NSSelectorFromString(@"translateSelection:") withSender:0])
  {
    double v15 = AEBundle();
    CGFloat v16 = [v15 localizedStringForKey:@"Translate" value:&stru_1DF0D8 table:0];
    [v25 addObject:v16];
  }
  if ([(BKHTMLContentViewController *)self canPerformAction:NSSelectorFromString(@"copy:") withSender:0]|| [(BKHTMLContentViewController *)self canPerformAction:NSSelectorFromString(@"copyContent:") withSender:0])
  {
    unsigned int v17 = AEBundle();
    double v18 = [v17 localizedStringForKey:@"Copy" value:&stru_1DF0D8 table:0];
    [v25 addObject:v18];
  }
  if ([(BKHTMLContentViewController *)self canPerformAction:NSSelectorFromString(@"shareSelection:") withSender:0])
  {
    double v19 = AEBundle();
    unsigned int v20 = [v19 localizedStringForKey:@"Share selection" value:&stru_1DF0D8 table:0];
    [v25 addObject:v20];
  }
  if ([(BKHTMLContentViewController *)self canPerformAction:NSSelectorFromString(@"endOfBook:") withSender:0])
  {
    [v25 addObject:@"Debug end of book experience"];
  }
  double v21 = [(BKHTMLContentViewController *)self webView2];
  CGFloat v22 = [(BKHTMLContentViewController *)self webView2];
  id v23 = [v25 copy];
  CGRect v24 = [v22 be_updateAXValueForMessage:v23];
  [v21 be_updateAXCurrentReadingStateWithMessage:@"BEWebProcessPluginOperationsParameterKey" forValue:v24];
}

- (void)readAloudEventHandler:(id)a3 foundMediaSource:(id)a4
{
}

- (void)readAloudEventHandler:(id)a3 tappedElementID:(id)a4 inHref:(id)a5
{
}

- (void)readAloudEventHandler:(id)a3 performedAction:(id)a4 turnStyle:(id)a5
{
  id v12 = a4;
  id v7 = a5;
  if ([v12 isEqualToString:@"start"])
  {
    char v8 = 0;
    uint64_t v9 = 1;
  }
  else if ([v12 isEqualToString:@"stop"])
  {
    char v8 = 0;
    uint64_t v9 = 2;
  }
  else
  {
    unsigned int v10 = [v12 isEqualToString:@"startstop"];
    char v8 = v10 ^ 1;
    if (v10) {
      uint64_t v9 = 3;
    }
    else {
      uint64_t v9 = 0;
    }
  }
  if (([v7 isEqualToString:@"automatic"] & 1) == 0)
  {
    if ([v7 isEqualToString:@"manual"]) {
      uint64_t v11 = 2;
    }
    else {
      uint64_t v11 = 0;
    }
    if (v8) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  uint64_t v11 = 1;
  if ((v8 & 1) == 0) {
LABEL_15:
  }
    [(BKHTMLContentViewController *)self invokedSMILControlAction:v9 withSMILTurnStyle:v11];
LABEL_16:
}

- (void)readAloudEventHandler:(id)a3 audioElementEnded:(id)a4
{
  char v5 = [(BKContentViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(BKContentViewController *)self delegate];
    [v7 resumeReadAloudForContentViewController:self];
  }
}

- (void)installReadAloudClickHandlersOnMediaOverlayElements:(id)a3
{
  id v4 = a3;
  char v5 = NSStringFromSelector("elementId");
  id v9 = [v4 valueForKey:v5];

  char v6 = [(BKHTMLContentViewController *)self readAloudEventHandler];
  id v7 = [(BKContentViewController *)self document];
  char v8 = [v7 href];
  [v6 installTapHandlersOnElementIDs:v9 withHref:v8];
}

- (void)removeReadAloudClickHandlersOnMediaOverlayElements:(id)a3
{
  id v4 = a3;
  char v5 = NSStringFromSelector("elementId");
  id v7 = [v4 valueForKey:v5];

  char v6 = [(BKHTMLContentViewController *)self readAloudEventHandler];
  [v6 removeTapHandlersOnElementIDs:v7];
}

- (void)markupDocumentForMediaOverlay
{
  id v2 = [(BKHTMLContentViewController *)self readAloudEventHandler];
  [v2 addMarkupForReadAloudToDocument];
}

- (void)cleanDocumentForMediaOverlay
{
  id v2 = [(BKHTMLContentViewController *)self readAloudEventHandler];
  [v2 removeMarkupForReadAloudToDocument];
}

- (void)handler:(id)a3 presentAlertController:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(BKContentViewController *)self delegate];
  [v9 contentViewController:self presentAlertController:v8 completion:v7];
}

- (void)handler:(id)a3 webView:(id)a4 didNotHandleTapAsClickAtPoint:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  id v14 = a4;
  id v8 = [(BKContentViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v9 = [(BKHTMLContentViewController *)self view];
    [v9 convertPoint:v14 fromView:x, y];
    double v11 = v10;
    double v13 = v12;

    [v8 contentView:unhandledClickAtPoint:self v11 v13];
  }
}

- (id)handler:(id)a3 citationForText:(id)a4 webView:(id)a5
{
  id v6 = a4;
  id v7 = objc_alloc_init(BKHTMLContentViewControllerDummyAnnotation);
  [(BKHTMLContentViewControllerDummyAnnotation *)v7 setAnnotationRepresentativeText:v6];

  id v8 = [(BKHTMLContentViewController *)self _excerptCitedStringForAnnotation:v7];

  return v8;
}

- (id)adjustedItemProvidersWithCitation:(id)a3 withExcerptString:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v29 = objc_alloc_init((Class)NSMutableArray);
  id v7 = objc_alloc_init((Class)NSItemProvider);
  if ([v6 length])
  {
    id v8 = [UTTypeUTF8PlainText identifier];
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_2DFA0;
    v43[3] = &unk_1DB5E8;
    id v44 = v6;
    [v7 registerDataRepresentationForTypeIdentifier:v8 visibility:0 loadHandler:v43];
  }
  id v28 = v6;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = v5;
  id v9 = [obj countByEnumeratingWithState:&v39 objects:v46 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v40;
    double v12 = UTTypeImage;
    uint64_t v30 = *(void *)v40;
    do
    {
      double v13 = 0;
      id v31 = v10;
      do
      {
        if (*(void *)v40 != v11) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v39 + 1) + 8 * (void)v13);
        double v15 = [(UTType *)v12 identifier];
        unsigned __int8 v16 = [v14 hasItemConformingToTypeIdentifier:v15];

        if ((v16 & 1) == 0)
        {
          double v33 = v13;
          long long v37 = 0u;
          long long v38 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          unsigned int v17 = [v14 registeredTypeIdentifiers];
          id v18 = [v17 countByEnumeratingWithState:&v35 objects:v45 count:16];
          if (v18)
          {
            id v19 = v18;
            uint64_t v20 = *(void *)v36;
            do
            {
              for (i = 0; i != v19; i = (char *)i + 1)
              {
                if (*(void *)v36 != v20) {
                  objc_enumerationMutation(v17);
                }
                CGFloat v22 = *(void **)(*((void *)&v35 + 1) + 8 * i);
                id v23 = [UTTypeURL identifier];
                LODWORD(v22) = [v22 isEqualToString:v23];

                if (v22)
                {
                  CGRect v24 = [UTTypeURL identifier];
                  v34[0] = _NSConcreteStackBlock;
                  v34[1] = 3221225472;
                  void v34[2] = sub_2E008;
                  v34[3] = &unk_1DB5E8;
                  v34[4] = v14;
                  [v7 registerDataRepresentationForTypeIdentifier:v24 visibility:0 loadHandler:v34];
                }
              }
              id v19 = [v17 countByEnumeratingWithState:&v35 objects:v45 count:16];
            }
            while (v19);
          }

          double v12 = UTTypeImage;
          uint64_t v11 = v30;
          id v10 = v31;
          double v13 = v33;
        }
        double v13 = (char *)v13 + 1;
      }
      while (v13 != v10);
      id v10 = [obj countByEnumeratingWithState:&v39 objects:v46 count:16];
    }
    while (v10);
  }

  id v25 = [v7 registeredTypeIdentifiers];
  id v26 = [v25 count];

  if (v26) {
    [v29 addObject:v7];
  }

  return v29;
}

- (BOOL)shouldShowExpandedContentForURL:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = [a3 bc_pathWithoutPrecedingSlash];
  id v5 = [v4 stringByRemovingURLFragment];
  id v6 = [(BKContentViewController *)self book];
  id v7 = [v6 documentAtPath:v5];

  id v8 = [v7 documentOrdinal];
  if ([v8 integerValue] == (id)-1)
  {
    unsigned __int8 v10 = 1;
  }
  else
  {
    id v9 = [v7 nonlinearElement];
    unsigned __int8 v10 = [v9 BOOLValue];
  }
  return v10;
}

- (void)_smilElementIDSelected:(id)a3 inHREF:(id)a4
{
  id v6 = a3;
  id v27 = a4;
  id v25 = self;
  id v7 = [(BKContentViewController *)self document];
  id v8 = [v7 mediaOverlayElements];

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v29;
LABEL_3:
    uint64_t v12 = 0;
    id v26 = v10;
    while (1)
    {
      if (*(void *)v29 != v11) {
        objc_enumerationMutation(v9);
      }
      double v13 = *(void **)(*((void *)&v28 + 1) + 8 * v12);
      id v14 = [v13 elementId];
      if ([v14 isEqualToString:v6])
      {
        [v13 documentHref];
        uint64_t v15 = v11;
        id v16 = v6;
        v18 = id v17 = v9;
        id v19 = [v18 lastPathComponent];
        uint64_t v20 = [v27 lastPathComponent];
        unsigned __int8 v21 = [v19 isEqualToString:v20];

        id v9 = v17;
        id v6 = v16;
        uint64_t v11 = v15;
        id v10 = v26;

        if (v21)
        {
          id v10 = v13;

          if (v10)
          {
            id v23 = [(BKContentViewController *)v25 delegate];
            char v24 = objc_opt_respondsToSelector();

            if (v24)
            {
              CGFloat v22 = [(BKContentViewController *)v25 delegate];
              [v22 contentView:v25 didSelectMediaOverlayElement:v10];
              goto LABEL_16;
            }
          }
          goto LABEL_17;
        }
      }
      else
      {
      }
      if (v10 == (id)++v12)
      {
        id v10 = [v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
        if (v10) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  CGFloat v22 = v9;
LABEL_16:

LABEL_17:
}

- (void)invokedSMILControlAction:(int)a3 withSMILTurnStyle:(int)a4
{
  uint64_t v15 = [(BKContentViewController *)self delegate];
  id v7 = [(BKContentViewController *)self book];
  unsigned int v8 = [v7 hasMediaOverlayElements];

  if (v8)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      goto LABEL_8;
    }
    if (a4 == 1)
    {
      uint64_t v9 = 1;
    }
    else
    {
      if (a4 != 2) {
        goto LABEL_8;
      }
      uint64_t v9 = 0;
    }
    [v15 contentViewController:self setTurnState:v9];
LABEL_8:
    char v10 = objc_opt_respondsToSelector();
    uint64_t v11 = v15;
    if ((v10 & 1) == 0) {
      goto LABEL_20;
    }
    switch(a3)
    {
      case 1:
        BOOL v12 = 1;
        break;
      case 3:
        char v13 = objc_opt_respondsToSelector();
        uint64_t v11 = v15;
        if (v13)
        {
          unsigned int v14 = [v15 contentViewControllerReadAloudState];
          uint64_t v11 = v15;
          if ((v14 & 0x80000000) != 0) {
            goto LABEL_20;
          }
        }
        else
        {
          unsigned int v14 = 0;
        }
        BOOL v12 = v14 == 0;
        break;
      case 2:
        BOOL v12 = 0;
        break;
      default:
        goto LABEL_20;
    }
    [v11 contentViewController:self setReadAloudState:v12];
  }
LABEL_20:

  _objc_release_x2();
}

- (void)webViewDidEnterFullscreen:(id)a3
{
  id v4 = [(BKContentViewController *)self delegate];
  BUProtocolCast();
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_opt_respondsToSelector()) {
    [v5 contentViewControllerDidEnterFullscreen:self];
  }
}

- (void)webViewDidExitFullscreen:(id)a3
{
  id v4 = [(BKContentViewController *)self delegate];
  BUProtocolCast();
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_opt_respondsToSelector()) {
    [v5 contentViewControllerDidExitFullscreen:self];
  }
}

- (void)webViewFullscreenMayReturnToInline:(id)a3
{
  id v4 = [(BKContentViewController *)self delegate];
  BUProtocolCast();
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_opt_respondsToSelector()) {
    [v5 contentViewControllerWillExitFullscreen:self];
  }
}

- (id)webView2
{
  return self->_webView2;
}

- (BEKindOfWebView)webView
{
  return (BEKindOfWebView *)self->_webView2;
}

- (UIScrollView)contentScrollView
{
  id v2 = [(BKHTMLContentViewController *)self webView];
  BOOL v3 = [v2 scrollView];

  return (UIScrollView *)v3;
}

- (void)setLoader:(id)a3
{
  id v5 = (BKWK2WebViewLoader *)a3;
  if (self->_loader != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_loader, a3);
    [(BKWK2WebViewLoader *)self->_loader setDelegate:self];
    id v5 = v6;
  }
}

- (void)webViewLoader:(id)a3 didUpdateCurrentVisibleCFILocation:(id)a4
{
  id v6 = a4;
  [(BKHTMLContentViewController *)self _updateReadingStateVisibilityPossible:1 knownDOMRange:0];
  id v5 = [(BKContentViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 contentViewController:self didUpdateCurrentVisibleCFILocation:v6];
  }
}

- (void)highlightMediaOverlayElement:(id)a3
{
  id v6 = a3;
  if ([(BKContentViewController *)self isContentLoaded])
  {
    id v4 = [(BKHTMLContentViewController *)self readAloudEventHandler];
    id v5 = [v6 elementId];
    [v4 addhighlightForElementID:v5];
  }
}

- (void)clearMediaOverlayElement:(id)a3
{
  id v6 = a3;
  if ([(BKContentViewController *)self isContentLoaded])
  {
    id v4 = [(BKHTMLContentViewController *)self readAloudEventHandler];
    id v5 = [v6 elementId];
    [v4 removeHighlightForElementID:v5];
  }
}

- (id)pathForSoundtrack
{
  if ([(BKContentViewController *)self isContentLoaded])
  {
    BOOL v3 = [(BKHTMLContentViewController *)self mediaSource];
    if ([v3 length])
    {
      id v4 = [(BKContentViewController *)self document];
      id v5 = [v4 href];
      id v6 = [v5 pathComponents];

      id v7 = [v6 subarrayWithRange:0, [v6 count] - 1];
      unsigned int v8 = +[NSString pathWithComponents:v7];

      uint64_t v9 = [v8 stringByAppendingPathComponent:v3];
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (void)_refreshContentBasedOverlay
{
  [(BKHTMLContentViewController *)self setContentBasedOverlayRefreshScheduled:0];

  [(BKHTMLContentViewController *)self _refreshAnnotationsAndSearchResult];
}

- (void)_refreshContentBasedOverlayAfterDelay
{
  BOOL v3 = [(BKHTMLContentViewController *)self performSelectorProxy];
  +[NSObject cancelPreviousPerformRequestsWithTarget:v3 selector:"_refreshContentBasedOverlay" object:0];

  id v4 = [(BKHTMLContentViewController *)self performSelectorProxy];
  [v4 performSelector:"_refreshContentBasedOverlay" withObject:0 afterDelay:0.1];
}

- (id)predicateForOverlayCache
{
  id v2 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: %s", @"Do not call method", "-[BKHTMLContentViewController predicateForOverlayCache]");
  id v3 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v2 userInfo:0];

  objc_exception_throw(v3);
}

- (void)_setupAnnotationRectCachesFromClientRects:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  [(BKHTMLContentViewController *)self setAnnotationRectUnionCache:v5];

  id v6 = [v4 mutableCopy];
  if (v6)
  {
    [(BKHTMLContentViewController *)self setAnnotationRectsCache:v6];
  }
  else
  {
    id v7 = objc_alloc_init((Class)NSMutableDictionary);
    [(BKHTMLContentViewController *)self setAnnotationRectsCache:v7];
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  unsigned int v8 = [v4 allKeys];
  id v9 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v25;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        unsigned int v14 = [v4 objectForKeyedSubscript:v13];
        if ([v14 count])
        {
          v23[0] = BKUnionRects(v14);
          v23[1] = v15;
          v23[2] = v16;
          v23[3] = v17;
          id v18 = +[NSValue valueWithBytes:v23 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
          id v19 = [(BKHTMLContentViewController *)self annotationRectUnionCache];
          [v19 setObject:v18 forKeyedSubscript:v13];
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v10);
  }

  webView2 = self->_webView2;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_2EDD0;
  v22[3] = &unk_1DAB88;
  v22[4] = self;
  [(WKWebView *)webView2 _doAfterNextPresentationUpdate:v22];
  unsigned __int8 v21 = [(BKContentViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v21 contentViewControllerAnnotationCacheDidChange:self];
  }
}

- (void)_fetchMissingCfiLocationRects:(id)a3 forAnnotations:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v20 = v5;
  id v7 = [v5 allKeys];
  unsigned __int8 v21 = +[NSMutableArray array];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v26;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(v8);
        }
        BOOL v12 = [*(id *)(*((void *)&v25 + 1) + 8 * i) location];
        objc_opt_class();
        uint64_t v13 = BUDynamicCast();
        unsigned int v14 = v13;
        if (v13
          && ([v13 cfiString],
              uint64_t v15 = objc_claimAutoreleasedReturnValue(),
              unsigned __int8 v16 = [v7 containsObject:v15],
              v15,
              (v16 & 1) == 0))
        {
          [v21 addObject:v14];
        }
        else
        {
          uint64_t v17 = _AEAnnotationLocationLog();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            long long v30 = v14;
            _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "#annotationcache skipping calculation of rect for cfiLocation:%{public}@", buf, 0xCu);
          }
        }
      }
      id v9 = [v8 countByEnumeratingWithState:&v25 objects:v31 count:16];
    }
    while (v9);
  }

  if ([v21 count])
  {
    objc_initWeak((id *)buf, self);
    id v18 = [(BKHTMLContentViewController *)self loader];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_2F0D4;
    v22[3] = &unk_1DB610;
    objc_copyWeak(&v24, (id *)buf);
    id v23 = v20;
    [v18 clientRectsForLocations:v21 completion:v22];

    objc_destroyWeak(&v24);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    [(BKHTMLContentViewController *)self _setupAnnotationRectCachesFromClientRects:v20];
  }
}

- (void)prepareContentBasedOverlayCache
{
  [(BKHTMLContentViewController *)self startFetchingAnnotations];
  [(BKHTMLContentViewController *)self setContentBasedOverlayRefreshScheduled:1];
  id v3 = [(NSFetchedResultsController *)self->_highlightsFRC fetchedObjects];
  id v4 = [(BKHTMLContentViewController *)self predicateForOverlayCache];
  id v5 = [v3 filteredArrayUsingPredicate:v4];

  id v6 = _AEAnnotationLocationLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v5 valueForKey:@"annotationUuid"];
    int v14 = 138543362;
    uint64_t v15 = v7;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Preparing overlay cache for annotations:%{public}@", (uint8_t *)&v14, 0xCu);
  }
  id v8 = objc_alloc_init((Class)NSDictionary);
  id v9 = [(BKContentViewController *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    uint64_t v11 = [(BKContentViewController *)self delegate];
    uint64_t v12 = [v11 contentViewController:self locationRectsForAnnotations:v5];

    id v8 = (id)v12;
  }
  id v13 = [v8 count];
  if (v13 == [v5 count]) {
    [(BKHTMLContentViewController *)self _setupAnnotationRectCachesFromClientRects:v8];
  }
  else {
    [(BKHTMLContentViewController *)self _fetchMissingCfiLocationRects:v8 forAnnotations:v5];
  }
}

- (void)invalidateContentBasedOverlayCache
{
  id v3 = _AEAnnotationLocationLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Invalidating overlay cache.", v4, 2u);
  }

  [(BKHTMLContentViewController *)self setAnnotationRectUnionCache:0];
  [(BKHTMLContentViewController *)self setAnnotationRectsCache:0];
}

- (void)invalidateContentBasedOverlay
{
  id v3 = _AEAnnotationLocationLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Invalidating Overlay Views. Refreshing.", v9, 2u);
  }

  [(BKHTMLContentViewController *)self setHighlightViews:0];
  id v4 = [(BKHTMLContentViewController *)self theme];
  if ([v4 shouldInvertContent])
  {
    id v5 = [(BKContentViewController *)self configuration];
    -[AEHighlightRenderingController setDrawSpecialGrayHighlights:](self->_highlightRenderingController, "setDrawSpecialGrayHighlights:", [v5 isScroll] ^ 1);
  }
  else
  {
    [(AEHighlightRenderingController *)self->_highlightRenderingController setDrawSpecialGrayHighlights:0];
  }

  uint64_t v6 = [(BKHTMLContentViewController *)self annotationRectUnionCache];
  if (v6)
  {
    id v7 = (void *)v6;
    unsigned __int8 v8 = [(BKHTMLContentViewController *)self contentBasedOverlayRefreshScheduled];

    if ((v8 & 1) == 0) {
      [(BKHTMLContentViewController *)self _refreshAnnotationsAndSearchResult];
    }
  }
}

- (void)updateReadingStatisticsForScroll
{
}

- (id)annotations
{
  return [(NSFetchedResultsController *)self->_highlightsFRC fetchedObjects];
}

- (void)startFetchingAnnotations
{
  if (!self->_highlightsFRC)
  {
    id v3 = [(BKContentViewController *)self book];
    if (!v3) {
      BCReportAssertionFailureWithMessage();
    }
    id v4 = [v3 annotationProvider];
    id v5 = [v4 uiManagedObjectContext];

    if (!v5) {
      BCReportAssertionFailureWithMessage();
    }
    id v6 = objc_alloc_init((Class)NSFetchRequest);
    id v7 = [v3 assetID];
    unsigned __int8 v8 = [(BKContentViewController *)self document];
    id v9 = [v8 documentOrdinal];
    char v10 = +[AEAnnotation predicateForAnnotationsWithAssetID:ordinal:](AEAnnotation, "predicateForAnnotationsWithAssetID:ordinal:", v7, [v9 intValue]);
    [v6 setPredicate:v10];

    uint64_t v11 = +[NSEntityDescription entityForName:@"AEAnnotation" inManagedObjectContext:v5];
    [v6 setEntity:v11];

    id v12 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"annotationCreationDate" ascending:1];
    id v13 = [objc_alloc((Class)NSArray) initWithObjects:v12, 0];
    [v6 setSortDescriptors:v13];

    int v14 = (NSFetchedResultsController *)[objc_alloc((Class)IMUbiquitousFetchedResultsController) initWithFetchRequest:v6 managedObjectContext:v5 sectionNameKeyPath:0 cacheName:0];
    highlightsFRC = self->_highlightsFRC;
    self->_highlightsFRC = v14;

    [(NSFetchedResultsController *)self->_highlightsFRC setDelegate:self];
    unsigned __int8 v16 = self->_highlightsFRC;
    id v25 = 0;
    LOBYTE(v13) = [(NSFetchedResultsController *)v16 performFetch:&v25];
    id v17 = v25;
    if ((v13 & 1) == 0)
    {
      id v18 = BCIMLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_13746C((uint64_t)v17, v18, v19, v20, v21, v22, v23, v24);
      }
    }
  }
}

- (void)controllerWillChangeContent:(id)a3
{
  id v4 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  changedAnnotations = self->_changedAnnotations;
  self->_changedAnnotations = v4;

  _objc_release_x1(v4, changedAnnotations);
}

- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7
{
  id v12 = (NSFetchedResultsController *)a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  if (self->_highlightsFRC == v12)
  {
    id v16 = v13;
    id v17 = v16;
    if (a6 - 3 < 2)
    {
      changedAnnotations = self->_changedAnnotations;
      uint64_t v22 = [v16 annotationUuid];
      [(NSMutableDictionary *)changedAnnotations setObject:v17 forKey:v22];
    }
    else if (a6 == 2)
    {
      uint64_t v23 = [v16 annotationUuid];

      if (v23) {
        [(BKHTMLContentViewController *)self removeHighlightForAnnotation:v17];
      }
    }
    else if (a6 == 1)
    {
      if ([v16 annotationType] == 2)
      {
        id v18 = _AEAnnotationLocationLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v19 = [v17 annotationUuid];
          *(_DWORD *)buf = 138412290;
          uint64_t v34 = v19;
          _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "controller didInsert range annotation: %@.  Highlighting...", buf, 0xCu);
        }
        [(BKHTMLContentViewController *)self removeDummyHighlight];
        uint64_t v20 = +[NSArray arrayWithObject:v17];
        [(BKHTMLContentViewController *)self highlightAnnotations:v20];
      }
      else if ([v17 annotationType] == 1)
      {
        uint64_t v24 = _AEAnnotationLocationLog();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          id v25 = [v17 annotationUuid];
          *(_DWORD *)buf = 138412290;
          uint64_t v34 = v25;
          _os_log_impl(&dword_0, v24, OS_LOG_TYPE_DEFAULT, "controller didInsert point annotation: %@", buf, 0xCu);
        }
        objc_initWeak((id *)buf, self);
        objc_opt_class();
        long long v26 = [v17 location];
        long long v27 = BUDynamicCast();

        if (v27 && [(BKHTMLContentViewController *)self isLocationFromThisDocument:v27])
        {
          long long v28 = [(BKHTMLContentViewController *)self loader];
          v29[0] = _NSConcreteStackBlock;
          v29[1] = 3221225472;
          v29[2] = sub_2FB14;
          v29[3] = &unk_1DB638;
          objc_copyWeak(&v32, (id *)buf);
          id v30 = v17;
          long long v31 = self;
          [v28 clientRectsForLocation:v27 completion:v29];

          objc_destroyWeak(&v32);
        }

        objc_destroyWeak((id *)buf);
      }
    }
  }
}

- (void)controllerDidChangeContent:(id)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(NSMutableDictionary *)self->_changedAnnotations allValues];
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      unsigned __int8 v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        [(BKHTMLContentViewController *)self _annotationChanged:*(void *)(*((void *)&v11 + 1) + 8 * (void)v8) forceRender:1];
        unsigned __int8 v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  changedAnnotations = self->_changedAnnotations;
  self->_changedAnnotations = 0;

  char v10 = [(BKContentViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v10 contentViewControllerAnnotationsDidChange:self];
  }
}

- (id)_excerptCitedStringForAnnotation:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)AEAssetActivityItemProvider);
  id v6 = [(BKContentViewController *)self book];
  uint64_t v7 = +[BKBookViewController propertySourceFromBook:v6];
  id v8 = [v5 initWithAnnotation:v4 propertySource:v7];

  [v8 setShareType:0];
  [v8 setCitationsAllowed:[self canCopyContent]];
  uint64_t v9 = [v8 pasteboardString];
  if (v9) {
    char v10 = (__CFString *)v9;
  }
  else {
    char v10 = &stru_1DF0D8;
  }

  return v10;
}

- (id)bookTitle
{
  id v2 = [(BKContentViewController *)self book];
  id v3 = [v2 bookTitle];

  return v3;
}

- (id)author
{
  id v2 = [(BKContentViewController *)self book];
  id v3 = [v2 bookAuthor];

  return v3;
}

- (id)storeURL
{
  id v2 = [(BKContentViewController *)self book];
  id v3 = [v2 storeId];

  if ([v3 length])
  {
    id v4 = +[AEUserPublishing sharedInstance];
    id v5 = [v4 storeShortURLForStoreId:v3 dataSource:0];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)pageNumberStringForAnnotation:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    id v5 = [v4 physicalPageNumber];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = [(BKHTMLContentViewController *)self annotationDataProvider];
      if (v6
        && (objc_opt_respondsToSelector() & 1) != 0
        && (uint64_t v7 = (char *)objc_msgSend(v6, "pageNumberForOrdinal:", -[BKContentViewController ordinal](self, "ordinal")),
            v7 != (char *)0x7FFFFFFFFFFFFFFFLL))
      {
        uint64_t v9 = +[NSNumber numberWithInteger:&v7[[(BKContentViewController *)self pageOffset]]];
        id v5 = +[NSString stringWithFormat:@"%@", v9];
      }
      else
      {
        id v5 = 0;
      }
    }
    else
    {
      id v5 = 0;
    }
  }

  return v5;
}

- (id)stylesheetSet
{
  return 0;
}

- (CGPoint)_originPointForPoint:(CGPoint)a3
{
  -[WKWebView _convertPointFromContentsToView:](self->_webView2, "_convertPointFromContentsToView:", a3.x, a3.y);
  double v5 = v4;
  double v7 = v6;
  webView2 = self->_webView2;
  uint64_t v9 = [(BKHTMLContentViewController *)self view];
  -[WKWebView convertPoint:toView:](webView2, "convertPoint:toView:", v9, v5, v7);
  double v11 = v10;
  double v13 = v12;

  double v14 = v11;
  double v15 = v13;
  result.double y = v15;
  result.double x = v14;
  return result;
}

- (void)registerScriptMessageHandlersWithUserContentController:(id)a3
{
  id v4 = a3;
  [v4 be_addScriptMessageHandler:self name:@"showAside"];
  [v4 be_addScriptMessageHandler:self name:@"toggleBookmark"];
  [v4 be_addScriptMessageHandler:self name:@"toggleControlsVisibility"];
  [v4 be_addScriptMessageHandler:self name:@"showHighlightMenu"];
  [v4 be_addScriptMessageHandler:self name:@"turnPage"];
  [v4 be_addScriptMessageHandler:self name:@"checkOperation"];
  [v4 be_addScriptMessageHandler:self name:@"performOperation"];
  id v5 = [(BKHTMLContentViewController *)self readAloudEventHandler];
  [v4 be_addScriptMessageHandler:v5 name:@"readAloudHandler"];
}

- (void)afterEnsuringFirstPaintPerform:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_firstSignificantPaintCompleted)
  {
    webView2 = self->_webView2;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_30484;
    v11[3] = &unk_1DADC0;
    id v12 = v4;
    [(WKWebView *)webView2 _doAfterNextStablePresentationUpdate:v11];
  }
  else
  {
    if (self->_locationEnsuredFirstPaintWorkBlock)
    {
      double v7 = _AESwipeLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)double v10 = 0;
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Firing after first paint block early (cancelled) because another is being scheduled", v10, 2u);
      }

      id v8 = objc_retainBlock(self->_locationEnsuredFirstPaintWorkBlock);
      uint64_t v9 = v8;
      if (v8) {
        (*((void (**)(id, uint64_t))v8 + 2))(v8, 1);
      }
    }
    [(BKHTMLContentViewController *)self setLocationEnsuredFirstPaintWorkBlock:v5];
  }
}

- (id)tempOwnerID
{
  return self->_tempOwnerID;
}

- (void)setTempOwnerID:(id)a3
{
}

- (void)setHighlightRenderingController:(id)a3
{
}

- (BKWebViewProxy)webViewProxy
{
  return self->_webViewProxy;
}

- (void)setWebViewProxy:(id)a3
{
}

- (BKWK2WebViewLoader)loader
{
  return self->_loader;
}

- (BOOL)supportsExpandedContent
{
  return self->_supportsExpandedContent;
}

- (void)setSupportsExpandedContent:(BOOL)a3
{
  self->_supportsExpandedContent = a3;
}

- (BKAnnotationDataProvider)annotationDataProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_annotationDataProvider);

  return (BKAnnotationDataProvider *)WeakRetained;
}

- (void)setAnnotationDataProvider:(id)a3
{
}

- (NSMutableDictionary)annotationRectUnionCache
{
  return self->_annotationRectUnionCache;
}

- (void)setAnnotationRectUnionCache:(id)a3
{
}

- (NSMutableDictionary)annotationRectsCache
{
  return self->_annotationRectsCache;
}

- (void)setAnnotationRectsCache:(id)a3
{
}

- (BOOL)contentBasedOverlayRefreshScheduled
{
  return self->_contentBasedOverlayRefreshScheduled;
}

- (void)setContentBasedOverlayRefreshScheduled:(BOOL)a3
{
  self->_contentBasedOverlayRefreshScheduled = a3;
}

- (UILongPressGestureRecognizer)indirectImmediateHighlightRecognizer
{
  return self->_indirectImmediateHighlightRecognizer;
}

- (void)setIndirectImmediateHighlightRecognizer:(id)a3
{
}

- (UIGestureRecognizer)indirectHighlightRecognizer
{
  return self->_indirectHighlightRecognizer;
}

- (void)setIndirectHighlightRecognizer:(id)a3
{
}

- (BKActivityIndicatorOverlayView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
}

- (NSString)mediaSource
{
  return self->_mediaSource;
}

- (void)setMediaSource:(id)a3
{
}

- (void)setReadAloudEventHandler:(id)a3
{
}

- (NSString)visibleCFIString
{
  return self->_visibleCFIString;
}

- (void)setVisibleCFIString:(id)a3
{
}

- (NSDictionary)currentHighlightSearchSelection
{
  return self->_currentHighlightSearchSelection;
}

- (void)setCurrentHighlightSearchSelection:(id)a3
{
}

- (BOOL)firstSignificantPaintCompleted
{
  return self->_firstSignificantPaintCompleted;
}

- (void)setFirstSignificantPaintCompleted:(BOOL)a3
{
  self->_firstSignificantPaintCompleted = a3;
}

- (id)locationEnsuredFirstPaintWorkBlock
{
  return self->_locationEnsuredFirstPaintWorkBlock;
}

- (void)setLocationEnsuredFirstPaintWorkBlock:(id)a3
{
}

- (BOOL)haveDeterminedInitialModifiers
{
  return self->_haveDeterminedInitialModifiers;
}

- (void)setHaveDeterminedInitialModifiers:(BOOL)a3
{
  self->_haveDeterminedInitialModifiers = a3;
}

- (int64_t)initialTextInteractionModifiers
{
  return self->_initialTextInteractionModifiers;
}

- (void)setInitialTextInteractionModifiers:(int64_t)a3
{
  self->_initialTextInteractionModifiers = a3;
}

- (unint64_t)loadFailureCount
{
  return self->_loadFailureCount;
}

- (void)setLoadFailureCount:(unint64_t)a3
{
  self->_loadFailureCount = a3;
}

- (CGPoint)overrideBuildMenuLocation
{
  double x = self->_overrideBuildMenuLocation.x;
  double y = self->_overrideBuildMenuLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setOverrideBuildMenuLocation:(CGPoint)a3
{
  self->_overrideBuildMenuLocation = a3;
}

- (CGRect)rectForPresentedMenuForTextInteraction
{
  double x = self->_rectForPresentedMenuForTextInteraction.origin.x;
  double y = self->_rectForPresentedMenuForTextInteraction.origin.y;
  double width = self->_rectForPresentedMenuForTextInteraction.size.width;
  double height = self->_rectForPresentedMenuForTextInteraction.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setRectForPresentedMenuForTextInteraction:(CGRect)a3
{
  self->_rectForPresentedMenuForTextInteraction = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_locationEnsuredFirstPaintWorkBlock, 0);
  objc_storeStrong((id *)&self->_currentHighlightSearchSelection, 0);
  objc_storeStrong((id *)&self->_visibleCFIString, 0);
  objc_storeStrong((id *)&self->_readAloudEventHandler, 0);
  objc_storeStrong((id *)&self->_mediaSource, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_indirectHighlightRecognizer, 0);
  objc_storeStrong((id *)&self->_indirectImmediateHighlightRecognizer, 0);
  objc_storeStrong((id *)&self->_annotationRectsCache, 0);
  objc_storeStrong((id *)&self->_annotationRectUnionCache, 0);
  objc_destroyWeak((id *)&self->_annotationDataProvider);
  objc_storeStrong((id *)&self->_loader, 0);
  objc_storeStrong((id *)&self->_webViewProxy, 0);
  objc_storeStrong((id *)&self->_highlightRenderingController, 0);
  objc_storeStrong((id *)&self->_performSelectorProxy, 0);
  objc_storeStrong((id *)&self->_highlightDummyAnnotation, 0);
  objc_storeStrong((id *)&self->_highlightTimer, 0);
  objc_storeStrong((id *)&self->_highlightLastPos, 0);
  objc_storeStrong((id *)&self->_highlightWordEnd, 0);
  objc_storeStrong((id *)&self->_highlightWordStart, 0);
  objc_storeStrong((id *)&self->_highlightsFRC, 0);
  objc_storeStrong(&self->_tempOwnerID, 0);
  objc_storeStrong((id *)&self->_doubleTapGesture, 0);
  objc_storeStrong((id *)&self->_tapGesture, 0);
  objc_storeStrong((id *)&self->_changedAnnotations, 0);
  objc_storeStrong((id *)&self->_lineImageCache, 0);
  objc_storeStrong((id *)&self->_fadeView, 0);

  objc_storeStrong((id *)&self->_webView2, 0);
}

- (id)_accessibilityQuickSpeakContent
{
  return [(BKHTMLContentViewController *)self selectedTextForAccessibility];
}

- (BOOL)_accessibilityQuickSpeakContentIsSpeakable
{
  id v2 = [(BKHTMLContentViewController *)self _accessibilityQuickSpeakContent];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

@end