@interface TSDRep
- (BOOL)allowTrackingContainedRep:(id)a3;
- (BOOL)canClipThemeContentToCanvas;
- (BOOL)canDrawInBackgroundDuringScroll;
- (BOOL)canDrawInParallel;
- (BOOL)canDrawTilingLayerInBackground:(id)a3;
- (BOOL)canEditWithEditor:(id)a3;
- (BOOL)canUseSpecializedHitRegionForKnob:(id)a3;
- (BOOL)containsPoint:(CGPoint)a3;
- (BOOL)containsPoint:(CGPoint)a3 withSlop:(CGSize)a4;
- (BOOL)directlyManagesLayerContent;
- (BOOL)directlyManagesVisibilityOfKnob:(id)a3;
- (BOOL)forceRasterization;
- (BOOL)forcesPlacementOnTop;
- (BOOL)handleDoubleTapAtPoint:(CGPoint)a3;
- (BOOL)handleDoubleTapAtPoint:(CGPoint)a3 onKnob:(id)a4;
- (BOOL)handleSingleTapAtPoint:(CGPoint)a3;
- (BOOL)handleSingleTapAtPoint:(CGPoint)a3 onKnob:(id)a4;
- (BOOL)handlesEditMenu;
- (BOOL)hasBeenRemoved;
- (BOOL)i_hasInteractiveCanvasController;
- (BOOL)intersectsUnscaledRect:(CGRect)a3;
- (BOOL)isBeingRotated;
- (BOOL)isDraggable;
- (BOOL)isDrawingInFlippedContext;
- (BOOL)isEditingPath;
- (BOOL)isInDynamicOperation;
- (BOOL)isLocked;
- (BOOL)isOpaque;
- (BOOL)isPlaceholder;
- (BOOL)isSelected;
- (BOOL)isSelectedIgnoringLocking;
- (BOOL)isVisibleOnCanvas;
- (BOOL)layerUpdatesPaused;
- (BOOL)masksToBounds;
- (BOOL)mustDrawOnMainThreadForInteractiveCanvas;
- (BOOL)mustDrawTilingLayerOnMainThread:(id)a3;
- (BOOL)repDirectlyManagesContentsScaleOfLayer:(id)a3;
- (BOOL)resizeFromCenterOnly;
- (BOOL)shouldBeginDrawingTilingLayerInBackground:(id)a3 returningToken:(id *)a4 andQueue:(id *)a5;
- (BOOL)shouldCreateCommentKnob;
- (BOOL)shouldCreateKnobs;
- (BOOL)shouldCreateLockedKnobs;
- (BOOL)shouldCreateSelectionKnobs;
- (BOOL)shouldDisplayHyperlinkUI;
- (BOOL)shouldExpandHitRegionWhenSmall;
- (BOOL)shouldIgnoreEditMenuTapAtPoint:(CGPoint)a3 withRecognizer:(id)a4;
- (BOOL)shouldIgnoreSingleTapAtPoint:(CGPoint)a3 withRecognizer:(id)a4;
- (BOOL)shouldLayoutTilingLayer:(id)a3;
- (BOOL)shouldShowCommentHighlight;
- (BOOL)shouldShowCommentUIDirectlyOverRep;
- (BOOL)shouldShowDragHUD;
- (BOOL)shouldShowKnobs;
- (BOOL)shouldShowSelectionHighlight;
- (BOOL)shouldShowSizesInRulers;
- (BOOL)wantsEditMenuForTapAtPoint:(CGPoint)a3 onKnob:(id)a4;
- (BOOL)wantsGuidesWhileResizing;
- (BOOL)wantsToDistortWithImagerContext;
- (BOOL)wantsToHandleTapsOnContainingGroup;
- (BOOL)wantsToHandleTapsWhenLocked;
- (CGAffineTransform)layerTransform;
- (CGAffineTransform)layerTransformInRootForZeroAnchor;
- (CGAffineTransform)parentLayerInverseTransformInRootForZeroAnchor;
- (CGAffineTransform)transformForHighlightLayer;
- (CGAffineTransform)transformToConvertNaturalFromLayerRelative;
- (CGAffineTransform)transformToConvertNaturalToLayerRelative;
- (CGAffineTransform)unRotatedTransform:(SEL)a3;
- (CGColor)selectionHighlightColor;
- (CGPath)newPathInScaledCanvasFromNaturalRect:(CGRect)a3;
- (CGPoint)centerForRotation;
- (CGPoint)convertKnobPositionToUnscaledCanvas:(CGPoint)a3;
- (CGPoint)convertNaturalPointFromLayerRelative:(CGPoint)a3;
- (CGPoint)convertNaturalPointFromUnscaledCanvas:(CGPoint)a3;
- (CGPoint)convertNaturalPointToLayerRelative:(CGPoint)a3;
- (CGPoint)convertNaturalPointToUnscaledCanvas:(CGPoint)a3;
- (CGPoint)convertUnscaledPointFromLayerRelative:(CGPoint)a3;
- (CGPoint)convertUnscaledPointToLayerRelative:(CGPoint)a3;
- (CGPoint)i_dragOffset;
- (CGPoint)layerOffsetForDragging;
- (CGPoint)p_positionOfActionGhostKnobForBounds:(CGRect)a3;
- (CGPoint)positionOfActionGhostKnob;
- (CGPoint)positionOfHyperlinkKnob;
- (CGPoint)positionOfStandardKnob:(id)a3 forBounds:(CGRect)a4;
- (CGPoint)unscaledGuidePosition;
- (CGRect)boundsForStandardKnobs;
- (CGRect)convertNaturalRectFromLayerRelative:(CGRect)a3;
- (CGRect)convertNaturalRectFromUnscaledCanvas:(CGRect)a3;
- (CGRect)convertNaturalRectToLayerRelative:(CGRect)a3;
- (CGRect)convertNaturalRectToUnscaledCanvas:(CGRect)a3;
- (CGRect)frameInScreenSpace;
- (CGRect)frameInUnscaledCanvas;
- (CGRect)i_layerFrameInScaledCanvasIgnoringDragging;
- (CGRect)i_originalLayerFrameInScaledCanvas;
- (CGRect)i_partition_deepClipRect;
- (CGRect)layerFrameInScaledCanvas;
- (CGRect)layerFrameInScaledCanvasRelativeToParent;
- (CGRect)naturalBounds;
- (CGRect)targetRectForEditMenu;
- (CGRect)trackingBoundsForStandardKnobs;
- (CGRect)visibleBoundsForTilingLayer:(id)a3;
- (Class)layerClass;
- (NSArray)hyperlinkRegions;
- (NSArray)knobs;
- (NSDictionary)textureActionAttributes;
- (NSDictionary)textureAnimationInfo;
- (NSString)description;
- (TSDCanvas)canvas;
- (TSDContainerRep)parentRep;
- (TSDInteractiveCanvasController)interactiveCanvasController;
- (TSDKnobTracker)currentKnobTracker;
- (TSDLayout)layout;
- (TSDLayout)temporaryMixingLayout;
- (TSDRep)initWithLayout:(id)a3 canvas:(id)a4;
- (TSDTextureContext)textureContext;
- (TSDTextureSet)texture;
- (double)additionalRotationForKnobOrientation;
- (double)angleForRotation;
- (double)angleInRoot;
- (double)opacity;
- (double)scaleToConvertNaturalToLayerRelative;
- (double)selectionHighlightWidth;
- (double)shortestDistanceToPoint:(CGPoint)a3 countAsHit:(BOOL *)a4;
- (double)textureAngle;
- (id)additionalLayersOverLayer;
- (id)additionalLayersUnderLayer;
- (id)additionalRepsForDragging;
- (id)allLayers;
- (id)beginEditing;
- (id)colorBehindLayer:(id)a3;
- (id)connectedReps;
- (id)delegateConformingToProtocol:(id)a3 forRep:(id)a4;
- (id)hitRep:(CGPoint)a3;
- (id)hitRep:(CGPoint)a3 withGesture:(id)a4 passingTest:(id)a5;
- (id)hitRepChrome:(CGPoint)a3;
- (id)hitRepChrome:(CGPoint)a3 passingTest:(id)a4;
- (id)hitReps:(CGPoint)a3 withSlop:(CGSize)a4;
- (id)hitReps:(CGPoint)a3 withSlopBlock:(id)a4;
- (id)i_queueForTileProvider;
- (id)i_tileQueue;
- (id)info;
- (id)itemsToAddToEditMenu;
- (id)knobForTag:(unint64_t)a3;
- (id)newSelectionKnobForType:(int)a3 tag:(unint64_t)a4;
- (id)newTrackerForKnob:(id)a3;
- (id)overlayLayers;
- (id)p_addLayersForKnobsToArray:(id)a3 withDelegate:(id)a4 isOverlay:(BOOL)a5;
- (id)parentRepToPerformSelecting;
- (id)popoutLayers;
- (id)queueForDrawingTilingLayerInBackground:(id)a3;
- (id)repForDragging;
- (id)repForRotating;
- (id)repForSelecting;
- (id)selectionHighlightLayer;
- (id)subviewsController;
- (id)textureForContext:(id)a3;
- (int)dragHUDAndGuidesTypeAtCanvasPoint:(CGPoint)a3;
- (int)dragTypeAtCanvasPoint:(CGPoint)a3;
- (int)textureByGlyphStyle;
- (int)tilingMode;
- (unint64_t)adjustedKnobForComputingResizeGeometry:(unint64_t)a3;
- (unint64_t)enabledKnobMask;
- (unint64_t)textureDeliveryStyle;
- (unint64_t)textureStage;
- (void)addActionGhostKnobToArrayIfNecessary:(id)a3;
- (void)addKnobsToArray:(id)a3;
- (void)addLockedKnobsToArray:(id)a3;
- (void)addSelectionKnobsToArray:(id)a3;
- (void)addToSet:(id)a3;
- (void)antiAliasDefeatLayerFrame:(CGRect *)a3 forTransform:(CGAffineTransform *)a4;
- (void)antiAliasDefeatLayerTransform:(CGAffineTransform *)a3 forFrame:(CGRect)a4;
- (void)becameNotSelected;
- (void)becameSelected;
- (void)computeDirectLayerFrame:(CGRect *)a3 andTransform:(CGAffineTransform *)a4;
- (void)computeDirectLayerFrame:(CGRect *)a3 andTransform:(CGAffineTransform *)a4 basedOnLayoutGeometry:(id)a5;
- (void)computeDirectLayerFrame:(CGRect *)a3 andTransform:(CGAffineTransform *)a4 basedOnTransform:(CGAffineTransform *)a5 andSize:(CGSize)a6;
- (void)dealloc;
- (void)didDrawInLayer:(id)a3 context:(CGContext *)a4;
- (void)didEndDrawingTilingLayerInBackground:(id)a3 withToken:(id)a4;
- (void)dynamicRotateDidBegin;
- (void)fadeKnobsIn;
- (void)fadeKnobsOut;
- (void)i_invalidateSelectionHighlightLayer;
- (void)i_shutdownTileQueue;
- (void)i_willBeRemoved;
- (void)invalidateAnnotationColor;
- (void)invalidateKnobPositions;
- (void)invalidateKnobs;
- (void)layoutInRootChangedFrom:(id)a3 to:(id)a4 translatedOnly:(BOOL)a5;
- (void)markTextureDirty;
- (void)p_actionGhostKnobHit;
- (void)p_dynamicRotateDidBegin;
- (void)p_setMagicMoveTextureAttributes:(id)a3;
- (void)p_toggleHyperlinkUIVisibility;
- (void)pauseLayerUpdates;
- (void)processChangedProperty:(int)a3;
- (void)processChanges:(id)a3;
- (void)recursivelyDrawChildrenInContext:(CGContext *)a3;
- (void)recursivelyDrawInContext:(CGContext *)a3;
- (void)recursivelyPerformSelector:(SEL)a3;
- (void)recursivelyPerformSelector:(SEL)a3 withObject:(id)a4;
- (void)recursivelyPerformSelectorIfImplemented:(SEL)a3;
- (void)recursivelyPerformSelectorIfImplemented:(SEL)a3 withObject:(id)a4;
- (void)recursivelyPerformSelectorIfImplemented:(SEL)a3 withObject:(id)a4 withObject:(id)a5;
- (void)replaceContentsFromRep:(id)a3;
- (void)resumeLayerUpdates;
- (void)resumeLayerUpdatesAndLayoutImmediately;
- (void)screenScaleDidChange;
- (void)scrollRectToVisible:(CGRect)a3 animated:(BOOL)a4;
- (void)setCurrentKnobTracker:(id)a3;
- (void)setForceRasterization:(BOOL)a3;
- (void)setNeedsDisplay;
- (void)setNeedsDisplayInRect:(CGRect)a3;
- (void)setParentRep:(id)a3;
- (void)setSelectionHighlightColor:(CGColor *)a3;
- (void)setTemporaryMixingLayout:(id)a3;
- (void)setTexture:(id)a3;
- (void)setTextureActionAttributes:(id)a3;
- (void)setTextureByGlyphStyle:(int)a3;
- (void)setTextureContext:(id)a3;
- (void)setTextureDeliveryStyle:(unint64_t)a3;
- (void)setupForDrawingInLayer:(id)a3 context:(CGContext *)a4;
- (void)showKnobsDuringManipulation:(BOOL)a3;
- (void)turnKnobsOn;
- (void)updateFromLayout;
- (void)updateLayerGeometryFromLayout:(id)a3;
- (void)updatePositionsOfKnobs:(id)a3;
- (void)viewScaleDidChange;
- (void)willReplaceContentsFromRep:(id)a3;
- (void)willUpdateLayer:(id)a3;
@end

@implementation TSDRep

- (TSDRep)initWithLayout:(id)a3 canvas:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)TSDRep;
  v6 = [(TSDRep *)&v9 init];
  v7 = v6;
  if (v6)
  {
    if (a3)
    {
      v6->mLayout = (TSDLayout *)a3;
      v7->mCanvas = (TSDCanvas *)a4;
      objc_msgSend(a4, "i_registerRep:", v7);
      v7->mShowKnobsWhenManipulated = 0;
    }
    else
    {

      v7 = 0;
    }
  }
  __dmb(0xBu);
  return v7;
}

- (void)dealloc
{
  [(TSDTilingBackgroundQueue *)self->mTileQueue shutdown];

  mTileProviderQueue = self->mTileProviderQueue;
  if (mTileProviderQueue) {
    dispatch_release(mTileProviderQueue);
  }
  CGColorRelease(self->mDefaultSelectionHighlightColor);
  [(CALayer *)self->mSelectionHighlightLayer setDelegate:0];

  self->mCanvas = 0;
  v4.receiver = self;
  v4.super_class = (Class)TSDRep;
  [(TSDRep *)&v4 dealloc];
}

- (NSString)description
{
  v3 = NSString;
  objc_super v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [(TSDRep *)self info];
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  id v8 = [(TSDRep *)self info];
  [(TSDRep *)self layout];
  objc_super v9 = (objc_class *)objc_opt_class();
  v10 = NSStringFromClass(v9);
  v11 = [(TSDRep *)self layout];
  [(TSDRep *)self frameInUnscaledCanvas];
  return (NSString *)[v3 stringWithFormat:@"<%@ %p info=<%@ %p> layout=<%@ %p> frameInUnscaledCanvas=%@>", v5, self, v7, v8, v10, v11, NSStringFromCGRect(v13)];
}

- (BOOL)i_hasInteractiveCanvasController
{
  return [(TSDCanvas *)self->mCanvas canvasController] != 0;
}

- (TSDInteractiveCanvasController)interactiveCanvasController
{
  if (![(TSDCanvas *)self->mCanvas canvasController])
  {
    v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSDRep interactiveCanvasController]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDRep.m"), 181, @"no ICC for this rep; consider asking self.canvas instead");
  }
  mCanvas = self->mCanvas;

  return [(TSDCanvas *)mCanvas canvasController];
}

- (TSDLayout)layout
{
  result = self->mTemporaryMixingLayout;
  if (!result) {
    return self->mLayout;
  }
  return result;
}

- (id)info
{
  v2 = [(TSDRep *)self layout];

  return [(TSDLayout *)v2 info];
}

- (BOOL)layerUpdatesPaused
{
  return self->mLayerUpdatesPausedCount != 0;
}

- (void)pauseLayerUpdates
{
  uint64_t v4 = objc_opt_class();
  if (objc_msgSend(v4, "tsu_overridesSelector:ofBaseClass:", a2, objc_opt_class()))
  {
    v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSDRep pauseLayerUpdates]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDRep.m"), 206, @"-pushLayerUpdatesPaused won't work correctly if -layerUpdatesPaused is overridden");
  }
  ++self->mLayerUpdatesPausedCount;
}

- (void)resumeLayerUpdates
{
  uint64_t v4 = objc_opt_class();
  if (objc_msgSend(v4, "tsu_overridesSelector:ofBaseClass:", a2, objc_opt_class()))
  {
    v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSDRep resumeLayerUpdates]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDRep.m"), 212, @"-resumeLayerUpdates won't work correctly if -layerUpdatesPaused is overridden");
  }
  unint64_t mLayerUpdatesPausedCount = self->mLayerUpdatesPausedCount;
  if (mLayerUpdatesPausedCount
    || (id v8 = (void *)[MEMORY[0x263F7C7F0] currentHandler],
        uint64_t v9 = [NSString stringWithUTF8String:"-[TSDRep resumeLayerUpdates]"],
        objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDRep.m"), 213, @"unbalanced calls to push/resumeLayerUpdates"), (unint64_t mLayerUpdatesPausedCount = self->mLayerUpdatesPausedCount) != 0))
  {
    self->unint64_t mLayerUpdatesPausedCount = mLayerUpdatesPausedCount - 1;
    v10 = [(TSDRep *)self interactiveCanvasController];
    [(TSDInteractiveCanvasController *)v10 invalidateLayers];
  }
}

- (void)resumeLayerUpdatesAndLayoutImmediately
{
  [(TSDRep *)self resumeLayerUpdates];
  v3 = [(TSDRep *)self interactiveCanvasController];

  [(TSDInteractiveCanvasController *)v3 layoutIfNeeded];
}

- (id)connectedReps
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v3 = [(TSDLayout *)[(TSDRep *)self layout] connectedLayouts];
  uint64_t v4 = (void *)[MEMORY[0x263EFF9C0] set];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [(NSSet *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v3);
        }
        id v9 = [(TSDInteractiveCanvasController *)[(TSDRep *)self interactiveCanvasController] repForLayout:*(void *)(*((void *)&v11 + 1) + 8 * v8)];
        if (v9) {
          [v4 addObject:v9];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSSet *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  return v4;
}

- (void)setParentRep:(id)a3
{
  mParentRep = self->mParentRep;
  if (mParentRep != a3)
  {
    if (mParentRep) {
      [(TSDRep *)self willBeRemovedFromParent];
    }
    self->mParentRep = (TSDContainerRep *)a3;
    if (a3)
    {
      [(TSDRep *)self wasAddedToParent];
    }
  }
}

- (void)recursivelyPerformSelectorIfImplemented:(SEL)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (objc_opt_respondsToSelector()) {
    [(TSDRep *)self performSelector:a3];
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v5 = objc_msgSend((id)TSUProtocolCast(), "childReps", 0);
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
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) recursivelyPerformSelectorIfImplemented:a3];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)recursivelyPerformSelectorIfImplemented:(SEL)a3 withObject:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (objc_opt_respondsToSelector()) {
    [(TSDRep *)self performSelector:a3 withObject:a4];
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v7 = objc_msgSend((id)TSUProtocolCast(), "childReps", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * v11++) recursivelyPerformSelectorIfImplemented:a3 withObject:a4];
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)recursivelyPerformSelectorIfImplemented:(SEL)a3 withObject:(id)a4 withObject:(id)a5
{
  if (objc_opt_respondsToSelector())
  {
    [(TSDRep *)self performSelector:a3 withObject:a4 withObject:a5];
  }
}

- (void)recursivelyPerformSelector:(SEL)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  -[TSDRep performSelector:](self, "performSelector:");
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = objc_msgSend((id)TSUProtocolCast(), "childReps", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) recursivelyPerformSelector:a3];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)recursivelyPerformSelector:(SEL)a3 withObject:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  -[TSDRep performSelector:withObject:](self, "performSelector:withObject:");
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = objc_msgSend((id)TSUProtocolCast(), "childReps", 0);
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
        [*(id *)(*((void *)&v11 + 1) + 8 * v10++) recursivelyPerformSelector:a3 withObject:a4];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)i_willBeRemoved
{
  self->mSelectionHighlightLayer = 0;
  [(TSDCanvas *)self->mCanvas i_unregisterRep:self];
  [(TSDRep *)self i_invalidateSelectionHighlightLayer];
  [MEMORY[0x263EFF9F0] cancelPreviousPerformRequestsWithTarget:self];
  self->mHasBeenRemoved = 1;
  self->mCanvas = 0;
}

- (BOOL)hasBeenRemoved
{
  return self->mHasBeenRemoved;
}

- (id)parentRepToPerformSelecting
{
  v2 = self;
  while (1)
  {
    v3 = [(TSDRep *)self parentRep];
    p_super = &v3->super;
    if (!v3 || [(TSDContainerRep *)v3 canSelectChildRep:v2]) {
      break;
    }
    self = p_super;
  }
  return p_super;
}

- (void)addToSet:(id)a3
{
}

- (double)angleInRoot
{
  if ([(TSDRep *)self parentRep])
  {
    [[(TSDRep *)self parentRep] angleInRoot];
    double v4 = v3 + 0.0;
  }
  else
  {
    double v4 = 0.0;
  }
  if (objc_msgSend(-[TSDRep info](self, "info"), "geometry"))
  {
    objc_msgSend((id)objc_msgSend(-[TSDRep info](self, "info"), "geometry"), "angle");
    return v4 + v5;
  }
  return v4;
}

- (CGRect)naturalBounds
{
  [(TSDLayoutGeometry *)[(TSDAbstractLayout *)[(TSDRep *)self layout] geometry] size];

  double v2 = TSDRectWithSize();
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)isVisibleOnCanvas
{
  double v3 = [(TSDRep *)self interactiveCanvasController];
  if (v3)
  {
    [(TSDInteractiveCanvasController *)[(TSDRep *)self interactiveCanvasController] visibleUnscaledRect];
    uint64_t v5 = v4;
    uint64_t v7 = v6;
    uint64_t v9 = v8;
    uint64_t v11 = v10;
    [(TSDRep *)self frameInUnscaledCanvas];
    uint64_t v13 = v12;
    uint64_t v15 = v14;
    uint64_t v17 = v16;
    uint64_t v19 = v18;
    uint64_t v20 = v5;
    uint64_t v21 = v7;
    uint64_t v22 = v9;
    uint64_t v23 = v11;
    LOBYTE(v3) = CGRectIntersectsRect(*(CGRect *)&v20, *(CGRect *)&v13);
  }
  return (char)v3;
}

- (CGRect)convertNaturalRectToUnscaledCanvas:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v7 = [(TSDRep *)self layout];
  if (v7) {
    [(TSDAbstractLayout *)v7 transformInRoot];
  }
  else {
    memset(&v8, 0, sizeof(v8));
  }
  v9.origin.CGFloat x = x;
  v9.origin.CGFloat y = y;
  v9.size.CGFloat width = width;
  v9.size.CGFloat height = height;
  return CGRectApplyAffineTransform(v9, &v8);
}

- (CGRect)convertNaturalRectFromUnscaledCanvas:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v7 = [(TSDRep *)self layout];
  if (v7) {
    [(TSDAbstractLayout *)v7 transformInRoot];
  }
  else {
    memset(&v8, 0, sizeof(v8));
  }
  CGAffineTransformInvert(&v9, &v8);
  v10.origin.CGFloat x = x;
  v10.origin.CGFloat y = y;
  v10.size.CGFloat width = width;
  v10.size.CGFloat height = height;
  return CGRectApplyAffineTransform(v10, &v9);
}

- (CGPath)newPathInScaledCanvasFromNaturalRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  Mutable = CGPathCreateMutable();
  long long v30 = 0u;
  long long v31 = 0u;
  long long v29 = 0u;
  CGAffineTransform v9 = [(TSDRep *)self layout];
  if (v9)
  {
    [(TSDAbstractLayout *)v9 transformInRoot];
  }
  else
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v29 = 0u;
  }
  [(TSDCanvas *)self->mCanvas viewScale];
  double v11 = v10;
  v32.origin.CGFloat x = x;
  v32.origin.CGFloat y = y;
  v32.size.CGFloat width = width;
  v32.size.CGFloat height = height;
  double MinX = CGRectGetMinX(v32);
  v33.origin.CGFloat x = x;
  v33.origin.CGFloat y = y;
  v33.size.CGFloat width = width;
  v33.size.CGFloat height = height;
  CGFloat MinY = CGRectGetMinY(v33);
  double v27 = *((double *)&v31 + 1) + MinY * *((double *)&v30 + 1) + *((double *)&v29 + 1) * MinX;
  double v28 = *(double *)&v31 + MinY * *(double *)&v30 + *(double *)&v29 * MinX;
  v34.origin.CGFloat x = x;
  v34.origin.CGFloat y = y;
  v34.size.CGFloat width = width;
  v34.size.CGFloat height = height;
  double MaxX = CGRectGetMaxX(v34);
  v35.origin.CGFloat x = x;
  v35.origin.CGFloat y = y;
  v35.size.CGFloat width = width;
  v35.size.CGFloat height = height;
  CGFloat v15 = CGRectGetMinY(v35);
  double v25 = *((double *)&v31 + 1) + v15 * *((double *)&v30 + 1) + *((double *)&v29 + 1) * MaxX;
  double v26 = *(double *)&v31 + v15 * *(double *)&v30 + *(double *)&v29 * MaxX;
  v36.origin.CGFloat x = x;
  v36.origin.CGFloat y = y;
  v36.size.CGFloat width = width;
  v36.size.CGFloat height = height;
  double v16 = CGRectGetMaxX(v36);
  v37.origin.CGFloat x = x;
  v37.origin.CGFloat y = y;
  v37.size.CGFloat width = width;
  v37.size.CGFloat height = height;
  CGFloat MaxY = CGRectGetMaxY(v37);
  double v18 = *(double *)&v31 + MaxY * *(double *)&v30 + *(double *)&v29 * v16;
  double v19 = *((double *)&v31 + 1) + MaxY * *((double *)&v30 + 1) + *((double *)&v29 + 1) * v16;
  v38.origin.CGFloat x = x;
  v38.origin.CGFloat y = y;
  v38.size.CGFloat width = width;
  v38.size.CGFloat height = height;
  double v20 = CGRectGetMinX(v38);
  v39.origin.CGFloat x = x;
  v39.origin.CGFloat y = y;
  v39.size.CGFloat width = width;
  v39.size.CGFloat height = height;
  CGFloat v21 = CGRectGetMaxY(v39);
  double v22 = *(double *)&v31 + v21 * *(double *)&v30 + *(double *)&v29 * v20;
  double v23 = *((double *)&v31 + 1) + v21 * *((double *)&v30 + 1) + *((double *)&v29 + 1) * v20;
  CGPathMoveToPoint(Mutable, 0, v11 * v28, v11 * v27);
  CGPathAddLineToPoint(Mutable, 0, v11 * v26, v11 * v25);
  CGPathAddLineToPoint(Mutable, 0, v11 * v18, v11 * v19);
  CGPathAddLineToPoint(Mutable, 0, v11 * v22, v11 * v23);
  CGPathCloseSubpath(Mutable);
  return Mutable;
}

- (CGPoint)convertNaturalPointToUnscaledCanvas:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v3 = [(TSDRep *)self layout];
  if (v3)
  {
    [(TSDAbstractLayout *)v3 transformInRoot];
    float64x2_t v4 = v11;
    float64x2_t v5 = v12;
    float64x2_t v6 = v13;
  }
  else
  {
    float64x2_t v6 = 0uLL;
    float64x2_t v4 = 0uLL;
    float64x2_t v5 = 0uLL;
  }
  float64x2_t v7 = vaddq_f64(v6, vmlaq_n_f64(vmulq_n_f64(v5, y), v4, x));
  double v8 = v7.f64[1];
  result.double x = v7.f64[0];
  result.double y = v8;
  return result;
}

- (CGPoint)convertNaturalPointFromUnscaledCanvas:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v3 = [(TSDRep *)self layout];
  if (v3) {
    [(TSDAbstractLayout *)v3 transformInRoot];
  }
  else {
    memset(&v8, 0, sizeof(v8));
  }
  CGAffineTransformInvert(&v9, &v8);
  float64x2_t v4 = vaddq_f64(*(float64x2_t *)&v9.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v9.c, y), *(float64x2_t *)&v9.a, x));
  double v5 = v4.f64[1];
  result.double x = v4.f64[0];
  result.double y = v5;
  return result;
}

- (CGRect)frameInUnscaledCanvas
{
  double v2 = [(TSDRep *)self layout];

  [(TSDAbstractLayout *)v2 frameInRoot];
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (CGRect)frameInScreenSpace
{
  double v3 = [(TSDRep *)self interactiveCanvasController];
  [(TSDRep *)self frameInUnscaledCanvas];
  -[TSDInteractiveCanvasController convertUnscaledToBoundsRect:](v3, "convertUnscaledToBoundsRect:");
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  float64x2_t v12 = [(TSDInteractiveCanvasController *)v3 canvasView];
  -[TSDCanvasView convertRect:toView:](v12, "convertRect:toView:", 0, v5, v7, v9, v11);
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  CGFloat v21 = (void *)[(TSDCanvasView *)v12 window];

  objc_msgSend(v21, "convertRect:toWindow:", 0, v14, v16, v18, v20);
  result.size.CGFloat height = v25;
  result.size.CGFloat width = v24;
  result.origin.double y = v23;
  result.origin.double x = v22;
  return result;
}

- (CGRect)layerFrameInScaledCanvas
{
  if ([(TSDRep *)self isBeingRotated])
  {
    double x = self->mOriginalLayerFrameInScaledCanvas.origin.x;
    double y = self->mOriginalLayerFrameInScaledCanvas.origin.y;
    double width = self->mOriginalLayerFrameInScaledCanvas.size.width;
    double height = self->mOriginalLayerFrameInScaledCanvas.size.height;
  }
  else if ([(TSDRep *)self directlyManagesLayerContent])
  {
    mCanvas = self->mCanvas;
    [(TSDRep *)self frameInUnscaledCanvas];
    -[TSDCanvas convertUnscaledToBoundsRect:](mCanvas, "convertUnscaledToBoundsRect:");
    double v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    [(TSDCanvas *)[(TSDRep *)self canvas] contentsScale];
    double x = TSDRoundedRectForScale(v9, v11, v13, v15, v16);
  }
  else
  {
    [(TSDRep *)self i_layerFrameInScaledCanvasIgnoringDragging];
  }
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)i_layerFrameInScaledCanvasIgnoringDragging
{
  if ([(TSDRep *)self isBeingRotated])
  {
    double v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSDRep i_layerFrameInScaledCanvasIgnoringDragging]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDRep.m"), 546, @"i_layerFrameInScaledCanvasIgnoringDragging is invalid in this state");
  }
  BOOL v5 = [(TSDRep *)self directlyManagesLayerContent];
  mCanvas = self->mCanvas;
  [(TSDRep *)self frameInUnscaledCanvas];
  -[TSDCanvas convertUnscaledToBoundsRect:](mCanvas, "convertUnscaledToBoundsRect:");
  double v11 = v7;
  CGFloat v12 = v8;
  CGFloat v13 = v9;
  CGFloat v14 = v10;
  if (v5)
  {
    [(TSDCanvas *)[(TSDRep *)self canvas] contentsScale];
    CGFloat v16 = TSDRoundedRectForScale(v11, v12, v13, v14, v15);
  }
  else
  {
    *(CGRect *)&CGFloat v16 = CGRectIntegral(*(CGRect *)&v7);
  }
  result.size.double height = v19;
  result.size.double width = v18;
  result.origin.double y = v17;
  result.origin.double x = v16;
  return result;
}

- (CGRect)layerFrameInScaledCanvasRelativeToParent
{
  [(TSDRep *)self layerFrameInScaledCanvas];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  if ([(TSDRep *)self parentRep])
  {
    [[(TSDRep *)self parentRep] layerFrameInScaledCanvas];
    double v4 = TSDSubtractPoints(v4, v6, v11);
    double v6 = v12;
  }
  double v13 = v4;
  double v14 = v6;
  double v15 = v8;
  double v16 = v10;
  result.size.double height = v16;
  result.size.double width = v15;
  result.origin.double y = v14;
  result.origin.double x = v13;
  return result;
}

- (CGPoint)layerOffsetForDragging
{
  [(TSDRep *)self i_layerFrameInScaledCanvasIgnoringDragging];
  double v4 = v3;
  double v6 = v5;
  [(TSDRep *)self i_originalLayerFrameInScaledCanvas];

  double v8 = TSDSubtractPoints(v4, v6, v7);
  result.double y = v9;
  result.double x = v8;
  return result;
}

- (CGAffineTransform)transformToConvertNaturalToLayerRelative
{
  memset(&v15, 0, sizeof(v15));
  double v5 = [(TSDRep *)self layout];
  if (v5) {
    [(TSDAbstractLayout *)v5 transformInRoot];
  }
  else {
    memset(&v15, 0, sizeof(v15));
  }
  [(TSDCanvas *)self->mCanvas viewScale];
  memset(&v14, 0, sizeof(v14));
  CGAffineTransformMakeScale(&t2, v6, v6);
  CGAffineTransform t1 = v15;
  CGAffineTransformConcat(&v14, &t1, &t2);
  [(TSDRep *)self layerFrameInScaledCanvas];
  memset(&t1, 0, sizeof(t1));
  CGAffineTransformMakeTranslation(&t1, -v7, -v8);
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tdouble x = 0u;
  *(_OWORD *)&retstr->a = 0u;
  CGAffineTransform v11 = v14;
  CGAffineTransform v10 = t1;
  return CGAffineTransformConcat(retstr, &v11, &v10);
}

- (CGAffineTransform)transformToConvertNaturalFromLayerRelative
{
  if (self) {
    [(TSDRep *)self transformToConvertNaturalToLayerRelative];
  }
  else {
    memset(&v5, 0, sizeof(v5));
  }
  return CGAffineTransformInvert(retstr, &v5);
}

- (CGPoint)convertNaturalPointToLayerRelative:(CGPoint)a3
{
  if (self)
  {
    CGFloat y = a3.y;
    CGFloat x = a3.x;
    [(TSDRep *)self transformToConvertNaturalToLayerRelative];
    a3.CGFloat y = y;
    a3.CGFloat x = x;
    float64x2_t v4 = v10;
    float64x2_t v3 = v11;
    float64x2_t v5 = v12;
  }
  else
  {
    float64x2_t v5 = 0uLL;
    float64x2_t v4 = 0uLL;
    float64x2_t v3 = 0uLL;
  }
  float64x2_t v6 = vaddq_f64(v5, vmlaq_n_f64(vmulq_n_f64(v3, a3.y), v4, a3.x));
  double v7 = v6.f64[1];
  result.CGFloat x = v6.f64[0];
  result.CGFloat y = v7;
  return result;
}

- (CGPoint)convertNaturalPointFromLayerRelative:(CGPoint)a3
{
  if (self)
  {
    CGFloat y = a3.y;
    CGFloat x = a3.x;
    [(TSDRep *)self transformToConvertNaturalFromLayerRelative];
    a3.CGFloat y = y;
    a3.CGFloat x = x;
    float64x2_t v4 = v10;
    float64x2_t v3 = v11;
    float64x2_t v5 = v12;
  }
  else
  {
    float64x2_t v5 = 0uLL;
    float64x2_t v4 = 0uLL;
    float64x2_t v3 = 0uLL;
  }
  float64x2_t v6 = vaddq_f64(v5, vmlaq_n_f64(vmulq_n_f64(v3, a3.y), v4, a3.x));
  double v7 = v6.f64[1];
  result.CGFloat x = v6.f64[0];
  result.CGFloat y = v7;
  return result;
}

- (CGRect)convertNaturalRectToLayerRelative:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (self) {
    [(TSDRep *)self transformToConvertNaturalToLayerRelative];
  }
  else {
    memset(&v7, 0, sizeof(v7));
  }
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
  if (self) {
    [(TSDRep *)self transformToConvertNaturalFromLayerRelative];
  }
  else {
    memset(&v7, 0, sizeof(v7));
  }
  v8.origin.CGFloat x = x;
  v8.origin.CGFloat y = y;
  v8.size.CGFloat width = width;
  v8.size.CGFloat height = height;
  return CGRectApplyAffineTransform(v8, &v7);
}

- (CGPoint)convertUnscaledPointToLayerRelative:(CGPoint)a3
{
  -[TSDRep convertNaturalPointFromUnscaledCanvas:](self, "convertNaturalPointFromUnscaledCanvas:", a3.x, a3.y);

  -[TSDRep convertNaturalPointToLayerRelative:](self, "convertNaturalPointToLayerRelative:");
  result.CGFloat y = v5;
  result.CGFloat x = v4;
  return result;
}

- (CGPoint)convertUnscaledPointFromLayerRelative:(CGPoint)a3
{
  -[TSDRep convertNaturalPointFromLayerRelative:](self, "convertNaturalPointFromLayerRelative:", a3.x, a3.y);

  -[TSDRep convertNaturalPointToUnscaledCanvas:](self, "convertNaturalPointToUnscaledCanvas:");
  result.CGFloat y = v5;
  result.CGFloat x = v4;
  return result;
}

- (double)scaleToConvertNaturalToLayerRelative
{
  if (self) {
    [(TSDRep *)self transformToConvertNaturalToLayerRelative];
  }
  else {
    memset(v3, 0, sizeof(v3));
  }
  return TSDTransformScale((double *)v3);
}

- (void)scrollRectToVisible:(CGRect)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v9 = [(TSDRep *)self interactiveCanvasController];

  -[TSDInteractiveCanvasController scrollRectToVisible:animated:](v9, "scrollRectToVisible:animated:", v4, x, y, width, height);
}

- (BOOL)containsPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(TSDRep *)self naturalBounds];
  CGFloat v9 = x;
  CGFloat v10 = y;

  return CGRectContainsPoint(*(CGRect *)&v5, *(CGPoint *)&v9);
}

- (BOOL)containsPoint:(CGPoint)a3 withSlop:(CGSize)a4
{
  double v5 = TSDRectWithCenterAndSize(a3.x, a3.y, a4.width + a4.width);
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  [(TSDRep *)self naturalBounds];
  double v16 = v5;
  uint64_t v17 = v7;
  uint64_t v18 = v9;
  uint64_t v19 = v11;

  return CGRectIntersectsRect(*(CGRect *)&v12, *(CGRect *)&v16);
}

- (id)hitRep:(CGPoint)a3 withGesture:(id)a4 passingTest:(id)a5
{
  id v6 = -[TSDRep hitRep:](self, "hitRep:", a4, a3.x, a3.y);
  uint64_t v7 = v6;
  if (a5 && v6 && !(*((unsigned int (**)(id, id))a5 + 2))(a5, v6)) {
    return 0;
  }
  return v7;
}

- (id)hitRep:(CGPoint)a3
{
  if (-[TSDRep containsPoint:](self, "containsPoint:", a3.x, a3.y)) {
    return self;
  }
  else {
    return 0;
  }
}

- (id)hitReps:(CGPoint)a3 withSlop:(CGSize)a4
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __27__TSDRep_hitReps_withSlop___block_invoke;
  v5[3] = &__block_descriptor_48_e26__CGSize_dd_16__0__TSDRep_8l;
  CGSize v6 = a4;
  return -[TSDRep hitReps:withSlopBlock:](self, "hitReps:withSlopBlock:", v5, a3.x, a3.y);
}

double __27__TSDRep_hitReps_withSlop___block_invoke(uint64_t a1)
{
  return *(double *)(a1 + 32);
}

- (id)hitReps:(CGPoint)a3 withSlopBlock:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  if (a4)
  {
    double v7 = (*((double (**)(id, TSDRep *))a4 + 2))(a4, self);
    double v9 = v8;
  }
  else
  {
    double v7 = *MEMORY[0x263F001B0];
    double v9 = *(double *)(MEMORY[0x263F001B0] + 8);
  }
  if (!-[TSDRep containsPoint:withSlop:](self, "containsPoint:withSlop:", x, y, v7, v9)) {
    return 0;
  }
  uint64_t v10 = (void *)MEMORY[0x263EFF8C0];

  return (id)[v10 arrayWithObject:self];
}

- (id)hitRepChrome:(CGPoint)a3 passingTest:(id)a4
{
  id v5 = -[TSDRep hitRepChrome:](self, "hitRepChrome:", a3.x, a3.y);
  CGSize v6 = v5;
  if (a4 && v5 && !(*((unsigned int (**)(id, id))a4 + 2))(a4, v5)) {
    return 0;
  }
  return v6;
}

- (id)hitRepChrome:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (![(TSDCanvas *)[(TSDRep *)self canvas] isCanvasInteractive]) {
    return 0;
  }
  -[TSDRep convertNaturalPointToUnscaledCanvas:](self, "convertNaturalPointToUnscaledCanvas:", x, y);
  double v7 = v6;
  double v9 = v8;
  uint64_t v10 = [(TSDRep *)self interactiveCanvasController];

  return -[TSDInteractiveCanvasController hitRepChromeAtUnscaledPoint:](v10, "hitRepChromeAtUnscaledPoint:", v7, v9);
}

- (BOOL)shouldExpandHitRegionWhenSmall
{
  return 1;
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
  [(TSDLayoutGeometry *)[(TSDAbstractLayout *)[(TSDRep *)self layout] geometry] size];
  double v8 = +[TSDBezierPath bezierPathWithRect:TSDRectWithSize()];
  double v9 = [(TSDRep *)self layout];
  if (v9) {
    [(TSDAbstractLayout *)v9 transformInRoot];
  }
  else {
    memset(v11, 0, sizeof(v11));
  }
  [(TSDBezierPath *)v8 transformUsingAffineTransform:v11];
  return -[TSDBezierPath intersectsRect:hasFill:](v8, "intersectsRect:hasFill:", 1, x, y, width, height);
}

- (id)repForDragging
{
  if ([(TSDRep *)self isDraggable]
    && [(TSDLayout *)[(TSDRep *)self layout] isInTopLevelContainerForEditing]
    && [(TSDCanvasEditor *)[(TSDInteractiveCanvasController *)[(TSDRep *)self interactiveCanvasController] canvasEditor] isRepSelectable:self]&& ![(TSDRep *)self isLocked]&& ![(TSDInteractiveCanvasController *)[(TSDRep *)self interactiveCanvasController] inVersionBrowsingMode])
  {
    return self;
  }
  float64x2_t v3 = [(TSDRep *)self parentRep];

  return [(TSDRep *)v3 repForDragging];
}

- (id)additionalRepsForDragging
{
  return (id)[MEMORY[0x263EFFA08] set];
}

- (id)repForSelecting
{
  if ([(TSDRep *)self isSelectable]
    && [(TSDLayout *)[(TSDRep *)self layout] isInTopLevelContainerForEditing]
    && [(TSDCanvasEditor *)[(TSDInteractiveCanvasController *)[(TSDRep *)self interactiveCanvasController] canvasEditor] isRepSelectable:self])
  {
    return self;
  }
  BOOL v4 = [(TSDRep *)self parentRep];

  return [(TSDRep *)v4 repForSelecting];
}

- (id)repForRotating
{
  if ([(TSDAbstractLayout *)[(TSDRep *)self layout] supportsRotation]
    && [(TSDLayout *)[(TSDRep *)self layout] isInTopLevelContainerForEditing]
    && [(TSDCanvasEditor *)[(TSDInteractiveCanvasController *)[(TSDRep *)self interactiveCanvasController] canvasEditor] isRepSelectable:self]&& ![(TSDRep *)self isLocked])
  {
    return self;
  }
  float64x2_t v3 = [(TSDRep *)self parentRep];

  return [(TSDRep *)v3 repForRotating];
}

- (void)updateFromLayout
{
  id v3 = [(TSDAbstractLayout *)[(TSDRep *)self layout] geometryInRoot];
  if (([v3 isEqual:self->mLastGeometryInRoot] & 1) == 0)
  {
    -[TSDRep layoutInRootChangedFrom:to:translatedOnly:](self, "layoutInRootChangedFrom:to:translatedOnly:", self->mLastGeometryInRoot, v3, [v3 differsInMoreThanTranslationFrom:self->mLastGeometryInRoot] ^ 1);

    self->mLastGeometryInRoot = (TSDLayoutGeometry *)[v3 copy];
  }
  [(TSDLayout *)[(TSDRep *)self layout] i_takeDirtyRect];
  -[TSDRep setNeedsDisplayInRect:](self, "setNeedsDisplayInRect:");

  [(TSDRep *)self i_invalidateSelectionHighlightLayer];
}

- (void)layoutInRootChangedFrom:(id)a3 to:(id)a4 translatedOnly:(BOOL)a5
{
  if (a5)
  {
    mCanvas = self->mCanvas;
    if (a3)
    {
      [a3 transform];
      float64x2_t v9 = v33;
      float64x2_t v10 = v34;
      float64x2_t v11 = v35;
    }
    else
    {
      float64x2_t v11 = 0uLL;
      float64x2_t v9 = 0uLL;
      float64x2_t v10 = 0uLL;
    }
    *(void *)&long long v5 = *(void *)(MEMORY[0x263F00148] + 8);
    -[TSDCanvas convertUnscaledToBoundsPoint:](mCanvas, "convertUnscaledToBoundsPoint:", vaddq_f64(v11, vmlaq_n_f64(vmulq_n_f64(v10, *(double *)&v5), v9, *MEMORY[0x263F00148])), vdupq_lane_s64(*MEMORY[0x263F00148], 0), v5);
    double v13 = v12;
    CGAffineTransform v14 = self->mCanvas;
    if (a4)
    {
      [a4 transform];
      float64x2_t v15 = v30;
      float64x2_t v16 = v31;
      float64x2_t v17 = v32;
    }
    else
    {
      float64x2_t v17 = 0uLL;
      float64x2_t v15 = 0uLL;
      float64x2_t v16 = 0uLL;
    }
    [(TSDCanvas *)v14 convertUnscaledToBoundsPoint:vaddq_f64(v17, vmlaq_f64(vmulq_n_f64(v16, v29), v28, v15))];
    double v20 = TSDSubtractPoints(v18, v19, v13);
    double v22 = v21;
    [(TSDCanvas *)[(TSDRep *)self canvas] contentsScale];
    TSDMultiplyPointScalar(v20, v22, v23);
    TSUFractionalPart();
    double v25 = fabs(v24);
    TSUFractionalPart();
    if (v25 >= 0.00999999978 && fabs(v25 + -1.0) >= 0.00999999978
      || (double v27 = fabs(v26), v27 >= 0.00999999978) && fabs(v27 + -1.0) >= 0.00999999978)
    {
      [(TSDRep *)self setNeedsDisplay];
    }
  }
  else
  {
    [(TSDRep *)self setNeedsDisplay];
    [(TSDRep *)self invalidateKnobPositions];
  }
}

- (CGAffineTransform)layerTransform
{
  uint64_t v5 = MEMORY[0x263F000D0];
  long long v6 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x263F000D0];
  *(_OWORD *)&retstr->c = v6;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)(v5 + 32);
  CGPoint result = (CGAffineTransform *)[(TSDRep *)self isBeingRotated];
  if (result)
  {
    CGPoint result = (CGAffineTransform *)[[(TSDRep *)self parentRep] isBeingRotated];
    if ((result & 1) == 0)
    {
      memset(&v24, 0, sizeof(v24));
      double v8 = [(TSDRep *)self layout];
      if (v8) {
        [(TSDLayout *)v8 originalPureTransformInRoot];
      }
      else {
        memset(&v24, 0, sizeof(v24));
      }
      memset(&v23, 0, sizeof(v23));
      float64x2_t v9 = [(TSDRep *)self layout];
      if (v9) {
        [(TSDLayout *)v9 pureTransformInRoot];
      }
      else {
        memset(&v23, 0, sizeof(v23));
      }
      memset(&v22, 0, sizeof(v22));
      CGAffineTransform t2 = v24;
      CGAffineTransformInvert(&t1, &t2);
      CGAffineTransform t2 = v23;
      CGAffineTransformConcat(&v22, &t1, &t2);
      [(TSDRep *)self layerFrameInScaledCanvas];
      -[TSDCanvas convertBoundsToUnscaledRect:](self->mCanvas, "convertBoundsToUnscaledRect:");
      double v14 = TSDCenterOfRect(v10, v11, v12, v13);
      CGAffineTransform v19 = v22;
      TSDTransformConvertForNewOrigin(&v19, &t2, v14, v15);
      CGAffineTransform v22 = t2;
      [(TSDCanvas *)self->mCanvas viewScale];
      v22.tdouble x = v16 * v22.tx;
      CGPoint result = (CGAffineTransform *)[(TSDCanvas *)self->mCanvas viewScale];
      v22.tdouble y = v17 * v22.ty;
      long long v18 = *(_OWORD *)&v22.c;
      *(_OWORD *)&retstr->a = *(_OWORD *)&v22.a;
      *(_OWORD *)&retstr->c = v18;
      *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&v22.tx;
    }
  }
  return result;
}

- (CGAffineTransform)parentLayerInverseTransformInRootForZeroAnchor
{
  uint64_t v5 = MEMORY[0x263F000D0];
  long long v6 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x263F000D0];
  *(_OWORD *)&retstr->c = v6;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)(v5 + 32);
  CGPoint result = [(TSDRep *)self parentRep];
  if (result)
  {
    double v8 = [(TSDRep *)self parentRep];
    if (v8) {
      [(TSDRep *)v8 layerTransformInRootForZeroAnchor];
    }
    else {
      memset(&v11, 0, sizeof(v11));
    }
    long long v9 = *(_OWORD *)&v11.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v11.a;
    *(_OWORD *)&retstr->c = v9;
    *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&v11.tx;
    long long v10 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v11.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v11.c = v10;
    *(_OWORD *)&v11.tdouble x = *(_OWORD *)&retstr->tx;
    return CGAffineTransformInvert(retstr, &v11);
  }
  return result;
}

- (CGAffineTransform)layerTransformInRootForZeroAnchor
{
  uint64_t v4 = MEMORY[0x263F000D0];
  long long v5 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x263F000D0];
  *(_OWORD *)&retstr->c = v5;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)(v4 + 32);
  if (self)
  {
    long long v6 = self;
    do
    {
      [(CGAffineTransform *)v6 layerFrameInScaledCanvasRelativeToParent];
      CGFloat v8 = v7;
      CGFloat v10 = v9;
      double v12 = v11;
      double v14 = v13;
      memset(&v21, 0, sizeof(v21));
      [(CGAffineTransform *)v6 layerTransform];
      CGAffineTransform t1 = v21;
      TSDTransformConvertForNewOrigin(&t1, &v20, v12 * -0.5, v14 * -0.5);
      CGAffineTransform v21 = v20;
      CGAffineTransformMakeTranslation(&v18, v8, v10);
      CGAffineTransform t1 = v21;
      CGAffineTransformConcat(&v20, &t1, &v18);
      long long v15 = *(_OWORD *)&v20.c;
      CGAffineTransform v21 = v20;
      long long v16 = *(_OWORD *)&v20.a;
      long long v17 = *(_OWORD *)&retstr->c;
      *(_OWORD *)&v20.a = *(_OWORD *)&retstr->a;
      *(_OWORD *)&v20.c = v17;
      *(_OWORD *)&v20.tdouble x = *(_OWORD *)&retstr->tx;
      *(_OWORD *)&t1.a = v16;
      *(_OWORD *)&t1.c = v15;
      *(_OWORD *)&t1.tdouble x = *(_OWORD *)&v21.tx;
      CGAffineTransformConcat(retstr, &v20, &t1);
      self = (CGAffineTransform *)[(CGAffineTransform *)v6 parentRep];
      long long v6 = self;
    }
    while (self);
  }
  return self;
}

- (void)updateLayerGeometryFromLayout:(id)a3
{
  [(TSDRep *)self layerFrameInScaledCanvasRelativeToParent];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  if (self) {
    [(TSDRep *)self layerTransform];
  }
  v13[0] = v14;
  v13[1] = v15;
  v13[2] = v16;
  objc_msgSend(a3, "setIfDifferentFrame:orTransform:", v13, v6, v8, v10, v12);
}

- (void)antiAliasDefeatLayerTransform:(CGAffineTransform *)a3 forFrame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  long long v10 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v38.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v38.c = v10;
  *(_OWORD *)&v38.tCGFloat x = *(_OWORD *)&a3->tx;
  if (TSDIsTransformAxisAlignedWithObjectSize(&v38.a, a4.size.width, a4.size.height))
  {
    long long v11 = *(_OWORD *)&a3->c;
    *(_OWORD *)&v37.a = *(_OWORD *)&a3->a;
    *(_OWORD *)&v37.c = v11;
    *(_OWORD *)&v37.tCGFloat x = *(_OWORD *)&a3->tx;
    memset(&v38, 0, sizeof(v38));
    TSDTransformConvertForNewOrigin(&v37, &v38, width * -0.5, height * -0.5);
    CGAffineTransform v37 = v38;
    v39.origin.CGFloat x = x;
    v39.origin.CGFloat y = y;
    v39.size.double width = width;
    v39.size.double height = height;
    CGRect v40 = CGRectApplyAffineTransform(v39, &v37);
    double v12 = v40.origin.x;
    CGFloat v13 = v40.origin.y;
    double v14 = v40.size.width;
    double v15 = v40.size.height;
    [(TSDCanvas *)[(TSDRep *)self canvas] contentsScale];
    double v17 = TSDRoundedRectForScale(v12, v13, v14, v15, v16);
    CGFloat v29 = v18;
    CGFloat v30 = v17;
    double v20 = v19;
    double v22 = v21;
    memset(&v37, 0, sizeof(v37));
    v41.origin.CGFloat x = v12;
    v41.origin.CGFloat y = v13;
    v41.size.double width = v14;
    v41.size.double height = v15;
    double v31 = height;
    CGFloat v23 = -CGRectGetMinX(v41);
    v42.origin.CGFloat x = v12;
    v42.origin.CGFloat y = v13;
    v42.size.double width = v14;
    v42.size.double height = v15;
    CGFloat MinY = CGRectGetMinY(v42);
    CGAffineTransformMakeTranslation(&v37, v23, -MinY);
    CGAffineTransformMakeScale(&t2, v20 / v14, v22 / v15);
    CGAffineTransform t1 = v37;
    CGAffineTransformConcat(&v36, &t1, &t2);
    CGAffineTransform v37 = v36;
    v43.origin.CGFloat x = v30;
    v43.origin.CGFloat y = v29;
    v43.size.double width = v20;
    v43.size.double height = v22;
    CGFloat MinX = CGRectGetMinX(v43);
    v44.origin.CGFloat x = v30;
    v44.origin.CGFloat y = v29;
    v44.size.double width = v20;
    v44.size.double height = v22;
    CGFloat v26 = CGRectGetMinY(v44);
    CGAffineTransformMakeTranslation(&v33, MinX, v26);
    CGAffineTransform t1 = v37;
    CGAffineTransformConcat(&v36, &t1, &v33);
    CGAffineTransform v37 = v36;
    CGAffineTransform t1 = v36;
    TSDTransformConvertForNewOrigin(&t1, &v36, width * 0.5, v31 * 0.5);
    CGAffineTransform v37 = v36;
    long long v27 = *(_OWORD *)&a3->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&a3->a;
    *(_OWORD *)&t1.c = v27;
    *(_OWORD *)&t1.tCGFloat x = *(_OWORD *)&a3->tx;
    CGAffineTransform v32 = v36;
    CGAffineTransformConcat(&v36, &t1, &v32);
    long long v28 = *(_OWORD *)&v36.c;
    *(_OWORD *)&a3->a = *(_OWORD *)&v36.a;
    *(_OWORD *)&a3->c = v28;
    *(_OWORD *)&a3->tCGFloat x = *(_OWORD *)&v36.tx;
  }
}

- (void)antiAliasDefeatLayerFrame:(CGRect *)a3 forTransform:(CGAffineTransform *)a4
{
  long long v7 = *(_OWORD *)&a4->c;
  *(_OWORD *)&v25.a = *(_OWORD *)&a4->a;
  *(_OWORD *)&v25.c = v7;
  *(_OWORD *)&v25.tdouble x = *(_OWORD *)&a4->tx;
  if (TSDIsTransformAxisAlignedWithObjectSize(&v25.a, a3->size.width, a3->size.height))
  {
    CGFloat v8 = a3->size.width * -0.5;
    CGFloat v9 = a3->size.height * -0.5;
    long long v10 = *(_OWORD *)&a4->c;
    *(_OWORD *)&v24.a = *(_OWORD *)&a4->a;
    *(_OWORD *)&v24.c = v10;
    *(_OWORD *)&v24.tdouble x = *(_OWORD *)&a4->tx;
    memset(&v25, 0, sizeof(v25));
    TSDTransformConvertForNewOrigin(&v24, &v25, v8, v9);
    CGRect v26 = *a3;
    CGAffineTransform v24 = v25;
    CGRect v27 = CGRectApplyAffineTransform(v26, &v24);
    double x = v27.origin.x;
    CGFloat y = v27.origin.y;
    CGFloat width = v27.size.width;
    CGFloat height = v27.size.height;
    [(TSDCanvas *)[(TSDRep *)self canvas] contentsScale];
    double v16 = TSDRoundedRectForScale(x, y, width, height, v15);
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    CGAffineTransform v24 = v25;
    CGAffineTransformInvert(&v23, &v24);
    v28.origin.double x = v16;
    v28.origin.CGFloat y = v18;
    v28.size.CGFloat width = v20;
    v28.size.CGFloat height = v22;
    *a3 = CGRectApplyAffineTransform(v28, &v23);
  }
}

- (void)computeDirectLayerFrame:(CGRect *)a3 andTransform:(CGAffineTransform *)a4 basedOnTransform:(CGAffineTransform *)a5 andSize:(CGSize)a6
{
  objc_opt_class();
  [(TSDAbstractLayout *)[(TSDRep *)self layout] parent];
  uint64_t v10 = TSUDynamicCast();
  if (v10)
  {
    long long v11 = (void *)v10;
    memset(&v50, 0, sizeof(v50));
    if ([(TSDRep *)self isBeingRotated]) {
      [v11 originalTransformInRoot];
    }
    else {
      [v11 transformInRoot];
    }
    long long v12 = *(_OWORD *)&a5->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&a5->a;
    *(_OWORD *)&t1.c = v12;
    *(_OWORD *)&t1.tdouble x = *(_OWORD *)&a5->tx;
    CGAffineTransform v47 = v50;
    CGAffineTransformConcat(&v49, &t1, &v47);
    long long v13 = *(_OWORD *)&v49.c;
    *(_OWORD *)&a5->a = *(_OWORD *)&v49.a;
    *(_OWORD *)&a5->c = v13;
    *(_OWORD *)&a5->tdouble x = *(_OWORD *)&v49.tx;
  }
  double v14 = TSDRectWithSize();
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  [(TSDCanvas *)self->mCanvas viewScale];
  double v22 = v21;
  long long v23 = *(_OWORD *)&a5->c;
  *(_OWORD *)&v50.a = *(_OWORD *)&a5->a;
  *(_OWORD *)&v50.c = v23;
  *(_OWORD *)&v50.tdouble x = *(_OWORD *)&a5->tx;
  double v24 = TSDTransformScale(&v50.a);
  double v25 = TSDMultiplyRectScalar(v14, v16, v18, v20, v22 * fabs(v24));
  CGFloat v27 = v26;
  double v29 = v28;
  double v31 = v30;
  long long v32 = *(_OWORD *)&a5->c;
  *(_OWORD *)&v50.a = *(_OWORD *)&a5->a;
  *(_OWORD *)&v50.c = v32;
  *(_OWORD *)&v50.tdouble x = *(_OWORD *)&a5->tx;
  double v33 = TSDTransformScale(&v50.a);
  long long v34 = *(_OWORD *)&a5->c;
  *(_OWORD *)&v50.a = *(_OWORD *)&a5->a;
  *(_OWORD *)&v50.c = v34;
  *(_OWORD *)&v50.tdouble x = *(_OWORD *)&a5->tx;
  CGFloat v35 = 1.0 / v33;
  double v36 = TSDTransformScale(&v50.a);
  long long v37 = *(_OWORD *)&a5->c;
  *(_OWORD *)&v49.a = *(_OWORD *)&a5->a;
  *(_OWORD *)&v49.c = v37;
  *(_OWORD *)&v49.tdouble x = *(_OWORD *)&a5->tx;
  CGAffineTransformScale(&v50, &v49, v35, 1.0 / v36);
  long long v38 = *(_OWORD *)&v50.c;
  *(_OWORD *)&a5->a = *(_OWORD *)&v50.a;
  *(_OWORD *)&a5->c = v38;
  *(_OWORD *)&a5->tdouble x = *(_OWORD *)&v50.tx;
  [(TSDCanvas *)self->mCanvas viewScale];
  long long v39 = *(_OWORD *)&a5->c;
  *(float64x2_t *)&a5->tdouble x = vmulq_n_f64(*(float64x2_t *)&a5->tx, v40);
  *(_OWORD *)&v49.a = *(_OWORD *)&a5->a;
  *(_OWORD *)&v49.c = v39;
  *(_OWORD *)&v49.tdouble x = *(_OWORD *)&a5->tx;
  TSDTransformConvertForNewOrigin(&v49, &v50, v29 * 0.5, v31 * 0.5);
  long long v41 = *(_OWORD *)&v50.c;
  *(_OWORD *)&a5->a = *(_OWORD *)&v50.a;
  *(_OWORD *)&a5->c = v41;
  *(_OWORD *)&a5->tdouble x = *(_OWORD *)&v50.tx;
  if ([(TSDRep *)self parentRep])
  {
    [[(TSDRep *)self parentRep] layerFrameInScaledCanvas];
    CGFloat v44 = a5->ty - v43;
    a5->tdouble x = a5->tx - v42;
    a5->tCGFloat y = v44;
  }
  if (a3)
  {
    a3->origin.double x = v25;
    a3->origin.CGFloat y = v27;
    a3->size.CGFloat width = v29;
    a3->size.CGFloat height = v31;
  }
  if (a4)
  {
    long long v45 = *(_OWORD *)&a5->a;
    long long v46 = *(_OWORD *)&a5->tx;
    *(_OWORD *)&a4->c = *(_OWORD *)&a5->c;
    *(_OWORD *)&a4->tdouble x = v46;
    *(_OWORD *)&a4->a = v45;
  }
}

- (void)computeDirectLayerFrame:(CGRect *)a3 andTransform:(CGAffineTransform *)a4
{
  long long v7 = [(TSDAbstractLayout *)[(TSDRep *)self layout] geometry];
  if (v7)
  {
    [(TSDLayoutGeometry *)v7 transform];
  }
  else
  {
    long long v9 = 0u;
    long long v10 = 0u;
    long long v8 = 0u;
  }
  [(TSDLayoutGeometry *)[(TSDAbstractLayout *)[(TSDRep *)self layout] geometry] size];
  -[TSDRep computeDirectLayerFrame:andTransform:basedOnTransform:andSize:](self, "computeDirectLayerFrame:andTransform:basedOnTransform:andSize:", a3, a4, &v8);
}

- (void)computeDirectLayerFrame:(CGRect *)a3 andTransform:(CGAffineTransform *)a4 basedOnLayoutGeometry:(id)a5
{
  if (a5)
  {
    [a5 transform];
  }
  else
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v9 = 0u;
  }
  objc_msgSend(a5, "size", v9, v10, v11);
  -[TSDRep computeDirectLayerFrame:andTransform:basedOnTransform:andSize:](self, "computeDirectLayerFrame:andTransform:basedOnTransform:andSize:", a3, a4, &v9);
}

- (void)processChanges:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(a3);
        }
        long long v9 = *(void **)(*((void *)&v13 + 1) + 8 * v8);
        objc_opt_class();
        [v9 details];
        long long v10 = (void *)TSUDynamicCast();
        if (v10)
        {
          long long v11 = (void *)[v10 changedProperties];
          v12[0] = MEMORY[0x263EF8330];
          v12[1] = 3221225472;
          v12[2] = __25__TSDRep_processChanges___block_invoke;
          v12[3] = &unk_2646B0F30;
          v12[4] = self;
          [v11 enumeratePropertiesUsingBlock:v12];
        }
        else if ([v9 kind] == 5 || objc_msgSend(v9, "kind") == 6)
        {
          [(TSDRep *)self invalidateKnobs];
          [(TSDCanvas *)self->mCanvas invalidateReps];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [a3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
}

uint64_t __25__TSDRep_processChanges___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) processChangedProperty:a2];
}

- (void)setNeedsDisplay
{
  if ([(TSDCanvas *)[(TSDRep *)self canvas] isCanvasInteractive]
    && ![(TSDRep *)self directlyManagesLayerContent])
  {
    id v3 = [(TSDRep *)self interactiveCanvasController];
    [(TSDInteractiveCanvasController *)v3 i_repNeedsDisplay:self];
  }
}

- (void)setNeedsDisplayInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if ([(TSDCanvas *)[(TSDRep *)self canvas] isCanvasInteractive])
  {
    if (![(TSDRep *)self directlyManagesLayerContent])
    {
      v10.origin.double x = x;
      v10.origin.double y = y;
      v10.size.double width = width;
      v10.size.double height = height;
      if (!CGRectIsNull(v10))
      {
        v11.origin.double x = x;
        v11.origin.double y = y;
        v11.size.double width = width;
        v11.size.double height = height;
        if (!CGRectIsEmpty(v11))
        {
          uint64_t v8 = [(TSDRep *)self interactiveCanvasController];
          -[TSDInteractiveCanvasController i_repNeedsDisplay:inRect:](v8, "i_repNeedsDisplay:inRect:", self, x, y, width, height);
        }
      }
    }
  }
}

- (void)screenScaleDidChange
{
  [(TSDRep *)self setNeedsDisplay];
  [(TSDRep *)self invalidateKnobs];

  [(TSDRep *)self i_invalidateSelectionHighlightLayer];
}

- (void)viewScaleDidChange
{
  [(TSDRep *)self setNeedsDisplay];
  [(TSDRep *)self invalidateKnobs];

  [(TSDRep *)self i_invalidateSelectionHighlightLayer];
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
  [(TSDRep *)self layerFrameInScaledCanvas];
  CGContextTranslateCTM(a4, -v7, -v8);
  [(TSDCanvas *)self->mCanvas viewScale];
  CGContextScaleCTM(a4, v9, v9);
  BOOL v10 = [(TSDRep *)self isBeingRotated];
  CGRect v11 = [(TSDRep *)self layout];
  if (v10)
  {
    if (v11)
    {
      long long v12 = (CGAffineTransform *)&v16;
      [(TSDLayout *)v11 originalTransformInRoot];
    }
    else
    {
      long long v17 = 0u;
      long long v18 = 0u;
      long long v16 = 0u;
      long long v12 = (CGAffineTransform *)&v16;
    }
  }
  else if (v11)
  {
    long long v12 = (CGAffineTransform *)&v19;
    [(TSDAbstractLayout *)v11 transformInRoot];
  }
  else
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v19 = 0u;
    long long v12 = (CGAffineTransform *)&v19;
  }
  CGContextConcatCTM(a4, v12);
  if (a3 && [a3 contentsAreFlipped])
  {
    long long v13 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F08B88], "currentThread"), "threadDictionary");
    uint64_t v14 = [NSNumber numberWithBool:1];
    objc_msgSend(v13, "setObject:forKey:", v14, objc_msgSend(MEMORY[0x263F08D40], "valueWithPointer:", self));
  }
  -[TSDRep i_configureFontSmoothingForContext:layer:](self, "i_configureFontSmoothingForContext:layer:", a4, a3, v16, v17, v18, v19, v20, v21);
  if (![(TSDCanvas *)[(TSDRep *)self canvas] allowsFontSubpixelQuantization])
  {
    CGContextSetAllowsFontSubpixelQuantization(a4, 0);
    CGContextSetShouldSubpixelQuantizeFonts(a4, 0);
  }
  [(TSDCanvas *)[(TSDRep *)self canvas] contentsScale];
  TSDSetCGContextInfo((uint64_t)a4, 0, 0, a3 != 0, 0, v15);
}

- (void)didDrawInLayer:(id)a3 context:(CGContext *)a4
{
  TSDClearCGContextInfo((uint64_t)a4);
  uint64_t v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F08B88], "currentThread"), "threadDictionary");
  uint64_t v6 = [MEMORY[0x263F08D40] valueWithPointer:self];

  [v5 removeObjectForKey:v6];
}

- (BOOL)isDrawingInFlippedContext
{
  id v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F08B88], "currentThread"), "threadDictionary");
  uint64_t v4 = objc_msgSend(v3, "objectForKey:", objc_msgSend(MEMORY[0x263F08D40], "valueWithPointer:", self));
  if (v4)
  {
    LOBYTE(v4) = [v4 BOOLValue];
  }
  return (char)v4;
}

- (void)recursivelyDrawInContext:(CGContext *)a3
{
  uint64_t v5 = [(TSDAbstractLayout *)[(TSDRep *)self layout] geometry];
  if (v5) {
    [(TSDLayoutGeometry *)v5 transform];
  }
  else {
    memset(&v16, 0, sizeof(v16));
  }
  CGContextConcatCTM(a3, &v16);
  [(TSDRep *)self clipRect];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  BOOL v14 = [(TSDRep *)self masksToBounds];
  BOOL v15 = v14;
  if (v14)
  {
    v17.origin.double x = v7;
    v17.origin.double y = v9;
    v17.size.double width = v11;
    v17.size.double height = v13;
    CGContextClipToRect(a3, v17);
  }
  ClipBoundingBodouble x = CGContextGetClipBoundingBox(a3);
  v18.origin.double x = v7;
  v18.origin.double y = v9;
  v18.size.double width = v11;
  v18.size.double height = v13;
  if (CGRectIntersectsRect(v18, ClipBoundingBox))
  {
    CGContextSaveGState(a3);
    if (!v15)
    {
      v19.origin.double x = v7;
      v19.origin.double y = v9;
      v19.size.double width = v11;
      v19.size.double height = v13;
      CGContextClipToRect(a3, v19);
    }
    -[TSDRep drawInContext:](self, "drawInContext:", a3, *(_OWORD *)&v16.a, *(_OWORD *)&v16.c, *(_OWORD *)&v16.tx);
    CGContextRestoreGState(a3);
  }
  -[TSDRep recursivelyDrawChildrenInContext:](self, "recursivelyDrawChildrenInContext:", a3, *(_OWORD *)&v16.a, *(_OWORD *)&v16.c, *(_OWORD *)&v16.tx);
}

- (void)recursivelyDrawChildrenInContext:(CGContext *)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v4 = (void *)TSUProtocolCast();
  if (v4)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v5 = objc_msgSend(v4, "childReps", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          double v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
          CGContextSaveGState(a3);
          [v10 recursivelyDrawInContext:a3];
          CGContextRestoreGState(a3);
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
  }
}

- (BOOL)isSelectedIgnoringLocking
{
  if (![(TSDRep *)self isSelectable]
    || ![(TSDCanvas *)[(TSDRep *)self canvas] isCanvasInteractive])
  {
    return 0;
  }
  id v3 = [(TSDInteractiveCanvasController *)[(TSDRep *)self interactiveCanvasController] canvasEditor];
  id v4 = [(TSDRep *)self info];

  return [(TSDCanvasEditor *)v3 isSelectedInfo:v4];
}

- (BOOL)isSelected
{
  BOOL v3 = [(TSDRep *)self isSelectedIgnoringLocking];
  if (v3) {
    LOBYTE(v3) = ![(TSDRep *)self isLocked];
  }
  return v3;
}

- (void)becameSelected
{
  [(TSDRep *)self invalidateKnobs];
  mCanvas = self->mCanvas;

  [(TSDCanvas *)mCanvas layoutInvalidated];
}

- (void)becameNotSelected
{
  [(TSDRep *)self invalidateKnobs];
  [(TSDRep *)self i_invalidateSelectionHighlightLayer];
  self->mSelectionHighlightLayerValid = 0;

  self->mSelectionHighlightLayer = 0;
  mCanvas = self->mCanvas;

  [(TSDCanvas *)mCanvas layoutInvalidated];
}

- (NSArray)knobs
{
  mKnobs = self->mKnobs;
  if (!mKnobs)
  {
    if ([(TSDRep *)self shouldCreateKnobs])
    {
      id v4 = (void *)[MEMORY[0x263EFF980] array];
      [(TSDRep *)self addKnobsToArray:v4];
      if ([v4 count]) {
        self->mKnobPositionsInvalid = 1;
      }
      mKnobs = v4;
      self->mKnobs = mKnobs;
    }
    else
    {
      mKnobs = self->mKnobs;
    }
  }
  if ([(NSArray *)mKnobs count] && self->mKnobPositionsInvalid) {
    [(TSDRep *)self updatePositionsOfKnobs:self->mKnobs];
  }
  self->mKnobPositionsInvalid = 0;
  uint64_t v5 = self->mKnobs;
  mKnobTracker = self->mKnobTracker;
  if (mKnobTracker && [(TSDKnobTracker *)mKnobTracker didBegin] && !self->mShowKnobsWhenManipulated)
  {
    unint64_t v8 = [(TSDKnobTracker *)self->mKnobTracker enabledKnobMask];
    uint64_t v7 = v13;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __15__TSDRep_knobs__block_invoke;
    _OWORD v13[3] = &unk_2646B15B0;
    v13[5] = v8;
  }
  else
  {
    if ([(TSDRep *)self shouldShowKnobs]) {
      goto LABEL_17;
    }
    uint64_t v7 = v12;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __15__TSDRep_knobs__block_invoke_2;
    v12[3] = &unk_2646B15D8;
  }
  v7[4] = self;
  uint64_t v5 = (NSArray *)-[NSArray tsu_arrayOfObjectsPassingTest:](v5, "tsu_arrayOfObjectsPassingTest:");
LABEL_17:
  uint64_t v9 = self->mKnobs;
  if (v5 != v9)
  {

    uint64_t v5 = v5;
    self->mKnobs = v5;
  }
  uint64_t v10 = [(NSArray *)v5 count];
  CGPoint result = self->mKnobs;
  if (!v10)
  {

    CGPoint result = 0;
    self->mKnobs = 0;
  }
  return result;
}

uint64_t __15__TSDRep_knobs__block_invoke(uint64_t a1, void *a2)
{
  if ((*(void *)(a1 + 40) & TSDMaskForKnob([a2 tag])) != 0) {
    return 1;
  }
  uint64_t v5 = *(void **)(a1 + 32);

  return [v5 directlyManagesVisibilityOfKnob:a2];
}

uint64_t __15__TSDRep_knobs__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) directlyManagesVisibilityOfKnob:a2];
}

- (void)invalidateKnobs
{
  mKnobs = self->mKnobs;
  if (mKnobs)
  {

    self->mKnobs = 0;
    id v4 = [(TSDRep *)self canvas];
    [(TSDCanvas *)v4 invalidateLayers];
  }
}

- (unint64_t)enabledKnobMask
{
  if (objc_msgSend((id)objc_msgSend(-[TSDRep info](self, "info"), "owningAttachmentNoRecurse"), "specifiesEnabledKnobMask"))uint64_t v3 = objc_msgSend((id)objc_msgSend(-[TSDRep info](self, "info"), "owningAttachmentNoRecurse"), "enabledKnobMask"); {
  else
  }
    uint64_t v3 = 990;
  [(TSDRep *)self trackingBoundsForStandardKnobs];
  double v5 = v4;
  double v7 = v6;
  [(TSDCanvas *)self->mCanvas viewScale];
  double v9 = TSDMultiplySizeScalar(v5, v7, v8);
  unint64_t v11 = v3 & 0xFFFFFFFFFFFFFEFBLL;
  if (v9 >= 50.0) {
    unint64_t v11 = v3;
  }
  if (v10 >= 50.0) {
    unint64_t v12 = v11;
  }
  else {
    unint64_t v12 = v11 & 0xFFFFFFFFFFFFFFAFLL;
  }
  if (objc_msgSend(-[TSDRep info](self, "info"), "isInlineWithText"))
  {
    id v13 = [(TSDAbstractLayout *)[(TSDRep *)self layout] geometryInRoot];
    if (v13) {
      [v13 transform];
    }
    else {
      memset(v20, 0, sizeof(v20));
    }
    TSDTransformAngle((double *)v20);
    TSURound();
    unint64_t v14 = 0;
    for (uint64_t i = 1; i != 10; ++i)
    {
      if ((TSDMaskForKnob(i) & v12) != 0)
      {
        uint64_t v16 = TSDKnobTagByRotatingKnobByAngle(i);
        CGRect v17 = [(TSDAbstractLayout *)[(TSDRep *)self layout] geometry];
        if (v17) {
          [(TSDLayoutGeometry *)v17 transform];
        }
        else {
          memset(v19, 0, sizeof(v19));
        }
        if (TSDIsTransformFlipped((double *)v19)) {
          LOBYTE(v16) = TSDKnobTagWithFlip(v16);
        }
        v14 |= TSDMaskForKnob(v16);
      }
    }
    if (v14) {
      return v14;
    }
  }
  return v12;
}

- (void)addKnobsToArray:(id)a3
{
  if ([(TSDRep *)self shouldCreateSelectionKnobs])
  {
    [(TSDRep *)self addSelectionKnobsToArray:a3];
  }
  else if ([(TSDRep *)self shouldCreateLockedKnobs])
  {
    [(TSDRep *)self addLockedKnobsToArray:a3];
  }
  if ([(TSDRep *)self shouldCreateCommentKnob]) {
    [(TSDRep *)self addCommentKnobToArray:a3];
  }
  if ([(TSDRep *)self shouldDisplayHyperlinkUI]) {
    [(TSDRep *)self addHyperlinkKnobToArray:a3];
  }

  [(TSDRep *)self addActionGhostKnobToArrayIfNecessary:a3];
}

- (id)newSelectionKnobForType:(int)a3 tag:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  double v7 = [TSDKnob alloc];
  double v8 = *MEMORY[0x263F00148];
  double v9 = *(double *)(MEMORY[0x263F00148] + 8);

  return -[TSDKnob initWithType:position:radius:tag:onRep:](v7, "initWithType:position:radius:tag:onRep:", v5, a4, self, v8, v9, 15.0);
}

- (void)addSelectionKnobsToArray:(id)a3
{
  unint64_t v5 = [(TSDRep *)self enabledKnobMask];
  if (v5)
  {
    unint64_t v6 = v5;
    uint64_t v7 = [(TSDInteractiveCanvasController *)[(TSDRep *)self interactiveCanvasController] defaultKnobTypeForRep:self];
    for (uint64_t i = 1; i != 10; ++i)
    {
      if ((TSDMaskForKnob(i) & v6) != 0)
      {
        id v9 = [(TSDRep *)self newSelectionKnobForType:v7 tag:i];
        [a3 addObject:v9];
      }
    }
  }
}

- (void)addLockedKnobsToArray:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  unint64_t v5 = (void *)[MEMORY[0x263EFF980] array];
  [(TSDRep *)self addSelectionKnobsToArray:v5];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
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
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) setType:4];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
  [a3 addObjectsFromArray:v5];
}

- (void)addActionGhostKnobToArrayIfNecessary:(id)a3
{
  id v4 = [(TSDInteractiveCanvasController *)[(TSDRep *)self interactiveCanvasController] actionGhostKnobForRep:self];
  if (v4)
  {
    [a3 addObject:v4];
  }
}

- (BOOL)canUseSpecializedHitRegionForKnob:(id)a3
{
  return (unint64_t)[a3 tag] < 0xA;
}

- (CGRect)boundsForStandardKnobs
{
  double v2 = [(TSDRep *)self layout];

  [(TSDLayout *)v2 boundsForStandardKnobs];
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (CGRect)trackingBoundsForStandardKnobs
{
  mKnobTracker = self->mKnobTracker;
  if (mKnobTracker) {
    [(TSDKnobTracker *)mKnobTracker currentBoundsForStandardKnobs];
  }
  else {
    [(TSDRep *)self boundsForStandardKnobs];
  }
  result.size.double height = v7;
  result.size.double width = v6;
  result.origin.double y = v5;
  result.origin.double x = v4;
  return result;
}

- (void)updatePositionsOfKnobs:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  [(TSDRep *)self trackingBoundsForStandardKnobs];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v13 = [a3 countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v40 != v15) {
          objc_enumerationMutation(a3);
        }
        CGRect v17 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        if ((unint64_t)([v17 tag] - 1) <= 8)
        {
          -[TSDRep positionOfStandardKnob:forBounds:](self, "positionOfStandardKnob:forBounds:", v17, v6, v8, v10, v12);
LABEL_8:
          objc_msgSend(v17, "setPosition:");
          continue;
        }
        if ([v17 tag] == 31)
        {
          [(TSDRep *)self boundsForStandardKnobs];
          double v19 = v18;
          double v21 = v20;
          if (-[TSDRep parentRep](self, "parentRep") && [v17 shouldDisplayDirectlyOverRep])
          {
            [[(TSDRep *)self parentRep] boundsForStandardKnobs];
            double v19 = TSDAddPoints(v19, v21, v22);
          }
          double v23 = TSDPositionOfKnobOnRectangle(1, v6, v8, v10, v12);
          double v25 = v24;
          [(TSDCanvas *)[(TSDRep *)self canvas] viewScale];
          double v27 = TSDAddPoints(v23, v25, v26 * -36.0);
          double v29 = TSDSubtractPoints(v27, v28, v19);
          if (self)
          {
            double v34 = v30;
            double v35 = v29;
            [(TSDRep *)self transformToConvertNaturalFromLayerRelative];
            double v30 = v34;
            double v29 = v35;
            float64x2_t v32 = v36;
            float64x2_t v31 = v37;
            float64x2_t v33 = v38;
          }
          else
          {
            float64x2_t v37 = 0u;
            float64x2_t v38 = 0u;
            float64x2_t v33 = 0uLL;
            float64x2_t v32 = 0uLL;
            float64x2_t v31 = 0uLL;
            float64x2_t v36 = 0u;
          }
          objc_msgSend(v17, "setPosition:", vaddq_f64(v33, vmlaq_n_f64(vmulq_n_f64(v31, v30), v32, v29)));
          [v17 updateHitRegionPathForRep:self];
        }
        else
        {
          if ([v17 tag] == 33)
          {
            [(TSDRep *)self positionOfHyperlinkKnob];
            goto LABEL_8;
          }
          if ([v17 tag] == 34)
          {
            -[TSDRep p_positionOfActionGhostKnobForBounds:](self, "p_positionOfActionGhostKnobForBounds:", v6, v8, v10, v12);
            goto LABEL_8;
          }
        }
      }
      uint64_t v14 = [a3 countByEnumeratingWithState:&v39 objects:v43 count:16];
    }
    while (v14);
  }
}

- (BOOL)forcesPlacementOnTop
{
  return 0;
}

- (CGPoint)positionOfHyperlinkKnob
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F7C858], "imageNamed:inBundle:", @"TSDKnobHyperlink_N", TSDBundle()), "size");
  double v4 = v3;
  double v20 = v5;
  [(TSDRep *)self boundsForStandardKnobs];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  [(TSDCanvas *)[(TSDRep *)self canvas] viewScale];
  double v15 = v14;
  v22.origin.double x = v7;
  v22.origin.double y = v9;
  v22.size.double width = v11;
  v22.size.double height = v13;
  double v16 = -1.0 / v15;
  CGFloat v17 = CGRectGetMaxX(v22) + v16 * (v4 * 0.5 + 6.0);
  v23.origin.double x = v7;
  v23.origin.double y = v9;
  v23.size.double width = v11;
  v23.size.double height = v13;
  double v18 = CGRectGetMaxY(v23) + v16 * (v20 * 0.5 + 6.0);
  double v19 = v17;
  result.double y = v18;
  result.double x = v19;
  return result;
}

- (CGPoint)positionOfActionGhostKnob
{
  [(TSDRep *)self boundsForStandardKnobs];

  -[TSDRep p_positionOfActionGhostKnobForBounds:](self, "p_positionOfActionGhostKnobForBounds:");
  result.double y = v4;
  result.double x = v3;
  return result;
}

- (CGPoint)p_positionOfActionGhostKnobForBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F7C858], "imageNamed:inBundle:", @"sf-mac_canvas_btn_actionAdd-N", TSDBundle()), "size");
  double v9 = v8;
  [(TSDCanvas *)[(TSDRep *)self canvas] viewScale];
  double v11 = 1.0 / v10;
  v16.origin.CGFloat x = x;
  v16.origin.CGFloat y = y;
  v16.size.CGFloat width = width;
  v16.size.CGFloat height = height;
  CGFloat MidX = CGRectGetMidX(v16);
  v17.origin.CGFloat x = x;
  v17.origin.CGFloat y = y;
  v17.size.CGFloat width = width;
  v17.size.CGFloat height = height;
  double v13 = CGRectGetMaxY(v17) + v11 * v9 + 1.0;
  double v14 = MidX;
  result.CGFloat y = v13;
  result.CGFloat x = v14;
  return result;
}

- (CGPoint)positionOfStandardKnob:(id)a3 forBounds:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  if (![a3 tag] || (unint64_t)objc_msgSend(a3, "tag") >= 0xA)
  {
    double v10 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v11 = [NSString stringWithUTF8String:"-[TSDRep positionOfStandardKnob:forBounds:]"];
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDRep.m"), 1626, @"-positionOfStandardKnob:forBounds: works for standard knobs only");
  }
  [a3 offset];
  double v13 = v12;
  double v15 = v14;
  if (![a3 offsetValid])
  {
    [(TSDInteractiveCanvasController *)[(TSDRep *)self interactiveCanvasController] viewScale];
    if (width * v16 <= 16.0)
    {
      if ([a3 tag] == 1 || objc_msgSend(a3, "tag") == 4 || objc_msgSend(a3, "tag") == 7)
      {
        [(TSDInteractiveCanvasController *)[(TSDRep *)self interactiveCanvasController] viewScale];
        double v13 = v13 - (8.0 / v17 + width * -0.5);
      }
      else if ([a3 tag] == 3 || objc_msgSend(a3, "tag") == 6 || objc_msgSend(a3, "tag") == 9)
      {
        [(TSDInteractiveCanvasController *)[(TSDRep *)self interactiveCanvasController] viewScale];
        double v13 = v13 + 8.0 / v24 + width * -0.5;
      }
    }
    [(TSDInteractiveCanvasController *)[(TSDRep *)self interactiveCanvasController] viewScale];
    if (height * v18 <= 16.0)
    {
      if ([a3 tag] == 1 || objc_msgSend(a3, "tag") == 2 || objc_msgSend(a3, "tag") == 3)
      {
        [(TSDInteractiveCanvasController *)[(TSDRep *)self interactiveCanvasController] viewScale];
        double v15 = v15 - (8.0 / v19 + height * -0.5);
      }
      else if ([a3 tag] == 7 || objc_msgSend(a3, "tag") == 8 || objc_msgSend(a3, "tag") == 9)
      {
        [(TSDInteractiveCanvasController *)[(TSDRep *)self interactiveCanvasController] viewScale];
        double v15 = v15 + 8.0 / v25 + height * -0.5;
      }
    }
    objc_msgSend(a3, "setOffset:", v13, v15);
    [a3 setOffsetValid:1];
  }
  double v20 = TSDPositionOfKnobOnRectangle([a3 tag], x, y, width, height);

  double v22 = TSDAddPoints(v20, v21, v13);
  result.double y = v23;
  result.double x = v22;
  return result;
}

- (void)invalidateKnobPositions
{
  self->mKnobPositionsInvalid = 1;
  [(TSDRep *)self i_invalidateSelectionHighlightLayer];
  mCanvas = self->mCanvas;

  [(TSDCanvas *)mCanvas invalidateLayers];
}

- (id)newTrackerForKnob:(id)a3
{
  return 0;
}

- (void)p_toggleHyperlinkUIVisibility
{
  double v3 = [(TSDRep *)self interactiveCanvasController];

  [(TSDInteractiveCanvasController *)v3 toggleHyperlinkUIForRep:self];
}

- (void)p_actionGhostKnobHit
{
  double v3 = [(TSDRep *)self interactiveCanvasController];

  [(TSDInteractiveCanvasController *)v3 actionGhostKnobHitForRep:self];
}

- (id)knobForTag:(unint64_t)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  double v4 = [(TSDRep *)self knobs];
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(v4);
    }
    double v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if ([v9 tag] == a3) {
      return v9;
    }
    if (v6 == ++v8)
    {
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (double)additionalRotationForKnobOrientation
{
  double v2 = [(TSDRep *)self layout];
  if (v2) {
    [(TSDAbstractLayout *)v2 transformInRoot];
  }
  else {
    memset(v4, 0, sizeof(v4));
  }
  return TSDTransformAngle((double *)v4);
}

- (BOOL)shouldShowSelectionHighlight
{
  BOOL v3 = [(TSDRep *)self isSelectedIgnoringLocking];
  if (v3)
  {
    if (![(TSDRep *)self isInDynamicOperation]
      || self->mShowKnobsWhenManipulated && self->mKnobsAreShowing)
    {
      LOBYTE(v3) = ![(TSDKnobTracker *)self->mKnobTracker shouldHideSelectionHighlight];
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (BOOL)shouldCreateKnobs
{
  return 1;
}

- (BOOL)shouldCreateSelectionKnobs
{
  BOOL v3 = [(TSDRep *)self isSelected];
  if (v3) {
    LOBYTE(v3) = ![(TSDInteractiveCanvasController *)[(TSDRep *)self interactiveCanvasController] usesAlternateDrawableSelectionHighlight];
  }
  return v3;
}

- (BOOL)shouldCreateLockedKnobs
{
  BOOL v3 = [(TSDRep *)self isSelectedIgnoringLocking];
  if (v3)
  {
    LOBYTE(v3) = [(TSDRep *)self isLocked];
  }
  return v3;
}

- (BOOL)shouldCreateCommentKnob
{
  objc_opt_class();
  [(TSDRep *)self info];
  BOOL v3 = (void *)TSUDynamicCast();
  if ([(TSDInteractiveCanvasController *)[(TSDCanvas *)[(TSDRep *)self canvas] canvasController] shouldDisplayCommentUIForInfo:v3])
  {
    BOOL v4 = [(TSDRep *)self shouldShowCommentHighlight];
  }
  else
  {
    BOOL v4 = 0;
  }
  return [v3 comment] && v4;
}

- (BOOL)shouldShowCommentUIDirectlyOverRep
{
  return ![(TSDRep *)self isSelected];
}

- (BOOL)isEditingPath
{
  return 0;
}

- (BOOL)shouldDisplayHyperlinkUI
{
  LODWORD(v3) = [(TSDInteractiveCanvasController *)[(TSDRep *)self interactiveCanvasController] shouldShowOnRepHyperlinkUI];
  if (v3)
  {
    if ([(TSDRep *)self isEditingPath])
    {
      LOBYTE(v3) = 0;
    }
    else
    {
      objc_opt_class();
      [(TSDRep *)self info];
      BOOL v3 = (void *)TSUDynamicCast();
      if (v3) {
        LOBYTE(v3) = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v3, "hyperlinkURL"), "absoluteString"), "length") != 0;
      }
    }
  }
  return (char)v3;
}

- (BOOL)shouldShowKnobs
{
  return ![(TSDRep *)self isInDynamicOperation]
      || self->mShowKnobsWhenManipulated
      || self->mKnobTracker != 0;
}

- (void)showKnobsDuringManipulation:(BOOL)a3
{
  self->mShowKnobsWhenManipulated = a3;
}

- (void)turnKnobsOn
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  self->mKnobsAreShowing = 1;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  mKnobs = self->mKnobs;
  uint64_t v4 = [(NSArray *)mKnobs countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(mKnobs);
        }
        uint64_t v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        objc_msgSend((id)objc_msgSend(v8, "layer"), "opacity");
        if (v9 != 1.0 && ![(TSDRep *)self directlyManagesVisibilityOfKnob:v8])
        {
          double v10 = (void *)[v8 layer];
          LODWORD(v11) = 1.0;
          [v10 setOpacity:v11];
        }
      }
      uint64_t v5 = [(NSArray *)mKnobs countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
}

- (void)fadeKnobsIn
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  self->mKnobsAreShowing = 1;
  BOOL v3 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:@"opacity"];
  [v3 setDelegate:0];
  [v3 setDuration:0.150000006];
  LODWORD(v4) = 1.0;
  objc_msgSend(v3, "setToValue:", objc_msgSend(NSNumber, "numberWithFloat:", v4));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  mKnobs = self->mKnobs;
  uint64_t v6 = [(NSArray *)mKnobs countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(mKnobs);
        }
        double v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        objc_msgSend((id)objc_msgSend(v10, "layer"), "opacity");
        if (v11 != 1.0 && ![(TSDRep *)self directlyManagesVisibilityOfKnob:v10])
        {
          long long v12 = NSNumber;
          objc_msgSend((id)objc_msgSend(v10, "layer"), "opacity");
          objc_msgSend(v3, "setFromValue:", objc_msgSend(v12, "numberWithFloat:"));
          long long v13 = (void *)[v10 layer];
          LODWORD(v14) = 1.0;
          [v13 setOpacity:v14];
          objc_msgSend((id)objc_msgSend(v10, "layer"), "addAnimation:forKey:", v3, @"fade in");
        }
      }
      uint64_t v7 = [(NSArray *)mKnobs countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
}

- (void)fadeKnobsOut
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  self->mKnobsAreShowing = 0;
  BOOL v3 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:@"opacity"];
  [v3 setDelegate:0];
  [v3 setDuration:0.150000006];
  LODWORD(v4) = 1.0;
  objc_msgSend(v3, "setFromValue:", objc_msgSend(NSNumber, "numberWithFloat:", v4));
  objc_msgSend(v3, "setToValue:", objc_msgSend(NSNumber, "numberWithFloat:", 0.0));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  mKnobs = self->mKnobs;
  uint64_t v6 = [(NSArray *)mKnobs countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(mKnobs);
        }
        double v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        objc_msgSend((id)objc_msgSend(v10, "layer"), "opacity");
        if (v11 == 1.0 && ![(TSDRep *)self directlyManagesVisibilityOfKnob:v10])
        {
          objc_msgSend((id)objc_msgSend(v10, "layer"), "setOpacity:", 0.0);
          objc_msgSend((id)objc_msgSend(v10, "layer"), "addAnimation:forKey:", v3, @"fade out");
        }
      }
      uint64_t v7 = [(NSArray *)mKnobs countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (BOOL)directlyManagesVisibilityOfKnob:(id)a3
{
  return [a3 tag] == 31;
}

- (double)selectionHighlightWidth
{
  BOOL v2 = [(TSDInteractiveCanvasController *)[(TSDRep *)self interactiveCanvasController] usesAlternateDrawableSelectionHighlight];
  double result = 1.0;
  if (v2) {
    return 5.0;
  }
  return result;
}

- (void)setSelectionHighlightColor:(CGColor *)a3
{
  Copdouble y = CGColorCreateCopy(a3);
  CGColorRelease(self->mDefaultSelectionHighlightColor);
  self->mDefaultSelectionHighlightColor = Copy;
}

- (CGColor)selectionHighlightColor
{
  if ([(TSDRep *)self isLocked])
  {
    if (selectionHighlightColor_sOnce != -1) {
      dispatch_once(&selectionHighlightColor_sOnce, &__block_literal_global_24);
    }
    return (CGColor *)selectionHighlightColor_sLockedSelectionHighlightColor;
  }
  else
  {
    double result = self->mDefaultSelectionHighlightColor;
    if (!result)
    {
      double result = CGColorCreateCopy([(TSDInteractiveCanvasController *)[(TSDRep *)self interactiveCanvasController] selectionHighlightColor]);
      self->mDefaultSelectionHighlightColor = result;
    }
  }
  return result;
}

CGColorRef __33__TSDRep_selectionHighlightColor__block_invoke()
{
  CGColorRef result = CGColorRetain((CGColorRef)objc_msgSend((id)objc_msgSend(MEMORY[0x263F7C808], "colorWithRed:green:blue:alpha:", 0.85, 0.85, 0.85, 1.0), "CGColor"));
  selectionHighlightColor_sLockedSelectionHighlightColor = (uint64_t)result;
  return result;
}

- (CGAffineTransform)transformForHighlightLayer
{
  if (self->mKnobTracker)
  {
    mKnobTracker = self->mKnobTracker;
    return [(TSDKnobTracker *)mKnobTracker transformInRootForStandardKnobs];
  }
  else
  {
    CGColorRef result = [(TSDRep *)self layout];
    if (result)
    {
      return (CGAffineTransform *)[(CGAffineTransform *)result transformInRoot];
    }
    else
    {
      *(_OWORD *)&retstr->c = 0u;
      *(_OWORD *)&retstr->tdouble x = 0u;
      *(_OWORD *)&retstr->a = 0u;
    }
  }
  return result;
}

- (id)selectionHighlightLayer
{
  mSelectionHighlightLayer = self->mSelectionHighlightLayer;
  if (mSelectionHighlightLayer
    || (mSelectionHighlightLayer = (CALayer *)objc_alloc_init(MEMORY[0x263F15880]),
        [(CALayer *)mSelectionHighlightLayer setFillColor:0],
        [(TSDRep *)self selectionHighlightWidth],
        -[CALayer setLineWidth:](mSelectionHighlightLayer, "setLineWidth:"),
        [(CALayer *)mSelectionHighlightLayer setDelegate:[(TSDRep *)self interactiveCanvasController]], (self->mSelectionHighlightLayer = mSelectionHighlightLayer) != 0))
  {
    if (!self->mSelectionHighlightLayerValid)
    {
      objc_opt_class();
      double v4 = (void *)TSUDynamicCast();
      if (v4)
      {
        uint64_t v5 = v4;
        objc_msgSend(v4, "setStrokeColor:", -[TSDRep selectionHighlightColor](self, "selectionHighlightColor"));
        [(TSDRep *)self selectionHighlightWidth];
        objc_msgSend(v5, "setLineWidth:");
        [(TSDCanvas *)self->mCanvas viewScale];
        CGFloat v7 = v6;
        [(TSDRep *)self boundsForHighlightLayer];
        CGFloat v9 = v8;
        CGFloat v11 = v10;
        CGFloat v13 = v12;
        CGFloat v15 = v14;
        memset(&v24, 0, sizeof(v24));
        [(TSDRep *)self transformForHighlightLayer];
        CGAffineTransformMakeScale(&t2, v7, v7);
        CGAffineTransform v21 = v24;
        CGAffineTransformConcat(&v23, &v21, &t2);
        CGAffineTransform v24 = v23;
        [v5 lineWidth];
        double v17 = v16;
        [(TSDCanvas *)[(TSDRep *)self canvas] contentsScale];
        double v19 = TSDCreateAADefeatedRectPath((uint64_t)&v24, v9, v11, v13, v15, v17, v18);
        [v5 setPath:v19];
        CGPathRelease(v19);
      }
      self->mSelectionHighlightLayerValid = 1;
      return self->mSelectionHighlightLayer;
    }
  }
  return mSelectionHighlightLayer;
}

- (void)i_invalidateSelectionHighlightLayer
{
  self->mSelectionHighlightLayerValid = 0;
}

- (CGPoint)convertKnobPositionToUnscaledCanvas:(CGPoint)a3
{
  if (self->mKnobTracker) {
    -[TSDKnobTracker convertKnobPositionToUnscaledCanvas:](self->mKnobTracker, "convertKnobPositionToUnscaledCanvas:", a3.x, a3.y);
  }
  else {
    -[TSDRep convertNaturalPointToUnscaledCanvas:](self, "convertNaturalPointToUnscaledCanvas:", a3.x, a3.y);
  }
  result.double y = v4;
  result.double x = v3;
  return result;
}

- (id)p_addLayersForKnobsToArray:(id)a3 withDelegate:(id)a4 isOverlay:(BOOL)a5
{
  CGFloat v9 = [(TSDRep *)self interactiveCanvasController];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  double v10 = __60__TSDRep_p_addLayersForKnobsToArray_withDelegate_isOverlay___block_invoke;
  double v14 = __60__TSDRep_p_addLayersForKnobsToArray_withDelegate_isOverlay___block_invoke;
  CGFloat v15 = &unk_2646B1600;
  double v16 = self;
  BOOL v17 = a5;
  if (!a3)
  {
    a3 = (id)[MEMORY[0x263EFF980] array];
    double v10 = v14;
  }
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __60__TSDRep_p_addLayersForKnobsToArray_withDelegate_isOverlay___block_invoke_2;
  v12[3] = &unk_2646B1628;
  v12[4] = a4;
  void v12[5] = v9;
  v12[6] = self;
  v12[7] = a3;
  v10((uint64_t)v13, (uint64_t)v12);
  return a3;
}

uint64_t __60__TSDRep_p_addLayersForKnobsToArray_withDelegate_isOverlay___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  double v4 = objc_msgSend(*(id *)(a1 + 32), "knobs", 0);
  uint64_t result = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (result)
  {
    uint64_t v6 = result;
    uint64_t v7 = *(void *)v16;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        CGFloat v9 = *(void **)(*((void *)&v15 + 1) + 8 * v8);
        uint64_t v10 = [v9 layer];
        if (v10)
        {
          CGFloat v11 = (void *)v10;
          int v12 = *(unsigned __int8 *)(a1 + 40);
          if (v12 != [v9 shouldDisplayDirectlyOverRep])
          {
            if (*(unsigned char *)(*(void *)(a1 + 32) + 34)
              || ([v11 opacity], v13 != 0.0)
              || (objc_msgSend((id)objc_msgSend(v11, "presentationLayer"), "opacity"), v14 != 0.0)
              || [*(id *)(a1 + 32) directlyManagesVisibilityOfKnob:v9])
            {
              (*(void (**)(uint64_t, void *, void *))(a2 + 16))(a2, v9, v11);
            }
          }
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t result = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      uint64_t v6 = result;
    }
    while (result);
  }
  return result;
}

uint64_t __60__TSDRep_p_addLayersForKnobsToArray_withDelegate_isOverlay___block_invoke_2(uint64_t *a1, void *a2, void *a3)
{
  if (![a3 delegate])
  {
    uint64_t v6 = a1[4];
    if (!v6) {
      uint64_t v6 = a1[5];
    }
    [a3 setDelegate:v6];
  }
  uint64_t v7 = (void *)a1[6];
  [a2 position];
  objc_msgSend(v7, "convertKnobPositionToUnscaledCanvas:");
  objc_msgSend((id)a1[5], "convertUnscaledToBoundsPoint:");
  double v9 = v8;
  double v11 = v10;
  [a3 bounds];
  double v16 = TSDCenterOfRect(v12, v13, v14, v15);
  double v17 = TSDSubtractPoints(v9, v11, v16);
  double v19 = v18;
  objc_msgSend((id)objc_msgSend((id)a1[5], "canvas"), "contentsScale");
  double v21 = TSDRoundedPointForScale(v17, v19, v20);
  double v24 = TSDAddPoints(v21, v22, v16);
  double v25 = v23;
  if (fabs(v24) == INFINITY || (double v26 = fabs(v23), v26 >= INFINITY) && v26 <= INFINITY)
  {
    double v27 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v28 = [NSString stringWithUTF8String:"-[TSDRep p_addLayersForKnobsToArray:withDelegate:isOverlay:]_block_invoke_2"];
    uint64_t v29 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDRep.m"];
    return [v27 handleFailureInFunction:v28 file:v29 lineNumber:2044 description:@"Knob layer position must be finite"];
  }
  else
  {
    [MEMORY[0x263F158F8] begin];
    [MEMORY[0x263F158F8] setDisableActions:1];
    objc_msgSend(a3, "setPosition:", v24, v25);
    [MEMORY[0x263F158F8] commit];
    float64x2_t v31 = (void *)a1[7];
    return [v31 addObject:a3];
  }
}

- (id)overlayLayers
{
  double v3 = (void *)[MEMORY[0x263EFF980] array];
  double v4 = [(TSDRep *)self interactiveCanvasController];
  if ([(TSDRep *)self shouldShowSelectionHighlight])
  {
    id v5 = [(TSDRep *)self selectionHighlightLayer];
    if (v5) {
      [v3 addObject:v5];
    }
  }
  if ([(TSDInteractiveCanvasController *)v4 shouldPopKnobsOutsideEnclosingScrollView])
  {
    return v3;
  }

  return [(TSDRep *)self p_addLayersForKnobsToArray:v3 withDelegate:v4 isOverlay:1];
}

- (id)popoutLayers
{
  if (![(TSDInteractiveCanvasController *)[(TSDRep *)self interactiveCanvasController] shouldPopKnobsOutsideEnclosingScrollView])return 0; {
  double v3 = [(TSDRep *)self interactiveCanvasController];
  }

  return [(TSDRep *)self p_addLayersForKnobsToArray:0 withDelegate:v3 isOverlay:1];
}

- (BOOL)isInDynamicOperation
{
  return [(TSDLayout *)[(TSDRep *)self layout] layoutState] != 0;
}

- (CGPoint)i_dragOffset
{
  [(TSDLayoutGeometry *)[(TSDLayout *)[(TSDRep *)self layout] dynamicGeometry] frame];
  double v4 = v3;
  double v6 = v5;
  [(TSDLayoutGeometry *)[(TSDLayout *)[(TSDRep *)self layout] originalGeometry] frame];

  double v8 = TSDSubtractPoints(v4, v6, v7);
  result.double y = v9;
  result.double x = v8;
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

- (void)dynamicRotateDidBegin
{
  [(TSDRep *)self recursivelyPerformSelector:sel_p_dynamicRotateDidBegin];
  mCanvas = self->mCanvas;

  [(TSDCanvas *)mCanvas layoutInvalidated];
}

- (void)p_dynamicRotateDidBegin
{
  if (![(TSDRep *)self isInDynamicOperation])
  {
    double v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSDRep p_dynamicRotateDidBegin]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDRep.m"), 2354, @"dynamic rotate began outside of dynamic operation");
  }
  double v5 = [(TSDRep *)self layout];

  [(TSDLayout *)v5 beginRotate];
}

- (BOOL)isBeingRotated
{
  return [(TSDLayout *)[(TSDRep *)self layout] layoutState] == 3;
}

- (double)angleForRotation
{
  BOOL v2 = objc_msgSend(-[TSDRep info](self, "info"), "geometry");

  [v2 angle];
  return result;
}

- (CGPoint)unscaledGuidePosition
{
  [(TSDRep *)self naturalBounds];
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

  -[TSDRep convertNaturalPointToUnscaledCanvas:](self, "convertNaturalPointToUnscaledCanvas:", MidX, MinY);
  result.CGFloat y = v10;
  result.CGFloat x = v9;
  return result;
}

- (BOOL)handleSingleTapAtPoint:(CGPoint)a3 onKnob:(id)a4
{
  return 0;
}

- (BOOL)handleDoubleTapAtPoint:(CGPoint)a3 onKnob:(id)a4
{
  return 0;
}

- (BOOL)wantsEditMenuForTapAtPoint:(CGPoint)a3 onKnob:(id)a4
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

- (BOOL)handleSingleTapAtPoint:(CGPoint)a3
{
  return 0;
}

- (BOOL)handleDoubleTapAtPoint:(CGPoint)a3
{
  return 0;
}

- (BOOL)canClipThemeContentToCanvas
{
  if ([(TSDRep *)self isPlaceholder]) {
    return 0;
  }
  id v4 = [(TSDRep *)self info];

  return [v4 isThemeContent];
}

- (BOOL)wantsToHandleTapsOnContainingGroup
{
  return 0;
}

- (BOOL)wantsToHandleTapsWhenLocked
{
  return 0;
}

- (void)setTexture:(id)a3
{
  mTexture = self->mTexture;
  if (mTexture != a3)
  {
    [(TSDTextureSet *)mTexture teardown];

    self->mTexture = (TSDTextureSet *)a3;
  }
}

- (double)textureAngle
{
  double v3 = [(TSDRep *)self layout];
  if (v3) {
    [(TSDAbstractLayout *)v3 transformInRoot];
  }
  else {
    memset(v9, 0, sizeof(v9));
  }
  double v4 = -TSDTransformAngle((double *)v9);
  mTextureActionAttributes = self->mTextureActionAttributes;
  if (mTextureActionAttributes)
  {
    id v6 = [(NSDictionary *)mTextureActionAttributes valueForKey:@"sfx-action-rotation-angle"];
    if (v6)
    {
      [v6 floatValue];
      return v4 - v7;
    }
  }
  return v4;
}

- (void)markTextureDirty
{
  self->mTexture = 0;
  self->mTextureContext = 0;
}

- (void)setTextureDeliveryStyle:(unint64_t)a3
{
  if (self->mTextureDeliveryStyle != a3) {
    [(TSDRep *)self markTextureDirty];
  }
  self->mTextureDeliveryStyle = a3;
}

- (void)setTextureByGlyphStyle:(int)a3
{
  if (self->mTextureByGlyphStyle != a3) {
    [(TSDRep *)self markTextureDirty];
  }
  self->mTextureByGlyphStyle = a3;
}

- (void)setTextureActionAttributes:(id)a3
{
  if (a3 || self->mTextureActionAttributes)
  {
    mTexture = self->mTexture;
    if ((!mTexture || ![(TSDTextureSet *)mTexture alternateLayer])
      && ([a3 isEqualToDictionary:self->mTextureActionAttributes] & 1) == 0)
    {

      if (a3) {
        id v6 = (NSDictionary *)[objc_alloc(NSDictionary) initWithDictionary:a3];
      }
      else {
        id v6 = 0;
      }
      self->mTextureActionAttributes = v6;
      [(TSDRep *)self markTextureDirty];
    }
  }
}

- (CGAffineTransform)unRotatedTransform:(SEL)a3
{
  long long v7 = *(_OWORD *)&a4->c;
  *(_OWORD *)&v21.a = *(_OWORD *)&a4->a;
  *(_OWORD *)&v21.c = v7;
  *(_OWORD *)&v21.tCGFloat x = *(_OWORD *)&a4->tx;
  double v8 = TSDTransformAngle(&v21.a);
  [(TSDRep *)self centerForRotation];
  double v10 = v9;
  CGFloat v12 = v11;
  long long v13 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&v21.a = *MEMORY[0x263F000D0];
  *(_OWORD *)&v21.c = v13;
  *(_OWORD *)&v21.tCGFloat x = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  *(_OWORD *)&t1.a = *(_OWORD *)&v21.a;
  *(_OWORD *)&t1.c = v13;
  *(_OWORD *)&t1.tCGFloat x = *(_OWORD *)&v21.tx;
  CGAffineTransformTranslate(&v21, &t1, v9, v12);
  CGAffineTransform v19 = v21;
  CGAffineTransformRotate(&t1, &v19, v8 * -3.14159265 / 180.0);
  CGAffineTransform v21 = t1;
  CGAffineTransform v19 = t1;
  CGAffineTransformTranslate(&t1, &v19, -v10, -v12);
  CGAffineTransform v21 = t1;
  long long v14 = *(_OWORD *)&a4->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&a4->a;
  *(_OWORD *)&t1.c = v14;
  *(_OWORD *)&t1.tCGFloat x = *(_OWORD *)&a4->tx;
  if (TSDIsTransformFlipped(&t1.a))
  {
    long long v15 = *(_OWORD *)&a4->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&a4->a;
    *(_OWORD *)&t1.c = v15;
    *(_OWORD *)&t1.tCGFloat x = *(_OWORD *)&a4->tx;
    *(_OWORD *)&v19.a = *(_OWORD *)&v21.a;
    *(_OWORD *)&v19.c = *(_OWORD *)&v21.c;
    long long v16 = *(_OWORD *)&v21.tx;
  }
  else
  {
    CGAffineTransform t1 = v21;
    long long v17 = *(_OWORD *)&a4->c;
    *(_OWORD *)&v19.a = *(_OWORD *)&a4->a;
    *(_OWORD *)&v19.c = v17;
    long long v16 = *(_OWORD *)&a4->tx;
  }
  *(_OWORD *)&v19.tCGFloat x = v16;
  return CGAffineTransformConcat(retstr, &t1, &v19);
}

- (void)p_setMagicMoveTextureAttributes:(id)a3
{
  objc_msgSend((id)objc_msgSend(-[TSDRep info](self, "info"), "geometry"), "angle");
  [a3 setTextureAngle:v5 * 0.0174532925];
  [(TSDRep *)self naturalBounds];
  objc_msgSend(a3, "setTextureContentRect:");
  uint64_t v6 = objc_msgSend(-[TSDCanvas topLevelReps](-[TSDRep canvas](self, "canvas"), "topLevelReps"), "indexOfObject:", self);

  [a3 setTextureZOrder:v6];
}

- (id)textureForContext:(id)a3
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  if (self->mTexture
    && [a3 isEqual:self->mTextureContext]
    && ![(TSDRep *)self temporaryMixingLayout])
  {
    return self->mTexture;
  }
  uint64_t v5 = [a3 isMagicMove];
  uint64_t v6 = (void *)TSUProtocolCast();
  memset(&v63, 0, sizeof(v63));
  long long v7 = [(TSDRep *)self layout];
  if (v7) {
    [(TSDAbstractLayout *)v7 transformInRoot];
  }
  else {
    memset(&v63, 0, sizeof(v63));
  }
  mTextureActionAttributes = self->mTextureActionAttributes;
  if (mTextureActionAttributes)
  {
    id v9 = [(NSDictionary *)mTextureActionAttributes valueForKey:@"sfx-action-rotation-angle"];
    if (v9)
    {
      [v9 floatValue];
      float v11 = v10 * 0.0174532925;
      [(TSDRep *)self centerForRotation];
      double v13 = v12;
      double v15 = v14;
      CGAffineTransform v61 = v63;
      CGAffineTransformTranslate(&v62, &v61, v12, v14);
      CGAffineTransform v63 = v62;
      CGAffineTransform v61 = v62;
      CGAffineTransformRotate(&v62, &v61, v11);
      CGAffineTransform v63 = v62;
      CGAffineTransform v61 = v62;
      CGAffineTransformTranslate(&v62, &v61, -v13, -v15);
      CGAffineTransform v63 = v62;
    }
  }
  if (v5)
  {
    CGAffineTransform v61 = v63;
    [(TSDRep *)self unRotatedTransform:&v61];
    CGAffineTransform v63 = v62;
  }
  [(TSDCanvas *)self->mCanvas viewScale];
  double v17 = v16;
  [(TSDRep *)self clipRect];
  CGFloat x = v66.origin.x;
  CGFloat y = v66.origin.y;
  CGFloat width = v66.size.width;
  CGFloat height = v66.size.height;
  CGAffineTransform v62 = v63;
  CGRect v67 = CGRectApplyAffineTransform(v66, &v62);
  double v21 = TSDMultiplyRectScalar(v67.origin.x, v67.origin.y, v67.size.width, v67.size.height, v17);
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  CGFloat v27 = v26;
  [(TSDRep *)self naturalBounds];
  CGAffineTransform v62 = v63;
  CGRect v69 = CGRectApplyAffineTransform(v68, &v62);
  double v46 = TSDMultiplyRectScalar(v69.origin.x, v69.origin.y, v69.size.width, v69.size.height, v17);
  v70.origin.CGFloat x = v21;
  v70.origin.CGFloat y = v23;
  v70.size.CGFloat width = v25;
  v70.size.CGFloat height = v27;
  CGRect v71 = CGRectIntegral(v70);
  double v28 = v71.origin.x;
  double v29 = v71.origin.y;
  double v30 = v71.size.width;
  double v31 = v71.size.height;
  v53[0] = MEMORY[0x263EF8330];
  v53[1] = 3221225472;
  v53[2] = __28__TSDRep_textureForContext___block_invoke;
  v53[3] = &unk_2646B1650;
  CGRect v54 = v71;
  CGFloat v55 = x;
  CGFloat v56 = y;
  CGFloat v57 = width;
  CGFloat v58 = height;
  double v59 = v17;
  CGAffineTransform v60 = v63;
  id v48 = a3;
  v53[4] = a3;
  v53[5] = self;
  v53[6] = v6;
  float64x2_t v32 = objc_alloc_init(TSDTextureSet);
  float64x2_t v33 = [TSDTexturedRectangle alloc];
  double v34 = TSDSubtractPoints(v28, v29, v46);
  float64x2_t v36 = -[TSDTexturedRectangle initWithSize:offset:renderBlock:](v33, "initWithSize:offset:renderBlock:", v53, v30, v31, v34, v35);
  uint64_t v37 = v5;
  if (v5)
  {
    if (([v48 shouldNotAddContainedReps] & 1) == 0)
    {
      uint64_t v38 = [MEMORY[0x263F089D8] string];
      if (v6)
      {
        long long v39 = (void *)v38;
        long long v51 = 0u;
        long long v52 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        long long v40 = (void *)[v6 childReps];
        uint64_t v41 = [v40 countByEnumeratingWithState:&v49 objects:v64 count:16];
        if (v41)
        {
          uint64_t v42 = v41;
          uint64_t v43 = *(void *)v50;
          do
          {
            for (uint64_t i = 0; i != v42; ++i)
            {
              if (*(void *)v50 != v43) {
                objc_enumerationMutation(v40);
              }
              [v39 appendFormat:@"%@ ", objc_opt_class()];
            }
            uint64_t v42 = [v40 countByEnumeratingWithState:&v49 objects:v64 count:16];
          }
          while (v42);
        }
      }
    }
  }
  [(TSDTextureSet *)v32 setIsMagicMove:v37];
  [(TSDTexturedRectangle *)v36 setTextureType:5];
  [(TSDTexturedRectangle *)v36 setTextureOpacity:1.0];
  [(TSDTextureSet *)v32 addRenderable:v36];

  [(TSDRep *)self opacity];
  -[TSDTextureSet setTextureOpacity:](v32, "setTextureOpacity:");
  [(TSDRep *)self centerForRotation];
  -[TSDTextureSet setCenter:](v32, "setCenter:");
  if (([v48 shouldNotCacheTexture] & 1) == 0)
  {
    [(TSDRep *)self setTextureContext:v48];
    [(TSDRep *)self setTexture:v32];
  }
  return v32;
}

uint64_t __28__TSDRep_textureForContext___block_invoke(uint64_t a1, CGContextRef c)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  CGContextSetAllowsFontSmoothing(c, 0);
  CGContextSetAllowsFontSubpixelQuantization(c, 0);
  CGContextTranslateCTM(c, -*(double *)(a1 + 56), -*(double *)(a1 + 64));
  if ([*(id *)(a1 + 32) shouldDistortToFit])
  {
    double v4 = *(double *)(a1 + 72) / *(double *)(a1 + 104);
    double v5 = *(double *)(a1 + 80) / *(double *)(a1 + 112);
    uint64_t v6 = c;
  }
  else
  {
    double v4 = *(double *)(a1 + 120);
    uint64_t v6 = c;
    double v5 = v4;
  }
  CGContextScaleCTM(v6, v4, v5);
  long long v7 = *(_OWORD *)(a1 + 144);
  *(_OWORD *)&transform.a = *(_OWORD *)(a1 + 128);
  *(_OWORD *)&transform.c = v7;
  *(_OWORD *)&transform.tCGFloat x = *(_OWORD *)(a1 + 160);
  CGContextConcatCTM(c, &transform);
  CGContextSaveGState(c);
  [*(id *)(a1 + 40) drawInContext:c];
  CGContextRestoreGState(c);
  uint64_t result = [*(id *)(a1 + 32) shouldNotAddContainedReps];
  if ((result & 1) == 0)
  {
    uint64_t result = *(void *)(a1 + 48);
    if (result)
    {
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      id v9 = objc_msgSend((id)result, "childReps", 0);
      uint64_t result = [v9 countByEnumeratingWithState:&v14 objects:v19 count:16];
      if (result)
      {
        uint64_t v10 = result;
        uint64_t v11 = *(void *)v15;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v15 != v11) {
              objc_enumerationMutation(v9);
            }
            double v13 = *(void **)(*((void *)&v14 + 1) + 8 * v12);
            CGContextSaveGState(c);
            [v13 recursivelyDrawInContext:c];
            CGContextRestoreGState(c);
            ++v12;
          }
          while (v10 != v12);
          uint64_t result = [v9 countByEnumeratingWithState:&v14 objects:v19 count:16];
          uint64_t v10 = result;
        }
        while (result);
      }
    }
  }
  return result;
}

- (BOOL)shouldLayoutTilingLayer:(id)a3
{
  double v4 = [(TSDRep *)self interactiveCanvasController];

  return [(TSDInteractiveCanvasController *)v4 shouldLayoutTilingLayer:a3];
}

- (BOOL)canDrawTilingLayerInBackground:(id)a3
{
  if ([(TSDRep *)self mustDrawTilingLayerOnMainThread:a3]
    || ![(TSDInteractiveCanvasController *)[(TSDRep *)self interactiveCanvasController] supportsBackgroundTileRendering])
  {
    return 0;
  }
  double v4 = [(TSDRep *)self interactiveCanvasController];

  return [(TSDInteractiveCanvasController *)v4 currentlyScrolling];
}

- (BOOL)mustDrawTilingLayerOnMainThread:(id)a3
{
  double v4 = [(TSDRep *)self interactiveCanvasController];

  return [(TSDInteractiveCanvasController *)v4 mustDrawTilingLayerOnMainThread:a3];
}

- (CGRect)visibleBoundsForTilingLayer:(id)a3
{
  double v4 = [(TSDRep *)self interactiveCanvasController];

  [(TSDInteractiveCanvasController *)v4 visibleBoundsForTilingLayer:a3];
  result.size.CGFloat height = v8;
  result.size.CGFloat width = v7;
  result.origin.CGFloat y = v6;
  result.origin.CGFloat x = v5;
  return result;
}

- (id)queueForDrawingTilingLayerInBackground:(id)a3
{
  double v4 = [(TSDRep *)self interactiveCanvasController];
  id v5 = [(TSDInteractiveCanvasController *)[(TSDRep *)self interactiveCanvasController] layerForRep:self];

  return [(TSDInteractiveCanvasController *)v4 queueForDrawingTilingLayerInBackground:v5];
}

- (BOOL)shouldBeginDrawingTilingLayerInBackground:(id)a3 returningToken:(id *)a4 andQueue:(id *)a5
{
  double v8 = [(TSDRep *)self interactiveCanvasController];
  uint64_t v9 = [(TSDInteractiveCanvasController *)v8 layerForRep:self];

  return [(TSDInteractiveCanvasController *)v8 shouldBeginDrawingTilingLayerInBackground:v9 returningToken:a4 andQueue:a5];
}

- (void)didEndDrawingTilingLayerInBackground:(id)a3 withToken:(id)a4
{
  double v6 = [(TSDRep *)self interactiveCanvasController];
  uint64_t v7 = [(TSDInteractiveCanvasController *)v6 layerForRep:self];

  [(TSDInteractiveCanvasController *)v6 didEndDrawingTilingLayerInBackground:v7 withToken:a4];
}

- (BOOL)repDirectlyManagesContentsScaleOfLayer:(id)a3
{
  return 0;
}

- (void)processChangedProperty:(int)a3
{
  if (a3 <= 520)
  {
    if (a3 != 512)
    {
      if (a3 == 513) {
        [(TSDRep *)self invalidateKnobPositions];
      }
      return;
    }
LABEL_7:
    [(TSDRep *)self invalidateKnobs];
    return;
  }
  if (a3 == 521 || a3 == 524) {
    goto LABEL_7;
  }
}

- (id)beginEditing
{
  return 0;
}

- (BOOL)canEditWithEditor:(id)a3
{
  return 0;
}

- (void)willUpdateLayer:(id)a3
{
  BOOL v5 = ([a3 shouldRasterize] & 1) != 0 || -[TSDRep forceRasterization](self, "forceRasterization");

  [a3 setShouldRasterize:v5];
}

- (id)additionalLayersUnderLayer
{
  return 0;
}

- (id)additionalLayersOverLayer
{
  uint64_t v3 = [MEMORY[0x263EFF980] array];
  double v4 = [(TSDRep *)self interactiveCanvasController];

  return [(TSDRep *)self p_addLayersForKnobsToArray:v3 withDelegate:v4 isOverlay:0];
}

- (BOOL)shouldShowCommentHighlight
{
  objc_opt_class();
  [(TSDRep *)self info];
  uint64_t v3 = (void *)TSUDynamicCast();
  BOOL v4 = [(TSDInteractiveCanvasController *)[(TSDCanvas *)[(TSDRep *)self canvas] canvasController] shouldDisplayCommentUIForInfo:v3];
  if (self)
  {
    do
    {
      BOOL v5 = [(TSDRep *)self isBeingRotated];
      if (v5) {
        break;
      }
      self = [(TSDRep *)self parentRep];
    }
    while (self);
    char v6 = !v5;
    if (v3) {
      goto LABEL_5;
    }
    return 0;
  }
  char v6 = 1;
  if (!v3) {
    return 0;
  }
LABEL_5:
  if ([v3 comment]) {
    return v4 & v6;
  }
  else {
    return 0;
  }
}

- (void)invalidateAnnotationColor
{
  if ([(TSDRep *)self shouldShowCommentHighlight]) {
    [(TSDInteractiveCanvasController *)[(TSDRep *)self interactiveCanvasController] invalidateLayers];
  }

  [(TSDRep *)self invalidateKnobs];
}

- (id)allLayers
{
  uint64_t v3 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithObject:", -[TSDInteractiveCanvasController layerForRep:](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "layerForRep:", self));
  objc_msgSend(v3, "addObjectsFromArray:", -[TSDRep additionalLayersOverLayer](self, "additionalLayersOverLayer"));
  objc_msgSend(v3, "addObjectsFromArray:", -[TSDRep additionalLayersUnderLayer](self, "additionalLayersUnderLayer"));
  objc_msgSend(v3, "addObjectsFromArray:", -[TSDRep overlayLayers](self, "overlayLayers"));
  return v3;
}

- (BOOL)masksToBounds
{
  return 0;
}

- (BOOL)isOpaque
{
  return 0;
}

- (BOOL)isDraggable
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

- (int)dragTypeAtCanvasPoint:(CGPoint)a3
{
  if (objc_msgSend(-[TSDRep repForSelecting](self, "repForSelecting", a3.x, a3.y), "isSelected")) {
    return 3;
  }
  else {
    return 1;
  }
}

- (int)dragHUDAndGuidesTypeAtCanvasPoint:(CGPoint)a3
{
  return 2;
}

- (BOOL)isPlaceholder
{
  return 0;
}

- (BOOL)isLocked
{
  objc_opt_class();
  [(TSDRep *)self info];
  uint64_t v3 = (void *)TSUDynamicCast();
  if (v3 && ([v3 isLocked] & 1) != 0) {
    return 1;
  }
  BOOL v5 = [(TSDRep *)self parentRep];

  return [(TSDRep *)v5 isLocked];
}

- (BOOL)handlesEditMenu
{
  return 0;
}

- (id)itemsToAddToEditMenu
{
  return 0;
}

- (CGRect)targetRectForEditMenu
{
  double v2 = *MEMORY[0x263F001A0];
  double v3 = *(double *)(MEMORY[0x263F001A0] + 8);
  double v4 = *(double *)(MEMORY[0x263F001A0] + 16);
  double v5 = *(double *)(MEMORY[0x263F001A0] + 24);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

- (unint64_t)adjustedKnobForComputingResizeGeometry:(unint64_t)a3
{
  if (objc_msgSend(-[TSDRep info](self, "info"), "isAnchoredToText")
    && (objc_opt_class(),
        [(TSDRep *)self info],
        (objc_msgSend((id)objc_msgSend((id)TSUDynamicCast(), "exteriorTextWrap"), "isHTMLWrap") & 1) != 0)
    || objc_msgSend(-[TSDRep info](self, "info"), "isInlineWithText"))
  {
    unint64_t v5 = 9;
    if (a3 != 7) {
      unint64_t v5 = a3;
    }
    if (a3 == 4) {
      return 6;
    }
    else {
      return v5;
    }
  }
  return a3;
}

- (double)opacity
{
  return 1.0;
}

- (BOOL)resizeFromCenterOnly
{
  return 0;
}

- (BOOL)wantsGuidesWhileResizing
{
  return ![(TSDLayout *)[(TSDRep *)self layout] isInGroup];
}

- (CGPoint)centerForRotation
{
  double v2 = [(TSDRep *)self layout];

  [(TSDLayout *)v2 centerForRotation];
  result.CGFloat y = v4;
  result.CGFloat x = v3;
  return result;
}

- (BOOL)directlyManagesLayerContent
{
  return 0;
}

- (int)tilingMode
{
  return 0;
}

- (BOOL)canDrawInBackgroundDuringScroll
{
  return 0;
}

- (BOOL)canDrawInParallel
{
  return 0;
}

- (BOOL)mustDrawOnMainThreadForInteractiveCanvas
{
  return 0;
}

- (id)i_queueForTileProvider
{
  int64_t mTileProviderQueueLock = self->mTileProviderQueueLock;
  p_int64_t mTileProviderQueueLock = &self->mTileProviderQueueLock;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__TSDRep_i_queueForTileProvider__block_invoke;
  block[3] = &unk_2646AF7B8;
  block[4] = self;
  if (mTileProviderQueueLock != -1) {
    dispatch_once(p_mTileProviderQueueLock, block);
  }
  return self->mTileProviderQueue;
}

dispatch_queue_t __32__TSDRep_i_queueForTileProvider__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) canDrawInParallel]) {
    double v2 = MEMORY[0x263EF83A8];
  }
  else {
    double v2 = 0;
  }
  dispatch_queue_t result = dispatch_queue_create("com.apple.iwork.TSDTileProvider", v2);
  *(void *)(*(void *)(a1 + 32) + 256) = result;
  return result;
}

- (id)i_tileQueue
{
  int64_t mTileQueueOnce = self->mTileQueueOnce;
  p_int64_t mTileQueueOnce = &self->mTileQueueOnce;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __21__TSDRep_i_tileQueue__block_invoke;
  block[3] = &unk_2646AF7B8;
  block[4] = self;
  if (mTileQueueOnce != -1) {
    dispatch_once(p_mTileQueueOnce, block);
  }
  return self->mTileQueue;
}

TSDTilingBackgroundQueue *__21__TSDRep_i_tileQueue__block_invoke(uint64_t a1)
{
  dispatch_queue_t result = -[TSDTilingBackgroundQueue initWithAccessController:]([TSDTilingBackgroundQueue alloc], "initWithAccessController:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "canvas"), "accessController"));
  *(void *)(*(void *)(a1 + 32) + 232) = result;
  return result;
}

- (void)i_shutdownTileQueue
{
}

- (BOOL)wantsToDistortWithImagerContext
{
  return 0;
}

- (NSArray)hyperlinkRegions
{
  objc_opt_class();
  [(TSDRep *)self info];
  double v3 = (void *)TSUDynamicCast();
  if (!v3) {
    return 0;
  }
  double v4 = v3;
  if (![v3 hyperlinkURL]) {
    return 0;
  }
  if (!objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "hyperlinkURL"), "absoluteString"), "length")) {
    return 0;
  }
  objc_opt_class();
  [(TSDRep *)self layout];
  unint64_t v5 = (void *)TSUDynamicCast();
  if (!v5) {
    return 0;
  }
  char v6 = -[TSDHyperlinkRegion initWithURL:bezierPath:]([TSDHyperlinkRegion alloc], "initWithURL:bezierPath:", [v4 hyperlinkURL], objc_msgSend(v5, "i_wrapPath"));
  uint64_t v7 = (void *)MEMORY[0x263EFF8C0];

  return (NSArray *)[v7 arrayWithObject:v6];
}

- (void)willReplaceContentsFromRep:(id)a3
{
  id v5 = [(TSDRep *)self info];
  if (v5 != (id)[a3 info])
  {
    char v6 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v7 = [NSString stringWithUTF8String:"-[TSDRep willReplaceContentsFromRep:]"];
    [v6 handleFailureInFunction:v7, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDRep.m"), 3350, @"Reps do not share a common info:\n%@\n%@", self, a3 file lineNumber description];
  }
}

- (void)replaceContentsFromRep:(id)a3
{
  id v5 = [(TSDRep *)self info];
  if (v5 != (id)[a3 info])
  {
    char v6 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v7 = [NSString stringWithUTF8String:"-[TSDRep replaceContentsFromRep:]"];
    [v6 handleFailureInFunction:v7, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDRep.m"), 3357, @"Reps do not share a common info:\n%@\n%@", self, a3 file lineNumber description];
  }
}

- (id)delegateConformingToProtocol:(id)a3 forRep:(id)a4
{
  return 0;
}

- (TSDCanvas)canvas
{
  return self->mCanvas;
}

- (BOOL)forceRasterization
{
  return self->mForceRasterization;
}

- (void)setForceRasterization:(BOOL)a3
{
  self->mForceRasterization = a3;
}

- (TSDLayout)temporaryMixingLayout
{
  return self->mTemporaryMixingLayout;
}

- (void)setTemporaryMixingLayout:(id)a3
{
}

- (TSDContainerRep)parentRep
{
  return self->mParentRep;
}

- (TSDKnobTracker)currentKnobTracker
{
  return self->mKnobTracker;
}

- (void)setCurrentKnobTracker:(id)a3
{
  self->mKnobTracker = (TSDKnobTracker *)a3;
}

- (TSDTextureSet)texture
{
  return self->mTexture;
}

- (unint64_t)textureDeliveryStyle
{
  return self->mTextureDeliveryStyle;
}

- (int)textureByGlyphStyle
{
  return self->mTextureByGlyphStyle;
}

- (TSDTextureContext)textureContext
{
  return self->mTextureContext;
}

- (void)setTextureContext:(id)a3
{
}

- (unint64_t)textureStage
{
  return self->mTextureStage;
}

- (NSDictionary)textureActionAttributes
{
  return self->mTextureActionAttributes;
}

- (NSDictionary)textureAnimationInfo
{
  return self->mTextureAnimationInfo;
}

- (id)subviewsController
{
  if ([(TSDRep *)self parentRep]) {
    double v3 = [(TSDRep *)self parentRep];
  }
  else {
    double v3 = [(TSDInteractiveCanvasController *)[(TSDRep *)self interactiveCanvasController] layerHost];
  }

  return [(TSDRep *)v3 subviewsController];
}

- (CGRect)i_partition_deepClipRect
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  [(TSDRep *)self clipRect];
  CGFloat x = v2;
  CGFloat y = v4;
  CGFloat width = v6;
  CGFloat height = v8;
  uint64_t v10 = (void *)TSUProtocolCast();
  if (v10)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v11 = (void *)[v10 childReps];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v26;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v26 != v14) {
            objc_enumerationMutation(v11);
          }
          long long v16 = *(void **)(*((void *)&v25 + 1) + 8 * v15);
          memset(&v24, 0, sizeof(v24));
          long long v17 = objc_msgSend((id)objc_msgSend(v16, "layout"), "geometry");
          if (v17) {
            [v17 transform];
          }
          else {
            memset(&v23, 0, sizeof(v23));
          }
          CGAffineTransformInvert(&v24, &v23);
          objc_msgSend(v16, "i_partition_deepClipRect");
          CGAffineTransform v22 = v24;
          CGRect v35 = CGRectApplyAffineTransform(v31, &v22);
          v32.origin.CGFloat x = x;
          v32.origin.CGFloat y = y;
          v32.size.CGFloat width = width;
          v32.size.CGFloat height = height;
          CGRect v33 = CGRectUnion(v32, v35);
          CGFloat x = v33.origin.x;
          CGFloat y = v33.origin.y;
          CGFloat width = v33.size.width;
          CGFloat height = v33.size.height;
          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v13);
    }
  }
  double v18 = x;
  double v19 = y;
  double v20 = width;
  double v21 = height;
  result.size.CGFloat height = v21;
  result.size.CGFloat width = v20;
  result.origin.CGFloat y = v19;
  result.origin.CGFloat x = v18;
  return result;
}

- (BOOL)allowTrackingContainedRep:(id)a3
{
  return 1;
}

@end