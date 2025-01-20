@interface SCLHistoryDayDataSource
- (PSSpecifier)countSpecifier;
- (PSSpecifier)itemSpecifier;
- (SCLHistoryDayDataSource)initWithListController:(id)a3 viewModel:(id)a4 historyGroup:(id)a5 title:(id)a6;
- (void)setCountSpecifier:(id)a3;
- (void)setItemSpecifier:(id)a3;
@end

@implementation SCLHistoryDayDataSource

- (SCLHistoryDayDataSource)initWithListController:(id)a3 viewModel:(id)a4 historyGroup:(id)a5 title:(id)a6
{
  v29[3] = *MEMORY[0x263EF8340];
  id v10 = a5;
  id v11 = a6;
  v28.receiver = self;
  v28.super_class = (Class)SCLHistoryDayDataSource;
  v12 = [(SCLSpecifierDataSource *)&v28 initWithListController:a3 viewModel:a4];
  if (v12)
  {
    v13 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"HISTORY_CELL_GROUP" name:v11];
    v14 = (void *)MEMORY[0x263F5FC40];
    v15 = objc_msgSend(NSString, "stringWithFormat:", @"HISTORY_CELL-0x%p", v12);
    v16 = [v14 preferenceSpecifierNamed:v15 target:0 set:0 get:0 detail:0 cell:-1 edit:0];

    uint64_t v17 = objc_opt_class();
    uint64_t v18 = *MEMORY[0x263F5FFE0];
    [v16 setProperty:v17 forKey:*MEMORY[0x263F5FFE0]];
    v19 = NSNumber;
    v20 = [v10 items];
    v21 = objc_msgSend(v19, "numberWithUnsignedInteger:", objc_msgSend(v20, "count"));
    uint64_t v22 = *MEMORY[0x263F60308];
    [v16 setProperty:v21 forKey:*MEMORY[0x263F60308]];

    [(SCLHistoryDayDataSource *)v12 setCountSpecifier:v16];
    v23 = (void *)MEMORY[0x263F5FC40];
    v24 = objc_msgSend(NSString, "stringWithFormat:", @"HISTORY_ITEM_CELL-0x%p", v12);
    v25 = [v23 preferenceSpecifierNamed:v24 target:0 set:0 get:0 detail:0 cell:-1 edit:0];

    [v25 setProperty:objc_opt_class() forKey:v18];
    [v25 setProperty:v10 forKey:v22];
    [(SCLHistoryDayDataSource *)v12 setItemSpecifier:v25];
    v29[0] = v13;
    v29[1] = v16;
    v29[2] = v25;
    v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:3];
    [(SCLSpecifierDataSource *)v12 setSpecifiers:v26];
  }
  return v12;
}

- (PSSpecifier)countSpecifier
{
  return self->_countSpecifier;
}

- (void)setCountSpecifier:(id)a3
{
}

- (PSSpecifier)itemSpecifier
{
  return self->_itemSpecifier;
}

- (void)setItemSpecifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemSpecifier, 0);

  objc_storeStrong((id *)&self->_countSpecifier, 0);
}

@end