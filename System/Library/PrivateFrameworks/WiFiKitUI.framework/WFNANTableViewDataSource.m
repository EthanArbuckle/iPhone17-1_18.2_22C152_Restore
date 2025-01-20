@interface WFNANTableViewDataSource
- (NSOrderedSet)sections;
- (WFNANTableViewDataSource)initWithTableView:(id)a3 sections:(id)a4 cellProvider:(id)a5;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (void)setSections:(id)a3;
@end

@implementation WFNANTableViewDataSource

- (WFNANTableViewDataSource)initWithTableView:(id)a3 sections:(id)a4 cellProvider:(id)a5
{
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)WFNANTableViewDataSource;
  v9 = [(UITableViewDiffableDataSource *)&v12 initWithTableView:a3 cellProvider:a5];
  v10 = v9;
  if (v9) {
    [(WFNANTableViewDataSource *)v9 setSections:v8];
  }

  return v10;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  v5 = [(WFNANTableViewDataSource *)self sections];
  v6 = [v5 objectAtIndexedSubscript:a4];
  uint64_t v7 = [v6 unsignedIntegerValue];

  switch(v7)
  {
    case 2:
      id v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v9 = v8;
      v10 = @"kWFLocNANSubscribe";
      goto LABEL_7;
    case 1:
      id v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v9 = v8;
      v10 = @"kWFLocNANPublish";
      goto LABEL_7;
    case 0:
      id v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v9 = v8;
      v10 = @"kWFLocNANSummary";
LABEL_7:
      v11 = [v8 localizedStringForKey:v10 value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

      goto LABEL_9;
  }
  v11 = 0;
LABEL_9:
  return v11;
}

- (NSOrderedSet)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
}

- (void).cxx_destruct
{
}

@end