@interface NTKCFaceDetailToggleCell
+ (id)reuseIdentifier;
- (BOOL)on;
- (NTKCFaceDetailToggleCell)init;
- (NTKCFaceDetailToggleCellDelegate)delegate;
- (UISwitch)toggle;
- (double)rowHeight;
- (void)_switchToggled;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setOn:(BOOL)a3;
- (void)setToggle:(id)a3;
@end

@implementation NTKCFaceDetailToggleCell

+ (id)reuseIdentifier
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (double)rowHeight
{
  v2 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [v2 _scaledValueForValue:44.0];
  double v4 = v3;

  return v4;
}

- (NTKCFaceDetailToggleCell)init
{
  v7.receiver = self;
  v7.super_class = (Class)NTKCFaceDetailToggleCell;
  v2 = [(NTKCDetailTableViewCell *)&v7 initWithStyle:0];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    toggle = v2->_toggle;
    v2->_toggle = (UISwitch *)v3;

    [(UISwitch *)v2->_toggle addTarget:v2 action:sel__switchToggled forControlEvents:4096];
    v5 = [(NTKCFaceDetailToggleCell *)v2 contentView];
    [v5 addSubview:v2->_toggle];

    [(NTKCDetailTableViewCell *)v2 setShowsSeparator:1];
  }
  return v2;
}

- (BOOL)on
{
  return [(UISwitch *)self->_toggle isOn];
}

- (void)setOn:(BOOL)a3
{
}

- (void)_switchToggled
{
  id v3 = [(NTKCFaceDetailToggleCell *)self delegate];
  objc_msgSend(v3, "toggleCell:didToggle:", self, -[UISwitch isOn](self->_toggle, "isOn"));
}

- (void)layoutSubviews
{
  v50.receiver = self;
  v50.super_class = (Class)NTKCFaceDetailToggleCell;
  [(NTKCDetailTableViewCell *)&v50 layoutSubviews];
  id v3 = [(NTKCFaceDetailToggleCell *)self contentView];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat rect = v10;

  double v11 = NTKCScreenEdgeMargin();
  int IsRTL = CLKLayoutIsRTL();
  [(UISwitch *)self->_toggle frame];
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v47 = v5;
  double v48 = v11;
  if (!IsRTL)
  {
    CGFloat v20 = v13;
    v51.origin.x = v5;
    v51.origin.y = v7;
    v51.size.width = v9;
    v51.size.height = rect;
    CGRectGetWidth(v51);
    v52.origin.x = v20;
    v52.origin.y = v15;
    v52.size.width = v17;
    v52.size.height = v19;
    CGRectGetWidth(v52);
  }
  UIRectCenteredYInRectScale();
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  CGFloat v26 = v25;
  CGFloat v28 = v27;
  [(UISwitch *)self->_toggle setFrame:0];
  CGFloat v29 = v9;
  CGFloat v46 = v7;
  if (IsRTL)
  {
    v53.origin.x = v5;
    v53.origin.y = v7;
    v53.size.width = v9;
    CGFloat v30 = rect;
    v53.size.height = rect;
    double Width = CGRectGetWidth(v53);
    v54.origin.x = v22;
    v54.origin.y = v24;
    v54.size.width = v26;
    v54.size.height = v28;
    double MinX = Width - CGRectGetMaxX(v54);
  }
  else
  {
    v55.origin.x = v22;
    v55.origin.y = v24;
    v55.size.width = v26;
    v55.size.height = v28;
    double MinX = CGRectGetMinX(v55);
    CGFloat v30 = rect;
  }
  double v33 = v48;
  double v34 = MinX + -16.0 - v48;
  v35 = [(NTKCFaceDetailToggleCell *)self textLabel];
  [v35 frame];
  CGFloat v37 = v36;
  double v39 = v38;
  CGFloat v41 = v40;
  double v43 = v42;

  v56.origin.x = v37;
  v56.origin.y = v39;
  v56.size.width = v41;
  v56.size.height = v43;
  if (CGRectGetWidth(v56) > v34)
  {
    if (IsRTL)
    {
      v57.origin.y = v46;
      v57.origin.x = v47;
      v57.size.width = v29;
      v57.size.height = v30;
      double v44 = CGRectGetWidth(v57);
      v58.origin.x = v37;
      v58.origin.y = v39;
      v58.size.width = v34;
      v58.size.height = v43;
      double v33 = v44 - CGRectGetWidth(v58) - v48;
    }
    v45 = [(NTKCFaceDetailToggleCell *)self textLabel];
    objc_msgSend(v45, "setFrame:", v33, v39, v34, v43);
  }
}

- (NTKCFaceDetailToggleCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NTKCFaceDetailToggleCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UISwitch)toggle
{
  return self->_toggle;
}

- (void)setToggle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toggle, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end