@interface PUILocationServicesSubDirectoryCell
- (BOOL)canReload;
- (PUILocationServicesSubDirectoryCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (PUILocationUsageMixin)location;
- (void)layoutSubviews;
@end

@implementation PUILocationServicesSubDirectoryCell

- (PUILocationServicesSubDirectoryCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)PUILocationServicesSubDirectoryCell;
  v5 = [(PSTableCell *)&v11 initWithStyle:a3 reuseIdentifier:a4 specifier:a5];
  if (v5)
  {
    v6 = objc_alloc_init(PUILocationUsageMixin);
    location = v5->_location;
    v5->_location = v6;

    v8 = [(PUILocationServicesSubDirectoryCell *)v5 contentView];
    v9 = [(PUILocationUsageMixin *)v5->_location usageIndicator];
    [v8 addSubview:v9];
  }
  return v5;
}

- (void)layoutSubviews
{
  v59.receiver = self;
  v59.super_class = (Class)PUILocationServicesSubDirectoryCell;
  [(PSTableCell *)&v59 layoutSubviews];
  v3 = [(PUILocationUsageMixin *)self->_location usageIndicator];
  if (([v3 isHidden] & 1) == 0)
  {
    v4 = [(PUILocationServicesSubDirectoryCell *)self detailTextLabel];
    [v4 frame];
    double v6 = v5;
    double v8 = v7;
    v9 = [(PUILocationServicesSubDirectoryCell *)self traitCollection];
    v10 = [v9 preferredContentSizeCategory];
    BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v10);

    if (IsAccessibilityCategory)
    {
      [v4 frame];
      double v13 = v12;
      double v15 = v14;
      double v17 = v16;
      double v57 = v18;
      char v19 = [(PUILocationServicesSubDirectoryCell *)self _shouldReverseLayoutDirection];
      [v3 frame];
      double v21 = v20;
      double v23 = v22;
      [v4 frame];
      double Height = CGRectGetHeight(v60);
      [v3 frame];
      double v25 = v8 + (Height - CGRectGetHeight(v61)) * 0.5;
      if (v19)
      {
        [v4 frame];
        double Width = CGRectGetWidth(v62);
        [v3 frame];
        objc_msgSend(v3, "setFrame:", v6 + Width - CGRectGetWidth(v63), v25, v21, v23);
        [v3 frame];
        double v27 = v13 - (CGRectGetWidth(v64) + 6.0);
      }
      else
      {
        objc_msgSend(v3, "setFrame:", v6, v25, v21, v23);
        [v3 frame];
        double v27 = v13 + CGRectGetWidth(v70) + 6.0;
      }
      objc_msgSend(v4, "setFrame:", v27, v15, v17, v57);
      goto LABEL_19;
    }
    v28 = [(PUILocationServicesSubDirectoryCell *)self textLabel];
    [v28 frame];
    double v58 = v29;
    double v31 = v30;
    double v33 = v32;
    double v35 = v34;
    char v36 = [(PUILocationServicesSubDirectoryCell *)self _shouldReverseLayoutDirection];
    [v3 frame];
    double v38 = v37;
    double v40 = v39;
    [v4 frame];
    double v41 = CGRectGetHeight(v65);
    [v3 frame];
    double v42 = v8 + (v41 - CGRectGetHeight(v66)) * 0.5;
    [v4 frame];
    double v43 = CGRectGetWidth(v67);
    if (v36)
    {
      CGFloat v44 = v6 + v43 + 6.0;
      objc_msgSend(v3, "setFrame:", v44, v42, v38, v40);
      v68.origin.x = v44;
      v68.origin.y = v42;
      v68.size.width = v38;
      v68.size.height = v40;
      double MaxX = CGRectGetMaxX(v68);
      v69.origin.x = v58;
      v69.origin.y = v31;
      v69.size.width = v33;
      v69.size.height = v35;
      double MinX = CGRectGetMinX(v69);
      if (MinX + -6.0 >= MaxX)
      {
LABEL_18:

LABEL_19:
        goto LABEL_20;
      }
      double v47 = MaxX - MinX + 6.0;
      double v48 = v58 + v47;
    }
    else
    {
      if (v43 >= 51.0) {
        double v49 = v43;
      }
      else {
        double v49 = 51.0;
      }
      [(PUILocationServicesSubDirectoryCell *)self frame];
      CGFloat v50 = CGRectGetMaxX(v71) + -15.0 + -6.0;
      v72.origin.x = v6;
      v72.origin.y = v42;
      v72.size.width = v38;
      v72.size.height = v40;
      double v51 = v50 - CGRectGetWidth(v72) - v49;
      v73.origin.x = v51;
      v73.origin.y = v42;
      v73.size.width = v38;
      v73.size.height = v40;
      double v52 = CGRectGetMaxX(v73);
      [v4 frame];
      double v53 = CGRectGetMinX(v74);
      if (v53 - v52 < 6.0)
      {
        v75.origin.x = v51;
        v75.origin.y = v42;
        v75.size.width = v38;
        v75.size.height = v40;
        double v51 = v53 - CGRectGetWidth(v75) + -6.0;
      }
      objc_msgSend(v3, "setFrame:", v51, v42, v38, v40);
      v76.origin.x = v51;
      v76.origin.y = v42;
      v76.size.width = v38;
      v76.size.height = v40;
      double v54 = CGRectGetMinX(v76);
      double v48 = v58;
      v77.origin.x = v58;
      v77.origin.y = v56;
      v77.size.width = v33;
      v77.size.height = v35;
      double v55 = CGRectGetMaxX(v77);
      if (v55 + 6.0 <= v54) {
        goto LABEL_18;
      }
      double v31 = v56;
      double v47 = v55 - v54 + 6.0;
    }
    objc_msgSend(v28, "setFrame:", v48, v31, v33 - v47, v35);
    goto LABEL_18;
  }
LABEL_20:
}

- (BOOL)canReload
{
  return 1;
}

- (PUILocationUsageMixin)location
{
  return self->_location;
}

- (void).cxx_destruct
{
}

@end