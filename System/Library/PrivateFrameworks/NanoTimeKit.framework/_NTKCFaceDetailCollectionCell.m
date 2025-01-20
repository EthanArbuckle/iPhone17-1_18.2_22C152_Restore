@interface _NTKCFaceDetailCollectionCell
+ (double)outlineLineWidth;
+ (id)reuseIdentifier;
- (BOOL)active;
- (BOOL)disabled;
- (BOOL)is3Lines;
- (CGRect)swatchFrame;
- (NSString)text;
- (UIImage)image;
- (_NTKCFaceDetailCollectionCell)initWithFrame:(CGRect)a3;
- (double)outlineOutset;
- (int64_t)style;
- (int64_t)swatchImageContentMode;
- (void)layoutSubviews;
- (void)setActive:(BOOL)a3;
- (void)setActive:(BOOL)a3 animated:(BOOL)a4;
- (void)setActive:(BOOL)a3 animated:(BOOL)a4 forced:(BOOL)a5;
- (void)setDisabled:(BOOL)a3;
- (void)setDisabled:(BOOL)a3 animated:(BOOL)a4;
- (void)setImage:(id)a3;
- (void)setOutlineOutset:(double)a3;
- (void)setStyle:(int64_t)a3;
- (void)setSwatchFrame:(CGRect)a3;
- (void)setSwatchImageContentMode:(int64_t)a3;
- (void)setText:(id)a3;
@end

@implementation _NTKCFaceDetailCollectionCell

+ (id)reuseIdentifier
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

+ (double)outlineLineWidth
{
  uint64_t v2 = NTKCScreenStyle();
  double result = 2.66666667;
  if (v2 != 1) {
    return 2.5;
  }
  return result;
}

- (_NTKCFaceDetailCollectionCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  v20.receiver = self;
  v20.super_class = (Class)_NTKCFaceDetailCollectionCell;
  v5 = -[_NTKCFaceDetailCollectionCell initWithFrame:](&v20, sel_initWithFrame_, a3.origin.x, a3.origin.y);
  if (v5)
  {
    uint64_t v6 = objc_opt_new();
    imageView = v5->_imageView;
    v5->_imageView = (UIImageView *)v6;

    [(UIImageView *)v5->_imageView setContentMode:1];
    v8 = [(_NTKCFaceDetailCollectionCell *)v5 contentView];
    [v8 addSubview:v5->_imageView];

    uint64_t v9 = [MEMORY[0x1E4F39C88] layer];
    outlineView = v5->_outlineView;
    v5->_outlineView = (CAShapeLayer *)v9;

    id v11 = [MEMORY[0x1E4FB1618] clearColor];
    -[CAShapeLayer setFillColor:](v5->_outlineView, "setFillColor:", [v11 CGColor]);

    NTKCOutlineColor(1);
    id v12 = objc_claimAutoreleasedReturnValue();
    -[CAShapeLayer setStrokeColor:](v5->_outlineView, "setStrokeColor:", [v12 CGColor]);

    [(id)objc_opt_class() outlineLineWidth];
    -[CAShapeLayer setLineWidth:](v5->_outlineView, "setLineWidth:");
    [(CAShapeLayer *)v5->_outlineView setHidden:1];
    v13 = [(_NTKCFaceDetailCollectionCell *)v5 contentView];
    v14 = [v13 layer];
    [v14 addSublayer:v5->_outlineView];

    uint64_t v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", 0.0, 0.0, width, height);
    disabledDimmingView = v5->_disabledDimmingView;
    v5->_disabledDimmingView = (UIView *)v15;

    v17 = [MEMORY[0x1E4FB1618] blackColor];
    [(UIView *)v5->_disabledDimmingView setBackgroundColor:v17];

    [(UIView *)v5->_disabledDimmingView setAlpha:0.0];
    v18 = [(_NTKCFaceDetailCollectionCell *)v5 contentView];
    [v18 addSubview:v5->_disabledDimmingView];
  }
  return v5;
}

- (void)setSwatchFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_swatchFrame = &self->_swatchFrame;
  if (!CGRectEqualToRect(a3, self->_swatchFrame))
  {
    p_swatchFrame->origin.CGFloat x = x;
    p_swatchFrame->origin.CGFloat y = y;
    p_swatchFrame->size.CGFloat width = width;
    p_swatchFrame->size.CGFloat height = height;
    [(_NTKCFaceDetailCollectionCell *)self setNeedsLayout];
  }
}

- (void)setOutlineOutset:(double)a3
{
  double v3 = a3 - self->_outlineOutset;
  if (v3 < 0.0) {
    double v3 = -v3;
  }
  if (v3 > 0.00000011920929)
  {
    self->_outlineOutset = a3;
    [(_NTKCFaceDetailCollectionCell *)self setNeedsLayout];
  }
}

- (void)setImage:(id)a3
{
}

- (void)setSwatchImageContentMode:(int64_t)a3
{
}

- (void)setText:(id)a3
{
  id v12 = a3;
  id v4 = [(_NTKCFaceDetailCollectionCellLabel *)self->_label text];

  v5 = v12;
  if (v4 != v12)
  {
    uint64_t v6 = [v12 length];
    label = self->_label;
    if (v6)
    {
      if (!label)
      {
        v8 = (_NTKCFaceDetailCollectionCellLabel *)objc_opt_new();
        uint64_t v9 = self->_label;
        self->_label = v8;

        [(_NTKCFaceDetailCollectionCellLabel *)self->_label setUsesShortTextWidth:CGRectGetWidth(self->_swatchFrame) < 90.0];
        v10 = [(_NTKCFaceDetailCollectionCell *)self contentView];
        [v10 insertSubview:self->_label belowSubview:self->_disabledDimmingView];

        label = self->_label;
      }
      [(_NTKCFaceDetailCollectionCellLabel *)label setText:v12];
    }
    else
    {
      v5 = v12;
      if (!label) {
        goto LABEL_9;
      }
      [(_NTKCFaceDetailCollectionCellLabel *)label removeFromSuperview];
      id v11 = self->_label;
      self->_label = 0;
    }
    [(_NTKCFaceDetailCollectionCell *)self setNeedsLayout];
    v5 = v12;
  }
LABEL_9:
}

- (void)setStyle:(int64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    id v4 = [MEMORY[0x1E4F19A30] currentDevice];
    uint64_t v5 = [v4 deviceCategory];

    double v6 = 0.0;
    if (v5 == 2)
    {
      unint64_t v7 = self->_style - 2;
      if (v7 <= 2) {
        double v6 = dbl_1BC8A0538[v7];
      }
    }
    v8 = [MEMORY[0x1E4F19A30] currentDevice];
    uint64_t v9 = [v8 deviceCategory];

    if (v9 == 3)
    {
      unint64_t v10 = self->_style - 2;
      if (v10 <= 2) {
        double v6 = dbl_1BC8A0550[v10];
      }
    }
    id v11 = [MEMORY[0x1E4F19A30] currentDevice];
    unint64_t v12 = [v11 deviceCategory];

    if (v12 >= 4 && (unint64_t)(self->_style - 2) <= 2)
    {
      v13 = [MEMORY[0x1E4F19A30] currentDevice];
      [v13 screenCornerRadius];
      double v15 = v14;
      double Height = CGRectGetHeight(self->_swatchFrame);
      v17 = [MEMORY[0x1E4F19A30] currentDevice];
      [v17 screenBounds];
      double v6 = v15 * (Height / CGRectGetHeight(v21));
    }
    imageView = self->_imageView;
    if (v6 == 0.0) {
      [(UIImageView *)imageView _setCornerRadius:0.0];
    }
    else {
      [(UIImageView *)imageView _setContinuousCornerRadius:v6];
    }
    v19 = self->_imageView;
    [(UIImageView *)v19 setClipsToBounds:v6 != 0.0];
  }
}

- (void)layoutSubviews
{
  v59.receiver = self;
  v59.super_class = (Class)_NTKCFaceDetailCollectionCell;
  [(_NTKCFaceDetailCollectionCell *)&v59 layoutSubviews];
  double outlineOutset = self->_outlineOutset;
  [(CAShapeLayer *)self->_outlineView lineWidth];
  double v5 = outlineOutset + v4;
  [(CAShapeLayer *)self->_outlineView frame];
  p_swatchFrame = &self->_swatchFrame;
  CGFloat v7 = CGRectGetMinX(self->_swatchFrame) - v5;
  CGFloat v8 = CGRectGetWidth(self->_swatchFrame) + v5 * 2.0;
  CGFloat v9 = CGRectGetMinY(self->_swatchFrame) - v5;
  double v10 = CGRectGetHeight(self->_swatchFrame) + v5 * 2.0;
  CGFloat v57 = v8;
  CGFloat v58 = v7;
  CGFloat rect = v9;
  -[CAShapeLayer setFrame:](self->_outlineView, "setFrame:", v7, v9, v8, v10);
  [(CAShapeLayer *)self->_outlineView bounds];
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  [(CAShapeLayer *)self->_outlineView lineWidth];
  CGFloat v20 = v19 * 0.5;
  [(CAShapeLayer *)self->_outlineView lineWidth];
  CGFloat v22 = v21 * 0.5;
  v60.origin.double x = v12;
  v60.origin.double y = v14;
  v60.size.double width = v16;
  v60.size.double height = v18;
  CGRect v61 = CGRectInset(v60, v20, v22);
  double x = v61.origin.x;
  double y = v61.origin.y;
  double width = v61.size.width;
  double height = v61.size.height;
  if (self->_style <= 1uLL)
  {
    v27 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithOvalInRect:", v61.origin.x, v61.origin.y, v61.size.width, v61.size.height);
    goto LABEL_14;
  }
  v28 = [MEMORY[0x1E4F19A30] currentDevice];
  uint64_t v29 = [v28 deviceCategory];

  if (v29 == 2)
  {
    unint64_t v30 = self->_style - 2;
    double v31 = 6.0;
    if (v30 < 3)
    {
      v32 = (double *)&unk_1BC8A0568;
LABEL_9:
      double v31 = v32[v30];
    }
  }
  else
  {
    v33 = [MEMORY[0x1E4F19A30] currentDevice];
    uint64_t v34 = [v33 deviceCategory];

    if (v34 != 3)
    {
      v35 = [MEMORY[0x1E4F19A30] currentDevice];
      unint64_t v36 = [v35 deviceCategory];

      double v31 = 6.0;
      if (v36 >= 4 && (unint64_t)(self->_style - 2) <= 2)
      {
        v37 = [MEMORY[0x1E4F19A30] currentDevice];
        [v37 screenCornerRadius];
        double v39 = v38;
        v62.origin.double x = p_swatchFrame->origin.x;
        v62.origin.double y = self->_swatchFrame.origin.y;
        v62.size.double width = self->_swatchFrame.size.width;
        v62.size.double height = self->_swatchFrame.size.height;
        double v40 = CGRectGetHeight(v62);
        v41 = [MEMORY[0x1E4F19A30] currentDevice];
        [v41 screenBounds];
        double v42 = v39 * (v40 / CGRectGetHeight(v63));

        [(CAShapeLayer *)self->_outlineView lineWidth];
        double v31 = v42 + v5 + v43 * -0.5;
      }
      goto LABEL_13;
    }
    unint64_t v30 = self->_style - 2;
    double v31 = 6.0;
    if (v30 < 3)
    {
      v32 = (double *)&unk_1BC8A0580;
      goto LABEL_9;
    }
  }
LABEL_13:
  v27 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRoundedRect:cornerRadius:", x, y, width, height, v31);
LABEL_14:
  id v44 = v27;
  -[CAShapeLayer setPath:](self->_outlineView, "setPath:", [v44 CGPath]);
  -[UIImageView setFrame:](self->_imageView, "setFrame:", p_swatchFrame->origin.x, self->_swatchFrame.origin.y, self->_swatchFrame.size.width, self->_swatchFrame.size.height);
  label = self->_label;
  if (label)
  {
    [(_NTKCFaceDetailCollectionCellLabel *)label frame];
    UIRectCenteredXInRectScale();
    double v47 = v46;
    double v49 = v48;
    double v51 = v50;
    v64.size.double width = v57;
    v64.origin.double x = v58;
    v64.origin.double y = rect;
    v64.size.double height = v10;
    double MaxY = CGRectGetMaxY(v64);
    double v53 = 18.0;
    if (!self->_active) {
      double v53 = 14.0;
    }
    double v54 = MaxY + v53;
    [(_NTKCFaceDetailCollectionCellLabel *)self->_label firstLineBaseline];
    -[_NTKCFaceDetailCollectionCellLabel setFrame:](self->_label, "setFrame:", v47, v54 - v55, v49, v51);
  }
  [(_NTKCFaceDetailCollectionCell *)self bounds];
  -[UIView setFrame:](self->_disabledDimmingView, "setFrame:");
}

- (void)setDisabled:(BOOL)a3
{
}

- (void)setDisabled:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_disabled != a3)
  {
    self->_disabled = a3;
    if (a3)
    {
      -[_NTKCFaceDetailCollectionCell setActive:](self, "setActive:", 0, a4);
      double v5 = 0.75;
    }
    else
    {
      [(_NTKCFaceDetailCollectionCell *)self setActive:self->_active animated:1 forced:1];
      double v5 = 0.0;
    }
    disabledDimmingView = self->_disabledDimmingView;
    [(UIView *)disabledDimmingView setAlpha:v5];
  }
}

- (void)setActive:(BOOL)a3
{
}

- (void)setActive:(BOOL)a3 animated:(BOOL)a4
{
}

- (void)setActive:(BOOL)a3 animated:(BOOL)a4 forced:(BOOL)a5
{
  if (self->_active != a3 || a5)
  {
    self->_active = a3;
    if (!self->_disabled || !a3)
    {
      if (!a4)
      {
        [MEMORY[0x1E4F39CF8] begin];
        [MEMORY[0x1E4F39CF8] setDisableActions:1];
        *(_DWORD *)&a3 = self->_active;
      }
      [(CAShapeLayer *)self->_outlineView setHidden:!a3];
      [(_NTKCFaceDetailCollectionCellLabel *)self->_label setActive:self->_active];
      if (!a4) {
        [MEMORY[0x1E4F39CF8] commit];
      }
      [(_NTKCFaceDetailCollectionCell *)self setNeedsLayout];
    }
  }
}

- (BOOL)is3Lines
{
  return [(_NTKCFaceDetailCollectionCellLabel *)self->_label is3Lines];
}

- (CGRect)swatchFrame
{
  double x = self->_swatchFrame.origin.x;
  double y = self->_swatchFrame.origin.y;
  double width = self->_swatchFrame.size.width;
  double height = self->_swatchFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (double)outlineOutset
{
  return self->_outlineOutset;
}

- (int64_t)swatchImageContentMode
{
  return self->_swatchImageContentMode;
}

- (UIImage)image
{
  return self->_image;
}

- (NSString)text
{
  return self->_text;
}

- (int64_t)style
{
  return self->_style;
}

- (BOOL)active
{
  return self->_active;
}

- (BOOL)disabled
{
  return self->_disabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_disabledDimmingView, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_outlineView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end