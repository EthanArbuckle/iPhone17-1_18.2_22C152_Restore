@interface PXWidgetCompositionUIViewElementTile
- (BOOL)_didEmbedContentView;
- (PXBasicTileAnimationOptions)animationOptions;
- (PXWidget)widget;
- (PXWidgetCompositionUIViewElementTile)initWithWidget:(id)a3;
- (UIView)_containerView;
- (_PXWidgetCompositionUIViewElementTileTransitionContext)_currentTransitionContext;
- (id)_willAnimateTileToGeometry:(PXTileGeometry *)a3 withOptions:(id)a4;
- (void)_didAnimateTileWithContext:(id)a3;
- (void)_didCompleteTileAnimationWithContext:(id)a3;
- (void)_embedContentView;
- (void)_setCurrentTransitionContext:(id)a3;
- (void)_setDidEmbedContentView:(BOOL)a3;
- (void)animateAlongsideTransition:(id)a3 completion:(id)a4;
- (void)didApplyGeometry:(PXTileGeometry *)a3 withUserData:(id)a4;
@end

@implementation PXWidgetCompositionUIViewElementTile

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__currentTransitionContext, 0);
  objc_storeStrong((id *)&self->__containerView, 0);
  objc_storeStrong((id *)&self->_widget, 0);
}

- (void)_setCurrentTransitionContext:(id)a3
{
}

- (_PXWidgetCompositionUIViewElementTileTransitionContext)_currentTransitionContext
{
  return self->__currentTransitionContext;
}

- (void)_setDidEmbedContentView:(BOOL)a3
{
  self->__didEmbedContentView = a3;
}

- (BOOL)_didEmbedContentView
{
  return self->__didEmbedContentView;
}

- (UIView)_containerView
{
  return self->__containerView;
}

- (PXWidget)widget
{
  return self->_widget;
}

- (void)animateAlongsideTransition:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(PXWidgetCompositionUIViewElementTile *)self _currentTransitionContext];
  if (!v9)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"PXWidgetCompositionUIViewElementTile.m" lineNumber:116 description:@"missing transition context"];
  }
  if (v7)
  {
    v10 = [v9 alongsideAnimation];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __78__PXWidgetCompositionUIViewElementTile_animateAlongsideTransition_completion___block_invoke;
    v18[3] = &unk_1E5DCC5D0;
    id v19 = v10;
    id v20 = v7;
    id v11 = v10;
    [v9 setAlongsideAnimation:v18];
  }
  if (v8)
  {
    v12 = [v9 alongsideAnimationCompletion];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __78__PXWidgetCompositionUIViewElementTile_animateAlongsideTransition_completion___block_invoke_2;
    v15[3] = &unk_1E5DCC5D0;
    id v16 = v12;
    id v17 = v8;
    id v13 = v12;
    [v9 setAlongsideAnimationCompletion:v15];
  }
}

uint64_t __78__PXWidgetCompositionUIViewElementTile_animateAlongsideTransition_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

uint64_t __78__PXWidgetCompositionUIViewElementTile_animateAlongsideTransition_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

- (PXBasicTileAnimationOptions)animationOptions
{
  v4 = [(PXWidgetCompositionUIViewElementTile *)self _currentTransitionContext];
  if (!v4)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"PXWidgetCompositionUIViewElementTile.m" lineNumber:108 description:@"missing transition context"];
  }
  v5 = [v4 animationOptions];

  return (PXBasicTileAnimationOptions *)v5;
}

- (void)didApplyGeometry:(PXTileGeometry *)a3 withUserData:(id)a4
{
  [(PXWidgetCompositionUIViewElementTile *)self _embedContentView];
  id v7 = [(PXWidgetCompositionUIViewElementTile *)self _currentTransitionContext];
  v5 = [v7 alongsideAnimation];

  if (v5)
  {
    v6 = [v7 alongsideAnimation];
    v6[2]();
  }
}

- (void)_didCompleteTileAnimationWithContext:(id)a3
{
  id v5 = a3;
  v3 = [v5 alongsideAnimationCompletion];

  if (v3)
  {
    v4 = [v5 alongsideAnimationCompletion];
    v4[2]();
  }
}

- (void)_didAnimateTileWithContext:(id)a3
{
}

- (id)_willAnimateTileToGeometry:(PXTileGeometry *)a3 withOptions:(id)a4
{
  id v6 = a4;
  id v7 = objc_alloc_init(_PXWidgetCompositionUIViewElementTileTransitionContext);
  [(_PXWidgetCompositionUIViewElementTileTransitionContext *)v7 setAnimationOptions:v6];

  [(PXWidgetCompositionUIViewElementTile *)self _setCurrentTransitionContext:v7];
  id v8 = [(PXWidgetCompositionUIViewElementTile *)self widget];
  v9 = objc_getAssociatedObject(v8, (const void *)PXWidgetDidLoadContentViewAssociationKey);
  int v10 = [v9 BOOLValue];

  if (v10 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v11 = [v8 contentView];

    [v11 bounds];
    if (a3->size.width != v13 || a3->size.height != v12) {
      objc_msgSend(v8, "contentViewWillTransitionToSize:withTransitionCoordinator:", self);
    }
  }
  return v7;
}

- (void)_embedContentView
{
  if (![(PXWidgetCompositionUIViewElementTile *)self _didEmbedContentView])
  {
    id object = [(PXWidgetCompositionUIViewElementTile *)self widget];
    v3 = [object contentView];
    objc_setAssociatedObject(object, (const void *)PXWidgetDidLoadContentViewAssociationKey, MEMORY[0x1E4F1CC38], (void *)1);
    v4 = [(PXWidgetCompositionUIViewElementTile *)self _containerView];
    [v4 bounds];
    objc_msgSend(v3, "setFrame:");
    [v3 setAutoresizingMask:18];
    [v4 addSubview:v3];
    [(PXWidgetCompositionUIViewElementTile *)self _setDidEmbedContentView:1];
  }
}

- (PXWidgetCompositionUIViewElementTile)initWithWidget:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXWidgetCompositionUIViewElementTile;
  id v6 = [(PXWidgetCompositionUIViewElementTile *)&v11 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_widget, a3);
    id v8 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    containerView = v7->__containerView;
    v7->__containerView = v8;
  }
  return v7;
}

@end