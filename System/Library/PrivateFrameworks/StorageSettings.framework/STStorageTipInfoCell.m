@interface STStorageTipInfoCell
- (STStorageTipInfoCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (void)refreshCellContentsWithSpecifier:(id)a3;
- (void)updateConstraints;
@end

@implementation STStorageTipInfoCell

- (STStorageTipInfoCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v20[1] = *MEMORY[0x263EF8340];
  id v8 = a5;
  v19.receiver = self;
  v19.super_class = (Class)STStorageTipInfoCell;
  v9 = [(PSTableCell *)&v19 initWithStyle:a3 reuseIdentifier:a4 specifier:v8];
  v10 = v9;
  if (v9)
  {
    v11 = [(STStorageTipInfoCell *)v9 contentView];
    id v12 = objc_alloc(MEMORY[0x263F1C768]);
    uint64_t v13 = objc_msgSend(v12, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    infoLabel = v10->_infoLabel;
    v10->_infoLabel = (UILabel *)v13;

    v15 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F1D2C0]];
    [(UILabel *)v10->_infoLabel setFont:v15];

    v16 = [MEMORY[0x263F1C550] secondaryLabelColor];
    [(UILabel *)v10->_infoLabel setTextColor:v16];

    [(UILabel *)v10->_infoLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v10->_infoLabel setAccessibilityIdentifier:@"Info"];
    [(UILabel *)v10->_infoLabel setNumberOfLines:0];
    [(UILabel *)v10->_infoLabel setLineBreakMode:0];
    [v11 addSubview:v10->_infoLabel];
    v20[0] = v10->_infoLabel;
    v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:1];
    [v11 setAccessibilityElements:v17];

    [(STStorageTipInfoCell *)v10 refreshCellContentsWithSpecifier:v8];
  }

  return v10;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v22.receiver = self;
  v22.super_class = (Class)STStorageTipInfoCell;
  id v4 = a3;
  [(PSTableCell *)&v22 refreshCellContentsWithSpecifier:v4];
  v5 = [v4 propertyForKey:@"stInfo"];
  v6 = [v4 propertyForKey:@"stTipKind"];
  int v7 = [v6 isEqualToString:@"stActionTip"];

  id v8 = [v4 propertyForKey:@"stSize"];
  uint64_t v9 = [v8 unsignedLongLongValue];

  v10 = [v4 propertyForKey:@"stImmediateGain"];
  uint64_t v11 = [v10 unsignedLongLongValue];

  id v12 = [v4 propertyForKey:@"stEventualGain"];

  unint64_t v13 = [v12 unsignedLongLongValue];
  if (v9) {
    uint64_t v14 = v9;
  }
  else {
    uint64_t v14 = v11;
  }
  if (v13 <= 0x3E8) {
    unint64_t v15 = 0;
  }
  else {
    unint64_t v15 = v13;
  }
  if (v15 + v14 >= 0x3E9)
  {
    v16 = STFormattedSize();
    if (v13 > 0x3E8) {
      int v17 = 1;
    }
    else {
      int v17 = v7;
    }
    if (v17) {
      v18 = @"ST_UPTO_INFO_FMT %@ %@";
    }
    else {
      v18 = @"ST_SIZE_INFO_FMT %@ %@";
    }
    objc_super v19 = NSString;
    v20 = STFrameworkLocStr(v18);
    uint64_t v21 = objc_msgSend(v19, "stringWithFormat:", v20, v16, v5, v22.receiver, v22.super_class);

    v5 = (void *)v21;
  }
  [(UILabel *)self->_infoLabel setText:v5];
  [(STStorageTipInfoCell *)self setNeedsUpdateConstraints];
  [(STStorageTipInfoCell *)self setNeedsDisplay];
}

- (void)updateConstraints
{
  v3 = _NSDictionaryOfVariableBindings(&cfstr_Infolabel.isa, self->_infoLabel, 0);
  if ([(NSMutableArray *)self->_constraints count]) {
    [MEMORY[0x263F08938] deactivateConstraints:self->_constraints];
  }
  id v4 = [MEMORY[0x263EFF980] array];
  constraints = self->_constraints;
  self->_constraints = v4;

  v6 = self->_constraints;
  int v7 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|-60-[_infoLabel]-10-|" options:0 metrics:0 views:v3];
  [(NSMutableArray *)v6 addObjectsFromArray:v7];

  id v8 = self->_constraints;
  uint64_t v9 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:|-10-[_infoLabel]-10-|" options:0 metrics:0 views:v3];
  [(NSMutableArray *)v8 addObjectsFromArray:v9];

  [MEMORY[0x263F08938] activateConstraints:self->_constraints];
  v10.receiver = self;
  v10.super_class = (Class)STStorageTipInfoCell;
  [(STStorageTipInfoCell *)&v10 updateConstraints];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_infoLabel, 0);

  objc_storeStrong((id *)&self->_constraints, 0);
}

@end