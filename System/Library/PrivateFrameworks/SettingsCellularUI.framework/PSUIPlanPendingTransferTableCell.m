@interface PSUIPlanPendingTransferTableCell
- (CTCellularPlanPendingTransfer)planPendingTransfer;
- (PSUIPlanPendingTransferTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIImageView)view;
- (void)refreshCellContentsWithSpecifier:(id)a3;
- (void)setPlanPendingTransfer:(id)a3;
- (void)setView:(id)a3;
@end

@implementation PSUIPlanPendingTransferTableCell

- (PSUIPlanPendingTransferTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v30.receiver = self;
  v30.super_class = (Class)PSUIPlanPendingTransferTableCell;
  v4 = [(PSUIDanglingPlanTableCell *)&v30 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = [MEMORY[0x263F827E8] systemImageNamed:@"exclamationmark.circle.fill"];
    v6 = [MEMORY[0x263F82818] configurationWithTextStyle:*MEMORY[0x263F83570] scale:3];
    uint64_t v7 = [objc_alloc(MEMORY[0x263F82828]) initWithImage:v5];
    view = v4->_view;
    v4->_view = (UIImageView *)v7;

    [(UIImageView *)v4->_view setPreferredSymbolConfiguration:v6];
    v9 = v4->_view;
    v10 = [MEMORY[0x263F825C8] systemRedColor];
    [(UIImageView *)v9 setTintColor:v10];

    [(UIImageView *)v4->_view setTranslatesAutoresizingMaskIntoConstraints:0];
    v11 = [(PSUIPlanPendingTransferTableCell *)v4 contentView];
    [v11 addSubview:v4->_view];

    v12 = [(UIImageView *)v4->_view centerYAnchor];
    v13 = [(PSUIPlanPendingTransferTableCell *)v4 contentView];
    v14 = [v13 layoutMarginsGuide];
    v15 = [v14 centerYAnchor];
    v16 = [v12 constraintEqualToAnchor:v15];
    [v16 setActive:1];

    v17 = [(UIImageView *)v4->_view trailingAnchor];
    v18 = [(PSUIPlanPendingTransferTableCell *)v4 contentView];
    v19 = [v18 layoutMarginsGuide];
    v20 = [v19 trailingAnchor];
    v21 = [v17 constraintEqualToAnchor:v20];
    [v21 setActive:1];

    LODWORD(v22) = 1148846080;
    [(UIImageView *)v4->_view setContentCompressionResistancePriority:0 forAxis:v22];
    LODWORD(v23) = 1148846080;
    [(UIImageView *)v4->_view setContentHuggingPriority:0 forAxis:v23];
    v24 = [(UIImageView *)v4->_view leadingAnchor];
    v25 = [(PSUIDanglingPlanTableCell *)v4 nameLabel];
    v26 = [v25 trailingAnchor];
    v27 = [v24 constraintEqualToAnchor:v26];
    [v27 setActive:1];

    v28 = [(PSUIDanglingPlanTableCell *)v4 statusLabel];
    [v28 removeFromSuperview];
  }
  return v4;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)PSUIPlanPendingTransferTableCell;
  [(PSUIDanglingPlanTableCell *)&v26 refreshCellContentsWithSpecifier:v4];
  v5 = [v4 propertyForKey:*MEMORY[0x263F5FFF0]];
  v6 = +[PSUICellularPlanManagerCache sharedInstance];
  uint64_t v7 = [v6 planPendingTransferFromReference:v5];
  planPendingTransfer = self->_planPendingTransfer;
  self->_planPendingTransfer = v7;

  v9 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v10 = [v9 userInterfaceIdiom];

  if ((v10 & 0xFFFFFFFFFFFFFFFBLL) != 1)
  {
    v19 = NSString;
    v20 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v21 = [v20 localizedStringForKey:@"USED_AS_%@" value:&stru_26D410CA0 table:@"Gemini-Gemini"];
    double v22 = [(CTCellularPlanPendingTransfer *)self->_planPendingTransfer planLabel];
    double v23 = [v22 label];
    v11 = objc_msgSend(v19, "stringWithFormat:", v21, v23);

    v15 = [(CTCellularPlanPendingTransfer *)self->_planPendingTransfer phoneNumber];
    v18 = +[SettingsCellularUtils formattedPhoneNumber:v15];
    goto LABEL_5;
  }
  v11 = [(CTCellularPlanPendingTransfer *)self->_planPendingTransfer carrierName];
  v12 = [(CTCellularPlanPendingTransfer *)self->_planPendingTransfer deviceName];
  uint64_t v13 = [v12 length];

  if (v13)
  {
    v14 = NSString;
    v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v16 = [v15 localizedStringForKey:@"USED_ON_%@" value:&stru_26D410CA0 table:@"Gemini-Gemini"];
    v17 = [(CTCellularPlanPendingTransfer *)self->_planPendingTransfer deviceName];
    v18 = objc_msgSend(v14, "stringWithFormat:", v16, v17);

LABEL_5:
    goto LABEL_6;
  }
  v18 = 0;
LABEL_6:
  [v4 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F5FEF8]];
  if ([v4 hasValidGetter])
  {
    v24 = [v4 performGetter];
    if (v24)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v25 = [(PSUIDanglingPlanTableCell *)self statusLabel];
        [v25 setText:v24];
      }
    }
  }
  [(PSUIDanglingPlanTableCell *)self _setLabel:v11 andPhoneNumber:v18];
  [(PSUIPlanPendingTransferTableCell *)self setNeedsLayout];
}

- (UIImageView)view
{
  return self->_view;
}

- (void)setView:(id)a3
{
}

- (CTCellularPlanPendingTransfer)planPendingTransfer
{
  return self->_planPendingTransfer;
}

- (void)setPlanPendingTransfer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_planPendingTransfer, 0);
  objc_storeStrong((id *)&self->_view, 0);
}

@end