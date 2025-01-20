@interface UAReplayClientController
- (UAReplayClientController)initWithManager:(id)a3;
- (UAUserActivityInfo)item;
- (id)eligibleAdvertiseableItemsInOrder;
- (id)items;
- (id)statusString;
- (id)userActivityInfoForUUID:(id)a3;
- (void)addItem:(id)a3;
- (void)dealloc;
- (void)removeItem:(id)a3;
- (void)setItem:(id)a3;
@end

@implementation UAReplayClientController

- (UAReplayClientController)initWithManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UAReplayClientController;
  return [(UAClientController *)&v4 initWithManager:a3 name:@"ReplayCreator"];
}

- (void)dealloc
{
  v3 = [(UACornerActionManagerHandler *)self manager];
  [v3 scheduleUpdatingAdvertisableItems:0.0];

  v4.receiver = self;
  v4.super_class = (Class)UAReplayClientController;
  [(UAReplayClientController *)&v4 dealloc];
}

- (void)addItem:(id)a3
{
  [(UAReplayClientController *)self setItem:a3];
  id v4 = [(UACornerActionManagerHandler *)self manager];
  [v4 scheduleUpdatingAdvertisableItems];
}

- (void)removeItem:(id)a3
{
  id v10 = a3;
  id v4 = [(UAReplayClientController *)self item];
  v5 = v10;
  if (v4 != v10)
  {
    v6 = [v10 uuid];
    v7 = [(UAReplayClientController *)self item];
    v8 = [v7 uuid];
    unsigned __int8 v9 = [v6 isEqual:v8];

    if (v9) {
      goto LABEL_5;
    }
    [(UAReplayClientController *)self setItem:v10];
    v5 = [(UACornerActionManagerHandler *)self manager];
    [v5 scheduleUpdatingAdvertisableItems:0.0];
  }

LABEL_5:
}

- (id)items
{
  v3 = [(UAReplayClientController *)self item];
  if (v3)
  {
    id v4 = [(UAReplayClientController *)self item];
    v5 = +[NSSet setWithObject:v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)eligibleAdvertiseableItemsInOrder
{
  v3 = [(UAReplayClientController *)self item];
  if (v3)
  {
    id v4 = [(UAReplayClientController *)self item];
    v5 = +[NSArray arrayWithObject:v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)userActivityInfoForUUID:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_5;
  }
  uint64_t v5 = [(UAReplayClientController *)self item];
  if (!v5) {
    goto LABEL_5;
  }
  v6 = (void *)v5;
  v7 = [(UAReplayClientController *)self item];
  v8 = [v7 uuid];
  unsigned int v9 = [v4 isEqual:v8];

  if (v9)
  {
    id v10 = [(UAReplayClientController *)self item];
  }
  else
  {
LABEL_5:
    id v10 = 0;
  }

  return v10;
}

- (id)statusString
{
  v2 = [(UAReplayClientController *)self item];
  v3 = +[NSString stringWithFormat:@"ReplayController: ITEM=%@\n", v2];

  return v3;
}

- (UAUserActivityInfo)item
{
  return (UAUserActivityInfo *)objc_getProperty(self, a2, 48, 1);
}

- (void)setItem:(id)a3
{
}

- (void).cxx_destruct
{
}

@end