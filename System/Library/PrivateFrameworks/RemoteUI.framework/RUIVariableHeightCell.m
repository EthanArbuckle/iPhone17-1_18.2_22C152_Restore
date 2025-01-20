@interface RUIVariableHeightCell
- (BOOL)supportsAccessory;
- (CGSize)sizeForTextLabel:(id)a3 width:(double)a4;
- (double)height;
- (int64_t)detailTextAlignment;
- (void)layoutSubviews;
- (void)setDetailTextAlignment:(int64_t)a3;
- (void)setSupportsAccessory:(BOOL)a3;
@end

@implementation RUIVariableHeightCell

- (void)layoutSubviews
{
  v56.receiver = self;
  v56.super_class = (Class)RUIVariableHeightCell;
  [(RemoteUITableViewCell *)&v56 layoutSubviews];
  v3 = [MEMORY[0x263F82770] metricsForTextStyle:*MEMORY[0x263F83570]];
  v4 = [(RUIVariableHeightCell *)self textLabel];
  v5 = [(RUIVariableHeightCell *)self detailTextLabel];
  v6 = [v4 text];
  if ([v6 _isNaturallyRTL])
  {

    int v7 = 1;
    uint64_t v8 = 2;
  }
  else
  {
    v9 = [v5 text];
    int v7 = [v9 _isNaturallyRTL];

    if (v7) {
      uint64_t v8 = 2;
    }
    else {
      uint64_t v8 = 0;
    }
  }
  [v5 setTextAlignment:v8];
  if (self->_detailTextAlignment) {
    objc_msgSend(v5, "setTextAlignment:");
  }
  v10 = [(RUIVariableHeightCell *)self layoutManager];
  [(RUIVariableHeightCell *)self frame];
  [v10 textRectForCell:self rowWidth:0 forSizing:CGRectGetWidth(v57)];
  double v12 = v11;
  CGFloat v14 = v13;
  double v16 = v15;
  CGFloat v18 = v17;

  v19 = [(RUIVariableHeightCell *)self traitCollection];
  v20 = [v19 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v20);

  [v4 frame];
  if (IsAccessibilityCategory)
  {
    objc_msgSend(v4, "setFrame:");
    [v5 frame];
    double v23 = v22;
    double v25 = v24;
    [v4 frame];
    double v12 = v26;
    v27 = v5;
  }
  else
  {
    [v5 frame];
    CGFloat rect = v18;
    CGFloat v53 = v14;
    if (v5)
    {
      v32 = [v4 text];
      double v33 = 0.0;
      if ([v32 length])
      {
        [(RUIVariableHeightCell *)self textFieldOffset];
        double v33 = v34;
      }

      [(RUIVariableHeightCell *)self textFieldOffset];
      -[RUIVariableHeightCell sizeForTextLabel:width:](self, "sizeForTextLabel:width:", v4);
      uint64_t v51 = v35;
      double v25 = v36;
      v58.origin.x = v12;
      v58.origin.y = v14;
      v58.size.width = v16;
      v58.size.height = rect;
      double MaxX = CGRectGetMaxX(v58);
      if (v7) {
        double v38 = 0.0;
      }
      else {
        double v38 = v12;
      }
      double v39 = MaxX - v38 - v33;
      -[RUIVariableHeightCell sizeForTextLabel:width:](self, "sizeForTextLabel:width:", v5, v39, v51);
      double v54 = v41;
      if (v39 < v40 || self->_detailTextAlignment == 0) {
        double v43 = v40;
      }
      else {
        double v43 = v39;
      }
      [v3 scaledValueForValue:11.5];
      double v45 = RUIRoundToPixel(v44);
      if (v7)
      {
        v59.origin.x = v12;
        v59.origin.y = v14;
        v59.size.width = v16;
        v59.size.height = rect;
        double v46 = CGRectGetMaxX(v59) - v43 - v33;
      }
      else
      {
        double v46 = v12 + v33;
      }
      double v48 = v52;
    }
    else
    {
      double v46 = v28;
      double v45 = v29;
      double v43 = v30;
      double v54 = v31;
      v60.origin.x = v12;
      v60.origin.y = v14;
      v60.size.width = v16;
      v60.size.height = v18;
      [(RUIVariableHeightCell *)self sizeForTextLabel:v4 width:CGRectGetWidth(v60)];
      double v48 = v47;
      double v25 = v49;
    }
    [v3 scaledValueForValue:11.5];
    double v23 = RUIRoundToPixel(v50);
    if (v7)
    {
      v61.origin.x = v12;
      v61.origin.y = v53;
      v61.size.width = v16;
      v61.size.height = rect;
      double v12 = CGRectGetMaxX(v61) - v48;
    }
    objc_msgSend(v5, "setFrame:", v46, v45, v43, v54);
    double v16 = v48;
    v27 = v4;
  }
  objc_msgSend(v27, "setFrame:", v12, v23, v16, v25);
}

- (CGSize)sizeForTextLabel:(id)a3 width:(double)a4
{
  v16[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = [v5 text];
  uint64_t v15 = *MEMORY[0x263F814F0];
  int v7 = [v5 font];

  v16[0] = v7;
  uint64_t v8 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
  objc_msgSend(v6, "boundingRectWithSize:options:attributes:context:", 1, v8, 0, a4, 1.79769313e308);
  double v10 = v9;
  double v12 = v11;

  double v13 = v10;
  double v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (double)height
{
  [(RUIVariableHeightCell *)self layoutIfNeeded];
  v3 = [MEMORY[0x263F82770] metricsForTextStyle:*MEMORY[0x263F83570]];
  [v3 scaledValueForValue:11.5];
  double v5 = RUIRoundToPixel(v4);
  v6 = [(RUIVariableHeightCell *)self textLabel];
  int v7 = [v6 text];
  uint64_t v8 = [v7 length];

  double v9 = 0.0;
  double v10 = 0.0;
  if (v8)
  {
    double v11 = [(RUIVariableHeightCell *)self textLabel];
    double v12 = [(RUIVariableHeightCell *)self textLabel];
    [v12 size];
    -[RUIVariableHeightCell sizeForTextLabel:width:](self, "sizeForTextLabel:width:", v11);
    double v10 = RUIRoundToPixel(v13 + v5 * 2.0);
  }
  double v14 = [(RUIVariableHeightCell *)self detailTextLabel];
  uint64_t v15 = [v14 text];
  uint64_t v16 = [v15 length];

  if (v16)
  {
    double v17 = [(RUIVariableHeightCell *)self detailTextLabel];
    CGFloat v18 = [(RUIVariableHeightCell *)self detailTextLabel];
    [v18 size];
    -[RUIVariableHeightCell sizeForTextLabel:width:](self, "sizeForTextLabel:width:", v17);
    double v9 = RUIRoundToPixel(v19 + v5 * 2.0);
  }
  v20 = [(RUIVariableHeightCell *)self traitCollection];
  v21 = [v20 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v21);
  if (v10 >= v9) {
    double v23 = v10;
  }
  else {
    double v23 = v9;
  }
  if (IsAccessibilityCategory) {
    double v24 = v10 + v9;
  }
  else {
    double v24 = v23;
  }

  return v24;
}

- (BOOL)supportsAccessory
{
  return self->_supportsAccessory;
}

- (void)setSupportsAccessory:(BOOL)a3
{
  self->_supportsAccessory = a3;
}

- (int64_t)detailTextAlignment
{
  return self->_detailTextAlignment;
}

- (void)setDetailTextAlignment:(int64_t)a3
{
  self->_detailTextAlignment = a3;
}

@end