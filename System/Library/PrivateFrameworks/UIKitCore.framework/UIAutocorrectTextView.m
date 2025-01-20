@interface UIAutocorrectTextView
- (BOOL)animating;
- (BOOL)isLongString;
- (BOOL)pointInside:(CGPoint)a3 forEvent:(__GSEvent *)a4;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGRect)_calculateRectForExpandedHitRegion;
- (UIAutocorrectTextView)initWithFrame:(CGRect)a3 string:(id)a4 type:(int)a5 edgeType:(int)a6;
- (void)drawRect:(CGRect)a3;
- (void)setAnimating:(BOOL)a3;
- (void)setEdgeType:(int)a3;
- (void)setIsLongString:(BOOL)a3;
@end

@implementation UIAutocorrectTextView

- (UIAutocorrectTextView)initWithFrame:(CGRect)a3 string:(id)a4 type:(int)a5 edgeType:(int)a6
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v13 = a4;
  if (v13)
  {
    if (a6) {
      inlinePromptTextFont();
    }
    else {
    v14 = textFont();
    }
  }
  else
  {
    v14 = 0;
  }
  if (a5 == 2)
  {
    v27.origin.CGFloat x = x;
    v27.origin.CGFloat y = y;
    v27.size.CGFloat width = width;
    v27.size.CGFloat height = height;
    CGRect v28 = CGRectInset(v27, -3.0, 0.0);
    double v15 = v28.origin.y + -1.5;
    double v16 = v28.size.width + -1.0;
    double v17 = 1.0;
LABEL_16:
    v28.size.CGFloat height = v28.size.height + v17;
    goto LABEL_17;
  }
  objc_msgSend(v13, "_legacy_sizeWithFont:forWidth:lineBreakMode:", v14, 2, 3.40282347e38);
  v29.size.CGFloat width = ceil(v18);
  v29.origin.CGFloat x = x;
  v29.origin.CGFloat y = y;
  v29.size.CGFloat height = height;
  CGRect v28 = CGRectInset(v29, -3.0, 0.0);
  if (a5 < 2)
  {
    double v17 = 4.0;
    goto LABEL_16;
  }
  if (a5 == 3)
  {
    double v17 = -1.0;
    goto LABEL_16;
  }
  if (a5 == 4) {
    v28.size.CGFloat height = v28.size.height + -1.0;
  }
LABEL_17:
  double v19 = v28.size.height * 0.68;
  if ((a6 - 1) >= 2) {
    double v19 = -0.0;
  }
  double v20 = v16 + v19;
  CGRect v30 = CGRectIntegral(v28);
  v26.receiver = self;
  v26.super_class = (Class)UIAutocorrectTextView;
  v21 = -[UIView initWithFrame:](&v26, sel_initWithFrame_, v30.origin.x, v30.origin.y, v30.size.width, v30.size.height);
  v22 = v21;
  if (v21)
  {
    v21->m_edgeType = a6;
    uint64_t v23 = [v13 copy];
    m_string = v22->m_string;
    v22->m_string = (NSString *)v23;

    v22->m_type = a5;
    objc_storeStrong((id *)&v22->m_textFont, v14);
    [(UIView *)v22 setOpaque:0];
    [(UIView *)v22 setUserInteractionEnabled:0];
  }

  return v22;
}

- (void)setEdgeType:(int)a3
{
  if (self->m_edgeType == a3) {
    return;
  }
  [(UIView *)self frame];
  double v7 = v6 * 0.68;
  if (a3 != 2)
  {
    if (a3 == 1)
    {
      if (self->m_edgeType == 2) {
        double v5 = v5 - v7;
      }
      goto LABEL_14;
    }
    if (a3 || self->m_edgeType != 2) {
      goto LABEL_14;
    }
LABEL_9:
    double v5 = v5 + v7;
    goto LABEL_14;
  }
  int m_edgeType = self->m_edgeType;
  if (m_edgeType == 1)
  {
    double v5 = v5 + v7;
    goto LABEL_14;
  }
  if (!m_edgeType) {
    goto LABEL_9;
  }
LABEL_14:
  self->int m_edgeType = a3;
  [(UIView *)self setFrame:v5];
  [(UIView *)self setNeedsDisplay];
}

- (void)drawRect:(CGRect)a3
{
  [(UIView *)self bounds];
  double v5 = v4;
  CGFloat v7 = v6;
  double v9 = v8;
  double v11 = v10;
  switch(self->m_type)
  {
    case 0:
    case 1:
      autocorrectTextBackgroundColor();
      id v67 = (id)objc_claimAutoreleasedReturnValue();
      v12 = AutocorrectTextColor();
      int v13 = 1;
      v14 = AutocorrectTextOutlineColor();
      if (v14) {
        goto LABEL_6;
      }
      goto LABEL_25;
    case 2:
      TypedTextBackgroundColor();
      id v67 = (id)objc_claimAutoreleasedReturnValue();
      v14 = TypedTextBackgroundColor();
      int v13 = 0;
      v12 = 0;
      if (!v14) {
        goto LABEL_25;
      }
LABEL_6:
      if (self->m_animating) {
        goto LABEL_25;
      }
      double v15 = +[UIScreen mainScreen];
      [v15 scale];
      double v17 = v16;

      double v18 = 0.5;
      if (v17 <= 1.0) {
        double v18 = 0.0;
      }
      double v65 = v18;
      double v66 = v17;
      if (v17 <= 1.0) {
        double v19 = 0.0;
      }
      else {
        double v19 = 0.75;
      }
      v71.origin.double x = v5;
      v71.origin.double y = v7;
      v71.size.double width = v9;
      v71.size.double height = v11;
      CGRect v72 = CGRectInset(v71, v19, v19);
      double x = v72.origin.x;
      double y = v72.origin.y;
      double width = v72.size.width;
      double height = v72.size.height;
      [v14 set];
      int m_edgeType = self->m_edgeType;
      if (m_edgeType != 2)
      {
        if (m_edgeType == 1)
        {
          v25 = +[UIBezierPath roundedRectBezierPath:withRoundedEdges:](UIBezierPath, "roundedRectBezierPath:withRoundedEdges:", 8, x, y, width, height);
        }
        else
        {
          if (m_edgeType) {
            goto LABEL_25;
          }
          v25 = +[UIBezierPath roundedRectBezierPath:withRoundedCorners:withCornerRadius:](UIBezierPath, "roundedRectBezierPath:withRoundedCorners:withCornerRadius:", -1, x, y, width, height, 0.0);
        }
        CGRect v29 = v25;
        [v25 setLineWidth:v65];
        double v30 = 1.0;
        if (v66 > 1.0) {
          goto LABEL_23;
        }
LABEL_20:
        objc_msgSend(v29, "fill", v30);
        goto LABEL_24;
      }
      CGRect v29 = +[UIBezierPath roundedRectBezierPath:withRoundedEdges:](UIBezierPath, "roundedRectBezierPath:withRoundedEdges:", 2, x, y, width, height);
      [v29 setLineWidth:v65];
      double v30 = v66;
      if (v66 <= 1.0) {
        goto LABEL_20;
      }
LABEL_23:
      objc_msgSend(v29, "stroke", v30);
LABEL_24:

LABEL_25:
      id v28 = v67;
LABEL_26:
      id v68 = v28;
      if (v28)
      {
        v73.origin.double x = v5;
        v73.origin.double y = v7;
        v73.size.double width = v9;
        v73.size.double height = v11;
        CGRect v74 = CGRectInset(v73, 1.0, 1.0);
        CGFloat v31 = v74.origin.x;
        CGFloat v32 = v74.origin.y;
        CGFloat v33 = v74.size.width;
        CGFloat v34 = v74.size.height;
        [v68 set];
        int v35 = self->m_edgeType;
        if (v35 == 2)
        {
          double v36 = v31;
          double v37 = v32;
          double v38 = v33;
          double v39 = v34;
          uint64_t v40 = 2;
        }
        else
        {
          if (v35 != 1)
          {
            if (!v35) {
              UIRectFillUsingOperation(1, v31, v32, v33, v34);
            }
            goto LABEL_34;
          }
          double v36 = v31;
          double v37 = v32;
          double v38 = v33;
          double v39 = v34;
          uint64_t v40 = 8;
        }
        v41 = +[UIBezierPath roundedRectBezierPath:withRoundedEdges:](UIBezierPath, "roundedRectBezierPath:withRoundedEdges:", v40, v36, v37, v38, v39);
        [v41 fill];
      }
LABEL_34:
      if (v12)
      {
        [v12 set];
        int m_type = self->m_type;
        if (m_type == 1)
        {
          double v43 = 2.0;
        }
        else
        {
          double v43 = 3.0;
          if (m_type != 2) {
            double v43 = (double)(2 * (m_type == 3));
          }
        }
        double v44 = v43 + (double)v13;
        double v45 = v11 * 0.68 + 3.0;
        if (self->m_edgeType != 2) {
          double v45 = 3.0;
        }
        if (self->m_isLongString)
        {
          double v46 = v9 - v11;
          m_textFont = self->m_textFont;
          uint64_t v48 = 4;
        }
        else
        {
          m_textFont = self->m_textFont;
          double v46 = 3.40282347e38;
          uint64_t v48 = 2;
        }
        -[NSString _legacy_drawAtPoint:forWidth:withFont:lineBreakMode:](self->m_string, "_legacy_drawAtPoint:forWidth:withFont:lineBreakMode:", m_textFont, v48, v45, v44, v46);
      }
      if (self->m_type == 1)
      {
        double v49 = v11 * 0.5;
        v50 = +[UIScreen mainScreen];
        [v50 scale];
        double v52 = v51;

        v53 = AutoCorrectCancelImage();
        [v53 size];
        double v55 = v54;
        double v57 = v56;
        v58 = +[UIColor systemGrayColor];
        v59 = v58;
        int v60 = self->m_edgeType;
        if (v60 == 2)
        {
          if (v52 <= 1.0) {
            double v62 = 0.65;
          }
          else {
            double v62 = dbl_186B99240[v11 < 22.0];
          }
          double v64 = v49 + v55 * -0.5 + -2.0 + 1.0;
        }
        else
        {
          if (v60 != 1)
          {
LABEL_56:

            goto LABEL_57;
          }
          double v61 = v5 + v9;
          double v62 = 1.0;
          double v63 = 0.0;
          if (v52 > 1.0) {
            double v63 = 0.5;
          }
          double v64 = v63 + v61 - v49 - v55 * 0.5 + -1.0;
          [v58 set];
        }
        objc_msgSend(v53, "drawAtPoint:blendMode:alpha:", 0, v64, v49 + v57 * -0.5 + 0.0, v62);
        goto LABEL_56;
      }
LABEL_57:

      return;
    case 3:
      uint64_t v26 = autocorrectTextBackgroundColor();
      goto LABEL_18;
    case 4:
      uint64_t v26 = documentBackgroundColor();
LABEL_18:
      id v69 = (id)v26;
      int v13 = 1;
      uint64_t v27 = typedTextColor();
      id v28 = v69;
      v12 = (void *)v27;
      v14 = 0;
      goto LABEL_26;
    default:
      v14 = 0;
      v12 = 0;
      id v68 = 0;
      goto LABEL_57;
  }
}

- (CGRect)_calculateRectForExpandedHitRegion
{
  [(UIView *)self bounds];
  CGRect v21 = CGRectInset(v20, -15.0, -30.0);
  CGFloat x = v21.origin.x;
  CGFloat y = v21.origin.y;
  CGFloat height = v21.size.height;
  CGFloat v6 = v21.size.width + 5.0;
  [(UIView *)self bounds];
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  CGFloat v15 = x;
  CGFloat v16 = y;
  CGFloat v17 = v6;
  CGFloat v18 = height;
  return CGRectUnion(*(CGRect *)&v15, *(CGRect *)&v8);
}

- (BOOL)pointInside:(CGPoint)a3 forEvent:(__GSEvent *)a4
{
  [(UIAutocorrectTextView *)self _calculateRectForExpandedHitRegion];
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  GSEventGetLocationInWindow();
  -[UIView convertPoint:fromView:](self, "convertPoint:fromView:", GSEventGetWindow(), v13, v14);
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  uint64_t v19 = v6;
  uint64_t v20 = v8;
  uint64_t v21 = v10;
  uint64_t v22 = v12;
  return CGRectContainsPoint(*(CGRect *)&v19, *(CGPoint *)&v16);
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(UIAutocorrectTextView *)self _calculateRectForExpandedHitRegion];
  CGFloat v10 = x;
  CGFloat v11 = y;
  return CGRectContainsPoint(*(CGRect *)&v6, *(CGPoint *)&v10);
}

- (BOOL)animating
{
  return self->m_animating;
}

- (void)setAnimating:(BOOL)a3
{
  self->m_animating = a3;
}

- (BOOL)isLongString
{
  return self->m_isLongString;
}

- (void)setIsLongString:(BOOL)a3
{
  self->m_isLongString = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->m_textFont, 0);
  objc_storeStrong((id *)&self->m_string, 0);
}

@end