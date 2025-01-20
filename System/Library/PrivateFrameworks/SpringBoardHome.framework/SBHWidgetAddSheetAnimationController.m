@interface SBHWidgetAddSheetAnimationController
- (CGPoint)fromPoint;
- (SBHAddWidgetSheetGalleryCollectionViewCell)sourceCell;
- (SBHPortaledShadowedWidgetView)portaledShadowedWidgetView;
- (SBHWidgetAddSheetAnimationController)initWithSourceCell:(id)a3;
- (UIView)matchMoveView;
- (id)interruptibleAnimatorForTransition:(id)a3;
- (void)animateTransition:(id)a3;
- (void)interruptAnimation;
- (void)setFromPoint:(CGPoint)a3;
- (void)setMatchMoveView:(id)a3;
- (void)setPortaledShadowedWidgetView:(id)a3;
- (void)setSourceCell:(id)a3;
@end

@implementation SBHWidgetAddSheetAnimationController

- (SBHWidgetAddSheetAnimationController)initWithSourceCell:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBHWidgetAddSheetAnimationController;
  v6 = [(_UISheetAnimationController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_sourceCell, a3);
  }

  return v7;
}

- (SBHPortaledShadowedWidgetView)portaledShadowedWidgetView
{
  portaledShadowedWidgetView = self->_portaledShadowedWidgetView;
  if (!portaledShadowedWidgetView)
  {
    v4 = [(SBHAddWidgetSheetGalleryCollectionViewCell *)self->_sourceCell widgetWrapperViewController];
    id v5 = [v4 wrapperView];
    v6 = (SBHPortaledShadowedWidgetView *)[v5 newPortaledShadowedWidgetView];
    v7 = self->_portaledShadowedWidgetView;
    self->_portaledShadowedWidgetView = v6;

    portaledShadowedWidgetView = self->_portaledShadowedWidgetView;
  }
  return portaledShadowedWidgetView;
}

- (void)animateTransition:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4FB1EB0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__SBHWidgetAddSheetAnimationController_animateTransition___block_invoke;
  v8[3] = &unk_1E6AACA90;
  id v9 = v4;
  v10 = self;
  id v6 = v4;
  [v5 performWithoutAnimation:v8];
  v7.receiver = self;
  v7.super_class = (Class)SBHWidgetAddSheetAnimationController;
  [(_UISheetAnimationController *)&v7 animateTransition:v6];
}

void __58__SBHWidgetAddSheetAnimationController_animateTransition___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) viewControllerForKey:*MEMORY[0x1E4FB30C8]];
  v2 = [*(id *)(*(void *)(a1 + 40) + 192) widgetWrapperViewController];
  v3 = [v2 galleryItem];
  id v4 = [*(id *)(*(void *)(a1 + 40) + 192) widgetWrapperViewController];
  objc_msgSend(v5, "configureForGalleryItem:selectedSizeClass:", v3, objc_msgSend(v4, "selectedSizeClass"));
}

- (id)interruptibleAnimatorForTransition:(id)a3
{
  v75[1] = *MEMORY[0x1E4F143B8];
  v74.receiver = self;
  v74.super_class = (Class)SBHWidgetAddSheetAnimationController;
  id v4 = a3;
  id v5 = [(_UISheetAnimationController *)&v74 interruptibleAnimatorForTransition:v4];
  id v6 = [v4 viewControllerForKey:*MEMORY[0x1E4FB30C8]];
  objc_super v7 = [(SBHAddWidgetSheetGalleryCollectionViewCell *)self->_sourceCell widgetWrapperViewController];
  v8 = [v7 wrapperView];
  id v9 = [v8 contentView];

  v10 = [v6 currentPage];
  v11 = [v10 widgetWrapperViewController];
  v12 = [v11 wrapperView];
  v13 = [v12 containerView];

  v14 = [(SBHWidgetAddSheetAnimationController *)self portaledShadowedWidgetView];
  v15 = [v4 containerView];

  [(SBHWidgetAddSheetAnimationController *)self fromPoint];
  BOOL v18 = v17 == *MEMORY[0x1E4F1DAD8] && v16 == *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  v66 = v6;
  v67 = v14;
  if (v18)
  {
    [v9 bounds];
    UIRectGetCenter();
    objc_msgSend(v15, "convertPoint:fromView:", v9);
    self->_fromPoint.x = v29;
    self->_fromPoint.y = v30;
    [v13 bounds];
    double v32 = v31;
    double v34 = v33;
    double v36 = v35;
    double v38 = v37;
    v39 = [v6 view];
    [v39 bounds];
    double v41 = v40;
    double v43 = v42;
    double v45 = v44;
    double v47 = v46;
    [v6 view];
    v48 = v65 = v10;
    objc_msgSend(v15, "convertRect:fromView:", v48, v41, v43, v45, v47);
    double v50 = v49;
    double v52 = v51;

    [v15 bounds];
    v26 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v50, 0.0, v52, v53);
    [(UIView *)v26 setClipsToBounds:1];
    [(UIView *)v26 setUserInteractionEnabled:0];
    [v15 addSubview:v26];
    v54 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v32, v34, v36, v38);
    matchMoveView = self->_matchMoveView;
    self->_matchMoveView = v54;

    v56 = self->_matchMoveView;
    UIRectGetCenter();
    -[UIView convertPoint:fromView:](v26, "convertPoint:fromView:", v13);
    -[UIView setCenter:](v56, "setCenter:");
    [(UIView *)self->_matchMoveView setClipsToBounds:0];
    [(UIView *)self->_matchMoveView setUserInteractionEnabled:0];
    [(UIView *)self->_matchMoveView addSubview:v14];
    [(UIView *)v26 addSubview:self->_matchMoveView];
    v27 = [MEMORY[0x1E4F39C00] animation];
    [v13 layer];
    v64 = v7;
    v57 = v23 = v9;
    [v27 setSourceLayer:v57];

    [v27 setDuration:INFINITY];
    [v27 setFillMode:*MEMORY[0x1E4F39FA0]];
    [v27 setRemovedOnCompletion:0];
    [v27 setAppliesY:1];
    [v27 setAppliesX:1];
    v58 = (void *)MEMORY[0x1E4F29238];
    UIRectGetCenter();
    v59 = objc_msgSend(v58, "valueWithCGPoint:");
    v75[0] = v59;
    [MEMORY[0x1E4F1C978] arrayWithObjects:v75 count:1];
    v61 = v60 = v5;
    [v27 setSourcePoints:v61];

    id v5 = v60;
    v62 = [(UIView *)self->_matchMoveView layer];
    [v62 addAnimation:v27 forKey:@"match-move"];

    v28 = v64;
    v25 = v65;
  }
  else
  {
    char v19 = [v7 forcesEdgeAntialiasing];
    [v7 setForcesEdgeAntialiasing:1];
    [v10 setJumpAnimationInProgress:1];
    -[UIView convertPoint:fromView:](self->_matchMoveView, "convertPoint:fromView:", v15, self->_fromPoint.x, self->_fromPoint.y);
    objc_msgSend(v14, "setCenter:");
    v20 = self->_matchMoveView;
    v21 = v14;
    v22 = v7;
    v23 = v9;
    v24 = v20;
    v68[0] = MEMORY[0x1E4F143A8];
    v68[1] = 3221225472;
    v68[2] = __75__SBHWidgetAddSheetAnimationController_interruptibleAnimatorForTransition___block_invoke;
    v68[3] = &unk_1E6AACE30;
    v69 = v20;
    id v70 = v21;
    id v71 = v10;
    id v72 = v22;
    char v73 = v19;
    v25 = v10;
    v26 = v24;
    [v5 addAnimations:v68];

    v27 = v69;
    v28 = v22;
  }

  return v5;
}

void __75__SBHWidgetAddSheetAnimationController_interruptibleAnimatorForTransition___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) bounds];
  UIRectGetCenter();
  objc_msgSend(*(id *)(a1 + 40), "setCenter:");
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__SBHWidgetAddSheetAnimationController_interruptibleAnimatorForTransition___block_invoke_2;
  block[3] = &unk_1E6AACE30;
  id v3 = *(id *)(a1 + 40);
  id v4 = *(id *)(a1 + 48);
  id v5 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 56);
  char v7 = *(unsigned char *)(a1 + 64);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __75__SBHWidgetAddSheetAnimationController_interruptibleAnimatorForTransition___block_invoke_2(uint64_t a1)
{
  memset(&v19, 0, sizeof(v19));
  CGAffineTransformMakeScale(&v19, 1.4, 1.4);
  CGAffineTransform v17 = v19;
  memset(&v18, 0, sizeof(v18));
  CGAffineTransformTranslate(&v18, &v17, 0.0, 25.0);
  v2 = (void *)MEMORY[0x1E4FB1EB0];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __75__SBHWidgetAddSheetAnimationController_interruptibleAnimatorForTransition___block_invoke_3;
  v13[3] = &unk_1E6AACDB8;
  id v14 = *(id *)(a1 + 32);
  CGAffineTransform v15 = v19;
  CGAffineTransform v16 = v18;
  [v2 animateWithDuration:0 delay:v13 usingSpringWithDamping:0 initialSpringVelocity:0.375 options:0.0 animations:1.0 completion:5.0];
  id v3 = (void *)MEMORY[0x1E4FB1EB0];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __75__SBHWidgetAddSheetAnimationController_interruptibleAnimatorForTransition___block_invoke_4;
  v9[3] = &unk_1E6AACDE0;
  id v10 = *(id *)(a1 + 40);
  id v11 = *(id *)(a1 + 48);
  id v12 = *(id *)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __75__SBHWidgetAddSheetAnimationController_interruptibleAnimatorForTransition___block_invoke_5;
  v4[3] = &unk_1E6AACE08;
  id v5 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 56);
  char v8 = *(unsigned char *)(a1 + 64);
  [v3 animateWithDuration:0 delay:v9 usingSpringWithDamping:v4 initialSpringVelocity:1.5 options:0.0 animations:1.0 completion:0.0];
}

uint64_t __75__SBHWidgetAddSheetAnimationController_interruptibleAnimatorForTransition___block_invoke_3(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  long long v3 = *(_OWORD *)(a1 + 56);
  long long v7 = *(_OWORD *)(a1 + 40);
  long long v8 = v3;
  long long v9 = *(_OWORD *)(a1 + 72);
  [v2 setContentTransform:&v7];
  id v4 = *(void **)(a1 + 32);
  long long v5 = *(_OWORD *)(a1 + 104);
  long long v7 = *(_OWORD *)(a1 + 88);
  long long v8 = v5;
  long long v9 = *(_OWORD *)(a1 + 120);
  return [v4 setShadowSupplementalTransform:&v7];
}

void __75__SBHWidgetAddSheetAnimationController_interruptibleAnimatorForTransition___block_invoke_4(uint64_t a1)
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v16 = 0u;
  v2 = *(void **)(a1 + 32);
  if (v2) {
    [v2 wrapperViewTransform];
  }
  long long v3 = *(void **)(a1 + 40);
  long long v13 = v16;
  long long v14 = v17;
  long long v15 = v18;
  [v3 setTransform:&v13];
  id v4 = *(void **)(a1 + 48);
  long long v11 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  long long v13 = *MEMORY[0x1E4F1DAB8];
  long long v10 = v13;
  long long v14 = v11;
  long long v15 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  long long v9 = v15;
  [v4 setContentTransform:&v13];
  long long v5 = *(void **)(a1 + 48);
  long long v13 = v10;
  long long v14 = v11;
  long long v15 = v9;
  [v5 setShadowSupplementalTransform:&v13];
  id v6 = [*(id *)(a1 + 32) widgetWrapperViewController];
  long long v7 = [v6 wrapperView];

  long long v8 = *(void **)(a1 + 48);
  if (v7) {
    [v7 hoverTransform];
  }
  else {
    memset(v12, 0, sizeof(v12));
  }
  [v8 setTransform3D:v12];
  objc_msgSend(*(id *)(a1 + 48), "setPerspectiveEnabled:", objc_msgSend(v7, "isHoverAnimationEnabled"));
}

uint64_t __75__SBHWidgetAddSheetAnimationController_interruptibleAnimatorForTransition___block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) setHidden:1];
  [*(id *)(a1 + 40) setJumpAnimationInProgress:0];
  v2 = *(void **)(a1 + 48);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 56);
  return [v2 setForcesEdgeAntialiasing:v3];
}

- (void)interruptAnimation
{
}

- (SBHAddWidgetSheetGalleryCollectionViewCell)sourceCell
{
  return self->_sourceCell;
}

- (void)setSourceCell:(id)a3
{
}

- (void)setPortaledShadowedWidgetView:(id)a3
{
}

- (CGPoint)fromPoint
{
  double x = self->_fromPoint.x;
  double y = self->_fromPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setFromPoint:(CGPoint)a3
{
  self->_fromPoint = a3;
}

- (UIView)matchMoveView
{
  return self->_matchMoveView;
}

- (void)setMatchMoveView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchMoveView, 0);
  objc_storeStrong((id *)&self->_portaledShadowedWidgetView, 0);
  objc_storeStrong((id *)&self->_sourceCell, 0);
}

@end