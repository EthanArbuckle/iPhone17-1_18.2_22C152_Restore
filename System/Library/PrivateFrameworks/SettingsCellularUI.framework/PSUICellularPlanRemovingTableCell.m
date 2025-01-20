@interface PSUICellularPlanRemovingTableCell
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation PSUICellularPlanRemovingTableCell

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v23.receiver = self;
  v23.super_class = (Class)PSUICellularPlanRemovingTableCell;
  id v4 = a3;
  [(PSUICellularPlanActivatingTableCell *)&v23 refreshCellContentsWithSpecifier:v4];
  v5 = objc_msgSend(v4, "propertyForKey:", *MEMORY[0x263F5FFF0], v23.receiver, v23.super_class);
  v6 = +[PSUICellularPlanManagerCache sharedInstance];
  v7 = [v6 planFromReference:v5];

  v8 = [v4 propertyForKey:*MEMORY[0x263F60290]];

  v9 = +[PSUICoreTelephonySubscriberCache sharedInstance];
  v10 = [v9 shortLabel:v8];

  v11 = [v7 userLabel];
  v12 = [v11 label];

  v13 = +[PSUICoreTelephonyCallCache sharedInstance];
  v14 = [v7 phoneNumber];
  v15 = [v13 localizedPhoneNumber:v14 context:v8];

  if ([v10 length] && -[__CFString length](v12, "length"))
  {
    uint64_t v16 = [v15 length];
    v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v18 = [v17 localizedStringForKey:@"REMOVING" value:&stru_26D410CA0 table:@"Gemini-Gemini"];
    if (v16) {
      [(PSUICellularPlanActivatingTableCell *)self _setBadge:v10 andTitle:v12 andSubtitle:v15 andStatus:v18];
    }
    else {
      [(PSUICellularPlanActivatingTableCell *)self _setCenteredBadge:v10 andCenteredTitle:v12 andStatus:v18];
    }
  }
  else
  {
    uint64_t v19 = [(__CFString *)v12 length];
    v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v18 = [v17 localizedStringForKey:@"REMOVING" value:&stru_26D410CA0 table:@"Gemini-Gemini"];
    if (v19)
    {
      v20 = self;
      v21 = v12;
      v22 = v18;
    }
    else
    {
      v22 = &stru_26D410CA0;
      v20 = self;
      v21 = v18;
    }
    [(PSUICellularPlanActivatingTableCell *)v20 _setBadgelessCenteredTitle:v21 andStatus:v22];
  }

  [(PSUICellularPlanRemovingTableCell *)self setNeedsLayout];
}

@end