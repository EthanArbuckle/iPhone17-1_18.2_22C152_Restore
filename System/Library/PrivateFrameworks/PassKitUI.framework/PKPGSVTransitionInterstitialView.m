@interface PKPGSVTransitionInterstitialView
- (CGFloat)resolveIndeterminatePositionWithPriorItemFrame:(CGFloat)a3 animated:(CGFloat)a4;
- (PKPGSVTransitionInterstitialView)init;
- (PKPGSVTransitionInterstitialView)initWithFrame:(CGRect)a3;
- (double)_setCurrentItem:(int)a3 withDefaultSize:(char)a4 force:(double)a5 animated:(double)a6;
- (double)pushItem:(double)a3 withDefaultSize:(double)a4 containerAlpha:(double)a5;
- (double)updateCurrentItem:(double)a3 withDefaultSize:(double)a4 containerAlpha:(double)a5;
- (id)_initForItem:(void *)a3 inView:(void *)a4 withSpringFactory:(void *)a5 dismissalSpringFactory:(void *)a6 defaultSize:(double)a7 containerAlpha:(double)a8 activationObserver:(double)a9;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)_incrementAnimationCount;
- (void)_pruneObsoleteSnapshots;
- (void)_setContainerAlpha:(double)a3 animated:;
- (void)_setPosition:(uint64_t)a1 animated:(int)a2;
- (void)_setPreviousItem:(int)a3 withDefaultSize:(char)a4 force:(double)a5 animated:(double)a6;
- (void)_swapItemsAnimated:(uint64_t)a1;
- (void)_updateActive;
- (void)_updatePositionAnimated:(uint64_t)a1;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setAnchorPoint:(CGPoint)a3;
- (void)willMoveToSuperview:(id)a3;
@end

@implementation PKPGSVTransitionInterstitialView

- (PKPGSVTransitionInterstitialView)init
{
  return 0;
}

- (PKPGSVTransitionInterstitialView)initWithFrame:(CGRect)a3
{
  return 0;
}

- (id)_initForItem:(void *)a3 inView:(void *)a4 withSpringFactory:(void *)a5 dismissalSpringFactory:(void *)a6 defaultSize:(double)a7 containerAlpha:(double)a8 activationObserver:(double)a9
{
  id v17 = a2;
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id result = a6;
  if (v19)
  {
    v22 = result;
    v35.receiver = a1;
    v35.super_class = (Class)PKPGSVTransitionInterstitialView;
    v23 = (id *)objc_msgSendSuper2(&v35, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    uint64_t v24 = (uint64_t)v23;
    if (v23)
    {
      objc_storeStrong(v23 + 53, a4);
      objc_storeStrong((id *)(v24 + 432), a5);
      BOOL v25 = !UIAccessibilityIsReduceTransparencyEnabled() && !UIAccessibilityIsReduceMotionEnabled();
      *(unsigned char *)(v24 + 408) = v25;
      id v26 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v27 = *(void **)(v24 + 512);
      *(void *)(v24 + 512) = v26;

      id v28 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v29 = *(void **)(v24 + 520);
      *(void *)(v24 + 520) = v28;

      id v30 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v31 = *(void **)(v24 + 528);
      *(void *)(v24 + 528) = v30;

      [v18 addSubview:v24];
      -[PKPGSVTransitionInterstitialView _setContainerAlpha:animated:]((void *)v24, 0, a9);
      [(PKPGSVTransitionInterstitialView *)v24 _setCurrentItem:1 withDefaultSize:0 force:a7 animated:a8];
      [(PKPGSVTransitionInterstitialView *)v24 _setPreviousItem:1 withDefaultSize:0 force:*MEMORY[0x1E4F1DB30] animated:*(double *)(MEMORY[0x1E4F1DB30] + 8)];
      if (v17) {
        -[PKPGSVTransitionInterstitialView _updatePositionAnimated:](v24, 0);
      }
      -[PKPGSVTransitionInterstitialView _updateActive](v24);
      v32 = _Block_copy(v22);
      v33 = *(void **)(v24 + 440);
      *(void *)(v24 + 440) = v32;

      uint64_t v34 = *(void *)(v24 + 440);
      if (v34)
      {
        if (*(unsigned char *)(v24 + 412)) {
          (*(void (**)(uint64_t, uint64_t))(v34 + 16))(v34, 1);
        }
      }
    }

    return (id)v24;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)_setContainerAlpha:(double)a3 animated:
{
  v6 = [a1 layer];
  uint64_t v7 = 0;
  id v17 = 0;
  if (a2) {
    uint64_t v7 = a1[53];
  }
  objc_msgSend(a1, "pkui_setAlpha:withAnimationFactory:animation:", v7, &v17, a3);
  if (v17)
  {
    v9 = -[PKPGSVTransitionInterstitialView _incrementAnimationCount](a1);
    id v10 = v17;
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    v14 = __64__PKPGSVTransitionInterstitialView__setContainerAlpha_animated___block_invoke;
    v15 = &unk_1E59CA9F8;
    id v16 = v9;
    id v11 = v9;
    objc_msgSend(v10, "pkui_setCompletionHandler:", &v12);
    objc_msgSend(v6, "removeAnimationForKey:", @"opacity", v12, v13, v14, v15);
    [v6 addAnimation:v17 forKey:@"opacity"];
  }
  else if (v8 != a3)
  {
    [v6 removeAnimationForKey:@"opacity"];
  }
}

- (double)_setCurrentItem:(int)a3 withDefaultSize:(char)a4 force:(double)a5 animated:(double)a6
{
  id v12 = a2;
  uint64_t v13 = v12;
  if (!*(unsigned char *)(a1 + 413))
  {
    if (*(id *)(a1 + 448) == v12 && (a3 & 1) == 0) {
      goto LABEL_18;
    }
    [(id)a1 layoutIfNeeded];
    if (*(void *)(a1 + 456)) {
      BOOL v14 = a3 == 0;
    }
    else {
      BOOL v14 = 1;
    }
    if (!v14)
    {
      objc_msgSend(*(id *)(a1 + 512), "addObject:");
      v15 = *(void **)(a1 + 456);
      *(void *)(a1 + 456) = 0;
    }
    if (*(void *)(a1 + 464))
    {
      objc_msgSend(*(id *)(a1 + 520), "addObject:");
      id v16 = *(void **)(a1 + 464);
      *(void *)(a1 + 464) = 0;
    }
    id v17 = *(const void **)(a1 + 472);
    if (v17)
    {
      id v18 = *(void **)(a1 + 528);
      id v19 = _Block_copy(v17);
      [v18 addObject:v19];

      id v20 = *(void **)(a1 + 472);
      *(void *)(a1 + 472) = 0;
    }
    objc_storeStrong((id *)(a1 + 448), a2);
    if (v13)
    {
      char v21 = *(unsigned char *)(a1 + 408);
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __83__PKPGSVTransitionInterstitialView__setCurrentItem_withDefaultSize_force_animated___block_invoke;
      v27[3] = &unk_1E59CDAF0;
      v27[4] = a1;
      -[PKPGSVTransitionInterstitialItem beginTrackingWithConfiguration:handler:]((uint64_t)v13, v21, v27);
    }
    else if (!*(void *)(a1 + 456))
    {
      v22 = [(double *)[PKPGSVTransitionInterstitialSnapshotContainerView alloc] initWithSnapshotSize:a6];
      v23 = *(void **)(a1 + 456);
      *(void *)(a1 + 456) = v22;

      uint64_t v24 = *(void **)(a1 + 456);
      [(id)a1 anchorPoint];
      objc_msgSend(v24, "setAnchorPoint:");
      [*(id *)(a1 + 456) setHidden:1];
      [(id)a1 addSubview:*(void *)(a1 + 456)];
    }
    [(id)a1 setNeedsLayout];
    *(unsigned char *)(a1 + 409) = a4;
    [(id)a1 layoutIfNeeded];
    *(unsigned char *)(a1 + 409) = 0;
    -[PKPGSVTransitionInterstitialView _pruneObsoleteSnapshots](a1);
    if (*(void *)(a1 + 448))
    {
LABEL_18:
      uint64_t v25 = *(void *)(a1 + 456);
      if (v25) {
        a5 = *(double *)(v25 + 408);
      }
      else {
        a5 = 0.0;
      }
    }
  }

  return a5;
}

- (void)_setPreviousItem:(int)a3 withDefaultSize:(char)a4 force:(double)a5 animated:(double)a6
{
  id v12 = a2;
  uint64_t v13 = v12;
  if (!*(unsigned char *)(a1 + 413) && (*(id *)(a1 + 480) != v12 || a3 != 0))
  {
    [(id)a1 layoutIfNeeded];
    if (*(void *)(a1 + 488)) {
      BOOL v15 = a3 == 0;
    }
    else {
      BOOL v15 = 1;
    }
    if (!v15)
    {
      objc_msgSend(*(id *)(a1 + 512), "addObject:");
      id v16 = *(void **)(a1 + 488);
      *(void *)(a1 + 488) = 0;
    }
    if (*(void *)(a1 + 496))
    {
      objc_msgSend(*(id *)(a1 + 520), "addObject:");
      id v17 = *(void **)(a1 + 496);
      *(void *)(a1 + 496) = 0;
    }
    id v18 = *(const void **)(a1 + 504);
    if (v18)
    {
      id v19 = *(void **)(a1 + 528);
      id v20 = _Block_copy(v18);
      [v19 addObject:v20];

      char v21 = *(void **)(a1 + 504);
      *(void *)(a1 + 504) = 0;
    }
    objc_storeStrong((id *)(a1 + 480), a2);
    if (v13)
    {
      char v22 = *(unsigned char *)(a1 + 408);
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __84__PKPGSVTransitionInterstitialView__setPreviousItem_withDefaultSize_force_animated___block_invoke;
      v27[3] = &unk_1E59CDAF0;
      v27[4] = a1;
      -[PKPGSVTransitionInterstitialItem beginTrackingWithConfiguration:handler:]((uint64_t)v13, v22, v27);
    }
    else if (!*(void *)(a1 + 488))
    {
      v23 = [(double *)[PKPGSVTransitionInterstitialSnapshotContainerView alloc] initWithSnapshotSize:a6];
      uint64_t v24 = *(void **)(a1 + 488);
      *(void *)(a1 + 488) = v23;

      uint64_t v25 = *(void **)(a1 + 488);
      [(id)a1 anchorPoint];
      objc_msgSend(v25, "setAnchorPoint:");
      [*(id *)(a1 + 488) setHidden:1];
      uint64_t v26 = *(void *)(a1 + 488);
      if (*(void *)(a1 + 456)) {
        objc_msgSend((id)a1, "insertSubview:belowSubview:", v26);
      }
      else {
        [(id)a1 addSubview:v26];
      }
    }
    [(id)a1 setNeedsLayout];
    *(unsigned char *)(a1 + 409) = a4;
    [(id)a1 layoutIfNeeded];
    *(unsigned char *)(a1 + 409) = 0;
    -[PKPGSVTransitionInterstitialView _pruneObsoleteSnapshots](a1);
  }
}

- (void)_updatePositionAnimated:(uint64_t)a1
{
  if (*(void *)(a1 + 448))
  {
    id v20 = [(id)a1 superview];
    uint64_t v4 = *(void *)(a1 + 448);
    if (v4) {
      id v5 = *(id *)(v4 + 8);
    }
    else {
      id v5 = 0;
    }
    v6 = [v5 superview];
    if (v20 && v6)
    {
      [v5 bounds];
      double v8 = v7;
      double v10 = v9;
      double v12 = v11;
      double v14 = v13;
      [v5 alignmentRectInsets];
      objc_msgSend(v20, "convertPoint:fromView:", v5, v8 + v15 + (v12 - (v15 + v17)) * 0.5, v10 + v16 + (v14 - (v16 + v18)) * 0.5);
      if (a2) {
        BOOL v19 = *(unsigned char *)(a1 + 411) != 0;
      }
      else {
        BOOL v19 = 0;
      }
      -[PKPGSVTransitionInterstitialView _setPosition:animated:](a1, v19);
    }
  }
}

- (void)_updateActive
{
  if (*(unsigned char *)(a1 + 413)) {
    int v2 = 0;
  }
  else {
    int v2 = *(void *)(a1 + 416) != 0;
  }
  if (*(unsigned __int8 *)(a1 + 412) != v2)
  {
    *(unsigned char *)(a1 + 412) = v2;
    -[PKPGSVTransitionInterstitialView _pruneObsoleteSnapshots](a1);
    uint64_t v3 = *(void *)(a1 + 440);
    if (v3)
    {
      uint64_t v4 = *(unsigned __int8 *)(a1 + 412);
      id v5 = *(void (**)(uint64_t, uint64_t))(v3 + 16);
      id v6 = (id)a1;
      v5(v3, v4);
    }
  }
}

- (void)dealloc
{
  if (self->_active) {
    uint64_t v3 = _Block_copy(self->_activation);
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = self->_obsoleteCompletions;
  id currentSnapshotCompletion = self->_currentSnapshotCompletion;
  if (currentSnapshotCompletion)
  {
    id v6 = _Block_copy(currentSnapshotCompletion);
    [(NSMutableArray *)v4 addObject:v6];
  }
  id previousSnapshotCompletion = self->_previousSnapshotCompletion;
  if (previousSnapshotCompletion)
  {
    double v8 = _Block_copy(previousSnapshotCompletion);
    [(NSMutableArray *)v4 addObject:v8];
  }
  if (v3 || [(NSMutableArray *)v4 count])
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __43__PKPGSVTransitionInterstitialView_dealloc__block_invoke;
    block[3] = &unk_1E59CAD68;
    id v12 = v3;
    double v11 = v4;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  v9.receiver = self;
  v9.super_class = (Class)PKPGSVTransitionInterstitialView;
  [(PKPGSVTransitionInterstitialView *)&v9 dealloc];
}

void __43__PKPGSVTransitionInterstitialView_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, 0);
  }
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v8 + 1) + 8 * v7) + 16))(*(void *)(*((void *)&v8 + 1) + 8 * v7));
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

uint64_t __46__PKPGSVTransitionInterstitialView_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (void)setAnchorPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v6.receiver = self;
  v6.super_class = (Class)PKPGSVTransitionInterstitialView;
  -[PKPGSVTransitionInterstitialView setAnchorPoint:](&v6, sel_setAnchorPoint_);
  -[PKPGSVTransitionInterstitialSnapshotContainerView setAnchorPoint:](self->_currentContainer, "setAnchorPoint:", x, y);
  -[PKPGSVTransitionInterstitialSnapshotContainerView setAnchorPoint:](self->_previousContainer, "setAnchorPoint:", x, y);
  [(PKPGSVTransitionInterstitialView *)self setNeedsLayout];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

- (void)willMoveToSuperview:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPGSVTransitionInterstitialView;
  [(PKPGSVTransitionInterstitialView *)&v4 willMoveToSuperview:a3];
  if (!self->_transferring) {
    self->_hasPosition = 0;
  }
}

- (void)layoutSubviews
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  v49.receiver = self;
  v49.super_class = (Class)PKPGSVTransitionInterstitialView;
  [(PKPGSVTransitionInterstitialView *)&v49 layoutSubviews];
  [(PKPGSVTransitionInterstitialView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(PKPGSVTransitionInterstitialView *)self anchorPoint];
  if (!self->_currentItem || (uint64_t v13 = &OBJC_IVAR___PKPGSVTransitionInterstitialView__springFactory, !self->_previousItem)) {
    uint64_t v13 = &OBJC_IVAR___PKPGSVTransitionInterstitialView__dismissalSpringFactory;
  }
  previousContainer = self->_previousContainer;
  if (previousContainer) {
    p_snapshotSize = &previousContainer->_snapshotSize;
  }
  else {
    p_snapshotSize = (CGSize *)MEMORY[0x1E4F1DB30];
  }
  double v16 = v4 + v11 * v8;
  double v17 = v6 + v12 * v10;
  uint64_t v18 = *(uint64_t *)((char *)&self->super.super.super.isa + *v13);
  Class v20 = *(Class *)&p_snapshotSize->width;
  CGFloat height = p_snapshotSize->height;
  currentContainer = self->_currentContainer;
  if (currentContainer) {
    char v22 = &currentContainer->_snapshotSize;
  }
  else {
    char v22 = (CGSize *)MEMORY[0x1E4F1DB30];
  }
  Class v24 = *(Class *)&v22->width;
  CGFloat v23 = v22->height;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __50__PKPGSVTransitionInterstitialView_layoutSubviews__block_invoke;
  aBlock[3] = &unk_1E59CDAA0;
  aBlock[4] = self;
  *(double *)&aBlock[5] = v4;
  *(double *)&aBlock[6] = v6;
  *(double *)&aBlock[7] = v8;
  *(double *)&aBlock[8] = v10;
  *(double *)&aBlock[9] = v16;
  *(double *)&aBlock[10] = v17;
  aBlock[11] = v24;
  *(CGFloat *)&aBlock[12] = v23;
  aBlock[13] = v20;
  *(CGFloat *)&aBlock[14] = height;
  aBlock[15] = v18;
  uint64_t v25 = (void (**)(void))_Block_copy(aBlock);
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __50__PKPGSVTransitionInterstitialView_layoutSubviews__block_invoke_3;
  v47[3] = &unk_1E59CDAC8;
  *(double *)&v47[5] = v4;
  *(double *)&v47[6] = v6;
  *(double *)&v47[7] = v8;
  *(double *)&v47[8] = v10;
  v47[4] = self;
  v47[9] = v18;
  uint64_t v26 = (void (**)(void *, UIImageView *, uint64_t))_Block_copy(v47);
  if (self->_currentContainer) {
    v25[2](v25);
  }
  if (self->_previousContainer) {
    v25[2](v25);
  }
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  v27 = self->_obsoleteContainers;
  uint64_t v28 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v43 objects:v51 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v44 != v30) {
          objc_enumerationMutation(v27);
        }
        ((void (*)(void (**)(void), void))v25[2])(v25, *(void *)(*((void *)&v43 + 1) + 8 * i));
      }
      uint64_t v29 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v43 objects:v51 count:16];
    }
    while (v29);
  }

  currentSnapshot = self->_currentSnapshot;
  if (currentSnapshot) {
    v26[2](v26, currentSnapshot, 1);
  }
  previousSnapshot = self->_previousSnapshot;
  if (previousSnapshot) {
    v26[2](v26, previousSnapshot, 0);
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v34 = self->_obsoleteSnapshots;
  uint64_t v35 = [(NSMutableArray *)v34 countByEnumeratingWithState:&v39 objects:v50 count:16];
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = *(void *)v40;
    do
    {
      for (uint64_t j = 0; j != v36; ++j)
      {
        if (*(void *)v40 != v37) {
          objc_enumerationMutation(v34);
        }
        v26[2](v26, *(UIImageView **)(*((void *)&v39 + 1) + 8 * j), 0);
      }
      uint64_t v36 = [(NSMutableArray *)v34 countByEnumeratingWithState:&v39 objects:v50 count:16];
    }
    while (v36);
  }
}

void __50__PKPGSVTransitionInterstitialView_layoutSubviews__block_invoke(uint64_t a1, void *a2)
{
  double v3 = a2;
  int v4 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 409);
  objc_msgSend(v3, "pkui_setBounds:animated:", 0, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  objc_msgSend(v3, "pkui_setPosition:animated:", 0, *(double *)(a1 + 72), *(double *)(a1 + 80));
  double v5 = *(double **)(*(void *)(a1 + 32) + 456);
  if (v3)
  {
    double v7 = v3[51];
    double v6 = v3[52];
  }
  else
  {
    double v6 = 0.0;
    double v7 = 0.0;
  }
  if (v5 == v3)
  {
    double v11 = 1.0;
  }
  else
  {
    double v8 = fmax(*(double *)(a1 + 88), 0.0);
    double v9 = fmax(*(double *)(a1 + 96), 0.0);
    double v10 = 0.236067977;
    double v11 = 0.236067977;
    if (v8 > 0.0)
    {
      double v12 = fmax(v7, 0.0);
      double v11 = 0.0;
      if (v12 > 0.0) {
        double v11 = fmax(v8 / v12, 0.236067977);
      }
    }
    if (v9 > 0.0)
    {
      double v10 = 0.0;
      double v13 = fmax(v6, 0.0);
      if (v13 > 0.0) {
        double v10 = fmax(v9 / v13, 0.236067977);
      }
    }
    if (v11 <= 0.0 || v10 <= 0.0)
    {
      if (v11 <= 0.0)
      {
        if (v10 > 0.0) {
          double v11 = v10;
        }
        else {
          double v11 = 0.236067977;
        }
      }
    }
    else
    {
      double v11 = fmin(v11, v10);
    }
  }
  if ([v3 isHidden])
  {
    [v3 setHidden:0];
    if (v4)
    {
      uint64_t v14 = 96;
      if (v5 == v3) {
        uint64_t v14 = 112;
      }
      uint64_t v15 = 88;
      if (v5 == v3) {
        uint64_t v15 = 104;
      }
      double v16 = fmax(*(double *)(a1 + v15), 0.0);
      double v17 = fmax(*(double *)(a1 + v14), 0.0);
      double v18 = 0.236067977;
      double v19 = 0.236067977;
      if (v16 > 0.0)
      {
        double v20 = fmax(v7, 0.0);
        double v19 = 0.0;
        if (v20 > 0.0) {
          double v19 = fmax(v16 / v20, 0.236067977);
        }
      }
      if (v17 > 0.0)
      {
        double v18 = 0.0;
        double v21 = fmax(v6, 0.0);
        if (v21 > 0.0) {
          double v18 = fmax(v17 / v21, 0.236067977);
        }
      }
      if (v19 <= 0.0 || v18 <= 0.0)
      {
        if (v19 <= 0.0)
        {
          double v19 = 0.236067977;
          if (v18 > 0.0) {
            double v19 = v18;
          }
        }
      }
      else
      {
        double v19 = fmin(v19, v18);
      }
      CATransform3DMakeScale(&v38, v19, v19, 1.0);
      objc_msgSend(v3, "pkui_setTransform:animated:", &v38, 0);
      id v37 = 0;
      CATransform3DMakeScale(&v36, v11, v11, 1.0);
      goto LABEL_41;
    }
    id v37 = 0;
    CATransform3DMakeScale(&v36, v11, v11, 1.0);
LABEL_36:
    uint64_t v22 = 0;
    goto LABEL_42;
  }
  id v37 = 0;
  CATransform3DMakeScale(&v36, v11, v11, 1.0);
  if (!v4) {
    goto LABEL_36;
  }
LABEL_41:
  uint64_t v22 = *(void *)(a1 + 120);
LABEL_42:
  objc_msgSend(v3, "pkui_setTransform:withAdditiveAnimationFactory:animation:", &v36, v22, &v37);
  if (v37)
  {
    [v37 setHighFrameRateReason:2162689];
    LODWORD(v23) = 1117782016;
    LODWORD(v24) = 1123024896;
    LODWORD(v25) = 1123024896;
    objc_msgSend(v37, "setPreferredFrameRateRange:", v23, v24, v25);
    uint64_t v26 = -[PKPGSVTransitionInterstitialView _incrementAnimationCount](*(void **)(a1 + 32));
    id v27 = v37;
    uint64_t v31 = MEMORY[0x1E4F143A8];
    uint64_t v32 = 3221225472;
    v33 = __50__PKPGSVTransitionInterstitialView_layoutSubviews__block_invoke_2;
    uint64_t v34 = &unk_1E59CA9F8;
    id v35 = v26;
    id v28 = v26;
    objc_msgSend(v27, "pkui_setCompletionHandler:", &v31);
    uint64_t v29 = objc_msgSend(v3, "layer", v31, v32, v33, v34);
    id v30 = (id)objc_msgSend(v29, "pkui_addAdditiveAnimation:", v37);
  }
}

- (void)_incrementAnimationCount
{
  if (!a1) {
    return 0;
  }
  ++a1[52];
  -[PKPGSVTransitionInterstitialView _updateActive]((uint64_t)a1);
  objc_initWeak(&location, a1);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__PKPGSVTransitionInterstitialView__incrementAnimationCount__block_invoke;
  aBlock[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v16, &location);
  uint64_t v2 = _Block_copy(aBlock);
  id v3 = objc_alloc(MEMORY[0x1E4F84630]);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __60__PKPGSVTransitionInterstitialView__incrementAnimationCount__block_invoke_2;
  v13[3] = &unk_1E59CAA98;
  id v4 = v2;
  id v14 = v4;
  double v5 = (void *)[v3 initWithBlock:v13];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __60__PKPGSVTransitionInterstitialView__incrementAnimationCount__block_invoke_3;
  v10[3] = &unk_1E59CAD18;
  id v11 = v5;
  id v12 = v4;
  id v6 = v4;
  id v7 = v5;
  double v8 = _Block_copy(v10);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
  return v8;
}

uint64_t __50__PKPGSVTransitionInterstitialView_layoutSubviews__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __50__PKPGSVTransitionInterstitialView_layoutSubviews__block_invoke_3(uint64_t a1, void *a2, unsigned int a3)
{
  id v5 = a2;
  if ([v5 isHidden]) {
    [v5 setHidden:0];
  }
  [v5 anchorPoint];
  double v7 = v6;
  double v9 = v8;
  [v5 bounds];
  double v11 = v10;
  double v13 = v12;
  [v5 alignmentRectInsets];
  objc_msgSend(v5, "pkui_setPosition:animated:", 0, *(double *)(a1 + 40) + (*(double *)(a1 + 56) - (v11 - (v14 + v15))) * 0.5 - v14 + v7 * v11, *(double *)(a1 + 48) + (*(double *)(a1 + 64) - (v13 - (v16 + v17))) * 0.5 - v16 + v9 * v13);
  int v18 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 409);
  double v19 = [v5 layer];
  id v42 = 0;
  if (v18) {
    uint64_t v20 = *(void *)(a1 + 72);
  }
  else {
    uint64_t v20 = 0;
  }
  objc_msgSend(v5, "pkui_setAlpha:withAnimationFactory:animation:", v20, &v42, (double)a3);
  if (v42 || v21 != (double)a3)
  {
    if (v42) {
      uint64_t v22 = -[PKPGSVTransitionInterstitialView _incrementAnimationCount](*(void **)(a1 + 32));
    }
    else {
      uint64_t v22 = 0;
    }
    [v19 removeAnimationForKey:@"opacity"];
    id v23 = v42;
    if (v42)
    {
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __50__PKPGSVTransitionInterstitialView_layoutSubviews__block_invoke_4;
      v40[3] = &unk_1E59CA9F8;
      id v41 = v22;
      objc_msgSend(v23, "pkui_setCompletionHandler:", v40);
      [v19 addAnimation:v42 forKey:@"opacity"];
    }
  }
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 408)) {
    goto LABEL_32;
  }
  if (a3) {
    double v24 = 0.0;
  }
  else {
    double v24 = 8.33333333;
  }
  if (v18) {
    double v25 = *(void **)(a1 + 72);
  }
  else {
    double v25 = 0;
  }
  id v26 = v19;
  id v27 = v25;
  if (v26)
  {
    id v28 = v27;
    uint64_t v29 = [v26 valueForKeyPath:@"filters.gaussianBlur.inputRadius"];
    id v30 = v29;
    if (v29)
    {
      [v29 doubleValue];
      double v32 = v31;
    }
    else
    {
      double v32 = 0.0;
    }
    if (v32 == v24
      || ([NSNumber numberWithDouble:v24],
          uint64_t v34 = objc_claimAutoreleasedReturnValue(),
          [v26 setValue:v34 forKeyPath:@"filters.gaussianBlur.inputRadius"],
          v34,
          !v28))
    {
      v33 = 0;
    }
    else
    {
      v33 = [v28 springAnimationWithKeyPath:@"filters.gaussianBlur.inputRadius"];
      objc_msgSend(v33, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", v32, v24);
    }

    if (v33)
    {
      id v35 = -[PKPGSVTransitionInterstitialView _incrementAnimationCount](*(void **)(a1 + 32));
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __50__PKPGSVTransitionInterstitialView_layoutSubviews__block_invoke_5;
      v38[3] = &unk_1E59CA9F8;
      id v39 = v35;
      id v36 = v35;
      objc_msgSend(v33, "pkui_setCompletionHandler:", v38);
      id v37 = (id)objc_msgSend(v26, "pkui_addAdditiveAnimation:", v33);
    }
LABEL_32:

    return;
  }
  __break(1u);
}

uint64_t __50__PKPGSVTransitionInterstitialView_layoutSubviews__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __50__PKPGSVTransitionInterstitialView_layoutSubviews__block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_pruneObsoleteSnapshots
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (!*(unsigned char *)(a1 + 412))
  {
    if ([*(id *)(a1 + 512) count])
    {
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v2 = *(id *)(a1 + 512);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v26 objects:v32 count:16];
      if (v3)
      {
        uint64_t v4 = v3;
        uint64_t v5 = *(void *)v27;
        do
        {
          uint64_t v6 = 0;
          do
          {
            if (*(void *)v27 != v5) {
              objc_enumerationMutation(v2);
            }
            [*(id *)(*((void *)&v26 + 1) + 8 * v6++) removeFromSuperview];
          }
          while (v4 != v6);
          uint64_t v4 = [v2 countByEnumeratingWithState:&v26 objects:v32 count:16];
        }
        while (v4);
      }

      [*(id *)(a1 + 512) removeAllObjects];
    }
    if ([*(id *)(a1 + 520) count])
    {
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v7 = *(id *)(a1 + 520);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v31 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v23;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v23 != v10) {
              objc_enumerationMutation(v7);
            }
            [*(id *)(*((void *)&v22 + 1) + 8 * v11++) removeFromSuperview];
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v31 count:16];
        }
        while (v9);
      }

      [*(id *)(a1 + 520) removeAllObjects];
    }
    if ([*(id *)(a1 + 528) count])
    {
      double v12 = (void *)[*(id *)(a1 + 528) copy];
      [*(id *)(a1 + 528) removeAllObjects];
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v13 = v12;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v30 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v19;
        do
        {
          uint64_t v17 = 0;
          do
          {
            if (*(void *)v19 != v16) {
              objc_enumerationMutation(v13);
            }
            (*(void (**)(void))(*(void *)(*((void *)&v18 + 1) + 8 * v17) + 16))(*(void *)(*((void *)&v18 + 1) + 8 * v17));
            ++v17;
          }
          while (v15 != v17);
          uint64_t v15 = [v13 countByEnumeratingWithState:&v18 objects:v30 count:16];
        }
        while (v15);
      }
    }
  }
}

- (void)_swapItemsAnimated:(uint64_t)a1
{
  if (!*(unsigned char *)(a1 + 413))
  {
    [(id)a1 layoutIfNeeded];
    id v2 = *(id *)(a1 + 480);
    objc_storeStrong((id *)(a1 + 480), *(id *)(a1 + 448));
    uint64_t v3 = *(void **)(a1 + 448);
    *(void *)(a1 + 448) = v2;
    id v15 = v2;

    id v4 = *(id *)(a1 + 488);
    objc_storeStrong((id *)(a1 + 488), *(id *)(a1 + 456));
    uint64_t v5 = *(void **)(a1 + 456);
    *(void *)(a1 + 456) = v4;
    id v6 = v4;

    id v7 = *(id *)(a1 + 496);
    objc_storeStrong((id *)(a1 + 496), *(id *)(a1 + 464));
    uint64_t v8 = *(void **)(a1 + 464);
    *(void *)(a1 + 464) = v7;
    id v9 = v7;

    uint64_t v10 = _Block_copy(*(const void **)(a1 + 504));
    uint64_t v11 = _Block_copy(*(const void **)(a1 + 472));
    double v12 = *(void **)(a1 + 504);
    *(void *)(a1 + 504) = v11;

    id v13 = _Block_copy(v10);
    uint64_t v14 = *(void **)(a1 + 472);
    *(void *)(a1 + 472) = v13;

    [(id)a1 setNeedsLayout];
    *(unsigned char *)(a1 + 409) = 1;
    [(id)a1 layoutIfNeeded];
    *(unsigned char *)(a1 + 409) = 0;
  }
}

void __83__PKPGSVTransitionInterstitialView__setCurrentItem_withDefaultSize_force_animated___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [v5 bounds];
  double v8 = v7;
  double v10 = v9;
  [v5 alignmentRectInsets];
  double v13 = v8 - (v11 + v12);
  double v16 = v10 - (v14 + v15);
  uint64_t v17 = *(void *)(*(void *)(a1 + 32) + 456);
  if (v17)
  {
    long long v18 = (double *)(v17 + 408);
    *long long v18 = v13;
    v18[1] = v16;
  }
  else
  {
    long long v19 = [(double *)[PKPGSVTransitionInterstitialSnapshotContainerView alloc] initWithSnapshotSize:v16];
    uint64_t v20 = *(void *)(a1 + 32);
    long long v21 = *(void **)(v20 + 456);
    *(void *)(v20 + 456) = v19;

    long long v22 = *(void **)(a1 + 32);
    long long v23 = (void *)v22[57];
    [v22 anchorPoint];
    objc_msgSend(v23, "setAnchorPoint:");
    [*(id *)(*(void *)(a1 + 32) + 456) setHidden:1];
    [*(id *)(a1 + 32) addSubview:*(void *)(*(void *)(a1 + 32) + 456)];
  }
  [*(id *)(*(void *)(a1 + 32) + 456) addSubview:v5];
  uint64_t v24 = *(void *)(a1 + 32);
  long long v25 = *(void **)(v24 + 464);
  *(void *)(v24 + 464) = v5;
  id v29 = v5;

  long long v26 = _Block_copy(v6);
  uint64_t v27 = *(void *)(a1 + 32);
  long long v28 = *(void **)(v27 + 472);
  *(void *)(v27 + 472) = v26;
}

void __84__PKPGSVTransitionInterstitialView__setPreviousItem_withDefaultSize_force_animated___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [v5 bounds];
  double v8 = v7;
  double v10 = v9;
  [v5 alignmentRectInsets];
  double v13 = v8 - (v11 + v12);
  double v16 = v10 - (v14 + v15);
  uint64_t v17 = *(void *)(*(void *)(a1 + 32) + 488);
  if (v17)
  {
    long long v18 = (double *)(v17 + 408);
    *long long v18 = v13;
    v18[1] = v16;
  }
  else
  {
    long long v19 = [(double *)[PKPGSVTransitionInterstitialSnapshotContainerView alloc] initWithSnapshotSize:v16];
    uint64_t v20 = *(void *)(a1 + 32);
    long long v21 = *(void **)(v20 + 488);
    *(void *)(v20 + 488) = v19;

    long long v22 = *(void **)(a1 + 32);
    long long v23 = (void *)v22[61];
    [v22 anchorPoint];
    objc_msgSend(v23, "setAnchorPoint:");
    [*(id *)(*(void *)(a1 + 32) + 488) setHidden:1];
    uint64_t v24 = *(void **)(a1 + 32);
    uint64_t v25 = v24[61];
    if (v24[57]) {
      objc_msgSend(v24, "insertSubview:belowSubview:", v25);
    }
    else {
      [v24 addSubview:v25];
    }
  }
  [*(id *)(*(void *)(a1 + 32) + 488) addSubview:v5];
  uint64_t v26 = *(void *)(a1 + 32);
  uint64_t v27 = *(void **)(v26 + 496);
  *(void *)(v26 + 496) = v5;
  id v31 = v5;

  long long v28 = _Block_copy(v6);
  uint64_t v29 = *(void *)(a1 + 32);
  id v30 = *(void **)(v29 + 504);
  *(void *)(v29 + 504) = v28;
}

- (void)_setPosition:(uint64_t)a1 animated:(int)a2
{
  uint64_t v3 = 0;
  id v17 = 0;
  *(unsigned char *)(a1 + 411) = 1;
  if (a2) {
    uint64_t v3 = *(void *)(a1 + 424);
  }
  objc_msgSend((id)a1, "pkui_setPosition:withAdditiveAnimationFactory:animation:", v3, &v17);
  if (v17)
  {
    [v17 setHighFrameRateReason:2162689];
    LODWORD(v4) = 1117782016;
    LODWORD(v5) = 1123024896;
    LODWORD(v6) = 1123024896;
    objc_msgSend(v17, "setPreferredFrameRateRange:", v4, v5, v6);
    double v7 = -[PKPGSVTransitionInterstitialView _incrementAnimationCount]((void *)a1);
    id v8 = v17;
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    double v14 = __58__PKPGSVTransitionInterstitialView__setPosition_animated___block_invoke;
    double v15 = &unk_1E59CA9F8;
    id v16 = v7;
    id v9 = v7;
    objc_msgSend(v8, "pkui_setCompletionHandler:", &v12);
    double v10 = objc_msgSend((id)a1, "layer", v12, v13, v14, v15);
    id v11 = (id)objc_msgSend(v10, "pkui_addAdditiveAnimation:", v17);
  }
}

uint64_t __58__PKPGSVTransitionInterstitialView__setPosition_animated___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __64__PKPGSVTransitionInterstitialView__setContainerAlpha_animated___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __51__PKPGSVTransitionInterstitialView_transferToView___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (CGFloat)resolveIndeterminatePositionWithPriorItemFrame:(CGFloat)a3 animated:(CGFloat)a4
{
  if (!a1) {
    return 0.0;
  }
  [(id)a1 bounds];
  double v13 = v12;
  [(id)a1 anchorPoint];
  double v15 = v14;
  if (*(void *)(a1 + 448))
  {
    [(id)a1 center];
    uint64_t v17 = *(void *)(a1 + 456);
    if (v17) {
      double v18 = *(double *)(v17 + 408);
    }
    else {
      double v18 = 0.0;
    }
    return v16 - v15 * v13 + (v13 - v18) * 0.5;
  }
  else
  {
    v21.origin.double x = a3;
    v21.origin.double y = a4;
    v21.size.width = a5;
    v21.size.CGFloat height = a6;
    if (!CGRectIsNull(v21))
    {
      if (a2) {
        BOOL v19 = *(unsigned char *)(a1 + 411) != 0;
      }
      else {
        BOOL v19 = 0;
      }
      -[PKPGSVTransitionInterstitialView _setPosition:animated:](a1, v19);
    }
  }
  return a3;
}

- (double)pushItem:(double)a3 withDefaultSize:(double)a4 containerAlpha:(double)a5
{
  id v9 = a2;
  if (!a1)
  {
    a3 = 0.0;
    goto LABEL_14;
  }
  -[PKPGSVTransitionInterstitialView _setContainerAlpha:animated:]((void *)a1, 1, a5);
  id v10 = v9;
  id v11 = v10;
  if (!*(unsigned char *)(a1 + 413))
  {
    if (!v10) {
      goto LABEL_6;
    }
    if (*(id *)(a1 + 448) != v10)
    {
      if (*(id *)(a1 + 480) != v10)
      {
LABEL_6:
        [(PKPGSVTransitionInterstitialView *)a1 _setPreviousItem:1 withDefaultSize:1 force:a3 animated:a4];
        -[PKPGSVTransitionInterstitialView _swapItemsAnimated:](a1);
        -[PKPGSVTransitionInterstitialView _pruneObsoleteSnapshots](a1);
        if (!*(void *)(a1 + 448)) {
          goto LABEL_12;
        }
        uint64_t v12 = *(void *)(a1 + 456);
        if (!v12)
        {
          a3 = 0.0;
          goto LABEL_12;
        }
        goto LABEL_11;
      }
      -[PKPGSVTransitionInterstitialView _swapItemsAnimated:](a1);
    }
    uint64_t v12 = *(void *)(a1 + 456);
    if (!v12)
    {

      a3 = 0.0;
      goto LABEL_13;
    }
LABEL_11:
    a3 = *(double *)(v12 + 408);
  }
LABEL_12:

  if (v11) {
LABEL_13:
  }
    -[PKPGSVTransitionInterstitialView _updatePositionAnimated:](a1, 1);
LABEL_14:

  return a3;
}

- (double)updateCurrentItem:(double)a3 withDefaultSize:(double)a4 containerAlpha:(double)a5
{
  if (!a1) {
    return 0.0;
  }
  double v8 = [(PKPGSVTransitionInterstitialView *)(uint64_t)a1 _setCurrentItem:0 withDefaultSize:1 force:a3 animated:a4];
  if (a2) {
    -[PKPGSVTransitionInterstitialView _updatePositionAnimated:]((uint64_t)a1, 1);
  }
  -[PKPGSVTransitionInterstitialView _setContainerAlpha:animated:](a1, 1, a5);
  return v8;
}

void __60__PKPGSVTransitionInterstitialView__incrementAnimationCount__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    --WeakRetained[52];
    id v2 = WeakRetained;
    -[PKPGSVTransitionInterstitialView _updateActive]((uint64_t)WeakRetained);
    WeakRetained = v2;
  }
}

uint64_t __60__PKPGSVTransitionInterstitialView__incrementAnimationCount__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __60__PKPGSVTransitionInterstitialView__incrementAnimationCount__block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) invalidate];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_obsoleteCompletions, 0);
  objc_storeStrong((id *)&self->_obsoleteSnapshots, 0);
  objc_storeStrong((id *)&self->_obsoleteContainers, 0);
  objc_storeStrong(&self->_previousSnapshotCompletion, 0);
  objc_storeStrong((id *)&self->_previousSnapshot, 0);
  objc_storeStrong((id *)&self->_previousContainer, 0);
  objc_storeStrong((id *)&self->_previousItem, 0);
  objc_storeStrong(&self->_currentSnapshotCompletion, 0);
  objc_storeStrong((id *)&self->_currentSnapshot, 0);
  objc_storeStrong((id *)&self->_currentContainer, 0);
  objc_storeStrong((id *)&self->_currentItem, 0);
  objc_storeStrong(&self->_activation, 0);
  objc_storeStrong((id *)&self->_dismissalSpringFactory, 0);

  objc_storeStrong((id *)&self->_springFactory, 0);
}

@end