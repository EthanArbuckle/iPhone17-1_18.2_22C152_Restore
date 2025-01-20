@interface TLKLayoutUtilities
+ (BOOL)isLTR;
+ (BOOL)isSuperLargeAccessibilitySize;
+ (BOOL)isWideScreen;
+ (BOOL)viewIsVisible:(id)a3;
+ (BOOL)widthIsCompact:(double)a3;
+ (CGRect)deviceScaledRoundedRect:(CGRect)a3 forView:(id)a4;
+ (CGSize)deviceScaledRoundedSize:(CGSize)a3 forView:(id)a4;
+ (CGSize)idealImageSizeWithSize:(CGSize)result fittingSize:(CGSize)a4;
+ (CGSize)maxThumbnailSize;
+ (CGSize)maxThumbnailSizeIsCompactWidth:(BOOL)a3;
+ (CGSize)minimumButtonSize;
+ (UIEdgeInsets)deviceScaledRoundedInsets:(UIEdgeInsets)a3 forView:(id)a4;
+ (double)ceilingValue:(double)a3 inView:(id)a4;
+ (double)contentHeightOfTableView:(id)a3 forWidth:(double)a4 maxHeight:(double)a5;
+ (double)deviceScaledFlooredValue:(double)a3 forView:(id)a4;
+ (double)deviceScaledRoundedValue:(double)a3 forView:(id)a4;
+ (double)flooredValue:(double)a3 inView:(id)a4;
+ (double)roundedValue:(double)a3 inView:(id)a4;
+ (double)scaledValueForValue:(double)a3 withFont:(id)a4 view:(id)a5;
+ (id)controlsInView:(id)a3;
+ (id)tappableControlViewForPoint:(CGPoint)a3 inView:(id)a4 withEvent:(id)a5;
+ (void)applyRowBoundedSizingToImageView:(id)a3 isCompactWidth:(BOOL)a4;
+ (void)requireIntrinsicSizeForView:(id)a3;
+ (void)requireIntrinsicSizeForView:(id)a3 withPriority:(float)a4;
+ (void)setDynamicBaselineAlignmentsForLabel:(id)a3 top:(double)a4 bottom:(double)a5 view:(id)a6;
@end

@implementation TLKLayoutUtilities

+ (id)controlsInView:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v6 = objc_msgSend(v4, "subviews", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v5 addObject:v11];
        }
        v12 = [a1 controlsInView:v11];
        [v5 addObjectsFromArray:v12];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v5;
}

+ (BOOL)isSuperLargeAccessibilitySize
{
  v2 = [MEMORY[0x1E4FB1438] sharedApplication];
  v3 = [v2 preferredContentSizeCategory];
  char IsAccessibilityContentSizeCategory = _UIContentSizeCategoryIsAccessibilityContentSizeCategory();

  return IsAccessibilityContentSizeCategory;
}

+ (BOOL)isWideScreen
{
  if (isWideScreen_onceToken != -1) {
    dispatch_once(&isWideScreen_onceToken, &__block_literal_global);
  }
  return isWideScreen_isWideScreen;
}

+ (CGSize)minimumButtonSize
{
  double v2 = 44.0;
  double v3 = 44.0;
  result.height = v3;
  result.width = v2;
  return result;
}

void __34__TLKLayoutUtilities_isWideScreen__block_invoke()
{
  id v0 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v0 _referenceBounds];
  isWideScreen_isWideScreen = CGRectGetHeight(v2) > 568.0;
}

+ (void)requireIntrinsicSizeForView:(id)a3
{
  LODWORD(v3) = 1148846080;
  [a1 requireIntrinsicSizeForView:a3 withPriority:v3];
}

+ (void)requireIntrinsicSizeForView:(id)a3 withPriority:(float)a4
{
  id v9 = a3;
  *(float *)&double v5 = a4;
  [v9 setContentCompressionResistancePriority:0 forAxis:v5];
  *(float *)&double v6 = a4;
  [v9 setContentCompressionResistancePriority:1 forAxis:v6];
  *(float *)&double v7 = a4;
  [v9 setContentHuggingPriority:0 forAxis:v7];
  *(float *)&double v8 = a4;
  [v9 setContentHuggingPriority:1 forAxis:v8];
}

+ (double)ceilingValue:(double)a3 inView:(id)a4
{
  [a4 effectiveScreenScale];
  return ceil(v5 * a3) / v5;
}

+ (double)flooredValue:(double)a3 inView:(id)a4
{
  [a4 effectiveScreenScale];
  return floor(v5 * a3) / v5;
}

+ (double)roundedValue:(double)a3 inView:(id)a4
{
  objc_msgSend(a4, "tlks_scale");
  return round(v5 * a3) / v5;
}

+ (double)deviceScaledRoundedValue:(double)a3 forView:(id)a4
{
  id v4 = objc_msgSend(a4, "tlks_screen");
  UIRoundToScreenScale();
  double v6 = v5;

  return v6;
}

+ (CGRect)deviceScaledRoundedRect:(CGRect)a3 forView:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  [a1 deviceScaledRoundedValue:v9 forView:x];
  double v11 = v10;
  [a1 deviceScaledRoundedValue:v9 forView:y];
  double v13 = v12;
  [a1 deviceScaledRoundedValue:v9 forView:width];
  double v15 = v14;
  [a1 deviceScaledRoundedValue:v9 forView:height];
  double v17 = v16;

  double v18 = v11;
  double v19 = v13;
  double v20 = v15;
  double v21 = v17;
  result.size.double height = v21;
  result.size.double width = v20;
  result.origin.double y = v19;
  result.origin.double x = v18;
  return result;
}

+ (UIEdgeInsets)deviceScaledRoundedInsets:(UIEdgeInsets)a3 forView:(id)a4
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  id v9 = a4;
  [a1 deviceScaledRoundedValue:v9 forView:top];
  double v11 = v10;
  [a1 deviceScaledRoundedValue:v9 forView:left];
  double v13 = v12;
  [a1 deviceScaledRoundedValue:v9 forView:bottom];
  double v15 = v14;
  [a1 deviceScaledRoundedValue:v9 forView:right];
  double v17 = v16;

  double v18 = v11;
  double v19 = v13;
  double v20 = v15;
  double v21 = v17;
  result.double right = v21;
  result.double bottom = v20;
  result.double left = v19;
  result.double top = v18;
  return result;
}

+ (CGSize)deviceScaledRoundedSize:(CGSize)a3 forView:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  [a1 deviceScaledRoundedValue:v7 forView:width];
  double v9 = v8;
  [a1 deviceScaledRoundedValue:v7 forView:height];
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.double height = v13;
  result.double width = v12;
  return result;
}

+ (double)deviceScaledFlooredValue:(double)a3 forView:(id)a4
{
  uint64_t v5 = objc_msgSend(a4, "tlks_scale");
  v6.n128_u64[0] = v7.n128_u64[0];
  v7.n128_f64[0] = a3;
  MEMORY[0x1F4166C08](v5, v7, v6);
  return result;
}

+ (double)scaledValueForValue:(double)a3 withFont:(id)a4 view:(id)a5
{
  id v8 = a5;
  [a4 _scaledValueForValue:a3];
  objc_msgSend(a1, "deviceScaledRoundedValue:forView:", v8);
  double v10 = v9;

  return v10;
}

+ (void)setDynamicBaselineAlignmentsForLabel:(id)a3 top:(double)a4 bottom:(double)a5 view:(id)a6
{
  id v10 = a6;
  id v21 = a3;
  [v21 effectiveFirstBaselineOffsetFromTop];
  double v12 = v11;
  double v13 = [v21 font];
  [a1 scaledValueForValue:v13 withFont:v10 view:a4];
  double v15 = v12 - v14;
  [v21 effectiveBaselineOffsetFromBottom];
  double v17 = v16;
  double v18 = [v21 font];
  [a1 scaledValueForValue:v18 withFont:v10 view:a5];
  double v20 = v19;

  objc_msgSend(v21, "setCustomAlignmentRectInsets:", v15, 0.0, v17 - v20, 0.0);
}

+ (CGSize)idealImageSizeWithSize:(CGSize)result fittingSize:(CGSize)a4
{
  if (result.width >= a4.width || result.height >= a4.height)
  {
    double v5 = a4.width / result.width;
    if (result.width == 0.0) {
      double v5 = 0.0;
    }
    double v6 = a4.height / result.height;
    if (result.height == 0.0) {
      double v6 = 0.0;
    }
    double v7 = fmin(v5, v6);
    result.double width = result.width * v7;
    result.double height = result.height * v7;
  }
  return result;
}

+ (BOOL)widthIsCompact:(double)a3
{
  return a3 < 318.0;
}

+ (void)applyRowBoundedSizingToImageView:(id)a3 isCompactWidth:(BOOL)a4
{
  BOOL v4 = a4;
  id v25 = a3;
  [(id)objc_opt_class() maxThumbnailSizeIsCompactWidth:v4];
  double v6 = v5;
  double v8 = v7;
  double v9 = [v25 tlkImage];
  [v9 size];
  double v11 = v10;
  double v13 = v12;

  double v14 = *MEMORY[0x1E4F1DB30];
  double v15 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if (v11 <= 0.0 || v11 > 29.0 || v13 > 29.0)
  {
    BOOL v18 = v11 == v14 && v13 == v15;
    double v19 = v25;
    if (v18)
    {
      v22 = [v25 tlkImage];
      [v22 aspectRatio];
      if (v23 == 0.0) {
        double v24 = 1.0;
      }
      else {
        double v24 = v23;
      }

      double v8 = v6 / v24;
      double v19 = v25;
      double v21 = v6;
      double v20 = v8;
    }
    else
    {
      double v20 = 0.0;
      double v21 = v6;
    }
    objc_msgSend(v19, "setMinimumLayoutSize:", v21, v20);
  }
  else
  {
    objc_msgSend(v25, "setMinimumLayoutSize:", v14, v15);
    double v6 = *MEMORY[0x1E4F4BED0];
    double v8 = *(double *)(MEMORY[0x1E4F4BED0] + 8);
  }
  objc_msgSend(v25, "setMaximumLayoutSize:", v6, v8);
}

+ (CGSize)maxThumbnailSize
{
  [a1 maxThumbnailSizeIsCompactWidth:0];
  result.double height = v3;
  result.double width = v2;
  return result;
}

+ (CGSize)maxThumbnailSizeIsCompactWidth:(BOOL)a3
{
  if (a3)
  {
    double v3 = 45.0;
    double v4 = 40.0;
  }
  else
  {
    int v5 = [a1 isWideScreen];
    double v3 = 67.5;
    if (!v5) {
      double v3 = 45.0;
    }
    double v4 = 40.0;
    if (v5) {
      double v4 = 60.0;
    }
  }
  result.double height = v3;
  result.double width = v4;
  return result;
}

+ (double)contentHeightOfTableView:(id)a3 forWidth:(double)a4 maxHeight:(double)a5
{
  id v7 = a3;
  double v8 = [v7 superview];
  [v8 frame];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  double v17 = [v7 superview];
  objc_msgSend(v17, "setFrame:", v10, v12, a4, a5);

  [v7 frame];
  double v33 = v19;
  double v34 = v18;
  double v21 = v20;
  double v23 = v22;
  [v7 contentSize];
  if (v24 == 0.0)
  {
    BOOL v26 = 0;
  }
  else
  {
    [v7 contentSize];
    BOOL v26 = v25 < a5;
    if (v25 < a5)
    {
      double v27 = v25;
      do
      {
        [v7 frame];
        objc_msgSend(v7, "setFrame:");
        [v7 layoutIfNeeded];
        [v7 contentSize];
        if (v27 == v28) {
          break;
        }
        [v7 contentSize];
        double v27 = v29;
      }
      while (v29 < a5);
    }
  }
  if ([v7 numberOfSections])
  {
    objc_msgSend(v7, "rectForSection:", objc_msgSend(v7, "numberOfSections") - 1);
    CGFloat MaxY = CGRectGetMaxY(v35);
    if (!v26) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  CGFloat MaxY = 0.0;
  if (v26) {
LABEL_10:
  }
    objc_msgSend(v7, "setFrame:", v34, v21, v23, v33);
LABEL_11:
  if (MaxY <= a5) {
    a5 = MaxY;
  }
  v31 = [v7 superview];
  objc_msgSend(v31, "setFrame:", v10, v12, v14, v16);

  return a5;
}

+ (id)tappableControlViewForPoint:(CGPoint)a3 inView:(id)a4 withEvent:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v164 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  if (!objc_msgSend(v8, "pointInside:withEvent:", v9, x, y)) {
    goto LABEL_68;
  }
  v130.double x = x;
  v130.double y = y;
  id v131 = v9;
  +[TLKLayoutUtilities minimumButtonSize];
  double v145 = v10;
  double v12 = v11;
  double v13 = [(id)objc_opt_class() controlsInView:v8];
  double v14 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  long long v157 = 0u;
  long long v158 = 0u;
  long long v159 = 0u;
  long long v160 = 0u;
  obuint64_t j = v13;
  uint64_t v15 = [obj countByEnumeratingWithState:&v157 objects:v163 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v158;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v158 != v17) {
          objc_enumerationMutation(obj);
        }
        double v19 = *(void **)(*((void *)&v157 + 1) + 8 * i);
        long long v153 = 0u;
        long long v154 = 0u;
        long long v155 = 0u;
        long long v156 = 0u;
        id v20 = obj;
        uint64_t v21 = [v20 countByEnumeratingWithState:&v153 objects:v162 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          uint64_t v23 = *(void *)v154;
          while (2)
          {
            for (uint64_t j = 0; j != v22; ++j)
            {
              if (*(void *)v154 != v23) {
                objc_enumerationMutation(v20);
              }
              if (v19 != *(void **)(*((void *)&v153 + 1) + 8 * j)
                && (objc_msgSend(v19, "isDescendantOfView:") & 1) != 0)
              {
                double v33 = v20;
                goto LABEL_26;
              }
            }
            uint64_t v22 = [v20 countByEnumeratingWithState:&v153 objects:v162 count:16];
            if (v22) {
              continue;
            }
            break;
          }
        }

        if ([v19 isEnabled]
          && [(id)objc_opt_class() viewIsVisible:v19])
        {
          [v19 bounds];
          CGFloat v25 = v166.origin.x;
          CGFloat v26 = v166.origin.y;
          CGFloat width = v166.size.width;
          CGFloat height = v166.size.height;
          double v29 = CGRectGetWidth(v166) - v145;
          if (v29 >= 0.0) {
            double v30 = 0.0;
          }
          else {
            double v30 = v29 * 0.5;
          }
          v167.origin.double x = v25;
          v167.origin.double y = v26;
          v167.size.CGFloat width = width;
          v167.size.CGFloat height = height;
          double v31 = CGRectGetHeight(v167) - v12;
          if (v31 >= 0.0) {
            double v32 = 0.0;
          }
          else {
            double v32 = v31 * 0.5;
          }
          double v33 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithUIEdgeInsets:", v32, v30, v32, v30);
          [v14 setObject:v33 forKey:v19];
LABEL_26:
        }
      }
      uint64_t v16 = [v20 countByEnumeratingWithState:&v157 objects:v163 count:16];
    }
    while (v16);
  }

  id v34 = [v14 keyEnumerator];
  CGRect v35 = [v34 allObjects];

  if ([v35 count])
  {
    uint64_t v36 = 0;
    id v34 = (id)0x1E5FD2000;
    while (1)
    {
      v37 = [v35 objectAtIndexedSubscript:v36];
      uint64_t v38 = v36 + 1;
      unint64_t v132 = v36 + 1;
      if (v36 + 1 < (unint64_t)[v35 count]) {
        break;
      }
LABEL_53:

      ++v36;
      if (v132 >= [v35 count]) {
        goto LABEL_54;
      }
    }
    while (1)
    {
      v39 = [v14 objectForKey:v37];
      [v39 UIEdgeInsetsValue];
      double v41 = v40;
      double v43 = v42;
      double v45 = v44;
      double v47 = v46;

      [v37 bounds];
      double v146 = v45;
      double v147 = v47;
      double v143 = v41;
      double v144 = v43;
      objc_msgSend(v8, "convertRect:fromView:", v37, v43 + v48, v41 + v49, v50 - (v43 + v47), v51 - (v41 + v45));
      CGFloat v53 = v52;
      CGFloat v55 = v54;
      CGFloat v57 = v56;
      CGFloat v59 = v58;
      v60 = [v35 objectAtIndexedSubscript:v38];
      v61 = [v14 objectForKey:v60];
      [v61 UIEdgeInsetsValue];
      double v63 = v62;
      double v65 = v64;
      double v67 = v66;
      double v69 = v68;

      [v60 bounds];
      double v141 = v65;
      double v142 = v63;
      double v139 = v69;
      double v140 = v67;
      objc_msgSend(v8, "convertRect:fromView:", v60, v65 + v70, v63 + v71, v72 - (v65 + v69), v73 - (v63 + v67));
      v176.origin.double x = v74;
      v176.origin.double y = v75;
      v176.size.CGFloat width = v76;
      v176.size.CGFloat height = v77;
      CGFloat v137 = v53;
      CGFloat v138 = v57;
      v168.origin.double x = v53;
      v168.origin.double y = v55;
      v168.size.CGFloat width = v57;
      v168.size.CGFloat height = v59;
      CGFloat v135 = v176.origin.x;
      CGFloat v136 = v176.size.width;
      CGFloat v133 = v176.origin.y;
      CGFloat v134 = v176.size.height;
      CGRect v169 = CGRectIntersection(v168, v176);
      CGFloat v78 = v169.origin.x;
      CGFloat v79 = v169.origin.y;
      CGFloat v80 = v169.size.width;
      CGFloat v81 = v169.size.height;
      +[TLKUtilities pixelWidthForView:v8];
      double v83 = v82 + v82;
      v170.origin.double x = v78;
      v170.origin.double y = v79;
      v170.size.CGFloat width = v80;
      v170.size.CGFloat height = v81;
      double v84 = CGRectGetWidth(v170) * 0.5 - v83;
      if (v84 >= 0.0) {
        double v85 = v84;
      }
      else {
        double v85 = 0.0;
      }
      v171.origin.double x = v78;
      v171.origin.double y = v79;
      v171.size.CGFloat width = v80;
      v171.size.CGFloat height = v81;
      double v86 = CGRectGetHeight(v171) * 0.5 - v83;
      if (v86 >= 0.0) {
        double v87 = v86;
      }
      else {
        double v87 = 0.0;
      }
      if (v85 != 0.0 && v85 < v87)
      {
        v173.origin.double x = v137;
        v173.size.CGFloat width = v138;
        v173.origin.double y = v55;
        v173.size.CGFloat height = v59;
        double MinX = CGRectGetMinX(v173);
        v174.origin.double x = v135;
        v174.size.CGFloat width = v136;
        v174.origin.double y = v133;
        v174.size.CGFloat height = v134;
        if (MinX >= CGRectGetMinX(v174))
        {
          double v97 = v146;
          double v100 = v144 + v85;
          double v94 = v140;
          double v95 = v139 + v85;
          double v96 = v147;
          double v99 = v142;
          double v98 = v143;
LABEL_51:
          double v102 = v141;
          goto LABEL_52;
        }
        double v97 = v146;
        double v96 = v147 + v85;
        double v99 = v142;
        double v102 = v141 + v85;
        double v98 = v143;
        double v100 = v144;
      }
      else
      {
        CGFloat v89 = v137;
        CGFloat v90 = v138;
        CGFloat v91 = v55;
        CGFloat v92 = v59;
        if (v87 != 0.0)
        {
          double MinY = CGRectGetMinY(*(CGRect *)&v89);
          v172.origin.double x = v135;
          v172.origin.double y = v133;
          v172.size.CGFloat width = v136;
          v172.size.CGFloat height = v134;
          double v95 = v139;
          double v94 = v140;
          if (MinY >= CGRectGetMinY(v172))
          {
            double v100 = v144;
            double v98 = v143 + v87;
            double v94 = v140 + v87;
            double v97 = v146;
            double v96 = v147;
            double v99 = v142;
          }
          else
          {
            double v96 = v147;
            double v97 = v146 + v87;
            double v98 = v143;
            double v99 = v142 + v87;
            double v100 = v144;
          }
          goto LABEL_51;
        }
        double v97 = v146;
        double v96 = v147;
        double v98 = v143;
        double v100 = v144;
        double v102 = v141;
        double v99 = v142;
      }
      double v95 = v139;
      double v94 = v140;
LABEL_52:
      v103 = (void *)MEMORY[0x1E4F29238];
      +[TLKLayoutUtilities deviceScaledRoundedInsets:forView:](TLKLayoutUtilities, "deviceScaledRoundedInsets:forView:", v8, v98, v100, v97, v96);
      v104 = objc_msgSend(v103, "valueWithUIEdgeInsets:");
      [v14 setObject:v104 forKey:v37];

      v105 = (void *)MEMORY[0x1E4F29238];
      +[TLKLayoutUtilities deviceScaledRoundedInsets:forView:](TLKLayoutUtilities, "deviceScaledRoundedInsets:forView:", v8, v99, v102, v94, v95);
      v106 = objc_msgSend(v105, "valueWithUIEdgeInsets:");
      [v14 setObject:v106 forKey:v60];

      if (++v38 >= (unint64_t)[v35 count]) {
        goto LABEL_53;
      }
    }
  }
LABEL_54:
  long long v151 = 0u;
  long long v152 = 0u;
  long long v149 = 0u;
  long long v150 = 0u;
  id v107 = v35;
  uint64_t v108 = [v107 countByEnumeratingWithState:&v149 objects:v161 count:16];
  if (v108)
  {
    id v34 = (id)v108;
    uint64_t v109 = *(void *)v150;
    while (2)
    {
      for (k = 0; k != v34; k = (char *)k + 1)
      {
        if (*(void *)v150 != v109) {
          objc_enumerationMutation(v107);
        }
        v111 = *(void **)(*((void *)&v149 + 1) + 8 * (void)k);
        v112 = [v14 objectForKey:v111];
        [v112 UIEdgeInsetsValue];
        double v114 = v113;
        double v116 = v115;
        double v118 = v117;
        double v120 = v119;

        [v111 bounds];
        objc_msgSend(v8, "convertRect:fromView:", v111, v116 + v121, v114 + v122, v123 - (v116 + v120), v124 - (v114 + v118));
        if (CGRectContainsPoint(v175, v130))
        {
          [v111 convertPoint:v8 fromView:v130];
          id v9 = v131;
          uint64_t v126 = objc_msgSend(v111, "hitTest:withEvent:", v131);
          v127 = (void *)v126;
          if (v126) {
            v128 = (void *)v126;
          }
          else {
            v128 = v111;
          }
          id v34 = v128;

          int v125 = 0;
          goto LABEL_67;
        }
      }
      id v34 = (id)[v107 countByEnumeratingWithState:&v149 objects:v161 count:16];
      if (v34) {
        continue;
      }
      break;
    }
  }
  int v125 = 1;
  id v9 = v131;
LABEL_67:

  if (v125) {
LABEL_68:
  }
    id v34 = 0;

  return v34;
}

+ (BOOL)viewIsVisible:(id)a3
{
  id v4 = a3;
  int v5 = [v4 superview];
  if (([v4 isHidden] & 1) != 0
    || ([v4 alpha], v6 <= 0.0)
    || ([v4 bounds], CGRectEqualToRect(v9, *MEMORY[0x1E4F1DB28])))
  {
    char v7 = 0;
  }
  else if (v5)
  {
    char v7 = [a1 viewIsVisible:v5];
  }
  else
  {
    char v7 = 1;
  }

  return v7;
}

+ (BOOL)isLTR
{
  double v2 = [MEMORY[0x1E4FB1438] sharedApplication];
  BOOL v3 = [v2 userInterfaceLayoutDirection] == 0;

  return v3;
}

@end