@interface _TVInspectorHighlightView
- (UIColor)borderColor;
- (UIColor)contentColor;
- (UILabel)descriptionLabel;
- (UIWindow)targetWindow;
- (_TVInspectorHighlightView)initWithFrame:(CGRect)a3;
- (void)highlightView:(id)a3;
- (void)layoutSubviews;
- (void)setBorderColor:(id)a3;
- (void)setContentColor:(id)a3;
- (void)setTargetWindow:(id)a3;
@end

@implementation _TVInspectorHighlightView

- (_TVInspectorHighlightView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  v21.receiver = self;
  v21.super_class = (Class)_TVInspectorHighlightView;
  v5 = -[_TVInspectorHighlightView initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y);
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x263F1CB60]);
    uint64_t v7 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), width, height);
    highlightView = v5->_highlightView;
    v5->_highlightView = (UIView *)v7;

    [(UIView *)v5->_highlightView setAlpha:0.5];
    v9 = v5->_highlightView;
    v10 = [MEMORY[0x263F1C550] greenColor];
    [(UIView *)v9 setBackgroundColor:v10];

    [(_TVInspectorHighlightView *)v5 addSubview:v5->_highlightView];
    [(_TVInspectorHighlightView *)v5 setUserInteractionEnabled:0];
    v11 = [MEMORY[0x263F1C550] clearColor];
    [(_TVInspectorHighlightView *)v5 setBackgroundColor:v11];

    [(_TVInspectorHighlightView *)v5 setOpaque:0];
    [(_TVInspectorHighlightView *)v5 setAlpha:1.0];
    v12 = [_TVInspectorHighlightMetadataView alloc];
    uint64_t v13 = -[_TVInspectorHighlightMetadataView initWithFrame:](v12, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    metadataView = v5->_metadataView;
    v5->_metadataView = (_TVInspectorHighlightMetadataView *)v13;

    v15 = v5->_metadataView;
    v16 = [MEMORY[0x263F1C550] colorWithRed:1.0 green:0.980392157 blue:0.803921569 alpha:1.0];
    [(_TVInspectorHighlightMetadataView *)v15 setBackgroundColor:v16];

    v17 = [(_TVInspectorHighlightMetadataView *)v5->_metadataView layer];
    id v18 = [MEMORY[0x263F1C550] blackColor];
    objc_msgSend(v17, "setBorderColor:", objc_msgSend(v18, "CGColor"));

    v19 = [(_TVInspectorHighlightMetadataView *)v5->_metadataView layer];
    [v19 setBorderWidth:1.0];

    [(_TVInspectorHighlightView *)v5 addSubview:v5->_metadataView];
  }
  return v5;
}

- (UILabel)descriptionLabel
{
  return [(_TVInspectorHighlightMetadataView *)self->_metadataView descriptionLabel];
}

- (void)setBorderColor:(id)a3
{
  v5 = (UIColor *)a3;
  if (self->_borderColor != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_borderColor, a3);
    id v6 = [(UIView *)self->_highlightView layer];
    objc_msgSend(v6, "setBorderColor:", -[UIColor CGColor](self->_borderColor, "CGColor"));

    uint64_t v7 = [(UIView *)self->_highlightView layer];
    [v7 setBorderWidth:1.0];

    v5 = v8;
  }
}

- (void)setContentColor:(id)a3
{
}

- (UIColor)contentColor
{
  return [(UIView *)self->_highlightView backgroundColor];
}

- (void)highlightView:(id)a3
{
  id v18 = a3;
  [(_TVInspectorHighlightView *)self removeFromSuperview];
  v4 = v18;
  if (v18)
  {
    v5 = [(_TVInspectorHighlightView *)self window];
    id v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      id v7 = [v18 window];
    }
    v8 = v7;

    v9 = [v18 superview];
    [v18 frame];
    objc_msgSend(v9, "convertRect:toView:", v8);
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;

    [v8 addSubview:self];
    [v8 bringSubviewToFront:self];
    -[_TVInspectorHighlightView setFrame:](self, "setFrame:", v11, v13, v15, v17);
    [(_TVInspectorHighlightView *)self setNeedsLayout];

    v4 = v18;
  }
}

- (void)layoutSubviews
{
  v88.receiver = self;
  v88.super_class = (Class)_TVInspectorHighlightView;
  [(_TVInspectorHighlightView *)&v88 layoutSubviews];
  [(_TVInspectorHighlightView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  highlightView = self->_highlightView;
  [(_TVInspectorHighlightView *)self bounds];
  -[UIView setFrame:](highlightView, "setFrame:");
  double v12 = objc_msgSend(NSString, "stringWithFormat:", @"%g x %g", *(void *)&v8, *(void *)&v10);
  double v13 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v12];
  uint64_t v14 = *MEMORY[0x263F1C238];
  double v15 = [MEMORY[0x263F1C658] monospacedDigitSystemFontOfSize:15.0 weight:0.0];
  objc_msgSend(v13, "addAttribute:value:range:", v14, v15, 0, objc_msgSend(v12, "length"));

  uint64_t v16 = *MEMORY[0x263F1C240];
  double v17 = [MEMORY[0x263F1C550] lightGrayColor];
  objc_msgSend(v13, "addAttribute:value:range:", v16, v17, 0, objc_msgSend(v12, "length"));

  id v18 = [MEMORY[0x263F1C550] blackColor];
  v19 = objc_msgSend(NSString, "stringWithFormat:", @"%g ", *(void *)&v8);
  uint64_t v20 = [v12 rangeOfString:v19];
  objc_msgSend(v13, "addAttribute:value:range:", v16, v18, v20, v21);

  v22 = [MEMORY[0x263F1C550] blackColor];
  v23 = objc_msgSend(NSString, "stringWithFormat:", @" %g", *(void *)&v10);
  uint64_t v24 = [v12 rangeOfString:v23];
  objc_msgSend(v13, "addAttribute:value:range:", v16, v22, v24, v25);

  v26 = [(_TVInspectorHighlightMetadataView *)self->_metadataView frameLabel];
  [v26 setAttributedText:v13];

  CGFloat v84 = 20.0;
  [(_TVInspectorHighlightMetadataView *)self->_metadataView sizeThatFits:1.79769313e308];
  double v28 = v27;
  v89.origin.x = v4;
  v89.origin.y = v6;
  v89.size.double width = v8;
  v89.size.double height = v10;
  CGFloat v29 = CGRectGetHeight(v89) + 5.0;
  v30 = [(_TVInspectorHighlightView *)self superview];
  [v30 bounds];
  CGFloat v32 = v31;
  CGFloat v34 = v33;
  CGFloat v36 = v35;
  CGFloat v38 = v37;

  v39 = [(_TVInspectorHighlightView *)self superview];
  CGFloat v83 = v29;
  CGFloat v86 = v28;
  -[_TVInspectorHighlightView convertRect:toView:](self, "convertRect:toView:", v39, 0.0, v29, v28, 20.0);
  CGFloat v41 = v40;
  double v43 = v42;
  double v45 = v44;
  CGFloat v47 = v46;

  CGFloat v80 = v41;
  v90.origin.x = v41;
  v90.origin.y = v43;
  v90.size.double width = v45;
  v90.size.double height = v47;
  CGFloat v48 = CGRectGetMaxX(v90) + 5.0;
  v91.origin.x = v32;
  v91.origin.y = v34;
  v91.size.double width = v36;
  v91.size.double height = v38;
  CGFloat rect = v34;
  CGFloat v82 = v38;
  if (v48 <= CGRectGetWidth(v91))
  {
    CGFloat v81 = 0.0;
    double v54 = v47;
    double v55 = v80;
    double v56 = 5.0;
  }
  else
  {
    v92.origin.x = v80;
    v92.origin.y = v43;
    v92.size.double width = v45;
    v92.size.double height = v47;
    double Width = CGRectGetWidth(v92);
    v93.origin.x = v32;
    v93.origin.y = v34;
    v93.size.double width = v36;
    v93.size.double height = v38;
    CGFloat v49 = CGRectGetWidth(v93);
    v94.origin.y = v34;
    CGFloat v50 = v32;
    double v51 = v49;
    v94.origin.x = v50;
    v94.size.double width = v36;
    v94.size.double height = v38;
    double v52 = CGRectGetWidth(v94);
    BOOL v53 = Width <= v51;
    CGFloat v32 = v50;
    double v54 = v47;
    double v55 = v80;
    double v56 = 5.0;
    if (v53)
    {
      double v57 = v52 + -5.0;
      v95.origin.x = v80;
      v95.origin.y = v43;
      v95.size.double width = v45;
      v95.size.double height = v54;
      double v55 = v57 - CGRectGetWidth(v95);
      v58 = [(_TVInspectorHighlightView *)self superview];
      objc_msgSend(v58, "convertRect:toView:", self, v55, v43, v45, v54);
      CGFloat v81 = v59;
      CGFloat v83 = v60;
      CGFloat v84 = v61;
      CGFloat v86 = v62;
    }
    else
    {
      CGFloat v86 = v52;
      CGFloat v81 = 0.0;
    }
  }
  v96.origin.x = v55;
  v96.origin.y = v43;
  v96.size.double width = v45;
  v96.size.double height = v54;
  CGFloat v63 = CGRectGetMaxY(v96) + v56;
  v97.origin.x = v32;
  v97.origin.y = rect;
  v97.size.double width = v36;
  v97.size.double height = v82;
  if (v63 <= CGRectGetHeight(v97))
  {
    double v69 = v83;
    double v65 = v84;
    double v68 = v81;
    double v66 = v86;
  }
  else
  {
    CGFloat v78 = v43;
    CGFloat v79 = v32;
    [(_TVInspectorHighlightView *)self frame];
    double MinY = CGRectGetMinY(v98);
    v99.origin.x = v81;
    double v65 = v84;
    v99.origin.y = v83;
    double v66 = v86;
    v99.size.double width = v86;
    v99.size.double height = v84;
    double v67 = MinY - CGRectGetHeight(v99);
    double v68 = v81;
    if (v67 + -5.0 + -5.0 <= 0.0)
    {
      v101.origin.x = v79;
      v101.origin.y = rect;
      v101.size.double width = v36;
      v101.size.double height = v82;
      double Height = CGRectGetHeight(v101);
      double v71 = v55;
      v102.origin.x = v55;
      v102.origin.y = v78;
      v102.size.double width = v45;
      v102.size.double height = v54;
      double v72 = Height - CGRectGetHeight(v102) + -5.0;
      v73 = [(_TVInspectorHighlightView *)self superview];
      objc_msgSend(v73, "convertRect:toView:", self, v71, v72, v45, v54);
      double v68 = v74;
      double v69 = v75;
      double v66 = v76;
      double v65 = v77;
    }
    else
    {
      v100.origin.x = v81;
      v100.origin.y = v83;
      v100.size.double width = v86;
      v100.size.double height = v84;
      double v69 = -5.0 - CGRectGetHeight(v100);
    }
  }
  -[_TVInspectorHighlightMetadataView setFrame:](self->_metadataView, "setFrame:", v68, v69, v66, v65);
  [(_TVInspectorHighlightMetadataView *)self->_metadataView setNeedsLayout];
}

- (UIWindow)targetWindow
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_targetWindow);
  return (UIWindow *)WeakRetained;
}

- (void)setTargetWindow:(id)a3
{
}

- (UIColor)borderColor
{
  return self->_borderColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_borderColor, 0);
  objc_destroyWeak((id *)&self->_targetWindow);
  objc_storeStrong((id *)&self->_metadataView, 0);
  objc_storeStrong((id *)&self->_highlightView, 0);
}

@end