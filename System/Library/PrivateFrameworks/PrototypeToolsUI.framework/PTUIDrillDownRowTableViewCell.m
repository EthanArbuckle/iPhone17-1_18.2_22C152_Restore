@interface PTUIDrillDownRowTableViewCell
+ (int64_t)cellStyleForRow:(id)a3;
- (PTUIDrillDownRowTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)updateDisplayedValue;
@end

@implementation PTUIDrillDownRowTableViewCell

+ (int64_t)cellStyleForRow:(id)a3
{
  return 1;
}

- (PTUIDrillDownRowTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PTUIDrillDownRowTableViewCell;
  v4 = [(PTUIDrillDownRowTableViewCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4) {
    [(PTUIDrillDownRowTableViewCell *)v4 setAccessoryType:1];
  }
  return v5;
}

- (void)updateDisplayedValue
{
}

void __53__PTUIDrillDownRowTableViewCell_updateDisplayedValue__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) row];
  id v4 = [v2 value];

  v3 = [*(id *)(a1 + 32) detailTextLabel];
  [v3 setText:v4];
}

@end