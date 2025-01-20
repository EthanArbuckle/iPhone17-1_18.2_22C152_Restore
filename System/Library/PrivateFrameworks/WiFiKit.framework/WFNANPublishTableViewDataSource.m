@interface WFNANPublishTableViewDataSource
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (NSOrderedSet)sections;
- (WFNANPublishTableViewDataSource)initWithTableView:(id)a3 context:(id)a4 sections:(id)a5 cellProvider:(id)a6;
- (WFNANTableViewContext)context;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (void)setContext:(id)a3;
- (void)setSections:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
@end

@implementation WFNANPublishTableViewDataSource

- (WFNANPublishTableViewDataSource)initWithTableView:(id)a3 context:(id)a4 sections:(id)a5 cellProvider:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)WFNANPublishTableViewDataSource;
  v12 = [(UITableViewDiffableDataSource *)&v15 initWithTableView:a3 cellProvider:a6];
  v13 = v12;
  if (v12)
  {
    [(WFNANPublishTableViewDataSource *)v12 setSections:v11];
    [(WFNANPublishTableViewDataSource *)v13 setContext:v10];
  }

  return v13;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  v5 = [(WFNANPublishTableViewDataSource *)self sections];
  v6 = [v5 objectAtIndexedSubscript:a4];
  uint64_t v7 = [v6 unsignedIntegerValue];

  if (v7 == 1)
  {
    v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v9 = v8;
    id v10 = @"kWFLocNANPublishers";
    goto LABEL_5;
  }
  if (!v7)
  {
    v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v9 = v8;
    id v10 = @"kWFLocNANAddPublisher";
LABEL_5:
    id v11 = [v8 localizedStringForKey:v10 value:&stru_26D9BFD58 table:@"WiFiKitUILocalizableStrings"];

    goto LABEL_7;
  }
  id v11 = 0;
LABEL_7:
  return v11;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  v5 = [(WFNANPublishTableViewDataSource *)self sections];
  v6 = [v5 objectAtIndexedSubscript:a4];
  uint64_t v7 = [v6 unsignedIntegerValue];

  if (v7)
  {
    v8 = 0;
  }
  else
  {
    v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v8 = [v9 localizedStringForKey:@"kWFLocNANPassphraseWarning" value:&stru_26D9BFD58 table:@"WiFiKitUILocalizableStrings"];
  }
  return v8;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v5 = a4;
  v6 = [(WFNANPublishTableViewDataSource *)self sections];
  uint64_t v7 = [v5 section];

  v8 = [v6 objectAtIndexedSubscript:v7];
  uint64_t v9 = [v8 unsignedIntegerValue];

  return v9 == 1 && [(WFNANTableViewContext *)self->_context getPublishersCount] > 0;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  if (a4 == 1)
  {
    context = self->_context;
    uint64_t v7 = objc_msgSend(a5, "row", a3);
    [(WFNANTableViewContext *)context removePublisherAtIndex:v7];
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_sections, 0);
}

@end