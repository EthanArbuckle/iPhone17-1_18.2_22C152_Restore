@interface CRLCanvas
+ (CGPoint)p_transformedUnscaledPoint:(CGPoint)a3 forTestingHitRep:(id)a4 withTransformFromBlock:(id)a5;
+ (id)p_hitRep:(CGPoint)a3 withPrecision:(BOOL)a4 inTopLevelReps:(id)a5 smallRepOutset:(double)a6 unscaledPointTransformForRep:(id)a7 passingTest:(id)a8;
+ (void)p_recursivelyAddOrderedChildrenOfRep:(id)a3 toArray:(id)a4;
- (BOOL)allowsFontSubpixelQuantization;
- (BOOL)canvasIsWideGamut;
- (BOOL)crlaxIsPreventingReloadingChildren;
- (BOOL)enableInstructionalText;
- (BOOL)i_InLayout;
- (BOOL)i_areContentLayersInvalidForRep:(id)a3;
- (BOOL)i_areOverlayLayersInvalidForRep:(id)a3;
- (BOOL)i_inLayout;
- (BOOL)i_needsLayout;
- (BOOL)i_shouldIgnoreClickThrough;
- (BOOL)isAnchoredAtRight;
- (BOOL)isCanvasInteractive;
- (BOOL)isDrawingIntoPDF;
- (BOOL)isLayoutComplete;
- (BOOL)isPrinting;
- (BOOL)isTemporaryForLayout;
- (BOOL)p_canvasShouldAlwaysUpdateLayers;
- (BOOL)p_isLayoutCompleteIncludingLayers:(BOOL)a3;
- (BOOL)p_needsLayoutNotIncludingLayers;
- (BOOL)p_updateRepsFromLayouts;
- (BOOL)shouldRenderInvisibleContentForNonInteractiveCanvas;
- (BOOL)shouldShowInstructionalTextForLayout:(id)a3;
- (BOOL)shouldShowTextOverflowGlyphs;
- (BOOL)shouldSuppressBackgrounds;
- (BOOL)spellCheckingSupported;
- (BOOL)spellCheckingSuppressed;
- (BOOL)suppressesShadowsAndReflections;
- (BOOL)suppressesShapeText;
- (BOOL)textLayoutMustIncludeAdornments;
- (CGContext)i_createContextToDrawImageInScaledRect:(CGRect)a3 withTargetIntegralSize:(CGSize)a4 distortedToMatch:(BOOL)a5 returningBounds:(CGRect *)a6 integralBounds:(CGRect *)a7;
- (CGImage)i_image;
- (CGImage)i_imageInScaledRect:(CGRect)a3 keepingChildrenPassingTest:(id)a4;
- (CGImage)i_imageInScaledRect:(CGRect)a3 withTargetIntegralSize:(CGSize)a4 distortedToMatch:(BOOL)a5 keepingChildrenPassingTest:(id)a6;
- (CGImage)i_newImageInContext:(CGContext *)a3 bounds:(CGRect)a4 integralBounds:(CGRect)a5 distortedToMatch:(BOOL)a6 keepingChildrenPassingTest:(id)a7;
- (CGPoint)convertBoundsToUnscaledPoint:(CGPoint)a3;
- (CGPoint)convertUnscaledToBoundsPoint:(CGPoint)a3;
- (CGRect)convertBoundsToUnscaledRect:(CGRect)a3;
- (CGRect)convertUnscaledToBoundsRect:(CGRect)a3;
- (CGRect)i_approximateScaledFrameOfEditingMenuAtPoint:(CGPoint)a3;
- (CGRect)i_clipRectForCreatingRepsFromLayouts;
- (CGRect)p_bounds;
- (CGRect)unscaledRectOfLayouts;
- (CGRect)visibleUnscaledRectForClippingReps;
- (CGSize)convertBoundsToUnscaledSize:(CGSize)a3;
- (CGSize)convertUnscaledToBoundsSize:(CGSize)a3;
- (CGSize)unscaledSize;
- (CRLBoardItemOwning)boardItemOwner;
- (CRLCanvas)init;
- (CRLCanvas)initWithLayoutControllerClass:(Class)a3 delegate:(id)a4;
- (CRLCanvasDelegate)delegate;
- (CRLCanvasLayoutController)layoutController;
- (CRLChangeNotifier)changeNotifier;
- (CRLColor)backgroundColor;
- (CRLInteractiveCanvasController)canvasController;
- (Class)rootLayoutClass;
- (NSArray)allRepsOrdered;
- (NSArray)infosToDisplay;
- (NSArray)topLevelReps;
- (NSSet)allReps;
- (NSSet)i_previousRenderDatasNeedingDownload;
- (UIEdgeInsets)contentInset;
- (double)contentsScale;
- (double)convertBoundsToUnscaledLength:(double)a3;
- (double)convertUnscaledToBoundsLength:(double)a3;
- (double)i_viewScaleForAudioObjectsInNonInteractiveCanvas;
- (double)viewScale;
- (id)hitRep:(CGPoint)a3 withPrecision:(BOOL)a4 inTopLevelReps:(id)a5 smallRepOutset:(double)a6 unscaledPointTransformForRep:(id)a7 passingTest:(id)a8;
- (id)initForTemporaryLayout;
- (id)repForLayout:(id)a3;
- (id)textRendererForLayer:(id)a3 context:(CGContext *)a4;
- (void)addBitmapsToRenderingQualityInfo:(id)a3 inContext:(CGContext *)a4;
- (void)afterLayoutIncludingLayers:(BOOL)a3 performBlock:(id)a4;
- (void)canvasInvalidatedForLayout:(id)a3;
- (void)canvasInvalidatedForRep:(id)a3;
- (void)dealloc;
- (void)i_drawBackgroundInContext:(CGContext *)a3;
- (void)i_drawBackgroundInContext:(CGContext *)a3 bounds:(CGRect)a4;
- (void)i_drawRepsInContext:(CGContext *)a3 passingTest:(id)a4;
- (void)i_drawRepsInContext:(CGContext *)a3 passingTest:(id)a4 distort:(CGAffineTransform *)a5;
- (void)i_layoutIfNeededUpdatingLayerTree;
- (void)i_performBlockWhileIgnoringClickThrough:(id)a3;
- (void)i_registerCanvasLayoutObserver:(id)a3;
- (void)i_registerRep:(id)a3;
- (void)i_setCanvasController:(id)a3;
- (void)i_setCanvasIsWideGamut:(BOOL)a3;
- (void)i_setContentsScale:(double)a3;
- (void)i_setInfosToDisplay:(id)a3 updatingLayoutController:(BOOL)a4;
- (void)i_setLayersInvalidWithoutInvalidatingAnySpecificLayers;
- (void)i_unregisterCanvasLayoutObserver:(id)a3;
- (void)i_unregisterRep:(id)a3;
- (void)i_updateInfosInLayoutController;
- (void)invalidateAllLayers;
- (void)invalidateContentLayersForRep:(id)a3;
- (void)invalidateOverlayLayersForRep:(id)a3;
- (void)invalidateReps;
- (void)invalidateVisibleBounds;
- (void)nonInteractiveLayoutIfNeeded;
- (void)orderRepsForLayout:(id)a3;
- (void)p_layoutWithReadLock;
- (void)p_removeAllReps;
- (void)p_setInvalidLayoutFlagAndCallDelegate;
- (void)performBlockAfterLayoutIfNecessary:(id)a3;
- (void)recreateAllLayoutsAndReps;
- (void)setAllowsFontSubpixelQuantization:(BOOL)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setDelegate:(id)a3;
- (void)setEnableInstructionalText:(BOOL)a3;
- (void)setI_viewScaleForAudioObjectsInNonInteractiveCanvas:(double)a3;
- (void)setInfosToDisplay:(id)a3;
- (void)setIsAnchoredAtRight:(BOOL)a3;
- (void)setShouldRenderInvisibleContentForNonInteractiveCanvas:(BOOL)a3;
- (void)setSuppressesShadowsAndReflections:(BOOL)a3;
- (void)setSuppressesShapeText:(BOOL)a3;
- (void)setUnscaledSize:(CGSize)a3;
- (void)setViewScale:(double)a3;
- (void)teardown;
@end

@implementation CRLCanvas

- (CRLCanvas)init
{
  uint64_t v3 = objc_opt_class();

  return [(CRLCanvas *)self initWithLayoutControllerClass:v3 delegate:0];
}

- (CRLCanvas)initWithLayoutControllerClass:(Class)a3 delegate:(id)a4
{
  id v6 = a4;
  v27.receiver = self;
  v27.super_class = (Class)CRLCanvas;
  v7 = [(CRLCanvas *)&v27 init];
  v8 = (CRLCanvas *)v7;
  if (v7)
  {
    *((void *)v7 + 12) = 0x3FF0000000000000;
    *((int64x2_t *)v7 + 5) = vdupq_n_s64(0x4059000000000000uLL);
    long long v9 = *(_OWORD *)&UIEdgeInsetsZero.bottom;
    *(_OWORD *)(v7 + 200) = *(_OWORD *)&UIEdgeInsetsZero.top;
    *(_OWORD *)(v7 + 216) = v9;
    v10 = (NSArray *)objc_alloc_init((Class)NSArray);
    mInfos = v8->mInfos;
    v8->mInfos = v10;

    v12 = (NSArray *)objc_alloc_init((Class)NSArray);
    mTopLevelReps = v8->mTopLevelReps;
    v8->mTopLevelReps = v12;

    v14 = (NSSet *)objc_alloc_init((Class)NSSet);
    mAllReps = v8->mAllReps;
    v8->mAllReps = v14;

    v16 = (NSMapTable *)[objc_alloc((Class)NSMapTable) initWithKeyOptions:517 valueOptions:517 capacity:0];
    mRepsByLayout = v8->mRepsByLayout;
    v8->mRepsByLayout = v16;

    objc_storeWeak((id *)&v8->mDelegate, v6);
    v18 = (CRLCanvasLayoutController *)[[a3 alloc] initWithCanvas:v8];
    mLayoutController = v8->mLayoutController;
    v8->mLayoutController = v18;

    v8->mContentsScale = 1.0;
    v8->mWideGamut = 1;
    v8->mAllowsFontSubpixelQuantization = 1;
    v8->mBlocksToPerformLock._os_unfair_lock_opaque = 0;
    __dmb(0xBu);
    uint64_t v20 = +[NSHashTable weakObjectsHashTable];
    mCanvasLayoutObservers = v8->mCanvasLayoutObservers;
    v8->mCanvasLayoutObservers = (NSHashTable *)v20;

    [(CRLCanvas *)v8 setI_viewScaleForAudioObjectsInNonInteractiveCanvas:1.0];
    uint64_t v22 = +[NSMutableSet set];
    mRepsWithInvalidContentLayers = v8->mRepsWithInvalidContentLayers;
    v8->mRepsWithInvalidContentLayers = (NSMutableSet *)v22;

    uint64_t v24 = +[NSMutableSet set];
    mRepsWithInvalidOverlayLayers = v8->mRepsWithInvalidOverlayLayers;
    v8->mRepsWithInvalidOverlayLayers = (NSMutableSet *)v24;
  }
  return v8;
}

- (id)initForTemporaryLayout
{
  id result = [(CRLCanvas *)self init];
  if (result) {
    *((unsigned char *)result + 72) = 1;
  }
  return result;
}

- (void)teardown
{
  mInfos = self->mInfos;
  self->mInfos = 0;

  v4 = [(CRLCanvas *)self layoutController];
  [v4 i_removeAllLayouts];

  [(CRLCanvas *)self p_removeAllReps];
  if ([(CRLCanvas *)self isCanvasInteractive])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = objc_loadWeakRetained((id *)&self->mDelegate);
      [v7 updateLayerTreeForInteractiveCanvas:self];
    }
  }
  os_unfair_lock_lock(&self->mBlocksToPerformLock);
  mBlocksToPerformAfterLayout = self->mBlocksToPerformAfterLayout;
  self->mBlocksToPerformAfterLayout = 0;

  mBlocksToPerformAfterLayoutAndLayerUpdating = self->mBlocksToPerformAfterLayoutAndLayerUpdating;
  self->mBlocksToPerformAfterLayoutAndLayerUpdating = 0;

  os_unfair_lock_unlock(&self->mBlocksToPerformLock);
}

- (void)dealloc
{
  if (self->mInfos)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FFFF0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010BCDEC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101500010);
    }
    uint64_t v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvas dealloc]");
    v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvas.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:184 isFatal:0 description:"Canvas must be torn down before being deallocated"];
  }
  if (self->mBlocksToPerformAfterLayout)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101500030);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010BCD58();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101500050);
    }
    char v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v6);
    }
    id v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvas dealloc]");
    v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvas.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 188, 0, "expected nil value for '%{public}s'", "mBlocksToPerformAfterLayout");
  }
  if (self->mBlocksToPerformAfterLayoutAndLayerUpdating)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101500070);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010BCCC4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101500090);
    }
    long long v9 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v9);
    }
    v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvas dealloc]");
    v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvas.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 189, 0, "expected nil value for '%{public}s'", "mBlocksToPerformAfterLayoutAndLayerUpdating");
  }
  [(CRLCanvasLayoutController *)self->mLayoutController setInfos:&__NSArray0__struct];
  v12.receiver = self;
  v12.super_class = (Class)CRLCanvas;
  [(CRLCanvas *)&v12 dealloc];
}

- (Class)rootLayoutClass
{
  id v3 = (id)objc_opt_class();
  p_mDelegate = &self->mDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_mDelegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_mDelegate);
    id v3 = [v7 canvasRootLayoutClass];
  }

  return (Class)v3;
}

- (BOOL)isLayoutComplete
{
  return [(CRLCanvas *)self p_isLayoutCompleteIncludingLayers:1];
}

- (BOOL)p_isLayoutCompleteIncludingLayers:(BOOL)a3
{
  if (self->mInLayout) {
    return 0;
  }
  if (a3) {
    unsigned __int8 v4 = [(CRLCanvas *)self i_needsLayout];
  }
  else {
    unsigned __int8 v4 = [(CRLCanvas *)self p_needsLayoutNotIncludingLayers];
  }
  return v4 ^ 1;
}

- (void)performBlockAfterLayoutIfNecessary:(id)a3
{
}

- (void)afterLayoutIncludingLayers:(BOOL)a3 performBlock:(id)a4
{
  BOOL v4 = a3;
  char v6 = (void (**)(void))a4;
  if (v6)
  {
    v17 = v6;
    if ([(CRLCanvas *)self p_isLayoutCompleteIncludingLayers:v4])
    {
      v17[2]();
    }
    else
    {
      p_mBlocksToPerformLock = &self->mBlocksToPerformLock;
      os_unfair_lock_lock(&self->mBlocksToPerformLock);
      if (v4)
      {
        mBlocksToPerformAfterLayoutAndLayerUpdating = self->mBlocksToPerformAfterLayoutAndLayerUpdating;
        if (mBlocksToPerformAfterLayoutAndLayerUpdating) {
          long long v9 = mBlocksToPerformAfterLayoutAndLayerUpdating;
        }
        else {
          long long v9 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
        }
        objc_super v12 = self->mBlocksToPerformAfterLayoutAndLayerUpdating;
        self->mBlocksToPerformAfterLayoutAndLayerUpdating = v9;

        v13 = self->mBlocksToPerformAfterLayoutAndLayerUpdating;
      }
      else
      {
        mBlocksToPerformAfterLayout = self->mBlocksToPerformAfterLayout;
        if (mBlocksToPerformAfterLayout) {
          v11 = mBlocksToPerformAfterLayout;
        }
        else {
          v11 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
        }
        v14 = self->mBlocksToPerformAfterLayout;
        self->mBlocksToPerformAfterLayout = v11;

        v13 = self->mBlocksToPerformAfterLayout;
      }
      id v15 = [v17 copy];
      id v16 = objc_retainBlock(v15);
      [(NSMutableArray *)v13 addObject:v16];

      os_unfair_lock_unlock(p_mBlocksToPerformLock);
    }
    char v6 = v17;
  }
}

- (CRLBoardItemOwning)boardItemOwner
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  BOOL v4 = [WeakRetained boardItemOwnerForCanvas:self];

  return (CRLBoardItemOwning *)v4;
}

- (CRLChangeNotifier)changeNotifier
{
  v2 = [(CRLCanvas *)self canvasController];
  id v3 = [v2 editingCoordinator];
  BOOL v4 = [v3 changeNotifier];

  return (CRLChangeNotifier *)v4;
}

- (void)i_setCanvasController:(id)a3
{
  id v4 = a3;
  p_mCanvasController = &self->mCanvasController;
  id WeakRetained = objc_loadWeakRetained((id *)p_mCanvasController);

  if (WeakRetained)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1015000B0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010BCF08();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1015000D0);
    }
    id v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v7);
    }
    v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvas i_setCanvasController:]");
    long long v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvas.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 260, 0, "expected nil value for '%{public}s'", "mCanvasController");
  }
  if (!v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1015000F0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010BCE74();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101500110);
    }
    v10 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v10);
    }
    v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvas i_setCanvasController:]");
    objc_super v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvas.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 261, 0, "invalid nil value for '%{public}s'", "icc");
  }
  id v13 = objc_loadWeakRetained((id *)p_mCanvasController);

  if (!v13) {
    objc_storeWeak((id *)p_mCanvasController, v4);
  }
}

- (CRLInteractiveCanvasController)canvasController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mCanvasController);

  return (CRLInteractiveCanvasController *)WeakRetained;
}

- (void)setInfosToDisplay:(id)a3
{
}

- (void)i_setInfosToDisplay:(id)a3 updatingLayoutController:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v9 = v6;
  if (v6) {
    id v7 = (NSArray *)[v6 copy];
  }
  else {
    id v7 = (NSArray *)objc_alloc_init((Class)NSArray);
  }
  mInfos = self->mInfos;
  self->mInfos = v7;

  if (v4) {
    [(CRLCanvas *)self i_updateInfosInLayoutController];
  }
}

- (void)i_updateInfosInLayoutController
{
  id v3 = [(CRLCanvas *)self layoutController];
  [v3 setInfos:self->mInfos];
}

- (id)repForLayout:(id)a3
{
  if (a3)
  {
    BOOL v4 = -[NSMapTable objectForKey:](self->mRepsByLayout, "objectForKey:");
  }
  else
  {
    BOOL v4 = 0;
  }
  return v4;
}

- (void)recreateAllLayoutsAndReps
{
  uint64_t v3 = [(CRLCanvas *)self layoutController];
  [v3 i_removeAllLayouts];

  [(CRLCanvas *)self p_updateRepsFromLayouts];
  if ([(CRLCanvas *)self isCanvasInteractive])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = objc_loadWeakRetained((id *)&self->mDelegate);
      [v6 updateLayerTreeForInteractiveCanvas:self];
    }
  }
  id v7 = [(CRLCanvas *)self layoutController];
  [v7 setInfos:self->mInfos];

  [(CRLCanvas *)self layoutInvalidated];
}

- (void)canvasInvalidatedForRep:(id)a3
{
  id v4 = a3;
  [(CRLCanvas *)self p_setInvalidLayoutFlagAndCallDelegate];
  [(CRLCanvas *)self invalidateContentLayersForRep:v4];
  [(CRLCanvas *)self invalidateOverlayLayersForRep:v4];
}

- (void)canvasInvalidatedForLayout:(id)a3
{
  uint64_t v4 = [(CRLCanvas *)self repForLayout:a3];
  id v5 = (id)v4;
  if (v4) {
    [(CRLCanvas *)self canvasInvalidatedForRep:v4];
  }
  else {
    [(CRLCanvas *)self p_setInvalidLayoutFlagAndCallDelegate];
  }
}

- (void)p_setInvalidLayoutFlagAndCallDelegate
{
  self->mInvalidFlags.layout = 1;
  p_mDelegate = &self->mDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_mDelegate);
    [v6 canvasLayoutInvalidated:self];
  }
}

- (void)invalidateReps
{
  self->mInvalidFlags.reps = 1;
  p_mDelegate = &self->mDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_mDelegate);
    [v6 canvasLayoutInvalidated:self];
  }
}

- (void)invalidateVisibleBounds
{
  self->mInvalidFlags.visibleBounds = 1;
  p_mDelegate = &self->mDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_mDelegate);
    [v6 canvasLayoutInvalidated:self];
  }
}

- (void)invalidateAllLayers
{
  self->mInvalidFlags.allContentAndOverlayLayers = 1;
  p_mDelegate = &self->mDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_mDelegate);
    [v6 canvasDidInvalidateAllLayers:self];
  }

  [(CRLCanvas *)self i_setLayersInvalidWithoutInvalidatingAnySpecificLayers];
}

- (void)invalidateContentLayersForRep:(id)a3
{
  [(NSMutableSet *)self->mRepsWithInvalidContentLayers addObject:a3];

  [(CRLCanvas *)self i_setLayersInvalidWithoutInvalidatingAnySpecificLayers];
}

- (void)invalidateOverlayLayersForRep:(id)a3
{
  [(NSMutableSet *)self->mRepsWithInvalidOverlayLayers addObject:a3];

  [(CRLCanvas *)self i_setLayersInvalidWithoutInvalidatingAnySpecificLayers];
}

- (void)i_setLayersInvalidWithoutInvalidatingAnySpecificLayers
{
  self->mInvalidFlags.layers = 1;
  p_mDelegate = &self->mDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_mDelegate);
    [v6 canvasLayoutInvalidated:self];
  }
}

- (BOOL)crlaxIsPreventingReloadingChildren
{
  return 0;
}

- (void)nonInteractiveLayoutIfNeeded
{
  if ([(CRLCanvas *)self isCanvasInteractive])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101500130);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010BCF9C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101500150);
    }
    uint64_t v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    uint64_t v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvas nonInteractiveLayoutIfNeeded]");
    char v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvas.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:476 isFatal:0 description:"Interactive canvases should not be laid out directly!"];
  }
  [(CRLCanvas *)self i_layoutIfNeeded];
}

- (void)i_layoutIfNeededUpdatingLayerTree
{
  if (self->mInLayout)
  {
    if ([(CRLCanvas *)self i_needsLayout]
      && !self->mShouldUpdateLayersDuringLayout
      && ![(CRLCanvas *)self p_canvasShouldAlwaysUpdateLayers])
    {
      v3[0] = _NSConcreteStackBlock;
      v3[1] = 3221225472;
      v3[2] = sub_1004D4368;
      v3[3] = &unk_1014CBBB0;
      v3[4] = self;
      [(CRLCanvas *)self performBlockAfterLayoutIfNecessary:v3];
    }
  }
  else
  {
    self->mShouldUpdateLayersDuringLayout = 1;
    [(CRLCanvas *)self p_layoutWithReadLock];
    self->mShouldUpdateLayersDuringLayout = 0;
  }
}

- (BOOL)p_canvasShouldAlwaysUpdateLayers
{
  if ([(CRLCanvas *)self isCanvasInteractive]) {
    return !+[NSThread isMainThread];
  }
  else {
    return 1;
  }
}

- (BOOL)i_needsLayout
{
  if (self->mInvalidFlags.layers) {
    return 1;
  }
  else {
    return [(CRLCanvas *)self p_needsLayoutNotIncludingLayers];
  }
}

- (BOOL)p_needsLayoutNotIncludingLayers
{
  return self->mInvalidFlags.layout || self->mInvalidFlags.reps || self->mInvalidFlags.visibleBounds;
}

- (void)i_registerCanvasLayoutObserver:(id)a3
{
}

- (void)i_unregisterCanvasLayoutObserver:(id)a3
{
}

- (BOOL)spellCheckingSupported
{
  if (![(CRLCanvas *)self isCanvasInteractive]) {
    return 0;
  }
  p_mDelegate = &self->mDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  if (objc_opt_respondsToSelector())
  {
    id v5 = objc_loadWeakRetained((id *)p_mDelegate);
    unsigned __int8 v6 = [v5 spellCheckingSupported];
  }
  else
  {
    unsigned __int8 v6 = 1;
  }

  return v6;
}

- (BOOL)spellCheckingSuppressed
{
  unsigned int v3 = [(CRLCanvas *)self spellCheckingSupported];
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

- (BOOL)isCanvasInteractive
{
  p_mDelegate = &self->mDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  if (WeakRetained)
  {
    id v4 = objc_loadWeakRetained((id *)p_mDelegate);
    if (objc_opt_respondsToSelector())
    {
      id v5 = objc_loadWeakRetained((id *)p_mDelegate);
      unsigned __int8 v6 = [v5 isCanvasInteractive];
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

- (BOOL)isPrinting
{
  p_mDelegate = &self->mDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  if (WeakRetained)
  {
    id v4 = objc_loadWeakRetained((id *)p_mDelegate);
    if (objc_opt_respondsToSelector())
    {
      id v5 = objc_loadWeakRetained((id *)p_mDelegate);
      unsigned __int8 v6 = [v5 isPrintingCanvas];
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

- (void)setEnableInstructionalText:(BOOL)a3
{
  if ([(CRLCanvas *)self isCanvasInteractive])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101500170);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010BD024();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101500190);
    }
    id v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    char v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvas setEnableInstructionalText:]");
    id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvas.m"];
    +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:572 isFatal:0 description:"Setting enableInstructionalText on an interactive canvas is not allowed."];
  }
  self->mEnableInstructionalText = a3;
}

- (BOOL)shouldShowInstructionalTextForLayout:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  if (WeakRetained
    && (char v6 = WeakRetained,
        id v7 = objc_loadWeakRetained((id *)&self->mDelegate),
        char v8 = objc_opt_respondsToSelector(),
        v7,
        v6,
        (v8 & 1) != 0))
  {
    id v9 = objc_loadWeakRetained((id *)&self->mDelegate);
    unsigned __int8 v10 = [v9 shouldShowInstructionalTextForLayout:v4];
  }
  else if ([(CRLCanvas *)self isCanvasInteractive] {
         || [(CRLCanvas *)self isTemporaryForLayout])
  }
  {
    unsigned __int8 v10 = 1;
  }
  else
  {
    unsigned __int8 v10 = [(CRLCanvas *)self enableInstructionalText];
  }

  return v10;
}

- (BOOL)shouldSuppressBackgrounds
{
  p_mDelegate = &self->mDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  if (WeakRetained)
  {
    id v4 = objc_loadWeakRetained((id *)p_mDelegate);
    if (objc_opt_respondsToSelector())
    {
      id v5 = objc_loadWeakRetained((id *)p_mDelegate);
      unsigned __int8 v6 = [v5 shouldSuppressBackgrounds];
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

- (BOOL)isDrawingIntoPDF
{
  p_mDelegate = &self->mDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  if (!WeakRetained) {
    return 0;
  }
  id v5 = WeakRetained;
  id v6 = objc_loadWeakRetained((id *)p_mDelegate);
  char v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) == 0) {
    return 0;
  }
  id v8 = objc_loadWeakRetained((id *)p_mDelegate);
  unsigned __int8 v9 = [v8 isCanvasDrawingIntoPDF:self];

  return v9;
}

- (BOOL)textLayoutMustIncludeAdornments
{
  p_mDelegate = &self->mDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  if (!WeakRetained) {
    return 0;
  }
  id v4 = WeakRetained;
  id v5 = objc_loadWeakRetained((id *)p_mDelegate);
  char v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0) {
    return 0;
  }
  id v7 = objc_loadWeakRetained((id *)p_mDelegate);
  unsigned __int8 v8 = [v7 textLayoutMustIncludeAdornments];

  return v8;
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

- (void)setSuppressesShadowsAndReflections:(BOOL)a3
{
  if ([(CRLCanvas *)self isCanvasInteractive])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1015001B0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010BD0AC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1015001D0);
    }
    id v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    char v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvas setSuppressesShadowsAndReflections:]");
    id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvas.m"];
    +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:638 isFatal:0 description:"Caller is trying to suppress shadows and reflections on an interactive canvas; this is not supported"];
  }
  self->mSuppressesShadowsAndReflections = a3;
}

- (void)setViewScale:(double)a3
{
  if (a3 <= 0.0)
  {
    unsigned int v5 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1015001F0);
    }
    char v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
    {
      double mViewScale = self->mViewScale;
      *(_DWORD *)buf = 67110402;
      unsigned int v12 = v5;
      __int16 v13 = 2082;
      v14 = "-[CRLCanvas setViewScale:]";
      __int16 v15 = 2082;
      id v16 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvas.m";
      __int16 v17 = 1024;
      int v18 = 651;
      __int16 v19 = 2048;
      double v20 = a3;
      __int16 v21 = 2048;
      double v22 = mViewScale;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Caller is trying to set the canvas view scale to invalid value: %f (Falling back to current value: %f)", buf, 0x36u);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101500210);
    }
    id v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v7);
    }
    unsigned __int8 v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvas setViewScale:]");
    unsigned __int8 v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvas.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 651, 0, "Caller is trying to set the canvas view scale to invalid value: %f (Falling back to current value: %f)", *(void *)&a3, *(void *)&self->mViewScale);
  }
  else
  {
    self->double mViewScale = a3;
  }
}

- (CGRect)convertUnscaledToBoundsRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  double x = a3.origin.x;
  [(CRLCanvas *)self viewScale];

  double v8 = sub_1000652FC(x, y, width, height, v7);
  result.size.CGFloat height = v11;
  result.size.CGFloat width = v10;
  result.origin.CGFloat y = v9;
  result.origin.double x = v8;
  return result;
}

- (CGRect)convertBoundsToUnscaledRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  double x = a3.origin.x;
  [(CRLCanvas *)self viewScale];

  double v8 = sub_1000652FC(x, y, width, height, 1.0 / v7);
  result.size.CGFloat height = v11;
  result.size.CGFloat width = v10;
  result.origin.CGFloat y = v9;
  result.origin.double x = v8;
  return result;
}

- (CGPoint)convertUnscaledToBoundsPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(CRLCanvas *)self viewScale];

  double v6 = sub_1000646A4(x, y, v5);
  result.double y = v7;
  result.double x = v6;
  return result;
}

- (CGPoint)convertBoundsToUnscaledPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(CRLCanvas *)self viewScale];

  double v6 = sub_1000646A4(x, y, 1.0 / v5);
  result.double y = v7;
  result.double x = v6;
  return result;
}

- (CGSize)convertUnscaledToBoundsSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(CRLCanvas *)self viewScale];

  double v6 = sub_1000646A4(width, height, v5);
  result.double height = v7;
  result.double width = v6;
  return result;
}

- (CGSize)convertBoundsToUnscaledSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(CRLCanvas *)self viewScale];

  double v6 = sub_1000646A4(width, height, 1.0 / v5);
  result.double height = v7;
  result.double width = v6;
  return result;
}

- (double)convertUnscaledToBoundsLength:(double)a3
{
  [(CRLCanvas *)self viewScale];
  return v4 * a3;
}

- (double)convertBoundsToUnscaledLength:(double)a3
{
  [(CRLCanvas *)self viewScale];
  return 1.0 / v4 * a3;
}

- (CGRect)visibleUnscaledRectForClippingReps
{
  p_mDelegate = &self->mDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  if (WeakRetained
    && (double v5 = WeakRetained,
        id v6 = objc_loadWeakRetained((id *)p_mDelegate),
        char v7 = objc_opt_respondsToSelector(),
        v6,
        v5,
        (v7 & 1) != 0))
  {
    id v8 = objc_loadWeakRetained((id *)p_mDelegate);
    [v8 visibleScaledBoundsForClippingRepsOnCanvas:self];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;

    -[CRLCanvas convertBoundsToUnscaledRect:](self, "convertBoundsToUnscaledRect:", v10, v12, v14, v16);
  }
  else
  {
    [(CRLCanvas *)self p_bounds];
  }
  result.size.double height = v20;
  result.size.double width = v19;
  result.origin.double y = v18;
  result.origin.double x = v17;
  return result;
}

- (id)hitRep:(CGPoint)a3 withPrecision:(BOOL)a4 inTopLevelReps:(id)a5 smallRepOutset:(double)a6 unscaledPointTransformForRep:(id)a7 passingTest:(id)a8
{
  return +[CRLCanvas p_hitRep:withPrecision:inTopLevelReps:smallRepOutset:unscaledPointTransformForRep:passingTest:](CRLCanvas, "p_hitRep:withPrecision:inTopLevelReps:smallRepOutset:unscaledPointTransformForRep:passingTest:", a4, a5, a7, a8, a3.x, a3.y, a6);
}

+ (id)p_hitRep:(CGPoint)a3 withPrecision:(BOOL)a4 inTopLevelReps:(id)a5 smallRepOutset:(double)a6 unscaledPointTransformForRep:(id)a7 passingTest:(id)a8
{
  BOOL v41 = a4;
  double y = a3.y;
  double x = a3.x;
  id v14 = a5;
  id v15 = a7;
  id v16 = a8;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  double v17 = [v14 reverseObjectEnumerator];
  id v18 = [v17 countByEnumeratingWithState:&v48 objects:v53 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v49;
    while (2)
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v49 != v20) {
          objc_enumerationMutation(v17);
        }
        double v22 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        [a1 p_transformedUnscaledPoint:v22 forTestingHitRep:v15 withTransformFromBlock:x, y];
        [v22 convertNaturalPointFromUnscaledCanvas:];
        uint64_t v23 = [v22 hitRepChrome:v16];
        if (v23)
        {
          v32 = (void *)v23;
          goto LABEL_34;
        }
      }
      id v19 = [v17 countByEnumeratingWithState:&v48 objects:v53 count:16];
      if (v19) {
        continue;
      }
      break;
    }
  }

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v40 = v14;
  uint64_t v24 = [v14 reverseObjectEnumerator];
  id v25 = [v24 countByEnumeratingWithState:&v44 objects:v52 count:16];
  if (!v25)
  {

    double v17 = 0;
    v32 = 0;
LABEL_33:
    id v14 = v40;
    goto LABEL_34;
  }
  id v26 = v25;
  double v17 = 0;
  uint64_t v27 = *(void *)v45;
  double v28 = INFINITY;
  BOOL v29 = v41;
  id obj = v24;
  while (2)
  {
    for (j = 0; j != v26; j = (char *)j + 1)
    {
      if (*(void *)v45 != v27) {
        objc_enumerationMutation(obj);
      }
      v31 = *(void **)(*((void *)&v44 + 1) + 8 * (void)j);
      [a1 p_transformedUnscaledPoint:v31 forTestingHitRep:v15 withTransformFromBlock:x, y];
      [v31 convertNaturalPointFromUnscaledCanvas];
      v32 = [v31 hitRep:v29 withPrecision:v16 passingTest:];
      if (v32)
      {
        v37 = obj;
        goto LABEL_28;
      }
      if (([v31 shouldHitTestChildrenLikeTopLevelReps] & 1) == 0)
      {
        [v31 convertNaturalPointFromUnscaledCanvas:x, y];
        double v43 = v28;
        v33 = [v31 i_smallHitRepNearPoint:&v43 smallRepOutset:v15 forShortestDistance:v16 unscaledPointTransformForRep:v17 passingTest:v18];
        v34 = v33;
        if (v33) {
          BOOL v35 = v43 < v28;
        }
        else {
          BOOL v35 = 0;
        }
        if (v35)
        {
          id v36 = v33;

          double v28 = v43;
          double v17 = v36;
          BOOL v29 = v41;
        }
      }
    }
    v37 = obj;
    id v26 = [obj countByEnumeratingWithState:&v44 objects:v52 count:16];
    if (v26) {
      continue;
    }
    break;
  }
LABEL_28:

  if (!v17) {
    goto LABEL_33;
  }
  id v14 = v40;
  if ((objc_msgSend(v32, "i_shouldCountAsClosestSmallRepForSizeLimit:", a6) & 1) == 0)
  {
    [a1 p_transformedUnscaledPoint:v32 forTestingHitRep:v15 withTransformFromBlock:x, y];
    LOBYTE(v43) = 0;
    [v32 convertNaturalPointFromUnscaledCanvas];
    [v32 shortestDistanceToPoint:&v43];
    if (!LOBYTE(v43))
    {
      id v38 = v17;

      v32 = v38;
    }
  }
LABEL_34:

  return v32;
}

+ (CGPoint)p_transformedUnscaledPoint:(CGPoint)a3 forTestingHitRep:(id)a4 withTransformFromBlock:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  if (a4 && a5)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v10 = 0u;
    (*((void (**)(long long *__return_ptr, id, id))a5 + 2))(&v10, a5, a4);
    double v7 = y * *((double *)&v11 + 1) + *((double *)&v10 + 1) * x;
    double x = *(double *)&v12 + y * *(double *)&v11 + *(double *)&v10 * x;
    double y = *((double *)&v12 + 1) + v7;
  }
  double v8 = x;
  double v9 = y;
  result.double y = v9;
  result.double x = v8;
  return result;
}

- (void)i_performBlockWhileIgnoringClickThrough:(id)a3
{
  BOOL mIgnoringClickThrough = self->mIgnoringClickThrough;
  self->BOOL mIgnoringClickThrough = 1;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  self->BOOL mIgnoringClickThrough = mIgnoringClickThrough;
}

- (BOOL)i_shouldIgnoreClickThrough
{
  return self->mIgnoringClickThrough;
}

- (void)i_registerRep:(id)a3
{
  id v4 = a3;
  if (v4 && self->mRepsByLayout)
  {
    id v6 = v4;
    double v5 = [v4 layout];
    if (v5) {
      [(NSMapTable *)self->mRepsByLayout setObject:v6 forKey:v5];
    }

    id v4 = v6;
  }
}

- (void)i_unregisterRep:(id)a3
{
  id v4 = a3;
  if (v4 && self->mRepsByLayout)
  {
    id v7 = v4;
    double v5 = [v4 layout];
    if (v5)
    {
      id v6 = [(NSMapTable *)self->mRepsByLayout objectForKey:v5];

      if (v6 == v7) {
        [(NSMapTable *)self->mRepsByLayout removeObjectForKey:v5];
      }
    }

    id v4 = v7;
  }
}

- (BOOL)i_areContentLayersInvalidForRep:(id)a3
{
  if (self->mInvalidFlags.allContentAndOverlayLayers) {
    return 1;
  }
  else {
    return [(NSMutableSet *)self->mRepsWithInvalidContentLayers containsObject:a3];
  }
}

- (BOOL)i_areOverlayLayersInvalidForRep:(id)a3
{
  if (self->mInvalidFlags.allContentAndOverlayLayers) {
    return 1;
  }
  else {
    return [(NSMutableSet *)self->mRepsWithInvalidOverlayLayers containsObject:a3];
  }
}

- (CGRect)i_approximateScaledFrameOfEditingMenuAtPoint:(CGPoint)a3
{
  double v3 = sub_10006402C(a3.x, a3.y + -30.0, 200.0);
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (CGRect)i_clipRectForCreatingRepsFromLayouts
{
  p_mDelegate = &self->mDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  if (WeakRetained
    && (double v5 = WeakRetained,
        id v6 = objc_loadWeakRetained((id *)p_mDelegate),
        char v7 = objc_opt_respondsToSelector(),
        v6,
        v5,
        (v7 & 1) != 0))
  {
    id v8 = objc_loadWeakRetained((id *)p_mDelegate);
    [v8 visibleScaledBoundsForClippingRepsOnCanvas:self];
    double x = v9;
    double y = v11;
    double width = v13;
    double height = v15;
  }
  else
  {
    double x = CGRectInfinite.origin.x;
    double y = CGRectInfinite.origin.y;
    double width = CGRectInfinite.size.width;
    double height = CGRectInfinite.size.height;
  }

  -[CRLCanvas convertBoundsToUnscaledRect:](self, "convertBoundsToUnscaledRect:", x, y, width, height);
  result.size.double height = v20;
  result.size.double width = v19;
  result.origin.double y = v18;
  result.origin.double x = v17;
  return result;
}

- (void)i_drawBackgroundInContext:(CGContext *)a3
{
  ClipBoundingBodouble x = CGContextGetClipBoundingBox(a3);
  CGRect v7 = CGRectIntegral(ClipBoundingBox);

  -[CRLCanvas i_drawBackgroundInContext:bounds:](self, "i_drawBackgroundInContext:bounds:", a3, v7.origin.x, v7.origin.y, v7.size.width, v7.size.height);
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
    CGContextSetFillColorWithColor(a3, [(CRLColor *)self->mBackgroundColor CGColor]);
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
  id v6 = a3;
  if (v6)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    CGRect v7 = self->mTopLevelReps;
    id v8 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
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
          [*(id *)(*((void *)&v12 + 1) + 8 * i) recursivelyPerformSelector:@"addBitmapsToRenderingQualityInfo:inContext:" withObject:v6 withObject:a4];
        }
        id v9 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
}

- (void)i_drawRepsInContext:(CGContext *)a3 passingTest:(id)a4 distort:(CGAffineTransform *)a5
{
  id v8 = (unsigned int (**)(id, void))a4;
  if (a3)
  {
    CGContextSaveGState(a3);
    CGContextScaleCTM(a3, self->mViewScale, self->mViewScale);
    BOOL v9 = a5->b == 0.0
      && a5->c == 0.0
      && a5->tx == 0.0
      && a5->ty == 0.0
      && fabs(a5->a + -1.0) < 0.001
      && fabs(a5->d + -1.0) < 0.001;
    sub_100458964(a3);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    double v20 = self;
    uint64_t v10 = self->mTopLevelReps;
    id v11 = [(NSArray *)v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v23;
      do
      {
        long long v14 = 0;
        do
        {
          if (*(void *)v23 != v13) {
            objc_enumerationMutation(v10);
          }
          long long v15 = *(void **)(*((void *)&v22 + 1) + 8 * (void)v14);
          if (!v8 || v8[2](v8, *(void *)(*((void *)&v22 + 1) + 8 * (void)v14)))
          {
            CGContextSaveGState(a3);
            if (!v9 || [v15 wantsToDistortWithImagerContext])
            {
              long long v16 = *(_OWORD *)&a5->c;
              *(_OWORD *)&transform.a = *(_OWORD *)&a5->a;
              *(_OWORD *)&transform.c = v16;
              *(_OWORD *)&transform.tCGFloat x = *(_OWORD *)&a5->tx;
              CGContextConcatCTM(a3, &transform);
            }
            [v15 recursivelyDrawInContext:a3 keepingChildrenPassingTest:v8];
            CGContextRestoreGState(a3);
          }
          long long v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        id v12 = [(NSArray *)v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v12);
    }

    double v17 = sub_100458FC8(a3);
    double v18 = (NSSet *)[v17 copy];
    mPreviousRenderDatasNeedingDownload = v20->mPreviousRenderDatasNeedingDownload;
    v20->mPreviousRenderDatasNeedingDownload = v18;

    CGContextRestoreGState(a3);
  }
}

- (void)i_drawRepsInContext:(CGContext *)a3 passingTest:(id)a4
{
  long long v4 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v5[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v5[1] = v4;
  v5[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  [(CRLCanvas *)self i_drawRepsInContext:a3 passingTest:a4 distort:v5];
}

- (CGImage)i_image
{
  return -[CRLCanvas i_imageInScaledRect:keepingChildrenPassingTest:](self, "i_imageInScaledRect:keepingChildrenPassingTest:", 0, CGRectInfinite.origin.x, CGRectInfinite.origin.y, CGRectInfinite.size.width, CGRectInfinite.size.height);
}

- (CGImage)i_imageInScaledRect:(CGRect)a3 keepingChildrenPassingTest:(id)a4
{
  return -[CRLCanvas i_imageInScaledRect:withTargetIntegralSize:distortedToMatch:keepingChildrenPassingTest:](self, "i_imageInScaledRect:withTargetIntegralSize:distortedToMatch:keepingChildrenPassingTest:", 0, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, CGSizeZero.width, CGSizeZero.height);
}

- (CGImage)i_imageInScaledRect:(CGRect)a3 withTargetIntegralSize:(CGSize)a4 distortedToMatch:(BOOL)a5 keepingChildrenPassingTest:(id)a6
{
  BOOL v6 = a5;
  double height = a4.height;
  double width = a4.width;
  double v9 = a3.size.height;
  double v10 = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v14 = a6;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v15 = -[CRLCanvas i_createContextToDrawImageInScaledRect:withTargetIntegralSize:distortedToMatch:returningBounds:integralBounds:](self, "i_createContextToDrawImageInScaledRect:withTargetIntegralSize:distortedToMatch:returningBounds:integralBounds:", v6, &v21, &v19, x, y, v10, v9, width, height);
  if (v15)
  {
    long long v16 = v15;
    double v17 = -[CRLCanvas i_newImageInContext:bounds:integralBounds:distortedToMatch:keepingChildrenPassingTest:](self, "i_newImageInContext:bounds:integralBounds:distortedToMatch:keepingChildrenPassingTest:", v15, v6, v14, v21, v22, v19, v20);
    CGContextRelease(v16);
  }
  else
  {
    double v17 = 0;
  }

  return v17;
}

- (CGContext)i_createContextToDrawImageInScaledRect:(CGRect)a3 withTargetIntegralSize:(CGSize)a4 distortedToMatch:(BOOL)a5 returningBounds:(CGRect *)a6 integralBounds:(CGRect *)a7
{
  double height = a4.height;
  double width = a4.width;
  double v12 = a3.size.height;
  double v13 = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v17 = sub_10006757C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v43 = v18;
  double v45 = v17;
  double v20 = v19;
  double v22 = v21;
  if (width <= 0.0 || height <= 0.0) {
    goto LABEL_16;
  }
  double v23 = sub_1000674B8(width);
  if (a5)
  {
    double v20 = v23;
LABEL_15:
    double v22 = v24;
    goto LABEL_16;
  }
  double v25 = v20 - v23;
  double v26 = v22 - v24;
  if (v20 - v23 > 0.0 || v26 > 0.0)
  {
    if (v25 > 0.0) {
      double v20 = v23;
    }
    if (v26 > 0.0) {
      goto LABEL_15;
    }
  }
  else if (v25 < 0.0 && v26 < 0.0)
  {
    if (v25 <= v26) {
      double v22 = v24;
    }
    else {
      double v20 = v23;
    }
  }
LABEL_16:
  BOOL v27 = sub_100064208(x, y, v13, v12, v45, v43, v20, v22);
  if (v27) {
    double v28 = v45;
  }
  else {
    double v28 = x;
  }
  if (v27) {
    double v29 = v43;
  }
  else {
    double v29 = y;
  }
  if (v27) {
    double v30 = v20;
  }
  else {
    double v30 = v13;
  }
  if (v27) {
    double v31 = v22;
  }
  else {
    double v31 = v12;
  }
  if (v27)
  {
    double x = v45;
    double y = v43;
    double v13 = v20;
    double v12 = v22;
  }
  v47.origin.double x = v45;
  v47.origin.double y = v43;
  v47.size.double width = v20;
  v47.size.double height = v22;
  if (CGRectEqualToRect(*(CGRect *)&v28, v47)
    && (mBackgroundColor = self->mBackgroundColor) != 0
    && ([(CRLColor *)mBackgroundColor alphaComponent], v33 == 1.0))
  {
    char v34 = 1;
  }
  else
  {
    char v34 = 3;
  }
  if ([(CRLCanvas *)self canvasIsWideGamut]) {
    v34 |= 0x20u;
  }
  [(CRLCanvas *)self contentsScale];
  double v36 = sub_1000646A4(v20, v22, v35);
  id v38 = sub_100455AA8(v34, v36, v37);
  [(CRLCanvas *)self contentsScale];
  CGFloat v40 = v39;
  [(CRLCanvas *)self contentsScale];
  CGContextScaleCTM(v38, v40, v41);
  if (a6)
  {
    a6->origin.double x = x;
    a6->origin.double y = y;
    a6->size.double width = v13;
    a6->size.double height = v12;
  }
  if (a7)
  {
    a7->origin.double x = v46;
    a7->origin.double y = v44;
    a7->size.double width = v20;
    a7->size.double height = v22;
  }
  return v38;
}

- (CGImage)i_newImageInContext:(CGContext *)a3 bounds:(CGRect)a4 integralBounds:(CGRect)a5 distortedToMatch:(BOOL)a6 keepingChildrenPassingTest:(id)a7
{
  if (!a3) {
    return 0;
  }
  BOOL v7 = a6;
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  double v12 = a4.size.height;
  double v13 = a4.size.width;
  id v16 = a7;
  CGContextSaveGState(a3);
  CGContextTranslateCTM(a3, 0.0, height);
  CGContextScaleCTM(a3, 1.0, -1.0);
  CGContextTranslateCTM(a3, -x, -y);
  v21.origin.double x = x;
  v21.origin.double y = y;
  v21.size.double width = width;
  v21.size.double height = height;
  CGContextClipToRect(a3, v21);
  long long v17 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&v20.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&v20.c = v17;
  *(_OWORD *)&v20.tdouble x = *(_OWORD *)&CGAffineTransformIdentity.tx;
  if (v7) {
    CGAffineTransformMakeScale(&v20, width / v13, height / v12);
  }
  [(CRLCanvas *)self i_drawBackgroundInContext:a3];
  CGAffineTransform v19 = v20;
  [(CRLCanvas *)self i_drawRepsInContext:a3 passingTest:v16 distort:&v19];

  CGContextRestoreGState(a3);
  return CGBitmapContextCreateImage(a3);
}

- (CGRect)p_bounds
{
  double v3 = sub_100064070();
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
  BOOL v3 = [(CRLCanvas *)self crlaxIsPreventingReloadingChildren];
  [(CRLCanvas *)self crlaxPreventReloadingChildren];
  id WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  double v11 = sub_100246AC8(WeakRetained, 1, v5, v6, v7, v8, v9, v10, (uint64_t)&OBJC_PROTOCOL___CRLDynamicCanvasDelegate);

  if (objc_opt_respondsToSelector()) {
    [v11 i_canvasWillLayout:self];
  }
  BOOL layout = self->mInvalidFlags.layout;
  if (self->mInvalidFlags.layout)
  {
    id v13 = objc_loadWeakRetained((id *)&self->mDelegate);
    char v14 = objc_opt_respondsToSelector();

    if (v14)
    {
      id v15 = objc_loadWeakRetained((id *)&self->mDelegate);
      [v15 canvasWillValidateLayouts:self];
    }
    id v16 = [(CRLCanvas *)self layoutController];
    [v16 validateLayouts];

    id v17 = objc_loadWeakRetained((id *)&self->mDelegate);
    char v18 = objc_opt_respondsToSelector();

    if (v18)
    {
      id v19 = objc_loadWeakRetained((id *)&self->mDelegate);
      [v19 canvasDidValidateLayouts:self];
    }
LABEL_11:
    id v20 = objc_loadWeakRetained((id *)&self->mDelegate);
    char v21 = objc_opt_respondsToSelector();

    if (v21)
    {
      id v22 = objc_loadWeakRetained((id *)&self->mDelegate);
      [v22 canvasWillUpdateRepsFromLayouts:self];
    }
    unsigned __int8 v23 = [(CRLCanvas *)self p_updateRepsFromLayouts];
    *(_WORD *)&self->mInvalidFlags.reps = 0;
    id v24 = objc_loadWeakRetained((id *)&self->mDelegate);
    char v25 = objc_opt_respondsToSelector();

    if (v25)
    {
      id v26 = objc_loadWeakRetained((id *)&self->mDelegate);
      [v26 canvasDidUpdateRepsFromLayouts:self];
    }
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v27 = [(NSHashTable *)self->mCanvasLayoutObservers copy];
    id v28 = [v27 countByEnumeratingWithState:&v43 objects:v47 count:16];
    if (v28)
    {
      uint64_t v29 = *(void *)v44;
      do
      {
        for (i = 0; i != v28; i = (char *)i + 1)
        {
          if (*(void *)v44 != v29) {
            objc_enumerationMutation(v27);
          }
          [*(id *)(*((void *)&v43 + 1) + 8 * i) canvasDidUpdateReps:self];
        }
        id v28 = [v27 countByEnumeratingWithState:&v43 objects:v47 count:16];
      }
      while (v28);
    }

    if (layout) {
      goto LABEL_25;
    }
    goto LABEL_23;
  }
  if (self->mInvalidFlags.reps || self->mInvalidFlags.visibleBounds) {
    goto LABEL_11;
  }
  unsigned __int8 v23 = 0;
  if (self->mInvalidFlags.layout) {
    goto LABEL_25;
  }
LABEL_23:
  if ((v23 & 1) == 0 && !self->mInvalidFlags.layers)
  {
    uint64_t v39 = 0;
    goto LABEL_38;
  }
LABEL_25:
  unsigned int v31 = [(CRLCanvas *)self p_canvasShouldAlwaysUpdateLayers];
  if (self->mShouldUpdateLayersDuringLayout) {
    int v32 = 1;
  }
  else {
    int v32 = v31;
  }
  if (v32 == 1)
  {
    if ([(CRLCanvas *)self isCanvasInteractive])
    {
      id v33 = objc_loadWeakRetained((id *)&self->mDelegate);
      char v34 = objc_opt_respondsToSelector();

      if (v34)
      {
        id v35 = objc_loadWeakRetained((id *)&self->mDelegate);
        [v35 updateLayerTreeForInteractiveCanvas:self];
      }
    }
    *(_WORD *)&self->mInvalidFlags.layers = 0;
    [(NSMutableSet *)self->mRepsWithInvalidContentLayers removeAllObjects];
    [(NSMutableSet *)self->mRepsWithInvalidOverlayLayers removeAllObjects];
    if (!layout) {
      goto LABEL_37;
    }
    goto LABEL_35;
  }
  self->mInvalidFlags.layers = 1;
  if (layout)
  {
LABEL_35:
    id v36 = objc_loadWeakRetained((id *)&self->mDelegate);
    char v37 = objc_opt_respondsToSelector();

    if (v37)
    {
      id v38 = objc_loadWeakRetained((id *)&self->mDelegate);
      [v38 canvasDidLayout:self];
    }
  }
LABEL_37:
  uint64_t v39 = 1;
LABEL_38:
  self->mInvalidFlags.BOOL layout = 0;

  self->mInLayout = 0;
  CGFloat v40 = +[NSMutableArray array];
  os_unfair_lock_lock(&self->mBlocksToPerformLock);
  if (self->mBlocksToPerformAfterLayout)
  {
    [v40 addObjectsFromArray:];
    mBlocksToPerformAfterLayout = self->mBlocksToPerformAfterLayout;
    self->mBlocksToPerformAfterLayout = 0;
  }
  if (self->mBlocksToPerformAfterLayoutAndLayerUpdating)
  {
    if (!self->mInvalidFlags.layers)
    {
      [v40 addObjectsFromArray:];
      mBlocksToPerformAfterLayoutAndLayerUpdating = self->mBlocksToPerformAfterLayoutAndLayerUpdating;
      self->mBlocksToPerformAfterLayoutAndLayerUpdating = 0;
    }
  }
  os_unfair_lock_unlock(&self->mBlocksToPerformLock);
  [v40 makeObjectsPerformSelector:"invoke"];

  [(CRLCanvas *)self crlaxRevertReloadingChildrenTo:v3 andReloadForChanges:v39];
}

- (BOOL)p_updateRepsFromLayouts
{
  p_mCanvasController = &self->mCanvasController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mCanvasController);
  uint64_t v5 = &off_1014C1000;
  if (!WeakRetained
    || (uint64_t v6 = WeakRetained,
        id v7 = objc_loadWeakRetained((id *)p_mCanvasController),
        unsigned int v8 = objc_msgSend(v7, "i_currentlySuppressingLayerUpdates"),
        v7,
        v6,
        !v8))
  {
    [(CRLCanvas *)self i_clipRectForCreatingRepsFromLayouts];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    id v19 = [(CRLCanvas *)self layoutController];
    id v20 = [v19 layoutsInRect:v12, v14, v16, v18];

    id v21 = objc_loadWeakRetained((id *)&self->mDelegate);
    char v22 = objc_opt_respondsToSelector();

    if (v22)
    {
      id v23 = objc_loadWeakRetained((id *)&self->mDelegate);
      id v24 = [v23 additionalVisibleInfosForCanvas:self];

      long long v114 = 0u;
      long long v115 = 0u;
      long long v112 = 0u;
      long long v113 = 0u;
      id v25 = v24;
      id v26 = [v25 countByEnumeratingWithState:&v112 objects:v122 count:16];
      if (v26)
      {
        id v27 = v26;
        uint64_t v28 = *(void *)v113;
        do
        {
          for (i = 0; i != v27; i = (char *)i + 1)
          {
            if (*(void *)v113 != v28) {
              objc_enumerationMutation(v25);
            }
            double v30 = sub_10006B444(*(void **)(*((void *)&v112 + 1) + 8 * i));
            unsigned int v31 = [(CRLCanvasLayoutController *)self->mLayoutController layoutForInfo:v30];
            if (v31 && ([v20 containsObject:v31] & 1) == 0)
            {
              uint64_t v32 = [v20 arrayByAddingObject:v31];

              id v20 = (void *)v32;
            }
          }
          id v27 = [v25 countByEnumeratingWithState:&v112 objects:v122 count:16];
        }
        while (v27);
      }

      uint64_t v5 = &off_1014C1000;
    }
    id v33 = objc_loadWeakRetained((id *)&self->mDelegate);
    char v34 = objc_opt_respondsToSelector();

    if (v34)
    {
      id v35 = objc_loadWeakRetained((id *)&self->mDelegate);
      id v36 = [v35 infosToHideForCanvas:self];

      if ([v36 count])
      {
        id v37 = [v20 mutableCopy];
        long long v108 = 0u;
        long long v109 = 0u;
        long long v110 = 0u;
        long long v111 = 0u;
        id v38 = v20;
        id v39 = [v38 countByEnumeratingWithState:&v108 objects:v121 count:16];
        if (v39)
        {
          id v40 = v39;
          uint64_t v41 = *(void *)v109;
          do
          {
            for (j = 0; j != v40; j = (char *)j + 1)
            {
              if (*(void *)v109 != v41) {
                objc_enumerationMutation(v38);
              }
              long long v43 = *(void **)(*((void *)&v108 + 1) + 8 * (void)j);
              long long v44 = [v43 info];
              unsigned int v45 = [v36 containsObject:v44];

              if (v45) {
                [v37 removeObject:v43];
              }
            }
            id v40 = [v38 countByEnumeratingWithState:&v108 objects:v121 count:16];
          }
          while (v40);
        }

        id v20 = v37;
        uint64_t v5 = &off_1014C1000;
      }
    }
    id v46 = objc_alloc_init(v5[76]);
    long long v104 = 0u;
    long long v105 = 0u;
    long long v106 = 0u;
    long long v107 = 0u;
    uint64_t v9 = v20;
    id v47 = [(NSArray *)v9 countByEnumeratingWithState:&v104 objects:v120 count:16];
    if (v47)
    {
      id v48 = v47;
      uint64_t v49 = *(void *)v105;
      do
      {
        for (k = 0; k != v48; k = (char *)k + 1)
        {
          if (*(void *)v105 != v49) {
            objc_enumerationMutation(v9);
          }
          long long v51 = [*(id *)(*((void *)&v104 + 1) + 8 * (void)k) additionalLayoutsForRepCreation];
          [v46 addObjectsFromArray:v51];
        }
        id v48 = [(NSArray *)v9 countByEnumeratingWithState:&v104 objects:v120 count:16];
      }
      while (v48);
    }

    long long v102 = 0u;
    long long v103 = 0u;
    long long v100 = 0u;
    long long v101 = 0u;
    id v52 = v46;
    id v53 = [v52 countByEnumeratingWithState:&v100 objects:v119 count:16];
    if (v53)
    {
      id v54 = v53;
      uint64_t v55 = *(void *)v101;
      do
      {
        for (m = 0; m != v54; m = (char *)m + 1)
        {
          if (*(void *)v101 != v55) {
            objc_enumerationMutation(v52);
          }
          uint64_t v57 = *(void *)(*((void *)&v100 + 1) + 8 * (void)m);
          if (![(NSArray *)v9 containsObject:v57])
          {
            uint64_t v58 = [(NSArray *)v9 arrayByAddingObject:v57];

            uint64_t v9 = (NSArray *)v58;
          }
        }
        id v54 = [v52 countByEnumeratingWithState:&v100 objects:v119 count:16];
      }
      while (v54);
    }

    if (!self->mInvalidFlags.layout
      && !self->mInvalidFlags.reps
      && [(NSArray *)v9 isEqualToArray:self->mPreviouslyVisibleLayouts])
    {
      BOOL v10 = 0;
LABEL_84:

      return v10;
    }
    objc_storeStrong((id *)&self->mPreviouslyVisibleLayouts, v9);

LABEL_51:
    v87 = (NSArray *)objc_alloc_init(v5[76]);
    v59 = (NSSet *)objc_alloc_init((Class)NSMutableSet);
    long long v96 = 0u;
    long long v97 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    uint64_t v9 = v9;
    id v60 = [(NSArray *)v9 countByEnumeratingWithState:&v96 objects:v118 count:16];
    if (v60)
    {
      id v61 = v60;
      uint64_t v62 = *(void *)v97;
      do
      {
        for (n = 0; n != v61; n = (char *)n + 1)
        {
          if (*(void *)v97 != v62) {
            objc_enumerationMutation(v9);
          }
          v64 = *(void **)(*((void *)&v96 + 1) + 8 * (void)n);
          id v65 = [(CRLCanvas *)self repForLayout:v64];
          if (!v65)
          {
            id v65 = objc_msgSend(objc_alloc((Class)objc_msgSend(v64, "repClassOverride")), "initWithLayout:canvas:", v64, self);
            if (!v65) {
              continue;
            }
          }
          [v65 setParentRep:0];
          [(NSArray *)v87 addObject:v65];
          [v65 updateChildrenFromLayout];
          [v65 recursivelyPerformSelector:"updateFromLayout"];
          [v65 recursivelyPerformSelector:"addToSet:" withObject:v59];
        }
        id v61 = [(NSArray *)v9 countByEnumeratingWithState:&v96 objects:v118 count:16];
      }
      while (v61);
    }

    long long v94 = 0u;
    long long v95 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    v66 = self->mAllReps;
    id v67 = [(NSSet *)v66 countByEnumeratingWithState:&v92 objects:v117 count:16];
    if (v67)
    {
      id v68 = v67;
      uint64_t v69 = *(void *)v93;
      do
      {
        for (ii = 0; ii != v68; ii = (char *)ii + 1)
        {
          if (*(void *)v93 != v69) {
            objc_enumerationMutation(v66);
          }
          v71 = *(void **)(*((void *)&v92 + 1) + 8 * (void)ii);
          if (![(NSSet *)v59 containsObject:v71]) {
            [v71 i_willBeRemoved];
          }
        }
        id v68 = [(NSSet *)v66 countByEnumeratingWithState:&v92 objects:v117 count:16];
      }
      while (v68);
    }

    id v72 = objc_loadWeakRetained((id *)&self->mDelegate);
    char v73 = objc_opt_respondsToSelector();

    if (v73)
    {
      long long v90 = 0u;
      long long v91 = 0u;
      long long v88 = 0u;
      long long v89 = 0u;
      v74 = v59;
      id v75 = [(NSSet *)v74 countByEnumeratingWithState:&v88 objects:v116 count:16];
      if (v75)
      {
        id v76 = v75;
        uint64_t v77 = *(void *)v89;
        do
        {
          for (jj = 0; jj != v76; jj = (char *)jj + 1)
          {
            if (*(void *)v89 != v77) {
              objc_enumerationMutation(v74);
            }
            uint64_t v79 = *(void *)(*((void *)&v88 + 1) + 8 * (void)jj);
            if (![(NSSet *)self->mAllReps containsObject:v79])
            {
              id v80 = objc_loadWeakRetained((id *)&self->mDelegate);
              [v80 canvas:self createdRep:v79];
            }
          }
          id v76 = [(NSSet *)v74 countByEnumeratingWithState:&v88 objects:v116 count:16];
        }
        while (v76);
      }
    }
    [(CRLCanvas *)self orderRepsForLayout:v87];
    id v52 = [(NSSet *)v59 crl_setBySubtractingSet:self->mAllReps];
    if ([v52 count])
    {
      [(NSMutableSet *)self->mRepsWithInvalidContentLayers unionSet:v52];
      [(NSMutableSet *)self->mRepsWithInvalidOverlayLayers unionSet:v52];
    }
    mAllReps = self->mAllReps;
    self->mAllReps = v59;
    v82 = v59;

    mTopLevelReps = self->mTopLevelReps;
    self->mTopLevelReps = v87;
    v84 = v87;

    mAllRepsOrdered = self->mAllRepsOrdered;
    self->mAllRepsOrdered = 0;

    BOOL v10 = 1;
    goto LABEL_84;
  }
  uint64_t v9 = self->mPreviouslyVisibleLayouts;
  if (v9) {
    goto LABEL_51;
  }
  return 0;
}

- (void)orderRepsForLayout:(id)a3
{
  id v8 = a3;
  if (+[CRLFeatureFlagGroup isThreeDimensionalObjectsEnabled])
  {
    long long v4 = &stru_101500230;
    uint64_t v5 = v8;
  }
  else
  {
    unsigned int v6 = [(CRLCanvas *)self isCanvasInteractive];
    id v7 = v8;
    if (!v6) {
      goto LABEL_6;
    }
    long long v4 = &stru_101500250;
    uint64_t v5 = v8;
  }
  [v5 sortUsingComparator:v4];
  id v7 = v8;
LABEL_6:
}

- (void)p_removeAllReps
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  BOOL v3 = self->mAllReps;
  id v4 = [(NSSet *)v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * (void)v7) i_willBeRemoved:v13];
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSSet *)v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  id v8 = (NSSet *)objc_alloc_init((Class)NSSet);
  mAllReps = self->mAllReps;
  self->mAllReps = v8;

  BOOL v10 = (NSArray *)objc_alloc_init((Class)NSArray);
  mTopLevelReps = self->mTopLevelReps;
  self->mTopLevelReps = v10;

  mAllRepsOrdered = self->mAllRepsOrdered;
  self->mAllRepsOrdered = 0;

  [(NSMutableSet *)self->mRepsWithInvalidContentLayers removeAllObjects];
  [(NSMutableSet *)self->mRepsWithInvalidOverlayLayers removeAllObjects];
}

- (NSArray)allRepsOrdered
{
  mAllRepsOrdered = self->mAllRepsOrdered;
  if (!mAllRepsOrdered)
  {
    id v4 = +[NSMutableArray array];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = self->mTopLevelReps;
    id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          [objc_opt_class() p_recursivelyAddOrderedChildrenOfRep:*v9 toArray:v4];
          uint64_t v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }

    BOOL v10 = (NSArray *)[v4 copy];
    double v11 = self->mAllRepsOrdered;
    self->mAllRepsOrdered = v10;

    mAllRepsOrdered = self->mAllRepsOrdered;
  }

  return mAllRepsOrdered;
}

- (CGRect)unscaledRectOfLayouts
{
  v2 = [(CRLCanvas *)self layoutController];
  [v2 rectOfTopLevelLayouts];
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

+ (void)p_recursivelyAddOrderedChildrenOfRep:(id)a3 toArray:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v7 addObject:v6];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  double v8 = [v6 childReps];
  id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      double v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [a1 p_recursivelyAddOrderedChildrenOfRep:*(void *)(*((void *)&v13 + 1) + 8 * (void)v12) toArray:v7];
        double v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (BOOL)i_InLayout
{
  return self->mInLayout;
}

- (NSSet)i_previousRenderDatasNeedingDownload
{
  return self->mPreviousRenderDatasNeedingDownload;
}

- (UIEdgeInsets)contentInset
{
  double top = self->mContentInset.top;
  double left = self->mContentInset.left;
  double bottom = self->mContentInset.bottom;
  double right = self->mContentInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  self->mContentInset = a3;
}

- (CRLCanvasDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);

  return (CRLCanvasDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)infosToDisplay
{
  return self->mInfos;
}

- (NSArray)topLevelReps
{
  return self->mTopLevelReps;
}

- (NSSet)allReps
{
  return self->mAllReps;
}

- (CRLCanvasLayoutController)layoutController
{
  return self->mLayoutController;
}

- (BOOL)enableInstructionalText
{
  return self->mEnableInstructionalText;
}

- (BOOL)isAnchoredAtRight
{
  return self->mIsAnchoredAtRight;
}

- (void)setIsAnchoredAtRight:(BOOL)a3
{
  self->mIsAnchoredAtRight = a3;
}

- (CRLColor)backgroundColor
{
  return self->mBackgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (BOOL)allowsFontSubpixelQuantization
{
  return self->mAllowsFontSubpixelQuantization;
}

- (void)setAllowsFontSubpixelQuantization:(BOOL)a3
{
  self->mAllowsFontSubpixelQuantization = a3;
}

- (BOOL)suppressesShadowsAndReflections
{
  return self->mSuppressesShadowsAndReflections;
}

- (BOOL)suppressesShapeText
{
  return self->mSuppressesShapeText;
}

- (void)setSuppressesShapeText:(BOOL)a3
{
  self->mSuppressesShapeText = a3;
}

- (BOOL)shouldRenderInvisibleContentForNonInteractiveCanvas
{
  return self->mShouldRenderInvisibleContentForNonInteractiveCanvas;
}

- (void)setShouldRenderInvisibleContentForNonInteractiveCanvas:(BOOL)a3
{
  self->mShouldRenderInvisibleContentForNonInteractiveCanvas = a3;
}

- (double)i_viewScaleForAudioObjectsInNonInteractiveCanvas
{
  return self->i_viewScaleForAudioObjectsInNonInteractiveCanvas;
}

- (void)setI_viewScaleForAudioObjectsInNonInteractiveCanvas:(double)a3
{
  self->i_viewScaleForAudioObjectsInNonInteractiveCanvas = a3;
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

- (BOOL)isTemporaryForLayout
{
  return self->mIsTemporaryForLayout;
}

- (BOOL)i_inLayout
{
  return self->_i_inLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mPreviousRenderDatasNeedingDownload, 0);
  objc_storeStrong((id *)&self->mBackgroundColor, 0);
  objc_storeStrong((id *)&self->mCanvasLayoutObservers, 0);
  objc_storeStrong((id *)&self->mBlocksToPerformAfterLayoutAndLayerUpdating, 0);
  objc_storeStrong((id *)&self->mBlocksToPerformAfterLayout, 0);
  objc_storeStrong((id *)&self->mPreviouslyVisibleLayouts, 0);
  objc_storeStrong((id *)&self->mRepsWithInvalidOverlayLayers, 0);
  objc_storeStrong((id *)&self->mRepsWithInvalidContentLayers, 0);
  objc_storeStrong((id *)&self->mLayoutController, 0);
  objc_storeStrong((id *)&self->mRepsByLayout, 0);
  objc_storeStrong((id *)&self->mAllRepsOrdered, 0);
  objc_storeStrong((id *)&self->mAllReps, 0);
  objc_storeStrong((id *)&self->mTopLevelReps, 0);
  objc_storeStrong((id *)&self->mInfos, 0);
  objc_destroyWeak((id *)&self->mCanvasController);

  objc_destroyWeak((id *)&self->mDelegate);
}

- (id)textRendererForLayer:(id)a3 context:(CGContext *)a4
{
  id v7 = objc_allocWithZone((Class)CRLWPRenderer);
  double v8 = a4;
  id v9 = self;
  id v10 = a3;
  id result = [v7 initWithContext:v8];
  if (result)
  {
    id v12 = result;

    return v12;
  }
  else
  {
    __break(1u);
  }
  return result;
}

@end