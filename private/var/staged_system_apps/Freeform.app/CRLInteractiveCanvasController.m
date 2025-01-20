@interface CRLInteractiveCanvasController
+ (BOOL)selectorIsActionMethod:(SEL)a3;
+ (double)defaultAutoZoomAnimationDuration;
+ (double)maximumRecommendedViewScale;
+ (double)minimumRecommendedViewScale;
+ (double)smallRepOutsetForHitTestingWithPrecision:(BOOL)a3;
+ (double)zoomAnimationDefaultDuration;
+ (id)keyPathsForValuesAffectingCurrentViewScale;
+ (id)keyPathsForValuesAffectingEditingDisabled;
+ (id)keyPathsForValuesAffectingEditorController;
+ (id)keyPathsForValuesAffectingViewScale;
- ($114667933B9B2D05530DD42EBD1EDB26)p_scrollingInformationForSelectionPath:(SEL)a3 allowZoom:(id)a4;
- ($BCFEF2EB514CD33A670EC6D7ECA04AF1)p_collaboratorHUDPositionForSelectionPath:(SEL)a3 collaboratorPresence:(id)a4 allowScroll:(id)a5 hudSize:(BOOL)a6;
- (BOOL)allowAutoscroll;
- (BOOL)allowNegativeAutoscroll;
- (BOOL)allowedToEditMask;
- (BOOL)allowedToShowHyperlinkContextMenuForRep:(id)a3;
- (BOOL)allowsSelectionHighlight;
- (BOOL)allowsSelectionKnobs;
- (BOOL)animatingViewScale;
- (BOOL)anyConnectorKnobVisible;
- (BOOL)canCustomizeHyperlinkViewController;
- (BOOL)canModifyHyperlinks;
- (BOOL)canPerformInteractiveAction:(SEL)a3 withSender:(id)a4;
- (BOOL)canZoomToCurrentSelection;
- (BOOL)connectorKnobsEnabled;
- (BOOL)createRepsForOffscreenLayouts;
- (BOOL)currentSelectionPathContainsInfo:(id)a3;
- (BOOL)currentlyScrolling;
- (BOOL)displaysMultiselectionWithSingleBounds;
- (BOOL)documentIsSharedReadOnly;
- (BOOL)floatingCursorInMotion;
- (BOOL)handleDoubleTapAtPoint:(CGPoint)a3 inputType:(int64_t)a4;
- (BOOL)handleMultipleTapAtPoint:(CGPoint)a3;
- (BOOL)handleSingleTapAtPoint:(CGPoint)a3 extendingSelection:(BOOL)a4 inputType:(int64_t)a5;
- (BOOL)hasBeenTornDown;
- (BOOL)hasMediaReplacer;
- (BOOL)hasSelectedInfosInMultipleContainers;
- (BOOL)hasSelection;
- (BOOL)i_areLayersInvalidForDecorator:(id)a3;
- (BOOL)i_currentlySuppressingLayerUpdates;
- (BOOL)i_isRepContentPlatformView:(id)a3;
- (BOOL)i_shouldAttemptToPreserveContentOffsetAfterFixFrame;
- (BOOL)i_shouldShowCollaboratorCursorForLayout:(id)a3;
- (BOOL)isCanvasBackgroundAlignmentSnappingEnabled;
- (BOOL)isCanvasInteractive;
- (BOOL)isDiscardingEdits;
- (BOOL)isDraggingToInsertBoardItems;
- (BOOL)isDynamicOperationEnding;
- (BOOL)isHyperlinkKnobEnabledForRep:(id)a3;
- (BOOL)isInDynamicOperation;
- (BOOL)isInInspectorDynamicOperation;
- (BOOL)isTearingDown;
- (BOOL)openURL:(id)a3;
- (BOOL)overlayLayerSuppressed;
- (BOOL)p_accessibilityShouldCheckAncestorCanPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)p_areAnyCollaboratorsPresent;
- (BOOL)p_collaboratorOverlaysNeedUpdateForScroll;
- (BOOL)p_currentSelectionIsOnscreen;
- (BOOL)p_followEnabled;
- (BOOL)p_setNeedsDisplayIfNeededForAncestorRepOf:(id)a3 inRect:(CGRect)a4;
- (BOOL)p_shouldSuppressMultiselectResizeInfo;
- (BOOL)p_shouldTimeoutCollabCursor;
- (BOOL)p_shouldTransformCurrentSelectionAsSingleEntity;
- (BOOL)preventSettingNilEditorOnTextResponder;
- (BOOL)resizeCanvasOnLayout;
- (BOOL)respondsToSelector:(SEL)a3;
- (BOOL)respondsToSelector:(SEL)a3 withSender:(id)a4;
- (BOOL)scrollViewShouldOptOutOfUIScrollViewContentOffsetAnimationForScrollView:(id)a3;
- (BOOL)scrollViewShouldScrollToTop:(id)a3;
- (BOOL)selectionPathContainsOnlyInfosOnCanvas:(id)a3;
- (BOOL)sendViewportRequestMessageTo:(id)a3;
- (BOOL)shouldAllowKeyCommands;
- (BOOL)shouldCancelScrollingToSelectionPath:(id)a3 forChanges:(id)a4 withChangeSource:(id)a5;
- (BOOL)shouldCanvasScrollingSizeGrowToFitBoardContent;
- (BOOL)shouldEnableToolbarDoneButton;
- (BOOL)shouldEverShowPathHighlightOnInvisibleShapes;
- (BOOL)shouldGenerateGuidesForLayout:(id)a3;
- (BOOL)shouldLayoutTilingLayer:(id)a3;
- (BOOL)shouldPreventSyncingContentOffset;
- (BOOL)shouldPreventSyncingViewScale;
- (BOOL)shouldResizeCanvasToScrollView;
- (BOOL)shouldShowHyperlinkKnob;
- (BOOL)shouldShowInstructionalTextForLayout:(id)a3;
- (BOOL)shouldShowPathHighlightOnUnselectedInvisibleShapes;
- (BOOL)shouldShowTextOverflowGlyphs;
- (BOOL)shouldSupportedDynamicOperationsEnqueueCommandsInRealTime;
- (BOOL)shouldSuppressCollaboratorCursorHUDForController:(id)a3;
- (BOOL)shouldSuppressFontSmoothing;
- (BOOL)shouldSuppressFreehandContent;
- (BOOL)shouldSuppressRendering;
- (BOOL)shouldSuppressSelectionKnobsForRep:(id)a3;
- (BOOL)shouldZoomOnSelectionChange;
- (BOOL)showGrayOverlay;
- (BOOL)showInvisibleObjects;
- (BOOL)spellCheckingSupported;
- (BOOL)spellCheckingSuppressed;
- (BOOL)suppressesCollaboratorHUD;
- (BOOL)textGesturesInFlight;
- (BOOL)textMagnifierIsUp;
- (BOOL)usesAlternateDrawableSelectionHighlight;
- (BOOL)versionFidelityAlertWasShownIsValid;
- (BOOL)wantsToSuppressMultiselectionForPenTool;
- (CALayer)overlayLayer;
- (CALayer)repContainerLayer;
- (CGColor)canvasEdgeBackgroundColor;
- (CGPoint)clampedUnscaledContentOffset:(CGPoint)a3 forViewScale:(double)a4;
- (CGPoint)contentOffset;
- (CGPoint)convertBoundsToUnscaledPoint:(CGPoint)a3;
- (CGPoint)convertUnscaledToBoundsPoint:(CGPoint)a3;
- (CGPoint)p_computeClampedUnscaledContentOffsetWithTargetRect:(CGRect)a3 selectionContextRectWhenZooming:(CGRect)a4 viewScale:(double)a5 unscaledOutset:(double)dy;
- (CGPoint)p_contentOffsetToScrollRectToVisible:(CGRect)a3 shouldCenterVertically:(BOOL)a4 forceCenteringVertically:(BOOL)a5 forceCenteringHorizontally:(BOOL)a6;
- (CGPoint)smartZoomCenterForNoSelection;
- (CGRect)boundingRectForActiveGuidesForPoint:(CGPoint)a3;
- (CGRect)convertBoundsToUnscaledRect:(CGRect)a3;
- (CGRect)convertUnscaledToBoundsRect:(CGRect)a3;
- (CGRect)growUnscaledCanvasLayerRect:(CGRect)a3 withViewScale:(double)a4;
- (CGRect)i_visibleBoundsRectForHitTestingCanvasView;
- (CGRect)outsetSelectionRect:(CGRect)a3;
- (CGRect)p_calculateVisibleBoundsRectForTiling;
- (CGRect)p_calculateVisibleUnscaledRect;
- (CGRect)p_convertNeedsDisplayRect:(CGRect)a3 fromRep:(id)a4 toRepForDrawing:(id)a5;
- (CGRect)p_safeAreaLayoutGuideLayoutFrame;
- (CGRect)p_scaledRectToScrollToForSelectionPath:(id)a3 shouldCenterVertically:(BOOL)a4;
- (CGRect)p_unobscuredScrollViewFrameIgnoringObscuringRectangles;
- (CGRect)p_unosbcuredFrameOfView:(id)a3 includingObscuringRectangles:(BOOL)a4;
- (CGRect)p_visibleBoundsRectForTiling;
- (CGRect)p_visibleBoundsRectUsingSizeOfEnclosingScrollView:(BOOL)a3 respectObscuredFrame:(BOOL)a4 respectSafeArea:(BOOL)a5 respectObscuringRects:(BOOL)a6 respectAreaPastScollViewLimit:(BOOL)a7;
- (CGRect)p_visibleUnscaledRect;
- (CGRect)rectInRootForScrollingToSelectionPath:(id)a3 onLayout:(id)a4 allowingZooming:(BOOL)a5;
- (CGRect)unobscuredFrameOfView:(id)a3;
- (CGRect)unobscuredScrollViewFrame;
- (CGRect)visibleBoundsForTilingLayer:(id)a3;
- (CGRect)visibleBoundsRect;
- (CGRect)visibleBoundsRectForTiling;
- (CGRect)visibleBoundsRectIgnoringLimit;
- (CGRect)visibleBoundsRectUsingSizeOfEnclosingScrollView;
- (CGRect)visibleScaledBoundsForClippingRepsOnCanvas:(id)a3;
- (CGRect)visibleScaledRectForCanvasUI;
- (CGRect)visibleUnscaledRect;
- (CGRect)visibleUnscaledRectIgnoringLimit;
- (CGSize)canvasScrollingOutset;
- (CGSize)convertBoundsToUnscaledSize:(CGSize)a3;
- (CGSize)convertUnscaledToBoundsSize:(CGSize)a3;
- (CGSize)defaultMinimumUnscaledCanvasSize;
- (CGSize)i_canvasCenterOffsetForProposedViewScale:(double)a3 originalViewScale:(double)a4;
- (CGSize)p_calculatedSizeOfScrollViewEnclosingCanvas;
- (CGSize)p_sizeOfScrollViewEnclosingCanvasForVisibleCanvasCalculations;
- (CGSize)sizeOfScrollViewEnclosingCanvas;
- (CRLCanvas)canvas;
- (CRLCanvasAnimation)i_currentAnimation;
- (CRLCanvasContainerRep)topLevelContainerRepForEditing;
- (CRLCanvasEditor)canvasEditor;
- (CRLCanvasGuideController)guideController;
- (CRLCanvasLayer)canvasLayer;
- (CRLCanvasLayerHosting)layerHost;
- (CRLCanvasLayoutController)layoutController;
- (CRLCanvasRep)repForTextEditingInspecting;
- (CRLCanvasView)canvasView;
- (CRLChangeNotifier)changeNotifier;
- (CRLCollaboratorCursorRendererDelegate)collaboratorCursorDelegate;
- (CRLColor)selectionHighlightColor;
- (CRLConnectionLineAbstractLayout)highestZOrderConnectionLineLayoutAcrossBoard;
- (CRLContainerInfo)topLevelContainerInfoForEditing;
- (CRLDynamicOperationController)dynamicOperationController;
- (CRLEditorController)editorController;
- (CRLFreehandDrawingToolkit)freehandDrawingToolkit;
- (CRLGestureDispatcher)gestureDispatcher;
- (CRLInteractiveCanvasController)init;
- (CRLInteractiveCanvasControllerDelegate)delegate;
- (CRLInteractiveCanvasLayerHelper)i_interactiveCanvasLayerHelper;
- (CRLMediaReplacer)mediaReplacer;
- (CRLPKDrawingProvider)pkDrawingProvider;
- (CRLSearchReference)primaryFindResultSearchReference;
- (CRLSelectionModelTranslator)selectionModelTranslator;
- (CRLTrackerManipulatorCoordinator)tmCoordinator;
- (Class)wpSelectionClassForStorage:(id)a3;
- (NSArray)additionalLayersUnderRepLayers;
- (NSArray)i_decorators;
- (NSArray)infosToDisplay;
- (NSArray)temporaryAdditionalBoardItemsToDisplay;
- (NSArray)topLevelRepsForHitTesting;
- (NSMapTable)searchReferencesToHighlight;
- (NSSet)containersForSelection;
- (NSSet)currentCollaboratorPresences;
- (NSSet)infosForCurrentSelectionPath;
- (UITraitCollection)currentTraitCollection;
- (_TtC8Freeform19CRLCanvasBackground)canvasBackground;
- (_TtC8Freeform20CRLCommandController)commandController;
- (_TtC8Freeform21CRLEditingCoordinator)editingCoordinator;
- (_TtC8Freeform21CRLTextInputResponder)textInputResponder;
- (_TtC8Freeform24CRLMultiselectResizeInfo)multiselectResizeInfo;
- (_TtC8Freeform28CRLMathCalculationController)mathCalculationController;
- (_TtC8Freeform8CRLBoard)board;
- (double)contentsScale;
- (double)currentViewScale;
- (double)defaultTargetPointSize;
- (double)fitWidthViewScale;
- (double)i_nextCanvasViewScaleDetentForProposedViewScale:(double)a3 greater:(BOOL)a4 isFastPinch:(BOOL)a5;
- (double)i_viewScaleForProposedViewScale:(double)a3 originalViewScale:(double)a4 isFastPinch:(BOOL)a5;
- (double)p_safeAreaMargin;
- (double)p_targetViewScaleForUnscaledRect:(CGRect)a3;
- (double)targetPointSize;
- (double)viewScale;
- (double)visibleCanvasWidth;
- (id)actionForLayer:(id)a3 forKey:(id)a4;
- (id)additionalChildInfosForLayout:(id)a3;
- (id)additionalDependentLayoutsForBoardItem:(id)a3;
- (id)additionalVisibleInfosForCanvas:(id)a3;
- (id)backgroundColorAtUnscaledCanvasPoint:(CGPoint)a3;
- (id)closestRepToPoint:(CGPoint)a3 forStorage:(id)a4;
- (id)containerRenderablesForRep:(id)a3;
- (id)customRotateTrackerForCurrentSelection;
- (id)filteredMainCanvasRestoredSelectionPath:(id)a3;
- (id)hitKnobAtPoint:(CGPoint)a3 inputType:(int64_t)a4 returningRep:(id *)a5;
- (id)hitRep:(CGPoint)a3;
- (id)hitRep:(CGPoint)a3 passingTest:(id)a4;
- (id)hitRep:(CGPoint)a3 withPrecision:(BOOL)a4;
- (id)hitRep:(CGPoint)a3 withPrecision:(BOOL)a4 passingTest:(id)a5;
- (id)hitRepIgnoringClickThrough:(CGPoint)a3;
- (id)hitRepsAtPoint:(CGPoint)a3 withSlop:(CGSize)a4;
- (id)i_collaboratorPresenceSelectingLayout:(id)a3;
- (id)i_descriptionForViewScale:(double)a3 zoomMethod:(int64_t)a4;
- (id)infoForSelectionPath:(id)a3;
- (id)infosForSelectionPath:(id)a3;
- (id)layoutForInfo:(id)a3;
- (id)layoutForInfoNearestVisibleRect:(id)a3;
- (id)layoutForInfoNearestVisibleRect:(id)a3 intersectingSelectionPath:(id)a4;
- (id)layoutForSelectionPath:(id)a3;
- (id)layoutsForInfo:(id)a3;
- (id)layoutsForInfo:(id)a3 intersectingSelectionPath:(id)a4;
- (id)layoutsForSelectionPath:(id)a3;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)mostVisibleParentForFreehandDrawingLayouts;
- (id)newCanvasEditor;
- (id)numberFormatter;
- (id)p_infosByAddingAllAncestors:(id)a3;
- (id)p_layoutForShowingCollaboratorCursorHUDAtSelectionPath:(id)a3;
- (id)p_repForLayout:(id)a3 createIfNeeded:(BOOL)a4;
- (id)p_repsForCollaboratorCursorSelectionPath:(id)a3;
- (id)p_repsForStorage:(id)a3;
- (id)p_sourceInteractionSourceForNotficiationUserInfo;
- (id)p_topCollaboratorPresenceOfPresences:(id)a3;
- (id)parentForFreehandDrawingLayoutsAtPoint:(CGPoint)a3;
- (id)provideDynamicGuidesForLayout:(id)a3;
- (id)renderableForRep:(id)a3;
- (id)repForInfo:(id)a3;
- (id)repForInfo:(id)a3 createIfNeeded:(BOOL)a4;
- (id)repForLayout:(id)a3;
- (id)repsForInfo:(id)a3;
- (id)repsToHide;
- (id)selectionPathForSearchReference:(id)a3;
- (id)topLevelZOrderedSiblingsOfInfos:(id)a3;
- (id)unitFormatter;
- (id)unitStringForAngle:(double)a3;
- (id)unitStringForAngle:(double)a3 andLength:(double)a4;
- (id)unitStringForAngle:(double)a3 shouldNormalize:(BOOL)a4;
- (id)unitStringForNumber:(double)a3;
- (id)unitStringForPoint:(CGPoint)a3;
- (id)unitStringForSize:(CGSize)a3 forAccessibility:(BOOL)a4;
- (id)validatedLayoutForInfo:(id)a3;
- (int64_t)mathHintsMode;
- (unint64_t)p_editingDisabledReasons;
- (unint64_t)versionFidelityAlertWasShown;
- (void)addBackgroundRenderingObject:(id)a3;
- (void)addCollaboratorHUDController:(id)a3;
- (void)addCommonObservers;
- (void)addDecorator:(id)a3;
- (void)animateIntoConnectorMode;
- (void)animateToViewScale:(double)a3 contentOffset:(CGPoint)a4 duration:(double)a5 orientation:(int64_t)a6 completionHandler:(id)a7;
- (void)beginAnimations:(id)a3;
- (void)beginDynamicOperation;
- (void)beginFollowing:(id)a3 forHUDController:(id)a4;
- (void)beginPossiblyParallelInspectorDynamicOperation;
- (void)beginScrollingOperation;
- (void)canvas:(id)a3 createdRep:(id)a4;
- (void)canvasDidInvalidateAllLayers:(id)a3;
- (void)canvasDidLayout:(id)a3;
- (void)canvasDidValidateLayouts:(id)a3;
- (void)canvasDidValidateLayoutsWithDependencies:(id)a3;
- (void)canvasInvalidatedForLayout:(id)a3;
- (void)canvasInvalidatedForRep:(id)a3;
- (void)canvasLayoutInvalidated:(id)a3;
- (void)canvasWillUpdateRepsFromLayouts:(id)a3;
- (void)canvasWillValidateLayouts:(id)a3;
- (void)clearLayoutsForTopLevelContainerChange;
- (void)clearOptionsForScrollingToSelectionAfterLayout:(unint64_t)a3;
- (void)clipGuideToContainer:(id)a3 atUnscaledPoint:(CGPoint)a4;
- (void)closeOverlays;
- (void)collaboratorCursorSelectionPathChangedFromSelectionPath:(id)a3 toSelectionPath:(id)a4 collaboratorPresence:(id)a5;
- (void)collapseAllExpandedCollaboratorHUDs;
- (void)commitAnimations;
- (void)contentInsetsDidChangeForScrollView:(id)a3;
- (void)copyEditabilityPropertiesFromInteractiveCanvasController:(id)a3;
- (void)dealloc;
- (void)didExitPreviewMode;
- (void)didProcessAllChanges;
- (void)discardRepForClassChange:(id)a3;
- (void)documentEditabilityDidChange;
- (void)donateTipEventObjectsConnectedWithConnectionLine;
- (void)donateTipEventParticipantFollowed;
- (void)doubleTappedCanvasBackgroundAtPoint:(CGPoint)a3;
- (void)drawLayer:(id)a3 inContext:(CGContext *)a4;
- (void)endDynamicOperation;
- (void)endEditing;
- (void)endEditingDiscardingEdits;
- (void)endEditingWithFlags:(unint64_t)a3;
- (void)endFollowing:(id)a3 forHUDController:(id)a4;
- (void)endPossiblyParallelInspectorDynamicOperation;
- (void)endScrollingOperation;
- (void)forLayoutNearestVisibleRectForInfosForSelectionPath:(id)a3 performBlock:(id)a4;
- (void)forwardInvocation:(id)a3;
- (void)growCanvasAsNeededToRestoreContentOffset:(CGPoint)a3;
- (void)growCanvasAsNeededToSetContentOffset:(CGPoint)a3 scrollOptions:(unint64_t)a4;
- (void)hideCollaboratorHUDForCollaborator:(id)a3;
- (void)i_acquireLockAndPerformAction:(id)a3;
- (void)i_beginSuppressingLayerUpdatesExceptForReps:(id)a3;
- (void)i_canvasContentsScaleDidChange;
- (void)i_canvasDidUpdateVisibleBounds;
- (void)i_canvasWideGamutValueDidChange;
- (void)i_canvasWillLayout:(id)a3;
- (void)i_drawRepWithReadLock:(id)a3 inContext:(CGContext *)a4 forLayer:(id)a5;
- (void)i_endSuppressingLayerUpdates;
- (void)i_invalidateSelectionHighlightLayers;
- (void)i_layout;
- (void)i_recordUserViewScale;
- (void)i_repNeedsDisplay:(id)a3;
- (void)i_repNeedsDisplay:(id)a3 inRect:(CGRect)a4;
- (void)i_selectionDidChange;
- (void)i_setNeedsDisplayIfNeededForAncestorRepOf:(id)a3;
- (void)i_textDidChange;
- (void)i_viewDidEndZoomingWithUserInfo:(id)a3;
- (void)i_viewDidZoomToViewScale:(double)a3 notify:(BOOL)a4;
- (void)i_viewIsZoomingAtPoint:(CGPoint)a3;
- (void)i_viewScaleDidChange;
- (void)i_viewScrollDidChange;
- (void)i_viewScrollingEnded;
- (void)i_viewScrollingEndedWithUserInfo:(id)a3;
- (void)i_viewWillBeginZooming;
- (void)invalidateAllLayers;
- (void)invalidateCollaboratorHUDControllers;
- (void)invalidateContentLayersForRep:(id)a3;
- (void)invalidateLayersForDecorator:(id)a3;
- (void)invalidateOverlayLayersForRep:(id)a3;
- (void)invalidateReps;
- (void)invalidateVisibleBounds;
- (void)layerHostHasBeenTornDown;
- (void)layoutIfNeeded;
- (void)layoutInvalidated;
- (void)makeEditorPerformAction:(SEL)a3 withSender:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)p_beginCachingLayoutsForCollaboratorCursors;
- (void)p_beginObservingDocumentRoot;
- (void)p_beginZoomingOperation;
- (void)p_clearSelectionScrollingState;
- (void)p_collabParticipantsDidChange:(id)a3;
- (void)p_commonInit;
- (void)p_consumeRepsDrawnIntoAncestorToSetNeedsDisplayOnUpdatedGeometry;
- (void)p_editorControllerDidChangeTextInputEditor:(id)a3;
- (void)p_editorControllerSelectionDidChangeAndWantsKeyboard:(id)a3;
- (void)p_editorControllerSelectionPathDidChange:(id)a3;
- (void)p_endCachingLayoutsForCollaboratorCursors;
- (void)p_endObservingDocumentRootIfNeeded;
- (void)p_endZoomingOperation;
- (void)p_fadeInForZoomOperation;
- (void)p_fadeOutForZoomOperation;
- (void)p_notifyRepsForChangeFromSelectionPath:(id)a3 toSelectionPath:(id)a4;
- (void)p_notifyRepsForSelectionChangeFrom:(id)a3 to:(id)a4;
- (void)p_performBlockWithCachedLayoutsForCollaboratorCursors:(id)a3;
- (void)p_realTimeSessionNewParticipantDidJoin:(id)a3;
- (void)p_realTimeStateDidChange:(id)a3;
- (void)p_recursiveHitKnobAtPoint:(CGPoint)a3 inputType:(int64_t)a4 inRep:(id)a5 minDistance:(double *)a6 hitKnob:(id *)a7 hitRep:(id *)a8;
- (void)p_recursivelyAddRep:(id)a3 forStorage:(id)a4 toSet:(id)a5;
- (void)p_scrollToSelectionPath:(id)a3 scrollOptions:(unint64_t)a4;
- (void)p_scrollViewDidEndScrollingAnimation:(id)a3;
- (void)p_selectionDoneChangingWithFlags:(unint64_t)a3;
- (void)p_selectionPathDidChangeFromSelectionPath:(id)a3 toSelectionPath:(id)a4;
- (void)p_setCurrentlyScrolling:(BOOL)a3;
- (void)p_setTargetPointSize:(double)a3;
- (void)p_showCollaboratorHUDForCollaborator:(id)a3 withSelectionPath:(id)a4 allowScroll:(BOOL)a5 hudSize:(unint64_t)a6;
- (void)p_spellCheckerWordsDidChangeNotification:(id)a3;
- (void)p_spellCheckingStateChangedNotification:(id)a3;
- (void)p_teardownCanvasEditor;
- (void)p_textGesturesDidEndNotification:(id)a3;
- (void)p_textGesturesWillBeginNotification:(id)a3;
- (void)p_updateCanvasSizeFromLayouts;
- (void)p_updateInfosToDisplayIfNeeded;
- (void)p_updateUnobscuredFrame;
- (void)p_validateLayerSuppressionAPIAccess;
- (void)p_viewScrollingEnded;
- (void)performBlockOnMainThreadAfterLayoutIfNecessary:(id)a3;
- (void)performDiscreteFrameChangingOperationOnDrawables:(id)a3 withBlock:(id)a4;
- (void)positionDidUpdateForCollaboratorHUDController:(id)a3;
- (void)preprocessChanges:(id)a3 forChangeSource:(id)a4;
- (void)presentError:(id)a3 completionHandler:(id)a4;
- (void)presentErrors:(id)a3 withLocalizedDescription:(id)a4 completionHandler:(id)a5;
- (void)processChanges:(id)a3 forChangeSource:(id)a4;
- (void)recreateAllLayoutsAndReps;
- (void)removeAllCollaboratorHUDControllers;
- (void)removeBackgroundRenderingObject:(id)a3;
- (void)removeCollaboratorHUDController:(id)a3;
- (void)removeCommonObservers;
- (void)removeDecorator:(id)a3;
- (void)resumeEditing;
- (void)reuseTextInputResponderFrom:(id)a3;
- (void)scrollCenteredOrZoomToUnscaledRect:(CGRect)a3 shouldAnimateScroll:(BOOL)a4;
- (void)scrollCurrentSelectionToVisibleWithOptions:(unint64_t)a3;
- (void)scrollRectToVisible:(CGRect)a3 scrollOptions:(unint64_t)a4;
- (void)scrollRectToVisibleWithSelectionOutset:(CGRect)a3 scrollOptions:(unint64_t)a4;
- (void)scrollSearchReferenceToVisible:(id)a3 scrollOptions:(unint64_t)a4;
- (void)scrollToCollaborator:(id)a3 withSelectionPath:(id)a4;
- (void)scrollToCurrentSelectionPathAfterLayout;
- (void)scrollToCurrentSelectionPathAfterLayoutWithOptions:(unint64_t)a3;
- (void)scrollToSelectionPath:(id)a3 scrollOptions:(unint64_t)a4;
- (void)scrollView:(id)a3 willAnimateToContentOffset:(CGPoint)a4;
- (void)scrollViewDidChangeAdjustedContentInset:(id)a3;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidEndScrollingAnimation:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewDidScrollToTop:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)sendRealTimeEnterToPeersIfNecessary;
- (void)sendSelectionPathToPeersIfNecessary;
- (void)setAllowsSelectionHighlight:(BOOL)a3;
- (void)setAllowsSelectionKnobs:(BOOL)a3;
- (void)setCanvasEditor:(id)a3;
- (void)setCollaboratorCursorDelegate:(id)a3;
- (void)setConnectorKnobsEnabled:(BOOL)a3;
- (void)setContentOffset:(CGPoint)a3 scrollOptions:(unint64_t)a4;
- (void)setContentOffset:(CGPoint)a3 source:(id)a4 scrollOptions:(unint64_t)a5;
- (void)setCreateRepsForOffscreenLayouts:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplaysMultiselectionWithSingleBounds:(BOOL)a3;
- (void)setDocumentIsSharedReadOnly:(BOOL)a3;
- (void)setFloatingCursorInMotion:(BOOL)a3;
- (void)setFreehandDrawingToolkit:(id)a3;
- (void)setHasBeenTornDown:(BOOL)a3;
- (void)setInfosToDisplay:(id)a3;
- (void)setIsDraggingToInsertBoardItems:(BOOL)a3;
- (void)setIsTearingDown:(BOOL)a3;
- (void)setLayerHost:(id)a3;
- (void)setMathHintsMode:(int64_t)a3;
- (void)setNeedsDisplayInRect:(CGRect)a3 onLayer:(id)a4;
- (void)setNeedsDisplayOnLayer:(id)a3;
- (void)setOptionsForScrollingToSelectionAfterLayout:(unint64_t)a3;
- (void)setOverlayLayerSuppressed:(BOOL)a3;
- (void)setP_visibleBoundsRectForTiling:(CGRect)a3;
- (void)setP_visibleUnscaledRect:(CGRect)a3;
- (void)setPreventSettingNilEditorOnTextResponder:(BOOL)a3;
- (void)setPrimaryFindResultSearchReference:(id)a3;
- (void)setResizeCanvasOnLayout:(BOOL)a3;
- (void)setSearchReferencesToHighlight:(id)a3;
- (void)setSelectionHighlightColor:(id)a3;
- (void)setSelectionPath:(id)a3 withSelectionFlags:(unint64_t)a4;
- (void)setShouldCanvasScrollingSizeGrowToFitBoardContent:(BOOL)a3;
- (void)setShouldSuppressFreehandContent:(BOOL)a3;
- (void)setShouldSuppressRendering:(BOOL)a3;
- (void)setShouldSuppressRendering:(BOOL)a3 animated:(BOOL)a4;
- (void)setShouldSuppressesCollaboratorHUD:(BOOL)a3;
- (void)setShowGrayOverlay:(BOOL)a3;
- (void)setShowInvisibleObjects:(BOOL)a3;
- (void)setSuppressesCollaboratorHUD:(BOOL)a3;
- (void)setTemporaryAdditionalBoardItemsToDisplay:(id)a3;
- (void)setTextGesturesInFlight:(BOOL)a3;
- (void)setTextInputResponder:(id)a3;
- (void)setTextResponderEditorTo:(id)a3 withFlags:(unint64_t)a4;
- (void)setUnobscuredScrollViewFrame:(CGRect)a3;
- (void)setUsesAlternateDrawableSelectionHighlight:(BOOL)a3;
- (void)setVersionFidelityAlertWasShown:(unint64_t)a3;
- (void)setVersionFidelityAlertWasShownIsValid:(BOOL)a3;
- (void)setViewScale:(double)a3;
- (void)setViewScale:(double)a3 andScrollViewFrame:(CGRect)a4 animated:(BOOL)a5;
- (void)setViewScale:(double)a3 andScrollViewFrame:(CGRect)a4 maintainPosition:(BOOL)a5 animated:(BOOL)a6;
- (void)setViewScale:(double)a3 contentOffset:(CGPoint)a4 animated:(BOOL)a5 completionHandler:(id)a6;
- (void)setViewScale:(double)a3 contentOffset:(CGPoint)a4 animated:(BOOL)a5 source:(id)a6;
- (void)setupTextInputResponder;
- (void)showCollaboratorHUDForCollaborator:(id)a3 withSelectionPath:(id)a4 allowScroll:(BOOL)a5;
- (void)tappedCanvasBackgroundAtPoint:(CGPoint)a3 inputType:(int64_t)a4;
- (void)teardown;
- (void)teardownBackgroundRendering;
- (void)teardownCollaboratorCursorInfrastructureInvalidatingLayers:(BOOL)a3;
- (void)teardownTextInputResponder;
- (void)toggleSizeForCollaboratorHUDController:(id)a3;
- (void)translateGuide:(id)a3 toContainerRect:(CGRect)a4;
- (void)translateGuides:(id)a3 toContainerRect:(CGRect)a4;
- (void)unobscuredFrameDidChange;
- (void)updateCanvasDotGridVisibilityIfNeeded;
- (void)updateCanvasViewSubviewFrames;
- (void)updateCollaboratorHUDForBeginFollowingCollaborator:(id)a3;
- (void)updateCollaboratorHUDForStopFollowingCollaborator:(id)a3;
- (void)updateConnectorKnobVisibilityIfNeeded;
- (void)updateLayerTreeForInteractiveCanvas:(id)a3;
- (void)updateMultiselectResizeInfoIfNeeded;
- (void)updatePositionForCollaboratorHUDController:(id)a3;
- (void)updateRenderableForRep:(id)a3 usingBlock:(id)a4;
- (void)updateSelectionForInteractionWithRep:(id)a3 extendingSelection:(BOOL)a4;
- (void)updateSelectionForTapAtPoint:(CGPoint)a3 extendingSelection:(BOOL)a4;
- (void)updateTipsWithConnectorKnobsEnabled:(BOOL)a3;
- (void)viewDidEndZooming;
- (void)willEndDynamicOperation;
- (void)withLayoutForSelectionPath:(id)a3 flags:(unint64_t)a4 performBlock:(id)a5;
- (void)withLayoutForSelectionPath:(id)a3 performBlock:(id)a4;
- (void)withLayoutNearestPoint:(CGPoint)a3 forStorage:(id)a4 performBlock:(id)a5;
- (void)zoomToCurrentSelection;
- (void)zoomToFitAllContent;
- (void)zoomToSelectionPath:(id)a3;
- (void)zoomWithAnimation:(id)a3 toUnscaledRect:(CGRect)a4;
- (void)zoomWithAnimation:(id)a3 toUnscaledRect:(CGRect)a4 layoutOffscreenContent:(BOOL)a5 completionBlock:(id)a6;
- (void)zoomWithAnimationToUnscaledRect:(CGRect)a3;
- (void)zoomWithAnimationToUnscaledRect:(CGRect)a3 withDuration:(double)a4;
@end

@implementation CRLInteractiveCanvasController

- (void)withLayoutNearestPoint:(CGPoint)a3 forStorage:(id)a4 performBlock:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  v9 = (void (**)(id, void *))a5;
  id v10 = a4;
  [(CRLInteractiveCanvasController *)self layoutIfNeeded];
  -[CRLInteractiveCanvasController closestRepToPoint:forStorage:](self, "closestRepToPoint:forStorage:", v10, x, y);
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  v11 = [v12 layout];
  v9[2](v9, v11);
}

- (id)closestRepToPoint:(CGPoint)a3 forStorage:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  [(CRLInteractiveCanvasController *)self p_repsForStorage:v7];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = [v8 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v9)
  {
    id v10 = v9;
    v11 = 0;
    uint64_t v12 = *(void *)v28;
    double v13 = INFINITY;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v28 != v12) {
          objc_enumerationMutation(v8);
        }
        v15 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        [v15 frameInUnscaledCanvas];
        CGFloat v16 = v34.origin.x;
        CGFloat v17 = v34.origin.y;
        CGFloat width = v34.size.width;
        CGFloat height = v34.size.height;
        v33.double x = x;
        v33.double y = y;
        if (CGRectContainsPoint(v34, v33))
        {
          id v25 = v15;

          v11 = v25;
          goto LABEL_14;
        }
        v35.origin.double x = v16;
        v35.origin.double y = v17;
        v35.size.CGFloat width = width;
        v35.size.CGFloat height = height;
        double MidX = CGRectGetMidX(v35);
        v36.origin.double x = v16;
        v36.origin.double y = v17;
        v36.size.CGFloat width = width;
        v36.size.CGFloat height = height;
        double MidY = CGRectGetMidY(v36);
        double v22 = sub_1000653B4(x, y, MidX, MidY);
        if (v22 < v13)
        {
          double v23 = v22;
          id v24 = v15;

          double v13 = v23;
          v11 = v24;
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  else
  {
    v11 = 0;
  }
LABEL_14:

  return v11;
}

- (id)p_repsForStorage:(id)a3
{
  id v4 = a3;
  v5 = +[NSMutableSet set];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v6 = [(CRLInteractiveCanvasController *)self canvas];
  id v7 = [v6 topLevelReps];

  id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        [(CRLInteractiveCanvasController *)self p_recursivelyAddRep:*(void *)(*((void *)&v13 + 1) + 8 * i) forStorage:v4 toSet:v5];
      }
      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  return v5;
}

- (void)p_recursivelyAddRep:(id)a3 forStorage:(id)a4 toSet:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = sub_1002469D0(v11, v8);
  long long v13 = v12;
  if (v12
    && ([v12 storage], id v14 = (id)objc_claimAutoreleasedReturnValue(), v14, v14 == v9))
  {
    [v10 addObject:v13];
  }
  else
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v15 = [v8 childReps];
    id v16 = [v15 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v21;
      do
      {
        v19 = 0;
        do
        {
          if (*(void *)v21 != v18) {
            objc_enumerationMutation(v15);
          }
          [(CRLInteractiveCanvasController *)self p_recursivelyAddRep:*(void *)(*((void *)&v20 + 1) + 8 * (void)v19) forStorage:v9 toSet:v10];
          v19 = (char *)v19 + 1;
        }
        while (v17 != v19);
        id v17 = [v15 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v17);
    }
  }
}

- (CRLInteractiveCanvasController)init
{
  v5.receiver = self;
  v5.super_class = (Class)CRLInteractiveCanvasController;
  v2 = [(CRLInteractiveCanvasController *)&v5 init];
  v3 = v2;
  if (v2) {
    [(CRLInteractiveCanvasController *)v2 p_commonInit];
  }
  __dmb(0xBu);
  return v3;
}

- (void)addCommonObservers
{
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"p_textGesturesWillBeginNotification:" name:@"CRLTextGesturesWillBeginNotification" object:0];
  [v4 addObserver:self selector:"p_textGesturesDidEndNotification:" name:@"CRLTextGesturesDidEndNotification" object:0];
  [v4 addObserver:self selector:"p_spellCheckingStateChangedNotification:" name:@"CRLWPSpellCheckingStateChangedNotification" object:0];
  [v4 addObserver:self selector:"p_spellCheckerWordsDidChangeNotification:" name:@"CRLWPSpellCheckingIgnoranceChangedNotification" object:0];
  [v4 addObserver:self selector:"p_spellCheckerWordsDidChangeNotification:" name:@"CRLWPSpellCheckingLearnedWordsChangedNotification" object:0];
  v3 = [(CRLInteractiveCanvasController *)self layerHost];
  [v3 addCommonObservers];
}

- (void)removeCommonObservers
{
  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self name:@"CRLTextGesturesWillBeginNotification" object:0];
  [v5 removeObserver:self name:@"CRLTextGesturesDidEndNotification" object:0];
  v3 = +[NSUserDefaults standardUserDefaults];
  [v3 removeObserver:self forKeyPath:@"CRLScenesDebugView" context:@"CRLScenesDebugView"];

  id v4 = [(CRLInteractiveCanvasController *)self layerHost];
  [v4 removeCommonObservers];
}

- (void)p_commonInit
{
  v3 = [[CRLCanvas alloc] initWithLayoutControllerClass:objc_opt_class() delegate:self];
  mCanvas = self->mCanvas;
  self->mCanvas = v3;

  [(CRLCanvas *)self->mCanvas i_setCanvasController:self];
  id v5 = [[CRLInteractiveCanvasLayerHelper alloc] initWithInteractiveCanvasController:self];
  mLayerUpdater = self->mLayerUpdater;
  self->mLayerUpdater = (CRLInteractiveCanvasLayerUpdater *)v5;

  self->mResizeCanvasOnLayout = 0;
  [(CRLInteractiveCanvasController *)self addCommonObservers];
  double y = CGRectNull.origin.y;
  double width = CGRectNull.size.width;
  double height = CGRectNull.size.height;
  -[CRLInteractiveCanvasController setP_visibleBoundsRectForTiling:](self, "setP_visibleBoundsRectForTiling:", CGRectNull.origin.x, y, width, height);
  -[CRLInteractiveCanvasController setP_visibleUnscaledRect:](self, "setP_visibleUnscaledRect:", CGRectNull.origin.x, y, width, height);
  id v10 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
  mNotificationsToPostWithValidLayouts = self->mNotificationsToPostWithValidLayouts;
  self->mNotificationsToPostWithValidLayouts = v10;

  uint64_t v12 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  mBlocksToPerformOnMainThreadWithValidLayouts = self->mBlocksToPerformOnMainThreadWithValidLayouts;
  self->mBlocksToPerformOnMainThreadWithValidLayouts = v12;

  id v14 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
  mRepsToSetNeedsDispladouble y = self->mRepsToSetNeedsDisplay;
  self->mRepsToSetNeedsDispladouble y = v14;

  id v16 = (NSMapTable *)[objc_alloc((Class)NSMapTable) initWithKeyOptions:512 valueOptions:0 capacity:0];
  mRepsToRectsToInvalidate = self->mRepsToRectsToInvalidate;
  self->mRepsToRectsToInvalidate = v16;

  uint64_t v18 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
  mRepsDrawnIntoAncestorToSetNeedsDisplayOnUpdatedGeometrdouble y = self->mRepsDrawnIntoAncestorToSetNeedsDisplayOnUpdatedGeometry;
  self->mRepsDrawnIntoAncestorToSetNeedsDisplayOnUpdatedGeometrdouble y = v18;

  long long v20 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  mDecorators = self->mDecorators;
  self->mDecorators = v20;

  long long v22 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
  mDecoratorsWithInvalidLayers = self->mDecoratorsWithInvalidLayers;
  self->mDecoratorsWithInvalidLayers = v22;

  *(_WORD *)&self->mAllowsSelectionKnobs = 257;
  id v24 = +[NSUserDefaults standardUserDefaults];
  -[CRLInteractiveCanvasController setDisplaysMultiselectionWithSingleBounds:](self, "setDisplaysMultiselectionWithSingleBounds:", [v24 BOOLForKey:@"CRLMultiSelectionShouldDisplaySingleBoundsUserDefault"]);

  self->mVersionFidelityAlertWasShownIsValid = 0;
  self->mVersionFidelityAlertWasShown = 0;
  id v25 = +[NSUserDefaults standardUserDefaults];
  [v25 addObserver:self forKeyPath:@"CRLScenesDebugView" options:0 context:@"CRLScenesDebugView"];

  v26 = [[_TtC8Freeform26CRLCanvasDotGridBackground alloc] initWithICC:self];
  mCanvasBackground = self->mCanvasBackground;
  self->mCanvasBackground = &v26->super;
}

- (void)dealloc
{
  if (!self->mHasBeenTornDown)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F3008);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A7198();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F3028);
    }
    v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController dealloc]");
    id v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:550 isFatal:0 description:"Must call -teardown on ICC before it is deallocated"];
  }
  if (self->mHadLayerHost && !self->mLayerHostHasBeenTornDown)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F3048);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A7110();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F3068);
    }
    v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v6);
    }
    id v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController dealloc]");
    id v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:551 isFatal:0 description:"Must call -teardown on CVC before ICC is deallocated"];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->mLayerHost);

  if (WeakRetained)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F3088);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A7088();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F30A8);
    }
    id v10 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v10);
    }
    uint64_t v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController dealloc]");
    uint64_t v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 552, 0, "Layer host must be cleared out of ICC before it is deallocated, to avoid a zombie crash.");
  }
  objc_storeWeak((id *)&self->mLayerHost, 0);
  [(CRLInteractiveCanvasController *)self removeCommonObservers];
  long long v13 = +[NSNotificationCenter defaultCenter];
  [v13 removeObserver:self];

  mTextInputResponderSource = self->mTextInputResponderSource;
  if (mTextInputResponderSource) {
    --mTextInputResponderSource->mTextInputResponderShareCount;
  }
  v15.receiver = self;
  v15.super_class = (Class)CRLInteractiveCanvasController;
  [(CRLInteractiveCanvasController *)&v15 dealloc];
}

- (BOOL)isCanvasBackgroundAlignmentSnappingEnabled
{
  p_mDelegate = &self->mDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  if (WeakRetained
    && (id v5 = WeakRetained,
        id v6 = objc_loadWeakRetained((id *)p_mDelegate),
        char v7 = objc_opt_respondsToSelector(),
        v6,
        v5,
        (v7 & 1) != 0))
  {
    id v8 = objc_loadWeakRetained((id *)p_mDelegate);
    unsigned __int8 v9 = [v8 wantsToShowCanvasDotGridOnInteractiveCanvasController:self];
  }
  else
  {
    unsigned __int8 v9 = 0;
  }
  return +[CRLCanvasGuideController shouldSnapToGrid] & v9;
}

- (int64_t)mathHintsMode
{
  v2 = [(CRLInteractiveCanvasController *)self mathCalculationController];
  id v3 = [v2 mathHintsMode];

  return (int64_t)v3;
}

- (void)setMathHintsMode:(int64_t)a3
{
  id v4 = [(CRLInteractiveCanvasController *)self mathCalculationController];
  [v4 setMathHintsMode:a3];
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v14.receiver = self;
  v14.super_class = (Class)CRLInteractiveCanvasController;
  if (-[CRLInteractiveCanvasController respondsToSelector:](&v14, "respondsToSelector:"))
  {
    v13.receiver = self;
    v13.super_class = (Class)CRLInteractiveCanvasController;
    id v5 = [(CRLInteractiveCanvasController *)&v13 methodSignatureForSelector:a3];
  }
  else
  {
    id v6 = (void *)qword_1016A9868;
    if (!qword_1016A9868)
    {
      if (snprintf(__str, 0x20uLL, "%s%s%s%s", "v", "@", ":", "@") >= 0x20)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014F30C8);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_1010A7220();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014F30E8);
        }
        char v7 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10106590C(v7);
        }
        id v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController methodSignatureForSelector:]");
        unsigned __int8 v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"];
        +[CRLAssertionHandler handleFailureInFunction:v8 file:v9 lineNumber:601 isFatal:0 description:"ObjCTypes string overflowed"];
      }
      uint64_t v10 = +[NSMethodSignature signatureWithObjCTypes:__str];
      uint64_t v11 = (void *)qword_1016A9868;
      qword_1016A9868 = v10;

      id v6 = (void *)qword_1016A9868;
    }
    id v5 = v6;
  }

  return v5;
}

+ (BOOL)selectorIsActionMethod:(SEL)a3
{
  Name = (char *)sel_getName(a3);
  id v4 = &Name[strlen(Name) - 1];
  return *v4 == 58 && strchr(Name, 58) == v4;
}

- (BOOL)respondsToSelector:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CRLInteractiveCanvasController;
  if ([(CRLInteractiveCanvasController *)&v11 respondsToSelector:a3])
  {
    BOOL v7 = 1;
  }
  else if (+[CRLInteractiveCanvasController selectorIsActionMethod:a3])
  {
    id v8 = [(CRLInteractiveCanvasController *)self editorController];
    unsigned __int8 v9 = [v8 editorForEditAction:a3 withSender:v6];
    BOOL v7 = v9 != 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  return [(CRLInteractiveCanvasController *)self respondsToSelector:a3 withSender:0];
}

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  id v5 = (char *)[v4 selector];
  objc_super v14 = 0;
  [v4 getArgument:&v14 atIndex:2];
  id v6 = [(CRLInteractiveCanvasController *)self editorController];
  BOOL v7 = [v6 editorForEditAction:v5 withSender:v14];

  if (objc_opt_respondsToSelector())
  {
    [v4 invokeWithTarget:v7];
    goto LABEL_22;
  }
  id v8 = v14;
  unsigned __int8 v9 = [(CRLInteractiveCanvasController *)self layerHost];
  if (v8 == v9 || [@"UIEditingInteraction" isEqual:v14])
  {
    if (v5 == "cut:" || v5 == "copy:")
    {

LABEL_10:
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F3108);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010A72A8();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F3128);
      }
      uint64_t v10 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v10);
      }
      objc_super v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController forwardInvocation:]");
      uint64_t v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"];
      +[CRLAssertionHandler handleFailureInFunction:v11 file:v12 lineNumber:661 isFatal:0 description:"The OS undo gestures should not be sending us selectors we can't respond to!"];

      goto LABEL_22;
    }

    if (v5 == "paste:") {
      goto LABEL_10;
    }
  }
  else
  {
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v13.receiver = self;
    v13.super_class = (Class)CRLInteractiveCanvasController;
    [(CRLInteractiveCanvasController *)&v13 doesNotRecognizeSelector:v5];
  }
LABEL_22:
}

- (void)p_teardownCanvasEditor
{
  if (self->mCanvasEditor)
  {
    id v3 = [(CRLEditorController *)self->mEditorController currentEditors];
    id v4 = [v3 indexOfObjectIdenticalTo:self->mCanvasEditor];

    if (v4 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      mEditorController = self->mEditorController;
      id v6 = objc_alloc_init(CRLCanvasSelection);
      [(CRLEditorController *)mEditorController setSelection:v6 forEditor:self->mCanvasEditor];

      [(CRLEditorController *)self->mEditorController setSelectionPathToPopEditor:self->mCanvasEditor];
    }
    [(CRLCanvasEditor *)self->mCanvasEditor teardown];
    mCanvasEditor = self->mCanvasEditor;
    self->mCanvasEditor = 0;
  }
  id v8 = self->mEditorController;
  self->mEditorController = 0;
}

- (void)teardownCollaboratorCursorInfrastructureInvalidatingLayers:(BOOL)a3
{
  BOOL v3 = a3;
  self->mCollaboratorCursorsInvalidated = 1;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(NSMapTable *)self->mCollaboratorPresenceToCollaboratorHUDControllerDictionary crl_allObjects];
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        [v10 teardown];
        if (v3) {
          [(CRLInteractiveCanvasController *)self invalidateLayersForDecorator:v10];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  [(NSMutableSet *)self->mCurrentCollaboratorPresences removeAllObjects];
  [(NSMapTable *)self->mCollaboratorPresenceToCollaboratorHUDControllerDictionary removeAllObjects];
  [(NSMapTable *)self->mCollaboratorPresenceToCollaboratorHUDControllerDictionaryForFastSizing removeAllObjects];
}

- (void)teardown
{
  self->mIsTearingDown = 1;
  +[NSObject cancelPreviousPerformRequestsWithTarget:self];
  [(CRLInteractiveCanvasController *)self p_setCurrentlyScrolling:0];
  [(CRLInteractiveCanvasController *)self cancelScrollToCurrentSelectionPathAfterLayout];
  [(CRLInteractiveCanvasController *)self teardownCollaboratorCursorInfrastructureInvalidatingLayers:0];
  [(CRLInteractiveCanvasController *)self teardownBackgroundRendering];
  if (self->mEditorController) {
    [(CRLInteractiveCanvasController *)self endEditing];
  }
  mMultiselectResizeInfo = self->mMultiselectResizeInfo;
  self->mMultiselectResizeInfo = 0;

  [(CRLInteractiveCanvasController *)self teardownTextInputResponder];
  id v4 = [(CRLInteractiveCanvasController *)self gestureDispatcher];
  [v4 teardown];

  [(CRLCanvas *)self->mCanvas teardown];
  if (self->mCanvasEditor) {
    [(CRLInteractiveCanvasController *)self p_teardownCanvasEditor];
  }
  [(CRLInteractiveCanvasLayerUpdater *)self->mLayerUpdater teardown];
  id v5 = [(CRLInteractiveCanvasController *)self collaboratorCursorDelegate];
  [v5 willTeardownRenderer:self];

  [(CRLInteractiveCanvasController *)self setCollaboratorCursorDelegate:0];
  mInfosPreviouslyShowingCollabCursors = self->mInfosPreviouslyShowingCollabCursors;
  self->mInfosPreviouslyShowingCollabCursors = 0;

  [(CRLInteractiveCanvasController *)self setFreehandDrawingToolkit:0];
  [(CRLInteractiveCanvasController *)self setDelegate:0];
  [(CRLInteractiveCanvasController *)self p_endObservingDocumentRootIfNeeded];
  [(NSMutableSet *)self->mNotificationsToPostWithValidLayouts removeAllObjects];
  [(NSMutableArray *)self->mBlocksToPerformOnMainThreadWithValidLayouts removeAllObjects];
  [(NSMutableSet *)self->mRepsToSetNeedsDisplay removeAllObjects];
  [(NSMapTable *)self->mRepsToRectsToInvalidate removeAllObjects];
  [(NSMutableSet *)self->mRepsDrawnIntoAncestorToSetNeedsDisplayOnUpdatedGeometry removeAllObjects];
  [(NSMutableArray *)self->mDecorators removeAllObjects];
  [(NSMutableSet *)self->mDecoratorsWithInvalidLayers removeAllObjects];
  *(_WORD *)&self->mIsTearingDown = 256;
  if (self->mEditorController)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F3148);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A7330();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F3168);
    }
    id v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v7);
    }
    uint64_t v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController teardown]");
    unsigned __int8 v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 779, 0, "expected nil value for '%{public}s'", "mEditorController");
  }
}

- (void)layerHostHasBeenTornDown
{
  self->mLayerHostHasBeenTornDown = 1;
}

- (void)setShowGrayOverlay:(BOOL)a3
{
  self->mShowGrayOverladouble y = a3;
  id v3 = [(CRLInteractiveCanvasController *)self canvas];
  [v3 i_setLayersInvalidWithoutInvalidatingAnySpecificLayers];
}

- (void)setLayerHost:(id)a3
{
  if (a3) {
    self->mHadLayerHost = 1;
  }
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mLayerHost);
  [WeakRetained removeCommonObservers];

  id v5 = objc_storeWeak((id *)&self->mLayerHost, obj);
  [obj addCommonObservers];

  [(CRLInteractiveCanvasController *)self updateCanvasDotGridVisibilityIfNeeded];
}

- (BOOL)p_shouldTimeoutCollabCursor
{
  return 1;
}

- (id)p_sourceInteractionSourceForNotficiationUserInfo
{
  if (self->mCurrentInteractionSource) {
    return self->mCurrentInteractionSource;
  }
  else {
    return &stru_101538650;
  }
}

- (CRLInteractiveCanvasLayerHelper)i_interactiveCanvasLayerHelper
{
  uint64_t v3 = objc_opt_class();
  mLayerUpdater = self->mLayerUpdater;

  return (CRLInteractiveCanvasLayerHelper *)sub_1002469D0(v3, mLayerUpdater);
}

- (void)teardownBackgroundRendering
{
  uint64_t v3 = self->mBackgroundRenderingObjects;
  objc_sync_enter(v3);
  id v4 = [(NSMutableArray *)self->mBackgroundRenderingObjects copy];
  objc_sync_exit(v3);

  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v8) teardownBackgroundRendering:v9];
        uint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)addBackgroundRenderingObject:(id)a3
{
  id v8 = a3;
  id v4 = self->mBackgroundRenderingObjects;
  objc_sync_enter(v4);
  mBackgroundRenderingObjects = self->mBackgroundRenderingObjects;
  if (!mBackgroundRenderingObjects)
  {
    id v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    uint64_t v7 = self->mBackgroundRenderingObjects;
    self->mBackgroundRenderingObjects = v6;

    mBackgroundRenderingObjects = self->mBackgroundRenderingObjects;
  }
  [(NSMutableArray *)mBackgroundRenderingObjects addObject:v8];
  objc_sync_exit(v4);
}

- (void)removeBackgroundRenderingObject:(id)a3
{
  id v4 = a3;
  id v5 = self->mBackgroundRenderingObjects;
  objc_sync_enter(v5);
  id v6 = [(NSMutableArray *)self->mBackgroundRenderingObjects indexOfObject:v4];
  if (v6 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    int v7 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F3188);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A73C4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F31A8);
    }
    id v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR))
    {
      long long v9 = +[CRLAssertionHandler packedBacktraceString];
      sub_101069C40(v9, (uint64_t)&v12, v7);
    }

    long long v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController removeBackgroundRenderingObject:]");
    long long v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v10 file:v11 lineNumber:850 isFatal:0 description:"removeBackgroundRenderingObject called on an object that is not in the array"];
  }
  [(NSMutableArray *)self->mBackgroundRenderingObjects removeObjectAtIndex:v6];
  objc_sync_exit(v5);
}

- (BOOL)textMagnifierIsUp
{
  return 0;
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);

  if (WeakRetained != v4)
  {
    id v6 = objc_loadWeakRetained((id *)&self->mDelegate);

    if (v6)
    {
      [(CRLInteractiveCanvasController *)self p_endObservingDocumentRootIfNeeded];
      if (v4)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014F31C8);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_1010A744C();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014F31E8);
        }
        int v7 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10106590C(v7);
        }
        id v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController setDelegate:]");
        long long v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"];
        +[CRLAssertionHandler handleFailureInFunction:v8 file:v9 lineNumber:882 isFatal:0 description:"Unexpected re-use of ICC with a different delegate"];
      }
    }
    objc_storeWeak((id *)&self->mDelegate, v4);
    if (![(CRLPKDrawingProvider *)self->mPKDrawingProvider isTornDown]) {
      [(CRLPKDrawingProvider *)self->mPKDrawingProvider teardown];
    }
    id v10 = objc_loadWeakRetained((id *)&self->mDelegate);

    if (v10)
    {
      [(CRLInteractiveCanvasController *)self p_beginObservingDocumentRoot];
      [(CRLInteractiveCanvasController *)self updateCanvasDotGridVisibilityIfNeeded];
      if (+[CRLFeatureFlagGroup isEasierConnectionLinesEnabled])
      {
        [(CRLInteractiveCanvasController *)self updateConnectorKnobVisibilityIfNeeded];
      }
      long long v11 = [[CRLPKDrawingProvider alloc] initWithICC:self];
      mPKDrawingProvider = self->mPKDrawingProvider;
      self->mPKDrawingProvider = v11;
    }
  }
}

- (void)p_beginObservingDocumentRoot
{
  uint64_t v3 = +[NSNotificationCenter defaultCenter];
  id v4 = [(CRLInteractiveCanvasController *)self editingCoordinator];

  if (!v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F3208);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A74D4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F3228);
    }
    id v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    id v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController p_beginObservingDocumentRoot]");
    int v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 909, 0, "invalid nil value for '%{public}s'", "self.editingCoordinator");
  }
  id v8 = [CRLCanvasLayoutChangeObserver alloc];
  long long v9 = [(CRLInteractiveCanvasController *)self editingCoordinator];
  id v10 = [v9 changeNotifier];
  long long v11 = [(CRLCanvas *)self->mCanvas layoutController];
  uint64_t v12 = [(CRLCanvasLayoutChangeObserver *)v8 initWithChangeNotifier:v10 layoutController:v11];

  long long v13 = [(CRLCanvas *)self->mCanvas layoutController];
  [v13 setI_layoutRegistrationObserver:v12];

  [(CRLCanvasLayoutChangeObserver *)v12 setInteractiveCanvasController:self];
  long long v14 = [(CRLInteractiveCanvasController *)self editingCoordinator];
  objc_super v15 = [v14 changeNotifier];
  id v16 = [(CRLInteractiveCanvasController *)self board];
  [v15 addObserver:self forChangeSource:v16];

  id v17 = [(CRLInteractiveCanvasController *)self editingCoordinator];
  uint64_t v18 = [v17 changeNotifier];
  v19 = [(CRLInteractiveCanvasController *)self board];
  long long v20 = [v19 rootContainer];
  [v18 addObserver:self forChangeSource:v20];

  long long v21 = [(CRLInteractiveCanvasController *)self editingCoordinator];
  long long v22 = [v21 collaboratorCursorCoordinator];
  [v22 registerCursorRenderer:self];

  long long v23 = [(CRLInteractiveCanvasController *)self editingCoordinator];
  -[CRLInteractiveCanvasController setDocumentIsSharedReadOnly:](self, "setDocumentIsSharedReadOnly:", [v23 canPerformUserAction] ^ 1);

  id v24 = +[NSNotification CRLBoardRealTimeStateDidChange];
  id v25 = [(CRLInteractiveCanvasController *)self editingCoordinator];
  v26 = [v25 mainBoard];
  [v3 addObserver:self selector:"p_realTimeStateDidChange:" name:v24 object:v26];

  long long v27 = +[NSNotification CRLBoardRealTimeNewParticipantDidJoinSession];
  [v3 addObserver:self selector:"p_realTimeSessionNewParticipantDidJoin:" name:v27 object:0];
}

- (void)p_realTimeSessionNewParticipantDidJoin:(id)a3
{
  [(CRLInteractiveCanvasController *)self sendRealTimeEnterToPeersIfNecessary];

  [(CRLInteractiveCanvasController *)self sendSelectionPathToPeersIfNecessary];
}

- (void)p_realTimeStateDidChange:(id)a3
{
  id v4 = [(CRLInteractiveCanvasController *)self editingCoordinator];
  unsigned __int8 v5 = [v4 isInRealTimeSyncSession];

  if (v5)
  {
    if ([(NSMapTable *)self->mCollaboratorPresenceToCollaboratorHUDControllerDictionary count])
    {
      long long v13 = 0u;
      long long v14 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      id v6 = [(NSMapTable *)self->mCollaboratorPresenceToCollaboratorHUDControllerDictionary crl_allObjects];
      id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7)
      {
        id v8 = v7;
        uint64_t v9 = *(void *)v12;
        do
        {
          for (i = 0; i != v8; i = (char *)i + 1)
          {
            if (*(void *)v12 != v9) {
              objc_enumerationMutation(v6);
            }
            [(CRLInteractiveCanvasController *)self invalidateLayersForDecorator:*(void *)(*((void *)&v11 + 1) + 8 * i)];
          }
          id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
        }
        while (v8);
      }
    }
    else
    {
      [(CRLCanvas *)self->mCanvas i_setLayersInvalidWithoutInvalidatingAnySpecificLayers];
    }
    [(CRLInteractiveCanvasController *)self sendSelectionPathToPeersIfNecessary];
  }
  else
  {
    [(CRLInteractiveCanvasController *)self teardownCollaboratorCursorInfrastructureInvalidatingLayers:1];
  }
}

- (void)p_endObservingDocumentRootIfNeeded
{
  uint64_t v3 = [(CRLInteractiveCanvasController *)self delegate];

  if (v3)
  {
    id v4 = +[NSNotificationCenter defaultCenter];
    unsigned __int8 v5 = [(CRLCanvas *)self->mCanvas layoutController];
    [v5 setI_layoutRegistrationObserver:0];

    id v6 = [(CRLInteractiveCanvasController *)self editingCoordinator];

    if (!v6)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F3248);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010A7568();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F3268);
      }
      id v7 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v7);
      }
      id v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController p_endObservingDocumentRootIfNeeded]");
      uint64_t v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 950, 0, "invalid nil value for '%{public}s'", "self.editingCoordinator");
    }
    id v10 = [(CRLInteractiveCanvasController *)self editingCoordinator];
    long long v11 = [v10 changeNotifier];
    long long v12 = [(CRLInteractiveCanvasController *)self board];
    long long v13 = [v12 rootContainer];
    [v11 removeObserver:self forChangeSource:v13];

    long long v14 = +[NSNotification CRLBoardRealTimeStateDidChange];
    objc_super v15 = [(CRLInteractiveCanvasController *)self editingCoordinator];
    id v16 = [v15 mainBoard];
    [v4 removeObserver:self name:v14 object:v16];

    id v17 = +[NSNotification CRLBoardRealTimeNewParticipantDidJoinSession];
    [v4 removeObserver:self name:v17 object:0];
  }
}

- (_TtC8Freeform8CRLBoard)board
{
  if (!+[NSThread isMainThread])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F3288);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A75FC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F32A8);
    }
    uint64_t v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController board]");
    unsigned __int8 v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:958 isFatal:0 description:"This operation must only be performed on the main thread."];
  }
  id v6 = [(CRLInteractiveCanvasController *)self editingCoordinator];
  id v7 = [v6 mainBoard];

  return (_TtC8Freeform8CRLBoard *)v7;
}

- (_TtC8Freeform21CRLEditingCoordinator)editingCoordinator
{
  uint64_t v3 = [(CRLInteractiveCanvasController *)self delegate];
  id v4 = [v3 editingCoordinatorForInteractiveCanvasController:self];

  return (_TtC8Freeform21CRLEditingCoordinator *)v4;
}

- (_TtC8Freeform20CRLCommandController)commandController
{
  v2 = [(CRLInteractiveCanvasController *)self editingCoordinator];
  uint64_t v3 = [v2 commandController];

  return (_TtC8Freeform20CRLCommandController *)v3;
}

- (CRLChangeNotifier)changeNotifier
{
  v2 = [(CRLInteractiveCanvasController *)self editingCoordinator];
  uint64_t v3 = [v2 changeNotifier];

  return (CRLChangeNotifier *)v3;
}

- (BOOL)shouldSuppressFontSmoothing
{
  return 1;
}

- (id)backgroundColorAtUnscaledCanvasPoint:(CGPoint)a3
{
  return +[CRLColor whiteColor];
}

- (CGSize)defaultMinimumUnscaledCanvasSize
{
  double width = CGSizeZero.width;
  double height = CGSizeZero.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)canvasLayoutInvalidated:(id)a3
{
  if (+[NSThread isMainThread])
  {
    id v5 = [(CRLInteractiveCanvasController *)self layerHost];
    id v4 = [v5 canvasLayer];
    [v4 setNeedsLayout];
  }
}

- (void)canvasDidInvalidateAllLayers:(id)a3
{
  self->mAllDecoratorLayersAreInvalid = 1;
}

- (void)i_canvasDidUpdateVisibleBounds
{
  double y = CGRectNull.origin.y;
  double width = CGRectNull.size.width;
  double height = CGRectNull.size.height;
  if (!self->mDynamicallyZooming) {
    -[CRLInteractiveCanvasController setP_visibleBoundsRectForTiling:](self, "setP_visibleBoundsRectForTiling:", CGRectNull.origin.x, CGRectNull.origin.y, CGRectNull.size.width, CGRectNull.size.height);
  }

  -[CRLInteractiveCanvasController setP_visibleUnscaledRect:](self, "setP_visibleUnscaledRect:", CGRectNull.origin.x, y, width, height);
}

- (void)canvasWillValidateLayouts:(id)a3
{
  p_mDelegate = &self->mDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_mDelegate);
    [v7 interactiveCanvasControllerWillValidateLayouts:self];
  }
}

- (void)canvasDidValidateLayouts:(id)a3
{
  p_mDelegate = &self->mDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_mDelegate);
    [v7 interactiveCanvasControllerDidValidateLayouts:self];
  }
}

- (void)canvasDidLayout:(id)a3
{
  id v4 = a3;
  if (!self->mHasCanvasEverLaidOut)
  {
    id v5 = [(CRLInteractiveCanvasController *)self infosToDisplay];
    self->mHasCanvasEverLaidOut = [v5 count] != 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)&self->mDelegate);
    [v8 interactiveCanvasControllerDidLayout:self];
  }
  [(CRLInteractiveCanvasController *)self p_consumeRepsDrawnIntoAncestorToSetNeedsDisplayOnUpdatedGeometry];
  if (+[NSThread isMainThread]
    && ![(CRLInteractiveCanvasController *)self textMagnifierIsUp])
  {
    if (self->mNotifyTIRTextChangedAfterLayout) {
      self->mNotifyTIRTextChangedAfterLayout = 0;
    }
    if (self->mNotifyTIRSelectionChangedAfterLayout >= 1) {
      self->mNotifyTIRSelectionChangedAfterLayout = 0;
    }
  }
  uint64_t v9 = +[NSNotificationCenter defaultCenter];
  [v9 postNotificationName:@"CRLInteractiveCanvasControllerDidLayoutNotification" object:self];

  if ([(CRLInteractiveCanvasController *)self p_areAnyCollaboratorsPresent])
  {
    id v10 = [(CRLInteractiveCanvasController *)self editorController];
    unsigned int v11 = [v10 isChangingSelection];

    if (v11)
    {
      long long v12 = [(CRLInteractiveCanvasController *)self canvas];
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_100388EF8;
      v15[3] = &unk_1014CBBB0;
      v15[4] = self;
      [v12 performBlockAfterLayoutIfNecessary:v15];
    }
    else
    {
      unsigned __int8 v13 = [(CRLInteractiveCanvasController *)self p_currentSelectionIsOnscreen];
      BOOL v14 = v13;
      if (self->mSelectionIsCurrentlyOnscreen && self->mDidTransform && !self->mCurrentlyScrolling && (v13 & 1) == 0) {
        [(CRLInteractiveCanvasController *)self scrollCurrentSelectionToVisibleWithOptions:0];
      }
      self->mDidTransform = 0;
      self->mSelectionIsCurrentlyOnscreen = v14;
    }
  }
}

- (void)p_collabParticipantsDidChange:(id)a3
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = [(CRLCanvas *)self->mCanvas topLevelReps];
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
        [*(id *)(*((void *)&v8 + 1) + 8 * i) recursivelyPerformSelector:"collaborationParticipantsDidChange"];
      }
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (BOOL)p_currentSelectionIsOnscreen
{
  uint64_t v3 = [(CRLInteractiveCanvasController *)self delegate];
  if (!v3) {
    return 0;
  }
  id v4 = (void *)v3;
  id v5 = [(CRLInteractiveCanvasController *)self editorController];
  uint64_t v6 = [v5 selectionPath];

  if (!v6) {
    return 0;
  }
  char v7 = [(CRLInteractiveCanvasController *)self editorController];
  long long v8 = [v7 selectionPath];

  long long v9 = [(CRLInteractiveCanvasController *)self layoutsForSelectionPath:v8];
  [(CRLInteractiveCanvasController *)self visibleUnscaledRect];
  CGRect v42 = CGRectInset(v41, 4.0, 4.0);
  CGFloat y = v42.origin.y;
  CGFloat x = v42.origin.x;
  CGFloat height = v42.size.height;
  CGFloat width = v42.size.width;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v10 = v9;
  id v11 = [v10 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (!v11)
  {
    BOOL v21 = 0;
    goto LABEL_23;
  }
  id v12 = v11;
  BOOL v13 = 0;
  CGFloat v14 = CGRectNull.origin.x;
  CGFloat v15 = CGRectNull.origin.y;
  CGFloat v16 = CGRectNull.size.width;
  CGFloat v17 = CGRectNull.size.height;
  uint64_t v18 = *(void *)v37;
  char v19 = 1;
  while (2)
  {
    long long v20 = 0;
    BOOL v21 = v13;
    do
    {
      if (*(void *)v37 != v18) {
        objc_enumerationMutation(v10);
      }
      long long v22 = *(void **)(*((void *)&v36 + 1) + 8 * (void)v20);
      -[CRLInteractiveCanvasController rectInRootForScrollingToSelectionPath:onLayout:allowingZooming:](self, "rectInRootForScrollingToSelectionPath:onLayout:allowingZooming:", v8, v22, 0, *(void *)&height, *(void *)&width, *(void *)&y, *(void *)&x, (void)v36);
      CGFloat v27 = v23;
      CGFloat v28 = v24;
      CGFloat v29 = v25;
      CGFloat v30 = v26;
      if (v19)
      {
        CGFloat v17 = v26;
        CGFloat v16 = v25;
        CGFloat v15 = v24;
        CGFloat v14 = v23;
        if ([v22 selectionMustBeEntirelyOnscreenToCountAsVisibleInSelectionPath:v8]) {
          goto LABEL_13;
        }
      }
      else
      {
        v43.origin.CGFloat x = v14;
        v43.origin.CGFloat y = v15;
        v43.size.CGFloat width = v16;
        v43.size.CGFloat height = v17;
        v47.origin.CGFloat x = v27;
        v47.origin.CGFloat y = v28;
        v47.size.CGFloat width = v29;
        v47.size.CGFloat height = v30;
        CGRect v44 = CGRectUnion(v43, v47);
        CGFloat v14 = v44.origin.x;
        CGFloat v15 = v44.origin.y;
        CGFloat v16 = v44.size.width;
        CGFloat v17 = v44.size.height;
        if (v21
          || [v22 selectionMustBeEntirelyOnscreenToCountAsVisibleInSelectionPath:v8])
        {
LABEL_13:
          [(CRLInteractiveCanvasController *)self visibleUnscaledRect];
          v48.origin.CGFloat x = v14;
          v48.origin.CGFloat y = v15;
          v48.size.CGFloat width = v16;
          v48.size.CGFloat height = v17;
          BOOL v21 = 1;
          if (CGRectContainsRect(v45, v48)) {
            goto LABEL_23;
          }
          goto LABEL_17;
        }
      }
      v46.origin.CGFloat x = v14;
      v46.origin.CGFloat y = v15;
      v46.size.CGFloat width = v16;
      v46.size.CGFloat height = v17;
      v49.origin.CGFloat y = y;
      v49.origin.CGFloat x = x;
      v49.size.CGFloat height = height;
      v49.size.CGFloat width = width;
      if (CGRectIntersectsRect(v46, v49))
      {
        BOOL v21 = 1;
        goto LABEL_23;
      }
      BOOL v21 = 0;
LABEL_17:
      char v19 = 0;
      long long v20 = (char *)v20 + 1;
    }
    while (v12 != v20);
    id v12 = [v10 countByEnumeratingWithState:&v36 objects:v40 count:16];
    char v19 = 0;
    BOOL v13 = v21;
    BOOL v21 = 0;
    if (v12) {
      continue;
    }
    break;
  }
LABEL_23:

  return v21;
}

- (void)canvasWillUpdateRepsFromLayouts:(id)a3
{
  id v4 = [(CRLInteractiveCanvasController *)self tmCoordinator];
  id v5 = [v4 controllingTM];
  id v10 = [v5 tracker];

  if (!v10
    || (objc_opt_respondsToSelector() & 1) == 0
    || ([v10 disallowCanvasGrowingWhileTracking] & 1) == 0)
  {
    if ([(CRLInteractiveCanvasController *)self resizeCanvasOnLayout])
    {
      [(CRLInteractiveCanvasController *)self p_updateCanvasSizeFromLayouts];
    }
    else if ([(CRLInteractiveCanvasController *)self shouldCanvasScrollingSizeGrowToFitBoardContent])
    {
      uint64_t v6 = [(CRLInteractiveCanvasController *)self layerHost];
      char v7 = [v6 canvasLayer];

      [v7 fixFrameAndScrollView];
    }
  }
  if (objc_opt_respondsToSelector())
  {
    long long v8 = [v10 repsToHide];
    mRepsToHideForCurrentTracker = self->mRepsToHideForCurrentTracker;
    self->mRepsToHideForCurrentTracker = v8;
  }
  else
  {
    mRepsToHideForCurrentTracker = self->mRepsToHideForCurrentTracker;
    self->mRepsToHideForCurrentTracker = 0;
  }

  [(CRLInteractiveCanvasController *)self i_canvasDidUpdateVisibleBounds];
}

- (BOOL)i_currentlySuppressingLayerUpdates
{
  v2 = [(CRLInteractiveCanvasController *)self i_interactiveCanvasLayerHelper];
  unsigned __int8 v3 = [v2 currentlySuppressingLayerUpdates];

  return v3;
}

- (void)i_beginSuppressingLayerUpdatesExceptForReps:(id)a3
{
  id v4 = a3;
  [(CRLInteractiveCanvasController *)self p_validateLayerSuppressionAPIAccess];
  id v5 = [(CRLInteractiveCanvasController *)self i_interactiveCanvasLayerHelper];

  if (!v5)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F32C8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A7684();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F32E8);
    }
    uint64_t v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v6);
    }
    char v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController i_beginSuppressingLayerUpdatesExceptForReps:]");
    long long v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 1198, 0, "invalid nil value for '%{public}s'", "self.i_interactiveCanvasLayerHelper");
  }
  long long v9 = [(CRLInteractiveCanvasController *)self i_interactiveCanvasLayerHelper];
  [v9 beginSuppressingLayerUpdatesExceptForReps:v4];
}

- (void)i_endSuppressingLayerUpdates
{
  [(CRLInteractiveCanvasController *)self p_validateLayerSuppressionAPIAccess];
  unsigned __int8 v3 = [(CRLInteractiveCanvasController *)self i_interactiveCanvasLayerHelper];

  if (!v3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F3308);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A7718();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F3328);
    }
    id v4 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v4);
    }
    id v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController i_endSuppressingLayerUpdates]");
    uint64_t v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 1204, 0, "invalid nil value for '%{public}s'", "self.i_interactiveCanvasLayerHelper");
  }
  char v7 = [(CRLInteractiveCanvasController *)self i_interactiveCanvasLayerHelper];
  [v7 endSuppressingLayerUpdates];
}

- (void)p_validateLayerSuppressionAPIAccess
{
  if (!+[NSThread isMainThread])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F3348);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A7834();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F3368);
    }
    unsigned __int8 v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController p_validateLayerSuppressionAPIAccess]");
    id v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:1209 isFatal:0 description:"This operation must only be performed on the main thread."];
  }
  uint64_t v6 = [(CRLInteractiveCanvasController *)self editingCoordinator];
  if (([v6 areIncomingCollaborativeChangesSuspended] & 1) == 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F3388);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A77AC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F33A8);
    }
    char v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v7);
    }
    long long v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController p_validateLayerSuppressionAPIAccess]");
    long long v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v8 file:v9 lineNumber:1216 isFatal:0 description:"Should not suppress layer updates unless collab is suspended!"];
  }
}

- (void)updateLayerTreeForInteractiveCanvas:(id)a3
{
  unsigned __int8 v3 = self;
  id v4 = [(CRLInteractiveCanvasController *)self layerHost];
  [v4 willUpdateLayerTree];

  unsigned int v5 = +[CRLRealTimeSyncDecorator shouldShowForICC:v3];
  mLiveSyncDecorator = v3->mLiveSyncDecorator;
  if (v5)
  {
    if (!mLiveSyncDecorator)
    {
      char v7 = [[CRLRealTimeSyncDecorator alloc] initWithInteractiveCanvasController:v3];
      long long v8 = v3->mLiveSyncDecorator;
      v3->mLiveSyncDecorator = v7;

      [(CRLInteractiveCanvasController *)v3 addDecorator:v3->mLiveSyncDecorator];
    }
  }
  else if (mLiveSyncDecorator)
  {
    -[CRLInteractiveCanvasController removeDecorator:](v3, "removeDecorator:");
    long long v9 = v3->mLiveSyncDecorator;
    v3->mLiveSyncDecorator = 0;
  }
  v75 = v3;
  if (v3->mCollaboratorCursorsInvalidated)
  {
    id v10 = +[NSMutableSet set];
    long long v115 = 0u;
    long long v116 = 0u;
    long long v117 = 0u;
    long long v118 = 0u;
    id v11 = v3->mCurrentCollaboratorPresences;
    id v12 = [(NSMutableSet *)v11 countByEnumeratingWithState:&v115 objects:v128 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v116;
      do
      {
        CGFloat v15 = 0;
        do
        {
          if (*(void *)v116 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v115 + 1) + 8 * (void)v15);
          CGFloat v17 = [(CRLInteractiveCanvasController *)v3 collaboratorCursorDelegate];
          [v17 collaboratorCursorSelectionPathForRenderer:v3 collaboratorPresence:v16];
          v19 = uint64_t v18 = v3;

          long long v20 = [(CRLInteractiveCanvasController *)v18 p_repsForCollaboratorCursorSelectionPath:v19];
          if (qword_101719BE8 != -1) {
            dispatch_once(&qword_101719BE8, &stru_1014F33C8);
          }
          BOOL v21 = off_10166B618;
          if (os_log_type_enabled((os_log_t)off_10166B618, OS_LOG_TYPE_INFO))
          {
            LODWORD(buf) = 138543362;
            *(void *)((char *)&buf + 4) = v20;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Collaborator Cursors: Calling the following reps to invalidate: %{public}@", (uint8_t *)&buf, 0xCu);
          }
          long long v113 = 0u;
          long long v114 = 0u;
          long long v111 = 0u;
          long long v112 = 0u;
          id v22 = v20;
          id v23 = [v22 countByEnumeratingWithState:&v111 objects:v127 count:16];
          if (v23)
          {
            id v24 = v23;
            uint64_t v25 = *(void *)v112;
            do
            {
              for (i = 0; i != v24; i = (char *)i + 1)
              {
                if (*(void *)v112 != v25) {
                  objc_enumerationMutation(v22);
                }
                [*(id *)(*((void *)&v111 + 1) + 8 * i) collaboratorCursorChangedToSelectionPath:v19];
              }
              id v24 = [v22 countByEnumeratingWithState:&v111 objects:v127 count:16];
            }
            while (v24);
          }

          [v10 unionSet:v22];
          CGFloat v15 = (char *)v15 + 1;
          unsigned __int8 v3 = v75;
        }
        while (v15 != v13);
        id v13 = [(NSMutableSet *)v11 countByEnumeratingWithState:&v115 objects:v128 count:16];
      }
      while (v13);
    }

    id v27 = objc_alloc_init((Class)NSMutableSet);
    long long v107 = 0u;
    long long v108 = 0u;
    long long v109 = 0u;
    long long v110 = 0u;
    CGFloat v28 = v3->mInfosPreviouslyShowingCollabCursors;
    id v29 = [(NSSet *)v28 countByEnumeratingWithState:&v107 objects:v126 count:16];
    if (v29)
    {
      id v30 = v29;
      uint64_t v31 = *(void *)v108;
      do
      {
        for (j = 0; j != v30; j = (char *)j + 1)
        {
          if (*(void *)v108 != v31) {
            objc_enumerationMutation(v28);
          }
          CGPoint v33 = [(CRLInteractiveCanvasController *)v3 repForInfo:*(void *)(*((void *)&v107 + 1) + 8 * (void)j)];
          if (v33) {
            [v27 addObject:v33];
          }
        }
        id v30 = [(NSSet *)v28 countByEnumeratingWithState:&v107 objects:v126 count:16];
      }
      while (v30);
    }

    id v34 = objc_alloc_init((Class)NSMutableSet);
    long long v103 = 0u;
    long long v104 = 0u;
    long long v105 = 0u;
    long long v106 = 0u;
    id v35 = v10;
    id v36 = [v35 countByEnumeratingWithState:&v103 objects:v125 count:16];
    if (v36)
    {
      id v37 = v36;
      uint64_t v38 = *(void *)v104;
      do
      {
        for (k = 0; k != v37; k = (char *)k + 1)
        {
          if (*(void *)v104 != v38) {
            objc_enumerationMutation(v35);
          }
          v40 = [*(id *)(*((void *)&v103 + 1) + 8 * (void)k) info];
          if (v40) {
            [v34 addObject:v40];
          }
        }
        id v37 = [v35 countByEnumeratingWithState:&v103 objects:v125 count:16];
      }
      while (v37);
    }

    CGRect v41 = (NSSet *)[v34 copy];
    mInfosPreviouslyShowingCollabCursors = v3->mInfosPreviouslyShowingCollabCursors;
    v3->mInfosPreviouslyShowingCollabCursors = v41;

    [v27 minusSet:v35];
    long long v101 = 0u;
    long long v102 = 0u;
    long long v99 = 0u;
    long long v100 = 0u;
    id v43 = v27;
    id v44 = [v43 countByEnumeratingWithState:&v99 objects:v124 count:16];
    if (v44)
    {
      id v45 = v44;
      uint64_t v46 = *(void *)v100;
      do
      {
        for (m = 0; m != v45; m = (char *)m + 1)
        {
          if (*(void *)v100 != v46) {
            objc_enumerationMutation(v43);
          }
          [*(id *)(*((void *)&v99 + 1) + 8 * (void)m) hideCollaboratorCursors];
        }
        id v45 = [v43 countByEnumeratingWithState:&v99 objects:v124 count:16];
      }
      while (v45);
    }

    v3->mCollaboratorCursorsInvalidated = 0;
  }
  id v73 = objc_alloc_init((Class)NSMutableSet);
  long long v95 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  CGRect v48 = v3->mCurrentCollaboratorPresences;
  id v49 = [(NSMutableSet *)v48 countByEnumeratingWithState:&v95 objects:v123 count:16];
  if (v49)
  {
    id v50 = v49;
    uint64_t v51 = *(void *)v96;
    do
    {
      for (n = 0; n != v50; n = (char *)n + 1)
      {
        if (*(void *)v96 != v51) {
          objc_enumerationMutation(v48);
        }
        uint64_t v53 = *(void *)(*((void *)&v95 + 1) + 8 * (void)n);
        v54 = [(CRLInteractiveCanvasController *)v3 collaboratorCursorDelegate];
        v55 = [v54 collaboratorCursorSelectionPathForRenderer:v3 collaboratorPresence:v53];

        long long buf = 0u;
        long long v122 = 0u;
        [(CRLInteractiveCanvasController *)v3 p_collaboratorHUDPositionForSelectionPath:v55 collaboratorPresence:v53 allowScroll:0 hudSize:1];
        if (BYTE8(v122) && (void)v122) {
          [v73 addObject:v53];
        }
      }
      id v50 = [(NSMutableSet *)v48 countByEnumeratingWithState:&v95 objects:v123 count:16];
    }
    while (v50);
  }

  id v77 = [v73 mutableCopy];
  [v77 minusSet:v3->mVisibleCollaboratorPresences];
  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  id obj = v3->mVisibleCollaboratorPresences;
  id v78 = [(NSMutableSet *)obj countByEnumeratingWithState:&v91 objects:v120 count:16];
  if (v78)
  {
    uint64_t v76 = *(void *)v92;
    do
    {
      for (ii = 0; ii != v78; ii = (char *)ii + 1)
      {
        if (*(void *)v92 != v76) {
          objc_enumerationMutation(obj);
        }
        v57 = *(void **)(*((void *)&v91 + 1) + 8 * (void)ii);
        long long v87 = 0u;
        long long v88 = 0u;
        long long v89 = 0u;
        long long v90 = 0u;
        id v58 = v77;
        id v59 = [v58 countByEnumeratingWithState:&v87 objects:v119 count:16];
        if (v59)
        {
          id v60 = v59;
          uint64_t v61 = *(void *)v88;
          while (2)
          {
            for (jj = 0; jj != v60; jj = (char *)jj + 1)
            {
              if (*(void *)v88 != v61) {
                objc_enumerationMutation(v58);
              }
              v63 = *(void **)(*((void *)&v87 + 1) + 8 * (void)jj);
              v64 = [v63 presenceUUID];
              v65 = [v57 presenceUUID];
              unsigned int v66 = [v64 isEqual:v65];

              if (v66)
              {
                [v58 removeObject:v63];
                goto LABEL_76;
              }
            }
            id v60 = [v58 countByEnumeratingWithState:&v87 objects:v119 count:16];
            if (v60) {
              continue;
            }
            break;
          }
        }
LABEL_76:
      }
      id v78 = [(NSMutableSet *)obj countByEnumeratingWithState:&v91 objects:v120 count:16];
    }
    while (v78);
  }

  id v67 = [(NSMutableSet *)v75->mVisibleCollaboratorPresences copy];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  v81 = sub_10038A584;
  v82 = &unk_1014EB820;
  id v83 = v77;
  v84 = v75;
  id v85 = v67;
  v68 = (NSMutableSet *)v73;
  v86 = v68;
  id v69 = v67;
  id v70 = v77;
  if (+[NSThread isMainThread]) {
    v81((id *)block);
  }
  else {
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  mVisibleCollaboratorPresences = v75->mVisibleCollaboratorPresences;
  v75->mVisibleCollaboratorPresences = v68;
  v72 = v68;

  v79[0] = _NSConcreteStackBlock;
  v79[1] = 3221225472;
  v79[2] = sub_10038A780;
  v79[3] = &unk_1014CBBB0;
  v79[4] = v75;
  [(CRLInteractiveCanvasController *)v75 p_performBlockWithCachedLayoutsForCollaboratorCursors:v79];
  v75->mAllDecoratorLayersAreInvalid = 0;
  [(NSMutableSet *)v75->mDecoratorsWithInvalidLayers removeAllObjects];
}

- (void)canvasDidValidateLayoutsWithDependencies:(id)a3
{
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 postNotificationName:@"CRLInteractiveCanvasControllerDidValidateLayoutsWithDependenciesNotification" object:self];
}

- (CGRect)visibleScaledBoundsForClippingRepsOnCanvas:(id)a3
{
  if (self->mCreateRepsForOffscreenLayouts)
  {
    double x = CGRectInfinite.origin.x;
    double y = CGRectInfinite.origin.y;
    double width = CGRectInfinite.size.width;
    double height = CGRectInfinite.size.height;
  }
  else
  {
    [(CRLInteractiveCanvasController *)self visibleBoundsRectForTiling];
  }
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (id)additionalVisibleInfosForCanvas:(id)a3
{
  if (self->mCreateRepsForOffscreenLayouts)
  {
    unsigned __int8 v3 = 0;
  }
  else
  {
    unsigned int v5 = [(CRLInteractiveCanvasController *)self selectionModelTranslator];
    uint64_t v6 = [(CRLInteractiveCanvasController *)self editorController];
    char v7 = [v6 selectionPath];
    long long v8 = [v5 boardItemsForSelectionPath:v7];

    long long v9 = [(CRLInteractiveCanvasController *)self dynamicOperationController];
    id v10 = [v9 allTransformedReps];

    if (v10)
    {
      unsigned __int8 v3 = +[NSMutableSet setWithSet:v8];

      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v11 = v10;
      id v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v12)
      {
        id v13 = v12;
        uint64_t v14 = *(void *)v19;
        do
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(void *)v19 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = [*(id *)(*((void *)&v18 + 1) + 8 * i) info:v18];
            [v3 addObject:v16];
          }
          id v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v13);
      }
    }
    else
    {
      unsigned __int8 v3 = v8;
    }
  }

  return v3;
}

- (void)canvas:(id)a3 createdRep:(id)a4
{
  id v5 = a4;
  id v6 = [(CRLInteractiveCanvasController *)self canvasEditor];
  [v6 repWasCreated:v5];
}

- (void)presentError:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CRLInteractiveCanvasController *)self layerHost];
  [v8 presentError:v7 completionHandler:v6];
}

- (void)presentErrors:(id)a3 withLocalizedDescription:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(CRLInteractiveCanvasController *)self layerHost];
  [v11 presentErrors:v10 withLocalizedDescription:v9 completionHandler:v8];
}

+ (id)keyPathsForValuesAffectingEditorController
{
  return +[NSSet setWithObject:@"documentRoot"];
}

- (CRLEditorController)editorController
{
  p_mEditorController = &self->mEditorController;
  mEditorController = self->mEditorController;
  if (!mEditorController)
  {
    id v5 = [(CRLInteractiveCanvasController *)self delegate];
    if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      int64_t mIsFetchingEditorController = self->mIsFetchingEditorController;
      if (mIsFetchingEditorController < 1)
      {
        self->int64_t mIsFetchingEditorController = mIsFetchingEditorController + 1;
        id v9 = [v5 editorControllerForInteractiveCanvasController:self];
        id v10 = v9;
        id v11 = self->mEditorController;
        if (!v11 || v9 == v11)
        {
          objc_storeStrong((id *)p_mEditorController, v9);
        }
        else
        {
          +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014F33E8);
          }
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
            sub_1010A79CC();
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014F3408);
          }
          id v12 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
            sub_10106590C(v12);
          }
          id v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController editorController]");
          uint64_t v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"];
          +[CRLAssertionHandler handleFailureInFunction:v13 file:v14 lineNumber:1403 isFatal:0 description:"editor controller mismatch"];

          CGFloat v15 = *p_mEditorController;
          *p_mEditorController = 0;
        }
        int64_t v16 = self->mIsFetchingEditorController;
        if (v16 <= 0)
        {
          +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014F3428);
          }
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
            sub_1010A7944();
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014F3448);
          }
          CGFloat v17 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
            sub_10106590C(v17);
          }
          long long v18 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController editorController]");
          long long v19 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"];
          +[CRLAssertionHandler handleFailureInFunction:v18 file:v19 lineNumber:1406 isFatal:0 description:"Negative reentrancy counter"];

          int64_t v16 = self->mIsFetchingEditorController;
        }
        self->int64_t mIsFetchingEditorController = v16 - 1;
      }
      else
      {
        id v7 = [v5 editorControllerForInteractiveCanvasController:self];
        id v8 = self->mEditorController;
        self->mEditorController = v7;
      }
    }
    if (*p_mEditorController) {
      goto LABEL_39;
    }
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F3468);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A78BC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F3488);
    }
    long long v20 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v20);
    }
    long long v21 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController editorController]");
    id v22 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v21 file:v22 lineNumber:1410 isFatal:0 description:"ICC delegate must provide the editor controller! (You probably need to give it a document selection through canvas selection, too.)"];

    if (*p_mEditorController)
    {
LABEL_39:
      [(CRLEditorController *)self->mEditorController setEditingDisabledReasons:[(CRLInteractiveCanvasController *)self p_editingDisabledReasons]];
      id v23 = +[NSNotificationCenter defaultCenter];
      [v23 addObserver:self selector:"p_editorControllerDidChangeTextInputEditor:" name:@"CRLEditorControllerDidChangeTextInputEditor" object:self->mEditorController];
      [v23 addObserver:self selector:"p_editorControllerSelectionPathDidChange:" name:@"CRLEditorControllerSelectionPathDidChangeNotification" object:self->mEditorController];
      [v23 addObserver:self selector:"p_editorControllerSelectionDidChangeAndWantsKeyboard:" name:@"CRLEditorControllerSelectionDidChangeAndWantsKeyboard" object:self->mEditorController];
    }
    mEditorController = *p_mEditorController;
  }

  return mEditorController;
}

- (void)setTextInputResponder:(id)a3
{
  id v5 = (_TtC8Freeform21CRLTextInputResponder *)a3;
  if (self->mTextInputResponder != v5)
  {
    id v8 = v5;
    objc_storeStrong((id *)&self->mTextInputResponder, a3);
    id v6 = [(CRLInteractiveCanvasController *)self layerHost];
    id v7 = [v6 asiOSCVC];

    [v7 textInputResponderDidChange];
    id v5 = v8;
  }
}

- (id)newCanvasEditor
{
  unsigned __int8 v3 = [CRLCanvasEditor alloc];

  return [(CRLCanvasEditor *)v3 initWithInteractiveCanvasController:self];
}

- (CRLCanvasEditor)canvasEditor
{
  mCanvasEditor = self->mCanvasEditor;
  if (!mCanvasEditor)
  {
    id v4 = [(CRLInteractiveCanvasController *)self newCanvasEditor];
    id v5 = self->mCanvasEditor;
    self->mCanvasEditor = v4;

    mCanvasEditor = self->mCanvasEditor;
  }

  return mCanvasEditor;
}

- (void)endEditing
{
}

- (void)endEditingWithFlags:(unint64_t)a3
{
  id v14 = [(CRLInteractiveCanvasController *)self editorController];
  id v5 = [(CRLInteractiveCanvasController *)self selectionModelTranslator];
  id v6 = [v14 selectionPath];
  id v7 = [v6 mostSpecificSelectionOfClass:objc_opt_class()];

  if (v7)
  {
    id v8 = [v14 selectionPath];
    id v9 = (char *)[v8 indexForSelection:v7];

    id v10 = [v14 selectionPath];
    id v11 = [v10 orderedSelections];
    id v12 = [v11 subarrayWithRange:0, v9 + 1];

    id v13 = +[CRLSelectionPath selectionPathWithSelectionArray:v12];
    [v14 setSelectionPath:v13 withFlags:a3];
  }
  else
  {
    id v12 = [v5 selectionPathForInfos:0];
    [v14 setSelectionPath:v12 withFlags:a3];
  }
}

- (void)endEditingDiscardingEdits
{
  self->mDiscardingEdits = 1;
  [(CRLInteractiveCanvasController *)self endEditing];
  self->mDiscardingEdits = 0;
}

- (BOOL)canZoomToCurrentSelection
{
  unsigned __int8 v3 = [(CRLInteractiveCanvasController *)self selectionModelTranslator];
  id v4 = [(CRLInteractiveCanvasController *)self editorController];
  id v5 = [v4 selectionPath];
  id v6 = [v3 boardItemsForSelectionPath:v5];
  BOOL v7 = [v6 count] != 0;

  return v7;
}

- (CGPoint)smartZoomCenterForNoSelection
{
  v2 = [(CRLInteractiveCanvasController *)self canvas];
  [v2 unscaledSize];
  double v3 = sub_100064070();
  double v7 = sub_100065738(v3, v4, v5, v6);
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double y = v11;
  result.double x = v10;
  return result;
}

- (void)zoomToCurrentSelection
{
  id v4 = [(CRLInteractiveCanvasController *)self editorController];
  double v3 = [v4 selectionPath];
  [(CRLInteractiveCanvasController *)self zoomToSelectionPath:v3];
}

- (void)zoomToFitAllContent
{
  if ([(CRLInteractiveCanvasController *)self shouldCanvasScrollingSizeGrowToFitBoardContent])
  {
    [(CRLCanvas *)self->mCanvas unscaledRectOfLayouts];
    double v7 = self;
  }
  else
  {
    [(CRLInteractiveCanvasController *)self defaultMinimumUnscaledCanvasSize];
    [(CRLCanvas *)self->mCanvas unscaledRectOfLayouts];
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    double v16 = sub_100064070();
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    v49.origin.double x = v9;
    v49.origin.double y = v11;
    v49.size.double width = v13;
    v49.size.double height = v15;
    v57.origin.double x = v16;
    v57.origin.double y = v18;
    v57.size.double width = v20;
    v57.size.double height = v22;
    CGRect v50 = CGRectUnion(v49, v57);
    double x = v50.origin.x;
    double y = v50.origin.y;
    double width = v50.size.width;
    double height = v50.size.height;
    v58.origin.double x = v16;
    v58.origin.double y = v18;
    v58.size.double width = v20;
    v58.size.double height = v22;
    if (!CGRectEqualToRect(v50, v58))
    {
      id v27 = [(CRLInteractiveCanvasController *)self layerHost];
      CGFloat v28 = [v27 canvasLayer];
      if ([v28 horizontallyCenteredInScrollView])
      {
        id v29 = [(CRLInteractiveCanvasController *)self layerHost];
        id v30 = [v29 canvasLayer];
        unsigned int v31 = [v30 verticallyCenteredInScrollView];

        if (v31)
        {
          double v32 = sub_100065738(v16, v18, v20, v22);
          double v34 = v33;
          v51.origin.double x = x;
          v51.origin.double y = y;
          v51.size.double width = width;
          v51.size.double height = height;
          double v35 = v32 - CGRectGetMinX(v51);
          v52.origin.double x = x;
          v52.origin.double y = y;
          v52.size.double width = width;
          v52.size.double height = height;
          double v36 = CGRectGetMaxX(v52) - v32;
          if (v35 < v36) {
            double v35 = v36;
          }
          v53.origin.double x = x;
          v53.origin.double y = y;
          v53.size.double width = width;
          v53.size.double height = height;
          double v37 = v34 - CGRectGetMinY(v53);
          v54.origin.double x = x;
          v54.origin.double y = y;
          v54.size.double width = width;
          v54.size.double height = height;
          double v38 = CGRectGetMaxY(v54) - v34;
          if (v37 >= v38) {
            double v39 = v37;
          }
          else {
            double v39 = v38;
          }
          double v40 = sub_1000646A4(v35, v39, 2.0);
          double x = sub_10006402C(v32, v34, v40);
          double y = v41;
          double width = v42;
          double height = v43;
        }
      }
      else
      {
      }
      -[CRLInteractiveCanvasController p_targetViewScaleForUnscaledRect:](self, "p_targetViewScaleForUnscaledRect:", x, y, width, height);
      double v45 = sub_1000646A4(-20.0, -20.0, 1.0 / v44);
      CGFloat v47 = v46;
      v55.origin.double x = x;
      v55.origin.double y = y;
      v55.size.double width = width;
      v55.size.double height = height;
      CGRect v56 = CGRectInset(v55, v45, v47);
      double x = v56.origin.x;
      double y = v56.origin.y;
      double width = v56.size.width;
      double height = v56.size.height;
    }
    double v7 = self;
    double v3 = x;
    double v4 = y;
    double v5 = width;
    double v6 = height;
  }

  -[CRLInteractiveCanvasController zoomWithAnimationToUnscaledRect:](v7, "zoomWithAnimationToUnscaledRect:", v3, v4, v5, v6);
}

- (void)zoomToSelectionPath:(id)a3
{
  id v4 = a3;
  double v5 = [(CRLInteractiveCanvasController *)self infosForSelectionPath:v4];
  if ([v5 count]) {
    double v6 = &CGRectZero;
  }
  else {
    double v6 = &CGRectNull;
  }
  CGFloat x = v6->origin.x;
  CGFloat y = v6->origin.y;
  CGFloat width = v6->size.width;
  CGFloat height = v6->size.height;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v11 = v5;
  id v12 = [v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v27;
    char v15 = 1;
    do
    {
      double v16 = 0;
      do
      {
        if (*(void *)v27 != v14) {
          objc_enumerationMutation(v11);
        }
        double v17 = -[CRLInteractiveCanvasController layoutForInfoNearestVisibleRect:](self, "layoutForInfoNearestVisibleRect:", *(void *)(*((void *)&v26 + 1) + 8 * (void)v16), (void)v26);
        [v17 rectInRootForSelectionPath:v4];
        CGFloat v22 = v18;
        double v23 = v19;
        double v24 = v20;
        double v25 = v21;
        if ((v15 & 1) == 0)
        {
          v31.origin.CGFloat x = x;
          v31.origin.CGFloat y = y;
          v31.size.CGFloat width = width;
          v31.size.CGFloat height = height;
          *(CGRect *)&CGFloat v18 = CGRectUnion(v31, *(CGRect *)&v22);
        }
        CGFloat x = v18;
        CGFloat y = v19;
        CGFloat width = v20;
        CGFloat height = v21;

        char v15 = 0;
        double v16 = (char *)v16 + 1;
      }
      while (v13 != v16);
      id v13 = [v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
      char v15 = 0;
    }
    while (v13);
  }

  v32.origin.CGFloat x = x;
  v32.origin.CGFloat y = y;
  v32.size.CGFloat width = width;
  v32.size.CGFloat height = height;
  CGRect v33 = CGRectInset(v32, -10.0, -10.0);
  -[CRLInteractiveCanvasController zoomWithAnimationToUnscaledRect:](self, "zoomWithAnimationToUnscaledRect:", v33.origin.x, v33.origin.y, v33.size.width, v33.size.height);
}

- (double)p_targetViewScaleForUnscaledRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (CGRectIsNull(a3))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F34A8);
    }
    double v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A7A54(v8, x, y, width, height);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F34C8);
    }
    CGFloat v9 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v9);
    }
    double v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController p_targetViewScaleForUnscaledRect:]");
    id v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"];
    v18.origin.CGFloat x = x;
    v18.origin.CGFloat y = y;
    v18.size.double width = width;
    v18.size.double height = height;
    id v12 = NSStringFromCGRect(v18);
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 1585, 0, "Don't know how to handle desired zoom rect %{public}@!", v12);

    return 1.0;
  }
  else
  {
    [(CRLInteractiveCanvasController *)self visibleUnscaledRect];
    if (v14 / width >= v15 / height) {
      double v16 = v15 / height;
    }
    else {
      double v16 = v14 / width;
    }
    [(CRLInteractiveCanvasController *)self viewScale];
    return v17 * v16;
  }
}

- (void)scrollCenteredOrZoomToUnscaledRect:(CGRect)a3 shouldAnimateScroll:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (!CGRectIsNull(a3))
  {
    -[CRLInteractiveCanvasController p_targetViewScaleForUnscaledRect:](self, "p_targetViewScaleForUnscaledRect:", x, y, width, height);
    double v11 = v10;
    id v12 = [(CRLInteractiveCanvasController *)self layerHost];
    id v15 = [v12 canvasLayer];

    [v15 viewScale];
    if (v13 == v11 || vabdd_f64(v13, v11) < 0.00999999978 || v11 < 0.1 && v13 == 0.1)
    {
      if (v4) {
        uint64_t v14 = 97;
      }
      else {
        uint64_t v14 = 96;
      }
      -[CRLInteractiveCanvasController scrollRectToVisible:scrollOptions:](self, "scrollRectToVisible:scrollOptions:", v14, x, y, width, height);
    }
    else
    {
      -[CRLInteractiveCanvasController zoomWithAnimationToUnscaledRect:](self, "zoomWithAnimationToUnscaledRect:", x, y, width, height);
    }
  }
}

+ (double)zoomAnimationDefaultDuration
{
  v2 = +[CRLCanvasLayer zoomAnimationDefaultCAAnimation];
  [v2 duration];
  double v4 = v3;

  return v4;
}

- (void)zoomWithAnimationToUnscaledRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = +[CRLCanvasLayer zoomAnimationDefaultCAAnimation];
  -[CRLInteractiveCanvasController zoomWithAnimation:toUnscaledRect:](self, "zoomWithAnimation:toUnscaledRect:", v8, x, y, width, height);
}

- (void)zoomWithAnimationToUnscaledRect:(CGRect)a3 withDuration:(double)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = +[CRLCanvasLayer zoomAnimationDefaultCAAnimation];
  [v10 setDuration:a4];
  -[CRLInteractiveCanvasController zoomWithAnimation:toUnscaledRect:](self, "zoomWithAnimation:toUnscaledRect:", v10, x, y, width, height);
}

- (void)zoomWithAnimation:(id)a3 toUnscaledRect:(CGRect)a4
{
}

- (void)zoomWithAnimation:(id)a3 toUnscaledRect:(CGRect)a4 layoutOffscreenContent:(BOOL)a5 completionBlock:(id)a6
{
  BOOL v7 = a5;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v13 = a3;
  id v14 = a6;
  v56.origin.double x = x;
  v56.origin.double y = y;
  v56.size.double width = width;
  v56.size.double height = height;
  if (!CGRectIsNull(v56))
  {
    if (v7)
    {
      self->mPreviewVisibleUnscaledRectForTiling.origin.double x = x;
      self->mPreviewVisibleUnscaledRectForTiling.origin.double y = y;
      self->mPreviewVisibleUnscaledRectForTiling.size.double width = width;
      self->mPreviewVisibleUnscaledRectForTiling.size.double height = height;
      self->mShouldLayoutOffscreenContentForZoomAnimation = 1;
      [(CRLInteractiveCanvasController *)self invalidateVisibleBounds];
      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      id v15 = [(CRLInteractiveCanvasController *)self canvas];
      double v16 = [v15 allReps];

      id v17 = [v16 countByEnumeratingWithState:&v51 objects:v55 count:16];
      if (v17)
      {
        uint64_t v18 = *(void *)v52;
        do
        {
          double v19 = 0;
          do
          {
            if (*(void *)v52 != v18) {
              objc_enumerationMutation(v16);
            }
            [*(id *)(*((void *)&v51 + 1) + 8 * (void)v19) frameInUnscaledCanvas];
            self->mPreviewVisibleUnscaledRectForTiling.origin.double x = sub_100064F28(v20, v21, v22, v23, self->mPreviewVisibleUnscaledRectForTiling.origin.x, self->mPreviewVisibleUnscaledRectForTiling.origin.y, self->mPreviewVisibleUnscaledRectForTiling.size.width, self->mPreviewVisibleUnscaledRectForTiling.size.height);
            self->mPreviewVisibleUnscaledRectForTiling.origin.double y = v24;
            self->mPreviewVisibleUnscaledRectForTiling.size.double width = v25;
            self->mPreviewVisibleUnscaledRectForTiling.size.double height = v26;
            double v19 = (char *)v19 + 1;
          }
          while (v17 != v19);
          id v17 = [v16 countByEnumeratingWithState:&v51 objects:v55 count:16];
        }
        while (v17);
      }

      [(CRLInteractiveCanvasController *)self invalidateVisibleBounds];
    }
    -[CRLInteractiveCanvasController p_targetViewScaleForUnscaledRect:](self, "p_targetViewScaleForUnscaledRect:", x, y, width, height);
    double v28 = v27;
    long long v29 = [(CRLInteractiveCanvasController *)self layerHost];
    id v30 = [v29 canvasLayer];

    [v30 minimumPinchViewScale];
    double v32 = v31;
    [v30 maximumPinchViewScale];
    double v45 = sub_100407E48(v28, v32, v33);
    self->mRectToIncludeWhenGrowingCanvasToFitContent.origin.double x = x;
    self->mRectToIncludeWhenGrowingCanvasToFitContent.origin.double y = y;
    self->mRectToIncludeWhenGrowingCanvasToFitContent.size.double width = width;
    self->mRectToIncludeWhenGrowingCanvasToFitContent.size.double height = height;
    objc_initWeak(&location, self);
    [v30 contentInset];
    double v35 = v34;
    double v37 = v36;
    double v39 = v38;
    double v41 = v40;
    double v42 = sub_100065738(x, y, width, height);
    double v44 = v43;
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = sub_10038C2D4;
    v46[3] = &unk_1014F3530;
    objc_copyWeak(&v48, &location);
    BOOL v49 = v7;
    id v47 = v14;
    [v30 animateToViewScale:v13 contentCenter:v46 contentInset:v45 animation:v42 completionBlock:v35, v37, v39, v41];

    objc_destroyWeak(&v48);
    objc_destroyWeak(&location);
  }
}

- (BOOL)shouldZoomOnSelectionChange
{
  double v3 = [(CRLInteractiveCanvasController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0;
  }
  double v5 = [(CRLInteractiveCanvasController *)self delegate];
  unsigned __int8 v6 = [v5 zoomOnSelectionChange:self];

  return v6;
}

- (id)infoForSelectionPath:(id)a3
{
  double v3 = [(CRLInteractiveCanvasController *)self infosForSelectionPath:a3];
  if ([v3 count] == (id)1)
  {
    char v4 = [v3 anyObject];
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

- (CRLSelectionModelTranslator)selectionModelTranslator
{
  double v3 = [(CRLInteractiveCanvasController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    double v5 = [(CRLInteractiveCanvasController *)self delegate];
    unsigned __int8 v6 = [v5 selectionModelTranslatorForInteractiveCanvasController:self];

    if (v6) {
      goto LABEL_22;
    }
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F3550);
    }
    BOOL v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A7BE4(v7);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F3570);
    }
    id v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v8);
    }
    CGFloat v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController selectionModelTranslator]");
    id v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"];
    double v11 = [(CRLInteractiveCanvasController *)self delegate];
    +[CRLAssertionHandler handleFailureInFunction:v9, v10, 1708, 0, "ICC delegate %@ must respond to selectionModelTranslatorForInteractiveCanvasController", v11 file lineNumber isFatal description];
  }
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F3590);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_1010A7B50();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F35B0);
  }
  id v12 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_10106590C(v12);
  }
  id v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController selectionModelTranslator]");
  id v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"];
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 1710, 0, "invalid nil value for '%{public}s'", "selectionModelTranslator");

  unsigned __int8 v6 = 0;
LABEL_22:

  return (CRLSelectionModelTranslator *)v6;
}

- (id)infosForSelectionPath:(id)a3
{
  id v4 = a3;
  double v5 = [(CRLInteractiveCanvasController *)self selectionModelTranslator];
  unsigned __int8 v6 = [v5 infosForSelectionPath:v4];

  return v6;
}

- (NSSet)infosForCurrentSelectionPath
{
  double v3 = [(CRLInteractiveCanvasController *)self editorController];
  id v4 = [v3 selectionPath];
  double v5 = [(CRLInteractiveCanvasController *)self infosForSelectionPath:v4];

  return (NSSet *)v5;
}

- (BOOL)currentSelectionPathContainsInfo:(id)a3
{
  id v4 = a3;
  double v5 = (objc_class *)objc_opt_class();
  double v11 = sub_100246E2C(v4, v5, 1, v6, v7, v8, v9, v10, (uint64_t)&OBJC_PROTOCOL___CRLCanvasElementInfo);
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  if (v11)
  {
    id v12 = [(CRLInteractiveCanvasController *)self editorController];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10038CA38;
    v15[3] = &unk_1014CFB80;
    v15[4] = v11;
    void v15[5] = &v16;
    [v12 enumerateEditorsOnStackUsingBlock:v15];

    BOOL v13 = *((unsigned char *)v17 + 24) != 0;
  }
  else
  {
    BOOL v13 = 0;
  }
  _Block_object_dispose(&v16, 8);

  return v13;
}

- (BOOL)hasSelection
{
  double v3 = [(CRLInteractiveCanvasController *)self editorController];
  id v4 = [v3 mostSpecificCurrentEditorOfClass:objc_opt_class()];

  uint64_t v5 = objc_opt_class();
  uint64_t v6 = [(CRLInteractiveCanvasController *)self editorController];
  uint64_t v7 = [v6 selectionPath];
  uint64_t v8 = [v7 mostSpecificSelectionOfClass:0];
  uint64_t v9 = sub_1002469D0(v5, v8);

  uint64_t v10 = [(CRLInteractiveCanvasController *)self infosForCurrentSelectionPath];
  id v11 = [v10 count];

  if (!v11) {
    return 0;
  }
  return !v4 || v9 == 0;
}

- (BOOL)hasSelectedInfosInMultipleContainers
{
  v2 = [(CRLInteractiveCanvasController *)self editorController];
  double v3 = [v2 selectionPath];
  id v4 = [v3 mostSpecificSelectionOfClass:objc_opt_class()];

  if (v4) {
    unsigned __int8 v5 = [v4 isCrossContainerSelection];
  }
  else {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (NSSet)containersForSelection
{
  v2 = [(CRLInteractiveCanvasController *)self editorController];
  double v3 = [v2 selectionPath];
  id v4 = [v3 mostSpecificSelectionOfClass:objc_opt_class()];

  if (v4)
  {
    unsigned __int8 v5 = [v4 containerGroups];
    uint64_t v6 = +[NSSet setWithArray:v5];
  }
  else
  {
    uint64_t v6 = +[NSSet set];
  }

  return (NSSet *)v6;
}

- (void)scrollCurrentSelectionToVisibleWithOptions:(unint64_t)a3
{
  id v6 = [(CRLInteractiveCanvasController *)self editorController];
  unsigned __int8 v5 = [v6 selectionPath];
  [(CRLInteractiveCanvasController *)self scrollToSelectionPath:v5 scrollOptions:a3];
}

- (id)selectionPathForSearchReference:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = (objc_class *)objc_opt_class();
  id v6 = sub_10024715C(v5, v4);

  uint64_t v7 = [(CRLInteractiveCanvasController *)self selectionModelTranslator];
  uint64_t v8 = [v6 selection];
  uint64_t v9 = [v6 storage];
  uint64_t v10 = [v7 selectionPathForSelection:v8 onStorage:v9];

  return v10;
}

- (Class)wpSelectionClassForStorage:(id)a3
{
  return (Class)objc_opt_class();
}

- (void)scrollSearchReferenceToVisible:(id)a3 scrollOptions:(unint64_t)a4
{
  id v10 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)&self->mDelegate);
    [v8 willScrollSearchReferenceToVisible:v10];
  }
  uint64_t v9 = [v10 selectionPath];
  [(CRLInteractiveCanvasController *)self scrollToSelectionPath:v9 scrollOptions:a4];
}

- (void)setSelectionPath:(id)a3 withSelectionFlags:(unint64_t)a4
{
  id v6 = a3;
  char v7 = v6;
  if ((a4 & 0x4000) != 0)
  {
    if ((a4 & 4) != 0)
    {
      if ((a4 & 0x200) != 0) {
        uint64_t v9 = 9;
      }
      else {
        uint64_t v9 = 1;
      }
      id v11 = v6;
      goto LABEL_21;
    }
    int v12 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F35D0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A7CA8((uint64_t)v7, v12);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F35F0);
    }
    BOOL v13 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v13);
    }
    id v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController setSelectionPath:withSelectionFlags:]");
    id v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v14, v15, 1813, 0, "Caller set a selection path that does not want to set selection or scroll: %@", v7 file lineNumber isFatal description];
  }
  else
  {
    id v8 = [(CRLInteractiveCanvasController *)self editorController];
    [v8 setSelectionPath:v7 withFlags:a4 & 0xFFFFFFFFFFFFFFFBLL];

    if ((a4 & 4) != 0)
    {
      if ((a4 & 0x200) != 0) {
        uint64_t v9 = 9;
      }
      else {
        uint64_t v9 = 1;
      }
      id v10 = [(CRLInteractiveCanvasController *)self editorController];
      id v11 = [v10 selectionPath];

LABEL_21:
      [(CRLInteractiveCanvasController *)self scrollToSelectionPath:v11 scrollOptions:v9];
    }
  }
}

- (CGRect)rectInRootForScrollingToSelectionPath:(id)a3 onLayout:(id)a4 allowingZooming:(BOOL)a5
{
  if (a5) {
    [a4 rectInRootForZoomingToSelectionPath:a3];
  }
  else {
    [a4 rectInRootForSelectionPath:a3];
  }
  result.size.double height = v8;
  result.size.double width = v7;
  result.origin.double y = v6;
  result.origin.double x = v5;
  return result;
}

- ($114667933B9B2D05530DD42EBD1EDB26)p_scrollingInformationForSelectionPath:(SEL)a3 allowZoom:(id)a4
{
  id v8 = a4;
  uint64_t v47 = 0;
  id v48 = (CGRect *)&v47;
  uint64_t v49 = 0x4010000000;
  CGRect v50 = "";
  CGSize size = CGRectNull.size;
  CGPoint origin = CGRectNull.origin;
  CGSize v52 = size;
  uint64_t v43 = 0;
  double v44 = &v43;
  uint64_t v45 = 0x2020000000;
  uint64_t v46 = 0;
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x2020000000;
  uint64_t v42 = 0;
  [(CRLInteractiveCanvasController *)self targetPointSize];
  uint64_t v42 = v10;
  uint64_t v35 = 0;
  double v36 = &v35;
  uint64_t v37 = 0x4010000000;
  double v38 = "";
  CGSize v17 = CGRectZero.size;
  CGPoint v18 = CGRectZero.origin;
  CGPoint v39 = CGRectZero.origin;
  CGSize v40 = v17;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  char v34 = 1;
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 0;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10038D428;
  v19[3] = &unk_1014F3618;
  double v22 = &v29;
  id v11 = v8;
  double v23 = v33;
  CGFloat v24 = &v47;
  id v20 = v11;
  double v21 = self;
  BOOL v28 = a5;
  CGFloat v25 = &v35;
  CGFloat v26 = &v43;
  double v27 = v41;
  [(CRLInteractiveCanvasController *)self forLayoutNearestVisibleRectForInfosForSelectionPath:v11 performBlock:v19];
  BOOL IsNull = CGRectIsNull(v48[1]);
  BOOL v13 = v48;
  if (IsNull)
  {
    v48[1].CGPoint origin = v18;
    v13[1].CGSize size = v17;
  }
  CGSize v14 = v13[1].size;
  retstr->var0.CGPoint origin = v13[1].origin;
  retstr->var0.CGSize size = v14;
  CGSize v15 = (CGSize)*((_OWORD *)v36 + 3);
  retstr->var2.CGPoint origin = (CGPoint)*((_OWORD *)v36 + 2);
  *(void *)&retstr->var3 = 0;
  retstr->var3 = *((unsigned char *)v30 + 24);
  retstr->var2.CGSize size = v15;
  *(void *)&retstr->var1 = v44[3];

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(v33, 8);
  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(v41, 8);
  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v47, 8);

  return result;
}

- (void)withLayoutForSelectionPath:(id)a3 performBlock:(id)a4
{
}

- (void)withLayoutForSelectionPath:(id)a3 flags:(unint64_t)a4 performBlock:(id)a5
{
  id v7 = a3;
  id v8 = (void (**)(id, void *))a5;
  [(CRLInteractiveCanvasController *)self layoutIfNeeded];
  uint64_t v9 = [(CRLInteractiveCanvasController *)self layoutsForSelectionPath:v7];
  if ((unint64_t)[v9 count] < 2)
  {
    double v22 = [v9 anyObject];
  }
  else
  {
    uint64_t v10 = [(CRLInteractiveCanvasController *)self canvas];
    [(CRLInteractiveCanvasController *)self visibleBoundsRect];
    [v10 convertBoundsToUnscaledRect:];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;

    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v19 = v9;
    id v20 = [v19 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v20)
    {
      id v21 = v20;
      double v22 = 0;
      uint64_t v23 = *(void *)v35;
      double v24 = INFINITY;
      do
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v35 != v23) {
            objc_enumerationMutation(v19);
          }
          CGFloat v26 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          [v26 rectInRootForSelectionPath:v7];
          double v31 = sub_1000655FC(v27, v28, v29, v30, v12, v14, v16, v18);
          if (v31 < v24)
          {
            double v32 = v31;
            id v33 = v26;

            double v24 = v32;
            double v22 = v33;
          }
        }
        id v21 = [v19 countByEnumeratingWithState:&v34 objects:v38 count:16];
      }
      while (v21);
    }
    else
    {
      double v22 = 0;
    }
  }
  v8[2](v8, v22);
}

- (void)forLayoutNearestVisibleRectForInfosForSelectionPath:(id)a3 performBlock:(id)a4
{
  double v6 = (void (**)(id, void *))a4;
  id v7 = [(CRLInteractiveCanvasController *)self infosForSelectionPath:a3];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      double v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        double v12 = [(CRLInteractiveCanvasController *)self layoutForInfoNearestVisibleRect:*(void *)(*((void *)&v13 + 1) + 8 * (void)v11)];
        if (v12) {
          v6[2](v6, v12);
        }

        double v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (CGRect)p_scaledRectToScrollToForSelectionPath:(id)a3 shouldCenterVertically:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(CRLInteractiveCanvasController *)self layoutIfNeeded];
  [(CRLInteractiveCanvasController *)self p_scrollingInformationForSelectionPath:v6 allowZoom:0];

  -[CRLInteractiveCanvasController outsetSelectionRect:](self, "outsetSelectionRect:", (unsigned __int128)0, (unsigned __int128)0);
  -[CRLInteractiveCanvasController p_contentOffsetToScrollRectToVisible:shouldCenterVertically:forceCenteringVertically:forceCenteringHorizontally:](self, "p_contentOffsetToScrollRectToVisible:shouldCenterVertically:forceCenteringVertically:forceCenteringHorizontally:", v4, 0, 0);
  [(CRLInteractiveCanvasController *)self unobscuredScrollViewFrame];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  long long v15 = [(CRLInteractiveCanvasController *)self layerHost];
  long long v16 = [v15 canvasView];

  double v17 = [v16 enclosingScrollView];
  double v18 = [v17 contentView];
  id v19 = [v17 superview];
  [v18 convertRect:v19 fromView:v8];

  SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)(v20, v21);
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;

  double v30 = v23;
  double v31 = v25;
  double v32 = v27;
  double v33 = v29;
  result.size.double height = v33;
  result.size.double width = v32;
  result.origin.double y = v31;
  result.origin.double x = v30;
  return result;
}

- (void)scrollToCurrentSelectionPathAfterLayout
{
}

- (void)scrollToCurrentSelectionPathAfterLayoutWithOptions:(unint64_t)a3
{
  if (!self->mIsFetchingEditorController)
  {
    [(CRLCanvas *)self->mCanvas i_setLayersInvalidWithoutInvalidatingAnySpecificLayers];
    id v6 = [(CRLInteractiveCanvasController *)self editorController];
    double v5 = [v6 selectionPath];
    [(CRLInteractiveCanvasController *)self scrollToSelectionPath:v5 scrollOptions:a3];
  }
}

- (void)scrollToSelectionPath:(id)a3 scrollOptions:(unint64_t)a4
{
  __int16 v6 = ~(_WORD)a4;
  id v7 = a3;
  if ((v6 & 0x180) == 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F3638);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A7D44();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F3658);
    }
    double v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v8);
    }
    double v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController scrollToSelectionPath:scrollOptions:]");
    double v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v9 file:v10 lineNumber:1958 isFatal:0 description:"Scroll options CRLCanvasScrollOptionWaitForViewLayoutIfNeeded and CRLCanvasScrollOptionScrollForcingLayoutIfNeeded are mutually exclusive"];
  }
  double v11 = [(CRLInteractiveCanvasController *)self layerHost];
  double v12 = [v11 canvasLayer];
  unsigned __int8 v13 = [v12 isLayoutDisabled];

  if ((v13 & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
    char v15 = objc_opt_respondsToSelector();

    if (v15)
    {
      id v16 = objc_loadWeakRetained((id *)&self->mDelegate);
      [v16 willScrollToSelectionPath:v7 onInteractiveCanvasController:self];
    }
    if (v7)
    {
      mSelectionPathToScrollTo = self->mSelectionPathToScrollTo;
      double v18 = (CRLSelectionPath *)[v7 copy];
      id v19 = self->mSelectionPathToScrollTo;
      self->mSelectionPathToScrollTo = v18;

      self->mOptionsForScrollingToSelection = a4;
      self->mSelectionShouldBeClearedInDidProcessAllChanges = 0;
      if (!mSelectionPathToScrollTo)
      {
        CKRecordID v20 = [(CRLInteractiveCanvasController *)self canvas];
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_10038DE08;
        v21[3] = &unk_1014CBBB0;
        v21[4] = self;
        [v20 performBlockAfterLayoutIfNecessary:v21];
      }
    }
    if ((a4 & 0x80) != 0) {
      [(CRLInteractiveCanvasController *)self layoutIfNeeded];
    }
  }
}

- (void)p_clearSelectionScrollingState
{
  mSelectionPathToScrollTo = self->mSelectionPathToScrollTo;
  self->mSelectionPathToScrollTo = 0;

  self->mOptionsForScrollingToSelection = 0;
}

- (void)setOptionsForScrollingToSelectionAfterLayout:(unint64_t)a3
{
  self->mOptionsForScrollingToSelection |= a3;
}

- (void)clearOptionsForScrollingToSelectionAfterLayout:(unint64_t)a3
{
  self->mOptionsForScrollingToSelection &= ~a3;
}

- (double)p_safeAreaMargin
{
  v2 = [(CRLInteractiveCanvasController *)self canvasView];
  double v3 = [v2 enclosingScrollView];

  [v3 safeAreaInsets];
  double v5 = v4;
  [v3 safeAreaInsets];
  if (v5 < v6) {
    double v5 = v6;
  }

  return v5;
}

- (CGPoint)p_computeClampedUnscaledContentOffsetWithTargetRect:(CGRect)a3 selectionContextRectWhenZooming:(CGRect)a4 viewScale:(double)a5 unscaledOutset:(double)dy
{
  CGFloat width = a4.size.width;
  CGFloat height = a4.size.height;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGFloat v7 = a3.size.height;
  CGFloat v8 = a3.size.width;
  CGFloat v9 = a3.origin.y;
  CGFloat v10 = a3.origin.x;
  [(CRLInteractiveCanvasController *)self p_safeAreaMargin];
  CGFloat v13 = -v12 / a5;
  v97.origin.CGFloat x = v10;
  v97.origin.CGFloat y = v9;
  v97.size.CGFloat width = v8;
  v97.size.CGFloat height = v7;
  double v90 = v13;
  CGRect v98 = CGRectInset(v97, v13, 0.0);
  CGFloat v14 = v98.origin.x;
  CGFloat v15 = v98.origin.y;
  CGFloat v16 = v98.size.width;
  CGFloat v17 = v98.size.height;
  [(CRLInteractiveCanvasController *)self visibleBoundsRect];
  double v19 = v18 / a5;
  double v21 = v20 / a5;
  v22.super.isa = (Class)[(CRLInteractiveCanvasController *)self shouldCanvasScrollingSizeGrowToFitBoardContent];
  double v95 = v21;
  SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)(v22, v23);
  double v28 = sub_100065E4C(v24, v25, v26, v27, v14, v15, v16, v17);
  CGFloat v30 = v29;
  CGFloat v32 = v31;
  CGFloat v34 = v33;
  v99.origin.CGFloat x = CGRectZero.origin.x;
  v99.origin.CGFloat y = CGRectZero.origin.y;
  v99.size.CGFloat width = CGRectZero.size.width;
  v99.size.CGFloat height = CGRectZero.size.height;
  v104.origin.CGFloat x = x;
  v104.origin.CGFloat y = y;
  v104.size.CGFloat width = width;
  v104.size.CGFloat height = height;
  if (CGRectEqualToRect(v99, v104))
  {
    double v35 = v28;
  }
  else
  {
    v100.origin.CGFloat x = x;
    v100.origin.CGFloat y = y;
    v100.size.CGFloat width = width;
    v100.size.CGFloat height = height;
    CGRect v101 = CGRectInset(v100, v90 + dy, dy);
    double v35 = sub_100065E4C(v28, v30, v32, v34, v101.origin.x, v101.origin.y, v101.size.width, v101.size.height);
    CGFloat v30 = v36;
  }
  double v94 = v30;
  long long v37 = [(CRLInteractiveCanvasController *)self layerHost];
  double v38 = [v37 canvasLayer];

  if ([(CRLInteractiveCanvasController *)self shouldCanvasScrollingSizeGrowToFitBoardContent])
  {
    [v38 bounds];
    double v40 = v39;
    CGFloat v42 = v41;
    CGFloat v44 = v43;
    CGFloat v46 = v45;
    [(CRLInteractiveCanvasController *)self viewScale];
    double v48 = sub_1000652FC(v40, v42, v44, v46, 1.0 / v47);
    double v50 = v49;
    double v52 = v51;
    double v54 = v53;
  }
  else
  {
    CGRect v55 = [(CRLInteractiveCanvasController *)self canvas];
    [v55 unscaledSize];
    double v56 = sub_100064070();
    double v50 = v57;
    double v52 = v58;
    double v54 = v59;

    id v60 = [(CRLInteractiveCanvasController *)self canvas];
    unsigned int v61 = [v60 isAnchoredAtRight];

    double v62 = 0.0;
    if (v61) {
      double v62 = v52;
    }
    double v48 = v56 - v62;
  }
  v63 = [(CRLInteractiveCanvasController *)self canvas];
  [v63 contentInset];
  CGFloat v65 = v48 + v64;
  CGFloat v67 = v50 + v66;
  CGFloat v69 = v52 - (v64 + v68);
  CGFloat v71 = v54 - (v66 + v70);

  v102.origin.CGFloat x = v65;
  v102.origin.CGFloat y = v67;
  v102.size.CGFloat width = v69;
  v102.size.CGFloat height = v71;
  double v72 = CGRectGetMaxX(v102) - v19;
  [v38 bounds];
  double v74 = v73;
  CGFloat v76 = v75;
  CGFloat v78 = v77;
  CGFloat v80 = v79;
  [(CRLInteractiveCanvasController *)self viewScale];
  v103.origin.CGFloat x = sub_1000652FC(v74, v76, v78, v80, 1.0 / v81);
  double v82 = CGRectGetMaxY(v103) - v95;
  double v83 = sub_100407E48(v35, v65, v72);
  -[CRLInteractiveCanvasController clampedUnscaledContentOffset:forViewScale:](self, "clampedUnscaledContentOffset:forViewScale:", v83, sub_100407E48(v94, v67, v82), a5);
  double v85 = v84;
  double v87 = v86;

  double v88 = v85;
  double v89 = v87;
  result.CGFloat y = v89;
  result.CGFloat x = v88;
  return result;
}

- (void)p_scrollToSelectionPath:(id)a3 scrollOptions:(unint64_t)a4
{
  id v6 = a3;
  unint64_t v7 = a4 & 1;
  BOOL v8 = (a4 & 6) != 0;
  if ([(CRLInteractiveCanvasController *)self animatingViewScale])
  {
LABEL_2:
    if ([(CRLInteractiveCanvasController *)self textGesturesInFlight])
    {
      self->mDidSuppressScrollToSelectionDuringTextGestures = 1;
      self->mShouldAnimateScrollAfterTextGestures = v7;
    }
    goto LABEL_31;
  }
  if ([(CRLInteractiveCanvasController *)self textGesturesInFlight])
  {
    if (!v6 || (a4 & 0x10) == 0) {
      goto LABEL_2;
    }
  }
  else if (!v6)
  {
    goto LABEL_2;
  }
  [(CRLInteractiveCanvasController *)self p_scrollingInformationForSelectionPath:v6 allowZoom:(a4 & 6) != 0];
  double v9 = 0.0;
  unint64_t v10 = (a4 >> 1) & 1;
  if ((a4 & 4) != 0)
  {
    [(CRLInteractiveCanvasController *)self viewScale];
    double v9 = v11;
    LODWORD(v10) = 0;
  }
  else
  {
    BOOL v8 = 0;
  }
  if (v8)
  {
    [(CRLInteractiveCanvasController *)self p_safeAreaMargin];
    double v53 = v12;
    CGFloat v13 = [(CRLInteractiveCanvasController *)self layerHost];
    CGFloat v14 = [v13 canvasLayer];

    [(CRLInteractiveCanvasController *)self fitWidthViewScale];
    double v16 = v15;
    [v14 maximumPinchViewScale];
    double v18 = sub_100407E48(v9, v16, v17);
    if (!(v10 | (v18 < v9) & (a4 >> 2))) {
      double v18 = v9;
    }
    double v54 = v18;
    [(CRLInteractiveCanvasController *)self visibleUnscaledRect];
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    CGFloat v24 = v23;
    CGFloat v26 = v25;
    [(CRLInteractiveCanvasController *)self visibleUnscaledRectForAutoscroll];
    v59.origin.CGFloat x = v27;
    v59.origin.double y = v28;
    v59.size.double width = v29;
    v59.size.CGFloat height = v30;
    v56.origin.CGFloat x = v20;
    double width = 0.0;
    v56.origin.double y = v22;
    v56.size.double width = v24;
    double y = 0.0;
    v56.size.CGFloat height = v26;
    CGFloat height = 0.0;
    if (!CGRectEqualToRect(v56, v59))
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F3678);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010A7DCC();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F3698);
      }
      CGFloat v34 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v34);
      }
      double v35 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController p_scrollToSelectionPath:scrollOptions:]");
      double v36 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"];
      +[CRLAssertionHandler handleFailureInFunction:v35 file:v36 lineNumber:2220 isFatal:0 description:"Scrolling automatically in an unsupported configuration!"];
    }
    [(CRLInteractiveCanvasController *)self visibleBoundsRect];
    double v38 = v54;
    double v39 = v37 + -30.0 + v53 * -2.0;
    CGFloat x = 0.0;
    if (0.0 * v54 > v39)
    {
      double v41 = v39 / 0.0;
      [(CRLInteractiveCanvasController *)self fitWidthViewScale];
      double v43 = v42;
      [v14 maximumPinchViewScale];
      double v38 = sub_100407E48(v41, v43, v44);
      CGFloat x = CGRectZero.origin.x;
      double y = CGRectZero.origin.y;
      double width = CGRectZero.size.width;
      CGFloat height = CGRectZero.size.height;
    }
    double v55 = height;
    double v45 = x;
    v57.origin.CGFloat x = 0.0;
    v57.origin.double y = 0.0;
    v57.size.double width = 0.0;
    v57.size.CGFloat height = 0.0;
    CGRect v58 = CGRectInset(v57, -15.0 / v38, -15.0 / v38);
    double v46 = v58.origin.x;
    double v47 = v58.origin.y;
    double v48 = v58.size.width;
    double v49 = v58.size.height;
    [(CRLInteractiveCanvasController *)self viewScale];
    if (v38 == v50 || vabdd_f64(v38, v50) < fabs(v50 * 0.000000999999997))
    {
      -[CRLInteractiveCanvasController scrollRectToVisible:scrollOptions:](self, "scrollRectToVisible:scrollOptions:", a4 & 0xFFFFFFFFFFFFFFF9, v46, v47, v48, v49);
    }
    else
    {
      -[CRLInteractiveCanvasController p_computeClampedUnscaledContentOffsetWithTargetRect:selectionContextRectWhenZooming:viewScale:unscaledOutset:](self, "p_computeClampedUnscaledContentOffsetWithTargetRect:selectionContextRectWhenZooming:viewScale:unscaledOutset:", v46, v47, v48, v49, v45, y, width, v55, *(void *)&v38, -15.0 / v38);
      -[CRLInteractiveCanvasController setViewScale:contentOffset:animated:completionHandler:](self, "setViewScale:contentOffset:animated:completionHandler:", v7, 0, v38, v51, v52);
    }
  }
LABEL_31:
}

- (void)layoutInvalidated
{
}

- (void)canvasInvalidatedForLayout:(id)a3
{
}

- (void)canvasInvalidatedForRep:(id)a3
{
}

- (void)invalidateReps
{
}

- (void)invalidateVisibleBounds
{
}

- (void)invalidateAllLayers
{
}

- (void)invalidateContentLayersForRep:(id)a3
{
}

- (void)invalidateOverlayLayersForRep:(id)a3
{
}

- (void)invalidateLayersForDecorator:(id)a3
{
  [(NSMutableSet *)self->mDecoratorsWithInvalidLayers addObject:a3];
  mCanvas = self->mCanvas;

  [(CRLCanvas *)mCanvas i_setLayersInvalidWithoutInvalidatingAnySpecificLayers];
}

- (BOOL)i_areLayersInvalidForDecorator:(id)a3
{
  if (self->mAllDecoratorLayersAreInvalid) {
    return 1;
  }
  else {
    return [(NSMutableSet *)self->mDecoratorsWithInvalidLayers containsObject:a3];
  }
}

- (void)invalidateCollaboratorHUDControllers
{
  if ([(CRLInteractiveCanvasController *)self p_areAnyCollaboratorsPresent])
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    double v3 = [(NSMapTable *)self->mCollaboratorPresenceToCollaboratorHUDControllerDictionary crl_allObjects];
    id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        unint64_t v7 = 0;
        do
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          [(CRLInteractiveCanvasController *)self invalidateLayersForDecorator:*(void *)(*((void *)&v8 + 1) + 8 * (void)v7)];
          unint64_t v7 = (char *)v7 + 1;
        }
        while (v5 != v7);
        id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }
  }
}

- (void)setShouldSuppressRendering:(BOOL)a3 animated:(BOOL)a4
{
  if (self->mShouldSuppressRendering != a3)
  {
    self->mShouldSuppressRendering = a3;
    if (!a3)
    {
      long long v12 = 0u;
      long long v13 = 0u;
      long long v10 = 0u;
      long long v11 = 0u;
      id v5 = [(CRLCanvas *)self->mCanvas topLevelReps];
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
            [*(id *)(*((void *)&v10 + 1) + 8 * i) recursivelyPerformSelector:"setNeedsDisplay"];
          }
          id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
        }
        while (v7);
      }
    }
    [(CRLInteractiveCanvasController *)self invalidateAllLayers];
  }
}

- (void)setShouldSuppressRendering:(BOOL)a3
{
}

- (void)updateRenderableForRep:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  if (!+[NSThread isMainThread])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F36B8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A7E54();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F36D8);
    }
    uint64_t v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v8);
    }
    long long v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController updateRenderableForRep:usingBlock:]");
    long long v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v9 file:v10 lineNumber:2330 isFatal:0 description:"This operation must only be performed on the main thread."];
  }
  long long v11 = [(CRLInteractiveCanvasController *)self renderableForRep:v6];
  if (v11) {
    v7[2](v7, v11);
  }
}

- (void)didExitPreviewMode
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(CRLCanvas *)self->mCanvas topLevelReps];
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
        [*(id *)(*((void *)&v7 + 1) + 8 * i) recursivelyPerformSelectorIfImplemented:"didExitPreviewMode"];
      }
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)reuseTextInputResponderFrom:(id)a3
{
}

- (void)setupTextInputResponder
{
  id v3 = [(CRLInteractiveCanvasController *)self textInputResponder];

  if (!v3)
  {
    id v4 = [_TtC8Freeform21CRLTextInputResponder alloc];
    uint64_t v5 = [(CRLInteractiveCanvasController *)self layerHost];
    id v6 = [v5 canvasView];
    long long v7 = [(CRLTextInputResponder *)v4 initWithNextResponder:v6 icc:self];
    [(CRLInteractiveCanvasController *)self setTextInputResponder:v7];

    long long v8 = [(CRLInteractiveCanvasController *)self editorController];
    id v11 = [v8 textInputEditor];

    long long v9 = [(CRLInteractiveCanvasController *)self textInputResponder];
    [v9 setEditor:v11 withFlags:0];

    long long v10 = [(CRLInteractiveCanvasController *)self textInputResponder];
    [v10 reloadInputViews];
  }
}

- (void)teardownTextInputResponder
{
  mTextInputResponder = self->mTextInputResponder;
  if (mTextInputResponder)
  {
    self->mTextInputResponder = 0;
  }
}

- (void)resumeEditing
{
  unsigned int v2 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F36F8);
  }
  id v3 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    id v4 = v3;
    uint64_t v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    *(_DWORD *)long long buf = 67110146;
    unsigned int v19 = v2;
    __int16 v20 = 2082;
    double v21 = "-[CRLInteractiveCanvasController resumeEditing]";
    __int16 v22 = 2082;
    double v23 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m";
    __int16 v24 = 1024;
    int v25 = 2603;
    __int16 v26 = 2114;
    CGFloat v27 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F3718);
  }
  long long v7 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    long long v8 = v7;
    long long v9 = +[CRLAssertionHandler packedBacktraceString];
    *(_DWORD *)long long buf = 67109378;
    unsigned int v19 = v2;
    __int16 v20 = 2114;
    double v21 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
  }
  long long v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController resumeEditing]");
  id v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"];
  long long v12 = (objc_class *)objc_opt_class();
  long long v13 = NSStringFromClass(v12);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 2603, 0, "Abstract method not overridden by %{public}@", v13);

  CGFloat v14 = (objc_class *)objc_opt_class();
  double v15 = NSStringFromClass(v14);
  double v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Abstract method not overridden by %@: %s", v15, "-[CRLInteractiveCanvasController resumeEditing]");
  id v17 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v16 userInfo:0];

  objc_exception_throw(v17);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (@"CRLScenesDebugView" == a6)
  {
    [(CRLInteractiveCanvasController *)self p_updateInfosToDisplayIfNeeded];
  }
  else if (off_10166DED8 == a6)
  {
    [(CRLInteractiveCanvasController *)self recreateAllLayoutsAndReps];
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)CRLInteractiveCanvasController;
    [(CRLInteractiveCanvasController *)&v13 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (void)p_editorControllerDidChangeTextInputEditor:(id)a3
{
  id v16 = a3;
  id v4 = [v16 object];
  uint64_t v5 = [v4 textInputEditor];
  id v12 = sub_100246AC8(v5, 1, v6, v7, v8, v9, v10, v11, (uint64_t)&OBJC_PROTOCOL____TtP8Freeform18CRLTextInputEditor_);

  if (v12) {
    [(CRLInteractiveCanvasController *)self setupTextInputResponder];
  }
  objc_super v13 = [v16 userInfo];
  CGFloat v14 = [v13 objectForKey:@"CRLEditorControllerSelectionFlagsKey"];
  id v15 = [v14 unsignedIntegerValue];

  [(CRLInteractiveCanvasController *)self setTextResponderEditorTo:v12 withFlags:v15];
}

- (void)p_editorControllerSelectionPathDidChange:(id)a3
{
  p_mDelegate = &self->mDelegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_mDelegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)p_mDelegate);
    [v8 selectionDidChange];
  }
  uint64_t v9 = [v5 userInfo];
  id v19 = [v9 objectForKeyedSubscript:@"CRLEditorControllerOldSelectionPathKey"];

  uint64_t v10 = [(CRLInteractiveCanvasController *)self editorController];
  uint64_t v11 = [v10 selectionPath];

  [(CRLInteractiveCanvasController *)self p_selectionPathDidChangeFromSelectionPath:v19 toSelectionPath:v11];
  [(CRLInteractiveCanvasController *)self p_notifyRepsForChangeFromSelectionPath:v19 toSelectionPath:v11];
  id v12 = objc_loadWeakRetained((id *)&self->mLayerHost);
  [v12 selectionPathDidChangeFromSelectionPath:v19 toSelectionPath:v11];

  [(CRLInteractiveCanvasController *)self updateMultiselectResizeInfoIfNeeded];
  objc_super v13 = [v5 userInfo];

  CGFloat v14 = [v13 objectForKey:@"CRLEditorControllerSelectionFlagsKey"];
  unint64_t v15 = (unint64_t)[v14 unsignedIntegerValue];

  uint64_t v16 = (v15 >> 1) & 1;
  if (self->mTextGesturesInFlight)
  {
    if ((v15 & 4) != 0)
    {
      self->mDidSuppressScrollToSelectionDuringTextGestures = 1;
      self->mShouldAnimateScrollAfterTextGestures = (v15 & 2) != 0;
    }
  }
  else
  {
    [(CRLInteractiveCanvasController *)self p_selectionDoneChangingWithFlags:v15];
    if ((v15 & 4) != 0)
    {
      id v17 = [(CRLInteractiveCanvasController *)self editorController];
      double v18 = [v17 selectionPath];
      [(CRLInteractiveCanvasController *)self scrollToSelectionPath:v18 scrollOptions:v16];
    }
  }
  [(CRLInteractiveCanvasController *)self updateTipsBasedOnSelection:v11];
}

- (void)updateMultiselectResizeInfoIfNeeded
{
  unsigned __int8 v3 = [(CRLInteractiveCanvasController *)self p_shouldSuppressMultiselectResizeInfo];
  id v4 = [(CRLInteractiveCanvasController *)self selectionModelTranslator];
  id v5 = [(CRLInteractiveCanvasController *)self editorController];
  uint64_t v6 = [v5 selectionPath];
  char v7 = [v4 unlockedBoardItemsForSelectionPath:v6];

  id v8 = [v7 objectsPassingTest:&stru_1014F3738];
  if (!-[CRLInteractiveCanvasController displaysMultiselectionWithSingleBounds](self, "displaysMultiselectionWithSingleBounds")|| (v3 & 1) != 0|| (unint64_t)[v8 count] < 2)
  {
    mMultiselectResizeInfo = self->mMultiselectResizeInfo;
    if (!mMultiselectResizeInfo)
    {
      uint64_t v11 = 0;
      goto LABEL_30;
    }
    uint64_t v11 = [(CRLMultiselectResizeInfo *)mMultiselectResizeInfo parentInfo];
    CGFloat v14 = self->mMultiselectResizeInfo;
    self->mMultiselectResizeInfo = 0;

    goto LABEL_8;
  }
  uint64_t v9 = [(CRLInteractiveCanvasController *)self topLevelContainerInfoForEditing];
  uint64_t v10 = [(CRLMultiselectResizeInfo *)self->mMultiselectResizeInfo parentInfo];

  if (v10 == v9)
  {
    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v11 = [(CRLMultiselectResizeInfo *)self->mMultiselectResizeInfo parentInfo];
    id v12 = self->mMultiselectResizeInfo;
    self->mMultiselectResizeInfo = 0;
  }
  double v35 = self->mMultiselectResizeInfo;
  double v36 = v35;
  if (!v35)
  {
    double v37 = [[_TtC8Freeform24CRLMultiselectResizeInfo alloc] initWithParentInfo:v9];
    double v38 = self->mMultiselectResizeInfo;
    self->mMultiselectResizeInfo = v37;

    double v36 = self->mMultiselectResizeInfo;
  }
  double v39 = [(CRLInteractiveCanvasController *)self canvas];
  double v40 = [v39 layoutController];
  [(CRLMultiselectResizeInfo *)v36 setRepresentedSelectedBoardItems:v8 currentlyLaidOutWith:v40];

  double v41 = (objc_class *)objc_opt_class();
  double v42 = [(CRLInteractiveCanvasController *)self repForInfo:self->mMultiselectResizeInfo];
  double v43 = sub_10024715C(v41, v42);

  [v43 selectionDidChange];
  if (!v35)
  {
LABEL_8:
    double v45 = v8;
    double v46 = v7;
    unint64_t v15 = [(CRLInteractiveCanvasController *)self topLevelContainerRepForEditing];
    uint64_t v16 = [v15 layout];
    [v16 invalidateChildren];

    id v17 = (objc_class *)objc_opt_class();
    uint64_t v23 = sub_100246E2C(v11, v17, 1, v18, v19, v20, v21, v22, (uint64_t)&OBJC_PROTOCOL___CRLCanvasElementInfo);
    if (v23)
    {
      __int16 v24 = [(CRLInteractiveCanvasController *)self layoutsForInfo:v23];
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      id v25 = [v24 countByEnumeratingWithState:&v51 objects:v56 count:16];
      if (v25)
      {
        id v26 = v25;
        uint64_t v27 = *(void *)v52;
        do
        {
          for (i = 0; i != v26; i = (char *)i + 1)
          {
            if (*(void *)v52 != v27) {
              objc_enumerationMutation(v24);
            }
            [*(id *)(*((void *)&v51 + 1) + 8 * i) invalidateChildren];
          }
          id v26 = [v24 countByEnumeratingWithState:&v51 objects:v56 count:16];
        }
        while (v26);
      }
    }
    double v44 = (void *)v23;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    CGFloat v29 = [(CRLCanvas *)self->mCanvas topLevelReps];
    id v30 = [v29 countByEnumeratingWithState:&v47 objects:v55 count:16];
    if (v30)
    {
      id v31 = v30;
      uint64_t v32 = *(void *)v48;
      do
      {
        for (j = 0; j != v31; j = (char *)j + 1)
        {
          if (*(void *)v48 != v32) {
            objc_enumerationMutation(v29);
          }
          CGFloat v34 = *(void **)(*((void *)&v47 + 1) + 8 * (void)j);
          [v34 recursivelyPerformSelectorIfImplemented:"i_invalidateSelectionHighlightRenderable"];
          [v34 recursivelyPerformSelectorIfImplemented:"invalidateKnobs"];
        }
        id v31 = [v29 countByEnumeratingWithState:&v47 objects:v55 count:16];
      }
      while (v31);
    }

    [(CRLInteractiveCanvasController *)self p_updateInfosToDisplayIfNeeded];
    id v8 = v45;
    char v7 = v46;
  }
LABEL_30:
}

- (BOOL)p_shouldSuppressMultiselectResizeInfo
{
  p_mDelegate = &self->mDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  if (objc_opt_respondsToSelector())
  {
    id v5 = objc_loadWeakRetained((id *)p_mDelegate);
    unsigned __int8 v6 = [v5 wantsToSuppressMultiselectionWithSingleBoundsForInteractiveCanvasController:self];

    if (v6) {
      return 1;
    }
  }
  else
  {
  }

  return [(CRLInteractiveCanvasController *)self wantsToSuppressMultiselectionForPenTool];
}

- (void)p_notifyRepsForChangeFromSelectionPath:(id)a3 toSelectionPath:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if (v11)
  {
    char v7 = [(CRLInteractiveCanvasController *)self selectionModelTranslator];
    id v8 = [v7 boardItemsForSelectionPath:v11];

    if (v6)
    {
LABEL_3:
      uint64_t v9 = [(CRLInteractiveCanvasController *)self selectionModelTranslator];
      uint64_t v10 = [v9 boardItemsForSelectionPath:v6];

      goto LABEL_6;
    }
  }
  else
  {
    id v8 = 0;
    if (v6) {
      goto LABEL_3;
    }
  }
  uint64_t v10 = 0;
LABEL_6:
  [(CRLInteractiveCanvasController *)self p_notifyRepsForSelectionChangeFrom:v8 to:v10];
}

- (void)p_notifyRepsForSelectionChangeFrom:(id)a3 to:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6 && [v6 count])
  {
    id v34 = v6;
    id v8 = [v6 mutableCopy];
    uint64_t v9 = v8;
    if (v7) {
      [v8 minusSet:v7];
    }
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v10 = v9;
    id v11 = [v10 countByEnumeratingWithState:&v48 objects:v55 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v49;
      do
      {
        CGFloat v14 = 0;
        do
        {
          if (*(void *)v49 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v48 + 1) + 8 * (void)v14);
          long long v44 = 0u;
          long long v45 = 0u;
          long long v46 = 0u;
          long long v47 = 0u;
          uint64_t v16 = [(CRLInteractiveCanvasController *)self repsForInfo:v15];
          id v17 = [v16 countByEnumeratingWithState:&v44 objects:v54 count:16];
          if (v17)
          {
            id v18 = v17;
            uint64_t v19 = *(void *)v45;
            do
            {
              uint64_t v20 = 0;
              do
              {
                if (*(void *)v45 != v19) {
                  objc_enumerationMutation(v16);
                }
                [*(id *)(*((void *)&v44 + 1) + 8 * (void)v20) becameNotSelected];
                uint64_t v20 = (char *)v20 + 1;
              }
              while (v18 != v20);
              id v18 = [v16 countByEnumeratingWithState:&v44 objects:v54 count:16];
            }
            while (v18);
          }

          CGFloat v14 = (char *)v14 + 1;
        }
        while (v14 != v12);
        id v12 = [v10 countByEnumeratingWithState:&v48 objects:v55 count:16];
      }
      while (v12);
    }

    id v6 = v34;
  }
  if (v7 && [v7 count])
  {
    id v21 = [v7 mutableCopy];
    uint64_t v22 = v21;
    if (v6) {
      [v21 minusSet:v6];
    }
    id v35 = v6;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v23 = v22;
    id v24 = [v23 countByEnumeratingWithState:&v40 objects:v53 count:16];
    if (v24)
    {
      id v25 = v24;
      uint64_t v26 = *(void *)v41;
      do
      {
        uint64_t v27 = 0;
        do
        {
          if (*(void *)v41 != v26) {
            objc_enumerationMutation(v23);
          }
          uint64_t v28 = *(void *)(*((void *)&v40 + 1) + 8 * (void)v27);
          long long v36 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          CGFloat v29 = [(CRLInteractiveCanvasController *)self repsForInfo:v28];
          id v30 = [v29 countByEnumeratingWithState:&v36 objects:v52 count:16];
          if (v30)
          {
            id v31 = v30;
            uint64_t v32 = *(void *)v37;
            do
            {
              double v33 = 0;
              do
              {
                if (*(void *)v37 != v32) {
                  objc_enumerationMutation(v29);
                }
                [*(id *)(*((void *)&v36 + 1) + 8 * (void)v33) becameSelected];
                double v33 = (char *)v33 + 1;
              }
              while (v31 != v33);
              id v31 = [v29 countByEnumeratingWithState:&v36 objects:v52 count:16];
            }
            while (v31);
          }

          uint64_t v27 = (char *)v27 + 1;
        }
        while (v27 != v25);
        id v25 = [v23 countByEnumeratingWithState:&v40 objects:v53 count:16];
      }
      while (v25);
    }

    id v6 = v35;
  }
}

- (void)p_editorControllerSelectionDidChangeAndWantsKeyboard:(id)a3
{
  id v4 = [a3 userInfo];
  id v7 = [v4 objectForKeyedSubscript:@"CRLEditorControllerOldSelectionPathKey"];

  id v5 = [(CRLInteractiveCanvasController *)self editorController];
  id v6 = [v5 selectionPath];

  [(CRLInteractiveCanvasController *)self p_selectionPathDidChangeFromSelectionPath:v7 toSelectionPath:v6];
  [(CRLInteractiveCanvasController *)self p_selectionDoneChangingWithFlags:0];
}

- (CRLCanvasView)canvasView
{
  unsigned int v2 = [(CRLInteractiveCanvasController *)self layerHost];
  unsigned __int8 v3 = [v2 canvasView];

  return (CRLCanvasView *)v3;
}

- (CRLCanvasLayer)canvasLayer
{
  unsigned int v2 = [(CRLInteractiveCanvasController *)self layerHost];
  unsigned __int8 v3 = [v2 canvasLayer];

  return (CRLCanvasLayer *)v3;
}

- (CGColor)canvasEdgeBackgroundColor
{
  if (self->mDynamicallyZooming) {
    +[UIColor clearColor];
  }
  else {
  id v2 = +[UIColor secondarySystemBackgroundColor];
  }
  unsigned __int8 v3 = (CGColor *)[v2 CGColor];

  return v3;
}

+ (id)keyPathsForValuesAffectingViewScale
{
  return +[NSSet setWithObject:@"layerHost.canvasLayer.viewScale"];
}

- (double)viewScale
{
  id v2 = [(CRLInteractiveCanvasController *)self layerHost];
  unsigned __int8 v3 = [v2 canvasLayer];
  [v3 viewScale];
  double v5 = v4;

  return v5;
}

- (void)setViewScale:(double)a3
{
  id v5 = [(CRLInteractiveCanvasController *)self layerHost];
  double v4 = [v5 canvasLayer];
  [v4 setViewScale:a3];
}

+ (id)keyPathsForValuesAffectingCurrentViewScale
{
  return +[NSSet setWithObject:@"layerHost.canvasLayer.viewScale"];
}

- (double)currentViewScale
{
  if (self->mDynamicallyZooming) {
    return self->mDynamicViewScale;
  }
  unsigned __int8 v3 = [(CRLInteractiveCanvasController *)self layerHost];
  double v4 = [v3 canvasLayer];
  [v4 viewScale];
  double v6 = v5;

  return v6;
}

- (double)fitWidthViewScale
{
  unsigned __int8 v3 = [(CRLInteractiveCanvasController *)self layerHost];
  double v4 = [v3 canvasLayer];

  [(CRLInteractiveCanvasController *)self visibleBoundsRect];
  double v6 = v5;
  [(CRLCanvas *)self->mCanvas unscaledSize];
  double v8 = v6 / v7;
  [v4 minimumPinchViewScale];
  double v10 = v9;
  [v4 maximumPinchViewScale];
  double v12 = sub_100407E48(v8, v10, v11);

  return v12;
}

- (BOOL)shouldPreventSyncingViewScale
{
  return self->mCurrentlyScrolling;
}

- (BOOL)shouldPreventSyncingContentOffset
{
  return self->mDynamicallyZooming;
}

- (CGSize)canvasScrollingOutset
{
  double v2 = 600.0;
  double v3 = 600.0;
  result.CGFloat height = v3;
  result.double width = v2;
  return result;
}

- (BOOL)shouldResizeCanvasToScrollView
{
  p_mDelegate = &self->mDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  if (WeakRetained)
  {
    id v4 = objc_loadWeakRetained((id *)p_mDelegate);
    if (objc_opt_respondsToSelector())
    {
      id v5 = objc_loadWeakRetained((id *)p_mDelegate);
      unsigned __int8 v6 = [v5 shouldResizeCanvasToScrollView];
    }
    else
    {
      unsigned __int8 v6 = 0;
    }
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (void)setViewScale:(double)a3 contentOffset:(CGPoint)a4 animated:(BOOL)a5 source:(id)a6
{
  BOOL v6 = a5;
  double y = a4.y;
  double x = a4.x;
  double v11 = (NSString *)[a6 copy];
  mCurrentInteractionSource = self->mCurrentInteractionSource;
  self->mCurrentInteractionSource = v11;

  -[CRLInteractiveCanvasController setViewScale:contentOffset:animated:completionHandler:](self, "setViewScale:contentOffset:animated:completionHandler:", v6, 0, a3, x, y);
  uint64_t v13 = self->mCurrentInteractionSource;
  self->mCurrentInteractionSource = 0;
}

- (void)setViewScale:(double)a3 contentOffset:(CGPoint)a4 animated:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v6 = a5;
  double y = a4.y;
  double x = a4.x;
  id v28 = a6;
  double v11 = 0.0;
  if (v6)
  {
    [(id)objc_opt_class() defaultAutoZoomAnimationDuration];
    double v11 = v12;
    id WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
    char v14 = objc_opt_respondsToSelector();

    if (v14)
    {
      id v15 = objc_loadWeakRetained((id *)&self->mDelegate);
      [v15 viewScaleZoomAnimationDurationForInteractiveCanvasController:self];
      double v11 = v16;
    }
  }
  -[CRLInteractiveCanvasController clampedUnscaledContentOffset:forViewScale:](self, "clampedUnscaledContentOffset:forViewScale:", x, y, a3);
  double v18 = v17;
  double v20 = v19;
  id v21 = [(CRLInteractiveCanvasController *)self canvasView];
  uint64_t v22 = [v21 window];
  [v22 bounds];
  double v24 = v23;
  double v26 = v25;

  if (v24 <= v26) {
    uint64_t v27 = 1;
  }
  else {
    uint64_t v27 = 4;
  }
  -[CRLInteractiveCanvasController animateToViewScale:contentOffset:duration:orientation:completionHandler:](self, "animateToViewScale:contentOffset:duration:orientation:completionHandler:", v27, v28, a3, v18, v20, v11);
}

- (CGPoint)clampedUnscaledContentOffset:(CGPoint)a3 forViewScale:(double)a4
{
  BOOL v6 = [(CRLInteractiveCanvasController *)self layerHost];
  double v7 = [v6 canvasLayer];

  [(CRLInteractiveCanvasController *)self unobscuredScrollViewFrame];
  double v8 = 1.0 / a4;
  double v11 = sub_1000646A4(v9, v10, v8);
  double v66 = v12;
  [v7 contentInset];
  double v14 = v13;
  double v16 = v15;
  double v18 = v8 * v17;
  double v20 = v8 * v19;
  if ([(CRLInteractiveCanvasController *)self shouldCanvasScrollingSizeGrowToFitBoardContent])
  {
    [v7 bounds];
    double v22 = v21;
    CGFloat v24 = v23;
    CGFloat v26 = v25;
    CGFloat v28 = v27;
    [(CRLInteractiveCanvasController *)self viewScale];
    double v30 = sub_1000652FC(v22, v24, v26, v28, 1.0 / v29);
    double v32 = v31;
    double v34 = v33;
    double v36 = v35;
  }
  else
  {
    double v65 = v8 * v16;
    double v37 = v11;
    double v38 = v8 * v14;
    [v7 unscaledSize];
    double v39 = sub_100064070();
    double v41 = v40;
    double v43 = v42;
    double v45 = v44;
    long long v46 = [(CRLInteractiveCanvasController *)self canvas];
    unsigned int v47 = [v46 isAnchoredAtRight];

    double v48 = 0.0;
    if (v47) {
      double v48 = v43;
    }
    double v49 = v39 - v48;
    [(CRLInteractiveCanvasController *)self viewScale];
    double v51 = 1.0 / v50;
    double v52 = v38 * v51;
    double v11 = v37;
    double v30 = v49 + v20 * v51;
    double v32 = v41 + v18 * v51;
    double v34 = v43 - (v20 * v51 + v65 * v51);
    double v36 = v45 - (v18 * v51 + v52);
  }
  v69.origin.double x = v30;
  v69.origin.double y = v32;
  v69.size.double width = v34;
  v69.size.CGFloat height = v36;
  double MaxY = CGRectGetMaxY(v69);
  long long v54 = [(CRLInteractiveCanvasController *)self canvas];
  unsigned int v55 = [v54 isAnchoredAtRight];

  if (v55)
  {
    double v56 = -(v11 + v20);
    if (v30 > v56) {
      double v30 = -(v11 + v20);
    }
  }
  else
  {
    v70.origin.double x = v30;
    v70.origin.double y = v32;
    v70.size.double width = v34;
    v70.size.CGFloat height = v36;
    double v57 = CGRectGetMaxX(v70) - v11;
    unsigned __int8 v58 = [(CRLInteractiveCanvasController *)self shouldCanvasScrollingSizeGrowToFitBoardContent];
    if (v57 >= v20) {
      double v59 = v57;
    }
    else {
      double v59 = v20;
    }
    if (v58) {
      double v56 = v57;
    }
    else {
      double v56 = v59;
    }
  }
  if (MaxY - v66 >= v18) {
    double v60 = MaxY - v66;
  }
  else {
    double v60 = v18;
  }
  double v61 = sub_100407E48(a3.x, v30, v56);
  double v62 = sub_100407E48(a3.y, v32, v60);

  double v63 = v61;
  double v64 = v62;
  result.double y = v64;
  result.double x = v63;
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
  id v14 = [(CRLInteractiveCanvasController *)self layerHost];
  double v13 = [v14 canvasLayer];
  [v13 setViewScale:v7 andScrollViewFrame:v6 maintainPosition:a3 animated:x y width height];
}

- (void)setViewScale:(double)a3 andScrollViewFrame:(CGRect)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v12 = [(CRLInteractiveCanvasController *)self delegate];
  char v13 = objc_opt_respondsToSelector();

  if (v13)
  {
    id v14 = [(CRLInteractiveCanvasController *)self delegate];
    uint64_t v15 = (uint64_t)[v14 interactiveCanvasControllerShouldMaintainPositionOnSetViewScale:self];
  }
  else
  {
    uint64_t v15 = 1;
  }
  id v17 = [(CRLInteractiveCanvasController *)self layerHost];
  double v16 = [v17 canvasLayer];
  [v16 setViewScale:v15 andScrollViewFrame:v5 maintainPosition:a3 x:x y:y width:width height:height];
}

- (CGRect)unobscuredFrameOfView:(id)a3
{
  [(CRLInteractiveCanvasController *)self p_unosbcuredFrameOfView:a3 includingObscuringRectangles:1];
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (CGRect)p_unosbcuredFrameOfView:(id)a3 includingObscuringRectangles:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (!v6)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F3758);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A7EDC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F3778);
    }
    BOOL v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v7);
    }
    double v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController p_unosbcuredFrameOfView:includingObscuringRectangles:]");
    double v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v8 file:v9 lineNumber:2970 isFatal:0 description:"Cannot calculate unobscured frame without view"];
  }
  [v6 frame];
  double v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  double v18 = [(CRLInteractiveCanvasController *)self delegate];
  char v19 = objc_opt_respondsToSelector();

  if (v19)
  {
    double v20 = [(CRLInteractiveCanvasController *)self delegate];
    [v20 safeAreaLayoutFrameForInteractiveCanvasController:self];
    double v11 = v21;
    CGFloat v13 = v22;
    CGFloat v15 = v23;
    CGFloat v17 = v24;
  }
  if (v4)
  {
    double v25 = [(CRLInteractiveCanvasController *)self delegate];
    char v26 = objc_opt_respondsToSelector();

    if (v26)
    {
      double v27 = [(CRLInteractiveCanvasController *)self delegate];
      CGFloat v28 = [v27 rectanglesObscuringView:v6];
    }
    else
    {
      CGFloat v28 = 0;
    }
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v29 = v28;
    id v30 = [v29 countByEnumeratingWithState:&v45 objects:v49 count:16];
    if (v30)
    {
      id v31 = v30;
      uint64_t v32 = *(void *)v46;
      do
      {
        for (i = 0; i != v31; i = (char *)i + 1)
        {
          if (*(void *)v46 != v32) {
            objc_enumerationMutation(v29);
          }
          [*(id *)(*((void *)&v45 + 1) + 8 * i) CGRectValue:v45];
          double v11 = sub_100066C44(v11, v13, v15, v17, v34, v35, v36, v37);
          CGFloat v13 = v38;
          CGFloat v15 = v39;
          CGFloat v17 = v40;
        }
        id v31 = [v29 countByEnumeratingWithState:&v45 objects:v49 count:16];
      }
      while (v31);
    }
  }
  double v41 = v11;
  double v42 = v13;
  double v43 = v15;
  double v44 = v17;
  result.size.double height = v44;
  result.size.double width = v43;
  result.origin.double y = v42;
  result.origin.double x = v41;
  return result;
}

- (void)p_updateUnobscuredFrame
{
  double v3 = [(CRLInteractiveCanvasController *)self canvasView];
  BOOL v4 = [v3 enclosingScrollView];

  double v5 = [v4 superview];

  if (v5)
  {
    [(CRLInteractiveCanvasController *)self unobscuredFrameOfView:v4];
    double x = v29.origin.x;
    double y = v29.origin.y;
    double width = v29.size.width;
    double height = v29.size.height;
    if (CGRectGetHeight(v29) == 0.0
      || (v30.origin.double x = x,
          v30.origin.double y = y,
          v30.size.double width = width,
          v30.size.double height = height,
          CGRectGetWidth(v30) == 0.0))
    {
      double x = CGRectZero.origin.x;
      double y = CGRectZero.origin.y;
      double width = CGRectZero.size.width;
      double height = CGRectZero.size.height;
    }
    [(CRLInteractiveCanvasController *)self unobscuredScrollViewFrame];
    v32.origin.double x = v10;
    v32.origin.double y = v11;
    v32.size.double width = v12;
    v32.size.double height = v13;
    v31.origin.double x = x;
    v31.origin.double y = y;
    v31.size.double width = width;
    v31.size.double height = height;
    if (!CGRectEqualToRect(v31, v32)) {
      [(CRLInteractiveCanvasController *)self invalidateReps];
    }
    -[CRLInteractiveCanvasController setUnobscuredScrollViewFrame:](self, "setUnobscuredScrollViewFrame:", x, y, width, height);
    [(CRLInteractiveCanvasController *)self p_unosbcuredFrameOfView:v4 includingObscuringRectangles:0];
    self->mUnobscuredScrollViewFrameIgnoringObscuringRectangles.origin.double x = v14;
    self->mUnobscuredScrollViewFrameIgnoringObscuringRectangles.origin.double y = v15;
    self->mUnobscuredScrollViewFrameIgnoringObscuringRectangles.size.double width = v16;
    self->mUnobscuredScrollViewFrameIgnoringObscuringRectangles.size.double height = v17;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    double v18 = [(CRLInteractiveCanvasController *)self i_decorators];
    id v19 = [v18 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v25;
      do
      {
        double v22 = 0;
        do
        {
          if (*(void *)v25 != v21) {
            objc_enumerationMutation(v18);
          }
          double v23 = *(void **)(*((void *)&v24 + 1) + 8 * (void)v22);
          if (objc_opt_respondsToSelector()) {
            [v23 unobscuredFrameDidChange];
          }
          double v22 = (char *)v22 + 1;
        }
        while (v20 != v22);
        id v20 = [v18 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v20);
    }
  }
}

- (void)unobscuredFrameDidChange
{
  double v3 = [(CRLInteractiveCanvasController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    goto LABEL_3;
  }
  [(CRLInteractiveCanvasController *)self unobscuredScrollViewFrame];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v13 = [(CRLInteractiveCanvasController *)self delegate];
  [v13 interactiveCanvasControllerWillChangeUnobscuredFrame:self];

  [(CRLInteractiveCanvasController *)self unobscuredScrollViewFrame];
  v16.origin.double x = v6;
  v16.origin.double y = v8;
  v16.size.double width = v10;
  v16.size.double height = v12;
  if (CGRectEqualToRect(v15, v16))
  {
LABEL_3:
    [(CRLInteractiveCanvasController *)self p_updateUnobscuredFrame];
  }
}

- (CGRect)unobscuredScrollViewFrame
{
  v18.origin.CGFloat x = CGRectZero.origin.x;
  v18.origin.CGFloat y = CGRectZero.origin.y;
  v18.size.CGFloat width = CGRectZero.size.width;
  v18.size.CGFloat height = CGRectZero.size.height;
  if (CGRectEqualToRect(self->mUnobscuredScrollViewFrame, v18))
  {
    double v3 = [(CRLInteractiveCanvasController *)self canvasView];
    char v4 = [v3 enclosingScrollView];
    [v4 frame];
    CGFloat x = v5;
    CGFloat y = v7;
    CGFloat width = v9;
    CGFloat height = v11;
  }
  else
  {
    CGFloat x = self->mUnobscuredScrollViewFrame.origin.x;
    CGFloat y = self->mUnobscuredScrollViewFrame.origin.y;
    CGFloat width = self->mUnobscuredScrollViewFrame.size.width;
    CGFloat height = self->mUnobscuredScrollViewFrame.size.height;
  }
  double v13 = x;
  double v14 = y;
  double v15 = width;
  double v16 = height;
  result.size.CGFloat height = v16;
  result.size.CGFloat width = v15;
  result.origin.CGFloat y = v14;
  result.origin.CGFloat x = v13;
  return result;
}

- (CGRect)p_unobscuredScrollViewFrameIgnoringObscuringRectangles
{
  v18.origin.CGFloat x = CGRectZero.origin.x;
  v18.origin.CGFloat y = CGRectZero.origin.y;
  v18.size.CGFloat width = CGRectZero.size.width;
  v18.size.CGFloat height = CGRectZero.size.height;
  if (CGRectEqualToRect(self->mUnobscuredScrollViewFrameIgnoringObscuringRectangles, v18))
  {
    double v3 = [(CRLInteractiveCanvasController *)self canvasView];
    char v4 = [v3 enclosingScrollView];
    [v4 frame];
    CGFloat x = v5;
    CGFloat y = v7;
    CGFloat width = v9;
    CGFloat height = v11;
  }
  else
  {
    CGFloat x = self->mUnobscuredScrollViewFrameIgnoringObscuringRectangles.origin.x;
    CGFloat y = self->mUnobscuredScrollViewFrameIgnoringObscuringRectangles.origin.y;
    CGFloat width = self->mUnobscuredScrollViewFrameIgnoringObscuringRectangles.size.width;
    CGFloat height = self->mUnobscuredScrollViewFrameIgnoringObscuringRectangles.size.height;
  }
  double v13 = x;
  double v14 = y;
  double v15 = width;
  double v16 = height;
  result.size.CGFloat height = v16;
  result.size.CGFloat width = v15;
  result.origin.CGFloat y = v14;
  result.origin.CGFloat x = v13;
  return result;
}

- (CGPoint)p_contentOffsetToScrollRectToVisible:(CGRect)a3 shouldCenterVertically:(BOOL)a4 forceCenteringVertically:(BOOL)a5 forceCenteringHorizontally:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v14 = [(CRLInteractiveCanvasController *)self layerHost];
  double v15 = [v14 canvasLayer];

  [v15 contentInset];
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  if ([(CRLInteractiveCanvasController *)self shouldCanvasScrollingSizeGrowToFitBoardContent])
  {
    [v15 bounds];
    double v25 = v24;
    CGFloat v27 = v26;
    CGFloat v29 = v28;
    CGFloat v31 = v30;
    [(CRLInteractiveCanvasController *)self viewScale];
    double v33 = sub_1000652FC(v25, v27, v29, v31, 1.0 / v32);
    double v35 = v34;
    double v37 = v36;
    double v39 = v38;
  }
  else
  {
    [v15 unscaledSize];
    double rect_16 = x;
    double rect_24 = y;
    double v40 = height;
    double v41 = sub_100064070();
    double v201 = width;
    double v43 = v42;
    double v45 = v44;
    double rect_8 = v46;
    long long v47 = [(CRLInteractiveCanvasController *)self canvas];
    unsigned int v48 = [v47 isAnchoredAtRight];

    double v49 = 0.0;
    if (v48) {
      double v49 = v45;
    }
    double v50 = v41 - v49;
    [(CRLInteractiveCanvasController *)self viewScale];
    double v52 = 1.0 / v51;
    double v33 = v50 + v19 * v52;
    CGFloat height = v40;
    double v35 = v43 + v17 * v52;
    CGFloat width = v201;
    double v37 = v45 - (v19 * v52 + v23 * v52);
    CGFloat x = rect_16;
    CGFloat y = rect_24;
    double v39 = rect_8 - (v17 * v52 + v21 * v52);
  }
  v204.origin.CGFloat x = x;
  v204.origin.CGFloat y = y;
  v204.size.CGFloat width = width;
  v204.size.CGFloat height = height;
  CGRect v205 = CGRectIntersection(v204, *(CGRect *)&v33);
  double v53 = v205.origin.x;
  double v54 = v205.origin.y;
  double v55 = v205.size.width;
  double v56 = v205.size.height;
  double v57 = [(CRLInteractiveCanvasController *)self layerHost];
  unsigned __int8 v58 = [v57 canvasView];

  double v59 = [v58 enclosingScrollView];
  [(CRLInteractiveCanvasController *)self contentOffset];
  -[CRLInteractiveCanvasController convertUnscaledToBoundsPoint:](self, "convertUnscaledToBoundsPoint:");
  double v61 = v60;
  double v63 = v62;
  v206.origin.CGFloat x = v53;
  v206.origin.CGFloat y = v54;
  v206.size.CGFloat width = v55;
  v206.size.CGFloat height = v56;
  if (!CGRectIsEmpty(v206))
  {
    -[CRLInteractiveCanvasController convertUnscaledToBoundsRect:](self, "convertUnscaledToBoundsRect:", v53, v54, v55, v56);
    double v65 = v64;
    CGFloat v67 = v66;
    CGFloat v69 = v68;
    CGFloat v71 = v70;
    double v72 = [(CRLInteractiveCanvasController *)self canvas];
    [v72 contentsScale];
    double v74 = sub_100067584(v65, v67, v69, v71, v73);
    double v76 = v75;
    double v78 = v77;
    CGFloat v186 = v79;

    CGFloat v80 = [v59 superview];

    if (!v80)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F3798);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010A7F64();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F37B8);
      }
      double v81 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v81);
      }
      double v82 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController p_contentOffsetToScrollRectToVisible:shouldCenterVertically:forceCenteringVertically:forceCenteringHorizontally:]");
      double v83 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"];
      +[CRLAssertionHandler handleFailureInFunction:v82 file:v83 lineNumber:3100 isFatal:0 description:"We expect a superview for bounds calculation"];
    }
    CGFloat rect = v76;
    CGFloat rect_8a = v74;
    CGFloat v188 = v78;
    double rect_24a = v63;
    double v185 = v61;
    [(CRLInteractiveCanvasController *)self unobscuredScrollViewFrame];
    double v85 = v84;
    double v87 = v86;
    double v89 = v88;
    double v91 = v90;
    long long v92 = [v59 superview];
    [v58 convertRect:v92 fromView:v85];
    CGFloat v94 = v93;
    CGFloat v96 = v95;
    CGFloat v98 = v97;
    double v100 = v99;

    [(CRLInteractiveCanvasController *)self p_safeAreaLayoutGuideLayoutFrame];
    [v58 convertRect:v59 fromView:];
    CGFloat v101 = v207.origin.x;
    CGFloat v102 = v207.origin.y;
    CGFloat v103 = v207.size.width;
    CGFloat v104 = v207.size.height;
    if (CGRectIsEmpty(v207)) {
      goto LABEL_20;
    }
    v208.origin.CGFloat x = v101;
    v208.origin.CGFloat y = v102;
    v208.size.CGFloat width = v103;
    v208.size.CGFloat height = v104;
    v245.origin.CGFloat x = v94;
    v245.origin.CGFloat y = v96;
    v245.size.CGFloat width = v98;
    v245.size.CGFloat height = v100;
    if (!CGRectIntersectsRect(v208, v245))
    {
LABEL_20:
      v210.size.CGFloat width = v98;
    }
    else
    {
      v209.origin.CGFloat x = v101;
      v209.origin.CGFloat y = v102;
      v209.size.CGFloat width = v103;
      v209.size.CGFloat height = v104;
      v246.origin.CGFloat x = v94;
      v246.origin.CGFloat y = v96;
      v246.size.CGFloat width = v98;
      v246.size.CGFloat height = v100;
      CGRect v210 = CGRectIntersection(v209, v246);
      CGFloat v94 = v210.origin.x;
      CGFloat v96 = v210.origin.y;
      double v100 = v210.size.height;
    }
    double v105 = rect;
    CGFloat v106 = rect_8a;
    CGFloat v202 = v100;
    CGFloat rect_16a = v96;
    CGFloat v184 = v94;
    if (a4 || v7)
    {
      CGFloat v123 = v94;
      CGFloat v124 = v96;
      double v122 = v210.size.width;
      double v125 = v100;
      v247.origin.CGFloat x = rect_8a;
      v247.origin.CGFloat y = rect;
      v247.size.CGFloat width = v188;
      CGFloat v115 = v186;
      v247.size.CGFloat height = v186;
      if (CGRectContainsRect(v210, v247) && !v7)
      {
        CGFloat v120 = v188;
        if (v6) {
          goto LABEL_42;
        }
      }
      else
      {
        sub_100065738(rect_8a, rect, v188, v186);
        double v105 = v127 + v100 * -0.5;
        if ([(CRLInteractiveCanvasController *)self shouldCanvasScrollingSizeGrowToFitBoardContent])
        {
          CGFloat v120 = v188;
          CGFloat v115 = v100;
        }
        else
        {
          [v15 unscaledSize];
          [(CRLInteractiveCanvasController *)self convertUnscaledToBoundsRect:sub_100064070()];
          CGFloat v166 = v165;
          double v168 = v167;
          CGFloat v170 = v169;
          CGFloat v172 = v171;
          [v15 contentInset];
          double v187 = v168 + v173;
          if (!sub_100064278(v166, v168 + v173, v170, v172, rect_8a, v105, v188, v202))
          {
            double v174 = sub_100065E4C(rect_8a, v105, v188, v202, v166, v187, v170, v172);
            double v175 = v170;
            CGFloat v177 = v176;
            CGFloat v179 = v178;
            CGFloat v181 = v180;
            CGFloat v182 = v174;
            CGFloat r2 = v175;
            if (sub_100064278(v166, v187, v175, v172, v174, v176, v178, v180))
            {
              CGFloat v115 = v202;
              double rect_24a = v177;
            }
            else
            {
              v243.origin.CGFloat x = v182;
              v243.origin.CGFloat y = v177;
              v243.size.CGFloat width = v179;
              v243.size.CGFloat height = v181;
              v249.origin.CGFloat x = v166;
              v249.origin.CGFloat y = v187;
              v249.size.CGFloat width = r2;
              v249.size.CGFloat height = v172;
              CGRect v244 = CGRectIntersection(v243, v249);
              double rect_24a = v244.origin.y;
              CGFloat v115 = v202;
            }
            CGFloat v120 = v188;
            CGFloat v106 = rect_8a;
            if (v6) {
              goto LABEL_42;
            }
            goto LABEL_47;
          }
          CGFloat v120 = v188;
          CGFloat v115 = v202;
        }
        double rect_24a = v105;
        if (v6) {
          goto LABEL_42;
        }
      }
    }
    else
    {
      CGFloat v107 = v94;
      CGFloat v108 = v96;
      CGFloat v109 = v210.size.width;
      double v110 = v100;
      double MaxY = CGRectGetMaxY(v210);
      v211.origin.CGFloat x = rect_8a;
      v211.origin.CGFloat y = rect;
      v211.size.CGFloat width = v188;
      CGFloat v112 = v96;
      CGFloat v113 = v109;
      CGFloat v114 = v188;
      CGFloat v115 = v186;
      v211.size.CGFloat height = v186;
      if (MaxY <= CGRectGetMaxY(v211)) {
        goto LABEL_34;
      }
      v212.origin.CGFloat x = v94;
      v212.origin.CGFloat y = v112;
      v212.size.CGFloat width = v113;
      v212.size.CGFloat height = v202;
      double MinY = CGRectGetMinY(v212);
      v213.origin.CGFloat x = rect_8a;
      v213.origin.CGFloat y = rect;
      v213.size.CGFloat width = v188;
      v213.size.CGFloat height = v186;
      if (MinY <= CGRectGetMinY(v213))
      {
LABEL_34:
        v218.origin.CGFloat x = v94;
        v218.origin.CGFloat y = v112;
        v218.size.CGFloat width = v113;
        v218.size.CGFloat height = v202;
        double v128 = CGRectGetMinY(v218);
        v219.origin.CGFloat x = rect_8a;
        v219.origin.CGFloat y = rect;
        v219.size.CGFloat width = v188;
        v219.size.CGFloat height = v186;
        if (v128 < CGRectGetMinY(v219))
        {
          v220.origin.CGFloat x = v94;
          v220.origin.CGFloat y = v112;
          v220.size.CGFloat width = v113;
          v220.size.CGFloat height = v202;
          double v129 = CGRectGetMaxY(v220);
          v221.origin.CGFloat x = rect_8a;
          v221.origin.CGFloat y = rect;
          v221.size.CGFloat width = v188;
          v221.size.CGFloat height = v186;
          if (v129 < CGRectGetMaxY(v221))
          {
            v222.origin.CGFloat x = rect_8a;
            v222.origin.CGFloat y = rect;
            v222.size.CGFloat width = v188;
            v222.size.CGFloat height = v186;
            double v130 = CGRectGetMinY(v222);
            v223.origin.CGFloat x = v94;
            v223.origin.CGFloat y = v112;
            v223.size.CGFloat width = v113;
            v223.size.CGFloat height = v202;
            double v131 = v130 - CGRectGetMinY(v223);
            v224.origin.CGFloat x = rect_8a;
            v224.origin.CGFloat y = rect;
            CGFloat v132 = v113;
            CGFloat v120 = v188;
            v224.size.CGFloat width = v188;
            v224.size.CGFloat height = v186;
            double v133 = CGRectGetMaxY(v224);
            v225.origin.CGFloat x = v94;
            v225.origin.CGFloat y = v112;
            v225.size.CGFloat width = v132;
            v225.size.CGFloat height = v202;
            double v134 = v133 - CGRectGetMaxY(v225);
            if (v131 < v134) {
              double v134 = v131;
            }
            double v105 = rect;
            CGFloat v106 = rect_8a;
            double rect_24a = rect_24a + v134;
            double v122 = v132;
            if (v6) {
              goto LABEL_42;
            }
            goto LABEL_47;
          }
        }
        CGFloat v135 = v113;
        CGFloat v120 = v188;
        double v122 = v135;
      }
      else
      {
        v214.origin.CGFloat x = v94;
        v214.origin.CGFloat y = v112;
        v214.size.CGFloat width = v113;
        v214.size.CGFloat height = v202;
        double v189 = CGRectGetMaxY(v214);
        v215.origin.CGFloat x = rect_8a;
        v215.origin.CGFloat y = rect;
        v215.size.CGFloat width = v114;
        v215.size.CGFloat height = v186;
        double v117 = v189 - CGRectGetMaxY(v215);
        v216.origin.CGFloat x = v94;
        v216.origin.CGFloat y = v112;
        v216.size.CGFloat width = v113;
        v216.size.CGFloat height = v202;
        double v118 = CGRectGetMinY(v216);
        v217.origin.CGFloat x = rect_8a;
        v217.origin.CGFloat y = rect;
        CGFloat v119 = v113;
        CGFloat v120 = v114;
        v217.size.CGFloat width = v114;
        v217.size.CGFloat height = v186;
        double v121 = v118 - CGRectGetMinY(v217);
        if (v117 < v121) {
          double v121 = v117;
        }
        CGFloat v106 = rect_8a;
        double rect_24a = rect_24a - v121;
        double v122 = v119;
      }
      double v105 = rect;
      if (v6)
      {
LABEL_42:
        CGFloat v136 = v105;
        double v61 = sub_100065738(v106, v105, v120, v115) + v122 * -0.5;
        if (![(CRLInteractiveCanvasController *)self shouldCanvasScrollingSizeGrowToFitBoardContent])
        {
          [v15 unscaledSize];
          [(CRLInteractiveCanvasController *)self convertUnscaledToBoundsRect:sub_100064070()];
          double v138 = v137;
          CGFloat v140 = v139;
          CGFloat v142 = v141;
          CGFloat v144 = v143;
          [v15 contentInset];
          double rect_16b = v138 + v145;
          if (!sub_100064278(v138 + v145, v140, v142, v144, v61, v136, v122, v115))
          {
            double v61 = sub_100065E4C(v61, v136, v122, v115, rect_16b, v140, v142, v144);
            CGFloat v147 = v146;
            CGFloat v149 = v148;
            CGFloat v151 = v150;
            if (!sub_100064278(rect_16b, v140, v142, v144, v61, v146, v148, v150))
            {
              v226.origin.CGFloat x = v61;
              v226.origin.CGFloat y = v147;
              v226.size.CGFloat width = v149;
              v226.size.CGFloat height = v151;
              v248.origin.CGFloat x = rect_16b;
              v248.origin.CGFloat y = v140;
              v248.size.CGFloat width = v142;
              v248.size.CGFloat height = v144;
              *(void *)&double v61 = (unint64_t)CGRectIntersection(v226, v248);
            }
          }
        }
LABEL_58:
        double v63 = rect_24a;
        goto LABEL_59;
      }
    }
LABEL_47:
    v227.origin.CGFloat x = v184;
    v227.origin.CGFloat y = rect_16a;
    v227.size.CGFloat width = v122;
    v227.size.CGFloat height = v202;
    double MaxX = CGRectGetMaxX(v227);
    v228.origin.CGFloat x = v106;
    v228.origin.CGFloat y = v105;
    v228.size.CGFloat width = v120;
    v228.size.CGFloat height = v115;
    if (MaxX <= CGRectGetMaxX(v228)) {
      goto LABEL_52;
    }
    v229.origin.CGFloat x = v184;
    v229.origin.CGFloat y = rect_16a;
    v229.size.CGFloat width = v122;
    v229.size.CGFloat height = v202;
    double MinX = CGRectGetMinX(v229);
    v230.origin.CGFloat x = v106;
    v230.origin.CGFloat y = v105;
    v230.size.CGFloat width = v120;
    v230.size.CGFloat height = v115;
    if (MinX <= CGRectGetMinX(v230))
    {
LABEL_52:
      v235.origin.CGFloat x = v184;
      v235.origin.CGFloat y = rect_16a;
      v235.size.CGFloat width = v122;
      v235.size.CGFloat height = v202;
      double v156 = CGRectGetMinX(v235);
      v236.origin.CGFloat x = v106;
      v236.origin.CGFloat y = v105;
      v236.size.CGFloat width = v120;
      v236.size.CGFloat height = v115;
      if (v156 >= CGRectGetMinX(v236)) {
        goto LABEL_57;
      }
      v237.origin.CGFloat x = v184;
      v237.origin.CGFloat y = rect_16a;
      v237.size.CGFloat width = v122;
      v237.size.CGFloat height = v202;
      double v157 = CGRectGetMaxX(v237);
      v238.origin.CGFloat x = v106;
      v238.origin.CGFloat y = v105;
      v238.size.CGFloat width = v120;
      v238.size.CGFloat height = v115;
      if (v157 >= CGRectGetMaxX(v238))
      {
LABEL_57:
        double v61 = v185;
      }
      else
      {
        v239.origin.CGFloat x = v106;
        v239.origin.CGFloat y = v105;
        v239.size.CGFloat width = v120;
        v239.size.CGFloat height = v115;
        double rect_8d = CGRectGetMinX(v239);
        v240.origin.CGFloat x = v184;
        v240.origin.CGFloat y = rect_16a;
        v240.size.CGFloat width = v122;
        v240.size.CGFloat height = v202;
        CGFloat v158 = CGRectGetMinX(v240);
        CGFloat v159 = v106;
        double v160 = rect_8d - v158;
        v241.origin.CGFloat x = v159;
        v241.origin.CGFloat y = v105;
        v241.size.CGFloat width = v120;
        v241.size.CGFloat height = v115;
        double v161 = CGRectGetMaxX(v241);
        v242.origin.CGFloat x = v184;
        v242.origin.CGFloat y = rect_16a;
        v242.size.CGFloat width = v122;
        v242.size.CGFloat height = v202;
        double v162 = v161 - CGRectGetMaxX(v242);
        if (v160 < v162) {
          double v162 = v160;
        }
        double v61 = v185 + v162;
      }
    }
    else
    {
      v231.origin.CGFloat x = v184;
      v231.origin.CGFloat y = rect_16a;
      v231.size.CGFloat width = v122;
      v231.size.CGFloat height = v202;
      double rect_8c = CGRectGetMaxX(v231);
      v232.origin.CGFloat x = v106;
      v232.origin.CGFloat y = v105;
      v232.size.CGFloat width = v120;
      v232.size.CGFloat height = v115;
      double rect_8b = rect_8c - CGRectGetMaxX(v232);
      v233.origin.CGFloat x = v184;
      v233.origin.CGFloat y = rect_16a;
      v233.size.CGFloat width = v122;
      v233.size.CGFloat height = v202;
      double v154 = CGRectGetMinX(v233);
      v234.origin.CGFloat x = v106;
      v234.origin.CGFloat y = v105;
      v234.size.CGFloat width = v120;
      v234.size.CGFloat height = v115;
      double v155 = v154 - CGRectGetMinX(v234);
      if (rect_8b < v155) {
        double v155 = rect_8b;
      }
      double v61 = v185 - v155;
    }
    goto LABEL_58;
  }
LABEL_59:

  double v163 = v61;
  double v164 = v63;
  result.CGFloat y = v164;
  result.CGFloat x = v163;
  return result;
}

- (void)scrollRectToVisible:(CGRect)a3 scrollOptions:(unint64_t)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(CRLInteractiveCanvasController *)self cancelScrollToCurrentSelectionPathAfterLayout];
  if ((a4 & 2) == 0)
  {
    if ((a4 & 4) == 0) {
      goto LABEL_3;
    }
LABEL_14:
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F3818);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A7FEC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F3838);
    }
    double v14 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v14);
    }
    double v15 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController scrollRectToVisible:scrollOptions:]");
    double v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v15 file:v16 lineNumber:3201 isFatal:0 description:"Cannot tell scrollRectToVisible to zoom!"];

    if ((a4 & 1) == 0) {
      goto LABEL_4;
    }
LABEL_23:
    id WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
    char v18 = objc_opt_respondsToSelector();

    if (v18)
    {
      id v19 = objc_loadWeakRetained((id *)&self->mDelegate);
      unsigned int v20 = [v19 shouldAllowAnimatedScrollForInteractiveCanvasController:self];

      uint64_t v10 = v20;
    }
    else
    {
      uint64_t v10 = 1;
    }
    goto LABEL_26;
  }
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F37D8);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_1010A8074();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F37F8);
  }
  double v11 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_10106590C(v11);
  }
  CGFloat v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController scrollRectToVisible:scrollOptions:]");
  double v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"];
  +[CRLAssertionHandler handleFailureInFunction:v12 file:v13 lineNumber:3200 isFatal:0 description:"Cannot tell scrollRectToVisible to zoom!"];

  if ((a4 & 4) != 0) {
    goto LABEL_14;
  }
LABEL_3:
  if (a4) {
    goto LABEL_23;
  }
LABEL_4:
  uint64_t v10 = 0;
LABEL_26:
  -[CRLInteractiveCanvasController p_contentOffsetToScrollRectToVisible:shouldCenterVertically:forceCenteringVertically:forceCenteringHorizontally:](self, "p_contentOffsetToScrollRectToVisible:shouldCenterVertically:forceCenteringVertically:forceCenteringHorizontally:", (a4 >> 3) & 1, (a4 >> 5) & 1, (a4 >> 6) & 1, x, y, width, height);
  -[CRLInteractiveCanvasController convertBoundsToUnscaledPoint:](self, "convertBoundsToUnscaledPoint:");
  double v22 = v21;
  double v24 = v23;
  [(CRLInteractiveCanvasController *)self contentOffset];
  if (!sub_100064084(v22, v24, v25, v26)) {
    -[CRLInteractiveCanvasController growCanvasAsNeededToSetContentOffset:scrollOptions:](self, "growCanvasAsNeededToSetContentOffset:scrollOptions:", v10, v22, v24);
  }
}

- (void)scrollRectToVisibleWithSelectionOutset:(CGRect)a3 scrollOptions:(unint64_t)a4
{
  -[CRLInteractiveCanvasController outsetSelectionRect:](self, "outsetSelectionRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);

  -[CRLInteractiveCanvasController scrollRectToVisible:scrollOptions:](self, "scrollRectToVisible:scrollOptions:", a4);
}

- (void)growCanvasAsNeededToRestoreContentOffset:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (![(CRLInteractiveCanvasController *)self shouldCanvasScrollingSizeGrowToFitBoardContent])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F3858);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A80FC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F3878);
    }
    BOOL v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v6);
    }
    BOOL v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController growCanvasAsNeededToRestoreContentOffset:]");
    CGFloat v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:3222 isFatal:0 description:"You shouldn't ask to grow the canvas if the canvas doesn't grow in general"];
  }
  -[CRLInteractiveCanvasController growCanvasAsNeededToSetContentOffset:scrollOptions:](self, "growCanvasAsNeededToSetContentOffset:scrollOptions:", 0, x, y);
}

- (void)growCanvasAsNeededToSetContentOffset:(CGPoint)a3 scrollOptions:(unint64_t)a4
{
  double y = a3.y;
  double x = a3.x;
  id v8 = [(CRLInteractiveCanvasController *)self visibleUnscaledRect];
  Freeform::SyncEvent::FetchedRecordZoneChanges::Deletion v18 = SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)((CKRecordID)v8, v9);
  self->mRectToIncludeWhenGrowingCanvasToFitContent.origin.double x = v10;
  self->mRectToIncludeWhenGrowingCanvasToFitContent.origin.double y = v11;
  self->mRectToIncludeWhenGrowingCanvasToFitContent.size.double width = v12;
  self->mRectToIncludeWhenGrowingCanvasToFitContent.size.double height = v13;
  double v14 = [(CRLInteractiveCanvasController *)self layerHost];
  double v15 = [v14 canvasLayer];
  [v15 fixFrameAndScrollView];

  CGSize size = CGRectZero.size;
  self->mRectToIncludeWhenGrowingCanvasToFitContent.CGPoint origin = CGRectZero.origin;
  self->mRectToIncludeWhenGrowingCanvasToFitContent.CGSize size = size;

  -[CRLInteractiveCanvasController setContentOffset:scrollOptions:](self, "setContentOffset:scrollOptions:", a4, x, y);
}

- (void)setContentOffset:(CGPoint)a3 source:(id)a4 scrollOptions:(unint64_t)a5
{
  double y = a3.y;
  double x = a3.x;
  Swift::String v9 = (NSString *)[a4 copy];
  mCurrentInteractionSource = self->mCurrentInteractionSource;
  self->mCurrentInteractionSource = v9;

  -[CRLInteractiveCanvasController setContentOffset:scrollOptions:](self, "setContentOffset:scrollOptions:", a5, x, y);
  CGFloat v11 = self->mCurrentInteractionSource;
  self->mCurrentInteractionSource = 0;
}

- (void)setContentOffset:(CGPoint)a3 scrollOptions:(unint64_t)a4
{
  unint64_t v5 = a4 & 1;
  -[CRLInteractiveCanvasController convertUnscaledToBoundsPoint:](self, "convertUnscaledToBoundsPoint:", a3.x, a3.y);
  double v7 = v6;
  double v9 = v8;
  CGFloat v10 = [(CRLInteractiveCanvasController *)self layerHost];
  id v17 = [v10 canvasView];

  CGFloat v11 = [v17 enclosingScrollView];
  [v17 convertPoint:v11 toView:v7];
  double v13 = v12;
  double v15 = v14;
  [v11 scrollableAreaContentInsets];
  [v11 setContentOffset:v5 animated:sub_100064680(v13, v15, v16)];
}

- (CGPoint)contentOffset
{
  double v3 = [(CRLInteractiveCanvasController *)self layerHost];
  char v4 = [v3 canvasView];

  unint64_t v5 = [v4 enclosingScrollView];
  double v6 = v5;
  if (v5)
  {
    [v5 contentOffset];
    [v6 convertPoint:v4 toView:];
    double v8 = v7;
    double v10 = v9;
    [v6 scrollableAreaContentInsets];
    [(CRLInteractiveCanvasController *)self convertBoundsToUnscaledPoint:sub_100064698(v8, v10, v11)];
    CGFloat x = v12;
    CGFloat y = v14;
  }
  else
  {
    CGFloat x = CGPointZero.x;
    CGFloat y = CGPointZero.y;
  }

  double v16 = x;
  double v17 = y;
  result.CGFloat y = v17;
  result.CGFloat x = v16;
  return result;
}

- (CGSize)sizeOfScrollViewEnclosingCanvas
{
  [(CRLInteractiveCanvasController *)self p_calculatedSizeOfScrollViewEnclosingCanvas];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (CGSize)p_calculatedSizeOfScrollViewEnclosingCanvas
{
  if (!+[NSThread isMainThread])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F3898);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A8184();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F38B8);
    }
    double v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    char v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController p_calculatedSizeOfScrollViewEnclosingCanvas]");
    unint64_t v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:3301 isFatal:0 description:"This operation must only be performed on the main thread."];
  }
  double v6 = [(CRLInteractiveCanvasController *)self layerHost];
  uint64_t v7 = [v6 canvasView];
  double v8 = [(id)v7 enclosingScrollView];
  [v8 scrollableAreaBounds];
  double v10 = v9;
  double v12 = v11;

  p_mDelegate = &self->mDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_mDelegate);
  LOBYTE(v7) = objc_opt_respondsToSelector();

  if (v7)
  {
    id v15 = objc_loadWeakRetained((id *)p_mDelegate);
    [v15 sizeOfScrollViewEnclosingCanvas];
    double v10 = v16;
    double v12 = v17;
  }
  double v18 = v10;
  double v19 = v12;
  result.double height = v19;
  result.double width = v18;
  return result;
}

- (CGSize)p_sizeOfScrollViewEnclosingCanvasForVisibleCanvasCalculations
{
  double v3 = [(CRLInteractiveCanvasController *)self layerHost];
  uint64_t v4 = [v3 canvasView];
  unint64_t v5 = [(id)v4 enclosingScrollView];
  [v5 scrollableAreaBounds];
  double v7 = v6;
  double v9 = v8;

  p_mDelegate = &self->mDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_mDelegate);
  LOBYTE(v4) = objc_opt_respondsToSelector();

  if (v4)
  {
    id v12 = objc_loadWeakRetained((id *)p_mDelegate);
    [v12 sizeOfScrollViewEnclosingCanvasForVisibleCanvasCalculations];
    double v7 = v13;
    double v9 = v14;
  }
  double v15 = v7;
  double v16 = v9;
  result.double height = v16;
  result.double width = v15;
  return result;
}

- (void)updateCanvasViewSubviewFrames
{
  id v2 = [(CRLInteractiveCanvasController *)self i_interactiveCanvasLayerHelper];
  [v2 updateLayerContainerFrames];
}

- (void)setNeedsDisplayOnLayer:(id)a3
{
}

- (void)setNeedsDisplayInRect:(CGRect)a3 onLayer:(id)a4
{
}

- (CRLColor)selectionHighlightColor
{
  return self->mSelectionHighlightColor;
}

- (void)setSelectionHighlightColor:(id)a3
{
  uint64_t v4 = (CRLColor *)[a3 copy];
  mSelectionHighlightColor = self->mSelectionHighlightColor;
  self->mSelectionHighlightColor = v4;

  [(CRLInteractiveCanvasController *)self i_invalidateSelectionHighlightLayers];
}

- (void)setPrimaryFindResultSearchReference:(id)a3
{
  unint64_t v5 = (CRLSearchReference *)a3;
  if (self->_primaryFindResultSearchReference != v5)
  {
    objc_storeStrong((id *)&self->_primaryFindResultSearchReference, a3);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    double v6 = [(CRLInteractiveCanvasController *)self canvas];
    double v7 = [v6 topLevelReps];

    id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v12 + 1) + 8 * i) recursivelyPerformSelectorIfImplemented:"i_primaryFindResultChanged:" withObject:v5];
        }
        id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
}

- (void)setSearchReferencesToHighlight:(id)a3
{
  unint64_t v5 = (NSMapTable *)a3;
  if (self->_searchReferencesToHighlight != v5)
  {
    objc_storeStrong((id *)&self->_searchReferencesToHighlight, a3);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    double v6 = [(CRLInteractiveCanvasController *)self canvas];
    double v7 = [v6 topLevelReps];

    id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v12 + 1) + 8 * i) recursivelyPerformSelectorIfImplemented:"i_setSearchReferencesToHighlight:" withObject:v5];
        }
        id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
}

- (BOOL)hasMediaReplacer
{
  double v3 = [(CRLInteractiveCanvasController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  unint64_t v5 = [(CRLInteractiveCanvasController *)self delegate];
  double v6 = v5;
  if (v4) {
    unsigned __int8 v7 = [v5 hasMediaReplacerForInteractiveCanvasController:self];
  }
  else {
    unsigned __int8 v7 = objc_opt_respondsToSelector();
  }
  unsigned __int8 v8 = v7;

  return v8 & 1;
}

- (CRLMediaReplacer)mediaReplacer
{
  double v3 = [(CRLInteractiveCanvasController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    unint64_t v5 = [(CRLInteractiveCanvasController *)self delegate];
    double v6 = [v5 mediaReplacerForInteractiveCanvasController:self];
  }
  else
  {
    double v6 = 0;
  }

  return (CRLMediaReplacer *)v6;
}

- (CGRect)visibleScaledRectForCanvasUI
{
  [(CRLInteractiveCanvasController *)self p_visibleBoundsRectUsingSizeOfEnclosingScrollView:0 respectObscuredFrame:1 respectSafeArea:1 respectObscuringRects:1 respectAreaPastScollViewLimit:0];
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

- (BOOL)spellCheckingSupported
{
  p_mDelegate = &self->mDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  if (objc_opt_respondsToSelector())
  {
    id v4 = objc_loadWeakRetained((id *)p_mDelegate);
    unsigned __int8 v5 = [v4 spellCheckingSupported];
  }
  else
  {
    unsigned __int8 v5 = 1;
  }

  return v5;
}

- (BOOL)spellCheckingSuppressed
{
  unsigned int v3 = [(CRLInteractiveCanvasController *)self spellCheckingSupported];
  if (v3)
  {
    p_mDelegate = &self->mDelegate;
    id WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
    if (objc_opt_respondsToSelector())
    {
      id v6 = objc_loadWeakRetained((id *)p_mDelegate);
      unsigned __int8 v7 = [v6 spellCheckingSuppressed];
    }
    else
    {
      unsigned __int8 v7 = 0;
    }
  }
  else
  {
    unsigned __int8 v7 = 0;
  }
  return v7 | v3 ^ 1;
}

- (void)p_spellCheckerWordsDidChangeNotification:(id)a3
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  unsigned int v3 = [(CRLInteractiveCanvasController *)self canvas];
  id v4 = [v3 topLevelReps];

  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * i) recursivelyPerformSelectorIfImplemented:"i_spellCheckerWordsDidChange"];
      }
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)p_spellCheckingStateChangedNotification:(id)a3
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  unsigned int v3 = [(CRLInteractiveCanvasController *)self canvas];
  id v4 = [v3 topLevelReps];

  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * i) recursivelyPerformSelectorIfImplemented:"spellCheckingStateChanged"];
      }
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (BOOL)isCanvasInteractive
{
  return 1;
}

- (BOOL)shouldShowTextOverflowGlyphs
{
  p_mDelegate = &self->mDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  if (!WeakRetained) {
    return 1;
  }
  id v4 = WeakRetained;
  id v5 = objc_loadWeakRetained((id *)p_mDelegate);
  char v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0) {
    return 1;
  }
  id v7 = objc_loadWeakRetained((id *)p_mDelegate);
  unsigned __int8 v8 = [v7 shouldShowTextOverflowGlyphs];

  return v8;
}

- (BOOL)shouldShowInstructionalTextForLayout:(id)a3
{
  id v4 = a3;
  p_mDelegate = &self->mDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_mDelegate);
  if (WeakRetained
    && (id v7 = WeakRetained,
        id v8 = objc_loadWeakRetained((id *)p_mDelegate),
        char v9 = objc_opt_respondsToSelector(),
        v8,
        v7,
        (v9 & 1) != 0))
  {
    id v10 = objc_loadWeakRetained((id *)p_mDelegate);
    unsigned __int8 v11 = [v10 shouldShowInstructionalTextForLayout:v4];
  }
  else
  {
    unsigned __int8 v11 = 1;
  }

  return v11;
}

- (BOOL)shouldEnableToolbarDoneButton
{
  unsigned int v3 = [(CRLInteractiveCanvasController *)self editorController];
  id v4 = [v3 textInputEditor];
  unsigned __int8 v11 = sub_100246AC8(v4, 1, v5, v6, v7, v8, v9, v10, (uint64_t)&OBJC_PROTOCOL____TtP8Freeform18CRLTextInputEditor_);

  long long v12 = [(CRLInteractiveCanvasController *)self editorController];
  long long v13 = [v12 selectionPath];
  long long v14 = [(CRLInteractiveCanvasController *)self modelsForSelectionPath:v13];

  id v15 = [v14 count];
  unsigned __int8 v16 = [v11 wantsDoneButtonWhenEditing];
  if (v15) {
    BOOL v17 = 1;
  }
  else {
    BOOL v17 = v16;
  }

  return v17;
}

- (void)updateCanvasDotGridVisibilityIfNeeded
{
  p_mDelegate = &self->mDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  if (WeakRetained
    && (uint64_t v5 = WeakRetained,
        id v6 = objc_loadWeakRetained((id *)p_mDelegate),
        char v7 = objc_opt_respondsToSelector(),
        v6,
        v5,
        (v7 & 1) != 0))
  {
    id v8 = objc_loadWeakRetained((id *)p_mDelegate);
    id v9 = [v8 wantsToShowCanvasDotGridOnInteractiveCanvasController:self];
  }
  else
  {
    id v9 = 0;
  }
  uint64_t v10 = [(CRLInteractiveCanvasController *)self layerHost];
  id v14 = [v10 canvasLayer];

  unsigned __int8 v11 = [v14 associatedBackgroundLayer];
  unsigned int v12 = [v11 enabled];

  if (v9 != v12)
  {
    long long v13 = [v14 associatedBackgroundLayer];
    [v13 setEnabled:v9];
  }
}

- (void)updateConnectorKnobVisibilityIfNeeded
{
  p_mDelegate = &self->mDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  if (WeakRetained
    && (uint64_t v5 = WeakRetained,
        id v6 = objc_loadWeakRetained((id *)p_mDelegate),
        char v7 = objc_opt_respondsToSelector(),
        v6,
        v5,
        (v7 & 1) != 0))
  {
    id v8 = objc_loadWeakRetained((id *)p_mDelegate);
    id v9 = [v8 wantsToShowConnectorKnobsOnInteractiveCanvasController:self];
  }
  else
  {
    id v9 = 0;
  }
  if (self->mConnectorKnobsEnabled != v9)
  {
    self->mConnectorKnobsEnabled = (char)v9;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v10 = [(CRLCanvas *)self->mCanvas topLevelReps];
    id v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v16;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v16 != v13) {
            objc_enumerationMutation(v10);
          }
          [*(id *)(*((void *)&v15 + 1) + 8 * i) recursivelyPerformSelectorIfImplemented:"invalidateKnobs"];
        }
        id v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v12);
    }

    [(CRLInteractiveCanvasController *)self updateTipsWithConnectorKnobsEnabled:v9];
    if (v9) {
      [(CRLInteractiveCanvasController *)self animateIntoConnectorMode];
    }
  }
}

- (void)setFreehandDrawingToolkit:(id)a3
{
  objc_storeStrong((id *)&self->mFreehandDrawingToolkit, a3);
  uint64_t v5 = [(CRLInteractiveCanvasController *)self layerHost];
  id v6 = [v5 asiOSCVC];
  [v6 i_startObservingFreehandDrawingToolkit];

  char v7 = [(CRLInteractiveCanvasController *)self layerHost];
  id v8 = [v7 asUIKitHost];
  id v9 = [v8 freehandDrawingGestureRecognizer];

  [v9 setEnabled:a3 != 0];
}

- (BOOL)p_shouldTransformCurrentSelectionAsSingleEntity
{
  if (self->mMultiselectResizeInfo) {
    return 1;
  }
  else {
    return [(CRLFreehandDrawingToolkit *)self->mFreehandDrawingToolkit isInDrawingMode];
  }
}

- (CRLCanvasGuideController)guideController
{
  mGuideController = self->mGuideController;
  if (!mGuideController)
  {
    id v4 = [[CRLCanvasGuideController alloc] initWithInteractiveCanvasController:self];
    uint64_t v5 = self->mGuideController;
    self->mGuideController = v4;

    mGuideController = self->mGuideController;
  }

  return mGuideController;
}

- (void)translateGuide:(id)a3 toContainerRect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v18 = a3;
  [v18 setInfinite:0];
  id v8 = [v18 guideType];
  CGFloat v9 = x;
  CGFloat v10 = y;
  CGFloat v11 = width;
  CGFloat v12 = height;
  if (v8)
  {
    double MinX = CGRectGetMinX(*(CGRect *)&v9);
    [v18 offset];
    [v18 setOffset:MinX + v14];
    v20.origin.CGFloat x = x;
    v20.origin.CGFloat y = y;
    v20.size.CGFloat width = width;
    v20.size.CGFloat height = height;
    [v18 setStart:CGRectGetMinY(v20)];
    v21.origin.CGFloat x = x;
    v21.origin.CGFloat y = y;
    v21.size.CGFloat width = width;
    v21.size.CGFloat height = height;
    double MaxY = CGRectGetMaxY(v21);
  }
  else
  {
    double MinY = CGRectGetMinY(*(CGRect *)&v9);
    [v18 offset];
    [v18 setOffset:MinY + v17];
    v22.origin.CGFloat x = x;
    v22.origin.CGFloat y = y;
    v22.size.CGFloat width = width;
    v22.size.CGFloat height = height;
    [v18 setStart:CGRectGetMinX(v22)];
    v23.origin.CGFloat x = x;
    v23.origin.CGFloat y = y;
    v23.size.CGFloat width = width;
    v23.size.CGFloat height = height;
    double MaxY = CGRectGetMaxX(v23);
  }
  [v18 setEnd:MaxY];
}

- (void)clipGuideToContainer:(id)a3 atUnscaledPoint:(CGPoint)a4
{
  id v19 = a3;
  [(CRLInteractiveCanvasController *)self visibleUnscaledRect];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  [v19 setInfinite:0];
  id v13 = [v19 guideType];
  CGFloat v14 = v6;
  CGFloat v15 = v8;
  CGFloat v16 = v10;
  CGFloat v17 = v12;
  if (v13)
  {
    [v19 setStart:CGRectGetMinY(*(CGRect *)&v14)];
    v21.origin.CGFloat x = v6;
    v21.origin.CGFloat y = v8;
    v21.size.CGFloat width = v10;
    v21.size.CGFloat height = v12;
    double MaxY = CGRectGetMaxY(v21);
  }
  else
  {
    [v19 setStart:CGRectGetMinX(*(CGRect *)&v14)];
    v22.origin.CGFloat x = v6;
    v22.origin.CGFloat y = v8;
    v22.size.CGFloat width = v10;
    v22.size.CGFloat height = v12;
    double MaxY = CGRectGetMaxX(v22);
  }
  [v19 setEnd:MaxY];
}

- (void)translateGuides:(id)a3 toContainerRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      id v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        -[CRLInteractiveCanvasController translateGuide:toContainerRect:](self, "translateGuide:toContainerRect:", *(void *)(*((void *)&v14 + 1) + 8 * (void)v13), x, y, width, height);
        id v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (CGRect)boundingRectForActiveGuidesForPoint:(CGPoint)a3
{
  double x = CGRectInfinite.origin.x;
  double y = CGRectInfinite.origin.y;
  double width = CGRectInfinite.size.width;
  double height = CGRectInfinite.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (id)provideDynamicGuidesForLayout:(id)a3
{
  return &__NSArray0__struct;
}

- (BOOL)shouldGenerateGuidesForLayout:(id)a3
{
  return 1;
}

- (NSArray)infosToDisplay
{
  return [(CRLCanvas *)self->mCanvas infosToDisplay];
}

- (void)setInfosToDisplay:(id)a3
{
  [(CRLCanvas *)self->mCanvas i_setInfosToDisplay:a3 updatingLayoutController:0];
  [(CRLCanvasEditor *)self->mCanvasEditor canvasInfosDidChange];
  mCanvas = self->mCanvas;

  [(CRLCanvas *)mCanvas i_updateInfosInLayoutController];
}

- (void)setTemporaryAdditionalBoardItemsToDisplay:(id)a3
{
  unint64_t v4 = (unint64_t)a3;
  double v5 = (void *)v4;
  if (v4 | (unint64_t)self->_temporaryAdditionalBoardItemsToDisplay)
  {
    id v9 = (void *)v4;
    unsigned __int8 v6 = [v4 isEqual:];
    double v5 = v9;
    if ((v6 & 1) == 0)
    {
      double v7 = (NSArray *)[v9 copy];
      temporaryAdditionalBoardItemsToDispladouble y = self->_temporaryAdditionalBoardItemsToDisplay;
      self->_temporaryAdditionalBoardItemsToDispladouble y = v7;

      [(CRLInteractiveCanvasController *)self p_updateInfosToDisplayIfNeeded];
      double v5 = v9;
    }
  }
}

- (CGRect)p_safeAreaLayoutGuideLayoutFrame
{
  uint64_t v3 = objc_opt_class();
  unint64_t v4 = [(CRLInteractiveCanvasController *)self layerHost];
  double v5 = [v4 canvasView];
  unsigned __int8 v6 = [v5 enclosingScrollView];
  double v7 = sub_1002469D0(v3, v6);

  CGFloat v8 = [v7 safeAreaLayoutGuide];
  [v8 layoutFrame];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  double v17 = v10;
  double v18 = v12;
  double v19 = v14;
  double v20 = v16;
  result.size.double height = v20;
  result.size.double width = v19;
  result.origin.double y = v18;
  result.origin.double x = v17;
  return result;
}

- (void)clearLayoutsForTopLevelContainerChange
{
  id v2 = [(CRLInteractiveCanvasController *)self layoutController];
  [v2 i_removeAllLayouts];
}

- (id)topLevelZOrderedSiblingsOfInfos:(id)a3
{
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id v4 = a3;
  id v5 = [v4 countByEnumeratingWithState:&v73 objects:v79 count:16];
  if (v5)
  {
    id v6 = v5;
    double v61 = self;
    uint64_t v63 = 0;
    char v7 = 0;
    uint64_t v8 = *(void *)v74;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v74 != v8) {
        objc_enumerationMutation(v4);
      }
      double v10 = *(void **)(*((void *)&v73 + 1) + 8 * v9);
      double v11 = [v10 parentInfo];
      BOOL v12 = v11 == 0;

      double v13 = [v10 parentInfo];
      double v14 = v13;
      if (v63)
      {

        if ((void *)v63 != v14)
        {

          goto LABEL_23;
        }
      }
      else
      {
        uint64_t v15 = objc_opt_class();
        uint64_t v63 = sub_100246DEC(v14, v15, 1, v16, v17, v18, v19, v20, (uint64_t)&OBJC_PROTOCOL___CRLContainerInfo);
      }
      v7 |= v12;
      if (v6 == (id)++v9)
      {
        id v6 = [v4 countByEnumeratingWithState:&v73 objects:v79 count:16];
        if (v6) {
          goto LABEL_3;
        }

        if ((v7 & 1) == 0)
        {
          double v56 = (void *)v63;
          goto LABEL_45;
        }
        if (!v63)
        {
          +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014F38D8);
          }
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
            sub_1010A820C();
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014F38F8);
          }
          CGRect v21 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
            sub_10106590C(v21);
          }
          CGRect v22 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController topLevelZOrderedSiblingsOfInfos:]");
          CGRect v23 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"];
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v22, v23, 3834, 0, "If we're given any info without a parent, we should have been given at least one info with a parent, too.");

          id v24 = [v4 allObjects];
          goto LABEL_49;
        }
LABEL_23:
        double v64 = +[NSMutableSet set];
        double v25 = +[NSMutableSet set];
        long long v69 = 0u;
        long long v70 = 0u;
        long long v71 = 0u;
        long long v72 = 0u;
        id v60 = v4;
        id v26 = v4;
        id v27 = [v26 countByEnumeratingWithState:&v69 objects:v78 count:16];
        if (v27)
        {
          id v28 = v27;
          uint64_t v29 = *(void *)v70;
          do
          {
            for (i = 0; i != v28; i = (char *)i + 1)
            {
              if (*(void *)v70 != v29) {
                objc_enumerationMutation(v26);
              }
              CGFloat v31 = *(void **)(*((void *)&v69 + 1) + 8 * i);
              uint64_t v32 = [v31 parentInfo];
              if (v32
                && (double v33 = (void *)v32,
                    [v31 parentInfo],
                    double v34 = objc_claimAutoreleasedReturnValue(),
                    objc_opt_class(),
                    char isKindOfClass = objc_opt_isKindOfClass(),
                    v34,
                    v33,
                    (isKindOfClass & 1) == 0))
              {
                double v36 = [v31 parentInfo];
                uint64_t v37 = objc_opt_class();
                double v43 = sub_100246DEC(v36, v37, 1, v38, v39, v40, v41, v42, (uint64_t)&OBJC_PROTOCOL___CRLContainerInfo);

                [v64 crl_addNonNilObject:v43];
              }
              else
              {
                [v25 addObject:v31];
              }
            }
            id v28 = [v26 countByEnumeratingWithState:&v69 objects:v78 count:16];
          }
          while (v28);
        }

        [v25 unionSet:v64];
        double v44 = v61;
        double v62 = v25;
        double v59 = [(CRLInteractiveCanvasController *)v44 topLevelZOrderedSiblingsOfInfos:v25];
        id v24 = [v59 mutableCopy];
        long long v65 = 0u;
        long long v66 = 0u;
        long long v67 = 0u;
        long long v68 = 0u;
        id v45 = v64;
        id v46 = [v45 countByEnumeratingWithState:&v65 objects:v77 count:16];
        if (v46)
        {
          id v47 = v46;
          uint64_t v48 = *(void *)v66;
          do
          {
            for (j = 0; j != v47; j = (char *)j + 1)
            {
              if (*(void *)v66 != v48) {
                objc_enumerationMutation(v45);
              }
              double v50 = *(void **)(*((void *)&v65 + 1) + 8 * (void)j);
              id v51 = [v24 indexOfObject:v50];
              if (v51 != (id)0x7FFFFFFFFFFFFFFFLL)
              {
                id v52 = v51;
                uint64_t v53 = objc_opt_class();
                double v54 = [v50 childInfos];
                double v55 = sub_1002469D0(v53, v54);

                [v24 replaceObjectsInRange:v52 withObjectsFromArray:v55 range:[v55 count]];
              }
            }
            id v47 = [v45 countByEnumeratingWithState:&v65 objects:v77 count:16];
          }
          while (v47);
        }

        id v4 = v60;
        double v56 = (void *)v63;
        goto LABEL_46;
      }
    }
  }

  double v56 = 0;
LABEL_45:
  uint64_t v57 = objc_opt_class();
  id v45 = [v56 childInfos];
  sub_1002469D0(v57, v45);
  id v24 = (id)objc_claimAutoreleasedReturnValue();
LABEL_46:

  if (!v24) {
    id v24 = &__NSArray0__struct;
  }

LABEL_49:

  return v24;
}

- (id)repsForInfo:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableSet set];
  id v6 = [(CRLInteractiveCanvasController *)self layoutsForInfo:v4];
  char v7 = v6;
  if (v6)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          BOOL v12 = [(CRLInteractiveCanvasController *)self repForLayout:*(void *)(*((void *)&v14 + 1) + 8 * i)];
          if (v12) {
            [v5 addObject:v12];
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }
  }

  return v5;
}

- (id)repForInfo:(id)a3 createIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [(CRLInteractiveCanvasController *)self layoutForInfo:v6];
  id v8 = (void *)v7;
  if (!v7)
  {
    id v8 = 0;
    if (v4)
    {
      [(CRLInteractiveCanvasController *)self layoutIfNeeded];
      id v8 = [(CRLInteractiveCanvasController *)self layoutForInfo:v6];
    }
  }
  int v9 = !v4;
  if (v8)
  {
    uint64_t v10 = [(CRLInteractiveCanvasController *)self repForLayout:v8];
  }
  else
  {
    uint64_t v10 = 0;
  }
  if (v10) {
    int v11 = 1;
  }
  else {
    int v11 = v9;
  }
  if (v11) {
    BOOL v12 = (void *)v10;
  }
  else {
    BOOL v12 = 0;
  }
  if (v7 && (v11 & 1) == 0)
  {
    [(CRLInteractiveCanvasController *)self layoutIfNeeded];
    BOOL v12 = [(CRLInteractiveCanvasController *)self repForLayout:v8];
  }
  if (!v12)
  {
    double v13 = [(CRLInteractiveCanvasController *)self layoutsForInfo:v6];
    long long v14 = [v13 allObjects];
    long long v15 = +[NSMutableArray arrayWithArray:v14];

    [v15 sortUsingSelector:"orderedBefore:"];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v16 = [v15 reverseObjectEnumerator];
    id v17 = [v16 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v24;
      while (2)
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v24 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = [(CRLInteractiveCanvasController *)self repForLayout:*(void *)(*((void *)&v23 + 1) + 8 * i)];
          if (v21)
          {
            BOOL v12 = (void *)v21;
            goto LABEL_27;
          }
        }
        id v18 = [v16 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v18) {
          continue;
        }
        break;
      }
    }
    BOOL v12 = 0;
LABEL_27:
  }

  return v12;
}

- (id)repForInfo:(id)a3
{
  return [(CRLInteractiveCanvasController *)self repForInfo:a3 createIfNeeded:0];
}

- (id)p_repForLayout:(id)a3 createIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = [(CRLCanvas *)self->mCanvas repForLayout:v6];
    if (v7) {
      BOOL v8 = 1;
    }
    else {
      BOOL v8 = !v4;
    }
    if (!v8)
    {
      [(CRLInteractiveCanvasController *)self layoutIfNeeded];
      uint64_t v7 = [(CRLCanvas *)self->mCanvas repForLayout:v6];
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)repForLayout:(id)a3
{
  return [(CRLInteractiveCanvasController *)self p_repForLayout:a3 createIfNeeded:0];
}

- (id)renderableForRep:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLInteractiveCanvasController *)self i_interactiveCanvasLayerHelper];
  id v6 = [v5 renderableForRep:v4];

  return v6;
}

- (id)containerRenderablesForRep:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLInteractiveCanvasController *)self i_interactiveCanvasLayerHelper];

  if (!v5)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F3918);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A8294();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F3938);
    }
    id v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v6);
    }
    uint64_t v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController containerRenderablesForRep:]");
    BOOL v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 3978, 0, "invalid nil value for '%{public}s'", "self.i_interactiveCanvasLayerHelper");
  }
  int v9 = [(CRLInteractiveCanvasController *)self i_interactiveCanvasLayerHelper];
  uint64_t v10 = [v9 containerRenderablesForRep:v4];

  return v10;
}

- (void)recreateAllLayoutsAndReps
{
  [(CRLInteractiveCanvasController *)self endEditing];
  uint64_t v3 = [(CRLCanvasEditor *)self->mCanvasEditor selectionPathWithInfos:0];
  id v4 = [(CRLInteractiveCanvasController *)self editorController];
  [v4 setSelectionPath:v3];

  mCanvas = self->mCanvas;

  [(CRLCanvas *)mCanvas recreateAllLayoutsAndReps];
}

- (void)discardRepForClassChange:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 parentRep];
    uint64_t v7 = v6;
    if (v6)
    {
      if ([v6 conformsToProtocol:&OBJC_PROTOCOL___CRLCanvasMutableContainerRep])
      {
        [v7 removeChildRep:v5];
      }
      else
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014F3998);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_1010A83BC();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014F39B8);
        }
        uint64_t v10 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10106590C(v10);
        }
        int v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController discardRepForClassChange:]");
        BOOL v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"];
        +[CRLAssertionHandler handleFailureInFunction:v11 file:v12 lineNumber:4019 isFatal:0 description:"couldn't remove rep from parent"];
      }
    }
    double v13 = [(CRLInteractiveCanvasController *)self canvas];
    [v13 i_unregisterRep:v5];

    [(CRLInteractiveCanvasController *)self layoutInvalidated];
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F3958);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A8328();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F3978);
    }
    BOOL v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v8);
    }
    uint64_t v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController discardRepForClassChange:]");
    int v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v9, 4009, 0, "invalid nil value for '%{public}s'", "rep");
  }
}

- (BOOL)allowedToEditMask
{
  return 1;
}

- (id)repsToHide
{
  uint64_t v3 = objc_opt_new();
  if ([(NSSet *)self->mRepsToHideForCurrentTracker count]) {
    [v3 unionSet:self->mRepsToHideForCurrentTracker];
  }

  return v3;
}

- (_TtC8Freeform24CRLMultiselectResizeInfo)multiselectResizeInfo
{
  return self->mMultiselectResizeInfo;
}

- (CGRect)visibleBoundsRect
{
  [(CRLInteractiveCanvasController *)self p_visibleBoundsRectUsingSizeOfEnclosingScrollView:0 respectObscuredFrame:1 respectSafeArea:0 respectObscuringRects:1 respectAreaPastScollViewLimit:0];
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (CGRect)visibleBoundsRectUsingSizeOfEnclosingScrollView
{
  [(CRLInteractiveCanvasController *)self p_visibleBoundsRectUsingSizeOfEnclosingScrollView:1 respectObscuredFrame:1 respectSafeArea:0 respectObscuringRects:0 respectAreaPastScollViewLimit:0];
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (CGRect)visibleBoundsRectIgnoringLimit
{
  [(CRLInteractiveCanvasController *)self p_visibleBoundsRectUsingSizeOfEnclosingScrollView:0 respectObscuredFrame:1 respectSafeArea:0 respectObscuringRects:1 respectAreaPastScollViewLimit:1];
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (CGRect)p_visibleBoundsRectUsingSizeOfEnclosingScrollView:(BOOL)a3 respectObscuredFrame:(BOOL)a4 respectSafeArea:(BOOL)a5 respectObscuringRects:(BOOL)a6 respectAreaPastScollViewLimit:(BOOL)a7
{
  BOOL v7 = a6;
  BOOL v8 = a5;
  uint64_t v11 = objc_opt_class();
  BOOL v12 = [(CRLInteractiveCanvasController *)self layerHost];
  double v13 = [v12 canvasView];
  long long v14 = [v13 enclosingScrollView];
  long long v15 = sub_1002469D0(v11, v14);

  long long v16 = [(CRLInteractiveCanvasController *)self layerHost];
  id v17 = [v16 canvasLayer];

  if (!v17)
  {
    double x = CGRectInfinite.origin.x;
    double y = CGRectInfinite.origin.y;
    double width = CGRectInfinite.size.width;
    double height = CGRectInfinite.size.height;
    goto LABEL_15;
  }
  id v18 = [(CRLInteractiveCanvasController *)self layerHost];
  uint64_t v19 = [v18 canvasView];
  uint64_t v20 = [v19 window];
  uint64_t v21 = [v20 layer];

  [v17 bounds];
  double x = v22;
  double y = v24;
  double width = v26;
  double height = v28;
  double v30 = [v15 layer];
  if (a3 || ([v15 window], CGFloat v31 = objc_claimAutoreleasedReturnValue(), v31, !v31))
  {
    [v30 bounds];
    id v37 = [(CRLInteractiveCanvasController *)self p_sizeOfScrollViewEnclosingCanvasForVisibleCanvasCalculations];
    Freeform::SyncEvent::FetchedRecordZoneChanges::Deletion v81 = SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)((CKRecordID)v37, v38);
    CGFloat v40 = v39;
    CGFloat v42 = v41;
    CGFloat v44 = v43;
    CGFloat v46 = v45;
    if (!v8) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  uint64_t v32 = [v15 contentView];
  if (v7) {
    [(CRLInteractiveCanvasController *)self unobscuredScrollViewFrame];
  }
  else {
    [(CRLInteractiveCanvasController *)self p_unobscuredScrollViewFrameIgnoringObscuringRectangles];
  }
  double v72 = v33;
  double v73 = v34;
  double v74 = v35;
  double v75 = v36;
  long long v76 = [v15 superview];
  [v32 convertRect:v76 fromView:v72];
  CGFloat v40 = v77;
  CGFloat v42 = v78;
  CGFloat v44 = v79;
  CGFloat v46 = v80;

  if (v8)
  {
LABEL_7:
    [(CRLInteractiveCanvasController *)self p_safeAreaLayoutGuideLayoutFrame];
    v89.origin.double x = v47;
    v89.origin.double y = v48;
    v89.size.double width = v49;
    v89.size.double height = v50;
    v82.origin.double x = v40;
    v82.origin.double y = v42;
    v82.size.double width = v44;
    v82.size.double height = v46;
    CGRect v83 = CGRectIntersection(v82, v89);
    CGFloat v40 = v83.origin.x;
    CGFloat v42 = v83.origin.y;
    CGFloat v44 = v83.size.width;
    CGFloat v46 = v83.size.height;
  }
LABEL_8:
  if (v30)
  {
    [v30 convertRect:v17 fromLayer:x, y, width, height];
    v90.origin.double x = v40;
    v90.origin.double y = v42;
    v90.size.double width = v44;
    v90.size.double height = v46;
    CGRect v85 = CGRectIntersection(v84, v90);
    id v51 = v30;
LABEL_13:
    [v51 convertRect:v17 toLayer:v85.origin.x, v85.origin.y, v85.size.width, v85.size.height];
    double x = v64;
    double y = v65;
    double width = v66;
    double height = v67;
    goto LABEL_14;
  }
  if (v21)
  {
    [v21 convertRect:v17 fromLayer:x, y, width, height];
    CGFloat v53 = v52;
    CGFloat v55 = v54;
    CGFloat v57 = v56;
    CGFloat v59 = v58;
    [v21 bounds];
    v91.origin.double x = v60;
    v91.origin.double y = v61;
    v91.size.double width = v62;
    v91.size.double height = v63;
    v86.origin.double x = v53;
    v86.origin.double y = v55;
    v86.size.double width = v57;
    v86.size.double height = v59;
    CGRect v85 = CGRectIntersection(v86, v91);
    id v51 = v21;
    goto LABEL_13;
  }
LABEL_14:

LABEL_15:
  v87.origin.double x = x;
  v87.origin.double y = y;
  v87.size.double width = width;
  v87.size.double height = height;
  if (CGRectIsNull(v87))
  {
    double x = CGRectZero.origin.x;
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
  }

  double v68 = x;
  double v69 = y;
  double v70 = width;
  double v71 = height;
  result.size.double height = v71;
  result.size.double width = v70;
  result.origin.double y = v69;
  result.origin.double x = v68;
  return result;
}

- (CGRect)visibleBoundsRectForTiling
{
  if (self->mShouldLayoutOffscreenContentForZoomAnimation)
  {
    -[CRLInteractiveCanvasController convertUnscaledToBoundsRect:](self, "convertUnscaledToBoundsRect:", self->mPreviewVisibleUnscaledRectForTiling.origin.x, self->mPreviewVisibleUnscaledRectForTiling.origin.y, self->mPreviewVisibleUnscaledRectForTiling.size.width, self->mPreviewVisibleUnscaledRectForTiling.size.height);
  }
  else
  {
    [(CRLInteractiveCanvasController *)self p_visibleBoundsRectForTiling];
    if (CGRectIsNull(v7))
    {
      [(CRLInteractiveCanvasController *)self p_calculateVisibleBoundsRectForTiling];
      -[CRLInteractiveCanvasController setP_visibleBoundsRectForTiling:](self, "setP_visibleBoundsRectForTiling:");
    }
    [(CRLInteractiveCanvasController *)self p_visibleBoundsRectForTiling];
  }
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (CGRect)i_visibleBoundsRectForHitTestingCanvasView
{
  [(CRLInteractiveCanvasController *)self p_visibleBoundsRectUsingSizeOfEnclosingScrollView:0 respectObscuredFrame:1 respectSafeArea:0 respectObscuringRects:0 respectAreaPastScollViewLimit:0];
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (CGRect)p_calculateVisibleBoundsRectForTiling
{
  [(CRLInteractiveCanvasController *)self p_visibleBoundsRectUsingSizeOfEnclosingScrollView:1 respectObscuredFrame:0 respectSafeArea:0 respectObscuringRects:0 respectAreaPastScollViewLimit:0];
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (CGRect)visibleUnscaledRect
{
  [(CRLInteractiveCanvasController *)self p_visibleUnscaledRect];
  if (CGRectIsNull(v8))
  {
    [(CRLInteractiveCanvasController *)self p_calculateVisibleUnscaledRect];
    -[CRLInteractiveCanvasController setP_visibleUnscaledRect:](self, "setP_visibleUnscaledRect:");
  }

  [(CRLInteractiveCanvasController *)self p_visibleUnscaledRect];
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (CGRect)visibleUnscaledRectIgnoringLimit
{
  [(CRLInteractiveCanvasController *)self visibleBoundsRectIgnoringLimit];

  -[CRLInteractiveCanvasController convertBoundsToUnscaledRect:](self, "convertBoundsToUnscaledRect:");
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (CGRect)p_calculateVisibleUnscaledRect
{
  [(CRLInteractiveCanvasController *)self visibleBoundsRect];

  -[CRLInteractiveCanvasController convertBoundsToUnscaledRect:](self, "convertBoundsToUnscaledRect:");
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
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  CGRect v7 = [(CRLInteractiveCanvasController *)self canvas];
  [v7 convertUnscaledToBoundsRect:x, y, width, height];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.size.double height = v19;
  result.size.double width = v18;
  result.origin.double y = v17;
  result.origin.double x = v16;
  return result;
}

- (CGRect)convertBoundsToUnscaledRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  CGRect v7 = [(CRLInteractiveCanvasController *)self canvas];
  [v7 convertBoundsToUnscaledRect:x, y, width, height];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.size.double height = v19;
  result.size.double width = v18;
  result.origin.double y = v17;
  result.origin.double x = v16;
  return result;
}

- (CGPoint)convertUnscaledToBoundsPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v5 = [(CRLInteractiveCanvasController *)self canvas];
  [v5 convertUnscaledToBoundsPoint:x, y];
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double y = v11;
  result.double x = v10;
  return result;
}

- (CGPoint)convertBoundsToUnscaledPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v5 = [(CRLInteractiveCanvasController *)self canvas];
  [v5 convertBoundsToUnscaledPoint:x, y];
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double y = v11;
  result.double x = v10;
  return result;
}

- (CGSize)convertUnscaledToBoundsSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v5 = [(CRLInteractiveCanvasController *)self canvas];
  [v5 convertUnscaledToBoundsSize:width, height];
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (CGSize)convertBoundsToUnscaledSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v5 = [(CRLInteractiveCanvasController *)self canvas];
  [v5 convertBoundsToUnscaledSize:width, height];
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (CGRect)growUnscaledCanvasLayerRect:(CGRect)a3 withViewScale:(double)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if ([(CRLInteractiveCanvasController *)self shouldCanvasScrollingSizeGrowToFitBoardContent])
  {
    if (!self->mHasCanvasEverLaidOut) {
      [(CRLInteractiveCanvasController *)self layoutIfNeeded];
    }
    [(CRLCanvas *)self->mCanvas unscaledRectOfLayouts];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v17 = [(CRLInteractiveCanvasController *)self board];
    double v18 = [v17 sceneInfos];

    long long v91 = 0u;
    long long v92 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    id v19 = v18;
    id v20 = [v19 countByEnumeratingWithState:&v89 objects:v93 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v90;
      do
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v90 != v22) {
            objc_enumerationMutation(v19);
          }
          [*(id *)(*((void *)&v89 + 1) + 8 * i) savedUnscaledRect];
          double v25 = v24;
          double v27 = v26;
          double v30 = sub_100065738(v28, v29, v24, v26);
          double v32 = v31;
          [(CRLInteractiveCanvasController *)self visibleUnscaledRect];
          double v35 = sub_100066FC4(v25, v27, v33, v34);
          double v36 = sub_10006402C(v30, v32, v35);
          double v10 = sub_100064F28(v10, v12, v14, v16, v36, v37, v38, v39);
          double v12 = v40;
          double v14 = v41;
          double v16 = v42;
        }
        id v21 = [v19 countByEnumeratingWithState:&v89 objects:v93 count:16];
      }
      while (v21);
    }

    v94.origin.CGFloat x = v10;
    v94.origin.CGFloat y = v12;
    v94.size.CGFloat width = v14;
    v94.size.CGFloat height = v16;
    CGRect v107 = CGRectInset(v94, -1194.0, -1194.0);
    CGRect v95 = CGRectUnion(v88, v107);
    CGFloat v43 = v95.origin.x;
    CGFloat v44 = v95.origin.y;
    CGFloat v45 = v95.size.width;
    CGFloat v46 = v95.size.height;
    if ([(CRLInteractiveCanvasController *)self isInDynamicOperation])
    {
      v96.origin.CGFloat x = v43;
      v96.origin.CGFloat y = v44;
      v96.size.CGFloat width = v45;
      v96.size.CGFloat height = v46;
      CGRect v97 = CGRectUnion(v96, self->mUnscaledRectToGrowCanvasDuringDynamicOperation);
      CGFloat v43 = v97.origin.x;
      CGFloat v44 = v97.origin.y;
      CGFloat v45 = v97.size.width;
      CGFloat v46 = v97.size.height;
    }
    [(CRLInteractiveCanvasController *)self visibleUnscaledRect];
    v108.origin.CGFloat x = v47;
    v108.origin.CGFloat y = v48;
    v108.size.CGFloat width = v49;
    v108.size.CGFloat height = v50;
    v98.origin.CGFloat x = v43;
    v98.origin.CGFloat y = v44;
    v98.size.CGFloat width = v45;
    v98.size.CGFloat height = v46;
    CGRect v99 = CGRectUnion(v98, v108);
    CGFloat v51 = v99.origin.x;
    CGFloat v52 = v99.origin.y;
    CGFloat v53 = v99.size.width;
    CGFloat v54 = v99.size.height;
    CGFloat v55 = [(CRLInteractiveCanvasController *)self layerHost];
    [v55 rectToIncludeWhenGrowingCanvasToFitContent];
    v109.origin.CGFloat x = v56;
    v109.origin.CGFloat y = v57;
    v109.size.CGFloat width = v58;
    v109.size.CGFloat height = v59;
    v100.origin.CGFloat x = v51;
    v100.origin.CGFloat y = v52;
    v100.size.CGFloat width = v53;
    v100.size.CGFloat height = v54;
    CGRect v101 = CGRectUnion(v100, v109);
    CGFloat v60 = v101.origin.x;
    CGFloat v61 = v101.origin.y;
    CGFloat v62 = v101.size.width;
    CGFloat v63 = v101.size.height;

    v102.origin.CGFloat x = v60;
    v102.origin.CGFloat y = v61;
    v102.size.CGFloat width = v62;
    v102.size.CGFloat height = v63;
    CGRect v103 = CGRectUnion(v102, self->mRectToIncludeWhenGrowingCanvasToFitContent);
    CGFloat x = v103.origin.x;
    CGFloat y = v103.origin.y;
    CGFloat width = v103.size.width;
    CGFloat height = v103.size.height;
    if ([(CRLInteractiveCanvasController *)self isInDynamicOperation])
    {
      self->mUnscaledRectToGrowCanvasDuringDynamicOperation.origin.CGFloat x = x;
      self->mUnscaledRectToGrowCanvasDuringDynamicOperation.origin.CGFloat y = y;
      self->mUnscaledRectToGrowCanvasDuringDynamicOperation.size.CGFloat width = width;
      self->mUnscaledRectToGrowCanvasDuringDynamicOperation.size.CGFloat height = height;
    }
    goto LABEL_22;
  }
  id v19 = [(CRLInteractiveCanvasController *)self canvas];
  if ([v19 isAnchoredAtRight])
  {

LABEL_19:
    if (!self->mDynamicallyZooming)
    {
      [(CRLInteractiveCanvasController *)self visibleUnscaledRect];
      double v66 = v65;
      uint64_t v68 = v67;
      double v70 = v69;
      uint64_t v72 = v71;
      double v73 = [(CRLInteractiveCanvasController *)self canvas];
      unsigned int v74 = [v73 isAnchoredAtRight];

      double v75 = v66;
      uint64_t v76 = v68;
      double v77 = v70;
      uint64_t v78 = v72;
      if (v74)
      {
        double v79 = v70 - fmax(CGRectGetMaxX(*(CGRect *)&v75), 0.0);
      }
      else
      {
        double MinX = CGRectGetMinX(*(CGRect *)&v75);
        if (MinX >= 0.0) {
          double MinX = -0.0;
        }
        else {
          double v66 = 0.0;
        }
        double v79 = v70 + MinX;
      }
      uint64_t v85 = 0;
      double v86 = 1.0;
      v104.origin.CGFloat x = x;
      v104.origin.CGFloat y = y;
      v104.size.CGFloat width = width;
      v104.size.CGFloat height = height;
      double v87 = v66;
      CGRect v105 = CGRectUnion(v104, *(CGRect *)(&v79 - 2));
      CGFloat x = v105.origin.x;
      CGFloat y = v105.origin.y;
      CGFloat width = v105.size.width;
      CGFloat height = v105.size.height;
    }
    goto LABEL_23;
  }
  if (![(CRLInteractiveCanvasController *)self resizeCanvasOnLayout])
  {
LABEL_22:

    goto LABEL_23;
  }
  char v64 = sub_1003E86EC();

  if (v64) {
    goto LABEL_19;
  }
LABEL_23:
  double v80 = x;
  double v81 = y;
  double v82 = width;
  double v83 = height;
  result.size.CGFloat height = v83;
  result.size.CGFloat width = v82;
  result.origin.CGFloat y = v81;
  result.origin.CGFloat x = v80;
  return result;
}

- (BOOL)i_shouldAttemptToPreserveContentOffsetAfterFixFrame
{
  if ([(CRLInteractiveCanvasController *)self shouldCanvasScrollingSizeGrowToFitBoardContent])
  {
    LOBYTE(v3) = !self->mDynamicallyZooming;
  }
  else
  {
    BOOL v3 = [(CRLInteractiveCanvasController *)self resizeCanvasOnLayout];
    if (v3)
    {
      if (sub_1003E86EC())
      {
        LOBYTE(v3) = 1;
      }
      else
      {
        double v4 = [(CRLInteractiveCanvasController *)self canvas];
        unsigned __int8 v5 = [v4 isAnchoredAtRight];

        LOBYTE(v3) = v5;
      }
    }
  }
  return v3;
}

- (id)unitFormatter
{
  mUnitFormatter = self->mUnitFormatter;
  if (!mUnitFormatter)
  {
    double v4 = +[CRLRulerUnits instance];
    unsigned __int8 v5 = [v4 formatter:0 lenient:0];
    double v6 = self->mUnitFormatter;
    self->mUnitFormatter = v5;

    mUnitFormatter = self->mUnitFormatter;
  }

  return mUnitFormatter;
}

- (id)numberFormatter
{
  mNumberFormatter = self->mNumberFormatter;
  if (!mNumberFormatter)
  {
    double v4 = (NSNumberFormatter *)objc_alloc_init((Class)NSNumberFormatter);
    unsigned __int8 v5 = self->mNumberFormatter;
    self->mNumberFormatter = v4;

    mNumberFormatter = self->mNumberFormatter;
  }

  return mNumberFormatter;
}

- (id)unitStringForPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = +[CRLRulerUnits instance];
  double v7 = [(CRLInteractiveCanvasController *)self unitFormatter];
  [v6 convertPointsToRulerUnits:x];
  double v9 = v8;
  [v6 convertPointsToRulerUnits:y];
  double v11 = v10;
  id v12 = objc_alloc((Class)NSNumber);
  *(float *)&double v13 = v9;
  id v14 = [v12 initWithFloat:v13];
  id v15 = objc_alloc((Class)NSNumber);
  *(float *)&double v16 = v11;
  id v17 = [v15 initWithFloat:v16];
  double v18 = [v7 stringForObjectValue:v14];
  id v19 = [v7 stringForObjectValue:v17];
  id v20 = +[NSBundle mainBundle];
  id v21 = [v20 localizedStringForKey:@"x: %@  y: %@" value:0 table:0];
  uint64_t v22 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v21, v18, v19);

  return v22;
}

- (id)unitStringForSize:(CGSize)a3 forAccessibility:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.height;
  double width = a3.width;
  double v8 = +[CRLRulerUnits instance];
  double v9 = [(CRLInteractiveCanvasController *)self unitFormatter];
  id v10 = objc_alloc((Class)NSNumber);
  [v8 convertPointsToRulerUnits:width];
  *(float *)&double v11 = v11;
  id v12 = [v10 initWithFloat:v11];
  id v13 = objc_alloc((Class)NSNumber);
  [v8 convertPointsToRulerUnits:height];
  *(float *)&double v14 = v14;
  id v15 = [v13 initWithFloat:v14];
  double v16 = [v9 stringForObjectValue:v12];
  id v17 = [v9 stringForObjectValue:v15];
  double v18 = +[NSBundle mainBundle];
  id v19 = v18;
  if (v4) {
    CFStringRef v20 = @"width %@, height %@";
  }
  else {
    CFStringRef v20 = @"w: %@  h: %@";
  }
  id v21 = [v18 localizedStringForKey:v20 value:0 table:0];
  uint64_t v22 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v21, v16, v17);

  return v22;
}

- (id)unitStringForNumber:(double)a3
{
  unsigned __int8 v5 = +[CRLRulerUnits instance];
  double v6 = [(CRLInteractiveCanvasController *)self unitFormatter];
  id v7 = objc_alloc((Class)NSNumber);
  [v5 convertPointsToRulerUnits:a3];
  *(float *)&double v8 = v8;
  id v9 = [v7 initWithFloat:v8];
  id v10 = [v6 stringForObjectValue:v9];
  double v11 = +[NSBundle mainBundle];
  id v12 = [v11 localizedStringForKey:@"%@" value:0 table:0];
  id v13 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v12, v10);

  return v13;
}

- (id)unitStringForAngle:(double)a3
{
  BOOL v4 = [(CRLInteractiveCanvasController *)self numberFormatter];
  [v4 setMaximumFractionDigits:1];
  [v4 setPositiveFormat:@"##0.#"];
  unsigned __int8 v5 = +[NSBundle mainBundle];
  double v6 = [v5 localizedStringForKey:@"%@°" value:0 table:0];
  sub_100065C2C(a3);
  id v7 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  double v8 = [v4 stringFromNumber:v7];
  id v9 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v6, v8);

  return v9;
}

- (id)unitStringForAngle:(double)a3 shouldNormalize:(BOOL)a4
{
  if (a4)
  {
    unsigned __int8 v5 = [(CRLInteractiveCanvasController *)self unitStringForAngle:a3];
  }
  else
  {
    double v6 = [(CRLInteractiveCanvasController *)self numberFormatter];
    [v6 setMaximumFractionDigits:1];
    [v6 setPositiveFormat:@"##0.#"];
    id v7 = +[NSBundle mainBundle];
    double v8 = [v7 localizedStringForKey:@"%@°" value:0 table:0];
    id v9 = +[NSNumber numberWithDouble:a3];
    id v10 = [v6 stringFromNumber:v9];
    unsigned __int8 v5 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v8, v10);
  }

  return v5;
}

- (id)unitStringForAngle:(double)a3 andLength:(double)a4
{
  id v7 = +[CRLRulerUnits instance];
  double v8 = [(CRLInteractiveCanvasController *)self unitFormatter];
  id v9 = objc_alloc((Class)NSNumber);
  [v7 convertPointsToRulerUnits:a4];
  *(float *)&double v10 = v10;
  id v11 = [v9 initWithFloat:v10];
  id v12 = [v8 stringForObjectValue:v11];
  id v13 = +[NSBundle mainBundle];
  double v14 = [v13 localizedStringForKey:@"%@  l: %@" value:0 table:0];
  id v15 = [(CRLInteractiveCanvasController *)self unitStringForAngle:a3];
  double v16 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v14, v15, v12);

  return v16;
}

- (CRLCanvasContainerRep)topLevelContainerRepForEditing
{
  BOOL v3 = [(CRLInteractiveCanvasController *)self topLevelContainerInfoForEditing];
  BOOL v4 = (objc_class *)objc_opt_class();
  double v10 = sub_100246E2C(v3, v4, 1, v5, v6, v7, v8, v9, (uint64_t)&OBJC_PROTOCOL___CRLCanvasElementInfo);

  if (v10)
  {
    id v11 = [(CRLInteractiveCanvasController *)self repForInfo:v10];
    uint64_t v12 = objc_opt_class();
    double v18 = sub_100246DEC(v11, v12, 1, v13, v14, v15, v16, v17, (uint64_t)&OBJC_PROTOCOL___CRLCanvasContainerRep);
  }
  else
  {
    double v18 = 0;
  }

  return (CRLCanvasContainerRep *)v18;
}

- (CRLContainerInfo)topLevelContainerInfoForEditing
{
  BOOL v3 = [(CRLInteractiveCanvasController *)self selectionModelTranslator];
  BOOL v4 = [(CRLInteractiveCanvasController *)self editorController];
  uint64_t v5 = [v4 selectionPath];
  uint64_t v6 = [v3 containerToInsertIntoForSelectionPath:v5];

  if (v6)
  {
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = sub_1002469D0(v7, v6);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return (CRLContainerInfo *)v8;
}

- (NSArray)topLevelRepsForHitTesting
{
  unsigned int v3 = [(CRLInteractiveCanvasController *)self hasSelectedInfosInMultipleContainers];
  BOOL v4 = [(CRLInteractiveCanvasController *)self freehandDrawingToolkit];
  unsigned __int8 v5 = [v4 isInDrawingMode];

  if ((v5 & 1) != 0 || v3)
  {
    uint64_t v16 = [(CRLCanvas *)self->mCanvas allRepsOrdered];
    uint64_t v7 = [v16 crl_arrayOfObjectsPassingTest:&stru_1014F39D8];
  }
  else
  {
    uint64_t v6 = [(CRLInteractiveCanvasController *)self topLevelContainerRepForEditing];
    if (v6)
    {
      uint64_t v7 = +[NSMutableArray array];
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      uint64_t v8 = [v6 childReps];
      id v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v19;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v19 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = [*(id *)(*((void *)&v18 + 1) + 8 * i) info];
            uint64_t v14 = [(CRLInteractiveCanvasController *)self repsForInfo:v13];
            uint64_t v15 = [v14 allObjects];
            [v7 addObjectsFromArray:v15];
          }
          id v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v10);
      }
    }
    else
    {
      uint64_t v7 = [(CRLCanvas *)self->mCanvas topLevelReps];
    }
  }

  return (NSArray *)v7;
}

+ (double)smallRepOutsetForHitTestingWithPrecision:(BOOL)a3
{
  double result = 20.0;
  if (a3) {
    return 2.0;
  }
  return result;
}

- (id)hitRep:(CGPoint)a3 withPrecision:(BOOL)a4 passingTest:(id)a5
{
  BOOL v5 = a4;
  double y = a3.y;
  double x = a3.x;
  id v9 = a5;
  id v10 = [(CRLInteractiveCanvasController *)self canvas];
  uint64_t v11 = [(CRLInteractiveCanvasController *)self topLevelRepsForHitTesting];
  [(id)objc_opt_class() smallRepOutsetForHitTestingWithPrecision:v5];
  uint64_t v13 = [v10 hitRep:v5 withPrecision:v11 inTopLevelReps:0 smallRepOutset:v9 unscaledPointTransformForRep:x y:y passingTest:v12];

  return v13;
}

- (id)hitRep:(CGPoint)a3 passingTest:(id)a4
{
  return -[CRLInteractiveCanvasController hitRep:withPrecision:passingTest:](self, "hitRep:withPrecision:passingTest:", 0, a4, a3.x, a3.y);
}

- (id)hitRep:(CGPoint)a3 withPrecision:(BOOL)a4
{
  return -[CRLInteractiveCanvasController hitRep:withPrecision:passingTest:](self, "hitRep:withPrecision:passingTest:", a4, 0, a3.x, a3.y);
}

- (id)hitRep:(CGPoint)a3
{
  return -[CRLInteractiveCanvasController hitRep:withPrecision:](self, "hitRep:withPrecision:", 0, a3.x, a3.y);
}

- (id)hitRepIgnoringClickThrough:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = sub_100396A04;
  uint64_t v14 = sub_100396A14;
  id v15 = 0;
  uint64_t v6 = [(CRLInteractiveCanvasController *)self canvas];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100396A1C;
  v9[3] = &unk_1014D3490;
  v9[4] = self;
  v9[5] = &v10;
  *(CGFloat *)&v9[6] = x;
  *(CGFloat *)&v9[7] = y;
  [v6 i_performBlockWhileIgnoringClickThrough:v9];

  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (id)hitRepsAtPoint:(CGPoint)a3 withSlop:(CGSize)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = +[NSMutableArray array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v8 = [(CRLCanvas *)self->mCanvas topLevelReps];
  id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        [v13 convertNaturalPointFromUnscaledCanvas:x, y];
        uint64_t v14 = [v13 hitReps:withSlop:];
        if (v14) {
          [v7 addObjectsFromArray:v14];
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  return v7;
}

- (void)p_recursiveHitKnobAtPoint:(CGPoint)a3 inputType:(int64_t)a4 inRep:(id)a5 minDistance:(double *)a6 hitKnob:(id *)a7 hitRep:(id *)a8
{
  double y = a3.y;
  double x = a3.x;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v32 = a5;
  uint64_t v14 = [v32 knobs];
  id v15 = [v14 reverseObjectEnumerator];

  id obj = v15;
  id v16 = [v15 countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v40;
    do
    {
      long long v19 = 0;
      do
      {
        if (*(void *)v40 != v18) {
          objc_enumerationMutation(obj);
        }
        long long v20 = *(void **)(*((void *)&v39 + 1) + 8 * (void)v19);
        double v38 = 0.0;
        if (!*a7 || !objc_msgSend(v20, "overlapsWithKnob:"))
        {
          if ((objc_msgSend(v20, "isHitByUnscaledPoint:inputType:returningDistance:", a4, &v38, x, y) & 1) == 0) {
            goto LABEL_14;
          }
LABEL_12:
          double v23 = v38;
          if (v38 >= *a6) {
            goto LABEL_14;
          }
LABEL_13:
          *a6 = v23;
          id v24 = v20;
          *a7 = v24;
          *a8 = [v24 rep];
          goto LABEL_14;
        }
        unsigned __int8 v21 = [*a7 obscuresKnob:v20];
        unsigned int v22 = [v20 obscuresKnob:*a7];
        if ((objc_msgSend(v20, "isHitByUnscaledPoint:inputType:returningDistance:", a4, &v38, x, y) & 1) == 0) {
          goto LABEL_14;
        }
        if (v22)
        {
          double v23 = v38;
          goto LABEL_13;
        }
        if ((v21 & 1) == 0) {
          goto LABEL_12;
        }
LABEL_14:
        long long v19 = (char *)v19 + 1;
      }
      while (v17 != v19);
      id v25 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
      id v17 = v25;
    }
    while (v25);
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  CGFloat v26 = [v32 childReps];
  id v27 = [v26 countByEnumeratingWithState:&v34 objects:v43 count:16];
  if (v27)
  {
    id v28 = v27;
    uint64_t v29 = *(void *)v35;
    do
    {
      for (i = 0; i != v28; i = (char *)i + 1)
      {
        if (*(void *)v35 != v29) {
          objc_enumerationMutation(v26);
        }
        -[CRLInteractiveCanvasController p_recursiveHitKnobAtPoint:inputType:inRep:minDistance:hitKnob:hitRep:](self, "p_recursiveHitKnobAtPoint:inputType:inRep:minDistance:hitKnob:hitRep:", a4, *(void *)(*((void *)&v34 + 1) + 8 * i), a6, a7, a8, x, y);
      }
      id v28 = [v26 countByEnumeratingWithState:&v34 objects:v43 count:16];
    }
    while (v28);
  }
}

- (id)hitKnobAtPoint:(CGPoint)a3 inputType:(int64_t)a4 returningRep:(id *)a5
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v27 = 0x47EFFFFFE0000000;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v9 = [(CRLCanvas *)self->mCanvas topLevelReps];
  id v10 = [v9 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v10)
  {
    id v11 = v10;
    id v12 = 0;
    id v13 = 0;
    uint64_t v14 = *(void *)v24;
    do
    {
      id v15 = 0;
      id v16 = v12;
      id v17 = v13;
      do
      {
        if (*(void *)v24 != v14) {
          objc_enumerationMutation(v9);
        }
        uint64_t v18 = *(void *)(*((void *)&v23 + 1) + 8 * (void)v15);
        id v21 = v16;
        id v22 = v17;
        -[CRLInteractiveCanvasController p_recursiveHitKnobAtPoint:inputType:inRep:minDistance:hitKnob:hitRep:](self, "p_recursiveHitKnobAtPoint:inputType:inRep:minDistance:hitKnob:hitRep:", a4, v18, &v27, &v22, &v21, x, y);
        id v13 = v22;

        id v12 = v21;
        id v15 = (char *)v15 + 1;
        id v16 = v12;
        id v17 = v13;
      }
      while (v11 != v15);
      id v11 = [v9 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v11);
  }
  else
  {
    id v12 = 0;
    id v13 = 0;
  }

  if (a5) {
    *a5 = v12;
  }

  return v13;
}

- (CRLCanvasLayoutController)layoutController
{
  return [(CRLCanvas *)self->mCanvas layoutController];
}

- (id)validatedLayoutForInfo:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CRLInteractiveCanvasController *)self layoutController];
  uint64_t v6 = [v5 validatedLayoutForInfo:v4];

  return v6;
}

- (id)layoutsForInfo:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CRLInteractiveCanvasController *)self layoutController];
  uint64_t v6 = [v5 layoutsForInfo:v4];

  return v6;
}

- (id)layoutsForSelectionPath:(id)a3
{
  id v4 = a3;
  long long v26 = self;
  BOOL v5 = [(CRLInteractiveCanvasController *)self infosForSelectionPath:v4];
  if ([v5 count])
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v23 = v5;
    id obj = v5;
    id v6 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = 0;
      uint64_t v25 = *(void *)v32;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v32 != v25) {
            objc_enumerationMutation(obj);
          }
          id v10 = -[CRLInteractiveCanvasController layoutsForInfo:](v26, "layoutsForInfo:", *(void *)(*((void *)&v31 + 1) + 8 * i), v23);
          id v11 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v10 count]);
          long long v27 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          id v12 = v10;
          id v13 = [v12 countByEnumeratingWithState:&v27 objects:v35 count:16];
          if (v13)
          {
            id v14 = v13;
            uint64_t v15 = *(void *)v28;
            do
            {
              for (j = 0; j != v14; j = (char *)j + 1)
              {
                if (*(void *)v28 != v15) {
                  objc_enumerationMutation(v12);
                }
                id v17 = [*(id *)(*((void *)&v27 + 1) + 8 * (void)j) layoutForSelectionPath:v4];
                if (v17) {
                  [v11 addObject:v17];
                }
              }
              id v14 = [v12 countByEnumeratingWithState:&v27 objects:v35 count:16];
            }
            while (v14);
          }

          if ([v11 count])
          {
            if (!v8)
            {
              uint64_t v8 = +[NSMutableSet set];
            }
            [v8 unionSet:v11];
          }
        }
        id v7 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v7);
    }
    else
    {
      uint64_t v8 = 0;
    }

    BOOL v5 = v23;
  }
  else
  {
    uint64_t v8 = 0;
  }
  id v18 = [v8 copy];
  long long v19 = v18;
  if (v18)
  {
    id v20 = v18;
  }
  else
  {
    id v20 = +[NSSet set];
  }
  id v21 = v20;

  return v21;
}

- (id)layoutForInfo:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CRLInteractiveCanvasController *)self layoutController];
  id v6 = [v5 layoutForInfo:v4];

  return v6;
}

- (id)layoutForSelectionPath:(id)a3
{
  unsigned int v3 = [(CRLInteractiveCanvasController *)self layoutsForSelectionPath:a3];
  id v4 = [v3 anyObject];

  return v4;
}

- (id)layoutsForInfo:(id)a3 intersectingSelectionPath:(id)a4
{
  id v6 = a4;
  id v7 = [(CRLInteractiveCanvasController *)self layoutsForInfo:a3];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100397568;
  v11[3] = &unk_1014F3A00;
  id v12 = v6;
  id v8 = v6;
  id v9 = [v7 objectsPassingTest:v11];

  return v9;
}

- (id)layoutForInfoNearestVisibleRect:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CRLInteractiveCanvasController *)self layoutsForInfo:v4];
  [(CRLInteractiveCanvasController *)self visibleUnscaledRect];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v14 = v5;
  id v15 = [v14 countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v15)
  {
    id v16 = v15;
    double v36 = v11;
    double v37 = v9;
    id v17 = 0;
    uint64_t v18 = *(void *)v41;
    double v39 = INFINITY;
    double v38 = v7;
    double v20 = v11;
    double v19 = v9;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v41 != v18) {
          objc_enumerationMutation(v14);
        }
        id v22 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        [v22 frameInRoot:v36, v37];
        [(CRLInteractiveCanvasController *)self outsetSelectionRect:"outsetSelectionRect:"];
        double v24 = v23;
        double v26 = v25;
        double v28 = v27;
        double v30 = v29;
        double v31 = sub_1000655FC(v23, v25, v27, v29, v7, v19, v20, v13);
        if (v31 == 0.0)
        {
          sub_100065798(v24, v26, v28, v30, v7, v19, v20, v13);
          double v33 = -v32;
        }
        else
        {
          double v33 = v31;
        }
        if (v33 < v39)
        {
          id v34 = v22;

          id v17 = v34;
          double v39 = v33;
        }
        double v7 = v38;
      }
      id v16 = [v14 countByEnumeratingWithState:&v40 objects:v44 count:16];
    }
    while (v16);
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

- (id)layoutForInfoNearestVisibleRect:(id)a3 intersectingSelectionPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(CRLInteractiveCanvasController *)self layoutsForInfo:v6 intersectingSelectionPath:v7];
  [(CRLInteractiveCanvasController *)self visibleUnscaledRect];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v17 = v8;
  id v18 = [v17 countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v18)
  {
    id v19 = v18;
    double v38 = v12;
    double v39 = v10;
    double v20 = 0;
    uint64_t v21 = *(void *)v41;
    double v22 = INFINITY;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v41 != v21) {
          objc_enumerationMutation(v17);
        }
        double v24 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        [v24 rectInRootForSelectionPath:v7];
        [(CRLInteractiveCanvasController *)self outsetSelectionRect:"outsetSelectionRect:"];
        double v26 = v25;
        double v28 = v27;
        double v30 = v29;
        double v32 = v31;
        double v33 = sub_1000655FC(v25, v27, v29, v31, v10, v38, v14, v16);
        if (v33 == 0.0)
        {
          sub_100065798(v26, v28, v30, v32, v10, v38, v14, v16);
          double v35 = -v34;
        }
        else
        {
          double v35 = v33;
        }
        v46.origin.double x = v26;
        v46.origin.double y = v28;
        v46.size.double width = v30;
        v46.size.double height = v32;
        if (!CGRectIsNull(v46) && v35 < v22)
        {
          id v36 = v24;

          double v20 = v36;
          double v22 = v35;
        }
        double v10 = v39;
      }
      id v19 = [v17 countByEnumeratingWithState:&v40 objects:v44 count:16];
    }
    while (v19);
  }
  else
  {
    double v20 = 0;
  }

  return v20;
}

- (id)parentForFreehandDrawingLayoutsAtPoint:(CGPoint)a3
{
  unsigned int v3 = [(CRLInteractiveCanvasController *)self layoutController];
  id v4 = [v3 rootLayout];

  return v4;
}

- (id)mostVisibleParentForFreehandDrawingLayouts
{
  [(CRLInteractiveCanvasController *)self visibleUnscaledRect];
  double v7 = sub_100065738(v3, v4, v5, v6);

  return [(CRLInteractiveCanvasController *)self parentForFreehandDrawingLayoutsAtPoint:v7];
}

- (void)setShouldSuppressFreehandContent:(BOOL)a3
{
  self->_shouldSuppressFreehandContent = a3;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  CGFloat v3 = [(CRLCanvas *)self->mCanvas topLevelReps];
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
        [*(id *)(*((void *)&v8 + 1) + 8 * i) recursivelyPerformSelectorIfImplemented:"suppressionOfFreehandContentDidChange"];
      }
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)layoutIfNeeded
{
  CGFloat v3 = [(CRLInteractiveCanvasController *)self layerHost];
  id v4 = [v3 canvasLayer];
  unsigned __int8 v5 = [v4 isLayoutDisabled];

  if ((v5 & 1) == 0)
  {
    mCanvas = self->mCanvas;
    [(CRLCanvas *)mCanvas i_layoutIfNeeded];
  }
}

- (void)performBlockOnMainThreadAfterLayoutIfNecessary:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = v4;
  if (v4)
  {
    long long v8 = sub_100397D30;
    long long v9 = &unk_1014D0AB0;
    long long v10 = self;
    id v11 = v4;
    if (+[NSThread isMainThread])
    {
      v8((uint64_t)&v7);
    }
    else
    {
      Main = CFRunLoopGetMain();
      CFRunLoopPerformBlock(Main, kCFRunLoopDefaultMode, &v7);
      CFRunLoopWakeUp(Main);
    }
  }
}

- (CALayer)repContainerLayer
{
  double v2 = [(CRLInteractiveCanvasController *)self i_interactiveCanvasLayerHelper];
  CGFloat v3 = [v2 repContainerLayer];

  return (CALayer *)v3;
}

- (NSArray)additionalLayersUnderRepLayers
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

- (CALayer)overlayLayer
{
  double v2 = [(CRLInteractiveCanvasController *)self i_interactiveCanvasLayerHelper];
  CGFloat v3 = [v2 overlayLayer];

  return (CALayer *)v3;
}

- (void)setOverlayLayerSuppressed:(BOOL)a3
{
  if (self->mOverlayLayerSuppressed != a3)
  {
    self->mOverlayLayerSuppressed = a3;
    if (a3)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->mLayerHost);
      unsigned __int8 v5 = [WeakRetained imageHUDController];
      [v5 closeHUDWithAnimation:0];
    }
    [(CRLInteractiveCanvasController *)self layoutInvalidated];
  }
}

- (void)closeOverlays
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mLayerHost);
  id v4 = [WeakRetained imageHUDController];
  [v4 closeHUDWithAnimation:1];

  [(CRLInteractiveCanvasController *)self layoutInvalidated];
}

- (void)addDecorator:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (([(NSMutableArray *)self->mDecorators containsObject:v4] & 1) == 0)
    {
      [(NSMutableArray *)self->mDecorators addObject:v4];
      [(CRLInteractiveCanvasController *)self invalidateLayersForDecorator:v4];
    }
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F3A20);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A8444();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F3A40);
    }
    unsigned __int8 v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    uint64_t v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController addDecorator:]");
    uint64_t v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 4819, 0, "invalid nil value for '%{public}s'", "decorator");
  }
}

- (void)removeDecorator:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if ([(NSMutableArray *)self->mDecorators containsObject:v4])
    {
      [(NSMutableArray *)self->mDecorators removeObject:v4];
      [(CRLInteractiveCanvasController *)self invalidateLayersForDecorator:v4];
      unsigned __int8 v5 = [(CRLInteractiveCanvasController *)self i_interactiveCanvasLayerHelper];
      [v5 decoratorWasRemoved:v4];
    }
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F3A60);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A84D8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F3A80);
    }
    uint64_t v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v6);
    }
    uint64_t v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController removeDecorator:]");
    long long v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 4830, 0, "invalid nil value for '%{public}s'", "decorator");
  }
}

- (NSArray)i_decorators
{
  id v2 = [(NSMutableArray *)self->mDecorators copy];

  return (NSArray *)v2;
}

- (id)p_repsForCollaboratorCursorSelectionPath:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = +[NSMutableSet set];
  if (v4)
  {
    uint64_t v6 = [v4 mostSpecificSelectionOfClass:objc_opt_class()];
    if ((uint64_t)[v6 itemCount] < 2)
    {
      uint64_t v7 = [(CRLInteractiveCanvasController *)self layoutsForSelectionPath:v4];
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v13 = [v7 countByEnumeratingWithState:&v20 objects:v28 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v21;
        do
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v21 != v15) {
              objc_enumerationMutation(v7);
            }
            id v17 = [(CRLInteractiveCanvasController *)self repForLayout:*(void *)(*((void *)&v20 + 1) + 8 * i)];
            if (v17) {
              [v5 addObject:v17];
            }
          }
          id v14 = [v7 countByEnumeratingWithState:&v20 objects:v28 count:16];
        }
        while (v14);
      }
    }
    else
    {
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      uint64_t v7 = [v6 boardItems];
      id v8 = [v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v25;
        do
        {
          for (j = 0; j != v9; j = (char *)j + 1)
          {
            if (*(void *)v25 != v10) {
              objc_enumerationMutation(v7);
            }
            double v12 = [(CRLInteractiveCanvasController *)self repsForInfo:*(void *)(*((void *)&v24 + 1) + 8 * (void)j)];
            [v5 unionSet:v12];
          }
          id v9 = [v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
        }
        while (v9);
      }
    }
  }
  id v18 = [v5 copy];

  return v18;
}

- (id)i_collaboratorPresenceSelectingLayout:(id)a3
{
  id v23 = a3;
  id v4 = [(CRLInteractiveCanvasController *)self collaboratorCursorDelegate];
  id v21 = objc_alloc_init((Class)NSMutableSet);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = [(CRLInteractiveCanvasController *)self currentCollaboratorPresences];
  id v24 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v24)
  {
    uint64_t v5 = *(void *)v26;
    do
    {
      for (i = 0; i != v24; i = (char *)i + 1)
      {
        if (*(void *)v26 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        id v8 = [v4 collaboratorCursorSelectionPathForRenderer:self collaboratorPresence:v7];
        id v9 = [v8 mostSpecificSelectionOfClass:objc_opt_class()];
        uint64_t v10 = v9;
        if (v8)
        {
          if ((uint64_t)[v9 itemCount] < 2)
          {
            id v17 = [(CRLInteractiveCanvasController *)self layoutsForSelectionPath:v8];
            unsigned int v18 = [v17 containsObject:v23];

            if (!v18) {
              goto LABEL_12;
            }
LABEL_11:
            [v21 addObject:v7];
            goto LABEL_12;
          }
          [v10 boardItems];
          uint64_t v11 = v5;
          double v12 = self;
          v14 = id v13 = v4;
          uint64_t v15 = [v23 info];
          unsigned __int8 v16 = [v14 containsObject:v15];

          id v4 = v13;
          self = v12;
          uint64_t v5 = v11;
          if (v16) {
            goto LABEL_11;
          }
        }
LABEL_12:
      }
      id v24 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v24);
  }

  id v19 = [(CRLInteractiveCanvasController *)self p_topCollaboratorPresenceOfPresences:v21];

  return v19;
}

- (id)p_topCollaboratorPresenceOfPresences:(id)a3
{
  id v4 = a3;
  if ((unint64_t)[v4 count] > 1)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v6 = [(CRLInteractiveCanvasController *)self i_decorators];
    uint64_t v7 = [v6 reverseObjectEnumerator];

    id v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v20;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(v7);
          }
          double v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          uint64_t v13 = objc_opt_class();
          id v14 = sub_1002469D0(v13, v12);
          uint64_t v15 = v14;
          if (v14)
          {
            unsigned __int8 v16 = [v14 collaboratorPresence];
            unsigned __int8 v17 = [v4 containsObject:v16];

            if (v17)
            {
              uint64_t v5 = [v15 collaboratorPresence];

              goto LABEL_14;
            }
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = [v4 anyObject];
  }
LABEL_14:

  return v5;
}

- (BOOL)i_shouldShowCollaboratorCursorForLayout:(id)a3
{
  if (self->mLayoutsShowingCollabCursorsDuringLayerUpdate)
  {
    mLayoutsShowingCollabCursorsDuringLayerUpdate = self->mLayoutsShowingCollabCursorsDuringLayerUpdate;
    return [(NSSet *)mLayoutsShowingCollabCursorsDuringLayerUpdate containsObject:a3];
  }
  else
  {
    uint64_t v5 = [(CRLInteractiveCanvasController *)self i_collaboratorPresenceSelectingLayout:a3];
    BOOL v6 = v5 != 0;

    return v6;
  }
}

- (void)p_performBlockWithCachedLayoutsForCollaboratorCursors:(id)a3
{
  id v4 = (void (**)(void))a3;
  [(CRLInteractiveCanvasController *)self p_beginCachingLayoutsForCollaboratorCursors];
  if (v4) {
    v4[2]();
  }
  [(CRLInteractiveCanvasController *)self p_endCachingLayoutsForCollaboratorCursors];
}

- (void)p_beginCachingLayoutsForCollaboratorCursors
{
  CGFloat v3 = +[NSMutableSet set];
  id v4 = [(CRLInteractiveCanvasController *)self collaboratorCursorDelegate];
  if (objc_opt_respondsToSelector())
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v5 = [(CRLInteractiveCanvasController *)self currentCollaboratorPresences];
    id v22 = [v5 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v22)
    {
      uint64_t v6 = *(void *)v28;
      long long v20 = v5;
      long long v21 = v4;
      uint64_t v19 = *(void *)v28;
      do
      {
        for (i = 0; i != v22; i = (char *)i + 1)
        {
          if (*(void *)v28 != v6) {
            objc_enumerationMutation(v5);
          }
          id v8 = [v4 collaboratorCursorSelectionPathForRenderer:self collaboratorPresence:*(void *)(*((void *)&v27 + 1) + 8 * i) v19 v20 v21];
          id v9 = [v8 mostSpecificSelectionOfClass:objc_opt_class()];
          uint64_t v10 = v9;
          if (v8)
          {
            if ((uint64_t)[v9 itemCount] < 2)
            {
              uint64_t v11 = [(CRLInteractiveCanvasController *)self layoutsForSelectionPath:v8];
              [v3 unionSet:v11];
            }
            else
            {
              long long v25 = 0u;
              long long v26 = 0u;
              long long v23 = 0u;
              long long v24 = 0u;
              uint64_t v11 = [v10 boardItems];
              id v12 = [v11 countByEnumeratingWithState:&v23 objects:v31 count:16];
              if (v12)
              {
                id v13 = v12;
                uint64_t v14 = *(void *)v24;
                do
                {
                  for (j = 0; j != v13; j = (char *)j + 1)
                  {
                    if (*(void *)v24 != v14) {
                      objc_enumerationMutation(v11);
                    }
                    unsigned __int8 v16 = [(CRLInteractiveCanvasController *)self layoutsForInfo:*(void *)(*((void *)&v23 + 1) + 8 * (void)j)];
                    [v3 unionSet:v16];
                  }
                  id v13 = [v11 countByEnumeratingWithState:&v23 objects:v31 count:16];
                }
                while (v13);
                uint64_t v5 = v20;
                id v4 = v21;
                uint64_t v6 = v19;
              }
            }
          }
        }
        id v22 = [v5 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v22);
    }
  }
  unsigned __int8 v17 = (NSSet *)[v3 copy];
  mLayoutsShowingCollabCursorsDuringLayerUpdate = self->mLayoutsShowingCollabCursorsDuringLayerUpdate;
  self->mLayoutsShowingCollabCursorsDuringLayerUpdate = v17;
}

- (void)p_endCachingLayoutsForCollaboratorCursors
{
  mLayoutsShowingCollabCursorsDuringLayerUpdate = self->mLayoutsShowingCollabCursorsDuringLayerUpdate;
  self->mLayoutsShowingCollabCursorsDuringLayerUpdate = 0;
}

- (void)collaboratorCursorSelectionPathChangedFromSelectionPath:(id)a3 toSelectionPath:(id)a4 collaboratorPresence:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!self->mCurrentCollaboratorPresences)
  {
    uint64_t v11 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    mCurrentCollaboratorPresences = self->mCurrentCollaboratorPresences;
    self->mCurrentCollaboratorPresences = v11;
  }
  id v13 = self->mCurrentCollaboratorPresences;
  if (v9)
  {
    [(NSMutableSet *)v13 addObject:v10];
    uint64_t v14 = [(CRLInteractiveCanvasController *)self collaboratorCursorDelegate];

    if (!v14)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F3AA0);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010A856C();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F3AC0);
      }
      uint64_t v15 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v15);
      }
      unsigned __int8 v16 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController collaboratorCursorSelectionPathChangedFromSelectionPath:toSelectionPath:collaboratorPresence:]");
      unsigned __int8 v17 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 4967, 0, "invalid nil value for '%{public}s'", "self.collaboratorCursorDelegate");
    }
  }
  else
  {
    [(NSMutableSet *)v13 removeObject:v10];
  }
  self->mCollaboratorCursorsInvalidated = 1;
  unsigned int v18 = [(NSMapTable *)self->mCollaboratorPresenceToCollaboratorHUDControllerDictionary objectForKeyedSubscript:v10];
  if (v18) {
    [(CRLInteractiveCanvasController *)self invalidateLayersForDecorator:v18];
  }
  else {
    [(CRLCanvas *)self->mCanvas i_setLayersInvalidWithoutInvalidatingAnySpecificLayers];
  }

  uint64_t v19 = [(CRLInteractiveCanvasController *)self canvas];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1003990CC;
  v23[3] = &unk_1014EB820;
  v23[4] = self;
  id v24 = v10;
  id v25 = v9;
  id v26 = v8;
  id v20 = v8;
  id v21 = v9;
  id v22 = v10;
  [v19 performBlockAfterLayoutIfNecessary:v23];
}

- (NSSet)currentCollaboratorPresences
{
  return (NSSet *)self->mCurrentCollaboratorPresences;
}

- (BOOL)p_followEnabled
{
  return +[CRLFeatureFlagGroup isFollowEnabled];
}

- (void)scrollToCollaborator:(id)a3 withSelectionPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!+[NSThread isMainThread])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F3B48);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A86B0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F3B68);
    }
    id v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v8);
    }
    id v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController scrollToCollaborator:withSelectionPath:]");
    id v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v9 file:v10 lineNumber:5049 isFatal:0 description:"This operation must only be performed on the main thread."];
  }
  if (![(CRLInteractiveCanvasController *)self p_followEnabled]) {
    goto LABEL_23;
  }
  uint64_t v11 = [(CRLInteractiveCanvasController *)self editingCoordinator];
  id v12 = [v11 followCoordinator];
  id v13 = [v12 followingParticipant];
  uint64_t v14 = [v13 presences];
  unsigned __int8 v15 = [v14 containsObject:v6];

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  unsigned __int8 v16 = [(CRLInteractiveCanvasController *)self editingCoordinator];
  unsigned __int8 v17 = [v16 followCoordinator];
  unsigned int v18 = [v17 participantsFollowingLocalParticipant];

  id v19 = [v18 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v36;
    while (2)
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v36 != v21) {
          objc_enumerationMutation(v18);
        }
        long long v23 = [*(id *)(*((void *)&v35 + 1) + 8 * i) presences];
        unsigned int v24 = [v23 containsObject:v6];

        if (v24)
        {

          goto LABEL_25;
        }
      }
      id v20 = [v18 countByEnumeratingWithState:&v35 objects:v39 count:16];
      if (v20) {
        continue;
      }
      break;
    }
  }

  if ((v15 & 1) == 0)
  {
    id v25 = [(CRLInteractiveCanvasController *)self editingCoordinator];
    id v26 = [v25 followCoordinator];
    [v26 endFollowSessionForLocalParticipantWithShouldShowRefollowPlacard:1];

    long long v27 = [v6 presenceUUID];
    LODWORD(v26) = [(CRLInteractiveCanvasController *)self sendViewportRequestMessageTo:v27];

    if (v26)
    {
      long long v28 = [(CRLInteractiveCanvasController *)self editingCoordinator];
      long long v29 = [v28 followCoordinator];
      long long v30 = [v6 presenceUUID];
      [v29 setExpectingViewportForOneTimeScrollFrom:v30];

      dispatch_time_t v31 = dispatch_time(0, 500000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      void block[2] = sub_100399B34;
      block[3] = &unk_1014CBE50;
      block[4] = self;
      id v33 = v6;
      id v34 = v7;
      dispatch_after(v31, (dispatch_queue_t)&_dispatch_main_q, block);

      goto LABEL_25;
    }
LABEL_23:
    [(CRLInteractiveCanvasController *)self scrollToSelectionPath:v7 scrollOptions:9];
    [(CRLInteractiveCanvasController *)self showCollaboratorHUDForCollaborator:v6 withSelectionPath:v7 allowScroll:1];
  }
LABEL_25:
}

- (void)collapseAllExpandedCollaboratorHUDs
{
  CGFloat v3 = [(CRLInteractiveCanvasController *)self editingCoordinator];
  unsigned int v4 = [v3 enableCollaboratorCursors];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [(NSMapTable *)self->mCollaboratorPresenceToCollaboratorHUDControllerDictionary crl_allObjects];
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    int v9 = v4 ^ 1;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        unsigned int v12 = [v11 shouldAutoHide];
        id v13 = [v11 hudSize];
        if ((v12 | v9) == 1)
        {
          [v11 teardown];
        }
        else if (!v13)
        {
          [(CRLInteractiveCanvasController *)self toggleSizeForCollaboratorHUDController:v11];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
}

- (void)updateCollaboratorHUDForBeginFollowingCollaborator:(id)a3
{
  id v4 = a3;
  if (!+[NSThread isMainThread])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F3B88);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A8738();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F3BA8);
    }
    uint64_t v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    id v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController updateCollaboratorHUDForBeginFollowingCollaborator:]");
    id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:5113 isFatal:0 description:"This operation must only be performed on the main thread."];
  }
  if (![(CRLInteractiveCanvasController *)self suppressesCollaboratorHUD])
  {
    uint64_t v8 = [(CRLInteractiveCanvasController *)self collaboratorCursorDelegate];
    int v9 = [v8 collaboratorCursorSelectionPathForRenderer:self collaboratorPresence:v4];

    id v10 = [v9 orderedSelections];
    uint64_t v11 = [v10 lastObject];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    id v13 = [(CRLInteractiveCanvasController *)self editingCoordinator];
    unsigned int v14 = [v13 enableCollaboratorCursors];

    long long v15 = [(NSMapTable *)self->mCollaboratorPresenceToCollaboratorHUDControllerDictionary objectForKeyedSubscript:v4];
    long long v16 = v15;
    if (v15 && (isKindOfClass & 1) == 0 && v14)
    {
      if (![v15 hudSize]) {
        [(CRLInteractiveCanvasController *)self toggleSizeForCollaboratorHUDController:v16];
      }
    }
    else
    {
      [v15 teardown];
    }
  }
}

- (void)updateCollaboratorHUDForStopFollowingCollaborator:(id)a3
{
  id v4 = a3;
  if (!+[NSThread isMainThread])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F3BC8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A87C0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F3BE8);
    }
    uint64_t v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    id v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController updateCollaboratorHUDForStopFollowingCollaborator:]");
    id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:5136 isFatal:0 description:"This operation must only be performed on the main thread."];
  }
  if (![(CRLInteractiveCanvasController *)self suppressesCollaboratorHUD])
  {
    uint64_t v8 = [(NSMapTable *)self->mCollaboratorPresenceToCollaboratorHUDControllerDictionary objectForKeyedSubscript:v4];
    int v9 = v8;
    if (v8 && ![v8 hudSize]) {
      [(CRLInteractiveCanvasController *)self toggleSizeForCollaboratorHUDController:v9];
    }
  }
}

- (void)showCollaboratorHUDForCollaborator:(id)a3 withSelectionPath:(id)a4 allowScroll:(BOOL)a5
{
}

- (void)p_showCollaboratorHUDForCollaborator:(id)a3 withSelectionPath:(id)a4 allowScroll:(BOOL)a5 hudSize:(unint64_t)a6
{
  uint64_t v7 = a5;
  id v10 = a3;
  id v11 = a4;
  if (!+[NSThread isMainThread])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F3C08);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A88DC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F3C28);
    }
    unsigned int v12 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v12);
    }
    id v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController p_showCollaboratorHUDForCollaborator:withSelectionPath:allowScroll:hudSize:]");
    unsigned int v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v13 file:v14 lineNumber:5154 isFatal:0 description:"This operation must only be performed on the main thread."];
  }
  if (![(CRLInteractiveCanvasController *)self suppressesCollaboratorHUD])
  {
    if (!v11)
    {
      long long v15 = [(CRLInteractiveCanvasController *)self collaboratorCursorDelegate];
      id v11 = [v15 collaboratorCursorSelectionPathForRenderer:self collaboratorPresence:v10];
    }
    long long v16 = [(NSMapTable *)self->mCollaboratorPresenceToCollaboratorHUDControllerDictionary objectForKeyedSubscript:v10];
    if (!v16) {
      goto LABEL_37;
    }
    long long v17 = [v11 orderedSelections];
    unsigned int v18 = [v17 lastObject];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (![(CRLInteractiveCanvasController *)self p_followEnabled]) {
      [v16 setShouldFadeOutUnconditionally:isKindOfClass & 1];
    }
    if ([v16 hudSize] == (id)a6)
    {
      if (![(CRLInteractiveCanvasController *)self p_followEnabled])
      {
        [v16 resetFadeOutTimer];
        goto LABEL_37;
      }
      if (isKindOfClass)
      {
        if ([v16 shouldAutoHide])
        {
          [v16 resetAutoHideTimer];
LABEL_37:
          if ([(NSMapTable *)self->mCollaboratorPresenceToCollaboratorHUDControllerDictionary count])
          {
            unsigned int v32 = v7;
            long long v35 = 0u;
            long long v36 = 0u;
            long long v33 = 0u;
            long long v34 = 0u;
            id v23 = [(NSMapTable *)self->mCollaboratorPresenceToCollaboratorHUDControllerDictionary copy];
            id v24 = [v23 countByEnumeratingWithState:&v33 objects:v37 count:16];
            if (v24)
            {
              id v25 = v24;
              uint64_t v26 = *(void *)v34;
              do
              {
                long long v27 = 0;
                do
                {
                  if (*(void *)v34 != v26) {
                    objc_enumerationMutation(v23);
                  }
                  if (*(id *)(*((void *)&v33 + 1) + 8 * (void)v27) != v10)
                  {
                    long long v28 = -[NSMapTable objectForKeyedSubscript:](self->mCollaboratorPresenceToCollaboratorHUDControllerDictionary, "objectForKeyedSubscript:");
                    if (!((unint64_t)[v28 hudSize] | a6))
                    {
                      if ([(CRLInteractiveCanvasController *)self p_followEnabled]
                        && ![v28 shouldAutoHide])
                      {
                        if ([v28 shouldAutoShrink]) {
                          [(CRLInteractiveCanvasController *)self toggleSizeForCollaboratorHUDController:v28];
                        }
                      }
                      else
                      {
                        [v28 teardown];
                      }
                    }
                  }
                  long long v27 = (char *)v27 + 1;
                }
                while (v25 != v27);
                id v29 = [v23 countByEnumeratingWithState:&v33 objects:v37 count:16];
                id v25 = v29;
              }
              while (v29);
            }

            uint64_t v7 = v32;
          }
          [(CRLInteractiveCanvasController *)self p_collaboratorHUDPositionForSelectionPath:v11 collaboratorPresence:v10 allowScroll:v7 hudSize:a6];
          if (!v16)
          {
            long long v30 = [(NSMapTable *)self->mCollaboratorPresenceToCollaboratorHUDControllerDictionary objectForKeyedSubscript:v10];

            if (v30)
            {
              dispatch_time_t v31 = [(NSMapTable *)self->mCollaboratorPresenceToCollaboratorHUDControllerDictionary objectForKeyedSubscript:v10];
              [v31 teardown];
            }
            long long v16 = 0;
          }

          goto LABEL_60;
        }
      }
      else if ([v16 shouldAutoShrink])
      {
        [v16 resetAutoShrinkTimer];
        goto LABEL_37;
      }
      [v16 teardown];
    }
    else
    {
      [v16 teardown];

      long long v16 = [(NSMapTable *)self->mCollaboratorPresenceToCollaboratorHUDControllerDictionary objectForKeyedSubscript:v10];

      if (!v16) {
        goto LABEL_37;
      }
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F3C48);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010A8848();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F3C68);
      }
      id v20 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v20);
      }
      uint64_t v21 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController p_showCollaboratorHUDForCollaborator:withSelectionPath:allowScroll:hudSize:]");
      id v22 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v21, v22, 5200, 0, "expected nil value for '%{public}s'", "mCollaboratorPresenceToCollaboratorHUDControllerDictionary[collaboratorPresence]");
    }
    long long v16 = 0;
    goto LABEL_37;
  }
LABEL_60:
}

- (void)hideCollaboratorHUDForCollaborator:(id)a3
{
  id v4 = a3;
  if (!+[NSThread isMainThread])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F3C88);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A8964();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F3CA8);
    }
    uint64_t v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    id v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController hideCollaboratorHUDForCollaborator:]");
    uint64_t v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:5258 isFatal:0 description:"This operation must only be performed on the main thread."];
  }
  if (v4)
  {
    uint64_t v8 = [(NSMapTable *)self->mCollaboratorPresenceToCollaboratorHUDControllerDictionary objectForKeyedSubscript:v4];
    int v9 = v8;
    if (v8) {
      [v8 hideHUD];
    }
  }
}

- ($BCFEF2EB514CD33A670EC6D7ECA04AF1)p_collaboratorHUDPositionForSelectionPath:(SEL)a3 collaboratorPresence:(id)a4 allowScroll:(id)a5 hudSize:(BOOL)a6
{
  BOOL v8 = a6;
  id v11 = a4;
  id v12 = a5;
  if (!+[NSThread isMainThread])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F3CC8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A89EC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F3CE8);
    }
    id v13 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v13);
    }
    unsigned int v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController p_collaboratorHUDPositionForSelectionPath:collaboratorPresence:allowScroll:hudSize:]");
    long long v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v14 file:v15 lineNumber:5274 isFatal:0 description:"Should only update HUD on the layout thread."];
  }
  id v16 = [(CRLInteractiveCanvasController *)self p_layoutForShowingCollaboratorCursorHUDAtSelectionPath:v11];
  if (!v16)
  {
    long long v17 = [v11 mostSpecificSelectionOfClass:objc_opt_class()];
    unsigned int v18 = v17;
    if (v17)
    {
      id obj = (id)a7;
      id v179 = v12;
      id v182 = v11;
      long long v199 = 0u;
      long long v200 = 0u;
      long long v197 = 0u;
      long long v198 = 0u;
      id v19 = [v17 boardItems];
      id v20 = [v19 countByEnumeratingWithState:&v197 objects:v215 count:16];
      if (v20)
      {
        id v21 = v20;
        id v16 = 0;
        double x = CGRectZero.origin.x;
        double y = CGRectZero.origin.y;
        uint64_t v24 = *(void *)v198;
        do
        {
          for (i = 0; i != v21; i = (char *)i + 1)
          {
            if (*(void *)v198 != v24) {
              objc_enumerationMutation(v19);
            }
            uint64_t v26 = [(CRLInteractiveCanvasController *)self layoutForInfoNearestVisibleRect:*(void *)(*((void *)&v197 + 1) + 8 * i)];
            long long v27 = v26;
            if (v16)
            {
              [v26 frameInRoot];
              double v30 = v28;
              double v31 = v29;
              if (v29 < y || (v29 == y ? (BOOL v32 = v28 < x) : (BOOL v32 = 0), v32))
              {
                id v33 = v27;

                double y = v31;
                double x = v30;
                id v16 = v33;
              }
            }
            else
            {
              id v16 = v26;
              [v16 frameInRoot];
              double x = v34;
              double y = v35;
            }
          }
          id v21 = [v19 countByEnumeratingWithState:&v197 objects:v215 count:16];
        }
        while (v21);
      }
      else
      {
        id v16 = 0;
      }

      id v11 = v182;
      id v12 = v179;
      a7 = (unint64_t)obj;
    }
    else
    {
      id v16 = 0;
    }
  }
  long long v36 = [(CRLInteractiveCanvasController *)self canvasView];
  long long v37 = [v36 enclosingScrollView];
  if (v8)
  {
    [(CRLInteractiveCanvasController *)self p_scaledRectToScrollToForSelectionPath:v11 shouldCenterVertically:1];
    double v39 = v38;
    double v41 = v40;
    double v43 = v42;
    double v45 = v44;
  }
  else
  {
    [(CRLInteractiveCanvasController *)self unobscuredScrollViewFrame];
    double v47 = v46;
    double v49 = v48;
    double v51 = v50;
    double v53 = v52;
    CGFloat v54 = [v37 superview];
    [v36 convertRect:v54 fromView:v47];
    double v39 = v55;
    double v41 = v56;
    double v43 = v57;
    double v45 = v58;
  }
  [v37 safeAreaInsets];
  -[CRLInteractiveCanvasController convertBoundsToUnscaledRect:](self, "convertBoundsToUnscaledRect:", v39 + v62, v41 + v59, v43 - (v62 + v60), v45 - (v59 + v61));
  CGFloat v64 = v63;
  CGFloat v66 = v65;
  CGFloat v68 = v67;
  CGFloat v70 = v69;
  if (v16)
  {
    mCollaboratorPresenceToCollaboratorHUDControllerDictionaryForFastSizing = self->mCollaboratorPresenceToCollaboratorHUDControllerDictionaryForFastSizing;
    if (!mCollaboratorPresenceToCollaboratorHUDControllerDictionaryForFastSizing)
    {
      uint64_t v72 = (NSMapTable *)[objc_alloc((Class)NSMapTable) initWithKeyOptions:512 valueOptions:0 capacity:0];
      double v73 = self->mCollaboratorPresenceToCollaboratorHUDControllerDictionaryForFastSizing;
      self->mCollaboratorPresenceToCollaboratorHUDControllerDictionaryForFastSizing = v72;

      mCollaboratorPresenceToCollaboratorHUDControllerDictionaryForFastSizing = self->mCollaboratorPresenceToCollaboratorHUDControllerDictionaryForFastSizing;
    }
    double v178 = v36;
    unsigned int v74 = [(NSMapTable *)mCollaboratorPresenceToCollaboratorHUDControllerDictionaryForFastSizing objectForKeyedSubscript:v12];
    double v75 = v74;
    CGFloat v177 = v37;
    id v180 = v12;
    if (!v74
      || [(CRLCollaboratorCursorHUDController *)v74 hudSize] != a7
      || ([(CRLCollaboratorCursorHUDController *)v75 string],
          uint64_t v76 = objc_claimAutoreleasedReturnValue(),
          [v12 displayName],
          double v77 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v78 = [v76 isEqualToString:v77],
          v77,
          v76,
          (v78 & 1) == 0))
    {
      if ([(CRLInteractiveCanvasController *)self p_followEnabled])
      {
        double v79 = [(CRLInteractiveCanvasController *)self editingCoordinator];
        double v80 = [v79 followCoordinator];
        [v80 followingParticipant];
        id objb = (id)a7;
        double v81 = v12;
        double v83 = v82 = v11;
        CGRect v84 = [v81 owner];
        BOOL v85 = v83 == v84;

        double v86 = [(CRLInteractiveCanvasController *)self editingCoordinator];
        double v87 = [v86 followCoordinator];
        CGRect v88 = [v87 localParticipant];
        long long v89 = [v81 owner];
        long long v90 = v75;
        BOOL v91 = v88 == v89;

        id v11 = v82;
        id v12 = v81;

        LOBYTE(v176) = v91;
        long long v92 = [[CRLCollaboratorCursorHUDController alloc] initWithCollaboratorPresence:v81 delegate:self hudSize:objb shouldAutoShrink:0 shouldAutoHide:0 isFollowing:v85 isLocalParticipant:v176];
      }
      else
      {
        double v93 = [CRLCollaboratorCursorHUDController alloc];
        long long v90 = [v12 displayName];
        long long v92 = [(CRLCollaboratorCursorHUDController *)v93 initWithCollaboratorPresence:v12 delegate:self string:v90 hudSize:a7 shouldAutoTimeout:[(CRLInteractiveCanvasController *)self p_shouldTimeoutCollabCursor]];
      }
      [(NSMapTable *)self->mCollaboratorPresenceToCollaboratorHUDControllerDictionaryForFastSizing setObject:v92 forKey:v12];
      double v75 = v92;
    }
    CGRect v94 = [(CRLInteractiveCanvasController *)self layerHost];
    CGRect v95 = [v94 miniFormatterPresenter];
    unsigned int v96 = [v95 isPresentingMiniFormatter];

    CGRect v97 = [(CRLInteractiveCanvasController *)self layerHost];
    CGRect v98 = [v97 miniFormatterPresenter];
    unsigned int v184 = [v98 isPinnedToTopOfRep];

    id v183 = v11;
    [v16 unscaledPositionsForCollaboratorHUDForSelectionPath:v11];
    long long v193 = 0u;
    long long v194 = 0u;
    long long v195 = 0u;
    long long v196 = 0u;
    id v99 = (id)objc_claimAutoreleasedReturnValue();
    id v100 = [v99 countByEnumeratingWithState:&v193 objects:v214 count:16];
    if (v100)
    {
      id v101 = v100;
      uint64_t v102 = *(void *)v194;
      while (2)
      {
        for (j = 0; j != v101; j = (char *)j + 1)
        {
          if (*(void *)v194 != v102) {
            objc_enumerationMutation(v99);
          }
          CGRect v104 = *(void **)(*((void *)&v193 + 1) + 8 * (void)j);
          [v104 position];
          double v106 = v105;
          double v108 = v107;
          [(CRLInteractiveCanvasController *)self viewScale];
          double v110 = sub_1000646A4(v106, v108, v109);
          double v112 = v111;
          if (sub_100067C90())
          {
            unsigned int v124 = +[CRLAssertionHandler _atomicIncrementAssertCount];
            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014F3D08);
            }
            double v125 = off_10166B4A0;
            if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = 67110402;
              unsigned int v203 = v124;
              __int16 v204 = 2082;
              CGRect v205 = "-[CRLInteractiveCanvasController p_collaboratorHUDPositionForSelectionPath:collaboratorPresence:all"
                     "owScroll:hudSize:]";
              __int16 v206 = 2082;
              CGRect v207 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m";
              __int16 v208 = 1024;
              int v209 = 5351;
              __int16 v210 = 2112;
              id v211 = v16;
              __int16 v212 = 2112;
              id v213 = v183;
              _os_log_error_impl((void *)&_mh_execute_header, v125, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Position provided by %@ for selection %@ has NaN components!", buf, 0x36u);
            }
            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014F3D28);
            }
            v126 = off_10166B4A0;
            if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
              sub_10106590C(v126);
            }
            double v127 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController p_collaboratorHUDPositionForSelectionPath:collaboratorPresence:allowScroll:hudSize:]");
            double v128 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"];
            +[CRLAssertionHandler handleFailureInFunction:v127, v128, 5351, 0, "Position provided by %@ for selection %@ has NaN components!", v16, v183 file lineNumber isFatal description];

            goto LABEL_72;
          }
          -[CRLCollaboratorCursorHUDController scaledFrameForHUDAtPoint:withDirection:](v75, "scaledFrameForHUDAtPoint:withDirection:", [v104 direction], v110, v112);
          -[CRLInteractiveCanvasController convertBoundsToUnscaledRect:](self, "convertBoundsToUnscaledRect:");
          CGFloat v114 = v113;
          CGFloat v116 = v115;
          CGFloat v118 = v117;
          CGFloat v120 = v119;
          if (v96)
          {
            id v121 = [v104 direction];
            BOOL v122 = [v104 direction] == (id)1;
            if (v184) {
              BOOL v123 = v121 == (id)2;
            }
            else {
              BOOL v123 = v122;
            }
          }
          else
          {
            BOOL v123 = 0;
          }
          v216.origin.double x = v64;
          v216.origin.double y = v66;
          v216.size.double width = v68;
          v216.size.double height = v70;
          v218.origin.double x = v114;
          v218.origin.double y = v116;
          v218.size.double width = v118;
          v218.size.double height = v120;
          if (CGRectContainsRect(v216, v218) && !v123)
          {
            [v104 position];
            double v155 = v154;
            double v157 = v156;
            id v143 = [v104 direction];

LABEL_104:
            id v11 = v183;
            long long v36 = v178;
            id v12 = v180;
            long long v37 = v177;
            goto LABEL_105;
          }
        }
        id v101 = [v99 countByEnumeratingWithState:&v193 objects:v214 count:16];
        if (v101) {
          continue;
        }
        break;
      }
    }
LABEL_72:
    double v185 = v75;

    long long v191 = 0u;
    long long v192 = 0u;
    long long v189 = 0u;
    long long v190 = 0u;
    id obja = v99;
    id v129 = [obja countByEnumeratingWithState:&v189 objects:v201 count:16];
    if (v129)
    {
      id v130 = v129;
      uint64_t v131 = *(void *)v190;
      if (v184) {
        uint64_t v132 = 2;
      }
      else {
        uint64_t v132 = 1;
      }
      while (2)
      {
        for (k = 0; k != v130; k = (char *)k + 1)
        {
          if (*(void *)v190 != v131) {
            objc_enumerationMutation(obja);
          }
          double v134 = *(void **)(*((void *)&v189 + 1) + 8 * (void)k);
          if ([v134 allowedToFlip])
          {
            [v134 position];
            double v136 = v135;
            double v138 = v137;
            [(CRLInteractiveCanvasController *)self viewScale];
            double v140 = sub_1000646A4(v136, v138, v139);
            double v142 = v141;
            if (sub_100067C90())
            {
              unsigned int v158 = +[CRLAssertionHandler _atomicIncrementAssertCount];
              if (qword_101719A70 != -1) {
                dispatch_once(&qword_101719A70, &stru_1014F3D48);
              }
              CGFloat v159 = off_10166B4A0;
              if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)long long buf = 67110402;
                unsigned int v203 = v158;
                __int16 v204 = 2082;
                CGRect v205 = "-[CRLInteractiveCanvasController p_collaboratorHUDPositionForSelectionPath:collaboratorPresence:a"
                       "llowScroll:hudSize:]";
                __int16 v206 = 2082;
                CGRect v207 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m";
                __int16 v208 = 1024;
                int v209 = 5384;
                __int16 v210 = 2112;
                id v211 = v16;
                __int16 v212 = 2112;
                id v213 = v183;
                _os_log_error_impl((void *)&_mh_execute_header, v159, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Position provided by %@ for selection %@ has NaN components!", buf, 0x36u);
              }
              if (qword_101719A70 != -1) {
                dispatch_once(&qword_101719A70, &stru_1014F3D68);
              }
              double v160 = off_10166B4A0;
              if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
                sub_10106590C(v160);
              }
              double v161 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController p_collaboratorHUDPositionForSelectionPath:collaboratorPresence:allowScroll:hudSize:]");
              double v162 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"];
              +[CRLAssertionHandler handleFailureInFunction:v161, v162, 5384, 0, "Position provided by %@ for selection %@ has NaN components!", v16, v183 file lineNumber isFatal description];

              goto LABEL_101;
            }
            id v143 = (id)sub_100454AA4((uint64_t)[v134 direction]);
            -[CRLCollaboratorCursorHUDController scaledFrameForHUDAtPoint:withDirection:](v185, "scaledFrameForHUDAtPoint:withDirection:", v143, v140, v142);
            -[CRLInteractiveCanvasController convertBoundsToUnscaledRect:](self, "convertBoundsToUnscaledRect:");
            uint64_t v145 = v144;
            uint64_t v147 = v146;
            uint64_t v149 = v148;
            uint64_t v151 = v150;
            if (v143 == (id)v132) {
              unsigned int v152 = v96;
            }
            else {
              unsigned int v152 = 0;
            }
            v217.origin.double x = v64;
            v217.origin.double y = v66;
            v217.size.double width = v68;
            v217.size.double height = v70;
            if (CGRectContainsRect(v217, *(CGRect *)&v145) && v152 == 0)
            {
              [v134 position];
              double v155 = v164;
              double v157 = v165;

              goto LABEL_104;
            }
          }
        }
        id v130 = [obja countByEnumeratingWithState:&v189 objects:v201 count:16];
        if (v130) {
          continue;
        }
        break;
      }
    }
LABEL_101:

    id v11 = v183;
    long long v36 = v178;
    id v12 = v180;
    long long v37 = v177;
  }
  double v155 = sub_100065738(v64, v66, v68, v70);
  double v157 = v163;
  id v143 = 0;
LABEL_105:
  [(CRLInteractiveCanvasController *)self viewScale];
  double v167 = sub_1000646A4(v155, v157, v166);
  double v169 = v168;
  CGFloat v170 = [(CRLInteractiveCanvasController *)self canvas];
  [v170 contentsScale];
  double v172 = sub_100067528(v167, v169, v171);
  CGFloat v174 = v173;

  retstr->var0.double x = v172;
  retstr->var0.double y = v174;
  retstr->var1 = (unint64_t)v143;
  *(void *)&retstr->vaCGFloat r2 = 0;
  retstr->vaCGFloat r2 = 1;

  return result;
}

- (id)p_layoutForShowingCollaboratorCursorHUDAtSelectionPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CRLInteractiveCanvasController *)self modelsForSelectionPath:v4];
  id v6 = objc_alloc_init((Class)NSMutableSet);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = -[CRLInteractiveCanvasController layoutForInfoNearestVisibleRect:intersectingSelectionPath:](self, "layoutForInfoNearestVisibleRect:intersectingSelectionPath:", *(void *)(*((void *)&v15 + 1) + 8 * i), v4, (void)v15);
        if (v12) {
          [v6 addObject:v12];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  id v13 = [v6 anyObject];

  return v13;
}

- (void)removeAllCollaboratorHUDControllers
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = [(NSMapTable *)self->mCollaboratorPresenceToCollaboratorHUDControllerDictionary crl_allObjects];
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if (![v7 hudSize]) {
          [v7 teardown];
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)setShouldSuppressesCollaboratorHUD:(BOOL)a3
{
  if (self->mSuppressesCollaboratorHUD != a3)
  {
    self->mSuppressesCollaboratorHUD = a3;
    if (a3)
    {
      long long v10 = 0u;
      long long v11 = 0u;
      long long v8 = 0u;
      long long v9 = 0u;
      id v3 = [(NSMapTable *)self->mCollaboratorPresenceToCollaboratorHUDControllerDictionary crl_allObjects];
      id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4)
      {
        id v5 = v4;
        uint64_t v6 = *(void *)v9;
        do
        {
          id v7 = 0;
          do
          {
            if (*(void *)v9 != v6) {
              objc_enumerationMutation(v3);
            }
            [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) teardown];
            id v7 = (char *)v7 + 1;
          }
          while (v5 != v7);
          id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
        }
        while (v5);
      }
    }
  }
}

- (id)filteredMainCanvasRestoredSelectionPath:(id)a3
{
  id v3 = a3;

  return v3;
}

- (void)addCollaboratorHUDController:(id)a3
{
  id v4 = a3;
  if (!+[NSThread isMainThread])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F3D88);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A8AFC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F3DA8);
    }
    id v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    uint64_t v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController addCollaboratorHUDController:]");
    id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:5484 isFatal:0 description:"This operation must only be performed on the main thread."];
  }
  mCollaboratorPresenceToCollaboratorHUDControllerDictionardouble y = self->mCollaboratorPresenceToCollaboratorHUDControllerDictionary;
  if (!mCollaboratorPresenceToCollaboratorHUDControllerDictionary)
  {
    long long v9 = (NSMapTable *)[objc_alloc((Class)NSMapTable) initWithKeyOptions:512 valueOptions:0 capacity:0];
    long long v10 = self->mCollaboratorPresenceToCollaboratorHUDControllerDictionary;
    self->mCollaboratorPresenceToCollaboratorHUDControllerDictionardouble y = v9;

    mCollaboratorPresenceToCollaboratorHUDControllerDictionardouble y = self->mCollaboratorPresenceToCollaboratorHUDControllerDictionary;
  }
  long long v11 = [v4 collaboratorPresence];
  id v12 = [(NSMapTable *)mCollaboratorPresenceToCollaboratorHUDControllerDictionary objectForKeyedSubscript:v11];

  if (v12)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F3DC8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A8A74();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F3DE8);
    }
    id v13 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v13);
    }
    unsigned int v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController addCollaboratorHUDController:]");
    long long v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v14 file:v15 lineNumber:5489 isFatal:0 description:"Showing two huds for the same lobby session"];
  }
  long long v16 = self->mCollaboratorPresenceToCollaboratorHUDControllerDictionary;
  long long v17 = [v4 collaboratorPresence];
  [(NSMapTable *)v16 setObject:v4 forKey:v17];

  [(CRLInteractiveCanvasController *)self addDecorator:v4];
}

- (void)removeCollaboratorHUDController:(id)a3
{
  id v4 = a3;
  if (!+[NSThread isMainThread])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F3E08);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A8B84();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F3E28);
    }
    id v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    uint64_t v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController removeCollaboratorHUDController:]");
    id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:5495 isFatal:0 description:"Should only update HUD on the layout thread."];
  }
  mCollaboratorPresenceToCollaboratorHUDControllerDictionardouble y = self->mCollaboratorPresenceToCollaboratorHUDControllerDictionary;
  long long v9 = [v4 collaboratorPresence];
  [(NSMapTable *)mCollaboratorPresenceToCollaboratorHUDControllerDictionary removeObjectForKey:v9];

  [(CRLInteractiveCanvasController *)self removeDecorator:v4];
}

- (void)updatePositionForCollaboratorHUDController:(id)a3
{
  id v4 = a3;
  if (!+[NSThread isMainThread])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F3E48);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A8C0C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F3E68);
    }
    id v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    uint64_t v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController updatePositionForCollaboratorHUDController:]");
    id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:5502 isFatal:0 description:"Should only update HUD on the layout thread."];
  }
  long long v8 = [(CRLInteractiveCanvasController *)self collaboratorCursorDelegate];
  long long v9 = [v4 collaboratorPresence];
  long long v10 = [v8 collaboratorCursorSelectionPathForRenderer:self collaboratorPresence:v9];

  long long v11 = [v4 collaboratorPresence];
  if ([v4 hudSize]) {
    BOOL mCurrentlyScrolling = 0;
  }
  else {
    BOOL mCurrentlyScrolling = self->mCurrentlyScrolling;
  }
  -[CRLInteractiveCanvasController p_collaboratorHUDPositionForSelectionPath:collaboratorPresence:allowScroll:hudSize:](self, "p_collaboratorHUDPositionForSelectionPath:collaboratorPresence:allowScroll:hudSize:", v10, v11, mCurrentlyScrolling, [v4 hudSize]);

  [v4 hideHUD];
}

- (void)positionDidUpdateForCollaboratorHUDController:(id)a3
{
  id v4 = a3;
  if (!+[NSThread isMainThread])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F3E88);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A8C94();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F3EA8);
    }
    id v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    uint64_t v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController positionDidUpdateForCollaboratorHUDController:]");
    id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:5515 isFatal:0 description:"Should only update HUD on the layout thread."];
  }
  [(CRLInteractiveCanvasController *)self invalidateLayersForDecorator:v4];
}

- (void)beginFollowing:(id)a3 forHUDController:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [(CRLInteractiveCanvasController *)self editingCoordinator];
  id v7 = [v6 followCoordinator];
  long long v8 = [v5 owner];

  [v7 localParticipantWantsToStartFollowingCollaborator:v8];

  [(CRLInteractiveCanvasController *)self donateTipEventParticipantFollowed];
}

- (void)endFollowing:(id)a3 forHUDController:(id)a4
{
  id v5 = [(CRLInteractiveCanvasController *)self editingCoordinator];
  id v4 = [v5 followCoordinator];
  [v4 endFollowSessionForLocalParticipantWithShouldShowRefollowPlacard:0];
}

- (void)toggleSizeForCollaboratorHUDController:(id)a3
{
  id v4 = a3;
  id v6 = [v4 collaboratorPresence];
  id v5 = [v4 hudSize];

  [(CRLInteractiveCanvasController *)self p_showCollaboratorHUDForCollaborator:v6 withSelectionPath:0 allowScroll:0 hudSize:v5 == 0];
}

- (BOOL)shouldSuppressCollaboratorCursorHUDForController:(id)a3
{
  return 0;
}

- (double)contentsScale
{
  id v2 = [(CRLInteractiveCanvasController *)self canvas];
  [v2 contentsScale];
  double v4 = v3;

  return v4;
}

- (double)visibleCanvasWidth
{
  [(CRLInteractiveCanvasController *)self visibleBoundsRect];
  return v2;
}

- (UITraitCollection)currentTraitCollection
{
  double v2 = [(CRLInteractiveCanvasController *)self canvasView];
  double v3 = [v2 window];
  double v4 = [v3 traitCollection];

  return (UITraitCollection *)v4;
}

- (BOOL)canModifyHyperlinks
{
  return ![(CRLInteractiveCanvasController *)self editingDisabled];
}

- (BOOL)shouldShowHyperlinkKnob
{
  return ![(CRLInteractiveCanvasController *)self editingDisabled];
}

- (BOOL)isHyperlinkKnobEnabledForRep:(id)a3
{
  return 1;
}

- (BOOL)allowedToShowHyperlinkContextMenuForRep:(id)a3
{
  return 1;
}

- (BOOL)canCustomizeHyperlinkViewController
{
  return 1;
}

- (BOOL)openURL:(id)a3
{
  return 1;
}

- (void)beginDynamicOperation
{
  if (self->mDynamicOperationState)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F3EC8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A8DA4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F3EE8);
    }
    double v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    double v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController beginDynamicOperation]");
    id v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:5604 isFatal:0 description:"didn't end previous dynamic operation before starting a new one"];
  }
  if (atomic_load((unsigned int *)&self->mDynamicOperationCounter))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F3F08);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A8D1C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F3F28);
    }
    id v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v7);
    }
    long long v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController beginDynamicOperation]");
    long long v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v8 file:v9 lineNumber:5605 isFatal:0 description:"Inspector-driven dynamic operation in process when beginning separate dynamic operation"];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    id v12 = objc_loadWeakRetained((id *)&self->mDelegate);
    [v12 dynamicOperationWillBegin];
  }
  id v13 = [(CRLInteractiveCanvasController *)self editingCoordinator];
  [v13 suspendCollaborationWithReason:@"CRLDynamicOperation"];

  self->mDynamicOperationState = 1;
  unsigned int v14 = [(CRLInteractiveCanvasController *)self layerHost];
  long long v15 = [v14 canvasLayer];
  [v15 bounds];
  -[CRLInteractiveCanvasController convertBoundsToUnscaledRect:](self, "convertBoundsToUnscaledRect:");
  self->mUnscaledRectToGrowCanvasDuringDynamicOperation.origin.double x = v16;
  self->mUnscaledRectToGrowCanvasDuringDynamicOperation.origin.double y = v17;
  self->mUnscaledRectToGrowCanvasDuringDynamicOperation.size.double width = v18;
  self->mUnscaledRectToGrowCanvasDuringDynamicOperation.size.double height = v19;

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v20 = [(CRLInteractiveCanvasController *)self i_decorators];
  id v21 = [v20 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v37;
    do
    {
      for (i = 0; i != v22; i = (char *)i + 1)
      {
        if (*(void *)v37 != v23) {
          objc_enumerationMutation(v20);
        }
        id v25 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          [v25 willBeginDynamicOperation];
        }
      }
      id v22 = [v20 countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v22);
  }

  uint64_t v26 = [(CRLInteractiveCanvasController *)self tmCoordinator];
  long long v27 = [v26 controllingTM];
  double v28 = [v27 tracker];

  if (!v28) {
    goto LABEL_42;
  }
  if (objc_opt_respondsToSelector()) {
    unsigned __int8 v29 = [v28 shouldAllowScroll];
  }
  else {
    unsigned __int8 v29 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ([v28 allowPopoverToRemainOpenDuringDynamicOperation] & 1) == 0)
  {
    double v30 = [(CRLInteractiveCanvasController *)self layerHost];
    double v31 = [v30 asiOSCVC];

    BOOL v32 = [v31 delegate];
    if (objc_opt_respondsToSelector()) {
      [v32 dismissPresentedViewController];
    }
  }
  if ((v29 & 1) == 0)
  {
LABEL_42:
    id v33 = [(CRLInteractiveCanvasController *)self layerHost];
    double v34 = [v33 canvasView];
    double v35 = [v34 enclosingScrollView];
    [v35 setScrollEnabled:0];
  }
}

- (void)willEndDynamicOperation
{
  if (self->mDynamicOperationState != 1)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F3F48);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A8E2C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F3F68);
    }
    double v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    double v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController willEndDynamicOperation]");
    id v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:5659 isFatal:0 description:"didn't begin or already ending dynamic operation"];
  }
  self->mDynamicOperationState = 2;
}

- (void)endDynamicOperation
{
  if (self->mDynamicOperationState != 2)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F3F88);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A8F3C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F3FA8);
    }
    double v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    double v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController endDynamicOperation]");
    id v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:5664 isFatal:0 description:"ending dynamic operation without starting a new one or calling willEnd"];
  }
  if (atomic_load((unsigned int *)&self->mDynamicOperationCounter))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F3FC8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A8EB4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F3FE8);
    }
    id v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v7);
    }
    long long v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController endDynamicOperation]");
    long long v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v8 file:v9 lineNumber:5665 isFatal:0 description:"Cannot begin inspector dynamic operation while in non-inspector dynamic operation"];
  }
  self->mDynamicOperationState = 0;
  long long v10 = [(CRLInteractiveCanvasController *)self editingCoordinator];
  [v10 resumeCollaborationWithReason:@"CRLDynamicOperation"];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  char v11 = [(CRLInteractiveCanvasController *)self i_decorators];
  id v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v24;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v24 != v14) {
          objc_enumerationMutation(v11);
        }
        CGFloat v16 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          [v16 didEndDynamicOperation];
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v13);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  char v18 = objc_opt_respondsToSelector();

  if (v18)
  {
    id v19 = objc_loadWeakRetained((id *)&self->mDelegate);
    [v19 dynamicOperationDidEnd];
  }
  [(CRLCanvas *)self->mCanvas layoutInvalidated];
  id v20 = [(CRLInteractiveCanvasController *)self layerHost];
  id v21 = [v20 canvasView];
  id v22 = [v21 enclosingScrollView];
  [v22 setScrollEnabled:1];
}

- (BOOL)isInDynamicOperation
{
  if (self->mDynamicOperationState) {
    return 1;
  }
  signed int v3 = atomic_load((unsigned int *)&self->mDynamicOperationCounter);
  return v3 > 0;
}

- (BOOL)isDynamicOperationEnding
{
  return self->mDynamicOperationState == 2;
}

- (BOOL)shouldSupportedDynamicOperationsEnqueueCommandsInRealTime
{
  signed int v3 = +[NSProcessInfo processInfo];
  uint64_t v4 = (uint64_t)[v3 thermalState];

  id v5 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v6 = [v5 BOOLForKey:@"CRLForceEnableRealTimeCommands"];

  if (v6) {
    return 1;
  }
  if (v4 > 1) {
    return 0;
  }
  long long v8 = [(CRLInteractiveCanvasController *)self editingCoordinator];
  unsigned __int8 v9 = [v8 isInRealTimeSyncSession];

  return v9;
}

- (void)beginPossiblyParallelInspectorDynamicOperation
{
  atomic_fetch_add(&self->mDynamicOperationCounter, 1u);
  id v2 = [(CRLInteractiveCanvasController *)self editingCoordinator];
  [v2 suspendCollaborationWithReason:@"CRLPossiblyParallelInspectorDynamicOperation"];
}

- (void)endPossiblyParallelInspectorDynamicOperation
{
  if ((int)atomic_fetch_add(&self->mDynamicOperationCounter, 0xFFFFFFFF) <= 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F4008);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A8FC4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F4028);
    }
    signed int v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    uint64_t v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController endPossiblyParallelInspectorDynamicOperation]");
    id v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:5735 isFatal:0 description:"Ended more dynamic operations than you began!"];
  }
  unsigned __int8 v6 = [(CRLInteractiveCanvasController *)self editingCoordinator];
  [v6 resumeCollaborationWithReason:@"CRLPossiblyParallelInspectorDynamicOperation"];
}

- (BOOL)isInInspectorDynamicOperation
{
  signed int v2 = atomic_load((unsigned int *)&self->mDynamicOperationCounter);
  return v2 > 0;
}

- (BOOL)shouldAllowKeyCommands
{
  signed int v3 = [(CRLInteractiveCanvasController *)self textInputResponder];
  unsigned __int8 v4 = [v3 isIgnoringKeyboardInput];

  if (v4)
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    unsigned __int8 v6 = [(CRLInteractiveCanvasController *)self layerHost];
    id v7 = [v6 asiOSCVC];
    if ([v7 shouldIgnoreKeyboardInput]) {
      LOBYTE(v5) = 0;
    }
    else {
      unsigned int v5 = ![(CRLInteractiveCanvasController *)self isInDynamicOperation];
    }
  }
  return v5;
}

- (BOOL)p_areAnyCollaboratorsPresent
{
  signed int v2 = [(CRLInteractiveCanvasController *)self currentCollaboratorPresences];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (unint64_t)p_editingDisabledReasons
{
  return [(CRLInteractiveCanvasController *)self documentIsSharedReadOnly];
}

+ (id)keyPathsForValuesAffectingEditingDisabled
{
  return +[NSSet setWithObjects:@"documentIsSharedReadOnly", @"isInReaderMode", 0];
}

- (void)copyEditabilityPropertiesFromInteractiveCanvasController:(id)a3
{
  id v4 = [a3 documentIsSharedReadOnly];

  [(CRLInteractiveCanvasController *)self setDocumentIsSharedReadOnly:v4];
}

- (void)setDocumentIsSharedReadOnly:(BOOL)a3
{
  if (self->mDocumentIsSharedReadOnly != a3)
  {
    BOOL v3 = a3;
    self->mDocumentIsSharedReadOnldouble y = a3;
    [(CRLInteractiveCanvasController *)self documentEditabilityDidChange];
    if (v3)
    {
      unsigned int v5 = [(CRLInteractiveCanvasController *)self layerHost];
      unsigned __int8 v6 = [v5 miniFormatterPresenter];
      [v6 dismissMiniFormatter];

      id v7 = [(CRLInteractiveCanvasController *)self layerHost];
      long long v8 = [v7 asiOSCVC];
      [v8 resetGesturesForContextSwitch];

      unsigned __int8 v9 = [(CRLInteractiveCanvasController *)self editorController];
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_10039DFF4;
      v11[3] = &unk_1014F4050;
      void v11[4] = self;
      [v9 enumerateEditorsOnStackLeastToMostSpecificUsingBlock:v11];

      if (+[UIKeyboard isInHardwareKeyboardMode])
      {
        v10[0] = _NSConcreteStackBlock;
        v10[1] = 3221225472;
        v10[2] = sub_10039E07C;
        v10[3] = &unk_1014CBBB0;
        v10[4] = self;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);
      }
    }
  }
}

- (void)documentEditabilityDidChange
{
  unint64_t v3 = [(CRLInteractiveCanvasController *)self p_editingDisabledReasons];
  id v4 = [(CRLInteractiveCanvasController *)self editorController];
  [v4 setEditingDisabledReasons:v3];

  unsigned int v5 = [(CRLInteractiveCanvasController *)self editorController];
  [v5 enumerateEditorsOnStackUsingBlock:&stru_1014F4090];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  unsigned __int8 v6 = [(CRLCanvas *)self->mCanvas topLevelReps];
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * i) recursivelyPerformSelectorIfImplemented:"documentEditabilityDidChange"];
      }
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (BOOL)usesAlternateDrawableSelectionHighlight
{
  return self->mUsesAlternateDrawableSelectionHighlight;
}

- (void)setUsesAlternateDrawableSelectionHighlight:(BOOL)a3
{
  if (self->mUsesAlternateDrawableSelectionHighlight != a3)
  {
    self->mUsesAlternateDrawableSelectionHighlight = a3;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v4 = [(CRLCanvas *)self->mCanvas topLevelReps];
    id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
          [v9 recursivelyPerformSelectorIfImplemented:"i_invalidateSelectionHighlightRenderable"];
          [v9 recursivelyPerformSelectorIfImplemented:"invalidateKnobs"];
        }
        id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }

    [(CRLInteractiveCanvasController *)self layoutInvalidated];
  }
}

- (void)setAllowsSelectionKnobs:(BOOL)a3
{
  if (self->mAllowsSelectionKnobs != a3)
  {
    self->mAllowsSelectionKnobs = a3;
    long long v8 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    unint64_t v3 = [(CRLCanvas *)self->mCanvas topLevelReps];
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
          [*(id *)(*((void *)&v8 + 1) + 8 * i) recursivelyPerformSelectorIfImplemented:"invalidateKnobs"];
        }
        id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }
  }
}

- (void)setAllowsSelectionHighlight:(BOOL)a3
{
  if (self->mAllowsSelectionHighlight != a3)
  {
    self->mAllowsSelectionHighlight = a3;
    [(CRLInteractiveCanvasController *)self invalidateAllLayers];
  }
}

- (BOOL)shouldSuppressSelectionKnobsForRep:(id)a3
{
  mMultiselectResizeInfo = self->mMultiselectResizeInfo;
  id v4 = a3;
  id v5 = [(CRLMultiselectResizeInfo *)mMultiselectResizeInfo representedSelectedBoardItems];
  uint64_t v6 = [v4 info];

  LOBYTE(v4) = [v5 containsObject:v6];
  return (char)v4;
}

- (id)additionalDependentLayoutsForBoardItem:(id)a3
{
  id v4 = a3;
  mMultiselectResizeInfo = self->mMultiselectResizeInfo;
  if (mMultiselectResizeInfo
    && (-[CRLMultiselectResizeInfo representedSelectedBoardItems](mMultiselectResizeInfo, "representedSelectedBoardItems"), v6 = objc_claimAutoreleasedReturnValue(), unsigned int v7 = [v6 containsObject:v4], v6, v7))
  {
    long long v8 = [(CRLInteractiveCanvasController *)self layoutForInfo:self->mMultiselectResizeInfo];
    if (v8)
    {
      long long v9 = +[NSSet setWithObject:v8];
    }
    else
    {
      long long v9 = 0;
    }
  }
  else
  {
    long long v9 = 0;
  }

  return v9;
}

- (id)additionalChildInfosForLayout:(id)a3
{
  id v4 = a3;
  mMultiselectResizeInfo = self->mMultiselectResizeInfo;
  if (mMultiselectResizeInfo
    && ([(CRLMultiselectResizeInfo *)mMultiselectResizeInfo parentInfo],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        [v4 info],
        unsigned int v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v6 == v7))
  {
    long long v10 = self->mMultiselectResizeInfo;
    long long v8 = +[NSArray arrayWithObjects:&v10 count:1];
  }
  else
  {
    long long v8 = &__NSArray0__struct;
  }

  return v8;
}

- (void)i_invalidateSelectionHighlightLayers
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  unint64_t v3 = [(CRLCanvas *)self->mCanvas topLevelReps];
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
        [*(id *)(*((void *)&v8 + 1) + 8 * i) recursivelyPerformSelectorIfImplemented:"i_invalidateSelectionHighlightRenderable"];
      }
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  [(CRLInteractiveCanvasController *)self layoutInvalidated];
}

- (void)beginScrollingOperation
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  signed int v2 = [(CRLInteractiveCanvasController *)self i_decorators];
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        unsigned int v7 = *(void **)(*((void *)&v8 + 1) + 8 * (void)v6);
        if (objc_opt_respondsToSelector()) {
          [v7 willBeginScrollingOperation];
        }
        uint64_t v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)endScrollingOperation
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  signed int v2 = [(CRLInteractiveCanvasController *)self i_decorators];
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        unsigned int v7 = *(void **)(*((void *)&v8 + 1) + 8 * (void)v6);
        if (objc_opt_respondsToSelector()) {
          [v7 didEndScrollingOperation];
        }
        uint64_t v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)p_beginZoomingOperation
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = [(CRLInteractiveCanvasController *)self i_decorators];
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      unsigned int v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        long long v8 = *(void **)(*((void *)&v9 + 1) + 8 * (void)v7);
        if (objc_opt_respondsToSelector()) {
          [v8 willBeginZoomingOperation];
        }
        unsigned int v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  [(CRLInteractiveCanvasController *)self p_fadeOutForZoomOperation];
}

- (void)p_endZoomingOperation
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = [(CRLInteractiveCanvasController *)self i_decorators];
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      unsigned int v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        long long v8 = *(void **)(*((void *)&v11 + 1) + 8 * (void)v7);
        if (objc_opt_respondsToSelector()) {
          [v8 didEndZoomingOperation];
        }
        unsigned int v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  long long v9 = [(CRLInteractiveCanvasController *)self layerHost];
  long long v10 = [v9 canvasLayer];
  [v10 layoutIfNeededIgnoringDisabledLayout];

  [(CRLInteractiveCanvasController *)self p_fadeInForZoomOperation];
}

- (void)p_fadeOutForZoomOperation
{
  id v3 = +[CABasicAnimation animationWithKeyPath:@"opacity"];
  [v3 setDuration:0.15];
  id v4 = +[NSNumber numberWithFloat:0.0];
  [v3 setToValue:v4];

  [v3 setRemovedOnCompletion:0];
  [v3 setFillMode:kCAFillModeForwards];
  id v5 = objc_alloc((Class)NSMutableArray);
  uint64_t v6 = [(CRLInteractiveCanvasController *)self overlayLayer];
  unsigned int v7 = [v6 sublayers];
  long long v8 = (NSMutableArray *)[v5 initWithCapacity:[v7 count]];
  mLayersWithZoomFadeAnimation = self->mLayersWithZoomFadeAnimation;
  self->mLayersWithZoomFadeAnimation = v8;

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v10 = [(CRLInteractiveCanvasController *)self overlayLayer];
  long long v11 = [v10 sublayers];

  id v12 = [v11 countByEnumeratingWithState:&v37 objects:v43 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v38;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v38 != v14) {
          objc_enumerationMutation(v11);
        }
        CGFloat v16 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        if (objc_msgSend(v16, "crl_hideOverlayLayerDuringZoomOperations"))
        {
          [v16 addAnimation:v3 forKey:@"CRLInteractiveCanvasControllerBeginZoomingOperation"];
          [(NSMutableArray *)self->mLayersWithZoomFadeAnimation addObject:v16];
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v37 objects:v43 count:16];
    }
    while (v13);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = [(CRLCanvas *)self->mCanvas allReps];
  id v17 = [obj countByEnumeratingWithState:&v33 objects:v42 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v28 = *(void *)v34;
    do
    {
      for (j = 0; j != v18; j = (char *)j + 1)
      {
        if (*(void *)v34 != v28) {
          objc_enumerationMutation(obj);
        }
        id v20 = *(void **)(*((void *)&v33 + 1) + 8 * (void)j);
        [v20 handleFadeOutForZoom];
        id v21 = [v20 additionalRenderablesToFadeDuringZoom];
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        id v22 = [v21 countByEnumeratingWithState:&v29 objects:v41 count:16];
        if (v22)
        {
          id v23 = v22;
          uint64_t v24 = *(void *)v30;
          do
          {
            for (k = 0; k != v23; k = (char *)k + 1)
            {
              if (*(void *)v30 != v24) {
                objc_enumerationMutation(v21);
              }
              long long v26 = [*(id *)(*((void *)&v29 + 1) + 8 * (void)k) layer];
              [v26 addAnimation:v3 forKey:@"CRLInteractiveCanvasControllerBeginZoomingOperation"];
              [(NSMutableArray *)self->mLayersWithZoomFadeAnimation addObject:v26];
            }
            id v23 = [v21 countByEnumeratingWithState:&v29 objects:v41 count:16];
          }
          while (v23);
        }
      }
      id v18 = [obj countByEnumeratingWithState:&v33 objects:v42 count:16];
    }
    while (v18);
  }
}

- (void)p_fadeInForZoomOperation
{
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v3 = [(CRLCanvas *)self->mCanvas allReps];
  id v4 = [v3 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v23;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v22 + 1) + 8 * i) handleFadeInForZoom];
      }
      id v5 = [v3 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v5);
  }

  long long v8 = +[CABasicAnimation animationWithKeyPath:@"opacity"];
  [v8 setDuration:0.15];
  long long v9 = +[NSNumber numberWithFloat:0.0];
  [v8 setFromValue:v9];

  [v8 setRemovedOnCompletion:1];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v10 = self->mLayersWithZoomFadeAnimation;
  id v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      for (j = 0; j != v12; j = (char *)j + 1)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        long long v15 = *(void **)(*((void *)&v18 + 1) + 8 * (void)j);
        [v15 opacity];
        CGFloat v16 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
        [v8 setToValue:v16];

        [v15 addAnimation:v8 forKey:@"CRLInteractiveCanvasControllerEndZoomingOperation"];
        [v15 removeAnimationForKey:@"CRLInteractiveCanvasControllerBeginZoomingOperation"];
      }
      id v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v12);
  }

  mLayersWithZoomFadeAnimation = self->mLayersWithZoomFadeAnimation;
  self->mLayersWithZoomFadeAnimation = 0;
}

- (void)setShowInvisibleObjects:(BOOL)a3
{
  if (self->mShowInvisibleObjects != a3)
  {
    self->mShowInvisibleObjects = a3;
    [(CRLInteractiveCanvasController *)self layoutInvalidated];
  }
}

- (CRLDynamicOperationController)dynamicOperationController
{
  mDynOpController = self->mDynOpController;
  if (!mDynOpController)
  {
    id v4 = [[CRLDynamicOperationController alloc] initWithInteractiveCanvasController:self];
    id v5 = self->mDynOpController;
    self->mDynOpController = v4;

    mDynOpController = self->mDynOpController;
  }

  return mDynOpController;
}

- (CRLTrackerManipulatorCoordinator)tmCoordinator
{
  mTMCoordinator = self->mTMCoordinator;
  if (!mTMCoordinator)
  {
    id v4 = objc_alloc_init(CRLTrackerManipulatorCoordinator);
    id v5 = self->mTMCoordinator;
    self->mTMCoordinator = v4;

    mTMCoordinator = self->mTMCoordinator;
  }

  return mTMCoordinator;
}

- (id)customRotateTrackerForCurrentSelection
{
  if ([(CRLInteractiveCanvasController *)self p_shouldTransformCurrentSelectionAsSingleEntity])
  {
    id v3 = +[NSMutableSet set];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v4 = [(CRLInteractiveCanvasController *)self infosForCurrentSelectionPath];
    id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v15;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v4);
          }
          long long v9 = [(CRLInteractiveCanvasController *)self repForInfo:*(void *)(*((void *)&v14 + 1) + 8 * i)];
          long long v10 = v9;
          if (v9)
          {
            id v11 = [v9 repForRotating];

            if (v11 == v10) {
              [v3 addObject:v10];
            }
          }
        }
        id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v6);
    }

    id v12 = [[CRLMultiRepRotateTracker alloc] initWithReps:v3];
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (CRLGestureDispatcher)gestureDispatcher
{
  mGestureDispatcher = self->mGestureDispatcher;
  if (!mGestureDispatcher)
  {
    id v4 = [[CRLGestureDispatcher alloc] initWithInteractiveCanvasController:self];
    id v5 = self->mGestureDispatcher;
    self->mGestureDispatcher = v4;

    mGestureDispatcher = self->mGestureDispatcher;
  }

  return mGestureDispatcher;
}

- (void)updateSelectionForTapAtPoint:(CGPoint)a3 extendingSelection:(BOOL)a4
{
  BOOL v4 = a4;
  -[CRLInteractiveCanvasController hitRep:](self, "hitRep:", a3.x, a3.y);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(CRLInteractiveCanvasController *)self updateSelectionForInteractionWithRep:v6 extendingSelection:v4];
}

- (void)updateSelectionForInteractionWithRep:(id)a3 extendingSelection:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v19 = [(CRLInteractiveCanvasController *)self canvasEditor];
  uint64_t v7 = [v6 repForSelecting];

  if (v7)
  {
    long long v8 = [v7 parentRepToPerformSelecting];
    if (v8)
    {
      [(CRLInteractiveCanvasController *)self endEditing];
      [v8 selectChildRep:v7 extendingSelection:v4];
    }
    else if (v4)
    {
      [(CRLInteractiveCanvasController *)self endEditing];
      long long v10 = [v7 info];
      unsigned int v11 = [v7 isSelectedIgnoringLocking];
      id v12 = [v19 canvasEditorHelper];
      uint64_t v13 = v12;
      if (v11) {
        [v12 canvasSelectionPathExcludingInfo:v10];
      }
      else {
      long long v14 = [v12 canvasSelectionPathIncludingInfo:v10];
      }
      long long v15 = [(CRLInteractiveCanvasController *)self editorController];
      [v15 setSelectionPath:v14];
    }
    else if ([v7 isSelectedIgnoringLocking])
    {
      [(CRLInteractiveCanvasController *)self updateSelectionForTapOnSelectedRep:v7];
    }
    else
    {
      [(CRLInteractiveCanvasController *)self endEditing];
      long long v16 = [v7 info];
      long long v17 = [v19 selectionPathWithInfo:v16];

      long long v18 = [(CRLInteractiveCanvasController *)self editorController];
      [v18 setSelectionPath:v17];
    }
  }
  else
  {
    if (v4) {
      goto LABEL_15;
    }
    [(CRLInteractiveCanvasController *)self endEditing];
    long long v8 = [v19 selectionPathWithInfos:0];
    long long v9 = [(CRLInteractiveCanvasController *)self editorController];
    [v9 setSelectionPath:v8];
  }
LABEL_15:
}

- (BOOL)handleSingleTapAtPoint:(CGPoint)a3 extendingSelection:(BOOL)a4 inputType:(int64_t)a5
{
  BOOL v6 = a4;
  double y = a3.y;
  double x = a3.x;
  long long v10 = -[CRLInteractiveCanvasController hitRep:](self, "hitRep:");
  unsigned int v11 = [v10 repForHandleSingleTap];
  id v12 = v11;
  if (!v6)
  {
    if (!v11)
    {
      BOOL v14 = 0;
      goto LABEL_15;
    }
    if ((![v10 isLocked] || objc_msgSend(v10, "wantsToHandleTapsWhenLocked"))
      && (objc_msgSend(v12, "handleSingleTapAtPoint:inputType:", a5, x, y) & 1) != 0)
    {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  unsigned __int8 v13 = [v11 handleSingleTapsWhileExtendingSelectionAtPoint:a5 inputType:x y:y];
  if (v12) {
    BOOL v14 = 1;
  }
  else {
    BOOL v14 = v13;
  }
  if (v12 && (v13 & 1) == 0)
  {
LABEL_12:
    -[CRLInteractiveCanvasController updateSelectionForTapAtPoint:extendingSelection:](self, "updateSelectionForTapAtPoint:extendingSelection:", v6, x, y);
LABEL_13:
    BOOL v14 = 1;
  }
LABEL_15:

  return v14;
}

- (BOOL)handleDoubleTapAtPoint:(CGPoint)a3 inputType:(int64_t)a4
{
  double y = a3.y;
  double x = a3.x;
  long long v8 = -[CRLInteractiveCanvasController hitRep:](self, "hitRep:");
  long long v9 = [v8 repForSelecting];

  if (v9)
  {
    long long v10 = [v9 info];

    if (v10)
    {
      unsigned int v11 = [(CRLInteractiveCanvasController *)self selectionModelTranslator];
      id v12 = [(CRLInteractiveCanvasController *)self editorController];
      unsigned __int8 v13 = [v12 selectionPath];
      BOOL v14 = [v11 boardItemsForSelectionPath:v13];

      if ([v14 count] != (id)1
        || ([v9 info],
            long long v15 = objc_claimAutoreleasedReturnValue(),
            unsigned __int8 v16 = [v14 containsObject:v15],
            v15,
            (v16 & 1) == 0))
      {
        long long v17 = [(CRLInteractiveCanvasController *)self canvasEditor];
        long long v18 = [v9 info];
        id v19 = [v17 selectionPathWithInfo:v18];
        long long v20 = [(CRLInteractiveCanvasController *)self editorController];
        [v20 setSelectionPath:v19];
      }
    }
    if (![v9 isLocked]
      || [v9 wantsToHandleDoubleTapsWhenLocked])
    {
      [v9 handleDoubleTapAtPoint:a4 inputType:x, y];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v21 = [(CRLInteractiveCanvasController *)self canvasView];
      long long v22 = [v21 layerHost];
      long long v23 = [v22 miniFormatterPresenter];
      long long v24 = [(CRLInteractiveCanvasController *)self editorController];
      long long v25 = [v24 selectionPath];
      [v23 presentMiniFormatterForSelectionPath:v25];
    }
  }
  else
  {
    long long v26 = [(CRLInteractiveCanvasController *)self layerHost];
    long long v27 = [v26 asUIKitHost];
    unsigned int v28 = [v27 isCurrentlyInQuickSelectMode];

    if (v28) {
      -[CRLInteractiveCanvasController updateSelectionForTapAtPoint:extendingSelection:](self, "updateSelectionForTapAtPoint:extendingSelection:", 0, x, y);
    }
  }

  return v9 != 0;
}

- (BOOL)handleMultipleTapAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  BOOL v6 = -[CRLInteractiveCanvasController hitRep:](self, "hitRep:");
  uint64_t v7 = [v6 repForSelecting];

  if (v7)
  {
    long long v8 = [v7 info];

    if (v8)
    {
      long long v9 = [(CRLInteractiveCanvasController *)self canvasEditor];
      long long v10 = [v7 info];
      unsigned int v11 = [v9 selectionPathWithInfo:v10];
      id v12 = [(CRLInteractiveCanvasController *)self editorController];
      [v12 setSelectionPath:v11];
    }
    if (([v7 isLocked] & 1) == 0) {
      [v7 handleMultipleTapAtPoint:x, y];
    }
  }

  return v7 != 0;
}

- (void)tappedCanvasBackgroundAtPoint:(CGPoint)a3 inputType:(int64_t)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v7 = [(CRLInteractiveCanvasController *)self layerHost];
  id v30 = [v7 asUIKitHost];

  unsigned int v8 = [v30 isCurrentlyInQuickSelectMode];
  long long v9 = [(CRLInteractiveCanvasController *)self editorController];
  long long v10 = [v9 selectionPath];
  unsigned int v11 = [(CRLInteractiveCanvasController *)self infosForSelectionPath:v10];
  id v12 = [v11 count];

  if ((v8 & 1) == 0)
  {
    unsigned __int8 v13 = [(CRLInteractiveCanvasController *)self canvasEditor];
    BOOL v14 = [v13 selectionPathWithInfos:0];

    long long v15 = [(CRLInteractiveCanvasController *)self editorController];
    [v15 setSelectionPath:v14 withFlags:0x2000];
  }
  unsigned __int8 v16 = [(CRLInteractiveCanvasController *)self layerHost];
  long long v17 = [v16 asiOSCVC];

  [v17 becomeFirstResponderIfAppropriate];
  long long v18 = [v17 delegate];
  char v19 = objc_opt_respondsToSelector();

  if ((v19 & 1) == 0
    || ([v17 delegate],
        uint64_t v20 = objc_claimAutoreleasedReturnValue(),
        [(id)v20 currentDocumentMode],
        long long v21 = objc_claimAutoreleasedReturnValue(),
        (id)v20,
        LOBYTE(v20) = objc_msgSend(v21, "handleTapOnCanvasBackgroundAtUnscaledPoint:", x, y),
        v21,
        (v20 & 1) == 0))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
    char v23 = objc_opt_respondsToSelector();

    if (v23)
    {
      id v24 = objc_loadWeakRetained((id *)&self->mDelegate);
      unsigned int v25 = [v24 tappedCanvasBackgroundAtPoint:x, y];

      if ((v25 | v8)) {
        goto LABEL_15;
      }
    }
    else if (v8)
    {
      goto LABEL_15;
    }
    long long v26 = [(CRLInteractiveCanvasController *)self editorController];
    long long v27 = [v26 selectionPath];
    unsigned int v28 = [(CRLInteractiveCanvasController *)self infosForSelectionPath:v27];
    id v29 = [v28 count];

    if (!v29)
    {
      if (([v30 contextMenuMightBeDisplayed] & 1) != 0 || v12)
      {
        [v30 hideEditMenu];
      }
      else if (![(CRLInteractiveCanvasController *)self editingDisabled])
      {
        [v30 showDefaultEditUIForCurrentSelection];
      }
    }
  }
LABEL_15:
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  mCurrentAnimation = self->mCurrentAnimation;
  if (mCurrentAnimation)
  {
    BOOL v6 = [(CRLCanvasAnimation *)mCurrentAnimation actionForLayer:a3 forKey:a4];
  }
  else if (-[CRLInteractiveCanvasLayerUpdater isCanvasContentLayer:](self->mLayerUpdater, "isCanvasContentLayer:", a3, a4))
  {
    BOOL v6 = +[NSNull null];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)drawLayer:(id)a3 inContext:(CGContext *)a4
{
  id v6 = a3;
  uint64_t v7 = v6;
  if (self->mShouldSuppressRendering) {
    goto LABEL_36;
  }
  if (!v6)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F40B0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A9174();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F40D0);
    }
    unsigned int v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v8);
    }
    long long v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController drawLayer:inContext:]");
    long long v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 6354, 0, "invalid nil value for '%{public}s'", "layer");

    if (a4) {
      goto LABEL_23;
    }
    goto LABEL_14;
  }
  if (!a4)
  {
LABEL_14:
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F40F0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A90E0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F4110);
    }
    unsigned int v11 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v11);
    }
    id v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController drawLayer:inContext:]");
    unsigned __int8 v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 6355, 0, "invalid nil value for '%{public}s'", "ctx");
  }
LABEL_23:
  BOOL v14 = [(CRLInteractiveCanvasController *)self i_interactiveCanvasLayerHelper];

  if (!v14)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F4130);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A904C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F4150);
    }
    long long v15 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v15);
    }
    unsigned __int8 v16 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController drawLayer:inContext:]");
    long long v17 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 6357, 0, "invalid nil value for '%{public}s'", "self.i_interactiveCanvasLayerHelper");
  }
  long long v18 = [(CRLInteractiveCanvasController *)self i_interactiveCanvasLayerHelper];
  char v19 = [v18 repForLayer:v7];

  if (v19) {
    [(CRLInteractiveCanvasController *)self i_drawRepWithReadLock:v19 inContext:a4 forLayer:v7];
  }

LABEL_36:
}

- (BOOL)shouldLayoutTilingLayer:(id)a3
{
  BOOL v4 = [(CRLInteractiveCanvasController *)self layerHost];
  id v5 = [v4 canvasLayer];
  BOOL v6 = ([v5 isLayoutDisabled] & 1) == 0 && !self->mAnimatingViewScale;

  return v6;
}

- (CGRect)visibleBoundsForTilingLayer:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F4170);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A929C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F4190);
    }
    id v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    BOOL v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController visibleBoundsForTilingLayer:]");
    uint64_t v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 6371, 0, "invalid nil value for '%{public}s'", "layer");
  }
  unsigned int v8 = [(CRLInteractiveCanvasController *)self layerHost];
  id v9 = [v8 canvasLayer];

  id v10 = v4;
  unsigned int v11 = [v10 superlayer];

  id v12 = v10;
  if (v11)
  {
    id v12 = v10;
    if (v9 != v10)
    {
      id v12 = v10;
      do
      {
        unsigned __int8 v13 = v12;
        id v12 = [v12 superlayer];

        BOOL v14 = [v12 superlayer];
      }
      while (v14 && v12 != v9);
    }
  }
  CGFloat y = CGRectNull.origin.y;
  CGFloat width = CGRectNull.size.width;
  CGFloat height = CGRectNull.size.height;
  long long v18 = [v12 superlayer];
  CGFloat v19 = height;
  CGFloat v20 = width;
  CGFloat v21 = y;
  CGFloat x = CGRectNull.origin.x;
  if (!v18)
  {
    objc_opt_class();
    CGFloat v19 = height;
    CGFloat v20 = width;
    CGFloat v21 = y;
    CGFloat x = CGRectNull.origin.x;
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_31;
    }
    [v10 bounds];
    [v12 convertRect:v10 fromLayer:];
    double v24 = v23;
    double v26 = v25;
    double v28 = v27;
    double v30 = v29;
    long long v31 = (objc_class *)objc_opt_class();
    long long v32 = [v12 delegate];
    long long v18 = sub_10024715C(v31, v32);

    if (v18)
    {
      long long v33 = [(CRLInteractiveCanvasController *)self canvasView];
      [v18 convertRect:v33 toView:v24];
      CGFloat x = v34;
      CGFloat v21 = v35;
      CGFloat v20 = v36;
      CGFloat v19 = v37;
    }
    else
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F41B0);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010A9208();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F41D0);
      }
      long long v38 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v38);
      }
      long long v33 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController visibleBoundsForTilingLayer:]");
      long long v39 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v33, v39, 6391, 0, "invalid nil value for '%{public}s'", "canvasSubview");

      CGFloat v19 = height;
      CGFloat v20 = width;
      CGFloat v21 = y;
      CGFloat x = CGRectNull.origin.x;
    }
  }
LABEL_31:
  v56.origin.CGFloat x = x;
  v56.origin.CGFloat y = v21;
  v56.size.CGFloat width = v20;
  v56.size.CGFloat height = v19;
  v60.origin.CGFloat x = CGRectNull.origin.x;
  v60.origin.CGFloat y = y;
  v60.size.CGFloat width = width;
  v60.size.CGFloat height = height;
  if (CGRectEqualToRect(v56, v60))
  {
    [v10 bounds];
    [v9 convertRect:v10 fromLayer:];
    CGFloat x = v40;
    CGFloat v21 = v41;
    CGFloat v20 = v42;
    CGFloat v19 = v43;
  }
  [(CRLInteractiveCanvasController *)self visibleBoundsRectForTiling];
  v61.origin.CGFloat x = x;
  v61.origin.CGFloat y = v21;
  v61.size.CGFloat width = v20;
  v61.size.CGFloat height = v19;
  CGRect v58 = CGRectIntersection(v57, v61);
  [v9 convertRect:v10 toLayer:v58.origin.x, v58.origin.y, v58.size.width, v58.size.height];
  double v45 = v44;
  double v47 = v46;
  double v49 = v48;
  double v51 = v50;

  double v52 = v45;
  double v53 = v47;
  double v54 = v49;
  double v55 = v51;
  result.size.CGFloat height = v55;
  result.size.CGFloat width = v54;
  result.origin.CGFloat y = v53;
  result.origin.CGFloat x = v52;
  return result;
}

- (BOOL)scrollViewShouldOptOutOfUIScrollViewContentOffsetAnimationForScrollView:(id)a3
{
  id v3 = [(CRLInteractiveCanvasController *)self layerHost];
  id v4 = [v3 asiOSCVC];
  unsigned __int8 v5 = [v4 shouldOptOutOfUIScrollViewContentOffsetAnimation];

  return v5;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  [(CRLInteractiveCanvasController *)self i_canvasDidUpdateVisibleBounds];
  BOOL v5 = ([v4 isDragging] & 1) != 0
    || ([v4 isDecelerating] & 1) != 0
    || self->mAnimatingScroll;
  [(CRLInteractiveCanvasController *)self p_setCurrentlyScrolling:v5];
  BOOL v6 = [(CRLInteractiveCanvasController *)self i_interactiveCanvasLayerHelper];
  uint64_t v7 = [v6 popoutLayer];

  if (v7)
  {
    unsigned int v8 = [(CRLInteractiveCanvasController *)self layerHost];
    id v9 = [v8 canvasLayer];
    [v9 bounds];
    double v11 = v10;
    double v13 = v12;

    BOOL v14 = [(CRLInteractiveCanvasController *)self layerHost];
    long long v15 = [v14 canvasView];
    unsigned __int8 v16 = [v15 canvasLayer];
    [v16 contentInset];
    double v18 = v17;
    double v20 = v19;

    [v4 frame];
    double v22 = v21;
    [v4 contentOffset];
    double v24 = v11 + v22 - v23 - v20;
    [v4 frame];
    double v26 = v25;
    [v4 contentOffset];
    double v28 = v13 + v26 - v27 - v18;
    [v7 position];
    if (v30 != v24 || v29 != v28) {
      [v7 setPosition:v24, v28];
    }
    [(CRLInteractiveCanvasController *)self visibleBoundsRect];
    CGFloat v33 = v32;
    CGFloat v35 = v34;
    CGFloat v37 = v36;
    CGFloat v39 = v38;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    double v40 = [v7 sublayers];
    id v41 = [v40 countByEnumeratingWithState:&v65 objects:v72 count:16];
    if (v41)
    {
      id v42 = v41;
      uint64_t v43 = *(void *)v66;
      do
      {
        for (i = 0; i != v42; i = (char *)i + 1)
        {
          if (*(void *)v66 != v43) {
            objc_enumerationMutation(v40);
          }
          double v45 = *(void **)(*((void *)&v65 + 1) + 8 * i);
          [v45 frame];
          v74.origin.CGFloat x = v33;
          v74.origin.CGFloat y = v35;
          v74.size.CGFloat width = v37;
          v74.size.CGFloat height = v39;
          [v45 setHidden:!CGRectIntersectsRect(v73, v74)];
        }
        id v42 = [v40 countByEnumeratingWithState:&v65 objects:v72 count:16];
      }
      while (v42);
    }
  }
  double v46 = [(CRLInteractiveCanvasController *)self delegate];
  char v47 = objc_opt_respondsToSelector();

  if (v47)
  {
    double v48 = [(CRLInteractiveCanvasController *)self delegate];
    [v48 interactiveCanvasControllerDidScroll:self];
  }
  double v49 = +[NSNotificationCenter defaultCenter];
  CFStringRef v70 = @"CRLInteractiveCanvasControllerInteractionSourceKey";
  double v50 = [(CRLInteractiveCanvasController *)self p_sourceInteractionSourceForNotficiationUserInfo];
  uint64_t v71 = v50;
  double v51 = +[NSDictionary dictionaryWithObjects:&v71 forKeys:&v70 count:1];
  [v49 postNotificationName:@"CRLCanvasUpdateScrollNotification" object:self userInfo:v51];

  double v52 = [(CRLInteractiveCanvasController *)self layerHost];
  double v53 = [v52 asUIKitHost];
  [v53 scrollViewDidScroll];

  [(CRLInteractiveCanvasController *)self i_viewScrollDidChange];
  if ([(CRLInteractiveCanvasController *)self p_collaboratorOverlaysNeedUpdateForScroll])
  {
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    double v54 = [(NSMapTable *)self->mCollaboratorPresenceToCollaboratorHUDControllerDictionary crl_allObjects];
    id v55 = [v54 countByEnumeratingWithState:&v61 objects:v69 count:16];
    if (v55)
    {
      id v56 = v55;
      uint64_t v57 = *(void *)v62;
      do
      {
        for (j = 0; j != v56; j = (char *)j + 1)
        {
          if (*(void *)v62 != v57) {
            objc_enumerationMutation(v54);
          }
          [(CRLInteractiveCanvasController *)self invalidateLayersForDecorator:*(void *)(*((void *)&v61 + 1) + 8 * (void)j)];
        }
        id v56 = [v54 countByEnumeratingWithState:&v61 objects:v69 count:16];
      }
      while (v56);
    }
  }
  if ([(CRLInteractiveCanvasController *)self p_followEnabled]) {
    [(CRLInteractiveCanvasController *)self collapseAllExpandedCollaboratorHUDs];
  }
  if (self->mCreateRepsForOffscreenLayouts)
  {
    double v59 = [(CRLInteractiveCanvasController *)self layerHost];
    CGRect v60 = [v59 canvasLayer];
    [v60 crl_setNeedsLayoutForTilingLayers];
  }
  else
  {
    [(CRLInteractiveCanvasController *)self invalidateVisibleBounds];
  }
  if (!self->mCurrentlyScrolling) {
    [(CRLInteractiveCanvasController *)self p_viewScrollingEnded];
  }
}

- (BOOL)p_collaboratorOverlaysNeedUpdateForScroll
{
  if ([(NSMapTable *)self->mCollaboratorPresenceToCollaboratorHUDControllerDictionary count]) {
    return 1;
  }
  id v4 = [(CRLInteractiveCanvasController *)self collaboratorCursorDelegate];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  BOOL v5 = self->mCurrentCollaboratorPresences;
  id v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [v4 collaboratorCursorSelectionPathForRenderer:self collaboratorPresence:*(void *)(*((void *)&v16 + 1) + 8 * i)];
        if (v10)
        {
          double v11 = (void *)v10;
          double v12 = [(CRLInteractiveCanvasController *)self selectionModelTranslator];
          double v13 = [v12 boardItemsForSelectionPath:v11];
          id v14 = [v13 count];

          if (v14)
          {
            BOOL v3 = 1;
            goto LABEL_14;
          }
        }
      }
      id v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v3 = 0;
LABEL_14:

  return v3;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  [(CRLInteractiveCanvasController *)self p_setCurrentlyScrolling:1];
  [(CRLInteractiveCanvasController *)self beginScrollingOperation];
  id v4 = +[NSNotificationCenter defaultCenter];
  CFStringRef v7 = @"CRLInteractiveCanvasControllerInteractionSourceKey";
  BOOL v5 = [(CRLInteractiveCanvasController *)self p_sourceInteractionSourceForNotficiationUserInfo];
  uint64_t v8 = v5;
  id v6 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  [v4 postNotificationName:@"CRLCanvasWillScrollNotification" object:self userInfo:v6];
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4)
  {
    [(CRLInteractiveCanvasController *)self p_setCurrentlyScrolling:0];
    [(CRLInteractiveCanvasController *)self p_viewScrollingEnded];
  }
  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 postNotificationName:@"CRLCanvasWillEndDraggingNotification" object:self];
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  if ([(CRLInteractiveCanvasController *)self currentlyScrolling])
  {
    [(CRLInteractiveCanvasController *)self p_setCurrentlyScrolling:0];
    [(CRLInteractiveCanvasController *)self p_viewScrollingEnded];
  }
}

- (void)contentInsetsDidChangeForScrollView:(id)a3
{
  id v4 = [(CRLInteractiveCanvasController *)self layerHost];
  BOOL v3 = [v4 canvasLayer];
  [v3 fixFrameAndScrollView];
}

- (void)scrollViewDidChangeAdjustedContentInset:(id)a3
{
}

- (void)scrollView:(id)a3 willAnimateToContentOffset:(CGPoint)a4
{
  self->mAnimatingScroll = 1;
  -[CRLInteractiveCanvasController p_setCurrentlyScrolling:](self, "p_setCurrentlyScrolling:", 1, a4.x, a4.y);
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  id v4 = a3;
  self->mAnimatingScroll = 0;
  [(CRLInteractiveCanvasController *)self performSelector:"p_scrollViewDidEndScrollingAnimation:" withObject:v4 afterDelay:0.0];
  uint64_t v5 = objc_opt_class();
  id v6 = sub_1002469D0(v5, v4);
  if (v6
    && [(NSMapTable *)self->mCollaboratorPresenceToCollaboratorHUDControllerDictionary count]
    && ![(CRLInteractiveCanvasController *)self scrollViewShouldOptOutOfUIScrollViewContentOffsetAnimationForScrollView:v6])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    CFStringRef v7 = [(NSMapTable *)self->mCollaboratorPresenceToCollaboratorHUDControllerDictionary crl_allObjects];
    id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        double v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          [(CRLInteractiveCanvasController *)self invalidateLayersForDecorator:*(void *)(*((void *)&v12 + 1) + 8 * (void)v11)];
          double v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
}

- (BOOL)scrollViewShouldScrollToTop:(id)a3
{
  id v3 = a3;
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 postNotificationName:@"CRLiOSScrollViewWillScrollToTopNotification" object:v3];

  return 1;
}

- (void)scrollViewDidScrollToTop:(id)a3
{
  self->mAnimatingScroll = 0;
  [(CRLInteractiveCanvasController *)self performSelector:"p_scrollViewDidEndScrollingAnimation:" withObject:a3 afterDelay:0.0];
}

- (void)p_scrollViewDidEndScrollingAnimation:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(CRLInteractiveCanvasController *)self scrollViewDidScroll:v5];
  }
  BOOL v4 = ([v5 isDragging] & 1) != 0
    || ([v5 isDecelerating] & 1) != 0
    || self->mAnimatingScroll;
  [(CRLInteractiveCanvasController *)self p_setCurrentlyScrolling:v4];
  if (!self->mCurrentlyScrolling) {
    [(CRLInteractiveCanvasController *)self p_viewScrollingEnded];
  }
}

- (void)p_setCurrentlyScrolling:(BOOL)a3
{
  BOOL v3 = a3;
  if (!+[NSThread isMainThread])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F41F0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A9330();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F4210);
    }
    id v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    id v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController p_setCurrentlyScrolling:]");
    CFStringRef v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:6620 isFatal:0 description:"This operation must only be performed on the main thread."];
  }
  if (self->mCurrentlyScrolling != v3)
  {
    self->BOOL mCurrentlyScrolling = v3;
    if (v3)
    {
      id v8 = [(CRLInteractiveCanvasController *)self editingCoordinator];
      [v8 suspendCollaborationWithReason:@"CRLCanvasScrolling"];
    }
    else
    {
      if ([(CRLInteractiveCanvasController *)self p_areAnyCollaboratorsPresent]) {
        self->mSelectionIsCurrentlyOnscreen = [(CRLInteractiveCanvasController *)self p_currentSelectionIsOnscreen];
      }
      id v8 = [(CRLInteractiveCanvasController *)self editingCoordinator];
      [v8 resumeCollaborationWithReason:@"CRLCanvasScrolling"];
    }
  }
}

- (void)preprocessChanges:(id)a3 forChangeSource:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  mSelectionPathToScrollTo = self->mSelectionPathToScrollTo;
  if (mSelectionPathToScrollTo
    && [(CRLInteractiveCanvasController *)self shouldCancelScrollingToSelectionPath:mSelectionPathToScrollTo forChanges:v8 withChangeSource:v6])
  {
    self->mSelectionShouldBeClearedInDidProcessAllChanges = 1;
  }
}

- (BOOL)shouldCancelScrollingToSelectionPath:(id)a3 forChanges:(id)a4 withChangeSource:(id)a5
{
  return 1;
}

- (void)didProcessAllChanges
{
  if (self->mSelectionShouldBeClearedInDidProcessAllChanges)
  {
    if (self->mSelectionPathToScrollTo)
    {
      if (qword_101719A68 != -1) {
        dispatch_once(&qword_101719A68, &stru_1014F4230);
      }
      BOOL v3 = off_10166B498;
      if (os_log_type_enabled((os_log_t)off_10166B498, OS_LOG_TYPE_INFO))
      {
        mSelectionPathToScrollTo = self->mSelectionPathToScrollTo;
        int v5 = 138412290;
        id v6 = mSelectionPathToScrollTo;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Cancelling scroll to %@.", (uint8_t *)&v5, 0xCu);
      }
    }
    [(CRLInteractiveCanvasController *)self cancelScrollToCurrentSelectionPathAfterLayout];
    self->mSelectionShouldBeClearedInDidProcessAllChanges = 0;
  }
}

- (BOOL)selectionPathContainsOnlyInfosOnCanvas:(id)a3
{
  return 1;
}

- (void)p_updateInfosToDisplayIfNeeded
{
  BOOL v3 = [(CRLInteractiveCanvasController *)self board];
  BOOL v4 = [v3 infosToDisplayForInteractiveCanvas];
  id v5 = [v4 mutableCopy];

  mMultiselectResizeInfo = self->mMultiselectResizeInfo;
  if (mMultiselectResizeInfo)
  {
    CFStringRef v7 = [(CRLMultiselectResizeInfo *)mMultiselectResizeInfo parentInfo];

    if (!v7) {
      [v5 addObject:self->mMultiselectResizeInfo];
    }
  }
  id v8 = [(CRLInteractiveCanvasController *)self temporaryAdditionalBoardItemsToDisplay];
  id v9 = [v8 count];

  if (v9)
  {
    uint64_t v10 = [(CRLInteractiveCanvasController *)self temporaryAdditionalBoardItemsToDisplay];
    double v11 = [v5 crl_intersectionWithArray:v10];
    id v12 = [v11 count];

    if (v12)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F4250);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010A93B8();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F4270);
      }
      long long v13 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v13);
      }
      long long v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController p_updateInfosToDisplayIfNeeded]");
      long long v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"];
      +[CRLAssertionHandler handleFailureInFunction:v14 file:v15 lineNumber:6705 isFatal:0 description:"Temporary additional board items should not already be in our model!"];
    }
    long long v16 = [(CRLInteractiveCanvasController *)self temporaryAdditionalBoardItemsToDisplay];
    [v5 addObjectsFromArray:v16];
  }
  long long v17 = [(CRLInteractiveCanvasController *)self infosToDisplay];
  unsigned __int8 v18 = [v17 isEqual:v5];

  if ((v18 & 1) == 0) {
    [(CRLInteractiveCanvasController *)self setInfosToDisplay:v5];
  }
}

- (void)processChanges:(id)a3 forChangeSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!+[NSThread isMainThread])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F4290);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A9440();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F42B0);
    }
    id v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v8);
    }
    id v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController processChanges:forChangeSource:]");
    uint64_t v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v9 file:v10 lineNumber:6715 isFatal:0 description:"change notifications should only come in on the main thread"];
  }
  [(CRLInteractiveCanvasController *)self p_updateInfosToDisplayIfNeeded];
  if (objc_msgSend(v6, "crl_containsObjectPassingTest:", &stru_1014F42F0)) {
    [(CRLInteractiveCanvasController *)self recreateAllLayoutsAndReps];
  }
  mMultiselectResizeInfo = self->mMultiselectResizeInfo;
  if (mMultiselectResizeInfo)
  {
    id v12 = [(CRLMultiselectResizeInfo *)mMultiselectResizeInfo representedSelectedBoardItems];
    if ([v12 containsObject:v7])
    {
      unsigned int v13 = [v6 crl_containsObjectPassingTest:&stru_1014F4310];

      if (!v13) {
        goto LABEL_18;
      }
      id v12 = [(CRLInteractiveCanvasController *)self repForInfo:self->mMultiselectResizeInfo];
      [v12 invalidateKnobs];
    }
  }
LABEL_18:
  if ([(CRLCanvas *)self->mCanvas i_needsLayout])
  {
    long long v14 = [(CRLInteractiveCanvasController *)self layerHost];
    long long v15 = [v14 canvasLayer];
    [v15 setNeedsLayout];
  }
  uint64_t v16 = objc_opt_class();
  double v22 = sub_100246DEC(v7, v16, 1, v17, v18, v19, v20, v21, (uint64_t)&OBJC_PROTOCOL___CRLCanvasElementInfo);
  if (v22)
  {
    double v23 = [(CRLInteractiveCanvasController *)self repsForInfo:v22];
    [v23 makeObjectsPerformSelector:"processChanges:" withObject:v6];
  }
}

- (void)i_acquireLockAndPerformAction:(id)a3
{
  uint64_t v13 = 0;
  long long v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1003A22A8;
  v10[3] = &unk_1014F4338;
  v10[4] = self;
  id v3 = a3;
  id v11 = v3;
  id v12 = &v13;
  BOOL v4 = objc_retainBlock(v10);
  ((void (*)(void))v4[2])();
  if (!*((unsigned char *)v14 + 24))
  {
    int v5 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F4358);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A94C8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F4378);
    }
    id v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = +[CRLAssertionHandler packedBacktraceString];
      sub_101069C40(v7, (uint64_t)v17, v5);
    }

    id v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController i_acquireLockAndPerformAction:]");
    id v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v8 file:v9 lineNumber:6763 isFatal:0 description:"failed to perform locked action"];
  }
  _Block_object_dispose(&v13, 8);
}

- (void)makeEditorPerformAction:(SEL)a3 withSender:(id)a4
{
  id v8 = a4;
  id v6 = [(CRLInteractiveCanvasController *)self editorController];
  id v7 = [v6 editorForEditAction:a3 withSender:v8];

  if (v7) {
    [v7 performSelector:a3 withObject:v8];
  }
}

- (BOOL)canPerformInteractiveAction:(SEL)a3 withSender:(id)a4
{
  uint64_t v10 = 0;
  id v6 = a4;
  id v7 = [(CRLInteractiveCanvasController *)self editorController];
  id v8 = [v7 editorForEditAction:a3 withSender:v6 response:&v10];

  return v8 != 0;
}

- (void)performDiscreteFrameChangingOperationOnDrawables:(id)a3 withBlock:(id)a4
{
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (void)setTextResponderEditorTo:(id)a3 withFlags:(unint64_t)a4
{
  id v6 = a3;
  if (v6
    || !self->mPreventSettingNilEditorOnTextResponder
    && (!self->mTextInputResponderShareCount
     || ([(CRLTextInputResponder *)self->mTextInputResponder editor],
         id v7 = objc_claimAutoreleasedReturnValue(),
         v7,
         id v6 = 0,
         !v7)))
  {
    id v8 = v6;
    [(CRLTextInputResponder *)self->mTextInputResponder setEditor:v6 withFlags:a4];
    id v6 = v8;
  }
}

- (void)i_textDidChange
{
  if ([(CRLCanvas *)self->mCanvas i_needsLayout])
  {
    if (!+[NSThread isMainThread])
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F4398);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010A9550();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F43B8);
      }
      id v3 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v3);
      }
      BOOL v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController i_textDidChange]");
      int v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"];
      +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:6852 isFatal:0 description:"Don't expect to have changed text on background thread"];
    }
    self->mNotifyTIRTextChangedAfterLayout = 1;
  }
}

- (void)i_selectionDidChange
{
  if ([(CRLCanvas *)self->mCanvas i_needsLayout])
  {
    if (!+[NSThread isMainThread])
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F43D8);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010A95D8();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F43F8);
      }
      id v3 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v3);
      }
      BOOL v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController i_selectionDidChange]");
      int v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"];
      +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:6865 isFatal:0 description:"Don't expect to have changed selection on background thread"];
    }
    ++self->mNotifyTIRSelectionChangedAfterLayout;
  }
}

- (void)beginAnimations:(id)a3
{
  id v4 = a3;
  if (self->mCurrentAnimation)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F4418);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A9660();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F4438);
    }
    int v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    id v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController beginAnimations:]");
    id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:6881 isFatal:0 description:"animation nesting not yet supported"];
  }
  +[CATransaction flush];
  +[CATransaction begin];
  id v8 = [[CRLCanvasAnimation alloc] initWithAnimationID:v4];
  mCurrentAnimation = self->mCurrentAnimation;
  self->mCurrentAnimation = v8;
}

- (void)commitAnimations
{
  mCurrentAnimation = self->mCurrentAnimation;
  if (!mCurrentAnimation)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F4458);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A96E8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F4478);
    }
    id v4 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v4);
    }
    int v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController commitAnimations]");
    id v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v5 file:v6 lineNumber:6890 isFatal:0 description:"can't commit if we don't have an animation open"];

    mCurrentAnimation = self->mCurrentAnimation;
  }
  self->mCurrentAnimation = 0;

  +[CATransaction commit];
}

- (_TtC8Freeform28CRLMathCalculationController)mathCalculationController
{
  mMathCalculationController = self->mMathCalculationController;
  if (!mMathCalculationController)
  {
    id v4 = objc_alloc_init(_TtC8Freeform28CRLMathCalculationController);
    int v5 = self->mMathCalculationController;
    self->mMathCalculationController = v4;

    mMathCalculationController = self->mMathCalculationController;
  }

  return mMathCalculationController;
}

- (void)i_canvasWillLayout:(id)a3
{
  uint64_t v4 = objc_opt_class();
  int v5 = [(CRLInteractiveCanvasController *)self freehandDrawingToolkit];
  id v6 = [v5 currentTool];
  id v7 = sub_1002469D0(v4, v6);

  if ([v7 isCurrentlyTracking]) {
    [v7 doWorkBeforeCanvasLayout];
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v8 = self->mRepsToSetNeedsDisplay;
  id v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v37;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v37 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v36 + 1) + 8 * i);
        long long v14 = [(CRLInteractiveCanvasController *)self renderableForRep:v13];
        uint64_t v15 = v14;
        if (v14)
        {
          char v16 = [v14 layer];
          [(CRLInteractiveCanvasController *)self setNeedsDisplayOnLayer:v16];
        }
        [(NSMapTable *)self->mRepsToRectsToInvalidate removeObjectForKey:v13];
      }
      id v10 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v10);
  }

  [(NSMutableSet *)self->mRepsToSetNeedsDisplay removeAllObjects];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v17 = self->mRepsToRectsToInvalidate;
  id v18 = [(NSMapTable *)v17 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v33;
    do
    {
      for (j = 0; j != v19; j = (char *)j + 1)
      {
        if (*(void *)v33 != v20) {
          objc_enumerationMutation(v17);
        }
        double v22 = *(void **)(*((void *)&v32 + 1) + 8 * (void)j);
        double v23 = [(CRLInteractiveCanvasController *)self renderableForRep:v22];
        if (v23)
        {
          memset(&v31[1], 0, sizeof(CGAffineTransform));
          if (v22) {
            [v22 transformToConvertNaturalToLayerRelative];
          }
          double v24 = [(NSMapTable *)self->mRepsToRectsToInvalidate objectForKey:v22];
          if ([v24 count])
          {
            unint64_t v25 = 0;
            do
            {
              [v24 rectAtIndex:v25];
              v31[0] = v31[1];
              CGRect v43 = CGRectApplyAffineTransform(v42, v31);
              double x = v43.origin.x;
              double y = v43.origin.y;
              double width = v43.size.width;
              double height = v43.size.height;
              double v30 = [v23 layer];
              -[CRLInteractiveCanvasController setNeedsDisplayInRect:onLayer:](self, "setNeedsDisplayInRect:onLayer:", v30, x, y, width, height);

              ++v25;
            }
            while (v25 < (unint64_t)[v24 count]);
          }
        }
      }
      id v19 = [(NSMapTable *)v17 countByEnumeratingWithState:&v32 objects:v40 count:16];
    }
    while (v19);
  }

  [(NSMapTable *)self->mRepsToRectsToInvalidate removeAllObjects];
}

- (void)i_layout
{
  if (!+[NSThread isMainThread])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F4498);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A9770();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F44B8);
    }
    id v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    uint64_t v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController i_layout]");
    int v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 6944, 0, "i_layout should only be called by our CV, from the main thread");
  }
  [(CRLCanvas *)self->mCanvas i_layoutIfNeededUpdatingLayerTree];
  sub_1001AF1B8();
}

- (void)i_viewWillBeginZooming
{
  [(CRLInteractiveCanvasController *)self viewScale];
  self->mDynamicViewScale = v3;
  self->mDynamicallyZooming = 1;
  [(CRLInteractiveCanvasController *)self p_beginZoomingOperation];
  uint64_t v4 = [(CRLInteractiveCanvasController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CRLInteractiveCanvasController *)self delegate];
    [v6 interactiveCanvasControllerWillZoom:self];
  }
  id v7 = +[NSNotificationCenter defaultCenter];
  CFStringRef v25 = @"CRLInteractiveCanvasControllerInteractionSourceKey";
  id v8 = [(CRLInteractiveCanvasController *)self p_sourceInteractionSourceForNotficiationUserInfo];
  double v26 = v8;
  id v9 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
  [v7 postNotificationName:@"CRLCanvasWillZoomNotification" object:self userInfo:v9];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v10 = [(CRLCanvas *)self->mCanvas topLevelReps];
  id v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v21;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v20 + 1) + 8 * i) recursivelyPerformSelectorIfImplemented:"willBeginZooming"];
      }
      id v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v12);
  }

  uint64_t v15 = [(CRLInteractiveCanvasController *)self editingCoordinator];
  [v15 suspendCollaborationWithReason:@"CRLCanvasZooming"];

  char v16 = [(CRLInteractiveCanvasController *)self layerHost];
  uint64_t v17 = [v16 canvasLayer];
  [v17 layoutIfNeeded];

  id v18 = [(CRLInteractiveCanvasController *)self layerHost];
  id v19 = [v18 canvasLayer];
  [v19 updateCanvasEdgeLayersIfNecessary];
}

- (void)i_viewIsZoomingAtPoint:(CGPoint)a3
{
  self->mZoomCenterInBounds = a3;
}

- (void)i_viewDidZoomToViewScale:(double)a3 notify:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = [(CRLInteractiveCanvasController *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = [(CRLInteractiveCanvasController *)self delegate];
    [v9 interactiveCanvasControllerIsZooming:self];
  }
  if (v4)
  {
    id v10 = +[NSNotificationCenter defaultCenter];
    v14[0] = @"CRLInteractiveCanvasControllerInteractionSourceKey";
    id v11 = [(CRLInteractiveCanvasController *)self p_sourceInteractionSourceForNotficiationUserInfo];
    v14[1] = @"CRLInteractiveCanvasControllerViewScaleKey";
    v15[0] = v11;
    id v12 = +[NSNumber numberWithDouble:a3];
    v15[1] = v12;
    uint64_t v13 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
    [v10 postNotificationName:@"CRLCanvasUpdateZoomNotification" object:self userInfo:v13];
  }
  [(CRLInteractiveCanvasController *)self willChangeValueForKey:@"currentViewScale"];
  self->mDynamicViewScale = a3;
  [(CRLInteractiveCanvasController *)self didChangeValueForKey:@"currentViewScale"];
}

- (void)viewDidEndZooming
{
}

- (void)i_viewDidEndZoomingWithUserInfo:(id)a3
{
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  char v5 = [(CRLCanvas *)self->mCanvas topLevelReps];
  id v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v19 + 1) + 8 * i) recursivelyPerformSelectorIfImplemented:"didEndZooming"];
      }
      id v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }

  id v10 = [(CRLInteractiveCanvasController *)self editingCoordinator];
  [v10 resumeCollaborationWithReason:@"CRLCanvasZooming"];

  if ([(CRLInteractiveCanvasController *)self shouldCanvasScrollingSizeGrowToFitBoardContent])
  {
    id v11 = [(CRLInteractiveCanvasController *)self layerHost];
    id v12 = [v11 canvasLayer];
    [v12 fixFrameAndScrollView];
  }
  self->mDynamicallyZooming = 0;
  [(CRLInteractiveCanvasController *)self invalidateVisibleBounds];
  [(CRLInteractiveCanvasController *)self p_endZoomingOperation];
  uint64_t v13 = [(CRLInteractiveCanvasController *)self delegate];
  char v14 = objc_opt_respondsToSelector();

  if (v14)
  {
    uint64_t v15 = [(CRLInteractiveCanvasController *)self delegate];
    [v15 interactiveCanvasControllerDidZoom:self];
  }
  char v16 = +[NSNotificationCenter defaultCenter];
  [v16 postNotificationName:@"CRLCanvasDidZoomNotification" object:self userInfo:v4];

  uint64_t v17 = [(CRLInteractiveCanvasController *)self layerHost];
  id v18 = [v17 canvasLayer];
  [v18 updateCanvasEdgeLayersIfNecessary];
}

- (void)i_canvasContentsScaleDidChange
{
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  double v3 = [(CRLInteractiveCanvasController *)self i_decorators];
  id v4 = [v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v19;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          [v8 screenScaleDidChange];
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v5);
  }

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = [(CRLCanvas *)self->mCanvas topLevelReps];
  id v10 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      for (j = 0; j != v11; j = (char *)j + 1)
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * (void)j) recursivelyPerformSelector:"screenScaleDidChange"];
      }
      id v11 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v11);
  }
}

- (void)i_canvasWideGamutValueDidChange
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  signed int v2 = [(CRLCanvas *)self->mCanvas topLevelReps];
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
        [*(id *)(*((void *)&v7 + 1) + 8 * i) recursivelyPerformSelector:"wideGamutValueDidChange"];
      }
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)i_viewScaleDidChange
{
  [(CRLInteractiveCanvasController *)self i_canvasDidUpdateVisibleBounds];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v3 = [(CRLCanvas *)self->mCanvas topLevelReps];
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
        [*(id *)(*((void *)&v8 + 1) + 8 * i) recursivelyPerformSelector:"viewScaleDidChange"];
      }
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  [(CRLInteractiveCanvasController *)self layoutInvalidated];
  [(CRLInteractiveCanvasController *)self invalidateAllLayers];
}

- (double)i_viewScaleForProposedViewScale:(double)a3 originalViewScale:(double)a4 isFastPinch:(BOOL)a5
{
  BOOL v5 = a5;
  p_mDelegate = &self->mDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  char v11 = objc_opt_respondsToSelector();

  id v12 = objc_loadWeakRetained((id *)p_mDelegate);
  uint64_t v13 = v12;
  if (v11)
  {
    [v12 canvasViewScaleForProposedViewScale:a3 originalViewScale:a4];
    a3 = v14;
  }
  else
  {
    char v15 = objc_opt_respondsToSelector();

    if (v15)
    {
      id v16 = objc_loadWeakRetained((id *)p_mDelegate);
      long long v17 = [v16 canvasViewScaleDetentsForInteractiveCanvasController:self isFastPinch:v5];
      long long v18 = [v17 sortedArrayUsingSelector:"compare:"];

      if ((unint64_t)[v18 count] < 2)
      {
        double v21 = 0.04;
      }
      else
      {
        id v19 = [v18 count];
        long long v20 = +[NSMutableIndexSet indexSet];
        double v21 = 0.04;
        if (v19 != (id)1)
        {
          for (uint64_t i = 1; (id)i != v19; ++i)
          {
            long long v23 = [v18 objectAtIndexedSubscript:i - 1];
            [v23 crl_CGFloatValue];
            double v25 = v24;

            double v26 = [v18 objectAtIndexedSubscript:i];
            [v26 crl_CGFloatValue];
            double v28 = v27;

            double v29 = (v28 - v25) * 0.5;
            if (v29 <= 0.02)
            {
              if (vabdd_f64(a3, v25) >= vabdd_f64(a3, v28)) {
                uint64_t v30 = i - 1;
              }
              else {
                uint64_t v30 = i;
              }
              [v20 addIndex:v30];
            }
            else if (v21 > v29)
            {
              double v21 = (v28 - v25) * 0.5;
            }
          }
        }
        if ([v20 count])
        {
          id v31 = [v18 mutableCopy];
          [v31 removeObjectsAtIndexes:v20];

          long long v18 = v31;
        }
      }
      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      id v32 = v18;
      id v33 = [v32 countByEnumeratingWithState:&v39 objects:v43 count:16];
      if (v33)
      {
        id v34 = v33;
        uint64_t v35 = *(void *)v40;
        while (2)
        {
          for (j = 0; j != v34; j = (char *)j + 1)
          {
            if (*(void *)v40 != v35) {
              objc_enumerationMutation(v32);
            }
            [*(id *)(*((void *)&v39 + 1) + 8 * (void)j) crl_CGFloatValue:(void)v39];
            if (vabdd_f64(a3, v37) < v21)
            {
              a3 = v37;
              goto LABEL_29;
            }
          }
          id v34 = [v32 countByEnumeratingWithState:&v39 objects:v43 count:16];
          if (v34) {
            continue;
          }
          break;
        }
      }
LABEL_29:
    }
  }
  return a3;
}

- (CGSize)i_canvasCenterOffsetForProposedViewScale:(double)a3 originalViewScale:(double)a4
{
  p_mDelegate = &self->mDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = objc_loadWeakRetained((id *)p_mDelegate);
    [v9 canvasCenterOffsetForProposedViewScale:a3 originalViewScale:a4];
    CGFloat width = v10;
    CGFloat height = v12;
  }
  else
  {
    CGFloat width = CGSizeZero.width;
    CGFloat height = CGSizeZero.height;
  }
  double v14 = width;
  double v15 = height;
  result.CGFloat height = v15;
  result.CGFloat width = v14;
  return result;
}

- (double)i_nextCanvasViewScaleDetentForProposedViewScale:(double)a3 greater:(BOOL)a4 isFastPinch:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  p_mDelegate = &self->mDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  char v11 = objc_opt_respondsToSelector();

  id v12 = objc_loadWeakRetained((id *)p_mDelegate);
  uint64_t v13 = v12;
  if (v11)
  {
    [v12 nextCanvasViewScaleDetentForProposedViewScale:v6 greater:a3];
    double v15 = v14;

    return v15;
  }
  char v16 = objc_opt_respondsToSelector();

  if ((v16 & 1) == 0)
  {
    long long v38 = [(CRLInteractiveCanvasController *)self layerHost];
    long long v39 = [v38 canvasLayer];
    long long v40 = v39;
    if (v6) {
      [v39 maximumPinchViewScale];
    }
    else {
      [v39 minimumPinchViewScale];
    }
    double v15 = v41;

    return v15;
  }
  id v17 = objc_loadWeakRetained((id *)p_mDelegate);
  long long v18 = [v17 canvasViewScaleDetentsForInteractiveCanvasController:self isFastPinch:v5];

  id v19 = [(CRLInteractiveCanvasController *)self layerHost];
  long long v20 = [v19 canvasLayer];
  [v20 minimumPinchViewScale];
  double v21 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v48[0] = v21;
  long long v22 = [(CRLInteractiveCanvasController *)self layerHost];
  long long v23 = [v22 canvasLayer];
  [v23 maximumPinchViewScale];
  double v24 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v48[1] = v24;
  double v25 = +[NSArray arrayWithObjects:v48 count:2];
  double v26 = [v18 crl_arrayByAddingNonContainedObjectsFromArray:v25];

  double v27 = [v26 sortedArrayUsingSelector:"compare:"];

  double v28 = [v27 objectAtIndexedSubscript:0];
  [v28 crl_CGFloatValue];
  double v30 = v29;

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v31 = v27;
  id v32 = [v31 countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (v32)
  {
    id v33 = v32;
    uint64_t v34 = *(void *)v44;
    do
    {
      uint64_t v35 = 0;
      double v36 = v30;
      do
      {
        if (*(void *)v44 != v34) {
          objc_enumerationMutation(v31);
        }
        [*(id *)(*((void *)&v43 + 1) + 8 * (void)v35) crl_CGFloatValue:(void)v43];
        double v30 = v37;
        if (v6)
        {
          if (v37 > a3) {
            goto LABEL_18;
          }
        }
        else if (v37 >= a3)
        {
          goto LABEL_19;
        }
        uint64_t v35 = (char *)v35 + 1;
        double v36 = v37;
      }
      while (v33 != v35);
      id v33 = [v31 countByEnumeratingWithState:&v43 objects:v47 count:16];
      double v36 = v30;
    }
    while (v33);
  }
  else
  {
LABEL_18:
    double v36 = v30;
  }
LABEL_19:

  return v36;
}

- (void)i_viewScrollDidChange
{
  [(CRLInteractiveCanvasController *)self i_canvasDidUpdateVisibleBounds];
  id v3 = [(CRLInteractiveCanvasController *)self layerHost];
  id v4 = [v3 canvasLayer];
  BOOL v5 = [v4 associatedBackgroundLayer];
  [v5 setNeedsLayout];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  BOOL v6 = [(CRLCanvas *)self->mCanvas topLevelReps];
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * i) recursivelyPerformSelector:"viewScrollDidChange"];
      }
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)i_viewScrollingEnded
{
}

- (void)i_viewScrollingEndedWithUserInfo:(id)a3
{
  id v4 = a3;
  [(CRLInteractiveCanvasController *)self endScrollingOperation];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  BOOL v5 = [(CRLCanvas *)self->mCanvas topLevelReps];
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * i) recursivelyPerformSelector:"viewScrollingEnded"];
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    id v12 = objc_loadWeakRetained((id *)&self->mDelegate);
    [v12 interactiveCanvasControllerDidStopScrolling:self];
  }
  long long v13 = +[NSNotificationCenter defaultCenter];
  [v13 postNotificationName:@"CRLCanvasDidScrollNotification" object:self userInfo:v4];
}

- (void)i_recordUserViewScale
{
  id v11 = [(CRLEditorController *)self->mEditorController textInputEditor];
  if (objc_opt_respondsToSelector())
  {
    id v3 = [(CRLInteractiveCanvasController *)self canvas];
    [v3 viewScale];
    double v5 = v4;

    [v11 targetPointSizeForSelectionWithViewScale:v5];
    if (v6 >= 12.0 && v6 <= 72.0) {
      -[CRLInteractiveCanvasController p_setTargetPointSize:](self, "p_setTargetPointSize:");
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = objc_loadWeakRetained((id *)&self->mDelegate);
    [v10 interactiveCanvasControllerDidZoomWithUserGesture:self];
  }
}

- (void)i_repNeedsDisplay:(id)a3
{
  id v8 = a3;
  double v4 = [(CRLInteractiveCanvasController *)self i_interactiveCanvasLayerHelper];

  if (v4)
  {
    double v5 = [(CRLInteractiveCanvasController *)self renderableForRep:v8];
    if (v5 && ([v8 directlyManagesLayerContent] & 1) == 0)
    {
      [(NSMutableSet *)self->mRepsToSetNeedsDisplay addObject:v8];
      double v6 = [(CRLInteractiveCanvasController *)self layerHost];
      id v7 = [v6 canvasLayer];
      [v7 setNeedsLayout];
    }
    else
    {
      [(CRLInteractiveCanvasController *)self i_setNeedsDisplayIfNeededForAncestorRepOf:v8];
    }
  }
}

- (void)i_repNeedsDisplay:(id)a3 inRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v15 = a3;
  char v9 = [(CRLInteractiveCanvasController *)self i_interactiveCanvasLayerHelper];

  if (v9)
  {
    id v11 = [(CRLInteractiveCanvasController *)self renderableForRep:v15];
    if (v11 && ([v15 directlyManagesLayerContent] & 1) == 0)
    {
      id v12 = [(NSMapTable *)self->mRepsToRectsToInvalidate objectForKey:v15];
      if (!v12)
      {
        id v12 = objc_alloc_init(CRLMutableRectList);
        [(NSMapTable *)self->mRepsToRectsToInvalidate setObject:v12 forKey:v15];
      }
      -[CRLMutableRectList addRect:](v12, "addRect:", x, y, width, height);
      long long v13 = [(CRLInteractiveCanvasController *)self layerHost];
      long long v14 = [v13 canvasLayer];
      [v14 setNeedsLayout];
    }
    else
    {
      -[CRLInteractiveCanvasController p_setNeedsDisplayIfNeededForAncestorRepOf:inRect:](self, "p_setNeedsDisplayIfNeededForAncestorRepOf:inRect:", v15, x, y, width, height);
    }
  }

  _objc_release_x2(v10);
}

- (CRLCanvasAnimation)i_currentAnimation
{
  return self->mCurrentAnimation;
}

- (id)i_descriptionForViewScale:(double)a3 zoomMethod:(int64_t)a4
{
  id v7 = [(CRLInteractiveCanvasController *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (id WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate),
        [WeakRetained descriptionForCanvasViewScale:a4 zoomMethod:a3],
        char v9 = objc_claimAutoreleasedReturnValue(),
        WeakRetained,
        !v9))
  {
    if (objc_opt_respondsToSelector())
    {
      [v7 viewScaleToDisplayForCanvasViewScale:a3];
      a3 = v10;
    }
    id v11 = +[NSNumber numberWithDouble:a3];
    char v9 = +[NSNumberFormatter localizedStringFromNumber:v11 numberStyle:3];
  }

  return v9;
}

- (void)p_updateCanvasSizeFromLayouts
{
  [(CRLInteractiveCanvasController *)self defaultMinimumUnscaledCanvasSize];
  double v3 = sub_100064070();
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  double v10 = [(CRLInteractiveCanvasController *)self canvas];
  unsigned int v11 = [v10 isAnchoredAtRight];

  double v12 = 0.0;
  if (v11) {
    double v12 = v7;
  }
  double v13 = v3 - v12;
  if (v11) {
    double v14 = -1.79769313e308;
  }
  else {
    double v14 = 1.79769313e308;
  }
  [(CRLCanvas *)self->mCanvas unscaledRectOfLayouts];
  v39.origin.double x = v15;
  v39.origin.double y = v16;
  v39.size.double width = v17;
  v39.size.double height = v18;
  v36.origin.double x = v13;
  v36.origin.double y = v5;
  v36.size.double width = v7;
  v36.size.double height = v9;
  CGRect v37 = CGRectUnion(v36, v39);
  v40.origin.double x = 0.0;
  v40.origin.double y = 0.0;
  v40.size.double width = v14;
  v40.size.double height = 1.79769313e308;
  CGRect v38 = CGRectIntersection(v37, v40);
  double width = v38.size.width;
  double height = v38.size.height;
  [(CRLInteractiveCanvasController *)self canvasScrollingOutset];
  double v22 = sub_100064698(width, height, v21);
  double v24 = v23;
  if ([(CRLInteractiveCanvasController *)self isInDynamicOperation])
  {
    double v25 = [(CRLInteractiveCanvasController *)self layerHost];
    double v26 = [v25 canvasLayer];
    [v26 unscaledSize];
    double v28 = v27;

    if (v28 >= v22) {
      double v22 = v28;
    }
    double v29 = [(CRLInteractiveCanvasController *)self layerHost];
    double v30 = [v29 canvasLayer];
    [v30 unscaledSize];
    double v32 = v31;

    if (v32 >= v24) {
      double v24 = v32;
    }
  }
  id v34 = [(CRLInteractiveCanvasController *)self layerHost];
  id v33 = [v34 canvasLayer];
  [v33 setUnscaledSize:v22, v24];
}

- (BOOL)i_isRepContentPlatformView:(id)a3
{
  id v4 = a3;
  CGFloat v5 = [(CRLInteractiveCanvasController *)self i_interactiveCanvasLayerHelper];

  if (!v5)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F44D8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A97F8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F44F8);
    }
    double v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v6);
    }
    CGFloat v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController i_isRepContentPlatformView:]");
    double v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 7304, 0, "invalid nil value for '%{public}s'", "self.i_interactiveCanvasLayerHelper");
  }
  CGFloat v9 = [(CRLInteractiveCanvasController *)self i_interactiveCanvasLayerHelper];
  unsigned __int8 v10 = [v9 isRepContentPlatformView:v4];

  return v10;
}

- (void)i_drawRepWithReadLock:(id)a3 inContext:(CGContext *)a4 forLayer:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if (v7)
  {
    if (a4) {
      goto LABEL_22;
    }
    goto LABEL_13;
  }
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F4518);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_1010A9920();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F4538);
  }
  CGFloat v9 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_10106590C(v9);
  }
  unsigned __int8 v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController i_drawRepWithReadLock:inContext:forLayer:]");
  unsigned int v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"];
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 7309, 0, "invalid nil value for '%{public}s'", "rep");

  if (!a4)
  {
LABEL_13:
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F4558);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A988C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F4578);
    }
    double v12 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v12);
    }
    double v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController i_drawRepWithReadLock:inContext:forLayer:]");
    double v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 7310, 0, "invalid nil value for '%{public}s'", "ctx");
  }
LABEL_22:
  CGContextSaveGState(a4);
  [v7 setupForDrawingInLayer:v8 context:a4];
  if ([v7 drawsDescendantsIntoLayer])
  {
    CGContextSaveGState(a4);
    CGFloat v15 = [v7 layout];
    CGFloat v16 = [v15 geometry];
    CGFloat v17 = v16;
    if (v16) {
      [v16 transform];
    }
    else {
      memset(&v20, 0, sizeof(v20));
    }
    CGAffineTransformInvert(&transform, &v20);
    CGContextConcatCTM(a4, &transform);

    CGFloat v18 = [v7 childrenToExcludeWhenDrawingDescendantsIntoLayer];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1003A52E4;
    v19[3] = &unk_1014D0498;
    void v19[4] = v18;
    [v7 recursivelyDrawInContext:a4 keepingChildrenPassingTest:v19];
    CGContextRestoreGState(a4);
  }
  else
  {
    [v7 drawInLayerContext:a4];
  }
  [v7 didDrawInLayer:v8 context:a4];
  CGContextRestoreGState(a4);
}

- (void)p_viewScrollingEnded
{
  CFStringRef v5 = @"CRLInteractiveCanvasControllerInteractionSourceKey";
  double v3 = [(CRLInteractiveCanvasController *)self p_sourceInteractionSourceForNotficiationUserInfo];
  double v6 = v3;
  id v4 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];
  [(CRLInteractiveCanvasController *)self performSelector:"i_viewScrollingEndedWithUserInfo:" withObject:v4 afterDelay:0.0];
}

- (void)p_textGesturesWillBeginNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  double v6 = [v4 userInfo];

  id v7 = [v6 objectForKeyedSubscript:@"CRLTextGesturesICC"];
  sub_1002469D0(v5, v7);
  id v8 = (CRLInteractiveCanvasController *)objc_claimAutoreleasedReturnValue();

  if (v8 == self) {
    *(_DWORD *)&self->mTextGesturesInFlight = 1;
  }
}

- (void)p_textGesturesDidEndNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  double v6 = [v4 userInfo];
  id v7 = [v6 objectForKeyedSubscript:@"CRLTextGesturesICC"];
  sub_1002469D0(v5, v7);
  id v8 = (CRLInteractiveCanvasController *)objc_claimAutoreleasedReturnValue();

  if (v8 == self)
  {
    self->mTextGesturesInFlight = 0;
    if (self->mSelectionDidChangeDuringTextGestures)
    {
      self->mSelectionDidChangeDuringTextGestures = 0;
      id WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
      char v10 = objc_opt_respondsToSelector();

      if ((v10 & 1) == 0
        || (id v11 = objc_loadWeakRetained((id *)&self->mDelegate),
            unsigned int v12 = [v11 allowTextEditingToBegin],
            v11,
            v12))
      {
        double v13 = [(CRLInteractiveCanvasController *)self layerHost];
        double v14 = [v13 asiOSCVC];

        if ([v14 preserveEditorSelection]) {
          uint64_t v15 = 128;
        }
        else {
          uint64_t v15 = 0;
        }
        [(CRLInteractiveCanvasController *)self p_selectionDoneChangingWithFlags:v15];
      }
      if (self->mDidSuppressScrollToSelectionDuringTextGestures)
      {
        mSelectionPathToScrollTo = self->mSelectionPathToScrollTo;
        CGFloat v17 = [(CRLInteractiveCanvasController *)self editorController];
        CGFloat v18 = [v17 selectionPath];
        LODWORD(mSelectionPathToScrollTo) = [(CRLSelectionPath *)mSelectionPathToScrollTo isEqual:v18];

        if (mSelectionPathToScrollTo)
        {
          unint64_t v19 = self->mOptionsForScrollingToSelection | 0x100;
        }
        else
        {
          if (self->mShouldAnimateScrollAfterTextGestures) {
            unint64_t v19 = 257;
          }
          else {
            unint64_t v19 = 256;
          }
          if ([(CRLInteractiveCanvasController *)self shouldZoomOnSelectionChange]) {
            v19 |= 2uLL;
          }
        }
        [(CRLInteractiveCanvasController *)self layoutInvalidated];
        CGAffineTransform v20 = [(CRLInteractiveCanvasController *)self editorController];
        double v21 = [v20 selectionPath];
        [(CRLInteractiveCanvasController *)self scrollToSelectionPath:v21 scrollOptions:v19];
      }
    }
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    double v22 = [(CRLCanvas *)self->mCanvas topLevelReps];
    id v23 = [v22 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v24; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v28 != v25) {
            objc_enumerationMutation(v22);
          }
          [*(id *)(*((void *)&v27 + 1) + 8 * i) recursivelyPerformSelectorIfImplemented:"gesturesDidEnd:" withObject:v4];
        }
        id v24 = [v22 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v24);
    }
  }
}

- (void)p_selectionPathDidChangeFromSelectionPath:(id)a3 toSelectionPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CRLInteractiveCanvasController *)self selectionModelTranslator];
  CGFloat v9 = v8;
  if (v6) {
    [v8 infosForSelectionPath:v6];
  }
  else {
  char v10 = +[NSSet set];
  }
  long long v28 = v7;
  long long v29 = v6;
  long long v27 = v9;
  if (v7) {
    [v9 infosForSelectionPath:v7];
  }
  else {
  id v11 = +[NSSet set];
  }
  unsigned int v12 = [v11 crl_setBySubtractingSet:v10];
  double v26 = v10;
  id v24 = [v10 crl_setBySubtractingSet:v11];
  uint64_t v25 = v12;
  id v23 = [v12 setByAddingObjectsFromSet:];
  double v13 = -[CRLInteractiveCanvasController p_infosByAddingAllAncestors:](self, "p_infosByAddingAllAncestors:");
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v14 = [v13 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v15; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v35 != v16) {
          objc_enumerationMutation(v13);
        }
        CGFloat v18 = [(CRLInteractiveCanvasController *)self repsForInfo:*(void *)(*((void *)&v34 + 1) + 8 * i)];
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        id v19 = [v18 countByEnumeratingWithState:&v30 objects:v38 count:16];
        if (v19)
        {
          id v20 = v19;
          uint64_t v21 = *(void *)v31;
          do
          {
            for (j = 0; j != v20; j = (char *)j + 1)
            {
              if (*(void *)v31 != v21) {
                objc_enumerationMutation(v18);
              }
              [(CRLInteractiveCanvasController *)self invalidateOverlayLayersForRep:*(void *)(*((void *)&v30 + 1) + 8 * (void)j)];
            }
            id v20 = [v18 countByEnumeratingWithState:&v30 objects:v38 count:16];
          }
          while (v20);
        }
      }
      id v15 = [v13 countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v15);
  }
  if (self->mTextGesturesInFlight) {
    self->mSelectionDidChangeDuringTextGestures = 1;
  }
  [(CRLInteractiveCanvasController *)self sendRealTimeEnterToPeersIfNecessary];
  [(CRLInteractiveCanvasController *)self sendSelectionPathToPeersIfNecessary];
}

- (id)p_infosByAddingAllAncestors:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableSet set];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v5);
        }
        char v10 = [*(id *)(*((void *)&v28 + 1) + 8 * i) parentInfo];
        id v11 = (objc_class *)objc_opt_class();
        CGFloat v17 = sub_100246E2C(v10, v11, 1, v12, v13, v14, v15, v16, (uint64_t)&OBJC_PROTOCOL___CRLCanvasElementInfo);

        if (v17)
        {
          do
          {
            [v4 addObject:v17];
            CGFloat v18 = [v17 parentInfo];
            id v19 = (objc_class *)objc_opt_class();
            uint64_t v25 = sub_100246E2C(v18, v19, 1, v20, v21, v22, v23, v24, (uint64_t)&OBJC_PROTOCOL___CRLCanvasElementInfo);

            CGFloat v17 = (void *)v25;
          }
          while (v25);
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v7);
  }

  double v26 = [v5 setByAddingObjectsFromSet:v4];

  return v26;
}

- (void)p_selectionDoneChangingWithFlags:(unint64_t)a3
{
  p_mDelegate = &self->mDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_mDelegate);
    [v7 selectionPathDidChangeWithFlags:a3];
  }
}

- (double)defaultTargetPointSize
{
  signed int v2 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  [v2 pointSize];
  double v4 = v3;

  return v4;
}

- (double)targetPointSize
{
  double v3 = +[NSUserDefaults standardUserDefaults];
  [v3 floatForKey:@"TSDTargetPointSize"];
  float v5 = v4;

  if (v5 != 0.0) {
    return v5;
  }

  [(CRLInteractiveCanvasController *)self defaultTargetPointSize];
  return result;
}

- (void)p_setTargetPointSize:(double)a3
{
  id v5 = +[NSUserDefaults standardUserDefaults];
  *(float *)&double v4 = a3;
  [v5 setFloat:@"TSDTargetPointSize" forKey:v4];
}

- (CGRect)outsetSelectionRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (!CGRectIsNull(a3))
  {
    v15.origin.CGFloat x = CGRectZero.origin.x;
    v15.origin.CGFloat y = CGRectZero.origin.y;
    v15.size.CGFloat width = CGRectZero.size.width;
    v15.size.CGFloat height = CGRectZero.size.height;
    v11.origin.CGFloat x = x;
    v11.origin.CGFloat y = y;
    v11.size.CGFloat width = width;
    v11.size.CGFloat height = height;
    if (!CGRectEqualToRect(v11, v15))
    {
      v12.origin.CGFloat x = x;
      v12.origin.CGFloat y = y;
      v12.size.CGFloat width = width;
      v12.size.CGFloat height = height;
      CGRect v13 = CGRectInset(v12, -15.0, -15.0);
      CGFloat x = v13.origin.x;
      CGFloat y = v13.origin.y;
      CGFloat width = v13.size.width;
      CGFloat height = v13.size.height;
    }
  }
  double v7 = x;
  double v8 = y;
  double v9 = width;
  double v10 = height;
  result.size.CGFloat height = v10;
  result.size.CGFloat width = v9;
  result.origin.CGFloat y = v8;
  result.origin.CGFloat x = v7;
  return result;
}

- (void)i_setNeedsDisplayIfNeededForAncestorRepOf:(id)a3
{
  id v4 = a3;
  [v4 clipRect];
  if (-[CRLInteractiveCanvasController p_setNeedsDisplayIfNeededForAncestorRepOf:inRect:](self, "p_setNeedsDisplayIfNeededForAncestorRepOf:inRect:", v4))
  {
    [(NSMutableSet *)self->mRepsDrawnIntoAncestorToSetNeedsDisplayOnUpdatedGeometry addObject:v4];
  }
}

- (BOOL)p_setNeedsDisplayIfNeededForAncestorRepOf:(id)a3 inRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a3;
  double v10 = [v9 ancestorRepForDrawingIntoLayer];
  if (v10)
  {
    -[CRLInteractiveCanvasController p_convertNeedsDisplayRect:fromRep:toRepForDrawing:](self, "p_convertNeedsDisplayRect:fromRep:toRepForDrawing:", v9, v10, x, y, width, height);
    -[CRLInteractiveCanvasController i_repNeedsDisplay:inRect:](self, "i_repNeedsDisplay:inRect:", v10);
  }

  return v10 != 0;
}

- (CGRect)p_convertNeedsDisplayRect:(CGRect)a3 fromRep:(id)a4 toRepForDrawing:(id)a5
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  memset(&v35, 0, sizeof(v35));
  id v10 = a5;
  id v11 = a4;
  CGRect v12 = [v11 layout];
  CGRect v13 = v12;
  if (v12) {
    [v12 transform];
  }
  else {
    memset(&v35, 0, sizeof(v35));
  }

  uint64_t v14 = [v11 parentRep];

  if (v14)
  {
    CGRect v15 = [v14 layout];
    uint64_t v16 = [v15 geometryInRoot];
    CGFloat v17 = v16;
    if (v16)
    {
      CGAffineTransform v33 = v35;
      [v16 transformByConcatenatingTransformTo:&v33];
    }
    else
    {
      memset(&v34, 0, sizeof(v34));
    }
    CGAffineTransform v35 = v34;
  }
  CGAffineTransform v34 = v35;
  v36.origin.CGFloat x = x;
  v36.origin.CGFloat y = y;
  v36.size.CGFloat width = width;
  v36.size.CGFloat height = height;
  CGRect v37 = CGRectApplyAffineTransform(v36, &v34);
  CGFloat v18 = v37.origin.x;
  CGFloat v19 = v37.origin.y;
  CGFloat v20 = v37.size.width;
  CGFloat v21 = v37.size.height;
  uint64_t v22 = [v10 layout];

  if (v22) {
    [v22 transformInRoot];
  }
  else {
    memset(&v31, 0, sizeof(v31));
  }
  CGAffineTransformInvert(&v32, &v31);
  v38.origin.CGFloat x = v18;
  v38.origin.CGFloat y = v19;
  v38.size.CGFloat width = v20;
  v38.size.CGFloat height = v21;
  CGRect v39 = CGRectApplyAffineTransform(v38, &v32);
  CGFloat v23 = v39.origin.x;
  CGFloat v24 = v39.origin.y;
  CGFloat v25 = v39.size.width;
  CGFloat v26 = v39.size.height;

  double v27 = v23;
  double v28 = v24;
  double v29 = v25;
  double v30 = v26;
  result.size.CGFloat height = v30;
  result.size.CGFloat width = v29;
  result.origin.CGFloat y = v28;
  result.origin.CGFloat x = v27;
  return result;
}

- (void)p_consumeRepsDrawnIntoAncestorToSetNeedsDisplayOnUpdatedGeometry
{
  id v3 = [objc_alloc((Class)NSMapTable) initWithKeyOptions:512 valueOptions:0 capacity:0];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v4 = self->mRepsDrawnIntoAncestorToSetNeedsDisplayOnUpdatedGeometry;
  id v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v40 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        id v10 = [v9 ancestorRepForDrawingIntoLayer];
        if (v10)
        {
          [v9 clipRect];
          -[CRLInteractiveCanvasController p_convertNeedsDisplayRect:fromRep:toRepForDrawing:](self, "p_convertNeedsDisplayRect:fromRep:toRepForDrawing:", v9, v10);
          double v12 = v11;
          double v14 = v13;
          double v16 = v15;
          double v18 = v17;
          CGFloat v19 = [v3 objectForKey:v10];
          if (!v19)
          {
            CGFloat v19 = objc_alloc_init(CRLMutableRectList);
            [v3 setObject:v19 forKey:v10];
          }
          -[CRLMutableRectList addRect:](v19, "addRect:", v12, v14, v16, v18);
        }
      }
      id v6 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v6);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v20 = v3;
  id v21 = [v20 countByEnumeratingWithState:&v35 objects:v43 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v36;
    do
    {
      for (j = 0; j != v22; j = (char *)j + 1)
      {
        if (*(void *)v36 != v23) {
          objc_enumerationMutation(v20);
        }
        CGFloat v25 = *(void **)(*((void *)&v35 + 1) + 8 * (void)j);
        CGFloat v26 = [(CRLInteractiveCanvasController *)self renderableForRep:v25];
        if (v26)
        {
          memset(&v34[1], 0, sizeof(CGAffineTransform));
          if (v25) {
            [v25 transformToConvertNaturalToLayerRelative];
          }
          double v27 = [v20 objectForKey:v25];
          if ([v27 count])
          {
            unint64_t v28 = 0;
            do
            {
              [v27 rectAtIndex:v28];
              v34[0] = v34[1];
              CGRect v46 = CGRectApplyAffineTransform(v45, v34);
              double x = v46.origin.x;
              double y = v46.origin.y;
              double width = v46.size.width;
              double height = v46.size.height;
              CGAffineTransform v33 = [v26 layer];
              -[CRLInteractiveCanvasController setNeedsDisplayInRect:onLayer:](self, "setNeedsDisplayInRect:onLayer:", v33, x, y, width, height);

              ++v28;
            }
            while (v28 < (unint64_t)[v27 count]);
          }
        }
      }
      id v22 = [v20 countByEnumeratingWithState:&v35 objects:v43 count:16];
    }
    while (v22);
  }

  [(NSMutableSet *)self->mRepsDrawnIntoAncestorToSetNeedsDisplayOnUpdatedGeometry removeAllObjects];
}

- (void)animateToViewScale:(double)a3 contentOffset:(CGPoint)a4 duration:(double)a5 orientation:(int64_t)a6 completionHandler:(id)a7
{
  double y = a4.y;
  double x = a4.x;
  double v12 = (void (**)(id, uint64_t))a7;
  double v13 = [(CRLInteractiveCanvasController *)self layerHost];
  double v14 = [v13 canvasLayer];
  [v14 viewScale];
  if (v15 == a3)
  {
    [(CRLInteractiveCanvasController *)self contentOffset];
    double v17 = v16;
    double v19 = v18;

    if (x == v17 && y == v19)
    {
      if (v12) {
        v12[2](v12, 1);
      }
      goto LABEL_28;
    }
  }
  else
  {
  }
  -[CRLInteractiveCanvasController clampedUnscaledContentOffset:forViewScale:](self, "clampedUnscaledContentOffset:forViewScale:", x, y, a3);
  double v22 = v21;
  double v23 = v20;
  if (v21 == x && v20 == y)
  {
    double v22 = x;
    double v23 = y;
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F4598);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A99B4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F45B8);
    }
    CGFloat v24 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v24);
    }
    CGFloat v25 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasController animateToViewScale:contentOffset:duration:orientation:completionHandler:]");
    CGFloat v26 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v25 file:v26 lineNumber:7632 isFatal:0 description:"Content offset was outside the expected range! Clamping to a possibly sane value."];
  }
  if (self->mAnimatingViewScale)
  {
    if (v12) {
      v12[2](v12, 0);
    }
  }
  else
  {
    double v56 = a5;
    self->mAnimatingViewScale = 1;
    double v27 = [(CRLInteractiveCanvasController *)self layerHost];
    unint64_t v28 = [v27 canvasView];

    double v29 = [v28 canvasLayer];
    double v30 = [v28 enclosingScrollView];
    [(CRLInteractiveCanvasController *)self i_viewWillBeginZooming];
    [v29 bounds];
    double v32 = v31;
    double v34 = v33;
    [v29 contentInset];
    CGFloat v36 = v35;
    CGFloat v38 = v37;
    uint64_t v54 = v40;
    uint64_t v55 = v39;
    long long v41 = [(CRLInteractiveCanvasController *)self canvas];
    unsigned __int8 v42 = [v41 isAnchoredAtRight];

    if ((v42 & 1) == 0)
    {
      memset(&v83, 0, sizeof(v83));
      CGAffineTransformMakeTranslation(&v83, -v32, -v34);
      CGAffineTransform v81 = v83;
      CGAffineTransformTranslate(&v82, &v81, v38, v36);
      CGAffineTransform v83 = v82;
      CGAffineTransform v80 = v82;
      [v28 setTransform:&v80];
      [v29 bounds];
      double v44 = v43;
      [v29 bounds];
      [v29 setBounds:v38, v36, v44];
    }
    CGRect v45 = [(CRLInteractiveCanvasController *)self p_sourceInteractionSourceForNotficiationUserInfo];
    v65[0] = _NSConcreteStackBlock;
    v65[1] = 3221225472;
    v65[2] = sub_1003A6A08;
    v65[3] = &unk_1014F45E0;
    v65[4] = self;
    double v70 = a3;
    id v46 = v30;
    id v66 = v46;
    id v47 = v28;
    id v67 = v47;
    double v71 = v32;
    double v72 = v34;
    id v48 = v29;
    id v68 = v48;
    double v73 = v22;
    double v74 = v23;
    CGFloat v75 = v36;
    CGFloat v76 = v38;
    uint64_t v77 = v55;
    uint64_t v78 = v54;
    double v79 = v56;
    id v49 = v45;
    id v69 = v49;
    double v50 = objc_retainBlock(v65);
    v57[0] = _NSConcreteStackBlock;
    v57[1] = 3221225472;
    v57[2] = sub_1003A6DC4;
    v57[3] = &unk_1014F4608;
    id v51 = v47;
    id v58 = v51;
    id v52 = v48;
    id v59 = v52;
    CGRect v60 = self;
    double v62 = a3;
    double v63 = v22;
    double v64 = v23;
    long long v61 = v12;
    double v53 = objc_retainBlock(v57);
    if (v56 <= 0.0)
    {
      ((void (*)(void *))v50[2])(v50);
      ((void (*)(void *, uint64_t))v53[2])(v53, 1);
    }
    else
    {
      +[UIView animateWithDuration:v50 animations:v53 completion:v56];
    }
  }
LABEL_28:
}

+ (double)defaultAutoZoomAnimationDuration
{
  return 0.300000012;
}

- (void)doubleTappedCanvasBackgroundAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  p_mDelegate = &self->mDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)p_mDelegate);
    [v8 doubleTappedCanvasBackgroundAtPoint:x, y];
  }
}

- (BOOL)shouldCanvasScrollingSizeGrowToFitBoardContent
{
  return self->_shouldCanvasScrollingSizeGrowToFitBoardContent;
}

- (void)setShouldCanvasScrollingSizeGrowToFitBoardContent:(BOOL)a3
{
  self->_shouldCanvasScrollingSizeGrowToFitBoardContent = a3;
}

- (BOOL)isTearingDown
{
  return self->mIsTearingDown;
}

- (void)setIsTearingDown:(BOOL)a3
{
  self->mIsTearingDown = a3;
}

- (BOOL)hasBeenTornDown
{
  return self->mHasBeenTornDown;
}

- (void)setHasBeenTornDown:(BOOL)a3
{
  self->mHasBeenTornDown = a3;
}

- (_TtC8Freeform19CRLCanvasBackground)canvasBackground
{
  return self->mCanvasBackground;
}

- (BOOL)versionFidelityAlertWasShownIsValid
{
  return self->mVersionFidelityAlertWasShownIsValid;
}

- (void)setVersionFidelityAlertWasShownIsValid:(BOOL)a3
{
  self->mVersionFidelityAlertWasShownIsValid = a3;
}

- (unint64_t)versionFidelityAlertWasShown
{
  return self->mVersionFidelityAlertWasShown;
}

- (void)setVersionFidelityAlertWasShown:(unint64_t)a3
{
  self->mVersionFidelityAlertWasShown = a3;
}

- (CRLPKDrawingProvider)pkDrawingProvider
{
  return self->mPKDrawingProvider;
}

- (CRLCanvasLayerHosting)layerHost
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mLayerHost);

  return (CRLCanvasLayerHosting *)WeakRetained;
}

- (CRLCanvas)canvas
{
  return self->mCanvas;
}

- (CRLInteractiveCanvasControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);

  return (CRLInteractiveCanvasControllerDelegate *)WeakRetained;
}

- (CRLCollaboratorCursorRendererDelegate)collaboratorCursorDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mCollaboratorCursorDelegate);

  return (CRLCollaboratorCursorRendererDelegate *)WeakRetained;
}

- (void)setCollaboratorCursorDelegate:(id)a3
{
}

- (BOOL)shouldSuppressRendering
{
  return self->mShouldSuppressRendering;
}

- (BOOL)animatingViewScale
{
  return self->mAnimatingViewScale;
}

- (BOOL)displaysMultiselectionWithSingleBounds
{
  return self->mDisplaysMultiselectionWithSingleBounds;
}

- (void)setDisplaysMultiselectionWithSingleBounds:(BOOL)a3
{
  self->mDisplaysMultiselectionWithSingleBounds = a3;
}

- (BOOL)textGesturesInFlight
{
  return self->mTextGesturesInFlight;
}

- (void)setTextGesturesInFlight:(BOOL)a3
{
  self->mTextGesturesInFlight = a3;
}

- (CRLFreehandDrawingToolkit)freehandDrawingToolkit
{
  return self->mFreehandDrawingToolkit;
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

- (_TtC8Freeform21CRLTextInputResponder)textInputResponder
{
  return self->mTextInputResponder;
}

- (BOOL)preventSettingNilEditorOnTextResponder
{
  return self->mPreventSettingNilEditorOnTextResponder;
}

- (void)setPreventSettingNilEditorOnTextResponder:(BOOL)a3
{
  self->mPreventSettingNilEditorOnTextResponder = a3;
}

- (BOOL)isDraggingToInsertBoardItems
{
  return self->mIsDraggingToInsertBoardItems;
}

- (void)setIsDraggingToInsertBoardItems:(BOOL)a3
{
  self->mIsDraggingToInsertBoardItems = a3;
}

- (BOOL)isDiscardingEdits
{
  return self->mDiscardingEdits;
}

- (BOOL)createRepsForOffscreenLayouts
{
  return self->mCreateRepsForOffscreenLayouts;
}

- (void)setCreateRepsForOffscreenLayouts:(BOOL)a3
{
  self->mCreateRepsForOffscreenLayouts = a3;
}

- (BOOL)currentlyScrolling
{
  return self->mCurrentlyScrolling;
}

- (void)setUnobscuredScrollViewFrame:(CGRect)a3
{
  self->mUnobscuredScrollViewFrame = a3;
}

- (BOOL)connectorKnobsEnabled
{
  return self->mConnectorKnobsEnabled;
}

- (void)setConnectorKnobsEnabled:(BOOL)a3
{
  self->mConnectorKnobsEnabled = a3;
}

- (NSArray)temporaryAdditionalBoardItemsToDisplay
{
  return self->_temporaryAdditionalBoardItemsToDisplay;
}

- (CGRect)p_visibleBoundsRectForTiling
{
  objc_copyStruct(v6, &self->mVisibleBoundsRectForTiling, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.double height = v5;
  result.size.double width = v4;
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
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (void)setP_visibleUnscaledRect:(CGRect)a3
{
  CGRect v3 = a3;
  objc_copyStruct(&self->mVisibleUnscaledRect, &v3, 32, 1, 0);
}

- (BOOL)shouldSuppressFreehandContent
{
  return self->_shouldSuppressFreehandContent;
}

- (BOOL)overlayLayerSuppressed
{
  return self->mOverlayLayerSuppressed;
}

- (BOOL)showGrayOverlay
{
  return self->mShowGrayOverlay;
}

- (BOOL)suppressesCollaboratorHUD
{
  return self->mSuppressesCollaboratorHUD;
}

- (void)setSuppressesCollaboratorHUD:(BOOL)a3
{
  self->mSuppressesCollaboratorHUD = a3;
}

- (BOOL)documentIsSharedReadOnly
{
  return self->mDocumentIsSharedReadOnly;
}

- (BOOL)allowsSelectionKnobs
{
  return self->mAllowsSelectionKnobs;
}

- (BOOL)allowsSelectionHighlight
{
  return self->mAllowsSelectionHighlight;
}

- (BOOL)showInvisibleObjects
{
  return self->mShowInvisibleObjects;
}

- (BOOL)floatingCursorInMotion
{
  return self->_floatingCursorInMotion;
}

- (void)setFloatingCursorInMotion:(BOOL)a3
{
  self->_floatingCursorInMotion = a3;
}

- (CRLSearchReference)primaryFindResultSearchReference
{
  return self->_primaryFindResultSearchReference;
}

- (NSMapTable)searchReferencesToHighlight
{
  return self->_searchReferencesToHighlight;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchReferencesToHighlight, 0);
  objc_storeStrong((id *)&self->_primaryFindResultSearchReference, 0);
  objc_storeStrong((id *)&self->_temporaryAdditionalBoardItemsToDisplay, 0);
  objc_storeStrong((id *)&self->mFreehandDrawingToolkit, 0);
  objc_storeStrong((id *)&self->mMathCalculationController, 0);
  objc_storeStrong((id *)&self->mPKDrawingProvider, 0);
  objc_storeStrong((id *)&self->mCanvasBackground, 0);
  objc_storeStrong((id *)&self->mVisibleCollaboratorPresences, 0);
  objc_storeStrong((id *)&self->mSelectionPathToScrollTo, 0);
  objc_storeStrong((id *)&self->mBackgroundRenderingObjects, 0);
  objc_storeStrong((id *)&self->mCurrentInteractionSource, 0);
  objc_storeStrong((id *)&self->mLayersWithZoomFadeAnimation, 0);
  objc_storeStrong((id *)&self->mBlocksToPerformOnMainThreadWithValidLayouts, 0);
  objc_storeStrong((id *)&self->mNotificationsToPostWithValidLayouts, 0);
  objc_storeStrong((id *)&self->mRepsToHideForCurrentTracker, 0);
  objc_storeStrong((id *)&self->mGestureDispatcher, 0);
  objc_storeStrong((id *)&self->mLayoutsShowingCollabCursorsDuringLayerUpdate, 0);
  objc_storeStrong((id *)&self->mInfosPreviouslyShowingCollabCursors, 0);
  objc_storeStrong((id *)&self->mCollaboratorPresenceToCollaboratorHUDControllerDictionaryForFastSizing, 0);
  objc_storeStrong((id *)&self->mCollaboratorPresenceToCollaboratorHUDControllerDictionary, 0);
  objc_storeStrong((id *)&self->mCurrentCollaboratorPresences, 0);
  objc_storeStrong((id *)&self->mMultiselectResizeInfo, 0);
  objc_storeStrong((id *)&self->mDynOpController, 0);
  objc_storeStrong((id *)&self->mTMCoordinator, 0);
  objc_storeStrong((id *)&self->mCurrentAnimation, 0);
  objc_storeStrong((id *)&self->mLiveSyncDecorator, 0);
  objc_storeStrong((id *)&self->mSelectionHighlightColor, 0);
  objc_storeStrong((id *)&self->mDecoratorsWithInvalidLayers, 0);
  objc_storeStrong((id *)&self->mDecorators, 0);
  objc_storeStrong((id *)&self->mRepsDrawnIntoAncestorToSetNeedsDisplayOnUpdatedGeometry, 0);
  objc_storeStrong((id *)&self->mRepsToRectsToInvalidate, 0);
  objc_storeStrong((id *)&self->mRepsToSetNeedsDisplay, 0);
  objc_storeStrong((id *)&self->mNumberFormatter, 0);
  objc_storeStrong((id *)&self->mUnitFormatter, 0);
  objc_storeStrong((id *)&self->mTextInputResponderSource, 0);
  objc_storeStrong((id *)&self->mGuideController, 0);
  objc_storeStrong((id *)&self->mEditorController, 0);
  objc_destroyWeak(&self->mObservedDocumentRoot);
  objc_destroyWeak((id *)&self->mLayerHost);
  objc_storeStrong((id *)&self->mCanvas, 0);
  objc_storeStrong((id *)&self->mTextInputResponder, 0);
  objc_storeStrong((id *)&self->mCanvasEditor, 0);
  objc_storeStrong((id *)&self->mLayerUpdater, 0);
  objc_destroyWeak((id *)&self->mDelegate);

  objc_destroyWeak((id *)&self->mCollaboratorCursorDelegate);
}

- (BOOL)p_accessibilityShouldCheckAncestorCanPerformAction:(SEL)a3 withSender:(id)a4
{
  return NSSelectorFromString(@"_accessibilitySpeak:") == a3
      || NSSelectorFromString(@"_accessibilityPauseSpeaking:") == a3;
}

- (CRLCanvasRep)repForTextEditingInspecting
{
  double v2 = self;
  id v3 = sub_100D5CF68();

  return (CRLCanvasRep *)v3;
}

- (BOOL)anyConnectorKnobVisible
{
  double v2 = self;
  CRLInteractiveCanvasController.anyConnectorKnobVisible.getter();
  char v4 = v3;

  return v4 & 1;
}

- (void)animateIntoConnectorMode
{
  double v2 = self;
  sub_100E8342C();
}

- (CRLConnectionLineAbstractLayout)highestZOrderConnectionLineLayoutAcrossBoard
{
  double v2 = self;
  char v3 = sub_100E83AC8();

  return (CRLConnectionLineAbstractLayout *)v3;
}

- (void)sendSelectionPathToPeersIfNecessary
{
  double v2 = self;
  sub_100E83E34();
}

- (void)sendRealTimeEnterToPeersIfNecessary
{
  double v2 = self;
  sub_100E84EEC();
}

- (BOOL)wantsToSuppressMultiselectionForPenTool
{
  double v2 = self;
  char v3 = sub_100E85664();

  return v3 & 1;
}

- (BOOL)sendViewportRequestMessageTo:(id)a3
{
  uint64_t v4 = type metadata accessor for UUID();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  id v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  id v9 = self;
  char v10 = sub_100E85870(v8);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  return v10 & 1;
}

- (void)donateTipEventObjectsConnectedWithConnectionLine
{
}

- (void)donateTipEventParticipantFollowed
{
}

- (void)updateTipsWithConnectorKnobsEnabled:(BOOL)a3
{
  if (a3)
  {
    uint64_t v4 = qword_10166F6B8;
    uint64_t v5 = self;
    if (v4 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_1005057FC(&qword_10167A2C0);
    sub_100556B74(v6, (uint64_t)qword_10171B400);
    Tips.Event.sendDonation<>(_:)();
  }
  else
  {
    uint64_t v7 = self;
  }
  if (qword_10166F5C8 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_1005057FC(&qword_10169FA10);
  sub_100556B74(v8, (uint64_t)qword_10171B130);
  swift_beginAccess();
  Tips.Parameter.wrappedValue.setter();
  swift_endAccess();
}

+ (double)minimumRecommendedViewScale
{
  return 0.1;
}

+ (double)maximumRecommendedViewScale
{
  return 4.0;
}

@end