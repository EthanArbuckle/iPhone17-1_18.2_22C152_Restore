@interface TUISeparatedVariantCell
- (TUISeparatedVariantCell)initWithFrame:(CGRect)a3 string:(id)a4 annotation:(id)a5 traits:(id)a6;
- (UIEdgeInsets)annotationLabelInsets;
- (UIEdgeInsets)backgroundInsets;
- (UIEdgeInsets)labelInsets;
- (UIView)touchesForwardingView;
- (double)backgroundCornerRadius;
- (id)highlightColor;
- (void)setTouchesForwardingView:(id)a3;
- (void)transitionToHighlighted:(BOOL)a3;
@end

@implementation TUISeparatedVariantCell

- (void).cxx_destruct
{
}

- (void)setTouchesForwardingView:(id)a3
{
}

- (UIView)touchesForwardingView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_touchesForwardingView);
  return (UIView *)WeakRetained;
}

- (void)transitionToHighlighted:(BOOL)a3
{
  if (a3) {
    double v5 = 0.05;
  }
  else {
    double v5 = 0.2;
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__TUISeparatedVariantCell_transitionToHighlighted___block_invoke;
  v8[3] = &unk_1E55942B0;
  v8[4] = self;
  BOOL v9 = a3;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:2 delay:v8 options:&__block_literal_global_2616 animations:v5 completion:0.0];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__TUISeparatedVariantCell_transitionToHighlighted___block_invoke_3;
  v6[3] = &unk_1E55942B0;
  v6[4] = self;
  BOOL v7 = a3;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:0 delay:v6 options:&__block_literal_global_35 animations:v5 completion:0.0];
}

void __51__TUISeparatedVariantCell_transitionToHighlighted___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    double v1 = 0.2;
  }
  else {
    double v1 = 0.0;
  }
  id v2 = [*(id *)(a1 + 32) backgroundView];
  [v2 setAlpha:v1];
}

uint64_t __51__TUISeparatedVariantCell_transitionToHighlighted___block_invoke_3(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    CGAffineTransformMakeScale(&v6, 0.9, 0.9);
  }
  else
  {
    long long v2 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v6.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v6.c = v2;
    *(_OWORD *)&v6.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  }
  v3 = *(void **)(a1 + 32);
  CGAffineTransform v5 = v6;
  return [v3 setTransform:&v5];
}

- (id)highlightColor
{
  return (id)[MEMORY[0x1E4FB1618] whiteColor];
}

- (UIEdgeInsets)annotationLabelInsets
{
  double v2 = 10.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = -10.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (UIEdgeInsets)labelInsets
{
  double v2 = 4.0;
  double v3 = 4.0;
  double v4 = 4.0;
  double v5 = 4.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (UIEdgeInsets)backgroundInsets
{
  double v2 = *MEMORY[0x1E4FB2848];
  double v3 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v4 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v5 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (double)backgroundCornerRadius
{
  double v2 = [(TUIVariantCell *)self backgroundView];
  [v2 frame];
  double v3 = CGRectGetHeight(v5) * 0.5;

  return v3;
}

- (TUISeparatedVariantCell)initWithFrame:(CGRect)a3 string:(id)a4 annotation:(id)a5 traits:(id)a6
{
  v7.receiver = self;
  v7.super_class = (Class)TUISeparatedVariantCell;
  return -[TUIVariantCell initWithFrame:string:annotation:traits:](&v7, sel_initWithFrame_string_annotation_traits_, a4, a5, a6, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

@end