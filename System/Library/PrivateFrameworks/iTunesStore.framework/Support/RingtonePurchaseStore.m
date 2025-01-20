@interface RingtonePurchaseStore
- (RingtonePurchaseStore)init;
- (RingtonePurchaseStore)initWithMangedObjectContext:(id)a3;
- (id)ringtonesForAdamID:(unint64_t)a3 transactionID:(id)a4;
- (void)addRingtonesForPurchases:(id)a3;
- (void)dealloc;
- (void)finalizeRingtoneForAdamID:(unint64_t)a3 transactionID:(id)a4 toneIdentifier:(id)a5;
- (void)prunePurchasedRingtones;
- (void)removeRingtoneForAdamID:(unint64_t)a3 transactionID:(id)a4;
- (void)removeRingtonesForPurchases:(id)a3;
- (void)updateRingtonesForPurchases:(id)a3 withDownloads:(id)a4;
@end

@implementation RingtonePurchaseStore

- (RingtonePurchaseStore)init
{
  self->_ownsContext = 1;
  id v3 = +[NSThread beginPrivateManagedContextSession];

  return [(RingtonePurchaseStore *)self initWithMangedObjectContext:v3];
}

- (RingtonePurchaseStore)initWithMangedObjectContext:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)RingtonePurchaseStore;
  v4 = [(RingtonePurchaseStore *)&v6 init];
  if (v4) {
    v4->_context = (NSManagedObjectContext *)a3;
  }
  return v4;
}

- (void)dealloc
{
  if (self->_ownsContext) {
    +[NSThread endPrivateManagedContextSession];
  }

  self->_context = 0;
  v3.receiver = self;
  v3.super_class = (Class)RingtonePurchaseStore;
  [(RingtonePurchaseStore *)&v3 dealloc];
}

- (void)addRingtonesForPurchases:(id)a3
{
  id v5 = +[RingtonePurchase entityFromContext:self->_context];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(a3);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        v10 = [[RingtonePurchase alloc] initWithEntity:v5 insertIntoManagedObjectContext:self->_context];
        [(RingtonePurchase *)v10 loadFromPurchase:v9];
      }
      id v6 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  sub_10004BBA0(self->_context);
}

- (void)finalizeRingtoneForAdamID:(unint64_t)a3 transactionID:(id)a4 toneIdentifier:(id)a5
{
  id v7 = [(RingtonePurchaseStore *)self ringtonesForAdamID:a3 transactionID:a4];
  if ([v7 count])
  {
    id v8 = [v7 objectAtIndex:0];
    [v8 applyUserActionWithToneIdentifier:a5];
    [(NSManagedObjectContext *)self->_context deleteObject:v8];
  }
  sub_10004BBA0(self->_context);
}

- (void)prunePurchasedRingtones
{
  id v3 = objc_alloc_init((Class)NSFetchRequest);
  objc_msgSend(v3, "setEntity:", +[RingtonePurchase entityFromContext:](RingtonePurchase, "entityFromContext:", self->_context));
  [v3 setPredicate:+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", @"transactionID != %@", +[NSNull null](NSNull, "null"))];
  v4 = [(NSManagedObjectContext *)self->_context executeFetchRequest:v3 error:0];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        [(NSManagedObjectContext *)self->_context deleteObject:*(void *)(*((void *)&v8 + 1) + 8 * i)];
      }
      id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  sub_10004BBA0(self->_context);
}

- (void)removeRingtonesForPurchases:(id)a3
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    uint64_t v7 = SSDownloadPropertyStoreItemIdentifier;
    do
    {
      long long v8 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(a3);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v8) valueForDownloadProperty:v7];
        id v9 = [(RingtonePurchaseStore *)self ringtonesForAdamID:SSGetItemIdentifierFromValue() transactionID:0];
        if ([v9 count]) {
          -[NSManagedObjectContext deleteObject:](self->_context, "deleteObject:", [v9 objectAtIndex:0]);
        }
        long long v8 = (char *)v8 + 1;
      }
      while (v5 != v8);
      id v5 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  sub_10004BBA0(self->_context);
  if (v5) {
    objc_exception_rethrow();
  }
}

- (void)removeRingtoneForAdamID:(unint64_t)a3 transactionID:(id)a4
{
  id v5 = [(RingtonePurchaseStore *)self ringtonesForAdamID:a3 transactionID:a4];
  if ([v5 count]) {
    -[NSManagedObjectContext deleteObject:](self->_context, "deleteObject:", [v5 objectAtIndex:0]);
  }
  sub_10004BBA0(self->_context);
}

- (id)ringtonesForAdamID:(unint64_t)a3 transactionID:(id)a4
{
  id v7 = objc_alloc_init((Class)NSFetchRequest);
  objc_msgSend(v7, "setEntity:", +[RingtonePurchase entityFromContext:](RingtonePurchase, "entityFromContext:", self->_context));
  if (!a4) {
    a4 = +[NSNull null];
  }
  [v7 setPredicate:+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", @"adamID = %llu AND transactionID = %@", a3, a4)];
  long long v8 = [(NSManagedObjectContext *)self->_context executeFetchRequest:v7 error:0];

  return v8;
}

- (void)updateRingtonesForPurchases:(id)a3 withDownloads:(id)a4
{
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v5)
  {
    uint64_t v16 = *(void *)v23;
    uint64_t v6 = SSDownloadPropertyStoreItemIdentifier;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v23 != v16) {
          objc_enumerationMutation(a3);
        }
        [*(id *)(*((void *)&v22 + 1) + 8 * i) valueForDownloadProperty:v6];
        id v8 = (id)SSGetItemIdentifierFromValue();
        id v9 = [(RingtonePurchaseStore *)self ringtonesForAdamID:v8 transactionID:0];
        if ([v9 count])
        {
          id v10 = [v9 objectAtIndex:0];
          long long v20 = 0u;
          long long v21 = 0u;
          long long v18 = 0u;
          long long v19 = 0u;
          id v11 = [a4 countByEnumeratingWithState:&v18 objects:v26 count:16];
          if (v11)
          {
            uint64_t v12 = *(void *)v19;
            while (2)
            {
              for (j = 0; j != v11; j = (char *)j + 1)
              {
                if (*(void *)v19 != v12) {
                  objc_enumerationMutation(a4);
                }
                long long v14 = *(void **)(*((void *)&v18 + 1) + 8 * (void)j);
                if ([v14 itemIdentifier] == v8)
                {
                  objc_msgSend(v10, "setTransactionID:", objc_msgSend(v14, "transactionIdentifier"));
                  goto LABEL_17;
                }
              }
              id v11 = [a4 countByEnumeratingWithState:&v18 objects:v26 count:16];
              if (v11) {
                continue;
              }
              break;
            }
          }
        }
LABEL_17:
        ;
      }
      id v5 = [a3 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v5);
  }
  sub_10004BBA0(self->_context);
}

@end