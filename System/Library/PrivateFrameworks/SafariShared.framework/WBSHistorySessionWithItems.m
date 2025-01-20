@interface WBSHistorySessionWithItems
- (NSArray)items;
- (WBSHistorySessionWithItems)init;
- (WBSHistorySessionWithItems)initWithSessionStartDate:(id)a3;
- (WBSHistorySessionWithItems)initWithSessionStartDate:(id)a3 items:(id)a4;
@end

@implementation WBSHistorySessionWithItems

- (WBSHistorySessionWithItems)init
{
  return 0;
}

- (WBSHistorySessionWithItems)initWithSessionStartDate:(id)a3
{
  return 0;
}

- (WBSHistorySessionWithItems)initWithSessionStartDate:(id)a3 items:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)WBSHistorySessionWithItems;
  v7 = [(WBSHistorySession *)&v12 initWithSessionStartDate:a3];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    items = v7->_items;
    v7->_items = (NSArray *)v8;

    v10 = v7;
  }

  return v7;
}

- (NSArray)items
{
  return self->_items;
}

- (void).cxx_destruct
{
}

@end