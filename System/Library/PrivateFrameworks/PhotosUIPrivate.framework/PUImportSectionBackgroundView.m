@interface PUImportSectionBackgroundView
- (BOOL)needsBottomStrokeViewUpdate;
- (BOOL)needsStroke;
- (UIColor)bottomStrokeColor;
- (UIView)bottomStrokeView;
- (double)strokeWidth;
- (void)applyLayoutAttributes:(id)a3;
- (void)layoutSubviews;
- (void)setBottomStrokeColor:(id)a3;
- (void)setBottomStrokeView:(id)a3;
- (void)setNeedsBottomStrokeViewUpdate;
- (void)setNeedsBottomStrokeViewUpdate:(BOOL)a3;
- (void)setStrokeWidth:(double)a3;
- (void)updateBottomStrokeViewIfNeeded;
@end

@implementation PUImportSectionBackgroundView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomStrokeView, 0);
  objc_storeStrong((id *)&self->_bottomStrokeColor, 0);
}

- (void)setNeedsBottomStrokeViewUpdate:(BOOL)a3
{
  self->_needsBottomStrokeViewUpdate = a3;
}

- (BOOL)needsBottomStrokeViewUpdate
{
  return self->_needsBottomStrokeViewUpdate;
}

- (void)setBottomStrokeView:(id)a3
{
}

- (UIView)bottomStrokeView
{
  return self->_bottomStrokeView;
}

- (UIColor)bottomStrokeColor
{
  return self->_bottomStrokeColor;
}

- (double)strokeWidth
{
  return self->_strokeWidth;
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)PUImportSectionBackgroundView;
  [(PUImportSectionBackgroundView *)&v13 layoutSubviews];
  v3 = [(PUImportSectionBackgroundView *)self bottomStrokeView];
  v4 = [v3 superview];

  if (v4)
  {
    [(PUImportSectionBackgroundView *)self bounds];
    CGRect v15 = CGRectIntegral(v14);
    double x = v15.origin.x;
    double width = v15.size.width;
    double MaxY = CGRectGetMaxY(v15);
    [(PUImportSectionBackgroundView *)self strokeWidth];
    double v9 = MaxY - v8;
    [(PUImportSectionBackgroundView *)self strokeWidth];
    double v11 = v10;
    v12 = [(PUImportSectionBackgroundView *)self bottomStrokeView];
    objc_msgSend(v12, "setFrame:", x, v9, width, v11);
  }
}

- (void)setBottomStrokeColor:(id)a3
{
  unint64_t v5 = (unint64_t)a3;
  bottomStrokeColor = self->_bottomStrokeColor;
  if (v5 | (unint64_t)bottomStrokeColor)
  {
    unint64_t v8 = v5;
    char v7 = [(UIColor *)bottomStrokeColor isEqual:v5];
    unint64_t v5 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_bottomStrokeColor, a3);
      [(PUImportSectionBackgroundView *)self setNeedsBottomStrokeViewUpdate];
      unint64_t v5 = v8;
    }
  }
}

- (void)setStrokeWidth:(double)a3
{
  if (self->_strokeWidth != a3)
  {
    self->_strokeWidth = a3;
    [(PUImportSectionBackgroundView *)self setNeedsBottomStrokeViewUpdate];
  }
}

- (BOOL)needsStroke
{
  double v10 = 0.0;
  v3 = [(PUImportSectionBackgroundView *)self bottomStrokeColor];
  [v3 getRed:0 green:0 blue:0 alpha:&v10];

  [(PUImportSectionBackgroundView *)self strokeWidth];
  char v4 = 1;
  if (v5 != 0.0 && v10 != 0.0)
  {
    v6 = [(PUImportSectionBackgroundView *)self bottomStrokeColor];
    if (v6)
    {
      char v7 = [(PUImportSectionBackgroundView *)self bottomStrokeColor];
      unint64_t v8 = [MEMORY[0x1E4FB1618] clearColor];
      char v4 = [v7 isEqual:v8];
    }
  }
  return v4 ^ 1;
}

- (void)updateBottomStrokeViewIfNeeded
{
  if ([(PUImportSectionBackgroundView *)self needsBottomStrokeViewUpdate])
  {
    [(PUImportSectionBackgroundView *)self setNeedsBottomStrokeViewUpdate:0];
    BOOL v3 = [(PUImportSectionBackgroundView *)self needsStroke];
    char v4 = [(PUImportSectionBackgroundView *)self bottomStrokeView];
    id v11 = v4;
    if (v3)
    {

      if (!v11)
      {
        id v5 = objc_alloc(MEMORY[0x1E4FB1EB0]);
        v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
        [(PUImportSectionBackgroundView *)self setBottomStrokeView:v6];

        char v7 = [(PUImportSectionBackgroundView *)self bottomStrokeView];
        [v7 setAutoresizingMask:8];
      }
      unint64_t v8 = [(PUImportSectionBackgroundView *)self bottomStrokeView];
      [(PUImportSectionBackgroundView *)self addSubview:v8];

      double v9 = [(PUImportSectionBackgroundView *)self bottomStrokeColor];
      double v10 = [(PUImportSectionBackgroundView *)self bottomStrokeView];
      [v10 setBackgroundColor:v9];

      [(PUImportSectionBackgroundView *)self setNeedsLayout];
    }
    else
    {
      [v4 removeFromSuperview];
    }
  }
}

- (void)setNeedsBottomStrokeViewUpdate
{
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PUImportSectionBackgroundView;
  [(PUImportSectionBackgroundView *)&v8 applyLayoutAttributes:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [v5 backgroundColor];
    [(PUImportSectionBackgroundView *)self setBackgroundColor:v6];

    [v5 strokeWidth];
    -[PUImportSectionBackgroundView setStrokeWidth:](self, "setStrokeWidth:");
    char v7 = [v5 bottomStrokeColor];

    [(PUImportSectionBackgroundView *)self setBottomStrokeColor:v7];
    [(PUImportSectionBackgroundView *)self updateBottomStrokeViewIfNeeded];
  }
}

@end