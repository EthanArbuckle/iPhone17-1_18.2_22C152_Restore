@interface PXFloatingCardGestureCoordinator
- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)isDragging;
- (CGPoint)centerPointForPosition:(unint64_t)a3;
- (CGPoint)previousPanTranslation;
- (PXFloatingCardAnimationManager)animationManager;
- (PXFloatingCardGestureCoordinator)initWithCardViewController:(id)a3 layout:(id)a4;
- (PXFloatingCardGestureCoordinatorDelegate)delegate;
- (PXFloatingCardLayout)layout;
- (PXFloatingCardViewController)cardViewController;
- (UIPanGestureRecognizer)heightGestureRecognizer;
- (UIPanGestureRecognizer)positionGestureRecognizer;
- (double)applyRubberBandToValue:(double)a3 withRange:(double)a4;
- (double)bottomRubberBandRange;
- (double)closestHeightForProjectedHeight:(double)a3;
- (double)heightForRubberBandHeight:(double)a3;
- (double)maximumHeight;
- (double)minimumHeight;
- (double)projectionWithVelocity:(double)a3 decelerationRate:(double)a4;
- (double)rubberBandHeightForHeight:(double)a3;
- (double)topRubberBandRange;
- (double)unapplyRubberBandToValue:(double)a3 withRange:(double)a4;
- (unint64_t)closestPositionToProjectedCenter:(CGPoint)a3;
- (void)_addGestureRecognizers;
- (void)_handlePositionGestureEnded:(CGPoint)a3;
- (void)_removeGestureRecognizers;
- (void)dealloc;
- (void)dragBegan;
- (void)dragChangedWithVerticalDelta:(double)a3;
- (void)dragEndedWithAnimation:(id)a3;
- (void)handleHeightGesture:(id)a3;
- (void)handlePositionGesture:(id)a3;
- (void)layoutDidChange;
- (void)setAnimationManager:(id)a3;
- (void)setBottomRubberBandRange:(double)a3;
- (void)setCardViewController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHeightGestureRecognizer:(id)a3;
- (void)setIsDragging:(BOOL)a3;
- (void)setLayout:(id)a3;
- (void)setPositionGestureRecognizer:(id)a3;
- (void)setPreviousPanTranslation:(CGPoint)a3;
- (void)setTopRubberBandRange:(double)a3;
- (void)snapToHeight:(double)a3;
- (void)updateCardHeightConstraintWithHeight:(double)a3;
@end

@implementation PXFloatingCardGestureCoordinator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heightGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_positionGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_animationManager, 0);
  objc_destroyWeak((id *)&self->_cardViewController);
  objc_destroyWeak((id *)&self->_layout);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setBottomRubberBandRange:(double)a3
{
  self->_bottomRubberBandRange = a3;
}

- (double)bottomRubberBandRange
{
  return self->_bottomRubberBandRange;
}

- (void)setTopRubberBandRange:(double)a3
{
  self->_topRubberBandRange = a3;
}

- (double)topRubberBandRange
{
  return self->_topRubberBandRange;
}

- (void)setPreviousPanTranslation:(CGPoint)a3
{
  self->_previousPanTranslation = a3;
}

- (CGPoint)previousPanTranslation
{
  double x = self->_previousPanTranslation.x;
  double y = self->_previousPanTranslation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setHeightGestureRecognizer:(id)a3
{
}

- (UIPanGestureRecognizer)heightGestureRecognizer
{
  return self->_heightGestureRecognizer;
}

- (void)setPositionGestureRecognizer:(id)a3
{
}

- (UIPanGestureRecognizer)positionGestureRecognizer
{
  return self->_positionGestureRecognizer;
}

- (void)setAnimationManager:(id)a3
{
}

- (PXFloatingCardAnimationManager)animationManager
{
  return self->_animationManager;
}

- (void)setCardViewController:(id)a3
{
}

- (PXFloatingCardViewController)cardViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cardViewController);
  return (PXFloatingCardViewController *)WeakRetained;
}

- (void)setIsDragging:(BOOL)a3
{
  self->_isDragging = a3;
}

- (BOOL)isDragging
{
  return self->_isDragging;
}

- (void)setLayout:(id)a3
{
}

- (PXFloatingCardLayout)layout
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layout);
  return (PXFloatingCardLayout *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PXFloatingCardGestureCoordinatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXFloatingCardGestureCoordinatorDelegate *)WeakRetained;
}

- (double)heightForRubberBandHeight:(double)a3
{
  [(PXFloatingCardGestureCoordinator *)self minimumHeight];
  double v6 = v5;
  [(PXFloatingCardGestureCoordinator *)self maximumHeight];
  if (v7 >= a3)
  {
    if (v6 > a3)
    {
      [(PXFloatingCardGestureCoordinator *)self topRubberBandRange];
      [(PXFloatingCardGestureCoordinator *)self unapplyRubberBandToValue:v6 - a3 withRange:v12];
      return v6 - v13;
    }
  }
  else
  {
    double v8 = v7;
    double v9 = a3 - v7;
    [(PXFloatingCardGestureCoordinator *)self bottomRubberBandRange];
    [(PXFloatingCardGestureCoordinator *)self unapplyRubberBandToValue:v9 withRange:v10];
    return v8 + v11;
  }
  return a3;
}

- (double)rubberBandHeightForHeight:(double)a3
{
  [(PXFloatingCardGestureCoordinator *)self minimumHeight];
  double v6 = v5;
  [(PXFloatingCardGestureCoordinator *)self maximumHeight];
  if (v7 >= a3)
  {
    if (v6 > a3)
    {
      [(PXFloatingCardGestureCoordinator *)self topRubberBandRange];
      [(PXFloatingCardGestureCoordinator *)self applyRubberBandToValue:v6 - a3 withRange:v12];
      return v6 - v13;
    }
  }
  else
  {
    double v8 = v7;
    double v9 = a3 - v7;
    [(PXFloatingCardGestureCoordinator *)self bottomRubberBandRange];
    [(PXFloatingCardGestureCoordinator *)self applyRubberBandToValue:v9 withRange:v10];
    return v8 + v11;
  }
  return a3;
}

- (double)unapplyRubberBandToValue:(double)a3 withRange:(double)a4
{
  double v4 = (a4 - a3) * 0.550000012;
  double v5 = 0.0;
  if (fabs(v4) >= 2.22044605e-16) {
    return a3 * a4 / v4;
  }
  return v5;
}

- (double)applyRubberBandToValue:(double)a3 withRange:(double)a4
{
  double v4 = a4 + a3 * 0.550000012;
  double v5 = 0.0;
  if (fabs(v4) >= 2.22044605e-16) {
    return a4 * 0.550000012 * a3 / v4;
  }
  return v5;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PXFloatingCardGestureCoordinator *)self heightGestureRecognizer];
  if (v8 != v6)
  {

LABEL_6:
    BOOL v14 = 0;
    goto LABEL_7;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    goto LABEL_6;
  }
  double v10 = [v7 view];
  double v11 = [(PXFloatingCardGestureCoordinator *)self cardViewController];
  double v12 = [v11 view];
  char v13 = [v10 isDescendantOfView:v12];

  if ((v13 & 1) == 0) {
    goto LABEL_6;
  }
  BOOL v14 = 1;
LABEL_7:

  return v14;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PXFloatingCardGestureCoordinator *)self heightGestureRecognizer];

  if (v8 == v7)
  {
    double v10 = [(PXFloatingCardGestureCoordinator *)self cardViewController];
    [v10 grabAreaBounds];
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    v19 = [(PXFloatingCardGestureCoordinator *)self cardViewController];
    v20 = [v19 backgroundView];
    [v6 locationInView:v20];
    v24.double x = v21;
    v24.double y = v22;
    v25.origin.double x = v12;
    v25.origin.double y = v14;
    v25.size.width = v16;
    v25.size.height = v18;
    BOOL v9 = CGRectContainsPoint(v25, v24);
  }
  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

- (void)handleHeightGesture:(id)a3
{
  id v16 = a3;
  uint64_t v4 = [v16 state];
  if ((unint64_t)(v4 - 3) >= 3)
  {
    if (v4 == 2)
    {
      id v8 = [(PXFloatingCardGestureCoordinator *)self cardViewController];
      BOOL v9 = [v8 view];
      [v16 translationInView:v9];
      double v11 = v10;
      double v13 = v12;

      [(PXFloatingCardGestureCoordinator *)self previousPanTranslation];
      double v15 = v14 - v13;
      -[PXFloatingCardGestureCoordinator setPreviousPanTranslation:](self, "setPreviousPanTranslation:", v11, v13);
      [(PXFloatingCardGestureCoordinator *)self dragChangedWithVerticalDelta:-v15];
    }
    else if (v4 == 1)
    {
      [(PXFloatingCardGestureCoordinator *)self dragBegan];
      double v5 = [(PXFloatingCardGestureCoordinator *)self cardViewController];
      id v6 = [v5 view];
      id v7 = [v6 layer];
      [v7 removeAllAnimations];

      -[PXFloatingCardGestureCoordinator setPreviousPanTranslation:](self, "setPreviousPanTranslation:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
    }
  }
  else
  {
    [(PXFloatingCardGestureCoordinator *)self dragEndedWithAnimation:0];
  }
}

- (unint64_t)closestPositionToProjectedCenter:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v5 = [(PXFloatingCardGestureCoordinator *)self cardViewController];
  id v6 = [v5 view];

  id v7 = [v6 superview];
  id v8 = [v7 safeAreaLayoutGuide];
  [v8 layoutFrame];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;

  v23.origin.double x = v10;
  v23.origin.double y = v12;
  v23.size.width = v14;
  v23.size.height = v16;
  double MidX = CGRectGetMidX(v23);
  v24.origin.double x = v10;
  v24.origin.double y = v12;
  v24.size.width = v14;
  v24.size.height = v16;
  double MidY = CGRectGetMidY(v24);
  uint64_t v19 = 4;
  if (y < MidY) {
    uint64_t v19 = 2;
  }
  uint64_t v20 = 3;
  if (y < MidY) {
    uint64_t v20 = 1;
  }
  if (x >= MidX) {
    unint64_t v21 = v19;
  }
  else {
    unint64_t v21 = v20;
  }

  return v21;
}

- (CGPoint)centerPointForPosition:(unint64_t)a3
{
  double v5 = [(PXFloatingCardGestureCoordinator *)self cardViewController];
  id v6 = [v5 view];

  [v6 bounds];
  double v36 = v8;
  double v37 = v7;
  double v9 = [v6 superview];
  CGFloat v10 = [v9 safeAreaLayoutGuide];
  [v10 layoutFrame];
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;

  v39.origin.double x = v12;
  v39.origin.double y = v14;
  v39.size.width = v16;
  v39.size.height = v18;
  double MaxX = CGRectGetMaxX(v39);
  v40.origin.double x = v12;
  v40.origin.double y = v14;
  v40.size.width = v16;
  v40.size.height = v18;
  double MinX = CGRectGetMinX(v40);
  v41.origin.double x = v12;
  v41.origin.double y = v14;
  v41.size.width = v16;
  v41.size.height = v18;
  double MaxY = CGRectGetMaxY(v41);
  v42.origin.double x = v12;
  v42.origin.double y = v14;
  v42.size.width = v16;
  v42.size.height = v18;
  double MinY = CGRectGetMinY(v42);
  CGRect v23 = [(PXFloatingCardGestureCoordinator *)self layout];
  [v23 insets];
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;

  double v32 = v37 * 0.5;
  double v33 = v36 * 0.5;
  switch(a3)
  {
    case 0uLL:
    case 2uLL:
      double v27 = MaxX - v31 - v32;
      goto LABEL_4;
    case 1uLL:
      double v27 = v32 + MinX + v27;
LABEL_4:
      double v31 = v33 + MinY + v25;
      break;
    case 3uLL:
      double v27 = v32 + MinX + v27;
      goto LABEL_7;
    case 4uLL:
      double v27 = MaxX - v31 - v32;
LABEL_7:
      double v31 = MaxY - v29 - v33;
      break;
    default:
      break;
  }

  double v34 = v27;
  double v35 = v31;
  result.double y = v35;
  result.double x = v34;
  return result;
}

- (void)_handlePositionGestureEnded:(CGPoint)a3
{
  unint64_t v4 = -[PXFloatingCardGestureCoordinator closestPositionToProjectedCenter:](self, "closestPositionToProjectedCenter:", a3.x, a3.y);
  [(PXFloatingCardGestureCoordinator *)self centerPointForPosition:v4];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__PXFloatingCardGestureCoordinator__handlePositionGestureEnded___block_invoke;
  v8[3] = &unk_1E5DD35E0;
  v8[4] = self;
  v8[5] = v5;
  v8[6] = v6;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__PXFloatingCardGestureCoordinator__handlePositionGestureEnded___block_invoke_2;
  v7[3] = &unk_1E5DCEB50;
  v7[4] = self;
  v7[5] = v4;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:0x10000 delay:v8 usingSpringWithDamping:v7 initialSpringVelocity:0.3 options:0.0 animations:1.0 completion:1.0];
}

void __64__PXFloatingCardGestureCoordinator__handlePositionGestureEnded___block_invoke(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  double v2 = *(double *)(a1 + 48);
  id v4 = [*(id *)(a1 + 32) cardViewController];
  v3 = [v4 view];
  objc_msgSend(v3, "setCenter:", v1, v2);
}

void __64__PXFloatingCardGestureCoordinator__handlePositionGestureEnded___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    v3 = [*(id *)(a1 + 32) cardViewController];
    [v4 cardViewController:v3 didUpdatePosition:*(void *)(a1 + 40)];
  }
}

- (double)projectionWithVelocity:(double)a3 decelerationRate:(double)a4
{
  return a3 / 1000.0 * a4 / (1.0 - a4);
}

- (void)handlePositionGesture:(id)a3
{
  id v27 = a3;
  uint64_t v4 = [v27 state];
  if ((unint64_t)(v4 - 3) >= 3)
  {
    if ((unint64_t)(v4 - 1) > 1) {
      goto LABEL_6;
    }
    uint64_t v20 = [(PXFloatingCardGestureCoordinator *)self cardViewController];
    uint64_t v6 = [v20 view];

    double v7 = [v6 superview];
    [v27 translationInView:v7];
    double v22 = v21;
    double v24 = v23;
    [v6 center];
    objc_msgSend(v6, "setCenter:", v22 + v25, v24 + v26);
    objc_msgSend(v27, "setTranslation:inView:", v7, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  }
  else
  {
    uint64_t v5 = [(PXFloatingCardGestureCoordinator *)self cardViewController];
    uint64_t v6 = [v5 view];

    double v7 = [v6 superview];
    [v27 velocityInView:v7];
    double v9 = v8;
    double v11 = v10;
    double v12 = *MEMORY[0x1E4FB2EF0];
    [v6 center];
    double v14 = v13;
    [(PXFloatingCardGestureCoordinator *)self projectionWithVelocity:v9 decelerationRate:v12];
    double v16 = v14 + v15;
    [v6 center];
    double v18 = v17;
    [(PXFloatingCardGestureCoordinator *)self projectionWithVelocity:v11 decelerationRate:v12];
    -[PXFloatingCardGestureCoordinator _handlePositionGestureEnded:](self, "_handlePositionGestureEnded:", v16, v18 + v19);
  }

LABEL_6:
}

- (double)maximumHeight
{
  v3 = [(PXFloatingCardGestureCoordinator *)self layout];
  uint64_t v4 = [v3 snappableHeights];
  uint64_t v5 = [v4 count];

  if (!v5) {
    return 0.0;
  }
  uint64_t v6 = [(PXFloatingCardGestureCoordinator *)self layout];
  double v7 = [v6 snappableHeights];
  double v8 = [v7 lastObject];
  [v8 floatValue];
  double v10 = v9;

  return v10;
}

- (double)minimumHeight
{
  v3 = [(PXFloatingCardGestureCoordinator *)self layout];
  uint64_t v4 = [v3 snappableHeights];
  uint64_t v5 = [v4 count];

  if (!v5) {
    return 0.0;
  }
  uint64_t v6 = [(PXFloatingCardGestureCoordinator *)self layout];
  double v7 = [v6 snappableHeights];
  double v8 = [v7 firstObject];
  [v8 floatValue];
  double v10 = v9;

  return v10;
}

- (void)snapToHeight:(double)a3
{
  uint64_t v5 = [(PXFloatingCardGestureCoordinator *)self animationManager];
  uint64_t v6 = [v5 heightAnimation];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__PXFloatingCardGestureCoordinator_snapToHeight___block_invoke;
  v8[3] = &unk_1E5DD08D8;
  v8[4] = self;
  *(double *)&v8[5] = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__PXFloatingCardGestureCoordinator_snapToHeight___block_invoke_2;
  v7[3] = &unk_1E5DCEB50;
  v7[4] = self;
  *(double *)&v7[5] = a3;
  [v6 applyAnimations:v8 completion:v7];
}

void __49__PXFloatingCardGestureCoordinator_snapToHeight___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) updateCardHeightConstraintWithHeight:*(double *)(a1 + 40)];
  double v2 = [*(id *)(a1 + 32) cardViewController];
  v3 = [v2 view];
  [v3 updateConstraintsIfNeeded];

  id v6 = [*(id *)(a1 + 32) cardViewController];
  uint64_t v4 = [v6 view];
  uint64_t v5 = [v4 superview];
  [v5 layoutIfNeeded];
}

void __49__PXFloatingCardGestureCoordinator_snapToHeight___block_invoke_2(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) delegate];
  double v2 = [*(id *)(a1 + 32) cardViewController];
  [v3 cardViewController:v2 didUpdateHeight:*(double *)(a1 + 40)];
}

- (void)updateCardHeightConstraintWithHeight:(double)a3
{
  uint64_t v5 = [(PXFloatingCardGestureCoordinator *)self cardViewController];
  [v5 size];
  double v7 = v6;

  if (v7 != a3)
  {
    [(PXFloatingCardGestureCoordinator *)self maximumHeight];
    double v9 = v8;
    [(PXFloatingCardGestureCoordinator *)self minimumHeight];
    double v11 = v10;
    double v12 = [(PXFloatingCardGestureCoordinator *)self cardViewController];
    [v12 size];
    double v14 = v13;

    if (v11 > a3 || v9 < a3)
    {
      if (v11 <= a3)
      {
        if (v9 >= a3) {
          return;
        }
        [(PXFloatingCardGestureCoordinator *)self heightForRubberBandHeight:a3];
        if (v16 <= a3) {
          a3 = v16;
        }
        if (![(PXFloatingCardGestureCoordinator *)self isDragging]) {
          a3 = v9;
        }
      }
      else
      {
        [(PXFloatingCardGestureCoordinator *)self heightForRubberBandHeight:a3];
        if (v15 > a3) {
          a3 = v15;
        }
        if (![(PXFloatingCardGestureCoordinator *)self isDragging]) {
          a3 = v11;
        }
      }
    }
    id v17 = [(PXFloatingCardGestureCoordinator *)self cardViewController];
    objc_msgSend(v17, "setSize:", v14, a3);
  }
}

- (double)closestHeightForProjectedHeight:(double)a3
{
  uint64_t v4 = [(PXFloatingCardGestureCoordinator *)self layout];
  uint64_t v5 = [v4 snappableHeights];

  if ([v5 count])
  {
    uint64_t v13 = 0;
    double v14 = (double *)&v13;
    uint64_t v15 = 0x2020000000;
    double v16 = 0.0;
    double v6 = [v5 firstObject];
    [v6 floatValue];
    double v8 = v7;

    double v16 = v8;
    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x2020000000;
    v12[3] = 0x7FEFFFFFFFFFFFFFLL;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __68__PXFloatingCardGestureCoordinator_closestHeightForProjectedHeight___block_invoke;
    v11[3] = &unk_1E5DC27E8;
    *(double *)&v11[6] = a3;
    v11[4] = v12;
    v11[5] = &v13;
    [v5 enumerateObjectsUsingBlock:v11];
    double v9 = v14[3];
    _Block_object_dispose(v12, 8);
    _Block_object_dispose(&v13, 8);
  }
  else
  {
    double v9 = 0.0;
  }

  return v9;
}

uint64_t __68__PXFloatingCardGestureCoordinator_closestHeightForProjectedHeight___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 floatValue];
  double v5 = v4;
  double v6 = vabdd_f64(v5, *(double *)(a1 + 48));
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  if (v6 < *(double *)(v7 + 24))
  {
    *(double *)(v7 + 24) = v6;
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v5;
  }
  return result;
}

- (void)dragEndedWithAnimation:(id)a3
{
  id v19 = a3;
  [(PXFloatingCardGestureCoordinator *)self setIsDragging:0];
  float v4 = [(PXFloatingCardGestureCoordinator *)self heightGestureRecognizer];
  double v5 = [(PXFloatingCardGestureCoordinator *)self cardViewController];
  double v6 = [v5 view];
  [v4 velocityInView:v6];
  double v8 = v7;

  double v9 = [(PXFloatingCardGestureCoordinator *)self cardViewController];
  [v9 size];
  double v11 = v10;

  [(PXFloatingCardGestureCoordinator *)self projectionWithVelocity:v8 decelerationRate:*MEMORY[0x1E4FB2EE8]];
  [(PXFloatingCardGestureCoordinator *)self closestHeightForProjectedHeight:v11 + v12];
  double v14 = v13;
  if (v13 == v11) {
    double v15 = 0.0;
  }
  else {
    double v15 = v8 / (v13 - v11);
  }
  uint64_t v16 = (uint64_t)v19;
  if (!v19)
  {
    uint64_t v16 = +[PXFloatingCardAnimation animationWithMass:stiffness:damping:initialVelocity:delay:](PXFloatingCardAnimation, "animationWithMass:stiffness:damping:initialVelocity:delay:", 1.0, dbl_1AB359AE0[v15 > 4.0], dbl_1AB359AF0[v15 > 4.0]);
  }
  id v20 = (id)v16;
  id v17 = [(PXFloatingCardGestureCoordinator *)self animationManager];
  [v17 pushHeightAnimation:v20];

  [(PXFloatingCardGestureCoordinator *)self snapToHeight:v14];
  double v18 = [(PXFloatingCardGestureCoordinator *)self animationManager];
  [v18 popHeightAnimation];
}

- (void)dragChangedWithVerticalDelta:(double)a3
{
  double v5 = [(PXFloatingCardGestureCoordinator *)self cardViewController];
  [v5 size];
  double v7 = v6;

  [(PXFloatingCardGestureCoordinator *)self heightForRubberBandHeight:v7];
  [(PXFloatingCardGestureCoordinator *)self rubberBandHeightForHeight:v8 + a3];
  double v9 = [(PXFloatingCardGestureCoordinator *)self cardViewController];
  double v10 = [v9 view];
  UIRoundToViewScale();
  double v12 = v11;

  [(PXFloatingCardGestureCoordinator *)self updateCardHeightConstraintWithHeight:v12];
}

- (void)dragBegan
{
  [(PXFloatingCardGestureCoordinator *)self setIsDragging:1];
  [(PXFloatingCardGestureCoordinator *)self setTopRubberBandRange:15.0];
  [(PXFloatingCardGestureCoordinator *)self setBottomRubberBandRange:15.0];
  id v3 = [(PXFloatingCardGestureCoordinator *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(PXFloatingCardGestureCoordinator *)self delegate];
    [v5 gestureCoordinatorDidBeginInteraction:self];
  }
}

- (void)layoutDidChange
{
  [(PXFloatingCardGestureCoordinator *)self _removeGestureRecognizers];
  [(PXFloatingCardGestureCoordinator *)self _addGestureRecognizers];
}

- (void)dealloc
{
  id v3 = [(PXFloatingCardGestureCoordinator *)self cardViewController];
  char v4 = [v3 view];
  id v5 = [(PXFloatingCardGestureCoordinator *)self heightGestureRecognizer];
  [v4 removeGestureRecognizer:v5];

  double v6 = [(PXFloatingCardGestureCoordinator *)self cardViewController];
  double v7 = [v6 view];
  double v8 = [(PXFloatingCardGestureCoordinator *)self positionGestureRecognizer];
  [v7 removeGestureRecognizer:v8];

  v9.receiver = self;
  v9.super_class = (Class)PXFloatingCardGestureCoordinator;
  [(PXFloatingCardGestureCoordinator *)&v9 dealloc];
}

- (void)_removeGestureRecognizers
{
  id v3 = [(PXFloatingCardGestureCoordinator *)self heightGestureRecognizer];

  if (v3)
  {
    char v4 = [(PXFloatingCardGestureCoordinator *)self cardViewController];
    id v5 = [v4 view];
    double v6 = [(PXFloatingCardGestureCoordinator *)self heightGestureRecognizer];
    [v5 removeGestureRecognizer:v6];

    [(PXFloatingCardGestureCoordinator *)self setHeightGestureRecognizer:0];
  }
  double v7 = [(PXFloatingCardGestureCoordinator *)self positionGestureRecognizer];

  if (v7)
  {
    double v8 = [(PXFloatingCardGestureCoordinator *)self cardViewController];
    objc_super v9 = [v8 view];
    double v10 = [(PXFloatingCardGestureCoordinator *)self positionGestureRecognizer];
    [v9 removeGestureRecognizer:v10];

    [(PXFloatingCardGestureCoordinator *)self setPositionGestureRecognizer:0];
  }
}

- (void)_addGestureRecognizers
{
  id obj = (id)[objc_alloc(MEMORY[0x1E4FB1A58]) initWithTarget:self action:sel_handleHeightGesture_];
  [obj setDelegate:self];
  [obj setMaximumNumberOfTouches:1];
  id v3 = [(PXFloatingCardGestureCoordinator *)self cardViewController];
  char v4 = [v3 view];
  [v4 addGestureRecognizer:obj];

  objc_storeStrong((id *)&self->_heightGestureRecognizer, obj);
  id v5 = [(PXFloatingCardGestureCoordinator *)self layout];
  LODWORD(v4) = [v5 canDrag];

  if (v4)
  {
    double v6 = (UIPanGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1A58]) initWithTarget:self action:sel_handlePositionGesture_];
    [(UIPanGestureRecognizer *)v6 setDelegate:self];
    double v7 = [(PXFloatingCardGestureCoordinator *)self cardViewController];
    double v8 = [v7 view];
    [v8 addGestureRecognizer:v6];

    positionGestureRecognizer = self->_positionGestureRecognizer;
    self->_positionGestureRecognizer = v6;
  }
}

- (PXFloatingCardGestureCoordinator)initWithCardViewController:(id)a3 layout:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PXFloatingCardGestureCoordinator;
  double v8 = [(PXFloatingCardGestureCoordinator *)&v13 init];
  objc_super v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_cardViewController, v6);
    objc_storeWeak((id *)&v9->_layout, v7);
    double v10 = objc_alloc_init(PXFloatingCardAnimationManager);
    animationManager = v9->_animationManager;
    v9->_animationManager = v10;

    v9->_isDragging = 0;
  }

  return v9;
}

@end