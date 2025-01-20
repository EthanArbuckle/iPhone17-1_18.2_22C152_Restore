@interface UAPingClient
- (BOOL)active;
- (BOOL)hasBeenUsedAtLeastOnce;
- (UAPingClient)initWithController:(id)a3;
- (UAPingController)controller;
- (id)eligibleAdvertiseableItemsInOrder;
- (id)items;
- (id)statusString;
- (int64_t)priority;
- (void)pushItem:(id)a3;
- (void)removeItem:(id)a3;
- (void)setHasBeenUsedAtLeastOnce:(BOOL)a3;
@end

@implementation UAPingClient

- (int64_t)priority
{
  return 1000;
}

- (id)items
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = +[NSSet setWithArray:v2->_items];
  objc_sync_exit(v2);

  return v3;
}

- (id)eligibleAdvertiseableItemsInOrder
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = [(NSMutableArray *)v2->_items copy];
  objc_sync_exit(v2);

  return v3;
}

- (UAPingClient)initWithController:(id)a3
{
  id v5 = a3;
  v6 = [v5 manager];
  v11.receiver = self;
  v11.super_class = (Class)UAPingClient;
  v7 = [(UAClientController *)&v11 initWithManager:v6 name:@"PingCreator"];

  if (v7)
  {
    objc_storeStrong((id *)&v7->_controller, a3);
    uint64_t v8 = +[NSMutableArray array];
    items = v7->_items;
    v7->_items = (NSMutableArray *)v8;
  }
  return v7;
}

- (void)pushItem:(id)a3
{
  id v6 = a3;
  v4 = self;
  objc_sync_enter(v4);
  [(UAPingClient *)v4 setHasBeenUsedAtLeastOnce:1];
  if (([(NSMutableArray *)v4->_items containsObject:v6] & 1) == 0)
  {
    [(NSMutableArray *)v4->_items insertObject:v6 atIndex:0];
    id v5 = [(UACornerActionManagerHandler *)v4 manager];
    [v5 scheduleUpdatingAdvertisableItems];
  }
  objc_sync_exit(v4);
}

- (void)removeItem:(id)a3
{
  id v6 = a3;
  v4 = self;
  objc_sync_enter(v4);
  if (v6)
  {
    for (id i = v6; [(NSMutableArray *)v4->_items containsObject:i]; id i = v6)
      [(NSMutableArray *)v4->_items removeObject:v6];
  }
  else
  {
    [(NSMutableArray *)v4->_items removeAllObjects];
  }
  objc_sync_exit(v4);
}

- (BOOL)active
{
  v2 = [(UAPingClient *)self items];
  id v3 = [v2 anyObject];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)statusString
{
  if ([(UAPingClient *)self hasBeenUsedAtLeastOnce])
  {
    id v3 = [(UAPingClient *)self items];
    id v4 = [v3 count];
    if (v4)
    {
      id v5 = [(NSMutableArray *)self->_items firstObject];
    }
    else
    {
      id v5 = @"-";
    }
    id v6 = +[NSString stringWithFormat:@"PingCreator:%@\n", v5];
    if (v4) {
  }
    }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (UAPingController)controller
{
  return (UAPingController *)objc_getProperty(self, a2, 64, 1);
}

- (BOOL)hasBeenUsedAtLeastOnce
{
  return self->_hasBeenUsedAtLeastOnce;
}

- (void)setHasBeenUsedAtLeastOnce:(BOOL)a3
{
  self->_hasBeenUsedAtLeastOnce = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controller, 0);

  objc_storeStrong((id *)&self->_items, 0);
}

@end