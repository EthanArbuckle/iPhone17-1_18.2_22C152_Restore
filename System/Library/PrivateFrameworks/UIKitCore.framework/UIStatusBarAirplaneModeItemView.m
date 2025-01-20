@interface UIStatusBarAirplaneModeItemView
- (id)contentsImage;
- (void)setVisible:(BOOL)a3 frame:(CGRect)a4 duration:(double)a5;
@end

@implementation UIStatusBarAirplaneModeItemView

- (void)setVisible:(BOOL)a3 frame:(CGRect)a4 duration:(double)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  BOOL v10 = a3;
  if (a5 > 0.0
    && +[UIView _isInAnimationBlockWithAnimationsEnabled])
  {
    int v12 = *((_DWORD *)&self->super.super.super._viewFlags + 4);
    [(UIView *)self frame];
    double v14 = v13;
    CGFloat rect = v15;
    double v17 = v16;
    CGFloat v19 = v18;
    uint64_t v20 = _UIDeviceNativeUserInterfaceIdiom();
    if (v10)
    {
      if (v20 == 1)
      {
        if ((v12 & 0x80000) != 0) {
          double v21 = 70.0;
        }
        else {
          double v21 = -70.0;
        }
        double v24 = v14 + v21;
      }
      else if ((v12 & 0x80000) != 0)
      {
        v33.origin.double x = v14;
        v33.origin.double y = rect;
        v33.size.double width = v17;
        v33.size.double height = v19;
        double v24 = v17 + CGRectGetMaxX(v33);
      }
      else
      {
        double v24 = -v17;
      }
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __61__UIStatusBarAirplaneModeItemView_setVisible_frame_duration___block_invoke;
      v32[3] = &unk_1E52DA520;
      v32[4] = self;
      *(double *)&v32[5] = v24;
      *(CGFloat *)&v32[6] = rect;
      *(double *)&v32[7] = v17;
      *(CGFloat *)&v32[8] = v19;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v32, *(void *)&rect);
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __61__UIStatusBarAirplaneModeItemView_setVisible_frame_duration___block_invoke_2;
      v31[3] = &unk_1E52DA520;
      v31[4] = self;
      *(double *)&v31[5] = x;
      *(double *)&v31[6] = y;
      *(double *)&v31[7] = width;
      *(double *)&v31[8] = height;
      uint64_t v25 = 131136;
      v26 = v31;
      double v27 = a5;
    }
    else
    {
      if (v20 == 1)
      {
        double v22 = dbl_186B9C270[(*(void *)&v12 & 0x80000) == 0] + v14;
        CGFloat v23 = rect;
      }
      else
      {
        CGFloat v23 = rect;
        if ((v12 & 0x80000) != 0)
        {
          v34.origin.double x = v14;
          v34.origin.double y = rect;
          v34.size.double width = v17;
          v34.size.double height = v19;
          double v22 = CGRectGetMaxX(v34) + -70.0;
        }
        else
        {
          double v22 = 70.0;
        }
      }
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __61__UIStatusBarAirplaneModeItemView_setVisible_frame_duration___block_invoke_3;
      v30[3] = &unk_1E52DA520;
      v30[4] = self;
      *(double *)&v30[5] = v22;
      *(CGFloat *)&v30[6] = v23;
      *(double *)&v30[7] = v17;
      *(CGFloat *)&v30[8] = v19;
      v26 = v30;
      double v27 = a5;
      uint64_t v25 = 65600;
    }
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", v25, v26, 0, v27, 0.0, *(void *)&rect);
  }
  else
  {
    v29.receiver = self;
    v29.super_class = (Class)UIStatusBarAirplaneModeItemView;
    -[UIStatusBarItemView setVisible:frame:duration:](&v29, sel_setVisible_frame_duration_, v10, x, y, width, height, a5);
  }
}

uint64_t __61__UIStatusBarAirplaneModeItemView_setVisible_frame_duration___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  v2 = *(void **)(a1 + 32);
  return [v2 setVisible:1];
}

uint64_t __61__UIStatusBarAirplaneModeItemView_setVisible_frame_duration___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __61__UIStatusBarAirplaneModeItemView_setVisible_frame_duration___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  v2 = *(void **)(a1 + 32);
  return [v2 setVisible:0];
}

- (id)contentsImage
{
  v6.receiver = self;
  v6.super_class = (Class)UIStatusBarAirplaneModeItemView;
  v3 = [(UIStatusBarIndicatorItemView *)&v6 contentsImage];
  if ([(UIStatusBarItemView *)self _shouldReverseLayoutDirection])
  {
    uint64_t v4 = [v3 imageSetWithOrientation:4];

    v3 = (void *)v4;
  }
  return v3;
}

@end