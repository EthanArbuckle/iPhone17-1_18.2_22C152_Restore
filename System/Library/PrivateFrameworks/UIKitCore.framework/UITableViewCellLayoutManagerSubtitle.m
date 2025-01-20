@interface UITableViewCellLayoutManagerSubtitle
- (CGSize)intrinsicContentSizeForCell:(id)a3 rowWidth:(double)a4;
- (double)_textLabelYAdjustmentForCell:(id)a3 totalTextRect:(CGRect)a4;
- (double)defaultDetailTextLabelFontSizeForCell:(id)a3;
- (double)defaultTextLabelFontSizeForCell:(id)a3;
- (id)defaultDetailTextLabelFontForCell:(id)a3;
- (id)detailTextLabelForCell:(id)a3;
- (id)imageViewForCell:(id)a3;
- (id)textLabelForCell:(id)a3;
- (void)getTextLabelRect:(CGRect *)a3 detailTextLabelRect:(CGRect *)a4 forCell:(id)a5 rowWidth:(double)a6 forSizing:(BOOL)a7;
- (void)layoutSubviewsOfCell:(id)a3;
@end

@implementation UITableViewCellLayoutManagerSubtitle

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
  return 12.0;
}

- (id)imageViewForCell:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UITableViewCellLayoutManagerSubtitle;
  id v3 = [(UITableViewCellLayoutManager *)&v5 defaultImageViewForCell:a3];
  return v3;
}

- (id)textLabelForCell:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UITableViewCellLayoutManagerSubtitle;
  id v3 = [(UITableViewCellLayoutManager *)&v5 defaultLabelForCell:a3];
  return v3;
}

- (id)detailTextLabelForCell:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v15.receiver = self;
  v15.super_class = (Class)UITableViewCellLayoutManagerSubtitle;
  double v6 = [(UITableViewCellLayoutManager *)&v15 defaultLabelForCell:v4 ofClass:v5];
  double v7 = [v4 _constants];
  v8 = [v4 _tableView];
  v9 = objc_msgSend(v7, "defaultDetailTextFontForCellStyle:", objc_msgSend(v4, "_cellStyle"));
  [v6 setFont:v9];

  uint64_t v10 = [v4 _cellStyle];
  v11 = [v4 traitCollection];

  v12 = +[UICellConfigurationState _readonlyCellState:]((uint64_t)UICellConfigurationState, 0);
  v13 = [v7 defaultDetailTextColorForCellStyle:v10 traitCollection:v11 state:v12];
  [v6 setTextColor:v13];

  return v6;
}

- (id)defaultDetailTextLabelFontForCell:(id)a3
{
  id v3 = a3;
  id v4 = [v3 _constants];
  uint64_t v5 = [v3 _cellStyle];

  double v6 = [v4 defaultDetailTextFontForCellStyle:v5];

  return v6;
}

- (double)_textLabelYAdjustmentForCell:(id)a3 totalTextRect:(CGRect)a4
{
  id v4 = a3;
  double v5 = 0.0;
  if (dyld_program_sdk_at_least())
  {
    double v6 = [v4 _constants];
    double v7 = objc_msgSend(v6, "defaultTextLabelFontForCellStyle:", objc_msgSend(v4, "style"));
    [v7 pointSize];

    v8 = [v4 _textLabel:0];
    v9 = [v8 font];
    [v9 pointSize];

    id v10 = v4;
    v11 = [v10 traitCollection];
    uint64_t v12 = [v11 userInterfaceIdiom];

    if (v12 == 6)
    {
      v13 = [v10 _detailTextLabel:0];
      v14 = [v13 text];
      BOOL v15 = [v14 length] != 0;

      v16 = [v10 _constants];
      v17 = [v10 _tableView];
      objc_msgSend(v16, "defaultRowHeightForTableView:cellStyle:hasDetailText:", v17, objc_msgSend(v10, "style"), v15);
    }
    UIRoundToViewScale(v10);
    double v5 = v18;
  }
  return v5;
}

- (void)getTextLabelRect:(CGRect *)a3 detailTextLabelRect:(CGRect *)a4 forCell:(id)a5 rowWidth:(double)a6 forSizing:(BOOL)a7
{
  BOOL v7 = a7;
  v52 = a5;
  [(UITableViewCellLayoutManager *)self textRectForCell:v52 rowWidth:v7 forSizing:a6];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  v20 = [v52 _textLabel:0];
  v21 = [v52 _detailTextLabel:0];
  double v23 = *MEMORY[0x1E4F1DB30];
  double v22 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  double v24 = v22;
  double v25 = *MEMORY[0x1E4F1DB30];
  if (v20)
  {
    -[UITableViewCellLayoutManager optimumSizeForLabel:inTotalTextRect:minimizeWidthOnVerticalOverflow:preferSingleLineWidth:](self, "optimumSizeForLabel:inTotalTextRect:minimizeWidthOnVerticalOverflow:preferSingleLineWidth:", v20, 0, 1, v13, v15, v17, v19);
    double v25 = v26;
  }
  double rect_8 = v24;
  if (v21)
  {
    -[UITableViewCellLayoutManager optimumSizeForLabel:inTotalTextRect:minimizeWidthOnVerticalOverflow:preferSingleLineWidth:](self, "optimumSizeForLabel:inTotalTextRect:minimizeWidthOnVerticalOverflow:preferSingleLineWidth:", v21, 0, 1, v13, v15, v17, v19);
    double v23 = v27;
    double v22 = v28;
  }
  double rect_16 = v17;
  double rect_24 = v15;
  CGFloat v29 = v13;
  CGFloat v30 = 0.0;
  double v31 = 0.0;
  if ((v52[28] & 0x80000) != 0)
  {
    v54.origin.CGFloat x = v13;
    v54.origin.double y = v15;
    v54.size.CGFloat width = rect_16;
    v54.size.CGFloat height = v19;
    double v31 = CGRectGetMaxX(v54) - v25;
    v55.origin.CGFloat x = v13;
    v55.origin.double y = v15;
    v55.size.CGFloat width = rect_16;
    v55.size.CGFloat height = v19;
    CGFloat v30 = CGRectGetMaxX(v55) - v23;
    CGFloat v29 = 0.0;
  }
  CGFloat rect = v30;
  double v44 = v13;
  CGFloat v32 = rect_8 + 0.0;
  v56.origin.double y = 0.0;
  v56.origin.CGFloat x = v31;
  v56.size.CGFloat width = v25;
  v56.size.CGFloat height = rect_8;
  double v33 = rect_8 + 0.0;
  double v34 = v23;
  double v35 = v22;
  CGRect v57 = CGRectUnion(v56, *(CGRect *)&v30);
  double v43 = v19;
  CGFloat v36 = ceil((v19 - v57.size.height) * 0.5);
  v57.origin.double y = 0.0;
  v57.origin.CGFloat x = v31;
  v57.size.CGFloat width = v25;
  v57.size.CGFloat height = rect_8;
  CGRect v58 = CGRectOffset(v57, v29, v36);
  CGFloat rect_8a = v58.origin.x;
  double y = v58.origin.y;
  CGFloat height = v58.size.height;
  CGFloat width = v58.size.width;
  v58.origin.CGFloat x = rect;
  v58.origin.double y = v32;
  v58.size.CGFloat width = v23;
  v58.size.CGFloat height = v22;
  CGRect v59 = CGRectOffset(v58, v29, v36);
  CGFloat x = v59.origin.x;
  CGFloat v39 = v59.origin.y;
  CGFloat v40 = v59.size.width;
  CGFloat v41 = v59.size.height;
  if (v22 > 0.0)
  {
    -[UITableViewCellLayoutManagerSubtitle _textLabelYAdjustmentForCell:totalTextRect:](self, "_textLabelYAdjustmentForCell:totalTextRect:", v52, v44, rect_24, rect_16, v43);
    double y = y + v42;
  }
  if (a3)
  {
    a3->origin.CGFloat x = rect_8a;
    a3->origin.double y = y;
    a3->size.CGFloat width = width;
    a3->size.CGFloat height = height;
  }
  if (a4)
  {
    a4->origin.CGFloat x = x;
    a4->origin.double y = v39;
    a4->size.CGFloat width = v40;
    a4->size.CGFloat height = v41;
  }
}

- (void)layoutSubviewsOfCell:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)UITableViewCellLayoutManagerSubtitle;
  [(UITableViewCellLayoutManager *)&v25 layoutSubviewsOfCell:v4];
  double v5 = [v4 _textLabel:0];
  double v6 = v5;
  if (v5)
  {
    BOOL v7 = [v5 font];
    [v7 pointSize];
    double v9 = v8;

    if (v9 == 0.0)
    {
      id v10 = [(UITableViewCellLayoutManager *)self defaultTextLabelFontForCell:v4];
      [v6 setFont:v10];
    }
    v11 = [v6 text];
    double v12 = v11;
    if (v11 && [v11 length])
    {
      double v13 = [v6 superview];

      if (!v13)
      {
        double v14 = [v4 contentView];
        [v14 addSubview:v6];
      }
    }
    else
    {
      [v6 removeFromSuperview];
    }
  }
  double v15 = [v4 _detailTextLabel:0];
  double v16 = v15;
  if (v15)
  {
    double v17 = [v15 font];
    [v17 pointSize];
    double v19 = v18;

    if (v19 == 0.0)
    {
      v20 = [(UITableViewCellLayoutManagerSubtitle *)self defaultDetailTextLabelFontForCell:v4];
      [v16 setFont:v20];
    }
    v21 = [v16 text];
    double v22 = v21;
    if (v21 && [v21 length])
    {
      double v23 = [v16 superview];

      if (!v23)
      {
        double v24 = [v4 contentView];
        [v24 addSubview:v16];
      }
    }
    else
    {
      [v16 removeFromSuperview];
    }
  }
}

- (CGSize)intrinsicContentSizeForCell:(id)a3 rowWidth:(double)a4
{
  id v6 = a3;
  if (dyld_program_sdk_at_least())
  {
    double v7 = _UITableViewCellLayoutIntrinsicSizeForCellStackingLabels(self, v6, a4);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)UITableViewCellLayoutManagerSubtitle;
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