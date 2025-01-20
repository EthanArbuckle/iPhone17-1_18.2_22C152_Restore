@interface PSAccessoryInfoHeaderCell
+ (double)headerHeight;
- (UIView)headerView;
- (void)commonInit;
- (void)setHeaderView:(id)a3;
@end

@implementation PSAccessoryInfoHeaderCell

- (void)commonInit
{
  v25[4] = *MEMORY[0x1E4F143B8];
  v3 = [(PSTableCell *)self specifier];
  v24 = [v3 userInfo];

  v4 = -[PSAccessoryInfoHeaderView initWithDevice:insets:]([PSAccessoryInfoHeaderView alloc], "initWithDevice:insets:", v24, 16.0, 16.0, 16.0, 16.0);
  [(PSAccessoryInfoHeaderView *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  v5 = [(PSAccessoryInfoHeaderCell *)self contentView];
  [v5 addSubview:v4];

  v16 = (void *)MEMORY[0x1E4F28DC8];
  v22 = [(PSAccessoryInfoHeaderView *)v4 leadingAnchor];
  v23 = [(PSAccessoryInfoHeaderCell *)self contentView];
  v21 = [v23 leadingAnchor];
  v20 = [v22 constraintEqualToAnchor:v21];
  v25[0] = v20;
  v18 = [(PSAccessoryInfoHeaderView *)v4 trailingAnchor];
  v19 = [(PSAccessoryInfoHeaderCell *)self contentView];
  v17 = [v19 trailingAnchor];
  v15 = [v18 constraintEqualToAnchor:v17];
  v25[1] = v15;
  v6 = [(PSAccessoryInfoHeaderView *)v4 topAnchor];
  v7 = [(PSAccessoryInfoHeaderCell *)self contentView];
  v8 = [v7 topAnchor];
  v9 = [v6 constraintEqualToAnchor:v8];
  v25[2] = v9;
  v10 = [(PSAccessoryInfoHeaderView *)v4 bottomAnchor];
  v11 = [(PSAccessoryInfoHeaderCell *)self contentView];
  v12 = [v11 bottomAnchor];
  v13 = [v10 constraintEqualToAnchor:v12];
  v25[3] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:4];
  [v16 activateConstraints:v14];
}

+ (double)headerHeight
{
  return 192.0;
}

- (UIView)headerView
{
  return self->_headerView;
}

- (void)setHeaderView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end