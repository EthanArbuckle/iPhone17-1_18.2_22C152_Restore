@interface TUISeparatedFlickVariantCell
- (TUISeparatedFlickVariantCell)initWithFrame:(CGRect)a3 string:(id)a4 annotation:(id)a5 traits:(id)a6;
- (UIEdgeInsets)backgroundInsets;
- (UIEdgeInsets)labelInsets;
- (UIView)touchesForwardingView;
- (double)backgroundCornerRadius;
- (id)highlightColor;
- (unint64_t)cornerMaskForBackground;
- (void)setTouchesForwardingView:(id)a3;
- (void)transitionToHighlighted:(BOOL)a3;
@end

@implementation TUISeparatedFlickVariantCell

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

- (unint64_t)cornerMaskForBackground
{
  return 15;
}

- (void)transitionToHighlighted:(BOOL)a3
{
  double v3 = 0.2;
  v4[1] = 3221225472;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[2] = __56__TUISeparatedFlickVariantCell_transitionToHighlighted___block_invoke;
  v4[3] = &unk_1E55942B0;
  if (a3) {
    double v3 = 0.05;
  }
  v4[4] = self;
  BOOL v5 = a3;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:2 delay:v4 options:&__block_literal_global animations:v3 completion:0.0];
}

void __56__TUISeparatedFlickVariantCell_transitionToHighlighted___block_invoke(uint64_t a1)
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

- (id)highlightColor
{
  return (id)[MEMORY[0x1E4FB1618] whiteColor];
}

- (double)backgroundCornerRadius
{
  id v2 = [(TUIVariantCell *)self backgroundView];
  [v2 frame];
  double v3 = CGRectGetHeight(v5) * 0.5;

  return v3;
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

- (TUISeparatedFlickVariantCell)initWithFrame:(CGRect)a3 string:(id)a4 annotation:(id)a5 traits:(id)a6
{
  v7.receiver = self;
  v7.super_class = (Class)TUISeparatedFlickVariantCell;
  return -[TUIVariantCell initWithFrame:string:annotation:traits:](&v7, sel_initWithFrame_string_annotation_traits_, a4, 0, a6, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

@end