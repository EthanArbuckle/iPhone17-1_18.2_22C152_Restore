@interface PageTitleAndAddressTableViewCell
+ (double)defaultHeight;
- (PageTitleAndAddressTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)_updateFont;
- (void)_updateNumberOfLines;
- (void)layoutSubviews;
- (void)setTitle:(id)a3 address:(id)a4 prompt:(id)a5 withQuery:(id)a6;
@end

@implementation PageTitleAndAddressTableViewCell

+ (double)defaultHeight
{
  return 44.0;
}

- (PageTitleAndAddressTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)PageTitleAndAddressTableViewCell;
  v4 = [(PageTitleAndAddressTableViewCell *)&v14 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(PageTitleAndAddressTableViewCell *)v4 _updateNumberOfLines];
    [(PageTitleAndAddressTableViewCell *)v5 _updateFont];
    v6 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    v7 = [(PageTitleAndAddressTableViewCell *)v5 detailTextLabel];
    [v7 setTextColor:v6];

    v16[0] = objc_opt_class();
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
    id v9 = (id)[(PageTitleAndAddressTableViewCell *)v5 registerForTraitChanges:v8 withTarget:v5 action:sel__updateNumberOfLines];

    uint64_t v15 = objc_opt_class();
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
    id v11 = (id)[(PageTitleAndAddressTableViewCell *)v5 registerForTraitChanges:v10 withTarget:v5 action:sel__updateFont];

    v12 = v5;
  }

  return v5;
}

- (void)layoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)PageTitleAndAddressTableViewCell;
  [(CompletionListTableViewCell *)&v16 layoutSubviews];
  v3 = [(PageTitleAndAddressTableViewCell *)self imageView];
  v4 = [v3 image];
  if (v4)
  {
    [v3 frame];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    [v4 size];
    +[CompletionListTableViewCell imageWidthSpace];
    id v11 = [(PageTitleAndAddressTableViewCell *)self textLabel];
    [v11 frame];
    _SFRoundFloatToPixels();
    if ([(PageTitleAndAddressTableViewCell *)self _sf_usesLeftToRightLayout])
    {
      _SFRoundFloatToPixels();
      double v13 = v12;
    }
    else
    {
      objc_super v14 = [(PageTitleAndAddressTableViewCell *)self contentView];
      [v14 bounds];
      CGRectGetMaxX(v17);
      _SFRoundFloatToPixels();
      double v13 = v15;
    }
    objc_msgSend(v3, "setFrame:", v13, v6, v8, v10);
  }
}

- (void)setTitle:(id)a3 address:(id)a4 prompt:(id)a5 withQuery:(id)a6
{
  if (a3) {
    id v9 = a3;
  }
  else {
    id v9 = a4;
  }
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  double v13 = [(PageTitleAndAddressTableViewCell *)self textLabel];
  [v13 setText:v9];

  objc_msgSend(NSString, "safari_detailStringWithURLString:prompt:", v11, v10);
  id v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_super v14 = [(PageTitleAndAddressTableViewCell *)self detailTextLabel];
  [v14 setText:v15];
}

- (void)_updateNumberOfLines
{
  v3 = [(PageTitleAndAddressTableViewCell *)self traitCollection];
  v4 = [v3 preferredContentSizeCategory];
  if (UIContentSizeCategoryIsAccessibilityCategory(v4)) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 1;
  }

  double v6 = [(PageTitleAndAddressTableViewCell *)self textLabel];
  [v6 setNumberOfLines:v5];

  id v7 = [(PageTitleAndAddressTableViewCell *)self detailTextLabel];
  [v7 setNumberOfLines:v5];
}

- (void)_updateFont
{
  v3 = [(PageTitleAndAddressTableViewCell *)self traitCollection];
  uint64_t v4 = [v3 verticalSizeClass];

  if (v4 == 1)
  {
    uint64_t v5 = *MEMORY[0x1E4FB2790];
    double v6 = [(PageTitleAndAddressTableViewCell *)self textLabel];
    [v6 setMaximumContentSizeCategory:v5];

    id v7 = [(PageTitleAndAddressTableViewCell *)self detailTextLabel];
    [v7 setMaximumContentSizeCategory:v5];
  }
  double v8 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB28C8] weight:*MEMORY[0x1E4FB09D0]];
  id v9 = [(PageTitleAndAddressTableViewCell *)self textLabel];
  [v9 setFont:v8];

  id v11 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28D8]];
  id v10 = [(PageTitleAndAddressTableViewCell *)self detailTextLabel];
  [v10 setFont:v11];
}

@end