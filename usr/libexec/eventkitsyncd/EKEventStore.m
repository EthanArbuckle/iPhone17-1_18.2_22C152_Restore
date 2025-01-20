@interface EKEventStore
+ (id)eks_eventOnlyStoreFor:(id)a3;
+ (id)eks_eventOnlyStoreIgnoringExternalChangesFor:(id)a3 withClientId:(id)a4;
+ (id)eks_eventStoreFor:(id)a3;
+ (int64_t)eks_storeCount;
- (id)eks_sourcesAlwaysIncludingLocal;
@end

@implementation EKEventStore

+ (id)eks_eventOnlyStoreIgnoringExternalChangesFor:(id)a3 withClientId:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [objc_alloc((Class)EKEventStore) initWithEKOptions:132 path:0 changeTrackingClientId:v5 enablePropertyModificationLogging:0 allowDelegateSources:0];

  sub_100068994(v6, v7);

  return v7;
}

+ (id)eks_eventOnlyStoreFor:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)EKEventStore) initWithEKOptions:128];
  sub_100068994(v3, v4);

  return v4;
}

+ (id)eks_eventStoreFor:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)EKChangeTrackingClientId);
  id v5 = +[NEKEnvironment instance];
  id v6 = [v5 clientName];
  id v7 = [v4 initWithCustomClientId:v6];

  id v8 = [objc_alloc((Class)EKEventStore) initWithEKOptions:4 path:0 changeTrackingClientId:v7 enablePropertyModificationLogging:0 allowDelegateSources:0];
  sub_100068994(v3, v8);

  return v8;
}

+ (int64_t)eks_storeCount
{
  v2 = sub_100069224();
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000C6C78);
  id v3 = [v2 keyEnumerator];
  id v4 = [v3 allObjects];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    int v8 = 0;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        v12 = [v2 objectForKey:v11];

        if (v12) {
          ++v8;
        }
        else {
          [v2 removeObjectForKey:v11];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
  else
  {
    int v8 = 0;
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000C6C78);
  return v8;
}

- (id)eks_sourcesAlwaysIncludingLocal
{
  id v3 = [(EKEventStore *)self sources];
  id v4 = [(EKEventStore *)self localSource];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "isEqual:", v4, (void)v13))
        {

          id v10 = v5;
          goto LABEL_11;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  id v10 = [v5 arrayByAddingObject:v4];
LABEL_11:
  uint64_t v11 = v10;

  return v11;
}

@end