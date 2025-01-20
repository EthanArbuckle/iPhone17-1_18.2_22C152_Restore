@interface PKPGSVSectionHeader_BackgroundProvisioningHintView
- (CGSize)sizeThatFits:(CGSize)a3;
- (double)_layoutSubviewsInBounds:(double)a3 withCommitMode:(double)a4;
- (void)_updateFonts:(uint64_t)a1;
- (void)layoutSubviews;
@end

@implementation PKPGSVSectionHeader_BackgroundProvisioningHintView

- (void)_updateFonts:(uint64_t)a1
{
  if (a1)
  {
    v4 = [(id)a1 traitCollection];
    *(void *)(a1 + 424) = 0xBFF0000000000000;
    id v7 = v4;
    v5 = (void *)_PKFontForDesign(v4, (void *)*MEMORY[0x1E4FB0928], (void *)*MEMORY[0x1E4FB28C8], 0, 0, 0);
    [*(id *)(a1 + 408) setFont:v5];
    [*(id *)(a1 + 416) sizeToFit];
    if ((a2 & 1) == 0)
    {
      [(id)a1 setNeedsLayout];
      uint64_t v6 = *(void *)(a1 + 448);
      if (v6) {
        (*(void (**)(void))(v6 + 16))();
      }
    }
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = -[PKPGSVSectionHeader_BackgroundProvisioningHintView _layoutSubviewsInBounds:withCommitMode:]((uint64_t)self, 0, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a3.width);
  result.height = v4;
  result.width = v3;
  return result;
}

- (double)_layoutSubviewsInBounds:(double)a3 withCommitMode:(double)a4
{
  if (!a1) {
    return 0.0;
  }
  int v8 = [(id)a1 _shouldReverseLayoutDirection];
  if (v8) {
    CGRectEdge v9 = CGRectMaxXEdge;
  }
  else {
    CGRectEdge v9 = CGRectMinXEdge;
  }
  [*(id *)(a1 + 416) frame];
  CGFloat v11 = v10;
  uint64_t v37 = v12;
  double v38 = a5;
  double v13 = v10 + 10.0;
  double v14 = fmax(a5 - (v10 + 10.0), 0.0);
  if (*(double *)(a1 + 424) == v14)
  {
    double v15 = a5;
    double v16 = *(double *)(a1 + 432);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 408), "sizeThatFits:", v14, 1.79769313e308);
    double v16 = fmin(v18, v14);
    if (a2)
    {
      *(double *)(a1 + 424) = v14;
      *(double *)(a1 + 432) = v16;
      *(void *)(a1 + 440) = v17;
    }
    double v15 = v38;
  }
  if (v15 - v16 < v13 + v13) {
    PKSizeAlignedInRect();
  }
  PKSizeAlignedInRect();
  CGFloat v23 = v19;
  CGFloat v24 = v20;
  CGFloat v25 = v21;
  CGFloat v26 = v22;
  if (a2) {
    objc_msgSend(*(id *)(a1 + 408), "setFrame:", v19, v20, v21, v22);
  }
  memset(&slice, 0, sizeof(slice));
  remainder.origin.x = v23;
  remainder.origin.y = v24;
  remainder.size.width = v25;
  remainder.size.CGFloat height = v26;
  v27 = objc_msgSend(*(id *)(a1 + 408), "font", v37);
  [v27 lineHeight];
  CGFloat v29 = v28;
  v41.origin.x = v23;
  v41.origin.y = v24;
  v41.size.width = v25;
  v41.size.CGFloat height = v26;
  CGRectDivide(v41, &slice, &remainder, v29, CGRectMinYEdge);
  CGFloat height = slice.size.height;
  double v31 = -v13;
  if (v8) {
    double v32 = 0.0;
  }
  else {
    double v32 = -v13;
  }
  if (!v8) {
    double v31 = 0.0;
  }
  double v33 = v32 + slice.origin.x;
  CGFloat v34 = slice.origin.y + 0.0;
  CGFloat v35 = slice.size.width - (v32 + v31);
  remainder.origin.x = v32 + slice.origin.x;
  remainder.origin.y = slice.origin.y + 0.0;
  remainder.size.width = v35;
  remainder.size.CGFloat height = slice.size.height;
  CGRectDivide(*(CGRect *)(&height - 3), &slice, &remainder, v11, v9);
  PKSizeAlignedInRect();
  if (a2) {
    objc_msgSend(*(id *)(a1 + 416), "setFrame:");
  }

  return v38;
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)PKPGSVSectionHeader_BackgroundProvisioningHintView;
  [(PKPGSVSectionHeader_BackgroundProvisioningHintView *)&v6 layoutSubviews];
  [(PKPGSVSectionHeader_BackgroundProvisioningHintView *)self bounds];
  -[PKPGSVSectionHeader_BackgroundProvisioningHintView _layoutSubviewsInBounds:withCommitMode:]((uint64_t)self, 1, v3, v4, v5);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_observer, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

@end