@interface UIAccessibilityHUDLayoutManager
- (CGRect)imageViewFrameForHUD:(id)a3 preferredSizeForLabel:(CGSize)a4;
- (CGRect)labelFrameForHUD:(id)a3 preferredSize:(CGSize)a4;
- (CGRect)layoutBoundsForHUD:(id)a3;
- (CGSize)imageViewSizeForHUD:(id)a3 preferredSizeForLabel:(CGSize)a4;
- (CGSize)minimumUnscaledSizeForHUD:(id)a3 preferredLabelSize:(CGSize)a4;
- (CGSize)preferredSizeForLabelInHUD:(id)a3 maximumWidth:(double)a4;
- (CGSize)unscaledSizeForHUD:(id)a3 containingSize:(CGSize)a4;
- (UIEdgeInsets)imageInsetsForHUD:(id)a3;
- (double)_imageCenterToTopForHUD:(id)a3 preferredSizeForLabel:(CGSize)a4;
- (id)containerViewForHUD:(id)a3;
- (id)itemContainerViewForHUD:(id)a3;
- (id)labelFontForHUD:(id)a3;
- (unint64_t)_actualNumberOfLinesForLabelInHUD:(id)a3 preferredSize:(CGSize)a4;
- (void)layoutSubviewsOfHUD:(id)a3;
@end

@implementation UIAccessibilityHUDLayoutManager

- (CGSize)unscaledSizeForHUD:(id)a3 containingSize:(CGSize)a4
{
  CGFloat v5 = a4.width + -32.0;
  id v6 = a3;
  [(UIAccessibilityHUDLayoutManager *)self preferredSizeForLabelInHUD:v6 maximumWidth:v5];
  -[UIAccessibilityHUDLayoutManager minimumUnscaledSizeForHUD:preferredLabelSize:](self, "minimumUnscaledSizeForHUD:preferredLabelSize:", v6);
  UIRoundToViewScale(v6);
  double v8 = v7;
  UIRoundToViewScale(v6);
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (CGSize)minimumUnscaledSizeForHUD:(id)a3 preferredLabelSize:(CGSize)a4
{
  double v4 = a4.width + 32.0;
  BOOL v5 = a4.width < 75.0;
  double v6 = 107.0;
  if (!v5) {
    double v6 = v4;
  }
  double v7 = a4.height + 123.0 + 24.0;
  result.height = v7;
  result.width = v6;
  return result;
}

- (CGRect)layoutBoundsForHUD:(id)a3
{
  v3 = [(UIAccessibilityHUDLayoutManager *)self containerViewForHUD:a3];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (id)containerViewForHUD:(id)a3
{
  return (id)[a3 containerViewForLayout];
}

- (id)itemContainerViewForHUD:(id)a3
{
  return (id)[a3 itemContainerViewForLayout];
}

- (UIEdgeInsets)imageInsetsForHUD:(id)a3
{
  [a3 imageInsetsForLayout];
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (CGSize)imageViewSizeForHUD:(id)a3 preferredSizeForLabel:(CGSize)a4
{
  double height = a4.height;
  id v6 = a3;
  [(UIAccessibilityHUDLayoutManager *)self layoutBoundsForHUD:v6];
  double v7 = CGRectGetWidth(v26) + -32.0;
  if (height == 0.0) {
    double v8 = v7;
  }
  else {
    double v8 = 80.0;
  }
  double v9 = [v6 item];
  int v10 = [v9 scaleImage];

  if (!v10) {
    goto LABEL_12;
  }
  double v11 = [v6 item];
  double v12 = [v11 image];
  [v12 size];
  double v14 = v13;
  double v16 = v15;

  *(double *)&uint64_t v17 = 75.0;
  if (v14 >= 75.0 || (*(double *)&uint64_t v18 = 75.0, v16 >= 75.0))
  {
    if (v14 > v7 || v16 > v8)
    {
      *(double *)&uint64_t v17 = v7;
      *(double *)&uint64_t v18 = v8;
      goto LABEL_13;
    }
LABEL_12:
    v20 = [v6 imageView];
    objc_msgSend(v20, "sizeThatFits:", v7, v8);
    uint64_t v17 = v21;
    uint64_t v18 = v22;
  }
LABEL_13:

  double v23 = *(double *)&v17;
  double v24 = *(double *)&v18;
  result.double height = v24;
  result.width = v23;
  return result;
}

- (CGRect)imageViewFrameForHUD:(id)a3 preferredSizeForLabel:(CGSize)a4
{
  double height = a4.height;
  double v35 = a4.height;
  double width = a4.width;
  CGFloat v33 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  CGFloat v34 = *MEMORY[0x1E4F1DB28];
  id v7 = a3;
  -[UIAccessibilityHUDLayoutManager imageViewSizeForHUD:preferredSizeForLabel:](self, "imageViewSizeForHUD:preferredSizeForLabel:", v7, width, height);
  CGFloat v9 = v8;
  double v11 = v10;
  [(UIAccessibilityHUDLayoutManager *)self layoutBoundsForHUD:v7];
  CGFloat x = v36.origin.x;
  CGFloat y = v36.origin.y;
  CGFloat v14 = v36.size.width;
  CGFloat v15 = v36.size.height;
  CGRectGetMinX(v36);
  v37.origin.CGFloat x = x;
  v37.origin.CGFloat y = y;
  v37.size.double width = v14;
  v37.size.double height = v15;
  CGRectGetWidth(v37);
  v38.origin.CGFloat y = v33;
  v38.origin.CGFloat x = v34;
  double v16 = v9;
  v38.size.double width = v9;
  v38.size.double height = v11;
  CGRectGetWidth(v38);
  UIRoundToViewScale(v7);
  double v18 = v17;
  -[UIAccessibilityHUDLayoutManager _imageCenterToTopForHUD:preferredSizeForLabel:](self, "_imageCenterToTopForHUD:preferredSizeForLabel:", v7, width, v35);
  UIRoundToViewScale(v7);
  double v20 = v19;
  [(UIAccessibilityHUDLayoutManager *)self imageInsetsForHUD:v7];
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;

  double v29 = v18 + v24;
  double v30 = v20 + v22;
  double v31 = v16 - (v24 + v28);
  double v32 = v11 - (v22 + v26);
  result.size.double height = v32;
  result.size.double width = v31;
  result.origin.CGFloat y = v30;
  result.origin.CGFloat x = v29;
  return result;
}

- (CGRect)labelFrameForHUD:(id)a3 preferredSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  double v34 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v35 = *MEMORY[0x1E4F1DB28];
  id v7 = a3;
  [(UIAccessibilityHUDLayoutManager *)self layoutBoundsForHUD:v7];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  double v16 = v8 + v12 * 0.5;
  double v17 = v10 + v14 * 0.5;
  double v18 = [v7 window];
  double v19 = [v18 screen];
  [v19 scale];
  UIRectCenteredAboutPointScale(v35, v34, width, height, v16, v17, v20);
  double v22 = v21;
  double v24 = v23;
  double v36 = v25;

  -[UIAccessibilityHUDLayoutManager _imageCenterToTopForHUD:preferredSizeForLabel:](self, "_imageCenterToTopForHUD:preferredSizeForLabel:", v7, width, height);
  v37.origin.CGFloat x = v9;
  v37.origin.CGFloat y = v11;
  v37.size.double width = v13;
  v37.size.double height = v15;
  CGRectGetHeight(v37);
  UIRoundToViewScale(v7);
  double v27 = v26;
  v38.origin.CGFloat x = v9;
  v38.origin.CGFloat y = v11;
  v38.size.double width = v13;
  v38.size.double height = v15;
  CGRectGetHeight(v38);
  UIRoundToViewScale(v7);
  double v29 = v28;

  if (v27 >= v29) {
    double v30 = v29;
  }
  else {
    double v30 = v27;
  }
  double v31 = v22;
  double v32 = v24;
  double v33 = v36;
  result.size.double height = v33;
  result.size.double width = v32;
  result.origin.CGFloat y = v30;
  result.origin.CGFloat x = v31;
  return result;
}

- (id)labelFontForHUD:(id)a3
{
  return (id)[off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleTitle1"];
}

- (CGSize)preferredSizeForLabelInHUD:(id)a3 maximumWidth:(double)a4
{
  double v5 = [a3 titleLabel];
  objc_msgSend(v5, "sizeThatFits:", a4, 3.40282347e38);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (void)layoutSubviewsOfHUD:(id)a3
{
  id v22 = a3;
  double v4 = [(UIAccessibilityHUDLayoutManager *)self itemContainerViewForHUD:v22];
  double v5 = [v22 imageView];
  double v6 = [v22 titleLabel];
  [(UIAccessibilityHUDLayoutManager *)self layoutBoundsForHUD:v22];
  [(UIAccessibilityHUDLayoutManager *)self preferredSizeForLabelInHUD:v22 maximumWidth:CGRectGetWidth(v24) + -32.0];
  double v8 = v7;
  double v10 = v9;
  -[UIAccessibilityHUDLayoutManager imageViewFrameForHUD:preferredSizeForLabel:](self, "imageViewFrameForHUD:preferredSizeForLabel:", v22);
  double x = v25.origin.x;
  double y = v25.origin.y;
  double width = v25.size.width;
  double height = v25.size.height;
  if (CGRectIsEmpty(v25)
    || ([v5 image], CGFloat v15 = objc_claimAutoreleasedReturnValue(), v15, !v15))
  {
    double v17 = [v5 superview];

    if (v17) {
      [v5 removeFromSuperview];
    }
  }
  else
  {
    double v16 = [v5 superview];

    if (!v16) {
      [v4 addSubview:v5];
    }
    objc_msgSend(v5, "setFrame:", x, y, width, height);
  }
  double v18 = [v6 text];
  uint64_t v19 = [v18 length];

  double v20 = [v6 superview];

  if (v19)
  {
    if (!v20) {
      [v4 addSubview:v6];
    }
    LODWORD(v21) = 0.75;
    [v6 _setHyphenationFactor:v21];
    -[UIAccessibilityHUDLayoutManager labelFrameForHUD:preferredSize:](self, "labelFrameForHUD:preferredSize:", v22, v8, v10);
    objc_msgSend(v6, "setFrame:");
  }
  else if (v20)
  {
    [v6 removeFromSuperview];
  }
}

- (unint64_t)_actualNumberOfLinesForLabelInHUD:(id)a3 preferredSize:(CGSize)a4
{
  double height = a4.height;
  double v5 = objc_msgSend(a3, "titleLabel", a4.width);
  double v6 = [v5 font];
  [v6 _bodyLeading];
  double v8 = v7;

  return vcvtad_u64_f64(height / v8);
}

- (double)_imageCenterToTopForHUD:(id)a3 preferredSizeForLabel:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  [(UIAccessibilityHUDLayoutManager *)self layoutBoundsForHUD:v7];
  CGFloat v12 = v8;
  CGFloat v13 = v9;
  CGFloat v14 = v10;
  CGFloat v15 = v11;
  if (width == *MEMORY[0x1E4F1DB30] && height == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    double MidY = CGRectGetMidY(*(CGRect *)&v8);
  }
  else
  {
    double v17 = dbl_186B92680[-[UIAccessibilityHUDLayoutManager _actualNumberOfLinesForLabelInHUD:preferredSize:](self, "_actualNumberOfLinesForLabelInHUD:preferredSize:", v7, width, height) > 1];
    v21.origin.double x = v12;
    v21.origin.double y = v13;
    v21.size.double width = v14;
    v21.size.double height = v15;
    double v18 = CGRectGetMaxY(v21) + -24.0 - height + -16.0 + -37.0;
    if (v17 >= v18) {
      double MidY = v18;
    }
    else {
      double MidY = v17;
    }
  }

  return MidY;
}

@end