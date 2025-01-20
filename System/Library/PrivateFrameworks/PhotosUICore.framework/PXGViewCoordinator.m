@interface PXGViewCoordinator
+ (id)tungstenViewCoordinatorInContainerViewController:(id)a3;
- (BOOL)isPreparedForTransition;
- (BOOL)shouldEmbedContentLayout;
- (BOOL)shouldMoveTungstenViewDuringTransition;
- (BOOL)showsHorizontalScrollIndicator;
- (BOOL)showsVerticalScrollIndicator;
- (PXGLayout)contentLayout;
- (PXGTransitioningLayout)transitionLayout;
- (PXGView)tungstenView;
- (PXGViewCoordinator)init;
- (PXGViewCoordinator)initWithContentLayout:(id)a3 containerView:(id)a4 belowSubview:(id)a5 containerViewController:(id)a6 configuration:(id)a7;
- (PXMediaProvider)mediaProvider;
- (UIEdgeInsets)insets;
- (UIView)belowSubview;
- (UIView)containerView;
- (int64_t)contentInsetAdjustmentBehavior;
- (unsigned)presentationType;
- (void)_addTungstenViewToContainerView;
- (void)prepareForTransitionInContainerView:(id)a3 withContentFrame:(CGRect)a4;
- (void)restoreAfterTransition;
- (void)setContentInsetAdjustmentBehavior:(int64_t)a3;
- (void)setInsets:(UIEdgeInsets)a3;
- (void)setIsPreparedForTransition:(BOOL)a3;
- (void)setMediaProvider:(id)a3;
- (void)setPresentationType:(unsigned __int8)a3;
- (void)setShouldEmbedContentLayout:(BOOL)a3;
- (void)setShouldMoveTungstenViewDuringTransition:(BOOL)a3;
- (void)setShowsHorizontalScrollIndicator:(BOOL)a3;
- (void)setShowsVerticalScrollIndicator:(BOOL)a3;
@end

@implementation PXGViewCoordinator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentLayout, 0);
  objc_storeStrong((id *)&self->_transitionLayout, 0);
  objc_destroyWeak((id *)&self->_belowSubview);
  objc_destroyWeak((id *)&self->_containerView);
  objc_storeStrong((id *)&self->_tungstenView, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_backgroundColorByViewBeforeTransition, 0);
}

- (PXGLayout)contentLayout
{
  return self->_contentLayout;
}

- (void)setIsPreparedForTransition:(BOOL)a3
{
  self->_isPreparedForTransition = a3;
}

- (BOOL)isPreparedForTransition
{
  return self->_isPreparedForTransition;
}

- (PXGTransitioningLayout)transitionLayout
{
  return self->_transitionLayout;
}

- (UIView)belowSubview
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_belowSubview);
  return (UIView *)WeakRetained;
}

- (UIView)containerView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerView);
  return (UIView *)WeakRetained;
}

- (PXGView)tungstenView
{
  return self->_tungstenView;
}

- (void)setPresentationType:(unsigned __int8)a3
{
  self->_presentationType = a3;
}

- (unsigned)presentationType
{
  return self->_presentationType;
}

- (void)setShouldMoveTungstenViewDuringTransition:(BOOL)a3
{
  self->_shouldMoveTungstenViewDuringTransition = a3;
}

- (BOOL)shouldMoveTungstenViewDuringTransition
{
  return self->_shouldMoveTungstenViewDuringTransition;
}

- (void)setShouldEmbedContentLayout:(BOOL)a3
{
  self->_shouldEmbedContentLayout = a3;
}

- (BOOL)shouldEmbedContentLayout
{
  return self->_shouldEmbedContentLayout;
}

- (void)setContentInsetAdjustmentBehavior:(int64_t)a3
{
  self->_contentInsetAdjustmentBehavior = a3;
}

- (int64_t)contentInsetAdjustmentBehavior
{
  return self->_contentInsetAdjustmentBehavior;
}

- (void)setShowsVerticalScrollIndicator:(BOOL)a3
{
  self->_showsVerticalScrollIndicator = a3;
}

- (BOOL)showsVerticalScrollIndicator
{
  return self->_showsVerticalScrollIndicator;
}

- (void)setShowsHorizontalScrollIndicator:(BOOL)a3
{
  self->_showsHorizontalScrollIndicator = a3;
}

- (BOOL)showsHorizontalScrollIndicator
{
  return self->_showsHorizontalScrollIndicator;
}

- (void)setInsets:(UIEdgeInsets)a3
{
  self->_insets = a3;
}

- (UIEdgeInsets)insets
{
  double top = self->_insets.top;
  double left = self->_insets.left;
  double bottom = self->_insets.bottom;
  double right = self->_insets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setMediaProvider:(id)a3
{
}

- (PXMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (void)_addTungstenViewToContainerView
{
  id v5 = [(PXGViewCoordinator *)self containerView];
  v3 = [(PXGViewCoordinator *)self tungstenView];
  v4 = [(PXGViewCoordinator *)self belowSubview];
  if (v4) {
    [v5 insertSubview:v3 belowSubview:v4];
  }
  else {
    [v5 addSubview:v3];
  }
}

- (void)restoreAfterTransition
{
  if ([(PXGViewCoordinator *)self isPreparedForTransition])
  {
    double v3 = *MEMORY[0x1E4F1DB20];
    double v4 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v5 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v6 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    v7 = [(PXGViewCoordinator *)self transitionLayout];
    objc_msgSend(v7, "setContentFrameOverride:", v3, v4, v5, v6);

    [(PXGViewCoordinator *)self tungstenView];
    objc_claimAutoreleasedReturnValue();
    [(PXGViewCoordinator *)self containerView];
    [(id)objc_claimAutoreleasedReturnValue() bounds];
    [(PXGViewCoordinator *)self insets];
    PXEdgeInsetsInsetRect();
  }
}

- (void)prepareForTransitionInContainerView:(id)a3 withContentFrame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v15 = a3;
  v9 = [(PXGViewCoordinator *)self tungstenView];
  v10 = [(PXGViewCoordinator *)self transitionLayout];

  if (v10)
  {
    [v15 bounds];
    objc_msgSend(v9, "setFrame:");
    v11 = [(PXGViewCoordinator *)self transitionLayout];
    objc_msgSend(v11, "setContentFrameOverride:", x, y, width, height);
  }
  [(NSMapTable *)self->_backgroundColorByViewBeforeTransition removeAllObjects];
  if ([(PXGViewCoordinator *)self shouldMoveTungstenViewDuringTransition])
  {
    backgroundColorByViewBeforeTransition = self->_backgroundColorByViewBeforeTransition;
    v13 = [v9 backgroundColor];
    [(NSMapTable *)backgroundColorByViewBeforeTransition setObject:v13 forKey:v9];

    v14 = [MEMORY[0x1E4FB1618] clearColor];
    [v9 setBackgroundColor:v14];

    [v15 addSubview:v9];
  }
  [v9 forceUpdate];
  [(PXGViewCoordinator *)self setIsPreparedForTransition:1];
}

- (PXGViewCoordinator)initWithContentLayout:(id)a3 containerView:(id)a4 belowSubview:(id)a5 containerViewController:(id)a6 configuration:(id)a7
{
  v32[2] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v17 = (void (**)(id, void))a7;
  v31.receiver = self;
  v31.super_class = (Class)PXGViewCoordinator;
  v18 = [(PXGViewCoordinator *)&v31 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_contentLayout, a3);
    objc_storeWeak((id *)&v19->_containerView, v14);
    objc_storeWeak((id *)&v19->_belowSubview, v15);
    v19->_shouldMoveTungstenViewDuringTransition = 1;
    uint64_t v20 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    backgroundColorByViewBeforeTransition = v19->_backgroundColorByViewBeforeTransition;
    v19->_backgroundColorByViewBeforeTransition = (NSMapTable *)v20;

    if (v17) {
      ((void (**)(id, PXGViewCoordinator *))v17)[2](v17, v19);
    }
    if (v16)
    {
      v22 = (void *)_tungstenViewCoordinatorsByContainerViewController;
      if (!_tungstenViewCoordinatorsByContainerViewController)
      {
        uint64_t v23 = [MEMORY[0x1E4F28E10] weakToWeakObjectsMapTable];
        v24 = (void *)_tungstenViewCoordinatorsByContainerViewController;
        _tungstenViewCoordinatorsByContainerViewController = v23;

        v22 = (void *)_tungstenViewCoordinatorsByContainerViewController;
      }
      [v22 setObject:v19 forKey:v16];
    }
    id v25 = v13;
    if ([(PXGViewCoordinator *)v19 shouldEmbedContentLayout])
    {
      v26 = [[PXGTransitioningLayout alloc] initWithContentLayout:v25];
      transitionLayout = v19->_transitionLayout;
      v19->_transitionLayout = v26;

      v19->_transitionLayout;
    }
    v32[0] = &unk_1F02D75B8;
    v28 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[PXGViewCoordinator presentationType](v19, "presentationType"));
    v32[1] = v28;
    [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
    objc_claimAutoreleasedReturnValue();

    objc_storeWeak((id *)&v19->_containerView, v14);
    v29 = [PXGView alloc];
    [v14 bounds];
    [(PXGViewCoordinator *)v19 insets];
    PXEdgeInsetsInsetRect();
  }

  return 0;
}

- (PXGViewCoordinator)init
{
  double v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXGViewCoordinator.m", 39, @"%s is not available as initializer", "-[PXGViewCoordinator init]");

  abort();
}

+ (id)tungstenViewCoordinatorInContainerViewController:(id)a3
{
  return (id)[(id)_tungstenViewCoordinatorsByContainerViewController objectForKey:a3];
}

@end