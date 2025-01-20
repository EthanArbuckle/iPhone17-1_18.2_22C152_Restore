@interface STTimeTitleDetailCell
- (STTimeTitleDetailCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
@end

@implementation STTimeTitleDetailCell

- (STTimeTitleDetailCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)STTimeTitleDetailCell;
  v5 = -[STTimeTitleDetailCell initWithStyle:reuseIdentifier:](&v9, sel_initWithStyle_reuseIdentifier_, a3, a4, a5);
  if (v5)
  {
    v6 = [MEMORY[0x263F825C8] tableCellBlueTextColor];
    v7 = [(STTimeTitleDetailCell *)v5 detailTextLabel];
    [v7 setTextColor:v6];
  }
  return v5;
}

@end