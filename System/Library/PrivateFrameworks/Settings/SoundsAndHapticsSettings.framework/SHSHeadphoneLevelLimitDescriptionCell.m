@interface SHSHeadphoneLevelLimitDescriptionCell
+ (int64_t)cellStyle;
- (SHSHeadphoneLevelLimitDescriptionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)setSeparatorStyle:(int64_t)a3;
@end

@implementation SHSHeadphoneLevelLimitDescriptionCell

+ (int64_t)cellStyle
{
  return 3;
}

- (SHSHeadphoneLevelLimitDescriptionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)SHSHeadphoneLevelLimitDescriptionCell;
  v4 = [(SHSHeadphoneLevelLimitDescriptionCell *)&v10 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835B8]];
    v6 = [(SHSHeadphoneLevelLimitDescriptionCell *)v4 detailTextLabel];
    [v6 setFont:v5];

    v7 = [(SHSHeadphoneLevelLimitDescriptionCell *)v4 detailTextLabel];
    [v7 setNumberOfLines:0];

    v8 = [(SHSHeadphoneLevelLimitDescriptionCell *)v4 detailTextLabel];
    [v8 setLineBreakMode:0];
  }
  return v4;
}

- (void)setSeparatorStyle:(int64_t)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SHSHeadphoneLevelLimitDescriptionCell;
  [(SHSHeadphoneLevelLimitDescriptionCell *)&v3 setSeparatorStyle:0];
}

@end