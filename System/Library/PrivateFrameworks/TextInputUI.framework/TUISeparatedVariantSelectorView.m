@interface TUISeparatedVariantSelectorView
+ (double)minCellDimension;
+ (int64_t)hitTestingMode;
- (BOOL)drawsBackground;
- (BOOL)drawsShadows;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)shouldProvideDefaultSelection;
- (BOOL)wantsUserInteractionEnabled;
- (UIEdgeInsets)stackLayoutMargins;
- (double)itemSpacing;
- (double)variantViewBottomSpacing;
- (id)variantCellWithString:(id)a3 annotation:(id)a4;
- (id)widthConstraintsForVariantCell:(id)a3 previousCell:(id)a4;
- (int64_t)variantViewAlignment;
- (unint64_t)maxRows;
- (unint64_t)variantRowLimitForLayout;
- (void)layoutSubviews;
@end

@implementation TUISeparatedVariantSelectorView

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v8 = [(TUIKeyPopupView *)self variantView];
  -[TUISeparatedVariantSelectorView convertPoint:toView:](self, "convertPoint:toView:", v8, x, y);
  double v10 = v9;
  double v12 = v11;

  v13 = [(TUIKeyPopupView *)self variantView];
  LOBYTE(v8) = objc_msgSend(v13, "pointInside:withEvent:", v7, v10, v12);

  return (char)v8;
}

- (BOOL)shouldProvideDefaultSelection
{
  return 0;
}

- (unint64_t)maxRows
{
  v3 = [(TUIKeyPopupView *)self associatedTree];
  if ([v3 variantType] == 4)
  {

    return 5;
  }
  v4 = [(TUIKeyPopupView *)self associatedTree];
  int v5 = [v4 variantType];

  if (v5 == 7) {
    return 5;
  }
  v7.receiver = self;
  v7.super_class = (Class)TUISeparatedVariantSelectorView;
  return [(TUIKeyPopupView *)&v7 maxRows];
}

- (unint64_t)variantRowLimitForLayout
{
  v3 = [(TUIKeyPopupView *)self associatedTree];
  if ([v3 variantType] == 4)
  {

    return 10;
  }
  v4 = [(TUIKeyPopupView *)self associatedTree];
  int v5 = [v4 variantType];

  if (v5 == 7) {
    return 10;
  }
  return 12;
}

- (int64_t)variantViewAlignment
{
  v3 = [(TUIKeyPopupView *)self associatedTree];
  if ([v3 variantType] == 4)
  {

    return 3;
  }
  v4 = [(TUIKeyPopupView *)self associatedTree];
  int v5 = [v4 variantType];

  if (v5 == 7) {
    return 3;
  }
  return 1;
}

- (BOOL)drawsShadows
{
  return 0;
}

- (BOOL)drawsBackground
{
  return 0;
}

- (BOOL)wantsUserInteractionEnabled
{
  return 1;
}

- (double)variantViewBottomSpacing
{
  return 11.0;
}

- (double)itemSpacing
{
  return 4.0;
}

- (UIEdgeInsets)stackLayoutMargins
{
  double v2 = 8.0;
  double v3 = 8.0;
  double v4 = 8.0;
  double v5 = 8.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (id)variantCellWithString:(id)a3 annotation:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [TUISeparatedVariantCell alloc];
  double v9 = [(TUIKeyPopupView *)self renderTraits];
  double v10 = -[TUISeparatedVariantCell initWithFrame:string:annotation:traits:](v8, "initWithFrame:string:annotation:traits:", v7, v6, v9, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));

  double v11 = [(TUIKeyPopupView *)self touchesForwardingView];
  double v12 = [v11 superview];
  [(TUISeparatedVariantCell *)v10 setTouchesForwardingView:v12];

  return v10;
}

- (id)widthConstraintsForVariantCell:(id)a3 previousCell:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [a3 widthAnchor];
  if (v5)
  {
    id v7 = [v5 widthAnchor];
    v8 = [v6 constraintEqualToAnchor:v7];
    v14[0] = v8;
    double v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  }
  else
  {
    [(id)objc_opt_class() minCellDimension];
    double v10 = objc_msgSend(v6, "constraintEqualToConstant:");

    LODWORD(v11) = 1144766464;
    [v10 setPriority:v11];
    v13 = v10;
    double v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
    id v6 = v10;
  }

  return v9;
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)TUISeparatedVariantSelectorView;
  [(TUIKeyPopupView *)&v11 layoutSubviews];
  [(TUISeparatedVariantSelectorView *)self stackLayoutMargins];
  double v5 = v3 + v4;
  id v6 = [(TUIKeyPopupView *)self arrangedVariantRows];
  id v7 = [v6 firstObject];
  [v7 bounds];
  double v8 = (v5 + CGRectGetHeight(v12)) * 0.5;
  double v9 = [(TUIKeyPopupView *)self variantView];
  double v10 = [v9 layer];
  [v10 setCornerRadius:v8];
}

+ (int64_t)hitTestingMode
{
  return 1;
}

+ (double)minCellDimension
{
  return 60.0;
}

@end