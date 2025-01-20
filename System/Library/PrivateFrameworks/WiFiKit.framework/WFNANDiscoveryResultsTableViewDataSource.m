@interface WFNANDiscoveryResultsTableViewDataSource
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (NSOrderedSet)sections;
- (WFNANDiscoveryResultsTableViewDataSource)initWithTableView:(id)a3 context:(id)a4 subscriber:(id)a5 sections:(id)a6 cellProvider:(id)a7;
- (WFNANTableViewContext)context;
- (WiFiAwareSubscriber)subscriber;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (void)setContext:(id)a3;
- (void)setSections:(id)a3;
- (void)setSubscriber:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
@end

@implementation WFNANDiscoveryResultsTableViewDataSource

- (WFNANDiscoveryResultsTableViewDataSource)initWithTableView:(id)a3 context:(id)a4 subscriber:(id)a5 sections:(id)a6 cellProvider:(id)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v19.receiver = self;
  v19.super_class = (Class)WFNANDiscoveryResultsTableViewDataSource;
  v16 = [(UITableViewDiffableDataSource *)&v19 initWithTableView:a3 cellProvider:a7];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_sections, a6);
    objc_storeStrong((id *)&v17->_context, a4);
    objc_storeStrong((id *)&v17->_subscriber, a5);
  }

  return v17;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  v5 = [(WFNANDiscoveryResultsTableViewDataSource *)self sections];
  v6 = [v5 objectAtIndexedSubscript:a4];
  uint64_t v7 = [v6 unsignedIntegerValue];

  if (v7 == 1)
  {
    v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v9 = v8;
    v10 = @"kWFLocNANActiveDataSessions";
    goto LABEL_5;
  }
  if (!v7)
  {
    v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v9 = v8;
    v10 = @"kWFLocNANDiscoveryResults";
LABEL_5:
    v11 = [v8 localizedStringForKey:v10 value:&stru_26D9BFD58 table:@"WiFiKitUILocalizableStrings"];

    goto LABEL_7;
  }
  v11 = 0;
LABEL_7:
  return v11;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v5 = a4;
  v6 = [(WFNANDiscoveryResultsTableViewDataSource *)self sections];
  uint64_t v7 = [v5 section];

  v8 = [v6 objectAtIndexedSubscript:v7];
  uint64_t v9 = [v8 unsignedIntegerValue];

  return v9 == 1
      && [(WFNANTableViewContext *)self->_context getDataSessionsCountForSubscriber:self->_subscriber] > 0;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  if (a4 == 1)
  {
    -[WFNANTableViewContext getDataSessionAtIndex:forSubscriber:](self->_context, "getDataSessionAtIndex:forSubscriber:", objc_msgSend(a5, "row", a3), self->_subscriber);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    [v7 stop];
    [(WFNANTableViewContext *)self->_context removeDataSession:v7 forSubscriber:self->_subscriber];
  }
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

- (WiFiAwareSubscriber)subscriber
{
  return self->_subscriber;
}

- (void)setSubscriber:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriber, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_sections, 0);
}

@end