@interface TSDImageRep
+ (CGPath)p_newPathToBakeIntoSizedImageForSize:(CGSize)a3 withImageLayout:(id)a4 orientation:(int64_t)a5;
+ (double)magicMoveAttributeMatchPercentBetweenOutgoingObject:(id)a3 incomingObject:(id)a4;
- (BOOL)canDrawInParallel;
- (BOOL)containsPoint:(CGPoint)a3;
- (BOOL)directlyManagesLayerContent;
- (BOOL)handleDoubleTapAtPoint:(CGPoint)a3;
- (BOOL)isDraggable;
- (BOOL)p_directlyManagesContentForLayer:(id)a3;
- (BOOL)p_drawsInOneStep;
- (BOOL)p_hitCacheGetCachedValue:(BOOL *)a3 forPoint:(CGPoint)a4;
- (BOOL)p_okayToGenerateSizedImage;
- (BOOL)p_shouldBakeMaskIntoSizedImage;
- (BOOL)p_shouldMaskWithFrameLayers;
- (BOOL)p_shouldRenderWithMaskToBounds;
- (BOOL)p_takeSizedImageFromState:(id)a3;
- (BOOL)shouldAllowReplacementFromPaste;
- (BOOL)shouldCreateSelectionKnobs;
- (BOOL)shouldShowDragHUD;
- (BOOL)shouldShowMediaReplaceUI;
- (BOOL)shouldShowSelectionHighlight;
- (BOOL)shouldShowShadow;
- (BOOL)shouldShowSmartMaskKnobs;
- (BOOL)wantsToDistortWithImagerContext;
- (CGAffineTransform)transformForHighlightLayer;
- (CGImage)imageRef;
- (CGImage)p_imageForDirectlyManagedLayer:(id)a3;
- (CGImage)p_newImageByApplyingAdjustmentsToImage:(CGImage *)a3 alreadyEnhanced:(BOOL)a4;
- (CGPoint)centerForRotation;
- (CGPoint)positionOfStandardKnob:(id)a3 forBounds:(CGRect)a4;
- (CGRect)boundsForHighlightLayer;
- (CGRect)boundsForStandardKnobs;
- (CGRect)frameInUnscaledCanvas;
- (CGSize)p_desiredSizedImageSize;
- (TSDImageRep)initWithLayout:(id)a3 canvas:(id)a4;
- (double)additionalRotationForKnobOrientation;
- (id)additionalLayersOverLayer;
- (id)contentsLayer;
- (id)hitRepChrome:(CGPoint)a3;
- (id)imageInfo;
- (id)imageLayout;
- (id)imageOfStroke:(CGRect *)a3;
- (id)maskInfo;
- (id)maskLayout;
- (id)newCachedSizedImage;
- (id)newCachedSizedImageWithNaturalSize;
- (id)overlayLayers;
- (id)p_imageData;
- (id)p_imageProvider;
- (id)p_validatedBitmapImageProvider;
- (id)p_validatedImageProvider;
- (id)p_validatedThumbnailImageProvider;
- (id)pathSourceForSelectionHighlightBehavior;
- (id)textureForContext:(id)a3;
- (int)dragTypeAtCanvasPoint:(CGPoint)a3;
- (int64_t)p_orientationForDirectlyManagedLayer;
- (void)addBitmapsToRenderingQualityInfo:(id)a3 inContext:(CGContext *)a4;
- (void)addKnobsToArray:(id)a3;
- (void)becameNotSelected;
- (void)cacheImageAtCurrentSize;
- (void)dealloc;
- (void)didCreateLayer:(id)a3;
- (void)didUpdateLayer:(id)a3;
- (void)drawInContextWithoutEffects:(CGContext *)a3 withContent:(BOOL)a4 withStroke:(BOOL)a5 withOpacity:(BOOL)a6 forAlphaOnly:(BOOL)a7 drawChildren:(BOOL)a8;
- (void)drawInLayerContext:(CGContext *)a3;
- (void)generateSizedImageOnBackgroundThread;
- (void)highlightImage;
- (void)i_willEnterForeground;
- (void)layoutInRootChangedFrom:(id)a3 to:(id)a4 translatedOnly:(BOOL)a5;
- (void)p_createMaskLayerForLayer:(id)a3;
- (void)p_disposeMaskLayer;
- (void)p_disposeStrokeLayer;
- (void)p_drawInContext:(CGContext *)a3 withContent:(BOOL)a4 withStroke:(BOOL)a5 withOpacity:(double)a6 withMask:(BOOL)a7 withIAMask:(BOOL)a8 forLayer:(BOOL)a9 forShadow:(BOOL)a10 forHitTest:(BOOL)a11;
- (void)p_generateSizedImage:(id)a3;
- (void)p_generateSizedImageIfNecessary;
- (void)p_getAliasedValuesForMaskToBoundsDirectLayerFrame:(CGRect *)a3 transform:(CGAffineTransform *)a4;
- (void)p_hitCacheSetCachedValue:(BOOL)a3 forPoint:(CGPoint)a4;
- (void)p_invalidateHitTestCache;
- (void)p_invalidateSizedImage;
- (void)p_invalidateSizedImageFromQueue;
- (void)p_startSizing;
- (void)p_takeSizedImageFromCache;
- (void)p_takeSizedImageFromState;
- (void)p_takeSizedImageFromStateIfReady;
- (void)p_updateDirectlyManagesLayerContentForLayer:(id)a3;
- (void)p_updateMaskLayer:(id)a3 forRepLayer:(id)a4 shouldIncludeMask:(BOOL)a5 shouldIncludeInstantAlpha:(BOOL)a6;
- (void)p_updateMaskSublayersForMaskEditMode;
- (void)p_updateStrokeLayerForStroke:(id)a3 repLayer:(id)a4;
- (void)popDisableImageSizing;
- (void)processChangedProperty:(int)a3;
- (void)processChanges:(id)a3;
- (void)pushDisableImageSizing;
- (void)unhighlightImage;
- (void)updateFromLayout;
- (void)updateLayerGeometryFromLayout:(id)a3;
- (void)updatePositionsOfKnobs:(id)a3;
- (void)useCachedSizedImage:(id)a3;
- (void)viewScaleDidChange;
- (void)wideGamutValueDidChange;
- (void)willBeRemoved;
- (void)willUpdateLayer:(id)a3;
@end

@implementation TSDImageRep

- (TSDImageRep)initWithLayout:(id)a3 canvas:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)TSDImageRep;
  v4 = [(TSDRep *)&v8 initWithLayout:a3 canvas:a4];
  v5 = v4;
  if (v4)
  {
    if ([(TSDImageRep *)v4 imageInfo])
    {
      uint64_t v6 = objc_msgSend(-[TSDImageRep imageInfo](v5, "imageInfo"), "imageData");
      if (v6) {
        objc_msgSend(+[TSDImageProviderPool sharedPool](TSDImageProviderPool, "sharedPool"), "addInterestInProviderForData:", v6);
      }
      *(void *)&v5->mSizingStateReady = dispatch_queue_create("com.apple.iwork.TSDImageRepSizedImage", 0);
      *(void *)&v5->mBaseMaskLayoutTransform.ty = objc_alloc_init(MEMORY[0x263F08AE0]);
      v5->mHitTestCacheOnce = (int64_t)objc_alloc_init(MEMORY[0x263EFF980]);
      v5->mUpdateFromLayoutBlocks = (NSMutableArray *)dispatch_semaphore_create(1);
      [(TSDImageRep *)v5 p_updateDirectlyManagesLayerContentForLayer:0];
    }
    else
    {

      v5 = 0;
    }
  }
  __dmb(0xBu);
  return v5;
}

- (void)dealloc
{
  [(TSDImageRep *)self p_disposeStrokeLayer];
  [(TSDImageRep *)self p_disposeMaskLayer];

  uint64_t v3 = objc_msgSend(-[TSDImageRep imageInfo](self, "imageInfo"), "imageData");
  if (v3) {
    objc_msgSend(+[TSDImageProviderPool sharedPool](TSDImageProviderPool, "sharedPool"), "removeInterestInProviderForData:", v3);
  }

  CGPathRelease(*(CGPathRef *)&self->mSizedImageHasMaskBakedIn);
  dispatch_release(&self->mUpdateFromLayoutBlocks->super.super);

  CGImageRelease(self->mSizedImageAccessQueue);
  dispatch_release(*(dispatch_object_t *)&self->mSizingStateReady);
  CGImageRelease(self->mSizedImageMaskPath);
  self->mSizedImageMaskPath = 0;

  v4.receiver = self;
  v4.super_class = (Class)TSDImageRep;
  [(TSDMediaRep *)&v4 dealloc];
}

- (CGImage)imageRef
{
  return self->mSizedImageAccessQueue;
}

- (id)imageInfo
{
  objc_opt_class();
  [(TSDRep *)self info];

  return (id)TSUDynamicCast();
}

- (id)imageLayout
{
  objc_opt_class();
  [(TSDRep *)self layout];

  return (id)TSUDynamicCast();
}

- (id)maskInfo
{
  id v2 = [(TSDImageRep *)self imageInfo];

  return (id)[v2 maskInfo];
}

- (id)maskLayout
{
  id v2 = [(TSDImageRep *)self imageLayout];

  return (id)[v2 maskLayout];
}

- (void)highlightImage
{
  BYTE1(self->mLastPictureFrameLayerTransform.ty) = 1;
  id v2 = [(TSDRep *)self interactiveCanvasController];

  [(TSDInteractiveCanvasController *)v2 layoutInvalidated];
}

- (void)unhighlightImage
{
  BYTE1(self->mLastPictureFrameLayerTransform.ty) = 0;
  id v2 = [(TSDRep *)self interactiveCanvasController];

  [(TSDInteractiveCanvasController *)v2 layoutInvalidated];
}

- (void)willBeRemoved
{
  v3.receiver = self;
  v3.super_class = (Class)TSDImageRep;
  [(TSDRep *)&v3 willBeRemoved];
  [(NSRecursiveLock *)self->mLayerUpdateAndSizingStateLock setStatus:2];

  self->super.mFrameMaskLayer = 0;
  dispatch_semaphore_wait(&self->mUpdateFromLayoutBlocks->super.super, 0xFFFFFFFFFFFFFFFFLL);
  [self->mHitTestCacheOnce removeAllObjects];
  dispatch_semaphore_signal(&self->mUpdateFromLayoutBlocks->super.super);
}

- (void)becameNotSelected
{
  v2.receiver = self;
  v2.super_class = (Class)TSDImageRep;
  [(TSDRep *)&v2 becameNotSelected];
}

- (BOOL)containsPoint:(CGPoint)a3
{
  v17.receiver = self;
  v17.super_class = (Class)TSDImageRep;
  double x = a3.x;
  double y = a3.y;
  unsigned int v4 = -[TSDRep containsPoint:](&v17, sel_containsPoint_);
  if (!v4
    || ![(TSDCanvas *)[(TSDRep *)self canvas] isCanvasInteractive]
    || (-[TSDRep convertNaturalPointToUnscaledCanvas:](self, "convertNaturalPointToUnscaledCanvas:", x, y),
        !-[TSDMediaRep replaceButtonContainsPoint:](self, "replaceButtonContainsPoint:")))
  {
    char v16 = 0;
    if (-[TSDImageRep p_hitCacheGetCachedValue:forPoint:](self, "p_hitCacheGetCachedValue:forPoint:", &v16, x, y))
    {
      LOBYTE(v5) = v16 != 0;
      return v5;
    }
    id v6 = [(TSDImageRep *)self imageLayout];
    if ([v6 maskLayout] && (v4 & (objc_msgSend(v6, "maskIntersectsImage") ^ 1) & 1) != 0)
    {
      BOOL v5 = 1;
    }
    else
    {
      if (v4) {
        goto LABEL_11;
      }
      if (objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "isInMaskEditMode"))
      {
        if (v6) {
          [v6 layoutToImageTransform];
        }
        else {
          memset(&v14, 0, sizeof(v14));
        }
        CGAffineTransformInvert(&v15, &v14);
        CGPoint point = (CGPoint)vaddq_f64(*(float64x2_t *)&v15.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v15.c, y), *(float64x2_t *)&v15.a, x));
        objc_msgSend((id)objc_msgSend(v6, "imageGeometry"), "size");
        v19.origin.double x = TSDRectWithSize();
        if (CGRectContainsPoint(v19, point))
        {
LABEL_11:
          if (containsPoint__ctx_once != -1) {
            dispatch_once(&containsPoint__ctx_once, &__block_literal_global_31);
          }
          CGContextSaveGState((CGContextRef)containsPoint__ctx);
          v18.origin.double x = 0.0;
          v18.origin.double y = 0.0;
          v18.size.width = 1.0;
          v18.size.height = 1.0;
          CGContextClearRect((CGContextRef)containsPoint__ctx, v18);
          CGContextTranslateCTM((CGContextRef)containsPoint__ctx, -x, -y);
          LOWORD(v10) = 256;
          -[TSDImageRep p_drawInContext:withContent:withStroke:withOpacity:withMask:withIAMask:forLayer:forShadow:forHitTest:](self, "p_drawInContext:withContent:withStroke:withOpacity:withMask:withIAMask:forLayer:forShadow:forHitTest:", containsPoint__ctx, 1, 1, objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "isInMaskEditMode") ^ 1, objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "isInInstantAlphaMode") ^ 1, 0, 1.0, v10);
          CGContextRestoreGState((CGContextRef)containsPoint__ctx);
          double v7 = x;
          double v8 = y;
          BOOL v5 = *(unsigned char *)containsPoint__data != 0;
          goto LABEL_21;
        }
      }
      BOOL v5 = 0;
    }
    double v7 = x;
    double v8 = y;
LABEL_21:
    -[TSDImageRep p_hitCacheSetCachedValue:forPoint:](self, "p_hitCacheSetCachedValue:forPoint:", v5, v7, v8);
    return v5;
  }
  LOBYTE(v5) = 1;
  return v5;
}

void *__29__TSDImageRep_containsPoint___block_invoke()
{
  containsPoint__ctdouble x = (uint64_t)TSDBitmapContextCreate(2, 1.0);
  result = CGBitmapContextGetData((CGContextRef)containsPoint__ctx);
  containsPoint__data = (uint64_t)result;
  return result;
}

- (int)dragTypeAtCanvasPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (-[TSDMediaRep replaceButtonContainsPoint:](self, "replaceButtonContainsPoint:")) {
    return 0;
  }
  if (!objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "isInMaskEditMode")) {
    goto LABEL_8;
  }
  if (objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "maskIntersectsImage")) {
    goto LABEL_8;
  }
  [(TSDRep *)self naturalBounds];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  -[TSDRep convertNaturalPointFromUnscaledCanvas:](self, "convertNaturalPointFromUnscaledCanvas:", x, y);
  v32.double x = v15;
  v32.double y = v16;
  v33.origin.double x = v8;
  v33.origin.double y = v10;
  v33.size.width = v12;
  v33.size.height = v14;
  if (!CGRectContainsPoint(v33, v32))
  {
LABEL_8:
    v27.receiver = self;
    v20 = &v27;
LABEL_9:
    v20->super_class = (Class)TSDImageRep;
    return -[objc_super dragTypeAtCanvasPoint:](v20, sel_dragTypeAtCanvasPoint_, x, y);
  }
  -[TSDRep convertNaturalPointFromUnscaledCanvas:](self, "convertNaturalPointFromUnscaledCanvas:", x, y);
  double v24 = v18;
  double point = v17;
  id v19 = [(TSDImageRep *)self imageLayout];
  if (v19) {
    [v19 layoutToImageTransform];
  }
  else {
    memset(&v30, 0, sizeof(v30));
  }
  CGAffineTransformInvert(&v31, &v30);
  CGPoint pointa = (CGPoint)vaddq_f64(*(float64x2_t *)&v31.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v31.c, v24), *(float64x2_t *)&v31.a, point));
  if (objc_msgSend(-[TSDImageRep imageInfo](self, "imageInfo"), "instantAlphaPath"))
  {
    v21 = objc_msgSend((id)objc_msgSend(-[TSDImageRep imageInfo](self, "imageInfo"), "instantAlphaPath"), "copy");
    id v22 = [(TSDImageRep *)self imageLayout];
    if (v22) {
      [v22 imageDataToVisualSizeTransform];
    }
    else {
      memset(v29, 0, sizeof(v29));
    }
    [v21 transformUsingAffineTransform:v29];
    char v23 = [v21 containsPoint:pointa];

    if ((v23 & 1) == 0) {
      return 0;
    }
    goto LABEL_19;
  }
  objc_msgSend((id)objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "imageGeometry"), "size");
  v34.origin.double x = TSDRectWithSize();
  int result = CGRectContainsPoint(v34, pointa);
  if (result)
  {
LABEL_19:
    v28 = self;
    v20 = (objc_super *)&v28;
    goto LABEL_9;
  }
  return result;
}

- (BOOL)handleDoubleTapAtPoint:(CGPoint)a3
{
  return 0;
}

- (BOOL)shouldShowSelectionHighlight
{
  if (objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "isInMaskEditMode")) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)TSDImageRep;
  return [(TSDStyledRep *)&v4 shouldShowSelectionHighlight];
}

- (id)pathSourceForSelectionHighlightBehavior
{
  objc_super v2 = objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "maskLayout");

  return (id)[v2 pathSource];
}

- (void)processChanges:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)TSDImageRep;
  [(TSDRep *)&v3 processChanges:a3];
}

- (void)processChangedProperty:(int)a3
{
  v8.receiver = self;
  v8.super_class = (Class)TSDImageRep;
  -[TSDMediaRep processChangedProperty:](&v8, sel_processChangedProperty_);
  if (a3 == 517)
  {
    [(TSDMediaRep *)self i_updateFrameRep];
    BOOL v5 = 0;
    goto LABEL_3;
  }
  BOOL v5 = a3 == 529;
  if (a3 > 527)
  {
    if (a3 == 528)
    {
      [(TSDImageRep *)self p_invalidateSizedImage];
LABEL_23:
      [(TSDStyledRep *)self setNeedsDisplay];
      LOBYTE(self->mFrameInUnscaledCanvasRelativeToSuper.size.height) = 0;
      [(TSDCanvas *)self->super.super.super.mCanvas layoutInvalidated];
      goto LABEL_24;
    }
    if (a3 != 530)
    {
      if (a3 != 529) {
        goto LABEL_24;
      }
LABEL_3:
      [(TSDImageRep *)self p_disposeStrokeLayer];
      [(TSDRep *)self invalidateKnobs];
      if (v5) {
        objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "invalidateAlignmentFrame");
      }
      if (objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "maskEditMode")
        || !objc_msgSend(-[TSDImageRep imageInfo](self, "imageInfo"), "maskInfo"))
      {
        if (!v5) {
          goto LABEL_23;
        }
      }
      else
      {
        objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "maskWasApplied");
        if (!v5) {
          goto LABEL_23;
        }
      }
      goto LABEL_22;
    }
    [(TSDImageRep *)self p_disposeStrokeLayer];
    objc_msgSend((id)objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "maskLayout"), "invalidatePath");
    [(TSDLayout *)[(TSDRep *)self layout] invalidateSize];
LABEL_22:
    id v6 = *(NSObject **)&self->mSizingStateReady;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __38__TSDImageRep_processChangedProperty___block_invoke;
    block[3] = &unk_2646AF7B8;
    block[4] = self;
    dispatch_sync(v6, block);
    goto LABEL_23;
  }
  if (a3 == 512) {
    goto LABEL_22;
  }
  if (a3 == 513 && [(TSDImageRep *)self shouldShowSmartMaskKnobs]) {
    [(TSDRep *)self invalidateKnobs];
  }
LABEL_24:
  [(TSDImageRep *)self p_invalidateHitTestCache];
}

void __38__TSDImageRep_processChangedProperty___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 704) || *(void *)(v2 + 680))
  {
    if (*(unsigned char *)(v2 + 736))
    {
      BOOL v3 = 1;
    }
    else if (*(void *)(v2 + 680))
    {
      BOOL v3 = [*(id *)(v2 + 680) maskPath] != 0;
      uint64_t v2 = *(void *)(a1 + 32);
    }
    else
    {
      BOOL v3 = 0;
    }
    int v4 = *(unsigned __int8 *)(v2 + 737);
    uint64_t v14 = 0;
    CGFloat v15 = &v14;
    uint64_t v16 = 0x2020000000;
    char v17 = 0;
    uint64_t v10 = 0;
    double v11 = &v10;
    uint64_t v12 = 0x2020000000;
    char v13 = 0;
    int v5 = objc_msgSend((id)objc_msgSend((id)v2, "imageLayout"), "isDynamicallyChangingImageAdjustments");
    id v6 = (void *)[*(id *)(a1 + 32) imageInfo];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __38__TSDImageRep_processChangedProperty___block_invoke_2;
    v8[3] = &unk_2646B18D0;
    BOOL v9 = v3;
    v8[4] = *(void *)(a1 + 32);
    v8[5] = &v14;
    v8[6] = &v10;
    [v6 performBlockWithTemporaryLayout:v8];
    if (!*((unsigned char *)v11 + 24))
    {
      if (v3)
      {
        char v7 = v5 ^ 1;
        if (!v4) {
          char v7 = 1;
        }
        if (*((unsigned char *)v15 + 24) && (v7 & 1) != 0) {
          goto LABEL_10;
        }
      }
      else if (!v4 || ((v5 ^ 1) & 1) != 0)
      {
        goto LABEL_10;
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "p_invalidateSizedImageFromQueue");
LABEL_10:
    _Block_object_dispose(&v10, 8);
    _Block_object_dispose(&v14, 8);
  }
}

void __38__TSDImageRep_processChangedProperty___block_invoke_2(uint64_t a1)
{
  objc_opt_class();
  uint64_t v2 = (void *)TSUDynamicCast();
  if ([v2 maskLayout]
    && !objc_msgSend((id)objc_msgSend((id)objc_msgSend(v2, "maskLayout"), "pathSource"), "isRectangular")
    || (uint64_t v3 = objc_msgSend((id)objc_msgSend(v2, "imageInfo"), "instantAlphaPath")) != 0)
  {
    LOBYTE(v3) = [v2 maskIntersectsImage];
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) && *(unsigned char *)(a1 + 56))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    if (!*(void *)(v4 + 744) && ![*(id *)(v4 + 680) maskPath])
    {
      int v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v6 = [NSString stringWithUTF8String:"-[TSDImageRep processChangedProperty:]_block_invoke_2"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageRep.m"), 910, @"Need some mask path if comparing masks");
    }
    uint64_t v7 = *(void *)(a1 + 32);
    if (*(void *)(v7 + 704))
    {
      uint64_t v8 = *(void *)(v7 + 728);
    }
    else
    {
      uint64_t v8 = objc_msgSend((id)objc_msgSend((id)v7, "p_validatedBitmapImageProvider"), "orientation");
      uint64_t v7 = *(void *)(a1 + 32);
    }
    BOOL v9 = +[TSDImageRep p_newPathToBakeIntoSizedImageForSize:withImageLayout:orientation:](TSDImageRep, "p_newPathToBakeIntoSizedImageForSize:withImageLayout:orientation:", v2, v8, *(double *)(v7 + 712), *(double *)(v7 + 720));
    if (!v9)
    {
      uint64_t v10 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v11 = [NSString stringWithUTF8String:"-[TSDImageRep processChangedProperty:]_block_invoke_2"];
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageRep.m"), 914, @"invalid nil value for '%s'", "newBakingMaskPath");
    }
    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v13 = *(void *)(v12 + 744);
    if (!v13) {
      uint64_t v13 = [*(id *)(v12 + 680) maskPath];
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = ![+[TSDBezierPath bezierPathWithCGPath:](TSDBezierPath, "bezierPathWithCGPath:", v13) isEqual:+[TSDBezierPath bezierPathWithCGPath:v9]];
    CGPathRelease(v9);
  }
}

- (void)updateFromLayout
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v24.receiver = self;
  v24.super_class = (Class)TSDImageRep;
  [(TSDRep *)&v24 updateFromLayout];
  if ([(TSDCanvas *)[(TSDRep *)self canvas] isCanvasInteractive]
    && ![(TSDInteractiveCanvasController *)[(TSDRep *)self interactiveCanvasController] isInDynamicOperation])
  {
    id v3 = [(TSDImageRep *)self imageLayout];
    uint64_t v4 = [v3 maskLayout];
    memset(&v23, 0, sizeof(v23));
    if (v3) {
      [v3 layoutToImageTransform];
    }
    int v5 = (void *)[v3 imageGeometryInRoot];
    uint64_t v6 = (void *)[(id)v4 geometryInRoot];
    CGAffineTransform t1 = v23;
    long long v7 = *(_OWORD *)&self->mLastLayoutToImageTransform.b;
    *(_OWORD *)&t2.a = *(_OWORD *)&self->mLastMaskGeometryInRoot;
    *(_OWORD *)&t2.c = v7;
    *(_OWORD *)&t2.tdouble x = *(_OWORD *)&self->mLastLayoutToImageTransform.d;
    BOOL v8 = CGAffineTransformEqualToTransform(&t1, &t2);
    if (v4
      && (([v5 isEqual:*(void *)&self->super.mLastPictureFrameLayerRect.size.height] & 1) == 0
        ? (LOBYTE(v4) = [v5 differsInMoreThanTranslationFrom:*(void *)&self->super.mLastPictureFrameLayerRect.size.height]): (LOBYTE(v4) = 0), (objc_msgSend(v6, "isEqual:", self->mLastImageGeometryInRoot) & 1) == 0))
    {
      int v9 = [v6 differsInMoreThanTranslationFrom:self->mLastImageGeometryInRoot];
      if (!v8)
      {
LABEL_15:
        [(TSDStyledRep *)self setNeedsDisplay];
        LOBYTE(self->mFrameInUnscaledCanvasRelativeToSuper.size.height) = 0;
        [(TSDRep *)self invalidateKnobPositions];
LABEL_16:

        *(void *)&self->super.mLastPictureFrameLayerRect.size.height = [v5 copy];
        self->mLastImageGeometryInRoot = (TSDLayoutGeometry *)[v6 copy];
        long long v10 = *(_OWORD *)&v23.tx;
        long long v11 = *(_OWORD *)&v23.a;
        *(_OWORD *)&self->mLastLayoutToImageTransform.b = *(_OWORD *)&v23.c;
        *(_OWORD *)&self->mLastLayoutToImageTransform.d = v10;
        *(_OWORD *)&self->mLastMaskGeometryInRoot = v11;
        goto LABEL_17;
      }
    }
    else
    {
      int v9 = 0;
      if (!v8) {
        goto LABEL_15;
      }
    }
    if ((v4 & 1) == 0 && !v9) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_17:
  dispatch_semaphore_wait(&self->mUpdateFromLayoutBlocks->super.super, 0xFFFFFFFFFFFFFFFFLL);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  mHitTestCacheOnce = (void *)self->mHitTestCacheOnce;
  uint64_t v13 = [mHitTestCacheOnce countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(mHitTestCacheOnce);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v17 + 1) + 8 * i) + 16))();
      }
      uint64_t v14 = [mHitTestCacheOnce countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v14);
  }
  [self->mHitTestCacheOnce removeAllObjects];
  dispatch_semaphore_signal(&self->mUpdateFromLayoutBlocks->super.super);
}

- (void)layoutInRootChangedFrom:(id)a3 to:(id)a4 translatedOnly:(BOOL)a5
{
  v7.receiver = self;
  v7.super_class = (Class)TSDImageRep;
  -[TSDRep layoutInRootChangedFrom:to:translatedOnly:](&v7, sel_layoutInRootChangedFrom_to_translatedOnly_, a3, a4);
  if (!a5) {
    LOBYTE(self->mFrameInUnscaledCanvasRelativeToSuper.size.height) = 0;
  }
}

- (id)overlayLayers
{
  v26.receiver = self;
  v26.super_class = (Class)TSDImageRep;
  id v3 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithArray:", -[TSDMediaRep overlayLayers](&v26, sel_overlayLayers));
  uint64_t v4 = [(TSDRep *)self interactiveCanvasController];
  if (BYTE1(self->mLastPictureFrameLayerTransform.ty))
  {
    int v5 = v4;
    id v6 = objc_alloc_init(MEMORY[0x263F15880]);
    DeviceRGB = (CGColor *)TSUCGColorCreateDeviceRGB();
    [v6 setFillColor:DeviceRGB];
    CGColorRelease(DeviceRGB);
    [v6 setLineWidth:1.0];
    [v6 setStrokeColor:0];
    [(TSDCanvas *)self->super.super.super.mCanvas viewScale];
    CGFloat v9 = v8;
    [(TSDImageRep *)self boundsForStandardKnobs];
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    memset(&v25, 0, sizeof(v25));
    long long v18 = [(TSDRep *)self layout];
    if (v18) {
      [(TSDAbstractLayout *)v18 transformInRoot];
    }
    else {
      memset(&v25, 0, sizeof(v25));
    }
    CGAffineTransformMakeScale(&t2, v9, v9);
    CGAffineTransform v22 = v25;
    CGAffineTransformConcat(&v24, &v22, &t2);
    CGAffineTransform v25 = v24;
    [(TSDCanvas *)[(TSDRep *)self canvas] contentsScale];
    long long v20 = TSDCreateAADefeatedRectPath((uint64_t)&v25, v11, v13, v15, v17, 1.0, v19);
    [v6 setPath:v20];
    CGPathRelease(v20);
    [v6 setDelegate:v5];
    [v3 addObject:v6];
  }
  return v3;
}

- (id)hitRepChrome:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v9.receiver = self;
  v9.super_class = (Class)TSDImageRep;
  id v6 = -[TSDRep hitRepChrome:](&v9, sel_hitRepChrome_);
  if ([(TSDCanvas *)[(TSDRep *)self canvas] isCanvasInteractive])
  {
    if ([(TSDRep *)self isSelected]
      && [(TSDImageRep *)self shouldShowMediaReplaceUI]
      && (-[TSDRep convertNaturalPointToUnscaledCanvas:](self, "convertNaturalPointToUnscaledCanvas:", x, y),
          -[TSDMediaRep replaceButtonContainsPoint:](self, "replaceButtonContainsPoint:")))
    {
      return self;
    }
    else if ([(TSDRep *)self shouldDisplayHyperlinkUI])
    {
      id v7 = [(TSDRep *)self knobForTag:33];
      -[TSDRep convertNaturalPointToUnscaledCanvas:](self, "convertNaturalPointToUnscaledCanvas:", x, y);
      if (objc_msgSend(v7, "isHitByUnscaledPoint:andRep:", self)) {
        return self;
      }
    }
  }
  return v6;
}

- (BOOL)wantsToDistortWithImagerContext
{
  if (TSUPhoneUI())
  {
    TSUScreenScale();
    if (v3 == 1.0) {
      return 1;
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)TSDImageRep;
  return [(TSDRep *)&v5 wantsToDistortWithImagerContext];
}

- (CGRect)boundsForStandardKnobs
{
  if (objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "maskEditMode") == 3)
  {
    objc_msgSend((id)objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "imageGeometry"), "size");
    double v3 = TSDRectWithSize();
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)TSDImageRep;
    [(TSDRep *)&v7 boundsForStandardKnobs];
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (CGPoint)positionOfStandardKnob:(id)a3 forBounds:(CGRect)a4
{
  v19.receiver = self;
  v19.super_class = (Class)TSDImageRep;
  -[TSDRep positionOfStandardKnob:forBounds:](&v19, sel_positionOfStandardKnob_forBounds_, a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  double v14 = v6;
  double v15 = v5;
  if (objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "maskEditMode") == 3
    && ([(TSDLayout *)[(TSDRep *)self layout] layoutState] != 4
     || objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "isInMaskScaleMode")))
  {
    id v7 = [(TSDImageRep *)self imageLayout];
    if (v7)
    {
      [v7 layoutToImageTransform];
      float64x2_t v8 = v16;
      float64x2_t v9 = v17;
      float64x2_t v10 = v18;
    }
    else
    {
      float64x2_t v10 = 0uLL;
      float64x2_t v8 = 0uLL;
      float64x2_t v9 = 0uLL;
    }
    float64x2_t v11 = vaddq_f64(v10, vmlaq_n_f64(vmulq_n_f64(v9, v14), v8, v15));
    double v14 = v11.f64[1];
    double v15 = v11.f64[0];
  }
  double v13 = v14;
  double v12 = v15;
  result.double y = v13;
  result.double x = v12;
  return result;
}

- (CGRect)boundsForHighlightLayer
{
  if (objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "maskEditMode") == 3)
  {
    float64x2_t v10 = self;
    double v3 = &selRef_boundsForStandardKnobs;
    double v4 = &v10;
  }
  else
  {
    float64x2_t v9 = self;
    double v3 = &selRef_boundsForHighlightLayer;
    double v4 = &v9;
  }
  v4[1] = (TSDImageRep *)TSDImageRep;
  objc_msgSendSuper2((objc_super *)v4, *v3, v9);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.double y = v6;
  result.origin.double x = v5;
  return result;
}

- (CGAffineTransform)transformForHighlightLayer
{
  if (!self->super.super.super.mKnobTracker
    || objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "maskEditMode") == 3)
  {
    CGRect result = [(TSDRep *)self layout];
    if (result)
    {
      return (CGAffineTransform *)[(CGAffineTransform *)result transformInRoot];
    }
LABEL_11:
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tdouble x = 0u;
    *(_OWORD *)&retstr->a = 0u;
    return result;
  }
  CGRect result = (CGAffineTransform *)self->super.super.super.mKnobTracker;
  if (!result) {
    goto LABEL_11;
  }

  return (CGAffineTransform *)[(CGAffineTransform *)result transformInRootForStandardKnobs];
}

- (BOOL)shouldAllowReplacementFromPaste
{
  if (objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "isInMaskEditMode")) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)TSDImageRep;
  return [(TSDMediaRep *)&v4 shouldAllowReplacementFromPaste];
}

- (BOOL)isDraggable
{
  return 1;
}

- (BOOL)shouldShowDragHUD
{
  return objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "isInMaskEditMode") ^ 1;
}

- (CGPoint)centerForRotation
{
  if (objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "isInMaskEditMode"))
  {
    id v3 = [(TSDImageRep *)self imageLayout];
    [v3 centerForRotationInMaskMode];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)TSDImageRep;
    [(TSDRep *)&v6 centerForRotation];
  }
  result.double y = v5;
  result.double x = v4;
  return result;
}

- (id)contentsLayer
{
  id result = *(id *)&self->mFrameInUnscaledCanvasIsValid;
  if (!result)
  {
    double v4 = [(TSDRep *)self interactiveCanvasController];
    return [(TSDInteractiveCanvasController *)v4 layerForRep:self];
  }
  return result;
}

- (void)drawInLayerContext:(CGContext *)a3
{
  LOWORD(v3) = 0;
  -[TSDImageRep p_drawInContext:withContent:withStroke:withOpacity:withMask:withIAMask:forLayer:forShadow:forHitTest:](self, "p_drawInContext:withContent:withStroke:withOpacity:withMask:withIAMask:forLayer:forShadow:forHitTest:", a3, 1, 1, 1, 1, 1, 1.0, v3);
}

- (void)drawInContextWithoutEffects:(CGContext *)a3 withContent:(BOOL)a4 withStroke:(BOOL)a5 withOpacity:(BOOL)a6 forAlphaOnly:(BOOL)a7 drawChildren:(BOOL)a8
{
  BOOL v9 = a5;
  BOOL v10 = a4;
  double v13 = 1.0;
  if (a6) {
    [(TSDStyledRep *)self opacity];
  }
  LOWORD(v14) = a7;
  -[TSDImageRep p_drawInContext:withContent:withStroke:withOpacity:withMask:withIAMask:forLayer:forShadow:forHitTest:](self, "p_drawInContext:withContent:withStroke:withOpacity:withMask:withIAMask:forLayer:forShadow:forHitTest:", a3, v10, v9, 1, 1, 0, v13, v14);
}

- (id)imageOfStroke:(CGRect *)a3
{
  double v5 = *MEMORY[0x263F001A8];
  double v6 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v7 = *(double *)(MEMORY[0x263F001A8] + 16);
  CGFloat v8 = *(double *)(MEMORY[0x263F001A8] + 24);
  id v9 = [(TSDLayout *)[(TSDRep *)self layout] stroke];
  if (v9 && (BOOL v10 = v9, [v9 shouldRender]))
  {
    id v11 = [(TSDImageRep *)self imageLayout];
    objc_msgSend((id)objc_msgSend(v11, "imageGeometry"), "size");
    if ([v11 pathToStroke])
    {
      TSDPathBoundsIncludingStroke((CGPathRef)[v11 pathToStroke], v10);
      double v5 = v12;
      double v6 = v13;
      double v7 = v14;
      CGFloat v8 = v15;
    }
    else
    {
      v26.origin.double x = TSDRectWithSize();
      float64x2_t v17 = CGPathCreateWithRect(v26, 0);
      TSDPathBoundsIncludingStroke(v17, v10);
      double v5 = v18;
      double v6 = v19;
      double v7 = v20;
      CGFloat v8 = v21;
      CGPathRelease(v17);
    }
    CGAffineTransform v22 = TSDBitmapContextCreate(11, v7);
    CGContextTranslateCTM(v22, -fmax(v5, 0.0), -fmax(v6, 0.0));
    LOWORD(v25) = 0;
    -[TSDImageRep p_drawInContext:withContent:withStroke:withOpacity:withMask:withIAMask:forLayer:forShadow:forHitTest:](self, "p_drawInContext:withContent:withStroke:withOpacity:withMask:withIAMask:forLayer:forShadow:forHitTest:", v22, 0, 1, 0, 0, 0, 1.0, v25);
    Image = CGBitmapContextCreateImage(v22);
    float64x2_t v16 = (void *)[MEMORY[0x263F7C858] imageWithCGImage:Image];
    CGContextRelease(v22);
    CGImageRelease(Image);
  }
  else
  {
    float64x2_t v16 = 0;
  }
  a3->origin.double x = v5;
  a3->origin.double y = v6;
  a3->size.width = v7;
  a3->size.height = v8;
  return v16;
}

- (BOOL)canDrawInParallel
{
  return 1;
}

- (void)p_drawInContext:(CGContext *)a3 withContent:(BOOL)a4 withStroke:(BOOL)a5 withOpacity:(double)a6 withMask:(BOOL)a7 withIAMask:(BOOL)a8 forLayer:(BOOL)a9 forShadow:(BOOL)a10 forHitTest:(BOOL)a11
{
  BOOL v11 = a9;
  BOOL v12 = a8;
  BOOL v13 = a7;
  BOOL v15 = a5;
  BOOL v16 = a4;
  if (objc_msgSend(-[TSDStyledRep styledLayout](self, "styledLayout"), "isInvisible")) {
    return;
  }
  int v19 = objc_msgSend((id)objc_msgSend(MEMORY[0x263EFFA40], "standardUserDefaults"), "BOOLForKey:", @"TSDSuppressImageInterpolation");
  if (v11 && v19) {
    CGContextSetInterpolationQuality(a3, kCGInterpolationNone);
  }
  [(TSDMediaRep *)self i_updateFrameRep];
  double v20 = [(TSDLayout *)[(TSDRep *)self layout] stroke];
  double v21 = v20;
  BOOL v93 = v11;
  if (v20)
  {
    if ([(TSDStroke *)v20 shouldRender])
    {
      if ([(TSDCanvas *)[(TSDRep *)self canvas] shouldSuppressBackgrounds]
        && ![(TSDStroke *)v21 isFrame])
      {
        double v21 = (TSDStroke *)(id)[(TSDStroke *)v21 mutableCopy];
        -[TSDStroke setColor:](v21, "setColor:", [MEMORY[0x263F7C808] blackColor]);
      }
      if (v21
        && a11
        && ![(TSDStroke *)v21 isFrame]
        && ![(TSDStroke *)v21 prefersToApplyToShapeRenderableDuringManipulation])
      {
        v94 = [TSDStroke alloc];
        uint64_t v92 = [(TSDStroke *)v21 color];
        [(TSDStroke *)v21 width];
        double v23 = v22;
        unsigned int v91 = [(TSDStroke *)v21 cap];
        uint64_t v24 = [(TSDStroke *)v21 join];
        uint64_t v25 = [(TSDStroke *)v21 pattern];
        [(TSDStroke *)v21 miterLimit];
        double v21 = [(TSDStroke *)v94 initWithColor:v92 width:v91 cap:v24 join:v25 pattern:v23 miterLimit:v26];
      }
    }
    else
    {
      double v21 = 0;
    }
  }
  BOOL v27 = a6 < 1.0 && v15;
  int v28 = v27 && v16;
  if (v27 && v16 && (CGContextSaveGState(a3), CGContextSetAlpha(a3, a6), v21))
  {
    CGContextBeginTransparencyLayer(a3, 0);
    int v95 = 1;
  }
  else
  {
    int v95 = 0;
  }
  CGContextSaveGState(a3);
  id v29 = [(TSDImageRep *)self imageLayout];
  objc_msgSend((id)objc_msgSend(v29, "imageGeometry"), "size");
  double v30 = TSDRectWithSize();
  double v32 = v31;
  double v34 = v33;
  double v36 = v35;
  if (v16)
  {
    uint64_t v37 = [v29 maskLayout];
    if (!v13) {
      goto LABEL_38;
    }
    v38 = (void *)v37;
    if (!self->super.mFrameMaskLayer || ![(TSDStroke *)v21 hasMask])
    {
LABEL_34:
      if (v38)
      {
        memset(&v111, 0, sizeof(v111));
        if (v29) {
          [v29 layoutToMaskTransform];
        }
        [v38 pathBounds];
        CGAffineTransform v108 = v111;
        CGAffineTransformTranslate(&transform, &v108, -v51, -v52);
        CGAffineTransform v111 = transform;
        v53 = +[TSDBezierPath bezierPathWithCGPath:](TSDBezierPath, "bezierPathWithCGPath:", [v38 path]);
        CGAffineTransform transform = v111;
        [(TSDBezierPath *)v53 transformUsingAffineTransform:&transform];
        CGContextAddPath(a3, (CGPathRef)objc_msgSend(-[TSDBezierPath aliasedPathInContext:effectiveStrokeWidth:](v53, "aliasedPathInContext:effectiveStrokeWidth:", a3, 0.0), "CGPath"));
        CGContextClip(a3);
      }
LABEL_38:
      if (objc_msgSend(-[TSDImageRep imageInfo](self, "imageInfo"), "instantAlphaPath") && v12)
      {
        id v54 = (id)objc_msgSend((id)objc_msgSend(-[TSDImageRep imageInfo](self, "imageInfo"), "instantAlphaPath"), "copy");
        id v55 = [(TSDImageRep *)self imageLayout];
        if (v55) {
          [v55 imageDataToVisualSizeTransform];
        }
        else {
          memset(v107, 0, sizeof(v107));
        }
        [v54 transformUsingAffineTransform:v107];
        id v56 = [(TSDImageRep *)self imageLayout];
        if (v56) {
          [v56 layoutToImageTransform];
        }
        else {
          memset(v106, 0, sizeof(v106));
        }
        [v54 transformUsingAffineTransform:v106];
        CGContextAddPath(a3, (CGPathRef)objc_msgSend((id)objc_msgSend(v54, "aliasedPathInContext:effectiveStrokeWidth:", a3, 0.0), "CGPath"));
        CGContextClip(a3);
      }
      if (v29) {
        [v29 layoutToImageTransform];
      }
      else {
        memset(&v105, 0, sizeof(v105));
      }
      CGContextConcatCTM(a3, &v105);
      CGContextSaveGState(a3);
      if (v13 && self->super.mFrameMaskLayer && [(TSDStroke *)v21 hasMask]) {
        [(CALayer *)self->super.mFrameMaskLayer blendMaskBeforeRenderingImageInContext:a3];
      }
      v111.a = 0.0;
      *(void *)&v111.b = &v111;
      *(_OWORD *)&v111.c = 0x2020000000uLL;
      transform.a = 0.0;
      *(void *)&transform.b = &transform;
      *(void *)&transform.c = 0x2020000000;
      transform.d = 0.0;
      v108.a = 0.0;
      *(void *)&v108.b = &v108;
      *(void *)&v108.c = 0x2020000000;
      LOBYTE(v108.d) = 0;
      v57 = *(NSObject **)&self->mSizingStateReady;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __116__TSDImageRep_p_drawInContext_withContent_withStroke_withOpacity_withMask_withIAMask_forLayer_forShadow_forHitTest___block_invoke;
      block[3] = &unk_2646B18F8;
      block[4] = self;
      void block[5] = &v111;
      block[6] = &transform;
      block[7] = &v108;
      dispatch_sync(v57, block);
      if ((a10 || a11) && ([v29 hasAlpha] & 1) == 0)
      {
        CGContextSetRGBFillColor(a3, 0.0, 0.0, 0.0, 1.0);
        v115.origin.CGFloat x = v30;
        v115.origin.CGFloat y = v32;
        v115.size.CGFloat width = v34;
        v115.size.CGFloat height = v36;
        CGContextFillRect(a3, v115);
LABEL_79:
        v73 = *(CGImage **)(*(void *)&v111.b + 24);
        if (v73) {
          CGImageRelease(v73);
        }
        _Block_object_dispose(&v108, 8);
        _Block_object_dispose(&transform, 8);
        _Block_object_dispose(&v111, 8);
        CGContextRestoreGState(a3);
        goto LABEL_82;
      }
      if (*(void *)(*(void *)&v111.b + 24))
      {
        if (objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "isDynamicallyChangingImageAdjustments"))
        {
          CGImageRelease(*(CGImageRef *)(*(void *)&v111.b + 24));
          v58 = [(TSDImageRep *)self p_newImageByApplyingAdjustmentsToImage:*(void *)(*(void *)&v111.b + 24) alreadyEnhanced:*(unsigned __int8 *)(*(void *)&v108.b + 24)];
          *(void *)(*(void *)&v111.b + 24) = v58;
        }
        v112.origin.CGFloat x = v30;
        v112.origin.CGFloat y = v32;
        v112.size.CGFloat width = v34;
        v112.size.CGFloat height = v36;
        double MinY = CGRectGetMinY(v112);
        v113.origin.CGFloat x = v30;
        v113.origin.CGFloat y = v32;
        v113.size.CGFloat width = v34;
        v113.size.CGFloat height = v36;
        CGFloat MaxY = CGRectGetMaxY(v113);
        CGContextTranslateCTM(a3, 0.0, MinY + MaxY);
        CGContextScaleCTM(a3, 1.0, -1.0);
        TSUImageOrientationTransform();
        CGContextConcatCTM(a3, &v103);
        v114.origin.CGFloat x = v30;
        v114.origin.CGFloat y = v32;
        v114.size.CGFloat width = v34;
        v114.size.CGFloat height = v36;
        CGContextDrawImage(a3, v114, *(CGImageRef *)(*(void *)&v111.b + 24));
        goto LABEL_79;
      }
      BOOL v61 = [(TSDInteractiveCanvasController *)[(TSDCanvas *)[(TSDRep *)self canvas] canvasController] i_inPrintPreviewMode];
      int v62 = objc_msgSend(+[TSKApplicationDelegate sharedDelegate](TSKApplicationDelegate, "sharedDelegate"), "isInBackground");
      if (!v61
        && [(TSDCanvas *)[(TSDRep *)self canvas] isCanvasInteractive]
        && ([(TSDCanvas *)[(TSDRep *)self canvas] viewScale], v63 < 0.5)
        || v93 && self->mLayerUpdateAndSizingStateLock
        || (([(TSDCanvas *)[(TSDRep *)self canvas] isCanvasInteractive] | v62 ^ 1) & 1) == 0)
      {
        id v68 = [(TSDImageRep *)self p_validatedThumbnailImageProvider];
        if (v68)
        {
          v69 = (CGImage *)objc_msgSend(v68, "CGImageForSize:inContext:orLayer:", a3, 0, v34, v36);
          if (objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "isDynamicallyChangingImageAdjustments"))
          {
            v69 = [(TSDImageRep *)self p_newImageByApplyingAdjustmentsToImage:v69 alreadyEnhanced:0];
            v70 = v69;
          }
          v116.origin.CGFloat x = v30;
          v116.origin.CGFloat y = v32;
          v116.size.CGFloat width = v34;
          v116.size.CGFloat height = v36;
          double v71 = CGRectGetMinY(v116);
          v117.origin.CGFloat x = v30;
          v117.origin.CGFloat y = v32;
          v117.size.CGFloat width = v34;
          v117.size.CGFloat height = v36;
          CGFloat v72 = CGRectGetMaxY(v117);
          CGContextTranslateCTM(a3, 0.0, v71 + v72);
          CGContextScaleCTM(a3, 1.0, -1.0);
          TSUImageOrientationTransform();
          CGContextConcatCTM(a3, &v102);
          v118.origin.CGFloat x = v30;
          v118.origin.CGFloat y = v32;
          v118.size.CGFloat width = v34;
          v118.size.CGFloat height = v36;
          CGContextDrawImage(a3, v118, v69);
          goto LABEL_79;
        }
        id v67 = [(TSDImageRep *)self p_validatedImageProvider];
      }
      else
      {
        id v64 = [(TSDImageRep *)self p_validatedImageProvider];
        if (![v64 isError]
          || ![(TSDImageRep *)self p_validatedThumbnailImageProvider])
        {
          goto LABEL_78;
        }
        if ((objc_msgSend(-[TSDImageRep p_imageData](self, "p_imageData"), "isLengthLikelyToBeGreaterThan:", TSDImageMaxAllowedDataLength()) & 1) == 0)
        {
          v65 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
          uint64_t v66 = [NSString stringWithUTF8String:"-[TSDImageRep p_drawInContext:withContent:withStroke:withOpacity:withMask:withIAMask:forLayer:forShadow:forHitTest:]"];
          [v65 handleFailureInFunction:v66, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageRep.m"), 1993, @"Invalid image data %@! Rendering thumbnail data.", objc_msgSend(-[TSDImageRep p_imageData](self, "p_imageData"), "filename") file lineNumber description];
        }
        id v67 = [(TSDImageRep *)self p_validatedThumbnailImageProvider];
      }
      id v64 = v67;
LABEL_78:
      objc_msgSend(v64, "drawImageInContext:rect:", a3, v30, v32, v34, v36);
      goto LABEL_79;
    }
    if ([v29 hasMaskingPath])
    {
      TSDPathBoundsIncludingStroke((CGPathRef)[v29 pathToStroke], v21);
      double v40 = v39;
      double v42 = v41;
      double v44 = v43;
      double v46 = v45;
      if (v29)
      {
        [v29 layoutToMaskTransform];
LABEL_33:
        CGAffineTransform v111 = transform;
        CGContextConcatCTM(a3, &transform);
        -[CALayer applyMaskForRectWithCoverage:toContext:](self->super.mFrameMaskLayer, "applyMaskForRectWithCoverage:toContext:", a3, v40, v42, v44, v46);
        CGAffineTransform transform = v111;
        CGAffineTransformInvert(&v109, &transform);
        CGContextConcatCTM(a3, &v109);
        goto LABEL_34;
      }
    }
    else
    {
      -[TSDStroke coverageRect:](v21, "coverageRect:", v30, v32, v34, v36);
      double v40 = v47;
      double v42 = v48;
      double v44 = v49;
      double v46 = v50;
      if (v29)
      {
        [v29 layoutToImageTransform];
        goto LABEL_33;
      }
    }
    memset(&transform, 0, sizeof(transform));
    goto LABEL_33;
  }
LABEL_82:
  CGContextRestoreGState(a3);
  if (!v15 || !v21 || v93 && [(TSDImageRep *)self directlyManagesLayerContent]) {
    goto LABEL_113;
  }
  CGContextSaveGState(a3);
  if ([v29 pathToStroke])
  {
    v74 = (const CGPath *)[v29 pathToStroke];
    if (!v74) {
      goto LABEL_112;
    }
    v75 = v74;
    PathBoundingBoCGFloat x = CGPathGetPathBoundingBox(v74);
    CGFloat x = PathBoundingBox.origin.x;
    CGFloat y = PathBoundingBox.origin.y;
    CGFloat width = PathBoundingBox.size.width;
    CGFloat height = PathBoundingBox.size.height;
    if ([(TSDStroke *)v21 isFrame])
    {
      if ([v29 shouldRenderFrameStroke])
      {
        if (v29) {
          [v29 layoutToMaskTransform];
        }
        else {
          memset(&v101, 0, sizeof(v101));
        }
        CGContextConcatCTM(a3, &v101);
        mFrameMaskLayer = self->super.mFrameMaskLayer;
        CGContextGetCTM(&v100, a3);
        double v84 = TSDTransformScale(&v100.a);
        v85 = mFrameMaskLayer;
        double v86 = x;
        double v87 = y;
        double v88 = width;
        double v89 = height;
LABEL_111:
        -[CALayer frameRect:inContext:withTotalScale:](v85, "frameRect:inContext:withTotalScale:", a3, v86, v87, v88, v89, v84);
        goto LABEL_112;
      }
      goto LABEL_112;
    }
    if (v29) {
      [v29 layoutToMaskTransform];
    }
    else {
      memset(&v99, 0, sizeof(v99));
    }
    CGContextConcatCTM(a3, &v99);
    v80 = v21;
    uint64_t v81 = (uint64_t)v75;
LABEL_105:
    [(TSDStroke *)v80 paintPath:v81 inContext:a3];
    goto LABEL_112;
  }
  if (![(TSDStroke *)v21 isFrame])
  {
    if (v29) {
      [v29 layoutToImageTransform];
    }
    else {
      memset(&v96, 0, sizeof(v96));
    }
    CGContextConcatCTM(a3, &v96);
    uint64_t v82 = [v29 pathToStroke];
    if (!v82)
    {
      -[TSDStroke paintRect:inContext:](v21, "paintRect:inContext:", a3, v30, v32, v34, v36);
      goto LABEL_112;
    }
    uint64_t v81 = v82;
    v80 = v21;
    goto LABEL_105;
  }
  if ([v29 shouldRenderFrameStroke])
  {
    if (v29) {
      [v29 layoutToImageTransform];
    }
    else {
      memset(&v98, 0, sizeof(v98));
    }
    CGContextConcatCTM(a3, &v98);
    v90 = self->super.mFrameMaskLayer;
    CGContextGetCTM(&v97, a3);
    double v84 = TSDTransformScale(&v97.a);
    v85 = v90;
    double v86 = v30;
    double v87 = v32;
    double v88 = v34;
    double v89 = v36;
    goto LABEL_111;
  }
LABEL_112:
  CGContextRestoreGState(a3);
LABEL_113:
  if (v95) {
    CGContextEndTransparencyLayer(a3);
  }
  if (v28) {
    CGContextRestoreGState(a3);
  }
}

CGImage *__116__TSDImageRep_p_drawInContext_withContent_withStroke_withOpacity_withMask_withIAMask_forLayer_forShadow_forHitTest___block_invoke(void *a1)
{
  id result = *(CGImage **)(a1[4] + 704);
  if (result)
  {
    id result = CGImageRetain(result);
    *(void *)(*(void *)(a1[5] + 8) + 24) = result;
    *(void *)(*(void *)(a1[6] + 8) + 24) = *(void *)(a1[4] + 728);
    *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = *(unsigned char *)(a1[4] + 737);
  }
  return result;
}

- (void)addBitmapsToRenderingQualityInfo:(id)a3 inContext:(CGContext *)a4
{
  id v6 = [(TSDImageRep *)self p_validatedBitmapImageProvider];
  if (v6)
  {
    id v7 = v6;
    [(TSDImageRep *)self p_desiredSizedImageSize];
    objc_msgSend(a3, "cacheProvider:ofSize:", v7);
  }
}

- (void)didCreateLayer:(id)a3
{
  LOBYTE(self->mLastPictureFrameLayerTransform.ty) = [(TSDImageRep *)self p_directlyManagesContentForLayer:a3];
}

- (BOOL)directlyManagesLayerContent
{
  return LOBYTE(self->mLastPictureFrameLayerTransform.ty);
}

- (void)p_updateDirectlyManagesLayerContentForLayer:(id)a3
{
  int ty_low = LOBYTE(self->mLastPictureFrameLayerTransform.ty);
  BOOL v5 = [(TSDImageRep *)self p_directlyManagesContentForLayer:a3];
  LOBYTE(self->mLastPictureFrameLayerTransform.ty) = v5;
  if (!ty_low || v5)
  {
    if (ty_low) {
      BOOL v6 = 0;
    }
    else {
      BOOL v6 = v5;
    }
    if (v6 && [(TSDCanvas *)self->super.super.super.mCanvas isCanvasInteractive])
    {
      id v7 = [(TSDInteractiveCanvasController *)[(TSDRep *)self interactiveCanvasController] layerForRep:self];
      [v7 setContents:0];
    }
  }
  else
  {
    [(TSDStyledRep *)self setNeedsDisplay];
  }
}

- (CGImage)p_imageForDirectlyManagedLayer:(id)a3
{
  uint64_t v14 = 0;
  BOOL v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  uint64_t v10 = 0;
  BOOL v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 1;
  if ([(TSDCanvas *)[(TSDRep *)self canvas] isCanvasInteractive]
    && [(TSDInteractiveCanvasController *)[(TSDRep *)self interactiveCanvasController] shouldSuppressRendering])
  {
    BOOL v5 = 0;
  }
  else
  {
    BOOL v6 = *(NSObject **)&self->mSizingStateReady;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __46__TSDImageRep_p_imageForDirectlyManagedLayer___block_invoke;
    v9[3] = &unk_2646B1920;
    v9[4] = self;
    v9[5] = a3;
    v9[6] = &v14;
    v9[7] = &v10;
    dispatch_sync(v6, v9);
    int v7 = objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "isDynamicallyChangingImageAdjustments");
    BOOL v5 = (CGImage *)v15[3];
    if (v7)
    {
      BOOL v5 = [(TSDImageRep *)self p_newImageByApplyingAdjustmentsToImage:v5 alreadyEnhanced:*((unsigned __int8 *)v11 + 24)];
      v15[3] = (uint64_t)v5;
    }
  }
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);
  return v5;
}

void *__46__TSDImageRep_p_imageForDirectlyManagedLayer___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[88];
  if (v3)
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v3;
    id v4 = *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    return v4;
  }
  else
  {
    objc_msgSend(v2, "p_desiredSizedImageSize");
    double v7 = v6;
    double v9 = v8;
    id result = *(void **)(a1 + 32);
    if (result[85])
    {
      if (objc_msgSend(result, "p_validatedBitmapImageProvider") && (double v10 = v7 * v9, v7 * v9 < 4096.0 * 4096.0))
      {
        id result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "p_validatedBitmapImageProvider", v10), "CGImageForSize:inContext:orLayer:", 0, *(void *)(a1 + 40), v7, v9);
        *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
      }
      else
      {
        id result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "p_validatedThumbnailImageProvider", v10), "CGImageForSize:inContext:orLayer:", 0, *(void *)(a1 + 40), v7, v9);
        *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
        *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
      }
    }
    if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      id result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "p_validatedBitmapImageProvider"), "CGImageForSize:inContext:orLayer:", 0, *(void *)(a1 + 40), v7, v9);
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
      if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
      {
        id result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "p_validatedThumbnailImageProvider"), "CGImageForNaturalSize");
        *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
        *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
      }
    }
  }
  return result;
}

- (int64_t)p_orientationForDirectlyManagedLayer
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  uint64_t v7 = 0;
  double v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v3 = *(NSObject **)&self->mSizingStateReady;
  char v10 = 0;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__TSDImageRep_p_orientationForDirectlyManagedLayer__block_invoke;
  block[3] = &unk_2646B1948;
  block[4] = self;
  void block[5] = &v11;
  block[6] = &v7;
  dispatch_sync(v3, block);
  if (*((unsigned char *)v8 + 24))
  {
    int64_t v4 = v12[3];
  }
  else
  {
    int64_t v4 = objc_msgSend(-[TSDImageRep p_validatedBitmapImageProvider](self, "p_validatedBitmapImageProvider"), "orientation");
    v12[3] = v4;
  }
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v11, 8);
  return v4;
}

void *__51__TSDImageRep_p_orientationForDirectlyManagedLayer__block_invoke(uint64_t a1)
{
  id result = *(void **)(a1 + 32);
  if (result[88])
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result[91];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  else if (result[85])
  {
    id result = objc_msgSend((id)objc_msgSend(result, "imageInfo"), "naturalSize");
    if (v3 * v4 >= 4096.0 * 4096.0)
    {
      id result = objc_msgSend(*(id *)(a1 + 32), "p_validatedThumbnailImageProvider");
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result != 0;
    }
  }
  return result;
}

- (BOOL)p_directlyManagesContentForLayer:(id)a3
{
  double v4 = [(TSDImageRep *)self p_imageForDirectlyManagedLayer:a3];
  if (v4)
  {
    id v5 = [(TSDLayout *)[(TSDRep *)self layout] stroke];
    if (![v5 shouldRender]) {
      id v5 = 0;
    }
    if ([(TSDLayout *)[(TSDRep *)self layout] isStrokeBeingManipulated])
    {
      int v6 = [v5 prefersToApplyToShapeRenderableDuringManipulation];
      if (!v5) {
        goto LABEL_9;
      }
    }
    else
    {
      int v6 = 0;
      if (!v5)
      {
LABEL_9:
        LOBYTE(v4) = 1;
        return (char)v4;
      }
    }
    if (v6 & [v5 canApplyToShapeRenderable]) {
      goto LABEL_9;
    }
    LODWORD(v4) = [v5 prefersToApplyToShapeRenderableDuringManipulation];
    if (v4)
    {
      [(TSDStyledRep *)self opacity];
      if (v7 == 1.0)
      {
        LOBYTE(v4) = [v5 canApplyToShapeRenderable];
      }
      else
      {
        LOBYTE(v4) = 0;
      }
    }
  }
  return (char)v4;
}

- (CGImage)p_newImageByApplyingAdjustmentsToImage:(CGImage *)a3 alreadyEnhanced:(BOOL)a4
{
  BOOL v4 = a4;
  double v7 = objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "imageAdjustments");
  uint64_t v8 = (uint64_t)v7;
  uint64_t v14 = 0;
  if (v4)
  {
    uint64_t v8 = [v7 imageAdjustmentsWithoutEnhance];
LABEL_7:
    uint64_t v9 = 0;
    goto LABEL_8;
  }
  if (![v7 enhance]) {
    goto LABEL_7;
  }
  uint64_t v9 = (uint64_t *)objc_msgSend(-[TSDImageRep imageInfo](self, "imageInfo"), "enhancedImageData");
  if (v9)
  {
    objc_opt_class();
    objc_msgSend(+[TSDImageProviderPool sharedPool](TSDImageProviderPool, "sharedPool"), "temporaryProviderForData:shouldValidate:", v9, 1);
    char v10 = (void *)TSUDynamicCast();
    if (!v10) {
      goto LABEL_7;
    }
    uint64_t v14 = [v10 CGImageForNaturalSize];
    uint64_t v9 = &v14;
  }
LABEL_8:
  uint64_t v11 = [[TSDImageAdjuster alloc] initWithImageAdjustments:v8];
  uint64_t v12 = [(TSDImageAdjuster *)v11 newFilteredImageForImage:a3 enhancedImage:v9];

  return v12;
}

- (CGRect)frameInUnscaledCanvas
{
  v28.receiver = self;
  v28.super_class = (Class)TSDImageRep;
  [(TSDRep *)&v28 frameInUnscaledCanvas];
  double x = v3;
  double y = v5;
  CGFloat width = v7;
  CGFloat height = v9;
  id v11 = [(TSDImageRep *)self imageLayout];
  if ([v11 maskLayout] && objc_msgSend(v11, "pathToStroke"))
  {
    if (!LOBYTE(self->mFrameInUnscaledCanvasRelativeToSuper.size.height))
    {
      memset(&v27[1], 0, sizeof(CGAffineTransform));
      if (v11) {
        [v11 layoutToMaskTransform];
      }
      uint64_t v12 = (const CGPath *)[v11 pathToStroke];
      v27[0] = v27[1];
      uint64_t v13 = TSDCreateTransformedPath(v12, v27);
      TSDPathBoundsIncludingStroke(v13, [(TSDLayout *)[(TSDRep *)self layout] stroke]);
      CGFloat v15 = v14;
      CGFloat v17 = v16;
      CGFloat v19 = v18;
      CGFloat v21 = v20;
      CGPathRelease(v13);
      if (v11) {
        [v11 transformInRoot];
      }
      else {
        memset(&v26, 0, sizeof(v26));
      }
      v29.origin.double x = v15;
      v29.origin.double y = v17;
      v29.size.CGFloat width = v19;
      v29.size.CGFloat height = v21;
      CGRect v30 = CGRectApplyAffineTransform(v29, &v26);
      *(CGRect *)&self->mLastLayoutToImageTransform.tdouble y = CGRectOffset(v30, -x, -y);
      LOBYTE(self->mFrameInUnscaledCanvasRelativeToSuper.size.height) = 1;
    }
    CGRect v31 = CGRectOffset(*(CGRect *)&self->mLastLayoutToImageTransform.ty, x, y);
    double x = v31.origin.x;
    double y = v31.origin.y;
    CGFloat width = v31.size.width;
    CGFloat height = v31.size.height;
  }
  double v22 = x;
  double v23 = y;
  double v24 = width;
  double v25 = height;
  result.size.CGFloat height = v25;
  result.size.CGFloat width = v24;
  result.origin.double y = v23;
  result.origin.double x = v22;
  return result;
}

- (void)p_getAliasedValuesForMaskToBoundsDirectLayerFrame:(CGRect *)a3 transform:(CGAffineTransform *)a4
{
  double v7 = objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "pureGeometry");
  if (v7) {
    [v7 fullTransform];
  }
  else {
    memset(v19, 0, sizeof(v19));
  }
  uint64_t v8 = objc_msgSend(+[TSDLayoutGeometry geometryFromFullTransform:](TSDLayoutGeometry, "geometryFromFullTransform:", v19), "mutableCopy");
  memset(&v18, 0, sizeof(v18));
  double v9 = objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "imageGeometry");
  if (v9) {
    [v9 transform];
  }
  else {
    memset(&t1, 0, sizeof(t1));
  }
  char v10 = objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "pureGeometry");
  if (v10) {
    [v10 transform];
  }
  else {
    memset(&v15, 0, sizeof(v15));
  }
  CGAffineTransformInvert(&t2, &v15);
  CGAffineTransformConcat(&v18, &t1, &t2);
  memset(&v14, 0, sizeof(v14));
  id v11 = objc_msgSend((id)objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "maskLayout"), "pureGeometry");
  if (v11) {
    [v11 transform];
  }
  else {
    memset(&v13, 0, sizeof(v13));
  }
  CGAffineTransform v12 = v18;
  CGAffineTransformConcat(&v14, &v13, &v12);
  CGAffineTransform v12 = v14;
  [v8 transformBy:&v12];
  [(TSDRep *)self computeDirectLayerFrame:a3 andTransform:a4 basedOnLayoutGeometry:v8];
}

- (void)updateLayerGeometryFromLayout:(id)a3
{
  if ([(TSDImageRep *)self directlyManagesLayerContent])
  {
    uint64_t v5 = objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "imageGeometry");
    long long v11 = 0u;
    long long v12 = 0u;
    memset(&v10, 0, sizeof(v10));
    if ([(TSDImageRep *)self p_shouldRenderWithMaskToBounds])
    {
      [(TSDImageRep *)self p_getAliasedValuesForMaskToBoundsDirectLayerFrame:&v11 transform:&v10];
      CGAffineTransform v9 = v10;
      [(TSDRep *)self antiAliasDefeatLayerFrame:&v11 forTransform:&v9];
    }
    else
    {
      [(TSDRep *)self computeDirectLayerFrame:&v11 andTransform:&v10 basedOnLayoutGeometry:v5];
      [(TSDImageRep *)self p_orientationForDirectlyManagedLayer];
      memset(&v9, 0, sizeof(v9));
      TSUImageOrientationTransform();
      memset(&t1, 0, sizeof(t1));
      CGAffineTransform v6 = v10;
      CGAffineTransformConcat(&v8, &t1, &v6);
      CGAffineTransform v10 = v8;
      -[TSDRep antiAliasDefeatLayerTransform:forFrame:](self, "antiAliasDefeatLayerTransform:forFrame:", &v10, v11, v12);
    }
    CGAffineTransform v9 = v10;
    objc_msgSend(a3, "setIfDifferentFrame:orTransform:", &v9, v11, v12);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)TSDImageRep;
    [(TSDRep *)&v13 updateLayerGeometryFromLayout:a3];
  }
  [(TSDImageRep *)self p_invalidateHitTestCache];
}

- (void)willUpdateLayer:(id)a3
{
  [(TSDImageRep *)self p_generateSizedImageIfNecessary];
  [*(id *)&self->mBaseMaskLayoutTransform.ty lock];
  v31.receiver = self;
  v31.super_class = (Class)TSDImageRep;
  [(TSDStyledRep *)&v31 willUpdateLayer:a3];
  [(TSDImageRep *)self p_takeSizedImageFromStateIfReady];
  [(TSDImageRep *)self p_updateDirectlyManagesLayerContentForLayer:a3];
  uint64_t v27 = 0;
  objc_super v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  if (![(TSDImageRep *)self directlyManagesLayerContent]) {
    goto LABEL_28;
  }
  id v5 = [(TSDImageRep *)self imageLayout];
  CGAffineTransform v6 = *(NSObject **)&self->mSizingStateReady;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__TSDImageRep_willUpdateLayer___block_invoke;
  block[3] = &unk_2646B11F0;
  void block[5] = self;
  block[6] = &v27;
  block[4] = v5;
  dispatch_sync(v6, block);
  if (*((unsigned char *)v28 + 24)) {
    [(TSDImageRep *)self p_createMaskLayerForLayer:a3];
  }
  id v7 = [(TSDLayout *)[(TSDRep *)self layout] stroke];
  CGAffineTransform v8 = v7;
  if (v7
    && [v7 shouldRender]
    && (![v8 isFrame] || objc_msgSend(v5, "shouldRenderFrameStroke")))
  {
    int v9 = [v8 isFrame];
    if (v9 && [v8 hasMask])
    {
      int v10 = [v5 shouldRenderFrameStroke];
      char v11 = v10;
      if (*((unsigned char *)v28 + 24)) {
        int v12 = 0;
      }
      else {
        int v12 = v10;
      }
      if (v12 == 1)
      {
        char v11 = 1;
        *((unsigned char *)v28 + 24) = 1;
        [(TSDImageRep *)self p_createMaskLayerForLayer:a3];
      }
    }
    else
    {
      char v11 = 0;
    }
    if (!self->super.mMaskLayer)
    {
      CGAffineTransform v14 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x263F15880]);
      self->super.mMaskLayer = v14;
      [(CAShapeLayer *)v14 setDelegate:self];
      [(CAShapeLayer *)self->super.mMaskLayer setFillColor:0];
      if (v9)
      {
        mStrokeLayer = self->super.mStrokeLayer;
        if (mStrokeLayer)
        {
          [(CAShapeLayer *)mStrokeLayer removeFromSuperlayer];
          self->super.mStrokeLayer = 0;
        }
        [(TSDMediaRep *)self i_updateFrameRep];
        [(TSDCanvas *)[(TSDRep *)self canvas] contentsScale];
        double v17 = v16;
        mFrameMaskLayer = self->super.mFrameMaskLayer;
        mMaskLayer = self->super.mMaskLayer;
        mTapToReplaceLayer = self->super.mTapToReplaceLayer;
        [(TSDCanvas *)[(TSDRep *)self canvas] viewScale];
        self->super.mStrokeLayer = (CAShapeLayer *)[(CALayer *)mFrameMaskLayer applyToCALayer:mMaskLayer withRepLayer:a3 maskLayer:mTapToReplaceLayer viewScale:v17 * v21];
        long long v22 = *(_OWORD *)(MEMORY[0x263F001A8] + 16);
        *(_OWORD *)&self->super.mFrameRep = *MEMORY[0x263F001A8];
        *(_OWORD *)&self->super.mLastPictureFrameLayerRect.origin.double y = v22;
        uint64_t v23 = MEMORY[0x263F000D0];
        long long v24 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
        *(_OWORD *)&self->mMaskSublayer = *MEMORY[0x263F000D0];
        *(_OWORD *)&self->mLastPictureFrameLayerTransform.b = v24;
        *(_OWORD *)&self->mLastPictureFrameLayerTransform.d = *(_OWORD *)(v23 + 32);
      }
    }
    char v13 = 1;
  }
  else
  {
    char v13 = 0;
    char v11 = 0;
  }
  if (*((unsigned char *)v28 + 24))
  {
    if ((v11 & 1) == 0)
    {
      double v25 = self->super.mStrokeLayer;
      if (v25)
      {
        [(CAShapeLayer *)v25 removeFromSuperlayer];
        self->super.mStrokeLayer = 0;
      }
    }
  }
  if ((v13 & 1) == 0) {
LABEL_28:
  }
    [(TSDImageRep *)self p_disposeStrokeLayer];
  if (!*((unsigned char *)v28 + 24)) {
    [(TSDImageRep *)self p_disposeMaskLayer];
  }
  _Block_object_dispose(&v27, 8);
}

uint64_t __31__TSDImageRep_willUpdateLayer___block_invoke(uint64_t a1)
{
  BOOL v3 = ([*(id *)(a1 + 32) maskLayout]
     || (uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "imageInfo"), "instantAlphaPath")) != 0)
    && ((uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "imageLayout"), "isInMaskEditMode"), (result & 1) != 0)
     || (uint64_t result = objc_msgSend(*(id *)(a1 + 40), "p_shouldRenderWithMaskToBounds"), (result & 1) == 0))
    && *(unsigned char *)(*(void *)(a1 + 40) + 736) == 0;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v3;
  return result;
}

- (void)didUpdateLayer:(id)a3
{
  v115.receiver = self;
  v115.super_class = (Class)TSDImageRep;
  -[TSDStyledRep didUpdateLayer:](&v115, sel_didUpdateLayer_);
  id v5 = [(TSDImageRep *)self imageLayout];
  id v6 = [(TSDImageRep *)self maskLayout];
  if (![(TSDImageRep *)self p_shouldRenderWithMaskToBounds])
  {
    id v7 = *(void **)&self->mFrameInUnscaledCanvasIsValid;
    if (v7)
    {
      [v7 removeFromSuperlayer];

      *(void *)&self->mFrameInUnscaledCanvasIsValid = 0;
      [a3 setMasksToBounds:0];
    }
  }
  if ([(TSDImageRep *)self directlyManagesLayerContent])
  {
    [MEMORY[0x263F158F8] begin];
    [MEMORY[0x263F158F8] setDisableActions:1];
    uint64_t v109 = 0;
    v110 = &v109;
    uint64_t v111 = 0x3052000000;
    CGRect v112 = __Block_byref_object_copy__12;
    CGRect v113 = __Block_byref_object_dispose__12;
    CGRect v114 = 0;
    CGRect v114 = [(TSDImageRep *)self p_imageForDirectlyManagedLayer:a3];
    CGAffineTransform v8 = *(NSObject **)&self->mSizingStateReady;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __30__TSDImageRep_didUpdateLayer___block_invoke;
    block[3] = &unk_2646B0880;
    block[4] = self;
    void block[5] = &v109;
    dispatch_sync(v8, block);
    uint64_t v9 = [a3 contents];
    if (v9 != v110[5]) {
      objc_msgSend(a3, "setContents:");
    }
    int v10 = objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "imageGeometryInRoot");
    if (v10) {
      [v10 transform];
    }
    else {
      memset(v107, 0, sizeof(v107));
    }
    if (TSDIsTransformAxisAligned((double *)v107))
    {
      if ([a3 edgeAntialiasingMask]) {
        [a3 setEdgeAntialiasingMask:0];
      }
    }
    else if ([a3 edgeAntialiasingMask] != 15)
    {
      [a3 setEdgeAntialiasingMask:15];
    }
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x263EFFA40], "standardUserDefaults"), "BOOLForKey:", @"TSDSuppressImageInterpolation"))char v11 = @"nearest"; {
    else
    }
      char v11 = @"linear";
    [a3 setMagnificationFilter:v11];
    id v12 = [(TSDLayout *)[(TSDRep *)self layout] stroke];
    char v13 = v12;
    if (v12
      && [v12 shouldRender]
      && (![v13 isFrame] || objc_msgSend(v5, "shouldRenderFrameStroke")))
    {
      [(TSDImageRep *)self p_updateStrokeLayerForStroke:v13 repLayer:a3];
    }
    if (!v6 && !objc_msgSend(-[TSDImageRep imageInfo](self, "imageInfo"), "instantAlphaPath")) {
      goto LABEL_67;
    }
    if ([(TSDImageRep *)self p_shouldRenderWithMaskToBounds])
    {
      if (!*(void *)&self->mFrameInUnscaledCanvasIsValid) {
        *(void *)&self->mFrameInUnscaledCanvasIsValid = objc_alloc_init(MEMORY[0x263F157E8]);
      }
      if ((objc_msgSend((id)objc_msgSend(a3, "sublayers"), "containsObject:", *(void *)&self->mFrameInUnscaledCanvasIsValid) & 1) == 0)objc_msgSend(a3, "addSublayer:", *(void *)&self->mFrameInUnscaledCanvasIsValid); {
      [a3 setMasksToBounds:1];
      }
      [*(id *)&self->mFrameInUnscaledCanvasIsValid setContents:v110[5]];
      [a3 setContents:0];
      [(TSDRep *)self scaleToConvertNaturalToLayerRelative];
      double v85 = v14;
      objc_msgSend((id)objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "imageGeometry"), "size");
      double v16 = v15;
      double v18 = v17;
      [(TSDImageRep *)self p_orientationForDirectlyManagedLayer];
      TSDMultiplySizeScalar(v16, v18, v85);
      double v19 = TSDRectWithSize();
      CGFloat v21 = v20;
      CGFloat v23 = v22;
      CGFloat v25 = v24;
      memset(&v106, 0, sizeof(v106));
      TSUImageOrientationTransform();
      memset(&v105, 0, sizeof(v105));
      v116.origin.CGFloat x = v19;
      v116.origin.CGFloat y = v21;
      v116.size.CGFloat width = v23;
      v116.size.CGFloat height = v25;
      CGRectApplyAffineTransform(v116, &v105);
      double v26 = TSDRectWithSize();
      double v28 = v27;
      double v30 = v29;
      double v32 = v31;
      memset(&v105, 0, sizeof(v105));
      double v33 = objc_msgSend((id)objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "maskLayout"), "pureGeometry");
      if (v33) {
        [v33 transform];
      }
      else {
        memset(&v104, 0, sizeof(v104));
      }
      CGAffineTransformInvert(&v105, &v104);
      memset(&v103, 0, sizeof(v103));
      CGAffineTransformMakeTranslation(&v103, v16 * -0.5, v18 * -0.5);
      memset(&v102, 0, sizeof(v102));
      CGAffineTransform t1 = v103;
      CGAffineTransform t2 = v106;
      CGAffineTransformConcat(&v101, &t1, &t2);
      CGAffineTransform t1 = v103;
      CGAffineTransformInvert(&v98, &t1);
      CGAffineTransformConcat(&v102, &v101, &v98);
      CGAffineTransform t2 = v102;
      CGAffineTransform v97 = v105;
      CGAffineTransformConcat(&t1, &t2, &v97);
      *(_OWORD *)&v105.a = *(_OWORD *)&t1.a;
      *(_OWORD *)&v105.c = *(_OWORD *)&t1.c;
      *(float64x2_t *)&v105.tCGFloat x = vmulq_n_f64(*(float64x2_t *)&t1.tx, v85);
      *(_OWORD *)&t2.a = *(_OWORD *)&t1.a;
      *(_OWORD *)&t2.c = *(_OWORD *)&t1.c;
      *(_OWORD *)&t2.tCGFloat x = *(_OWORD *)&v105.tx;
      TSDTransformConvertForNewOrigin(&t2, &t1, v30 * 0.5, v32 * 0.5);
      CGAffineTransform v105 = t1;
      objc_msgSend(*(id *)&self->mFrameInUnscaledCanvasIsValid, "setBounds:", v26, v28, v30, v32);
      memset(v96, 0, sizeof(v96));
      memset(&t1, 0, sizeof(t1));
      [(TSDImageRep *)self p_getAliasedValuesForMaskToBoundsDirectLayerFrame:v96 transform:&t1];
      memset(&t2, 0, sizeof(t2));
      CGAffineTransformMakeTranslation(&v95, *(CGFloat *)v96, *((CGFloat *)v96 + 1));
      CGAffineTransform v97 = t1;
      CGAffineTransformConcat(&t2, &v97, &v95);
      memset(&v97, 0, sizeof(v97));
      CGAffineTransform v94 = v105;
      CGAffineTransform v93 = t2;
      CGAffineTransformConcat(&v97, &v94, &v93);
      -[TSDRep antiAliasDefeatLayerTransform:forFrame:](self, "antiAliasDefeatLayerTransform:forFrame:", &v97, v26, v28, v30, v32);
      CGAffineTransform v94 = t1;
      [(TSDRep *)self antiAliasDefeatLayerFrame:v96 forTransform:&v94];
      memset(&v94, 0, sizeof(v94));
      CGAffineTransformMakeTranslation(&v92, *(CGFloat *)v96, *((CGFloat *)v96 + 1));
      CGAffineTransform v93 = t1;
      CGAffineTransformConcat(&v94, &v93, &v92);
      CGAffineTransform v93 = v94;
      CGAffineTransformInvert(&v91, &v93);
      CGAffineTransform v90 = v97;
      CGAffineTransformConcat(&v93, &v90, &v91);
      CGAffineTransform v105 = v93;
      objc_msgSend(*(id *)&self->mFrameInUnscaledCanvasIsValid, "setIfDifferentFrame:orTransform:", &v93, v26, v28, v30, v32);
      if ([(CAShapeLayer *)self->super.mStrokeLayer mask]) {
        [(CAShapeLayer *)self->super.mStrokeLayer setMask:0];
      }
      goto LABEL_67;
    }
    if ([(TSDImageRep *)self p_shouldMaskWithFrameLayers])
    {
      [(CALayer *)self->super.mTapToReplaceLayer setPath:0];
      if ([(CAShapeLayer *)self->super.mStrokeLayer mask]
        && ([(CAShapeLayer *)self->super.mStrokeLayer mask], objc_opt_class(),
                                                                    (objc_opt_isKindOfClass() & 1) != 0))
      {
        double v34 = (void *)[(CAShapeLayer *)self->super.mStrokeLayer mask];
      }
      else
      {
        double v34 = (void *)[MEMORY[0x263F15880] layer];
        objc_msgSend(v34, "setBackgroundColor:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F7C808], "blackColor"), "CGColor"));
        [(CAShapeLayer *)self->super.mStrokeLayer setMask:v34];
      }
      if (objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "pathToStroke"))
      {
        PathBoundingBoCGFloat x = CGPathGetPathBoundingBox((CGPathRef)objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "pathToStroke"));
        CGFloat x = PathBoundingBox.origin.x;
        CGFloat y = PathBoundingBox.origin.y;
      }
      else
      {
        CGFloat x = *MEMORY[0x263F001A8];
        CGFloat y = *(double *)(MEMORY[0x263F001A8] + 8);
      }
      double v41 = TSDRectWithSize();
      double v43 = v42;
      objc_msgSend(-[TSDLayout stroke](-[TSDRep layout](self, "layout"), "stroke"), "coverageRect:", v41, v42, v44, v45);
      double v47 = TSDSubtractPoints(v41, v43, v46);
      memset(&v106, 0, sizeof(v106));
      CGAffineTransformMakeTranslation(&v106, v47, v48);
      memset(&v105, 0, sizeof(v105));
      if (objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "maskLayout"))
      {
        double v49 = objc_msgSend((id)objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "maskLayout"), "geometry");
        if (v49) {
          [v49 transform];
        }
        else {
          memset(&v103, 0, sizeof(v103));
        }
        CGAffineTransform v105 = v103;
      }
      else
      {
        CGAffineTransformMakeTranslation(&v105, x, y);
      }
      CGAffineTransform v102 = v105;
      memset(&v103, 0, sizeof(v103));
      CGAffineTransformInvert(&v89, &v102);
      CGAffineTransform v102 = v106;
      CGAffineTransformConcat(&v103, &v89, &v102);
      *(_OWORD *)&v102.a = *(_OWORD *)&v103.a;
      *(_OWORD *)&v102.c = *(_OWORD *)&v103.c;
      tCGFloat x = v103.tx;
      tCGFloat y = v103.ty;
      [(TSDCanvas *)[(TSDRep *)self canvas] viewScale];
      double v53 = v52;
      [(TSDCanvas *)[(TSDRep *)self canvas] viewScale];
      double v55 = v54;
      [MEMORY[0x263F158F8] begin];
      [MEMORY[0x263F158F8] setDisableActions:1];
      v86[0] = *(_OWORD *)&v102.a;
      v86[1] = *(_OWORD *)&v102.c;
      double v87 = tx * v53;
      double v88 = ty * v55;
      [v34 setAffineTransform:v86];
      [MEMORY[0x263F158F8] commit];
      int v56 = objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "isInMaskEditMode");
      if (!v56) {
        goto LABEL_66;
      }
      [(TSDImageRep *)self p_updateMaskSublayersForMaskEditMode];
      [(TSDImageRep *)self p_updateMaskLayer:self->mIAMaskLayer forRepLayer:a3 shouldIncludeMask:1 shouldIncludeInstantAlpha:0];
      [(TSDImageRep *)self p_updateMaskLayer:self->mMaskPathLayer forRepLayer:a3 shouldIncludeMask:0 shouldIncludeInstantAlpha:1];
      if (([v5 isInInstantAlphaMode] & 1) == 0) {
        [(TSDImageRep *)self p_updateMaskLayer:self->mContentsLayer forRepLayer:a3 shouldIncludeMask:1 shouldIncludeInstantAlpha:0];
      }
      if (!objc_msgSend(-[TSDImageRep imageInfo](self, "imageInfo"), "instantAlphaPath")) {
        [v34 setPath:0];
      }
      else {
LABEL_66:
      }
        [(TSDImageRep *)self p_updateMaskLayer:v34 forRepLayer:a3 shouldIncludeMask:v56 ^ 1u shouldIncludeInstantAlpha:1];
      goto LABEL_67;
    }
    int v35 = objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "isInMaskEditMode");
    if (!v35)
    {
      if (!LOBYTE(self->mSizedImageOrientation))
      {
        double v40 = &OBJC_IVAR___TSDMediaRep_mMaskLayer;
LABEL_59:
        [(TSDImageRep *)self p_updateMaskLayer:*(Class *)((char *)&self->super.super.super.super.isa + *v40) forRepLayer:a3 shouldIncludeMask:1 shouldIncludeInstantAlpha:v35 ^ 1u];
      }
LABEL_67:
      if (self->super.mTapToReplaceLayer)
      {
        [MEMORY[0x263F158F8] begin];
        [MEMORY[0x263F158F8] setDisableActions:1];
        [a3 bounds];
        double v58 = v57;
        double v60 = v59;
        double v62 = v61;
        double v64 = v63;
        [(CALayer *)self->super.mTapToReplaceLayer frame];
        v122.origin.CGFloat x = v65;
        v122.origin.CGFloat y = v66;
        v122.size.CGFloat width = v67;
        v122.size.CGFloat height = v68;
        v118.origin.CGFloat x = v58;
        v118.origin.CGFloat y = v60;
        v118.size.CGFloat width = v62;
        v118.size.CGFloat height = v64;
        if (!CGRectEqualToRect(v118, v122)) {
          -[CALayer setFrame:](self->super.mTapToReplaceLayer, "setFrame:", v58, v60, v62, v64);
        }
        mIAMaskLayer = self->mIAMaskLayer;
        if (mIAMaskLayer)
        {
          [(CAShapeLayer *)mIAMaskLayer frame];
          v123.origin.CGFloat x = v70;
          v123.origin.CGFloat y = v71;
          v123.size.CGFloat width = v72;
          v123.size.CGFloat height = v73;
          v119.origin.CGFloat x = v58;
          v119.origin.CGFloat y = v60;
          v119.size.CGFloat width = v62;
          v119.size.CGFloat height = v64;
          if (!CGRectEqualToRect(v119, v123)) {
            -[CAShapeLayer setFrame:](self->mIAMaskLayer, "setFrame:", v58, v60, v62, v64);
          }
        }
        mMaskPathLayer = self->mMaskPathLayer;
        if (mMaskPathLayer)
        {
          [(CAShapeLayer *)mMaskPathLayer frame];
          v124.origin.CGFloat x = v75;
          v124.origin.CGFloat y = v76;
          v124.size.CGFloat width = v77;
          v124.size.CGFloat height = v78;
          v120.origin.CGFloat x = v58;
          v120.origin.CGFloat y = v60;
          v120.size.CGFloat width = v62;
          v120.size.CGFloat height = v64;
          if (!CGRectEqualToRect(v120, v124)) {
            -[CAShapeLayer setFrame:](self->mMaskPathLayer, "setFrame:", v58, v60, v62, v64);
          }
        }
        [MEMORY[0x263F158F8] commit];
      }
      [MEMORY[0x263F158F8] commit];
      _Block_object_dispose(&v109, 8);
      goto LABEL_78;
    }
    [(TSDImageRep *)self p_updateMaskSublayersForMaskEditMode];
    if (objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "isInInstantAlphaMode"))
    {
      uint64_t v36 = objc_msgSend(-[TSDImageRep imageInfo](self, "imageInfo"), "instantAlphaPath");
      uint64_t v37 = self->mIAMaskLayer;
      if (!v36)
      {
        [(CAShapeLayer *)self->mIAMaskLayer setPath:0];
        goto LABEL_57;
      }
    }
    else
    {
      [(TSDImageRep *)self p_updateMaskLayer:self->mIAMaskLayer forRepLayer:a3 shouldIncludeMask:1 shouldIncludeInstantAlpha:0];
      uint64_t v37 = self->mMaskPathLayer;
    }
    [(TSDImageRep *)self p_updateMaskLayer:v37 forRepLayer:a3 shouldIncludeMask:0 shouldIncludeInstantAlpha:1];
LABEL_57:
    if (([v5 isInInstantAlphaMode] & 1) == 0)
    {
      double v40 = &OBJC_IVAR___TSDImageRep_mMaskPathLayer;
      goto LABEL_59;
    }
    goto LABEL_67;
  }
  if ([a3 edgeAntialiasingMask] != 15) {
    [a3 setEdgeAntialiasingMask:15];
  }
LABEL_78:
  double v79 = *MEMORY[0x263F00148];
  double v80 = *(double *)(MEMORY[0x263F00148] + 8);
  [a3 contentsRect];
  v125.size.CGFloat width = 1.0;
  v125.size.CGFloat height = 1.0;
  v125.origin.CGFloat x = v79;
  v125.origin.CGFloat y = v80;
  if (!CGRectEqualToRect(v121, v125)) {
    objc_msgSend(a3, "setContentsRect:", v79, v80, 1.0, 1.0);
  }
  [(TSDStyledRep *)self opacity];
  double v82 = v81;
  [a3 opacity];
  double v84 = v83;
  if (v82 != v84)
  {
    *(float *)&double v84 = v82;
    [a3 setOpacity:v84];
  }
  [*(id *)&self->mBaseMaskLayoutTransform.ty unlock];
}

uint64_t __30__TSDImageRep_didUpdateLayer___block_invoke(uint64_t a1)
{
  uint64_t v3 = a1 + 32;
  uint64_t result = *(void *)(a1 + 32);
  if (*(void *)(*(void *)(*(void *)(v3 + 8) + 8) + 40) != *(void *)(result + 704))
  {
    if (*(void *)(result + 680))
    {
      uint64_t result = objc_msgSend((id)result, "p_shouldBakeMaskIntoSizedImage");
      if (result)
      {
        uint64_t result = [MEMORY[0x263F08B88] isMainThread];
        if ((result & 1) == 0) {
          *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = 0;
        }
      }
    }
  }
  return result;
}

- (BOOL)p_shouldMaskWithFrameLayers
{
  id v3 = [(TSDLayout *)[(TSDRep *)self layout] stroke];
  if (!v3) {
    return 0;
  }
  BOOL v4 = v3;
  if (![v3 shouldRender]
    || ![v4 isFrame]
    || ![v4 hasMask])
  {
    return 0;
  }
  id v5 = [(TSDImageRep *)self imageLayout];

  return [v5 shouldRenderFrameStroke];
}

- (void)p_updateMaskLayer:(id)a3 forRepLayer:(id)a4 shouldIncludeMask:(BOOL)a5 shouldIncludeInstantAlpha:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  char v11 = objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "maskLayout");
  if (![(TSDImageRep *)self directlyManagesLayerContent])
  {
    id v12 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v13 = [NSString stringWithUTF8String:"-[TSDImageRep p_updateMaskLayer:forRepLayer:shouldIncludeMask:shouldIncludeInstantAlpha:]"];
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageRep.m"), 2730, @"Updating mask layer for a non-directly managed layer!");
  }
  if (a3 && ![(TSDImageRep *)self p_shouldRenderWithMaskToBounds])
  {
    [(TSDRep *)self scaleToConvertNaturalToLayerRelative];
    CGFloat v15 = v14;
    MutableCopCGFloat y = 0;
    long long v17 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    *(_OWORD *)&v57.a = *MEMORY[0x263F000D0];
    *(_OWORD *)&v57.c = v17;
    *(_OWORD *)&v57.tCGFloat x = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
    if (v11 && v7)
    {
      [v11 pathBounds];
      CGAffineTransformMakeTranslation(&v57, -v18, -v19);
      [v11 transform];
      CGAffineTransform t1 = v57;
      CGAffineTransformConcat(&v56, &t1, &t2);
      CGAffineTransform v57 = v56;
      CGAffineTransformMakeScale(&v53, v15, v15);
      CGAffineTransform t1 = v57;
      CGAffineTransformConcat(&v56, &t1, &v53);
      CGAffineTransform v57 = v56;
      MutableCopCGFloat y = CGPathCreateMutableCopy((CGPathRef)[v11 path]);
    }
    if (objc_msgSend(-[TSDImageRep imageInfo](self, "imageInfo"), "instantAlphaPath") && v6)
    {
      double v20 = objc_msgSend((id)objc_msgSend(-[TSDImageRep imageInfo](self, "imageInfo"), "instantAlphaPath"), "copy");
      id v21 = [(TSDImageRep *)self imageLayout];
      if (v21) {
        [v21 imageDataToVisualSizeTransform];
      }
      else {
        memset(v52, 0, sizeof(v52));
      }
      [v20 transformUsingAffineTransform:v52];
      if (MutableCopy)
      {
        if (v11) {
          [v11 affineTransformForTightPathBounds];
        }
        else {
          memset(&v50, 0, sizeof(v50));
        }
        CGAffineTransformInvert(&v51, &v50);
        [v20 transformUsingAffineTransform:&v51];
        objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "pathBoundsWithoutStroke");
        CGAffineTransformMakeTranslation(&v49, v24, v25);
        [v20 transformUsingAffineTransform:&v49];
        id v26 = [+[TSDBezierPath bezierPathWithCGPath:MutableCopy] intersectBezierPath:v20];
        if (!v26)
        {
          double v27 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
          uint64_t v28 = [NSString stringWithUTF8String:"-[TSDImageRep p_updateMaskLayer:forRepLayer:shouldIncludeMask:shouldIncludeInstantAlpha:]"];
          objc_msgSend(v27, "handleFailureInFunction:file:lineNumber:description:", v28, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageRep.m"), 2764, @"invalid nil value for '%s'", "maskBezierPath");
        }
        CGPathRelease(MutableCopy);
        MutableCopCGFloat y = (const CGPath *)[v26 CGPath];
      }
      else
      {
        CGAffineTransformMakeScale(&v48, v15, v15);
        [v20 transformUsingAffineTransform:&v48];
        MutableCopCGFloat y = (const CGPath *)[v20 CGPath];
        if (!MutableCopy)
        {
          double v22 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
          uint64_t v23 = [NSString stringWithUTF8String:"-[TSDImageRep p_updateMaskLayer:forRepLayer:shouldIncludeMask:shouldIncludeInstantAlpha:]"];
          objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageRep.m"), 2772, @"invalid nil value for '%s'", "maskPath");
          MutableCopCGFloat y = 0;
        }
      }
      CGPathRetain(MutableCopy);
    }
    if ([(TSDImageRep *)self p_orientationForDirectlyManagedLayer])
    {
      [a4 bounds];
      double v29 = TSDRectWithSize();
      CGFloat v31 = v30;
      CGFloat v33 = v32;
      CGFloat v35 = v34;
      memset(&v56, 0, sizeof(v56));
      TSUImageOrientationTransform();
      double v36 = TSDCenterOfRect(v29, v31, v33, v35);
      CGFloat v38 = v37;
      memset(&t1, 0, sizeof(t1));
      CGAffineTransformMakeTranslation(&v47, -v36, -v37);
      CGAffineTransformMakeTranslation(&v45, v36, v38);
      CGAffineTransform v44 = v56;
      CGAffineTransformConcat(&v46, &v44, &v45);
      CGAffineTransformConcat(&t1, &v47, &v46);
      CGAffineTransform v44 = t1;
      CGAffineTransformInvert(&v43, &v44);
      CGAffineTransform v42 = v57;
      CGAffineTransformConcat(&v44, &v42, &v43);
      CGAffineTransform v57 = v44;
    }
    if (!MutableCopy)
    {
      if (objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "maskIntersectsImage"))
      {
        double v39 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v40 = [NSString stringWithUTF8String:"-[TSDImageRep p_updateMaskLayer:forRepLayer:shouldIncludeMask:shouldIncludeInstantAlpha:]"];
        objc_msgSend(v39, "handleFailureInFunction:file:lineNumber:description:", v40, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageRep.m"), 2794, @"maskPath is nil when it should not be");
      }
    }
    CGAffineTransform v56 = v57;
    double v41 = TSDCreateTransformedPath(MutableCopy, &v56);
    [a3 setPath:v41];
    CGPathRelease(v41);
    CGPathRelease(MutableCopy);
  }
}

- (void)p_updateStrokeLayerForStroke:(id)a3 repLayer:(id)a4
{
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  id v7 = [(TSDImageRep *)self imageLayout];
  id v8 = [(TSDImageRep *)self maskLayout];
  [(TSDRep *)self scaleToConvertNaturalToLayerRelative];
  double v10 = v9;
  long long v117 = 0u;
  memset(&v118, 0, sizeof(v118));
  long long v116 = 0u;
  -[TSDRep computeDirectLayerFrame:andTransform:basedOnLayoutGeometry:](self, "computeDirectLayerFrame:andTransform:basedOnLayoutGeometry:", &v116, &v118, objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "imageGeometry"));
  long long v11 = v117;
  double v12 = TSDRectWithSize();
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v19 = TSDCenterOfRect(*(CGFloat *)&v116, *((CGFloat *)&v116 + 1), *(CGFloat *)&v11, *((CGFloat *)&v11 + 1));
  double v21 = v20;
  [(CAShapeLayer *)self->super.mMaskLayer position];
  if (v23 != v19 || v22 != v21) {
    -[CAShapeLayer setPosition:](self->super.mMaskLayer, "setPosition:", v19, v21);
  }
  [(TSDStyledRep *)self opacity];
  double v26 = v25;
  [(CAShapeLayer *)self->super.mMaskLayer opacity];
  double v28 = v27;
  if (v26 != v28)
  {
    *(float *)&double v28 = v26;
    [(CAShapeLayer *)self->super.mMaskLayer setOpacity:v28];
  }
  if (![a3 isFrame])
  {
    -[CAShapeLayer setBounds:](self->super.mMaskLayer, "setBounds:", v12, v14, v16, v18);
    objc_msgSend(a3, "applyToRepRenderable:withScale:", +[TSDRenderable renderableFromLayer:](TSDRenderable, "renderableFromLayer:", self->super.mMaskLayer), v10);
    uint64_t v49 = [v7 pathToStroke];
    Mutable = (CGPath *)v49;
    if (v8)
    {
      if (!v49)
      {
        mMaskLayer = self->super.mMaskLayer;
        uint64_t v79 = 1;
        goto LABEL_26;
      }
      memset(&v108, 0, sizeof(v108));
      [v8 transform];
      CGAffineTransformMakeScale(&t2, v10, v10);
      CGAffineTransformConcat(&v108, &t1, &t2);
      CGAffineTransform v107 = v108;
      CGAffineTransform v51 = Mutable;
    }
    else
    {
      if (!v49)
      {
        Mutable = CGPathCreateMutable();
        v122.origin.double x = v12;
        v122.origin.double y = v14;
        v122.size.double width = v16;
        v122.size.double height = v18;
        CGPathAddRect(Mutable, 0, v122);
        goto LABEL_24;
      }
      memset(&v108, 0, sizeof(v108));
      CGAffineTransformMakeScale(&v108, v10, v10);
      CGAffineTransform v51 = (const CGPath *)[v7 pathToStroke];
      CGAffineTransform v107 = v108;
    }
    Mutable = TSDCreateTransformedPath(v51, &v107);
LABEL_24:
    mMaskLayer = self->super.mMaskLayer;
    uint64_t v79 = 0;
LABEL_26:
    [(CAShapeLayer *)mMaskLayer setHidden:v79];
    [(CAShapeLayer *)self->super.mMaskLayer setPath:Mutable];
    CGPathRelease(Mutable);
    goto LABEL_27;
  }
  double v102 = v10;
  if (objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "hasMaskingPath"))
  {
    double v29 = (const CGPath *)[v7 pathToStroke];
    if (!v29) {
      goto LABEL_27;
    }
    PathBoundingBodouble x = CGPathGetPathBoundingBox(v29);
    double x = PathBoundingBox.origin.x;
    double y = PathBoundingBox.origin.y;
    double width = PathBoundingBox.size.width;
    double height = PathBoundingBox.size.height;
    double v34 = TSDRectWithSize();
    double v98 = v35;
    double v100 = v34;
    double v94 = v37;
    double v96 = v36;
    objc_msgSend(a3, "coverageRectWithoutAdornment:");
    double v39 = v38;
    double v41 = v40;
    double v43 = v42;
    double v45 = v44;
    CGAffineTransform v46 = [TSDMutableLayoutGeometry alloc];
    CGAffineTransform v47 = v46;
    if (v8)
    {
      CGAffineTransform v48 = -[TSDLayoutGeometry initWithFrame:](v46, "initWithFrame:", *(double *)&v39, v41, v43, v45);
      if (v7) {
        [v7 layoutToMaskTransform];
      }
      else {
        memset(v115, 0, sizeof(v115));
      }
      float v83 = (CGAffineTransform *)v115;
    }
    else
    {
      objc_msgSend(a3, "coverageRectWithoutAdornment:", x, y, width, height);
      CGAffineTransform v48 = -[TSDLayoutGeometry initWithFrame:](v47, "initWithFrame:");
      objc_msgSend(a3, "coverageRect:", x, y, width, height);
      if (v81 > 0.0) {
        double v81 = 0.0;
      }
      if (v82 > 0.0) {
        double v82 = 0.0;
      }
      CGAffineTransformMakeTranslation(&v114, -v81, -v82);
      float v83 = &v114;
    }
    [(TSDMutableLayoutGeometry *)v48 transformBy:v83];
    if (v7) {
      [v7 transform];
    }
    else {
      memset(v113, 0, sizeof(v113));
    }
    [(TSDMutableLayoutGeometry *)v48 transformBy:v113];
    long long v111 = 0u;
    long long v112 = 0u;
    [(TSDRep *)self computeDirectLayerFrame:&v111 andTransform:&v118 basedOnLayoutGeometry:v48];

    [(CAShapeLayer *)self->super.mMaskLayer setPosition:TSDCenterOfRect(*(CGFloat *)&v111, *((CGFloat *)&v111 + 1), *(CGFloat *)&v112, *((CGFloat *)&v112 + 1))];
    [(CAShapeLayer *)self->super.mMaskLayer setBounds:TSDRectWithSize()];
    if ((objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "isInMaskEditMode") & 1) != 0
      || ![(TSDImageRep *)self p_shouldRenderWithMaskToBounds]
      || objc_msgSend(-[TSDImageRep imageInfo](self, "imageInfo"), "instantAlphaPath"))
    {
      if (v8)
      {
        [v8 transform];
        long long v109 = *(_OWORD *)&v108.a;
        long long v110 = *(_OWORD *)&v108.c;
        tdouble x = v102 * v108.tx;
        tdouble y = v102 * v108.ty;
LABEL_53:
        *(void *)&v123.origin.double x = v39;
        v123.origin.double y = v41;
        v123.size.double width = v43;
        v123.size.double height = v45;
        if (!CGRectEqualToRect(v123, *(CGRect *)&self->super.mFrameRep)) {
          goto LABEL_55;
        }
        *(_OWORD *)&v108.a = v109;
        *(_OWORD *)&v108.c = v110;
        v108.tdouble x = tx;
        v108.tdouble y = ty;
        long long v89 = *(_OWORD *)&self->mLastPictureFrameLayerTransform.b;
        *(_OWORD *)&v107.a = *(_OWORD *)&self->mMaskSublayer;
        *(_OWORD *)&v107.c = v89;
        *(_OWORD *)&v107.tdouble x = *(_OWORD *)&self->mLastPictureFrameLayerTransform.d;
        if (!CGAffineTransformEqualToTransform(&v108, &v107))
        {
LABEL_55:
          [(TSDMediaRep *)self i_updateFrameRep];
          mFrameMaskLayer = self->super.mFrameMaskLayer;
          CGAffineTransform v91 = self->super.mMaskLayer;
          mTapToReplaceLayer = self->super.mTapToReplaceLayer;
          *(_OWORD *)&v108.a = v109;
          *(_OWORD *)&v108.c = v110;
          v108.tdouble x = tx;
          v108.tdouble y = ty;
          -[CALayer updateCALayer:toRect:withRepLayer:maskLayer:viewScale:maskLayerTransform:](mFrameMaskLayer, "updateCALayer:toRect:withRepLayer:maskLayer:viewScale:maskLayerTransform:", v91, a4, mTapToReplaceLayer, &v108, v100, v98, v96, v94, v102);
          self->super.mFrameRep = v39;
          self->super.mLastPictureFrameLayerRect.origin.double x = v41;
          self->super.mLastPictureFrameLayerRect.origin.double y = v43;
          self->super.mLastPictureFrameLayerRect.size.double width = v45;
          long long v93 = v110;
          *(_OWORD *)&self->mMaskSublayer = v109;
          *(_OWORD *)&self->mLastPictureFrameLayerTransform.b = v93;
          self->mLastPictureFrameLayerTransform.d = tx;
          self->mLastPictureFrameLayerTransform.tdouble x = ty;
        }
        goto LABEL_27;
      }
      if (objc_msgSend(-[TSDImageRep imageInfo](self, "imageInfo"), "instantAlphaPath"))
      {
        CGAffineTransformMakeTranslation(&v108, v102 * x, v102 * y);
        long long v109 = *(_OWORD *)&v108.a;
        long long v110 = *(_OWORD *)&v108.c;
        tdouble x = v108.tx;
        tdouble y = v108.ty;
        goto LABEL_53;
      }
      double v86 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v87 = [NSString stringWithUTF8String:"-[TSDImageRep p_updateStrokeLayerForStroke:repLayer:]"];
      objc_msgSend(v86, "handleFailureInFunction:file:lineNumber:description:", v87, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageRep.m"), 2887, @"This path should never be hit! Something is wrong with rendering the frame.");
    }
    long long v88 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    long long v109 = *MEMORY[0x263F000D0];
    long long v110 = v88;
    tdouble x = *(double *)(MEMORY[0x263F000D0] + 32);
    tdouble y = *(double *)(MEMORY[0x263F000D0] + 40);
    goto LABEL_53;
  }
  double v52 = TSDMultiplyRectScalar(v12, v14, v16, v18, 1.0 / v10);
  CGFloat v54 = v53;
  CGFloat v56 = v55;
  CGFloat v58 = v57;
  objc_msgSend(a3, "coverageRectWithoutAdornment:");
  double v59 = v120.origin.x;
  CGFloat v60 = v120.origin.y;
  double v61 = v120.size.width;
  double v62 = v120.size.height;
  if (!CGRectEqualToRect(v120, *(CGRect *)&self->super.mFrameRep))
  {
    double v99 = v54;
    double v101 = v52;
    double v95 = v58;
    double v97 = v56;
    double v63 = TSDCenterOfRect(v52, v54, v56, v58);
    double v65 = TSDSubtractPoints(v63, v64, v59);
    -[CAShapeLayer setAnchorPoint:](self->super.mMaskLayer, "setAnchorPoint:", v65 / v61, v66 / v62);
    TSDMultiplySizeScalar(v61, v62, v102);
    double v67 = TSDRectWithSize();
    double v69 = v68;
    double v71 = v70;
    double v73 = v72;
    [(CAShapeLayer *)self->super.mMaskLayer bounds];
    v124.origin.double x = v67;
    v124.origin.double y = v69;
    v124.size.double width = v71;
    v124.size.double height = v73;
    if (!CGRectEqualToRect(v121, v124)) {
      -[CAShapeLayer setBounds:](self->super.mMaskLayer, "setBounds:", v67, v69, v71, v73);
    }
    [(TSDMediaRep *)self i_updateFrameRep];
    v74 = self->super.mFrameMaskLayer;
    CGFloat v75 = self->super.mMaskLayer;
    CGFloat v76 = self->super.mTapToReplaceLayer;
    long long v77 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    *(_OWORD *)&v108.a = *MEMORY[0x263F000D0];
    *(_OWORD *)&v108.c = v77;
    *(_OWORD *)&v108.tdouble x = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
    -[CALayer updateCALayer:toRect:withRepLayer:maskLayer:viewScale:maskLayerTransform:](v74, "updateCALayer:toRect:withRepLayer:maskLayer:viewScale:maskLayerTransform:", v75, a4, v76, &v108, v101, v99, v97, v95, v102);
    *(double *)&self->super.mFrameRep = v59;
    self->super.mLastPictureFrameLayerRect.origin.double x = v60;
    self->super.mLastPictureFrameLayerRect.origin.double y = v61;
    self->super.mLastPictureFrameLayerRect.size.double width = v62;
  }
LABEL_27:
  double v80 = self->super.mMaskLayer;
  if (v80) {
    [(CAShapeLayer *)v80 affineTransform];
  }
  else {
    memset(&v104, 0, sizeof(v104));
  }
  CGAffineTransform v108 = v118;
  if (!CGAffineTransformEqualToTransform(&v104, &v108))
  {
    CGAffineTransform v103 = v118;
    [(CAShapeLayer *)self->super.mMaskLayer setAffineTransform:&v103];
  }
  [MEMORY[0x263F158F8] commit];
}

- (id)additionalLayersOverLayer
{
  v18.receiver = self;
  v18.super_class = (Class)TSDImageRep;
  id v3 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithArray:", -[TSDMediaRep additionalLayersOverLayer](&v18, sel_additionalLayersOverLayer));
  if (self->super.mMaskLayer)
  {
    id v4 = [(TSDMediaRep *)self visibleMediaReplaceButtonLayer];
    uint64_t v5 = [v3 indexOfObject:v4];
    mMaskLayer = self->super.mMaskLayer;
    if (!v4 || (uint64_t v6 = v5, v5 == 0x7FFFFFFFFFFFFFFFLL)) {
      objc_msgSend(v3, "addObject:", mMaskLayer, v6);
    }
    else {
      [v3 insertObject:mMaskLayer atIndex:v5];
    }
  }
  if (self->mContentsLayer)
  {
    [MEMORY[0x263F158F8] begin];
    [MEMORY[0x263F158F8] setDisableActions:1];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v15 = 0u;
    id v8 = objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "imageGeometryInRoot");
    if (v8)
    {
      [v8 transform];
    }
    else
    {
      long long v16 = 0u;
      long long v17 = 0u;
      long long v15 = 0u;
    }
    [(TSDCanvas *)[(TSDRep *)self canvas] viewScale];
    *(double *)&long long v17 = v9 * *(double *)&v17;
    [(TSDCanvas *)[(TSDRep *)self canvas] viewScale];
    *((double *)&v17 + 1) = v10 * *((double *)&v17 + 1);
    if ([(TSDRep *)self parentRep])
    {
      [[(TSDRep *)self parentRep] layerFrameInScaledCanvas];
      *(double *)&long long v17 = *(double *)&v17 - v11;
      *((double *)&v17 + 1) = *((double *)&v17 + 1) - v12;
    }
    v14[0] = v15;
    v14[1] = v16;
    v14[2] = v17;
    [(CALayer *)self->mContentsLayer setAffineTransform:v14];
    [MEMORY[0x263F158F8] commit];
    [v3 addObject:self->mContentsLayer];
  }
  return v3;
}

- (void)viewScaleDidChange
{
  v5.receiver = self;
  v5.super_class = (Class)TSDImageRep;
  [(TSDStyledRep *)&v5 viewScaleDidChange];
  id v3 = [(TSDLayout *)[(TSDRep *)self layout] stroke];
  if (v3)
  {
    id v4 = v3;
    if ([v3 shouldRender])
    {
      if ([v4 isFrame])
      {
        [(TSDImageRep *)self p_disposeStrokeLayer];
        if ([v4 hasMask]) {
          [(TSDImageRep *)self p_disposeMaskLayer];
        }
      }
    }
  }
}

- (id)textureForContext:(id)a3
{
  if (objc_msgSend(-[TSDImageRep p_imageProvider](self, "p_imageProvider"), "isError")) {
    return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)TSDImageRep;
  return [(TSDStyledRep *)&v6 textureForContext:a3];
}

+ (double)magicMoveAttributeMatchPercentBetweenOutgoingObject:(id)a3 incomingObject:(id)a4
{
  objc_opt_class();
  id v4 = (void *)TSUDynamicCast();
  objc_opt_class();
  objc_super v5 = (void *)TSUDynamicCast();
  int v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "imageInfo"), "imageData"), "isEqual:", objc_msgSend((id)objc_msgSend(v5, "imageInfo"), "imageData"));
  double result = 0.0;
  if (v6)
  {
    if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "imageInfo", 0.0), "imageData"), "isEqual:", objc_msgSend((id)objc_msgSend(v5, "imageInfo"), "imageData")))double v8 = 1.0; {
    else
    }
      double v8 = 0.0;
    double v9 = v8
       + (double)TSDMixingTypeWithPossiblyNilObjects(objc_msgSend((id)objc_msgSend(v4, "imageInfo"), "maskInfo"), objc_msgSend((id)objc_msgSend(v5, "imageInfo"), "maskInfo"))/ 5.0* 0.1;
    uint64_t v10 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "imageInfo"), "imageStyle"), "mixingTypeWithObject:", objc_msgSend((id)objc_msgSend(v5, "imageInfo"), "imageStyle"));
    double v11 = v9 + 1.0;
    if (v10 != 5) {
      double v11 = v9;
    }
    return v11 / 2.1;
  }
  return result;
}

- (id)p_imageData
{
  if (objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "isDynamicallyChangingImageAdjustments"))
  {
    if (objc_msgSend((id)objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "imageAdjustments"), "enhance"))
    {
      id result = (id)objc_msgSend(-[TSDImageRep imageInfo](self, "imageInfo"), "enhancedImageData");
      if (result) {
        return result;
      }
    }
  }
  else
  {
    id result = (id)objc_msgSend(-[TSDImageRep imageInfo](self, "imageInfo"), "adjustedImageData");
    if (result) {
      return result;
    }
  }
  id v4 = [(TSDImageRep *)self imageInfo];

  return (id)[v4 imageData];
}

- (id)p_imageProvider
{
  id v3 = +[TSDImageProviderPool sharedPool];
  id v4 = [(TSDImageRep *)self p_imageData];

  return (id)[v3 providerForData:v4 shouldValidate:0];
}

- (id)p_validatedImageProvider
{
  id v3 = +[TSDImageProviderPool sharedPool];
  id v4 = [(TSDImageRep *)self p_imageData];

  return (id)[v3 providerForData:v4 shouldValidate:1];
}

- (id)p_validatedBitmapImageProvider
{
  objc_opt_class();
  [(TSDImageRep *)self p_validatedImageProvider];

  return (id)TSUDynamicCast();
}

- (id)p_validatedThumbnailImageProvider
{
  return 0;
}

- (void)p_disposeStrokeLayer
{
  if (self->super.mMaskLayer)
  {
    [MEMORY[0x263F158F8] begin];
    [(CAShapeLayer *)self->super.mMaskLayer setDelegate:0];

    self->super.mMaskLayer = 0;
    long long v3 = *(_OWORD *)(MEMORY[0x263F001A8] + 16);
    *(_OWORD *)&self->super.mFrameRep = *MEMORY[0x263F001A8];
    *(_OWORD *)&self->super.mLastPictureFrameLayerRect.origin.double y = v3;
    uint64_t v4 = MEMORY[0x263F000D0];
    long long v5 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    *(_OWORD *)&self->mMaskSublayer = *MEMORY[0x263F000D0];
    *(_OWORD *)&self->mLastPictureFrameLayerTransform.b = v5;
    *(_OWORD *)&self->mLastPictureFrameLayerTransform.d = *(_OWORD *)(v4 + 32);
    [(CAShapeLayer *)self->super.mStrokeLayer removeFromSuperlayer];
    self->super.mStrokeLayer = 0;
    int v6 = (void *)MEMORY[0x263F158F8];
    [v6 commit];
  }
}

- (void)p_disposeMaskLayer
{
  if (self->super.mTapToReplaceLayer)
  {
    [MEMORY[0x263F158F8] begin];
    [(CAShapeLayer *)self->mIAMaskLayer removeFromSuperlayer];

    self->mIAMaskLayer = 0;
    [(CAShapeLayer *)self->mMaskPathLayer removeFromSuperlayer];

    self->mMaskPathLayer = 0;
    [(CALayer *)self->super.mTapToReplaceLayer removeFromSuperlayer];
    [(CALayer *)self->super.mTapToReplaceLayer setDelegate:0];

    self->super.mTapToReplaceLayer = 0;
    [(CAShapeLayer *)self->super.mStrokeLayer removeFromSuperlayer];
    self->super.mStrokeLayer = 0;
    long long v3 = (void *)MEMORY[0x263F158F8];
    [v3 commit];
  }
}

- (void)p_createMaskLayerForLayer:(id)a3
{
  if (!self->super.mTapToReplaceLayer)
  {
    long long v5 = (CALayer *)objc_alloc_init(MEMORY[0x263F15880]);
    self->super.mTapToReplaceLayer = v5;
    [(CALayer *)v5 setDelegate:self];
    -[CALayer setAnchorPoint:](self->super.mTapToReplaceLayer, "setAnchorPoint:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
    mTapToReplaceLayer = self->super.mTapToReplaceLayer;
    [a3 setMask:mTapToReplaceLayer];
  }
}

- (void)p_updateMaskSublayersForMaskEditMode
{
  id v3 = [(TSDInteractiveCanvasController *)[(TSDRep *)self interactiveCanvasController] layerForRep:self];
  if (!self->super.mTapToReplaceLayer) {
    [(TSDImageRep *)self p_createMaskLayerForLayer:v3];
  }
  if (!self->mIAMaskLayer)
  {
    uint64_t v4 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x263F15880]);
    self->mIAMaskLayer = v4;
    [(CALayer *)self->super.mTapToReplaceLayer addSublayer:v4];
  }
  if (objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "isInInstantAlphaMode"))
  {
    [(CAShapeLayer *)self->mIAMaskLayer setMask:0];

    self->mMaskPathLayer = 0;
    [(CALayer *)self->mContentsLayer removeFromSuperlayer];

    self->mContentsLayer = 0;
    if (objc_msgSend(-[TSDImageRep imageInfo](self, "imageInfo"), "instantAlphaPath")) {
      double v5 = 0.25;
    }
    else {
      double v5 = 1.0;
    }
    -[CAShapeLayer setBackgroundColor:](self->mIAMaskLayer, "setBackgroundColor:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F7C808], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, v5), "CGColor"));
    goto LABEL_18;
  }
  -[CAShapeLayer setBackgroundColor:](self->mIAMaskLayer, "setBackgroundColor:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F7C808], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.5), "CGColor"));
  if (self->mMaskPathLayer) {
    goto LABEL_9;
  }
  if (objc_msgSend(-[TSDImageRep imageInfo](self, "imageInfo"), "instantAlphaPath"))
  {
    int v6 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x263F15880]);
    self->mMaskPathLayer = v6;
    [(CAShapeLayer *)self->mIAMaskLayer setMask:v6];
  }
  else if (self->mMaskPathLayer)
  {
LABEL_9:
    if (!objc_msgSend(-[TSDImageRep imageInfo](self, "imageInfo"), "instantAlphaPath"))
    {
      [(CAShapeLayer *)self->mIAMaskLayer setMask:0];

      self->mMaskPathLayer = 0;
    }
  }
  if (!self->mContentsLayer)
  {
    self->mContentsLayer = (CALayer *)objc_alloc_init(MEMORY[0x263F15880]);
    -[CALayer setStrokeColor:](self->mContentsLayer, "setStrokeColor:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F7C808], "colorWithRed:green:blue:alpha:", 0.392156869, 0.392156869, 0.392156869, 1.0), "CGColor"));
    [(CALayer *)self->mContentsLayer setFillColor:0];
    [(CALayer *)self->mContentsLayer setLineWidth:1.0];
    [(CALayer *)self->mContentsLayer setLineDashPattern:&unk_26D739378];
  }
LABEL_18:
  mTapToReplaceLayer = self->super.mTapToReplaceLayer;

  [(CALayer *)mTapToReplaceLayer setPath:0];
}

- (BOOL)p_drawsInOneStep
{
  id v3 = [(TSDImageRep *)self imageInfo];
  int v4 = objc_msgSend((id)objc_msgSend(v3, "stroke"), "shouldRender");
  if ([v3 maskInfo]) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = [v3 instantAlphaPath] != 0;
  }
  uint64_t v10 = 0;
  double v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  int v6 = *(NSObject **)&self->mSizingStateReady;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __31__TSDImageRep_p_drawsInOneStep__block_invoke;
  v9[3] = &unk_2646B0880;
  v9[4] = self;
  v9[5] = &v10;
  dispatch_sync(v6, v9);
  BOOL v7 = 0;
  if (((v4 | v5) & 1) == 0) {
    BOOL v7 = *((unsigned char *)v11 + 24) != 0;
  }
  _Block_object_dispose(&v10, 8);
  return v7;
}

void *__31__TSDImageRep_p_drawsInOneStep__block_invoke(uint64_t a1)
{
  id result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "imageLayout"), "hasAlpha");
  if (!result
    || (id result = *(void **)(a1 + 32), result[88])
    || objc_msgSend((id)objc_msgSend(result, "canvas"), "isCanvasInteractive")
    && (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "canvas"), "viewScale"), v4 < 0.5)
    && (id result = objc_msgSend(*(id *)(a1 + 32), "p_validatedThumbnailImageProvider")) != 0)
  {
    BOOL v3 = 1;
  }
  else
  {
    id result = objc_msgSend(*(id *)(a1 + 32), "p_validatedBitmapImageProvider");
    BOOL v3 = result != 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (BOOL)shouldShowShadow
{
  v5.receiver = self;
  v5.super_class = (Class)TSDImageRep;
  BOOL v3 = [(TSDStyledRep *)&v5 shouldShowShadow];
  if (v3) {
    LOBYTE(v3) = ![(TSDCanvas *)[(TSDRep *)self canvas] shouldSuppressBackgrounds];
  }
  return v3;
}

- (CGSize)p_desiredSizedImageSize
{
  objc_msgSend(-[TSDImageRep p_validatedImageProvider](self, "p_validatedImageProvider"), "naturalSize");
  double v4 = v3;
  double v6 = v5;
  objc_msgSend((id)objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "imageGeometry"), "size");
  double v8 = v7;
  double v10 = v9;
  [(TSDCanvas *)[(TSDRep *)self canvas] contentsScale];
  double v12 = v11;
  [(TSDRep *)self scaleToConvertNaturalToLayerRelative];
  double v14 = TSDMultiplySizeScalar(v8, v10, v12 * v13);
  double v16 = v15;
  if ((objc_msgSend(-[TSDImageRep p_imageProvider](self, "p_imageProvider"), "isError") & 1) != 0
    || (v14 <= v4 ? (BOOL v17 = v16 <= v6) : (BOOL v17 = 0), v17))
  {
    double v4 = v14;
  }
  else
  {
    [(TSDImageRep *)self p_imageProvider];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      double v4 = TSDShrinkSizeToFitInSize(v14, v16, 2048.0, 2048.0);
    }
  }

  double v18 = TSDCeilSize(v4);
  result.double height = v19;
  result.double width = v18;
  return result;
}

- (BOOL)p_okayToGenerateSizedImage
{
  BOOL v3 = [(TSDInteractiveCanvasController *)[(TSDRep *)self interactiveCanvasController] shouldResampleImages];
  if (v3) {
    LOBYTE(v3) = ![(TSDInteractiveCanvasController *)[(TSDRep *)self interactiveCanvasController] shouldSuppressRendering]&& self->mUpdateFromLayoutBlocksLock == 0;
  }
  return v3;
}

- (void)pushDisableImageSizing
{
}

- (void)popDisableImageSizing
{
  mUpdateFromLayoutBlocksLock = self->mUpdateFromLayoutBlocksLock;
  if (mUpdateFromLayoutBlocksLock)
  {
    BOOL v3 = (OS_dispatch_semaphore *)((char *)mUpdateFromLayoutBlocksLock - 1);
    self->mUpdateFromLayoutBlocksLock = v3;
    if (!v3)
    {
      double v4 = [(TSDRep *)self interactiveCanvasController];
      [(TSDInteractiveCanvasController *)v4 invalidateLayers];
    }
  }
}

- (void)p_generateSizedImageIfNecessary
{
  if ([(TSDImageRep *)self p_okayToGenerateSizedImage])
  {
    id v3 = [(TSDImageRep *)self p_imageProvider];
    if ([v3 isValid])
    {
      if (([v3 isError] & 1) == 0)
      {
        [(TSDImageRep *)self p_desiredSizedImageSize];
        double v4 = *(NSObject **)&self->mSizingStateReady;
        v7[0] = MEMORY[0x263EF8330];
        v7[1] = 3221225472;
        v7[2] = __46__TSDImageRep_p_generateSizedImageIfNecessary__block_invoke;
        v7[3] = &unk_2646B1970;
        v7[6] = v5;
        v7[7] = v6;
        v7[4] = self;
        v7[5] = v3;
        dispatch_sync(v4, v7);
      }
    }
  }
}

uint64_t __46__TSDImageRep_p_generateSizedImageIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 704))
  {
    if (*(double *)(a1 + 48) != *(double *)(v2 + 712) || *(double *)(a1 + 56) != *(double *)(v2 + 720)) {
      goto LABEL_9;
    }
    int v4 = *(unsigned __int8 *)(v2 + 736);
    uint64_t result = objc_msgSend((id)v2, "p_shouldBakeMaskIntoSizedImage");
    if (v4 == result) {
      return result;
    }
    uint64_t v2 = *(void *)(a1 + 32);
    if (*(void *)(v2 + 704))
    {
LABEL_9:
      int v6 = *(unsigned __int8 *)(v2 + 736);
      int v7 = objc_msgSend((id)v2, "p_shouldBakeMaskIntoSizedImage");
      uint64_t v2 = *(void *)(a1 + 32);
      if (v6 != v7)
      {

        *(void *)(*(void *)(a1 + 32) + 680) = 0;
        CGImageRelease(*(CGImageRef *)(*(void *)(a1 + 32) + 704));
        *(void *)(*(void *)(a1 + 32) + 704) = 0;
        *(unsigned char *)(*(void *)(a1 + 32) + 736) = 0;
        *(unsigned char *)(*(void *)(a1 + 32) + 737) = 0;
        uint64_t v2 = *(void *)(a1 + 32);
        if (*(void *)(v2 + 744))
        {
          CGPathRelease(*(CGPathRef *)(v2 + 744));
          *(void *)(*(void *)(a1 + 32) + 744) = 0;
          uint64_t v2 = *(void *)(a1 + 32);
        }
      }
    }
  }
  if (!*(void *)(v2 + 680)) {
    goto LABEL_14;
  }
  int v8 = [*(id *)(v2 + 680) status];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v8) {
    goto LABEL_14;
  }
  [*(id *)(v2 + 680) desiredSize];
  if (v11 == *(double *)(a1 + 48) && v10 == *(double *)(a1 + 56))
  {
    uint64_t v13 = *(void *)(a1 + 40);
    if (v13 == [*(id *)(*(void *)(a1 + 32) + 680) provider])
    {
      uint64_t v2 = *(void *)(a1 + 32);
LABEL_14:
      if (*(void *)(v2 + 752)
        && (*(double *)(a1 + 48) == *(double *)(v2 + 760)
          ? (BOOL v9 = *(double *)(a1 + 56) == *(double *)(v2 + 768))
          : (BOOL v9 = 0),
            v9))
      {
        objc_msgSend((id)v2, "p_takeSizedImageFromCache");
      }
      else if (!*(void *)(v2 + 680))
      {
        objc_msgSend((id)v2, "p_startSizing");
      }
      goto LABEL_29;
    }
  }
  [*(id *)(*(void *)(a1 + 32) + 680) setStatus:1];
LABEL_29:
  double v14 = *(void **)(a1 + 40);

  return [v14 flushIfInterestLessThan:2];
}

+ (CGPath)p_newPathToBakeIntoSizedImageForSize:(CGSize)a3 withImageLayout:(id)a4 orientation:(int64_t)a5
{
  double height = a3.height;
  double width = a3.width;
  int v8 = (void *)[a4 maskLayout];
  long long v25 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  long long v26 = *MEMORY[0x263F000D0];
  *(_OWORD *)&v36.a = *MEMORY[0x263F000D0];
  *(_OWORD *)&v36.c = v25;
  long long v24 = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  *(_OWORD *)&v36.tdouble x = v24;
  objc_msgSend((id)objc_msgSend(a4, "imageGeometry"), "size");
  double v10 = width / v9;
  objc_msgSend((id)objc_msgSend(a4, "imageGeometry"), "size");
  double v12 = height / v11;
  if (v8)
  {
    [v8 pathBounds];
    CGAffineTransformMakeTranslation(&t2, -v13, -v14);
    *(_OWORD *)&t1.a = v26;
    *(_OWORD *)&t1.c = v25;
    *(_OWORD *)&t1.tdouble x = v24;
    CGAffineTransformConcat(&v36, &t1, &t2);
    if (a4) {
      [a4 layoutToMaskTransform];
    }
    else {
      memset(&v33, 0, sizeof(v33));
    }
    CGAffineTransform v32 = v36;
    CGAffineTransformConcat(&t1, &v32, &v33);
    CGAffineTransform v36 = t1;
    if (a4) {
      [a4 layoutToImageTransform];
    }
    else {
      memset(&v30, 0, sizeof(v30));
    }
    CGAffineTransformInvert(&v31, &v30);
    CGAffineTransform v32 = v36;
    CGAffineTransformConcat(&t1, &v32, &v31);
    CGAffineTransform v36 = t1;
    CGAffineTransformMakeScale(&v29, v10, v12);
    CGAffineTransform v32 = v36;
    CGAffineTransformConcat(&t1, &v32, &v29);
    CGAffineTransform v36 = t1;
    double v16 = (const CGPath *)[v8 path];
    CGAffineTransform t1 = v36;
    double v15 = TSDCreateTransformedPath(v16, &t1);
  }
  else
  {
    double v15 = 0;
  }
  if (objc_msgSend((id)objc_msgSend(a4, "imageInfo"), "instantAlphaPath"))
  {
    BOOL v17 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "imageInfo"), "instantAlphaPath"), "copy");
    if (a4) {
      [a4 imageDataToVisualSizeTransform];
    }
    else {
      memset(v28, 0, sizeof(v28));
    }
    [v17 transformUsingAffineTransform:v28];
    CGAffineTransformMakeScale(&v27, v10, v12);
    [v17 transformUsingAffineTransform:&v27];
    if (v15)
    {
      id v18 = [+[TSDBezierPath bezierPathWithCGPath:v15] intersectBezierPath:v17];
      if (!v18)
      {
        double v19 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v20 = [NSString stringWithUTF8String:"+[TSDImageRep p_newPathToBakeIntoSizedImageForSize:withImageLayout:orientation:]"];
        objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageRep.m"), 3608, @"invalid nil value for '%s'", "maskBezierPath");
      }
      CGPathRelease(v15);
      double v15 = (CGPath *)[v18 CGPath];
    }
    else
    {
      double v15 = (CGPath *)[v17 CGPath];
      if (!v15)
      {
        double v21 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v22 = [NSString stringWithUTF8String:"+[TSDImageRep p_newPathToBakeIntoSizedImageForSize:withImageLayout:orientation:]"];
        objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageRep.m"), 3614, @"invalid nil value for '%s'", "maskPath");
        double v15 = 0;
      }
    }
    CGPathRetain(v15);
  }
  return v15;
}

- (void)wideGamutValueDidChange
{
  [(TSDImageRep *)self p_invalidateSizedImage];
  [(TSDImageRep *)self p_generateSizedImageIfNecessary];
  [(TSDImageRep *)self p_takeSizedImageFromStateIfReady];
  v3.receiver = self;
  v3.super_class = (Class)TSDImageRep;
  [(TSDRep *)&v3 wideGamutValueDidChange];
}

- (void)p_startSizing
{
  if (self->mLayerUpdateAndSizingStateLock)
  {
    objc_super v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSDImageRep p_startSizing]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageRep.m"), 3637, @"expected nil value for '%s'", "mSizingState");
  }
  [(TSDImageRep *)self p_desiredSizedImageSize];
  double v6 = v5;
  double v8 = v7;
  if ([(TSDImageRep *)self p_shouldBakeMaskIntoSizedImage])
  {
    if (self->mSizedImageAccessQueue) {
      CGFloat height = self->mSizedImageSize.height;
    }
    else {
      CGFloat height = COERCE_DOUBLE(objc_msgSend(-[TSDImageRep p_validatedBitmapImageProvider](self, "p_validatedBitmapImageProvider"), "orientation"));
    }
    double v10 = +[TSDImageRep p_newPathToBakeIntoSizedImageForSize:withImageLayout:orientation:](TSDImageRep, "p_newPathToBakeIntoSizedImageForSize:withImageLayout:orientation:", [(TSDImageRep *)self imageLayout], *(void *)&height, v6, v8);
  }
  else
  {
    double v10 = 0;
  }
  LOBYTE(self->mSizingState) = 0;
  self->mLayerUpdateAndSizingStateLock = (NSRecursiveLock *)-[TSDImageRepSizingState initWithDesiredSize:provider:maskPath:wideGamutCanvas:]([TSDImageRepSizingState alloc], "initWithDesiredSize:provider:maskPath:wideGamutCanvas:", [(TSDImageRep *)self p_imageProvider], v10, [(TSDCanvas *)[(TSDRep *)self canvas] canvasIsWideGamut], v6, v8);
  -[NSRecursiveLock setSizedImageIncludesAdjustments:](self->mLayerUpdateAndSizingStateLock, "setSizedImageIncludesAdjustments:", objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "isDynamicallyChangingImageAdjustments") ^ 1);
  if (v10)
  {
    double v11 = *(const CGPath **)&self->mSizedImageHasMaskBakedIn;
    if (v11) {
      CGPathRelease(v11);
    }
    *(void *)&self->mSizedImageHasMaskBakedIn = v10;
  }
  [(TSDImageRep *)self p_generateSizedImage:self->mLayerUpdateAndSizingStateLock];
  double v12 = [(TSDRep *)self interactiveCanvasController];

  [(TSDInteractiveCanvasController *)v12 layoutInvalidated];
}

- (void)p_generateSizedImage:(id)a3
{
  [a3 generateSizedImage];
  [*(id *)&self->mBaseMaskLayoutTransform.ty lock];
  if (self->mLayerUpdateAndSizingStateLock == a3) {
    LOBYTE(self->mSizingState) = 1;
  }
  tdouble y = self->mBaseMaskLayoutTransform.ty;

  [*(id *)&ty unlock];
}

- (void)i_willEnterForeground
{
  v3.receiver = self;
  v3.super_class = (Class)TSDImageRep;
  [(TSDRep *)&v3 i_willEnterForeground];
  if ([(NSRecursiveLock *)self->mLayerUpdateAndSizingStateLock status] == 1)
  {

    self->mLayerUpdateAndSizingStateLock = 0;
    [(TSDImageRep *)self p_generateSizedImageIfNecessary];
  }
}

- (void)p_takeSizedImageFromStateIfReady
{
  if (self->mLayerUpdateAndSizingStateLock)
  {
    [*(id *)&self->mBaseMaskLayoutTransform.ty lock];
    if (LOBYTE(self->mSizingState))
    {
      LOBYTE(self->mSizingState) = 0;
      [(TSDImageRep *)self p_takeSizedImageFromState];
    }
    tdouble y = self->mBaseMaskLayoutTransform.ty;
    [*(id *)&ty unlock];
  }
}

- (BOOL)p_takeSizedImageFromState:(id)a3
{
  uint64_t v23 = 0;
  long long v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  int v5 = [a3 status];
  if (v5)
  {
    if (v5 == 1) {
LABEL_3:
    }
      *((unsigned char *)v24 + 24) = 1;
  }
  else
  {
    if (![a3 sizedImage]) {
      goto LABEL_4;
    }
    [(TSDImageRep *)self p_desiredSizedImageSize];
    double v9 = v8;
    double v11 = v10;
    [a3 desiredSize];
    if (v9 != v13) {
      goto LABEL_3;
    }
    if (v11 != v12) {
      goto LABEL_3;
    }
    id v14 = [(TSDImageRep *)self p_imageProvider];
    if (v14 != (id)[a3 provider]) {
      goto LABEL_3;
    }
    double v15 = *(NSObject **)&self->mSizingStateReady;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __41__TSDImageRep_p_takeSizedImageFromState___block_invoke;
    block[3] = &unk_2646B0750;
    block[4] = self;
    void block[5] = a3;
    dispatch_sync(v15, block);
    id v16 = [(TSDInteractiveCanvasController *)[(TSDRep *)self interactiveCanvasController] layerForRep:self];
    [(TSDImageRep *)self p_updateDirectlyManagesLayerContentForLayer:v16];
    BOOL v17 = *(NSObject **)&self->mSizingStateReady;
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __41__TSDImageRep_p_takeSizedImageFromState___block_invoke_2;
    v21[3] = &unk_2646B1998;
    v21[5] = v16;
    v21[6] = &v23;
    v21[4] = self;
    dispatch_sync(v17, v21);
    if ([(TSDImageRep *)self directlyManagesLayerContent])
    {
      if ([(TSDStyledRep *)self shadowLayer] || [(TSDStyledRep *)self reflectionLayer])
      {
        int v18 = [MEMORY[0x263F08B88] isMainThread];
        if (v18 == [(TSDInteractiveCanvasController *)[(TSDRep *)self interactiveCanvasController] currentlyWaitingOnThreadedLayoutAndRender])
        {
          double v19 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
          uint64_t v20 = [NSString stringWithUTF8String:"-[TSDImageRep p_takeSizedImageFromState:]"];
          objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageRep.m"), 3753, @"Can't take sized image from state from the main thread while we are doing threaded layout and rendering if image has a shadow or reflection!");
        }
        [(TSDStyledRep *)self invalidateShadowLayer];
        [(CALayer *)[(TSDStyledRep *)self reflectionLayer] setNeedsDisplay];
      }
    }
    else
    {
      [(TSDStyledRep *)self setNeedsDisplay];
    }
  }
LABEL_4:
  char v6 = *((unsigned char *)v24 + 24);
  _Block_object_dispose(&v23, 8);
  return v6;
}

uint64_t __41__TSDImageRep_p_takeSizedImageFromState___block_invoke(uint64_t a1)
{
  CGImageRelease(*(CGImageRef *)(*(void *)(a1 + 32) + 704));
  *(void *)(*(void *)(a1 + 32) + 704) = CGImageRetain((CGImageRef)[*(id *)(a1 + 40) sizedImage]);
  uint64_t v2 = (void *)(*(void *)(a1 + 32) + 712);
  [*(id *)(a1 + 40) desiredSize];
  *uint64_t v2 = v3;
  v2[1] = v4;
  *(void *)(*(void *)(a1 + 32) + 728) = [*(id *)(a1 + 40) sizedImageOrientation];
  *(unsigned char *)(*(void *)(a1 + 32) + 736) = [*(id *)(a1 + 40) sizedImageHasMask];
  uint64_t result = [*(id *)(a1 + 40) sizedImageIncludesAdjustments];
  *(unsigned char *)(*(void *)(a1 + 32) + 737) = result;
  uint64_t v6 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v6 + 736))
  {
    if (!*(void *)(v6 + 744))
    {
      double v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v8 = [NSString stringWithUTF8String:"-[TSDImageRep p_takeSizedImageFromState:]_block_invoke"];
      return objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageRep.m"), 3723, @"invalid nil value for '%s'", "mSizedImageMaskPath");
    }
  }
  return result;
}

unsigned char *__41__TSDImageRep_p_takeSizedImageFromState___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (!v2[88])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    uint64_t v2 = *(void **)(a1 + 32);
  }
  uint64_t result = (unsigned char *)[v2 directlyManagesLayerContent];
  if (result)
  {
    [*(id *)(a1 + 40) setContents:*(void *)(*(void *)(a1 + 32) + 704)];
    uint64_t result = *(unsigned char **)(a1 + 32);
    if (result[736])
    {
      return (unsigned char *)objc_msgSend(result, "p_disposeMaskLayer");
    }
  }
  return result;
}

- (void)p_takeSizedImageFromState
{
  BOOL v3 = [(TSDImageRep *)self p_takeSizedImageFromState:self->mLayerUpdateAndSizingStateLock];

  self->mLayerUpdateAndSizingStateLock = 0;
  LOBYTE(self->mSizingState) = 0;
  if (v3)
  {
    if (objc_msgSend(-[TSDImageRep p_imageProvider](self, "p_imageProvider"), "isValid"))
    {
      uint64_t v4 = *(NSObject **)&self->mSizingStateReady;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __40__TSDImageRep_p_takeSizedImageFromState__block_invoke;
      block[3] = &unk_2646AF7B8;
      block[4] = self;
      dispatch_sync(v4, block);
    }
  }
}

uint64_t __40__TSDImageRep_p_takeSizedImageFromState__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "p_startSizing");
}

- (void)p_invalidateSizedImage
{
  uint64_t v2 = *(NSObject **)&self->mSizingStateReady;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__TSDImageRep_p_invalidateSizedImage__block_invoke;
  block[3] = &unk_2646AF7B8;
  block[4] = self;
  dispatch_sync(v2, block);
}

uint64_t __37__TSDImageRep_p_invalidateSizedImage__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "p_invalidateSizedImageFromQueue");
}

- (void)p_invalidateSizedImageFromQueue
{
  self->mLayerUpdateAndSizingStateLock = 0;
  CGImageRelease(self->mSizedImageAccessQueue);
  self->mSizedImageAccessQueue = 0;
  LOBYTE(self->mSizedImageOrientation) = 0;
  BYTE1(self->mSizedImageOrientation) = 0;
  BOOL v3 = *(const CGPath **)&self->mSizedImageHasMaskBakedIn;
  if (v3)
  {
    CGPathRelease(v3);
    *(void *)&self->mSizedImageHasMaskBakedIn = 0;
  }
}

- (BOOL)p_shouldBakeMaskIntoSizedImage
{
  objc_msgSend(-[TSDImageRep imageInfo](self, "imageInfo"), "naturalSize");
  double v4 = v3;
  double v6 = v5;
  objc_msgSend((id)objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "imageGeometry"), "size");
  double v8 = v7;
  double v10 = v9;
  [(TSDCanvas *)[(TSDRep *)self canvas] viewScale];
  double v12 = v11;
  [(TSDCanvas *)[(TSDRep *)self canvas] contentsScale];
  if (v4 < TSDMultiplySizeScalar(v8, v10, v12 * v13) || v6 < v14) {
    goto LABEL_10;
  }
  objc_opt_class();
  [(TSDLayout *)[(TSDRep *)self layout] stroke];
  id v16 = (void *)TSUDynamicCast();
  if ([(TSDImageRep *)self maskLayout]
    || (uint64_t v17 = objc_msgSend(-[TSDImageRep imageInfo](self, "imageInfo"), "instantAlphaPath")) != 0)
  {
    if ((objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "isInMaskEditMode") & 1) != 0
      || (objc_msgSend((id)objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "maskLayout"), "hasSmartPath") & 1) != 0
      || [(TSDImageRep *)self p_shouldRenderWithMaskToBounds])
    {
LABEL_10:
      LOBYTE(v17) = 0;
      return v17;
    }
    if (v16 && [v16 hasMask]) {
      LOBYTE(v17) = objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "shouldRenderFrameStroke") ^ 1;
    }
    else {
      LOBYTE(v17) = 1;
    }
  }
  return v17;
}

- (BOOL)p_shouldRenderWithMaskToBounds
{
  if (![(TSDImageRep *)self directlyManagesLayerContent]
    || (objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "isInMaskEditMode") & 1) != 0
    || objc_msgSend(-[TSDImageRep imageInfo](self, "imageInfo"), "instantAlphaPath"))
  {
    return 0;
  }
  double v4 = objc_msgSend((id)objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "maskLayout"), "pathSource");

  return [v4 isRectangular];
}

- (void)p_takeSizedImageFromCache
{
  self->mSizedImageAccessQueue = CGImageRetain(self->mSizedImageMaskPath);
  *(_OWORD *)&self->mSizedImage = *(_OWORD *)&self->mCachedSizedImage;
  self->mSizedImageSize.CGFloat height = self->mCachedSizedImageSize.height;
}

- (void)cacheImageAtCurrentSize
{
  self->mSizedImageMaskPath = CGImageRetain(self->mSizedImageAccessQueue);
  *(_OWORD *)&self->mCachedSizedImage = *(_OWORD *)&self->mSizedImage;
  self->mCachedSizedImageSize.CGFloat height = self->mSizedImageSize.height;
}

- (id)newCachedSizedImage
{
  double v3 = objc_alloc_init(TSDImageRepCachedSizedImage);
  double v4 = *(NSObject **)&self->mSizingStateReady;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __34__TSDImageRep_newCachedSizedImage__block_invoke;
  v6[3] = &unk_2646B0750;
  v6[4] = v3;
  v6[5] = self;
  dispatch_sync(v4, v6);
  return v3;
}

uint64_t __34__TSDImageRep_newCachedSizedImage__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setImageRef:*(void *)(*(void *)(a1 + 40) + 704)];
  [*(id *)(a1 + 32) setImageMaskPath:*(void *)(*(void *)(a1 + 40) + 744)];
  objc_msgSend(*(id *)(a1 + 32), "setImageSize:", *(double *)(*(void *)(a1 + 40) + 712), *(double *)(*(void *)(a1 + 40) + 720));
  [*(id *)(a1 + 32) setImageOrientation:*(void *)(*(void *)(a1 + 40) + 728)];
  [*(id *)(a1 + 32) setImageHasMaskBakedIn:*(unsigned __int8 *)(*(void *)(a1 + 40) + 736)];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(unsigned __int8 *)(*(void *)(a1 + 40) + 737);

  return [v2 setImageHasAdjustmentsBakedImage:v3];
}

- (id)newCachedSizedImageWithNaturalSize
{
  id v2 = [(TSDImageRep *)self p_validatedBitmapImageProvider];
  if (!v2) {
    return 0;
  }
  uint64_t v3 = v2;
  double v4 = objc_alloc_init(TSDImageRepCachedSizedImage);
  -[TSDImageRepCachedSizedImage setImageRef:](v4, "setImageRef:", [v3 CGImageForNaturalSize]);
  [v3 naturalSize];
  -[TSDImageRepCachedSizedImage setImageSize:](v4, "setImageSize:");
  -[TSDImageRepCachedSizedImage setImageOrientation:](v4, "setImageOrientation:", [v3 orientation]);
  return v4;
}

- (void)useCachedSizedImage:(id)a3
{
  uint64_t v3 = *(NSObject **)&self->mSizingStateReady;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __35__TSDImageRep_useCachedSizedImage___block_invoke;
  v4[3] = &unk_2646B0750;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(v3, v4);
}

uint64_t __35__TSDImageRep_useCachedSizedImage___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(const void **)(v2 + 704);
  if (v3)
  {
    CFRelease(v3);
    *(void *)(*(void *)(a1 + 32) + 704) = 0;
    uint64_t v2 = *(void *)(a1 + 32);
  }
  double v4 = *(const void **)(v2 + 744);
  if (v4)
  {
    CFRelease(v4);
    *(void *)(*(void *)(a1 + 32) + 744) = 0;
  }
  *(void *)(*(void *)(a1 + 32) + 704) = CGImageRetain((CGImageRef)[*(id *)(a1 + 40) imageRef]);
  *(void *)(*(void *)(a1 + 32) + 744) = CGPathRetain((CGPathRef)[*(id *)(a1 + 40) imageMaskPath]);
  double v5 = (void *)(*(void *)(a1 + 32) + 712);
  [*(id *)(a1 + 40) imageSize];
  void *v5 = v6;
  v5[1] = v7;
  *(void *)(*(void *)(a1 + 32) + 728) = [*(id *)(a1 + 40) imageOrientation];
  *(unsigned char *)(*(void *)(a1 + 32) + 736) = [*(id *)(a1 + 40) imageHasMaskBakedIn];
  uint64_t result = [*(id *)(a1 + 40) imageHasAdjustmentsBakedImage];
  *(unsigned char *)(*(void *)(a1 + 32) + 737) = result;
  return result;
}

- (void)generateSizedImageOnBackgroundThread
{
  [(TSDImageRep *)self p_desiredSizedImageSize];
  double v4 = v3;
  double v6 = v5;
  if ([(TSDImageRep *)self p_shouldBakeMaskIntoSizedImage])
  {
    if (self->mSizedImageAccessQueue) {
      CGFloat height = self->mSizedImageSize.height;
    }
    else {
      CGFloat height = COERCE_DOUBLE(objc_msgSend(-[TSDImageRep p_validatedBitmapImageProvider](self, "p_validatedBitmapImageProvider"), "orientation"));
    }
    double v8 = +[TSDImageRep p_newPathToBakeIntoSizedImageForSize:withImageLayout:orientation:](TSDImageRep, "p_newPathToBakeIntoSizedImageForSize:withImageLayout:orientation:", [(TSDImageRep *)self imageLayout], *(void *)&height, v4, v6);
  }
  else
  {
    double v8 = 0;
  }
  double v9 = -[TSDImageRepSizingState initWithDesiredSize:provider:maskPath:wideGamutCanvas:]([TSDImageRepSizingState alloc], "initWithDesiredSize:provider:maskPath:wideGamutCanvas:", [(TSDImageRep *)self p_imageProvider], v8, [(TSDCanvas *)[(TSDRep *)self canvas] canvasIsWideGamut], v4, v6);
  CGPathRelease(v8);
  global_queue = dispatch_get_global_queue(-2, 0);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __51__TSDImageRep_generateSizedImageOnBackgroundThread__block_invoke;
  v11[3] = &unk_2646B0750;
  v11[4] = v9;
  v11[5] = self;
  dispatch_async(global_queue, v11);
}

void __51__TSDImageRep_generateSizedImageOnBackgroundThread__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) generateSizedImage];
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __51__TSDImageRep_generateSizedImageOnBackgroundThread__block_invoke_2;
  v2[3] = &unk_2646B0750;
  int8x16_t v3 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
  dispatch_async(MEMORY[0x263EF83A0], v2);
}

void __51__TSDImageRep_generateSizedImageOnBackgroundThread__block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) hasBeenRemoved]) {
    return;
  }
  int v2 = objc_msgSend(*(id *)(a1 + 32), "p_takeSizedImageFromState:", *(void *)(a1 + 40));
  int8x16_t v3 = *(double **)(a1 + 32);
  if (v2)
  {
    if (!*((void *)v3 + 88)) {
      goto LABEL_10;
    }
    double v4 = v3 + 89;
    objc_msgSend(v3, "p_desiredSizedImageSize");
    if (*v4 != v6 || v4[1] != v5)
    {
      int8x16_t v3 = *(double **)(a1 + 32);
LABEL_10:
      if (objc_msgSend((id)objc_msgSend(v3, "p_imageProvider"), "isValid"))
      {
        uint64_t v8 = *(void *)(a1 + 32);
        double v9 = *(NSObject **)(v8 + 696);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __51__TSDImageRep_generateSizedImageOnBackgroundThread__block_invoke_3;
        block[3] = &unk_2646AF7B8;
        block[4] = v8;
        dispatch_sync(v9, block);
      }
    }
  }
  else
  {
    double v10 = (void *)[v3 interactiveCanvasController];
    [v10 invalidateLayers];
  }
}

void *__51__TSDImageRep_generateSizedImageOnBackgroundThread__block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void **)(a1 + 32);
  if (!result[85]) {
    return objc_msgSend(result, "p_startSizing");
  }
  return result;
}

- (BOOL)shouldShowSmartMaskKnobs
{
  uint64_t v3 = objc_msgSend(-[TSDImageRep maskLayout](self, "maskLayout"), "maskInfo");
  if (v3 == objc_msgSend(-[TSDImageRep imageInfo](self, "imageInfo"), "maskInfo"))
  {
    int v4 = objc_msgSend(-[TSDImageRep maskLayout](self, "maskLayout"), "hasSmartPath");
  }
  else
  {
    objc_msgSend((id)objc_msgSend(-[TSDImageRep imageInfo](self, "imageInfo"), "maskInfo"), "pathSource");
    objc_opt_class();
    uint64_t v8 = &unk_26D78C0F8;
    int v4 = TSUClassAndProtocolCast() != 0;
  }
  int v5 = objc_msgSend(-[TSDImageRep imageInfo](self, "imageInfo", v8), "isMasked");
  LOBYTE(v6) = 0;
  if (v5)
  {
    if (v4)
    {
      int v6 = [(TSDRep *)self isSelected];
      if (v6)
      {
        if (objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "isInMaskEditMode")
          && objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "maskEditMode") != 2)
        {
          LOBYTE(v6) = 0;
        }
        else
        {
          LOBYTE(v6) = objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "isInInstantAlphaMode") ^ 1;
        }
      }
    }
  }
  return v6;
}

- (BOOL)shouldCreateSelectionKnobs
{
  if (objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "isInInstantAlphaMode")) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)TSDImageRep;
  return [(TSDRep *)&v4 shouldCreateSelectionKnobs];
}

- (void)updatePositionsOfKnobs:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v25.receiver = self;
  v25.super_class = (Class)TSDImageRep;
  -[TSDMediaRep updatePositionsOfKnobs:](&v25, sel_updatePositionsOfKnobs_);
  if ([(TSDImageRep *)self shouldShowSmartMaskKnobs])
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v5 = [a3 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v22 != v7) {
            objc_enumerationMutation(a3);
          }
          double v9 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if ((unint64_t)[v9 tag] >= 0xC && (unint64_t)objc_msgSend(v9, "tag") <= 0x10)
          {
            objc_msgSend(-[TSDImageRep maskLayout](self, "maskLayout"), "getControlKnobPosition:", objc_msgSend(v9, "tag"));
            double v16 = v11;
            double v17 = v10;
            id v12 = [(TSDImageRep *)self imageLayout];
            if (v12)
            {
              [v12 layoutToMaskTransform];
              float64x2_t v13 = v18;
              float64x2_t v14 = v19;
              float64x2_t v15 = v20;
            }
            else
            {
              float64x2_t v19 = 0u;
              float64x2_t v20 = 0u;
              float64x2_t v15 = 0uLL;
              float64x2_t v13 = 0uLL;
              float64x2_t v14 = 0uLL;
              float64x2_t v18 = 0u;
            }
            objc_msgSend(v9, "setPosition:", vaddq_f64(v15, vmlaq_n_f64(vmulq_n_f64(v14, v16), v13, v17)));
          }
        }
        uint64_t v6 = [a3 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v6);
    }
  }
}

- (void)addKnobsToArray:(id)a3
{
  v20.receiver = self;
  v20.super_class = (Class)TSDImageRep;
  -[TSDMediaRep addKnobsToArray:](&v20, sel_addKnobsToArray_);
  if ([(TSDImageRep *)self shouldShowSmartMaskKnobs])
  {
    uint64_t v5 = objc_msgSend(-[TSDImageRep maskLayout](self, "maskLayout"), "numberOfControlKnobs");
    if (v5)
    {
      uint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        objc_msgSend(-[TSDImageRep maskLayout](self, "maskLayout"), "getControlKnobPosition:", i + 12);
        double v15 = v9;
        double v16 = v8;
        id v10 = [(TSDImageRep *)self imageLayout];
        if (v10)
        {
          [v10 layoutToMaskTransform];
          float64x2_t v11 = v17;
          float64x2_t v12 = v18;
          float64x2_t v13 = v19;
        }
        else
        {
          float64x2_t v18 = 0u;
          float64x2_t v19 = 0u;
          float64x2_t v13 = 0uLL;
          float64x2_t v11 = 0uLL;
          float64x2_t v12 = 0uLL;
          float64x2_t v17 = 0u;
        }
        float64x2_t v14 = [[TSDKnob alloc] initWithType:0 position:i + 12 radius:self tag:vaddq_f64(v13, vmlaq_n_f64(vmulq_n_f64(v12, v15), v11, v16)) onRep:15.0];
        [a3 addObject:v14];
      }
    }
  }
}

- (double)additionalRotationForKnobOrientation
{
  v8.receiver = self;
  v8.super_class = (Class)TSDImageRep;
  [(TSDRep *)&v8 additionalRotationForKnobOrientation];
  double v4 = v3;
  if (objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "isInMaskEditMode")
    && objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "maskEditMode") == 3)
  {
    uint64_t v5 = objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "maskLayout");
    if (v5) {
      [v5 transform];
    }
    else {
      memset(v7, 0, sizeof(v7));
    }
    return v4 - TSDTransformAngle((double *)v7);
  }
  return v4;
}

- (BOOL)shouldShowMediaReplaceUI
{
  if (objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "isInMaskEditMode")) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)TSDImageRep;
  return [(TSDMediaRep *)&v4 shouldShowMediaReplaceUI];
}

- (void)p_invalidateHitTestCache
{
}

- (BOOL)p_hitCacheGetCachedValue:(BOOL *)a3 forPoint:(CGPoint)a4
{
  uint64_t v5 = objc_msgSend(self->mCachedSizedImageOrientation, "objectForKey:", objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", a4.x, a4.y));
  uint64_t v6 = v5;
  if (v5) {
    *a3 = [v5 BOOLValue];
  }
  return v6 != 0;
}

- (void)p_hitCacheSetCachedValue:(BOOL)a3 forPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  BOOL v6 = a3;
  p_mHitTestCache = &self->mHitTestCache;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__TSDImageRep_p_hitCacheSetCachedValue_forPoint___block_invoke;
  block[3] = &unk_2646AF7B8;
  block[4] = self;
  if (*p_mHitTestCache != (NSCache *)-1) {
    dispatch_once((dispatch_once_t *)p_mHitTestCache, block);
  }
  mCachedSizedImageOrientation = (void *)self->mCachedSizedImageOrientation;
  uint64_t v10 = [NSNumber numberWithBool:v6];
  objc_msgSend(mCachedSizedImageOrientation, "setObject:forKey:", v10, objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", x, y));
}

id __49__TSDImageRep_p_hitCacheSetCachedValue_forPoint___block_invoke(uint64_t a1)
{
  id result = objc_alloc_init(MEMORY[0x263EFF8E0]);
  *(void *)(*(void *)(a1 + 32) + 784) = result;
  return result;
}

@end