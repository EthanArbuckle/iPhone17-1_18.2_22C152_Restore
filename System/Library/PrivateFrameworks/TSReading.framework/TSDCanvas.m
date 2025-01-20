@interface TSDCanvas
+ (void)p_recursivelyAddOrderedChildrenOfRep:(id)a3 toArray:(id)a4;
- (BOOL)allowsFontSubpixelQuantization;
- (BOOL)canvasIsWideGamut;
- (BOOL)i_needsLayout;
- (BOOL)isCanvasInteractive;
- (BOOL)isDrawingIntoPDF;
- (BOOL)isPrinting;
- (BOOL)isTemporaryForLayout;
- (BOOL)pInTearDown;
- (BOOL)p_expandHitRegionOfPoint:(CGPoint)a3 forRep:(id)a4 smallRepOutset:(double)a5 forShortestDistance:(double *)a6;
- (BOOL)p_shouldRep:(id)a3 countAsClosestSmallRepForSizeLimit:(double)a4;
- (BOOL)p_updateRepsFromLayouts;
- (BOOL)shouldShowInstructionalText;
- (BOOL)shouldShowTextOverflowGlyphs;
- (BOOL)shouldSuppressBackgrounds;
- (BOOL)spellCheckingSupported;
- (BOOL)spellCheckingSuppressed;
- (BOOL)supportsAdaptiveLayout;
- (CGColor)backgroundColor;
- (CGContext)i_createContextToDrawImageInScaledRect:(CGRect)a3 withTargetIntegralSize:(CGSize)a4 returningBounds:(CGRect *)a5 integralBounds:(CGRect *)a6;
- (CGImage)i_image;
- (CGImage)i_imageInScaledRect:(CGRect)a3;
- (CGImage)i_imageInScaledRect:(CGRect)a3 withTargetIntegralSize:(CGSize)a4 distortedToMatch:(BOOL)a5;
- (CGImage)i_newImageInContext:(CGContext *)a3 bounds:(CGRect)a4 integralBounds:(CGRect)a5 distortedToMatch:(BOOL)a6;
- (CGPoint)convertBoundsToUnscaledPoint:(CGPoint)a3;
- (CGPoint)convertUnscaledToBoundsPoint:(CGPoint)a3;
- (CGRect)convertBoundsToUnscaledRect:(CGRect)a3;
- (CGRect)convertUnscaledToBoundsRect:(CGRect)a3;
- (CGRect)i_approximateScaledFrameOfEditingMenuAtPoint:(CGPoint)a3;
- (CGRect)i_clipRectForCreatingRepsFromLayouts;
- (CGRect)i_unscaledRectOfLayouts;
- (CGRect)p_bounds;
- (CGRect)visibleUnscaledRectForClippingReps;
- (CGSize)convertBoundsToUnscaledSize:(CGSize)a3;
- (CGSize)convertUnscaledToBoundsSize:(CGSize)a3;
- (CGSize)unscaledSize;
- (NSArray)allRepsOrdered;
- (NSArray)infosToDisplay;
- (TSDCanvas)init;
- (TSDCanvasDelegate)delegate;
- (TSDInteractiveCanvasController)canvasController;
- (TSDLayoutController)layoutController;
- (TSKAccessController)accessController;
- (TSKChangeNotifier)changeNotifier;
- (TSKDocumentRoot)documentRoot;
- (TSPObjectContext)objectContext;
- (UIEdgeInsets)contentInset;
- (double)contentsScale;
- (double)viewScale;
- (id)allReps;
- (id)hitRep:(CGPoint)a3 inTopLevelReps:(id)a4 smallRepOutset:(double)a5 withGesture:(id)a6 passingTest:(id)a7;
- (id)initForTemporaryLayout;
- (id)layoutGeometryProviderForLayout:(id)a3;
- (id)repForLayout:(id)a3;
- (id)textRendererForLayer:(id)a3 context:(CGContext *)a4;
- (id)topLevelReps;
- (void)addBitmapsToRenderingQualityInfo:(id)a3 inContext:(CGContext *)a4;
- (void)dealloc;
- (void)i_clipsImagesToBounds:(BOOL)a3;
- (void)i_drawBackgroundInContext:(CGContext *)a3;
- (void)i_drawBackgroundInContext:(CGContext *)a3 bounds:(CGRect)a4;
- (void)i_drawRepsInContext:(CGContext *)a3;
- (void)i_drawRepsInContext:(CGContext *)a3 distort:(CGAffineTransform *)a4;
- (void)i_registerRep:(id)a3;
- (void)i_setCanvasController:(id)a3;
- (void)i_setCanvasIsWideGamut:(BOOL)a3;
- (void)i_setContentsScale:(double)a3;
- (void)i_setInfosToDisplay:(id)a3 updatingLayoutController:(BOOL)a4;
- (void)i_unregisterRep:(id)a3;
- (void)i_updateInfosInLayoutController;
- (void)invalidateLayers;
- (void)invalidateReps;
- (void)invalidateVisibleBounds;
- (void)layoutIfNeeded;
- (void)layoutInvalidated;
- (void)p_layoutWithReadLock;
- (void)p_removeAllReps;
- (void)recreateAllLayoutsAndReps;
- (void)setAllowsFontSubpixelQuantization:(BOOL)a3;
- (void)setBackgroundColor:(CGColor *)a3;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setDelegate:(id)a3;
- (void)setInfosToDisplay:(id)a3;
- (void)setPInTearDown:(BOOL)a3;
- (void)setUnscaledSize:(CGSize)a3;
- (void)setViewScale:(double)a3;
- (void)teardown;
@end

@implementation TSDCanvas

- (TSDCanvas)init
{
  v5.receiver = self;
  v5.super_class = (Class)TSDCanvas;
  v2 = [(TSDCanvas *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->mViewScale = 1.0;
    v2->mUnscaledSize = (CGSize)vdupq_n_s64(0x4059000000000000uLL);
    *(_OWORD *)&v2->mContentInset.top = TSDEdgeInsetsZero;
    *(_OWORD *)&v2->mContentInset.bottom = *(_OWORD *)&qword_223839588;
    v2->mInfos = (NSArray *)objc_alloc_init(MEMORY[0x263EFF8C0]);
    v3->mTopLevelReps = (NSArray *)objc_alloc_init(MEMORY[0x263EFF8C0]);
    v3->mAllReps = (NSSet *)objc_alloc_init(MEMORY[0x263EFFA08]);
    v3->mRepsByLayout = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, 0, 0);
    v3->mLayoutController = [[TSDLayoutController alloc] initWithCanvas:v3];
    *(_WORD *)&v3->mClipToCanvas = 257;
    v3->mContentsScale = 1.0;
    v3->mWideGamut = 1;
  }
  return v3;
}

- (id)initForTemporaryLayout
{
  id result = [(TSDCanvas *)self init];
  if (result) {
    *((unsigned char *)result + 72) = 1;
  }
  return result;
}

- (void)teardown
{
  [(TSDCanvas *)self setPInTearDown:1];

  self->mInfos = 0;
  [(TSDLayoutController *)[(TSDCanvas *)self layoutController] i_removeAllLayouts];

  self->mLayoutController = 0;
  [(TSDCanvas *)self p_removeAllReps];
  if (objc_opt_respondsToSelector())
  {
    mDelegate = self->mDelegate;
    [(TSDCanvasDelegate *)mDelegate canvasDidUpdateRepsFromLayouts:self];
  }
}

- (void)dealloc
{
  if (self->mInfos)
  {
    v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSDCanvas dealloc]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDCanvas.m"), 100, @"Canvas must be torn down before being deallocated");
  }
  [(TSDLayoutController *)self->mLayoutController setInfos:0];

  self->mLayoutController = 0;
  mRepsByLayout = self->mRepsByLayout;
  if (mRepsByLayout)
  {
    CFRelease(mRepsByLayout);
    self->mRepsByLayout = 0;
  }

  self->mTopLevelReps = 0;
  self->mAllReps = 0;

  self->mAllRepsOrdered = 0;
  self->mInfos = 0;

  self->mPreviouslyVisibleLayouts = 0;
  CGColorRelease(self->mBackgroundColor);
  v6.receiver = self;
  v6.super_class = (Class)TSDCanvas;
  [(TSDCanvas *)&v6 dealloc];
}

- (TSKDocumentRoot)documentRoot
{
  return (TSKDocumentRoot *)[(TSDCanvasDelegate *)self->mDelegate documentRoot];
}

- (TSPObjectContext)objectContext
{
  v2 = [(TSDCanvas *)self documentRoot];

  return [(TSPObject *)v2 context];
}

- (TSKChangeNotifier)changeNotifier
{
  v2 = [(TSDCanvas *)self documentRoot];

  return [(TSKDocumentRoot *)v2 changeNotifier];
}

- (TSKAccessController)accessController
{
  v2 = [(TSDCanvas *)self documentRoot];

  return [(TSKDocumentRoot *)v2 accessController];
}

- (void)i_setCanvasController:(id)a3
{
  if (self->mCanvasController)
  {
    objc_super v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSDCanvas i_setCanvasController:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDCanvas.m"), 154, @"expected nil value for '%s'", "mCanvasController");
  }
  if (!a3)
  {
    v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"-[TSDCanvas i_setCanvasController:]"];
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDCanvas.m"), 155, @"invalid nil value for '%s'", "icc");
  }
  if (!self->mCanvasController) {
    self->mCanvasController = (TSDInteractiveCanvasController *)a3;
  }
}

- (TSDInteractiveCanvasController)canvasController
{
  return self->mCanvasController;
}

- (void)setInfosToDisplay:(id)a3
{
}

- (void)i_setInfosToDisplay:(id)a3 updatingLayoutController:(BOOL)a4
{
  BOOL v4 = a4;

  if (a3) {
    v7 = (NSArray *)[a3 copy];
  }
  else {
    v7 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF8C0]);
  }
  self->mInfos = v7;
  if (v4)
  {
    [(TSDCanvas *)self i_updateInfosInLayoutController];
  }
}

- (void)i_updateInfosInLayoutController
{
  v3 = [(TSDCanvas *)self layoutController];
  mInfos = self->mInfos;

  [(TSDLayoutController *)v3 setInfos:mInfos];
}

- (id)repForLayout:(id)a3
{
  if (a3) {
    return (id)CFDictionaryGetValue(self->mRepsByLayout, a3);
  }
  else {
    return 0;
  }
}

- (id)topLevelReps
{
  v2 = self->mTopLevelReps;

  return v2;
}

- (id)allReps
{
  v2 = self->mAllReps;

  return v2;
}

- (NSArray)allRepsOrdered
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  mAllRepsOrdered = self->mAllRepsOrdered;
  if (!mAllRepsOrdered)
  {
    BOOL v4 = (void *)[MEMORY[0x263EFF980] array];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    mTopLevelReps = self->mTopLevelReps;
    uint64_t v6 = [(NSArray *)mTopLevelReps countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(mTopLevelReps);
          }
          objc_msgSend((id)objc_opt_class(), "p_recursivelyAddOrderedChildrenOfRep:toArray:", *(void *)(*((void *)&v11 + 1) + 8 * i), v4);
        }
        uint64_t v7 = [(NSArray *)mTopLevelReps countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
    mAllRepsOrdered = (NSArray *)[v4 copy];
    self->mAllRepsOrdered = mAllRepsOrdered;
  }
  return mAllRepsOrdered;
}

- (void)recreateAllLayoutsAndReps
{
  [(TSDLayoutController *)[(TSDCanvas *)self layoutController] i_removeAllLayouts];
  [(TSDCanvas *)self p_updateRepsFromLayouts];
  if (objc_opt_respondsToSelector()) {
    [(TSDCanvasDelegate *)self->mDelegate canvasDidUpdateRepsFromLayouts:self];
  }
  [(TSDLayoutController *)[(TSDCanvas *)self layoutController] setInfos:self->mInfos];

  [(TSDCanvas *)self layoutInvalidated];
}

- (void)layoutInvalidated
{
  *(unsigned char *)&self->mInvalidFlags |= 1u;
  if (objc_opt_respondsToSelector())
  {
    mDelegate = self->mDelegate;
    [(TSDCanvasDelegate *)mDelegate canvasLayoutInvalidated:self];
  }
}

- (void)invalidateReps
{
  *(unsigned char *)&self->mInvalidFlags |= 2u;
  if (objc_opt_respondsToSelector())
  {
    mDelegate = self->mDelegate;
    [(TSDCanvasDelegate *)mDelegate canvasLayoutInvalidated:self];
  }
}

- (void)invalidateVisibleBounds
{
  *(unsigned char *)&self->mInvalidFlags |= 4u;
  if (objc_opt_respondsToSelector())
  {
    mDelegate = self->mDelegate;
    [(TSDCanvasDelegate *)mDelegate canvasLayoutInvalidated:self];
  }
}

- (void)invalidateLayers
{
  *(unsigned char *)&self->mInvalidFlags |= 8u;
  if (objc_opt_respondsToSelector())
  {
    mDelegate = self->mDelegate;
    [(TSDCanvasDelegate *)mDelegate canvasLayoutInvalidated:self];
  }
}

- (void)layoutIfNeeded
{
  [(TSDCanvas *)self p_layoutWithReadLock];
  if ((*(unsigned char *)&self->mInvalidFlags & 0xF) == 1 && !self->mInLayout)
  {
    v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSDCanvas layoutIfNeeded]"];
    uint64_t v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDCanvas.m"];
    [v3 handleFailureInFunction:v4 file:v5 lineNumber:302 description:@"failed to clear mInvalidFlags after layout"];
  }
}

- (BOOL)i_needsLayout
{
  return (*(unsigned char *)&self->mInvalidFlags & 0xF) != 0;
}

- (BOOL)supportsAdaptiveLayout
{
  if (!self->mDelegate || (objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  mDelegate = self->mDelegate;

  return [(TSDCanvasDelegate *)mDelegate supportsAdaptiveLayout];
}

- (id)layoutGeometryProviderForLayout:(id)a3
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  mDelegate = self->mDelegate;

  return (id)[(TSDCanvasDelegate *)mDelegate canvas:self layoutGeometryProviderForLayout:a3];
}

- (BOOL)spellCheckingSupported
{
  int v3 = [(TSDCanvas *)self isCanvasInteractive];
  if (v3)
  {
    if (objc_opt_respondsToSelector())
    {
      mDelegate = self->mDelegate;
      LOBYTE(v3) = [(TSDCanvasDelegate *)mDelegate spellCheckingSupported];
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
  int v3 = ![(TSDCanvas *)self spellCheckingSupported];
  if (v3) {
    return 1;
  }
  if (objc_opt_respondsToSelector()) {
    return [(TSDCanvasDelegate *)self->mDelegate spellCheckingSuppressed] | v3;
  }
  return 0;
}

- (BOOL)isCanvasInteractive
{
  if (!self->mDelegate || (objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  mDelegate = self->mDelegate;

  return [(TSDCanvasDelegate *)mDelegate isCanvasInteractive];
}

- (BOOL)isPrinting
{
  if (!self->mDelegate || (objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  mDelegate = self->mDelegate;

  return [(TSDCanvasDelegate *)mDelegate isPrintingCanvas];
}

- (BOOL)shouldShowTextOverflowGlyphs
{
  if (!self->mDelegate || (objc_opt_respondsToSelector() & 1) == 0) {
    return 1;
  }
  mDelegate = self->mDelegate;

  return [(TSDCanvasDelegate *)mDelegate shouldShowTextOverflowGlyphs];
}

- (BOOL)shouldShowInstructionalText
{
  if (self->mDelegate && (objc_opt_respondsToSelector() & 1) != 0)
  {
    mDelegate = self->mDelegate;
    return [(TSDCanvasDelegate *)mDelegate shouldShowInstructionalText];
  }
  else if ([(TSDCanvas *)self isCanvasInteractive])
  {
    return 1;
  }
  else
  {
    return [(TSDCanvas *)self isTemporaryForLayout];
  }
}

- (BOOL)shouldSuppressBackgrounds
{
  if (!self->mDelegate || (objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  mDelegate = self->mDelegate;

  return [(TSDCanvasDelegate *)mDelegate shouldSuppressBackgrounds];
}

- (BOOL)isDrawingIntoPDF
{
  if (!self->mDelegate || (objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  mDelegate = self->mDelegate;

  return [(TSDCanvasDelegate *)mDelegate isCanvasDrawingIntoPDF:self];
}

- (void)i_setContentsScale:(double)a3
{
  self->mContentsScale = a3;
}

- (double)contentsScale
{
  return self->mContentsScale;
}

- (void)i_setCanvasIsWideGamut:(BOOL)a3
{
  self->mWideGamut = a3;
}

- (BOOL)canvasIsWideGamut
{
  return self->mWideGamut;
}

- (void)setBackgroundColor:(CGColor *)a3
{
  mBackgroundColor = self->mBackgroundColor;
  if (mBackgroundColor != a3)
  {
    CGColorRelease(mBackgroundColor);
    if (a3) {
      Copy = CGColorCreateCopy(a3);
    }
    else {
      Copy = 0;
    }
    self->mBackgroundColor = Copy;
  }
}

- (CGRect)convertUnscaledToBoundsRect:(CGRect)a3
{
  double v3 = TSDMultiplyRectScalar(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, self->mViewScale);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)convertBoundsToUnscaledRect:(CGRect)a3
{
  double v3 = TSDMultiplyRectScalar(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, 1.0 / self->mViewScale);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGPoint)convertUnscaledToBoundsPoint:(CGPoint)a3
{
  double v3 = TSDMultiplyPointScalar(a3.x, a3.y, self->mViewScale);
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)convertBoundsToUnscaledPoint:(CGPoint)a3
{
  double v3 = TSDMultiplyPointScalar(a3.x, a3.y, 1.0 / self->mViewScale);
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGSize)convertUnscaledToBoundsSize:(CGSize)a3
{
  double v3 = TSDMultiplySizeScalar(a3.width, a3.height, self->mViewScale);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)convertBoundsToUnscaledSize:(CGSize)a3
{
  double v3 = TSDMultiplySizeScalar(a3.width, a3.height, 1.0 / self->mViewScale);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGRect)visibleUnscaledRectForClippingReps
{
  if (self->mDelegate && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [(TSDCanvasDelegate *)self->mDelegate visibleScaledBoundsForClippingRepsOnCanvas:self];
    -[TSDCanvas convertBoundsToUnscaledRect:](self, "convertBoundsToUnscaledRect:");
  }
  else
  {
    [(TSDCanvas *)self p_bounds];
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (id)hitRep:(CGPoint)a3 inTopLevelReps:(id)a4 smallRepOutset:(double)a5 withGesture:(id)a6 passingTest:(id)a7
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v54 = *MEMORY[0x263EF8340];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v13 = (void *)[a4 reverseObjectEnumerator];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v47 objects:v53 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v48;
    while (2)
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v48 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        objc_msgSend(v18, "convertNaturalPointFromUnscaledCanvas:", x, y);
        v19 = objc_msgSend(v18, "hitRepChrome:passingTest:", a7);
        if (v19) {
          return v19;
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v47 objects:v53 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }
  uint64_t v46 = 0x7FF0000000000000;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  obuint64_t j = (id)[a4 reverseObjectEnumerator];
  uint64_t v34 = [obj countByEnumeratingWithState:&v42 objects:v52 count:16];
  if (!v34) {
    return 0;
  }
  v20 = 0;
  uint64_t v33 = *(void *)v43;
  while (2)
  {
    uint64_t v21 = 0;
    do
    {
      if (*(void *)v43 != v33) {
        objc_enumerationMutation(obj);
      }
      v22 = *(void **)(*((void *)&v42 + 1) + 8 * v21);
      objc_msgSend(v22, "convertNaturalPointFromUnscaledCanvas:", x, y);
      uint64_t v23 = objc_msgSend(v22, "hitRep:withGesture:passingTest:", a6, a7);
      if (v23)
      {
        v30 = (void *)v23;
        goto LABEL_38;
      }
      objc_opt_class();
      uint64_t v36 = v21;
      if (objc_opt_isKindOfClass())
      {
        v24 = (void *)[v22 allRepsContainedInGroup];
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        uint64_t v25 = [v24 countByEnumeratingWithState:&v38 objects:v51 count:16];
        if (v25)
        {
          uint64_t v26 = v25;
          uint64_t v27 = *(void *)v39;
          do
          {
            for (uint64_t j = 0; j != v26; ++j)
            {
              if (*(void *)v39 != v27) {
                objc_enumerationMutation(v24);
              }
              uint64_t v29 = *(void *)(*((void *)&v38 + 1) + 8 * j);
              if ((!a7
                 || (*((unsigned int (**)(id, void))a7 + 2))(a7, *(void *)(*((void *)&v38 + 1) + 8 * j)))&& -[TSDCanvas p_expandHitRegionOfPoint:forRep:smallRepOutset:forShortestDistance:](self, "p_expandHitRegionOfPoint:forRep:smallRepOutset:forShortestDistance:", v29, &v46, x, y, a5))
              {
                v20 = v22;
              }
            }
            uint64_t v26 = [v24 countByEnumeratingWithState:&v38 objects:v51 count:16];
          }
          while (v26);
        }
      }
      else if (-[TSDCanvas p_expandHitRegionOfPoint:forRep:smallRepOutset:forShortestDistance:](self, "p_expandHitRegionOfPoint:forRep:smallRepOutset:forShortestDistance:", v22, &v46, x, y, a5)&& (!a7 || (*((unsigned int (**)(id, void *))a7 + 2))(a7, v22)))
      {
        v20 = v22;
      }
      uint64_t v21 = v36 + 1;
    }
    while (v36 + 1 != v34);
    uint64_t v34 = [obj countByEnumeratingWithState:&v42 objects:v52 count:16];
    if (v34) {
      continue;
    }
    break;
  }
  v30 = 0;
LABEL_38:
  if (v20)
  {
    if (![(TSDCanvas *)self p_shouldRep:v30 countAsClosestSmallRepForSizeLimit:a5])
    {
      char v37 = 0;
      objc_msgSend(v30, "convertNaturalPointFromUnscaledCanvas:", x, y);
      objc_msgSend(v30, "shortestDistanceToPoint:countAsHit:", &v37);
      if (!v37) {
        return v20;
      }
    }
  }
  return v30;
}

- (BOOL)p_shouldRep:(id)a3 countAsClosestSmallRepForSizeLimit:(double)a4
{
  int v7 = [a3 shouldExpandHitRegionWhenSmall];
  if (v7)
  {
    [a3 naturalBounds];
    float v9 = v8;
    [a3 naturalBounds];
    float v11 = v10;
    double v12 = fminf(v9, v11);
    [(TSDCanvas *)self viewScale];
    LOBYTE(v7) = v13 * v12 < a4;
  }
  return v7;
}

- (BOOL)p_expandHitRegionOfPoint:(CGPoint)a3 forRep:(id)a4 smallRepOutset:(double)a5 forShortestDistance:(double *)a6
{
  double y = a3.y;
  double x = a3.x;
  if (!-[TSDCanvas p_shouldRep:countAsClosestSmallRepForSizeLimit:](self, "p_shouldRep:countAsClosestSmallRepForSizeLimit:", a5))
  {
    char v48 = 0;
    objc_msgSend(a4, "convertNaturalPointFromUnscaledCanvas:", x, y);
    objc_msgSend(a4, "shortestDistanceToPoint:countAsHit:", &v48);
    if (!v48) {
      goto LABEL_11;
    }
    goto LABEL_9;
  }
  [a4 naturalBounds];
  CGFloat v46 = v13;
  CGFloat v47 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  [a4 naturalBounds];
  double v19 = v18;
  [(TSDCanvas *)self viewScale];
  double v21 = v20 * v19;
  double v22 = 0.0;
  double v23 = 0.0;
  if (v21 < a5)
  {
    [(TSDCanvas *)self viewScale];
    double v23 = -a5 / v24;
  }
  [a4 naturalBounds];
  double v26 = v25;
  [(TSDCanvas *)self viewScale];
  if (v27 * v26 < a5)
  {
    [(TSDCanvas *)self viewScale];
    double v22 = -a5 / v28;
  }
  v50.origin.double y = v46;
  v50.origin.double x = v47;
  v50.size.CGFloat width = v15;
  v50.size.CGFloat height = v17;
  CGRect v51 = CGRectInset(v50, v23, v22);
  CGFloat v29 = v51.origin.x;
  CGFloat v30 = v51.origin.y;
  CGFloat width = v51.size.width;
  CGFloat height = v51.size.height;
  objc_msgSend(a4, "convertNaturalPointFromUnscaledCanvas:", x, y);
  v49.double x = v33;
  v49.double y = v34;
  v52.origin.double x = v29;
  v52.origin.double y = v30;
  v52.size.CGFloat width = width;
  v52.size.CGFloat height = height;
  BOOL v35 = CGRectContainsPoint(v52, v49);
  if (v35)
  {
    objc_msgSend(a4, "convertNaturalPointFromUnscaledCanvas:", x, y);
    CGFloat v37 = v36;
    CGFloat v39 = v38;
    [a4 naturalBounds];
    TSDDistanceToRect(v37, v39, v40, v41, v42, v43);
LABEL_9:
    if (v44 < *a6)
    {
      *a6 = v44;
      LOBYTE(v35) = 1;
      return v35;
    }
LABEL_11:
    LOBYTE(v35) = 0;
  }
  return v35;
}

- (void)i_registerRep:(id)a3
{
  if (a3)
  {
    if (self->mRepsByLayout)
    {
      uint64_t v5 = [a3 layout];
      if (v5)
      {
        double v6 = (const void *)v5;
        mRepsByLayout = self->mRepsByLayout;
        CFDictionarySetValue(mRepsByLayout, v6, a3);
      }
    }
  }
}

- (void)i_unregisterRep:(id)a3
{
  if (a3)
  {
    if (self->mRepsByLayout)
    {
      uint64_t v5 = (const void *)[a3 layout];
      if (v5)
      {
        double v6 = v5;
        if (CFDictionaryGetValue(self->mRepsByLayout, v5) == a3)
        {
          mRepsByLayout = self->mRepsByLayout;
          CFDictionaryRemoveValue(mRepsByLayout, v6);
        }
      }
    }
  }
}

- (CGRect)i_approximateScaledFrameOfEditingMenuAtPoint:(CGPoint)a3
{
  double v3 = TSDRectWithCenterAndSize(a3.x, a3.y + -30.0, 200.0);
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (CGRect)i_unscaledRectOfLayouts
{
  v2 = [(TSDCanvas *)self layoutController];

  [(TSDLayoutController *)v2 rectOfTopLevelLayouts];
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (CGRect)i_clipRectForCreatingRepsFromLayouts
{
  if (self->mDelegate && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [(TSDCanvasDelegate *)self->mDelegate visibleScaledBoundsForClippingRepsOnCanvas:self];
    -[TSDCanvas convertBoundsToUnscaledRect:](self, "convertBoundsToUnscaledRect:");
  }
  else
  {
    double v3 = *MEMORY[0x263F00190];
    double v4 = *(double *)(MEMORY[0x263F00190] + 8);
    double v5 = *(double *)(MEMORY[0x263F00190] + 16);
    double v6 = *(double *)(MEMORY[0x263F00190] + 24);
  }
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (void)i_drawBackgroundInContext:(CGContext *)a3
{
  ClipBoundingBodouble x = CGContextGetClipBoundingBox(a3);
  CGRect v7 = CGRectIntegral(ClipBoundingBox);

  -[TSDCanvas i_drawBackgroundInContext:bounds:](self, "i_drawBackgroundInContext:bounds:", a3, v7.origin.x, v7.origin.y, v7.size.width, v7.size.height);
}

- (void)i_drawBackgroundInContext:(CGContext *)a3 bounds:(CGRect)a4
{
  if (self->mBackgroundColor)
  {
    CGFloat height = a4.size.height;
    CGFloat width = a4.size.width;
    CGFloat y = a4.origin.y;
    CGFloat x = a4.origin.x;
    CGContextSaveGState(a3);
    CGContextSetFillColorWithColor(a3, self->mBackgroundColor);
    v11.origin.CGFloat x = x;
    v11.origin.CGFloat y = y;
    v11.size.CGFloat width = width;
    v11.size.CGFloat height = height;
    CGContextFillRect(a3, v11);
    CGContextRestoreGState(a3);
  }
}

- (void)addBitmapsToRenderingQualityInfo:(id)a3 inContext:(CGContext *)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (a3)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    mTopLevelReps = self->mTopLevelReps;
    uint64_t v7 = [(NSArray *)mTopLevelReps countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(mTopLevelReps);
          }
          [*(id *)(*((void *)&v11 + 1) + 8 * i) recursivelyPerformSelector:sel_addBitmapsToRenderingQualityInfo_inContext_ withObject:a3 withObject:a4];
        }
        uint64_t v8 = [(NSArray *)mTopLevelReps countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (void)i_drawRepsInContext:(CGContext *)a3 distort:(CGAffineTransform *)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (a3)
  {
    CGContextSaveGState(a3);
    CGContextScaleCTM(a3, self->mViewScale, self->mViewScale);
    BOOL v7 = a4->b == 0.0
      && a4->c == 0.0
      && a4->tx == 0.0
      && a4->ty == 0.0
      && fabs(a4->a + -1.0) < 0.001
      && fabs(a4->d + -1.0) < 0.001;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    mTopLevelReps = self->mTopLevelReps;
    uint64_t v9 = [(NSArray *)mTopLevelReps countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(mTopLevelReps);
          }
          long long v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          CGContextSaveGState(a3);
          if (!v7 || [v13 wantsToDistortWithImagerContext])
          {
            long long v14 = *(_OWORD *)&a4->c;
            *(_OWORD *)&v15.a = *(_OWORD *)&a4->a;
            *(_OWORD *)&v15.c = v14;
            *(_OWORD *)&v15.tCGFloat x = *(_OWORD *)&a4->tx;
            CGContextConcatCTM(a3, &v15);
          }
          [v13 recursivelyDrawInContext:a3];
          CGContextRestoreGState(a3);
        }
        uint64_t v10 = [(NSArray *)mTopLevelReps countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }
    CGContextRestoreGState(a3);
  }
}

- (void)i_drawRepsInContext:(CGContext *)a3
{
  long long v3 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v4[0] = *MEMORY[0x263F000D0];
  v4[1] = v3;
  v4[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  [(TSDCanvas *)self i_drawRepsInContext:a3 distort:v4];
}

- (void)i_clipsImagesToBounds:(BOOL)a3
{
  self->mClipToCanvas = a3;
}

- (CGImage)i_image
{
  return -[TSDCanvas i_imageInScaledRect:](self, "i_imageInScaledRect:", *MEMORY[0x263F00190], *(double *)(MEMORY[0x263F00190] + 8), *(double *)(MEMORY[0x263F00190] + 16), *(double *)(MEMORY[0x263F00190] + 24));
}

- (CGImage)i_imageInScaledRect:(CGRect)a3
{
  return -[TSDCanvas i_imageInScaledRect:withTargetIntegralSize:distortedToMatch:](self, "i_imageInScaledRect:withTargetIntegralSize:distortedToMatch:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
}

- (CGImage)i_imageInScaledRect:(CGRect)a3 withTargetIntegralSize:(CGSize)a4 distortedToMatch:(BOOL)a5
{
  BOOL v5 = a5;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  BOOL v7 = -[TSDCanvas i_createContextToDrawImageInScaledRect:withTargetIntegralSize:returningBounds:integralBounds:](self, "i_createContextToDrawImageInScaledRect:withTargetIntegralSize:returningBounds:integralBounds:", &v13, &v11, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.width, a4.height);
  if (!v7) {
    return 0;
  }
  uint64_t v8 = v7;
  uint64_t v9 = -[TSDCanvas i_newImageInContext:bounds:integralBounds:distortedToMatch:](self, "i_newImageInContext:bounds:integralBounds:distortedToMatch:", v7, v5, v13, v14, v11, v12);
  CGContextRelease(v8);
  return v9;
}

- (CGContext)i_createContextToDrawImageInScaledRect:(CGRect)a3 withTargetIntegralSize:(CGSize)a4 returningBounds:(CGRect *)a5 integralBounds:(CGRect *)a6
{
  double height = a4.height;
  double width = a4.width;
  double v8 = a3.size.height;
  double v9 = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (self->mClipToCanvas)
  {
    [(TSDCanvas *)self p_bounds];
    v34.origin.double x = TSDMultiplyRectScalar(v13, v14, v15, v16, self->mViewScale);
    v37.origin.double x = x;
    v37.origin.double y = y;
    v37.size.double width = v9;
    v37.size.double height = v8;
    CGRect v35 = CGRectIntersection(v34, v37);
    double x = v35.origin.x;
    double y = v35.origin.y;
    double v9 = v35.size.width;
    double v8 = v35.size.height;
  }
  double v17 = TSDRoundedRect(x, y, v9, v8);
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  if (width > 0.0 && height > 0.0)
  {
    double v24 = TSDCeilSize(width);
    double v26 = v21 - v24;
    double v27 = v23 - v25;
    if (v21 - v24 > 0.0 || v27 > 0.0)
    {
      if (v26 > 0.0) {
        double v21 = v24;
      }
      if (v27 > 0.0) {
        double v23 = v25;
      }
    }
    else if (v26 < 0.0 && v27 < 0.0)
    {
      if (v26 <= v27) {
        double v23 = v25;
      }
      else {
        double v21 = v24;
      }
    }
  }
  if (TSDNearlyEqualRects(x, y, v9, v8, v17, v19, v21, v23))
  {
    double x = v17;
    double y = v19;
    double v9 = v21;
    double v8 = v23;
  }
  v36.origin.double x = x;
  v36.origin.double y = y;
  v36.size.double width = v9;
  v36.size.double height = v8;
  v38.origin.double x = v17;
  v38.origin.double y = v19;
  v38.size.double width = v21;
  v38.size.double height = v23;
  if (CGRectEqualToRect(v36, v38)
    && (mBackgroundColor = self->mBackgroundColor) != 0
    && CGColorGetAlpha(mBackgroundColor) == 1.0)
  {
    char v29 = 1;
  }
  else
  {
    char v29 = 3;
  }
  if ([(TSDCanvas *)self canvasIsWideGamut]) {
    char v30 = v29 | 0x20;
  }
  else {
    char v30 = v29;
  }
  CGRect result = TSDBitmapContextCreate(v30, v21);
  if (a5)
  {
    a5->origin.double x = x;
    a5->origin.double y = y;
    a5->size.double width = v9;
    a5->size.double height = v8;
  }
  if (a6)
  {
    a6->origin.double x = v17;
    a6->origin.double y = v19;
    a6->size.double width = v21;
    a6->size.double height = v23;
  }
  return result;
}

- (CGImage)i_newImageInContext:(CGContext *)a3 bounds:(CGRect)a4 integralBounds:(CGRect)a5 distortedToMatch:(BOOL)a6
{
  if (!a3) {
    return 0;
  }
  BOOL v6 = a6;
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  double v11 = a4.size.height;
  double v12 = a4.size.width;
  CGContextSaveGState(a3);
  CGContextTranslateCTM(a3, 0.0, height);
  CGContextScaleCTM(a3, 1.0, -1.0);
  CGContextTranslateCTM(a3, -x, -y);
  v19.origin.double x = x;
  v19.origin.double y = y;
  v19.size.double width = width;
  v19.size.double height = height;
  CGContextClipToRect(a3, v19);
  long long v15 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&v18.a = *MEMORY[0x263F000D0];
  *(_OWORD *)&v18.c = v15;
  *(_OWORD *)&v18.tdouble x = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  if (v6) {
    CGAffineTransformMakeScale(&v18, width / v12, height / v11);
  }
  [(TSDCanvas *)self i_drawBackgroundInContext:a3];
  CGAffineTransform v17 = v18;
  [(TSDCanvas *)self i_drawRepsInContext:a3 distort:&v17];
  CGContextRestoreGState(a3);
  return CGBitmapContextCreateImage(a3);
}

- (CGRect)p_bounds
{
  double v3 = TSDRectWithSize();
  double top = self->mContentInset.top;
  double left = self->mContentInset.left;
  double v6 = v3 + left;
  double v8 = top + v7;
  double v10 = v9 - (left + self->mContentInset.right);
  double v12 = v11 - (top + self->mContentInset.bottom);
  result.size.double height = v12;
  result.size.double width = v10;
  result.origin.double y = v8;
  result.origin.double x = v6;
  return result;
}

- (void)p_layoutWithReadLock
{
  if (self->mInLayout) {
    return;
  }
  self->mInLayout = 1;
  char mInvalidFlags = (char)self->mInvalidFlags;
  if ((mInvalidFlags & 3) != 0)
  {
    if (*(unsigned char *)&self->mInvalidFlags)
    {
      if (objc_opt_respondsToSelector()) {
        [(TSDCanvasDelegate *)self->mDelegate canvasWillLayout:self];
      }
      [(TSDLayoutController *)[(TSDCanvas *)self layoutController] validateLayouts];
      if (objc_opt_respondsToSelector()) {
        [(TSDCanvasDelegate *)self->mDelegate canvasDidValidateLayouts:self];
      }
    }
    goto LABEL_10;
  }
  if ((*(unsigned char *)&self->mInvalidFlags & 4) != 0)
  {
LABEL_10:
    if (objc_opt_respondsToSelector()) {
      [(TSDCanvasDelegate *)self->mDelegate canvasWillUpdateRepsFromLayouts:self];
    }
    BOOL v4 = [(TSDCanvas *)self p_updateRepsFromLayouts];
    *(unsigned char *)&self->mInvalidFlags &= 0xF9u;
    if (objc_opt_respondsToSelector()) {
      [(TSDCanvasDelegate *)self->mDelegate canvasDidUpdateVisibleBounds:self];
    }
    goto LABEL_14;
  }
  BOOL v4 = 0;
LABEL_14:
  if ((mInvalidFlags & 1) != 0 || v4 || (*(unsigned char *)&self->mInvalidFlags & 8) != 0)
  {
    if (objc_opt_respondsToSelector()) {
      [(TSDCanvasDelegate *)self->mDelegate canvasDidUpdateRepsFromLayouts:self];
    }
    *(unsigned char *)&self->mInvalidFlags &= ~8u;
    if (mInvalidFlags & 1) != 0 && (objc_opt_respondsToSelector()) {
      [(TSDCanvasDelegate *)self->mDelegate canvasDidLayout:self];
    }
  }
  *(unsigned char *)&self->mInvalidFlags &= ~1u;
  self->mInLayout = 0;
}

- (BOOL)p_updateRepsFromLayouts
{
  uint64_t v100 = *MEMORY[0x263EF8340];
  [(TSDCanvas *)self i_clipRectForCreatingRepsFromLayouts];
  id v7 = -[TSDLayoutController layoutsInRect:]([(TSDCanvas *)self layoutController], "layoutsInRect:", v3, v4, v5, v6);
  if (objc_opt_respondsToSelector())
  {
    double v8 = (void *)[(TSDCanvasDelegate *)self->mDelegate additionalVisibleInfosForCanvas:self];
    long long v88 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v88 objects:v99 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v89;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v89 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = [(TSDLayoutController *)self->mLayoutController layoutForInfo:TSDTopmostInfoFromInfo(*(void **)(*((void *)&v88 + 1) + 8 * i))];
          if (v13)
          {
            id v14 = v13;
            if (([v7 containsObject:v13] & 1) == 0) {
              id v7 = (id)[v7 arrayByAddingObject:v14];
            }
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v88 objects:v99 count:16];
      }
      while (v10);
    }
  }
  if (objc_opt_respondsToSelector())
  {
    long long v15 = (void *)[(TSDCanvasDelegate *)self->mDelegate infosToHideForCanvas:self];
    if ([v15 count])
    {
      CGFloat v16 = (void *)[v7 mutableCopy];
      long long v84 = 0u;
      long long v85 = 0u;
      long long v86 = 0u;
      long long v87 = 0u;
      uint64_t v17 = [v7 countByEnumeratingWithState:&v84 objects:v98 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v85;
        do
        {
          for (uint64_t j = 0; j != v18; ++j)
          {
            if (*(void *)v85 != v19) {
              objc_enumerationMutation(v7);
            }
            double v21 = *(void **)(*((void *)&v84 + 1) + 8 * j);
            if (objc_msgSend(v15, "containsObject:", objc_msgSend(v21, "info"))) {
              [v16 removeObject:v21];
            }
          }
          uint64_t v18 = [v7 countByEnumeratingWithState:&v84 objects:v98 count:16];
        }
        while (v18);
      }
      id v7 = v16;
    }
  }
  id v22 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  uint64_t v23 = [v7 countByEnumeratingWithState:&v80 objects:v97 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v81;
    do
    {
      for (uint64_t k = 0; k != v24; ++k)
      {
        if (*(void *)v81 != v25) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(v22, "addObjectsFromArray:", objc_msgSend(*(id *)(*((void *)&v80 + 1) + 8 * k), "additionalLayoutsForRepCreation"));
      }
      uint64_t v24 = [v7 countByEnumeratingWithState:&v80 objects:v97 count:16];
    }
    while (v24);
  }
  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  uint64_t v27 = [v22 countByEnumeratingWithState:&v76 objects:v96 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v77;
    do
    {
      for (uint64_t m = 0; m != v28; ++m)
      {
        if (*(void *)v77 != v29) {
          objc_enumerationMutation(v22);
        }
        uint64_t v31 = *(void *)(*((void *)&v76 + 1) + 8 * m);
        if (([v7 containsObject:v31] & 1) == 0) {
          id v7 = (id)[v7 arrayByAddingObject:v31];
        }
      }
      uint64_t v28 = [v22 countByEnumeratingWithState:&v76 objects:v96 count:16];
    }
    while (v28);
  }

  if ((*(unsigned char *)&self->mInvalidFlags & 3) == 0
    && ([v7 isEqualToArray:self->mPreviouslyVisibleLayouts] & 1) != 0)
  {
    return 0;
  }

  CGFloat v33 = self;
  self->mPreviouslyVisibleLayouts = (NSArray *)v7;
  v59 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  CGRect v34 = (NSSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  uint64_t v35 = [v7 countByEnumeratingWithState:&v72 objects:v95 count:16];
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = *(void *)v73;
    do
    {
      uint64_t v38 = 0;
      v58 = sel_canvas_willLayoutRep_;
      do
      {
        if (*(void *)v73 != v37) {
          objc_enumerationMutation(v7);
        }
        CGFloat v39 = *(void **)(*((void *)&v72 + 1) + 8 * v38);
        id v40 = -[TSDCanvas repForLayout:](v33, "repForLayout:", v39, v58);
        if (v40) {
          goto LABEL_52;
        }
        id v40 = (id)objc_msgSend(objc_alloc((Class)objc_msgSend(v39, "repClassOverride")), "initWithLayout:canvas:", v39, v33);
        if (objc_opt_respondsToSelector()) {
          [(TSDCanvasDelegate *)v33->mDelegate canvas:v33 willLayoutRep:v40];
        }
        [v40 wasAddedToParent];
        if (v40)
        {
LABEL_52:
          [v40 setParentRep:0];
          [(NSArray *)v59 addObject:v40];
          [v40 updateChildrenFromLayout];
          [v40 recursivelyPerformSelector:sel_updateFromLayout];
          [v40 recursivelyPerformSelector:sel_addToSet_ withObject:v34];
        }
        ++v38;
      }
      while (v36 != v38);
      uint64_t v36 = [v7 countByEnumeratingWithState:&v72 objects:v95 count:16];
    }
    while (v36);
  }
  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  mTopLevelReps = v33->mTopLevelReps;
  uint64_t v42 = [(NSArray *)mTopLevelReps countByEnumeratingWithState:&v68 objects:v94 count:16];
  if (v42)
  {
    uint64_t v43 = v42;
    uint64_t v44 = *(void *)v69;
    do
    {
      for (uint64_t n = 0; n != v43; ++n)
      {
        if (*(void *)v69 != v44) {
          objc_enumerationMutation(mTopLevelReps);
        }
        CGFloat v46 = *(void **)(*((void *)&v68 + 1) + 8 * n);
        if (([(NSArray *)v59 tsu_containsObjectIdenticalTo:v46] & 1) == 0) {
          [v46 willBeRemovedFromParent];
        }
      }
      uint64_t v43 = [(NSArray *)mTopLevelReps countByEnumeratingWithState:&v68 objects:v94 count:16];
    }
    while (v43);
  }
  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  mAllReps = v33->mAllReps;
  uint64_t v48 = [(NSSet *)mAllReps countByEnumeratingWithState:&v64 objects:v93 count:16];
  if (v48)
  {
    uint64_t v49 = v48;
    uint64_t v50 = *(void *)v65;
    do
    {
      for (iuint64_t i = 0; ii != v49; ++ii)
      {
        if (*(void *)v65 != v50) {
          objc_enumerationMutation(mAllReps);
        }
        CGRect v52 = *(void **)(*((void *)&v64 + 1) + 8 * ii);
        if (![(NSSet *)v34 containsObject:v52]) {
          objc_msgSend(v52, "i_willBeRemoved");
        }
      }
      uint64_t v49 = [(NSSet *)mAllReps countByEnumeratingWithState:&v64 objects:v93 count:16];
    }
    while (v49);
  }
  if (objc_opt_respondsToSelector())
  {
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    uint64_t v53 = [(NSSet *)v34 countByEnumeratingWithState:&v60 objects:v92 count:16];
    if (v53)
    {
      uint64_t v54 = v53;
      uint64_t v55 = *(void *)v61;
      do
      {
        for (juint64_t j = 0; jj != v54; ++jj)
        {
          if (*(void *)v61 != v55) {
            objc_enumerationMutation(v34);
          }
          uint64_t v57 = *(void *)(*((void *)&v60 + 1) + 8 * jj);
          if (![(NSSet *)v33->mAllReps containsObject:v57]) {
            [(TSDCanvasDelegate *)v33->mDelegate canvas:v33 createdRep:v57];
          }
        }
        uint64_t v54 = [(NSSet *)v34 countByEnumeratingWithState:&v60 objects:v92 count:16];
      }
      while (v54);
    }
  }
  [(NSArray *)v59 sortUsingComparator:&__block_literal_global_43];

  v33->mAllReps = v34;
  v33->mTopLevelReps = v59;

  v33->mAllRepsOrdered = 0;
  return 1;
}

uint64_t __36__TSDCanvas_p_updateRepsFromLayouts__block_invoke()
{
  objc_opt_class();
  v0 = (void *)TSUDynamicCast();
  objc_opt_class();
  v1 = (void *)TSUDynamicCast();
  if [v0 forcesPlacementOnTop] && (objc_msgSend(v1, "forcesPlacementOnTop")) {
    return 0;
  }
  if ([v0 forcesPlacementOnTop]) {
    return 1;
  }
  return [v1 forcesPlacementOnTop] << 63 >> 63;
}

- (void)p_removeAllReps
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  mTopLevelReps = self->mTopLevelReps;
  uint64_t v4 = [(NSArray *)mTopLevelReps countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(mTopLevelReps);
        }
        [*(id *)(*((void *)&v17 + 1) + 8 * i) willBeRemovedFromParent];
      }
      uint64_t v5 = [(NSArray *)mTopLevelReps countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v5);
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  mAllReps = self->mAllReps;
  uint64_t v9 = [(NSSet *)mAllReps countByEnumeratingWithState:&v13 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      for (uint64_t j = 0; j != v10; ++j)
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(mAllReps);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * j), "i_willBeRemoved");
      }
      uint64_t v10 = [(NSSet *)mAllReps countByEnumeratingWithState:&v13 objects:v21 count:16];
    }
    while (v10);
  }

  self->mAllReps = (NSSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
  self->mTopLevelReps = (NSArray *)objc_alloc_init(MEMORY[0x263EFF980]);

  self->mAllRepsOrdered = 0;
}

+ (void)p_recursivelyAddOrderedChildrenOfRep:(id)a3 toArray:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  objc_msgSend(a4, "addObject:");
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
        objc_msgSend(a1, "p_recursivelyAddOrderedChildrenOfRep:toArray:", *(void *)(*((void *)&v11 + 1) + 8 * v10++), a4);
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (BOOL)pInTearDown
{
  return self->pInTearDown;
}

- (void)setPInTearDown:(BOOL)a3
{
  self->pInTearDowuint64_t n = a3;
}

- (TSDCanvasDelegate)delegate
{
  return self->mDelegate;
}

- (void)setDelegate:(id)a3
{
  self->mDelegate = (TSDCanvasDelegate *)a3;
}

- (NSArray)infosToDisplay
{
  return self->mInfos;
}

- (TSDLayoutController)layoutController
{
  return self->mLayoutController;
}

- (CGColor)backgroundColor
{
  return self->mBackgroundColor;
}

- (UIEdgeInsets)contentInset
{
  double top = self->mContentInset.top;
  double left = self->mContentInset.left;
  bottouint64_t m = self->mContentInset.bottom;
  double right = self->mContentInset.right;
  result.double right = right;
  result.bottouint64_t m = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  self->mContentInset = a3;
}

- (BOOL)allowsFontSubpixelQuantization
{
  return self->mAllowsFontSubpixelQuantization;
}

- (void)setAllowsFontSubpixelQuantization:(BOOL)a3
{
  self->mAllowsFontSubpixelQuantizatiouint64_t n = a3;
}

- (CGSize)unscaledSize
{
  double width = self->mUnscaledSize.width;
  double height = self->mUnscaledSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setUnscaledSize:(CGSize)a3
{
  self->mUnscaledSize = a3;
}

- (double)viewScale
{
  return self->mViewScale;
}

- (void)setViewScale:(double)a3
{
  self->mViewScale = a3;
}

- (BOOL)isTemporaryForLayout
{
  return self->mIsTemporaryForLayout;
}

- (id)textRendererForLayer:(id)a3 context:(CGContext *)a4
{
  uint64_t v7 = [[TSWPRenderer alloc] initWithContext:a4];
  if (TSDCGContextIsShadowContext((uint64_t)a4))
  {
    [(TSWPRenderer *)v7 setFlipShadows:1];
    double v8 = 1.0;
  }
  else
  {
    BOOL v9 = a3 && ([a3 contentsAreFlipped] & 1) != 0 || -[TSDCanvas isPrinting](self, "isPrinting");
    [(TSWPRenderer *)v7 setFlipShadows:v9];
    [(TSDCanvas *)self viewScale];
  }
  [(TSWPRenderer *)v7 setViewScale:v8];
  return v7;
}

@end