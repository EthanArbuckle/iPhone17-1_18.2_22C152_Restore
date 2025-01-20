@interface PKExpressBannerTrailingView
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKExpressBannerTrailingView)init;
- (PKExpressBannerTrailingView)initWithCoder:(id)a3;
- (PKExpressBannerTrailingView)initWithFrame:(CGRect)a3;
- (uint64_t)_updateStateAnimated:(double)a3 withDelay:;
- (void)expressGlyphView:(id)a3 revealingCheckmarkAnimated:(BOOL)a4;
- (void)layoutSubviews;
@end

@implementation PKExpressBannerTrailingView

- (PKExpressBannerTrailingView)init
{
  return 0;
}

- (PKExpressBannerTrailingView)initWithFrame:(CGRect)a3
{
  return 0;
}

- (PKExpressBannerTrailingView)initWithCoder:(id)a3
{
  return 0;
}

- (uint64_t)_updateStateAnimated:(double)a3 withDelay:
{
  memset(&v21, 0, sizeof(v21));
  if (*(_DWORD *)(a1 + 408) == 1)
  {
    long long v6 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
    *(_OWORD *)&v21.m31 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
    *(_OWORD *)&v21.m33 = v6;
    long long v7 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
    *(_OWORD *)&v21.m41 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
    *(_OWORD *)&v21.m43 = v7;
    long long v8 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
    *(_OWORD *)&v21.m11 = *MEMORY[0x1E4F39B10];
    *(_OWORD *)&v21.m13 = v8;
    long long v9 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
    *(_OWORD *)&v21.m21 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
    *(_OWORD *)&v21.m23 = v9;
  }
  else
  {
    CATransform3DMakeRotation(&v21, -1.74532925, 0.0, 1.0, 0.0);
  }
  memset(&v20, 0, sizeof(v20));
  v10 = *(void **)(a1 + 416);
  if (v10) {
    [v10 transform3D];
  }
  CATransform3D a = v20;
  CATransform3D b = v21;
  uint64_t result = CATransform3DEqualToTransform(&a, &b);
  if ((result & 1) == 0)
  {
    if (a2)
    {
      v12 = (void *)[objc_alloc(MEMORY[0x1E4F88168]) initWithMass:2.0 stiffness:100.0 damping:10.0];
      v13 = [v12 springAnimationWithKeyPath:@"transform"];
      CATransform3D a = v20;
      CATransform3D b = v21;
      objc_msgSend(v13, "pkui_updateForAdditiveAnimationFromTransform:toTransform:", &a, &b);
      if (a3 != 0.0) {
        [v13 setBeginTime:a3];
      }
      v14 = [*(id *)(a1 + 416) layer];
      id v15 = (id)objc_msgSend(v14, "pkui_addAdditiveAnimation:", v13);
    }
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    CATransform3D v17 = v21;
    v16[2] = __62__PKExpressBannerTrailingView__updateStateAnimated_withDelay___block_invoke;
    v16[3] = &unk_1E59CBCE0;
    v16[4] = a1;
    return [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v16];
  }
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[PKExpressGlyphView sizeThatFits:](self->_glyphView, "sizeThatFits:", 18.0, 18.0);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)PKExpressBannerTrailingView;
  [(PKExpressBannerTrailingView *)&v16 layoutSubviews];
  [(PKExpressBannerTrailingView *)self bounds];
  -[PKExpressGlyphView sizeThatFits:](self->_glyphView, "sizeThatFits:", v3, v4);
  PKSizeAlignedInRect();
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  -[PKExpressGlyphView setBounds:](self->_glyphView, "setBounds:");
  glyphView = self->_glyphView;
  [(PKExpressGlyphView *)glyphView anchorPoint];
  -[PKExpressGlyphView setCenter:](glyphView, "setCenter:", v6 + v14 * v10, v8 + v15 * v12);
}

uint64_t __62__PKExpressBannerTrailingView__updateStateAnimated_withDelay___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 416);
  long long v2 = *(_OWORD *)(a1 + 120);
  v7[4] = *(_OWORD *)(a1 + 104);
  v7[5] = v2;
  long long v3 = *(_OWORD *)(a1 + 152);
  v7[6] = *(_OWORD *)(a1 + 136);
  v7[7] = v3;
  long long v4 = *(_OWORD *)(a1 + 56);
  v7[0] = *(_OWORD *)(a1 + 40);
  v7[1] = v4;
  long long v5 = *(_OWORD *)(a1 + 88);
  v7[2] = *(_OWORD *)(a1 + 72);
  v7[3] = v5;
  return [v1 setTransform3D:v7];
}

- (void)expressGlyphView:(id)a3 revealingCheckmarkAnimated:(BOOL)a4
{
  BOOL v4 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained expressTrailingView:self revealingCheckmarkAnimated:v4];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_glyphView, 0);
}

@end