@interface _UIBlendingHighlightView
+ (BOOL)isBorderView;
+ (id)_blendingPressedView;
+ (id)_blendingSeparatorView;
- (UIEdgeInsets)_effectiveNonDirectionalContentInsets;
- (_UIBlendingHighlightView)initWithCompositingBurnColor:(id)a3 plusDColor:(id)a4;
- (_UIBlendingHighlightView)initWithTopLevelFilters:(id)a3 compositingColors:(id)a4 compositingFilterModes:(id)a5;
- (double)cornerRadius;
- (void)_enumerateAllBlendingViewsWithBlock:(id)a3;
- (void)_enumerateBlendingBorderViewsWithBlock:(id)a3;
- (void)_setContinuousCornerRadius:(double)a3;
- (void)layoutSubviews;
- (void)setCornerRadius:(double)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setRoundedCornerPosition:(unint64_t)a3;
@end

@implementation _UIBlendingHighlightView

+ (BOOL)isBorderView
{
  return 0;
}

- (_UIBlendingHighlightView)initWithTopLevelFilters:(id)a3 compositingColors:(id)a4 compositingFilterModes:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = [v10 count];
  if (v12 != [v11 count])
  {
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2 object:self file:@"_UIBlendingHighlightView.m" lineNumber:30 description:@"Invalid parameter.  Blending colors/modes must have same number of items"];
  }
  v28.receiver = self;
  v28.super_class = (Class)_UIBlendingHighlightView;
  v13 = -[UIView initWithFrame:](&v28, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v14 = v13;
  if (v13)
  {
    v15 = [(UIView *)v13 layer];
    [v15 setAllowsGroupBlending:0];

    -[UIView setDirectionalLayoutMargins:](v14, "setDirectionalLayoutMargins:", 0.0, 0.0, 0.0, 0.0);
    if ([v9 count])
    {
      v16 = [(UIView *)v14 layer];
      [v16 setFilters:v9];
    }
    uint64_t v17 = [MEMORY[0x1E4F1CA48] array];
    blendingViews = v14->_blendingViews;
    v14->_blendingViews = (NSMutableArray *)v17;

    if ([v10 count])
    {
      unint64_t v19 = 0;
      do
      {
        v20 = [v10 objectAtIndexedSubscript:v19];
        v21 = [v11 objectAtIndexedSubscript:v19];
        v22 = [UIView alloc];
        [(UIView *)v14 bounds];
        v23 = -[UIView initWithFrame:](v22, "initWithFrame:");
        [(UIView *)v23 setTranslatesAutoresizingMaskIntoConstraints:0];
        if ([(id)objc_opt_class() isBorderView])
        {
          v24 = [(UIView *)v23 layer];
          objc_msgSend(v24, "setBorderColor:", objc_msgSend(v20, "CGColor"));
        }
        else
        {
          [(UIView *)v23 setBackgroundColor:v20];
        }
        v25 = [(UIView *)v23 layer];
        [v25 setCompositingFilter:v21];

        [(NSMutableArray *)v14->_blendingViews addObject:v23];
        [(UIView *)v14 addSubview:v23];

        ++v19;
      }
      while (v19 < [v10 count]);
    }
    [(UIView *)v14 setTranslatesAutoresizingMaskIntoConstraints:0];
  }

  return v14;
}

- (_UIBlendingHighlightView)initWithCompositingBurnColor:(id)a3 plusDColor:(id)a4
{
  v15[2] = *MEMORY[0x1E4F143B8];
  v15[0] = a3;
  v15[1] = a4;
  v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 arrayWithObjects:v15 count:2];
  uint64_t v10 = *MEMORY[0x1E4F3A2E0];
  v14[0] = *MEMORY[0x1E4F3A008];
  v14[1] = v10;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];

  uint64_t v12 = [(_UIBlendingHighlightView *)self initWithTopLevelFilters:MEMORY[0x1E4F1CBF0] compositingColors:v9 compositingFilterModes:v11];
  return v12;
}

- (UIEdgeInsets)_effectiveNonDirectionalContentInsets
{
  [(UIView *)self directionalLayoutMargins];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v11 = [(UIView *)self traitCollection];
  uint64_t v12 = [v11 layoutDirection];

  if (v12 == 1) {
    double v13 = v6;
  }
  else {
    double v13 = v10;
  }
  if (v12 == 1) {
    double v14 = v10;
  }
  else {
    double v14 = v6;
  }
  double v15 = v4;
  double v16 = v8;
  result.right = v13;
  result.bottom = v16;
  result.left = v14;
  result.top = v15;
  return result;
}

- (void)layoutSubviews
{
  [(_UIBlendingHighlightView *)self _effectiveNonDirectionalContentInsets];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v17.receiver = self;
  v17.super_class = (Class)_UIBlendingHighlightView;
  [(UIView *)&v17 layoutSubviews];
  [(UIView *)self bounds];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __42___UIBlendingHighlightView_layoutSubviews__block_invoke;
  v16[3] = &__block_descriptor_64_e16_v16__0__UIView_8l;
  *(double *)&v16[4] = v6 + v11;
  *(double *)&v16[5] = v4 + v12;
  *(double *)&v16[6] = v13 - (v6 + v10);
  *(double *)&v16[7] = v14 - (v4 + v8);
  [(_UIBlendingHighlightView *)self _enumerateAllBlendingViewsWithBlock:v16];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __42___UIBlendingHighlightView_layoutSubviews__block_invoke_2;
  void v15[3] = &unk_1E53105D8;
  v15[4] = self;
  [(_UIBlendingHighlightView *)self _enumerateBlendingBorderViewsWithBlock:v15];
}

+ (id)_blendingSeparatorView
{
  id v2 = objc_alloc((Class)objc_opt_class());
  double v3 = +[UIColor _vibrantLightDividerBurnColor];
  double v4 = +[UIColor _vibrantLightDividerDarkeningColor];
  double v5 = (void *)[v2 initWithCompositingBurnColor:v3 plusDColor:v4];

  return v5;
}

+ (id)_blendingPressedView
{
  id v2 = objc_alloc((Class)objc_opt_class());
  double v3 = +[UIColor _vibrantLightFillBurnColor];
  double v4 = +[UIColor _vibrantLightFillDarkeningColor];
  double v5 = (void *)[v2 initWithCompositingBurnColor:v3 plusDColor:v4];

  return v5;
}

- (void)setCornerRadius:(double)a3
{
  double v5 = [(UIView *)self layer];
  [v5 setCornerRadius:a3];

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44___UIBlendingHighlightView_setCornerRadius___block_invoke;
  v6[3] = &__block_descriptor_40_e16_v16__0__UIView_8l;
  *(double *)&v6[4] = a3;
  [(_UIBlendingHighlightView *)self _enumerateAllBlendingViewsWithBlock:v6];
}

- (void)_setContinuousCornerRadius:(double)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIBlendingHighlightView;
  -[UIView _setContinuousCornerRadius:](&v6, sel__setContinuousCornerRadius_);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55___UIBlendingHighlightView__setContinuousCornerRadius___block_invoke;
  v5[3] = &__block_descriptor_40_e16_v16__0__UIView_8l;
  *(double *)&v5[4] = a3;
  [(_UIBlendingHighlightView *)self _enumerateAllBlendingViewsWithBlock:v5];
}

- (void)setRoundedCornerPosition:(unint64_t)a3
{
  double v5 = [(UIView *)self layer];
  [v5 setMaskedCorners:a3];

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53___UIBlendingHighlightView_setRoundedCornerPosition___block_invoke;
  v6[3] = &__block_descriptor_40_e16_v16__0__UIView_8l;
  v6[4] = a3;
  [(_UIBlendingHighlightView *)self _enumerateAllBlendingViewsWithBlock:v6];
}

- (void)setHighlighted:(BOOL)a3
{
}

- (void)_enumerateBlendingBorderViewsWithBlock:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  double v4 = (void (**)(id, void))a3;
  if ([(id)objc_opt_class() isBorderView])
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    double v5 = self->_blendingViews;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * v9++));
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (void)_enumerateAllBlendingViewsWithBlock:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  double v4 = (void (**)(id, void))a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  double v5 = self->_blendingViews;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void).cxx_destruct
{
}

@end