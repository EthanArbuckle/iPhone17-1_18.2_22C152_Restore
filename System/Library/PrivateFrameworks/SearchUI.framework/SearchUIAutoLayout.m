@interface SearchUIAutoLayout
+ (BOOL)frame:(CGRect)a3 isVisibleInBounds:(CGRect)a4;
+ (BOOL)view:(id)a3 isVisibleInBounds:(CGRect)a4 ofView:(id)a5;
+ (CGRect)rect:(CGRect)a3 insettedBy:(NSDirectionalEdgeInsets)a4 isLTR:(BOOL)a5;
+ (double)roundedItemCornerRadius;
+ (double)sectionCornerRadius;
+ (double)selectionBorderWidth;
+ (id)alignLeadingView:(id)a3 toTrailingView:(id)a4;
+ (id)alignLeadingView:(id)a3 toTrailingView:(id)a4 priority:(float)a5;
+ (id)alignLeadingView:(id)a3 toTrailingView:(id)a4 spacing:(double)a5;
+ (id)alignLeadingView:(id)a3 toTrailingView:(id)a4 spacing:(double)a5 minimum:(BOOL)a6;
+ (id)alignLeadingView:(id)a3 toTrailingView:(id)a4 spacing:(double)a5 minimum:(BOOL)a6 priority:(float)a7;
+ (id)alignLeadingView:(id)a3 toTrailingView:(id)a4 spacing:(double)a5 priority:(float)a6;
+ (id)alignView:(id)a3 attribute:(int64_t)a4 relatedBy:(int64_t)a5 toView:(id)a6 attribute:(int64_t)a7 constant:(double)a8;
+ (id)alignView:(id)a3 attribute:(int64_t)a4 relatedBy:(int64_t)a5 toView:(id)a6 attribute:(int64_t)a7 constant:(double)a8 priority:(float)a9;
+ (id)alignView:(id)a3 attribute:(int64_t)a4 toView:(id)a5 attribute:(int64_t)a6;
+ (id)alignView:(id)a3 attribute:(int64_t)a4 toView:(id)a5 attribute:(int64_t)a6 constant:(double)a7;
+ (id)alignView:(id)a3 attribute:(int64_t)a4 toView:(id)a5 attribute:(int64_t)a6 priority:(float)a7;
+ (id)alignView:(id)a3 toView:(id)a4 withAttribute:(int64_t)a5;
+ (id)alignView:(id)a3 toView:(id)a4 withAttribute:(int64_t)a5 constant:(double)a6;
+ (id)alignView:(id)a3 toView:(id)a4 withAttribute:(int64_t)a5 priority:(float)a6;
+ (id)alignView:(id)a3 toView:(id)a4 withAttribute:(int64_t)a5 relatedBy:(int64_t)a6;
+ (id)baselineAlignBottomView:(id)a3 toTopView:(id)a4;
+ (id)baselineAlignBottomView:(id)a3 toTopView:(id)a4 dynamicSpacing:(double)a5;
+ (id)baselineAlignBottomView:(id)a3 toTopView:(id)a4 dynamicSpacing:(double)a5 forFont:(id)a6;
+ (id)baselineAlignBottomView:(id)a3 toTopView:(id)a4 dynamicSpacing:(double)a5 forFont:(id)a6 minimum:(BOOL)a7;
+ (id)baselineAlignBottomView:(id)a3 toTopView:(id)a4 dynamicSpacing:(double)a5 minimum:(BOOL)a6;
+ (id)baselineAlignBottomView:(id)a3 toTopView:(id)a4 dynamicSpacing:(double)a5 priority:(float)a6;
+ (id)baselineAlignBottomView:(id)a3 toTopView:(id)a4 spacing:(double)a5;
+ (id)baselineAlignBottomView:(id)a3 toTopView:(id)a4 spacing:(double)a5 isDynamic:(BOOL)a6 forFont:(id)a7 minimum:(BOOL)a8;
+ (id)baselineAlignBottomView:(id)a3 toTopView:(id)a4 spacing:(double)a5 isDynamic:(BOOL)a6 forFont:(id)a7 minimum:(BOOL)a8 priority:(float)a9;
+ (id)baselineAlignBottomView:(id)a3 toTopView:(id)a4 spacing:(double)a5 minimum:(BOOL)a6;
+ (id)baselineAlignBottomView:(id)a3 toTopView:(id)a4 spacing:(double)a5 priority:(float)a6;
+ (id)installConstraintsWithVisualFormat:(id)a3 views:(id)a4;
+ (id)installConstraintsWithVisualFormat:(id)a3 views:(id)a4 metrics:(id)a5;
+ (id)installConstraintsWithVisualFormat:(id)a3 views:(id)a4 options:(unint64_t)a5;
+ (id)installConstraintsWithVisualFormat:(id)a3 withViews:(id)a4 metrics:(id)a5 options:(unint64_t)a6;
+ (id)setHeight:(double)a3 forView:(id)a4;
+ (id)setWidth:(double)a3 forView:(id)a4;
+ (void)alignViews:(id)a3 withAttribute:(int64_t)a4;
+ (void)constrainViewHeightContainer:(id)a3;
+ (void)constrainViewToContainer:(id)a3;
+ (void)constrainViewWidthToContainer:(id)a3;
+ (void)enableAutoLayoutForItems:(id)a3;
+ (void)fillContainerWithView:(id)a3;
+ (void)requireIntrinsicSizeForView:(id)a3;
+ (void)requireIntrinsicSizeForView:(id)a3 withPriority:(float)a4;
+ (void)setSize:(CGSize)a3 forView:(id)a4;
+ (void)setVisibility:(BOOL)a3 forView:(id)a4;
+ (void)spanContainerHeightForView:(id)a3;
+ (void)spanContainerWidthForView:(id)a3;
@end

@implementation SearchUIAutoLayout

+ (id)alignLeadingView:(id)a3 toTrailingView:(id)a4 spacing:(double)a5 minimum:(BOOL)a6 priority:(float)a7
{
  BOOL v8 = a6;
  id v12 = a4;
  id v13 = a3;
  int v14 = objc_msgSend(v13, "searchui_isContainedByItem:", v12);
  int v15 = objc_msgSend(v12, "searchui_isContainedByItem:", v13);
  if (v14) {
    uint64_t v17 = 6;
  }
  else {
    uint64_t v17 = 5;
  }
  if (v15) {
    uint64_t v18 = 5;
  }
  else {
    uint64_t v18 = 6;
  }
  *(float *)&double v16 = a7;
  v19 = [a1 alignView:v12 attribute:v17 relatedBy:v8 toView:v13 attribute:v18 constant:a5 priority:v16];

  return v19;
}

+ (id)alignView:(id)a3 attribute:(int64_t)a4 relatedBy:(int64_t)a5 toView:(id)a6 attribute:(int64_t)a7 constant:(double)a8 priority:(float)a9
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a6;
  uint64_t v18 = v17;
  if (v16)
  {
    if (v17 && (objc_msgSend(v16, "searchui_isContainedByItem:", v17) & 1) == 0)
    {
      if ((objc_msgSend(v18, "searchui_isContainedByItem:", v16) & 1) == 0)
      {
        v26[0] = v16;
        v26[1] = v18;
        v19 = (void *)MEMORY[0x1E4F1C978];
        v20 = (void **)v26;
        uint64_t v21 = 2;
        goto LABEL_6;
      }
      v27 = v18;
      v19 = (void *)MEMORY[0x1E4F1C978];
      v20 = &v27;
    }
    else
    {
      v28[0] = v16;
      v19 = (void *)MEMORY[0x1E4F1C978];
      v20 = (void **)v28;
    }
    uint64_t v21 = 1;
LABEL_6:
    v22 = [v19 arrayWithObjects:v20 count:v21];
    [a1 enableAutoLayoutForItems:v22];

    v23 = [MEMORY[0x1E4F28DC8] constraintWithItem:v16 attribute:a4 relatedBy:a5 toItem:v18 attribute:a7 multiplier:1.0 constant:a8];
    *(float *)&double v24 = a9;
    [v23 setPriority:v24];
    [v23 setActive:1];
    goto LABEL_8;
  }
  v23 = 0;
LABEL_8:

  return v23;
}

+ (void)enableAutoLayoutForItems:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        BOOL v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v9 = objc_msgSend(v8, "searchui_view");
        [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

        v10 = objc_msgSend(v8, "searchui_view");
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v11 = objc_msgSend(v8, "searchui_view");
          uint64_t v12 = [v11 textAlignment];

          if (v12) {
            continue;
          }
          v10 = objc_msgSend(v8, "searchui_view");
          [v10 setTextAlignment:4];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }
}

+ (void)fillContainerWithView:(id)a3
{
  id v4 = a3;
  [a1 spanContainerWidthForView:v4];
  [a1 spanContainerHeightForView:v4];
}

+ (void)spanContainerHeightForView:(id)a3
{
  id v11 = a3;
  [v11 frame];
  double v4 = v3;
  double v6 = v5;
  v7 = [v11 superview];
  [v7 bounds];
  double MinY = CGRectGetMinY(v13);

  v9 = [v11 superview];
  [v9 bounds];
  double Height = CGRectGetHeight(v14);

  objc_msgSend(v11, "setFrame:", v4, MinY, v6, Height);
  objc_msgSend(v11, "setAutoresizingMask:", objc_msgSend(v11, "autoresizingMask") | 0x10);
}

+ (void)spanContainerWidthForView:(id)a3
{
  id v11 = a3;
  [v11 frame];
  double v4 = v3;
  double v6 = v5;
  v7 = [v11 superview];
  [v7 bounds];
  double MinX = CGRectGetMinX(v13);

  v9 = [v11 superview];
  [v9 bounds];
  double Width = CGRectGetWidth(v14);

  objc_msgSend(v11, "setFrame:", MinX, v4, Width, v6);
  objc_msgSend(v11, "setAutoresizingMask:", objc_msgSend(v11, "autoresizingMask") | 2);
}

+ (double)sectionCornerRadius
{
  int v2 = TLKSnippetModernizationEnabled();
  double result = 13.5;
  if (v2) {
    return 20.0;
  }
  return result;
}

+ (double)selectionBorderWidth
{
  int v2 = [MEMORY[0x1E4FAE198] isMacOS];
  double result = 3.0;
  if (v2) {
    return 2.0;
  }
  return result;
}

+ (void)constrainViewToContainer:(id)a3
{
  id v4 = a3;
  [a1 constrainViewWidthToContainer:v4];
  [a1 constrainViewHeightContainer:v4];
}

+ (void)constrainViewHeightContainer:(id)a3
{
  id v8 = a3;
  id v4 = objc_msgSend(v8, "searchui_containingView");
  id v5 = (id)[a1 alignView:v8 toView:v4 withAttribute:4];

  double v6 = objc_msgSend(v8, "searchui_containingView");
  id v7 = (id)[a1 alignView:v8 toView:v6 withAttribute:3];
}

+ (id)alignView:(id)a3 toView:(id)a4 withAttribute:(int64_t)a5
{
  return (id)objc_msgSend(a1, "alignView:attribute:toView:attribute:constant:", a3, a5, a4, 0.0);
}

+ (id)alignView:(id)a3 attribute:(int64_t)a4 toView:(id)a5 attribute:(int64_t)a6 constant:(double)a7
{
  return (id)[a1 alignView:a3 attribute:a4 relatedBy:0 toView:a5 attribute:a6 constant:a7];
}

+ (id)alignView:(id)a3 attribute:(int64_t)a4 relatedBy:(int64_t)a5 toView:(id)a6 attribute:(int64_t)a7 constant:(double)a8
{
  LODWORD(v8) = 1148846080;
  return (id)[a1 alignView:a3 attribute:a4 relatedBy:a5 toView:a6 attribute:a7 constant:a8 priority:v8];
}

+ (void)constrainViewWidthToContainer:(id)a3
{
  id v8 = a3;
  id v4 = objc_msgSend(v8, "searchui_containingView");
  id v5 = (id)[a1 alignLeadingView:v4 toTrailingView:v8];

  double v6 = objc_msgSend(v8, "searchui_containingView");
  id v7 = (id)[a1 alignLeadingView:v8 toTrailingView:v6];
}

+ (id)alignLeadingView:(id)a3 toTrailingView:(id)a4 spacing:(double)a5 priority:(float)a6
{
  return (id)objc_msgSend(a1, "alignLeadingView:toTrailingView:spacing:minimum:priority:", a3, a4, 0, a5);
}

+ (id)alignLeadingView:(id)a3 toTrailingView:(id)a4 spacing:(double)a5
{
  LODWORD(v5) = 1148846080;
  return (id)[a1 alignLeadingView:a3 toTrailingView:a4 spacing:a5 priority:v5];
}

+ (id)alignLeadingView:(id)a3 toTrailingView:(id)a4
{
  return (id)[a1 alignLeadingView:a3 toTrailingView:a4 spacing:0.0];
}

+ (id)alignLeadingView:(id)a3 toTrailingView:(id)a4 priority:(float)a5
{
  *(float *)&double v5 = a5;
  return (id)[a1 alignLeadingView:a3 toTrailingView:a4 spacing:0 minimum:0.0 priority:v5];
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

+ (void)requireIntrinsicSizeForView:(id)a3
{
  LODWORD(v3) = 1148846080;
  [a1 requireIntrinsicSizeForView:a3 withPriority:v3];
}

+ (BOOL)view:(id)a3 isVisibleInBounds:(CGRect)a4 ofView:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if ([v7 isHidden])
  {
    char v9 = 0;
  }
  else
  {
    [v7 bounds];
    objc_msgSend(v8, "convertRect:fromView:", v7);
    char v9 = objc_msgSend(a1, "frame:isVisibleInBounds:");
  }

  return v9;
}

+ (BOOL)frame:(CGRect)a3 isVisibleInBounds:(CGRect)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  CGRect v15 = CGRectIntersection(a3, a4);
  CGFloat v8 = v15.origin.y;
  CGFloat v9 = v15.size.width;
  CGFloat v10 = v15.size.height;
  CGFloat rect = v15.origin.x;
  double v11 = CGRectGetHeight(v15);
  v16.origin.CGFloat x = x;
  v16.origin.CGFloat y = y;
  v16.size.CGFloat width = width;
  v16.size.CGFloat height = height;
  if (v11 / CGRectGetHeight(v16) <= 0.5) {
    return 0;
  }
  v17.origin.CGFloat x = rect;
  v17.origin.CGFloat y = v8;
  v17.size.CGFloat width = v9;
  v17.size.CGFloat height = v10;
  double v12 = CGRectGetWidth(v17);
  v18.origin.CGFloat x = x;
  v18.origin.CGFloat y = y;
  v18.size.CGFloat width = width;
  v18.size.CGFloat height = height;
  return v12 / CGRectGetWidth(v18) > 0.5;
}

+ (id)baselineAlignBottomView:(id)a3 toTopView:(id)a4
{
  return (id)[a1 baselineAlignBottomView:a3 toTopView:a4 spacing:0.0];
}

+ (id)baselineAlignBottomView:(id)a3 toTopView:(id)a4 spacing:(double)a5
{
  LODWORD(v5) = 1148846080;
  return (id)[a1 baselineAlignBottomView:a3 toTopView:a4 spacing:a5 priority:v5];
}

+ (id)baselineAlignBottomView:(id)a3 toTopView:(id)a4 spacing:(double)a5 priority:(float)a6
{
  return (id)objc_msgSend(a1, "baselineAlignBottomView:toTopView:spacing:isDynamic:forFont:minimum:priority:", a3, a4, 0, 0, 0, a5);
}

+ (id)alignView:(id)a3 toView:(id)a4 withAttribute:(int64_t)a5 priority:(float)a6
{
  *(float *)&double v6 = a6;
  return (id)[a1 alignView:a3 attribute:a5 relatedBy:0 toView:a4 attribute:a5 constant:0.0 priority:v6];
}

+ (id)baselineAlignBottomView:(id)a3 toTopView:(id)a4 spacing:(double)a5 isDynamic:(BOOL)a6 forFont:(id)a7 minimum:(BOOL)a8 priority:(float)a9
{
  BOOL v47 = a8;
  BOOL v11 = a6;
  id v15 = a3;
  id v16 = a4;
  id v17 = a7;
  char v18 = objc_msgSend(v15, "searchui_isContainedByItem:", v16);
  int v46 = objc_msgSend(v16, "searchui_isContainedByItem:", v15);
  if ((v46 & 1) == 0)
  {
    v23 = objc_msgSend(v15, "searchui_view");
    if (v23)
    {
      double v24 = objc_msgSend(v15, "searchui_view");
      id v19 = [v24 viewForFirstBaselineLayout];
    }
    else
    {
      id v19 = v15;
    }

    if ((v18 & 1) == 0) {
      goto LABEL_3;
    }
LABEL_11:
    id v22 = v16;
    uint64_t v25 = 3;
    goto LABEL_12;
  }
  id v19 = v15;
  if (v18) {
    goto LABEL_11;
  }
LABEL_3:
  v20 = objc_msgSend(v16, "searchui_view");
  if (v20)
  {
    uint64_t v21 = objc_msgSend(v16, "searchui_view");
    id v22 = [v21 viewForLastBaselineLayout];
  }
  else
  {
    id v22 = v16;
  }

  uint64_t v25 = 4;
LABEL_12:
  uint64_t v45 = v25;
  v48 = v19;
  int v26 = objc_opt_respondsToSelector();
  int v27 = objc_opt_respondsToSelector();
  int v28 = v27;
  if (!v17 && v11)
  {
    if ((v26 | v27))
    {
      if (v26) {
        v29 = v48;
      }
      else {
        v29 = v22;
      }
      id v17 = [v29 font];
    }
    else
    {
      id v17 = 0;
    }
  }
  v30 = (void *)MEMORY[0x1E4FAE100];
  v31 = objc_msgSend(v15, "searchui_view");
  if (v31)
  {
    [v30 scaledValueForValue:v17 withFont:v31 view:a5];
    double v33 = v32;
  }
  else
  {
    objc_msgSend(v16, "searchui_view");
    v34 = id v44 = a1;
    [v30 scaledValueForValue:v17 withFont:v34 view:a5];
    double v33 = v35;

    a1 = v44;
  }
  BOOL v36 = a5 > 0.0;
  if ((v36 & v28) != 0) {
    uint64_t v37 = 11;
  }
  else {
    uint64_t v37 = v45;
  }
  uint64_t v38 = 3;
  if (v46) {
    uint64_t v38 = 4;
  }
  if ((v36 & v26) != 0) {
    uint64_t v39 = 12;
  }
  else {
    uint64_t v39 = v38;
  }

  if (v11) {
    double v41 = v33;
  }
  else {
    double v41 = a5;
  }
  *(float *)&double v40 = a9;
  v42 = [a1 alignView:v48 attribute:v39 relatedBy:v47 toView:v22 attribute:v37 constant:v41 priority:v40];

  return v42;
}

+ (id)installConstraintsWithVisualFormat:(id)a3 views:(id)a4
{
  return (id)[a1 installConstraintsWithVisualFormat:a3 withViews:a4 metrics:0 options:0];
}

+ (id)installConstraintsWithVisualFormat:(id)a3 views:(id)a4 options:(unint64_t)a5
{
  return (id)[a1 installConstraintsWithVisualFormat:a3 withViews:a4 metrics:0 options:a5];
}

+ (id)installConstraintsWithVisualFormat:(id)a3 views:(id)a4 metrics:(id)a5
{
  return (id)[a1 installConstraintsWithVisualFormat:a3 withViews:a4 metrics:a5 options:0];
}

+ (id)installConstraintsWithVisualFormat:(id)a3 withViews:(id)a4 metrics:(id)a5 options:(unint64_t)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  CGRect v13 = [v11 allValues];
  [a1 enableAutoLayoutForItems:v13];

  CGRect v14 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:v12 options:a6 metrics:v10 views:v11];

  [MEMORY[0x1E4F28DC8] activateConstraints:v14];
  return v14;
}

+ (id)alignView:(id)a3 toView:(id)a4 withAttribute:(int64_t)a5 constant:(double)a6
{
  return (id)objc_msgSend(a1, "alignView:attribute:toView:attribute:constant:", a3, a5, a4, a6);
}

+ (id)alignView:(id)a3 toView:(id)a4 withAttribute:(int64_t)a5 relatedBy:(int64_t)a6
{
  LODWORD(v6) = 1148846080;
  return (id)[a1 alignView:a3 attribute:a5 relatedBy:a6 toView:a4 attribute:a5 constant:0.0 priority:v6];
}

+ (id)alignView:(id)a3 attribute:(int64_t)a4 toView:(id)a5 attribute:(int64_t)a6
{
  LODWORD(v6) = 1148846080;
  return (id)[a1 alignView:a3 attribute:a4 toView:a5 attribute:a6 priority:v6];
}

+ (id)alignView:(id)a3 attribute:(int64_t)a4 toView:(id)a5 attribute:(int64_t)a6 priority:(float)a7
{
  *(float *)&double v7 = a7;
  return (id)[a1 alignView:a3 attribute:a4 relatedBy:0 toView:a5 attribute:a6 constant:0.0 priority:v7];
}

+ (id)alignLeadingView:(id)a3 toTrailingView:(id)a4 spacing:(double)a5 minimum:(BOOL)a6
{
  LODWORD(v6) = 1148846080;
  return (id)[a1 alignLeadingView:a3 toTrailingView:a4 spacing:a6 minimum:a5 priority:v6];
}

+ (id)setWidth:(double)a3 forView:(id)a4
{
  return (id)[a1 alignView:a4 toView:0 withAttribute:7 constant:a3];
}

+ (id)setHeight:(double)a3 forView:(id)a4
{
  return (id)[a1 alignView:a4 toView:0 withAttribute:8 constant:a3];
}

+ (void)setSize:(CGSize)a3 forView:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v9 = a4;
  id v7 = (id)[a1 setWidth:v9 forView:width];
  id v8 = (id)[a1 setHeight:v9 forView:height];
}

+ (void)alignViews:(id)a3 withAttribute:(int64_t)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [v6 firstObject];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        CGRect v13 = *(void **)(*((void *)&v15 + 1) + 8 * v12);
        if (v13 != v7) {
          id v14 = (id)objc_msgSend(a1, "alignView:toView:withAttribute:", v13, v7, a4, (void)v15);
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }
}

+ (id)baselineAlignBottomView:(id)a3 toTopView:(id)a4 spacing:(double)a5 minimum:(BOOL)a6
{
  return (id)[a1 baselineAlignBottomView:a3 toTopView:a4 spacing:0 isDynamic:0 forFont:a6 minimum:a5];
}

+ (id)baselineAlignBottomView:(id)a3 toTopView:(id)a4 dynamicSpacing:(double)a5
{
  LODWORD(v5) = 1148846080;
  return (id)[a1 baselineAlignBottomView:a3 toTopView:a4 dynamicSpacing:a5 priority:v5];
}

+ (id)baselineAlignBottomView:(id)a3 toTopView:(id)a4 dynamicSpacing:(double)a5 priority:(float)a6
{
  return (id)objc_msgSend(a1, "baselineAlignBottomView:toTopView:spacing:isDynamic:forFont:minimum:priority:", a3, a4, 1, 0, 0, a5);
}

+ (id)baselineAlignBottomView:(id)a3 toTopView:(id)a4 dynamicSpacing:(double)a5 minimum:(BOOL)a6
{
  return (id)[a1 baselineAlignBottomView:a3 toTopView:a4 dynamicSpacing:0 forFont:a6 minimum:a5];
}

+ (id)baselineAlignBottomView:(id)a3 toTopView:(id)a4 dynamicSpacing:(double)a5 forFont:(id)a6
{
  return (id)[a1 baselineAlignBottomView:a3 toTopView:a4 dynamicSpacing:a6 forFont:0 minimum:a5];
}

+ (id)baselineAlignBottomView:(id)a3 toTopView:(id)a4 dynamicSpacing:(double)a5 forFont:(id)a6 minimum:(BOOL)a7
{
  return (id)[a1 baselineAlignBottomView:a3 toTopView:a4 spacing:1 isDynamic:a6 forFont:a7 minimum:a5];
}

+ (id)baselineAlignBottomView:(id)a3 toTopView:(id)a4 spacing:(double)a5 isDynamic:(BOOL)a6 forFont:(id)a7 minimum:(BOOL)a8
{
  LODWORD(v8) = 1148846080;
  return (id)[a1 baselineAlignBottomView:a3 toTopView:a4 spacing:a6 isDynamic:a7 forFont:a8 minimum:a5 priority:v8];
}

+ (void)setVisibility:(BOOL)a3 forView:(id)a4
{
  BOOL v4 = a3;
  if (a3) {
    float v5 = 1000.0;
  }
  else {
    float v5 = 0.0;
  }
  id v8 = a4;
  *(float *)&double v6 = v5;
  [v8 setContentCompressionResistancePriority:0 forAxis:v6];
  *(float *)&double v7 = v5;
  [v8 setContentCompressionResistancePriority:1 forAxis:v7];
  [v8 setHidden:!v4];
}

+ (double)roundedItemCornerRadius
{
  return 10.0;
}

+ (CGRect)rect:(CGRect)a3 insettedBy:(NSDirectionalEdgeInsets)a4 isLTR:(BOOL)a5
{
  if (a5) {
    double leading = a4.leading;
  }
  else {
    double leading = a4.trailing;
  }
  double v6 = a3.size.height - a4.top - a4.bottom;
  double v7 = a3.size.width - a4.leading - a4.trailing;
  double v8 = a3.origin.y + a4.top;
  double v9 = a3.origin.x + leading;
  result.size.double height = v6;
  result.size.double width = v7;
  result.origin.CGFloat y = v8;
  result.origin.CGFloat x = v9;
  return result;
}

@end