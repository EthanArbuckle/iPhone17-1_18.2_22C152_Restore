@interface STAppTitleSubtitleCell
+ (int64_t)cellStyle;
- (BOOL)hasSubtitle;
- (BOOL)isAppCell;
- (void)_didFetchAppInfoOrIcon:(id)a3;
- (void)layoutSubviews;
- (void)refreshCellContentsWithSpecifier:(id)a3;
- (void)setHasSubtitle:(BOOL)a3;
- (void)setSpecifier:(id)a3;
@end

@implementation STAppTitleSubtitleCell

+ (int64_t)cellStyle
{
  return 3;
}

- (BOOL)isAppCell
{
  return 1;
}

- (void)layoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)STAppTitleSubtitleCell;
  [(PSTableCell *)&v14 layoutSubviews];
  if ([(id)objc_opt_class() cellStyle] == 3
    && ![(STAppTitleSubtitleCell *)self hasSubtitle])
  {
    v3 = [(STAppTitleSubtitleCell *)self textLabel];
    [v3 frame];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;

    v10 = [(STAppTitleSubtitleCell *)self contentView];
    [v10 bounds];
    double v12 = round((v11 - v9) * 0.5);

    v13 = [(STAppTitleSubtitleCell *)self textLabel];
    objc_msgSend(v13, "setFrame:", v5, v12, v7, v9);
  }
}

- (void)setSpecifier:(id)a3
{
  id v4 = a3;
  double v5 = [(PSTableCell *)self specifier];
  double v6 = [v5 objectForKeyedSubscript:@"STAppBundleID"];

  v10.receiver = self;
  v10.super_class = (Class)STAppTitleSubtitleCell;
  [(PSTableCell *)&v10 setSpecifier:v4];
  if ([(STAppTitleSubtitleCell *)self isAppCell])
  {
    double v7 = [v4 objectForKeyedSubscript:@"STAppBundleID"];
    if (v7 == v6)
    {
LABEL_9:

      goto LABEL_10;
    }
    double v8 = [MEMORY[0x263F67408] sharedCache];
    double v9 = [MEMORY[0x263F670A8] sharedCache];
    if (v6)
    {
      if ([v7 isEqualToString:v6])
      {
LABEL_8:

        goto LABEL_9;
      }
      [v8 removeObserver:self bundleIdentifier:v6];
      [v9 removeObserver:self bundleIdentifier:v6];
    }
    if (v7)
    {
      [v8 addObserver:self selector:sel__didFetchAppInfoOrIcon_ bundleIdentifier:v7];
      [v9 addObserver:self selector:sel__didFetchAppInfoOrIcon_ bundleIdentifier:v7];
    }
    goto LABEL_8;
  }
LABEL_10:
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)STAppTitleSubtitleCell;
  [(PSTableCell *)&v17 refreshCellContentsWithSpecifier:v4];
  if ([(id)objc_opt_class() cellStyle] == 3)
  {
    double v5 = [(STAppTitleSubtitleCell *)self detailTextLabel];
    double v6 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835F0]];
    [v5 setFont:v6];

    double v7 = [v4 objectForKeyedSubscript:*MEMORY[0x263F602C8]];
    [(STAppTitleSubtitleCell *)self setHasSubtitle:v7 != 0];
    if ([(STAppTitleSubtitleCell *)self hasSubtitle])
    {
      [v5 setText:v7];
      double v8 = [MEMORY[0x263F825C8] grayColor];
      [v5 setTextColor:v8];
    }
    else
    {
      [v5 setText:@" "];
    }
  }
  if ([(STAppTitleSubtitleCell *)self isAppCell])
  {
    double v9 = [v4 objectForKeyedSubscript:@"STAppBundleID"];
    if (v9)
    {
      objc_super v10 = [MEMORY[0x263F670A8] sharedCache];
      double v11 = [v10 appInfoForBundleIdentifier:v9];
      double v12 = [v11 displayName];

      v13 = [MEMORY[0x263F67408] sharedCache];
      objc_super v14 = [v13 imageForBundleIdentifier:v9];
    }
    else
    {
      double v12 = 0;
      objc_super v14 = 0;
    }
    v15 = [(STAppTitleSubtitleCell *)self textLabel];
    [v15 setText:v12];

    v16 = [(STAppTitleSubtitleCell *)self imageView];
    [v16 setImage:v14];
  }
  [(STAppTitleSubtitleCell *)self setNeedsLayout];
}

- (void)_didFetchAppInfoOrIcon:(id)a3
{
  uint64_t v4 = [(PSTableCell *)self specifier];
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v4 = [(STAppTitleSubtitleCell *)self refreshCellContentsWithSpecifier:v4];
    uint64_t v5 = v6;
  }

  MEMORY[0x270F9A758](v4, v5);
}

- (BOOL)hasSubtitle
{
  return self->_hasSubtitle;
}

- (void)setHasSubtitle:(BOOL)a3
{
  self->_hasSubtitle = a3;
}

@end