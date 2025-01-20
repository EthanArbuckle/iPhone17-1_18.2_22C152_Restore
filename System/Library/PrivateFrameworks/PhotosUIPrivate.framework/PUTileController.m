@interface PUTileController
- (BOOL)adoptAssetTransitionInfo:(id)a3;
- (BOOL)disappearanceAssertionsEnabled;
- (BOOL)isActive;
- (BOOL)isAnimating;
- (BOOL)isDetached;
- (BOOL)isPresentationActive;
- (BOOL)isReusable;
- (BOOL)isViewControllerTransitioning;
- (BOOL)shouldAvoidInPlaceSnapshottedFadeOut;
- (BOOL)shouldPreserveCurrentContent;
- (BOOL)shouldSuppressAnimatedUpdates;
- (BOOL)wantsVisibleRectChanges;
- (CGRect)visibleRect;
- (CGSize)expectedPresentationSize;
- (NSMutableArray)reasonsToSuppressAnimatedUpdates;
- (NSString)reuseIdentifier;
- (PUTileController)init;
- (PUTileController)initWithReuseIdentifier:(id)a3;
- (PUTileLayoutInfo)layoutInfo;
- (PUTileLayoutInfo)presentationLayoutInfo;
- (PUTilingView)tilingView;
- (id)description;
- (id)dismissalProgressBlock;
- (id)freeze;
- (id)generateAssetTransitionInfo;
- (id)presentationProgressBlock;
- (int64_t)animationCount;
- (int64_t)willBeginAnimation;
- (void)addToTilingView:(id)a3;
- (void)applyLayoutInfo:(id)a3;
- (void)becomeReusable;
- (void)didEndAnimation:(int64_t)a3;
- (void)notifyWhenReadyForDisplayWithTimeOut:(double)a3 completionHandler:(id)a4;
- (void)prepareForReuse;
- (void)removeAllAnimations;
- (void)reuseIfApplicable;
- (void)setActive:(BOOL)a3;
- (void)setAnimationCount:(int64_t)a3;
- (void)setDetached:(BOOL)a3;
- (void)setExpectedPresentationSize:(CGSize)a3;
- (void)setIsViewControllerTransitioning:(BOOL)a3;
- (void)setLayoutInfo:(id)a3;
- (void)setReasonsToSuppressAnimatedUpdates:(id)a3;
- (void)setReusable:(BOOL)a3;
- (void)setShouldPreserveCurrentContent:(BOOL)a3;
- (void)setTilingView:(id)a3;
- (void)startSuppressingAnimatedUpdatesWithReason:(id)a3;
- (void)stopSuppressingAnimatedUpdatesWithReason:(id)a3;
- (void)viewControllerTransitionDidEnd;
- (void)viewControllerTransitionWillBegin;
@end

@implementation PUTileController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutInfo, 0);
  objc_destroyWeak((id *)&self->_tilingView);
  objc_storeStrong((id *)&self->_reasonsToSuppressAnimatedUpdates, 0);
  objc_storeStrong((id *)&self->_reuseIdentifier, 0);
}

- (BOOL)isViewControllerTransitioning
{
  return self->_isViewControllerTransitioning;
}

- (BOOL)wantsVisibleRectChanges
{
  return self->_wantsVisibleRectChanges;
}

- (PUTileLayoutInfo)layoutInfo
{
  return self->_layoutInfo;
}

- (PUTilingView)tilingView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tilingView);
  return (PUTilingView *)WeakRetained;
}

- (int64_t)animationCount
{
  return self->_animationCount;
}

- (void)setReusable:(BOOL)a3
{
  self->_reusable = a3;
}

- (BOOL)isReusable
{
  return self->_reusable;
}

- (void)setReasonsToSuppressAnimatedUpdates:(id)a3
{
}

- (CGSize)expectedPresentationSize
{
  double width = self->_expectedPresentationSize.width;
  double height = self->_expectedPresentationSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setShouldPreserveCurrentContent:(BOOL)a3
{
  self->_shouldPreserveCurrentContent = a3;
}

- (BOOL)shouldPreserveCurrentContent
{
  return self->_shouldPreserveCurrentContent;
}

- (NSString)reuseIdentifier
{
  return self->_reuseIdentifier;
}

- (void)setDetached:(BOOL)a3
{
  self->_detached = a3;
}

- (BOOL)isDetached
{
  return self->_detached;
}

- (BOOL)isActive
{
  return self->_active;
}

- (BOOL)disappearanceAssertionsEnabled
{
  return 1;
}

- (id)dismissalProgressBlock
{
  return 0;
}

- (id)presentationProgressBlock
{
  return 0;
}

- (BOOL)shouldSuppressAnimatedUpdates
{
  v2 = [(PUTileController *)self reasonsToSuppressAnimatedUpdates];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (void)stopSuppressingAnimatedUpdatesWithReason:(id)a3
{
  id v4 = a3;
  id v5 = [(PUTileController *)self reasonsToSuppressAnimatedUpdates];
  [v5 removeObject:v4];
}

- (void)startSuppressingAnimatedUpdatesWithReason:(id)a3
{
  id v4 = a3;
  [(PUTileController *)self removeAllAnimations];
  id v5 = [(PUTileController *)self reasonsToSuppressAnimatedUpdates];
  [v5 addObject:v4];
}

- (NSMutableArray)reasonsToSuppressAnimatedUpdates
{
  reasonsToSuppressAnimatedUpdates = self->_reasonsToSuppressAnimatedUpdates;
  if (!reasonsToSuppressAnimatedUpdates)
  {
    id v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v5 = self->_reasonsToSuppressAnimatedUpdates;
    self->_reasonsToSuppressAnimatedUpdates = v4;

    reasonsToSuppressAnimatedUpdates = self->_reasonsToSuppressAnimatedUpdates;
  }
  return reasonsToSuppressAnimatedUpdates;
}

- (id)description
{
  BOOL v3 = [(PUTileController *)self layoutInfo];
  id v4 = NSString;
  uint64_t v5 = objc_opt_class();
  v6 = [v3 indexPath];
  v7 = objc_msgSend(v6, "pu_shortDescription");
  v8 = [v4 stringWithFormat:@"<%@ %p; indexPath: %@>", v5, self, v7];

  return v8;
}

- (void)notifyWhenReadyForDisplayWithTimeOut:(double)a3 completionHandler:(id)a4
{
  id v4 = a4;
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = v4;
    px_dispatch_on_main_queue();
  }
}

uint64_t __75__PUTileController_notifyWhenReadyForDisplayWithTimeOut_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setExpectedPresentationSize:(CGSize)a3
{
  if (a3.width != self->_expectedPresentationSize.width || a3.height != self->_expectedPresentationSize.height)
  {
    self->_expectedPresentationSize = a3;
    [(PUTileController *)self expectedPresentationSizeDidChange];
  }
}

- (void)setIsViewControllerTransitioning:(BOOL)a3
{
  if (self->_isViewControllerTransitioning != a3)
  {
    self->_isViewControllerTransitioning = a3;
    [(PUTileController *)self isViewControllerTransitioningDidChange];
  }
}

- (void)viewControllerTransitionDidEnd
{
}

- (void)viewControllerTransitionWillBegin
{
}

- (BOOL)adoptAssetTransitionInfo:(id)a3
{
  return 1;
}

- (id)generateAssetTransitionInfo
{
  return 0;
}

- (void)setLayoutInfo:(id)a3
{
  uint64_t v5 = (PUTileLayoutInfo *)a3;
  layoutInfo = self->_layoutInfo;
  if (layoutInfo != v5)
  {
    v8 = v5;
    v7 = layoutInfo;
    objc_storeStrong((id *)&self->_layoutInfo, a3);
    if ([(PUTileController *)self wantsVisibleRectChanges]
      && ![(PUTileLayoutInfo *)v8 isGeometryEqualToLayoutInfo:v7])
    {
      [(PUTileController *)self didChangeVisibleRect];
    }

    uint64_t v5 = v8;
  }
}

- (void)setTilingView:(id)a3
{
}

- (BOOL)shouldAvoidInPlaceSnapshottedFadeOut
{
  if ([(PUTileController *)self isAnimating]) {
    return 1;
  }
  return [(PUTileController *)self isDetached];
}

- (BOOL)isAnimating
{
  return [(PUTileController *)self animationCount] > 0;
}

- (void)reuseIfApplicable
{
  id v3 = [(PUTileController *)self tilingView];
  if (v3
    && ![(PUTileController *)self isReusable]
    && ![(PUTileController *)self isActive]
    && ![(PUTileController *)self isAnimating]
    && ![(PUTileController *)self isDetached])
  {
    [v3 enqueueTileControllerForReuse:self];
  }
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    self->_active = a3;
    [(PUTileController *)self didChangeActive];
  }
}

- (void)setAnimationCount:(int64_t)a3
{
  int64_t animationCount = self->_animationCount;
  if (animationCount != a3)
  {
    self->_int64_t animationCount = a3;
    if ((a3 != 0) == (animationCount == 0)) {
      [(PUTileController *)self didChangeAnimating];
    }
  }
}

- (void)didEndAnimation:(int64_t)a3
{
  [(PUTileController *)self setAnimationCount:[(PUTileController *)self animationCount] - 1];
  if ([(PUTileController *)self animationCount] < 0)
  {
    uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"PUTileController.m" lineNumber:105 description:@"unbalanced animations"];
  }
  [(PUTileController *)self reuseIfApplicable];
  if (![(PUTileController *)self isAnimating])
  {
    id v6 = [(PUTileController *)self tilingView];
    [v6 tileControllerDidEndAnimating:self];
  }
}

- (int64_t)willBeginAnimation
{
  return willBeginAnimation_count++;
}

- (CGRect)visibleRect
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"PUTileController.m" lineNumber:92 description:@"must be implemented by concrete subclass"];

  double v5 = *MEMORY[0x1E4F1DB20];
  double v6 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v7 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v8 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  result.size.double height = v8;
  result.size.double width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (void)applyLayoutInfo:(id)a3
{
  if ([(PUTileController *)self isDetached]
    && [(PUTileController *)self wantsVisibleRectChanges])
  {
    [(PUTileController *)self didChangeVisibleRect];
  }
}

- (void)removeAllAnimations
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"PUTileController.m" lineNumber:79 description:@"must be implemented by concrete subclass"];
}

- (id)freeze
{
  id v3 = [(PUTileController *)self presentationLayoutInfo];
  [(PUTileController *)self removeAllAnimations];
  [(PUTileController *)self applyLayoutInfo:v3];
  [(PUTileController *)self setLayoutInfo:v3];
  return v3;
}

- (BOOL)isPresentationActive
{
  return 1;
}

- (PUTileLayoutInfo)presentationLayoutInfo
{
  id v4 = [(PUTileController *)self layoutInfo];
  if (!v4)
  {
    double v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"PUTileController.m" lineNumber:62 description:@"missing layout info"];
  }
  return (PUTileLayoutInfo *)v4;
}

- (void)prepareForReuse
{
  if (![(PUTileController *)self isReusable])
  {
    double v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"PUTileController.m" lineNumber:53 description:@"unexpected reusable state"];
  }
  [(PUTileController *)self setReusable:0];
  [(PUTileController *)self setLayoutInfo:0];
  id v4 = [(PUTileController *)self reasonsToSuppressAnimatedUpdates];
  [v4 removeAllObjects];

  [(PUTileController *)self removeAllAnimations];
}

- (void)becomeReusable
{
  if ([(PUTileController *)self isReusable])
  {
    double v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"PUTileController.m" lineNumber:47 description:@"unexpected reusable state"];
  }
  [(PUTileController *)self setReusable:1];
  double v4 = *MEMORY[0x1E4F1DB30];
  double v5 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  -[PUTileController setExpectedPresentationSize:](self, "setExpectedPresentationSize:", v4, v5);
}

- (void)addToTilingView:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:self file:@"PUTileController.m" lineNumber:43 description:@"must be implemented by concrete subclass"];
}

- (PUTileController)initWithReuseIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PUTileController;
  id v5 = [(PUTileController *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    double v7 = (void *)*((void *)v5 + 2);
    *((void *)v5 + 2) = v6;

    *(_OWORD *)(v5 + 56) = *MEMORY[0x1E4F1DB30];
  }

  return (PUTileController *)v5;
}

- (PUTileController)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUTileController.m", 30, @"%s is not available as initializer", "-[PUTileController init]");

  abort();
}

@end