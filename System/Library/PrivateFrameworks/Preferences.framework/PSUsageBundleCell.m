@interface PSUsageBundleCell
- (BOOL)canReload;
- (void)layoutSubviews;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation PSUsageBundleCell

- (BOOL)canReload
{
  return 1;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)PSUsageBundleCell;
  id v4 = a3;
  [(PSTableCell *)&v10 refreshCellContentsWithSpecifier:v4];
  v5 = objc_msgSend(v4, "propertyForKey:", @"DELETING", v10.receiver, v10.super_class);

  LODWORD(v4) = [v5 BOOLValue];
  if (v4)
  {
    v6 = PS_LocalizedString(@"DELETING");
    v7 = [(PSUsageBundleCell *)self textLabel];
    [v7 setText:v6];

    v8 = [(PSUsageBundleCell *)self imageView];
    [v8 setAlpha:0.5];

    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", 0.0, 0.0, 20.0, 43.0);
    [(PSUsageBundleCell *)self setAccessoryView:v9];

    [(PSUsageBundleCell *)self setSelectionStyle:0];
  }
}

- (void)layoutSubviews
{
  v45.receiver = self;
  v45.super_class = (Class)PSUsageBundleCell;
  [(PSTableCell *)&v45 layoutSubviews];
  v3 = [(PSUsageBundleCell *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  v8 = [(PSUsageBundleCell *)self detailTextLabel];
  [v8 frame];
  double v10 = v9;
  double v43 = v12;
  double v44 = v11;
  double v14 = v13;

  v15 = [(PSUsageBundleCell *)self textLabel];
  [v15 frame];
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;

  int v24 = [(PSUsageBundleCell *)self _shouldReverseLayoutDirection];
  v25 = [(PSUsageBundleCell *)self detailTextLabel];
  objc_msgSend(v25, "sizeThatFits:", v5, v7);
  double v27 = v26;

  if (v14 < v27)
  {
    double v28 = ceil(v27 - v14);
    double v14 = v14 + v28;
    double v29 = v10 - v28;
    if (v24) {
      double v30 = v10;
    }
    else {
      double v30 = v10 - v28;
    }
    double v42 = v30;
    if (v24)
    {
      double v31 = v17;
      double v32 = v19;
      double v33 = v21;
      double v34 = v23;
    }
    else
    {
      double v31 = v29;
      double v34 = v43;
      double v32 = v44;
      double v33 = v14;
    }
    double MinX = CGRectGetMinX(*(CGRect *)&v31);
    v46.origin.x = v17;
    v46.origin.y = v19;
    v46.size.width = v21;
    v46.size.height = v23;
    if (MinX - CGRectGetMaxX(v46) >= 6.0)
    {
      double v29 = v42;
      goto LABEL_14;
    }
    v47.origin.x = v17;
    v47.origin.y = v19;
    v47.size.width = v21;
    v47.size.height = v23;
    double Width = CGRectGetWidth(v47);
    if ((v24 & 1) == 0)
    {
      v51.origin.x = v29;
      v51.size.height = v43;
      v51.origin.y = v44;
      v51.size.width = v14;
      CGFloat v39 = CGRectGetMinX(v51) + -6.0;
      v52.origin.x = v17;
      v52.origin.y = v19;
      v52.size.width = v21;
      v52.size.height = v23;
      double v21 = v39 - CGRectGetMinX(v52);
      goto LABEL_14;
    }
    double v37 = Width;
    v48.origin.x = v17;
    v48.origin.y = v19;
    v48.size.width = v21;
    v48.size.height = v23;
    double MaxX = CGRectGetMaxX(v48);
    v49.origin.x = v10;
    v49.size.height = v43;
    v49.origin.y = v44;
    v49.size.width = v14;
    double v21 = MaxX - CGRectGetMaxX(v49) + -6.0;
    v50.origin.x = v17;
    v50.origin.y = v19;
    v50.size.width = v21;
    v50.size.height = v23;
    double v17 = v17 + v37 - CGRectGetWidth(v50);
  }
  double v29 = v10;
LABEL_14:
  v40 = [(PSUsageBundleCell *)self detailTextLabel];
  objc_msgSend(v40, "setFrame:", v29, v44, v14, v43);

  v41 = [(PSUsageBundleCell *)self textLabel];
  objc_msgSend(v41, "setFrame:", v17, v19, v21, v23);
}

@end