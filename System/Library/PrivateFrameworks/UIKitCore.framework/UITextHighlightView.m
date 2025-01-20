@interface UITextHighlightView
+ (id)preferredPreviewParametersForTextLineRects:(id)a3;
- (UIColor)fillColor;
- (UIPreviewParameters)overriddenPreviewParameters;
- (UITextHighlightView)initWithPreviewProvider:(id)a3;
- (id)_fillEffect;
- (id)previewProvider;
- (void)_updateWithPreviewParameters:(id)a3;
- (void)animateWithCompletion:(id)a3;
- (void)fadeAwayWithCompletion:(id)a3;
- (void)invalidateContentView;
- (void)layoutSubviews;
- (void)setFillColor:(id)a3;
- (void)setOverriddenPreviewParameters:(id)a3;
@end

@implementation UITextHighlightView

+ (id)preferredPreviewParametersForTextLineRects:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v16;
      double v8 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v16 != v7) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "CGRectValue", (void)v15);
          double v8 = v8 + CGRectGetHeight(v22);
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v6);
    }
    else
    {
      double v8 = 0.0;
    }

    double v10 = v8 / (double)(unint64_t)[v4 count];
  }
  else
  {
    double v10 = 12.0;
  }
  double v11 = v10 * 0.25;
  double v12 = v10 * -0.2 * 0.5;
  v13 = [[UIPreviewParameters alloc] initWithTextLineRects:v3];
  [(UIPreviewParameters *)v13 _setTextPathCornerRadius:v11];
  -[UIPreviewParameters _setTextPathInsets:](v13, "_setTextPathInsets:", v12, -4.0, v12, -4.0);

  return v13;
}

- (UITextHighlightView)initWithPreviewProvider:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)UITextHighlightView;
  double v5 = *MEMORY[0x1E4F1DB28];
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v9 = -[UIView initWithFrame:](&v25, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], v6, v7, v8);
  if (v9)
  {
    double v10 = _Block_copy(v4);
    id previewProvider = v9->_previewProvider;
    v9->_id previewProvider = v10;

    double v12 = -[_UITextHighlightBackgroundView initWithFrame:]([_UITextHighlightBackgroundView alloc], "initWithFrame:", v5, v6, v7, v8);
    backgroundView = v9->_backgroundView;
    v9->_backgroundView = v12;

    [(UIView *)v9 addSubview:v9->_backgroundView];
    uint64_t v14 = [MEMORY[0x1E4F39C88] layer];
    contentClippingMaskLayer = v9->_contentClippingMaskLayer;
    v9->_contentClippingMaskLayer = (CAShapeLayer *)v14;

    uint64_t v16 = _UIGetTextHighlightFillColor();
    fillColor = v9->_fillColor;
    v9->_fillColor = (UIColor *)v16;

    long long v18 = [UIVisualEffectView alloc];
    v19 = [(UITextHighlightView *)v9 _fillEffect];
    uint64_t v20 = [(UIVisualEffectView *)v18 initWithEffect:v19];
    contentClippingEffectView = v9->_contentClippingEffectView;
    v9->_contentClippingEffectView = (UIVisualEffectView *)v20;

    [(UIView *)v9->_contentClippingEffectView setClipsToBounds:1];
    CGRect v22 = v9->_contentClippingMaskLayer;
    v23 = [(UIView *)v9->_contentClippingEffectView layer];
    [v23 setMask:v22];

    [(UIView *)v9 addSubview:v9->_contentClippingEffectView];
  }

  return v9;
}

- (id)_fillEffect
{
  v2 = [(UITextHighlightView *)self fillColor];
  id v3 = +[UIColorEffect colorEffectMonochromeTint:v2 blendingAmount:1.0 brightnessAdjustment:0.25];

  return v3;
}

- (void)setFillColor:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    _UIGetTextHighlightFillColor();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  id obj = v4;
  if (![(UIColor *)self->_fillColor isEqual:v4])
  {
    objc_storeStrong((id *)&self->_fillColor, obj);
    uint64_t v5 = [obj CGColor];
    double v6 = [(_UITextHighlightBackgroundView *)self->_backgroundView highlightLayer];
    [v6 setFillColor:v5];

    double v7 = [(UITextHighlightView *)self _fillEffect];
    [(UIVisualEffectView *)self->_contentClippingEffectView setEffect:v7];
  }
}

- (void)animateWithCompletion:(id)a3
{
  id v4 = a3;
  [(UIView *)self setAlpha:1.0];
  CGAffineTransformMakeScale(&v10, 1.2, 1.2);
  CGAffineTransform v9 = v10;
  [(UIView *)self setTransform:&v9];
  id v7 = v4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __45__UITextHighlightView_animateWithCompletion___block_invoke;
  v8[3] = &unk_1E52D9F70;
  v8[4] = self;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__UITextHighlightView_animateWithCompletion___block_invoke_2;
  v6[3] = &unk_1E52D9FE8;
  id v5 = v4;
  +[UIView animateWithDuration:2048 delay:v8 options:v6 animations:0.15 completion:0.0];
}

uint64_t __45__UITextHighlightView_animateWithCompletion___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  long long v2 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v4[0] = *MEMORY[0x1E4F1DAB8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  return [v1 setTransform:v4];
}

uint64_t __45__UITextHighlightView_animateWithCompletion___block_invoke_2(uint64_t result, int a2)
{
  if (a2)
  {
    result = *(void *)(result + 32);
    if (result) {
      return (*(uint64_t (**)(void))(result + 16))();
    }
  }
  return result;
}

- (void)fadeAwayWithCompletion:(id)a3
{
  id v6 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__UITextHighlightView_fadeAwayWithCompletion___block_invoke;
  v7[3] = &unk_1E52D9F70;
  v7[4] = self;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__UITextHighlightView_fadeAwayWithCompletion___block_invoke_2;
  v5[3] = &unk_1E52D9FE8;
  id v4 = v6;
  +[UIView animateWithDuration:0 delay:v7 options:v5 animations:0.2 completion:0.3];
}

uint64_t __46__UITextHighlightView_fadeAwayWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __46__UITextHighlightView_fadeAwayWithCompletion___block_invoke_2(uint64_t result, int a2)
{
  if (a2)
  {
    result = *(void *)(result + 32);
    if (result) {
      return (*(uint64_t (**)(void))(result + 16))();
    }
  }
  return result;
}

- (void)_updateWithPreviewParameters:(id)a3
{
  p_padding = &self->_padding;
  id v5 = a3;
  [v5 _textPathInsets];
  p_padding->top = v6;
  p_padding->left = v7;
  p_padding->bottom = v8;
  p_padding->right = v9;
  CGAffineTransform v10 = [v5 visiblePath];

  double v11 = (void *)[v10 copy];
  [v11 bounds];
  memset(&v16, 0, sizeof(v16));
  CGAffineTransformMakeTranslation(&v16, -v12, -v13);
  CGAffineTransform v15 = v16;
  [v11 applyTransform:&v15];
  [(_UITextHighlightBackgroundView *)self->_backgroundView setVisiblePath:v11];
  id v14 = v11;
  -[CAShapeLayer setPath:](self->_contentClippingMaskLayer, "setPath:", [v14 CGPath]);
}

- (void)setOverriddenPreviewParameters:(id)a3
{
  id v5 = a3;
  if (!-[UIPreviewParameters isEqual:](self->_overriddenPreviewParameters, "isEqual:"))
  {
    [(UITextHighlightView *)self invalidateContentView];
    objc_storeStrong((id *)&self->_overriddenPreviewParameters, a3);
    [(UITextHighlightView *)self _updateWithPreviewParameters:v5];
  }
}

- (void)invalidateContentView
{
  self->_contentViewValid = 0;
  [(UIView *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v30.receiver = self;
  v30.super_class = (Class)UITextHighlightView;
  [(UIView *)&v30 layoutSubviews];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __37__UITextHighlightView_layoutSubviews__block_invoke;
  v29[3] = &unk_1E52D9F70;
  v29[4] = self;
  +[UIView performWithoutAnimation:v29];
  if (!self->_contentViewValid)
  {
    id v3 = (*((void (**)(void))self->_previewProvider + 2))();
    id v4 = v3;
    if (v3)
    {
      if (!self->_overriddenPreviewParameters)
      {
        id v5 = [v3 parameters];
        [(UITextHighlightView *)self _updateWithPreviewParameters:v5];
      }
      [(UIView *)self->_contentView removeFromSuperview];
      CGFloat v6 = [v4 view];
      contentView = self->_contentView;
      self->_contentView = v6;

      CGFloat v8 = [(UIVisualEffectView *)self->_contentClippingEffectView contentView];
      [v8 addSubview:self->_contentView];
      CGFloat v9 = [v4 view];
      [v9 frame];
      double v11 = v10;
      double v13 = v12;
      double v15 = v14;
      double v17 = v16;
      long long v18 = [v4 target];
      v19 = [v18 container];
      objc_msgSend(v8, "convertRect:fromView:", v19, v11, v13, v15, v17);
      uint64_t v21 = v20;
      uint64_t v23 = v22;
      uint64_t v25 = v24;
      uint64_t v27 = v26;

      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __37__UITextHighlightView_layoutSubviews__block_invoke_2;
      v28[3] = &unk_1E52DA520;
      v28[4] = self;
      v28[5] = v21;
      v28[6] = v23;
      v28[7] = v25;
      v28[8] = v27;
      +[UIView performWithoutAnimation:v28];
    }
    else
    {
      [(UIView *)self->_contentView removeFromSuperview];
      CGFloat v8 = self->_contentView;
      self->_contentView = 0;
    }

    self->_contentViewValid = 1;
  }
}

uint64_t __37__UITextHighlightView_layoutSubviews__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) bounds];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 456), "setFrame:");
  [*(id *)(a1 + 32) bounds];
  long long v2 = *(void **)(*(void *)(a1 + 32) + 464);
  return objc_msgSend(v2, "setFrame:");
}

uint64_t __37__UITextHighlightView_layoutSubviews__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 480), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (id)previewProvider
{
  return self->_previewProvider;
}

- (UIPreviewParameters)overriddenPreviewParameters
{
  return self->_overriddenPreviewParameters;
}

- (UIColor)fillColor
{
  return self->_fillColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fillColor, 0);
  objc_storeStrong(&self->_previewProvider, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_contentClippingMaskLayer, 0);
  objc_storeStrong((id *)&self->_contentClippingEffectView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_overriddenPreviewParameters, 0);
}

@end