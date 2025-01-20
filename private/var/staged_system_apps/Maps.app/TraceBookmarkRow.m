@interface TraceBookmarkRow
- (TraceBookmarkRow)initWithName:(id)a3 detail:(id)a4;
- (void)configureCell:(id)a3;
@end

@implementation TraceBookmarkRow

- (TraceBookmarkRow)initWithName:(id)a3 detail:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TraceBookmarkRow;
  v9 = [(TraceBookmarkRow *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    objc_storeStrong((id *)&v10->_detail, a4);
  }

  return v10;
}

- (void)configureCell:(id)a3
{
  detail = self->_detail;
  id v5 = a3;
  v6 = [v5 detailTextLabel];
  [v6 setText:detail];

  name = self->_name;
  id v8 = [v5 textLabel];

  [v8 setText:name];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detail, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end