@interface NMBUIDisclosureMediaTableCell
- (BOOL)_shouldDisplayDownloadProgressViewForDownloadState:(id)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NMBUIDisclosureMediaTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (NMBUIDownloadProgressView)downloadProgressView;
- (void)_handleDownloadIndicatorTapGesture:(id)a3;
- (void)_setDownloadState:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)refreshCellContentsWithSpecifier:(id)a3;
- (void)setDownloadProgressView:(id)a3;
@end

@implementation NMBUIDisclosureMediaTableCell

- (NMBUIDisclosureMediaTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v12.receiver = self;
  v12.super_class = (Class)NMBUIDisclosureMediaTableCell;
  v5 = [(PSTableCell *)&v12 initWithStyle:a3 reuseIdentifier:a4 specifier:a5];
  v6 = v5;
  if (v5)
  {
    v7 = [(NMBUIDisclosureMediaTableCell *)v5 imageView];
    [v7 setContentMode:2];

    v8 = [(NMBUIDisclosureMediaTableCell *)v6 imageView];
    [v8 setClipsToBounds:1];

    v9 = [(NMBUIDisclosureMediaTableCell *)v6 imageView];
    v10 = [v9 layer];
    [v10 setCornerRadius:3.0];
  }
  return v6;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NMBUIDisclosureMediaTableCell;
  -[NMBUIDisclosureMediaTableCell sizeThatFits:](&v5, sel_sizeThatFits_, a3.width, a3.height);
  if (v4 < 64.0) {
    double v4 = 64.0;
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)NMBUIDisclosureMediaTableCell;
  [(PSTableCell *)&v3 prepareForReuse];
  [(NMBUIDisclosureMediaTableCell *)self clearArtworkCatalogs];
  [(NMBUIDownloadProgressView *)self->_downloadProgressView removeFromSuperview];
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)NMBUIDisclosureMediaTableCell;
  [(PSTableCell *)&v19 refreshCellContentsWithSpecifier:v4];
  objc_super v5 = [v4 propertyForKey:@"NMBUISpecifierCellConfigurationKey"];
  v6 = [v5 title];
  v7 = [(PSTableCell *)self titleLabel];
  [v7 setText:v6];

  uint64_t v8 = [(NMBUIDisclosureMediaTableCell *)self style];
  if (v8 == 3)
  {
    id v10 = [v5 subtitle];
LABEL_15:
    [(NMBUIDisclosureMediaTableCell *)self _setBadgeText:0];
    objc_super v12 = [(NMBUIDisclosureMediaTableCell *)self detailTextLabel];
    [v12 setText:v10];

    goto LABEL_19;
  }
  if (v8 == 2)
  {
    if ([v4 hasValidGetter])
    {
      v11 = [v4 performGetter];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v10 = v11;
      }
      else {
        id v10 = 0;
      }
    }
    else
    {
      id v10 = 0;
    }
    goto LABEL_15;
  }
  if (v8 != 1) {
    goto LABEL_20;
  }
  if ([v4 hasValidGetter])
  {
    v9 = [v4 performGetter];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }
  }
  else
  {
    id v10 = 0;
  }
  v13 = [(NMBUIDisclosureMediaTableCell *)self detailTextLabel];
  [v13 setText:0];

  [(NMBUIDisclosureMediaTableCell *)self _setBadgeText:v10];
LABEL_19:

LABEL_20:
  v14 = [(NMBUIDisclosureMediaTableCell *)self imageView];
  v15 = [v5 artworkCatalog];
  v16 = [v5 placeholderImage];
  objc_msgSend(v14, "setArtworkCatalog:withPlaceholderImage:withDesiredSize:", v15, v16, 48.0, 48.0);

  v17 = [v5 downloadState];

  if (v17)
  {
    v18 = [v5 downloadState];
    [(NMBUIDisclosureMediaTableCell *)self _setDownloadState:v18];
  }
  [(NMBUIDisclosureMediaTableCell *)self setAccessoryType:1];
}

- (void)layoutSubviews
{
  v47.receiver = self;
  v47.super_class = (Class)NMBUIDisclosureMediaTableCell;
  [(PSTableCell *)&v47 layoutSubviews];
  objc_super v3 = [(PSTableCell *)self specifier];
  id v4 = [v3 propertyForKey:@"NMBUISpecifierCellConfigurationKey"];
  objc_super v5 = [v4 downloadState];

  if ([(NMBUIDisclosureMediaTableCell *)self _shouldDisplayDownloadProgressViewForDownloadState:v5])
  {
    v6 = [(NMBUIDisclosureMediaTableCell *)self contentView];
    v7 = [(NMBUIDisclosureMediaTableCell *)self downloadProgressView];
    [v6 addSubview:v7];

    uint64_t v8 = [(NMBUIDisclosureMediaTableCell *)self contentView];
    uint64_t v9 = [v8 effectiveUserInterfaceLayoutDirection];

    id v10 = [(NMBUIDisclosureMediaTableCell *)self downloadProgressView];
    [(NMBUIDisclosureMediaTableCell *)self bounds];
    objc_msgSend(v10, "sizeThatFits:", v11, v12);
    double v14 = v13;
    double v16 = v15;

    v17 = [(NMBUIDisclosureMediaTableCell *)self downloadProgressView];
    [v17 frame];

    v18 = [(NMBUIDisclosureMediaTableCell *)self contentView];
    [v18 bounds];
    if (v9 == 1)
    {
      double MinX = CGRectGetMinX(*(CGRect *)&v19);
      double v24 = 10.0;
    }
    else
    {
      double MinX = CGRectGetMaxX(*(CGRect *)&v19) - v14;
      double v24 = -10.0;
    }
    double v25 = MinX + v24;

    v26 = [(NMBUIDisclosureMediaTableCell *)self contentView];
    [v26 bounds];
    double v27 = CGRectGetMidY(v48) + v16 * -0.5;

    v28 = [(NMBUIDisclosureMediaTableCell *)self downloadProgressView];
    objc_msgSend(v28, "setFrame:", v25, v27, v14, v16);

    v29 = [(PSTableCell *)self titleLabel];
    [v29 frame];
    double v31 = v30;
    CGFloat v33 = v32;
    CGFloat v35 = v34;
    CGFloat v37 = v36;

    if (v9 == 1)
    {
      v49.origin.x = v31;
      v49.origin.y = v33;
      v49.size.width = v35;
      v49.size.height = v37;
      double MaxX = CGRectGetMaxX(v49);
      v50.origin.x = v25;
      v50.origin.y = v27;
      v50.size.width = v14;
      v50.size.height = v16;
      double v39 = MaxX - CGRectGetMaxX(v50);
    }
    else
    {
      v51.origin.x = v25;
      v51.origin.y = v27;
      v51.size.width = v14;
      v51.size.height = v16;
      double v40 = CGRectGetMinX(v51);
      v52.origin.x = v31;
      v52.origin.y = v33;
      v52.size.width = v35;
      v52.size.height = v37;
      double v39 = v40 - CGRectGetMinX(v52);
    }
    double v41 = v39 + -10.0;
    v42 = [(PSTableCell *)self titleLabel];
    v43 = [v42 superview];
    [v43 bounds];
    double Height = CGRectGetHeight(v53);

    if (v9 == 1)
    {
      v45 = [(NMBUIDisclosureMediaTableCell *)self contentView];
      [v45 bounds];
      double v31 = v14 + CGRectGetMinX(v54) + 20.0;
    }
    v46 = [(PSTableCell *)self titleLabel];
    objc_msgSend(v46, "setFrame:", v31, 0.0, v41, Height);
  }
}

- (NMBUIDownloadProgressView)downloadProgressView
{
  downloadProgressView = self->_downloadProgressView;
  if (!downloadProgressView)
  {
    id v4 = objc_alloc_init(NMBUIDownloadProgressView);
    objc_super v5 = self->_downloadProgressView;
    self->_downloadProgressView = v4;

    v6 = self->_downloadProgressView;
    v7 = (void *)[objc_alloc(MEMORY[0x263F1CA70]) initWithTarget:self action:sel__handleDownloadIndicatorTapGesture_];
    [(NMBUIDownloadProgressView *)v6 addGestureRecognizer:v7];

    downloadProgressView = self->_downloadProgressView;
  }
  return downloadProgressView;
}

- (BOOL)_shouldDisplayDownloadProgressViewForDownloadState:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    if ([v3 state] == 5)
    {
      [v4 progress];
      BOOL v6 = v5 < 1.0;
    }
    else
    {
      BOOL v6 = 1;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)_setDownloadState:(id)a3
{
  id v4 = a3;
  double v5 = v4;
  if (v4)
  {
    double v13 = v4;
    if (self->_downloadProgressView
      || (v6 = [(NMBUIDisclosureMediaTableCell *)self _shouldDisplayDownloadProgressViewForDownloadState:v4], double v5 = v13, v6))
    {
      uint64_t v7 = [v5 state];
      uint64_t v8 = [(NMBUIDisclosureMediaTableCell *)self downloadProgressView];
      [v8 setState:v7];

      [v13 progress];
      float v10 = v9;
      double v11 = [(NMBUIDisclosureMediaTableCell *)self downloadProgressView];
      *(float *)&double v12 = v10;
      [v11 setProgress:v12];
    }
  }
  MEMORY[0x270F9A758]();
}

- (void)_handleDownloadIndicatorTapGesture:(id)a3
{
  if ([a3 state] == 3)
  {
    id v4 = [(PSTableCell *)self specifier];
    id v7 = [v4 propertyForKey:@"NMBUISpecifierCellConfigurationKey"];

    double v5 = [v7 downloadIndicatorTapAction];

    if (v5)
    {
      BOOL v6 = [v7 downloadIndicatorTapAction];
      v6[2]();
    }
  }
}

- (void)setDownloadProgressView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end