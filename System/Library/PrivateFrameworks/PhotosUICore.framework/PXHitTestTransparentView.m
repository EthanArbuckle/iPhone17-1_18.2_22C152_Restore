@interface PXHitTestTransparentView
- (BOOL)_isPoint:(CGPoint)a3 insideView:(id)a4 withEvent:(id)a5 adjustedPoint:(CGPoint *)a6;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (PXHitTestTransparentView)initWithFrame:(CGRect)a3;
- (PXHitTestTransparentViewDelegate)delegate;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (int64_t)_hitTestBehaviorForView:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation PXHitTestTransparentView

- (PXHitTestTransparentView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PXHitTestTransparentView;
  v3 = -[PXHitTestTransparentView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [(PXHitTestTransparentView *)v3 layer];
    [v4 setAllowsGroupOpacity:0];

    sub_1AB23B20C();
  }
  return 0;
}

- (void).cxx_destruct
{
}

- (void)setDelegate:(id)a3
{
}

- (PXHitTestTransparentViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXHitTestTransparentViewDelegate *)WeakRetained;
}

- (int64_t)_hitTestBehaviorForView:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  id v4 = a3;
  v5 = [(PXHitTestTransparentView *)self delegate];
  int64_t v6 = [v5 hitTestTransparentView:self hitTestBehaviorForView:v4];

  return v6;
}

- (BOOL)_isPoint:(CGPoint)a3 insideView:(id)a4 withEvent:(id)a5 adjustedPoint:(CGPoint *)a6
{
  id v7 = a4;
  id v8 = a5;
  [v7 bounds];
  CGRectInset(v10, 1.0, 1.0);
  PXRectClampPoint();
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)PXHitTestTransparentView;
  if (-[PXHitTestTransparentView pointInside:withEvent:](&v22, sel_pointInside_withEvent_, v8, x, y))
  {
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x2020000000;
    char v21 = 0;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __50__PXHitTestTransparentView_pointInside_withEvent___block_invoke;
    v17[3] = &unk_1E5DCD5C8;
    v17[4] = self;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __50__PXHitTestTransparentView_pointInside_withEvent___block_invoke_2;
    v11[3] = &unk_1E5DCD5F0;
    v11[4] = self;
    SEL v14 = a2;
    double v15 = x;
    double v16 = y;
    id v12 = v8;
    v13 = &v18;
    [(PXHitTestTransparentView *)self px_enumerateDescendantSubviewsPassingTest:v17 usingBlock:v11];
    BOOL v9 = *((unsigned char *)v19 + 24) != 0;

    _Block_object_dispose(&v18, 8);
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

BOOL __50__PXHitTestTransparentView_pointInside_withEvent___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _hitTestBehaviorForView:a2] != 2;
}

void __50__PXHitTestTransparentView_pointInside_withEvent___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  id v11 = a2;
  uint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "_hitTestBehaviorForView:");
  if (v5)
  {
    if (v5 == 2)
    {
      int64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
      [v6 handleFailureInMethod:*(void *)(a1 + 56) object:*(void *)(a1 + 32) file:@"PXHitTestTransparentView.m" lineNumber:68 description:@"Code which should be unreachable has been reached"];

      abort();
    }
  }
  else
  {
    objc_msgSend(v11, "convertPoint:fromView:", *(void *)(a1 + 32), *(double *)(a1 + 64), *(double *)(a1 + 72));
    double v8 = v7;
    double v10 = v9;
    if ([v11 isUserInteractionEnabled]
      && objc_msgSend(*(id *)(a1 + 32), "_isPoint:insideView:withEvent:adjustedPoint:", v11, *(void *)(a1 + 40), 0, v8, v10))
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      *a3 = 1;
    }
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)PXHitTestTransparentView;
  -[PXHitTestTransparentView hitTest:withEvent:](&v26, sel_hitTest_withEvent_, v7, x, y);
  double v8 = (PXHitTestTransparentView *)objc_claimAutoreleasedReturnValue();
  double v9 = v8;
  if (v8 == self)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v11 = [(PXHitTestTransparentView *)self subviews];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v23;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v23 != v14) {
            objc_enumerationMutation(v11);
          }
          double v16 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          objc_msgSend(v16, "convertPoint:fromView:", self, x, y, 0, 0);
          double v20 = v17;
          double v21 = v18;
          if (-[PXHitTestTransparentView _isPoint:insideView:withEvent:adjustedPoint:](self, "_isPoint:insideView:withEvent:adjustedPoint:", v16, v7, &v20))
          {
            objc_msgSend(v16, "hitTest:withEvent:", v7, v20, v21);
            double v10 = (PXHitTestTransparentView *)objc_claimAutoreleasedReturnValue();

            goto LABEL_13;
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v27 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }

    double v10 = 0;
  }
  else
  {
    double v10 = v8;
  }
LABEL_13:

  return v10;
}

@end