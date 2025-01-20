@interface CRLImageRep
+ (BOOL)p_canRenderWithMaskToBoundsWithImageLayout:(id)a3;
+ (CGPath)p_newPathToBakeIntoSizedImageForSize:(CGSize)a3 withImageLayout:(id)a4 orientation:(int64_t)a5;
- (BOOL)allowDragAcrossPageBoundaries;
- (BOOL)allowsSupportedDynamicOperationsToBeRealTime;
- (BOOL)canDrawInParallel;
- (BOOL)canDrawShadowInOneStepWithChildren:(BOOL)a3;
- (BOOL)canEditMaskInMaskEditMode:(int64_t)a3;
- (BOOL)canPasteDataFromPhysicalKeyboard:(id)a3;
- (BOOL)canRemoveBackgroundFromImage;
- (BOOL)containsPoint:(CGPoint)a3 withPrecision:(BOOL)a4;
- (BOOL)demandsExclusiveSelection;
- (BOOL)directlyManagesLayerContent;
- (BOOL)dragDidChangeGeometry;
- (BOOL)exclusivelyProvidesGuidesWhileAligning;
- (BOOL)handleDoubleTapAtPoint:(CGPoint)a3 inputType:(int64_t)a4;
- (BOOL)hitRepChrome:(CGPoint)a3;
- (BOOL)imageDrawingHelperImageHasAlpha:(id)a3;
- (BOOL)imageDrawingHelperShouldGenerateSizedImageSynchronously:(id)a3;
- (BOOL)imageDrawingHelperShouldRetryGeneratingSizedImageLater:(id)a3;
- (BOOL)intersectsUnscaledRect:(CGRect)a3;
- (BOOL)isMaskScaleFromLayout;
- (BOOL)maskGeometryDidChange;
- (BOOL)p_allowedToEditMask;
- (BOOL)p_currentEditOperationDidChangeTheImageGeometry;
- (BOOL)p_directlyManagesContentForRenderable:(id)a3;
- (BOOL)p_drawsInOneStep;
- (BOOL)p_hitCacheGetCachedValue:(BOOL *)a3 forPoint:(CGPoint)a4;
- (BOOL)p_isResizingImageInMaskEditMode;
- (BOOL)p_isResizingMaskInMaskEditMode;
- (BOOL)p_okayToGenerateSizedImage;
- (BOOL)p_shouldBakeMaskIntoSizedImage;
- (BOOL)p_shouldRenderWithMaskMatchingImage;
- (BOOL)p_shouldRenderWithMaskToBounds;
- (BOOL)providesGuidesWhileAligning;
- (BOOL)shouldAllowReplacementFromPaste;
- (BOOL)shouldDisplayAsSpatial;
- (BOOL)shouldRasterizeRenderableDuringRotation;
- (BOOL)shouldShowDragHUD;
- (BOOL)shouldShowLoadingUI;
- (BOOL)shouldShowSelectionHighlight;
- (BOOL)shouldShowShadow;
- (BOOL)shouldShowSmartMaskKnobs;
- (BOOL)supportsAlternatePressureDrag;
- (BOOL)wantsGuidesWhileResizing;
- (BOOL)wantsToDistortWithImagerContext;
- (BOOL)wantsToHandleDoubleTapsWhenLocked;
- (CGAffineTransform)imageDrawingHelperImageTransformInRootForAntialiasingDefeat:(SEL)a3;
- (CGAffineTransform)transformForCollaboratorCursorRenderable;
- (CGAffineTransform)transformForHighlightLayer;
- (CGImage)imageForRemoveBackground;
- (CGImage)p_createImageForRemoveBackground;
- (CGPath)imageDrawingHelper:(id)a3 newMaskPathForSizedImageWithSize:(CGSize)a4 orientation:(int64_t)a5;
- (CGPoint)centerForGuideRenderablePlacement;
- (CGPoint)centerForRotation;
- (CGPoint)i_dragOffset;
- (CGPoint)positionOfStandardKnob:(id)a3 forBounds:(CGRect)a4;
- (CGPoint)unscaledGuidePosition;
- (CGRect)boundsForCollaboratorCursorRenderable;
- (CGRect)boundsForHighlightLayer;
- (CGRect)boundsForStandardKnobs;
- (CGRect)clipRect;
- (CGRect)frameInUnscaledCanvas;
- (CGRect)imageDrawingHelperImageRect:(id)a3;
- (CGRect)imageDrawingHelperRectForCenteringDownloadProgressPlaceholderImage:(id)a3;
- (CGRect)p_calcNewImageItemRectWithRawSize:(CGSize)a3 offset:(CGPoint)a4;
- (CGRect)snapRectForDynamicDragWithOffset:(CGPoint)a3;
- (CRLCanvasShapeRenderable)maskRenderable;
- (CRLImageLayout)imageLayout;
- (CRLImageRep)initWithLayout:(id)a3 canvas:(id)a4;
- (CRLMaskInfo)maskInfo;
- (CRLMaskLayout)maskLayout;
- (NSArray)maskScaleDetents;
- (_TtC8Freeform12CRLImageItem)imageInfo;
- (_TtC8Freeform8CRLAsset)imageDataForRendering;
- (double)additionalRotationForKnobOrientation;
- (double)angleForRotation;
- (double)maskScale;
- (id)actionStringForDrag;
- (id)actionStringForResize;
- (id)actionStringForRotate;
- (id)additionalRenderablesOverRenderable;
- (id)commandForAcceptingPasteWithImageInfo:(id)a3 outSelectionBehavior:(id *)a4;
- (id)cursorAtPoint:(CGPoint)a3 forKnob:(id)a4 withCursorPlatformObject:(id)a5;
- (id)downloadProgressPlaceholderImage;
- (id)dynamicResizeDidBegin;
- (id)imageDrawingHelperImageData:(id)a3;
- (id)imageDrawingHelperThumbnailImageData:(id)a3;
- (id)imageOfStroke:(CGRect *)a3;
- (id)infoForTransforming;
- (id)layoutsForChildReps;
- (id)newCommandToApplyGeometry:(id)a3 toInfo:(id)a4;
- (id)newMaskResizer;
- (id)newSelectionKnobForType:(unint64_t)a3 tag:(unint64_t)a4;
- (id)newTrackerForKnob:(id)a3;
- (id)overlayRenderables;
- (id)p_getMagnetUnscaledPositionValueForMagnet:(id)a3 withConnectedItem:(id)a4;
- (id)p_validatedBitmapImageProvider;
- (id)p_validatedImageProvider;
- (id)pathSourceForSelectionHighlightBehavior;
- (id)resizedGeometryForTransform:(CGAffineTransform *)a3;
- (id)visuallySignificantDataSet;
- (int64_t)dragTypeAtCanvasPoint:(CGPoint)a3 forTouchType:(int64_t)a4;
- (int64_t)maskEditMode;
- (int64_t)tilingMode;
- (unint64_t)p_maxPixelAreaForBackgroundRemoval;
- (void)addKnobsToArray:(id)a3;
- (void)becameNotSelected;
- (void)becameSelected;
- (void)beginDynamicallyChangingMaskScale;
- (void)beginEditingMaskInMaskEditMode:(int64_t)a3;
- (void)dealloc;
- (void)didUpdateRenderable:(id)a3;
- (void)documentEditabilityDidChange;
- (void)documentModeDidChange;
- (void)drawInContextWithoutEffects:(CGContext *)a3 withContent:(BOOL)a4 strokeDrawOptions:(unint64_t)a5 withOpacity:(BOOL)a6 forAlphaOnly:(BOOL)a7 drawChildren:(BOOL)a8 keepingChildrenPassingTest:(id)a9;
- (void)drawInLayerContext:(CGContext *)a3;
- (void)dynamicDragDidBegin;
- (void)dynamicMoveSmartShapeKnobDidBegin;
- (void)dynamicMoveSmartShapeKnobDidEndWithTracker:(id)a3;
- (void)dynamicOperationDidEnd;
- (void)dynamicallyMovedSmartShapeKnobTo:(CGPoint)a3 withTracker:(id)a4;
- (void)dynamicallySetMaskScale:(double)a3;
- (void)editMaskWithHUD:(BOOL)a3;
- (void)endDynamicallyChangingMaskScale:(double)a3;
- (void)endEditingMask;
- (void)enterPreviewMode;
- (void)highlightImage;
- (void)imageDrawingHelper:(id)a3 didGenerateSizedImageSynchronously:(BOOL)a4;
- (void)layoutInRootChangedFrom:(id)a3 to:(id)a4 translatedOnly:(BOOL)a5;
- (void)maskScaleLimitsReturningMin:(double *)a3 max:(double *)a4;
- (void)maskWithHUD:(BOOL)a3;
- (void)p_calcNewImageGeometryAndReplaceImageWithRemoveImageBackgroundData:(id)a3 dismissMiniFormatter:(BOOL)a4;
- (void)p_cleanUpMaskModeUI;
- (void)p_createMaskRenderableForRenderable:(id)a3;
- (void)p_disposeMaskRenderable;
- (void)p_disposeStrokeLayer;
- (void)p_drawInContext:(CGContext *)a3 withContent:(BOOL)a4 strokeDrawOptions:(unint64_t)a5 withOpacity:(double)a6 withMask:(BOOL)a7 forLayer:(BOOL)a8 forShadow:(BOOL)a9 forHitTest:(BOOL)a10;
- (void)p_endEditingMask;
- (void)p_enqueueCommandsToUpdateMagnetsForLineEnd:(unint64_t)a3 withClineLayout:(id)a4 withUnscaledPosition:(id)a5;
- (void)p_enterMaskModeIfNecessaryWithHUD:(BOOL)a3;
- (void)p_generateSizedImageIfNecessary;
- (void)p_getAliasedValuesForMaskToBoundsDirectLayerFrame:(CGRect *)a3 transform:(CGAffineTransform *)a4;
- (void)p_handleAssetPreparationCompletion;
- (void)p_handleImageMask;
- (void)p_hitCacheSetCachedValue:(BOOL)a3 forPoint:(CGPoint)a4;
- (void)p_injectSizedImageIntoLayerContentsIfReady;
- (void)p_invalidateCachedRemoveBackgroundImage;
- (void)p_invalidateHitTestCache;
- (void)p_listenForAssetChangesIfAppropriate;
- (void)p_removeBackgroundFromImageInitiatedByUser:(BOOL)a3;
- (void)p_replaceImageDataWithRemoveImageBackgroundData:(id)a3 rect:(CGRect)a4;
- (void)p_selectionPathDidChange:(id)a3;
- (void)p_setDefaultMaskWithActionString:(id)a3;
- (void)p_setUpMaskModeUI;
- (void)p_updateCornerRadiusOnRenderable:(id)a3;
- (void)p_updateDirectlyManagesLayerContentForRenderable:(id)a3;
- (void)p_updateHUD;
- (void)p_updateMaskRenderable:(id)a3 forRepRenderable:(id)a4 shouldIncludeMask:(BOOL)a5 shouldIncludeInstantAlpha:(BOOL)a6 siblingLayer:(BOOL)a7;
- (void)p_updateMaskSublayersForMaskEditMode;
- (void)p_updateStrokeLayerForStroke:(id)a3 repRenderable:(id)a4;
- (void)processChangedProperty:(unint64_t)a3;
- (void)processChanges:(id)a3;
- (void)removeBackgroundFromImage;
- (void)setMaskRenderable:(id)a3;
- (void)unhighlightImage;
- (void)updateFromLayout;
- (void)updatePositionsOfKnobs:(id)a3;
- (void)updateRenderableGeometryFromLayout:(id)a3;
- (void)willBeRemoved;
- (void)willEnterForeground;
- (void)willUpdateRenderable:(id)a3;
@end

@implementation CRLImageRep

- (CRLImageRep)initWithLayout:(id)a3 canvas:(id)a4
{
  id v6 = a4;
  v26.receiver = self;
  v26.super_class = (Class)CRLImageRep;
  v7 = [(CRLCanvasRep *)&v26 initWithLayout:a3 canvas:v6];
  v8 = v7;
  if (v7)
  {
    v9 = [(CRLImageRep *)v7 imageInfo];

    if (v9)
    {
      v10 = (NSUUID *)objc_alloc_init((Class)NSUUID);
      downloadObserverIdentifier = v8->_downloadObserverIdentifier;
      v8->_downloadObserverIdentifier = v10;

      v12 = [(CRLImageRep *)v8 imageInfo];
      v13 = [v12 imageAssetPayload];

      if (v13)
      {
        v14 = +[CRLImageProviderPool sharedPool];
        [v14 addInterestInProviderForAsset:v13];
      }
      v15 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      updateFromLayoutBlocks = v8->_updateFromLayoutBlocks;
      v8->_updateFromLayoutBlocks = v15;

      dispatch_semaphore_t v17 = dispatch_semaphore_create(1);
      updateFromLayoutBlocksLock = v8->_updateFromLayoutBlocksLock;
      v8->_updateFromLayoutBlocksLock = (OS_dispatch_semaphore *)v17;

      v19 = [[CRLImageRepDrawingHelper alloc] initWithRep:v8];
      drawingHelper = v8->_drawingHelper;
      v8->_drawingHelper = v19;

      v8->_imageForRemoveBackgroundAssetDataHash = 0x7FFFFFFFFFFFFFFFLL;
      v8->_autoBackgroundRemovalState = 0;
      v8->_userInitiatedBackgroundRemovalState = 0;
      v21 = objc_alloc_init(CRLRemoveImageBackgroundData);
      cachedRemoveImageBackgroundData = v8->_cachedRemoveImageBackgroundData;
      v8->_cachedRemoveImageBackgroundData = v21;

      v8->_backgroundRemovalLock._os_unfair_lock_opaque = 0;
      __dmb(0xBu);
      if ([v6 isCanvasInteractive]) {
        [(CRLImageRep *)v8 p_listenForAssetChangesIfAppropriate];
      }
      v23 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      hitTestCache = v8->_hitTestCache;
      v8->_hitTestCache = v23;

      if ([v6 isCanvasInteractive]) {
        [(CRLImageRep *)v8 p_updateDirectlyManagesLayerContentForRenderable:0];
      }
    }
    else
    {
      v13 = v8;
      v8 = 0;
    }
  }
  return v8;
}

- (void)dealloc
{
  [(CRLCanvasRenderable *)self->_strokeRenderable setDelegate:0];
  v3 = [(CRLImageRep *)self imageInfo];
  v4 = [v3 imageAssetPayload];

  if (v4)
  {
    v5 = +[CRLImageProviderPool sharedPool];
    [v5 removeInterestInProviderForAsset:v4];
  }
  imageForRemoveBackground = self->_imageForRemoveBackground;
  if (imageForRemoveBackground)
  {
    CFRelease(imageForRemoveBackground);
    self->_imageForRemoveBackground = 0;
  }

  v7.receiver = self;
  v7.super_class = (Class)CRLImageRep;
  [(CRLCanvasRep *)&v7 dealloc];
}

- (_TtC8Freeform12CRLImageItem)imageInfo
{
  uint64_t v3 = objc_opt_class();
  v4 = [(CRLCanvasRep *)self info];
  v5 = sub_1002469D0(v3, v4);

  return (_TtC8Freeform12CRLImageItem *)v5;
}

- (CRLImageLayout)imageLayout
{
  uint64_t v3 = objc_opt_class();
  v4 = [(CRLCanvasRep *)self layout];
  v5 = sub_1002469D0(v3, v4);

  return (CRLImageLayout *)v5;
}

- (CRLMaskInfo)maskInfo
{
  v2 = [(CRLImageRep *)self imageInfo];
  uint64_t v3 = [v2 maskInfo];

  return (CRLMaskInfo *)v3;
}

- (CRLMaskLayout)maskLayout
{
  v2 = [(CRLImageRep *)self imageLayout];
  uint64_t v3 = [v2 maskLayout];

  return (CRLMaskLayout *)v3;
}

- (void)willBeRemoved
{
  v11.receiver = self;
  v11.super_class = (Class)CRLImageRep;
  [(CRLCanvasRep *)&v11 willBeRemoved];
  uint64_t v3 = [(CRLImageRep *)self imageLayout];
  unsigned int v4 = [v3 isInMaskEditMode];

  if (v4) {
    [(CRLImageRep *)self p_endEditingMask];
  }
  [(CRLImageRepDrawingHelper *)self->_drawingHelper teardown];
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_updateFromLayoutBlocksLock, 0xFFFFFFFFFFFFFFFFLL);
  [(NSMutableArray *)self->_updateFromLayoutBlocks removeAllObjects];
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_updateFromLayoutBlocksLock);
  if (!self->_downloadObserverIdentifier)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EF1C8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A0514();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EF1E8);
    }
    v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    id v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageRep willBeRemoved]");
    objc_super v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRep.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 237, 0, "invalid nil value for '%{public}s'", "_downloadObserverIdentifier");
  }
  v8 = [(CRLImageRep *)self imageInfo];
  v9 = [v8 store];
  v10 = [v9 assetManager];
  [v10 removeAllDownloadObserversWithIdentifier:self->_downloadObserverIdentifier];
}

- (id)layoutsForChildReps
{
  v11.receiver = self;
  v11.super_class = (Class)CRLImageRep;
  uint64_t v3 = [(CRLCanvasRep *)&v11 layoutsForChildReps];
  unsigned int v4 = [(CRLImageRep *)self imageLayout];
  v5 = [v4 maskLayout];

  if (v5)
  {
    id v6 = [(CRLImageRep *)self imageLayout];
    objc_super v7 = [v6 maskLayout];
    v12 = v7;
    v8 = +[NSArray arrayWithObjects:&v12 count:1];
    uint64_t v9 = [v3 crl_arrayByRemovingObjectsIdenticalToObjectsInArray:v8];

    uint64_t v3 = (void *)v9;
  }

  return v3;
}

- (void)updateFromLayout
{
  v38.receiver = self;
  v38.super_class = (Class)CRLImageRep;
  [(CRLCanvasRep *)&v38 updateFromLayout];
  uint64_t v3 = [(CRLImageRep *)self imageLayout];
  if ([v3 isInMaskEditMode])
  {
    unsigned int v4 = [(CRLImageRep *)self imageInfo];
    v5 = [v4 maskInfo];

    if (!v5) {
      [(CRLImageRep *)self p_endEditingMask];
    }
  }
  else
  {
  }
  id v6 = [(CRLCanvasRep *)self canvas];
  if (![v6 isCanvasInteractive]) {
    goto LABEL_23;
  }
  objc_super v7 = [(CRLCanvasRep *)self interactiveCanvasController];
  unsigned __int8 v8 = [v7 isInDynamicOperation];

  if ((v8 & 1) == 0)
  {
    id v6 = [(CRLImageRep *)self imageLayout];
    uint64_t v9 = [v6 maskLayout];
    memset(&v37, 0, sizeof(v37));
    if (v6) {
      [v6 layoutToImageTransform];
    }
    v10 = [v6 imageGeometryInRoot];
    objc_super v11 = [v9 geometryInRoot];
    CGAffineTransform t1 = v37;
    long long v12 = *(_OWORD *)&self->_lastLayoutToImageTransform.c;
    *(_OWORD *)&t2.a = *(_OWORD *)&self->_lastLayoutToImageTransform.a;
    *(_OWORD *)&t2.c = v12;
    *(_OWORD *)&t2.tx = *(_OWORD *)&self->_lastLayoutToImageTransform.tx;
    BOOL v13 = CGAffineTransformEqualToTransform(&t1, &t2);
    if (v9)
    {
      if ([v10 isEqual:self->_lastImageGeometryInRoot]) {
        unsigned __int8 v14 = 0;
      }
      else {
        unsigned __int8 v14 = [v10 differsInMoreThanTranslationFrom:self->_lastImageGeometryInRoot];
      }
      if ([v11 isEqual:self->_lastMaskGeometryInRoot]) {
        unsigned int v15 = 0;
      }
      else {
        unsigned int v15 = [v11 differsInMoreThanTranslationFrom:self->_lastMaskGeometryInRoot];
      }
      if (v13)
      {
LABEL_19:
        if ((v14 & 1) == 0 && !v15) {
          goto LABEL_22;
        }
      }
    }
    else
    {
      unsigned __int8 v14 = 0;
      unsigned int v15 = 0;
      if (v13) {
        goto LABEL_19;
      }
    }
    [(CRLStyledRep *)self setNeedsDisplay];
    self->_frameInUnscaledCanvasIsValid = 0;
    [(CRLCanvasRep *)self invalidateKnobPositions];
LABEL_22:
    v16 = (CRLCanvasLayoutGeometry *)[v10 copy];
    lastImageGeometryInRoot = self->_lastImageGeometryInRoot;
    self->_lastImageGeometryInRoot = v16;

    v18 = (CRLCanvasLayoutGeometry *)[v11 copy];
    lastMaskGeometryInRoot = self->_lastMaskGeometryInRoot;
    self->_lastMaskGeometryInRoot = v18;

    long long v20 = *(_OWORD *)&v37.c;
    *(_OWORD *)&self->_lastLayoutToImageTransform.a = *(_OWORD *)&v37.a;
    *(_OWORD *)&self->_lastLayoutToImageTransform.c = v20;
    *(_OWORD *)&self->_lastLayoutToImageTransform.tx = *(_OWORD *)&v37.tx;

LABEL_23:
  }
  v21 = [(CRLImageRep *)self imageLayout];
  unsigned int v22 = [v21 isInMaskEditMode];

  if (v22)
  {
    v23 = [(CRLCanvasRep *)self interactiveCanvasController];
    v24 = [v23 layerHost];
    v25 = [v24 imageHUDController];
    [v25 updateControlsForRep:self];

    if ([(CRLCanvasRep *)self isBeingDragged])
    {
      if ([(CRLCanvasRep *)self showKnobsDuringManipulation]) {
        [(CRLCanvasRep *)self invalidateKnobPositions];
      }
    }
  }
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_updateFromLayoutBlocksLock, 0xFFFFFFFFFFFFFFFFLL);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  objc_super v26 = self->_updateFromLayoutBlocks;
  id v27 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v27)
  {
    id v28 = v27;
    uint64_t v29 = *(void *)v32;
    do
    {
      for (i = 0; i != v28; i = (char *)i + 1)
      {
        if (*(void *)v32 != v29) {
          objc_enumerationMutation(v26);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v31 + 1) + 8 * i) + 16))(*(void *)(*((void *)&v31 + 1) + 8 * i));
      }
      id v28 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v28);
  }

  [(NSMutableArray *)self->_updateFromLayoutBlocks removeAllObjects];
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_updateFromLayoutBlocksLock);
}

- (BOOL)intersectsUnscaledRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  unsigned __int8 v8 = [(CRLImageRep *)self imageLayout];
  id v9 = [v8 pathToStroke];

  if (v9)
  {
    v10 = +[CRLBezierPath bezierPathWithCGPath:v9];
    objc_super v11 = [(CRLCanvasRep *)self layout];
    long long v12 = v11;
    if (v11) {
      [v11 transformInRoot];
    }
    else {
      memset(v16, 0, sizeof(v16));
    }
    [v10 transformUsingAffineTransform:v16];

    unsigned __int8 v13 = [v10 intersectsRect:1 x:x y:y width:width height:height];
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)CRLImageRep;
    return -[CRLCanvasRep intersectsUnscaledRect:](&v15, "intersectsUnscaledRect:", x, y, width, height);
  }
  return v13;
}

- (BOOL)wantsToDistortWithImagerContext
{
  if (+[UIDevice crl_phoneUI])
  {
    +[UIScreen crl_screenScale];
    if (v3 == 1.0) {
      return 1;
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)CRLImageRep;
  return [(CRLCanvasRep *)&v5 wantsToDistortWithImagerContext];
}

- (CGRect)boundsForStandardKnobs
{
  double v3 = [(CRLImageRep *)self imageLayout];
  id v4 = [v3 maskEditMode];

  if (v4 == (id)3)
  {
    objc_super v5 = [(CRLImageRep *)self imageLayout];
    id v6 = [v5 imageGeometry];
    [v6 size];
    double v7 = sub_100064070();
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
  }
  else
  {
    v22.receiver = self;
    v22.super_class = (Class)CRLImageRep;
    [(CRLCanvasRep *)&v22 boundsForStandardKnobs];
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

- (_TtC8Freeform8CRLAsset)imageDataForRendering
{
  return [(CRLImageRepDrawingHelper *)self->_drawingHelper imageDataForDrawing];
}

- (void)documentModeDidChange
{
  v10.receiver = self;
  v10.super_class = (Class)CRLImageRep;
  [(CRLMediaRep *)&v10 documentModeDidChange];
  double v3 = [(CRLCanvasRep *)self interactiveCanvasController];
  id v4 = [v3 layerHost];
  objc_super v5 = [v4 asiOSCVC];
  id v6 = [v5 delegate];

  if (objc_opt_respondsToSelector())
  {
    double v7 = [v6 currentDocumentMode];
    if (v7)
    {
      double v8 = [(CRLImageRep *)self imageLayout];
      unsigned int v9 = [v8 isInMaskEditMode];

      if (v9)
      {
        if (([v7 allowsEditMask] & 1) == 0) {
          [(CRLImageRep *)self endEditingMask];
        }
      }
    }
  }
}

- (BOOL)allowsSupportedDynamicOperationsToBeRealTime
{
  v2 = [(CRLImageRep *)self imageLayout];
  char v3 = [v2 isInMaskEditMode] ^ 1;

  return v3;
}

- (id)visuallySignificantDataSet
{
  v2 = [(CRLImageRep *)self imageInfo];
  char v3 = [v2 imageAssetPayload];

  if (v3)
  {
    id v4 = [objc_alloc((Class)NSSet) initWithObjects:v3, 0];
  }
  else
  {
    id v4 = +[NSSet set];
  }
  objc_super v5 = v4;

  return v5;
}

- (BOOL)shouldShowLoadingUI
{
  return [(CRLImageRepDrawingHelper *)self->_drawingHelper shouldShowLoadingUI];
}

- (id)downloadProgressPlaceholderImage
{
  return +[CRLImage imageNamed:@"sf_streaming_large_Images"];
}

- (void)drawInLayerContext:(CGContext *)a3
{
  LOBYTE(v3) = 0;
  [(CRLImageRep *)self p_drawInContext:a3 withContent:1 strokeDrawOptions:7 withOpacity:1 withMask:1 forLayer:0 forShadow:1.0 forHitTest:v3];
}

- (void)drawInContextWithoutEffects:(CGContext *)a3 withContent:(BOOL)a4 strokeDrawOptions:(unint64_t)a5 withOpacity:(BOOL)a6 forAlphaOnly:(BOOL)a7 drawChildren:(BOOL)a8 keepingChildrenPassingTest:(id)a9
{
  BOOL v9 = a7;
  BOOL v11 = a4;
  double v14 = 1.0;
  if (a6) {
    [(CRLStyledRep *)self opacity];
  }

  -[CRLImageRep p_drawInContext:withContent:strokeDrawOptions:withOpacity:withMask:forLayer:forShadow:forHitTest:](self, "p_drawInContext:withContent:strokeDrawOptions:withOpacity:withMask:forLayer:forShadow:forHitTest:", a3, v11, a5, 1, 0, v9, v14);
}

- (id)imageOfStroke:(CGRect *)a3
{
  double x = CGRectZero.origin.x;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  BOOL v9 = [(CRLCanvasRep *)self layout];
  objc_super v10 = [v9 stroke];

  if (v10 && [v10 shouldRender])
  {
    BOOL v11 = [(CRLImageRep *)self imageLayout];
    if ([v11 pathToStroke])
    {
      +[CRLBezierPath bezierPathWithCGPath:](CRLBezierPath, "bezierPathWithCGPath:", [v11 pathToStroke]);
    }
    else
    {
      double v13 = [v11 imageGeometry];
      [v13 size];
      double v14 = sub_100064070();
      double v16 = v15;
      double v18 = v17;
      double v20 = v19;

      +[CRLBezierPath bezierPathWithRect:](CRLBezierPath, "bezierPathWithRect:", v14, v16, v18, v20);
    double v21 = };
    [v21 boundsIncludingCRLStroke:v10];
    double x = v22;
    double y = v23;
    double width = v24;
    double height = v25;

    objc_super v26 = sub_100455AA8(11, width, height);
    id v27 = v26;
    double v28 = 0.0;
    if (x >= 0.0) {
      double v29 = x;
    }
    else {
      double v29 = 0.0;
    }
    double v30 = -v29;
    if (y >= 0.0) {
      double v28 = y;
    }
    CGContextTranslateCTM(v26, v30, -v28);
    LOBYTE(v33) = 0;
    [(CRLImageRep *)self p_drawInContext:v27 withContent:0 strokeDrawOptions:7 withOpacity:0 withMask:0 forLayer:0 forShadow:1.0 forHitTest:v33];
    Image = CGBitmapContextCreateImage(v27);
    double v12 = +[CRLImage imageWithCGImage:Image];
    CGContextRelease(v27);
    CGImageRelease(Image);
  }
  else
  {
    double v12 = 0;
  }
  a3->origin.double x = x;
  a3->origin.double y = y;
  a3->size.double width = width;
  a3->size.double height = height;

  return v12;
}

- (BOOL)canDrawInParallel
{
  return 1;
}

- (void)p_drawInContext:(CGContext *)a3 withContent:(BOOL)a4 strokeDrawOptions:(unint64_t)a5 withOpacity:(double)a6 withMask:(BOOL)a7 forLayer:(BOOL)a8 forShadow:(BOOL)a9 forHitTest:(BOOL)a10
{
  BOOL v10 = a9;
  BOOL v11 = a8;
  BOOL v12 = a7;
  int v14 = a5;
  BOOL v15 = a4;
  double v18 = [(CRLStyledRep *)self styledLayout];
  unsigned __int8 v19 = [v18 isInvisible];

  if (v19) {
    return;
  }
  double v20 = +[NSUserDefaults standardUserDefaults];
  unsigned int v21 = [v20 BOOLForKey:@"TSDSuppressImageInterpolation"];

  if (v11 && v21) {
    CGContextSetInterpolationQuality(a3, kCGInterpolationNone);
  }
  double v22 = [(CRLCanvasRep *)self canvas];
  if ([v22 isDrawingIntoPDF])
  {
    unsigned int v62 = 0;
  }
  else
  {
    double v23 = [(CRLCanvasRep *)self canvas];
    unsigned int v62 = [v23 isPrinting] ^ 1;
  }
  double v24 = [(CRLCanvasRep *)self layout];
  double v25 = [v24 stroke];

  if (v25)
  {
    if (![v25 shouldRender])
    {
      v35 = 0;
      goto LABEL_17;
    }
    BOOL v26 = v11;
    id v27 = [(CRLCanvasRep *)self canvas];
    unsigned int v28 = [v27 shouldSuppressBackgrounds];

    if (v28)
    {
      id v29 = [v25 mutableCopy];

      double v30 = +[CRLColor blackColor];
      [v29 setColor:v30];

      double v25 = v29;
    }
    BOOL v11 = v26;
    if (v25 && a10 && ([v25 prefersToApplyToShapeRenderableDuringManipulation] & 1) == 0)
    {
      v66 = [CRLStroke alloc];
      uint64_t v61 = [v25 color];
      [v25 width];
      double v32 = v31;
      id v64 = [v25 cap];
      id v60 = [v25 join];
      uint64_t v33 = [v25 pattern];
      [v25 miterLimit];
      v35 = [(CRLStroke *)v66 initWithColor:v61 width:v64 cap:v60 join:v33 pattern:v32 miterLimit:v34];

      BOOL v11 = v26;
      double v25 = (void *)v61;
LABEL_17:

      double v25 = v35;
    }
  }
  BOOL v36 = a6 < 1.0 && v15;
  char v67 = v14;
  int v37 = v14 & v36;
  if (v37 == 1 && (CGContextSaveGState(a3), CGContextSetAlpha(a3, a6), v25))
  {
    CGContextBeginTransparencyLayer(a3, 0);
    int v65 = 1;
  }
  else
  {
    int v65 = 0;
  }
  CGContextSaveGState(a3);
  objc_super v38 = [(CRLImageRep *)self imageLayout];
  [(CRLImageRepDrawingHelper *)self->_drawingHelper imageRectInContext:a3];
  double v40 = v39;
  double v42 = v41;
  double v44 = v43;
  double v46 = v45;
  if (v15)
  {
    uint64_t v47 = v10 | a10;
    v48 = [v38 maskLayout];
    if (v48 && v12)
    {
      memset(&v73, 0, sizeof(v73));
      if (v38) {
        [v38 layoutToMaskTransform];
      }
      [v48 pathBounds];
      CGAffineTransform v71 = v73;
      CGAffineTransformTranslate(&v72, &v71, -v49, -v50);
      CGAffineTransform v73 = v72;
      v51 = +[CRLBezierPath bezierPathWithCGPath:](CRLBezierPath, "bezierPathWithCGPath:", [v48 path]);
      CGAffineTransform v72 = v73;
      [v51 transformUsingAffineTransform:&v72];
      if (v62)
      {
        [v51 aliasedPathInContext:a3 effectiveStrokeWidth:0.0];
        unsigned int v63 = v47;
        v53 = BOOL v52 = v11;

        v51 = (void *)v53;
        BOOL v11 = v52;
        uint64_t v47 = v63;
      }
      id v54 = v51;
      CGContextAddPath(a3, (CGPathRef)[v54 CGPath]);
      CGContextClip(a3);
    }
    if (v38) {
      [v38 layoutToImageTransform];
    }
    else {
      memset(&transform, 0, sizeof(transform));
    }
    CGContextConcatCTM(a3, &transform);
    CGContextSaveGState(a3);
    [(CRLImageRepDrawingHelper *)self->_drawingHelper drawInContext:a3 forLayer:v11 forShadowOrHitTest:v47];
    CGContextRestoreGState(a3);
  }
  CGContextRestoreGState(a3);
  if ((v67 & 1) == 0 || !v25 || v11 && [(CRLImageRep *)self directlyManagesLayerContent]) {
    goto LABEL_54;
  }
  CGContextSaveGState(a3);
  if (![v38 pathToStroke])
  {
    if (v38) {
      [v38 layoutToImageTransform];
    }
    else {
      memset(&v68, 0, sizeof(v68));
    }
    CGContextConcatCTM(a3, &v68);
    id v59 = [v38 pathToStroke];
    if (!v59)
    {
      [v25 paintRect:a3 inContext:v40, v42, v44, v46];
      goto LABEL_53;
    }
    id v58 = v59;
    v57 = v25;
    goto LABEL_52;
  }
  id v55 = [v38 pathToStroke];
  if (v55)
  {
    id v56 = v55;
    if (v38) {
      [v38 layoutToMaskTransform];
    }
    else {
      memset(&v69, 0, sizeof(v69));
    }
    CGContextConcatCTM(a3, &v69);
    v57 = v25;
    id v58 = v56;
LABEL_52:
    [v57 paintPath:v58 inContext:a3];
  }
LABEL_53:
  CGContextRestoreGState(a3);
LABEL_54:
  if (v65) {
    CGContextEndTransparencyLayer(a3);
  }
  if (v37) {
    CGContextRestoreGState(a3);
  }
}

- (CGRect)frameInUnscaledCanvas
{
  v26.receiver = self;
  v26.super_class = (Class)CRLImageRep;
  [(CRLCanvasRep *)&v26 frameInUnscaledCanvas];
  double x = v3;
  double y = v5;
  CGFloat width = v7;
  CGFloat height = v9;
  BOOL v11 = [(CRLImageRep *)self imageLayout];
  uint64_t v12 = [v11 maskLayout];
  if (v12)
  {
    double v13 = (void *)v12;
    id v14 = [v11 pathToStroke];

    if (v14)
    {
      if (!self->_frameInUnscaledCanvasIsValid)
      {
        BOOL v15 = [(CRLCanvasRep *)self layout];
        double v16 = [v15 stroke];

        memset(&v25, 0, sizeof(v25));
        if (v11)
        {
          [v11 layoutToMaskTransform];
          [v11 transformInRoot];
        }
        else
        {
          memset(&t1, 0, sizeof(t1));
          memset(&t2, 0, sizeof(t2));
        }
        CGAffineTransformConcat(&v25, &t1, &t2);
        double v17 = +[CRLBezierPath bezierPathWithCGPath:](CRLBezierPath, "bezierPathWithCGPath:", [v11 pathToStroke]);
        CGAffineTransform v22 = v25;
        [v17 transformUsingAffineTransform:&v22];
        [v17 boundsIncludingCRLStroke:v16];
        self->_frameInUnscaledCanvasRelativeToSuper = CGRectOffset(v27, -x, -y);
        self->_frameInUnscaledCanvasIsValid = 1;
      }
      CGRect v28 = CGRectOffset(self->_frameInUnscaledCanvasRelativeToSuper, x, y);
      double x = v28.origin.x;
      double y = v28.origin.y;
      CGFloat width = v28.size.width;
      CGFloat height = v28.size.height;
    }
  }

  double v18 = x;
  double v19 = y;
  double v20 = width;
  double v21 = height;
  result.size.CGFloat height = v21;
  result.size.CGFloat width = v20;
  result.origin.double y = v19;
  result.origin.double x = v18;
  return result;
}

- (CGRect)clipRect
{
  v2.receiver = self;
  v2.super_class = (Class)CRLImageRep;
  [(CRLStyledRep *)&v2 clipRect];
  return CGRectInset(v3, -1.0, -1.0);
}

- (id)imageDrawingHelperImageData:(id)a3
{
  CGRect v3 = [(CRLImageRep *)self imageInfo];
  id v4 = [v3 imageAssetPayload];

  return v4;
}

- (id)imageDrawingHelperThumbnailImageData:(id)a3
{
  CGRect v3 = [(CRLImageRep *)self imageInfo];
  id v4 = [v3 thumbnailAssetPayload];

  return v4;
}

- (CGRect)imageDrawingHelperImageRect:(id)a3
{
  CGRect v3 = [(CRLImageRep *)self imageLayout];
  id v4 = [v3 imageGeometry];
  [v4 size];
  double v5 = sub_100064070();
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.CGFloat height = v15;
  result.size.CGFloat width = v14;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

- (CGAffineTransform)imageDrawingHelperImageTransformInRootForAntialiasingDefeat:(SEL)a3
{
  id v8 = [(CRLImageRep *)self imageLayout];
  double v5 = [v8 imageGeometryInRoot];
  double v6 = v5;
  if (v5)
  {
    [v5 transform];
  }
  else
  {
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tdouble x = 0u;
    *(_OWORD *)&retstr->a = 0u;
  }

  return result;
}

- (BOOL)imageDrawingHelperImageHasAlpha:(id)a3
{
  CGRect v3 = [(CRLImageRep *)self imageLayout];
  unsigned __int8 v4 = [v3 hasAlpha];

  return v4;
}

- (CGPath)imageDrawingHelper:(id)a3 newMaskPathForSizedImageWithSize:(CGSize)a4 orientation:(int64_t)a5
{
  double height = a4.height;
  double width = a4.width;
  id v8 = [(CRLImageRep *)self imageLayout];
  double v9 = +[CRLImageRep p_newPathToBakeIntoSizedImageForSize:withImageLayout:orientation:](CRLImageRep, "p_newPathToBakeIntoSizedImageForSize:withImageLayout:orientation:", v8, a5, width, height);

  return v9;
}

- (BOOL)imageDrawingHelperShouldGenerateSizedImageSynchronously:(id)a3
{
  unsigned __int8 v4 = [(CRLImageRep *)self imageInfo];
  double v5 = [v4 shadow];
  if (v5)
  {
    double v6 = [(CRLImageRep *)self imageInfo];
    double v7 = [v6 shadow];
    unsigned int v8 = [v7 isEnabled] ^ 1;
  }
  else
  {
    LOBYTE(v8) = 1;
  }

  if (+[NSThread isMainThread]) {
    return 0;
  }
  else {
    return [(CRLImageRep *)self directlyManagesLayerContent] & v8 ^ 1;
  }
}

- (BOOL)imageDrawingHelperShouldRetryGeneratingSizedImageLater:(id)a3
{
  CGRect v3 = +[CRLApplicationCoordinator shared];
  unsigned __int8 v4 = [v3 isActivating];

  return v4;
}

- (void)imageDrawingHelper:(id)a3 didGenerateSizedImageSynchronously:(BOOL)a4
{
  BOOL v4 = a4;
  unsigned int v6 = +[NSThread isMainThread];
  if (v4)
  {
    if (v6)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014EF208);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010A05A8();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014EF228);
      }
      double v7 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v7);
      }
      unsigned int v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageRep imageDrawingHelper:didGenerateSizedImageSynchronously:]");
      double v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRep.m"];
      +[CRLAssertionHandler handleFailureInFunction:v8 file:v9 lineNumber:666 isFatal:0 description:"wrong thread"];
    }
    double v10 = [(CRLCanvasRep *)self interactiveCanvasController];
    [v10 canvasInvalidatedForRep:self];
  }
  else
  {
    if ((v6 & 1) == 0)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014EF248);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010A0630();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014EF268);
      }
      double v11 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v11);
      }
      double v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageRep imageDrawingHelper:didGenerateSizedImageSynchronously:]");
      double v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRep.m"];
      +[CRLAssertionHandler handleFailureInFunction:v12 file:v13 lineNumber:675 isFatal:0 description:"This operation must only be performed on the main thread."];
    }
    [(CRLImageRep *)self p_injectSizedImageIntoLayerContentsIfReady];
  }
}

- (CGRect)imageDrawingHelperRectForCenteringDownloadProgressPlaceholderImage:(id)a3
{
  [(CRLImageRep *)self boundsForStandardKnobs];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  double v12 = [(CRLImageRep *)self imageLayout];
  double v13 = v12;
  if (v12) {
    [v12 layoutToImageTransform];
  }
  else {
    memset(&v22, 0, sizeof(v22));
  }
  CGAffineTransformInvert(&v23, &v22);
  v24.origin.CGFloat x = v5;
  v24.origin.CGFloat y = v7;
  v24.size.CGFloat width = v9;
  v24.size.CGFloat height = v11;
  CGRect v25 = CGRectApplyAffineTransform(v24, &v23);
  CGFloat x = v25.origin.x;
  CGFloat y = v25.origin.y;
  CGFloat width = v25.size.width;
  CGFloat height = v25.size.height;

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

- (id)p_validatedImageProvider
{
  CGRect v3 = +[CRLImageProviderPool sharedPool];
  double v4 = [(CRLImageRepDrawingHelper *)self->_drawingHelper imageDataForDrawing];
  CGFloat v5 = [v3 providerForAsset:v4 shouldValidate:1];

  return v5;
}

- (id)p_validatedBitmapImageProvider
{
  uint64_t v3 = objc_opt_class();
  double v4 = [(CRLImageRep *)self p_validatedImageProvider];
  CGFloat v5 = sub_1002469D0(v3, v4);

  return v5;
}

- (BOOL)p_drawsInOneStep
{
  uint64_t v3 = [(CRLImageRep *)self imageInfo];
  double v4 = [v3 stroke];
  unsigned __int8 v5 = [v4 shouldRender];

  double v6 = [v3 maskInfo];

  CGFloat v7 = [(CRLImageRep *)self imageLayout];
  if ([v7 hasAlpha]) {
    unsigned __int8 v8 = [(CRLImageRepDrawingHelper *)self->_drawingHelper drawsBitmap];
  }
  else {
    unsigned __int8 v8 = 1;
  }

  if (v6) {
    unsigned __int8 v9 = 0;
  }
  else {
    unsigned __int8 v9 = v8;
  }
  if (v5) {
    BOOL v10 = 0;
  }
  else {
    BOOL v10 = v9;
  }

  return v10;
}

- (BOOL)canDrawShadowInOneStepWithChildren:(BOOL)a3
{
  return [(CRLImageRep *)self p_drawsInOneStep];
}

- (BOOL)shouldShowShadow
{
  v10.receiver = self;
  v10.super_class = (Class)CRLImageRep;
  unsigned int v3 = [(CRLStyledRep *)&v10 shouldShowShadow];
  if (v3)
  {
    if ([(CRLCanvasRep *)self isBeingDragged]) {
      unsigned __int8 v4 = 1;
    }
    else {
      unsigned __int8 v4 = [(CRLCanvasRep *)self isBeingFreeTransformDragged];
    }
    unsigned __int8 v5 = [(CRLImageRep *)self imageLayout];
    unsigned int v6 = [v5 isInMaskEditMode];

    if (v6 && (v4 & 1) != 0)
    {
      LOBYTE(v3) = 0;
    }
    else
    {
      CGFloat v7 = [(CRLCanvasRep *)self canvas];
      unsigned __int8 v8 = [v7 shouldSuppressBackgrounds];

      LOBYTE(v3) = v8 ^ 1;
    }
  }
  return v3;
}

- (void)highlightImage
{
  self->_showImageHighlight = 1;
  id v3 = [(CRLCanvasRep *)self interactiveCanvasController];
  [v3 canvasInvalidatedForRep:self];
}

- (void)unhighlightImage
{
  self->_showImageHighlight = 0;
  id v3 = [(CRLCanvasRep *)self interactiveCanvasController];
  [v3 canvasInvalidatedForRep:self];
}

- (void)maskWithHUD:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned __int8 v5 = +[NSBundle mainBundle];
  unsigned int v6 = [v5 localizedStringForKey:@"Edit Mask" value:0 table:@"UndoStrings"];
  [(CRLImageRep *)self p_setDefaultMaskWithActionString:v6];

  [(CRLImageRep *)self editMaskWithHUD:v3];
}

- (int64_t)maskEditMode
{
  objc_super v2 = [(CRLImageRep *)self imageLayout];
  id v3 = [v2 maskEditMode];

  return (int64_t)v3;
}

- (BOOL)isMaskScaleFromLayout
{
  objc_super v2 = [(CRLImageRep *)self maskLayout];
  BOOL v3 = v2 != 0;

  return v3;
}

- (double)maskScale
{
  BOOL v3 = [(CRLImageRep *)self imageInfo];
  unsigned __int8 v4 = [(CRLImageRep *)self maskLayout];

  if (v4) {
    [(CRLImageRep *)self maskLayout];
  }
  else {
  unsigned __int8 v5 = [v3 defaultMaskInfo];
  }
  unsigned int v6 = [v5 geometry];
  [v6 size];
  double v8 = v7;
  double v10 = v9;

  CGFloat v11 = [v3 geometry];
  [v11 size];
  double v13 = v12;
  double v15 = v14;

  float v16 = v13 / v8;
  float v17 = v15 / v10;
  double v18 = fmaxf(v16, v17);

  return v18;
}

- (void)maskScaleLimitsReturningMin:(double *)a3 max:(double *)a4
{
  [(CRLImageRep *)self maskScale];
  double v8 = v7;
  double v9 = [(CRLImageRep *)self p_validatedImageProvider];
  [v9 naturalSize];
  double v12 = sub_1000646A4(v10, v11, 8.0);
  double v14 = v13;

  double v15 = [(CRLImageRep *)self imageInfo];
  float v16 = [v15 geometry];
  [v16 size];
  double v18 = v17;
  double v20 = v19;

  float v21 = v8 * (v12 / v18);
  float v22 = v8 * (v14 / v20);
  float v23 = fminf(v21, v22);
  float v24 = fminf(v23, 3.0);
  float v25 = v8;
  float v26 = fminf(v25, 1.0);
  if (v24 == v23) {
    float v26 = fminf(v24 / 3.0, v26);
  }
  if (a3) {
    *a3 = v26;
  }
  if (a4) {
    *a4 = v24;
  }
}

- (NSArray)maskScaleDetents
{
  return (NSArray *)&__NSArray0__struct;
}

- (id)newMaskResizer
{
  BOOL v3 = [CRLImageMaskResizer alloc];
  unsigned __int8 v4 = [(CRLCanvasRep *)self interactiveCanvasController];
  unsigned __int8 v5 = [(CRLImageMaskResizer *)v3 initWithInteractiveCanvasController:v4];

  return v5;
}

- (void)beginDynamicallyChangingMaskScale
{
  BOOL v3 = [(CRLImageRep *)self imageLayout];
  unsigned __int8 v4 = [v3 isInMaskEditMode];

  if ((v4 & 1) == 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EF288);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A06B8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EF2A8);
    }
    unsigned __int8 v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    unsigned int v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageRep beginDynamicallyChangingMaskScale]");
    double v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRep.m"];
    +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:823 isFatal:0 description:"wrong mask mode"];
  }
  double v8 = [(CRLImageRep *)self imageLayout];
  [v8 maskModeScaleDidBegin];

  [(CRLCanvasRep *)self setShowKnobsDuringManipulation:1];
  v10.receiver = self;
  v10.super_class = (Class)CRLImageRep;
  id v9 = [(CRLCanvasRep *)&v10 dynamicResizeDidBegin];
}

- (void)dynamicallySetMaskScale:(double)a3
{
  unsigned __int8 v5 = [(CRLImageRep *)self imageLayout];
  unsigned __int8 v6 = [v5 isInMaskEditMode];

  if ((v6 & 1) == 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EF2C8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A0740();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EF2E8);
    }
    double v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v7);
    }
    double v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageRep dynamicallySetMaskScale:]");
    id v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRep.m"];
    +[CRLAssertionHandler handleFailureInFunction:v8 file:v9 lineNumber:833 isFatal:0 description:"wrong mask mode"];
  }
  if (a3 > 0.0)
  {
    objc_super v10 = [(CRLImageRep *)self imageLayout];
    id v11 = [v10 maskEditMode];

    if (v11 == (id)3) {
      [(CRLCanvasRep *)self invalidateKnobPositions];
    }
  }
}

- (void)endDynamicallyChangingMaskScale:(double)a3
{
  unsigned __int8 v4 = [(CRLImageRep *)self imageLayout];
  unsigned __int8 v5 = [v4 isInMaskEditMode];

  if ((v5 & 1) == 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EF308);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A07C8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EF328);
    }
    unsigned __int8 v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v6);
    }
    double v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageRep endDynamicallyChangingMaskScale:]");
    double v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRep.m"];
    +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:843 isFatal:0 description:"wrong mask mode"];
  }
  v10.receiver = self;
  v10.super_class = (Class)CRLImageRep;
  [(CRLCanvasRep *)&v10 dynamicResizeDidEndWithTracker:0];
  id v9 = [(CRLImageRep *)self imageLayout];
  [v9 maskModeScaleDidEnd];

  [(CRLCanvasRep *)self setShowKnobsDuringManipulation:0];
}

- (void)endEditingMask
{
  BOOL v3 = [(CRLImageRep *)self imageLayout];
  id v4 = [v3 maskEditMode];

  if (!v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EF348);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A0850();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EF368);
    }
    unsigned __int8 v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    unsigned __int8 v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageRep endEditingMask]");
    double v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRep.m"];
    +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:851 isFatal:0 description:"wrong mask mode"];
  }
  [(CRLImageRep *)self p_endEditingMask];
}

- (void)p_enterMaskModeIfNecessaryWithHUD:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned __int8 v5 = [(CRLImageRep *)self imageLayout];
  unsigned __int8 v6 = [v5 isInMaskEditMode];

  if ((v6 & 1) == 0)
  {
    double v7 = [(CRLImageRep *)self imageInfo];
    double v8 = [v7 maskInfo];

    if (v8)
    {
      [(CRLImageRep *)self editMaskWithHUD:v3];
    }
    else
    {
      [(CRLImageRep *)self maskWithHUD:v3];
    }
  }
}

- (void)editMaskWithHUD:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CRLImageRepDrawingHelper *)self->_drawingHelper drawsError]) {
    return;
  }
  unsigned __int8 v5 = [(CRLImageRep *)self imageLayout];
  if ([v5 isInMaskEditMode])
  {

LABEL_5:
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EF388);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A08D8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EF3A8);
    }
    double v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v8);
    }
    id v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageRep editMaskWithHUD:]");
    objc_super v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRep.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 875, 0, "attempting to edit an image already in mask edit mode, or without a mask");

    goto LABEL_14;
  }
  unsigned __int8 v6 = [(CRLImageRep *)self imageInfo];
  double v7 = [v6 maskInfo];

  if (!v7) {
    goto LABEL_5;
  }
LABEL_14:
  [(CRLImageRepDrawingHelper *)self->_drawingHelper invalidateSizedImageIfItHasBakedMask];
  id v11 = [(CRLCanvasRep *)self interactiveCanvasController];
  double v12 = [v11 canvasEditor];
  double v13 = [(CRLImageRep *)self imageInfo];
  double v14 = [v12 selectionPathWithInfo:v13];
  double v15 = [v11 editorController];
  [v15 setSelectionPath:v14];

  +[CATransaction begin];
  +[CATransaction setDisableActions:1];
  float v16 = [(CRLImageRep *)self imageLayout];
  double v17 = [v16 maskLayout];

  if (!v17) {
    [v11 layoutIfNeeded];
  }
  double v18 = [(CRLImageRep *)self imageLayout];
  [v18 beginEditingMaskInMaskEditMode:2];

  if (v3)
  {
    double v19 = [(CRLCanvasRep *)self interactiveCanvasController];
    double v20 = [v19 layerHost];
    float v21 = [v20 miniFormatterPresenter];
    [v21 dismissMiniFormatter];

    float v22 = [v11 layerHost];
    float v23 = [v22 imageHUDController];
    [v23 showHUDForRep:self];
  }
  [(CRLImageRep *)self p_setUpMaskModeUI];
  +[CATransaction commit];
}

- (void)p_selectionPathDidChange:(id)a3
{
  id v4 = [(CRLCanvasRep *)self interactiveCanvasController];
  id v9 = [v4 infosForCurrentSelectionPath];

  if ([v9 count] != (id)1
    || ([v9 anyObject],
        unsigned __int8 v5 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v5,
        (isKindOfClass & 1) == 0))
  {
    double v7 = [(CRLImageRep *)self imageLayout];
    unsigned int v8 = [v7 isInMaskEditMode];

    if (v8) {
      [(CRLImageRep *)self endEditingMask];
    }
  }
}

- (void)becameSelected
{
  v7.receiver = self;
  v7.super_class = (Class)CRLImageRep;
  [(CRLCanvasRep *)&v7 becameSelected];
  os_unfair_lock_lock(&self->_backgroundRemovalLock);
  int64_t autoBackgroundRemovalState = self->_autoBackgroundRemovalState;
  id v4 = [(CRLRemoveImageBackgroundData *)self->_cachedRemoveImageBackgroundData image];
  os_unfair_lock_unlock(&self->_backgroundRemovalLock);
  if (autoBackgroundRemovalState != 2)
  {
    unsigned __int8 v5 = [(CRLImageRep *)self imageInfo];
    unsigned __int8 v6 = [v5 isBackgroundRemoved];

    if ((v6 & 1) == 0 && !v4) {
      [(CRLImageRep *)self p_invalidateCachedRemoveBackgroundImage];
    }
  }
}

- (void)becameNotSelected
{
  v5.receiver = self;
  v5.super_class = (Class)CRLImageRep;
  [(CRLCanvasRep *)&v5 becameNotSelected];
  BOOL v3 = [(CRLImageRep *)self imageLayout];
  unsigned int v4 = [v3 isInMaskEditMode];

  if (v4) {
    [(CRLImageRep *)self p_endEditingMask];
  }
}

- (void)p_invalidateCachedRemoveBackgroundImage
{
}

- (BOOL)containsPoint:(CGPoint)a3 withPrecision:(BOOL)a4
{
  BOOL v4 = a4;
  double x = a3.x;
  double y = a3.y;
  v59.receiver = self;
  v59.super_class = (Class)CRLImageRep;
  unsigned int v6 = -[CRLCanvasRep containsPoint:withPrecision:](&v59, "containsPoint:withPrecision:");
  char v58 = 0;
  if (-[CRLImageRep p_hitCacheGetCachedValue:forPoint:](self, "p_hitCacheGetCachedValue:forPoint:", &v58, x, y))
  {
    LOBYTE(v7) = v58 != 0;
  }
  else
  {
    unsigned int v8 = [(CRLImageRep *)self imageLayout];
    uint64_t v9 = [v8 maskLayout];
    if (v9
      && (objc_super v10 = (void *)v9,
          unsigned int v11 = [v8 maskIntersectsImage],
          v10,
          (v6 & ~v11 & 1) != 0))
    {
      uint64_t v7 = 1;
    }
    else
    {
      if (v6) {
        goto LABEL_45;
      }
      uint64_t v33 = [(CRLImageRep *)self imageLayout];
      uint64_t v7 = (uint64_t)[v33 isInMaskEditMode];

      if (v7)
      {
        if (v8) {
          [v8 layoutToImageTransform];
        }
        else {
          memset(&v56, 0, sizeof(v56));
        }
        CGAffineTransformInvert(&v57, &v56);
        CGPoint pointa = (CGPoint)vaddq_f64(*(float64x2_t *)&v57.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v57.c, y), *(float64x2_t *)&v57.a, x));
        double v34 = [v8 imageGeometry];
        [v34 size];
        v61.origin.double x = sub_100064070();
        uint64_t v7 = CGRectContainsPoint(v61, pointa);

        if (v7)
        {
LABEL_45:
          if (qword_1016A9730 != -1) {
            dispatch_once(&qword_1016A9730, &stru_1014EF3C8);
          }
          CGContextSaveGState((CGContextRef)qword_1016A9728);
          v60.origin.double x = 0.0;
          v60.origin.double y = 0.0;
          v60.size.CGFloat width = 1.0;
          v60.size.CGFloat height = 1.0;
          CGContextClearRect((CGContextRef)qword_1016A9728, v60);
          CGContextTranslateCTM((CGContextRef)qword_1016A9728, -x, -y);
          uint64_t v12 = qword_1016A9728;
          double v13 = [(CRLImageRep *)self imageLayout];
          uint64_t v7 = 1;
          LOBYTE(v48) = 1;
          -[CRLImageRep p_drawInContext:withContent:strokeDrawOptions:withOpacity:withMask:forLayer:forShadow:forHitTest:](self, "p_drawInContext:withContent:strokeDrawOptions:withOpacity:withMask:forLayer:forShadow:forHitTest:", v12, 1, 7, [v13 isInMaskEditMode] ^ 1, 0, 0, 1.0, v48);

          CGContextRestoreGState((CGContextRef)qword_1016A9728);
          if (!*(unsigned char *)qword_1016A9720)
          {
            double v14 = (double *)&unk_101178C20;
            if (!v4) {
              double v14 = (double *)&unk_101178C18;
            }
            double v15 = *v14;
            float v16 = [(CRLCanvasRep *)self canvas];
            [v16 viewScale];
            double v18 = v15 / v17;

            double v19 = ceil(v18 + v18);
            double v20 = sub_100455AA8(19, v19, v19);
            Data = CGBitmapContextGetData(v20);
            CGContextSaveGState(v20);
            CGContextSetInterpolationQuality(v20, kCGInterpolationNone);
            CGContextTranslateCTM(v20, v18, v18);
            CGContextTranslateCTM(v20, -x, -y);
            float v22 = [(CRLImageRep *)self imageLayout];
            LOBYTE(v49) = 1;
            -[CRLImageRep p_drawInContext:withContent:strokeDrawOptions:withOpacity:withMask:forLayer:forShadow:forHitTest:](self, "p_drawInContext:withContent:strokeDrawOptions:withOpacity:withMask:forLayer:forShadow:forHitTest:", v20, 1, 7, [v22 isInMaskEditMode] ^ 1, 0, 0, 1.0, v49);

            CGContextRestoreGState(v20);
            size_t Width = CGBitmapContextGetWidth(v20);
            size_t Height = CGBitmapContextGetHeight(v20);
            size_t BytesPerRow = CGBitmapContextGetBytesPerRow(v20);
            size_t BitsPerPixel = CGBitmapContextGetBitsPerPixel(v20);
            if (Height)
            {
              double v50 = v8;
              size_t v51 = BytesPerRow;
              unint64_t v27 = 0;
              unint64_t v28 = vcvtpd_u64_f64((double)BitsPerPixel * 0.125);
              size_t v29 = BytesPerRow * Height;
              unint64_t v30 = v28;
              size_t point = Height;
              while (!Width)
              {
LABEL_20:
                ++v27;
                Data += v51;
                v30 += v51;
                if (v27 == point)
                {
                  uint64_t v7 = 0;
                  goto LABEL_26;
                }
              }
              uint64_t v31 = 0;
              unint64_t v32 = 0;
              while (1)
              {
                if (sub_1000643CC(v18, v18, (double)v32, (double)v27) < v18 * v18)
                {
                  if (v30 + v31 >= v29)
                  {
                    +[CRLAssertionHandler _atomicIncrementAssertCount];
                    if (qword_101719A70 != -1) {
                      dispatch_once(&qword_101719A70, &stru_1014EF3E8);
                    }
                    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
                      sub_1010A0960();
                    }
                    if (qword_101719A70 != -1) {
                      dispatch_once(&qword_101719A70, &stru_1014EF408);
                    }
                    BOOL v36 = off_10166B4A0;
                    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
                      sub_10106590C(v36);
                    }
                    sub_1001D9720((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Should not try to read outside the context's memory.", v37, v38, v39, v40, v41, v42, v43, (uint64_t)"-[CRLImageRep containsPoint:withPrecision:]");
                    double v44 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageRep containsPoint:withPrecision:]");
                    double v45 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRep.m"];
                    +[CRLAssertionHandler handleFailureInFunction:v44 file:v45 lineNumber:1042 isFatal:1 description:"Should not try to read outside the context's memory."];

                    SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)(v46, v47);
                    abort();
                  }
                  if (Data[v31]) {
                    break;
                  }
                }
                ++v32;
                v31 += v28;
                if (Width == v32) {
                  goto LABEL_20;
                }
              }
              uint64_t v7 = 1;
LABEL_26:
              unsigned int v8 = v50;
            }
            else
            {
              uint64_t v7 = 0;
            }
            CGContextRelease(v20);
          }
        }
      }
    }
    -[CRLImageRep p_hitCacheSetCachedValue:forPoint:](self, "p_hitCacheSetCachedValue:forPoint:", v7, x, y);
  }
  return v7;
}

- (BOOL)p_allowedToEditMask
{
  if ([(CRLImageRepDrawingHelper *)self->_drawingHelper drawsError]) {
    return 0;
  }
  BOOL v4 = [(CRLCanvasRep *)self interactiveCanvasController];
  unsigned __int8 v5 = [v4 allowedToEditMask];

  return v5;
}

- (BOOL)handleDoubleTapAtPoint:(CGPoint)a3 inputType:(int64_t)a4
{
  unsigned __int8 v5 = [(CRLImageRep *)self imageLayout];
  unsigned __int8 v6 = [v5 isInMaskEditMode];

  if ((v6 & 1) == 0) {
    [(CRLImageRep *)self enterPreviewMode];
  }
  return v6 ^ 1;
}

- (void)p_handleImageMask
{
  BOOL v3 = [(CRLCanvasRep *)self interactiveCanvasController];
  unsigned __int8 v4 = [v3 documentIsSharedReadOnly];

  if ((v4 & 1) == 0)
  {
    unsigned __int8 v5 = [(CRLImageRep *)self imageLayout];
    unsigned __int8 v6 = [v5 isInMaskEditMode];

    if (v6)
    {
      uint64_t v7 = [(CRLImageRep *)self imageLayout];
      unsigned int v8 = [v7 isInMaskEditMode];

      if (v8)
      {
        [(CRLImageRep *)self p_endEditingMask];
      }
    }
    else if ([(CRLImageRep *)self p_allowedToEditMask])
    {
      [(CRLImageRep *)self p_enterMaskModeIfNecessaryWithHUD:1];
    }
  }
}

- (BOOL)shouldShowSelectionHighlight
{
  BOOL v3 = [(CRLImageRep *)self imageLayout];
  if ([v3 isInMaskEditMode])
  {
    BOOL v4 = 0;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)CRLImageRep;
    BOOL v4 = [(CRLStyledRep *)&v6 shouldShowSelectionHighlight];
  }

  return v4;
}

- (id)pathSourceForSelectionHighlightBehavior
{
  objc_super v2 = [(CRLImageRep *)self imageLayout];
  BOOL v3 = [v2 maskLayout];
  BOOL v4 = [v3 pathSource];

  return v4;
}

- (void)processChanges:(id)a3
{
  id v4 = a3;
  [(CRLImageRep *)self p_updateDirectlyManagesLayerContentForRenderable:0];
  v5.receiver = self;
  v5.super_class = (Class)CRLImageRep;
  [(CRLCanvasRep *)&v5 processChanges:v4];
}

- (void)processChangedProperty:(unint64_t)a3
{
  v16.receiver = self;
  v16.super_class = (Class)CRLImageRep;
  -[CRLStyledRep processChangedProperty:](&v16, "processChangedProperty:");
  if ((uint64_t)a3 <= 14)
  {
    if (a3 == 7)
    {
LABEL_17:
      drawingHelper = self->_drawingHelper;
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_100338EB4;
      v15[3] = &unk_1014EF498;
      v15[4] = self;
      [(CRLImageRepDrawingHelper *)drawingHelper invalidateSizedImageIfNeededForBakedMaskPathFromBlock:v15];
LABEL_18:
      [(CRLStyledRep *)self setNeedsDisplay];
      self->_frameInUnscaledCanvasIsValid = 0;
      uint64_t v12 = [(CRLCanvasRep *)self canvas];
      [v12 canvasInvalidatedForRep:self];

      goto LABEL_19;
    }
    if (a3 == 11)
    {
      uint64_t v9 = [(CRLImageRep *)self imageLayout];
      unsigned int v10 = [v9 isInMaskEditMode];

      if (v10) {
        [(CRLImageRep *)self p_endEditingMask];
      }
    }
  }
  else
  {
    switch(a3)
    {
      case 0x24uLL:
        goto LABEL_5;
      case 0x12uLL:
        [(CRLImageRepDrawingHelper *)self->_drawingHelper invalidateSizedImage];
        [(CRLImageRep *)self p_listenForAssetChangesIfAppropriate];
        double v13 = [(CRLImageRep *)self imageLayout];
        if ([v13 isInMaskEditMode])
        {
          unsigned int v14 = [(CRLImageRepDrawingHelper *)self->_drawingHelper drawsError];

          if (v14) {
            [(CRLImageRep *)self p_endEditingMask];
          }
        }
        else
        {
        }
        goto LABEL_18;
      case 0xFuLL:
LABEL_5:
        [(CRLImageRep *)self p_disposeStrokeLayer];
        [(CRLCanvasRep *)self invalidateKnobs];
        if (a3 == 36)
        {
          objc_super v5 = [(CRLImageRep *)self imageLayout];
          [v5 invalidateAlignmentFrame];
        }
        objc_super v6 = [(CRLImageRep *)self imageLayout];
        if (![v6 maskEditMode])
        {
          uint64_t v7 = [(CRLImageRep *)self imageInfo];
          unsigned int v8 = [v7 maskInfo];

          if (!v8) {
            goto LABEL_11;
          }
          objc_super v6 = [(CRLImageRep *)self imageLayout];
          [v6 maskWasApplied];
        }

LABEL_11:
        if (a3 != 36) {
          goto LABEL_18;
        }
        goto LABEL_17;
    }
  }
LABEL_19:
  [(CRLImageRep *)self p_updateHUD];
  [(CRLImageRep *)self p_invalidateHitTestCache];
}

- (void)layoutInRootChangedFrom:(id)a3 to:(id)a4 translatedOnly:(BOOL)a5
{
  v7.receiver = self;
  v7.super_class = (Class)CRLImageRep;
  -[CRLCanvasRep layoutInRootChangedFrom:to:translatedOnly:](&v7, "layoutInRootChangedFrom:to:translatedOnly:", a3, a4);
  if (!a5) {
    self->_frameInUnscaledCanvasIsValid = 0;
  }
}

- (void)documentEditabilityDidChange
{
  v8.receiver = self;
  v8.super_class = (Class)CRLImageRep;
  [(CRLCanvasRep *)&v8 documentEditabilityDidChange];
  BOOL v3 = [(CRLCanvasRep *)self interactiveCanvasController];
  if ([v3 editingDisabled])
  {
    id v4 = [(CRLImageRep *)self imageLayout];
    unsigned int v5 = [v4 isInMaskEditMode];

    if (!v5) {
      return;
    }
    [(CRLImageRep *)self p_endEditingMask];
    BOOL v3 = [(CRLCanvasRep *)self interactiveCanvasController];
    objc_super v6 = [v3 layerHost];
    objc_super v7 = [v6 imageHUDController];
    [v7 closeHUDWithAnimation:0];
  }
}

- (id)overlayRenderables
{
  v29.receiver = self;
  v29.super_class = (Class)CRLImageRep;
  BOOL v3 = [(CRLCanvasRep *)&v29 overlayRenderables];
  id v4 = +[NSMutableArray arrayWithArray:v3];

  unsigned int v5 = [(CRLCanvasRep *)self interactiveCanvasController];
  if (self->_showImageHighlight)
  {
    objc_super v6 = +[CRLCanvasShapeRenderable renderable];
    objc_super v7 = sub_10000FE5C(0.458, 0.697, 0.916, 0.53);
    [v6 setFillColor:v7];
    CGColorRelease(v7);
    [v6 setLineWidth:1.0];
    [v6 setStrokeColor:0];
    objc_super v8 = [(CRLCanvasRep *)self canvas];
    [v8 viewScale];
    CGFloat v10 = v9;

    [(CRLImageRep *)self boundsForStandardKnobs];
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    memset(&v28, 0, sizeof(v28));
    double v19 = [(CRLCanvasRep *)self layout];
    double v20 = v19;
    if (v19) {
      [v19 transformInRoot];
    }
    else {
      memset(&v28, 0, sizeof(v28));
    }

    CGAffineTransformMakeScale(&t2, v10, v10);
    CGAffineTransform v25 = v28;
    CGAffineTransformConcat(&v27, &v25, &t2);
    CGAffineTransform v28 = v27;
    float v21 = [(CRLCanvasRep *)self canvas];
    [v21 contentsScale];
    float v23 = sub_1000D5638(&v28.a, v12, v14, v16, v18, 1.0, v22);

    [v6 setPath:v23];
    CGPathRelease(v23);
    [v6 setDelegate:v5];
    [v4 addObject:v6];
  }

  return v4;
}

- (int64_t)tilingMode
{
  return 1;
}

- (BOOL)hitRepChrome:(CGPoint)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CRLImageRep;
  return -[CRLCanvasRep hitRepChrome:](&v4, "hitRepChrome:", a3.x, a3.y);
}

- (CGPoint)positionOfStandardKnob:(id)a3 forBounds:(CGRect)a4
{
  v23.receiver = self;
  v23.super_class = (Class)CRLImageRep;
  -[CRLCanvasRep positionOfStandardKnob:forBounds:](&v23, "positionOfStandardKnob:forBounds:", a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  double v18 = v6;
  double v19 = v5;
  objc_super v7 = [(CRLImageRep *)self imageLayout];
  if ([v7 maskEditMode] == (id)3)
  {
    objc_super v8 = [(CRLCanvasRep *)self layout];
    if ([v8 layoutState] == 4)
    {
      double v9 = [(CRLImageRep *)self imageLayout];
      unsigned int v10 = [v9 isInMaskScaleMode];

      if (!v10) {
        goto LABEL_11;
      }
    }
    else
    {
    }
    double v11 = [(CRLImageRep *)self imageLayout];
    objc_super v7 = v11;
    if (v11)
    {
      [v11 layoutToImageTransform];
      float64x2_t v12 = v20;
      float64x2_t v13 = v21;
      float64x2_t v14 = v22;
    }
    else
    {
      float64x2_t v14 = 0uLL;
      float64x2_t v12 = 0uLL;
      float64x2_t v13 = 0uLL;
    }
    float64x2_t v15 = vaddq_f64(v14, vmlaq_n_f64(vmulq_n_f64(v13, v18), v12, v19));
    double v18 = v15.f64[1];
    double v19 = v15.f64[0];
  }

LABEL_11:
  double v17 = v18;
  double v16 = v19;
  result.double y = v17;
  result.double x = v16;
  return result;
}

- (CGRect)boundsForHighlightLayer
{
  BOOL v3 = [(CRLImageRep *)self imageLayout];
  id v4 = [v3 maskEditMode];

  if (v4 == (id)3)
  {
    float64x2_t v12 = self;
    double v5 = &selRef_boundsForStandardKnobs;
    double v6 = &v12;
  }
  else
  {
    double v11 = self;
    double v5 = &selRef_boundsForHighlightLayer;
    double v6 = &v11;
  }
  v6[1] = (CRLImageRep *)CRLImageRep;
  [v6 super:v5];
  result.size.CGFloat height = v10;
  result.size.CGFloat width = v9;
  result.origin.double y = v8;
  result.origin.double x = v7;
  return result;
}

- (CGAffineTransform)transformForHighlightLayer
{
  uint64_t v5 = [(CRLCanvasRep *)self currentKnobTracker];
  if (v5
    && (double v6 = (void *)v5,
        [(CRLImageRep *)self imageLayout],
        double v7 = objc_claimAutoreleasedReturnValue(),
        id v8 = [v7 maskEditMode],
        v7,
        v6,
        v8 != (id)3))
  {
    double v10 = [(CRLCanvasRep *)self currentKnobTracker];
    if (v10)
    {
      double v11 = v10;
      [v10 transformInRootForStandardKnobs];
      double v10 = v11;
    }
    else
    {
      *(_OWORD *)&retstr->c = 0u;
      *(_OWORD *)&retstr->tdouble x = 0u;
      *(_OWORD *)&retstr->a = 0u;
    }
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)CRLImageRep;
    return (CGAffineTransform *)[(CGAffineTransform *)&v12 transformForHighlightLayer];
  }
  return result;
}

- (BOOL)shouldAllowReplacementFromPaste
{
  BOOL v3 = [(CRLImageRep *)self imageLayout];
  if ([v3 isInMaskEditMode])
  {
    BOOL v4 = 1;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)CRLImageRep;
    BOOL v4 = [(CRLMediaRep *)&v6 shouldAllowReplacementFromPaste];
  }

  return v4;
}

- (BOOL)canPasteDataFromPhysicalKeyboard:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  objc_super v6 = [(CRLCanvasRep *)self info];
  double v7 = sub_1002469D0(v5, v6);

  id v8 = [v7 imageAssetPayload];

  return v8 != v4;
}

- (id)commandForAcceptingPasteWithImageInfo:(id)a3 outSelectionBehavior:(id *)a4
{
  id v6 = a3;
  double v7 = [(CRLImageRep *)self imageInfo];
  id v8 = +[NSMutableArray array];
  double v9 = [v7 maskInfo];

  if (!v9)
  {
    double v10 = [_TtC8Freeform17CRLCommandSetMask alloc];
    double v11 = [v7 defaultMaskInfo];
    objc_super v12 = [(CRLCommandSetMask *)v10 initWithImageItem:v7 maskInfo:v11];

    [v8 addObject:v12];
  }
  float64x2_t v13 = [_TtC8Freeform22CRLCommandReplaceImage alloc];
  float64x2_t v14 = [v6 imageAssetPayload];
  float64x2_t v15 = [v6 thumbnailAssetPayload];

  double v16 = [(CRLCommandReplaceImage *)v13 initWithImageItem:v7 imageData:v14 thumbnailData:v15];
  [v8 addObject:v16];

  if ([v8 count])
  {
    double v17 = [[_TtC8Freeform15CRLCommandGroup alloc] initWithCommands:v8];
    double v18 = [(CRLCanvasRep *)self interactiveCanvasController];
    double v19 = [v18 editorController];

    float64x2_t v20 = [v19 mostSpecificEditorConformingToProtocol:&OBJC_PROTOCOL___CRLCanvasEditor];
    if (a4)
    {
      float64x2_t v21 = [CRLCanvasCommandSelectionBehavior alloc];
      float64x2_t v22 = [v19 selectionPath];
      *a4 = [(CRLCanvasCommandSelectionBehavior *)v21 initWithCanvasEditor:v20 type:2 selectionPath:v22 selectionFlags:4];
    }
  }
  else
  {
    double v17 = 0;
    if (a4) {
      *a4 = 0;
    }
  }

  return v17;
}

- (BOOL)p_isResizingImageInMaskEditMode
{
  BOOL v3 = [(CRLImageRep *)self imageLayout];
  if ([v3 layoutState] == 4)
  {
    id v4 = [(CRLImageRep *)self imageLayout];
    BOOL v5 = [v4 maskEditMode] == (id)3;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)p_isResizingMaskInMaskEditMode
{
  BOOL v3 = [(CRLImageRep *)self imageLayout];
  if ([v3 layoutState] == 4)
  {
    id v4 = [(CRLImageRep *)self imageLayout];
    BOOL v5 = [v4 maskEditMode] == (id)2;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (CGRect)boundsForCollaboratorCursorRenderable
{
  v33.receiver = self;
  v33.super_class = (Class)CRLImageRep;
  [(CRLCanvasRep *)&v33 boundsForCollaboratorCursorRenderable];
  CGFloat x = v3;
  CGFloat y = v5;
  CGFloat width = v7;
  CGFloat height = v9;
  if ([(CRLImageRep *)self p_isResizingMaskInMaskEditMode])
  {
    [(CRLCanvasRep *)self trackingBoundsForStandardKnobs];
    CGFloat x = v11;
    CGFloat y = v12;
    CGFloat width = v13;
    CGFloat height = v14;
  }
  else
  {
    float64x2_t v15 = [(CRLImageRep *)self imageLayout];
    unsigned int v16 = [v15 isInMaskEditMode];

    if (v16)
    {
      double v17 = [(CRLImageRep *)self maskLayout];
      [v17 boundsForStandardKnobs];
      CGFloat v19 = v18;
      CGFloat v21 = v20;
      CGFloat v23 = v22;
      CGFloat v25 = v24;
      float v26 = [(CRLImageRep *)self imageLayout];
      CGAffineTransform v27 = v26;
      if (v26) {
        [v26 layoutToMaskTransform];
      }
      else {
        memset(&v32, 0, sizeof(v32));
      }
      v34.origin.CGFloat x = v19;
      v34.origin.CGFloat y = v21;
      v34.size.CGFloat width = v23;
      v34.size.CGFloat height = v25;
      CGRect v35 = CGRectApplyAffineTransform(v34, &v32);
      CGFloat x = v35.origin.x;
      CGFloat y = v35.origin.y;
      CGFloat width = v35.size.width;
      CGFloat height = v35.size.height;
    }
  }
  double v28 = x;
  double v29 = y;
  double v30 = width;
  double v31 = height;
  result.size.CGFloat height = v31;
  result.size.CGFloat width = v30;
  result.origin.CGFloat y = v29;
  result.origin.CGFloat x = v28;
  return result;
}

- (CGAffineTransform)transformForCollaboratorCursorRenderable
{
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tCGFloat x = 0u;
  *(_OWORD *)&retstr->a = 0u;
  v11.receiver = self;
  v11.super_class = (Class)CRLImageRep;
  [(CGAffineTransform *)&v11 transformForCollaboratorCursorRenderable];
  CGRect result = (CGAffineTransform *)[(CRLImageRep *)self p_isResizingImageInMaskEditMode];
  if (result)
  {
    id v6 = [(CRLCanvasRep *)self layout];
    double v7 = v6;
    if (v6)
    {
      [v6 transformInRoot];
    }
    else
    {
      long long v9 = 0u;
      long long v10 = 0u;
      long long v8 = 0u;
    }
    *(_OWORD *)&retstr->a = v8;
    *(_OWORD *)&retstr->c = v9;
    *(_OWORD *)&retstr->tCGFloat x = v10;
  }
  return result;
}

- (BOOL)shouldShowDragHUD
{
  objc_super v2 = [(CRLImageRep *)self imageLayout];
  char v3 = [v2 isInMaskEditMode] ^ 1;

  return v3;
}

- (void)dynamicDragDidBegin
{
  char v3 = [(CRLImageRep *)self imageLayout];
  [v3 validate];

  id v4 = [(CRLImageRep *)self imageLayout];
  unsigned int v5 = [v4 isInMaskEditMode];

  if (v5)
  {
    id v6 = [(CRLCanvasRep *)self interactiveCanvasController];
    double v7 = [v6 dynamicOperationController];
    [v7 invalidateGuides];
  }
  v8.receiver = self;
  v8.super_class = (Class)CRLImageRep;
  [(CRLCanvasRep *)&v8 dynamicDragDidBegin];
}

- (BOOL)providesGuidesWhileAligning
{
  char v3 = [(CRLImageRep *)self imageLayout];
  unsigned int v4 = [v3 isInMaskEditMode];

  if (!v4)
  {
    v10.receiver = self;
    v10.super_class = (Class)CRLImageRep;
    return [(CRLCanvasRep *)&v10 providesGuidesWhileAligning];
  }
  if ([(CRLCanvasRep *)self isBeingResized])
  {
    unsigned int v5 = [(CRLImageRep *)self imageLayout];
    id v6 = [v5 imageGeometryInRoot];
    double v7 = v6;
    if (v6) {
      [v6 transform];
    }
    else {
      memset(v11, 0, sizeof(v11));
    }
    LOBYTE(v8) = sub_10007F964((double *)v11);

    return v8;
  }

  return [(CRLCanvasRep *)self isBeingDragged];
}

- (BOOL)exclusivelyProvidesGuidesWhileAligning
{
  char v3 = [(CRLImageRep *)self imageLayout];
  if ([v3 isInMaskEditMode]) {
    BOOL v4 = [(CRLCanvasRep *)self isInDynamicOperation];
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (id)actionStringForDrag
{
  char v3 = [(CRLImageRep *)self imageLayout];
  unsigned int v4 = [v3 isInMaskEditMode];

  if (v4)
  {
    unsigned int v5 = +[NSBundle mainBundle];
    id v6 = [v5 localizedStringForKey:@"Edit Mask" value:0 table:@"UndoStrings"];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CRLImageRep;
    id v6 = [(CRLCanvasRep *)&v8 actionStringForDrag];
  }

  return v6;
}

- (CGRect)snapRectForDynamicDragWithOffset:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v6 = [(CRLImageRep *)self imageLayout];
  id v7 = [v6 maskEditModeForDragging];

  objc_super v8 = [(CRLImageRep *)self imageLayout];
  long long v9 = v8;
  if (v7 == (id)3)
  {
    objc_super v10 = [v8 imageGeometry];
    [v10 size];
    double v11 = sub_100064070();
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;

    memset(&v50, 0, sizeof(v50));
    if (v9)
    {
      [v9 layoutToImageTransform];
      [v9 transformInRoot];
    }
    else
    {
      memset(&t1, 0, sizeof(t1));
      memset(&t2, 0, sizeof(t2));
    }
    CGAffineTransformConcat(&v50, &t1, &t2);
    CGAffineTransform v47 = v50;
    v51.origin.CGFloat x = v11;
    v51.origin.CGFloat y = v13;
    v51.size.CGFloat width = v15;
    v51.size.CGFloat height = v17;
    CGRect v52 = CGRectApplyAffineTransform(v51, &v47);
    CGRect v53 = CGRectOffset(v52, x, y);
    CGFloat v34 = v53.origin.x;
    CGFloat v35 = v53.origin.y;
    CGFloat width = v53.size.width;
    CGFloat height = v53.size.height;
  }
  else
  {
    id v18 = [v8 maskEditModeForDragging];

    if (v18 == (id)2)
    {
      CGFloat v19 = [(CRLImageRep *)self maskLayout];
      double v20 = [v19 geometry];
      [v20 size];
      double v21 = sub_100064070();
      CGFloat v23 = v22;
      CGFloat v25 = v24;
      CGFloat v27 = v26;

      memset(&v50, 0, sizeof(v50));
      double v28 = [(CRLImageRep *)self imageLayout];
      double v29 = v28;
      if (v28) {
        [v28 layoutToMaskTransform];
      }
      else {
        memset(&v46, 0, sizeof(v46));
      }
      uint64_t v38 = [(CRLImageRep *)self imageLayout];
      uint64_t v39 = v38;
      if (v38) {
        [v38 transformInRoot];
      }
      else {
        memset(&v45, 0, sizeof(v45));
      }
      CGAffineTransformConcat(&v50, &v46, &v45);

      CGAffineTransform v47 = v50;
      v54.origin.CGFloat x = v21;
      v54.origin.CGFloat y = v23;
      v54.size.CGFloat width = v25;
      v54.size.CGFloat height = v27;
      CGRect v55 = CGRectApplyAffineTransform(v54, &v47);
      *(CGRect *)&CGFloat v30 = CGRectOffset(v55, x, y);
    }
    else
    {
      v44.receiver = self;
      v44.super_class = (Class)CRLImageRep;
      -[CRLCanvasRep snapRectForDynamicDragWithOffset:](&v44, "snapRectForDynamicDragWithOffset:", x, y);
    }
    CGFloat v34 = v30;
    CGFloat v35 = v31;
    CGFloat width = v32;
    CGFloat height = v33;
  }
  double v40 = v34;
  double v41 = v35;
  double v42 = width;
  double v43 = height;
  result.size.CGFloat height = v43;
  result.size.CGFloat width = v42;
  result.origin.CGFloat y = v41;
  result.origin.CGFloat x = v40;
  return result;
}

- (CGPoint)i_dragOffset
{
  char v3 = [(CRLImageRep *)self imageLayout];
  unsigned int v4 = [v3 isInMaskEditMode];

  if (v4)
  {
    unsigned int v5 = [(CRLImageRep *)self imageLayout];
    id v6 = [v5 currentInfoGeometry];
    [v6 position];
    double v8 = v7;
    double v10 = v9;
    double v11 = [(CRLCanvasRep *)self info];
    double v12 = [v11 geometry];
    [v12 position];
    double v14 = sub_100064680(v8, v10, v13);
    double v16 = v15;

    double v17 = v14;
    double v18 = v16;
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)CRLImageRep;
    [(CRLCanvasRep *)&v19 i_dragOffset];
  }
  result.CGFloat y = v18;
  result.CGFloat x = v17;
  return result;
}

- (BOOL)p_currentEditOperationDidChangeTheImageGeometry
{
  objc_super v2 = [(CRLImageRep *)self imageLayout];
  if ([v2 isInMaskEditMode])
  {
    if ([v2 isDraggingInMaskEditMode])
    {
      id v3 = [v2 maskEditModeForDragging];
LABEL_9:
      BOOL v4 = v3 == (id)3;
      goto LABEL_10;
    }
    if ([v2 isRotatingInMaskEditMode])
    {
      id v3 = [v2 maskEditModeForRotating];
      goto LABEL_9;
    }
    if ([v2 isResizingInMaskEditMode])
    {
      id v3 = [v2 maskEditModeForResizing];
      goto LABEL_9;
    }
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EF4B8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A0A7C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EF4D8);
    }
    id v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v6);
    }
    double v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageRep p_currentEditOperationDidChangeTheImageGeometry]");
    double v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRep.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 1480, 0, "layout is in a not possible state, editing mask but not editing mask");

    BOOL v4 = 0;
  }
  else
  {
    BOOL v4 = 1;
  }
LABEL_10:

  return v4;
}

- (id)newCommandToApplyGeometry:(id)a3 toInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(CRLImageRep *)self imageInfo];
  if ((id)v8 == v7)
  {
  }
  else
  {
    double v9 = (void *)v8;
    id v10 = [(CRLImageRep *)self maskInfo];

    if (v10 != v7)
    {
      unsigned int v11 = +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014EF4F8);
      }
      double v12 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67110402;
        unsigned int v34 = v11;
        __int16 v35 = 2082;
        BOOL v36 = "-[CRLImageRep newCommandToApplyGeometry:toInfo:]";
        __int16 v37 = 2082;
        uint64_t v38 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRep.m";
        __int16 v39 = 1024;
        int v40 = 1498;
        __int16 v41 = 2112;
        id v42 = v7;
        __int16 v43 = 2112;
        objc_super v44 = self;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d called newCommandToApplyGeometry on and info %@ that the rep %@ does not know about", buf, 0x36u);
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014EF518);
      }
      double v13 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v13);
      }
      double v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageRep newCommandToApplyGeometry:toInfo:]");
      double v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRep.m"];
      +[CRLAssertionHandler handleFailureInFunction:v14, v15, 1498, 0, "called newCommandToApplyGeometry on and info %@ that the rep %@ does not know about", v7, self file lineNumber isFatal description];
    }
  }
  double v16 = [(CRLImageRep *)self imageInfo];
  if (!v16)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EF538);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A0B8C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EF558);
    }
    double v17 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v17);
    }
    double v18 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageRep newCommandToApplyGeometry:toInfo:]");
    objc_super v19 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRep.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v18, v19, 1503, 0, "invalid nil value for '%{public}s'", "imageInfo");
  }
  unsigned int v20 = [(CRLImageRep *)self p_currentEditOperationDidChangeTheImageGeometry];
  double v21 = [(CRLImageRep *)self maskLayout];
  double v22 = [v21 infoGeometry];
  id v23 = [v22 mutableCopy];

  double v24 = [(CRLImageRep *)self maskLayout];
  CGFloat v25 = [v24 pathSource];
  id v26 = [v25 copy];

  if (v20)
  {
    id v27 = v6;
    double v28 = [[_TtC8Freeform30CRLCommandSetImageItemGeometry alloc] initWithImageItem:v16 imageGeometry:v27 maskGeometry:v23 maskPathSource:v26];
  }
  else
  {
    if (!v23)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014EF578);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010A0B04();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014EF598);
      }
      double v29 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v29);
      }
      CGFloat v30 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageRep newCommandToApplyGeometry:toInfo:]");
      double v31 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRep.m"];
      +[CRLAssertionHandler handleFailureInFunction:v30 file:v31 lineNumber:1532 isFatal:0 description:"should have a new mask geometry if changing only the mask"];
    }
    double v28 = [[_TtC8Freeform30CRLCommandSetImageItemGeometry alloc] initWithImageItem:v16 imageGeometry:0 maskGeometry:v23 maskPathSource:v26];
  }

  return v28;
}

- (BOOL)maskGeometryDidChange
{
  id v3 = [(CRLImageRep *)self maskLayout];
  BOOL v4 = [v3 infoGeometry];

  unsigned int v5 = [(CRLImageRep *)self maskInfo];
  if (v5)
  {
    id v6 = [(CRLImageRep *)self maskInfo];
    id v7 = [v6 geometry];
    unsigned int v8 = [v7 isEqual:v4] ^ 1;
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (BOOL)dragDidChangeGeometry
{
  v6.receiver = self;
  v6.super_class = (Class)CRLImageRep;
  if ([(CRLCanvasRep *)&v6 dragDidChangeGeometry]) {
    return 1;
  }
  BOOL v4 = [(CRLImageRep *)self imageLayout];
  if ([v4 isInMaskEditMode]) {
    BOOL v3 = [(CRLImageRep *)self maskGeometryDidChange];
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

- (void)dynamicOperationDidEnd
{
  v8.receiver = self;
  v8.super_class = (Class)CRLImageRep;
  [(CRLCanvasRep *)&v8 dynamicOperationDidEnd];
  BOOL v3 = [(CRLImageRep *)self imageLayout];
  unsigned int v4 = [v3 isInMaskEditMode];

  if (v4)
  {
    unsigned int v5 = [(CRLCanvasRep *)self interactiveCanvasController];
    objc_super v6 = [v5 layerHost];
    id v7 = [v6 imageHUDController];
    [v7 showHUDForRep:self];
  }
}

- (BOOL)demandsExclusiveSelection
{
  v6.receiver = self;
  v6.super_class = (Class)CRLImageRep;
  if ([(CRLCanvasRep *)&v6 demandsExclusiveSelection]) {
    return 1;
  }
  unsigned int v4 = [(CRLImageRep *)self imageLayout];
  unsigned __int8 v3 = [v4 isInMaskEditMode];

  return v3;
}

- (BOOL)allowDragAcrossPageBoundaries
{
  v6.receiver = self;
  v6.super_class = (Class)CRLImageRep;
  if ([(CRLCanvasRep *)&v6 allowDragAcrossPageBoundaries])
  {
    unsigned __int8 v3 = [(CRLImageRep *)self imageLayout];
    unsigned int v4 = [v3 isInMaskEditMode] ^ 1;
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (id)dynamicResizeDidBegin
{
  unsigned __int8 v3 = [(CRLImageRep *)self imageLayout];
  unsigned int v4 = [v3 isInMaskEditMode];

  if (v4)
  {
    unsigned int v5 = [(CRLCanvasRep *)self interactiveCanvasController];
    objc_super v6 = [v5 dynamicOperationController];
    [v6 invalidateGuides];
  }
  v17.receiver = self;
  v17.super_class = (Class)CRLImageRep;
  id v7 = [(CRLCanvasRep *)&v17 dynamicResizeDidBegin];
  objc_super v8 = [(CRLImageRep *)self imageLayout];
  id v9 = [v8 maskEditModeForResizing];

  if (v9 == (id)2)
  {
    id v10 = [(CRLImageRep *)self maskLayout];
  }
  else
  {
    unsigned int v11 = [(CRLImageRep *)self maskLayout];
    double v12 = v11;
    if (v11)
    {
      [v11 transform];
    }
    else
    {
      long long v15 = 0u;
      long long v16 = 0u;
      long long v14 = 0u;
    }
    *(_OWORD *)&self->_baseMaskLayoutTransform.a = v14;
    *(_OWORD *)&self->_baseMaskLayoutTransform.c = v15;
    *(_OWORD *)&self->_baseMaskLayoutTransform.tCGFloat x = v16;

    id v10 = [(CRLCanvasRep *)self layout];
  }

  return v10;
}

- (id)infoForTransforming
{
  unsigned __int8 v3 = [(CRLImageRep *)self imageLayout];
  id v4 = [v3 maskEditModeForResizing];

  if (v4 == (id)2)
  {
    unsigned int v5 = [(CRLImageRep *)self maskInfo];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CRLImageRep;
    unsigned int v5 = [(CRLCanvasRep *)&v7 infoForTransforming];
  }

  return v5;
}

- (BOOL)wantsGuidesWhileResizing
{
  unsigned __int8 v3 = [(CRLImageRep *)self imageLayout];
  unsigned int v4 = [v3 isInMaskEditMode];

  if (v4)
  {
    return [(CRLCanvasRep *)self isBeingResized];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)CRLImageRep;
    return [(CRLCanvasRep *)&v6 wantsGuidesWhileResizing];
  }
}

- (id)resizedGeometryForTransform:(CGAffineTransform *)a3
{
  memset(&v33, 0, sizeof(v33));
  uint64_t v5 = [(CRLImageRep *)self maskInfo];
  if (v5)
  {
    objc_super v6 = (void *)v5;
    objc_super v7 = [(CRLImageRep *)self imageLayout];
    if ([v7 maskEditModeForResizing] == (id)2 && !-[CRLCanvasRep isBeingRotated](self, "isBeingRotated"))
    {
      unsigned __int8 v15 = [(CRLCanvasRep *)self isBeingFreeTransformed];

      if ((v15 & 1) == 0)
      {
        long long v16 = [(CRLCanvasRep *)self info];
        objc_super v17 = [v16 geometry];
        double v18 = v17;
        if (v17) {
          [v17 transform];
        }
        else {
          memset(&t1, 0, sizeof(t1));
        }
        long long v19 = *(_OWORD *)&a3->c;
        *(_OWORD *)&t2.a = *(_OWORD *)&a3->a;
        *(_OWORD *)&t2.c = v19;
        *(_OWORD *)&t2.tCGFloat x = *(_OWORD *)&a3->tx;
        CGAffineTransformConcat(&v31, &t1, &t2);
        unsigned int v20 = [(CRLCanvasRep *)self info];
        double v21 = [v20 geometry];
        double v22 = v21;
        if (v21) {
          [v21 transform];
        }
        else {
          memset(&v28, 0, sizeof(v28));
        }
        CGAffineTransformInvert(&v29, &v28);
        CGAffineTransformConcat(&t2, &v31, &v29);
        long long v23 = *(_OWORD *)&t2.c;
        *(_OWORD *)&a3->a = *(_OWORD *)&t2.a;
        *(_OWORD *)&a3->c = v23;
        *(_OWORD *)&a3->tCGFloat x = *(_OWORD *)&t2.tx;

        objc_super v8 = [(CRLImageRep *)self maskInfo];
        double v24 = [v8 geometry];
        id v10 = v24;
        if (v24) {
          [v24 fullTransform];
        }
        else {
          memset(v27, 0, sizeof(v27));
        }
        long long v25 = *(_OWORD *)&a3->c;
        *(_OWORD *)&t2.a = *(_OWORD *)&a3->a;
        *(_OWORD *)&t2.c = v25;
        *(_OWORD *)&t2.tCGFloat x = *(_OWORD *)&a3->tx;
        double v12 = (CGAffineTransform *)v27;
        goto LABEL_9;
      }
    }
    else
    {
    }
  }
  objc_super v8 = [(CRLImageRep *)self imageLayout];
  id v9 = [v8 originalImageGeometry];
  id v10 = v9;
  if (v9) {
    [v9 fullTransform];
  }
  else {
    memset(v26, 0, sizeof(v26));
  }
  long long v11 = *(_OWORD *)&a3->c;
  *(_OWORD *)&t2.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&t2.c = v11;
  *(_OWORD *)&t2.tCGFloat x = *(_OWORD *)&a3->tx;
  double v12 = (CGAffineTransform *)v26;
LABEL_9:
  CGAffineTransformConcat(&v33, v12, &t2);

  CGAffineTransform t2 = v33;
  double v13 = +[CRLCanvasInfoGeometry geometryFromFullTransform:&t2];

  return v13;
}

- (id)actionStringForResize
{
  unsigned __int8 v3 = [(CRLImageRep *)self imageLayout];
  unsigned int v4 = [v3 isInMaskEditMode];

  if (v4)
  {
    uint64_t v5 = +[NSBundle mainBundle];
    objc_super v6 = [v5 localizedStringForKey:@"Edit Mask" value:0 table:@"UndoStrings"];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CRLImageRep;
    objc_super v6 = [(CRLCanvasRep *)&v8 actionStringForResize];
  }

  return v6;
}

- (CGPoint)centerForRotation
{
  unsigned __int8 v3 = [(CRLImageRep *)self imageLayout];
  unsigned int v4 = [v3 isInMaskEditMode];

  if (v4)
  {
    uint64_t v5 = [(CRLImageRep *)self imageLayout];
    [v5 centerForRotationInMaskMode];
    double v7 = v6;
    double v9 = v8;

    double v10 = v7;
    double v11 = v9;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)CRLImageRep;
    [(CRLCanvasRep *)&v12 centerForRotation];
  }
  result.CGFloat y = v11;
  result.CGFloat x = v10;
  return result;
}

- (double)angleForRotation
{
  unsigned __int8 v3 = [(CRLImageRep *)self imageLayout];
  id v4 = [v3 maskEditModeForRotating];

  if (v4 == (id)3)
  {
    v10.receiver = self;
    v10.super_class = (Class)CRLImageRep;
    [(CRLCanvasRep *)&v10 angleForRotation];
  }
  else
  {
    double v6 = [(CRLImageRep *)self imageInfo];
    double v7 = [v6 geometryWithMask];
    [v7 angle];
    double v9 = v8;

    return v9;
  }
  return result;
}

- (BOOL)shouldRasterizeRenderableDuringRotation
{
  return ![(CRLImageRep *)self directlyManagesLayerContent];
}

- (CGPoint)unscaledGuidePosition
{
  unsigned __int8 v3 = [(CRLImageRep *)self imageLayout];
  id v4 = [v3 maskEditModeForRotating];

  if (v4 == (id)3)
  {
    uint64_t v5 = [(CRLImageRep *)self imageLayout];
    double v6 = [v5 imageGeometry];
    [v6 size];
    double v7 = sub_100064070();
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;

    v29.origin.CGFloat x = v7;
    v29.origin.CGFloat y = v9;
    v29.size.CGFloat width = v11;
    v29.size.CGFloat height = v13;
    double MidX = CGRectGetMidX(v29);
    v30.origin.CGFloat x = v7;
    v30.origin.CGFloat y = v9;
    v30.size.CGFloat width = v11;
    v30.size.CGFloat height = v13;
    double MinY = CGRectGetMinY(v30);
    long long v14 = [(CRLImageRep *)self imageLayout];
    unsigned __int8 v15 = v14;
    if (v14)
    {
      [v14 layoutToImageTransform];
      float64x2_t v16 = v25;
      float64x2_t v17 = v26;
      float64x2_t v18 = v27;
    }
    else
    {
      float64x2_t v18 = 0uLL;
      float64x2_t v26 = 0u;
      float64x2_t v27 = 0u;
      float64x2_t v25 = 0u;
      float64x2_t v16 = 0uLL;
      float64x2_t v17 = 0uLL;
    }
    float64x2_t v23 = vaddq_f64(v18, vmlaq_n_f64(vmulq_n_f64(v17, MinY), v16, MidX));

    [(CRLCanvasRep *)self convertNaturalPointToUnscaledCanvas:*(_OWORD *)&v23];
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)CRLImageRep;
    [(CRLCanvasRep *)&v24 unscaledGuidePosition];
  }
  result.CGFloat y = v20;
  result.CGFloat x = v19;
  return result;
}

- (id)actionStringForRotate
{
  unsigned __int8 v3 = [(CRLImageRep *)self imageLayout];
  unsigned int v4 = [v3 isInMaskEditMode];

  if (v4)
  {
    uint64_t v5 = +[NSBundle mainBundle];
    double v6 = [v5 localizedStringForKey:@"Edit Mask" value:0 table:@"UndoStrings"];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CRLImageRep;
    double v6 = [(CRLCanvasRep *)&v8 actionStringForRotate];
  }

  return v6;
}

- (CGPoint)centerForGuideRenderablePlacement
{
  v4.receiver = self;
  v4.super_class = (Class)CRLImageRep;
  [(CRLCanvasRep *)&v4 centerForRotation];
  result.CGFloat y = v3;
  result.CGFloat x = v2;
  return result;
}

- (void)dynamicMoveSmartShapeKnobDidBegin
{
  id v3 = [(CRLImageRep *)self dynamicResizeDidBegin];
  id v4 = [(CRLImageRep *)self maskLayout];
  [v4 dynamicMovePathKnobDidBegin];
}

- (void)dynamicallyMovedSmartShapeKnobTo:(CGPoint)a3 withTracker:(id)a4
{
  long long v10 = *(long long *)&a3.y;
  CGPoint v11 = a3;
  id v5 = a4;
  double v6 = [(CRLImageRep *)self imageLayout];
  double v7 = v6;
  if (v6) {
    [v6 layoutToMaskTransform:v10, v11];
  }
  else {
    memset(&v13, 0, sizeof(v13));
  }
  CGAffineTransformInvert(&v14, &v13);
  float64x2_t v12 = vaddq_f64(*(float64x2_t *)&v14.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v14.c, *(double *)&v10), *(float64x2_t *)&v14.a, v11.x));

  objc_super v8 = [(CRLImageRep *)self maskLayout];
  [v8 dynamicallyMovedSmartShapeKnobTo:v5 withTracker:*(_OWORD *)&v12];

  self->_frameInUnscaledCanvasIsValid = 0;
  CGFloat v9 = [v8 layoutController];
  [v9 validateLayoutWithDependencies:v8];

  [(CRLCanvasRep *)self invalidateKnobPositions];
  [(CRLStyledRep *)self setNeedsDisplay];
}

- (void)dynamicMoveSmartShapeKnobDidEndWithTracker:(id)a3
{
  id v14 = [(CRLImageRep *)self maskLayout];
  id v4 = [(CRLCanvasRep *)self interactiveCanvasController];
  id v5 = [v4 commandController];
  double v6 = [CRLCanvasCommandSelectionBehavior alloc];
  double v7 = [v4 canvasEditor];
  objc_super v8 = [(CRLCanvasCommandSelectionBehavior *)v6 initWithCanvasEditor:v7];

  CGFloat v9 = [_TtC8Freeform17CRLCommandSetMask alloc];
  long long v10 = [(CRLImageRep *)self imageInfo];
  CGPoint v11 = [v14 infoGeometry];
  float64x2_t v12 = [v14 pathSource];
  CGAffineTransform v13 = [(CRLCommandSetMask *)v9 initWithImageItem:v10 maskGeometry:v11 maskPath:v12];

  [v5 enqueueCommand:v13 withSelectionBehavior:v8];
  [(CRLCanvasRep *)self dynamicResizeDidEndWithTracker:0];
  [(CRLCanvasRep *)self invalidateKnobs];
}

- (BOOL)canEditMaskInMaskEditMode:(int64_t)a3
{
  return 1;
}

- (void)beginEditingMaskInMaskEditMode:(int64_t)a3
{
  [(CRLImageRep *)self p_enterMaskModeIfNecessaryWithHUD:1];
  id v5 = [(CRLImageRep *)self imageLayout];
  id v6 = [v5 maskEditMode];

  if (v6 != (id)a3)
  {
    double v7 = [(CRLImageRep *)self imageLayout];
    [v7 beginEditingMaskInMaskEditMode:a3];

    [(CRLImageRep *)self p_updateHUD];
    [(CRLCanvasRep *)self invalidateKnobs];
  }
}

- (void)p_listenForAssetChangesIfAppropriate
{
  downloadObserverIdentifier = self->_downloadObserverIdentifier;
  if (!downloadObserverIdentifier)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EF5B8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A0C20();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EF5D8);
    }
    id v4 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v4);
    }
    id v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageRep p_listenForAssetChangesIfAppropriate]");
    id v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRep.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 1759, 0, "invalid nil value for '%{public}s'", "_downloadObserverIdentifier");

    downloadObserverIdentifier = self->_downloadObserverIdentifier;
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10033C00C;
  v13[3] = &unk_1014EF6A8;
  v13[4] = self;
  v13[5] = downloadObserverIdentifier;
  double v7 = downloadObserverIdentifier;
  objc_super v8 = objc_retainBlock(v13);
  CGFloat v9 = [(CRLImageRep *)self imageInfo];
  long long v10 = [v9 imageAssetPayload];
  ((void (*)(void *, void *, void))v8[2])(v8, v10, 0);

  CGPoint v11 = [(CRLImageRep *)self imageInfo];
  float64x2_t v12 = [v11 thumbnailAssetPayload];
  ((void (*)(void *, void *, uint64_t))v8[2])(v8, v12, 1);
}

- (void)p_handleAssetPreparationCompletion
{
  if (![(CRLCanvasRep *)self hasBeenRemoved])
  {
    if (qword_101719BB0 != -1) {
      dispatch_once(&qword_101719BB0, &stru_1014EF6C8);
    }
    id v3 = off_10166B5E0;
    if (os_log_type_enabled((os_log_t)off_10166B5E0, OS_LOG_TYPE_DEFAULT))
    {
      downloadObserverIdentifier = self->_downloadObserverIdentifier;
      id v5 = v3;
      id v6 = [(NSUUID *)downloadObserverIdentifier UUIDString];
      int v9 = 138543362;
      long long v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Image Rep with observerUUID %{public}@ preparing for the downloaded asset", (uint8_t *)&v9, 0xCu);
    }
    double v7 = [(CRLCanvasRep *)self layout];
    [v7 processChangedProperty:18];
    [(CRLImageRepDrawingHelper *)self->_drawingHelper invalidateSizedImage];
    [(CRLStyledRep *)self setNeedsDisplay];
    objc_super v8 = [(CRLCanvasRep *)self interactiveCanvasController];
    [v8 invalidateContentLayersForRep:self];
  }
}

- (BOOL)directlyManagesLayerContent
{
  return self->_directlyManagesLayerContent;
}

- (void)p_updateDirectlyManagesLayerContentForRenderable:(id)a3
{
  BOOL directlyManagesLayerContent = self->_directlyManagesLayerContent;
  BOOL v5 = [(CRLImageRep *)self p_directlyManagesContentForRenderable:a3];
  self->_BOOL directlyManagesLayerContent = v5;
  if (!directlyManagesLayerContent || v5)
  {
    if (!directlyManagesLayerContent && v5)
    {
      double v7 = [(CRLCanvasRep *)self canvas];
      unsigned int v8 = [v7 isCanvasInteractive];

      if (v8)
      {
        int v9 = [(CRLCanvasRep *)self interactiveCanvasController];
        id v10 = [v9 renderableForRep:self];

        [v10 setContents:0];
      }
    }
  }
  else
  {
    [(CRLStyledRep *)self setNeedsDisplay];
  }
}

- (BOOL)p_directlyManagesContentForRenderable:(id)a3
{
  unsigned int v4 = [(CRLImageRepDrawingHelper *)self->_drawingHelper canRenderDirectlyManagedForRenderable:a3];
  BOOL v5 = [(CRLCanvasRep *)self interactiveCanvasController];
  if ([v5 createRepsForOffscreenLayouts])
  {
    BOOL v6 = 0;
    if (!v4)
    {
LABEL_3:
      unsigned __int8 v7 = 0;
      goto LABEL_26;
    }
  }
  else
  {
    [v5 visibleBoundsRectForTiling];
    [v5 convertBoundsToUnscaledRect:];
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    float64x2_t v16 = [(CRLCanvasRep *)self layout];
    float64x2_t v17 = [v16 geometryInRoot];
    [v17 frame];
    v29.origin.CGFloat x = v9;
    v29.origin.CGFloat y = v11;
    v29.size.CGFloat width = v13;
    v29.size.CGFloat height = v15;
    BOOL v6 = !CGRectIntersectsRect(v28, v29);

    if (!v4) {
      goto LABEL_3;
    }
  }
  float64x2_t v18 = [(CRLCanvasRep *)self layout];
  double v19 = [v18 stroke];

  if (([v19 shouldRender] & 1) == 0)
  {

    double v19 = 0;
  }
  double v20 = [(CRLImageRep *)self imageLayout];
  if ([v20 isInMaskEditMode]) {
    unsigned int v21 = 1;
  }
  else {
    unsigned int v21 = [(CRLCanvasRep *)self isBeingResized];
  }

  double v22 = [(CRLCanvasRep *)self layout];
  if ([v22 isStrokeBeingManipulated]) {
    unsigned int v23 = [v19 prefersToApplyToShapeRenderableDuringManipulation];
  }
  else {
    unsigned int v23 = 0;
  }

  if (v19) {
    unsigned int v24 = [v19 canApplyToShapeRenderable] ^ 1;
  }
  else {
    unsigned int v24 = 0;
  }
  if ((v21 | v23) != 1 || v24)
  {
    unsigned int v25 = [(CRLImageRepDrawingHelper *)self->_drawingHelper imagePrefersDrawing] || v6;
    unsigned __int8 v7 = v25 ^ 1;
    if (v19 && (v25 & 1) == 0)
    {
      if ([v19 prefersToApplyToShapeRenderableDuringManipulation]
        && ([(CRLStyledRep *)self opacity], v26 == 1.0))
      {
        unsigned __int8 v7 = [v19 canApplyToShapeRenderable];
      }
      else
      {
        unsigned __int8 v7 = 0;
      }
    }
  }
  else
  {
    unsigned __int8 v7 = 1;
  }

LABEL_26:
  return v7;
}

- (void)p_getAliasedValuesForMaskToBoundsDirectLayerFrame:(CGRect *)a3 transform:(CGAffineTransform *)a4
{
  unsigned __int8 v7 = [(CRLImageRep *)self imageLayout];
  double v8 = [v7 pureGeometry];
  CGFloat v9 = v8;
  if (v8) {
    [v8 fullTransform];
  }
  else {
    memset(v29, 0, sizeof(v29));
  }
  double v10 = +[CRLCanvasLayoutGeometry geometryFromFullTransform:v29];

  id v11 = [v10 mutableCopy];
  memset(&v28, 0, sizeof(v28));
  double v12 = [(CRLImageRep *)self imageLayout];
  CGFloat v13 = [v12 imageGeometry];
  double v14 = v13;
  if (v13) {
    [v13 transform];
  }
  else {
    memset(&t1, 0, sizeof(t1));
  }
  CGFloat v15 = [(CRLImageRep *)self imageLayout];
  float64x2_t v16 = [v15 pureGeometry];
  float64x2_t v17 = v16;
  if (v16) {
    [v16 transform];
  }
  else {
    memset(&v25, 0, sizeof(v25));
  }
  CGAffineTransformInvert(&t2, &v25);
  CGAffineTransformConcat(&v28, &t1, &t2);

  memset(&v24, 0, sizeof(v24));
  float64x2_t v18 = [(CRLImageRep *)self imageLayout];
  double v19 = [v18 maskLayout];
  double v20 = [v19 pureGeometry];
  unsigned int v21 = v20;
  if (v20) {
    [v20 transform];
  }
  else {
    memset(&v23, 0, sizeof(v23));
  }
  CGAffineTransform v22 = v28;
  CGAffineTransformConcat(&v24, &v23, &v22);

  CGAffineTransform v22 = v24;
  [v11 transformBy:&v22];
  [(CRLCanvasRep *)self computeDirectLayerFrame:a3 andTransform:a4 basedOnLayoutGeometry:v11];
}

- (void)updateRenderableGeometryFromLayout:(id)a3
{
  id v4 = a3;
  if ([(CRLImageRep *)self directlyManagesLayerContent])
  {
    BOOL v5 = [(CRLImageRep *)self imageLayout];
    BOOL v6 = [v5 imageGeometry];
    long long v22 = 0u;
    *(_OWORD *)CGAffineTransform v23 = 0u;
    memset(&v21, 0, sizeof(v21));
    if ([(CRLImageRep *)self p_shouldRenderWithMaskToBounds])
    {
      [(CRLImageRep *)self p_getAliasedValuesForMaskToBoundsDirectLayerFrame:&v22 transform:&v21];
      if ([(CRLImageRep *)self p_shouldRenderWithMaskMatchingImage])
      {
        directlyManagedLayerContentsRecipe = self->_directlyManagedLayerContentsRecipe;
        if (!directlyManagedLayerContentsRecipe)
        {
          +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014EF6E8);
          }
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
            sub_1010A0CB4();
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014EF708);
          }
          double v8 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
            sub_10106590C(v8);
          }
          CGFloat v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageRep updateRenderableGeometryFromLayout:]");
          double v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRep.m"];
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 1901, 0, "invalid nil value for '%{public}s'", "_directlyManagedLayerContentsRecipe");

          directlyManagedLayerContentsRecipe = self->_directlyManagedLayerContentsRecipe;
        }
        id v11 = [(CRLImageRepLayerContentsRecipe *)directlyManagedLayerContentsRecipe orientation];
        memset(&v20, 0, sizeof(v20));
        sub_10043A6BC(v11, 0, (uint64_t)&v20, *(CGFloat *)&v22, *((CGFloat *)&v22 + 1), v23[0], v23[1]);
        CGAffineTransform t1 = v20;
        CGAffineTransform t2 = v21;
        CGAffineTransformConcat(&v19, &t1, &t2);
        CGAffineTransform v21 = v19;
      }
      CGAffineTransform v20 = v21;
      [(CRLCanvasRep *)self antiAliasDefeatLayerFrame:&v22 forTransform:&v20];
    }
    else
    {
      [(CRLCanvasRep *)self computeDirectLayerFrame:&v22 andTransform:&v21 basedOnLayoutGeometry:v6];
      double v12 = self->_directlyManagedLayerContentsRecipe;
      if (!v12)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014EF728);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_1010A0D48();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014EF748);
        }
        CGFloat v13 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10106590C(v13);
        }
        double v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageRep updateRenderableGeometryFromLayout:]");
        CGFloat v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRep.m"];
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 1913, 0, "invalid nil value for '%{public}s'", "_directlyManagedLayerContentsRecipe");

        double v12 = self->_directlyManagedLayerContentsRecipe;
      }
      float64x2_t v16 = [(CRLImageRepLayerContentsRecipe *)v12 orientation];
      memset(&v20, 0, sizeof(v20));
      sub_10043A6BC(v16, 0, (uint64_t)&v20, *(CGFloat *)&v22, *((CGFloat *)&v22 + 1), v23[0], v23[1]);
      CGAffineTransform t1 = v20;
      CGAffineTransform t2 = v21;
      CGAffineTransformConcat(&v19, &t1, &t2);
      CGAffineTransform v21 = v19;
      -[CRLCanvasRep antiAliasDefeatLayerTransform:forFrame:](self, "antiAliasDefeatLayerTransform:forFrame:", &v21, v22, *(_OWORD *)v23);
    }
    CGAffineTransform v20 = v21;
    [v4 setIfDifferentFrame:&v20 orTransform:v22 *(_OWORD *)v23];
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)CRLImageRep;
    [(CRLCanvasRep *)&v24 updateRenderableGeometryFromLayout:v4];
  }
  [(CRLImageRep *)self p_invalidateHitTestCache];
}

- (void)willUpdateRenderable:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)CRLImageRep;
  [(CRLCanvasRep *)&v24 willUpdateRenderable:v4];
  [(CRLImageRep *)self p_updateDirectlyManagesLayerContentForRenderable:v4];
  if (self->_sizedImageNeedsDisplay)
  {
    self->_sizedImageNeedsDisplaCGFloat y = 0;
    if ([(CRLImageRep *)self directlyManagesLayerContent])
    {
      BOOL v5 = [(CRLCanvasRep *)self shadowRenderable];

      if (v5)
      {
        if (!+[NSThread isMainThread])
        {
          +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014EF768);
          }
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
            sub_1010A0E70();
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014EF788);
          }
          BOOL v6 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
            sub_10106590C(v6);
          }
          unsigned __int8 v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageRep willUpdateRenderable:]");
          double v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRep.m"];
          +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:1943 isFatal:0 description:"Can't draw sized image on the main thread while we are doing threaded layout and rendering if image has a shadow!"];
        }
        [(CRLCanvasRep *)self invalidateShadowRenderable];
      }
    }
    else
    {
      [(CRLStyledRep *)self setNeedsDisplay];
    }
  }
  [(CRLImageRep *)self p_generateSizedImageIfNecessary];
  if (![(CRLImageRep *)self directlyManagesLayerContent])
  {
    [(CRLImageRep *)self p_disposeStrokeLayer];
    goto LABEL_42;
  }
  if (self->_directlyManagedLayerContentsRecipe)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EF7A8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A0DDC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EF7C8);
    }
    CGFloat v9 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v9);
    }
    double v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageRep willUpdateRenderable:]");
    id v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRep.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 1960, 0, "expected nil value for '%{public}s'", "_directlyManagedLayerContentsRecipe");
  }
  double v12 = [(CRLImageRepDrawingHelper *)self->_drawingHelper contentsRecipeForDirectlyManagedRenderable:v4];
  directlyManagedLayerContentsRecipe = self->_directlyManagedLayerContentsRecipe;
  self->_directlyManagedLayerContentsRecipe = v12;

  double v14 = [(CRLImageRep *)self imageLayout];
  uint64_t v15 = [v14 maskLayout];
  if (v15)
  {
    float64x2_t v16 = (void *)v15;
    float64x2_t v17 = [(CRLImageRep *)self imageLayout];
    if (([v17 isInMaskEditMode] & 1) != 0
      || ![(CRLImageRep *)self p_shouldRenderWithMaskToBounds])
    {
      unsigned __int8 v18 = [(CRLImageRepLayerContentsRecipe *)self->_directlyManagedLayerContentsRecipe hasBakedMask];

      if ((v18 & 1) == 0)
      {
        [(CRLImageRep *)self p_createMaskRenderableForRenderable:v4];
        char v19 = 1;
        goto LABEL_35;
      }
    }
    else
    {
    }
  }
  char v19 = 0;
LABEL_35:
  CGAffineTransform v20 = [(CRLCanvasRep *)self layout];
  CGAffineTransform v21 = [v20 stroke];

  if (!v21 || ![v21 shouldRender])
  {

    [(CRLImageRep *)self p_disposeStrokeLayer];
    if (v19) {
      goto LABEL_43;
    }
LABEL_42:
    [(CRLImageRep *)self p_disposeMaskRenderable];
    goto LABEL_43;
  }
  if (!self->_strokeRenderable)
  {
    long long v22 = +[CRLCanvasShapeRenderable renderable];
    strokeRenderable = self->_strokeRenderable;
    self->_strokeRenderable = v22;

    [(CRLCanvasRenderable *)self->_strokeRenderable setDelegate:self];
    [(CRLCanvasShapeRenderable *)self->_strokeRenderable setFillColor:0];
  }

  if ((v19 & 1) == 0) {
    goto LABEL_42;
  }
LABEL_43:
}

- (void)didUpdateRenderable:(id)a3
{
  id v4 = a3;
  v109.receiver = self;
  v109.super_class = (Class)CRLImageRep;
  [(CRLCanvasRep *)&v109 didUpdateRenderable:v4];
  [v4 crl_ignoreAccessibilityInvertColorsIfNeeded];
  BOOL v5 = [(CRLImageRep *)self maskLayout];
  if (![(CRLImageRep *)self p_shouldRenderWithMaskToBounds])
  {
    contentsRenderable = self->_contentsRenderable;
    if (contentsRenderable)
    {
      [(CRLCanvasRenderable *)contentsRenderable removeFromSuperlayer];
      unsigned __int8 v7 = self->_contentsRenderable;
      self->_contentsRenderable = 0;

      [v4 setMasksToBounds:0];
      [v4 setCornerRadius:0.0];
      [v4 setCornerCurve:kCACornerCurveCircular];
    }
  }
  double y = CGPointZero.y;
  if ([(CRLImageRep *)self directlyManagesLayerContent])
  {
    +[CATransaction begin];
    +[CATransaction setDisableActions:1];
    directlyManagedLayerContentsRecipe = self->_directlyManagedLayerContentsRecipe;
    if (!directlyManagedLayerContentsRecipe)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014EF7E8);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010A0EF8();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014EF808);
      }
      double v10 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v10);
      }
      id v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageRep didUpdateRenderable:]");
      double v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRep.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 2025, 0, "invalid nil value for '%{public}s'", "_directlyManagedLayerContentsRecipe");

      directlyManagedLayerContentsRecipe = self->_directlyManagedLayerContentsRecipe;
    }
    CGFloat v13 = [(CRLImageRepLayerContentsRecipe *)directlyManagedLayerContentsRecipe image];
    if ([(CRLImageRepDrawingHelper *)self->_drawingHelper isGeneratingSizedImageWithBakedMask]&& !+[NSThread isMainThread])
    {

      CGFloat v13 = 0;
    }
    double v14 = [v4 contents];

    if (v14 != v13) {
      [v4 setContents:v13];
    }
    uint64_t v15 = [(CRLImageRep *)self imageLayout];
    float64x2_t v16 = [v15 imageGeometryInRoot];
    float64x2_t v17 = v16;
    if (v16) {
      [v16 transform];
    }
    else {
      memset(v108, 0, sizeof(v108));
    }
    BOOL v18 = sub_10007F964((double *)v108);

    unsigned int v19 = [v4 edgeAntialiasingMask];
    if (v18)
    {
      if (!v19) {
        goto LABEL_31;
      }
      uint64_t v20 = 0;
    }
    else
    {
      if (v19 == 15) {
        goto LABEL_31;
      }
      uint64_t v20 = 15;
    }
    [v4 setEdgeAntialiasingMask:v20];
LABEL_31:
    CGAffineTransform v21 = +[NSUserDefaults standardUserDefaults];
    unsigned int v22 = [v21 BOOLForKey:@"TSDSuppressImageInterpolation"];

    if (v22) {
      CFStringRef v23 = @"nearest";
    }
    else {
      CFStringRef v23 = @"linear";
    }
    [v4 setMagnificationFilter:v23];
    objc_super v24 = [(CRLCanvasRep *)self layout];
    CGAffineTransform v25 = [v24 stroke];

    if (v25 && [v25 shouldRender]) {
      [(CRLImageRep *)self p_updateStrokeLayerForStroke:v25 repRenderable:v4];
    }
    if (!v5) {
      goto LABEL_55;
    }
    if ([(CRLImageRep *)self p_shouldRenderWithMaskMatchingImage])
    {
      [(CRLCanvasRenderable *)self->_contentsRenderable removeFromSuperlayer];
      double v26 = self->_contentsRenderable;
      self->_contentsRenderable = 0;

      float64x2_t v27 = [(CRLImageRep *)self imageInfo];
      [v4 setMasksToBounds:[v27 hasRoundedCorners]];

      [(CRLImageRep *)self p_updateCornerRadiusOnRenderable:v4];
LABEL_55:
      [(CRLMediaRep *)self updateSpatialLabel];
      id v64 = [(CRLImageRep *)self maskRenderable];

      if (v64)
      {
        +[CATransaction begin];
        +[CATransaction setDisableActions:1];
        [v4 bounds];
        double v66 = v65;
        double v68 = v67;
        double v70 = v69;
        double v72 = v71;
        CGAffineTransform v73 = [(CRLImageRep *)self maskRenderable];
        [v73 frame];
        v114.origin.CGFloat x = v74;
        v114.origin.double y = v75;
        v114.size.CGFloat width = v76;
        v114.size.CGFloat height = v77;
        v111.origin.CGFloat x = v66;
        v111.origin.double y = v68;
        v111.size.CGFloat width = v70;
        v111.size.CGFloat height = v72;
        BOOL v78 = CGRectEqualToRect(v111, v114);

        if (!v78)
        {
          v79 = [(CRLImageRep *)self maskRenderable];
          [v79 setFrame:v66, v68, v70, v72];
        }
        maskSubrenderable = self->_maskSubrenderable;
        if (maskSubrenderable)
        {
          [(CRLCanvasRenderable *)maskSubrenderable frame];
          v115.origin.CGFloat x = v81;
          v115.origin.double y = v82;
          v115.size.CGFloat width = v83;
          v115.size.CGFloat height = v84;
          v112.origin.CGFloat x = v66;
          v112.origin.double y = v68;
          v112.size.CGFloat width = v70;
          v112.size.CGFloat height = v72;
          if (!CGRectEqualToRect(v112, v115)) {
            -[CRLCanvasRenderable setFrame:](self->_maskSubrenderable, "setFrame:", v66, v68, v70, v72);
          }
        }
        +[CATransaction commit];
      }
      +[CATransaction commit];
      v85 = self->_directlyManagedLayerContentsRecipe;
      self->_directlyManagedLayerContentsRecipe = 0;

      goto LABEL_63;
    }
    if ([(CRLImageRep *)self p_shouldRenderWithMaskToBounds])
    {
      if (!self->_contentsRenderable)
      {
        CGAffineTransform v28 = +[CRLCanvasRenderable renderable];
        CGRect v29 = self->_contentsRenderable;
        self->_contentsRenderable = v28;
      }
      CGRect v30 = [v4 subrenderables];
      unsigned __int8 v31 = [v30 containsObject:self->_contentsRenderable];

      if ((v31 & 1) == 0) {
        [v4 addSubrenderable:self->_contentsRenderable];
      }
      [v4 setMasksToBounds:1];
      [(CRLCanvasRenderable *)self->_contentsRenderable setContents:v13];
      [v4 setContents:0];
      [(CRLImageRep *)self p_updateCornerRadiusOnRenderable:v4];
      double v32 = [(CRLCanvasRep *)self canvas];
      [v32 viewScale];
      double v90 = v33;

      unsigned int v34 = [(CRLImageRep *)self imageLayout];
      __int16 v35 = [v34 imageGeometry];
      [v35 size];
      double v37 = v36;
      double v39 = v38;

      sub_1000646A4(v37, v39, v90);
      double v40 = sub_100064070();
      CGFloat v42 = v41;
      CGFloat v44 = v43;
      CGFloat v46 = v45;
      CGAffineTransform v47 = [(CRLImageRepLayerContentsRecipe *)self->_directlyManagedLayerContentsRecipe orientation];
      memset(&v107, 0, sizeof(v107));
      sub_10043A6BC(v47, 0, (uint64_t)&v107, v40, v42, v44, v46);
      CGAffineTransform v106 = v107;
      v110.origin.CGFloat x = v40;
      v110.origin.double y = v42;
      v110.size.CGFloat width = v44;
      v110.size.CGFloat height = v46;
      CGRectApplyAffineTransform(v110, &v106);
      double v48 = sub_100064070();
      double v50 = v49;
      double v52 = v51;
      double v54 = v53;
      memset(&v106, 0, sizeof(v106));
      CGRect v55 = [(CRLImageRep *)self imageLayout];
      CGAffineTransform v56 = [v55 maskLayout];
      CGAffineTransform v57 = [v56 pureGeometry];
      char v58 = v57;
      if (v57) {
        [v57 transform];
      }
      else {
        memset(&v105, 0, sizeof(v105));
      }
      CGAffineTransformInvert(&v106, &v105);

      memset(&v104, 0, sizeof(v104));
      CGAffineTransformMakeTranslation(&v104, v37 * -0.5, v39 * -0.5);
      memset(&v103, 0, sizeof(v103));
      CGAffineTransform t1 = v104;
      CGAffineTransform t2 = v107;
      CGAffineTransformConcat(&v102, &t1, &t2);
      CGAffineTransform t1 = v104;
      CGAffineTransformInvert(&v99, &t1);
      CGAffineTransformConcat(&v103, &v102, &v99);
      CGAffineTransform t2 = v103;
      CGAffineTransform v98 = v106;
      CGAffineTransformConcat(&t1, &t2, &v98);
      *(_OWORD *)&v106.a = *(_OWORD *)&t1.a;
      *(_OWORD *)&v106.c = *(_OWORD *)&t1.c;
      *(float64x2_t *)&v106.tCGFloat x = vmulq_n_f64(*(float64x2_t *)&t1.tx, v90);
      *(_OWORD *)&t2.a = *(_OWORD *)&t1.a;
      *(_OWORD *)&t2.c = *(_OWORD *)&t1.c;
      *(_OWORD *)&t2.tCGFloat x = *(_OWORD *)&v106.tx;
      sub_10007FCC0(&t2, &t1, v52 * 0.5, v54 * 0.5);
      CGAffineTransform v106 = t1;
      -[CRLCanvasRenderable setBounds:](self->_contentsRenderable, "setBounds:", v48, v50, v52, v54);
      memset(v97, 0, sizeof(v97));
      memset(&t1, 0, sizeof(t1));
      [(CRLImageRep *)self p_getAliasedValuesForMaskToBoundsDirectLayerFrame:v97 transform:&t1];
      memset(&t2, 0, sizeof(t2));
      CGAffineTransformMakeTranslation(&v96, *(CGFloat *)v97, *((CGFloat *)v97 + 1));
      CGAffineTransform v98 = t1;
      CGAffineTransformConcat(&t2, &v98, &v96);
      memset(&v98, 0, sizeof(v98));
      CGAffineTransform v95 = v106;
      CGAffineTransform v94 = t2;
      CGAffineTransformConcat(&v98, &v95, &v94);
      -[CRLCanvasRep antiAliasDefeatLayerTransform:forFrame:](self, "antiAliasDefeatLayerTransform:forFrame:", &v98, v48, v50, v52, v54);
      CGAffineTransform v95 = t1;
      [(CRLCanvasRep *)self antiAliasDefeatLayerFrame:v97 forTransform:&v95];
      memset(&v95, 0, sizeof(v95));
      CGAffineTransformMakeTranslation(&v93, *(CGFloat *)v97, *((CGFloat *)v97 + 1));
      CGAffineTransform v94 = t1;
      CGAffineTransformConcat(&v95, &v94, &v93);
      CGAffineTransform v94 = v95;
      CGAffineTransformInvert(&v92, &v94);
      CGAffineTransform v91 = v98;
      CGAffineTransformConcat(&v94, &v91, &v92);
      CGAffineTransform v106 = v94;
      -[CRLCanvasRenderable setIfDifferentFrame:orTransform:](self->_contentsRenderable, "setIfDifferentFrame:orTransform:", &v94, v48, v50, v52, v54);
      id WeakRetained = objc_loadWeakRetained((id *)&self->_frameMaskLayer);
      unsigned int v63 = [WeakRetained mask];

      if (!v63) {
        goto LABEL_55;
      }
      CGRect v61 = objc_loadWeakRetained((id *)&self->_frameMaskLayer);
      [v61 setMask:0];
    }
    else
    {
      objc_super v59 = [(CRLImageRep *)self imageLayout];
      unsigned int v60 = [v59 isInMaskEditMode];

      if (v60)
      {
        [(CRLImageRep *)self p_updateMaskSublayersForMaskEditMode];
        [(CRLImageRep *)self p_updateMaskRenderable:self->_maskSubrenderable forRepRenderable:v4 shouldIncludeMask:1 shouldIncludeInstantAlpha:0 siblingLayer:0];
        [(CRLImageRep *)self p_updateMaskRenderable:self->_maskPathRenderable forRepRenderable:v4 shouldIncludeMask:1 shouldIncludeInstantAlpha:0 siblingLayer:1];
        goto LABEL_55;
      }
      if ([(CRLImageRepLayerContentsRecipe *)self->_directlyManagedLayerContentsRecipe hasBakedMask]) {
        goto LABEL_55;
      }
      CGRect v61 = [(CRLImageRep *)self maskRenderable];
      [(CRLImageRep *)self p_updateMaskRenderable:v61 forRepRenderable:v4 shouldIncludeMask:1 shouldIncludeInstantAlpha:1 siblingLayer:0];
    }

    goto LABEL_55;
  }
  if ([v4 edgeAntialiasingMask] != 15) {
    [v4 setEdgeAntialiasingMask:15];
  }
LABEL_63:
  [v4 contentsRect];
  v116.size.CGFloat width = 1.0;
  v116.size.CGFloat height = 1.0;
  v116.origin.CGFloat x = CGPointZero.x;
  v116.origin.double y = y;
  if (!CGRectEqualToRect(v113, v116)) {
    [v4 setContentsRect:CGPointZero.x, y, 1.0, 1.0];
  }
  [(CRLStyledRep *)self opacity];
  double v87 = v86;
  if ([(CRLImageRep *)self shouldShowLoadingUI]
    && ![(CRLImageRep *)self directlyManagesLayerContent])
  {
    double v87 = 1.0;
  }
  [v4 opacity];
  double v89 = v88;
  if (v87 != v89)
  {
    *(float *)&double v89 = v87;
    [v4 setOpacity:v89];
  }
}

- (BOOL)shouldDisplayAsSpatial
{
  id v3 = [(CRLImageRep *)self imageInfo];
  if ([v3 shouldDisplayAsSpatial])
  {
    id v4 = [(CRLImageRep *)self imageLayout];
    unsigned int v5 = [v4 isInMaskEditMode] ^ 1;
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (void)p_updateCornerRadiusOnRenderable:(id)a3
{
  id v15 = a3;
  uint64_t v4 = objc_opt_class();
  unsigned int v5 = [(CRLImageRep *)self imageLayout];
  BOOL v6 = [v5 maskLayout];
  unsigned __int8 v7 = [v6 pathSource];
  double v8 = sub_1002469D0(v4, v7);

  if (v8 && ![v8 type])
  {
    [v8 cornerRadius];
    double v11 = v10;
    double v12 = [(CRLCanvasRep *)self canvas];
    [v12 viewScale];
    [v15 setCornerRadius:v11 * v13];

    unsigned int v14 = [v8 isCurveContinuous];
    CGFloat v9 = &kCACornerCurveContinuous;
    if (!v14) {
      CGFloat v9 = &kCACornerCurveCircular;
    }
  }
  else
  {
    [v15 setCornerRadius:0.0];
    CGFloat v9 = &kCACornerCurveCircular;
  }
  [v15 setCornerCurve:*v9];
}

- (void)p_updateMaskRenderable:(id)a3 forRepRenderable:(id)a4 shouldIncludeMask:(BOOL)a5 shouldIncludeInstantAlpha:(BOOL)a6 siblingLayer:(BOOL)a7
{
  BOOL v8 = a5;
  id v11 = a3;
  id v12 = a4;
  double v13 = [(CRLImageRep *)self imageLayout];
  unsigned int v14 = [v13 maskLayout];

  if (![(CRLImageRep *)self directlyManagesLayerContent])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EF828);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A10A8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EF848);
    }
    id v15 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v15);
    }
    float64x2_t v16 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageRep p_updateMaskRenderable:forRepRenderable:shouldIncludeMask:shouldIncludeInstantAlpha:siblingLayer:]");
    float64x2_t v17 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRep.m"];
    +[CRLAssertionHandler handleFailureInFunction:v16 file:v17 lineNumber:2234 isFatal:0 description:"Updating mask layer for a non-directly managed layer!"];
  }
  if (v11 && ![(CRLImageRep *)self p_shouldRenderWithMaskToBounds])
  {
    BOOL v18 = [(CRLCanvasRep *)self canvas];
    [v18 viewScale];
    CGFloat v20 = v19;

    Copdouble y = 0;
    long long v22 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v57.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v57.c = v22;
    *(_OWORD *)&v57.tCGFloat x = *(_OWORD *)&CGAffineTransformIdentity.tx;
    if (v14 && v8)
    {
      [v14 pathBounds];
      CGAffineTransformMakeTranslation(&v57, -v23, -v24);
      [v14 transform];
      CGAffineTransform t1 = v57;
      CGAffineTransformConcat(&v56, &t1, &t2);
      CGAffineTransform v57 = v56;
      CGAffineTransformMakeScale(&v53, v20, v20);
      CGAffineTransform t1 = v57;
      CGAffineTransformConcat(&v56, &t1, &v53);
      CGAffineTransform v57 = v56;
      Copdouble y = CGPathCreateCopy((CGPathRef)[v14 path]);
    }
    directlyManagedLayerContentsRecipe = self->_directlyManagedLayerContentsRecipe;
    if (!directlyManagedLayerContentsRecipe)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014EF868);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010A1014();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014EF888);
      }
      double v26 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v26);
      }
      float64x2_t v27 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageRep p_updateMaskRenderable:forRepRenderable:shouldIncludeMask:shouldIncludeInstantAlpha:siblingLayer:]");
      CGAffineTransform v28 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRep.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v27, v28, 2250, 0, "invalid nil value for '%{public}s'", "_directlyManagedLayerContentsRecipe");

      directlyManagedLayerContentsRecipe = self->_directlyManagedLayerContentsRecipe;
    }
    CGRect v29 = [(CRLImageRepLayerContentsRecipe *)directlyManagedLayerContentsRecipe orientation];
    if (v29 && !a7)
    {
      CGRect v30 = v29;
      [v12 bounds];
      double v31 = sub_100064070();
      CGFloat v33 = v32;
      CGFloat v35 = v34;
      CGFloat v37 = v36;
      memset(&v56, 0, sizeof(v56));
      sub_10043A6BC(v30, 0, (uint64_t)&v56, v31, v32, v34, v36);
      double v38 = sub_100065738(v31, v33, v35, v37);
      CGFloat v40 = v39;
      memset(&t1, 0, sizeof(t1));
      CGAffineTransformMakeTranslation(&v52, -v38, -v39);
      CGAffineTransformMakeTranslation(&v50, v38, v40);
      CGAffineTransform v49 = v56;
      CGAffineTransformConcat(&v51, &v49, &v50);
      CGAffineTransformConcat(&t1, &v52, &v51);
      CGAffineTransform v49 = t1;
      CGAffineTransformInvert(&v48, &v49);
      CGAffineTransform v47 = v57;
      CGAffineTransformConcat(&v49, &v47, &v48);
      CGAffineTransform v57 = v49;
    }
    if (!Copy)
    {
      double v41 = [(CRLImageRep *)self imageLayout];
      unsigned int v42 = [v41 maskIntersectsImage];

      if (v42)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014EF8A8);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_1010A0F8C();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014EF8C8);
        }
        double v43 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10106590C(v43);
        }
        CGFloat v44 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageRep p_updateMaskRenderable:forRepRenderable:shouldIncludeMask:shouldIncludeInstantAlpha:siblingLayer:]");
        double v45 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRep.m"];
        +[CRLAssertionHandler handleFailureInFunction:v44 file:v45 lineNumber:2264 isFatal:0 description:"maskPath is nil when it should not be"];
      }
    }
    CGAffineTransform v56 = v57;
    CGFloat v46 = sub_1000D5540(Copy, &v56);
    [v11 setPath:v46];
    CGPathRelease(v46);
    CGPathRelease(Copy);
  }
}

- (void)p_updateStrokeLayerForStroke:(id)a3 repRenderable:(id)a4
{
  id v5 = a3;
  +[CATransaction begin];
  +[CATransaction setDisableActions:1];
  BOOL v6 = [(CRLImageRep *)self imageLayout];
  unsigned __int8 v7 = [(CRLImageRep *)self maskLayout];
  BOOL v8 = [(CRLCanvasRep *)self canvas];
  [v8 viewScale];
  double v10 = v9;

  long long v44 = 0u;
  memset(&v45, 0, sizeof(v45));
  long long v43 = 0u;
  id v11 = [(CRLImageRep *)self imageLayout];
  id v12 = [v11 imageGeometry];
  [(CRLCanvasRep *)self computeDirectLayerFrame:&v43 andTransform:&v45 basedOnLayoutGeometry:v12];

  long long v13 = v44;
  double v14 = sub_100064070();
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v21 = sub_100065738(*(CGFloat *)&v43, *((CGFloat *)&v43 + 1), *(CGFloat *)&v13, *((CGFloat *)&v13 + 1));
  double v23 = v22;
  [(CRLCanvasRenderable *)self->_strokeRenderable position];
  if (v25 != v21 || v24 != v23) {
    -[CRLCanvasRenderable setPosition:](self->_strokeRenderable, "setPosition:", v21, v23);
  }
  [(CRLStyledRep *)self opacity];
  double v28 = v27;
  [(CRLCanvasRenderable *)self->_strokeRenderable opacity];
  double v30 = v29;
  if (v28 != v30)
  {
    *(float *)&double v30 = v28;
    [(CRLCanvasRenderable *)self->_strokeRenderable setOpacity:v30];
  }
  -[CRLCanvasRenderable setBounds:](self->_strokeRenderable, "setBounds:", v14, v16, v18, v20);
  [v5 applyToShapeRenderable:self->_strokeRenderable withScale:v10];

  double v31 = (CGPath *)[v6 pathToStroke];
  Mutable = v31;
  if (!v7)
  {
    if (!v31)
    {
      Mutable = CGPathCreateMutable();
      v46.origin.CGFloat x = v14;
      v46.origin.double y = v16;
      v46.size.CGFloat width = v18;
      v46.size.CGFloat height = v20;
      CGPathAddRect(Mutable, 0, v46);
      goto LABEL_14;
    }
    memset(&v42, 0, sizeof(v42));
    CGAffineTransformMakeScale(&v42, v10, v10);
    CGFloat v33 = (const CGPath *)[v6 pathToStroke];
    CGAffineTransform v39 = v42;
LABEL_13:
    Mutable = sub_1000D5540(v33, &v39);
LABEL_14:
    strokeRenderable = self->_strokeRenderable;
    uint64_t v35 = 0;
    goto LABEL_16;
  }
  if (v31)
  {
    memset(&v42, 0, sizeof(v42));
    [v7 transform];
    CGAffineTransformMakeScale(&t2, v10, v10);
    CGAffineTransformConcat(&v42, &t1, &t2);
    CGAffineTransform v39 = v42;
    CGFloat v33 = Mutable;
    goto LABEL_13;
  }
  strokeRenderable = self->_strokeRenderable;
  uint64_t v35 = 1;
LABEL_16:
  [(CRLCanvasRenderable *)strokeRenderable setHidden:v35];
  [(CRLCanvasShapeRenderable *)self->_strokeRenderable setPath:Mutable];
  CGPathRelease(Mutable);
  CGFloat v36 = self->_strokeRenderable;
  if (v36) {
    [(CRLCanvasRenderable *)v36 affineTransform];
  }
  else {
    memset(&v38, 0, sizeof(v38));
  }
  CGAffineTransform v42 = v45;
  if (!CGAffineTransformEqualToTransform(&v38, &v42))
  {
    CGAffineTransform v37 = v45;
    [(CRLCanvasRenderable *)self->_strokeRenderable setAffineTransform:&v37];
  }
  +[CATransaction commit];
}

- (id)additionalRenderablesOverRenderable
{
  v25.receiver = self;
  v25.super_class = (Class)CRLImageRep;
  id v3 = [(CRLMediaRep *)&v25 additionalRenderablesOverRenderable];
  uint64_t v4 = +[NSMutableArray arrayWithArray:v3];

  if (self->_strokeRenderable) {
    [v4 addObject:];
  }
  id v5 = [(CRLImageRep *)self imageLayout];
  if ([v5 isInMaskEditMode])
  {
    maskPathRenderable = self->_maskPathRenderable;

    if (!maskPathRenderable) {
      [(CRLImageRep *)self p_updateMaskSublayersForMaskEditMode];
    }
  }
  else
  {
  }
  if (self->_maskPathRenderable)
  {
    +[CATransaction begin];
    +[CATransaction setDisableActions:1];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v22 = 0u;
    unsigned __int8 v7 = [(CRLImageRep *)self imageLayout];
    BOOL v8 = [v7 imageGeometryInRoot];
    double v9 = v8;
    if (v8)
    {
      [v8 transform];
    }
    else
    {
      long long v23 = 0u;
      long long v24 = 0u;
      long long v22 = 0u;
    }

    double v10 = [(CRLCanvasRep *)self canvas];
    [v10 viewScale];
    *(double *)&long long v24 = v11 * *(double *)&v24;

    id v12 = [(CRLCanvasRep *)self canvas];
    [v12 viewScale];
    *((double *)&v24 + 1) = v13 * *((double *)&v24 + 1);

    double v14 = [(CRLCanvasRep *)self parentRep];

    if (v14)
    {
      double v15 = [(CRLCanvasRep *)self parentRep];
      [v15 layerFrameInScaledCanvas];
      double v17 = v16;
      double v19 = v18;

      *(double *)&long long v24 = *(double *)&v24 - v17;
      *((double *)&v24 + 1) = *((double *)&v24 + 1) - v19;
    }
    v21[0] = v22;
    v21[1] = v23;
    v21[2] = v24;
    [(CRLCanvasRenderable *)self->_maskPathRenderable setAffineTransform:v21];
    +[CATransaction commit];
    [v4 addObject:self->_maskPathRenderable];
  }

  return v4;
}

- (void)p_setDefaultMaskWithActionString:(id)a3
{
  id v4 = a3;
  id v14 = [(CRLCanvasRep *)self commandController];
  id v5 = [CRLCanvasCommandSelectionBehavior alloc];
  BOOL v6 = [(CRLCanvasRep *)self interactiveCanvasController];
  unsigned __int8 v7 = [v6 canvasEditor];
  BOOL v8 = [(CRLCanvasCommandSelectionBehavior *)v5 initWithCanvasEditor:v7];

  [v14 openGroupWithSelectionBehavior:v8];
  [v14 setCurrentGroupActionString:v4];

  double v9 = [(CRLImageRep *)self imageInfo];
  double v10 = [v9 defaultMaskInfo];
  double v11 = [[_TtC8Freeform17CRLCommandSetMask alloc] initWithImageItem:v9 maskInfo:v10];
  id v12 = [(CRLCanvasRep *)self interactiveCanvasController];
  double v13 = [v12 commandController];

  [v13 enqueueCommand:v11];
  [v14 closeGroup];
}

- (void)p_endEditingMask
{
  id v3 = [(CRLImageRep *)self imageLayout];
  [v3 endMaskEditMode];

  id v4 = [(CRLImageRep *)self imageInfo];
  id v5 = [v4 maskInfo];

  if (!v5)
  {
    BOOL v6 = [(CRLImageRep *)self imageLayout];
    [v6 maskWasReset];
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  BOOL v8 = sub_10033F540;
  double v9 = &unk_1014CBBB0;
  double v10 = self;
  if (+[NSThread isMainThread]) {
    v8((uint64_t)block);
  }
  else {
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  [(CRLImageRep *)self p_cleanUpMaskModeUI];
}

- (void)p_setUpMaskModeUI
{
  id v3 = +[UIMenuController sharedMenuController];
  [v3 hideMenu];

  id v4 = +[NSNotificationCenter defaultCenter];
  id v5 = [(CRLCanvasRep *)self interactiveCanvasController];
  BOOL v6 = [v5 editorController];
  [v4 addObserver:self selector:"p_selectionPathDidChange:" name:@"CRLEditorControllerSelectionPathDidChangeNotification" object:v6];

  unsigned __int8 v7 = [(CRLCanvasRep *)self interactiveCanvasController];
  [v7 canvasInvalidatedForRep:self];

  [(CRLCanvasRep *)self invalidateKnobs];
  [(CRLImageRep *)self p_updateHUD];

  [(CRLImageRep *)self p_invalidateHitTestCache];
}

- (void)p_cleanUpMaskModeUI
{
  +[CATransaction begin];
  [(CRLCanvasRenderable *)self->_maskSubrenderable removeFromSuperlayer];
  maskSubrenderable = self->_maskSubrenderable;
  self->_maskSubrenderable = 0;

  maskPathRenderable = self->_maskPathRenderable;
  self->_maskPathRenderable = 0;

  +[CATransaction commit];
  id v5 = +[NSNotificationCenter defaultCenter];
  BOOL v6 = [(CRLCanvasRep *)self interactiveCanvasController];
  unsigned __int8 v7 = [v6 editorController];
  [v5 removeObserver:self name:@"CRLEditorControllerSelectionPathDidChangeNotification" object:v7];

  if ([(CRLImageRep *)self p_shouldBakeMaskIntoSizedImage]) {
    [(CRLImageRepDrawingHelper *)self->_drawingHelper invalidateSizedImage];
  }
  BOOL v8 = [(CRLCanvasRep *)self interactiveCanvasController];
  [v8 canvasInvalidatedForRep:self];

  [(CRLCanvasRep *)self invalidateKnobs];

  [(CRLImageRep *)self p_invalidateHitTestCache];
}

- (void)p_updateHUD
{
  id v5 = [(CRLCanvasRep *)self interactiveCanvasController];
  id v3 = [v5 layerHost];
  id v4 = [v3 imageHUDController];
  [v4 updateControlsForRep:self];
}

- (void)p_disposeStrokeLayer
{
  if (self->_strokeRenderable)
  {
    double v2 = self;
    +[CATransaction begin];
    [(CRLCanvasRenderable *)v2->_strokeRenderable setDelegate:0];
    strokeRenderable = v2->_strokeRenderable;
    v2->_strokeRenderable = 0;

    CGSize size = CGRectZero.size;
    v2->_lastPictureFrameLayerRect.origin = CGRectZero.origin;
    v2->_lastPictureFrameLayerRect.CGSize size = size;
    long long v5 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v2->_lastPictureFrameLayerTransform.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v2->_lastPictureFrameLayerTransform.c = v5;
    *(_OWORD *)&v2->_lastPictureFrameLayerTransform.tCGFloat x = *(_OWORD *)&CGAffineTransformIdentity.tx;
    double v2 = (CRLImageRep *)((char *)v2 + 424);
    id WeakRetained = objc_loadWeakRetained((id *)&v2->super.super.super.super.isa);
    [WeakRetained removeFromSuperlayer];

    objc_storeWeak((id *)&v2->super.super.super.super.isa, 0);
    +[CATransaction commit];
  }
}

- (void)p_disposeMaskRenderable
{
  id v3 = [(CRLImageRep *)self maskRenderable];

  if (v3)
  {
    +[CATransaction begin];
    [(CRLCanvasRenderable *)self->_maskSubrenderable removeFromSuperlayer];
    maskSubrenderable = self->_maskSubrenderable;
    self->_maskSubrenderable = 0;

    long long v5 = [(CRLImageRep *)self maskRenderable];
    [v5 removeFromSuperlayer];

    BOOL v6 = [(CRLImageRep *)self maskRenderable];
    [v6 setDelegate:0];

    [(CRLImageRep *)self setMaskRenderable:0];
    p_frameMaskLayer = &self->_frameMaskLayer;
    id WeakRetained = objc_loadWeakRetained((id *)p_frameMaskLayer);
    [WeakRetained removeFromSuperlayer];

    objc_storeWeak((id *)p_frameMaskLayer, 0);
    +[CATransaction commit];
  }
}

- (void)p_createMaskRenderableForRenderable:(id)a3
{
  id v10 = a3;
  id v4 = [(CRLImageRep *)self maskRenderable];

  if (!v4)
  {
    long long v5 = +[CRLCanvasShapeRenderable renderable];
    [(CRLImageRep *)self setMaskRenderable:v5];

    BOOL v6 = [(CRLImageRep *)self maskRenderable];
    [v6 setDelegate:self];

    double y = CGPointZero.y;
    BOOL v8 = [(CRLImageRep *)self maskRenderable];
    [v8 setAnchorPoint:CGPointZero.x, y];

    double v9 = [(CRLImageRep *)self maskRenderable];
    [v10 setMaskRenderable:v9];
  }
}

- (void)p_updateMaskSublayersForMaskEditMode
{
  +[CATransaction begin];
  +[CATransaction setDisableActions:1];
  id v3 = [(CRLCanvasRep *)self interactiveCanvasController];
  id v13 = [v3 renderableForRep:self];

  id v4 = [(CRLImageRep *)self maskRenderable];

  if (!v4) {
    [(CRLImageRep *)self p_createMaskRenderableForRenderable:v13];
  }
  if (!self->_maskSubrenderable)
  {
    long long v5 = +[CRLCanvasShapeRenderable renderable];
    maskSubrenderable = self->_maskSubrenderable;
    self->_maskSubrenderable = v5;

    unsigned __int8 v7 = [(CRLImageRep *)self maskRenderable];
    [v7 addSubrenderable:self->_maskSubrenderable];
  }
  BOOL v8 = +[CRLColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.5];
  -[CRLCanvasRenderable setBackgroundColor:](self->_maskSubrenderable, "setBackgroundColor:", [v8 CGColor]);

  if (!self->_maskPathRenderable)
  {
    double v9 = +[CRLCanvasShapeRenderable renderable];
    maskPathRenderable = self->_maskPathRenderable;
    self->_maskPathRenderable = v9;

    double v11 = +[CRLColor blackColor];
    -[CRLCanvasShapeRenderable setStrokeColor:](self->_maskPathRenderable, "setStrokeColor:", [v11 CGColor]);

    [(CRLCanvasShapeRenderable *)self->_maskPathRenderable setFillColor:0];
    [(CRLCanvasShapeRenderable *)self->_maskPathRenderable setLineWidth:1.0];
    [(CRLCanvasShapeRenderable *)self->_maskPathRenderable setLineDashPattern:&off_10155CEA8];
  }
  id v12 = [(CRLImageRep *)self maskRenderable];
  [v12 setPath:0];

  +[CATransaction commit];
}

- (BOOL)p_okayToGenerateSizedImage
{
  return ![(CRLCanvasRep *)self isBeingResized];
}

- (void)p_generateSizedImageIfNecessary
{
  if ([(CRLImageRep *)self p_okayToGenerateSizedImage])
  {
    drawingHelper = self->_drawingHelper;
    [(CRLImageRepDrawingHelper *)drawingHelper generateSizedImageIfNeeded];
  }
}

+ (CGPath)p_newPathToBakeIntoSizedImageForSize:(CGSize)a3 withImageLayout:(id)a4 orientation:(int64_t)a5
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  BOOL v8 = [v7 maskLayout];
  long long v23 = *(_OWORD *)&CGAffineTransformIdentity.c;
  long long v24 = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&v32.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&v32.c = v23;
  long long v22 = *(_OWORD *)&CGAffineTransformIdentity.tx;
  *(_OWORD *)&v32.tCGFloat x = v22;
  double v9 = [v7 imageGeometry];
  [v9 size];
  double v11 = v10;

  id v12 = [v7 imageGeometry];
  [v12 size];
  double v14 = v13;

  if (v8)
  {
    [v8 pathBounds];
    CGAffineTransformMakeTranslation(&t2, -v15, -v16);
    *(_OWORD *)&t1.a = v24;
    *(_OWORD *)&t1.c = v23;
    *(_OWORD *)&t1.tCGFloat x = v22;
    CGAffineTransformConcat(&v32, &t1, &t2);
    if (v7) {
      [v7 layoutToMaskTransform];
    }
    else {
      memset(&v29, 0, sizeof(v29));
    }
    double v18 = width / v11;
    CGAffineTransform v28 = v32;
    double v19 = height / v14;
    CGAffineTransformConcat(&t1, &v28, &v29);
    CGAffineTransform v32 = t1;
    if (v7) {
      [v7 layoutToImageTransform];
    }
    else {
      memset(&v26, 0, sizeof(v26));
    }
    CGAffineTransformInvert(&v27, &v26);
    CGAffineTransform v28 = v32;
    CGAffineTransformConcat(&t1, &v28, &v27);
    CGAffineTransform v32 = t1;
    CGAffineTransformMakeScale(&v25, v18, v19);
    CGAffineTransform v28 = v32;
    CGAffineTransformConcat(&t1, &v28, &v25);
    CGAffineTransform v32 = t1;
    double v20 = (const CGPath *)[v8 path];
    CGAffineTransform t1 = v32;
    double v17 = sub_1000D5540(v20, &t1);
  }
  else
  {
    double v17 = 0;
  }

  return v17;
}

- (void)p_injectSizedImageIntoLayerContentsIfReady
{
  if (!+[NSThread isMainThread])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EF8E8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A1130();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EF908);
    }
    id v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageRep p_injectSizedImageIntoLayerContentsIfReady]");
    long long v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRep.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:2602 isFatal:0 description:"This operation must only be performed on the main thread."];
  }
  BOOL v6 = [(CRLCanvasRep *)self canvas];
  id v7 = [v6 canvasController];

  if (v7)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100340234;
    v8[3] = &unk_1014EF9B0;
    v8[4] = self;
    id v9 = v7;
    [v9 updateRenderableForRep:self usingBlock:v8];
  }
}

- (BOOL)p_shouldBakeMaskIntoSizedImage
{
  id v3 = [(CRLImageRep *)self p_validatedImageProvider];
  [v3 naturalSize];
  double v5 = v4;
  double v7 = v6;

  BOOL v8 = [(CRLImageRep *)self imageLayout];
  id v9 = [v8 imageGeometry];
  [v9 size];
  double v11 = v10;
  double v13 = v12;
  double v14 = [(CRLCanvasRep *)self canvas];
  [v14 viewScale];
  double v16 = v15;
  double v17 = [(CRLCanvasRep *)self canvas];
  [v17 contentsScale];
  double v19 = sub_1000646A4(v11, v13, v16 * v18);
  double v21 = v20;

  BOOL v22 = v5 < v19 || v7 < v21;
  if (v22 || ![(CRLImageRep *)self directlyManagesLayerContent])
  {
    LOBYTE(v25) = 0;
  }
  else
  {
    long long v23 = [(CRLImageRep *)self maskLayout];
    if (v23)
    {
      long long v24 = [(CRLImageRep *)self imageLayout];
      if ([v24 isInMaskEditMode])
      {
        LOBYTE(v25) = 0;
      }
      else
      {
        CGAffineTransform v26 = [(CRLImageRep *)self imageLayout];
        CGAffineTransform v27 = [v26 maskLayout];
        if ([v27 hasSmartPath]) {
          LOBYTE(v25) = 0;
        }
        else {
          unsigned int v25 = ![(CRLImageRep *)self p_shouldRenderWithMaskToBounds];
        }
      }
    }
    else
    {
      LOBYTE(v25) = 0;
    }
  }
  return v25;
}

+ (BOOL)p_canRenderWithMaskToBoundsWithImageLayout:(id)a3
{
  id v3 = a3;
  double v4 = [v3 maskLayout];
  double v5 = [v4 pathSource];
  unsigned __int8 v6 = [v5 isRectangular];

  if (v6)
  {
    BOOL v7 = 1;
  }
  else
  {
    uint64_t v8 = objc_opt_class();
    id v9 = [v3 maskLayout];
    double v10 = [v9 pathSource];
    double v11 = sub_1002469D0(v8, v10);

    if (v11) {
      BOOL v7 = [v11 type] == 0;
    }
    else {
      BOOL v7 = 0;
    }
  }
  return v7;
}

- (BOOL)p_shouldRenderWithMaskToBounds
{
  if (![(CRLImageRep *)self directlyManagesLayerContent]) {
    return 0;
  }
  id v3 = [(CRLImageRep *)self imageLayout];
  if ([v3 isInMaskEditMode])
  {
    BOOL v4 = 0;
  }
  else
  {
    double v5 = [(CRLImageRep *)self imageLayout];
    BOOL v4 = +[CRLImageRep p_canRenderWithMaskToBoundsWithImageLayout:v5];
  }
  return v4;
}

- (BOOL)p_shouldRenderWithMaskMatchingImage
{
  if (![(CRLImageRep *)self directlyManagesLayerContent]) {
    return 0;
  }
  id v3 = [(CRLImageRep *)self imageLayout];
  if ([v3 isInMaskEditMode])
  {
    unsigned __int8 v4 = 0;
  }
  else
  {
    double v5 = [(CRLImageRep *)self imageInfo];
    unsigned __int8 v4 = [v5 maskMatchesImageGeometryWithIgnoreRoundedCorners:1];
  }
  return v4;
}

- (BOOL)canRemoveBackgroundFromImage
{
  p_backgroundRemovalLock = &self->_backgroundRemovalLock;
  os_unfair_lock_lock(&self->_backgroundRemovalLock);
  int64_t autoBackgroundRemovalState = self->_autoBackgroundRemovalState;
  int64_t userInitiatedBackgroundRemovalState = self->_userInitiatedBackgroundRemovalState;
  os_unfair_lock_unlock(p_backgroundRemovalLock);
  return autoBackgroundRemovalState != 2 && userInitiatedBackgroundRemovalState != 1;
}

- (void)removeBackgroundFromImage
{
}

- (void)p_removeBackgroundFromImageInitiatedByUser:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(CRLImageRep *)self imageInfo];
  unsigned int v6 = [v5 isBackgroundRemoved];

  if (v6)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EF9D0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A12C8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EF9F0);
    }
    BOOL v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v7);
    }
    uint64_t v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageRep p_removeBackgroundFromImageInitiatedByUser:]");
    id v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRep.m"];
    +[CRLAssertionHandler handleFailureInFunction:v8 file:v9 lineNumber:2740 isFatal:0 description:"Background has already been removed from this image"];
  }
  double v10 = [(CRLImageRep *)self p_validatedImageProvider];
  if (([v10 isError] & 1) == 0)
  {
    if (v3) {
      goto LABEL_13;
    }
    double v17 = [(CRLCanvasRep *)self interactiveCanvasController];
    double v15 = [v17 infosForCurrentSelectionPath];

    if ([(CRLRemoveImageBackgroundData *)v15 count] != (id)1) {
      goto LABEL_32;
    }
    double v18 = [(CRLRemoveImageBackgroundData *)v15 anyObject];
    double v19 = [(CRLCanvasRep *)self info];

    if (v18 == v19)
    {
LABEL_13:
      os_unfair_lock_lock(&self->_backgroundRemovalLock);
      int64_t imageForRemoveBackgroundAssetDataHash = self->_imageForRemoveBackgroundAssetDataHash;
      double v12 = [v10 imageData];
      id v13 = [v12 crl_hash];

      if ((id)imageForRemoveBackgroundAssetDataHash != v13)
      {
        [(CRLRemoveImageBackgroundData *)self->_cachedRemoveImageBackgroundData setImage:0];
        -[CRLRemoveImageBackgroundData setOffset:](self->_cachedRemoveImageBackgroundData, "setOffset:", CGPointZero.x, CGPointZero.y);
        [(CRLRemoveImageBackgroundData *)self->_cachedRemoveImageBackgroundData setError:0];
      }
      if (v3
        && (p_int64_t userInitiatedBackgroundRemovalState = &self->_userInitiatedBackgroundRemovalState,
            self->_userInitiatedBackgroundRemovalState != 1)
        || (p_int64_t userInitiatedBackgroundRemovalState = &self->_autoBackgroundRemovalState,
            self->_autoBackgroundRemovalState != 1))
      {
        *p_int64_t userInitiatedBackgroundRemovalState = 0;
      }
      double v15 = self->_cachedRemoveImageBackgroundData;
      id v16 = self->_imageForRemoveBackgroundAssetDataHash;
      os_unfair_lock_unlock(&self->_backgroundRemovalLock);
      if (v3)
      {
        if ([(CRLRemoveImageBackgroundData *)v15 image])
        {
          [(CRLImageRep *)self p_calcNewImageGeometryAndReplaceImageWithRemoveImageBackgroundData:v15 dismissMiniFormatter:1];
LABEL_32:

          goto LABEL_33;
        }
        double v20 = &OBJC_IVAR___CRLImageRep__userInitiatedBackgroundRemovalState;
      }
      else
      {
        double v20 = &OBJC_IVAR___CRLImageRep__autoBackgroundRemovalState;
      }
      os_unfair_lock_lock(&self->_backgroundRemovalLock);
      uint64_t v21 = *v20;
      uint64_t v22 = *(uint64_t *)((char *)&self->super.super.super.super.isa + v21);
      *(Class *)((char *)&self->super.super.super.super.isa + v21) = (Class)1;
      os_unfair_lock_unlock(&self->_backgroundRemovalLock);
      if (v22 != 1)
      {
        if (![(CRLImageRep *)self imageForRemoveBackground]
          || ([v10 imageData],
              long long v23 = objc_claimAutoreleasedReturnValue(),
              id v24 = objc_msgSend(v23, "crl_hash"),
              v23,
              v16 != v24))
        {
          self->_imageForRemoveBackground = [(CRLImageRep *)self p_createImageForRemoveBackground];
          os_unfair_lock_lock(&self->_backgroundRemovalLock);
          id v16 = self->_imageForRemoveBackgroundAssetDataHash;
          os_unfair_lock_unlock(&self->_backgroundRemovalLock);
        }
        CGImageRef v25 = CGImageRetain([(CRLImageRep *)self imageForRemoveBackground]);
        objc_initWeak(&location, self);
        CGAffineTransform v26 = dispatch_get_global_queue(25, 0);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        void block[2] = sub_100340F20;
        block[3] = &unk_1014EFA80;
        v28[1] = v25;
        objc_copyWeak(v28, &location);
        v28[2] = v16;
        BOOL v29 = v3;
        dispatch_async(v26, block);

        objc_destroyWeak(v28);
        objc_destroyWeak(&location);
      }
      goto LABEL_32;
    }
  }
LABEL_33:
}

- (CGImage)p_createImageForRemoveBackground
{
  imageForRemoveBackground = self->_imageForRemoveBackground;
  if (imageForRemoveBackground)
  {
    CFRelease(imageForRemoveBackground);
    self->_imageForRemoveBackground = 0;
  }
  unsigned __int8 v4 = [(CRLImageRep *)self p_validatedImageProvider];
  os_unfair_lock_lock(&self->_backgroundRemovalLock);
  double v5 = [v4 imageData];
  self->_int64_t imageForRemoveBackgroundAssetDataHash = (int64_t)[v5 hash];

  os_unfair_lock_unlock(&self->_backgroundRemovalLock);
  [v4 naturalSize];
  double v8 = sub_10006727C(v6, v7, (double)[(CRLImageRep *)self p_maxPixelAreaForBackgroundRemoval]);
  double v9 = sub_10006538C(v8);
  double v11 = v10;
  if ([v4 imageGamut] == (id)2) {
    char v12 = 27;
  }
  else {
    char v12 = 59;
  }
  id v13 = sub_100455AA8(v12, v9, v11);
  [v4 drawImageInContext:v13 rect:sub_100064070()];
  Image = CGBitmapContextCreateImage(v13);
  CGContextRelease(v13);
  if (!Image)
  {
    int v15 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EFAA0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A13D8(v15);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EFAC0);
    }
    id v16 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v16);
    }
    double v17 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageRep p_createImageForRemoveBackground]");
    double v18 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRep.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v17, v18, 2883, 0, "expected inequality between %{public}s and %{public}s", "newRBImage", "NULL");
  }
  return Image;
}

- (unint64_t)p_maxPixelAreaForBackgroundRemoval
{
  if (CRLWPShapeLayout.columnsAreLeftToRight.getter())
  {
    unint64_t v2 = sub_1004549A8();
    double v3 = VKCImageRemoveBackgroundMaxResolution;
    if (VKCImageRemoveBackgroundMaxResolution > (double)v2) {
      return (unint64_t)(double)v2;
    }
  }
  else
  {
    return (unint64_t)VKCImageRemoveBackgroundMaxResolution;
  }
  return (unint64_t)v3;
}

- (CGImage)imageForRemoveBackground
{
  return self->_imageForRemoveBackground;
}

- (void)p_replaceImageDataWithRemoveImageBackgroundData:(id)a3 rect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v9 = a3;
  if (![v9 image])
  {
    int v10 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EFAE0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A1560();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EFB00);
    }
    double v11 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A1498(v11, v10);
    }
    char v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageRep p_replaceImageDataWithRemoveImageBackgroundData:rect:]");
    id v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRep.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 2900, 0, "invalid nil value for '%{public}s'", "removeImageBackgroundData.image");
  }
  uint64_t v14 = objc_opt_class();
  int v15 = [(CRLCanvasRep *)self info];
  id v16 = sub_1002469D0(v14, v15);

  uint64_t v17 = objc_opt_class();
  double v18 = [(CRLCanvasRep *)self layout];
  double v19 = sub_1002469D0(v17, v18);

  double v20 = [v16 imageAssetPayload];
  uint64_t v21 = [v20 filename];
  if ([v21 length])
  {
    uint64_t v22 = [v16 imageAssetPayload];
    long long v23 = [v22 filename];
  }
  else
  {
    long long v23 = +[CRLBoardItemImporter defaultPastedImageName];
  }

  id v24 = [v23 stringByDeletingPathExtension];
  CGImageRef v25 = [v24 stringByAppendingPathExtension:@"png"];

  objc_initWeak(&location, self);
  CGAffineTransform v26 = [_TtC8Freeform27CRLPreinsertionAssetWrapper alloc];
  CGAffineTransform v27 = sub_10047EC98((CGImage *)[v9 image]);
  CGAffineTransform v28 = [(CRLPreinsertionAssetWrapper *)v26 initWithData:v27 filename:v25 owner:v16 error:0];

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100341AE4;
  _OWORD v29[3] = &unk_1014EFBB0;
  objc_copyWeak(v30, &location);
  v29[4] = v19;
  v29[5] = self;
  v29[6] = v16;
  v30[1] = *(id *)&x;
  v30[2] = *(id *)&y;
  v30[3] = *(id *)&width;
  v30[4] = *(id *)&height;
  [(CRLPreinsertionAssetWrapper *)v28 createAssetWithCompletionHandler:v29];
  objc_destroyWeak(v30);

  objc_destroyWeak(&location);
}

- (void)p_enqueueCommandsToUpdateMagnetsForLineEnd:(unint64_t)a3 withClineLayout:(id)a4 withUnscaledPosition:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = objc_opt_class();
  double v11 = [(CRLCanvasRep *)self layout];
  char v12 = sub_1002469D0(v10, v11);

  if (a3 == 11) {
    id v13 = [v8 headMagnetType];
  }
  else {
    id v13 = [v8 tailMagnetType];
  }
  id v14 = v13;
  [v9 CGPointValue];
  long long v38 = v16;
  double v39 = v15;

  if (v14 == (id)6)
  {
    [v12 findNewEdgeMagnetCanvasPositionForConnectionLine:v8 forLineEnd:a3 withCanvasPosition:v39];
    long long v38 = v18;
    double v39 = v17;
  }
  if (v12) {
    [v12 pureTransformInRoot];
  }
  else {
    memset(&v41, 0, sizeof(v41));
  }
  CGAffineTransformInvert(&v42, &v41);
  float64x2_t v40 = vaddq_f64(*(float64x2_t *)&v42.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v42.c, *(double *)&v38), *(float64x2_t *)&v42.a, v39));
  double v19 = [v12 pureGeometry];
  [v19 size];
  double v20 = sub_100064070();
  double v23 = sub_100066AA4(v40.f64[0], v40.f64[1], v20, v21, v22);
  double v25 = v24;

  CGAffineTransform v26 = [v8 connectionLineInfo];
  CGAffineTransform v27 = [v26 connectionLinePathSource];

  CGAffineTransform v28 = -[CRLConnectionLineMagnet initWithType:normalizedPosition:]([CRLConnectionLineMagnet alloc], "initWithType:normalizedPosition:", v14, v23, v25);
  if (a3 == 11)
  {
    [v27 setHeadMagnet:v28];

    uint64_t v29 = objc_opt_class();
    [v8 connectedTo];
  }
  else
  {
    [v27 setTailMagnet:v28];

    uint64_t v29 = objc_opt_class();
    [v8 connectedFrom];
  double v30 = };
  double v31 = [v30 info:v38];
  CGAffineTransform v32 = sub_1002469D0(v29, v31);

  CGFloat v33 = [(CRLCanvasRep *)self interactiveCanvasController];
  CGFloat v34 = [v33 commandController];
  uint64_t v35 = [_TtC8Freeform37CRLCommandSetConnectionLineConnection alloc];
  CGFloat v36 = [v8 connectionLineInfo];
  CGAffineTransform v37 = [(CRLCommandSetConnectionLineConnection *)v35 initWithConnectionLine:v36 connectedItem:v32 chirality:a3 == 11 pathSource:v27];
  [v34 enqueueCommand:v37];
}

- (id)p_getMagnetUnscaledPositionValueForMagnet:(id)a3 withConnectedItem:(id)a4
{
  id v5 = a4;
  [a3 magnetNormalizedPosition];
  double v14 = v7;
  double v15 = v6;
  id v8 = [v5 pureGeometry];

  if (v8)
  {
    [v8 fullTransform];
    float64x2_t v9 = v17;
    float64x2_t v10 = v18;
    float64x2_t v11 = v19;
  }
  else
  {
    float64x2_t v11 = 0uLL;
    float64x2_t v9 = 0uLL;
    float64x2_t v10 = 0uLL;
  }
  float64x2_t v16 = vaddq_f64(v11, vmlaq_n_f64(vmulq_n_f64(v10, v14), v9, v15));

  char v12 = +[NSValue valueWithCGPoint:*(_OWORD *)&v16];

  return v12;
}

- (CGRect)p_calcNewImageItemRectWithRawSize:(CGSize)a3 offset:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  double height = a3.height;
  double width = a3.width;
  float64x2_t v9 = [(CRLImageRep *)self p_validatedImageProvider];
  float64x2_t v10 = [(CRLCanvasRep *)self info];
  float64x2_t v11 = [v10 geometry];

  if (v9 && ![v9 isError])
  {
    double v23 = width / (double)CGImageGetWidth(self->_imageForRemoveBackground);
    double v24 = height / (double)CGImageGetHeight(self->_imageForRemoveBackground);
    [v11 size];
    double v20 = v23 * v25;
    [v11 size];
    double v22 = v24 * v26;
    [v11 size];
    double v16 = x * v27;
    [v11 size];
    double v18 = y * v28;
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EFBD0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A176C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EFBF0);
    }
    char v12 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v12);
    }
    id v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageRep p_calcNewImageItemRectWithRawSize:offset:]");
    double v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRep.m"];
    +[CRLAssertionHandler handleFailureInFunction:v13 file:v14 lineNumber:3018 isFatal:0 description:"image provider for current image is invalid"];

    [v11 boundsBeforeRotation];
    double v16 = v15;
    [v11 boundsBeforeRotation];
    double v18 = v17;
    [v11 size];
    double v20 = v19;
    [v11 size];
    double v22 = v21;
  }

  double v29 = v16;
  double v30 = v18;
  double v31 = v20;
  double v32 = v22;
  result.size.double height = v32;
  result.size.double width = v31;
  result.origin.double y = v30;
  result.origin.double x = v29;
  return result;
}

- (void)p_calcNewImageGeometryAndReplaceImageWithRemoveImageBackgroundData:(id)a3 dismissMiniFormatter:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (!+[NSThread isMainThread])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EFC10);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A17F4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EFC30);
    }
    double v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v7);
    }
    id v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageRep p_calcNewImageGeometryAndReplaceImageWithRemoveImageBackgroundData:dismissMiniFormatter:]");
    float64x2_t v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRep.m"];
    +[CRLAssertionHandler handleFailureInFunction:v8 file:v9 lineNumber:3031 isFatal:0 description:"This operation must only be performed on the main thread."];
  }
  double Width = (double)CGImageGetWidth((CGImageRef)[v6 image]);
  double Height = (double)CGImageGetHeight((CGImageRef)[v6 image]);
  [v6 offset];
  -[CRLImageRep p_calcNewImageItemRectWithRawSize:offset:](self, "p_calcNewImageItemRectWithRawSize:offset:", Width, Height, v12, v13);
  -[CRLImageRep p_replaceImageDataWithRemoveImageBackgroundData:rect:](self, "p_replaceImageDataWithRemoveImageBackgroundData:rect:", v6);

  if (v4)
  {
    double v14 = [(CRLCanvasRep *)self interactiveCanvasController];
    double v15 = [v14 layerHost];
    double v16 = [v15 miniFormatterPresenter];
    [v16 dismissMiniFormatter];
  }
}

- (id)newTrackerForKnob:(id)a3
{
  id v4 = a3;
  if ((char *)[v4 tag] - 12 > (char *)4)
  {
    v8.receiver = self;
    v8.super_class = (Class)CRLImageRep;
    id v5 = [(CRLCanvasRep *)&v8 newTrackerForKnob:v4];
  }
  else
  {
    id v5 = [[CRLShapeControlKnobTracker alloc] initWithRep:self knob:v4];
  }
  id v6 = v5;

  return v6;
}

- (BOOL)shouldShowSmartMaskKnobs
{
  double v3 = [(CRLImageRep *)self maskLayout];
  id v4 = [v3 maskInfo];
  id v5 = [(CRLImageRep *)self imageInfo];
  id v6 = [v5 maskInfo];

  if (v4 == v6)
  {
    double v16 = [(CRLImageRep *)self maskLayout];
    unsigned int v17 = [v16 hasSmartPath];
  }
  else
  {
    double v7 = [(CRLImageRep *)self imageInfo];
    objc_super v8 = [v7 maskInfo];
    float64x2_t v9 = [v8 pathSource];
    uint64_t v10 = objc_opt_class();
    double v16 = sub_100246DEC(v9, v10, 1, v11, v12, v13, v14, v15, (uint64_t)&OBJC_PROTOCOL___CRLSmartPathSource);

    unsigned int v17 = v16 != 0;
  }

  double v18 = [(CRLImageRep *)self imageInfo];
  double v19 = [v18 maskInfo];
  BOOL v20 = 0;
  if (v19 && v17)
  {
    if ([(CRLCanvasRep *)self isSelected])
    {
      double v21 = [(CRLImageRep *)self imageLayout];
      if ([v21 isInMaskEditMode])
      {
        double v22 = [(CRLImageRep *)self imageLayout];
        BOOL v20 = [v22 maskEditMode] == (id)2;
      }
      else
      {
        BOOL v20 = 1;
      }
    }
    else
    {
      BOOL v20 = 0;
    }
  }

  return v20;
}

- (void)updatePositionsOfKnobs:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)CRLImageRep;
  [(CRLCanvasRep *)&v29 updatePositionsOfKnobs:v4];
  if ([(CRLImageRep *)self shouldShowSmartMaskKnobs])
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v5 = v4;
    id v6 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v26;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v26 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          if ((unint64_t)objc_msgSend(v10, "tag", (void)v19) >= 0xC
            && (unint64_t)[v10 tag] <= 0x10)
          {
            uint64_t v11 = [(CRLImageRep *)self maskLayout];
            [v11 getControlKnobPosition:[v10 tag]];
            long long v19 = v13;
            long long v20 = v12;

            uint64_t v14 = [(CRLImageRep *)self imageLayout];
            uint64_t v15 = v14;
            if (v14)
            {
              [v14 layoutToMaskTransform:v19, v20];
              float64x2_t v16 = v22;
              float64x2_t v17 = v23;
              float64x2_t v18 = v24;
            }
            else
            {
              float64x2_t v23 = 0u;
              float64x2_t v24 = 0u;
              float64x2_t v18 = 0uLL;
              float64x2_t v16 = 0uLL;
              float64x2_t v17 = 0uLL;
              float64x2_t v22 = 0u;
            }
            float64x2_t v21 = vaddq_f64(v18, vmlaq_n_f64(vmulq_n_f64(v17, *(double *)&v19), v16, *(double *)&v20));

            [v10 setPosition:*(_OWORD *)&v21];
          }
        }
        id v7 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v7);
    }
  }
}

- (id)newSelectionKnobForType:(unint64_t)a3 tag:(unint64_t)a4
{
  id v7 = [(CRLImageRep *)self imageLayout];
  id v8 = [v7 maskEditMode];

  if (v8 == (id)2)
  {
    float64x2_t v9 = [CRLImageMaskKnob alloc];
    double y = CGPointZero.y;
    return -[CRLCanvasKnob initWithType:position:radius:tag:onRep:](v9, "initWithType:position:radius:tag:onRep:", a3, a4, self, CGPointZero.x, y, 15.0);
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)CRLImageRep;
    return [(CRLCanvasRep *)&v12 newSelectionKnobForType:a3 tag:a4];
  }
}

- (void)addKnobsToArray:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)CRLImageRep;
  [(CRLCanvasRep *)&v24 addKnobsToArray:v4];
  if ([(CRLImageRep *)self shouldShowSmartMaskKnobs])
  {
    id v5 = [(CRLImageRep *)self maskLayout];
    id v6 = (char *)[v5 numberOfControlKnobs];
    if (v6)
    {
      id v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        float64x2_t v9 = [(CRLImageRep *)self maskLayout];
        [v9 getControlKnobPosition:i + 12];
        long long v18 = v11;
        long long v19 = v10;

        objc_super v12 = [(CRLImageRep *)self imageLayout];
        long long v13 = v12;
        if (v12)
        {
          [v12 layoutToMaskTransform:v18, v19];
          float64x2_t v14 = v21;
          float64x2_t v15 = v22;
          float64x2_t v16 = v23;
        }
        else
        {
          float64x2_t v22 = 0u;
          float64x2_t v23 = 0u;
          float64x2_t v16 = 0uLL;
          float64x2_t v14 = 0uLL;
          float64x2_t v15 = 0uLL;
          float64x2_t v21 = 0u;
        }
        float64x2_t v20 = vaddq_f64(v16, vmlaq_n_f64(vmulq_n_f64(v15, *(double *)&v18), v14, *(double *)&v19));

        float64x2_t v17 = [[CRLCanvasKnob alloc] initWithType:0 position:i + 12 radius:self tag:*(_OWORD *)&v20 onRep:15.0];
        [v4 addObject:v17];
      }
    }
  }
}

- (double)additionalRotationForKnobOrientation
{
  v12.receiver = self;
  v12.super_class = (Class)CRLImageRep;
  [(CRLCanvasRep *)&v12 additionalRotationForKnobOrientation];
  double v4 = v3;
  id v5 = [(CRLImageRep *)self imageLayout];
  if (![v5 isInMaskEditMode])
  {
LABEL_7:

    return v4;
  }
  id v6 = [(CRLImageRep *)self imageLayout];
  id v7 = [v6 maskEditMode];

  if (v7 == (id)3)
  {
    id v5 = [(CRLImageRep *)self imageLayout];
    id v8 = [v5 maskLayout];
    float64x2_t v9 = v8;
    if (v8) {
      [v8 transform];
    }
    else {
      memset(v11, 0, sizeof(v11));
    }
    double v4 = v4 - sub_10007F788(v11);

    goto LABEL_7;
  }
  return v4;
}

- (id)cursorAtPoint:(CGPoint)a3 forKnob:(id)a4 withCursorPlatformObject:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  id v9 = a4;
  id v10 = a5;
  long long v11 = [(CRLImageRep *)self imageLayout];
  unsigned int v12 = [v11 isInMaskEditMode];

  if (v9) {
    goto LABEL_4;
  }
  if (!v12) {
    goto LABEL_4;
  }
  long long v13 = [(CRLImageRep *)self imageLayout];
  float64x2_t v14 = [v13 imageGeometryInRoot];
  [v14 frame];
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;

  float64x2_t v23 = [(CRLCanvasRep *)self interactiveCanvasController];
  [v23 convertUnscaledToBoundsRect:v16, v18, v20, v22];
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;

  double v32 = +[CRLCursor moveCursorWithActiveScaledRect:](CRLCursor, "moveCursorWithActiveScaledRect:", v25, v27, v29, v31);
  [v32 setConstrainedAxes:0];
  if (!v32)
  {
LABEL_4:
    v34.receiver = self;
    v34.super_class = (Class)CRLImageRep;
    double v32 = -[CRLStyledRep cursorAtPoint:forKnob:withCursorPlatformObject:](&v34, "cursorAtPoint:forKnob:withCursorPlatformObject:", v9, v10, x, y);
  }

  return v32;
}

- (void)p_invalidateHitTestCache
{
}

- (BOOL)p_hitCacheGetCachedValue:(BOOL *)a3 forPoint:(CGPoint)a4
{
  id v6 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", a4.x, a4.y);
  id v7 = [(NSMutableDictionary *)self->_hitTestCache objectForKey:v6];
  id v8 = v7;
  if (v7) {
    *a3 = [v7 BOOLValue];
  }

  return v8 != 0;
}

- (void)p_hitCacheSetCachedValue:(BOOL)a3 forPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  hitTestCache = self->_hitTestCache;
  id v8 = +[NSNumber numberWithBool:a3];
  id v7 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", x, y);
  [(NSMutableDictionary *)hitTestCache setObject:v8 forKey:v7];
}

- (int64_t)dragTypeAtCanvasPoint:(CGPoint)a3 forTouchType:(int64_t)a4
{
  double y = a3.y;
  double x = a3.x;
  id v8 = [(CRLImageRep *)self imageLayout];
  if (![v8 isInMaskEditMode]) {
    goto LABEL_4;
  }
  id v9 = [(CRLImageRep *)self imageLayout];
  if ([v9 maskIntersectsImage])
  {

LABEL_4:
LABEL_5:
    v33.receiver = self;
    id v10 = &v33;
LABEL_6:
    v10->super_class = (Class)CRLImageRep;
    return (int64_t)-[objc_super dragTypeAtCanvasPoint:forTouchType:](v10, "dragTypeAtCanvasPoint:forTouchType:", a4, x, y);
  }
  [(CRLCanvasRep *)self naturalBounds];
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  -[CRLCanvasRep convertNaturalPointFromUnscaledCanvas:](self, "convertNaturalPointFromUnscaledCanvas:", x, y);
  v37.double x = v20;
  v37.double y = v21;
  v38.origin.double x = v13;
  v38.origin.double y = v15;
  v38.size.double width = v17;
  v38.size.double height = v19;
  BOOL v22 = CGRectContainsPoint(v38, v37);

  if (!v22) {
    goto LABEL_5;
  }
  -[CRLCanvasRep convertNaturalPointFromUnscaledCanvas:](self, "convertNaturalPointFromUnscaledCanvas:", x, y);
  double v30 = v24;
  double point = v23;
  double v25 = [(CRLImageRep *)self imageLayout];
  double v26 = v25;
  if (v25) {
    [v25 layoutToImageTransform];
  }
  else {
    memset(&v35, 0, sizeof(v35));
  }
  CGAffineTransformInvert(&v36, &v35);
  CGPoint pointa = (CGPoint)vaddq_f64(*(float64x2_t *)&v36.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v36.c, v30), *(float64x2_t *)&v36.a, point));

  double v27 = [(CRLImageRep *)self imageLayout];
  double v28 = [v27 imageGeometry];
  [v28 size];
  v39.origin.double x = sub_100064070();
  BOOL v29 = CGRectContainsPoint(v39, pointa);

  if (v29)
  {
    objc_super v34 = self;
    id v10 = (objc_super *)&v34;
    goto LABEL_6;
  }
  return 0;
}

- (BOOL)supportsAlternatePressureDrag
{
  double v3 = [(CRLImageRep *)self imageLayout];
  if ([v3 isInMaskEditMode]) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = [(CRLImageRep *)self p_allowedToEditMask];
  }

  return v4;
}

- (void)willEnterForeground
{
  v3.receiver = self;
  v3.super_class = (Class)CRLImageRep;
  [(CRLCanvasRep *)&v3 willEnterForeground];
  if ([(CRLImageRep *)self p_okayToGenerateSizedImage]) {
    [(CRLImageRepDrawingHelper *)self->_drawingHelper retryGeneratingSizedImageIfNeeded];
  }
}

- (CRLCanvasShapeRenderable)maskRenderable
{
  return self->_maskRenderable;
}

- (void)setMaskRenderable:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maskRenderable, 0);
  objc_storeStrong((id *)&self->_cachedRemoveImageBackgroundData, 0);
  objc_storeStrong((id *)&self->_downloadObserverIdentifier, 0);
  objc_storeStrong((id *)&self->_updateFromLayoutBlocksLock, 0);
  objc_storeStrong((id *)&self->_updateFromLayoutBlocks, 0);
  objc_storeStrong((id *)&self->_disabledCanvasViewGRs, 0);
  objc_storeStrong((id *)&self->_hitTestCache, 0);
  objc_destroyWeak((id *)&self->_frameMaskLayer);
  objc_storeStrong((id *)&self->_strokeRenderable, 0);
  objc_storeStrong((id *)&self->_maskSubrenderable, 0);
  objc_storeStrong((id *)&self->_maskPathRenderable, 0);
  objc_storeStrong((id *)&self->_contentsRenderable, 0);
  objc_storeStrong((id *)&self->_directlyManagedLayerContentsRecipe, 0);
  objc_storeStrong((id *)&self->_drawingHelper, 0);
  objc_storeStrong((id *)&self->_lastMaskGeometryInRoot, 0);

  objc_storeStrong((id *)&self->_lastImageGeometryInRoot, 0);
}

- (BOOL)wantsToHandleDoubleTapsWhenLocked
{
  return 1;
}

- (void)enterPreviewMode
{
  unint64_t v2 = self;
  sub_100FA4E3C();
}

@end