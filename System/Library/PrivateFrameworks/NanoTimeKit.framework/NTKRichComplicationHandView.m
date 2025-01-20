@interface NTKRichComplicationHandView
- (CALayer)dotLayer;
- (CALayer)handLayer;
- (NTKRichComplicationHandView)initWithDotSize:(double)a3 handWidth:(double)a4 beginAngle:(double)a5 endAngle:(double)a6;
- (void)_updateHandTransform;
- (void)layoutSubviews;
- (void)setValue:(float)a3 animated:(BOOL)a4;
@end

@implementation NTKRichComplicationHandView

- (NTKRichComplicationHandView)initWithDotSize:(double)a3 handWidth:(double)a4 beginAngle:(double)a5 endAngle:(double)a6
{
  v18.receiver = self;
  v18.super_class = (Class)NTKRichComplicationHandView;
  v10 = -[NTKRichComplicationHandView initWithFrame:](&v18, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v11 = v10;
  if (v10)
  {
    v12 = [(NTKRichComplicationHandView *)v10 layer];
    uint64_t v13 = objc_opt_new();
    dotLayer = v11->_dotLayer;
    v11->_dotLayer = (CALayer *)v13;

    -[CALayer setBounds:](v11->_dotLayer, "setBounds:", 0.0, 0.0, a3, a3);
    [(CALayer *)v11->_dotLayer setCornerRadius:a3 * 0.5];
    [v12 addSublayer:v11->_dotLayer];
    uint64_t v15 = objc_opt_new();
    handLayer = v11->_handLayer;
    v11->_handLayer = (CALayer *)v15;

    -[CALayer setAnchorPoint:](v11->_handLayer, "setAnchorPoint:", 0.5, 1.0);
    [v12 addSublayer:v11->_handLayer];
    v11->_beginAngle = a5;
    v11->_endAngle = a6;
    v11->_handWidth = a4;
  }
  return v11;
}

- (void)layoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)NTKRichComplicationHandView;
  [(NTKRichComplicationHandView *)&v14 layoutSubviews];
  v3 = [(NTKRichComplicationHandView *)self layer];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6 * 0.5;
  -[CALayer setPosition:](self->_dotLayer, "setPosition:", v4 * 0.5, v6 * 0.5);
  handLayer = self->_handLayer;
  long long v9 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
  v13[4] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
  v13[5] = v9;
  long long v10 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
  v13[6] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
  v13[7] = v10;
  long long v11 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
  v13[0] = *MEMORY[0x1E4F39B10];
  v13[1] = v11;
  long long v12 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
  v13[2] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
  v13[3] = v12;
  [(CALayer *)handLayer setTransform:v13];
  -[CALayer setFrame:](self->_handLayer, "setFrame:", (v5 - self->_handWidth) * 0.5, 0.0, self->_handWidth, v7);
  [(NTKRichComplicationHandView *)self _updateHandTransform];
}

- (void)setValue:(float)a3 animated:(BOOL)a4
{
  if (a3 < 0.0) {
    a3 = 0.0;
  }
  self->_value = fminf(a3, 1.0);
  if (a4)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __49__NTKRichComplicationHandView_setValue_animated___block_invoke;
    v4[3] = &unk_1E62BFF20;
    v4[4] = self;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:65540 delay:v4 usingSpringWithDamping:0 initialSpringVelocity:0.2 options:0.0 animations:0.75 completion:0.0];
  }
  else
  {
    [(NTKRichComplicationHandView *)self _updateHandTransform];
  }
}

uint64_t __49__NTKRichComplicationHandView_setValue_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateHandTransform];
}

- (void)_updateHandTransform
{
  float v2 = self->_beginAngle + self->_value * (self->_endAngle - self->_beginAngle);
  handLayer = self->_handLayer;
  CATransform3DMakeRotation(&v4, v2, 0.0, 0.0, 1.0);
  [(CALayer *)handLayer setTransform:&v4];
}

- (CALayer)dotLayer
{
  return self->_dotLayer;
}

- (CALayer)handLayer
{
  return self->_handLayer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handLayer, 0);
  objc_storeStrong((id *)&self->_dotLayer, 0);
}

@end