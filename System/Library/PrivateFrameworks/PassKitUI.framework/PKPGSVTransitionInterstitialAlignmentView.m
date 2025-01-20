@interface PKPGSVTransitionInterstitialAlignmentView
- (CGPoint)alignmentRectAnchorPoint;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKPGSVTransitionInterstitialAlignmentView)init;
- (PKPGSVTransitionInterstitialAlignmentView)initWithFrame:(CGRect)a3;
- (PKPGSVTransitionInterstitialAlignmentView)initWithView:(id)a3 alignmentRectInsetsAdjustmentProvider:(id)a4;
- (UIEdgeInsets)alignmentRectInsets;
- (UIView)view;
- (void)layoutSubviews;
- (void)setAlignmentRectAnchorPoint:(CGPoint)a3;
- (void)sizeToFit;
@end

@implementation PKPGSVTransitionInterstitialAlignmentView

- (PKPGSVTransitionInterstitialAlignmentView)init
{
  return 0;
}

- (PKPGSVTransitionInterstitialAlignmentView)initWithFrame:(CGRect)a3
{
  return 0;
}

- (PKPGSVTransitionInterstitialAlignmentView)initWithView:(id)a3 alignmentRectInsetsAdjustmentProvider:(id)a4
{
  id v7 = a3;
  result = (PKPGSVTransitionInterstitialAlignmentView *)a4;
  if (v7 && (v9 = result) != 0)
  {
    v19.receiver = self;
    v19.super_class = (Class)PKPGSVTransitionInterstitialAlignmentView;
    v10 = -[PKPGSVTransitionInterstitialAlignmentView initWithFrame:](&v19, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    v11 = v10;
    if (v10)
    {
      objc_storeStrong((id *)&v10->_view, a3);
      v12 = _Block_copy(v9);
      id provider = v11->_provider;
      v11->_id provider = v12;

      __asm { FMOV            V0.2D, #0.5 }
      v11->_alignmentRectAnchorPoint = _Q0;
      [(PKPGSVTransitionInterstitialAlignmentView *)v11 addSubview:v11->_view];
      [(PKPGSVTransitionInterstitialAlignmentView *)v11 sizeToFit];
    }

    return v11;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (UIEdgeInsets)alignmentRectInsets
{
  double top = self->_effectiveAlignmentInsets.top;
  double left = self->_effectiveAlignmentInsets.left;
  double bottom = self->_effectiveAlignmentInsets.bottom;
  double right = self->_effectiveAlignmentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)sizeToFit
{
  p_alignmentInsets = &self->_alignmentInsets;
  [(UIView *)self->_view alignmentRectInsets];
  p_alignmentInsets->double top = v4;
  p_alignmentInsets->double left = v5;
  p_alignmentInsets->double bottom = v6;
  p_alignmentInsets->double right = v7;
  CGFloat v8 = (*((double (**)(void))self->_provider + 2))();
  self->_alignmentInsetAdjustments.double top = v8;
  self->_alignmentInsetAdjustments.double left = v9;
  self->_alignmentInsetAdjustments.double bottom = v10;
  self->_alignmentInsetAdjustments.double right = v11;
  CGFloat v12 = p_alignmentInsets->top - v8;
  CGFloat v13 = p_alignmentInsets->left - v9;
  double right = p_alignmentInsets->right;
  CGFloat v15 = p_alignmentInsets->bottom - v10;
  p_effectiveAlignmentInsets = &self->_effectiveAlignmentInsets;
  self->_effectiveAlignmentInsets.double top = v12;
  self->_effectiveAlignmentInsets.double left = v13;
  self->_effectiveAlignmentInsets.double bottom = v15;
  self->_effectiveAlignmentInsets.double right = right - v11;
  v21.receiver = self;
  v21.super_class = (Class)PKPGSVTransitionInterstitialAlignmentView;
  [(PKPGSVTransitionInterstitialAlignmentView *)&v21 sizeToFit];
  [(PKPGSVTransitionInterstitialAlignmentView *)self bounds];
  -[PKPGSVTransitionInterstitialAlignmentView setAnchorPoint:](self, "setAnchorPoint:", (v17+ p_effectiveAlignmentInsets->left+ self->_alignmentRectAnchorPoint.x * (v19 - (p_effectiveAlignmentInsets->left + p_effectiveAlignmentInsets->right))- v17)/ v19, (p_effectiveAlignmentInsets->top+ v18+ self->_alignmentRectAnchorPoint.y * (v20 - (p_effectiveAlignmentInsets->top + p_effectiveAlignmentInsets->bottom))- v18)/ v20);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [(UIView *)self->_view bounds];
  double v5 = fmax(v4 - (self->_alignmentInsetAdjustments.left + self->_alignmentInsetAdjustments.right), 0.0);
  double v7 = fmax(v6 - (self->_alignmentInsetAdjustments.top + self->_alignmentInsetAdjustments.bottom), 0.0);
  result.height = v7;
  result.width = v5;
  return result;
}

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)PKPGSVTransitionInterstitialAlignmentView;
  [(PKPGSVTransitionInterstitialAlignmentView *)&v9 layoutSubviews];
  [(PKPGSVTransitionInterstitialAlignmentView *)self bounds];
  [(UIView *)self->_view bounds];
  double v4 = v3;
  double v6 = v5;
  PKSizeAlignedInRect();
  -[UIView setFrame:](self->_view, "setFrame:", v7 - self->_effectiveAlignmentInsets.left - self->_alignmentInsets.left, v8 - self->_effectiveAlignmentInsets.top - self->_alignmentInsets.top, v4, v6);
}

- (UIView)view
{
  return self->_view;
}

- (CGPoint)alignmentRectAnchorPoint
{
  double x = self->_alignmentRectAnchorPoint.x;
  double y = self->_alignmentRectAnchorPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setAlignmentRectAnchorPoint:(CGPoint)a3
{
  self->_alignmentRectAnchorPoint = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_view, 0);

  objc_storeStrong(&self->_provider, 0);
}

@end