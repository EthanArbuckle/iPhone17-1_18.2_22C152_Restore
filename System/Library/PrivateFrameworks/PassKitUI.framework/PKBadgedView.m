@interface PKBadgedView
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)text;
- (PKBadgedView)init;
- (PKBadgedView)initWithFrame:(CGRect)a3;
- (PKBadgedView)initWithView:(id)a3 text:(id)a4;
- (UIEdgeInsets)alignmentRectInsets;
- (UIView)view;
- (uint64_t)_updateBadgeSize;
- (void)layoutSubviews;
- (void)setText:(id)a3;
- (void)sizeToFit;
@end

@implementation PKBadgedView

- (PKBadgedView)init
{
  return 0;
}

- (PKBadgedView)initWithFrame:(CGRect)a3
{
  return 0;
}

- (PKBadgedView)initWithView:(id)a3 text:(id)a4
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7) {
    __break(1u);
  }
  v9 = v8;
  v34.receiver = self;
  v34.super_class = (Class)PKBadgedView;
  double v10 = *MEMORY[0x1E4F1DB28];
  double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v14 = -[PKBadgedView initWithFrame:](&v34, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], v11, v12, v13);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_view, a3);
    [(PKBadgedView *)v15 addSubview:v15->_view];
    v16 = [PKButtonBadgeView alloc];
    id v17 = v9;
    if (v16)
    {
      v35.receiver = v16;
      v35.super_class = (Class)PKButtonBadgeView;
      v18 = -[PKBadgedView initWithFrame:](&v35, sel_initWithFrame_, v10, v11, v12, v13);
      if (v18)
      {
        uint64_t v19 = [v17 copy];
        CGFloat top = v18->_alignmentInsets.top;
        *(void *)&v18->_alignmentInsets.CGFloat top = v19;

        uint64_t v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v10, v11, v12, v13);
        badge = v18->_badge;
        v18->_badge = (PKButtonBadgeView *)v21;

        [(PKButtonBadgeView *)v18->_badge setText:*(void *)&v18->_alignmentInsets.top];
        v23 = v18->_badge;
        v24 = [MEMORY[0x1E4FB1618] whiteColor];
        [(PKButtonBadgeView *)v23 setTextColor:v24];

        v25 = v18->_badge;
        v26 = [MEMORY[0x1E4FB08E0] boldSystemFontOfSize:10.0];
        [(PKButtonBadgeView *)v25 setFont:v26];

        [(PKButtonBadgeView *)v18->_badge setTextAlignment:1];
        [(PKBadgedView *)v18 addSubview:v18->_badge];
        v27 = [MEMORY[0x1E4FB1618] systemRedColor];
        [(PKBadgedView *)v18 setBackgroundColor:v27];

        v28 = [(PKBadgedView *)v18 layer];
        id v29 = [MEMORY[0x1E4FB1618] whiteColor];
        objc_msgSend(v28, "setBorderColor:", objc_msgSend(v29, "CGColor"));

        [v28 setBorderWidth:1.0];
        [v28 setMasksToBounds:1];
      }
    }
    else
    {
      v18 = 0;
    }

    v30 = v15->_badge;
    v15->_badge = (PKButtonBadgeView *)v18;

    [(PKBadgedView *)v15 addSubview:v15->_badge];
    -[PKBadgedView _updateBadgeSize]((uint64_t)v15);
    v36[0] = objc_opt_class();
    v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:1];
    id v32 = (id)[(PKBadgedView *)v15 registerForTraitChanges:v31 withHandler:&__block_literal_global_57];
  }
  return v15;
}

- (uint64_t)_updateBadgeSize
{
  if (result)
  {
    uint64_t v1 = result;
    [*(id *)(result + 408) sizeToFit];
    [*(id *)(v1 + 408) frame];
    uint64_t v2 = [(id)v1 effectiveUserInterfaceLayoutDirection];
    PKFloatRoundToPixel();
    double v4 = v3;
    PKFloatRoundToPixel();
    if (v2 == 1) {
      double v6 = v4;
    }
    else {
      double v6 = 0.0;
    }
    *(void *)(v1 + 416) = v5;
    *(double *)(v1 + 424) = v6;
    if (v2 == 1) {
      double v7 = 0.0;
    }
    else {
      double v7 = v4;
    }
    *(void *)(v1 + 432) = 0;
    *(double *)(v1 + 440) = v7;
    return [(id)v1 setNeedsLayout];
  }
  return result;
}

uint64_t __34__PKBadgedView_initWithView_text___block_invoke(uint64_t a1, uint64_t a2)
{
  return -[PKBadgedView _updateBadgeSize](a2);
}

- (UIEdgeInsets)alignmentRectInsets
{
  double top = self->_alignmentInsets.top;
  double left = self->_alignmentInsets.left;
  double bottom = self->_alignmentInsets.bottom;
  double right = self->_alignmentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)PKBadgedView;
  [(PKBadgedView *)&v5 layoutSubviews];
  [(PKBadgedView *)self effectiveUserInterfaceLayoutDirection];
  [(PKBadgedView *)self bounds];
  view = self->_view;
  [(UIView *)view frame];
  -[UIView alignmentRectForFrame:](view, "alignmentRectForFrame:");
  PKSizeAlignedInRect();
  -[UIView frameForAlignmentRect:](view, "frameForAlignmentRect:");
  -[UIView setFrame:](view, "setFrame:");
  badge = self->_badge;
  [(PKButtonBadgeView *)badge frame];
  PKSizeAlignedInRect();
  -[PKButtonBadgeView setFrame:](badge, "setFrame:");
}

- (NSString)text
{
  badge = self->_badge;
  if (badge) {
    return badge->_text;
  }
  else {
    return (NSString *)0;
  }
}

- (void)setText:(id)a3
{
  badge = self->_badge;
  if (badge)
  {
    uint64_t v5 = [a3 copy];
    text = badge->_text;
    badge->_text = (NSString *)v5;

    [(UILabel *)badge->_label setText:badge->_text];
  }

  -[PKBadgedView _updateBadgeSize]((uint64_t)self);
}

- (void)sizeToFit
{
  v7.receiver = self;
  v7.super_class = (Class)PKBadgedView;
  [(PKBadgedView *)&v7 sizeToFit];
  [(PKBadgedView *)self bounds];
  -[PKBadgedView setAnchorPoint:](self, "setAnchorPoint:", (v3 + self->_alignmentInsets.left + (v5 - (self->_alignmentInsets.left + self->_alignmentInsets.right)) * 0.5 - v3)/ v5, (v4 + self->_alignmentInsets.top + (v6 - (self->_alignmentInsets.top + self->_alignmentInsets.bottom)) * 0.5 - v4)/ v6);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  view = self->_view;
  [(UIView *)view frame];
  -[UIView alignmentRectForFrame:](view, "alignmentRectForFrame:");
  double v6 = self->_alignmentInsets.left + v5 + self->_alignmentInsets.right;
  double v8 = v7 + self->_alignmentInsets.top + self->_alignmentInsets.bottom;
  result.height = v8;
  result.width = v6;
  return result;
}

- (UIView)view
{
  return self->_view;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_view, 0);

  objc_storeStrong((id *)&self->_badge, 0);
}

@end