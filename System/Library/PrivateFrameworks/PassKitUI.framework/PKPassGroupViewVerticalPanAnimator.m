@interface PKPassGroupViewVerticalPanAnimator
- (PKPassGroupViewVerticalPanAnimator)init;
- (double)createAnimationWithInitialVelocity:(uint64_t)a1;
- (id)initWithGroupView:(void *)a3 gestureRecognizer:;
- (uint64_t)updateRecognizingWithAllowed:(uint64_t)result;
- (uint64_t)updateUpdating;
- (void)dealloc;
- (void)dismissWithStartVelocity:(double)a3 completion:;
- (void)invalidate;
- (void)layoutViewsWithY:(uint64_t)a1;
- (void)setDismissAnimation:(uint64_t)a1;
@end

@implementation PKPassGroupViewVerticalPanAnimator

- (PKPassGroupViewVerticalPanAnimator)init
{
  return 0;
}

- (id)initWithGroupView:(void *)a3 gestureRecognizer:
{
  id v6 = a2;
  id v7 = a3;
  v8 = v7;
  v9 = 0;
  if (a1 && v6 && v7)
  {
    v13.receiver = a1;
    v13.super_class = (Class)PKPassGroupViewVerticalPanAnimator;
    v10 = (id *)objc_msgSendSuper2(&v13, sel_init);
    v11 = v10;
    if (v10)
    {
      objc_storeStrong(v10 + 8, a2);
      objc_storeStrong(v11 + 9, a3);
      v11[11] = (id)0x3FF0000000000000;
      [v11[8] addGestureRecognizer:v11[9]];
    }
    a1 = v11;
    v9 = a1;
  }

  return v9;
}

- (void)dealloc
{
  if (!self->_invalidated) {
    -[PKPassGroupViewVerticalPanAnimator invalidate]((uint64_t)self);
  }
  v3.receiver = self;
  v3.super_class = (Class)PKPassGroupViewVerticalPanAnimator;
  [(PKPassGroupViewVerticalPanAnimator *)&v3 dealloc];
}

- (void)invalidate
{
  if (a1)
  {
    if (!*(unsigned char *)(a1 + 60))
    {
      *(unsigned char *)(a1 + 60) = 1;
      [*(id *)(a1 + 72) setEnabled:0];
      [*(id *)(a1 + 64) removeGestureRecognizer:*(void *)(a1 + 72)];
      v2 = *(void **)(a1 + 80);
      *(void *)(a1 + 80) = 0;

      -[PKPassGroupViewVerticalPanAnimator setDismissAnimation:](a1, 0);
      if (*(unsigned char *)(a1 + 61))
      {
        *(unsigned char *)(a1 + 61) = 0;
        uint64_t v3 = *(unsigned int *)(a1 + 56);
        MEMORY[0x1F41670F0](a1 + 24, v3);
      }
    }
  }
}

- (void)setDismissAnimation:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    id v5 = *(id *)(a1 + 16);
    if (v5 != v4)
    {
      id v6 = v4;
      if (v5)
      {
        [v5 stop];
        objc_storeStrong((id *)(a1 + 16), a2);
        if (!*(void *)(a1 + 16)) {
          [*(id *)(a1 + 64) clearPageControlAlphaOverride];
        }
      }
      else
      {
        objc_storeStrong((id *)(a1 + 16), a2);
      }
      -[PKPassGroupViewVerticalPanAnimator updateUpdating](a1);
      id v4 = v6;
    }
  }
}

- (uint64_t)updateRecognizingWithAllowed:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = result;
    if (a2)
    {
      result = [*(id *)(result + 72) state];
      int v3 = (unint64_t)(result - 1) < 2;
    }
    else
    {
      int v3 = 0;
    }
    if (*(unsigned __int8 *)(v2 + 8) != v3)
    {
      *(unsigned char *)(v2 + 8) = v3;
      return -[PKPassGroupViewVerticalPanAnimator updateUpdating](v2);
    }
  }
  return result;
}

- (uint64_t)updateUpdating
{
  if (result)
  {
    if (*(unsigned char *)(result + 8) || *(void *)(result + 16))
    {
      int v1 = *(unsigned __int8 *)(result + 60);
      if (*(unsigned __int8 *)(result + 61) == (v1 ^ 1)) {
        return result;
      }
      *(unsigned char *)(result + 61) = v1 ^ 1;
      if (!v1)
      {
        *(_OWORD *)(result + 24) = xmmword_1A04445F0;
        uint64_t v2 = result + 24;
        *(void *)(v2 + 16) = 0;
        *(void *)(v2 + 24) = 0;
        *(_DWORD *)(v2 + 32) = 2162689;
        return MEMORY[0x1F41670E8]();
      }
      return MEMORY[0x1F41670F0](result + 24, *(unsigned int *)(result + 56));
    }
    if (*(unsigned char *)(result + 61))
    {
      *(unsigned char *)(result + 61) = 0;
      return MEMORY[0x1F41670F0](result + 24, *(unsigned int *)(result + 56));
    }
  }
  return result;
}

- (void)layoutViewsWithY:(uint64_t)a1
{
  if (a1)
  {
    double v4 = *(double *)(a1 + 104);
    double v5 = a2 - v4;
    double v6 = *(double *)(a1 + 120) - v4;
    double v7 = v5 / v6;
    double v8 = v5 / v6 / -0.05 + 1.0;
    BOOL v9 = v8 <= 0.0;
    BOOL v10 = v8 < 1.0 || v8 <= 0.0;
    if (v8 >= 1.0) {
      BOOL v9 = 1;
    }
    if (v10) {
      double v11 = 0.0;
    }
    else {
      double v11 = 1.0;
    }
    if (v9) {
      double v12 = v11;
    }
    else {
      double v12 = v5 / v6 / -0.05 + 1.0;
    }
    if (v4 >= a2
      || (double v13 = fmin(fmax(v5 / (v6 * 0.35), 0.0), 1.0),
          long double v14 = log(*(long double *)(a1 + 88)),
          long double v15 = exp(v13 * v14),
          memset(&v26, 0, sizeof(v26)),
          v15 == 1.0))
    {
      long long v16 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
      *(_OWORD *)&v26.m31 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
      *(_OWORD *)&v26.m33 = v16;
      long long v17 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
      *(_OWORD *)&v26.m41 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
      *(_OWORD *)&v26.m43 = v17;
      long long v18 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
      *(_OWORD *)&v26.m11 = *MEMORY[0x1E4F39B10];
      *(_OWORD *)&v26.m13 = v18;
      long long v19 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
      *(_OWORD *)&v26.m21 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
      *(_OWORD *)&v26.m23 = v19;
    }
    else
    {
      CATransform3DMakeScale(&v26, v15, v15, 1.0);
    }
    v20 = [*(id *)(a1 + 64) layer];
    [v20 position];
    double v22 = v21;
    CATransform3D v25 = v26;
    [v20 setTransform:&v25];
    objc_msgSend(v20, "setPosition:", v22, a2);
    if (([*(id *)(a1 + 64) overridePageControlAlpha:v12] & 1) == 0) {
      [*(id *)(a1 + 64) updatePageControlFrameAnimated:0];
    }
    objc_msgSend(*(id *)(a1 + 64), "updateToStackWithProgress:originalPosition:", v7, *(double *)(a1 + 96), *(double *)(a1 + 104));
    uint64_t v23 = *(void *)(a1 + 80);
    if (v23)
    {
      v24 = *(void (**)(uint64_t, uint64_t, CATransform3D *, double, double))(v23 + 16);
      CATransform3D v25 = v26;
      v24(v23, a1, &v25, v22, a2);
    }
  }
}

- (void)dismissWithStartVelocity:(double)a3 completion:
{
  id v5 = a2;
  double v6 = v5;
  if (a1)
  {
    if (a1[60])
    {
      if (v5) {
        (*((void (**)(id, uint64_t))v5 + 2))(v5, 1);
      }
    }
    else
    {
      double v7 = -[PKPassGroupViewVerticalPanAnimator createAnimationWithInitialVelocity:]((uint64_t)a1, a3);
      -[PKPassGroupViewVerticalPanAnimator setDismissAnimation:]((uint64_t)a1, v7);
      objc_initWeak(&location, a1);
      objc_initWeak(&from, v7);
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __74__PKPassGroupViewVerticalPanAnimator_dismissWithStartVelocity_completion___block_invoke;
      v12[3] = &unk_1E59D76F8;
      objc_copyWeak(&v13, &location);
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __74__PKPassGroupViewVerticalPanAnimator_dismissWithStartVelocity_completion___block_invoke_2;
      v8[3] = &unk_1E59D7720;
      objc_copyWeak(&v10, &location);
      objc_copyWeak(&v11, &from);
      id v9 = v6;
      [v7 runWithValueApplier:v12 completion:v8];

      objc_destroyWeak(&v11);
      objc_destroyWeak(&v10);
      objc_destroyWeak(&v13);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
    }
  }
}

- (double)createAnimationWithInitialVelocity:(uint64_t)a1
{
  uint64_t v2 = (double *)a1;
  if (a1)
  {
    double v4 = [*(id *)(a1 + 64) layer];
    [v4 position];
    double v6 = v5;

    double v7 = v2[15];
    id v8 = objc_alloc(MEMORY[0x1E4FB20E0]);
    uint64_t v2 = (double *)[v8 initWithValue:v6 velocity:a2 unitSize:*MEMORY[0x1E4FB31C0]];
    id v9 = [MEMORY[0x1E4FB20D0] upperBoundary:2 ofType:v7];
    [v2 addActiveValue:v9];
    id v10 = [MEMORY[0x1E4FB20D0] activeValue:0 ofType:v7];
    [v10 _setBoundaryPull:0.06];
    [v2 addActiveValue:v10];
    [v2 setFriction:0.200000003];
  }
  return v2;
}

void __74__PKPassGroupViewVerticalPanAnimator_dismissWithStartVelocity_completion___block_invoke(uint64_t a1, double a2, double a3)
{
  double v5 = (void *)MEMORY[0x1A6224460]();
  objc_copyWeak(&to, (id *)(a1 + 32));
  id v6 = objc_loadWeakRetained(&to);

  if (v6)
  {
    id v7 = objc_loadWeakRetained(&to);
    -[PKPassGroupViewVerticalPanAnimator layoutViewsWithY:]((uint64_t)v7, a3);
  }
  objc_destroyWeak(&to);
}

void __74__PKPassGroupViewVerticalPanAnimator_dismissWithStartVelocity_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained && (id)WeakRetained[2] == v4) {
    -[PKPassGroupViewVerticalPanAnimator setDismissAnimation:]((uint64_t)WeakRetained, 0);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, a2);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updater, 0);
  objc_storeStrong((id *)&self->_gestureRecognizer, 0);
  objc_storeStrong((id *)&self->_groupView, 0);

  objc_storeStrong((id *)&self->_dismissAnimation, 0);
}

@end