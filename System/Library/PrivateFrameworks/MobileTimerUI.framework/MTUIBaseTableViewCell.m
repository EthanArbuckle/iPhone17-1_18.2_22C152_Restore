@interface MTUIBaseTableViewCell
- (MTUIBaseTableViewCell)init;
- (MTUIBaseTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (double)preferredHeight;
- (void)didMoveToSuperview;
@end

@implementation MTUIBaseTableViewCell

- (MTUIBaseTableViewCell)init
{
  return [(MTUIBaseTableViewCell *)self initWithStyle:3 reuseIdentifier:@"kMTUIBaseTableViewCellIdentifier"];
}

- (MTUIBaseTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)MTUIBaseTableViewCell;
  v4 = [(MTUIBaseTableViewCell *)&v12 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = objc_msgSend(MEMORY[0x263F1C550], "mtui_backgroundColor");
    [(MTUIBaseTableViewCell *)v4 setBackgroundColor:v5];

    v6 = objc_msgSend(MEMORY[0x263F1C550], "mtui_cellHighlightColor");
    [(UITableViewCell *)v4 setSelectedBackgroundColor:v6];

    v7 = objc_msgSend(MEMORY[0x263F1C550], "mtui_primaryTextColor");
    v8 = [(MTUIBaseTableViewCell *)v4 textLabel];
    [v8 setTextColor:v7];

    v9 = objc_msgSend(MEMORY[0x263F1C550], "mtui_secondaryColor");
    v10 = [(MTUIBaseTableViewCell *)v4 detailTextLabel];
    [v10 setTextColor:v9];
  }
  return v4;
}

- (double)preferredHeight
{
  return *MEMORY[0x263F1D600];
}

- (void)didMoveToSuperview
{
  v10.receiver = self;
  v10.super_class = (Class)MTUIBaseTableViewCell;
  [(MTUIBaseTableViewCell *)&v10 didMoveToSuperview];
  v3 = (void *)MEMORY[0x263F1C658];
  uint64_t v4 = *MEMORY[0x263F1D260];
  uint64_t v5 = *MEMORY[0x263F1D148];
  v6 = [(MTUIBaseTableViewCell *)self traitCollection];
  v7 = [v3 _preferredFontForTextStyle:v4 maximumContentSizeCategory:v5 compatibleWithTraitCollection:v6];

  v8 = [(MTUIBaseTableViewCell *)self textLabel];
  [v8 setFont:v7];

  v9 = [(MTUIBaseTableViewCell *)self detailTextLabel];
  [v9 setFont:v7];
}

@end