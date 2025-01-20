@interface BKScrubberCalloutView
- (void)updateLayoutWithParentView:(id)a3 bottomMargin:(double)a4 calloutWidth:(double)a5 followThumb:(BOOL)a6 isScroll:(BOOL)a7 isVerticalScroll:(BOOL)a8 layoutDirection:(int64_t)a9 scrubber:(id)a10;
@end

@implementation BKScrubberCalloutView

- (void)updateLayoutWithParentView:(id)a3 bottomMargin:(double)a4 calloutWidth:(double)a5 followThumb:(BOOL)a6 isScroll:(BOOL)a7 isVerticalScroll:(BOOL)a8 layoutDirection:(int64_t)a9 scrubber:(id)a10
{
  BOOL v12 = a8;
  BOOL v14 = a6;
  id v81 = a3;
  id v17 = a10;
  [v81 bounds];
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  v26 = +[UIApplication sharedApplication];
  v27 = (char *)[v26 userInterfaceLayoutDirection];

  -[BKScrubberCalloutView sizeThatFits:](self, "sizeThatFits:", CGSizeZero.width, CGSizeZero.height);
  double v30 = v29;
  if (a5 <= 0.0) {
    double v31 = v28;
  }
  else {
    double v31 = a5;
  }
  CGFloat v32 = v25;
  v83.origin.x = v19;
  v83.origin.y = v21;
  v83.size.width = v23;
  v83.size.height = v25;
  double v33 = v31 * 0.5;
  double v34 = CGRectGetMidX(v83) - v31 * 0.5;
  v84.origin.x = v19;
  v84.origin.y = v21;
  v84.size.width = v23;
  v84.size.height = v32;
  double MinY = CGRectGetMinY(v84);
  if (v14)
  {
    double v76 = v34;
    CGFloat rect = v32;
    double v75 = MinY;
    double v78 = v31;
    double v80 = v30;
    v36 = [v17 thumb];
    [v36 frame];
    double v38 = v37;
    double v40 = v39;
    double v42 = v41;
    double v44 = v43;
    v45 = [v17 thumb];
    v46 = [v45 superview];
    [v81 convertRect:v46 fromView:v38];
    uint64_t v48 = v47;
    uint64_t v50 = v49;
    uint64_t v52 = v51;
    uint64_t v54 = v53;

    uint64_t v55 = v48;
    uint64_t v56 = v50;
    uint64_t v57 = v52;
    uint64_t v58 = v54;
    if (v12)
    {
      double v30 = v80;
      double v59 = CGRectGetMidY(*(CGRect *)&v55) + v80 * -0.5;
      v85.origin.x = v19;
      v85.origin.y = v21;
      v85.size.width = v23;
      v85.size.height = rect;
      double v60 = CGRectGetHeight(v85) + -5.0 - v80;
      if (v60 >= v59) {
        double v60 = v59;
      }
      double v61 = fmax(v60, 5.0);
      double v31 = v78;
      double v34 = v76;
      if (!a7) {
        goto LABEL_24;
      }
    }
    else
    {
      double v67 = CGRectGetMidX(*(CGRect *)&v55) - v33;
      v86.origin.x = v19;
      v86.origin.y = v21;
      v86.size.width = v23;
      v86.size.height = rect;
      double v31 = v78;
      double v30 = v80;
      double v68 = CGRectGetWidth(v86) + -5.0 - v78;
      if (v68 >= v67) {
        double v68 = v67;
      }
      double v34 = fmax(v68, 5.0);
      double v61 = v75;
      if (!a7) {
        goto LABEL_24;
      }
    }
    [v17 frame];
    if (v27 == (unsigned char *)&dword_0 + 1)
    {
      double MaxX = CGRectGetMaxX(*(CGRect *)&v69);
      double v74 = 12.0;
    }
    else
    {
      double MaxX = CGRectGetMinX(*(CGRect *)&v69) - v31;
      double v74 = -12.0;
    }
    double v34 = MaxX + v74;
    goto LABEL_27;
  }
  if (!a7)
  {
LABEL_24:
    [v17 frame];
    double v61 = CGRectGetMinY(v87) - v30;
    goto LABEL_27;
  }
  int v62 = isPhone();
  double v63 = 45.0;
  if (a9 != 1) {
    double v63 = 24.0;
  }
  double v64 = 34.0;
  if (a9 == 1) {
    double v64 = 58.0;
  }
  if (v62) {
    double v65 = v63;
  }
  else {
    double v65 = v64;
  }
  [v81 frame];
  double v61 = v66 - a4 - v30 + -1.0 - v65;
LABEL_27:
  v88.origin.x = v34;
  v88.origin.y = v61;
  v88.size.width = v31;
  v88.size.height = v30;
  CGRect v89 = CGRectIntegral(v88);
  -[BKScrubberCalloutView setFrame:](self, "setFrame:", v89.origin.x, v89.origin.y, v89.size.width, v89.size.height);
}

@end