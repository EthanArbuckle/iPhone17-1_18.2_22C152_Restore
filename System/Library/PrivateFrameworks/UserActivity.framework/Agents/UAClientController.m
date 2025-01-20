@interface UAClientController
- (UAClientController)initWithManager:(id)a3 name:(id)a4;
- (double)intervalToDelaySuspensionOfAdvertisingForItem:(id)a3;
- (id)eligibleAdvertiseableItemsInOrder;
- (id)items;
- (id)recentEligibleItemsInOrder:(double)a3;
- (id)userActivityInfoForUUID:(id)a3;
@end

@implementation UAClientController

- (UAClientController)initWithManager:(id)a3 name:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)UAClientController;
  return [(UACornerActionManagerHandler *)&v5 initWithManager:a3 name:a4];
}

- (id)items
{
  return 0;
}

- (id)userActivityInfoForUUID:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  objc_super v5 = [(UAClientController *)self items];
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = [v9 uuid];
        unsigned __int8 v11 = [v10 isEqual:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)eligibleAdvertiseableItemsInOrder
{
  v3 = [(UAClientController *)self items];
  if (v3)
  {
    id v4 = [(UAClientController *)self items];
    objc_super v5 = [v4 allObjects];
  }
  else
  {
    objc_super v5 = 0;
  }

  return v5;
}

- (id)recentEligibleItemsInOrder:(double)a3
{
  return 0;
}

- (double)intervalToDelaySuspensionOfAdvertisingForItem:(id)a3
{
  return 0.0;
}

@end