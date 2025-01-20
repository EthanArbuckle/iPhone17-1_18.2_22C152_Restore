@interface WFNANDataSessionsTableViewDataSource
- (NSOrderedSet)sections;
- (WFNANDataSessionsTableViewDataSource)initWithTableView:(id)a3 context:(id)a4 publisher:(id)a5 sections:(id)a6 cellProvider:(id)a7;
- (WFNANTableViewContext)context;
- (WiFiAwarePublisher)publisher;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (void)setContext:(id)a3;
- (void)setPublisher:(id)a3;
- (void)setSections:(id)a3;
@end

@implementation WFNANDataSessionsTableViewDataSource

- (WFNANDataSessionsTableViewDataSource)initWithTableView:(id)a3 context:(id)a4 publisher:(id)a5 sections:(id)a6 cellProvider:(id)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v19.receiver = self;
  v19.super_class = (Class)WFNANDataSessionsTableViewDataSource;
  v16 = [(UITableViewDiffableDataSource *)&v19 initWithTableView:a3 cellProvider:a7];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_sections, a6);
    objc_storeStrong((id *)&v17->_context, a4);
    objc_storeStrong((id *)&v17->_publisher, a5);
  }

  return v17;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  v5 = [(WFNANDataSessionsTableViewDataSource *)self sections];
  v6 = [v5 objectAtIndexedSubscript:a4];
  uint64_t v7 = [v6 unsignedIntegerValue];

  if (v7)
  {
    v8 = 0;
  }
  else
  {
    v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v8 = [v9 localizedStringForKey:@"kWFLocNANActiveDataSessions" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  }
  return v8;
}

- (NSOrderedSet)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
}

- (WFNANTableViewContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (WiFiAwarePublisher)publisher
{
  return self->_publisher;
}

- (void)setPublisher:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publisher, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_sections, 0);
}

@end