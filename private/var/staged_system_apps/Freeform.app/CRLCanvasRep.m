@interface CRLCanvasRep
- (BOOL)allowDragAcrossPageBoundaries;
- (BOOL)allowDragDelegate;
- (BOOL)allowDragOnPhoneAtPoint:(CGPoint)a3;
- (BOOL)allowResizeDelegate;
- (BOOL)allowRotateDelegate;
- (BOOL)allowsSupportedDynamicOperationsToBeRealTime;
- (BOOL)canBeOccluded;
- (BOOL)canDrawShadowInOneStepWithChildren:(BOOL)a3;
- (BOOL)canEditWithEditor:(id)a3;
- (BOOL)canFlipDuringResize;
- (BOOL)canOcclude;
- (BOOL)canPasteDataFromPhysicalKeyboard:(id)a3;
- (BOOL)canSelectChildRep:(id)a3;
- (BOOL)canUseSpecializedHitRegionForKnob:(id)a3;
- (BOOL)containsPoint:(CGPoint)a3 withPrecision:(BOOL)a4;
- (BOOL)containsPoint:(CGPoint)a3 withSlop:(CGSize)a4;
- (BOOL)containsUnknownContent;
- (BOOL)crlaxShouldSetAccessibilityFrameWithFrameInUnscaledCanvasForMarqueeSelecting;
- (BOOL)demandsExclusiveSelection;
- (BOOL)directlyManagesAdditionalPlatformViewOverRenderable;
- (BOOL)directlyManagesAdditionalPlatformViewUnderRenderable;
- (BOOL)directlyManagesContentPlatformView;
- (BOOL)directlyManagesLayerContent;
- (BOOL)directlyManagesVisibilityOfKnob:(id)a3;
- (BOOL)dragDidChangeGeometry;
- (BOOL)drawsDescendantsIntoLayer;
- (BOOL)everAllowedToBeSelectedAsADrawable;
- (BOOL)exclusivelyProvidesGuidesWhileAligning;
- (BOOL)forcesPlacementOnTop;
- (BOOL)handleContextMenuClickAtPoint:(CGPoint)a3 withPlatformObject:(id)a4 onKnob:(id)a5;
- (BOOL)handleDoubleTapAtPoint:(CGPoint)a3 inputType:(int64_t)a4;
- (BOOL)handleDoubleTapAtPoint:(CGPoint)a3 onKnob:(id)a4 inputType:(int64_t)a5;
- (BOOL)handleDragOperation:(unint64_t)a3 withDragInfo:(id)a4 atUnscaledPoint:(CGPoint)a5;
- (BOOL)handleMultipleTapAtPoint:(CGPoint)a3;
- (BOOL)handleSingleTapAtPoint:(CGPoint)a3 inputType:(int64_t)a4;
- (BOOL)handleSingleTapAtPoint:(CGPoint)a3 onKnob:(id)a4 inputType:(int64_t)a5;
- (BOOL)handleSingleTapsWhileExtendingSelectionAtPoint:(CGPoint)a3 inputType:(int64_t)a4;
- (BOOL)handledDirectTouchForDrawingModePencilOnlyAtPoint:(CGPoint)a3;
- (BOOL)handledLassoTapAtPoint:(CGPoint)a3 withInputType:(int64_t)a4;
- (BOOL)handlesEditMenu;
- (BOOL)hasBeenRemoved;
- (BOOL)hitRepChrome:(CGPoint)a3;
- (BOOL)i_shouldCountAsClosestSmallRepForSizeLimit:(double)a3;
- (BOOL)i_shouldSmallHitRepTestingRecurse;
- (BOOL)inFreeTransformRotateResizeMode;
- (BOOL)intersectsUnscaledRect:(CGRect)a3;
- (BOOL)isBeingDragged;
- (BOOL)isBeingFreeTransformDragged;
- (BOOL)isBeingFreeTransformResized;
- (BOOL)isBeingFreeTransformRotated;
- (BOOL)isBeingFreeTransformed;
- (BOOL)isBeingResized;
- (BOOL)isBeingRotated;
- (BOOL)isCollaboratorCursorRenderableValid;
- (BOOL)isDragAndDropHighlightLayerValid;
- (BOOL)isDrawingInFlippedContext;
- (BOOL)isEditingPath;
- (BOOL)isInDynamicOperation;
- (BOOL)isInvisible;
- (BOOL)isLocked;
- (BOOL)isOpaque;
- (BOOL)isPlaceholder;
- (BOOL)isPreviewable;
- (BOOL)isSelected;
- (BOOL)isSelectedIgnoringLocking;
- (BOOL)isSelectionHighlightRenderableValid;
- (BOOL)knobTrackingShouldFailForForceTouchOnKnob:(id)a3 atNaturalPoint:(CGPoint)a4;
- (BOOL)knobsAreShowing;
- (BOOL)manuallyControlsMiniFormatter;
- (BOOL)masksToBounds;
- (BOOL)occludesSelectedRep;
- (BOOL)p_dragDidChangeGeometry;
- (BOOL)p_isBeingDraggedRecursive;
- (BOOL)p_isNotSelectableDueToUnknownContent;
- (BOOL)p_shouldShowSelectionHighlight;
- (BOOL)providesGuidesWhileAligning;
- (BOOL)resetGuidesAfterDragAfterReset;
- (BOOL)shouldAddCollaboratorLayerToOverlays;
- (BOOL)shouldAllowReplacementFromDrop;
- (BOOL)shouldAllowReplacementFromPaste;
- (BOOL)shouldBeginScribbleAtPoint:(CGPoint)a3;
- (BOOL)shouldCreateConnectionLineKnobs;
- (BOOL)shouldCreateKnobs;
- (BOOL)shouldCreateLockedKnobs;
- (BOOL)shouldCreateSelectionKnobs;
- (BOOL)shouldExpandHitRegionWhenSmall;
- (BOOL)shouldHitTestChildrenLikeTopLevelReps;
- (BOOL)shouldIgnoreEditMenuTapAtPoint:(CGPoint)a3 withRecognizer:(id)a4;
- (BOOL)shouldIgnoreICCSuppressSelectionKnobs;
- (BOOL)shouldIgnoreSingleTapAtPoint:(CGPoint)a3 withRecognizer:(id)a4;
- (BOOL)shouldLayoutTilingLayer:(id)a3;
- (BOOL)shouldOverrideParentForBeginningDragAtPoint:(CGPoint)a3;
- (BOOL)shouldPreventMarqueeInitiationAtPoint:(CGPoint)a3 withTouchType:(int64_t)a4;
- (BOOL)shouldRasterizeRenderableDuringRotation;
- (BOOL)shouldSelectInfoWhenTargetOfDrag:(id)a3;
- (BOOL)shouldShowCollaboratorCursorHighlight;
- (BOOL)shouldShowDragAndDropHighlight;
- (BOOL)shouldShowDragHUD;
- (BOOL)shouldShowKnobs;
- (BOOL)shouldShowSelectionHighlight;
- (BOOL)shouldShowShadow;
- (BOOL)shouldShowSizesInRulers;
- (BOOL)shouldSuppressFontSmoothing;
- (BOOL)shouldSuppressSelectionHighlightDuringMultiselection;
- (BOOL)showKnobsDuringManipulation;
- (BOOL)skipsRerenderForTranslation;
- (BOOL)supportsAlternateLiftDelay:(double)a3;
- (BOOL)supportsAlternatePressureDrag;
- (BOOL)wantsBestGuessCanvasBackgroundColorForContextMenuPreview;
- (BOOL)wantsChildRepLayerUpdatingCallsEvenWithNoChildren;
- (BOOL)wantsContextMenuAtPoint:(CGPoint)a3 withPlatformObject:(id)a4 onKnob:(id)a5;
- (BOOL)wantsContextMenuWhenEditingDisabledAtPoint:(CGPoint)a3;
- (BOOL)wantsEditMenuForTapAtPoint:(CGPoint)a3 onKnob:(id)a4;
- (BOOL)wantsGuidesWhileDragging;
- (BOOL)wantsGuidesWhileResizing;
- (BOOL)wantsRenderableToBeDescendedFromParentRepRenderable;
- (BOOL)wantsToDistortWithImagerContext;
- (BOOL)wantsToHandleDoubleTapsWhenLocked;
- (BOOL)wantsToHandleTapsOnBehalfOfRepForSelecting;
- (BOOL)wantsToHandleTapsWhenLocked;
- (BOOL)wantsToManuallyHandleEditMenuTapAtPoint:(CGPoint)a3;
- (BOOL)willHandleFreeTransformingLayoutForRep:(id)a3;
- (BOOL)willHandleResizingLayoutForRep:(id)a3;
- (CGAffineTransform)i_layerTransform;
- (CGAffineTransform)knobPositionTransformForInspectorResize;
- (CGAffineTransform)layerTransformInRootForZeroAnchor;
- (CGAffineTransform)p_layerTransformForRotationFromPureTransformInRoot:(SEL)a3 toPureTransformInRoot:(CGAffineTransform *)a4;
- (CGAffineTransform)parentLayerInverseTransformInRootForZeroAnchor;
- (CGAffineTransform)transformForCollaboratorCursorRenderable;
- (CGAffineTransform)transformForHighlightLayer;
- (CGAffineTransform)transformToConvertNaturalFromLayerRelative;
- (CGAffineTransform)transformToConvertNaturalToLayerRelative;
- (CGImage)newShadowImageWithSize:(CGSize)a3 shadow:(id)a4 drawSelector:(SEL)a5 unflipped:(BOOL)a6;
- (CGImage)newShadowImageWithSize:(CGSize)a3 unflipped:(BOOL)a4 withChildren:(BOOL)a5;
- (CGPath)newHighlightPathInScaledSpace;
- (CGPath)newPathInScaledCanvasFromNaturalRect:(CGRect)a3;
- (CGPoint)centerForRotation;
- (CGPoint)convertKnobPositionFromUnscaledCanvas:(CGPoint)a3;
- (CGPoint)convertKnobPositionToUnscaledCanvas:(CGPoint)a3;
- (CGPoint)convertNaturalPointFromLayerRelative:(CGPoint)a3;
- (CGPoint)convertNaturalPointFromUnscaledCanvas:(CGPoint)a3;
- (CGPoint)convertNaturalPointToLayerRelative:(CGPoint)a3;
- (CGPoint)convertNaturalPointToUnscaledCanvas:(CGPoint)a3;
- (CGPoint)i_dragOffset;
- (CGPoint)layerOffsetForDragging;
- (CGPoint)p_centerForPreviewFrame:(CGRect)a3;
- (CGPoint)p_transformNaturalPoint:(CGPoint)a3 inUnscaledSpaceWithTransformFromBlock:(id)a4;
- (CGPoint)positionOfStandardKnob:(id)a3 forBounds:(CGRect)a4;
- (CGPoint)unscaledGuidePosition;
- (CGRect)boundsForStandardKnobs;
- (CGRect)convertNaturalRectFromLayerRelative:(CGRect)a3;
- (CGRect)convertNaturalRectFromUnscaledCanvas:(CGRect)a3;
- (CGRect)convertNaturalRectToLayerRelative:(CGRect)a3;
- (CGRect)convertNaturalRectToUnscaledCanvas:(CGRect)a3;
- (CGRect)frameInScreenSpace;
- (CGRect)frameInUnscaledCanvas;
- (CGRect)i_clipRectRecursive;
- (CGRect)i_layerFrameInScaledCanvasIgnoringDragging;
- (CGRect)i_originalLayerFrameInScaledCanvas;
- (CGRect)layerFrameInScaledCanvas;
- (CGRect)layerFrameInScaledCanvasRelativeToParent;
- (CGRect)naturalBounds;
- (CGRect)rectToClipChildRepRenderables;
- (CGRect)snapRectForDynamicDragWithOffset:(CGPoint)a3;
- (CGRect)targetRectForEditMenu;
- (CGRect)trackingBoundsForStandardKnobs;
- (CGRect)visibleBoundsForTilingLayer:(id)a3;
- (CRLCanvas)canvas;
- (CRLCanvasElementInfo)info;
- (CRLCanvasKnob)knobForInspectorResize;
- (CRLCanvasKnobTracker)currentKnobTracker;
- (CRLCanvasLayout)layout;
- (CRLCanvasRenderable)collaboratorCursorRenderable;
- (CRLCanvasRenderable)dragAndDropHighlightRenderable;
- (CRLCanvasRenderable)selectionHighlightRenderable;
- (CRLCanvasRenderable)shadowRenderable;
- (CRLCanvasRep)ancestorRepForDrawingIntoLayer;
- (CRLCanvasRep)i_repForDraggingIgnoringTopLevelEditing;
- (CRLCanvasRep)i_repForSelectingIgnoringTopLevelEditing;
- (CRLCanvasRep)initWithLayout:(id)a3 canvas:(id)a4;
- (CRLCanvasRep)parentRep;
- (CRLCanvasRep)parentRepToPerformSelecting;
- (CRLCanvasRep)repForDragging;
- (CRLCanvasRep)repForFreeTransforming;
- (CRLCanvasRep)repForHandleSingleTap;
- (CRLCanvasRep)repForPreviewing;
- (CRLCanvasRep)repForRotating;
- (CRLCanvasRep)repForSelecting;
- (CRLColor)currentCollaboratorCursorColor;
- (CRLColor)defaultSelectionHighlightColor;
- (CRLColor)selectionHighlightColor;
- (CRLInteractiveCanvasController)interactiveCanvasController;
- (CRLShadow)shadow;
- (Class)layerClass;
- (NSArray)additionalRenderablesOverRenderable;
- (NSArray)additionalRenderablesToFadeDuringZoom;
- (NSArray)additionalRenderablesUnderRenderable;
- (NSArray)allPlatformViews;
- (NSArray)allRenderables;
- (NSArray)childReps;
- (NSArray)hyperlinkRegions;
- (NSArray)itemsToAddToEditMenu;
- (NSArray)knobs;
- (NSArray)layoutsForChildReps;
- (NSArray)overlayRenderables;
- (NSSet)additionalRepsForDragging;
- (NSSet)additionalRepsToResize;
- (NSSet)childRepsToInformForSelectabilityChanges;
- (NSSet)childrenToExcludeWhenDrawingDescendantsIntoLayer;
- (NSString)actionStringForDrag;
- (NSString)actionStringForFreeTransform;
- (NSString)actionStringForResize;
- (NSString)actionStringForRotate;
- (UIView)additionalPlatformViewOverRenderable;
- (UIView)additionalPlatformViewUnderRenderable;
- (UIView)contentPlatformView;
- (_TtC8Freeform20CRLCommandController)commandController;
- (double)additionalRotationForKnobOrientation;
- (double)angleForRotation;
- (double)contentsScale;
- (double)horizontalOffsetForHyperlinkKnob;
- (double)opacity;
- (double)selectionHighlightWidth;
- (double)shortestDistanceToPoint:(CGPoint)a3 countAsHit:(BOOL *)a4;
- (id)additionalRectsForSnappingWithOffset:(CGPoint)a3;
- (id)additionalRepsForDraggingConnectionLine:(id)a3;
- (id)backgroundColorForContextMenuPreview;
- (id)backgroundColorForDragPreview;
- (id)colorBehindLayer:(id)a3;
- (id)commandForAcceptingPasteWithImageInfo:(id)a3 outSelectionBehavior:(id *)a4;
- (id)contextMenuConfigurationAtPoint:(CGPoint)a3;
- (id)contextMenuPreviewForHighlightingMenuAtPoint:(CGPoint)a3 withConfiguration:(id)a4;
- (id)createAdditionalBoardItemsForCopyImaging;
- (id)cursorAtPoint:(CGPoint)a3 forKnob:(id)a4 withCursorPlatformObject:(id)a5;
- (id)description;
- (id)dragItemsForBeginningDragAtPoint:(CGPoint)a3;
- (id)dragItemsForBeginningDragOfChildRep:(id)a3;
- (id)dragItemsForBeginningDragWithItemProvider:(id)a3 deepCopiedBoardItems:(id)a4 withUnscaledTracedPaths:(id)a5 previewBackgroundColor:(id)a6 localObjectProvider:(id)a7;
- (id)dynamicResizeDidBegin;
- (id)getConnectionLineLayoutToCopyStyleForNewConnectionLine;
- (id)hitRep:(CGPoint)a3 passingTest:(id)a4;
- (id)hitRep:(CGPoint)a3 withPrecision:(BOOL)a4;
- (id)hitRep:(CGPoint)a3 withPrecision:(BOOL)a4 passingTest:(id)a5;
- (id)hitRepChrome:(CGPoint)a3 passingTest:(id)a4;
- (id)hitReps:(CGPoint)a3 withSlop:(CGSize)a4;
- (id)hitReps:(CGPoint)a3 withSlopBlock:(id)a4;
- (id)i_additionalRenderablesOverRenderableIncludingKnobs;
- (id)i_smallHitRepNearPoint:(CGPoint)a3 smallRepOutset:(double)a4 forShortestDistance:(double *)a5 unscaledPointTransformForRep:(id)a6 passingTest:(id)a7;
- (id)knobForTag:(unint64_t)a3;
- (id)makeSelectionHighlightRenderable;
- (id)newCommandToApplyGeometry:(id)a3 toInfo:(id)a4;
- (id)newSelectionKnobForType:(unint64_t)a3 tag:(unint64_t)a4;
- (id)newTrackerForKnob:(id)a3;
- (id)p_addRenderablesForKnobsToArray:(id)a3 withDelegate:(id)a4 isOverlay:(BOOL)a5;
- (id)p_connectedReps;
- (id)p_currentCollaboratorPresence;
- (id)p_highlightRenderable;
- (id)p_newImagerToGenerateSystemPreviewOfBoardItems:(id)a3;
- (id)p_repForDraggingIgnoringTopLevelEditing:(BOOL)a3;
- (id)p_repForSelectingIgnoringTopLevelEditing:(BOOL)a3 ignoringInlineEditing:(BOOL)a4;
- (id)resizedGeometryForTransform:(CGAffineTransform *)a3;
- (id)unscaledPathToIncludeForSystemPreviewOutline;
- (int64_t)dragHUDAndGuidesTypeAtCanvasPoint:(CGPoint)a3;
- (int64_t)dragTypeAtCanvasPoint:(CGPoint)a3 forTouchType:(int64_t)a4;
- (int64_t)tilingMode;
- (unint64_t)adjustedKnobForComputingResizeGeometry:(unint64_t)a3;
- (unint64_t)dragOperationForDragInfo:(id)a3 atUnscaledPoint:(CGPoint)a4;
- (unint64_t)enabledKnobMask;
- (void)addKnobsToArray:(id)a3;
- (void)addLockedKnobsToArray:(id)a3;
- (void)addSelectionKnobsToArray:(id)a3;
- (void)addToSet:(id)a3;
- (void)antiAliasDefeatLayerFrame:(CGRect *)a3 forTransform:(CGAffineTransform *)a4;
- (void)antiAliasDefeatLayerTransform:(CGAffineTransform *)a3 forFrame:(CGRect)a4;
- (void)becameNotSelectable;
- (void)becameNotSelected;
- (void)becameSelectable;
- (void)becameSelected;
- (void)collaboratorCursorChangedToSelectionPath:(id)a3;
- (void)computeDirectLayerFrame:(CGRect *)a3 andTransform:(CGAffineTransform *)a4;
- (void)computeDirectLayerFrame:(CGRect *)a3 andTransform:(CGAffineTransform *)a4 basedOnLayoutGeometry:(id)a5;
- (void)computeDirectLayerFrame:(CGRect *)a3 andTransform:(CGAffineTransform *)a4 basedOnTransform:(CGAffineTransform *)a5 andSize:(CGSize)a6;
- (void)dealloc;
- (void)didAddChildRep:(id)a3;
- (void)didDrawInLayer:(id)a3 context:(CGContext *)a4;
- (void)didUpdateRenderable:(id)a3;
- (void)drawInContextWithoutEffectsOrChildrenForAlphaOnly:(CGContext *)a3;
- (void)dynamicDragDidBegin;
- (void)dynamicDragDidEnd;
- (void)dynamicFreeTransformDidBeginWithTracker:(id)a3;
- (void)dynamicFreeTransformDidEndWithTracker:(id)a3;
- (void)dynamicOperationDidBeginWithRealTimeCommands:(BOOL)a3;
- (void)dynamicOperationDidEnd;
- (void)dynamicResizeDidEndWithTracker:(id)a3;
- (void)dynamicRotateDidBegin;
- (void)dynamicRotateDidEndWithTracker:(id)a3;
- (void)dynamicallyFreeTransformingWithTracker:(id)a3;
- (void)dynamicallyResizingWithTracker:(id)a3;
- (void)dynamicallyRotatingWithTracker:(id)a3;
- (void)fadeKnobsIn;
- (void)fadeKnobsOut;
- (void)hideCollaboratorCursors;
- (void)hideDragAndDropUI;
- (void)i_dynamicDragDidEnd;
- (void)i_invalidateSelectionHighlightRenderable;
- (void)i_willBeRemoved;
- (void)invalidateCollaboratorCursorRenderable;
- (void)invalidateDragAndDropHighlightLayer;
- (void)invalidateKnobPositions;
- (void)invalidateKnobs;
- (void)invalidateSelectionHighlightRenderable;
- (void)invalidateShadowRenderable;
- (void)layoutInRootChangedFrom:(id)a3 to:(id)a4 translatedOnly:(BOOL)a5;
- (void)p_didUpdateEffectRenderablesForRenderable:(id)a3;
- (void)p_dynamicDragDidBegin;
- (void)p_dynamicOperationDidBeginWithRealTimeCommands:(id)a3;
- (void)p_dynamicOperationDidEnd;
- (void)p_dynamicRotateDidBegin;
- (void)p_dynamicRotateDidEnd;
- (void)p_invalidateChildKnobPositionsForEndingDynamicOperation;
- (void)p_invalidateContentLayers;
- (void)p_positionShadowRenderable:(id)a3 forShadow:(id)a4 withNaturalBounds:(CGRect)a5;
- (void)p_setChildReps:(id)a3;
- (void)p_setNeedsDisplayForParentChangeIfNeeded;
- (void)p_showAlertForGroupWithUnknownContent;
- (void)p_toggleHyperlinkUIVisibility;
- (void)p_willUpdateEffectRenderablesForRenderable:(id)a3;
- (void)processChangedProperty:(unint64_t)a3;
- (void)processChanges:(id)a3;
- (void)recursivelyDrawChildrenInContext:(CGContext *)a3 keepingChildrenPassingTest:(id)a4;
- (void)recursivelyDrawInContext:(CGContext *)a3 keepingChildrenPassingTest:(id)a4;
- (void)recursivelyPerformSelector:(SEL)a3;
- (void)recursivelyPerformSelector:(SEL)a3 withObject:(id)a4;
- (void)recursivelyPerformSelector:(SEL)a3 withObject:(id)a4 withObject:(id)a5;
- (void)recursivelyPerformSelectorIfImplemented:(SEL)a3;
- (void)recursivelyPerformSelectorIfImplemented:(SEL)a3 withObject:(id)a4;
- (void)recursivelyPerformSelectorIfImplemented:(SEL)a3 withObject:(id)a4 withObject:(id)a5;
- (void)removeChildRep:(id)a3;
- (void)screenScaleDidChange;
- (void)selectChildRep:(id)a3 extendingSelection:(BOOL)a4;
- (void)setCurrentKnobTracker:(id)a3;
- (void)setNeedsDisplay;
- (void)setNeedsDisplayInRect:(CGRect)a3;
- (void)setParentRep:(id)a3;
- (void)setShowKnobsDuringManipulation:(BOOL)a3;
- (void)setupForDrawingInLayer:(id)a3 context:(CGContext *)a4;
- (void)turnKnobsOn;
- (void)updateChildrenFromLayout;
- (void)updateDragAndDropUIForPoint:(CGPoint)a3 dragInfo:(id)a4;
- (void)updateFromLayout;
- (void)updatePositionsOfKnobs:(id)a3;
- (void)updateRenderableGeometryFromLayout:(id)a3;
- (void)updateSelectionHighlightRenderable:(id)a3;
- (void)viewScaleDidChange;
- (void)willUpdateRenderable:(id)a3;
@end

@implementation CRLCanvasRep

- (CRLCanvasRep)initWithLayout:(id)a3 canvas:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E5830);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010910D0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E5850);
    }
    v9 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v9);
    }
    v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasRep initWithLayout:canvas:]");
    v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRep.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 144, 0, "invalid nil value for '%{public}s'", "layout");
  }
  v18.receiver = self;
  v18.super_class = (Class)CRLCanvasRep;
  v12 = [(CRLCanvasRep *)&v18 init];
  v13 = v12;
  if (v12)
  {
    if (v7)
    {
      objc_storeStrong((id *)&v12->mLayout, a3);
      id v14 = objc_storeWeak((id *)&v13->mCanvas, v8);
      [v8 i_registerRep:v13];

      v13->mShowKnobsWhenManipulated = 0;
      dispatch_queue_t v15 = dispatch_queue_create("com.apple.freeform.CRLCanvasRep.knobsQueue", 0);
      mKnobsAccessQueue = v13->mKnobsAccessQueue;
      v13->mKnobsAccessQueue = (OS_dispatch_queue *)v15;
    }
    else
    {
      mKnobsAccessQueue = v12;
      v13 = 0;
    }
  }
  return v13;
}

- (void)dealloc
{
  objc_storeWeak((id *)&self->mCanvas, 0);
  v3.receiver = self;
  v3.super_class = (Class)CRLCanvasRep;
  [(CRLCanvasRep *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [(CRLCanvasRep *)self info];
  v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  id v8 = [(CRLCanvasRep *)self info];
  v9 = [(CRLCanvasRep *)self layout];
  v10 = (objc_class *)objc_opt_class();
  v11 = NSStringFromClass(v10);
  v12 = [(CRLCanvasRep *)self layout];
  [(CRLCanvasRep *)self frameInUnscaledCanvas];
  v13 = NSStringFromCGRect(v17);
  id v14 = +[NSString stringWithFormat:@"<%@ %p info=<%@ %p> layout=<%@ %p> frameInUnscaledCanvas=%@>", v4, self, v7, v8, v11, v12, v13];

  return v14;
}

- (CRLInteractiveCanvasController)interactiveCanvasController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mCanvas);
  v4 = [WeakRetained canvasController];

  if (!v4)
  {
    int v5 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E5870);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101091164((uint64_t)self, v5);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E5890);
    }
    v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v6);
    }
    id v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasRep interactiveCanvasController]");
    id v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRep.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 179, 0, "no ICC for this rep (%@); consider asking self.canvas instead",
      self);
  }

  return (CRLInteractiveCanvasController *)v4;
}

- (CRLCanvasLayout)layout
{
  return self->mLayout;
}

- (CRLCanvasElementInfo)info
{
  v2 = [(CRLCanvasRep *)self layout];
  objc_super v3 = [v2 info];

  return (CRLCanvasElementInfo *)v3;
}

- (_TtC8Freeform20CRLCommandController)commandController
{
  v2 = [(CRLCanvasRep *)self interactiveCanvasController];
  objc_super v3 = [v2 commandController];

  return (_TtC8Freeform20CRLCommandController *)v3;
}

- (id)p_connectedReps
{
  objc_super v3 = [(CRLCanvasRep *)self layout];
  v4 = [v3 connectedLayouts];

  int v5 = +[NSMutableSet set];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        v12 = [(CRLCanvasRep *)self canvas];
        v13 = [v12 repForLayout:v11];

        if (v13) {
          [v5 addObject:v13];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void)p_setNeedsDisplayForParentChangeIfNeeded
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mParentRep);
  if (WeakRetained)
  {
    v4 = WeakRetained;
    int v5 = [(CRLCanvasRep *)self canvas];
    unsigned int v6 = [v5 isCanvasInteractive];

    if (v6)
    {
      id v7 = [(CRLCanvasRep *)self ancestorRepForDrawingIntoLayer];
      if (v7)
      {
        id v8 = v7;
        [(CRLCanvasRep *)self setNeedsDisplay];
        id v7 = v8;
      }
    }
  }
}

- (void)setParentRep:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mParentRep);

  if (WeakRetained != obj)
  {
    [(CRLCanvasRep *)self p_setNeedsDisplayForParentChangeIfNeeded];
    objc_storeWeak((id *)&self->mParentRep, obj);
    [(CRLCanvasRep *)self p_setNeedsDisplayForParentChangeIfNeeded];
  }
}

- (NSArray)childReps
{
  if (self->mChildReps) {
    return (NSArray *)self->mChildReps;
  }
  else {
    return (NSArray *)&__NSArray0__struct;
  }
}

- (void)recursivelyPerformSelectorIfImplemented:(SEL)a3
{
  if (objc_opt_respondsToSelector()) {
    [(CRLCanvasRep *)self performSelector:a3];
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  int v5 = [(CRLCanvasRep *)self childReps];
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) recursivelyPerformSelectorIfImplemented:a3];
        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)recursivelyPerformSelectorIfImplemented:(SEL)a3 withObject:(id)a4
{
  id v6 = a4;
  if (objc_opt_respondsToSelector()) {
    [(CRLCanvasRep *)self performSelector:a3 withObject:v6];
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = [(CRLCanvasRep *)self childReps];
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      long long v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * (void)v11) recursivelyPerformSelectorIfImplemented:a3 withObject:v6];
        long long v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)recursivelyPerformSelectorIfImplemented:(SEL)a3 withObject:(id)a4 withObject:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (objc_opt_respondsToSelector()) {
    [(CRLCanvasRep *)self performSelector:a3 withObject:v8 withObject:v9];
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v10 = [(CRLCanvasRep *)self childReps];
  id v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      long long v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * (void)v14) recursivelyPerformSelectorIfImplemented:a3 withObject:v8 withObject:v9];
        long long v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }
}

- (void)recursivelyPerformSelector:(SEL)a3
{
  -[CRLCanvasRep performSelector:](self, "performSelector:");
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  int v5 = [(CRLCanvasRep *)self childReps];
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) recursivelyPerformSelector:a3];
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)recursivelyPerformSelector:(SEL)a3 withObject:(id)a4
{
  id v6 = a4;
  [(CRLCanvasRep *)self performSelector:a3 withObject:v6];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = [(CRLCanvasRep *)self childReps];
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      long long v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * (void)v11) recursivelyPerformSelector:a3 withObject:v6];
        long long v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)recursivelyPerformSelector:(SEL)a3 withObject:(id)a4 withObject:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  [(CRLCanvasRep *)self performSelector:a3 withObject:v8 withObject:v9];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v10 = [(CRLCanvasRep *)self childReps];
  id v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      long long v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * (void)v14) recursivelyPerformSelector:a3 withObject:v8 withObject:v9];
        long long v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }
}

- (void)i_willBeRemoved
{
  [(CRLCanvasRep *)self willBeRemoved];
  mKnobsAccessQueue = self->mKnobsAccessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100258B28;
  block[3] = &unk_1014CBBB0;
  block[4] = self;
  dispatch_sync(mKnobsAccessQueue, block);
  [(CRLCanvasRenderable *)self->mSelectionHighlightRenderable setDelegate:0];
  mSelectionHighlightRenderable = self->mSelectionHighlightRenderable;
  self->mSelectionHighlightRenderable = 0;

  id WeakRetained = objc_loadWeakRetained((id *)&self->mCanvas);
  [WeakRetained i_unregisterRep:self];

  id v6 = [(CRLCanvasRep *)self canvas];
  unsigned int v7 = [v6 isCanvasInteractive];

  if (v7)
  {
    [(CRLCanvasRep *)self i_invalidateSelectionHighlightRenderable];
    id v8 = [(CRLCanvasRep *)self interactiveCanvasController];
    id v9 = [v8 i_interactiveCanvasLayerHelper];
    [v9 repWasRemoved:self];
  }
  +[NSRunLoop cancelPreviousPerformRequestsWithTarget:self];
  self->mHasBeenRemoved = 1;
}

- (BOOL)hasBeenRemoved
{
  return self->mHasBeenRemoved;
}

- (CRLCanvasRep)parentRepToPerformSelecting
{
  objc_super v3 = [(CRLCanvasRep *)self parentRep];
  if (v3)
  {
    do
    {
      if ([v3 canSelectChildRep:self]) {
        break;
      }
      uint64_t v4 = [v3 parentRep];

      objc_super v3 = (void *)v4;
    }
    while (v4);
  }

  return (CRLCanvasRep *)v3;
}

- (BOOL)canSelectChildRep:(id)a3
{
  return 0;
}

- (void)selectChildRep:(id)a3 extendingSelection:(BOOL)a4
{
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014E58B0);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_1010911F4();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014E58D0);
  }
  uint64_t v4 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_10106590C(v4);
  }
  int v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasRep selectChildRep:extendingSelection:]");
  id v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRep.m"];
  +[CRLAssertionHandler handleFailureInFunction:v5 file:v6 lineNumber:359 isFatal:0 description:"subclass should override this method"];
}

- (BOOL)occludesSelectedRep
{
  uint64_t v4 = [(CRLCanvasRep *)self repForSelecting];
  unsigned __int8 v5 = [v4 isSelected];

  if (v5)
  {
    char v6 = 0;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->mCanvas);
    id v8 = [WeakRetained allRepsOrdered];

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v9 = v8;
    id v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v20;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v9);
          }
          long long v14 = *(CRLCanvasRep **)(*((void *)&v19 + 1) + 8 * i);
          BOOL v2 = v14 != self;
          if (v14 == self)
          {
LABEL_17:
            char v17 = 0;
            goto LABEL_18;
          }
          long long v15 = [*(id *)(*((void *)&v19 + 1) + 8 * i) repForSelecting:v19];
          if ([v15 isSelected])
          {
            unsigned int v16 = [(CRLCanvasRep *)v14 canBeOccluded];

            if (v16)
            {
              [(CRLCanvasRep *)v14 frameInUnscaledCanvas];
              if (-[CRLCanvasRep intersectsUnscaledRect:](self, "intersectsUnscaledRect:")) {
                goto LABEL_17;
              }
            }
          }
          else
          {
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
    char v17 = 1;
LABEL_18:

    char v6 = v17 | v2;
  }
  return v6 & 1;
}

- (BOOL)canBeOccluded
{
  return 1;
}

- (BOOL)canOcclude
{
  return 1;
}

- (CRLCanvasRep)ancestorRepForDrawingIntoLayer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mParentRep);
  if (WeakRetained)
  {
    do
    {
      if ([WeakRetained drawsDescendantsIntoLayer]) {
        break;
      }
      uint64_t v3 = [WeakRetained parentRep];

      id WeakRetained = (id)v3;
    }
    while (v3);
  }

  return (CRLCanvasRep *)WeakRetained;
}

- (void)addToSet:(id)a3
{
}

- (CGRect)naturalBounds
{
  BOOL v2 = [(CRLCanvasRep *)self layout];
  uint64_t v3 = [v2 geometry];
  [v3 size];
  double v4 = sub_100064070();
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

- (CGRect)convertNaturalRectToUnscaledCanvas:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v7 = [(CRLCanvasRep *)self layout];
  [v7 convertNaturalRectToUnscaledCanvas:x, y, width, height];
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

- (CGRect)convertNaturalRectFromUnscaledCanvas:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v7 = [(CRLCanvasRep *)self layout];
  [v7 convertNaturalRectFromUnscaledCanvas:x, y, width, height];
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

- (CGPath)newPathInScaledCanvasFromNaturalRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  Mutable = CGPathCreateMutable();
  long long v32 = 0u;
  long long v33 = 0u;
  long long v31 = 0u;
  double v9 = [(CRLCanvasRep *)self layout];
  double v10 = v9;
  if (v9)
  {
    [v9 transformInRoot];
  }
  else
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v31 = 0u;
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->mCanvas);
  [WeakRetained viewScale];
  double v13 = v12;

  v34.origin.CGFloat x = x;
  v34.origin.CGFloat y = y;
  v34.size.CGFloat width = width;
  v34.size.CGFloat height = height;
  double MinX = CGRectGetMinX(v34);
  v35.origin.CGFloat x = x;
  v35.origin.CGFloat y = y;
  v35.size.CGFloat width = width;
  v35.size.CGFloat height = height;
  CGFloat MinY = CGRectGetMinY(v35);
  double v29 = *((double *)&v33 + 1) + MinY * *((double *)&v32 + 1) + *((double *)&v31 + 1) * MinX;
  double v30 = *(double *)&v33 + MinY * *(double *)&v32 + *(double *)&v31 * MinX;
  v36.origin.CGFloat x = x;
  v36.origin.CGFloat y = y;
  v36.size.CGFloat width = width;
  v36.size.CGFloat height = height;
  double MaxX = CGRectGetMaxX(v36);
  v37.origin.CGFloat x = x;
  v37.origin.CGFloat y = y;
  v37.size.CGFloat width = width;
  v37.size.CGFloat height = height;
  CGFloat v17 = CGRectGetMinY(v37);
  double v27 = *((double *)&v33 + 1) + v17 * *((double *)&v32 + 1) + *((double *)&v31 + 1) * MaxX;
  double v28 = *(double *)&v33 + v17 * *(double *)&v32 + *(double *)&v31 * MaxX;
  v38.origin.CGFloat x = x;
  v38.origin.CGFloat y = y;
  v38.size.CGFloat width = width;
  v38.size.CGFloat height = height;
  double v18 = CGRectGetMaxX(v38);
  v39.origin.CGFloat x = x;
  v39.origin.CGFloat y = y;
  v39.size.CGFloat width = width;
  v39.size.CGFloat height = height;
  CGFloat MaxY = CGRectGetMaxY(v39);
  double v20 = *(double *)&v33 + MaxY * *(double *)&v32 + *(double *)&v31 * v18;
  double v21 = *((double *)&v33 + 1) + MaxY * *((double *)&v32 + 1) + *((double *)&v31 + 1) * v18;
  v40.origin.CGFloat x = x;
  v40.origin.CGFloat y = y;
  v40.size.CGFloat width = width;
  v40.size.CGFloat height = height;
  double v22 = CGRectGetMinX(v40);
  v41.origin.CGFloat x = x;
  v41.origin.CGFloat y = y;
  v41.size.CGFloat width = width;
  v41.size.CGFloat height = height;
  CGFloat v23 = CGRectGetMaxY(v41);
  double v24 = *(double *)&v33 + v23 * *(double *)&v32 + *(double *)&v31 * v22;
  double v25 = *((double *)&v33 + 1) + v23 * *((double *)&v32 + 1) + *((double *)&v31 + 1) * v22;
  CGPathMoveToPoint(Mutable, 0, v13 * v30, v13 * v29);
  CGPathAddLineToPoint(Mutable, 0, v13 * v28, v13 * v27);
  CGPathAddLineToPoint(Mutable, 0, v13 * v20, v13 * v21);
  CGPathAddLineToPoint(Mutable, 0, v13 * v24, v13 * v25);
  CGPathCloseSubpath(Mutable);
  return Mutable;
}

- (CGPoint)convertNaturalPointToUnscaledCanvas:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v5 = [(CRLCanvasRep *)self layout];
  [v5 convertNaturalPointToUnscaledCanvas:x, y];
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double y = v11;
  result.double x = v10;
  return result;
}

- (CGPoint)convertNaturalPointFromUnscaledCanvas:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v5 = [(CRLCanvasRep *)self layout];
  [v5 convertNaturalPointFromUnscaledCanvas:x, y];
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double y = v11;
  result.double x = v10;
  return result;
}

- (CGRect)frameInUnscaledCanvas
{
  BOOL v2 = [(CRLCanvasRep *)self layout];
  [v2 frameInRoot];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.CGFloat height = v14;
  result.size.CGFloat width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (CGRect)frameInScreenSpace
{
  double v3 = [(CRLCanvasRep *)self interactiveCanvasController];
  [(CRLCanvasRep *)self frameInUnscaledCanvas];
  [v3 convertUnscaledToBoundsRect:];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v12 = [v3 canvasView];
  [v12 convertRect:0 toView:v5, v7, v9, v11];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v21 = [v12 window];
  [v21 convertRect:0 toWindow:v14, v16, v18, v20];
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;

  double v30 = v23;
  double v31 = v25;
  double v32 = v27;
  double v33 = v29;
  result.size.CGFloat height = v33;
  result.size.CGFloat width = v32;
  result.origin.double y = v31;
  result.origin.double x = v30;
  return result;
}

- (CGRect)layerFrameInScaledCanvas
{
  double v3 = [(CRLCanvasRep *)self layout];
  unsigned int v4 = [v3 parentAutosizes];

  if ([(CRLCanvasRep *)self isBeingRotated])
  {
    if (v4
      && ([(CRLCanvasRep *)self parentRep],
          double v3 = objc_claimAutoreleasedReturnValue(),
          ([v3 isBeingRotated] & 1) == 0))
    {
    }
    else
    {
      double v5 = [(CRLCanvasRep *)self layout];
      unsigned __int8 v6 = [v5 wantsNormalLayoutDuringDynamicRotation];

      if (v4) {
      if ((v6 & 1) == 0)
      }
      {
        CGFloat x = self->mOriginalLayerFrameInScaledCanvas.origin.x;
        CGFloat y = self->mOriginalLayerFrameInScaledCanvas.origin.y;
        CGFloat width = self->mOriginalLayerFrameInScaledCanvas.size.width;
        CGFloat height = self->mOriginalLayerFrameInScaledCanvas.size.height;
        goto LABEL_14;
      }
    }
  }
  if ([(CRLCanvasRep *)self directlyManagesLayerContent])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->mCanvas);
    [(CRLCanvasRep *)self i_baseFrameInUnscaledCanvasForPositioningLayer];
    [WeakRetained convertUnscaledToBoundsRect:];
    double v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    double v20 = [(CRLCanvasRep *)self canvas];
    [v20 contentsScale];
    CGFloat x = sub_100067584(v13, v15, v17, v19, v21);
    CGFloat y = v22;
    CGFloat width = v23;
    CGFloat height = v24;
  }
  else if ([(CRLCanvasRep *)self isBeingDragged])
  {
    double v25 = self->mOriginalLayerFrameInScaledCanvas.origin.x;
    double v26 = self->mOriginalLayerFrameInScaledCanvas.origin.y;
    CGFloat width = self->mOriginalLayerFrameInScaledCanvas.size.width;
    CGFloat height = self->mOriginalLayerFrameInScaledCanvas.size.height;
    [(CRLCanvasRep *)self layerOffsetForDragging];
    double v28 = v27;
    double v30 = v29;
    double v31 = [(CRLCanvasRep *)self canvas];
    [v31 contentsScale];
    double v33 = sub_100067528(v28, v30, v32);
    CGFloat x = sub_100064698(v25, v26, v33);
    CGFloat y = v34;
  }
  else
  {
    [(CRLCanvasRep *)self i_layerFrameInScaledCanvasIgnoringDragging];
    CGFloat x = v35;
    CGFloat y = v36;
    CGFloat width = v37;
    CGFloat height = v38;
  }
LABEL_14:
  double v39 = x;
  double v40 = y;
  double v41 = width;
  double v42 = height;
  result.size.CGFloat height = v42;
  result.size.CGFloat width = v41;
  result.origin.CGFloat y = v40;
  result.origin.CGFloat x = v39;
  return result;
}

- (CGRect)i_layerFrameInScaledCanvasIgnoringDragging
{
  double v3 = [(CRLCanvasRep *)self layout];
  unsigned __int8 v4 = [v3 parentAutosizes];

  if ((v4 & 1) == 0)
  {
    if ([(CRLCanvasRep *)self isBeingRotated])
    {
      double v5 = [(CRLCanvasRep *)self layout];
      unsigned __int8 v6 = [v5 wantsNormalLayoutDuringDynamicRotation];

      if ((v6 & 1) == 0)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014E58F0);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10109127C();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014E5910);
        }
        double v7 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10106590C(v7);
        }
        double v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasRep i_layerFrameInScaledCanvasIgnoringDragging]");
        double v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRep.m"];
        +[CRLAssertionHandler handleFailureInFunction:v8 file:v9 lineNumber:535 isFatal:0 description:"i_layerFrameInScaledCanvasIgnoringDragging is invalid in this state"];
      }
    }
  }
  unsigned int v10 = [(CRLCanvasRep *)self directlyManagesLayerContent];
  id WeakRetained = objc_loadWeakRetained((id *)&self->mCanvas);
  [(CRLCanvasRep *)self i_baseFrameInUnscaledCanvasForPositioningLayer];
  [WeakRetained convertUnscaledToBoundsRect:];
  double v16 = v12;
  CGFloat v17 = v13;
  CGFloat v18 = v14;
  CGFloat v19 = v15;
  if (v10)
  {
    double v20 = [(CRLCanvasRep *)self canvas];
    [v20 contentsScale];
    double v22 = sub_100067584(v16, v17, v18, v19, v21);
    double v24 = v23;
    double v26 = v25;
    double v28 = v27;
  }
  else
  {
    double v22 = sub_100067BC8(v12, v13, v14, v15);
    double v24 = v29;
    double v26 = v30;
    double v28 = v31;
  }

  double v32 = v22;
  double v33 = v24;
  double v34 = v26;
  double v35 = v28;
  result.size.CGFloat height = v35;
  result.size.CGFloat width = v34;
  result.origin.CGFloat y = v33;
  result.origin.CGFloat x = v32;
  return result;
}

- (CGRect)layerFrameInScaledCanvasRelativeToParent
{
  [(CRLCanvasRep *)self layerFrameInScaledCanvas];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [(CRLCanvasRep *)self parentRep];

  if (v11)
  {
    double v12 = [(CRLCanvasRep *)self parentRep];
    [v12 layerFrameInScaledCanvas];
    double v4 = sub_100064680(v4, v6, v13);
    double v6 = v14;
  }
  double v15 = v4;
  double v16 = v6;
  double v17 = v8;
  double v18 = v10;
  result.size.CGFloat height = v18;
  result.size.CGFloat width = v17;
  result.origin.CGFloat y = v16;
  result.origin.CGFloat x = v15;
  return result;
}

- (CGPoint)layerOffsetForDragging
{
  uint64_t v3 = objc_opt_class();
  double v4 = [(CRLCanvasRep *)self layout];
  double v5 = [v4 parent];
  double v6 = sub_1002469D0(v3, v5);

  if (v6)
  {
    double v7 = [(CRLCanvasRep *)self interactiveCanvasController];
    double v8 = [v7 repForLayout:v6];
  }
  else
  {
    double v8 = 0;
  }
  if ([v8 isBeingDragged])
  {
    double v9 = v8;
    [(CRLCanvasRep *)v9 layerFrameInScaledCanvas];
  }
  else
  {
    double v9 = self;
    [(CRLCanvasRep *)v9 i_layerFrameInScaledCanvasIgnoringDragging];
  }
  double v12 = v10;
  double v13 = v11;
  [(CRLCanvasRep *)v9 i_originalLayerFrameInScaledCanvas];
  double v15 = sub_100064680(v12, v13, v14);
  double v17 = v16;

  double v18 = v15;
  double v19 = v17;
  result.CGFloat y = v19;
  result.CGFloat x = v18;
  return result;
}

- (CGAffineTransform)transformToConvertNaturalToLayerRelative
{
  memset(&v18, 0, sizeof(v18));
  double v5 = [(CRLCanvasRep *)self layout];
  double v6 = v5;
  if (v5) {
    [v5 transformInRoot];
  }
  else {
    memset(&v18, 0, sizeof(v18));
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->mCanvas);
  [WeakRetained viewScale];
  CGFloat v9 = v8;

  memset(&v17, 0, sizeof(v17));
  CGAffineTransformMakeScale(&t2, v9, v9);
  CGAffineTransform t1 = v18;
  CGAffineTransformConcat(&v17, &t1, &t2);
  [(CRLCanvasRep *)self layerFrameInScaledCanvas];
  memset(&t1, 0, sizeof(t1));
  CGAffineTransformMakeTranslation(&t1, -v10, -v11);
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tCGFloat x = 0u;
  *(_OWORD *)&retstr->a = 0u;
  CGAffineTransform v14 = v17;
  CGAffineTransform v13 = t1;
  return CGAffineTransformConcat(retstr, &v14, &v13);
}

- (CGAffineTransform)transformToConvertNaturalFromLayerRelative
{
  [(CRLCanvasRep *)self transformToConvertNaturalToLayerRelative];
  return CGAffineTransformInvert(retstr, &v5);
}

- (CGPoint)convertNaturalPointToLayerRelative:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(CRLCanvasRep *)self transformToConvertNaturalToLayerRelative];
  float64x2_t v3 = vaddq_f64(v9, vmlaq_n_f64(vmulq_n_f64(v8, y), v7, x));
  double v4 = v3.f64[1];
  result.double x = v3.f64[0];
  result.double y = v4;
  return result;
}

- (CGPoint)convertNaturalPointFromLayerRelative:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(CRLCanvasRep *)self transformToConvertNaturalFromLayerRelative];
  float64x2_t v3 = vaddq_f64(v9, vmlaq_n_f64(vmulq_n_f64(v8, y), v7, x));
  double v4 = v3.f64[1];
  result.double x = v3.f64[0];
  result.double y = v4;
  return result;
}

- (CGRect)convertNaturalRectToLayerRelative:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(CRLCanvasRep *)self transformToConvertNaturalToLayerRelative];
  v8.origin.CGFloat x = x;
  v8.origin.CGFloat y = y;
  v8.size.CGFloat width = width;
  v8.size.CGFloat height = height;
  return CGRectApplyAffineTransform(v8, &v7);
}

- (CGRect)convertNaturalRectFromLayerRelative:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(CRLCanvasRep *)self transformToConvertNaturalFromLayerRelative];
  v8.origin.CGFloat x = x;
  v8.origin.CGFloat y = y;
  v8.size.CGFloat width = width;
  v8.size.CGFloat height = height;
  return CGRectApplyAffineTransform(v8, &v7);
}

- (BOOL)containsPoint:(CGPoint)a3 withPrecision:(BOOL)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(CRLCanvasRep *)self naturalBounds];
  CGFloat v10 = x;
  CGFloat v11 = y;

  return CGRectContainsPoint(*(CGRect *)&v6, *(CGPoint *)&v10);
}

- (BOOL)containsPoint:(CGPoint)a3 withSlop:(CGSize)a4
{
  double v5 = sub_10006402C(a3.x, a3.y, a4.width + a4.width);
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  [(CRLCanvasRep *)self naturalBounds];
  double v16 = v5;
  uint64_t v17 = v7;
  uint64_t v18 = v9;
  uint64_t v19 = v11;

  return CGRectIntersectsRect(*(CGRect *)&v12, *(CGRect *)&v16);
}

- (id)hitRep:(CGPoint)a3 withPrecision:(BOOL)a4 passingTest:(id)a5
{
  BOOL v5 = a4;
  double y = a3.y;
  double x = a3.x;
  uint64_t v7 = (uint64_t (**)(id, id))a5;
  if ([(CRLCanvasRep *)self shouldHitTestChildrenLikeTopLevelReps])
  {
    -[CRLCanvasRep convertNaturalPointToUnscaledCanvas:](self, "convertNaturalPointToUnscaledCanvas:", x, y);
    double v9 = v8;
    double v11 = v10;
    uint64_t v12 = [(CRLCanvasRep *)self canvas];
    CGAffineTransform v13 = [(CRLCanvasRep *)self childRepsForHitTesting];
    +[CRLInteractiveCanvasController smallRepOutsetForHitTestingWithPrecision:v5];
    double v15 = [v12 hitRep:v5 withPrecision:v13 inTopLevelReps:0 smallRepOutset:v7 unscaledPointTransformForRep:v9 passingTest:v11];
  }
  else
  {
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    double v16 = [(CRLCanvasRep *)self childRepsForHitTesting];
    uint64_t v12 = [v16 reverseObjectEnumerator];

    id v17 = [v12 countByEnumeratingWithState:&v40 objects:v44 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v41;
      float64x2_t v34 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&x, 0);
      while (2)
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v41 != v19) {
            objc_enumerationMutation(v12);
          }
          double v21 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          double v22 = [v21 layout:x];
          double v23 = [v22 geometry];
          double v24 = v23;
          if (v23)
          {
            [v23 inverseTransform];
            float64x2_t v25 = v37;
            float64x2_t v26 = v38;
            float64x2_t v27 = v39;
          }
          else
          {
            float64x2_t v38 = 0u;
            float64x2_t v39 = 0u;
            float64x2_t v27 = 0uLL;
            float64x2_t v25 = 0uLL;
            float64x2_t v26 = 0uLL;
            float64x2_t v37 = 0u;
          }
          float64x2_t v36 = vaddq_f64(v27, vmlaq_f64(vmulq_n_f64(v26, y), v34, v25));

          uint64_t v28 = [v21 hitRep:v5 withPrecision:v7 passingTest:*(_OWORD *)&v36];
          if (v28)
          {
            double v15 = (void *)v28;
            goto LABEL_16;
          }
        }
        id v18 = [v12 countByEnumeratingWithState:&v40 objects:v44 count:16];
        if (v18) {
          continue;
        }
        break;
      }
    }
    double v15 = 0;
  }
LABEL_16:

  if (!v15)
  {
    if (-[CRLCanvasRep containsPoint:withPrecision:](self, "containsPoint:withPrecision:", v5, x, y)) {
      double v29 = self;
    }
    else {
      double v29 = 0;
    }
    double v30 = v29;
    double v31 = v30;
    if (v7 && v30)
    {
      double v15 = self;
      if ((v7[2](v7, v30) & 1) == 0)
      {

        double v15 = 0;
      }
    }
    else
    {
      double v15 = v30;
    }
  }

  return v15;
}

- (id)hitRep:(CGPoint)a3 passingTest:(id)a4
{
  return -[CRLCanvasRep hitRep:withPrecision:passingTest:](self, "hitRep:withPrecision:passingTest:", 0, a4, a3.x, a3.y);
}

- (id)hitRep:(CGPoint)a3 withPrecision:(BOOL)a4
{
  return -[CRLCanvasRep hitRep:withPrecision:passingTest:](self, "hitRep:withPrecision:passingTest:", a4, 0, a3.x, a3.y);
}

- (id)hitReps:(CGPoint)a3 withSlop:(CGSize)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10025A2C4;
  v6[3] = &unk_1014E5930;
  CGSize v7 = a4;
  double v4 = -[CRLCanvasRep hitReps:withSlopBlock:](self, "hitReps:withSlopBlock:", v6, a3.x, a3.y);

  return v4;
}

- (id)hitReps:(CGPoint)a3 withSlopBlock:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  BOOL v5 = (double (**)(id, CRLCanvasRep *))a4;
  uint64_t v6 = +[NSMutableArray array];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  CGSize v7 = [(CRLCanvasRep *)self childRepsForHitTesting];
  double v8 = [v7 reverseObjectEnumerator];

  id v9 = [v8 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v33;
    float64x2_t v26 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&x, 0);
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v33 != v11) {
          objc_enumerationMutation(v8);
        }
        CGAffineTransform v13 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        double v14 = [v13 layout:x];
        double v15 = [v14 geometry];
        double v16 = v15;
        if (v15)
        {
          [v15 inverseTransform];
          float64x2_t v17 = v29;
          float64x2_t v18 = v30;
          float64x2_t v19 = v31;
        }
        else
        {
          float64x2_t v30 = 0u;
          float64x2_t v31 = 0u;
          float64x2_t v19 = 0uLL;
          float64x2_t v17 = 0uLL;
          float64x2_t v18 = 0uLL;
          float64x2_t v29 = 0u;
        }
        float64x2_t v28 = vaddq_f64(v19, vmlaq_f64(vmulq_n_f64(v18, y), v26, v17));

        double v20 = [v13 hitReps:v5 withSlopBlock:*(_OWORD *)&v28];
        if ([v20 count]) {
          [v6 addObjectsFromArray:v20];
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v10);
  }

  if (v5)
  {
    double width = v5[2](v5, self);
    double height = v22;
  }
  else
  {
    double width = CGSizeZero.width;
    double height = CGSizeZero.height;
  }
  if (-[CRLCanvasRep containsPoint:withSlop:](self, "containsPoint:withSlop:", x, y, width, height, *(void *)&x)) {
    [v6 addObject:self];
  }

  return v6;
}

- (id)hitRepChrome:(CGPoint)a3 passingTest:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  BOOL v5 = (uint64_t (**)(id, CRLCanvasRep *))a4;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v6 = [(CRLCanvasRep *)self childRepsForHitTesting];
  CGSize v7 = [v6 reverseObjectEnumerator];

  id v8 = [(CRLCanvasRep *)v7 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v32;
    float64x2_t v25 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&x, 0);
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v32 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        CGAffineTransform v13 = [v12 layout:x];
        double v14 = [v13 geometry];
        double v15 = v14;
        if (v14)
        {
          [v14 inverseTransform];
          float64x2_t v16 = v28;
          float64x2_t v17 = v29;
          float64x2_t v18 = v30;
        }
        else
        {
          float64x2_t v29 = 0u;
          float64x2_t v30 = 0u;
          float64x2_t v18 = 0uLL;
          float64x2_t v16 = 0uLL;
          float64x2_t v17 = 0uLL;
          float64x2_t v28 = 0u;
        }
        float64x2_t v27 = vaddq_f64(v18, vmlaq_f64(vmulq_n_f64(v17, y), v25, v16));

        float64x2_t v19 = [v12 hitRepChrome:v5 passingTest:*(_OWORD *)&v27];
        if (v19)
        {
          double v22 = v19;
          goto LABEL_18;
        }
      }
      id v9 = [(CRLCanvasRep *)v7 countByEnumeratingWithState:&v31 objects:v35 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  if (-[CRLCanvasRep hitRepChrome:](self, "hitRepChrome:", x, y))
  {
    CGSize v7 = self;
    double v20 = 0;
    if (v7)
    {
      if (v5)
      {
        char v21 = v5[2](v5, v7);
        double v22 = 0;
        double v20 = 0;
        if ((v21 & 1) == 0)
        {
LABEL_18:

          double v20 = v22;
          CGSize v7 = v22;
        }
      }
    }
  }
  else
  {
    double v20 = 0;
    CGSize v7 = 0;
  }

  return v7;
}

- (BOOL)hitRepChrome:(CGPoint)a3
{
  return 0;
}

- (id)i_smallHitRepNearPoint:(CGPoint)a3 smallRepOutset:(double)a4 forShortestDistance:(double *)a5 unscaledPointTransformForRep:(id)a6 passingTest:(id)a7
{
  double y = a3.y;
  double x = a3.x;
  id v56 = a6;
  uint64_t v11 = (unsigned int (**)(id, CRLCanvasRep *))a7;
  if ([(CRLCanvasRep *)self i_shouldSmallHitRepTestingRecurse])
  {
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    v52 = self;
    uint64_t v12 = [(CRLCanvasRep *)self childRepsForHitTesting];
    CGAffineTransform v13 = [v12 reverseObjectEnumerator];

    id v14 = [v13 countByEnumeratingWithState:&v62 objects:v66 count:16];
    if (v14)
    {
      id v15 = v14;
      float64x2_t v16 = 0;
      uint64_t v17 = *(void *)v63;
      float64x2_t v54 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&x, 0);
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v63 != v17) {
            objc_enumerationMutation(v13);
          }
          float64x2_t v19 = *(void **)(*((void *)&v62 + 1) + 8 * i);
          double v20 = [v19 layout];
          char v21 = [v20 geometry];
          double v22 = v21;
          if (v21)
          {
            [v21 inverseTransform];
            float64x2_t v23 = v59;
            float64x2_t v24 = v60;
            float64x2_t v25 = v61;
          }
          else
          {
            float64x2_t v60 = 0u;
            float64x2_t v61 = 0u;
            float64x2_t v25 = 0uLL;
            float64x2_t v23 = 0uLL;
            float64x2_t v24 = 0uLL;
            float64x2_t v59 = 0u;
          }
          float64x2_t v57 = vaddq_f64(v25, vmlaq_f64(vmulq_n_f64(v24, y), v54, v23));

          double v58 = *a5;
          float64x2_t v26 = [v19 i_smallHitRepNearPoint:&v58 smallRepOutset:v56 forShortestDistance:v11 unscaledPointTransformForRep:*(_OWORD *)&v57 passingTest:a4];
          float64x2_t v27 = v26;
          if (v26 && v58 < *a5)
          {
            float64x2_t v28 = v26;

            *a5 = v58;
            float64x2_t v16 = v28;
          }
        }
        id v15 = [v13 countByEnumeratingWithState:&v62 objects:v66 count:16];
      }
      while (v15);
    }
    else
    {
      float64x2_t v16 = 0;
    }

    self = v52;
  }
  else
  {
    float64x2_t v16 = 0;
  }
  -[CRLCanvasRep p_transformNaturalPoint:inUnscaledSpaceWithTransformFromBlock:](self, "p_transformNaturalPoint:inUnscaledSpaceWithTransformFromBlock:", v56, x, y);
  double v30 = v29;
  double v32 = v31;
  if (![(CRLCanvasRep *)self i_shouldCountAsClosestSmallRepForSizeLimit:a4])
  {
    LOBYTE(v58) = 0;
    -[CRLCanvasRep shortestDistanceToPoint:countAsHit:](self, "shortestDistanceToPoint:countAsHit:", &v58, v30, v32);
    if (!LOBYTE(v58)) {
      goto LABEL_31;
    }
    goto LABEL_27;
  }
  long long v33 = [(CRLCanvasRep *)self canvas];
  [v33 viewScale];
  double v35 = v34;

  [(CRLCanvasRep *)self naturalBounds];
  CGFloat v40 = v39;
  CGFloat v41 = v36;
  CGFloat v42 = v37;
  CGFloat v43 = v38;
  double v44 = 0.0;
  double v45 = -a4;
  double v46 = 0.0;
  if (v35 * v37 < a4) {
    double v46 = v45 / v35;
  }
  if (v35 * v38 < a4) {
    double v44 = v45 / v35;
  }
  CGFloat v47 = v40;
  CGRect v69 = CGRectInset(*(CGRect *)(&v36 - 1), v46, v44);
  v68.double x = v30;
  v68.double y = v32;
  if (CGRectContainsPoint(v69, v68))
  {
    double v48 = sub_1000653CC(v30, v32, v40, v41, v42, v43);
LABEL_27:
    double v49 = v48;
    if (v48 < *a5 && (!v11 || v11[2](v11, self)))
    {
      *a5 = v49;
      v50 = self;

      float64x2_t v16 = v50;
    }
  }
LABEL_31:

  return v16;
}

- (CGPoint)p_transformNaturalPoint:(CGPoint)a3 inUnscaledSpaceWithTransformFromBlock:(id)a4
{
  void (**v7)(float64x2_t *__return_ptr, id, CRLCanvasRep *);
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  float64x2_t v16;
  float64x2_t v17;
  float64x2_t v18;
  CGPoint result;

  double y = a3.y;
  double x = a3.x;
  if (a4)
  {
    CGSize v7 = (void (**)(float64x2_t *__return_ptr, id, CRLCanvasRep *))a4;
    -[CRLCanvasRep convertNaturalPointToUnscaledCanvas:](self, "convertNaturalPointToUnscaledCanvas:", x, y);
    id v14 = v9;
    id v15 = v8;
    uint64_t v17 = 0u;
    float64x2_t v18 = 0u;
    float64x2_t v16 = 0u;
    v7[2](&v16, v7, self);

    [(CRLCanvasRep *)self convertNaturalPointFromUnscaledCanvas:vaddq_f64(v18, vmlaq_n_f64(vmulq_n_f64(v17, v14), v16, v15))];
    double x = v10;
    double y = v11;
  }
  uint64_t v12 = x;
  CGAffineTransform v13 = y;
  result.double y = v13;
  result.double x = v12;
  return result;
}

- (BOOL)i_shouldSmallHitRepTestingRecurse
{
  return 0;
}

- (BOOL)i_shouldCountAsClosestSmallRepForSizeLimit:(double)a3
{
  [(CRLCanvasRep *)self naturalBounds];
  double v6 = v5;
  double v8 = v7;
  if (![(CRLCanvasRep *)self shouldExpandHitRegionWhenSmall]) {
    return 0;
  }
  float v9 = v6;
  float v10 = v8;
  double v11 = fminf(v9, v10);
  uint64_t v12 = [(CRLCanvasRep *)self canvas];
  [v12 viewScale];
  BOOL v14 = v13 * v11 < a3;

  return v14;
}

- (BOOL)shouldExpandHitRegionWhenSmall
{
  return 1;
}

- (BOOL)shouldHitTestChildrenLikeTopLevelReps
{
  return 0;
}

- (double)shortestDistanceToPoint:(CGPoint)a3 countAsHit:(BOOL *)a4
{
  return 3.40282347e38;
}

- (BOOL)intersectsUnscaledRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v7 = [(CRLCanvasRep *)self layout];
  double v8 = [v7 geometry];
  [v8 size];
  float v9 = +[CRLBezierPath bezierPathWithRect:sub_100064070()];

  if (v7) {
    [v7 transformInRoot];
  }
  else {
    memset(v12, 0, sizeof(v12));
  }
  [v9 transformUsingAffineTransform:v12];
  unsigned __int8 v10 = [v9 intersectsRect:1 x:x y:y width:width height:height];

  return v10;
}

- (id)cursorAtPoint:(CGPoint)a3 forKnob:(id)a4 withCursorPlatformObject:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 && (sub_1002893CC((char)[v7 tag]) & 0x3DE) != 0)
    {
      float v9 = [v8 pointerRequest];
      unsigned int v10 = [v9 modifiers];

      if ((v10 & 0x100000) != 0
        && ([(CRLCanvasRep *)self repForRotating],
            double v11 = objc_claimAutoreleasedReturnValue(),
            [v7 rep],
            uint64_t v12 = objc_claimAutoreleasedReturnValue(),
            v12,
            v11,
            v11 == v12))
      {
        uint64_t v13 = [v7 rotateCursor];
      }
      else
      {
        uint64_t v13 = [v7 resizeCursor];
      }
      goto LABEL_9;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v13 = +[CRLCursor defaultCursor];
LABEL_9:
      BOOL v14 = (void *)v13;
      goto LABEL_11;
    }
  }
  BOOL v14 = 0;
LABEL_11:

  return v14;
}

- (CRLCanvasRep)repForDragging
{
  return (CRLCanvasRep *)[(CRLCanvasRep *)self p_repForDraggingIgnoringTopLevelEditing:0];
}

- (CRLCanvasRep)i_repForDraggingIgnoringTopLevelEditing
{
  return (CRLCanvasRep *)[(CRLCanvasRep *)self p_repForDraggingIgnoringTopLevelEditing:1];
}

- (id)p_repForDraggingIgnoringTopLevelEditing:(BOOL)a3
{
  double v5 = [(CRLCanvasRep *)self interactiveCanvasController];
  double v6 = [(CRLCanvasRep *)self layout];
  if (![v6 isDraggable]) {
    goto LABEL_6;
  }
  id v7 = [v5 canvasEditor];
  id v8 = [(CRLCanvasRep *)self layout];
  if (![v7 isLayoutSelectable:v8] || -[CRLCanvasRep isLocked](self, "isLocked"))
  {

LABEL_5:
LABEL_6:

    goto LABEL_7;
  }
  unsigned __int8 v12 = [v5 documentIsSharedReadOnly];

  if ((v12 & 1) == 0)
  {
    if ([(CRLCanvasRep *)self isSelected]
      || ([v5 layerHost],
          uint64_t v13 = objc_claimAutoreleasedReturnValue(),
          [v13 asUIKitHost],
          BOOL v14 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v15 = [v14 isCurrentlyInQuickSelectMode],
          v14,
          v13,
          (v15 & 1) == 0))
    {
      if ([v5 hasSelectedInfosInMultipleContainers])
      {
        double v6 = [v5 infosForCurrentSelectionPath];
        float64x2_t v16 = [(CRLCanvasRep *)self info];
        id v7 = [v16 parentInfo];

        if (v7)
        {
          while (([v6 containsObject:v7] & 1) == 0)
          {
            uint64_t v17 = [v7 parentInfo];

            id v7 = (void *)v17;
            if (!v17) {
              goto LABEL_16;
            }
          }
          goto LABEL_5;
        }
LABEL_16:
      }
      else if (!a3)
      {
        float64x2_t v18 = [(CRLCanvasRep *)self layout];
        unsigned __int8 v19 = [v18 isInTopLevelContainerForEditing];

        if ((v19 & 1) == 0)
        {
          unsigned int v10 = [(CRLCanvasRep *)self parentRep];
          goto LABEL_21;
        }
      }
      double v20 = self;
      goto LABEL_23;
    }
  }
LABEL_7:
  float v9 = [(CRLCanvasRep *)self parentRep];
  unsigned int v10 = v9;
  if (!a3)
  {
LABEL_21:
    uint64_t v11 = [v10 repForDragging];
    goto LABEL_22;
  }
  uint64_t v11 = [v9 i_repForDraggingIgnoringTopLevelEditing];
LABEL_22:
  double v20 = (CRLCanvasRep *)v11;

LABEL_23:

  return v20;
}

- (NSSet)additionalRepsForDragging
{
  return +[NSSet set];
}

- (id)additionalRepsForDraggingConnectionLine:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  double v6 = [v4 info];

  id v7 = sub_1002469D0(v5, v6);

  if (v7)
  {
    id v8 = [(CRLCanvasRep *)self interactiveCanvasController];
    float v9 = [v8 editingCoordinator];
    unsigned int v10 = [v9 mainBoard];

    uint64_t v11 = objc_opt_class();
    unsigned __int8 v12 = [(CRLCanvasRep *)self info];
    uint64_t v13 = sub_1002469D0(v11, v12);

    if ([v7 isConnectedWithBoardItem:v13 boardItemOwner:v10])
    {
      uint64_t v14 = +[NSSet setWithObject:self];
    }
    else
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E5990);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10109138C();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E59B0);
      }
      unsigned __int8 v19 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v19);
      }
      double v20 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasRep additionalRepsForDraggingConnectionLine:]");
      char v21 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRep.m"];
      +[CRLAssertionHandler handleFailureInFunction:v20 file:v21 lineNumber:1007 isFatal:0 description:"This method should not be called if current rep is not connected to connection line."];

      uint64_t v14 = +[NSSet set];
    }
    float64x2_t v18 = (void *)v14;
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E5950);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101091304();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E5970);
    }
    unsigned __int8 v15 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v15);
    }
    float64x2_t v16 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasRep additionalRepsForDraggingConnectionLine:]");
    uint64_t v17 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRep.m"];
    +[CRLAssertionHandler handleFailureInFunction:v16 file:v17 lineNumber:997 isFatal:0 description:"Connection line item should not be nil."];

    float64x2_t v18 = +[NSSet set];
  }

  return v18;
}

- (CRLCanvasRep)repForSelecting
{
  return (CRLCanvasRep *)[(CRLCanvasRep *)self p_repForSelectingIgnoringTopLevelEditing:0 ignoringInlineEditing:0];
}

- (CRLCanvasRep)i_repForSelectingIgnoringTopLevelEditing
{
  return (CRLCanvasRep *)[(CRLCanvasRep *)self p_repForSelectingIgnoringTopLevelEditing:1 ignoringInlineEditing:0];
}

- (id)p_repForSelectingIgnoringTopLevelEditing:(BOOL)a3 ignoringInlineEditing:(BOOL)a4
{
  double v6 = [(CRLCanvasRep *)self interactiveCanvasController];
  id v7 = [(CRLCanvasRep *)self layout];
  if (([v7 isSelectable] & 1) == 0)
  {

    goto LABEL_8;
  }
  id v8 = [v6 canvasEditor];
  float v9 = [(CRLCanvasRep *)self layout];
  unsigned int v10 = [v8 isLayoutSelectable:v9];

  if (!v10)
  {
LABEL_8:
    float64x2_t v16 = [(CRLCanvasRep *)self parentRep];
    uint64_t v17 = v16;
    if (a3) {
      [v16 i_repForSelectingIgnoringTopLevelEditing];
    }
    else {
    float64x2_t v18 = [v16 repForSelecting];
    }

    goto LABEL_12;
  }
  unsigned int v11 = [v6 hasSelectedInfosInMultipleContainers];
  unsigned __int8 v12 = [v6 freehandDrawingToolkit];
  unsigned __int8 v13 = [v12 isInDrawingMode];

  if ((v13 & 1) != 0 || v11)
  {
    uint64_t v14 = [v6 infosForCurrentSelectionPath];
    double v20 = [(CRLCanvasRep *)self info];
    unsigned __int8 v21 = [v14 containsObject:v20];

    if (v21)
    {
      unsigned int v15 = 1;
    }
    else
    {
      double v22 = [(CRLCanvasRep *)self info];
      float64x2_t v23 = [v22 parentInfo];

      if (v23)
      {
        while (([v14 containsObject:v23] & 1) == 0)
        {
          uint64_t v24 = [v23 parentInfo];

          float64x2_t v23 = (void *)v24;
          if (!v24) {
            goto LABEL_20;
          }
        }
        unsigned int v15 = 0;
      }
      else
      {
LABEL_20:
        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        id v25 = v14;
        id v26 = [v25 countByEnumeratingWithState:&v33 objects:v37 count:16];
        if (v26)
        {
          id v27 = v26;
          uint64_t v28 = *(void *)v34;
          while (2)
          {
            for (i = 0; i != v27; i = (char *)i + 1)
            {
              if (*(void *)v34 != v28) {
                objc_enumerationMutation(v25);
              }
              uint64_t v30 = [*(id *)(*((void *)&v33 + 1) + 8 * i) parentInfo:v33];
              if (v30)
              {
                float64x2_t v23 = (void *)v30;
                while (1)
                {
                  double v31 = [(CRLCanvasRep *)self info];

                  if (v23 == v31) {
                    break;
                  }
                  uint64_t v32 = [v23 parentInfo];

                  float64x2_t v23 = (void *)v32;
                  if (!v32) {
                    goto LABEL_29;
                  }
                }
                unsigned int v15 = 0;
                goto LABEL_35;
              }
LABEL_29:
              ;
            }
            id v27 = [v25 countByEnumeratingWithState:&v33 objects:v37 count:16];
            float64x2_t v23 = 0;
            unsigned int v15 = 1;
            if (v27) {
              continue;
            }
            break;
          }
        }
        else
        {
          float64x2_t v23 = 0;
          unsigned int v15 = 1;
        }
LABEL_35:
      }
    }
LABEL_37:

    if (v15) {
      goto LABEL_38;
    }
    goto LABEL_8;
  }
  if (!a3)
  {
    uint64_t v14 = [(CRLCanvasRep *)self layout];
    unsigned int v15 = [v14 isInTopLevelContainerForEditing];
    goto LABEL_37;
  }
LABEL_38:
  float64x2_t v18 = self;
LABEL_12:

  return v18;
}

- (BOOL)everAllowedToBeSelectedAsADrawable
{
  BOOL v2 = self;
  float64x2_t v3 = [(CRLCanvasRep *)self p_repForSelectingIgnoringTopLevelEditing:1 ignoringInlineEditing:1];
  LOBYTE(v2) = v3 == v2;

  return (char)v2;
}

- (CRLCanvasRep)repForRotating
{
  float64x2_t v3 = [(CRLCanvasRep *)self interactiveCanvasController];
  if ([v3 hasSelectedInfosInMultipleContainers])
  {
    char v4 = 0;
  }
  else
  {
    uint64_t v5 = [(CRLCanvasRep *)self layout];
    char v4 = [v5 isInTopLevelContainerForEditing] ^ 1;
  }
  double v6 = [(CRLCanvasRep *)self layout];
  if (![v6 supportsRotation] || (v4 & 1) != 0) {
    goto LABEL_9;
  }
  id v7 = [(CRLCanvasRep *)self interactiveCanvasController];
  id v8 = [v7 canvasEditor];
  float v9 = [(CRLCanvasRep *)self layout];
  if (![v8 isLayoutSelectable:v9] || -[CRLCanvasRep isLocked](self, "isLocked"))
  {

LABEL_9:
LABEL_10:
    unsigned int v10 = [(CRLCanvasRep *)self parentRep];
    unsigned int v11 = [v10 repForRotating];

    goto LABEL_11;
  }
  unsigned __int8 v13 = [(CRLCanvasRep *)self interactiveCanvasController];
  unsigned __int8 v14 = [v13 documentIsSharedReadOnly];

  if (v14) {
    goto LABEL_10;
  }
  unsigned int v11 = self;
LABEL_11:

  return v11;
}

- (CRLCanvasRep)repForFreeTransforming
{
  float64x2_t v3 = [(CRLCanvasRep *)self repForRotating];
  if (!v3)
  {
    float64x2_t v3 = [(CRLCanvasRep *)self repForDragging];
  }

  return (CRLCanvasRep *)v3;
}

- (BOOL)p_isNotSelectableDueToUnknownContent
{
  float64x2_t v3 = [(CRLCanvasRep *)self info];
  char v4 = sub_10006B444(v3);

  uint64_t v5 = [(CRLCanvasRep *)self interactiveCanvasController];
  double v6 = [v5 repForInfo:v4];

  LOBYTE(v5) = [v6 containsUnknownContent];
  return (char)v5;
}

- (void)p_showAlertForGroupWithUnknownContent
{
  id v3 = [(CRLCanvasRep *)self interactiveCanvasController];
  BOOL v2 = [v3 layerHost];
  +[CRLUnknownRep presentUnsupportedItemAlertWithLayerHost:v2 forGroup:1];
}

- (CRLCanvasRep)repForHandleSingleTap
{
  id v3 = [(CRLCanvasRep *)self repForSelecting];
  if (!v3)
  {
    if ([(CRLCanvasRep *)self p_isNotSelectableDueToUnknownContent]) {
      id v3 = self;
    }
    else {
      id v3 = 0;
    }
  }

  return v3;
}

- (BOOL)manuallyControlsMiniFormatter
{
  return 0;
}

- (BOOL)isPreviewable
{
  return 1;
}

- (CRLCanvasRep)repForPreviewing
{
  BOOL v2 = self;
  id v3 = v2;
  while (1)
  {
    char v4 = [v3 repForSelecting];
    if ([v4 isPreviewable]) {
      break;
    }
    uint64_t v5 = [v3 parentRep];

    id v3 = (void *)v5;
    if (!v5) {
      goto LABEL_6;
    }
  }
  if (v4) {
    goto LABEL_18;
  }
LABEL_6:
  int v6 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014E59D0);
  }
  id v7 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR)) {
    sub_101091414((uint64_t)v2, v6, v7);
  }

  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014E59F0);
  }
  id v8 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_10106590C(v8);
  }
  float v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasRep repForPreviewing]");
  unsigned int v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRep.m"];
  if (v2)
  {
    unsigned int v11 = (objc_class *)objc_opt_class();
    unsigned __int8 v12 = NSStringFromClass(v11);
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 1139, 0, "There should have been a rep suitable for previewing <%{public}@: %{public}p>", v12, v2);
  }
  else
  {
    +[CRLAssertionHandler handleFailureInFunction:v9, v10, 1139, 0, "There should have been a rep suitable for previewing <%{public}@: %{public}p>", @"Nil", 0 file lineNumber isFatal description];
  }

  char v4 = 0;
LABEL_18:

  return (CRLCanvasRep *)v4;
}

- (NSArray)layoutsForChildReps
{
  BOOL v2 = [(CRLCanvasRep *)self layout];
  id v3 = [v2 children];

  return (NSArray *)v3;
}

- (void)updateChildrenFromLayout
{
  id v3 = [(CRLCanvasRep *)self childReps];
  char v4 = [(CRLCanvasRep *)self layoutsForChildReps];
  id v5 = [v4 count];
  uint64_t v30 = v3;
  if (v5 != [v3 count]) {
    goto LABEL_14;
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v7)
  {
    id v8 = v7;
    float v9 = v4;
    uint64_t v10 = 0;
    uint64_t v11 = *(void *)v36;
    while (1)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v36 != v11) {
          objc_enumerationMutation(v6);
        }
        unsigned __int8 v13 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        unsigned __int8 v14 = [v30 objectAtIndexedSubscript:(char *)i + v10];
        unsigned int v15 = [v14 layout];
        if (v15 != v13)
        {

LABEL_13:
          char v4 = v9;
LABEL_14:
          id v6 = [(CRLCanvasRep *)self canvas];
          id v17 = objc_alloc_init((Class)NSMutableArray);
          long long v31 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          uint64_t v28 = v4;
          id v18 = v4;
          id v19 = [v18 countByEnumeratingWithState:&v31 objects:v39 count:16];
          if (!v19) {
            goto LABEL_28;
          }
          id v20 = v19;
          uint64_t v21 = *(void *)v32;
          while (2)
          {
            uint64_t v22 = 0;
LABEL_17:
            if (*(void *)v32 != v21) {
              objc_enumerationMutation(v18);
            }
            float64x2_t v23 = *(void **)(*((void *)&v31 + 1) + 8 * v22);
            id v24 = [v6 repForLayout:v23];
            if (v24) {
              goto LABEL_25;
            }
            id v24 = objc_msgSend(objc_alloc((Class)objc_msgSend(v23, "repClassOverride")), "initWithLayout:canvas:", v23, v6);
            id v25 = [(CRLCanvasRep *)self canvas];
            if (![v25 isCanvasInteractive]) {
              goto LABEL_23;
            }
            unsigned int v26 = [(CRLCanvasRep *)self isInDynamicOperation];

            if (v26)
            {
              id v25 = [(CRLCanvasRep *)self layout];
              [v24 dynamicOperationDidBeginWithRealTimeCommands:[v25 isInRealTimeDynamicOperation]];
LABEL_23:
            }
            if (v24) {
LABEL_25:
            }
              [v17 addObject:v24];
            [v24 setParentRep:self];

            if (v20 == (id)++v22)
            {
              id v20 = [v18 countByEnumeratingWithState:&v31 objects:v39 count:16];
              if (!v20)
              {
LABEL_28:

                [v6 orderRepsForLayout:v17];
                [(CRLCanvasRep *)self p_setChildReps:v17];

                char v4 = v28;
                goto LABEL_29;
              }
              continue;
            }
            goto LABEL_17;
          }
        }
        float64x2_t v16 = [v14 parentRep];

        if (v16 != self) {
          goto LABEL_13;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v35 objects:v40 count:16];
      v10 += (uint64_t)i;
      if (!v8)
      {
        char v4 = v9;
        break;
      }
    }
  }
LABEL_29:

  id v27 = [(CRLCanvasRep *)self childReps];
  [v27 makeObjectsPerformSelector:a2];
}

- (void)p_setChildReps:(id)a3
{
  id v4 = a3;
  if (([v4 isEqual:self->mChildReps] & 1) == 0)
  {
    id v5 = [objc_alloc((Class)NSSet) initWithArray:v4];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v6 = self->mChildReps;
    id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v28;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v28 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          if (([v5 containsObject:v11] & 1) == 0)
          {
            unsigned __int8 v12 = [v11 parentRep];

            if (v12 == self) {
              [v11 setParentRep:0];
            }
          }
        }
        id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v8);
    }

    if (self->mChildReps) {
      id v13 = [objc_alloc((Class)NSSet) initWithArray:self->mChildReps];
    }
    else {
      id v13 = 0;
    }
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v14 = v4;
    id v15 = [v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v24;
      do
      {
        for (j = 0; j != v16; j = (char *)j + 1)
        {
          if (*(void *)v24 != v17) {
            objc_enumerationMutation(v14);
          }
          id v19 = *(void **)(*((void *)&v23 + 1) + 8 * (void)j);
          if ((objc_msgSend(v13, "containsObject:", v19, (void)v23) & 1) == 0)
          {
            id v20 = [v19 parentRep];
            [v20 removeChildRep:v19];

            [v19 setParentRep:self];
          }
        }
        id v16 = [v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
      }
      while (v16);
    }

    uint64_t v21 = (NSMutableArray *)[v14 mutableCopy];
    mChildReps = self->mChildReps;
    self->mChildReps = v21;
  }
}

- (void)removeChildRep:(id)a3
{
  id v5 = a3;
  id v4 = -[NSMutableArray indexOfObjectIdenticalTo:](self->mChildReps, "indexOfObjectIdenticalTo:");
  if (v4 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    [(NSMutableArray *)self->mChildReps removeObjectAtIndex:v4];
    [v5 setParentRep:0];
  }
}

- (void)didAddChildRep:(id)a3
{
  id v6 = a3;
  if ([(CRLCanvasRep *)self isInDynamicOperation])
  {
    id v4 = [(CRLCanvasRep *)self layout];
    [v6 dynamicOperationDidBeginWithRealTimeCommands:[v4 isInRealTimeDynamicOperation]];

    if ([(CRLCanvasRep *)self isBeingRotated])
    {
      [v6 dynamicRotateDidBegin];
    }
    else if ([(CRLCanvasRep *)self isBeingResized])
    {
      id v5 = [v6 dynamicResizeDidBegin];
    }
  }
}

- (void)updateFromLayout
{
  id v3 = [(CRLCanvasRep *)self canvas];
  unsigned int v4 = [v3 isCanvasInteractive];

  if (v4)
  {
    if (![(CRLCanvasRep *)self p_isBeingDraggedRecursive])
    {
      if (![(CRLCanvasRep *)self isBeingRotated]
        || ([(CRLCanvasRep *)self layout],
            id v5 = objc_claimAutoreleasedReturnValue(),
            unsigned int v6 = [v5 wantsNormalLayoutDuringDynamicRotation],
            v5,
            v6))
      {
        id v7 = [(CRLCanvasRep *)self layout];
        id v8 = [v7 geometryInRoot];

        if (([v8 isEqual:self->mLastGeometryInRoot] & 1) == 0) {
          -[CRLCanvasRep layoutInRootChangedFrom:to:translatedOnly:](self, "layoutInRootChangedFrom:to:translatedOnly:", self->mLastGeometryInRoot, v8, [v8 differsInMoreThanTranslationFrom:self->mLastGeometryInRoot] ^ 1);
        }
        uint64_t v9 = (CRLCanvasLayoutGeometry *)[v8 copy];
        mLastGeometryInRoot = self->mLastGeometryInRoot;
        self->mLastGeometryInRoot = v9;
      }
    }
    uint64_t v11 = [(CRLCanvasRep *)self layout];
    [v11 i_takeDirtyRect];
    -[CRLCanvasRep setNeedsDisplayInRect:](self, "setNeedsDisplayInRect:");

    [(CRLCanvasRep *)self i_invalidateSelectionHighlightRenderable];
  }
}

- (BOOL)p_isBeingDraggedRecursive
{
  if ([(CRLCanvasRep *)self isBeingFreeTransformDragged]
    && ![(CRLCanvasRep *)self isBeingFreeTransformResized])
  {
    char v3 = ![(CRLCanvasRep *)self isBeingFreeTransformRotated];
  }
  else
  {
    char v3 = 0;
  }
  LOBYTE(v4) = 1;
  if (![(CRLCanvasRep *)self isBeingDragged] && (v3 & 1) == 0)
  {
    id v5 = [(CRLCanvasRep *)self layout];
    unsigned int v6 = [v5 layoutState];

    if (v6 == 1 && ([(CRLCanvasRep *)self parentRep], (uint64_t v7 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v8 = (void *)v7;
      do
      {
        if ([v8 isBeingFreeTransformDragged])
        {
          if ([v8 isBeingFreeTransformResized]) {
            unsigned int v9 = 1;
          }
          else {
            unsigned int v9 = [v8 isBeingFreeTransformRotated];
          }
          int v10 = v9 ^ 1;
        }
        else
        {
          int v10 = 0;
        }
        unsigned int v4 = [v8 isBeingDragged] | v10;
        if (v4) {
          break;
        }
        uint64_t v11 = [v8 parentRep];

        id v8 = (void *)v11;
      }
      while (v11);
    }
    else
    {
      LOBYTE(v4) = 0;
    }
  }
  return v4;
}

- (BOOL)skipsRerenderForTranslation
{
  return 0;
}

- (void)layoutInRootChangedFrom:(id)a3 to:(id)a4 translatedOnly:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if (v5)
  {
    if (![(CRLCanvasRep *)self skipsRerenderForTranslation])
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->mCanvas);
      if (v8)
      {
        [v8 transform];
        float64x2_t v12 = v44;
        float64x2_t v13 = v45;
        float64x2_t v14 = v46;
      }
      else
      {
        float64x2_t v14 = 0uLL;
        float64x2_t v12 = 0uLL;
        float64x2_t v13 = 0uLL;
      }
      [WeakRetained convertUnscaledToBoundsPoint:vaddq_f64(v14, vmlaq_n_f64(vmulq_n_f64(v13, CGPointZero.y), v12, CGPointZero.x)), vdupq_lane_s64(*(uint64_t *)&CGPointZero.x, 0), *(void *)&CGPointZero.y, v11];
      double v16 = v15;

      id v17 = objc_loadWeakRetained((id *)&self->mCanvas);
      if (v9)
      {
        [v9 transform];
        float64x2_t v18 = v41;
        float64x2_t v19 = v42;
        float64x2_t v20 = v43;
      }
      else
      {
        float64x2_t v20 = 0uLL;
        float64x2_t v18 = 0uLL;
        float64x2_t v19 = 0uLL;
      }
      [v17 convertUnscaledToBoundsPoint:vaddq_f64(v20, vmlaq_f64(vmulq_n_f64(v19, v40), v39, v18))];
      double v22 = v21;
      double v24 = v23;

      double v25 = sub_100064680(v22, v24, v16);
      double v27 = v26;
      long long v28 = [(CRLCanvasRep *)self canvas];
      [v28 contentsScale];
      double v30 = sub_1000646A4(v25, v27, v29);
      double v32 = v31;

      double v33 = sub_100407E24(v30);
      double v34 = sub_100407E24(v32);
      if (v33 != 0.0)
      {
        double v35 = fabs(v33);
        BOOL v36 = v35 < 0.00999999978 || v35 == 1.0;
        if (!v36 && fabs(v35 + -1.0) >= 0.00999999978) {
          goto LABEL_23;
        }
      }
      if (v34 != 0.0)
      {
        double v37 = fabs(v34);
        double v34 = 0.00999999978;
        BOOL v38 = v37 < 0.00999999978 || v37 == 1.0;
        if (!v38 && fabs(v37 + -1.0) >= 0.00999999978) {
LABEL_23:
        }
          [(CRLCanvasRep *)self setNeedsDisplay];
      }
    }
  }
  else
  {
    [(CRLCanvasRep *)self setNeedsDisplay];
    [(CRLCanvasRep *)self invalidateKnobPositions];
  }
}

- (CGAffineTransform)i_layerTransform
{
  long long v5 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&retstr->c = v5;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&CGAffineTransformIdentity.tx;
  CGPoint result = (CGAffineTransform *)[(CRLCanvasRep *)self isBeingRotated];
  if (!result) {
    return result;
  }
  uint64_t v7 = [(CRLCanvasRep *)self parentRep];
  if ([v7 isBeingRotated])
  {
  }
  else
  {
    id v8 = [(CRLCanvasRep *)self layout];
    unsigned __int8 v9 = [v8 wantsNormalLayoutDuringDynamicRotation];

    if ((v9 & 1) == 0)
    {
      long long v44 = 0u;
      long long v45 = 0u;
      long long v43 = 0u;
      float64x2_t v20 = [(CRLCanvasRep *)self layout];
      double v21 = v20;
      if (v20)
      {
        [v20 originalPureTransformInRoot];
      }
      else
      {
        long long v44 = 0u;
        long long v45 = 0u;
        long long v43 = 0u;
      }

      long long v41 = 0u;
      long long v42 = 0u;
      long long v40 = 0u;
      double v22 = [(CRLCanvasRep *)self layout];
      double v23 = v22;
      if (v22)
      {
        [v22 pureTransformInRoot];
      }
      else
      {
        long long v41 = 0u;
        long long v42 = 0u;
        long long v40 = 0u;
      }

      long long v34 = v43;
      long long v35 = v44;
      long long v36 = v45;
      long long v31 = v40;
      long long v32 = v41;
      long long v33 = v42;
      CGPoint result = [(CRLCanvasRep *)self p_layerTransformForRotationFromPureTransformInRoot:&v34 toPureTransformInRoot:&v31];
      long long v24 = v38;
      *(_OWORD *)&retstr->a = v37;
      *(_OWORD *)&retstr->c = v24;
      *(_OWORD *)&retstr->tdouble x = v39;
      return result;
    }
  }
  id v30 = [(CRLCanvasRep *)self parentRep];
  if (([v30 isBeingRotated] & 1) == 0) {
    goto LABEL_25;
  }
  int v10 = [(CRLCanvasRep *)self layout];
  if (([v10 wantsNormalLayoutDuringDynamicRotation] & 1) == 0)
  {

LABEL_25:

    return result;
  }
  uint64_t v11 = [(CRLCanvasRep *)self layout];
  unsigned __int8 v12 = [v11 i_anyAncestorCurrentlyBeingRotatedWantsNormalLayoutDuringDynamicRotation];

  if ((v12 & 1) == 0)
  {
    uint64_t v13 = [(CRLCanvasRep *)self parentRep];
    if (v13)
    {
      float64x2_t v14 = (void *)v13;
      while (1)
      {
        if ([v14 isBeingRotated])
        {
          double v15 = [v14 parentRep];
          unsigned int v16 = [v15 isBeingRotated];

          if (!v16) {
            break;
          }
        }
        uint64_t v17 = [v14 parentRep];

        float64x2_t v14 = (void *)v17;
        if (!v17) {
          goto LABEL_13;
        }
      }
      long long v44 = 0u;
      long long v45 = 0u;
      long long v43 = 0u;
      double v25 = [v14 layout];
      double v26 = v25;
      if (v25)
      {
        [v25 originalPureTransformInRoot];
      }
      else
      {
        long long v44 = 0u;
        long long v45 = 0u;
        long long v43 = 0u;
      }

      long long v41 = 0u;
      long long v42 = 0u;
      long long v40 = 0u;
      double v27 = [v14 layout];
      long long v28 = v27;
      if (v27)
      {
        [v27 pureTransformInRoot];
      }
      else
      {
        long long v41 = 0u;
        long long v42 = 0u;
        long long v40 = 0u;
      }

      long long v34 = v40;
      long long v35 = v41;
      long long v36 = v42;
      long long v31 = v43;
      long long v32 = v44;
      long long v33 = v45;
      [(CRLCanvasRep *)self p_layerTransformForRotationFromPureTransformInRoot:&v34 toPureTransformInRoot:&v31];
      long long v29 = v38;
      *(_OWORD *)&retstr->a = v37;
      *(_OWORD *)&retstr->c = v29;
      *(_OWORD *)&retstr->tdouble x = v39;
    }
    else
    {
LABEL_13:
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E5A10);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101091514();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E5A30);
      }
      float64x2_t v18 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v18);
      }
      float64x2_t v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasRep i_layerTransform]");
      float64x2_t v19 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRep.m"];
      +[CRLAssertionHandler handleFailureInFunction:v14 file:v19 lineNumber:1348 isFatal:0 description:"Unable to find topmost rotated ancestor for counteracting the layer transform."];
    }
  }
  return result;
}

- (CGAffineTransform)p_layerTransformForRotationFromPureTransformInRoot:(SEL)a3 toPureTransformInRoot:(CGAffineTransform *)a4
{
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tdouble x = 0u;
  *(_OWORD *)&retstr->a = 0u;
  long long v8 = *(_OWORD *)&a4->c;
  *(_OWORD *)&t2.a = *(_OWORD *)&a4->a;
  *(_OWORD *)&t2.c = v8;
  *(_OWORD *)&t2.tdouble x = *(_OWORD *)&a4->tx;
  CGAffineTransformInvert(&t1, &t2);
  long long v9 = *(_OWORD *)&a5->c;
  *(_OWORD *)&t2.a = *(_OWORD *)&a5->a;
  *(_OWORD *)&t2.c = v9;
  *(_OWORD *)&t2.tdouble x = *(_OWORD *)&a5->tx;
  CGAffineTransformConcat(retstr, &t1, &t2);
  [(CRLCanvasRep *)self layerFrameInScaledCanvas];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  p_mCanvas = &self->mCanvas;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mCanvas);
  [WeakRetained convertBoundsToUnscaledRect:v11, v13, v15, v17];
  double v24 = sub_100065738(v20, v21, v22, v23);
  CGFloat v26 = v25;

  long long v27 = *(_OWORD *)&retstr->c;
  v34[0] = *(_OWORD *)&retstr->a;
  v34[1] = v27;
  v34[2] = *(_OWORD *)&retstr->tx;
  sub_10007FCC0(v34, &t2, v24, v26);
  long long v28 = *(_OWORD *)&t2.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&t2.a;
  *(_OWORD *)&retstr->c = v28;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&t2.tx;
  id v29 = objc_loadWeakRetained((id *)p_mCanvas);
  [v29 viewScale];
  retstr->tdouble x = v30 * retstr->tx;

  id v31 = objc_loadWeakRetained((id *)p_mCanvas);
  [v31 viewScale];
  retstr->tdouble y = v32 * retstr->ty;

  return result;
}

- (CGAffineTransform)parentLayerInverseTransformInRootForZeroAnchor
{
  long long v5 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&retstr->c = v5;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&CGAffineTransformIdentity.tx;
  unsigned int v6 = [(CRLCanvasRep *)self parentRep];

  if (v6)
  {
    long long v8 = [(CRLCanvasRep *)self parentRep];
    long long v9 = v8;
    if (v8) {
      [v8 layerTransformInRootForZeroAnchor];
    }
    else {
      memset(&v12, 0, sizeof(v12));
    }
    long long v10 = *(_OWORD *)&v12.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v12.a;
    *(_OWORD *)&retstr->c = v10;
    *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&v12.tx;

    long long v11 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v12.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v12.c = v11;
    *(_OWORD *)&v12.tdouble x = *(_OWORD *)&retstr->tx;
    return CGAffineTransformInvert(retstr, &v12);
  }
  return result;
}

- (CGAffineTransform)layerTransformInRootForZeroAnchor
{
  long long v4 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&retstr->c = v4;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&CGAffineTransformIdentity.tx;
  CGPoint result = self;
  if (result)
  {
    unsigned int v6 = result;
    do
    {
      [(CGAffineTransform *)v6 layerFrameInScaledCanvasRelativeToParent];
      CGFloat v8 = v7;
      CGFloat v10 = v9;
      double v12 = v11;
      double v14 = v13;
      memset(&v22, 0, sizeof(v22));
      [(CGAffineTransform *)v6 i_layerTransform];
      CGAffineTransform t1 = v22;
      sub_10007FCC0(&t1, &v21, v12 * -0.5, v14 * -0.5);
      CGAffineTransform v22 = v21;
      CGAffineTransformMakeTranslation(&v19, v8, v10);
      CGAffineTransform t1 = v22;
      CGAffineTransformConcat(&v21, &t1, &v19);
      long long v15 = *(_OWORD *)&v21.c;
      CGAffineTransform v22 = v21;
      long long v16 = *(_OWORD *)&v21.a;
      long long v17 = *(_OWORD *)&retstr->c;
      *(_OWORD *)&v21.a = *(_OWORD *)&retstr->a;
      *(_OWORD *)&v21.c = v17;
      *(_OWORD *)&v21.tdouble x = *(_OWORD *)&retstr->tx;
      *(_OWORD *)&t1.a = v16;
      *(_OWORD *)&t1.c = v15;
      *(_OWORD *)&t1.tdouble x = *(_OWORD *)&v22.tx;
      CGAffineTransformConcat(retstr, &v21, &t1);
      uint64_t v18 = [(CGAffineTransform *)v6 parentRep];

      unsigned int v6 = (CGAffineTransform *)v18;
    }
    while (v18);
  }
  return result;
}

- (void)updateRenderableGeometryFromLayout:(id)a3
{
  id v4 = a3;
  [(CRLCanvasRep *)self layerFrameInScaledCanvasRelativeToParent];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  [(CRLCanvasRep *)self i_layerTransform];
  v13[0] = v14;
  v13[1] = v15;
  v13[2] = v16;
  [v4 setIfDifferentFrame:v13 orTransform:v6, v8, v10, v12];
}

- (void)antiAliasDefeatLayerTransform:(CGAffineTransform *)a3 forFrame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  long long v10 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v39.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v39.c = v10;
  *(_OWORD *)&v39.tCGFloat x = *(_OWORD *)&a3->tx;
  if (sub_10007F8A0(&v39.a, a4.size.width, a4.size.height))
  {
    long long v11 = *(_OWORD *)&a3->c;
    *(_OWORD *)&v38.a = *(_OWORD *)&a3->a;
    *(_OWORD *)&v38.c = v11;
    *(_OWORD *)&v38.tCGFloat x = *(_OWORD *)&a3->tx;
    memset(&v39, 0, sizeof(v39));
    sub_10007FCC0(&v38, &v39, width * -0.5, height * -0.5);
    CGAffineTransform v38 = v39;
    v40.origin.CGFloat x = x;
    v40.origin.CGFloat y = y;
    v40.size.double width = width;
    v40.size.double height = height;
    CGRect v41 = CGRectApplyAffineTransform(v40, &v38);
    double v12 = v41.origin.x;
    CGFloat v13 = v41.origin.y;
    double v14 = v41.size.width;
    double v15 = v41.size.height;
    long long v16 = [(CRLCanvasRep *)self canvas];
    [v16 contentsScale];
    double v18 = sub_100067584(v12, v13, v14, v15, v17);
    CGFloat v30 = v19;
    CGFloat v31 = v18;
    double v21 = v20;
    double v23 = v22;

    memset(&v38, 0, sizeof(v38));
    v42.origin.CGFloat x = v12;
    v42.origin.CGFloat y = v13;
    v42.size.double width = v14;
    v42.size.double height = v15;
    double v32 = height;
    CGFloat v24 = -CGRectGetMinX(v42);
    v43.origin.CGFloat x = v12;
    v43.origin.CGFloat y = v13;
    v43.size.double width = v14;
    v43.size.double height = v15;
    CGFloat MinY = CGRectGetMinY(v43);
    CGAffineTransformMakeTranslation(&v38, v24, -MinY);
    CGAffineTransformMakeScale(&t2, v21 / v14, v23 / v15);
    CGAffineTransform t1 = v38;
    CGAffineTransformConcat(&v37, &t1, &t2);
    CGAffineTransform v38 = v37;
    v44.origin.CGFloat x = v31;
    v44.origin.CGFloat y = v30;
    v44.size.double width = v21;
    v44.size.double height = v23;
    CGFloat MinX = CGRectGetMinX(v44);
    v45.origin.CGFloat x = v31;
    v45.origin.CGFloat y = v30;
    v45.size.double width = v21;
    v45.size.double height = v23;
    CGFloat v27 = CGRectGetMinY(v45);
    CGAffineTransformMakeTranslation(&v34, MinX, v27);
    CGAffineTransform t1 = v38;
    CGAffineTransformConcat(&v37, &t1, &v34);
    CGAffineTransform v38 = v37;
    CGAffineTransform t1 = v37;
    sub_10007FCC0(&t1, &v37, width * 0.5, v32 * 0.5);
    CGAffineTransform v38 = v37;
    long long v28 = *(_OWORD *)&a3->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&a3->a;
    *(_OWORD *)&t1.c = v28;
    *(_OWORD *)&t1.tCGFloat x = *(_OWORD *)&a3->tx;
    CGAffineTransform v33 = v37;
    CGAffineTransformConcat(&v37, &t1, &v33);
    long long v29 = *(_OWORD *)&v37.c;
    *(_OWORD *)&a3->a = *(_OWORD *)&v37.a;
    *(_OWORD *)&a3->c = v29;
    *(_OWORD *)&a3->tCGFloat x = *(_OWORD *)&v37.tx;
  }
}

- (void)antiAliasDefeatLayerFrame:(CGRect *)a3 forTransform:(CGAffineTransform *)a4
{
  long long v7 = *(_OWORD *)&a4->c;
  *(_OWORD *)&v26.a = *(_OWORD *)&a4->a;
  *(_OWORD *)&v26.c = v7;
  *(_OWORD *)&v26.tdouble x = *(_OWORD *)&a4->tx;
  if (sub_10007F8A0(&v26.a, a3->size.width, a3->size.height))
  {
    CGFloat v8 = a3->size.width * -0.5;
    CGFloat v9 = a3->size.height * -0.5;
    long long v10 = *(_OWORD *)&a4->c;
    *(_OWORD *)&v25.a = *(_OWORD *)&a4->a;
    *(_OWORD *)&v25.c = v10;
    *(_OWORD *)&v25.tdouble x = *(_OWORD *)&a4->tx;
    memset(&v26, 0, sizeof(v26));
    sub_10007FCC0(&v25, &v26, v8, v9);
    CGRect v27 = *a3;
    CGAffineTransform v25 = v26;
    CGRect v28 = CGRectApplyAffineTransform(v27, &v25);
    double x = v28.origin.x;
    CGFloat y = v28.origin.y;
    CGFloat width = v28.size.width;
    CGFloat height = v28.size.height;
    double v15 = [(CRLCanvasRep *)self canvas];
    [v15 contentsScale];
    double v17 = sub_100067584(x, y, width, height, v16);
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    CGFloat v23 = v22;

    CGAffineTransform v25 = v26;
    CGAffineTransformInvert(&v24, &v25);
    v29.origin.double x = v17;
    v29.origin.CGFloat y = v19;
    v29.size.CGFloat width = v21;
    v29.size.CGFloat height = v23;
    *a3 = CGRectApplyAffineTransform(v29, &v24);
  }
}

- (void)computeDirectLayerFrame:(CGRect *)a3 andTransform:(CGAffineTransform *)a4 basedOnTransform:(CGAffineTransform *)a5 andSize:(CGSize)a6
{
  p_mCanvas = &self->mCanvas;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mCanvas);
  [WeakRetained convertUnscaledToBoundsRect:sub_100064070()];
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  double v17 = v16;
  double v19 = v18;

  uint64_t v20 = objc_opt_class();
  CGFloat v21 = [(CRLCanvasRep *)self layout];
  double v22 = [v21 parent];
  CGFloat v23 = sub_1002469D0(v20, v22);

  if (v23)
  {
    memset(&v45, 0, sizeof(v45));
    if ([(CRLCanvasRep *)self isBeingRotated]
      && ([(CRLCanvasRep *)self layout],
          CGAffineTransform v24 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v25 = [v24 wantsNormalLayoutDuringDynamicRotation],
          v24,
          (v25 & 1) == 0))
    {
      [v23 originalTransformInRoot];
    }
    else
    {
      [v23 transformInRoot];
    }
    long long v26 = *(_OWORD *)&a5->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&a5->a;
    *(_OWORD *)&t1.c = v26;
    *(_OWORD *)&t1.tdouble x = *(_OWORD *)&a5->tx;
    CGAffineTransform t2 = v45;
    CGAffineTransformConcat(&v44, &t1, &t2);
    long long v27 = *(_OWORD *)&v44.c;
    *(_OWORD *)&a5->a = *(_OWORD *)&v44.a;
    *(_OWORD *)&a5->c = v27;
    *(_OWORD *)&a5->tdouble x = *(_OWORD *)&v44.tx;
  }
  id v28 = objc_loadWeakRetained((id *)p_mCanvas);
  [v28 viewScale];
  double v41 = v29;

  long long v30 = *(_OWORD *)&a5->c;
  *(float64x2_t *)&a5->tdouble x = vmulq_n_f64(*(float64x2_t *)&a5->tx, v41);
  *(_OWORD *)&v44.a = *(_OWORD *)&a5->a;
  *(_OWORD *)&v44.c = v30;
  *(_OWORD *)&v44.tdouble x = *(_OWORD *)&a5->tx;
  sub_10007FCC0(&v44, &v45, v17 * 0.5, v19 * 0.5);
  long long v31 = *(_OWORD *)&v45.c;
  *(_OWORD *)&a5->a = *(_OWORD *)&v45.a;
  *(_OWORD *)&a5->c = v31;
  *(_OWORD *)&a5->tdouble x = *(_OWORD *)&v45.tx;
  double v32 = [(CRLCanvasRep *)self parentRep];

  if (v32)
  {
    CGAffineTransform v33 = [(CRLCanvasRep *)self parentRep];
    [v33 layerFrameInScaledCanvas];
    double v35 = v34;
    double v37 = v36;

    CGFloat v38 = a5->ty - v37;
    a5->tdouble x = a5->tx - v35;
    a5->tCGFloat y = v38;
  }
  if (a3)
  {
    a3->origin.double x = v13;
    a3->origin.CGFloat y = v15;
    a3->size.CGFloat width = v17;
    a3->size.CGFloat height = v19;
  }
  if (a4)
  {
    long long v39 = *(_OWORD *)&a5->a;
    long long v40 = *(_OWORD *)&a5->tx;
    *(_OWORD *)&a4->c = *(_OWORD *)&a5->c;
    *(_OWORD *)&a4->tdouble x = v40;
    *(_OWORD *)&a4->a = v39;
  }
}

- (void)computeDirectLayerFrame:(CGRect *)a3 andTransform:(CGAffineTransform *)a4
{
  long long v7 = [(CRLCanvasRep *)self layout];
  CGFloat v8 = [v7 geometry];
  CGFloat v9 = v8;
  if (v8)
  {
    [v8 transform];
  }
  else
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v12 = 0u;
  }
  long long v10 = [(CRLCanvasRep *)self layout];
  long long v11 = [v10 geometry];
  [v11 size];
  -[CRLCanvasRep computeDirectLayerFrame:andTransform:basedOnTransform:andSize:](self, "computeDirectLayerFrame:andTransform:basedOnTransform:andSize:", a3, a4, &v12);
}

- (void)computeDirectLayerFrame:(CGRect *)a3 andTransform:(CGAffineTransform *)a4 basedOnLayoutGeometry:(id)a5
{
  id v8 = a5;
  CGFloat v9 = v8;
  if (v8)
  {
    [v8 transform];
  }
  else
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v10 = 0u;
  }
  [v9 size:v10, v11, v12];
  -[CRLCanvasRep computeDirectLayerFrame:andTransform:basedOnTransform:andSize:](self, "computeDirectLayerFrame:andTransform:basedOnTransform:andSize:", a3, a4, &v10);
}

- (void)processChanges:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableOrderedSet);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      long long v10 = 0;
      do
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = [*(id *)(*((void *)&v23 + 1) + 8 * (void)v10) details];
        long long v12 = v11;
        if (v11)
        {
          v22[0] = _NSConcreteStackBlock;
          v22[1] = 3221225472;
          v22[2] = sub_10025DC0C;
          v22[3] = &unk_1014E5A58;
          v22[4] = v5;
          [v11 enumeratePropertiesUsingBlock:v22];
        }

        long long v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v8);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v13 = v5;
  id v14 = [v13 countByEnumeratingWithState:&v18 objects:v27 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v19;
    do
    {
      double v17 = 0;
      do
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v13);
        }
        -[CRLCanvasRep processChangedProperty:](self, "processChangedProperty:", [*(id *)(*((void *)&v18 + 1) + 8 * (void)v17) unsignedIntegerValue]);
        double v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      id v15 = [v13 countByEnumeratingWithState:&v18 objects:v27 count:16];
    }
    while (v15);
  }
}

- (void)setNeedsDisplay
{
  id v4 = [(CRLCanvasRep *)self canvas];
  char v3 = [v4 canvasController];
  [v3 i_repNeedsDisplay:self];
}

- (void)setNeedsDisplayInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (!CGRectIsNull(a3))
  {
    v11.origin.double x = x;
    v11.origin.double y = y;
    v11.size.double width = width;
    v11.size.double height = height;
    if (!CGRectIsEmpty(v11))
    {
      id v9 = [(CRLCanvasRep *)self canvas];
      id v8 = [v9 canvasController];
      [v8 i_repNeedsDisplay:self x:x y:y width:width height:height];
    }
  }
}

- (void)p_invalidateContentLayers
{
  id v3 = [(CRLCanvasRep *)self canvas];
  [v3 invalidateContentLayersForRep:self];
}

- (void)screenScaleDidChange
{
  [(CRLCanvasRep *)self setNeedsDisplay];
  [(CRLCanvasRep *)self invalidateKnobs];

  [(CRLCanvasRep *)self i_invalidateSelectionHighlightRenderable];
}

- (void)viewScaleDidChange
{
  BOOL mShadowRenderableInvalid = self->mShadowRenderableInvalid;
  [(CRLCanvasRep *)self setNeedsDisplay];
  [(CRLCanvasRep *)self invalidateKnobs];
  [(CRLCanvasRep *)self i_invalidateSelectionHighlightRenderable];
  self->BOOL mShadowRenderableInvalid = mShadowRenderableInvalid;
}

- (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (id)colorBehindLayer:(id)a3
{
  return 0;
}

- (void)setupForDrawingInLayer:(id)a3 context:(CGContext *)a4
{
  id v6 = a3;
  [(CRLCanvasRep *)self layerFrameInScaledCanvas];
  CGContextTranslateCTM(a4, -v7, -v8);
  id WeakRetained = objc_loadWeakRetained((id *)&self->mCanvas);
  [WeakRetained viewScale];
  CGFloat v11 = v10;

  CGContextScaleCTM(a4, v11, v11);
  if ([(CRLCanvasRep *)self isBeingRotated]
    && ([(CRLCanvasRep *)self layout],
        long long v12 = objc_claimAutoreleasedReturnValue(),
        unsigned int v13 = [v12 wantsNormalLayoutDuringDynamicRotation],
        v12,
        !v13))
  {
    double v17 = [(CRLCanvasRep *)self layout];
    id v15 = v17;
    if (v17)
    {
      uint64_t v16 = (CGAffineTransform *)&v28;
      [v17 originalTransformInRoot];
    }
    else
    {
      long long v29 = 0u;
      long long v30 = 0u;
      long long v28 = 0u;
      uint64_t v16 = (CGAffineTransform *)&v28;
    }
  }
  else
  {
    id v14 = [(CRLCanvasRep *)self layout];
    id v15 = v14;
    if (v14)
    {
      uint64_t v16 = (CGAffineTransform *)&v31;
      [v14 transformInRoot];
    }
    else
    {
      long long v32 = 0u;
      long long v33 = 0u;
      long long v31 = 0u;
      uint64_t v16 = (CGAffineTransform *)&v31;
    }
  }
  CGContextConcatCTM(a4, v16);

  if (v6)
  {
    if ([v6 contentsAreFlipped])
    {
      long long v18 = +[NSThread currentThread];
      long long v19 = [v18 threadDictionary];
      long long v20 = +[NSNumber numberWithBool:1];
      long long v21 = +[NSValue valueWithPointer:self];
      [v19 setObject:v20 forKey:v21];
    }
    -[CRLCanvasRep i_configureFontSmoothingForContext:layer:](self, "i_configureFontSmoothingForContext:layer:", a4, v6, v28, v29, v30, v31, v32, v33);
  }
  double v22 = [(CRLCanvasRep *)self canvas];
  unsigned __int8 v23 = [v22 allowsFontSubpixelQuantization];

  if ((v23 & 1) == 0)
  {
    CGContextSetAllowsFontSubpixelQuantization(a4, 0);
    CGContextSetShouldSubpixelQuantizeFonts(a4, 0);
  }
  long long v24 = [(CRLCanvasRep *)self canvas];
  [v24 contentsScale];
  double v26 = v25;
  long long v27 = [(CRLCanvasRep *)self canvas];
  sub_1004559A4((uint64_t)a4, 0, 0, v6 != 0, (uint64_t)[v27 shouldSuppressBackgrounds], v26);
}

- (void)didDrawInLayer:(id)a3 context:(CGContext *)a4
{
  sub_1004552DC((uint64_t)a4);
  id v7 = +[NSThread currentThread];
  id v5 = [v7 threadDictionary];
  id v6 = +[NSValue valueWithPointer:self];
  [v5 removeObjectForKey:v6];
}

- (BOOL)isDrawingInFlippedContext
{
  id v3 = +[NSThread currentThread];
  id v4 = [v3 threadDictionary];
  id v5 = +[NSValue valueWithPointer:self];
  id v6 = [v4 objectForKey:v5];

  if (v6) {
    unsigned __int8 v7 = [v6 BOOLValue];
  }
  else {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (CGRect)i_clipRectRecursive
{
  [(CRLCanvasRep *)self clipRect];
  CGFloat x = v57.origin.x;
  CGFloat y = v57.origin.y;
  CGFloat width = v57.size.width;
  CGFloat height = v57.size.height;
  unsigned __int8 v7 = (os_log_t *)&off_10166B4A0;
  if (CGRectIsNull(v57))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E5A78);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109159C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E5A98);
    }
    double v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v8);
    }
    id v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasRep i_clipRectRecursive]");
    double v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRep.m"];
    +[CRLAssertionHandler handleFailureInFunction:v9 file:v10 lineNumber:1670 isFatal:0 description:"This rep's clipRect should not be null."];
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = [(CRLCanvasRep *)self childReps];
  id v11 = [obj countByEnumeratingWithState:&v42 objects:v56 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v43;
    do
    {
      id v14 = 0;
      do
      {
        if (*(void *)v43 != v13) {
          objc_enumerationMutation(obj);
        }
        id v15 = *(void **)(*((void *)&v42 + 1) + 8 * (void)v14);
        uint64_t v16 = [v15 layout];
        if (!v16)
        {
          unsigned int v17 = +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014E5AB8);
          }
          long long v18 = v7;
          long long v19 = *v7;
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67110146;
            unsigned int v47 = v17;
            __int16 v48 = 2082;
            double v49 = "-[CRLCanvasRep i_clipRectRecursive]";
            __int16 v50 = 2082;
            v51 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRep.m";
            __int16 v52 = 1024;
            int v53 = 1674;
            __int16 v54 = 2082;
            v55 = "currentChildLayout";
            _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", buf, 0x2Cu);
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014E5AD8);
          }
          os_log_t v20 = *v18;
          if (os_log_type_enabled(*v18, OS_LOG_TYPE_ERROR))
          {
            double v34 = v20;
            double v35 = +[CRLAssertionHandler packedBacktraceString];
            *(_DWORD *)buf = 67109378;
            unsigned int v47 = v17;
            __int16 v48 = 2114;
            double v49 = v35;
            _os_log_error_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
          }
          long long v21 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasRep i_clipRectRecursive]");
          double v22 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRep.m"];
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v21, v22, 1674, 0, "invalid nil value for '%{public}s'", "currentChildLayout");

          unsigned __int8 v7 = v18;
        }
        [v15 i_clipRectRecursive];
        CGFloat v23 = v58.origin.x;
        CGFloat v24 = v58.origin.y;
        CGFloat v25 = v58.size.width;
        CGFloat v26 = v58.size.height;
        if (CGRectIsNull(v58))
        {
          unsigned int v27 = +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014E5AF8);
          }
          long long v28 = *v7;
          if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109890;
            unsigned int v47 = v27;
            __int16 v48 = 2082;
            double v49 = "-[CRLCanvasRep i_clipRectRecursive]";
            __int16 v50 = 2082;
            v51 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRep.m";
            __int16 v52 = 1024;
            int v53 = 1678;
            _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d The child's i_clipRectRecursive should not be null.", buf, 0x22u);
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014E5B18);
          }
          os_log_t v29 = *v7;
          if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
          {
            long long v32 = v29;
            long long v33 = +[CRLAssertionHandler packedBacktraceString];
            *(_DWORD *)buf = 67109378;
            unsigned int v47 = v27;
            __int16 v48 = 2114;
            double v49 = v33;
            _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
          }
          long long v30 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasRep i_clipRectRecursive]");
          long long v31 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRep.m"];
          +[CRLAssertionHandler handleFailureInFunction:v30 file:v31 lineNumber:1678 isFatal:0 description:"The child's i_clipRectRecursive should not be null."];
        }
        if (v16) {
          [v16 transform];
        }
        else {
          memset(&v41, 0, sizeof(v41));
        }
        v59.origin.CGFloat x = v23;
        v59.origin.CGFloat y = v24;
        v59.size.CGFloat width = v25;
        v59.size.CGFloat height = v26;
        CGRect v63 = CGRectApplyAffineTransform(v59, &v41);
        v60.origin.CGFloat x = x;
        v60.origin.CGFloat y = y;
        v60.size.CGFloat width = width;
        v60.size.CGFloat height = height;
        CGRect v61 = CGRectUnion(v60, v63);
        CGFloat x = v61.origin.x;
        CGFloat y = v61.origin.y;
        CGFloat width = v61.size.width;
        CGFloat height = v61.size.height;

        id v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [obj countByEnumeratingWithState:&v42 objects:v56 count:16];
    }
    while (v12);
  }

  double v36 = x;
  double v37 = y;
  double v38 = width;
  double v39 = height;
  result.size.CGFloat height = v39;
  result.size.CGFloat width = v38;
  result.origin.CGFloat y = v37;
  result.origin.CGFloat x = v36;
  return result;
}

- (void)recursivelyDrawInContext:(CGContext *)a3 keepingChildrenPassingTest:(id)a4
{
  id v6 = a4;
  unsigned __int8 v7 = sub_100457AE4((uint64_t)a3);
  [v7 beginObject:self];
  double v8 = [(CRLCanvasRep *)self layout];
  id v9 = [v8 geometry];
  double v10 = v9;
  if (v9) {
    [v9 transform];
  }
  else {
    memset(&v21, 0, sizeof(v21));
  }
  CGContextConcatCTM(a3, &v21);

  [(CRLCanvasRep *)self clipRect];
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  unsigned int v19 = [(CRLCanvasRep *)self masksToBounds];
  char v20 = v19;
  if (v19)
  {
    v22.origin.CGFloat x = v12;
    v22.origin.CGFloat y = v14;
    v22.size.CGFloat width = v16;
    v22.size.CGFloat height = v18;
    CGContextClipToRect(a3, v22);
  }
  ClipBoundingBoCGFloat x = CGContextGetClipBoundingBox(a3);
  v23.origin.CGFloat x = v12;
  v23.origin.CGFloat y = v14;
  v23.size.CGFloat width = v16;
  v23.size.CGFloat height = v18;
  if (CGRectIntersectsRect(v23, ClipBoundingBox))
  {
    CGContextSaveGState(a3);
    if ((v20 & 1) == 0)
    {
      v24.origin.CGFloat x = v12;
      v24.origin.CGFloat y = v14;
      v24.size.CGFloat width = v16;
      v24.size.CGFloat height = v18;
      CGContextClipToRect(a3, v24);
    }
    -[CRLCanvasRep drawInContext:](self, "drawInContext:", a3, *(_OWORD *)&v21.a, *(_OWORD *)&v21.c, *(_OWORD *)&v21.tx);
    CGContextRestoreGState(a3);
  }
  -[CRLCanvasRep recursivelyDrawChildrenInContext:keepingChildrenPassingTest:](self, "recursivelyDrawChildrenInContext:keepingChildrenPassingTest:", a3, v6, *(_OWORD *)&v21.a, *(_OWORD *)&v21.c, *(_OWORD *)&v21.tx);
  [v7 endObject:self];
}

- (void)recursivelyDrawChildrenInContext:(CGContext *)a3 keepingChildrenPassingTest:(id)a4
{
  id v6 = (unsigned int (**)(id, void))a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  unsigned __int8 v7 = [(CRLCanvasRep *)self childReps];
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
        CGFloat v12 = *(void **)(*((void *)&v13 + 1) + 8 * (void)v11);
        if (!v6 || v6[2](v6, *(void *)(*((void *)&v13 + 1) + 8 * (void)v11)))
        {
          CGContextSaveGState(a3);
          [v12 recursivelyDrawInContext:a3 keepingChildrenPassingTest:v6];
          CGContextRestoreGState(a3);
        }
        double v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (BOOL)isSelectedIgnoringLocking
{
  id v3 = [(CRLCanvasRep *)self layout];
  if (([v3 isSelectable] & 1) == 0)
  {

    return 0;
  }
  id v4 = [(CRLCanvasRep *)self canvas];
  unsigned int v5 = [v4 isCanvasInteractive];

  if (!v5) {
    return 0;
  }
  id v6 = [(CRLCanvasRep *)self interactiveCanvasController];
  if (!v6)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E5B38);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101091624();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E5B58);
    }
    unsigned __int8 v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v7);
    }
    id v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasRep isSelectedIgnoringLocking]");
    id v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRep.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 1748, 0, "invalid nil value for '%{public}s'", "interactiveCanvasController");
  }
  uint64_t v10 = [(CRLCanvasRep *)self info];
  unsigned __int8 v11 = [v6 currentSelectionPathContainsInfo:v10];

  return v11;
}

- (BOOL)isSelected
{
  BOOL v3 = [(CRLCanvasRep *)self isSelectedIgnoringLocking];
  if (v3) {
    LOBYTE(v3) = ![(CRLCanvasRep *)self isLocked];
  }
  return v3;
}

- (void)becameSelected
{
  [(CRLCanvasRep *)self invalidateKnobs];
  BOOL v3 = [(CRLCanvasRep *)self info];
  uint64_t v4 = objc_opt_class();
  unsigned int v5 = [v3 parentInfo];
  id v6 = sub_1002469D0(v4, v5);

  for (BOOL i = v6 == 0; v3 && !v6; BOOL i = v6 == 0)
  {
    id v8 = v3;
    BOOL v3 = [v3 parentInfo];

    uint64_t v9 = objc_opt_class();
    uint64_t v10 = [v3 parentInfo];
    id v6 = sub_1002469D0(v9, v10);
  }
  if (!i)
  {
    unsigned __int8 v11 = [(CRLCanvasRep *)self interactiveCanvasController];
    CGFloat v12 = [v11 editorController];
    long long v13 = [v12 selectionPath];
    long long v14 = [v13 mostSpecificSelectionOfClass:objc_opt_class()];

    if (!v14)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E5B78);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010916B8();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E5B98);
      }
      long long v15 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v15);
      }
      long long v16 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasRep becameSelected]");
      double v17 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRep.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 1778, 0, "If something in a group has been selected, there should  be a group selection.");
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->mCanvas);
  [WeakRetained canvasInvalidatedForRep:self];
}

- (void)becameNotSelected
{
  [(CRLCanvasRep *)self invalidateKnobs];
  [(CRLCanvasRep *)self i_invalidateSelectionHighlightRenderable];
  self->mSelectionHighlightRenderableValid = 0;
  mSelectionHighlightRenderable = self->mSelectionHighlightRenderable;
  self->mSelectionHighlightRenderable = 0;

  id WeakRetained = objc_loadWeakRetained((id *)&self->mCanvas);
  [WeakRetained canvasInvalidatedForRep:self];
}

- (void)becameSelectable
{
  [(CRLCanvasRep *)self invalidateKnobs];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  BOOL v3 = [(CRLCanvasRep *)self childRepsToInformForSelectabilityChanges];
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      unsigned __int8 v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) becameSelectable];
        unsigned __int8 v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)becameNotSelectable
{
  [(CRLCanvasRep *)self invalidateKnobs];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  BOOL v3 = [(CRLCanvasRep *)self childRepsToInformForSelectabilityChanges];
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      unsigned __int8 v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) becameNotSelectable];
        unsigned __int8 v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (NSSet)childRepsToInformForSelectabilityChanges
{
  BOOL v2 = [(CRLCanvasRep *)self childReps];
  BOOL v3 = +[NSSet setWithArray:v2];

  return (NSSet *)v3;
}

- (BOOL)shouldAddCollaboratorLayerToOverlays
{
  return 1;
}

- (BOOL)shouldShowCollaboratorCursorHighlight
{
  BOOL v3 = [(CRLCanvasRep *)self interactiveCanvasController];
  id v4 = [(CRLCanvasRep *)self layout];
  unsigned __int8 v5 = [v3 i_shouldShowCollaboratorCursorForLayout:v4];

  return v5;
}

- (id)p_currentCollaboratorPresence
{
  BOOL v3 = [(CRLCanvasRep *)self interactiveCanvasController];
  id v4 = [(CRLCanvasRep *)self layout];
  unsigned __int8 v5 = [v3 i_collaboratorPresenceSelectingLayout:v4];

  return v5;
}

- (CRLColor)currentCollaboratorCursorColor
{
  BOOL v2 = [(CRLCanvasRep *)self p_currentCollaboratorPresence];
  BOOL v3 = [v2 owner];
  id v4 = [v3 collaboratorColorForType:2];

  return (CRLColor *)v4;
}

- (void)collaboratorCursorChangedToSelectionPath:(id)a3
{
  id v4 = a3;
  if (qword_101719BE8 != -1) {
    dispatch_once(&qword_101719BE8, &stru_1014E5BB8);
  }
  unsigned __int8 v5 = off_10166B618;
  if (os_log_type_enabled((os_log_t)off_10166B618, OS_LOG_TYPE_INFO))
  {
    int v6 = 138543362;
    unsigned __int8 v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Collaborator Cursor: Selection Path Changed called for rep: %{public}@", (uint8_t *)&v6, 0xCu);
  }
  [(CRLCanvasRep *)self invalidateKnobs];
  [(CRLCanvasRep *)self invalidateCollaboratorCursorRenderable];
}

- (void)hideCollaboratorCursors
{
  if (qword_101719BE8 != -1) {
    dispatch_once(&qword_101719BE8, &stru_1014E5BD8);
  }
  BOOL v3 = off_10166B618;
  if (os_log_type_enabled((os_log_t)off_10166B618, OS_LOG_TYPE_INFO))
  {
    int v4 = 138543362;
    unsigned __int8 v5 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Collaborator Cursor: Hiding collaborator cursors for rep: %{public}@", (uint8_t *)&v4, 0xCu);
  }
  [(CRLCanvasRep *)self invalidateKnobs];
  [(CRLCanvasRep *)self invalidateCollaboratorCursorRenderable];
}

- (CGAffineTransform)transformForCollaboratorCursorRenderable
{
  p_mKnobTracker = &self->mKnobTracker;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mKnobTracker);
  if (WeakRetained)
  {
    id v6 = objc_loadWeakRetained((id *)p_mKnobTracker);
    unsigned __int8 v7 = v6;
    if (v6)
    {
      [v6 transformInRootForStandardKnobs];
      goto LABEL_7;
    }
  }
  else
  {
    long long v8 = [(CRLCanvasRep *)self layout];
    unsigned __int8 v7 = v8;
    if (v8)
    {
      [v8 transformInRoot];
      goto LABEL_7;
    }
  }
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tCGFloat x = 0u;
  *(_OWORD *)&retstr->a = 0u;
LABEL_7:

  return result;
}

- (void)invalidateCollaboratorCursorRenderable
{
  self->mCollaboratorCursorRenderableValid = 0;
  id v4 = [(CRLCanvasRep *)self canvas];
  BOOL v3 = [v4 canvasController];
  [v3 invalidateOverlayLayersForRep:self];
}

- (BOOL)isDragAndDropHighlightLayerValid
{
  return self->mDragAndDropHighlightRenderable != 0;
}

- (void)invalidateDragAndDropHighlightLayer
{
  mDragAndDropHighlightRenderable = self->mDragAndDropHighlightRenderable;
  self->mDragAndDropHighlightRenderable = 0;
}

- (CRLCanvasRenderable)collaboratorCursorRenderable
{
  if (qword_101719BE8 != -1) {
    dispatch_once(&qword_101719BE8, &stru_1014E5BF8);
  }
  BOOL v3 = off_10166B618;
  if (os_log_type_enabled((os_log_t)off_10166B618, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf.a) = 138543362;
    *(void *)((char *)&buf.a + 4) = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Collaborator Cursor: Requesting collaborator cursor renderable for base rep: %{public}@", (uint8_t *)&buf, 0xCu);
  }
  if (!self->mCollaboratorCursorRenderable)
  {
    id v4 = +[CRLCanvasRenderable renderable];
    mCollaboratorCursorRenderable = self->mCollaboratorCursorRenderable;
    self->mCollaboratorCursorRenderable = v4;

    uint64_t v6 = 4;
    do
    {
      unsigned __int8 v7 = +[CRLCanvasShapeRenderable renderable];
      [v7 setFillColor:0];
      [(CRLCanvasRenderable *)self->mCollaboratorCursorRenderable addSubrenderable:v7];

      --v6;
    }
    while (v6);
    if (!self->mCollaboratorCursorRenderable) {
      goto LABEL_10;
    }
  }
  if (!self->mCollaboratorCursorRenderableValid)
  {
    if (qword_101719BE8 != -1) {
      dispatch_once(&qword_101719BE8, &stru_1014E5C18);
    }
    long long v9 = off_10166B618;
    if (os_log_type_enabled((os_log_t)off_10166B618, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf.a) = 138543362;
      *(void *)((char *)&buf.a + 4) = self;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Collaborator Cursor: Actually re-generating renderable for base rep: %{public}@", (uint8_t *)&buf, 0xCu);
    }
    long long v10 = [(CRLCanvasRenderable *)self->mCollaboratorCursorRenderable subrenderables];
    if ([v10 count] != (id)4)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E5C38);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101091740();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E5C58);
      }
      long long v11 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v11);
      }
      CGFloat v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasRep collaboratorCursorRenderable]");
      long long v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRep.m"];
      +[CRLAssertionHandler handleFailureInFunction:v12 file:v13 lineNumber:1924 isFatal:0 description:"Expect four collaborator sublayers"];
    }
    if ([v10 count] == (id)4)
    {
      long long v14 = (objc_class *)objc_opt_class();
      long long v15 = [v10 objectAtIndexedSubscript:0];
      long long v16 = sub_10024715C(v14, v15);

      id WeakRetained = objc_loadWeakRetained((id *)&self->mCanvas);
      [WeakRetained viewScale];
      double v19 = v18;

      double v20 = 10.0 / v19;
      [(CRLCanvasRep *)self boundsForCollaboratorCursorRenderable];
      double v22 = v21;
      double v24 = v23;
      double v26 = v25;
      double v28 = v27;
      os_log_t v29 = [(CRLCanvasRep *)self interactiveCanvasController];
      [v29 convertUnscaledToBoundsRect:v22, v24, v26, v28];
      CGFloat v31 = v30;
      CGFloat v33 = v32;
      double v35 = v34;
      double v37 = v36;

      double v38 = fabs(v35);
      double v39 = (30.0 - v38) * 0.5;
      BOOL v40 = v38 < 30.0;
      double v41 = 0.0;
      if (!v40) {
        double v39 = 0.0;
      }
      double v42 = fabs(v37);
      if (v42 < 30.0) {
        double v41 = (30.0 - v42) * 0.5;
      }
      double v43 = 4.0 * 0.5 + 2.0;
      CGFloat v44 = -(v43 + v39);
      CGFloat v45 = -(v43 + v41);
      v110.origin.double x = v31;
      v110.origin.double y = v33;
      v110.size.double width = v35;
      v110.size.double height = v37;
      CGRect v111 = CGRectInset(v110, v44, v45);
      double x = v111.origin.x;
      double y = v111.origin.y;
      double width = v111.size.width;
      double height = v111.size.height;
      __int16 v50 = [(CRLCanvasRep *)self interactiveCanvasController];
      [v50 convertBoundsToUnscaledRect:x, y, width, height];
      double v52 = v51;
      double v54 = v53;
      double v56 = v55;
      double v58 = v57;

      memset(&v104, 0, sizeof(v104));
      [(CRLCanvasRep *)self transformForCollaboratorCursorRenderable];
      CGAffineTransformMakeScale(&t2, v19, v19);
      CGAffineTransform t1 = v104;
      CGAffineTransformConcat(&buf, &t1, &t2);
      CGAffineTransform v104 = buf;
      v112.origin.double x = v52;
      v112.origin.double y = v54;
      v112.size.double width = v56;
      v112.size.double height = v58;
      buf.a = CGRectGetMinX(v112);
      v113.origin.double x = v52;
      v113.origin.double y = v54;
      v113.size.double width = v56;
      v113.size.double height = v58;
      buf.b = CGRectGetMinY(v113);
      v114.origin.double x = v52;
      v114.origin.double y = v54;
      v114.size.double width = v56;
      v114.size.double height = v58;
      buf.c = CGRectGetMaxX(v114);
      v115.origin.double x = v52;
      v115.origin.double y = v54;
      v115.size.double width = v56;
      v115.size.double height = v58;
      buf.d = CGRectGetMinY(v115);
      v116.origin.double x = v52;
      v116.origin.double y = v54;
      v116.size.double width = v56;
      v116.size.double height = v58;
      buf.tdouble x = CGRectGetMaxX(v116);
      v117.origin.double x = v52;
      v117.origin.double y = v54;
      v117.size.double width = v56;
      v117.size.double height = v58;
      buf.tdouble y = CGRectGetMaxY(v117);
      v118.origin.double x = v52;
      v118.origin.double y = v54;
      v118.size.double width = v56;
      v118.size.double height = v58;
      double MinX = CGRectGetMinX(v118);
      v119.origin.double x = v52;
      v119.origin.double y = v54;
      v119.size.double width = v56;
      v119.size.double height = v58;
      double MaxY = CGRectGetMaxY(v119);
      CGRect v59 = [(CRLCanvasRep *)self canvas];
      [v59 contentsScale];
      sub_1000D5584(&v104.a, (uint64_t)&buf, 4, v52, v54, v56, v58, 4.0, v60);

      CGRect v61 = [(CRLCanvasRep *)self currentCollaboratorCursorColor];
      id v62 = [v61 CGColor];

      +[CATransaction begin];
      +[CATransaction setDisableActions:1];
      CGAffineTransform t1 = v104;
      CGAffineTransformInvert(&v101, &t1);
      CGFloat v63 = v101.tx + buf.b * v101.c + v101.a * buf.a;
      CGFloat v64 = v101.ty + buf.b * v101.d + v101.b * buf.a;
      Mutable = CGPathCreateMutable();
      CGPathMoveToPoint(Mutable, 0, v63, v20 + v64);
      CGPathAddLineToPoint(Mutable, 0, v63, v64);
      CGPathAddLineToPoint(Mutable, 0, v20 + v63, v64);
      [v16 setPath:Mutable];
      CGPathRelease(Mutable);
      v66 = (objc_class *)objc_opt_class();
      v67 = [v10 objectAtIndexedSubscript:1];
      CGPoint v68 = sub_10024715C(v66, v67);

      CGAffineTransform t1 = v104;
      CGAffineTransformInvert(&v100, &t1);
      CGFloat v69 = v100.tx + buf.d * v100.c + v100.a * buf.c;
      CGFloat v70 = v100.ty + buf.d * v100.d + v100.b * buf.c;
      v71 = CGPathCreateMutable();
      CGPathMoveToPoint(v71, 0, v69, v20 + v70);
      CGPathAddLineToPoint(v71, 0, v69, v70);
      CGPathAddLineToPoint(v71, 0, v69 - v20, v70);
      [v68 setPath:v71];
      CGPathRelease(v71);

      v72 = (objc_class *)objc_opt_class();
      v73 = [v10 objectAtIndexedSubscript:2];
      v74 = sub_10024715C(v72, v73);

      CGAffineTransform t1 = v104;
      CGAffineTransformInvert(&v99, &t1);
      CGFloat v75 = v99.tx + buf.ty * v99.c + v99.a * buf.tx;
      CGFloat v76 = v99.ty + buf.ty * v99.d + v99.b * buf.tx;
      v77 = CGPathCreateMutable();
      CGPathMoveToPoint(v77, 0, v75, v76 - v20);
      CGPathAddLineToPoint(v77, 0, v75, v76);
      CGPathAddLineToPoint(v77, 0, v75 - v20, v76);
      [v74 setPath:v77];
      CGPathRelease(v77);

      v78 = (objc_class *)objc_opt_class();
      v79 = [v10 objectAtIndexedSubscript:3];
      v80 = sub_10024715C(v78, v79);

      CGAffineTransform t1 = v104;
      CGAffineTransformInvert(&v98, &t1);
      CGFloat v81 = v98.tx + MaxY * v98.c + v98.a * MinX;
      CGFloat v82 = v98.ty + MaxY * v98.d + v98.b * MinX;
      v83 = CGPathCreateMutable();
      CGPathMoveToPoint(v83, 0, v81, v82 - v20);
      CGPathAddLineToPoint(v83, 0, v81, v82);
      CGPathAddLineToPoint(v83, 0, v20 + v81, v82);
      [v80 setPath:v83];
      CGPathRelease(v83);

      long long v96 = 0u;
      long long v97 = 0u;
      long long v94 = 0u;
      long long v95 = 0u;
      id v84 = v10;
      id v85 = [v84 countByEnumeratingWithState:&v94 objects:v105 count:16];
      if (v85)
      {
        id v86 = v85;
        uint64_t v87 = *(void *)v95;
        double v88 = 4.0 / v19;
        do
        {
          for (BOOL i = 0; i != v86; BOOL i = (char *)i + 1)
          {
            if (*(void *)v95 != v87) {
              objc_enumerationMutation(v84);
            }
            v90 = *(void **)(*((void *)&v94 + 1) + 8 * i);
            [v90 setStrokeColor:v62];
            [v90 setLineWidth:v88];
            CGAffineTransform v93 = v104;
            [v90 setAffineTransform:&v93];
          }
          id v86 = [v84 countByEnumeratingWithState:&v94 objects:v105 count:16];
        }
        while (v86);
      }

      +[CATransaction commit];
      self->mCollaboratorCursorRenderableValid = 1;
    }
  }
  else
  {
LABEL_10:
    if (qword_101719BE8 != -1) {
      dispatch_once(&qword_101719BE8, &stru_1014E5C78);
    }
    long long v8 = off_10166B618;
    if (os_log_type_enabled((os_log_t)off_10166B618, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf.a) = 138543362;
      *(void *)((char *)&buf.a + 4) = self;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Collaborator Cursor: Not regenerating renderable, because it was considered already valid for base rep: %{public}@", (uint8_t *)&buf, 0xCu);
    }
  }
  v91 = self->mCollaboratorCursorRenderable;

  return v91;
}

- (CGRect)boundsForStandardKnobs
{
  BOOL v2 = [(CRLCanvasRep *)self layout];
  [v2 boundsForStandardKnobs];
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

- (NSArray)knobs
{
  if ([(CRLCanvasRep *)self hasBeenRemoved])
  {
    id v3 = &__NSArray0__struct;
    goto LABEL_21;
  }
  uint64_t v54 = 0;
  double v55 = &v54;
  uint64_t v56 = 0x2020000000;
  char v57 = 0;
  mKnobsAccessQueue = self->mKnobsAccessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100260C30;
  block[3] = &unk_1014CB140;
  block[4] = self;
  void block[5] = &v54;
  dispatch_sync(mKnobsAccessQueue, block);
  if (*((unsigned char *)v55 + 24))
  {
    double v5 = +[NSMutableArray array];
    [(CRLCanvasRep *)self addKnobsToArray:v5];
    if ([v5 count]) {
      self->mKnobPositionsInvalid = 1;
    }
    double v6 = self->mKnobsAccessQueue;
    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472;
    v51[2] = sub_100260C74;
    v51[3] = &unk_1014CBE78;
    v51[4] = self;
    id v52 = v5;
    id v7 = v5;
    dispatch_sync(v6, v51);
  }
  uint64_t v47 = 0;
  __int16 v48 = &v47;
  uint64_t v49 = 0x2020000000;
  char v50 = 0;
  uint64_t v41 = 0;
  double v42 = &v41;
  uint64_t v43 = 0x3032000000;
  CGFloat v44 = sub_100260C80;
  CGFloat v45 = sub_100260C90;
  id v46 = 0;
  double v8 = self->mKnobsAccessQueue;
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_100260C98;
  v40[3] = &unk_1014E5CA0;
  v40[4] = self;
  v40[5] = &v47;
  v40[6] = &v41;
  dispatch_sync(v8, v40);
  if (*((unsigned char *)v48 + 24)) {
    [(CRLCanvasRep *)self updatePositionsOfKnobs:v42[5]];
  }
  self->mKnobPositionsInvalid = 0;
  uint64_t v34 = 0;
  double v35 = &v34;
  uint64_t v36 = 0x3032000000;
  double v37 = sub_100260C80;
  double v38 = sub_100260C90;
  id v39 = 0;
  double v9 = self->mKnobsAccessQueue;
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_100260D48;
  v33[3] = &unk_1014CB090;
  v33[4] = self;
  v33[5] = &v34;
  dispatch_sync(v9, v33);
  if ([(id)v35[5] count])
  {
    if ([(id)v35[5] count] != (id)1
      || (objc_msgSend((id)v35[5], "crl_anyObject"),
          double v10 = objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          char isKindOfClass = objc_opt_isKindOfClass(),
          v10,
          (isKindOfClass & 1) == 0))
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->mKnobTracker);
      if (WeakRetained)
      {
        double v13 = WeakRetained;
        id v14 = objc_loadWeakRetained((id *)&self->mKnobTracker);
        if ([v14 didBegin])
        {
          BOOL mShowKnobsWhenManipulated = self->mShowKnobsWhenManipulated;

          if (!mShowKnobsWhenManipulated)
          {
            id v16 = objc_loadWeakRetained((id *)&self->mKnobTracker);
            id v17 = [v16 enabledKnobMask];

            double v18 = (void *)v35[5];
            v32[0] = _NSConcreteStackBlock;
            v32[1] = 3221225472;
            v32[2] = sub_100260D5C;
            v32[3] = &unk_1014E5CC8;
            v32[4] = self;
            v32[5] = v17;
            uint64_t v19 = [v18 crl_arrayOfObjectsPassingTest:v32];
LABEL_19:
            double v21 = (void *)v35[5];
            v35[5] = v19;

            goto LABEL_20;
          }
        }
        else
        {
        }
      }
      if (![(CRLCanvasRep *)self shouldShowKnobs])
      {
        double v20 = (void *)v35[5];
        v31[0] = _NSConcreteStackBlock;
        v31[1] = 3221225472;
        v31[2] = sub_100260E64;
        v31[3] = &unk_1014E5CF0;
        v31[4] = self;
        uint64_t v19 = [v20 crl_arrayOfObjectsPassingTest:v31];
        goto LABEL_19;
      }
    }
  }
LABEL_20:
  uint64_t v25 = 0;
  double v26 = &v25;
  uint64_t v27 = 0x3032000000;
  double v28 = sub_100260C80;
  os_log_t v29 = sub_100260C90;
  id v30 = 0;
  double v22 = self->mKnobsAccessQueue;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100260E70;
  v24[3] = &unk_1014E5D18;
  v24[4] = self;
  v24[5] = &v34;
  v24[6] = &v25;
  dispatch_sync(v22, v24);
  id v3 = (id)v26[5];
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v41, 8);

  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v54, 8);
LABEL_21:

  return (NSArray *)v3;
}

- (void)invalidateKnobs
{
  mKnobsAccessQueue = self->mKnobsAccessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100260F8C;
  block[3] = &unk_1014CBBB0;
  block[4] = self;
  dispatch_sync(mKnobsAccessQueue, block);
  double v4 = [(CRLCanvasRep *)self interactiveCanvasController];
  [v4 invalidateOverlayLayersForRep:self];
}

- (unint64_t)enabledKnobMask
{
  id v3 = [(CRLCanvasRep *)self layout];
  unsigned int v4 = [v3 resizeMayChangeAspectRatio];

  if (v4) {
    uint64_t v5 = 990;
  }
  else {
    uint64_t v5 = 650;
  }
  [(CRLCanvasRep *)self trackingBoundsForStandardKnobs];
  double v7 = v6;
  double v9 = v8;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mCanvas);
  [WeakRetained viewScale];
  double v12 = sub_1000646A4(v7, v9, v11);
  double v14 = v13;

  long long v15 = [(CRLCanvasRep *)self layout];
  unsigned int v16 = [v15 resizeMayChangeAspectRatio];

  if (v16)
  {
    double width = CGSizeZero.width;
    double height = CGSizeZero.height;
  }
  else
  {
    uint64_t v19 = [(CRLCanvasRep *)self layout];
    [v19 minimumSize];
    double v21 = v20;
    double v23 = v22;

    double width = 1.0;
    if (v23 <= 1.0) {
      double height = v23;
    }
    else {
      double height = 1.0;
    }
    if (v21 <= 1.0) {
      double width = v21;
    }
  }
  unint64_t v24 = v5 & 0x2DA;
  if (v12 >= 50.0) {
    unint64_t v24 = v5;
  }
  if (v7 < width) {
    unint64_t result = v5 & 0x104;
  }
  else {
    unint64_t result = v24;
  }
  if (v9 >= height)
  {
    if (v14 >= 50.0) {
      return result;
    }
    uint64_t v26 = 910;
  }
  else
  {
    uint64_t v26 = 80;
  }
  result &= v26;
  return result;
}

- (void)addKnobsToArray:(id)a3
{
  id v5 = a3;
  unsigned int v4 = -[CRLCanvasKnob initWithType:position:radius:tag:onRep:]([CRLCanvasPlaceholderInvisibleKnob alloc], "initWithType:position:radius:tag:onRep:", 1, 0, self, CGPointZero.x, CGPointZero.y, 0.0);
  [v5 addObject:v4];
  if ([(CRLCanvasRep *)self shouldCreateSelectionKnobs])
  {
    [(CRLCanvasRep *)self addSelectionKnobsToArray:v5];
  }
  else if ([(CRLCanvasRep *)self shouldCreateLockedKnobs])
  {
    [(CRLCanvasRep *)self addLockedKnobsToArray:v5];
  }
}

- (id)newSelectionKnobForType:(unint64_t)a3 tag:(unint64_t)a4
{
  double v7 = [CRLCanvasKnob alloc];
  double y = CGPointZero.y;

  return -[CRLCanvasKnob initWithType:position:radius:tag:onRep:](v7, "initWithType:position:radius:tag:onRep:", a3, a4, self, CGPointZero.x, y, 15.0);
}

- (void)addSelectionKnobsToArray:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(CRLCanvasRep *)self enabledKnobMask];
  if (v5)
  {
    unint64_t v6 = v5;
    for (uint64_t i = 1; i != 10; ++i)
    {
      if ((sub_1002893CC(i) & v6) != 0)
      {
        id v8 = [(CRLCanvasRep *)self newSelectionKnobForType:0 tag:i];
        [v4 addObject:v8];
      }
    }
  }
  if ([(CRLCanvasRep *)self shouldCreateConnectionLineKnobs])
  {
    double v9 = [[_TtC8Freeform21CRLConnectionLineKnob alloc] initWithTag:2 onRep:self];
    v14[0] = v9;
    double v10 = [[_TtC8Freeform21CRLConnectionLineKnob alloc] initWithTag:8 onRep:self];
    v14[1] = v10;
    double v11 = [[_TtC8Freeform21CRLConnectionLineKnob alloc] initWithTag:6 onRep:self];
    v14[2] = v11;
    double v12 = [[_TtC8Freeform21CRLConnectionLineKnob alloc] initWithTag:4 onRep:self];
    v14[3] = v12;
    double v13 = +[NSArray arrayWithObjects:v14 count:4];
    [v4 addObjectsFromArray:v13];
  }
}

- (void)addLockedKnobsToArray:(id)a3
{
  id v4 = a3;
  unint64_t v5 = +[NSMutableArray array];
  [(CRLCanvasRep *)self addSelectionKnobsToArray:v5];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      double v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * (void)v10) setType:4 v11];
        double v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  [v4 addObjectsFromArray:v6];
}

- (NSSet)additionalRepsToResize
{
  return +[NSSet set];
}

- (BOOL)canUseSpecializedHitRegionForKnob:(id)a3
{
  return (unint64_t)[a3 tag] < 0xA;
}

- (CGRect)trackingBoundsForStandardKnobs
{
  p_mKnobTracker = &self->mKnobTracker;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mKnobTracker);

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)p_mKnobTracker);
    [v5 currentBoundsForStandardKnobs];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
  }
  else
  {
    [(CRLCanvasRep *)self boundsForStandardKnobs];
    double v7 = v14;
    double v9 = v15;
    double v11 = v16;
    double v13 = v17;
  }
  double v18 = v7;
  double v19 = v9;
  double v20 = v11;
  double v21 = v13;
  result.size.double height = v21;
  result.size.double width = v20;
  result.origin.double y = v19;
  result.origin.double x = v18;
  return result;
}

- (void)updatePositionsOfKnobs:(id)a3
{
  id v4 = a3;
  [(CRLCanvasRep *)self trackingBoundsForStandardKnobs];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v13 = v4;
  id v14 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v15; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(v13);
        }
        double v18 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if ((char *)objc_msgSend(v18, "tag", (void)v19) - 1 <= (char *)8)
        {
          -[CRLCanvasRep positionOfStandardKnob:forBounds:](self, "positionOfStandardKnob:forBounds:", v18, v6, v8, v10, v12);
          [v18 setPosition:];
        }
      }
      id v15 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v15);
  }
}

- (BOOL)forcesPlacementOnTop
{
  return 0;
}

- (double)horizontalOffsetForHyperlinkKnob
{
  return 0.0;
}

- (CGPoint)positionOfStandardKnob:(id)a3 forBounds:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a3;
  if (![v9 tag] || (unint64_t)objc_msgSend(v9, "tag") >= 0xA)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E5D38);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010917C8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E5D58);
    }
    double v10 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v10);
    }
    double v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasRep positionOfStandardKnob:forBounds:]");
    double v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRep.m"];
    +[CRLAssertionHandler handleFailureInFunction:v11 file:v12 lineNumber:2305 isFatal:0 description:"-positionOfStandardKnob:forBounds: works for standard knobs only"];
  }
  [v9 offset];
  double v14 = v13;
  double v16 = v15;
  if (![v9 offsetValid])
  {
    double v17 = [(CRLCanvasRep *)self canvas];
    [v17 viewScale];
    double v19 = v18;

    if (width * v19 <= 16.0)
    {
      if (objc_msgSend(v9, "tag", width * v19) == (id)1
        || [v9 tag] == (id)4
        || [v9 tag] == (id)7)
      {
        double v14 = v14 - (8.0 / v19 + width * -0.5);
      }
      else if ([v9 tag] == (id)3 || objc_msgSend(v9, "tag") == (id)6 || objc_msgSend(v9, "tag") == (id)9)
      {
        double v14 = v14 + 8.0 / v19 + width * -0.5;
      }
    }
    if (height * v19 > 16.0) {
      goto LABEL_24;
    }
    if (objc_msgSend(v9, "tag", height * v19) == (id)1
      || [v9 tag] == (id)2
      || [v9 tag] == (id)3)
    {
      long long v20 = [(CRLCanvasRep *)self interactiveCanvasController];
      [v20 viewScale];
      double v16 = v16 - (8.0 / v21 + height * -0.5);
    }
    else
    {
      if ([v9 tag] != (id)7 && objc_msgSend(v9, "tag") != (id)8 && objc_msgSend(v9, "tag") != (id)9) {
        goto LABEL_24;
      }
      long long v20 = [(CRLCanvasRep *)self interactiveCanvasController];
      [v20 viewScale];
      double v16 = v16 + 8.0 / v43 + height * -0.5;
    }

LABEL_24:
    [v9 setOffset:v14, v16];
    [v9 setOffsetValid:1];
  }
  double v22 = sub_100289A18((uint64_t)[v9 tag], x, y, width, height);
  double v24 = sub_100064698(v22, v23, v14);
  double v26 = v25;
  uint64_t v27 = [(CRLCanvasRep *)self canvas];
  [v27 viewScale];
  double v29 = v28;

  +[CRLConnectionLineKnob unscaledConnectionKnobOffsetWithEdgeKnob];
  double v31 = v30;
  +[CRLConnectionLineKnob unscaledConnectionKnobOffsetWithoutEdgeKnob];
  double v33 = v32;
  unsigned __int16 v34 = (unsigned __int16)[(CRLCanvasRep *)self enabledKnobMask];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v35 = v31 / v29;
    double v36 = v33 / v29;
    if ([v9 tag] == (id)6)
    {
      if ((v34 & 0x40) != 0) {
        double v37 = v35;
      }
      else {
        double v37 = v36;
      }
      double v24 = v24 + v37;
    }
    else if ([v9 tag] == (id)4)
    {
      if ((v34 & 0x10) != 0) {
        double v38 = v35;
      }
      else {
        double v38 = v36;
      }
      double v24 = v24 - v38;
    }
    else if ([v9 tag] == (id)2)
    {
      if ((v34 & 4) != 0) {
        double v39 = v35;
      }
      else {
        double v39 = v36;
      }
      double v26 = v26 - v39;
    }
    else if ([v9 tag] == (id)8)
    {
      if ((v34 & 0x100) != 0) {
        double v40 = v35;
      }
      else {
        double v40 = v36;
      }
      double v26 = v26 + v40;
    }
  }

  double v41 = v24;
  double v42 = v26;
  result.double y = v42;
  result.double x = v41;
  return result;
}

- (void)invalidateKnobPositions
{
  self->mKnobPositionsInvalid = 1;
  [(CRLCanvasRep *)self i_invalidateSelectionHighlightRenderable];
  id v4 = [(CRLCanvasRep *)self canvas];
  id v3 = [v4 canvasController];
  [v3 invalidateOverlayLayersForRep:self];
}

- (id)newTrackerForKnob:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E5D78);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101091850();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E5D98);
    }
    double v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    double v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasRep newTrackerForKnob:]");
    double v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRep.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 2382, 0, "invalid nil value for '%{public}s'", "knob");
  }
  double v8 = (char *)[v4 tag];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = &off_1014C1A60;
  }
  else
  {
    if ((unint64_t)(v8 - 1) > 8)
    {
      id v10 = 0;
      goto LABEL_17;
    }
    id v9 = off_1014C0EF8;
  }
  id v10 = [objc_alloc(*v9) initWithRep:self knob:v4];
LABEL_17:

  return v10;
}

- (void)p_toggleHyperlinkUIVisibility
{
  id v3 = [(CRLCanvasRep *)self interactiveCanvasController];
  [v3 toggleHyperlinkUIForRep:self];
}

- (id)knobForTag:(unint64_t)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(CRLCanvasRep *)self knobs];
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v9 tag] == (id)a3)
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

- (double)additionalRotationForKnobOrientation
{
  BOOL v2 = [(CRLCanvasRep *)self layout];
  id v3 = v2;
  if (v2) {
    [v2 transformInRoot];
  }
  else {
    memset(v6, 0, sizeof(v6));
  }
  double v4 = sub_10007F788(v6);

  return v4;
}

- (CRLCanvasKnob)knobForInspectorResize
{
  id v3 = [(CRLCanvasRep *)self canvas];
  unsigned int v4 = [v3 isAnchoredAtRight];

  if (v4) {
    uint64_t v5 = 7;
  }
  else {
    uint64_t v5 = 9;
  }
  id v6 = [(CRLCanvasRep *)self knobForTag:v5];
  if (!v6) {
    id v6 = -[CRLCanvasKnob initWithType:position:radius:tag:onRep:]([CRLCanvasKnob alloc], "initWithType:position:radius:tag:onRep:", 0, v5, self, CGPointZero.x, CGPointZero.y, 15.0);
  }

  return v6;
}

- (CGAffineTransform)knobPositionTransformForInspectorResize
{
  [(CRLCanvasRep *)self boundsForStandardKnobs];

  return CGAffineTransformMakeTranslation(retstr, v4, v5);
}

- (BOOL)shouldShowSelectionHighlight
{
  if (![(CRLCanvasRep *)self isSelectedIgnoringLocking]
    || [(CRLCanvasRep *)self isInDynamicOperation]
    && (!self->mShowKnobsWhenManipulated || !self->mKnobsAreShowing))
  {
    return 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->mKnobTracker);
  if ([WeakRetained shouldHideSelectionHighlight])
  {
    unsigned __int8 v4 = 0;
  }
  else
  {
    CGFloat v5 = [(CRLCanvasRep *)self interactiveCanvasController];
    unsigned __int8 v4 = [v5 allowsSelectionHighlight];
  }
  return v4;
}

- (BOOL)shouldCreateKnobs
{
  return 1;
}

- (BOOL)shouldCreateConnectionLineKnobs
{
  if (!+[CRLFeatureFlagGroup isEasierConnectionLinesEnabled])return 0; {
  id v3 = [(CRLCanvasRep *)self layout];
  }
  if ([v3 isInGroup])
  {
    BOOL v4 = 0;
  }
  else
  {
    CGFloat v5 = [(CRLCanvasRep *)self interactiveCanvasController];
    if ([v5 connectorKnobsEnabled]) {
      BOOL v4 = +[CRLConnectionLineRep canConnectToRep:self];
    }
    else {
      BOOL v4 = 0;
    }
  }
  return v4;
}

- (BOOL)shouldCreateSelectionKnobs
{
  if (![(CRLCanvasRep *)self shouldShowKnobs] || ![(CRLCanvasRep *)self isSelected]) {
    return 0;
  }
  id v3 = [(CRLCanvasRep *)self interactiveCanvasController];
  if ([v3 usesAlternateDrawableSelectionHighlight])
  {
    BOOL v4 = 0;
  }
  else
  {
    CGFloat v5 = [(CRLCanvasRep *)self interactiveCanvasController];
    if ([v5 allowsSelectionKnobs])
    {
      id v6 = [(CRLCanvasRep *)self interactiveCanvasController];
      if ([v6 shouldSuppressSelectionKnobsForRep:self]) {
        BOOL v4 = [(CRLCanvasRep *)self shouldIgnoreICCSuppressSelectionKnobs];
      }
      else {
        BOOL v4 = 1;
      }
    }
    else
    {
      BOOL v4 = 0;
    }
  }
  return v4;
}

- (BOOL)shouldIgnoreICCSuppressSelectionKnobs
{
  return 0;
}

- (BOOL)shouldSuppressSelectionHighlightDuringMultiselection
{
  return 0;
}

- (BOOL)shouldCreateLockedKnobs
{
  BOOL v3 = [(CRLCanvasRep *)self isLocked];
  if (v3)
  {
    LOBYTE(v3) = [(CRLCanvasRep *)self isSelectedIgnoringLocking];
  }
  return v3;
}

- (BOOL)isEditingPath
{
  return 0;
}

- (BOOL)shouldShowKnobs
{
  if (![(CRLCanvasRep *)self isInDynamicOperation] || self->mShowKnobsWhenManipulated) {
    return 1;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->mKnobTracker);
  BOOL v3 = WeakRetained != 0;

  return v3;
}

- (void)turnKnobsOn
{
  self->mKnobsAreShowing = 1;
  mKnobsAccessQueue = self->mKnobsAccessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002625D4;
  block[3] = &unk_1014CBBB0;
  block[4] = self;
  dispatch_sync(mKnobsAccessQueue, block);
}

- (void)fadeKnobsIn
{
  self->mKnobsAreShowing = 1;
  BOOL v3 = +[CABasicAnimation animationWithKeyPath:@"opacity"];
  [v3 setDelegate:0];
  [v3 setDuration:0.150000006];
  LODWORD(v4) = 1.0;
  CGFloat v5 = +[NSNumber numberWithFloat:v4];
  [v3 setToValue:v5];

  mKnobsAccessQueue = self->mKnobsAccessQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100262830;
  v8[3] = &unk_1014CBE78;
  v8[4] = self;
  id v9 = v3;
  id v7 = v3;
  dispatch_sync(mKnobsAccessQueue, v8);
}

- (void)fadeKnobsOut
{
  self->mKnobsAreShowing = 0;
  BOOL v3 = +[CABasicAnimation animationWithKeyPath:@"opacity"];
  [v3 setDelegate:0];
  [v3 setDuration:0.150000006];
  LODWORD(v4) = 1.0;
  CGFloat v5 = +[NSNumber numberWithFloat:v4];
  [v3 setFromValue:v5];

  id v6 = +[NSNumber numberWithFloat:0.0];
  [v3 setToValue:v6];

  mKnobsAccessQueue = self->mKnobsAccessQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100262B14;
  v9[3] = &unk_1014CBE78;
  v9[4] = self;
  id v10 = v3;
  id v8 = v3;
  dispatch_sync(mKnobsAccessQueue, v9);
}

- (BOOL)directlyManagesVisibilityOfKnob:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)knobTrackingShouldFailForForceTouchOnKnob:(id)a3 atNaturalPoint:(CGPoint)a4
{
  return 0;
}

- (double)selectionHighlightWidth
{
  return 1.0;
}

- (CRLColor)defaultSelectionHighlightColor
{
  return +[CRLColor colorWithRed:0.17254902 green:0.439215686 blue:1.0 alpha:1.0];
}

- (CRLColor)selectionHighlightColor
{
  if ([(CRLCanvasRep *)self isLocked])
  {
    if (qword_1016A94A8 != -1) {
      dispatch_once(&qword_1016A94A8, &stru_1014E5DB8);
    }
    id v3 = (id)qword_1016A94B0;
  }
  else
  {
    double v4 = [(CRLCanvasRep *)self interactiveCanvasController];
    CGFloat v5 = [v4 selectionHighlightColor];

    if (v5) {
      goto LABEL_8;
    }
    id v3 = [(CRLCanvasRep *)self defaultSelectionHighlightColor];
  }
  CGFloat v5 = v3;
LABEL_8:

  return (CRLColor *)v5;
}

- (CGAffineTransform)transformForHighlightLayer
{
  p_mKnobTracker = &self->mKnobTracker;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mKnobTracker);
  if (WeakRetained)
  {
    id v6 = objc_loadWeakRetained((id *)p_mKnobTracker);
    id v7 = v6;
    if (v6)
    {
      [v6 transformInRootForStandardKnobs];
      goto LABEL_7;
    }
  }
  else
  {
    id v8 = [(CRLCanvasRep *)self layout];
    id v7 = v8;
    if (v8)
    {
      [v8 transformInRoot];
      goto LABEL_7;
    }
  }
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tdouble x = 0u;
  *(_OWORD *)&retstr->a = 0u;
LABEL_7:

  return result;
}

- (void)invalidateSelectionHighlightRenderable
{
  [(CRLCanvasRenderable *)self->mSelectionHighlightRenderable setDelegate:0];
  mSelectionHighlightRenderable = self->mSelectionHighlightRenderable;
  self->mSelectionHighlightRenderable = 0;

  self->mSelectionHighlightRenderableValid = 0;
}

- (CRLCanvasRenderable)selectionHighlightRenderable
{
  mSelectionHighlightRenderable = self->mSelectionHighlightRenderable;
  if (mSelectionHighlightRenderable)
  {
    if (self->mSelectionHighlightRenderableValid) {
      goto LABEL_6;
    }
  }
  else
  {
    double v4 = [(CRLCanvasRep *)self makeSelectionHighlightRenderable];
    CGFloat v5 = self->mSelectionHighlightRenderable;
    self->mSelectionHighlightRenderable = v4;

    id v6 = [(CRLCanvasRep *)self interactiveCanvasController];
    [(CRLCanvasRenderable *)self->mSelectionHighlightRenderable setDelegate:v6];

    self->mSelectionHighlightRenderableValid = 0;
    mSelectionHighlightRenderable = self->mSelectionHighlightRenderable;
  }
  [(CRLCanvasRep *)self updateSelectionHighlightRenderable:mSelectionHighlightRenderable];
  self->mSelectionHighlightRenderableValid = 1;
  mSelectionHighlightRenderable = self->mSelectionHighlightRenderable;
LABEL_6:

  return mSelectionHighlightRenderable;
}

- (id)makeSelectionHighlightRenderable
{
  id v3 = +[CRLCanvasShapeRenderable renderable];
  [v3 setFillColor:0];
  [(CRLCanvasRep *)self selectionHighlightWidth];
  [v3 setLineWidth:];

  return v3;
}

- (void)updateSelectionHighlightRenderable:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = sub_1002469D0(v5, v4);

  if (v6)
  {
    id v7 = [(CRLCanvasRep *)self selectionHighlightColor];
    [v6 setStrokeColor:[v7 CGColor]];

    [(CRLCanvasRep *)self selectionHighlightWidth];
    [v6 setLineWidth:];
    id WeakRetained = objc_loadWeakRetained((id *)&self->mCanvas);
    [WeakRetained viewScale];
    CGFloat v10 = v9;

    [(CRLCanvasRep *)self boundsForHighlightLayer];
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    memset(&v27, 0, sizeof(v27));
    [(CRLCanvasRep *)self transformForHighlightLayer];
    CGAffineTransformMakeScale(&t2, v10, v10);
    CGAffineTransform v24 = v27;
    CGAffineTransformConcat(&v26, &v24, &t2);
    CGAffineTransform v27 = v26;
    [v6 lineWidth];
    double v20 = v19;
    double v21 = [(CRLCanvasRep *)self canvas];
    [v21 contentsScale];
    double v23 = sub_1000D5638(&v27.a, v12, v14, v16, v18, v20, v22);

    [v6 setPath:v23];
    CGPathRelease(v23);
  }
}

- (void)i_invalidateSelectionHighlightRenderable
{
  self->mSelectionHighlightRenderableValid = 0;
  [(CRLCanvasRep *)self invalidateCollaboratorCursorRenderable];

  [(CRLCanvasRep *)self invalidateDragAndDropHighlightLayer];
}

- (CGPoint)convertKnobPositionToUnscaledCanvas:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  p_mKnobTracker = &self->mKnobTracker;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mKnobTracker);

  if (WeakRetained)
  {
    id v8 = objc_loadWeakRetained((id *)p_mKnobTracker);
    [v8 convertKnobPositionToUnscaledCanvas:x, y];
    double v10 = v9;
    double v12 = v11;

    double v13 = v10;
    double v14 = v12;
  }
  else
  {
    -[CRLCanvasRep convertNaturalPointToUnscaledCanvas:](self, "convertNaturalPointToUnscaledCanvas:", x, y);
  }
  result.double y = v14;
  result.double x = v13;
  return result;
}

- (CGPoint)convertKnobPositionFromUnscaledCanvas:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  p_mKnobTracker = &self->mKnobTracker;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mKnobTracker);

  if (WeakRetained)
  {
    id v8 = objc_loadWeakRetained((id *)p_mKnobTracker);
    [v8 convertKnobPositionFromUnscaledCanvas:x, y];
    double v10 = v9;
    double v12 = v11;

    double v13 = v10;
    double v14 = v12;
  }
  else
  {
    -[CRLCanvasRep convertNaturalPointFromUnscaledCanvas:](self, "convertNaturalPointFromUnscaledCanvas:", x, y);
  }
  result.double y = v14;
  result.double x = v13;
  return result;
}

- (id)p_addRenderablesForKnobsToArray:(id)a3 withDelegate:(id)a4 isOverlay:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  double v10 = [(CRLCanvasRep *)self knobs];
  if (![v10 count]
    || [v10 count] == (id)1
    && (objc_msgSend(v10, "crl_anyObject"),
        double v11 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v11,
        (isKindOfClass & 1) != 0))
  {
    id v13 = v8;
  }
  else
  {
    double v14 = [(CRLCanvasRep *)self interactiveCanvasController];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100263590;
    v26[3] = &unk_1014E5E20;
    BOOL v27 = a5;
    v26[4] = v10;
    v26[5] = self;
    double v15 = objc_retainBlock(v26);
    if (!v8)
    {
      id v8 = +[NSMutableArray array];
    }
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100263A30;
    v24[3] = &unk_1014E5E48;
    v24[4] = self;
    id v16 = v8;
    id v25 = v16;
    ((void (*)(void *, void *))v15[2])(v15, v24);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100263ABC;
    v19[3] = &unk_1014E5EB0;
    id v20 = v9;
    double v21 = v14;
    double v22 = self;
    id v17 = v16;
    id v23 = v17;
    ((void (*)(void *, void *))v15[2])(v15, v19);
    id v13 = v17;
  }

  return v13;
}

- (NSArray)overlayRenderables
{
  id v3 = +[NSMutableArray array];
  if ([(CRLCanvasRep *)self shouldShowCollaboratorCursorHighlight]
    && [(CRLCanvasRep *)self shouldAddCollaboratorLayerToOverlays])
  {
    id v4 = [(CRLCanvasRep *)self collaboratorCursorRenderable];
    if (v4) {
      [v3 addObject:v4];
    }
  }
  if ([(CRLCanvasRep *)self p_shouldShowSelectionHighlight])
  {
    uint64_t v5 = [(CRLCanvasRep *)self selectionHighlightRenderable];
    if (v5) {
      [v3 addObject:v5];
    }
  }
  if ([(CRLCanvasRep *)self shouldShowDragAndDropHighlight])
  {
    id v6 = [(CRLCanvasRep *)self dragAndDropHighlightRenderable];
    if (v6) {
      [v3 addObject:v6];
    }
  }
  id v7 = [(CRLCanvasRep *)self interactiveCanvasController];
  id v8 = [(CRLCanvasRep *)self p_addRenderablesForKnobsToArray:v3 withDelegate:v7 isOverlay:1];

  return (NSArray *)v8;
}

- (BOOL)p_shouldShowSelectionHighlight
{
  id v3 = [(CRLCanvasRep *)self interactiveCanvasController];
  if ([v3 shouldSuppressSelectionKnobsForRep:self])
  {
    unsigned __int8 v4 = [(CRLCanvasRep *)self shouldSuppressSelectionHighlightDuringMultiselection];

    if ((v4 & 1) == 0) {
      return 1;
    }
  }
  else
  {
  }

  return [(CRLCanvasRep *)self shouldShowSelectionHighlight];
}

- (double)contentsScale
{
  BOOL v2 = [(CRLCanvasRep *)self canvas];
  [v2 contentsScale];
  double v4 = v3;

  return v4;
}

- (void)dynamicOperationDidBeginWithRealTimeCommands:(BOOL)a3
{
  id v4 = +[NSNumber numberWithBool:a3];
  [(CRLCanvasRep *)self recursivelyPerformSelector:"p_dynamicOperationDidBeginWithRealTimeCommands:" withObject:v4];
}

- (void)p_dynamicOperationDidBeginWithRealTimeCommands:(id)a3
{
  id v4 = a3;
  if ([(CRLCanvasRep *)self isInDynamicOperation])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E5ED0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010918E4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E5EF0);
    }
    uint64_t v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    id v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasRep p_dynamicOperationDidBeginWithRealTimeCommands:]");
    id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRep.m"];
    +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:2824 isFatal:0 description:"beginning dynamic operation on rep already being manipulated"];
  }
  [(CRLCanvasRep *)self layerFrameInScaledCanvas];
  self->mOriginalLayerFrameInScaledCanvas.origin.double x = v8;
  self->mOriginalLayerFrameInScaledCanvas.origin.double y = v9;
  self->mOriginalLayerFrameInScaledCanvas.size.double width = v10;
  self->mOriginalLayerFrameInScaledCanvas.size.double height = v11;
  double v12 = [(CRLCanvasRep *)self layout];
  id v13 = [v4 BOOLValue];

  [v12 beginDynamicOperationWithRealTimeCommands:v13];
  id WeakRetained = objc_loadWeakRetained((id *)&self->mCanvas);
  [WeakRetained canvasInvalidatedForRep:self];
}

- (void)dynamicOperationDidEnd
{
  [(CRLCanvasRep *)self recursivelyPerformSelector:"p_dynamicOperationDidEnd"];
  double v3 = [(CRLCanvasRep *)self p_connectedReps];
  [v3 makeObjectsPerformSelector:"invalidateKnobs"];

  [(CRLCanvasRep *)self invalidateKnobs];
  id v4 = [(CRLCanvasRep *)self layout];
  unsigned int v5 = [v4 isInGroup];

  if (v5)
  {
    id v6 = [(CRLCanvasRep *)self parentRep];
    [v6 p_invalidateChildKnobPositionsForEndingDynamicOperation];
  }
}

- (void)p_invalidateChildKnobPositionsForEndingDynamicOperation
{
  if (!self->mHasInvalidatedChildKnobPositionsForEndingDynamicOperation)
  {
    self->mHasInvalidatedChildKnobPositionsForEndingDynamicOperation = 1;
    double v3 = [(CRLCanvasRep *)self childReps];
    [v3 makeObjectsPerformSelector:"invalidateKnobPositions"];

    objc_initWeak(&location, self);
    id v4 = [(CRLCanvasRep *)self canvas];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1002644C4;
    v5[3] = &unk_1014CBF60;
    objc_copyWeak(&v6, &location);
    [v4 performBlockAfterLayoutIfNecessary:v5];

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

- (void)p_dynamicOperationDidEnd
{
  double v3 = [(CRLCanvasRep *)self layout];
  [v3 endDynamicOperation];

  if ([(CRLCanvasRep *)self shouldShowKnobs])
  {
    [(CRLCanvasRep *)self invalidateKnobs];
  }
}

- (BOOL)isInDynamicOperation
{
  BOOL v2 = [(CRLCanvasRep *)self layout];
  BOOL v3 = [v2 layoutState] != 0;

  return v3;
}

- (BOOL)allowsSupportedDynamicOperationsToBeRealTime
{
  return 1;
}

- (CRLShadow)shadow
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(CRLCanvasRep *)self info];
  unsigned int v5 = sub_1002469D0(v3, v4);

  id v6 = [v5 shadow];

  return (CRLShadow *)v6;
}

- (void)drawInContextWithoutEffectsOrChildrenForAlphaOnly:(CGContext *)a3
{
}

- (BOOL)shouldShowShadow
{
  uint64_t v3 = [(CRLCanvasRep *)self canvas];
  unsigned __int8 v4 = [v3 suppressesShadowsAndReflections];

  if ((v4 & 1) != 0
    || [(CRLCanvasRep *)self isBeingResized]
    || [(CRLCanvasRep *)self isBeingRotated]
    || [(CRLCanvasRep *)self isBeingFreeTransformResized])
  {
    return 0;
  }
  else
  {
    return ![(CRLCanvasRep *)self inFreeTransformRotateResizeMode];
  }
}

- (void)p_willUpdateEffectRenderablesForRenderable:(id)a3
{
  id v7 = [(CRLCanvasRep *)self shadow];
  if (v7 && [v7 isEnabled] && -[CRLCanvasRep shouldShowShadow](self, "shouldShowShadow"))
  {
    if (!self->mShadowRenderable)
    {
      unsigned __int8 v4 = +[CRLNoDefaultImplicitActionRenderable renderable];
      mShadowRenderable = self->mShadowRenderable;
      self->mShadowRenderable = v4;

      [(CRLCanvasRep *)self invalidateShadowRenderable];
    }
  }
  else
  {
    id v6 = self->mShadowRenderable;
    if (v6)
    {
      self->mShadowRenderable = 0;
    }
  }
}

- (BOOL)isInvisible
{
  return 0;
}

- (void)p_didUpdateEffectRenderablesForRenderable:(id)a3
{
  if (![(CRLCanvasRep *)self isInvisible])
  {
    id v53 = [(CRLCanvasRep *)self interactiveCanvasController];
    unsigned __int8 v5 = [v53 createRepsForOffscreenLayouts];
    mShadowRenderable = self->mShadowRenderable;
    if (mShadowRenderable && (v5 & 1) == 0)
    {
      [v53 visibleBoundsRectForTiling];
      [v53 convertBoundsToUnscaledRect:];
      CGFloat v8 = v7;
      CGFloat v10 = v9;
      CGFloat v12 = v11;
      CGFloat v14 = v13;
      double v15 = [(CRLCanvasRep *)self layout];
      [v15 frameForCulling];
      double v17 = v16;
      double v19 = v18;
      double v21 = v20;
      double v23 = v22;

      CGAffineTransform v24 = [(CRLCanvasRep *)self layout];
      id v25 = [v24 parent];

      if (v25)
      {
        [v25 rectInRoot:v17, v19, v21, v23];
        double v17 = v26;
        double v19 = v27;
        double v21 = v28;
        double v23 = v29;
      }
      v55.origin.double x = v17;
      v55.origin.double y = v19;
      v55.size.double width = v21;
      v55.size.double height = v23;
      v56.origin.double x = v8;
      v56.origin.double y = v10;
      v56.size.double width = v12;
      v56.size.double height = v14;
      if (!CGRectIntersectsRect(v55, v56))
      {
        [(CRLCanvasRenderable *)self->mShadowRenderable setOpacity:0.0];

        goto LABEL_50;
      }

      mShadowRenderable = self->mShadowRenderable;
    }
    if (mShadowRenderable
      && ![(CRLCanvasRep *)self isBeingResized]
      && ![(CRLCanvasRep *)self inFreeTransformRotateResizeMode])
    {
      double v30 = [(CRLCanvasRep *)self shadow];
      if (!v30)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014E5F10);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_1010919F4();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014E5F30);
        }
        double v31 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10106590C(v31);
        }
        double v32 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasRep p_didUpdateEffectRenderablesForRenderable:]");
        double v33 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRep.m"];
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v32, v33, 2978, 0, "invalid nil value for '%{public}s'", "shadow");
      }
      if (([v30 isEnabled] & 1) == 0)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014E5F50);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10109196C();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014E5F70);
        }
        unsigned __int16 v34 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10106590C(v34);
        }
        double v35 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasRep p_didUpdateEffectRenderablesForRenderable:]");
        double v36 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRep.m"];
        +[CRLAssertionHandler handleFailureInFunction:v35 file:v36 lineNumber:2979 isFatal:0 description:"shouldn't have shadow renderable if shadow is not enabled"];
      }
      if (v30 && [v30 isEnabled])
      {
        [(CRLCanvasRep *)self opacity];
        double v38 = v37;
        [v30 opacity];
        double v40 = v38 * v39;
        [(CRLCanvasRenderable *)self->mShadowRenderable opacity];
        double v42 = v41;
        if (v40 != v42)
        {
          *(float *)&double v42 = v40;
          [(CRLCanvasRenderable *)self->mShadowRenderable setOpacity:v42];
        }
        if (v40 != 0.0)
        {
          double v43 = [(CRLCanvasRenderable *)self->mShadowRenderable contents];

          if (!v43) {
            [(CRLCanvasRep *)self invalidateShadowRenderable];
          }
        }
        if ([(CRLCanvasRep *)self isBeingRotated]) {
          [(CRLCanvasRep *)self invalidateShadowRenderable];
        }
        CGFloat v44 = self->mShadowRenderable;
        CGFloat v45 = [(CRLCanvasRep *)self layout];
        [v45 shadowedNaturalBoundsWithoutOffset];
        -[CRLCanvasRep p_positionShadowRenderable:forShadow:withNaturalBounds:](self, "p_positionShadowRenderable:forShadow:withNaturalBounds:", v44, v30);
      }
      if (self->mShadowRenderableInvalid)
      {
        [(CRLCanvasRenderable *)self->mShadowRenderable bounds];
        double v47 = v46;
        double v49 = v48;
        char v50 = [(CRLCanvasRep *)self canvas];
        [v50 viewScale];
        id v52 = [(CRLCanvasRep *)self newShadowImageWithSize:0 unflipped:1 withChildren:sub_1000646A4(v47, v49, 1.0 / v51)];

        [(CRLCanvasRenderable *)self->mShadowRenderable setContents:v52];
        self->BOOL mShadowRenderableInvalid = 0;
        CGImageRelease(v52);
      }
    }
LABEL_50:

    return;
  }
  unsigned __int8 v4 = self->mShadowRenderable;

  [(CRLCanvasRenderable *)v4 setContents:0];
}

- (void)invalidateShadowRenderable
{
  self->BOOL mShadowRenderableInvalid = 1;
}

- (void)p_positionShadowRenderable:(id)a3 forShadow:(id)a4 withNaturalBounds:(CGRect)a5
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  double x = a5.origin.x;
  id v11 = a3;
  id v12 = a4;
  double v13 = [(CRLCanvasRep *)self canvas];
  [v13 viewScale];
  double v15 = v14;

  if ([v12 isDropShadow])
  {
    sub_1000652FC(x, y, width, height, v15);
    long long v117 = 0u;
    long long v118 = 0u;
    long long v115 = 0u;
    long long v116 = 0u;
    long long v114 = 0u;
    [(CRLCanvasRep *)self computeDirectLayerFrame:&v117 andTransform:&v114];
    double v16 = sub_100065738(*(CGFloat *)&v117, *((CGFloat *)&v117 + 1), *(CGFloat *)&v118, *((CGFloat *)&v118 + 1));
    double v18 = v17;
    [v12 offsetDelta];
    double v21 = sub_1000646A4(v19, v20, v15);
    double v23 = sub_1000674F0(v21, v22);
    [v11 setPosition:sub_100064698(v16, v18, v23)];
    [v11 setBounds:sub_100064070()];
    long long v111 = v114;
    long long v112 = v115;
    long long v113 = v116;
    CGAffineTransform v24 = &v111;
  }
  else if ([v12 isContactShadow])
  {
    id v25 = [(CRLCanvasRep *)self shadow];
    [v25 boundsForRep:self];
    double v27 = v26;
    CGFloat v29 = v28;
    CGFloat v31 = v30;
    CGFloat v33 = v32;

    double v34 = sub_1000652FC(v27, v29, v31, v33, v15);
    double v38 = sub_100065738(v34, v35, v36, v37);
    double v40 = v39;
    [v12 offset];
    double v42 = sub_1000646A4(0.0, v41, v15);
    double v44 = sub_1000674F0(v42, v43);
    double v45 = sub_100064698(v38, v40, v44);
    double v47 = v46;
    double v48 = [(CRLCanvasRep *)self parentRep];

    if (v48)
    {
      double v49 = [(CRLCanvasRep *)self parentRep];
      [v49 layerFrameInScaledCanvas];
      double v51 = v50;
      double v53 = v52;

      double v45 = v45 - v51;
      double v47 = v47 - v53;
    }
    [v11 setPosition:v45, v47];
    [v11 setBounds:sub_100064070()];
    long long v54 = *(_OWORD *)&CGAffineTransformIdentity.c;
    long long v108 = *(_OWORD *)&CGAffineTransformIdentity.a;
    long long v109 = v54;
    long long v110 = *(_OWORD *)&CGAffineTransformIdentity.tx;
    CGAffineTransform v24 = &v108;
  }
  else
  {
    if (![v12 isCurvedShadow]) {
      goto LABEL_12;
    }
    CGRect v55 = [(CRLCanvasRep *)self shadow];
    [v55 boundsForRep:self];
    double v57 = v56;
    CGFloat v59 = v58;
    CGFloat v61 = v60;
    CGFloat v63 = v62;

    double v64 = sub_1000652FC(v57, v59, v61, v63, v15);
    double v68 = sub_100065738(v64, v65, v66, v67);
    double v70 = v69;
    [v12 offsetDelta];
    double v73 = sub_1000646A4(v71, v72, v15);
    double v75 = sub_1000674F0(v73, v74);
    double v76 = sub_100064698(v68, v70, v75);
    double v78 = v77;
    v79 = [(CRLCanvasRep *)self parentRep];

    if (v79)
    {
      v80 = [(CRLCanvasRep *)self parentRep];
      [v80 layerFrameInScaledCanvas];
      double v82 = v81;
      double v84 = v83;

      double v76 = v76 - v82;
      double v78 = v78 - v84;
    }
    [v11 setPosition:v76, v78];
    [v11 setBounds:sub_100064070()];
    long long v85 = *(_OWORD *)&CGAffineTransformIdentity.c;
    long long v105 = *(_OWORD *)&CGAffineTransformIdentity.a;
    long long v106 = v85;
    long long v107 = *(_OWORD *)&CGAffineTransformIdentity.tx;
    CGAffineTransform v24 = &v105;
  }
  [v11 setAffineTransform:v24, v105, v106, v107, v108, v109, v110, v111, v112, v113];
LABEL_12:
  [v11 frame];
  double v87 = v86;
  double v89 = v88;
  uint64_t v90 = [v11 superlayer];
  if (v90)
  {
    v91 = (void *)v90;
    do
    {
      [v91 frame];
      double v87 = sub_100064698(v87, v89, v92);
      double v89 = v93;
      uint64_t v94 = [v91 superlayer];

      v91 = (void *)v94;
    }
    while (v94);
  }
  [v11 position];
  double v96 = v95;
  double v98 = v97;
  CGAffineTransform v99 = [(CRLCanvasRep *)self canvas];
  [v99 contentsScale];
  double v101 = sub_100067528(v87, v89, v100);
  double v103 = v102;

  double v104 = sub_100064680(v101, v103, v87);
  [v11 setPosition:sub_100064698(v96, v98, v104)];
}

- (BOOL)canDrawShadowInOneStepWithChildren:(BOOL)a3
{
  return 0;
}

- (CGImage)newShadowImageWithSize:(CGSize)a3 shadow:(id)a4 drawSelector:(SEL)a5 unflipped:(BOOL)a6
{
  return (CGImage *)_objc_msgSend(a4, "newShadowImageForRep:withSize:drawSelector:unflipped:", self, a5, a6, a3.width, a3.height);
}

- (CGImage)newShadowImageWithSize:(CGSize)a3 unflipped:(BOOL)a4 withChildren:(BOOL)a5
{
  BOOL v5 = a4;
  double height = a3.height;
  double width = a3.width;
  double v9 = &selRef_drawInContextWithoutEffectsForAlphaOnly_;
  if (!a5) {
    double v9 = &selRef_drawInContextWithoutEffectsOrChildrenForAlphaOnly_;
  }
  CGFloat v10 = *v9;
  id v11 = [(CRLCanvasRep *)self shadow];
  id v12 = -[CRLCanvasRep newShadowImageWithSize:shadow:drawSelector:unflipped:](self, "newShadowImageWithSize:shadow:drawSelector:unflipped:", v11, v10, v5, width, height);

  return v12;
}

- (id)createAdditionalBoardItemsForCopyImaging
{
  return &__NSArray0__struct;
}

- (void)dynamicDragDidBegin
{
  [(CRLCanvasRep *)self p_dynamicDragDidBegin];
  id WeakRetained = objc_loadWeakRetained((id *)&self->mCanvas);
  [WeakRetained canvasInvalidatedForRep:self];
}

- (NSString)actionStringForDrag
{
  BOOL v2 = +[NSBundle mainBundle];
  uint64_t v3 = [v2 localizedStringForKey:@"Move" value:0 table:@"UndoStrings"];

  return (NSString *)v3;
}

- (void)p_dynamicDragDidBegin
{
  if (![(CRLCanvasRep *)self isInDynamicOperation])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E5F90);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101091A88();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E5FB0);
    }
    uint64_t v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    unsigned __int8 v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasRep p_dynamicDragDidBegin]");
    BOOL v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRep.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:3129 isFatal:0 description:"dynamic drag beginning outside of dynamic operation"];
  }
  id v6 = [(CRLCanvasRep *)self layout];
  [v6 beginDrag];
}

- (BOOL)isBeingDragged
{
  BOOL v2 = [(CRLCanvasRep *)self layout];
  BOOL v3 = [v2 layoutState] == 2;

  return v3;
}

- (CGRect)snapRectForDynamicDragWithOffset:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  BOOL v5 = [(CRLCanvasRep *)self layout];
  [v5 alignmentFrameInRoot];
  CGRect v15 = CGRectOffset(v14, x, y);
  CGFloat v6 = v15.origin.x;
  CGFloat v7 = v15.origin.y;
  CGFloat width = v15.size.width;
  CGFloat height = v15.size.height;

  double v10 = v6;
  double v11 = v7;
  double v12 = width;
  double v13 = height;
  result.size.CGFloat height = v13;
  result.size.CGFloat width = v12;
  result.origin.CGFloat y = v11;
  result.origin.CGFloat x = v10;
  return result;
}

- (BOOL)providesGuidesWhileAligning
{
  return 0;
}

- (BOOL)exclusivelyProvidesGuidesWhileAligning
{
  return 0;
}

- (BOOL)resetGuidesAfterDragAfterReset
{
  return 0;
}

- (id)additionalRectsForSnappingWithOffset:(CGPoint)a3
{
  return &__NSArray0__struct;
}

- (void)i_dynamicDragDidEnd
{
  id v2 = [(CRLCanvasRep *)self layout];
  [v2 endDrag];
}

- (CGPoint)i_dragOffset
{
  BOOL v3 = [(CRLCanvasRep *)self layout];
  unsigned __int8 v4 = [v3 dynamicGeometry];
  [v4 frame];
  double v6 = v5;
  double v8 = v7;
  double v9 = [(CRLCanvasRep *)self layout];
  double v10 = [v9 originalGeometry];
  [v10 frame];
  double v12 = sub_100064680(v6, v8, v11);
  double v14 = v13;

  double v15 = v12;
  double v16 = v14;
  result.CGFloat y = v16;
  result.CGFloat x = v15;
  return result;
}

- (CGRect)i_originalLayerFrameInScaledCanvas
{
  double x = self->mOriginalLayerFrameInScaledCanvas.origin.x;
  double y = self->mOriginalLayerFrameInScaledCanvas.origin.y;
  double width = self->mOriginalLayerFrameInScaledCanvas.size.width;
  double height = self->mOriginalLayerFrameInScaledCanvas.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)p_dragDidChangeGeometry
{
  [(CRLCanvasRep *)self i_dragOffset];
  return !sub_100064084(v2, v3, CGPointZero.x, CGPointZero.y);
}

- (BOOL)dragDidChangeGeometry
{
  return [(CRLCanvasRep *)self p_dragDidChangeGeometry];
}

- (BOOL)shouldAllowReplacementFromPaste
{
  return 0;
}

- (BOOL)shouldAllowReplacementFromDrop
{
  return 0;
}

- (BOOL)canPasteDataFromPhysicalKeyboard:(id)a3
{
  return 0;
}

- (id)commandForAcceptingPasteWithImageInfo:(id)a3 outSelectionBehavior:(id *)a4
{
  *a4 = 0;
  return 0;
}

- (void)dynamicDragDidEnd
{
  [(CRLCanvasRep *)self i_dragOffset];
  double v4 = v3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mCanvas);

  if (WeakRetained)
  {
    [(CRLCanvasRep *)self recursivelyPerformSelector:"i_dynamicDragDidEnd"];
    id v6 = objc_loadWeakRetained((id *)&self->mCanvas);
    [v6 canvasInvalidatedForRep:self];

    if ([(CRLCanvasRep *)self dragDidChangeGeometry])
    {
      double v7 = [(CRLCanvasRep *)self layout];
      unsigned __int8 v8 = [v7 isInRealTimeDynamicOperation];

      if ((v8 & 1) == 0)
      {
        double v9 = [(CRLCanvasRep *)self info];
        double v10 = [v9 geometry];
        id v11 = [v10 mutableCopy];

        [v11 position];
        [v11 setPosition:sub_100064698(v12, v13, v4)];
        uint64_t v14 = objc_opt_class();
        double v15 = sub_1002469D0(v14, v9);
        if (v15)
        {
          double v16 = [(CRLCanvasRep *)self interactiveCanvasController];
          double v17 = [v16 temporaryAdditionalBoardItemsToDisplay];
          unsigned __int8 v18 = [v17 containsObject:v15];

          if ((v18 & 1) == 0)
          {
            id v19 = [(CRLCanvasRep *)self newCommandToApplyGeometry:v11 toInfo:v15];
            if (v19)
            {
              double v20 = [(CRLCanvasRep *)self commandController];
              [v20 enqueueCommand:v19];
            }
            else
            {
              +[CRLAssertionHandler _atomicIncrementAssertCount];
              if (qword_101719A70 != -1) {
                dispatch_once(&qword_101719A70, &stru_1014E5FD0);
              }
              if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
                sub_101091B10();
              }
              if (qword_101719A70 != -1) {
                dispatch_once(&qword_101719A70, &stru_1014E5FF0);
              }
              double v21 = off_10166B4A0;
              if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
                sub_10106590C(v21);
              }
              double v22 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasRep dynamicDragDidEnd]");
              double v23 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRep.m"];
              +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v22, v23, 3235, 0, "invalid nil value for '%{public}s'", "cmd");
            }
            CGAffineTransform v24 = [(CRLCanvasRep *)self layout];
            [v24 enqueueCommandsForAdjustingPathSourcesAfterRoutingChanges];
          }
        }
      }
    }
    [(CRLCanvasRep *)self invalidateKnobs];
  }
}

- (BOOL)allowDragDelegate
{
  return 1;
}

- (BOOL)allowResizeDelegate
{
  return [(CRLCanvasRep *)self allowDragDelegate];
}

- (BOOL)allowRotateDelegate
{
  return [(CRLCanvasRep *)self allowResizeDelegate];
}

- (BOOL)demandsExclusiveSelection
{
  return 0;
}

- (BOOL)allowDragAcrossPageBoundaries
{
  double v2 = [(CRLCanvasRep *)self layout];
  char v3 = [v2 isInGroup] ^ 1;

  return v3;
}

- (void)dynamicRotateDidBegin
{
  [(CRLCanvasRep *)self recursivelyPerformSelector:"p_dynamicRotateDidBegin"];
  id WeakRetained = objc_loadWeakRetained((id *)&self->mCanvas);
  [WeakRetained canvasInvalidatedForRep:self];
}

- (void)p_dynamicRotateDidBegin
{
  if (![(CRLCanvasRep *)self isInDynamicOperation])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E6010);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101091BA4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E6030);
    }
    char v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    double v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasRep p_dynamicRotateDidBegin]");
    double v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRep.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:3288 isFatal:0 description:"dynamic rotate began outside of dynamic operation"];
  }
  id v6 = [(CRLCanvasRep *)self layout];
  [v6 beginRotate];

  [(CRLCanvasRep *)self invalidateKnobs];
}

- (BOOL)isBeingRotated
{
  double v2 = [(CRLCanvasRep *)self layout];
  BOOL v3 = [v2 layoutState] == 3;

  return v3;
}

- (NSString)actionStringForRotate
{
  double v2 = +[NSBundle mainBundle];
  BOOL v3 = [v2 localizedStringForKey:@"Rotate" value:0 table:@"UndoStrings"];

  return (NSString *)v3;
}

- (double)angleForRotation
{
  double v2 = [(CRLCanvasRep *)self info];
  BOOL v3 = [v2 geometry];
  [v3 angle];
  double v5 = v4;

  return v5;
}

- (CGPoint)unscaledGuidePosition
{
  [(CRLCanvasRep *)self naturalBounds];
  CGFloat x = v13.origin.x;
  CGFloat y = v13.origin.y;
  CGFloat width = v13.size.width;
  CGFloat height = v13.size.height;
  double MidX = CGRectGetMidX(v13);
  v14.origin.CGFloat x = x;
  v14.origin.CGFloat y = y;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  double MinY = CGRectGetMinY(v14);

  -[CRLCanvasRep convertNaturalPointToUnscaledCanvas:](self, "convertNaturalPointToUnscaledCanvas:", MidX, MinY);
  result.CGFloat y = v10;
  result.CGFloat x = v9;
  return result;
}

- (BOOL)shouldRasterizeRenderableDuringRotation
{
  return 1;
}

- (void)dynamicallyRotatingWithTracker:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLCanvasRep *)self layout];
  [v5 takeRotationFromTracker:v4];
}

- (void)p_dynamicRotateDidEnd
{
  BOOL v3 = [(CRLCanvasRep *)self layout];
  [v3 endRotate];

  [(CRLCanvasRep *)self invalidateKnobs];
}

- (void)dynamicRotateDidEndWithTracker:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLCanvasRep *)self info];
  [(CRLCanvasRep *)self recursivelyPerformSelector:"p_dynamicRotateDidEnd"];
  id WeakRetained = objc_loadWeakRetained((id *)&self->mCanvas);
  [WeakRetained canvasInvalidatedForRep:self];

  double v7 = [(CRLCanvasRep *)self layout];
  unsigned __int8 v8 = [v7 isInRealTimeDynamicOperation];

  if ((v8 & 1) == 0)
  {
    uint64_t v9 = objc_opt_class();
    double v10 = sub_1002469D0(v9, v5);
    if (v4) {
      [v4 rotateTransform];
    }
    else {
      memset(v21, 0, sizeof(v21));
    }
    id v11 = [(CRLCanvasRep *)self resizedGeometryForTransform:v21];
    if (v10)
    {
      id v12 = [(CRLCanvasRep *)self newCommandToApplyGeometry:v11 toInfo:v10];
      if (v12)
      {
        CGRect v13 = [(CRLCanvasRep *)self commandController];
        [v13 enqueueCommand:v12];
      }
      else
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014E6050);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_101091D04();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014E6070);
        }
        id v19 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10106590C(v19);
        }
        CGRect v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasRep dynamicRotateDidEndWithTracker:]");
        double v20 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRep.m"];
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v20, 3348, 0, "invalid nil value for '%{public}s'", "cmd");
      }
    }
    else
    {
      int v14 = +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E6090);
      }
      double v15 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101091C2C(v15, (uint64_t)self, v14);
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E60B0);
      }
      double v16 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v16);
      }
      +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasRep dynamicRotateDidEndWithTracker:]");
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      CGRect v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRep.m"];
      double v17 = (objc_class *)objc_opt_class();
      unsigned __int8 v18 = NSStringFromClass(v17);
      +[CRLAssertionHandler handleFailureInFunction:v12, v13, 3354, 0, "We don't know how to rotate a %@", v18 file lineNumber isFatal description];
    }
  }
}

- (id)dynamicResizeDidBegin
{
  if (![(CRLCanvasRep *)self isInDynamicOperation])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E60D0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101091D98();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E60F0);
    }
    BOOL v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasRep dynamicResizeDidBegin]");
    id v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRep.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:3367 isFatal:0 description:"resize begins without being in dynamic operation"];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->mCanvas);
  [WeakRetained canvasInvalidatedForRep:self];

  double v7 = [(CRLCanvasRep *)self layout];
  [v7 beginResize];

  unsigned __int8 v8 = [(CRLCanvasRep *)self layout];

  return v8;
}

- (BOOL)isBeingResized
{
  double v2 = [(CRLCanvasRep *)self layout];
  BOOL v3 = [v2 layoutState] == 4;

  return v3;
}

- (NSString)actionStringForResize
{
  double v2 = +[NSBundle mainBundle];
  BOOL v3 = [v2 localizedStringForKey:@"Resize" value:0 table:@"UndoStrings"];

  return (NSString *)v3;
}

- (void)dynamicallyResizingWithTracker:(id)a3
{
  id v8 = a3;
  id v4 = [v8 rep];
  if ([v4 willHandleResizingLayoutForRep:self])
  {
    id v5 = [v8 rep];

    if (v5 != self) {
      goto LABEL_6;
    }
  }
  else
  {
  }
  id v6 = [v8 resizingLayoutForRep:self];
  [v6 takeSizeFromTracker:v8];

LABEL_6:
  id WeakRetained = objc_loadWeakRetained((id *)&self->mCanvas);
  [WeakRetained canvasInvalidatedForRep:self];
}

- (void)dynamicResizeDidEndWithTracker:(id)a3
{
  id v4 = [(CRLCanvasRep *)self layout];
  [v4 endResize];

  id WeakRetained = objc_loadWeakRetained((id *)&self->mCanvas);
  [WeakRetained canvasInvalidatedForRep:self];
}

- (id)newCommandToApplyGeometry:(id)a3 toInfo:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_opt_class();
  id v8 = sub_1002469D0(v7, v6);

  if (v8)
  {
    uint64_t v9 = [[_TtC8Freeform25CRLCommandSetInfoGeometry alloc] initWithBoardItem:v8 geometry:v5];
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E6110);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101091E20();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E6130);
    }
    double v10 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v10);
    }
    id v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasRep newCommandToApplyGeometry:toInfo:]");
    id v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRep.m"];
    +[CRLAssertionHandler handleFailureInFunction:v11 file:v12 lineNumber:3409 isFatal:0 description:"Can't create CRLCommandSetInfoGeometry without a boardItem."];

    uint64_t v9 = 0;
  }

  return v9;
}

- (BOOL)willHandleResizingLayoutForRep:(id)a3
{
  return 0;
}

- (void)dynamicFreeTransformDidBeginWithTracker:(id)a3
{
  id v4 = a3;
  if (![(CRLCanvasRep *)self isInDynamicOperation])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E6150);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101091EA8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E6170);
    }
    id v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    id v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasRep dynamicFreeTransformDidBeginWithTracker:]");
    uint64_t v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRep.m"];
    +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:3426 isFatal:0 description:"free transform begins without being in dynamic operation"];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->mCanvas);
  [WeakRetained canvasInvalidatedForRep:self];

  uint64_t v9 = [(CRLCanvasRep *)self layout];
  [v9 beginFreeTransformWithTracker:v4];
}

- (BOOL)isBeingFreeTransformed
{
  double v2 = [(CRLCanvasRep *)self layout];
  BOOL v3 = [v2 layoutState] == 5;

  return v3;
}

- (BOOL)isBeingFreeTransformDragged
{
  if ([(CRLCanvasRep *)self isBeingFreeTransformed])
  {
    BOOL v3 = [(CRLCanvasRep *)self layout];
    unint64_t v4 = (unint64_t)[v3 freeTransformState] & 1;
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (BOOL)isBeingFreeTransformRotated
{
  if ([(CRLCanvasRep *)self isBeingFreeTransformed])
  {
    BOOL v3 = [(CRLCanvasRep *)self layout];
    unint64_t v4 = ((unint64_t)[v3 freeTransformState] >> 1) & 1;
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (BOOL)isBeingFreeTransformResized
{
  if ([(CRLCanvasRep *)self isBeingFreeTransformed])
  {
    BOOL v3 = [(CRLCanvasRep *)self layout];
    unint64_t v4 = ((unint64_t)[v3 freeTransformState] >> 2) & 1;
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (BOOL)inFreeTransformRotateResizeMode
{
  if ([(CRLCanvasRep *)self isBeingFreeTransformed])
  {
    BOOL v3 = [(CRLCanvasRep *)self layout];
    unint64_t v4 = ((unint64_t)[v3 freeTransformState] >> 3) & 1;
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (NSString)actionStringForFreeTransform
{
  double v2 = +[NSBundle mainBundle];
  BOOL v3 = [v2 localizedStringForKey:@"Free Transform" value:0 table:@"UndoStrings"];

  return (NSString *)v3;
}

- (void)dynamicallyFreeTransformingWithTracker:(id)a3
{
  id v8 = a3;
  unint64_t v4 = [(CRLCanvasRep *)self layout];
  id v5 = [v8 selectedRepForLayout:v4];

  if (v5
    && (v5 == self
     || ![(CRLCanvasRep *)v5 willHandleFreeTransformingLayoutForRep:self]))
  {
    id v6 = [(CRLCanvasRep *)self layout];
    [v6 takeFreeTransformFromTracker:v8];
  }
  if ([(CRLCanvasRep *)self isBeingFreeTransformResized]
    || [(CRLCanvasRep *)self isBeingFreeTransformRotated])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->mCanvas);
    [WeakRetained canvasInvalidatedForRep:self];
  }
}

- (BOOL)willHandleFreeTransformingLayoutForRep:(id)a3
{
  return 0;
}

- (void)dynamicFreeTransformDidEndWithTracker:(id)a3
{
  unint64_t v4 = [(CRLCanvasRep *)self layout];
  [v4 endFreeTransform];

  id WeakRetained = objc_loadWeakRetained((id *)&self->mCanvas);
  [WeakRetained canvasInvalidatedForRep:self];
}

- (BOOL)handleSingleTapAtPoint:(CGPoint)a3 onKnob:(id)a4 inputType:(int64_t)a5
{
  return 0;
}

- (BOOL)handleDoubleTapAtPoint:(CGPoint)a3 onKnob:(id)a4 inputType:(int64_t)a5
{
  return 0;
}

- (BOOL)wantsEditMenuForTapAtPoint:(CGPoint)a3 onKnob:(id)a4
{
  return 0;
}

- (BOOL)wantsToManuallyHandleEditMenuTapAtPoint:(CGPoint)a3
{
  return 0;
}

- (BOOL)shouldIgnoreEditMenuTapAtPoint:(CGPoint)a3 withRecognizer:(id)a4
{
  return 0;
}

- (BOOL)shouldIgnoreSingleTapAtPoint:(CGPoint)a3 withRecognizer:(id)a4
{
  return 0;
}

- (BOOL)handledLassoTapAtPoint:(CGPoint)a3 withInputType:(int64_t)a4
{
  return 0;
}

- (BOOL)handledDirectTouchForDrawingModePencilOnlyAtPoint:(CGPoint)a3
{
  return 0;
}

- (BOOL)handleSingleTapAtPoint:(CGPoint)a3 inputType:(int64_t)a4
{
  unsigned int v5 = [(CRLCanvasRep *)self p_isNotSelectableDueToUnknownContent];
  if (v5) {
    [(CRLCanvasRep *)self p_showAlertForGroupWithUnknownContent];
  }
  id v6 = [(CRLCanvasRep *)self interactiveCanvasController];
  if ([v6 editingDisabled])
  {
    uint64_t v7 = [(CRLCanvasRep *)self hyperlinkRegions];
    id v8 = [v7 count];

    if (v8)
    {
      uint64_t v9 = [v6 layerHost];
      double v10 = [v9 asiOSCVC];
      LOBYTE(v5) = [v10 allowOpenLinkOnSingleTapForRepWhenEditingDisabled:self];
    }
  }

  return v5;
}

- (BOOL)handleDoubleTapAtPoint:(CGPoint)a3 inputType:(int64_t)a4
{
  return 0;
}

- (BOOL)handleMultipleTapAtPoint:(CGPoint)a3
{
  return 0;
}

- (BOOL)wantsToHandleTapsOnBehalfOfRepForSelecting
{
  return 0;
}

- (BOOL)wantsToHandleTapsWhenLocked
{
  return 0;
}

- (BOOL)wantsToHandleDoubleTapsWhenLocked
{
  return 0;
}

- (BOOL)shouldLayoutTilingLayer:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(CRLCanvasRep *)self interactiveCanvasController];
  unsigned __int8 v6 = [v5 shouldLayoutTilingLayer:v4];

  return v6;
}

- (CGRect)visibleBoundsForTilingLayer:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(CRLCanvasRep *)self interactiveCanvasController];
  [v5 visibleBoundsForTilingLayer:v4];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.CGFloat height = v17;
  result.size.CGFloat width = v16;
  result.origin.CGFloat y = v15;
  result.origin.CGFloat x = v14;
  return result;
}

- (void)processChangedProperty:(unint64_t)a3
{
  switch(a3)
  {
    case 6uLL:
      [(CRLCanvasRep *)self invalidateKnobPositions];
      goto LABEL_4;
    case 7uLL:
      [(CRLCanvasRep *)self invalidateKnobs];
LABEL_4:
      id v4 = [(CRLCanvasRep *)self interactiveCanvasController];
      [v4 invalidateCollaboratorHUDControllers];

      goto LABEL_9;
    case 8uLL:
      [(CRLCanvasRep *)self recursivelyPerformSelector:"p_invalidateContentLayers"];
      return;
    case 0xBuLL:
      [(CRLCanvasRep *)self invalidateKnobs];
      [(CRLCanvasRep *)self invalidateSelectionHighlightRenderable];
      if ([(CRLCanvasRep *)self isSelectedIgnoringLocking])
      {
        id v6 = [(CRLCanvasRep *)self interactiveCanvasController];
        [v6 updateMultiselectResizeInfoIfNeeded];
      }
      return;
    case 0xCuLL:
      [(CRLCanvasRep *)self invalidateKnobs];
      return;
    default:
      if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 6)
      {
LABEL_9:
        unsigned int v5 = [(CRLCanvasRep *)self ancestorRepForDrawingIntoLayer];

        if (v5)
        {
          [(CRLCanvasRep *)self setNeedsDisplay];
        }
      }
      return;
  }
}

- (BOOL)canEditWithEditor:(id)a3
{
  return 0;
}

- (void)willUpdateRenderable:(id)a3
{
}

- (void)didUpdateRenderable:(id)a3
{
}

- (BOOL)wantsChildRepLayerUpdatingCallsEvenWithNoChildren
{
  return 0;
}

- (NSArray)additionalRenderablesUnderRenderable
{
  BOOL v3 = +[NSMutableArray array];
  if (self->mShadowRenderable && [(CRLCanvasRep *)self shouldShowShadow]) {
    [v3 addObject:self->mShadowRenderable];
  }

  return (NSArray *)v3;
}

- (NSArray)additionalRenderablesToFadeDuringZoom
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = self->mKnobs;
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "shouldDisplayDirectlyOverRep", (void)v12)
          && [v9 wantsToFadeDuringZoom])
        {
          double v10 = [v9 renderable];
          [v3 addObject:v10];
        }
      }
      id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (BOOL)directlyManagesAdditionalPlatformViewUnderRenderable
{
  return 0;
}

- (UIView)additionalPlatformViewUnderRenderable
{
  return 0;
}

- (BOOL)directlyManagesAdditionalPlatformViewOverRenderable
{
  return 0;
}

- (UIView)additionalPlatformViewOverRenderable
{
  return 0;
}

- (id)i_additionalRenderablesOverRenderableIncludingKnobs
{
  id v3 = +[NSMutableArray array];
  id v4 = [(CRLCanvasRep *)self additionalRenderablesOverRenderable];
  [v3 addObjectsFromArray:v4];

  id v5 = [(CRLCanvasRep *)self interactiveCanvasController];
  id v6 = [(CRLCanvasRep *)self p_addRenderablesForKnobsToArray:v3 withDelegate:v5 isOverlay:0];

  return v6;
}

- (NSArray)additionalRenderablesOverRenderable
{
  return (NSArray *)&__NSArray0__struct;
}

- (BOOL)drawsDescendantsIntoLayer
{
  return 0;
}

- (BOOL)wantsRenderableToBeDescendedFromParentRepRenderable
{
  return 0;
}

- (NSSet)childrenToExcludeWhenDrawingDescendantsIntoLayer
{
  return +[NSSet set];
}

- (NSArray)allRenderables
{
  id v3 = +[NSMutableArray array];
  id v4 = [(CRLCanvasRep *)self interactiveCanvasController];
  id v5 = [v4 renderableForRep:self];
  [v3 crl_addNonNilObject:v5];

  id v6 = [(CRLCanvasRep *)self i_additionalRenderablesOverRenderableIncludingKnobs];
  [v3 addObjectsFromArray:v6];

  uint64_t v7 = [(CRLCanvasRep *)self additionalRenderablesUnderRenderable];
  [v3 addObjectsFromArray:v7];

  double v8 = [(CRLCanvasRep *)self overlayRenderables];
  [v3 addObjectsFromArray:v8];

  return (NSArray *)v3;
}

- (NSArray)allPlatformViews
{
  id v3 = objc_opt_new();
  id v4 = [(CRLCanvasRep *)self contentPlatformView];

  if (v4)
  {
    id v5 = [(CRLCanvasRep *)self contentPlatformView];
    [v3 addObject:v5];
  }
  id v6 = [(CRLCanvasRep *)self additionalPlatformViewOverRenderable];

  if (v6)
  {
    uint64_t v7 = [(CRLCanvasRep *)self additionalPlatformViewOverRenderable];
    [v3 addObject:v7];
  }
  double v8 = [(CRLCanvasRep *)self additionalPlatformViewUnderRenderable];

  if (v8)
  {
    double v9 = [(CRLCanvasRep *)self additionalPlatformViewUnderRenderable];
    [v3 addObject:v9];
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  double v10 = [(CRLCanvasRep *)self childReps];
  id v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v12; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        long long v15 = [*(id *)(*((void *)&v18 + 1) + 8 * i) allPlatformViews];
        [v3 addObjectsFromArray:v15];
      }
      id v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v12);
  }

  id v16 = [v3 copy];

  return (NSArray *)v16;
}

- (BOOL)masksToBounds
{
  return 0;
}

- (CGRect)rectToClipChildRepRenderables
{
  double x = CGRectNull.origin.x;
  double y = CGRectNull.origin.y;
  double width = CGRectNull.size.width;
  double height = CGRectNull.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (double)opacity
{
  return 1.0;
}

- (BOOL)isOpaque
{
  return 0;
}

- (BOOL)shouldShowDragHUD
{
  return 1;
}

- (BOOL)shouldShowSizesInRulers
{
  return 1;
}

- (BOOL)shouldSuppressFontSmoothing
{
  double v2 = [(CRLCanvasRep *)self canvas];
  id v3 = [v2 canvasController];

  if (v3) {
    unsigned __int8 v4 = [v3 shouldSuppressFontSmoothing];
  }
  else {
    unsigned __int8 v4 = 1;
  }

  return v4;
}

- (int64_t)dragTypeAtCanvasPoint:(CGPoint)a3 forTouchType:(int64_t)a4
{
  id v5 = [(CRLCanvasRep *)self repForSelecting];
  unsigned int v6 = [v5 isSelected];

  if (a4 == 3) {
    int v7 = 1;
  }
  else {
    int v7 = v6;
  }
  if (v7) {
    return 3;
  }
  else {
    return 1;
  }
}

- (BOOL)supportsAlternatePressureDrag
{
  return 0;
}

- (int64_t)dragHUDAndGuidesTypeAtCanvasPoint:(CGPoint)a3
{
  return 2;
}

- (BOOL)isPlaceholder
{
  return 0;
}

- (BOOL)isLocked
{
  double v2 = [(CRLCanvasRep *)self info];
  unsigned __int8 v3 = sub_10006B53C(v2);

  return v3;
}

- (BOOL)handlesEditMenu
{
  return 0;
}

- (NSArray)itemsToAddToEditMenu
{
  return (NSArray *)&__NSArray0__struct;
}

- (CGRect)targetRectForEditMenu
{
  double x = CGRectNull.origin.x;
  double y = CGRectNull.origin.y;
  double width = CGRectNull.size.width;
  double height = CGRectNull.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)wantsContextMenuAtPoint:(CGPoint)a3 withPlatformObject:(id)a4 onKnob:(id)a5
{
  return 1;
}

- (BOOL)handleContextMenuClickAtPoint:(CGPoint)a3 withPlatformObject:(id)a4 onKnob:(id)a5
{
  unsigned int v6 = [(CRLCanvasRep *)self repForSelecting];
  int v7 = v6;
  if (v6 && ([v6 isSelectedIgnoringLocking] & 1) == 0)
  {
    double v8 = [(CRLCanvasRep *)self interactiveCanvasController];
    double v9 = [v8 canvasEditor];

    double v10 = [v7 info];
    id v11 = [v9 selectionPathWithInfo:v10];
    id v12 = [(CRLCanvasRep *)self interactiveCanvasController];
    uint64_t v13 = [v12 editorController];
    [v13 setSelectionPath:v11];
  }
  return v7 != 0;
}

- (id)resizedGeometryForTransform:(CGAffineTransform *)a3
{
  id v5 = [(CRLCanvasRep *)self layout];
  unsigned int v6 = [v5 infoGeometryBeforeDynamicOperation];
  int v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    double v9 = [(CRLCanvasRep *)self info];
    id v8 = [v9 geometry];
  }
  long long v10 = *(_OWORD *)&a3->c;
  v13[0] = *(_OWORD *)&a3->a;
  v13[1] = v10;
  v13[2] = *(_OWORD *)&a3->tx;
  id v11 = [v8 geometryByAppendingTransform:v13];

  return v11;
}

- (unint64_t)adjustedKnobForComputingResizeGeometry:(unint64_t)a3
{
  return a3;
}

- (BOOL)canFlipDuringResize
{
  return 1;
}

- (BOOL)wantsGuidesWhileResizing
{
  return 1;
}

- (BOOL)wantsGuidesWhileDragging
{
  return 1;
}

- (BOOL)directlyManagesLayerContent
{
  return 0;
}

- (CGPoint)centerForRotation
{
  double v2 = [(CRLCanvasRep *)self layout];
  [v2 centerForRotation];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double y = v8;
  result.double x = v7;
  return result;
}

- (unint64_t)dragOperationForDragInfo:(id)a3 atUnscaledPoint:(CGPoint)a4
{
  return 0;
}

- (BOOL)handleDragOperation:(unint64_t)a3 withDragInfo:(id)a4 atUnscaledPoint:(CGPoint)a5
{
  return 0;
}

- (void)updateDragAndDropUIForPoint:(CGPoint)a3 dragInfo:(id)a4
{
  if (!self->mShowDragAndDropHighlight)
  {
    self->mShowDragAndDropHighlight = 1;
    id v5 = [(CRLCanvasRep *)self interactiveCanvasController];
    [v5 invalidateOverlayLayersForRep:self];
  }
}

- (void)hideDragAndDropUI
{
  if (self->mShowDragAndDropHighlight)
  {
    self->mShowDragAndDropHighlight = 0;
    mDragAndDropHighlightRenderable = self->mDragAndDropHighlightRenderable;
    self->mDragAndDropHighlightRenderable = 0;

    id v4 = [(CRLCanvasRep *)self interactiveCanvasController];
    [v4 invalidateOverlayLayersForRep:self];
  }
}

- (CGPath)newHighlightPathInScaledSpace
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mCanvas);
  [WeakRetained viewScale];
  CGFloat v5 = v4;

  [(CRLCanvasRep *)self boundsForHighlightLayer];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  memset(&transform, 0, sizeof(transform));
  [(CRLCanvasRep *)self transformForHighlightLayer];
  CGAffineTransformMakeScale(&t2, v5, v5);
  CGAffineTransform v15 = transform;
  CGAffineTransformConcat(&v17, &v15, &t2);
  CGAffineTransform transform = v17;
  v19.origin.double x = v7;
  v19.origin.double y = v9;
  v19.size.double width = v11;
  v19.size.double height = v13;
  return CGPathCreateWithRect(v19, &transform);
}

- (CRLCanvasRenderable)dragAndDropHighlightRenderable
{
  mDragAndDropHighlightRenderable = self->mDragAndDropHighlightRenderable;
  if (!mDragAndDropHighlightRenderable)
  {
    double v4 = [(CRLCanvasRep *)self p_highlightRenderable];
    CGFloat v5 = self->mDragAndDropHighlightRenderable;
    self->mDragAndDropHighlightRenderable = v4;

    mDragAndDropHighlightRenderable = self->mDragAndDropHighlightRenderable;
  }

  return mDragAndDropHighlightRenderable;
}

- (id)p_highlightRenderable
{
  double v3 = [(CRLCanvasRep *)self newHighlightPathInScaledSpace];
  double v4 = [CRLDragAndDropCanvasHighlightDecorator alloc];
  CGFloat v5 = [(CRLCanvasRep *)self interactiveCanvasController];
  double v6 = [(CRLDragAndDropCanvasHighlightDecorator *)v4 initWithInteractiveCanvasController:v5 highlightPath:v3];

  CFRelease(v3);
  CGFloat v7 = [(CRLDragAndDropCanvasHighlightDecorator *)v6 dragAndDropHighlightRenderable];

  return v7;
}

- (BOOL)shouldSelectInfoWhenTargetOfDrag:(id)a3
{
  return 1;
}

- (int64_t)tilingMode
{
  return 0;
}

- (BOOL)directlyManagesContentPlatformView
{
  return 0;
}

- (UIView)contentPlatformView
{
  return 0;
}

- (BOOL)wantsToDistortWithImagerContext
{
  return 0;
}

- (NSArray)hyperlinkRegions
{
  uint64_t v3 = objc_opt_class();
  double v4 = [(CRLCanvasRep *)self info];
  CGFloat v5 = sub_1002469D0(v3, v4);

  if (!v5) {
    goto LABEL_6;
  }
  uint64_t v6 = [v5 hyperlinkURL];
  if (!v6) {
    goto LABEL_6;
  }
  CGFloat v7 = (void *)v6;
  double v8 = [v5 hyperlinkURL];
  CGFloat v9 = [v8 absoluteString];
  id v10 = [v9 length];

  if (v10)
  {
    uint64_t v11 = objc_opt_class();
    double v12 = [(CRLCanvasRep *)self layout];
    CGFloat v13 = sub_1002469D0(v11, v12);

    if (v13)
    {
      long long v14 = [v13 i_wrapPath];
      CGAffineTransform v15 = [CRLHyperlinkRegion alloc];
      id v16 = [v5 hyperlinkURL];
      CGAffineTransform v17 = [(CRLHyperlinkRegion *)v15 initWithURL:v16 bezierPath:v14];

      long long v18 = +[NSArray arrayWithObject:v17];
    }
    else
    {
      long long v18 = &__NSArray0__struct;
    }
  }
  else
  {
LABEL_6:
    long long v18 = &__NSArray0__struct;
  }

  return (NSArray *)v18;
}

- (BOOL)crlaxShouldSetAccessibilityFrameWithFrameInUnscaledCanvasForMarqueeSelecting
{
  return 0;
}

- (BOOL)containsUnknownContent
{
  double v2 = [(CRLCanvasRep *)self info];
  char v3 = [v2 isSupported] ^ 1;

  return v3;
}

- (id)contextMenuConfigurationAtPoint:(CGPoint)a3
{
  return 0;
}

- (id)contextMenuPreviewForHighlightingMenuAtPoint:(CGPoint)a3 withConfiguration:(id)a4
{
  return 0;
}

- (BOOL)wantsContextMenuWhenEditingDisabledAtPoint:(CGPoint)a3
{
  return 0;
}

- (CGPoint)p_centerForPreviewFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double v5 = sub_100065738(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (width < 50.0 && height < 50.0) {
    double v6 = v6 + (50.0 - height) * -0.5;
  }
  result.double y = v6;
  result.double x = v5;
  return result;
}

- (id)dragItemsForBeginningDragAtPoint:(CGPoint)a3
{
  double v4 = &off_1014C1000;
  double v5 = +[NSMutableArray array];
  double v6 = [(CRLCanvasRep *)self interactiveCanvasController];
  CGFloat v7 = [(CRLCanvasRep *)self repForSelecting];
  uint64_t v8 = objc_opt_class();
  CGFloat v9 = [v7 info];
  id v10 = sub_1002469D0(v8, v9);

  if ([v10 allowedToBeDragAndDropped])
  {
    if ([v7 isSelected]
      && ([v6 canvasEditor],
          uint64_t v11 = objc_claimAutoreleasedReturnValue(),
          unsigned int v12 = [v11 canvasEditorCanCopyWithSender:0],
          v11,
          v12))
    {
      CGFloat v13 = [v6 selectionModelTranslator];
      long long v14 = [v6 editorController];
      CGAffineTransform v15 = [v14 selectionPath];
      uint64_t v16 = [v13 boardItemsForSelectionPath:v15];

      CGAffineTransform v17 = (void *)v16;
      double v4 = &off_1014C1000;
    }
    else
    {
      long long v18 = [v6 layerHost];
      CGRect v19 = [v18 asiOSCVC];
      CGFloat v13 = [v19 delegate];

      if ((objc_opt_respondsToSelector() & 1) != 0
        && ([v13 currentDocumentMode],
            long long v20 = objc_claimAutoreleasedReturnValue(),
            unsigned int v21 = [v20 allowsDragOnUnselectedReps],
            v20,
            v21)
        && ([v10 shouldBeIgnoredWhenCopying] & 1) == 0)
      {
        CGAffineTransform v17 = +[NSSet setWithObject:v10];
      }
      else
      {
        CGAffineTransform v17 = 0;
      }
    }

    if ([v17 count])
    {
      double v53 = v7;
      double v49 = v5;
      long long v54 = objc_alloc_init(CRLItemProviderItemWriter);
      double v22 = [v6 topLevelZOrderedSiblingsOfInfos:v17];
      double v51 = v17;
      double v23 = [v22 crl_arrayWithObjectsInSet:v17];

      CGAffineTransform v24 = [(__objc2_class *)v4[76] array];
      long long v60 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      id v25 = v23;
      id v26 = [v25 countByEnumeratingWithState:&v60 objects:v65 count:16];
      if (v26)
      {
        id v27 = v26;
        uint64_t v28 = *(void *)v61;
        do
        {
          for (uint64_t i = 0; i != v27; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v61 != v28) {
              objc_enumerationMutation(v25);
            }
            double v30 = *(void **)(*((void *)&v60 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v31 = v30;
              if ([v31 allowedToBeDragAndDropped]) {
                [v24 addObject:v31];
              }
            }
          }
          id v27 = [v25 countByEnumeratingWithState:&v60 objects:v65 count:16];
        }
        while (v27);
      }
      double v48 = self;
      double v52 = v10;
      double v50 = v25;

      double v32 = +[NSMutableArray array];
      CGFloat v33 = +[UIColor clearColor];
      long long v56 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      id v34 = v24;
      id v35 = [v34 countByEnumeratingWithState:&v56 objects:v64 count:16];
      if (v35)
      {
        id v36 = v35;
        uint64_t v37 = *(void *)v57;
        do
        {
          for (j = 0; j != v36; j = (char *)j + 1)
          {
            if (*(void *)v57 != v37) {
              objc_enumerationMutation(v34);
            }
            double v39 = [v6 repForInfo:*(void *)(*((void *)&v56 + 1) + 8 * (void)j)];
            double v40 = [v39 unscaledPathToIncludeForSystemPreviewOutline];
            if (v40) {
              [v32 addObject:v40];
            }
            if ([v34 count] == (id)1)
            {
              uint64_t v41 = [v39 backgroundColorForDragPreview];

              CGFloat v33 = (void *)v41;
            }
          }
          id v36 = [v34 countByEnumeratingWithState:&v56 objects:v64 count:16];
        }
        while (v36);
      }

      id v55 = 0;
      double v42 = [(CRLItemProviderItemWriter *)v54 createItemProviderWithCopyOfBoardItems:v34 fromInteractiveCanvasController:v6 outCopiedBoardItems:&v55];
      id v43 = v55;
      if (v42)
      {
        double v5 = [(CRLCanvasRep *)v48 dragItemsForBeginningDragWithItemProvider:v42 deepCopiedBoardItems:v43 withUnscaledTracedPaths:v32 previewBackgroundColor:v33 localObjectProvider:0];
        double v44 = v49;
      }
      else
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014E6190);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_101091F30();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014E61B0);
        }
        double v5 = v49;
        double v45 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10106590C(v45);
        }
        double v44 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasRep dragItemsForBeginningDragAtPoint:]");
        double v46 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRep.m"];
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v44, v46, 4269, 0, "invalid nil value for '%{public}s'", "itemProvider");
      }
      CGAffineTransform v17 = v51;

      id v10 = v52;
      CGFloat v7 = v53;
    }
  }

  return v5;
}

- (id)dragItemsForBeginningDragWithItemProvider:(id)a3 deepCopiedBoardItems:(id)a4 withUnscaledTracedPaths:(id)a5 previewBackgroundColor:(id)a6 localObjectProvider:(id)a7
{
  id v47 = a3;
  id v12 = a4;
  id v46 = a5;
  id v44 = a6;
  id v45 = a7;
  CGFloat v13 = [(CRLCanvasRep *)self interactiveCanvasController];
  long long v14 = [(CRLCanvasRep *)self p_newImagerToGenerateSystemPreviewOfBoardItems:v12];
  [v14 unscaledClipRect];
  double v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  id v23 = [v14 newImage];
  v68[0] = 0;
  v68[1] = v68;
  v68[2] = 0x3032000000;
  v68[3] = sub_100260C80;
  v68[4] = sub_100260C90;
  id v69 = 0;
  dispatch_semaphore_t v24 = dispatch_semaphore_create(0);
  if (v23)
  {
    id v25 = objc_alloc_init((Class)UIView);
    id v26 = [v25 layer];
    [v26 setContents:v23];

    id v27 = [(CRLCanvasRep *)self interactiveCanvasController];
    [v27 viewScale];
    [v25 setFrame:sub_1000652FC(v16, v18, v20, v22, v28)];

    CGFloat v29 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100268DB0;
    block[3] = &unk_1014E61D8;
    id v57 = v46;
    id v58 = v12;
    long long v62 = v68;
    double v63 = v16;
    CGFloat v64 = v18;
    CGFloat v65 = v20;
    CGFloat v66 = v22;
    id v59 = v13;
    id v67 = v23;
    id v60 = v14;
    long long v61 = v24;
    dispatch_async(v29, block);

    double v30 = v57;
  }
  else
  {
    int v31 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E61F8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101091FC4((uint64_t)v12, v31);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E6218);
    }
    double v32 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_ERROR))
    {
      CGFloat v33 = +[CRLAssertionHandler packedBacktraceString];
      sub_10106CDAC(v33, buf, v31, (os_log_t)v32);
    }

    double v30 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasRep dragItemsForBeginningDragWithItemProvider:deepCopiedBoardItems:withUnscaledTracedPaths:previewBackgroundColor:localObjectProvider:]");
    id v34 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRep.m"];
    +[CRLAssertionHandler handleFailureInFunction:v30, v34, 4333, 0, "Unable to make a preview drag image for infos %@", v12, v44 file lineNumber isFatal description];

    id v25 = 0;
  }

  id v35 = [CRLiOSCanvasDragItem alloc];
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472;
  v48[2] = sub_100268FD8;
  v48[3] = &unk_1014E6240;
  id v36 = v25;
  id v49 = v36;
  uint64_t v37 = v24;
  double v50 = v37;
  id v55 = v68;
  id v38 = v13;
  id v51 = v38;
  double v52 = self;
  id v39 = v44;
  id v53 = v39;
  id v40 = v45;
  id v54 = v40;
  uint64_t v41 = [(CRLiOSCanvasDragItem *)v35 initWithItemProvider:v47 previewGeneratingBlock:v48];
  double v70 = v41;
  double v42 = +[NSArray arrayWithObjects:&v70 count:1];

  _Block_object_dispose(v68, 8);

  return v42;
}

- (id)p_newImagerToGenerateSystemPreviewOfBoardItems:(id)a3
{
  id v4 = a3;
  double v5 = [(CRLCanvasRep *)self interactiveCanvasController];
  double v6 = [(CRLCanvasRep *)self canvas];
  CGFloat v7 = [CRLCanvasImager alloc];
  uint64_t v8 = [(CRLCanvasRep *)self interactiveCanvasController];
  CGFloat v9 = [v8 board];
  id v10 = [(CRLCanvasImager *)v7 initWithBoard:v9];

  [(CRLCanvasImager *)v10 setInfos:v4];
  [v5 viewScale];
  -[CRLCanvasImager setViewScale:](v10, "setViewScale:");
  uint64_t v11 = [(CRLCanvasImager *)v10 canvas];
  [v11 setSuppressesShadowsAndReflections:1];
  [v11 setShouldRenderInvisibleContentForNonInteractiveCanvas:1];
  [v6 viewScale];
  [v11 setI_viewScaleForAudioObjectsInNonInteractiveCanvas:];
  [v6 contentsScale];
  -[CRLCanvasImager setContentsScale:](v10, "setContentsScale:");
  double v12 = sub_100454A60();
  double v14 = v13;
  [(CRLCanvasImager *)v10 actualScaledClipRect];
  double v18 = v17;
  CGFloat v20 = v19;
  CGFloat v21 = v15;
  if (v16 > v14 || (v22 = v16, double v14 = v16, v15 > v12))
  {
    if (v12 < v15) {
      CGFloat v21 = v12;
    }
    CGFloat v22 = v14;
  }
  id v23 = [(CRLCanvasImager *)v10 canvas];
  [v23 viewScale];
  double v25 = sub_1000652FC(v18, v20, v21, v22, 1.0 / v24);
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;

  -[CRLCanvasImager setUnscaledClipRect:](v10, "setUnscaledClipRect:", v25, v27, v29, v31);

  return v10;
}

- (BOOL)shouldOverrideParentForBeginningDragAtPoint:(CGPoint)a3
{
  return 0;
}

- (id)dragItemsForBeginningDragOfChildRep:(id)a3
{
  return 0;
}

- (BOOL)allowDragOnPhoneAtPoint:(CGPoint)a3
{
  return 1;
}

- (BOOL)supportsAlternateLiftDelay:(double)a3
{
  return 0;
}

- (id)backgroundColorForDragPreview
{
  return +[UIColor clearColor];
}

- (BOOL)wantsBestGuessCanvasBackgroundColorForContextMenuPreview
{
  return 1;
}

- (id)backgroundColorForContextMenuPreview
{
  return +[UIColor clearColor];
}

- (id)unscaledPathToIncludeForSystemPreviewOutline
{
  char v3 = [(CRLCanvasRep *)self layout];
  id v4 = [v3 i_wrapPath];
  id v5 = [v4 copy];

  if (!v5 || [v5 isEmpty])
  {
    [(CRLCanvasRep *)self boundsForStandardKnobs];
    uint64_t v6 = +[CRLBezierPath bezierPathWithRect:](CRLBezierPath, "bezierPathWithRect:");

    id v5 = (id)v6;
  }
  if (v3) {
    [v3 transformInRoot];
  }
  else {
    memset(v10, 0, sizeof(v10));
  }
  [v5 transformUsingAffineTransform:v10];
  CGFloat v7 = [v5 arrayOfSubpathsWithEffectivelyEmptySubpathsRemoved:0];
  uint64_t v8 = +[CRLBezierPath uniteBezierPaths:v7];

  return v8;
}

- (BOOL)shouldPreventMarqueeInitiationAtPoint:(CGPoint)a3 withTouchType:(int64_t)a4
{
  id v5 = [(CRLCanvasRep *)self repForDragging];
  if (v5)
  {
    unsigned __int8 v6 = 1;
  }
  else
  {
    CGFloat v7 = [(CRLCanvasRep *)self repForSelecting];
    unsigned __int8 v6 = [v7 demandsExclusiveSelection];
  }
  return v6;
}

- (BOOL)shouldBeginScribbleAtPoint:(CGPoint)a3
{
  return ![(CRLCanvasRep *)self isLocked];
}

- (BOOL)handleSingleTapsWhileExtendingSelectionAtPoint:(CGPoint)a3 inputType:(int64_t)a4
{
  return 0;
}

- (BOOL)isCollaboratorCursorRenderableValid
{
  return self->mCollaboratorCursorRenderableValid;
}

- (CRLCanvas)canvas
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mCanvas);

  return (CRLCanvas *)WeakRetained;
}

- (CRLCanvasRep)parentRep
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mParentRep);

  return (CRLCanvasRep *)WeakRetained;
}

- (CRLCanvasKnobTracker)currentKnobTracker
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mKnobTracker);

  return (CRLCanvasKnobTracker *)WeakRetained;
}

- (void)setCurrentKnobTracker:(id)a3
{
}

- (BOOL)showKnobsDuringManipulation
{
  return self->mShowKnobsWhenManipulated;
}

- (void)setShowKnobsDuringManipulation:(BOOL)a3
{
  self->BOOL mShowKnobsWhenManipulated = a3;
}

- (BOOL)knobsAreShowing
{
  return self->mKnobsAreShowing;
}

- (BOOL)isSelectionHighlightRenderableValid
{
  return self->mSelectionHighlightRenderableValid;
}

- (CRLCanvasRenderable)shadowRenderable
{
  return self->mShadowRenderable;
}

- (BOOL)shouldShowDragAndDropHighlight
{
  return self->mShowDragAndDropHighlight;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mShadowRenderable, 0);
  objc_storeStrong((id *)&self->mProgressBarWhiteBackingRenderable, 0);
  objc_storeStrong((id *)&self->mProgressBarRenderable, 0);
  objc_storeStrong((id *)&self->mKnobs, 0);
  objc_storeStrong((id *)&self->mKnobsAccessQueue, 0);
  objc_storeStrong((id *)&self->mLastGeometryInRoot, 0);
  objc_storeStrong((id *)&self->mLayout, 0);
  objc_storeStrong((id *)&self->mDragAndDropHighlightRenderable, 0);
  objc_storeStrong((id *)&self->mCollaboratorCursorRenderable, 0);
  objc_storeStrong((id *)&self->mSelectionHighlightRenderable, 0);
  objc_destroyWeak((id *)&self->mKnobTracker);
  objc_storeStrong((id *)&self->mChildReps, 0);
  objc_destroyWeak((id *)&self->mParentRep);

  objc_destroyWeak((id *)&self->mCanvas);
}

- (id)getConnectionLineLayoutToCopyStyleForNewConnectionLine
{
  double v2 = self;
  id v3 = sub_1007A66A8();

  return v3;
}

@end