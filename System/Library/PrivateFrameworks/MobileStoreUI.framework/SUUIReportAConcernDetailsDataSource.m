@interface SUUIReportAConcernDetailsDataSource
- (NSString)placeholder;
- (NSString)privacyNote;
- (NSString)selectedReason;
- (SUUIReportAConcernDetailsDataSource)init;
- (SUUIReportAConcernDetailsDataSource)initWithTableView:(id)a3;
- (UITableView)tableView;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)setPlaceholder:(id)a3;
- (void)setPrivacyNote:(id)a3;
- (void)setSelectedReason:(id)a3;
- (void)setTableView:(id)a3;
@end

@implementation SUUIReportAConcernDetailsDataSource

- (SUUIReportAConcernDetailsDataSource)init
{
  id v3 = objc_alloc_init(MEMORY[0x263F82C78]);
  v4 = [(SUUIReportAConcernDetailsDataSource *)self initWithTableView:v3];

  return v4;
}

- (SUUIReportAConcernDetailsDataSource)initWithTableView:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUIReportAConcernDetailsDataSource;
  v6 = [(SUUIReportAConcernDetailsDataSource *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_tableView, a3);
    [v5 registerClass:objc_opt_class() forCellReuseIdentifier:@"SUUIConcernDetailsCell"];
  }

  return v7;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", @"SUUIConcernDetailsCell", a4);
  v6 = [(SUUIReportAConcernDetailsDataSource *)self placeholder];
  [v5 setPlaceholderText:v6];

  return v5;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  v4 = [(SUUIReportAConcernDetailsDataSource *)self selectedReason];
  id v5 = [v4 uppercaseString];

  return v5;
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
}

- (NSString)placeholder
{
  return self->_placeholder;
}

- (void)setPlaceholder:(id)a3
{
}

- (NSString)selectedReason
{
  return self->_selectedReason;
}

- (void)setSelectedReason:(id)a3
{
}

- (NSString)privacyNote
{
  return self->_privacyNote;
}

- (void)setPrivacyNote:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privacyNote, 0);
  objc_storeStrong((id *)&self->_selectedReason, 0);
  objc_storeStrong((id *)&self->_placeholder, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
}

@end