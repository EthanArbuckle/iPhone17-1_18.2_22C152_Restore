@interface UITableViewCellLayoutManagerEditable1
- (BOOL)textFieldShouldBeginEditing:(id)a3;
- (BOOL)textFieldShouldReturn:(id)a3;
- (CGSize)intrinsicContentSizeForCell:(id)a3 rowWidth:(double)a4;
- (double)defaultTextFieldFontSizeForCell:(id)a3;
- (id)detailTextLabelForCell:(id)a3;
- (id)editableTextFieldForCell:(id)a3;
- (void)_textFieldEndEditing:(id)a3;
- (void)_textFieldStartEditing:(id)a3;
- (void)layoutSubviewsOfCell:(id)a3;
- (void)textFieldDidEndEditing:(id)a3;
@end

@implementation UITableViewCellLayoutManagerEditable1

- (double)defaultTextFieldFontSizeForCell:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UITableViewCellLayoutManagerEditable1;
  [(UITableViewCellLayoutManager *)&v4 defaultDetailTextLabelFontSizeForCell:a3];
  return result;
}

- (void)layoutSubviewsOfCell:(id)a3
{
  objc_super v4 = a3;
  v91.receiver = self;
  v91.super_class = (Class)UITableViewCellLayoutManagerEditable1;
  [(UITableViewCellLayoutManager *)&v91 layoutSubviewsOfCell:v4];
  v5 = [v4 contentView];
  [v5 bounds];
  double v7 = v6;

  [v4 bounds];
  [(UITableViewCellLayoutManager *)self textRectForCell:v4 rowWidth:0 forSizing:CGRectGetWidth(v92)];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  v16 = (double *)MEMORY[0x1E4F1DB30];
  v17 = [v4 _textLabel:0];
  v18 = v17;
  if (v17)
  {
    v19 = [v17 font];
    [v19 pointSize];
    double v21 = v20;

    if (v21 == 0.0)
    {
      v22 = [(UITableViewCellLayoutManager *)self defaultTextLabelFontForCell:v4];
      [v18 setFont:v22];
    }
    v23 = [v18 text];
    v24 = v23;
    if (v23 && [v23 length])
    {
      v25 = [v18 superview];

      if (!v25)
      {
        v26 = [v4 contentView];
        [v26 addSubview:v18];
      }
    }
    else
    {
      [v18 removeFromSuperview];
    }
  }
  double v27 = v16[1];
  v28 = [v4 _editableTextField:1];
  v29 = v28;
  double v30 = v27;
  if (v28)
  {
    v31 = [v28 font];
    [v31 pointSize];
    double v33 = v32;

    if (v33 == 0.0)
    {
      [(UITableViewCellLayoutManagerEditable1 *)self defaultTextFieldFontSizeForCell:v4];
      v34 = objc_msgSend(off_1E52D39B8, "systemFontOfSize:");
      [v29 setFont:v34];
    }
    objc_msgSend(v29, "setFrame:", 0.0, 0.0, v13, v15);
    objc_msgSend(v29, "sizeThatFits:", v13, v15);
    double v30 = v35;
    v36 = [v4 contentView];
    [v36 addSubview:v29];
  }
  double rect_24 = v15;
  double v37 = *v16;
  double v38 = v27;
  double v39 = *v16;
  if (v18)
  {
    -[UITableViewCellLayoutManager optimumSizeForLabel:inTotalTextRect:minimizeWidthOnVerticalOverflow:preferSingleLineWidth:](self, "optimumSizeForLabel:inTotalTextRect:minimizeWidthOnVerticalOverflow:preferSingleLineWidth:", v18, 0, 0, v9, v11, v13, rect_24);
    double v39 = v40;
  }
  double v84 = v38;
  if (v29)
  {
    if ([(UITableViewCellLayoutManager *)self shouldApplyAccessibilityLargeTextLayoutForCell:v4])
    {
      double v27 = v30;
      double v37 = v13;
    }
    else
    {
      if (v39 <= 0.0) {
        double v41 = 0.0;
      }
      else {
        double v41 = v39 + 6.0;
      }
      v93.origin.double x = v9;
      v93.origin.double y = v11;
      v93.size.double width = v13;
      v93.size.double height = rect_24;
      double v37 = CGRectGetWidth(v93) - v41;
      double v27 = v30;
    }
  }
  int v42 = v4[28];
  double v83 = v7;
  CGFloat rect_16 = v27;
  if ([(UITableViewCellLayoutManager *)self shouldApplyAccessibilityLargeTextLayoutForCell:v4])
  {
    if ((v42 & 0x80000) != 0)
    {
      v94.origin.double x = v9;
      v94.origin.double y = v11;
      v94.size.double width = v13;
      v94.size.double height = rect_24;
      CGFloat v60 = CGRectGetMaxX(v94) - v39;
      v95.origin.double x = v9;
      v95.origin.double y = v11;
      v95.size.double width = v13;
      v95.size.double height = rect_24;
      CGFloat MaxX = CGRectGetMaxX(v95);
      double v48 = v60;
      CGFloat v43 = v37;
      double v44 = MaxX - v37;
      double v47 = 0.0;
      CGFloat v45 = v84;
      double v46 = v84 + 0.0;
    }
    else
    {
      CGFloat v43 = v37;
      double v44 = 0.0;
      CGFloat v45 = v84;
      double v46 = v84 + 0.0;
      double v47 = 0.0;
      double v48 = 0.0;
    }
  }
  else
  {
    CGFloat rect_8 = v13;
    CGFloat v43 = v37;
    v49 = [v18 font];
    [v49 ascender];
    double v51 = v50;
    v52 = [v29 font];
    [v52 ascender];
    double v54 = v53;

    if (v51 >= v54)
    {
      v55 = [v18 font];
      [v55 ascender];
      double v63 = v62;
      v58 = [v29 font];
      [v58 ascender];
      double v46 = round(v63 - v64);
      double v47 = 0.0;
    }
    else
    {
      v55 = [v29 font];
      [v55 ascender];
      double v57 = v56;
      v58 = [v18 font];
      [v58 ascender];
      double v47 = round(v57 - v59);
      double v46 = 0.0;
    }

    if ((v42 & 0x80000) != 0)
    {
      v96.origin.double x = v9;
      v96.origin.double y = v11;
      v96.size.double width = rect_8;
      v96.size.double height = rect_24;
      double v48 = CGRectGetMaxX(v96) - v39;
      if (v39 <= 0.0)
      {
        v97.origin.double x = v9;
        v97.origin.double y = v11;
        double v65 = v48;
        v97.size.double width = rect_8;
        v97.size.double height = rect_24;
        CGFloat v66 = CGRectGetMaxX(v97);
        double v48 = v65;
        double v44 = v66 - v37;
      }
      else
      {
        double v44 = v48 - v37 + -6.0;
      }
      CGFloat v45 = v84;
    }
    else
    {
      double v48 = 0.0;
      if (v39 <= 0.0) {
        double v44 = 0.0;
      }
      else {
        double v44 = v39 + 0.0 + 6.0;
      }
      CGFloat v45 = v84;
    }
  }
  double rect = v48;
  v98.origin.double x = v48;
  v98.origin.double y = v47;
  v98.size.double width = v39;
  v98.size.double height = v45;
  v102.origin.double x = v44;
  v102.origin.double y = v46;
  CGFloat v67 = v43;
  v102.size.double width = v43;
  v102.size.double height = rect_16;
  CGRect v99 = CGRectUnion(v98, v102);
  double v68 = ceil((rect_24 - v99.size.height) * 0.5);
  double v69 = v47;
  double v70 = 0.0;
  if ((*(void *)&v42 & 0x80000) != 0) {
    double v9 = 0.0;
  }
  double v71 = rect;
  double v72 = v39;
  CGFloat v73 = v45;
  CGRect v100 = CGRectOffset(*(CGRect *)(&v69 - 1), v9, v68);
  double rect_24a = v100.origin.x;
  double recta = v100.origin.y;
  double width = v100.size.width;
  double height = v100.size.height;
  v100.origin.double x = v44;
  v100.origin.double y = v46;
  v100.size.double width = v67;
  v100.size.double height = rect_16;
  CGRect v101 = CGRectOffset(v100, v9, v68);
  double x = v101.origin.x;
  double y = v101.origin.y;
  double v78 = v101.size.width;
  double v79 = v101.size.height;
  if (![(UITableViewCellLayoutManager *)self shouldApplyAccessibilityLargeTextLayoutForCell:v4])
  {
    [v4 textFieldOffset];
    double v70 = v80;
  }
  if ((v42 & 0x80000) != 0)
  {
    if (x + v78 > v83 - v70) {
      double v78 = v78 - (x + v78 - (v83 - v70));
    }
  }
  else if (x < v70)
  {
    double v78 = v78 - (v70 - x);
    double x = v70;
  }
  v81 = objc_msgSend(v18, "superview", *(void *)&v83);

  if (v81) {
    objc_msgSend(v18, "setFrame:", rect_24a, recta, width, height);
  }
  v82 = [v29 superview];

  if (v82) {
    objc_msgSend(v29, "setFrame:", x, y, v78, v79);
  }
}

- (id)detailTextLabelForCell:(id)a3
{
  return 0;
}

- (id)editableTextFieldForCell:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)UITableViewCellLayoutManagerEditable1;
  objc_super v4 = [(UITableViewCellLayoutManager *)&v8 defaultEditableTextFieldForCell:a3];
  [v4 setAdjustsFontSizeToFitWidth:1];
  v5 = [off_1E52D39B8 systemFontOfSize:17.0];
  [v4 setFont:v5];

  double v6 = +[UIColor clearColor];
  [v4 setBackgroundColor:v6];

  [v4 setDelegate:self];
  [v4 addTarget:self action:sel__textFieldStartEditing_ forControlEvents:0x10000];
  [v4 addTarget:self action:sel__textFieldEndEditing_ forControlEvents:0x40000];
  [v4 addTarget:self action:sel__textFieldEndEditingOnReturn_ forControlEvents:0x80000];
  return v4;
}

- (CGSize)intrinsicContentSizeForCell:(id)a3 rowWidth:(double)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)UITableViewCellLayoutManagerEditable1;
  [(UITableViewCellLayoutManager *)&v15 intrinsicContentSizeForCell:v6 rowWidth:a4];
  double v8 = v7;
  double v10 = v9;
  if ([(UITableViewCellLayoutManager *)self shouldApplyAccessibilityLargeTextLayoutForCell:v6])
  {
    double v11 = [v6 _editableTextField:1];
    objc_msgSend(v11, "sizeThatFits:", a4, 3.40282347e38);
    double v10 = v10 + v12;
  }
  double v13 = v8;
  double v14 = v10;
  result.double height = v14;
  result.double width = v13;
  return result;
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v7 = a3;
  v3 = [v7 superview];
  if (v3)
  {
    do
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      uint64_t v4 = [v3 superview];

      v3 = (void *)v4;
    }
    while (v4);
  }
  v5 = [v3 _tableView];
  id v6 = [v7 text];
  [v5 _updateCell:v3 withValue:v6];
}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  return 1;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  return 1;
}

- (void)_textFieldStartEditing:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F28EB8];
  id v5 = a3;
  id v6 = [v4 defaultCenter];
  [v6 addObserver:self selector:sel__textValueChanged_ name:@"UITextFieldTextDidChangeNotification" object:v5];
}

- (void)_textFieldEndEditing:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F28EB8];
  id v5 = a3;
  id v6 = [v4 defaultCenter];
  [v6 removeObserver:self name:@"UITextFieldTextDidChangeNotification" object:v5];
}

@end