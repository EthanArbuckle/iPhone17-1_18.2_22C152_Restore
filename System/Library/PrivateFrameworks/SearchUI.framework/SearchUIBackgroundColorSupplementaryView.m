@interface SearchUIBackgroundColorSupplementaryView
- (BOOL)highlighted;
- (SearchUIBackgroundColorSupplementaryView)initWithFrame:(CGRect)a3;
- (SearchUIBackgroundColorView)colorView;
- (TLKProminenceView)highlightView;
- (unint64_t)maskedCorners;
- (void)setColorView:(id)a3;
- (void)setHighlightView:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setMaskedCorners:(unint64_t)a3;
- (void)tlks_setCornerRadius:(double)a3 withStyle:(id)a4;
@end

@implementation SearchUIBackgroundColorSupplementaryView

- (SearchUIBackgroundColorSupplementaryView)initWithFrame:(CGRect)a3
{
  v16.receiver = self;
  v16.super_class = (Class)SearchUIBackgroundColorSupplementaryView;
  v3 = -[SearchUIBackgroundColorSupplementaryView initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_msgSend(MEMORY[0x1E4FAE120], "viewWithProminence:", +[SearchUIFocusStyleUtilities secondaryHaloProminence](SearchUIFocusStyleUtilities, "secondaryHaloProminence"));
    [(SearchUIBackgroundColorSupplementaryView *)v3 setHighlightView:v4];

    +[SearchUIAutoLayout selectionBorderWidth];
    double v6 = v5;
    v7 = [(SearchUIBackgroundColorSupplementaryView *)v3 highlightView];
    [v7 setBorderWidth:v6];

    uint64_t v8 = [(SearchUIBackgroundColorSupplementaryView *)v3 highlighted] ^ 1;
    v9 = [(SearchUIBackgroundColorSupplementaryView *)v3 highlightView];
    [v9 setHidden:v8];

    v10 = [(SearchUIBackgroundColorSupplementaryView *)v3 highlightView];
    [(SearchUIBackgroundColorSupplementaryView *)v3 addSubview:v10];

    v11 = [(SearchUIBackgroundColorSupplementaryView *)v3 highlightView];
    +[SearchUIAutoLayout fillContainerWithView:v11];

    v12 = objc_opt_new();
    [(SearchUIBackgroundColorSupplementaryView *)v3 setColorView:v12];

    v13 = [(SearchUIBackgroundColorSupplementaryView *)v3 colorView];
    [(SearchUIBackgroundColorSupplementaryView *)v3 addSubview:v13];

    v14 = [(SearchUIBackgroundColorSupplementaryView *)v3 colorView];
    +[SearchUIAutoLayout fillContainerWithView:v14];
  }
  return v3;
}

- (void)setHighlighted:(BOOL)a3
{
  self->_highlighted = a3;
  uint64_t v4 = [(SearchUIBackgroundColorSupplementaryView *)self highlighted] ^ 1;
  double v5 = [(SearchUIBackgroundColorSupplementaryView *)self highlightView];
  [v5 setHidden:v4];

  +[SearchUIAutoLayout selectionBorderWidth];
  CGFloat v7 = -v6;
  [(SearchUIBackgroundColorSupplementaryView *)self bounds];
  CGRect v15 = CGRectInset(v14, v7, v7);
  double x = v15.origin.x;
  double y = v15.origin.y;
  double width = v15.size.width;
  double height = v15.size.height;
  id v12 = [(SearchUIBackgroundColorSupplementaryView *)self highlightView];
  objc_msgSend(v12, "setFrame:", x, y, width, height);
}

- (void)tlks_setCornerRadius:(double)a3 withStyle:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)SearchUIBackgroundColorSupplementaryView;
  id v6 = a4;
  [(SearchUIBackgroundColorSupplementaryView *)&v10 tlks_setCornerRadius:v6 withStyle:a3];
  CGFloat v7 = [(SearchUIBackgroundColorSupplementaryView *)self colorView];
  objc_msgSend(v7, "tlks_setCornerRadius:withStyle:", v6, a3);

  uint64_t v8 = [(SearchUIBackgroundColorSupplementaryView *)self highlightView];
  +[SearchUIAutoLayout selectionBorderWidth];
  objc_msgSend(v8, "tlks_setCornerRadius:withStyle:", v6, v9 + a3);
}

- (void)setMaskedCorners:(unint64_t)a3
{
  self->_maskedCorners = a3;
  double v5 = [(SearchUIBackgroundColorSupplementaryView *)self colorView];
  [v5 setMaskedCorners:a3];

  id v7 = [(SearchUIBackgroundColorSupplementaryView *)self highlightView];
  id v6 = [v7 layer];
  [v6 setMaskedCorners:a3];
}

- (SearchUIBackgroundColorView)colorView
{
  return self->_colorView;
}

- (void)setColorView:(id)a3
{
}

- (BOOL)highlighted
{
  return self->_highlighted;
}

- (unint64_t)maskedCorners
{
  return self->_maskedCorners;
}

- (TLKProminenceView)highlightView
{
  return self->_highlightView;
}

- (void)setHighlightView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_colorView, 0);
}

@end