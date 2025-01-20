@interface PSUICellularDataPlanTableCell
- (BOOL)_isDisabledPhysicalSIM:(id)a3;
- (BOOL)canBeChecked;
- (PSUICellularDataPlanTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIImageView)iconView;
- (id)_cellularPlanItem;
- (id)detailText;
- (id)getLogger;
- (id)planDescription;
- (id)planStatus;
- (id)primaryText;
- (void)infoSymbolTapped:(id)a3;
- (void)refreshCellContentsWithSpecifier:(id)a3;
- (void)setIconView:(id)a3;
@end

@implementation PSUICellularDataPlanTableCell

- (PSUICellularDataPlanTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)PSUICellularDataPlanTableCell;
  v4 = [(PSUICellularDataPlanTableCell *)&v10 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = (void *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:v4 action:sel_infoSymbolTapped_];
    [v5 setNumberOfTapsRequired:1];
    v6 = [MEMORY[0x263F827E8] systemImageNamed:@"info.circle"];
    uint64_t v7 = [objc_alloc(MEMORY[0x263F82828]) initWithImage:v6];
    iconView = v4->_iconView;
    v4->_iconView = (UIImageView *)v7;

    [(PSUICellularDataPlanTableCell *)v4 setAccessoryView:v4->_iconView];
    [(UIImageView *)v4->_iconView addGestureRecognizer:v5];
    [(UIImageView *)v4->_iconView setUserInteractionEnabled:1];
  }
  return v4;
}

- (id)_cellularPlanItem
{
  v2 = [(PSTableCell *)self specifier];
  v3 = [v2 userInfo];

  return v3;
}

- (BOOL)canBeChecked
{
  v3 = [(PSUICellularDataPlanTableCell *)self _cellularPlanItem];
  v4 = [(PSTableCell *)self specifier];
  v5 = [v4 propertyForKey:*MEMORY[0x263F600A8]];

  if ([v3 isSelectable] && objc_msgSend(v3, "transferredStatus") != 4)
  {
    if (v5) {
      char v6 = [v5 BOOLValue];
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)primaryText
{
  v3 = [(PSUICellularDataPlanTableCell *)self planDescription];
  if ([v3 length])
  {
    id v4 = v3;
  }
  else
  {
    id v4 = [(PSUICellularDataPlanTableCell *)self planStatus];
  }
  v5 = v4;

  return v5;
}

- (id)detailText
{
  v3 = [(PSUICellularDataPlanTableCell *)self planDescription];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    v5 = [(PSUICellularDataPlanTableCell *)self planStatus];
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)planDescription
{
  v2 = [(PSUICellularDataPlanTableCell *)self _cellularPlanItem];
  if ([v2 isSimStateValid])
  {
    if ([v2 isBackedByCellularPlan])
    {
      v3 = [v2 plan];
      uint64_t v4 = [v3 planDescription];

      v5 = [v2 plan];
      char v6 = [v5 carrierName];

      if (![v4 length]
        || ![v6 length]
        || ([v4 isEqualToString:v6] & 1) != 0)
      {
        if (v4)
        {
          id v7 = v4;
        }
        else if (v6)
        {
          id v7 = v6;
        }
        else
        {
          id v7 = [v2 name];
        }
        goto LABEL_22;
      }
      v18 = NSString;
      v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v19 = [v17 localizedStringForKey:@"CELLULAR_PLAN_CARRIER_AND_PLAN_NAME" value:&stru_26D410CA0 table:@"Cellular"];
      objc_super v10 = objc_msgSend(v18, "stringWithFormat:", v19, v6, v4);

      goto LABEL_19;
    }
    v11 = [v2 identifier];
    int v12 = [v11 isEqualToString:*MEMORY[0x263F31930]];

    if (!v12)
    {
      v13 = [v2 identifier];
      int v14 = [v13 isEqualToString:*MEMORY[0x263F31938]];

      if (!v14)
      {
        objc_super v10 = [v2 name];
        goto LABEL_25;
      }
      v15 = [v2 plan];
      uint64_t v4 = [v15 carrierName];

      if (![v4 length])
      {
        char v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        id v7 = [v6 localizedStringForKey:@"HOME_PLAN_WITH_ROAMING" value:&stru_26D410CA0 table:@"Cellular"];
LABEL_22:
        objc_super v10 = v7;
        goto LABEL_23;
      }
      v16 = NSString;
      char v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v17 = [v6 localizedStringForKey:@"HOME_PLAN_FOR_CARRIER_WITH_ROAMING" value:&stru_26D410CA0 table:@"Cellular"];
      objc_super v10 = objc_msgSend(v16, "stringWithFormat:", v17, v4);
LABEL_19:

LABEL_23:
      goto LABEL_24;
    }
    v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v4 = v8;
    v9 = @"HOME_PLAN";
  }
  else
  {
    v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v4 = v8;
    v9 = @"CELLULAR_PLAN_SIM_STATE_INVALID";
  }
  objc_super v10 = [v8 localizedStringForKey:v9 value:&stru_26D410CA0 table:@"Cellular"];
LABEL_24:

LABEL_25:
  return v10;
}

- (id)planStatus
{
  v2 = [(PSUICellularDataPlanTableCell *)self _cellularPlanItem];
  if ([v2 transferredStatus] == 4)
  {
    v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v4 = v3;
    v5 = @"CONVERTED";
  }
  else
  {
    if ([v2 transferredStatus])
    {
      uint64_t v4 = [v2 transferredToDeviceDisplayName];
      if ([v4 length])
      {
        char v6 = NSString;
        id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v8 = [v7 localizedStringForKey:@"TRANSFERRED_TO_@" value:&stru_26D410CA0 table:@"Gemini-Gemini"];
        v9 = objc_msgSend(v6, "stringWithFormat:", v8, v4);
      }
      else
      {
        id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v9 = [v7 localizedStringForKey:@"TRANSFERRED" value:&stru_26D410CA0 table:@"Gemini-Gemini"];
      }

      goto LABEL_13;
    }
    if ([v2 isBackedByCellularPlan] && objc_msgSend(v2, "isSimStateValid"))
    {
      v9 = PSUIFormatPlanStatusForPlan(v2);
      goto LABEL_14;
    }
    v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v4 = v3;
    v5 = @"CELLULAR_PLAN_STATUS_SIM_CARD";
  }
  v9 = [v3 localizedStringForKey:v5 value:&stru_26D410CA0 table:@"Cellular"];
LABEL_13:

LABEL_14:
  return v9;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v25.receiver = self;
  v25.super_class = (Class)PSUICellularDataPlanTableCell;
  [(PSUICarrierSpacePlanTableCell *)&v25 refreshCellContentsWithSpecifier:a3];
  uint64_t v4 = [(PSUICellularDataPlanTableCell *)self _cellularPlanItem];
  v5 = v4;
  if (v4 && [v4 isSelected])
  {
    uint64_t v6 = [(id)objc_opt_class() checkIcon];
  }
  else
  {
    uint64_t v6 = [(id)objc_opt_class() spacerIcon];
  }
  id v7 = (void *)v6;
  [(PSTableCell *)self setIcon:v6];

  if ([(PSUICellularDataPlanTableCell *)self _isDisabledPhysicalSIM:v5])
  {
    iconView = self->_iconView;
    v9 = [MEMORY[0x263F825C8] systemGrayColor];
    [(UIImageView *)iconView setTintColor:v9];
  }
  objc_super v10 = [(PSUICellularDataPlanTableCell *)self primaryText];
  v11 = [(PSUICellularDataPlanTableCell *)self textLabel];
  [v11 setText:v10];

  int v12 = [(PSUICellularDataPlanTableCell *)self detailText];
  v13 = [(PSUICellularDataPlanTableCell *)self detailTextLabel];
  [v13 setText:v12];

  if (v5)
  {
    int v14 = [v5 plan];
    int v15 = [v14 planStatus];

    if (v15 == 4)
    {
      v16 = [MEMORY[0x263F825C8] redColor];
      v17 = [(PSUICellularDataPlanTableCell *)self detailTextLabel];
      [v17 setColor:v16];
    }
  }
  if ([v5 transferredStatus] == 4)
  {
    v18 = [(PSTableCell *)self specifier];
    [v18 setProperty:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F600A8]];
  }
  BOOL v19 = [(PSUICellularDataPlanTableCell *)self canBeChecked];
  v20 = [(PSTableCell *)self titleLabel];
  [v20 setEnabled:v19];

  v21 = [(PSUICellularDataPlanTableCell *)self detailTextLabel];
  [v21 setEnabled:v19];

  v22 = [(PSUICarrierSpacePlanTableCell *)self accessoryText];
  if ([v22 length])
  {
    id v23 = objc_alloc(MEMORY[0x263F828E0]);
    v24 = objc_msgSend(v23, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    [v24 setText:v22];
    [v24 sizeToFit];
    [(PSUICellularDataPlanTableCell *)self setAccessoryView:v24];
  }
}

- (void)infoSymbolTapped:(id)a3
{
  uint64_t v4 = [(PSUICellularDataPlanTableCell *)self _cellularPlanItem];
  if ([(PSUICellularDataPlanTableCell *)self _isDisabledPhysicalSIM:v4])
  {
    v5 = [(PSUICellularDataPlanTableCell *)self getLogger];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_221B17000, v5, OS_LOG_TYPE_DEFAULT, "Skip sending notification for disabled physical SIM!", buf, 2u);
    }
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __50__PSUICellularDataPlanTableCell_infoSymbolTapped___block_invoke;
    block[3] = &unk_2645E0B88;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __50__PSUICellularDataPlanTableCell_infoSymbolTapped___block_invoke(uint64_t a1)
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  v2 = [*(id *)(a1 + 32) specifier];
  [v3 postNotificationName:@"PSDataPlanInfoSymbolTappedNotification" object:v2];
}

- (BOOL)_isDisabledPhysicalSIM:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3 && ![v3 type]) {
    int v5 = [v4 isSelected] ^ 1;
  }
  else {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (id)getLogger
{
  return (id)[MEMORY[0x263F67EB0] loggerWithCategory:@"CellularDataPlanTableCell"];
}

- (UIImageView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end