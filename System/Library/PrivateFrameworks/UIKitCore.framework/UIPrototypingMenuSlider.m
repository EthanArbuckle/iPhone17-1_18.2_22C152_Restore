@interface UIPrototypingMenuSlider
@end

@implementation UIPrototypingMenuSlider

uint64_t __63___UIPrototypingMenuSlider_thumbRectForBounds_trackRect_value___block_invoke(uint64_t a1)
{
  v9.size.width = *(CGFloat *)(a1 + 48);
  v9.size.height = *(CGFloat *)(a1 + 56);
  v9.origin.x = round(*(double *)(a1 + 64) + (*(double *)(a1 + 80) - v9.size.width) * 0.5);
  v9.origin.y = round(*(double *)(a1 + 72) + (*(double *)(a1 + 88) - v9.size.height) * 0.5);
  CGRect v10 = CGRectOffset(v9, 0.0, -3.0);
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", v10.origin.x, v10.origin.y, v10.size.width, v10.size.height);
  double v2 = *(double *)(a1 + 64);
  double v3 = *(double *)(a1 + 72);
  double v4 = *(double *)(a1 + 80);
  double v5 = *(double *)(a1 + 88);
  v6 = *(void **)(a1 + 40);
  return objc_msgSend(v6, "setBounds:", v2, v3, v4, v5);
}

uint64_t __59___UIPrototypingMenuSlider__setKnobViewProminent_animated___block_invoke(uint64_t a1)
{
  long long v2 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v7.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v7.c = v2;
  *(_OWORD *)&v7.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  if (*(unsigned char *)(a1 + 40))
  {
    memset(&v6, 0, sizeof(v6));
    CGAffineTransformMakeScale(&v6, 1.25, 1.25);
    CGAffineTransform v5 = v6;
    CGAffineTransformTranslate(&v7, &v5, 0.0, -35.0);
  }
  CGAffineTransform v4 = v7;
  return [*(id *)(a1 + 32) setTransform:&v4];
}

uint64_t __59___UIPrototypingMenuSlider__setKnobViewProminent_animated___block_invoke_2(uint64_t result)
{
  if (!*(unsigned char *)(result + 40))
  {
    uint64_t v1 = result;
    long long v2 = [*(id *)(result + 32) knobPortal];
    [v2 removeFromSuperview];

    double v3 = *(void **)(v1 + 32);
    return [v3 setKnobPortal:0];
  }
  return result;
}

@end