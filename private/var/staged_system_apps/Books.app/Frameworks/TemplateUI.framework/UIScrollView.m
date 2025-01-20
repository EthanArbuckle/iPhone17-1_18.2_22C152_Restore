@interface UIScrollView
- (CGPoint)tui_contentOffsetForScrollingToRect:(CGRect)a3 atScrollPosition:(unint64_t)a4 delegate:(id)a5;
- (UIEdgeInsets)tui_revealableContentPadding;
- (void)tui_scrollToRect:(CGRect)a3 atScrollPosition:(unint64_t)a4 animated:(BOOL)a5 delegate:(id)a6;
@end

@implementation UIScrollView

- (UIEdgeInsets)tui_revealableContentPadding
{
  if (objc_opt_respondsToSelector())
  {
    [(UIScrollView *)self _revealableContentPadding];
  }
  else
  {
    double top = UIEdgeInsetsZero.top;
    double left = UIEdgeInsetsZero.left;
    double bottom = UIEdgeInsetsZero.bottom;
    double right = UIEdgeInsetsZero.right;
  }
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (CGPoint)tui_contentOffsetForScrollingToRect:(CGRect)a3 atScrollPosition:(unint64_t)a4 delegate:(id)a5
{
  CGFloat height = a3.size.height;
  CGFloat y = a3.origin.y;
  CGFloat rect = a3.origin.x;
  CGFloat rect_8 = a3.size.width;
  id v7 = a5;
  [(UIScrollView *)self bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  [(UIScrollView *)self adjustedContentInset];
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  [(UIScrollView *)self tui_revealableContentPadding];
  double v84 = v25;
  double v85 = v24;
  if (v7)
  {
    [v7 contentInsetsForScrollingToRectWithContentInsets:v17, v19, v21, v23];
    double v17 = v26;
    double v19 = v27;
    double v21 = v28;
    double v23 = v29;
  }
  CGFloat v31 = y;
  CGFloat v30 = rect;
  double rect_16 = v9 + v19;
  double rect_24 = v11 + v17;
  double v82 = v19;
  double v32 = v13 - (v23 + v19);
  double v33 = v15 - (v21 + v17);
  if (a4)
  {
    v99.origin.x = rect;
    v99.origin.CGFloat y = y;
    v99.size.width = rect_8;
    CGFloat v37 = height;
    v99.size.CGFloat height = height;
    double MinY = CGRectGetMinY(v99);
    CGFloat v34 = rect_16;
    goto LABEL_13;
  }
  if ((a4 & 2) != 0)
  {
    v100.origin.x = rect;
    v100.origin.CGFloat y = y;
    v100.size.width = rect_8;
    double v40 = height;
    v100.size.CGFloat height = height;
    double MidY = CGRectGetMidY(v100);
    CGFloat v34 = rect_16;
    v101.origin.CGFloat y = v11 + v17;
    v101.origin.x = rect_16;
    v101.size.width = v32;
    v101.size.CGFloat height = v33;
    double MinY = MidY + CGRectGetHeight(v101) * -0.5;
LABEL_12:
    CGFloat v37 = v40;
    goto LABEL_13;
  }
  if ((a4 & 4) != 0)
  {
    v102.origin.x = rect;
    v102.origin.CGFloat y = y;
    v102.size.width = rect_8;
    double v40 = height;
    v102.size.CGFloat height = height;
    double MaxY = CGRectGetMaxY(v102);
    CGFloat v34 = rect_16;
    v103.origin.CGFloat y = v11 + v17;
    v103.origin.x = rect_16;
    v103.size.width = v32;
    v103.size.CGFloat height = v33;
    double MinY = MaxY - CGRectGetHeight(v103);
    goto LABEL_12;
  }
  CGFloat v34 = rect_16;
  double MinY = v11 + v17;
  v95.origin.x = rect_16;
  v95.origin.CGFloat y = v11 + v17;
  v95.size.width = v32;
  v95.size.CGFloat height = v33;
  CGFloat v36 = rect_8;
  CGFloat v37 = height;
  CGFloat v38 = height;
  if (!CGRectContainsRect(v95, *(CGRect *)&v30))
  {
    v96.origin.x = rect;
    v96.origin.CGFloat y = y;
    v96.size.width = rect_8;
    v96.size.CGFloat height = height;
    double v39 = CGRectGetMinY(v96);
    v97.origin.x = rect_16;
    v97.origin.CGFloat y = v11 + v17;
    v97.size.width = v32;
    v97.size.CGFloat height = v33;
    if (v39 >= CGRectGetMinY(v97))
    {
      v118.origin.x = rect;
      v118.origin.CGFloat y = y;
      v118.size.width = rect_8;
      v118.size.CGFloat height = height;
      double v77 = CGRectGetMaxY(v118);
      v119.origin.x = rect_16;
      double MinY = v11 + v17;
      v119.origin.CGFloat y = v11 + v17;
      v119.size.width = v32;
      v119.size.CGFloat height = v33;
      BOOL v78 = v77 <= CGRectGetMaxY(v119);
      CGFloat v37 = height;
      if (!v78)
      {
        v120.origin.CGFloat y = y;
        v120.origin.x = rect;
        v120.size.width = rect_8;
        v120.size.CGFloat height = height;
        double v79 = CGRectGetMaxY(v120);
        v121.origin.x = rect_16;
        v121.origin.CGFloat y = v11 + v17;
        v121.size.width = v32;
        v121.size.CGFloat height = v33;
        double MinY = v79 - CGRectGetHeight(v121);
        CGFloat v37 = height;
      }
    }
    else
    {
      v98.origin.x = rect;
      v98.origin.CGFloat y = y;
      v98.size.width = rect_8;
      v98.size.CGFloat height = height;
      double MinY = CGRectGetMinY(v98);
      CGFloat v37 = height;
    }
  }
LABEL_13:
  double v43 = v17;
  if ((a4 & 8) != 0)
  {
    CGFloat v49 = y;
    CGFloat v47 = rect;
    CGFloat v48 = rect_8;
    CGFloat v50 = v37;
    goto LABEL_20;
  }
  if ((a4 & 0x10) != 0)
  {
    v107.origin.CGFloat y = y;
    v107.origin.x = rect;
    v107.size.width = rect_8;
    v107.size.CGFloat height = v37;
    double MidX = CGRectGetMidX(v107);
    v108.origin.x = v34;
    v108.origin.CGFloat y = v11 + v17;
    v108.size.width = v32;
    v108.size.CGFloat height = v33;
    double v45 = MidX + CGRectGetWidth(v108) * -0.5;
    goto LABEL_24;
  }
  if ((a4 & 0x20) != 0)
  {
    CGFloat v53 = y;
    CGFloat v52 = rect;
    CGFloat v54 = rect_8;
LABEL_23:
    CGFloat v55 = v37;
    double MaxX = CGRectGetMaxX(*(CGRect *)&v52);
    v109.origin.x = v34;
    v109.origin.CGFloat y = v11 + v17;
    v109.size.width = v32;
    v109.size.CGFloat height = v33;
    double v45 = MaxX - CGRectGetWidth(v109);
    goto LABEL_24;
  }
  v104.origin.x = v34;
  v104.origin.CGFloat y = v11 + v17;
  v104.size.width = v32;
  v104.size.CGFloat height = v33;
  v124.origin.x = rect;
  v124.origin.CGFloat y = y;
  v124.size.width = rect_8;
  v124.size.CGFloat height = v37;
  BOOL v44 = CGRectContainsRect(v104, v124);
  double v45 = v34;
  if (v44) {
    goto LABEL_24;
  }
  v105.origin.x = rect;
  v105.origin.CGFloat y = y;
  v105.size.width = rect_8;
  v105.size.CGFloat height = v37;
  double MinX = CGRectGetMinX(v105);
  v106.origin.x = v34;
  v106.origin.CGFloat y = v11 + v17;
  v106.size.width = v32;
  v106.size.CGFloat height = v33;
  if (MinX < CGRectGetMinX(v106))
  {
    CGFloat v47 = rect;
    CGFloat v48 = rect_8;
    CGFloat v49 = y;
    CGFloat v50 = height;
LABEL_20:
    double v45 = CGRectGetMinX(*(CGRect *)&v47);
    goto LABEL_24;
  }
  v122.origin.x = rect;
  v122.size.width = rect_8;
  v122.origin.CGFloat y = y;
  CGFloat v37 = height;
  v122.size.CGFloat height = height;
  double v80 = CGRectGetMaxX(v122);
  v123.origin.x = v34;
  v123.origin.CGFloat y = v11 + v17;
  v123.size.width = v32;
  v123.size.CGFloat height = v33;
  BOOL v78 = v80 <= CGRectGetMaxX(v123);
  double v45 = v34;
  CGFloat v54 = rect_8;
  if (!v78)
  {
    CGFloat v52 = rect;
    CGFloat v53 = y;
    goto LABEL_23;
  }
LABEL_24:
  CGFloat v57 = v33;
  CGFloat v58 = v32;
  double v59 = v45 - v82;
  double v60 = MinY - v43;
  if (v7)
  {
    [v7 contentOffsetFromProposedContentOffset:a4 atScrollPosition:v45 - v82 v60];
    double v59 = v61;
    double v60 = v62;
  }
  CGFloat v83 = CGPointZero.y;
  [(UIScrollView *)self contentSize];
  CGFloat v64 = v63;
  CGFloat v81 = v65;
  [(UIScrollView *)self adjustedContentInset];
  double v67 = v85 + v66;
  double v87 = v84 + v68;
  v110.origin.x = v34;
  v110.origin.CGFloat y = rect_24;
  v110.size.width = v58;
  v110.size.CGFloat height = v57;
  double v89 = v67;
  CGFloat v69 = v60 + CGRectGetHeight(v110) + v67;
  v111.origin.x = CGPointZero.x;
  v111.origin.CGFloat y = v83;
  v111.size.width = v64;
  v111.size.CGFloat height = v81;
  if (v69 > CGRectGetMaxY(v111))
  {
    v112.origin.x = CGPointZero.x;
    v112.size.width = v64;
    v112.origin.CGFloat y = v83;
    v112.size.CGFloat height = v81;
    double v70 = CGRectGetMaxY(v112);
    v113.origin.x = rect_16;
    v113.origin.CGFloat y = rect_24;
    v113.size.width = v58;
    v113.size.CGFloat height = v57;
    double v60 = v70 - (v89 + CGRectGetHeight(v113));
  }
  v114.origin.x = rect_16;
  v114.origin.CGFloat y = rect_24;
  v114.size.width = v58;
  v114.size.CGFloat height = v57;
  CGFloat v71 = v87 + v59 + CGRectGetWidth(v114);
  v115.origin.x = CGPointZero.x;
  v115.size.width = v64;
  v115.origin.CGFloat y = v83;
  v115.size.CGFloat height = v81;
  if (v71 > CGRectGetMaxX(v115))
  {
    v116.origin.x = CGPointZero.x;
    v116.size.width = v64;
    v116.origin.CGFloat y = v83;
    v116.size.CGFloat height = v81;
    double v72 = CGRectGetMaxX(v116);
    v117.origin.x = rect_16;
    v117.origin.CGFloat y = rect_24;
    v117.size.width = v58;
    v117.size.CGFloat height = v57;
    double v59 = v72 - (v87 + CGRectGetWidth(v117));
  }
  if (v60 >= -v89) {
    double v73 = v60;
  }
  else {
    double v73 = -v89;
  }
  if (v59 >= -v87) {
    double v74 = v59;
  }
  else {
    double v74 = -v87;
  }

  double v75 = v74;
  double v76 = v73;
  result.CGFloat y = v76;
  result.x = v75;
  return result;
}

- (void)tui_scrollToRect:(CGRect)a3 atScrollPosition:(unint64_t)a4 animated:(BOOL)a5 delegate:(id)a6
{
  BOOL v6 = a5;
  -[UIScrollView tui_contentOffsetForScrollingToRect:atScrollPosition:delegate:](self, "tui_contentOffsetForScrollingToRect:atScrollPosition:delegate:", a4, a6, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v10 = v9;
  double v11 = v8;
  if (v9 == 0.0 && v8 < 0.0)
  {
    [(UIScrollView *)self _scrollToTopIfPossible:v6];
  }
  else if (v6)
  {
    -[UIScrollView setContentOffset:animated:](self, "setContentOffset:animated:", 1);
  }
  else
  {
    +[CATransaction begin];
    +[CATransaction setDisableActions:1];
    -[UIScrollView setContentOffset:animated:](self, "setContentOffset:animated:", 0, v10, v11);
    +[CATransaction commit];
  }
}

@end