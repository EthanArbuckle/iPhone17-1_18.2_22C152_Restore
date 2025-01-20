@interface NMBUIMediaTableCell
+ (CGSize)artworkSize;
+ (id)_configurationFromSpecifier:(id)a3;
- (BOOL)_shouldDisplayDownloadProgressViewForDownloadState:(id)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NMBUIDownloadProgressView)downloadProgressView;
- (NMBUIMediaTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (id)_errorButtonWithSpecifier:(id)a3;
- (void)_handleDownloadIndicatorTapGesture:(id)a3;
- (void)_setDownloadState:(id)a3;
- (void)prepareForReuse;
- (void)refreshCellContentsWithSpecifier:(id)a3;
- (void)setDownloadProgressView:(id)a3;
@end

@implementation NMBUIMediaTableCell

+ (CGSize)artworkSize
{
  double v2 = 48.0;
  double v3 = 48.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (NMBUIMediaTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = [v9 propertyForKey:*MEMORY[0x263F602B8]];
  v11 = v10;
  if (v10) {
    a3 = [v10 integerValue];
  }
  v19.receiver = self;
  v19.super_class = (Class)NMBUIMediaTableCell;
  v12 = [(PSSwitchTableCell *)&v19 initWithStyle:a3 reuseIdentifier:v8 specifier:v9];
  v13 = v12;
  if (v12)
  {
    v14 = [(NMBUIMediaTableCell *)v12 imageView];
    [v14 setContentMode:2];

    v15 = [(NMBUIMediaTableCell *)v13 imageView];
    [v15 setClipsToBounds:1];

    v16 = [(NMBUIMediaTableCell *)v13 imageView];
    v17 = [v16 layer];
    [v17 setCornerRadius:3.0];
  }
  return v13;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NMBUIMediaTableCell;
  -[NMBUIMediaTableCell sizeThatFits:](&v5, sel_sizeThatFits_, a3.width, a3.height);
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
  v3.super_class = (Class)NMBUIMediaTableCell;
  [(PSSwitchTableCell *)&v3 prepareForReuse];
  [(NMBUIMediaTableCell *)self clearArtworkCatalogs];
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)NMBUIMediaTableCell;
  [(PSSwitchTableCell *)&v29 refreshCellContentsWithSpecifier:v4];
  [(NMBUIMediaTableCell *)self setAccessoryView:0];
  objc_super v5 = [(id)objc_opt_class() _configurationFromSpecifier:v4];
  v6 = [v5 title];
  v7 = [(PSTableCell *)self titleLabel];
  [v7 setText:v6];

  uint64_t v8 = [(NMBUIMediaTableCell *)self style];
  if ((unint64_t)(v8 - 1) >= 2)
  {
    id v10 = 0;
    if (v8 == 3)
    {
      id v10 = [v5 subtitle];
    }
  }
  else if ([v4 hasValidGetter])
  {
    id v9 = [v4 performGetter];
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
  v11 = [(NMBUIMediaTableCell *)self detailTextLabel];
  [v11 setText:v10];

  v12 = [(NMBUIMediaTableCell *)self imageView];
  v13 = [v5 artworkCatalog];
  v14 = [v5 placeholderImage];
  objc_msgSend(v12, "setArtworkCatalog:withPlaceholderImage:withDesiredSize:", v13, v14, 48.0, 48.0);

  v15 = [MEMORY[0x263EFF980] arrayWithCapacity:3];
  v16 = [v5 downloadState];
  LODWORD(v14) = [(NMBUIMediaTableCell *)self _shouldDisplayDownloadProgressViewForDownloadState:v16];

  if (v14)
  {
    v17 = [v5 downloadState];
    [(NMBUIMediaTableCell *)self _setDownloadState:v17];

    uint64_t v18 = [(NMBUIMediaTableCell *)self downloadProgressView];
  }
  else
  {
    objc_super v19 = [v4 propertyForKey:@"NMBUISpecifierShouldShowExclamationIconKey"];
    int v20 = [v19 BOOLValue];

    if (!v20) {
      goto LABEL_15;
    }
    uint64_t v18 = [(NMBUIMediaTableCell *)self _errorButtonWithSpecifier:v4];
  }
  v21 = (void *)v18;
  [v15 addObject:v18];

LABEL_15:
  v22 = [v4 propertyForKey:@"NMBUISpecifierShouldShowSwitchKey"];
  int v23 = [v22 BOOLValue];

  v24 = [(PSControlTableCell *)self control];
  v25 = v24;
  if (v23) {
    [v15 addObject:v24];
  }
  else {
    [v24 removeFromSuperview];
  }

  if ([v15 count])
  {
    v26 = (void *)[objc_alloc(MEMORY[0x263F1C9B8]) initWithArrangedSubviews:v15];
    [v26 setSpacing:10.0];
    objc_msgSend(v26, "systemLayoutSizeFittingSize:", *MEMORY[0x263F1D490], *(double *)(MEMORY[0x263F1D490] + 8));
    objc_msgSend(v26, "setFrame:", 0.0, 0.0, v27, v28);
    [(NMBUIMediaTableCell *)self setAccessoryView:v26];
  }
  else
  {
    [(NMBUIMediaTableCell *)self setAccessoryView:0];
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
    v13 = v4;
    if (self->_downloadProgressView
      || (v6 = [(NMBUIMediaTableCell *)self _shouldDisplayDownloadProgressViewForDownloadState:v4], double v5 = v13, v6))
    {
      uint64_t v7 = [v5 state];
      uint64_t v8 = [(NMBUIMediaTableCell *)self downloadProgressView];
      [v8 setState:v7];

      [v13 progress];
      float v10 = v9;
      v11 = [(NMBUIMediaTableCell *)self downloadProgressView];
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

- (id)_errorButtonWithSpecifier:(id)a3
{
  id v3 = (void *)MEMORY[0x263F1C488];
  id v4 = a3;
  double v5 = [v3 buttonWithType:118];
  BOOL v6 = [MEMORY[0x263F1C550] redColor];
  [v5 setTintColor:v6];

  id v7 = [v4 propertyForKey:@"NMBUISpecifierIconTargetKey"];
  uint64_t v8 = [v4 propertyForKey:@"NMBUISpecifierIconActionStringKey"];

  SEL v9 = NSSelectorFromString(v8);
  [v5 removeTarget:0 action:0 forControlEvents:64];
  [v5 addTarget:v7 action:v9 forEvents:64];

  return v5;
}

+ (id)_configurationFromSpecifier:(id)a3
{
  id v3 = a3;
  id v4 = [v3 propertyForKey:@"NMBUISpecifierCellConfigurationKey"];
  if (!v4)
  {
    id v4 = objc_alloc_init(NMBUIMediaTableCellConfiguration);
    double v5 = [v3 propertyForKey:@"NMBUISpecifierModelObjectKey"];
    [(NMBUIMediaTableCellConfiguration *)v4 setModelObject:v5];

    BOOL v6 = [v3 propertyForKey:@"NMBUISpecifierArtworkCatalogKey"];
    [(NMBUIMediaTableCellConfiguration *)v4 setArtworkCatalog:v6];

    id v7 = [v3 propertyForKey:@"NMBUISpecifierPlaceholderImageKey"];
    [(NMBUIMediaTableCellConfiguration *)v4 setPlaceholderImage:v7];

    uint64_t v8 = [v3 propertyForKey:@"NMBUISpecifierTitleKey"];
    [(NMBUIMediaTableCellConfiguration *)v4 setTitle:v8];

    SEL v9 = [v3 propertyForKey:@"NMBUISpecifierSubtitleKey"];
    [(NMBUIMediaTableCellConfiguration *)v4 setSubtitle:v9];

    float v10 = [v3 propertyForKey:@"NMBUISpecifierShouldShowDownloadInfoKey"];
    char v11 = [v10 BOOLValue];

    double v12 = [v3 propertyForKey:@"NMBUISpecifierDownloadStateKey"];
    if (v12)
    {
      v13 = [v3 propertyForKey:@"NMBUISpecifierDownloadStateKey"];
      uint64_t v14 = [v13 unsignedIntegerValue];
    }
    else
    {
      uint64_t v14 = 5;
    }

    v15 = [v3 propertyForKey:@"NMBUISpecifierDownloadProgressKey"];
    [v15 floatValue];
    float v17 = v16;

    if (v11)
    {
      uint64_t v18 = [[NMBUIMediaTableCellDownloadState alloc] initWithState:v14 progress:v17];
      [(NMBUIMediaTableCellConfiguration *)v4 setDownloadState:v18];
    }
    else
    {
      [(NMBUIMediaTableCellConfiguration *)v4 setDownloadState:0];
    }
  }

  return v4;
}

- (void)setDownloadProgressView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadProgressView, 0);
  objc_storeStrong((id *)&self->_errorButton, 0);
}

@end