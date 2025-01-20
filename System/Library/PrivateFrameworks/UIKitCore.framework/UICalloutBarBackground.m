@interface UICalloutBarBackground
- (BOOL)prefersCustomSelection;
- (CGRect)highlightRect;
- (UICalloutBarBackground)initWithVisualStyle:(id)a3;
- (_UICalloutBarVisualStyle)visualStyle;
- (double)cornerRadius;
- (id)blurViewBackgroundEffects;
- (id)containerBackgroundColor;
- (void)layoutSubviews;
- (void)setHighlightRect:(CGRect)a3;
- (void)setHighlighted:(BOOL)a3 forFrame:(CGRect)a4;
- (void)setVisualStyle:(id)a3;
@end

@implementation UICalloutBarBackground

- (UICalloutBarBackground)initWithVisualStyle:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)UICalloutBarBackground;
  v6 = [(UIView *)&v16 init];
  objc_storeStrong((id *)&v6->m_visualStyle, a3);
  v7 = objc_alloc_init(UIVisualEffectView);
  blurView = v6->_blurView;
  v6->_blurView = v7;

  v9 = [(UICalloutBarBackground *)v6 containerBackgroundColor];

  if (v9)
  {
    v10 = [(UICalloutBarBackground *)v6 containerBackgroundColor];
    [(UIView *)v6->_blurView setBackgroundColor:v10];

    [(UIVisualEffectView *)v6->_blurView setBackgroundEffects:MEMORY[0x1E4F1CBF0]];
  }
  else
  {
    v11 = [(UICalloutBarBackground *)v6 blurViewBackgroundEffects];
    [(UIVisualEffectView *)v6->_blurView setBackgroundEffects:v11];
  }
  [(UIView *)v6->_blurView setAutoresizingMask:18];
  [(UIVisualEffectView *)v6->_blurView _setGroupName:@"UICalloutBarBackground"];
  [(UIView *)v6 addSubview:v6->_blurView];
  v12 = objc_alloc_init(UIImageView);
  selectionTintView = v6->_selectionTintView;
  v6->_selectionTintView = v12;

  v14 = +[UIColor colorWithWhite:0.8 alpha:1.0];
  [(UIView *)v6->_selectionTintView setTintColor:v14];

  [(UIView *)v6->_selectionTintView setAutoresizingMask:18];
  [(UIImageView *)v6->_selectionTintView setHidden:1];
  [(UIView *)v6 addSubview:v6->_selectionTintView];

  return v6;
}

- (double)cornerRadius
{
  v2 = [(_UICalloutBarVisualStyle *)self->m_visualStyle barMetrics];
  [v2 cornerRadius];
  double v4 = v3;

  return v4;
}

- (id)containerBackgroundColor
{
  v2 = [(_UICalloutBarVisualStyle *)self->m_visualStyle barMetrics];
  double v3 = [v2 backgroundColor];

  return v3;
}

- (BOOL)prefersCustomSelection
{
  v2 = [(_UICalloutBarVisualStyle *)self->m_visualStyle buttonMetrics];
  char v3 = [v2 prefersCustomSelection];

  return v3;
}

- (id)blurViewBackgroundEffects
{
  v2 = [(_UICalloutBarVisualStyle *)self->m_visualStyle barMetrics];
  char v3 = [v2 blurViewBackgroundEffects];

  return v3;
}

- (void)layoutSubviews
{
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  v103.receiver = self;
  v103.super_class = (Class)UICalloutBarBackground;
  [(UIView *)&v103 layoutSubviews];
  id v5 = +[UICalloutBar sharedCalloutBar];
  [v5 controlFrame];
  objc_msgSend(v5, "convertRect:fromView:", 0);
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  [(UIView *)self bounds];
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  [(UIView *)self _currentScreenScale];
  double v19 = v18;
  if (v15 != *MEMORY[0x1E4F1DB30] || v17 != *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    int v21 = [v5 targetDirection];
    int v22 = [v5 targetDirection];
    int v23 = v22;
    BOOL v24 = v21 == 3 || v22 == 4;
    int v25 = v24;
    if (v24)
    {
      int v26 = [v5 isDisplayingVertically];
      double v27 = 18.0;
      if (v26) {
        double v27 = 9.0;
      }
      double v28 = 0.0;
      if (v21 == 3) {
        double v28 = v27;
      }
      double v7 = v7 + v28;
      double v11 = v11 - v27;
    }
    _UIGraphicsBeginImageContextWithOptions(0, 0, v15, v17, v19);
    ContextStack = (int *)GetContextStack(0);
    if (*ContextStack >= 1 && *(void *)&ContextStack[6 * (*ContextStack - 1) + 2])
    {
LABEL_22:
      v34 = +[UIColor blackColor];
      [v34 set];

      v106.origin.double x = round(v19 * v7) / v19;
      v106.origin.CGFloat y = round(v9 * v19) / v19;
      v106.size.double width = round(v19 * v11) / v19;
      v106.size.CGFloat height = round(v13 * v19) / v19;
      CGRect v107 = CGRectIntegral(v106);
      double x = v107.origin.x;
      CGFloat y = v107.origin.y;
      double width = v107.size.width;
      CGFloat height = v107.size.height;
      if ([v5 isDisplayingVertically])
      {
        if (v25)
        {
          if (v21 == 3) {
            [v5 pointRightOfControls];
          }
          else {
            [v5 pointLeftOfControls];
          }
          objc_msgSend(v5, "convertPoint:fromView:", 0);
          double v62 = round(v19 * v61) / v19;
          double v64 = round(v19 * v63) / v19;
          v50 = +[UIBezierPath bezierPath];
          double v100 = v64 + -9.0;
          double v65 = x;
          if (v21 == 3)
          {
            CGFloat v66 = y;
            double v67 = width;
            CGFloat v68 = height;
            double v69 = CGRectGetMinX(*(CGRect *)&v65) + -9.0;
            if (v62 >= v69) {
              double v69 = v62;
            }
            double v70 = v64;
            objc_msgSend(v50, "moveToPoint:", v69, v64);
            v108.origin.double x = x;
            v108.origin.CGFloat y = y;
            v108.size.double width = width;
            v108.size.CGFloat height = height;
            objc_msgSend(v50, "addLineToPoint:", CGRectGetMinX(v108), v100);
            v109.origin.double x = x;
            v109.origin.CGFloat y = y;
            v109.size.double width = width;
            v109.size.CGFloat height = height;
            double MinX = CGRectGetMinX(v109);
          }
          else
          {
            CGFloat v72 = y;
            double v73 = width;
            CGFloat v74 = height;
            double v75 = CGRectGetMaxX(*(CGRect *)&v65) + 9.0;
            if (v62 < v75) {
              double v75 = v62;
            }
            double v70 = v64;
            objc_msgSend(v50, "moveToPoint:", v75, v64);
            v110.origin.double x = x;
            v110.origin.CGFloat y = y;
            v110.size.double width = width;
            v110.size.CGFloat height = height;
            objc_msgSend(v50, "addLineToPoint:", CGRectGetMaxX(v110), v100);
            v111.origin.double x = x;
            v111.origin.CGFloat y = y;
            v111.size.double width = width;
            v111.size.CGFloat height = height;
            double MinX = CGRectGetMaxX(v111);
          }
          objc_msgSend(v50, "addLineToPoint:", MinX, v70 + 9.0);
          uint64_t v51 = -1;
          double v48 = y;
        }
        else
        {
          [v5 targetPoint];
          objc_msgSend(v5, "convertPoint:fromView:", 0);
          double v43 = round(v19 * v42) / v19;
          double v45 = round(v19 * v44) / v19;
          uint64_t v46 = (int)[v5 targetDirection];
          [(UICalloutBarBackground *)self cornerRadius];
          double v47 = v45;
          double v48 = y;
          v50 = ArrowBezierPath(v46, v43, v47, x, y, width, height, v49, v19);
          uint64_t v51 = -1;
        }
      }
      else
      {
        if (v21 == 3)
        {
          [(UICalloutBarBackground *)self cornerRadius];
          double x = x + v38;
          [(UICalloutBarBackground *)self cornerRadius];
          double width = width - v39;
        }
        if (v23 == 4)
        {
          [(UICalloutBarBackground *)self cornerRadius];
          uint64_t v40 = 0;
          double width = width - v41;
        }
        else
        {
          uint64_t v40 = 10;
        }
        uint64_t v52 = 5;
        if (v21 == 3) {
          uint64_t v52 = 0;
        }
        uint64_t v51 = v40 | v52;
        [v5 targetPoint];
        objc_msgSend(v5, "convertPoint:fromView:", 0);
        double v54 = round(v19 * v53) / v19;
        double v56 = round(v19 * v55) / v19;
        uint64_t v57 = (int)[v5 targetDirection];
        [(UICalloutBarBackground *)self cornerRadius];
        double v59 = v58;
        double v60 = v54;
        double v48 = y;
        v50 = ArrowBezierPath(v57, v60, v56, x, y, width, height, v59, v19);
      }
      [v50 fill];

      [(UICalloutBarBackground *)self cornerRadius];
      double v77 = v76;
      [(UICalloutBarBackground *)self cornerRadius];
      v79 = +[UIBezierPath bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:](UIBezierPath, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", v51, x, v48, width, height, v77, v78);
      [v79 fill];

      v80 = _UIGraphicsGetImageFromCurrentImageContext(0);
      [(UIVisualEffectView *)self->_blurView _setMaskImage:v80];
      UIGraphicsEndImageContext();
      [(UIImageView *)self->_selectionTintView setBackgroundColor:0];
      if (CGRectIsEmpty(self->_highlightRect)
        || [(UICalloutBarBackground *)self prefersCustomSelection])
      {
        [(UIImageView *)self->_selectionTintView setHidden:1];
LABEL_47:

        goto LABEL_48;
      }
      CGFloat v81 = self->_highlightRect.origin.y;
      CGFloat v102 = self->_highlightRect.origin.x;
      CGFloat v82 = self->_highlightRect.size.width;
      CGFloat v83 = self->_highlightRect.size.height;
      [v80 size];
      CGFloat v85 = v84;
      CGFloat v87 = v86;
      [v80 scale];
      _UIGraphicsBeginImageContextWithOptions(0, 0, v85, v87, v88);
      v89 = (int *)GetContextStack(0);
      if (*v89 < 1 || !*(void *)&v89[6 * (*v89 - 1) + 2])
      {
        if (!has_internal_diagnostics) {
          goto LABEL_47;
        }
        v90 = (objc_class *)objc_opt_class();
        v91 = NSStringFromClass(v90);
        v92 = NSStringFromSelector(a2);
        v105.double width = v15;
        v105.CGFloat height = v17;
        v93 = NSStringFromCGSize(v105);
        NSLog(&cfstr_NullContextInS.isa, v91, v92, v93, *(void *)&v19, 460);
      }
      if (([v5 isDisplayingVertically] & 1) == 0)
      {
        [v80 size];
        CGFloat v83 = v94;
        CGFloat v81 = 0.0;
      }
      v95 = +[UIColor colorWithWhite:0.0 alpha:1.0];
      [v95 set];

      UIRectFillUsingOperation(1, v102, v81, v82, v83);
      v96 = +[UIDevice currentDevice];
      if ([v96 _graphicsQuality] == 10) {
        double v97 = 0.75;
      }
      else {
        double v97 = 0.4;
      }
      objc_msgSend(v80, "drawAtPoint:blendMode:alpha:", 18, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v97);

      v98 = _UIGraphicsGetImageFromCurrentImageContext(0);
      v99 = [v98 imageWithRenderingMode:2];
      [(UIImageView *)self->_selectionTintView setImage:v99];

      [(UIImageView *)self->_selectionTintView setHidden:0];
      UIGraphicsEndImageContext();
      goto LABEL_47;
    }
    if (has_internal_diagnostics)
    {
      v30 = (objc_class *)objc_opt_class();
      v31 = NSStringFromClass(v30);
      v32 = NSStringFromSelector(a2);
      v104.double width = v15;
      v104.CGFloat height = v17;
      v33 = NSStringFromCGSize(v104);
      NSLog(&cfstr_NullContextInS.isa, v31, v32, v33, *(void *)&v19, 407);

      goto LABEL_22;
    }
  }
LABEL_48:
}

- (void)setHighlighted:(BOOL)a3 forFrame:(CGRect)a4
{
  if (a3)
  {
    double height = a4.size.height;
    double width = a4.size.width;
    double y = a4.origin.y;
    double x = a4.origin.x;
  }
  else
  {
    double x = *MEMORY[0x1E4F1DB28];
    double y = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double height = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  [(UICalloutBarBackground *)self highlightRect];
  v15.origin.double x = v9;
  v15.origin.double y = v10;
  v15.size.double width = v11;
  v15.size.double height = v12;
  v14.origin.double x = x;
  v14.origin.double y = y;
  v14.size.double width = width;
  v14.size.double height = height;
  if (!CGRectEqualToRect(v14, v15))
  {
    -[UICalloutBarBackground setHighlightRect:](self, "setHighlightRect:", x, y, width, height);
    [(UIView *)self setNeedsLayout];
  }
}

- (_UICalloutBarVisualStyle)visualStyle
{
  return self->m_visualStyle;
}

- (void)setVisualStyle:(id)a3
{
}

- (CGRect)highlightRect
{
  double x = self->_highlightRect.origin.x;
  double y = self->_highlightRect.origin.y;
  double width = self->_highlightRect.size.width;
  double height = self->_highlightRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setHighlightRect:(CGRect)a3
{
  self->_highlightRect = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->m_visualStyle, 0);
  objc_storeStrong((id *)&self->_selectionTintView, 0);
  objc_storeStrong((id *)&self->_blurView, 0);
}

@end