@interface PSUITurnOnThisLineTableCell
+ (int64_t)cellStyle;
- (BOOL)canBeChecked;
- (BOOL)canReload;
- (PSUITurnOnThisLineTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UILabel)statusLabel;
- (UILabel)titleLabel;
- (id)detailTextLabel;
- (id)textLabel;
- (void)_setTitle:(id)a3 andStatus:(id)a4;
- (void)_updateStatus:(id)a3;
- (void)refreshCellContentsWithSpecifier:(id)a3;
- (void)setStatusLabel:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation PSUITurnOnThisLineTableCell

+ (int64_t)cellStyle
{
  return 3;
}

- (PSUITurnOnThisLineTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v48.receiver = self;
  v48.super_class = (Class)PSUITurnOnThisLineTableCell;
  v4 = [(PSUITurnOnThisLineTableCell *)&v48 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    v47.receiver = v4;
    v47.super_class = (Class)PSUITurnOnThisLineTableCell;
    v6 = [(PSUITurnOnThisLineTableCell *)&v47 textLabel];
    [v6 removeFromSuperview];

    v46.receiver = v5;
    v46.super_class = (Class)PSUITurnOnThisLineTableCell;
    v7 = [(PSUITurnOnThisLineTableCell *)&v46 detailTextLabel];
    [v7 removeFromSuperview];

    [(PSUITurnOnThisLineTableCell *)v5 setAccessoryType:1];
    v8 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    titleLabel = v5->_titleLabel;
    v5->_titleLabel = v8;

    uint64_t v10 = *MEMORY[0x263F83570];
    v11 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
    [(UILabel *)v5->_titleLabel setFont:v11];

    [(UILabel *)v5->_titleLabel setAdjustsFontForContentSizeCategory:1];
    [(UILabel *)v5->_titleLabel setNumberOfLines:0];
    [(UILabel *)v5->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v12 = [(PSUITurnOnThisLineTableCell *)v5 contentView];
    [v12 addSubview:v5->_titleLabel];

    v13 = [(UILabel *)v5->_titleLabel centerYAnchor];
    v14 = [(PSUITurnOnThisLineTableCell *)v5 contentView];
    v15 = [v14 centerYAnchor];
    v16 = [v13 constraintEqualToAnchor:v15];
    [v16 setActive:1];

    v17 = [(UILabel *)v5->_titleLabel leadingAnchor];
    v18 = [(PSUITurnOnThisLineTableCell *)v5 contentView];
    v19 = [v18 layoutMarginsGuide];
    v20 = [v19 leadingAnchor];
    v21 = [v17 constraintEqualToAnchor:v20];
    [v21 setActive:1];

    v22 = [(UILabel *)v5->_titleLabel widthAnchor];
    v23 = [(PSUITurnOnThisLineTableCell *)v5 contentView];
    v24 = [v23 layoutMarginsGuide];
    v25 = [v24 widthAnchor];
    v26 = [v22 constraintEqualToAnchor:v25 multiplier:0.6];
    [v26 setActive:1];

    v27 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    statusLabel = v5->_statusLabel;
    v5->_statusLabel = v27;

    v29 = [MEMORY[0x263F81708] preferredFontForTextStyle:v10];
    [(UILabel *)v5->_statusLabel setFont:v29];

    [(UILabel *)v5->_statusLabel setAdjustsFontForContentSizeCategory:1];
    [(UILabel *)v5->_statusLabel setNumberOfLines:0];
    v30 = [MEMORY[0x263F825C8] systemGrayColor];
    [(UILabel *)v5->_statusLabel setTextColor:v30];

    [(UILabel *)v5->_statusLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v31 = [(PSUITurnOnThisLineTableCell *)v5 contentView];
    [v31 addSubview:v5->_statusLabel];

    v32 = [(UILabel *)v5->_statusLabel centerYAnchor];
    v33 = [(PSUITurnOnThisLineTableCell *)v5 contentView];
    v34 = [v33 centerYAnchor];
    v35 = [v32 constraintEqualToAnchor:v34];
    [v35 setActive:1];

    v36 = [(UILabel *)v5->_statusLabel trailingAnchor];
    v37 = [(PSUITurnOnThisLineTableCell *)v5 contentView];
    v38 = [v37 layoutMarginsGuide];
    v39 = [v38 trailingAnchor];
    v40 = [v36 constraintEqualToAnchor:v39];
    [v40 setActive:1];

    LODWORD(v41) = 1148846080;
    [(UILabel *)v5->_statusLabel setContentCompressionResistancePriority:0 forAxis:v41];
    v42 = [(UILabel *)v5->_statusLabel leadingAnchor];
    v43 = [(UILabel *)v5->_titleLabel trailingAnchor];
    v44 = [v42 constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:v43 multiplier:2.0];
    [v44 setActive:1];
  }
  return v5;
}

- (BOOL)canReload
{
  return 1;
}

- (BOOL)canBeChecked
{
  return 0;
}

- (void)_setTitle:(id)a3 andStatus:(id)a4
{
  titleLabel = self->_titleLabel;
  id v8 = a4;
  id v7 = a3;
  [(UILabel *)titleLabel setHidden:0];
  [(UILabel *)self->_titleLabel setText:v7];

  [(UILabel *)self->_titleLabel setEnabled:1];
  [(UILabel *)self->_statusLabel setText:v8];
}

- (void)_updateStatus:(id)a3
{
  id v4 = a3;
  id v11 = v4;
  if (v4 && [v4 transferredStatus])
  {
    v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v6 = [v5 localizedStringForKey:@"TURN_ON_THIS_LINE" value:&stru_26D410CA0 table:@"Gemini-Gemini"];
    id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v8 = v7;
    v9 = @"CHECKING";
  }
  else
  {
    v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v6 = [v5 localizedStringForKey:@"TURN_ON_THIS_LINE" value:&stru_26D410CA0 table:@"Gemini-Gemini"];
    id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v8 = v7;
    v9 = @"ACTIVATING";
  }
  uint64_t v10 = [v7 localizedStringForKey:v9 value:&stru_26D410CA0 table:@"Gemini-Gemini"];
  [(PSUITurnOnThisLineTableCell *)self _setTitle:v6 andStatus:v10];
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PSUITurnOnThisLineTableCell;
  id v4 = a3;
  [(PSTableCell *)&v8 refreshCellContentsWithSpecifier:v4];
  v5 = objc_msgSend(v4, "propertyForKey:", *MEMORY[0x263F5FFF0], v8.receiver, v8.super_class);

  v6 = +[PSUICellularPlanManagerCache sharedInstance];
  id v7 = [v6 planFromReference:v5];

  [(PSUITurnOnThisLineTableCell *)self _updateStatus:v7];
  [(PSUITurnOnThisLineTableCell *)self setNeedsLayout];
}

- (id)textLabel
{
  return 0;
}

- (id)detailTextLabel
{
  return 0;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)statusLabel
{
  return self->_statusLabel;
}

- (void)setStatusLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end