@interface PSBillingPeriodSelectorSpecifier
- (PSBillingPeriodSelectorSpecifier)initWithStatisticsCache:(id)a3;
- (PSBillingPeriodSelectorSpecifierDelegate)delegate;
- (id)getBillingPeriod:(id)a3;
- (id)getLogger;
- (unint64_t)selectedPeriod;
- (void)refreshSelectorWithStatisticsCache:(id)a3;
- (void)setBillingPeriod:(id)a3 specifier:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setSelectedPeriod:(unint64_t)a3;
@end

@implementation PSBillingPeriodSelectorSpecifier

- (PSBillingPeriodSelectorSpecifier)initWithStatisticsCache:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PSBillingPeriodSelectorSpecifier;
  v5 = [(PSBillingPeriodSelectorSpecifier *)&v8 initWithName:&stru_26D7A1F58 target:self set:sel_setBillingPeriod_specifier_ get:sel_getBillingPeriod_ detail:0 cell:9 edit:0];
  v6 = v5;
  if (v5)
  {
    [(PSBillingPeriodSelectorSpecifier *)v5 refreshSelectorWithStatisticsCache:v4];
    [(PSBillingPeriodSelectorSpecifier *)v6 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F60298]];
  }

  return v6;
}

- (void)refreshSelectorWithStatisticsCache:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = [v4 useCalendarMonthBillingCycle];
  v6 = [(PSBillingPeriodSelectorSpecifier *)self getLogger];
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      *(_DWORD *)buf = 136315138;
      v25 = "-[PSBillingPeriodSelectorSpecifier refreshSelectorWithStatisticsCache:]";
      _os_log_impl(&dword_2247E9000, v6, OS_LOG_TYPE_DEFAULT, "%s using calendar month billing cycle", buf, 0xCu);
    }

    objc_super v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v9 = [v8 localizedStringForKey:@"THIS_MONTH" value:&stru_26D7A1F58 table:@"WirelessData"];
    v23[0] = v9;
    v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v11 = [v10 localizedStringForKey:@"LAST_MONTH" value:&stru_26D7A1F58 table:@"WirelessData"];
    v23[1] = v11;
    v12 = v23;
  }
  else
  {
    if (v7)
    {
      *(_DWORD *)buf = 136315138;
      v25 = "-[PSBillingPeriodSelectorSpecifier refreshSelectorWithStatisticsCache:]";
      _os_log_impl(&dword_2247E9000, v6, OS_LOG_TYPE_DEFAULT, "%s using carrier-provided billing cycle", buf, 0xCu);
    }

    objc_super v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v9 = [v8 localizedStringForKey:@"THIS_BILLING_PERIOD" value:&stru_26D7A1F58 table:@"WirelessData"];
    v22[0] = v9;
    v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v11 = [v10 localizedStringForKey:@"LAST_BILLING_PERIOD" value:&stru_26D7A1F58 table:@"WirelessData"];
    v22[1] = v11;
    v12 = v22;
  }
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:2];

  v14 = [v4 previousBillingCycleEndDate];

  if (v14)
  {
    v15 = &unk_26D7A3EE0;
  }
  else
  {
    v16 = [(PSBillingPeriodSelectorSpecifier *)self getLogger];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v25 = "-[PSBillingPeriodSelectorSpecifier refreshSelectorWithStatisticsCache:]";
      _os_log_impl(&dword_2247E9000, v16, OS_LOG_TYPE_DEFAULT, "%s hiding previous period", buf, 0xCu);
    }

    v17 = [v13 objectAtIndexedSubscript:0];
    v21 = v17;
    uint64_t v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v21 count:1];

    v19 = [&unk_26D7A3EE0 objectAtIndexedSubscript:0];
    v20 = v19;
    v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v20 count:1];

    v13 = (void *)v18;
  }
  [(PSBillingPeriodSelectorSpecifier *)self setValues:v15 titles:v13];
}

- (void)setBillingPeriod:(id)a3 specifier:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = [(PSBillingPeriodSelectorSpecifier *)self getLogger];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PSBillingPeriodSelectorSpecifier selectedPeriod](self, "selectedPeriod"));
    int v9 = 136315650;
    v10 = "-[PSBillingPeriodSelectorSpecifier setBillingPeriod:specifier:]";
    __int16 v11 = 2112;
    v12 = v7;
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl(&dword_2247E9000, v6, OS_LOG_TYPE_DEFAULT, "%s setting from %@ to %@", (uint8_t *)&v9, 0x20u);
  }
  -[PSBillingPeriodSelectorSpecifier setSelectedPeriod:](self, "setSelectedPeriod:", [v5 unsignedIntegerValue]);
  objc_super v8 = [(PSBillingPeriodSelectorSpecifier *)self delegate];
  objc_msgSend(v8, "selectedBillingPeriodChanged:", -[PSBillingPeriodSelectorSpecifier selectedPeriod](self, "selectedPeriod"));
}

- (id)getBillingPeriod:(id)a3
{
  v3 = NSNumber;
  unint64_t v4 = [(PSBillingPeriodSelectorSpecifier *)self selectedPeriod];
  return (id)[v3 numberWithUnsignedInteger:v4];
}

- (id)getLogger
{
  return +[Logger loggerWithCategory:@"BillingPeriodSelector"];
}

- (PSBillingPeriodSelectorSpecifierDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PSBillingPeriodSelectorSpecifierDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)selectedPeriod
{
  return self->_selectedPeriod;
}

- (void)setSelectedPeriod:(unint64_t)a3
{
  self->_selectedPeriod = a3;
}

- (void).cxx_destruct
{
}

@end