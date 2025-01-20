@interface UITableViewCellLayoutManagerValue1
- (CGSize)intrinsicContentSizeForCell:(id)a3 rowWidth:(double)a4;
- (double)defaultDetailTextLabelFontSizeForCell:(id)a3;
- (double)defaultTextLabelFontSizeForCell:(id)a3;
- (id)defaultDetailTextLabelFontForCell:(id)a3;
- (id)detailTextLabelForCell:(id)a3;
- (id)textLabelForCell:(id)a3;
- (void)getTextLabelRect:(CGRect *)a3 detailTextLabelRect:(CGRect *)a4 forCell:(id)a5 rowWidth:(double)a6 forSizing:(BOOL)a7;
- (void)layoutSubviewsOfCell:(id)a3;
@end

@implementation UITableViewCellLayoutManagerValue1

- (void)getTextLabelRect:(CGRect *)a3 detailTextLabelRect:(CGRect *)a4 forCell:(id)a5 rowWidth:(double)a6 forSizing:(BOOL)a7
{
  BOOL v7 = a7;
  id v70 = a5;
  [(UITableViewCellLayoutManager *)self textRectForCell:v70 rowWidth:v7 forSizing:a6];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  v20 = [v70 _textLabel:0];
  v21 = [v70 _detailTextLabel:0];
  double v22 = *MEMORY[0x1E4F1DB30];
  double v23 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  double v24 = v23;
  double v25 = *MEMORY[0x1E4F1DB30];
  if (v20)
  {
    -[UITableViewCellLayoutManager optimumSizeForLabel:inTotalTextRect:minimizeWidthOnVerticalOverflow:preferSingleLineWidth:](self, "optimumSizeForLabel:inTotalTextRect:minimizeWidthOnVerticalOverflow:preferSingleLineWidth:", v20, 1, 0, v13, v15, v17, v19);
    double v25 = v26;
    double v24 = v27;
  }
  v28 = v70;
  if (v21)
  {
    BOOL v29 = [(UITableViewCellLayoutManager *)self shouldApplyAccessibilityLargeTextLayoutForCell:v70];
    double v30 = v17 - v25 + -6.0;
    if (v29) {
      double v30 = v17;
    }
    if (v30 >= 0.0) {
      double v31 = v30;
    }
    else {
      double v31 = 0.0;
    }
    -[UITableViewCellLayoutManager optimumSizeForLabel:inTotalTextRect:minimizeWidthOnVerticalOverflow:preferSingleLineWidth:](self, "optimumSizeForLabel:inTotalTextRect:minimizeWidthOnVerticalOverflow:preferSingleLineWidth:", v21, 0, 0, 0.0, 0.0, v31, v19);
    v28 = v70;
    double v22 = v32;
    double v23 = v33;
  }
  int v34 = v28[28];
  CGFloat v67 = v23;
  double v68 = v25;
  if ([(UITableViewCellLayoutManager *)self shouldApplyAccessibilityLargeTextLayoutForCell:"shouldApplyAccessibilityLargeTextLayoutForCell:"])
  {
    if ((v34 & 0x80000) != 0)
    {
      v72.origin.CGFloat x = v13;
      v72.origin.CGFloat y = v15;
      v72.size.CGFloat width = v17;
      v72.size.CGFloat height = v19;
      double v52 = CGRectGetMaxX(v72) - v25;
      v73.origin.CGFloat x = v13;
      v73.origin.CGFloat y = v15;
      v73.size.CGFloat width = v17;
      v73.size.CGFloat height = v19;
      double v35 = v22;
      CGFloat MinX = CGRectGetMaxX(v73) - v22;
      double v38 = 0.0;
      double v37 = v24 + 0.0;
      goto LABEL_23;
    }
    double v35 = v22;
    CGFloat MinX = 0.0;
    double v37 = v24 + 0.0;
    double v38 = 0.0;
    goto LABEL_21;
  }
  CGFloat v66 = v15;
  double v35 = v22;
  v39 = [v70 traitCollection];
  uint64_t v40 = [v39 userInterfaceIdiom];

  double v37 = 0.0;
  double v38 = 0.0;
  if (v40 != 3)
  {
    v41 = [v20 font];
    [v41 ascender];
    double v43 = v42;
    v44 = [v21 font];
    [v44 ascender];
    double v46 = v45;

    if (v43 >= v46)
    {
      v47 = [v20 font];
      [v47 ascender];
      double v54 = v53;
      v50 = [v21 font];
      [v50 ascender];
      double v37 = round(v54 - v55);
    }
    else
    {
      v47 = [v21 font];
      [v47 ascender];
      double v49 = v48;
      v50 = [v20 font];
      [v50 ascender];
      double v38 = round(v49 - v51);
      double v37 = 0.0;
    }
  }
  if ((v34 & 0x80000) == 0)
  {
    CGFloat MinX = v17 - v35;
LABEL_21:
    double v52 = 0.0;
    goto LABEL_23;
  }
  v74.origin.CGFloat x = v13;
  v74.origin.CGFloat y = v66;
  v74.size.CGFloat width = v17;
  v74.size.CGFloat height = v19;
  CGFloat v56 = CGRectGetMaxX(v74) - v68;
  v75.origin.CGFloat x = v13;
  v75.origin.CGFloat y = v66;
  double v52 = v56;
  v75.size.CGFloat width = v17;
  v75.size.CGFloat height = v19;
  CGFloat MinX = CGRectGetMinX(v75);
LABEL_23:
  v76.origin.CGFloat x = v52;
  v76.origin.CGFloat y = v38;
  v76.size.CGFloat width = v68;
  v76.size.CGFloat height = v24;
  CGFloat v57 = v52;
  CGFloat v58 = MinX;
  double v59 = v37;
  double v60 = v35;
  CGFloat v61 = v67;
  CGRect v77 = CGRectUnion(v76, *(CGRect *)&MinX);
  double v62 = ceil((v19 - v77.size.height) * 0.5);
  if ((*(void *)&v34 & 0x80000) != 0) {
    double v13 = 0.0;
  }
  v78.origin.CGFloat x = v57;
  v78.origin.CGFloat y = v38;
  v78.size.CGFloat width = v68;
  v78.size.CGFloat height = v24;
  CGRect v79 = CGRectOffset(v78, v13, v62);
  CGFloat x = v79.origin.x;
  CGFloat y = v79.origin.y;
  CGFloat width = v79.size.width;
  CGFloat height = v79.size.height;
  v79.origin.CGFloat x = v58;
  v79.origin.CGFloat y = v37;
  v79.size.CGFloat width = v35;
  v79.size.CGFloat height = v67;
  CGRect v80 = CGRectOffset(v79, v13, v62);
  if (a3)
  {
    a3->origin.CGFloat x = x;
    a3->origin.CGFloat y = y;
    a3->size.CGFloat width = width;
    a3->size.CGFloat height = height;
  }
  if (a4) {
    *a4 = v80;
  }
}

- (void)layoutSubviewsOfCell:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)UITableViewCellLayoutManagerValue1;
  [(UITableViewCellLayoutManager *)&v26 layoutSubviewsOfCell:v4];
  v5 = [v4 _textLabel:0];
  if (v5)
  {
    v6 = v5;
    BOOL v7 = [v5 font];
    [v7 pointSize];
    double v9 = v8;

    if (v9 == 0.0)
    {
      v10 = [(UITableViewCellLayoutManager *)self defaultTextLabelFontForCell:v4];
      [v6 setFont:v10];
    }
    v11 = [v6 text];
    double v12 = v11;
    if (v11 && [v11 length])
    {
      double v13 = [v6 superview];

      if (v13)
      {
LABEL_10:

        goto LABEL_11;
      }
      double v14 = [v4 contentView];
      [v14 addSubview:v6];
    }
    else
    {
      [v6 removeFromSuperview];
      double v14 = v6;
      v6 = 0;
    }

    goto LABEL_10;
  }
LABEL_11:
  uint64_t v15 = [v4 _detailTextLabel:0];
  if (v15)
  {
    double v16 = (void *)v15;
    if ([(UITableViewCellLayoutManager *)self shouldApplyAccessibilityLargeTextLayoutForCell:v4])
    {
      uint64_t v17 = 4;
    }
    else
    {
      uint64_t v17 = 2;
    }
    if (v17 != [v16 textAlignment]) {
      [v16 setTextAlignment:v17];
    }
    double v18 = [v16 font];
    [v18 pointSize];
    double v20 = v19;

    if (v20 == 0.0)
    {
      v21 = [(UITableViewCellLayoutManagerValue1 *)self defaultDetailTextLabelFontForCell:v4];
      [v16 setFont:v21];
    }
    double v22 = [v16 text];
    double v23 = v22;
    if (v22 && [v22 length])
    {
      double v24 = [v16 superview];

      if (v24)
      {
LABEL_25:

        goto LABEL_26;
      }
      double v25 = [v4 contentView];
      [v25 addSubview:v16];
    }
    else
    {
      [v16 removeFromSuperview];
      double v25 = v16;
      double v16 = 0;
    }

    goto LABEL_25;
  }
LABEL_26:
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
    v13.super_class = (Class)UITableViewCellLayoutManagerValue1;
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

- (id)textLabelForCell:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UITableViewCellLayoutManagerValue1;
  v3 = [(UITableViewCellLayoutManager *)&v5 defaultLabelForCell:a3];
  return v3;
}

- (id)detailTextLabelForCell:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v15.receiver = self;
  v15.super_class = (Class)UITableViewCellLayoutManagerValue1;
  id v6 = [(UITableViewCellLayoutManager *)&v15 defaultLabelForCell:v4 ofClass:v5];
  double v7 = [v4 _constants];
  uint64_t v8 = [v4 _cellStyle];
  double v9 = [v4 traitCollection];
  double v10 = +[UICellConfigurationState _readonlyCellState:]((uint64_t)UICellConfigurationState, 0);
  double v11 = [v7 defaultDetailTextColorForCellStyle:v8 traitCollection:v9 state:v10];
  [v6 setTextColor:v11];

  double v12 = [(UITableViewCellLayoutManagerValue1 *)self defaultDetailTextLabelFontForCell:v4];
  [v6 setFont:v12];

  LODWORD(self) = [(UITableViewCellLayoutManager *)self shouldApplyAccessibilityLargeTextLayoutForCell:v4];
  if (self) {
    uint64_t v13 = 4;
  }
  else {
    uint64_t v13 = 2;
  }
  [v6 setTextAlignment:v13];
  return v6;
}

- (id)defaultDetailTextLabelFontForCell:(id)a3
{
  id v3 = a3;
  id v4 = [v3 _constants];
  uint64_t v5 = [v3 _cellStyle];

  id v6 = [v4 defaultDetailTextFontForCellStyle:v5];

  return v6;
}

- (double)defaultTextLabelFontSizeForCell:(id)a3
{
  return 17.0;
}

- (double)defaultDetailTextLabelFontSizeForCell:(id)a3
{
  return 17.0;
}

@end