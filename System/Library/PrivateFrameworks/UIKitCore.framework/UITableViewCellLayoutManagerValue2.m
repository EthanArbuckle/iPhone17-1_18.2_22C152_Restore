@interface UITableViewCellLayoutManagerValue2
- (CGSize)intrinsicContentSizeForCell:(id)a3 rowWidth:(double)a4;
- (double)defaultDetailTextLabelFontSizeForCell:(id)a3;
- (double)defaultTextLabelFontSizeForCell:(id)a3;
- (id)defaultDetailTextLabelFontForCell:(id)a3;
- (id)detailTextLabelForCell:(id)a3;
- (id)imageViewForCell:(id)a3;
- (id)textLabelForCell:(id)a3;
- (void)getTextLabelRect:(CGRect *)a3 detailTextLabelRect:(CGRect *)a4 forCell:(id)a5 rowWidth:(double)a6 forSizing:(BOOL)a7;
- (void)layoutSubviewsOfCell:(id)a3;
@end

@implementation UITableViewCellLayoutManagerValue2

- (double)defaultTextLabelFontSizeForCell:(id)a3
{
  id v3 = a3;
  v4 = [v3 _constants];
  uint64_t v5 = [v3 _cellStyle];

  [v4 defaultTextLabelFontSizeForCellStyle:v5];
  double v7 = v6;

  return v7;
}

- (double)defaultDetailTextLabelFontSizeForCell:(id)a3
{
  return 18.0;
}

- (id)imageViewForCell:(id)a3
{
  return 0;
}

- (id)textLabelForCell:(id)a3
{
  id v3 = self;
  v8.receiver = self;
  v8.super_class = (Class)UITableViewCellLayoutManagerValue2;
  id v4 = a3;
  uint64_t v5 = [(UITableViewCellLayoutManager *)&v8 defaultLabelForCell:v4];
  LODWORD(v3) = -[UITableViewCellLayoutManager shouldApplyAccessibilityLargeTextLayoutForCell:](v3, "shouldApplyAccessibilityLargeTextLayoutForCell:", v4, v8.receiver, v8.super_class);

  if (v3) {
    uint64_t v6 = 4;
  }
  else {
    uint64_t v6 = 2;
  }
  [v5 setTextAlignment:v6];
  return v5;
}

- (id)detailTextLabelForCell:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)UITableViewCellLayoutManagerValue2;
  id v4 = a3;
  uint64_t v5 = [(UITableViewCellLayoutManager *)&v13 defaultLabelForCell:v4];
  uint64_t v6 = -[UITableViewCellLayoutManagerValue2 defaultDetailTextLabelFontForCell:](self, "defaultDetailTextLabelFontForCell:", v4, v13.receiver, v13.super_class);
  [v5 setFont:v6];

  double v7 = [v4 _constants];
  uint64_t v8 = [v4 _cellStyle];
  v9 = [v4 traitCollection];

  v10 = +[UICellConfigurationState _readonlyCellState:]((uint64_t)UICellConfigurationState, 0);
  v11 = [v7 defaultDetailTextColorForCellStyle:v8 traitCollection:v9 state:v10];
  [v5 setTextColor:v11];

  return v5;
}

- (id)defaultDetailTextLabelFontForCell:(id)a3
{
  id v3 = a3;
  id v4 = [v3 _constants];
  uint64_t v5 = [v3 _cellStyle];

  uint64_t v6 = [v4 defaultDetailTextFontForCellStyle:v5];

  return v6;
}

- (void)getTextLabelRect:(CGRect *)a3 detailTextLabelRect:(CGRect *)a4 forCell:(id)a5 rowWidth:(double)a6 forSizing:(BOOL)a7
{
  BOOL v7 = a7;
  id v77 = a5;
  [(UITableViewCellLayoutManager *)self textRectForCell:v77 rowWidth:v7 forSizing:a6];
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  double v17 = v16;
  double v19 = v18;
  v20 = [v77 _textLabel:0];
  v21 = [v77 _detailTextLabel:0];
  double v23 = *MEMORY[0x1E4F1DB30];
  double v22 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  double v24 = v22;
  double v25 = *MEMORY[0x1E4F1DB30];
  if (v20)
  {
    v26 = [v20 font];
    [v26 pointSize];
    double v28 = v27;

    if (v28 == 0.0)
    {
      v29 = [(UITableViewCellLayoutManager *)self defaultTextLabelFontForCell:v77];
      [v20 setFont:v29];
    }
    objc_msgSend(v20, "sizeThatFits:", v17, v19);
    double v31 = v30;
    if ([(UITableViewCellLayoutManager *)self shouldApplyAccessibilityLargeTextLayoutForCell:v77])
    {
      double v25 = v31;
    }
    else
    {
      double v25 = 91.0;
    }
    -[UITableViewCellLayoutManager optimumSizeForLabel:inTotalTextRect:minimizeWidthOnVerticalOverflow:preferSingleLineWidth:](self, "optimumSizeForLabel:inTotalTextRect:minimizeWidthOnVerticalOverflow:preferSingleLineWidth:", v20, 0, 0, 0.0, 0.0, v25, v19);
    double v24 = v32;
  }
  v33 = v77;
  if (v21)
  {
    BOOL v34 = [(UITableViewCellLayoutManager *)self shouldApplyAccessibilityLargeTextLayoutForCell:v77];
    double v35 = 0.0;
    if (v17 >= 0.0) {
      double v35 = v17;
    }
    if (v34) {
      double v36 = v35;
    }
    else {
      double v36 = v17 - v25 + -6.0;
    }
    -[UITableViewCellLayoutManager optimumSizeForLabel:inTotalTextRect:minimizeWidthOnVerticalOverflow:preferSingleLineWidth:](self, "optimumSizeForLabel:inTotalTextRect:minimizeWidthOnVerticalOverflow:preferSingleLineWidth:", v21, 0, 0, 0.0, 0.0, v36, v19);
    v33 = v77;
    double v23 = v37;
    double v22 = v38;
  }
  int v39 = v33[28];
  CGFloat v74 = v13;
  CGFloat v76 = v22;
  if ([(UITableViewCellLayoutManager *)self shouldApplyAccessibilityLargeTextLayoutForCell:"shouldApplyAccessibilityLargeTextLayoutForCell:"])
  {
    if ((v39 & 0x80000) != 0)
    {
      v79.origin.CGFloat x = v13;
      v79.origin.CGFloat y = v15;
      v79.size.CGFloat width = v17;
      v79.size.CGFloat height = v19;
      CGFloat v57 = CGRectGetMaxX(v79) - v25;
      v80.origin.CGFloat x = v13;
      v80.origin.CGFloat y = v15;
      v80.size.CGFloat width = v17;
      double v44 = v57;
      v80.size.CGFloat height = v19;
      double v40 = CGRectGetMaxX(v80) - v23;
      double v43 = 0.0;
      double v41 = v23;
      double v42 = v24 + 0.0;
    }
    else
    {
      double v40 = 0.0;
      double v41 = v23;
      double v42 = v24 + 0.0;
      double v43 = 0.0;
      double v44 = 0.0;
    }
  }
  else
  {
    double v72 = v25;
    double v45 = v24;
    CGFloat rect = v15;
    v46 = [v20 font];
    [v46 ascender];
    double v48 = v47;
    v49 = [v21 font];
    [v49 ascender];
    double v51 = v50;

    if (v48 >= v51)
    {
      v52 = [v20 font];
      [v52 ascender];
      double v59 = v58;
      v55 = [v21 font];
      [v55 ascender];
      double v42 = round(v59 - v60);
      double v43 = 0.0;
    }
    else
    {
      v52 = [v21 font];
      [v52 ascender];
      double v54 = v53;
      v55 = [v20 font];
      [v55 ascender];
      double v43 = round(v54 - v56);
      double v42 = 0.0;
    }

    double v24 = v45;
    if ((v39 & 0x80000) != 0)
    {
      v81.origin.CGFloat x = v13;
      v81.origin.CGFloat y = rect;
      v81.size.CGFloat width = v17;
      v81.size.CGFloat height = v19;
      double v25 = v72;
      double v44 = CGRectGetMaxX(v81) - v72;
      v82.origin.CGFloat x = v44;
      v82.origin.CGFloat y = v43;
      v82.size.CGFloat width = v72;
      v82.size.CGFloat height = v24;
      CGFloat MinX = CGRectGetMinX(v82);
      double v41 = v23;
      double v40 = MinX - v23 + -6.0;
    }
    else
    {
      double v25 = v72;
      double v40 = v72 + 6.0;
      double v44 = 0.0;
      double v41 = v23;
    }
  }
  CGFloat v73 = v42;
  v83.origin.CGFloat x = v44;
  v83.origin.CGFloat y = v43;
  v83.size.CGFloat width = v25;
  v83.size.CGFloat height = v24;
  CGFloat v62 = v40;
  double v63 = v42;
  CGFloat v64 = v41;
  CGFloat v65 = v76;
  CGRect v84 = CGRectUnion(v83, *(CGRect *)&v40);
  double v66 = ceil((v19 - v84.size.height) * 0.5);
  if ((*(void *)&v39 & 0x80000) != 0) {
    double v67 = 0.0;
  }
  else {
    double v67 = v74;
  }
  v85.origin.CGFloat x = v44;
  v85.origin.CGFloat y = v43;
  v85.size.CGFloat width = v25;
  v85.size.CGFloat height = v24;
  CGRect v86 = CGRectOffset(v85, v67, v66);
  CGFloat x = v86.origin.x;
  CGFloat y = v86.origin.y;
  CGFloat width = v86.size.width;
  CGFloat height = v86.size.height;
  v86.origin.CGFloat x = v62;
  v86.origin.CGFloat y = v73;
  v86.size.CGFloat width = v64;
  v86.size.CGFloat height = v76;
  CGRect v87 = CGRectOffset(v86, v67, v66);
  if (a3)
  {
    a3->origin.CGFloat x = x;
    a3->origin.CGFloat y = y;
    a3->size.CGFloat width = width;
    a3->size.CGFloat height = height;
  }
  if (a4) {
    *a4 = v87;
  }
}

- (void)layoutSubviewsOfCell:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)UITableViewCellLayoutManagerValue2;
  [(UITableViewCellLayoutManager *)&v22 layoutSubviewsOfCell:v4];
  uint64_t v5 = [v4 _textLabel:0];
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    if ([(UITableViewCellLayoutManager *)self shouldApplyAccessibilityLargeTextLayoutForCell:v4])
    {
      uint64_t v7 = 4;
    }
    else
    {
      uint64_t v7 = 2;
    }
    if (v7 != [v6 textAlignment]) {
      [v6 setTextAlignment:v7];
    }
    uint64_t v8 = [v6 text];
    v9 = v8;
    if (v8 && [v8 length])
    {
      v10 = [v6 superview];

      if (v10)
      {
LABEL_13:

        goto LABEL_14;
      }
      v11 = [v4 contentView];
      [v11 addSubview:v6];
    }
    else
    {
      [v6 removeFromSuperview];
      v11 = v6;
      uint64_t v6 = 0;
    }

    goto LABEL_13;
  }
LABEL_14:
  double v12 = [v4 _detailTextLabel:0];
  if (v12)
  {
    CGFloat v13 = v12;
    double v14 = [v12 font];
    [v14 pointSize];
    double v16 = v15;

    if (v16 == 0.0)
    {
      double v17 = [(UITableViewCellLayoutManagerValue2 *)self defaultDetailTextLabelFontForCell:v4];
      [v13 setFont:v17];
    }
    double v18 = [v13 text];
    double v19 = v18;
    if (v18 && [v18 length])
    {
      v20 = [v13 superview];

      if (v20)
      {
LABEL_23:

        goto LABEL_24;
      }
      v21 = [v4 contentView];
      [v21 addSubview:v13];
    }
    else
    {
      [v13 removeFromSuperview];
      v21 = v13;
      CGFloat v13 = 0;
    }

    goto LABEL_23;
  }
LABEL_24:
}

- (CGSize)intrinsicContentSizeForCell:(id)a3 rowWidth:(double)a4
{
  id v6 = a3;
  if ([(UITableViewCellLayoutManager *)self shouldApplyAccessibilityLargeTextLayoutForCell:v6])
  {
    double v7 = _UITableViewCellLayoutIntrinsicSizeForCellStackingLabels(self, v6, a4);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)UITableViewCellLayoutManagerValue2;
    [(UITableViewCellLayoutManager *)&v13 intrinsicContentSizeForCell:v6 rowWidth:a4];
  }
  double v9 = v7;
  double v10 = v8;

  double v11 = v9;
  double v12 = v10;
  result.CGFloat height = v12;
  result.CGFloat width = v11;
  return result;
}

@end