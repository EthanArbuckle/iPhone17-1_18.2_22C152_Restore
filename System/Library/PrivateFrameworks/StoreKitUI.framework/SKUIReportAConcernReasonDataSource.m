@interface SKUIReportAConcernReasonDataSource
- (NSArray)reasons;
- (NSString)selectReasonSubtitle;
- (NSString)selectReasonTitle;
- (SKUIReportAConcernReasonDataSource)init;
- (SKUIReportAConcernReasonDataSource)initWithTableView:(id)a3;
- (UITableView)tableView;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)setReasons:(id)a3;
- (void)setSelectReasonSubtitle:(id)a3;
- (void)setSelectReasonTitle:(id)a3;
- (void)setTableView:(id)a3;
@end

@implementation SKUIReportAConcernReasonDataSource

- (SKUIReportAConcernReasonDataSource)init
{
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1D00]);
  v4 = [(SKUIReportAConcernReasonDataSource *)self initWithTableView:v3];

  return v4;
}

- (SKUIReportAConcernReasonDataSource)initWithTableView:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SKUIReportAConcernReasonDataSource;
  v6 = [(SKUIReportAConcernReasonDataSource *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_tableView, a3);
    [v5 registerClass:objc_opt_class() forCellReuseIdentifier:@"SKUIConcernReasonCell"];
  }

  return v7;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  v4 = [(SKUIReportAConcernReasonDataSource *)self reasons];
  int64_t v5 = [v4 count];

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(SKUIReportAConcernReasonDataSource *)self reasons];
  uint64_t v9 = [v6 row];

  v10 = [v8 objectAtIndexedSubscript:v9];

  v11 = [v7 dequeueReusableCellWithIdentifier:@"SKUIConcernReasonCell"];

  v12 = [v10 name];
  v13 = [v11 textLabel];
  [v13 setText:v12];

  [v11 setAccessoryType:1];

  return v11;
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
}

- (NSArray)reasons
{
  return self->_reasons;
}

- (void)setReasons:(id)a3
{
}

- (NSString)selectReasonTitle
{
  return self->_selectReasonTitle;
}

- (void)setSelectReasonTitle:(id)a3
{
}

- (NSString)selectReasonSubtitle
{
  return self->_selectReasonSubtitle;
}

- (void)setSelectReasonSubtitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectReasonSubtitle, 0);
  objc_storeStrong((id *)&self->_selectReasonTitle, 0);
  objc_storeStrong((id *)&self->_reasons, 0);

  objc_storeStrong((id *)&self->_tableView, 0);
}

@end