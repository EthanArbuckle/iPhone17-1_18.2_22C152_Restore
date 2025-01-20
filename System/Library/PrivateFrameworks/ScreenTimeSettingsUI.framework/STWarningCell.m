@interface STWarningCell
- (STWarningCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
@end

@implementation STWarningCell

- (STWarningCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v27[3] = *MEMORY[0x263EF8340];
  v26.receiver = self;
  v26.super_class = (Class)STWarningCell;
  v5 = [(PSTableCell *)&v26 initWithStyle:a3 reuseIdentifier:a4 specifier:a5];
  v6 = [(STWarningCell *)v5 contentView];
  v25 = [MEMORY[0x263F82818] configurationWithScale:3];
  id v7 = objc_alloc(MEMORY[0x263F82828]);
  v8 = [MEMORY[0x263F827E8] systemImageNamed:@"exclamationmark.circle" withConfiguration:v25];
  v9 = (void *)[v7 initWithImage:v8];

  v10 = [MEMORY[0x263F825C8] systemRedColor];
  [v9 setTintColor:v10];

  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v6 addSubview:v9];
  v23 = [v9 centerYAnchor];
  v24 = v6;
  v22 = [v6 centerYAnchor];
  v11 = [v23 constraintEqualToAnchor:v22];
  v27[0] = v11;
  v12 = [v9 trailingAnchor];
  v13 = [v6 trailingAnchor];
  v14 = [v12 constraintEqualToAnchor:v13];
  v27[1] = v14;
  v15 = [v9 leadingAnchor];
  v21 = v5;
  v16 = [(PSTableCell *)v5 titleLabel];
  v17 = [v16 trailingAnchor];
  v18 = [v15 constraintGreaterThanOrEqualToAnchor:v17 constant:8.0];
  v27[2] = v18;
  v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:3];

  [MEMORY[0x263F08938] activateConstraints:v19];
  return v21;
}

@end