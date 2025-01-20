@interface SFFluidProgressView
@end

@implementation SFFluidProgressView

uint64_t __38___SFFluidProgressView_layoutSubviews__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 408), "setBounds:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  double v2 = *(double *)(a1 + 56);
  if (v2 != 0.0)
  {
    CATransform3DMakeScale(&v23, 1.0 / v2, 1.0, 1.0);
    v3 = [*(id *)(*(void *)(a1 + 32) + 408) layer];
    CATransform3D v22 = v23;
    [v3 setTransform:&v22];

    double v2 = *(double *)(a1 + 56);
  }
  CATransform3DMakeScale(&v21, v2, 1.0, 1.0);
  v4 = [*(id *)(*(void *)(a1 + 32) + 416) layer];
  CATransform3D v20 = v21;
  [v4 setTransform:&v20];

  char v5 = objc_msgSend(*(id *)(a1 + 32), "_sf_usesLeftToRightLayout");
  double v6 = 0.0;
  double v7 = 0.0;
  if ((v5 & 1) == 0) {
    double v7 = *(double *)(a1 + 56);
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v8 + 433))
  {
    [(id)v8 frame];
    double v10 = v9;
    [(id)objc_opt_class() defaultHeight];
    double v6 = v10 - v11;
    uint64_t v8 = *(void *)(a1 + 32);
  }
  objc_msgSend(*(id *)(v8 + 416), "setCenter:", v7, v6);
  [*(id *)(*(void *)(a1 + 32) + 416) bounds];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  [(id)objc_opt_class() defaultHeight];
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 416), "setBounds:", v13, v15, v17, v18);
}

void __37___SFFluidProgressView_defaultHeight__block_invoke()
{
  defaultHeight_height = _SFCeilingFloatToPixels(2.5);
}

uint64_t __89___SFFluidProgressView_setProgressAnimationSuppressed_duringFluidProgressState_animated___block_invoke(uint64_t a1)
{
  double v1 = 0.0;
  if (!*(unsigned char *)(a1 + 40)) {
    double v1 = 1.0;
  }
  return [*(id *)(*(void *)(a1 + 32) + 416) setAlpha:v1];
}

uint64_t __55___SFFluidProgressView__finishProgressBarWithDuration___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 416) setAlpha:0.0];
}

void __55___SFFluidProgressView__finishProgressBarWithDuration___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    v3 = [*(id *)(*(void *)(a1 + 32) + 416) layer];
    v4 = [v3 presentationLayer];
    [v4 opacity];
    float v6 = v5;

    if (v6 == 0.0)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 440));
      [WeakRetained fluidProgressViewDidShowProgress:*(void *)(a1 + 32)];

      uint64_t v8 = *(void **)(*(void *)(a1 + 32) + 416);
      [v8 setHidden:1];
    }
  }
}

uint64_t __86___SFFluidProgressView_fluidProgressController_startFluidProgressBar_animateFillFade___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  double v2 = 0.0;
  if (!*(unsigned char *)(v1 + 432)) {
    double v2 = 1.0;
  }
  return [*(id *)(v1 + 416) setAlpha:v2];
}

uint64_t __82___SFFluidProgressView_fluidProgressController_updateFluidProgressBar_completion___block_invoke(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) destinationPosition];
  objc_msgSend(v2, "_progressBarBoundsForValue:");
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  if (*(unsigned char *)(a1 + 48))
  {
    double v11 = *(id **)(a1 + 32);
    if (v11[52])
    {
      [v11[52] transform];
      double v12 = *(double *)&v17;
      double v11 = *(id **)(a1 + 32);
    }
    else
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v17 = 0u;
      double v12 = 0.0;
    }
    double v13 = 100.0 / v12;
    double v8 = v8 + 100.0 / v12;
    int v14 = objc_msgSend(v11, "_sf_usesLeftToRightLayout", v17, v18, v19);
    double v15 = 0.0;
    if (!v14) {
      double v15 = v13;
    }
    double v4 = v4 - v15;
  }
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 416), "setBounds:", v4, v6, v8, v10);
}

void __82___SFFluidProgressView_fluidProgressController_updateFluidProgressBar_completion___block_invoke_2(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 40) * 1000000000.0));
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82___SFFluidProgressView_fluidProgressController_updateFluidProgressBar_completion___block_invoke_3;
  block[3] = &unk_1E54EB568;
  id v4 = *(id *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x1E4F14428], block);
}

uint64_t __82___SFFluidProgressView_fluidProgressController_updateFluidProgressBar_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

@end