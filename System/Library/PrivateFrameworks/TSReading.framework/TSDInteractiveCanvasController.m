@interface TSDInteractiveCanvasController
+ (BOOL)selectorIsActionMethod:(SEL)a3;
+ (double)smallRepOutsetForHitTesting;
+ (id)keyPathsForValuesAffectingCurrentViewScale;
+ (id)keyPathsForValuesAffectingDocumentRoot;
+ (id)keyPathsForValuesAffectingEditorController;
+ (id)keyPathsForValuesAffectingViewScale;
- ($73314616FDF354EDC5180AB8A0BD2955)centerPlusMovementContentPlacement;
- ($73314616FDF354EDC5180AB8A0BD2955)contentPlacementForPoint:(CGPoint)a3 inView:(id)a4;
- ($73314616FDF354EDC5180AB8A0BD2955)screenBottomContentPlacement;
- ($73314616FDF354EDC5180AB8A0BD2955)screenTopContentPlacement;
- ($73314616FDF354EDC5180AB8A0BD2955)touchContentPlacement;
- (BOOL)allowAutoscroll;
- (BOOL)allowLayoutAndRenderOnThread;
- (BOOL)allowNegativeAutoscroll;
- (BOOL)animatingViewScale;
- (BOOL)attachedCommentsAllowedForDrawable:(id)a3;
- (BOOL)backgroundLayoutAndRenderState:(id)a3 shouldDispatchBackgroundWork:(id)a4;
- (BOOL)canDrawTilingLayerInBackground:(id)a3;
- (BOOL)canPerformInteractiveAction:(SEL)a3 withSender:(id)a4;
- (BOOL)canZoomToCurrentSelection;
- (BOOL)canvasViewShouldBecomeFirstResponder:(id)a3;
- (BOOL)createRepsForOffscreenLayouts;
- (BOOL)currentlyWaitingOnThreadedLayoutAndRender;
- (BOOL)forceTilingLayoutOnThreadWhenScrolling;
- (BOOL)handleDoubleTapAtPoint:(CGPoint)a3;
- (BOOL)handleSingleTapAtPoint:(CGPoint)a3;
- (BOOL)hasAnnotations;
- (BOOL)i_inPrintPreviewMode;
- (BOOL)i_needsLayout;
- (BOOL)i_temporarilyDisabledLayoutAndRenderOnThreadDuringScroll;
- (BOOL)inReadMode;
- (BOOL)inVersionBrowsingMode;
- (BOOL)inspectorModeEnabled;
- (BOOL)isCanvasInteractive;
- (BOOL)isInDynamicOperation;
- (BOOL)isInInspectorDynamicOperation;
- (BOOL)isPrinting;
- (BOOL)keyboardSuppressedAndTextInputEditorIgnoresFirstResponderChanges;
- (BOOL)mustDrawTilingLayerOnMainThread:(id)a3;
- (BOOL)nestedCanvasAllowLayoutAndRenderOnThread;
- (BOOL)overlayLayerSuppressed;
- (BOOL)p_allowUpdateViewsFromReps;
- (BOOL)p_centerOnInitialSelection;
- (BOOL)p_currentlyScrolling;
- (BOOL)p_currentlyScrollingIncludeEmbeddedCanvasScrolling:(BOOL)a3;
- (BOOL)p_endEditingToBeginEditingRep:(id)a3;
- (BOOL)p_shouldLayoutAndRenderOnThread;
- (BOOL)p_shouldLayoutAndRenderOnThreadForcePendingLayout:(BOOL)a3;
- (BOOL)p_shouldSuppressAutozoomForEditor:(id)a3;
- (BOOL)preventSettingNilEditorOnTextResponder;
- (BOOL)resizeCanvasOnLayout;
- (BOOL)respondsToSelector:(SEL)a3;
- (BOOL)selectionContainsOnlyInfosOnCanvas:(id)a3 model:(id)a4;
- (BOOL)shouldAutoscrollToSelectionAfterLayout;
- (BOOL)shouldBeginDrawingTilingLayerInBackground:(id)a3 returningToken:(id *)a4 andQueue:(id *)a5;
- (BOOL)shouldClipThemeContentToCanvas;
- (BOOL)shouldDisplayCommentUIForInfo:(id)a3;
- (BOOL)shouldEverShowPathHighlightOnInvisibleShapes;
- (BOOL)shouldLayoutTilingLayer:(id)a3;
- (BOOL)shouldPopKnobsOutsideEnclosingScrollView;
- (BOOL)shouldResampleImages;
- (BOOL)shouldResizeCanvasToScrollView;
- (BOOL)shouldShowInstructionalText;
- (BOOL)shouldShowOnRepHyperlinkUI;
- (BOOL)shouldShowPathHighlightOnUnselectedInvisibleShapes;
- (BOOL)shouldShowTextOverflowGlyphs;
- (BOOL)shouldShowUserDefinedGuides;
- (BOOL)shouldSuppressRendering;
- (BOOL)shouldZoomOnSelectionChange;
- (BOOL)showGrayOverlay;
- (BOOL)showInvisibleObjects;
- (BOOL)showsComments;
- (BOOL)spellCheckingSupported;
- (BOOL)spellCheckingSuppressed;
- (BOOL)staticLayoutAndRenderOnThread;
- (BOOL)supportsBackgroundTileRendering;
- (BOOL)suppressAutozoomToSelectionAfterLayout;
- (BOOL)textGesturesInFlight;
- (BOOL)usesAlternateDrawableSelectionHighlight;
- (BOOL)wantsUpdatedScrollIndicatorInsets;
- (BOOL)zoomToFitRect:(CGRect)a3 outset:(BOOL)a4 fitWidthOnly:(BOOL)a5 centerHorizontally:(BOOL)a6 centerVertically:(BOOL)a7 animated:(BOOL)a8;
- (CALayer)overlayLayer;
- (CALayer)repContainerLayer;
- (CGColor)newDefaultSelectionHighlightColor;
- (CGColor)selectionHighlightColor;
- (CGImage)textImageFromRect:(CGRect)a3;
- (CGPoint)clampedCenterPointForPoint:(CGPoint)a3 withPlacement:(id)a4 viewScale:(double)a5;
- (CGPoint)clampedUnscaledContentOffset:(CGPoint)a3 forViewScale:(double)a4;
- (CGPoint)clampedUnscaledContentOffset:(CGPoint)a3 forViewScale:(double)a4 scrollViewBoundsSize:(CGSize)a5;
- (CGPoint)contentOffset;
- (CGPoint)convertBoundsToUnscaledPoint:(CGPoint)a3;
- (CGPoint)convertUnscaledToBoundsPoint:(CGPoint)a3;
- (CGPoint)lastTapPoint;
- (CGPoint)scrollView:(id)a3 restrictContentOffset:(CGPoint)a4;
- (CGPoint)smartZoomCenterForNoSelection;
- (CGRect)boundingRectForActiveGuidesForRect:(CGRect)a3;
- (CGRect)canvasViewBoundsWithBounds:(CGRect)a3;
- (CGRect)convertBoundsToUnscaledRect:(CGRect)a3;
- (CGRect)convertUnscaledToBoundsRect:(CGRect)a3;
- (CGRect)i_clippingBoundsForScrollViewEnclosingCanvas;
- (CGRect)p_calculateVisibleBoundsRectForTiling;
- (CGRect)p_calculateVisibleUnscaledRect;
- (CGRect)p_outsetSelectionRect:(CGRect)a3;
- (CGRect)p_visibleBoundsRectForTiling;
- (CGRect)p_visibleBoundsRectUsingSizeOfEnclosingScrollView:(BOOL)a3;
- (CGRect)p_visibleUnscaledRect;
- (CGRect)scrollFocusRectForModel:(id)a3 withSelection:(id)a4;
- (CGRect)unobscuredFrameOfView:(id)a3;
- (CGRect)unobscuredScrollViewFrame;
- (CGRect)visibleBoundsForTilingLayer:(id)a3;
- (CGRect)visibleBoundsRect;
- (CGRect)visibleBoundsRectClippedToWindow;
- (CGRect)visibleBoundsRectForTiling;
- (CGRect)visibleBoundsRectUsingSizeOfEnclosingScrollView;
- (CGRect)visibleScaledBoundsForClippingRepsOnCanvas:(id)a3;
- (CGRect)visibleUnscaledRect;
- (CGSize)canvasScrollingOutset;
- (CGSize)convertBoundsToUnscaledSize:(CGSize)a3;
- (CGSize)convertUnscaledToBoundsSize:(CGSize)a3;
- (CGSize)defaultMinimumUnscaledCanvasSize;
- (CGSize)i_canvasCenterOffsetForProposedViewScale:(double)a3 originalViewScale:(double)a4;
- (CGSize)sizeOfScrollViewEnclosingCanvas;
- (NSArray)additionalLayersOverRepLayers;
- (NSArray)additionalLayersUnderRepLayers;
- (NSArray)infosToDisplay;
- (NSSet)p_cachedTopLevelTilingLayers;
- (TSDCanvas)canvas;
- (TSDCanvasEditor)canvasEditor;
- (TSDCanvasLayer)canvasLayer;
- (TSDCanvasLayerHosting)layerHost;
- (TSDCanvasView)canvasView;
- (TSDContainerRep)topLevelContainerRepForEditing;
- (TSDDynamicOperationController)dynamicOperationController;
- (TSDEditorController)editorController;
- (TSDGestureDispatcher)gestureDispatcher;
- (TSDGuideStorage)guideStorage;
- (TSDInteractiveCanvasController)init;
- (TSDInteractiveCanvasControllerDelegate)delegate;
- (TSDLayoutController)layoutController;
- (TSDRepDirectLayerHostProvider)directLayerHostProvider;
- (TSDRulerController)rulerController;
- (TSDTextInputResponder)textInputResponder;
- (TSDTrackerManipulatorCoordinator)tmCoordinator;
- (TSDTrackingController)trackingController;
- (TSKAccessController)accessController;
- (TSKChangeNotifier)changeNotifier;
- (TSKDocumentRoot)documentRoot;
- (TSKDocumentRootProvider)documentRootProvider;
- (TSPObjectContext)objectContext;
- (double)animationBeginTime;
- (double)animationDuration;
- (double)currentViewScale;
- (double)defaultViewScale;
- (double)fitWidthViewScale;
- (double)i_adjustViewScale:(double)a3;
- (double)i_nextCanvasViewScaleDetentForProposedViewScale:(double)a3 greater:(BOOL)a4;
- (double)i_viewScaleForProposedViewScale:(double)a3 originalViewScale:(double)a4;
- (double)p_targetPointSize;
- (double)viewScale;
- (double)viewScaleForZoomToFitRect:(CGRect)a3 outset:(BOOL)a4 fitWidthOnly:(BOOL)a5;
- (id)actionForLayer:(id)a3 forKey:(id)a4;
- (id)actionGhostKnobForRep:(id)a3;
- (id)additionalVisibleInfosForCanvas:(id)a3;
- (id)ancestorRepOfRep:(id)a3 orDelegateConformingToProtocol:(id)a4;
- (id)annotationController;
- (id)beginEditingRep:(id)a3;
- (id)beginEditingRep:(id)a3 clearingSelection:(BOOL)a4 withEditorProvider:(id)a5;
- (id)beginEditingRepForInfo:(id)a3;
- (id)canvas:(id)a3 layoutGeometryProviderForLayout:(id)a4;
- (id)canvasReferenceController;
- (id)clampContentLocation:(id)a3 forPlacement:(id)a4;
- (id)clampedCenterContentLocationForPoint:(CGPoint)a3 withPlacement:(id)a4 viewScale:(double)a5;
- (id)containerLayerForRep:(id)a3;
- (id)convertContentLocation:(id)a3 fromPlacement:(id)a4 toPlacement:(id)a5;
- (id)gestureTargetStack:(id)a3;
- (id)hitKnobAtPoint:(CGPoint)a3 returningRep:(id *)a4;
- (id)hitRep:(CGPoint)a3;
- (id)hitRep:(CGPoint)a3 withGesture:(id)a4 passingTest:(id)a5;
- (id)hitRepChromeAtUnscaledPoint:(CGPoint)a3;
- (id)hitRepsAtPoint:(CGPoint)a3 withSlop:(CGSize)a4;
- (id)i_currentAnimation;
- (id)i_descriptionForViewScale:(double)a3;
- (id)i_tileStorage;
- (id)i_topLevelLayersForTiling;
- (id)infoForModel:(id)a3 withSelection:(id)a4;
- (id)infoToScrollToForModel:(id)a3 withSelection:(id)a4;
- (id)layerForRep:(id)a3;
- (id)layoutForInfo:(id)a3;
- (id)layoutForInfoNearestVisibleRect:(id)a3;
- (id)layoutForInfoNearestVisibleRect:(id)a3 intersectingSelection:(id)a4;
- (id)layoutForModel:(id)a3 withSelection:(id)a4;
- (id)layoutsForInfo:(id)a3;
- (id)layoutsForInfo:(id)a3 intersectingSelection:(id)a4;
- (id)layoutsForModel:(id)a3 withSelection:(id)a4;
- (id)localizedPercentStringForAlignmentGuide:(id)a3;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)newCanvasEditor;
- (id)p_backgroundLayoutAndRenderState;
- (id)p_decorators;
- (id)p_overlayLayerForReps:(id)a3;
- (id)p_repForLayout:(id)a3 createIfNeeded:(BOOL)a4;
- (id)p_setSelection:(id)a3 onInfo:(id)a4 withFlags:(unint64_t)a5;
- (id)provideDynamicGuides;
- (id)provideUserDefinedGuides;
- (id)queueForDrawingTilingLayerInBackground:(id)a3;
- (id)repForContainerLayer:(id)a3;
- (id)repForInfo:(id)a3;
- (id)repForInfo:(id)a3 createIfNeeded:(BOOL)a4;
- (id)repForLayer:(id)a3;
- (id)repForLayout:(id)a3;
- (id)replaceImageController;
- (id)repsForInfo:(id)a3;
- (id)topLevelRepsForHitTesting;
- (id)topLevelZOrderedSiblingsOfInfos:(id)a3;
- (id)unitFormatter;
- (id)unitStringForAngle:(double)a3;
- (id)unitStringForAngle:(double)a3 andLength:(double)a4;
- (id)unitStringForNumber:(double)a3;
- (id)unitStringForPoint:(CGPoint)a3;
- (id)unitStringForSize:(CGSize)a3;
- (id)validatedLayoutForInfo:(id)a3;
- (id)viewWithTransferredLayers;
- (int)defaultKnobTypeForRep:(id)a3;
- (void)addBackgroundRenderingObject:(id)a3;
- (void)addCommonObservers;
- (void)addDecorator:(id)a3;
- (void)animateToViewScale:(double)a3 contentOffset:(CGPoint)a4 duration:(double)a5;
- (void)animateToViewScale:(double)a3 contentOffset:(CGPoint)a4 duration:(double)a5 completion:(id)a6;
- (void)animateToViewScale:(double)a3 contentOffset:(CGPoint)a4 duration:(double)a5 forceAnimation:(BOOL)a6 completion:(id)a7;
- (void)asyncProcessChanges:(id)a3 forChangeSource:(id)a4;
- (void)backgroundLayoutAndRenderState:(id)a3 performWorkInBackgroundTilingOnly:(BOOL)a4;
- (void)backgroundLayoutAndRenderStateDidPerformBackgroundWork:(id)a3;
- (void)beginAnimations:(id)a3 context:(void *)a4;
- (void)beginDynamicOperation;
- (void)beginPossiblyParallelInspectorDynamicOperation;
- (void)beginScrollingOperation;
- (void)canvas:(id)a3 createdRep:(id)a4;
- (void)canvas:(id)a3 willLayoutRep:(id)a4;
- (void)canvasDidLayout:(id)a3;
- (void)canvasDidUpdateRepsFromLayouts:(id)a3;
- (void)canvasDidUpdateVisibleBounds:(id)a3;
- (void)canvasDidValidateLayouts:(id)a3;
- (void)canvasDidValidateLayoutsWithDependencies:(id)a3;
- (void)canvasLayoutInvalidated:(id)a3;
- (void)canvasWillLayout:(id)a3;
- (void)canvasWillUpdateRepsFromLayouts:(id)a3;
- (void)changeFirstResponderIfNecessary;
- (void)commitAnimations;
- (void)dealloc;
- (void)deselectAll:(id)a3;
- (void)didEndDrawingTilingLayerInBackground:(id)a3 withToken:(id)a4;
- (void)disableThreadedLayoutAndRender;
- (void)discardRepForClassChange:(id)a3;
- (void)displayRulerForRect:(CGRect)a3;
- (void)displayRulerWithSlowFade:(BOOL)a3;
- (void)doubleTappedCanvasBackgroundAtPoint:(CGPoint)a3;
- (void)drawLayer:(id)a3 inContext:(CGContext *)a4;
- (void)embeddedCanvasDidEndScrolling;
- (void)embeddedCanvasWillBeginScrolling;
- (void)enableThreadedLayoutAndRender;
- (void)endDynamicOperation;
- (void)endEditing;
- (void)endPossiblyParallelInspectorDynamicOperation;
- (void)endScrollingOperation;
- (void)forceStopScrolling;
- (void)forwardInvocation:(id)a3;
- (void)hideRuler;
- (void)i_canvasContentsScaleDidChange;
- (void)i_canvasWideGamutValueDidChange;
- (void)i_cvcWillBecomeFirstResponder;
- (void)i_cvcWillResignFirstResponder;
- (void)i_drawRepWithReadLock:(id)a3 inContext:(CGContext *)a4 forLayer:(id)a5;
- (void)i_invalidateSelectionHighlightLayers;
- (void)i_layerHostHasBeenTornDown;
- (void)i_layout;
- (void)i_layoutRegistered:(id)a3;
- (void)i_layoutUnregistered:(id)a3;
- (void)i_recordUserViewScale;
- (void)i_repNeedsDisplay:(id)a3;
- (void)i_repNeedsDisplay:(id)a3 inRect:(CGRect)a4;
- (void)i_syncWithLayoutThread;
- (void)i_viewDidZoomToViewScale:(double)a3;
- (void)i_viewIsZoomingAtPoint:(CGPoint)a3;
- (void)i_viewScaleDidChange;
- (void)i_viewScrollDidChange;
- (void)i_viewScrollWillChange;
- (void)i_viewScrollingEnded;
- (void)i_viewWillBeginZooming;
- (void)invalidateComments;
- (void)invalidateLayers;
- (void)invalidateLayoutInBackground:(id)a3;
- (void)invalidateReps;
- (void)invalidateRepsIfSynced;
- (void)invalidateRepsInBackground;
- (void)invalidateVisibleBounds;
- (void)invalidateVisibleBoundsInBackground;
- (void)layoutIfNeeded;
- (void)layoutInvalidated;
- (void)makeEditorPerformAction:(SEL)a3 withSender:(id)a4;
- (void)makeUserDefinedGuidesVisible;
- (void)p_acquireLockAndPerformAction:(id)a3;
- (void)p_applyViewScale:(double)a3 andContentOffset:(CGPoint)a4;
- (void)p_autoscrollToSelection:(id)a3 withInfo:(id)a4 isInitialSelection:(BOOL)a5 focusRect:(CGRect)a6;
- (void)p_autoscrollToSelection:(id)a3 withInfo:(id)a4 isInitialSelection:(BOOL)a5 focusRect:(CGRect)a6 scrollImmediately:(BOOL)a7 skipZoom:(BOOL)a8;
- (void)p_beginZoomingOperation;
- (void)p_commonInit;
- (void)p_discardContainerLayer:(id)a3 forRep:(id)a4;
- (void)p_discardLayer:(id)a3 forRep:(id)a4;
- (void)p_drawLayerWithReadLock:(id)a3;
- (void)p_editorControllerDidChangeTextInputEditor:(id)a3;
- (void)p_editorControllerSelectionDidChange:(id)a3;
- (void)p_editorControllerSelectionDidChangeAndWantsKeyboard:(id)a3;
- (void)p_editorDidChangeSelection:(id)a3 withSelectionFlags:(unint64_t)a4;
- (void)p_editorDoneChangingSelection:(id)a3;
- (void)p_editorDoneChangingSelection:(id)a3 withFlags:(unint64_t)a4;
- (void)p_endZoomingOperation;
- (void)p_iccWillBecomeFirstResponderNotification:(id)a3;
- (void)p_iccWillResignFirstResponderNotification:(id)a3;
- (void)p_invalidateForBackgroundLayout;
- (void)p_invalidateTilingLayers;
- (void)p_layoutWithReadLock;
- (void)p_maybeSetTextResponderEditorTo:(id)a3;
- (void)p_postNotificationOnMainThreadWithValidLayouts:(id)a3;
- (void)p_recursiveHitKnobAtPoint:(CGPoint)a3 inRep:(id)a4 minDistance:(double *)a5 hitKnob:(id *)a6 hitRep:(id *)a7;
- (void)p_recursivelyClearLayerDelegate:(id)a3;
- (void)p_recursivelyUpdateLayerEdgeAntialiasingForLayer:(id)a3;
- (void)p_recursivelyUpdateLayerForRep:(id)a3 accumulatingLayers:(id)a4 andReps:(id)a5;
- (void)p_rulerUnitsDidChangeNotification:(id)a3;
- (void)p_scrollModelToVisible:(id)a3 withSelection:(id)a4;
- (void)p_scrollToPrimarySelectionForEditor:(id)a3 skipZoom:(BOOL)a4;
- (void)p_scrollViewDidEndScrollingAnimation:(id)a3;
- (void)p_setTargetPointSize:(double)a3;
- (void)p_setupPopoutLayerForReps:(id)a3;
- (void)p_textGesturesDidEndNotification:(id)a3;
- (void)p_textGesturesWillBeginNotification:(id)a3;
- (void)p_updateCanvasSizeFromLayouts;
- (void)p_updateLayersFromReps;
- (void)p_updateViewsFromReps;
- (void)p_updateViewsFromRepsForceUpdate:(BOOL)a3;
- (void)p_viewScrollingEnded;
- (void)p_willEnterForeground:(id)a3;
- (void)performBlockAfterNextLayout:(id)a3;
- (void)performBlockNextFrame:(id)a3;
- (void)popThreadedLayoutAndRenderDisabled;
- (void)presentError:(id)a3 completionHandler:(id)a4;
- (void)presentErrors:(id)a3 withLocalizedDescription:(id)a4 completionHandler:(id)a5;
- (void)pushThreadedLayoutAndRenderDisabled;
- (void)recreateAllLayoutsAndReps;
- (void)removeBackgroundRenderingObject:(id)a3;
- (void)removeCommonObservers;
- (void)removeDecorator:(id)a3;
- (void)resumeEditing;
- (void)reuseTextInputResponderFrom:(id)a3;
- (void)scrollCurrentSelectionToVisible;
- (void)scrollRectToVisible:(CGRect)a3 animated:(BOOL)a4;
- (void)scrollRectToVisibleCenter:(CGRect)a3 animated:(BOOL)a4 onlyScrollNecessaryAxes:(BOOL)a5;
- (void)scrollRectToVisibleWithSelectionOutset:(CGRect)a3 animated:(BOOL)a4;
- (void)scrollSearchReferenceToVisible:(id)a3;
- (void)scrollToPrimarySelection;
- (void)scrollToPrimarySelectionForEditor:(id)a3;
- (void)scrollToSelection:(id)a3 onModel:(id)a4;
- (void)scrollToSelection:(id)a3 onModel:(id)a4 scrollImmediately:(BOOL)a5;
- (void)scrollView:(id)a3 willAnimateToContentOffset:(CGPoint)a4;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidEndScrollingAnimation:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewDidScrollToTop:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setAllowLayoutAndRenderOnThread:(BOOL)a3;
- (void)setAnimation:(id)a3 forLayer:(id)a4 forKey:(id)a5;
- (void)setAnimationCompletionBlock:(id)a3;
- (void)setAnimationDelay:(double)a3;
- (void)setAnimationDelegate:(id)a3;
- (void)setAnimationDidStopSelector:(SEL)a3;
- (void)setAnimationDuration:(double)a3;
- (void)setAnimationFilterBlock:(id)a3;
- (void)setAnimationRepeatAutoreverses:(BOOL)a3;
- (void)setAnimationRepeatCount:(float)a3;
- (void)setAnimationStartDate:(id)a3;
- (void)setAnimationTimingFunction:(id)a3;
- (void)setAnimationUseRepFiltering:(BOOL)a3;
- (void)setAnimationWillStartSelector:(SEL)a3;
- (void)setCanvasEditor:(id)a3;
- (void)setContentOffset:(CGPoint)a3 animated:(BOOL)a4;
- (void)setContentOffset:(CGPoint)a3 clamp:(BOOL)a4 animated:(BOOL)a5;
- (void)setContentOffset:(CGPoint)a3 clamp:(BOOL)a4 animated:(BOOL)a5 completionBlock:(id)a6;
- (void)setCreateRepsForOffscreenLayouts:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDirectLayerHostProvider:(id)a3;
- (void)setForceTilingLayoutOnThreadWhenScrolling:(BOOL)a3;
- (void)setInReadMode:(BOOL)a3;
- (void)setInVersionBrowsingMode:(BOOL)a3;
- (void)setInfosToDisplay:(id)a3;
- (void)setKeyboardSuppressedAndTextInputEditorIgnoresFirstResponderChanges:(BOOL)a3;
- (void)setLastTapPoint:(CGPoint)a3;
- (void)setLayerHost:(id)a3;
- (void)setNeedsDisplayInRect:(CGRect)a3 onLayer:(id)a4;
- (void)setNeedsDisplayOnLayer:(id)a3;
- (void)setNestedCanvasAllowLayoutAndRenderOnThread:(BOOL)a3;
- (void)setOverlayLayerSuppressed:(BOOL)a3;
- (void)setP_cachedTopLevelTilingLayers:(id)a3;
- (void)setP_visibleBoundsRectForTiling:(CGRect)a3;
- (void)setP_visibleUnscaledRect:(CGRect)a3;
- (void)setPreventSettingNilEditorOnTextResponder:(BOOL)a3;
- (void)setResizeCanvasOnLayout:(BOOL)a3;
- (void)setRulerController:(id)a3;
- (void)setSelection:(id)a3 onModel:(id)a4 withFlags:(unint64_t)a5;
- (void)setSelectionHighlightColor:(CGColor *)a3;
- (void)setShouldAutoscrollToSelectionAfterLayout:(BOOL)a3;
- (void)setShouldClipThemeContentToCanvas:(BOOL)a3;
- (void)setShouldShowUserDefinedGuides:(BOOL)a3;
- (void)setShouldSuppressRendering:(BOOL)a3;
- (void)setShouldSuppressRendering:(BOOL)a3 animated:(BOOL)a4;
- (void)setShowGrayOverlay:(BOOL)a3;
- (void)setShowInvisibleObjects:(BOOL)a3;
- (void)setStaticLayoutAndRenderOnThread:(BOOL)a3;
- (void)setSupportsBackgroundTileRendering:(BOOL)a3;
- (void)setSuppressAutozoomToSelectionAfterLayout:(BOOL)a3;
- (void)setTextGesturesInFlight:(BOOL)a3;
- (void)setTrackingController:(id)a3;
- (void)setUnobscuredScrollViewFrame:(CGRect)a3;
- (void)setUsesAlternateDrawableSelectionHighlight:(BOOL)a3;
- (void)setViewScale:(double)a3;
- (void)setViewScale:(double)a3 andScrollViewFrame:(CGRect)a4 animated:(BOOL)a5;
- (void)setViewScale:(double)a3 andScrollViewFrame:(CGRect)a4 maintainPosition:(BOOL)a5 animated:(BOOL)a6;
- (void)setViewScale:(double)a3 contentOffset:(CGPoint)a4 clampOffset:(BOOL)a5 animated:(BOOL)a6;
- (void)setViewScale:(double)a3 contentOffset:(CGPoint)a4 clampOffset:(BOOL)a5 animationDuration:(double)a6 completion:(id)a7;
- (void)setViewScale:(double)a3 contentOffset:(CGPoint)a4 clampOffset:(BOOL)a5 animationDuration:(double)a6 forceAnimation:(BOOL)a7 completion:(id)a8;
- (void)showOrHideComments:(id)a3;
- (void)syncProcessChanges:(id)a3 forChangeSource:(id)a4;
- (void)tappedCanvasBackgroundAtPoint:(CGPoint)a3;
- (void)teardown;
- (void)teardownBackgroundRendering;
- (void)teardownCanvasEditor;
- (void)toggleShouldShowUserDefinedGuides;
- (void)unobscuredFrameDidChange;
- (void)updateSelectionForTapAtPoint:(CGPoint)a3 extendingSelection:(BOOL)a4;
- (void)viewDidEndZooming;
- (void)zoomToCurrentSelection;
- (void)zoomWithAnimationToUnscaledRect:(CGRect)a3;
@end

@implementation TSDInteractiveCanvasController

- (TSDInteractiveCanvasController)init
{
  v5.receiver = self;
  v5.super_class = (Class)TSDInteractiveCanvasController;
  v2 = [(TSDInteractiveCanvasController *)&v5 init];
  v3 = v2;
  if (v2) {
    [(TSDInteractiveCanvasController *)v2 p_commonInit];
  }
  __dmb(0xBu);
  return v3;
}

- (void)addCommonObservers
{
  v3 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel_p_rulerUnitsDidChangeNotification_ name:TSKRulerUnitsDidChangeNotification object:0];
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "addObserver:selector:name:object:", self, sel_p_iccWillBecomeFirstResponderNotification_, @"TSDInteractiveCanvasControllerWillBecomeFirstResponderNotification", 0);
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "addObserver:selector:name:object:", self, sel_p_iccWillResignFirstResponderNotification_, @"TSDInteractiveCanvasControllerWillResignFirstResponderNotification", 0);
  [v3 addObserver:self selector:sel_p_textGesturesWillBeginNotification_ name:@"TSDTextGesturesWillBeginNotification" object:0];
  [v3 addObserver:self selector:sel_p_textGesturesDidEndNotification_ name:@"TSDTextGesturesDidEndNotification" object:0];
  uint64_t v4 = *MEMORY[0x263F1D0D0];
  [v3 addObserver:self selector:sel_p_willEnterForeground_ name:v4 object:0];
}

- (void)removeCommonObservers
{
  v3 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:TSKRulerUnitsDidChangeNotification object:0];
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "removeObserver:name:object:", self, @"TSDInteractiveCanvasControllerWillBecomeFirstResponderNotification", 0);
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "removeObserver:name:object:", self, @"TSDInteractiveCanvasControllerWillResignFirstResponderNotification", 0);
  [v3 removeObserver:self name:@"TSDTextGesturesWillBeginNotification" object:0];
  [v3 removeObserver:self name:@"TSDTextGesturesDidEndNotification" object:0];
  uint64_t v4 = *MEMORY[0x263F1D0D0];
  [v3 removeObserver:self name:v4 object:0];
}

- (void)p_commonInit
{
  self->mSelfSync = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x263F08AE0]);
  v3 = objc_alloc_init(TSDCanvas);
  self->mCanvas = v3;
  [(TSDCanvas *)v3 setDelegate:self];
  [(TSDCanvas *)self->mCanvas i_setCanvasController:self];
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  objc_super v5 = (const CFDictionaryValueCallBacks *)MEMORY[0x263EFFF90];
  self->mRepLayersByRep = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, 0, MEMORY[0x263EFFF90]);
  self->mRepsByRepLayer = CFDictionaryCreateMutable(v4, 0, 0, v5);
  self->mContainerLayersByRep = CFDictionaryCreateMutable(v4, 0, 0, v5);
  self->mRepsByContainerLayer = CFDictionaryCreateMutable(v4, 0, 0, v5);
  self->mDirectLayerHostsByRep = CFDictionaryCreateMutable(v4, 0, 0, v5);
  v6 = (CALayer *)objc_alloc_init(MEMORY[0x263F157E8]);
  self->mRepContainerLayer = v6;
  [(CALayer *)v6 setDelegate:self];
  [(CALayer *)self->mRepContainerLayer setName:@"repContainer"];
  self->mResizeCanvasOnLayout = 0;
  [(TSDInteractiveCanvasController *)self addCommonObservers];
  double v7 = *MEMORY[0x263F001A0];
  double v8 = *(double *)(MEMORY[0x263F001A0] + 8);
  double v9 = *(double *)(MEMORY[0x263F001A0] + 16);
  double v10 = *(double *)(MEMORY[0x263F001A0] + 24);
  -[TSDInteractiveCanvasController setP_visibleBoundsRectForTiling:](self, "setP_visibleBoundsRectForTiling:", *MEMORY[0x263F001A0], v8, v9, v10);
  -[TSDInteractiveCanvasController setP_visibleUnscaledRect:](self, "setP_visibleUnscaledRect:", v7, v8, v9, v10);
  self->mTileStorage = objc_alloc_init(TSDTileStorage);
  self->mDisplayLinkDispatch = objc_alloc_init(TSDDisplayLinkDispatch);
  self->mNotificationsToPostWithValidLayouts = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
}

- (void)dealloc
{
  if (!self->mHasBeenTornDown)
  {
    v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSDInteractiveCanvasController dealloc]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 459, @"Must call -teardown on ICC before it is deallocated");
  }
  if (self->mHadLayerHost && !self->mLayerHostHasBeenTornDown)
  {
    objc_super v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSDInteractiveCanvasController dealloc]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 462, @"Must call -teardown on CVC before ICC is deallocated");
  }

  CGColorRelease(self->mSelectionHighlightColor);
  [(TSDInteractiveCanvasController *)self removeCommonObservers];
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "removeObserver:", self);
  [(CALayer *)self->mOverlayLayer setDelegate:0];

  self->mOverlayLayer = 0;
  self->mPopoutLayer = 0;

  self->mGuideController = 0;
  self->mEditorController = 0;

  self->mCanvasEditor = 0;
  self->mTextInputResponder = 0;
  mTextInputResponderSource = self->mTextInputResponderSource;
  if (mTextInputResponderSource)
  {
    --mTextInputResponderSource->mTextInputResponderShareCount;

    self->mTextInputResponderSource = 0;
  }

  self->mUnitFormatter = 0;
  self->mTMCoordinator = 0;

  self->mDynOpController = 0;
  self->mGestureDispatcher = 0;

  self->mTrackingController = 0;
  self->mBackgroundLayoutAndRenderState = 0;
  mRepLayersByRep = self->mRepLayersByRep;
  if (mRepLayersByRep)
  {
    CFRelease(mRepLayersByRep);
    self->mRepLayersByRep = 0;
  }
  mRepsByRepLayer = self->mRepsByRepLayer;
  if (mRepsByRepLayer)
  {
    CFRelease(mRepsByRepLayer);
    self->mRepsByRepLayer = 0;
  }
  mContainerLayersByRep = self->mContainerLayersByRep;
  if (mContainerLayersByRep)
  {
    CFRelease(mContainerLayersByRep);
    self->mContainerLayersByRep = 0;
  }
  mDirectLayerHostsByRep = self->mDirectLayerHostsByRep;
  if (mDirectLayerHostsByRep)
  {
    CFRelease(mDirectLayerHostsByRep);
    self->mDirectLayerHostsByRep = 0;
  }
  mRepsByContainerLayer = self->mRepsByContainerLayer;
  if (mRepsByContainerLayer)
  {
    CFRelease(mRepsByContainerLayer);
    self->mRepsByContainerLayer = 0;
  }
  [(CALayer *)self->mRepContainerLayer setDelegate:0];

  self->mRepContainerLayer = 0;
  self->mDecorators = 0;

  self->mCurrentAnimation = 0;
  self->mHiddenTopLevelLayers = 0;

  self->mCanvas = 0;
  self->mDisplayedAnnotation = 0;

  self->mAnnotationPopoverController = 0;
  self->mNextLayoutBlocks = 0;

  self->mDisplayLinkDispatch = 0;
  self->_directLayerHostProvider = 0;

  self->mCachedTopLevelTilingLayers = 0;
  v13.receiver = self;
  v13.super_class = (Class)TSDInteractiveCanvasController;
  [(TSDInteractiveCanvasController *)&v13 dealloc];
}

- (id)methodSignatureForSelector:(SEL)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v9.receiver = self;
  v9.super_class = (Class)TSDInteractiveCanvasController;
  if (-[TSDInteractiveCanvasController respondsToSelector:](&v9, sel_respondsToSelector_))
  {
    v8.receiver = self;
    v8.super_class = (Class)TSDInteractiveCanvasController;
    return [(TSDInteractiveCanvasController *)&v8 methodSignatureForSelector:a3];
  }
  else
  {
    id result = (id)methodSignatureForSelector__s_actionMethodSignature;
    if (!methodSignatureForSelector__s_actionMethodSignature)
    {
      if (snprintf(__str, 0x20uLL, "%s%s%s%s", "v", "@", ":", "@") >= 0x20)
      {
        uint64_t v6 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v7 = [NSString stringWithUTF8String:"-[TSDInteractiveCanvasController methodSignatureForSelector:]"];
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 580, @"ObjCTypes string overflowed");
      }
      id result = (id)[MEMORY[0x263EFF970] signatureWithObjCTypes:__str];
      methodSignatureForSelector__s_actionMethodSignature = (uint64_t)result;
    }
  }
  return result;
}

+ (BOOL)selectorIsActionMethod:(SEL)a3
{
  Name = (char *)sel_getName(a3);
  objc_super v5 = &Name[strlen(Name) - 1];
  if (*v5 != 58 || strchr(Name, 58) != v5) {
    return 0;
  }
  return sel_tilingLayerWillSetNeedsLayout_ != a3 && sel_descriptionWithLocale_ != a3;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TSDInteractiveCanvasController;
  if (-[TSDInteractiveCanvasController respondsToSelector:](&v7, sel_respondsToSelector_))
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    BOOL v5 = +[TSDInteractiveCanvasController selectorIsActionMethod:a3];
    if (v5) {
      LOBYTE(v5) = [(TSDEditorController *)[(TSDInteractiveCanvasController *)self editorController] editorForEditAction:a3 withSender:0] != 0;
    }
  }
  return v5;
}

- (void)forwardInvocation:(id)a3
{
  uint64_t v5 = [a3 selector];
  uint64_t v12 = 0;
  [a3 getArgument:&v12 atIndex:2];
  uint64_t v6 = [(TSDInteractiveCanvasController *)self editorController];
  uint64_t v7 = [(TSDEditorController *)v6 editorForEditAction:v5 withSender:v12];
  if (v7 && (uint64_t v8 = v7, (objc_opt_respondsToSelector() & 1) != 0))
  {
    objc_super v9 = [(TSKDocumentRoot *)[(TSDInteractiveCanvasController *)self documentRoot] accessController];
    if (v9)
    {
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __52__TSDInteractiveCanvasController_forwardInvocation___block_invoke;
      v11[3] = &unk_2646B0750;
      v11[4] = a3;
      v11[5] = v8;
      [(TSKAccessController *)v9 performRead:v11];
    }
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)TSDInteractiveCanvasController;
    [(TSDInteractiveCanvasController *)&v10 doesNotRecognizeSelector:v5];
  }
}

uint64_t __52__TSDInteractiveCanvasController_forwardInvocation___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invokeWithTarget:*(void *)(a1 + 40)];
}

- (void)teardownCanvasEditor
{
  mCanvasEditor = self->mCanvasEditor;
  if (mCanvasEditor)
  {
    [(TSDCanvasEditor *)mCanvasEditor setSelection:0];
    if (objc_msgSend(-[TSDEditorController currentEditors](self->mEditorController, "currentEditors"), "indexOfObjectIdenticalTo:", self->mCanvasEditor) != 0x7FFFFFFFFFFFFFFFLL)-[TSDEditorController popEditor:](self->mEditorController, "popEditor:", self->mCanvasEditor); {
    [(TSDCanvasEditor *)self->mCanvasEditor teardown];
    }

    self->mCanvasEditor = 0;
  }

  self->mEditorController = 0;
}

- (void)teardown
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel_i_viewScrollingEnded object:0];
  mCanvasEditor = self->mCanvasEditor;
  if (mCanvasEditor)
  {
    [(TSDCanvasEditor *)mCanvasEditor setSelection:0];
    id v4 = [(TSDEditorController *)self->mEditorController currentEditors];
    if (!v4 || [v4 indexOfObjectIdenticalTo:self->mCanvasEditor] == 0x7FFFFFFFFFFFFFFFLL) {
      [(TSDCanvasEditor *)self->mCanvasEditor teardown];
    }
  }
  [(TSDEditorController *)self->mEditorController teardown];

  self->mCanvasEditor = 0;
  self->mEditorController = 0;
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self];
  [(TSDDisplayLinkDispatch *)self->mDisplayLinkDispatch teardown];

  self->mDisplayLinkDispatch = 0;
  [(TSDInteractiveCanvasController *)self removeCommonObservers];
  if (self->mLayoutAndRenderOnThreadDuringScroll && self->mCurrentlyWaitingOnThreadedLayoutAndRender) {
    [(TSDInteractiveCanvasController *)self i_syncWithLayoutThread];
  }
  [(TSDBackgroundLayoutAndRenderState *)self->mBackgroundLayoutAndRenderState clearDelegate];

  self->mBackgroundLayoutAndRenderState = 0;
  [(TSDInteractiveCanvasController *)self teardownBackgroundRendering];
  [(TSDInteractiveCanvasController *)self setTrackingController:0];
  if (self->mCanvasEditor)
  {
    [(TSDInteractiveCanvasController *)self endEditing];
    [(TSDInteractiveCanvasController *)self teardownCanvasEditor];
  }
  mTextInputResponder = self->mTextInputResponder;
  if (self->mTextInputResponderSource) {
    [(TSDTextInputResponder *)mTextInputResponder forceDelayedResponderChange];
  }
  else {
    [(TSDTextInputResponder *)mTextInputResponder teardown];
  }
  [(TSDGestureDispatcher *)[(TSDInteractiveCanvasController *)self gestureDispatcher] teardown];
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0) {
    self->mTeardownOnBackgroundThread = 1;
  }
  [(TSDCanvas *)self->mCanvas teardown];
  if ([MEMORY[0x263F08B88] isMainThread]) {
    [(TSDInteractiveCanvasController *)self p_updateViewsFromRepsForceUpdate:1];
  }
  [(TSDTileStorage *)self->mTileStorage removeAllContents];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  mRepsByRepLayer = self->mRepsByRepLayer;
  uint64_t v7 = [(__CFDictionary *)mRepsByRepLayer countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(mRepsByRepLayer);
        }
        [(TSDInteractiveCanvasController *)self p_recursivelyClearLayerDelegate:*(void *)(*((void *)&v11 + 1) + 8 * i)];
      }
      uint64_t v8 = [(__CFDictionary *)mRepsByRepLayer countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
  [(TSDInteractiveCanvasController *)self setDelegate:0];
  [(NSMutableSet *)self->mNotificationsToPostWithValidLayouts removeAllObjects];
  self->mHasBeenTornDown = 1;
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self];
  if (self->mSuspendedLowPriorityThreadDispatcher)
  {
    self->mSuspendedLowPriorityThreadDispatcher = 0;
    objc_msgSend(+[TSKLowPriorityThreadDispatcher sharedLowPriorityDispatcher](TSKLowPriorityThreadDispatcher, "sharedLowPriorityDispatcher"), "resume");
  }
}

- (void)p_recursivelyClearLayerDelegate:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  [a3 setDelegate:0];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v5 = objc_msgSend(a3, "sublayers", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [(TSDInteractiveCanvasController *)self p_recursivelyClearLayerDelegate:*(void *)(*((void *)&v10 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)i_layerHostHasBeenTornDown
{
  self->mLayerHostHasBeenTornDown = 1;
}

- (void)setLayerHost:(id)a3
{
  if (a3) {
    self->mHadLayerHost = 1;
  }
  self->mLayerHost = (TSDCanvasLayerHosting *)a3;
}

- (void)i_cvcWillBecomeFirstResponder
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "postNotificationName:object:userInfo:", @"TSDInteractiveCanvasControllerWillBecomeFirstResponderNotification", self, 0);
  if (objc_opt_respondsToSelector())
  {
    mDelegate = self->mDelegate;
    [(TSDInteractiveCanvasControllerDelegate *)mDelegate interactiveCanvasControllerWillBecomeFirstResponder:self];
  }
}

- (void)i_cvcWillResignFirstResponder
{
  v3 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  [v3 postNotificationName:@"TSDInteractiveCanvasControllerWillResignFirstResponderNotification" object:self userInfo:0];
}

- (void)p_iccWillBecomeFirstResponderNotification:(id)a3
{
  id v4 = (TSDInteractiveCanvasController *)[a3 object];
  if (v4 != self)
  {
    uint64_t v5 = [(TSDCanvasView *)[(TSDInteractiveCanvasController *)v4 canvasView] rootCanvasView];
    if (v5 == [(TSDCanvasView *)[(TSDInteractiveCanvasController *)self canvasView] rootCanvasView])
    {
      [(TSDInteractiveCanvasController *)self endEditing];
    }
  }
}

- (void)p_iccWillResignFirstResponderNotification:(id)a3
{
  if ((TSDInteractiveCanvasController *)[a3 object] == self
    && (objc_opt_respondsToSelector() & 1) != 0
    && [(TSDInteractiveCanvasControllerDelegate *)self->mDelegate interactiveCanvasControllerShouldEndEditingWhenLosingFirstResponder:self])
  {
    [(TSDInteractiveCanvasController *)self endEditing];
  }
}

- (void)teardownBackgroundRendering
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v3 = [(TSDCanvas *)self->mCanvas allReps];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "i_shutdownTileQueue");
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v4);
  }
  mBackgroundRenderingObjects = self->mBackgroundRenderingObjects;
  objc_sync_enter(mBackgroundRenderingObjects);
  uint64_t v8 = (void *)[(NSMutableArray *)self->mBackgroundRenderingObjects copy];
  objc_sync_exit(mBackgroundRenderingObjects);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v12 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v13;
    do
    {
      for (uint64_t j = 0; j != v9; ++j)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * j) teardownBackgroundRendering];
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v12 objects:v20 count:16];
    }
    while (v9);
  }
}

- (void)addBackgroundRenderingObject:(id)a3
{
  mBackgroundRenderingObjects = self->mBackgroundRenderingObjects;
  objc_sync_enter(mBackgroundRenderingObjects);
  uint64_t v6 = self->mBackgroundRenderingObjects;
  if (!v6)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->mBackgroundRenderingObjects = v6;
  }
  [(NSMutableArray *)v6 addObject:a3];
  objc_sync_exit(mBackgroundRenderingObjects);
}

- (void)removeBackgroundRenderingObject:(id)a3
{
  mBackgroundRenderingObjects = self->mBackgroundRenderingObjects;
  objc_sync_enter(mBackgroundRenderingObjects);
  uint64_t v6 = [(NSMutableArray *)self->mBackgroundRenderingObjects indexOfObject:a3];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"-[TSDInteractiveCanvasController removeBackgroundRenderingObject:]"];
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 879, @"removeBackgroundRenderingObject called on an object that is not in the array");
  }
  [(NSMutableArray *)self->mBackgroundRenderingObjects removeObjectAtIndex:v6];
  objc_sync_exit(mBackgroundRenderingObjects);
}

- (void)setDelegate:(id)a3
{
  if (self->mDelegate != a3) {
    self->mDelegate = (TSDInteractiveCanvasControllerDelegate *)a3;
  }
}

+ (id)keyPathsForValuesAffectingDocumentRoot
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:@"delegate"];
}

- (TSKDocumentRootProvider)documentRootProvider
{
  return self->mDelegate;
}

- (TSKDocumentRoot)documentRoot
{
  return (TSKDocumentRoot *)[(TSDInteractiveCanvasControllerDelegate *)self->mDelegate documentRoot];
}

- (TSPObjectContext)objectContext
{
  v2 = [(TSDInteractiveCanvasController *)self documentRoot];
  return [(TSPObject *)v2 context];
}

- (TSKChangeNotifier)changeNotifier
{
  v2 = [(TSDInteractiveCanvasController *)self documentRoot];
  return [(TSKDocumentRoot *)v2 changeNotifier];
}

- (TSKAccessController)accessController
{
  v2 = [(TSDInteractiveCanvasController *)self documentRoot];
  return [(TSKDocumentRoot *)v2 accessController];
}

- (CGSize)defaultMinimumUnscaledCanvasSize
{
  double v2 = *MEMORY[0x263F001B0];
  double v3 = *(double *)(MEMORY[0x263F001B0] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)canvasLayoutInvalidated:(id)a3
{
  if ([(TSDInteractiveCanvasController *)self isCanvasInteractive]
    && ([MEMORY[0x263F08B88] isMainThread]
     || !self->mLayoutAndRenderOnThreadDuringScroll && self->mNestedCanvasAllowLayoutAndRenderOnThread))
  {
    uint64_t v4 = (void *)[(TSDCanvasLayerHosting *)[(TSDInteractiveCanvasController *)self layerHost] canvasLayer];
    [v4 setNeedsLayout];
  }
}

- (void)canvasDidUpdateVisibleBounds:(id)a3
{
  double v4 = *MEMORY[0x263F001A0];
  double v5 = *(double *)(MEMORY[0x263F001A0] + 8);
  double v6 = *(double *)(MEMORY[0x263F001A0] + 16);
  double v7 = *(double *)(MEMORY[0x263F001A0] + 24);
  -[TSDInteractiveCanvasController setP_visibleBoundsRectForTiling:](self, "setP_visibleBoundsRectForTiling:", a3, *MEMORY[0x263F001A0], v5, v6, v7);
  -[TSDInteractiveCanvasController setP_visibleUnscaledRect:](self, "setP_visibleUnscaledRect:", v4, v5, v6, v7);
}

- (void)canvasWillLayout:(id)a3
{
  if (objc_opt_respondsToSelector())
  {
    mDelegate = self->mDelegate;
    [(TSDInteractiveCanvasControllerDelegate *)mDelegate interactiveCanvasControllerWillLayout:self];
  }
}

- (void)canvasDidValidateLayouts:(id)a3
{
  if (objc_opt_respondsToSelector())
  {
    mDelegate = self->mDelegate;
    [(TSDInteractiveCanvasControllerDelegate *)mDelegate interactiveCanvasControllerDidValidateLayouts:self];
  }
}

- (void)canvasDidLayout:(id)a3
{
  if (objc_opt_respondsToSelector()) {
    [(TSDInteractiveCanvasControllerDelegate *)self->mDelegate interactiveCanvasControllerDidLayout:self];
  }
  [(TSDInteractiveCanvasController *)self p_postNotificationOnMainThreadWithValidLayouts:@"TSDInteractiveCanvasControllerDidLayoutNotification"];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__TSDInteractiveCanvasController_canvasDidLayout___block_invoke;
  block[3] = &unk_2646AF7B8;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __50__TSDInteractiveCanvasController_canvasDidLayout___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  double v2 = *(void **)(*(void *)(a1 + 32) + 600);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v7 + 1) + 8 * i) + 16))();
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }

  *(void *)(*(void *)(a1 + 32) + 600) = 0;
}

- (void)canvasWillUpdateRepsFromLayouts:(id)a3
{
  if ([(TSDInteractiveCanvasController *)self resizeCanvasOnLayout])
  {
    [(TSDInteractiveCanvasController *)self p_updateCanvasSizeFromLayouts];
  }
}

- (void)canvasDidUpdateRepsFromLayouts:(id)a3
{
  [(TSDCanvasLayerHosting *)[(TSDInteractiveCanvasController *)self layerHost] canvasDidUpdateRepsFromLayouts];
  [(TSDInteractiveCanvasController *)self p_updateLayersFromReps];
  if (!self->mCurrentlyWaitingOnThreadedLayoutAndRender
    && [MEMORY[0x263F08B88] isMainThread])
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __65__TSDInteractiveCanvasController_canvasDidUpdateRepsFromLayouts___block_invoke;
    v4[3] = &unk_2646AF7B8;
    v4[4] = self;
    [(TSDInteractiveCanvasController *)self p_acquireLockAndPerformAction:v4];
    if (!self->mCurrentlyScrolling) {
      [(TSDTrackingController *)[(TSDInteractiveCanvasController *)self trackingController] interactiveCanvasControllerUpdatedRepsFromLayouts:self];
    }
  }
}

uint64_t __65__TSDInteractiveCanvasController_canvasDidUpdateRepsFromLayouts___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "p_updateViewsFromReps");
}

- (void)canvasDidValidateLayoutsWithDependencies:(id)a3
{
}

- (CGRect)visibleScaledBoundsForClippingRepsOnCanvas:(id)a3
{
  if (self->mCreateRepsForOffscreenLayouts)
  {
    double v3 = *MEMORY[0x263F00190];
    double v4 = *(double *)(MEMORY[0x263F00190] + 8);
    double v5 = *(double *)(MEMORY[0x263F00190] + 16);
    double v6 = *(double *)(MEMORY[0x263F00190] + 24);
  }
  else
  {
    [(TSDInteractiveCanvasController *)self visibleBoundsRect];
    double v3 = v8;
    double v4 = v9;
    double v5 = v10;
    double v6 = v11;
    if (objc_opt_respondsToSelector())
    {
      -[TSDInteractiveCanvasControllerDelegate interactiveCanvasController:expandVisibleBoundsForClippingReps:](self->mDelegate, "interactiveCanvasController:expandVisibleBoundsForClippingReps:", self, v3, v4, v5, v6);
      double v3 = v12;
      double v4 = v13;
      double v5 = v14;
      double v6 = v15;
    }
  }
  double v16 = v3;
  double v17 = v4;
  double v18 = v5;
  double v19 = v6;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (id)additionalVisibleInfosForCanvas:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (self->mCreateRepsForOffscreenLayouts) {
    return 0;
  }
  [(TSDCanvasEditor *)[(TSDInteractiveCanvasController *)self canvasEditor] canvasSelection];
  double v3 = (void *)[(id)TSUProtocolCast() infos];
  double v6 = [(TSDDynamicOperationController *)[(TSDInteractiveCanvasController *)self dynamicOperationController] allTransformedReps];
  if (v6)
  {
    long long v7 = v6;
    double v3 = (void *)[MEMORY[0x263EFF9C0] setWithSet:v3];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v8 = [(NSSet *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(v3, "addObject:", objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "info"));
        }
        uint64_t v9 = [(NSSet *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
  return v3;
}

- (void)canvas:(id)a3 willLayoutRep:(id)a4
{
  if (objc_opt_respondsToSelector())
  {
    mDelegate = self->mDelegate;
    [(TSDInteractiveCanvasControllerDelegate *)mDelegate interactiveCanvasController:self willLayoutRep:a4];
  }
}

- (void)canvas:(id)a3 createdRep:(id)a4
{
  double v5 = [(TSDInteractiveCanvasController *)self canvasEditor];
  [(TSDCanvasEditor *)v5 repWasCreated:a4];
}

- (id)canvas:(id)a3 layoutGeometryProviderForLayout:(id)a4
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  mDelegate = self->mDelegate;
  return (id)[(TSDInteractiveCanvasControllerDelegate *)mDelegate interactiveCanvasController:self layoutGeometryProviderForLayout:a4];
}

- (void)presentError:(id)a3 completionHandler:(id)a4
{
  double v6 = [(TSDInteractiveCanvasController *)self layerHost];
  [(TSDCanvasLayerHosting *)v6 presentError:a3 completionHandler:a4];
}

- (void)presentErrors:(id)a3 withLocalizedDescription:(id)a4 completionHandler:(id)a5
{
  uint64_t v8 = [(TSDInteractiveCanvasController *)self layerHost];
  [(TSDCanvasLayerHosting *)v8 presentErrors:a3 withLocalizedDescription:a4 completionHandler:a5];
}

+ (id)keyPathsForValuesAffectingEditorController
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:@"documentRoot"];
}

- (TSDEditorController)editorController
{
  if (!self->mEditorController
    && [(TSDInteractiveCanvasController *)self documentRoot]
    && [MEMORY[0x263F08B88] isMainThread])
  {
    double v4 = [(TSDInteractiveCanvasController *)self delegate];
    if (v4 && (double v5 = v4, (objc_opt_respondsToSelector() & 1) != 0))
    {
      double v6 = (TSDEditorController *)(id)[(TSDInteractiveCanvasControllerDelegate *)v5 editorControllerForInteractiveCanvasController:self];
      self->mEditorController = v6;
      if (!v6) {
        goto LABEL_10;
      }
    }
    else if (!self->mEditorController)
    {
LABEL_10:
      self->mEditorController = [[TSDEditorController alloc] initWithDocumentRoot:[(TSDInteractiveCanvasController *)self documentRoot]];
    }
    long long v7 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    [v7 addObserver:self selector:sel_p_editorControllerDidChangeTextInputEditor_ name:@"TSDEditorControllerDidChangeTextInputEditor" object:self->mEditorController];
    [v7 addObserver:self selector:sel_p_editorControllerDidChangeCurrentEditors_ name:@"TSDEditorControllerDidChangeCurrentEditors" object:self->mEditorController];
    [v7 addObserver:self selector:sel_p_editorControllerSelectionDidChange_ name:@"TSDEditorControllerSelectionDidChange" object:self->mEditorController];
    [v7 addObserver:self selector:sel_p_editorControllerSelectionDidChange_ name:@"TSDEditorControllerSelectionWasForciblyChanged" object:self->mEditorController];
    [v7 addObserver:self selector:sel_p_editorControllerSelectionDidChangeAndWantsKeyboard_ name:@"TSDEditorControllerSelectionDidChangeAndWantsKeyboard" object:self->mEditorController];
    [(TSDEditorController *)self->mEditorController pushEditor:[(TSDInteractiveCanvasController *)self canvasEditor]];
  }
  return self->mEditorController;
}

- (TSDTextInputResponder)textInputResponder
{
  int v3 = TSUSupportsTextInteraction();
  CGRect result = self->mTextInputResponder;
  if (v3)
  {
    if (!result)
    {
      CGRect result = (TSDTextInputResponder *)objc_msgSend(objc_alloc((Class)TSDTextInputResponderClass()), "initWithNextResponder:", -[TSDCanvasLayerHosting canvasView](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "canvasView"));
      self->mTextInputResponder = result;
    }
  }
  return result;
}

- (id)newCanvasEditor
{
  int v3 = [TSDCanvasEditor alloc];
  return [(TSDCanvasEditor *)v3 initWithInteractiveCanvasController:self];
}

- (TSDCanvasEditor)canvasEditor
{
  if (!self->mCanvasEditor
    && [(TSDInteractiveCanvasController *)self documentRoot]
    && !self->mHasBeenTornDown)
  {
    self->mCanvasEditor = (TSDCanvasEditor *)[(TSDInteractiveCanvasController *)self newCanvasEditor];
  }
  return self->mCanvasEditor;
}

- (id)beginEditingRepForInfo:(id)a3
{
  [(TSDInteractiveCanvasController *)self p_layoutWithReadLock];
  id result = [(TSDInteractiveCanvasController *)self repForInfo:a3];
  if (result)
  {
    return [(TSDInteractiveCanvasController *)self beginEditingRep:result];
  }
  return result;
}

- (id)beginEditingRep:(id)a3 clearingSelection:(BOOL)a4 withEditorProvider:(id)a5
{
  BOOL v6 = a4;
  uint64_t v9 = [(TSDInteractiveCanvasController *)self editorController];
  [(TSDInteractiveCanvasController *)self p_layoutWithReadLock];
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 1;
  uint64_t v10 = [(TSDInteractiveCanvasController *)self editorController];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __87__TSDInteractiveCanvasController_beginEditingRep_clearingSelection_withEditorProvider___block_invoke;
  v15[3] = &unk_2646B1308;
  v15[4] = a3;
  v15[5] = &v16;
  [(TSDEditorController *)v10 enumerateEditorsOnStackUsingBlock:v15];
  if (*((unsigned char *)v17 + 24))
  {
    [(TSDInteractiveCanvasController *)self p_endEditingToBeginEditingRep:a3];
    id v11 = a3;
    if (v6) {
      [(TSDCanvasEditor *)[(TSDInteractiveCanvasController *)self canvasEditor] setSelection:0];
    }
  }
  if (a3)
  {
    uint64_t v12 = (*((uint64_t (**)(id))a5 + 2))(a5);
    if (v12)
    {
      [(TSDEditorController *)v9 pushEditor:v12];
      [(TSDEditorController *)v9 setTextInputEditor:v12];
    }
  }
  id v13 = [(TSDEditorController *)v9 textInputEditor];
  _Block_object_dispose(&v16, 8);
  return v13;
}

uint64_t __87__TSDInteractiveCanvasController_beginEditingRep_clearingSelection_withEditorProvider___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t result = [a2 shouldEndEditingToBeginEditingRep:*(void *)(a1 + 32)];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
    *a3 = 1;
  }
  return result;
}

- (id)beginEditingRep:(id)a3
{
  [(TSDInteractiveCanvasController *)self p_layoutWithReadLock];
  double v5 = [(TSDInteractiveCanvasController *)self editorController];
  uint64_t v6 = [(TSDEditorController *)v5 textInputEditor];
  if (!a3 || (long long v7 = (void *)v6) == 0 || ([a3 canEditWithEditor:v6] & 1) == 0)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __50__TSDInteractiveCanvasController_beginEditingRep___block_invoke;
    v9[3] = &unk_2646B1330;
    v9[4] = a3;
    [(TSDInteractiveCanvasController *)self beginEditingRep:a3 clearingSelection:1 withEditorProvider:v9];
    return [(TSDEditorController *)v5 textInputEditor];
  }
  return v7;
}

uint64_t __50__TSDInteractiveCanvasController_beginEditingRep___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) beginEditing];
}

- (void)endEditing
{
}

- (BOOL)canZoomToCurrentSelection
{
  return [(TSDCanvasSelection *)[(TSDCanvasEditor *)[(TSDInteractiveCanvasController *)self canvasEditor] canvasSelection] infoCount] != 0;
}

- (CGPoint)smartZoomCenterForNoSelection
{
  [(TSDCanvas *)[(TSDInteractiveCanvasController *)self canvas] unscaledSize];
  double v2 = TSDRectWithSize();
  double v6 = TSDCenterOfRect(v2, v3, v4, v5);
  result.y = v7;
  result.x = v6;
  return result;
}

- (void)zoomToCurrentSelection
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  CGFloat v3 = [(TSDCanvasEditor *)[(TSDInteractiveCanvasController *)self canvasEditor] canvasSelection];
  double v4 = *MEMORY[0x263F001A8];
  double v5 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v6 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v7 = *(double *)(MEMORY[0x263F001A8] + 24);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v8 = [(TSDCanvasSelection *)v3 infos];
  uint64_t v9 = [(NSSet *)v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = [(TSDInteractiveCanvasController *)self layoutForInfo:*(void *)(*((void *)&v21 + 1) + 8 * v12)];
        if (v13)
        {
          objc_msgSend((id)objc_msgSend(v13, "geometryInRoot"), "frame");
          double v4 = TSDUnionRect(v4, v5, v6, v7, v14, v15, v16, v17);
          double v5 = v18;
          double v6 = v19;
          double v7 = v20;
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSSet *)v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }
  v27.origin.x = v4;
  v27.origin.y = v5;
  v27.size.width = v6;
  v27.size.height = v7;
  CGRect v28 = CGRectInset(v27, -10.0, -10.0);
  -[TSDInteractiveCanvasController zoomWithAnimationToUnscaledRect:](self, "zoomWithAnimationToUnscaledRect:", v28.origin.x, v28.origin.y, v28.size.width, v28.size.height);
}

- (void)zoomWithAnimationToUnscaledRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(TSDInteractiveCanvasController *)self visibleUnscaledRect];
  [(TSDInteractiveCanvasController *)self viewScale];
  uint64_t v8 = (void *)[(TSDCanvasLayerHosting *)[(TSDInteractiveCanvasController *)self layerHost] canvasLayer];
  [v8 minimumPinchViewScale];
  [v8 maximumPinchViewScale];
  TSUClamp();
  double v10 = v9;
  double v11 = TSDCenterOfRect(x, y, width, height);
  double v13 = v12;
  [v8 contentInset];
  objc_msgSend(v8, "animateToViewScale:contentCenter:contentInset:duration:completionBlock:", 0, v10, v11, v13, v14, v15, v16, v17, 0.2);
}

- (BOOL)shouldZoomOnSelectionChange
{
  [(TSDInteractiveCanvasController *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  CGFloat v3 = [(TSDInteractiveCanvasController *)self delegate];
  return [(TSDInteractiveCanvasControllerDelegate *)v3 zoomOnSelectionChange:self];
}

- (id)p_setSelection:(id)a3 onInfo:(id)a4 withFlags:(unint64_t)a5
{
  if (a4)
  {
    uint64_t v8 = [(TSDInteractiveCanvasController *)self beginEditingRepForInfo:a4];
  }
  else
  {
    [(TSDInteractiveCanvasController *)self endEditing];
    if (![a3 conformsToProtocol:&unk_26D78FD70])
    {
      double v9 = 0;
      goto LABEL_9;
    }
    uint64_t v8 = [(TSDInteractiveCanvasController *)self canvasEditor];
  }
  double v9 = v8;
  if (v8 && (objc_opt_respondsToSelector() & 1) == 0)
  {
    double v10 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v11 = [NSString stringWithUTF8String:"-[TSDInteractiveCanvasController p_setSelection:onInfo:withFlags:]"];
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 1399, @"editor does not implement optional protocol method");
  }
LABEL_9:
  [(TSDCanvasEditor *)v9 setSelection:a3 withFlags:a5];
  return v9;
}

- (id)infoForModel:(id)a3 withSelection:(id)a4
{
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (id result = (id)[(TSDInteractiveCanvasControllerDelegate *)self->mDelegate interactiveCanvasController:self infoForModel:a3 withSelection:a4]) == 0)
  {
    return (id)TSUProtocolCast();
  }
  return result;
}

- (id)infoToScrollToForModel:(id)a3 withSelection:(id)a4
{
  id result = -[TSDInteractiveCanvasController infoForModel:withSelection:](self, "infoForModel:withSelection:", a3);
  if (!result)
  {
    id result = (id)TSUProtocolCast();
    if (result)
    {
      id v5 = result;
      id result = (id)[result infoCount];
      if (result)
      {
        double v6 = (void *)[v5 infos];
        return (id)[v6 anyObject];
      }
    }
  }
  return result;
}

- (void)scrollCurrentSelectionToVisible
{
  id v3 = [(TSDEditorController *)[(TSDInteractiveCanvasController *)self editorController] mostSpecificCurrentEditorOfClass:0];
  double v4 = 0;
  if (objc_opt_respondsToSelector()) {
    double v4 = (TSKSelection *)[v3 selection];
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = [v3 model];
    if (!v4)
    {
LABEL_7:
      double v4 = [(TSDCanvasEditor *)[(TSDInteractiveCanvasController *)self canvasEditor] selection];
      if (!v4) {
        return;
      }
    }
  }
  else
  {
    uint64_t v5 = 0;
    if (!v4) {
      goto LABEL_7;
    }
  }
  [(TSDInteractiveCanvasController *)self scrollToSelection:v4 onModel:v5];
}

- (void)scrollSearchReferenceToVisible:(id)a3
{
  if (objc_opt_respondsToSelector()) {
    [(TSDInteractiveCanvasControllerDelegate *)self->mDelegate willScrollSearchReferenceToVisible:a3];
  }
  uint64_t v5 = [a3 model];
  uint64_t v6 = [a3 selection];
  [(TSDInteractiveCanvasController *)self p_scrollModelToVisible:v5 withSelection:v6];
}

- (void)p_scrollModelToVisible:(id)a3 withSelection:(id)a4
{
  [(TSDInteractiveCanvasController *)self layoutIfNeeded];
  id v7 = [(TSDInteractiveCanvasController *)self infoToScrollToForModel:a3 withSelection:a4];
  if (objc_opt_respondsToSelector())
  {
    [(TSDInteractiveCanvasControllerDelegate *)self->mDelegate interactiveCanvasController:self targetRectForInfo:v7 withSelection:a4];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
  }
  else
  {
    double v9 = *MEMORY[0x263F001A0];
    double v11 = *(double *)(MEMORY[0x263F001A0] + 8);
    double v13 = *(double *)(MEMORY[0x263F001A0] + 16);
    double v15 = *(double *)(MEMORY[0x263F001A0] + 24);
  }
  v23.origin.CGFloat x = v9;
  v23.origin.CGFloat y = v11;
  v23.size.CGFloat width = v13;
  v23.size.CGFloat height = v15;
  if (CGRectIsNull(v23))
  {
    id v16 = [(TSDInteractiveCanvasController *)self layoutForInfoNearestVisibleRect:v7 intersectingSelection:a4];
    if (!v16) {
      id v16 = [(TSDInteractiveCanvasController *)self validatedLayoutForInfo:[(TSDInteractiveCanvasController *)self infoForModel:a3 withSelection:a4]];
    }
    [v16 rectForSelection:a4];
    objc_msgSend(v16, "rectInRoot:");
    double v9 = v17;
    double v11 = v18;
    double v13 = v19;
    double v15 = v20;
  }
  if (objc_opt_respondsToSelector()) {
    uint64_t v21 = [(TSDInteractiveCanvasControllerDelegate *)self->mDelegate interactiveCanvasControllerShouldAnimateToSearchReferences:self];
  }
  else {
    uint64_t v21 = 1;
  }
  -[TSDInteractiveCanvasController scrollRectToVisibleWithSelectionOutset:animated:](self, "scrollRectToVisibleWithSelectionOutset:animated:", v21, v9, v11, v13, v15);
}

- (void)setSelection:(id)a3 onModel:(id)a4 withFlags:(unint64_t)a5
{
  uint64_t v26 = 0;
  CGRect v27 = &v26;
  uint64_t v28 = 0x3052000000;
  v29 = __Block_byref_object_copy__10;
  v30 = __Block_byref_object_dispose__10;
  uint64_t v31 = 0;
  uint64_t v22 = 0;
  CGRect v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  uint64_t v9 = TSUProtocolCast();
  if (!v9)
  {
    id v10 = 0;
    if ((a5 & 0x80) != 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  id v10 = [(TSDInteractiveCanvasController *)self infoForModel:v9 withSelection:a3];
  if ((a5 & 0x80) == 0)
  {
LABEL_5:
    double v11 = [(TSDInteractiveCanvasController *)self editorController];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __65__TSDInteractiveCanvasController_setSelection_onModel_withFlags___block_invoke;
    v21[3] = &unk_2646B1358;
    v21[4] = a4;
    v21[5] = a3;
    v21[6] = v10;
    v21[7] = &v22;
    v21[8] = &v26;
    [(TSDEditorController *)v11 enumerateEditorsOnStackUsingBlock:v21];
  }
LABEL_6:
  self->mShouldAnimateAutoscroll = (a5 & 0x10) != 0;
  if (*((unsigned char *)v23 + 24))
  {
    self->mShouldAutoscrollToSelectionAfterLayout = (a5 & 0x40) >> 6;
    self->mShouldCenterSelectionWhenAutoscrolling = (~a5 & 0x1000040) == 0;
    if ((a5 & 0x40) != 0) {
      [(TSDInteractiveCanvasController *)self layoutInvalidated];
    }
    if (v27[5] && (objc_opt_respondsToSelector() & 1) == 0)
    {
      double v12 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v13 = [NSString stringWithUTF8String:"-[TSDInteractiveCanvasController setSelection:onModel:withFlags:]"];
      objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 1529, @"editor does not implement optional protocol method");
    }
    [(id)v27[5] setSelection:a3 withFlags:a5];
  }
  else
  {
    self->mShouldAutoscrollToSelectionAfterLayout = 0;
    self->mShouldCenterSelectionWhenAutoscrolling = 0;
    uint64_t v17 = 0;
    double v18 = &v17;
    uint64_t v19 = 0x2020000000;
    char v20 = 1;
    double v14 = [(TSDInteractiveCanvasController *)self editorController];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __65__TSDInteractiveCanvasController_setSelection_onModel_withFlags___block_invoke_2;
    v16[3] = &unk_2646B1380;
    v16[4] = a3;
    v16[5] = v10;
    v16[6] = &v17;
    [(TSDEditorController *)v14 enumerateEditorsOnStackUsingBlock:v16];
    if (*((unsigned char *)v18 + 24))
    {
      if ((a5 & 0x40) != 0)
      {
        id v15 = [(TSDInteractiveCanvasController *)self p_setSelection:a3 onInfo:v10 withFlags:a5];
        v27[5] = (uint64_t)v15;
        if (!v15) {
          [(TSDInteractiveCanvasController *)self endEditing];
        }
        [(TSDInteractiveCanvasController *)self layoutIfNeeded];
      }
      if (!v27[5]) {
        [(TSDInteractiveCanvasController *)self p_setSelection:a3 onInfo:v10 withFlags:a5];
      }
    }
    _Block_object_dispose(&v17, 8);
  }
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);
}

uint64_t __65__TSDInteractiveCanvasController_setSelection_onModel_withFlags___block_invoke(void *a1, void *a2, unsigned char *a3)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t result = [a2 model];
    if (result == a1[4])
    {
      uint64_t result = objc_opt_respondsToSelector();
      if ((result & 1) == 0
        || (uint64_t result = [a2 readyToAcceptSelection:a1[5] onInfo:a1[6]], result))
      {
        *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
        *(void *)(*(void *)(a1[8] + 8) + 40) = a2;
        *a3 = 1;
      }
    }
  }
  return result;
}

uint64_t __65__TSDInteractiveCanvasController_setSelection_onModel_withFlags___block_invoke_2(void *a1, void *a2, unsigned char *a3)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t result = [a2 ignoreSetSelection:a1[4] onInfo:a1[5]];
    if (result)
    {
      *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
      *a3 = 1;
    }
  }
  return result;
}

- (CGRect)scrollFocusRectForModel:(id)a3 withSelection:(id)a4
{
  double v4 = *MEMORY[0x263F001A0];
  double v5 = *(double *)(MEMORY[0x263F001A0] + 8);
  double v6 = *(double *)(MEMORY[0x263F001A0] + 16);
  double v7 = *(double *)(MEMORY[0x263F001A0] + 24);
  result.size.CGFloat height = v7;
  result.size.CGFloat width = v6;
  result.origin.CGFloat y = v5;
  result.origin.CGFloat x = v4;
  return result;
}

- (void)scrollToSelection:(id)a3 onModel:(id)a4
{
}

- (void)scrollToSelection:(id)a3 onModel:(id)a4 scrollImmediately:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v8 = TSUProtocolCast();
  if (v8) {
    id v9 = [(TSDInteractiveCanvasController *)self infoForModel:v8 withSelection:a3];
  }
  else {
    id v9 = 0;
  }
  [(TSDInteractiveCanvasController *)self layoutIfNeeded];
  [(TSDInteractiveCanvasController *)self scrollFocusRectForModel:v8 withSelection:a3];
  -[TSDInteractiveCanvasController p_autoscrollToSelection:withInfo:isInitialSelection:focusRect:scrollImmediately:skipZoom:](self, "p_autoscrollToSelection:withInfo:isInitialSelection:focusRect:scrollImmediately:skipZoom:", a3, v9, 0, v5, 0);
}

- (void)p_scrollToPrimarySelectionForEditor:(id)a3 skipZoom:(BOOL)a4
{
  if (a3)
  {
    BOOL v4 = a4;
    if ((objc_opt_respondsToSelector() & 1) != 0
      && [a3 selection]
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      if ([a3 model]) {
        id v7 = -[TSDInteractiveCanvasController infoToScrollToForModel:withSelection:](self, "infoToScrollToForModel:withSelection:", [a3 model], objc_msgSend(a3, "selection"));
      }
      else {
        id v7 = 0;
      }
      uint64_t v8 = [a3 selection];
      -[TSDInteractiveCanvasController scrollFocusRectForModel:withSelection:](self, "scrollFocusRectForModel:withSelection:", [a3 model], objc_msgSend(a3, "selection"));
      -[TSDInteractiveCanvasController p_autoscrollToSelection:withInfo:isInitialSelection:focusRect:scrollImmediately:skipZoom:](self, "p_autoscrollToSelection:withInfo:isInitialSelection:focusRect:scrollImmediately:skipZoom:", v8, v7, 0, 0, v4);
    }
  }
}

- (void)scrollToPrimarySelectionForEditor:(id)a3
{
}

- (void)scrollToPrimarySelection
{
  id v3 = [(TSDEditorController *)[(TSDInteractiveCanvasController *)self editorController] textInputEditor];
  [(TSDInteractiveCanvasController *)self scrollToPrimarySelectionForEditor:v3];
}

- (void)layoutInvalidated
{
  if (!self->mStaticLayoutAndRenderOnThread)
  {
    if (self->mLayoutAndRenderOnThreadDuringScroll
      && self->mCurrentlyWaitingOnThreadedLayoutAndRender
      && [MEMORY[0x263F08B88] isMainThread])
    {
      [(TSDInteractiveCanvasController *)self i_syncWithLayoutThread];
    }
    mCanvas = self->mCanvas;
    [(TSDCanvas *)mCanvas layoutInvalidated];
  }
}

- (void)invalidateReps
{
  if (self->mLayoutAndRenderOnThreadDuringScroll
    && self->mCurrentlyWaitingOnThreadedLayoutAndRender
    && [MEMORY[0x263F08B88] isMainThread])
  {
    [(TSDInteractiveCanvasController *)self i_syncWithLayoutThread];
  }
  mCanvas = self->mCanvas;
  [(TSDCanvas *)mCanvas invalidateReps];
}

- (void)invalidateRepsIfSynced
{
  if (!self->mLayoutAndRenderOnThreadDuringScroll
    || !self->mCurrentlyWaitingOnThreadedLayoutAndRender
    || ([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    mCanvas = self->mCanvas;
    [(TSDCanvas *)mCanvas invalidateReps];
  }
}

- (void)invalidateRepsInBackground
{
  if (self->mLayoutAndRenderOnThreadDuringScroll
    && (!self->mCurrentlyWaitingOnThreadedLayoutAndRender
     || ([(TSDInteractiveCanvasController *)self i_syncWithLayoutThread],
         self->mLayoutAndRenderOnThreadDuringScroll))
    && [(TSDInteractiveCanvasController *)self p_currentlyScrolling]
    && !self->mDisableThreadedLayoutAndRender)
  {
    [(NSRecursiveLock *)self->mSelfSync lock];
    self->mCurrentlyWaitingOnThreadedLayoutAndRender = 1;
    [(TSDCanvas *)self->mCanvas invalidateReps];
    [(NSRecursiveLock *)self->mSelfSync unlock];
    id v4 = [(TSDInteractiveCanvasController *)self p_backgroundLayoutAndRenderState];
    [v4 setNeedsLayoutAndRender];
  }
  else
  {
    mCanvas = self->mCanvas;
    [(TSDCanvas *)mCanvas invalidateReps];
  }
}

- (void)invalidateLayoutInBackground:(id)a3
{
  if (self->mLayoutAndRenderOnThreadDuringScroll
    && (!self->mCurrentlyWaitingOnThreadedLayoutAndRender
     || ([(TSDInteractiveCanvasController *)self i_syncWithLayoutThread],
         self->mLayoutAndRenderOnThreadDuringScroll))
    && [(TSDInteractiveCanvasController *)self p_currentlyScrolling]
    && !self->mDisableThreadedLayoutAndRender)
  {
    [(NSRecursiveLock *)self->mSelfSync lock];
    self->mCurrentlyWaitingOnThreadedLayoutAndRender = 1;
    [a3 invalidate];
    [(NSRecursiveLock *)self->mSelfSync unlock];
    id v5 = [(TSDInteractiveCanvasController *)self p_backgroundLayoutAndRenderState];
    [v5 setNeedsLayoutAndRender];
  }
  else
  {
    [a3 invalidate];
  }
}

- (void)invalidateVisibleBoundsInBackground
{
  if (self->mLayoutAndRenderOnThreadDuringScroll
    && (!self->mCurrentlyWaitingOnThreadedLayoutAndRender
     || ([(TSDInteractiveCanvasController *)self i_syncWithLayoutThread],
         self->mLayoutAndRenderOnThreadDuringScroll))
    && [(TSDInteractiveCanvasController *)self p_currentlyScrolling]
    && !self->mDisableThreadedLayoutAndRender)
  {
    [(NSRecursiveLock *)self->mSelfSync lock];
    self->mCurrentlyWaitingOnThreadedLayoutAndRender = 1;
    [(TSDCanvas *)self->mCanvas invalidateVisibleBounds];
    [(NSRecursiveLock *)self->mSelfSync unlock];
    id v4 = [(TSDInteractiveCanvasController *)self p_backgroundLayoutAndRenderState];
    [v4 setNeedsLayoutAndRender];
  }
  else
  {
    mCanvas = self->mCanvas;
    [(TSDCanvas *)mCanvas invalidateVisibleBounds];
  }
}

- (void)invalidateVisibleBounds
{
  if (self->mLayoutAndRenderOnThreadDuringScroll
    && self->mCurrentlyWaitingOnThreadedLayoutAndRender
    && [MEMORY[0x263F08B88] isMainThread]
    && (!self->mForceTilingLayoutOnThreadWhenScrolling
     || ![(TSDInteractiveCanvasController *)self p_currentlyScrolling]))
  {
    [(TSDInteractiveCanvasController *)self i_syncWithLayoutThread];
  }
  mCanvas = self->mCanvas;
  [(TSDCanvas *)mCanvas invalidateVisibleBounds];
}

- (void)invalidateLayers
{
  if (self->mLayoutAndRenderOnThreadDuringScroll
    && self->mCurrentlyWaitingOnThreadedLayoutAndRender
    && [MEMORY[0x263F08B88] isMainThread])
  {
    [(TSDInteractiveCanvasController *)self i_syncWithLayoutThread];
  }
  mCanvas = self->mCanvas;
  [(TSDCanvas *)mCanvas invalidateLayers];
}

- (void)setShouldSuppressRendering:(BOOL)a3
{
}

- (void)setShouldSuppressRendering:(BOOL)a3 animated:(BOOL)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  if (self->mShouldSuppressRendering != a3)
  {
    BOOL v4 = a4;
    BOOL v5 = a3;
    self->mShouldSuppressRendering = a3;
    id v7 = objc_msgSend((id)-[TSDCanvasLayerHosting canvasLayer](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "canvasLayer"), "sublayers");
    uint64_t v8 = v7;
    if (v5)
    {
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      uint64_t v9 = [v7 countByEnumeratingWithState:&v31 objects:v37 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v32;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v32 != v11) {
              objc_enumerationMutation(v8);
            }
            [*(id *)(*((void *)&v31 + 1) + 8 * i) setHidden:1];
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v31 objects:v37 count:16];
        }
        while (v10);
      }
    }
    else
    {
      if (v4)
      {
        [MEMORY[0x263F15760] animationWithKeyPath:@"opacity"];
        objc_msgSend(0, "setFromValue:", objc_msgSend(NSNumber, "numberWithFloat:", 0.0));
      }
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      uint64_t v13 = [v8 countByEnumeratingWithState:&v27 objects:v36 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v28;
        do
        {
          for (uint64_t j = 0; j != v14; ++j)
          {
            if (*(void *)v28 != v15) {
              objc_enumerationMutation(v8);
            }
            uint64_t v17 = *(void **)(*((void *)&v27 + 1) + 8 * j);
            [v17 setHidden:0];
            if (v4) {
              [v17 addAnimation:0 forKey:@"fade in"];
            }
          }
          uint64_t v14 = [v8 countByEnumeratingWithState:&v27 objects:v36 count:16];
        }
        while (v14);
      }
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v18 = [(TSDCanvas *)self->mCanvas topLevelReps];
      uint64_t v19 = [v18 countByEnumeratingWithState:&v23 objects:v35 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v24;
        do
        {
          for (uint64_t k = 0; k != v20; ++k)
          {
            if (*(void *)v24 != v21) {
              objc_enumerationMutation(v18);
            }
            [*(id *)(*((void *)&v23 + 1) + 8 * k) recursivelyPerformSelector:sel_setNeedsDisplay];
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v23 objects:v35 count:16];
        }
        while (v20);
      }
    }
    [(TSDInteractiveCanvasController *)self invalidateReps];
  }
}

- (void)setAllowLayoutAndRenderOnThread:(BOOL)a3
{
  BOOL v3 = a3;
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    BOOL v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSDInteractiveCanvasController setAllowLayoutAndRenderOnThread:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 1801, @"should only en/disable layoutAndRenderOnThreadDuringScroll from the MT");
  }
  if (self->mLayoutAndRenderOnThreadDuringScroll != v3)
  {
    if (self->mLayoutAndRenderOnThreadDuringScroll && self->mCurrentlyWaitingOnThreadedLayoutAndRender) {
      [(TSDInteractiveCanvasController *)self i_syncWithLayoutThread];
    }
    self->mLayoutAndRenderOnThreadDuringScroll = v3;
  }
}

- (void)setStaticLayoutAndRenderOnThread:(BOOL)a3
{
  if (self->mStaticLayoutAndRenderOnThread != a3)
  {
    if (self->mLayoutAndRenderOnThreadDuringScroll && self->mCurrentlyWaitingOnThreadedLayoutAndRender) {
      [(TSDInteractiveCanvasController *)self i_syncWithLayoutThread];
    }
    self->mStaticLayoutAndRenderOnThread = a3;
  }
}

- (BOOL)p_currentlyScrolling
{
  return [(TSDInteractiveCanvasController *)self p_currentlyScrollingIncludeEmbeddedCanvasScrolling:1];
}

- (BOOL)p_currentlyScrollingIncludeEmbeddedCanvasScrolling:(BOOL)a3
{
  if (self->mCurrentlyScrolling || !a3)
  {
    if (self->mCurrentlyScrolling) {
      return 1;
    }
  }
  else if (self->mEmbeddedCanvasScrolling)
  {
    return 1;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  mDelegate = self->mDelegate;
  return [(TSDInteractiveCanvasControllerDelegate *)mDelegate interactiveCanvasControllerIsRelatedCanvasScrolling:self];
}

- (BOOL)keyboardSuppressedAndTextInputEditorIgnoresFirstResponderChanges
{
  return self->mSuppressingKeyboard;
}

- (void)setKeyboardSuppressedAndTextInputEditorIgnoresFirstResponderChanges:(BOOL)a3
{
  if (a3)
  {
    [(TSDTextInputResponder *)self->mTextInputResponder clearEditorAndResignFirstResponder];
    BOOL v4 = 1;
  }
  else
  {
    id v5 = [(TSDEditorController *)[(TSDInteractiveCanvasController *)self editorController] textInputEditor];
    if ([v5 conformsToProtocol:&unk_26D78F478]) {
      [(TSDTextInputResponder *)self->mTextInputResponder setEditor:v5];
    }
    BOOL v4 = 0;
  }
  self->mSuppressingKeyboard = v4;
}

- (void)reuseTextInputResponderFrom:(id)a3
{
  if (!*((void *)a3 + 14)) {
    *((void *)a3 + 14) = objc_msgSend(objc_alloc((Class)TSDTextInputResponderClass()), "initWithNextResponder:", objc_msgSend((id)objc_msgSend(a3, "layerHost"), "canvasView"));
  }
  if ([(TSDTextInputResponder *)self->mTextInputResponder isFirstResponder])
  {
    id v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSDInteractiveCanvasController reuseTextInputResponderFrom:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 1888, @"Unexpected -reuseTextInputResponderFrom: when first responder.");
  }
  if ([(TSDTextInputResponder *)self->mTextInputResponder isFirstResponder])
  {
    objc_msgSend(*((id *)a3 + 14), "setEditor:", -[TSDTextInputResponder editor](self->mTextInputResponder, "editor"));
    [*((id *)a3 + 14) cancelDelayedResponderChange];
    [*((id *)a3 + 14) becomeFirstResponder];
  }

  self->mTextInputResponder = (TSDTextInputResponder *)*((id *)a3 + 14);
  self->mTextInputResponderSource = (TSDInteractiveCanvasController *)a3;
  ++*((void *)a3 + 16);
}

- (void)resumeEditing
{
  double v2 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"-[TSDInteractiveCanvasController resumeEditing]"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 1905, @"Abstract method");
  objc_exception_throw((id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498], objc_msgSend(NSString, "stringWithFormat:", @"%@: %s", @"Abstract method", "-[TSDInteractiveCanvasController resumeEditing]"), 0 reason userInfo]);
}

- (void)p_editorControllerDidChangeTextInputEditor:(id)a3
{
  BOOL v4 = __77__TSDInteractiveCanvasController_p_editorControllerDidChangeTextInputEditor___block_invoke;
  id v5 = &unk_2646B0750;
  id v6 = a3;
  id v7 = self;
  if (objc_msgSend(MEMORY[0x263F08B88], "isMainThread", MEMORY[0x263EF8330], 3221225472)) {
    v4((uint64_t)&v3);
  }
  else {
    dispatch_async(MEMORY[0x263EF83A0], &v3);
  }
}

uint64_t __77__TSDInteractiveCanvasController_p_editorControllerDidChangeTextInputEditor___block_invoke(uint64_t a1)
{
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "object"), "textInputEditor");
  uint64_t v2 = TSUProtocolCast();
  if (v2 && !*(void *)(*(void *)(a1 + 40) + 112)) {
    *(void *)(*(void *)(a1 + 40) + 112) = objc_msgSend(objc_alloc((Class)TSDTextInputResponderClass()), "initWithNextResponder:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "layerHost"), "canvasView"));
  }
  uint64_t v3 = *(void **)(a1 + 40);
  return objc_msgSend(v3, "p_maybeSetTextResponderEditorTo:", v2);
}

- (BOOL)p_shouldSuppressAutozoomForEditor:(id)a3
{
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ![(TSDInteractiveCanvasControllerDelegate *)self->mDelegate interactiveCanvasControllerSupportsAutozoom:self]|| (objc_opt_respondsToSelector() & 1) == 0)
  {
    return 0;
  }
  return [a3 suppressAutozoom];
}

- (void)p_editorControllerSelectionDidChange:(id)a3
{
  BOOL v4 = (void *)[a3 userInfo];
  uint64_t v5 = [v4 objectForKey:@"TSDEditorControllerEditorKey"];
  uint64_t v6 = objc_msgSend((id)objc_msgSend(v4, "objectForKey:", @"TSDEditorControllerSelectionFlagsKey"), "unsignedIntegerValue");
  [(TSDInteractiveCanvasController *)self p_editorDidChangeSelection:v5 withSelectionFlags:v6];
  if (!self->mTextGesturesInFlight)
  {
    [(TSDInteractiveCanvasController *)self p_editorDoneChangingSelection:v5 withFlags:v6];
    if ((v6 & 0x40) != 0 && !self->mShouldAutoscrollToSelectionAfterLayout)
    {
      self->mShouldAnimateAutoscroll = (v6 & 0x10) != 0;
      [(TSDInteractiveCanvasController *)self scrollToPrimarySelectionForEditor:v5];
    }
  }
}

- (void)p_editorControllerSelectionDidChangeAndWantsKeyboard:(id)a3
{
  BOOL v4 = (void *)[a3 userInfo];
  uint64_t v5 = [v4 objectForKey:@"TSDEditorControllerEditorKey"];
  -[TSDInteractiveCanvasController p_editorDidChangeSelection:withSelectionFlags:](self, "p_editorDidChangeSelection:withSelectionFlags:", v5, objc_msgSend((id)objc_msgSend(v4, "objectForKey:", @"TSDEditorControllerSelectionFlagsKey"), "unsignedIntegerValue"));
  [(TSDInteractiveCanvasController *)self p_editorDoneChangingSelection:v5];
}

- (TSDCanvasView)canvasView
{
  uint64_t v2 = [(TSDInteractiveCanvasController *)self layerHost];
  return (TSDCanvasView *)[(TSDCanvasLayerHosting *)v2 canvasView];
}

- (BOOL)canvasViewShouldBecomeFirstResponder:(id)a3
{
  [(TSDInteractiveCanvasController *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 1;
  }
  BOOL v4 = [(TSDInteractiveCanvasController *)self delegate];
  uint64_t v5 = [(TSDInteractiveCanvasController *)self canvasView];
  return [(TSDInteractiveCanvasControllerDelegate *)v4 interactiveCanvasController:self canvasViewShouldBecomeFirstResponder:v5];
}

- (TSDCanvasLayer)canvasLayer
{
  uint64_t v2 = [(TSDInteractiveCanvasController *)self layerHost];
  return (TSDCanvasLayer *)[(TSDCanvasLayerHosting *)v2 canvasLayer];
}

+ (id)keyPathsForValuesAffectingViewScale
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:@"layerHost.canvasLayer.viewScale"];
}

- (double)defaultViewScale
{
  return 0.0;
}

- (double)viewScale
{
  uint64_t v2 = (void *)[(TSDCanvasLayerHosting *)[(TSDInteractiveCanvasController *)self layerHost] canvasLayer];
  [v2 viewScale];
  return result;
}

- (void)setViewScale:(double)a3
{
  BOOL v4 = (void *)[(TSDCanvasLayerHosting *)[(TSDInteractiveCanvasController *)self layerHost] canvasLayer];
  [v4 setViewScale:a3];
}

+ (id)keyPathsForValuesAffectingCurrentViewScale
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:@"layerHost.canvasLayer.viewScale"];
}

- (double)currentViewScale
{
  if (self->mDynamicallyZooming) {
    return self->mDynamicViewScale;
  }
  uint64_t v3 = (void *)[(TSDCanvasLayerHosting *)[(TSDInteractiveCanvasController *)self layerHost] canvasLayer];
  [v3 viewScale];
  return result;
}

- (double)fitWidthViewScale
{
  uint64_t v3 = (void *)[(TSDCanvasLayerHosting *)[(TSDInteractiveCanvasController *)self layerHost] canvasLayer];
  [(TSDInteractiveCanvasController *)self visibleBoundsRect];
  [(TSDCanvas *)self->mCanvas unscaledSize];
  [v3 minimumPinchViewScale];
  [v3 maximumPinchViewScale];
  TSUClamp();
  return result;
}

- (CGSize)canvasScrollingOutset
{
  double v2 = 600.0;
  double v3 = 600.0;
  result.CGFloat height = v3;
  result.CGFloat width = v2;
  return result;
}

- (BOOL)shouldResizeCanvasToScrollView
{
  if (!self->mDelegate || (objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  mDelegate = self->mDelegate;
  return [(TSDInteractiveCanvasControllerDelegate *)mDelegate shouldResizeCanvasToScrollView];
}

- (CGRect)canvasViewBoundsWithBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (objc_opt_respondsToSelector())
  {
    -[TSDInteractiveCanvasControllerDelegate interactiveCanvasController:canvasViewBoundsWithBounds:](self->mDelegate, "interactiveCanvasController:canvasViewBoundsWithBounds:", self, x, y, width, height);
    double x = v8;
    double y = v9;
    double width = v10;
    double height = v11;
  }
  double v12 = x;
  double v13 = y;
  double v14 = width;
  double v15 = height;
  result.size.double height = v15;
  result.size.double width = v14;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

- (void)setViewScale:(double)a3 contentOffset:(CGPoint)a4 clampOffset:(BOOL)a5 animated:(BOOL)a6
{
  BOOL v6 = a5;
  double y = a4.y;
  double x = a4.x;
  double v11 = 0.0;
  if (a6)
  {
    if (objc_opt_respondsToSelector())
    {
      [(TSDInteractiveCanvasControllerDelegate *)self->mDelegate autoZoomAnimationDurationForInteractiveCanvasController:self];
      double v11 = v12;
    }
    else
    {
      double v11 = 0.300000012;
    }
  }
  -[TSDInteractiveCanvasController setViewScale:contentOffset:clampOffset:animationDuration:completion:](self, "setViewScale:contentOffset:clampOffset:animationDuration:completion:", v6, 0, a3, x, y, v11);
}

- (void)setViewScale:(double)a3 contentOffset:(CGPoint)a4 clampOffset:(BOOL)a5 animationDuration:(double)a6 completion:(id)a7
{
}

- (void)setViewScale:(double)a3 contentOffset:(CGPoint)a4 clampOffset:(BOOL)a5 animationDuration:(double)a6 forceAnimation:(BOOL)a7 completion:(id)a8
{
  BOOL v9 = a7;
  double x = a4.x;
  if (a5)
  {
    -[TSDInteractiveCanvasController clampedUnscaledContentOffset:forViewScale:](self, "clampedUnscaledContentOffset:forViewScale:", a4.x, a4.y, a3);
    double x = v14;
    a4.double y = v15;
  }
  if (a6 == 0.0)
  {
    -[TSDInteractiveCanvasController p_applyViewScale:andContentOffset:](self, "p_applyViewScale:andContentOffset:", a3, x, a4.y);
    if (a8)
    {
      id v16 = (void (*)(id, uint64_t))*((void *)a8 + 2);
      v16(a8, 1);
    }
  }
  else
  {
    -[TSDInteractiveCanvasController animateToViewScale:contentOffset:duration:forceAnimation:completion:](self, "animateToViewScale:contentOffset:duration:forceAnimation:completion:", v9, a8, a3, x, a4.y, a6);
  }
}

- (CGPoint)clampedUnscaledContentOffset:(CGPoint)a3 forViewScale:(double)a4
{
  double y = a3.y;
  double x = a3.x;
  objc_msgSend((id)-[TSDCanvasLayerHosting clippingLayer](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "clippingLayer"), "bounds");
  -[TSDInteractiveCanvasController clampedUnscaledContentOffset:forViewScale:scrollViewBoundsSize:](self, "clampedUnscaledContentOffset:forViewScale:scrollViewBoundsSize:", x, y, a4, v8, v9);
  result.double y = v11;
  result.double x = v10;
  return result;
}

- (CGPoint)clampedUnscaledContentOffset:(CGPoint)a3 forViewScale:(double)a4 scrollViewBoundsSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  double v9 = (void *)[(TSDCanvasLayerHosting *)[(TSDInteractiveCanvasController *)self layerHost] canvasLayer];
  TSDMultiplySizeScalar(width, height, 1.0 / a4);
  [v9 unscaledSize];
  [v9 contentInset];
  TSUClamp();
  double v11 = v10;
  TSUClamp();
  double v13 = v12;
  if (objc_opt_respondsToSelector())
  {
    -[TSDInteractiveCanvasControllerDelegate interactiveCanvasController:clampContentOffset:forViewScale:scrollViewBoundsSize:](self->mDelegate, "interactiveCanvasController:clampContentOffset:forViewScale:scrollViewBoundsSize:", self, TSDMultiplyPointScalar(v11, v13, a4));
LABEL_5:
    double v11 = TSDMultiplyPointScalar(v14, v15, 1.0 / a4);
    double v13 = v16;
    goto LABEL_6;
  }
  if (objc_opt_respondsToSelector())
  {
    -[TSDInteractiveCanvasControllerDelegate interactiveCanvasController:clampContentOffset:forViewScale:](self->mDelegate, "interactiveCanvasController:clampContentOffset:forViewScale:", self, TSDMultiplyPointScalar(v11, v13, a4));
    goto LABEL_5;
  }
LABEL_6:
  double v17 = v11;
  double v18 = v13;
  result.double y = v18;
  result.double x = v17;
  return result;
}

- (void)setViewScale:(double)a3 andScrollViewFrame:(CGRect)a4 maintainPosition:(BOOL)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v13 = (void *)[(TSDCanvasLayerHosting *)[(TSDInteractiveCanvasController *)self layerHost] canvasLayer];
  objc_msgSend(v13, "setViewScale:andScrollViewFrame:maintainPosition:animated:", v7, v6, a3, x, y, width, height);
}

- (void)setViewScale:(double)a3 andScrollViewFrame:(CGRect)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  [(TSDInteractiveCanvasController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    uint64_t v12 = [(TSDInteractiveCanvasControllerDelegate *)[(TSDInteractiveCanvasController *)self delegate] interactiveCanvasControllerShouldMaintainPositionOnSetViewScale:self];
  }
  else {
    uint64_t v12 = 1;
  }
  double v13 = (void *)[(TSDCanvasLayerHosting *)[(TSDInteractiveCanvasController *)self layerHost] canvasLayer];
  objc_msgSend(v13, "setViewScale:andScrollViewFrame:maintainPosition:animated:", v12, v5, a3, x, y, width, height);
}

- (CGRect)unobscuredFrameOfView:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  if (!a3)
  {
    BOOL v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSDInteractiveCanvasController unobscuredFrameOfView:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 2159, @"Cannot calculate unobscured frame without view");
  }
  [a3 frame];
  double v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  double v15 = (void *)[MEMORY[0x263EFF980] array];
  [(TSDInteractiveCanvasController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v15, "addObjectsFromArray:", -[TSDInteractiveCanvasControllerDelegate rectanglesObscuringView:](-[TSDInteractiveCanvasController delegate](self, "delegate"), "rectanglesObscuringView:", a3));
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v32 != v18) {
          objc_enumerationMutation(v15);
        }
        [*(id *)(*((void *)&v31 + 1) + 8 * i) CGRectValue];
        double v8 = TSDRectSubtractingRect(v8, v10, v12, v14, v20, v21, v22, v23);
        CGFloat v10 = v24;
        CGFloat v12 = v25;
        CGFloat v14 = v26;
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v17);
  }
  double v27 = v8;
  double v28 = v10;
  double v29 = v12;
  double v30 = v14;
  result.size.double height = v30;
  result.size.double width = v29;
  result.origin.double y = v28;
  result.origin.double x = v27;
  return result;
}

- (BOOL)wantsUpdatedScrollIndicatorInsets
{
  return 1;
}

- (void)unobscuredFrameDidChange
{
  double v3 = [(TSDCanvasView *)[(TSDInteractiveCanvasController *)self canvasView] enclosingScrollView];
  if (v3)
  {
    BOOL v4 = v3;
    [(TSDInteractiveCanvasController *)self unobscuredFrameOfView:v3];
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    -[TSDInteractiveCanvasController setUnobscuredScrollViewFrame:](self, "setUnobscuredScrollViewFrame:");
    if ([(TSDInteractiveCanvasController *)self wantsUpdatedScrollIndicatorInsets])
    {
      [(TSKScrollView *)v4 frame];
      CGFloat v14 = v13;
      CGFloat v16 = v15;
      CGFloat v18 = v17;
      CGFloat v20 = v19;
      v30.origin.double x = v6;
      v30.origin.double y = v8;
      v30.size.double width = v10;
      v30.size.double height = v12;
      double MinY = CGRectGetMinY(v30);
      v31.origin.double x = v14;
      v31.origin.double y = v16;
      v31.size.double width = v18;
      v31.size.double height = v20;
      double v28 = MinY - CGRectGetMinY(v31);
      v32.origin.double x = v6;
      v32.origin.double y = v8;
      v32.size.double width = v10;
      v32.size.double height = v12;
      double MinX = CGRectGetMinX(v32);
      v33.origin.double x = v14;
      v33.origin.double y = v16;
      v33.size.double width = v18;
      v33.size.double height = v20;
      double v26 = MinX - CGRectGetMinX(v33);
      v34.origin.double x = v14;
      v34.origin.double y = v16;
      v34.size.double width = v18;
      v34.size.double height = v20;
      double MaxY = CGRectGetMaxY(v34);
      v35.origin.double x = v6;
      v35.origin.double y = v8;
      v35.size.double width = v10;
      v35.size.double height = v12;
      double v24 = MaxY - CGRectGetMaxY(v35);
      v36.origin.double x = v14;
      v36.origin.double y = v16;
      v36.size.double width = v18;
      v36.size.double height = v20;
      double MaxX = CGRectGetMaxX(v36);
      v37.origin.double x = v6;
      v37.origin.double y = v8;
      v37.size.double width = v10;
      v37.size.double height = v12;
      double v22 = MaxX - CGRectGetMaxX(v37);
      -[TSKScrollView setContentInset:](v4, "setContentInset:", v28, v26, v24, v22);
      -[TSKScrollView setScrollIndicatorInsets:](v4, "setScrollIndicatorInsets:", v28, v26, v24, v22);
    }
  }
}

- (CGRect)unobscuredScrollViewFrame
{
  if (CGRectEqualToRect(self->mUnobscuredScrollViewFrame, *MEMORY[0x263F001A8]))
  {
    [(TSKScrollView *)[(TSDCanvasView *)[(TSDInteractiveCanvasController *)self canvasView] enclosingScrollView] frame];
  }
  else
  {
    double x = self->mUnobscuredScrollViewFrame.origin.x;
    double y = self->mUnobscuredScrollViewFrame.origin.y;
    double width = self->mUnobscuredScrollViewFrame.size.width;
    double height = self->mUnobscuredScrollViewFrame.size.height;
  }
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)scrollRectToVisible:(CGRect)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  CGFloat v6 = (void *)[(TSDCanvasLayerHosting *)[(TSDInteractiveCanvasController *)self layerHost] canvasLayer];
  [v6 contentInset];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  if (v9 == 0.0 && v7 == 0.0)
  {
    double v15 = *MEMORY[0x263F001A8];
    double v16 = *(double *)(MEMORY[0x263F001A8] + 8);
  }
  else
  {
    [v6 bounds];
    double v18 = v17;
    [(TSDInteractiveCanvasController *)self viewScale];
    double v15 = v18 / v19;
    [v6 bounds];
    double v21 = v20;
    [(TSDInteractiveCanvasController *)self viewScale];
    double v16 = v21 / v22;
  }
  [v6 unscaledSize];
  double v24 = v23;
  double v26 = v25;
  [(TSDInteractiveCanvasController *)self viewScale];
  CGFloat v28 = v26 - (v8 + v12) / v27;
  [(TSDInteractiveCanvasController *)self viewScale];
  v179.size.double width = v24 - (v10 + v14) / v29;
  v179.origin.double x = v15;
  v179.origin.double y = v16;
  v179.size.double height = v28;
  CGRect v131 = CGRectIntersection(a3, v179);
  double x = v131.origin.x;
  double y = v131.origin.y;
  double width = v131.size.width;
  double height = v131.size.height;
  if (CGRectIsEmpty(v131)) {
    return;
  }
  -[TSDInteractiveCanvasController convertUnscaledToBoundsRect:](self, "convertUnscaledToBoundsRect:", x, y, width, height);
  double v35 = v34;
  double v37 = v36;
  double v39 = v38;
  double v41 = v40;
  v42 = (void *)[(TSDCanvasLayerHosting *)[(TSDInteractiveCanvasController *)self layerHost] canvasView];
  v43 = (void *)[v42 enclosingScrollView];
  objc_msgSend(v42, "convertRect:toView:", objc_msgSend(v43, "contentView"), v35, v37, v39, v41);
  double v45 = v44;
  CGFloat v47 = v46;
  CGFloat v49 = v48;
  CGFloat v51 = v50;
  [(TSDCanvas *)[(TSDInteractiveCanvasController *)self canvas] contentsScale];
  double rect_8 = TSDRoundedRectForScale(v45, v47, v49, v51, v52);
  CGFloat v54 = v53;
  CGFloat v56 = v55;
  CGFloat v58 = v57;
  *(double *)&uint64_t v59 = 0.0;
  CGFloat v124 = v57;
  if (v4)
  {
    if (objc_opt_respondsToSelector()) {
      [(TSDInteractiveCanvasControllerDelegate *)self->mDelegate autoZoomAnimationDurationForInteractiveCanvasController:self];
    }
    else {
      *(double *)&uint64_t v59 = 0.300000012;
    }
    CGFloat v58 = v124;
  }
  double v122 = *(double *)&v59;
  [(TSDInteractiveCanvasController *)self unobscuredScrollViewFrame];
  objc_msgSend((id)objc_msgSend(v43, "contentView"), "convertRect:fromView:", objc_msgSend(v43, "superview"), v60, v61, v62, v63);
  CGFloat v65 = v64;
  CGFloat v67 = v66;
  CGFloat v69 = v68;
  CGFloat v71 = v70;
  [v43 contentOffset];
  double v73 = v72;
  double v123 = v74;
  CGFloat rect = v65;
  v132.origin.double x = v65;
  v132.origin.double y = v67;
  v132.size.double width = v69;
  v132.size.double height = v71;
  double MaxX = CGRectGetMaxX(v132);
  v133.origin.double x = rect_8;
  v133.origin.double y = v54;
  v133.size.double width = v56;
  v133.size.double height = v58;
  double v126 = v73;
  CGFloat v127 = v71;
  if (MaxX <= CGRectGetMaxX(v133)) {
    goto LABEL_15;
  }
  v134.origin.double x = rect;
  v134.origin.double y = v67;
  v134.size.double width = v69;
  v134.size.double height = v71;
  double MinX = CGRectGetMinX(v134);
  v135.origin.double x = rect_8;
  v135.origin.double y = v54;
  v135.size.double width = v56;
  v135.size.double height = v58;
  if (MinX <= CGRectGetMinX(v135))
  {
LABEL_15:
    v142.origin.double x = rect;
    v142.origin.double y = v67;
    v142.size.double width = v69;
    v142.size.double height = v71;
    double v80 = CGRectGetMinX(v142);
    v143.origin.double x = rect_8;
    v143.origin.double y = v54;
    v143.size.double width = v56;
    v143.size.double height = v58;
    if (v80 >= CGRectGetMinX(v143))
    {
      CGFloat v83 = rect;
      CGFloat v78 = rect_8;
      CGFloat v82 = v71;
      goto LABEL_25;
    }
    v144.origin.double x = rect;
    v144.origin.double y = v67;
    v144.size.double width = v69;
    v144.size.double height = v71;
    double v115 = CGRectGetMaxX(v144);
    CGFloat v78 = rect_8;
    v145.origin.double x = rect_8;
    v145.origin.double y = v54;
    v145.size.double width = v56;
    v145.size.double height = v58;
    CGFloat v81 = CGRectGetMaxX(v145);
    CGFloat v82 = v71;
    CGFloat v83 = rect;
    if (v115 >= v81) {
      goto LABEL_25;
    }
    v146.origin.double x = rect_8;
    v146.origin.double y = v54;
    v146.size.double width = v56;
    v146.size.double height = v124;
    double v116 = CGRectGetMinX(v146);
    v147.origin.double x = rect;
    v147.origin.double y = v67;
    v147.size.double width = v69;
    v147.size.double height = v71;
    double v117 = v116 - CGRectGetMinX(v147);
    v148.origin.double x = rect_8;
    CGFloat v84 = v54;
    v148.origin.double y = v54;
    double v85 = v56;
    v148.size.double width = v56;
    v148.size.double height = v124;
    double v86 = CGRectGetMaxX(v148);
    v149.origin.double x = rect;
    CGFloat v109 = v67;
    CGFloat v110 = v69;
    v149.origin.double y = v67;
    v149.size.double width = v69;
    v149.size.double height = v71;
    if (v117 >= v86 - CGRectGetMaxX(v149))
    {
      double v87 = rect_8;
      v154.origin.double x = rect_8;
      v154.origin.double y = v84;
      v154.size.double width = v56;
      v154.size.double height = v124;
      double v88 = CGRectGetMaxX(v154);
      CGFloat v89 = v71;
      CGFloat v83 = rect;
      v155.origin.double x = rect;
      double v90 = v67;
      double v91 = v110;
      v155.origin.double y = v109;
      v155.size.double width = v110;
      v155.size.double height = v127;
      double v92 = CGRectGetMaxX(v155);
    }
    else
    {
      double v87 = rect_8;
      v150.origin.double x = rect_8;
      v150.origin.double y = v84;
      v150.size.double width = v56;
      v150.size.double height = v124;
      double v88 = CGRectGetMinX(v150);
      CGFloat v89 = v71;
      CGFloat v83 = rect;
      v151.origin.double x = rect;
      double v90 = v67;
      double v91 = v110;
      v151.origin.double y = v109;
      v151.size.double width = v110;
      v151.size.double height = v127;
      double v92 = CGRectGetMinX(v151);
    }
    double v94 = v88 - v92;
    CGFloat v56 = v85;
    CGFloat v54 = v84;
    CGFloat v78 = v87;
    CGFloat v82 = v89;
    CGFloat v69 = v91;
    CGFloat v67 = v90;
    double v93 = v126 + v94;
  }
  else
  {
    v136.origin.double x = rect;
    v136.origin.double y = v67;
    v136.size.double width = v69;
    v136.size.double height = v71;
    double v112 = CGRectGetMaxX(v136);
    v137.origin.double x = rect_8;
    v137.origin.double y = v54;
    v137.size.double width = v56;
    v137.size.double height = v58;
    double v113 = v112 - CGRectGetMaxX(v137);
    v138.origin.double x = rect;
    v138.origin.double y = v67;
    v138.size.double width = v69;
    v138.size.double height = v71;
    double v77 = CGRectGetMinX(v138);
    v139.origin.double x = rect_8;
    v139.origin.double y = v54;
    v139.size.double width = v56;
    v139.size.double height = v58;
    if (v113 >= v77 - CGRectGetMinX(v139))
    {
      v152.origin.double x = rect;
      v152.origin.double y = v67;
      v152.size.double width = v69;
      v152.size.double height = v71;
      double v114 = CGRectGetMinX(v152);
      CGFloat v78 = rect_8;
      v153.origin.double x = rect_8;
      v153.origin.double y = v54;
      v153.size.double width = v56;
      v153.size.double height = v58;
      double v79 = CGRectGetMinX(v153);
    }
    else
    {
      v140.origin.double x = rect;
      v140.origin.double y = v67;
      v140.size.double width = v69;
      v140.size.double height = v71;
      double v114 = CGRectGetMaxX(v140);
      CGFloat v78 = rect_8;
      v141.origin.double x = rect_8;
      v141.origin.double y = v54;
      v141.size.double width = v56;
      v141.size.double height = v58;
      double v79 = CGRectGetMaxX(v141);
    }
    CGFloat v82 = v71;
    CGFloat v83 = rect;
    double v93 = v126 - (v114 - v79);
  }
  double v126 = v93;
LABEL_25:
  CGFloat v95 = v83;
  CGFloat v96 = v67;
  CGFloat v97 = v69;
  double MaxY = CGRectGetMaxY(*(CGRect *)(&v82 - 3));
  v156.origin.double x = v78;
  v156.origin.double y = v54;
  v156.size.double width = v56;
  v156.size.double height = v124;
  if (MaxY <= CGRectGetMaxY(v156)) {
    goto LABEL_29;
  }
  v157.origin.double x = v83;
  v157.origin.double y = v67;
  v157.size.double width = v69;
  v157.size.double height = v127;
  double MinY = CGRectGetMinY(v157);
  v158.origin.double x = v78;
  v158.origin.double y = v54;
  v158.size.double width = v56;
  v158.size.double height = v124;
  if (MinY <= CGRectGetMinY(v158))
  {
LABEL_29:
    v165.origin.double x = v83;
    v165.origin.double y = v67;
    v165.size.double width = v69;
    v165.size.double height = v127;
    double v103 = CGRectGetMinY(v165);
    v166.origin.double x = v78;
    v166.origin.double y = v54;
    v166.size.double width = v56;
    v166.size.double height = v124;
    if (v103 >= CGRectGetMinY(v166))
    {
      double v106 = v123;
    }
    else
    {
      v167.origin.double x = v83;
      v167.origin.double y = v67;
      v167.size.double width = v69;
      v167.size.double height = v127;
      double v104 = CGRectGetMaxY(v167);
      v168.origin.double x = v78;
      v168.origin.double y = v54;
      v168.size.double width = v56;
      v168.size.double height = v124;
      CGFloat v105 = CGRectGetMaxY(v168);
      double v106 = v123;
      if (v104 < v105)
      {
        v169.origin.double x = v78;
        v169.origin.double y = v54;
        v169.size.double width = v56;
        v169.size.double height = v124;
        double v120 = CGRectGetMinY(v169);
        v170.origin.double x = v83;
        v170.origin.double y = v67;
        v170.size.double width = v69;
        v170.size.double height = v127;
        double v121 = v120 - CGRectGetMinY(v170);
        v171.origin.double x = v78;
        v171.origin.double y = v54;
        v171.size.double width = v56;
        v171.size.double height = v124;
        double v111 = CGRectGetMaxY(v171);
        v172.origin.double x = v83;
        v172.origin.double y = v67;
        v172.size.double width = v69;
        v172.size.double height = v127;
        if (v121 >= v111 - CGRectGetMaxY(v172))
        {
          v177.origin.double x = v78;
          v177.origin.double y = v54;
          v177.size.double width = v56;
          v177.size.double height = v124;
          double v107 = CGRectGetMaxY(v177);
          v178.origin.double x = v83;
          v178.origin.double y = v67;
          v178.size.double width = v69;
          v178.size.double height = v127;
          double v108 = CGRectGetMaxY(v178);
        }
        else
        {
          v173.origin.double x = v78;
          v173.origin.double y = v54;
          v173.size.double width = v56;
          v173.size.double height = v124;
          double v107 = CGRectGetMinY(v173);
          v174.origin.double x = v83;
          v174.origin.double y = v67;
          v174.size.double width = v69;
          v174.size.double height = v127;
          double v108 = CGRectGetMinY(v174);
        }
        double v106 = v123 + v107 - v108;
      }
    }
  }
  else
  {
    v159.origin.double x = v83;
    v159.origin.double y = v67;
    v159.size.double width = v69;
    v159.size.double height = v127;
    double v118 = CGRectGetMaxY(v159);
    v160.origin.double x = v78;
    v160.origin.double y = v54;
    v160.size.double width = v56;
    v160.size.double height = v124;
    double v119 = v118 - CGRectGetMaxY(v160);
    v161.origin.double x = v83;
    v161.origin.double y = v67;
    v161.size.double width = v69;
    v161.size.double height = v127;
    double v100 = CGRectGetMinY(v161);
    v162.origin.double x = v78;
    v162.origin.double y = v54;
    v162.size.double width = v56;
    v162.size.double height = v124;
    if (v119 >= v100 - CGRectGetMinY(v162))
    {
      v175.origin.double x = v83;
      v175.origin.double y = v67;
      v175.size.double width = v69;
      v175.size.double height = v127;
      double v101 = CGRectGetMinY(v175);
      v176.origin.double x = v78;
      v176.origin.double y = v54;
      v176.size.double width = v56;
      v176.size.double height = v124;
      double v102 = CGRectGetMinY(v176);
    }
    else
    {
      v163.origin.double x = v83;
      v163.origin.double y = v67;
      v163.size.double width = v69;
      v163.size.double height = v127;
      double v101 = CGRectGetMaxY(v163);
      v164.origin.double x = v78;
      v164.origin.double y = v54;
      v164.size.double width = v56;
      v164.size.double height = v124;
      double v102 = CGRectGetMaxY(v164);
    }
    double v106 = v123 - (v101 - v102);
  }
  objc_msgSend(v43, "setContentOffset:animated:", v122 > 0.0, v126, v106);
}

- (void)scrollRectToVisibleCenter:(CGRect)a3 animated:(BOOL)a4 onlyScrollNecessaryAxes:(BOOL)a5
{
  int v5 = a5;
  BOOL v6 = a4;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(TSDInteractiveCanvasController *)self visibleUnscaledRectForScrollingAutomatically];
  double v13 = v12;
  double v15 = v14;
  CGFloat v17 = v16;
  double v42 = v18;
  [(TSDInteractiveCanvasController *)self visibleUnscaledRect];
  double v41 = v19;
  double v39 = v20;
  double v40 = TSDSubtractPoints(v13, v15, v21);
  double v38 = v22;
  v46.origin.CGFloat x = x;
  v46.origin.CGFloat y = y;
  v46.size.CGFloat width = width;
  v46.size.CGFloat height = height;
  double MinY = CGRectGetMinY(v46);
  v47.origin.CGFloat x = v13;
  v47.origin.CGFloat y = v15;
  v47.size.CGFloat width = v17;
  v47.size.CGFloat height = v42;
  if (MinY >= CGRectGetMinY(v47))
  {
    v48.origin.CGFloat x = x;
    v48.origin.CGFloat y = y;
    v48.size.CGFloat width = width;
    v48.size.CGFloat height = height;
    double MaxY = CGRectGetMaxY(v48);
    v49.origin.CGFloat x = v13;
    v49.origin.CGFloat y = v15;
    v49.size.CGFloat width = v17;
    v49.size.CGFloat height = v42;
    BOOL v24 = MaxY > CGRectGetMaxY(v49);
  }
  else
  {
    BOOL v24 = 1;
  }
  v50.origin.CGFloat x = x;
  v50.origin.CGFloat y = y;
  v50.size.CGFloat width = width;
  v50.size.CGFloat height = height;
  double MinX = CGRectGetMinX(v50);
  v51.origin.CGFloat x = v13;
  v51.origin.CGFloat y = v15;
  v51.size.CGFloat width = v17;
  v51.size.CGFloat height = v42;
  CGFloat v44 = width;
  CGFloat v43 = x;
  if (MinX >= CGRectGetMinX(v51))
  {
    v52.origin.CGFloat x = x;
    v52.origin.CGFloat y = y;
    v52.size.CGFloat width = width;
    double v27 = height;
    v52.size.CGFloat height = height;
    double MaxX = CGRectGetMaxX(v52);
    v53.origin.CGFloat x = v13;
    v53.origin.CGFloat y = v15;
    double v29 = v17;
    v53.size.CGFloat width = v17;
    v53.size.CGFloat height = v42;
    BOOL v28 = MaxX > CGRectGetMaxX(v53);
  }
  else
  {
    double v27 = height;
    BOOL v28 = 1;
    double v29 = v17;
  }
  int v31 = (v24 || v28) & ~v5;
  int v32 = v31 | v28;
  if ((v31 | v24) != 1)
  {
    double v36 = y;
    double v34 = width;
    double v33 = v43;
    if (!v32) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  double v33 = v43;
  v54.origin.CGFloat y = y;
  v54.origin.CGFloat x = v43;
  double v34 = v44;
  v54.size.CGFloat width = v44;
  v54.size.CGFloat height = v27;
  float MidY = CGRectGetMidY(v54);
  double v27 = v39;
  double v36 = MidY + v42 * -0.5 - v38;
  if (v32)
  {
LABEL_11:
    v55.origin.CGFloat x = v33;
    v55.origin.CGFloat y = v36;
    v55.size.CGFloat width = v34;
    v55.size.CGFloat height = v27;
    float MidX = CGRectGetMidX(v55);
    double v34 = v41;
    double v33 = MidX + v29 * -0.5 - v40;
  }
LABEL_12:
  -[TSDInteractiveCanvasController scrollRectToVisible:animated:](self, "scrollRectToVisible:animated:", v6, v33, v36, v34, v27);
}

- (void)scrollRectToVisibleWithSelectionOutset:(CGRect)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  -[TSDInteractiveCanvasController p_outsetSelectionRect:](self, "p_outsetSelectionRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[TSDInteractiveCanvasController scrollRectToVisible:animated:](self, "scrollRectToVisible:animated:", v4);
}

- (void)setContentOffset:(CGPoint)a3 animated:(BOOL)a4
{
}

- (void)setContentOffset:(CGPoint)a3 clamp:(BOOL)a4 animated:(BOOL)a5
{
}

- (void)setContentOffset:(CGPoint)a3 clamp:(BOOL)a4 animated:(BOOL)a5 completionBlock:(id)a6
{
  BOOL v7 = a5;
  double y = a3.y;
  double x = a3.x;
  if (a4)
  {
    [(TSDInteractiveCanvasController *)self viewScale];
    -[TSDInteractiveCanvasController clampedUnscaledContentOffset:forViewScale:](self, "clampedUnscaledContentOffset:forViewScale:", x, y, v11);
    double x = v12;
    double y = v13;
  }
  -[TSDInteractiveCanvasController convertUnscaledToBoundsPoint:](self, "convertUnscaledToBoundsPoint:", x, y);
  double v15 = v14;
  double v17 = v16;
  double v18 = (void *)[(TSDCanvasLayerHosting *)[(TSDInteractiveCanvasController *)self layerHost] canvasView];
  double v19 = (void *)[v18 enclosingScrollView];
  objc_msgSend(v18, "convertPoint:toView:", v19, v15, v17);
  objc_msgSend(v19, "setContentOffset:animated:completionBlock:", v7, a6);
}

- (CGPoint)contentOffset
{
  double v3 = (void *)[(TSDCanvasLayerHosting *)[(TSDInteractiveCanvasController *)self layerHost] canvasView];
  BOOL v4 = (void *)[v3 enclosingScrollView];
  if (v4)
  {
    int v5 = v4;
    [v4 contentOffset];
    objc_msgSend(v5, "convertPoint:toView:", v3);
    -[TSDInteractiveCanvasController convertBoundsToUnscaledPoint:](self, "convertBoundsToUnscaledPoint:");
  }
  else
  {
    double v6 = *MEMORY[0x263F00148];
    double v7 = *(double *)(MEMORY[0x263F00148] + 8);
  }
  result.double y = v7;
  result.double x = v6;
  return result;
}

- (double)viewScaleForZoomToFitRect:(CGRect)a3 outset:(BOOL)a4 fitWidthOnly:(BOOL)a5
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (a4)
  {
    -[TSDInteractiveCanvasController p_outsetSelectionRect:](self, "p_outsetSelectionRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    CGFloat x = v10;
    CGFloat y = v11;
    CGFloat width = v12;
    CGFloat height = v13;
  }
  [(TSDInteractiveCanvasController *)self viewScale];
  double v15 = v14;
  v18.origin.CGFloat x = x;
  v18.origin.CGFloat y = y;
  v18.size.CGFloat width = width;
  v18.size.CGFloat height = height;
  if (CGRectIsNull(v18)) {
    return v15;
  }
  [(TSDInteractiveCanvasController *)self visibleBoundsRect];
  [(TSDCanvasLayer *)[(TSDCanvasView *)[(TSDInteractiveCanvasController *)self canvasView] canvasLayer] minimumPinchViewScale];
  [(TSDCanvasLayer *)[(TSDCanvasView *)[(TSDInteractiveCanvasController *)self canvasView] canvasLayer] maximumPinchViewScale];
  TSUClamp();
  return result;
}

- (BOOL)zoomToFitRect:(CGRect)a3 outset:(BOOL)a4 fitWidthOnly:(BOOL)a5 centerHorizontally:(BOOL)a6 centerVertically:(BOOL)a7 animated:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  BOOL v10 = a6;
  BOOL v11 = a5;
  BOOL v12 = a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (a4)
  {
    -[TSDInteractiveCanvasController p_outsetSelectionRect:](self, "p_outsetSelectionRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
  }
  else
  {
    double v25 = a3.size.height;
    double v23 = a3.size.width;
    double v21 = a3.origin.y;
    double v19 = a3.origin.x;
  }
  if (self->mAnimatingViewScale) {
    return 0;
  }
  v56.origin.double x = v19;
  v56.origin.double y = v21;
  v56.size.double width = v23;
  v56.size.double height = v25;
  if (CGRectIsNull(v56)) {
    return 0;
  }
  [(TSDInteractiveCanvasController *)self visibleBoundsRect];
  double v55 = v26;
  double v53 = v28;
  double v54 = v27;
  -[TSDInteractiveCanvasController viewScaleForZoomToFitRect:outset:fitWidthOnly:](self, "viewScaleForZoomToFitRect:outset:fitWidthOnly:", v12, v11, x, y, width, height);
  double v30 = v29;
  double v31 = v53 / v29;
  double v32 = (v54 / v29 - v23) * 0.5;
  if (!v10) {
    double v32 = 0.0;
  }
  double v33 = v19 - v32;
  double v34 = (v31 - v25) * 0.5;
  if (!v9) {
    double v34 = 0.0;
  }
  double v35 = v21 - v34;
  double v36 = (void *)[(TSKScrollView *)[(TSDCanvasView *)[(TSDInteractiveCanvasController *)self canvasView] enclosingScrollView] layer];
  [v36 bounds];
  objc_msgSend(v36, "convertRect:toLayer:", -[TSDCanvasView layer](-[TSDInteractiveCanvasController canvasView](self, "canvasView"), "layer"), v37, v38, v39, v40);
  double v43 = TSDSubtractPoints(v41, v42, v55);
  double v45 = TSDMultiplyPointScalar(v43, v44, 1.0 / v30);
  -[TSDInteractiveCanvasController clampedUnscaledContentOffset:forViewScale:](self, "clampedUnscaledContentOffset:forViewScale:", TSDAddPoints(v33, v35, v45));
  double v47 = v46;
  double v49 = v48;
  [(TSDCanvasLayer *)[(TSDCanvasView *)[(TSDInteractiveCanvasController *)self canvasView] canvasLayer] viewScale];
  if (vabdd_f64(v50, v30) < 0.00999999978) {
    return 0;
  }
  BOOL v51 = 1;
  -[TSDInteractiveCanvasController setViewScale:contentOffset:clampOffset:animated:](self, "setViewScale:contentOffset:clampOffset:animated:", 1, v8, v30, v47, v49);
  return v51;
}

- (CGSize)sizeOfScrollViewEnclosingCanvas
{
  objc_msgSend((id)objc_msgSend((id)-[TSDCanvasLayerHosting canvasView](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "canvasView"), "enclosingScrollView"), "frame");
  double v4 = v3;
  double v6 = v5;
  if (![(TSDCanvasLayerHosting *)[(TSDInteractiveCanvasController *)self layerHost] canvasView])
  {
    objc_msgSend((id)-[TSDCanvasLayerHosting clippingLayer](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "clippingLayer"), "frame");
    double v4 = v7;
    double v6 = v8;
  }
  if (objc_opt_respondsToSelector())
  {
    mDelegate = self->mDelegate;
    [(TSDInteractiveCanvasControllerDelegate *)mDelegate sizeOfScrollViewEnclosingCanvas];
  }
  else
  {
    double v10 = v4;
    double v11 = v6;
  }
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (void)setNeedsDisplayOnLayer:(id)a3
{
  if (self->mLayoutAndRenderOnThreadDuringScroll
    && self->mCurrentlyWaitingOnThreadedLayoutAndRender == [MEMORY[0x263F08B88] isMainThread])
  {
    double v4 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"-[TSDInteractiveCanvasController setNeedsDisplayOnLayer:]"];
    [v4 handleFailureInFunction:v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 2468, @"invaling on MT while waiting for secondary thread layout / render, or invaling on secondary thread when not waiting on a secondary thread layout / render" file lineNumber description];
  }
  [a3 setNeedsDisplay];
}

- (void)setNeedsDisplayInRect:(CGRect)a3 onLayer:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (self->mLayoutAndRenderOnThreadDuringScroll
    && self->mCurrentlyWaitingOnThreadedLayoutAndRender == [MEMORY[0x263F08B88] isMainThread])
  {
    BOOL v9 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v10 = [NSString stringWithUTF8String:"-[TSDInteractiveCanvasController setNeedsDisplayInRect:onLayer:]"];
    [v9 handleFailureInFunction:v10, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 2474, @"invaling on MT while waiting for secondary thread layout / render, or invaling on secondary thread when not waiting on a secondary thread layout / render" file lineNumber description];
  }
  objc_msgSend(a4, "setNeedsDisplayInRect:", x, y, width, height);
}

- (CGColor)newDefaultSelectionHighlightColor
{
  return (CGColor *)TSUCGColorCreateDeviceRGB();
}

- (CGColor)selectionHighlightColor
{
  CGSize result = self->mSelectionHighlightColor;
  if (!result)
  {
    CGSize result = [(TSDInteractiveCanvasController *)self newDefaultSelectionHighlightColor];
    self->mSelectionHighlightColor = result;
  }
  return result;
}

- (void)setSelectionHighlightColor:(CGColor *)a3
{
  Copdouble y = CGColorCreateCopy(a3);
  CGColorRelease(self->mSelectionHighlightColor);
  self->mSelectionHighlightColor = Copy;
  [(TSDInteractiveCanvasController *)self i_invalidateSelectionHighlightLayers];
}

- (void)displayRulerWithSlowFade:(BOOL)a3
{
  double v3 = [(TSDInteractiveCanvasController *)self rulerController];
  [(TSDRulerController *)v3 displayRulerDragUI];
}

- (void)displayRulerForRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v7 = [(TSDInteractiveCanvasController *)self rulerController];
  -[TSDRulerController displayRulerDragUIForRect:](v7, "displayRulerDragUIForRect:", x, y, width, height);
}

- (void)hideRuler
{
  double v2 = [(TSDInteractiveCanvasController *)self rulerController];
  [(TSDRulerController *)v2 hideRulerDragUI];
}

- (id)replaceImageController
{
  [(TSDInteractiveCanvasController *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  double v3 = [(TSDInteractiveCanvasController *)self delegate];
  return (id)[(TSDInteractiveCanvasControllerDelegate *)v3 imageReplacerForInteractiveCanvasController:self];
}

- (CGImage)textImageFromRect:(CGRect)a3
{
  double v3 = objc_msgSend(MEMORY[0x263F7C858], "imageWithSize:drawnUsingBlock:", &__block_literal_global_22, a3.size.width, a3.size.height);
  return (CGImage *)[v3 CGImage];
}

- (BOOL)spellCheckingSupported
{
  int v3 = [(TSDInteractiveCanvasController *)self isCanvasInteractive];
  if (v3)
  {
    if (objc_opt_respondsToSelector())
    {
      mDelegate = self->mDelegate;
      LOBYTE(v3) = [(TSDInteractiveCanvasControllerDelegate *)mDelegate spellCheckingSupported];
    }
    else
    {
      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

- (BOOL)spellCheckingSuppressed
{
  int v3 = ![(TSDInteractiveCanvasController *)self spellCheckingSupported];
  if (v3) {
    return 1;
  }
  if (objc_opt_respondsToSelector()) {
    return [(TSDInteractiveCanvasControllerDelegate *)self->mDelegate spellCheckingSuppressed] | v3;
  }
  return 0;
}

- (BOOL)isCanvasInteractive
{
  if (!self->mDelegate || (objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  mDelegate = self->mDelegate;
  return [(TSDInteractiveCanvasControllerDelegate *)mDelegate isCanvasInteractive];
}

- (BOOL)isPrinting
{
  if (!self->mDelegate || (objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  mDelegate = self->mDelegate;
  return [(TSDInteractiveCanvasControllerDelegate *)mDelegate isPrintingCanvas];
}

- (BOOL)shouldShowTextOverflowGlyphs
{
  if (!self->mDelegate || (objc_opt_respondsToSelector() & 1) == 0) {
    return 1;
  }
  mDelegate = self->mDelegate;
  return [(TSDInteractiveCanvasControllerDelegate *)mDelegate shouldShowTextOverflowGlyphs];
}

- (BOOL)shouldShowInstructionalText
{
  if (self->mDelegate && (objc_opt_respondsToSelector() & 1) != 0)
  {
    mDelegate = self->mDelegate;
    return [(TSDInteractiveCanvasControllerDelegate *)mDelegate shouldShowInstructionalText];
  }
  else
  {
    return [(TSDInteractiveCanvasController *)self isCanvasInteractive];
  }
}

- (BOOL)shouldShowUserDefinedGuides
{
  return self->mShowUserDefinedGuides;
}

- (void)setShouldShowUserDefinedGuides:(BOOL)a3
{
  self->mShowUserDefinedGuides = a3;
}

- (void)pushThreadedLayoutAndRenderDisabled
{
  int mDisableThreadedLayoutAndRender = self->mDisableThreadedLayoutAndRender;
  if (!mDisableThreadedLayoutAndRender)
  {
    int mDisableThreadedLayoutAndRender = self->mLayoutAndRenderOnThreadDuringScroll;
    if (self->mLayoutAndRenderOnThreadDuringScroll)
    {
      int mDisableThreadedLayoutAndRender = self->mCurrentlyWaitingOnThreadedLayoutAndRender;
      if (self->mCurrentlyWaitingOnThreadedLayoutAndRender)
      {
        [(TSDInteractiveCanvasController *)self i_syncWithLayoutThread];
        int mDisableThreadedLayoutAndRender = self->mDisableThreadedLayoutAndRender;
      }
    }
  }
  self->int mDisableThreadedLayoutAndRender = mDisableThreadedLayoutAndRender + 1;
}

- (void)popThreadedLayoutAndRenderDisabled
{
  int mDisableThreadedLayoutAndRender = self->mDisableThreadedLayoutAndRender;
  if (mDisableThreadedLayoutAndRender
    || (double v4 = (void *)[MEMORY[0x263F7C7F0] currentHandler],
        uint64_t v5 = [NSString stringWithUTF8String:"-[TSDInteractiveCanvasController popThreadedLayoutAndRenderDisabled]"], objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 2633, @"unbalanced calls to push/popThreadedLayoutAndRenderDisabled"), (mDisableThreadedLayoutAndRender = self->mDisableThreadedLayoutAndRender) != 0))
  {
    self->int mDisableThreadedLayoutAndRender = mDisableThreadedLayoutAndRender - 1;
  }
}

- (void)embeddedCanvasWillBeginScrolling
{
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    int v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSDInteractiveCanvasController embeddedCanvasWillBeginScrolling]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 2643, @"This operation must only be performed on the main thread.");
  }
  ++self->mEmbeddedCanvasScrolling;
}

- (void)embeddedCanvasDidEndScrolling
{
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    int v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSDInteractiveCanvasController embeddedCanvasDidEndScrolling]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 2649, @"This operation must only be performed on the main thread.");
  }
  unsigned int mEmbeddedCanvasScrolling = self->mEmbeddedCanvasScrolling;
  if (mEmbeddedCanvasScrolling) {
    self->unsigned int mEmbeddedCanvasScrolling = mEmbeddedCanvasScrolling - 1;
  }
}

- (void)forceStopScrolling
{
  if (self->mCurrentlyScrolling)
  {
    objc_opt_class();
    objc_msgSend((id)-[TSDCanvasLayerHosting canvasView](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "canvasView"), "enclosingScrollView");
    int v3 = (void *)TSUDynamicCast();
    [(TSDInteractiveCanvasController *)self contentOffset];
    objc_msgSend(v3, "setContentOffset:");
    if (self->mCurrentlyScrolling)
    {
      uint64_t v4 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v5 = [NSString stringWithUTF8String:"-[TSDInteractiveCanvasController forceStopScrolling]"];
      objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 2665, @"scroll view should no longer be scrolling");
    }
  }
  [(TSDInteractiveCanvasController *)self layoutIfNeeded];
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel_i_viewScrollingEnded object:0];
  [(TSDInteractiveCanvasController *)self i_viewScrollingEnded];
}

- (void)toggleShouldShowUserDefinedGuides
{
  uint64_t v3 = [(TSDInteractiveCanvasController *)self shouldShowUserDefinedGuides] ^ 1;
  [(TSDInteractiveCanvasController *)self setShouldShowUserDefinedGuides:v3];
}

- (void)makeUserDefinedGuidesVisible
{
  self->mShowUserDefinedGuides = 1;
  [(TSDInteractiveCanvasController *)self invalidateLayers];
}

- (TSDGuideStorage)guideStorage
{
  return 0;
}

- (CGRect)boundingRectForActiveGuidesForRect:(CGRect)a3
{
  double v3 = *MEMORY[0x263F00190];
  double v4 = *(double *)(MEMORY[0x263F00190] + 8);
  double v5 = *(double *)(MEMORY[0x263F00190] + 16);
  double v6 = *(double *)(MEMORY[0x263F00190] + 24);
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (id)provideDynamicGuides
{
  return 0;
}

- (id)provideUserDefinedGuides
{
  return 0;
}

- (id)localizedPercentStringForAlignmentGuide:(id)a3
{
  return 0;
}

- (NSArray)infosToDisplay
{
  return [(TSDCanvas *)self->mCanvas infosToDisplay];
}

- (void)setInfosToDisplay:(id)a3
{
  if (self->mLayoutAndRenderOnThreadDuringScroll && self->mCurrentlyWaitingOnThreadedLayoutAndRender)
  {
    if ([(TSDInteractiveCanvasController *)self p_currentlyScrolling])
    {
      double v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v6 = [NSString stringWithUTF8String:"-[TSDInteractiveCanvasController setInfosToDisplay:]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 2762, @"this will probably cause a hiccup");
    }
    [(TSDInteractiveCanvasController *)self i_syncWithLayoutThread];
  }
  BOOL v7 = [(TSDInteractiveCanvasController *)self p_shouldLayoutAndRenderOnThread];
  if (!v7
    && self->mStaticLayoutAndRenderOnThread
    && self->mDisableThreadedLayoutAndRender <= 0
    && [(TSDCanvasView *)[(TSDInteractiveCanvasController *)self canvasView] window])
  {
    double v8 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v9 = [NSString stringWithUTF8String:"-[TSDInteractiveCanvasController setInfosToDisplay:]"];
    [v8 handleFailureInFunction:v9, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 2768, @"we want to do a static layout+render on the BG thread, but threaded layout+render is disabled" file lineNumber description];
  }
  [(TSDCanvas *)self->mCanvas i_setInfosToDisplay:a3 updatingLayoutController:0];
  [(TSDCanvasEditor *)self->mCanvasEditor canvasInfosDidChange];
  if (v7)
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __52__TSDInteractiveCanvasController_setInfosToDisplay___block_invoke;
    v11[3] = &unk_2646AF7B8;
    v11[4] = self;
    [(TSDInteractiveCanvasController *)self p_acquireLockAndPerformAction:v11];
    objc_msgSend(-[TSDInteractiveCanvasController p_backgroundLayoutAndRenderState](self, "p_backgroundLayoutAndRenderState"), "setNeedsLayoutAndRender");
  }
  else
  {
    mCanvas = self->mCanvas;
    [(TSDCanvas *)mCanvas i_updateInfosInLayoutController];
  }
}

uint64_t __52__TSDInteractiveCanvasController_setInfosToDisplay___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 418) = 1;
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "i_updateInfosInLayoutController");
}

- (id)topLevelZOrderedSiblingsOfInfos:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = [a3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(a3);
        }
        uint64_t v9 = [*(id *)(*((void *)&v13 + 1) + 8 * i) parentInfo];
        if (v6)
        {
          if ((void *)v9 != v6)
          {
            uint64_t v10 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
            uint64_t v11 = [NSString stringWithUTF8String:"-[TSDInteractiveCanvasController topLevelZOrderedSiblingsOfInfos:]"];
            objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 2802, @"Infos supplied to topLevelZOrderedSiblingsOfInfos: should have same parent.");
          }
        }
        else
        {
          uint64_t v6 = (void *)v9;
        }
      }
      uint64_t v5 = [a3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (id)[v6 childInfos];
}

- (id)repsForInfo:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v5 = (void *)[MEMORY[0x263EFF9C0] set];
  id v6 = [(TSDInteractiveCanvasController *)self layoutsForInfo:a3];
  if (v6)
  {
    uint64_t v7 = v6;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = [(TSDInteractiveCanvasController *)self repForLayout:*(void *)(*((void *)&v14 + 1) + 8 * v11)];
          if (v12) {
            [v5 addObject:v12];
          }
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }
  }
  return v5;
}

- (id)repForInfo:(id)a3 createIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v7 = [(TSDInteractiveCanvasController *)self layoutForInfo:"layoutForInfo:"];
  id v8 = v7;
  if (!v7)
  {
    id v8 = 0;
    if (v4)
    {
      [(TSDInteractiveCanvasController *)self i_layout];
      id v8 = [(TSDInteractiveCanvasController *)self layoutForInfo:a3];
    }
  }
  id result = [(TSDInteractiveCanvasController *)self repForLayout:v8];
  if (result) {
    int v10 = 1;
  }
  else {
    int v10 = !v4;
  }
  if (!v10) {
    id result = 0;
  }
  if (v7 && (v10 & 1) == 0)
  {
    [(TSDInteractiveCanvasController *)self i_layout];
    id result = [(TSDInteractiveCanvasController *)self repForLayout:v8];
  }
  if (!result)
  {
    id v11 = [(TSDInteractiveCanvasController *)self layoutsForInfo:a3];
    id v12 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithArray:", objc_msgSend(v11, "allObjects"));
    [v12 sortUsingSelector:sel_orderedBefore_];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v13 = objc_msgSend(v12, "reverseObjectEnumerator", 0);
    id result = (id)[v13 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (result)
    {
      id v14 = result;
      uint64_t v15 = *(void *)v18;
LABEL_16:
      uint64_t v16 = 0;
      while (1)
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v13);
        }
        id result = [(TSDInteractiveCanvasController *)self repForLayout:*(void *)(*((void *)&v17 + 1) + 8 * v16)];
        if (result) {
          break;
        }
        if (v14 == (id)++v16)
        {
          id v14 = (id)[v13 countByEnumeratingWithState:&v17 objects:v21 count:16];
          id result = 0;
          if (v14) {
            goto LABEL_16;
          }
          return result;
        }
      }
    }
  }
  return result;
}

- (id)repForInfo:(id)a3
{
  return [(TSDInteractiveCanvasController *)self repForInfo:a3 createIfNeeded:0];
}

- (id)p_repForLayout:(id)a3 createIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  id result = [(TSDCanvas *)self->mCanvas repForLayout:"repForLayout:"];
  if (result) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = !v4;
  }
  if (!v8)
  {
    [(TSDInteractiveCanvasController *)self i_layout];
    mCanvas = self->mCanvas;
    return [(TSDCanvas *)mCanvas repForLayout:a3];
  }
  return result;
}

- (id)repForLayout:(id)a3
{
  return [(TSDInteractiveCanvasController *)self p_repForLayout:a3 createIfNeeded:0];
}

- (id)layerForRep:(id)a3
{
  if (![(TSDInteractiveCanvasController *)self isCanvasInteractive])
  {
    uint64_t v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSDInteractiveCanvasController layerForRep:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 2902, @"asking for layerForRep: in a non-interactive canvas");
  }
  mRepLayersByRep = self->mRepLayersByRep;
  return (id)CFDictionaryGetValue(mRepLayersByRep, a3);
}

- (id)containerLayerForRep:(id)a3
{
  if (![(TSDInteractiveCanvasController *)self isCanvasInteractive])
  {
    uint64_t v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSDInteractiveCanvasController containerLayerForRep:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 2910, @"asking for layerForRep: in a non-interactive canvas");
  }
  mContainerLayersByRep = self->mContainerLayersByRep;
  return (id)CFDictionaryGetValue(mContainerLayersByRep, a3);
}

- (id)repForLayer:(id)a3
{
  if (![(TSDInteractiveCanvasController *)self isCanvasInteractive])
  {
    uint64_t v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSDInteractiveCanvasController repForLayer:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 2917, @"asking for d_repForLayer: in a non-interactive canvas");
  }
  mRepsByRepLayer = self->mRepsByRepLayer;
  return (id)CFDictionaryGetValue(mRepsByRepLayer, a3);
}

- (id)repForContainerLayer:(id)a3
{
  if (![(TSDInteractiveCanvasController *)self isCanvasInteractive])
  {
    uint64_t v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSDInteractiveCanvasController repForContainerLayer:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 2923, @"asking for d_repForLayer: in a non-interactive canvas");
  }
  mRepsByContainerLayer = self->mRepsByContainerLayer;
  return (id)CFDictionaryGetValue(mRepsByContainerLayer, a3);
}

- (void)recreateAllLayoutsAndReps
{
  [(TSDInteractiveCanvasController *)self endEditing];
  [(TSDCanvasEditor *)self->mCanvasEditor setSelection:0];
  objc_msgSend((id)-[TSDCanvasLayerHosting canvasLayer](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "canvasLayer"), "pushLayoutDisabled");
  [(TSDCanvas *)self->mCanvas recreateAllLayoutsAndReps];
  double v3 = (void *)[(TSDCanvasLayerHosting *)[(TSDInteractiveCanvasController *)self layerHost] canvasLayer];
  [v3 popLayoutDisabled];
}

- (void)discardRepForClassChange:(id)a3
{
  if (a3)
  {
    id v5 = a3;
    uint64_t v6 = (void *)[a3 parentRep];
    if (v6)
    {
      id v7 = v6;
      if ([v6 conformsToProtocol:&unk_26D78AC88])
      {
        [v7 removeChildRep:a3];
      }
      else
      {
        int v10 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v11 = [NSString stringWithUTF8String:"-[TSDInteractiveCanvasController discardRepForClassChange:]"];
        objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 2975, @"couldn't remove rep from parent");
      }
    }
    [(TSDCanvas *)[(TSDInteractiveCanvasController *)self canvas] i_unregisterRep:a3];

    [(TSDInteractiveCanvasController *)self layoutInvalidated];
  }
  else
  {
    BOOL v8 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v9 = [NSString stringWithUTF8String:"-[TSDInteractiveCanvasController discardRepForClassChange:]"];
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 2963, @"invalid nil value for '%s'", "rep");
  }
}

- (CGRect)visibleBoundsRect
{
  [(TSDInteractiveCanvasController *)self p_visibleBoundsRectUsingSizeOfEnclosingScrollView:0];
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (CGRect)visibleBoundsRectUsingSizeOfEnclosingScrollView
{
  [(TSDInteractiveCanvasController *)self p_visibleBoundsRectUsingSizeOfEnclosingScrollView:1];
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (CGRect)p_visibleBoundsRectUsingSizeOfEnclosingScrollView:(BOOL)a3
{
  double v4 = (void *)[(TSDCanvasLayerHosting *)[(TSDInteractiveCanvasController *)self layerHost] canvasLayer];
  if (v4)
  {
    double v5 = v4;
    [v4 bounds];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    id v14 = (void *)[(TSDCanvasLayerHosting *)[(TSDInteractiveCanvasController *)self layerHost] clippingLayer];
    objc_opt_class();
    objc_msgSend((id)-[TSDCanvasLayerHosting canvasView](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "canvasView"), "enclosingScrollView");
    uint64_t v15 = (void *)TSUDynamicCast();
    if (v14)
    {
      [v14 bounds];
    }
    else
    {
      long long v20 = v15;
      double v21 = (void *)[v15 contentView];
      [(TSDInteractiveCanvasController *)self unobscuredScrollViewFrame];
      objc_msgSend(v21, "convertRect:fromView:", objc_msgSend(v20, "superview"), v22, v23, v24, v25);
    }
    double v26 = v16;
    double v27 = v17;
    double v28 = v18;
    double v29 = v19;
    [(TSDInteractiveCanvasController *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      -[TSDInteractiveCanvasControllerDelegate interactiveCanvasController:visibleBoundsWithClippingLayerBounds:canvasBounds:]([(TSDInteractiveCanvasController *)self delegate], "interactiveCanvasController:visibleBoundsWithClippingLayerBounds:canvasBounds:", self, v26, v27, v28, v29, v7, v9, v11, v13);
    }
    else
    {
      if (v14
        && (([v14 masksToBounds] & 1) != 0
         || ([(TSDInteractiveCanvasController *)self delegate], (objc_opt_respondsToSelector() & 1) != 0)
         && [(TSDInteractiveCanvasControllerDelegate *)[(TSDInteractiveCanvasController *)self delegate] shouldClipToScrollViewBoundsInVisibleBounds]))
      {
        objc_msgSend(v14, "convertRect:fromLayer:", v5, v7, v9, v11, v13);
        v59.origin.double x = v26;
        v59.origin.double y = v27;
        v59.size.double width = v28;
        v59.size.double height = v29;
        CGRect v55 = CGRectIntersection(v54, v59);
        double v34 = v14;
      }
      else
      {
        [(TSDInteractiveCanvasController *)self delegate];
        if (objc_opt_respondsToSelector()) {
          double v35 = (void *)[(TSDInteractiveCanvasControllerDelegate *)[(TSDInteractiveCanvasController *)self delegate] visibleBoundsClipViewForInteractiveCanvasController:self];
        }
        else {
          double v35 = objc_msgSend((id)-[TSDCanvasLayerHosting canvasView](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "canvasView"), "window");
        }
        double v36 = (void *)[v35 layer];
        if (!v36) {
          goto LABEL_20;
        }
        double v37 = v36;
        objc_msgSend(v36, "convertRect:fromLayer:", v5, v7, v9, v11, v13);
        CGFloat v39 = v38;
        CGFloat v41 = v40;
        CGFloat v43 = v42;
        CGFloat v45 = v44;
        [v37 bounds];
        v60.origin.double x = v46;
        v60.origin.double y = v47;
        v60.size.double width = v48;
        v60.size.double height = v49;
        v56.origin.double x = v39;
        v56.origin.double y = v41;
        v56.size.double width = v43;
        v56.size.double height = v45;
        CGRect v55 = CGRectIntersection(v56, v60);
        double v34 = v37;
      }
      objc_msgSend(v34, "convertRect:toLayer:", v5, v55.origin.x, v55.origin.y, v55.size.width, v55.size.height);
    }
    double v7 = v30;
    double v9 = v31;
    double v11 = v32;
    double v13 = v33;
  }
  else
  {
    double v7 = *MEMORY[0x263F00190];
    double v9 = *(double *)(MEMORY[0x263F00190] + 8);
    double v11 = *(double *)(MEMORY[0x263F00190] + 16);
    double v13 = *(double *)(MEMORY[0x263F00190] + 24);
  }
LABEL_20:
  v57.origin.double x = v7;
  v57.origin.double y = v9;
  v57.size.double width = v11;
  v57.size.double height = v13;
  if (CGRectIsNull(v57))
  {
    double v7 = *MEMORY[0x263F001A8];
    double v9 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v11 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v13 = *(double *)(MEMORY[0x263F001A8] + 24);
  }
  double v50 = v7;
  double v51 = v9;
  double v52 = v11;
  double v53 = v13;
  result.size.double height = v53;
  result.size.double width = v52;
  result.origin.double y = v51;
  result.origin.double x = v50;
  return result;
}

- (CGRect)visibleBoundsRectClippedToWindow
{
  [(TSDInteractiveCanvasController *)self visibleBoundsRect];
  double x = v30.origin.x;
  double y = v30.origin.y;
  double width = v30.size.width;
  double height = v30.size.height;
  if (!CGRectIsEmpty(v30))
  {
    uint64_t v7 = [(TSDCanvasLayerHosting *)[(TSDInteractiveCanvasController *)self layerHost] canvasLayer];
    double v8 = objc_msgSend((id)-[TSDCanvasView window](-[TSDInteractiveCanvasController canvasView](self, "canvasView"), "window"), "layer");
    if (v7)
    {
      double v9 = v8;
      if (v8)
      {
        objc_msgSend(v8, "convertRect:fromLayer:", v7, x, y, width, height);
        CGFloat v11 = v10;
        CGFloat v13 = v12;
        CGFloat v15 = v14;
        CGFloat v17 = v16;
        [v9 bounds];
        v34.origin.double x = v18;
        v34.origin.double y = v19;
        v34.size.double width = v20;
        v34.size.double height = v21;
        v31.origin.double x = v11;
        v31.origin.double y = v13;
        v31.size.double width = v15;
        v31.size.double height = v17;
        CGRect v32 = CGRectIntersection(v31, v34);
        objc_msgSend(v9, "convertRect:toLayer:", v7, v32.origin.x, v32.origin.y, v32.size.width, v32.size.height);
        double x = v22;
        double y = v23;
        double width = v24;
        double height = v25;
      }
    }
  }
  double v26 = x;
  double v27 = y;
  double v28 = width;
  double v29 = height;
  result.size.double height = v29;
  result.size.double width = v28;
  result.origin.double y = v27;
  result.origin.double x = v26;
  return result;
}

- (CGRect)visibleBoundsRectForTiling
{
  [(TSDInteractiveCanvasController *)self p_visibleBoundsRectForTiling];
  if (CGRectIsNull(v19))
  {
    [(TSDInteractiveCanvasController *)self p_calculateVisibleBoundsRectForTiling];
    -[TSDInteractiveCanvasController setP_visibleBoundsRectForTiling:](self, "setP_visibleBoundsRectForTiling:");
  }
  [(TSDInteractiveCanvasController *)self p_visibleBoundsRectForTiling];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  if (objc_opt_respondsToSelector())
  {
    -[TSDInteractiveCanvasControllerDelegate interactiveCanvasController:expandVisibleBoundsForTiling:](self->mDelegate, "interactiveCanvasController:expandVisibleBoundsForTiling:", self, v4, v6, v8, v10);
    double v4 = v11;
    double v6 = v12;
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

- (CGRect)p_calculateVisibleBoundsRectForTiling
{
  [(TSDInteractiveCanvasController *)self p_visibleBoundsRectUsingSizeOfEnclosingScrollView:1];
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (CGRect)visibleUnscaledRect
{
  [(TSDInteractiveCanvasController *)self p_visibleUnscaledRect];
  if (CGRectIsNull(v8))
  {
    [(TSDInteractiveCanvasController *)self p_calculateVisibleUnscaledRect];
    -[TSDInteractiveCanvasController setP_visibleUnscaledRect:](self, "setP_visibleUnscaledRect:");
  }
  [(TSDInteractiveCanvasController *)self p_visibleUnscaledRect];
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (CGRect)p_calculateVisibleUnscaledRect
{
  [(TSDInteractiveCanvasController *)self visibleBoundsRect];
  -[TSDInteractiveCanvasController convertBoundsToUnscaledRect:](self, "convertBoundsToUnscaledRect:");
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (BOOL)allowAutoscroll
{
  return 1;
}

- (BOOL)allowNegativeAutoscroll
{
  return 1;
}

- (CGRect)convertUnscaledToBoundsRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  double x = a3.origin.x;
  if (!CGRectIsInfinite(a3))
  {
    [(TSDInteractiveCanvasController *)self viewScale];
    double x = TSDMultiplyRectScalar(x, y, width, height, v8);
    CGFloat y = v9;
    CGFloat width = v10;
    CGFloat height = v11;
  }
  double v12 = x;
  double v13 = y;
  double v14 = width;
  double v15 = height;
  result.size.CGFloat height = v15;
  result.size.CGFloat width = v14;
  result.origin.CGFloat y = v13;
  result.origin.double x = v12;
  return result;
}

- (CGRect)convertBoundsToUnscaledRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  double x = a3.origin.x;
  if (!CGRectIsInfinite(a3))
  {
    [(TSDInteractiveCanvasController *)self viewScale];
    double x = TSDMultiplyRectScalar(x, y, width, height, 1.0 / v8);
    CGFloat y = v9;
    CGFloat width = v10;
    CGFloat height = v11;
  }
  double v12 = x;
  double v13 = y;
  double v14 = width;
  double v15 = height;
  result.size.CGFloat height = v15;
  result.size.CGFloat width = v14;
  result.origin.CGFloat y = v13;
  result.origin.double x = v12;
  return result;
}

- (CGPoint)convertUnscaledToBoundsPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(TSDInteractiveCanvasController *)self viewScale];
  double v6 = TSDMultiplyPointScalar(x, y, v5);
  result.double y = v7;
  result.double x = v6;
  return result;
}

- (CGPoint)convertBoundsToUnscaledPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(TSDInteractiveCanvasController *)self viewScale];
  double v6 = TSDMultiplyPointScalar(x, y, 1.0 / v5);
  result.double y = v7;
  result.double x = v6;
  return result;
}

- (CGSize)convertUnscaledToBoundsSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(TSDInteractiveCanvasController *)self viewScale];
  double v6 = TSDMultiplySizeScalar(width, height, v5);
  result.double height = v7;
  result.double width = v6;
  return result;
}

- (CGSize)convertBoundsToUnscaledSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(TSDInteractiveCanvasController *)self viewScale];
  double v6 = TSDMultiplySizeScalar(width, height, 1.0 / v5);
  result.double height = v7;
  result.double width = v6;
  return result;
}

- (id)unitFormatter
{
  id result = self->mUnitFormatter;
  if (!result)
  {
    id result = (id)objc_msgSend(+[TSKRulerUnits instance](TSKRulerUnits, "instance"), "formatter:lenient:", 0, 0);
    self->mUnitFormatter = (NSFormatter *)result;
  }
  return result;
}

- (id)unitStringForPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = +[TSKRulerUnits instance];
  id v7 = [(TSDInteractiveCanvasController *)self unitFormatter];
  [v6 convertPointsToRulerUnits:x];
  double v9 = v8;
  [v6 convertPointsToRulerUnits:y];
  double v11 = v10;
  id v12 = objc_alloc(NSNumber);
  BOOL v14 = v9 >= 0.0 || v9 <= -0.01;
  *(float *)&double v13 = v9;
  if (!v14) {
    *(float *)&double v13 = 0.0;
  }
  double v15 = (void *)[v12 initWithFloat:v13];
  id v16 = objc_alloc(NSNumber);
  BOOL v18 = v11 >= 0.0 || v11 <= -0.01;
  *(float *)&double v17 = v11;
  if (!v18) {
    *(float *)&double v17 = 0.0;
  }
  CGRect v19 = (void *)[v16 initWithFloat:v17];
  uint64_t v20 = [v7 stringForObjectValue:v15];
  uint64_t v21 = [v7 stringForObjectValue:v19];

  return (id)[NSString stringWithFormat:objc_msgSend((id)TSDBundle(), "localizedStringForKey:value:table:", @"x: %@  y: %@", &stru_26D688A48, @"TSDrawables", v20, v21];
}

- (id)unitStringForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v6 = +[TSKRulerUnits instance];
  id v7 = [(TSDInteractiveCanvasController *)self unitFormatter];
  id v8 = objc_alloc(NSNumber);
  [v6 convertPointsToRulerUnits:width];
  *(float *)&double v9 = v9;
  double v10 = (void *)[v8 initWithFloat:v9];
  id v11 = objc_alloc(NSNumber);
  [v6 convertPointsToRulerUnits:height];
  *(float *)&double v12 = v12;
  double v13 = (void *)[v11 initWithFloat:v12];
  uint64_t v14 = [v7 stringForObjectValue:v10];
  uint64_t v15 = [v7 stringForObjectValue:v13];

  return (id)[NSString stringWithFormat:objc_msgSend((id)TSDBundle(), "localizedStringForKey:value:table:", @"w: %@  h: %@", &stru_26D688A48, @"TSDrawables", v14, v15];
}

- (id)unitStringForNumber:(double)a3
{
  id v5 = +[TSKRulerUnits instance];
  id v6 = [(TSDInteractiveCanvasController *)self unitFormatter];
  id v7 = objc_alloc(NSNumber);
  [v5 convertPointsToRulerUnits:a3];
  *(float *)&double v8 = v8;
  double v9 = (void *)[v7 initWithFloat:v8];
  uint64_t v10 = [v6 stringForObjectValue:v9];

  return (id)[NSString stringWithFormat:objc_msgSend((id)TSDBundle(), "localizedStringForKey:value:table:", @"%@", &stru_26D688A48, @"TSDrawables", v10];
}

- (id)unitStringForAngle:(double)a3
{
  double v3 = NSString;
  uint64_t v4 = [(id)TSDBundle() localizedStringForKey:@"%i\\U00B0" value:&stru_26D688A48 table:@"TSDrawables"];
  TSURound();
  TSDNormalizeAngleInDegrees(v5);
  return (id)objc_msgSend(v3, "stringWithFormat:", v4, (int)v6);
}

- (id)unitStringForAngle:(double)a3 andLength:(double)a4
{
  id v7 = +[TSKRulerUnits instance];
  id v8 = [(TSDInteractiveCanvasController *)self unitFormatter];
  id v9 = objc_alloc(NSNumber);
  [v7 convertPointsToRulerUnits:a4];
  *(float *)&double v10 = v10;
  id v11 = (void *)[v9 initWithFloat:v10];
  uint64_t v12 = [v8 stringForObjectValue:v11];

  return (id)[NSString stringWithFormat:objc_msgSend((id)TSDBundle(), "localizedStringForKey:value:table:", @"%@  l: %@", &stru_26D688A48, @"TSDrawables", -[TSDInteractiveCanvasController unitStringForAngle:](self, "unitStringForAngle:", a3), v12];
}

- (id)ancestorRepOfRep:(id)a3 orDelegateConformingToProtocol:(id)a4
{
  if (!a4) {
    return 0;
  }
  uint64_t v7 = [a3 parentRep];
  if (v7)
  {
    id v8 = (void *)v7;
    do
    {
      id v9 = (void *)[v8 delegateConformingToProtocol:a4 forRep:a3];
      if (v9) {
        return v9;
      }
      if ([v8 conformsToProtocol:a4]) {
        return v8;
      }
      id v8 = (void *)[v8 parentRep];
    }
    while (v8);
  }
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  mDelegate = self->mDelegate;
  return (id)[(TSDInteractiveCanvasControllerDelegate *)mDelegate interactiveCanvasController:self delegateConformingToProtocol:a4 forRep:a3];
}

- (void)performBlockNextFrame:(id)a3
{
}

- (TSDContainerRep)topLevelContainerRepForEditing
{
  objc_opt_class();
  [(TSDInteractiveCanvasController *)self repForInfo:[(TSDCanvasSelection *)[(TSDCanvasEditor *)[(TSDInteractiveCanvasController *)self canvasEditor] canvasSelection] container]];
  return (TSDContainerRep *)TSUDynamicCast();
}

- (id)topLevelRepsForHitTesting
{
  double v3 = [(TSDInteractiveCanvasController *)self topLevelContainerRepForEditing];
  if (v3)
  {
    return [(TSDContainerRep *)v3 childReps];
  }
  else
  {
    mCanvas = self->mCanvas;
    return [(TSDCanvas *)mCanvas topLevelReps];
  }
}

+ (double)smallRepOutsetForHitTesting
{
  return 20.0;
}

- (id)hitRep:(CGPoint)a3 withGesture:(id)a4 passingTest:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  double v10 = [(TSDInteractiveCanvasController *)self canvas];
  id v11 = [(TSDInteractiveCanvasController *)self topLevelRepsForHitTesting];
  [(id)objc_opt_class() smallRepOutsetForHitTesting];
  return -[TSDCanvas hitRep:inTopLevelReps:smallRepOutset:withGesture:passingTest:](v10, "hitRep:inTopLevelReps:smallRepOutset:withGesture:passingTest:", v11, a4, a5, x, y, v12);
}

- (id)hitRep:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (self->mLayoutAndRenderOnThreadDuringScroll
    && self->mCurrentlyWaitingOnThreadedLayoutAndRender
    && [(TSDInteractiveCanvasController *)self p_currentlyScrollingIncludeEmbeddedCanvasScrolling:0])
  {
    double v6 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v7 = [NSString stringWithUTF8String:"-[TSDInteractiveCanvasController hitRep:]"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 3410, @"unsafe to find hit reps during scroll if we layout and render on a thread during scroll");
  }
  return -[TSDInteractiveCanvasController hitRep:withGesture:passingTest:](self, "hitRep:withGesture:passingTest:", 0, 0, x, y);
}

- (id)hitRepsAtPoint:(CGPoint)a3 withSlop:(CGSize)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v7 = (void *)[MEMORY[0x263EFF980] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = [(TSDCanvas *)self->mCanvas topLevelReps];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        double v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        objc_msgSend(v13, "convertNaturalPointFromUnscaledCanvas:", x, y);
        uint64_t v14 = objc_msgSend(v13, "hitReps:withSlop:");
        if (v14) {
          [v7 addObjectsFromArray:v14];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }
  return v7;
}

- (void)p_recursiveHitKnobAtPoint:(CGPoint)a3 inRep:(id)a4 minDistance:(double *)a5 hitKnob:(id *)a6 hitRep:(id *)a7
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v41 = *MEMORY[0x263EF8340];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  double v12 = objc_msgSend((id)objc_msgSend(a4, "knobs"), "reverseObjectEnumerator");
  uint64_t v13 = [v12 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v36;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v36 != v15) {
          objc_enumerationMutation(v12);
        }
        long long v17 = *(void **)(*((void *)&v35 + 1) + 8 * v16);
        double v34 = 0.0;
        if (!*a6 || !objc_msgSend(v17, "overlapsWithKnob:"))
        {
          if ((objc_msgSend(v17, "isHitByUnscaledPoint:andRep:returningDistance:", a4, &v34, x, y) & 1) == 0) {
            goto LABEL_14;
          }
LABEL_12:
          double v20 = v34;
          if (v34 >= *a5) {
            goto LABEL_14;
          }
LABEL_13:
          *a5 = v20;
          *a6 = v17;
          *a7 = a4;
          goto LABEL_14;
        }
        char v18 = [*a6 obscuresKnob:v17];
        int v19 = [v17 obscuresKnob:*a6];
        if ((objc_msgSend(v17, "isHitByUnscaledPoint:andRep:returningDistance:", a4, &v34, x, y) & 1) == 0) {
          goto LABEL_14;
        }
        if (v19)
        {
          double v20 = v34;
          goto LABEL_13;
        }
        if ((v18 & 1) == 0) {
          goto LABEL_12;
        }
LABEL_14:
        ++v16;
      }
      while (v14 != v16);
      uint64_t v21 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v40, 16, v20);
      uint64_t v14 = v21;
    }
    while (v21);
  }
  double v22 = (void *)TSUProtocolCast();
  if (v22)
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    double v23 = (void *)[v22 childReps];
    uint64_t v24 = [v23 countByEnumeratingWithState:&v30 objects:v39 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v31 != v26) {
            objc_enumerationMutation(v23);
          }
          -[TSDInteractiveCanvasController p_recursiveHitKnobAtPoint:inRep:minDistance:hitKnob:hitRep:](self, "p_recursiveHitKnobAtPoint:inRep:minDistance:hitKnob:hitRep:", *(void *)(*((void *)&v30 + 1) + 8 * i), a5, a6, a7, x, y);
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v30 objects:v39 count:16];
      }
      while (v25);
    }
  }
}

- (id)hitKnobAtPoint:(CGPoint)a3 returningRep:(id *)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v22 = *MEMORY[0x263EF8340];
  int v19 = 0;
  double v20 = 0;
  uint64_t v18 = 0x47EFFFFFE0000000;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = [(TSDCanvas *)self->mCanvas topLevelReps];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        -[TSDInteractiveCanvasController p_recursiveHitKnobAtPoint:inRep:minDistance:hitKnob:hitRep:](self, "p_recursiveHitKnobAtPoint:inRep:minDistance:hitKnob:hitRep:", *(void *)(*((void *)&v14 + 1) + 8 * v12++), &v18, &v20, &v19, x, y);
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v21 count:16];
    }
    while (v10);
  }
  if (a4) {
    *a4 = v19;
  }
  return v20;
}

- (TSDLayoutController)layoutController
{
  return [(TSDCanvas *)self->mCanvas layoutController];
}

- (id)validatedLayoutForInfo:(id)a3
{
  if (self->mLayoutAndRenderOnThreadDuringScroll
    && self->mCurrentlyWaitingOnThreadedLayoutAndRender
    && [MEMORY[0x263F08B88] isMainThread])
  {
    [(TSDInteractiveCanvasController *)self i_syncWithLayoutThread];
  }
  long double v5 = [(TSDInteractiveCanvasController *)self layoutController];
  return [(TSDLayoutController *)v5 validatedLayoutForInfo:a3];
}

- (id)layoutsForInfo:(id)a3
{
  uint64_t v4 = [(TSDInteractiveCanvasController *)self layoutController];
  return [(TSDLayoutController *)v4 layoutsForInfo:a3];
}

- (id)layoutsForModel:(id)a3 withSelection:(id)a4
{
  id result = [(TSDInteractiveCanvasController *)self infoForModel:a3 withSelection:a4];
  if (result)
  {
    return [(TSDInteractiveCanvasController *)self layoutsForInfo:result];
  }
  return result;
}

- (id)layoutForInfo:(id)a3
{
  uint64_t v4 = [(TSDInteractiveCanvasController *)self layoutController];
  return [(TSDLayoutController *)v4 layoutForInfo:a3];
}

- (id)layoutForModel:(id)a3 withSelection:(id)a4
{
  id v4 = [(TSDInteractiveCanvasController *)self layoutsForModel:a3 withSelection:a4];
  return (id)[v4 anyObject];
}

- (id)layoutsForInfo:(id)a3 intersectingSelection:(id)a4
{
  id v5 = [(TSDInteractiveCanvasController *)self layoutsForInfo:a3];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __71__TSDInteractiveCanvasController_layoutsForInfo_intersectingSelection___block_invoke;
  v7[3] = &unk_2646B13C8;
  v7[4] = a4;
  return (id)[v5 objectsPassingTest:v7];
}

void *__71__TSDInteractiveCanvasController_layoutsForInfo_intersectingSelection___block_invoke(uint64_t a1)
{
  objc_opt_class();
  id result = (void *)TSUDynamicCast();
  if (result)
  {
    [result rectForSelection:*(void *)(a1 + 32)];
    return (void *)!CGRectIsNull(v3);
  }
  return result;
}

- (id)layoutForInfoNearestVisibleRect:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = [(TSDInteractiveCanvasController *)self layoutsForInfo:a3];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = 0;
  uint64_t v8 = *(void *)v32;
  double v9 = INFINITY;
  do
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v32 != v8) {
        objc_enumerationMutation(v4);
      }
      uint64_t v11 = *(void **)(*((void *)&v31 + 1) + 8 * i);
      [v11 frameInRoot];
      CGFloat v13 = v12;
      CGFloat v15 = v14;
      CGFloat v17 = v16;
      CGFloat v19 = v18;
      [(TSDInteractiveCanvasController *)self visibleUnscaledRect];
      TSDDistanceToRectFromRect(v13, v15, v17, v19, v20, v21, v22, v23);
      if (v24 < v9)
      {
        [(TSDInteractiveCanvasController *)self visibleUnscaledRect];
        TSDDistanceToRectFromRect(v13, v15, v17, v19, v25, v26, v27, v28);
        double v9 = v29;
        uint64_t v7 = v11;
      }
    }
    uint64_t v6 = [v4 countByEnumeratingWithState:&v31 objects:v35 count:16];
  }
  while (v6);
  return v7;
}

- (id)layoutForInfoNearestVisibleRect:(id)a3 intersectingSelection:(id)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v6 = -[TSDInteractiveCanvasController layoutsForInfo:intersectingSelection:](self, "layoutsForInfo:intersectingSelection:", a3);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (!v7) {
    return 0;
  }
  uint64_t v8 = v7;
  double v9 = 0;
  uint64_t v10 = *(void *)v34;
  double v11 = INFINITY;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v34 != v10) {
        objc_enumerationMutation(v6);
      }
      CGFloat v13 = *(void **)(*((void *)&v33 + 1) + 8 * i);
      [v13 rectForSelection:a4];
      objc_msgSend(v13, "rectInRoot:");
      CGFloat v15 = v14;
      CGFloat v17 = v16;
      CGFloat v19 = v18;
      CGFloat v21 = v20;
      [(TSDInteractiveCanvasController *)self visibleUnscaledRect];
      TSDDistanceToRectFromRect(v15, v17, v19, v21, v22, v23, v24, v25);
      if (v26 < v11)
      {
        [(TSDInteractiveCanvasController *)self visibleUnscaledRect];
        TSDDistanceToRectFromRect(v15, v17, v19, v21, v27, v28, v29, v30);
        double v11 = v31;
        double v9 = v13;
      }
    }
    uint64_t v8 = [v6 countByEnumeratingWithState:&v33 objects:v37 count:16];
  }
  while (v8);
  return v9;
}

- (void)layoutIfNeeded
{
  if ((objc_msgSend((id)-[TSDCanvasLayerHosting canvasLayer](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "canvasLayer"), "isLayoutDisabled") & 1) == 0)
  {
    if (self->mCurrentlyWaitingOnThreadedLayoutAndRender
      && [MEMORY[0x263F08B88] isMainThread])
    {
      [(TSDInteractiveCanvasController *)self i_syncWithLayoutThread];
    }
    mCanvas = self->mCanvas;
    [(TSDCanvas *)mCanvas layoutIfNeeded];
  }
}

- (void)performBlockAfterNextLayout:(id)a3
{
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    uint64_t v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSDInteractiveCanvasController performBlockAfterNextLayout:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 3573, @"This operation must only be performed on the main thread.");
  }
  if (a3)
  {
    uint64_t v7 = [a3 copy];
    mNextLayoutBlocks = self->mNextLayoutBlocks;
    id v9 = (id)v7;
    if (!mNextLayoutBlocks)
    {
      mNextLayoutBlocks = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      uint64_t v7 = (uint64_t)v9;
      self->mNextLayoutBlocks = mNextLayoutBlocks;
    }
    [(NSMutableArray *)mNextLayoutBlocks addObject:v7];
  }
}

- (NSArray)additionalLayersUnderRepLayers
{
  return 0;
}

- (NSArray)additionalLayersOverRepLayers
{
  return 0;
}

- (BOOL)shouldEverShowPathHighlightOnInvisibleShapes
{
  return 1;
}

- (BOOL)shouldShowPathHighlightOnUnselectedInvisibleShapes
{
  return 0;
}

- (int)defaultKnobTypeForRep:(id)a3
{
  return 0;
}

- (BOOL)shouldShowOnRepHyperlinkUI
{
  return 0;
}

- (id)actionGhostKnobForRep:(id)a3
{
  return 0;
}

- (BOOL)shouldPopKnobsOutsideEnclosingScrollView
{
  if (!self->mDelegate || (objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  mDelegate = self->mDelegate;
  return [(TSDInteractiveCanvasControllerDelegate *)mDelegate shouldPopKnobsOutsideEnclosingScrollView];
}

- (void)setOverlayLayerSuppressed:(BOOL)a3
{
  if (self->mOverlayLayerSuppressed != a3)
  {
    self->mOverlayLayerSuppressed = a3;
    [(TSDInteractiveCanvasController *)self layoutInvalidated];
  }
}

- (void)addDecorator:(id)a3
{
  if (a3)
  {
    mDecorators = self->mDecorators;
    if (!mDecorators)
    {
      mDecorators = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      self->mDecorators = mDecorators;
    }
    if (([(NSMutableArray *)mDecorators containsObject:a3] & 1) == 0)
    {
      [(NSMutableArray *)self->mDecorators addObject:a3];
      [(TSDInteractiveCanvasController *)self layoutInvalidated];
    }
  }
  else
  {
    uint64_t v6 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v7 = [NSString stringWithUTF8String:"-[TSDInteractiveCanvasController addDecorator:]"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 3681, @"invalid nil value for '%s'", "decorator");
  }
}

- (void)removeDecorator:(id)a3
{
  if (a3)
  {
    if (-[NSMutableArray containsObject:](self->mDecorators, "containsObject:"))
    {
      [(NSMutableArray *)self->mDecorators removeObject:a3];
      [(TSDInteractiveCanvasController *)self invalidateLayers];
    }
  }
  else
  {
    uint64_t v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSDInteractiveCanvasController removeDecorator:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 3699, @"invalid nil value for '%s'", "decorator");
  }
}

- (id)p_decorators
{
  double v2 = (void *)[(NSMutableArray *)self->mDecorators copy];
  return v2;
}

- (void)showOrHideComments:(id)a3
{
  uint64_t v4 = [(TSDInteractiveCanvasController *)self showsComments] ^ 1;
  [(TSDInteractiveCanvasController *)self setShowsComments:v4];
}

- (BOOL)showsComments
{
  return 1;
}

- (BOOL)shouldDisplayCommentUIForInfo:(id)a3
{
  if ([(TSDInteractiveCanvasController *)self i_inPrintPreviewMode]) {
    return 0;
  }
  return [(TSDInteractiveCanvasController *)self showsComments];
}

- (void)invalidateComments
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  [(TSDInteractiveCanvasController *)self showsComments];
  [(TSDInteractiveCanvasController *)self invalidateReps];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v3 = [(TSDCanvas *)self->mCanvas topLevelReps];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v17 + 1) + 8 * i) recursivelyPerformSelectorIfImplemented:sel_invalidateKnobs];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v5);
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = [(TSDCanvas *)self->mCanvas topLevelReps];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      for (uint64_t j = 0; j != v10; ++j)
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * j) recursivelyPerformSelectorIfImplemented:sel_invalidateComments];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
    }
    while (v10);
  }
}

- (BOOL)attachedCommentsAllowedForDrawable:(id)a3
{
  return [a3 supportsAttachedComments];
}

- (id)annotationController
{
  return 0;
}

- (BOOL)hasAnnotations
{
  id v2 = [(TSDInteractiveCanvasController *)self annotationController];
  return [v2 hasAnnotations];
}

- (void)beginDynamicOperation
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (self->mInDynamicOperation)
  {
    id v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSDInteractiveCanvasController beginDynamicOperation]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 4075, @"didn't end previous dynamic operation before starting a new one");
  }
  if (self->mDynamicOperationCounter)
  {
    uint64_t v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSDInteractiveCanvasController beginDynamicOperation]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 4076, @"Inspector-driven dynamic operation in process when beginning separate dynamic operation");
  }
  if (objc_opt_respondsToSelector()) {
    [(TSDInteractiveCanvasControllerDelegate *)self->mDelegate dynamicOperationWillBegin];
  }
  self->mInDynamicOperation = 1;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = [(TSDInteractiveCanvasController *)self p_decorators];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        double v12 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          [v12 willBeginDynamicOperation];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
  objc_msgSend((id)objc_msgSend((id)-[TSDCanvasLayerHosting canvasView](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "canvasView"), "enclosingScrollView"), "setScrollEnabled:", 0);
}

- (void)endDynamicOperation
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (!self->mInDynamicOperation)
  {
    id v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSDInteractiveCanvasController endDynamicOperation]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 4099, @"ending dynamic operation without starting a new one");
  }
  if (self->mDynamicOperationCounter)
  {
    uint64_t v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSDInteractiveCanvasController endDynamicOperation]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 4100, @"Cannot begin inspector dynamic operation while in non-inspector dynamic operation");
  }
  self->mInDynamicOperation = 0;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = [(TSDInteractiveCanvasController *)self p_decorators];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        double v12 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          [v12 didEndDynamicOperation];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
  if (objc_opt_respondsToSelector()) {
    [(TSDInteractiveCanvasControllerDelegate *)self->mDelegate dynamicOperationDidEnd];
  }
  [(TSDCanvas *)self->mCanvas layoutInvalidated];
  objc_msgSend((id)objc_msgSend((id)-[TSDCanvasLayerHosting canvasView](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "canvasView"), "enclosingScrollView"), "setScrollEnabled:", 1);
}

- (BOOL)isInDynamicOperation
{
  return self->mInDynamicOperation || self->mDynamicOperationCounter > 0;
}

- (void)beginPossiblyParallelInspectorDynamicOperation
{
}

- (void)endPossiblyParallelInspectorDynamicOperation
{
  atomic_fetch_add(&self->mDynamicOperationCounter, 0xFFFFFFFF);
  if (self->mDynamicOperationCounter < 0)
  {
    id v2 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v3 = [NSString stringWithUTF8String:"-[TSDInteractiveCanvasController endPossiblyParallelInspectorDynamicOperation]"];
    uint64_t v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"];
    [v2 handleFailureInFunction:v3 file:v4 lineNumber:4133 description:@"Ended more dynamic operations than you began!"];
  }
}

- (BOOL)isInInspectorDynamicOperation
{
  return self->mDynamicOperationCounter > 0;
}

- (void)setInReadMode:(BOOL)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (self->mInReadMode != a3)
  {
    self->mInReadMode = a3;
    if (a3)
    {
      long long v20 = 0uLL;
      long long v21 = 0uLL;
      long long v18 = 0uLL;
      long long v19 = 0uLL;
      id v4 = [(TSDCanvas *)self->mCanvas topLevelReps];
      uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v23 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)v19;
        do
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v19 != v7) {
              objc_enumerationMutation(v4);
            }
            [*(id *)(*((void *)&v18 + 1) + 8 * i) recursivelyPerformSelectorIfImplemented:sel_willBeginReadMode];
          }
          uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v23 count:16];
        }
        while (v6);
      }
      objc_msgSend((id)-[TSDCanvasLayerHosting asiOSCVC](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "asiOSCVC"), "resetGesturesForContextSwitch");
    }
    else
    {
      long long v16 = 0uLL;
      long long v17 = 0uLL;
      long long v14 = 0uLL;
      long long v15 = 0uLL;
      id v9 = [(TSDCanvas *)self->mCanvas topLevelReps];
      uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v15;
        do
        {
          for (uint64_t j = 0; j != v11; ++j)
          {
            if (*(void *)v15 != v12) {
              objc_enumerationMutation(v9);
            }
            [*(id *)(*((void *)&v14 + 1) + 8 * j) recursivelyPerformSelectorIfImplemented:sel_willEndReadMode];
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
        }
        while (v11);
      }
    }
    [(TSDInteractiveCanvasController *)self layoutInvalidated];
  }
}

- (BOOL)usesAlternateDrawableSelectionHighlight
{
  return self->mUsesAlternateDrawableSelectionHighlight;
}

- (void)setUsesAlternateDrawableSelectionHighlight:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (self->mUsesAlternateDrawableSelectionHighlight != a3)
  {
    self->mUsesAlternateDrawableSelectionHighlight = a3;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v4 = [(TSDCanvas *)self->mCanvas topLevelReps];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
          [v9 recursivelyPerformSelectorIfImplemented:sel_i_invalidateSelectionHighlightLayer];
          [v9 recursivelyPerformSelectorIfImplemented:sel_invalidateKnobs];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }
    [(TSDInteractiveCanvasController *)self layoutInvalidated];
  }
}

- (void)i_invalidateSelectionHighlightLayers
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = [(TSDCanvas *)self->mCanvas topLevelReps];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * i) recursivelyPerformSelectorIfImplemented:sel_i_invalidateSelectionHighlightLayer];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
  [(TSDInteractiveCanvasController *)self layoutInvalidated];
}

- (void)beginScrollingOperation
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = [(TSDInteractiveCanvasController *)self p_decorators];
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
        uint64_t v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          [v7 willBeginScrollingOperation];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)endScrollingOperation
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = [(TSDInteractiveCanvasController *)self p_decorators];
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
        uint64_t v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          [v7 didEndScrollingOperation];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)p_beginZoomingOperation
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v3 = [(TSDInteractiveCanvasController *)self p_decorators];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v20;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(v3);
        }
        long long v8 = *(void **)(*((void *)&v19 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          [v8 willBeginZoomingOperation];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v5);
  }
  long long v9 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:@"opacity"];
  [v9 setDuration:0.15];
  objc_msgSend(v9, "setToValue:", objc_msgSend(NSNumber, "numberWithFloat:", 0.0));
  [v9 setRemovedOnCompletion:0];
  [v9 setFillMode:*MEMORY[0x263F15AB0]];
  long long v10 = (NSArray *)[(NSArray *)[(CALayer *)[(TSDInteractiveCanvasController *)self overlayLayer] sublayers] copy];
  self->mLayersWithZoomFadeAnimation = v10;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * v14++) addAnimation:v9 forKey:@"TSDInteractiveCanvasControllerBeginZoomingOperation"];
      }
      while (v12 != v14);
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (void)p_endZoomingOperation
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v3 = [(TSDInteractiveCanvasController *)self p_decorators];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(v3);
        }
        long long v8 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          [v8 didEndZoomingOperation];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v5);
  }
  objc_msgSend((id)-[TSDCanvasLayerHosting canvasLayer](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "canvasLayer"), "layoutIfNeededIgnoringDisabledLayout");
  long long v9 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:@"opacity"];
  [v9 setDuration:0.15];
  objc_msgSend(v9, "setFromValue:", objc_msgSend(NSNumber, "numberWithFloat:", 0.0));
  [v9 setRemovedOnCompletion:1];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v17 = self;
  mLayersWithZoomFadeAnimation = self->mLayersWithZoomFadeAnimation;
  uint64_t v11 = [(NSArray *)mLayersWithZoomFadeAnimation countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(mLayersWithZoomFadeAnimation);
        }
        long long v15 = *(void **)(*((void *)&v18 + 1) + 8 * j);
        long long v16 = NSNumber;
        [v15 opacity];
        objc_msgSend(v9, "setToValue:", objc_msgSend(v16, "numberWithFloat:"));
        [v15 addAnimation:v9 forKey:@"TSDInteractiveCanvasControllerEndZoomingOperation"];
        [v15 removeAnimationForKey:@"TSDInteractiveCanvasControllerBeginZoomingOperation"];
      }
      uint64_t v12 = [(NSArray *)mLayersWithZoomFadeAnimation countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v12);
  }

  v17->mLayersWithZoomFadeAnimation = 0;
}

- (void)setShowInvisibleObjects:(BOOL)a3
{
  if (self->mShowInvisibleObjects != a3)
  {
    self->mShowInvisibleObjects = a3;
    [(TSDInteractiveCanvasController *)self layoutInvalidated];
  }
}

- (TSDDynamicOperationController)dynamicOperationController
{
  id result = self->mDynOpController;
  if (!result)
  {
    id result = [[TSDDynamicOperationController alloc] initWithInteractiveCanvasController:self];
    self->mDynOpController = result;
  }
  return result;
}

- (TSDTrackerManipulatorCoordinator)tmCoordinator
{
  id result = self->mTMCoordinator;
  if (!result)
  {
    id result = objc_alloc_init(TSDTrackerManipulatorCoordinator);
    self->mTMCoordinator = result;
  }
  return result;
}

- (TSDGestureDispatcher)gestureDispatcher
{
  id result = self->mGestureDispatcher;
  if (!result)
  {
    id result = [[TSDGestureDispatcher alloc] initWithInteractiveCanvasController:self];
    self->mGestureDispatcher = result;
  }
  return result;
}

- (id)hitRepChromeAtUnscaledPoint:(CGPoint)a3
{
  return 0;
}

- (void)updateSelectionForTapAtPoint:(CGPoint)a3 extendingSelection:(BOOL)a4
{
  BOOL v4 = a4;
  double y = a3.y;
  double x = a3.x;
  long long v8 = [(TSDInteractiveCanvasController *)self canvasEditor];
  long long v9 = objc_msgSend(-[TSDInteractiveCanvasController hitRep:](self, "hitRep:", x, y), "repForSelecting");
  if (v9)
  {
    long long v10 = v9;
    uint64_t v11 = (void *)[v9 parentRepToPerformSelecting];
    if (v11)
    {
      [v11 selectChildRep:v10];
    }
    else if (v4)
    {
      [(TSDInteractiveCanvasController *)self endEditing];
      uint64_t v12 = [(TSDCanvasEditor *)[(TSDInteractiveCanvasController *)self canvasEditor] canvasSelection];
      if (!v12) {
        uint64_t v12 = [(TSDCanvasEditor *)v8 canvasSelectionWithInfos:0];
      }
      uint64_t v13 = [v10 info];
      if ([v10 isSelectedIgnoringLocking]) {
        uint64_t v14 = [(TSDCanvasSelection *)v12 copyExcludingInfo:v13];
      }
      else {
        uint64_t v14 = [(TSDCanvasSelection *)v12 copyIncludingInfo:v13];
      }
      id v15 = (id)v14;
      [(TSDCanvasEditor *)v8 setSelection:v14];
    }
    else if ([v10 isSelectedIgnoringLocking])
    {
      [(TSDInteractiveCanvasController *)self updateSelectionForTapOnSelectedRep:v10];
    }
    else
    {
      [(TSDInteractiveCanvasController *)self endEditing];
      [(TSDCanvasEditor *)v8 setSelectionToRep:v10];
    }
  }
  else if (!v4)
  {
    [(TSDInteractiveCanvasController *)self endEditing];
    [(TSDCanvasEditor *)v8 setSelectionToInfo:0];
  }
}

- (BOOL)handleSingleTapAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = -[TSDInteractiveCanvasController hitRep:](self, "hitRep:");
  uint64_t v7 = (void *)[v6 repForHandleSingleTap];
  if (v7
    && ([v6 isLocked] && !objc_msgSend(v6, "wantsToHandleTapsWhenLocked")
     || (objc_msgSend(v7, "handleSingleTapAtPoint:", x, y) & 1) == 0))
  {
    -[TSDInteractiveCanvasController updateSelectionForTapAtPoint:extendingSelection:](self, "updateSelectionForTapAtPoint:extendingSelection:", 0, x, y);
  }
  return v7 != 0;
}

- (BOOL)handleDoubleTapAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = objc_msgSend(-[TSDInteractiveCanvasController hitRep:](self, "hitRep:"), "repForSelecting");
  uint64_t v7 = v6;
  if (v6)
  {
    if ([v6 info])
    {
      long long v8 = [(TSDInteractiveCanvasController *)self canvasEditor];
      -[TSDCanvasEditor setSelection:](v8, "setSelection:", -[TSDCanvasEditor canvasSelectionWithInfos:](v8, "canvasSelectionWithInfos:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObject:", objc_msgSend(v7, "info"))));
    }
    if (([v7 isLocked] & 1) == 0) {
      objc_msgSend(v7, "handleDoubleTapAtPoint:", x, y);
    }
  }
  return v7 != 0;
}

- (void)tappedCanvasBackgroundAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if ([(TSDCanvasEditor *)[(TSDInteractiveCanvasController *)self canvasEditor] selection]) {
    int v6 = ![(TSDCanvasSelection *)[(TSDCanvasEditor *)[(TSDInteractiveCanvasController *)self canvasEditor] canvasSelection] isEmpty];
  }
  else {
    int v6 = 0;
  }
  [(TSDCanvasEditor *)[(TSDInteractiveCanvasController *)self canvasEditor] setSelection:0];
  BOOL v7 = [(TSDInteractiveCanvasController *)self p_endEditingToBeginEditingRep:0];
  long long v8 = [(TSDCanvasEditor *)[(TSDInteractiveCanvasController *)self canvasEditor] canvasSelection];
  if (v8 && [(TSDCanvasSelection *)v8 infoCount])
  {
    p_mDelegate = &self->mDelegate;
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      return;
    }
    BOOL v10 = 0;
LABEL_10:
    if (-[TSDInteractiveCanvasControllerDelegate tappedCanvasBackgroundAtPoint:](*p_mDelegate, "tappedCanvasBackgroundAtPoint:", x, y)|| !v10)
    {
      return;
    }
    goto LABEL_12;
  }
  p_mDelegate = &self->mDelegate;
  if (objc_opt_respondsToSelector())
  {
    BOOL v10 = !v7;
    goto LABEL_10;
  }
  if (v7) {
    return;
  }
LABEL_12:
  int v11 = objc_msgSend((id)-[TSDCanvasLayerHosting asiOSCVC](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "asiOSCVC"), "contextMenuMightBeDisplayed") | v6;
  uint64_t v12 = (void *)[(TSDCanvasLayerHosting *)[(TSDInteractiveCanvasController *)self layerHost] asiOSCVC];
  if (v11 == 1)
  {
    [v12 hideEditMenu];
  }
  else
  {
    [v12 showEditMenu:0];
  }
}

- (id)gestureTargetStack:(id)a3
{
  uint64_t v5 = (void *)[MEMORY[0x263EFF8C0] array];
  if (![(TSDInteractiveCanvasController *)self currentlyScrolling])
  {
    uint64_t v5 = (void *)[MEMORY[0x263EFF980] array];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v8 = [(TSDInteractiveCanvasControllerDelegate *)self->mDelegate interactiveCanvasController:self primaryTargetForGesture:a3];
      if (v8) {
        [v5 addObject:v8];
      }
    }
    [(TSDEditorController *)[(TSDInteractiveCanvasController *)self editorController] textInputEditor];
    uint64_t v9 = TSUProtocolCast();
    if (v9) {
      [v5 addObject:v9];
    }
    [a3 unscaledLocationForICC:self];
    double v11 = v10;
    double v13 = v12;
    id v14 = -[TSDInteractiveCanvasController hitRep:withGesture:passingTest:](self, "hitRep:withGesture:passingTest:", a3, &__block_literal_global_782);
    uint64_t v15 = TSUProtocolCast();
    if (v15)
    {
      uint64_t v16 = v15;
      do
      {
        [v5 addObject:v16];
        id v14 = (id)[v14 parentRep];
        uint64_t v16 = TSUProtocolCast();
      }
      while (v16);
    }
    id v17 = -[TSDInteractiveCanvasController hitRep:withGesture:passingTest:](self, "hitRep:withGesture:passingTest:", a3, &__block_literal_global_784, v11, v13);
    uint64_t v18 = [v17 parentRep];
    if (v18)
    {
      long long v19 = (void *)v18;
      do
      {
        uint64_t v20 = TSUProtocolCast();
        if (v20)
        {
          uint64_t v21 = v20;
          if (objc_opt_respondsToSelector())
          {
            if ([v19 canHandleGesture:a3 forChildRep:v17]) {
              [v5 addObject:v21];
            }
          }
        }
        long long v19 = (void *)[v19 parentRep];
      }
      while (v19);
    }
    uint64_t v22 = TSUProtocolCast();
    if (v22) {
      [v5 addObject:v22];
    }
    if (objc_opt_respondsToSelector())
    {
      uint64_t v23 = [(TSDInteractiveCanvasControllerDelegate *)self->mDelegate additionalGestureTargetsForInteractiveCanvasController:self gesture:a3];
      if (v23) {
        [v5 addObjectsFromArray:v23];
      }
    }
    if (objc_opt_respondsToSelector()) {
      [(TSDInteractiveCanvasControllerDelegate *)self->mDelegate interactiveCanvasController:self updateGestureTargetStack:v5 gesture:a3];
    }
    return v5;
  }
  [(TSDInteractiveCanvasController *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return v5;
  }
  int v6 = [(TSDInteractiveCanvasController *)self delegate];
  return (id)[(TSDInteractiveCanvasControllerDelegate *)v6 interactiveCanvasController:self gestureTargetStackWhenScrollingWithGesture:a3];
}

uint64_t __53__TSDInteractiveCanvasController_gestureTargetStack___block_invoke(uint64_t a1, void *a2)
{
  return [a2 conformsToProtocol:&unk_26D7B74F8];
}

uint64_t __53__TSDInteractiveCanvasController_gestureTargetStack___block_invoke_2()
{
  return 1;
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  mCurrentAnimation = self->mCurrentAnimation;
  if (mCurrentAnimation)
  {
    return [(TSDCanvasAnimation *)mCurrentAnimation actionForLayer:a3 forKey:a4];
  }
  else
  {
    mRepsByRepLayer = self->mRepsByRepLayer;
    if (mRepsByRepLayer && CFDictionaryGetValue(mRepsByRepLayer, a3)
      || (mRepsByContainerLayer = self->mRepsByContainerLayer) != 0 && CFDictionaryGetValue(mRepsByContainerLayer, a3)
      || self->mRepContainerLayer == a3
      || self->mOverlayLayer == a3
      || (CALayer *)objc_msgSend(a3, "superlayer", a3, a4) == self->mOverlayLayer
      || ![a3 superlayer]
      || self->mPopoutLayer == a3
      || (CALayer *)[a3 superlayer] == self->mPopoutLayer)
    {
      double v10 = (void *)MEMORY[0x263EFF9D0];
      return (id)[v10 null];
    }
    else
    {
      return 0;
    }
  }
}

- (void)drawLayer:(id)a3 inContext:(CGContext *)a4
{
  if (!self->mShouldSuppressRendering)
  {
    uint64_t v5 = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", a3, @"TSDInteractiveCanvasControllerLayerKey", objc_msgSend(MEMORY[0x263F08D40], "valueWithPointer:", a4), @"TSDInteractiveCanvasControllerContextKey", 0);
    if (+[TSDTilingBackgroundQueue isHoldingReadLockFromBackgroundQueue])
    {
      [(TSDInteractiveCanvasController *)self p_drawLayerWithReadLock:v5];
    }
    else
    {
      int v6 = [(TSKDocumentRoot *)[(TSDInteractiveCanvasController *)self documentRoot] accessController];
      if (!v6)
      {
        BOOL v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v8 = [NSString stringWithUTF8String:"-[TSDInteractiveCanvasController drawLayer:inContext:]"];
        objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 4621, @"invalid nil value for '%s'", "ac");
      }
      [(TSKAccessController *)v6 performRead:sel_p_drawLayerWithReadLock_ withTarget:self argument:v5];
    }
  }
}

- (BOOL)shouldLayoutTilingLayer:(id)a3
{
  if ((objc_msgSend((id)-[TSDCanvasLayerHosting canvasLayer](-[TSDInteractiveCanvasController layerHost](self, "layerHost", a3), "canvasLayer"), "isLayoutDisabled") & 1) != 0|| self->mAnimatingViewScale)
  {
    return 0;
  }
  if ([MEMORY[0x263F08B88] isMainThread]
    && self->mForceTilingLayoutOnThreadWhenScrolling
    && self->mCurrentlyWaitingOnThreadedLayoutAndRender)
  {
    return ![(TSDInteractiveCanvasController *)self p_currentlyScrolling];
  }
  return 1;
}

- (CGRect)visibleBoundsForTilingLayer:(id)a3
{
  if (!a3)
  {
    uint64_t v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSDInteractiveCanvasController visibleBoundsForTilingLayer:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 4639, @"invalid nil value for '%s'", "layer");
  }
  BOOL v7 = (void *)[(TSDCanvasLayerHosting *)[(TSDInteractiveCanvasController *)self layerHost] canvasLayer];
  [a3 bounds];
  objc_msgSend(v7, "convertRect:fromLayer:", a3);
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  [(TSDInteractiveCanvasController *)self visibleBoundsRectForTiling];
  v24.origin.double x = v9;
  v24.origin.double y = v11;
  v24.size.double width = v13;
  v24.size.double height = v15;
  CGRect v22 = CGRectIntersection(v21, v24);
  objc_msgSend(v7, "convertRect:toLayer:", a3, v22.origin.x, v22.origin.y, v22.size.width, v22.size.height);
  result.size.double height = v19;
  result.size.double width = v18;
  result.origin.double y = v17;
  result.origin.double x = v16;
  return result;
}

- (BOOL)canDrawTilingLayerInBackground:(id)a3
{
  int v5 = [(TSDInteractiveCanvasController *)self supportsBackgroundTileRendering];
  if (v5)
  {
    Value = (void *)CFDictionaryGetValue(self->mRepsByRepLayer, a3);
    if (Value)
    {
      LOBYTE(v5) = [Value canDrawTilingLayerInBackground:a3];
    }
    else
    {
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (BOOL)shouldBeginDrawingTilingLayerInBackground:(id)a3 returningToken:(id *)a4 andQueue:(id *)a5
{
  Value = (void *)CFDictionaryGetValue(self->mRepsByRepLayer, a3);
  double v8 = Value;
  if (Value)
  {
    id v9 = Value;
    *a4 = v8;
    *a5 = (id)objc_msgSend(v8, "i_tileQueue");
  }
  return v8 != 0;
}

- (void)didEndDrawingTilingLayerInBackground:(id)a3 withToken:(id)a4
{
}

- (BOOL)mustDrawTilingLayerOnMainThread:(id)a3
{
  Value = (void *)CFDictionaryGetValue(self->mRepsByRepLayer, a3);
  if (Value)
  {
    LOBYTE(Value) = [Value mustDrawOnMainThreadForInteractiveCanvas];
  }
  return (char)Value;
}

- (id)queueForDrawingTilingLayerInBackground:(id)a3
{
  Value = (void *)CFDictionaryGetValue(self->mRepsByRepLayer, a3);
  if (![(TSDInteractiveCanvasController *)self supportsBackgroundTileRendering]
    || ([Value mustDrawOnMainThreadForInteractiveCanvas] & 1) != 0)
  {
    return 0;
  }
  return (id)objc_msgSend(Value, "i_tileQueue");
}

- (void)backgroundLayoutAndRenderState:(id)a3 performWorkInBackgroundTilingOnly:(BOOL)a4
{
  if (objc_msgSend(MEMORY[0x263F08B88], "isMainThread", a3))
  {
    uint64_t v6 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v7 = [NSString stringWithUTF8String:"-[TSDInteractiveCanvasController backgroundLayoutAndRenderState:performWorkInBackgroundTilingOnly:]"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 4748, @"should be called on a BG thread");
  }
  double v8 = [(TSKDocumentRoot *)[(TSDInteractiveCanvasController *)self documentRoot] accessController];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __99__TSDInteractiveCanvasController_backgroundLayoutAndRenderState_performWorkInBackgroundTilingOnly___block_invoke;
  v9[3] = &unk_2646B1410;
  v9[4] = self;
  BOOL v10 = a4;
  [(TSKAccessController *)v8 performRead:v9];
}

uint64_t __99__TSDInteractiveCanvasController_backgroundLayoutAndRenderState_performWorkInBackgroundTilingOnly___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __99__TSDInteractiveCanvasController_backgroundLayoutAndRenderState_performWorkInBackgroundTilingOnly___block_invoke_2;
  v3[3] = &unk_2646B1410;
  v3[4] = v1;
  char v4 = *(unsigned char *)(a1 + 40);
  return objc_msgSend(v1, "p_acquireLockAndPerformAction:", v3);
}

uint64_t __99__TSDInteractiveCanvasController_backgroundLayoutAndRenderState_performWorkInBackgroundTilingOnly___block_invoke_2(uint64_t result)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(*(void *)(result + 32) + 418))
  {
    uint64_t v1 = result;
    [MEMORY[0x263F158F8] begin];
    [MEMORY[0x263F158F8] activateBackground:1];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v2 = (void *)[*(id *)(*(void *)(v1 + 32) + 16) topLevelReps];
    uint64_t v3 = [v2 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v31 != v5) {
            objc_enumerationMutation(v2);
          }
          [*(id *)(*((void *)&v30 + 1) + 8 * i) recursivelyPerformSelectorIfImplemented:sel_willLayoutAndRenderInBackground];
        }
        uint64_t v4 = [v2 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v4);
    }
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(v1 + 32), "layerHost"), "canvasLayer"), "setNeedsLayoutForTilingLayers");
    if (!*(unsigned char *)(v1 + 40))
    {
      [*(id *)(v1 + 32) layoutIfNeeded];
      uint64_t v25 = v1;
      if ([*(id *)(*(void *)(v1 + 32) + 432) count])
      {
        uint64_t v7 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:@"opacity"];
        objc_msgSend(v7, "setFromValue:", objc_msgSend(NSNumber, "numberWithFloat:", 0.0));
        double v8 = objc_msgSend((id)objc_msgSend(*(id *)(v1 + 32), "layerHost"), "clippingLayer");
        [v8 bounds];
        CGFloat v10 = v9;
        CGFloat v12 = v11;
        CGFloat v14 = v13;
        CGFloat v16 = v15;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        double v17 = *(void **)(*(void *)(v1 + 32) + 432);
        uint64_t v18 = [v17 countByEnumeratingWithState:&v26 objects:v34 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v27;
          do
          {
            for (uint64_t j = 0; j != v19; ++j)
            {
              if (*(void *)v27 != v20) {
                objc_enumerationMutation(v17);
              }
              CGRect v22 = *(void **)(*((void *)&v26 + 1) + 8 * j);
              if (([v22 isHidden] & 1) == 0)
              {
                uint64_t v23 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
                uint64_t v24 = [NSString stringWithUTF8String:"-[TSDInteractiveCanvasController backgroundLayoutAndRenderState:performWorkInBackgroundTilingOnly:]_block_invoke_2"];
                objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 4774, @"should have hidden this layer just after creating it");
              }
              [v22 bounds];
              objc_msgSend(v8, "convertRect:fromLayer:", v22);
              v38.origin.double x = v10;
              v38.origin.double y = v12;
              v38.size.double width = v14;
              v38.size.double height = v16;
              if (CGRectIntersectsRect(v37, v38)) {
                [v22 addAnimation:v7 forKey:@"fade in"];
              }
              [v22 setHidden:0];
            }
            uint64_t v19 = [v17 countByEnumeratingWithState:&v26 objects:v34 count:16];
          }
          while (v19);
        }
      }
      uint64_t v1 = v25;

      *(void *)(*(void *)(v25 + 32) + 432) = 0;
    }
    [MEMORY[0x263F158F8] commit];
    [MEMORY[0x263F158F8] flush];
    *(unsigned char *)(*(void *)(v1 + 32) + 418) = 0;
    return [*(id *)(v1 + 32) didLayoutAndRenderOnThread];
  }
  return result;
}

- (BOOL)backgroundLayoutAndRenderState:(id)a3 shouldDispatchBackgroundWork:(id)a4
{
  if ((objc_msgSend(MEMORY[0x263F08B88], "isMainThread", a3) & 1) == 0)
  {
    uint64_t v6 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v7 = [NSString stringWithUTF8String:"-[TSDInteractiveCanvasController backgroundLayoutAndRenderState:shouldDispatchBackgroundWork:]"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 4812, @"This operation must only be performed on the main thread.");
  }
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 1;
  }
  mDelegate = self->mDelegate;
  return [(TSDInteractiveCanvasControllerDelegate *)mDelegate interactiveCanvasController:self shouldDispatchBackgroundWork:a4];
}

- (void)backgroundLayoutAndRenderStateDidPerformBackgroundWork:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if ((objc_msgSend(MEMORY[0x263F08B88], "isMainThread", a3) & 1) == 0)
  {
    uint64_t v4 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"-[TSDInteractiveCanvasController backgroundLayoutAndRenderStateDidPerformBackgroundWork:]"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 4826, @"This operation must only be performed on the main thread.");
  }
  if (!self->mCurrentlyWaitingOnThreadedLayoutAndRender)
  {
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __89__TSDInteractiveCanvasController_backgroundLayoutAndRenderStateDidPerformBackgroundWork___block_invoke;
    v16[3] = &unk_2646AF7B8;
    v16[4] = self;
    [(TSDInteractiveCanvasController *)self p_acquireLockAndPerformAction:v16];
    if (!self->mCurrentlyScrolling) {
      [(TSDTrackingController *)[(TSDInteractiveCanvasController *)self trackingController] interactiveCanvasControllerUpdatedRepsFromLayouts:self];
    }
  }
  if (![(TSDInteractiveCanvasController *)self currentlyScrolling])
  {
    [(TSDInteractiveCanvasController *)self invalidateLayers];
    [(TSDInteractiveCanvasController *)self layoutIfNeeded];
  }
  if (objc_opt_respondsToSelector()) {
    [(TSDInteractiveCanvasControllerDelegate *)self->mDelegate interactiveCanvasControllerDidLayoutAndRenderOnBackgroundThread:self];
  }
  uint64_t v6 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  mNotificationsToPostWithValidLayouts = self->mNotificationsToPostWithValidLayouts;
  uint64_t v8 = [(NSMutableSet *)mNotificationsToPostWithValidLayouts countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(mNotificationsToPostWithValidLayouts);
        }
        [v6 postNotificationName:*(void *)(*((void *)&v12 + 1) + 8 * i) object:self];
      }
      uint64_t v9 = [(NSMutableSet *)mNotificationsToPostWithValidLayouts countByEnumeratingWithState:&v12 objects:v17 count:16];
    }
    while (v9);
  }
  [(NSMutableSet *)self->mNotificationsToPostWithValidLayouts removeAllObjects];
}

uint64_t __89__TSDInteractiveCanvasController_backgroundLayoutAndRenderStateDidPerformBackgroundWork___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "p_updateViewsFromReps");
}

- (void)scrollViewDidScroll:(id)a3
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  if (!self->mIgnoreContentOffsetChanges)
  {
    double v5 = *MEMORY[0x263F001A0];
    double v6 = *(double *)(MEMORY[0x263F001A0] + 8);
    double v7 = *(double *)(MEMORY[0x263F001A0] + 16);
    double v8 = *(double *)(MEMORY[0x263F001A0] + 24);
    -[TSDInteractiveCanvasController setP_visibleBoundsRectForTiling:](self, "setP_visibleBoundsRectForTiling:", *MEMORY[0x263F001A0], v6, v7, v8);
    BOOL v9 = ([a3 isScrolling] & 1) != 0 || self->mAnimatingScroll;
    self->mCurrentlyScrolling = v9;
    -[TSDInteractiveCanvasController setP_visibleUnscaledRect:](self, "setP_visibleUnscaledRect:", v5, v6, v7, v8);
    if (!self->mCurrentlyScrolling) {
      [(TSDInteractiveCanvasController *)self p_viewScrollingEnded];
    }
    if (self->mPopoutLayer)
    {
      objc_msgSend((id)-[TSDCanvasLayerHosting canvasLayer](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "canvasLayer"), "bounds");
      double v11 = v10;
      double v13 = v12;
      objc_msgSend((id)objc_msgSend((id)-[TSDCanvasLayerHosting canvasView](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "canvasView"), "canvasLayer"), "contentInset");
      double v15 = v14;
      double v17 = v16;
      [a3 frame];
      double v19 = v18;
      [a3 contentOffset];
      double v21 = v11 + v19 - v20 - v17;
      [a3 frame];
      double v23 = v22;
      [a3 contentOffset];
      double v25 = v13 + v23 - v24 - v15;
      [(CALayer *)self->mPopoutLayer position];
      if (v27 != v21 || v26 != v25) {
        -[CALayer setPosition:](self->mPopoutLayer, "setPosition:", v21, v25);
      }
      [(TSDInteractiveCanvasController *)self visibleBoundsRect];
      CGFloat v30 = v29;
      CGFloat v32 = v31;
      CGFloat v34 = v33;
      CGFloat v36 = v35;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      CGRect v37 = [(CALayer *)self->mPopoutLayer sublayers];
      uint64_t v38 = [(NSArray *)v37 countByEnumeratingWithState:&v43 objects:v47 count:16];
      if (v38)
      {
        uint64_t v39 = v38;
        uint64_t v40 = *(void *)v44;
        do
        {
          for (uint64_t i = 0; i != v39; ++i)
          {
            if (*(void *)v44 != v40) {
              objc_enumerationMutation(v37);
            }
            double v42 = *(void **)(*((void *)&v43 + 1) + 8 * i);
            [v42 frame];
            v50.origin.double x = v30;
            v50.origin.double y = v32;
            v50.size.double width = v34;
            v50.size.double height = v36;
            objc_msgSend(v42, "setHidden:", !CGRectIntersectsRect(v49, v50));
          }
          uint64_t v39 = [(NSArray *)v37 countByEnumeratingWithState:&v43 objects:v47 count:16];
        }
        while (v39);
      }
    }
    [(TSDInteractiveCanvasController *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [(TSDInteractiveCanvasControllerDelegate *)[(TSDInteractiveCanvasController *)self delegate] interactiveCanvasControllerDidScroll:self];
    }
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "postNotificationName:object:", @"TSDCanvasUpdateScrollNotification", self);
    [(TSDInteractiveCanvasController *)self i_viewScrollDidChange];
    [(TSDInteractiveCanvasController *)self p_invalidateTilingLayers];
    if ([(TSDInteractiveCanvasController *)self shouldShowUserDefinedGuides]) {
      [(TSDInteractiveCanvasController *)self invalidateLayers];
    }
  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  self->mCurrentlyScrolling = 1;
  [(TSDInteractiveCanvasController *)self i_viewScrollWillChange];
  if (!self->mCreateRepsForOffscreenLayouts && !self->mSuspendedLowPriorityThreadDispatcher)
  {
    self->mSuspendedLowPriorityThreadDispatcher = 1;
    objc_msgSend(+[TSKLowPriorityThreadDispatcher sharedLowPriorityDispatcher](TSKLowPriorityThreadDispatcher, "sharedLowPriorityDispatcher"), "suspend");
  }
  [(TSDInteractiveCanvasController *)self beginScrollingOperation];
  [(TSDTextInputResponder *)self->mTextInputResponder canvasWillScroll];
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "postNotificationName:object:", @"TSDCanvasWillScrollNotification", self);
  [(TSDInteractiveCanvasController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    double v5 = [(TSDInteractiveCanvasController *)self delegate];
    [(TSDInteractiveCanvasControllerDelegate *)v5 interactiveCanvasController:self scrollViewWillBeginDragging:a3];
  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y = a4.y;
  double x = a4.x;
  [(TSDInteractiveCanvasController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    BOOL v9 = [(TSDInteractiveCanvasController *)self delegate];
    objc_opt_class();
    uint64_t v10 = TSUDynamicCast();
    -[TSDInteractiveCanvasControllerDelegate interactiveCanvasController:scrollViewWillEndDragging:withVelocity:targetContentOffset:](v9, "interactiveCanvasController:scrollViewWillEndDragging:withVelocity:targetContentOffset:", self, v10, a5, x, y);
  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4)
  {
    self->mCurrentlyScrolling = 0;
    [(TSDInteractiveCanvasController *)self p_viewScrollingEnded];
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  self->mCurrentlyScrolling = 0;
  [(TSDInteractiveCanvasController *)self p_viewScrollingEnded];
}

- (void)scrollView:(id)a3 willAnimateToContentOffset:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  [(TSDInteractiveCanvasController *)self i_viewScrollWillChange];
  if (self->mAnimatingScroll)
  {
    double v8 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v9 = [NSString stringWithUTF8String:"-[TSDInteractiveCanvasController scrollView:willAnimateToContentOffset:]"];
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 4979, @"scrollView:willAnimateToContentOffset: called whilst already animating");
  }
  *(_WORD *)&self->mCurrentlyScrolling = 257;
  [a3 contentOffset];
  double v12 = TSDSubtractPoints(x, y, v10);
  CGFloat v13 = v11;
  if (v12 != 0.0 || v11 != 0.0) {
    objc_msgSend((id)-[TSDCanvasLayerHosting asiOSCVC](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "asiOSCVC"), "hideEditMenu");
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "postNotificationName:object:", @"TSDCanvasWillAnimateScrollNotifiction", self);
  if (objc_opt_respondsToSelector())
  {
    [(TSDInteractiveCanvasController *)self visibleBoundsRect];
    CGRect v17 = CGRectOffset(v16, v12, v13);
    -[TSDInteractiveCanvasController convertBoundsToUnscaledRect:](self, "convertBoundsToUnscaledRect:", v17.origin.x, v17.origin.y, v17.size.width, v17.size.height);
    mDelegate = self->mDelegate;
    -[TSDInteractiveCanvasControllerDelegate interactiveCanvasController:willAnimateScrollToVisibleUnscaledRect:](mDelegate, "interactiveCanvasController:willAnimateScrollToVisibleUnscaledRect:", self);
  }
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  self->mAnimatingScroll = 0;
  [(TSDInteractiveCanvasController *)self performSelector:sel_p_scrollViewDidEndScrollingAnimation_ withObject:a3 afterDelay:0.0];
}

- (void)scrollViewDidScrollToTop:(id)a3
{
  self->mAnimatingScroll = 0;
  [(TSDInteractiveCanvasController *)self performSelector:sel_p_scrollViewDidEndScrollingAnimation_ withObject:a3 afterDelay:0.0];
}

- (void)p_scrollViewDidEndScrollingAnimation:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(TSDInteractiveCanvasController *)self i_syncWithLayoutThread];
    [(TSDInteractiveCanvasController *)self scrollViewDidScroll:a3];
  }
  if ([a3 isScrolling])
  {
    self->mCurrentlyScrolling = 1;
  }
  else
  {
    BOOL mAnimatingScroll = self->mAnimatingScroll;
    self->mCurrentlyScrolling = mAnimatingScroll;
    if (!mAnimatingScroll) {
      [(TSDInteractiveCanvasController *)self p_viewScrollingEnded];
    }
  }
  if (objc_opt_respondsToSelector()) {
    [(TSDInteractiveCanvasControllerDelegate *)self->mDelegate interactiveCanvasControllerDidEndScrollingAnimation:self stillAnimating:self->mAnimatingScroll];
  }
  [(TSDInteractiveCanvasController *)self p_invalidateTilingLayers];
}

- (void)syncProcessChanges:(id)a3 forChangeSource:(id)a4
{
  uint64_t v6 = TSUProtocolCast();
  if (v6)
  {
    id v7 = [(TSDInteractiveCanvasController *)self layoutsForInfo:v6];
    [v7 makeObjectsPerformSelector:sel_processChanges_ withObject:a3];
  }
}

- (BOOL)selectionContainsOnlyInfosOnCanvas:(id)a3 model:(id)a4
{
  return 1;
}

- (CGPoint)scrollView:(id)a3 restrictContentOffset:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  [(TSDInteractiveCanvasController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    -[TSDInteractiveCanvasController convertBoundsToUnscaledPoint:](self, "convertBoundsToUnscaledPoint:", x, y);
    double v8 = v7;
    double v10 = v9;
    double v11 = [(TSDInteractiveCanvasController *)self delegate];
    [(TSDInteractiveCanvasController *)self viewScale];
    -[TSDInteractiveCanvasControllerDelegate interactiveCanvasController:restrictedContentOffset:forViewScale:](v11, "interactiveCanvasController:restrictedContentOffset:forViewScale:", self, v8, v10, v12);
    -[TSDInteractiveCanvasController convertUnscaledToBoundsPoint:](self, "convertUnscaledToBoundsPoint:");
    double x = v13;
    double y = v14;
  }
  double v15 = x;
  double v16 = y;
  result.double y = v16;
  result.double x = v15;
  return result;
}

- (void)asyncProcessChanges:(id)a3 forChangeSource:(id)a4
{
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    uint64_t v6 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v7 = [NSString stringWithUTF8String:"-[TSDInteractiveCanvasController asyncProcessChanges:forChangeSource:]"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 5095, @"async change notifications should only come in on the main thread");
  }
  if ([(TSDCanvas *)self->mCanvas i_needsLayout]
    && [(TSDInteractiveCanvasController *)self isCanvasInteractive])
  {
    objc_msgSend((id)-[TSDCanvasLayerHosting canvasLayer](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "canvasLayer"), "setNeedsLayout");
  }
  uint64_t v8 = TSUProtocolCast();
  if (v8)
  {
    id v9 = [(TSDInteractiveCanvasController *)self repsForInfo:v8];
    [v9 makeObjectsPerformSelector:sel_processChanges_ withObject:a3];
  }
}

- (void)p_willEnterForeground:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = [(TSDCanvas *)self->mCanvas topLevelReps];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * i) recursivelyPerformSelector:sel_i_willEnterForeground];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)p_acquireLockAndPerformAction:(id)a3
{
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  uint64_t v7 = __64__TSDInteractiveCanvasController_p_acquireLockAndPerformAction___block_invoke;
  long long v8 = &unk_2646B1438;
  long long v9 = self;
  id v10 = a3;
  long long v11 = &v12;
  if (objc_opt_respondsToSelector()) {
    [(TSDInteractiveCanvasControllerDelegate *)self->mDelegate interactiveCanvasController:self performLockedAction:v6];
  }
  else {
    v7(v6);
  }
  if (!*((unsigned char *)v13 + 24))
  {
    uint64_t v4 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"-[TSDInteractiveCanvasController p_acquireLockAndPerformAction:]"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 5152, @"failed to perform locked action");
  }
  _Block_object_dispose(&v12, 8);
}

uint64_t __64__TSDInteractiveCanvasController_p_acquireLockAndPerformAction___block_invoke(void *a1)
{
  [*(id *)(a1[4] + 632) lock];
  (*(void (**)(void))(a1[5] + 16))();
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  id v2 = *(void **)(a1[4] + 632);
  return [v2 unlock];
}

- (void)deselectAll:(id)a3
{
  if ([(TSDEditorController *)[(TSDInteractiveCanvasController *)self editorController] editorForEditAction:a2 withSender:a3])
  {
    [(TSDInteractiveCanvasController *)self makeEditorPerformAction:a2 withSender:a3];
  }
  else
  {
    [(TSDInteractiveCanvasController *)self endEditing];
    uint64_t v6 = [(TSDInteractiveCanvasController *)self canvasEditor];
    [(TSDCanvasEditor *)v6 setSelection:0];
  }
}

- (void)makeEditorPerformAction:(SEL)a3 withSender:(id)a4
{
  uint64_t v7 = [(TSKDocumentRoot *)[(TSDInteractiveCanvasController *)self documentRoot] accessController];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __69__TSDInteractiveCanvasController_makeEditorPerformAction_withSender___block_invoke;
  v8[3] = &unk_2646B06B0;
  v8[5] = a4;
  v8[6] = a3;
  v8[4] = self;
  [(TSKAccessController *)v7 performRead:v8];
}

void *__69__TSDInteractiveCanvasController_makeEditorPerformAction_withSender___block_invoke(uint64_t a1)
{
  CGPoint result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "editorController"), "editorForEditAction:withSender:", *(void *)(a1 + 48), *(void *)(a1 + 40));
  if (result)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v3 = *(void *)(a1 + 48);
    return (void *)[result performSelector:v3 withObject:v4];
  }
  return result;
}

- (BOOL)shouldResampleImages
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 1;
  }
  mDelegate = self->mDelegate;
  return [(TSDInteractiveCanvasControllerDelegate *)mDelegate interactiveCanvasControllerShouldResampleImages:self];
}

- (BOOL)canPerformInteractiveAction:(SEL)a3 withSender:(id)a4
{
  int v8 = 0;
  if ([(TSDEditorController *)[(TSDInteractiveCanvasController *)self editorController] editorForEditAction:a3 withSender:a4 response:&v8])
  {
    goto LABEL_2;
  }
  if (v8 == -1)
  {
    LOBYTE(isEqual) = 0;
  }
  else
  {
    if (sel_isEqual(a3, sel_deselectAll_))
    {
LABEL_2:
      LOBYTE(isEqual) = 1;
      return isEqual;
    }
    if (sel_isEqual(a3, sel_nextAnnotation_) || (BOOL isEqual = sel_isEqual(a3, sel_previousAnnotation_))) {
      LOBYTE(isEqual) = [(TSDInteractiveCanvasController *)self hasAnnotations];
    }
  }
  return isEqual;
}

- (void)changeFirstResponderIfNecessary
{
}

- (void)p_maybeSetTextResponderEditorTo:(id)a3
{
  if (![(TSDInteractiveCanvasController *)self keyboardSuppressedAndTextInputEditorIgnoresFirstResponderChanges]&& (a3|| !self->mPreventSettingNilEditorOnTextResponder&& (!self->mTextInputResponderShareCount|| ![(TSDTextInputResponder *)self->mTextInputResponder editor]|| ([[(TSDTextInputResponder *)self->mTextInputResponder editor] wantsKeyboard] & 1) == 0)))
  {
    mTextInputResponder = self->mTextInputResponder;
    [(TSDTextInputResponder *)mTextInputResponder setEditor:a3];
  }
}

- (void)beginAnimations:(id)a3 context:(void *)a4
{
  if (self->mCurrentAnimation)
  {
    uint64_t v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"-[TSDInteractiveCanvasController beginAnimations:context:]"];
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 5343, @"animation nesting not yet supported");
  }
  [MEMORY[0x263F158F8] flush];
  [MEMORY[0x263F158F8] begin];
  self->mCurrentAnimation = [[TSDCanvasAnimation alloc] initWithAnimationID:a3 interactiveCanvasController:self context:a4];
}

- (void)commitAnimations
{
  if (!self->mCurrentAnimation)
  {
    uint64_t v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSDInteractiveCanvasController commitAnimations]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 5353, @"can't commit if we don't have an animation open");
  }
  [MEMORY[0x263F158F8] commit];

  self->mCurrentAnimation = 0;
}

- (void)setAnimationDelegate:(id)a3
{
}

- (void)setAnimationWillStartSelector:(SEL)a3
{
}

- (void)setAnimationDidStopSelector:(SEL)a3
{
}

- (void)setAnimationDuration:(double)a3
{
}

- (double)animationDuration
{
  [(TSDCanvasAnimation *)self->mCurrentAnimation duration];
  return result;
}

- (double)animationBeginTime
{
  [(TSDCanvasAnimation *)self->mCurrentAnimation beginTime];
  return result;
}

- (void)setAnimationDelay:(double)a3
{
}

- (void)setAnimationStartDate:(id)a3
{
}

- (void)setAnimationTimingFunction:(id)a3
{
}

- (void)setAnimationRepeatCount:(float)a3
{
}

- (void)setAnimationRepeatAutoreverses:(BOOL)a3
{
}

- (void)setAnimation:(id)a3 forLayer:(id)a4 forKey:(id)a5
{
}

- (void)setAnimationCompletionBlock:(id)a3
{
}

- (void)setAnimationFilterBlock:(id)a3
{
}

- (void)setAnimationUseRepFiltering:(BOOL)a3
{
}

- (void)i_layoutRegistered:(id)a3
{
  if ([a3 info]) {
    -[TSKChangeNotifier addObserver:forChangeSource:](-[TSDInteractiveCanvasController changeNotifier](self, "changeNotifier"), "addObserver:forChangeSource:", self, [a3 info]);
  }
  if (objc_opt_respondsToSelector())
  {
    mDelegate = self->mDelegate;
    [(TSDInteractiveCanvasControllerDelegate *)mDelegate interactiveCanvasController:self layoutRegistered:a3];
  }
}

- (void)i_layoutUnregistered:(id)a3
{
  if ([a3 info]) {
    -[TSKChangeNotifier removeObserver:forChangeSource:](-[TSDInteractiveCanvasController changeNotifier](self, "changeNotifier"), "removeObserver:forChangeSource:", self, [a3 info]);
  }
  if (objc_opt_respondsToSelector())
  {
    mDelegate = self->mDelegate;
    [(TSDInteractiveCanvasControllerDelegate *)mDelegate interactiveCanvasController:self layoutUnregistered:a3];
  }
}

- (BOOL)i_needsLayout
{
  return [(TSDCanvas *)self->mCanvas i_needsLayout];
}

- (void)i_layout
{
  if (!self->mTeardownOnBackgroundThread
    && ([MEMORY[0x263F08B88] isMainThread] & 1) == 0
    && (!self->mLayoutAndRenderOnThreadDuringScroll || !self->mCurrentlyWaitingOnThreadedLayoutAndRender)
    && !self->mNestedCanvasAllowLayoutAndRenderOnThread)
  {
    uint64_t v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSDInteractiveCanvasController i_layout]"];
    [v3 handleFailureInFunction:v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 5468, @"i_layout should only be called by our CV, from the main thread or during threaded layout" file lineNumber description];
  }
  if (self->mDelegate && ![(TSDInteractiveCanvasController *)self isCanvasInteractive])
  {
    uint64_t v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSDInteractiveCanvasController i_layout]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 5469, @"should only get i_layout for interactive canvases");
  }
  if (!self->mTeardownOnBackgroundThread
    && (!self->mLayoutAndRenderOnThreadDuringScroll
     || !self->mCurrentlyWaitingOnThreadedLayoutAndRender
     && (![(TSDInteractiveCanvasController *)self p_currentlyScrolling]
      || [(TSDCanvas *)self->mCanvas i_needsLayout])))
  {
    if ([(TSDInteractiveCanvasController *)self documentRoot])
    {
      uint64_t v7 = [(TSKDocumentRoot *)[(TSDInteractiveCanvasController *)self documentRoot] accessController];
      if (!v7)
      {
        uint64_t v8 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v9 = [NSString stringWithUTF8String:"-[TSDInteractiveCanvasController i_layout]"];
        objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 5475, @"invalid nil value for '%s'", "ac");
      }
      [(TSKAccessController *)v7 performRead:sel_p_layoutWithReadLock withTarget:self argument:0];
    }
    if (self->mShouldAutoscrollToSelectionAfterLayout)
    {
      if ([MEMORY[0x263F08B88] isMainThread])
      {
        self->mShouldAutoscrollToSelectionAfterLayout = 0;
        [(TSDInteractiveCanvasController *)self p_scrollToPrimarySelectionForEditor:[(TSDEditorController *)[(TSDInteractiveCanvasController *)self editorController] textInputEditor] skipZoom:self->mSuppressAutozoomToSelectionAfterLayout];
        self->mSuppressAutozoomToSelectionAfterLayout = 0;
        self->mShouldCenterSelectionWhenAutoscrolling = 0;
      }
    }
  }
}

- (void)p_layoutWithReadLock
{
}

- (void)i_viewWillBeginZooming
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  [(TSDInteractiveCanvasController *)self viewScale];
  self->mDynamicViewScale = v3;
  self->mDynamicallyZooming = 1;
  [(TSDInteractiveCanvasController *)self p_beginZoomingOperation];
  [(TSDTextInputResponder *)self->mTextInputResponder canvasWillZoom];
  [(TSDInteractiveCanvasController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [(TSDInteractiveCanvasControllerDelegate *)[(TSDInteractiveCanvasController *)self delegate] interactiveCanvasControllerWillZoom:self];
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "postNotificationName:object:", @"TSDCanvasWillZoomNotification", self);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = [(TSDCanvas *)self->mCanvas topLevelReps];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * i) recursivelyPerformSelectorIfImplemented:sel_willBeginZooming];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
  objc_msgSend((id)-[TSDCanvasLayerHosting canvasLayer](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "canvasLayer"), "layoutIfNeeded");
}

- (void)i_viewIsZoomingAtPoint:(CGPoint)a3
{
  self->mZoomCenterInBounds = a3;
}

- (void)i_viewDidZoomToViewScale:(double)a3
{
  [(TSDInteractiveCanvasController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [(TSDInteractiveCanvasControllerDelegate *)[(TSDInteractiveCanvasController *)self delegate] interactiveCanvasControllerIsZooming:self viewScale:a3];
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "postNotificationName:object:", @"TSDCanvasUpdateZoomNotification", self);
  [(TSDInteractiveCanvasController *)self willChangeValueForKey:@"currentViewScale"];
  self->mDynamicViewScale = a3;
  [(TSDInteractiveCanvasController *)self didChangeValueForKey:@"currentViewScale"];
}

- (void)viewDidEndZooming
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  [(TSDInteractiveCanvasController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [(TSDInteractiveCanvasControllerDelegate *)[(TSDInteractiveCanvasController *)self delegate] interactiveCanvasControllerDidZoom:self];
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "postNotificationName:object:", @"TSDCanvasDidZoomNotification", self);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v3 = [(TSDCanvas *)self->mCanvas topLevelReps];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * i) recursivelyPerformSelectorIfImplemented:sel_didEndZooming];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
  [(TSDInteractiveCanvasController *)self p_endZoomingOperation];
  self->mDynamicallyZooming = 0;
}

- (void)i_canvasContentsScaleDidChange
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v3 = [(TSDInteractiveCanvasController *)self p_decorators];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v3);
        }
        long long v8 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          [v8 screenScaleDidChange];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v5);
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = [(TSDCanvas *)self->mCanvas topLevelReps];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * j) recursivelyPerformSelector:sel_screenScaleDidChange];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v11);
  }
}

- (void)i_canvasWideGamutValueDidChange
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (self->mCurrentlyWaitingOnThreadedLayoutAndRender
    && [MEMORY[0x263F08B88] isMainThread])
  {
    [(TSDInteractiveCanvasController *)self i_syncWithLayoutThread];
  }
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v3 = [(TSDCanvas *)self->mCanvas topLevelReps];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * i) recursivelyPerformSelector:sel_wideGamutValueDidChange];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)i_viewScaleDidChange
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (self->mCurrentlyWaitingOnThreadedLayoutAndRender)
  {
    id v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSDInteractiveCanvasController i_viewScaleDidChange]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 5585, @"Should not be called if waiting on background layout");
    if (self->mCurrentlyWaitingOnThreadedLayoutAndRender) {
      [(TSDInteractiveCanvasController *)self i_syncWithLayoutThread];
    }
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = [(TSDCanvas *)self->mCanvas topLevelReps];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * i) recursivelyPerformSelector:sel_viewScaleDidChange];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
  [(TSDInteractiveCanvasController *)self layoutInvalidated];
}

- (double)i_viewScaleForProposedViewScale:(double)a3 originalViewScale:(double)a4
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return a3;
  }
  mDelegate = self->mDelegate;
  [(TSDInteractiveCanvasControllerDelegate *)mDelegate canvasViewScaleForProposedViewScale:a3 originalViewScale:a4];
  return result;
}

- (CGSize)i_canvasCenterOffsetForProposedViewScale:(double)a3 originalViewScale:(double)a4
{
  if (objc_opt_respondsToSelector())
  {
    [(TSDInteractiveCanvasControllerDelegate *)self->mDelegate canvasCenterOffsetForProposedViewScale:a3 originalViewScale:a4];
  }
  else
  {
    double v7 = *MEMORY[0x263F001B0];
    double v8 = *(double *)(MEMORY[0x263F001B0] + 8);
  }
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (double)i_adjustViewScale:(double)a3
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return a3;
  }
  mDelegate = self->mDelegate;
  [(TSDInteractiveCanvasControllerDelegate *)mDelegate interactiveCanvasController:self adjustViewScale:a3];
  return result;
}

- (double)i_nextCanvasViewScaleDetentForProposedViewScale:(double)a3 greater:(BOOL)a4
{
  BOOL v4 = a4;
  if (objc_opt_respondsToSelector())
  {
    mDelegate = self->mDelegate;
    [(TSDInteractiveCanvasControllerDelegate *)mDelegate nextCanvasViewScaleDetentForProposedViewScale:v4 greater:a3];
  }
  else
  {
    long long v9 = (void *)[(TSDCanvasLayerHosting *)[(TSDInteractiveCanvasController *)self layerHost] canvasLayer];
    if (v4)
    {
      [v9 maximumPinchViewScale];
    }
    else
    {
      [v9 minimumPinchViewScale];
    }
  }
  return result;
}

- (void)i_viewScrollDidChange
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (!self->mLayoutAndRenderOnThreadDuringScroll || !self->mCurrentlyScrolling)
  {
    if (self->mCurrentlyWaitingOnThreadedLayoutAndRender)
    {
      id v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v4 = [NSString stringWithUTF8String:"-[TSDInteractiveCanvasController i_viewScrollDidChange]"];
      objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 5656, @"Shouldn't be iterating over reps during background layout");
    }
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v5 = [(TSDCanvas *)self->mCanvas topLevelReps];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v10 + 1) + 8 * i) recursivelyPerformSelector:sel_viewScrollDidChange];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (void)i_viewScrollWillChange
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (!self->mLayoutAndRenderOnThreadDuringScroll || !self->mCurrentlyScrolling)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    id v3 = [(TSDCanvas *)self->mCanvas topLevelReps];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          [*(id *)(*((void *)&v8 + 1) + 8 * i) recursivelyPerformSelector:sel_viewScrollWillChange];
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }
  }
  if (objc_opt_respondsToSelector()) {
    [(TSDInteractiveCanvasControllerDelegate *)self->mDelegate interactiveCanvasControllerWillScroll:self];
  }
  [MEMORY[0x263F158F8] flush];
}

- (void)i_viewScrollingEnded
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (!self->mLayerHostHasBeenTornDown && (!self->mLayoutAndRenderOnThreadDuringScroll || !self->mCurrentlyScrolling))
  {
    [(TSDInteractiveCanvasController *)self endScrollingOperation];
    [(NSRecursiveLock *)self->mSelfSync lock];
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    id v3 = [(TSDCanvas *)self->mCanvas topLevelReps];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          [*(id *)(*((void *)&v8 + 1) + 8 * i) recursivelyPerformSelector:sel_viewScrollingEnded];
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }
    if (objc_opt_respondsToSelector()) {
      [(TSDInteractiveCanvasControllerDelegate *)self->mDelegate interactiveCanvasControllerDidStopScrolling:self];
    }
    if (!self->mCurrentlyWaitingOnThreadedLayoutAndRender)
    {
      [(TSDInteractiveCanvasController *)self p_updateViewsFromReps];
      [(TSDTrackingController *)[(TSDInteractiveCanvasController *)self trackingController] interactiveCanvasControllerUpdatedRepsFromLayouts:self];
    }
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "postNotificationName:object:", @"TSDCanvasDidScrollNotification", self);
    if (self->mSuspendedLowPriorityThreadDispatcher)
    {
      self->mSuspendedLowPriorityThreadDispatcher = 0;
      objc_msgSend(+[TSKLowPriorityThreadDispatcher sharedLowPriorityDispatcher](TSKLowPriorityThreadDispatcher, "sharedLowPriorityDispatcher"), "resume");
    }
    [(NSRecursiveLock *)self->mSelfSync unlock];
  }
}

- (void)i_recordUserViewScale
{
  id v3 = [(TSDEditorController *)self->mEditorController textInputEditor];
  if (objc_opt_respondsToSelector())
  {
    [(TSDCanvas *)[(TSDInteractiveCanvasController *)self canvas] viewScale];
    objc_msgSend(v3, "targetPointSizeForSelectionWithViewScale:");
    if (v4 >= 12.0 && v4 <= 72.0) {
      -[TSDInteractiveCanvasController p_setTargetPointSize:](self, "p_setTargetPointSize:");
    }
  }
  if (objc_opt_respondsToSelector())
  {
    mDelegate = self->mDelegate;
    [(TSDInteractiveCanvasControllerDelegate *)mDelegate interactiveCanvasControllerDidZoomWithUserGesture:self];
  }
}

- (void)i_repNeedsDisplay:(id)a3
{
  Value = CFDictionaryGetValue(self->mRepLayersByRep, a3);
  [(TSDInteractiveCanvasController *)self setNeedsDisplayOnLayer:Value];
}

- (void)i_repNeedsDisplay:(id)a3 inRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  Value = CFDictionaryGetValue(self->mRepLayersByRep, a3);
  if (Value)
  {
    long long v11 = Value;
    objc_msgSend(a3, "convertNaturalRectToLayerRelative:", x, y, width, height);
    -[TSDInteractiveCanvasController setNeedsDisplayInRect:onLayer:](self, "setNeedsDisplayInRect:onLayer:", v11);
  }
}

- (id)i_tileStorage
{
  return self->mTileStorage;
}

- (BOOL)i_inPrintPreviewMode
{
  [(TSDInteractiveCanvasController *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  id v3 = [(TSDInteractiveCanvasController *)self delegate];
  return [(TSDInteractiveCanvasControllerDelegate *)v3 inPrintPreviewMode];
}

- (id)i_currentAnimation
{
  return self->mCurrentAnimation;
}

- (id)i_descriptionForViewScale:(double)a3
{
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (id result = (id)[(TSDInteractiveCanvasControllerDelegate *)self->mDelegate descriptionForCanvasViewScale:a3]) == 0)
  {
    LOBYTE(v7) = 0;
    uint64_t v6 = objc_msgSend(MEMORY[0x263F7C888], "numberFormatWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:", 2, 0, 0, 0, 0, 4, v7);
    return (id)[v6 stringFromDouble:a3];
  }
  return result;
}

- (CGRect)i_clippingBoundsForScrollViewEnclosingCanvas
{
  [(TSKScrollView *)[(TSDCanvasView *)[(TSDInteractiveCanvasController *)self canvasView] enclosingScrollView] bounds];
  double v3 = TSDRectWithSize();
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  if (objc_opt_respondsToSelector())
  {
    [(TSDInteractiveCanvasControllerDelegate *)self->mDelegate scrollViewClippingBoundsForInteractiveCanvasController:self];
    double v3 = v10;
    double v5 = v11;
    double v7 = v12;
    double v9 = v13;
  }
  double v14 = v3;
  double v15 = v5;
  double v16 = v7;
  double v17 = v9;
  result.size.double height = v17;
  result.size.double width = v16;
  result.origin.double y = v15;
  result.origin.double x = v14;
  return result;
}

- (id)i_topLevelLayersForTiling
{
  double v3 = [(TSDInteractiveCanvasController *)self p_cachedTopLevelTilingLayers];
  if (!v3)
  {
    if (self->_directLayerHostProvider)
    {
      double v3 = (NSSet *)[MEMORY[0x263F7C878] set];
      mDirectLayerHostsByRep = self->mDirectLayerHostsByRep;
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      void v6[2] = __59__TSDInteractiveCanvasController_i_topLevelLayersForTiling__block_invoke;
      v6[3] = &unk_2646B1460;
      v6[4] = v3;
      [(__CFDictionary *)mDirectLayerHostsByRep enumerateKeysAndObjectsUsingBlock:v6];
    }
    else
    {
      double v3 = (NSSet *)objc_msgSend(MEMORY[0x263F7C878], "setWithArray:", objc_msgSend((id)-[TSDCanvasLayerHosting canvasLayer](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "canvasLayer"), "sublayers"));
      objc_msgSend((id)-[TSDCanvasLayerHosting subviewsController](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "subviewsController"), "updateTopLevelLayersForTiling:", v3);
    }
    [(TSDInteractiveCanvasController *)self setP_cachedTopLevelTilingLayers:v3];
  }
  return v3;
}

uint64_t __59__TSDInteractiveCanvasController_i_topLevelLayersForTiling__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 directLayerhostUpdateTopLevelTilingLayers:*(void *)(a1 + 32) forRep:a2];
}

- (void)p_postNotificationOnMainThreadWithValidLayouts:(id)a3
{
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  double v9 = __81__TSDInteractiveCanvasController_p_postNotificationOnMainThreadWithValidLayouts___block_invoke;
  double v10 = &unk_2646B1488;
  double v11 = self;
  if (([MEMORY[0x263F08B88] isMainThread] & 1) != 0 || !self->mLayoutAndRenderOnThreadDuringScroll)
  {
    v9((uint64_t)v8, (uint64_t)a3);
  }
  else
  {
    Main = CFRunLoopGetMain();
    double v6 = (const void *)*MEMORY[0x263EFFE78];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __81__TSDInteractiveCanvasController_p_postNotificationOnMainThreadWithValidLayouts___block_invoke_2;
    block[3] = &unk_2646B14B0;
    block[4] = a3;
    void block[5] = v8;
    CFRunLoopPerformBlock(Main, v6, block);
    CFRunLoopWakeUp(Main);
  }
}

uint64_t __81__TSDInteractiveCanvasController_p_postNotificationOnMainThreadWithValidLayouts___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v4 + 401) && *(unsigned char *)(v4 + 418))
  {
    double v5 = *(void **)(v4 + 448);
    return [v5 addObject:a2];
  }
  else
  {
    double v7 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    uint64_t v8 = *(void *)(a1 + 32);
    return [v7 postNotificationName:a2 object:v8];
  }
}

uint64_t __81__TSDInteractiveCanvasController_p_postNotificationOnMainThreadWithValidLayouts___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)p_updateCanvasSizeFromLayouts
{
  [(TSDInteractiveCanvasController *)self defaultMinimumUnscaledCanvasSize];
  double v3 = TSDRectWithSize();
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  [(TSDCanvas *)self->mCanvas i_unscaledRectOfLayouts];
  v28.origin.double x = v10;
  v28.origin.double y = v11;
  v28.size.double width = v12;
  v28.size.double height = v13;
  v26.origin.double x = v3;
  v26.origin.double y = v5;
  v26.size.double width = v7;
  v26.size.double height = v9;
  CGRect v27 = CGRectUnion(v26, v28);
  double width = v27.size.width;
  double height = v27.size.height;
  [(TSDInteractiveCanvasController *)self canvasScrollingOutset];
  double v17 = TSDAddSizes(width, height, v16);
  double v19 = v18;
  if ([(TSDInteractiveCanvasController *)self isInDynamicOperation])
  {
    objc_msgSend((id)-[TSDCanvasLayerHosting canvasLayer](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "canvasLayer"), "unscaledSize");
    if (v20 > v17)
    {
      objc_msgSend((id)-[TSDCanvasLayerHosting canvasLayer](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "canvasLayer"), "unscaledSize");
      double v17 = v21;
    }
    objc_msgSend((id)-[TSDCanvasLayerHosting canvasLayer](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "canvasLayer"), "unscaledSize");
    if (v22 > v19)
    {
      objc_msgSend((id)-[TSDCanvasLayerHosting canvasLayer](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "canvasLayer"), "unscaledSize");
      double v19 = v23;
    }
  }
  uint64_t v24 = (void *)[(TSDCanvasLayerHosting *)[(TSDInteractiveCanvasController *)self layerHost] canvasLayer];
  objc_msgSend(v24, "setUnscaledSize:", v17, v19);
}

- (void)p_updateViewsFromReps
{
}

- (BOOL)p_allowUpdateViewsFromReps
{
  if ([(TSDInteractiveCanvasController *)self currentlyScrolling]) {
    return 0;
  }
  if (objc_opt_respondsToSelector()) {
    return [(TSDInteractiveCanvasControllerDelegate *)self->mDelegate interactiveCanvasControllerShouldDeferViewCreation:self] ^ 1;
  }
  return 1;
}

- (void)p_updateViewsFromRepsForceUpdate:(BOOL)a3
{
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    CGFloat v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSDInteractiveCanvasController p_updateViewsFromRepsForceUpdate:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 5889, @"This operation must only be performed on the main thread.");
  }
  if (a3
    || [(TSDInteractiveCanvasController *)self p_allowUpdateViewsFromReps]
    && [(TSDInteractiveCanvasController *)self canvasView])
  {
    if (self->mCurrentlyWaitingOnThreadedLayoutAndRender)
    {
      CGFloat v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v8 = [NSString stringWithUTF8String:"-[TSDInteractiveCanvasController p_updateViewsFromRepsForceUpdate:]"];
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 5893, @"Should not be called if waiting on background layout");
    }
    CGFloat v10 = [(TSDInteractiveCanvasController *)self layerHost];
    id v9 = (id)[(TSDCanvasLayerHosting *)v10 subviewsController];
    objc_msgSend((id)-[TSDCanvasLayerHosting subviewsController](v10, "subviewsController"), "updateViewsFromReps");
  }
}

- (void)p_updateLayersFromReps
{
  uint64_t v78 = *MEMORY[0x263EF8340];
  if (![(TSDInteractiveCanvasController *)self isCanvasInteractive]) {
    return;
  }
  double v3 = (void *)[(TSDCanvasLayerHosting *)[(TSDInteractiveCanvasController *)self layerHost] canvasLayer];
  [(TSDCanvas *)[(TSDInteractiveCanvasController *)self canvas] contentsScale];
  double v5 = v4;
  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  double v52 = v3;
  [v3 bounds];
  [(CALayer *)self->mRepContainerLayer setFrame:TSDRectWithSize()];
  CGFloat v7 = [(TSDInteractiveCanvasController *)self additionalLayersUnderRepLayers];
  directLayerHostProvider = self->_directLayerHostProvider;
  if (directLayerHostProvider)
  {
    [(TSDRepDirectLayerHostProvider *)directLayerHostProvider directLayerHostUpdateAdditionalLayersUnderRepLayers:v7];
  }
  else if (v7)
  {
    objc_msgSend(v6, "addObjectsFromArray:");
  }
  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v10 = objc_alloc_init(MEMORY[0x263EFF9B0]);
  id v54 = objc_alloc_init(MEMORY[0x263F086B0]);
  CGRect v55 = v6;
  CGRect v57 = v10;
  double v53 = (void *)[(__CFDictionary *)self->mRepLayersByRep allKeys];
  if (self->mLayoutAndRenderOnThreadDuringScroll && !self->mStaticLayoutAndRenderOnThread) {
    int v11 = [MEMORY[0x263F08B88] isMainThread] ^ 1;
  }
  else {
    int v11 = 0;
  }
  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  obuint64_t j = [(TSDCanvas *)self->mCanvas topLevelReps];
  uint64_t v12 = [obj countByEnumeratingWithState:&v70 objects:v77 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v71;
    double v15 = *MEMORY[0x263F00148];
    double v16 = *(double *)(MEMORY[0x263F00148] + 8);
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v71 != v14) {
          objc_enumerationMutation(obj);
        }
        double v18 = *(void **)(*((void *)&v70 + 1) + 8 * i);
        id v19 = [(TSDInteractiveCanvasController *)self layerForRep:v18];
        unint64_t v20 = [v9 count];
        [(TSDInteractiveCanvasController *)self p_recursivelyUpdateLayerForRep:v18 accumulatingLayers:v9 andReps:v57];
        if (v19) {
          int v21 = 0;
        }
        else {
          int v21 = v11;
        }
        if (v21 == 1)
        {
          unint64_t v22 = [v9 count];
          if (v20 < v22)
          {
            unint64_t v23 = v22;
            do
            {
              uint64_t v24 = (void *)[v9 objectAtIndex:v20];
              [v24 setHidden:1];
              mHiddenTopLevelLayers = self->mHiddenTopLevelLayers;
              if (!mHiddenTopLevelLayers)
              {
                mHiddenTopLevelLayers = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
                self->mHiddenTopLevelLayers = mHiddenTopLevelLayers;
              }
              [(NSMutableArray *)mHiddenTopLevelLayers addObject:v24];
              ++v20;
            }
            while (v23 != v20);
          }
        }
        if ([(TSDInteractiveCanvasController *)self shouldClipThemeContentToCanvas]
          && [v18 canClipThemeContentToCanvas])
        {
          Value = (void *)CFDictionaryGetValue(self->mContainerLayersByRep, v18);
          CGRect v27 = [(TSDInteractiveCanvasController *)self canvas];
          objc_msgSend((id)-[TSDCanvasLayerHosting canvasLayer](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "canvasLayer"), "unscaledSize");
          [(TSDCanvas *)v27 convertUnscaledToBoundsRect:TSDRectWithSize()];
          objc_msgSend(Value, "setBounds:");
          objc_msgSend(Value, "setPosition:", v15, v16);
          objc_msgSend(Value, "setAnchorPoint:", 0.0, 0.0);
          [Value setMasksToBounds:1];
        }
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v70 objects:v77 count:16];
    }
    while (v13);
  }
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  uint64_t v28 = [v53 countByEnumeratingWithState:&v66 objects:v76 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v67;
    do
    {
      for (uint64_t j = 0; j != v29; ++j)
      {
        if (*(void *)v67 != v30) {
          objc_enumerationMutation(v53);
        }
        CGFloat v32 = *(const void **)(*((void *)&v66 + 1) + 8 * j);
        if (([v57 containsObject:v32] & 1) == 0)
        {
          double v33 = CFDictionaryGetValue(self->mRepLayersByRep, v32);
          CGFloat v34 = CFDictionaryGetValue(self->mContainerLayersByRep, v32);
          [(TSDInteractiveCanvasController *)self p_discardLayer:v33 forRep:v32];
          [(TSDInteractiveCanvasController *)self p_discardContainerLayer:v34 forRep:v32];
        }
      }
      uint64_t v29 = [v53 countByEnumeratingWithState:&v66 objects:v76 count:16];
    }
    while (v29);
  }

  if (!self->_directLayerHostProvider
    && (objc_msgSend(v9, "isEqualToArray:", -[CALayer sublayers](self->mRepContainerLayer, "sublayers")) & 1) == 0)
  {
    [(CALayer *)self->mRepContainerLayer setSublayers:v9];
  }

  [v55 addObject:self->mRepContainerLayer];
  [(TSDInteractiveCanvasController *)self p_setupPopoutLayerForReps:v57];
  id v35 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (![(TSDInteractiveCanvasController *)self overlayLayerSuppressed])
  {
    id v36 = [(TSDInteractiveCanvasController *)self p_overlayLayerForReps:v57];
    if (v36)
    {
      id v37 = v36;
      [v36 setContentsScale:v5];
      [v35 addObject:v37];
    }
  }
  uint64_t v38 = self->_directLayerHostProvider;
  if (v38) {
    [(TSDRepDirectLayerHostProvider *)v38 directLayerHostUpdateRepOverlayLayers:v35];
  }
  else {
    [v55 addObjectsFromArray:v35];
  }

  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  uint64_t v39 = objc_msgSend((id)-[TSDCanvasLayerHosting canvasView](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "canvasView"), "subviews");
  uint64_t v40 = [v39 countByEnumeratingWithState:&v62 objects:v75 count:16];
  if (v40)
  {
    uint64_t v41 = v40;
    uint64_t v42 = *(void *)v63;
    do
    {
      for (uint64_t k = 0; k != v41; ++k)
      {
        if (*(void *)v63 != v42) {
          objc_enumerationMutation(v39);
        }
        long long v44 = (void *)[*(id *)(*((void *)&v62 + 1) + 8 * k) layer];
        if (v44)
        {
          long long v45 = v44;
          [v44 setContentsScale:v5];
          [v55 addObject:v45];
        }
      }
      uint64_t v41 = [v39 countByEnumeratingWithState:&v62 objects:v75 count:16];
    }
    while (v41);
  }
  if (!self->_directLayerHostProvider) {
    objc_msgSend(v55, "addObjectsFromArray:", objc_msgSend((id)-[TSDCanvasLayerHosting subviewsController](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "subviewsController"), "updateAlternateLayersForViews"));
  }

  long long v46 = [(TSDInteractiveCanvasController *)self additionalLayersOverRepLayers];
  CGFloat v47 = self->_directLayerHostProvider;
  if (v47)
  {
    [(TSDRepDirectLayerHostProvider *)v47 directLayerHostUpdateAdditionalLayersAboveRepLayers:v46];
  }
  else
  {
    if (!v46) {
      goto LABEL_63;
    }
    objc_msgSend(v55, "addObjectsFromArray:");
  }
  if (!self->_directLayerHostProvider)
  {
LABEL_63:
    if ((objc_msgSend(v55, "isEqualToArray:", objc_msgSend(v52, "sublayers")) & 1) == 0) {
      [v52 setSublayers:v55];
    }
  }
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  uint64_t v48 = [v55 countByEnumeratingWithState:&v58 objects:v74 count:16];
  if (v48)
  {
    uint64_t v49 = v48;
    uint64_t v50 = *(void *)v59;
    do
    {
      for (uint64_t m = 0; m != v49; ++m)
      {
        if (*(void *)v59 != v50) {
          objc_enumerationMutation(v55);
        }
        [(TSDInteractiveCanvasController *)self p_recursivelyUpdateLayerEdgeAntialiasingForLayer:*(void *)(*((void *)&v58 + 1) + 8 * m)];
      }
      uint64_t v49 = [v55 countByEnumeratingWithState:&v58 objects:v74 count:16];
    }
    while (v49);
  }

  [(TSDInteractiveCanvasController *)self setP_cachedTopLevelTilingLayers:0];
  if (objc_opt_respondsToSelector()) {
    [(TSDInteractiveCanvasControllerDelegate *)self->mDelegate interactiveCanvasControllerDidUpdateLayersFromReps:self];
  }
}

- (void)p_recursivelyUpdateLayerForRep:(id)a3 accumulatingLayers:(id)a4 andReps:(id)a5
{
  uint64_t v82 = *MEMORY[0x263EF8340];
  id v9 = (void *)[(id)TSUProtocolCast() layerAndSubviewHost];
  if (self->_directLayerHostProvider)
  {
    Value = (void *)CFDictionaryGetValue(self->mDirectLayerHostsByRep, a3);
    directLayerHostProvider = self->_directLayerHostProvider;
    if (directLayerHostProvider) {
      uint64_t v12 = (void *)[(TSDRepDirectLayerHostProvider *)directLayerHostProvider directLayerHostForRep:a3];
    }
    else {
      uint64_t v12 = 0;
    }
    if (v12 == Value)
    {
      uint64_t v12 = Value;
    }
    else
    {
      if (Value)
      {
        [Value directLayerHostUpdateWithContainerLayer:0 forRep:a3];
        CFDictionaryRemoveValue(self->mDirectLayerHostsByRep, a3);
      }
      if (v12)
      {
        CFDictionarySetValue(self->mDirectLayerHostsByRep, a3, v12);
        *(_DWORD *)&v59[8] = 0;
        *(void *)long long v59 = v9 == 0;
        BOOL v13 = 1;
        goto LABEL_18;
      }
    }
  }
  else
  {
    uint64_t v12 = 0;
  }
  BOOL v13 = v12 != 0;
  if (v9) {
    BOOL v14 = v12 == 0;
  }
  else {
    BOOL v14 = 0;
  }
  if (v14)
  {
    a4 = objc_alloc_init(MEMORY[0x263EFF980]);
    BOOL v13 = 0;
    v59[0] = 0;
    uint64_t v12 = 0;
    *(void *)&v59[4] = a4;
  }
  else
  {
    v59[0] = v9 == 0;
    *(void *)&v59[4] = 0;
  }
LABEL_18:
  [(TSDCanvas *)[(TSDInteractiveCanvasController *)self canvas] contentsScale];
  double v16 = v15;
  double v17 = (void *)CFDictionaryGetValue(self->mContainerLayersByRep, a3);
  if (v17)
  {
    id v18 = v17;
    id v19 = v17;
  }
  else
  {
    id v18 = objc_alloc_init(MEMORY[0x263F157E8]);
    unint64_t v20 = NSString;
    int v21 = (objc_class *)objc_opt_class();
    [v18 setName:objc_msgSend(v20, "stringWithFormat:", @"containerLayer(%@)", NSStringFromClass(v21))];
    CFDictionarySetValue(self->mContainerLayersByRep, a3, v18);
    CFDictionarySetValue(self->mRepsByContainerLayer, v18, a3);
    [v18 setDelegate:self];
  }
  BOOL v60 = v13;
  if (v13) {
    [v12 directLayerHostUpdateWithContainerLayer:v18 forRep:a3];
  }
  else {
    [a4 addObject:v18];
  }
  id v22 = (id)CFDictionaryGetValue(self->mRepLayersByRep, a3);
  unint64_t v23 = (objc_class *)[a3 layerClass];
  long long v61 = v18;
  if (v22)
  {
    if ([v22 isMemberOfClass:v23]) {
      goto LABEL_34;
    }
    [(TSDInteractiveCanvasController *)self p_discardLayer:v22 forRep:a3];
  }
  id v22 = objc_alloc_init(v23);
  [a3 didCreateLayer:v22];
  CFDictionarySetValue(self->mRepLayersByRep, a3, v22);
  CFDictionarySetValue(self->mRepsByRepLayer, v22, a3);
  [v22 setDelegate:self];
  uint64_t v24 = (objc_class *)objc_opt_class();
  [v22 setName:NSStringFromClass(v24)];
  if (([a3 directlyManagesLayerContent] & 1) == 0) {
    [v22 setNeedsDisplay];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend(v22, "setTilingMode:", objc_msgSend(a3, "tilingMode"));
    objc_msgSend(v22, "setDrawsInBackground:", objc_msgSend(a3, "canDrawInBackgroundDuringScroll"));
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    [(TSDCanvas *)[(TSDInteractiveCanvasController *)self canvas] contentsScale];
    objc_msgSend(v22, "setContentsScale:");
  }

LABEL_34:
  if (([a3 layerUpdatesPaused] & 1) == 0) {
    [a3 willUpdateLayer:v22];
  }
  if (v22)
  {
    [a5 addObject:a3];
    CGRect v57 = v12;
    long long v58 = v9;
    if (([a3 layerUpdatesPaused] & 1) == 0)
    {
      [a3 updateLayerGeometryFromLayout:v22];
      objc_msgSend(v22, "setMasksToBounds:", objc_msgSend(a3, "masksToBounds"));
      objc_msgSend(v22, "setOpaque:", objc_msgSend(a3, "isOpaque"));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        [v22 setContentsScale:v16];
      }
      id v25 = objc_alloc_init(MEMORY[0x263EFF980]);
      CGRect v26 = (void *)[a3 additionalLayersUnderLayer];
      CGRect v56 = v25;
      if (v26)
      {
        CGRect v27 = v26;
        long long v76 = 0u;
        long long v77 = 0u;
        long long v74 = 0u;
        long long v75 = 0u;
        uint64_t v28 = [v26 countByEnumeratingWithState:&v74 objects:v81 count:16];
        if (v28)
        {
          uint64_t v29 = v28;
          uint64_t v30 = *(void *)v75;
          do
          {
            for (uint64_t i = 0; i != v29; ++i)
            {
              if (*(void *)v75 != v30) {
                objc_enumerationMutation(v27);
              }
              CGFloat v32 = *(void **)(*((void *)&v74 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0
                && ([a3 repDirectlyManagesContentsScaleOfLayer:v32] & 1) == 0)
              {
                [v32 setContentsScale:v16];
              }
            }
            uint64_t v29 = [v27 countByEnumeratingWithState:&v74 objects:v81 count:16];
          }
          while (v29);
        }
        id v25 = v56;
        [v56 addObjectsFromArray:v27];
      }
      [v25 addObject:v22];
      double v33 = (void *)[a3 additionalLayersOverLayer];
      if (v33)
      {
        CGFloat v34 = v33;
        long long v72 = 0u;
        long long v73 = 0u;
        long long v70 = 0u;
        long long v71 = 0u;
        uint64_t v35 = [v33 countByEnumeratingWithState:&v70 objects:v80 count:16];
        if (v35)
        {
          uint64_t v36 = v35;
          uint64_t v37 = *(void *)v71;
          do
          {
            for (uint64_t j = 0; j != v36; ++j)
            {
              if (*(void *)v71 != v37) {
                objc_enumerationMutation(v34);
              }
              uint64_t v39 = *(void **)(*((void *)&v70 + 1) + 8 * j);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                [v39 setContentsScale:v16];
              }
            }
            uint64_t v36 = [v34 countByEnumeratingWithState:&v70 objects:v80 count:16];
          }
          while (v36);
        }
        id v25 = v56;
        [v56 addObjectsFromArray:v34];
      }
      [v61 setSublayers:v25];

      uint64_t v12 = v57;
      id v9 = v58;
    }
    uint64_t v40 = (void *)TSUProtocolCast();
    if (v40)
    {
      uint64_t v41 = v40;
      if (![v40 layerUpdatesPaused]
        || (objc_opt_respondsToSelector() & 1) != 0 && [v41 allowSublayerUpdatesWhenPaused])
      {
        id v42 = objc_alloc_init(MEMORY[0x263EFF980]);
        if (objc_opt_respondsToSelector()) {
          [v41 addAdditionalChildBackgroundLayersToArray:v42];
        }
        long long v68 = 0u;
        long long v69 = 0u;
        long long v66 = 0u;
        long long v67 = 0u;
        long long v43 = (void *)[v41 childReps];
        uint64_t v44 = [v43 countByEnumeratingWithState:&v66 objects:v79 count:16];
        if (v44)
        {
          uint64_t v45 = v44;
          uint64_t v46 = *(void *)v67;
          do
          {
            for (uint64_t k = 0; k != v45; ++k)
            {
              if (*(void *)v67 != v46) {
                objc_enumerationMutation(v43);
              }
              [(TSDInteractiveCanvasController *)self p_recursivelyUpdateLayerForRep:*(void *)(*((void *)&v66 + 1) + 8 * k) accumulatingLayers:v42 andReps:a5];
            }
            uint64_t v45 = [v43 countByEnumeratingWithState:&v66 objects:v79 count:16];
          }
          while (v45);
        }
        uint64_t v48 = v41;
        goto LABEL_81;
      }
      long long v64 = 0u;
      long long v65 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      double v51 = (void *)[v41 childReps];
      uint64_t v52 = [v51 countByEnumeratingWithState:&v62 objects:v78 count:16];
      if (v52)
      {
        uint64_t v53 = v52;
        uint64_t v54 = *(void *)v63;
        do
        {
          for (uint64_t m = 0; m != v53; ++m)
          {
            if (*(void *)v63 != v54) {
              objc_enumerationMutation(v51);
            }
            [(TSDInteractiveCanvasController *)self p_recursivelyUpdateLayerForRep:*(void *)(*((void *)&v62 + 1) + 8 * m) accumulatingLayers:0 andReps:a5];
          }
          uint64_t v53 = [v51 countByEnumeratingWithState:&v62 objects:v78 count:16];
        }
        while (v53);
      }
    }
    else if (([0 layerUpdatesPaused] & 1) == 0)
    {
      uint64_t v49 = TSUProtocolCast();
      if (v49)
      {
        uint64_t v50 = (void *)v49;
        id v42 = objc_alloc_init(MEMORY[0x263EFF980]);
        uint64_t v48 = v50;
LABEL_81:
        [v48 addAdditionalChildLayersToArray:v42];
        [v22 tilingSafeSetSublayers:v42];

        uint64_t v12 = v57;
        id v9 = v58;
      }
    }
  }
  if (([a3 layerUpdatesPaused] & 1) == 0) {
    [a3 didUpdateLayer:v22];
  }
  if ((v59[0] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(v9, "containerLayer"), "setSublayers:", *(void *)&v59[4]);
  }

  if (v60 && (objc_opt_respondsToSelector() & 1) != 0) {
    objc_msgSend(v12, "directLayerHostUpdateOverlayLayers:forRep:", objc_msgSend(a3, "overlayLayers"), a3);
  }
}

- (void)p_discardContainerLayer:(id)a3 forRep:(id)a4
{
  id v6 = a3;
  [(TSDInteractiveCanvasController *)self p_recursivelyClearLayerDelegate:a3];
  if (a3) {
    CFDictionaryRemoveValue(self->mRepsByContainerLayer, a3);
  }
  if (a4)
  {
    CFDictionaryRemoveValue(self->mContainerLayersByRep, a4);
    if (self->_directLayerHostProvider)
    {
      objc_msgSend((id)CFDictionaryGetValue(self->mDirectLayerHostsByRep, a4), "directLayerHostRemoveIfMatchingContainerLayer:forRep:", a3, a4);
      CFDictionaryRemoveValue(self->mDirectLayerHostsByRep, a4);
    }
  }
}

- (void)p_recursivelyUpdateLayerEdgeAntialiasingForLayer:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [a3 setAllowsEdgeAntialiasing:1];
  }
  uint64_t v5 = [a3 mask];
  if (v5) {
    [(TSDInteractiveCanvasController *)self p_recursivelyUpdateLayerEdgeAntialiasingForLayer:v5];
  }
  id v6 = objc_msgSend((id)objc_msgSend(a3, "sublayers"), "copy");
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [(TSDInteractiveCanvasController *)self p_recursivelyUpdateLayerEdgeAntialiasingForLayer:*(void *)(*((void *)&v11 + 1) + 8 * v10++)];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)p_discardLayer:(id)a3 forRep:(id)a4
{
  id v6 = a3;
  [(TSDInteractiveCanvasController *)self p_recursivelyClearLayerDelegate:a3];
  id v7 = a3;
  if (a3)
  {
    CFDictionaryRemoveValue(self->mRepsByRepLayer, a3);
    id v7 = a3;
  }
  if (a4)
  {
    CFDictionaryRemoveValue(self->mRepLayersByRep, a4);
    id v7 = a3;
  }
}

- (void)p_setupPopoutLayerForReps:(id)a3
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  uint64_t v52 = objc_msgSend((id)-[TSDCanvasLayerHosting canvasView](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "canvasView"), "enclosingScrollView");
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v54 = self;
  [(TSDInteractiveCanvasController *)self visibleBoundsRect];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  uint64_t v14 = [a3 countByEnumeratingWithState:&v59 objects:v64 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v60;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v60 != v16) {
          objc_enumerationMutation(a3);
        }
        id v18 = objc_msgSend(*(id *)(*((void *)&v59 + 1) + 8 * i), "popoutLayers", v52);
        if (v18)
        {
          id v19 = v18;
          long long v57 = 0u;
          long long v58 = 0u;
          long long v55 = 0u;
          long long v56 = 0u;
          uint64_t v20 = [v18 countByEnumeratingWithState:&v55 objects:v63 count:16];
          if (v20)
          {
            uint64_t v21 = v20;
            uint64_t v22 = *(void *)v56;
            do
            {
              for (uint64_t j = 0; j != v21; ++j)
              {
                if (*(void *)v56 != v22) {
                  objc_enumerationMutation(v19);
                }
                uint64_t v24 = *(void **)(*((void *)&v55 + 1) + 8 * j);
                [v24 frame];
                v68.origin.double x = v7;
                v68.origin.double y = v9;
                v68.size.double width = v11;
                v68.size.double height = v13;
                objc_msgSend(v24, "setHidden:", !CGRectIntersectsRect(v66, v68));
                [v5 addObject:v24];
              }
              uint64_t v21 = [v19 countByEnumeratingWithState:&v55 objects:v63 count:16];
            }
            while (v21);
          }
        }
      }
      uint64_t v15 = [a3 countByEnumeratingWithState:&v59 objects:v64 count:16];
    }
    while (v15);
  }
  uint64_t v25 = objc_msgSend(v5, "count", v52);
  mPopoutLayer = v54->mPopoutLayer;
  if (v25)
  {
    if (!mPopoutLayer)
    {
      CGRect v27 = (CALayer *)objc_alloc_init(MEMORY[0x263F157E8]);
      v54->mPopoutLayer = v27;
      [(CALayer *)v27 setName:@"popout"];
      -[CALayer setAnchorPoint:](v54->mPopoutLayer, "setAnchorPoint:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
      [(CALayer *)v54->mPopoutLayer setDelegate:v54];
      [(CALayer *)v54->mPopoutLayer setBackgroundColor:0];
      uint64_t v28 = objc_msgSend((id)objc_msgSend(v53, "layer"), "superlayer");
      if (!v28) {
        uint64_t v28 = objc_msgSend((id)objc_msgSend(v53, "superview"), "layer");
      }
      [v28 addSublayer:v54->mPopoutLayer];
    }
    objc_msgSend((id)-[TSDCanvasLayerHosting canvasLayer](-[TSDInteractiveCanvasController layerHost](v54, "layerHost"), "canvasLayer"), "bounds");
    double v30 = v29;
    double v32 = v31;
    double v34 = v33;
    double v36 = v35;
    [(CALayer *)v54->mPopoutLayer bounds];
    v69.origin.double x = v30;
    v69.origin.double y = v32;
    v69.size.double width = v34;
    v69.size.double height = v36;
    if (!CGRectEqualToRect(v67, v69)) {
      -[CALayer setBounds:](v54->mPopoutLayer, "setBounds:", v30, v32, v34, v36);
    }
    objc_msgSend((id)-[TSDCanvasLayerHosting canvasLayer](-[TSDInteractiveCanvasController layerHost](v54, "layerHost"), "canvasLayer"), "contentInset");
    double v38 = v37;
    double v40 = v39;
    [v53 frame];
    double v42 = v41;
    [v53 contentOffset];
    double v44 = v30 + v42 - v43 - v40;
    [v53 frame];
    double v46 = v45;
    [v53 contentOffset];
    double v48 = v32 + v46 - v47 - v38;
    [(CALayer *)v54->mPopoutLayer position];
    if (v50 != v44 || v49 != v48) {
      -[CALayer setPosition:](v54->mPopoutLayer, "setPosition:", v44, v48);
    }
    [(CALayer *)v54->mPopoutLayer setSublayers:v5];
  }
  else
  {
    [(CALayer *)mPopoutLayer setDelegate:0];
    [(CALayer *)v54->mPopoutLayer removeFromSuperlayer];

    v54->mPopoutLayer = 0;
  }
}

- (id)p_overlayLayerForReps:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v6 = [a3 countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v37 != v8) {
          objc_enumerationMutation(a3);
        }
        double v10 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        if (!self->_directLayerHostProvider
          || !CFDictionaryGetValue(self->mDirectLayerHostsByRep, *(const void **)(*((void *)&v36 + 1) + 8 * i))
          || (objc_opt_respondsToSelector() & 1) == 0)
        {
          uint64_t v11 = [v10 overlayLayers];
          if (v11) {
            [v5 addObjectsFromArray:v11];
          }
        }
      }
      uint64_t v7 = [a3 countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v7);
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v12 = [(TSDInteractiveCanvasController *)self p_decorators];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v33;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v33 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = [*(id *)(*((void *)&v32 + 1) + 8 * j) decoratorOverlayLayers];
        if (v17) {
          [v5 addObjectsFromArray:v17];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v32 objects:v40 count:16];
    }
    while (v14);
  }
  if ([v5 count] || self->mShowGrayOverlay)
  {
    mOverlayLayer = self->mOverlayLayer;
    if (!mOverlayLayer)
    {
      id v19 = (CALayer *)objc_alloc_init(MEMORY[0x263F157E8]);
      self->mOverlayLayer = v19;
      [(CALayer *)v19 setName:@"overlayLayer"];
      -[CALayer setAnchorPoint:](self->mOverlayLayer, "setAnchorPoint:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
      [(CALayer *)self->mOverlayLayer setDelegate:self];
      [(CALayer *)self->mOverlayLayer setZPosition:3.0];
      mOverlayLayer = self->mOverlayLayer;
    }
    [(CALayer *)mOverlayLayer setSublayers:v5];
    if (self->mShowGrayOverlay)
    {
      DeviceRGB = (CGColor *)TSUCGColorCreateDeviceRGB();
      [(CALayer *)self->mOverlayLayer setBackgroundColor:DeviceRGB];
      CGColorRelease(DeviceRGB);
    }
    else
    {
      [(CALayer *)self->mOverlayLayer setBackgroundColor:0];
    }
    objc_msgSend((id)-[TSDCanvasLayerHosting canvasLayer](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "canvasLayer"), "bounds");
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;
    double v28 = v27;
    [(CALayer *)self->mOverlayLayer bounds];
    v44.origin.double x = v22;
    v44.origin.double y = v24;
    v44.size.double width = v26;
    v44.size.double height = v28;
    if (!CGRectEqualToRect(v43, v44)) {
      -[CALayer setBounds:](self->mOverlayLayer, "setBounds:", v22, v24, v26, v28);
    }
    [(CALayer *)self->mOverlayLayer position];
    if (v30 != v22 || v29 != v24) {
      -[CALayer setPosition:](self->mOverlayLayer, "setPosition:", v22, v24);
    }
  }
  else
  {
    [(CALayer *)self->mOverlayLayer setDelegate:0];
    [(CALayer *)self->mOverlayLayer removeFromSuperlayer];

    self->mOverlayLayer = 0;
  }

  return self->mOverlayLayer;
}

- (void)p_drawLayerWithReadLock:(id)a3
{
  id v5 = (const void *)[a3 objectForKey:@"TSDInteractiveCanvasControllerLayerKey"];
  uint64_t v6 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"TSDInteractiveCanvasControllerContextKey"), "pointerValue");
  uint64_t v7 = v6;
  if (v5)
  {
    if (v6) {
      goto LABEL_3;
    }
  }
  else
  {
    CGFloat v9 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v10 = [NSString stringWithUTF8String:"-[TSDInteractiveCanvasController p_drawLayerWithReadLock:]"];
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 6459, @"invalid nil value for '%s'", "layer");
    if (v7) {
      goto LABEL_3;
    }
  }
  uint64_t v11 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v12 = [NSString stringWithUTF8String:"-[TSDInteractiveCanvasController p_drawLayerWithReadLock:]"];
  objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 6460, @"invalid nil value for '%s'", "ctx");
LABEL_3:
  Value = CFDictionaryGetValue(self->mRepsByRepLayer, v5);
  if (Value)
  {
    [(TSDInteractiveCanvasController *)self i_drawRepWithReadLock:Value inContext:v7 forLayer:v5];
  }
}

- (void)i_drawRepWithReadLock:(id)a3 inContext:(CGContext *)a4 forLayer:(id)a5
{
  if (a3)
  {
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v8 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v9 = [NSString stringWithUTF8String:"-[TSDInteractiveCanvasController i_drawRepWithReadLock:inContext:forLayer:]"];
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 6472, @"invalid nil value for '%s'", "rep");
    if (a4) {
      goto LABEL_3;
    }
  }
  uint64_t v10 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v11 = [NSString stringWithUTF8String:"-[TSDInteractiveCanvasController i_drawRepWithReadLock:inContext:forLayer:]"];
  objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 6473, @"invalid nil value for '%s'", "ctx");
LABEL_3:
  CGContextSaveGState(a4);
  [a3 setupForDrawingInLayer:a5 context:a4];
  [a3 drawInLayerContext:a4];
  [a3 didDrawInLayer:a5 context:a4];
  CGContextRestoreGState(a4);
}

- (BOOL)p_endEditingToBeginEditingRep:(id)a3
{
  self->mShouldAutoscrollToSelectionAfterLayout = 0;
  self->mShouldCenterSelectionWhenAutoscrolling = 0;
  if (objc_opt_respondsToSelector()) {
    [(TSDInteractiveCanvasControllerDelegate *)self->mDelegate canvasWillEndEditingToBeginEditingRep:a3];
  }
  id v5 = [(TSDInteractiveCanvasController *)self editorController];
  uint64_t v6 = [(TSDInteractiveCanvasController *)self canvasEditor];
  if ([(TSDEditorController *)v5 textInputEditor] == v6
    || objc_msgSend(-[TSDEditorController currentEditors](v5, "currentEditors"), "indexOfObjectIdenticalTo:", v6) == 0x7FFFFFFFFFFFFFFFLL)
  {
    return 0;
  }
  uint64_t v8 = [(TSDCanvasEditor *)v6 editorToPopToOnEndEditing];
  if (v8) {
    [(TSDEditorController *)v5 popToEditor:v8];
  }
  [(TSDEditorController *)v5 setTextInputEditor:v6];
  return 1;
}

- (id)p_backgroundLayoutAndRenderState
{
  id result = self->mBackgroundLayoutAndRenderState;
  if (!result)
  {
    id result = [[TSDBackgroundLayoutAndRenderState alloc] initWithDelegate:self];
    self->mBackgroundLayoutAndRenderState = (TSDBackgroundLayoutAndRenderState *)result;
  }
  return result;
}

- (void)disableThreadedLayoutAndRender
{
}

- (void)enableThreadedLayoutAndRender
{
}

- (BOOL)i_temporarilyDisabledLayoutAndRenderOnThreadDuringScroll
{
  return self->mTemporarilyDisabledLayoutAndRenderOnThreadDuringScroll;
}

- (BOOL)p_shouldLayoutAndRenderOnThread
{
  return [(TSDInteractiveCanvasController *)self p_shouldLayoutAndRenderOnThreadForcePendingLayout:1];
}

- (BOOL)p_shouldLayoutAndRenderOnThreadForcePendingLayout:(BOOL)a3
{
  if (!self->mLayoutAndRenderOnThreadDuringScroll) {
    return 0;
  }
  BOOL v3 = a3;
  if ((![(TSDInteractiveCanvasController *)self p_currentlyScrolling]
     || ![(TSDCanvasView *)[(TSDInteractiveCanvasController *)self canvasView] window])
    && !self->mStaticLayoutAndRenderOnThread)
  {
    return 0;
  }
  if (self->mDisableThreadedLayoutAndRender) {
    return 0;
  }
  self->mLayoutAndRenderOnThreadDuringScroll = 0;
  BOOL v5 = 1;
  self->mTemporarilyDisabledLayoutAndRenderOnThreadDuringScroll = 1;
  if (v3)
  {
    [(TSDInteractiveCanvasController *)self layoutIfNeeded];
    [MEMORY[0x263F158F8] flush];
  }
  self->mTemporarilyDisabledLayoutAndRenderOnThreadDuringScroll = 0;
  self->mLayoutAndRenderOnThreadDuringScroll = 1;
  return v5;
}

- (void)p_viewScrollingEnded
{
  if (!self->mStaticLayoutAndRenderOnThread && !self->mHasBeenTornDown)
  {
    if (self->mLayerHostHasBeenTornDown)
    {
      BOOL v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v4 = [NSString stringWithUTF8String:"-[TSDInteractiveCanvasController p_viewScrollingEnded]"];
      objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 6596, @"not expecting layerHost to have been torn down at this point");
    }
    if (self->mLayoutAndRenderOnThreadDuringScroll) {
      [(TSDInteractiveCanvasController *)self i_syncWithLayoutThread];
    }
    [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel_i_viewScrollingEnded object:0];
    [(TSDInteractiveCanvasController *)self performSelector:sel_i_viewScrollingEnded withObject:0 afterDelay:0.0];
  }
}

- (void)p_invalidateForBackgroundLayout
{
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    BOOL v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSDInteractiveCanvasController p_invalidateForBackgroundLayout]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 6610, @"This operation must only be performed on the main thread.");
  }
  if ([(TSDInteractiveCanvasController *)self p_shouldLayoutAndRenderOnThread])
  {
    self->mCurrentlyWaitingOnThreadedLayoutAndRender = 1;
    id v5 = [(TSDInteractiveCanvasController *)self p_backgroundLayoutAndRenderState];
    [v5 setNeedsLayoutAndRender];
  }
}

- (void)p_invalidateTilingLayers
{
  if (self->mCreateRepsForOffscreenLayouts)
  {
    if (!self->mCurrentlyWaitingOnThreadedLayoutAndRender)
    {
      if ([(TSDInteractiveCanvasController *)self p_shouldLayoutAndRenderOnThreadForcePendingLayout:!self->mForceTilingLayoutOnThreadWhenScrolling])
      {
        self->mCurrentlyWaitingOnThreadedLayoutAndRender = 1;
        id v3 = [(TSDInteractiveCanvasController *)self p_backgroundLayoutAndRenderState];
      }
      else
      {
        id v3 = (id)[(TSDCanvasLayerHosting *)[(TSDInteractiveCanvasController *)self layerHost] canvasLayer];
      }
      [v3 setNeedsLayoutForTilingLayers];
    }
  }
  else if (!self->mCurrentlyWaitingOnThreadedLayoutAndRender)
  {
    [(TSDInteractiveCanvasController *)self invalidateVisibleBoundsInBackground];
  }
}

- (void)p_rulerUnitsDidChangeNotification:(id)a3
{
  self->mUnitFormatter = 0;
}

- (void)p_textGesturesWillBeginNotification:(id)a3
{
  self->mTextGesturesInFlight = 1;
}

- (void)p_textGesturesDidEndNotification:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (self->mTextGesturesInFlight)
  {
    self->mTextGesturesInFlight = 0;
    if (self->mSelectionChangeNotificationDeferredEditor)
    {
      if ((objc_opt_respondsToSelector() & 1) == 0
        || [(TSDInteractiveCanvasControllerDelegate *)self->mDelegate allowTextEditingToBegin])
      {
        [(TSDInteractiveCanvasController *)self p_editorDoneChangingSelection:self->mSelectionChangeNotificationDeferredEditor];
      }
      if (self->mShouldAutoscrollToSelectionAfterGestures && !self->mShouldAutoscrollToSelectionAfterLayout) {
        [(TSDInteractiveCanvasController *)self scrollToPrimarySelection];
      }

      self->mSelectionChangeNotificationDeferredEditor = 0;
    }
    if (![(TSDInteractiveCanvasController *)self currentlyScrolling])
    {
      long long v11 = 0u;
      long long v12 = 0u;
      long long v9 = 0u;
      long long v10 = 0u;
      id v4 = [(TSDCanvas *)self->mCanvas topLevelReps];
      uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)v10;
        do
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v10 != v7) {
              objc_enumerationMutation(v4);
            }
            [*(id *)(*((void *)&v9 + 1) + 8 * i) recursivelyPerformSelectorIfImplemented:sel_gesturesDidEnd];
          }
          uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
        }
        while (v6);
      }
    }
  }
}

- (void)p_editorDidChangeSelection:(id)a3 withSelectionFlags:(unint64_t)a4
{
  unsigned int v4 = a4;
  if ([(TSDInteractiveCanvasController *)self canvasEditor] == a3) {
    [(TSDInteractiveCanvasController *)self invalidateLayers];
  }
  if (objc_opt_respondsToSelector()) {
    [(TSDInteractiveCanvasControllerDelegate *)self->mDelegate selectionDidChange];
  }
  [(UITextInputDelegate *)[(TSDTextInputResponder *)self->mTextInputResponder inputDelegate] selectionDidChange:self->mTextInputResponder];
  LOBYTE(v7) = self->mTextGesturesInFlight;
  if (v7)
  {
    self->mSelectionChangeNotificationDeferredEditor = (TSDEditor *)a3;
    BOOL v7 = (v4 >> 6) & 1;
    self->mShouldAnimateAutoscroll = (v4 & 0x10) != 0;
  }
  self->mShouldAutoscrollToSelectionAfterGestures = v7;
}

- (void)p_editorDoneChangingSelection:(id)a3
{
}

- (void)p_editorDoneChangingSelection:(id)a3 withFlags:(unint64_t)a4
{
  id v7 = [(TSDEditorController *)self->mEditorController textInputEditor];
  uint64_t v8 = TSUProtocolCast();
  [(TSDInteractiveCanvasController *)self p_maybeSetTextResponderEditorTo:v8];
  [(TSDTextInputResponder *)self->mTextInputResponder editorDidChangeSelection:v7 withFlags:a4];
  if (v8 && v7 != [(TSDEditorController *)self->mEditorController textInputEditor])
  {
    long long v9 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v10 = [NSString stringWithUTF8String:"-[TSDInteractiveCanvasController p_editorDoneChangingSelection:withFlags:]"];
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 6751, @"Text input editor changed during -[TSDInteractiveCanvasController p_editorDoneChangingSelection].");
    long long v11 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v12 = [NSString stringWithUTF8String:"-[TSDInteractiveCanvasController p_editorDoneChangingSelection:withFlags:]"];
    [v11 handleFailureInFunction:v12, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 6752, @"If the text input editor changes during p_editorDoneChangingSelection, you are likely to zombie 'editor' right now:" file lineNumber description];
  }
  char v13 = objc_opt_respondsToSelector();
  mDelegate = self->mDelegate;
  if (v13)
  {
    [(TSDInteractiveCanvasControllerDelegate *)mDelegate editorDidChangeSelectionWithTextInputEditor:v7 changingEditor:a3];
  }
  else if (objc_opt_respondsToSelector())
  {
    uint64_t v15 = self->mDelegate;
    [(TSDInteractiveCanvasControllerDelegate *)v15 editorDidChangeSelection:v7];
  }
}

- (double)p_targetPointSize
{
  double result = self->mTargetPointSize;
  if (result == 0.0)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263EFFA40], "standardUserDefaults"), "floatForKey:", @"TSDTargetPointSize");
    float v5 = v4;
    double result = v4;
    self->mTargetPointSize = result;
    if (v5 == 0.0)
    {
      self->mTargetPointSize = 17.0;
      return 17.0;
    }
  }
  return result;
}

- (void)p_setTargetPointSize:(double)a3
{
  self->mTargetPointSize = a3;
  float v4 = (void *)[MEMORY[0x263EFFA40] standardUserDefaults];
  *(float *)&double v5 = a3;
  [v4 setFloat:@"TSDTargetPointSize" forKey:v5];
}

- (BOOL)p_centerOnInitialSelection
{
  id v2 = +[TSKApplicationDelegate sharedDelegate];
  return [v2 centerOnInitialSelection];
}

- (CGRect)p_outsetSelectionRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (CGRectIsNull(a3))
  {
    CGFloat v8 = *MEMORY[0x263F001A0];
    CGFloat v9 = *(double *)(MEMORY[0x263F001A0] + 8);
    CGFloat v10 = *(double *)(MEMORY[0x263F001A0] + 16);
    CGFloat v11 = *(double *)(MEMORY[0x263F001A0] + 24);
  }
  else
  {
    v20.origin.double x = x;
    v20.origin.double y = y;
    v20.size.double width = width;
    v20.size.double height = height;
    CGRect v21 = CGRectInset(v20, -15.0, -15.0);
    CGFloat v8 = v21.origin.x;
    CGFloat v9 = v21.origin.y;
    CGFloat v10 = v21.size.width;
    CGFloat v11 = v21.size.height;
  }
  if (objc_opt_respondsToSelector())
  {
    -[TSDInteractiveCanvasControllerDelegate interactiveCanvasController:outsetSelectionRect:](self->mDelegate, "interactiveCanvasController:outsetSelectionRect:", self, x, y, width, height);
    CGFloat v8 = v12;
    CGFloat v9 = v13;
    CGFloat v10 = v14;
    CGFloat v11 = v15;
  }
  double v16 = v8;
  double v17 = v9;
  double v18 = v10;
  double v19 = v11;
  result.size.double height = v19;
  result.size.double width = v18;
  result.origin.double y = v17;
  result.origin.double x = v16;
  return result;
}

- (void)p_autoscrollToSelection:(id)a3 withInfo:(id)a4 isInitialSelection:(BOOL)a5 focusRect:(CGRect)a6
{
}

- (void)p_autoscrollToSelection:(id)a3 withInfo:(id)a4 isInitialSelection:(BOOL)a5 focusRect:(CGRect)a6 scrollImmediately:(BOOL)a7 skipZoom:(BOOL)a8
{
  CGFloat height = a6.size.height;
  CGFloat width = a6.size.width;
  CGFloat y = a6.origin.y;
  CGFloat x = a6.origin.x;
  BOOL v14 = a5;
  uint64_t v118 = *MEMORY[0x263EF8340];
  id v18 = [(TSDEditorController *)self->mEditorController textInputEditor];
  if (self->mAnimatingViewScale) {
    return;
  }
  double v19 = v18;
  if ([(TSDInteractiveCanvasController *)self p_shouldSuppressAutozoomForEditor:v18]|| !a7 && self->mTextGesturesInFlight)
  {
    return;
  }
  double v20 = *MEMORY[0x263F001A0];
  double v21 = *(double *)(MEMORY[0x263F001A0] + 8);
  double v22 = *(double *)(MEMORY[0x263F001A0] + 16);
  double v23 = *(double *)(MEMORY[0x263F001A0] + 24);
  CGFloat v111 = v21;
  CGFloat v112 = *MEMORY[0x263F001A0];
  CGFloat v109 = v23;
  CGFloat v110 = v22;
  if (a4)
  {
    id v24 = [(TSDInteractiveCanvasController *)self layoutForInfoNearestVisibleRect:a4 intersectingSelection:a3];
    if (v24
      || (id v24 = [(TSDInteractiveCanvasController *)self layoutForInfo:a4],
          double v28 = v23,
          double v27 = v22,
          double v20 = v112,
          double v26 = v21,
          double v25 = v112,
          v24))
    {
      objc_msgSend(v24, "rectForSelection:", a3, v25, v26, v27, v28);
      objc_msgSend(v24, "rectInRoot:");
      [(TSDInteractiveCanvasController *)self p_outsetSelectionRect:"p_outsetSelectionRect:"];
      double v20 = v29;
      double v21 = v30;
      double v22 = v31;
      double v23 = v32;
      if (objc_opt_respondsToSelector()) {
        [v19 zoomRectForSelection:a3];
      }
      else {
        [v24 frameInRoot];
      }
      [(TSDInteractiveCanvasController *)self p_outsetSelectionRect:"p_outsetSelectionRect:"];
    }
  }
  else
  {
    long long v33 = (void *)TSUProtocolCast();
    double v28 = v23;
    double v27 = v22;
    double v26 = v21;
    double v25 = v20;
    if (v33)
    {
      long long v115 = 0u;
      long long v116 = 0u;
      long long v113 = 0u;
      long long v114 = 0u;
      long long v34 = (void *)[v33 infos];
      uint64_t v35 = [v34 countByEnumeratingWithState:&v113 objects:v117 count:16];
      double v28 = v23;
      double v27 = v22;
      double v20 = v112;
      double v26 = v21;
      double v25 = v112;
      if (v35)
      {
        uint64_t v36 = v35;
        uint64_t v37 = *(void *)v114;
        double v20 = v112;
        do
        {
          for (uint64_t i = 0; i != v36; ++i)
          {
            if (*(void *)v114 != v37) {
              objc_enumerationMutation(v34);
            }
            id v39 = [(TSDInteractiveCanvasController *)self layoutForInfoNearestVisibleRect:*(void *)(*((void *)&v113 + 1) + 8 * i)];
            if (v39)
            {
              double v40 = v39;
              id v41 = [(TSDInteractiveCanvasController *)self p_repForLayout:v39 createIfNeeded:1];
              if (v41) {
                [v41 frameInUnscaledCanvasIncludingChrome];
              }
              else {
                [v40 frameInRoot];
              }
              [(TSDInteractiveCanvasController *)self p_outsetSelectionRect:"p_outsetSelectionRect:"];
              v127.origin.CGFloat x = v42;
              v127.origin.CGFloat y = v43;
              v127.size.CGFloat width = v44;
              v127.size.CGFloat height = v45;
              v119.origin.CGFloat x = v20;
              v119.origin.CGFloat y = v21;
              v119.size.CGFloat width = v22;
              v119.size.CGFloat height = v23;
              CGRect v120 = CGRectUnion(v119, v127);
              double v20 = v120.origin.x;
              double v21 = v120.origin.y;
              double v22 = v120.size.width;
              double v23 = v120.size.height;
            }
          }
          uint64_t v36 = [v34 countByEnumeratingWithState:&v113 objects:v117 count:16];
        }
        while (v36);
        double v28 = v109;
        double v27 = v110;
        double v26 = v111;
        double v25 = v112;
      }
    }
  }
  CGFloat v104 = v28;
  double v107 = v25;
  CGFloat v98 = v26;
  CGFloat v100 = v27;
  v121.origin.CGFloat x = v20;
  v121.origin.CGFloat y = v21;
  v121.size.CGFloat width = v22;
  v121.size.CGFloat height = v23;
  if (!CGRectIsNull(v121))
  {
    v122.size.CGFloat height = v104;
    v122.origin.CGFloat x = v107;
    v122.origin.CGFloat y = v98;
    v122.size.CGFloat width = v100;
    if (!CGRectIsEmpty(v122))
    {
      if ([(TSDInteractiveCanvasController *)self shouldZoomOnSelectionChange])
      {
        if (objc_opt_respondsToSelector())
        {
          [(TSDInteractiveCanvasController *)self p_targetPointSize];
          objc_msgSend(v19, "viewScaleForSelectionWithTargetPointSize:");
          *(float *)&double v46 = v46;
          if (*(float *)&v46 > 0.0)
          {
            double v47 = (void *)[(TSDCanvasLayerHosting *)[(TSDInteractiveCanvasController *)self layerHost] canvasLayer];
            [(TSDInteractiveCanvasController *)self fitWidthViewScale];
            [v47 maximumPinchViewScale];
            TSUClamp();
            *(float *)&double v48 = v48;
            float v97 = *(float *)&v48;
            [(TSDInteractiveCanvasController *)self visibleUnscaledRect];
            CGFloat v91 = v50;
            CGFloat v94 = v49;
            CGFloat v88 = v52;
            CGFloat v89 = v51;
            [(TSDInteractiveCanvasController *)self visibleUnscaledRectForAutoscroll];
            v128.origin.CGFloat x = v53;
            v128.origin.CGFloat y = v54;
            v128.size.CGFloat width = v55;
            v128.size.CGFloat height = v56;
            v123.origin.CGFloat y = v91;
            v123.origin.CGFloat x = v94;
            v123.size.CGFloat height = v88;
            v123.size.CGFloat width = v89;
            if (!CGRectEqualToRect(v123, v128))
            {
              long long v57 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
              uint64_t v58 = [NSString stringWithUTF8String:"-[TSDInteractiveCanvasController p_autoscrollToSelection:withInfo:isInitialSelection:focusRect:scrollImmediately:skipZoom:]"];
              objc_msgSend(v57, "handleFailureInFunction:file:lineNumber:description:", v58, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 6883, @"Scrolling automatically in an unsupported configuration!");
            }
            [(TSDInteractiveCanvasController *)self visibleBoundsRect];
            double v60 = v97;
            double v92 = v61;
            double v95 = v59 / v97;
            if (v22 > v95)
            {
              double v96 = v59;
              [(TSDInteractiveCanvasController *)self fitWidthViewScale];
              [v47 maximumPinchViewScale];
              TSUClamp();
              *(float *)&double v62 = v62;
              float v97 = *(float *)&v62;
              double v60 = *(float *)&v62;
              double v95 = v96 / *(float *)&v62;
            }
            double v90 = v60;
            if (v14)
            {
              uint64_t v63 = [(TSDInteractiveCanvasController *)self p_centerOnInitialSelection];
              if (v63)
              {
                char v64 = 1;
LABEL_40:
                double v93 = v92 / v90;
                if (v107 > v20)
                {
                  CGRect v66 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
                  uint64_t v67 = [NSString stringWithUTF8String:"-[TSDInteractiveCanvasController p_autoscrollToSelection:withInfo:isInitialSelection:focusRect:scrollImmediately:skipZoom:]"];
                  uint64_t v63 = objc_msgSend(v66, "handleFailureInFunction:file:lineNumber:description:", v67, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 6899, @"zoomrect should be a superrect of target rect");
                }
                double v68 = (v95 - v22) * 0.5;
                if (v68 < 0.0) {
                  double v68 = 0.0;
                }
                double v69 = v20 - v68;
                double v70 = (v93 - v23) * 0.5;
                if (v70 < 0.0) {
                  double v70 = 0.0;
                }
                CGFloat v71 = TSDRectWithOriginAndSize(v63, v69, v21 - v70, v95, v93);
                double v101 = TSDTranslatedRectMaximizingOverlapWithRect(v71, v72, v73, v74, v107, v98, v100, v104);
                CGFloat v105 = v75;
                if ((v64 & 1) == 0)
                {
                  CGFloat v99 = v77;
                  CGFloat v108 = v76;
                  v124.origin.CGFloat x = x;
                  v124.origin.CGFloat y = y;
                  v124.size.CGFloat width = width;
                  v124.size.CGFloat height = height;
                  v129.origin.CGFloat y = v111;
                  v129.origin.CGFloat x = v112;
                  v129.size.CGFloat height = v109;
                  v129.size.CGFloat width = v110;
                  if (!CGRectEqualToRect(v124, v129)) {
                    TSDTranslatedRectMaximizingOverlapWithRect(v101, v105, v108, v99, x, y, width, height);
                  }
                }
                objc_msgSend((id)-[TSDCanvasLayerHosting canvasLayer](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "canvasLayer"), "contentInset");
                [(TSDCanvas *)[(TSDInteractiveCanvasController *)self canvas] unscaledSize];
                TSUClamp();
                double v102 = v78;
                objc_msgSend((id)-[TSDCanvasLayerHosting canvasLayer](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "canvasLayer"), "contentInset");
                [(TSDCanvas *)[(TSDInteractiveCanvasController *)self canvas] unscaledSize];
                TSUClamp();
                -[TSDInteractiveCanvasController clampedUnscaledContentOffset:forViewScale:](self, "clampedUnscaledContentOffset:forViewScale:", v102, v79, v97);
                if (!a8)
                {
                  double v103 = v81;
                  double v106 = v80;
                  [(TSDInteractiveCanvasController *)self viewScale];
                  double v82 = v97;
                  if (v83 != v97
                    || (([(TSDInteractiveCanvasController *)self contentOffset], double v82 = v97, v106 == v85)
                      ? (BOOL v86 = v103 == v84)
                      : (BOOL v86 = 0),
                        !v86))
                  {
                    -[TSDInteractiveCanvasController setViewScale:contentOffset:clampOffset:animated:](self, "setViewScale:contentOffset:clampOffset:animated:", 1, 1, v82, v106, v103);
                    double v21 = v111;
                    double v20 = v112;
                    double v23 = v109;
                    double v22 = v110;
                  }
                }
                goto LABEL_56;
              }
            }
            uint64_t v63 = [(TSDInteractiveCanvasController *)self viewScale];
            if (v65 != v97)
            {
              char v64 = 0;
              goto LABEL_40;
            }
          }
        }
      }
    }
  }
LABEL_56:
  v125.origin.CGFloat x = v20;
  v125.origin.CGFloat y = v21;
  v125.size.CGFloat width = v22;
  v125.size.CGFloat height = v23;
  if (!CGRectIsNull(v125))
  {
    v126.origin.CGFloat x = x;
    v126.origin.CGFloat y = y;
    v126.size.CGFloat width = width;
    v126.size.CGFloat height = height;
    if (!CGRectIsNull(v126))
    {
      double v23 = height;
      double v22 = width;
      double v21 = y;
      double v20 = x;
    }
    BOOL mShouldAnimateAutoscroll = self->mShouldAnimateAutoscroll;
    if (self->mShouldCenterSelectionWhenAutoscrolling) {
      -[TSDInteractiveCanvasController scrollRectToVisibleCenter:animated:onlyScrollNecessaryAxes:](self, "scrollRectToVisibleCenter:animated:onlyScrollNecessaryAxes:", mShouldAnimateAutoscroll, 1, v20, v21, v22, v23);
    }
    else {
      -[TSDInteractiveCanvasController scrollRectToVisible:animated:](self, "scrollRectToVisible:animated:", mShouldAnimateAutoscroll, v20, v21, v22, v23);
    }
  }
}

- (void)i_syncWithLayoutThread
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __56__TSDInteractiveCanvasController_i_syncWithLayoutThread__block_invoke;
  v2[3] = &unk_2646AF7B8;
  v2[4] = self;
  [(TSDInteractiveCanvasController *)self p_acquireLockAndPerformAction:v2];
}

uint64_t __56__TSDInteractiveCanvasController_i_syncWithLayoutThread__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 418) = 0;
  return result;
}

- (void)animateToViewScale:(double)a3 contentOffset:(CGPoint)a4 duration:(double)a5
{
}

- (void)animateToViewScale:(double)a3 contentOffset:(CGPoint)a4 duration:(double)a5 completion:(id)a6
{
}

- (void)animateToViewScale:(double)a3 contentOffset:(CGPoint)a4 duration:(double)a5 forceAnimation:(BOOL)a6 completion:(id)a7
{
  double y = a4.y;
  double x = a4.x;
  v86[1] = *MEMORY[0x263EF8340];
  if (!a6
    && (objc_msgSend((id)-[TSDCanvasLayerHosting canvasLayer](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "canvasLayer"), "viewScale"), v13 == a3)&& (-[TSDInteractiveCanvasController contentOffset](self, "contentOffset"), x == v15)&& y == v14)
  {
    if (a7)
    {
      double v16 = (void (*)(id, uint64_t))*((void *)a7 + 2);
      v16(a7, 1);
    }
  }
  else if (!self->mAnimatingViewScale)
  {
    double v58 = x;
    double v59 = y;
    double v60 = a5;
    self->mAnimatingViewScale = 1;
    double v17 = (void *)[(TSDCanvasLayerHosting *)[(TSDInteractiveCanvasController *)self layerHost] canvasView];
    id v18 = (void *)[v17 canvasLayer];
    double v19 = (void *)[v17 enclosingScrollView];
    [(TSDInteractiveCanvasController *)self i_viewWillBeginZooming];
    [v18 bounds];
    double v21 = v20;
    double v23 = v22;
    [v18 contentInset];
    CGFloat v25 = v24;
    CGFloat v27 = v26;
    memset(&v84, 0, sizeof(v84));
    CGAffineTransformMakeTranslation(&v84, -v21, -v23);
    CGAffineTransform m = v84;
    CGAffineTransformTranslate(&v83, &m, v27, v25);
    CGAffineTransform v84 = v83;
    CGAffineTransform v81 = v83;
    [v17 setTransform:&v81];
    [v18 bounds];
    double v29 = v28;
    [v18 bounds];
    double v56 = v27;
    double v57 = v25;
    objc_msgSend(v18, "setBounds:", v27, v25, v29);
    [(TSDInteractiveCanvasController *)self viewScale];
    double v31 = v30;
    memset(&v83, 0, sizeof(v83));
    double v32 = a3 / v30;
    if (v17) {
      [v17 transform];
    }
    CGAffineTransform v80 = v83;
    CGAffineTransformTranslate(&m, &v80, v21, v23);
    CGAffineTransform v83 = m;
    CGAffineTransform v80 = m;
    CGAffineTransformScale(&m, &v80, a3 / v31, a3 / v31);
    CGAffineTransform v83 = m;
    [v18 position];
    double v34 = v33;
    double v36 = v35;
    [v19 contentOffset];
    double v38 = v37;
    double v40 = v39;
    double v41 = TSDSubtractPoints(v37, v39, v34);
    double v43 = TSDMultiplyPointScalar(v41, v42, v32);
    double v45 = TSDSubtractPoints(v43, v44, v41);
    double v46 = TSDSubtractPoints(v34, v36, v45) - (v56 - v56 * v32 + -(v38 - v58 * v31) * v32);
    v72[0] = MEMORY[0x263EF8330];
    v72[1] = 3221225472;
    CGFloat v73 = __102__TSDInteractiveCanvasController_animateToViewScale_contentOffset_duration_forceAnimation_completion___block_invoke;
    CGFloat v74 = &unk_2646B14D8;
    double v48 = v47 - (v57 - v57 * v32 + -(v40 - v59 * v31) * v32);
    CGAffineTransform v77 = v83;
    double v75 = v17;
    double v76 = v18;
    double v78 = v46;
    double v79 = v48;
    v62[0] = MEMORY[0x263EF8330];
    v62[1] = 3221225472;
    uint64_t v63 = __102__TSDInteractiveCanvasController_animateToViewScale_contentOffset_duration_forceAnimation_completion___block_invoke_2;
    char v64 = &unk_2646B1500;
    double v65 = v18;
    CGRect v66 = v17;
    double v69 = a3;
    double v70 = v58;
    double v71 = v59;
    uint64_t v67 = self;
    id v68 = a7;
    if (objc_opt_respondsToSelector()) {
      -[TSDInteractiveCanvasControllerDelegate interactiveCanvasController:willAnimateToViewScale:withDuration:unscaledContentOffset:](self->mDelegate, "interactiveCanvasController:willAnimateToViewScale:withDuration:unscaledContentOffset:", self, a3, v60, v58, v59);
    }
    double v49 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    double v85 = @"TSDInteractiveCanvasControllerDurationKey";
    *(float *)&double v50 = v60;
    v86[0] = [NSNumber numberWithFloat:v50];
    objc_msgSend(v49, "postNotificationName:object:userInfo:", @"TSDCanvasUpdateZoomNotification", self, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v86, &v85, 1));
    if (v60 <= 0.0)
    {
      v73((uint64_t)v72);
      v63((uint64_t)v62);
    }
    else
    {
      [MEMORY[0x263F158F8] begin];
      [MEMORY[0x263F158F8] setCompletionBlock:v62];
      double v51 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:@"position"];
      objc_msgSend(v51, "setToValue:", objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", v46, v48));
      double v52 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:@"transform"];
      CGFloat v53 = (void *)MEMORY[0x263F08D40];
      CGAffineTransform m = v83;
      CATransform3DMakeAffineTransform(&v61, &m);
      objc_msgSend(v52, "setToValue:", objc_msgSend(v53, "valueWithCATransform3D:", &v61));
      CGFloat v54 = (void *)[MEMORY[0x263F15750] animation];
      objc_msgSend(v54, "setAnimations:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", v51, v52, 0));
      [v54 setDuration:v60];
      objc_msgSend(v54, "setTimingFunction:", objc_msgSend(MEMORY[0x263F15808], "functionWithName:", *MEMORY[0x263F15EB8]));
      [v54 setRemovedOnCompletion:0];
      [v54 setFillMode:*MEMORY[0x263F15AA8]];
      mCurrentAnimation = self->mCurrentAnimation;
      if (mCurrentAnimation)
      {
        [(TSDCanvasAnimation *)mCurrentAnimation beginTime];
        objc_msgSend(v54, "setBeginTime:");
        objc_msgSend(v54, "setBeginTimeMode:", -[TSDCanvasAnimation beginTimeMode](self->mCurrentAnimation, "beginTimeMode"));
      }
      [v18 addAnimation:v54 forKey:@"viewScaleAnimation"];
      [MEMORY[0x263F158F8] commit];
    }
  }
}

uint64_t __102__TSDInteractiveCanvasController_animateToViewScale_contentOffset_duration_forceAnimation_completion___block_invoke(uint64_t a1)
{
  long long v2 = *(_OWORD *)(a1 + 64);
  v4[0] = *(_OWORD *)(a1 + 48);
  v4[1] = v2;
  v4[2] = *(_OWORD *)(a1 + 80);
  [*(id *)(a1 + 32) setTransform:v4];
  return objc_msgSend(*(id *)(a1 + 40), "setPosition:", *(double *)(a1 + 96), *(double *)(a1 + 104));
}

uint64_t __102__TSDInteractiveCanvasController_animateToViewScale_contentOffset_duration_forceAnimation_completion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) removeAnimationForKey:@"viewScaleAnimation"];
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "enclosingScrollView"), "layer"), "removeAllAnimations");
  long long v2 = *(void **)(a1 + 32);
  long long v3 = *(_OWORD *)(MEMORY[0x263F15740] + 80);
  v8[4] = *(_OWORD *)(MEMORY[0x263F15740] + 64);
  v8[5] = v3;
  long long v4 = *(_OWORD *)(MEMORY[0x263F15740] + 112);
  v8[6] = *(_OWORD *)(MEMORY[0x263F15740] + 96);
  void v8[7] = v4;
  long long v5 = *(_OWORD *)(MEMORY[0x263F15740] + 16);
  v8[0] = *MEMORY[0x263F15740];
  v8[1] = v5;
  long long v6 = *(_OWORD *)(MEMORY[0x263F15740] + 48);
  void v8[2] = *(_OWORD *)(MEMORY[0x263F15740] + 32);
  v8[3] = v6;
  [v2 setTransform:v8];
  objc_msgSend(*(id *)(a1 + 48), "p_applyViewScale:andContentOffset:", *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(*(id *)(*(void *)(a1 + 48) + 8), "interactiveCanvasControllerDidAnimateViewScale:");
  }
  *(unsigned char *)(*(void *)(a1 + 48) + 496) = 0;
  [*(id *)(a1 + 48) viewDidEndZooming];
  uint64_t result = *(void *)(a1 + 56);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

- (void)p_applyViewScale:(double)a3 andContentOffset:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  self->mIgnoreContentOffsetChanges = 1;
  [(TSDInteractiveCanvasController *)self setViewScale:a3];
  self->mIgnoreContentOffsetChanges = 0;
  -[TSDInteractiveCanvasController setContentOffset:animated:](self, "setContentOffset:animated:", 0, x, y);
}

- (void)doubleTappedCanvasBackgroundAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (objc_opt_respondsToSelector())
  {
    mDelegate = self->mDelegate;
    -[TSDInteractiveCanvasControllerDelegate doubleTappedCanvasBackgroundAtPoint:](mDelegate, "doubleTappedCanvasBackgroundAtPoint:", x, y);
  }
}

- (id)viewWithTransferredLayers
{
  if (![(TSDInteractiveCanvasController *)self isCanvasInteractive])
  {
    long long v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSDInteractiveCanvasController viewWithTransferredLayers]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 7136, @"viewWithTransferredLayers makes sense only when the canvas is interactive");
  }
  long long v5 = (void *)[(TSDCanvasLayerHosting *)[(TSDInteractiveCanvasController *)self layerHost] canvasView];
  id v6 = objc_alloc(MEMORY[0x263F1CB60]);
  [v5 frame];
  id v7 = objc_msgSend(v6, "initWithFrame:");
  [v5 bounds];
  objc_msgSend(v7, "setBounds:");
  CGFloat v8 = (void *)[(NSArray *)[(CALayer *)[(TSDInteractiveCanvasController *)self repContainerLayer] sublayers] copy];
  [v8 makeObjectsPerformSelector:sel_removeFromSuperlayer];
  objc_msgSend((id)objc_msgSend(v7, "layer"), "setSublayers:", v8);

  self->mOverlayLayer = 0;
  return v7;
}

- (CGPoint)lastTapPoint
{
  double x = self->mLastTapPoint.x;
  double y = self->mLastTapPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (id)canvasReferenceController
{
  return 0;
}

- (TSDCanvasLayerHosting)layerHost
{
  return self->mLayerHost;
}

- (void)setLastTapPoint:(CGPoint)a3
{
  self->mLastTapPoint = a3;
}

- (TSDCanvas)canvas
{
  return self->mCanvas;
}

- (TSDInteractiveCanvasControllerDelegate)delegate
{
  return self->mDelegate;
}

- (BOOL)inspectorModeEnabled
{
  return self->mInspectorModeEnabled;
}

- (BOOL)shouldSuppressRendering
{
  return self->mShouldSuppressRendering;
}

- (BOOL)animatingViewScale
{
  return self->mAnimatingViewScale;
}

- (BOOL)textGesturesInFlight
{
  return self->mTextGesturesInFlight;
}

- (void)setTextGesturesInFlight:(BOOL)a3
{
  self->mTextGesturesInFlight = a3;
}

- (TSDRulerController)rulerController
{
  return self->mRulerController;
}

- (void)setRulerController:(id)a3
{
  self->mRulerController = (TSDRulerController *)a3;
}

- (TSDRepDirectLayerHostProvider)directLayerHostProvider
{
  return self->_directLayerHostProvider;
}

- (void)setDirectLayerHostProvider:(id)a3
{
}

- (BOOL)resizeCanvasOnLayout
{
  return self->mResizeCanvasOnLayout;
}

- (void)setResizeCanvasOnLayout:(BOOL)a3
{
  self->mResizeCanvasOnLayout = a3;
}

- (void)setCanvasEditor:(id)a3
{
}

- (BOOL)preventSettingNilEditorOnTextResponder
{
  return self->mPreventSettingNilEditorOnTextResponder;
}

- (void)setPreventSettingNilEditorOnTextResponder:(BOOL)a3
{
  self->mPreventSettingNilEditorOnTextResponder = a3;
}

- (BOOL)createRepsForOffscreenLayouts
{
  return self->mCreateRepsForOffscreenLayouts;
}

- (void)setCreateRepsForOffscreenLayouts:(BOOL)a3
{
  self->mCreateRepsForOffscreenLayouts = a3;
}

- (BOOL)allowLayoutAndRenderOnThread
{
  return self->mLayoutAndRenderOnThreadDuringScroll;
}

- (BOOL)staticLayoutAndRenderOnThread
{
  return self->mStaticLayoutAndRenderOnThread;
}

- (BOOL)nestedCanvasAllowLayoutAndRenderOnThread
{
  return self->mNestedCanvasAllowLayoutAndRenderOnThread;
}

- (void)setNestedCanvasAllowLayoutAndRenderOnThread:(BOOL)a3
{
  self->mNestedCanvasAllowLayoutAndRenderOnThread = a3;
}

- (BOOL)forceTilingLayoutOnThreadWhenScrolling
{
  return self->mForceTilingLayoutOnThreadWhenScrolling;
}

- (void)setForceTilingLayoutOnThreadWhenScrolling:(BOOL)a3
{
  self->mForceTilingLayoutOnThreadWhenScrolling = a3;
}

- (BOOL)currentlyWaitingOnThreadedLayoutAndRender
{
  return self->mCurrentlyWaitingOnThreadedLayoutAndRender;
}

- (BOOL)shouldAutoscrollToSelectionAfterLayout
{
  return self->mShouldAutoscrollToSelectionAfterLayout;
}

- (void)setShouldAutoscrollToSelectionAfterLayout:(BOOL)a3
{
  self->mShouldAutoscrollToSelectionAfterLayout = a3;
}

- (BOOL)suppressAutozoomToSelectionAfterLayout
{
  return self->mSuppressAutozoomToSelectionAfterLayout;
}

- (void)setSuppressAutozoomToSelectionAfterLayout:(BOOL)a3
{
  self->mSuppressAutozoomToSelectionAfterLayout = a3;
}

- (void)setUnobscuredScrollViewFrame:(CGRect)a3
{
  self->mUnobscuredScrollViewFrame = a3;
}

- (BOOL)shouldClipThemeContentToCanvas
{
  return self->mShouldClipThemeContentToCanvas;
}

- (void)setShouldClipThemeContentToCanvas:(BOOL)a3
{
  self->mShouldClipThemeContentToCanvas = a3;
}

- (CGRect)p_visibleBoundsRectForTiling
{
  objc_copyStruct(v6, &self->mVisibleBoundsRectForTiling, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (void)setP_visibleBoundsRectForTiling:(CGRect)a3
{
  CGRect v3 = a3;
  objc_copyStruct(&self->mVisibleBoundsRectForTiling, &v3, 32, 1, 0);
}

- (CGRect)p_visibleUnscaledRect
{
  objc_copyStruct(v6, &self->mVisibleUnscaledRect, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (void)setP_visibleUnscaledRect:(CGRect)a3
{
  CGRect v3 = a3;
  objc_copyStruct(&self->mVisibleUnscaledRect, &v3, 32, 1, 0);
}

- (CALayer)repContainerLayer
{
  return self->mRepContainerLayer;
}

- (CALayer)overlayLayer
{
  return self->mOverlayLayer;
}

- (BOOL)overlayLayerSuppressed
{
  return self->mOverlayLayerSuppressed;
}

- (BOOL)showGrayOverlay
{
  return self->mShowGrayOverlay;
}

- (void)setShowGrayOverlay:(BOOL)a3
{
  self->mShowGrayOverladouble y = a3;
}

- (BOOL)inVersionBrowsingMode
{
  return self->mInVersionBrowsingMode;
}

- (void)setInVersionBrowsingMode:(BOOL)a3
{
  self->mInVersionBrowsingMode = a3;
}

- (BOOL)inReadMode
{
  return self->mInReadMode;
}

- (BOOL)showInvisibleObjects
{
  return self->mShowInvisibleObjects;
}

- (TSDTrackingController)trackingController
{
  return self->mTrackingController;
}

- (void)setTrackingController:(id)a3
{
}

- (BOOL)supportsBackgroundTileRendering
{
  return self->mSupportsBackgroundTileRendering;
}

- (void)setSupportsBackgroundTileRendering:(BOOL)a3
{
  self->mSupportsBackgroundTileRendering = a3;
}

- (NSSet)p_cachedTopLevelTilingLayers
{
  return (NSSet *)objc_getProperty(self, a2, 664, 1);
}

- (void)setP_cachedTopLevelTilingLayers:(id)a3
{
}

- ($73314616FDF354EDC5180AB8A0BD2955)screenTopContentPlacement
{
  [(TSDInteractiveCanvasController *)self i_clippingBoundsForScrollViewEnclosingCanvas];
  CGFloat x = v19.origin.x;
  CGFloat y = v19.origin.y;
  CGFloat width = v19.size.width;
  CGFloat height = v19.size.height;
  double MidX = CGRectGetMidX(v19);
  [(TSKScrollView *)[(TSDCanvasView *)[(TSDInteractiveCanvasController *)self canvasView] enclosingScrollView] bounds];
  double v9 = MidX / v8;
  v20.origin.CGFloat x = x;
  v20.origin.CGFloat y = y;
  v20.size.CGFloat width = width;
  v20.size.CGFloat height = height;
  double MinY = CGRectGetMinY(v20);
  uint64_t v11 = [(TSKScrollView *)[(TSDCanvasView *)[(TSDInteractiveCanvasController *)self canvasView] enclosingScrollView] bounds];
  v14.n128_f64[0] = v9;
  v12.n128_f64[0] = MinY / v13;
  TSDContentPlacementWithAnchorPoint(v11, v14, v12);
  result.var0.CGFloat y = v16;
  result.var0.CGFloat x = v15;
  return result;
}

- ($73314616FDF354EDC5180AB8A0BD2955)screenBottomContentPlacement
{
  [(TSDInteractiveCanvasController *)self i_clippingBoundsForScrollViewEnclosingCanvas];
  CGFloat x = v19.origin.x;
  CGFloat y = v19.origin.y;
  CGFloat width = v19.size.width;
  CGFloat height = v19.size.height;
  double MidX = CGRectGetMidX(v19);
  [(TSKScrollView *)[(TSDCanvasView *)[(TSDInteractiveCanvasController *)self canvasView] enclosingScrollView] bounds];
  double v9 = MidX / v8;
  v20.origin.CGFloat x = x;
  v20.origin.CGFloat y = y;
  v20.size.CGFloat width = width;
  v20.size.CGFloat height = height;
  double MaxY = CGRectGetMaxY(v20);
  uint64_t v11 = [(TSKScrollView *)[(TSDCanvasView *)[(TSDInteractiveCanvasController *)self canvasView] enclosingScrollView] bounds];
  v14.n128_f64[0] = v9;
  v12.n128_f64[0] = MaxY / v13;
  TSDContentPlacementWithAnchorPoint(v11, v14, v12);
  result.var0.CGFloat y = v16;
  result.var0.CGFloat x = v15;
  return result;
}

- ($73314616FDF354EDC5180AB8A0BD2955)touchContentPlacement
{
  double v2 = (void *)[(TSDCanvasLayerHosting *)[(TSDInteractiveCanvasController *)self layerHost] asiOSCVC];
  [v2 touchContentPlacement];
  result.var0.CGFloat y = v4;
  result.var0.CGFloat x = v3;
  return result;
}

- ($73314616FDF354EDC5180AB8A0BD2955)centerPlusMovementContentPlacement
{
  double v2 = (void *)[(TSDCanvasLayerHosting *)[(TSDInteractiveCanvasController *)self layerHost] asiOSCVC];
  [v2 centerPlusMovementContentPlacement];
  result.var0.CGFloat y = v4;
  result.var0.CGFloat x = v3;
  return result;
}

- (id)clampContentLocation:(id)a3 forPlacement:(id)a4
{
  double y = a4.var0.y;
  double x = a4.var0.x;
  id v7 = -[TSDInteractiveCanvasController convertContentLocation:fromPlacement:toPlacement:](self, "convertContentLocation:fromPlacement:toPlacement:", a3, a4.var0.x, a4.var0.y, 0.0, 0.0);
  [v7 unscaledPoint];
  double v9 = v8;
  double v11 = v10;
  [v7 viewScale];
  -[TSDInteractiveCanvasController clampedUnscaledContentOffset:forViewScale:](self, "clampedUnscaledContentOffset:forViewScale:", v9, v11, v12);
  objc_msgSend(v7, "setUnscaledPoint:");
  return -[TSDInteractiveCanvasController convertContentLocation:fromPlacement:toPlacement:](self, "convertContentLocation:fromPlacement:toPlacement:", v7, 0.0, 0.0, x, y);
}

- (id)convertContentLocation:(id)a3 fromPlacement:(id)a4 toPlacement:(id)a5
{
  double v7 = TSDSubtractPoints(a5.var0.x, a5.var0.y, a4.var0.x);
  double v9 = v8;
  [a3 unscaledPoint];
  double v11 = v10;
  double v13 = v12;
  [(TSKScrollView *)[(TSDCanvasView *)[(TSDInteractiveCanvasController *)self canvasView] enclosingScrollView] bounds];
  double v15 = v7 * v14;
  [a3 viewScale];
  double v17 = v11 + v15 / v16;
  [(TSKScrollView *)[(TSDCanvasView *)[(TSDInteractiveCanvasController *)self canvasView] enclosingScrollView] bounds];
  double v19 = v9 * v18;
  [a3 viewScale];
  double v21 = v13 + v19 / v20;
  [a3 viewScale];
  return +[TSDContentLocation contentLocationWithUnscaledPoint:viewScale:](TSDContentLocation, "contentLocationWithUnscaledPoint:viewScale:", v17, v21, v22);
}

- (id)clampedCenterContentLocationForPoint:(CGPoint)a3 withPlacement:(id)a4 viewScale:(double)a5
{
  id v6 = -[TSDInteractiveCanvasController convertContentLocation:fromPlacement:toPlacement:](self, "convertContentLocation:fromPlacement:toPlacement:", +[TSDContentLocation contentLocationWithUnscaledPoint:viewScale:](TSDContentLocation, "contentLocationWithUnscaledPoint:viewScale:", a3.x, a3.y, a5), a4.var0.x, a4.var0.y, 0.5, 0.5);
  return -[TSDInteractiveCanvasController clampContentLocation:forPlacement:](self, "clampContentLocation:forPlacement:", v6, 0.5, 0.5);
}

- (CGPoint)clampedCenterPointForPoint:(CGPoint)a3 withPlacement:(id)a4 viewScale:(double)a5
{
  id v5 = -[TSDInteractiveCanvasController clampedCenterContentLocationForPoint:withPlacement:viewScale:](self, "clampedCenterContentLocationForPoint:withPlacement:viewScale:", a3.x, a3.y, a4.var0.x, a4.var0.y, a5);
  [v5 unscaledPoint];
  result.double y = v7;
  result.double x = v6;
  return result;
}

- ($73314616FDF354EDC5180AB8A0BD2955)contentPlacementForPoint:(CGPoint)a3 inView:(id)a4
{
  -[TSKScrollView convertPoint:fromView:]([(TSDCanvasView *)[(TSDInteractiveCanvasController *)self canvasView] enclosingScrollView], "convertPoint:fromView:", a4, a3.x, a3.y);
  double v6 = v5;
  double v8 = v7;
  [(TSKScrollView *)[(TSDCanvasView *)[(TSDInteractiveCanvasController *)self canvasView] enclosingScrollView] contentOffset];
  double v10 = TSDSubtractPoints(v6, v8, v9);
  double v12 = v11;
  [(TSKScrollView *)[(TSDCanvasView *)[(TSDInteractiveCanvasController *)self canvasView] enclosingScrollView] bounds];
  double v14 = v10 / v13;
  uint64_t v15 = [(TSKScrollView *)[(TSDCanvasView *)[(TSDInteractiveCanvasController *)self canvasView] enclosingScrollView] bounds];
  v18.n128_f64[0] = v14;
  v16.n128_f64[0] = v12 / v17;
  TSDContentPlacementWithAnchorPoint(v15, v18, v16);
  result.var0.double y = v20;
  result.var0.double x = v19;
  return result;
}

@end