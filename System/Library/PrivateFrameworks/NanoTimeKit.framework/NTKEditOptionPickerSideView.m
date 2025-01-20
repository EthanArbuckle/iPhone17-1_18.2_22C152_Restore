@interface NTKEditOptionPickerSideView
- (NTKEditOptionPickerSideView)initWithFrame:(CGRect)a3;
- (UIView)optionView;
- (void)_applyContentAlpha;
- (void)applyContentTransform:(CGAffineTransform *)a3;
- (void)setOptionView:(id)a3;
- (void)setRotationFromFront:(double)a3;
@end

@implementation NTKEditOptionPickerSideView

- (NTKEditOptionPickerSideView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NTKEditOptionPickerSideView;
  v3 = -[NTKEditOptionPickerSideView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4FB1618] blackColor];
    [(NTKEditOptionPickerSideView *)v3 setBackgroundColor:v4];

    uint64_t v5 = MEMORY[0x1E4F1DAB8];
    long long v6 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v3->_contentTransform.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v3->_contentTransform.c = v6;
    *(_OWORD *)&v3->_contentTransform.tx = *(_OWORD *)(v5 + 32);
    v3->_contentAlpha = 1.0;
  }
  return v3;
}

- (void)setOptionView:(id)a3
{
  uint64_t v5 = (UIView *)a3;
  p_optionView = &self->_optionView;
  optionView = self->_optionView;
  if (optionView != v5)
  {
    objc_super v8 = [(UIView *)optionView superview];

    if (v8 == self) {
      [(UIView *)*p_optionView removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_optionView, a3);
    if (*p_optionView)
    {
      -[NTKEditOptionPickerSideView addSubview:](self, "addSubview:");
      v9 = *p_optionView;
      long long v10 = *(_OWORD *)&self->_contentTransform.c;
      v11[0] = *(_OWORD *)&self->_contentTransform.a;
      v11[1] = v10;
      v11[2] = *(_OWORD *)&self->_contentTransform.tx;
      [(UIView *)v9 setTransform:v11];
    }
  }
  [(NTKEditOptionPickerSideView *)self _applyContentAlpha];
}

- (void)applyContentTransform:(CGAffineTransform *)a3
{
  long long v4 = *(_OWORD *)&a3->c;
  long long v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_contentTransform.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_contentTransform.c = v4;
  *(_OWORD *)&self->_contentTransform.tx = v3;
  optionView = self->_optionView;
  long long v6 = *(_OWORD *)&a3->c;
  v7[0] = *(_OWORD *)&a3->a;
  v7[1] = v6;
  v7[2] = *(_OWORD *)&a3->tx;
  [(UIView *)optionView setTransform:v7];
}

- (void)setRotationFromFront:(double)a3
{
  self->_contentAlpha = fmin(fmax(a3 / 1.04719755, 0.0), 1.0) * -0.85 + 1.0;
  [(NTKEditOptionPickerSideView *)self _applyContentAlpha];
}

- (void)_applyContentAlpha
{
}

- (UIView)optionView
{
  return self->_optionView;
}

- (void).cxx_destruct
{
}

@end