@interface STWrappingTitleSubtitleCell
- (STWrappingTitleSubtitleCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (void)layoutSubviews;
@end

@implementation STWrappingTitleSubtitleCell

- (STWrappingTitleSubtitleCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)STWrappingTitleSubtitleCell;
  v5 = [(PSTableCell *)&v10 initWithStyle:a3 reuseIdentifier:a4 specifier:a5];
  v6 = v5;
  if (v5)
  {
    v7 = [(PSTableCell *)v5 titleLabel];
    [v7 setNumberOfLines:0];
    [v7 setLineBreakMode:0];
    v8 = [(STWrappingTitleSubtitleCell *)v6 detailTextLabel];
    [v8 setNumberOfLines:0];
    [v8 setLineBreakMode:0];
  }
  return v6;
}

- (void)layoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)STWrappingTitleSubtitleCell;
  [(STAppTitleSubtitleCell *)&v14 layoutSubviews];
  v3 = [(id)*MEMORY[0x263F83300] preferredContentSizeCategory];
  if (!UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)v3))
  {
    v4 = [(STWrappingTitleSubtitleCell *)self superview];

    if (!v4) {
      return;
    }
    v3 = [(PSTableCell *)self specifier];
    v5 = [v3 objectForKeyedSubscript:@"AlternateShorterSubtitle"];
    uint64_t v6 = [v3 objectForKeyedSubscript:@"MaximumNumberOfLines"];
    v7 = (void *)v6;
    if (v5 && v6)
    {
      v8 = [(STWrappingTitleSubtitleCell *)self detailTextLabel];
      [v8 frame];
      double Height = CGRectGetHeight(v15);
      objc_super v10 = [v8 font];
      [v10 lineHeight];
      double v12 = round(Height / v11);

      [v7 doubleValue];
      if (v12 > v13)
      {
        [v8 setText:v5];
        [v3 setObject:v5 forKeyedSubscript:*MEMORY[0x263F602C8]];
      }
    }
  }
}

@end