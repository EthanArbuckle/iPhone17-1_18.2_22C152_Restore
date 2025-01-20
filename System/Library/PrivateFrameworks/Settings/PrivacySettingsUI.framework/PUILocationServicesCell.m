@interface PUILocationServicesCell
- (PUILocationServicesCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (PUILocationUsageMixin)location;
- (void)layoutSubviews;
@end

@implementation PUILocationServicesCell

- (PUILocationServicesCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)PUILocationServicesCell;
  v5 = [(PSSwitchTableCell *)&v11 initWithStyle:a3 reuseIdentifier:a4 specifier:a5];
  if (v5)
  {
    v6 = objc_alloc_init(PUILocationUsageMixin);
    location = v5->_location;
    v5->_location = v6;

    v8 = [(PUILocationServicesCell *)v5 contentView];
    v9 = [(PUILocationUsageMixin *)v5->_location usageIndicator];
    [v8 addSubview:v9];
  }
  return v5;
}

- (void)layoutSubviews
{
  v53.receiver = self;
  v53.super_class = (Class)PUILocationServicesCell;
  [(PSSwitchTableCell *)&v53 layoutSubviews];
  v3 = [(PUILocationUsageMixin *)self->_location usageIndicator];
  if (v3)
  {
    id v4 = *(id *)((char *)&self->super.super.super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92EF0]);
    [v4 frame];
    double v6 = v5;
    double v8 = v7;
    v9 = [(PUILocationServicesCell *)self traitCollection];
    v10 = [v9 preferredContentSizeCategory];
    BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v10);

    if (IsAccessibilityCategory)
    {
      [v4 frame];
      double v13 = v12;
      double v15 = v14;
      double v17 = v16;
      double v51 = v18;
      char v19 = [(PUILocationServicesCell *)self _shouldReverseLayoutDirection];
      [v3 frame];
      double v21 = v20;
      double v23 = v22;
      [v4 frame];
      double Height = CGRectGetHeight(v54);
      [v3 frame];
      double v25 = v8 + (Height - CGRectGetHeight(v55)) * 0.5;
      if (v19)
      {
        [v4 frame];
        double Width = CGRectGetWidth(v56);
        [v3 frame];
        objc_msgSend(v3, "setFrame:", v6 + Width - CGRectGetWidth(v57), v25, v21, v23);
        [v3 frame];
        double v27 = v13 - (CGRectGetWidth(v58) + 6.0);
      }
      else
      {
        objc_msgSend(v3, "setFrame:", v6, v25, v21, v23);
        [v3 frame];
        double v27 = v13 + CGRectGetWidth(v63) + 6.0;
      }
      objc_msgSend(v4, "setFrame:", v27, v15, v17, v51);
      goto LABEL_14;
    }
    v28 = [(PUILocationServicesCell *)self textLabel];
    [v28 frame];
    double v52 = v29;
    double v31 = v30;
    double v33 = v32;
    double v35 = v34;
    char v36 = [(PUILocationServicesCell *)self _shouldReverseLayoutDirection];
    [v3 frame];
    double v38 = v37;
    double v40 = v39;
    [v4 frame];
    double v41 = CGRectGetHeight(v59);
    [v3 frame];
    double v42 = v8 + (v41 - CGRectGetHeight(v60)) * 0.5;
    if (v36)
    {
      objc_msgSend(v3, "setFrame:", 6.0, v42, v38, v40);
      v61.origin.x = 6.0;
      v61.origin.y = v42;
      v61.size.width = v38;
      v61.size.height = v40;
      double MaxX = CGRectGetMaxX(v61);
      v62.origin.x = v52;
      v62.origin.y = v31;
      v62.size.width = v33;
      v62.size.height = v35;
      double MinX = CGRectGetMinX(v62);
      if (MinX + -6.0 < MaxX)
      {
        double v45 = MaxX - MinX + 6.0;
        double v46 = v52 + v45;
LABEL_12:
        objc_msgSend(v28, "setFrame:", v46, v31, v33 - v45, v35);
      }
    }
    else
    {
      [(PUILocationServicesCell *)self frame];
      CGFloat v47 = CGRectGetMaxX(v64) + -15.0 + -6.0;
      v65.origin.x = v6;
      v65.origin.y = v42;
      v65.size.width = v38;
      v65.size.height = v40;
      CGFloat v48 = v47 - CGRectGetWidth(v65) + -51.0;
      objc_msgSend(v3, "setFrame:", v48, v42, v38, v40);
      v66.origin.x = v48;
      v66.origin.y = v42;
      v66.size.width = v38;
      v66.size.height = v40;
      double v49 = CGRectGetMinX(v66);
      double v46 = v52;
      v67.origin.x = v52;
      v67.origin.y = v31;
      v67.size.width = v33;
      v67.size.height = v35;
      double v50 = CGRectGetMaxX(v67);
      if (v50 + 6.0 > v49)
      {
        double v45 = v50 - v49 + 6.0;
        goto LABEL_12;
      }
    }

LABEL_14:
  }
}

- (PUILocationUsageMixin)location
{
  return self->_location;
}

- (void).cxx_destruct
{
}

@end