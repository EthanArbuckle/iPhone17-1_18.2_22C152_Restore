@interface THDocumentViewController
- (BCDisplaySleepController)displaySleepController;
- (BKScrubberCalloutView)scrubberCallout;
- (BKScrubberControl)scrubber;
- (BOOL)allowCopy;
- (BOOL)allowHighlighting;
- (BOOL)allowPortraitTOC;
- (BOOL)allowTouchOutsideCanvasView:(id)a3 forGesture:(id)a4;
- (BOOL)allowsDescendersToClipForSectionController:(id)a3;
- (BOOL)bookmarksShouldBeVisible;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canCopy;
- (BOOL)canGoToNextPage;
- (BOOL)canGoToPreviousPage;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)canvasViewController:(id)a3 enableSwipeGestureWithNumberOfTouches:(unint64_t)a4;
- (BOOL)deferCanvasLayoutToAfterRotationHasCompleted;
- (BOOL)disableRotationEdgeClip;
- (BOOL)displaySinglePageChapterSeparately:(id)a3;
- (BOOL)documentNavigatorIsOnActiveCanvas:(id)a3;
- (BOOL)editorAllowsCaret;
- (BOOL)editorAllowsHyperlinkInteraction;
- (BOOL)editorAllowsMagnifier;
- (BOOL)firstLoad;
- (BOOL)flowPageController:(id)a3 isEdgeObscured:(unsigned int)a4;
- (BOOL)followAnchor:(id)a3 pulse:(BOOL)a4;
- (BOOL)followLink:(id)a3;
- (BOOL)followLink:(id)a3 animated:(BOOL)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)im_isRTL;
- (BOOL)inFlowMode;
- (BOOL)inGuidedPan;
- (BOOL)inPaginatedMode;
- (BOOL)interactiveCanvasController:(id)a3 allowsDragOfSmartField:(id)a4;
- (BOOL)interactiveCanvasController:(id)a3 pointIsInLeftMargin:(CGPoint)a4;
- (BOOL)interactiveCanvasController:(id)a3 pointIsInRightMargin:(CGPoint)a4;
- (BOOL)interactiveCanvasController:(id)a3 shouldZoomToColumn:(id)a4 withFrame:(CGRect)a5 tapPoint:(CGPoint)a6;
- (BOOL)interactiveCanvasControllerShouldAllowZoomToColumn:(id)a3;
- (BOOL)interactiveCanvasControllerShouldDeferViewCreation:(id)a3;
- (BOOL)interactiveCanvasControllerShouldIgnoreOverscroll:(id)a3;
- (BOOL)interactiveCanvasControllerShouldPageLeftOnMarginTap:(id)a3;
- (BOOL)interactiveCanvasControllerShouldPageRightOnMarginTap:(id)a3;
- (BOOL)interactiveCanvasControllerShouldUseGuidedPan:(id)a3 withMovementDirection:(CGPoint)a4;
- (BOOL)isEpub;
- (BOOL)isFreeTransformInProgress;
- (BOOL)isGlossaryVisible;
- (BOOL)isLastPageInChapterForRelativePageIndex:(unint64_t)a3 chapterIndex:(unint64_t)a4;
- (BOOL)isNotesFullscreenVisible;
- (BOOL)isPageBookmarked;
- (BOOL)isRevealingTOC;
- (BOOL)isRotating;
- (BOOL)isScrubberDisabled;
- (BOOL)isScrubbing;
- (BOOL)isSinglePageChapterForChapterIndex:(unint64_t)a3;
- (BOOL)isTransitioning;
- (BOOL)isTwoUp;
- (BOOL)isUpdatingVisibleViewController;
- (BOOL)justUpdatedPresentationType;
- (BOOL)minimizeLayoutPadding;
- (BOOL)p_allowsPageDisplacement;
- (BOOL)p_allowsPinchZoom;
- (BOOL)p_canOverscroll;
- (BOOL)p_isCompactFlowPresentation;
- (BOOL)p_isCompactFlowPresentationForSectionController:(id)a3;
- (BOOL)p_isPageLocationApplicable;
- (BOOL)p_isSinglePageChapter;
- (BOOL)p_updateScrollViewClipsToBounds;
- (BOOL)performanceModeBookOpening;
- (BOOL)pointIsInLeftMargin:(CGPoint)a3 fromView:(id)a4;
- (BOOL)pointIsInRightMargin:(CGPoint)a3 fromView:(id)a4;
- (BOOL)popoverController:(id)a3 shouldIgnorePassThroughGestureRecognizer:(id)a4;
- (BOOL)prefersHomeIndicatorAutoHidden;
- (BOOL)preserveScrollViewClipping;
- (BOOL)preventVisibleInfoUpdates;
- (BOOL)repIsPresentedExpanded:(id)a3;
- (BOOL)scrubberCalloutFollowsScrollerThumb;
- (BOOL)scrubberCalloutVisible;
- (BOOL)shouldAdjustContentFrameWhileRotating;
- (BOOL)shouldAutorotate;
- (BOOL)shouldEnableInspectorButton;
- (BOOL)shouldPagingBeEnabled;
- (BOOL)shouldScaleFlowLayoutsForSectionController:(id)a3;
- (BOOL)showFlowModeIfAvailable;
- (BOOL)showingExpandedWidgetView;
- (BOOL)suspendCanvasScroll;
- (BOOL)tappedCanvasBackgroundAtPoint:(CGPoint)a3;
- (BOOL)th_cachedIsCompactHeight;
- (BOOL)th_cachedIsCompactWidth;
- (BOOL)transitioningFromOneUpToTwoUp;
- (BOOL)transitioningFromTwoUpToOneUp;
- (BOOL)visibleInfoUpdatesAllowedInLandscape;
- (BOOL)widgetHostingAllowAutoplayForRep:(id)a3;
- (BOOL)widgetHostingAllowInteractionOnPageForRep:(id)a3;
- (BOOL)widgetHostingShouldAllowNaturalHorizontalScrollForRep:(id)a3;
- (BOOL)widgetLayoutIsCompact:(id)a3;
- (BOOL)willAdjustHeightForSnapshot;
- (BOOL)zoomOnSelectionChange:(id)a3;
- (CGPoint)beginDraggingContentOffset;
- (CGPoint)interactiveCanvasController:(id)a3 clampContentOffset:(CGPoint)a4 forViewScale:(double)a5;
- (CGPoint)lastScrollOffset;
- (CGRect)bookmarkHotspotRegionForPage:(id)a3;
- (CGRect)canvasPreviewFrameForDocumentManager;
- (CGRect)contentFrame;
- (CGRect)flowPageController:(id)a3 overrideForBodyFrame:(CGRect)a4;
- (CGRect)interactiveCanvasController:(id)a3 expandBoundsForHitTesting:(CGRect)a4;
- (CGRect)interactiveCanvasController:(id)a3 expandVisibleBoundsForClippingReps:(CGRect)a4;
- (CGRect)interactiveCanvasController:(id)a3 expandVisibleBoundsForTiling:(CGRect)a4;
- (CGRect)p_contentFrameFrameForSize:(CGSize)a3;
- (CGRect)pageViewProviderUnclippedVisibleBounds:(id)a3;
- (CGRect)previousContentFrame;
- (CGRect)rectForCompletionAnimationWithRep:(id)a3;
- (CGRect)rectForRelativePageIndex:(unint64_t)a3 chapterIndex:(unint64_t)a4;
- (CGRect)scrollViewClippingBoundsForInteractiveCanvasController:(id)a3;
- (CGRect)shadowBoundsForCanvasExitTransformDelegate:(id)a3;
- (CGRect)targetRelativeRectForPoint:(CGPoint)a3 atPageIndex:(unint64_t)a4 chapterIndex:(unint64_t)a5 waitForContentNodeLoad:(BOOL)a6;
- (CGRect)targetRelativeRectForRelativePoint:(CGPoint)a3 atPageIndex:(unint64_t)a4 chapterIndex:(unint64_t)a5 waitForContentNodeLoad:(BOOL)a6;
- (CGRect)visibleUnscaledRectBeforeRotation;
- (CGRect)widgetLayoutBounds;
- (CGSize)lastLayoutBoundsSize;
- (CGSize)lastLayoutSize;
- (CGSize)p_currentPageSize;
- (CGSize)p_currentSpreadSize;
- (CGSize)p_desiredCanvasSize;
- (CGSize)p_maxScrollViewSize;
- (CGSize)p_maxScrollViewSizeForViewSize:(CGSize)a3;
- (CGSize)p_windowOrViewSize;
- (CGSize)pageSizeForPagePositionController:(id)a3;
- (CGSize)pageSizeForPresentationType:(id)a3;
- (CGSize)paginatedPageSize;
- (CGSize)paginatedSpreadSize;
- (CGSize)previousTransitionSize;
- (CGSize)widgetHostExpandedSize;
- (CGSize)widgetStackMaxContainerSizeForSize:(CGSize)a3;
- (CGSize)windowMinSize;
- (Class)wpEditorClassOverride;
- (NSDate)lastPageNumberUpdate;
- (NSMutableDictionary)statusBarHeightForOrientation;
- (THBookNavigation)bookNavigationDelegate;
- (THBookPropertiesProvider)bookPropertiesDelegate;
- (THDocumentLinkResolver)documentLinkResolver;
- (THDocumentNavigator)documentNavigator;
- (THDocumentReflowableLayoutConfiguration)configuration;
- (THDocumentViewController)initWithDefaultView;
- (THGuidedPanController)guidedPanController;
- (THModelNavigableAnchor)orientationAnchor;
- (THModelStorageAnchor)lastStorageAnchor;
- (THOverscrollImageView)leftOverscrollView;
- (THOverscrollImageView)rightOverscrollView;
- (THPageNumberView)contentPageNumberView;
- (THPageNumberView)navOverlayPageNumberView;
- (THPageViewDisplacement)pageViewDisplacement;
- (THPageViewProvider)pageViewProvider;
- (THPaginationStatusDelegate)paginationDelegate;
- (THPresentationType)currentPresentationType;
- (THReadingStatisticsDelegate)readingStatisticsDelegate;
- (THReflowablePaginationController)reflowablePaginationController;
- (THRevealTOCDelegate)revealTOCDelegate;
- (THRevealTOCPanController)revealTOCPanController;
- (THSectionController)activeSectionController;
- (THSectionController)flowSectionController;
- (THSectionController)paginatedSectionController;
- (THSpinnerProvider)spinnerProvider;
- (THThemeDelegate)themeDelegate;
- (THToolbarDelegate)toolbarDelegate;
- (THUserAnnotationDelegate)userAnnotationDelegate;
- (THWAutoplayController)autoplayController;
- (THWExpandedViewController)expandedViewController;
- (THWFreeTransformController)ftc;
- (UIEdgeInsets)contentInsetsForPresentationType:(id)a3;
- (UIEdgeInsets)expandedViewControllerSafeAreaInsets:(id)a3;
- (UIView)bottomOverscrollView;
- (UIView)expandedWindowHostView;
- (UIView)navigationOverlayContainer;
- (UIView)overscrollTransitionView;
- (UIView)rootSuperview;
- (UIView)topOverscrollView;
- (_NSRange)currentRelativePageIndexRange;
- (_NSRange)visibleRelativePageRange;
- (double)bottomBarHeight;
- (double)currentViewScale;
- (double)fitHeightViewScale;
- (double)fitWidthViewScale;
- (double)fontSize;
- (double)gutterWidthForPresentationType:(id)a3;
- (double)interactiveCanvasController:(id)a3 adjustViewScale:(double)a4;
- (double)interactiveCanvasControllerPaddingForZoomToColumn:(id)a3;
- (double)nextCanvasViewScaleDetentForProposedViewScale:(double)a3 greater:(BOOL)a4;
- (double)p_horizontalOverscrollAnimationDuration;
- (double)p_pageMarginWidth;
- (double)p_verticalOverscrollAnimationDuration;
- (double)scrubberCalloutWidth;
- (double)statusBarHeight;
- (double)toolbarHeight;
- (double)topBarHeight;
- (double)viewFooterHeight;
- (double)viewHeaderHeight;
- (double)zoomedInViewScale;
- (double)zoomedOutViewScale;
- (id)actionForHyperlink:(id)a3 inRep:(id)a4 gesture:(id)a5;
- (id)activityItemProviderWithCachedAnnotation:(id)a3;
- (id)anchorFromLink:(id)a3;
- (id)backgroundColor;
- (id)backgroundColorForDragUIPlatter;
- (id)bookLinkResolver;
- (id)canvasDidZoomCompletion;
- (id)childViewControllerForHomeIndicatorAutoHidden;
- (id)childViewControllerForStatusBarHidden;
- (id)childViewControllerForStatusBarStyle;
- (id)contentNodeForPageIndex:(unint64_t)a3;
- (id)currentContentNode;
- (id)currentNavigationUnit;
- (id)curtainColorForFreeTransform;
- (id)expandableRepForInfo:(id)a3;
- (id)expandedViewController:(id)a3 actionForHyperlink:(id)a4 inRep:(id)a5 gesture:(id)a6;
- (id)foregroundTextColor;
- (id)hostCanvasLayer;
- (id)interactiveCanvasController:(id)a3 delegateConformingToProtocol:(id)a4 forLayout:(id)a5;
- (id)interactiveCanvasController:(id)a3 delegateConformingToProtocol:(id)a4 forRep:(id)a5;
- (id)interactiveCanvasController:(id)a3 infoForModel:(id)a4 withSelection:(id)a5;
- (id)layoutControllerForSectionController:(id)a3;
- (id)navigationUnitForChapterIndex:(unint64_t)a3;
- (id)p_canvasInfoForExpandedInfo:(id)a3 presentationType:(id)a4;
- (id)p_contentNodeForInfo:(id)a3 presentationType:(id)a4;
- (id)p_expandableInfoForInfo:(id)a3 forceLoad:(BOOL)a4;
- (id)p_expandedViewControllerForRep:(id)a3;
- (id)p_overscrollBarWithFrame:(CGRect)a3 chapterIndex:(unint64_t)a4 tocTile:(id)a5;
- (id)p_ownerInfoForPopUpInfo:(id)a3;
- (id)p_pressableRepGestureRecognizer;
- (id)panGuideForInteractiveCanvasController:(id)a3 withMovementDirection:(CGPoint)a4;
- (id)scrollableCanvasActivityItemProviderWithCachedAnnotation:(id)a3;
- (id)selectedSectionController;
- (id)titleOfCurrentNavigationUnit;
- (id)traitCollection;
- (id)transitionContentView;
- (int)compactFlowPresentationState;
- (int)p_activePagePaddingOptions;
- (int)pagePaddingOptions;
- (int)performanceMode;
- (int)widgetLayoutMode:(id)a3;
- (int64_t)columnCountForPresentationType:(id)a3;
- (int64_t)guidedPanPageIndexForLayout:(id)a3;
- (int64_t)interfaceOrientation;
- (int64_t)overrideUserInterfaceStyle;
- (int64_t)p_relativePageIndexForPageInfo:(id)a3;
- (int64_t)preferredStatusBarStyle;
- (int64_t)th_cachedInterfaceOrientation;
- (unint64_t)currentAbsolutePageIndex;
- (unint64_t)currentChapter;
- (unint64_t)currentLesson;
- (unint64_t)currentRelativePageIndex;
- (unint64_t)currentTOCLessonIndex;
- (unint64_t)flowSizeScale;
- (unint64_t)fontSizeForPresentationType:(id)a3;
- (unint64_t)lastAbsolutePageIndex;
- (unint64_t)pageViewProviderStartAbsolutePageIndex:(id)a3;
- (unint64_t)visiblePageCountForDocumentNavigator:(id)a3;
- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4;
- (void)_updateScrubberCalloutForPageNumber:(int64_t)a3;
- (void)_updateScrubberTheme:(id)a3;
- (void)addNote:(id)a3;
- (void)bookViewDidRotateTransitionToSize:(CGSize)a3;
- (void)bookViewDidTransitionToSize:(CGSize)a3;
- (void)bookViewWillAnimateRotationToSize:(CGSize)a3 duration:(double)a4;
- (void)bookViewWillRotateTransitionToSize:(CGSize)a3 duration:(double)a4;
- (void)bookViewWillTransitionToSize:(CGSize)a3;
- (void)books_addHighlight:(id)a3;
- (void)books_addNote:(id)a3;
- (void)books_chapterBackward:(id)a3;
- (void)books_chapterForward:(id)a3;
- (void)books_chapterLeft:(id)a3;
- (void)books_chapterRight:(id)a3;
- (void)books_disableContinuousScroll:(id)a3;
- (void)books_enableContinuousScroll:(id)a3;
- (void)books_pageBackward:(id)a3;
- (void)books_pageForward:(id)a3;
- (void)books_toggleContinuousScroll:(id)a3;
- (void)buildHoverControlRegionForInteraction:(id)a3 withBuilder:(id)a4;
- (void)changeAnnotationStyle:(id)a3;
- (void)changeFontSize:(unint64_t)a3;
- (void)closeDocument;
- (void)copy:(id)a3;
- (void)copySelection;
- (void)corruptBookAlert;
- (void)dealloc;
- (void)didReceiveMemoryWarning;
- (void)documentNavigator:(id)a3 didJumpToPageLocation:(id)a4;
- (void)documentNavigator:(id)a3 didJumpToStorageAnchor:(id)a4 withWillJumpReturn:(BOOL)a5;
- (void)documentNavigator:(id)a3 failedToFollowAnchor:(id)a4 pulse:(BOOL)a5;
- (void)documentNavigator:(id)a3 failedToFollowLink:(id)a4;
- (void)documentNavigator:(id)a3 scrollToAbsolutePageIndex:(unint64_t)a4 specificUnscaledCanvasRect:(CGRect)a5 animated:(BOOL)a6 willPulse:(BOOL)a7;
- (void)documentNavigator:(id)a3 willJumpToPageLocation:(id)a4;
- (void)documentNavigator:(id)a3 willNavigateToAbsolutePageIndex:(unint64_t)a4 inContentNode:(id)a5;
- (void)endRevealTOC;
- (void)ensureDocumentIsLoaded;
- (void)expandedViewController:(id)a3 activateProgressForRep:(id)a4;
- (void)expandedViewController:(id)a3 deactivateProgressForRep:(id)a4;
- (void)expandedViewController:(id)a3 handleHyperlinkWithURL:(id)a4;
- (void)expandedViewControllerDidDismiss:(id)a3;
- (void)expandedViewControllerDidPresent:(id)a3;
- (void)expandedViewControllerWantsDismiss:(id)a3;
- (void)expandedViewControllerWillBeginDismissing:(id)a3;
- (void)expandedViewControllerWillPresent:(id)a3;
- (void)flowPageControllerWillChangeContentHeight:(id)a3;
- (void)followAbsolutePageIndex:(unint64_t)a3;
- (void)freeTransformDidBeginWithRep:(id)a3 expandableRep:(id)a4;
- (void)freeTransformDidCancelWithRep:(id)a3 expandableRep:(id)a4;
- (void)freeTransformDidEndWithRep:(id)a3 expandableRep:(id)a4 completionBlock:(id)a5;
- (void)freeTransformPostAnimationDidCancelWithRep:(id)a3 expandableRep:(id)a4;
- (void)guidedPanDidEnd;
- (void)guidedPanWillAnimateFrom:(id)a3 to:(id)a4 duration:(double)a5;
- (void)guidedPanWillBegin;
- (void)hideNavigationHistory;
- (void)hidePageThumbnailsAnimated:(BOOL)a3 duration:(double)a4;
- (void)hideToolbarAnimated:(BOOL)a3;
- (void)interactiveCanvasController:(id)a3 activateProgressForRep:(id)a4;
- (void)interactiveCanvasController:(id)a3 didOverscrollBottom:(double)a4 state:(int)a5;
- (void)interactiveCanvasController:(id)a3 didOverscrollLeft:(double)a4 state:(int)a5;
- (void)interactiveCanvasController:(id)a3 didOverscrollRight:(double)a4 state:(int)a5;
- (void)interactiveCanvasController:(id)a3 didOverscrollTop:(double)a4 state:(int)a5;
- (void)interactiveCanvasController:(id)a3 didZoomToColumn:(id)a4 ofRep:(id)a5;
- (void)interactiveCanvasController:(id)a3 layoutRegistered:(id)a4;
- (void)interactiveCanvasController:(id)a3 progressDidChangeForRep:(id)a4 percent:(id)a5;
- (void)interactiveCanvasController:(id)a3 resetAttemptForRep:(id)a4;
- (void)interactiveCanvasController:(id)a3 scoreDidChangeForRep:(id)a4 score:(id)a5 total:(id)a6;
- (void)interactiveCanvasController:(id)a3 scrollViewWillBeginDragging:(id)a4;
- (void)interactiveCanvasController:(id)a3 wantsToPresentContextMenuAtCanvasPoint:(CGPoint)a4 forAnnotationUUID:(id)a5;
- (void)interactiveCanvasController:(id)a3 willAnimateScrollToVisibleUnscaledRect:(CGRect)a4;
- (void)interactiveCanvasController:(id)a3 willAnimateToViewScale:(double)a4 withDuration:(double)a5 unscaledContentOffset:(CGPoint)a6;
- (void)interactiveCanvasControllerDidEndScrollingAnimation:(id)a3 stillAnimating:(BOOL)a4;
- (void)interactiveCanvasControllerDidLayout:(id)a3;
- (void)interactiveCanvasControllerDidLayoutAndRenderOnBackgroundThread:(id)a3;
- (void)interactiveCanvasControllerDidScroll:(id)a3;
- (void)interactiveCanvasControllerDidStopScrolling:(id)a3;
- (void)interactiveCanvasControllerDidZoom:(id)a3;
- (void)interactiveCanvasControllerFreeTransformDidEnd:(id)a3;
- (void)interactiveCanvasControllerFreeTransformWillBegin:(id)a3;
- (void)interactiveCanvasControllerWasTapped:(id)a3;
- (void)interactiveCanvasControllerWillLayout:(id)a3;
- (void)interactiveCanvasControllerWillScroll:(id)a3;
- (void)interactiveCanvasControllerWillShowNoteEditor:(id)a3;
- (void)interactiveCanvasControllerWillZoom:(id)a3;
- (void)layoutScrubberCallout;
- (void)loadDocument;
- (void)navigationUnitDidChange:(id)a3;
- (void)p_activateProgressForRep:(id)a3;
- (void)p_adjustContentViewFrameForSize:(CGSize)a3;
- (void)p_animateHorizontalOverscrollToPageIndex:(unint64_t)a3 duration:(double)a4 animationCompletionBlock:(id)a5 layoutCompletionBlock:(id)a6;
- (void)p_animateToNextPage:(BOOL)a3;
- (void)p_buildContextTree;
- (void)p_canvasDidZoom;
- (void)p_cleanupAfterViewUnload;
- (void)p_clearCanvas;
- (void)p_deactivateProgressForRep:(id)a3;
- (void)p_didFinishTransitionWithSize:(CGSize)a3;
- (void)p_dismissActiveAnimated:(BOOL)a3;
- (void)p_ensureInNavigationUnitForContentNode:(id)a3;
- (void)p_ensureVisibleAbsolutePhysicalPageIndexFromFullscreen;
- (void)p_fadeOutOverscrollTransition;
- (void)p_fireCanvasDidZoomCompletion;
- (void)p_fixScrollViewToMatchCanvas;
- (void)p_getWidgetIDsForInfo:(id)a3 completion:(id)a4;
- (void)p_horizontalOverscrollNextChapter;
- (void)p_horizontalOverscrollPreviousChapter;
- (void)p_interactiveCanvasControllerDidLayout;
- (void)p_layoutCanvasForSize:(CGSize)a3 duration:(double)a4 forceBackgroundLayout:(BOOL)a5;
- (void)p_layoutSinglePageChapter;
- (void)p_localteardown;
- (void)p_localteardownSecondStage;
- (void)p_pageLeft;
- (void)p_pageRight;
- (void)p_performDelayedLayoutAndRotation:(id)a3;
- (void)p_performanceModeUpdated;
- (void)p_presentationStyleChanged;
- (void)p_releaseOverscrollViews;
- (void)p_removeCanvasTransform;
- (void)p_resetPageDisplacment;
- (void)p_resizeViewsForSize:(CGSize)a3 duration:(double)a4 maintainPageIndex:(BOOL)a5;
- (void)p_setActiveSectionControllerDeferVantageDidChange:(BOOL)a3;
- (void)p_setDefaultScrubberCalloutFollowsThumbState;
- (void)p_setFlowPresentation;
- (void)p_setPagedPresentation;
- (void)p_setUnscaledCanvasRect:(CGRect)a3;
- (void)p_setUnscaledCanvasRect:(CGRect)a3 animated:(BOOL)a4;
- (void)p_setupHorizontalOverscrollTransitionAnimationToAbsolutePageIndex:(unint64_t)a3;
- (void)p_setupNavOverlayContainer;
- (void)p_setupOverscrollViews;
- (void)p_setupPageNumberViews;
- (void)p_setupVerticalOverscrollTransitionAnimationToChapter:(id)a3;
- (void)p_swipeToNextOffsetForScrollView:(id)a3 flowPageController:(id)a4 withVelocity:(CGPoint)a5 targetContentOffset:(CGPoint *)a6;
- (void)p_updateBookmarkAffordances;
- (void)p_updateCanvasSize;
- (void)p_updateNavigationOverlayContainerFrame;
- (void)p_updatePageNumberViewPositionsForSize:(CGSize)a3;
- (void)p_updatePageNumberViewVisibility;
- (void)p_updatePageNumberingForce:(BOOL)a3;
- (void)p_updatePageViewHostsWithTheme:(id)a3;
- (void)p_updatePageViewsForScrollingAnimated:(BOOL)a3 restoreOrigin:(BOOL)a4;
- (void)p_updatePageViewsForScrollingAnimated:(BOOL)a3 restoreOrigin:(BOOL)a4 pageIndexSet:(id)a5;
- (void)p_updatePresentationTypeAnimated:(BOOL)a3;
- (void)p_updateProgessKitSectionInCanvasRect:(CGRect)a3;
- (void)p_updateProgressKitForNewNavigationUnit:(id)a3;
- (void)p_updateScrollViewAndZoomSettingsForSize:(CGSize)a3;
- (void)p_updateScrollViewDecelerationRate;
- (void)p_updateScrollViewForSize:(CGSize)a3;
- (void)p_updateScrubberCheckToolbarState:(BOOL)a3;
- (void)p_updateVerticalOverscrollTransform;
- (void)p_updateVisibleInfos;
- (void)p_updateVisibleInfosWithPaddingOptions:(int)a3 force:(BOOL)a4;
- (void)p_updateWidgetInteractionMode;
- (void)p_verticalOverscrollNextChapter;
- (void)p_verticalOverscrollPreviousChapter;
- (void)p_verticalOverscrollSetPreviousChapterNavigationUnit:(id)a3;
- (void)p_visiblePageRangeWillChangeTo:(_NSRange)a3;
- (void)p_visibleRectChanged;
- (void)p_willLayoutCanvasFlow:(id)a3;
- (void)p_willLayoutCanvasPaginated:(id)a3;
- (void)p_zoomToAnchor:(id)a3;
- (void)pageViewProviderViewsAdded:(id)a3 pageIndexSet:(id)a4;
- (void)paginationController:(id)a3 paginationCompleteStateChangedTo:(BOOL)a4;
- (void)paginationController:(id)a3 paginationResultChanged:(id)a4 forContentNode:(id)a5 paginationProgress:(double)a6 paginationComplete:(BOOL)a7;
- (void)popMinimizeLayoutPadding;
- (void)popoverControllerWillDismiss:(id)a3;
- (void)presentExpandedViewController:(id)a3 completionBlock:(id)a4;
- (void)presentPopoverForPopUpInfo:(id)a3 withFrame:(CGRect)a4 inLayer:(id)a5;
- (void)presentRepExpanded:(id)a3;
- (void)presentSearchResultsForString:(id)a3;
- (void)pushMinimizeLayoutPadding;
- (void)recordCurrentLocationInHistory;
- (void)recordOutgoingMajorNavigationJump;
- (void)removeNote:(id)a3;
- (void)removeNoteAndHighlight:(id)a3;
- (void)removePreviewForRelativePageIndex:(unint64_t)a3;
- (void)scrollableCanvasViewControllerDidReceiveBackgroundTap:(id)a3;
- (void)scrub:(id)a3;
- (void)scrubEnded:(id)a3;
- (void)scrubValueChanged:(id)a3;
- (void)scrubberTouch:(id)a3 forEvent:(id)a4;
- (void)scrubberTouchDown:(id)a3;
- (void)sectionControllerInfosDidChange:(id)a3;
- (void)sectionControllerNeedsLayout:(id)a3;
- (void)selectionDidChange;
- (void)setActiveSectionController:(id)a3;
- (void)setAllowPortraitTOC:(BOOL)a3;
- (void)setBeginDraggingContentOffset:(CGPoint)a3;
- (void)setBookNavigationDelegate:(id)a3;
- (void)setBookPropertiesDelegate:(id)a3;
- (void)setBottomOverscrollView:(id)a3;
- (void)setCanvasDidZoomCompletion:(id)a3;
- (void)setCompactFlowPresentationState:(int)a3;
- (void)setContentPageNumberView:(id)a3;
- (void)setCurrentNavigationUnit:(id)a3;
- (void)setCurrentNavigationUnit:(id)a3 withRelativePageIndex:(unint64_t)a4 animated:(BOOL)a5;
- (void)setDeferCanvasLayoutToAfterRotationHasCompleted:(BOOL)a3;
- (void)setDocumentLinkResolver:(id)a3;
- (void)setDocumentNavigator:(id)a3;
- (void)setExpandedViewController:(id)a3;
- (void)setFirstLoad:(BOOL)a3;
- (void)setFlowSectionController:(id)a3;
- (void)setFlowSizeScale:(unint64_t)a3;
- (void)setFtc:(id)a3;
- (void)setInGuidedPan:(BOOL)a3;
- (void)setIsRevealingTOC:(BOOL)a3;
- (void)setIsScrubbing:(BOOL)a3;
- (void)setIsTransitioning:(BOOL)a3;
- (void)setJustUpdatedPresentationType:(BOOL)a3;
- (void)setLastAbsolutePageIndex:(unint64_t)a3;
- (void)setLastLayoutBoundsSize:(CGSize)a3;
- (void)setLastLayoutSize:(CGSize)a3;
- (void)setLastPageNumberUpdate:(id)a3;
- (void)setLastScrollOffset:(CGPoint)a3;
- (void)setLastStorageAnchor:(id)a3;
- (void)setLeftOverscrollView:(id)a3;
- (void)setNavOverlayPageNumberView:(id)a3;
- (void)setNavigationOverlayContainer:(id)a3;
- (void)setOrientationAnchor:(id)a3;
- (void)setOverscrollTransitionView:(id)a3;
- (void)setPageBookmarked:(BOOL)a3;
- (void)setPageBookmarked:(BOOL)a3 forPageRep:(id)a4;
- (void)setPagePaddingOptions:(int)a3;
- (void)setPageViewDisplacement:(id)a3;
- (void)setPaginatedSectionController:(id)a3;
- (void)setPaginationDelegate:(id)a3;
- (void)setPerformanceModeBookOpening:(BOOL)a3;
- (void)setPreventVisibleInfoUpdates:(BOOL)a3;
- (void)setPreviousContentFrame:(CGRect)a3;
- (void)setPreviousTransitionSize:(CGSize)a3;
- (void)setReadingStatisticsDelegate:(id)a3;
- (void)setReflowablePaginationController:(id)a3;
- (void)setRevealTOCDelegate:(id)a3;
- (void)setRightOverscrollView:(id)a3;
- (void)setScrubber:(id)a3;
- (void)setScrubberCallout:(id)a3;
- (void)setScrubberCalloutFollowsScrollerThumb:(BOOL)a3;
- (void)setScrubberCalloutVisible:(BOOL)a3;
- (void)setScrubberCalloutWidth:(double)a3;
- (void)setScrubberHiddenAnimated:(BOOL)a3;
- (void)setShowFlowModeIfAvailable:(BOOL)a3;
- (void)setSpinnerProvider:(id)a3;
- (void)setStatusBarHeightForOrientation:(id)a3;
- (void)setSuspendCanvasScroll:(BOOL)a3;
- (void)setThemeDelegate:(id)a3;
- (void)setToolbarDelegate:(id)a3;
- (void)setTopOverscrollView:(id)a3;
- (void)setTransitioningFromOneUpToTwoUp:(BOOL)a3;
- (void)setTransitioningFromTwoUpToOneUp:(BOOL)a3;
- (void)setUserAnnotationDelegate:(id)a3;
- (void)setVisibleInfoUpdatesAllowedInLandscape:(BOOL)a3;
- (void)setVisibleRelativePageRange:(_NSRange)a3;
- (void)setVisibleUnscaledRectBeforeRotation:(CGRect)a3;
- (void)settingToolbarHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)showGlossaryViewWithAnchor:(id)a3;
- (void)showPageThumbnailsForMissingPageIndexes:(id)a3;
- (void)showPageThumbnailsForPageIndexes:(id)a3 animated:(BOOL)a4 duration:(double)a5;
- (void)showTOC;
- (void)showToolbarAnimated:(BOOL)a3;
- (void)startRevealTOC;
- (void)switchToNavigationUnitForChapterIndex:(unint64_t)a3;
- (void)tapGesture:(id)a3;
- (void)teardown;
- (void)toggleFlowPresentation;
- (void)toggleToolbar;
- (void)unloadDocument;
- (void)updateForTheme:(id)a3;
- (void)updateNavigationAffordances;
- (void)updateTwoUpForSize:(CGSize)a3;
- (void)updateVisibleInfosWithPageIndex:(unint64_t)a3;
- (void)validateCommand:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)viewsDidResize;
- (void)willStartRevealTOC;
- (void)zoomOutAnimated:(BOOL)a3;
- (void)zoomOutIfNecessaryAnimated:(BOOL)a3 completion:(id)a4;
- (void)zoomOutIfNecessaryPriorToNavigation;
- (void)zoomToRelativeTargetRect:(CGRect)a3 atPageIndex:(unint64_t)a4;
@end

@implementation THDocumentViewController

- (THDocumentViewController)initWithDefaultView
{
  v2 = [(THDocumentViewController *)self initWithNibName:@"THDocumentViewController" bundle:THBundle()];
  v3 = v2;
  if (v2)
  {
    [(THDocumentViewController *)v2 setEdgesForExtendedLayout:15];
    [(THDocumentViewController *)v3 setExtendedLayoutIncludesOpaqueBars:1];
    -[THDocumentViewController setVisibleRelativePageRange:](v3, "setVisibleRelativePageRange:", NSInvalidRange[0], NSInvalidRange[1]);
    [(THDocumentViewController *)v3 setAllowPortraitTOC:1];
    v3->mOverscrollViewChapterNumber = 0x7FFFFFFFFFFFFFFFLL;
    CGSize size = CGRectNull.size;
    v3->mScrollTargetRect.origin = CGRectNull.origin;
    v3->mScrollTargetRect.CGSize size = size;
    [(THDocumentViewController *)v3 setFirstLoad:1];
    -[v3 setFlowSizeScale:[+[THApplicationSettings sharedSettings](THApplicationSettings, "sharedSettings") flowSizeScale]];
    [(THDocumentViewController *)v3 setFtc:objc_alloc_init(THWFreeTransformController)];
    v3->mLastAbsolutePageIndex = 0x7FFFFFFFFFFFFFFFLL;
    [(THDocumentViewController *)v3 setStatusBarHeightForOrientation:+[NSMutableDictionary dictionaryWithCapacity:4]];
    [(THDocumentViewController *)v3 setShowFlowModeIfAvailable:0];
    v5 = +[NSUserDefaults standardUserDefaults];
    id v6 = [(NSUserDefaults *)v5 objectForKey:THDocumentLayoutKey];
    if (v6 && [v6 intValue] >= 2) {
      [(THDocumentViewController *)v3 setShowFlowModeIfAvailable:1];
    }
    v3->_accessLock._os_unfair_lock_opaque = 0;
    v3->_displaySleepController = (BCDisplaySleepController *)objc_alloc_init((Class)BCDisplaySleepController);
    [(THDocumentViewController *)v3 p_setDefaultScrubberCalloutFollowsThumbState];
    [(THDocumentViewController *)v3 registerForTraitChanges:+[UITraitCollection bc_allAPITraits] withAction:"_traitCollectionDidChange:previousTraitCollection:"];
  }
  return v3;
}

- (void)dealloc
{
  [+[NSNotificationCenter defaultCenter] removeObserver:self];
  +[NSObject cancelPreviousPerformRequestsWithTarget:self];
  [(THDocumentViewController *)self p_cleanupAfterViewUnload];

  self->mOrientationAnchor = 0;
  self->mDocumentLinkResolver = 0;

  self->mLastPageNumberUpdate = 0;
  id mCanvasDidZoomCompletion = self->mCanvasDidZoomCompletion;
  if (mCanvasDidZoomCompletion)
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentViewController dealloc]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentViewController.mm") lineNumber:383 description:@"Tearing down despite unfired zoom completion block."];
    id mCanvasDidZoomCompletion = self->mCanvasDidZoomCompletion;
  }

  self->mGuidedPanController = 0;
  self->mRevealTOCPanController = 0;
  [(THDocumentNavigator *)self->mDocumentNavigator setDelegate:0];

  self->mDocumentNavigator = 0;
  self->_reflowablePaginationController = 0;
  [(THDocumentViewController *)self setFtc:0];

  self->_configuration = 0;
  self->mPageViewDisplacement = 0;

  self->mOverscrollTransitionView = 0;
  self->_lastStorageAnchor = 0;

  self->mPageViewProvider = 0;
  self->_flowSectionController = 0;

  self->_scrubberCallout = 0;
  self->_paginatedSectionController = 0;

  self->_scrubber = 0;
  self->_statusBarHeightForOrientation = 0;
  v4.receiver = self;
  v4.super_class = (Class)THDocumentViewController;
  [(THDocumentViewController *)&v4 dealloc];
}

- (void)didReceiveMemoryWarning
{
  v2.receiver = self;
  v2.super_class = (Class)THDocumentViewController;
  [(THDocumentViewController *)&v2 didReceiveMemoryWarning];
}

- (void)p_cleanupAfterViewUnload
{
  self->mTapRecognizer = 0;
  self->mContentPageNumberView = 0;

  self->mNavOverlayPageNumberView = 0;
  self->mNavigationOverlayContainer = 0;
  [(TSWPopoverController *)self->mPopUpPopoverController setDelegate:0];

  self->mPopUpPopoverController = 0;
  [(THWExpandedViewController *)self->mExpandedViewController teardown];

  self->mExpandedViewController = 0;
  [(THDocumentViewController *)self p_releaseOverscrollViews];
  uint64_t v3 = OBJC_IVAR___TSADocumentViewController__scrollView;

  *(void *)&self->TSADocumentViewController_opaque[v3] = 0;
}

- (double)viewFooterHeight
{
  return 0.0;
}

- (double)viewHeaderHeight
{
  if ([(THDocumentViewController *)self prefersStatusBarHidden]) {
    return 0.0;
  }
  unint64_t v4 = [(THDocumentViewController *)self th_cachedInterfaceOrientation];
  if (v4 <= 1) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = v4;
  }
  id v6 = (NSNumber *)[(NSMutableDictionary *)[(THDocumentViewController *)self statusBarHeightForOrientation] objectForKeyedSubscript:+[NSNumber numberWithInteger:v5]];
  if (!v6)
  {
    [+[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow") safeAreaInsets];
    double v8 = v7;
    [UIApp statusBarHeightForOrientation:v5 ignoreHidden:1];
    if (v8 > v9) {
      double v9 = v8;
    }
    id v6 = +[NSNumber numberWithDouble:v9];
    [(NSMutableDictionary *)[(THDocumentViewController *)self statusBarHeightForOrientation] setObject:v6 forKeyedSubscript:+[NSNumber numberWithInteger:v5]];
  }

  [(NSNumber *)v6 doubleValue];
  return result;
}

- (void)p_updatePageNumberViewPositionsForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(THPageNumberView *)[(THDocumentViewController *)self contentPageNumberView] setMode:[(THDocumentViewController *)self inFlowMode] ^ 1];
  id v6 = [(THDocumentViewController *)self contentPageNumberView];
  if ([(THDocumentViewController *)self isEpub]) {
    uint64_t v7 = [(THDocumentViewController *)self inFlowMode] ^ 1;
  }
  else {
    uint64_t v7 = 0;
  }
  [(THPageNumberView *)v6 setBold:v7];
  if ([(THDocumentViewController *)self inFlowMode])
  {
    [self view].safeAreaInsets
    double v9 = width + -10.0 - v8;
    [self view].safeAreaInsets;
    double v11 = height + -10.0 - v10;
  }
  else
  {
    [(THDocumentReflowableLayoutConfiguration *)[(THDocumentViewController *)self configuration] pageNumberPosition];
    double v9 = v12;
    double v11 = v13;
  }
  -[THPageNumberView updatePosition:]([(THDocumentViewController *)self contentPageNumberView], "updatePosition:", v9, v11);
  [(THPageNumberView *)[(THDocumentViewController *)self navOverlayPageNumberView] setMode:1];
  [(THPageNumberView *)[(THDocumentViewController *)self navOverlayPageNumberView] setBold:1];
  id v14 = [(THPageNumberView *)[(THDocumentViewController *)self navOverlayPageNumberView] superview];
  [(THDocumentReflowableLayoutConfiguration *)[(THDocumentViewController *)self configuration] pageNumberPosition];
  [v14 convertPoint:v15 fromView:[self view]];
  -[THPageNumberView updatePosition:]([(THDocumentViewController *)self navOverlayPageNumberView], "updatePosition:", v17, v18);

  [(THDocumentViewController *)self p_updatePageNumberViewVisibility];
}

- (void)p_updatePageNumberViewVisibility
{
  if ([(THDocumentViewController *)self inFlowMode]) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = [(THDocumentViewController *)self isEpub] ^ 1;
  }
  [(THPageNumberView *)[(THDocumentViewController *)self contentPageNumberView] setHidden:v3];
  uint64_t v4 = [(THDocumentViewController *)self isEpub] ^ 1;
  uint64_t v5 = [(THDocumentViewController *)self navOverlayPageNumberView];

  [(THPageNumberView *)v5 setHidden:v4];
}

- (void)p_updateNavigationOverlayContainerFrame
{
  [(THDocumentReflowableLayoutConfiguration *)[(THDocumentViewController *)self configuration] bottomFullWidthToolbarFrame];
  -[UIView setFrame:]([(THDocumentViewController *)self navigationOverlayContainer], "setFrame:", v3, v4, v5, v6);
  uint64_t v7 = [(THDocumentViewController *)self isEpub] ^ 1;
  double v8 = [(THDocumentViewController *)self navigationOverlayContainer];

  [(UIView *)v8 setHidden:v7];
}

- (void)loadDocument
{
  if (([(THDocumentViewController *)self isDocumentLoaded] & 1) == 0)
  {
    v13.receiver = self;
    v13.super_class = (Class)THDocumentViewController;
    [(THDocumentViewController *)&v13 loadDocument];
    -[self setFlowSizeScale:[+[THApplicationSettings sharedSettings](THApplicationSettings, "sharedSettings") flowSizeScale]];
    [(THDocumentViewController *)self setDocumentNavigator:[[THDocumentNavigator alloc] initWithDocumentRoot:[(THDocumentViewController *)self documentRoot] interactiveCanvasController:[(THDocumentViewController *)self interactiveCanvasController]]];
    [(THDocumentNavigator *)[(THDocumentViewController *)self documentNavigator] setDelegate:self];
    if ([(THDocumentViewController *)self isEpub])
    {
      double v3 = objc_alloc_init(THiOSThemeProvider);
      objc_opt_class();
      [(THThemeDelegate *)[(THDocumentViewController *)self themeDelegate] theme];
      [(THiOSThemeProvider *)v3 updateWithTheme:TSUDynamicCast() traitCollection:[(THDocumentViewController *)self traitCollection]];
      [(-[THDocumentViewController documentRoot](self, "documentRoot")) setThemeProvider:v3];
    }
    if (objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "properties"), "paginatedPresentationType"))
    {
      id v4 = +[THPagePositionController paginatedPositionerWithDelegate:self];
      id v5 = objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "properties"), "paginatedPresentationType");
      [v5 setPageSizeDelegate:self];
      id v6 = [v5 copyFixingSize];
      self->_paginatedSectionController = [[THSectionController alloc] initWithDelegate:self pagePositionController:v4 presentationType:v6];

      uint64_t v7 = [THPageViewProvider alloc];
      id v8 = [(THDocumentViewController *)self interactiveCanvasController];
      [(THDocumentViewController *)self paginatedPageSize];
      double v9 = -[THPageViewProvider initWithInteractiveCanvasController:pageSize:](v7, "initWithInteractiveCanvasController:pageSize:", v8);
      self->mPageViewProvider = v9;
      [(THPageViewProvider *)v9 setDelegate:self];
      [(THPageViewProvider *)self->mPageViewProvider setPreviewEnabled:[(THDocumentViewController *)self isEpub] ^ 1];
    }
    if (objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "properties"), "flowPresentationType"))
    {
      id v10 = +[THPagePositionController flowPositionerWithDelegate:self];
      id v11 = objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "properties"), "flowPresentationType");
      [v11 setPageSizeDelegate:self];
      self->_flowSectionController = (THSectionController *)[[THFlowSectionController alloc] initWithDelegate:self pagePositionController:v10 presentationType:v11];
    }
    self->mHaveDisplayedCorruptBookAlert = 0;
    -[THDocumentViewController setVisibleRelativePageRange:](self, "setVisibleRelativePageRange:", NSInvalidRange[0], NSInvalidRange[1]);
    [(THDocumentViewController *)self setPagePaddingOptions:0];
    [self interactiveCanvasController].allowLayoutAndRenderOnThread = 1;
    [(THDocumentViewController *)self p_setActiveSectionControllerDeferVantageDidChange:0];
    [(THDocumentViewController *)self p_setupPageNumberViews];
    [(THDocumentViewController *)self p_setupNavOverlayContainer];
    if ([(THDocumentViewController *)self isEpub]
      && [(THDocumentViewController *)self flowSectionController])
    {
      if ([(THDocumentViewController *)self paginatedSectionController])
      {

        double v12 = [[THReflowablePaginationController alloc] initWithDocumentRoot:[(THDocumentViewController *)self documentRoot] sourcePresentationType:[(THSectionController *)[(THDocumentViewController *)self flowSectionController] presentationType] targetPresentationType:[(THSectionController *)[(THDocumentViewController *)self paginatedSectionController] presentationType] loadCache:1 observer:self];
        self->_reflowablePaginationController = v12;
        [(THSectionController *)[(THDocumentViewController *)self paginatedSectionController] setReflowablePaginationController:v12];
        [(-[THDocumentViewController documentRoot](self, "documentRoot")) setReflowablePaginationController:self->_reflowablePaginationController];
        [(THReflowablePaginationController *)[(THDocumentViewController *)self reflowablePaginationController] assignContentNodes];
        [(THDocumentLinkResolver *)[(THDocumentViewController *)self documentLinkResolver] invalidatePaginationResults];
        objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "searchController"), "invalidatePaginationResults");
        [(THReflowablePaginationController *)[(THDocumentViewController *)self reflowablePaginationController] paginate];
      }
    }
    [(THDocumentViewController *)self p_buildContextTree];
  }
}

- (void)ensureDocumentIsLoaded
{
  if (([(THDocumentViewController *)self isDocumentLoaded] & 1) == 0)
  {
    [(THDocumentViewController *)self loadDocument];
  }
}

- (void)unloadDocument
{
  [(THReflowablePaginationController *)[(THDocumentViewController *)self reflowablePaginationController] willClose];
  [(THDocumentViewController *)self p_localteardown];
  [self interactiveCanvasController].setAllowLayoutAndRenderOnThread:0;
  [self.interactiveCanvasController setInfosToDisplay:[NSArray array]];
  [self interactiveCanvasController].layoutInvalidated;
  [self interactiveCanvasController].layoutIfNeeded;
  [(THSectionController *)[(THDocumentViewController *)self paginatedSectionController] teardown];
  [(THDocumentViewController *)self setPaginatedSectionController:0];
  [(THSectionController *)[(THDocumentViewController *)self flowSectionController] teardown];
  [(THDocumentViewController *)self setFlowSectionController:0];
  [(THDocumentViewController *)self setActiveSectionController:0];
  [(THDocumentViewController *)self setDocumentLinkResolver:0];
  [(THDocumentViewController *)self setDocumentNavigator:0];
  [(THDocumentViewController *)self setPreventVisibleInfoUpdates:0];
  [self interactiveCanvasController].teardown;
  [self canvasViewController] teardown;
  v3.receiver = self;
  v3.super_class = (Class)THDocumentViewController;
  [(THDocumentViewController *)&v3 unloadDocument];
  [+[TSDFrameImageCache sharedFrameImageCache](TSDFrameImageCache, "sharedFrameImageCache") didCloseDocument];
  [(THDocumentViewController *)self p_localteardownSecondStage];
}

- (void)p_localteardown
{
  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "p_performDelayedLayoutAndRotation:", +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", self->_previousTransitionSize.width, self->_previousTransitionSize.height));
  uint64_t v3 = OBJC_IVAR___TSADocumentViewController__scrollView;
  [*(id *)&self->TSADocumentViewController_opaque[OBJC_IVAR___TSADocumentViewController__scrollView] setDelegate:0];
  [*(id *)&self->TSADocumentViewController_opaque[v3] removeFromSuperview];
  [(BKScrubberControl *)[(THDocumentViewController *)self scrubber] removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];
  [(BKScrubberControl *)[(THDocumentViewController *)self scrubber] removeFromSuperview];

  self->_scrubber = 0;
  [(BKScrubberCalloutView *)[(THDocumentViewController *)self scrubberCallout] removeFromSuperview];

  self->_scrubberCallout = 0;
  [(THDocumentViewController *)self setDocumentLinkResolver:0];
  [self canvasViewController] teardown;
  [self.documentRoot setReflowablePaginationController:0];
  [(THReflowablePaginationController *)[(THDocumentViewController *)self reflowablePaginationController] unregisterObserver:self];
  [(THReflowablePaginationController *)[(THDocumentViewController *)self reflowablePaginationController] teardown];

  [(THDocumentViewController *)self setLastStorageAnchor:0];
}

- (void)p_localteardownSecondStage
{
  self->mPageViewProvider = 0;
  self->mPageViewDisplacement = 0;
  [(THWAutoplayController *)self->mAutoplayController teardown];

  self->mAutoplayController = 0;
}

- (void)teardown
{
  [(THDocumentViewController *)self p_localteardown];
  [(THDocumentViewController *)self p_localteardownSecondStage];
  v3.receiver = self;
  v3.super_class = (Class)THDocumentViewController;
  [(THDocumentViewController *)&v3 teardown];
}

- (void)p_updateScrollViewDecelerationRate
{
  unsigned int v3 = [(THDocumentViewController *)self inFlowMode];
  id v4 = &UIScrollViewDecelerationRateFast;
  if (!v3) {
    id v4 = &UIScrollViewDecelerationRateNormal;
  }
  double v5 = *v4;
  id v6 = *(void **)&self->TSADocumentViewController_opaque[OBJC_IVAR___TSADocumentViewController__scrollView];

  [v6 setDecelerationRate:v5];
}

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)THDocumentViewController;
  [(THDocumentViewController *)&v8 viewWillAppear:a3];
  [self view].bounds
  -[THDocumentViewController setLastLayoutBoundsSize:](self, "setLastLayoutBoundsSize:", v4, v5);
  [self view].frame
  -[THDocumentViewController updateTwoUpForSize:](self, "updateTwoUpForSize:", v6, v7);
  [(THDocumentViewController *)self p_updateVisibleInfos];
  [(THDocumentViewController *)self p_updateBookmarkAffordances];
  [(BCDisplaySleepController *)[(THDocumentViewController *)self displaySleepController] userInteractionOccurred];
  [(THDocumentViewController *)self p_updateScrollViewDecelerationRate];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)THDocumentViewController;
  [(THDocumentViewController *)&v4 viewWillDisappear:a3];
  if ((([self presentedViewController].bc_isModelTransitioning & 1) == 0) && ![self p_dismissActiveAnimated:0]) {
}
  }

- (void)viewDidAppear:(BOOL)a3
{
  unsigned int v3 = self;
  v4.receiver = self;
  v4.super_class = (Class)THDocumentViewController;
  [(THDocumentViewController *)&v4 viewDidAppear:a3];
  [v3 interactiveCanvasController].resumeEditing;
  [(THDocumentViewController *)v3 setPagePaddingOptions:3];
  if ([(THDocumentViewController *)v3 canvasViewController]) {
    unsigned int v3 = (THDocumentViewController *)[(THDocumentViewController *)v3 canvasViewController];
  }
  [(THDocumentViewController *)v3 becomeFirstResponder];
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  v10.receiver = self;
  v10.super_class = (Class)THDocumentViewController;
  [(THDocumentViewController *)&v10 viewDidMoveToWindow:a3 shouldAppearOrDisappear:a4];
  if (a3)
  {
    [(THDocumentReflowableLayoutConfiguration *)[(THDocumentViewController *)self configuration] scrubberFrame];
    -[BKScrubberControl setFrame:]([(THDocumentViewController *)self scrubber], "setFrame:", v6, v7, v8, v9);
  }
  [(BCDisplaySleepController *)[(THDocumentViewController *)self displaySleepController] setWindow:a3];
}

- (void)viewDidLoad
{
  v15.receiver = self;
  v15.super_class = (Class)THDocumentViewController;
  [(THDocumentViewController *)&v15 viewDidLoad];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_DDA4;
  v14[3] = &unk_456DE0;
  v14[4] = self;
  os_unfair_lock_lock(&self->_accessLock);
  sub_DDA4((uint64_t)v14);
  os_unfair_lock_unlock(&self->_accessLock);
  [self view].autoresizingMask = 18;
  [self.view setAutoresizesSubviews:0];
  uint64_t v3 = OBJC_IVAR___TSADocumentViewController__scrollView;
  [*(id *)&self->TSADocumentViewController_opaque[OBJC_IVAR___TSADocumentViewController__scrollView] setAlwaysBounceHorizontal:0];
  [*(id *)&self->TSADocumentViewController_opaque[v3] setAlwaysBounceVertical:0];
  [*(id *)&self->TSADocumentViewController_opaque[v3] setDirectionalLockEnabled:1];
  [*(id *)&self->TSADocumentViewController_opaque[v3] setContentInsetAdjustmentBehavior:2];
  objc_msgSend(objc_msgSend(objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "layerHost"), "canvasLayer"), "setCenteredInScrollView:", -[THDocumentViewController inFlowMode](self, "inFlowMode") ^ 1);
  objc_opt_class();
  objc_super v4 = (void *)TSUDynamicCast();
  if (v4)
  {
    double v5 = v4;
    [v4 setPreventChildInducedBounce:1];
    [v5 setPreventBounceAnimation:1];
  }
  if ([(THDocumentViewController *)self useScrubber])
  {
    double v6 = [(BKScrubberControl *)[objc_alloc((Class)BKScrubberControl) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height] style:[-[THDocumentViewController configuration](self, "configuration") scrubberStyle]];
    self->_scrubber = v6;
    [(BKScrubberControl *)v6 setBkAccessibilityDelegate:self];
    [(BKScrubberControl *)[(THDocumentViewController *)self scrubber] setAutoresizingMask:2];
    [(BKScrubberControl *)[(THDocumentViewController *)self scrubber] addTarget:self action:"scrub:" forControlEvents:192];
    [(BKScrubberControl *)[(THDocumentViewController *)self scrubber] addTarget:self action:"scrubValueChanged:" forControlEvents:4096];
    [(BKScrubberControl *)[(THDocumentViewController *)self scrubber] addTarget:self action:"scrubberTouchDown:" forControlEvents:1];
    [(BKScrubberControl *)[(THDocumentViewController *)self scrubber] addTarget:self action:"scrubberTouch:forEvent:" forControlEvents:4095];
    [(BKScrubberControl *)[(THDocumentViewController *)self scrubber] addTarget:self action:"scrubEnded:" forControlEvents:448];
    if ([(THDocumentViewController *)self inFlowMode])
    {
      [(BKScrubberControl *)[(THDocumentViewController *)self scrubber] setHidden:1];
      [(BKScrubberControl *)[(THDocumentViewController *)self scrubber] setEnabled:0];
    }
    [self.view addSubview:self.scrubber];
    self->_scrubberCallout = [objc_alloc((Class)BKScrubberCalloutView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    [(BKScrubberCalloutView *)[(THDocumentViewController *)self scrubberCallout] setUsesMonospacedDigitFontForSubtitle:1];
    [(THDocumentViewController *)self setScrubberCalloutWidth:0.0];
    objc_opt_class();
    [(THThemeDelegate *)[(THDocumentViewController *)self themeDelegate] theme];
    double v7 = (void *)TSUDynamicCast();
    if (v7) {
      -[BKScrubberCalloutView setBackgroundColor:](self->_scrubberCallout, "setBackgroundColor:", [v7 HUDBackgroundColor]);
    }
    [(BKScrubberCalloutView *)self->_scrubberCallout addToViewController:self];
  }
  double v8 = (UITapGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"tapGesture:"];
  self->mTapRecognizer = v8;
  [(UITapGestureRecognizer *)v8 setDelegate:self];
  [(UITapGestureRecognizer *)self->mTapRecognizer setCancelsTouchesInView:0];
  [self->mTapRecognizer addGestureRecognizer:[self view]];
  self->mPageViewDisplacement = [[THPageViewDisplacement alloc] initWithView:[(THDocumentViewController *)self view] scrollView:*(void *)&self->TSADocumentViewController_opaque[v3]];
  double v9 = [[THGuidedPanController alloc] initWithInteractiveCanvasController:[(THDocumentViewController *)self interactiveCanvasController]];
  self->mGuidedPanController = v9;
  [(THGuidedPanController *)v9 setDelegate:self];
  if (![(THDocumentViewController *)self isEpub]) {
    self->mRevealTOCPanController = [[THRevealTOCPanController alloc] initWithDelegate:[(THDocumentViewController *)self revealTOCDelegate] interactiveCanvasController:[(THDocumentViewController *)self interactiveCanvasController]];
  }
  id v10 = [(THDocumentViewController *)self interactiveCanvasController];
  id v11 = [v10 gestureRecognizerWithKind:TSWPImmediatePress];
  objc_msgSend(objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "gestureDispatcher"), "allowSimultaneousRecognitionByRecognizers:", v11, objc_msgSend(*(id *)&self->TSADocumentViewController_opaque[v3], "panGestureRecognizer"), 0);
  objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "layerHost"), "asiOSCVC"), "guidedPanGestureRecognizer"), "requireGestureRecognizerToFail:", v11);
  id v12 = [(THDocumentViewController *)self canvasViewController];
  if (v12)
  {
    id v13 = v12;
    if (![v12 parentViewController]) {
      [(THDocumentViewController *)self addChildViewController:v13];
    }
  }
  self->mAutoplayController = objc_alloc_init(THWAutoplayController);
  [(THWAutoplayController *)self->mAutoplayController setInteractiveCanvasController:[(THDocumentViewController *)self interactiveCanvasController]];
}

- (void)viewWillLayoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)THDocumentViewController;
  [(THDocumentViewController *)&v10 viewWillLayoutSubviews];
  [self view].bounds;
  double v4 = v3;
  double v6 = v5;
  [(THDocumentViewController *)self lastLayoutBoundsSize];
  if (v8 != v4 || v7 != v6)
  {
    if (objc_msgSend(-[THDocumentViewController view](self, "view"), "window"))
    {
      [(THDocumentViewController *)self adjustContentViewFrame];
      -[THDocumentViewController setLastLayoutBoundsSize:](self, "setLastLayoutBoundsSize:", v4, v6);
    }
  }
}

- (void)viewDidLayoutSubviews
{
  v19.receiver = self;
  v19.super_class = (Class)THDocumentViewController;
  [(THDocumentViewController *)&v19 viewDidLayoutSubviews];
  [(THDocumentViewController *)self p_updateNavigationOverlayContainerFrame];
  if ([(THDocumentViewController *)self isEpub])
  {
    [(THDocumentViewController *)self p_updatePresentationTypeAnimated:0];
    [(THDocumentReflowableLayoutConfiguration *)[(THDocumentViewController *)self configuration] scrubberFrame];
    -[BKScrubberControl setFrame:]([(THDocumentViewController *)self scrubber], "setFrame:", v3, v4, v5, v6);
    [(BKScrubberControl *)[(THDocumentViewController *)self scrubber] setOrientation:[(THDocumentViewController *)self inFlowMode]];
  }
  else if (![(THDocumentViewController *)self isTransitioning])
  {
    [self view].frame;
    double v8 = v7;
    double v10 = v9;
    [(THDocumentViewController *)self lastLayoutSize];
    if (v12 != v8 || v11 != v10)
    {
      -[THDocumentViewController bookViewWillTransitionToSize:](self, "bookViewWillTransitionToSize:", v8, v10);
      -[THDocumentViewController bookViewDidTransitionToSize:](self, "bookViewDidTransitionToSize:", v8, v10);
      -[THDocumentViewController setLastLayoutSize:](self, "setLastLayoutSize:", v8, v10);
      [self canvasViewController] repositionGlossaryIfPopoverAnimated:0;
      if ([(THDocumentViewController *)self useScrubber])
      {
        [(THDocumentReflowableLayoutConfiguration *)[(THDocumentViewController *)self configuration] scrubberFrame];
        -[BKScrubberControl setFrame:]([(THDocumentViewController *)self scrubber], "setFrame:", v13, v14, v15, v16);
      }
    }
  }
  [(THDocumentReflowableLayoutConfiguration *)[(THDocumentViewController *)self configuration] scrubberCalloutWidth];
  [(THDocumentViewController *)self setScrubberCalloutWidth:"setScrubberCalloutWidth:"];
  [self view].frame
  -[THDocumentViewController p_updatePageNumberViewPositionsForSize:](self, "p_updatePageNumberViewPositionsForSize:", v17, v18);
}

- (id)childViewControllerForStatusBarHidden
{
  id result = [(THDocumentViewController *)self expandedViewController];
  if (result)
  {
    return [(THDocumentViewController *)self expandedViewController];
  }
  return result;
}

- (id)childViewControllerForStatusBarStyle
{
  id result = [(THDocumentViewController *)self expandedViewController];
  if (result)
  {
    return [(THDocumentViewController *)self expandedViewController];
  }
  return result;
}

- (int64_t)preferredStatusBarStyle
{
  id v3 = [[-[THDocumentViewController themeDelegate](self, "themeDelegate") theme] contentStatusBarStyle];
  if (![(THDocumentViewController *)self isEpub]
    && [(THPresentationType *)[(THDocumentViewController *)self currentPresentationType] isFlow]&& [(THToolbarDelegate *)[(THDocumentViewController *)self toolbarDelegate] isToolbarHidden])
  {
    id v3 = &dword_0 + 3;
  }
  if (UIAccessibilityIsInvertColorsEnabled() && [(THDocumentViewController *)self isEpub])
  {
    id v4 = [[-[THDocumentViewController themeDelegate](self, "themeDelegate") theme] themeIdentifier];
    if (v4 == (id)kIMThemeIdentifierWhitePageTheme || v4 == (id)kIMThemeIdentifierSepiaPageTheme)
    {
      return 1;
    }
    else if (v4 == (id)kIMThemeIdentifierGrayPageTheme || v4 == (id)kIMThemeIdentifierNightPageTheme)
    {
      return 3;
    }
  }
  return (int64_t)v3;
}

- (int64_t)overrideUserInterfaceStyle
{
  v4.receiver = self;
  v4.super_class = (Class)THDocumentViewController;
  int64_t result = [(THDocumentViewController *)&v4 overrideUserInterfaceStyle];
  if (!result)
  {
    objc_opt_class();
    [(THThemeDelegate *)[(THDocumentViewController *)self themeDelegate] theme];
    int64_t result = TSUDynamicCast();
    if (result) {
      return (int64_t)[(id)result userInterfaceStyle];
    }
  }
  return result;
}

- (id)childViewControllerForHomeIndicatorAutoHidden
{
  id result = [(THDocumentViewController *)self expandedViewController];
  if (result)
  {
    return [(THDocumentViewController *)self expandedViewController];
  }
  return result;
}

- (BOOL)prefersHomeIndicatorAutoHidden
{
  objc_super v2 = [(THDocumentViewController *)self toolbarDelegate];

  return [(THToolbarDelegate *)v2 isToolbarHidden];
}

- (BOOL)shouldAutorotate
{
  return [self interactiveCanvasController].currentlyScrolling ^ 1;
}

- (BOOL)isPageBookmarked
{
  id v3 = [(THDocumentViewController *)self userAnnotationDelegate];

  return [(THUserAnnotationDelegate *)v3 isPageBookmarkedForDocumentViewController:self];
}

- (void)setPageBookmarked:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(THDocumentViewController *)self userAnnotationDelegate];

  [(THUserAnnotationDelegate *)v5 setPageBookmarked:v3 forDocumentViewController:self];
}

- (void)updateForTheme:(id)a3
{
  if ([(THDocumentViewController *)self isEpub])
  {
    objc_opt_class();
    objc_super v4 = (void *)TSUDynamicCast();
    id v5 = [v4 backgroundColorForTraitEnvironment:self];
    [self view].backgroundColor = v5;
    -[THPageNumberView setPageNumberColor:backgroundColor:](-[THDocumentViewController navOverlayPageNumberView](self, "navOverlayPageNumberView"), "setPageNumberColor:backgroundColor:", [v4 headerTextColor], v5);
    -[THPageNumberView setPageNumberColor:backgroundColor:](-[THDocumentViewController contentPageNumberView](self, "contentPageNumberView"), "setPageNumberColor:backgroundColor:", [v4 headerTextColorDimmed], v5);
    [(THOverscrollImageView *)[(THDocumentViewController *)self leftOverscrollView] setBackgroundColor:v5];
    [(THOverscrollImageView *)[(THDocumentViewController *)self rightOverscrollView] setBackgroundColor:v5];
    [(UIView *)[(THDocumentViewController *)self topOverscrollView] setBackgroundColor:v5];
    [(UIView *)[(THDocumentViewController *)self bottomOverscrollView] setBackgroundColor:v5];
    id v6 = [(THDocumentViewController *)self interactiveCanvasController];
    objc_msgSend(objc_msgSend(v6, "canvasView"), "setBackgroundColor:", v5);
    objc_msgSend(objc_msgSend(objc_msgSend(v6, "canvasView"), "enclosingScrollView"), "setBackgroundColor:", v5);
    objc_opt_class();
    [self documentRoot].themeProvider
    double v7 = (void *)TSUDynamicCast();
    [v7 updateWithTheme:v4 traitCollection:[self traitCollection]];
    unsigned int v8 = [v7 forceThemeColors];
    double v9 = [(TSWPopoverController *)self->mPopUpPopoverController popUpInfo];
    if (v8) {
      double v10 = +[TSUColor colorWithUIColor:v5];
    }
    else {
      double v10 = 0;
    }
    [(TSWPopUpInfo *)v9 updateBackgroundColor:v10];
    [(THDocumentViewController *)self p_updatePageViewHostsWithTheme:v4];
    [(THWExpandedViewController *)[(THDocumentViewController *)self expandedViewController] invalidate];
    [(THSectionController *)[(THDocumentViewController *)self activeSectionController] clearCTCaches];
    [v6 pushThreadedLayoutAndRenderDisabled];
    [v6 recreateAllLayoutsAndReps];
    [v6 layoutIfNeeded];
    [v6 popThreadedLayoutAndRenderDisabled];
    [(THDocumentViewController *)self _updateScrubberTheme:v4];
  }
}

- (void)_updateScrubberTheme:(id)a3
{
  if ([a3 shouldInvertContent]) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = 2;
  }
  [(BKScrubberControl *)self->_scrubber setThemeInterfaceStyle:v5];
  [self->_scrubber track].setTrackBackgroundColor:[a3 quarternaryTextColor];
  id v6 = [a3 HUDBackgroundColor];
  scrubberCallout = self->_scrubberCallout;

  [(BKScrubberCalloutView *)scrubberCallout setBackgroundColor:v6];
}

- (void)p_updatePageViewHostsWithTheme:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_E678;
  v3[3] = &unk_456E38;
  v3[4] = self;
  v3[5] = [a3 backgroundColorForTraitEnvironment:self];
  +[UIView performWithoutAnimation:v3];
}

- (id)foregroundTextColor
{
  id v2 = [(THThemeDelegate *)[(THDocumentViewController *)self themeDelegate] theme];

  return [v2 contentTextColor];
}

- (id)backgroundColor
{
  id v3 = [(THThemeDelegate *)[(THDocumentViewController *)self themeDelegate] theme];

  return [v3 backgroundColorForTraitEnvironment:self];
}

- (BOOL)pointIsInLeftMargin:(CGPoint)a3 fromView:(id)a4
{
  [self view].convertPoint:a4 fromView:a3.x, a3.y];
  double v6 = v5;
  double v8 = v7;
  [(THDocumentViewController *)self p_pageMarginWidth];
  if (v6 >= v9) {
    return 0;
  }
  [(THToolbarDelegate *)[(THDocumentViewController *)self toolbarDelegate] toolbarHeight];
  return v8 > v10;
}

- (BOOL)pointIsInRightMargin:(CGPoint)a3 fromView:(id)a4
{
  [self view].convertPoint:a4 fromView:[a3 x], [a3 y]];
  double v6 = v5;
  double v8 = v7;
  [self view].bounds;
  double v10 = v9;
  [(THDocumentViewController *)self p_pageMarginWidth];
  if (v6 <= v10 - v11) {
    return 0;
  }
  [(THToolbarDelegate *)[(THDocumentViewController *)self toolbarDelegate] toolbarHeight];
  return v8 > v12;
}

- (void)scrub:(id)a3
{
  objc_super v4 = (char *)[a3 pageNumber];
  [(THBookNavigation *)[(THDocumentViewController *)self bookNavigationDelegate] recordOutgoingMajorNavigationJump];
  [(THDocumentNavigator *)[(THDocumentViewController *)self documentNavigator] setVisibleAbsolutePhysicalPageIndex:v4 - 1];
  [(THBookNavigation *)[(THDocumentViewController *)self bookNavigationDelegate] recordCurrentLocationInHistory];
  double v5 = [(THDocumentViewController *)self bookNavigationDelegate];

  [(THBookNavigation *)v5 updateNavigationAffordances];
}

- (void)p_updateScrubberCheckToolbarState:(BOOL)a3
{
  BOOL v3 = a3;
  [(BKScrubberControl *)[(THDocumentViewController *)self scrubber] setEnabled:1];
  if (v3)
  {
    id v5 = [(THToolbarDelegate *)[(THDocumentViewController *)self toolbarDelegate] isToolbarHidden];
    double v6 = [(THDocumentViewController *)self scrubber];
    [(BKScrubberControl *)v6 setHidden:v5];
  }
}

- (void)scrubValueChanged:(id)a3
{
  id v4 = [(BKScrubberControl *)self->_scrubber pageNumber];

  [(THDocumentViewController *)self _updateScrubberCalloutForPageNumber:v4];
}

- (void)_updateScrubberCalloutForPageNumber:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) <= 0x7FFFFFFFFFFFFFFDLL)
  {
    id v5 = objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "navigationModel"), "contentNodeForAbsolutePageIndex:", a3 - 1);
    if (v5)
    {
      CFStringRef v6 = (const __CFString *)objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "navigationModel"), "titleStringForNavigationUnit:", objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "navigationModel"), "navigationUnitContainingContentNode:", v5));
      objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "navigationModel"), "pageCount");
      id v8 = [[objc_alloc((Class)NSString) initWithFormat:[THBundle localizedStringForKey:@"Page %@" value:&stru_46D7E8 table:0], +[NSNumberFormatter imaxLocalizedUnsignedInteger:usesGroupingSeparator:](NSNumberFormatter, "imaxLocalizedUnsignedInteger:usesGroupingSeparator:", a3, 0)];
      if (v6) {
        CFStringRef v7 = v6;
      }
      else {
        CFStringRef v7 = &stru_46D7E8;
      }
      [(-[THDocumentViewController scrubberCallout](self, "scrubberCallout")) title setText:v7];
      [(-[THDocumentViewController scrubberCallout](self, "scrubberCallout")) subtitle setText:v8];
    }
  }
}

- (void)scrubEnded:(id)a3
{
}

- (void)p_setDefaultScrubberCalloutFollowsThumbState
{
}

- (void)layoutScrubberCallout
{
  [self view].bounds;
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  UIUserInterfaceLayoutDirection v11 = [+[UIApplication sharedApplication] userInterfaceLayoutDirection];
  -[BKScrubberCalloutView sizeThatFits:]([(THDocumentViewController *)self scrubberCallout], "sizeThatFits:", CGSizeZero.width, CGSizeZero.height);
  double v13 = v12;
  double v46 = v14;
  [(THDocumentViewController *)self scrubberCalloutWidth];
  if (v15 > 0.0)
  {
    [(THDocumentViewController *)self scrubberCalloutWidth];
    double v13 = v16;
  }
  v48.origin.double x = v4;
  v48.origin.double y = v6;
  v48.size.double width = v8;
  v48.size.double height = v10;
  double v17 = CGRectGetMidX(v48) - v13 * 0.5;
  v49.origin.double x = v4;
  v49.origin.double y = v6;
  v49.size.double width = v8;
  v49.size.double height = v10;
  double MinY = CGRectGetMinY(v49);
  objc_super v19 = (char *)[(THDocumentReflowableLayoutConfiguration *)[(THDocumentViewController *)self configuration] layout];
  if ([(THDocumentViewController *)self scrubberCalloutFollowsScrollerThumb])
  {
    CGFloat rect = v10;
    id v20 = [(THDocumentViewController *)self view];
    [self->_scrubber.thumb frame];
    [v20 convertRect:[-[BKScrubberControl thumb](self->_scrubber, "thumb")] superview]
    if (v19 == (unsigned char *)&dword_0 + 2)
    {
      double v29 = CGRectGetMidY(*(CGRect *)&v25) + v46 * -0.5;
      v50.origin.double x = v4;
      v50.origin.double y = v6;
      v50.size.double width = v8;
      v50.size.double height = rect;
      double v30 = CGRectGetHeight(v50) + -5.0 - v46;
      if (v30 >= v29) {
        double v30 = v29;
      }
      if (v30 >= 5.0) {
        double MinY = v30;
      }
      else {
        double MinY = 5.0;
      }
    }
    else
    {
      double v31 = CGRectGetMidX(*(CGRect *)&v25) - v13 * 0.5;
      v51.origin.double x = v4;
      v51.origin.double y = v6;
      v51.size.double width = v8;
      v51.size.double height = rect;
      double v32 = CGRectGetWidth(v51) + -5.0 - v13;
      if (v32 >= v31) {
        double v32 = v31;
      }
      if (v32 >= 5.0) {
        double v17 = v32;
      }
      else {
        double v17 = 5.0;
      }
    }
  }
  if ([(THDocumentReflowableLayoutConfiguration *)[(THDocumentViewController *)self configuration] isScroll])
  {
    if ([(THDocumentViewController *)self scrubberCalloutFollowsScrollerThumb])
    {
      [(BKScrubberControl *)self->_scrubber frame];
      if (v11 == UIUserInterfaceLayoutDirectionRightToLeft)
      {
        double MaxX = CGRectGetMaxX(*(CGRect *)&v33);
        double v38 = 12.0;
      }
      else
      {
        double MaxX = CGRectGetMinX(*(CGRect *)&v33) - v13;
        double v38 = -12.0;
      }
      double v17 = MaxX + v38;
    }
    else
    {
      if (isPhone()) {
        double v39 = 24.0;
      }
      else {
        double v39 = 34.0;
      }
      [(THDocumentReflowableLayoutConfiguration *)[(THDocumentViewController *)self configuration] bottomRightToolbarFrame];
      double MinY = CGRectGetMinY(v53) - v46 + -1.0 - v39;
    }
  }
  else
  {
    [(BKScrubberControl *)self->_scrubber frame];
    double MinY = CGRectGetMinY(v52) - v46;
  }
  v54.origin.double x = v17;
  v54.origin.double y = MinY;
  v54.size.double width = v13;
  v54.size.double height = v46;
  CGRect v55 = CGRectIntegral(v54);
  double x = v55.origin.x;
  double y = v55.origin.y;
  double width = v55.size.width;
  double height = v55.size.height;
  v44 = [(THDocumentViewController *)self scrubberCallout];

  -[BKScrubberCalloutView setFrame:](v44, "setFrame:", x, y, width, height);
}

- (void)scrubberTouchDown:(id)a3
{
  [(THToolbarDelegate *)[(THDocumentViewController *)self toolbarDelegate] userWillInteractInToolbar];
  -[BKScrubberCalloutView setFrame:]([(THDocumentViewController *)self scrubberCallout], "setFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);

  [(THDocumentViewController *)self setIsScrubbing:1];
}

- (void)scrubberTouch:(id)a3 forEvent:(id)a4
{
  id v5 = [(BKScrubberControl *)self->_scrubber isTracking];

  [(THDocumentViewController *)self setScrubberCalloutVisible:v5];
}

- (BOOL)scrubberCalloutVisible
{
  [(BKScrubberCalloutView *)[(THDocumentViewController *)self scrubberCallout] alpha];
  return v2 == 1.0;
}

- (void)setScrubberCalloutVisible:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = (double)a3;
  [(BKScrubberCalloutView *)[(THDocumentViewController *)self scrubberCallout] alpha];
  if (v6 != v5)
  {
    double v7 = [(THDocumentViewController *)self scrubberCallout];
    if (v3)
    {
      [(BKScrubberCalloutView *)v7 setAlpha:1.0];
    }
    else
    {
      [(BKScrubberCalloutView *)v7 alpha];
      if (v8 == 1.0)
      {
        [(THToolbarDelegate *)[(THDocumentViewController *)self toolbarDelegate] userDidInteractInToolbar];
        v9[0] = _NSConcreteStackBlock;
        v9[1] = 3221225472;
        v9[2] = sub_F0E8;
        v9[3] = &unk_456DE0;
        v9[4] = self;
        +[UIView animateWithDuration:4 delay:v9 options:0 animations:0.2 completion:0.3];
      }
    }
    [(THDocumentViewController *)self _updateScrubberCalloutForPageNumber:[(BKScrubberControl *)self->_scrubber pageNumber]];
    [(THDocumentViewController *)self layoutScrubberCallout];
  }
  if (v3) {
    [(THToolbarDelegate *)[(THDocumentViewController *)self toolbarDelegate] userWillInteractInToolbar];
  }
}

- (void)willStartRevealTOC
{
}

- (void)startRevealTOC
{
  [(THDocumentViewController *)self setIsRevealingTOC:1];
  [(THOverscrollImageView *)[(THDocumentViewController *)self leftOverscrollView] setHidden:1];
  [(THOverscrollImageView *)[(THDocumentViewController *)self rightOverscrollView] setHidden:1];
  mPageViewDisplacement = self->mPageViewDisplacement;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_F1DC;
  v4[3] = &unk_456EB0;
  v4[4] = self;
  [(THPageViewDisplacement *)mPageViewDisplacement startRevealTOCWithPageIndex:[(THDocumentViewController *)self currentRelativePageIndex] enumerator:v4];
}

- (void)endRevealTOC
{
  if (![(THDocumentViewController *)self p_allowsPageDisplacement])
  {
    mPageViewDisplacement = self->mPageViewDisplacement;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_F424;
    v5[3] = &unk_456EB0;
    v5[4] = self;
    [(THPageViewDisplacement *)mPageViewDisplacement endRevealTOCWithEnumerator:v5];
  }
  [(THDocumentViewController *)self setIsRevealingTOC:0];
  uint64_t v4 = [(THDocumentViewController *)self p_canOverscroll] ^ 1;
  [(THOverscrollImageView *)[(THDocumentViewController *)self leftOverscrollView] setHidden:v4];
  [(THOverscrollImageView *)[(THDocumentViewController *)self rightOverscrollView] setHidden:v4];
}

- (void)updateTwoUpForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  BOOL isTwoUp = self->_isTwoUp;
  if ([(THDocumentViewController *)self isEpub]
    || ![(THBookPropertiesProvider *)[(THDocumentViewController *)self bookPropertiesDelegate] bookIsPaginatedForPortrait]|| width <= height|| width <= 1024.0|| [(THDocumentViewController *)self th_cachedIsCompactWidth]|| [(THDocumentViewController *)self th_cachedIsCompactHeight])
  {
    BOOL v7 = 0;
    uint64_t v8 = 1;
  }
  else
  {
    uint64_t v8 = 0;
    BOOL v7 = 1;
  }
  self->_BOOL isTwoUp = v7;
  if (isTwoUp)
  {
    [(THDocumentViewController *)self setTransitioningFromTwoUpToOneUp:v8];
    BOOL v9 = 0;
  }
  else
  {
    [(THDocumentViewController *)self setTransitioningFromTwoUpToOneUp:0];
    BOOL v9 = self->_isTwoUp;
  }

  [(THDocumentViewController *)self setTransitioningFromOneUpToTwoUp:v9];
}

- (void)changeFontSize:(unint64_t)a3
{
  -[THDocumentViewController setFlowSizeScale:](self, "setFlowSizeScale:");
  double v5 = [(THDocumentViewController *)self activeSectionController];
  [self interactiveCanvasController].visibleUnscaledRect;
  id v6 = -[THSectionController bodyAnchorForCanvasRect:](v5, "bodyAnchorForCanvasRect:");
  [+[THApplicationSettings sharedSettings](THApplicationSettings, "sharedSettings") flowFontScaleForFontSize:a3];
  [(THDocumentReflowableLayoutConfiguration *)[(THDocumentViewController *)self configuration] setOverrideFontSize:v7];
  if ([(THDocumentViewController *)self inFlowMode] && ![(THDocumentViewController *)self isEpub])
  {
    [self interactiveCanvasController].pushThreadedLayoutAndRenderDisabled;
    [self.interactiveCanvasController recreateAllLayoutsAndReps];
    [(THSectionController *)[(THDocumentViewController *)self activeSectionController] rectForBodyAnchor:v6];
    -[THDocumentViewController p_setUnscaledCanvasRect:](self, "p_setUnscaledCanvasRect:");
    [self interactiveCanvasController].layoutIfNeeded;
    [self interactiveCanvasController].popThreadedLayoutAndRenderDisabled;
    id v8 = +[CATransition animation];
    [v8 setType:kCATransitionFade];
    [v8 setDuration:0.150000006];
    id v9 = [self canvasScrollView].layer;
    [v9 addAnimation:v8 forKey:0];
  }
  else
  {
    [(THDocumentViewController *)self p_updatePresentationTypeAnimated:1];
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  if (self->mTapRecognizer != a3) {
    return 1;
  }
  id v6 = [a4 view];
  return v6 == [(THDocumentViewController *)self view];
}

- (void)tapGesture:(id)a3
{
  if (self->mTapRecognizer == a3
    && (objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "currentlyScrolling") & 1) == 0&& !self->mOverscrollAnimationInProcess)
  {
    [a3 locationInView:[self view]];
    double v6 = v5;
    CGFloat v8 = v7;
    [self view].bounds;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    [self view].bounds;
    CGFloat v18 = v17 / 3.0;
    v23.origin.double x = v10;
    v23.origin.double y = v12;
    v23.size.double width = v14;
    v23.size.double height = v16;
    CGRect v24 = CGRectInset(v23, 0.0, v18);
    double width = v24.size.width;
    v22.double x = v6;
    v22.double y = v8;
    if (CGRectContainsPoint(v24, v22))
    {
      [(THDocumentViewController *)self p_animateToNextPage:v6 >= width * 0.5];
    }
    else
    {
      [(THDocumentViewController *)self toggleToolbar];
    }
  }
}

- (BOOL)canGoToPreviousPage
{
  unsigned int v3 = [*(id *)&self->TSADocumentViewController_opaque[OBJC_IVAR___TSADocumentViewController__scrollView] isPagingEnabled];
  if (v3) {
    LOBYTE(v3) = [(THDocumentViewController *)self currentAbsolutePageIndex] != 0;
  }
  return v3;
}

- (BOOL)canGoToNextPage
{
  unsigned int v3 = [*(id *)&self->TSADocumentViewController_opaque[OBJC_IVAR___TSADocumentViewController__scrollView] isPagingEnabled];
  if (v3)
  {
    uint64_t v4 = (char *)[(THDocumentViewController *)self currentAbsolutePageIndex] + 1;
    LOBYTE(v3) = v4 < objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "navigationModel"), "pageCount");
  }
  return v3;
}

- (void)p_animateToNextPage:(BOOL)a3
{
  unsigned int v5 = [*(id *)&self->TSADocumentViewController_opaque[OBJC_IVAR___TSADocumentViewController__scrollView] isPagingEnabled];
  if (a3)
  {
    if (!v5) {
      return;
    }
    double v6 = (char *)[(THDocumentViewController *)self currentAbsolutePageIndex] + 1;
    if (v6 >= objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "navigationModel"), "pageCount"))return; {
    uint64_t v7 = 1;
    }
  }
  else
  {
    if (!v5 || ![(THDocumentViewController *)self currentAbsolutePageIndex]) {
      return;
    }
    uint64_t v7 = -1;
  }
  CGFloat v8 = (char *)[(THDocumentViewController *)self currentRelativePageIndex] + v7;
  if (v8 != (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    [(THDocumentViewController *)self p_dismissActiveAnimated:1];
    if ([(THDocumentViewController *)self p_allowsPageDisplacement])
    {
      mPageViewDisplacement = self->mPageViewDisplacement;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_FBA8;
      v11[3] = &unk_456EB0;
      v11[4] = self;
      [(THPageViewDisplacement *)mPageViewDisplacement animateFadeWithDuration:v8 forPageIndex:v11 enumerator:0.2];
    }
    if (v8 == (char *)-1)
    {
      [(THDocumentViewController *)self p_horizontalOverscrollPreviousChapter];
    }
    else if (v8 == (char *)[(THSectionController *)[(THDocumentViewController *)self activeSectionController] pageCount])
    {
      [(THDocumentViewController *)self p_horizontalOverscrollNextChapter];
    }
    else
    {
      id v10 = [(THDocumentViewController *)self interactiveCanvasController];
      if (a3) {
        [v10 pageRight];
      }
      else {
        [v10 pageLeft];
      }
    }
  }
}

- (void)p_updateProgressKitForNewNavigationUnit:(id)a3
{
  if (objc_msgSend(objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "navigationModel"), "navigationUnits"), "count"))
  {
    id v5 = objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "navigationModel"), "uniqueIdentifierForNavigationUnit:", a3);
    id v6 = objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "navigationModel"), "parentTitleForNavigationUnit:", a3);
    id v7 = objc_msgSend(objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "bookDescription"), "asset"), "assetID");
    id v8 = +[BCProgressKitController sharedController];
    [v8 activateChapterForBook:v7 chapterID:v5 title:v6 completion:0];
    [v8 deactivateCurrentWidgetForBook:v7 completion:0];
  }
}

- (void)p_updateProgessKitSectionInCanvasRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = [(THDocumentViewController *)self currentNavigationUnit];
  double v9 = [(THDocumentViewController *)self readingStatisticsDelegate];
  if (objc_msgSend(objc_msgSend(v8, "contentNodes"), "count") && v9)
  {
    id v10 = [(THDocumentViewController *)self currentPresentationType];
    id v11 = [(THDocumentViewController *)self interactiveCanvasController];
    id v12 = +[NSMutableArray array];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_FFD4;
    v13[3] = &unk_456ED8;
    *(double *)&v13[9] = x;
    *(double *)&v13[10] = y;
    *(double *)&v13[11] = width;
    *(double *)&v13[12] = height;
    v13[4] = self;
    v13[5] = v8;
    v13[6] = v10;
    v13[7] = v11;
    v13[8] = v12;
    objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "accessController"), "performRead:", v13);
    if ([v12 count]) {
      -[THReadingStatisticsDelegate documentViewController:bodyReps:visibleRectIs:](v9, "documentViewController:bodyReps:visibleRectIs:", self, v12, x, y, width, height);
    }
  }
}

- (void)p_getWidgetIDsForInfo:(id)a3 completion:(id)a4
{
  id v7 = [[self documentRoot] navigationModel];
  id v8 = objc_msgSend(objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "bookDescription"), "asset"), "assetID");
  double v9 = (void *)TSUProtocolCast();
  if (v9)
  {
    id v10 = v9;
    id v11 = [v9 progressKitID];
    id v12 = [v7 contentNodeForGUID:[v10 progressKitSectionID]];
  }
  else
  {
    id v11 = [[self currentContentNode] nodeUniqueIDForInfo:a3];
    unsigned int v13 = [(THDocumentViewController *)self inPaginatedMode];
    id v14 = [(THDocumentViewController *)self interactiveCanvasController];
    if (v13) {
      [v14 visibleUnscaledRect];
    }
    else {
      [v14 visibleUnscaledRectForContent];
    }
    TSDRoundedRect();
    id v12 = [-[THDocumentViewController currentNavigationUnit](self, "currentNavigationUnit") contentNodeForRelativePageIndex:forPresentationType: -[THSectionController relativePageRangeForCanvasRect:pad:](-[THDocumentViewController activeSectionController](self, "activeSectionController"), "relativePageRangeForCanvasRect:pad:", 0, v15, v16, v17, v18), -[THDocumentViewController currentPresentationType](self, "currentPresentationType")];
    [v12 nodeGUID];
  }
  id v19 = [v12 title];
  id v20 = [v7 navigationUnitContainingContentNode:v12];
  id v21 = [v7 uniqueIdentifierForNavigationUnit:v20];
  id v22 = [v7 parentTitleForNavigationUnit:v20];
  CGRect v23 = (void (*)(id, id, id, id, void, id, id))*((void *)a4 + 2);

  v23(a4, v8, v21, v22, 0, v19, v11);
}

- (void)p_activateProgressForRep:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10424;
  v3[3] = &unk_456F00;
  v3[4] = a3;
  v3[5] = self;
  -[THDocumentViewController p_getWidgetIDsForInfo:completion:](self, "p_getWidgetIDsForInfo:completion:", [a3 info], v3);
}

- (void)p_deactivateProgressForRep:(id)a3
{
  id v3 = objc_msgSend(objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot", a3), "bookDescription"), "asset"), "assetID");
  id v4 = +[BCProgressKitController sharedController];

  [v4 deactivateCurrentWidgetForBook:v3 completion:0];
}

- (void)p_buildContextTree
{
  id v3 = [[[self documentRoot] bookDescription] asset].assetID;
  id v4 = +[BCProgressKitController sharedController];
  if ([v4 isTrackingAssetID:v3])
  {
    global_queue = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_106B0;
    block[3] = &unk_456F28;
    block[4] = self;
    block[5] = v4;
    block[6] = v3;
    dispatch_async(global_queue, block);
  }
}

- (void)paginationController:(id)a3 paginationResultChanged:(id)a4 forContentNode:(id)a5 paginationProgress:(double)a6 paginationComplete:(BOOL)a7
{
  BOOL v7 = a7;
  if (-[THPresentationType isEqualIncludingSize:](-[THSectionController presentationType](-[THDocumentViewController paginatedSectionController](self, "paginatedSectionController", a3, a4, a5), "presentationType"), "isEqualIncludingSize:", [a4 presentationType]))
  {
    [(BKScrubberControl *)[(THDocumentViewController *)self scrubber] setProgress:a6];
    [(THDocumentViewController *)self p_updatePageNumberingForce:0];
    if (!v7)
    {
      if (![(THDocumentViewController *)self inFlowMode])
      {
        id v10 = [(THDocumentViewController *)self scrubber];
        [(BKScrubberControl *)v10 setHidden:0];
      }
      return;
    }
  }
  else if (!v7)
  {
    return;
  }
  id v11 = [(THDocumentViewController *)self paginationDelegate];

  [(THPaginationStatusDelegate *)v11 paginationDidComplete];
}

- (void)paginationController:(id)a3 paginationCompleteStateChangedTo:(BOOL)a4
{
  BOOL v4 = a4;
  if (a4)
  {
    [(THDocumentLinkResolver *)[(THDocumentViewController *)self documentLinkResolver] updatePaginationResults];
    objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "searchController"), "updatePaginationResults");
    dispatch_time_t v6 = dispatch_time(0, 500000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10AC8;
    block[3] = &unk_456DE0;
    block[4] = self;
    dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, block);
  }
  [(THPaginationStatusDelegate *)[(THDocumentViewController *)self paginationDelegate] documentViewController:self didChangePaginationStatus:!v4];
  [(THBookNavigation *)[(THDocumentViewController *)self bookNavigationDelegate] updateNavigationAffordances];
}

- (CGSize)pageSizeForPresentationType:(id)a3
{
  if ([(THDocumentViewController *)self isEpub]
    || [a3 isFlow]
    && [(THDocumentViewController *)self p_isCompactFlowPresentationForSectionController:[(THDocumentViewController *)self flowSectionController]])
  {
    [(THDocumentViewController *)self p_maxScrollViewSize];
    goto __THDocumentViewController_pageSizeForPresentationType__;
  }
  if ([a3 isPaginated])
  {
    BOOL v7 = [(THDocumentViewController *)self paginatedSectionController];
LABEL_11:
    [(THSectionController *)v7 pageSize];
    goto __THDocumentViewController_pageSizeForPresentationType__;
  }
  if ([(THDocumentViewController *)self activeSectionController])
  {
    BOOL v7 = [(THDocumentViewController *)self activeSectionController];
    goto LABEL_11;
  }
  [(THDocumentViewController *)self p_windowOrViewSize];

  +[THPagePositionController fixedPageSizeForLandscapeOrientation:v8 > v9];
__THDocumentViewController_pageSizeForPresentationType__:
  result.double height = v6;
  result.double width = v5;
  return result;
}

- (unint64_t)fontSizeForPresentationType:(id)a3
{
  if (![(THDocumentViewController *)self isEpub]) {
    return 0;
  }

  return [(THDocumentViewController *)self flowSizeScale];
}

- (int64_t)columnCountForPresentationType:(id)a3
{
  if (![(THDocumentViewController *)self isEpub]) {
    return 0;
  }
  BOOL v4 = [(THDocumentViewController *)self configuration];

  return [(THDocumentReflowableLayoutConfiguration *)v4 columnCount];
}

- (double)gutterWidthForPresentationType:(id)a3
{
  unsigned int v4 = [(THDocumentViewController *)self isEpub];
  double result = 0.0;
  if (v4)
  {
    [(THDocumentReflowableLayoutConfiguration *)[(THDocumentViewController *)self configuration] gutterWidth];
    double v7 = v6;
    [(-[THDocumentViewController configuration](self, "configuration")) environment].safeAreaInsets
    return v7 + v8;
  }
  return result;
}

- (UIEdgeInsets)contentInsetsForPresentationType:(id)a3
{
  double v5 = TSDEdgeInsetsZero[0];
  double v4 = TSDEdgeInsetsZero[1];
  double v6 = TSDEdgeInsetsZero[2];
  double v7 = TSDEdgeInsetsZero[3];
  if ([(THDocumentViewController *)self isEpub])
  {
    double v8 = [(THDocumentViewController *)self configuration];
    id v9 = [(THDocumentReflowableLayoutConfiguration *)v8 environment];
    [(THDocumentReflowableLayoutConfiguration *)v8 contentInsets];
    [v9 safeAreaInsets];
    UIEdgeInsetsAdd();
    [v9 safeAreaInsets];
    UIEdgeInsetsSubtract();
    double v4 = v10;
    double v6 = v11;
    double v7 = v12;
    double v5 = v13 + 4.0;
  }
  double v14 = v5;
  double v15 = v4;
  double v16 = v6;
  double v17 = v7;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (id)backgroundColorForDragUIPlatter
{
  v4[0] = [(THDocumentViewController *)self traitCollection];
  v4[1] = +[UITraitCollection traitCollectionWithUserInterfaceLevel:1];
  return [(-[THThemeDelegate theme](-[THDocumentViewController themeDelegate](self, "themeDelegate"), "theme")) backgroundColorForTraitCollection:+[UITraitCollection traitCollectionWithTraitsFromCollections:](UITraitCollection, "traitCollectionWithTraitsFromCollections:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v4, 2))];
}

- (BOOL)allowTouchOutsideCanvasView:(id)a3 forGesture:(id)a4
{
  return [(id)TSUProtocolCast() gestureKind] == (id)TSDFreeTransform;
}

- (BOOL)canvasViewController:(id)a3 enableSwipeGestureWithNumberOfTouches:(unint64_t)a4
{
  return a4 == 1;
}

- (BOOL)shouldAdjustContentFrameWhileRotating
{
  return 0;
}

- (CGSize)paginatedPageSize
{
  if ([(THDocumentViewController *)self paginatedSectionController])
  {
    id v3 = [(THDocumentViewController *)self paginatedSectionController];
    [(THSectionController *)v3 pageSize];
  }
  else
  {
    id v6 = objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "bookDescription"), "bookIsPaginatedForLandscape");
    +[THPagePositionController fixedPageSizeForLandscapeOrientation:v6];
  }
  result.double height = v5;
  result.double width = v4;
  return result;
}

- (CGSize)paginatedSpreadSize
{
  [(THDocumentViewController *)self paginatedPageSize];
  double v4 = v3;
  double v6 = v5;
  unsigned int v7 = [(THDocumentViewController *)self isTwoUp];
  double v8 = v4 + v4;
  if (!v7) {
    double v8 = v4;
  }
  double v9 = v6;
  result.double height = v9;
  result.double width = v8;
  return result;
}

- (CGSize)p_currentPageSize
{
  double v2 = [(THDocumentViewController *)self activeSectionController];

  [(THSectionController *)v2 pageSize];
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (CGSize)p_currentSpreadSize
{
  if ([(THDocumentViewController *)self activeSectionController]) {
    double v3 = [(THDocumentViewController *)self activeSectionController];
  }
  else {
    double v3 = [(THDocumentViewController *)self currentPresentationType];
  }
  [(THSectionController *)v3 pageSize];
  double v5 = v4;
  double v7 = v6;
  unsigned int v8 = [(THDocumentViewController *)self isTwoUp];
  double v9 = v5 + v5;
  if (!v8) {
    double v9 = v5;
  }
  double v10 = v7;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (CGRect)contentFrame
{
  v19.receiver = self;
  v19.super_class = (Class)THDocumentViewController;
  [(THDocumentViewController *)&v19 contentFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  if ([(THDocumentViewController *)self activeSectionController]
    && [(THDocumentViewController *)self inPaginatedMode])
  {
    [(THDocumentViewController *)self p_currentSpreadSize];
    TSDScaleSizeWithinSize();
    TSDRectWithSize();
    TSDCenterRectOverRect();
    objc_msgSend(objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "canvas"), "contentsScale");
    TSDRoundedPointForScale();
    double v4 = v11;
    double v6 = v12;
    TSDRoundedSizeForScale();
    double v8 = v13;
    double v10 = v14;
  }
  double v15 = v4;
  double v16 = v6;
  double v17 = v8;
  double v18 = v10;
  result.size.double height = v18;
  result.size.double width = v17;
  result.origin.double y = v16;
  result.origin.double x = v15;
  return result;
}

- (BOOL)preserveScrollViewClipping
{
  return 1;
}

- (void)p_updatePresentationTypeAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  [(THDocumentReflowableLayoutConfiguration *)[(THDocumentViewController *)self configuration] invalidate];
  [(THDocumentViewController *)self configuration];
  double v6 = objc_opt_class();
  [(THDocumentViewController *)self p_currentPageSize];
  -[THDocumentReflowableLayoutConfiguration setDisableContentSpreadPages:](-[THDocumentViewController configuration](self, "configuration"), "setDisableContentSpreadPages:", objc_msgSend(v6, "spreadPagesAllowedWithViewportSize:fontSizeIndex:", objc_msgSend(+[THApplicationSettings sharedSettings](THApplicationSettings, "sharedSettings"), "flowSizeScale"), v7, v8) ^ 1);
  id v9 = [[[self documentRoot] properties] paginatedPresentationType].copyFixingSize;
  if ([(THDocumentViewController *)self isEpub]
    && ![(THPresentationType *)[(THSectionController *)[(THDocumentViewController *)self paginatedSectionController] presentationType] isEqualIncludingSize:v9])
  {
    if (![(THDocumentViewController *)self lastStorageAnchor])
    {
      double v10 = [(THDocumentViewController *)self activeSectionController];
      [self interactiveCanvasController].visibleUnscaledRect;
      -[THDocumentViewController setLastStorageAnchor:](self, "setLastStorageAnchor:", -[THSectionController bodyAnchorForCanvasRect:](v10, "bodyAnchorForCanvasRect:"));
    }
    [self interactiveCanvasController].contentOffset;
    double v12 = v11;
    [self interactiveCanvasController].pushThreadedLayoutAndRenderDisabled;
    if (![(THDocumentViewController *)self inFlowMode])
    {
      [(THDocumentViewController *)self p_clearCanvas];
      [self interactiveCanvasController].layoutIfNeeded;
      [(THDocumentViewController *)self setPreventVisibleInfoUpdates:1];
    }
    [(THDocumentLinkResolver *)[(THDocumentViewController *)self documentLinkResolver] invalidatePaginationResults];
    objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "searchController"), "invalidatePaginationResults");
    [v9 pageSize];
    -[THPageViewProvider setPageSize:]([(THDocumentViewController *)self pageViewProvider], "setPageSize:", v13, v14);
    [(THReflowablePaginationController *)[(THDocumentViewController *)self reflowablePaginationController] setPresentationType:v9];
    [(THSectionController *)[(THDocumentViewController *)self paginatedSectionController] setPresentationType:v9];
    [v9 pageSize];
    double v16 = v15;
    [v9 pageSize];
    double v18 = v17;
    [(THDocumentViewController *)self viewHeaderHeight];
    -[THDocumentViewController p_resizeViewsForSize:duration:maintainPageIndex:](self, "p_resizeViewsForSize:duration:maintainPageIndex:", 0, v16, v18 + v19, 0.0);
    [(THReflowablePaginationController *)[(THDocumentViewController *)self reflowablePaginationController] paginate];
    if ([(THDocumentViewController *)self inFlowMode])
    {
      [self interactiveCanvasController] recreateAllLayoutsAndReps;
    }
    else
    {
      [(THDocumentViewController *)self setPreventVisibleInfoUpdates:0];
      [(THDocumentViewController *)self p_updateVisibleInfosWithPaddingOptions:[(THDocumentViewController *)self p_activePagePaddingOptions] force:1];
    }
    [(THSectionController *)[(THDocumentViewController *)self activeSectionController] rectForBodyAnchor:[(THDocumentViewController *)self lastStorageAnchor]];
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
    if ([(THDocumentViewController *)self inFlowMode]
      && v23 <= 20.0
      && [(THDocumentViewController *)self isEpub])
    {
      double v23 = 0.0;
    }
    -[THDocumentViewController p_setUnscaledCanvasRect:](self, "p_setUnscaledCanvasRect:", v21, v23, v25, v27);
    [self interactiveCanvasController].contentOffset;
    if (v12 != v28) {
      [(THDocumentViewController *)self setJustUpdatedPresentationType:1];
    }
    [self interactiveCanvasController] popThreadedLayoutAndRenderDisabled
    if (v3)
    {
      id v29 = +[CATransition animation];
      [v29 setType:kCATransitionFade];
      [v29 setDuration:0.15];
      objc_msgSend(objc_msgSend(-[THDocumentViewController canvasScrollView](self, "canvasScrollView"), "layer"), "addAnimation:forKey:", v29, 0);
    }
  }
}

- (void)p_layoutCanvasForSize:(CGSize)a3 duration:(double)a4 forceBackgroundLayout:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a3.height;
  double width = a3.width;
  self->mDisableContentOffsetClamping = 1;
  double v10 = [(THDocumentViewController *)self activeSectionController];
  if (v10 == [(THDocumentViewController *)self selectedSectionController])
  {
LABEL_28:
    [(THBookNavigation *)[(THDocumentViewController *)self bookNavigationDelegate] viewsDidResize];
    self->mDisableContentOffsetClamping = 0;
    return;
  }
  [(THDocumentViewController *)self setPreventVisibleInfoUpdates:1];
  double v11 = [(THDocumentViewController *)self orientationAnchor];
  if (v11)
  {
    double v12 = v11;
    double v13 = v11;
  }
  else
  {
    double v12 = [(THDocumentNavigator *)[(THDocumentViewController *)self documentNavigator] storageAnchorForCurrentPage];
  }
  if (a4 <= 0.0)
  {
    id v14 = 0;
  }
  else
  {
    id v14 = +[CATransition animation];
    [v14 setType:kCATransitionFade];
    [v14 setDuration:a4];
  }
  [self interactiveCanvasController].pushThreadedLayoutAndRenderDisabled;
  if ([(THDocumentViewController *)self inFlowMode])
  {
    [self canvasViewController].stopScrolling;
    [(THDocumentViewController *)self p_fixScrollViewToMatchCanvas];
    [(THDocumentViewController *)self p_removeCanvasTransform];
  }
  [(THDocumentViewController *)self p_setActiveSectionControllerDeferVantageDidChange:a4 > 0.0];
  if ([(THDocumentViewController *)self activeSectionController])
  {
    double v15 = [(THDocumentViewController *)self currentPresentationType];
    id v16 = [THPresentationType paginatedPresentationTypeInContext:[self documentRoot].context];
    if ([(THDocumentViewController *)self showingExpandedWidgetView]
      && [(THPresentationType *)v15 isEqual:v16])
    {
      id v17 = [(THDocumentViewController *)self p_canvasInfoForExpandedInfo:[(THWExpandedViewController *)[(THDocumentViewController *)self expandedViewController] expandedInfo] presentationType:v15];
      double v18 = [(THDocumentViewController *)self p_contentNodeForInfo:v17 presentationType:v15];
      id v19 = [(THModelContentNode *)v18 relativePageIndexForInfo:v17 forPresentationType:v15];
      id v20 = [self documentRoot].navigationModel;
      id v21 = v19;
      double v22 = v18;
    }
    else
    {
      objc_opt_class();
      uint64_t v23 = TSUDynamicCast();
      objc_opt_class();
      double v24 = (void *)TSUDynamicCast();
      unsigned int v25 = [(THPresentationType *)v15 isFlow];
      BOOL v26 = 0;
      if (v25 && v24) {
        BOOL v26 = [v24 range] == 0;
      }
      if (!v23 && !v26)
      {
        [(THSectionController *)[(THDocumentViewController *)self activeSectionController] rectForBodyAnchor:v24];
LABEL_22:
        double v32 = v27;
        double v33 = v28;
        double v34 = v29;
        double v35 = v30;
        [(THDocumentViewController *)self setPreventVisibleInfoUpdates:0];
        -[THDocumentViewController p_setUnscaledCanvasRect:](self, "p_setUnscaledCanvasRect:", v32, v33, v34, v35);
        -[THDocumentViewController setVisibleRelativePageRange:](self, "setVisibleRelativePageRange:", NSInvalidRange[0], NSInvalidRange[1]);
        [(THDocumentViewController *)self p_updateVisibleInfos];
        id v36 = [(THDocumentViewController *)self interactiveCanvasController];
        if (v5)
        {
          [v36 popThreadedLayoutAndRenderDisabled];
          [self interactiveCanvasController].forceBackgroundLayout;
        }
        else
        {
          [v36 layoutIfNeeded];
          [self interactiveCanvasController].popThreadedLayoutAndRenderDisabled;
        }
        [(THDocumentViewController *)self p_updateNavigationOverlayContainerFrame];
        -[THDocumentViewController p_updatePageNumberViewPositionsForSize:](self, "p_updatePageNumberViewPositionsForSize:", width, height);
        if (a4 > 0.0)
        {
          +[CATransaction begin];
          +[CATransaction setAnimationDuration:a4];
          v37[0] = _NSConcreteStackBlock;
          v37[1] = 3221225472;
          v37[2] = sub_1188C;
          v37[3] = &unk_456DE0;
          v37[4] = self;
          +[CATransaction setCompletionBlock:v37];
          objc_msgSend(objc_msgSend(-[THDocumentViewController canvasScrollView](self, "canvasScrollView"), "layer"), "addAnimation:forKey:", v14, 0);
          +[CATransaction commit];
        }
        [(THDocumentViewController *)self setOrientationAnchor:v12];
        goto LABEL_28;
      }
      id v31 = [[self documentRoot] navigationModel];
      double v22 = [(THModelBoundAnchor *)v12 contentNode];
      id v20 = v31;
      id v21 = 0;
    }
    -[THSectionController canvasRectForRelativePageIndex:](-[THDocumentViewController activeSectionController](self, "activeSectionController"), "canvasRectForRelativePageIndex:", [v20 navigationUnitRelativePageIndexForContentNodeRelativePageIndex:v21 inContentNode:v22 forPresentationType:v15]);
    goto LABEL_22;
  }
}

- (void)p_setupPageNumberViews
{
  if ([(THDocumentViewController *)self contentPageNumberView])
  {
    if ([(THDocumentViewController *)self contentPageNumberView]) {
      [-[THDocumentViewController view](self, "view") insertSubview:belowSubview: -[THDocumentViewController canvasScrollView](self, "canvasScrollView") -[THDocumentViewController contentPageNumberView](self, "contentPageNumberView")];
    }
  }
  else
  {
    self->mContentPageNumberView = -[THPageNumberView initWithPosition:]([THPageNumberView alloc], "initWithPosition:", CGPointZero.x, CGPointZero.y);
    [-[THDocumentViewController view](self, "view") insertSubview:aboveSubview:[self contentPageNumberView] aboveSubview:[self canvasScrollView]];
  }
  if (![(THDocumentViewController *)self navOverlayPageNumberView]) {
    self->mNavOverlayPageNumberView = -[THPageNumberView initWithPosition:]([THPageNumberView alloc], "initWithPosition:", CGPointZero.x, CGPointZero.y);
  }
  [self view].frame;

  -[THDocumentViewController p_updatePageNumberViewPositionsForSize:](self, "p_updatePageNumberViewPositionsForSize:", v3, v4);
}

- (void)p_setupNavOverlayContainer
{
  if (![(THDocumentViewController *)self navigationOverlayContainer])
  {
    self->mNavigationOverlayContainer = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    goto LABEL_5;
  }
  if ([(THDocumentViewController *)self navigationOverlayContainer]) {
LABEL_5:
  }
    [self.view insertSubview:[self navigationOverlayContainer] aboveSubview:[self contentPageNumberView]];

  [(THDocumentViewController *)self p_updateNavigationOverlayContainerFrame];
}

- (BOOL)p_updateScrollViewClipsToBounds
{
  uint64_t v3 = OBJC_IVAR___TSADocumentViewController__scrollView;
  unsigned __int8 v4 = [*(id *)&self->TSADocumentViewController_opaque[OBJC_IVAR___TSADocumentViewController__scrollView] clipsToBounds];
  if ([(THDocumentViewController *)self p_allowsPinchZoom]) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = [(THDocumentViewController *)self p_allowsPageDisplacement] ^ 1;
  }
  [*(id *)&self->TSADocumentViewController_opaque[v3] setClipsToBounds:v5];
  return v4 ^ v5;
}

- (CGRect)p_contentFrameFrameForSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  remainder.origin = CGPointZero;
  remainder.CGSize size = a3;
  [(THDocumentViewController *)self viewHeaderHeight];
  if (v6 > 0.0)
  {
    CGFloat v7 = v6;
    CGSize size = CGRectZero.size;
    v24.origin = CGRectZero.origin;
    v24.CGSize size = size;
    CGFloat x = remainder.origin.x;
    size.CGFloat width = remainder.origin.y;
    CGFloat v10 = width;
    CGFloat v11 = height;
    CGRectDivide(*(CGRect *)((char *)&size - 8), &v24, &remainder, v7, CGRectMinYEdge);
  }
  if ([(THDocumentViewController *)self activeSectionController]
    && [(THDocumentViewController *)self inPaginatedMode])
  {
    [(THDocumentViewController *)self p_currentSpreadSize];
    TSDScaleSizeWithinSize();
    TSDRectWithSize();
    TSDCenterRectOverRect();
    remainder.origin.CGFloat x = v12;
    remainder.origin.double y = v13;
    remainder.size.CGFloat width = v14;
    remainder.size.CGFloat height = v15;
    objc_msgSend(objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "canvas"), "contentsScale");
    TSDRoundedPointForScale();
    remainder.origin.CGFloat x = v16;
    remainder.origin.double y = v17;
    TSDRoundedSizeForScale();
    remainder.size.CGFloat width = v18;
    remainder.size.CGFloat height = v19;
  }
  double v20 = remainder.origin.x;
  double y = remainder.origin.y;
  double v22 = remainder.size.width;
  double v23 = remainder.size.height;
  result.size.CGFloat height = v23;
  result.size.CGFloat width = v22;
  result.origin.double y = y;
  result.origin.CGFloat x = v20;
  return result;
}

- (void)p_adjustContentViewFrameForSize:(CGSize)a3
{
  -[THDocumentViewController p_contentFrameFrameForSize:](self, "p_contentFrameFrameForSize:", a3.width, a3.height);
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  uint64_t v12 = OBJC_IVAR___TSADocumentViewController__scrollView;
  [*(id *)&self->TSADocumentViewController_opaque[OBJC_IVAR___TSADocumentViewController__scrollView] frame];
  float v14 = v13;
  [*(id *)&self->TSADocumentViewController_opaque[v12] frame];
  v22.origin.CGFloat x = v15;
  v22.origin.double y = v16;
  v22.size.CGFloat width = v17;
  v22.size.CGFloat height = v18;
  v21.origin.CGFloat x = v5;
  v21.origin.double y = v7;
  v21.size.CGFloat width = v9;
  v21.size.CGFloat height = v11;
  if (!CGRectEqualToRect(v21, v22)) {
    [*(id *)&self->TSADocumentViewController_opaque[v12] setFrame:v5, v7, v9, v11];
  }
  objc_msgSend(objc_msgSend(objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "layerHost"), "canvasLayer"), "adjustContentInsets");
  [self interactiveCanvasController].invalidateVisibleBounds;
  if (v11 != v14
    && [(THDocumentViewController *)self shouldAutoscrollToSelectionOnContentViewSizeChange]&& v11 < v14)
  {
    id v19 = [(THDocumentViewController *)self interactiveCanvasController];
    [v19 setShouldAutoscrollToSelectionAfterLayout:1];
  }
}

- (void)p_updateScrollViewForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  long long v6 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v40[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v40[1] = v6;
  v40[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  uint64_t v7 = OBJC_IVAR___TSADocumentViewController__scrollView;
  [*(id *)&self->TSADocumentViewController_opaque[OBJC_IVAR___TSADocumentViewController__scrollView] setTransform:v40];
  -[THDocumentViewController p_adjustContentViewFrameForSize:](self, "p_adjustContentViewFrameForSize:", width, height);
  [*(id *)&self->TSADocumentViewController_opaque[v7] setPagingEnabled:[self shouldPagingBeEnabled]];
  [(THDocumentViewController *)self p_updateScrollViewClipsToBounds];
  if ([(THDocumentViewController *)self configuration])
  {
    [(THDocumentReflowableLayoutConfiguration *)[(THDocumentViewController *)self configuration] scrubberFrame];
    CGFloat x = CGRectZero.origin.x;
    CGFloat y = CGRectZero.origin.y;
    CGFloat v14 = CGRectZero.size.width;
    CGFloat v15 = CGRectZero.size.height;
  }
  else
  {
    CGFloat x = CGRectZero.origin.x;
    CGFloat y = CGRectZero.origin.y;
    CGFloat v14 = CGRectZero.size.width;
    CGFloat v15 = CGRectZero.size.height;
    CGFloat v11 = v15;
    CGFloat v10 = v14;
    CGFloat v9 = y;
    CGFloat v8 = CGRectZero.origin.x;
  }
  BOOL v16 = CGRectEqualToRect(*(CGRect *)&v8, *(CGRect *)&x);
  CGFloat v17 = *(void **)&self->TSADocumentViewController_opaque[v7];
  if (v16)
  {
    [v17 frame];
    CGFloat v36 = v19;
    CGFloat v37 = v18;
    CGFloat rect = v20;
    CGFloat v22 = v21;
    [self view].frame
    CGFloat v24 = v23;
    CGFloat v26 = v25;
    CGFloat v28 = v27;
    CGFloat v30 = v29;
    CGFloat v35 = v29;
    [*(id *)&self->TSADocumentViewController_opaque[v7] setShowsHorizontalScrollIndicator:1];
    [*(id *)&self->TSADocumentViewController_opaque[v7] setShowsVerticalScrollIndicator:1];
    v41.origin.CGFloat x = v24;
    v41.origin.CGFloat y = v26;
    v41.size.double width = v28;
    v41.size.double height = v30;
    double MinY = CGRectGetMinY(v41);
    v42.origin.CGFloat x = v37;
    v42.origin.CGFloat y = rect;
    v42.size.double width = v36;
    v42.size.double height = v22;
    double v38 = MinY - CGRectGetMinY(v42);
    v43.origin.CGFloat x = v37;
    v43.origin.CGFloat y = rect;
    v43.size.double width = v36;
    v43.size.double height = v22;
    double MaxY = CGRectGetMaxY(v43);
    v44.origin.CGFloat x = v24;
    v44.origin.CGFloat y = v26;
    v44.size.double width = v28;
    v44.size.double height = v35;
    double v33 = MaxY - CGRectGetMaxY(v44);
    v45.origin.CGFloat x = v37;
    v45.origin.CGFloat y = rect;
    v45.size.double width = v36;
    v45.size.double height = v22;
    double MaxX = CGRectGetMaxX(v45);
    v46.origin.CGFloat x = v24;
    v46.origin.CGFloat y = v26;
    v46.size.double width = v28;
    v46.size.double height = v35;
    [*(id *)&self->TSADocumentViewController_opaque[v7] setScrollIndicatorInsets:v38, 0.0, v33, MaxX - CGRectGetMaxX(v46)];
  }
  else
  {
    [v17 setShowsHorizontalScrollIndicator:0];
    [*(id *)&self->TSADocumentViewController_opaque[v7] setShowsVerticalScrollIndicator:0];
  }
}

- (void)p_ensureVisibleAbsolutePhysicalPageIndexFromFullscreen
{
  if (![(THDocumentViewController *)self showingExpandedWidgetView])
  {
    if ([(THDocumentViewController *)self lastAbsolutePageIndex] == 0x7FFFFFFFFFFFFFFFLL) {
      unint64_t v12 = [(THDocumentViewController *)self currentAbsolutePageIndex];
    }
    else {
      unint64_t v12 = [(THDocumentViewController *)self lastAbsolutePageIndex];
    }
    id v14 = (id)v12;
    [(THDocumentViewController *)self setLastAbsolutePageIndex:0x7FFFFFFFFFFFFFFFLL];
    if (v14 == (id)0x7FFFFFFFFFFFFFFFLL) {
      return;
    }
LABEL_21:
    CGFloat v15 = [(THDocumentViewController *)self documentNavigator];
    [(THDocumentNavigator *)v15 setVisibleAbsolutePhysicalPageIndex:v14];
    return;
  }
  id v21 = [THPresentationType paginatedPresentationTypeInContext:[self documentRoot] context];
  id v3 = [(THDocumentViewController *)self p_canvasInfoForExpandedInfo:[(THWExpandedViewController *)[(THDocumentViewController *)self expandedViewController] expandedInfo] presentationType:v21];
  if (![(THDocumentViewController *)self isEpub])
  {
    if ([(THDocumentViewController *)self inFlowMode])
    {
      id v13 = [(THDocumentViewController *)self expandableRepForInfo:v3];
      if (v13)
      {
        [v13 frameInUnscaledCanvas];
        -[THDocumentViewController p_setUnscaledCanvasRect:](self, "p_setUnscaledCanvasRect:");
        return;
      }
    }
    id v16 = [(THDocumentViewController *)self p_contentNodeForInfo:v3 presentationType:v21];
    if (!v16) {
      return;
    }
    id v14 = objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "navigationModel"), "absolutePageIndexForContentNodeRelativePageIndex:inContentNode:forPresentationType:", objc_msgSend(v16, "relativePageIndexForInfo:forPresentationType:", v3, v21), v16, v21);
    [self interactiveCanvasController].viewScale;
    double v18 = v17;
    [(THDocumentViewController *)self zoomedOutViewScale];
    if (vabdd_f64(v18, v19) >= 0.00999999978
      && (id)[(THDocumentViewController *)self currentAbsolutePageIndex] == v14)
    {
      return;
    }
    goto LABEL_21;
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = [self currentNavigationUnit].contentNodes;
  id v4 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v28;
LABEL_5:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v28 != v5) {
        objc_enumerationMutation(obj);
      }
      uint64_t v7 = *(void **)(*((void *)&v27 + 1) + 8 * v6);
      uint64_t v23 = 0;
      CGFloat v24 = &v23;
      uint64_t v25 = 0x2020000000;
      char v26 = 0;
      id v8 = [v7 bodyStorageForPresentationType:v21];
      uint64_t v9 = objc_opt_class();
      id v10 = [v8 range];
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_1234C;
      v22[3] = &unk_456F50;
      v22[4] = v3;
      v22[5] = self;
      v22[6] = v7;
      v22[7] = &v23;
      [v8 enumerateAttachmentsOfClass:v9 inTextRange:v10 usingBlock:v11];
      LODWORD(v7) = *((unsigned __int8 *)v24 + 24);
      _Block_object_dispose(&v23, 8);
      if (v7) {
        break;
      }
      if (v4 == (id)++v6)
      {
        id v4 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v4) {
          goto LABEL_5;
        }
        return;
      }
    }
  }
}

- (void)p_resizeViewsForSize:(CGSize)a3 duration:(double)a4 maintainPageIndex:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a3.height;
  double width = a3.width;
  -[THDocumentViewController updateTwoUpForSize:](self, "updateTwoUpForSize:");
  [(THDocumentViewController *)self p_releaseOverscrollViews];
  -[THDocumentViewController p_layoutCanvasForSize:duration:forceBackgroundLayout:](self, "p_layoutCanvasForSize:duration:forceBackgroundLayout:", 0, width, height, a4);
  [(THDocumentViewController *)self p_dismissActiveAnimated:1];
  [(THDocumentViewController *)self p_setupPageNumberViews];
  [(THDocumentViewController *)self p_setupNavOverlayContainer];
  -[THDocumentViewController p_updateScrollViewAndZoomSettingsForSize:](self, "p_updateScrollViewAndZoomSettingsForSize:", width, height);
  [(THDocumentViewController *)self zoomOutAnimated:0];
  [(THDocumentViewController *)self p_updatePageNumberingForce:1];
  if (v5) {
    [(THDocumentViewController *)self p_ensureVisibleAbsolutePhysicalPageIndexFromFullscreen];
  }

  [(THDocumentViewController *)self p_setupOverscrollViews];
}

- (BOOL)disableRotationEdgeClip
{
  return self->mExpandedViewController == 0;
}

- (void)p_dismissActiveAnimated:(BOOL)a3
{
  if ([(TSWPopoverController *)self->mPopUpPopoverController shouldDismissWhileRotating:self->mIsRotating])
  {
    [(TSWPopoverController *)self->mPopUpPopoverController dismissPopoverAnimated:0];
  }
  objc_opt_class();
  objc_msgSend(objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "editorController"), "textInputEditor");
  [(id)TSUDynamicCast() dismissActivePopovers];
  id v4 = [(THDocumentViewController *)self interactiveCanvasController];

  [v4 endEditing];
}

- (id)currentNavigationUnit
{
  double v2 = [(THDocumentViewController *)self activeSectionController];

  return [(THSectionController *)v2 currentNavigationUnit];
}

- (void)setCurrentNavigationUnit:(id)a3
{
  if ([(THDocumentViewController *)self currentNavigationUnit] != a3)
  {
    [(THDocumentViewController *)self p_releaseOverscrollViews];
    [(THDocumentViewController *)self p_clearCanvas];
    [(THSectionController *)[(THDocumentViewController *)self paginatedSectionController] setCurrentNavigationUnit:a3];
    [(THSectionController *)[(THDocumentViewController *)self flowSectionController] setCurrentNavigationUnit:a3];
    if (![(THDocumentViewController *)self isEpub]) {
      -[THToolbarDelegate setCenterTitle:](-[THDocumentViewController toolbarDelegate](self, "toolbarDelegate"), "setCenterTitle:", objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "navigationModel"), "titleStringForNavigationUnit:", a3));
    }
    if ([(THDocumentViewController *)self activeSectionController]
      || ([(THDocumentViewController *)self p_setActiveSectionControllerDeferVantageDidChange:0], [(THDocumentViewController *)self activeSectionController]))
    {
      if ([(THDocumentViewController *)self inFlowMode]) {
        [(THDocumentViewController *)self p_updateVisibleInfos];
      }
      [(THDocumentViewController *)self p_windowOrViewSize];
      -[THDocumentViewController p_updateScrollViewAndZoomSettingsForSize:](self, "p_updateScrollViewAndZoomSettingsForSize:");
      [(THDocumentViewController *)self zoomOutAnimated:0];
      [(THDocumentViewController *)self navigationUnitDidChange:a3];
      [(THDocumentViewController *)self p_updateProgressKitForNewNavigationUnit:a3];
      [(THDocumentViewController *)self p_setupOverscrollViews];
    }
  }
}

- (void)setCurrentNavigationUnit:(id)a3 withRelativePageIndex:(unint64_t)a4 animated:(BOOL)a5
{
  -[THDocumentViewController setCurrentNavigationUnit:](self, "setCurrentNavigationUnit:", a3, a4, a5);
  [(THSectionController *)[(THDocumentViewController *)self activeSectionController] canvasRectForRelativePageIndex:a4];
  -[THDocumentViewController p_setUnscaledCanvasRect:](self, "p_setUnscaledCanvasRect:");
  uint64_t v7 = [(THDocumentViewController *)self documentNavigator];

  [(THDocumentNavigator *)v7 setVisitedPagesAfterOpening:1];
}

- (void)navigationUnitDidChange:(id)a3
{
  [(THBookNavigation *)[(THDocumentViewController *)self bookNavigationDelegate] navigationUnitDidChange:a3];
  id v4 = [(THDocumentViewController *)self documentNavigator];

  [(THDocumentNavigator *)v4 setVisitedPagesAfterOpening:1];
}

- (void)recordOutgoingMajorNavigationJump
{
  double v2 = [(THDocumentViewController *)self bookNavigationDelegate];

  [(THBookNavigation *)v2 recordOutgoingMajorNavigationJump];
}

- (void)viewsDidResize
{
  double v2 = [(THDocumentViewController *)self bookNavigationDelegate];

  [(THBookNavigation *)v2 viewsDidResize];
}

- (void)recordCurrentLocationInHistory
{
  double v2 = [(THDocumentViewController *)self bookNavigationDelegate];

  [(THBookNavigation *)v2 recordCurrentLocationInHistory];
}

- (void)updateNavigationAffordances
{
  double v2 = [(THDocumentViewController *)self bookNavigationDelegate];

  [(THBookNavigation *)v2 updateNavigationAffordances];
}

- (unint64_t)currentChapter
{
  id v3 = objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "navigationModel"), "navigationUnits");
  if (!v3) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  id v4 = v3;
  if (![(THDocumentViewController *)self currentNavigationUnit]) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  id v5 = [(THDocumentViewController *)self currentNavigationUnit];

  return (unint64_t)[v4 indexOfObjectIdenticalTo:v5];
}

- (unint64_t)currentLesson
{
  if (!objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "navigationModel"), "navigationUnits")|| !-[THDocumentViewController currentNavigationUnit](self, "currentNavigationUnit")|| !-[THDocumentViewController currentContentNode](self, "currentContentNode"))
  {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  id v3 = [[self currentNavigationUnit] contentNodes];
  id v4 = [(THDocumentViewController *)self currentContentNode];

  return (unint64_t)[v3 indexOfObjectIdenticalTo:v4];
}

- (unint64_t)currentTOCLessonIndex
{
  if (!objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "navigationModel"), "navigationUnits"))return 0x7FFFFFFFFFFFFFFFLL; {
  if (![(THDocumentViewController *)self currentNavigationUnit])
  }
    return 0x7FFFFFFFFFFFFFFFLL;
  if (![(THDocumentViewController *)self currentContentNode]) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = [[self currentNavigationUnit:0] contentNodes];
  id v4 = (char *)[v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (!v4) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  id v5 = v4;
  uint64_t v6 = 0;
  uint64_t v7 = *(void *)v13;
  while (2)
  {
    id v8 = 0;
    uint64_t v9 = &v5[(void)v6];
    do
    {
      if (*(void *)v13 != v7) {
        objc_enumerationMutation(v3);
      }
      id v10 = *(id *)(*((void *)&v12 + 1) + 8 * (void)v8);
      if (v10 == [(THDocumentViewController *)self currentContentNode]) {
        return (unint64_t)&v8[(void)v6];
      }
      ++v8;
    }
    while (v5 != v8);
    id v5 = (char *)[v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    unint64_t result = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v6 = v9;
    if (v5) {
      continue;
    }
    break;
  }
  return result;
}

- (CGRect)canvasPreviewFrameForDocumentManager
{
  id v2 = [(THDocumentViewController *)self interactiveCanvasController];

  [v2 visibleUnscaledRect];
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

- (BOOL)inFlowMode
{
  id v2 = [(THDocumentViewController *)self currentPresentationType];

  return [(THPresentationType *)v2 isFlow];
}

- (BOOL)isUpdatingVisibleViewController
{
  return 0;
}

- (BOOL)inPaginatedMode
{
  id v2 = [(THDocumentViewController *)self currentPresentationType];

  return [(THPresentationType *)v2 isPaginated];
}

- (BOOL)shouldPagingBeEnabled
{
  id v3 = [[self canvasViewController] canvasLayer];
  BOOL v4 = [(THDocumentViewController *)self inPaginatedMode];
  if (v4)
  {
    if ([v3 allowsPinchZoom])
    {
      [v3 viewScale];
      double v6 = v5;
      [v3 minimumPinchViewScale];
      LOBYTE(v4) = vabdd_f64(v6, v7) < 0.00999999978;
    }
    else
    {
      LOBYTE(v4) = 1;
    }
  }
  return v4;
}

- (double)currentViewScale
{
  id v2 = [(THDocumentViewController *)self interactiveCanvasController];

  [v2 viewScale];
  return result;
}

- (double)zoomedInViewScale
{
  id v2 = [self canvasViewController].canvasLayer;

  [v2 maximumPinchViewScale];
  return result;
}

- (double)zoomedOutViewScale
{
  id v2 = [[self canvasViewController] canvasLayer];

  [v2 minimumPinchViewScale];
  return result;
}

- (double)fitWidthViewScale
{
  [(THDocumentViewController *)self p_currentSpreadSize];
  double v4 = v3;
  [(THDocumentViewController *)self p_maxScrollViewSize];
  return v5 / v4;
}

- (double)fitHeightViewScale
{
  [(THDocumentViewController *)self p_currentSpreadSize];
  double v4 = v3;
  [(THDocumentViewController *)self p_maxScrollViewSize];
  return v5 / v4;
}

- (BOOL)minimizeLayoutPadding
{
  return self->_minimizeLayoutPadding > 0;
}

- (void)pushMinimizeLayoutPadding
{
}

- (void)popMinimizeLayoutPadding
{
  int64_t minimizeLayoutPadding = self->_minimizeLayoutPadding;
  if (minimizeLayoutPadding >= 1) {
    self->_int64_t minimizeLayoutPadding = --minimizeLayoutPadding;
  }
  if (!minimizeLayoutPadding
    && [(THDocumentViewController *)self interactiveCanvasController])
  {
    [(THDocumentViewController *)self p_updateVisibleInfos];
  }
}

- (void)setPerformanceModeBookOpening:(BOOL)a3
{
  if (self->_performanceModeBookOpening != a3)
  {
    self->_performanceModeBookOpening = a3;
    [(THDocumentViewController *)self p_performanceModeUpdated];
  }
}

- (void)p_performanceModeUpdated
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = objc_msgSend(objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController", 0), "canvas"), "topLevelReps");
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * i) recursivelyPerformSelector:"performanceModeChanged"];
      }
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
  [self interactiveCanvasController invalidateReps];
  [self interactiveCanvasController].invalidateLayers;
}

- (int)performanceMode
{
  return self->_performanceModeBookOpening;
}

- (void)validateCommand:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)THDocumentViewController;
  -[THDocumentViewController validateCommand:](&v9, "validateCommand:");
  id v5 = (const char *)[a3 action];
  if (sel_isEqual(v5, "books_toggleContinuousScroll:"))
  {
    uint64_t v6 = [(THDocumentReflowableLayoutConfiguration *)[(THDocumentViewController *)self configuration] isScroll];
LABEL_5:
    [a3 setState:v6];
    return;
  }
  if (sel_isEqual(v5, "books_disableContinuousScroll:"))
  {
    uint64_t v6 = [(THDocumentReflowableLayoutConfiguration *)[(THDocumentViewController *)self configuration] isScroll] ^ 1;
    goto LABEL_5;
  }
  if (sel_isEqual(v5, "books_enableContinuousScroll:"))
  {
    [a3 setState:[-[THDocumentViewController configuration](self, "configuration") isScroll]];
    double v7 = (void *)THBundle();
    CFStringRef v8 = @"Vertical Scrolling";
  }
  else if (sel_isEqual(v5, "books_chapterLeft:"))
  {
    double v7 = (void *)THBundle();
    CFStringRef v8 = @"Previous Chapter";
  }
  else
  {
    if (!sel_isEqual(v5, "books_chapterRight:")) {
      return;
    }
    double v7 = (void *)THBundle();
    CFStringRef v8 = @"Next Chapter";
  }
  [a3 setTitle:[v7 localizedStringForKey:v8 value:&stru_46D7E8 table:0]];
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)THDocumentViewController;
  unsigned int v6 = [(THDocumentViewController *)&v9 canPerformAction:a3 withSender:a4];
  if (sel_isEqual(a3, "copy:"))
  {
    if (v6) {
      return [(THDocumentViewController *)self canCopy];
    }
    return 0;
  }
  if (sel_isEqual(a3, "books_toggleContinuousScroll:")
    || sel_isEqual(a3, "books_disableContinuousScroll:")
    || sel_isEqual(a3, "books_enableContinuousScroll:"))
  {
    if (v6) {
      return [(THDocumentViewController *)self isEpub];
    }
    return 0;
  }
  if (sel_isEqual(a3, "books_addHighlight:"))
  {
    if (v6) {
      return [self interactiveCanvasController] canAddHighlight;
    }
    return 0;
  }
  BOOL isEqual = sel_isEqual(a3, "books_addNote:");
  if ((isEqual & v6) == 1) {
    return [self interactiveCanvasController] canAddNote];
  }
  else {
    return v6 & ~isEqual;
  }
}

- (void)copy:(id)a3
{
}

- (void)books_toggleContinuousScroll:(id)a3
{
  if ([(THDocumentReflowableLayoutConfiguration *)[(THDocumentViewController *)self configuration] isScroll])
  {
    [(THDocumentViewController *)self books_disableContinuousScroll:a3];
  }
  else
  {
    [(THDocumentViewController *)self books_enableContinuousScroll:a3];
  }
}

- (void)books_disableContinuousScroll:(id)a3
{
}

- (void)books_enableContinuousScroll:(id)a3
{
}

- (void)changeAnnotationStyle:(id)a3
{
  id v4 = [(THDocumentViewController *)self interactiveCanvasController];

  [v4 changeAnnotationStyle:a3];
}

- (void)removeNoteAndHighlight:(id)a3
{
  id v4 = [(THDocumentViewController *)self interactiveCanvasController];

  [v4 removeNoteAndHighlight:a3];
}

- (void)addNote:(id)a3
{
}

- (void)removeNote:(id)a3
{
  id v4 = [(THDocumentViewController *)self interactiveCanvasController];

  [v4 removeNote:a3];
}

- (void)books_addHighlight:(id)a3
{
  id v4 = [(THDocumentViewController *)self interactiveCanvasController];

  [v4 addHighlight:a3];
}

- (void)books_addNote:(id)a3
{
  id v4 = [(THDocumentViewController *)self interactiveCanvasController];

  [v4 addNote:a3];
}

- (void)books_pageForward:(id)a3
{
  id v3 = [(THDocumentViewController *)self interactiveCanvasController];

  [v3 navigateToNextPage];
}

- (void)books_pageBackward:(id)a3
{
  id v3 = [(THDocumentViewController *)self interactiveCanvasController];

  [v3 navigateToPreviousPage];
}

- (void)books_chapterLeft:(id)a3
{
}

- (void)books_chapterRight:(id)a3
{
}

- (void)books_chapterForward:(id)a3
{
  id v3 = [(THDocumentViewController *)self interactiveCanvasController];

  [v3 navigateToNextChapter];
}

- (void)books_chapterBackward:(id)a3
{
  id v3 = [(THDocumentViewController *)self interactiveCanvasController];

  [v3 navigateToPreviousChapter];
}

- (BOOL)p_isCompactFlowPresentation
{
  if (![(THDocumentViewController *)self compactFlowPresentationState])
  {
    if ([(THDocumentViewController *)self paginatedSectionController])
    {
      id v3 = [(THDocumentViewController *)self activeSectionController];
      if (v3 == [(THDocumentViewController *)self flowSectionController])
      {
        uint64_t v4 = 1;
        if (![(THDocumentViewController *)self th_cachedIsCompactWidth])
        {
          if ([(THDocumentViewController *)self th_cachedIsCompactHeight]) {
            uint64_t v4 = 1;
          }
          else {
            uint64_t v4 = 2;
          }
        }
      }
      else
      {
        uint64_t v4 = 2;
      }
    }
    else
    {
      uint64_t v4 = 1;
    }
    [(THDocumentViewController *)self setCompactFlowPresentationState:v4];
  }
  return [(THDocumentViewController *)self compactFlowPresentationState] == 1;
}

- (BOOL)p_isCompactFlowPresentationForSectionController:(id)a3
{
  if ([(THDocumentViewController *)self activeSectionController] == a3)
  {
    return [(THDocumentViewController *)self p_isCompactFlowPresentation];
  }
  else
  {
    if (![(THDocumentViewController *)self paginatedSectionController]) {
      return 1;
    }
    if ([(THDocumentViewController *)self flowSectionController] != a3) {
      return 0;
    }
    if (![(THDocumentViewController *)self th_cachedIsCompactWidth])
    {
      return [(THDocumentViewController *)self th_cachedIsCompactHeight];
    }
    else
    {
      return 1;
    }
  }
}

- (id)selectedSectionController
{
  if (self->_flowSectionController
    && (![(THDocumentViewController *)self paginatedSectionController]
     || [(THDocumentViewController *)self showFlowModeIfAvailable]))
  {
    return [(THDocumentViewController *)self flowSectionController];
  }
  else
  {
    return [(THDocumentViewController *)self paginatedSectionController];
  }
}

- (void)toggleFlowPresentation
{
  if (self->_flowSectionController)
  {
    if ([(THDocumentViewController *)self showFlowModeIfAvailable])
    {
      [(THDocumentViewController *)self p_setPagedPresentation];
    }
    else
    {
      [(THDocumentViewController *)self p_setFlowPresentation];
    }
  }
}

- (void)p_setFlowPresentation
{
  if (![(THDocumentViewController *)self showFlowModeIfAvailable])
  {
    [(THDocumentViewController *)self setShowFlowModeIfAvailable:1];
    [(THDocumentViewController *)self p_presentationStyleChanged];
  }
}

- (void)p_setPagedPresentation
{
  if ([(THDocumentViewController *)self showFlowModeIfAvailable])
  {
    [(THDocumentViewController *)self setShowFlowModeIfAvailable:0];
    [(THDocumentViewController *)self p_presentationStyleChanged];
  }
}

- (void)p_presentationStyleChanged
{
  id v3 = +[NSUserDefaults standardUserDefaults];
  if ([(THDocumentViewController *)self showFlowModeIfAvailable]) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = 1;
  }
  [(NSUserDefaults *)v3 setInteger:v4 forKey:THDocumentLayoutKey];
  [(THDocumentViewController *)self setLastAbsolutePageIndex:[(THDocumentViewController *)self currentAbsolutePageIndex]];
  [self view].frame;
  -[THDocumentViewController p_resizeViewsForSize:duration:maintainPageIndex:](self, "p_resizeViewsForSize:duration:maintainPageIndex:", 1, v5, v6, 0.25);
  [(THDocumentViewController *)self p_resetPageDisplacment];
  [(THDocumentViewController *)self p_updateWidgetInteractionMode];
  [(THDocumentViewController *)self p_updateScrubberCheckToolbarState:1];
  double v7 = [(THDocumentViewController *)self guidedPanController];

  [(THGuidedPanController *)v7 setTarget:0];
}

- (void)p_setActiveSectionControllerDeferVantageDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(THDocumentViewController *)self selectedSectionController];
  if ([(THDocumentViewController *)self activeSectionController] != v5)
  {

    self->_configuration = 0;
    if ([(THDocumentViewController *)self activeSectionController]
      && ![(THPresentationType *)[(THSectionController *)[(THDocumentViewController *)self activeSectionController] presentationType] isEqual:[(THSectionController *)v5 presentationType]])
    {
      [(THBookNavigation *)[(THDocumentViewController *)self bookNavigationDelegate] vantageWillChangeBy:self reason:@"THVantageChangeReasonPresentationMode"];
      int v6 = 0;
    }
    else
    {
      int v6 = 1;
    }
    [(THDocumentViewController *)self setActiveSectionController:v5];
    [(THDocumentViewController *)self setCompactFlowPresentationState:0];
    double v7 = +[UIColor clearColor];
    unsigned __int8 v8 = [(THPresentationType *)[(THDocumentViewController *)self currentPresentationType] isFlow];
    if ((v8 & 1) != 0 || [(THDocumentViewController *)self isEpub]) {
      double v7 = [[-[THDocumentViewController themeDelegate](self, "themeDelegate") theme] backgroundColorForTraitEnvironment:self];
    }
    objc_msgSend(objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "canvasView"), "setBackgroundColor:", v7);
    if (![(THDocumentViewController *)self isEpub])
    {
      if ((v8 & 1) == 0) {
        double v7 = +[UIColor clearColor];
      }
      [self view].backgroundColor = v7;
    }
    if (objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "isCorrupt"))
    {
      [(THDocumentViewController *)self corruptBookAlert];
      [(THDocumentViewController *)self setActiveSectionController:0];
    }
    else
    {
      [(THDocumentViewController *)self p_updateScrollViewDecelerationRate];
      [self interactiveCanvasController].createRepsForOffscreenLayouts = [self inPaginatedMode];
      [self interactiveCanvasController].recreateAllLayoutsAndReps;
      [(THDocumentViewController *)self p_updateCanvasSize];
      if (((v6 | v3) & 1) == 0)
      {
        objc_super v9 = [(THDocumentViewController *)self bookNavigationDelegate];
        [(THBookNavigation *)v9 vantageDidChangeBy:self reason:@"THVantageChangeReasonPresentationMode"];
      }
    }
  }
}

- (CGSize)p_desiredCanvasSize
{
  [(THSectionController *)[(THDocumentViewController *)self activeSectionController] preferredCanvasSize];
  double v4 = v3;
  double v6 = v5;
  if ([(THDocumentViewController *)self inFlowMode])
  {
    [(THDocumentViewController *)self p_currentSpreadSize];
    if (v6 < v7) {
      double v6 = v7;
    }
  }
  double v8 = v4;
  double v9 = v6;
  result.double height = v9;
  result.double width = v8;
  return result;
}

- (void)p_updateCanvasSize
{
  [(THDocumentViewController *)self p_desiredCanvasSize];
  double v4 = v3;
  double v6 = v5;
  objc_msgSend(objc_msgSend(objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "layerHost"), "canvasLayer"), "unscaledSize");
  BOOL v9 = v8 == v4 && v7 == v6;
  if (!v9 && !self->mOverscrollAnimationInProcess)
  {
    self->mPreventScrollViewDidScrollReentrance = 1;
    objc_msgSend(objc_msgSend(objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "layerHost"), "canvasLayer"), "setUnscaledSize:", v4, v6);
    self->mPreventScrollViewDidScrollReentrance = 0;
    [(THDocumentViewController *)self p_setupOverscrollViews];
  }
}

- (CGSize)p_maxScrollViewSizeForViewSize:(CGSize)a3
{
  double height = a3.height;
  CGFloat width = a3.width;
  [(THDocumentViewController *)self viewHeaderHeight];
  double v6 = height - v5;
  double v7 = width;
  result.double height = v6;
  result.CGFloat width = v7;
  return result;
}

- (CGSize)p_maxScrollViewSize
{
  [(THDocumentViewController *)self p_windowOrViewSize];

  -[THDocumentViewController p_maxScrollViewSizeForViewSize:](self, "p_maxScrollViewSizeForViewSize:");
  result.double height = v4;
  result.CGFloat width = v3;
  return result;
}

- (CGSize)p_windowOrViewSize
{
  id v2 = [(THDocumentViewController *)self view];
  id v3 = [v2 window];
  if (v3) {
    [v3 bounds];
  }
  else {
    [v2 frame];
  }
  double v6 = v4;
  double v7 = v5;
  result.double height = v7;
  result.CGFloat width = v6;
  return result;
}

- (void)zoomOutAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(THDocumentViewController *)self activeSectionController])
  {
    objc_msgSend(objc_msgSend(-[THDocumentViewController canvasViewController](self, "canvasViewController"), "canvasLayer"), "minimumPinchViewScale");
    double v6 = v5;
    [self interactiveCanvasController].contentOffset;
    [self.interactiveCanvasController setViewScale:1 contentOffset:v3 clampOffset:v6 animated:v7];
    if (!v3)
    {
      [(THDocumentViewController *)self p_canvasDidZoom];
    }
  }
}

- (void)zoomOutIfNecessaryPriorToNavigation
{
  if ([(THDocumentViewController *)self interactiveCanvasControllerShouldAllowZoomToColumn:[(THDocumentViewController *)self interactiveCanvasController]]|| [(THDocumentViewController *)self p_allowsPinchZoom])
  {
    [(THDocumentViewController *)self zoomOutAnimated:0];
  }
}

- (void)zoomOutIfNecessaryAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v5 = a3;
  [(THDocumentViewController *)self currentViewScale];
  double v8 = v7;
  [(THDocumentViewController *)self zoomedOutViewScale];
  if (vabdd_f64(v8, v9) < 0.00999999978
    || ([(THDocumentViewController *)self currentViewScale],
        double v11 = v10,
        [(THDocumentViewController *)self zoomedOutViewScale],
        v11 <= v12))
  {
    if (a4)
    {
      long long v13 = (void (*)(id))*((void *)a4 + 2);
      v13(a4);
    }
  }
  else
  {
    [(THDocumentViewController *)self setCanvasDidZoomCompletion:a4];
    [(THDocumentViewController *)self zoomOutAnimated:v5];
  }
}

- (BOOL)p_allowsPinchZoom
{
  id v3 = [self canvasViewController].canvasLayer;
  if ([(THDocumentViewController *)self th_cachedIsCompactWidth]
    || (BOOL v4 = [(THDocumentViewController *)self th_cachedIsCompactHeight]))
  {
    [v3 minimumPinchViewScale];
    double v6 = v5;
    [v3 maximumPinchViewScale];
    if (vabdd_f64(v6, v7) >= 0.00999999978) {
      LOBYTE(v4) = ![(THDocumentViewController *)self p_isCompactFlowPresentation];
    }
    else {
      LOBYTE(v4) = 0;
    }
  }
  return v4;
}

- (BOOL)p_allowsPageDisplacement
{
  id v3 = [(THDocumentViewController *)self activeSectionController];
  if (v3)
  {
    if ([(THDocumentViewController *)self inFlowMode])
    {
      LOBYTE(v3) = 0;
    }
    else
    {
      [(THDocumentViewController *)self p_currentSpreadSize];
      double v5 = v4;
      double v7 = v6;
      [(THDocumentViewController *)self p_windowOrViewSize];
      LOBYTE(v3) = 0;
      if (v5 > 0.0 && v8 > 0.0) {
        LOBYTE(v3) = v7 / v5 > v9 / v8;
      }
    }
  }
  return (char)v3;
}

- (void)p_updateScrollViewAndZoomSettingsForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  -[THDocumentViewController p_updateScrollViewForSize:](self, "p_updateScrollViewForSize:");
  [(THDocumentViewController *)self p_currentSpreadSize];
  double v7 = v6;
  -[THDocumentViewController p_maxScrollViewSizeForViewSize:](self, "p_maxScrollViewSizeForViewSize:", width, height);
  double v9 = v8;
  [*(id *)&self->TSADocumentViewController_opaque[OBJC_IVAR___TSADocumentViewController__scrollView] bounds];
  double v11 = v10;
  if ([(THDocumentViewController *)self inFlowMode]) {
    double v12 = v9;
  }
  else {
    double v12 = v11;
  }
  double v13 = v12 / v7;
  if ([(THDocumentViewController *)self p_isCompactFlowPresentation]) {
    double v13 = 1.0;
  }
  id v14 = [[self canvasViewController] canvasLayer];
  [v14 setShowsScaleFeedback:0];
  [v14 setMinimumPinchViewScale:v13];
  [v14 setMaximumPinchViewScale:1.0];
  [v14 setAllowsPinchZoom:[self p_allowsPinchZoom]];

  [(THDocumentViewController *)self p_updateScrollViewClipsToBounds];
}

- (CGRect)shadowBoundsForCanvasExitTransformDelegate:(id)a3
{
  if ([(THDocumentViewController *)self isTwoUp]
    && objc_msgSend(-[THDocumentViewController currentNavigationUnit](self, "currentNavigationUnit"), "pageCountForPresentationType:", -[THDocumentViewController currentPresentationType](self, "currentPresentationType")) == (char *)&dword_0 + 1)
  {
    id v4 = [(-[THDocumentViewController pageViewProvider](self, "pageViewProvider")) pageHostForAbsolutePageIndex:(-[THDocumentViewController currentAbsolutePageIndex](self, "currentAbsolutePageIndex"))].view;
  }
  else
  {
    id v4 = *(id *)&self->TSADocumentViewController_opaque[OBJC_IVAR___TSADocumentViewController__scrollView];
  }

  [v4 bounds];
  result.size.double height = v8;
  result.size.double width = v7;
  result.origin.CGFloat y = v6;
  result.origin.CGFloat x = v5;
  return result;
}

- (CGRect)rectForRelativePageIndex:(unint64_t)a3 chapterIndex:(unint64_t)a4
{
  double v6 = [(char *)[self navigationUnitForChapterIndex:a4] pageCountForPresentationType:[self currentPresentationType]];
  if ([(THDocumentViewController *)self isTwoUp])
  {
    double v7 = v6 - 1;
    if (v7)
    {
      [*(id *)&self->TSADocumentViewController_opaque[OBJC_IVAR___TSADocumentViewController__scrollView] frame];
      double v12 = v24;
      double v14 = v25;
      double v16 = v23 * 0.5;
      double v26 = -0.0;
      if (v7 == (char *)a3) {
        double v26 = v23 * 0.5;
      }
      double v18 = v22 + v26;
    }
    else
    {
      uint64_t v8 = OBJC_IVAR___TSADocumentViewController__scrollView;
      [*(id *)&self->TSADocumentViewController_opaque[OBJC_IVAR___TSADocumentViewController__scrollView] frame];
      double v10 = v9;
      double v12 = v11;
      double v14 = v13;
      double v16 = v15 * 0.5;
      [*(id *)&self->TSADocumentViewController_opaque[v8] frame];
      double v18 = v10 + (v17 - v16) * 0.5;
    }
  }
  else
  {
    [*(id *)&self->TSADocumentViewController_opaque[OBJC_IVAR___TSADocumentViewController__scrollView] frame];
    double v12 = v19;
    double v16 = v20;
    double v14 = v21;
  }
  double v27 = v12;
  double v28 = v16;
  double v29 = v14;
  result.size.double height = v29;
  result.size.double width = v28;
  result.origin.CGFloat y = v27;
  result.origin.CGFloat x = v18;
  return result;
}

- (BOOL)isLastPageInChapterForRelativePageIndex:(unint64_t)a3 chapterIndex:(unint64_t)a4
{
  return [self navigationUnitForChapterIndex:a4] pageCountForPresentationType:[self currentPresentationType]- 1 == (unsigned char *)a3;
}

- (BOOL)p_isSinglePageChapter
{
  unint64_t v3 = [(THDocumentViewController *)self currentChapter];

  return [(THDocumentViewController *)self isSinglePageChapterForChapterIndex:v3];
}

- (BOOL)isSinglePageChapterForChapterIndex:(unint64_t)a3
{
  return a3 != 0x7FFFFFFFFFFFFFFFLL
      && [self navigationUnitForChapterIndex:[self currentPresentationType]] == (char *)&dword_0 + 1;
}

- (_NSRange)currentRelativePageIndexRange
{
  unint64_t v3 = [(THDocumentViewController *)self currentRelativePageIndex];
  if ([(THDocumentViewController *)self isTwoUp])
  {
    if ((unint64_t)[self currentNavigationUnit].pageCountForPresentationType:[self currentPresentationType] <= 1)NSUInteger v4 = 1; {
    else
    }
      NSUInteger v4 = 2;
  }
  else
  {
    NSUInteger v4 = 1;
  }
  NSUInteger v5 = v3;
  result.length = v4;
  result.location = v5;
  return result;
}

- (void)sectionControllerNeedsLayout:(id)a3
{
  if ([(THDocumentViewController *)self activeSectionController] == a3)
  {
    id v4 = [(THDocumentViewController *)self interactiveCanvasController];
    [v4 layoutInvalidated];
  }
}

- (BOOL)displaySinglePageChapterSeparately:(id)a3
{
  return 1;
}

- (id)layoutControllerForSectionController:(id)a3
{
  id v3 = [(THDocumentViewController *)self interactiveCanvasController];

  return [v3 layoutController];
}

- (BOOL)allowsDescendersToClipForSectionController:(id)a3
{
  return ![(THDocumentViewController *)self isEpub];
}

- (BOOL)shouldScaleFlowLayoutsForSectionController:(id)a3
{
  return ![(THDocumentViewController *)self isEpub];
}

- (void)sectionControllerInfosDidChange:(id)a3
{
  if ([(THDocumentViewController *)self activeSectionController] == a3)
  {
    uint64_t v4 = [(THDocumentViewController *)self p_activePagePaddingOptions];
    [(THDocumentViewController *)self p_updateVisibleInfosWithPaddingOptions:v4 force:1];
  }
}

- (unint64_t)currentAbsolutePageIndex
{
  if ([(THDocumentViewController *)self reflowablePaginationController]
    && ![(THReflowablePaginationController *)[(THDocumentViewController *)self reflowablePaginationController] paginationComplete]|| ![(THDocumentViewController *)self documentNavigator])
  {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  id v3 = [(THDocumentViewController *)self documentNavigator];

  return [(THDocumentNavigator *)v3 currentAbsolutePageIndex];
}

- (unint64_t)currentRelativePageIndex
{
  id v2 = [(THDocumentViewController *)self documentNavigator];

  return [(THDocumentNavigator *)v2 currentNavigationUnitRelativePageIndex];
}

- (THPresentationType)currentPresentationType
{
  _NSRange result = [(THSectionController *)[(THDocumentViewController *)self activeSectionController] presentationType];
  if (!result)
  {
    if ([(THDocumentViewController *)self showFlowModeIfAvailable]
      && objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "properties"), "flowPresentationType"))
    {
      id v4 = [self documentRoot].properties;
      return (THPresentationType *)[v4 flowPresentationType];
    }
    else
    {
      id v5 = [[self documentRoot] properties];
      return (THPresentationType *)[v5 defaultPresentationType];
    }
  }
  return result;
}

- (void)p_visiblePageRangeWillChangeTo:(_NSRange)a3
{
  if ((id)a3.location != NSInvalidRange[0] || a3.length != (void)NSInvalidRange[1])
  {
    id v5 = [[-[THDocumentViewController currentNavigationUnit](self, "currentNavigationUnit") contentNodesSurroundingRelativePageRange:a3.location forPresentationType:a3.length -[THDocumentViewController currentPresentationType](self, "currentPresentationType")];
    id v6 = [(THDocumentViewController *)self visibleRelativePageRange];
    if (v6 != NSInvalidRange[0] || v7 != NSInvalidRange[1])
    {
      id v9 = [(THDocumentViewController *)self currentNavigationUnit];
      id v10 = [(THDocumentViewController *)self visibleRelativePageRange];
      id v5 = [v5 tsu_arrayByRemovingObjectsIdenticalToObjectsInArray:[v9 contentNodesSurroundingRelativePageRange:v10 forPresentationType:v11]];
    }
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v20;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(obj);
          }
          double v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          [v15 startLoading];
          v18[0] = 0;
          v18[1] = v18;
          v18[2] = 0x3052000000;
          v18[3] = sub_14724;
          v18[4] = sub_14734;
          v18[5] = self;
          v17[0] = _NSConcreteStackBlock;
          v17[1] = 3221225472;
          v17[2] = sub_14744;
          v17[3] = &unk_456FB8;
          v17[4] = v18;
          [v15 performWhenFinishedLoading:&stru_456F90 onError:v17];
          _Block_object_dispose(v18, 8);
        }
        id v12 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v12);
    }
  }
}

- (int)p_activePagePaddingOptions
{
  if (![(THDocumentViewController *)self inPaginatedMode]
    || [(THDocumentViewController *)self minimizeLayoutPadding])
  {
    return 0;
  }

  return [(THDocumentViewController *)self pagePaddingOptions];
}

- (void)p_updateVisibleInfos
{
  uint64_t v3 = [(THDocumentViewController *)self p_activePagePaddingOptions];

  [(THDocumentViewController *)self p_updateVisibleInfosWithPaddingOptions:v3 force:0];
}

- (void)p_updateVisibleInfosWithPaddingOptions:(int)a3 force:(BOOL)a4
{
  uint64_t v5 = *(void *)&a3;
  if (objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "isCorrupt"))
  {
    [(THDocumentViewController *)self corruptBookAlert];
  }
  else
  {
    if (![(THDocumentViewController *)self interactiveCanvasController]) {
      [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentViewController p_updateVisibleInfosWithPaddingOptions:force:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentViewController.mm") lineNumber:3527 description:@"can't update visible page infos without a interactive canvas controller"];
    }
    if ([(THDocumentViewController *)self activeSectionController]
      && [(THDocumentViewController *)self currentNavigationUnit])
    {
      if ([(THDocumentViewController *)self inFlowMode]) {
        unsigned int v7 = 0;
      }
      else {
        unsigned int v7 = [(THSpinnerProvider *)[(THDocumentViewController *)self spinnerProvider] setupLoadSpinner];
      }
      if (![(THDocumentViewController *)self preventVisibleInfoUpdates])
      {
        unsigned int v8 = [(THDocumentViewController *)self inPaginatedMode];
        id v9 = [(THDocumentViewController *)self interactiveCanvasController];
        if (v8) {
          [v9 visibleUnscaledRect];
        }
        else {
          [v9 visibleUnscaledRectForContent];
        }
        TSDRoundedRect();
        double v11 = v10;
        double v13 = v12;
        double v15 = v14;
        double v17 = v16;
        id v18 = -[THSectionController relativePageRangeForCanvasRect:pad:]([(THDocumentViewController *)self activeSectionController], "relativePageRangeForCanvasRect:pad:", v5, v10, v12, v14, v16);
        uint64_t v20 = v19;
        if (a4
          || [(THDocumentViewController *)self visibleRelativePageRange] != v18
          || v24 != v20)
        {
          -[THDocumentViewController p_visiblePageRangeWillChangeTo:](self, "p_visiblePageRangeWillChangeTo:", v18, v20);
          id v21 = -[THSectionController infosToDisplayForRelativePageRange:forceLoad:]([(THDocumentViewController *)self activeSectionController], "infosToDisplayForRelativePageRange:forceLoad:", v18, v20, [(THDocumentViewController *)self firstLoad]);
          [(THDocumentViewController *)self setFirstLoad:0];
          long long v22 = [(THDocumentViewController *)self pageViewProvider];
          if ([(THDocumentViewController *)self inFlowMode]) {
            id v23 = 0;
          }
          else {
            id v23 = v21;
          }
          [(THPageViewProvider *)v22 updateWithInfosToDisplay:v23];
          [self interactiveCanvasController].setInfosToDisplay:v21;
          -[THDocumentViewController setVisibleRelativePageRange:](self, "setVisibleRelativePageRange:", v18, v20);
        }
        -[THDocumentViewController p_updateProgessKitSectionInCanvasRect:](self, "p_updateProgessKitSectionInCanvasRect:", v11, v13, v15, v17);
      }
      if (v7) {
        [(THSpinnerProvider *)[(THDocumentViewController *)self spinnerProvider] hideLoadSpinner];
      }
      if (![(THDocumentViewController *)self inFlowMode])
      {
        [(THDocumentViewController *)self p_updateCanvasSize];
      }
    }
  }
}

- (CGSize)pageSizeForPagePositionController:(id)a3
{
  if ([a3 pageHorizontally])
  {
    if (![(THDocumentViewController *)self paginatedSectionController]) {
      [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THDocumentViewController pageSizeForPagePositionController:]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentViewController.mm"] lineNumber:3579 description:@"invalid nil value for '%s'", "self.paginatedSectionController"];
    }
    id v4 = [(THDocumentViewController *)self paginatedSectionController];
  }
  else
  {
    if ([(THDocumentViewController *)self p_isCompactFlowPresentationForSectionController:[(THDocumentViewController *)self flowSectionController]])
    {
      [(THDocumentViewController *)self p_maxScrollViewSize];
      goto LABEL_11;
    }
    if (![(THDocumentViewController *)self flowSectionController]) {
      [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THDocumentViewController pageSizeForPagePositionController:]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentViewController.mm"] lineNumber:3590 description:@"invalid nil value for '%s'", "self.flowSectionController"];
    }
    id v4 = [(THDocumentViewController *)self flowSectionController];
  }
  [(THPresentationType *)[(THSectionController *)v4 presentationType] pageSize];
LABEL_11:
  if (CGSizeZero.width == v5 && CGSizeZero.height == v6)
  {
    [(THDocumentViewController *)self p_maxScrollViewSize];
  }
  result.double height = v6;
  result.double width = v5;
  return result;
}

- (void)p_willLayoutCanvasPaginated:(id)a3
{
  if (![(THDocumentViewController *)self inPaginatedMode]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentViewController p_willLayoutCanvasPaginated:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentViewController.mm") lineNumber:3609 description:@"should be doing paginated layout"];
  }
  double v5 = [(THDocumentViewController *)self activeSectionController];
  id v6 = [a3 infosToDisplay];
  id v7 = [a3 layoutController];

  [(THSectionController *)v5 ensureSectionInfosLaidOut:v6 layoutController:v7];
}

- (void)p_willLayoutCanvasFlow:(id)a3
{
  if (![(THDocumentViewController *)self inFlowMode]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentViewController p_willLayoutCanvasFlow:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentViewController.mm") lineNumber:3616 description:@"should be doing flow layout"];
  }
  if (CGRectIsNull(self->mScrollTargetRect))
  {
    if (!self->mLayoutAnchor)
    {
      double v5 = [(THDocumentViewController *)self activeSectionController];
      [a3 contentOffset];
      self->mLayoutAnchor = (THFlowLayoutAnchor *)[(THSectionController *)v5 layoutAnchorForContentOffset:"layoutAnchorForContentOffset:"];
    }
    id v6 = [(THDocumentViewController *)self activeSectionController];
    mLayoutAnchor = self->mLayoutAnchor;
    [a3 visibleHeight];
    double v9 = 2048.0;
    if (v8 + v8 >= 2048.0)
    {
      [a3 visibleHeight];
      double v9 = v10 + v10;
    }
    [a3 visibleHeight];
    double v12 = 2048.0;
    if (v11 + v11 >= 2048.0)
    {
      [a3 visibleHeight];
      double v12 = v13 + v13;
    }
    -[THSectionController layoutContentAtLayoutAnchor:padAbove:padBelow:layoutController:](v6, "layoutContentAtLayoutAnchor:padAbove:padBelow:layoutController:", mLayoutAnchor, [a3 layoutController], v9, v12);
    if (self->mLayoutAnchor)
    {
      if (![(THDocumentViewController *)self inFlowMode]) {
        [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentViewController p_willLayoutCanvasFlow:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentViewController.mm") lineNumber:3629 description:@"layout anchor is only supported in flow"];
      }
      [(THFlowLayoutAnchor *)self->mLayoutAnchor deltaFromOriginalOffset];
      double v15 = v14;
      [(THDocumentViewController *)self currentViewScale];
      self->mCanvasYOffset = self->mCanvasYOffset - v15 * v16;
      id v17 = objc_msgSend(objc_msgSend(a3, "layerHost"), "canvasLayer");
      [(THDocumentViewController *)self p_desiredCanvasSize];
      [v17 setUnscaledSizeOnLayer:];
      CGAffineTransformMakeTranslation(&v20, 0.0, self->mCanvasYOffset);
      id v18 = objc_msgSend(objc_msgSend(a3, "layerHost"), "canvasLayer");
      CGAffineTransform v19 = v20;
      [v18 setAffineTransform:&v19];
      [a3 visibleBoundsRect];
      if (CGRectIsEmpty(v21)) {
        [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THDocumentViewController p_willLayoutCanvasFlow:]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentViewController.mm"] lineNumber:3641 description:@"visible rect is empty after transforming canvas"];
      }
      [(THDocumentViewController *)self p_updateVerticalOverscrollTransform];
    }
  }
}

- (void)interactiveCanvasControllerWillLayout:(id)a3
{
  if ((objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "isCorrupt") & 1) == 0
    && objc_msgSend(objc_msgSend(a3, "infosToDisplay"), "count"))
  {
    if (![(THDocumentViewController *)self activeSectionController]) {
      [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentViewController interactiveCanvasControllerWillLayout:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentViewController.mm") lineNumber:3652 description:@"can't layout without a section controller"];
    }
    if ([(THDocumentViewController *)self inPaginatedMode]) {
      [(THDocumentViewController *)self p_willLayoutCanvasPaginated:a3];
    }
    else {
      [(THDocumentViewController *)self p_willLayoutCanvasFlow:a3];
    }
  }

  self->mLayoutAnchor = 0;
}

- (void)p_fireCanvasDidZoomCompletion
{
  if ([(THDocumentViewController *)self canvasDidZoomCompletion])
  {
    uint64_t v3 = (void (**)(void))[(THDocumentViewController *)self canvasDidZoomCompletion];
    [(THDocumentViewController *)self setCanvasDidZoomCompletion:0];
    v3[2]();
  }
}

- (void)p_interactiveCanvasControllerDidLayout
{
  if ([(THDocumentViewController *)self inFlowMode]) {
    [(THDocumentViewController *)self p_setupOverscrollViews];
  }

  [(THDocumentViewController *)self p_fadeOutOverscrollTransition];
}

- (void)interactiveCanvasControllerDidLayout:(id)a3
{
  [(THDocumentViewController *)self performSelectorOnMainThread:"p_interactiveCanvasControllerDidLayout" withObject:0 waitUntilDone:0];
  [(THPageViewProvider *)[(THDocumentViewController *)self pageViewProvider] canvasDidLayout];
  if ([(THDocumentViewController *)self inFlowMode] && CGRectIsNull(self->mScrollTargetRect))
  {
    if (self->mLayoutAnchor) {
      [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentViewController interactiveCanvasControllerDidLayout:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentViewController.mm") lineNumber:3702 description:@"shouldn't have saved off a layout anchor during layout"];
    }
    if (([a3 currentlyWaitingOnThreadedLayoutAndRender] & 1) == 0)
    {
      [(THDocumentViewController *)self p_fixScrollViewToMatchCanvas];
      if (([a3 currentlyScrolling] & 1) == 0)
      {
        [(THDocumentViewController *)self p_removeCanvasTransform];
      }
    }
  }
}

- (BOOL)tappedCanvasBackgroundAtPoint:(CGPoint)a3
{
  return 1;
}

- (BOOL)zoomOnSelectionChange:(id)a3
{
  return 0;
}

- (void)interactiveCanvasController:(id)a3 scrollViewWillBeginDragging:(id)a4
{
  [a3 contentOffset];
  -[THDocumentViewController setBeginDraggingContentOffset:](self, "setBeginDraggingContentOffset:");
  mPopUpPopoverController = self->mPopUpPopoverController;
  if (mPopUpPopoverController)
  {
    [(TSWPopoverController *)mPopUpPopoverController dismissPopoverAnimated:1];
  }
}

- (BOOL)interactiveCanvasController:(id)a3 allowsDragOfSmartField:(id)a4
{
  objc_opt_class();
  id v4 = (void *)TSUDynamicCast();
  if (v4)
  {
    double v5 = v4;
    id v6 = objc_msgSend(objc_msgSend(objc_msgSend(v4, "url"), "scheme"), "length");
    if (v6) {
      LOBYTE(v6) = [[[v5 url] scheme] isEqualToString:@"x-ibooks-th"] ^ 1;
    }
  }
  else
  {
    LOBYTE(v6) = 1;
  }
  return (char)v6;
}

- (void)p_swipeToNextOffsetForScrollView:(id)a3 flowPageController:(id)a4 withVelocity:(CGPoint)a5 targetContentOffset:(CGPoint *)a6
{
  double y = a5.y;
  id v10 = [a4 contentNode:a3 x:a5.x];
  [a4 desiredPageSizeForRelativePageIndex:0];
  double v12 = v11;
  double v14 = v13;
  [(THSectionController *)[(THDocumentViewController *)self activeSectionController] canvasOriginForPageController:a4];
  double v16 = v15;
  CGFloat x = a6->x;
  double v18 = a6->y;
  [*(id *)&self->TSADocumentViewController_opaque[OBJC_IVAR___TSADocumentViewController__scrollView] frame];
  double v20 = v19;
  [(THDocumentViewController *)self beginDraggingContentOffset];
  if (y > 0.0)
  {
    double v22 = v20 + v21;
    id v23 = [a4 firstBodyCharacterIndexOverlappingPageRect:0 forRelativePageIndex:0.0 v20 + v21 + -40.0 - v16 v12 40.0];
    if (v23)
    {
      [a4 originOfCharacterIndex:v23 forRelativePageIndex:0];
      if (v16 + v24 > v22 + v20 * -0.5) {
        double v22 = v16 + v24;
      }
    }
    if (objc_msgSend(-[THDocumentViewController currentNavigationUnit](self, "currentNavigationUnit"), "contentNodeAfterNode:", v10))
    {
      double v25 = v14 + v16;
      if (v25 < v22)
      {
        [(THDocumentViewController *)self beginDraggingContentOffset];
        if (vabdd_f64(v25, v26) <= 50.0) {
          double v18 = v22;
        }
        else {
          double v18 = v25;
        }
        goto LABEL_23;
      }
    }
    else if (v22 <= v18)
    {
      goto LABEL_23;
    }
    double v18 = v22;
    goto LABEL_23;
  }
  double v27 = v21 - v20;
  id v28 = [a4 firstBodyCharacterIndexOverlappingPageRect:0 forRelativePageIndex:0.0 + v27 + 20.0 - v16 v12 40.0];
  if (v28)
  {
    [a4 originOfCharacterIndex:v28 forRelativePageIndex:0];
    if (v16 + v29 > v27) {
      double v27 = v16 + v29;
    }
  }
  id v30 = [self currentNavigationUnit].contentNodeBeforeNode:v10];
  if (v30)
  {
    [(THSectionController *)[(THDocumentViewController *)self activeSectionController] canvasOriginForPageController:[(THSectionController *)[(THDocumentViewController *)self activeSectionController] pageControllerForContentNode:v30]];
    double v32 = v31;
    if (v16 <= v27
      || ([(THDocumentViewController *)self beginDraggingContentOffset], v16 >= v33)
      || ([(THDocumentViewController *)self beginDraggingContentOffset],
          double v18 = v16,
          vabdd_f64(v16, v34) <= 50.0))
    {
      if (v32 <= v27) {
        double v18 = v27;
      }
      else {
        double v18 = v32;
      }
    }
  }
  else
  {
    double v18 = v27;
  }
LABEL_23:
  a6->CGFloat x = x;
  a6->double y = v18;
}

- (void)interactiveCanvasControllerFreeTransformWillBegin:(id)a3
{
}

- (void)interactiveCanvasControllerFreeTransformDidEnd:(id)a3
{
  if ([(THDocumentViewController *)self p_updateScrollViewClipsToBounds]
    && [(THDocumentViewController *)self p_allowsPageDisplacement])
  {
    [(THDocumentViewController *)self updateVisibleInfosWithPageIndex:[(THDocumentViewController *)self currentRelativePageIndex]];
    id v4 = objc_msgSend(objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "canvasView"), "enclosingScrollView");
    [v4 _prepareToPageWithHorizontalVelocity:0.0 verticalVelocity:0.0];
  }
}

- (BOOL)interactiveCanvasControllerShouldIgnoreOverscroll:(id)a3
{
  return ![(THDocumentViewController *)self p_canOverscroll];
}

- (void)interactiveCanvasController:(id)a3 didOverscrollLeft:(double)a4 state:(int)a5
{
  if ([(THDocumentViewController *)self leftOverscrollView])
  {
    [(THDocumentViewController *)self isEpub];
    if ((a5 & 0xFFFFFFFE) == 2) {
      [(THDocumentViewController *)self p_horizontalOverscrollPreviousChapter];
    }
    [(THDocumentViewController *)self setLastStorageAnchor:0];
    [(THDocumentViewController *)self setJustUpdatedPresentationType:0];
  }
}

- (void)interactiveCanvasController:(id)a3 didOverscrollRight:(double)a4 state:(int)a5
{
  if ([(THDocumentViewController *)self rightOverscrollView])
  {
    [(THDocumentViewController *)self isEpub];
    if ((a5 & 0xFFFFFFFE) == 2) {
      [(THDocumentViewController *)self p_horizontalOverscrollNextChapter];
    }
    [(THDocumentViewController *)self setLastStorageAnchor:0];
    [(THDocumentViewController *)self setJustUpdatedPresentationType:0];
  }
}

- (void)interactiveCanvasController:(id)a3 didOverscrollTop:(double)a4 state:(int)a5
{
  if ([(THDocumentViewController *)self topOverscrollView])
  {
    unsigned int v8 = [(THDocumentViewController *)self th_cachedIsCompactHeight];
    double v9 = 128.0;
    if (v8) {
      double v9 = 48.0;
    }
    if (a5 == 2 && v9 < a4)
    {
      [(THDocumentViewController *)self p_verticalOverscrollPreviousChapter];
    }
  }
}

- (void)interactiveCanvasController:(id)a3 didOverscrollBottom:(double)a4 state:(int)a5
{
  if ([(THDocumentViewController *)self bottomOverscrollView])
  {
    unsigned int v8 = [(THDocumentViewController *)self th_cachedIsCompactHeight];
    double v9 = 128.0;
    if (v8) {
      double v9 = 48.0;
    }
    if (a5 == 2 && v9 < a4)
    {
      [(THDocumentViewController *)self p_verticalOverscrollNextChapter];
    }
  }
}

- (double)p_pageMarginWidth
{
  id v2 = (char *)objc_msgSend(objc_msgSend(-[THDocumentViewController bc_windowForViewController](self, "bc_windowForViewController"), "windowScene"), "interfaceOrientation");
  double result = 60.0;
  if ((unint64_t)(v2 - 3) < 2) {
    return 70.0;
  }
  return result;
}

- (BOOL)interactiveCanvasController:(id)a3 pointIsInLeftMargin:(CGPoint)a4
{
  [self interactiveCanvasController].convertUnscaledToBoundsPoint:a4.x, a4.y;
  double v6 = v5;
  double v8 = v7;
  id v9 = [self canvasViewController].canvasView;

  return -[THDocumentViewController pointIsInLeftMargin:fromView:](self, "pointIsInLeftMargin:fromView:", v9, v6, v8);
}

- (BOOL)interactiveCanvasController:(id)a3 pointIsInRightMargin:(CGPoint)a4
{
  [self interactiveCanvasController].convertUnscaledToBoundsPoint:a4.x, a4.y];
  double v6 = v5;
  double v8 = v7;
  id v9 = [self canvasViewController].canvasView;

  return -[THDocumentViewController pointIsInRightMargin:fromView:](self, "pointIsInRightMargin:fromView:", v9, v6, v8);
}

- (BOOL)interactiveCanvasControllerShouldPageLeftOnMarginTap:(id)a3
{
  if ((TSUPadUI() & 1) != 0 || (unsigned int v4 = [(THDocumentViewController *)self isEpub]) != 0)
  {
    unsigned int v4 = [*(id *)&self->TSADocumentViewController_opaque[OBJC_IVAR___TSADocumentViewController__scrollView] isPagingEnabled];
    if (v4) {
      LOBYTE(v4) = [(THDocumentViewController *)self currentAbsolutePageIndex] != 0;
    }
  }
  return v4;
}

- (BOOL)interactiveCanvasControllerShouldPageRightOnMarginTap:(id)a3
{
  if ((TSUPadUI() & 1) != 0 || (unsigned int v4 = [(THDocumentViewController *)self isEpub]) != 0)
  {
    unsigned int v4 = [*(id *)&self->TSADocumentViewController_opaque[OBJC_IVAR___TSADocumentViewController__scrollView] isPagingEnabled];
    if (v4)
    {
      unint64_t v5 = [(THDocumentViewController *)self currentAbsolutePageIndex];
      uint64_t v6 = 1;
      if (self->_isTwoUp) {
        uint64_t v6 = 2;
      }
      LOBYTE(v4) = v6 + v5 < (unint64_t)objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "navigationModel"), "pageCount");
    }
  }
  return v4;
}

- (void)interactiveCanvasControllerWasTapped:(id)a3
{
}

- (void)interactiveCanvasControllerWillShowNoteEditor:(id)a3
{
}

- (void)interactiveCanvasController:(id)a3 wantsToPresentContextMenuAtCanvasPoint:(CGPoint)a4 forAnnotationUUID:(id)a5
{
  [self view:a3 convertPoint:[self canvasViewController].canvasView x:a4.x y:a4.y];
  double v8 = v7;
  double v10 = v9;
  id v11 = [(THDocumentViewController *)self canvasViewController];
  id v12 = [(THDocumentViewController *)self view];

  [v11 shouldPresentContextMenuInView:v12 atPoint:a5 forAnnotationUUID:v8];
}

- (BOOL)interactiveCanvasControllerShouldAllowZoomToColumn:(id)a3
{
  if ([(THDocumentViewController *)self th_cachedIsCompactWidth]
    || (BOOL v4 = [(THDocumentViewController *)self th_cachedIsCompactHeight]))
  {
    LOBYTE(v4) = ![(THDocumentViewController *)self p_isCompactFlowPresentation];
  }
  return v4;
}

- (BOOL)interactiveCanvasController:(id)a3 shouldZoomToColumn:(id)a4 withFrame:(CGRect)a5 tapPoint:(CGPoint)a6
{
  double y = a6.y;
  double x = a6.x;
  [a3 convertUnscaledToBoundsRect:a5.origin.x, a5.origin.y, a5.size.width, a5.size.height];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  [a3 convertUnscaledToBoundsPoint:x, y];
  uint64_t v18 = v17;
  uint64_t v20 = v19;
  v29.origin.double x = v10;
  v29.origin.double y = v12;
  v29.size.double width = v14;
  v29.size.double height = v16;
  CGRectGetWidth(v29);
  v30.origin.double x = v10;
  v30.origin.double y = v12;
  v30.size.double width = v14;
  v30.size.double height = v16;
  CGRectGetHeight(v30);
  TSDCenterOfRect();
  TSDRectWithCenterAndSize();
  uint64_t v25 = v18;
  uint64_t v26 = v20;

  return CGRectContainsPoint(*(CGRect *)&v21, *(CGPoint *)&v25);
}

- (double)interactiveCanvasControllerPaddingForZoomToColumn:(id)a3
{
  return 15.0;
}

- (void)interactiveCanvasController:(id)a3 didZoomToColumn:(id)a4 ofRep:(id)a5
{
  [self interactiveCanvasController:a3 endEditing];
  [a5 layout];
  objc_opt_class();
  double v8 = -[THGuidedPanColumnTarget initWithLayout:column:]([THGuidedPanColumnTarget alloc], "initWithLayout:column:", TSUClassAndProtocolCast(), a4, &OBJC_PROTOCOL___TSWPLayoutTarget);
  double v9 = [(THDocumentViewController *)self guidedPanController];

  [(THGuidedPanController *)v9 setTarget:v8];
}

- (id)interactiveCanvasController:(id)a3 delegateConformingToProtocol:(id)a4 forRep:(id)a5
{
  if (protocol_isEqual((Protocol *)a4, (Protocol *)&OBJC_PROTOCOL___THPageLayerAndSubviewHostProvider))
  {
    return [(THDocumentViewController *)self pageViewProvider];
  }
  else if (protocol_isEqual((Protocol *)a4, (Protocol *)&OBJC_PROTOCOL___THPerformanceCoordinator))
  {
    return self;
  }
  else
  {
    return 0;
  }
}

- (id)interactiveCanvasController:(id)a3 delegateConformingToProtocol:(id)a4 forLayout:(id)a5
{
  if (protocol_isEqual((Protocol *)a4, (Protocol *)&OBJC_PROTOCOL___THWWidgetStackHosting)) {
    return self;
  }
  else {
    return 0;
  }
}

- (void)interactiveCanvasController:(id)a3 activateProgressForRep:(id)a4
{
}

- (void)interactiveCanvasController:(id)a3 progressDidChangeForRep:(id)a4 percent:(id)a5
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_15E5C;
  v5[3] = &unk_456FE0;
  v5[4] = a5;
  -[THDocumentViewController p_getWidgetIDsForInfo:completion:](self, "p_getWidgetIDsForInfo:completion:", [a4 info], v5);
}

- (void)interactiveCanvasController:(id)a3 scoreDidChangeForRep:(id)a4 score:(id)a5 total:(id)a6
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_15F68;
  v6[3] = &unk_456F00;
  v6[4] = a5;
  v6[5] = a6;
  -[THDocumentViewController p_getWidgetIDsForInfo:completion:](self, "p_getWidgetIDsForInfo:completion:", [a4 info], v6);
}

- (void)interactiveCanvasController:(id)a3 resetAttemptForRep:(id)a4
{
  id v5 = [a4 info:a3];

  [(THDocumentViewController *)self p_getWidgetIDsForInfo:v5 completion:&stru_457020];
}

- (void)selectionDidChange
{
  if (objc_msgSend(objc_msgSend(objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "editorController"), "textInputEditor"), "selection"))
  {
    id v3 = [(THDocumentViewController *)self interactiveCanvasController];
    [v3 resumeEditing];
  }
}

- (void)interactiveCanvasControllerWillScroll:(id)a3
{
  [a3 contentOffset];
  -[THDocumentViewController setLastScrollOffset:](self, "setLastScrollOffset:");
  [(THBookNavigation *)[(THDocumentViewController *)self bookNavigationDelegate] vantageWillChangeBy:self reason:@"THVantageChangeReasonScrolling"];
  if ([(THDocumentViewController *)self inFlowMode])
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    void v4[2] = sub_161AC;
    v4[3] = &unk_456DE0;
    v4[4] = self;
    +[UIView animateWithDuration:0 delay:v4 options:&stru_457060 animations:0.05 completion:0.0];
  }
}

- (void)interactiveCanvasController:(id)a3 willAnimateScrollToVisibleUnscaledRect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  if ([(THDocumentViewController *)self inFlowMode])
  {
    [a3 pushThreadedLayoutAndRenderDisabled];
    [(THDocumentViewController *)self p_fixScrollViewToMatchCanvas];

    self->mLayoutAnchor = 0;
    id v10 = -[THSectionController layoutAnchorForContentOffset:]([(THDocumentViewController *)self activeSectionController], "layoutAnchorForContentOffset:", x, y);
    double v11 = [(THDocumentViewController *)self activeSectionController];
    [a3 visibleHeight];
    double v13 = v12;
    [a3 visibleHeight];
    -[THSectionController layoutContentAtLayoutAnchor:padAbove:padBelow:layoutController:](v11, "layoutContentAtLayoutAnchor:padAbove:padBelow:layoutController:", v10, [a3 layoutController], v13, v14 + v14);
    self->mScrollTargetRect.origin.double x = x;
    self->mScrollTargetRect.origin.double y = y;
    self->mScrollTargetRect.size.CGFloat width = width;
    self->mScrollTargetRect.size.CGFloat height = height;
    [a3 popThreadedLayoutAndRenderDisabled];
  }
  double v15 = [(THDocumentViewController *)self bookNavigationDelegate];

  [(THBookNavigation *)v15 vantageWillChangeBy:self reason:@"THVantageChangeReasonScrolling"];
}

- (void)interactiveCanvasControllerDidEndScrollingAnimation:(id)a3 stillAnimating:(BOOL)a4
{
  CGSize size = CGRectNull.size;
  self->mScrollTargetRect.origin = CGRectNull.origin;
  self->mScrollTargetRect.CGSize size = size;
  if ([(THDocumentViewController *)self inFlowMode])
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_163B8;
    v6[3] = &unk_456DE0;
    v6[4] = self;
    +[UIView animateWithDuration:0 delay:v6 options:&stru_457080 animations:0.05 completion:0.0];
  }
}

- (void)interactiveCanvasControllerDidStopScrolling:(id)a3
{
  [(THPageViewProvider *)[(THDocumentViewController *)self pageViewProvider] canvasDidStopScrolling];
  [a3 contentOffset];
  double v6 = v5;
  double v8 = v7;
  [(THDocumentViewController *)self lastScrollOffset];
  double v10 = v9;
  double v12 = v11;
  double v13 = [(THDocumentViewController *)self bookNavigationDelegate];
  if (v10 == v6 && v12 == v8) {
    [(THBookNavigation *)v13 vantageChangeWasCancelledBy:self reason:@"THVantageChangeReasonScrolling"];
  }
  else {
    [(THBookNavigation *)v13 vantageDidChangeBy:self reason:@"THVantageChangeReasonScrolling"];
  }
  if ([(THDocumentViewController *)self justUpdatedPresentationType]
    || ([(THDocumentViewController *)self lastScrollOffset], v16 == v6) && v15 == v8)
  {
    [(THDocumentViewController *)self setJustUpdatedPresentationType:0];
  }
  else
  {
    [(THDocumentViewController *)self setLastStorageAnchor:0];
  }
  [(THDocumentViewController *)self p_visibleRectChanged];
  [(THDocumentViewController *)self p_updatePageViewsForScrollingAnimated:0 restoreOrigin:0];
  [(THDocumentViewController *)self p_updateBookmarkAffordances];
  [(BCDisplaySleepController *)[(THDocumentViewController *)self displaySleepController] userInteractionOccurred];
  if ([(THDocumentViewController *)self inFlowMode])
  {
    if (CGRectIsNull(self->mScrollTargetRect))
    {
      [(THDocumentViewController *)self p_fixScrollViewToMatchCanvas];
      [(THDocumentViewController *)self p_removeCanvasTransform];
    }
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_165B8;
    v17[3] = &unk_456DE0;
    v17[4] = self;
    +[UIView animateWithDuration:0 delay:v17 options:&stru_4570A0 animations:0.05 completion:0.0];
  }
  [(THDocumentViewController *)self p_updatePageNumberingForce:1];
  -[THDocumentViewController setLastScrollOffset:](self, "setLastScrollOffset:", v6, v8);
}

- (void)p_visibleRectChanged
{
  if ([(THDocumentViewController *)self isDocumentLoaded]
    && ![(THDocumentViewController *)self isRotating])
  {
    [(THDocumentViewController *)self p_updateVisibleInfos];
  }
}

- (BOOL)p_isPageLocationApplicable
{
  id v3 = [(THDocumentViewController *)self currentPresentationType];
  if (v3) {
    LOBYTE(v3) = ![(THDocumentViewController *)self isRotating];
  }
  return (char)v3;
}

- (void)p_updatePageNumberingForce:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(THDocumentViewController *)self isDocumentLoaded]
    || ![(THDocumentViewController *)self p_isPageLocationApplicable])
  {
    return;
  }
  if ([(THDocumentViewController *)self inFlowMode])
  {
    if ([(THDocumentViewController *)self lastPageNumberUpdate])
    {
      [(NSDate *)[(THDocumentViewController *)self lastPageNumberUpdate] timeIntervalSinceNow];
      BOOL v6 = v5 < -2.0;
      if (v5 >= -2.0 && !v3)
      {
        unint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_34:
        int v17 = 1;
        goto LABEL_38;
      }
    }
    else
    {
      BOOL v6 = 1;
    }
    unint64_t v7 = [(THDocumentViewController *)self currentAbsolutePageIndex];
    -[THPageNumberView setPageNumberText:](-[THDocumentViewController contentPageNumberView](self, "contentPageNumberView"), "setPageNumberText:", objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "navigationModel"), "pageNumberStringForAbsolutePageIndex:forPresentationType:", v7, -[THSectionController presentationType](-[THDocumentViewController paginatedSectionController](self, "paginatedSectionController"), "presentationType")));
    if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      uint64_t v15 = v7 + 1;
    }
    if ([(THDocumentViewController *)self reflowablePaginationController]
      && ![(THReflowablePaginationController *)[(THDocumentViewController *)self reflowablePaginationController] paginationComplete])
    {
      uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      uint64_t v16 = (uint64_t)objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "navigationModel"), "pageCount");
    }
    [(BKScrubberControl *)[(THDocumentViewController *)self scrubber] setPageNumber:v15];
    [(BKScrubberControl *)[(THDocumentViewController *)self scrubber] setPageCount:v16];
    [(THPageNumberView *)[(THDocumentViewController *)self navOverlayPageNumberView] setPageNumber:v15];
    [(THPageNumberView *)[(THDocumentViewController *)self navOverlayPageNumberView] setPageCount:v16];
    if (!v6) {
      goto LABEL_34;
    }
    [(THDocumentViewController *)self setLastPageNumberUpdate:+[NSDate date]];
LABEL_37:
    int v17 = 0;
    goto LABEL_38;
  }
  if ([(THDocumentViewController *)self isEpub])
  {
    if ([(THReflowablePaginationController *)[(THDocumentViewController *)self reflowablePaginationController] paginationComplete])
    {
      unint64_t v7 = [(THDocumentViewController *)self currentAbsolutePageIndex];
      id v8 = objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "navigationModel"), "pageCount");
      [(BKScrubberControl *)[(THDocumentViewController *)self scrubber] setPageCount:v8];
      [(THPageNumberView *)[(THDocumentViewController *)self contentPageNumberView] setPageCount:v8];
      [(THPageNumberView *)[(THDocumentViewController *)self navOverlayPageNumberView] setPageCount:v8];
      if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        uint64_t v9 = v7 + 1;
      }
      [(BKScrubberControl *)[(THDocumentViewController *)self scrubber] setPageNumber:v9];
      [(THPageNumberView *)[(THDocumentViewController *)self contentPageNumberView] setPageNumber:v9];
      double v10 = [(THDocumentViewController *)self navOverlayPageNumberView];
      uint64_t v11 = v9;
    }
    else
    {
      [(BKScrubberControl *)[(THDocumentViewController *)self scrubber] setPageCount:1];
      [(BKScrubberControl *)[(THDocumentViewController *)self scrubber] setPageNumber:1];
      unint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
      [(THPageNumberView *)[(THDocumentViewController *)self contentPageNumberView] setPageCount:0x7FFFFFFFFFFFFFFFLL];
      [(THPageNumberView *)[(THDocumentViewController *)self contentPageNumberView] setPageNumber:0x7FFFFFFFFFFFFFFFLL];
      [(THPageNumberView *)[(THDocumentViewController *)self navOverlayPageNumberView] setPageCount:0x7FFFFFFFFFFFFFFFLL];
      double v10 = [(THDocumentViewController *)self navOverlayPageNumberView];
      uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
    }
    [(THPageNumberView *)v10 setPageNumber:v11];
    goto LABEL_37;
  }
  if ([(THDocumentViewController *)self useScrubber])
  {
    unint64_t v12 = [(THDocumentViewController *)self currentAbsolutePageIndex];
    unint64_t v7 = v12;
    if (v12 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      uint64_t v13 = v12 + 1;
    }
    if ([(THDocumentViewController *)self reflowablePaginationController]
      && ![(THReflowablePaginationController *)[(THDocumentViewController *)self reflowablePaginationController] paginationComplete])
    {
      uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      uint64_t v14 = (uint64_t)objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "navigationModel"), "pageCount");
    }
    [(BKScrubberControl *)[(THDocumentViewController *)self scrubber] setPageNumber:v13];
    [(BKScrubberControl *)[(THDocumentViewController *)self scrubber] setPageCount:v14];
    goto LABEL_37;
  }
  int v17 = 0;
  unint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_38:
  if ([(THDocumentViewController *)self isEpub]
    && [(THReflowablePaginationController *)[(THDocumentViewController *)self reflowablePaginationController] paginationComplete]&& (![(THDocumentViewController *)self inFlowMode]|| ((v17 | ![(THDocumentViewController *)self inFlowMode]) & 1) == 0))
  {
    if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
      unint64_t v7 = [(THDocumentViewController *)self currentAbsolutePageIndex];
    }
    id v18 = [self currentNavigationUnit].absolutePageRangeForPresentationType:[THPresentationType paginatedPresentationTypeInContext:[self documentRoot].context];
    if (v19 != 0x7FFFFFFFFFFFFFFFLL && v18 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v20 = (uint64_t)v18 + v19 + ~v7;
      if (v20 >= 0)
      {
        if (v20 == 1) {
          id v21 = [(THDocumentReflowableLayoutConfiguration *)[(THDocumentViewController *)self configuration] singularPagesLeftInChapterWithRemainingPageCount:1];
        }
        else {
          id v21 = v20
        }
              ? [(THDocumentReflowableLayoutConfiguration *)[(THDocumentViewController *)self configuration] pluralPagesLeftInChapterWithRemainingPageCount:v20]: [(THDocumentReflowableLayoutConfiguration *)[(THDocumentViewController *)self configuration] lastPageInChapterString];
        id v22 = v21;
        if (v21)
        {
          id v23 = [(THDocumentViewController *)self toolbarDelegate];
          [(THToolbarDelegate *)v23 textForPagesLeftInChapterDidChangeTo:v22];
        }
      }
    }
  }
}

- (void)interactiveCanvasControllerDidScroll:(id)a3
{
  if (!self->mPreventScrollViewDidScrollReentrance)
  {
    if (([a3 isOverscrolling] & 1) == 0)
    {
      [(THDocumentViewController *)self setOrientationAnchor:0];
      if ([(THDocumentViewController *)self interactiveCanvasController] != a3) {
        [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THDocumentViewController interactiveCanvasControllerDidScroll:]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentViewController.mm"] lineNumber:4425 description:@"bad canvas"];
      }
      if ([(THDocumentViewController *)self inFlowMode])
      {
        if (([a3 currentlyWaitingOnThreadedLayoutAndRender] & 1) == 0)
        {
          v5[0] = _NSConcreteStackBlock;
          v5[1] = 3221225472;
          v5[2] = sub_16C20;
          v5[3] = &unk_456DE0;
          v5[4] = a3;
          objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "accessController"), "performWrite:", v5);
        }
      }
      else
      {
        [(THDocumentViewController *)self p_updatePageNumberingForce:0];
      }
      if (([a3 currentlyWaitingOnThreadedLayoutAndRender] & 1) == 0) {
        [(THDocumentViewController *)self p_visibleRectChanged];
      }
    }
    [(THDocumentViewController *)self p_updatePageViewsForScrollingAnimated:1 restoreOrigin:0];
  }
}

- (void)interactiveCanvasControllerDidLayoutAndRenderOnBackgroundThread:(id)a3
{
  if (([a3 currentlyWaitingOnThreadedLayoutAndRender] & 1) == 0
    && ([a3 isOverscrolling] & 1) == 0)
  {
    if ([(THDocumentViewController *)self inFlowMode] && CGRectIsNull(self->mScrollTargetRect)) {
      [(THDocumentViewController *)self p_fixScrollViewToMatchCanvas];
    }
    [(THDocumentViewController *)self p_visibleRectChanged];
    [(THDocumentViewController *)self p_updatePageViewsForScrollingAnimated:0 restoreOrigin:0];
  }
  double v5 = [(THDocumentViewController *)self pageViewProvider];

  [(THPageViewProvider *)v5 canvasDidLayoutAndRenderOnBackgroundThread];
}

- (void)p_updateBookmarkAffordances
{
  [(THToolbarDelegate *)[(THDocumentViewController *)self toolbarDelegate] updateBookmarkButton];
  id v3 = [(THDocumentViewController *)self interactiveCanvasController];

  [v3 updateBookmarkStatusAnimated:0];
}

- (void)p_fixScrollViewToMatchCanvas
{
  if (!+[NSThread isMainThread]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentViewController p_fixScrollViewToMatchCanvas]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentViewController.mm") lineNumber:4494 description:@"This operation must only be performed on the main thread."];
  }
  if (![(THDocumentViewController *)self inFlowMode]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentViewController p_fixScrollViewToMatchCanvas]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentViewController.mm") lineNumber:4495 description:@"only for flow"];
  }
  if ([self interactiveCanvasController].currentlyWaitingOnThreadedLayoutAndRender) {
  if (!CGRectIsNull(self->mScrollTargetRect))
  }
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentViewController p_fixScrollViewToMatchCanvas]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentViewController.mm") lineNumber:4497 description:@"shouldn't fixup canvas size while animating to a target rect"];
  uint64_t v3 = OBJC_IVAR___TSADocumentViewController__scrollView;
  [*(id *)&self->TSADocumentViewController_opaque[OBJC_IVAR___TSADocumentViewController__scrollView] contentSize];
  double v5 = v4;
  double v7 = v6;
  objc_msgSend(objc_msgSend(objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "layerHost"), "canvasLayer"), "bounds");
  if (v5 != v9 || v7 != v8)
  {
    [*(id *)&self->TSADocumentViewController_opaque[v3] contentOffset];
    double v12 = v11;
    objc_msgSend(objc_msgSend(objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "layerHost"), "canvasLayer"), "fixFrameAndScrollView");
    [*(id *)&self->TSADocumentViewController_opaque[v3] contentOffset];
    double v14 = self->mCanvasYOffset + v13 - v12;
    self->mCanvasYOffset = v14;
    CGAffineTransformMakeTranslation(&v17, 0.0, v14);
    id v15 = objc_msgSend(objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "layerHost"), "canvasLayer");
    CGAffineTransform v16 = v17;
    [v15 setAffineTransform:&v16];
    [*(id *)&self->TSADocumentViewController_opaque[v3] setContentInset:-self->mCanvasYOffset, 0.0, self->mCanvasYOffset, 0.0];
    [(THDocumentViewController *)self p_setupOverscrollViews];
  }
}

- (void)p_removeCanvasTransform
{
  if (!+[NSThread isMainThread]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentViewController p_removeCanvasTransform]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentViewController.mm") lineNumber:4517 description:@"This operation must only be performed on the main thread."];
  }
  if (![(THDocumentViewController *)self inFlowMode]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentViewController p_removeCanvasTransform]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentViewController.mm") lineNumber:4518 description:@"only for flow"];
  }
  if ([self interactiveCanvasController].currentlyWaitingOnThreadedLayoutAndRender) {
  if ([self interactiveCanvasController].currentlyScrolling)[[TSUAssertionHandler currentHandler] handleFailureInFunction:@"-[THDocumentViewController p_removeCanvasTransform]" file:@"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentViewController.mm" lineNumber:4520 description:@"shouldn't change the content offset while scrolling"];
  }
  if (!CGRectIsNull(self->mScrollTargetRect)) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentViewController p_removeCanvasTransform]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentViewController.mm") lineNumber:4521 description:@"shouldn't fixup canvas size while animating to a target rect"];
  }
  uint64_t v3 = OBJC_IVAR___TSADocumentViewController__scrollView;
  [*(id *)&self->TSADocumentViewController_opaque[OBJC_IVAR___TSADocumentViewController__scrollView] contentSize];
  double v5 = v4;
  double v7 = v6;
  objc_msgSend(objc_msgSend(objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "layerHost"), "canvasLayer"), "bounds");
  if (v5 != v9 || v7 != v8) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentViewController p_removeCanvasTransform]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentViewController.mm") lineNumber:4522 description:@"call p_fixupScrollViewToMatchCanvas before p_removeCanvasTransform"];
  }
  if (self->mCanvasYOffset != 0.0)
  {
    if ([(THDocumentViewController *)self inFlowMode]) {
      self->mPreventScrollViewDidScrollReentrance = 1;
    }
    [*(id *)&self->TSADocumentViewController_opaque[v3] contentOffset];
    double v12 = v11;
    double v14 = v13 - self->mCanvasYOffset;
    objc_msgSend(objc_msgSend(objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController", *(void *)&CGAffineTransformIdentity.a, *(void *)&CGAffineTransformIdentity.b, *(void *)&CGAffineTransformIdentity.c, *(void *)&CGAffineTransformIdentity.d, *(void *)&CGAffineTransformIdentity.tx, *(void *)&CGAffineTransformIdentity.ty), "layerHost"), "canvasLayer"), "setAffineTransform:", &v15);
    [*(id *)&self->TSADocumentViewController_opaque[v3] setContentInset:UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right];
    [*(id *)&self->TSADocumentViewController_opaque[v3] setContentOffset:v12, v14];
    self->mCanvasYOffset = 0.0;
    if ([(THDocumentViewController *)self inFlowMode]) {
      self->mPreventScrollViewDidScrollReentrance = 0;
    }
    [(THDocumentViewController *)self p_updateVerticalOverscrollTransform];
  }
}

- (void)p_updateVerticalOverscrollTransform
{
  memset(&v5, 0, sizeof(v5));
  CGAffineTransformMakeTranslation(&v5, 0.0, self->mCanvasYOffset);
  v4[1] = v5;
  v4[0] = v5;
  [(CALayer *)[(UIView *)[(THDocumentViewController *)self topOverscrollView] layer] setAffineTransform:v4];
  v3[1] = v5;
  v3[0] = v5;
  [(CALayer *)[(UIView *)[(THDocumentViewController *)self bottomOverscrollView] layer] setAffineTransform:v3];
}

- (CGRect)interactiveCanvasController:(id)a3 expandVisibleBoundsForClippingReps:(CGRect)a4
{
  return CGRectInset(a4, -a4.size.width, -a4.size.height);
}

- (CGRect)interactiveCanvasController:(id)a3 expandVisibleBoundsForTiling:(CGRect)a4
{
  return CGRectInset(a4, -a4.size.width, -a4.size.height);
}

- (CGRect)interactiveCanvasController:(id)a3 expandBoundsForHitTesting:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  [(THDocumentViewController *)self p_maxScrollViewSize];
  TSDRectWithSize();
  [*(id *)&self->TSADocumentViewController_opaque[OBJC_IVAR___TSADocumentViewController__scrollView] frame];
  TSDCenterRectOverRect();
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  if ([(THDocumentViewController *)self p_allowsPageDisplacement])
  {
    [self interactiveCanvasController].viewScale
    double v45 = v11;
    double v18 = v13;
    double v19 = v15;
    double v20 = v17;
    double v21 = x;
    double v22 = y;
    double v23 = width;
    double v24 = height;
    double v26 = v25;
    [(THDocumentViewController *)self zoomedOutViewScale];
    double v28 = vabdd_f64(v26, v27);
    CGFloat height = v24;
    CGFloat width = v23;
    CGFloat y = v22;
    CGFloat x = v21;
    double v17 = v20;
    double v15 = v19;
    double v13 = v18;
    double v11 = v45;
    if (v28 < 0.00999999978)
    {
      [(THDocumentViewController *)self p_currentSpreadSize];
      TSDFitOrFillSizeInRect();
      double v11 = v29;
      double v13 = v30;
      double v15 = v31;
      double v17 = v32;
    }
  }
  [self view].convertRect:[a3 canvasView] toView:v11, v13, v15, v17];
  CGFloat v34 = v33;
  CGFloat v36 = v35;
  CGFloat v38 = v37;
  CGFloat v40 = v39;
  if (![(THDocumentViewController *)self p_allowsPageDisplacement])
  {
    v46.origin.CGFloat x = x;
    v46.origin.CGFloat y = y;
    v46.size.CGFloat width = width;
    v46.size.CGFloat height = height;
    v49.origin.CGFloat x = v34;
    v49.origin.CGFloat y = v36;
    v49.size.CGFloat width = v38;
    v49.size.CGFloat height = v40;
    CGRect v47 = CGRectUnion(v46, v49);
    CGFloat v34 = v47.origin.x;
    CGFloat v36 = v47.origin.y;
    CGFloat v38 = v47.size.width;
    CGFloat v40 = v47.size.height;
  }
  double v41 = v34;
  double v42 = v36;
  double v43 = v38;
  double v44 = v40;
  result.size.CGFloat height = v44;
  result.size.CGFloat width = v43;
  result.origin.CGFloat y = v42;
  result.origin.CGFloat x = v41;
  return result;
}

- (void)interactiveCanvasController:(id)a3 layoutRegistered:(id)a4
{
  CGAffineTransform v5 = (void *)TSUProtocolCast();
  if (v5)
  {
    [v5 setDelegate:self];
  }
}

- (CGRect)scrollViewClippingBoundsForInteractiveCanvasController:(id)a3
{
  [(THDocumentViewController *)self p_maxScrollViewSize];
  [*(id *)&self->TSADocumentViewController_opaque[OBJC_IVAR___TSADocumentViewController__scrollView] bounds];
  TSDRectWithSize();
  TSDRectWithSize();

  TSDCenterRectOverRect();
  result.size.CGFloat height = v7;
  result.size.CGFloat width = v6;
  result.origin.CGFloat y = v5;
  result.origin.CGFloat x = v4;
  return result;
}

- (id)interactiveCanvasController:(id)a3 infoForModel:(id)a4 withSelection:(id)a5
{
  objc_opt_class();
  double v6 = (void *)TSUClassAndProtocolCast();
  objc_opt_class();
  uint64_t v7 = TSUDynamicCast();
  if (!v7) {
    return v6;
  }
  uint64_t v8 = v7;
  objc_opt_class();
  uint64_t v9 = TSUDynamicCast();
  if (!v9) {
    return v6;
  }
  double v10 = (void *)v9;
  double v11 = [(THDocumentViewController *)self activeSectionController];
  id v12 = [v10 range];

  return [(THSectionController *)v11 bodyInfoForStorage:v8 charIndex:v12];
}

- (BOOL)canCopy
{
  objc_opt_class();
  objc_msgSend(objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "editorController"), "textInputEditor");
  uint64_t v3 = (void *)TSUDynamicCast();

  return [v3 canCopy];
}

- (void)copySelection
{
  objc_opt_class();
  objc_msgSend(objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "editorController"), "textInputEditor");
  uint64_t v3 = (void *)TSUDynamicCast();

  [v3 copy:self];
}

- (void)p_canvasDidZoom
{
  BOOL v3 = [(THDocumentViewController *)self shouldPagingBeEnabled];
  [*(id *)&self->TSADocumentViewController_opaque[OBJC_IVAR___TSADocumentViewController__scrollView] setPagingEnabled:v3];
  [(THDocumentViewController *)self p_setupOverscrollViews];
  [(THDocumentViewController *)self p_fireCanvasDidZoomCompletion];

  [(THDocumentViewController *)self p_updatePageViewsForScrollingAnimated:0 restoreOrigin:0];
}

- (void)interactiveCanvasControllerWillZoom:(id)a3
{
  if ([(THDocumentViewController *)self p_allowsPageDisplacement])
  {
    mPageViewDisplacement = self->mPageViewDisplacement;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_17A98;
    v5[3] = &unk_456EB0;
    v5[4] = self;
    [(THPageViewDisplacement *)mPageViewDisplacement animateShowWithDuration:[(THDocumentViewController *)self currentRelativePageIndex] forPageIndex:v5 enumerator:0.1];
  }
}

- (void)interactiveCanvasControllerDidZoom:(id)a3
{
  [(THDocumentViewController *)self p_canvasDidZoom];
  if ([(THDocumentViewController *)self p_allowsPageDisplacement])
  {
    [(THDocumentViewController *)self fitWidthViewScale];
    double v5 = v4;
    [(THDocumentViewController *)self fitHeightViewScale];
    double v7 = fmin(v5, v6);
    double v8 = v7 + v7 * 0.1;
    mPageViewDisplacement = self->mPageViewDisplacement;
    unint64_t v10 = [(THDocumentViewController *)self currentRelativePageIndex];
    [(THDocumentViewController *)self zoomedOutViewScale];
    double v12 = v11;
    [self interactiveCanvasController].viewScale
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_17D2C;
    v14[3] = &unk_456EB0;
    v14[4] = self;
    [(THPageViewDisplacement *)mPageViewDisplacement animateZoomWithDuration:v10 initialPageIndex:v14 minViewScale:0.1 maxViewScale:v12 currentViewScale:v8 enumerator:v13];
  }
}

- (void)interactiveCanvasController:(id)a3 willAnimateToViewScale:(double)a4 withDuration:(double)a5 unscaledContentOffset:(CGPoint)a6
{
  double x = a6.x;
  if ([(THDocumentViewController *)self p_allowsPageDisplacement])
  {
    [(THDocumentViewController *)self fitWidthViewScale];
    double v11 = v10;
    [(THDocumentViewController *)self fitHeightViewScale];
    double v13 = fmin(v11, v12);
    double v14 = v13 + v13 * 0.1;
    [(THDocumentViewController *)self p_currentPageSize];
    *(float *)&double v15 = x / v15;
    unint64_t v16 = vcvtas_u32_f32(*(float *)&v15);
    mPageViewDisplacement = self->mPageViewDisplacement;
    [(THDocumentViewController *)self zoomedOutViewScale];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_17FB8;
    v19[3] = &unk_456EB0;
    v19[4] = self;
    [(THPageViewDisplacement *)mPageViewDisplacement animateZoomWithDuration:v16 initialPageIndex:v19 minViewScale:a5 maxViewScale:v18 currentViewScale:v14 enumerator:a4];
  }
}

- (CGPoint)interactiveCanvasController:(id)a3 clampContentOffset:(CGPoint)a4 forViewScale:(double)a5
{
  CGFloat y = a4.y;
  double x = a4.x;
  if (!self->mDisableContentOffsetClamping)
  {
    [(THDocumentViewController *)self zoomedOutViewScale];
    double v11 = vabdd_f64(a5, v10);
    if (v11 < 0.00999999978)
    {
      [*(id *)&self->TSADocumentViewController_opaque[OBJC_IVAR___TSADocumentViewController__scrollView] bounds];
      double v13 = v12;
      unsigned int v14 = [(THDocumentViewController *)self isTwoUp];
      double v15 = v13 * 0.5;
      if (!v14) {
        double v15 = v13;
      }
      double v11 = floor((x + v15 * 0.5) / v15);
    }
    objc_msgSend(objc_msgSend(-[THDocumentViewController canvasViewController](self, "canvasViewController", v11), "canvasLayer"), "minimumPinchViewScale");
    if (vabdd_f64(a5, v16) >= 0.00999999978) {
      [(THDocumentViewController *)self p_maxScrollViewSize];
    }
    else {
      [self canvasScrollView].frame;
    }
    objc_msgSend(objc_msgSend(objc_msgSend(a3, "layerHost"), "canvasLayer"), "unscaledSize");
    TSDMultiplySizeScalar();
    uint64_t v17 = OBJC_IVAR___TSADocumentViewController__scrollView;
    [*(id *)&self->TSADocumentViewController_opaque[OBJC_IVAR___TSADocumentViewController__scrollView] bounds];
    [*(id *)&self->TSADocumentViewController_opaque[v17] bounds];
    [*(id *)&self->TSADocumentViewController_opaque[v17] bounds];
    TSUClamp();
    double x = v18;
    [*(id *)&self->TSADocumentViewController_opaque[v17] bounds];
    TSUClamp();
    CGFloat y = v19;
  }
  double v20 = x;
  double v21 = y;
  result.CGFloat y = v21;
  result.double x = v20;
  return result;
}

- (double)interactiveCanvasController:(id)a3 adjustViewScale:(double)a4
{
  [(THDocumentViewController *)self fitWidthViewScale];
  [(THDocumentViewController *)self fitHeightViewScale];
  if (vabdd_f64(a4, v6) >= 0.1) {
    double v6 = a4;
  }
  [(THDocumentViewController *)self zoomedInViewScale];
  [(THDocumentViewController *)self zoomedOutViewScale];

  TSUClamp();
  return result;
}

- (double)nextCanvasViewScaleDetentForProposedViewScale:(double)a3 greater:(BOOL)a4
{
  [(THDocumentViewController *)self currentViewScale];
  [(THDocumentViewController *)self zoomedInViewScale];
  [(THDocumentViewController *)self zoomedOutViewScale];
  [(THDocumentViewController *)self fitWidthViewScale];
  [(THDocumentViewController *)self fitHeightViewScale];

  TSUClamp();
  return result;
}

- (BOOL)interactiveCanvasControllerShouldUseGuidedPan:(id)a3 withMovementDirection:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  objc_opt_class();
  double v7 = (void *)TSUDynamicCast();
  if ((([v7 isCompactWidth] & 1) != 0 || objc_msgSend(v7, "isCompactHeight"))
    && [(THGuidedPanController *)[(THDocumentViewController *)self guidedPanController] wantsToHandlePan])
  {
    return 1;
  }
  [self interactiveCanvasController].viewScale;
  double v10 = v9;
  [(THDocumentViewController *)self zoomedOutViewScale];
  if (vabdd_f64(v10, v11) >= 0.00999999978) {
    return 0;
  }
  double v12 = [(THDocumentViewController *)self revealTOCPanController];

  return -[THRevealTOCPanController wantsToHandlePanInDirection:](v12, "wantsToHandlePanInDirection:", x, y);
}

- (id)panGuideForInteractiveCanvasController:(id)a3 withMovementDirection:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  objc_opt_class();
  double v7 = (void *)TSUDynamicCast();
  if (([v7 isCompactWidth] & 1) == 0 && !objc_msgSend(v7, "isCompactHeight")
    || ![(THGuidedPanController *)[(THDocumentViewController *)self guidedPanController] wantsToHandlePan]|| (id result = [(THDocumentViewController *)self guidedPanController]) == 0)
  {
    [self interactiveCanvasController].viewScale;
    double v10 = v9;
    [(THDocumentViewController *)self zoomedOutViewScale];
    if (vabdd_f64(v10, v11) < 0.00999999978
      && -[THRevealTOCPanController wantsToHandlePanInDirection:]([(THDocumentViewController *)self revealTOCPanController], "wantsToHandlePanInDirection:", x, y))
    {
      return [(THDocumentViewController *)self revealTOCPanController];
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (BOOL)interactiveCanvasControllerShouldDeferViewCreation:(id)a3
{
  return [(THDocumentViewController *)self performanceMode] != 0;
}

- (void)guidedPanWillBegin
{
  [(THDocumentViewController *)self setInGuidedPan:1];
  [(THDocumentViewController *)self hideToolbarAnimated:1];
  if ([(THDocumentViewController *)self p_allowsPageDisplacement])
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    CGAffineTransform v3[2] = sub_18748;
    v3[3] = &unk_456EB0;
    v3[4] = self;
    [(THPageViewDisplacement *)[(THDocumentViewController *)self pageViewDisplacement] animateOpacityAndDisplaymentProgess:[(THDocumentViewController *)self currentRelativePageIndex] delay:v3 duration:0.0 initialPageIndex:0.0 enumerator:0.15];
  }
}

- (void)guidedPanWillAnimateFrom:(id)a3 to:(id)a4 duration:(double)a5
{
  if ([(THDocumentViewController *)self p_allowsPageDisplacement]
    && ![a4 guidedPanTargetKind])
  {
    id v9 = [a4 guidedPanRelativePageIndexWithController:[self guidedPanController]];
    if ([a3 guidedPanTargetKind]) {
      double v10 = 0.2;
    }
    else {
      double v10 = 0.5;
    }
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_189D4;
    v11[3] = &unk_457118;
    v11[4] = self;
    void v11[5] = v9;
    [(THPageViewDisplacement *)[(THDocumentViewController *)self pageViewDisplacement] animateOpacityAndDisplaymentProgess:v9 delay:v11 duration:1.0 initialPageIndex:v10 * a5 enumerator:(1.0 - v10) * a5];
  }
}

- (void)guidedPanDidEnd
{
  [(THDocumentViewController *)self p_canvasDidZoom];

  [(THDocumentViewController *)self setInGuidedPan:0];
}

- (int64_t)guidedPanPageIndexForLayout:(id)a3
{
  id v4 = objc_msgSend(objc_msgSend(a3, "pageLayout"), "info");

  return [(THDocumentViewController *)self p_relativePageIndexForPageInfo:v4];
}

- (int)widgetLayoutMode:(id)a3
{
  return 0;
}

- (CGRect)widgetLayoutBounds
{
  id v2 = [(THDocumentViewController *)self view];

  [v2 bounds];
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (BOOL)widgetLayoutIsCompact:(id)a3
{
  if ([(THDocumentViewController *)self th_cachedIsCompactHeight]) {
    return 1;
  }

  return [(THDocumentViewController *)self th_cachedIsCompactWidth];
}

- (void)flowPageControllerWillChangeContentHeight:(id)a3
{
  if (!self->mLayoutAnchor)
  {
    double v4 = [(THDocumentViewController *)self activeSectionController];
    [self interactiveCanvasController].contentOffset;
    self->mLayoutAnchor = (THFlowLayoutAnchor *)[(THSectionController *)v4 layoutAnchorForContentOffset:"layoutAnchorForContentOffset:"];
  }
}

- (CGRect)flowPageController:(id)a3 overrideForBodyFrame:(CGRect)a4
{
  CGFloat height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  if ([(THDocumentViewController *)self p_isCompactFlowPresentation]
    || [(THDocumentViewController *)self isEpub])
  {
    [(THDocumentViewController *)self p_windowOrViewSize];
    double v10 = v9;
    if ([(THDocumentViewController *)self isEpub])
    {
      [(THPresentationType *)[(THDocumentViewController *)self currentPresentationType] contentInsets];
    }
    else
    {
      [(THDocumentReflowableLayoutConfiguration *)[(THDocumentViewController *)self configuration] contentInsets];
      [THDocumentReflowableLayoutConfiguration environment:[THDocumentViewController configuration] safeAreaInsets];
      UIEdgeInsetsAdd();
    }
    double x = v11;
    double v13 = v12;
    double y = y * (v10 / 768.0);
    if ([(THDocumentViewController *)self isEpub]) {
      double y = y + 20.0;
    }
    double width = v10 - x - v13;
  }
  double v14 = x;
  double v15 = y;
  double v16 = width;
  double v17 = height;
  result.size.CGFloat height = v17;
  result.size.double width = v16;
  result.origin.double y = v15;
  result.origin.double x = v14;
  return result;
}

- (BOOL)flowPageController:(id)a3 isEdgeObscured:(unsigned int)a4
{
  UIUserInterfaceLayoutDirection v6 = [+[UIApplication sharedApplication] userInterfaceLayoutDirection];
  BOOL v7 = [(THDocumentViewController *)self isEpub];
  if (v7)
  {
    if (a4 != 2 || v6 == UIUserInterfaceLayoutDirectionRightToLeft)
    {
      if (a4) {
        BOOL v8 = 0;
      }
      else {
        BOOL v8 = v6 == UIUserInterfaceLayoutDirectionRightToLeft;
      }
      LOBYTE(v7) = v8;
    }
    else
    {
      LOBYTE(v7) = 1;
    }
  }
  return v7;
}

- (id)p_overscrollBarWithFrame:(CGRect)a3 chapterIndex:(unint64_t)a4 tocTile:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  id v8 = [objc_alloc((Class)UIImageView) initWithFrame:CGRectMake(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height)];
  id v9 = objc_msgSend(objc_msgSend(a5, "portraitEntries"), "count");
  if (v9) {
    id v9 = objc_msgSend(objc_msgSend(a5, "portraitEntries"), "objectAtIndex:", 0);
  }
  id v10 = [v9 sectionIdentifier];
  TSUScreenScale();
  CGFloat v12 = v11;
  v30.double width = width;
  v30.double height = height;
  UIGraphicsBeginImageContextWithOptions(v30, 0, v12);
  Mutable = CFAttributedStringCreateMutable(0, 0);
  CFAttributedStringBeginEditing(Mutable);
  if (v10 && [v10 length])
  {
    double v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", [(id)THBundle() localizedStringForKey:@"Chapter %@" value:&stru_46D7E8 table:0], v10);
    double v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ %@", v14, [a5 frontTitleText]);
  }
  else
  {
    double v15 = (__CFString *)[a5 frontTitleText];
    double v14 = 0;
  }
  v26.location = 0;
  v26.length = 0;
  CFAttributedStringReplaceString(Mutable, v26, v15);
  CTFontRef UIFontForLanguage = CTFontCreateUIFontForLanguage(kCTFontUIFontEmphasizedSystem, 20.0, 0);
  v27.length = (CFIndex)[(__CFString *)v15 length];
  v27.location = 0;
  CFAttributedStringSetAttribute(Mutable, v27, kCTFontAttributeName, UIFontForLanguage);
  id v17 = [(__CFString *)v15 length];
  double v18 = [+[UIColor colorWithWhite:0.666666687 alpha:1.0] CGColor];
  v28.location = 0;
  v28.length = (CFIndex)v17;
  CFAttributedStringSetAttribute(Mutable, v28, kCTForegroundColorAttributeName, v18);
  if (v14)
  {
    NSUInteger v19 = [(NSString *)v14 length];
    double v20 = [+[UIColor colorWithWhite:0.376470596 alpha:1.0] CGColor];
    v29.location = 0;
    v29.length = v19;
    CFAttributedStringSetAttribute(Mutable, v29, kCTForegroundColorAttributeName, v20);
  }
  CFRelease(UIFontForLanguage);
  CFAttributedStringEndEditing(Mutable);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  long long v22 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&v25.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&v25.c = v22;
  *(_OWORD *)&v25.tdouble x = *(_OWORD *)&CGAffineTransformIdentity.tx;
  CGContextSetTextMatrix(CurrentContext, &v25);
  CGContextTranslateCTM(CurrentContext, 0.0, height);
  CGContextScaleCTM(CurrentContext, 1.0, -1.0);
  double v23 = CTLineCreateWithAttributedString(Mutable);
  CGRect ImageBounds = CTLineGetImageBounds(v23, CurrentContext);
  CGContextSetTextPosition(CurrentContext, (width - ImageBounds.size.width) * 0.5, floor((height - ImageBounds.size.height) * 0.5));
  CTLineDraw(v23, CurrentContext);
  CFRelease(v23);
  CFRelease(Mutable);
  [v8 setImage:UIGraphicsGetImageFromCurrentImageContext()];
  UIGraphicsEndImageContext();
  return v8;
}

- (BOOL)p_canOverscroll
{
  if ([(THDocumentViewController *)self isRotating]) {
    return 0;
  }
  [(THDocumentViewController *)self currentViewScale];
  double v5 = v4;
  [(THDocumentViewController *)self zoomedOutViewScale];
  return vabdd_f64(v5, v6) < 0.00999999978;
}

- (void)p_setupOverscrollViews
{
  unsigned int v3 = [(THDocumentViewController *)self p_canOverscroll];
  if (!v3)
  {
LABEL_52:
    uint64_t v58 = v3 ^ 1;
    [(UIView *)[(THDocumentViewController *)self topOverscrollView] setHidden:v58];
    [(UIView *)[(THDocumentViewController *)self bottomOverscrollView] setHidden:v58];
    [(THOverscrollImageView *)[(THDocumentViewController *)self leftOverscrollView] setHidden:v58];
    [(THOverscrollImageView *)[(THDocumentViewController *)self rightOverscrollView] setHidden:v58];
    return;
  }
  long long v4 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v82[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v82[1] = v4;
  v82[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  [(CALayer *)[(UIView *)[(THDocumentViewController *)self topOverscrollView] layer] setAffineTransform:v82];
  long long v5 = *(_OWORD *)&CGAffineTransformIdentity.c;
  long long v79 = *(_OWORD *)&CGAffineTransformIdentity.a;
  long long v80 = v5;
  long long v81 = *(_OWORD *)&CGAffineTransformIdentity.tx;
  v78[0] = v79;
  v78[1] = v5;
  v78[2] = v81;
  [(CALayer *)[(UIView *)[(THDocumentViewController *)self bottomOverscrollView] layer] setAffineTransform:v78];
  double width = CGSizeZero.width;
  double height = CGSizeZero.height;
  if ([(THDocumentViewController *)self activeSectionController])
  {
    [(THDocumentViewController *)self p_desiredCanvasSize];
    [(THDocumentViewController *)self currentViewScale];
    TSDMultiplySizeScalar();
    double width = v8;
    double height = v9;
  }
  unint64_t v10 = [(THDocumentViewController *)self currentChapter];
  if (v10 != self->mOverscrollViewChapterNumber)
  {
    [(THDocumentViewController *)self p_releaseOverscrollViews];
    self->mOverscrollViewChapterNumber = v10;
  }
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v11 = objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "tocModel"), "tiles");
    unsigned int v12 = [(THDocumentViewController *)self inFlowMode];
    uint64_t v13 = OBJC_IVAR___TSADocumentViewController__scrollView;
    double v14 = *(void **)&self->TSADocumentViewController_opaque[OBJC_IVAR___TSADocumentViewController__scrollView];
    if (v12)
    {
      [v14 setAlwaysBounceHorizontal:0];
      [*(id *)&self->TSADocumentViewController_opaque[v13] setAlwaysBounceVertical:1];
      [(THOverscrollImageView *)[(THDocumentViewController *)self leftOverscrollView] removeFromSuperview];
      [(THOverscrollImageView *)[(THDocumentViewController *)self rightOverscrollView] removeFromSuperview];
      [*(id *)&self->TSADocumentViewController_opaque[v13] frame];
      [*(id *)&self->TSADocumentViewController_opaque[v13] frame];
      double v16 = v15;
      [*(id *)&self->TSADocumentViewController_opaque[v13] frame];
      double v18 = v17;
      float v19 = height;
      float v20 = v17;
      double v21 = fmaxf(v19, v20);
      double v22 = -20.0 - v17;
      if (v10 && !self->mTopOverscrollView && (v10 <= (unint64_t)[v11 count] || !v11))
      {
        self->mTopOverscrollView = [objc_alloc((Class)UIView) initWithFrame:0.0, v22, v16, v18];
        [(UIView *)self->mTopOverscrollView setBackgroundColor:[(THDocumentViewController *)self backgroundColor]];
        id v23 = -[THDocumentViewController p_overscrollBarWithFrame:chapterIndex:tocTile:](self, "p_overscrollBarWithFrame:chapterIndex:tocTile:", v10 - 1, [v11 objectAtIndex:v10 - 1], 0.0, v18 + -48.0, v16, 48.0);
        [v23 setAutoresizingMask:12];
        [(UIView *)self->mTopOverscrollView addSubview:v23];
      }
      if (!self->mBottomOverscrollView)
      {
        unint64_t v24 = v10 + 1;
        if (v24 < (unint64_t)[v11 count] || !v11)
        {
          self->mBottomOverscrollView = [objc_alloc((Class)UIView) initWithFrame:0.0, v21 + 20.0, v16, v18];
          [(UIView *)self->mBottomOverscrollView setBackgroundColor:[(THDocumentViewController *)self backgroundColor]];
          id v25 = -[THDocumentViewController p_overscrollBarWithFrame:chapterIndex:tocTile:](self, "p_overscrollBarWithFrame:chapterIndex:tocTile:", v24, [v11 objectAtIndex:v24], 0.0, 0.0, v16, 48.0);
          [v25 setAutoresizingMask:36];
          [(UIView *)self->mBottomOverscrollView addSubview:v25];
        }
      }
      if (![(UIView *)[(THDocumentViewController *)self topOverscrollView] superview]) {
        [*(id *)&self->TSADocumentViewController_opaque[v13] addSubview:[self topOverscrollView]];
      }
      if (!-[UIView superview](-[THDocumentViewController bottomOverscrollView](self, "bottomOverscrollView"), "superview"))[self->TSADocumentViewController_opaque[v13] addSubview: -[THDocumentViewController bottomOverscrollView](self, "bottomOverscrollView")]; {
      -[UIView setFrame:]([(THDocumentViewController *)self topOverscrollView], "setFrame:", 0.0, v22, v16, v18);
      }
      CFRange v26 = [(THDocumentViewController *)self bottomOverscrollView];
      double v27 = 0.0;
      double v28 = v21 + 20.0;
      double v29 = v16;
      double v30 = v18;
    }
    else
    {
      [v14 setAlwaysBounceHorizontal:1];
      [*(id *)&self->TSADocumentViewController_opaque[v13] setAlwaysBounceVertical:0];
      [(UIView *)[(THDocumentViewController *)self topOverscrollView] removeFromSuperview];
      [(UIView *)[(THDocumentViewController *)self bottomOverscrollView] removeFromSuperview];
      [*(id *)&self->TSADocumentViewController_opaque[v13] bounds];
      double v32 = v31;
      double v34 = v33;
      [*(id *)&self->TSADocumentViewController_opaque[v13] contentSize];
      if (v35 > 0.0)
      {
        [*(id *)&self->TSADocumentViewController_opaque[v13] contentSize];
        double v34 = v36;
      }
      double v37 = 1.0;
      if ([(THDocumentViewController *)self isTwoUp])
      {
        if ([(THDocumentViewController *)self p_isSinglePageChapter]) {
          double v37 = 0.0;
        }
        else {
          double v37 = 1.0;
        }
      }
      [self interactiveCanvasController].viewScale;
      if (v38 == 1.0) {
        double v39 = 0.0;
      }
      else {
        double v39 = v37;
      }
      double v40 = v32 + v39;
      double v41 = v39 - v40;
      if (v10 && !self->mLeftOverscrollView && (v10 <= (unint64_t)[v11 count] || !v11))
      {
        self->mLeftOverscrollView = -[THOverscrollImageView initWithFrame:]([THOverscrollImageView alloc], "initWithFrame:", v39 - v40, 0.0, v40, v34);
        [(THOverscrollImageView *)self->mLeftOverscrollView setBackgroundColor:[(THDocumentViewController *)self backgroundColor]];
        [self->mLeftOverscrollView.layer setZPosition:-1.0];
        if (![(THDocumentViewController *)self isEpub])
        {
          if (v11)
          {
            id v42 = [v11 objectAtIndex:v10 - 1];
            id v43 = [[v42 largerThumbs] count];
            if (v43)
            {
              unint64_t v44 = (unint64_t)v43;
              if ([(THDocumentViewController *)self isTwoUp])
              {
                id v45 = [v42 largerThumbs];
                double v46 = (v40 - v40 * 0.5) * 0.5;
                if (v44 > 1) {
                  double v46 = v40 * 0.5;
                }
                double v77 = v46;
                CGRect v47 = +[UIImage imageWithCGImage:](UIImage, "imageWithCGImage:", +[TSDBitmapImageProvider CGImageForImageData:](TSDBitmapImageProvider, "CGImageForImageData:", [v45 objectAtIndex:v44 - 1]));
                CGRectMakeWithSize();
                CGRect v50 = -[THOverscrollImageView initWithFrame:]([THOverscrollImageView alloc], "initWithFrame:", v77, v48, v40 * 0.5, v49);
                [(THOverscrollImageView *)v50 setImage:v47];
                [(THOverscrollImageView *)self->mLeftOverscrollView addSubview:v50];
                BOOL v51 = v44 >= 2;
                unint64_t v52 = v44 - 2;
                if (v51)
                {
                  CGRect v53 = +[UIImage imageWithCGImage:](UIImage, "imageWithCGImage:", +[TSDBitmapImageProvider CGImageForImageData:](TSDBitmapImageProvider, "CGImageForImageData:", objc_msgSend(objc_msgSend(v42, "largerThumbs"), "objectAtIndex:", v52)));
                  CGRectMakeWithSize();
                  v56 = -[THOverscrollImageView initWithFrame:]([THOverscrollImageView alloc], "initWithFrame:", 0.0, v54, v40 * 0.5, v55);
                  [(THOverscrollImageView *)v56 setImage:v53];
                  [(THOverscrollImageView *)self->mLeftOverscrollView addSubview:v56];
                }
                else
                {
                  [(THOverscrollImageView *)self->mLeftOverscrollView setBackgroundColor:+[UIColor clearColor]];
                }
              }
              else
              {
                -[THOverscrollImageView setImage:](self->mLeftOverscrollView, "setImage:", +[UIImage imageWithCGImage:](UIImage, "imageWithCGImage:", +[TSDBitmapImageProvider CGImageForImageData:](TSDBitmapImageProvider, "CGImageForImageData:", objc_msgSend(objc_msgSend(v42, "largerThumbs"), "objectAtIndex:", v44 - 1))));
              }
            }
          }
        }
      }
      double v57 = width - v39;
      if (!self->mRightOverscrollView)
      {
        if (v10 + 1 >= (unint64_t)[v11 count] && v11)
        {
          id v59 = [[[v11 objectAtIndex:v10] largerThumbs] count];
          if (![(THDocumentViewController *)self isEpub]
            && (![(THDocumentViewController *)self isTwoUp] || (unint64_t)v59 >= 2))
          {
            v60 = -[THOverscrollImageView initWithFrame:]([THOverscrollImageView alloc], "initWithFrame:", v57, 0.0, v40, v34);
            self->mRightOverscrollView = v60;
            [(THOverscrollImageView *)v60 setClipsToBounds:1];
            id v61 = [(THOverscrollImageView *)self->mRightOverscrollView layer];
            [v61 setShadowColor:[+[UIColor blackColor](UIColor, "blackColor") CGColor]];
            [v61 setShadowOffset:CGSizeMake(5.0, 0.0)];
            LODWORD(v62) = 1050253722;
            [v61 setShadowOpacity:v62];
            Mutable = CGPathCreateMutable();
            [(THOverscrollImageView *)self->mRightOverscrollView bounds];
            v83.origin.double x = v64 + -10.0;
            v83.size.double width = 10.0;
            CGPathAddRect(Mutable, 0, v83);
            [v61 setShadowPath:Mutable];
            CGPathRelease(Mutable);
          }
        }
        else
        {
          self->mRightOverscrollView = -[THOverscrollImageView initWithFrame:]([THOverscrollImageView alloc], "initWithFrame:", v57, 0.0, v40, v34);
          [(THOverscrollImageView *)self->mRightOverscrollView setBackgroundColor:[(THDocumentViewController *)self backgroundColor]];
          [self->mRightOverscrollView layer].zPosition = -1.0;
          if (![(THDocumentViewController *)self isEpub])
          {
            if (v11)
            {
              id v65 = [v11 objectAtIndex:v10 + 1];
              id v66 = [[[v65 largerThumbs] count];
              if (v66)
              {
                unint64_t v67 = (unint64_t)v66;
                if ([(THDocumentViewController *)self isTwoUp])
                {
                  v68 = +[UIImage imageWithCGImage:](UIImage, "imageWithCGImage:", +[TSDBitmapImageProvider CGImageForImageData:](TSDBitmapImageProvider, "CGImageForImageData:", objc_msgSend(objc_msgSend(v65, "largerThumbs"), "objectAtIndex:", 0)));
                  if (v67 <= 1) {
                    double v69 = (v40 - v40 * 0.5) * 0.5;
                  }
                  else {
                    double v69 = 0.0;
                  }
                  CGRectMakeWithSize();
                  v72 = -[THOverscrollImageView initWithFrame:]([THOverscrollImageView alloc], "initWithFrame:", v69, v70, v40 * 0.5, v71);
                  [(THOverscrollImageView *)v72 setImage:v68];
                  [(THOverscrollImageView *)self->mRightOverscrollView addSubview:v72];
                  if (v67 < 2)
                  {
                    [(THOverscrollImageView *)self->mRightOverscrollView setBackgroundColor:+[UIColor clearColor]];
                  }
                  else
                  {
                    v73 = +[UIImage imageWithCGImage:](UIImage, "imageWithCGImage:", +[TSDBitmapImageProvider CGImageForImageData:](TSDBitmapImageProvider, "CGImageForImageData:", objc_msgSend(objc_msgSend(v65, "largerThumbs"), "objectAtIndex:", 1)));
                    CGRectMakeWithSize();
                    v76 = -[THOverscrollImageView initWithFrame:]([THOverscrollImageView alloc], "initWithFrame:", v40 * 0.5, v74, v40 * 0.5, v75);
                    [(THOverscrollImageView *)v76 setImage:v73];
                    [(THOverscrollImageView *)self->mRightOverscrollView addSubview:v76];
                  }
                }
                else
                {
                  -[THOverscrollImageView setImage:](self->mRightOverscrollView, "setImage:", +[UIImage imageWithCGImage:](UIImage, "imageWithCGImage:", +[TSDBitmapImageProvider CGImageForImageData:](TSDBitmapImageProvider, "CGImageForImageData:", objc_msgSend(objc_msgSend(v65, "largerThumbs"), "objectAtIndex:", 0))));
                }
              }
            }
          }
        }
      }
      if (!-[THOverscrollImageView superview](-[THDocumentViewController leftOverscrollView](self, "leftOverscrollView"), "superview"))[self leftOverscrollView] addSubview: -[THDocumentViewController leftOverscrollView](self, "leftOverscrollView"); {
      if (!-[THOverscrollImageView superview](-[THDocumentViewController rightOverscrollView](self, "rightOverscrollView"), "superview"))[self addSubview: -[THDocumentViewController rightOverscrollView](self, "rightOverscrollView")];
      }
      -[THOverscrollImageView setFrame:]([(THDocumentViewController *)self leftOverscrollView], "setFrame:", v41, 0.0, v40, v34);
      CFRange v26 = [(THDocumentViewController *)self rightOverscrollView];
      double v28 = 0.0;
      double v27 = v57;
      double v29 = v40;
      double v30 = v34;
    }
    -[THOverscrollImageView setFrame:](v26, "setFrame:", v27, v28, v29, v30);
    [(THDocumentViewController *)self p_updateVerticalOverscrollTransform];
    goto LABEL_52;
  }
}

- (void)p_releaseOverscrollViews
{
  [(UIView *)[(THDocumentViewController *)self topOverscrollView] removeFromSuperview];
  [(UIView *)[(THDocumentViewController *)self bottomOverscrollView] removeFromSuperview];
  [(THDocumentViewController *)self setTopOverscrollView:0];
  [(THDocumentViewController *)self setBottomOverscrollView:0];
  [(THOverscrollImageView *)[(THDocumentViewController *)self leftOverscrollView] removeFromSuperview];
  [(THOverscrollImageView *)[(THDocumentViewController *)self rightOverscrollView] removeFromSuperview];
  [(THDocumentViewController *)self setLeftOverscrollView:0];

  [(THDocumentViewController *)self setRightOverscrollView:0];
}

- (void)p_fadeOutOverscrollTransition
{
  if ([(THDocumentViewController *)self overscrollTransitionView])
  {
    if (self->mOverscrollTransitionInProcess)
    {
      [(THDocumentViewController *)self p_updateVisibleInfos];
      v4[0] = _NSConcreteStackBlock;
      v4[1] = 3221225472;
      CGAffineTransform v4[2] = sub_19E20;
      v4[3] = &unk_456DE0;
      v4[4] = self;
      v3[0] = _NSConcreteStackBlock;
      v3[1] = 3221225472;
      CGAffineTransform v3[2] = sub_19E50;
      v3[3] = &unk_457140;
      v3[4] = self;
      +[UIView animateWithDuration:0 delay:v4 options:v3 animations:0.25 completion:0.0];
      self->mOverscrollTransitionInProcess = 0;
      [(THDocumentViewController *)self setLastStorageAnchor:0];
      [(THDocumentViewController *)self setJustUpdatedPresentationType:0];
    }
  }
}

- (void)p_setupVerticalOverscrollTransitionAnimationToChapter:(id)a3
{
  id v5 = [(THDocumentViewController *)self view];
  [(UIView *)[(THDocumentViewController *)self overscrollTransitionView] frame];
  [v5 convertRect:*(void *)&self->TSADocumentViewController_opaque[OBJC_IVAR___TSADocumentViewController__scrollView] fromView:v5];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  [(UIView *)[(THDocumentViewController *)self overscrollTransitionView] removeFromSuperview];
  -[UIView setFrame:]([(THDocumentViewController *)self overscrollTransitionView], "setFrame:", v7, v9, v11, v13);
  [self.view addSubview:[self overscrollTransitionView]];
  [(THDocumentViewController *)self p_verticalOverscrollAnimationDuration];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1A044;
  v15[3] = &unk_456DE0;
  v15[4] = self;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v15, &stru_457160);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1A0C8;
  v14[3] = &unk_456E38;
  v14[4] = self;
  void v14[5] = a3;
  [+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue") addOperation:+[NSBlockOperation blockOperationWithBlock:v14]];
}

- (void)p_verticalOverscrollSetPreviousChapterNavigationUnit:(id)a3
{
  [self interactiveCanvasController].pushThreadedLayoutAndRenderDisabled;
  [(THDocumentViewController *)self setCurrentNavigationUnit:a3];
  -[THDocumentViewController setVisibleRelativePageRange:](self, "setVisibleRelativePageRange:", NSInvalidRange[0], NSInvalidRange[1]);
  [(THDocumentViewController *)self updateVisibleInfos];
  id v5 = [(THDocumentViewController *)self activeSectionController];
  [self interactiveCanvasController].visibleHeight
  [v5 layoutContentFromBottom:[-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController") layoutController] layoutController:v6 + v6];
  [self interactiveCanvasController] popThreadedLayoutAndRenderDisabled;
  [(THDocumentViewController *)self p_desiredCanvasSize];
  TSDRectWithSize();
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  [*(id *)&self->TSADocumentViewController_opaque[OBJC_IVAR___TSADocumentViewController__scrollView] bounds];
  if (v14 > v15)
  {
    double v16 = v14 - v15;
  }
  else
  {
    double v15 = v14;
    double v16 = v10;
  }

  -[THDocumentViewController p_setUnscaledCanvasRect:](self, "p_setUnscaledCanvasRect:", v8, v16, v12, v15);
}

- (void)p_verticalOverscrollPreviousChapter
{
  unint64_t v3 = [(THDocumentViewController *)self currentChapter];
  if (v3 && v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v4 = [(THDocumentViewController *)self navigationUnitForChapterIndex:v3 - 1];
    if (v4)
    {
      id v5 = v4;
      self->mOverscrollAnimationInProcess = 1;
      id v6 = [(THDocumentViewController *)self view];
      [(UIView *)[(THDocumentViewController *)self topOverscrollView] frame];
      uint64_t v7 = OBJC_IVAR___TSADocumentViewController__scrollView;
      [v6 convertRect:*(void *)&self->TSADocumentViewController_opaque[OBJC_IVAR___TSADocumentViewController__scrollView] fromView:v6];
      double v9 = v8;
      double v11 = v10;
      double v12 = v10 + v10;
      -[THDocumentViewController setOverscrollTransitionView:[objc_alloc((Class)UIView) initWithFrame:v13, v14, v8, v10 + v10]];
      [(UIView *)[(THDocumentViewController *)self topOverscrollView] removeFromSuperview];
      -[UIView setFrame:]([(THDocumentViewController *)self topOverscrollView], "setFrame:", 0.0, 0.0, v9, v11);
      [(UIView *)[(THDocumentViewController *)self overscrollTransitionView] addSubview:[(THDocumentViewController *)self topOverscrollView]];
      [self view].addSubview:[self overscrollTransitionView];
      objc_msgSend(objc_msgSend(objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "layerHost"), "canvasLayer"), "pushLayoutDisabled");
      id v15 = [[self interactiveCanvasController] canvasView];
      [v15 removeFromSuperview];
      [v15 frame];
      double v17 = v16;
      uint64_t v19 = v18;
      uint64_t v21 = v20;
      double v22 = v11 + 20.0;
      [v15 setFrame:v16, v22];
      [(UIView *)[(THDocumentViewController *)self overscrollTransitionView] addSubview:v15];
      [*(id *)&self->TSADocumentViewController_opaque[v7] frame];
      uint64_t v24 = v23;
      uint64_t v26 = v25;
      [(THDocumentViewController *)self setTopOverscrollView:0];
      [(THDocumentViewController *)self p_verticalOverscrollAnimationDuration];
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_1A498;
      v28[3] = &unk_457188;
      v28[4] = self;
      v28[5] = v24;
      v28[6] = v26;
      *(double *)&v28[7] = v9;
      *(double *)&v28[8] = v12;
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_1A4EC;
      v27[3] = &unk_4571B0;
      *(double *)&v27[7] = v17;
      *(double *)&v27[8] = v22;
      v27[9] = v19;
      v27[10] = v21;
      v27[4] = v15;
      v27[5] = self;
      v27[6] = v5;
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v28, v27);
    }
  }
}

- (void)p_verticalOverscrollNextChapter
{
  unint64_t v3 = [(THDocumentViewController *)self currentChapter];
  id v4 = objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "tocModel"), "tiles");
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v5 = v3 + 1;
    if (v5 < (unint64_t)[v4 count])
    {
      id v6 = [(THDocumentViewController *)self navigationUnitForChapterIndex:v5];
      if (v6)
      {
        id v7 = v6;
        self->mOverscrollAnimationInProcess = 1;
        id v8 = [(THDocumentViewController *)self view];
        [(UIView *)[(THDocumentViewController *)self bottomOverscrollView] frame];
        uint64_t v9 = OBJC_IVAR___TSADocumentViewController__scrollView;
        [v8 convertRect:*(void *)&self->TSADocumentViewController_opaque[OBJC_IVAR___TSADocumentViewController__scrollView] fromView:self];
        double v11 = v10;
        double v13 = v12;
        double v14 = v12 + v12;
        -[self setOverscrollTransitionView:[objc_alloc((Class)UIView) initWithFrame:v16, v15 - v12, v10, v12 + v12]];
        [(UIView *)[(THDocumentViewController *)self bottomOverscrollView] removeFromSuperview];
        -[UIView setFrame:]([(THDocumentViewController *)self bottomOverscrollView], "setFrame:", 0.0, v13, v11, v13);
        [(UIView *)[(THDocumentViewController *)self overscrollTransitionView] addSubview:[(THDocumentViewController *)self bottomOverscrollView]];
        [(-[THDocumentViewController view](self, "view")) addSubview:(-[THDocumentViewController overscrollTransitionView](self, "overscrollTransitionView"))];
        objc_msgSend(objc_msgSend(objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "layerHost"), "canvasLayer"), "pushLayoutDisabled");
        id v17 = [[self interactiveCanvasController] canvasView];
        [v17 removeFromSuperview];
        [v17 frame];
        double v19 = v18;
        uint64_t v21 = v20;
        double v23 = v22;
        double v24 = v13 + -20.0 - v22;
        [v17 setFrame:v18, v24];
        [(UIView *)[(THDocumentViewController *)self overscrollTransitionView] addSubview:v17];
        [*(id *)&self->TSADocumentViewController_opaque[v9] frame];
        uint64_t v26 = v25;
        double v28 = v27 - v13;
        [(THDocumentViewController *)self setBottomOverscrollView:0];
        [(THDocumentViewController *)self p_verticalOverscrollAnimationDuration];
        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472;
        v30[2] = sub_1A944;
        v30[3] = &unk_457188;
        v30[4] = self;
        v30[5] = v26;
        *(double *)&v30[6] = v28;
        *(double *)&v30[7] = v11;
        *(double *)&v30[8] = v14;
        v29[0] = _NSConcreteStackBlock;
        v29[1] = 3221225472;
        v29[2] = sub_1A998;
        v29[3] = &unk_4571B0;
        *(double *)&v29[7] = v19;
        *(double *)&v29[8] = v24;
        v29[9] = v21;
        *(double *)&v29[10] = v23;
        v29[4] = v17;
        v29[5] = self;
        v29[6] = v7;
        +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v30, v29);
      }
    }
  }
}

- (void)p_animateHorizontalOverscrollToPageIndex:(unint64_t)a3 duration:(double)a4 animationCompletionBlock:(id)a5 layoutCompletionBlock:(id)a6
{
  if (!-[THPresentationType isPaginated](-[THDocumentViewController currentPresentationType](self, "currentPresentationType"), "isPaginated"))[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentViewController p_animateHorizontalOverscrollToPageIndex:duration:animationCompletionBlock:layoutCompletionBlock:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentViewController.mm") lineNumber:5621 description:@"This animation is only supported in paginated layout."]; {
  unint64_t v11 = [(THDocumentViewController *)self currentAbsolutePageIndex];
  }
  id v12 = objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "navigationModel"), "navigationUnitRelativePageIndexForAbsolutePageIndex:forPresentationType:", v11, -[THDocumentViewController currentPresentationType](self, "currentPresentationType"));
  uint64_t v13 = OBJC_IVAR___TSADocumentViewController__scrollView;
  [*(id *)&self->TSADocumentViewController_opaque[OBJC_IVAR___TSADocumentViewController__scrollView] contentOffset];
  double v15 = v14;
  double v17 = v16;
  [(THSectionController *)[(THDocumentViewController *)self activeSectionController] canvasRectForRelativePageIndex:v12];
  double v19 = v18;
  [self interactiveCanvasController].viewScale;
  [*(id *)&self->TSADocumentViewController_opaque[v13] setContentOffset:v19 * v20 v17];
  [*(id *)&self->TSADocumentViewController_opaque[v13] contentOffset];
  double v22 = v21 - v15;
  [*(id *)&self->TSADocumentViewController_opaque[v13] bounds];
  if ((double)a3 <= (double)v11) {
    double v24 = v23;
  }
  else {
    double v24 = -v23;
  }
  if (vabdd_f64(v22, v24) >= 0.00999999978)
  {
    [self interactiveCanvasController].pushThreadedLayoutAndRenderDisabled;
    objc_msgSend(objc_msgSend(objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "layerHost"), "canvasLayer"), "pushLayoutDisabled");
    [*(id *)&self->TSADocumentViewController_opaque[v13] setUserInteractionEnabled:0];
    objc_opt_class();
    uint64_t v26 = (void *)TSUCheckedDynamicCast();
    double v27 = v26;
    if (v26 && [v26 preventBounceAnimation])
    {
      [v27 setPreventBounceAnimation:0];
      char v28 = 1;
    }
    else
    {
      char v28 = 0;
    }
    +[CATransaction begin];
    +[CATransaction setAnimationDuration:a4];
    +[CATransaction setAnimationTimingFunction:](CATransaction, "setAnimationTimingFunction:", +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]);
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_1AF9C;
    v34[3] = &unk_4571D8;
    v34[7] = a6;
    v34[8] = a3;
    v34[4] = self;
    v34[5] = v27;
    char v35 = v28;
    v34[6] = a5;
    +[CATransaction setCompletionBlock:v34];
    double v29 = +[CABasicAnimation animationWithKeyPath:@"sublayerTransform"];
    CATransform3DMakeTranslation(&v33, v22, 0.0, 0.0);
    [(CABasicAnimation *)v29 setFromValue:+[NSValue valueWithCATransform3D:&v33]];
    CATransform3DMakeTranslation(&v32, v24, 0.0, 0.0);
    [(CABasicAnimation *)v29 setToValue:+[NSValue valueWithCATransform3D:&v32]];
    [(CABasicAnimation *)v29 setTimingFunction:+[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [(CABasicAnimation *)v29 setRemovedOnCompletion:0];
    [(CABasicAnimation *)v29 setFillMode:kCAFillModeForwards];
    objc_msgSend(objc_msgSend(*(id *)&self->TSADocumentViewController_opaque[v13], "layer"), "addAnimation:forKey:", v29, @"slide-pages");
    if ([(THDocumentViewController *)self p_allowsPageDisplacement])
    {
      mPageViewProvider = self->mPageViewProvider;
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_1B084;
      v31[3] = &unk_457250;
      v31[4] = self;
      *(double *)&v31[5] = a4;
      [(THPageViewProvider *)mPageViewProvider syncPerformBlock:v31];
    }
    +[CATransaction commit];
  }
  else
  {
    if (a5) {
      (*((void (**)(id))a5 + 2))(a5);
    }
    [(THDocumentNavigator *)[(THDocumentViewController *)self documentNavigator] setVisibleAbsolutePhysicalPageIndex:a3];
    [self interactiveCanvasController].layoutInvalidated;
    [self interactiveCanvasController].layoutIfNeeded;
    +[CATransaction flush];
    if (a6)
    {
      uint64_t v25 = (void (*)(id))*((void *)a6 + 2);
      v25(a6);
    }
  }
}

- (void)p_setupHorizontalOverscrollTransitionAnimationToAbsolutePageIndex:(unint64_t)a3
{
  self->mOverscrollAnimationInProcess = 1;
  [(THDocumentViewController *)self p_horizontalOverscrollAnimationDuration];
  v5[4] = self;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1B268;
  v6[3] = &unk_456DE0;
  v6[4] = self;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1B32C;
  v5[3] = &unk_456DE0;
  -[THDocumentViewController p_animateHorizontalOverscrollToPageIndex:duration:animationCompletionBlock:layoutCompletionBlock:](self, "p_animateHorizontalOverscrollToPageIndex:duration:animationCompletionBlock:layoutCompletionBlock:", a3, v6, v5);
}

- (void)p_horizontalOverscrollPreviousChapter
{
  if (![(THDocumentViewController *)self overscrollTransitionView]
    && (![(THDocumentViewController *)self reflowablePaginationController]
     || [(THReflowablePaginationController *)[(THDocumentViewController *)self reflowablePaginationController] paginationComplete]))
  {
    if ([(THDocumentViewController *)self p_canOverscroll])
    {
      if ([(THDocumentViewController *)self leftOverscrollView])
      {
        unint64_t v3 = [(THDocumentViewController *)self currentChapter];
        if (v3)
        {
          if (v3 != 0x7FFFFFFFFFFFFFFFLL)
          {
            id v4 = [(THDocumentViewController *)self navigationUnitForChapterIndex:v3 - 1];
            if (v4)
            {
              unint64_t v5 = v4;
              [(THDocumentViewController *)self setOverscrollTransitionView:[(THDocumentViewController *)self leftOverscrollView]];
              [(THDocumentViewController *)self setLeftOverscrollView:0];
              id v6 = [(THDocumentViewController *)self currentPresentationType];
              id v7 = [v5 absolutePageIndexForRelativePageIndex:[v5 pageCountForPresentationType:v6] - 1 forPresentationType:v6];
              [(THDocumentViewController *)self p_setupHorizontalOverscrollTransitionAnimationToAbsolutePageIndex:v7];
            }
          }
        }
      }
    }
  }
}

- (void)p_horizontalOverscrollNextChapter
{
  if (![(THDocumentViewController *)self overscrollTransitionView]
    && (![(THDocumentViewController *)self reflowablePaginationController]
     || [(THReflowablePaginationController *)[(THDocumentViewController *)self reflowablePaginationController] paginationComplete]))
  {
    if ([(THDocumentViewController *)self p_canOverscroll])
    {
      if ([(THDocumentViewController *)self rightOverscrollView])
      {
        unint64_t v3 = [(THDocumentViewController *)self currentChapter];
        id v4 = objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "tocModel"), "tiles");
        if (v3 != 0x7FFFFFFFFFFFFFFFLL)
        {
          unint64_t v5 = v3 + 1;
          if (v5 < (unint64_t)[v4 count])
          {
            id v6 = [(THDocumentViewController *)self navigationUnitForChapterIndex:v5];
            if (v6)
            {
              id v7 = v6;
              [(THDocumentViewController *)self setOverscrollTransitionView:[(THDocumentViewController *)self rightOverscrollView]];
              [(THDocumentViewController *)self setRightOverscrollView:0];
              id v8 = [v7 absolutePageIndexForRelativePageIndex:0 forPresentationType:[self currentPresentationType]];
              [(THDocumentViewController *)self p_setupHorizontalOverscrollTransitionAnimationToAbsolutePageIndex:v8];
            }
          }
        }
      }
    }
  }
}

- (void)p_pageLeft
{
  id v2 = [(THDocumentViewController *)self interactiveCanvasController];

  [v2 pageLeft];
}

- (void)p_pageRight
{
  id v2 = [(THDocumentViewController *)self interactiveCanvasController];

  [v2 pageRight];
}

- (void)presentSearchResultsForString:(id)a3
{
  id v4 = [(THDocumentViewController *)self toolbarDelegate];

  [(THToolbarDelegate *)v4 showSearchPopoverWithText:a3];
}

- (BOOL)shouldEnableInspectorButton
{
  return 0;
}

- (void)showToolbarAnimated:(BOOL)a3
{
  [(THToolbarDelegate *)[(THDocumentViewController *)self toolbarDelegate] showToolbarAnimated:a3];

  [(THDocumentViewController *)self p_updatePageNumberViewVisibility];
}

- (void)hideToolbarAnimated:(BOOL)a3
{
  [(THToolbarDelegate *)[(THDocumentViewController *)self toolbarDelegate] hideToolbarAnimated:a3];

  [(THDocumentViewController *)self p_updatePageNumberViewVisibility];
}

- (void)settingToolbarHidden:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  [self.interactiveCanvasController updateBookmarkVisibleState];
  [(THDocumentViewController *)self p_updateScrubberCheckToolbarState:0];
  if (v4)
  {
    [(THDocumentViewController *)self setScrubberHiddenAnimated:v5];
  }
  else
  {
    id v7 = [(THDocumentViewController *)self scrubber];
    [(BKScrubberControl *)v7 setHidden:v5];
  }
}

- (void)setScrubberHiddenAnimated:(BOOL)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  CGAffineTransform v3[2] = sub_1B7C0;
  v3[3] = &unk_457278;
  v3[4] = self;
  BOOL v4 = a3;
  +[UIView transitionWithView:[(THDocumentViewController *)self scrubber] duration:256 options:v3 animations:0 completion:0.25];
}

- (void)toggleToolbar
{
  if (![(THDocumentViewController *)self showingExpandedWidgetView])
  {
    if ([(THToolbarDelegate *)[(THDocumentViewController *)self toolbarDelegate] isToolbarHidden])
    {
      [(THDocumentViewController *)self showToolbarAnimated:1];
    }
    else
    {
      [(THDocumentViewController *)self hideToolbarAnimated:1];
    }
  }
}

- (void)p_setUnscaledCanvasRect:(CGRect)a3
{
}

- (void)p_setUnscaledCanvasRect:(CGRect)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if ((![(THDocumentViewController *)self inFlowMode]
     || objc_msgSend(objc_msgSend(objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "layerHost"), "canvasLayer"), "isLayoutDisabled"))&& -[THDocumentViewController inFlowMode](self, "inFlowMode"))
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentViewController p_setUnscaledCanvasRect:animated:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentViewController.mm") lineNumber:5885 description:@"don't jump to a new location on the canvas if layout is disabled (flow mode won't take it well)"]
  }
  if ([(THDocumentViewController *)self inFlowMode])
  {

    self->mLayoutAnchor = 0;
    self->mLayoutAnchor = (THFlowLayoutAnchor *)-[THSectionController layoutAnchorForContentOffset:]([(THDocumentViewController *)self activeSectionController], "layoutAnchorForContentOffset:", x, y);
  }
  [self interactiveCanvasController].layoutInvalidated;
  -[THSectionController ensureLayoutThroughRect:pad:]([(THDocumentViewController *)self activeSectionController], "ensureLayoutThroughRect:pad:", [(THDocumentViewController *)self p_activePagePaddingOptions], x, y, width, height);
  [(THDocumentViewController *)self p_updateCanvasSize];
  [self interactiveCanvasController].setContentOffset:1 clamp:x, y animated:YES];
  [(THDocumentViewController *)self p_visibleRectChanged];
  if ((objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "currentlyWaitingOnThreadedLayoutAndRender") & 1) == 0)
  {
    [(THDocumentViewController *)self p_updateBookmarkAffordances];
    double v10 = [(THDocumentViewController *)self displaySleepController];
    [(BCDisplaySleepController *)v10 userInteractionOccurred];
  }
}

- (void)p_clearCanvas
{
  if ([self interactiveCanvasController].staticLayoutAndRenderOnThread) {
  [self interactiveCanvasController].setContentOffset:CGPointZero.x, CGPointZero.y);
  }
  -[THDocumentViewController setVisibleRelativePageRange:](self, "setVisibleRelativePageRange:", NSInvalidRange[0], NSInvalidRange[1]);
  [self interactiveCanvasController].pushThreadedLayoutAndRenderDisabled;
  [(THPageViewProvider *)[(THDocumentViewController *)self pageViewProvider] updateWithInfosToDisplay:0];
  [self interactiveCanvasController].setInfosToDisplay:[NSArray array]];
  id v3 = [(THDocumentViewController *)self interactiveCanvasController];

  [v3 popThreadedLayoutAndRenderDisabled];
}

- (id)currentContentNode
{
  id v2 = [(THDocumentViewController *)self documentNavigator];

  return [(THDocumentNavigator *)v2 currentContentNode];
}

- (double)p_horizontalOverscrollAnimationDuration
{
  BOOL IsVoiceOverRunning = UIAccessibilityIsVoiceOverRunning();
  double result = 0.5;
  if (IsVoiceOverRunning) {
    return 0.0;
  }
  return result;
}

- (double)p_verticalOverscrollAnimationDuration
{
  BOOL IsVoiceOverRunning = UIAccessibilityIsVoiceOverRunning();
  double result = 0.75;
  if (IsVoiceOverRunning) {
    return 0.0;
  }
  return result;
}

- (void)followAbsolutePageIndex:(unint64_t)a3
{
  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "navigationModel"), "contentNodeForAbsolutePageIndex:", a3);
    [(THDocumentViewController *)self p_ensureInNavigationUnitForContentNode:v6];
    id v7 = [v6 storageAnchorForNodeRelativePageIndex:[v6 relativePageIndexForAbsolutePageIndex:a3 forPresentationType:[THPresentationType paginatedPresentationTypeInContext:][THPresentationType context](-[THDocumentViewController currentPresentationType](self, "currentPresentationType"), "context")]];
    [v7 setAbsolutePageIndex:a3];
    [(THDocumentViewController *)self followAnchor:v7 pulse:0];
  }
}

- (BOOL)followAnchor:(id)a3 pulse:(BOOL)a4
{
  if (a3)
  {
    BOOL v4 = a4;
    if ([(THDocumentViewController *)self isEpub])
    {
      objc_opt_class();
      [(THDocumentViewController *)self setLastStorageAnchor:TSUDynamicCast()];
      [(THDocumentViewController *)self p_updatePresentationTypeAnimated:0];
    }
    [(THDocumentViewController *)self p_dismissActiveAnimated:1];
    BOOL v7 = [(THDocumentNavigator *)[(THDocumentViewController *)self documentNavigator] followAnchor:a3 pulse:v4];
    if (v7)
    {
      objc_opt_class();
      [(THDocumentViewController *)self setLastStorageAnchor:TSUDynamicCast()];
    }
    [(THDocumentViewController *)self p_updatePageNumberingForce:1];
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (BOOL)followLink:(id)a3
{
  return [(THDocumentViewController *)self followLink:a3 animated:1];
}

- (BOOL)followLink:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  [(THDocumentViewController *)self p_dismissActiveAnimated:a4];
  LOBYTE(v4) = [(THDocumentNavigator *)[(THDocumentViewController *)self documentNavigator] followLink:a3 animated:v4];
  [(THDocumentViewController *)self p_updatePageNumberingForce:1];
  return v4;
}

- (id)anchorFromLink:(id)a3
{
  BOOL v4 = [(THDocumentViewController *)self bookNavigationDelegate];

  return [(THBookNavigation *)v4 anchorFromLink:a3];
}

- (void)showTOC
{
  id v2 = [(THDocumentViewController *)self bookNavigationDelegate];

  [(THBookNavigation *)v2 showTOC];
}

- (void)closeDocument
{
  id v2 = [(THDocumentViewController *)self bookNavigationDelegate];

  [(THBookNavigation *)v2 closeDocument];
}

- (BOOL)isNotesFullscreenVisible
{
  id v2 = [(THDocumentViewController *)self bookNavigationDelegate];

  return [(THBookNavigation *)v2 isNotesFullscreenVisible];
}

- (BOOL)isGlossaryVisible
{
  id v2 = [(THDocumentViewController *)self bookNavigationDelegate];

  return [(THBookNavigation *)v2 isGlossaryVisible];
}

- (void)showGlossaryViewWithAnchor:(id)a3
{
  BOOL v4 = [(THDocumentViewController *)self bookNavigationDelegate];

  [(THBookNavigation *)v4 showGlossaryViewWithAnchor:a3];
}

- (id)bookLinkResolver
{
  id v2 = [(THDocumentViewController *)self bookNavigationDelegate];

  return [(THBookNavigation *)v2 bookLinkResolver];
}

- (void)hideNavigationHistory
{
  id v2 = [(THDocumentViewController *)self bookNavigationDelegate];

  [(THBookNavigation *)v2 hideNavigationHistory];
}

- (void)documentNavigator:(id)a3 willNavigateToAbsolutePageIndex:(unint64_t)a4 inContentNode:(id)a5
{
  [a5 startLoading:a3, a4];
  [a5 waitUntilFinishedLoadingAndPaginating];

  [(THDocumentViewController *)self p_ensureInNavigationUnitForContentNode:a5];
}

- (void)documentNavigator:(id)a3 scrollToAbsolutePageIndex:(unint64_t)a4 specificUnscaledCanvasRect:(CGRect)a5 animated:(BOOL)a6 willPulse:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  if ([(THDocumentViewController *)self inFlowMode])
  {
    if (v7)
    {
      if (y + -100.0 >= 0.0) {
        double y = y + -100.0;
      }
      else {
        double y = 0.0;
      }
    }
    else if (!a4 && y <= 20.0 && [(THDocumentViewController *)self isEpub])
    {
      double y = 0.0;
    }
  }
  -[THDocumentViewController p_setUnscaledCanvasRect:animated:](self, "p_setUnscaledCanvasRect:animated:", v8, x, y, width, height);

  [(THDocumentViewController *)self setLastStorageAnchor:0];
}

- (void)documentNavigator:(id)a3 failedToFollowLink:(id)a4
{
  BOOL v5 = [(THDocumentViewController *)self bookNavigationDelegate];

  [(THBookNavigation *)v5 followLink:a4];
}

- (void)documentNavigator:(id)a3 failedToFollowAnchor:(id)a4 pulse:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v7 = [(THDocumentViewController *)self bookNavigationDelegate];

  [(THBookNavigation *)v7 followAnchor:a4 pulse:v5];
}

- (void)documentNavigator:(id)a3 didJumpToStorageAnchor:(id)a4 withWillJumpReturn:(BOOL)a5
{
}

- (void)documentNavigator:(id)a3 willJumpToPageLocation:(id)a4
{
  [(THDocumentViewController *)self bookNavigationDelegate];
  if (objc_opt_respondsToSelector())
  {
    id v6 = [(THDocumentViewController *)self bookNavigationDelegate];
    [(THBookNavigation *)v6 willJumpToPageLocation:a4];
  }
}

- (void)documentNavigator:(id)a3 didJumpToPageLocation:(id)a4
{
  [(THDocumentViewController *)self bookNavigationDelegate];
  if (objc_opt_respondsToSelector()) {
    [(THBookNavigation *)[(THDocumentViewController *)self bookNavigationDelegate] didJumpToPageLocation:a4];
  }
  id v6 = [(THDocumentViewController *)self displaySleepController];

  [(BCDisplaySleepController *)v6 userInteractionOccurred];
}

- (BOOL)documentNavigatorIsOnActiveCanvas:(id)a3
{
  id v3 = objc_msgSend(objc_msgSend(-[THDocumentViewController viewIfLoaded](self, "viewIfLoaded", a3), "window"), "windowScene");
  if (v3)
  {
    BOOL v4 = v3;
    if ([v3 activationState]) {
      LOBYTE(v3) = [v4 activationState] == (char *)&dword_0 + 1;
    }
    else {
      LOBYTE(v3) = 1;
    }
  }
  return (char)v3;
}

- (unint64_t)visiblePageCountForDocumentNavigator:(id)a3
{
  if ([(THDocumentViewController *)self isTwoUp]) {
    return 2;
  }
  else {
    return 1;
  }
}

- (id)p_expandedViewControllerForRep:(id)a3
{
  objc_opt_class();
  [a3 expandedContentDrawableToPresent];
  BOOL v5 = (void *)TSUDynamicCast();
  objc_opt_class();
  [a3 info];
  id v6 = (void *)TSUDynamicCast();
  objc_opt_class();
  [v6 expandedStageDrawable];
  BOOL v7 = (void *)TSUDynamicCast();
  if (v5 && ![v5 isAudioOnly]
    || v7 && ([v7 isAudioOnly] & 1) == 0)
  {
    double v10 = [[THWiOSExpandedMovieViewController alloc] initWithDocumentRoot:[(THDocumentViewController *)self documentRoot] expandableRep:a3 delegate:self];
    [self parentViewController addChildViewController:v10];
    return v10;
  }
  else
  {
    BOOL v8 = [[THWiOSExpandedViewController alloc] initWithDocumentRoot:[(THDocumentViewController *)self documentRoot] expandableRep:a3 delegate:self];
    return v8;
  }
}

- (void)presentRepExpanded:(id)a3
{
  if (!+[NSThread isMainThread]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentViewController presentRepExpanded:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentViewController.mm") lineNumber:6208 description:@"This operation must only be performed on the main thread."];
  }
  if (a3)
  {
    if (!self->mExpandedViewController)
    {
      id v5 = [(THDocumentViewController *)self p_expandedViewControllerForRep:a3];
      [(THDocumentViewController *)self presentExpandedViewController:v5 completionBlock:0];
    }
  }
  else
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentViewController presentRepExpanded:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentViewController.mm") lineNumber:6209 description:@"invalid nil value for '%s'", "expandableRep"];
  }
}

- (void)presentExpandedViewController:(id)a3 completionBlock:(id)a4
{
  [(THDocumentViewController *)self setExpandedViewController:a3];
  [(THDocumentViewController *)self refreshStatusBarAppearance];
  [self view].userInteractionEnabled = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1C55C;
  v6[3] = &unk_4572A0;
  v6[4] = self;
  void v6[5] = a4;
  [(THWExpandedViewController *)[(THDocumentViewController *)self expandedViewController] presentExpandedAnimatedWithCompletionBlock:v6];
}

- (BOOL)repIsPresentedExpanded:(id)a3
{
  if (![a3 info]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentViewController repIsPresentedExpanded:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentViewController.mm") lineNumber:6235 description:@"invalid nil value for '%s'", "expandableRep.info"];
  }
  id v5 = [(THDocumentViewController *)self expandedViewController];
  if (v5)
  {
    id v6 = [a3 info];
    LOBYTE(v5) = v6 == [self expandedViewController].expandedRepSourceRep.info;
  }
  return (char)v5;
}

- (CGSize)widgetHostExpandedSize
{
  [self view].frame;
  double v3 = v2;
  double v5 = v4;
  result.double height = v5;
  result.double width = v3;
  return result;
}

- (id)p_pressableRepGestureRecognizer
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = objc_msgSend(objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController", 0), "canvasView"), "gestureRecognizers");
  id v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (!v3) {
    return 0;
  }
  id v4 = v3;
  uint64_t v5 = *(void *)v11;
  id v6 = (id)TSWPImmediatePress;
LABEL_3:
  uint64_t v7 = 0;
  while (1)
  {
    if (*(void *)v11 != v5) {
      objc_enumerationMutation(v2);
    }
    BOOL v8 = *(void **)(*((void *)&v10 + 1) + 8 * v7);
    if ([v8 gestureKind] == v6) {
      return v8;
    }
    if (v4 == (id)++v7)
    {
      id v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (void)presentPopoverForPopUpInfo:(id)a3 withFrame:(CGRect)a4 inLayer:(id)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  if (+[NSThread isMainThread])
  {
    if (a3) {
      goto LABEL_3;
    }
  }
  else
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentViewController presentPopoverForPopUpInfo:withFrame:inLayer:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentViewController.mm") lineNumber:6264 description:@"This operation must only be performed on the main thread."];
    if (a3)
    {
LABEL_3:
      if (a5) {
        goto LABEL_4;
      }
      goto LABEL_8;
    }
  }
  [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentViewController presentPopoverForPopUpInfo:withFrame:inLayer:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentViewController.mm") lineNumber:6265 description:@"invalid nil value for '%s'", "popUp"];
  if (a5)
  {
LABEL_4:
    if (!a3) {
      return;
    }
    goto LABEL_9;
  }
LABEL_8:
  [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentViewController presentPopoverForPopUpInfo:withFrame:inLayer:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentViewController.mm") lineNumber:6266 description:@"invalid nil value for '%s'", "layer"];
  if (!a3) {
    return;
  }
LABEL_9:
  if ([(TSWPopoverController *)self->mPopUpPopoverController popUpInfo] != a3)
  {
    if (![a3 frameViewSettings]) {
      [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THDocumentViewController presentPopoverForPopUpInfo:withFrame:inLayer:]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentViewController.mm"] lineNumber:6271 description:[NSString stringWithFormat:@"invalid nil value for '%s'", @"popUp.frameViewSettings"];
    }
    if (![a3 popoverTheme]) {
      [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentViewController presentPopoverForPopUpInfo:withFrame:inLayer:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentViewController.mm") lineNumber:6272 description:@"invalid nil value for '%s'", "popUp.popoverTheme"];
    }
    if (self->mPopUpPopoverController) {
      [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentViewController presentPopoverForPopUpInfo:withFrame:inLayer:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentViewController.mm") lineNumber:6273 description:@"expected nil value for '%s'", "mPopUpPopoverController"];
    }
    id v12 = [self documentRoot].themeProvider;
    if (v12 && (long long v13 = v12, [v12 forceThemeColors])) {
      double v14 = +[TSUColor colorWithCGColor:](TSUColor, "colorWithCGColor:", [v13 backgroundColor]);
    }
    else {
      double v14 = 0;
    }
    [a3 updateBackgroundColor:v14];
    objc_opt_class();
    objc_msgSend(objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "editorController"), "textInputEditor");
    [(id)TSUDynamicCast() setSelection:0];
    double v15 = [THWPopUpContentProvider alloc];
    [self interactiveCanvasController].viewScale;
    double v17 = [(THWPopUpContentProvider *)v15 initWithPopUpInfo:a3 scale:[(THDocumentViewController *)self documentRoot] documentRoot:self scrollableCanvasHost:self bookNavigator:[(THDocumentViewController *)self documentNavigator] documentNavigator:v16];
    double v18 = [[TSWPopoverController alloc] initWithContentProvider:v17];
    self->mPopUpPopoverController = v18;
    [(TSWPopoverController *)v18 setDelegate:self];

    id v19 = [(THDocumentViewController *)self p_pressableRepGestureRecognizer];
    -[TSWPopoverController setPassThroughGestureRecognizers:](self->mPopUpPopoverController, "setPassThroughGestureRecognizers:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", [*(id *)&self->TSADocumentViewController_opaque[OBJC_IVAR___TSADocumentViewController__scrollView] panGestureRecognizer], v19, 0));
    objc_msgSend(objc_msgSend(-[THDocumentViewController view](self, "view"), "superview"), "bounds");
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
    objc_msgSend(objc_msgSend(-[THDocumentViewController view](self, "view"), "window"), "statusBarMinDimension");
    double v29 = v23 + v28;
    double v30 = v27 - v28;
    mPopUpPopoverController = self->mPopUpPopoverController;
    objc_msgSend(objc_msgSend(objc_msgSend(-[THDocumentViewController view](self, "view"), "superview"), "layer"), "convertRect:fromLayer:", a5, x, y, width, height);
    -[TSWPopoverController presentPopoverFromRect:inView:viewBounds:permittedArrowDirections:displayMode:animated:](mPopUpPopoverController, "presentPopoverFromRect:inView:viewBounds:permittedArrowDirections:displayMode:animated:", objc_msgSend(-[THDocumentViewController view](self, "view"), "superview"), 15, 1, 1, v32, v33, v34, v35, v21, v29, v25, v30);
    uint64_t v36 = TSUProtocolCast();
    if (v36)
    {
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_1CD30;
      v37[3] = &unk_456F00;
      v37[4] = v36;
      void v37[5] = self;
      [(THDocumentViewController *)self p_getWidgetIDsForInfo:v36 completion:v37];
    }
  }
}

- (BOOL)widgetHostingAllowInteractionOnPageForRep:(id)a3
{
  if (![(THDocumentViewController *)self th_cachedIsCompactWidth]
    && ![(THDocumentViewController *)self th_cachedIsCompactHeight])
  {
    return 1;
  }

  return [a3 widgetInteractionAllowOnPageForCompact];
}

- (BOOL)widgetHostingAllowAutoplayForRep:(id)a3
{
  if (![(THDocumentViewController *)self th_cachedIsCompactWidth]
    && ![(THDocumentViewController *)self th_cachedIsCompactHeight])
  {
    return 1;
  }

  return [a3 widgetInteractionAllowAutoplayForCompact];
}

- (BOOL)widgetHostingShouldAllowNaturalHorizontalScrollForRep:(id)a3
{
  BOOL v4 = [(THDocumentViewController *)self inFlowMode];
  if (v4)
  {
    LOBYTE(v4) = [(THDocumentViewController *)self isEpub];
  }
  return v4;
}

- (BOOL)popoverController:(id)a3 shouldIgnorePassThroughGestureRecognizer:(id)a4
{
  BOOL result = 0;
  if (self->mPopUpPopoverController == a3
    && [(THDocumentViewController *)self p_pressableRepGestureRecognizer] == a4)
  {
    id v7 = [(THDocumentViewController *)self interactiveCanvasController];
    [a4 locationInView:[self canvasViewController].canvasView];
    [v7 convertBoundsToUnscaledPoint:];
    objc_msgSend(objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "hitRep:allowsAllReps:", 1, v8, v9), "info");
    long long v10 = (TSWPopUpInfo *)[(id)TSUProtocolCast() popUpInfo];
    if (!v10 || v10 == [(TSWPopoverController *)self->mPopUpPopoverController popUpInfo]) {
      return 1;
    }
  }
  return result;
}

- (void)popoverControllerWillDismiss:(id)a3
{
  if (self->mPopUpPopoverController == a3)
  {
    [a3 popUpInfo];
    uint64_t v4 = TSUProtocolCast();
    if (v4) {
      [(THDocumentViewController *)self p_getWidgetIDsForInfo:v4 completion:&stru_4572C0];
    }
    [(TSWPopoverController *)self->mPopUpPopoverController setDelegate:0];

    self->mPopUpPopoverController = 0;
    id v5 = [(THDocumentViewController *)self canvasViewController];
    [v5 becomeFirstResponder];
  }
}

- (id)hostCanvasLayer
{
  id v2 = [self interactiveCanvasController].layerHost;

  return [v2 canvasLayer];
}

- (id)curtainColorForFreeTransform
{
  if (![(THDocumentViewController *)self expandedViewController]) {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THDocumentViewController curtainColorForFreeTransform]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentViewController.mm"] lineNumber:6451 description:@"invalid nil value for '%s'", "self.expandedViewController"];
  }
  id v3 = [(THDocumentViewController *)self expandedViewController];

  return [(THWExpandedViewController *)v3 curtainColorForFreeTransform];
}

- (CGRect)rectForCompletionAnimationWithRep:(id)a3
{
  id v3 = [[self hostCanvasLayer] superlayer];

  [v3 frame];
  result.size.double height = v7;
  result.size.double width = v6;
  result.origin.double y = v5;
  result.origin.double x = v4;
  return result;
}

- (void)freeTransformDidBeginWithRep:(id)a3 expandableRep:(id)a4
{
  if (!+[NSThread isMainThread]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentViewController freeTransformDidBeginWithRep:expandableRep:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentViewController.mm") lineNumber:6463 description:@"This operation must only be performed on the main thread."];
  }
  if (!a3) {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THDocumentViewController freeTransformDidBeginWithRep:expandableRep:]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentViewController.mm"] lineNumber:6464 description:@"invalid nil value for '%s'", "freeTransformableRep"];
  }
  [(THDocumentViewController *)self p_dismissActiveAnimated:1];
  [(THDocumentViewController *)self setExpandedViewController:[(THDocumentViewController *)self p_expandedViewControllerForRep:a4]];
  self->mShowToolbarOnCancelFTC = [(THToolbarDelegate *)[(THDocumentViewController *)self toolbarDelegate] isToolbarHidden] ^ 1;

  [(THDocumentViewController *)self hideToolbarAnimated:1];
}

- (void)freeTransformDidEndWithRep:(id)a3 expandableRep:(id)a4 completionBlock:(id)a5
{
  if (![(THDocumentViewController *)self expandedViewController]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentViewController freeTransformDidEndWithRep:expandableRep:completionBlock:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentViewController.mm") lineNumber:6477 description:@"invalid nil value for '%s'", "self.expandedViewController"];
  }
  double v7 = [(THDocumentViewController *)self expandedViewController];

  [(THDocumentViewController *)self presentExpandedViewController:v7 completionBlock:a5];
}

- (void)freeTransformPostAnimationDidCancelWithRep:(id)a3 expandableRep:(id)a4
{
  if (![(THDocumentViewController *)self expandedViewController]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentViewController freeTransformPostAnimationDidCancelWithRep:expandableRep:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentViewController.mm") lineNumber:6484 description:@"invalid nil value for '%s'", "self.expandedViewController"];
  }
  [(THWExpandedViewController *)[(THDocumentViewController *)self expandedViewController] teardown];

  self->mExpandedViewController = 0;
}

- (void)freeTransformDidCancelWithRep:(id)a3 expandableRep:(id)a4
{
  if (self->mShowToolbarOnCancelFTC) {
    -[THDocumentViewController showToolbarAnimated:](self, "showToolbarAnimated:", 1, a4);
  }
}

- (void)setPageBookmarked:(BOOL)a3 forPageRep:(id)a4
{
}

- (BOOL)bookmarksShouldBeVisible
{
  unsigned int v3 = [self documentRoot].isEPUB ^ 1;
  id v4 = [(THDocumentViewController *)self im_ancestorViewControllerConformingToProtocol:&OBJC_PROTOCOL___THPageBookmarkVisibility];
  if ((objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "isEPUB") & 1) == 0
    && v4)
  {
    LOBYTE(v3) = [v4 bookmarksShouldBeVisible];
  }
  return v3 & ~[(THDocumentViewController *)self inFlowMode];
}

- (CGRect)bookmarkHotspotRegionForPage:(id)a3
{
  double x = CGRectZero.origin.x;
  CGFloat y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  CGFloat height = CGRectZero.size.height;
  if ([(THToolbarDelegate *)[(THDocumentViewController *)self toolbarDelegate] isToolbarHidden]&& [(THDocumentViewController *)self isEpub]&& ![(THDocumentViewController *)self inFlowMode])
  {
    objc_msgSend(objc_msgSend(a3, "geometry"), "boundsBeforeRotation");
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    [(THDocumentReflowableLayoutConfiguration *)[(THDocumentViewController *)self configuration] bookmarkHotspotDimension];
    double width = v17;
    v22.origin.double x = v10;
    v22.origin.CGFloat y = v12;
    v22.size.double width = v14;
    v22.size.CGFloat height = v16;
    double x = CGRectGetMaxX(v22) - width;
    v23.origin.double x = v10;
    v23.origin.CGFloat y = v12;
    v23.size.double width = v14;
    v23.size.CGFloat height = v16;
    CGFloat y = CGRectGetMinY(v23);
    CGFloat height = width;
  }
  double v18 = x;
  double v19 = y;
  double v20 = width;
  double v21 = height;
  result.size.CGFloat height = v21;
  result.size.double width = v20;
  result.origin.CGFloat y = v19;
  result.origin.double x = v18;
  return result;
}

- (id)p_canvasInfoForExpandedInfo:(id)a3 presentationType:(id)a4
{
  if ([a4 isPaginated])
  {
    [(THDocumentViewController *)self p_ownerInfoForPopUpInfo:a3];
    return a3;
  }
  else
  {
    return [(THDocumentViewController *)self p_expandableInfoForInfo:a3 forceLoad:0];
  }
}

- (id)p_contentNodeForInfo:(id)a3 presentationType:(id)a4
{
  while (1)
  {
    objc_opt_class();
    double v5 = (void *)TSUDynamicCast();
    if (v5) {
      break;
    }
    id result = [a3 parentInfo];
    a3 = result;
    if (!result) {
      return result;
    }
  }

  return [v5 parent];
}

- (UIView)rootSuperview
{
  id v2 = [(THDocumentViewController *)self view];

  return (UIView *)[v2 superview];
}

- (UIView)expandedWindowHostView
{
  id v2 = [(THDocumentViewController *)self view];

  return (UIView *)[v2 superview];
}

- (CGSize)windowMinSize
{
  [self view].bounds
  double v3 = v2;
  double v5 = v4;
  result.CGFloat height = v5;
  result.double width = v3;
  return result;
}

- (BOOL)isFreeTransformInProgress
{
  double v2 = [(THDocumentViewController *)self ftc];

  return [(THWFreeTransformController *)v2 isFreeTransformInProgress];
}

- (id)expandableRepForInfo:(id)a3
{
  id v5 = [[self interactiveCanvasController] repForInfo:a3 createIfNeeded:1];
  if (!v5)
  {
    id v6 = [(THDocumentViewController *)self p_expandableInfoForInfo:a3 forceLoad:0];
    if (!v6
      || (id v5 = objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "repForInfo:", v6)) == 0)
    {
      id v5 = [[self interactiveCanvasController] repForInfo:[self p_ownerInfoForPopUpInfo:a3]];
    }
  }
  double v7 = (void *)TSUProtocolCast();
  objc_opt_class();
  id v8 = (id)TSUClassAndProtocolCast();
  if (objc_opt_respondsToSelector()) {
    id v8 = [v7 expandableRep:&OBJC_PROTOCOL___THWExpandableRep];
  }
  if (v5 && !v8)
  {
    objc_opt_class();
    id v8 = (id)TSUClassAndProtocolCast();
  }
  if (v8) {
    return v8;
  }
  if (![a3 parentInfo]) {
    return 0;
  }
  id v10 = [a3 parentInfo];

  return [(THDocumentViewController *)self expandableRepForInfo:v10];
}

- (void)expandedViewControllerWillPresent:(id)a3
{
  [self interactiveCanvasController].endEditing;
  [(THDocumentViewController *)self hideToolbarAnimated:0];
  [(THDocumentViewController *)self p_dismissActiveAnimated:1];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = objc_msgSend(objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController", 0), "canvas"), "topLevelReps");
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * i) recursivelyPerformSelectorIfImplemented:"expandedViewControllerWillPresent:" withObject:a3];
      }
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)expandedViewControllerDidPresent:(id)a3
{
  [(THDocumentViewController *)self setPagePaddingOptions:0];
  [(THDocumentViewController *)self hideToolbarAnimated:1];
  double v4 = [(THDocumentViewController *)self toolbarDelegate];

  [(THToolbarDelegate *)v4 setToolbarHiddenFromAccessibility:1];
}

- (void)expandedViewControllerWillBeginDismissing:(id)a3
{
  if (![(THDocumentViewController *)self inFlowMode])
  {
    [(THDocumentViewController *)self p_ensureVisibleAbsolutePhysicalPageIndexFromFullscreen];
    id v4 = [(THDocumentViewController *)self interactiveCanvasController];
    [v4 forceStopScrolling];
  }
}

- (void)expandedViewControllerDidDismiss:(id)a3
{
  double v3 = self;
  if ([(THDocumentViewController *)self expandedViewController] == a3)
  {
    [(THWExpandedViewController *)[(THDocumentViewController *)v3 expandedViewController] setDelegate:0];
    [(THWExpandedViewController *)v3->mExpandedViewController teardown];

    v3->mExpandedViewController = 0;
  }
  [(THDocumentViewController *)v3 setPagePaddingOptions:3];
  if ([(THDocumentViewController *)v3 inPaginatedMode]) {
    [(THDocumentViewController *)v3 p_updateVisibleInfos];
  }
  [(THDocumentViewController *)v3 refreshStatusBarAppearance];
  [(THDocumentViewController *)v3 setLastAbsolutePageIndex:0x7FFFFFFFFFFFFFFFLL];
  [(THToolbarDelegate *)[(THDocumentViewController *)v3 toolbarDelegate] setToolbarHiddenFromAccessibility:0];
  if ([(THDocumentViewController *)v3 canvasViewController]) {
    double v3 = (THDocumentViewController *)[(THDocumentViewController *)v3 canvasViewController];
  }

  [(THDocumentViewController *)v3 becomeFirstResponder];
}

- (UIEdgeInsets)expandedViewControllerSafeAreaInsets:(id)a3
{
  id v3 = [(THDocumentViewController *)self view];

  [v3 safeAreaInsets];
  result.right = v7;
  result.bottom = v6;
  result.left = v5;
  result.top = v4;
  return result;
}

- (void)expandedViewController:(id)a3 handleHyperlinkWithURL:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  CGAffineTransform v4[2] = sub_1DD54;
  v4[3] = &unk_456E38;
  v4[4] = self;
  void v4[5] = a4;
  [(THWExpandedViewController *)[(THDocumentViewController *)self expandedViewController] dismissExpandedAnimatedWithCompletionBlock:v4];
}

- (id)actionForHyperlink:(id)a3 inRep:(id)a4 gesture:(id)a5
{
  id v8 = [a5 gestureKind];
  id v9 = (id)TSWPLongPress;
  if (v8 != (id)TSWPImmediateSingleTap && v8 != (id)TSWPLongPress) {
    return 0;
  }
  id v11 = v8;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1DF14;
  v17[3] = &unk_456E38;
  v17[4] = a4;
  void v17[5] = a3;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1DF20;
  v16[3] = &unk_456DE0;
  v16[4] = a4;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1DF2C;
  v15[3] = &unk_456F28;
  v15[4] = a4;
  void v15[5] = self;
  v15[6] = a3;
  long long v13 = +[TSWPTwoPartAction actionWithStartAction:v17 cancelAction:v16 finishAction:v15];
  if (v11 == v9) {
    uint64_t v12 = 1;
  }
  else {
    uint64_t v12 = TSUSupportsTextInteraction();
  }
  [(TSWPTwoPartAction *)v13 setPerformImmediately:v12];
  return v13;
}

- (void)expandedViewControllerWantsDismiss:(id)a3
{
  id v3 = [(THDocumentViewController *)self expandedViewController];

  [(THWExpandedViewController *)v3 dismissExpandedAnimatedWithCompletionBlock:0];
}

- (id)expandedViewController:(id)a3 actionForHyperlink:(id)a4 inRep:(id)a5 gesture:(id)a6
{
  id v11 = [a6 gestureKind];
  id v12 = (id)TSWPLongPress;
  if (v11 != (id)TSWPImmediateSingleTap && v11 != (id)TSWPLongPress) {
    return 0;
  }
  id v14 = v11;
  double v15 = [(THDocumentViewController *)self documentNavigator];
  if (v15)
  {
    id v16 = [-THDocumentNavigator linkForURL:[a4 url] inStorage:[a4 parentStorage]];
    if (([v16 targetIsApplePub] & 1) != 0
      || [v16 targetIsiBooks])
    {
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_1E1CC;
      v22[3] = &unk_456E38;
      v22[4] = a5;
      v22[5] = a4;
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_1E1D8;
      v21[3] = &unk_456DE0;
      v21[4] = a5;
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_1E1E4;
      v20[3] = &unk_4572E8;
      v20[4] = a5;
      v20[5] = a3;
      v20[6] = self;
      v20[7] = a4;
      double v18 = +[TSWPTwoPartAction actionWithStartAction:v22 cancelAction:v21 finishAction:v20];
      if (v14 == v12) {
        uint64_t v17 = 1;
      }
      else {
        uint64_t v17 = TSUSupportsTextInteraction();
      }
      [(TSWPTwoPartAction *)v18 setPerformImmediately:v17];
      return v18;
    }
  }

  return [(THDocumentViewController *)self actionForHyperlink:a4 inRep:a5 gesture:a6];
}

- (void)expandedViewController:(id)a3 activateProgressForRep:(id)a4
{
}

- (void)expandedViewController:(id)a3 deactivateProgressForRep:(id)a4
{
}

- (void)p_ensureInNavigationUnitForContentNode:(id)a3
{
  if (!a3) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentViewController p_ensureInNavigationUnitForContentNode:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentViewController.mm") lineNumber:6840 description:@"invalid nil value for '%s'", "node"];
  }
  if (![(THNavigationUnit *)[(THSectionController *)[(THDocumentViewController *)self activeSectionController] currentNavigationUnit] containsContentNode:a3])
  {
    id v5 = objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "navigationModel"), "navigationUnitContainingContentNode:", a3);
    [(THDocumentViewController *)self setCurrentNavigationUnit:v5];
  }
}

- (void)p_zoomToAnchor:(id)a3
{
  if (a3)
  {
    id v5 = [a3 range];
    uint64_t v7 = v6;
    id v8 = [a3 contentNode];
    id v9 = [v8 bodyStorageForPresentationType:[self currentPresentationType]];
    if (v9) {
      id v10 = [v8 nodeUniqueIDForInfo:v9];
    }
    else {
      id v10 = 0;
    }
    id v11 = [a3 storageUID];
    if ([v10 isEqualToString:v11])
    {
      id v12 = [(THSectionController *)[(THDocumentViewController *)self activeSectionController] pageControllerForContentNode:v8];
      id v13 = [v12 relativePageIndexForCharIndex:v5 forceLayout:0];
      if (v13 != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        id v14 = v13;
        objc_opt_class();
        [self interactiveCanvasController] repForInfo:[v12 pageInfoForRelativePageIndex:v14];
        double v15 = (void *)TSUDynamicCast();
        if (v15)
        {
          long long v37 = 0u;
          long long v38 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          id v16 = [v15 childReps];
          uint64_t v17 = (char *)[v16 countByEnumeratingWithState:&v35 objects:v39 count:16];
          if (v17)
          {
            double v18 = v17;
            uint64_t v19 = *(void *)v36;
            uint64_t v34 = v7;
            while (2)
            {
              for (i = 0; i != v18; ++i)
              {
                if (*(void *)v36 != v19) {
                  objc_enumerationMutation(v16);
                }
                objc_opt_class();
                uint64_t v21 = TSUDynamicCast();
                if (v21)
                {
                  CGRect v22 = (void *)v21;
                  objc_opt_class();
                  [v22 repForCharIndex:v5 isStart:0];
                  uint64_t v23 = TSUDynamicCast();
                  if (v23)
                  {
                    double v28 = (void *)v23;
                    uint64_t v7 = v34;
                    goto LABEL_25;
                  }
                }
              }
              double v18 = (char *)[v16 countByEnumeratingWithState:&v35 objects:v39 count:16];
              if (v18) {
                continue;
              }
              break;
            }
          }
        }
      }
    }
    else
    {
      id v24 = [v8 infoForNodeUniqueID:v11 forPresentationType:[self currentPresentationType]];
      if (v24)
      {
        id v25 = [v24 parentInfo];
        if (v25) {
          id v25 = [[self interactiveCanvasController] layoutForInfo:v25];
        }
        objc_opt_class();
        [self interactiveCanvasController].repForLayout:v25;
        uint64_t v26 = TSUDynamicCast();
        if (v26)
        {
          double v27 = (void *)v26;
          objc_opt_class();
          [v27 containedRep];
          double v28 = (void *)TSUDynamicCast();
          if (v28)
          {
LABEL_25:
            objc_msgSend(v28, "rectForHighlight:lineHasAttachment:", v5, v7, objc_msgSend(objc_msgSend(v28, "storage"), "rangeContainsAttachment:", v5, v7));
            id v29 = [v28 closestColumnForPoint:];
            if (v29)
            {
              [v29 frameBounds];
              [v28 convertNaturalRectToUnscaledCanvas:];
              [self.interactiveCanvasController zoomToFitRect:1, 1, 1, 1, 1, 1, v30, v31, v32, v33];
            }
          }
        }
      }
    }
  }
}

- (id)p_ownerInfoForPopUpInfo:(id)a3
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [[[self interactiveCanvasController] canvas] allReps];
  id result = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (result)
  {
    id v6 = result;
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      id v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v10 + 1) + 8 * (void)v8);
        if ([v9 popUpInfo] == a3) {
          return [v9 info];
        }
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id result = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      id v6 = result;
      if (result) {
        continue;
      }
      break;
    }
  }
  return result;
}

- (id)p_expandableInfoForInfo:(id)a3 forceLoad:(BOOL)a4
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = [[self currentNavigationUnit:0] contentNodes];
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (!v8) {
    return 0;
  }
  id v9 = v8;
  id v10 = 0;
  uint64_t v11 = *(void *)v16;
LABEL_3:
  uint64_t v12 = 0;
  while (1)
  {
    if (*(void *)v16 != v11) {
      objc_enumerationMutation(v7);
    }
    long long v13 = *(void **)(*((void *)&v15 + 1) + 8 * v12);
    if (a4 || [*(id *)(*((void *)&v15 + 1) + 8 * v12) isLoaded])
    {
      id v10 = objc_msgSend(v13, "expandableInfoForWidgetInfo:forPresentationType:", a3, +[THPresentationType flowPresentationTypeInContext:](THPresentationType, "flowPresentationTypeInContext:", objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "context")));
      if (objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "isEPUB"))
      {
        if (v10) {
          return v10;
        }
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        return v10;
      }
    }
    if (v9 == (id)++v12)
    {
      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v9) {
        goto LABEL_3;
      }
      return v10;
    }
  }
}

- (BOOL)showingExpandedWidgetView
{
  return [(THDocumentViewController *)self expandedViewController] != 0;
}

- (void)switchToNavigationUnitForChapterIndex:(unint64_t)a3
{
  id v4 = [(THDocumentViewController *)self navigationUnitForChapterIndex:a3];
  if (!v4) {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THDocumentViewController switchToNavigationUnitForChapterIndex:]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentViewController.mm"] lineNumber:6984 description:@"invalid nil value for '%s'", "navigationUnit"];
  }

  [(THDocumentViewController *)self setCurrentNavigationUnit:v4];
}

- (id)navigationUnitForChapterIndex:(unint64_t)a3
{
  id v4 = -[THDocumentLinkResolver contentNodeFromLink:](-[THDocumentViewController documentLinkResolver](self, "documentLinkResolver"), "contentNodeFromLink:", -[THDocumentLinkResolver absoluteLink:withContentNode:](-[THDocumentViewController documentLinkResolver](self, "documentLinkResolver"), "absoluteLink:withContentNode:", objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "tocModel"), "tiles"), "objectAtIndex:", a3), "firstModelLink"), 0));
  id v5 = [[self documentRoot] navigationModel];

  return [v5 navigationUnitContainingContentNode:v4];
}

- (void)updateVisibleInfosWithPageIndex:(unint64_t)a3
{
  [(THDocumentViewController *)self p_currentPageSize];
  double v6 = v5 * (double)a3;
  [(THDocumentViewController *)self setLastAbsolutePageIndex:0x7FFFFFFFFFFFFFFFLL];
  [(THDocumentViewController *)self setPreventVisibleInfoUpdates:1];
  [self.interactiveCanvasController setContentOffset:0 animated:v6];
  [(THDocumentViewController *)self setPreventVisibleInfoUpdates:0];

  [(THDocumentViewController *)self p_updateVisibleInfosWithPaddingOptions:0 force:0];
}

- (id)contentNodeForPageIndex:(unint64_t)a3
{
  id v5 = [(THDocumentViewController *)self currentNavigationUnit];
  double v6 = [(THDocumentViewController *)self currentPresentationType];

  return [v5 contentNodeForRelativePageIndex:a3 forPresentationType:v6];
}

- (CGRect)targetRelativeRectForPoint:(CGPoint)a3 atPageIndex:(unint64_t)a4 chapterIndex:(unint64_t)a5 waitForContentNodeLoad:(BOOL)a6
{
  BOOL v6 = a6;
  CGFloat y = a3.y;
  double x = a3.x;
  [(THDocumentViewController *)self ensureDocumentIsLoaded];
  id v10 = [(THSectionController *)[(THDocumentViewController *)self paginatedSectionController] presentationType];
  [(THSectionController *)[(THDocumentViewController *)self paginatedSectionController] pageSize];
  TSDRectWithSize();
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v19 = v15;
  double v20 = v17;
  id v21 = [(THDocumentViewController *)self navigationUnitForChapterIndex:a5];
  if ((objc_msgSend(objc_msgSend(v21, "contentNodeForRelativePageIndex:forPresentationType:", a4, v10), "isLoaded") & 1) != 0|| v6)
  {
    id v22 = [v21 pageInfoForRelativePageIndex:a4 forPresentationType:v10];
    if (!v22) {
      [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentViewController targetRelativeRectForPoint:atPageIndex:chapterIndex:waitForContentNodeLoad:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentViewController.mm") lineNumber:7042 description:@"invalid nil value for '%s'", "targetPage"];
    }
    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    id v23 = [v22 modelBodyInfos];
    id v24 = [v23 countByEnumeratingWithState:&v71 objects:v75 count:16];
    if (v24)
    {
      id v25 = v24;
      CGFloat v63 = v20;
      double v64 = v19;
      double v65 = v14;
      double v66 = v12;
      double v61 = v18;
      double v62 = v16;
      uint64_t v26 = *(void *)v72;
      while (2)
      {
        for (i = 0; i != v25; i = (char *)i + 1)
        {
          if (*(void *)v72 != v26) {
            objc_enumerationMutation(v23);
          }
          double v28 = *(void **)(*((void *)&v71 + 1) + 8 * i);
          objc_msgSend(objc_msgSend(v28, "geometry"), "boundsBeforeRotation");
          double v29 = v77.origin.x;
          double v30 = v77.origin.y;
          double width = v77.size.width;
          CGFloat height = v77.size.height;
          v76.CGFloat y = y;
          v76.double x = x;
          if (CGRectContainsPoint(v77, v76))
          {
            id v33 = [v28 lineHints];
            if (v33)
            {
              uint64_t v34 = v33;
              if ([v33 valid])
              {
                if ([v34 hintsCount])
                {
                  id v35 = [v28 columnStyle];
                  if ([v35 columnCount])
                  {
                    uint64_t v36 = 0;
                    double v37 = x - v29;
                    unsigned int v38 = 1;
                    while (1)
                    {
                      uint64_t v69 = 0;
                      CGFloat v70 = 0.0;
                      [v35 positionForColumnIndex:v36 bodyWidth:&v70 outWidth:&v69 outGap:width];
                      CGFloat v39 = v78.origin.x;
                      CGFloat v40 = v70;
                      v78.origin.CGFloat y = 0.0;
                      v78.size.double width = v70;
                      v78.size.CGFloat height = height;
                      double MinX = CGRectGetMinX(v78);
                      v79.origin.CGFloat y = 0.0;
                      v79.origin.double x = v39;
                      v79.size.double width = v40;
                      v79.size.CGFloat height = height;
                      double MaxX = CGRectGetMaxX(v79);
                      if (v37 <= MaxX && v37 >= MinX) {
                        break;
                      }
                      uint64_t v36 = v38;
                      BOOL v44 = (unint64_t)[v35 columnCount] > v38++;
                      if (!v44) {
                        goto LABEL_22;
                      }
                    }
                    double v45 = MaxX;
                    double v47 = CGRectZero.origin.x;
                    double v46 = CGRectZero.origin.y;
                    double v49 = CGRectZero.size.width;
                    CGFloat v48 = CGRectZero.size.height;
                    CGRect v50 = (char *)[v34 hints];
                    id v51 = [v34 hintsCount];
                    if (v51)
                    {
                      unint64_t v52 = (unint64_t)v51;
                      CGRect v53 = (double *)(v50 + 24);
                      unsigned int v54 = 1;
                      do
                      {
                        if (*((void *)v53 + 2))
                        {
                          TSUCenterOfRect();
                          if (v55 <= v45 && v55 >= MinX)
                          {
                            v80.origin.double x = v47;
                            v80.origin.CGFloat y = v46;
                            v80.size.double width = v49;
                            v80.size.CGFloat height = v48;
                            if (CGRectIsEmpty(v80))
                            {
                              CGFloat v48 = *v53;
                              double v49 = *(v53 - 1);
                              double v46 = *(v53 - 2);
                              double v47 = *(v53 - 3);
                            }
                            else
                            {
                              v81.origin.double x = v47;
                              v81.origin.CGFloat y = v46;
                              v81.size.double width = v49;
                              v81.size.CGFloat height = v48;
                              CGRect v82 = CGRectUnion(v81, *(CGRect *)(v53 - 3));
                              double v47 = v82.origin.x;
                              double v46 = v82.origin.y;
                              double v49 = v82.size.width;
                              CGFloat v48 = v82.size.height;
                            }
                          }
                        }
                        BOOL v44 = v52 > v54++;
                        v53 += 7;
                      }
                      while (v44);
                    }
                    if (v49 > 0.0)
                    {
                      double v65 = v30 + v46;
                      double v66 = v29 + v47;
                      CGFloat v63 = v48;
                      double v64 = v49;
                    }
                    goto LABEL_38;
                  }
                }
              }
            }
          }
LABEL_22:
          ;
        }
        id v25 = [v23 countByEnumeratingWithState:&v71 objects:v75 count:16];
        if (v25) {
          continue;
        }
        break;
      }
LABEL_38:
      double v18 = v61;
      double v16 = v62;
      double v14 = v65;
      double v12 = v66;
      double v20 = v63;
      double v19 = v64;
    }
  }
  double v57 = v12 / v16;
  double v58 = v14 / v18;
  double v59 = v19 / v16;
  double v60 = v20 / v18;
  result.size.CGFloat height = v60;
  result.size.double width = v59;
  result.origin.CGFloat y = v58;
  result.origin.double x = v57;
  return result;
}

- (CGRect)targetRelativeRectForRelativePoint:(CGPoint)a3 atPageIndex:(unint64_t)a4 chapterIndex:(unint64_t)a5 waitForContentNodeLoad:(BOOL)a6
{
  BOOL v6 = a6;
  double y = a3.y;
  double x = a3.x;
  [(THDocumentViewController *)self ensureDocumentIsLoaded];
  [(THSectionController *)[(THDocumentViewController *)self paginatedSectionController] pageSize];
  if (x > 1.0 || x < 0.0) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentViewController targetRelativeRectForRelativePoint:atPageIndex:chapterIndex:waitForContentNodeLoad:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentViewController.mm") lineNumber:7142 description:@"Invalid relative x coordinate."];
  }
  if (y > 1.0 || y < 0.0) {
    [TSUAssertionHandler currentHandler][TSUAssertionHandler handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentViewController targetRelativeRectForRelativePoint:atPageIndex:chapterIndex:waitForContentNodeLoad:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentViewController.mm") lineNumber:7143 description:@"Invalid relative y coordinate."];
  }
  TSDRectWithSize();

  -[THDocumentViewController targetRelativeRectForPoint:atPageIndex:chapterIndex:waitForContentNodeLoad:](self, "targetRelativeRectForPoint:atPageIndex:chapterIndex:waitForContentNodeLoad:", a4, a5, v6, x * v12, y * v13);
  result.size.CGFloat height = v17;
  result.size.double width = v16;
  result.origin.double y = v15;
  result.origin.double x = v14;
  return result;
}

- (void)zoomToRelativeTargetRect:(CGRect)a3 atPageIndex:(unint64_t)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  IsEmptdouble y = CGRectIsEmpty(a3);
  BOOL v11 = height == 1.0 && width == 1.0;
  if (!IsEmpty && !v11)
  {
    [(THSectionController *)[(THDocumentViewController *)self paginatedSectionController] pageSize];
    TSDRectWithSize();
    double v13 = v12 * (double)a4 + v12 * x;
    double v15 = v14 * y + 0.0;
    double v16 = width * v12;
    double v17 = height * v14;
    id v18 = [(THDocumentViewController *)self interactiveCanvasController];
    [v18 zoomToColumnWithFrame:v13, v15, v16, v17];
  }
}

- (void)showPageThumbnailsForMissingPageIndexes:(id)a3
{
  id v6 = [a3 mutableCopy];
  id v4 = [(THDocumentViewController *)self visibleRelativePageRange];
  [v6 removeIndexesInRange:v4, v5];
  [(THDocumentViewController *)self showPageThumbnailsForPageIndexes:v6 animated:0 duration:0.0];
}

- (void)showPageThumbnailsForPageIndexes:(id)a3 animated:(BOOL)a4 duration:(double)a5
{
  BOOL v20 = a4;
  if (!self->mCurrentThumbnailViews)
  {
    self->mCurrentThumbnailViews = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    self->mCurrentThumbnailPageIndexes = (NSMutableIndexSet *)objc_alloc_init((Class)NSMutableIndexSet);
  }
  id v8 = [[[THDocumentViewController documentRoot](self, "documentRoot") tocModel] tiles][-[THDocumentViewController currentChapter](self, "currentChapter")];
  id v9 = [a3 firstIndex];
  if (v9 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v10 = v9;
    if (v20) {
      double v11 = 0.0;
    }
    else {
      double v11 = 1.0;
    }
    do
    {
      if (([(NSMutableIndexSet *)self->mCurrentThumbnailPageIndexes containsIndex:v10] & 1) == 0)
      {
        uint64_t v12 = OBJC_IVAR___TSADocumentViewController__scrollView;
        [*(id *)&self->TSADocumentViewController_opaque[OBJC_IVAR___TSADocumentViewController__scrollView] bounds];
        double v14 = v13 * (double)(unint64_t)v10;
        [*(id *)&self->TSADocumentViewController_opaque[v12] bounds];
        double v16 = v15;
        [*(id *)&self->TSADocumentViewController_opaque[v12] bounds];
        id v18 = [objc_alloc((Class)UIImageView) initWithFrame:v14];
        id v19 = objc_msgSend(objc_alloc((Class)TSDBitmapImageProvider), "initWithImageData:", objc_msgSend(objc_msgSend(v8, "largerThumbs"), "objectAtIndex:", v10));
        [v18 setAlpha:v11];
        [v18 setImage:[UIImage imageWithCGImage:[v19 CGImageForNaturalSize]]];

        objc_msgSend(objc_msgSend(-[THDocumentViewController canvasViewController](self, "canvasViewController"), "canvasView"), "addSubview:", v18);
        [(NSMutableArray *)self->mCurrentThumbnailViews addObject:v18];
        [(NSMutableIndexSet *)self->mCurrentThumbnailPageIndexes addIndex:v10];
      }
      id v10 = [a3 indexGreaterThanIndex:v10];
    }
    while (v10 != (id)0x7FFFFFFFFFFFFFFFLL);
  }
  if (v20)
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1F540;
    v21[3] = &unk_456DE0;
    v21[4] = self;
    +[UIView animateWithDuration:v21 animations:a5];
  }
}

- (void)hidePageThumbnailsAnimated:(BOOL)a3 duration:(double)a4
{
  if (a3)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1F738;
    v6[3] = &unk_456DE0;
    v6[4] = self;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1F82C;
    v5[3] = &unk_457140;
    v5[4] = self;
    +[UIView animateWithDuration:v6 animations:v5 completion:a4];
  }
  else
  {
    -[NSMutableArray makeObjectsPerformSelector:](self->mCurrentThumbnailViews, "makeObjectsPerformSelector:", "removeFromSuperview", a4);

    self->mCurrentThumbnailViews = 0;
    self->mCurrentThumbnailPageIndexes = 0;
  }
}

- (BOOL)editorAllowsMagnifier
{
  return 0;
}

- (BOOL)editorAllowsCaret
{
  return 0;
}

- (Class)wpEditorClassOverride
{
  return (Class)objc_opt_class();
}

- (BOOL)editorAllowsHyperlinkInteraction
{
  return 0;
}

- (void)corruptBookAlert
{
  [self documentRoot].isCorrupt = 1;
  if (!self->mHaveDisplayedCorruptBookAlert)
  {
    id v3 = [(id)THBundle() localizedStringForKey:@"This book is either missing content or contains invalid content." value:&stru_46D7E8 table:0];
    id v4 = +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v3, [(id)THBundle() localizedStringForKey:@"Try downloading the book again" value:&stru_46D7E8 table:0], 1);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1FA14;
    v5[3] = &unk_457310;
    v5[4] = self;
    -[UIAlertController addAction:](v4, "addAction:", +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", [(id)THBundle() localizedStringForKey:@"OK" value:&stru_46D7E8 table:0], 1, v5));
    [(THDocumentViewController *)self presentViewController:v4 animated:1 completion:0];
    self->mHaveDisplayedCorruptBookAlert = 1;
  }
}

- (void)scrollableCanvasViewControllerDidReceiveBackgroundTap:(id)a3
{
}

- (id)scrollableCanvasActivityItemProviderWithCachedAnnotation:(id)a3
{
  id v4 = [(THDocumentViewController *)self bookPropertiesDelegate];

  return [(THBookPropertiesProvider *)v4 activityItemProviderWithCachedAnnotation:a3];
}

- (BOOL)allowCopy
{
  double v2 = [(THDocumentViewController *)self bookPropertiesDelegate];

  return [(THBookPropertiesProvider *)v2 allowCopy];
}

- (BOOL)allowHighlighting
{
  return 1;
}

- (id)titleOfCurrentNavigationUnit
{
  id v3 = [[self documentRoot] navigationModel];
  id v4 = [(THDocumentViewController *)self currentNavigationUnit];

  return [v3 titleStringForNavigationUnit:v4];
}

- (id)activityItemProviderWithCachedAnnotation:(id)a3
{
  id v4 = [(THDocumentViewController *)self bookPropertiesDelegate];

  return [(THBookPropertiesProvider *)v4 activityItemProviderWithCachedAnnotation:a3];
}

- (BOOL)suspendCanvasScroll
{
  objc_opt_class();
  double v2 = (void *)TSUDynamicCast();

  return [v2 suspendScrolling];
}

- (void)setSuspendCanvasScroll:(BOOL)a3
{
  BOOL v3 = a3;
  objc_opt_class();
  id v4 = (void *)TSUDynamicCast();

  [v4 setSuspendScrolling:v3];
}

- (void)removePreviewForRelativePageIndex:(unint64_t)a3
{
  if (![(THDocumentViewController *)self inFlowMode])
  {
    uint64_t v5 = [(THSectionController *)[(THDocumentViewController *)self activeSectionController] currentNavigationUnit];
    id v6 = [(THDocumentViewController *)self currentPresentationType];
    if ([(THNavigationUnit *)v5 pageCountForPresentationType:v6] > a3) {
      [-[THDocumentViewController pageViewProvider](self, "pageViewProvider") pageHostForAbsolutePageIndex:-[THNavigationUnit absolutePageIndexForRelativePageIndex:forPresentationType:](v5, "absolutePageIndexForRelativePageIndex:forPresentationType:", a3, v6) unloadPreviewAnimated:0];
    }
    double height = CGSizeZero.height;
    -[THDocumentViewController setLastLayoutSize:](self, "setLastLayoutSize:", CGSizeZero.width, height);
  }
}

- (void)pageViewProviderViewsAdded:(id)a3 pageIndexSet:(id)a4
{
  if ([(THDocumentViewController *)self inGuidedPan]
    && [(THDocumentViewController *)self p_allowsPageDisplacement])
  {
    mPageViewDisplacement = self->mPageViewDisplacement;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1FD78;
    v7[3] = &unk_457388;
    v7[4] = self;
    v7[5] = a4;
    [(THPageViewDisplacement *)mPageViewDisplacement hideWithEnumerator:v7];
  }
  else if ((objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "currentlyScrolling") & 1) == 0)
  {
    [(THDocumentViewController *)self p_updatePageViewsForScrollingAnimated:0 restoreOrigin:0 pageIndexSet:a4];
  }
  [(THDocumentViewController *)self p_updatePageViewHostsWithTheme:[(THThemeDelegate *)[(THDocumentViewController *)self themeDelegate] theme]];
}

- (CGRect)pageViewProviderUnclippedVisibleBounds:(id)a3
{
  id v3 = [(THDocumentViewController *)self interactiveCanvasController];

  [v3 visibleBoundsRect];
  result.size.double height = v7;
  result.size.double width = v6;
  result.origin.double y = v5;
  result.origin.double x = v4;
  return result;
}

- (unint64_t)pageViewProviderStartAbsolutePageIndex:(id)a3
{
  id v4 = [(THDocumentViewController *)self currentNavigationUnit];
  double v5 = [(THDocumentViewController *)self currentPresentationType];

  return (unint64_t)[v4 startPageAbsolutePageIndexForPresentationType:v5];
}

- (int64_t)p_relativePageIndexForPageInfo:(id)a3
{
  id v4 = [a3 absolutePageIndex];
  return v4
       - (unsigned char *)[(THNavigationUnit *)[(THSectionController *)[(THDocumentViewController *)self activeSectionController] currentNavigationUnit] startPageAbsolutePageIndexForPresentationType:[(THDocumentViewController *)self currentPresentationType]];
}

- (void)p_updatePageViewsForScrollingAnimated:(BOOL)a3 restoreOrigin:(BOOL)a4
{
}

- (void)p_updatePageViewsForScrollingAnimated:(BOOL)a3 restoreOrigin:(BOOL)a4 pageIndexSet:(id)a5
{
  BOOL v6 = a4;
  BOOL v7 = a3;
  if ([(THDocumentViewController *)self p_allowsPageDisplacement])
  {
    if (!self->mOverscrollAnimationInProcess
      && ![(THDocumentViewController *)self isRotating]
      && ![(THDocumentViewController *)self preventVisibleInfoUpdates]
      && (objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "dynamicallyZooming") & 1) == 0)
    {
      [(THDocumentViewController *)self zoomedOutViewScale];
      double v10 = v9;
      [(THDocumentViewController *)self currentViewScale];
      if (vabdd_f64(v10, v11) < 0.00999999978
        && ![(THDocumentViewController *)self isRevealingTOC]
        && (objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "animatingScroll") & 1) == 0)
      {
        unsigned __int8 v12 = [(THGuidedPanController *)[(THDocumentViewController *)self guidedPanController] isFocusedOnTarget];
        if ((a5 || (v12 & 1) == 0) && ![(THDocumentViewController *)self inGuidedPan])
        {
          if ([(THDocumentViewController *)self isTwoUp]) {
            uint64_t v13 = 2;
          }
          else {
            uint64_t v13 = 1;
          }
          [(THPageViewDisplacement *)self->mPageViewDisplacement setNumberOfPagesShown:v13];
          mPageViewDisplacement = self->mPageViewDisplacement;
          v15[0] = _NSConcreteStackBlock;
          v15[1] = 3221225472;
          v15[2] = sub_20158;
          v15[3] = &unk_4573B0;
          v15[4] = self;
          void v15[5] = a5;
          [(THPageViewDisplacement *)mPageViewDisplacement updateDisplacementAnimated:v7 restoreOrigin:v6 enumerator:v15];
        }
      }
    }
  }
}

- (id)traitCollection
{
  v8.receiver = self;
  v8.super_class = (Class)THDocumentViewController;
  id v3 = [(THDocumentViewController *)&v8 traitCollection];
  if (!v3) {
    return objc_alloc_init((Class)UITraitCollection);
  }
  id v4 = v3;
  if ([(THDocumentViewController *)self isViewLoaded])
  {
    uint64_t v5 = [(THDocumentViewController *)self inFlowMode] ? 2 : 1;
    id v6 = +[UITraitCollection bk_traitCollectionWithReadingMode:v5];
    v9[0] = v4;
    v9[1] = v6;
    id v4 = +[UITraitCollection traitCollectionWithTraitsFromCollections:](UITraitCollection, "traitCollectionWithTraitsFromCollections:", +[NSArray arrayWithObjects:v9 count:2]);
    if (!v4) {
      return objc_alloc_init((Class)UITraitCollection);
    }
  }
  return v4;
}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  p_accessLock = &self->_accessLock;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_20578;
  v6[3] = &unk_456DE0;
  v6[4] = self;
  os_unfair_lock_lock(&self->_accessLock);
  sub_20578((uint64_t)v6);
  os_unfair_lock_unlock(p_accessLock);
  [(THDocumentReflowableLayoutConfiguration *)[(THDocumentViewController *)self configuration] invalidate];
  [(THDocumentViewController *)self p_updateScrollViewDecelerationRate];
  [(THDocumentViewController *)self setCompactFlowPresentationState:0];
}

- (int64_t)th_cachedInterfaceOrientation
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  p_accessLock = &self->_accessLock;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_206BC;
  v5[3] = &unk_4573D8;
  v5[4] = self;
  void v5[5] = &v6;
  os_unfair_lock_lock(&self->_accessLock);
  sub_206BC((uint64_t)v5);
  os_unfair_lock_unlock(p_accessLock);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)th_cachedIsCompactHeight
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  p_accessLock = &self->_accessLock;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  CGAffineTransform v4[2] = sub_207B4;
  v4[3] = &unk_4573D8;
  v4[4] = self;
  void v4[5] = &v5;
  os_unfair_lock_lock(&self->_accessLock);
  sub_207B4((uint64_t)v4);
  os_unfair_lock_unlock(p_accessLock);
  LOBYTE(p_accessLock) = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return (char)p_accessLock;
}

- (BOOL)th_cachedIsCompactWidth
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  p_accessLock = &self->_accessLock;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  CGAffineTransform v4[2] = sub_208AC;
  v4[3] = &unk_4573D8;
  v4[4] = self;
  void v4[5] = &v5;
  os_unfair_lock_lock(&self->_accessLock);
  sub_208AC((uint64_t)v4);
  os_unfair_lock_unlock(p_accessLock);
  LOBYTE(p_accessLock) = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return (char)p_accessLock;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  [(THWFreeTransformController *)[(THDocumentViewController *)self ftc] cancelTransform];
  -[THDocumentViewController setLastLayoutBoundsSize:](self, "setLastLayoutBoundsSize:", width, height);
  if (![(THDocumentViewController *)self lastStorageAnchor])
  {
    char v8 = [(THDocumentViewController *)self activeSectionController];
    [self interactiveCanvasController].visibleUnscaledRect;
    -[THDocumentViewController setLastStorageAnchor:](self, "setLastStorageAnchor:", -[THSectionController bodyAnchorForCanvasRect:](v8, "bodyAnchorForCanvasRect:"));
  }
  if ([(THDocumentViewController *)self lastAbsolutePageIndex] == 0x7FFFFFFFFFFFFFFFLL
    && ![(THDocumentViewController *)self expandedViewController])
  {
    [(THDocumentViewController *)self setLastAbsolutePageIndex:[(THDocumentViewController *)self currentAbsolutePageIndex]];
  }
  -[THDocumentViewController updateTwoUpForSize:](self, "updateTwoUpForSize:", width, height);
  if ([(THDocumentViewController *)self p_isSinglePageChapter]) {
    [(THDocumentViewController *)self p_layoutSinglePageChapter];
  }
  v22.receiver = self;
  v22.super_class = (Class)THDocumentViewController;
  -[THDocumentViewController viewWillTransitionToSize:withTransitionCoordinator:](&v22, "viewWillTransitionToSize:withTransitionCoordinator:", a4, width, height);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_20B98;
  v21[3] = &unk_457400;
  v21[4] = self;
  [a4 animateAlongsideTransition:v21 completion:0];
  if (!-[THDocumentViewController isEpub](self, "isEpub") && [a4 isAnimated])
  {
    [(THDocumentViewController *)self setIsTransitioning:1];
    if (a4 && ([a4 targetTransform], !CGAffineTransformIsIdentity(&v20)))
    {
      [a4 transitionDuration];
      -[THDocumentViewController bookViewWillRotateTransitionToSize:duration:](self, "bookViewWillRotateTransitionToSize:duration:", width, height, v10);
      char v9 = 1;
    }
    else
    {
      -[THDocumentViewController bookViewWillTransitionToSize:](self, "bookViewWillTransitionToSize:", width, height);
      char v9 = 0;
    }
    uint64_t v16 = 0;
    double v17 = &v16;
    uint64_t v18 = 0x2020000000;
    char v19 = 0;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_20C0C;
    v14[3] = &unk_457428;
    char v15 = v9;
    v14[4] = self;
    void v14[5] = &v16;
    *(double *)&void v14[6] = width;
    *(double *)&v14[7] = height;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_20C88;
    v12[3] = &unk_457450;
    char v13 = v9;
    v12[4] = self;
    *(double *)&v12[5] = width;
    *(double *)&v12[6] = height;
    unsigned __int8 v11 = [a4 animateAlongsideTransition:v14 completion:v12];
    *((unsigned char *)v17 + 24) = v11;
    _Block_object_dispose(&v16, 8);
  }
}

- (void)p_layoutSinglePageChapter
{
  if ([(THDocumentViewController *)self transitioningFromTwoUpToOneUp]
    || [(THDocumentViewController *)self transitioningFromOneUpToTwoUp])
  {
    mPageViewProvider = self->mPageViewProvider;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    CGAffineTransform v4[2] = sub_20D98;
    v4[3] = &unk_456DE0;
    v4[4] = self;
    [(THPageViewProvider *)mPageViewProvider syncPerformBlock:v4];
  }
}

- (void)bookViewWillTransitionToSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if ([(THDocumentViewController *)self isDocumentLoaded])
  {
    [(THDocumentReflowableLayoutConfiguration *)[(THDocumentViewController *)self configuration] invalidate];
    if ([(THDocumentViewController *)self p_isSinglePageChapter]) {
      [(THDocumentViewController *)self p_layoutSinglePageChapter];
    }
    if ([(THDocumentViewController *)self lastAbsolutePageIndex] == 0x7FFFFFFFFFFFFFFFLL) {
      [(THDocumentViewController *)self setLastAbsolutePageIndex:[(THDocumentViewController *)self currentAbsolutePageIndex]];
    }
    -[THDocumentViewController updateTwoUpForSize:](self, "updateTwoUpForSize:", width, height);
    [(THDocumentViewController *)self p_dismissActiveAnimated:0];
    [self interactiveCanvasController].visibleUnscaledRect;
    -[THDocumentViewController setVisibleUnscaledRectBeforeRotation:](self, "setVisibleUnscaledRectBeforeRotation:");
    if ([(THDocumentViewController *)self showingExpandedWidgetView]) {
      -[THDocumentViewController p_layoutCanvasForSize:duration:forceBackgroundLayout:](self, "p_layoutCanvasForSize:duration:forceBackgroundLayout:", 0, width, height, 0.0);
    }
    uint64_t v6 = [(THDocumentViewController *)self bookNavigationDelegate];
    [(THBookNavigation *)v6 vantageWillChangeBy:self reason:@"THVantageChangeReasonWindowResize"];
  }
}

- (void)bookViewWillRotateTransitionToSize:(CGSize)a3 duration:(double)a4
{
  double height = a3.height;
  double width = a3.width;
  objc_msgSend(objc_msgSend(objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "layerHost"), "canvasLayer"), "setCenteredInScrollView:", 0);
  [*(id *)&self->TSADocumentViewController_opaque[OBJC_IVAR___TSADocumentViewController__scrollView] setContentInset:0.0, 0.0, 0.0, 0.0];
  if ([(THDocumentViewController *)self isDocumentLoaded])
  {
    [(THDocumentReflowableLayoutConfiguration *)[(THDocumentViewController *)self configuration] invalidate];
    +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "p_performDelayedLayoutAndRotation:", +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", self->_previousTransitionSize.width, self->_previousTransitionSize.height));
    self->_previousTransitionSize = CGSizeZero;
    char v8 = [(THDocumentViewController *)self expandedViewController];
    BOOL v9 = 1;
    if (!v8) {
      BOOL v9 = [(THDocumentViewController *)self presentedViewController] != 0;
    }
    [(THDocumentViewController *)self setDeferCanvasLayoutToAfterRotationHasCompleted:v9];
    self->mIsRotating = 1;
    [(THDocumentViewController *)self p_releaseOverscrollViews];
    double v10 = [(THDocumentViewController *)self activeSectionController];
    if (v10 == [(THDocumentViewController *)self flowSectionController])
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_21140;
      v11[3] = &unk_456DE0;
      v11[4] = self;
      +[UIView performBlockWithActionsAndAnimationsDisabled:v11];
    }
    else
    {
      [self interactiveCanvasController].visibleUnscaledRect;
      -[THDocumentViewController setVisibleUnscaledRectBeforeRotation:](self, "setVisibleUnscaledRectBeforeRotation:");
      [self view].clipsToBounds = 1;
    }
    if (([(THDocumentViewController *)self showingExpandedWidgetView]
       || [(THDocumentViewController *)self currentChapter] != 0x7FFFFFFFFFFFFFFFLL)
      && ![(THDocumentViewController *)self deferCanvasLayoutToAfterRotationHasCompleted])
    {
      -[THDocumentViewController p_layoutCanvasForSize:duration:forceBackgroundLayout:](self, "p_layoutCanvasForSize:duration:forceBackgroundLayout:", 0, width, height, a4);
    }
    [self canvasScrollView].clipsToBounds = 0;
    [(THDocumentViewController *)self p_dismissActiveAnimated:0];
    [(THBookNavigation *)[(THDocumentViewController *)self bookNavigationDelegate] vantageWillChangeBy:self reason:@"THVantageChangeReasonRotation"];
  }
}

- (void)bookViewWillAnimateRotationToSize:(CGSize)a3 duration:(double)a4
{
  double height = a3.height;
  double width = a3.width;
  if ([(THDocumentViewController *)self isDocumentLoaded])
  {
    char v8 = [(THDocumentViewController *)self activeSectionController];
    if (v8 == [(THDocumentViewController *)self paginatedSectionController])
    {
      -[THDocumentViewController p_maxScrollViewSizeForViewSize:](self, "p_maxScrollViewSizeForViewSize:", width, height);
      double v10 = v9;
      double v12 = v11;
      -[THDocumentViewController p_updateScrollViewAndZoomSettingsForSize:](self, "p_updateScrollViewAndZoomSettingsForSize:", width, height);
      [(THDocumentViewController *)self zoomedOutViewScale];
      double v14 = v13;
      [(THDocumentViewController *)self visibleUnscaledRectBeforeRotation];
      TSDCenterOfRect();
      double v16 = v15;
      [(THDocumentViewController *)self visibleUnscaledRectBeforeRotation];
      double v18 = v17;
      double v19 = v12 / v14 * 0.5;
      unsigned int v20 = [(THDocumentViewController *)self p_isSinglePageChapter];
      if (v20) {
        [(THDocumentViewController *)self p_layoutSinglePageChapter];
      }
      double v21 = v19 + v18;
      if ([(THDocumentViewController *)self transitioningFromTwoUpToOneUp])
      {
        double v16 = v16 + v10 * -0.5;
      }
      else if ([(THDocumentViewController *)self transitioningFromOneUpToTwoUp])
      {
        if (objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "navigationModel"), "navigationUnitRelativePageIndexForAbsolutePageIndex:forPresentationType:", -[THDocumentViewController lastAbsolutePageIndex](self, "lastAbsolutePageIndex"), -[THDocumentViewController currentPresentationType](self, "currentPresentationType")))
        {
          [(THDocumentViewController *)self visibleUnscaledRectBeforeRotation];
          double v16 = v16 - v22;
        }
        if (v20)
        {
          id v23 = [[self interactiveCanvasController] canvasView];
          [v23 frame];
          double v25 = v24;
          double v38 = v27;
          double v39 = v26;
          double v29 = v28 + v28;
          [self interactiveCanvasController].viewScale;
          [v23 setFrame:v25 - v16 * v30, v39, v29, v38];
        }
      }
      [*(id *)&self->TSADocumentViewController_opaque[OBJC_IVAR___TSADocumentViewController__scrollView] bounds];
      TSDMultiplySizeScalar();
      [self interactiveCanvasController].clampedUnscaledContentOffset:v16 - v31 * 0.5, v21 - v32 * 0.5, v14];
      [self.interactiveCanvasController animateToViewScale:v14 contentOffset:v33 duration:a4];
    }
    [self view].bounds;
    double MidX = CGRectGetMidX(v41);
    objc_msgSend(objc_msgSend(-[THDocumentViewController view](self, "view"), "window"), "statusBarMinDimension");
    double v37 = v36;
    [(UIView *)self->mWhiteBackground bounds];
    -[UIView setCenter:](self->mWhiteBackground, "setCenter:", MidX, v37 + CGRectGetHeight(v42) * 0.5);
    if ([(THDocumentViewController *)self inFlowMode])
    {
      [self.interactiveCanvasController recreateAllLayoutsAndReps];
      [(THDocumentViewController *)self p_updateCanvasSize];
      -[THDocumentViewController p_resizeViewsForSize:duration:maintainPageIndex:](self, "p_resizeViewsForSize:duration:maintainPageIndex:", 1, width, height, 0.0);
    }
  }
}

- (void)p_updateWidgetInteractionMode
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = objc_msgSend(objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController", 0), "canvas"), "topLevelReps");
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * i) recursivelyPerformSelectorIfImplemented:"widgetInteractionModeChanged"];
      }
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)bookViewDidRotateTransitionToSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if ([(THDocumentViewController *)self isDocumentLoaded])
  {
    if ([(THDocumentViewController *)self deferCanvasLayoutToAfterRotationHasCompleted])
    {
      +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "p_performDelayedLayoutAndRotation:", +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", self->_previousTransitionSize.width, self->_previousTransitionSize.height));
      self->_previousTransitionSize.double width = width;
      self->_previousTransitionSize.double height = height;
      [(THDocumentViewController *)self performSelector:"p_performDelayedLayoutAndRotation:" withObject:+[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", width, height) afterDelay:0.5];
    }
    else
    {
      -[THDocumentViewController p_didFinishTransitionWithSize:](self, "p_didFinishTransitionWithSize:", width, height);
    }
  }
  objc_msgSend(objc_msgSend(objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "layerHost"), "canvasLayer"), "setCenteredInScrollView:", -[THDocumentViewController inFlowMode](self, "inFlowMode") ^ 1);
  id v6 = [[[self interactiveCanvasController] layerHost] canvasLayer];

  [v6 adjustContentInsets];
}

- (void)p_performDelayedLayoutAndRotation:(id)a3
{
  [(THDocumentViewController *)self setDeferCanvasLayoutToAfterRotationHasCompleted:0];
  [a3 CGSizeValue];
  double v6 = v5;
  double v8 = v7;
  -[THDocumentViewController p_layoutCanvasForSize:duration:forceBackgroundLayout:](self, "p_layoutCanvasForSize:duration:forceBackgroundLayout:", 1);
  -[THDocumentViewController p_didFinishTransitionWithSize:](self, "p_didFinishTransitionWithSize:", v6, v8);
  id v9 = [(THDocumentViewController *)self interactiveCanvasController];

  [v9 forceStopScrolling];
}

- (void)p_didFinishTransitionWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  self->mIsRotating = 0;
  [(THDocumentViewController *)self p_setupPageNumberViews];
  [(THDocumentViewController *)self p_setupNavOverlayContainer];
  -[THDocumentViewController p_updateScrollViewAndZoomSettingsForSize:](self, "p_updateScrollViewAndZoomSettingsForSize:", width, height);
  [(UIView *)self->mWhiteBackground removeFromSuperview];

  self->mWhiteBackground = 0;
  [(THDocumentViewController *)self p_updatePageNumberingForce:1];
  [(THDocumentViewController *)self p_setupOverscrollViews];
  [(THDocumentViewController *)self p_resetPageDisplacment];
  [(THDocumentViewController *)self p_updateWidgetInteractionMode];
  double v6 = [(THDocumentViewController *)self bookNavigationDelegate];

  [(THBookNavigation *)v6 vantageDidChangeBy:self reason:@"THVantageChangeReasonRotation"];
}

- (void)p_resetPageDisplacment
{
  if (![(THDocumentViewController *)self p_allowsPageDisplacement]
    && ![(THDocumentViewController *)self inFlowMode])
  {
    mPageViewDisplacement = self->mPageViewDisplacement;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    CGAffineTransform v4[2] = sub_21A24;
    v4[3] = &unk_457228;
    v4[4] = self;
    [(THPageViewDisplacement *)mPageViewDisplacement resetAnimationsWithEnumerator:v4];
  }
}

- (void)bookViewDidTransitionToSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if ([(THDocumentViewController *)self isDocumentLoaded])
  {
    if ([(THDocumentViewController *)self currentChapter] != 0x7FFFFFFFFFFFFFFFLL)
    {
      if ([(THDocumentViewController *)self inFlowMode])
      {
        [self interactiveCanvasController].recreateAllLayoutsAndReps;
        [(THDocumentViewController *)self p_updateCanvasSize];
      }
      -[THDocumentViewController p_resizeViewsForSize:duration:maintainPageIndex:](self, "p_resizeViewsForSize:duration:maintainPageIndex:", 1, width, height, 0.0);
    }
    [(THDocumentViewController *)self p_resetPageDisplacment];
    [(THDocumentViewController *)self p_updateWidgetInteractionMode];
  }
}

- (CGSize)widgetStackMaxContainerSizeForSize:(CGSize)a3
{
  double height = a3.height;
  CGFloat width = a3.width;
  if ([(THDocumentViewController *)self inFlowMode])
  {
    [(THDocumentViewController *)self p_maxScrollViewSize];
    double height = fmin(height, v6 + 10.0 * -2.0);
  }
  double v7 = width;
  double v8 = height;
  result.double height = v8;
  result.CGFloat width = v7;
  return result;
}

- (THDocumentReflowableLayoutConfiguration)configuration
{
  CGSize result = self->_configuration;
  if (!result)
  {
    self->_configuration = [[THDocumentReflowableLayoutConfiguration alloc] initWithViewController:self provider:self];
    id v4 = [(THDocumentViewController *)self configuration];
    unsigned int v5 = [(THDocumentViewController *)self isEpub];
    double v6 = 0.8;
    if (!v5) {
      double v6 = 1.0;
    }
    [(THDocumentReflowableLayoutConfiguration *)v4 setLargeSizeFactor:v6];
    if ([(THDocumentViewController *)self parentViewController]) {
      [(-[THDocumentReflowableLayoutConfiguration environment](self->_configuration, "environment")) setView:[-[THDocumentViewController parentViewController](self, "parentViewController") view]];
    }
    if ([(THDocumentViewController *)self inFlowMode]) {
      uint64_t v7 = 2;
    }
    else {
      uint64_t v7 = 1;
    }
    [(THDocumentReflowableLayoutConfiguration *)[(THDocumentViewController *)self configuration] setLayout:v7];
    [+[THApplicationSettings sharedSettings](THApplicationSettings, "sharedSettings") flowFontScaleForFontSize:[self flowSizeScale]];
    [(THDocumentReflowableLayoutConfiguration *)[(THDocumentViewController *)self configuration] setOverrideFontSize:v8];
    return self->_configuration;
  }
  return result;
}

- (double)statusBarHeight
{
  if ([(THDocumentViewController *)self p_prefersStatusBarHidden]) {
    return 0.0;
  }
  id v3 = (void *)UIApp;

  [v3 statusBarHeight];
  return result;
}

- (double)toolbarHeight
{
  unsigned int v2 = [(THDocumentViewController *)self th_cachedIsCompactHeight];
  double result = 44.0;
  if (v2) {
    return 32.0;
  }
  return result;
}

- (double)fontSize
{
  return (double)(unint64_t)[-[THDocumentViewController documentRoot](self, "documentRoot") properties] paginatedPresentationType] fontSize];
}

- (BOOL)isEpub
{
  id v2 = [(THDocumentViewController *)self documentRoot];

  return [v2 isEPUB];
}

- (BOOL)im_isRTL
{
  return 0;
}

- (double)topBarHeight
{
  id v2 = [(THDocumentViewController *)self toolbarDelegate];

  [(THToolbarDelegate *)v2 topBarHeight];
  return result;
}

- (double)bottomBarHeight
{
  id v2 = [(THDocumentViewController *)self toolbarDelegate];

  [(THToolbarDelegate *)v2 bottomBarHeight];
  return result;
}

- (BOOL)isScrubberDisabled
{
  return 0;
}

- (BOOL)willAdjustHeightForSnapshot
{
  id v2 = [(THDocumentViewController *)self view];
  int v3 = isPad();
  if (v3)
  {
    id v4 = [v2 window];
    if (!v4) {
      [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "BOOL isSnapshotContainerFullscreenForView(UIView *)") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentViewController.mm") lineNumber:195 description:@"invalid nil value for '%s'", "window"];
    }
    [v4 frame];
    uint64_t v6 = v5;
    uint64_t v8 = v7;
    uint64_t v10 = v9;
    uint64_t v12 = v11;
    objc_msgSend(objc_msgSend(v4, "screen"), "bounds");
    uint64_t v14 = v13;
    uint64_t v16 = v15;
    uint64_t v18 = v17;
    uint64_t v20 = v19;
    uint64_t v21 = v6;
    uint64_t v22 = v8;
    uint64_t v23 = v10;
    uint64_t v24 = v12;
    LOBYTE(v3) = CGRectEqualToRect(*(CGRect *)&v21, *(CGRect *)&v14);
  }
  return v3;
}

- (id)transitionContentView
{
  return *(id *)&self->TSADocumentViewController_opaque[OBJC_IVAR___TSADocumentViewController__scrollView];
}

- (void)buildHoverControlRegionForInteraction:(id)a3 withBuilder:(id)a4
{
  if ([(THDocumentViewController *)self isEpub])
  {
    [(THDocumentReflowableLayoutConfiguration *)[(THDocumentViewController *)self configuration] scrubberFrame];
    uint64_t v8 = v7;
    uint64_t v10 = v9;
    uint64_t v12 = v11;
    uint64_t v14 = v13;
    objc_msgSend(objc_msgSend(a3, "view"), "bounds");
    double MinX = v15;
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    if ([(THDocumentReflowableLayoutConfiguration *)[(THDocumentViewController *)self configuration] isScroll]&& [(THDocumentReflowableLayoutConfiguration *)[(THDocumentViewController *)self configuration] layout] == (char *)&dword_0 + 2)
    {
      UIUserInterfaceLayoutDirection v23 = [+[UIApplication sharedApplication] userInterfaceLayoutDirection];
      uint64_t v24 = v8;
      uint64_t v25 = v10;
      uint64_t v26 = v12;
      uint64_t v27 = v14;
      if (v23 == UIUserInterfaceLayoutDirectionRightToLeft)
      {
        double MaxX = CGRectGetMaxX(*(CGRect *)&v24);
      }
      else
      {
        double MinX = CGRectGetMinX(*(CGRect *)&v24);
        double MaxX = v20 - MinX;
      }
    }
    else
    {
      [(THDocumentReflowableLayoutConfiguration *)[(THDocumentViewController *)self configuration] bottomFullWidthToolbarFrame];
      double MinX = v29;
      double v18 = v30;
      double v22 = v31;
    }
    [a4 addRegionWithRect:MinX, v18, MaxX, v22];
  }
}

- (THDocumentLinkResolver)documentLinkResolver
{
  return self->mDocumentLinkResolver;
}

- (void)setDocumentLinkResolver:(id)a3
{
}

- (int)pagePaddingOptions
{
  return self->mPagePaddingOptions;
}

- (void)setPagePaddingOptions:(int)a3
{
  self->mPagePaddingOptions = a3;
}

- (BOOL)preventVisibleInfoUpdates
{
  return self->mPreventVisibleInfoUpdates;
}

- (void)setPreventVisibleInfoUpdates:(BOOL)a3
{
  self->mPreventVisibleInfoUpdates = a3;
}

- (THWExpandedViewController)expandedViewController
{
  return self->mExpandedViewController;
}

- (void)setExpandedViewController:(id)a3
{
}

- (THModelNavigableAnchor)orientationAnchor
{
  return self->mOrientationAnchor;
}

- (void)setOrientationAnchor:(id)a3
{
}

- (THToolbarDelegate)toolbarDelegate
{
  return self->mToolbarDelegate;
}

- (void)setToolbarDelegate:(id)a3
{
  self->mToolbarDelegate = (THToolbarDelegate *)a3;
}

- (THBookNavigation)bookNavigationDelegate
{
  return self->mBookNavigationDelegate;
}

- (void)setBookNavigationDelegate:(id)a3
{
  self->mBookNavigationDelegate = (THBookNavigation *)a3;
}

- (_NSRange)visibleRelativePageRange
{
  p_mVisibleRelativePageRange = &self->mVisibleRelativePageRange;
  NSUInteger location = self->mVisibleRelativePageRange.location;
  NSUInteger length = p_mVisibleRelativePageRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setVisibleRelativePageRange:(_NSRange)a3
{
  self->mVisibleRelativePageRange = a3;
}

- (THUserAnnotationDelegate)userAnnotationDelegate
{
  return self->mUserAnnotationDelegate;
}

- (void)setUserAnnotationDelegate:(id)a3
{
  self->mUserAnnotationDelegate = (THUserAnnotationDelegate *)a3;
}

- (THSpinnerProvider)spinnerProvider
{
  return self->mSpinnerProvider;
}

- (void)setSpinnerProvider:(id)a3
{
  self->mSpinnerProvider = (THSpinnerProvider *)a3;
}

- (THRevealTOCDelegate)revealTOCDelegate
{
  return self->mRevealTOCDelegate;
}

- (void)setRevealTOCDelegate:(id)a3
{
  self->mRevealTOCDelegate = (THRevealTOCDelegate *)a3;
}

- (THBookPropertiesProvider)bookPropertiesDelegate
{
  return self->mBookPropertiesDelegate;
}

- (void)setBookPropertiesDelegate:(id)a3
{
  self->mBookPropertiesDelegate = (THBookPropertiesProvider *)a3;
}

- (THThemeDelegate)themeDelegate
{
  return self->mThemeDelegate;
}

- (void)setThemeDelegate:(id)a3
{
  self->mThemeDelegate = (THThemeDelegate *)a3;
}

- (THPageNumberView)contentPageNumberView
{
  return self->mContentPageNumberView;
}

- (void)setContentPageNumberView:(id)a3
{
}

- (THPageNumberView)navOverlayPageNumberView
{
  return self->mNavOverlayPageNumberView;
}

- (void)setNavOverlayPageNumberView:(id)a3
{
}

- (UIView)navigationOverlayContainer
{
  return self->mNavigationOverlayContainer;
}

- (void)setNavigationOverlayContainer:(id)a3
{
}

- (NSDate)lastPageNumberUpdate
{
  return self->mLastPageNumberUpdate;
}

- (void)setLastPageNumberUpdate:(id)a3
{
}

- (THOverscrollImageView)leftOverscrollView
{
  return self->mLeftOverscrollView;
}

- (void)setLeftOverscrollView:(id)a3
{
}

- (THOverscrollImageView)rightOverscrollView
{
  return self->mRightOverscrollView;
}

- (void)setRightOverscrollView:(id)a3
{
}

- (UIView)topOverscrollView
{
  return self->mTopOverscrollView;
}

- (void)setTopOverscrollView:(id)a3
{
}

- (UIView)bottomOverscrollView
{
  return self->mBottomOverscrollView;
}

- (void)setBottomOverscrollView:(id)a3
{
}

- (UIView)overscrollTransitionView
{
  return self->mOverscrollTransitionView;
}

- (void)setOverscrollTransitionView:(id)a3
{
}

- (BOOL)allowPortraitTOC
{
  return self->mAllowPortraitTOC;
}

- (void)setAllowPortraitTOC:(BOOL)a3
{
  self->mAllowPortraitTOC = a3;
}

- (BOOL)isRotating
{
  return self->mIsRotating;
}

- (CGPoint)lastScrollOffset
{
  double x = self->mLastScrollOffset.x;
  double y = self->mLastScrollOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setLastScrollOffset:(CGPoint)a3
{
  self->mLastScrollOffset = a3;
}

- (unint64_t)lastAbsolutePageIndex
{
  return self->mLastAbsolutePageIndex;
}

- (void)setLastAbsolutePageIndex:(unint64_t)a3
{
  self->mLastAbsolutePageIndedouble x = a3;
}

- (CGRect)visibleUnscaledRectBeforeRotation
{
  double x = self->mVisibleUnscaledRectBeforeRotation.origin.x;
  double y = self->mVisibleUnscaledRectBeforeRotation.origin.y;
  double width = self->mVisibleUnscaledRectBeforeRotation.size.width;
  double height = self->mVisibleUnscaledRectBeforeRotation.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setVisibleUnscaledRectBeforeRotation:(CGRect)a3
{
  self->mVisibleUnscaledRectBeforeRotation = a3;
}

- (THGuidedPanController)guidedPanController
{
  return self->mGuidedPanController;
}

- (THRevealTOCPanController)revealTOCPanController
{
  return self->mRevealTOCPanController;
}

- (id)canvasDidZoomCompletion
{
  return self->mCanvasDidZoomCompletion;
}

- (void)setCanvasDidZoomCompletion:(id)a3
{
}

- (THDocumentNavigator)documentNavigator
{
  return self->mDocumentNavigator;
}

- (void)setDocumentNavigator:(id)a3
{
}

- (THWAutoplayController)autoplayController
{
  return self->mAutoplayController;
}

- (THPageViewProvider)pageViewProvider
{
  return self->mPageViewProvider;
}

- (THPageViewDisplacement)pageViewDisplacement
{
  return self->mPageViewDisplacement;
}

- (void)setPageViewDisplacement:(id)a3
{
}

- (BOOL)firstLoad
{
  return self->mFirstLoad;
}

- (void)setFirstLoad:(BOOL)a3
{
  self->mFirstLoad = a3;
}

- (BOOL)isRevealingTOC
{
  return self->mIsRevealingTOC;
}

- (void)setIsRevealingTOC:(BOOL)a3
{
  self->mIsRevealingTOC = a3;
}

- (BOOL)isTwoUp
{
  return self->_isTwoUp;
}

- (unint64_t)flowSizeScale
{
  return self->_flowSizeScale;
}

- (void)setFlowSizeScale:(unint64_t)a3
{
  self->_flowSizeScale = a3;
}

- (THSectionController)activeSectionController
{
  return self->_activeSectionController;
}

- (void)setActiveSectionController:(id)a3
{
  self->_activeSectionController = (THSectionController *)a3;
}

- (BOOL)showFlowModeIfAvailable
{
  return self->_showFlowModeIfAvailable;
}

- (void)setShowFlowModeIfAvailable:(BOOL)a3
{
  self->_showFlowModeIfAvailable = a3;
}

- (THPaginationStatusDelegate)paginationDelegate
{
  return self->_paginationDelegate;
}

- (void)setPaginationDelegate:(id)a3
{
  self->_paginationDelegate = (THPaginationStatusDelegate *)a3;
}

- (THReadingStatisticsDelegate)readingStatisticsDelegate
{
  return self->_readingStatisticsDelegate;
}

- (void)setReadingStatisticsDelegate:(id)a3
{
  self->_readingStatisticsDelegate = (THReadingStatisticsDelegate *)a3;
}

- (int64_t)interfaceOrientation
{
  return self->_interfaceOrientation;
}

- (BOOL)deferCanvasLayoutToAfterRotationHasCompleted
{
  return self->_deferCanvasLayoutToAfterRotationHasCompleted;
}

- (void)setDeferCanvasLayoutToAfterRotationHasCompleted:(BOOL)a3
{
  self->_deferCanvasLayoutToAfterRotationHasCompleted = a3;
}

- (BOOL)performanceModeBookOpening
{
  return self->_performanceModeBookOpening;
}

- (BOOL)visibleInfoUpdatesAllowedInLandscape
{
  return self->_visibleInfoUpdatesAllowedInLandscape;
}

- (void)setVisibleInfoUpdatesAllowedInLandscape:(BOOL)a3
{
  self->_visibleInfoUpdatesAllowedInLandscape = a3;
}

- (BCDisplaySleepController)displaySleepController
{
  return self->_displaySleepController;
}

- (THSectionController)flowSectionController
{
  return self->_flowSectionController;
}

- (void)setFlowSectionController:(id)a3
{
}

- (THSectionController)paginatedSectionController
{
  return self->_paginatedSectionController;
}

- (void)setPaginatedSectionController:(id)a3
{
}

- (THReflowablePaginationController)reflowablePaginationController
{
  return self->_reflowablePaginationController;
}

- (void)setReflowablePaginationController:(id)a3
{
}

- (THWFreeTransformController)ftc
{
  return self->_ftc;
}

- (void)setFtc:(id)a3
{
}

- (BKScrubberControl)scrubber
{
  return self->_scrubber;
}

- (void)setScrubber:(id)a3
{
}

- (BKScrubberCalloutView)scrubberCallout
{
  return self->_scrubberCallout;
}

- (void)setScrubberCallout:(id)a3
{
}

- (double)scrubberCalloutWidth
{
  return self->_scrubberCalloutWidth;
}

- (void)setScrubberCalloutWidth:(double)a3
{
  self->_scrubberCalloutWidth = a3;
}

- (THModelStorageAnchor)lastStorageAnchor
{
  return self->_lastStorageAnchor;
}

- (void)setLastStorageAnchor:(id)a3
{
}

- (BOOL)justUpdatedPresentationType
{
  return self->_justUpdatedPresentationType;
}

- (void)setJustUpdatedPresentationType:(BOOL)a3
{
  self->_justUpdatedPresentationType = a3;
}

- (NSMutableDictionary)statusBarHeightForOrientation
{
  return self->_statusBarHeightForOrientation;
}

- (void)setStatusBarHeightForOrientation:(id)a3
{
}

- (CGRect)previousContentFrame
{
  double x = self->_previousContentFrame.origin.x;
  double y = self->_previousContentFrame.origin.y;
  double width = self->_previousContentFrame.size.width;
  double height = self->_previousContentFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setPreviousContentFrame:(CGRect)a3
{
  self->_previousContentFrame = a3;
}

- (CGPoint)beginDraggingContentOffset
{
  double x = self->_beginDraggingContentOffset.x;
  double y = self->_beginDraggingContentOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setBeginDraggingContentOffset:(CGPoint)a3
{
  self->_beginDraggingContentOffset = a3;
}

- (CGSize)previousTransitionSize
{
  double width = self->_previousTransitionSize.width;
  double height = self->_previousTransitionSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setPreviousTransitionSize:(CGSize)a3
{
  self->_previousTransitionSize = a3;
}

- (BOOL)inGuidedPan
{
  return self->_inGuidedPan;
}

- (void)setInGuidedPan:(BOOL)a3
{
  self->_inGuidedPan = a3;
}

- (int)compactFlowPresentationState
{
  return self->_compactFlowPresentationState;
}

- (void)setCompactFlowPresentationState:(int)a3
{
  self->_compactFlowPresentationState = a3;
}

- (BOOL)transitioningFromTwoUpToOneUp
{
  return self->_transitioningFromTwoUpToOneUp;
}

- (void)setTransitioningFromTwoUpToOneUp:(BOOL)a3
{
  self->_transitioningFromTwoUpToOneUp = a3;
}

- (BOOL)transitioningFromOneUpToTwoUp
{
  return self->_transitioningFromOneUpToTwoUp;
}

- (void)setTransitioningFromOneUpToTwoUp:(BOOL)a3
{
  self->_transitioningFromOneUpToTwoUp = a3;
}

- (CGSize)lastLayoutSize
{
  double width = self->_lastLayoutSize.width;
  double height = self->_lastLayoutSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setLastLayoutSize:(CGSize)a3
{
  self->_lastLayoutSize = a3;
}

- (BOOL)isTransitioning
{
  return self->_isTransitioning;
}

- (void)setIsTransitioning:(BOOL)a3
{
  self->_isTransitioning = a3;
}

- (CGSize)lastLayoutBoundsSize
{
  double width = self->_lastLayoutBoundsSize.width;
  double height = self->_lastLayoutBoundsSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setLastLayoutBoundsSize:(CGSize)a3
{
  self->_lastLayoutBoundsSize = a3;
}

- (BOOL)isScrubbing
{
  return self->_isScrubbing;
}

- (void)setIsScrubbing:(BOOL)a3
{
  self->_isScrubbing = a3;
}

- (BOOL)scrubberCalloutFollowsScrollerThumb
{
  return self->_scrubberCalloutFollowsScrollerThumb;
}

- (void)setScrubberCalloutFollowsScrollerThumb:(BOOL)a3
{
  self->_scrubberCalloutFollowsScrollerThumb = a3;
}

@end